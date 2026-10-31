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
val v_Vuna_dResult_dtraverse : (('a34510) -> (('a34509) t_Vuna_dResult_dResult)) -> ((('a34510) list) -> ((('a34509) list) t_Vuna_dResult_dResult))
val v_Vuna_dResult_dandThen : (('a34539) t_Vuna_dResult_dResult) -> ((('a34539) -> (('a34538) t_Vuna_dResult_dResult)) -> (('a34538) t_Vuna_dResult_dResult))
val v_Vuna_dResult_dstep : ((('a34549, 'a34548) t_Vuna_dPair_dPair) t_Vuna_dResult_dResult) -> ((('a34549) -> (('a34548) -> (('a34547) t_Vuna_dResult_dResult))) -> (('a34547) t_Vuna_dResult_dResult))
val v_Vuna_dResult_dmapResult : (('a34561) -> ('a34560)) -> ((('a34561) t_Vuna_dResult_dResult) -> (('a34560) t_Vuna_dResult_dResult))
val v_Vuna_dResult_dmapError : ((string) -> (string)) -> ((('a34571) t_Vuna_dResult_dResult) -> (('a34571) t_Vuna_dResult_dResult))
val v_Vuna_dResult_dwithDefault : ('a34581) -> ((('a34581) t_Vuna_dResult_dResult) -> ('a34581))
val v_vuna_ueq_uVuna_uResult_uResult : (('a36597) t_Vuna_dResult_dResult) -> ((('a36597) t_Vuna_dResult_dResult) -> (bool))
val v_vuna_uneq_uVuna_uResult_uResult : (('a36618) t_Vuna_dResult_dResult) -> ((('a36618) t_Vuna_dResult_dResult) -> (bool))
val show_Vuna_dResult_dResult : 'p0. ('p0 -> string) -> ('p0) t_Vuna_dResult_dResult -> string
