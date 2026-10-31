open Vuna_runtime
open Vuna_dPair
open Vuna_dBool
open Vuna_dMonad
open Vuna_dMaybe
val v_Vuna_dList_dappend : (('a36685) list) -> ((('a36685) list) -> (('a36685) list))
val v_Vuna_dList_dreverse : (('a36711) list) -> (('a36711) list)
val v_Vuna_dList_dlength : (('a36717) list) -> (int)
val v_Vuna_dList_dmap : (('a36727) -> ('a36726)) -> ((('a36727) list) -> (('a36726) list))
val v_Vuna_dList_dfilter : (('a36743) -> (bool)) -> ((('a36743) list) -> (('a36743) list))
val v_Vuna_dList_dfoldl : (('a36762) -> (('a36761) -> ('a36762))) -> (('a36762) -> ((('a36761) list) -> ('a36762)))
val v_Vuna_dList_dfoldr : (('a36779) -> (('a36778) -> ('a36778))) -> (('a36778) -> ((('a36779) list) -> ('a36778)))
val v_Vuna_dList_dconcatMap : (('a36796) -> (('a36795) list)) -> ((('a36796) list) -> (('a36795) list))
val v_Vuna_dList_dflatMap : (('a36813) -> (('a36812) list)) -> ((('a36813) list) -> (('a36812) list))
val v_Vuna_dList_dmem : ('a36820) -> ((('a36820) list) -> (bool))
val v_Vuna_dList_dmemName : (string) -> (((string) list) -> (bool))
val v_Vuna_dList_dlookupPair : (string) -> ((((string, 'a36844) t_Vuna_dPair_dPair) list) -> (('a36844) t_Vuna_dMaybe_dMaybe))
val v_Vuna_dList_dzip : (('a36863) list) -> ((('a36862) list) -> ((('a36863, 'a36862) t_Vuna_dPair_dPair) list))
val v_Vuna_dList_dtake : (int) -> ((('a36887) list) -> (('a36887) list))
val v_Vuna_dList_ddrop : (int) -> ((('a36907) list) -> (('a36907) list))
val v_Vuna_dList_drange : (int) -> ((int) -> ((int) list))
val v_Vuna_dList_dmapMaybe : (('a36940) -> (('a36939) t_Vuna_dMaybe_dMaybe)) -> ((('a36940) list) -> (('a36939) list))
val v_vuna_uinst_ud_uVuna_uList_uList_ufmap : (('a37036) -> ('a37035)) -> ((('a37036) list) -> (('a37035) list))
val v_vuna_uinst_ud_uVuna_uList_uList_upure : ('a37043) -> (('a37043) list)
val v_vuna_uinst_ud_uVuna_uList_uList_ubind : (('a37050) list) -> ((('a37050) -> (('a37049) list)) -> (('a37049) list))
val v_vuna_ueq_uVuna_uList_uList : (('a39051) list) -> ((('a39051) list) -> (bool))
val v_vuna_uneq_uVuna_uList_uList : (('a39078) list) -> ((('a39078) list) -> (bool))
