open Vuna_runtime
open Vuna_dPair
open Vuna_dBool
open Vuna_dMonad
open Vuna_dMaybe
open Vuna_dList
open Vuna_dIO
open Vuna_dResult
open Vuna_dString
open Vuna_dBase
open Vuna_dToml
open Vuna_dManifest
open Vuna_dPkg
open Vuna_dAst
open Vuna_dLexer
open Vuna_dParser
let v_Vuna_dBuiltins_dbuiltinArity = fun a0 -> match a0 with
  | ("+") -> C_Vuna_dMaybe_dJust (2)
  | ("-") -> C_Vuna_dMaybe_dJust (2)
  | ("*") -> C_Vuna_dMaybe_dJust (2)
  | ("/") -> C_Vuna_dMaybe_dJust (2)
  | ("==") -> C_Vuna_dMaybe_dJust (2)
  | ("/=") -> C_Vuna_dMaybe_dJust (2)
  | ("<") -> C_Vuna_dMaybe_dJust (2)
  | ("<=") -> C_Vuna_dMaybe_dJust (2)
  | (">") -> C_Vuna_dMaybe_dJust (2)
  | (">=") -> C_Vuna_dMaybe_dJust (2)
  | ("&&") -> C_Vuna_dMaybe_dJust (2)
  | ("||") -> C_Vuna_dMaybe_dJust (2)
  | ("++") -> C_Vuna_dMaybe_dJust (2)
  | ("bi_show_string") -> C_Vuna_dMaybe_dJust (1)
  | ("bi_eq_generic") -> C_Vuna_dMaybe_dJust (2)
  | ("bi_neq_generic") -> C_Vuna_dMaybe_dJust (2)
  | ("bi_lt_generic") -> C_Vuna_dMaybe_dJust (2)
  | ("bi_le_generic") -> C_Vuna_dMaybe_dJust (2)
  | ("bi_gt_generic") -> C_Vuna_dMaybe_dJust (2)
  | ("bi_ge_generic") -> C_Vuna_dMaybe_dJust (2)
  | ("bi_eq_int") -> C_Vuna_dMaybe_dJust (2)
  | ("bi_neq_int") -> C_Vuna_dMaybe_dJust (2)
  | ("bi_lt_int") -> C_Vuna_dMaybe_dJust (2)
  | ("bi_le_int") -> C_Vuna_dMaybe_dJust (2)
  | ("bi_gt_int") -> C_Vuna_dMaybe_dJust (2)
  | ("bi_ge_int") -> C_Vuna_dMaybe_dJust (2)
  | ("bi_eq_str") -> C_Vuna_dMaybe_dJust (2)
  | ("bi_neq_str") -> C_Vuna_dMaybe_dJust (2)
  | ("bi_eq_bool") -> C_Vuna_dMaybe_dJust (2)
  | ("bi_neq_bool") -> C_Vuna_dMaybe_dJust (2)
  | ("strLength") -> C_Vuna_dMaybe_dJust (1)
  | ("strUnpack") -> C_Vuna_dMaybe_dJust (1)
  | ("strPack") -> C_Vuna_dMaybe_dJust (1)
  | ("strFromInt") -> C_Vuna_dMaybe_dJust (1)
  | ("readFile") -> C_Vuna_dMaybe_dJust (1)
  | ("writeFile") -> C_Vuna_dMaybe_dJust (2)
  | ("print") -> C_Vuna_dMaybe_dJust (1)
  | ("getArgs") -> C_Vuna_dMaybe_dJust (0)
  | ("readLine") -> C_Vuna_dMaybe_dJust (0)
  | ("readDir") -> C_Vuna_dMaybe_dJust (1)
  | ("isDirectory") -> C_Vuna_dMaybe_dJust (1)
  | ("makeDir") -> C_Vuna_dMaybe_dJust (1)
  | ("removeFile") -> C_Vuna_dMaybe_dJust (1)
  | ("fileExists") -> C_Vuna_dMaybe_dJust (1)
  | ("exit") -> C_Vuna_dMaybe_dJust (1)
  | ("prim_readFile") -> C_Vuna_dMaybe_dJust (1)
  | ("prim_writeFile") -> C_Vuna_dMaybe_dJust (2)
  | ("prim_print") -> C_Vuna_dMaybe_dJust (1)
  | ("prim_getArgs") -> C_Vuna_dMaybe_dJust (0)
  | ("prim_readLine") -> C_Vuna_dMaybe_dJust (0)
  | ("prim_readDir") -> C_Vuna_dMaybe_dJust (1)
  | ("prim_isDirectory") -> C_Vuna_dMaybe_dJust (1)
  | ("prim_makeDir") -> C_Vuna_dMaybe_dJust (1)
  | ("prim_removeFile") -> C_Vuna_dMaybe_dJust (1)
  | ("prim_fileExists") -> C_Vuna_dMaybe_dJust (1)
  | ("prim_exit") -> C_Vuna_dMaybe_dJust (1)
  | (_) -> C_Vuna_dMaybe_dNothing
  | _ -> vuna_fail "compiler/lib/Vuna/Builtins.vuna" 7 1 ("no matching clause for Vuna.Builtins.builtinArity")
