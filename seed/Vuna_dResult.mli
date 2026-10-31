open Vuna_runtime
open Vuna_dPair
open Vuna_dBool
open Vuna_dMonad
open Vuna_dMaybe
open Vuna_dList
type   'p0 t_Vuna_dResult_dResult =
    C_Vuna_dResult_dOk of ('p0)
  | C_Vuna_dResult_dErr of (string)
val v_Vuna_dResult_dtraverse : (('a33433) -> (('a33432) t_Vuna_dResult_dResult)) -> ((('a33433) list) -> ((('a33432) list) t_Vuna_dResult_dResult))
val v_Vuna_dResult_dandThen : (('a33462) t_Vuna_dResult_dResult) -> ((('a33462) -> (('a33461) t_Vuna_dResult_dResult)) -> (('a33461) t_Vuna_dResult_dResult))
val v_Vuna_dResult_dstep : ((('a33472, 'a33471) t_Vuna_dPair_dPair) t_Vuna_dResult_dResult) -> ((('a33472) -> (('a33471) -> (('a33470) t_Vuna_dResult_dResult))) -> (('a33470) t_Vuna_dResult_dResult))
val v_Vuna_dResult_dmapResult : (('a33484) -> ('a33483)) -> ((('a33484) t_Vuna_dResult_dResult) -> (('a33483) t_Vuna_dResult_dResult))
val v_Vuna_dResult_dmapError : ((string) -> (string)) -> ((('a33494) t_Vuna_dResult_dResult) -> (('a33494) t_Vuna_dResult_dResult))
val v_Vuna_dResult_dwithDefault : ('a33504) -> ((('a33504) t_Vuna_dResult_dResult) -> ('a33504))
val v_vuna_ueq_uVuna_uResult_uResult : (('a35500) t_Vuna_dResult_dResult) -> ((('a35500) t_Vuna_dResult_dResult) -> (bool))
val v_vuna_uneq_uVuna_uResult_uResult : (('a35521) t_Vuna_dResult_dResult) -> ((('a35521) t_Vuna_dResult_dResult) -> (bool))
val show_Vuna_dResult_dResult : 'p0. ('p0 -> string) -> ('p0) t_Vuna_dResult_dResult -> string
