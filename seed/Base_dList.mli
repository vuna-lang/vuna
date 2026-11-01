open Vuna_runtime
open Base_dPair
open Base_dBool
open Base_dMonad
open Base_dMaybe
val v_Base_dList_dappend : (('a50212) list) -> ((('a50212) list) -> (('a50212) list))
val v_Base_dList_dreverse : (('a50238) list) -> (('a50238) list)
val v_Base_dList_dlength : (('a50244) list) -> (int)
val v_Base_dList_dmap : (('a50254) -> ('a50253)) -> ((('a50254) list) -> (('a50253) list))
val v_Base_dList_dfilter : (('a50270) -> (bool)) -> ((('a50270) list) -> (('a50270) list))
val v_Base_dList_dfoldl : (('a50289) -> (('a50288) -> ('a50289))) -> (('a50289) -> ((('a50288) list) -> ('a50289)))
val v_Base_dList_dfoldr : (('a50306) -> (('a50305) -> ('a50305))) -> (('a50305) -> ((('a50306) list) -> ('a50305)))
val v_Base_dList_dconcatMap : (('a50323) -> (('a50322) list)) -> ((('a50323) list) -> (('a50322) list))
val v_Base_dList_dflatMap : (('a50340) -> (('a50339) list)) -> ((('a50340) list) -> (('a50339) list))
val v_Base_dList_dmem : ('a50347) -> ((('a50347) list) -> (bool))
val v_Base_dList_dmemName : (string) -> (((string) list) -> (bool))
val v_Base_dList_dlookupPair : (string) -> ((((string, 'a50371) t_Base_dPair_dPair) list) -> (('a50371) t_Base_dMaybe_dMaybe))
val v_Base_dList_dzip : (('a50390) list) -> ((('a50389) list) -> ((('a50390, 'a50389) t_Base_dPair_dPair) list))
val v_Base_dList_dtake : (int) -> ((('a50414) list) -> (('a50414) list))
val v_Base_dList_ddrop : (int) -> ((('a50434) list) -> (('a50434) list))
val v_Base_dList_drange : (int) -> ((int) -> ((int) list))
val v_Base_dList_dmapMaybe : (('a50467) -> (('a50466) t_Base_dMaybe_dMaybe)) -> ((('a50467) list) -> (('a50466) list))
val v_vuna_uinst_ud_uBase_uList_uList_ufmap : (('a50563) -> ('a50562)) -> ((('a50563) list) -> (('a50562) list))
val v_vuna_uinst_ud_uBase_uList_uList_upure : ('a50570) -> (('a50570) list)
val v_vuna_uinst_ud_uBase_uList_uList_ubind : (('a50577) list) -> ((('a50577) -> (('a50576) list)) -> (('a50576) list))
val v_vuna_ueq_uBase_uList_uList : (('a52399) list) -> ((('a52399) list) -> (bool))
val v_vuna_uneq_uBase_uList_uList : (('a52426) list) -> ((('a52426) list) -> (bool))
