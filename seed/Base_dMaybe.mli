open Vuna_runtime
open Base_dPair
open Base_dBool
open Base_dMonad
type   'p0 t_Base_dMaybe_dMaybe =
    C_Base_dMaybe_dNothing
  | C_Base_dMaybe_dJust of ('p0)
val v_Base_dMaybe_dfromMaybe : ('a50489) -> ((('a50489) t_Base_dMaybe_dMaybe) -> ('a50489))
val v_Base_dMaybe_disJust : (('a50494) t_Base_dMaybe_dMaybe) -> (bool)
val v_Base_dMaybe_disNothing : (('a50498) t_Base_dMaybe_dMaybe) -> (bool)
val v_Base_dMaybe_dmaybe : ('a50503) -> ((('a50502) -> ('a50503)) -> ((('a50502) t_Base_dMaybe_dMaybe) -> ('a50503)))
val v_Base_dMaybe_dmapJust : (('a50511) -> ('a50510)) -> ((('a50511) t_Base_dMaybe_dMaybe) -> (('a50510) t_Base_dMaybe_dMaybe))
val v_vuna_uinst_ud_uBase_uMaybe_uMaybe_ufmap : (('a50585) -> ('a50584)) -> ((('a50585) t_Base_dMaybe_dMaybe) -> (('a50584) t_Base_dMaybe_dMaybe))
val v_vuna_uinst_ud_uBase_uMaybe_uMaybe_upure : ('a50594) -> (('a50594) t_Base_dMaybe_dMaybe)
val v_vuna_uinst_ud_uBase_uMaybe_uMaybe_ubind : (('a50599) t_Base_dMaybe_dMaybe) -> ((('a50599) -> (('a50598) t_Base_dMaybe_dMaybe)) -> (('a50598) t_Base_dMaybe_dMaybe))
val v_vuna_ueq_uBase_uMaybe_uMaybe : (('a52438) t_Base_dMaybe_dMaybe) -> ((('a52438) t_Base_dMaybe_dMaybe) -> (bool))
val v_vuna_uneq_uBase_uMaybe_uMaybe : (('a52460) t_Base_dMaybe_dMaybe) -> ((('a52460) t_Base_dMaybe_dMaybe) -> (bool))
val show_Base_dMaybe_dMaybe : 'p0. ('p0 -> string) -> ('p0) t_Base_dMaybe_dMaybe -> string
