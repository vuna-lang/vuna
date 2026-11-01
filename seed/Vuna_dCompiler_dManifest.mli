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
type   t_Vuna_dCompiler_dManifest_dManifest =
    C_Vuna_dCompiler_dManifest_dManifest of ((string) t_Base_dMaybe_dMaybe) * ((string) t_Base_dMaybe_dMaybe) * ((string) t_Base_dMaybe_dMaybe) * ((string) list) * (((string) list) t_Base_dMaybe_dMaybe) * (((string, string) t_Base_dPair_dPair) list) * (string)
val v_Vuna_dCompiler_dManifest_dparseManifest : (string) -> ((string) -> ((t_Vuna_dCompiler_dManifest_dManifest) t_Base_dResult_dResult))
val v_Vuna_dCompiler_dManifest_dvalidateManifest : (t_Vuna_dCompiler_dManifest_dManifest) -> ((t_Vuna_dCompiler_dManifest_dManifest) t_Base_dResult_dResult)
val v_Vuna_dCompiler_dManifest_dmanifestName : (t_Vuna_dCompiler_dManifest_dManifest) -> ((string) t_Base_dMaybe_dMaybe)
val v_Vuna_dCompiler_dManifest_dmanifestVersion : (t_Vuna_dCompiler_dManifest_dManifest) -> ((string) t_Base_dMaybe_dMaybe)
val v_Vuna_dCompiler_dManifest_dmanifestEdition : (t_Vuna_dCompiler_dManifest_dManifest) -> ((string) t_Base_dMaybe_dMaybe)
val v_Vuna_dCompiler_dManifest_dmanifestMembers : (t_Vuna_dCompiler_dManifest_dManifest) -> ((string) list)
val v_Vuna_dCompiler_dManifest_dmanifestExports : (t_Vuna_dCompiler_dManifest_dManifest) -> (((string) list) t_Base_dMaybe_dMaybe)
val v_Vuna_dCompiler_dManifest_dmanifestDependencies : (t_Vuna_dCompiler_dManifest_dManifest) -> (((string, string) t_Base_dPair_dPair) list)
val v_Vuna_dCompiler_dManifest_dmanifestPath : (t_Vuna_dCompiler_dManifest_dManifest) -> (string)
val v_Vuna_dCompiler_dManifest_dmanifestDir : (string) -> (string)
val v_Vuna_dCompiler_dManifest_dresolveManifestPath : (t_Vuna_dCompiler_dManifest_dManifest) -> ((string) -> (string))
val v_vuna_ueq_uVuna_uCompiler_uManifest_uManifest : (t_Vuna_dCompiler_dManifest_dManifest) -> ((t_Vuna_dCompiler_dManifest_dManifest) -> (bool))
val v_vuna_uneq_uVuna_uCompiler_uManifest_uManifest : (t_Vuna_dCompiler_dManifest_dManifest) -> ((t_Vuna_dCompiler_dManifest_dManifest) -> (bool))
val show_Vuna_dCompiler_dManifest_dManifest : t_Vuna_dCompiler_dManifest_dManifest -> string
