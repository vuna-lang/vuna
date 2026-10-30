open Vuna_runtime
open Vuna_dPair
open Vuna_dBool
open Vuna_dMonad
open Vuna_dMaybe
open Vuna_dList
open Vuna_dResult
open Vuna_dString
open Vuna_dBase
open Vuna_dToml
open Vuna_dManifest
open Vuna_dPkg
open Vuna_dAst
open Vuna_dLexer
open Vuna_dParser
open Vuna_dBuiltins
type   t_Vuna_dLoader_dModule =
    C_Vuna_dLoader_dModule of (string) * (string) * ((t_Vuna_dAst_dImport) list) * ((t_Vuna_dAst_dDecl) list) * ((t_Vuna_dLoader_dExportEntry) list)
and   t_Vuna_dLoader_dProject =
    C_Vuna_dLoader_dProject of ((t_Vuna_dAst_dDecl) list) * ((t_Vuna_dAst_dImport) list) * ((t_Vuna_dLoader_dModule) list)
and t_Vuna_dLoader_dExportEntry
and t_Vuna_dLoader_dExportRef
val v_Vuna_dLoader_dmoduleNameOf : (t_Vuna_dLoader_dModule) -> (string)
val v_Vuna_dLoader_dmodulePackageOf : (t_Vuna_dLoader_dModule) -> (string)
val v_Vuna_dLoader_dmoduleImportsOf : (t_Vuna_dLoader_dModule) -> ((t_Vuna_dAst_dImport) list)
val v_Vuna_dLoader_dmoduleDeclsOf : (t_Vuna_dLoader_dModule) -> ((t_Vuna_dAst_dDecl) list)
val v_Vuna_dLoader_dmoduleExportsOf : (t_Vuna_dLoader_dModule) -> ((t_Vuna_dLoader_dExportEntry) list)
val v_Vuna_dLoader_dentryKind : (t_Vuna_dLoader_dExportEntry) -> (string)
val v_Vuna_dLoader_dentryPublic : (t_Vuna_dLoader_dExportEntry) -> (string)
val v_Vuna_dLoader_dentryTarget : (t_Vuna_dLoader_dExportEntry) -> (string)
val v_Vuna_dLoader_dentryParent : (t_Vuna_dLoader_dExportEntry) -> (string)
val v_Vuna_dLoader_dprojectEntryDecls : (t_Vuna_dLoader_dProject) -> ((t_Vuna_dAst_dDecl) list)
val v_Vuna_dLoader_dprojectEntryImports : (t_Vuna_dLoader_dProject) -> ((t_Vuna_dAst_dImport) list)
val v_Vuna_dLoader_dprojectModules : (t_Vuna_dLoader_dProject) -> ((t_Vuna_dLoader_dModule) list)
val v_Vuna_dLoader_dloadProject : ((t_Vuna_dPkg_dRoot) list) -> ((string) -> ((string) -> ((t_Vuna_dLoader_dProject) t_Vuna_dResult_dResult)))
val v_Vuna_dLoader_dresolveProject : (t_Vuna_dLoader_dProject) -> ((((t_Vuna_dAst_dDecl) list, (t_Vuna_dLoader_dModule) list) t_Vuna_dPair_dPair) t_Vuna_dResult_dResult)
val v_Vuna_dLoader_dloadProgram : ((t_Vuna_dPkg_dRoot) list) -> ((string) -> ((string) -> (((t_Vuna_dAst_dDecl) list) t_Vuna_dResult_dResult)))
val v_Vuna_dLoader_dloadProgramRaw : ((string) list) -> ((string) -> (((t_Vuna_dAst_dDecl) list) t_Vuna_dResult_dResult))
val v_vuna_ushow_uVuna_uLoader_uExportEntry : (t_Vuna_dLoader_dExportEntry) -> (string)
val v_vuna_ueq_uVuna_uLoader_uExportEntry : (t_Vuna_dLoader_dExportEntry) -> ((t_Vuna_dLoader_dExportEntry) -> (bool))
val v_vuna_uneq_uVuna_uLoader_uExportEntry : (t_Vuna_dLoader_dExportEntry) -> ((t_Vuna_dLoader_dExportEntry) -> (bool))
val v_vuna_ushow_uVuna_uLoader_uExportRef : (t_Vuna_dLoader_dExportRef) -> (string)
val v_vuna_ueq_uVuna_uLoader_uExportRef : (t_Vuna_dLoader_dExportRef) -> ((t_Vuna_dLoader_dExportRef) -> (bool))
val v_vuna_uneq_uVuna_uLoader_uExportRef : (t_Vuna_dLoader_dExportRef) -> ((t_Vuna_dLoader_dExportRef) -> (bool))
val show_Vuna_dLoader_dModule : t_Vuna_dLoader_dModule -> string
val show_Vuna_dLoader_dProject : t_Vuna_dLoader_dProject -> string
val show_Vuna_dLoader_dExportEntry : t_Vuna_dLoader_dExportEntry -> string
val show_Vuna_dLoader_dExportRef : t_Vuna_dLoader_dExportRef -> string
