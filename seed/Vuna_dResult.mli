open Vuna_runtime
open Vuna_dPair
open Vuna_dBool
open Vuna_dMonad
open Vuna_dMaybe
open Vuna_dList
type   'p0 t_Vuna_dResult_dResult =
    C_Vuna_dResult_dOk of ('p0)
  | C_Vuna_dResult_dErr of (string)
val v_Vuna_dResult_dtraverse : (('a40073) -> (('a40072) t_Vuna_dResult_dResult)) -> ((('a40073) list) -> ((('a40072) list) t_Vuna_dResult_dResult))
val v_Vuna_dResult_dandThen : (('a40102) t_Vuna_dResult_dResult) -> ((('a40102) -> (('a40101) t_Vuna_dResult_dResult)) -> (('a40101) t_Vuna_dResult_dResult))
val v_Vuna_dResult_dstep : ((('a40112, 'a40111) t_Vuna_dPair_dPair) t_Vuna_dResult_dResult) -> ((('a40112) -> (('a40111) -> (('a40110) t_Vuna_dResult_dResult))) -> (('a40110) t_Vuna_dResult_dResult))
val v_Vuna_dResult_dmapResult : (('a40124) -> ('a40123)) -> ((('a40124) t_Vuna_dResult_dResult) -> (('a40123) t_Vuna_dResult_dResult))
val v_Vuna_dResult_dmapError : ((string) -> (string)) -> ((('a40134) t_Vuna_dResult_dResult) -> (('a40134) t_Vuna_dResult_dResult))
val v_Vuna_dResult_dwithDefault : ('a40144) -> ((('a40144) t_Vuna_dResult_dResult) -> ('a40144))
val v_vuna_ueq_uVuna_uResult_uResult : (('a42231) t_Vuna_dResult_dResult) -> ((('a42231) t_Vuna_dResult_dResult) -> (bool))
val v_vuna_uneq_uVuna_uResult_uResult : (('a42252) t_Vuna_dResult_dResult) -> ((('a42252) t_Vuna_dResult_dResult) -> (bool))
val show_Vuna_dResult_dResult : 'p0. ('p0 -> string) -> ('p0) t_Vuna_dResult_dResult -> string
