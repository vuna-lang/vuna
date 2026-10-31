open Vuna_runtime
open Vuna_dPair
open Vuna_dBool
open Vuna_dMonad
type   'p0 t_Vuna_dMaybe_dMaybe =
    C_Vuna_dMaybe_dNothing
  | C_Vuna_dMaybe_dJust of ('p0)
val v_Vuna_dMaybe_dfromMaybe : ('a34491) -> ((('a34491) t_Vuna_dMaybe_dMaybe) -> ('a34491))
val v_Vuna_dMaybe_disJust : (('a34496) t_Vuna_dMaybe_dMaybe) -> (bool)
val v_Vuna_dMaybe_disNothing : (('a34500) t_Vuna_dMaybe_dMaybe) -> (bool)
val v_Vuna_dMaybe_dmaybe : ('a34505) -> ((('a34504) -> ('a34505)) -> ((('a34504) t_Vuna_dMaybe_dMaybe) -> ('a34505)))
val v_Vuna_dMaybe_dmapJust : (('a34513) -> ('a34512)) -> ((('a34513) t_Vuna_dMaybe_dMaybe) -> (('a34512) t_Vuna_dMaybe_dMaybe))
val v_vuna_uinst_ud_uVuna_uMaybe_uMaybe_ufmap : (('a34587) -> ('a34586)) -> ((('a34587) t_Vuna_dMaybe_dMaybe) -> (('a34586) t_Vuna_dMaybe_dMaybe))
val v_vuna_uinst_ud_uVuna_uMaybe_uMaybe_upure : ('a34596) -> (('a34596) t_Vuna_dMaybe_dMaybe)
val v_vuna_uinst_ud_uVuna_uMaybe_uMaybe_ubind : (('a34601) t_Vuna_dMaybe_dMaybe) -> ((('a34601) -> (('a34600) t_Vuna_dMaybe_dMaybe)) -> (('a34600) t_Vuna_dMaybe_dMaybe))
val v_vuna_ueq_uVuna_uMaybe_uMaybe : (('a36297) t_Vuna_dMaybe_dMaybe) -> ((('a36297) t_Vuna_dMaybe_dMaybe) -> (bool))
val v_vuna_uneq_uVuna_uMaybe_uMaybe : (('a36319) t_Vuna_dMaybe_dMaybe) -> ((('a36319) t_Vuna_dMaybe_dMaybe) -> (bool))
val show_Vuna_dMaybe_dMaybe : 'p0. ('p0 -> string) -> ('p0) t_Vuna_dMaybe_dMaybe -> string
