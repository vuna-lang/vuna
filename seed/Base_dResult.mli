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
val v_Base_dResult_dtraverse : (('a49960) -> (('a49959) t_Base_dResult_dResult)) -> ((('a49960) list) -> ((('a49959) list) t_Base_dResult_dResult))
val v_Base_dResult_dandThen : (('a49989) t_Base_dResult_dResult) -> ((('a49989) -> (('a49988) t_Base_dResult_dResult)) -> (('a49988) t_Base_dResult_dResult))
val v_Base_dResult_dstep : ((('a49999, 'a49998) t_Base_dPair_dPair) t_Base_dResult_dResult) -> ((('a49999) -> (('a49998) -> (('a49997) t_Base_dResult_dResult))) -> (('a49997) t_Base_dResult_dResult))
val v_Base_dResult_dmapResult : (('a50011) -> ('a50010)) -> ((('a50011) t_Base_dResult_dResult) -> (('a50010) t_Base_dResult_dResult))
val v_Base_dResult_dmapError : ((string) -> (string)) -> ((('a50021) t_Base_dResult_dResult) -> (('a50021) t_Base_dResult_dResult))
val v_Base_dResult_dwithDefault : ('a50031) -> ((('a50031) t_Base_dResult_dResult) -> ('a50031))
val v_vuna_ueq_uBase_uResult_uResult : (('a52190) t_Base_dResult_dResult) -> ((('a52190) t_Base_dResult_dResult) -> (bool))
val v_vuna_uneq_uBase_uResult_uResult : (('a52211) t_Base_dResult_dResult) -> ((('a52211) t_Base_dResult_dResult) -> (bool))
val show_Base_dResult_dResult : 'p0. ('p0 -> string) -> ('p0) t_Base_dResult_dResult -> string
