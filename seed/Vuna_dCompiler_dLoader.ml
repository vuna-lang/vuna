open Vuna_runtime
open Base_dPair
open Base_dBool
open Base_dMonad
open Base_dMaybe
open Base_dList
open Base_dIO
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
type   t_Vuna_dCompiler_dLoader_dModule =
    C_Vuna_dCompiler_dLoader_dModule of (string) * (string) * ((t_Vuna_dCompiler_dAst_dImport) list) * ((t_Vuna_dCompiler_dAst_dImport) list) * ((t_Vuna_dCompiler_dAst_dDecl) list) * ((t_Vuna_dCompiler_dLoader_dExportEntry) list)
and   t_Vuna_dCompiler_dLoader_dProject =
    C_Vuna_dCompiler_dLoader_dProject of ((t_Vuna_dCompiler_dAst_dDecl) list) * ((t_Vuna_dCompiler_dAst_dImport) list) * ((t_Vuna_dCompiler_dAst_dImport) list) * ((t_Vuna_dCompiler_dLoader_dModule) list) * (string)
and   t_Vuna_dCompiler_dLoader_dExportEntry =
    C_Vuna_dCompiler_dLoader_dExportEntry of (string) * (string) * (string) * (string)
and   t_Vuna_dCompiler_dLoader_dExportRef =
    C_Vuna_dCompiler_dLoader_dExportRef of (string) * (string) * (string)
let rec show_Vuna_dCompiler_dLoader_dModule v =
  match v with
  | C_Vuna_dCompiler_dLoader_dModule (f0, f1, f2, f3, f4, f5) -> show_ctor "Module" [(show_vstring) f0; (show_vstring) f1; ((fun v -> let rec go = function [] -> "Nil" | x :: xs -> "(Cons " ^ (show_Vuna_dCompiler_dAst_dImport) x ^ " " ^ go xs ^ ")" in go v)) f2; ((fun v -> let rec go = function [] -> "Nil" | x :: xs -> "(Cons " ^ (show_Vuna_dCompiler_dAst_dImport) x ^ " " ^ go xs ^ ")" in go v)) f3; ((fun v -> let rec go = function [] -> "Nil" | x :: xs -> "(Cons " ^ (show_Vuna_dCompiler_dAst_dDecl) x ^ " " ^ go xs ^ ")" in go v)) f4; ((fun v -> let rec go = function [] -> "Nil" | x :: xs -> "(Cons " ^ (show_Vuna_dCompiler_dLoader_dExportEntry) x ^ " " ^ go xs ^ ")" in go v)) f5]
and show_Vuna_dCompiler_dLoader_dProject v =
  match v with
  | C_Vuna_dCompiler_dLoader_dProject (f0, f1, f2, f3, f4) -> show_ctor "Project" [((fun v -> let rec go = function [] -> "Nil" | x :: xs -> "(Cons " ^ (show_Vuna_dCompiler_dAst_dDecl) x ^ " " ^ go xs ^ ")" in go v)) f0; ((fun v -> let rec go = function [] -> "Nil" | x :: xs -> "(Cons " ^ (show_Vuna_dCompiler_dAst_dImport) x ^ " " ^ go xs ^ ")" in go v)) f1; ((fun v -> let rec go = function [] -> "Nil" | x :: xs -> "(Cons " ^ (show_Vuna_dCompiler_dAst_dImport) x ^ " " ^ go xs ^ ")" in go v)) f2; ((fun v -> let rec go = function [] -> "Nil" | x :: xs -> "(Cons " ^ (show_Vuna_dCompiler_dLoader_dModule) x ^ " " ^ go xs ^ ")" in go v)) f3; (show_vstring) f4]
and show_Vuna_dCompiler_dLoader_dExportEntry v =
  match v with
  | C_Vuna_dCompiler_dLoader_dExportEntry (f0, f1, f2, f3) -> show_ctor "ExportEntry" [(show_vstring) f0; (show_vstring) f1; (show_vstring) f2; (show_vstring) f3]
and show_Vuna_dCompiler_dLoader_dExportRef v =
  match v with
  | C_Vuna_dCompiler_dLoader_dExportRef (f0, f1, f2) -> show_ctor "ExportRef" [(show_vstring) f0; (show_vstring) f1; (show_vstring) f2]
let v_Vuna_dCompiler_dLoader_dmoduleNameOf = fun a0 -> match a0 with
  | (C_Vuna_dCompiler_dLoader_dModule (n, p, is, imps, ds, es)) -> n
  | _ -> vuna_fail "compiler/lib/Vuna/Compiler/Loader.vuna" 22 1 ("no matching clause for Vuna.Compiler.Loader.moduleNameOf")

let v_Vuna_dCompiler_dLoader_dmodulePackageOf = fun a0 -> match a0 with
  | (C_Vuna_dCompiler_dLoader_dModule (n, p, is, imps, ds, es)) -> p
  | _ -> vuna_fail "compiler/lib/Vuna/Compiler/Loader.vuna" 24 1 ("no matching clause for Vuna.Compiler.Loader.modulePackageOf")

let v_Vuna_dCompiler_dLoader_dmoduleImportsOf = fun a0 -> match a0 with
  | (C_Vuna_dCompiler_dLoader_dModule (n, p, is, imps, ds, es)) -> is
  | _ -> vuna_fail "compiler/lib/Vuna/Compiler/Loader.vuna" 26 1 ("no matching clause for Vuna.Compiler.Loader.moduleImportsOf")

let v_Vuna_dCompiler_dLoader_dmoduleImplicitImportsOf = fun a0 -> match a0 with
  | (C_Vuna_dCompiler_dLoader_dModule (n, p, is, imps, ds, es)) -> imps
  | _ -> vuna_fail "compiler/lib/Vuna/Compiler/Loader.vuna" 28 1 ("no matching clause for Vuna.Compiler.Loader.moduleImplicitImportsOf")

let v_Vuna_dCompiler_dLoader_dmoduleAllImportsOf = fun a0 -> match a0 with
  | (C_Vuna_dCompiler_dLoader_dModule (n, p, is, imps, ds, es)) -> v_Base_dList_dappend is imps
  | _ -> vuna_fail "compiler/lib/Vuna/Compiler/Loader.vuna" 30 1 ("no matching clause for Vuna.Compiler.Loader.moduleAllImportsOf")

let v_Vuna_dCompiler_dLoader_dmoduleDeclsOf = fun a0 -> match a0 with
  | (C_Vuna_dCompiler_dLoader_dModule (n, p, is, imps, ds, es)) -> ds
  | _ -> vuna_fail "compiler/lib/Vuna/Compiler/Loader.vuna" 32 1 ("no matching clause for Vuna.Compiler.Loader.moduleDeclsOf")

let v_Vuna_dCompiler_dLoader_dmoduleExportsOf = fun a0 -> match a0 with
  | (C_Vuna_dCompiler_dLoader_dModule (n, p, is, imps, ds, es)) -> es
  | _ -> vuna_fail "compiler/lib/Vuna/Compiler/Loader.vuna" 34 1 ("no matching clause for Vuna.Compiler.Loader.moduleExportsOf")

let v_Vuna_dCompiler_dLoader_dprojectEntryDecls = fun a0 -> match a0 with
  | (C_Vuna_dCompiler_dLoader_dProject (ds, is, imps, ms, pkg)) -> ds
  | _ -> vuna_fail "compiler/lib/Vuna/Compiler/Loader.vuna" 36 1 ("no matching clause for Vuna.Compiler.Loader.projectEntryDecls")

let v_Vuna_dCompiler_dLoader_dprojectEntryImports = fun a0 -> match a0 with
  | (C_Vuna_dCompiler_dLoader_dProject (ds, is, imps, ms, pkg)) -> is
  | _ -> vuna_fail "compiler/lib/Vuna/Compiler/Loader.vuna" 38 1 ("no matching clause for Vuna.Compiler.Loader.projectEntryImports")

let v_Vuna_dCompiler_dLoader_dprojectEntryAllImports = fun a0 -> match a0 with
  | (C_Vuna_dCompiler_dLoader_dProject (ds, is, imps, ms, pkg)) -> v_Base_dList_dappend is imps
  | _ -> vuna_fail "compiler/lib/Vuna/Compiler/Loader.vuna" 40 1 ("no matching clause for Vuna.Compiler.Loader.projectEntryAllImports")

let v_Vuna_dCompiler_dLoader_dprojectModules = fun a0 -> match a0 with
  | (C_Vuna_dCompiler_dLoader_dProject (ds, is, imps, ms, pkg)) -> ms
  | _ -> vuna_fail "compiler/lib/Vuna/Compiler/Loader.vuna" 42 1 ("no matching clause for Vuna.Compiler.Loader.projectModules")

let v_Vuna_dCompiler_dLoader_dprojectEntryPkg = fun a0 -> match a0 with
  | (C_Vuna_dCompiler_dLoader_dProject (ds, is, imps, ms, pkg)) -> pkg
  | _ -> vuna_fail "compiler/lib/Vuna/Compiler/Loader.vuna" 44 1 ("no matching clause for Vuna.Compiler.Loader.projectEntryPkg")

let rec v_Vuna_dCompiler_dLoader_dallIdentChars = fun chars -> (match chars with
  | [] -> true
  | (c) :: (rest) -> if (if (v_Vuna_dCompiler_dLexer_disIdentStart c) then true else (v_Vuna_dCompiler_dLexer_disDigit c)) then v_Vuna_dCompiler_dLoader_dallIdentChars rest else false
  | _ -> vuna_fail "compiler/lib/Vuna/Compiler/Loader.vuna" 62 3 ("case pattern match failure"))

let v_Vuna_dCompiler_dLoader_dvalidSegment = fun seg -> (match bi_str_unpack seg with
  | [] -> false
  | (c) :: (rest) -> (if (v_Vuna_dCompiler_dLexer_disUpperChar c) then (v_Vuna_dCompiler_dLoader_dallIdentChars rest) else false)
  | _ -> vuna_fail "compiler/lib/Vuna/Compiler/Loader.vuna" 68 3 ("case pattern match failure"))

let rec v_Vuna_dCompiler_dLoader_dallSegmentsValid = fun segs -> (match segs with
  | [] -> false
  | (seg) :: (rest) -> if v_Vuna_dCompiler_dLoader_dvalidSegment seg then (match rest with
  | [] -> true
  | _ -> v_Vuna_dCompiler_dLoader_dallSegmentsValid rest
  | _ -> vuna_fail "compiler/lib/Vuna/Compiler/Loader.vuna" 77 9 ("case pattern match failure")) else false
  | _ -> vuna_fail "compiler/lib/Vuna/Compiler/Loader.vuna" 73 3 ("case pattern match failure"))

let v_Vuna_dCompiler_dLoader_dvalidModuleName = fun name -> (match v_Vuna_dCompiler_dCommon_dsplitOnDot name with
  | [] -> false
  | segs -> v_Vuna_dCompiler_dLoader_dallSegmentsValid segs
  | _ -> vuna_fail "compiler/lib/Vuna/Compiler/Loader.vuna" 83 3 ("case pattern match failure"))

let v_Vuna_dCompiler_dLoader_disGlobalCtor = fun name -> (if ((if ((if (v_vuna_ueq_ustr name "True") then true else (v_vuna_ueq_ustr name "False"))) then true else (v_vuna_ueq_ustr name "Cons"))) then true else (v_vuna_ueq_ustr name "Nil"))

let v_Vuna_dCompiler_dLoader_dmangle = fun prefix name -> if v_vuna_ueq_ustr prefix "" then name else (let vuna_cat0' = (prefix) in (let vuna_cat1' = (".") in (let vuna_cat2' = (name) in String.concat "" [vuna_cat0'; vuna_cat1'; vuna_cat2'])))

let v_Vuna_dCompiler_dLoader_dimportName = fun a0 -> match a0 with
  | (C_Vuna_dCompiler_dAst_dImport (name, isQualified, alias, sp)) -> name
  | _ -> vuna_fail "compiler/lib/Vuna/Compiler/Loader.vuna" 92 1 ("no matching clause for Vuna.Compiler.Loader.importName")

let v_Vuna_dCompiler_dLoader_dimportIsQualified = fun a0 -> match a0 with
  | (C_Vuna_dCompiler_dAst_dImport (name, isQualified, alias, sp)) -> isQualified
  | _ -> vuna_fail "compiler/lib/Vuna/Compiler/Loader.vuna" 94 1 ("no matching clause for Vuna.Compiler.Loader.importIsQualified")

let v_Vuna_dCompiler_dLoader_dimportAlias = fun a0 -> match a0 with
  | (C_Vuna_dCompiler_dAst_dImport (name, isQualified, alias, sp)) -> alias
  | _ -> vuna_fail "compiler/lib/Vuna/Compiler/Loader.vuna" 96 1 ("no matching clause for Vuna.Compiler.Loader.importAlias")

let v_Vuna_dCompiler_dLoader_dimportModuleNames = fun imports -> v_Base_dList_dmap v_Vuna_dCompiler_dLoader_dimportName imports

let rec v_Vuna_dCompiler_dLoader_dhasDuplicateName = fun a0 -> match a0 with
  | ([]) -> false
  | ((x) :: (rest)) -> if v_Base_dList_dmemName x rest then true else v_Vuna_dCompiler_dLoader_dhasDuplicateName rest
  | _ -> vuna_fail "compiler/lib/Vuna/Compiler/Loader.vuna" 100 1 ("no matching clause for Vuna.Compiler.Loader.hasDuplicateName")

let rec v_Vuna_dCompiler_dLoader_dimportAliases = fun imports -> (match imports with
  | [] -> []
  | (imp) :: (rest) -> (match v_Vuna_dCompiler_dLoader_dimportAlias imp with
  | C_Base_dMaybe_dNothing -> v_Vuna_dCompiler_dLoader_dimportAliases rest
  | C_Base_dMaybe_dJust (alias) -> (C_Base_dPair_dPair (alias, v_Vuna_dCompiler_dLoader_dimportName imp)) :: (v_Vuna_dCompiler_dLoader_dimportAliases rest)
  | _ -> vuna_fail "compiler/lib/Vuna/Compiler/Loader.vuna" 108 7 ("case pattern match failure"))
  | _ -> vuna_fail "compiler/lib/Vuna/Compiler/Loader.vuna" 105 3 ("case pattern match failure"))

let rec v_Vuna_dCompiler_dLoader_dcheckImportAliases = fun label moduleNames aliases -> (match aliases with
  | [] -> C_Base_dResult_dOk ([])
  | (C_Base_dPair_dPair (alias, m)) :: (rest) -> if v_Vuna_dCompiler_dLoader_dvalidSegment alias then if v_Base_dList_dmemName alias (v_Base_dList_dmap v_Base_dPair_dfirstOf rest) then C_Base_dResult_dErr ((let vuna_cat0' = (label) in (let vuna_cat1' = (": duplicate module alias ") in (let vuna_cat2' = (alias) in String.concat "" [vuna_cat0'; vuna_cat1'; vuna_cat2'])))) else if v_Base_dList_dmemName alias moduleNames then if v_vuna_ueq_ustr alias m then v_Vuna_dCompiler_dLoader_dcheckImportAliases label moduleNames rest else C_Base_dResult_dErr ((let vuna_cat0' = (label) in (let vuna_cat1' = (": module alias ") in (let vuna_cat2' = (alias) in (let vuna_cat3' = (" conflicts with an imported module") in String.concat "" [vuna_cat0'; vuna_cat1'; vuna_cat2'; vuna_cat3']))))) else v_Vuna_dCompiler_dLoader_dcheckImportAliases label moduleNames rest else C_Base_dResult_dErr ((let vuna_cat0' = (label) in (let vuna_cat1' = (": invalid module alias ") in (let vuna_cat2' = (alias) in String.concat "" [vuna_cat0'; vuna_cat1'; vuna_cat2']))))
  | _ -> vuna_fail "compiler/lib/Vuna/Compiler/Loader.vuna" 113 3 ("case pattern match failure"))

let v_Vuna_dCompiler_dLoader_dvalidateImports = fun label imports -> if v_Vuna_dCompiler_dLoader_dhasDuplicateName (v_Vuna_dCompiler_dLoader_dimportModuleNames imports) then C_Base_dResult_dErr (((label) ^ (": duplicate import"))) else v_Vuna_dCompiler_dLoader_dcheckImportAliases label (v_Vuna_dCompiler_dLoader_dimportModuleNames imports) (v_Vuna_dCompiler_dLoader_dimportAliases imports)

let rec v_Vuna_dCompiler_dLoader_dopenModuleNames = fun imports -> (match imports with
  | [] -> []
  | (imp) :: (rest) -> if v_Vuna_dCompiler_dLoader_dimportIsQualified imp then v_Vuna_dCompiler_dLoader_dopenModuleNames rest else (v_Vuna_dCompiler_dLoader_dimportName imp) :: (v_Vuna_dCompiler_dLoader_dopenModuleNames rest)
  | _ -> vuna_fail "compiler/lib/Vuna/Compiler/Loader.vuna" 131 3 ("case pattern match failure"))

let rec v_Vuna_dCompiler_dLoader_dfindImportPrefix = fun imports prefix -> (match imports with
  | [] -> C_Base_dMaybe_dNothing
  | (imp) :: (rest) -> if v_vuna_ueq_ustr (v_Vuna_dCompiler_dLoader_dimportName imp) prefix then C_Base_dMaybe_dJust (v_Vuna_dCompiler_dLoader_dimportName imp) else (match v_Vuna_dCompiler_dLoader_dimportAlias imp with
  | C_Base_dMaybe_dJust (alias) -> if v_vuna_ueq_ustr alias prefix then C_Base_dMaybe_dJust (v_Vuna_dCompiler_dLoader_dimportName imp) else v_Vuna_dCompiler_dLoader_dfindImportPrefix rest prefix
  | C_Base_dMaybe_dNothing -> v_Vuna_dCompiler_dLoader_dfindImportPrefix rest prefix
  | _ -> vuna_fail "compiler/lib/Vuna/Compiler/Loader.vuna" 143 9 ("case pattern match failure"))
  | _ -> vuna_fail "compiler/lib/Vuna/Compiler/Loader.vuna" 138 3 ("case pattern match failure"))

let rec v_Vuna_dCompiler_dLoader_d_ujoinNames = fun a0 -> match a0 with
  | ([]) -> ""
  | ((x) :: ([])) -> x
  | ((x) :: (rest)) -> (let vuna_cat0' = (x) in (let vuna_cat1' = (", ") in (let vuna_cat2' = (v_Vuna_dCompiler_dLoader_d_ujoinNames rest) in String.concat "" [vuna_cat0'; vuna_cat1'; vuna_cat2'])))
  | _ -> vuna_fail "compiler/lib/Vuna/Compiler/Loader.vuna" 148 1 ("no matching clause for Vuna.Compiler.Loader._joinNames")

let v_Vuna_dCompiler_dLoader_dentryKind = fun e -> (match e with
  | C_Vuna_dCompiler_dLoader_dExportEntry (vuna_urf0, vuna_urf1, vuna_urf2, vuna_urf3) -> vuna_urf0
  | _ -> vuna_fail "compiler/lib/Vuna/Compiler/Loader.vuna" 165 15 ("case pattern match failure"))

let v_Vuna_dCompiler_dLoader_dentryPublic = fun e -> (match e with
  | C_Vuna_dCompiler_dLoader_dExportEntry (vuna_urf0, vuna_urf1, vuna_urf2, vuna_urf3) -> vuna_urf1
  | _ -> vuna_fail "compiler/lib/Vuna/Compiler/Loader.vuna" 168 17 ("case pattern match failure"))

let v_Vuna_dCompiler_dLoader_dentryTarget = fun e -> (match e with
  | C_Vuna_dCompiler_dLoader_dExportEntry (vuna_urf0, vuna_urf1, vuna_urf2, vuna_urf3) -> vuna_urf2
  | _ -> vuna_fail "compiler/lib/Vuna/Compiler/Loader.vuna" 171 17 ("case pattern match failure"))

let v_Vuna_dCompiler_dLoader_dentryParent = fun e -> (match e with
  | C_Vuna_dCompiler_dLoader_dExportEntry (vuna_urf0, vuna_urf1, vuna_urf2, vuna_urf3) -> vuna_urf3
  | _ -> vuna_fail "compiler/lib/Vuna/Compiler/Loader.vuna" 174 17 ("case pattern match failure"))

let rec v_Vuna_dCompiler_dLoader_dlookupExport = fun kinds name entries -> (match entries with
  | [] -> C_Base_dMaybe_dNothing
  | (e) :: (rest) -> if (if (v_Base_dList_dmemName (v_Vuna_dCompiler_dLoader_dentryKind e) kinds) then (v_vuna_ueq_ustr (v_Vuna_dCompiler_dLoader_dentryPublic e) name) else false) then C_Base_dMaybe_dJust (e) else v_Vuna_dCompiler_dLoader_dlookupExport kinds name rest
  | _ -> vuna_fail "compiler/lib/Vuna/Compiler/Loader.vuna" 178 3 ("case pattern match failure"))

let v_Vuna_dCompiler_dLoader_dfindExportValue = fun entries name -> v_Vuna_dCompiler_dLoader_dlookupExport (("val") :: (("ctor") :: ([]))) name entries

let v_Vuna_dCompiler_dLoader_dfindExportCtor = fun entries name -> v_Vuna_dCompiler_dLoader_dlookupExport (("ctor") :: ([])) name entries

let v_Vuna_dCompiler_dLoader_dfindExportType = fun entries name -> v_Vuna_dCompiler_dLoader_dlookupExport (("type") :: ([])) name entries

let rec v_Vuna_dCompiler_dLoader_dsameTargetRest = fun e pairs -> (match pairs with
  | [] -> true
  | (C_Base_dPair_dPair (m, e2)) :: (rest) -> if v_vuna_ueq_ustr (v_Vuna_dCompiler_dLoader_dentryTarget e) (v_Vuna_dCompiler_dLoader_dentryTarget e2) then v_Vuna_dCompiler_dLoader_dsameTargetRest e rest else false
  | _ -> vuna_fail "compiler/lib/Vuna/Compiler/Loader.vuna" 225 3 ("case pattern match failure"))

let v_Vuna_dCompiler_dLoader_dunifyEntryPairs = fun a0 a1 a2 a3 -> match (a0, a1, a2, a3) with
  | (label, kindLabel, name, []) -> C_Base_dResult_dErr ((let vuna_cat0' = (label) in (let vuna_cat1' = (": unknown ") in (let vuna_cat2' = (kindLabel) in (let vuna_cat3' = (" ") in (let vuna_cat4' = (name) in String.concat "" [vuna_cat0'; vuna_cat1'; vuna_cat2'; vuna_cat3'; vuna_cat4']))))))
  | (label, kindLabel, name, (p) :: (rest)) -> if v_Vuna_dCompiler_dLoader_dsameTargetRest (v_Base_dPair_dsecondOf p) rest then C_Base_dResult_dOk (p) else C_Base_dResult_dErr ((let vuna_cat0' = (label) in (let vuna_cat1' = (": ambiguous ") in (let vuna_cat2' = (kindLabel) in (let vuna_cat3' = (" ") in (let vuna_cat4' = (name) in (let vuna_cat5' = (" (imported from ") in (let vuna_cat6' = (v_Vuna_dCompiler_dLoader_d_ujoinNames (v_Base_dList_dmap v_Base_dPair_dfirstOf ((p) :: (rest)))) in (let vuna_cat7' = ("); qualify it") in String.concat "" [vuna_cat0'; vuna_cat1'; vuna_cat2'; vuna_cat3'; vuna_cat4'; vuna_cat5'; vuna_cat6'; vuna_cat7'])))))))))
  | _ -> vuna_fail "compiler/lib/Vuna/Compiler/Loader.vuna" 229 1 ("no matching clause for Vuna.Compiler.Loader.unifyEntryPairs")

let v_Vuna_dCompiler_dLoader_dmodulePath = fun root name -> (let vuna_cat0' = (v_Vuna_dCompiler_dPkg_drootDir root) in (let vuna_cat1' = ("/") in (let vuna_cat2' = (v_Vuna_dCompiler_dCommon_djoinSlashes (v_Vuna_dCompiler_dCommon_dsplitOnDot name)) in (let vuna_cat3' = (".vuna") in String.concat "" [vuna_cat0'; vuna_cat1'; vuna_cat2'; vuna_cat3']))))

let v_Vuna_dCompiler_dLoader_drootAllows = fun importerPkg root name -> (match v_Vuna_dCompiler_dPkg_drootExports root with
  | C_Base_dMaybe_dNothing -> true
  | C_Base_dMaybe_dJust (mods) -> (if (v_vuna_ueq_ustr (v_Vuna_dCompiler_dPkg_drootName root) importerPkg) then true else (v_Base_dList_dmemName name mods))
  | _ -> vuna_fail "compiler/lib/Vuna/Compiler/Loader.vuna" 243 3 ("case pattern match failure"))

let rec v_Vuna_dCompiler_dLoader_dcollectModuleFiles = fun roots name importerPkg allowed hidden -> (match roots with
  | [] -> C_Base_dPair_dPair (v_Base_dList_dreverse allowed, v_Base_dList_dreverse hidden)
  | (root) :: (rest) -> (let path = v_Vuna_dCompiler_dLoader_dmodulePath root name in if bi_file_exists path then if v_Vuna_dCompiler_dLoader_drootAllows importerPkg root name then v_Vuna_dCompiler_dLoader_dcollectModuleFiles rest name importerPkg ((C_Base_dPair_dPair (path, root)) :: (allowed)) hidden else v_Vuna_dCompiler_dLoader_dcollectModuleFiles rest name importerPkg allowed ((v_Vuna_dCompiler_dPkg_drootName root) :: (hidden)) else v_Vuna_dCompiler_dLoader_dcollectModuleFiles rest name importerPkg allowed hidden)
  | _ -> vuna_fail "compiler/lib/Vuna/Compiler/Loader.vuna" 249 3 ("case pattern match failure"))

let v_Vuna_dCompiler_dLoader_d_ujoinRootDirs = fun roots -> v_Vuna_dCompiler_dLoader_d_ujoinNames (v_Base_dList_dmap v_Vuna_dCompiler_dPkg_drootDir roots)

let v_Vuna_dCompiler_dLoader_dcandidateDir = fun candidate -> v_Vuna_dCompiler_dPkg_drootDir (v_Base_dPair_dsecondOf candidate)

let v_Vuna_dCompiler_dLoader_dfindModuleFile = fun roots name importerPkg -> (match v_Vuna_dCompiler_dLoader_dcollectModuleFiles roots name importerPkg [] [] with
  | C_Base_dPair_dPair (allowed, hidden) -> (match allowed with
  | [] -> (match hidden with
  | [] -> C_Base_dResult_dErr ((let vuna_cat0' = ("module ") in (let vuna_cat1' = (name) in (let vuna_cat2' = (" not found (roots: ") in (let vuna_cat3' = (v_Vuna_dCompiler_dLoader_d_ujoinRootDirs roots) in (let vuna_cat4' = (")") in String.concat "" [vuna_cat0'; vuna_cat1'; vuna_cat2'; vuna_cat3'; vuna_cat4']))))))
  | pkgs -> C_Base_dResult_dErr ((let vuna_cat0' = ("module ") in (let vuna_cat1' = (name) in (let vuna_cat2' = (" is not exported by package ") in (let vuna_cat3' = (v_Vuna_dCompiler_dLoader_d_ujoinNames hidden) in String.concat "" [vuna_cat0'; vuna_cat1'; vuna_cat2'; vuna_cat3'])))))
  | _ -> vuna_fail "compiler/lib/Vuna/Compiler/Loader.vuna" 270 11 ("case pattern match failure"))
  | (only) :: ([]) -> C_Base_dResult_dOk (only)
  | candidates -> C_Base_dResult_dErr ((let vuna_cat0' = ("ambiguous module ") in (let vuna_cat1' = (name) in (let vuna_cat2' = (" (found in: ") in (let vuna_cat3' = (v_Vuna_dCompiler_dLoader_d_ujoinNames (v_Base_dList_dmap v_Vuna_dCompiler_dLoader_dcandidateDir allowed)) in (let vuna_cat4' = (")") in String.concat "" [vuna_cat0'; vuna_cat1'; vuna_cat2'; vuna_cat3'; vuna_cat4']))))))
  | _ -> vuna_fail "compiler/lib/Vuna/Compiler/Loader.vuna" 268 7 ("case pattern match failure"))
  | _ -> vuna_fail "compiler/lib/Vuna/Compiler/Loader.vuna" 266 3 ("case pattern match failure"))

let rec v_Vuna_dCompiler_dLoader_dfindModule = fun modules name -> (match modules with
  | [] -> C_Base_dMaybe_dNothing
  | (C_Vuna_dCompiler_dLoader_dModule (mname, mpkg, imports, imps, decls, exports)) :: (rest) -> if v_vuna_ueq_ustr mname name then C_Base_dMaybe_dJust (C_Vuna_dCompiler_dLoader_dModule (mname, mpkg, imports, imps, decls, exports)) else v_Vuna_dCompiler_dLoader_dfindModule rest name
  | _ -> vuna_fail "compiler/lib/Vuna/Compiler/Loader.vuna" 277 3 ("case pattern match failure"))

let v_Vuna_dCompiler_dLoader_dmoduleDecls = fun modules name -> (match v_Vuna_dCompiler_dLoader_dfindModule modules name with
  | C_Base_dMaybe_dJust (C_Vuna_dCompiler_dLoader_dModule (mname, mpkg, imports, imps, decls, exports)) -> decls
  | C_Base_dMaybe_dNothing -> []
  | _ -> vuna_fail "compiler/lib/Vuna/Compiler/Loader.vuna" 153 3 ("case pattern match failure"))

let v_Vuna_dCompiler_dLoader_dmoduleCtors = fun modules name -> v_Vuna_dCompiler_dAst_dctorsOf (v_Vuna_dCompiler_dLoader_dmoduleDecls modules name)

let v_Vuna_dCompiler_dLoader_dexportsOf = fun modules name -> (match v_Vuna_dCompiler_dLoader_dfindModule modules name with
  | C_Base_dMaybe_dJust (C_Vuna_dCompiler_dLoader_dModule (mname, mpkg, imports, imps, decls, exports)) -> exports
  | C_Base_dMaybe_dNothing -> []
  | _ -> vuna_fail "compiler/lib/Vuna/Compiler/Loader.vuna" 160 3 ("case pattern match failure"))

let rec v_Vuna_dCompiler_dLoader_dmodulesExportingValueFrom = fun modules names name -> (match names with
  | [] -> []
  | (m) :: (rest) -> (match v_Vuna_dCompiler_dLoader_dfindExportValue (v_Vuna_dCompiler_dLoader_dexportsOf modules m) name with
  | C_Base_dMaybe_dJust (e) -> (C_Base_dPair_dPair (m, e)) :: (v_Vuna_dCompiler_dLoader_dmodulesExportingValueFrom modules rest name)
  | C_Base_dMaybe_dNothing -> v_Vuna_dCompiler_dLoader_dmodulesExportingValueFrom modules rest name
  | _ -> vuna_fail "compiler/lib/Vuna/Compiler/Loader.vuna" 194 7 ("case pattern match failure"))
  | _ -> vuna_fail "compiler/lib/Vuna/Compiler/Loader.vuna" 191 3 ("case pattern match failure"))

let v_Vuna_dCompiler_dLoader_dmodulesExportingValue = fun modules imports name -> v_Vuna_dCompiler_dLoader_dmodulesExportingValueFrom modules (v_Vuna_dCompiler_dLoader_dopenModuleNames imports) name

let rec v_Vuna_dCompiler_dLoader_dmodulesExportingCtorFrom = fun modules names name -> (match names with
  | [] -> []
  | (m) :: (rest) -> (match v_Vuna_dCompiler_dLoader_dfindExportCtor (v_Vuna_dCompiler_dLoader_dexportsOf modules m) name with
  | C_Base_dMaybe_dJust (e) -> (C_Base_dPair_dPair (m, e)) :: (v_Vuna_dCompiler_dLoader_dmodulesExportingCtorFrom modules rest name)
  | C_Base_dMaybe_dNothing -> v_Vuna_dCompiler_dLoader_dmodulesExportingCtorFrom modules rest name
  | _ -> vuna_fail "compiler/lib/Vuna/Compiler/Loader.vuna" 205 7 ("case pattern match failure"))
  | _ -> vuna_fail "compiler/lib/Vuna/Compiler/Loader.vuna" 202 3 ("case pattern match failure"))

let v_Vuna_dCompiler_dLoader_dmodulesExportingCtor = fun modules imports name -> v_Vuna_dCompiler_dLoader_dmodulesExportingCtorFrom modules (v_Vuna_dCompiler_dLoader_dopenModuleNames imports) name

let rec v_Vuna_dCompiler_dLoader_dmodulesExportingTypeFrom = fun modules names name -> (match names with
  | [] -> []
  | (m) :: (rest) -> (match v_Vuna_dCompiler_dLoader_dfindExportType (v_Vuna_dCompiler_dLoader_dexportsOf modules m) name with
  | C_Base_dMaybe_dJust (e) -> (C_Base_dPair_dPair (m, e)) :: (v_Vuna_dCompiler_dLoader_dmodulesExportingTypeFrom modules rest name)
  | C_Base_dMaybe_dNothing -> v_Vuna_dCompiler_dLoader_dmodulesExportingTypeFrom modules rest name
  | _ -> vuna_fail "compiler/lib/Vuna/Compiler/Loader.vuna" 216 7 ("case pattern match failure"))
  | _ -> vuna_fail "compiler/lib/Vuna/Compiler/Loader.vuna" 213 3 ("case pattern match failure"))

let v_Vuna_dCompiler_dLoader_dmodulesExportingType = fun modules imports name -> v_Vuna_dCompiler_dLoader_dmodulesExportingTypeFrom modules (v_Vuna_dCompiler_dLoader_dopenModuleNames imports) name

let v_Vuna_dCompiler_dLoader_disBuiltinName = fun name -> (match v_Vuna_dCompiler_dBuiltins_dbuiltinArity name with
  | C_Base_dMaybe_dJust (arity) -> true
  | C_Base_dMaybe_dNothing -> false
  | _ -> vuna_fail "compiler/lib/Vuna/Compiler/Loader.vuna" 283 3 ("case pattern match failure"))

let v_Vuna_dCompiler_dLoader_disBuiltinTraitName = fun name -> (if ((if (v_vuna_ueq_ustr name "Show") then true else (v_vuna_ueq_ustr name "Eq"))) then true else (v_vuna_ueq_ustr name "Ord"))

let v_Vuna_dCompiler_dLoader_disPreludeTraitMethod = fun name -> (if ((if ((if ((if ((if ((if (v_vuna_ueq_ustr name "show") then true else (v_vuna_ueq_ustr name "eq"))) then true else (v_vuna_ueq_ustr name "neq"))) then true else (v_vuna_ueq_ustr name "lt"))) then true else (v_vuna_ueq_ustr name "le"))) then true else (v_vuna_ueq_ustr name "gt"))) then true else (v_vuna_ueq_ustr name "ge"))

let v_Vuna_dCompiler_dLoader_dresolveQualified = fun modules label imports name -> (match v_Vuna_dCompiler_dCommon_dsplitLastDot (v_Vuna_dCompiler_dCommon_dsplitOnDot name) with
  | C_Base_dPair_dPair (revPrefix, base) -> (let prefix = v_Vuna_dCompiler_dCommon_djoinDots revPrefix in (match v_Vuna_dCompiler_dLoader_dfindImportPrefix imports prefix with
  | C_Base_dMaybe_dNothing -> C_Base_dResult_dErr ((let vuna_cat0' = (label) in (let vuna_cat1' = (": module ") in (let vuna_cat2' = (prefix) in (let vuna_cat3' = (" is not imported") in String.concat "" [vuna_cat0'; vuna_cat1'; vuna_cat2'; vuna_cat3'])))))
  | C_Base_dMaybe_dJust (m) -> if v_Vuna_dCompiler_dLoader_disGlobalCtor base then C_Base_dResult_dOk (base) else (match v_Vuna_dCompiler_dLoader_dfindExportValue (v_Vuna_dCompiler_dLoader_dexportsOf modules m) base with
  | C_Base_dMaybe_dJust (e) -> C_Base_dResult_dOk (v_Vuna_dCompiler_dLoader_dentryTarget e)
  | C_Base_dMaybe_dNothing -> C_Base_dResult_dErr ((let vuna_cat0' = (label) in (let vuna_cat1' = (": ") in (let vuna_cat2' = (base) in (let vuna_cat3' = (" is not exported by ") in (let vuna_cat4' = (m) in String.concat "" [vuna_cat0'; vuna_cat1'; vuna_cat2'; vuna_cat3'; vuna_cat4']))))))
  | _ -> vuna_fail "compiler/lib/Vuna/Compiler/Loader.vuna" 303 16 ("case pattern match failure"))
  | _ -> vuna_fail "compiler/lib/Vuna/Compiler/Loader.vuna" 298 10 ("case pattern match failure")))
  | _ -> vuna_fail "compiler/lib/Vuna/Compiler/Loader.vuna" 295 3 ("case pattern match failure"))

let v_Vuna_dCompiler_dLoader_dresolveQualifiedCtor = fun modules label imports name -> (match v_Vuna_dCompiler_dCommon_dsplitLastDot (v_Vuna_dCompiler_dCommon_dsplitOnDot name) with
  | C_Base_dPair_dPair (revPrefix, base) -> (let prefix = v_Vuna_dCompiler_dCommon_djoinDots revPrefix in (match v_Vuna_dCompiler_dLoader_dfindImportPrefix imports prefix with
  | C_Base_dMaybe_dNothing -> C_Base_dResult_dErr ((let vuna_cat0' = (label) in (let vuna_cat1' = (": module ") in (let vuna_cat2' = (prefix) in (let vuna_cat3' = (" is not imported") in String.concat "" [vuna_cat0'; vuna_cat1'; vuna_cat2'; vuna_cat3'])))))
  | C_Base_dMaybe_dJust (m) -> if v_Vuna_dCompiler_dLoader_disGlobalCtor base then C_Base_dResult_dOk (base) else (match v_Vuna_dCompiler_dLoader_dfindExportCtor (v_Vuna_dCompiler_dLoader_dexportsOf modules m) base with
  | C_Base_dMaybe_dJust (e) -> C_Base_dResult_dOk (v_Vuna_dCompiler_dLoader_dentryTarget e)
  | C_Base_dMaybe_dNothing -> C_Base_dResult_dErr ((let vuna_cat0' = (label) in (let vuna_cat1' = (": constructor ") in (let vuna_cat2' = (base) in (let vuna_cat3' = (" is not exported by ") in (let vuna_cat4' = (m) in String.concat "" [vuna_cat0'; vuna_cat1'; vuna_cat2'; vuna_cat3'; vuna_cat4']))))))
  | _ -> vuna_fail "compiler/lib/Vuna/Compiler/Loader.vuna" 317 16 ("case pattern match failure"))
  | _ -> vuna_fail "compiler/lib/Vuna/Compiler/Loader.vuna" 312 10 ("case pattern match failure")))
  | _ -> vuna_fail "compiler/lib/Vuna/Compiler/Loader.vuna" 309 3 ("case pattern match failure"))

let rec v_Vuna_dCompiler_dLoader_dfoldFieldChain = fun a0 a1 a2 -> match (a0, a1, a2) with
  | (base, [], sp) -> base
  | (base, (f) :: (rest), sp) -> v_Vuna_dCompiler_dLoader_dfoldFieldChain (C_Vuna_dCompiler_dAst_dEField (base, f, sp)) rest sp
  | _ -> vuna_fail "compiler/lib/Vuna/Compiler/Loader.vuna" 340 1 ("no matching clause for Vuna.Compiler.Loader.foldFieldChain")

let rec v_Vuna_dCompiler_dLoader_dtakeSegs = fun a0 a1 -> match (a0, a1) with
  | (n, []) -> []
  | (n, (x) :: (rest)) -> if v_vuna_ule_uint n 0 then [] else (x) :: (v_Vuna_dCompiler_dLoader_dtakeSegs (bi_sub n 1) rest)
  | _ -> vuna_fail "compiler/lib/Vuna/Compiler/Loader.vuna" 344 1 ("no matching clause for Vuna.Compiler.Loader.takeSegs")

let rec v_Vuna_dCompiler_dLoader_ddropSegs = fun a0 a1 -> match (a0, a1) with
  | (n, []) -> []
  | (n, (x) :: (rest)) -> if v_vuna_ule_uint n 0 then (x) :: (rest) else v_Vuna_dCompiler_dLoader_ddropSegs (bi_sub n 1) rest
  | _ -> vuna_fail "compiler/lib/Vuna/Compiler/Loader.vuna" 347 1 ("no matching clause for Vuna.Compiler.Loader.dropSegs")

let rec v_Vuna_dCompiler_dLoader_dresolveQualifiedPath = fun modules label imports segs n sp -> if v_vuna_ule_uint n 1 then C_Base_dResult_dOk (C_Base_dMaybe_dNothing) else (match v_Vuna_dCompiler_dLoader_dfindImportPrefix imports (v_Vuna_dCompiler_dCommon_djoinDots (v_Vuna_dCompiler_dLoader_dtakeSegs (bi_sub n 1) segs)) with
  | C_Base_dMaybe_dJust (m) -> (match v_Vuna_dCompiler_dLoader_ddropSegs (bi_sub n 1) segs with
  | (member) :: ([]) -> if v_Vuna_dCompiler_dLoader_disGlobalCtor member then C_Base_dResult_dOk (C_Base_dMaybe_dJust (C_Vuna_dCompiler_dAst_dEVar (member, sp))) else (match v_Vuna_dCompiler_dLoader_dfindExportValue (v_Vuna_dCompiler_dLoader_dexportsOf modules m) member with
  | C_Base_dMaybe_dJust (e) -> C_Base_dResult_dOk (C_Base_dMaybe_dJust (C_Vuna_dCompiler_dAst_dEVar (v_Vuna_dCompiler_dLoader_dentryTarget e, sp)))
  | C_Base_dMaybe_dNothing -> C_Base_dResult_dErr ((let vuna_cat0' = (label) in (let vuna_cat1' = (": ") in (let vuna_cat2' = (member) in (let vuna_cat3' = (" is not exported by ") in (let vuna_cat4' = (m) in String.concat "" [vuna_cat0'; vuna_cat1'; vuna_cat2'; vuna_cat3'; vuna_cat4']))))))
  | _ -> vuna_fail "compiler/lib/Vuna/Compiler/Loader.vuna" 359 15 ("case pattern match failure"))
  | (member) :: (rest) -> (match v_Vuna_dCompiler_dLoader_dfindExportValue (v_Vuna_dCompiler_dLoader_dexportsOf modules m) member with
  | C_Base_dMaybe_dJust (e) -> C_Base_dResult_dOk (C_Base_dMaybe_dJust (v_Vuna_dCompiler_dLoader_dfoldFieldChain (C_Vuna_dCompiler_dAst_dEVar (v_Vuna_dCompiler_dLoader_dentryTarget e, sp)) rest sp))
  | C_Base_dMaybe_dNothing -> C_Base_dResult_dErr ((let vuna_cat0' = (label) in (let vuna_cat1' = (": ") in (let vuna_cat2' = (member) in (let vuna_cat3' = (" is not exported by ") in (let vuna_cat4' = (m) in String.concat "" [vuna_cat0'; vuna_cat1'; vuna_cat2'; vuna_cat3'; vuna_cat4']))))))
  | _ -> vuna_fail "compiler/lib/Vuna/Compiler/Loader.vuna" 363 13 ("case pattern match failure"))
  | [] -> C_Base_dResult_dOk (C_Base_dMaybe_dNothing)
  | _ -> vuna_fail "compiler/lib/Vuna/Compiler/Loader.vuna" 355 9 ("case pattern match failure"))
  | C_Base_dMaybe_dNothing -> v_Vuna_dCompiler_dLoader_dresolveQualifiedPath modules label imports segs (bi_sub n 1) sp
  | _ -> vuna_fail "compiler/lib/Vuna/Compiler/Loader.vuna" 353 5 ("case pattern match failure"))

let v_Vuna_dCompiler_dLoader_dresolveCtor = fun modules label prefix ownCtors imports name -> if v_Vuna_dCompiler_dLoader_disGlobalCtor name then C_Base_dResult_dOk (name) else if v_Vuna_dCompiler_dCommon_dcontainsDot name then v_Vuna_dCompiler_dLoader_dresolveQualifiedCtor modules label imports name else if v_Base_dList_dmemName name ownCtors then C_Base_dResult_dOk (v_Vuna_dCompiler_dLoader_dmangle prefix name) else (match v_Vuna_dCompiler_dLoader_dmodulesExportingCtor modules imports name with
  | [] -> C_Base_dResult_dErr ((let vuna_cat0' = (label) in (let vuna_cat1' = (": unknown constructor ") in (let vuna_cat2' = (name) in (let vuna_cat3' = (v_Vuna_dCompiler_dCommon_dsuggest name ownCtors) in String.concat "" [vuna_cat0'; vuna_cat1'; vuna_cat2'; vuna_cat3'])))))
  | pairs -> v_Base_dResult_dandThen (v_Vuna_dCompiler_dLoader_dunifyEntryPairs label "constructor" name pairs) (fun p -> C_Base_dResult_dOk (v_Vuna_dCompiler_dLoader_dentryTarget (v_Base_dPair_dsecondOf p)))
  | _ -> vuna_fail "compiler/lib/Vuna/Compiler/Loader.vuna" 392 5 ("case pattern match failure"))

let v_Vuna_dCompiler_dLoader_dcheckBinder = fun label name -> if v_Vuna_dCompiler_dCommon_dcontainsDot name then C_Base_dResult_dErr ((let vuna_cat0' = (label) in (let vuna_cat1' = (": invalid variable name ") in (let vuna_cat2' = (name) in String.concat "" [vuna_cat0'; vuna_cat1'; vuna_cat2'])))) else C_Base_dResult_dOk (name)

let v_Vuna_dCompiler_dLoader_dcheckTopName = fun label name -> if v_vuna_ueq_ustr name "_" then C_Base_dResult_dErr (((label) ^ (": invalid top-level name _ (bare _ is reserved)"))) else if v_Vuna_dCompiler_dCommon_dcontainsDot name then C_Base_dResult_dErr ((let vuna_cat0' = (label) in (let vuna_cat1' = (": invalid top-level name ") in (let vuna_cat2' = (name) in String.concat "" [vuna_cat0'; vuna_cat1'; vuna_cat2'])))) else C_Base_dResult_dOk (name)

let v_Vuna_dCompiler_dLoader_dresolveTopName = fun label prefix name -> v_Base_dResult_dandThen (v_Vuna_dCompiler_dLoader_dcheckTopName label name) (fun _u -> C_Base_dResult_dOk (v_Vuna_dCompiler_dLoader_dmangle prefix name))

let rec v_Vuna_dCompiler_dLoader_dresolvePattern = fun modules label prefix ownCtors imports pat -> (match pat with
  | C_Vuna_dCompiler_dAst_dPWild (sp) -> C_Base_dResult_dOk (C_Base_dPair_dPair (C_Vuna_dCompiler_dAst_dPWild (sp), []))
  | C_Vuna_dCompiler_dAst_dPVar (name, sp) -> v_Base_dResult_dandThen (v_Vuna_dCompiler_dLoader_dcheckBinder label name) (fun _u -> C_Base_dResult_dOk (C_Base_dPair_dPair (C_Vuna_dCompiler_dAst_dPVar (name, sp), (name) :: ([]))))
  | C_Vuna_dCompiler_dAst_dPInt (n, sp) -> C_Base_dResult_dOk (C_Base_dPair_dPair (C_Vuna_dCompiler_dAst_dPInt (n, sp), []))
  | C_Vuna_dCompiler_dAst_dPStr (s, sp) -> C_Base_dResult_dOk (C_Base_dPair_dPair (C_Vuna_dCompiler_dAst_dPStr (s, sp), []))
  | C_Vuna_dCompiler_dAst_dPCon (name, pats, sp) -> v_Base_dResult_dandThen (v_Vuna_dCompiler_dLoader_dresolveCtor modules label prefix ownCtors imports name) (fun name2 -> v_Base_dResult_dandThen (v_Base_dResult_dtraverse (v_Vuna_dCompiler_dLoader_dresolvePattern modules label prefix ownCtors imports) pats) (fun parts -> C_Base_dResult_dOk (C_Base_dPair_dPair (C_Vuna_dCompiler_dAst_dPCon (name2, v_Base_dList_dmap v_Base_dPair_dfirstOf parts, sp), v_Base_dList_dconcatMap v_Base_dPair_dsecondOf parts))))
  | C_Vuna_dCompiler_dAst_dPRecord (name, fields, sp) -> v_Base_dResult_dandThen (v_Vuna_dCompiler_dLoader_dresolveCtor modules label prefix ownCtors imports name) (fun name2 -> v_Base_dResult_dandThen (v_Base_dResult_dtraverse (v_Vuna_dCompiler_dLoader_dresolveRecordPatternField modules label prefix ownCtors imports) fields) (fun parts -> C_Base_dResult_dOk (C_Base_dPair_dPair (C_Vuna_dCompiler_dAst_dPRecord (name2, v_Base_dList_dmap v_Base_dPair_dfirstOf parts, sp), v_Base_dList_dconcatMap v_Base_dPair_dsecondOf parts))))
  | _ -> vuna_fail "compiler/lib/Vuna/Compiler/Loader.vuna" 410 3 ("case pattern match failure"))
and v_Vuna_dCompiler_dLoader_dresolveRecordPatternField = fun a0 a1 a2 a3 a4 a5 -> match (a0, a1, a2, a3, a4, a5) with
  | (modules, label, prefix, ownCtors, imports, C_Base_dPair_dPair (fname, pat)) -> v_Base_dResult_dandThen (v_Vuna_dCompiler_dLoader_dresolvePattern modules label prefix ownCtors imports pat) (fun p -> (match p with
  | C_Base_dPair_dPair (pat2, bound) -> C_Base_dResult_dOk (C_Base_dPair_dPair (C_Base_dPair_dPair (fname, pat2), bound))
  | _ -> vuna_fail "compiler/lib/Vuna/Compiler/Loader.vuna" 428 5 ("case pattern match failure")))
  | _ -> vuna_fail "compiler/lib/Vuna/Compiler/Loader.vuna" 426 1 ("no matching clause for Vuna.Compiler.Loader.resolveRecordPatternField")

let rec v_Vuna_dCompiler_dLoader_dcollectRecBinds = fun a0 a1 a2 a3 a4 a5 -> match (a0, a1, a2, a3, a4, a5) with
  | (modules, label, prefix, ownCtors, imports, []) -> C_Base_dResult_dOk (C_Base_dPair_dPair ([], []))
  | (modules, label, prefix, ownCtors, imports, (C_Base_dPair_dPair (pat, value)) :: (rest)) -> v_Base_dResult_dandThen (v_Vuna_dCompiler_dLoader_dresolvePattern modules label prefix ownCtors imports pat) (fun pr -> (match pr with
  | C_Base_dPair_dPair (pat2, bound) -> v_Base_dResult_dandThen (v_Vuna_dCompiler_dLoader_dcollectRecBinds modules label prefix ownCtors imports rest) (fun r -> (match r with
  | C_Base_dPair_dPair (names, tail) -> C_Base_dResult_dOk (C_Base_dPair_dPair (v_Base_dList_dappend bound names, (C_Base_dPair_dPair (pat2, value)) :: (tail)))
  | _ -> vuna_fail "compiler/lib/Vuna/Compiler/Loader.vuna" 473 11 ("case pattern match failure")))
  | _ -> vuna_fail "compiler/lib/Vuna/Compiler/Loader.vuna" 470 5 ("case pattern match failure")))
  | _ -> vuna_fail "compiler/lib/Vuna/Compiler/Loader.vuna" 467 1 ("no matching clause for Vuna.Compiler.Loader.collectRecBinds")

let rec v_Vuna_dCompiler_dLoader_ddesugarDo = fun a0 -> match a0 with
  | ([]) -> C_Base_dResult_dErr ("do block needs at least one statement")
  | ((C_Vuna_dCompiler_dAst_dDExpr (e, sp)) :: ([])) -> C_Base_dResult_dOk (e)
  | ((C_Vuna_dCompiler_dAst_dDExpr (e, sp)) :: (rest)) -> v_Base_dResult_dandThen (v_Vuna_dCompiler_dLoader_ddesugarDo rest) (fun tail -> C_Base_dResult_dOk (C_Vuna_dCompiler_dAst_dEApp (C_Vuna_dCompiler_dAst_dEVar ("bind", sp), (e) :: ((C_Vuna_dCompiler_dAst_dELam (("vuna_do_ignore") :: ([]), tail, sp)) :: ([])), sp)))
  | ((C_Vuna_dCompiler_dAst_dDBind (C_Vuna_dCompiler_dAst_dPVar (name, psp), e, sp)) :: (rest)) -> v_Base_dResult_dandThen (v_Vuna_dCompiler_dLoader_ddesugarDo rest) (fun tail -> C_Base_dResult_dOk (C_Vuna_dCompiler_dAst_dEApp (C_Vuna_dCompiler_dAst_dEVar ("bind", sp), (e) :: ((C_Vuna_dCompiler_dAst_dELam ((name) :: ([]), tail, sp)) :: ([])), sp)))
  | ((C_Vuna_dCompiler_dAst_dDBind (C_Vuna_dCompiler_dAst_dPWild (psp), e, sp)) :: (rest)) -> v_Base_dResult_dandThen (v_Vuna_dCompiler_dLoader_ddesugarDo rest) (fun tail -> C_Base_dResult_dOk (C_Vuna_dCompiler_dAst_dEApp (C_Vuna_dCompiler_dAst_dEVar ("bind", sp), (e) :: ((C_Vuna_dCompiler_dAst_dELam (("vuna_do_ignore") :: ([]), tail, sp)) :: ([])), sp)))
  | ((C_Vuna_dCompiler_dAst_dDBind (pat, e, sp)) :: (rest)) -> C_Base_dResult_dErr ("do bind pattern must be a variable or _")
  | _ -> vuna_fail "compiler/lib/Vuna/Compiler/Loader.vuna" 534 1 ("no matching clause for Vuna.Compiler.Loader.desugarDo")

let v_Vuna_dCompiler_dLoader_dresolveCtorDecl = fun label prefix ctor -> if v_Vuna_dCompiler_dLoader_disGlobalCtor ctor then C_Base_dResult_dOk (ctor) else v_Base_dResult_dandThen (v_Vuna_dCompiler_dLoader_dcheckTopName label ctor) (fun _u -> C_Base_dResult_dOk (v_Vuna_dCompiler_dLoader_dmangle prefix ctor))

let v_Vuna_dCompiler_dLoader_disLowerTypeName = fun name -> (match bi_str_unpack name with
  | [] -> false
  | (c) :: (rest) -> v_Vuna_dCompiler_dLexer_disLowerChar c
  | _ -> vuna_fail "compiler/lib/Vuna/Compiler/Loader.vuna" 560 3 ("case pattern match failure"))

let v_Vuna_dCompiler_dLoader_dstartsUpperName = fun name -> (match bi_str_unpack name with
  | [] -> false
  | (c) :: (rest) -> (if (v_vuna_uge_uint c 65) then (v_vuna_ule_uint c 90) else false)
  | _ -> vuna_fail "compiler/lib/Vuna/Compiler/Loader.vuna" 565 3 ("case pattern match failure"))

let v_Vuna_dCompiler_dLoader_dresolveTypeName = fun modules label prefix ownTypes imports name -> if (if ((if ((if ((if (v_vuna_ueq_ustr name "Int") then true else (v_vuna_ueq_ustr name "String"))) then true else (v_vuna_ueq_ustr name "Bool"))) then true else (v_vuna_ueq_ustr name "Type"))) then true else (v_vuna_ueq_ustr name "->")) then C_Base_dResult_dOk (name) else if v_Vuna_dCompiler_dLoader_disBuiltinTraitName name then C_Base_dResult_dOk (name) else if v_Vuna_dCompiler_dLoader_disLowerTypeName name then C_Base_dResult_dOk (name) else if v_Vuna_dCompiler_dCommon_dcontainsDot name then (match v_Vuna_dCompiler_dCommon_dsplitLastDot (v_Vuna_dCompiler_dCommon_dsplitOnDot name) with
  | C_Base_dPair_dPair (revPrefix, base) -> (let typePrefix = v_Vuna_dCompiler_dCommon_djoinDots revPrefix in (match v_Vuna_dCompiler_dLoader_dfindImportPrefix imports typePrefix with
  | C_Base_dMaybe_dNothing -> C_Base_dResult_dErr ((let vuna_cat0' = (label) in (let vuna_cat1' = (": module ") in (let vuna_cat2' = (typePrefix) in (let vuna_cat3' = (" is not imported") in String.concat "" [vuna_cat0'; vuna_cat1'; vuna_cat2'; vuna_cat3'])))))
  | C_Base_dMaybe_dJust (m) -> (match v_Vuna_dCompiler_dLoader_dfindExportType (v_Vuna_dCompiler_dLoader_dexportsOf modules m) base with
  | C_Base_dMaybe_dJust (e) -> C_Base_dResult_dOk (v_Vuna_dCompiler_dLoader_dentryTarget e)
  | C_Base_dMaybe_dNothing -> C_Base_dResult_dErr ((let vuna_cat0' = (label) in (let vuna_cat1' = (": type ") in (let vuna_cat2' = (base) in (let vuna_cat3' = (" is not exported by ") in (let vuna_cat4' = (m) in String.concat "" [vuna_cat0'; vuna_cat1'; vuna_cat2'; vuna_cat3'; vuna_cat4']))))))
  | _ -> vuna_fail "compiler/lib/Vuna/Compiler/Loader.vuna" 581 16 ("case pattern match failure"))
  | _ -> vuna_fail "compiler/lib/Vuna/Compiler/Loader.vuna" 578 12 ("case pattern match failure")))
  | _ -> vuna_fail "compiler/lib/Vuna/Compiler/Loader.vuna" 575 5 ("case pattern match failure")) else if v_Base_dList_dmemName name ownTypes then C_Base_dResult_dOk (v_Vuna_dCompiler_dLoader_dmangle prefix name) else (match v_Vuna_dCompiler_dLoader_dmodulesExportingType modules imports name with
  | [] -> C_Base_dResult_dErr ((let vuna_cat0' = (label) in (let vuna_cat1' = (": unknown type ") in (let vuna_cat2' = (name) in String.concat "" [vuna_cat0'; vuna_cat1'; vuna_cat2']))))
  | pairs -> v_Base_dResult_dandThen (v_Vuna_dCompiler_dLoader_dunifyEntryPairs label "type" name pairs) (fun p -> C_Base_dResult_dOk (v_Vuna_dCompiler_dLoader_dentryTarget (v_Base_dPair_dsecondOf p)))
  | _ -> vuna_fail "compiler/lib/Vuna/Compiler/Loader.vuna" 586 5 ("case pattern match failure"))

let v_Vuna_dCompiler_dLoader_dresolveTypeTopName = fun label prefix name -> v_Base_dResult_dandThen (v_Vuna_dCompiler_dLoader_dcheckTopName label name) (fun _u -> C_Base_dResult_dOk (v_Vuna_dCompiler_dLoader_dmangle prefix name))

let v_Vuna_dCompiler_dLoader_dresolveInstanceName = fun a0 a1 a2 -> match (a0, a1, a2) with
  | (label, prefix, C_Base_dMaybe_dNothing) -> C_Base_dResult_dOk (C_Base_dMaybe_dJust (v_Vuna_dCompiler_dLoader_dmangle prefix "#default"))
  | (label, prefix, C_Base_dMaybe_dJust (name)) -> v_Base_dResult_dandThen (v_Vuna_dCompiler_dLoader_dresolveTopName label prefix name) (fun n -> C_Base_dResult_dOk (C_Base_dMaybe_dJust (n)))
  | _ -> vuna_fail "compiler/lib/Vuna/Compiler/Loader.vuna" 654 1 ("no matching clause for Vuna.Compiler.Loader.resolveInstanceName")

let v_Vuna_dCompiler_dLoader_disPrivateName = fun name -> v_Base_dString_dstartsWith "_" name

let v_Vuna_dCompiler_dLoader_dprivateExportMsg = fun prefix sp name -> (let vuna_cat0' = (prefix) in (let vuna_cat1' = (": ") in (let vuna_cat2' = (v_Vuna_dCompiler_dCommon_dshowSpanLoc sp) in (let vuna_cat3' = (": cannot export private name ") in (let vuna_cat4' = (name) in (let vuna_cat5' = (" (names starting with _ are module-private)") in String.concat "" [vuna_cat0'; vuna_cat1'; vuna_cat2'; vuna_cat3'; vuna_cat4'; vuna_cat5']))))))

let rec v_Vuna_dCompiler_dLoader_dfindOwnData = fun name decls -> (match decls with
  | [] -> C_Base_dMaybe_dNothing
  | (d) :: (rest) -> (match d with
  | C_Vuna_dCompiler_dAst_dDData (dname, params, kind, ctors, derivings, sp) -> if v_vuna_ueq_ustr dname name then C_Base_dMaybe_dJust (C_Base_dPair_dPair (dname, v_Base_dList_dmap v_Vuna_dCompiler_dAst_dctorName ctors)) else v_Vuna_dCompiler_dLoader_dfindOwnData name rest
  | C_Vuna_dCompiler_dAst_dDRecord (dname, params, fields, derivings, sp) -> if v_vuna_ueq_ustr dname name then C_Base_dMaybe_dJust (C_Base_dPair_dPair (dname, (dname) :: ([]))) else v_Vuna_dCompiler_dLoader_dfindOwnData name rest
  | C_Vuna_dCompiler_dAst_dDTrait (tname, params, methods, sp) -> if v_vuna_ueq_ustr tname name then C_Base_dMaybe_dJust (C_Base_dPair_dPair (tname, v_Base_dList_dmap v_Base_dPair_dfirstOf methods)) else v_Vuna_dCompiler_dLoader_dfindOwnData name rest
  | _ -> v_Vuna_dCompiler_dLoader_dfindOwnData name rest
  | _ -> vuna_fail "compiler/lib/Vuna/Compiler/Loader.vuna" 707 7 ("case pattern match failure"))
  | _ -> vuna_fail "compiler/lib/Vuna/Compiler/Loader.vuna" 704 3 ("case pattern match failure"))

let rec v_Vuna_dCompiler_dLoader_dfindOwnFn = fun name decls -> (match decls with
  | [] -> C_Base_dMaybe_dNothing
  | (d) :: (rest) -> (match d with
  | C_Vuna_dCompiler_dAst_dDFun (n, pats, body, sp) -> if v_vuna_ueq_ustr n name then C_Base_dMaybe_dJust (name) else v_Vuna_dCompiler_dLoader_dfindOwnFn name rest
  | C_Vuna_dCompiler_dAst_dDSig (n, ty, sp) -> if v_vuna_ueq_ustr n name then C_Base_dMaybe_dJust (name) else v_Vuna_dCompiler_dLoader_dfindOwnFn name rest
  | _ -> v_Vuna_dCompiler_dLoader_dfindOwnFn name rest
  | _ -> vuna_fail "compiler/lib/Vuna/Compiler/Loader.vuna" 720 7 ("case pattern match failure"))
  | _ -> vuna_fail "compiler/lib/Vuna/Compiler/Loader.vuna" 717 3 ("case pattern match failure"))

let rec v_Vuna_dCompiler_dLoader_dfindCtorNamed = fun name ctors -> (match ctors with
  | [] -> C_Base_dMaybe_dNothing
  | (c) :: (rest) -> if v_vuna_ueq_ustr (v_Vuna_dCompiler_dAst_dctorName c) name then C_Base_dMaybe_dJust (v_Vuna_dCompiler_dAst_dctorName c) else v_Vuna_dCompiler_dLoader_dfindCtorNamed name rest
  | _ -> vuna_fail "compiler/lib/Vuna/Compiler/Loader.vuna" 726 3 ("case pattern match failure"))

let rec v_Vuna_dCompiler_dLoader_dfindMethodNamed = fun name methods -> (match methods with
  | [] -> C_Base_dMaybe_dNothing
  | (C_Base_dPair_dPair (mname, ty)) :: (rest) -> if v_vuna_ueq_ugeneric mname name then C_Base_dMaybe_dJust (mname) else v_Vuna_dCompiler_dLoader_dfindMethodNamed name rest
  | _ -> vuna_fail "compiler/lib/Vuna/Compiler/Loader.vuna" 732 3 ("case pattern match failure"))

let rec v_Vuna_dCompiler_dLoader_dfindOwnInstanceName = fun name decls -> (match decls with
  | [] -> C_Base_dMaybe_dNothing
  | (d) :: (rest) -> (match d with
  | C_Vuna_dCompiler_dAst_dDInstance (iname, isDefault, head, methods, sp) -> if isDefault then v_Vuna_dCompiler_dLoader_dfindOwnInstanceName name rest else (match iname with
  | C_Base_dMaybe_dJust (n) -> if v_vuna_ueq_ustr n name then C_Base_dMaybe_dJust (n) else v_Vuna_dCompiler_dLoader_dfindOwnInstanceName name rest
  | C_Base_dMaybe_dNothing -> v_Vuna_dCompiler_dLoader_dfindOwnInstanceName name rest
  | _ -> vuna_fail "compiler/lib/Vuna/Compiler/Loader.vuna" 745 13 ("case pattern match failure"))
  | _ -> v_Vuna_dCompiler_dLoader_dfindOwnInstanceName name rest
  | _ -> vuna_fail "compiler/lib/Vuna/Compiler/Loader.vuna" 741 7 ("case pattern match failure"))
  | _ -> vuna_fail "compiler/lib/Vuna/Compiler/Loader.vuna" 738 3 ("case pattern match failure"))

let rec v_Vuna_dCompiler_dLoader_dfindOwnCtorName = fun name decls -> (match decls with
  | [] -> C_Base_dMaybe_dNothing
  | (d) :: (rest) -> (match d with
  | C_Vuna_dCompiler_dAst_dDData (dname, params, kind, ctors, derivings, sp) -> (match v_Vuna_dCompiler_dLoader_dfindCtorNamed name ctors with
  | C_Base_dMaybe_dJust (cname) -> C_Base_dMaybe_dJust (C_Base_dPair_dPair (dname, cname))
  | C_Base_dMaybe_dNothing -> v_Vuna_dCompiler_dLoader_dfindOwnCtorName name rest
  | _ -> vuna_fail "compiler/lib/Vuna/Compiler/Loader.vuna" 756 11 ("case pattern match failure"))
  | C_Vuna_dCompiler_dAst_dDRecord (dname, params, fields, derivings, sp) -> if v_vuna_ueq_ustr dname name then C_Base_dMaybe_dJust (C_Base_dPair_dPair (dname, dname)) else v_Vuna_dCompiler_dLoader_dfindOwnCtorName name rest
  | C_Vuna_dCompiler_dAst_dDTrait (tname, params, methods, sp) -> (match v_Vuna_dCompiler_dLoader_dfindMethodNamed name methods with
  | C_Base_dMaybe_dJust (mname) -> C_Base_dMaybe_dJust (C_Base_dPair_dPair (tname, mname))
  | C_Base_dMaybe_dNothing -> v_Vuna_dCompiler_dLoader_dfindOwnCtorName name rest
  | _ -> vuna_fail "compiler/lib/Vuna/Compiler/Loader.vuna" 762 11 ("case pattern match failure"))
  | _ -> v_Vuna_dCompiler_dLoader_dfindOwnCtorName name rest
  | _ -> vuna_fail "compiler/lib/Vuna/Compiler/Loader.vuna" 754 7 ("case pattern match failure"))
  | _ -> vuna_fail "compiler/lib/Vuna/Compiler/Loader.vuna" 751 3 ("case pattern match failure"))

let rec v_Vuna_dCompiler_dLoader_downCtorEntries = fun prefix dname names -> (match names with
  | [] -> []
  | (cname) :: (rest) -> if v_Vuna_dCompiler_dLoader_disPrivateName cname then v_Vuna_dCompiler_dLoader_downCtorEntries prefix dname rest else (C_Vuna_dCompiler_dLoader_dExportEntry ("ctor", cname, v_Vuna_dCompiler_dLoader_dmangle prefix cname, v_Vuna_dCompiler_dLoader_dmangle prefix dname)) :: (v_Vuna_dCompiler_dLoader_downCtorEntries prefix dname rest)
  | _ -> vuna_fail "compiler/lib/Vuna/Compiler/Loader.vuna" 768 3 ("case pattern match failure"))

let rec v_Vuna_dCompiler_dLoader_dctorEntriesOfType = fun typeTarget entries -> (match entries with
  | [] -> []
  | (e) :: (rest) -> if (if (v_vuna_ueq_ustr (v_Vuna_dCompiler_dLoader_dentryKind e) "ctor") then (v_vuna_ueq_ustr (v_Vuna_dCompiler_dLoader_dentryParent e) typeTarget) else false) then (e) :: (v_Vuna_dCompiler_dLoader_dctorEntriesOfType typeTarget rest) else v_Vuna_dCompiler_dLoader_dctorEntriesOfType typeTarget rest
  | _ -> vuna_fail "compiler/lib/Vuna/Compiler/Loader.vuna" 780 3 ("case pattern match failure"))

let v_Vuna_dCompiler_dLoader_ddeclImplicitExports = fun prefix d -> (match d with
  | C_Vuna_dCompiler_dAst_dDData (dname, params, kind, ctors, derivings, sp) -> if v_Vuna_dCompiler_dLoader_disPrivateName dname then [] else (C_Vuna_dCompiler_dLoader_dExportEntry ("type", dname, v_Vuna_dCompiler_dLoader_dmangle prefix dname, "")) :: (v_Vuna_dCompiler_dLoader_downCtorEntries prefix dname (v_Base_dList_dmap v_Vuna_dCompiler_dAst_dctorName ctors))
  | C_Vuna_dCompiler_dAst_dDRecord (dname, params, fields, derivings, sp) -> if v_Vuna_dCompiler_dLoader_disPrivateName dname then [] else (C_Vuna_dCompiler_dLoader_dExportEntry ("type", dname, v_Vuna_dCompiler_dLoader_dmangle prefix dname, "")) :: (v_Vuna_dCompiler_dLoader_downCtorEntries prefix dname ((dname) :: ([])))
  | C_Vuna_dCompiler_dAst_dDTrait (tname, params, methods, sp) -> if v_Vuna_dCompiler_dLoader_disPrivateName tname then [] else (C_Vuna_dCompiler_dLoader_dExportEntry ("type", tname, v_Vuna_dCompiler_dLoader_dmangle prefix tname, "")) :: (v_Vuna_dCompiler_dLoader_downCtorEntries prefix tname (v_Base_dList_dmap v_Base_dPair_dfirstOf methods))
  | C_Vuna_dCompiler_dAst_dDInstance (iname, isDefault, head, methods, sp) -> if isDefault then [] else (match iname with
  | C_Base_dMaybe_dNothing -> []
  | C_Base_dMaybe_dJust (name) -> if v_Vuna_dCompiler_dLoader_disPrivateName name then [] else (C_Vuna_dCompiler_dLoader_dExportEntry ("val", name, v_Vuna_dCompiler_dLoader_dmangle prefix name, "")) :: ([])
  | _ -> vuna_fail "compiler/lib/Vuna/Compiler/Loader.vuna" 810 9 ("case pattern match failure"))
  | C_Vuna_dCompiler_dAst_dDSig (name, ty, sp) -> if v_Vuna_dCompiler_dLoader_disPrivateName name then [] else (C_Vuna_dCompiler_dLoader_dExportEntry ("val", name, v_Vuna_dCompiler_dLoader_dmangle prefix name, "")) :: ([])
  | C_Vuna_dCompiler_dAst_dDFun (name, pats, body, sp) -> if v_Vuna_dCompiler_dLoader_disPrivateName name then [] else (C_Vuna_dCompiler_dLoader_dExportEntry ("val", name, v_Vuna_dCompiler_dLoader_dmangle prefix name, "")) :: ([])
  | _ -> vuna_fail "compiler/lib/Vuna/Compiler/Loader.vuna" 788 3 ("case pattern match failure"))

let v_Vuna_dCompiler_dLoader_drefKind = fun a0 -> match a0 with
  | (C_Vuna_dCompiler_dLoader_dExportRef (k, tgt, parent)) -> k
  | _ -> vuna_fail "compiler/lib/Vuna/Compiler/Loader.vuna" 832 1 ("no matching clause for Vuna.Compiler.Loader.refKind")

let v_Vuna_dCompiler_dLoader_drefTarget = fun a0 -> match a0 with
  | (C_Vuna_dCompiler_dLoader_dExportRef (k, tgt, parent)) -> tgt
  | _ -> vuna_fail "compiler/lib/Vuna/Compiler/Loader.vuna" 834 1 ("no matching clause for Vuna.Compiler.Loader.refTarget")

let rec v_Vuna_dCompiler_dLoader_disRecordDecl = fun dname decls -> (match decls with
  | [] -> false
  | (d) :: (rest) -> (match d with
  | C_Vuna_dCompiler_dAst_dDRecord (dn, params, fields, derivings, sp) -> if v_vuna_ueq_ustr dn dname then true else v_Vuna_dCompiler_dLoader_disRecordDecl dname rest
  | _ -> v_Vuna_dCompiler_dLoader_disRecordDecl dname rest
  | _ -> vuna_fail "compiler/lib/Vuna/Compiler/Loader.vuna" 863 7 ("case pattern match failure"))
  | _ -> vuna_fail "compiler/lib/Vuna/Compiler/Loader.vuna" 860 3 ("case pattern match failure"))

let v_Vuna_dCompiler_dLoader_disRecordTarget = fun modules decls prefix target -> (match v_Vuna_dCompiler_dCommon_dsplitLastDot (v_Vuna_dCompiler_dCommon_dsplitOnDot target) with
  | C_Base_dPair_dPair (revPrefix, base) -> (let m = v_Vuna_dCompiler_dCommon_djoinDots revPrefix in if v_vuna_ueq_ustr m prefix then v_Vuna_dCompiler_dLoader_disRecordDecl base decls else (match v_Vuna_dCompiler_dLoader_dfindModule modules m with
  | C_Base_dMaybe_dJust (C_Vuna_dCompiler_dLoader_dModule (mname, mpkg, mimports, mimps, dcs, exports)) -> v_Vuna_dCompiler_dLoader_disRecordDecl base dcs
  | C_Base_dMaybe_dNothing -> false
  | _ -> vuna_fail "compiler/lib/Vuna/Compiler/Loader.vuna" 855 12 ("case pattern match failure")))
  | _ -> vuna_fail "compiler/lib/Vuna/Compiler/Loader.vuna" 850 3 ("case pattern match failure"))

let v_Vuna_dCompiler_dLoader_dtypeRefDominates = fun modules decls prefix tr vr -> (match tr with
  | C_Base_dMaybe_dJust (C_Vuna_dCompiler_dLoader_dExportRef (tk, tt, tp)) -> (match vr with
  | C_Base_dMaybe_dJust (C_Vuna_dCompiler_dLoader_dExportRef (vk, vt, vp)) -> if (if ((if (v_vuna_ueq_ustr tk "type") then (v_vuna_ueq_ustr vk "ctor") else false)) then (v_vuna_ueq_ustr tt vt) else false) then v_Vuna_dCompiler_dLoader_disRecordTarget modules decls prefix tt else false
  | C_Base_dMaybe_dNothing -> false
  | _ -> vuna_fail "compiler/lib/Vuna/Compiler/Loader.vuna" 842 7 ("case pattern match failure"))
  | C_Base_dMaybe_dNothing -> false
  | _ -> vuna_fail "compiler/lib/Vuna/Compiler/Loader.vuna" 840 3 ("case pattern match failure"))

let v_Vuna_dCompiler_dLoader_drefEntryList = fun a0 a1 -> match (a0, a1) with
  | (pub, C_Base_dMaybe_dNothing) -> []
  | (pub, C_Base_dMaybe_dJust (C_Vuna_dCompiler_dLoader_dExportRef (k, tgt, parent))) -> (C_Vuna_dCompiler_dLoader_dExportEntry (k, pub, tgt, parent)) :: ([])
  | _ -> vuna_fail "compiler/lib/Vuna/Compiler/Loader.vuna" 868 1 ("no matching clause for Vuna.Compiler.Loader.refEntryList")

let v_Vuna_dCompiler_dLoader_downOrImportedTypeRef = fun modules prefix decls imports name -> (match v_Vuna_dCompiler_dLoader_dfindOwnData name decls with
  | C_Base_dMaybe_dJust (C_Base_dPair_dPair (dname, ctorNames)) -> C_Base_dResult_dOk (C_Base_dMaybe_dJust (C_Vuna_dCompiler_dLoader_dExportRef ("type", v_Vuna_dCompiler_dLoader_dmangle prefix dname, "")))
  | C_Base_dMaybe_dNothing -> (match v_Vuna_dCompiler_dLoader_dmodulesExportingType modules imports name with
  | [] -> C_Base_dResult_dOk (C_Base_dMaybe_dNothing)
  | pairs -> (match v_Vuna_dCompiler_dLoader_dunifyEntryPairs prefix "type" name pairs with
  | C_Base_dResult_dErr (e) -> C_Base_dResult_dErr (e)
  | C_Base_dResult_dOk (p) -> C_Base_dResult_dOk (C_Base_dMaybe_dJust (C_Vuna_dCompiler_dLoader_dExportRef ("type", v_Vuna_dCompiler_dLoader_dentryTarget (v_Base_dPair_dsecondOf p), "")))
  | _ -> vuna_fail "compiler/lib/Vuna/Compiler/Loader.vuna" 879 11 ("case pattern match failure"))
  | _ -> vuna_fail "compiler/lib/Vuna/Compiler/Loader.vuna" 876 7 ("case pattern match failure"))
  | _ -> vuna_fail "compiler/lib/Vuna/Compiler/Loader.vuna" 873 3 ("case pattern match failure"))

let v_Vuna_dCompiler_dLoader_downOrImportedValueRef2 = fun modules prefix decls imports name -> (match v_Vuna_dCompiler_dLoader_dfindOwnCtorName name decls with
  | C_Base_dMaybe_dJust (C_Base_dPair_dPair (dname, cname)) -> C_Base_dResult_dOk (C_Base_dMaybe_dJust (C_Vuna_dCompiler_dLoader_dExportRef ("ctor", v_Vuna_dCompiler_dLoader_dmangle prefix cname, v_Vuna_dCompiler_dLoader_dmangle prefix dname)))
  | C_Base_dMaybe_dNothing -> (match v_Vuna_dCompiler_dLoader_dmodulesExportingValue modules imports name with
  | [] -> C_Base_dResult_dOk (C_Base_dMaybe_dNothing)
  | pairs -> (match v_Vuna_dCompiler_dLoader_dunifyEntryPairs prefix "name" name pairs with
  | C_Base_dResult_dErr (e) -> C_Base_dResult_dErr (e)
  | C_Base_dResult_dOk (p) -> (let e = v_Base_dPair_dsecondOf p in C_Base_dResult_dOk (C_Base_dMaybe_dJust (C_Vuna_dCompiler_dLoader_dExportRef (v_Vuna_dCompiler_dLoader_dentryKind e, v_Vuna_dCompiler_dLoader_dentryTarget e, v_Vuna_dCompiler_dLoader_dentryParent e))))
  | _ -> vuna_fail "compiler/lib/Vuna/Compiler/Loader.vuna" 900 15 ("case pattern match failure"))
  | _ -> vuna_fail "compiler/lib/Vuna/Compiler/Loader.vuna" 897 11 ("case pattern match failure"))
  | _ -> vuna_fail "compiler/lib/Vuna/Compiler/Loader.vuna" 893 3 ("case pattern match failure"))

let v_Vuna_dCompiler_dLoader_downOrImportedValueRef = fun modules prefix decls imports name -> (match v_Vuna_dCompiler_dLoader_dfindOwnFn name decls with
  | C_Base_dMaybe_dJust (fn) -> C_Base_dResult_dOk (C_Base_dMaybe_dJust (C_Vuna_dCompiler_dLoader_dExportRef ("val", v_Vuna_dCompiler_dLoader_dmangle prefix fn, "")))
  | C_Base_dMaybe_dNothing -> (match v_Vuna_dCompiler_dLoader_dfindOwnInstanceName name decls with
  | C_Base_dMaybe_dJust (iname) -> C_Base_dResult_dOk (C_Base_dMaybe_dJust (C_Vuna_dCompiler_dLoader_dExportRef ("val", v_Vuna_dCompiler_dLoader_dmangle prefix iname, "")))
  | C_Base_dMaybe_dNothing -> v_Vuna_dCompiler_dLoader_downOrImportedValueRef2 modules prefix decls imports name
  | _ -> vuna_fail "compiler/lib/Vuna/Compiler/Loader.vuna" 887 7 ("case pattern match failure"))
  | _ -> vuna_fail "compiler/lib/Vuna/Compiler/Loader.vuna" 884 3 ("case pattern match failure"))

let v_Vuna_dCompiler_dLoader_dexportSelective = fun modules prefix m base name sp -> (match v_Vuna_dCompiler_dLoader_dfindExportValue (v_Vuna_dCompiler_dLoader_dexportsOf modules m) base with
  | C_Base_dMaybe_dJust (e) -> (match v_Vuna_dCompiler_dLoader_dfindExportType (v_Vuna_dCompiler_dLoader_dexportsOf modules m) base with
  | C_Base_dMaybe_dJust (te) -> C_Base_dResult_dOk ((C_Vuna_dCompiler_dLoader_dExportEntry (v_Vuna_dCompiler_dLoader_dentryKind e, base, v_Vuna_dCompiler_dLoader_dentryTarget e, v_Vuna_dCompiler_dLoader_dentryParent e)) :: ((C_Vuna_dCompiler_dLoader_dExportEntry ("type", base, v_Vuna_dCompiler_dLoader_dentryTarget te, "")) :: ([])))
  | C_Base_dMaybe_dNothing -> C_Base_dResult_dOk ((C_Vuna_dCompiler_dLoader_dExportEntry (v_Vuna_dCompiler_dLoader_dentryKind e, base, v_Vuna_dCompiler_dLoader_dentryTarget e, v_Vuna_dCompiler_dLoader_dentryParent e)) :: ([]))
  | _ -> vuna_fail "compiler/lib/Vuna/Compiler/Loader.vuna" 937 7 ("case pattern match failure"))
  | C_Base_dMaybe_dNothing -> (match v_Vuna_dCompiler_dLoader_dfindExportType (v_Vuna_dCompiler_dLoader_dexportsOf modules m) base with
  | C_Base_dMaybe_dJust (te) -> C_Base_dResult_dOk ((C_Vuna_dCompiler_dLoader_dExportEntry ("type", base, v_Vuna_dCompiler_dLoader_dentryTarget te, "")) :: ([]))
  | C_Base_dMaybe_dNothing -> C_Base_dResult_dErr ((let vuna_cat0' = (prefix) in (let vuna_cat1' = (": ") in (let vuna_cat2' = (v_Vuna_dCompiler_dCommon_dshowSpanLoc sp) in (let vuna_cat3' = (": cannot export unknown name ") in (let vuna_cat4' = (name) in String.concat "" [vuna_cat0'; vuna_cat1'; vuna_cat2'; vuna_cat3'; vuna_cat4']))))))
  | _ -> vuna_fail "compiler/lib/Vuna/Compiler/Loader.vuna" 945 7 ("case pattern match failure"))
  | _ -> vuna_fail "compiler/lib/Vuna/Compiler/Loader.vuna" 935 3 ("case pattern match failure"))

let v_Vuna_dCompiler_dLoader_dexportBare = fun modules prefix decls imports name sp -> (match v_Vuna_dCompiler_dCommon_dsplitLastDot (v_Vuna_dCompiler_dCommon_dsplitOnDot name) with
  | C_Base_dPair_dPair (revPrefix, base) -> (match revPrefix with
  | [] -> if v_Vuna_dCompiler_dLoader_disPrivateName name then C_Base_dResult_dErr (v_Vuna_dCompiler_dLoader_dprivateExportMsg prefix sp name) else v_Base_dResult_dandThen (v_Vuna_dCompiler_dLoader_downOrImportedTypeRef modules prefix decls imports name) (fun tr -> v_Base_dResult_dandThen (v_Vuna_dCompiler_dLoader_downOrImportedValueRef modules prefix decls imports name) (fun vr -> (match tr with
  | C_Base_dMaybe_dNothing -> (match vr with
  | C_Base_dMaybe_dNothing -> C_Base_dResult_dErr ((let vuna_cat0' = (prefix) in (let vuna_cat1' = (": ") in (let vuna_cat2' = (v_Vuna_dCompiler_dCommon_dshowSpanLoc sp) in (let vuna_cat3' = (": cannot export unknown name ") in (let vuna_cat4' = (name) in String.concat "" [vuna_cat0'; vuna_cat1'; vuna_cat2'; vuna_cat3'; vuna_cat4']))))))
  | C_Base_dMaybe_dJust (_) -> C_Base_dResult_dOk (v_Vuna_dCompiler_dLoader_drefEntryList name vr)
  | _ -> vuna_fail "compiler/lib/Vuna/Compiler/Loader.vuna" 917 21 ("case pattern match failure"))
  | C_Base_dMaybe_dJust (_) -> (match vr with
  | C_Base_dMaybe_dNothing -> C_Base_dResult_dOk (v_Vuna_dCompiler_dLoader_drefEntryList name tr)
  | C_Base_dMaybe_dJust (_) -> if v_Vuna_dCompiler_dLoader_dtypeRefDominates modules decls prefix tr vr then C_Base_dResult_dOk (v_Vuna_dCompiler_dLoader_drefEntryList name tr) else C_Base_dResult_dOk (v_Base_dList_dappend (v_Vuna_dCompiler_dLoader_drefEntryList name tr) (v_Vuna_dCompiler_dLoader_drefEntryList name vr))
  | _ -> vuna_fail "compiler/lib/Vuna/Compiler/Loader.vuna" 922 21 ("case pattern match failure"))
  | _ -> vuna_fail "compiler/lib/Vuna/Compiler/Loader.vuna" 915 17 ("case pattern match failure"))))
  | _ -> (let mprefix = v_Vuna_dCompiler_dCommon_djoinDots revPrefix in (match v_Vuna_dCompiler_dLoader_dfindImportPrefix imports mprefix with
  | C_Base_dMaybe_dNothing -> C_Base_dResult_dErr ((let vuna_cat0' = (prefix) in (let vuna_cat1' = (": ") in (let vuna_cat2' = (v_Vuna_dCompiler_dCommon_dshowSpanLoc sp) in (let vuna_cat3' = (": module ") in (let vuna_cat4' = (mprefix) in (let vuna_cat5' = (" is not imported") in String.concat "" [vuna_cat0'; vuna_cat1'; vuna_cat2'; vuna_cat3'; vuna_cat4'; vuna_cat5'])))))))
  | C_Base_dMaybe_dJust (m) -> v_Vuna_dCompiler_dLoader_dexportSelective modules prefix m base name sp
  | _ -> vuna_fail "compiler/lib/Vuna/Compiler/Loader.vuna" 929 14 ("case pattern match failure")))
  | _ -> vuna_fail "compiler/lib/Vuna/Compiler/Loader.vuna" 909 7 ("case pattern match failure"))
  | _ -> vuna_fail "compiler/lib/Vuna/Compiler/Loader.vuna" 907 3 ("case pattern match failure"))

let v_Vuna_dCompiler_dLoader_dexportTypeAll = fun modules prefix decls imports name sp -> (match v_Vuna_dCompiler_dCommon_dsplitLastDot (v_Vuna_dCompiler_dCommon_dsplitOnDot name) with
  | C_Base_dPair_dPair (revPrefix, base) -> (match revPrefix with
  | [] -> if v_Vuna_dCompiler_dLoader_disPrivateName name then C_Base_dResult_dErr (v_Vuna_dCompiler_dLoader_dprivateExportMsg prefix sp name) else (match v_Vuna_dCompiler_dLoader_dfindOwnData name decls with
  | C_Base_dMaybe_dJust (C_Base_dPair_dPair (dname, ctorNames)) -> C_Base_dResult_dOk ((C_Vuna_dCompiler_dLoader_dExportEntry ("type", name, v_Vuna_dCompiler_dLoader_dmangle prefix dname, "")) :: (v_Vuna_dCompiler_dLoader_downCtorEntries prefix dname ctorNames))
  | C_Base_dMaybe_dNothing -> (match v_Vuna_dCompiler_dLoader_dmodulesExportingType modules imports name with
  | [] -> C_Base_dResult_dErr ((let vuna_cat0' = (prefix) in (let vuna_cat1' = (": ") in (let vuna_cat2' = (v_Vuna_dCompiler_dCommon_dshowSpanLoc sp) in (let vuna_cat3' = (": cannot export unknown name ") in (let vuna_cat4' = (name) in String.concat "" [vuna_cat0'; vuna_cat1'; vuna_cat2'; vuna_cat3'; vuna_cat4']))))))
  | pairs -> (match v_Vuna_dCompiler_dLoader_dunifyEntryPairs prefix "type" name pairs with
  | C_Base_dResult_dErr (e) -> C_Base_dResult_dErr (e)
  | C_Base_dResult_dOk (p) -> (let m = v_Base_dPair_dfirstOf p in (let tgt = v_Vuna_dCompiler_dLoader_dentryTarget (v_Base_dPair_dsecondOf p) in C_Base_dResult_dOk ((C_Vuna_dCompiler_dLoader_dExportEntry ("type", name, tgt, "")) :: (v_Vuna_dCompiler_dLoader_dctorEntriesOfType tgt (v_Vuna_dCompiler_dLoader_dexportsOf modules m)))))
  | _ -> vuna_fail "compiler/lib/Vuna/Compiler/Loader.vuna" 968 21 ("case pattern match failure"))
  | _ -> vuna_fail "compiler/lib/Vuna/Compiler/Loader.vuna" 964 17 ("case pattern match failure"))
  | _ -> vuna_fail "compiler/lib/Vuna/Compiler/Loader.vuna" 957 13 ("case pattern match failure"))
  | _ -> (let mprefix = v_Vuna_dCompiler_dCommon_djoinDots revPrefix in (match v_Vuna_dCompiler_dLoader_dfindImportPrefix imports mprefix with
  | C_Base_dMaybe_dNothing -> C_Base_dResult_dErr ((let vuna_cat0' = (prefix) in (let vuna_cat1' = (": ") in (let vuna_cat2' = (v_Vuna_dCompiler_dCommon_dshowSpanLoc sp) in (let vuna_cat3' = (": module ") in (let vuna_cat4' = (mprefix) in (let vuna_cat5' = (" is not imported") in String.concat "" [vuna_cat0'; vuna_cat1'; vuna_cat2'; vuna_cat3'; vuna_cat4'; vuna_cat5'])))))))
  | C_Base_dMaybe_dJust (m) -> (match v_Vuna_dCompiler_dLoader_dfindExportType (v_Vuna_dCompiler_dLoader_dexportsOf modules m) base with
  | C_Base_dMaybe_dJust (e) -> C_Base_dResult_dOk ((C_Vuna_dCompiler_dLoader_dExportEntry ("type", base, v_Vuna_dCompiler_dLoader_dentryTarget e, "")) :: (v_Vuna_dCompiler_dLoader_dctorEntriesOfType (v_Vuna_dCompiler_dLoader_dentryTarget e) (v_Vuna_dCompiler_dLoader_dexportsOf modules m)))
  | C_Base_dMaybe_dNothing -> C_Base_dResult_dErr ((let vuna_cat0' = (prefix) in (let vuna_cat1' = (": ") in (let vuna_cat2' = (v_Vuna_dCompiler_dCommon_dshowSpanLoc sp) in (let vuna_cat3' = (": type ") in (let vuna_cat4' = (base) in (let vuna_cat5' = (" is not exported by ") in (let vuna_cat6' = (m) in String.concat "" [vuna_cat0'; vuna_cat1'; vuna_cat2'; vuna_cat3'; vuna_cat4'; vuna_cat5'; vuna_cat6']))))))))
  | _ -> vuna_fail "compiler/lib/Vuna/Compiler/Loader.vuna" 983 18 ("case pattern match failure"))
  | _ -> vuna_fail "compiler/lib/Vuna/Compiler/Loader.vuna" 979 14 ("case pattern match failure")))
  | _ -> vuna_fail "compiler/lib/Vuna/Compiler/Loader.vuna" 953 7 ("case pattern match failure"))
  | _ -> vuna_fail "compiler/lib/Vuna/Compiler/Loader.vuna" 951 3 ("case pattern match failure"))

let v_Vuna_dCompiler_dLoader_dexportItemEntries = fun modules prefix decls imports item -> (match item with
  | C_Vuna_dCompiler_dAst_dXModule (name, sp) -> (match v_Vuna_dCompiler_dLoader_dfindImportPrefix imports name with
  | C_Base_dMaybe_dNothing -> C_Base_dResult_dErr ((let vuna_cat0' = (prefix) in (let vuna_cat1' = (": ") in (let vuna_cat2' = (v_Vuna_dCompiler_dCommon_dshowSpanLoc sp) in (let vuna_cat3' = (": module ") in (let vuna_cat4' = (name) in (let vuna_cat5' = (" is not imported") in String.concat "" [vuna_cat0'; vuna_cat1'; vuna_cat2'; vuna_cat3'; vuna_cat4'; vuna_cat5'])))))))
  | C_Base_dMaybe_dJust (m) -> C_Base_dResult_dOk (v_Vuna_dCompiler_dLoader_dexportsOf modules m)
  | _ -> vuna_fail "compiler/lib/Vuna/Compiler/Loader.vuna" 997 7 ("case pattern match failure"))
  | C_Vuna_dCompiler_dAst_dXTypeAll (name, sp) -> v_Vuna_dCompiler_dLoader_dexportTypeAll modules prefix decls imports name sp
  | C_Vuna_dCompiler_dAst_dXBare (name, sp) -> v_Vuna_dCompiler_dLoader_dexportBare modules prefix decls imports name sp
  | _ -> vuna_fail "compiler/lib/Vuna/Compiler/Loader.vuna" 995 3 ("case pattern match failure"))

let rec v_Vuna_dCompiler_dLoader_dhasSamePublicKind = fun e entries -> (match entries with
  | [] -> false
  | (e2) :: (rest) -> if (if (v_vuna_ueq_ustr (v_Vuna_dCompiler_dLoader_dentryKind e) (v_Vuna_dCompiler_dLoader_dentryKind e2)) then (v_vuna_ueq_ustr (v_Vuna_dCompiler_dLoader_dentryPublic e) (v_Vuna_dCompiler_dLoader_dentryPublic e2)) else false) then true else v_Vuna_dCompiler_dLoader_dhasSamePublicKind e rest
  | _ -> vuna_fail "compiler/lib/Vuna/Compiler/Loader.vuna" 1005 3 ("case pattern match failure"))

let rec v_Vuna_dCompiler_dLoader_ddedupeImplicitExports = fun a0 -> match a0 with
  | ([]) -> []
  | ((e) :: (rest)) -> if v_Vuna_dCompiler_dLoader_dhasSamePublicKind e rest then v_Vuna_dCompiler_dLoader_ddedupeImplicitExports rest else (e) :: (v_Vuna_dCompiler_dLoader_ddedupeImplicitExports rest)
  | _ -> vuna_fail "compiler/lib/Vuna/Compiler/Loader.vuna" 826 1 ("no matching clause for Vuna.Compiler.Loader.dedupeImplicitExports")

let v_Vuna_dCompiler_dLoader_dimplicitExports = fun prefix decls -> v_Vuna_dCompiler_dLoader_ddedupeImplicitExports (v_Base_dList_dconcatMap (v_Vuna_dCompiler_dLoader_ddeclImplicitExports prefix) decls)

let rec v_Vuna_dCompiler_dLoader_dcheckExportDuplicates = fun a0 a1 -> match (a0, a1) with
  | (prefix, []) -> C_Base_dResult_dOk ([])
  | (prefix, (e) :: (rest)) -> if v_Vuna_dCompiler_dLoader_dhasSamePublicKind e rest then C_Base_dResult_dErr ((let vuna_cat0' = (prefix) in (let vuna_cat1' = (": duplicate export ") in (let vuna_cat2' = (v_Vuna_dCompiler_dLoader_dentryPublic e) in String.concat "" [vuna_cat0'; vuna_cat1'; vuna_cat2'])))) else v_Vuna_dCompiler_dLoader_dcheckExportDuplicates prefix rest
  | _ -> vuna_fail "compiler/lib/Vuna/Compiler/Loader.vuna" 1011 1 ("no matching clause for Vuna.Compiler.Loader.checkExportDuplicates")

let rec v_Vuna_dCompiler_dLoader_dexplicitExports = fun a0 a1 a2 a3 a4 -> match (a0, a1, a2, a3, a4) with
  | (modules, prefix, decls, imports, []) -> C_Base_dResult_dOk ([])
  | (modules, prefix, decls, imports, (item) :: (rest)) -> v_Base_dResult_dandThen (v_Vuna_dCompiler_dLoader_dexportItemEntries modules prefix decls imports item) (fun es -> v_Base_dResult_dandThen (v_Vuna_dCompiler_dLoader_dexplicitExports modules prefix decls imports rest) (fun tail -> C_Base_dResult_dOk (v_Base_dList_dappend es tail)))
  | _ -> vuna_fail "compiler/lib/Vuna/Compiler/Loader.vuna" 1018 1 ("no matching clause for Vuna.Compiler.Loader.explicitExports")

let v_Vuna_dCompiler_dLoader_dvalidateModuleHeader = fun label hdr -> (match hdr with
  | C_Base_dMaybe_dNothing -> C_Base_dResult_dOk ([])
  | C_Base_dMaybe_dJust (C_Vuna_dCompiler_dAst_dModDecl (declared, hasList, items, sp)) -> if v_vuna_ueq_ustr declared label then C_Base_dResult_dOk ([]) else C_Base_dResult_dErr ((let vuna_cat0' = (label) in (let vuna_cat1' = (": ") in (let vuna_cat2' = (v_Vuna_dCompiler_dCommon_dshowSpanLoc sp) in (let vuna_cat3' = (": module name mismatch: source declares ") in (let vuna_cat4' = (declared) in String.concat "" [vuna_cat0'; vuna_cat1'; vuna_cat2'; vuna_cat3'; vuna_cat4']))))))
  | _ -> vuna_fail "compiler/lib/Vuna/Compiler/Loader.vuna" 1026 3 ("case pattern match failure"))

let v_Vuna_dCompiler_dLoader_dcomputeExports = fun modules prefix hdr imports decls -> (match hdr with
  | C_Base_dMaybe_dNothing -> C_Base_dResult_dOk (v_Vuna_dCompiler_dLoader_dimplicitExports prefix decls)
  | C_Base_dMaybe_dJust (C_Vuna_dCompiler_dAst_dModDecl (declared, hasList, items, sp)) -> if hasList then v_Base_dResult_dandThen (v_Vuna_dCompiler_dLoader_dexplicitExports modules prefix decls imports items) (fun es -> v_Base_dResult_dandThen (v_Vuna_dCompiler_dLoader_dcheckExportDuplicates prefix es) (fun _u -> C_Base_dResult_dOk (es))) else C_Base_dResult_dOk (v_Vuna_dCompiler_dLoader_dimplicitExports prefix decls)
  | _ -> vuna_fail "compiler/lib/Vuna/Compiler/Loader.vuna" 1036 3 ("case pattern match failure"))

let v_Vuna_dCompiler_dLoader_dshowCycle = fun name stack -> v_Vuna_dCompiler_dCommon_djoinArrows (v_Base_dList_dreverse ((name) :: (stack)))

let v_Vuna_dCompiler_dLoader_dimplicitPreludeDeps = fun importerPkg deps -> (match deps with
  | [] -> C_Base_dResult_dOk ([])
  | (_) :: ([]) -> C_Base_dResult_dOk ((C_Vuna_dCompiler_dAst_dImport ("Prelude", false, C_Base_dMaybe_dNothing, C_Vuna_dCompiler_dCommon_dSpan ("", 0, 0, 0, 0))) :: ([]))
  | _ -> C_Base_dResult_dErr ((let vuna_cat0' = ("ambiguous implicit Prelude (found in: ") in (let vuna_cat1' = (v_Vuna_dCompiler_dCommon_djoinArrows (v_Base_dList_dmap (fun c -> v_Vuna_dCompiler_dPkg_drootName (v_Base_dPair_dsecondOf c)) deps)) in (let vuna_cat2' = (")") in String.concat "" [vuna_cat0'; vuna_cat1'; vuna_cat2']))))
  | _ -> vuna_fail "compiler/lib/Vuna/Compiler/Loader.vuna" 1061 3 ("case pattern match failure"))

let v_Vuna_dCompiler_dLoader_dimplicitPreludeFrom = fun roots importerPkg -> (match v_Vuna_dCompiler_dLoader_dcollectModuleFiles roots "Prelude" importerPkg [] [] with
  | C_Base_dPair_dPair (allowed, hidden) -> v_Vuna_dCompiler_dLoader_dimplicitPreludeDeps importerPkg (v_Base_dList_dfilter (fun c -> v_vuna_uneq_ustr (v_Vuna_dCompiler_dPkg_drootName (v_Base_dPair_dsecondOf c)) importerPkg) allowed)
  | _ -> vuna_fail "compiler/lib/Vuna/Compiler/Loader.vuna" 1055 3 ("case pattern match failure"))

let v_Vuna_dCompiler_dLoader_dimplicitPrelude = fun roots importerPkg currentName imports -> if v_vuna_ueq_ustr importerPkg "" then C_Base_dResult_dOk ([]) else if v_vuna_ueq_ustr currentName "Prelude" then C_Base_dResult_dOk ([]) else if v_Base_dList_dmemName "Prelude" (v_Vuna_dCompiler_dLoader_dimportModuleNames imports) then C_Base_dResult_dOk ([]) else v_Vuna_dCompiler_dLoader_dimplicitPreludeFrom roots importerPkg

let rec v_Vuna_dCompiler_dLoader_dloadAll = fun roots importerPkg modules stack imports -> (match imports with
  | [] -> C_Base_dResult_dOk (modules)
  | (imp) :: (rest) -> v_Base_dResult_dandThen (v_Vuna_dCompiler_dLoader_dloadModule roots importerPkg modules stack (v_Vuna_dCompiler_dLoader_dimportName imp)) (fun modules2 -> v_Vuna_dCompiler_dLoader_dloadAll roots importerPkg modules2 stack rest)
  | _ -> vuna_fail "compiler/lib/Vuna/Compiler/Loader.vuna" 1069 3 ("case pattern match failure"))
and v_Vuna_dCompiler_dLoader_dloadModule = fun roots importerPkg modules stack name -> (match v_Vuna_dCompiler_dLoader_dfindModule modules name with
  | C_Base_dMaybe_dJust (m) -> C_Base_dResult_dOk (modules)
  | C_Base_dMaybe_dNothing -> if v_Base_dList_dmemName name stack then C_Base_dResult_dErr ((("import cycle: ") ^ (v_Vuna_dCompiler_dLoader_dshowCycle name stack))) else if v_Vuna_dCompiler_dLoader_dvalidModuleName name then v_Base_dResult_dandThen (v_Vuna_dCompiler_dLoader_dfindModuleFile roots name importerPkg) (fun found -> (let path = v_Base_dPair_dfirstOf found in (let root = v_Base_dPair_dsecondOf found in v_Base_dResult_dandThen (v_Vuna_dCompiler_dParser_dparseSource path (bi_read_file path)) (fun src -> (match src with
  | C_Vuna_dCompiler_dAst_dSource (hdr, imports, decls) -> v_Base_dResult_dandThen (v_Vuna_dCompiler_dLoader_dvalidateModuleHeader name hdr) (fun _u -> v_Base_dResult_dandThen (v_Vuna_dCompiler_dLoader_dvalidateImports name imports) (fun _u -> v_Base_dResult_dandThen (v_Vuna_dCompiler_dLoader_dimplicitPrelude roots (v_Vuna_dCompiler_dPkg_drootName root) name imports) (fun implicit -> v_Base_dResult_dandThen (v_Vuna_dCompiler_dLoader_dloadAll roots (v_Vuna_dCompiler_dPkg_drootName root) modules ((name) :: (stack)) (v_Base_dList_dappend imports implicit)) (fun modules2 -> v_Base_dResult_dandThen (v_Vuna_dCompiler_dLoader_dcomputeExports modules2 name hdr imports decls) (fun exports -> C_Base_dResult_dOk ((C_Vuna_dCompiler_dLoader_dModule (name, v_Vuna_dCompiler_dPkg_drootName root, imports, implicit, decls, exports)) :: (modules2)))))))
  | _ -> vuna_fail "compiler/lib/Vuna/Compiler/Loader.vuna" 1085 19 ("case pattern match failure")))))) else C_Base_dResult_dErr ((("invalid module name: ") ^ (name)))
  | _ -> vuna_fail "compiler/lib/Vuna/Compiler/Loader.vuna" 1076 3 ("case pattern match failure"))

let v_Vuna_dCompiler_dLoader_dloadProject = fun roots entryPkg entry -> if bi_file_exists entry then v_Base_dResult_dandThen (v_Vuna_dCompiler_dParser_dparseSource entry (bi_read_file entry)) (fun src -> (match src with
  | C_Vuna_dCompiler_dAst_dSource (hdr, imports, decls) -> (match hdr with
  | C_Base_dMaybe_dJust (C_Vuna_dCompiler_dAst_dModDecl (dname, hasList, items, sp)) -> C_Base_dResult_dErr ((let vuna_cat0' = ("module header is not allowed in entry file (") in (let vuna_cat1' = (entry) in (let vuna_cat2' = (")") in String.concat "" [vuna_cat0'; vuna_cat1'; vuna_cat2']))))
  | C_Base_dMaybe_dNothing -> v_Base_dResult_dandThen (v_Vuna_dCompiler_dLoader_dvalidateImports "<entry>" imports) (fun _u -> v_Base_dResult_dandThen (v_Vuna_dCompiler_dLoader_dimplicitPrelude roots entryPkg "" imports) (fun implicit -> v_Base_dResult_dandThen (v_Vuna_dCompiler_dLoader_dloadAll roots entryPkg [] [] (v_Base_dList_dappend imports implicit)) (fun modules -> C_Base_dResult_dOk (C_Vuna_dCompiler_dLoader_dProject (decls, imports, implicit, modules, entryPkg)))))
  | _ -> vuna_fail "compiler/lib/Vuna/Compiler/Loader.vuna" 1103 11 ("case pattern match failure"))
  | _ -> vuna_fail "compiler/lib/Vuna/Compiler/Loader.vuna" 1101 7 ("case pattern match failure"))) else C_Base_dResult_dErr ((("entry file not found: ") ^ (entry)))

let v_Vuna_dCompiler_dLoader_dloadProjectModules = fun roots entryPkg names -> (let entryImports = v_Base_dList_dmap (fun n -> C_Vuna_dCompiler_dAst_dImport (n, false, C_Base_dMaybe_dNothing, C_Vuna_dCompiler_dCommon_dSpan ("", 0, 0, 0, 0))) names in v_Base_dResult_dandThen (v_Vuna_dCompiler_dLoader_dloadAll roots entryPkg [] [] entryImports) (fun modules -> C_Base_dResult_dOk (C_Vuna_dCompiler_dLoader_dProject ([], [], [], modules, entryPkg))))

let v_Vuna_dCompiler_dLoader_dpackageAllowsEffects = fun pkg -> (if ((if (v_vuna_ueq_ustr pkg "vuna") then true else (v_vuna_ueq_ustr pkg "vuna-compiler"))) then true else (v_vuna_ueq_ustr pkg "vuna-base"))

let v_Vuna_dCompiler_dLoader_disEffectfulBuiltin = fun name -> (if ((if ((if ((if ((if ((if ((if ((if ((if ((if ((if ((if ((if ((if ((if ((if ((if ((if ((if ((if ((if ((if (v_vuna_ueq_ustr name "print") then true else (v_vuna_ueq_ustr name "readFile"))) then true else (v_vuna_ueq_ustr name "writeFile"))) then true else (v_vuna_ueq_ustr name "getArgs"))) then true else (v_vuna_ueq_ustr name "readLine"))) then true else (v_vuna_ueq_ustr name "readDir"))) then true else (v_vuna_ueq_ustr name "isDirectory"))) then true else (v_vuna_ueq_ustr name "makeDir"))) then true else (v_vuna_ueq_ustr name "removeFile"))) then true else (v_vuna_ueq_ustr name "fileExists"))) then true else (v_vuna_ueq_ustr name "exit"))) then true else (v_vuna_ueq_ustr name "prim_print"))) then true else (v_vuna_ueq_ustr name "prim_readFile"))) then true else (v_vuna_ueq_ustr name "prim_writeFile"))) then true else (v_vuna_ueq_ustr name "prim_getArgs"))) then true else (v_vuna_ueq_ustr name "prim_readLine"))) then true else (v_vuna_ueq_ustr name "prim_readDir"))) then true else (v_vuna_ueq_ustr name "prim_isDirectory"))) then true else (v_vuna_ueq_ustr name "prim_makeDir"))) then true else (v_vuna_ueq_ustr name "prim_removeFile"))) then true else (v_vuna_ueq_ustr name "prim_fileExists"))) then true else (v_vuna_ueq_ustr name "prim_exit"))) then true else (v_vuna_ueq_ustr name "prim_runIn"))

let v_Vuna_dCompiler_dLoader_dresolveGlobal = fun modules label prefix own imports scope name -> if v_Base_dList_dmemName name scope then C_Base_dResult_dOk (name) else if v_Vuna_dCompiler_dLoader_disGlobalCtor name then C_Base_dResult_dOk (name) else if v_Vuna_dCompiler_dCommon_dcontainsDot name then v_Vuna_dCompiler_dLoader_dresolveQualified modules label imports name else if v_Base_dList_dmemName name own then C_Base_dResult_dOk (v_Vuna_dCompiler_dLoader_dmangle prefix name) else if v_Vuna_dCompiler_dLoader_disEffectfulBuiltin name then (match v_Vuna_dCompiler_dLoader_dmodulesExportingValue modules imports name with
  | [] -> C_Base_dResult_dOk (name)
  | pairs -> v_Base_dResult_dandThen (v_Vuna_dCompiler_dLoader_dunifyEntryPairs label "name" name pairs) (fun p -> C_Base_dResult_dOk (v_Vuna_dCompiler_dLoader_dentryTarget (v_Base_dPair_dsecondOf p)))
  | _ -> vuna_fail "compiler/lib/Vuna/Compiler/Loader.vuna" 375 5 ("case pattern match failure")) else if v_Vuna_dCompiler_dLoader_disBuiltinName name then C_Base_dResult_dOk (name) else if v_Vuna_dCompiler_dLoader_disBuiltinTraitName name then C_Base_dResult_dOk (name) else if v_Vuna_dCompiler_dLoader_disPreludeTraitMethod name then C_Base_dResult_dOk (name) else (match v_Vuna_dCompiler_dLoader_dmodulesExportingValue modules imports name with
  | [] -> C_Base_dResult_dErr ((let vuna_cat0' = (label) in (let vuna_cat1' = (": unbound variable ") in (let vuna_cat2' = (name) in (let vuna_cat3' = (v_Vuna_dCompiler_dCommon_dsuggest name (v_Base_dList_dappend own scope)) in String.concat "" [vuna_cat0'; vuna_cat1'; vuna_cat2'; vuna_cat3'])))))
  | pairs -> v_Base_dResult_dandThen (v_Vuna_dCompiler_dLoader_dunifyEntryPairs label "name" name pairs) (fun p -> C_Base_dResult_dOk (v_Vuna_dCompiler_dLoader_dentryTarget (v_Base_dPair_dsecondOf p)))
  | _ -> vuna_fail "compiler/lib/Vuna/Compiler/Loader.vuna" 382 5 ("case pattern match failure"))

let v_Vuna_dCompiler_dLoader_dresolveDottedExpr = fun modules label prefix own imports scope name sp -> (match v_Vuna_dCompiler_dCommon_dsplitOnDot name with
  | [] -> C_Base_dResult_dErr ((let vuna_cat0' = (label) in (let vuna_cat1' = (": invalid dotted name ") in (let vuna_cat2' = (name) in String.concat "" [vuna_cat0'; vuna_cat1'; vuna_cat2']))))
  | (head) :: (rest) -> if v_Base_dList_dmemName head scope then C_Base_dResult_dOk (v_Vuna_dCompiler_dLoader_dfoldFieldChain (C_Vuna_dCompiler_dAst_dEVar (head, sp)) rest sp) else v_Base_dResult_dandThen (v_Vuna_dCompiler_dLoader_dresolveQualifiedPath modules label imports (v_Vuna_dCompiler_dCommon_dsplitOnDot name) (v_Base_dList_dlength (v_Vuna_dCompiler_dCommon_dsplitOnDot name)) sp) (fun q -> (match q with
  | C_Base_dMaybe_dJust (e) -> C_Base_dResult_dOk (e)
  | C_Base_dMaybe_dNothing -> if v_Base_dList_dmemName head own then C_Base_dResult_dOk (v_Vuna_dCompiler_dLoader_dfoldFieldChain (C_Vuna_dCompiler_dAst_dEVar (v_Vuna_dCompiler_dLoader_dmangle prefix head, sp)) rest sp) else if v_Vuna_dCompiler_dLoader_disBuiltinName head then C_Base_dResult_dOk (v_Vuna_dCompiler_dLoader_dfoldFieldChain (C_Vuna_dCompiler_dAst_dEVar (head, sp)) rest sp) else if v_Vuna_dCompiler_dLoader_dstartsUpperName head then C_Base_dResult_dErr ((let vuna_cat0' = (label) in (let vuna_cat1' = (": module ") in (let vuna_cat2' = (head) in (let vuna_cat3' = (" is not imported") in String.concat "" [vuna_cat0'; vuna_cat1'; vuna_cat2'; vuna_cat3']))))) else v_Base_dResult_dandThen (v_Vuna_dCompiler_dLoader_dresolveGlobal modules label prefix own imports scope head) (fun n -> C_Base_dResult_dOk (v_Vuna_dCompiler_dLoader_dfoldFieldChain (C_Vuna_dCompiler_dAst_dEVar (n, sp)) rest sp))
  | _ -> vuna_fail "compiler/lib/Vuna/Compiler/Loader.vuna" 330 11 ("case pattern match failure")))
  | _ -> vuna_fail "compiler/lib/Vuna/Compiler/Loader.vuna" 324 3 ("case pattern match failure"))

let rec v_Vuna_dCompiler_dLoader_dresolveAlt = fun a0 a1 a2 a3 a4 a5 a6 a7 -> match (a0, a1, a2, a3, a4, a5, a6, a7) with
  | (modules, label, prefix, own, ownCtors, imports, scope, C_Base_dPair_dPair (pat, body)) -> v_Base_dResult_dandThen (v_Vuna_dCompiler_dLoader_dresolvePattern modules label prefix ownCtors imports pat) (fun p -> (match p with
  | C_Base_dPair_dPair (pat2, bound) -> v_Base_dResult_dandThen (v_Vuna_dCompiler_dLoader_dresolveExpr modules label prefix own ownCtors imports (v_Base_dList_dappend bound scope) body) (fun body2 -> C_Base_dResult_dOk (C_Base_dPair_dPair (pat2, body2)))
  | _ -> vuna_fail "compiler/lib/Vuna/Compiler/Loader.vuna" 433 5 ("case pattern match failure")))
  | _ -> vuna_fail "compiler/lib/Vuna/Compiler/Loader.vuna" 431 1 ("no matching clause for Vuna.Compiler.Loader.resolveAlt")
and v_Vuna_dCompiler_dLoader_dresolveLet = fun modules label prefix own ownCtors imports scope rec_u binds body -> if rec_u then v_Vuna_dCompiler_dLoader_dresolveRecLet modules label prefix own ownCtors imports scope binds body else v_Vuna_dCompiler_dLoader_dresolveLetSeq modules label prefix own ownCtors imports scope binds body
and v_Vuna_dCompiler_dLoader_dresolveLetSeq = fun modules label prefix own ownCtors imports scope binds body -> (match binds with
  | [] -> v_Base_dResult_dandThen (v_Vuna_dCompiler_dLoader_dresolveExpr modules label prefix own ownCtors imports scope body) (fun b -> C_Base_dResult_dOk (C_Base_dPair_dPair ([], b)))
  | (C_Base_dPair_dPair (pat, value)) :: (rest) -> v_Base_dResult_dandThen (v_Vuna_dCompiler_dLoader_dresolveExpr modules label prefix own ownCtors imports scope value) (fun value2 -> v_Base_dResult_dandThen (v_Vuna_dCompiler_dLoader_dresolvePattern modules label prefix ownCtors imports pat) (fun p -> (match p with
  | C_Base_dPair_dPair (pat2, bound) -> v_Base_dResult_dandThen (v_Vuna_dCompiler_dLoader_dresolveLetSeq modules label prefix own ownCtors imports (v_Base_dList_dappend bound scope) rest body) (fun r -> (match r with
  | C_Base_dPair_dPair (binds2, body2) -> C_Base_dResult_dOk (C_Base_dPair_dPair ((C_Base_dPair_dPair (pat2, value2)) :: (binds2), body2))
  | _ -> vuna_fail "compiler/lib/Vuna/Compiler/Loader.vuna" 453 17 ("case pattern match failure")))
  | _ -> vuna_fail "compiler/lib/Vuna/Compiler/Loader.vuna" 450 11 ("case pattern match failure"))))
  | _ -> vuna_fail "compiler/lib/Vuna/Compiler/Loader.vuna" 443 3 ("case pattern match failure"))
and v_Vuna_dCompiler_dLoader_dresolveRecLet = fun modules label prefix own ownCtors imports scope binds body -> (match v_Vuna_dCompiler_dLoader_dcollectRecBinds modules label prefix ownCtors imports binds with
  | C_Base_dResult_dErr (e) -> C_Base_dResult_dErr (e)
  | C_Base_dResult_dOk (C_Base_dPair_dPair (names, pairs)) -> (let scope2 = v_Base_dList_dappend names scope in v_Base_dResult_dandThen (v_Vuna_dCompiler_dLoader_dresolveRecValues modules label prefix own ownCtors imports scope2 pairs) (fun values2 -> v_Base_dResult_dandThen (v_Vuna_dCompiler_dLoader_dresolveExpr modules label prefix own ownCtors imports scope2 body) (fun b -> C_Base_dResult_dOk (C_Base_dPair_dPair (values2, b)))))
  | _ -> vuna_fail "compiler/lib/Vuna/Compiler/Loader.vuna" 459 3 ("case pattern match failure"))
and v_Vuna_dCompiler_dLoader_dresolveRecValues = fun a0 a1 a2 a3 a4 a5 a6 a7 -> match (a0, a1, a2, a3, a4, a5, a6, a7) with
  | (modules, label, prefix, own, ownCtors, imports, scope, []) -> C_Base_dResult_dOk ([])
  | (modules, label, prefix, own, ownCtors, imports, scope, (C_Base_dPair_dPair (pat, value)) :: (rest)) -> v_Base_dResult_dandThen (v_Vuna_dCompiler_dLoader_dresolveExpr modules label prefix own ownCtors imports scope value) (fun value2 -> v_Base_dResult_dandThen (v_Vuna_dCompiler_dLoader_dresolveRecValues modules label prefix own ownCtors imports scope rest) (fun tail -> C_Base_dResult_dOk ((C_Base_dPair_dPair (pat, value2)) :: (tail))))
  | _ -> vuna_fail "compiler/lib/Vuna/Compiler/Loader.vuna" 476 1 ("no matching clause for Vuna.Compiler.Loader.resolveRecValues")
and v_Vuna_dCompiler_dLoader_dresolveExpr = fun modules label prefix own ownCtors imports scope expr -> (match expr with
  | C_Vuna_dCompiler_dAst_dEVar (name, sp) -> if v_Vuna_dCompiler_dCommon_dcontainsDot name then v_Vuna_dCompiler_dLoader_dresolveDottedExpr modules label prefix own imports scope name sp else v_Base_dResult_dandThen (v_Vuna_dCompiler_dLoader_dresolveGlobal modules label prefix own imports scope name) (fun n -> C_Base_dResult_dOk (C_Vuna_dCompiler_dAst_dEVar (n, sp)))
  | C_Vuna_dCompiler_dAst_dEInt (n, sp) -> C_Base_dResult_dOk (C_Vuna_dCompiler_dAst_dEInt (n, sp))
  | C_Vuna_dCompiler_dAst_dEStr (s, sp) -> C_Base_dResult_dOk (C_Vuna_dCompiler_dAst_dEStr (s, sp))
  | C_Vuna_dCompiler_dAst_dELam (params, body, sp) -> v_Base_dResult_dandThen (v_Base_dResult_dtraverse (v_Vuna_dCompiler_dLoader_dcheckBinder label) params) (fun _u -> v_Base_dResult_dandThen (v_Vuna_dCompiler_dLoader_dresolveExpr modules label prefix own ownCtors imports (v_Base_dList_dappend params scope) body) (fun b -> C_Base_dResult_dOk (C_Vuna_dCompiler_dAst_dELam (params, b, sp))))
  | C_Vuna_dCompiler_dAst_dEApp (fn, args, sp) -> v_Base_dResult_dandThen (v_Vuna_dCompiler_dLoader_dresolveExpr modules label prefix own ownCtors imports scope fn) (fun fn2 -> v_Base_dResult_dandThen (v_Base_dResult_dtraverse (fun a -> v_Vuna_dCompiler_dLoader_dresolveExpr modules label prefix own ownCtors imports scope a) args) (fun args2 -> C_Base_dResult_dOk (C_Vuna_dCompiler_dAst_dEApp (fn2, args2, sp))))
  | C_Vuna_dCompiler_dAst_dEPi (name, implicit, dom, cod, sp) -> C_Base_dResult_dErr ((let vuna_cat0' = (label) in (let vuna_cat1' = (": ") in (let vuna_cat2' = (v_Vuna_dCompiler_dCommon_dshowSpanLoc sp) in (let vuna_cat3' = (": dependent function type requires --dt") in String.concat "" [vuna_cat0'; vuna_cat1'; vuna_cat2'; vuna_cat3'])))))
  | C_Vuna_dCompiler_dAst_dELet (binds, body, rec_u, sp) -> v_Base_dResult_dandThen (v_Vuna_dCompiler_dLoader_dresolveLet modules label prefix own ownCtors imports scope rec_u binds body) (fun r -> (match r with
  | C_Base_dPair_dPair (binds2, body2) -> C_Base_dResult_dOk (C_Vuna_dCompiler_dAst_dELet (binds2, body2, rec_u, sp))
  | _ -> vuna_fail "compiler/lib/Vuna/Compiler/Loader.vuna" 501 9 ("case pattern match failure")))
  | C_Vuna_dCompiler_dAst_dECase (scrut, alts, sp) -> v_Base_dResult_dandThen (v_Vuna_dCompiler_dLoader_dresolveExpr modules label prefix own ownCtors imports scope scrut) (fun scrut2 -> v_Base_dResult_dandThen (v_Base_dResult_dtraverse (v_Vuna_dCompiler_dLoader_dresolveAlt modules label prefix own ownCtors imports scope) alts) (fun alts2 -> C_Base_dResult_dOk (C_Vuna_dCompiler_dAst_dECase (scrut2, alts2, sp))))
  | C_Vuna_dCompiler_dAst_dEIf (c, t, e, sp) -> v_Base_dResult_dandThen (v_Vuna_dCompiler_dLoader_dresolveExpr modules label prefix own ownCtors imports scope c) (fun c2 -> v_Base_dResult_dandThen (v_Vuna_dCompiler_dLoader_dresolveExpr modules label prefix own ownCtors imports scope t) (fun t2 -> v_Base_dResult_dandThen (v_Vuna_dCompiler_dLoader_dresolveExpr modules label prefix own ownCtors imports scope e) (fun e2 -> C_Base_dResult_dOk (C_Vuna_dCompiler_dAst_dEIf (c2, t2, e2, sp)))))
  | C_Vuna_dCompiler_dAst_dEField (base, fname, sp) -> v_Base_dResult_dandThen (v_Vuna_dCompiler_dLoader_dresolveExpr modules label prefix own ownCtors imports scope base) (fun b -> C_Base_dResult_dOk (C_Vuna_dCompiler_dAst_dEField (b, fname, sp)))
  | C_Vuna_dCompiler_dAst_dERecord (name, fields, sp) -> v_Base_dResult_dandThen (v_Vuna_dCompiler_dLoader_dresolveCtor modules label prefix ownCtors imports name) (fun name2 -> v_Base_dResult_dandThen (v_Base_dResult_dtraverse (v_Vuna_dCompiler_dLoader_dresolveFieldValue modules label prefix own ownCtors imports scope) fields) (fun fs -> C_Base_dResult_dOk (C_Vuna_dCompiler_dAst_dERecord (name2, fs, sp))))
  | C_Vuna_dCompiler_dAst_dERecUpdate (base, fields, sp) -> v_Base_dResult_dandThen (v_Vuna_dCompiler_dLoader_dresolveExpr modules label prefix own ownCtors imports scope base) (fun b -> v_Base_dResult_dandThen (v_Base_dResult_dtraverse (v_Vuna_dCompiler_dLoader_dresolveFieldValue modules label prefix own ownCtors imports scope) fields) (fun fs -> C_Base_dResult_dOk (C_Vuna_dCompiler_dAst_dERecUpdate (b, fs, sp))))
  | C_Vuna_dCompiler_dAst_dEInstSel (meth, name, sp) -> v_Base_dResult_dandThen (v_Vuna_dCompiler_dLoader_dresolveExpr modules label prefix own ownCtors imports scope meth) (fun m2 -> (match v_Vuna_dCompiler_dLoader_dresolveGlobal modules label prefix own imports scope name with
  | C_Base_dResult_dErr (e) -> C_Base_dResult_dErr ((let vuna_cat0' = (label) in (let vuna_cat1' = (": unknown instance name ") in (let vuna_cat2' = (name) in (let vuna_cat3' = (" (@") in (let vuna_cat4' = (name) in (let vuna_cat5' = (")") in String.concat "" [vuna_cat0'; vuna_cat1'; vuna_cat2'; vuna_cat3'; vuna_cat4'; vuna_cat5'])))))))
  | C_Base_dResult_dOk (n2) -> C_Base_dResult_dOk (C_Vuna_dCompiler_dAst_dEInstSel (m2, n2, sp))
  | _ -> vuna_fail "compiler/lib/Vuna/Compiler/Loader.vuna" 525 9 ("case pattern match failure")))
  | C_Vuna_dCompiler_dAst_dEDo (stmts, sp) -> v_Base_dResult_dandThen (v_Vuna_dCompiler_dLoader_ddesugarDo stmts) (fun e -> v_Vuna_dCompiler_dLoader_dresolveExpr modules label prefix own ownCtors imports scope e)
  | _ -> vuna_fail "compiler/lib/Vuna/Compiler/Loader.vuna" 483 3 ("case pattern match failure"))
and v_Vuna_dCompiler_dLoader_dresolveFieldValue = fun a0 a1 a2 a3 a4 a5 a6 a7 -> match (a0, a1, a2, a3, a4, a5, a6, a7) with
  | (modules, label, prefix, own, ownCtors, imports, scope, C_Base_dPair_dPair (fname, value)) -> v_Base_dResult_dandThen (v_Vuna_dCompiler_dLoader_dresolveExpr modules label prefix own ownCtors imports scope value) (fun v -> C_Base_dResult_dOk (C_Base_dPair_dPair (fname, v)))
  | _ -> vuna_fail "compiler/lib/Vuna/Compiler/Loader.vuna" 551 1 ("no matching clause for Vuna.Compiler.Loader.resolveFieldValue")

let rec v_Vuna_dCompiler_dLoader_dfirstEffect = fun a0 -> match a0 with
  | ([]) -> C_Base_dMaybe_dNothing
  | ((C_Base_dMaybe_dNothing) :: (rest)) -> v_Vuna_dCompiler_dLoader_dfirstEffect rest
  | ((C_Base_dMaybe_dJust (n)) :: (rest)) -> C_Base_dMaybe_dJust (n)
  | _ -> vuna_fail "compiler/lib/Vuna/Compiler/Loader.vuna" 1170 1 ("no matching clause for Vuna.Compiler.Loader.firstEffect")

let rec v_Vuna_dCompiler_dLoader_deffExpr = fun e -> (match e with
  | C_Vuna_dCompiler_dAst_dEVar (n, sp) -> if v_Vuna_dCompiler_dLoader_disEffectfulBuiltin n then C_Base_dMaybe_dJust (n) else C_Base_dMaybe_dNothing
  | C_Vuna_dCompiler_dAst_dEInt (n, sp) -> C_Base_dMaybe_dNothing
  | C_Vuna_dCompiler_dAst_dEStr (s, sp) -> C_Base_dMaybe_dNothing
  | C_Vuna_dCompiler_dAst_dELam (ps, body, sp) -> v_Vuna_dCompiler_dLoader_deffExpr body
  | C_Vuna_dCompiler_dAst_dEApp (fn, args, sp) -> v_Vuna_dCompiler_dLoader_dfirstEffect ((v_Vuna_dCompiler_dLoader_deffExpr fn) :: (v_Base_dList_dmap v_Vuna_dCompiler_dLoader_deffExpr args))
  | C_Vuna_dCompiler_dAst_dELet (binds, body, rec_u, sp) -> v_Vuna_dCompiler_dLoader_dfirstEffect ((v_Vuna_dCompiler_dLoader_deffBinds binds) :: ((v_Vuna_dCompiler_dLoader_deffExpr body) :: ([])))
  | C_Vuna_dCompiler_dAst_dECase (scrut, alts, sp) -> v_Vuna_dCompiler_dLoader_dfirstEffect ((v_Vuna_dCompiler_dLoader_deffExpr scrut) :: ((v_Vuna_dCompiler_dLoader_deffAlts alts) :: ([])))
  | C_Vuna_dCompiler_dAst_dEIf (c, t, el, sp) -> v_Vuna_dCompiler_dLoader_dfirstEffect ((v_Vuna_dCompiler_dLoader_deffExpr c) :: ((v_Vuna_dCompiler_dLoader_deffExpr t) :: ((v_Vuna_dCompiler_dLoader_deffExpr el) :: ([]))))
  | C_Vuna_dCompiler_dAst_dEField (base, fname, sp) -> v_Vuna_dCompiler_dLoader_deffExpr base
  | C_Vuna_dCompiler_dAst_dERecord (name, fields, sp) -> v_Vuna_dCompiler_dLoader_deffFields fields
  | C_Vuna_dCompiler_dAst_dERecUpdate (base, fields, sp) -> v_Vuna_dCompiler_dLoader_dfirstEffect ((v_Vuna_dCompiler_dLoader_deffExpr base) :: ((v_Vuna_dCompiler_dLoader_deffFields fields) :: ([])))
  | C_Vuna_dCompiler_dAst_dEInstSel (meth, iname, sp) -> C_Base_dMaybe_dNothing
  | C_Vuna_dCompiler_dAst_dEDo (stmts, sp) -> v_Vuna_dCompiler_dLoader_dfirstEffect (v_Base_dList_dmap v_Vuna_dCompiler_dLoader_deffDo stmts)
  | _ -> vuna_fail "compiler/lib/Vuna/Compiler/Loader.vuna" 1177 3 ("case pattern match failure"))
and v_Vuna_dCompiler_dLoader_deffBinds = fun a0 -> match a0 with
  | ([]) -> C_Base_dMaybe_dNothing
  | ((C_Base_dPair_dPair (pat, value)) :: (rest)) -> v_Vuna_dCompiler_dLoader_dfirstEffect ((v_Vuna_dCompiler_dLoader_deffExpr value) :: ((v_Vuna_dCompiler_dLoader_deffBinds rest) :: ([])))
  | _ -> vuna_fail "compiler/lib/Vuna/Compiler/Loader.vuna" 1192 1 ("no matching clause for Vuna.Compiler.Loader.effBinds")
and v_Vuna_dCompiler_dLoader_deffAlts = fun a0 -> match a0 with
  | ([]) -> C_Base_dMaybe_dNothing
  | ((C_Base_dPair_dPair (pat, body)) :: (rest)) -> v_Vuna_dCompiler_dLoader_dfirstEffect ((v_Vuna_dCompiler_dLoader_deffExpr body) :: ((v_Vuna_dCompiler_dLoader_deffAlts rest) :: ([])))
  | _ -> vuna_fail "compiler/lib/Vuna/Compiler/Loader.vuna" 1197 1 ("no matching clause for Vuna.Compiler.Loader.effAlts")
and v_Vuna_dCompiler_dLoader_deffFields = fun a0 -> match a0 with
  | ([]) -> C_Base_dMaybe_dNothing
  | ((C_Base_dPair_dPair (fname, value)) :: (rest)) -> v_Vuna_dCompiler_dLoader_dfirstEffect ((v_Vuna_dCompiler_dLoader_deffExpr value) :: ((v_Vuna_dCompiler_dLoader_deffFields rest) :: ([])))
  | _ -> vuna_fail "compiler/lib/Vuna/Compiler/Loader.vuna" 1202 1 ("no matching clause for Vuna.Compiler.Loader.effFields")
and v_Vuna_dCompiler_dLoader_deffDo = fun s -> (match s with
  | C_Vuna_dCompiler_dAst_dDBind (pat, value, sp) -> v_Vuna_dCompiler_dLoader_deffExpr value
  | C_Vuna_dCompiler_dAst_dDExpr (value, sp) -> v_Vuna_dCompiler_dLoader_deffExpr value
  | _ -> vuna_fail "compiler/lib/Vuna/Compiler/Loader.vuna" 1208 3 ("case pattern match failure"))

let rec v_Vuna_dCompiler_dLoader_deffDecl = fun d -> (match d with
  | C_Vuna_dCompiler_dAst_dDFun (n, pats, body, sp) -> v_Vuna_dCompiler_dLoader_deffExpr body
  | C_Vuna_dCompiler_dAst_dDTrait (n, ps, methods, sp) -> C_Base_dMaybe_dNothing
  | C_Vuna_dCompiler_dAst_dDInstance (iname, isDefault, headTy, methods, sp) -> v_Vuna_dCompiler_dLoader_dfirstEffect (v_Base_dList_dmap v_Vuna_dCompiler_dLoader_deffDecl methods)
  | _ -> C_Base_dMaybe_dNothing
  | _ -> vuna_fail "compiler/lib/Vuna/Compiler/Loader.vuna" 1213 3 ("case pattern match failure"))

let v_Vuna_dCompiler_dLoader_deffDecls = fun decls -> v_Vuna_dCompiler_dLoader_dfirstEffect (v_Base_dList_dmap v_Vuna_dCompiler_dLoader_deffDecl decls)

let v_Vuna_dCompiler_dLoader_dcheckEffectsBuiltins = fun label pkg decls -> if v_Vuna_dCompiler_dLoader_dpackageAllowsEffects pkg then C_Base_dResult_dOk (decls) else if (if (v_vuna_ueq_ustr pkg "") then (v_vuna_uneq_ustr label "<entry>") else false) then C_Base_dResult_dOk (decls) else (match v_Vuna_dCompiler_dLoader_deffDecls decls with
  | C_Base_dMaybe_dNothing -> C_Base_dResult_dOk (decls)
  | C_Base_dMaybe_dJust (name) -> C_Base_dResult_dErr ((let vuna_cat0' = (label) in (let vuna_cat1' = (": effectful builtin `") in (let vuna_cat2' = (name) in (let vuna_cat3' = ("` is not available in package ") in (let vuna_cat4' = (pkg) in (let vuna_cat5' = (" (use Base.IO)") in String.concat "" [vuna_cat0'; vuna_cat1'; vuna_cat2'; vuna_cat3'; vuna_cat4'; vuna_cat5'])))))))
  | _ -> vuna_fail "compiler/lib/Vuna/Compiler/Loader.vuna" 1225 5 ("case pattern match failure"))

let v_Vuna_dCompiler_dLoader_dtyShape = fun ty -> (match ty with
  | C_Vuna_dCompiler_dAst_dEVar (n, _) -> (("var ") ^ (n))
  | C_Vuna_dCompiler_dAst_dEApp (f, a, _) -> "app"
  | C_Vuna_dCompiler_dAst_dEInt (n, _) -> "int"
  | C_Vuna_dCompiler_dAst_dEStr (s, _) -> "str"
  | C_Vuna_dCompiler_dAst_dELam (ps, b, _) -> "lam"
  | C_Vuna_dCompiler_dAst_dELet (bs, b, _, _) -> "let"
  | C_Vuna_dCompiler_dAst_dECase (s, alts, _) -> "case"
  | C_Vuna_dCompiler_dAst_dEIf (c, t, e, _) -> "if"
  | C_Vuna_dCompiler_dAst_dEDo (stmts, _) -> "do"
  | _ -> vuna_fail "compiler/lib/Vuna/Compiler/Loader.vuna" 1232 3 ("case pattern match failure"))

let rec v_Vuna_dCompiler_dLoader_dresolveTypeExpr = fun modules label prefix ownTypes imports ty -> (match ty with
  | C_Vuna_dCompiler_dAst_dEVar (name, sp) -> v_Base_dResult_dandThen (v_Vuna_dCompiler_dLoader_dresolveTypeName modules label prefix ownTypes imports name) (fun n -> C_Base_dResult_dOk (C_Vuna_dCompiler_dAst_dEVar (n, sp)))
  | C_Vuna_dCompiler_dAst_dEApp (fn, args, sp) -> v_Base_dResult_dandThen (v_Vuna_dCompiler_dLoader_dresolveTypeExpr modules label prefix ownTypes imports fn) (fun fn2 -> v_Base_dResult_dandThen (v_Base_dResult_dtraverse (v_Vuna_dCompiler_dLoader_dresolveTypeExpr modules label prefix ownTypes imports) args) (fun args2 -> C_Base_dResult_dOk (C_Vuna_dCompiler_dAst_dEApp (fn2, args2, sp))))
  | C_Vuna_dCompiler_dAst_dEPi (name, implicit, dom, cod, sp) -> C_Base_dResult_dErr ((let vuna_cat0' = (label) in (let vuna_cat1' = (": ") in (let vuna_cat2' = (v_Vuna_dCompiler_dCommon_dshowSpanLoc sp) in (let vuna_cat3' = (": dependent function type requires --dt") in String.concat "" [vuna_cat0'; vuna_cat1'; vuna_cat2'; vuna_cat3'])))))
  | _ -> C_Base_dResult_dErr ((let vuna_cat0' = (label) in (let vuna_cat1' = (": invalid type expression (") in (let vuna_cat2' = (v_Vuna_dCompiler_dLoader_dtyShape ty) in (let vuna_cat3' = (")") in String.concat "" [vuna_cat0'; vuna_cat1'; vuna_cat2'; vuna_cat3'])))))
  | _ -> vuna_fail "compiler/lib/Vuna/Compiler/Loader.vuna" 592 3 ("case pattern match failure"))

let v_Vuna_dCompiler_dLoader_dresolveCtorSpec = fun a0 a1 a2 a3 a4 a5 -> match (a0, a1, a2, a3, a4, a5) with
  | (modules, label, prefix, ownTypes, imports, C_Vuna_dCompiler_dAst_dCtor (ctor, ty, arity, sp)) -> v_Base_dResult_dandThen (v_Vuna_dCompiler_dLoader_dresolveCtorDecl label prefix ctor) (fun c2 -> v_Base_dResult_dandThen (v_Vuna_dCompiler_dLoader_dresolveTypeExpr modules label prefix ownTypes imports ty) (fun ty2 -> C_Base_dResult_dOk (C_Vuna_dCompiler_dAst_dCtor (c2, ty2, arity, sp))))
  | _ -> vuna_fail "compiler/lib/Vuna/Compiler/Loader.vuna" 605 1 ("no matching clause for Vuna.Compiler.Loader.resolveCtorSpec")

let v_Vuna_dCompiler_dLoader_dresolveRecordField = fun a0 a1 a2 a3 a4 a5 -> match (a0, a1, a2, a3, a4, a5) with
  | (modules, label, prefix, ownTypes, imports, C_Vuna_dCompiler_dAst_dField (fname, ty, sp)) -> v_Base_dResult_dandThen (v_Vuna_dCompiler_dLoader_dcheckBinder label fname) (fun _u -> v_Base_dResult_dandThen (v_Vuna_dCompiler_dLoader_dresolveTypeExpr modules label prefix ownTypes imports ty) (fun ty2 -> C_Base_dResult_dOk (C_Vuna_dCompiler_dAst_dField (fname, ty2, sp))))
  | _ -> vuna_fail "compiler/lib/Vuna/Compiler/Loader.vuna" 643 1 ("no matching clause for Vuna.Compiler.Loader.resolveRecordField")

let v_Vuna_dCompiler_dLoader_dresolveTraitMethod = fun a0 a1 a2 a3 a4 a5 -> match (a0, a1, a2, a3, a4, a5) with
  | (modules, label, prefix, ownTypes, imports, C_Base_dPair_dPair (mname, ty)) -> v_Base_dResult_dandThen (v_Vuna_dCompiler_dLoader_dresolveTopName label prefix mname) (fun n -> v_Base_dResult_dandThen (v_Vuna_dCompiler_dLoader_dresolveTypeExpr modules label prefix ownTypes imports ty) (fun ty2 -> C_Base_dResult_dOk (C_Base_dPair_dPair (n, ty2))))
  | _ -> vuna_fail "compiler/lib/Vuna/Compiler/Loader.vuna" 648 1 ("no matching clause for Vuna.Compiler.Loader.resolveTraitMethod")

let v_Vuna_dCompiler_dLoader_dresolveInstanceMethod = fun modules label prefix own ownCtors ownTypes imports d -> (match d with
  | C_Vuna_dCompiler_dAst_dDSig (name, ty, sp) -> v_Base_dResult_dandThen (v_Vuna_dCompiler_dLoader_dcheckTopName label name) (fun _u -> v_Base_dResult_dandThen (v_Vuna_dCompiler_dLoader_dresolveTypeExpr modules label prefix ownTypes imports ty) (fun ty2 -> C_Base_dResult_dOk (C_Vuna_dCompiler_dAst_dDSig (name, ty2, sp))))
  | C_Vuna_dCompiler_dAst_dDFun (name, pats, body, sp) -> v_Base_dResult_dandThen (v_Vuna_dCompiler_dLoader_dcheckTopName label name) (fun _u -> v_Base_dResult_dandThen (v_Base_dResult_dtraverse (v_Vuna_dCompiler_dLoader_dresolvePattern modules label prefix ownCtors imports) pats) (fun parts -> v_Base_dResult_dandThen (v_Vuna_dCompiler_dLoader_dresolveExpr modules label prefix own ownCtors imports (v_Base_dList_dconcatMap v_Base_dPair_dsecondOf parts) body) (fun b -> C_Base_dResult_dOk (C_Vuna_dCompiler_dAst_dDFun (name, v_Base_dList_dmap v_Base_dPair_dfirstOf parts, b, sp)))))
  | _ -> C_Base_dResult_dErr (((label) ^ (": instance body may only contain method signatures/definitions")))
  | _ -> vuna_fail "compiler/lib/Vuna/Compiler/Loader.vuna" 660 3 ("case pattern match failure"))

let v_Vuna_dCompiler_dLoader_dresolveDecl = fun modules label prefix own ownCtors ownTypes imports d -> (match d with
  | C_Vuna_dCompiler_dAst_dDData (dname, params, kind, ctors, derivings, sp) -> v_Base_dResult_dandThen (v_Vuna_dCompiler_dLoader_dresolveTypeTopName label prefix dname) (fun dn -> v_Base_dResult_dandThen (v_Base_dResult_dtraverse (v_Vuna_dCompiler_dLoader_dresolveCtorSpec modules label prefix ownTypes imports) ctors) (fun ctors2 -> v_Base_dResult_dandThen (v_Base_dResult_dtraverse (v_Vuna_dCompiler_dLoader_dresolveTypeName modules label prefix ownTypes imports) derivings) (fun ds2 -> C_Base_dResult_dOk (C_Vuna_dCompiler_dAst_dDData (dn, params, kind, ctors2, ds2, sp)))))
  | C_Vuna_dCompiler_dAst_dDRecord (dname, params, fields, derivings, sp) -> v_Base_dResult_dandThen (v_Vuna_dCompiler_dLoader_dresolveTypeTopName label prefix dname) (fun dn -> v_Base_dResult_dandThen (v_Base_dResult_dtraverse (v_Vuna_dCompiler_dLoader_dresolveRecordField modules label prefix ownTypes imports) fields) (fun fields2 -> v_Base_dResult_dandThen (v_Base_dResult_dtraverse (v_Vuna_dCompiler_dLoader_dresolveTypeName modules label prefix ownTypes imports) derivings) (fun ds2 -> C_Base_dResult_dOk (C_Vuna_dCompiler_dAst_dDRecord (dn, params, fields2, ds2, sp)))))
  | C_Vuna_dCompiler_dAst_dDTrait (tname, params, methods, sp) -> v_Base_dResult_dandThen (v_Vuna_dCompiler_dLoader_dresolveTypeTopName label prefix tname) (fun tn -> v_Base_dResult_dandThen (v_Base_dResult_dtraverse (v_Vuna_dCompiler_dLoader_dresolveTraitMethod modules label prefix ownTypes imports) methods) (fun ms -> C_Base_dResult_dOk (C_Vuna_dCompiler_dAst_dDTrait (tn, params, ms, sp))))
  | C_Vuna_dCompiler_dAst_dDInstance (iname, isDefault, head, methods, sp) -> v_Base_dResult_dandThen (v_Vuna_dCompiler_dLoader_dresolveInstanceName label prefix iname) (fun in2 -> v_Base_dResult_dandThen (v_Vuna_dCompiler_dLoader_dresolveTypeExpr modules label prefix ownTypes imports head) (fun head2 -> v_Base_dResult_dandThen (v_Base_dResult_dtraverse (v_Vuna_dCompiler_dLoader_dresolveInstanceMethod modules label prefix own ownCtors ownTypes imports) methods) (fun ms -> C_Base_dResult_dOk (C_Vuna_dCompiler_dAst_dDInstance (in2, isDefault, head2, ms, sp)))))
  | C_Vuna_dCompiler_dAst_dDSig (name, ty, sp) -> v_Base_dResult_dandThen (v_Vuna_dCompiler_dLoader_dresolveTopName label prefix name) (fun n -> v_Base_dResult_dandThen (v_Vuna_dCompiler_dLoader_dresolveTypeExpr modules label prefix ownTypes imports ty) (fun ty2 -> C_Base_dResult_dOk (C_Vuna_dCompiler_dAst_dDSig (n, ty2, sp))))
  | C_Vuna_dCompiler_dAst_dDFun (name, pats, body, sp) -> v_Base_dResult_dandThen (v_Vuna_dCompiler_dLoader_dresolveTopName label prefix name) (fun n -> v_Base_dResult_dandThen (v_Base_dResult_dtraverse (v_Vuna_dCompiler_dLoader_dresolvePattern modules label prefix ownCtors imports) pats) (fun parts -> v_Base_dResult_dandThen (v_Vuna_dCompiler_dLoader_dresolveExpr modules label prefix own ownCtors imports (v_Base_dList_dconcatMap v_Base_dPair_dsecondOf parts) body) (fun b -> C_Base_dResult_dOk (C_Vuna_dCompiler_dAst_dDFun (n, v_Base_dList_dmap v_Base_dPair_dfirstOf parts, b, sp)))))
  | _ -> vuna_fail "compiler/lib/Vuna/Compiler/Loader.vuna" 611 3 ("case pattern match failure"))

let v_Vuna_dCompiler_dLoader_dresolveProgram = fun modules label prefix own ownCtors ownTypes imports decls -> v_Base_dResult_dtraverse (v_Vuna_dCompiler_dLoader_dresolveDecl modules label prefix own ownCtors ownTypes imports) decls

let v_Vuna_dCompiler_dLoader_dresolveEntry = fun modules entryPkg imports decls -> v_Base_dResult_dandThen (v_Vuna_dCompiler_dLoader_dresolveProgram modules "<entry>" "" (v_Vuna_dCompiler_dAst_dtopNames decls) (v_Vuna_dCompiler_dAst_dctorsOf decls) (v_Vuna_dCompiler_dAst_dtypeNamesOf decls) imports decls) (fun d -> v_Vuna_dCompiler_dLoader_dcheckEffectsBuiltins "<entry>" entryPkg d)

let rec v_Vuna_dCompiler_dLoader_dresolveModules = fun modules -> (match modules with
  | [] -> C_Base_dResult_dOk ([])
  | (C_Vuna_dCompiler_dLoader_dModule (name, mpkg, imports, imps, decls, exports)) :: (rest) -> v_Base_dResult_dandThen (v_Base_dResult_dandThen (v_Vuna_dCompiler_dLoader_dresolveProgram modules name name (v_Vuna_dCompiler_dAst_dtopNames decls) (v_Vuna_dCompiler_dAst_dctorsOf decls) (v_Vuna_dCompiler_dAst_dtypeNamesOf decls) (v_Base_dList_dappend imports imps) decls) (fun d -> v_Vuna_dCompiler_dLoader_dcheckEffectsBuiltins name mpkg d)) (fun d1 -> v_Base_dResult_dandThen (v_Vuna_dCompiler_dLoader_dresolveModules rest) (fun d2 -> C_Base_dResult_dOk (v_Base_dList_dappend d1 d2)))
  | _ -> vuna_fail "compiler/lib/Vuna/Compiler/Loader.vuna" 681 3 ("case pattern match failure"))

let rec v_Vuna_dCompiler_dLoader_dresolveModulesKeep = fun a0 -> match a0 with
  | ([]) -> C_Base_dResult_dOk ([])
  | ((C_Vuna_dCompiler_dLoader_dModule (name, pkg, imports, implicit, decls, exports)) :: (rest)) -> v_Base_dResult_dandThen (v_Base_dResult_dandThen (v_Vuna_dCompiler_dLoader_dresolveProgram ((C_Vuna_dCompiler_dLoader_dModule (name, pkg, imports, implicit, decls, exports)) :: (rest)) name name (v_Vuna_dCompiler_dAst_dtopNames decls) (v_Vuna_dCompiler_dAst_dctorsOf decls) (v_Vuna_dCompiler_dAst_dtypeNamesOf decls) (v_Base_dList_dappend imports implicit) decls) (fun d -> v_Vuna_dCompiler_dLoader_dcheckEffectsBuiltins name pkg d)) (fun d1 -> v_Base_dResult_dandThen (v_Vuna_dCompiler_dLoader_dresolveModulesKeep rest) (fun d2 -> C_Base_dResult_dOk ((C_Vuna_dCompiler_dLoader_dModule (name, pkg, imports, implicit, d1, exports)) :: (d2))))
  | _ -> vuna_fail "compiler/lib/Vuna/Compiler/Loader.vuna" 1127 1 ("no matching clause for Vuna.Compiler.Loader.resolveModulesKeep")

let v_Vuna_dCompiler_dLoader_dresolveProject = fun a0 -> match a0 with
  | (C_Vuna_dCompiler_dLoader_dProject (decls, imports, implicit, modules, entryPkg)) -> v_Base_dResult_dandThen (v_Vuna_dCompiler_dLoader_dresolveEntry modules entryPkg (v_Base_dList_dappend imports implicit) decls) (fun entryDecls -> v_Base_dResult_dandThen (v_Vuna_dCompiler_dLoader_dresolveModulesKeep modules) (fun modules2 -> C_Base_dResult_dOk (C_Base_dPair_dPair (entryDecls, modules2))))
  | _ -> vuna_fail "compiler/lib/Vuna/Compiler/Loader.vuna" 1122 1 ("no matching clause for Vuna.Compiler.Loader.resolveProject")

let v_Vuna_dCompiler_dLoader_dloadProgram = fun roots entryPkg entry -> v_Base_dResult_dandThen (v_Vuna_dCompiler_dLoader_dloadProject roots entryPkg entry) (fun p -> v_Base_dResult_dandThen (v_Vuna_dCompiler_dLoader_dresolveProject p) (fun r -> C_Base_dResult_dOk (v_Base_dList_dappend (v_Base_dPair_dfirstOf r) (v_Base_dList_dconcatMap v_Vuna_dCompiler_dLoader_dmoduleDeclsOf (v_Base_dPair_dsecondOf r)))))

let v_Vuna_dCompiler_dLoader_dloadProgramRaw = fun roots entry -> v_Vuna_dCompiler_dLoader_dloadProgram (v_Base_dList_dmap v_Vuna_dCompiler_dPkg_drawRoot roots) "" entry

let v_vuna_ushow_uVuna_uCompiler_uLoader_uExportEntry = fun x -> (match x with
  | C_Vuna_dCompiler_dLoader_dExportEntry (v0, v1, v2, v3) -> (let vuna_cat0' = ("(ExportEntry ") in (let vuna_cat1' = (v_vuna_ushow_ustring v0) in (let vuna_cat2' = (" ") in (let vuna_cat3' = (v_vuna_ushow_ustring v1) in (let vuna_cat4' = (" ") in (let vuna_cat5' = (v_vuna_ushow_ustring v2) in (let vuna_cat6' = (" ") in (let vuna_cat7' = (v_vuna_ushow_ustring v3) in (let vuna_cat8' = (")") in String.concat "" [vuna_cat0'; vuna_cat1'; vuna_cat2'; vuna_cat3'; vuna_cat4'; vuna_cat5'; vuna_cat6'; vuna_cat7'; vuna_cat8'])))))))))
  | _ -> vuna_fail "<generated>" 160 48 ("case pattern match failure"))

let v_vuna_ueq_uVuna_uCompiler_uLoader_uExportEntry = fun x y -> (match x with
  | C_Vuna_dCompiler_dLoader_dExportEntry (v0, v1, v2, v3) -> (match y with
  | C_Vuna_dCompiler_dLoader_dExportEntry (w0, w1, w2, w3) -> (if ((if ((if (v_vuna_ueq_ustr v0 w0) then (v_vuna_ueq_ustr v1 w1) else false)) then (v_vuna_ueq_ustr v2 w2) else false)) then (v_vuna_ueq_ustr v3 w3) else false)
  | _ -> v_vuna_ueq_uint 0 1
  | _ -> vuna_fail "<generated>" 165 51 ("case pattern match failure"))
  | _ -> v_vuna_ueq_uint 0 1
  | _ -> vuna_fail "<generated>" 164 48 ("case pattern match failure"))

let v_vuna_uneq_uVuna_uCompiler_uLoader_uExportEntry = fun x y -> if v_vuna_ueq_uVuna_uCompiler_uLoader_uExportEntry x y then v_vuna_ueq_uint 0 1 else v_vuna_ueq_uint 0 0

let v_vuna_ushow_uVuna_uCompiler_uLoader_uExportRef = fun x -> (match x with
  | C_Vuna_dCompiler_dLoader_dExportRef (v0, v1, v2) -> (let vuna_cat0' = ("(ExportRef ") in (let vuna_cat1' = (v_vuna_ushow_ustring v0) in (let vuna_cat2' = (" ") in (let vuna_cat3' = (v_vuna_ushow_ustring v1) in (let vuna_cat4' = (" ") in (let vuna_cat5' = (v_vuna_ushow_ustring v2) in (let vuna_cat6' = (")") in String.concat "" [vuna_cat0'; vuna_cat1'; vuna_cat2'; vuna_cat3'; vuna_cat4'; vuna_cat5'; vuna_cat6'])))))))
  | _ -> vuna_fail "<generated>" 173 46 ("case pattern match failure"))

let v_vuna_ueq_uVuna_uCompiler_uLoader_uExportRef = fun x y -> (match x with
  | C_Vuna_dCompiler_dLoader_dExportRef (v0, v1, v2) -> (match y with
  | C_Vuna_dCompiler_dLoader_dExportRef (w0, w1, w2) -> (if ((if (v_vuna_ueq_ustr v0 w0) then (v_vuna_ueq_ustr v1 w1) else false)) then (v_vuna_ueq_ustr v2 w2) else false)
  | _ -> v_vuna_ueq_uint 0 1
  | _ -> vuna_fail "<generated>" 178 46 ("case pattern match failure"))
  | _ -> v_vuna_ueq_uint 0 1
  | _ -> vuna_fail "<generated>" 177 46 ("case pattern match failure"))

let v_vuna_uneq_uVuna_uCompiler_uLoader_uExportRef = fun x y -> if v_vuna_ueq_uVuna_uCompiler_uLoader_uExportRef x y then v_vuna_ueq_uint 0 1 else v_vuna_ueq_uint 0 0
