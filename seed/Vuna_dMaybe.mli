open Vuna_runtime
open Vuna_dPair
open Vuna_dBool
open Vuna_dMonad
type   'p0 t_Vuna_dMaybe_dMaybe =
    C_Vuna_dMaybe_dNothing
  | C_Vuna_dMaybe_dJust of ('p0)
val v_Vuna_dMaybe_dfromMaybe : ('a33786) -> ((('a33786) t_Vuna_dMaybe_dMaybe) -> ('a33786))
val v_Vuna_dMaybe_disJust : (('a33791) t_Vuna_dMaybe_dMaybe) -> (bool)
val v_Vuna_dMaybe_disNothing : (('a33795) t_Vuna_dMaybe_dMaybe) -> (bool)
val v_Vuna_dMaybe_dmaybe : ('a33800) -> ((('a33799) -> ('a33800)) -> ((('a33799) t_Vuna_dMaybe_dMaybe) -> ('a33800)))
val v_Vuna_dMaybe_dmapJust : (('a33808) -> ('a33807)) -> ((('a33808) t_Vuna_dMaybe_dMaybe) -> (('a33807) t_Vuna_dMaybe_dMaybe))
val v_vuna_uinst_ud_uVuna_uMaybe_uMaybe_ufmap : (('a33862) -> ('a33861)) -> ((('a33862) t_Vuna_dMaybe_dMaybe) -> (('a33861) t_Vuna_dMaybe_dMaybe))
val v_vuna_uinst_ud_uVuna_uMaybe_uMaybe_upure : ('a33871) -> (('a33871) t_Vuna_dMaybe_dMaybe)
val v_vuna_uinst_ud_uVuna_uMaybe_uMaybe_ubind : (('a33876) t_Vuna_dMaybe_dMaybe) -> ((('a33876) -> (('a33875) t_Vuna_dMaybe_dMaybe)) -> (('a33875) t_Vuna_dMaybe_dMaybe))
val v_vuna_ueq_uVuna_uMaybe_uMaybe : (('a35572) t_Vuna_dMaybe_dMaybe) -> ((('a35572) t_Vuna_dMaybe_dMaybe) -> (bool))
val v_vuna_uneq_uVuna_uMaybe_uMaybe : (('a35594) t_Vuna_dMaybe_dMaybe) -> ((('a35594) t_Vuna_dMaybe_dMaybe) -> (bool))
val show_Vuna_dMaybe_dMaybe : 'p0. ('p0 -> string) -> ('p0) t_Vuna_dMaybe_dMaybe -> string
