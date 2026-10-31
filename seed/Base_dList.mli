open Vuna_runtime
open Base_dPair
open Base_dBool
open Base_dMonad
open Base_dMaybe
val v_Base_dList_dappend : (('a41376) list) -> ((('a41376) list) -> (('a41376) list))
val v_Base_dList_dreverse : (('a41402) list) -> (('a41402) list)
val v_Base_dList_dlength : (('a41408) list) -> (int)
val v_Base_dList_dmap : (('a41418) -> ('a41417)) -> ((('a41418) list) -> (('a41417) list))
val v_Base_dList_dfilter : (('a41434) -> (bool)) -> ((('a41434) list) -> (('a41434) list))
val v_Base_dList_dfoldl : (('a41453) -> (('a41452) -> ('a41453))) -> (('a41453) -> ((('a41452) list) -> ('a41453)))
val v_Base_dList_dfoldr : (('a41470) -> (('a41469) -> ('a41469))) -> (('a41469) -> ((('a41470) list) -> ('a41469)))
val v_Base_dList_dconcatMap : (('a41487) -> (('a41486) list)) -> ((('a41487) list) -> (('a41486) list))
val v_Base_dList_dflatMap : (('a41504) -> (('a41503) list)) -> ((('a41504) list) -> (('a41503) list))
val v_Base_dList_dmem : ('a41511) -> ((('a41511) list) -> (bool))
val v_Base_dList_dmemName : (string) -> (((string) list) -> (bool))
val v_Base_dList_dlookupPair : (string) -> ((((string, 'a41535) t_Base_dPair_dPair) list) -> (('a41535) t_Base_dMaybe_dMaybe))
val v_Base_dList_dzip : (('a41554) list) -> ((('a41553) list) -> ((('a41554, 'a41553) t_Base_dPair_dPair) list))
val v_Base_dList_dtake : (int) -> ((('a41578) list) -> (('a41578) list))
val v_Base_dList_ddrop : (int) -> ((('a41598) list) -> (('a41598) list))
val v_Base_dList_drange : (int) -> ((int) -> ((int) list))
val v_Base_dList_dmapMaybe : (('a41631) -> (('a41630) t_Base_dMaybe_dMaybe)) -> ((('a41631) list) -> (('a41630) list))
val v_vuna_uinst_ud_uBase_uList_uList_ufmap : (('a41727) -> ('a41726)) -> ((('a41727) list) -> (('a41726) list))
val v_vuna_uinst_ud_uBase_uList_uList_upure : ('a41734) -> (('a41734) list)
val v_vuna_uinst_ud_uBase_uList_uList_ubind : (('a41741) list) -> ((('a41741) -> (('a41740) list)) -> (('a41740) list))
val v_vuna_ueq_uBase_uList_uList : (('a43419) list) -> ((('a43419) list) -> (bool))
val v_vuna_uneq_uBase_uList_uList : (('a43446) list) -> ((('a43446) list) -> (bool))
