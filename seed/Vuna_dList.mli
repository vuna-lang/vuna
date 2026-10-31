open Vuna_runtime
open Vuna_dPair
open Vuna_dBool
open Vuna_dMonad
open Vuna_dMaybe
val v_Vuna_dList_dappend : (('a34214) list) -> ((('a34214) list) -> (('a34214) list))
val v_Vuna_dList_dreverse : (('a34240) list) -> (('a34240) list)
val v_Vuna_dList_dlength : (('a34246) list) -> (int)
val v_Vuna_dList_dmap : (('a34256) -> ('a34255)) -> ((('a34256) list) -> (('a34255) list))
val v_Vuna_dList_dfilter : (('a34272) -> (bool)) -> ((('a34272) list) -> (('a34272) list))
val v_Vuna_dList_dfoldl : (('a34291) -> (('a34290) -> ('a34291))) -> (('a34291) -> ((('a34290) list) -> ('a34291)))
val v_Vuna_dList_dfoldr : (('a34308) -> (('a34307) -> ('a34307))) -> (('a34307) -> ((('a34308) list) -> ('a34307)))
val v_Vuna_dList_dconcatMap : (('a34325) -> (('a34324) list)) -> ((('a34325) list) -> (('a34324) list))
val v_Vuna_dList_dflatMap : (('a34342) -> (('a34341) list)) -> ((('a34342) list) -> (('a34341) list))
val v_Vuna_dList_dmem : ('a34349) -> ((('a34349) list) -> (bool))
val v_Vuna_dList_dmemName : (string) -> (((string) list) -> (bool))
val v_Vuna_dList_dlookupPair : (string) -> ((((string, 'a34373) t_Vuna_dPair_dPair) list) -> (('a34373) t_Vuna_dMaybe_dMaybe))
val v_Vuna_dList_dzip : (('a34392) list) -> ((('a34391) list) -> ((('a34392, 'a34391) t_Vuna_dPair_dPair) list))
val v_Vuna_dList_dtake : (int) -> ((('a34416) list) -> (('a34416) list))
val v_Vuna_dList_ddrop : (int) -> ((('a34436) list) -> (('a34436) list))
val v_Vuna_dList_drange : (int) -> ((int) -> ((int) list))
val v_Vuna_dList_dmapMaybe : (('a34469) -> (('a34468) t_Vuna_dMaybe_dMaybe)) -> ((('a34469) list) -> (('a34468) list))
val v_vuna_uinst_ud_uVuna_uList_uList_ufmap : (('a34565) -> ('a34564)) -> ((('a34565) list) -> (('a34564) list))
val v_vuna_uinst_ud_uVuna_uList_uList_upure : ('a34572) -> (('a34572) list)
val v_vuna_uinst_ud_uVuna_uList_uList_ubind : (('a34579) list) -> ((('a34579) -> (('a34578) list)) -> (('a34578) list))
val v_vuna_ueq_uVuna_uList_uList : (('a36258) list) -> ((('a36258) list) -> (bool))
val v_vuna_uneq_uVuna_uList_uList : (('a36285) list) -> ((('a36285) list) -> (bool))
