open Vuna_runtime
open Vuna_dPair
open Vuna_dBool
open Vuna_dMonad
open Vuna_dMaybe
open Vuna_dList
open Vuna_dIO
open Vuna_dResult
val v_Vuna_dString_dsplit : (string) -> ((string) -> ((string) list))
val v_Vuna_dString_djoin : (string) -> (((string) list) -> (string))
val v_Vuna_dString_dlines : (string) -> ((string) list)
val v_Vuna_dString_dunlines : ((string) list) -> (string)
val v_Vuna_dString_dtrim : (string) -> (string)
val v_Vuna_dString_dtrimLeft : (string) -> (string)
val v_Vuna_dString_dtrimRight : (string) -> (string)
val v_Vuna_dString_dcontains : (string) -> ((string) -> (bool))
val v_Vuna_dString_dstartsWith : (string) -> ((string) -> (bool))
val v_Vuna_dString_dendsWith : (string) -> ((string) -> (bool))
val v_Vuna_dString_drepeat : (int) -> ((string) -> (string))
val v_Vuna_dString_dsubstring : (int) -> ((int) -> ((string) -> (string)))
