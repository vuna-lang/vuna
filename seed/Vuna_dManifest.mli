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
type   t_Vuna_dManifest_dManifest =
    C_Vuna_dManifest_dManifest of ((string) t_Vuna_dMaybe_dMaybe) * ((string) t_Vuna_dMaybe_dMaybe) * ((string) t_Vuna_dMaybe_dMaybe) * ((string) list) * (((string) list) t_Vuna_dMaybe_dMaybe) * (((string, string) t_Vuna_dPair_dPair) list) * (string)
val v_Vuna_dManifest_dparseManifest : (string) -> ((string) -> ((t_Vuna_dManifest_dManifest) t_Vuna_dResult_dResult))
val v_Vuna_dManifest_dvalidateManifest : (t_Vuna_dManifest_dManifest) -> ((t_Vuna_dManifest_dManifest) t_Vuna_dResult_dResult)
val v_Vuna_dManifest_dmanifestName : (t_Vuna_dManifest_dManifest) -> ((string) t_Vuna_dMaybe_dMaybe)
val v_Vuna_dManifest_dmanifestVersion : (t_Vuna_dManifest_dManifest) -> ((string) t_Vuna_dMaybe_dMaybe)
val v_Vuna_dManifest_dmanifestEdition : (t_Vuna_dManifest_dManifest) -> ((string) t_Vuna_dMaybe_dMaybe)
val v_Vuna_dManifest_dmanifestMembers : (t_Vuna_dManifest_dManifest) -> ((string) list)
val v_Vuna_dManifest_dmanifestExports : (t_Vuna_dManifest_dManifest) -> (((string) list) t_Vuna_dMaybe_dMaybe)
val v_Vuna_dManifest_dmanifestDependencies : (t_Vuna_dManifest_dManifest) -> (((string, string) t_Vuna_dPair_dPair) list)
val v_Vuna_dManifest_dmanifestPath : (t_Vuna_dManifest_dManifest) -> (string)
val v_Vuna_dManifest_dmanifestDir : (string) -> (string)
val v_Vuna_dManifest_dresolveManifestPath : (t_Vuna_dManifest_dManifest) -> ((string) -> (string))
val v_vuna_ueq_uVuna_uManifest_uManifest : (t_Vuna_dManifest_dManifest) -> ((t_Vuna_dManifest_dManifest) -> (bool))
val v_vuna_uneq_uVuna_uManifest_uManifest : (t_Vuna_dManifest_dManifest) -> ((t_Vuna_dManifest_dManifest) -> (bool))
val show_Vuna_dManifest_dManifest : t_Vuna_dManifest_dManifest -> string
