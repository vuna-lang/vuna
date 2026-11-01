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
and t_Vuna_dCompiler_dLoader_dExportEntry
and t_Vuna_dCompiler_dLoader_dExportRef
val v_Vuna_dCompiler_dLoader_dmoduleNameOf : (t_Vuna_dCompiler_dLoader_dModule) -> (string)
val v_Vuna_dCompiler_dLoader_dmodulePackageOf : (t_Vuna_dCompiler_dLoader_dModule) -> (string)
val v_Vuna_dCompiler_dLoader_dmoduleImportsOf : (t_Vuna_dCompiler_dLoader_dModule) -> ((t_Vuna_dCompiler_dAst_dImport) list)
val v_Vuna_dCompiler_dLoader_dmoduleImplicitImportsOf : (t_Vuna_dCompiler_dLoader_dModule) -> ((t_Vuna_dCompiler_dAst_dImport) list)
val v_Vuna_dCompiler_dLoader_dmoduleAllImportsOf : (t_Vuna_dCompiler_dLoader_dModule) -> ((t_Vuna_dCompiler_dAst_dImport) list)
val v_Vuna_dCompiler_dLoader_dmoduleDeclsOf : (t_Vuna_dCompiler_dLoader_dModule) -> ((t_Vuna_dCompiler_dAst_dDecl) list)
val v_Vuna_dCompiler_dLoader_dmoduleExportsOf : (t_Vuna_dCompiler_dLoader_dModule) -> ((t_Vuna_dCompiler_dLoader_dExportEntry) list)
val v_Vuna_dCompiler_dLoader_dentryKind : (t_Vuna_dCompiler_dLoader_dExportEntry) -> (string)
val v_Vuna_dCompiler_dLoader_dentryPublic : (t_Vuna_dCompiler_dLoader_dExportEntry) -> (string)
val v_Vuna_dCompiler_dLoader_dentryTarget : (t_Vuna_dCompiler_dLoader_dExportEntry) -> (string)
val v_Vuna_dCompiler_dLoader_dentryParent : (t_Vuna_dCompiler_dLoader_dExportEntry) -> (string)
val v_Vuna_dCompiler_dLoader_dprojectEntryDecls : (t_Vuna_dCompiler_dLoader_dProject) -> ((t_Vuna_dCompiler_dAst_dDecl) list)
val v_Vuna_dCompiler_dLoader_dprojectEntryImports : (t_Vuna_dCompiler_dLoader_dProject) -> ((t_Vuna_dCompiler_dAst_dImport) list)
val v_Vuna_dCompiler_dLoader_dprojectEntryAllImports : (t_Vuna_dCompiler_dLoader_dProject) -> ((t_Vuna_dCompiler_dAst_dImport) list)
val v_Vuna_dCompiler_dLoader_dprojectModules : (t_Vuna_dCompiler_dLoader_dProject) -> ((t_Vuna_dCompiler_dLoader_dModule) list)
val v_Vuna_dCompiler_dLoader_dloadProject : ((t_Vuna_dCompiler_dPkg_dRoot) list) -> ((string) -> ((string) -> ((t_Vuna_dCompiler_dLoader_dProject) t_Base_dResult_dResult)))
val v_Vuna_dCompiler_dLoader_dloadProjectModules : ((t_Vuna_dCompiler_dPkg_dRoot) list) -> ((string) -> (((string) list) -> ((t_Vuna_dCompiler_dLoader_dProject) t_Base_dResult_dResult)))
val v_Vuna_dCompiler_dLoader_dresolveProject : (t_Vuna_dCompiler_dLoader_dProject) -> ((((t_Vuna_dCompiler_dAst_dDecl) list, (t_Vuna_dCompiler_dLoader_dModule) list) t_Base_dPair_dPair) t_Base_dResult_dResult)
val v_Vuna_dCompiler_dLoader_dloadProgram : ((t_Vuna_dCompiler_dPkg_dRoot) list) -> ((string) -> ((string) -> (((t_Vuna_dCompiler_dAst_dDecl) list) t_Base_dResult_dResult)))
val v_Vuna_dCompiler_dLoader_dloadProgramRaw : ((string) list) -> ((string) -> (((t_Vuna_dCompiler_dAst_dDecl) list) t_Base_dResult_dResult))
val v_vuna_ushow_uVuna_uCompiler_uLoader_uExportEntry : (t_Vuna_dCompiler_dLoader_dExportEntry) -> (string)
val v_vuna_ueq_uVuna_uCompiler_uLoader_uExportEntry : (t_Vuna_dCompiler_dLoader_dExportEntry) -> ((t_Vuna_dCompiler_dLoader_dExportEntry) -> (bool))
val v_vuna_uneq_uVuna_uCompiler_uLoader_uExportEntry : (t_Vuna_dCompiler_dLoader_dExportEntry) -> ((t_Vuna_dCompiler_dLoader_dExportEntry) -> (bool))
val v_vuna_ushow_uVuna_uCompiler_uLoader_uExportRef : (t_Vuna_dCompiler_dLoader_dExportRef) -> (string)
val v_vuna_ueq_uVuna_uCompiler_uLoader_uExportRef : (t_Vuna_dCompiler_dLoader_dExportRef) -> ((t_Vuna_dCompiler_dLoader_dExportRef) -> (bool))
val v_vuna_uneq_uVuna_uCompiler_uLoader_uExportRef : (t_Vuna_dCompiler_dLoader_dExportRef) -> ((t_Vuna_dCompiler_dLoader_dExportRef) -> (bool))
val show_Vuna_dCompiler_dLoader_dModule : t_Vuna_dCompiler_dLoader_dModule -> string
val show_Vuna_dCompiler_dLoader_dProject : t_Vuna_dCompiler_dLoader_dProject -> string
val show_Vuna_dCompiler_dLoader_dExportEntry : t_Vuna_dCompiler_dLoader_dExportEntry -> string
val show_Vuna_dCompiler_dLoader_dExportRef : t_Vuna_dCompiler_dLoader_dExportRef -> string
