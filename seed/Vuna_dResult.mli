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
val v_Vuna_dResult_dtraverse : (('a36609) -> (('a36608) t_Vuna_dResult_dResult)) -> ((('a36609) list) -> ((('a36608) list) t_Vuna_dResult_dResult))
val v_Vuna_dResult_dandThen : (('a36638) t_Vuna_dResult_dResult) -> ((('a36638) -> (('a36637) t_Vuna_dResult_dResult)) -> (('a36637) t_Vuna_dResult_dResult))
val v_Vuna_dResult_dstep : ((('a36648, 'a36647) t_Vuna_dPair_dPair) t_Vuna_dResult_dResult) -> ((('a36648) -> (('a36647) -> (('a36646) t_Vuna_dResult_dResult))) -> (('a36646) t_Vuna_dResult_dResult))
val v_Vuna_dResult_dmapResult : (('a36660) -> ('a36659)) -> ((('a36660) t_Vuna_dResult_dResult) -> (('a36659) t_Vuna_dResult_dResult))
val v_Vuna_dResult_dmapError : ((string) -> (string)) -> ((('a36670) t_Vuna_dResult_dResult) -> (('a36670) t_Vuna_dResult_dResult))
val v_Vuna_dResult_dwithDefault : ('a36680) -> ((('a36680) t_Vuna_dResult_dResult) -> ('a36680))
val v_vuna_ueq_uVuna_uResult_uResult : (('a39018) t_Vuna_dResult_dResult) -> ((('a39018) t_Vuna_dResult_dResult) -> (bool))
val v_vuna_uneq_uVuna_uResult_uResult : (('a39039) t_Vuna_dResult_dResult) -> ((('a39039) t_Vuna_dResult_dResult) -> (bool))
val show_Vuna_dResult_dResult : 'p0. ('p0 -> string) -> ('p0) t_Vuna_dResult_dResult -> string
