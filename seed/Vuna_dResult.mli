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
val v_Vuna_dResult_dtraverse : (('a34103) -> (('a34102) t_Vuna_dResult_dResult)) -> ((('a34103) list) -> ((('a34102) list) t_Vuna_dResult_dResult))
val v_Vuna_dResult_dandThen : (('a34132) t_Vuna_dResult_dResult) -> ((('a34132) -> (('a34131) t_Vuna_dResult_dResult)) -> (('a34131) t_Vuna_dResult_dResult))
val v_Vuna_dResult_dstep : ((('a34142, 'a34141) t_Vuna_dPair_dPair) t_Vuna_dResult_dResult) -> ((('a34142) -> (('a34141) -> (('a34140) t_Vuna_dResult_dResult))) -> (('a34140) t_Vuna_dResult_dResult))
val v_Vuna_dResult_dmapResult : (('a34154) -> ('a34153)) -> ((('a34154) t_Vuna_dResult_dResult) -> (('a34153) t_Vuna_dResult_dResult))
val v_Vuna_dResult_dmapError : ((string) -> (string)) -> ((('a34164) t_Vuna_dResult_dResult) -> (('a34164) t_Vuna_dResult_dResult))
val v_Vuna_dResult_dwithDefault : ('a34174) -> ((('a34174) t_Vuna_dResult_dResult) -> ('a34174))
val v_vuna_ueq_uVuna_uResult_uResult : (('a36190) t_Vuna_dResult_dResult) -> ((('a36190) t_Vuna_dResult_dResult) -> (bool))
val v_vuna_uneq_uVuna_uResult_uResult : (('a36211) t_Vuna_dResult_dResult) -> ((('a36211) t_Vuna_dResult_dResult) -> (bool))
val show_Vuna_dResult_dResult : 'p0. ('p0 -> string) -> ('p0) t_Vuna_dResult_dResult -> string
