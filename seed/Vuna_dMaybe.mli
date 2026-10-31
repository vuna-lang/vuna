open Vuna_runtime
open Vuna_dPair
open Vuna_dBool
open Vuna_dMonad
type   'p0 t_Vuna_dMaybe_dMaybe =
    C_Vuna_dMaybe_dNothing
  | C_Vuna_dMaybe_dJust of ('p0)
val v_Vuna_dMaybe_dfromMaybe : ('a33500) -> ((('a33500) t_Vuna_dMaybe_dMaybe) -> ('a33500))
val v_Vuna_dMaybe_disJust : (('a33505) t_Vuna_dMaybe_dMaybe) -> (bool)
val v_Vuna_dMaybe_disNothing : (('a33509) t_Vuna_dMaybe_dMaybe) -> (bool)
val v_Vuna_dMaybe_dmaybe : ('a33514) -> ((('a33513) -> ('a33514)) -> ((('a33513) t_Vuna_dMaybe_dMaybe) -> ('a33514)))
val v_Vuna_dMaybe_dmapJust : (('a33522) -> ('a33521)) -> ((('a33522) t_Vuna_dMaybe_dMaybe) -> (('a33521) t_Vuna_dMaybe_dMaybe))
val v_vuna_uinst_ud_uVuna_uMaybe_uMaybe_ufmap : (('a33576) -> ('a33575)) -> ((('a33576) t_Vuna_dMaybe_dMaybe) -> (('a33575) t_Vuna_dMaybe_dMaybe))
val v_vuna_uinst_ud_uVuna_uMaybe_uMaybe_upure : ('a33585) -> (('a33585) t_Vuna_dMaybe_dMaybe)
val v_vuna_uinst_ud_uVuna_uMaybe_uMaybe_ubind : (('a33590) t_Vuna_dMaybe_dMaybe) -> ((('a33590) -> (('a33589) t_Vuna_dMaybe_dMaybe)) -> (('a33589) t_Vuna_dMaybe_dMaybe))
val v_vuna_ueq_uVuna_uMaybe_uMaybe : (('a35244) t_Vuna_dMaybe_dMaybe) -> ((('a35244) t_Vuna_dMaybe_dMaybe) -> (bool))
val v_vuna_uneq_uVuna_uMaybe_uMaybe : (('a35266) t_Vuna_dMaybe_dMaybe) -> ((('a35266) t_Vuna_dMaybe_dMaybe) -> (bool))
val show_Vuna_dMaybe_dMaybe : 'p0. ('p0 -> string) -> ('p0) t_Vuna_dMaybe_dMaybe -> string
