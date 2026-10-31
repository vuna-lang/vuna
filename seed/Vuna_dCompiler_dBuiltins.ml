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
let v_Vuna_dCompiler_dBuiltins_dbuiltinArity = fun a0 -> match a0 with
  | ("+") -> C_Base_dMaybe_dJust (2)
  | ("-") -> C_Base_dMaybe_dJust (2)
  | ("*") -> C_Base_dMaybe_dJust (2)
  | ("/") -> C_Base_dMaybe_dJust (2)
  | ("==") -> C_Base_dMaybe_dJust (2)
  | ("/=") -> C_Base_dMaybe_dJust (2)
  | ("<") -> C_Base_dMaybe_dJust (2)
  | ("<=") -> C_Base_dMaybe_dJust (2)
  | (">") -> C_Base_dMaybe_dJust (2)
  | (">=") -> C_Base_dMaybe_dJust (2)
  | ("&&") -> C_Base_dMaybe_dJust (2)
  | ("||") -> C_Base_dMaybe_dJust (2)
  | ("++") -> C_Base_dMaybe_dJust (2)
  | ("bi_show_string") -> C_Base_dMaybe_dJust (1)
  | ("bi_eq_generic") -> C_Base_dMaybe_dJust (2)
  | ("bi_neq_generic") -> C_Base_dMaybe_dJust (2)
  | ("bi_lt_generic") -> C_Base_dMaybe_dJust (2)
  | ("bi_le_generic") -> C_Base_dMaybe_dJust (2)
  | ("bi_gt_generic") -> C_Base_dMaybe_dJust (2)
  | ("bi_ge_generic") -> C_Base_dMaybe_dJust (2)
  | ("bi_eq_int") -> C_Base_dMaybe_dJust (2)
  | ("bi_neq_int") -> C_Base_dMaybe_dJust (2)
  | ("bi_lt_int") -> C_Base_dMaybe_dJust (2)
  | ("bi_le_int") -> C_Base_dMaybe_dJust (2)
  | ("bi_gt_int") -> C_Base_dMaybe_dJust (2)
  | ("bi_ge_int") -> C_Base_dMaybe_dJust (2)
  | ("bi_eq_str") -> C_Base_dMaybe_dJust (2)
  | ("bi_neq_str") -> C_Base_dMaybe_dJust (2)
  | ("bi_eq_bool") -> C_Base_dMaybe_dJust (2)
  | ("bi_neq_bool") -> C_Base_dMaybe_dJust (2)
  | ("strLength") -> C_Base_dMaybe_dJust (1)
  | ("strUnpack") -> C_Base_dMaybe_dJust (1)
  | ("strPack") -> C_Base_dMaybe_dJust (1)
  | ("strFromInt") -> C_Base_dMaybe_dJust (1)
  | ("readFile") -> C_Base_dMaybe_dJust (1)
  | ("writeFile") -> C_Base_dMaybe_dJust (2)
  | ("print") -> C_Base_dMaybe_dJust (1)
  | ("getArgs") -> C_Base_dMaybe_dJust (0)
  | ("readLine") -> C_Base_dMaybe_dJust (0)
  | ("readDir") -> C_Base_dMaybe_dJust (1)
  | ("isDirectory") -> C_Base_dMaybe_dJust (1)
  | ("makeDir") -> C_Base_dMaybe_dJust (1)
  | ("removeFile") -> C_Base_dMaybe_dJust (1)
  | ("fileExists") -> C_Base_dMaybe_dJust (1)
  | ("exit") -> C_Base_dMaybe_dJust (1)
  | ("prim_readFile") -> C_Base_dMaybe_dJust (1)
  | ("prim_writeFile") -> C_Base_dMaybe_dJust (2)
  | ("prim_print") -> C_Base_dMaybe_dJust (1)
  | ("prim_getArgs") -> C_Base_dMaybe_dJust (0)
  | ("prim_readLine") -> C_Base_dMaybe_dJust (0)
  | ("prim_readDir") -> C_Base_dMaybe_dJust (1)
  | ("prim_isDirectory") -> C_Base_dMaybe_dJust (1)
  | ("prim_makeDir") -> C_Base_dMaybe_dJust (1)
  | ("prim_removeFile") -> C_Base_dMaybe_dJust (1)
  | ("prim_fileExists") -> C_Base_dMaybe_dJust (1)
  | ("prim_exit") -> C_Base_dMaybe_dJust (1)
  | ("prim_runIn") -> C_Base_dMaybe_dJust (2)
  | (_) -> C_Base_dMaybe_dNothing
  | _ -> vuna_fail "compiler/lib/Vuna/Compiler/Builtins.vuna" 7 1 ("no matching clause for Vuna.Compiler.Builtins.builtinArity")
