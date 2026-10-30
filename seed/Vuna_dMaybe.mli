open Vuna_runtime
open Vuna_dPair
open Vuna_dBool
open Vuna_dMonad
type   'p0 t_Vuna_dMaybe_dMaybe =
    C_Vuna_dMaybe_dNothing
  | C_Vuna_dMaybe_dJust of ('p0)
val v_Vuna_dMaybe_dfromMaybe : ('a40426) -> ((('a40426) t_Vuna_dMaybe_dMaybe) -> ('a40426))
val v_Vuna_dMaybe_disJust : (('a40431) t_Vuna_dMaybe_dMaybe) -> (bool)
val v_Vuna_dMaybe_disNothing : (('a40435) t_Vuna_dMaybe_dMaybe) -> (bool)
val v_Vuna_dMaybe_dmaybe : ('a40440) -> ((('a40439) -> ('a40440)) -> ((('a40439) t_Vuna_dMaybe_dMaybe) -> ('a40440)))
val v_Vuna_dMaybe_dmapJust : (('a40448) -> ('a40447)) -> ((('a40448) t_Vuna_dMaybe_dMaybe) -> (('a40447) t_Vuna_dMaybe_dMaybe))
val v_vuna_uinst_ud_uVuna_uMaybe_uMaybe_ufmap : (('a40502) -> ('a40501)) -> ((('a40502) t_Vuna_dMaybe_dMaybe) -> (('a40501) t_Vuna_dMaybe_dMaybe))
val v_vuna_uinst_ud_uVuna_uMaybe_uMaybe_upure : ('a40511) -> (('a40511) t_Vuna_dMaybe_dMaybe)
val v_vuna_uinst_ud_uVuna_uMaybe_uMaybe_ubind : (('a40516) t_Vuna_dMaybe_dMaybe) -> ((('a40516) -> (('a40515) t_Vuna_dMaybe_dMaybe)) -> (('a40515) t_Vuna_dMaybe_dMaybe))
val v_vuna_ueq_uVuna_uMaybe_uMaybe : (('a42303) t_Vuna_dMaybe_dMaybe) -> ((('a42303) t_Vuna_dMaybe_dMaybe) -> (bool))
val v_vuna_uneq_uVuna_uMaybe_uMaybe : (('a42325) t_Vuna_dMaybe_dMaybe) -> ((('a42325) t_Vuna_dMaybe_dMaybe) -> (bool))
val show_Vuna_dMaybe_dMaybe : 'p0. ('p0 -> string) -> ('p0) t_Vuna_dMaybe_dMaybe -> string
