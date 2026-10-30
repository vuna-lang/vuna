open Vuna_runtime
open Vuna_dPair
open Vuna_dBool
open Vuna_dMonad
open Vuna_dMaybe
val v_Vuna_dList_dappend : (('a40149) list) -> ((('a40149) list) -> (('a40149) list))
val v_Vuna_dList_dreverse : (('a40175) list) -> (('a40175) list)
val v_Vuna_dList_dlength : (('a40181) list) -> (int)
val v_Vuna_dList_dmap : (('a40191) -> ('a40190)) -> ((('a40191) list) -> (('a40190) list))
val v_Vuna_dList_dfilter : (('a40207) -> (bool)) -> ((('a40207) list) -> (('a40207) list))
val v_Vuna_dList_dfoldl : (('a40226) -> (('a40225) -> ('a40226))) -> (('a40226) -> ((('a40225) list) -> ('a40226)))
val v_Vuna_dList_dfoldr : (('a40243) -> (('a40242) -> ('a40242))) -> (('a40242) -> ((('a40243) list) -> ('a40242)))
val v_Vuna_dList_dconcatMap : (('a40260) -> (('a40259) list)) -> ((('a40260) list) -> (('a40259) list))
val v_Vuna_dList_dflatMap : (('a40277) -> (('a40276) list)) -> ((('a40277) list) -> (('a40276) list))
val v_Vuna_dList_dmem : ('a40284) -> ((('a40284) list) -> (bool))
val v_Vuna_dList_dmemName : (string) -> (((string) list) -> (bool))
val v_Vuna_dList_dlookupPair : (string) -> ((((string, 'a40308) t_Vuna_dPair_dPair) list) -> (('a40308) t_Vuna_dMaybe_dMaybe))
val v_Vuna_dList_dzip : (('a40327) list) -> ((('a40326) list) -> ((('a40327, 'a40326) t_Vuna_dPair_dPair) list))
val v_Vuna_dList_dtake : (int) -> ((('a40351) list) -> (('a40351) list))
val v_Vuna_dList_ddrop : (int) -> ((('a40371) list) -> (('a40371) list))
val v_Vuna_dList_drange : (int) -> ((int) -> ((int) list))
val v_Vuna_dList_dmapMaybe : (('a40404) -> (('a40403) t_Vuna_dMaybe_dMaybe)) -> ((('a40404) list) -> (('a40403) list))
val v_vuna_uinst_ud_uVuna_uList_uList_ufmap : (('a40480) -> ('a40479)) -> ((('a40480) list) -> (('a40479) list))
val v_vuna_uinst_ud_uVuna_uList_uList_upure : ('a40487) -> (('a40487) list)
val v_vuna_uinst_ud_uVuna_uList_uList_ubind : (('a40494) list) -> ((('a40494) -> (('a40493) list)) -> (('a40493) list))
val v_vuna_ueq_uVuna_uList_uList : (('a42264) list) -> ((('a42264) list) -> (bool))
val v_vuna_uneq_uVuna_uList_uList : (('a42291) list) -> ((('a42291) list) -> (bool))
