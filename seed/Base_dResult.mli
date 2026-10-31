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
val v_Base_dResult_dtraverse : (('a44300) -> (('a44299) t_Base_dResult_dResult)) -> ((('a44300) list) -> ((('a44299) list) t_Base_dResult_dResult))
val v_Base_dResult_dandThen : (('a44329) t_Base_dResult_dResult) -> ((('a44329) -> (('a44328) t_Base_dResult_dResult)) -> (('a44328) t_Base_dResult_dResult))
val v_Base_dResult_dstep : ((('a44339, 'a44338) t_Base_dPair_dPair) t_Base_dResult_dResult) -> ((('a44339) -> (('a44338) -> (('a44337) t_Base_dResult_dResult))) -> (('a44337) t_Base_dResult_dResult))
val v_Base_dResult_dmapResult : (('a44351) -> ('a44350)) -> ((('a44351) t_Base_dResult_dResult) -> (('a44350) t_Base_dResult_dResult))
val v_Base_dResult_dmapError : ((string) -> (string)) -> ((('a44361) t_Base_dResult_dResult) -> (('a44361) t_Base_dResult_dResult))
val v_Base_dResult_dwithDefault : ('a44371) -> ((('a44371) t_Base_dResult_dResult) -> ('a44371))
val v_vuna_ueq_uBase_uResult_uResult : (('a46415) t_Base_dResult_dResult) -> ((('a46415) t_Base_dResult_dResult) -> (bool))
val v_vuna_uneq_uBase_uResult_uResult : (('a46436) t_Base_dResult_dResult) -> ((('a46436) t_Base_dResult_dResult) -> (bool))
val show_Base_dResult_dResult : 'p0. ('p0 -> string) -> ('p0) t_Base_dResult_dResult -> string
