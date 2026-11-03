open Vuna_runtime
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
open Vuna_dCompiler_dDebug
open Base_dNat
open Base_dVec
open Vuna_dCompiler_dDiagnostics
open Vuna_dCompiler_dFrontend_dAst
open Vuna_dCompiler_dFrontend_dDiagnostics
open Vuna_dCompiler_dFrontend_dLexer
open Vuna_dCompiler_dFrontend_dParser_dSupport
open Vuna_dCompiler_dFrontend_dParser
open Vuna_dCompiler_dLoader_dDiagnostics
type t_Vuna_dCompiler_dLoader_dModules_dModule = C_Vuna_dCompiler_dLoader_dModules_dModule_Vuna_dCompiler_dLoader_dModules_dModule of (string) * (string) * (t_Vuna_dCompiler_dFrontend_dAst_dImport t_Base_dList_dList) * (t_Vuna_dCompiler_dFrontend_dAst_dImport t_Base_dList_dList) * (t_Vuna_dCompiler_dFrontend_dAst_dDecl t_Base_dList_dList) * (t_Vuna_dCompiler_dLoader_dModules_dExportEntry t_Base_dList_dList) * (string t_Base_dList_dList)
and t_Vuna_dCompiler_dLoader_dModules_dProject = C_Vuna_dCompiler_dLoader_dModules_dProject_Vuna_dCompiler_dLoader_dModules_dProject of (t_Vuna_dCompiler_dFrontend_dAst_dDecl t_Base_dList_dList) * (t_Vuna_dCompiler_dFrontend_dAst_dImport t_Base_dList_dList) * (t_Vuna_dCompiler_dFrontend_dAst_dImport t_Base_dList_dList) * (t_Vuna_dCompiler_dLoader_dModules_dModule t_Base_dList_dList) * (string) * (string t_Base_dList_dList)
and t_Vuna_dCompiler_dLoader_dModules_dExportEntry = C_Vuna_dCompiler_dLoader_dModules_dExportEntry_Vuna_dCompiler_dLoader_dModules_dExportEntry of (string) * (string) * (string) * (string)
and t_Vuna_dCompiler_dLoader_dModules_dExportRef = C_Vuna_dCompiler_dLoader_dModules_dExportRef_Vuna_dCompiler_dLoader_dModules_dExportRef of (string) * (string) * (string)

let rec v_Base_dEq_dEq_uBase_dEq_dEq_uVuna_dCompiler_dLoader_dModules_dExportEntry = (C_Dict_uBase_dEq_dEq_MkDict_uBase_dEq_dEq ((fun sx -> (fun sy -> (match sx with
  | C_Vuna_dCompiler_dLoader_dModules_dExportEntry_Vuna_dCompiler_dLoader_dModules_dExportEntry (dtb__0, dtb__1, dtb__2, dtb__3) -> (match sy with
  | C_Vuna_dCompiler_dLoader_dModules_dExportEntry_Vuna_dCompiler_dLoader_dModules_dExportEntry (dtb__4, dtb__5, dtb__6, dtb__7) -> (if ((bi_eq_str dtb__0) dtb__4) then (if ((bi_eq_str dtb__1) dtb__5) then (if ((bi_eq_str dtb__2) dtb__6) then ((bi_eq_str dtb__3) dtb__7) else false) else false) else false)
  | _ -> ((bi_eq_int 0) 1)
)
  | _ -> failwith "DT: impossible branch"
))), (fun sx -> (fun sy -> (if (((v_Base_dEq_deq v_Base_dEq_dEq_uBase_dEq_dEq_uVuna_dCompiler_dLoader_dModules_dExportEntry) sx) sy) then ((bi_eq_int 0) 1) else ((bi_eq_int 1) 1))))))

let v_Vuna_dCompiler_dLoader_dModules_dmoduleNameOf = (fun mc0 -> (match mc0 with
  | C_Vuna_dCompiler_dLoader_dModules_dModule_Vuna_dCompiler_dLoader_dModules_dModule (dtb__8, dtb__9, dtb__10, dtb__11, dtb__12, dtb__13, dtb__14) -> dtb__8
  | _ -> failwith "DT: impossible branch"
))

let v_Vuna_dCompiler_dLoader_dModules_dmodulePackageOf = (fun mc0 -> (match mc0 with
  | C_Vuna_dCompiler_dLoader_dModules_dModule_Vuna_dCompiler_dLoader_dModules_dModule (dtb__15, dtb__16, dtb__17, dtb__18, dtb__19, dtb__20, dtb__21) -> dtb__16
  | _ -> failwith "DT: impossible branch"
))

let v_Vuna_dCompiler_dLoader_dModules_dmoduleImportsOf = (fun mc0 -> (match mc0 with
  | C_Vuna_dCompiler_dLoader_dModules_dModule_Vuna_dCompiler_dLoader_dModules_dModule (dtb__22, dtb__23, dtb__24, dtb__25, dtb__26, dtb__27, dtb__28) -> dtb__24
  | _ -> failwith "DT: impossible branch"
))

let v_Vuna_dCompiler_dLoader_dModules_dmoduleImplicitImportsOf = (fun mc0 -> (match mc0 with
  | C_Vuna_dCompiler_dLoader_dModules_dModule_Vuna_dCompiler_dLoader_dModules_dModule (dtb__29, dtb__30, dtb__31, dtb__32, dtb__33, dtb__34, dtb__35) -> dtb__32
  | _ -> failwith "DT: impossible branch"
))

let v_Vuna_dCompiler_dLoader_dModules_dmoduleAllImportsOf = (fun mc0 -> (match mc0 with
  | C_Vuna_dCompiler_dLoader_dModules_dModule_Vuna_dCompiler_dLoader_dModules_dModule (dtb__36, dtb__37, dtb__38, dtb__39, dtb__40, dtb__41, dtb__42) -> ((v_Base_dList_dappend dtb__38) dtb__39)
  | _ -> failwith "DT: impossible branch"
))

let v_Vuna_dCompiler_dLoader_dModules_dmoduleDeclsOf = (fun mc0 -> (match mc0 with
  | C_Vuna_dCompiler_dLoader_dModules_dModule_Vuna_dCompiler_dLoader_dModules_dModule (dtb__43, dtb__44, dtb__45, dtb__46, dtb__47, dtb__48, dtb__49) -> dtb__47
  | _ -> failwith "DT: impossible branch"
))

let v_Vuna_dCompiler_dLoader_dModules_dmoduleExportsOf = (fun mc0 -> (match mc0 with
  | C_Vuna_dCompiler_dLoader_dModules_dModule_Vuna_dCompiler_dLoader_dModules_dModule (dtb__50, dtb__51, dtb__52, dtb__53, dtb__54, dtb__55, dtb__56) -> dtb__55
  | _ -> failwith "DT: impossible branch"
))

let v_Vuna_dCompiler_dLoader_dModules_dmoduleCapabilities = (fun mc0 -> (match mc0 with
  | C_Vuna_dCompiler_dLoader_dModules_dModule_Vuna_dCompiler_dLoader_dModules_dModule (dtb__57, dtb__58, dtb__59, dtb__60, dtb__61, dtb__62, dtb__63) -> dtb__63
  | _ -> failwith "DT: impossible branch"
))

let v_Vuna_dCompiler_dLoader_dModules_dprojectEntryDecls = (fun mc0 -> (match mc0 with
  | C_Vuna_dCompiler_dLoader_dModules_dProject_Vuna_dCompiler_dLoader_dModules_dProject (dtb__64, dtb__65, dtb__66, dtb__67, dtb__68, dtb__69) -> dtb__64
  | _ -> failwith "DT: impossible branch"
))

let v_Vuna_dCompiler_dLoader_dModules_dprojectEntryImports = (fun mc0 -> (match mc0 with
  | C_Vuna_dCompiler_dLoader_dModules_dProject_Vuna_dCompiler_dLoader_dModules_dProject (dtb__70, dtb__71, dtb__72, dtb__73, dtb__74, dtb__75) -> dtb__71
  | _ -> failwith "DT: impossible branch"
))

let v_Vuna_dCompiler_dLoader_dModules_dprojectEntryAllImports = (fun mc0 -> (match mc0 with
  | C_Vuna_dCompiler_dLoader_dModules_dProject_Vuna_dCompiler_dLoader_dModules_dProject (dtb__76, dtb__77, dtb__78, dtb__79, dtb__80, dtb__81) -> ((v_Base_dList_dappend dtb__77) dtb__78)
  | _ -> failwith "DT: impossible branch"
))

let v_Vuna_dCompiler_dLoader_dModules_dprojectModules = (fun mc0 -> (match mc0 with
  | C_Vuna_dCompiler_dLoader_dModules_dProject_Vuna_dCompiler_dLoader_dModules_dProject (dtb__82, dtb__83, dtb__84, dtb__85, dtb__86, dtb__87) -> dtb__85
  | _ -> failwith "DT: impossible branch"
))

let v_Vuna_dCompiler_dLoader_dModules_dprojectEntryPkg = (fun mc0 -> (match mc0 with
  | C_Vuna_dCompiler_dLoader_dModules_dProject_Vuna_dCompiler_dLoader_dModules_dProject (dtb__88, dtb__89, dtb__90, dtb__91, dtb__92, dtb__93) -> dtb__92
  | _ -> failwith "DT: impossible branch"
))

let v_Vuna_dCompiler_dLoader_dModules_dprojectEntryCapabilities = (fun mc0 -> (match mc0 with
  | C_Vuna_dCompiler_dLoader_dModules_dProject_Vuna_dCompiler_dLoader_dModules_dProject (dtb__94, dtb__95, dtb__96, dtb__97, dtb__98, dtb__99) -> dtb__99
  | _ -> failwith "DT: impossible branch"
))

let rec v_Vuna_dCompiler_dLoader_dModules_dallIdentChars = (fun chars -> (match chars with
  | C_Base_dList_dList_Base_dList_dNil -> true
  | C_Base_dList_dList_Base_dList_dCons (dtb__100, dtb__101) -> (if (if (v_Vuna_dCompiler_dFrontend_dLexer_disIdentStart dtb__100) then true else (v_Vuna_dCompiler_dFrontend_dLexer_disDigit dtb__100)) then (v_Vuna_dCompiler_dLoader_dModules_dallIdentChars dtb__101) else false)
  | _ -> failwith "DT: impossible branch"
))

let v_Vuna_dCompiler_dLoader_dModules_dvalidSegment = (fun seg -> (match (dtp_unpack seg) with
  | C_Base_dList_dList_Base_dList_dNil -> false
  | C_Base_dList_dList_Base_dList_dCons (dtb__102, dtb__103) -> (if (v_Vuna_dCompiler_dFrontend_dLexer_disUpperChar dtb__102) then (v_Vuna_dCompiler_dLoader_dModules_dallIdentChars dtb__103) else false)
  | _ -> failwith "DT: impossible branch"
))

let rec v_Vuna_dCompiler_dLoader_dModules_dallSegmentsValid = (fun segs -> (match segs with
  | C_Base_dList_dList_Base_dList_dNil -> false
  | C_Base_dList_dList_Base_dList_dCons (dtb__104, dtb__105) -> (if (v_Vuna_dCompiler_dLoader_dModules_dvalidSegment dtb__104) then (match dtb__105 with
  | C_Base_dList_dList_Base_dList_dNil -> true
  | _ -> (v_Vuna_dCompiler_dLoader_dModules_dallSegmentsValid dtb__105)
) else false)
  | _ -> failwith "DT: impossible branch"
))

let v_Vuna_dCompiler_dLoader_dModules_dvalidModuleName = (fun name -> (match (v_Vuna_dCompiler_dCommon_dsplitOnDot name) with
  | C_Base_dList_dList_Base_dList_dNil -> false
  | dtb__106 -> (v_Vuna_dCompiler_dLoader_dModules_dallSegmentsValid dtb__106)
))

let v_Vuna_dCompiler_dLoader_dModules_dmangle = (fun prefix -> (fun name -> (if ((bi_eq_str prefix) "") then name else ((bi_concat prefix) ((bi_concat ".") name)))))

let v_Vuna_dCompiler_dLoader_dModules_dimportName = (fun mc0 -> (match mc0 with
  | C_Vuna_dCompiler_dFrontend_dAst_dImport_Vuna_dCompiler_dFrontend_dAst_dImport (dtb__107, dtb__108, dtb__109, dtb__110) -> dtb__107
  | _ -> failwith "DT: impossible branch"
))

let v_Vuna_dCompiler_dLoader_dModules_dimportIsQualified = (fun mc0 -> (match mc0 with
  | C_Vuna_dCompiler_dFrontend_dAst_dImport_Vuna_dCompiler_dFrontend_dAst_dImport (dtb__111, dtb__112, dtb__113, dtb__114) -> dtb__112
  | _ -> failwith "DT: impossible branch"
))

let v_Vuna_dCompiler_dLoader_dModules_dimportAlias = (fun mc0 -> (match mc0 with
  | C_Vuna_dCompiler_dFrontend_dAst_dImport_Vuna_dCompiler_dFrontend_dAst_dImport (dtb__115, dtb__116, dtb__117, dtb__118) -> dtb__117
  | _ -> failwith "DT: impossible branch"
))

let v_Vuna_dCompiler_dLoader_dModules_dimportModuleNames = (fun imports -> ((v_Base_dList_dmap v_Vuna_dCompiler_dLoader_dModules_dimportName) imports))

let rec v_Vuna_dCompiler_dLoader_dModules_dhasDuplicateName = (fun mc0 -> (match mc0 with
  | C_Base_dList_dList_Base_dList_dCons (dtb__119, dtb__120) -> (if ((v_Base_dList_dmemName dtb__119) dtb__120) then true else (v_Vuna_dCompiler_dLoader_dModules_dhasDuplicateName dtb__120))
  | C_Base_dList_dList_Base_dList_dNil -> false
  | _ -> failwith "DT: impossible branch"
))

let rec v_Vuna_dCompiler_dLoader_dModules_dimportAliases = (fun imports -> (match imports with
  | C_Base_dList_dList_Base_dList_dNil -> C_Base_dList_dList_Base_dList_dNil
  | C_Base_dList_dList_Base_dList_dCons (dtb__121, dtb__122) -> (match (v_Vuna_dCompiler_dLoader_dModules_dimportAlias dtb__121) with
  | C_Base_dMaybe_dMaybe_Base_dMaybe_dNothing -> (v_Vuna_dCompiler_dLoader_dModules_dimportAliases dtb__122)
  | C_Base_dMaybe_dMaybe_Base_dMaybe_dJust (dtb__123) -> (C_Base_dList_dList_Base_dList_dCons ((C_Base_dPair_dPair_Base_dPair_dPair (dtb__123, (v_Vuna_dCompiler_dLoader_dModules_dimportName dtb__121))), (v_Vuna_dCompiler_dLoader_dModules_dimportAliases dtb__122)))
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
))

let rec v_Vuna_dCompiler_dLoader_dModules_dcheckImportAliases = (fun label -> (fun moduleNames -> (fun aliases -> (match aliases with
  | C_Base_dList_dList_Base_dList_dNil -> (C_Base_dResult_dResult_Base_dResult_dOk (C_Base_dList_dList_Base_dList_dNil))
  | C_Base_dList_dList_Base_dList_dCons (dtb__124, dtb__125) -> (match dtb__124 with
  | C_Base_dPair_dPair_Base_dPair_dPair (dtb__126, dtb__127) -> (if (v_Vuna_dCompiler_dLoader_dModules_dvalidSegment dtb__126) then (if ((v_Base_dList_dmemName dtb__126) ((v_Base_dList_dmap v_Base_dPair_dfirstOf) dtb__125)) then (C_Base_dResult_dResult_Base_dResult_dErr (((bi_concat label) ((bi_concat ": duplicate module alias ") dtb__126)))) else (if ((v_Base_dList_dmemName dtb__126) moduleNames) then (if ((bi_eq_str dtb__126) dtb__127) then (((v_Vuna_dCompiler_dLoader_dModules_dcheckImportAliases label) moduleNames) dtb__125) else (C_Base_dResult_dResult_Base_dResult_dErr (((bi_concat label) ((bi_concat ": module alias ") ((bi_concat dtb__126) " conflicts with an imported module")))))) else (((v_Vuna_dCompiler_dLoader_dModules_dcheckImportAliases label) moduleNames) dtb__125))) else (C_Base_dResult_dResult_Base_dResult_dErr (((bi_concat label) ((bi_concat ": invalid module alias ") dtb__126)))))
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
))))

let v_Vuna_dCompiler_dLoader_dModules_dvalidateImports = (fun label -> (fun imports -> (if (v_Vuna_dCompiler_dLoader_dModules_dhasDuplicateName (v_Vuna_dCompiler_dLoader_dModules_dimportModuleNames imports)) then (C_Base_dResult_dResult_Base_dResult_dErr (((bi_concat label) ": duplicate import"))) else (((v_Vuna_dCompiler_dLoader_dModules_dcheckImportAliases label) (v_Vuna_dCompiler_dLoader_dModules_dimportModuleNames imports)) (v_Vuna_dCompiler_dLoader_dModules_dimportAliases imports)))))

let rec v_Vuna_dCompiler_dLoader_dModules_dopenModuleNames = (fun imports -> (match imports with
  | C_Base_dList_dList_Base_dList_dNil -> C_Base_dList_dList_Base_dList_dNil
  | C_Base_dList_dList_Base_dList_dCons (dtb__128, dtb__129) -> (if (v_Vuna_dCompiler_dLoader_dModules_dimportIsQualified dtb__128) then (v_Vuna_dCompiler_dLoader_dModules_dopenModuleNames dtb__129) else (C_Base_dList_dList_Base_dList_dCons ((v_Vuna_dCompiler_dLoader_dModules_dimportName dtb__128), (v_Vuna_dCompiler_dLoader_dModules_dopenModuleNames dtb__129))))
  | _ -> failwith "DT: impossible branch"
))

let rec v_Vuna_dCompiler_dLoader_dModules_dfindImportPrefix = (fun imports -> (fun prefix -> (match imports with
  | C_Base_dList_dList_Base_dList_dNil -> C_Base_dMaybe_dMaybe_Base_dMaybe_dNothing
  | C_Base_dList_dList_Base_dList_dCons (dtb__130, dtb__131) -> (if ((bi_eq_str (v_Vuna_dCompiler_dLoader_dModules_dimportName dtb__130)) prefix) then (C_Base_dMaybe_dMaybe_Base_dMaybe_dJust ((v_Vuna_dCompiler_dLoader_dModules_dimportName dtb__130))) else (match (v_Vuna_dCompiler_dLoader_dModules_dimportAlias dtb__130) with
  | C_Base_dMaybe_dMaybe_Base_dMaybe_dJust (dtb__132) -> (if ((bi_eq_str dtb__132) prefix) then (C_Base_dMaybe_dMaybe_Base_dMaybe_dJust ((v_Vuna_dCompiler_dLoader_dModules_dimportName dtb__130))) else ((v_Vuna_dCompiler_dLoader_dModules_dfindImportPrefix dtb__131) prefix))
  | C_Base_dMaybe_dMaybe_Base_dMaybe_dNothing -> ((v_Vuna_dCompiler_dLoader_dModules_dfindImportPrefix dtb__131) prefix)
  | _ -> failwith "DT: impossible branch"
))
  | _ -> failwith "DT: impossible branch"
)))

let rec v_Vuna_dCompiler_dLoader_dModules_d_ujoinNames = (fun mc0 -> (match mc0 with
  | C_Base_dList_dList_Base_dList_dCons (dtb__133, dtb__134) -> (match dtb__134 with
  | C_Base_dList_dList_Base_dList_dNil -> dtb__133
  | _ -> ((bi_concat dtb__133) ((bi_concat ", ") (v_Vuna_dCompiler_dLoader_dModules_d_ujoinNames dtb__134)))
)
  | C_Base_dList_dList_Base_dList_dNil -> ""
  | _ -> failwith "DT: impossible branch"
))

let v_Vuna_dCompiler_dLoader_dModules_dmissingModule = (fun name -> (C_Base_dResult_dResult_Base_dResult_dErr (((bi_concat "loader: internal: module ") ((bi_concat name) " is not loaded (import list and module table disagree)")))))

let v_Vuna_dCompiler_dLoader_dModules_dentryKind = (fun e -> (match e with
  | C_Vuna_dCompiler_dLoader_dModules_dExportEntry_Vuna_dCompiler_dLoader_dModules_dExportEntry (dtb__135, dtb__136, dtb__137, dtb__138) -> dtb__135
  | _ -> failwith "DT: impossible branch"
))

let v_Vuna_dCompiler_dLoader_dModules_dentryPublic = (fun e -> (match e with
  | C_Vuna_dCompiler_dLoader_dModules_dExportEntry_Vuna_dCompiler_dLoader_dModules_dExportEntry (dtb__139, dtb__140, dtb__141, dtb__142) -> dtb__140
  | _ -> failwith "DT: impossible branch"
))

let v_Vuna_dCompiler_dLoader_dModules_dentryTarget = (fun e -> (match e with
  | C_Vuna_dCompiler_dLoader_dModules_dExportEntry_Vuna_dCompiler_dLoader_dModules_dExportEntry (dtb__143, dtb__144, dtb__145, dtb__146) -> dtb__145
  | _ -> failwith "DT: impossible branch"
))

let v_Vuna_dCompiler_dLoader_dModules_dentryParent = (fun e -> (match e with
  | C_Vuna_dCompiler_dLoader_dModules_dExportEntry_Vuna_dCompiler_dLoader_dModules_dExportEntry (dtb__147, dtb__148, dtb__149, dtb__150) -> dtb__150
  | _ -> failwith "DT: impossible branch"
))

let rec v_Vuna_dCompiler_dLoader_dModules_dlookupExport = (fun kinds -> (fun name -> (fun entries -> (match entries with
  | C_Base_dList_dList_Base_dList_dNil -> C_Base_dMaybe_dMaybe_Base_dMaybe_dNothing
  | C_Base_dList_dList_Base_dList_dCons (dtb__151, dtb__152) -> (if (if ((v_Base_dList_dmemName (v_Vuna_dCompiler_dLoader_dModules_dentryKind dtb__151)) kinds) then ((bi_eq_str (v_Vuna_dCompiler_dLoader_dModules_dentryPublic dtb__151)) name) else false) then (C_Base_dMaybe_dMaybe_Base_dMaybe_dJust (dtb__151)) else (((v_Vuna_dCompiler_dLoader_dModules_dlookupExport kinds) name) dtb__152))
  | _ -> failwith "DT: impossible branch"
))))

let v_Vuna_dCompiler_dLoader_dModules_dfindExportValue = (fun entries -> (fun name -> (((v_Vuna_dCompiler_dLoader_dModules_dlookupExport (C_Base_dList_dList_Base_dList_dCons ("val", (C_Base_dList_dList_Base_dList_dCons ("ctor", C_Base_dList_dList_Base_dList_dNil))))) name) entries)))

let v_Vuna_dCompiler_dLoader_dModules_dfindExportCtor = (fun entries -> (fun name -> (((v_Vuna_dCompiler_dLoader_dModules_dlookupExport (C_Base_dList_dList_Base_dList_dCons ("ctor", C_Base_dList_dList_Base_dList_dNil))) name) entries)))

let v_Vuna_dCompiler_dLoader_dModules_dfindExportType = (fun entries -> (fun name -> (((v_Vuna_dCompiler_dLoader_dModules_dlookupExport (C_Base_dList_dList_Base_dList_dCons ("type", C_Base_dList_dList_Base_dList_dNil))) name) entries)))

let rec v_Vuna_dCompiler_dLoader_dModules_dsameTargetRest = (fun e -> (fun pairs -> (match pairs with
  | C_Base_dList_dList_Base_dList_dNil -> true
  | C_Base_dList_dList_Base_dList_dCons (dtb__153, dtb__154) -> (match dtb__153 with
  | C_Base_dPair_dPair_Base_dPair_dPair (dtb__155, dtb__156) -> (if ((bi_eq_str (v_Vuna_dCompiler_dLoader_dModules_dentryTarget e)) (v_Vuna_dCompiler_dLoader_dModules_dentryTarget dtb__156)) then ((v_Vuna_dCompiler_dLoader_dModules_dsameTargetRest e) dtb__154) else false)
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
)))

let v_Vuna_dCompiler_dLoader_dModules_dunifyEntryPairs = (fun mc0 -> (fun mc1 -> (fun mc2 -> (fun mc3 -> (match mc3 with
  | C_Base_dList_dList_Base_dList_dCons (dtb__157, dtb__158) -> (if ((v_Vuna_dCompiler_dLoader_dModules_dsameTargetRest (v_Base_dPair_dsecondOf dtb__157)) dtb__158) then (C_Base_dResult_dResult_Base_dResult_dOk (dtb__157)) else (C_Base_dResult_dResult_Base_dResult_dErr (((bi_concat mc0) ((bi_concat ": ambiguous ") ((bi_concat mc1) ((bi_concat " ") ((bi_concat mc2) ((bi_concat " (imported from ") ((bi_concat (v_Vuna_dCompiler_dLoader_dModules_d_ujoinNames ((v_Base_dList_dmap v_Base_dPair_dfirstOf) (C_Base_dList_dList_Base_dList_dCons (dtb__157, dtb__158))))) "); qualify it"))))))))))
  | C_Base_dList_dList_Base_dList_dNil -> (C_Base_dResult_dResult_Base_dResult_dErr (((bi_concat mc0) ((bi_concat ": unknown ") ((bi_concat mc1) ((bi_concat " ") mc2))))))
  | _ -> failwith "DT: impossible branch"
)))))

let v_Vuna_dCompiler_dLoader_dModules_dmodulePath = (fun root -> (fun name -> ((bi_concat (v_Vuna_dCompiler_dPackages_dPkg_drootDir root)) ((bi_concat "/") ((bi_concat (v_Vuna_dCompiler_dCommon_djoinSlashes (v_Vuna_dCompiler_dCommon_dsplitOnDot name))) ".vuna")))))

let v_Vuna_dCompiler_dLoader_dModules_drootAllows = (fun importerPkg -> (fun root -> (fun name -> (match (v_Vuna_dCompiler_dPackages_dPkg_drootExports root) with
  | C_Base_dMaybe_dMaybe_Base_dMaybe_dNothing -> true
  | C_Base_dMaybe_dMaybe_Base_dMaybe_dJust (dtb__159) -> (if ((bi_eq_str (v_Vuna_dCompiler_dPackages_dPkg_drootName root)) importerPkg) then true else ((v_Base_dList_dmemName name) dtb__159))
  | _ -> failwith "DT: impossible branch"
))))

let rec v_Vuna_dCompiler_dLoader_dModules_dcollectModuleFiles = (fun roots -> (fun name -> (fun importerPkg -> (fun allowed -> (fun hidden -> (match roots with
  | C_Base_dList_dList_Base_dList_dNil -> (C_Base_dPair_dPair_Base_dPair_dPair ((v_Base_dList_dreverse allowed), (v_Base_dList_dreverse hidden)))
  | C_Base_dList_dList_Base_dList_dCons (dtb__160, dtb__161) -> ((fun path -> (if (dtp_fileExists path) then (if (((v_Vuna_dCompiler_dLoader_dModules_drootAllows importerPkg) dtb__160) name) then (((((v_Vuna_dCompiler_dLoader_dModules_dcollectModuleFiles dtb__161) name) importerPkg) (C_Base_dList_dList_Base_dList_dCons ((C_Base_dPair_dPair_Base_dPair_dPair (path, dtb__160)), allowed))) hidden) else (((((v_Vuna_dCompiler_dLoader_dModules_dcollectModuleFiles dtb__161) name) importerPkg) allowed) (C_Base_dList_dList_Base_dList_dCons ((v_Vuna_dCompiler_dPackages_dPkg_drootName dtb__160), hidden)))) else (((((v_Vuna_dCompiler_dLoader_dModules_dcollectModuleFiles dtb__161) name) importerPkg) allowed) hidden))) ((v_Vuna_dCompiler_dLoader_dModules_dmodulePath dtb__160) name))
  | _ -> failwith "DT: impossible branch"
))))))

let v_Vuna_dCompiler_dLoader_dModules_d_ujoinRootDirs = (fun roots -> (v_Vuna_dCompiler_dLoader_dModules_d_ujoinNames ((v_Base_dList_dmap v_Vuna_dCompiler_dPackages_dPkg_drootDir) roots)))

let v_Vuna_dCompiler_dLoader_dModules_dcandidateDir = (fun candidate -> (v_Vuna_dCompiler_dPackages_dPkg_drootDir (v_Base_dPair_dsecondOf candidate)))

let v_Vuna_dCompiler_dLoader_dModules_dfindModuleFile = (fun roots -> (fun name -> (fun importerPkg -> (match (((((v_Vuna_dCompiler_dLoader_dModules_dcollectModuleFiles roots) name) importerPkg) C_Base_dList_dList_Base_dList_dNil) C_Base_dList_dList_Base_dList_dNil) with
  | C_Base_dPair_dPair_Base_dPair_dPair (dtb__162, dtb__163) -> ((fun nd_uscrut -> (match nd_uscrut with
  | C_Base_dList_dList_Base_dList_dCons (dtb__164, dtb__165) -> (match dtb__165 with
  | C_Base_dList_dList_Base_dList_dNil -> (C_Base_dResult_dResult_Base_dResult_dOk (dtb__164))
  | _ -> (C_Base_dResult_dResult_Base_dResult_dErr (((bi_concat "ambiguous module ") ((bi_concat name) ((bi_concat " (found in: ") ((bi_concat (v_Vuna_dCompiler_dLoader_dModules_d_ujoinNames ((v_Base_dList_dmap v_Vuna_dCompiler_dLoader_dModules_dcandidateDir) dtb__162))) ")"))))))
)
  | C_Base_dList_dList_Base_dList_dNil -> (match dtb__163 with
  | C_Base_dList_dList_Base_dList_dNil -> (((v_Vuna_dCompiler_dLoader_dDiagnostics_dldErr2 (C_Vuna_dCompiler_dLoader_dDiagnostics_dLdDiag_Vuna_dCompiler_dLoader_dDiagnostics_dModuleNotFound (name, (v_Vuna_dCompiler_dLoader_dModules_d_ujoinRootDirs roots)))) name) (v_Vuna_dCompiler_dLoader_dModules_d_ujoinRootDirs roots))
  | dtb__166 -> (((v_Vuna_dCompiler_dLoader_dDiagnostics_dldErr2 (C_Vuna_dCompiler_dLoader_dDiagnostics_dLdDiag_Vuna_dCompiler_dLoader_dDiagnostics_dModuleNotExported (name, (v_Vuna_dCompiler_dLoader_dModules_d_ujoinNames dtb__163)))) name) (v_Vuna_dCompiler_dLoader_dModules_d_ujoinNames dtb__163))
)
  | _ -> failwith "DT: impossible branch"
)) dtb__162)
  | _ -> failwith "DT: impossible branch"
))))

let rec v_Vuna_dCompiler_dLoader_dModules_dfindModule = (fun modules -> (fun name -> (match modules with
  | C_Base_dList_dList_Base_dList_dNil -> C_Base_dMaybe_dMaybe_Base_dMaybe_dNothing
  | C_Base_dList_dList_Base_dList_dCons (dtb__167, dtb__168) -> (match dtb__167 with
  | C_Vuna_dCompiler_dLoader_dModules_dModule_Vuna_dCompiler_dLoader_dModules_dModule (dtb__169, dtb__170, dtb__171, dtb__172, dtb__173, dtb__174, dtb__175) -> (if ((bi_eq_str dtb__169) name) then (C_Base_dMaybe_dMaybe_Base_dMaybe_dJust ((C_Vuna_dCompiler_dLoader_dModules_dModule_Vuna_dCompiler_dLoader_dModules_dModule (dtb__169, dtb__170, dtb__171, dtb__172, dtb__173, dtb__174, dtb__175)))) else ((v_Vuna_dCompiler_dLoader_dModules_dfindModule dtb__168) name))
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
)))

let v_Vuna_dCompiler_dLoader_dModules_dmoduleDecls = (fun modules -> (fun name -> (match ((v_Vuna_dCompiler_dLoader_dModules_dfindModule modules) name) with
  | C_Base_dMaybe_dMaybe_Base_dMaybe_dJust (dtb__176) -> (match dtb__176 with
  | C_Vuna_dCompiler_dLoader_dModules_dModule_Vuna_dCompiler_dLoader_dModules_dModule (dtb__177, dtb__178, dtb__179, dtb__180, dtb__181, dtb__182, dtb__183) -> (C_Base_dResult_dResult_Base_dResult_dOk (dtb__181))
  | _ -> failwith "DT: impossible branch"
)
  | C_Base_dMaybe_dMaybe_Base_dMaybe_dNothing -> (v_Vuna_dCompiler_dLoader_dModules_dmissingModule name)
  | _ -> failwith "DT: impossible branch"
)))

let v_Vuna_dCompiler_dLoader_dModules_dmoduleCtors = (fun modules -> (fun name -> ((v_Base_dResult_dandThen ((v_Vuna_dCompiler_dLoader_dModules_dmoduleDecls modules) name)) (fun decls -> (C_Base_dResult_dResult_Base_dResult_dOk ((v_Vuna_dCompiler_dFrontend_dAst_dctorsOf decls)))))))

let v_Vuna_dCompiler_dLoader_dModules_dexportsOf = (fun modules -> (fun name -> (match ((v_Vuna_dCompiler_dLoader_dModules_dfindModule modules) name) with
  | C_Base_dMaybe_dMaybe_Base_dMaybe_dJust (dtb__184) -> (match dtb__184 with
  | C_Vuna_dCompiler_dLoader_dModules_dModule_Vuna_dCompiler_dLoader_dModules_dModule (dtb__185, dtb__186, dtb__187, dtb__188, dtb__189, dtb__190, dtb__191) -> (C_Base_dResult_dResult_Base_dResult_dOk (dtb__190))
  | _ -> failwith "DT: impossible branch"
)
  | C_Base_dMaybe_dMaybe_Base_dMaybe_dNothing -> (v_Vuna_dCompiler_dLoader_dModules_dmissingModule name)
  | _ -> failwith "DT: impossible branch"
)))

let rec v_Vuna_dCompiler_dLoader_dModules_dmodulesExportingValueFrom = (fun modules -> (fun names -> (fun name -> (match names with
  | C_Base_dList_dList_Base_dList_dNil -> (C_Base_dResult_dResult_Base_dResult_dOk (C_Base_dList_dList_Base_dList_dNil))
  | C_Base_dList_dList_Base_dList_dCons (dtb__192, dtb__193) -> ((v_Base_dResult_dandThen ((v_Vuna_dCompiler_dLoader_dModules_dexportsOf modules) dtb__192)) (fun es -> (match ((v_Vuna_dCompiler_dLoader_dModules_dfindExportValue es) name) with
  | C_Base_dMaybe_dMaybe_Base_dMaybe_dJust (dtb__194) -> ((v_Base_dResult_dandThen (((v_Vuna_dCompiler_dLoader_dModules_dmodulesExportingValueFrom modules) dtb__193) name)) (fun more -> (C_Base_dResult_dResult_Base_dResult_dOk ((C_Base_dList_dList_Base_dList_dCons ((C_Base_dPair_dPair_Base_dPair_dPair (dtb__192, dtb__194)), more))))))
  | C_Base_dMaybe_dMaybe_Base_dMaybe_dNothing -> (((v_Vuna_dCompiler_dLoader_dModules_dmodulesExportingValueFrom modules) dtb__193) name)
  | _ -> failwith "DT: impossible branch"
)))
  | _ -> failwith "DT: impossible branch"
))))

let v_Vuna_dCompiler_dLoader_dModules_dmodulesExportingValue = (fun modules -> (fun imports -> (fun name -> (((v_Vuna_dCompiler_dLoader_dModules_dmodulesExportingValueFrom modules) (v_Vuna_dCompiler_dLoader_dModules_dopenModuleNames imports)) name))))

let rec v_Vuna_dCompiler_dLoader_dModules_dmodulesExportingCtorFrom = (fun modules -> (fun names -> (fun name -> (match names with
  | C_Base_dList_dList_Base_dList_dNil -> (C_Base_dResult_dResult_Base_dResult_dOk (C_Base_dList_dList_Base_dList_dNil))
  | C_Base_dList_dList_Base_dList_dCons (dtb__195, dtb__196) -> ((v_Base_dResult_dandThen ((v_Vuna_dCompiler_dLoader_dModules_dexportsOf modules) dtb__195)) (fun es -> (match ((v_Vuna_dCompiler_dLoader_dModules_dfindExportCtor es) name) with
  | C_Base_dMaybe_dMaybe_Base_dMaybe_dJust (dtb__197) -> ((v_Base_dResult_dandThen (((v_Vuna_dCompiler_dLoader_dModules_dmodulesExportingCtorFrom modules) dtb__196) name)) (fun more -> (C_Base_dResult_dResult_Base_dResult_dOk ((C_Base_dList_dList_Base_dList_dCons ((C_Base_dPair_dPair_Base_dPair_dPair (dtb__195, dtb__197)), more))))))
  | C_Base_dMaybe_dMaybe_Base_dMaybe_dNothing -> (((v_Vuna_dCompiler_dLoader_dModules_dmodulesExportingCtorFrom modules) dtb__196) name)
  | _ -> failwith "DT: impossible branch"
)))
  | _ -> failwith "DT: impossible branch"
))))

let v_Vuna_dCompiler_dLoader_dModules_dmodulesExportingCtor = (fun modules -> (fun imports -> (fun name -> (((v_Vuna_dCompiler_dLoader_dModules_dmodulesExportingCtorFrom modules) (v_Vuna_dCompiler_dLoader_dModules_dopenModuleNames imports)) name))))

let rec v_Vuna_dCompiler_dLoader_dModules_dmodulesExportingTypeFrom = (fun modules -> (fun names -> (fun name -> (match names with
  | C_Base_dList_dList_Base_dList_dNil -> (C_Base_dResult_dResult_Base_dResult_dOk (C_Base_dList_dList_Base_dList_dNil))
  | C_Base_dList_dList_Base_dList_dCons (dtb__198, dtb__199) -> ((v_Base_dResult_dandThen ((v_Vuna_dCompiler_dLoader_dModules_dexportsOf modules) dtb__198)) (fun es -> (match ((v_Vuna_dCompiler_dLoader_dModules_dfindExportType es) name) with
  | C_Base_dMaybe_dMaybe_Base_dMaybe_dJust (dtb__200) -> ((v_Base_dResult_dandThen (((v_Vuna_dCompiler_dLoader_dModules_dmodulesExportingTypeFrom modules) dtb__199) name)) (fun more -> (C_Base_dResult_dResult_Base_dResult_dOk ((C_Base_dList_dList_Base_dList_dCons ((C_Base_dPair_dPair_Base_dPair_dPair (dtb__198, dtb__200)), more))))))
  | C_Base_dMaybe_dMaybe_Base_dMaybe_dNothing -> (((v_Vuna_dCompiler_dLoader_dModules_dmodulesExportingTypeFrom modules) dtb__199) name)
  | _ -> failwith "DT: impossible branch"
)))
  | _ -> failwith "DT: impossible branch"
))))

let v_Vuna_dCompiler_dLoader_dModules_dmodulesExportingType = (fun modules -> (fun imports -> (fun name -> (((v_Vuna_dCompiler_dLoader_dModules_dmodulesExportingTypeFrom modules) (v_Vuna_dCompiler_dLoader_dModules_dopenModuleNames imports)) name))))

let v_Vuna_dCompiler_dLoader_dModules_drefKind = (fun mc0 -> (match mc0 with
  | C_Vuna_dCompiler_dLoader_dModules_dExportRef_Vuna_dCompiler_dLoader_dModules_dExportRef (dtb__201, dtb__202, dtb__203) -> dtb__201
  | _ -> failwith "DT: impossible branch"
))

let v_Vuna_dCompiler_dLoader_dModules_drefTarget = (fun mc0 -> (match mc0 with
  | C_Vuna_dCompiler_dLoader_dModules_dExportRef_Vuna_dCompiler_dLoader_dModules_dExportRef (dtb__204, dtb__205, dtb__206) -> dtb__205
  | _ -> failwith "DT: impossible branch"
))
