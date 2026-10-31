open Vuna_runtime
open Vuna_dPair
open Vuna_dBool
open Vuna_dMonad
open Vuna_dMaybe
val v_Vuna_dList_dappend : (('a33223) list) -> ((('a33223) list) -> (('a33223) list))
val v_Vuna_dList_dreverse : (('a33249) list) -> (('a33249) list)
val v_Vuna_dList_dlength : (('a33255) list) -> (int)
val v_Vuna_dList_dmap : (('a33265) -> ('a33264)) -> ((('a33265) list) -> (('a33264) list))
val v_Vuna_dList_dfilter : (('a33281) -> (bool)) -> ((('a33281) list) -> (('a33281) list))
val v_Vuna_dList_dfoldl : (('a33300) -> (('a33299) -> ('a33300))) -> (('a33300) -> ((('a33299) list) -> ('a33300)))
val v_Vuna_dList_dfoldr : (('a33317) -> (('a33316) -> ('a33316))) -> (('a33316) -> ((('a33317) list) -> ('a33316)))
val v_Vuna_dList_dconcatMap : (('a33334) -> (('a33333) list)) -> ((('a33334) list) -> (('a33333) list))
val v_Vuna_dList_dflatMap : (('a33351) -> (('a33350) list)) -> ((('a33351) list) -> (('a33350) list))
val v_Vuna_dList_dmem : ('a33358) -> ((('a33358) list) -> (bool))
val v_Vuna_dList_dmemName : (string) -> (((string) list) -> (bool))
val v_Vuna_dList_dlookupPair : (string) -> ((((string, 'a33382) t_Vuna_dPair_dPair) list) -> (('a33382) t_Vuna_dMaybe_dMaybe))
val v_Vuna_dList_dzip : (('a33401) list) -> ((('a33400) list) -> ((('a33401, 'a33400) t_Vuna_dPair_dPair) list))
val v_Vuna_dList_dtake : (int) -> ((('a33425) list) -> (('a33425) list))
val v_Vuna_dList_ddrop : (int) -> ((('a33445) list) -> (('a33445) list))
val v_Vuna_dList_drange : (int) -> ((int) -> ((int) list))
val v_Vuna_dList_dmapMaybe : (('a33478) -> (('a33477) t_Vuna_dMaybe_dMaybe)) -> ((('a33478) list) -> (('a33477) list))
val v_vuna_uinst_ud_uVuna_uList_uList_ufmap : (('a33554) -> ('a33553)) -> ((('a33554) list) -> (('a33553) list))
val v_vuna_uinst_ud_uVuna_uList_uList_upure : ('a33561) -> (('a33561) list)
val v_vuna_uinst_ud_uVuna_uList_uList_ubind : (('a33568) list) -> ((('a33568) -> (('a33567) list)) -> (('a33567) list))
val v_vuna_ueq_uVuna_uList_uList : (('a35205) list) -> ((('a35205) list) -> (bool))
val v_vuna_uneq_uVuna_uList_uList : (('a35232) list) -> ((('a35232) list) -> (bool))
