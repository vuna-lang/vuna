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
val v_Base_dResult_dtraverse : (('a50136) -> (('a50135) t_Base_dResult_dResult)) -> ((('a50136) list) -> ((('a50135) list) t_Base_dResult_dResult))
val v_Base_dResult_dandThen : (('a50165) t_Base_dResult_dResult) -> ((('a50165) -> (('a50164) t_Base_dResult_dResult)) -> (('a50164) t_Base_dResult_dResult))
val v_Base_dResult_dstep : ((('a50175, 'a50174) t_Base_dPair_dPair) t_Base_dResult_dResult) -> ((('a50175) -> (('a50174) -> (('a50173) t_Base_dResult_dResult))) -> (('a50173) t_Base_dResult_dResult))
val v_Base_dResult_dmapResult : (('a50187) -> ('a50186)) -> ((('a50187) t_Base_dResult_dResult) -> (('a50186) t_Base_dResult_dResult))
val v_Base_dResult_dmapError : ((string) -> (string)) -> ((('a50197) t_Base_dResult_dResult) -> (('a50197) t_Base_dResult_dResult))
val v_Base_dResult_dwithDefault : ('a50207) -> ((('a50207) t_Base_dResult_dResult) -> ('a50207))
val v_vuna_ueq_uBase_uResult_uResult : (('a52366) t_Base_dResult_dResult) -> ((('a52366) t_Base_dResult_dResult) -> (bool))
val v_vuna_uneq_uBase_uResult_uResult : (('a52387) t_Base_dResult_dResult) -> ((('a52387) t_Base_dResult_dResult) -> (bool))
val show_Base_dResult_dResult : 'p0. ('p0 -> string) -> ('p0) t_Base_dResult_dResult -> string
