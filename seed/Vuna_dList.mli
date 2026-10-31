open Vuna_runtime
open Vuna_dPair
open Vuna_dBool
open Vuna_dMonad
open Vuna_dMaybe
val v_Vuna_dList_dappend : (('a33509) list) -> ((('a33509) list) -> (('a33509) list))
val v_Vuna_dList_dreverse : (('a33535) list) -> (('a33535) list)
val v_Vuna_dList_dlength : (('a33541) list) -> (int)
val v_Vuna_dList_dmap : (('a33551) -> ('a33550)) -> ((('a33551) list) -> (('a33550) list))
val v_Vuna_dList_dfilter : (('a33567) -> (bool)) -> ((('a33567) list) -> (('a33567) list))
val v_Vuna_dList_dfoldl : (('a33586) -> (('a33585) -> ('a33586))) -> (('a33586) -> ((('a33585) list) -> ('a33586)))
val v_Vuna_dList_dfoldr : (('a33603) -> (('a33602) -> ('a33602))) -> (('a33602) -> ((('a33603) list) -> ('a33602)))
val v_Vuna_dList_dconcatMap : (('a33620) -> (('a33619) list)) -> ((('a33620) list) -> (('a33619) list))
val v_Vuna_dList_dflatMap : (('a33637) -> (('a33636) list)) -> ((('a33637) list) -> (('a33636) list))
val v_Vuna_dList_dmem : ('a33644) -> ((('a33644) list) -> (bool))
val v_Vuna_dList_dmemName : (string) -> (((string) list) -> (bool))
val v_Vuna_dList_dlookupPair : (string) -> ((((string, 'a33668) t_Vuna_dPair_dPair) list) -> (('a33668) t_Vuna_dMaybe_dMaybe))
val v_Vuna_dList_dzip : (('a33687) list) -> ((('a33686) list) -> ((('a33687, 'a33686) t_Vuna_dPair_dPair) list))
val v_Vuna_dList_dtake : (int) -> ((('a33711) list) -> (('a33711) list))
val v_Vuna_dList_ddrop : (int) -> ((('a33731) list) -> (('a33731) list))
val v_Vuna_dList_drange : (int) -> ((int) -> ((int) list))
val v_Vuna_dList_dmapMaybe : (('a33764) -> (('a33763) t_Vuna_dMaybe_dMaybe)) -> ((('a33764) list) -> (('a33763) list))
val v_vuna_uinst_ud_uVuna_uList_uList_ufmap : (('a33840) -> ('a33839)) -> ((('a33840) list) -> (('a33839) list))
val v_vuna_uinst_ud_uVuna_uList_uList_upure : ('a33847) -> (('a33847) list)
val v_vuna_uinst_ud_uVuna_uList_uList_ubind : (('a33854) list) -> ((('a33854) -> (('a33853) list)) -> (('a33853) list))
val v_vuna_ueq_uVuna_uList_uList : (('a35533) list) -> ((('a35533) list) -> (bool))
val v_vuna_uneq_uVuna_uList_uList : (('a35560) list) -> ((('a35560) list) -> (bool))
