open Vuna_runtime
open Base_dPair
open Base_dBool
open Base_dMonad
type   'p0 t_Base_dMaybe_dMaybe =
    C_Base_dMaybe_dNothing
  | C_Base_dMaybe_dJust of ('p0)
val v_Base_dMaybe_dfromMaybe : ('a44653) -> ((('a44653) t_Base_dMaybe_dMaybe) -> ('a44653))
val v_Base_dMaybe_disJust : (('a44658) t_Base_dMaybe_dMaybe) -> (bool)
val v_Base_dMaybe_disNothing : (('a44662) t_Base_dMaybe_dMaybe) -> (bool)
val v_Base_dMaybe_dmaybe : ('a44667) -> ((('a44666) -> ('a44667)) -> ((('a44666) t_Base_dMaybe_dMaybe) -> ('a44667)))
val v_Base_dMaybe_dmapJust : (('a44675) -> ('a44674)) -> ((('a44675) t_Base_dMaybe_dMaybe) -> (('a44674) t_Base_dMaybe_dMaybe))
val v_vuna_uinst_ud_uBase_uMaybe_uMaybe_ufmap : (('a44749) -> ('a44748)) -> ((('a44749) t_Base_dMaybe_dMaybe) -> (('a44748) t_Base_dMaybe_dMaybe))
val v_vuna_uinst_ud_uBase_uMaybe_uMaybe_upure : ('a44758) -> (('a44758) t_Base_dMaybe_dMaybe)
val v_vuna_uinst_ud_uBase_uMaybe_uMaybe_ubind : (('a44763) t_Base_dMaybe_dMaybe) -> ((('a44763) -> (('a44762) t_Base_dMaybe_dMaybe)) -> (('a44762) t_Base_dMaybe_dMaybe))
val v_vuna_ueq_uBase_uMaybe_uMaybe : (('a46487) t_Base_dMaybe_dMaybe) -> ((('a46487) t_Base_dMaybe_dMaybe) -> (bool))
val v_vuna_uneq_uBase_uMaybe_uMaybe : (('a46509) t_Base_dMaybe_dMaybe) -> ((('a46509) t_Base_dMaybe_dMaybe) -> (bool))
val show_Base_dMaybe_dMaybe : 'p0. ('p0 -> string) -> ('p0) t_Base_dMaybe_dMaybe -> string
