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

let rec v_Base_dEq_dEq_uBase_dEq_dEq_uVuna_dCompiler_dLoader_dExportEntry = fun () -> (C_Dict_uBase_dEq_dEq_MkDict_uBase_dEq_dEq ((fun sx -> (fun sy -> (match sx with
  | C_Vuna_dCompiler_dLoader_dExportEntry_Vuna_dCompiler_dLoader_dExportEntry (dtb__0, dtb__1, dtb__2, dtb__3) -> (match sy with
  | C_Vuna_dCompiler_dLoader_dExportEntry_Vuna_dCompiler_dLoader_dExportEntry (dtb__4, dtb__5, dtb__6, dtb__7) -> (if ((bi_eq_str dtb__0) dtb__4) then (if ((bi_eq_str dtb__1) dtb__5) then (if ((bi_eq_str dtb__2) dtb__6) then ((bi_eq_str dtb__3) dtb__7) else false) else false) else false)
  | _ -> ((bi_eq_int 0) 1)
)
  | _ -> failwith "DT: impossible branch"
))), (fun sx -> (fun sy -> (if (((v_Base_dEq_deq (v_Base_dEq_dEq_uBase_dEq_dEq_uVuna_dCompiler_dLoader_dExportEntry ())) sx) sy) then ((bi_eq_int 0) 1) else ((bi_eq_int 1) 1))))))

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

let v_Vuna_dCompiler_dLoader_dmissingModule = (fun name -> (C_Base_dResult_dResult_Base_dResult_dErr (((bi_concat "loader: internal: module ") ((bi_concat name) " is not loaded (import list and module table disagree)")))))

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
  | C_Vuna_dCompiler_dLoader_dModule_Vuna_dCompiler_dLoader_dModule (dtb__151, dtb__152, dtb__153, dtb__154, dtb__155, dtb__156) -> (C_Base_dResult_dResult_Base_dResult_dOk (dtb__155))
  | _ -> failwith "DT: impossible branch"
)
  | C_Base_dMaybe_dMaybe_Base_dMaybe_dNothing -> (v_Vuna_dCompiler_dLoader_dmissingModule name)
  | _ -> failwith "DT: impossible branch"
)))

let v_Vuna_dCompiler_dLoader_dmoduleCtors = (fun modules -> (fun name -> ((v_Base_dResult_dandThen ((v_Vuna_dCompiler_dLoader_dmoduleDecls modules) name)) (fun decls -> (C_Base_dResult_dResult_Base_dResult_dOk ((v_Vuna_dCompiler_dAst_dctorsOf decls)))))))

let v_Vuna_dCompiler_dLoader_dexportsOf = (fun modules -> (fun name -> (match ((v_Vuna_dCompiler_dLoader_dfindModule modules) name) with
  | C_Base_dMaybe_dMaybe_Base_dMaybe_dJust (dtb__157) -> (match dtb__157 with
  | C_Vuna_dCompiler_dLoader_dModule_Vuna_dCompiler_dLoader_dModule (dtb__158, dtb__159, dtb__160, dtb__161, dtb__162, dtb__163) -> (C_Base_dResult_dResult_Base_dResult_dOk (dtb__163))
  | _ -> failwith "DT: impossible branch"
)
  | C_Base_dMaybe_dMaybe_Base_dMaybe_dNothing -> (v_Vuna_dCompiler_dLoader_dmissingModule name)
  | _ -> failwith "DT: impossible branch"
)))

let rec v_Vuna_dCompiler_dLoader_dmodulesExportingValueFrom = (fun modules -> (fun names -> (fun name -> (match names with
  | C_Base_dList_dList_Nil -> (C_Base_dResult_dResult_Base_dResult_dOk (C_Base_dList_dList_Nil))
  | C_Base_dList_dList_Cons (dtb__164, dtb__165) -> ((v_Base_dResult_dandThen ((v_Vuna_dCompiler_dLoader_dexportsOf modules) dtb__164)) (fun es -> (match ((v_Vuna_dCompiler_dLoader_dfindExportValue es) name) with
  | C_Base_dMaybe_dMaybe_Base_dMaybe_dJust (dtb__166) -> ((v_Base_dResult_dandThen (((v_Vuna_dCompiler_dLoader_dmodulesExportingValueFrom modules) dtb__165) name)) (fun more -> (C_Base_dResult_dResult_Base_dResult_dOk ((C_Base_dList_dList_Cons ((C_Base_dPair_dPair_Base_dPair_dPair (dtb__164, dtb__166)), more))))))
  | C_Base_dMaybe_dMaybe_Base_dMaybe_dNothing -> (((v_Vuna_dCompiler_dLoader_dmodulesExportingValueFrom modules) dtb__165) name)
  | _ -> failwith "DT: impossible branch"
)))
  | _ -> failwith "DT: impossible branch"
))))

let v_Vuna_dCompiler_dLoader_dmodulesExportingValue = (fun modules -> (fun imports -> (fun name -> (((v_Vuna_dCompiler_dLoader_dmodulesExportingValueFrom modules) (v_Vuna_dCompiler_dLoader_dopenModuleNames imports)) name))))

let rec v_Vuna_dCompiler_dLoader_dmodulesExportingCtorFrom = (fun modules -> (fun names -> (fun name -> (match names with
  | C_Base_dList_dList_Nil -> (C_Base_dResult_dResult_Base_dResult_dOk (C_Base_dList_dList_Nil))
  | C_Base_dList_dList_Cons (dtb__167, dtb__168) -> ((v_Base_dResult_dandThen ((v_Vuna_dCompiler_dLoader_dexportsOf modules) dtb__167)) (fun es -> (match ((v_Vuna_dCompiler_dLoader_dfindExportCtor es) name) with
  | C_Base_dMaybe_dMaybe_Base_dMaybe_dJust (dtb__169) -> ((v_Base_dResult_dandThen (((v_Vuna_dCompiler_dLoader_dmodulesExportingCtorFrom modules) dtb__168) name)) (fun more -> (C_Base_dResult_dResult_Base_dResult_dOk ((C_Base_dList_dList_Cons ((C_Base_dPair_dPair_Base_dPair_dPair (dtb__167, dtb__169)), more))))))
  | C_Base_dMaybe_dMaybe_Base_dMaybe_dNothing -> (((v_Vuna_dCompiler_dLoader_dmodulesExportingCtorFrom modules) dtb__168) name)
  | _ -> failwith "DT: impossible branch"
)))
  | _ -> failwith "DT: impossible branch"
))))

let v_Vuna_dCompiler_dLoader_dmodulesExportingCtor = (fun modules -> (fun imports -> (fun name -> (((v_Vuna_dCompiler_dLoader_dmodulesExportingCtorFrom modules) (v_Vuna_dCompiler_dLoader_dopenModuleNames imports)) name))))

let rec v_Vuna_dCompiler_dLoader_dmodulesExportingTypeFrom = (fun modules -> (fun names -> (fun name -> (match names with
  | C_Base_dList_dList_Nil -> (C_Base_dResult_dResult_Base_dResult_dOk (C_Base_dList_dList_Nil))
  | C_Base_dList_dList_Cons (dtb__170, dtb__171) -> ((v_Base_dResult_dandThen ((v_Vuna_dCompiler_dLoader_dexportsOf modules) dtb__170)) (fun es -> (match ((v_Vuna_dCompiler_dLoader_dfindExportType es) name) with
  | C_Base_dMaybe_dMaybe_Base_dMaybe_dJust (dtb__172) -> ((v_Base_dResult_dandThen (((v_Vuna_dCompiler_dLoader_dmodulesExportingTypeFrom modules) dtb__171) name)) (fun more -> (C_Base_dResult_dResult_Base_dResult_dOk ((C_Base_dList_dList_Cons ((C_Base_dPair_dPair_Base_dPair_dPair (dtb__170, dtb__172)), more))))))
  | C_Base_dMaybe_dMaybe_Base_dMaybe_dNothing -> (((v_Vuna_dCompiler_dLoader_dmodulesExportingTypeFrom modules) dtb__171) name)
  | _ -> failwith "DT: impossible branch"
)))
  | _ -> failwith "DT: impossible branch"
))))

let v_Vuna_dCompiler_dLoader_dmodulesExportingType = (fun modules -> (fun imports -> (fun name -> (((v_Vuna_dCompiler_dLoader_dmodulesExportingTypeFrom modules) (v_Vuna_dCompiler_dLoader_dopenModuleNames imports)) name))))

let v_Vuna_dCompiler_dLoader_disBuiltinName = (fun name -> (match (v_Vuna_dCompiler_dBuiltins_dbuiltinArity name) with
  | C_Base_dMaybe_dMaybe_Base_dMaybe_dJust (dtb__173) -> true
  | C_Base_dMaybe_dMaybe_Base_dMaybe_dNothing -> false
  | _ -> failwith "DT: impossible branch"
))

let v_Vuna_dCompiler_dLoader_ddtPreludeNames = fun () -> (C_Base_dList_dList_Cons ("Type", (C_Base_dList_dList_Cons ("->", (C_Base_dList_dList_Cons ("_", (C_Base_dList_dList_Cons ("Int", (C_Base_dList_dList_Cons ("String", (C_Base_dList_dList_Cons ("+", (C_Base_dList_dList_Cons ("-", (C_Base_dList_dList_Cons ("*", (C_Base_dList_dList_Cons ("/", (C_Base_dList_dList_Cons ("==", (C_Base_dList_dList_Cons ("/=", (C_Base_dList_dList_Cons ("<", (C_Base_dList_dList_Cons ("<=", (C_Base_dList_dList_Cons (">", (C_Base_dList_dList_Cons (">=", (C_Base_dList_dList_Cons ("++", (C_Base_dList_dList_Cons ("&&", (C_Base_dList_dList_Cons ("||", (C_Base_dList_dList_Cons ("strFromInt", (C_Base_dList_dList_Cons ("strUnpack", (C_Base_dList_dList_Cons ("strPack", (C_Base_dList_dList_Cons ("strLength", C_Base_dList_dList_Nil))))))))))))))))))))))))))))))))))))))))))))

let v_Vuna_dCompiler_dLoader_disDtPreludeName = (fun name -> ((v_Base_dList_dmemName name) (v_Vuna_dCompiler_dLoader_ddtPreludeNames ())))

let v_Vuna_dCompiler_dLoader_dtraitImportHint = (fun name -> (if ((bi_eq_str name) "Show") then " (trait Show is not in scope; add `import Base.Show`)" else (if ((bi_eq_str name) "Eq") then " (trait Eq is not in scope; add `import Base.Eq`)" else (if ((bi_eq_str name) "Ord") then " (trait Ord is not in scope; add `import Base.Ord`)" else (if ((bi_eq_str name) "show") then " (trait method show; add `import Base.Show`)" else (if ((bi_eq_str name) "eq") then " (trait method eq; add `import Base.Eq`)" else (if ((bi_eq_str name) "neq") then " (trait method neq; add `import Base.Eq`)" else (if ((bi_eq_str name) "lt") then " (trait method lt; add `import Base.Ord`)" else (if ((bi_eq_str name) "le") then " (trait method le; add `import Base.Ord`)" else (if ((bi_eq_str name) "gt") then " (trait method gt; add `import Base.Ord`)" else (if ((bi_eq_str name) "ge") then " (trait method ge; add `import Base.Ord`)" else "")))))))))))

let v_Vuna_dCompiler_dLoader_dresolveQualified = (fun modules -> (fun label -> (fun imports -> (fun name -> (match (v_Vuna_dCompiler_dCommon_dsplitLastDot (v_Vuna_dCompiler_dCommon_dsplitOnDot name)) with
  | C_Base_dPair_dPair_Base_dPair_dPair (dtb__174, dtb__175) -> ((fun prefix -> (match ((v_Vuna_dCompiler_dLoader_dfindImportPrefix imports) prefix) with
  | C_Base_dMaybe_dMaybe_Base_dMaybe_dNothing -> (C_Base_dResult_dResult_Base_dResult_dErr (((bi_concat label) ((bi_concat ": module ") ((bi_concat prefix) " is not imported")))))
  | C_Base_dMaybe_dMaybe_Base_dMaybe_dJust (dtb__176) -> (if (v_Vuna_dCompiler_dLoader_disGlobalCtor dtb__175) then (C_Base_dResult_dResult_Base_dResult_dOk (dtb__175)) else ((v_Base_dResult_dandThen ((v_Vuna_dCompiler_dLoader_dexportsOf modules) dtb__176)) (fun es -> (match ((v_Vuna_dCompiler_dLoader_dfindExportValue es) dtb__175) with
  | C_Base_dMaybe_dMaybe_Base_dMaybe_dJust (dtb__177) -> (C_Base_dResult_dResult_Base_dResult_dOk ((v_Vuna_dCompiler_dLoader_dentryTarget dtb__177)))
  | C_Base_dMaybe_dMaybe_Base_dMaybe_dNothing -> (C_Base_dResult_dResult_Base_dResult_dErr (((bi_concat label) ((bi_concat ": ") ((bi_concat dtb__175) ((bi_concat " is not exported by ") dtb__176))))))
  | _ -> failwith "DT: impossible branch"
))))
  | _ -> failwith "DT: impossible branch"
)) (v_Vuna_dCompiler_dCommon_djoinDots dtb__174))
  | _ -> failwith "DT: impossible branch"
)))))

let v_Vuna_dCompiler_dLoader_dresolveQualifiedCtor = (fun modules -> (fun label -> (fun imports -> (fun name -> (match (v_Vuna_dCompiler_dCommon_dsplitLastDot (v_Vuna_dCompiler_dCommon_dsplitOnDot name)) with
  | C_Base_dPair_dPair_Base_dPair_dPair (dtb__178, dtb__179) -> ((fun prefix -> (match ((v_Vuna_dCompiler_dLoader_dfindImportPrefix imports) prefix) with
  | C_Base_dMaybe_dMaybe_Base_dMaybe_dNothing -> (C_Base_dResult_dResult_Base_dResult_dErr (((bi_concat label) ((bi_concat ": module ") ((bi_concat prefix) " is not imported")))))
  | C_Base_dMaybe_dMaybe_Base_dMaybe_dJust (dtb__180) -> (if (v_Vuna_dCompiler_dLoader_disGlobalCtor dtb__179) then (C_Base_dResult_dResult_Base_dResult_dOk (dtb__179)) else ((v_Base_dResult_dandThen ((v_Vuna_dCompiler_dLoader_dexportsOf modules) dtb__180)) (fun es -> (match ((v_Vuna_dCompiler_dLoader_dfindExportCtor es) dtb__179) with
  | C_Base_dMaybe_dMaybe_Base_dMaybe_dJust (dtb__181) -> (C_Base_dResult_dResult_Base_dResult_dOk ((v_Vuna_dCompiler_dLoader_dentryTarget dtb__181)))
  | C_Base_dMaybe_dMaybe_Base_dMaybe_dNothing -> (C_Base_dResult_dResult_Base_dResult_dErr (((bi_concat label) ((bi_concat ": constructor ") ((bi_concat dtb__179) ((bi_concat " is not exported by ") dtb__180))))))
  | _ -> failwith "DT: impossible branch"
))))
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
  | C_Base_dMaybe_dMaybe_Base_dMaybe_dJust (dtb__188) -> ((v_Base_dResult_dandThen ((v_Vuna_dCompiler_dLoader_dexportsOf modules) dtb__188)) (fun es -> ((fun nd_uscrut -> (match nd_uscrut with
  | C_Base_dList_dList_Nil -> (C_Base_dResult_dResult_Base_dResult_dOk (C_Base_dMaybe_dMaybe_Base_dMaybe_dNothing))
  | C_Base_dList_dList_Cons (dtb__189, dtb__190) -> (match dtb__190 with
  | C_Base_dList_dList_Nil -> (if (v_Vuna_dCompiler_dLoader_disGlobalCtor dtb__189) then (C_Base_dResult_dResult_Base_dResult_dOk ((C_Base_dMaybe_dMaybe_Base_dMaybe_dJust ((C_Vuna_dCompiler_dAst_dExpr_Vuna_dCompiler_dAst_dEVar (dtb__189, sp)))))) else (match ((v_Vuna_dCompiler_dLoader_dfindExportValue es) dtb__189) with
  | C_Base_dMaybe_dMaybe_Base_dMaybe_dJust (dtb__191) -> (C_Base_dResult_dResult_Base_dResult_dOk ((C_Base_dMaybe_dMaybe_Base_dMaybe_dJust ((C_Vuna_dCompiler_dAst_dExpr_Vuna_dCompiler_dAst_dEVar ((v_Vuna_dCompiler_dLoader_dentryTarget dtb__191), sp))))))
  | C_Base_dMaybe_dMaybe_Base_dMaybe_dNothing -> (C_Base_dResult_dResult_Base_dResult_dErr (((bi_concat label) ((bi_concat ": ") ((bi_concat dtb__189) ((bi_concat " is not exported by ") dtb__188))))))
  | _ -> failwith "DT: impossible branch"
))
  | _ -> (match ((v_Vuna_dCompiler_dLoader_dfindExportValue es) dtb__189) with
  | C_Base_dMaybe_dMaybe_Base_dMaybe_dJust (dtb__192) -> (C_Base_dResult_dResult_Base_dResult_dOk ((C_Base_dMaybe_dMaybe_Base_dMaybe_dJust ((((v_Vuna_dCompiler_dLoader_dfoldFieldChain (C_Vuna_dCompiler_dAst_dExpr_Vuna_dCompiler_dAst_dEVar ((v_Vuna_dCompiler_dLoader_dentryTarget dtb__192), sp))) dtb__190) sp)))))
  | C_Base_dMaybe_dMaybe_Base_dMaybe_dNothing -> (C_Base_dResult_dResult_Base_dResult_dErr (((bi_concat label) ((bi_concat ": ") ((bi_concat dtb__189) ((bi_concat " is not exported by ") dtb__188))))))
  | _ -> failwith "DT: impossible branch"
)
)
  | _ -> failwith "DT: impossible branch"
)) ((v_Vuna_dCompiler_dLoader_ddropSegs ((bi_sub n) 1)) segs))))
  | C_Base_dMaybe_dMaybe_Base_dMaybe_dNothing -> ((((((v_Vuna_dCompiler_dLoader_dresolveQualifiedPath modules) label) imports) segs) ((bi_sub n) 1)) sp)
  | _ -> failwith "DT: impossible branch"
))))))))

let v_Vuna_dCompiler_dLoader_dresolveCtor = (fun modules -> (fun label -> (fun prefix -> (fun ownCtors -> (fun imports -> (fun name -> (if (v_Vuna_dCompiler_dLoader_disGlobalCtor name) then (C_Base_dResult_dResult_Base_dResult_dOk (name)) else (if (v_Vuna_dCompiler_dCommon_dcontainsDot name) then ((((v_Vuna_dCompiler_dLoader_dresolveQualifiedCtor modules) label) imports) name) else (if ((v_Base_dList_dmemName name) ownCtors) then (C_Base_dResult_dResult_Base_dResult_dOk (((v_Vuna_dCompiler_dLoader_dmangle prefix) name))) else ((v_Base_dResult_dandThen (((v_Vuna_dCompiler_dLoader_dmodulesExportingCtor modules) imports) name)) (fun pairs -> (match pairs with
  | C_Base_dList_dList_Nil -> (C_Base_dResult_dResult_Base_dResult_dErr (((bi_concat label) ((bi_concat ": unknown constructor ") ((bi_concat name) ((v_Vuna_dCompiler_dCommon_dsuggest name) ownCtors))))))
  | _ -> ((v_Base_dResult_dandThen ((((v_Vuna_dCompiler_dLoader_dunifyEntryPairs label) "constructor") name) pairs)) (fun p -> (C_Base_dResult_dResult_Base_dResult_dOk ((v_Vuna_dCompiler_dLoader_dentryTarget (v_Base_dPair_dsecondOf p))))))
))))))))))))

let v_Vuna_dCompiler_dLoader_dcheckBinder = (fun label -> (fun name -> (if (v_Vuna_dCompiler_dCommon_dcontainsDot name) then (C_Base_dResult_dResult_Base_dResult_dErr (((bi_concat label) ((bi_concat ": invalid variable name ") name)))) else (C_Base_dResult_dResult_Base_dResult_dOk (name)))))

let v_Vuna_dCompiler_dLoader_dcheckTopName = (fun label -> (fun name -> (if ((bi_eq_str name) "_") then (C_Base_dResult_dResult_Base_dResult_dErr (((bi_concat label) ": invalid top-level name _ (bare _ is reserved)"))) else (if (v_Vuna_dCompiler_dCommon_dcontainsDot name) then (C_Base_dResult_dResult_Base_dResult_dErr (((bi_concat label) ((bi_concat ": invalid top-level name ") name)))) else (C_Base_dResult_dResult_Base_dResult_dOk (name))))))

let v_Vuna_dCompiler_dLoader_dresolveTopName = (fun label -> (fun prefix -> (fun name -> ((v_Base_dResult_dandThen ((v_Vuna_dCompiler_dLoader_dcheckTopName label) name)) (fun _u -> (C_Base_dResult_dResult_Base_dResult_dOk (((v_Vuna_dCompiler_dLoader_dmangle prefix) name))))))))

let rec v_Vuna_dCompiler_dLoader_dresolvePattern = (fun modules -> (fun label -> (fun prefix -> (fun ownCtors -> (fun imports -> (fun pat -> (match pat with
  | C_Vuna_dCompiler_dAst_dPat_Vuna_dCompiler_dAst_dPWild (dtb__193) -> (C_Base_dResult_dResult_Base_dResult_dOk ((C_Base_dPair_dPair_Base_dPair_dPair ((C_Vuna_dCompiler_dAst_dPat_Vuna_dCompiler_dAst_dPWild (dtb__193)), C_Base_dList_dList_Nil))))
  | C_Vuna_dCompiler_dAst_dPat_Vuna_dCompiler_dAst_dPVar (dtb__194, dtb__195) -> ((v_Base_dResult_dandThen ((v_Vuna_dCompiler_dLoader_dcheckBinder label) dtb__194)) (fun _u -> (C_Base_dResult_dResult_Base_dResult_dOk ((C_Base_dPair_dPair_Base_dPair_dPair ((C_Vuna_dCompiler_dAst_dPat_Vuna_dCompiler_dAst_dPVar (dtb__194, dtb__195)), (C_Base_dList_dList_Cons (dtb__194, C_Base_dList_dList_Nil))))))))
  | C_Vuna_dCompiler_dAst_dPat_Vuna_dCompiler_dAst_dPInt (dtb__196, dtb__197) -> (C_Base_dResult_dResult_Base_dResult_dOk ((C_Base_dPair_dPair_Base_dPair_dPair ((C_Vuna_dCompiler_dAst_dPat_Vuna_dCompiler_dAst_dPInt (dtb__196, dtb__197)), C_Base_dList_dList_Nil))))
  | C_Vuna_dCompiler_dAst_dPat_Vuna_dCompiler_dAst_dPStr (dtb__198, dtb__199) -> (C_Base_dResult_dResult_Base_dResult_dOk ((C_Base_dPair_dPair_Base_dPair_dPair ((C_Vuna_dCompiler_dAst_dPat_Vuna_dCompiler_dAst_dPStr (dtb__198, dtb__199)), C_Base_dList_dList_Nil))))
  | C_Vuna_dCompiler_dAst_dPat_Vuna_dCompiler_dAst_dPCon (dtb__200, dtb__201, dtb__202) -> ((v_Base_dResult_dandThen ((((((v_Vuna_dCompiler_dLoader_dresolveCtor modules) label) prefix) ownCtors) imports) dtb__200)) (fun name2 -> ((v_Base_dResult_dandThen ((v_Base_dResult_dtraverse (((((v_Vuna_dCompiler_dLoader_dresolvePattern modules) label) prefix) ownCtors) imports)) dtb__201)) (fun parts -> (C_Base_dResult_dResult_Base_dResult_dOk ((C_Base_dPair_dPair_Base_dPair_dPair ((C_Vuna_dCompiler_dAst_dPat_Vuna_dCompiler_dAst_dPCon (name2, ((v_Base_dList_dmap v_Base_dPair_dfirstOf) parts), dtb__202)), ((v_Base_dList_dconcatMap v_Base_dPair_dsecondOf) parts)))))))))
  | C_Vuna_dCompiler_dAst_dPat_Vuna_dCompiler_dAst_dPRecord (dtb__203, dtb__204, dtb__205) -> ((v_Base_dResult_dandThen ((((((v_Vuna_dCompiler_dLoader_dresolveCtor modules) label) prefix) ownCtors) imports) dtb__203)) (fun name2 -> ((v_Base_dResult_dandThen ((v_Base_dResult_dtraverse (((((v_Vuna_dCompiler_dLoader_dresolveRecordPatternField modules) label) prefix) ownCtors) imports)) dtb__204)) (fun parts -> (C_Base_dResult_dResult_Base_dResult_dOk ((C_Base_dPair_dPair_Base_dPair_dPair ((C_Vuna_dCompiler_dAst_dPat_Vuna_dCompiler_dAst_dPRecord (name2, ((v_Base_dList_dmap v_Base_dPair_dfirstOf) parts), dtb__205)), ((v_Base_dList_dconcatMap v_Base_dPair_dsecondOf) parts)))))))))
  | _ -> failwith "DT: impossible branch"
)))))))
and v_Vuna_dCompiler_dLoader_dresolveRecordPatternField = (fun mc0 -> (fun mc1 -> (fun mc2 -> (fun mc3 -> (fun mc4 -> (fun mc5 -> (match mc5 with
  | C_Base_dPair_dPair_Base_dPair_dPair (dtb__206, dtb__207) -> ((v_Base_dResult_dandThen ((((((v_Vuna_dCompiler_dLoader_dresolvePattern mc0) mc1) mc2) mc3) mc4) dtb__207)) (fun p -> (match p with
  | C_Base_dPair_dPair_Base_dPair_dPair (dtb__208, dtb__209) -> (C_Base_dResult_dResult_Base_dResult_dOk ((C_Base_dPair_dPair_Base_dPair_dPair ((C_Base_dPair_dPair_Base_dPair_dPair (dtb__206, dtb__208)), dtb__209))))
  | _ -> failwith "DT: impossible branch"
)))
  | _ -> failwith "DT: impossible branch"
)))))))

let rec v_Vuna_dCompiler_dLoader_dcollectRecBinds = (fun mc0 -> (fun mc1 -> (fun mc2 -> (fun mc3 -> (fun mc4 -> (fun mc5 -> (match mc5 with
  | C_Base_dList_dList_Cons (dtb__210, dtb__211) -> (match dtb__210 with
  | C_Base_dPair_dPair_Base_dPair_dPair (dtb__212, dtb__213) -> ((v_Base_dResult_dandThen ((((((v_Vuna_dCompiler_dLoader_dresolvePattern mc0) mc1) mc2) mc3) mc4) dtb__212)) (fun pr -> (match pr with
  | C_Base_dPair_dPair_Base_dPair_dPair (dtb__214, dtb__215) -> ((v_Base_dResult_dandThen ((((((v_Vuna_dCompiler_dLoader_dcollectRecBinds mc0) mc1) mc2) mc3) mc4) dtb__211)) (fun r -> (match r with
  | C_Base_dPair_dPair_Base_dPair_dPair (dtb__216, dtb__217) -> (C_Base_dResult_dResult_Base_dResult_dOk ((C_Base_dPair_dPair_Base_dPair_dPair (((v_Base_dList_dappend dtb__215) dtb__216), (C_Base_dList_dList_Cons ((C_Base_dPair_dPair_Base_dPair_dPair (dtb__214, dtb__213)), dtb__217))))))
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
  | C_Base_dList_dList_Cons (dtb__218, dtb__219) -> (match dtb__218 with
  | C_Vuna_dCompiler_dAst_dDoStmt_Vuna_dCompiler_dAst_dDBind (dtb__220, dtb__221, dtb__222) -> (match dtb__220 with
  | C_Vuna_dCompiler_dAst_dPat_Vuna_dCompiler_dAst_dPWild (dtb__223) -> ((v_Base_dResult_dandThen (v_Vuna_dCompiler_dLoader_ddesugarDo dtb__219)) (fun tail -> (C_Base_dResult_dResult_Base_dResult_dOk ((C_Vuna_dCompiler_dAst_dExpr_Vuna_dCompiler_dAst_dEApp ((C_Vuna_dCompiler_dAst_dExpr_Vuna_dCompiler_dAst_dEVar ("bind", dtb__222)), (C_Base_dList_dList_Cons (dtb__221, (C_Base_dList_dList_Cons ((C_Vuna_dCompiler_dAst_dExpr_Vuna_dCompiler_dAst_dELam ((C_Base_dList_dList_Cons ("vuna_do_ignore", C_Base_dList_dList_Nil)), tail, dtb__222)), C_Base_dList_dList_Nil)))), dtb__222))))))
  | C_Vuna_dCompiler_dAst_dPat_Vuna_dCompiler_dAst_dPVar (dtb__224, dtb__225) -> ((v_Base_dResult_dandThen (v_Vuna_dCompiler_dLoader_ddesugarDo dtb__219)) (fun tail -> (C_Base_dResult_dResult_Base_dResult_dOk ((C_Vuna_dCompiler_dAst_dExpr_Vuna_dCompiler_dAst_dEApp ((C_Vuna_dCompiler_dAst_dExpr_Vuna_dCompiler_dAst_dEVar ("bind", dtb__222)), (C_Base_dList_dList_Cons (dtb__221, (C_Base_dList_dList_Cons ((C_Vuna_dCompiler_dAst_dExpr_Vuna_dCompiler_dAst_dELam ((C_Base_dList_dList_Cons (dtb__224, C_Base_dList_dList_Nil)), tail, dtb__222)), C_Base_dList_dList_Nil)))), dtb__222))))))
  | _ -> (C_Base_dResult_dResult_Base_dResult_dErr ("do bind pattern must be a variable or _"))
)
  | C_Vuna_dCompiler_dAst_dDoStmt_Vuna_dCompiler_dAst_dDExpr (dtb__226, dtb__227) -> (match dtb__219 with
  | C_Base_dList_dList_Nil -> (C_Base_dResult_dResult_Base_dResult_dOk (dtb__226))
  | _ -> ((v_Base_dResult_dandThen (v_Vuna_dCompiler_dLoader_ddesugarDo dtb__219)) (fun tail -> (C_Base_dResult_dResult_Base_dResult_dOk ((C_Vuna_dCompiler_dAst_dExpr_Vuna_dCompiler_dAst_dEApp ((C_Vuna_dCompiler_dAst_dExpr_Vuna_dCompiler_dAst_dEVar ("bind", dtb__227)), (C_Base_dList_dList_Cons (dtb__226, (C_Base_dList_dList_Cons ((C_Vuna_dCompiler_dAst_dExpr_Vuna_dCompiler_dAst_dELam ((C_Base_dList_dList_Cons ("vuna_do_ignore", C_Base_dList_dList_Nil)), tail, dtb__227)), C_Base_dList_dList_Nil)))), dtb__227))))))
)
  | _ -> failwith "DT: impossible branch"
)
  | C_Base_dList_dList_Nil -> (C_Base_dResult_dResult_Base_dResult_dErr ("do block needs at least one statement"))
  | _ -> failwith "DT: impossible branch"
))

let v_Vuna_dCompiler_dLoader_dresolveCtorDecl = (fun label -> (fun prefix -> (fun ctor -> (if (v_Vuna_dCompiler_dLoader_disGlobalCtor ctor) then (C_Base_dResult_dResult_Base_dResult_dOk (ctor)) else ((v_Base_dResult_dandThen ((v_Vuna_dCompiler_dLoader_dcheckTopName label) ctor)) (fun _u -> (C_Base_dResult_dResult_Base_dResult_dOk (((v_Vuna_dCompiler_dLoader_dmangle prefix) ctor)))))))))

let v_Vuna_dCompiler_dLoader_disLowerTypeName = (fun name -> (match (dtp_unpack name) with
  | C_Base_dList_dList_Nil -> false
  | C_Base_dList_dList_Cons (dtb__228, dtb__229) -> (v_Vuna_dCompiler_dLexer_disLowerChar dtb__228)
  | _ -> failwith "DT: impossible branch"
))

let v_Vuna_dCompiler_dLoader_dstartsUpperName = (fun name -> (match (dtp_unpack name) with
  | C_Base_dList_dList_Nil -> false
  | C_Base_dList_dList_Cons (dtb__230, dtb__231) -> (if ((bi_ge_int dtb__230) 65) then ((bi_le_int dtb__230) 90) else false)
  | _ -> failwith "DT: impossible branch"
))

let v_Vuna_dCompiler_dLoader_dresolveTypeName = (fun modules -> (fun label -> (fun prefix -> (fun ownTypes -> (fun imports -> (fun name -> (if ((v_Base_dList_dmemName name) ownTypes) then (C_Base_dResult_dResult_Base_dResult_dOk (((v_Vuna_dCompiler_dLoader_dmangle prefix) name))) else (if (if (if (if (if ((bi_eq_str name) "Int") then true else ((bi_eq_str name) "String")) then true else ((bi_eq_str name) "Bool")) then true else ((bi_eq_str name) "Type")) then true else ((bi_eq_str name) "->")) then (C_Base_dResult_dResult_Base_dResult_dOk (name)) else (if (v_Vuna_dCompiler_dLoader_disLowerTypeName name) then (C_Base_dResult_dResult_Base_dResult_dOk (name)) else (if (v_Vuna_dCompiler_dCommon_dcontainsDot name) then (match (v_Vuna_dCompiler_dCommon_dsplitLastDot (v_Vuna_dCompiler_dCommon_dsplitOnDot name)) with
  | C_Base_dPair_dPair_Base_dPair_dPair (dtb__232, dtb__233) -> ((fun typePrefix -> (match ((v_Vuna_dCompiler_dLoader_dfindImportPrefix imports) typePrefix) with
  | C_Base_dMaybe_dMaybe_Base_dMaybe_dNothing -> (C_Base_dResult_dResult_Base_dResult_dErr (((bi_concat label) ((bi_concat ": module ") ((bi_concat typePrefix) " is not imported")))))
  | C_Base_dMaybe_dMaybe_Base_dMaybe_dJust (dtb__234) -> ((v_Base_dResult_dandThen ((v_Vuna_dCompiler_dLoader_dexportsOf modules) dtb__234)) (fun es -> (match ((v_Vuna_dCompiler_dLoader_dfindExportType es) dtb__233) with
  | C_Base_dMaybe_dMaybe_Base_dMaybe_dJust (dtb__235) -> (C_Base_dResult_dResult_Base_dResult_dOk ((v_Vuna_dCompiler_dLoader_dentryTarget dtb__235)))
  | C_Base_dMaybe_dMaybe_Base_dMaybe_dNothing -> (C_Base_dResult_dResult_Base_dResult_dErr (((bi_concat label) ((bi_concat ": type ") ((bi_concat dtb__233) ((bi_concat " is not exported by ") dtb__234))))))
  | _ -> failwith "DT: impossible branch"
)))
  | _ -> failwith "DT: impossible branch"
)) (v_Vuna_dCompiler_dCommon_djoinDots dtb__232))
  | _ -> failwith "DT: impossible branch"
) else ((v_Base_dResult_dandThen (((v_Vuna_dCompiler_dLoader_dmodulesExportingType modules) imports) name)) (fun pairs -> (match pairs with
  | C_Base_dList_dList_Nil -> (C_Base_dResult_dResult_Base_dResult_dErr (((bi_concat label) ((bi_concat ": unknown type ") ((bi_concat name) (v_Vuna_dCompiler_dLoader_dtraitImportHint name))))))
  | _ -> ((v_Base_dResult_dandThen ((((v_Vuna_dCompiler_dLoader_dunifyEntryPairs label) "type") name) pairs)) (fun p -> (C_Base_dResult_dResult_Base_dResult_dOk ((v_Vuna_dCompiler_dLoader_dentryTarget (v_Base_dPair_dsecondOf p))))))
)))))))))))))

let v_Vuna_dCompiler_dLoader_dresolveTypeTopName = (fun label -> (fun prefix -> (fun name -> ((v_Base_dResult_dandThen ((v_Vuna_dCompiler_dLoader_dcheckTopName label) name)) (fun _u -> (C_Base_dResult_dResult_Base_dResult_dOk (((v_Vuna_dCompiler_dLoader_dmangle prefix) name))))))))

let v_Vuna_dCompiler_dLoader_dresolveInstanceName = (fun mc0 -> (fun mc1 -> (fun mc2 -> (match mc2 with
  | C_Base_dMaybe_dMaybe_Base_dMaybe_dJust (dtb__236) -> ((v_Base_dResult_dandThen (((v_Vuna_dCompiler_dLoader_dresolveTopName mc0) mc1) dtb__236)) (fun n -> (C_Base_dResult_dResult_Base_dResult_dOk ((C_Base_dMaybe_dMaybe_Base_dMaybe_dJust (n))))))
  | C_Base_dMaybe_dMaybe_Base_dMaybe_dNothing -> (C_Base_dResult_dResult_Base_dResult_dOk ((C_Base_dMaybe_dMaybe_Base_dMaybe_dJust (((v_Vuna_dCompiler_dLoader_dmangle mc1) "#default")))))
  | _ -> failwith "DT: impossible branch"
))))

let v_Vuna_dCompiler_dLoader_disPrivateName = (fun name -> ((v_Base_dString_dstartsWith "_") name))

let v_Vuna_dCompiler_dLoader_dprivateExportMsg = (fun prefix -> (fun sp -> (fun name -> ((bi_concat prefix) ((bi_concat ": ") ((bi_concat (v_Vuna_dCompiler_dCommon_dshowSpanLoc sp)) ((bi_concat ": cannot export private name ") ((bi_concat name) " (names starting with _ are module-private)"))))))))

let rec v_Vuna_dCompiler_dLoader_dfindOwnData = (fun name -> (fun decls -> (match decls with
  | C_Base_dList_dList_Nil -> C_Base_dMaybe_dMaybe_Base_dMaybe_dNothing
  | C_Base_dList_dList_Cons (dtb__237, dtb__238) -> (match dtb__237 with
  | C_Vuna_dCompiler_dAst_dDecl_Vuna_dCompiler_dAst_dDData (dtb__239, dtb__240, dtb__241, dtb__242, dtb__243, dtb__244) -> (if ((bi_eq_str dtb__239) name) then (C_Base_dMaybe_dMaybe_Base_dMaybe_dJust ((C_Base_dPair_dPair_Base_dPair_dPair (dtb__239, ((v_Base_dList_dmap v_Vuna_dCompiler_dAst_dctorName) dtb__242))))) else ((v_Vuna_dCompiler_dLoader_dfindOwnData name) dtb__238))
  | C_Vuna_dCompiler_dAst_dDecl_Vuna_dCompiler_dAst_dDRecord (dtb__245, dtb__246, dtb__247, dtb__248, dtb__249) -> (if ((bi_eq_str dtb__245) name) then (C_Base_dMaybe_dMaybe_Base_dMaybe_dJust ((C_Base_dPair_dPair_Base_dPair_dPair (dtb__245, (C_Base_dList_dList_Cons (dtb__245, C_Base_dList_dList_Nil)))))) else ((v_Vuna_dCompiler_dLoader_dfindOwnData name) dtb__238))
  | C_Vuna_dCompiler_dAst_dDecl_Vuna_dCompiler_dAst_dDTrait (dtb__250, dtb__251, dtb__252, dtb__253) -> (if ((bi_eq_str dtb__250) name) then (C_Base_dMaybe_dMaybe_Base_dMaybe_dJust ((C_Base_dPair_dPair_Base_dPair_dPair (dtb__250, ((v_Base_dList_dmap v_Base_dPair_dfirstOf) dtb__252))))) else ((v_Vuna_dCompiler_dLoader_dfindOwnData name) dtb__238))
  | _ -> ((v_Vuna_dCompiler_dLoader_dfindOwnData name) dtb__238)
)
  | _ -> failwith "DT: impossible branch"
)))

let rec v_Vuna_dCompiler_dLoader_dfindOwnFn = (fun name -> (fun decls -> (match decls with
  | C_Base_dList_dList_Nil -> C_Base_dMaybe_dMaybe_Base_dMaybe_dNothing
  | C_Base_dList_dList_Cons (dtb__254, dtb__255) -> (match dtb__254 with
  | C_Vuna_dCompiler_dAst_dDecl_Vuna_dCompiler_dAst_dDFun (dtb__256, dtb__257, dtb__258, dtb__259) -> (if ((bi_eq_str dtb__256) name) then (C_Base_dMaybe_dMaybe_Base_dMaybe_dJust (name)) else ((v_Vuna_dCompiler_dLoader_dfindOwnFn name) dtb__255))
  | C_Vuna_dCompiler_dAst_dDecl_Vuna_dCompiler_dAst_dDSig (dtb__260, dtb__261, dtb__262) -> (if ((bi_eq_str dtb__260) name) then (C_Base_dMaybe_dMaybe_Base_dMaybe_dJust (name)) else ((v_Vuna_dCompiler_dLoader_dfindOwnFn name) dtb__255))
  | _ -> ((v_Vuna_dCompiler_dLoader_dfindOwnFn name) dtb__255)
)
  | _ -> failwith "DT: impossible branch"
)))

let rec v_Vuna_dCompiler_dLoader_dfindCtorNamed = (fun name -> (fun ctors -> (match ctors with
  | C_Base_dList_dList_Nil -> C_Base_dMaybe_dMaybe_Base_dMaybe_dNothing
  | C_Base_dList_dList_Cons (dtb__263, dtb__264) -> (if ((bi_eq_str (v_Vuna_dCompiler_dAst_dctorName dtb__263)) name) then (C_Base_dMaybe_dMaybe_Base_dMaybe_dJust ((v_Vuna_dCompiler_dAst_dctorName dtb__263))) else ((v_Vuna_dCompiler_dLoader_dfindCtorNamed name) dtb__264))
  | _ -> failwith "DT: impossible branch"
)))

let rec v_Vuna_dCompiler_dLoader_dfindMethodNamed = (fun d2732 -> (fun name -> (fun methods -> (match methods with
  | C_Base_dList_dList_Nil -> C_Base_dMaybe_dMaybe_Base_dMaybe_dNothing
  | C_Base_dList_dList_Cons (dtb__265, dtb__266) -> (match dtb__265 with
  | C_Base_dPair_dPair_Base_dPair_dPair (dtb__267, dtb__268) -> (if (((v_Base_dEq_deq d2732) dtb__267) name) then (C_Base_dMaybe_dMaybe_Base_dMaybe_dJust (dtb__267)) else (((v_Vuna_dCompiler_dLoader_dfindMethodNamed d2732) name) dtb__266))
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
))))

let rec v_Vuna_dCompiler_dLoader_dfindOwnInstanceName = (fun name -> (fun decls -> (match decls with
  | C_Base_dList_dList_Nil -> C_Base_dMaybe_dMaybe_Base_dMaybe_dNothing
  | C_Base_dList_dList_Cons (dtb__269, dtb__270) -> (match dtb__269 with
  | C_Vuna_dCompiler_dAst_dDecl_Vuna_dCompiler_dAst_dDInstance (dtb__271, dtb__272, dtb__273, dtb__274, dtb__275) -> (if dtb__272 then ((v_Vuna_dCompiler_dLoader_dfindOwnInstanceName name) dtb__270) else (match dtb__271 with
  | C_Base_dMaybe_dMaybe_Base_dMaybe_dJust (dtb__276) -> (if ((bi_eq_str dtb__276) name) then (C_Base_dMaybe_dMaybe_Base_dMaybe_dJust (dtb__276)) else ((v_Vuna_dCompiler_dLoader_dfindOwnInstanceName name) dtb__270))
  | C_Base_dMaybe_dMaybe_Base_dMaybe_dNothing -> ((v_Vuna_dCompiler_dLoader_dfindOwnInstanceName name) dtb__270)
  | _ -> failwith "DT: impossible branch"
))
  | _ -> ((v_Vuna_dCompiler_dLoader_dfindOwnInstanceName name) dtb__270)
)
  | _ -> failwith "DT: impossible branch"
)))

let rec v_Vuna_dCompiler_dLoader_dfindOwnCtorName = (fun name -> (fun decls -> (match decls with
  | C_Base_dList_dList_Nil -> C_Base_dMaybe_dMaybe_Base_dMaybe_dNothing
  | C_Base_dList_dList_Cons (dtb__277, dtb__278) -> (match dtb__277 with
  | C_Vuna_dCompiler_dAst_dDecl_Vuna_dCompiler_dAst_dDData (dtb__279, dtb__280, dtb__281, dtb__282, dtb__283, dtb__284) -> (match ((v_Vuna_dCompiler_dLoader_dfindCtorNamed name) dtb__282) with
  | C_Base_dMaybe_dMaybe_Base_dMaybe_dJust (dtb__285) -> (C_Base_dMaybe_dMaybe_Base_dMaybe_dJust ((C_Base_dPair_dPair_Base_dPair_dPair (dtb__279, dtb__285))))
  | C_Base_dMaybe_dMaybe_Base_dMaybe_dNothing -> ((v_Vuna_dCompiler_dLoader_dfindOwnCtorName name) dtb__278)
  | _ -> failwith "DT: impossible branch"
)
  | C_Vuna_dCompiler_dAst_dDecl_Vuna_dCompiler_dAst_dDRecord (dtb__286, dtb__287, dtb__288, dtb__289, dtb__290) -> (if ((bi_eq_str dtb__286) name) then (C_Base_dMaybe_dMaybe_Base_dMaybe_dJust ((C_Base_dPair_dPair_Base_dPair_dPair (dtb__286, dtb__286)))) else ((v_Vuna_dCompiler_dLoader_dfindOwnCtorName name) dtb__278))
  | C_Vuna_dCompiler_dAst_dDecl_Vuna_dCompiler_dAst_dDTrait (dtb__291, dtb__292, dtb__293, dtb__294) -> (match (((v_Vuna_dCompiler_dLoader_dfindMethodNamed (v_Base_dEq_dBase_dEq_dEq_uBase_dEq_dEq_uString ())) name) dtb__293) with
  | C_Base_dMaybe_dMaybe_Base_dMaybe_dJust (dtb__295) -> (C_Base_dMaybe_dMaybe_Base_dMaybe_dJust ((C_Base_dPair_dPair_Base_dPair_dPair (dtb__291, dtb__295))))
  | C_Base_dMaybe_dMaybe_Base_dMaybe_dNothing -> ((v_Vuna_dCompiler_dLoader_dfindOwnCtorName name) dtb__278)
  | _ -> failwith "DT: impossible branch"
)
  | _ -> ((v_Vuna_dCompiler_dLoader_dfindOwnCtorName name) dtb__278)
)
  | _ -> failwith "DT: impossible branch"
)))

let rec v_Vuna_dCompiler_dLoader_downCtorEntries = (fun prefix -> (fun dname -> (fun names -> (match names with
  | C_Base_dList_dList_Nil -> C_Base_dList_dList_Nil
  | C_Base_dList_dList_Cons (dtb__296, dtb__297) -> (if (v_Vuna_dCompiler_dLoader_disPrivateName dtb__296) then (((v_Vuna_dCompiler_dLoader_downCtorEntries prefix) dname) dtb__297) else (C_Base_dList_dList_Cons ((C_Vuna_dCompiler_dLoader_dExportEntry_Vuna_dCompiler_dLoader_dExportEntry ("ctor", dtb__296, ((v_Vuna_dCompiler_dLoader_dmangle prefix) dtb__296), ((v_Vuna_dCompiler_dLoader_dmangle prefix) dname))), (((v_Vuna_dCompiler_dLoader_downCtorEntries prefix) dname) dtb__297))))
  | _ -> failwith "DT: impossible branch"
))))

let rec v_Vuna_dCompiler_dLoader_dctorEntriesOfType = (fun typeTarget -> (fun entries -> (match entries with
  | C_Base_dList_dList_Nil -> C_Base_dList_dList_Nil
  | C_Base_dList_dList_Cons (dtb__298, dtb__299) -> (if (if ((bi_eq_str (v_Vuna_dCompiler_dLoader_dentryKind dtb__298)) "ctor") then ((bi_eq_str (v_Vuna_dCompiler_dLoader_dentryParent dtb__298)) typeTarget) else false) then (C_Base_dList_dList_Cons (dtb__298, ((v_Vuna_dCompiler_dLoader_dctorEntriesOfType typeTarget) dtb__299))) else ((v_Vuna_dCompiler_dLoader_dctorEntriesOfType typeTarget) dtb__299))
  | _ -> failwith "DT: impossible branch"
)))

let v_Vuna_dCompiler_dLoader_ddeclImplicitExports = (fun prefix -> (fun d -> (match d with
  | C_Vuna_dCompiler_dAst_dDecl_Vuna_dCompiler_dAst_dDData (dtb__300, dtb__301, dtb__302, dtb__303, dtb__304, dtb__305) -> (if (v_Vuna_dCompiler_dLoader_disPrivateName dtb__300) then C_Base_dList_dList_Nil else (C_Base_dList_dList_Cons ((C_Vuna_dCompiler_dLoader_dExportEntry_Vuna_dCompiler_dLoader_dExportEntry ("type", dtb__300, ((v_Vuna_dCompiler_dLoader_dmangle prefix) dtb__300), "")), (((v_Vuna_dCompiler_dLoader_downCtorEntries prefix) dtb__300) ((v_Base_dList_dmap v_Vuna_dCompiler_dAst_dctorName) dtb__303)))))
  | C_Vuna_dCompiler_dAst_dDecl_Vuna_dCompiler_dAst_dDRecord (dtb__306, dtb__307, dtb__308, dtb__309, dtb__310) -> (if (v_Vuna_dCompiler_dLoader_disPrivateName dtb__306) then C_Base_dList_dList_Nil else (C_Base_dList_dList_Cons ((C_Vuna_dCompiler_dLoader_dExportEntry_Vuna_dCompiler_dLoader_dExportEntry ("type", dtb__306, ((v_Vuna_dCompiler_dLoader_dmangle prefix) dtb__306), "")), (((v_Vuna_dCompiler_dLoader_downCtorEntries prefix) dtb__306) (C_Base_dList_dList_Cons (dtb__306, C_Base_dList_dList_Nil))))))
  | C_Vuna_dCompiler_dAst_dDecl_Vuna_dCompiler_dAst_dDTrait (dtb__311, dtb__312, dtb__313, dtb__314) -> (if (v_Vuna_dCompiler_dLoader_disPrivateName dtb__311) then C_Base_dList_dList_Nil else (C_Base_dList_dList_Cons ((C_Vuna_dCompiler_dLoader_dExportEntry_Vuna_dCompiler_dLoader_dExportEntry ("type", dtb__311, ((v_Vuna_dCompiler_dLoader_dmangle prefix) dtb__311), "")), (((v_Vuna_dCompiler_dLoader_downCtorEntries prefix) dtb__311) ((v_Base_dList_dmap v_Base_dPair_dfirstOf) dtb__313)))))
  | C_Vuna_dCompiler_dAst_dDecl_Vuna_dCompiler_dAst_dDInstance (dtb__315, dtb__316, dtb__317, dtb__318, dtb__319) -> (if dtb__316 then C_Base_dList_dList_Nil else (match dtb__315 with
  | C_Base_dMaybe_dMaybe_Base_dMaybe_dNothing -> C_Base_dList_dList_Nil
  | C_Base_dMaybe_dMaybe_Base_dMaybe_dJust (dtb__320) -> (if (v_Vuna_dCompiler_dLoader_disPrivateName dtb__320) then C_Base_dList_dList_Nil else (C_Base_dList_dList_Cons ((C_Vuna_dCompiler_dLoader_dExportEntry_Vuna_dCompiler_dLoader_dExportEntry ("val", dtb__320, ((v_Vuna_dCompiler_dLoader_dmangle prefix) dtb__320), "")), C_Base_dList_dList_Nil)))
  | _ -> failwith "DT: impossible branch"
))
  | C_Vuna_dCompiler_dAst_dDecl_Vuna_dCompiler_dAst_dDSig (dtb__321, dtb__322, dtb__323) -> (if (v_Vuna_dCompiler_dLoader_disPrivateName dtb__321) then C_Base_dList_dList_Nil else (C_Base_dList_dList_Cons ((C_Vuna_dCompiler_dLoader_dExportEntry_Vuna_dCompiler_dLoader_dExportEntry ("val", dtb__321, ((v_Vuna_dCompiler_dLoader_dmangle prefix) dtb__321), "")), C_Base_dList_dList_Nil)))
  | C_Vuna_dCompiler_dAst_dDecl_Vuna_dCompiler_dAst_dDFun (dtb__324, dtb__325, dtb__326, dtb__327) -> (if (v_Vuna_dCompiler_dLoader_disPrivateName dtb__324) then C_Base_dList_dList_Nil else (C_Base_dList_dList_Cons ((C_Vuna_dCompiler_dLoader_dExportEntry_Vuna_dCompiler_dLoader_dExportEntry ("val", dtb__324, ((v_Vuna_dCompiler_dLoader_dmangle prefix) dtb__324), "")), C_Base_dList_dList_Nil)))
  | _ -> failwith "DT: impossible branch"
)))

let v_Vuna_dCompiler_dLoader_drefKind = (fun mc0 -> (match mc0 with
  | C_Vuna_dCompiler_dLoader_dExportRef_Vuna_dCompiler_dLoader_dExportRef (dtb__328, dtb__329, dtb__330) -> dtb__328
  | _ -> failwith "DT: impossible branch"
))

let v_Vuna_dCompiler_dLoader_drefTarget = (fun mc0 -> (match mc0 with
  | C_Vuna_dCompiler_dLoader_dExportRef_Vuna_dCompiler_dLoader_dExportRef (dtb__331, dtb__332, dtb__333) -> dtb__332
  | _ -> failwith "DT: impossible branch"
))

let rec v_Vuna_dCompiler_dLoader_disRecordDecl = (fun dname -> (fun decls -> (match decls with
  | C_Base_dList_dList_Nil -> false
  | C_Base_dList_dList_Cons (dtb__334, dtb__335) -> (match dtb__334 with
  | C_Vuna_dCompiler_dAst_dDecl_Vuna_dCompiler_dAst_dDRecord (dtb__336, dtb__337, dtb__338, dtb__339, dtb__340) -> (if ((bi_eq_str dtb__336) dname) then true else ((v_Vuna_dCompiler_dLoader_disRecordDecl dname) dtb__335))
  | _ -> ((v_Vuna_dCompiler_dLoader_disRecordDecl dname) dtb__335)
)
  | _ -> failwith "DT: impossible branch"
)))

let v_Vuna_dCompiler_dLoader_disRecordTarget = (fun modules -> (fun decls -> (fun prefix -> (fun target -> (match (v_Vuna_dCompiler_dCommon_dsplitLastDot (v_Vuna_dCompiler_dCommon_dsplitOnDot target)) with
  | C_Base_dPair_dPair_Base_dPair_dPair (dtb__341, dtb__342) -> ((fun m -> (if ((bi_eq_str m) prefix) then ((v_Vuna_dCompiler_dLoader_disRecordDecl dtb__342) decls) else (match ((v_Vuna_dCompiler_dLoader_dfindModule modules) m) with
  | C_Base_dMaybe_dMaybe_Base_dMaybe_dJust (dtb__343) -> (match dtb__343 with
  | C_Vuna_dCompiler_dLoader_dModule_Vuna_dCompiler_dLoader_dModule (dtb__344, dtb__345, dtb__346, dtb__347, dtb__348, dtb__349) -> ((v_Vuna_dCompiler_dLoader_disRecordDecl dtb__342) dtb__348)
  | _ -> failwith "DT: impossible branch"
)
  | C_Base_dMaybe_dMaybe_Base_dMaybe_dNothing -> false
  | _ -> failwith "DT: impossible branch"
))) (v_Vuna_dCompiler_dCommon_djoinDots dtb__341))
  | _ -> failwith "DT: impossible branch"
)))))

let v_Vuna_dCompiler_dLoader_dtypeRefDominates = (fun modules -> (fun decls -> (fun prefix -> (fun tr -> (fun vr -> (match tr with
  | C_Base_dMaybe_dMaybe_Base_dMaybe_dJust (dtb__350) -> (match dtb__350 with
  | C_Vuna_dCompiler_dLoader_dExportRef_Vuna_dCompiler_dLoader_dExportRef (dtb__351, dtb__352, dtb__353) -> (match vr with
  | C_Base_dMaybe_dMaybe_Base_dMaybe_dJust (dtb__354) -> (match dtb__354 with
  | C_Vuna_dCompiler_dLoader_dExportRef_Vuna_dCompiler_dLoader_dExportRef (dtb__355, dtb__356, dtb__357) -> (if (if (if ((bi_eq_str dtb__351) "type") then ((bi_eq_str dtb__355) "ctor") else false) then ((bi_eq_str dtb__352) dtb__356) else false) then ((((v_Vuna_dCompiler_dLoader_disRecordTarget modules) decls) prefix) dtb__352) else false)
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
  | C_Base_dMaybe_dMaybe_Base_dMaybe_dJust (dtb__358) -> (match dtb__358 with
  | C_Vuna_dCompiler_dLoader_dExportRef_Vuna_dCompiler_dLoader_dExportRef (dtb__359, dtb__360, dtb__361) -> (C_Base_dList_dList_Cons ((C_Vuna_dCompiler_dLoader_dExportEntry_Vuna_dCompiler_dLoader_dExportEntry (dtb__359, mc0, dtb__360, dtb__361)), C_Base_dList_dList_Nil))
  | _ -> failwith "DT: impossible branch"
)
  | C_Base_dMaybe_dMaybe_Base_dMaybe_dNothing -> C_Base_dList_dList_Nil
  | _ -> failwith "DT: impossible branch"
)))

let v_Vuna_dCompiler_dLoader_downOrImportedTypeRef = (fun modules -> (fun prefix -> (fun decls -> (fun imports -> (fun name -> (match ((v_Vuna_dCompiler_dLoader_dfindOwnData name) decls) with
  | C_Base_dMaybe_dMaybe_Base_dMaybe_dJust (dtb__362) -> (match dtb__362 with
  | C_Base_dPair_dPair_Base_dPair_dPair (dtb__363, dtb__364) -> (C_Base_dResult_dResult_Base_dResult_dOk ((C_Base_dMaybe_dMaybe_Base_dMaybe_dJust ((C_Vuna_dCompiler_dLoader_dExportRef_Vuna_dCompiler_dLoader_dExportRef ("type", ((v_Vuna_dCompiler_dLoader_dmangle prefix) dtb__363), ""))))))
  | _ -> failwith "DT: impossible branch"
)
  | C_Base_dMaybe_dMaybe_Base_dMaybe_dNothing -> ((v_Base_dResult_dandThen (((v_Vuna_dCompiler_dLoader_dmodulesExportingType modules) imports) name)) (fun pairs -> (match pairs with
  | C_Base_dList_dList_Nil -> (C_Base_dResult_dResult_Base_dResult_dOk (C_Base_dMaybe_dMaybe_Base_dMaybe_dNothing))
  | _ -> ((v_Base_dResult_dandThen ((((v_Vuna_dCompiler_dLoader_dunifyEntryPairs prefix) "type") name) pairs)) (fun p -> (C_Base_dResult_dResult_Base_dResult_dOk ((C_Base_dMaybe_dMaybe_Base_dMaybe_dJust ((C_Vuna_dCompiler_dLoader_dExportRef_Vuna_dCompiler_dLoader_dExportRef ("type", (v_Vuna_dCompiler_dLoader_dentryTarget (v_Base_dPair_dsecondOf p)), ""))))))))
)))
  | _ -> failwith "DT: impossible branch"
))))))

let v_Vuna_dCompiler_dLoader_downOrImportedValueRef2 = (fun modules -> (fun prefix -> (fun decls -> (fun imports -> (fun name -> (match ((v_Vuna_dCompiler_dLoader_dfindOwnCtorName name) decls) with
  | C_Base_dMaybe_dMaybe_Base_dMaybe_dJust (dtb__365) -> (match dtb__365 with
  | C_Base_dPair_dPair_Base_dPair_dPair (dtb__366, dtb__367) -> (C_Base_dResult_dResult_Base_dResult_dOk ((C_Base_dMaybe_dMaybe_Base_dMaybe_dJust ((C_Vuna_dCompiler_dLoader_dExportRef_Vuna_dCompiler_dLoader_dExportRef ("ctor", ((v_Vuna_dCompiler_dLoader_dmangle prefix) dtb__367), ((v_Vuna_dCompiler_dLoader_dmangle prefix) dtb__366)))))))
  | _ -> failwith "DT: impossible branch"
)
  | C_Base_dMaybe_dMaybe_Base_dMaybe_dNothing -> ((v_Base_dResult_dandThen (((v_Vuna_dCompiler_dLoader_dmodulesExportingValue modules) imports) name)) (fun pairs -> (match pairs with
  | C_Base_dList_dList_Nil -> (C_Base_dResult_dResult_Base_dResult_dOk (C_Base_dMaybe_dMaybe_Base_dMaybe_dNothing))
  | _ -> ((v_Base_dResult_dandThen ((((v_Vuna_dCompiler_dLoader_dunifyEntryPairs prefix) "name") name) pairs)) (fun p -> ((fun e -> (C_Base_dResult_dResult_Base_dResult_dOk ((C_Base_dMaybe_dMaybe_Base_dMaybe_dJust ((C_Vuna_dCompiler_dLoader_dExportRef_Vuna_dCompiler_dLoader_dExportRef ((v_Vuna_dCompiler_dLoader_dentryKind e), (v_Vuna_dCompiler_dLoader_dentryTarget e), (v_Vuna_dCompiler_dLoader_dentryParent e)))))))) (v_Base_dPair_dsecondOf p))))
)))
  | _ -> failwith "DT: impossible branch"
))))))

let v_Vuna_dCompiler_dLoader_downOrImportedValueRef = (fun modules -> (fun prefix -> (fun decls -> (fun imports -> (fun name -> (match ((v_Vuna_dCompiler_dLoader_dfindOwnFn name) decls) with
  | C_Base_dMaybe_dMaybe_Base_dMaybe_dJust (dtb__368) -> (C_Base_dResult_dResult_Base_dResult_dOk ((C_Base_dMaybe_dMaybe_Base_dMaybe_dJust ((C_Vuna_dCompiler_dLoader_dExportRef_Vuna_dCompiler_dLoader_dExportRef ("val", ((v_Vuna_dCompiler_dLoader_dmangle prefix) dtb__368), ""))))))
  | C_Base_dMaybe_dMaybe_Base_dMaybe_dNothing -> (match ((v_Vuna_dCompiler_dLoader_dfindOwnInstanceName name) decls) with
  | C_Base_dMaybe_dMaybe_Base_dMaybe_dJust (dtb__369) -> (C_Base_dResult_dResult_Base_dResult_dOk ((C_Base_dMaybe_dMaybe_Base_dMaybe_dJust ((C_Vuna_dCompiler_dLoader_dExportRef_Vuna_dCompiler_dLoader_dExportRef ("val", ((v_Vuna_dCompiler_dLoader_dmangle prefix) dtb__369), ""))))))
  | C_Base_dMaybe_dMaybe_Base_dMaybe_dNothing -> (((((v_Vuna_dCompiler_dLoader_downOrImportedValueRef2 modules) prefix) decls) imports) name)
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
))))))

let v_Vuna_dCompiler_dLoader_dexportSelective = (fun modules -> (fun prefix -> (fun m -> (fun base -> (fun name -> (fun sp -> ((v_Base_dResult_dandThen ((v_Vuna_dCompiler_dLoader_dexportsOf modules) m)) (fun es -> (match ((v_Vuna_dCompiler_dLoader_dfindExportValue es) base) with
  | C_Base_dMaybe_dMaybe_Base_dMaybe_dJust (dtb__370) -> (match ((v_Vuna_dCompiler_dLoader_dfindExportType es) base) with
  | C_Base_dMaybe_dMaybe_Base_dMaybe_dJust (dtb__371) -> (C_Base_dResult_dResult_Base_dResult_dOk ((C_Base_dList_dList_Cons ((C_Vuna_dCompiler_dLoader_dExportEntry_Vuna_dCompiler_dLoader_dExportEntry ((v_Vuna_dCompiler_dLoader_dentryKind dtb__370), base, (v_Vuna_dCompiler_dLoader_dentryTarget dtb__370), (v_Vuna_dCompiler_dLoader_dentryParent dtb__370))), (C_Base_dList_dList_Cons ((C_Vuna_dCompiler_dLoader_dExportEntry_Vuna_dCompiler_dLoader_dExportEntry ("type", base, (v_Vuna_dCompiler_dLoader_dentryTarget dtb__371), "")), C_Base_dList_dList_Nil))))))
  | C_Base_dMaybe_dMaybe_Base_dMaybe_dNothing -> (C_Base_dResult_dResult_Base_dResult_dOk ((C_Base_dList_dList_Cons ((C_Vuna_dCompiler_dLoader_dExportEntry_Vuna_dCompiler_dLoader_dExportEntry ((v_Vuna_dCompiler_dLoader_dentryKind dtb__370), base, (v_Vuna_dCompiler_dLoader_dentryTarget dtb__370), (v_Vuna_dCompiler_dLoader_dentryParent dtb__370))), C_Base_dList_dList_Nil))))
  | _ -> failwith "DT: impossible branch"
)
  | C_Base_dMaybe_dMaybe_Base_dMaybe_dNothing -> (match ((v_Vuna_dCompiler_dLoader_dfindExportType es) base) with
  | C_Base_dMaybe_dMaybe_Base_dMaybe_dJust (dtb__372) -> (C_Base_dResult_dResult_Base_dResult_dOk ((C_Base_dList_dList_Cons ((C_Vuna_dCompiler_dLoader_dExportEntry_Vuna_dCompiler_dLoader_dExportEntry ("type", base, (v_Vuna_dCompiler_dLoader_dentryTarget dtb__372), "")), C_Base_dList_dList_Nil))))
  | C_Base_dMaybe_dMaybe_Base_dMaybe_dNothing -> (C_Base_dResult_dResult_Base_dResult_dErr (((bi_concat prefix) ((bi_concat ": ") ((bi_concat (v_Vuna_dCompiler_dCommon_dshowSpanLoc sp)) ((bi_concat ": cannot export unknown name ") name))))))
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
)))))))))

let v_Vuna_dCompiler_dLoader_dexportBare = (fun modules -> (fun prefix -> (fun decls -> (fun imports -> (fun name -> (fun sp -> (match (v_Vuna_dCompiler_dCommon_dsplitLastDot (v_Vuna_dCompiler_dCommon_dsplitOnDot name)) with
  | C_Base_dPair_dPair_Base_dPair_dPair (dtb__373, dtb__374) -> (match dtb__373 with
  | C_Base_dList_dList_Nil -> (if (v_Vuna_dCompiler_dLoader_disPrivateName name) then (C_Base_dResult_dResult_Base_dResult_dErr ((((v_Vuna_dCompiler_dLoader_dprivateExportMsg prefix) sp) name))) else ((v_Base_dResult_dandThen (((((v_Vuna_dCompiler_dLoader_downOrImportedTypeRef modules) prefix) decls) imports) name)) (fun tr -> ((v_Base_dResult_dandThen (((((v_Vuna_dCompiler_dLoader_downOrImportedValueRef modules) prefix) decls) imports) name)) (fun vr -> (match tr with
  | C_Base_dMaybe_dMaybe_Base_dMaybe_dNothing -> (match vr with
  | C_Base_dMaybe_dMaybe_Base_dMaybe_dNothing -> (C_Base_dResult_dResult_Base_dResult_dErr (((bi_concat prefix) ((bi_concat ": ") ((bi_concat (v_Vuna_dCompiler_dCommon_dshowSpanLoc sp)) ((bi_concat ": cannot export unknown name ") name))))))
  | C_Base_dMaybe_dMaybe_Base_dMaybe_dJust (dtb__375) -> (C_Base_dResult_dResult_Base_dResult_dOk (((v_Vuna_dCompiler_dLoader_drefEntryList name) vr)))
  | _ -> failwith "DT: impossible branch"
)
  | C_Base_dMaybe_dMaybe_Base_dMaybe_dJust (dtb__376) -> (match vr with
  | C_Base_dMaybe_dMaybe_Base_dMaybe_dNothing -> (C_Base_dResult_dResult_Base_dResult_dOk (((v_Vuna_dCompiler_dLoader_drefEntryList name) tr)))
  | C_Base_dMaybe_dMaybe_Base_dMaybe_dJust (dtb__377) -> (if (((((v_Vuna_dCompiler_dLoader_dtypeRefDominates modules) decls) prefix) tr) vr) then (C_Base_dResult_dResult_Base_dResult_dOk (((v_Vuna_dCompiler_dLoader_drefEntryList name) tr))) else (C_Base_dResult_dResult_Base_dResult_dOk (((v_Base_dList_dappend ((v_Vuna_dCompiler_dLoader_drefEntryList name) tr)) ((v_Vuna_dCompiler_dLoader_drefEntryList name) vr)))))
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
))))))
  | _ -> ((fun mprefix -> (match ((v_Vuna_dCompiler_dLoader_dfindImportPrefix imports) mprefix) with
  | C_Base_dMaybe_dMaybe_Base_dMaybe_dNothing -> (C_Base_dResult_dResult_Base_dResult_dErr (((bi_concat prefix) ((bi_concat ": ") ((bi_concat (v_Vuna_dCompiler_dCommon_dshowSpanLoc sp)) ((bi_concat ": module ") ((bi_concat mprefix) " is not imported")))))))
  | C_Base_dMaybe_dMaybe_Base_dMaybe_dJust (dtb__378) -> ((((((v_Vuna_dCompiler_dLoader_dexportSelective modules) prefix) dtb__378) dtb__374) name) sp)
  | _ -> failwith "DT: impossible branch"
)) (v_Vuna_dCompiler_dCommon_djoinDots dtb__373))
)
  | _ -> failwith "DT: impossible branch"
)))))))

let v_Vuna_dCompiler_dLoader_dexportTypeAll = (fun modules -> (fun prefix -> (fun decls -> (fun imports -> (fun name -> (fun sp -> (match (v_Vuna_dCompiler_dCommon_dsplitLastDot (v_Vuna_dCompiler_dCommon_dsplitOnDot name)) with
  | C_Base_dPair_dPair_Base_dPair_dPair (dtb__379, dtb__380) -> (match dtb__379 with
  | C_Base_dList_dList_Nil -> (if (v_Vuna_dCompiler_dLoader_disPrivateName name) then (C_Base_dResult_dResult_Base_dResult_dErr ((((v_Vuna_dCompiler_dLoader_dprivateExportMsg prefix) sp) name))) else (match ((v_Vuna_dCompiler_dLoader_dfindOwnData name) decls) with
  | C_Base_dMaybe_dMaybe_Base_dMaybe_dJust (dtb__381) -> (match dtb__381 with
  | C_Base_dPair_dPair_Base_dPair_dPair (dtb__382, dtb__383) -> (C_Base_dResult_dResult_Base_dResult_dOk ((C_Base_dList_dList_Cons ((C_Vuna_dCompiler_dLoader_dExportEntry_Vuna_dCompiler_dLoader_dExportEntry ("type", name, ((v_Vuna_dCompiler_dLoader_dmangle prefix) dtb__382), "")), (((v_Vuna_dCompiler_dLoader_downCtorEntries prefix) dtb__382) dtb__383)))))
  | _ -> failwith "DT: impossible branch"
)
  | C_Base_dMaybe_dMaybe_Base_dMaybe_dNothing -> ((v_Base_dResult_dandThen (((v_Vuna_dCompiler_dLoader_dmodulesExportingType modules) imports) name)) (fun pairs -> (match pairs with
  | C_Base_dList_dList_Nil -> (C_Base_dResult_dResult_Base_dResult_dErr (((bi_concat prefix) ((bi_concat ": ") ((bi_concat (v_Vuna_dCompiler_dCommon_dshowSpanLoc sp)) ((bi_concat ": cannot export unknown name ") name))))))
  | _ -> ((v_Base_dResult_dandThen ((((v_Vuna_dCompiler_dLoader_dunifyEntryPairs prefix) "type") name) pairs)) (fun p -> ((fun m -> ((fun tgt -> ((v_Base_dResult_dandThen ((v_Vuna_dCompiler_dLoader_dexportsOf modules) m)) (fun es -> (C_Base_dResult_dResult_Base_dResult_dOk ((C_Base_dList_dList_Cons ((C_Vuna_dCompiler_dLoader_dExportEntry_Vuna_dCompiler_dLoader_dExportEntry ("type", name, tgt, "")), ((v_Vuna_dCompiler_dLoader_dctorEntriesOfType tgt) es)))))))) (v_Vuna_dCompiler_dLoader_dentryTarget (v_Base_dPair_dsecondOf p)))) (v_Base_dPair_dfirstOf p))))
)))
  | _ -> failwith "DT: impossible branch"
))
  | _ -> ((fun mprefix -> (match ((v_Vuna_dCompiler_dLoader_dfindImportPrefix imports) mprefix) with
  | C_Base_dMaybe_dMaybe_Base_dMaybe_dNothing -> (C_Base_dResult_dResult_Base_dResult_dErr (((bi_concat prefix) ((bi_concat ": ") ((bi_concat (v_Vuna_dCompiler_dCommon_dshowSpanLoc sp)) ((bi_concat ": module ") ((bi_concat mprefix) " is not imported")))))))
  | C_Base_dMaybe_dMaybe_Base_dMaybe_dJust (dtb__384) -> ((v_Base_dResult_dandThen ((v_Vuna_dCompiler_dLoader_dexportsOf modules) dtb__384)) (fun es -> (match ((v_Vuna_dCompiler_dLoader_dfindExportType es) dtb__380) with
  | C_Base_dMaybe_dMaybe_Base_dMaybe_dJust (dtb__385) -> (C_Base_dResult_dResult_Base_dResult_dOk ((C_Base_dList_dList_Cons ((C_Vuna_dCompiler_dLoader_dExportEntry_Vuna_dCompiler_dLoader_dExportEntry ("type", dtb__380, (v_Vuna_dCompiler_dLoader_dentryTarget dtb__385), "")), ((v_Vuna_dCompiler_dLoader_dctorEntriesOfType (v_Vuna_dCompiler_dLoader_dentryTarget dtb__385)) es)))))
  | C_Base_dMaybe_dMaybe_Base_dMaybe_dNothing -> (C_Base_dResult_dResult_Base_dResult_dErr (((bi_concat prefix) ((bi_concat ": ") ((bi_concat (v_Vuna_dCompiler_dCommon_dshowSpanLoc sp)) ((bi_concat ": type ") ((bi_concat dtb__380) ((bi_concat " is not exported by ") dtb__384))))))))
  | _ -> failwith "DT: impossible branch"
)))
  | _ -> failwith "DT: impossible branch"
)) (v_Vuna_dCompiler_dCommon_djoinDots dtb__379))
)
  | _ -> failwith "DT: impossible branch"
)))))))

let v_Vuna_dCompiler_dLoader_dexportItemEntries = (fun modules -> (fun prefix -> (fun decls -> (fun imports -> (fun item -> (match item with
  | C_Vuna_dCompiler_dAst_dExportItem_Vuna_dCompiler_dAst_dXModule (dtb__386, dtb__387) -> (match ((v_Vuna_dCompiler_dLoader_dfindImportPrefix imports) dtb__386) with
  | C_Base_dMaybe_dMaybe_Base_dMaybe_dNothing -> (C_Base_dResult_dResult_Base_dResult_dErr (((bi_concat prefix) ((bi_concat ": ") ((bi_concat (v_Vuna_dCompiler_dCommon_dshowSpanLoc dtb__387)) ((bi_concat ": module ") ((bi_concat dtb__386) " is not imported")))))))
  | C_Base_dMaybe_dMaybe_Base_dMaybe_dJust (dtb__388) -> ((v_Vuna_dCompiler_dLoader_dexportsOf modules) dtb__388)
  | _ -> failwith "DT: impossible branch"
)
  | C_Vuna_dCompiler_dAst_dExportItem_Vuna_dCompiler_dAst_dXTypeAll (dtb__389, dtb__390) -> ((((((v_Vuna_dCompiler_dLoader_dexportTypeAll modules) prefix) decls) imports) dtb__389) dtb__390)
  | C_Vuna_dCompiler_dAst_dExportItem_Vuna_dCompiler_dAst_dXBare (dtb__391, dtb__392) -> ((((((v_Vuna_dCompiler_dLoader_dexportBare modules) prefix) decls) imports) dtb__391) dtb__392)
  | _ -> failwith "DT: impossible branch"
))))))

let rec v_Vuna_dCompiler_dLoader_dhasSamePublicKind = (fun e -> (fun entries -> (match entries with
  | C_Base_dList_dList_Nil -> false
  | C_Base_dList_dList_Cons (dtb__393, dtb__394) -> (if (if ((bi_eq_str (v_Vuna_dCompiler_dLoader_dentryKind e)) (v_Vuna_dCompiler_dLoader_dentryKind dtb__393)) then ((bi_eq_str (v_Vuna_dCompiler_dLoader_dentryPublic e)) (v_Vuna_dCompiler_dLoader_dentryPublic dtb__393)) else false) then true else ((v_Vuna_dCompiler_dLoader_dhasSamePublicKind e) dtb__394))
  | _ -> failwith "DT: impossible branch"
)))

let rec v_Vuna_dCompiler_dLoader_ddedupeImplicitExports = (fun mc0 -> (match mc0 with
  | C_Base_dList_dList_Cons (dtb__395, dtb__396) -> (if ((v_Vuna_dCompiler_dLoader_dhasSamePublicKind dtb__395) dtb__396) then (v_Vuna_dCompiler_dLoader_ddedupeImplicitExports dtb__396) else (C_Base_dList_dList_Cons (dtb__395, (v_Vuna_dCompiler_dLoader_ddedupeImplicitExports dtb__396))))
  | C_Base_dList_dList_Nil -> C_Base_dList_dList_Nil
  | _ -> failwith "DT: impossible branch"
))

let v_Vuna_dCompiler_dLoader_dimplicitExports = (fun prefix -> (fun decls -> (v_Vuna_dCompiler_dLoader_ddedupeImplicitExports ((v_Base_dList_dconcatMap (v_Vuna_dCompiler_dLoader_ddeclImplicitExports prefix)) decls))))

let rec v_Vuna_dCompiler_dLoader_dhasConflictingExport = (fun e -> (fun entries -> (match entries with
  | C_Base_dList_dList_Nil -> false
  | C_Base_dList_dList_Cons (dtb__397, dtb__398) -> (if (if (if ((bi_eq_str (v_Vuna_dCompiler_dLoader_dentryKind e)) (v_Vuna_dCompiler_dLoader_dentryKind dtb__397)) then ((bi_eq_str (v_Vuna_dCompiler_dLoader_dentryPublic e)) (v_Vuna_dCompiler_dLoader_dentryPublic dtb__397)) else false) then ((bi_neq_str (v_Vuna_dCompiler_dLoader_dentryTarget e)) (v_Vuna_dCompiler_dLoader_dentryTarget dtb__397)) else false) then true else ((v_Vuna_dCompiler_dLoader_dhasConflictingExport e) dtb__398))
  | _ -> failwith "DT: impossible branch"
)))

let v_Vuna_dCompiler_dLoader_dsameExportEntry = (fun e -> (fun e2 -> (if (if (if ((bi_eq_str (v_Vuna_dCompiler_dLoader_dentryKind e)) (v_Vuna_dCompiler_dLoader_dentryKind e2)) then ((bi_eq_str (v_Vuna_dCompiler_dLoader_dentryPublic e)) (v_Vuna_dCompiler_dLoader_dentryPublic e2)) else false) then ((bi_eq_str (v_Vuna_dCompiler_dLoader_dentryTarget e)) (v_Vuna_dCompiler_dLoader_dentryTarget e2)) else false) then ((bi_eq_str (v_Vuna_dCompiler_dLoader_dentryParent e)) (v_Vuna_dCompiler_dLoader_dentryParent e2)) else false)))

let rec v_Vuna_dCompiler_dLoader_dmemExportEntries = (fun e -> (fun entries -> (match entries with
  | C_Base_dList_dList_Nil -> false
  | C_Base_dList_dList_Cons (dtb__399, dtb__400) -> (if ((v_Vuna_dCompiler_dLoader_dsameExportEntry e) dtb__399) then true else ((v_Vuna_dCompiler_dLoader_dmemExportEntries e) dtb__400))
  | _ -> failwith "DT: impossible branch"
)))

let rec v_Vuna_dCompiler_dLoader_ddedupeExportEntries = (fun mc0 -> (match mc0 with
  | C_Base_dList_dList_Cons (dtb__401, dtb__402) -> (if ((v_Vuna_dCompiler_dLoader_dmemExportEntries dtb__401) dtb__402) then (v_Vuna_dCompiler_dLoader_ddedupeExportEntries dtb__402) else (C_Base_dList_dList_Cons (dtb__401, (v_Vuna_dCompiler_dLoader_ddedupeExportEntries dtb__402))))
  | C_Base_dList_dList_Nil -> C_Base_dList_dList_Nil
  | _ -> failwith "DT: impossible branch"
))

let rec v_Vuna_dCompiler_dLoader_dcheckExportDuplicates = (fun mc0 -> (fun mc1 -> (match mc1 with
  | C_Base_dList_dList_Cons (dtb__403, dtb__404) -> (if ((v_Vuna_dCompiler_dLoader_dhasConflictingExport dtb__403) dtb__404) then (C_Base_dResult_dResult_Base_dResult_dErr (((bi_concat mc0) ((bi_concat ": duplicate export ") (v_Vuna_dCompiler_dLoader_dentryPublic dtb__403))))) else ((v_Vuna_dCompiler_dLoader_dcheckExportDuplicates mc0) dtb__404))
  | C_Base_dList_dList_Nil -> (C_Base_dResult_dResult_Base_dResult_dOk (C_Base_dList_dList_Nil))
  | _ -> failwith "DT: impossible branch"
)))

let v_Vuna_dCompiler_dLoader_dexportItemKey = (fun item -> (match item with
  | C_Vuna_dCompiler_dAst_dExportItem_Vuna_dCompiler_dAst_dXBare (dtb__405, dtb__406) -> ((bi_concat "bare:") dtb__405)
  | C_Vuna_dCompiler_dAst_dExportItem_Vuna_dCompiler_dAst_dXTypeAll (dtb__407, dtb__408) -> ((bi_concat "typeall:") dtb__407)
  | C_Vuna_dCompiler_dAst_dExportItem_Vuna_dCompiler_dAst_dXModule (dtb__409, dtb__410) -> ((bi_concat "module:") dtb__409)
  | _ -> failwith "DT: impossible branch"
))

let rec v_Vuna_dCompiler_dLoader_dmemExportItemKey = (fun key -> (fun items -> (match items with
  | C_Base_dList_dList_Nil -> false
  | C_Base_dList_dList_Cons (dtb__411, dtb__412) -> (if ((bi_eq_str (v_Vuna_dCompiler_dLoader_dexportItemKey dtb__411)) key) then true else ((v_Vuna_dCompiler_dLoader_dmemExportItemKey key) dtb__412))
  | _ -> failwith "DT: impossible branch"
)))

let v_Vuna_dCompiler_dLoader_dexportItemName = (fun item -> (match item with
  | C_Vuna_dCompiler_dAst_dExportItem_Vuna_dCompiler_dAst_dXBare (dtb__413, dtb__414) -> dtb__413
  | C_Vuna_dCompiler_dAst_dExportItem_Vuna_dCompiler_dAst_dXTypeAll (dtb__415, dtb__416) -> dtb__415
  | C_Vuna_dCompiler_dAst_dExportItem_Vuna_dCompiler_dAst_dXModule (dtb__417, dtb__418) -> dtb__417
  | _ -> failwith "DT: impossible branch"
))

let rec v_Vuna_dCompiler_dLoader_dduplicateExportItem = (fun mc0 -> (match mc0 with
  | C_Base_dList_dList_Cons (dtb__419, dtb__420) -> (if ((v_Vuna_dCompiler_dLoader_dmemExportItemKey (v_Vuna_dCompiler_dLoader_dexportItemKey dtb__419)) dtb__420) then (C_Base_dMaybe_dMaybe_Base_dMaybe_dJust ((v_Vuna_dCompiler_dLoader_dexportItemName dtb__419))) else (v_Vuna_dCompiler_dLoader_dduplicateExportItem dtb__420))
  | C_Base_dList_dList_Nil -> C_Base_dMaybe_dMaybe_Base_dMaybe_dNothing
  | _ -> failwith "DT: impossible branch"
))

let rec v_Vuna_dCompiler_dLoader_dcheckExportItemDuplicates = (fun mc0 -> (fun mc1 -> (match mc1 with
  | C_Base_dList_dList_Cons (dtb__421, dtb__422) -> (match (v_Vuna_dCompiler_dLoader_dduplicateExportItem (C_Base_dList_dList_Cons (dtb__421, dtb__422))) with
  | C_Base_dMaybe_dMaybe_Base_dMaybe_dJust (dtb__423) -> (C_Base_dResult_dResult_Base_dResult_dErr (((bi_concat mc0) ((bi_concat ": duplicate export ") dtb__423))))
  | C_Base_dMaybe_dMaybe_Base_dMaybe_dNothing -> ((v_Vuna_dCompiler_dLoader_dcheckExportItemDuplicates mc0) dtb__422)
  | _ -> failwith "DT: impossible branch"
)
  | C_Base_dList_dList_Nil -> (C_Base_dResult_dResult_Base_dResult_dOk (0))
  | _ -> failwith "DT: impossible branch"
)))

let rec v_Vuna_dCompiler_dLoader_dexplicitExports = (fun mc0 -> (fun mc1 -> (fun mc2 -> (fun mc3 -> (fun mc4 -> (match mc4 with
  | C_Base_dList_dList_Cons (dtb__424, dtb__425) -> ((v_Base_dResult_dandThen ((v_Vuna_dCompiler_dLoader_dcheckExportItemDuplicates mc1) (C_Base_dList_dList_Cons (dtb__424, dtb__425)))) (fun _u -> ((v_Base_dResult_dandThen (((((v_Vuna_dCompiler_dLoader_dexportItemEntries mc0) mc1) mc2) mc3) dtb__424)) (fun es -> ((v_Base_dResult_dandThen (((((v_Vuna_dCompiler_dLoader_dexplicitExports mc0) mc1) mc2) mc3) dtb__425)) (fun tail -> (C_Base_dResult_dResult_Base_dResult_dOk ((v_Vuna_dCompiler_dLoader_ddedupeExportEntries ((v_Base_dList_dappend es) tail))))))))))
  | C_Base_dList_dList_Nil -> (C_Base_dResult_dResult_Base_dResult_dOk (C_Base_dList_dList_Nil))
  | _ -> failwith "DT: impossible branch"
))))))

let v_Vuna_dCompiler_dLoader_dvalidateModuleHeader = (fun label -> (fun hdr -> (match hdr with
  | C_Base_dMaybe_dMaybe_Base_dMaybe_dNothing -> (C_Base_dResult_dResult_Base_dResult_dOk (C_Base_dList_dList_Nil))
  | C_Base_dMaybe_dMaybe_Base_dMaybe_dJust (dtb__426) -> (match dtb__426 with
  | C_Vuna_dCompiler_dAst_dModDecl_Vuna_dCompiler_dAst_dModDecl (dtb__427, dtb__428, dtb__429, dtb__430) -> (if ((bi_eq_str dtb__427) label) then (C_Base_dResult_dResult_Base_dResult_dOk (C_Base_dList_dList_Nil)) else (C_Base_dResult_dResult_Base_dResult_dErr (((bi_concat label) ((bi_concat ": ") ((bi_concat (v_Vuna_dCompiler_dCommon_dshowSpanLoc dtb__430)) ((bi_concat ": module name mismatch: source declares ") dtb__427)))))))
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
)))

let v_Vuna_dCompiler_dLoader_dcomputeExports = (fun modules -> (fun prefix -> (fun hdr -> (fun imports -> (fun decls -> (match hdr with
  | C_Base_dMaybe_dMaybe_Base_dMaybe_dNothing -> (C_Base_dResult_dResult_Base_dResult_dOk (((v_Vuna_dCompiler_dLoader_dimplicitExports prefix) decls)))
  | C_Base_dMaybe_dMaybe_Base_dMaybe_dJust (dtb__431) -> (match dtb__431 with
  | C_Vuna_dCompiler_dAst_dModDecl_Vuna_dCompiler_dAst_dModDecl (dtb__432, dtb__433, dtb__434, dtb__435) -> (if dtb__433 then ((v_Base_dResult_dandThen (((((v_Vuna_dCompiler_dLoader_dexplicitExports modules) prefix) decls) imports) dtb__434)) (fun es -> ((v_Base_dResult_dandThen ((v_Vuna_dCompiler_dLoader_dcheckExportDuplicates prefix) es)) (fun _u -> (C_Base_dResult_dResult_Base_dResult_dOk (es)))))) else (C_Base_dResult_dResult_Base_dResult_dOk (((v_Vuna_dCompiler_dLoader_dimplicitExports prefix) decls))))
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
))))))

let v_Vuna_dCompiler_dLoader_dshowCycle = (fun name -> (fun stack -> (v_Vuna_dCompiler_dCommon_djoinArrows (v_Base_dList_dreverse (C_Base_dList_dList_Cons (name, stack))))))

let v_Vuna_dCompiler_dLoader_dimplicitPreludeDeps = (fun importerPkg -> (fun deps -> (match deps with
  | C_Base_dList_dList_Nil -> (C_Base_dResult_dResult_Base_dResult_dOk (C_Base_dList_dList_Nil))
  | C_Base_dList_dList_Cons (dtb__436, dtb__437) -> (match dtb__437 with
  | C_Base_dList_dList_Nil -> (C_Base_dResult_dResult_Base_dResult_dOk ((C_Base_dList_dList_Cons ((C_Vuna_dCompiler_dAst_dImport_Vuna_dCompiler_dAst_dImport ("Prelude", false, C_Base_dMaybe_dMaybe_Base_dMaybe_dNothing, (C_Vuna_dCompiler_dCommon_dSpan_Vuna_dCompiler_dCommon_dSpan ("", 0, 0, 0, 0)))), C_Base_dList_dList_Nil))))
  | _ -> (C_Base_dResult_dResult_Base_dResult_dErr (((bi_concat "ambiguous implicit Prelude (found in: ") ((bi_concat (v_Vuna_dCompiler_dCommon_djoinArrows ((v_Base_dList_dmap (fun c -> (v_Vuna_dCompiler_dPkg_drootName (v_Base_dPair_dsecondOf c)))) deps))) ")"))))
)
  | _ -> (C_Base_dResult_dResult_Base_dResult_dErr (((bi_concat "ambiguous implicit Prelude (found in: ") ((bi_concat (v_Vuna_dCompiler_dCommon_djoinArrows ((v_Base_dList_dmap (fun c -> (v_Vuna_dCompiler_dPkg_drootName (v_Base_dPair_dsecondOf c)))) deps))) ")"))))
)))

let v_Vuna_dCompiler_dLoader_dimplicitPreludeFrom = (fun roots -> (fun importerPkg -> (match (((((v_Vuna_dCompiler_dLoader_dcollectModuleFiles roots) "Prelude") importerPkg) C_Base_dList_dList_Nil) C_Base_dList_dList_Nil) with
  | C_Base_dPair_dPair_Base_dPair_dPair (dtb__438, dtb__439) -> ((v_Vuna_dCompiler_dLoader_dimplicitPreludeDeps importerPkg) ((v_Base_dList_dfilter (fun c -> ((bi_neq_str (v_Vuna_dCompiler_dPkg_drootName (v_Base_dPair_dsecondOf c))) importerPkg))) dtb__438))
  | _ -> failwith "DT: impossible branch"
)))

let v_Vuna_dCompiler_dLoader_dimplicitPrelude = (fun roots -> (fun importerPkg -> (fun currentName -> (fun imports -> (if ((bi_eq_str importerPkg) "") then (C_Base_dResult_dResult_Base_dResult_dOk (C_Base_dList_dList_Nil)) else (if ((bi_eq_str currentName) "Prelude") then (C_Base_dResult_dResult_Base_dResult_dOk (C_Base_dList_dList_Nil)) else (if ((v_Base_dList_dmemName "Prelude") (v_Vuna_dCompiler_dLoader_dimportModuleNames imports)) then (C_Base_dResult_dResult_Base_dResult_dOk (C_Base_dList_dList_Nil)) else ((v_Vuna_dCompiler_dLoader_dimplicitPreludeFrom roots) importerPkg))))))))

let rec v_Vuna_dCompiler_dLoader_dloadAll = (fun roots -> (fun importerPkg -> (fun modules -> (fun stack -> (fun imports -> (match imports with
  | C_Base_dList_dList_Nil -> (C_Base_dResult_dResult_Base_dResult_dOk (modules))
  | C_Base_dList_dList_Cons (dtb__440, dtb__441) -> ((v_Base_dResult_dandThen (((((v_Vuna_dCompiler_dLoader_dloadModule roots) importerPkg) modules) stack) (v_Vuna_dCompiler_dLoader_dimportName dtb__440))) (fun modules2 -> (((((v_Vuna_dCompiler_dLoader_dloadAll roots) importerPkg) modules2) stack) dtb__441)))
  | _ -> failwith "DT: impossible branch"
))))))
and v_Vuna_dCompiler_dLoader_dloadModule = (fun roots -> (fun importerPkg -> (fun modules -> (fun stack -> (fun name -> (match ((v_Vuna_dCompiler_dLoader_dfindModule modules) name) with
  | C_Base_dMaybe_dMaybe_Base_dMaybe_dJust (dtb__442) -> (C_Base_dResult_dResult_Base_dResult_dOk (modules))
  | C_Base_dMaybe_dMaybe_Base_dMaybe_dNothing -> (if ((v_Base_dList_dmemName name) stack) then (C_Base_dResult_dResult_Base_dResult_dErr (((bi_concat "import cycle: ") ((v_Vuna_dCompiler_dLoader_dshowCycle name) stack)))) else (if (v_Vuna_dCompiler_dLoader_dvalidModuleName name) then ((v_Base_dResult_dandThen (((v_Vuna_dCompiler_dLoader_dfindModuleFile roots) name) importerPkg)) (fun found -> ((fun path -> ((fun root -> ((v_Base_dResult_dandThen ((v_Vuna_dCompiler_dParser_dparseSource path) (dtp_readFile path))) (fun src -> (match src with
  | C_Vuna_dCompiler_dAst_dSourceFile_Vuna_dCompiler_dAst_dSource (dtb__443, dtb__444, dtb__445) -> ((v_Base_dResult_dandThen ((v_Vuna_dCompiler_dLoader_dvalidateModuleHeader name) dtb__443)) (fun _u -> ((v_Base_dResult_dandThen ((v_Vuna_dCompiler_dLoader_dvalidateImports name) dtb__444)) (fun _u -> ((v_Base_dResult_dandThen ((((v_Vuna_dCompiler_dLoader_dimplicitPrelude roots) (v_Vuna_dCompiler_dPkg_drootName root)) name) dtb__444)) (fun implicit -> ((v_Base_dResult_dandThen (((((v_Vuna_dCompiler_dLoader_dloadAll roots) (v_Vuna_dCompiler_dPkg_drootName root)) modules) (C_Base_dList_dList_Cons (name, stack))) ((v_Base_dList_dappend dtb__444) implicit))) (fun modules2 -> ((v_Base_dResult_dandThen (((((v_Vuna_dCompiler_dLoader_dcomputeExports modules2) name) dtb__443) dtb__444) dtb__445)) (fun exports -> (C_Base_dResult_dResult_Base_dResult_dOk ((C_Base_dList_dList_Cons ((C_Vuna_dCompiler_dLoader_dModule_Vuna_dCompiler_dLoader_dModule (name, (v_Vuna_dCompiler_dPkg_drootName root), dtb__444, implicit, dtb__445, exports)), modules2))))))))))))))
  | _ -> failwith "DT: impossible branch"
)))) (v_Base_dPair_dsecondOf found))) (v_Base_dPair_dfirstOf found)))) else (C_Base_dResult_dResult_Base_dResult_dErr (((bi_concat "invalid module name: ") name)))))
  | _ -> failwith "DT: impossible branch"
))))))

let v_Vuna_dCompiler_dLoader_dloadProject = (fun roots -> (fun entryPkg -> (fun entry -> (if (dtp_fileExists entry) then ((v_Base_dResult_dandThen ((v_Vuna_dCompiler_dParser_dparseSource entry) (dtp_readFile entry))) (fun src -> (match src with
  | C_Vuna_dCompiler_dAst_dSourceFile_Vuna_dCompiler_dAst_dSource (dtb__446, dtb__447, dtb__448) -> (match dtb__446 with
  | C_Base_dMaybe_dMaybe_Base_dMaybe_dJust (dtb__449) -> (match dtb__449 with
  | C_Vuna_dCompiler_dAst_dModDecl_Vuna_dCompiler_dAst_dModDecl (dtb__450, dtb__451, dtb__452, dtb__453) -> (C_Base_dResult_dResult_Base_dResult_dErr (((bi_concat "module header is not allowed in entry file (") ((bi_concat entry) ")"))))
  | _ -> failwith "DT: impossible branch"
)
  | C_Base_dMaybe_dMaybe_Base_dMaybe_dNothing -> ((v_Base_dResult_dandThen ((v_Vuna_dCompiler_dLoader_dvalidateImports "<entry>") dtb__447)) (fun _u -> ((v_Base_dResult_dandThen ((((v_Vuna_dCompiler_dLoader_dimplicitPrelude roots) entryPkg) "") dtb__447)) (fun implicit -> ((v_Base_dResult_dandThen (((((v_Vuna_dCompiler_dLoader_dloadAll roots) entryPkg) C_Base_dList_dList_Nil) C_Base_dList_dList_Nil) ((v_Base_dList_dappend dtb__447) implicit))) (fun modules -> (C_Base_dResult_dResult_Base_dResult_dOk ((C_Vuna_dCompiler_dLoader_dProject_Vuna_dCompiler_dLoader_dProject (dtb__448, dtb__447, implicit, modules, entryPkg))))))))))
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
))) else (C_Base_dResult_dResult_Base_dResult_dErr (((bi_concat "entry file not found: ") entry)))))))

let v_Vuna_dCompiler_dLoader_dloadProjectModules = (fun roots -> (fun entryPkg -> (fun names -> ((fun entryImports -> ((v_Base_dResult_dandThen (((((v_Vuna_dCompiler_dLoader_dloadAll roots) entryPkg) C_Base_dList_dList_Nil) C_Base_dList_dList_Nil) entryImports)) (fun modules -> (C_Base_dResult_dResult_Base_dResult_dOk ((C_Vuna_dCompiler_dLoader_dProject_Vuna_dCompiler_dLoader_dProject (C_Base_dList_dList_Nil, C_Base_dList_dList_Nil, C_Base_dList_dList_Nil, modules, entryPkg))))))) ((v_Base_dList_dmap (fun n -> (C_Vuna_dCompiler_dAst_dImport_Vuna_dCompiler_dAst_dImport (n, false, C_Base_dMaybe_dMaybe_Base_dMaybe_dNothing, (C_Vuna_dCompiler_dCommon_dSpan_Vuna_dCompiler_dCommon_dSpan ("", 0, 0, 0, 0)))))) names)))))

let v_Vuna_dCompiler_dLoader_dpackageAllowsEffects = (fun pkg -> (if (if ((bi_eq_str pkg) "vuna") then true else ((bi_eq_str pkg) "vuna-compiler")) then true else ((bi_eq_str pkg) "vuna-base")))

let v_Vuna_dCompiler_dLoader_disEffectfulBuiltin = (fun name -> (if (if (if (if (if (if (if (if (if (if (if (if (if (if (if (if (if (if (if (if (if (if (if (if (if (if ((bi_eq_str name) "print") then true else ((bi_eq_str name) "readFile")) then true else ((bi_eq_str name) "writeFile")) then true else ((bi_eq_str name) "getArgs")) then true else ((bi_eq_str name) "readLine")) then true else ((bi_eq_str name) "readDir")) then true else ((bi_eq_str name) "isDirectory")) then true else ((bi_eq_str name) "makeDir")) then true else ((bi_eq_str name) "removeFile")) then true else ((bi_eq_str name) "fileExists")) then true else ((bi_eq_str name) "fileMtime")) then true else ((bi_eq_str name) "fileSize")) then true else ((bi_eq_str name) "exit")) then true else ((bi_eq_str name) "prim_print")) then true else ((bi_eq_str name) "prim_readFile")) then true else ((bi_eq_str name) "prim_writeFile")) then true else ((bi_eq_str name) "prim_getArgs")) then true else ((bi_eq_str name) "prim_readLine")) then true else ((bi_eq_str name) "prim_readDir")) then true else ((bi_eq_str name) "prim_isDirectory")) then true else ((bi_eq_str name) "prim_makeDir")) then true else ((bi_eq_str name) "prim_removeFile")) then true else ((bi_eq_str name) "prim_fileExists")) then true else ((bi_eq_str name) "prim_fileMtime")) then true else ((bi_eq_str name) "prim_fileSize")) then true else ((bi_eq_str name) "prim_exit")) then true else ((bi_eq_str name) "prim_runIn")))

let v_Vuna_dCompiler_dLoader_dresolveGlobal = (fun modules -> (fun label -> (fun prefix -> (fun own -> (fun imports -> (fun scope -> (fun name -> (if ((v_Base_dList_dmemName name) scope) then (C_Base_dResult_dResult_Base_dResult_dOk (name)) else (if (v_Vuna_dCompiler_dLoader_disGlobalCtor name) then (C_Base_dResult_dResult_Base_dResult_dOk (name)) else (if (v_Vuna_dCompiler_dCommon_dcontainsDot name) then ((((v_Vuna_dCompiler_dLoader_dresolveQualified modules) label) imports) name) else (if ((v_Base_dList_dmemName name) own) then (C_Base_dResult_dResult_Base_dResult_dOk (((v_Vuna_dCompiler_dLoader_dmangle prefix) name))) else (if (v_Vuna_dCompiler_dLoader_disEffectfulBuiltin name) then ((v_Base_dResult_dandThen (((v_Vuna_dCompiler_dLoader_dmodulesExportingValue modules) imports) name)) (fun pairs -> (match pairs with
  | C_Base_dList_dList_Nil -> (C_Base_dResult_dResult_Base_dResult_dOk (name))
  | _ -> ((v_Base_dResult_dandThen ((((v_Vuna_dCompiler_dLoader_dunifyEntryPairs label) "name") name) pairs)) (fun p -> (C_Base_dResult_dResult_Base_dResult_dOk ((v_Vuna_dCompiler_dLoader_dentryTarget (v_Base_dPair_dsecondOf p))))))
))) else (if (v_Vuna_dCompiler_dLoader_disBuiltinName name) then (C_Base_dResult_dResult_Base_dResult_dOk (name)) else (if (v_Vuna_dCompiler_dLoader_disDtPreludeName name) then (C_Base_dResult_dResult_Base_dResult_dOk (name)) else ((v_Base_dResult_dandThen (((v_Vuna_dCompiler_dLoader_dmodulesExportingValue modules) imports) name)) (fun pairs -> (match pairs with
  | C_Base_dList_dList_Nil -> (C_Base_dResult_dResult_Base_dResult_dErr (((bi_concat label) ((bi_concat ": unbound variable ") ((bi_concat name) ((bi_concat ((v_Vuna_dCompiler_dCommon_dsuggest name) ((v_Base_dList_dappend own) scope))) (v_Vuna_dCompiler_dLoader_dtraitImportHint name)))))))
  | _ -> ((v_Base_dResult_dandThen ((((v_Vuna_dCompiler_dLoader_dunifyEntryPairs label) "name") name) pairs)) (fun p -> (C_Base_dResult_dResult_Base_dResult_dOk ((v_Vuna_dCompiler_dLoader_dentryTarget (v_Base_dPair_dsecondOf p))))))
)))))))))))))))))

let v_Vuna_dCompiler_dLoader_dresolveDottedExpr = (fun modules -> (fun label -> (fun prefix -> (fun own -> (fun imports -> (fun scope -> (fun name -> (fun sp -> (match (v_Vuna_dCompiler_dCommon_dsplitOnDot name) with
  | C_Base_dList_dList_Nil -> (C_Base_dResult_dResult_Base_dResult_dErr (((bi_concat label) ((bi_concat ": invalid dotted name ") name))))
  | C_Base_dList_dList_Cons (dtb__454, dtb__455) -> (if ((v_Base_dList_dmemName dtb__454) scope) then (C_Base_dResult_dResult_Base_dResult_dOk ((((v_Vuna_dCompiler_dLoader_dfoldFieldChain (C_Vuna_dCompiler_dAst_dExpr_Vuna_dCompiler_dAst_dEVar (dtb__454, sp))) dtb__455) sp))) else ((v_Base_dResult_dandThen ((((((v_Vuna_dCompiler_dLoader_dresolveQualifiedPath modules) label) imports) (v_Vuna_dCompiler_dCommon_dsplitOnDot name)) (v_Base_dList_dlength (v_Vuna_dCompiler_dCommon_dsplitOnDot name))) sp)) (fun q -> (match q with
  | C_Base_dMaybe_dMaybe_Base_dMaybe_dJust (dtb__456) -> (C_Base_dResult_dResult_Base_dResult_dOk (dtb__456))
  | C_Base_dMaybe_dMaybe_Base_dMaybe_dNothing -> (if ((v_Base_dList_dmemName dtb__454) own) then (C_Base_dResult_dResult_Base_dResult_dOk ((((v_Vuna_dCompiler_dLoader_dfoldFieldChain (C_Vuna_dCompiler_dAst_dExpr_Vuna_dCompiler_dAst_dEVar (((v_Vuna_dCompiler_dLoader_dmangle prefix) dtb__454), sp))) dtb__455) sp))) else (if (v_Vuna_dCompiler_dLoader_disBuiltinName dtb__454) then (C_Base_dResult_dResult_Base_dResult_dOk ((((v_Vuna_dCompiler_dLoader_dfoldFieldChain (C_Vuna_dCompiler_dAst_dExpr_Vuna_dCompiler_dAst_dEVar (dtb__454, sp))) dtb__455) sp))) else (if (v_Vuna_dCompiler_dLoader_dstartsUpperName dtb__454) then (C_Base_dResult_dResult_Base_dResult_dErr (((bi_concat label) ((bi_concat ": module ") ((bi_concat dtb__454) " is not imported"))))) else ((v_Base_dResult_dandThen (((((((v_Vuna_dCompiler_dLoader_dresolveGlobal modules) label) prefix) own) imports) scope) dtb__454)) (fun n -> (C_Base_dResult_dResult_Base_dResult_dOk ((((v_Vuna_dCompiler_dLoader_dfoldFieldChain (C_Vuna_dCompiler_dAst_dExpr_Vuna_dCompiler_dAst_dEVar (n, sp))) dtb__455) sp))))))))
  | _ -> failwith "DT: impossible branch"
))))
  | _ -> failwith "DT: impossible branch"
)))))))))

let rec v_Vuna_dCompiler_dLoader_dresolveAlt = (fun mc0 -> (fun mc1 -> (fun mc2 -> (fun mc3 -> (fun mc4 -> (fun mc5 -> (fun mc6 -> (fun mc7 -> (match mc7 with
  | C_Base_dPair_dPair_Base_dPair_dPair (dtb__457, dtb__458) -> ((v_Base_dResult_dandThen ((((((v_Vuna_dCompiler_dLoader_dresolvePattern mc0) mc1) mc2) mc4) mc5) dtb__457)) (fun p -> (match p with
  | C_Base_dPair_dPair_Base_dPair_dPair (dtb__459, dtb__460) -> ((v_Base_dResult_dandThen ((((((((v_Vuna_dCompiler_dLoader_dresolveExpr mc0) mc1) mc2) mc3) mc4) mc5) ((v_Base_dList_dappend dtb__460) mc6)) dtb__458)) (fun body2 -> (C_Base_dResult_dResult_Base_dResult_dOk ((C_Base_dPair_dPair_Base_dPair_dPair (dtb__459, body2))))))
  | _ -> failwith "DT: impossible branch"
)))
  | _ -> failwith "DT: impossible branch"
)))))))))
and v_Vuna_dCompiler_dLoader_dresolveLet = (fun modules -> (fun label -> (fun prefix -> (fun own -> (fun ownCtors -> (fun imports -> (fun scope -> (fun rec_u -> (fun binds -> (fun body -> (if rec_u then (((((((((v_Vuna_dCompiler_dLoader_dresolveRecLet modules) label) prefix) own) ownCtors) imports) scope) binds) body) else (((((((((v_Vuna_dCompiler_dLoader_dresolveLetSeq modules) label) prefix) own) ownCtors) imports) scope) binds) body))))))))))))
and v_Vuna_dCompiler_dLoader_dresolveLetSeq = (fun modules -> (fun label -> (fun prefix -> (fun own -> (fun ownCtors -> (fun imports -> (fun scope -> (fun binds -> (fun body -> (match binds with
  | C_Base_dList_dList_Nil -> ((v_Base_dResult_dandThen ((((((((v_Vuna_dCompiler_dLoader_dresolveExpr modules) label) prefix) own) ownCtors) imports) scope) body)) (fun b -> (C_Base_dResult_dResult_Base_dResult_dOk ((C_Base_dPair_dPair_Base_dPair_dPair (C_Base_dList_dList_Nil, b))))))
  | C_Base_dList_dList_Cons (dtb__461, dtb__462) -> (match dtb__461 with
  | C_Base_dPair_dPair_Base_dPair_dPair (dtb__463, dtb__464) -> ((v_Base_dResult_dandThen ((((((((v_Vuna_dCompiler_dLoader_dresolveExpr modules) label) prefix) own) ownCtors) imports) scope) dtb__464)) (fun value2 -> ((v_Base_dResult_dandThen ((((((v_Vuna_dCompiler_dLoader_dresolvePattern modules) label) prefix) ownCtors) imports) dtb__463)) (fun p -> (match p with
  | C_Base_dPair_dPair_Base_dPair_dPair (dtb__465, dtb__466) -> ((v_Base_dResult_dandThen (((((((((v_Vuna_dCompiler_dLoader_dresolveLetSeq modules) label) prefix) own) ownCtors) imports) ((v_Base_dList_dappend dtb__466) scope)) dtb__462) body)) (fun r -> (match r with
  | C_Base_dPair_dPair_Base_dPair_dPair (dtb__467, dtb__468) -> (C_Base_dResult_dResult_Base_dResult_dOk ((C_Base_dPair_dPair_Base_dPair_dPair ((C_Base_dList_dList_Cons ((C_Base_dPair_dPair_Base_dPair_dPair (dtb__465, value2)), dtb__467)), dtb__468))))
  | _ -> failwith "DT: impossible branch"
)))
  | _ -> failwith "DT: impossible branch"
)))))
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
))))))))))
and v_Vuna_dCompiler_dLoader_dresolveRecLet = (fun modules -> (fun label -> (fun prefix -> (fun own -> (fun ownCtors -> (fun imports -> (fun scope -> (fun binds -> (fun body -> (match ((((((v_Vuna_dCompiler_dLoader_dcollectRecBinds modules) label) prefix) ownCtors) imports) binds) with
  | C_Base_dResult_dResult_Base_dResult_dErr (dtb__469) -> (C_Base_dResult_dResult_Base_dResult_dErr (dtb__469))
  | C_Base_dResult_dResult_Base_dResult_dOk (dtb__470) -> (match dtb__470 with
  | C_Base_dPair_dPair_Base_dPair_dPair (dtb__471, dtb__472) -> ((fun scope2 -> ((v_Base_dResult_dandThen ((((((((v_Vuna_dCompiler_dLoader_dresolveRecValues modules) label) prefix) own) ownCtors) imports) scope2) dtb__472)) (fun values2 -> ((v_Base_dResult_dandThen ((((((((v_Vuna_dCompiler_dLoader_dresolveExpr modules) label) prefix) own) ownCtors) imports) scope2) body)) (fun b -> (C_Base_dResult_dResult_Base_dResult_dOk ((C_Base_dPair_dPair_Base_dPair_dPair (values2, b))))))))) ((v_Base_dList_dappend dtb__471) scope))
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
))))))))))
and v_Vuna_dCompiler_dLoader_dresolveRecValues = (fun mc0 -> (fun mc1 -> (fun mc2 -> (fun mc3 -> (fun mc4 -> (fun mc5 -> (fun mc6 -> (fun mc7 -> (match mc7 with
  | C_Base_dList_dList_Cons (dtb__473, dtb__474) -> (match dtb__473 with
  | C_Base_dPair_dPair_Base_dPair_dPair (dtb__475, dtb__476) -> ((v_Base_dResult_dandThen ((((((((v_Vuna_dCompiler_dLoader_dresolveExpr mc0) mc1) mc2) mc3) mc4) mc5) mc6) dtb__476)) (fun value2 -> ((v_Base_dResult_dandThen ((((((((v_Vuna_dCompiler_dLoader_dresolveRecValues mc0) mc1) mc2) mc3) mc4) mc5) mc6) dtb__474)) (fun tail -> (C_Base_dResult_dResult_Base_dResult_dOk ((C_Base_dList_dList_Cons ((C_Base_dPair_dPair_Base_dPair_dPair (dtb__475, value2)), tail))))))))
  | _ -> failwith "DT: impossible branch"
)
  | C_Base_dList_dList_Nil -> (C_Base_dResult_dResult_Base_dResult_dOk (C_Base_dList_dList_Nil))
  | _ -> failwith "DT: impossible branch"
)))))))))
and v_Vuna_dCompiler_dLoader_dresolveExpr = (fun modules -> (fun label -> (fun prefix -> (fun own -> (fun ownCtors -> (fun imports -> (fun scope -> (fun expr -> (match expr with
  | C_Vuna_dCompiler_dAst_dExpr_Vuna_dCompiler_dAst_dEVar (dtb__477, dtb__478) -> (if (v_Vuna_dCompiler_dCommon_dcontainsDot dtb__477) then ((((((((v_Vuna_dCompiler_dLoader_dresolveDottedExpr modules) label) prefix) own) imports) scope) dtb__477) dtb__478) else ((v_Base_dResult_dandThen (((((((v_Vuna_dCompiler_dLoader_dresolveGlobal modules) label) prefix) own) imports) scope) dtb__477)) (fun n -> (C_Base_dResult_dResult_Base_dResult_dOk ((C_Vuna_dCompiler_dAst_dExpr_Vuna_dCompiler_dAst_dEVar (n, dtb__478)))))))
  | C_Vuna_dCompiler_dAst_dExpr_Vuna_dCompiler_dAst_dEInt (dtb__479, dtb__480) -> (C_Base_dResult_dResult_Base_dResult_dOk ((C_Vuna_dCompiler_dAst_dExpr_Vuna_dCompiler_dAst_dEInt (dtb__479, dtb__480))))
  | C_Vuna_dCompiler_dAst_dExpr_Vuna_dCompiler_dAst_dEStr (dtb__481, dtb__482) -> (C_Base_dResult_dResult_Base_dResult_dOk ((C_Vuna_dCompiler_dAst_dExpr_Vuna_dCompiler_dAst_dEStr (dtb__481, dtb__482))))
  | C_Vuna_dCompiler_dAst_dExpr_Vuna_dCompiler_dAst_dELam (dtb__483, dtb__484, dtb__485) -> ((v_Base_dResult_dandThen ((v_Base_dResult_dtraverse (v_Vuna_dCompiler_dLoader_dcheckBinder label)) dtb__483)) (fun _u -> ((v_Base_dResult_dandThen ((((((((v_Vuna_dCompiler_dLoader_dresolveExpr modules) label) prefix) own) ownCtors) imports) ((v_Base_dList_dappend dtb__483) scope)) dtb__484)) (fun b -> (C_Base_dResult_dResult_Base_dResult_dOk ((C_Vuna_dCompiler_dAst_dExpr_Vuna_dCompiler_dAst_dELam (dtb__483, b, dtb__485))))))))
  | C_Vuna_dCompiler_dAst_dExpr_Vuna_dCompiler_dAst_dEApp (dtb__486, dtb__487, dtb__488) -> ((v_Base_dResult_dandThen ((((((((v_Vuna_dCompiler_dLoader_dresolveExpr modules) label) prefix) own) ownCtors) imports) scope) dtb__486)) (fun fn2 -> ((v_Base_dResult_dandThen ((v_Base_dResult_dtraverse (fun a -> ((((((((v_Vuna_dCompiler_dLoader_dresolveExpr modules) label) prefix) own) ownCtors) imports) scope) a))) dtb__487)) (fun args2 -> (C_Base_dResult_dResult_Base_dResult_dOk ((C_Vuna_dCompiler_dAst_dExpr_Vuna_dCompiler_dAst_dEApp (fn2, args2, dtb__488))))))))
  | C_Vuna_dCompiler_dAst_dExpr_Vuna_dCompiler_dAst_dEPi (dtb__489, dtb__490, dtb__491, dtb__492, dtb__493) -> ((v_Base_dResult_dandThen ((((((((v_Vuna_dCompiler_dLoader_dresolveExpr modules) label) prefix) own) ownCtors) imports) scope) dtb__491)) (fun dom2 -> ((v_Base_dResult_dandThen ((((((((v_Vuna_dCompiler_dLoader_dresolveExpr modules) label) prefix) own) ownCtors) imports) ((v_Base_dList_dappend (C_Base_dList_dList_Cons (dtb__489, C_Base_dList_dList_Nil))) scope)) dtb__492)) (fun cod2 -> (C_Base_dResult_dResult_Base_dResult_dOk ((C_Vuna_dCompiler_dAst_dExpr_Vuna_dCompiler_dAst_dEPi (dtb__489, dtb__490, dom2, cod2, dtb__493))))))))
  | C_Vuna_dCompiler_dAst_dExpr_Vuna_dCompiler_dAst_dELet (dtb__494, dtb__495, dtb__496, dtb__497) -> ((v_Base_dResult_dandThen ((((((((((v_Vuna_dCompiler_dLoader_dresolveLet modules) label) prefix) own) ownCtors) imports) scope) dtb__496) dtb__494) dtb__495)) (fun r -> (match r with
  | C_Base_dPair_dPair_Base_dPair_dPair (dtb__498, dtb__499) -> (C_Base_dResult_dResult_Base_dResult_dOk ((C_Vuna_dCompiler_dAst_dExpr_Vuna_dCompiler_dAst_dELet (dtb__498, dtb__499, dtb__496, dtb__497))))
  | _ -> failwith "DT: impossible branch"
)))
  | C_Vuna_dCompiler_dAst_dExpr_Vuna_dCompiler_dAst_dECase (dtb__500, dtb__501, dtb__502) -> ((v_Base_dResult_dandThen ((((((((v_Vuna_dCompiler_dLoader_dresolveExpr modules) label) prefix) own) ownCtors) imports) scope) dtb__500)) (fun scrut2 -> ((v_Base_dResult_dandThen ((v_Base_dResult_dtraverse (((((((v_Vuna_dCompiler_dLoader_dresolveAlt modules) label) prefix) own) ownCtors) imports) scope)) dtb__501)) (fun alts2 -> (C_Base_dResult_dResult_Base_dResult_dOk ((C_Vuna_dCompiler_dAst_dExpr_Vuna_dCompiler_dAst_dECase (scrut2, alts2, dtb__502))))))))
  | C_Vuna_dCompiler_dAst_dExpr_Vuna_dCompiler_dAst_dEIf (dtb__503, dtb__504, dtb__505, dtb__506) -> ((v_Base_dResult_dandThen ((((((((v_Vuna_dCompiler_dLoader_dresolveExpr modules) label) prefix) own) ownCtors) imports) scope) dtb__503)) (fun c2 -> ((v_Base_dResult_dandThen ((((((((v_Vuna_dCompiler_dLoader_dresolveExpr modules) label) prefix) own) ownCtors) imports) scope) dtb__504)) (fun t2 -> ((v_Base_dResult_dandThen ((((((((v_Vuna_dCompiler_dLoader_dresolveExpr modules) label) prefix) own) ownCtors) imports) scope) dtb__505)) (fun e2 -> (C_Base_dResult_dResult_Base_dResult_dOk ((C_Vuna_dCompiler_dAst_dExpr_Vuna_dCompiler_dAst_dEIf (c2, t2, e2, dtb__506))))))))))
  | C_Vuna_dCompiler_dAst_dExpr_Vuna_dCompiler_dAst_dEField (dtb__507, dtb__508, dtb__509) -> ((v_Base_dResult_dandThen ((((((((v_Vuna_dCompiler_dLoader_dresolveExpr modules) label) prefix) own) ownCtors) imports) scope) dtb__507)) (fun b -> (C_Base_dResult_dResult_Base_dResult_dOk ((C_Vuna_dCompiler_dAst_dExpr_Vuna_dCompiler_dAst_dEField (b, dtb__508, dtb__509))))))
  | C_Vuna_dCompiler_dAst_dExpr_Vuna_dCompiler_dAst_dERecord (dtb__510, dtb__511, dtb__512) -> ((v_Base_dResult_dandThen ((((((v_Vuna_dCompiler_dLoader_dresolveCtor modules) label) prefix) ownCtors) imports) dtb__510)) (fun name2 -> ((v_Base_dResult_dandThen ((v_Base_dResult_dtraverse (((((((v_Vuna_dCompiler_dLoader_dresolveFieldValue modules) label) prefix) own) ownCtors) imports) scope)) dtb__511)) (fun fs -> (C_Base_dResult_dResult_Base_dResult_dOk ((C_Vuna_dCompiler_dAst_dExpr_Vuna_dCompiler_dAst_dERecord (name2, fs, dtb__512))))))))
  | C_Vuna_dCompiler_dAst_dExpr_Vuna_dCompiler_dAst_dERecUpdate (dtb__513, dtb__514, dtb__515) -> ((v_Base_dResult_dandThen ((((((((v_Vuna_dCompiler_dLoader_dresolveExpr modules) label) prefix) own) ownCtors) imports) scope) dtb__513)) (fun b -> ((v_Base_dResult_dandThen ((v_Base_dResult_dtraverse (((((((v_Vuna_dCompiler_dLoader_dresolveFieldValue modules) label) prefix) own) ownCtors) imports) scope)) dtb__514)) (fun fs -> (C_Base_dResult_dResult_Base_dResult_dOk ((C_Vuna_dCompiler_dAst_dExpr_Vuna_dCompiler_dAst_dERecUpdate (b, fs, dtb__515))))))))
  | C_Vuna_dCompiler_dAst_dExpr_Vuna_dCompiler_dAst_dEInstSel (dtb__516, dtb__517, dtb__518) -> ((v_Base_dResult_dandThen ((((((((v_Vuna_dCompiler_dLoader_dresolveExpr modules) label) prefix) own) ownCtors) imports) scope) dtb__516)) (fun m2 -> (match (((((((v_Vuna_dCompiler_dLoader_dresolveGlobal modules) label) prefix) own) imports) scope) dtb__517) with
  | C_Base_dResult_dResult_Base_dResult_dErr (dtb__519) -> (C_Base_dResult_dResult_Base_dResult_dErr (((bi_concat label) ((bi_concat ": unknown instance name ") ((bi_concat dtb__517) ((bi_concat " (@") ((bi_concat dtb__517) ")")))))))
  | C_Base_dResult_dResult_Base_dResult_dOk (dtb__520) -> (C_Base_dResult_dResult_Base_dResult_dOk ((C_Vuna_dCompiler_dAst_dExpr_Vuna_dCompiler_dAst_dEInstSel (m2, dtb__520, dtb__518))))
  | _ -> failwith "DT: impossible branch"
)))
  | C_Vuna_dCompiler_dAst_dExpr_Vuna_dCompiler_dAst_dEDo (dtb__521, dtb__522) -> ((v_Base_dResult_dandThen (v_Vuna_dCompiler_dLoader_ddesugarDo dtb__521)) (fun e -> ((((((((v_Vuna_dCompiler_dLoader_dresolveExpr modules) label) prefix) own) ownCtors) imports) scope) e)))
  | C_Vuna_dCompiler_dAst_dExpr_Vuna_dCompiler_dAst_dEAnn (dtb__523, dtb__524, dtb__525) -> ((v_Base_dResult_dandThen ((((((((v_Vuna_dCompiler_dLoader_dresolveExpr modules) label) prefix) own) ownCtors) imports) scope) dtb__523)) (fun v2 -> ((v_Base_dResult_dandThen ((((((((v_Vuna_dCompiler_dLoader_dresolveExpr modules) label) prefix) own) ownCtors) imports) scope) dtb__524)) (fun t2 -> (C_Base_dResult_dResult_Base_dResult_dOk ((C_Vuna_dCompiler_dAst_dExpr_Vuna_dCompiler_dAst_dEAnn (v2, t2, dtb__525))))))))
  | _ -> failwith "DT: impossible branch"
)))))))))
and v_Vuna_dCompiler_dLoader_dresolveFieldValue = (fun mc0 -> (fun mc1 -> (fun mc2 -> (fun mc3 -> (fun mc4 -> (fun mc5 -> (fun mc6 -> (fun mc7 -> (match mc7 with
  | C_Base_dPair_dPair_Base_dPair_dPair (dtb__526, dtb__527) -> ((v_Base_dResult_dandThen ((((((((v_Vuna_dCompiler_dLoader_dresolveExpr mc0) mc1) mc2) mc3) mc4) mc5) mc6) dtb__527)) (fun v -> (C_Base_dResult_dResult_Base_dResult_dOk ((C_Base_dPair_dPair_Base_dPair_dPair (dtb__526, v))))))
  | _ -> failwith "DT: impossible branch"
)))))))))

let rec v_Vuna_dCompiler_dLoader_dfirstEffect = (fun mc0 -> (match mc0 with
  | C_Base_dList_dList_Cons (dtb__528, dtb__529) -> (match dtb__528 with
  | C_Base_dMaybe_dMaybe_Base_dMaybe_dJust (dtb__530) -> (C_Base_dMaybe_dMaybe_Base_dMaybe_dJust (dtb__530))
  | C_Base_dMaybe_dMaybe_Base_dMaybe_dNothing -> (v_Vuna_dCompiler_dLoader_dfirstEffect dtb__529)
  | _ -> failwith "DT: impossible branch"
)
  | C_Base_dList_dList_Nil -> C_Base_dMaybe_dMaybe_Base_dMaybe_dNothing
  | _ -> failwith "DT: impossible branch"
))

let rec v_Vuna_dCompiler_dLoader_deffExpr = (fun e -> (match e with
  | C_Vuna_dCompiler_dAst_dExpr_Vuna_dCompiler_dAst_dEVar (dtb__531, dtb__532) -> (if (v_Vuna_dCompiler_dLoader_disEffectfulBuiltin dtb__531) then (C_Base_dMaybe_dMaybe_Base_dMaybe_dJust (dtb__531)) else C_Base_dMaybe_dMaybe_Base_dMaybe_dNothing)
  | C_Vuna_dCompiler_dAst_dExpr_Vuna_dCompiler_dAst_dEInt (dtb__533, dtb__534) -> C_Base_dMaybe_dMaybe_Base_dMaybe_dNothing
  | C_Vuna_dCompiler_dAst_dExpr_Vuna_dCompiler_dAst_dEStr (dtb__535, dtb__536) -> C_Base_dMaybe_dMaybe_Base_dMaybe_dNothing
  | C_Vuna_dCompiler_dAst_dExpr_Vuna_dCompiler_dAst_dELam (dtb__537, dtb__538, dtb__539) -> (v_Vuna_dCompiler_dLoader_deffExpr dtb__538)
  | C_Vuna_dCompiler_dAst_dExpr_Vuna_dCompiler_dAst_dEApp (dtb__540, dtb__541, dtb__542) -> (v_Vuna_dCompiler_dLoader_dfirstEffect (C_Base_dList_dList_Cons ((v_Vuna_dCompiler_dLoader_deffExpr dtb__540), ((v_Base_dList_dmap v_Vuna_dCompiler_dLoader_deffExpr) dtb__541))))
  | C_Vuna_dCompiler_dAst_dExpr_Vuna_dCompiler_dAst_dELet (dtb__543, dtb__544, dtb__545, dtb__546) -> (v_Vuna_dCompiler_dLoader_dfirstEffect (C_Base_dList_dList_Cons ((v_Vuna_dCompiler_dLoader_deffBinds dtb__543), (C_Base_dList_dList_Cons ((v_Vuna_dCompiler_dLoader_deffExpr dtb__544), C_Base_dList_dList_Nil)))))
  | C_Vuna_dCompiler_dAst_dExpr_Vuna_dCompiler_dAst_dECase (dtb__547, dtb__548, dtb__549) -> (v_Vuna_dCompiler_dLoader_dfirstEffect (C_Base_dList_dList_Cons ((v_Vuna_dCompiler_dLoader_deffExpr dtb__547), (C_Base_dList_dList_Cons ((v_Vuna_dCompiler_dLoader_deffAlts dtb__548), C_Base_dList_dList_Nil)))))
  | C_Vuna_dCompiler_dAst_dExpr_Vuna_dCompiler_dAst_dEIf (dtb__550, dtb__551, dtb__552, dtb__553) -> (v_Vuna_dCompiler_dLoader_dfirstEffect (C_Base_dList_dList_Cons ((v_Vuna_dCompiler_dLoader_deffExpr dtb__550), (C_Base_dList_dList_Cons ((v_Vuna_dCompiler_dLoader_deffExpr dtb__551), (C_Base_dList_dList_Cons ((v_Vuna_dCompiler_dLoader_deffExpr dtb__552), C_Base_dList_dList_Nil)))))))
  | C_Vuna_dCompiler_dAst_dExpr_Vuna_dCompiler_dAst_dEField (dtb__554, dtb__555, dtb__556) -> (v_Vuna_dCompiler_dLoader_deffExpr dtb__554)
  | C_Vuna_dCompiler_dAst_dExpr_Vuna_dCompiler_dAst_dERecord (dtb__557, dtb__558, dtb__559) -> (v_Vuna_dCompiler_dLoader_deffFields dtb__558)
  | C_Vuna_dCompiler_dAst_dExpr_Vuna_dCompiler_dAst_dERecUpdate (dtb__560, dtb__561, dtb__562) -> (v_Vuna_dCompiler_dLoader_dfirstEffect (C_Base_dList_dList_Cons ((v_Vuna_dCompiler_dLoader_deffExpr dtb__560), (C_Base_dList_dList_Cons ((v_Vuna_dCompiler_dLoader_deffFields dtb__561), C_Base_dList_dList_Nil)))))
  | C_Vuna_dCompiler_dAst_dExpr_Vuna_dCompiler_dAst_dEInstSel (dtb__563, dtb__564, dtb__565) -> C_Base_dMaybe_dMaybe_Base_dMaybe_dNothing
  | C_Vuna_dCompiler_dAst_dExpr_Vuna_dCompiler_dAst_dEPi (dtb__566, dtb__567, dtb__568, dtb__569, dtb__570) -> (v_Vuna_dCompiler_dLoader_dfirstEffect (C_Base_dList_dList_Cons ((v_Vuna_dCompiler_dLoader_deffExpr dtb__568), (C_Base_dList_dList_Cons ((v_Vuna_dCompiler_dLoader_deffExpr dtb__569), C_Base_dList_dList_Nil)))))
  | C_Vuna_dCompiler_dAst_dExpr_Vuna_dCompiler_dAst_dEDo (dtb__571, dtb__572) -> (v_Vuna_dCompiler_dLoader_dfirstEffect ((v_Base_dList_dmap v_Vuna_dCompiler_dLoader_deffDo) dtb__571))
  | C_Vuna_dCompiler_dAst_dExpr_Vuna_dCompiler_dAst_dEAnn (dtb__573, dtb__574, dtb__575) -> (v_Vuna_dCompiler_dLoader_deffExpr dtb__573)
  | _ -> failwith "DT: impossible branch"
))
and v_Vuna_dCompiler_dLoader_deffBinds = (fun mc0 -> (match mc0 with
  | C_Base_dList_dList_Cons (dtb__576, dtb__577) -> (match dtb__576 with
  | C_Base_dPair_dPair_Base_dPair_dPair (dtb__578, dtb__579) -> (v_Vuna_dCompiler_dLoader_dfirstEffect (C_Base_dList_dList_Cons ((v_Vuna_dCompiler_dLoader_deffExpr dtb__579), (C_Base_dList_dList_Cons ((v_Vuna_dCompiler_dLoader_deffBinds dtb__577), C_Base_dList_dList_Nil)))))
  | _ -> failwith "DT: impossible branch"
)
  | C_Base_dList_dList_Nil -> C_Base_dMaybe_dMaybe_Base_dMaybe_dNothing
  | _ -> failwith "DT: impossible branch"
))
and v_Vuna_dCompiler_dLoader_deffAlts = (fun mc0 -> (match mc0 with
  | C_Base_dList_dList_Cons (dtb__580, dtb__581) -> (match dtb__580 with
  | C_Base_dPair_dPair_Base_dPair_dPair (dtb__582, dtb__583) -> (v_Vuna_dCompiler_dLoader_dfirstEffect (C_Base_dList_dList_Cons ((v_Vuna_dCompiler_dLoader_deffExpr dtb__583), (C_Base_dList_dList_Cons ((v_Vuna_dCompiler_dLoader_deffAlts dtb__581), C_Base_dList_dList_Nil)))))
  | _ -> failwith "DT: impossible branch"
)
  | C_Base_dList_dList_Nil -> C_Base_dMaybe_dMaybe_Base_dMaybe_dNothing
  | _ -> failwith "DT: impossible branch"
))
and v_Vuna_dCompiler_dLoader_deffFields = (fun mc0 -> (match mc0 with
  | C_Base_dList_dList_Cons (dtb__584, dtb__585) -> (match dtb__584 with
  | C_Base_dPair_dPair_Base_dPair_dPair (dtb__586, dtb__587) -> (v_Vuna_dCompiler_dLoader_dfirstEffect (C_Base_dList_dList_Cons ((v_Vuna_dCompiler_dLoader_deffExpr dtb__587), (C_Base_dList_dList_Cons ((v_Vuna_dCompiler_dLoader_deffFields dtb__585), C_Base_dList_dList_Nil)))))
  | _ -> failwith "DT: impossible branch"
)
  | C_Base_dList_dList_Nil -> C_Base_dMaybe_dMaybe_Base_dMaybe_dNothing
  | _ -> failwith "DT: impossible branch"
))
and v_Vuna_dCompiler_dLoader_deffDo = (fun s -> (match s with
  | C_Vuna_dCompiler_dAst_dDoStmt_Vuna_dCompiler_dAst_dDBind (dtb__588, dtb__589, dtb__590) -> (v_Vuna_dCompiler_dLoader_deffExpr dtb__589)
  | C_Vuna_dCompiler_dAst_dDoStmt_Vuna_dCompiler_dAst_dDExpr (dtb__591, dtb__592) -> (v_Vuna_dCompiler_dLoader_deffExpr dtb__591)
  | _ -> failwith "DT: impossible branch"
))

let rec v_Vuna_dCompiler_dLoader_deffDecl = (fun d -> (match d with
  | C_Vuna_dCompiler_dAst_dDecl_Vuna_dCompiler_dAst_dDFun (dtb__593, dtb__594, dtb__595, dtb__596) -> (v_Vuna_dCompiler_dLoader_deffExpr dtb__595)
  | C_Vuna_dCompiler_dAst_dDecl_Vuna_dCompiler_dAst_dDTrait (dtb__597, dtb__598, dtb__599, dtb__600) -> C_Base_dMaybe_dMaybe_Base_dMaybe_dNothing
  | C_Vuna_dCompiler_dAst_dDecl_Vuna_dCompiler_dAst_dDInstance (dtb__601, dtb__602, dtb__603, dtb__604, dtb__605) -> (v_Vuna_dCompiler_dLoader_dfirstEffect ((v_Base_dList_dmap v_Vuna_dCompiler_dLoader_deffDecl) dtb__604))
  | _ -> C_Base_dMaybe_dMaybe_Base_dMaybe_dNothing
))

let v_Vuna_dCompiler_dLoader_deffDecls = (fun decls -> (v_Vuna_dCompiler_dLoader_dfirstEffect ((v_Base_dList_dmap v_Vuna_dCompiler_dLoader_deffDecl) decls)))

let v_Vuna_dCompiler_dLoader_dcheckEffectsBuiltins = (fun label -> (fun pkg -> (fun decls -> (if (v_Vuna_dCompiler_dLoader_dpackageAllowsEffects pkg) then (C_Base_dResult_dResult_Base_dResult_dOk (decls)) else (if (if ((bi_eq_str pkg) "") then ((bi_neq_str label) "<entry>") else false) then (C_Base_dResult_dResult_Base_dResult_dOk (decls)) else (match (v_Vuna_dCompiler_dLoader_deffDecls decls) with
  | C_Base_dMaybe_dMaybe_Base_dMaybe_dNothing -> (C_Base_dResult_dResult_Base_dResult_dOk (decls))
  | C_Base_dMaybe_dMaybe_Base_dMaybe_dJust (dtb__606) -> (C_Base_dResult_dResult_Base_dResult_dErr (((bi_concat label) ((bi_concat ": effectful builtin `") ((bi_concat dtb__606) ((bi_concat "` is not available in package ") ((bi_concat pkg) " (use Base.IO)")))))))
  | _ -> failwith "DT: impossible branch"
))))))

let v_Vuna_dCompiler_dLoader_dtyShape = (fun ty -> (match ty with
  | C_Vuna_dCompiler_dAst_dExpr_Vuna_dCompiler_dAst_dEVar (dtb__607, dtb__608) -> ((bi_concat "var ") dtb__607)
  | C_Vuna_dCompiler_dAst_dExpr_Vuna_dCompiler_dAst_dEApp (dtb__609, dtb__610, dtb__611) -> "app"
  | C_Vuna_dCompiler_dAst_dExpr_Vuna_dCompiler_dAst_dEInt (dtb__612, dtb__613) -> "int"
  | C_Vuna_dCompiler_dAst_dExpr_Vuna_dCompiler_dAst_dEStr (dtb__614, dtb__615) -> "str"
  | C_Vuna_dCompiler_dAst_dExpr_Vuna_dCompiler_dAst_dELam (dtb__616, dtb__617, dtb__618) -> "lam"
  | C_Vuna_dCompiler_dAst_dExpr_Vuna_dCompiler_dAst_dELet (dtb__619, dtb__620, dtb__621, dtb__622) -> "let"
  | C_Vuna_dCompiler_dAst_dExpr_Vuna_dCompiler_dAst_dECase (dtb__623, dtb__624, dtb__625) -> "case"
  | C_Vuna_dCompiler_dAst_dExpr_Vuna_dCompiler_dAst_dEIf (dtb__626, dtb__627, dtb__628, dtb__629) -> "if"
  | C_Vuna_dCompiler_dAst_dExpr_Vuna_dCompiler_dAst_dEDo (dtb__630, dtb__631) -> "do"
  | _ -> "other"
))

let rec v_Vuna_dCompiler_dLoader_dresolveTypeExpr = (fun modules -> (fun label -> (fun prefix -> (fun ownTypes -> (fun imports -> (fun ty -> ((fun nd_uscrut -> (match nd_uscrut with
  | C_Vuna_dCompiler_dAst_dExpr_Vuna_dCompiler_dAst_dEPi (dtb__632, dtb__633, dtb__634, dtb__635, dtb__636) -> ((v_Base_dResult_dandThen ((((((v_Vuna_dCompiler_dLoader_dresolveTypeExpr modules) label) prefix) ownTypes) imports) dtb__634)) (fun dom2 -> ((v_Base_dResult_dandThen ((((((v_Vuna_dCompiler_dLoader_dresolveTypeExpr modules) label) prefix) ownTypes) imports) dtb__635)) (fun cod2 -> (C_Base_dResult_dResult_Base_dResult_dOk ((C_Vuna_dCompiler_dAst_dExpr_Vuna_dCompiler_dAst_dEPi (dtb__632, dtb__633, dom2, cod2, dtb__636))))))))
  | C_Vuna_dCompiler_dAst_dExpr_Vuna_dCompiler_dAst_dEApp (dtb__637, dtb__638, dtb__639) -> (match dtb__637 with
  | C_Vuna_dCompiler_dAst_dExpr_Vuna_dCompiler_dAst_dEVar (dtb__640, dtb__641) -> (if ((bi_eq_str dtb__640) "Type") then (C_Base_dResult_dResult_Base_dResult_dOk (ty)) else ((v_Base_dResult_dandThen ((((((v_Vuna_dCompiler_dLoader_dresolveTypeExpr modules) label) prefix) ownTypes) imports) dtb__637)) (fun fn2 -> ((v_Base_dResult_dandThen ((v_Base_dResult_dtraverse (((((v_Vuna_dCompiler_dLoader_dresolveTypeExpr modules) label) prefix) ownTypes) imports)) dtb__638)) (fun args2 -> (C_Base_dResult_dResult_Base_dResult_dOk ((C_Vuna_dCompiler_dAst_dExpr_Vuna_dCompiler_dAst_dEApp (fn2, args2, dtb__639)))))))))
  | _ -> ((v_Base_dResult_dandThen ((((((v_Vuna_dCompiler_dLoader_dresolveTypeExpr modules) label) prefix) ownTypes) imports) dtb__637)) (fun fn2 -> ((v_Base_dResult_dandThen ((v_Base_dResult_dtraverse (((((v_Vuna_dCompiler_dLoader_dresolveTypeExpr modules) label) prefix) ownTypes) imports)) dtb__638)) (fun args2 -> (C_Base_dResult_dResult_Base_dResult_dOk ((C_Vuna_dCompiler_dAst_dExpr_Vuna_dCompiler_dAst_dEApp (fn2, args2, dtb__639))))))))
)
  | C_Vuna_dCompiler_dAst_dExpr_Vuna_dCompiler_dAst_dEVar (dtb__642, dtb__643) -> ((v_Base_dResult_dandThen ((((((v_Vuna_dCompiler_dLoader_dresolveTypeName modules) label) prefix) ownTypes) imports) dtb__642)) (fun n -> (C_Base_dResult_dResult_Base_dResult_dOk ((C_Vuna_dCompiler_dAst_dExpr_Vuna_dCompiler_dAst_dEVar (n, dtb__643))))))
  | C_Vuna_dCompiler_dAst_dExpr_Vuna_dCompiler_dAst_dEInt (dtb__644, dtb__645) -> (C_Base_dResult_dResult_Base_dResult_dOk (ty))
  | _ -> (C_Base_dResult_dResult_Base_dResult_dErr (((bi_concat label) ((bi_concat ": invalid type expression (") ((bi_concat (v_Vuna_dCompiler_dLoader_dtyShape ty)) ")")))))
)) ty)))))))

let v_Vuna_dCompiler_dLoader_dresolveCtorSpec = (fun mc0 -> (fun mc1 -> (fun mc2 -> (fun mc3 -> (fun mc4 -> (fun mc5 -> (match mc5 with
  | C_Vuna_dCompiler_dAst_dCtor_Vuna_dCompiler_dAst_dCtor (dtb__646, dtb__647, dtb__648, dtb__649) -> ((v_Base_dResult_dandThen (((v_Vuna_dCompiler_dLoader_dresolveCtorDecl mc1) mc2) dtb__646)) (fun c2 -> ((v_Base_dResult_dandThen ((((((v_Vuna_dCompiler_dLoader_dresolveTypeExpr mc0) mc1) mc2) mc3) mc4) dtb__647)) (fun ty2 -> (C_Base_dResult_dResult_Base_dResult_dOk ((C_Vuna_dCompiler_dAst_dCtor_Vuna_dCompiler_dAst_dCtor (c2, ty2, dtb__648, dtb__649))))))))
  | _ -> failwith "DT: impossible branch"
)))))))

let v_Vuna_dCompiler_dLoader_dresolveRecordField = (fun mc0 -> (fun mc1 -> (fun mc2 -> (fun mc3 -> (fun mc4 -> (fun mc5 -> (match mc5 with
  | C_Vuna_dCompiler_dAst_dField_Vuna_dCompiler_dAst_dField (dtb__650, dtb__651, dtb__652) -> ((v_Base_dResult_dandThen ((v_Vuna_dCompiler_dLoader_dcheckBinder mc1) dtb__650)) (fun _u -> ((v_Base_dResult_dandThen ((((((v_Vuna_dCompiler_dLoader_dresolveTypeExpr mc0) mc1) mc2) mc3) mc4) dtb__651)) (fun ty2 -> (C_Base_dResult_dResult_Base_dResult_dOk ((C_Vuna_dCompiler_dAst_dField_Vuna_dCompiler_dAst_dField (dtb__650, ty2, dtb__652))))))))
  | _ -> failwith "DT: impossible branch"
)))))))

let v_Vuna_dCompiler_dLoader_dresolveTraitMethod = (fun mc0 -> (fun mc1 -> (fun mc2 -> (fun mc3 -> (fun mc4 -> (fun mc5 -> (match mc5 with
  | C_Base_dPair_dPair_Base_dPair_dPair (dtb__653, dtb__654) -> ((v_Base_dResult_dandThen (((v_Vuna_dCompiler_dLoader_dresolveTopName mc1) mc2) dtb__653)) (fun n -> ((v_Base_dResult_dandThen ((((((v_Vuna_dCompiler_dLoader_dresolveTypeExpr mc0) mc1) mc2) mc3) mc4) dtb__654)) (fun ty2 -> (C_Base_dResult_dResult_Base_dResult_dOk ((C_Base_dPair_dPair_Base_dPair_dPair (n, ty2))))))))
  | _ -> failwith "DT: impossible branch"
)))))))

let v_Vuna_dCompiler_dLoader_dresolveInstanceMethod = (fun modules -> (fun label -> (fun prefix -> (fun own -> (fun ownCtors -> (fun ownTypes -> (fun imports -> (fun d -> (match d with
  | C_Vuna_dCompiler_dAst_dDecl_Vuna_dCompiler_dAst_dDSig (dtb__655, dtb__656, dtb__657) -> ((v_Base_dResult_dandThen ((v_Vuna_dCompiler_dLoader_dcheckTopName label) dtb__655)) (fun _u -> ((v_Base_dResult_dandThen ((((((v_Vuna_dCompiler_dLoader_dresolveTypeExpr modules) label) prefix) ownTypes) imports) dtb__656)) (fun ty2 -> (C_Base_dResult_dResult_Base_dResult_dOk ((C_Vuna_dCompiler_dAst_dDecl_Vuna_dCompiler_dAst_dDSig (dtb__655, ty2, dtb__657))))))))
  | C_Vuna_dCompiler_dAst_dDecl_Vuna_dCompiler_dAst_dDFun (dtb__658, dtb__659, dtb__660, dtb__661) -> ((v_Base_dResult_dandThen ((v_Vuna_dCompiler_dLoader_dcheckTopName label) dtb__658)) (fun _u -> ((v_Base_dResult_dandThen ((v_Base_dResult_dtraverse (((((v_Vuna_dCompiler_dLoader_dresolvePattern modules) label) prefix) ownCtors) imports)) dtb__659)) (fun parts -> ((v_Base_dResult_dandThen ((((((((v_Vuna_dCompiler_dLoader_dresolveExpr modules) label) prefix) own) ownCtors) imports) ((v_Base_dList_dconcatMap v_Base_dPair_dsecondOf) parts)) dtb__660)) (fun b -> (C_Base_dResult_dResult_Base_dResult_dOk ((C_Vuna_dCompiler_dAst_dDecl_Vuna_dCompiler_dAst_dDFun (dtb__658, ((v_Base_dList_dmap v_Base_dPair_dfirstOf) parts), b, dtb__661))))))))))
  | _ -> (C_Base_dResult_dResult_Base_dResult_dErr (((bi_concat label) ": instance body may only contain method signatures/definitions")))
)))))))))

let v_Vuna_dCompiler_dLoader_dresolveDecl = (fun modules -> (fun label -> (fun prefix -> (fun own -> (fun ownCtors -> (fun ownTypes -> (fun imports -> (fun d -> (match d with
  | C_Vuna_dCompiler_dAst_dDecl_Vuna_dCompiler_dAst_dDData (dtb__662, dtb__663, dtb__664, dtb__665, dtb__666, dtb__667) -> ((v_Base_dResult_dandThen (((v_Vuna_dCompiler_dLoader_dresolveTypeTopName label) prefix) dtb__662)) (fun dn -> ((v_Base_dResult_dandThen ((v_Base_dResult_dtraverse (((((v_Vuna_dCompiler_dLoader_dresolveCtorSpec modules) label) prefix) ownTypes) imports)) dtb__665)) (fun ctors2 -> ((v_Base_dResult_dandThen ((v_Base_dResult_dtraverse (((((v_Vuna_dCompiler_dLoader_dresolveTypeName modules) label) prefix) ownTypes) imports)) dtb__666)) (fun ds2 -> (C_Base_dResult_dResult_Base_dResult_dOk ((C_Vuna_dCompiler_dAst_dDecl_Vuna_dCompiler_dAst_dDData (dn, dtb__663, dtb__664, ctors2, ds2, dtb__667))))))))))
  | C_Vuna_dCompiler_dAst_dDecl_Vuna_dCompiler_dAst_dDRecord (dtb__668, dtb__669, dtb__670, dtb__671, dtb__672) -> ((v_Base_dResult_dandThen (((v_Vuna_dCompiler_dLoader_dresolveTypeTopName label) prefix) dtb__668)) (fun dn -> ((v_Base_dResult_dandThen ((v_Base_dResult_dtraverse (((((v_Vuna_dCompiler_dLoader_dresolveRecordField modules) label) prefix) ownTypes) imports)) dtb__670)) (fun fields2 -> ((v_Base_dResult_dandThen ((v_Base_dResult_dtraverse (((((v_Vuna_dCompiler_dLoader_dresolveTypeName modules) label) prefix) ownTypes) imports)) dtb__671)) (fun ds2 -> (C_Base_dResult_dResult_Base_dResult_dOk ((C_Vuna_dCompiler_dAst_dDecl_Vuna_dCompiler_dAst_dDRecord (dn, dtb__669, fields2, ds2, dtb__672))))))))))
  | C_Vuna_dCompiler_dAst_dDecl_Vuna_dCompiler_dAst_dDTrait (dtb__673, dtb__674, dtb__675, dtb__676) -> ((v_Base_dResult_dandThen (((v_Vuna_dCompiler_dLoader_dresolveTypeTopName label) prefix) dtb__673)) (fun tn -> ((v_Base_dResult_dandThen ((v_Base_dResult_dtraverse (((((v_Vuna_dCompiler_dLoader_dresolveTraitMethod modules) label) prefix) ownTypes) imports)) dtb__675)) (fun ms -> (C_Base_dResult_dResult_Base_dResult_dOk ((C_Vuna_dCompiler_dAst_dDecl_Vuna_dCompiler_dAst_dDTrait (tn, dtb__674, ms, dtb__676))))))))
  | C_Vuna_dCompiler_dAst_dDecl_Vuna_dCompiler_dAst_dDInstance (dtb__677, dtb__678, dtb__679, dtb__680, dtb__681) -> ((v_Base_dResult_dandThen (((v_Vuna_dCompiler_dLoader_dresolveInstanceName label) prefix) dtb__677)) (fun in2 -> ((v_Base_dResult_dandThen ((((((v_Vuna_dCompiler_dLoader_dresolveTypeExpr modules) label) prefix) ownTypes) imports) dtb__679)) (fun head2 -> ((v_Base_dResult_dandThen ((v_Base_dResult_dtraverse (((((((v_Vuna_dCompiler_dLoader_dresolveInstanceMethod modules) label) prefix) own) ownCtors) ownTypes) imports)) dtb__680)) (fun ms -> (C_Base_dResult_dResult_Base_dResult_dOk ((C_Vuna_dCompiler_dAst_dDecl_Vuna_dCompiler_dAst_dDInstance (in2, dtb__678, head2, ms, dtb__681))))))))))
  | C_Vuna_dCompiler_dAst_dDecl_Vuna_dCompiler_dAst_dDSig (dtb__682, dtb__683, dtb__684) -> ((v_Base_dResult_dandThen (((v_Vuna_dCompiler_dLoader_dresolveTopName label) prefix) dtb__682)) (fun n -> ((v_Base_dResult_dandThen ((((((v_Vuna_dCompiler_dLoader_dresolveTypeExpr modules) label) prefix) ownTypes) imports) dtb__683)) (fun ty2 -> (C_Base_dResult_dResult_Base_dResult_dOk ((C_Vuna_dCompiler_dAst_dDecl_Vuna_dCompiler_dAst_dDSig (n, ty2, dtb__684))))))))
  | C_Vuna_dCompiler_dAst_dDecl_Vuna_dCompiler_dAst_dDFun (dtb__685, dtb__686, dtb__687, dtb__688) -> ((v_Base_dResult_dandThen (((v_Vuna_dCompiler_dLoader_dresolveTopName label) prefix) dtb__685)) (fun n -> ((v_Base_dResult_dandThen ((v_Base_dResult_dtraverse (((((v_Vuna_dCompiler_dLoader_dresolvePattern modules) label) prefix) ownCtors) imports)) dtb__686)) (fun parts -> ((v_Base_dResult_dandThen ((((((((v_Vuna_dCompiler_dLoader_dresolveExpr modules) label) prefix) own) ownCtors) imports) ((v_Base_dList_dconcatMap v_Base_dPair_dsecondOf) parts)) dtb__687)) (fun b -> (C_Base_dResult_dResult_Base_dResult_dOk ((C_Vuna_dCompiler_dAst_dDecl_Vuna_dCompiler_dAst_dDFun (n, ((v_Base_dList_dmap v_Base_dPair_dfirstOf) parts), b, dtb__688))))))))))
  | _ -> failwith "DT: impossible branch"
)))))))))

let v_Vuna_dCompiler_dLoader_dresolveProgram = (fun modules -> (fun label -> (fun prefix -> (fun own -> (fun ownCtors -> (fun ownTypes -> (fun imports -> (fun decls -> ((v_Base_dResult_dtraverse (((((((v_Vuna_dCompiler_dLoader_dresolveDecl modules) label) prefix) own) ownCtors) ownTypes) imports)) decls)))))))))

let v_Vuna_dCompiler_dLoader_dresolveEntry = (fun modules -> (fun entryPkg -> (fun imports -> (fun decls -> ((v_Base_dResult_dandThen ((((((((v_Vuna_dCompiler_dLoader_dresolveProgram modules) "<entry>") "") ((v_Base_dList_dappend (v_Vuna_dCompiler_dAst_dtopNames decls)) (v_Vuna_dCompiler_dAst_dtypeNamesOf decls))) (v_Vuna_dCompiler_dAst_dctorsOf decls)) ((v_Base_dList_dappend (v_Vuna_dCompiler_dAst_dctorsOf decls)) ((v_Base_dList_dappend (v_Vuna_dCompiler_dAst_dtopNames decls)) (v_Vuna_dCompiler_dAst_dtypeNamesOf decls)))) imports) decls)) (fun d -> (((v_Vuna_dCompiler_dLoader_dcheckEffectsBuiltins "<entry>") entryPkg) d)))))))

let rec v_Vuna_dCompiler_dLoader_dresolveModules = (fun modules -> (match modules with
  | C_Base_dList_dList_Nil -> (C_Base_dResult_dResult_Base_dResult_dOk (C_Base_dList_dList_Nil))
  | C_Base_dList_dList_Cons (dtb__689, dtb__690) -> (match dtb__689 with
  | C_Vuna_dCompiler_dLoader_dModule_Vuna_dCompiler_dLoader_dModule (dtb__691, dtb__692, dtb__693, dtb__694, dtb__695, dtb__696) -> ((v_Base_dResult_dandThen ((v_Base_dResult_dandThen ((((((((v_Vuna_dCompiler_dLoader_dresolveProgram modules) dtb__691) dtb__691) ((v_Base_dList_dappend (v_Vuna_dCompiler_dAst_dtopNames dtb__695)) (v_Vuna_dCompiler_dAst_dtypeNamesOf dtb__695))) (v_Vuna_dCompiler_dAst_dctorsOf dtb__695)) ((v_Base_dList_dappend (v_Vuna_dCompiler_dAst_dctorsOf dtb__695)) ((v_Base_dList_dappend (v_Vuna_dCompiler_dAst_dtopNames dtb__695)) (v_Vuna_dCompiler_dAst_dtypeNamesOf dtb__695)))) ((v_Base_dList_dappend dtb__693) dtb__694)) dtb__695)) (fun d -> (((v_Vuna_dCompiler_dLoader_dcheckEffectsBuiltins dtb__691) dtb__692) d)))) (fun d1 -> ((v_Base_dResult_dandThen (v_Vuna_dCompiler_dLoader_dresolveModules dtb__690)) (fun d2 -> (C_Base_dResult_dResult_Base_dResult_dOk (((v_Base_dList_dappend d1) d2)))))))
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
))

let rec v_Vuna_dCompiler_dLoader_dresolveModulesKeep = (fun mc0 -> (match mc0 with
  | C_Base_dList_dList_Cons (dtb__697, dtb__698) -> (match dtb__697 with
  | C_Vuna_dCompiler_dLoader_dModule_Vuna_dCompiler_dLoader_dModule (dtb__699, dtb__700, dtb__701, dtb__702, dtb__703, dtb__704) -> ((v_Base_dResult_dandThen ((v_Base_dResult_dandThen ((((((((v_Vuna_dCompiler_dLoader_dresolveProgram (C_Base_dList_dList_Cons ((C_Vuna_dCompiler_dLoader_dModule_Vuna_dCompiler_dLoader_dModule (dtb__699, dtb__700, dtb__701, dtb__702, dtb__703, dtb__704)), dtb__698))) dtb__699) dtb__699) ((v_Base_dList_dappend (v_Vuna_dCompiler_dAst_dtopNames dtb__703)) (v_Vuna_dCompiler_dAst_dtypeNamesOf dtb__703))) (v_Vuna_dCompiler_dAst_dctorsOf dtb__703)) ((v_Base_dList_dappend (v_Vuna_dCompiler_dAst_dctorsOf dtb__703)) ((v_Base_dList_dappend (v_Vuna_dCompiler_dAst_dtopNames dtb__703)) (v_Vuna_dCompiler_dAst_dtypeNamesOf dtb__703)))) ((v_Base_dList_dappend dtb__701) dtb__702)) dtb__703)) (fun d -> (((v_Vuna_dCompiler_dLoader_dcheckEffectsBuiltins dtb__699) dtb__700) d)))) (fun d1 -> ((v_Base_dResult_dandThen (v_Vuna_dCompiler_dLoader_dresolveModulesKeep dtb__698)) (fun d2 -> (C_Base_dResult_dResult_Base_dResult_dOk ((C_Base_dList_dList_Cons ((C_Vuna_dCompiler_dLoader_dModule_Vuna_dCompiler_dLoader_dModule (dtb__699, dtb__700, dtb__701, dtb__702, d1, dtb__704)), d2))))))))
  | _ -> failwith "DT: impossible branch"
)
  | C_Base_dList_dList_Nil -> (C_Base_dResult_dResult_Base_dResult_dOk (C_Base_dList_dList_Nil))
  | _ -> failwith "DT: impossible branch"
))

let v_Vuna_dCompiler_dLoader_dresolveProject = (fun mc0 -> (match mc0 with
  | C_Vuna_dCompiler_dLoader_dProject_Vuna_dCompiler_dLoader_dProject (dtb__705, dtb__706, dtb__707, dtb__708, dtb__709) -> ((v_Base_dResult_dandThen ((((v_Vuna_dCompiler_dLoader_dresolveEntry dtb__708) dtb__709) ((v_Base_dList_dappend dtb__706) dtb__707)) dtb__705)) (fun entryDecls -> ((v_Base_dResult_dandThen (v_Vuna_dCompiler_dLoader_dresolveModulesKeep dtb__708)) (fun modules2 -> (C_Base_dResult_dResult_Base_dResult_dOk ((C_Base_dPair_dPair_Base_dPair_dPair (entryDecls, modules2))))))))
  | _ -> failwith "DT: impossible branch"
))

let v_Vuna_dCompiler_dLoader_dloadProgram = (fun roots -> (fun entryPkg -> (fun entry -> ((v_Base_dResult_dandThen (((v_Vuna_dCompiler_dLoader_dloadProject roots) entryPkg) entry)) (fun p -> ((v_Base_dResult_dandThen (v_Vuna_dCompiler_dLoader_dresolveProject p)) (fun r -> (C_Base_dResult_dResult_Base_dResult_dOk (((v_Base_dList_dappend (v_Base_dPair_dfirstOf r)) ((v_Base_dList_dconcatMap v_Vuna_dCompiler_dLoader_dmoduleDeclsOf) (v_Base_dPair_dsecondOf r))))))))))))

let v_Vuna_dCompiler_dLoader_dloadProgramRaw = (fun roots -> (fun entry -> (((v_Vuna_dCompiler_dLoader_dloadProgram ((v_Base_dList_dmap v_Vuna_dCompiler_dPkg_drawRoot) roots)) "") entry)))

let v_Vuna_dCompiler_dLoader_dorderedProjectDecls = (fun p -> ((v_Base_dResult_dandThen (v_Vuna_dCompiler_dLoader_dresolveProject p)) (fun r -> (C_Base_dResult_dResult_Base_dResult_dOk (((v_Base_dList_dappend ((v_Base_dList_dconcatMap v_Vuna_dCompiler_dLoader_dmoduleDeclsOf) (v_Base_dList_dreverse (v_Base_dPair_dsecondOf r)))) (v_Base_dPair_dfirstOf r)))))))

let v_Vuna_dCompiler_dLoader_dloadProgramOrdered = (fun roots -> (fun entryPkg -> (fun entry -> ((v_Base_dResult_dandThen (((v_Vuna_dCompiler_dLoader_dloadProject roots) entryPkg) entry)) v_Vuna_dCompiler_dLoader_dorderedProjectDecls))))

let v_Vuna_dCompiler_dLoader_dloadProgramRawOrdered = (fun roots -> (fun entry -> (((v_Vuna_dCompiler_dLoader_dloadProgramOrdered ((v_Base_dList_dmap v_Vuna_dCompiler_dPkg_drawRoot) roots)) "") entry)))

let v_Vuna_dCompiler_dLoader_dloadProgramRawOrderedSource = (fun roots -> (fun label -> (fun source -> ((v_Base_dResult_dandThen ((v_Vuna_dCompiler_dParser_dparseSource label) source)) (fun src -> (match src with
  | C_Vuna_dCompiler_dAst_dSourceFile_Vuna_dCompiler_dAst_dSource (dtb__710, dtb__711, dtb__712) -> (match dtb__710 with
  | C_Base_dMaybe_dMaybe_Base_dMaybe_dJust (dtb__713) -> (match dtb__713 with
  | C_Vuna_dCompiler_dAst_dModDecl_Vuna_dCompiler_dAst_dModDecl (dtb__714, dtb__715, dtb__716, dtb__717) -> (C_Base_dResult_dResult_Base_dResult_dErr (((bi_concat "module header is not allowed in entry source (") ((bi_concat label) ")"))))
  | _ -> failwith "DT: impossible branch"
)
  | C_Base_dMaybe_dMaybe_Base_dMaybe_dNothing -> ((v_Base_dResult_dandThen ((v_Vuna_dCompiler_dLoader_dvalidateImports "<entry>") dtb__711)) (fun _u -> ((v_Base_dResult_dandThen (((((v_Vuna_dCompiler_dLoader_dloadAll ((v_Base_dList_dmap v_Vuna_dCompiler_dPkg_drawRoot) roots)) "") C_Base_dList_dList_Nil) C_Base_dList_dList_Nil) dtb__711)) (fun modules -> (v_Vuna_dCompiler_dLoader_dorderedProjectDecls (C_Vuna_dCompiler_dLoader_dProject_Vuna_dCompiler_dLoader_dProject (dtb__712, dtb__711, C_Base_dList_dList_Nil, modules, "")))))))
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
))))))
