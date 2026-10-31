open Vuna_runtime
open Vuna_dPair
open Vuna_dBool
open Vuna_dMonad
type   'p0 t_Vuna_dMaybe_dMaybe =
    C_Vuna_dMaybe_dNothing
  | C_Vuna_dMaybe_dJust of ('p0)
val v_Vuna_dMaybe_dfromMaybe : ('a36962) -> ((('a36962) t_Vuna_dMaybe_dMaybe) -> ('a36962))
val v_Vuna_dMaybe_disJust : (('a36967) t_Vuna_dMaybe_dMaybe) -> (bool)
val v_Vuna_dMaybe_disNothing : (('a36971) t_Vuna_dMaybe_dMaybe) -> (bool)
val v_Vuna_dMaybe_dmaybe : ('a36976) -> ((('a36975) -> ('a36976)) -> ((('a36975) t_Vuna_dMaybe_dMaybe) -> ('a36976)))
val v_Vuna_dMaybe_dmapJust : (('a36984) -> ('a36983)) -> ((('a36984) t_Vuna_dMaybe_dMaybe) -> (('a36983) t_Vuna_dMaybe_dMaybe))
val v_vuna_uinst_ud_uVuna_uMaybe_uMaybe_ufmap : (('a37058) -> ('a37057)) -> ((('a37058) t_Vuna_dMaybe_dMaybe) -> (('a37057) t_Vuna_dMaybe_dMaybe))
val v_vuna_uinst_ud_uVuna_uMaybe_uMaybe_upure : ('a37067) -> (('a37067) t_Vuna_dMaybe_dMaybe)
val v_vuna_uinst_ud_uVuna_uMaybe_uMaybe_ubind : (('a37072) t_Vuna_dMaybe_dMaybe) -> ((('a37072) -> (('a37071) t_Vuna_dMaybe_dMaybe)) -> (('a37071) t_Vuna_dMaybe_dMaybe))
val v_vuna_ueq_uVuna_uMaybe_uMaybe : (('a39090) t_Vuna_dMaybe_dMaybe) -> ((('a39090) t_Vuna_dMaybe_dMaybe) -> (bool))
val v_vuna_uneq_uVuna_uMaybe_uMaybe : (('a39112) t_Vuna_dMaybe_dMaybe) -> ((('a39112) t_Vuna_dMaybe_dMaybe) -> (bool))
val show_Vuna_dMaybe_dMaybe : 'p0. ('p0 -> string) -> ('p0) t_Vuna_dMaybe_dMaybe -> string
