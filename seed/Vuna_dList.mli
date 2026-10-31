open Vuna_runtime
open Vuna_dPair
open Vuna_dBool
open Vuna_dMonad
open Vuna_dMaybe
val v_Vuna_dList_dappend : (('a34586) list) -> ((('a34586) list) -> (('a34586) list))
val v_Vuna_dList_dreverse : (('a34612) list) -> (('a34612) list)
val v_Vuna_dList_dlength : (('a34618) list) -> (int)
val v_Vuna_dList_dmap : (('a34628) -> ('a34627)) -> ((('a34628) list) -> (('a34627) list))
val v_Vuna_dList_dfilter : (('a34644) -> (bool)) -> ((('a34644) list) -> (('a34644) list))
val v_Vuna_dList_dfoldl : (('a34663) -> (('a34662) -> ('a34663))) -> (('a34663) -> ((('a34662) list) -> ('a34663)))
val v_Vuna_dList_dfoldr : (('a34680) -> (('a34679) -> ('a34679))) -> (('a34679) -> ((('a34680) list) -> ('a34679)))
val v_Vuna_dList_dconcatMap : (('a34697) -> (('a34696) list)) -> ((('a34697) list) -> (('a34696) list))
val v_Vuna_dList_dflatMap : (('a34714) -> (('a34713) list)) -> ((('a34714) list) -> (('a34713) list))
val v_Vuna_dList_dmem : ('a34721) -> ((('a34721) list) -> (bool))
val v_Vuna_dList_dmemName : (string) -> (((string) list) -> (bool))
val v_Vuna_dList_dlookupPair : (string) -> ((((string, 'a34745) t_Vuna_dPair_dPair) list) -> (('a34745) t_Vuna_dMaybe_dMaybe))
val v_Vuna_dList_dzip : (('a34764) list) -> ((('a34763) list) -> ((('a34764, 'a34763) t_Vuna_dPair_dPair) list))
val v_Vuna_dList_dtake : (int) -> ((('a34788) list) -> (('a34788) list))
val v_Vuna_dList_ddrop : (int) -> ((('a34808) list) -> (('a34808) list))
val v_Vuna_dList_drange : (int) -> ((int) -> ((int) list))
val v_Vuna_dList_dmapMaybe : (('a34841) -> (('a34840) t_Vuna_dMaybe_dMaybe)) -> ((('a34841) list) -> (('a34840) list))
val v_vuna_uinst_ud_uVuna_uList_uList_ufmap : (('a34937) -> ('a34936)) -> ((('a34937) list) -> (('a34936) list))
val v_vuna_uinst_ud_uVuna_uList_uList_upure : ('a34944) -> (('a34944) list)
val v_vuna_uinst_ud_uVuna_uList_uList_ubind : (('a34951) list) -> ((('a34951) -> (('a34950) list)) -> (('a34950) list))
val v_vuna_ueq_uVuna_uList_uList : (('a36630) list) -> ((('a36630) list) -> (bool))
val v_vuna_uneq_uVuna_uList_uList : (('a36657) list) -> ((('a36657) list) -> (bool))
