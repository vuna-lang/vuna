open Vuna_runtime
open Base_dPair
open Base_dBool
open Base_dMonad
type   'p0 t_Base_dMaybe_dMaybe =
    C_Base_dMaybe_dNothing
  | C_Base_dMaybe_dJust of ('p0)
val v_Base_dMaybe_dfromMaybe : ('a37904) -> ((('a37904) t_Base_dMaybe_dMaybe) -> ('a37904))
val v_Base_dMaybe_disJust : (('a37909) t_Base_dMaybe_dMaybe) -> (bool)
val v_Base_dMaybe_disNothing : (('a37913) t_Base_dMaybe_dMaybe) -> (bool)
val v_Base_dMaybe_dmaybe : ('a37918) -> ((('a37917) -> ('a37918)) -> ((('a37917) t_Base_dMaybe_dMaybe) -> ('a37918)))
val v_Base_dMaybe_dmapJust : (('a37926) -> ('a37925)) -> ((('a37926) t_Base_dMaybe_dMaybe) -> (('a37925) t_Base_dMaybe_dMaybe))
val v_vuna_uinst_ud_uBase_uMaybe_uMaybe_ufmap : (('a38000) -> ('a37999)) -> ((('a38000) t_Base_dMaybe_dMaybe) -> (('a37999) t_Base_dMaybe_dMaybe))
val v_vuna_uinst_ud_uBase_uMaybe_uMaybe_upure : ('a38009) -> (('a38009) t_Base_dMaybe_dMaybe)
val v_vuna_uinst_ud_uBase_uMaybe_uMaybe_ubind : (('a38014) t_Base_dMaybe_dMaybe) -> ((('a38014) -> (('a38013) t_Base_dMaybe_dMaybe)) -> (('a38013) t_Base_dMaybe_dMaybe))
val v_vuna_ueq_uBase_uMaybe_uMaybe : (('a40032) t_Base_dMaybe_dMaybe) -> ((('a40032) t_Base_dMaybe_dMaybe) -> (bool))
val v_vuna_uneq_uBase_uMaybe_uMaybe : (('a40054) t_Base_dMaybe_dMaybe) -> ((('a40054) t_Base_dMaybe_dMaybe) -> (bool))
val show_Base_dMaybe_dMaybe : 'p0. ('p0 -> string) -> ('p0) t_Base_dMaybe_dMaybe -> string
