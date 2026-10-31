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
val v_Base_dResult_dtraverse : (('a41300) -> (('a41299) t_Base_dResult_dResult)) -> ((('a41300) list) -> ((('a41299) list) t_Base_dResult_dResult))
val v_Base_dResult_dandThen : (('a41329) t_Base_dResult_dResult) -> ((('a41329) -> (('a41328) t_Base_dResult_dResult)) -> (('a41328) t_Base_dResult_dResult))
val v_Base_dResult_dstep : ((('a41339, 'a41338) t_Base_dPair_dPair) t_Base_dResult_dResult) -> ((('a41339) -> (('a41338) -> (('a41337) t_Base_dResult_dResult))) -> (('a41337) t_Base_dResult_dResult))
val v_Base_dResult_dmapResult : (('a41351) -> ('a41350)) -> ((('a41351) t_Base_dResult_dResult) -> (('a41350) t_Base_dResult_dResult))
val v_Base_dResult_dmapError : ((string) -> (string)) -> ((('a41361) t_Base_dResult_dResult) -> (('a41361) t_Base_dResult_dResult))
val v_Base_dResult_dwithDefault : ('a41371) -> ((('a41371) t_Base_dResult_dResult) -> ('a41371))
val v_vuna_ueq_uBase_uResult_uResult : (('a43386) t_Base_dResult_dResult) -> ((('a43386) t_Base_dResult_dResult) -> (bool))
val v_vuna_uneq_uBase_uResult_uResult : (('a43407) t_Base_dResult_dResult) -> ((('a43407) t_Base_dResult_dResult) -> (bool))
val show_Base_dResult_dResult : 'p0. ('p0 -> string) -> ('p0) t_Base_dResult_dResult -> string
