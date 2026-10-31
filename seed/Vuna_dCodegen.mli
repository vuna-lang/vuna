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
open Vuna_dLoader
type t_Vuna_dCodegen_dBuiltinInfo
val v_Vuna_dCodegen_dsanitizeName : (string) -> (string)
val v_Vuna_dCodegen_docamlString : (string) -> (string)
val v_Vuna_dCodegen_dgenerateProgram : ((t_Vuna_dAst_dDecl) list) -> ((bool) -> ((string) t_Vuna_dResult_dResult))
val v_vuna_ushow_uVuna_uCodegen_uBuiltinInfo : (t_Vuna_dCodegen_dBuiltinInfo) -> (string)
val v_vuna_ueq_uVuna_uCodegen_uBuiltinInfo : (t_Vuna_dCodegen_dBuiltinInfo) -> ((t_Vuna_dCodegen_dBuiltinInfo) -> (bool))
val v_vuna_uneq_uVuna_uCodegen_uBuiltinInfo : (t_Vuna_dCodegen_dBuiltinInfo) -> ((t_Vuna_dCodegen_dBuiltinInfo) -> (bool))
val show_Vuna_dCodegen_dBuiltinInfo : t_Vuna_dCodegen_dBuiltinInfo -> string
