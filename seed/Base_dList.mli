open Vuna_runtime
open Base_dPair
open Base_dBool
open Base_dMonad
open Base_dMaybe
val v_Base_dList_dappend : (('a44376) list) -> ((('a44376) list) -> (('a44376) list))
val v_Base_dList_dreverse : (('a44402) list) -> (('a44402) list)
val v_Base_dList_dlength : (('a44408) list) -> (int)
val v_Base_dList_dmap : (('a44418) -> ('a44417)) -> ((('a44418) list) -> (('a44417) list))
val v_Base_dList_dfilter : (('a44434) -> (bool)) -> ((('a44434) list) -> (('a44434) list))
val v_Base_dList_dfoldl : (('a44453) -> (('a44452) -> ('a44453))) -> (('a44453) -> ((('a44452) list) -> ('a44453)))
val v_Base_dList_dfoldr : (('a44470) -> (('a44469) -> ('a44469))) -> (('a44469) -> ((('a44470) list) -> ('a44469)))
val v_Base_dList_dconcatMap : (('a44487) -> (('a44486) list)) -> ((('a44487) list) -> (('a44486) list))
val v_Base_dList_dflatMap : (('a44504) -> (('a44503) list)) -> ((('a44504) list) -> (('a44503) list))
val v_Base_dList_dmem : ('a44511) -> ((('a44511) list) -> (bool))
val v_Base_dList_dmemName : (string) -> (((string) list) -> (bool))
val v_Base_dList_dlookupPair : (string) -> ((((string, 'a44535) t_Base_dPair_dPair) list) -> (('a44535) t_Base_dMaybe_dMaybe))
val v_Base_dList_dzip : (('a44554) list) -> ((('a44553) list) -> ((('a44554, 'a44553) t_Base_dPair_dPair) list))
val v_Base_dList_dtake : (int) -> ((('a44578) list) -> (('a44578) list))
val v_Base_dList_ddrop : (int) -> ((('a44598) list) -> (('a44598) list))
val v_Base_dList_drange : (int) -> ((int) -> ((int) list))
val v_Base_dList_dmapMaybe : (('a44631) -> (('a44630) t_Base_dMaybe_dMaybe)) -> ((('a44631) list) -> (('a44630) list))
val v_vuna_uinst_ud_uBase_uList_uList_ufmap : (('a44727) -> ('a44726)) -> ((('a44727) list) -> (('a44726) list))
val v_vuna_uinst_ud_uBase_uList_uList_upure : ('a44734) -> (('a44734) list)
val v_vuna_uinst_ud_uBase_uList_uList_ubind : (('a44741) list) -> ((('a44741) -> (('a44740) list)) -> (('a44740) list))
val v_vuna_ueq_uBase_uList_uList : (('a46448) list) -> ((('a46448) list) -> (bool))
val v_vuna_uneq_uBase_uList_uList : (('a46475) list) -> ((('a46475) list) -> (bool))
