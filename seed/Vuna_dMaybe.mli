open Vuna_runtime
open Vuna_dPair
open Vuna_dBool
open Vuna_dMonad
type   'p0 t_Vuna_dMaybe_dMaybe =
    C_Vuna_dMaybe_dNothing
  | C_Vuna_dMaybe_dJust of ('p0)
val v_Vuna_dMaybe_dfromMaybe : ('a32672) -> ((('a32672) t_Vuna_dMaybe_dMaybe) -> ('a32672))
val v_Vuna_dMaybe_disJust : (('a32677) t_Vuna_dMaybe_dMaybe) -> (bool)
val v_Vuna_dMaybe_disNothing : (('a32681) t_Vuna_dMaybe_dMaybe) -> (bool)
val v_Vuna_dMaybe_dmaybe : ('a32686) -> ((('a32685) -> ('a32686)) -> ((('a32685) t_Vuna_dMaybe_dMaybe) -> ('a32686)))
val v_Vuna_dMaybe_dmapJust : (('a32694) -> ('a32693)) -> ((('a32694) t_Vuna_dMaybe_dMaybe) -> (('a32693) t_Vuna_dMaybe_dMaybe))
val v_vuna_uinst_ud_uVuna_uMaybe_uMaybe_ufmap : (('a32768) -> ('a32767)) -> ((('a32768) t_Vuna_dMaybe_dMaybe) -> (('a32767) t_Vuna_dMaybe_dMaybe))
val v_vuna_uinst_ud_uVuna_uMaybe_uMaybe_upure : ('a32777) -> (('a32777) t_Vuna_dMaybe_dMaybe)
val v_vuna_uinst_ud_uVuna_uMaybe_uMaybe_ubind : (('a32782) t_Vuna_dMaybe_dMaybe) -> ((('a32782) -> (('a32781) t_Vuna_dMaybe_dMaybe)) -> (('a32781) t_Vuna_dMaybe_dMaybe))
val v_vuna_ueq_uVuna_uMaybe_uMaybe : (('a34417) t_Vuna_dMaybe_dMaybe) -> ((('a34417) t_Vuna_dMaybe_dMaybe) -> (bool))
val v_vuna_uneq_uVuna_uMaybe_uMaybe : (('a34439) t_Vuna_dMaybe_dMaybe) -> ((('a34439) t_Vuna_dMaybe_dMaybe) -> (bool))
val show_Vuna_dMaybe_dMaybe : 'p0. ('p0 -> string) -> ('p0) t_Vuna_dMaybe_dMaybe -> string
