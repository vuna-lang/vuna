open Vuna_runtime
open Base_dPair
open Base_dBool
open Base_dMonad
open Base_dMaybe
val v_Base_dList_dappend : (('a37627) list) -> ((('a37627) list) -> (('a37627) list))
val v_Base_dList_dreverse : (('a37653) list) -> (('a37653) list)
val v_Base_dList_dlength : (('a37659) list) -> (int)
val v_Base_dList_dmap : (('a37669) -> ('a37668)) -> ((('a37669) list) -> (('a37668) list))
val v_Base_dList_dfilter : (('a37685) -> (bool)) -> ((('a37685) list) -> (('a37685) list))
val v_Base_dList_dfoldl : (('a37704) -> (('a37703) -> ('a37704))) -> (('a37704) -> ((('a37703) list) -> ('a37704)))
val v_Base_dList_dfoldr : (('a37721) -> (('a37720) -> ('a37720))) -> (('a37720) -> ((('a37721) list) -> ('a37720)))
val v_Base_dList_dconcatMap : (('a37738) -> (('a37737) list)) -> ((('a37738) list) -> (('a37737) list))
val v_Base_dList_dflatMap : (('a37755) -> (('a37754) list)) -> ((('a37755) list) -> (('a37754) list))
val v_Base_dList_dmem : ('a37762) -> ((('a37762) list) -> (bool))
val v_Base_dList_dmemName : (string) -> (((string) list) -> (bool))
val v_Base_dList_dlookupPair : (string) -> ((((string, 'a37786) t_Base_dPair_dPair) list) -> (('a37786) t_Base_dMaybe_dMaybe))
val v_Base_dList_dzip : (('a37805) list) -> ((('a37804) list) -> ((('a37805, 'a37804) t_Base_dPair_dPair) list))
val v_Base_dList_dtake : (int) -> ((('a37829) list) -> (('a37829) list))
val v_Base_dList_ddrop : (int) -> ((('a37849) list) -> (('a37849) list))
val v_Base_dList_drange : (int) -> ((int) -> ((int) list))
val v_Base_dList_dmapMaybe : (('a37882) -> (('a37881) t_Base_dMaybe_dMaybe)) -> ((('a37882) list) -> (('a37881) list))
val v_vuna_uinst_ud_uBase_uList_uList_ufmap : (('a37978) -> ('a37977)) -> ((('a37978) list) -> (('a37977) list))
val v_vuna_uinst_ud_uBase_uList_uList_upure : ('a37985) -> (('a37985) list)
val v_vuna_uinst_ud_uBase_uList_uList_ubind : (('a37992) list) -> ((('a37992) -> (('a37991) list)) -> (('a37991) list))
val v_vuna_ueq_uBase_uList_uList : (('a39993) list) -> ((('a39993) list) -> (bool))
val v_vuna_uneq_uBase_uList_uList : (('a40020) list) -> ((('a40020) list) -> (bool))
