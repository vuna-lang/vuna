open Vuna_runtime
open Vuna_dPair
open Vuna_dBool
open Vuna_dMonad
open Vuna_dMaybe
open Vuna_dList
open Vuna_dIO
type   'p0 t_Vuna_dResult_dResult =
    C_Vuna_dResult_dOk of ('p0)
  | C_Vuna_dResult_dErr of (string)
val v_Vuna_dResult_dtraverse : (('a34138) -> (('a34137) t_Vuna_dResult_dResult)) -> ((('a34138) list) -> ((('a34137) list) t_Vuna_dResult_dResult))
val v_Vuna_dResult_dandThen : (('a34167) t_Vuna_dResult_dResult) -> ((('a34167) -> (('a34166) t_Vuna_dResult_dResult)) -> (('a34166) t_Vuna_dResult_dResult))
val v_Vuna_dResult_dstep : ((('a34177, 'a34176) t_Vuna_dPair_dPair) t_Vuna_dResult_dResult) -> ((('a34177) -> (('a34176) -> (('a34175) t_Vuna_dResult_dResult))) -> (('a34175) t_Vuna_dResult_dResult))
val v_Vuna_dResult_dmapResult : (('a34189) -> ('a34188)) -> ((('a34189) t_Vuna_dResult_dResult) -> (('a34188) t_Vuna_dResult_dResult))
val v_Vuna_dResult_dmapError : ((string) -> (string)) -> ((('a34199) t_Vuna_dResult_dResult) -> (('a34199) t_Vuna_dResult_dResult))
val v_Vuna_dResult_dwithDefault : ('a34209) -> ((('a34209) t_Vuna_dResult_dResult) -> ('a34209))
val v_vuna_ueq_uVuna_uResult_uResult : (('a36225) t_Vuna_dResult_dResult) -> ((('a36225) t_Vuna_dResult_dResult) -> (bool))
val v_vuna_uneq_uVuna_uResult_uResult : (('a36246) t_Vuna_dResult_dResult) -> ((('a36246) t_Vuna_dResult_dResult) -> (bool))
val show_Vuna_dResult_dResult : 'p0. ('p0 -> string) -> ('p0) t_Vuna_dResult_dResult -> string
