open Vuna_runtime
open Base_dPair
open Base_dBool
open Base_dMonad
open Base_dMaybe
val v_Base_dList_dappend : (('a50036) list) -> ((('a50036) list) -> (('a50036) list))
val v_Base_dList_dreverse : (('a50062) list) -> (('a50062) list)
val v_Base_dList_dlength : (('a50068) list) -> (int)
val v_Base_dList_dmap : (('a50078) -> ('a50077)) -> ((('a50078) list) -> (('a50077) list))
val v_Base_dList_dfilter : (('a50094) -> (bool)) -> ((('a50094) list) -> (('a50094) list))
val v_Base_dList_dfoldl : (('a50113) -> (('a50112) -> ('a50113))) -> (('a50113) -> ((('a50112) list) -> ('a50113)))
val v_Base_dList_dfoldr : (('a50130) -> (('a50129) -> ('a50129))) -> (('a50129) -> ((('a50130) list) -> ('a50129)))
val v_Base_dList_dconcatMap : (('a50147) -> (('a50146) list)) -> ((('a50147) list) -> (('a50146) list))
val v_Base_dList_dflatMap : (('a50164) -> (('a50163) list)) -> ((('a50164) list) -> (('a50163) list))
val v_Base_dList_dmem : ('a50171) -> ((('a50171) list) -> (bool))
val v_Base_dList_dmemName : (string) -> (((string) list) -> (bool))
val v_Base_dList_dlookupPair : (string) -> ((((string, 'a50195) t_Base_dPair_dPair) list) -> (('a50195) t_Base_dMaybe_dMaybe))
val v_Base_dList_dzip : (('a50214) list) -> ((('a50213) list) -> ((('a50214, 'a50213) t_Base_dPair_dPair) list))
val v_Base_dList_dtake : (int) -> ((('a50238) list) -> (('a50238) list))
val v_Base_dList_ddrop : (int) -> ((('a50258) list) -> (('a50258) list))
val v_Base_dList_drange : (int) -> ((int) -> ((int) list))
val v_Base_dList_dmapMaybe : (('a50291) -> (('a50290) t_Base_dMaybe_dMaybe)) -> ((('a50291) list) -> (('a50290) list))
val v_vuna_uinst_ud_uBase_uList_uList_ufmap : (('a50387) -> ('a50386)) -> ((('a50387) list) -> (('a50386) list))
val v_vuna_uinst_ud_uBase_uList_uList_upure : ('a50394) -> (('a50394) list)
val v_vuna_uinst_ud_uBase_uList_uList_ubind : (('a50401) list) -> ((('a50401) -> (('a50400) list)) -> (('a50400) list))
val v_vuna_ueq_uBase_uList_uList : (('a52223) list) -> ((('a52223) list) -> (bool))
val v_vuna_uneq_uBase_uList_uList : (('a52250) list) -> ((('a52250) list) -> (bool))
