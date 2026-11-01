open Vuna_runtime
open Base_dPair
open Base_dBool
open Base_dMonad
type   'p0 t_Base_dMaybe_dMaybe =
    C_Base_dMaybe_dNothing
  | C_Base_dMaybe_dJust of ('p0)
val v_Base_dMaybe_dfromMaybe : ('a50313) -> ((('a50313) t_Base_dMaybe_dMaybe) -> ('a50313))
val v_Base_dMaybe_disJust : (('a50318) t_Base_dMaybe_dMaybe) -> (bool)
val v_Base_dMaybe_disNothing : (('a50322) t_Base_dMaybe_dMaybe) -> (bool)
val v_Base_dMaybe_dmaybe : ('a50327) -> ((('a50326) -> ('a50327)) -> ((('a50326) t_Base_dMaybe_dMaybe) -> ('a50327)))
val v_Base_dMaybe_dmapJust : (('a50335) -> ('a50334)) -> ((('a50335) t_Base_dMaybe_dMaybe) -> (('a50334) t_Base_dMaybe_dMaybe))
val v_vuna_uinst_ud_uBase_uMaybe_uMaybe_ufmap : (('a50409) -> ('a50408)) -> ((('a50409) t_Base_dMaybe_dMaybe) -> (('a50408) t_Base_dMaybe_dMaybe))
val v_vuna_uinst_ud_uBase_uMaybe_uMaybe_upure : ('a50418) -> (('a50418) t_Base_dMaybe_dMaybe)
val v_vuna_uinst_ud_uBase_uMaybe_uMaybe_ubind : (('a50423) t_Base_dMaybe_dMaybe) -> ((('a50423) -> (('a50422) t_Base_dMaybe_dMaybe)) -> (('a50422) t_Base_dMaybe_dMaybe))
val v_vuna_ueq_uBase_uMaybe_uMaybe : (('a52262) t_Base_dMaybe_dMaybe) -> ((('a52262) t_Base_dMaybe_dMaybe) -> (bool))
val v_vuna_uneq_uBase_uMaybe_uMaybe : (('a52284) t_Base_dMaybe_dMaybe) -> ((('a52284) t_Base_dMaybe_dMaybe) -> (bool))
val show_Base_dMaybe_dMaybe : 'p0. ('p0 -> string) -> ('p0) t_Base_dMaybe_dMaybe -> string
