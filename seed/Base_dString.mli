open Vuna_runtime
open Base_dPair
open Base_dBool
open Base_dMonad
open Base_dMaybe
open Base_dList
open Base_dIO
open Base_dResult
val v_Base_dString_dsplit : (string) -> ((string) -> ((string) list))
val v_Base_dString_djoin : (string) -> (((string) list) -> (string))
val v_Base_dString_dlines : (string) -> ((string) list)
val v_Base_dString_dunlines : ((string) list) -> (string)
val v_Base_dString_dtrim : (string) -> (string)
val v_Base_dString_dtrimLeft : (string) -> (string)
val v_Base_dString_dtrimRight : (string) -> (string)
val v_Base_dString_dcontains : (string) -> ((string) -> (bool))
val v_Base_dString_dstartsWith : (string) -> ((string) -> (bool))
val v_Base_dString_dendsWith : (string) -> ((string) -> (bool))
val v_Base_dString_drepeat : (int) -> ((string) -> (string))
val v_Base_dString_dsubstring : (int) -> ((int) -> ((string) -> (string)))
