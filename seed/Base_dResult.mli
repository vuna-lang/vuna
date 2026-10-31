open Vuna_runtime
open Base_dPair
open Base_dBool
open Base_dMonad
open Base_dMaybe
open Base_dList
open Base_dIO
type   'p0 t_Base_dResult_dResult =
    C_Base_dResult_dOk of ('p0)
  | C_Base_dResult_dErr of (string)
val v_Base_dResult_dtraverse : (('a37551) -> (('a37550) t_Base_dResult_dResult)) -> ((('a37551) list) -> ((('a37550) list) t_Base_dResult_dResult))
val v_Base_dResult_dandThen : (('a37580) t_Base_dResult_dResult) -> ((('a37580) -> (('a37579) t_Base_dResult_dResult)) -> (('a37579) t_Base_dResult_dResult))
val v_Base_dResult_dstep : ((('a37590, 'a37589) t_Base_dPair_dPair) t_Base_dResult_dResult) -> ((('a37590) -> (('a37589) -> (('a37588) t_Base_dResult_dResult))) -> (('a37588) t_Base_dResult_dResult))
val v_Base_dResult_dmapResult : (('a37602) -> ('a37601)) -> ((('a37602) t_Base_dResult_dResult) -> (('a37601) t_Base_dResult_dResult))
val v_Base_dResult_dmapError : ((string) -> (string)) -> ((('a37612) t_Base_dResult_dResult) -> (('a37612) t_Base_dResult_dResult))
val v_Base_dResult_dwithDefault : ('a37622) -> ((('a37622) t_Base_dResult_dResult) -> ('a37622))
val v_vuna_ueq_uBase_uResult_uResult : (('a39960) t_Base_dResult_dResult) -> ((('a39960) t_Base_dResult_dResult) -> (bool))
val v_vuna_uneq_uBase_uResult_uResult : (('a39981) t_Base_dResult_dResult) -> ((('a39981) t_Base_dResult_dResult) -> (bool))
val show_Base_dResult_dResult : 'p0. ('p0 -> string) -> ('p0) t_Base_dResult_dResult -> string
