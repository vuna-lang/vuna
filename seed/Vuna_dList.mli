open Vuna_runtime
open Vuna_dPair
open Vuna_dBool
open Vuna_dMonad
open Vuna_dMaybe
val v_Vuna_dList_dappend : (('a32395) list) -> ((('a32395) list) -> (('a32395) list))
val v_Vuna_dList_dreverse : (('a32421) list) -> (('a32421) list)
val v_Vuna_dList_dlength : (('a32427) list) -> (int)
val v_Vuna_dList_dmap : (('a32437) -> ('a32436)) -> ((('a32437) list) -> (('a32436) list))
val v_Vuna_dList_dfilter : (('a32453) -> (bool)) -> ((('a32453) list) -> (('a32453) list))
val v_Vuna_dList_dfoldl : (('a32472) -> (('a32471) -> ('a32472))) -> (('a32472) -> ((('a32471) list) -> ('a32472)))
val v_Vuna_dList_dfoldr : (('a32489) -> (('a32488) -> ('a32488))) -> (('a32488) -> ((('a32489) list) -> ('a32488)))
val v_Vuna_dList_dconcatMap : (('a32506) -> (('a32505) list)) -> ((('a32506) list) -> (('a32505) list))
val v_Vuna_dList_dflatMap : (('a32523) -> (('a32522) list)) -> ((('a32523) list) -> (('a32522) list))
val v_Vuna_dList_dmem : ('a32530) -> ((('a32530) list) -> (bool))
val v_Vuna_dList_dmemName : (string) -> (((string) list) -> (bool))
val v_Vuna_dList_dlookupPair : (string) -> ((((string, 'a32554) t_Vuna_dPair_dPair) list) -> (('a32554) t_Vuna_dMaybe_dMaybe))
val v_Vuna_dList_dzip : (('a32573) list) -> ((('a32572) list) -> ((('a32573, 'a32572) t_Vuna_dPair_dPair) list))
val v_Vuna_dList_dtake : (int) -> ((('a32597) list) -> (('a32597) list))
val v_Vuna_dList_ddrop : (int) -> ((('a32617) list) -> (('a32617) list))
val v_Vuna_dList_drange : (int) -> ((int) -> ((int) list))
val v_Vuna_dList_dmapMaybe : (('a32650) -> (('a32649) t_Vuna_dMaybe_dMaybe)) -> ((('a32650) list) -> (('a32649) list))
val v_vuna_uinst_ud_uVuna_uList_uList_ufmap : (('a32746) -> ('a32745)) -> ((('a32746) list) -> (('a32745) list))
val v_vuna_uinst_ud_uVuna_uList_uList_upure : ('a32753) -> (('a32753) list)
val v_vuna_uinst_ud_uVuna_uList_uList_ubind : (('a32760) list) -> ((('a32760) -> (('a32759) list)) -> (('a32759) list))
val v_vuna_ueq_uVuna_uList_uList : (('a34378) list) -> ((('a34378) list) -> (bool))
val v_vuna_uneq_uVuna_uList_uList : (('a34405) list) -> ((('a34405) list) -> (bool))
