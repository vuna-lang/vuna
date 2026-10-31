open Vuna_runtime
open Vuna_dPair
open Vuna_dBool
open Vuna_dMonad
open Vuna_dMaybe
val v_Vuna_dList_dappend : (('a34179) list) -> ((('a34179) list) -> (('a34179) list))
val v_Vuna_dList_dreverse : (('a34205) list) -> (('a34205) list)
val v_Vuna_dList_dlength : (('a34211) list) -> (int)
val v_Vuna_dList_dmap : (('a34221) -> ('a34220)) -> ((('a34221) list) -> (('a34220) list))
val v_Vuna_dList_dfilter : (('a34237) -> (bool)) -> ((('a34237) list) -> (('a34237) list))
val v_Vuna_dList_dfoldl : (('a34256) -> (('a34255) -> ('a34256))) -> (('a34256) -> ((('a34255) list) -> ('a34256)))
val v_Vuna_dList_dfoldr : (('a34273) -> (('a34272) -> ('a34272))) -> (('a34272) -> ((('a34273) list) -> ('a34272)))
val v_Vuna_dList_dconcatMap : (('a34290) -> (('a34289) list)) -> ((('a34290) list) -> (('a34289) list))
val v_Vuna_dList_dflatMap : (('a34307) -> (('a34306) list)) -> ((('a34307) list) -> (('a34306) list))
val v_Vuna_dList_dmem : ('a34314) -> ((('a34314) list) -> (bool))
val v_Vuna_dList_dmemName : (string) -> (((string) list) -> (bool))
val v_Vuna_dList_dlookupPair : (string) -> ((((string, 'a34338) t_Vuna_dPair_dPair) list) -> (('a34338) t_Vuna_dMaybe_dMaybe))
val v_Vuna_dList_dzip : (('a34357) list) -> ((('a34356) list) -> ((('a34357, 'a34356) t_Vuna_dPair_dPair) list))
val v_Vuna_dList_dtake : (int) -> ((('a34381) list) -> (('a34381) list))
val v_Vuna_dList_ddrop : (int) -> ((('a34401) list) -> (('a34401) list))
val v_Vuna_dList_drange : (int) -> ((int) -> ((int) list))
val v_Vuna_dList_dmapMaybe : (('a34434) -> (('a34433) t_Vuna_dMaybe_dMaybe)) -> ((('a34434) list) -> (('a34433) list))
val v_vuna_uinst_ud_uVuna_uList_uList_ufmap : (('a34530) -> ('a34529)) -> ((('a34530) list) -> (('a34529) list))
val v_vuna_uinst_ud_uVuna_uList_uList_upure : ('a34537) -> (('a34537) list)
val v_vuna_uinst_ud_uVuna_uList_uList_ubind : (('a34544) list) -> ((('a34544) -> (('a34543) list)) -> (('a34543) list))
val v_vuna_ueq_uVuna_uList_uList : (('a36223) list) -> ((('a36223) list) -> (bool))
val v_vuna_uneq_uVuna_uList_uList : (('a36250) list) -> ((('a36250) list) -> (bool))
