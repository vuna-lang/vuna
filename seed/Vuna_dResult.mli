open Vuna_runtime
open Vuna_dPair
open Vuna_dBool
open Vuna_dMonad
open Vuna_dMaybe
open Vuna_dList
type   'p0 t_Vuna_dResult_dResult =
    C_Vuna_dResult_dOk of ('p0)
  | C_Vuna_dResult_dErr of (string)
val v_Vuna_dResult_dtraverse : (('a33147) -> (('a33146) t_Vuna_dResult_dResult)) -> ((('a33147) list) -> ((('a33146) list) t_Vuna_dResult_dResult))
val v_Vuna_dResult_dandThen : (('a33176) t_Vuna_dResult_dResult) -> ((('a33176) -> (('a33175) t_Vuna_dResult_dResult)) -> (('a33175) t_Vuna_dResult_dResult))
val v_Vuna_dResult_dstep : ((('a33186, 'a33185) t_Vuna_dPair_dPair) t_Vuna_dResult_dResult) -> ((('a33186) -> (('a33185) -> (('a33184) t_Vuna_dResult_dResult))) -> (('a33184) t_Vuna_dResult_dResult))
val v_Vuna_dResult_dmapResult : (('a33198) -> ('a33197)) -> ((('a33198) t_Vuna_dResult_dResult) -> (('a33197) t_Vuna_dResult_dResult))
val v_Vuna_dResult_dmapError : ((string) -> (string)) -> ((('a33208) t_Vuna_dResult_dResult) -> (('a33208) t_Vuna_dResult_dResult))
val v_Vuna_dResult_dwithDefault : ('a33218) -> ((('a33218) t_Vuna_dResult_dResult) -> ('a33218))
val v_vuna_ueq_uVuna_uResult_uResult : (('a35172) t_Vuna_dResult_dResult) -> ((('a35172) t_Vuna_dResult_dResult) -> (bool))
val v_vuna_uneq_uVuna_uResult_uResult : (('a35193) t_Vuna_dResult_dResult) -> ((('a35193) t_Vuna_dResult_dResult) -> (bool))
val show_Vuna_dResult_dResult : 'p0. ('p0 -> string) -> ('p0) t_Vuna_dResult_dResult -> string
