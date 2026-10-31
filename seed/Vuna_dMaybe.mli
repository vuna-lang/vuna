open Vuna_runtime
open Vuna_dPair
open Vuna_dBool
open Vuna_dMonad
type   'p0 t_Vuna_dMaybe_dMaybe =
    C_Vuna_dMaybe_dNothing
  | C_Vuna_dMaybe_dJust of ('p0)
val v_Vuna_dMaybe_dfromMaybe : ('a34456) -> ((('a34456) t_Vuna_dMaybe_dMaybe) -> ('a34456))
val v_Vuna_dMaybe_disJust : (('a34461) t_Vuna_dMaybe_dMaybe) -> (bool)
val v_Vuna_dMaybe_disNothing : (('a34465) t_Vuna_dMaybe_dMaybe) -> (bool)
val v_Vuna_dMaybe_dmaybe : ('a34470) -> ((('a34469) -> ('a34470)) -> ((('a34469) t_Vuna_dMaybe_dMaybe) -> ('a34470)))
val v_Vuna_dMaybe_dmapJust : (('a34478) -> ('a34477)) -> ((('a34478) t_Vuna_dMaybe_dMaybe) -> (('a34477) t_Vuna_dMaybe_dMaybe))
val v_vuna_uinst_ud_uVuna_uMaybe_uMaybe_ufmap : (('a34552) -> ('a34551)) -> ((('a34552) t_Vuna_dMaybe_dMaybe) -> (('a34551) t_Vuna_dMaybe_dMaybe))
val v_vuna_uinst_ud_uVuna_uMaybe_uMaybe_upure : ('a34561) -> (('a34561) t_Vuna_dMaybe_dMaybe)
val v_vuna_uinst_ud_uVuna_uMaybe_uMaybe_ubind : (('a34566) t_Vuna_dMaybe_dMaybe) -> ((('a34566) -> (('a34565) t_Vuna_dMaybe_dMaybe)) -> (('a34565) t_Vuna_dMaybe_dMaybe))
val v_vuna_ueq_uVuna_uMaybe_uMaybe : (('a36262) t_Vuna_dMaybe_dMaybe) -> ((('a36262) t_Vuna_dMaybe_dMaybe) -> (bool))
val v_vuna_uneq_uVuna_uMaybe_uMaybe : (('a36284) t_Vuna_dMaybe_dMaybe) -> ((('a36284) t_Vuna_dMaybe_dMaybe) -> (bool))
val show_Vuna_dMaybe_dMaybe : 'p0. ('p0 -> string) -> ('p0) t_Vuna_dMaybe_dMaybe -> string
