open Vuna_runtime
open Base_dPair
open Base_dBool
open Base_dMonad
open Base_dMaybe
val v_Base_dList_dappend : (('a41492) list) -> ((('a41492) list) -> (('a41492) list))
val v_Base_dList_dreverse : (('a41518) list) -> (('a41518) list)
val v_Base_dList_dlength : (('a41524) list) -> (int)
val v_Base_dList_dmap : (('a41534) -> ('a41533)) -> ((('a41534) list) -> (('a41533) list))
val v_Base_dList_dfilter : (('a41550) -> (bool)) -> ((('a41550) list) -> (('a41550) list))
val v_Base_dList_dfoldl : (('a41569) -> (('a41568) -> ('a41569))) -> (('a41569) -> ((('a41568) list) -> ('a41569)))
val v_Base_dList_dfoldr : (('a41586) -> (('a41585) -> ('a41585))) -> (('a41585) -> ((('a41586) list) -> ('a41585)))
val v_Base_dList_dconcatMap : (('a41603) -> (('a41602) list)) -> ((('a41603) list) -> (('a41602) list))
val v_Base_dList_dflatMap : (('a41620) -> (('a41619) list)) -> ((('a41620) list) -> (('a41619) list))
val v_Base_dList_dmem : ('a41627) -> ((('a41627) list) -> (bool))
val v_Base_dList_dmemName : (string) -> (((string) list) -> (bool))
val v_Base_dList_dlookupPair : (string) -> ((((string, 'a41651) t_Base_dPair_dPair) list) -> (('a41651) t_Base_dMaybe_dMaybe))
val v_Base_dList_dzip : (('a41670) list) -> ((('a41669) list) -> ((('a41670, 'a41669) t_Base_dPair_dPair) list))
val v_Base_dList_dtake : (int) -> ((('a41694) list) -> (('a41694) list))
val v_Base_dList_ddrop : (int) -> ((('a41714) list) -> (('a41714) list))
val v_Base_dList_drange : (int) -> ((int) -> ((int) list))
val v_Base_dList_dmapMaybe : (('a41747) -> (('a41746) t_Base_dMaybe_dMaybe)) -> ((('a41747) list) -> (('a41746) list))
val v_vuna_uinst_ud_uBase_uList_uList_ufmap : (('a41843) -> ('a41842)) -> ((('a41843) list) -> (('a41842) list))
val v_vuna_uinst_ud_uBase_uList_uList_upure : ('a41850) -> (('a41850) list)
val v_vuna_uinst_ud_uBase_uList_uList_ubind : (('a41857) list) -> ((('a41857) -> (('a41856) list)) -> (('a41856) list))
val v_vuna_ueq_uBase_uList_uList : (('a43535) list) -> ((('a43535) list) -> (bool))
val v_vuna_uneq_uBase_uList_uList : (('a43562) list) -> ((('a43562) list) -> (bool))
