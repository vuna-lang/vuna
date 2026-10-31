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
val v_Vuna_dResult_dtraverse : (('a32319) -> (('a32318) t_Vuna_dResult_dResult)) -> ((('a32319) list) -> ((('a32318) list) t_Vuna_dResult_dResult))
val v_Vuna_dResult_dandThen : (('a32348) t_Vuna_dResult_dResult) -> ((('a32348) -> (('a32347) t_Vuna_dResult_dResult)) -> (('a32347) t_Vuna_dResult_dResult))
val v_Vuna_dResult_dstep : ((('a32358, 'a32357) t_Vuna_dPair_dPair) t_Vuna_dResult_dResult) -> ((('a32358) -> (('a32357) -> (('a32356) t_Vuna_dResult_dResult))) -> (('a32356) t_Vuna_dResult_dResult))
val v_Vuna_dResult_dmapResult : (('a32370) -> ('a32369)) -> ((('a32370) t_Vuna_dResult_dResult) -> (('a32369) t_Vuna_dResult_dResult))
val v_Vuna_dResult_dmapError : ((string) -> (string)) -> ((('a32380) t_Vuna_dResult_dResult) -> (('a32380) t_Vuna_dResult_dResult))
val v_Vuna_dResult_dwithDefault : ('a32390) -> ((('a32390) t_Vuna_dResult_dResult) -> ('a32390))
val v_vuna_ueq_uVuna_uResult_uResult : (('a34345) t_Vuna_dResult_dResult) -> ((('a34345) t_Vuna_dResult_dResult) -> (bool))
val v_vuna_uneq_uVuna_uResult_uResult : (('a34366) t_Vuna_dResult_dResult) -> ((('a34366) t_Vuna_dResult_dResult) -> (bool))
val show_Vuna_dResult_dResult : 'p0. ('p0 -> string) -> ('p0) t_Vuna_dResult_dResult -> string
