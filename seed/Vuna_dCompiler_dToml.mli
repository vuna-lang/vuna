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
type   t_Vuna_dCompiler_dToml_dTomlValue =
    C_Vuna_dCompiler_dToml_dTStr of (string)
  | C_Vuna_dCompiler_dToml_dTInt of (int)
  | C_Vuna_dCompiler_dToml_dTBool of (bool)
  | C_Vuna_dCompiler_dToml_dTList of ((string) list)
and   t_Vuna_dCompiler_dToml_dTomlEntry =
    C_Vuna_dCompiler_dToml_dTomlEntry of ((string) list) * (string) * (t_Vuna_dCompiler_dToml_dTomlValue) * (int)
and t_Vuna_dCompiler_dToml_dTomlCursor
val v_Vuna_dCompiler_dToml_dparseToml : (string) -> (((t_Vuna_dCompiler_dToml_dTomlEntry) list) t_Base_dResult_dResult)
val v_Vuna_dCompiler_dToml_dparseTomlAt : (string) -> ((string) -> (((t_Vuna_dCompiler_dToml_dTomlEntry) list) t_Base_dResult_dResult))
val v_Vuna_dCompiler_dToml_dlookupEntry : ((string) list) -> ((string) -> (((t_Vuna_dCompiler_dToml_dTomlEntry) list) -> ((t_Vuna_dCompiler_dToml_dTomlValue) t_Base_dMaybe_dMaybe)))
val v_Vuna_dCompiler_dToml_dlookupEntryLine : ((string) list) -> ((string) -> (((t_Vuna_dCompiler_dToml_dTomlEntry) list) -> ((int) t_Base_dMaybe_dMaybe)))
val v_vuna_ueq_uVuna_uCompiler_uToml_uTomlValue : (t_Vuna_dCompiler_dToml_dTomlValue) -> ((t_Vuna_dCompiler_dToml_dTomlValue) -> (bool))
val v_vuna_uneq_uVuna_uCompiler_uToml_uTomlValue : (t_Vuna_dCompiler_dToml_dTomlValue) -> ((t_Vuna_dCompiler_dToml_dTomlValue) -> (bool))
val v_vuna_ueq_uVuna_uCompiler_uToml_uTomlEntry : (t_Vuna_dCompiler_dToml_dTomlEntry) -> ((t_Vuna_dCompiler_dToml_dTomlEntry) -> (bool))
val v_vuna_uneq_uVuna_uCompiler_uToml_uTomlEntry : (t_Vuna_dCompiler_dToml_dTomlEntry) -> ((t_Vuna_dCompiler_dToml_dTomlEntry) -> (bool))
val v_vuna_ueq_uVuna_uCompiler_uToml_uTomlCursor : (t_Vuna_dCompiler_dToml_dTomlCursor) -> ((t_Vuna_dCompiler_dToml_dTomlCursor) -> (bool))
val v_vuna_uneq_uVuna_uCompiler_uToml_uTomlCursor : (t_Vuna_dCompiler_dToml_dTomlCursor) -> ((t_Vuna_dCompiler_dToml_dTomlCursor) -> (bool))
val show_Vuna_dCompiler_dToml_dTomlValue : t_Vuna_dCompiler_dToml_dTomlValue -> string
val show_Vuna_dCompiler_dToml_dTomlEntry : t_Vuna_dCompiler_dToml_dTomlEntry -> string
val show_Vuna_dCompiler_dToml_dTomlCursor : t_Vuna_dCompiler_dToml_dTomlCursor -> string
