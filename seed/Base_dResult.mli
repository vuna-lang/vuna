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
val v_Base_dResult_dtraverse : (('a41416) -> (('a41415) t_Base_dResult_dResult)) -> ((('a41416) list) -> ((('a41415) list) t_Base_dResult_dResult))
val v_Base_dResult_dandThen : (('a41445) t_Base_dResult_dResult) -> ((('a41445) -> (('a41444) t_Base_dResult_dResult)) -> (('a41444) t_Base_dResult_dResult))
val v_Base_dResult_dstep : ((('a41455, 'a41454) t_Base_dPair_dPair) t_Base_dResult_dResult) -> ((('a41455) -> (('a41454) -> (('a41453) t_Base_dResult_dResult))) -> (('a41453) t_Base_dResult_dResult))
val v_Base_dResult_dmapResult : (('a41467) -> ('a41466)) -> ((('a41467) t_Base_dResult_dResult) -> (('a41466) t_Base_dResult_dResult))
val v_Base_dResult_dmapError : ((string) -> (string)) -> ((('a41477) t_Base_dResult_dResult) -> (('a41477) t_Base_dResult_dResult))
val v_Base_dResult_dwithDefault : ('a41487) -> ((('a41487) t_Base_dResult_dResult) -> ('a41487))
val v_vuna_ueq_uBase_uResult_uResult : (('a43502) t_Base_dResult_dResult) -> ((('a43502) t_Base_dResult_dResult) -> (bool))
val v_vuna_uneq_uBase_uResult_uResult : (('a43523) t_Base_dResult_dResult) -> ((('a43523) t_Base_dResult_dResult) -> (bool))
val show_Base_dResult_dResult : 'p0. ('p0 -> string) -> ('p0) t_Base_dResult_dResult -> string
