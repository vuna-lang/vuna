open Vuna_runtime
open Base_dPair
open Base_dBool
open Base_dMonad
open Base_dMaybe
open Base_dEq
open Base_dOrd
open Base_dInt
open Base_dShow
open Base_dNat
open Base_dList
open Base_dResult
open Base_dString
open Prelude
open Vuna_dCompiler_dCommon
open Vuna_dCompiler_dFrontend_dToml
open Vuna_dCompiler_dFrontend_dManifest
open Base_dIO
open Vuna_dCompiler_dPackages_dPkg
open Base_dArray
open Base_dHashMap
open Vuna_dCompiler_dDebug
open Base_dVec
open Vuna_dCompiler_dDiagnostics_dCommon
open Vuna_dCompiler_dDiagnostics_dCg
open Vuna_dCompiler_dDiagnostics_dTc
open Vuna_dCompiler_dDiagnostics
open Vuna_dCompiler_dFrontend_dAst
open Vuna_dCompiler_dFrontend_dDiagnostics
open Vuna_dCompiler_dFrontend_dLexer
open Vuna_dCompiler_dFrontend_dParser_dSupport
open Vuna_dCompiler_dFrontend_dParser
open Vuna_dCompiler_dLoader_dDiagnostics
open Vuna_dCompiler_dLoader_dFixity
type t_Vuna_dCompiler_dLoader_dModules_dModule = C_Vuna_dCompiler_dLoader_dModules_dModule_Vuna_dCompiler_dLoader_dModules_dModule of (string) * (string) * (t_Vuna_dCompiler_dFrontend_dAst_dImport t_Base_dList_dList) * (t_Vuna_dCompiler_dFrontend_dAst_dImport t_Base_dList_dList) * (t_Vuna_dCompiler_dFrontend_dAst_dDecl t_Base_dList_dList) * (t_Vuna_dCompiler_dLoader_dModules_dExportEntry t_Base_dList_dList) * (string t_Base_dList_dList) * (t_Vuna_dCompiler_dFrontend_dAst_dFixityDecl t_Base_dList_dList)
and t_Vuna_dCompiler_dLoader_dModules_dProject = C_Vuna_dCompiler_dLoader_dModules_dProject_Vuna_dCompiler_dLoader_dModules_dProject of (t_Vuna_dCompiler_dFrontend_dAst_dDecl t_Base_dList_dList) * (t_Vuna_dCompiler_dFrontend_dAst_dImport t_Base_dList_dList) * (t_Vuna_dCompiler_dFrontend_dAst_dImport t_Base_dList_dList) * (t_Vuna_dCompiler_dLoader_dModules_dModule t_Base_dList_dList) * (string) * (string t_Base_dList_dList) * (t_Vuna_dCompiler_dFrontend_dAst_dFixityDecl t_Base_dList_dList)
and t_Vuna_dCompiler_dLoader_dModules_dNamespaces = C_Vuna_dCompiler_dLoader_dModules_dNamespaces_Vuna_dCompiler_dLoader_dModules_dNamespaces of (string t_Base_dList_dList) * (string t_Base_dList_dList) * (string t_Base_dList_dList) * (bool t_Base_dHashMap_dHashMap) * (bool t_Base_dHashMap_dHashMap) * (bool t_Base_dHashMap_dHashMap)
and t_Vuna_dCompiler_dLoader_dModules_dExportEntry = C_Vuna_dCompiler_dLoader_dModules_dExportEntry_Vuna_dCompiler_dLoader_dModules_dExportEntry of (string) * (string) * (string) * (string)
and t_Vuna_dCompiler_dLoader_dModules_dExportRef = C_Vuna_dCompiler_dLoader_dModules_dExportRef_Vuna_dCompiler_dLoader_dModules_dExportRef of (string) * (string) * (string)

let rec v_Eq_uVuna_dCompiler_dLoader_dModules_dExportEntry = (C_Dict_uBase_dEq_dEq_MkDict_uBase_dEq_dEq ((fun sx sy -> (match sx with
  | C_Vuna_dCompiler_dLoader_dModules_dExportEntry_Vuna_dCompiler_dLoader_dModules_dExportEntry (dtb__0, dtb__1, dtb__2, dtb__3) -> (match sy with
  | C_Vuna_dCompiler_dLoader_dModules_dExportEntry_Vuna_dCompiler_dLoader_dModules_dExportEntry (dtb__4, dtb__5, dtb__6, dtb__7) -> (if (dtb__0 = dtb__4) then (if (dtb__1 = dtb__5) then (if (dtb__2 = dtb__6) then (dtb__3 = dtb__7) else false) else false) else false)
  | _ -> (0 = 1)
)
  | _ -> failwith "DT: impossible branch"
)), (fun sx sy -> (if (((v_Base_dEq_deq v_Eq_uVuna_dCompiler_dLoader_dModules_dExportEntry) sx) sy) then (0 = 1) else (1 = 1)))))

let v_Vuna_dCompiler_dLoader_dModules_dmoduleNameOf = (fun mc0 -> (match mc0 with
  | C_Vuna_dCompiler_dLoader_dModules_dModule_Vuna_dCompiler_dLoader_dModules_dModule (dtb__8, dtb__9, dtb__10, dtb__11, dtb__12, dtb__13, dtb__14, dtb__15) -> dtb__8
  | _ -> failwith "DT: impossible branch"
))

let v_Vuna_dCompiler_dLoader_dModules_dmodulePackageOf = (fun mc0 -> (match mc0 with
  | C_Vuna_dCompiler_dLoader_dModules_dModule_Vuna_dCompiler_dLoader_dModules_dModule (dtb__16, dtb__17, dtb__18, dtb__19, dtb__20, dtb__21, dtb__22, dtb__23) -> dtb__17
  | _ -> failwith "DT: impossible branch"
))

let v_Vuna_dCompiler_dLoader_dModules_dmoduleImportsOf = (fun mc0 -> (match mc0 with
  | C_Vuna_dCompiler_dLoader_dModules_dModule_Vuna_dCompiler_dLoader_dModules_dModule (dtb__24, dtb__25, dtb__26, dtb__27, dtb__28, dtb__29, dtb__30, dtb__31) -> dtb__26
  | _ -> failwith "DT: impossible branch"
))

let v_Vuna_dCompiler_dLoader_dModules_dmoduleImplicitImportsOf = (fun mc0 -> (match mc0 with
  | C_Vuna_dCompiler_dLoader_dModules_dModule_Vuna_dCompiler_dLoader_dModules_dModule (dtb__32, dtb__33, dtb__34, dtb__35, dtb__36, dtb__37, dtb__38, dtb__39) -> dtb__35
  | _ -> failwith "DT: impossible branch"
))

let v_Vuna_dCompiler_dLoader_dModules_dmoduleAllImportsOf = (fun mc0 -> (match mc0 with
  | C_Vuna_dCompiler_dLoader_dModules_dModule_Vuna_dCompiler_dLoader_dModules_dModule (dtb__40, dtb__41, dtb__42, dtb__43, dtb__44, dtb__45, dtb__46, dtb__47) -> ((v_Base_dList_dappend dtb__42) dtb__43)
  | _ -> failwith "DT: impossible branch"
))

let v_Vuna_dCompiler_dLoader_dModules_dmoduleDeclsOf = (fun mc0 -> (match mc0 with
  | C_Vuna_dCompiler_dLoader_dModules_dModule_Vuna_dCompiler_dLoader_dModules_dModule (dtb__48, dtb__49, dtb__50, dtb__51, dtb__52, dtb__53, dtb__54, dtb__55) -> dtb__52
  | _ -> failwith "DT: impossible branch"
))

let v_Vuna_dCompiler_dLoader_dModules_dmoduleExportsOf = (fun mc0 -> (match mc0 with
  | C_Vuna_dCompiler_dLoader_dModules_dModule_Vuna_dCompiler_dLoader_dModules_dModule (dtb__56, dtb__57, dtb__58, dtb__59, dtb__60, dtb__61, dtb__62, dtb__63) -> dtb__61
  | _ -> failwith "DT: impossible branch"
))

let v_Vuna_dCompiler_dLoader_dModules_dmoduleCapabilities = (fun mc0 -> (match mc0 with
  | C_Vuna_dCompiler_dLoader_dModules_dModule_Vuna_dCompiler_dLoader_dModules_dModule (dtb__64, dtb__65, dtb__66, dtb__67, dtb__68, dtb__69, dtb__70, dtb__71) -> dtb__70
  | _ -> failwith "DT: impossible branch"
))

let v_Vuna_dCompiler_dLoader_dModules_dmoduleFixitiesOf = (fun mc0 -> (match mc0 with
  | C_Vuna_dCompiler_dLoader_dModules_dModule_Vuna_dCompiler_dLoader_dModules_dModule (dtb__72, dtb__73, dtb__74, dtb__75, dtb__76, dtb__77, dtb__78, dtb__79) -> dtb__79
  | _ -> failwith "DT: impossible branch"
))

let v_Vuna_dCompiler_dLoader_dModules_dprojectEntryDecls = (fun mc0 -> (match mc0 with
  | C_Vuna_dCompiler_dLoader_dModules_dProject_Vuna_dCompiler_dLoader_dModules_dProject (dtb__80, dtb__81, dtb__82, dtb__83, dtb__84, dtb__85, dtb__86) -> dtb__80
  | _ -> failwith "DT: impossible branch"
))

let v_Vuna_dCompiler_dLoader_dModules_dprojectEntryImports = (fun mc0 -> (match mc0 with
  | C_Vuna_dCompiler_dLoader_dModules_dProject_Vuna_dCompiler_dLoader_dModules_dProject (dtb__87, dtb__88, dtb__89, dtb__90, dtb__91, dtb__92, dtb__93) -> dtb__88
  | _ -> failwith "DT: impossible branch"
))

let v_Vuna_dCompiler_dLoader_dModules_dprojectEntryAllImports = (fun mc0 -> (match mc0 with
  | C_Vuna_dCompiler_dLoader_dModules_dProject_Vuna_dCompiler_dLoader_dModules_dProject (dtb__94, dtb__95, dtb__96, dtb__97, dtb__98, dtb__99, dtb__100) -> ((v_Base_dList_dappend dtb__95) dtb__96)
  | _ -> failwith "DT: impossible branch"
))

let v_Vuna_dCompiler_dLoader_dModules_dprojectModules = (fun mc0 -> (match mc0 with
  | C_Vuna_dCompiler_dLoader_dModules_dProject_Vuna_dCompiler_dLoader_dModules_dProject (dtb__101, dtb__102, dtb__103, dtb__104, dtb__105, dtb__106, dtb__107) -> dtb__104
  | _ -> failwith "DT: impossible branch"
))

let v_Vuna_dCompiler_dLoader_dModules_dprojectEntryPkg = (fun mc0 -> (match mc0 with
  | C_Vuna_dCompiler_dLoader_dModules_dProject_Vuna_dCompiler_dLoader_dModules_dProject (dtb__108, dtb__109, dtb__110, dtb__111, dtb__112, dtb__113, dtb__114) -> dtb__112
  | _ -> failwith "DT: impossible branch"
))

let v_Vuna_dCompiler_dLoader_dModules_dprojectEntryCapabilities = (fun mc0 -> (match mc0 with
  | C_Vuna_dCompiler_dLoader_dModules_dProject_Vuna_dCompiler_dLoader_dModules_dProject (dtb__115, dtb__116, dtb__117, dtb__118, dtb__119, dtb__120, dtb__121) -> dtb__120
  | _ -> failwith "DT: impossible branch"
))

let v_Vuna_dCompiler_dLoader_dModules_dprojectEntryFixities = (fun mc0 -> (match mc0 with
  | C_Vuna_dCompiler_dLoader_dModules_dProject_Vuna_dCompiler_dLoader_dModules_dProject (dtb__122, dtb__123, dtb__124, dtb__125, dtb__126, dtb__127, dtb__128) -> dtb__128
  | _ -> failwith "DT: impossible branch"
))

let v_Vuna_dCompiler_dLoader_dModules_dnsValues = (fun mc0 -> (match mc0 with
  | C_Vuna_dCompiler_dLoader_dModules_dNamespaces_Vuna_dCompiler_dLoader_dModules_dNamespaces (dtb__129, dtb__130, dtb__131, dtb__132, dtb__133, dtb__134) -> dtb__129
  | _ -> failwith "DT: impossible branch"
))

let v_Vuna_dCompiler_dLoader_dModules_dnsCtors = (fun mc0 -> (match mc0 with
  | C_Vuna_dCompiler_dLoader_dModules_dNamespaces_Vuna_dCompiler_dLoader_dModules_dNamespaces (dtb__135, dtb__136, dtb__137, dtb__138, dtb__139, dtb__140) -> dtb__136
  | _ -> failwith "DT: impossible branch"
))

let v_Vuna_dCompiler_dLoader_dModules_dnsTypes = (fun mc0 -> (match mc0 with
  | C_Vuna_dCompiler_dLoader_dModules_dNamespaces_Vuna_dCompiler_dLoader_dModules_dNamespaces (dtb__141, dtb__142, dtb__143, dtb__144, dtb__145, dtb__146) -> dtb__143
  | _ -> failwith "DT: impossible branch"
))

let v_Vuna_dCompiler_dLoader_dModules_dnsValueSet = (fun mc0 -> (match mc0 with
  | C_Vuna_dCompiler_dLoader_dModules_dNamespaces_Vuna_dCompiler_dLoader_dModules_dNamespaces (dtb__147, dtb__148, dtb__149, dtb__150, dtb__151, dtb__152) -> dtb__150
  | _ -> failwith "DT: impossible branch"
))

let v_Vuna_dCompiler_dLoader_dModules_dnsCtorSet = (fun mc0 -> (match mc0 with
  | C_Vuna_dCompiler_dLoader_dModules_dNamespaces_Vuna_dCompiler_dLoader_dModules_dNamespaces (dtb__153, dtb__154, dtb__155, dtb__156, dtb__157, dtb__158) -> dtb__157
  | _ -> failwith "DT: impossible branch"
))

let v_Vuna_dCompiler_dLoader_dModules_dnsTypeSet = (fun mc0 -> (match mc0 with
  | C_Vuna_dCompiler_dLoader_dModules_dNamespaces_Vuna_dCompiler_dLoader_dModules_dNamespaces (dtb__159, dtb__160, dtb__161, dtb__162, dtb__163, dtb__164) -> dtb__164
  | _ -> failwith "DT: impossible branch"
))

let rec v_Vuna_dCompiler_dLoader_dModules_dallIdentChars = (fun mc0 -> (match mc0 with
  | C_Base_dList_dList_Base_dList_dCons (dtb__165, dtb__166) -> (if (if (v_Vuna_dCompiler_dFrontend_dLexer_disIdentStart dtb__165) then true else (v_Vuna_dCompiler_dFrontend_dLexer_disDigit dtb__165)) then (v_Vuna_dCompiler_dLoader_dModules_dallIdentChars dtb__166) else false)
  | C_Base_dList_dList_Base_dList_dNil -> true
  | _ -> failwith "DT: impossible branch"
))

let v_Vuna_dCompiler_dLoader_dModules_dvalidSegment = (fun seg -> (match (dtp_unpack seg) with
  | C_Base_dList_dList_Base_dList_dNil -> false
  | C_Base_dList_dList_Base_dList_dCons (dtb__167, dtb__168) -> (if (v_Vuna_dCompiler_dFrontend_dLexer_disUpperChar dtb__167) then (v_Vuna_dCompiler_dLoader_dModules_dallIdentChars dtb__168) else false)
  | _ -> failwith "DT: impossible branch"
))

let rec v_Vuna_dCompiler_dLoader_dModules_dallSegmentsValid = (fun mc0 -> (match mc0 with
  | C_Base_dList_dList_Base_dList_dCons (dtb__169, dtb__170) -> (if (v_Vuna_dCompiler_dLoader_dModules_dvalidSegment dtb__169) then (match dtb__170 with
  | C_Base_dList_dList_Base_dList_dNil -> true
  | _ -> (v_Vuna_dCompiler_dLoader_dModules_dallSegmentsValid dtb__170)
) else false)
  | C_Base_dList_dList_Base_dList_dNil -> false
  | _ -> failwith "DT: impossible branch"
))

let v_Vuna_dCompiler_dLoader_dModules_dvalidModuleName = (fun name -> (match (v_Vuna_dCompiler_dCommon_dsplitOnDot name) with
  | C_Base_dList_dList_Base_dList_dNil -> false
  | dtb__171 -> (v_Vuna_dCompiler_dLoader_dModules_dallSegmentsValid dtb__171)
))

let v_Vuna_dCompiler_dLoader_dModules_dmangle = (fun prefix name -> (if (prefix = "") then name else (String.concat "" [prefix; "."; name])))

let v_Vuna_dCompiler_dLoader_dModules_dimportName = (fun mc0 -> (match mc0 with
  | C_Vuna_dCompiler_dFrontend_dAst_dImport_Vuna_dCompiler_dFrontend_dAst_dImport (dtb__172, dtb__173, dtb__174, dtb__175) -> dtb__172
  | _ -> failwith "DT: impossible branch"
))

let v_Vuna_dCompiler_dLoader_dModules_dimportIsQualified = (fun mc0 -> (match mc0 with
  | C_Vuna_dCompiler_dFrontend_dAst_dImport_Vuna_dCompiler_dFrontend_dAst_dImport (dtb__176, dtb__177, dtb__178, dtb__179) -> dtb__177
  | _ -> failwith "DT: impossible branch"
))

let v_Vuna_dCompiler_dLoader_dModules_dimportAlias = (fun mc0 -> (match mc0 with
  | C_Vuna_dCompiler_dFrontend_dAst_dImport_Vuna_dCompiler_dFrontend_dAst_dImport (dtb__180, dtb__181, dtb__182, dtb__183) -> dtb__182
  | _ -> failwith "DT: impossible branch"
))

let v_Vuna_dCompiler_dLoader_dModules_dimportModuleNames = (fun imports -> ((v_Base_dList_dmap v_Vuna_dCompiler_dLoader_dModules_dimportName) imports))

let rec v_Vuna_dCompiler_dLoader_dModules_dhasDuplicateName = (fun mc0 -> (match mc0 with
  | C_Base_dList_dList_Base_dList_dCons (dtb__184, dtb__185) -> (if ((v_Base_dList_dmemName dtb__184) dtb__185) then true else (v_Vuna_dCompiler_dLoader_dModules_dhasDuplicateName dtb__185))
  | C_Base_dList_dList_Base_dList_dNil -> false
  | _ -> failwith "DT: impossible branch"
))

let rec v_Vuna_dCompiler_dLoader_dModules_dimportAliases = (fun mc0 -> (match mc0 with
  | C_Base_dList_dList_Base_dList_dCons (dtb__186, dtb__187) -> (match (v_Vuna_dCompiler_dLoader_dModules_dimportAlias dtb__186) with
  | C_Base_dMaybe_dMaybe_Base_dMaybe_dNothing -> (v_Vuna_dCompiler_dLoader_dModules_dimportAliases dtb__187)
  | C_Base_dMaybe_dMaybe_Base_dMaybe_dJust (dtb__188) -> (C_Base_dList_dList_Base_dList_dCons ((C_Base_dPair_dPair_Base_dPair_dPair (dtb__188, (v_Vuna_dCompiler_dLoader_dModules_dimportName dtb__186))), (v_Vuna_dCompiler_dLoader_dModules_dimportAliases dtb__187)))
  | _ -> failwith "DT: impossible branch"
)
  | C_Base_dList_dList_Base_dList_dNil -> C_Base_dList_dList_Base_dList_dNil
  | _ -> failwith "DT: impossible branch"
))

let rec v_Vuna_dCompiler_dLoader_dModules_dcheckImportAliases = (fun mc0 mc1 mc2 -> (match mc2 with
  | C_Base_dList_dList_Base_dList_dCons (dtb__189, dtb__190) -> (match dtb__189 with
  | C_Base_dPair_dPair_Base_dPair_dPair (dtb__191, dtb__192) -> (if (v_Vuna_dCompiler_dLoader_dModules_dvalidSegment dtb__191) then (if ((v_Base_dList_dmemName dtb__191) ((v_Base_dList_dmap v_Base_dPair_dfirstOf) dtb__190)) then (C_Base_dResult_dResult_Base_dResult_dErr ((String.concat "" [mc0; ": duplicate module alias "; dtb__191]))) else (if ((v_Base_dList_dmemName dtb__191) mc1) then (if (dtb__191 = dtb__192) then (((v_Vuna_dCompiler_dLoader_dModules_dcheckImportAliases mc0) mc1) dtb__190) else (C_Base_dResult_dResult_Base_dResult_dErr ((String.concat "" [mc0; ": module alias "; dtb__191; " conflicts with an imported module"])))) else (((v_Vuna_dCompiler_dLoader_dModules_dcheckImportAliases mc0) mc1) dtb__190))) else (C_Base_dResult_dResult_Base_dResult_dErr ((String.concat "" [mc0; ": invalid module alias "; dtb__191]))))
  | _ -> failwith "DT: impossible branch"
)
  | C_Base_dList_dList_Base_dList_dNil -> (C_Base_dResult_dResult_Base_dResult_dOk (C_Base_dList_dList_Base_dList_dNil))
  | _ -> failwith "DT: impossible branch"
))

let v_Vuna_dCompiler_dLoader_dModules_dvalidateImports = (fun label imports -> (if (v_Vuna_dCompiler_dLoader_dModules_dhasDuplicateName (v_Vuna_dCompiler_dLoader_dModules_dimportModuleNames imports)) then (C_Base_dResult_dResult_Base_dResult_dErr ((label ^ ": duplicate import"))) else (((v_Vuna_dCompiler_dLoader_dModules_dcheckImportAliases label) (v_Vuna_dCompiler_dLoader_dModules_dimportModuleNames imports)) (v_Vuna_dCompiler_dLoader_dModules_dimportAliases imports))))

let rec v_Vuna_dCompiler_dLoader_dModules_dopenModuleNames = (fun mc0 -> (match mc0 with
  | C_Base_dList_dList_Base_dList_dCons (dtb__193, dtb__194) -> (if (v_Vuna_dCompiler_dLoader_dModules_dimportIsQualified dtb__193) then (v_Vuna_dCompiler_dLoader_dModules_dopenModuleNames dtb__194) else (C_Base_dList_dList_Base_dList_dCons ((v_Vuna_dCompiler_dLoader_dModules_dimportName dtb__193), (v_Vuna_dCompiler_dLoader_dModules_dopenModuleNames dtb__194))))
  | C_Base_dList_dList_Base_dList_dNil -> C_Base_dList_dList_Base_dList_dNil
  | _ -> failwith "DT: impossible branch"
))

let rec v_Vuna_dCompiler_dLoader_dModules_dfindImportPrefix = (fun mc0 mc1 -> (match mc0 with
  | C_Base_dList_dList_Base_dList_dCons (dtb__195, dtb__196) -> (if ((v_Vuna_dCompiler_dLoader_dModules_dimportName dtb__195) = mc1) then (C_Base_dMaybe_dMaybe_Base_dMaybe_dJust ((v_Vuna_dCompiler_dLoader_dModules_dimportName dtb__195))) else (match (v_Vuna_dCompiler_dLoader_dModules_dimportAlias dtb__195) with
  | C_Base_dMaybe_dMaybe_Base_dMaybe_dJust (dtb__197) -> (if (dtb__197 = mc1) then (C_Base_dMaybe_dMaybe_Base_dMaybe_dJust ((v_Vuna_dCompiler_dLoader_dModules_dimportName dtb__195))) else ((v_Vuna_dCompiler_dLoader_dModules_dfindImportPrefix dtb__196) mc1))
  | C_Base_dMaybe_dMaybe_Base_dMaybe_dNothing -> ((v_Vuna_dCompiler_dLoader_dModules_dfindImportPrefix dtb__196) mc1)
  | _ -> failwith "DT: impossible branch"
))
  | C_Base_dList_dList_Base_dList_dNil -> C_Base_dMaybe_dMaybe_Base_dMaybe_dNothing
  | _ -> failwith "DT: impossible branch"
))

let rec v_Vuna_dCompiler_dLoader_dModules_d_ujoinNames = (fun mc0 -> (match mc0 with
  | C_Base_dList_dList_Base_dList_dCons (dtb__198, dtb__199) -> (match dtb__199 with
  | C_Base_dList_dList_Base_dList_dNil -> dtb__198
  | _ -> (String.concat "" [dtb__198; ", "; (v_Vuna_dCompiler_dLoader_dModules_d_ujoinNames dtb__199)])
)
  | C_Base_dList_dList_Base_dList_dNil -> ""
  | _ -> failwith "DT: impossible branch"
))

let v_Vuna_dCompiler_dLoader_dModules_dmissingModule = (fun name -> (C_Base_dResult_dResult_Base_dResult_dErr ((String.concat "" ["loader: internal: module "; name; " is not loaded (import list and module table disagree)"]))))

let v_Vuna_dCompiler_dLoader_dModules_dentryKind = (fun e -> (match e with
  | C_Vuna_dCompiler_dLoader_dModules_dExportEntry_Vuna_dCompiler_dLoader_dModules_dExportEntry (dtb__200, dtb__201, dtb__202, dtb__203) -> dtb__200
  | _ -> failwith "DT: impossible branch"
))

let v_Vuna_dCompiler_dLoader_dModules_dentryPublic = (fun e -> (match e with
  | C_Vuna_dCompiler_dLoader_dModules_dExportEntry_Vuna_dCompiler_dLoader_dModules_dExportEntry (dtb__204, dtb__205, dtb__206, dtb__207) -> dtb__205
  | _ -> failwith "DT: impossible branch"
))

let v_Vuna_dCompiler_dLoader_dModules_dentryTarget = (fun e -> (match e with
  | C_Vuna_dCompiler_dLoader_dModules_dExportEntry_Vuna_dCompiler_dLoader_dModules_dExportEntry (dtb__208, dtb__209, dtb__210, dtb__211) -> dtb__210
  | _ -> failwith "DT: impossible branch"
))

let v_Vuna_dCompiler_dLoader_dModules_dentryParent = (fun e -> (match e with
  | C_Vuna_dCompiler_dLoader_dModules_dExportEntry_Vuna_dCompiler_dLoader_dModules_dExportEntry (dtb__212, dtb__213, dtb__214, dtb__215) -> dtb__215
  | _ -> failwith "DT: impossible branch"
))

let rec v_Vuna_dCompiler_dLoader_dModules_dlookupExport = (fun mc0 mc1 mc2 -> (match mc2 with
  | C_Base_dList_dList_Base_dList_dCons (dtb__216, dtb__217) -> (if (if ((v_Base_dList_dmemName (v_Vuna_dCompiler_dLoader_dModules_dentryKind dtb__216)) mc0) then ((v_Vuna_dCompiler_dLoader_dModules_dentryPublic dtb__216) = mc1) else false) then (C_Base_dMaybe_dMaybe_Base_dMaybe_dJust (dtb__216)) else (((v_Vuna_dCompiler_dLoader_dModules_dlookupExport mc0) mc1) dtb__217))
  | C_Base_dList_dList_Base_dList_dNil -> C_Base_dMaybe_dMaybe_Base_dMaybe_dNothing
  | _ -> failwith "DT: impossible branch"
))

let v_Vuna_dCompiler_dLoader_dModules_dfindExportValue = (fun entries name -> (((v_Vuna_dCompiler_dLoader_dModules_dlookupExport (C_Base_dList_dList_Base_dList_dCons ("val", (C_Base_dList_dList_Base_dList_dCons ("ctor", C_Base_dList_dList_Base_dList_dNil))))) name) entries))

let v_Vuna_dCompiler_dLoader_dModules_dfindExportCtor = (fun entries name -> (((v_Vuna_dCompiler_dLoader_dModules_dlookupExport (C_Base_dList_dList_Base_dList_dCons ("ctor", C_Base_dList_dList_Base_dList_dNil))) name) entries))

let v_Vuna_dCompiler_dLoader_dModules_dfindExportType = (fun entries name -> (((v_Vuna_dCompiler_dLoader_dModules_dlookupExport (C_Base_dList_dList_Base_dList_dCons ("type", C_Base_dList_dList_Base_dList_dNil))) name) entries))

let rec v_Vuna_dCompiler_dLoader_dModules_dsameTargetRest = (fun mc0 mc1 -> (match mc1 with
  | C_Base_dList_dList_Base_dList_dCons (dtb__218, dtb__219) -> (match dtb__218 with
  | C_Base_dPair_dPair_Base_dPair_dPair (dtb__220, dtb__221) -> (if ((v_Vuna_dCompiler_dLoader_dModules_dentryTarget mc0) = (v_Vuna_dCompiler_dLoader_dModules_dentryTarget dtb__221)) then ((v_Vuna_dCompiler_dLoader_dModules_dsameTargetRest mc0) dtb__219) else false)
  | _ -> failwith "DT: impossible branch"
)
  | C_Base_dList_dList_Base_dList_dNil -> true
  | _ -> failwith "DT: impossible branch"
))

let v_Vuna_dCompiler_dLoader_dModules_dunifyEntryPairs = (fun mc0 mc1 mc2 mc3 -> (match mc3 with
  | C_Base_dList_dList_Base_dList_dCons (dtb__222, dtb__223) -> (if ((v_Vuna_dCompiler_dLoader_dModules_dsameTargetRest (v_Base_dPair_dsecondOf dtb__222)) dtb__223) then (C_Base_dResult_dResult_Base_dResult_dOk (dtb__222)) else (C_Base_dResult_dResult_Base_dResult_dErr ((String.concat "" [mc0; ": ambiguous "; mc1; " "; mc2; " (imported from "; (v_Vuna_dCompiler_dLoader_dModules_d_ujoinNames ((v_Base_dList_dmap v_Base_dPair_dfirstOf) (C_Base_dList_dList_Base_dList_dCons (dtb__222, dtb__223)))); "); qualify it"]))))
  | C_Base_dList_dList_Base_dList_dNil -> (C_Base_dResult_dResult_Base_dResult_dErr ((String.concat "" [mc0; ": unknown "; mc1; " "; mc2])))
  | _ -> failwith "DT: impossible branch"
))

let v_Vuna_dCompiler_dLoader_dModules_dmodulePath = (fun root name -> (String.concat "" [(v_Vuna_dCompiler_dPackages_dPkg_drootDir root); "/"; (v_Vuna_dCompiler_dCommon_djoinSlashes (v_Vuna_dCompiler_dCommon_dsplitOnDot name)); ".vuna"]))

let v_Vuna_dCompiler_dLoader_dModules_drootAllows = (fun importerPkg root name -> (match (v_Vuna_dCompiler_dPackages_dPkg_drootExports root) with
  | C_Base_dMaybe_dMaybe_Base_dMaybe_dNothing -> true
  | C_Base_dMaybe_dMaybe_Base_dMaybe_dJust (dtb__224) -> (if ((v_Vuna_dCompiler_dPackages_dPkg_drootName root) = importerPkg) then true else ((v_Base_dList_dmemName name) dtb__224))
  | _ -> failwith "DT: impossible branch"
))

let rec v_Vuna_dCompiler_dLoader_dModules_dcollectModuleFiles = (fun mc0 mc1 mc2 mc3 mc4 -> (match mc0 with
  | C_Base_dList_dList_Base_dList_dCons (dtb__225, dtb__226) -> ((fun path -> (if (v_Base_dIO_drunIO ((fun dtio_0 -> C_Base_dIO_dIO_Base_dIO_dMkIO (fun _ -> dtp_fileExists dtio_0)) path)) then (if (((v_Vuna_dCompiler_dLoader_dModules_drootAllows mc2) dtb__225) mc1) then (((((v_Vuna_dCompiler_dLoader_dModules_dcollectModuleFiles dtb__226) mc1) mc2) (C_Base_dList_dList_Base_dList_dCons ((C_Base_dPair_dPair_Base_dPair_dPair (path, dtb__225)), mc3))) mc4) else (((((v_Vuna_dCompiler_dLoader_dModules_dcollectModuleFiles dtb__226) mc1) mc2) mc3) (C_Base_dList_dList_Base_dList_dCons ((v_Vuna_dCompiler_dPackages_dPkg_drootName dtb__225), mc4)))) else (((((v_Vuna_dCompiler_dLoader_dModules_dcollectModuleFiles dtb__226) mc1) mc2) mc3) mc4))) ((v_Vuna_dCompiler_dLoader_dModules_dmodulePath dtb__225) mc1))
  | C_Base_dList_dList_Base_dList_dNil -> (C_Base_dPair_dPair_Base_dPair_dPair ((v_Base_dList_dreverse mc3), (v_Base_dList_dreverse mc4)))
  | _ -> failwith "DT: impossible branch"
))

let v_Vuna_dCompiler_dLoader_dModules_d_ujoinRootDirs = (fun roots -> (v_Vuna_dCompiler_dLoader_dModules_d_ujoinNames ((v_Base_dList_dmap v_Vuna_dCompiler_dPackages_dPkg_drootDir) roots)))

let v_Vuna_dCompiler_dLoader_dModules_dcandidateDir = (fun candidate -> (v_Vuna_dCompiler_dPackages_dPkg_drootDir (v_Base_dPair_dsecondOf candidate)))

let v_Vuna_dCompiler_dLoader_dModules_dfindModuleFile = (fun roots name importerPkg -> (match (((((v_Vuna_dCompiler_dLoader_dModules_dcollectModuleFiles roots) name) importerPkg) C_Base_dList_dList_Base_dList_dNil) C_Base_dList_dList_Base_dList_dNil) with
  | C_Base_dPair_dPair_Base_dPair_dPair (dtb__227, dtb__228) -> ((fun nd_uscrut7 -> (match nd_uscrut7 with
  | C_Base_dList_dList_Base_dList_dCons (dtb__229, dtb__230) -> (match dtb__230 with
  | C_Base_dList_dList_Base_dList_dNil -> (C_Base_dResult_dResult_Base_dResult_dOk (dtb__229))
  | _ -> (C_Base_dResult_dResult_Base_dResult_dErr ((String.concat "" ["ambiguous module "; name; " (found in: "; (v_Vuna_dCompiler_dLoader_dModules_d_ujoinNames ((v_Base_dList_dmap v_Vuna_dCompiler_dLoader_dModules_dcandidateDir) dtb__227)); ")"])))
)
  | C_Base_dList_dList_Base_dList_dNil -> (match dtb__228 with
  | C_Base_dList_dList_Base_dList_dNil -> (((v_Vuna_dCompiler_dLoader_dDiagnostics_dldErr2 (C_Vuna_dCompiler_dLoader_dDiagnostics_dLdDiag_Vuna_dCompiler_dLoader_dDiagnostics_dModuleNotFound (name, (v_Vuna_dCompiler_dLoader_dModules_d_ujoinRootDirs roots)))) name) (v_Vuna_dCompiler_dLoader_dModules_d_ujoinRootDirs roots))
  | dtb__231 -> (((v_Vuna_dCompiler_dLoader_dDiagnostics_dldErr2 (C_Vuna_dCompiler_dLoader_dDiagnostics_dLdDiag_Vuna_dCompiler_dLoader_dDiagnostics_dModuleNotExported (name, (v_Vuna_dCompiler_dLoader_dModules_d_ujoinNames dtb__228)))) name) (v_Vuna_dCompiler_dLoader_dModules_d_ujoinNames dtb__228))
)
  | _ -> failwith "DT: impossible branch"
)) dtb__227)
  | _ -> failwith "DT: impossible branch"
))

let rec v_Vuna_dCompiler_dLoader_dModules_dfindModule = (fun mc0 mc1 -> (match mc0 with
  | C_Base_dList_dList_Base_dList_dCons (dtb__232, dtb__233) -> (match dtb__232 with
  | C_Vuna_dCompiler_dLoader_dModules_dModule_Vuna_dCompiler_dLoader_dModules_dModule (dtb__234, dtb__235, dtb__236, dtb__237, dtb__238, dtb__239, dtb__240, dtb__241) -> (if (dtb__234 = mc1) then (C_Base_dMaybe_dMaybe_Base_dMaybe_dJust ((C_Vuna_dCompiler_dLoader_dModules_dModule_Vuna_dCompiler_dLoader_dModules_dModule (dtb__234, dtb__235, dtb__236, dtb__237, dtb__238, dtb__239, dtb__240, dtb__241)))) else ((v_Vuna_dCompiler_dLoader_dModules_dfindModule dtb__233) mc1))
  | _ -> failwith "DT: impossible branch"
)
  | C_Base_dList_dList_Base_dList_dNil -> C_Base_dMaybe_dMaybe_Base_dMaybe_dNothing
  | _ -> failwith "DT: impossible branch"
))

let v_Vuna_dCompiler_dLoader_dModules_dmoduleDecls = (fun modules name -> ((fun nd_uscrut2 -> (match nd_uscrut2 with
  | C_Base_dMaybe_dMaybe_Base_dMaybe_dNothing -> (v_Vuna_dCompiler_dLoader_dModules_dmissingModule name)
  | C_Base_dMaybe_dMaybe_Base_dMaybe_dJust (dtb__242) -> (match dtb__242 with
  | C_Vuna_dCompiler_dLoader_dModules_dModule_Vuna_dCompiler_dLoader_dModules_dModule (dtb__243, dtb__244, dtb__245, dtb__246, dtb__247, dtb__248, dtb__249, dtb__250) -> (C_Base_dResult_dResult_Base_dResult_dOk (dtb__247))
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
)) ((v_Vuna_dCompiler_dLoader_dModules_dfindModule modules) name)))

let v_Vuna_dCompiler_dLoader_dModules_dmoduleCtors = (fun modules name -> ((v_Base_dResult_dandThen ((v_Vuna_dCompiler_dLoader_dModules_dmoduleDecls modules) name)) (fun decls -> (C_Base_dResult_dResult_Base_dResult_dOk ((v_Vuna_dCompiler_dFrontend_dAst_dctorsOf decls))))))

let v_Vuna_dCompiler_dLoader_dModules_dexportsOf = (fun modules name -> ((fun nd_uscrut2 -> (match nd_uscrut2 with
  | C_Base_dMaybe_dMaybe_Base_dMaybe_dNothing -> (v_Vuna_dCompiler_dLoader_dModules_dmissingModule name)
  | C_Base_dMaybe_dMaybe_Base_dMaybe_dJust (dtb__251) -> (match dtb__251 with
  | C_Vuna_dCompiler_dLoader_dModules_dModule_Vuna_dCompiler_dLoader_dModules_dModule (dtb__252, dtb__253, dtb__254, dtb__255, dtb__256, dtb__257, dtb__258, dtb__259) -> (C_Base_dResult_dResult_Base_dResult_dOk (dtb__257))
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
)) ((v_Vuna_dCompiler_dLoader_dModules_dfindModule modules) name)))

let rec v_Vuna_dCompiler_dLoader_dModules_dmodulesExportingValueFrom = (fun mc0 mc1 mc2 -> (match mc1 with
  | C_Base_dList_dList_Base_dList_dCons (dtb__260, dtb__261) -> ((v_Base_dResult_dandThen ((v_Vuna_dCompiler_dLoader_dModules_dexportsOf mc0) dtb__260)) (fun es -> (match ((v_Vuna_dCompiler_dLoader_dModules_dfindExportValue es) mc2) with
  | C_Base_dMaybe_dMaybe_Base_dMaybe_dJust (dtb__262) -> ((v_Base_dResult_dandThen (((v_Vuna_dCompiler_dLoader_dModules_dmodulesExportingValueFrom mc0) dtb__261) mc2)) (fun more -> (C_Base_dResult_dResult_Base_dResult_dOk ((C_Base_dList_dList_Base_dList_dCons ((C_Base_dPair_dPair_Base_dPair_dPair (dtb__260, dtb__262)), more))))))
  | C_Base_dMaybe_dMaybe_Base_dMaybe_dNothing -> (((v_Vuna_dCompiler_dLoader_dModules_dmodulesExportingValueFrom mc0) dtb__261) mc2)
  | _ -> failwith "DT: impossible branch"
)))
  | C_Base_dList_dList_Base_dList_dNil -> (C_Base_dResult_dResult_Base_dResult_dOk (C_Base_dList_dList_Base_dList_dNil))
  | _ -> failwith "DT: impossible branch"
))

let v_Vuna_dCompiler_dLoader_dModules_dmodulesExportingValue = (fun modules imports name -> (((v_Vuna_dCompiler_dLoader_dModules_dmodulesExportingValueFrom modules) (v_Vuna_dCompiler_dLoader_dModules_dopenModuleNames imports)) name))

let rec v_Vuna_dCompiler_dLoader_dModules_dmodulesExportingCtorFrom = (fun mc0 mc1 mc2 -> (match mc1 with
  | C_Base_dList_dList_Base_dList_dCons (dtb__263, dtb__264) -> ((v_Base_dResult_dandThen ((v_Vuna_dCompiler_dLoader_dModules_dexportsOf mc0) dtb__263)) (fun es -> (match ((v_Vuna_dCompiler_dLoader_dModules_dfindExportCtor es) mc2) with
  | C_Base_dMaybe_dMaybe_Base_dMaybe_dJust (dtb__265) -> ((v_Base_dResult_dandThen (((v_Vuna_dCompiler_dLoader_dModules_dmodulesExportingCtorFrom mc0) dtb__264) mc2)) (fun more -> (C_Base_dResult_dResult_Base_dResult_dOk ((C_Base_dList_dList_Base_dList_dCons ((C_Base_dPair_dPair_Base_dPair_dPair (dtb__263, dtb__265)), more))))))
  | C_Base_dMaybe_dMaybe_Base_dMaybe_dNothing -> (((v_Vuna_dCompiler_dLoader_dModules_dmodulesExportingCtorFrom mc0) dtb__264) mc2)
  | _ -> failwith "DT: impossible branch"
)))
  | C_Base_dList_dList_Base_dList_dNil -> (C_Base_dResult_dResult_Base_dResult_dOk (C_Base_dList_dList_Base_dList_dNil))
  | _ -> failwith "DT: impossible branch"
))

let v_Vuna_dCompiler_dLoader_dModules_dmodulesExportingCtor = (fun modules imports name -> (((v_Vuna_dCompiler_dLoader_dModules_dmodulesExportingCtorFrom modules) (v_Vuna_dCompiler_dLoader_dModules_dopenModuleNames imports)) name))

let rec v_Vuna_dCompiler_dLoader_dModules_dmodulesExportingTypeFrom = (fun mc0 mc1 mc2 -> (match mc1 with
  | C_Base_dList_dList_Base_dList_dCons (dtb__266, dtb__267) -> ((v_Base_dResult_dandThen ((v_Vuna_dCompiler_dLoader_dModules_dexportsOf mc0) dtb__266)) (fun es -> (match ((v_Vuna_dCompiler_dLoader_dModules_dfindExportType es) mc2) with
  | C_Base_dMaybe_dMaybe_Base_dMaybe_dJust (dtb__268) -> ((v_Base_dResult_dandThen (((v_Vuna_dCompiler_dLoader_dModules_dmodulesExportingTypeFrom mc0) dtb__267) mc2)) (fun more -> (C_Base_dResult_dResult_Base_dResult_dOk ((C_Base_dList_dList_Base_dList_dCons ((C_Base_dPair_dPair_Base_dPair_dPair (dtb__266, dtb__268)), more))))))
  | C_Base_dMaybe_dMaybe_Base_dMaybe_dNothing -> (((v_Vuna_dCompiler_dLoader_dModules_dmodulesExportingTypeFrom mc0) dtb__267) mc2)
  | _ -> failwith "DT: impossible branch"
)))
  | C_Base_dList_dList_Base_dList_dNil -> (C_Base_dResult_dResult_Base_dResult_dOk (C_Base_dList_dList_Base_dList_dNil))
  | _ -> failwith "DT: impossible branch"
))

let v_Vuna_dCompiler_dLoader_dModules_dmodulesExportingType = (fun modules imports name -> (((v_Vuna_dCompiler_dLoader_dModules_dmodulesExportingTypeFrom modules) (v_Vuna_dCompiler_dLoader_dModules_dopenModuleNames imports)) name))

let v_Vuna_dCompiler_dLoader_dModules_drefKind = (fun mc0 -> (match mc0 with
  | C_Vuna_dCompiler_dLoader_dModules_dExportRef_Vuna_dCompiler_dLoader_dModules_dExportRef (dtb__269, dtb__270, dtb__271) -> dtb__269
  | _ -> failwith "DT: impossible branch"
))

let v_Vuna_dCompiler_dLoader_dModules_drefTarget = (fun mc0 -> (match mc0 with
  | C_Vuna_dCompiler_dLoader_dModules_dExportRef_Vuna_dCompiler_dLoader_dModules_dExportRef (dtb__272, dtb__273, dtb__274) -> dtb__273
  | _ -> failwith "DT: impossible branch"
))
