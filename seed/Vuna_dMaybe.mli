open Vuna_runtime
open Vuna_dPair
open Vuna_dBool
open Vuna_dMonad
type   'p0 t_Vuna_dMaybe_dMaybe =
    C_Vuna_dMaybe_dNothing
  | C_Vuna_dMaybe_dJust of ('p0)
val v_Vuna_dMaybe_dfromMaybe : ('a34863) -> ((('a34863) t_Vuna_dMaybe_dMaybe) -> ('a34863))
val v_Vuna_dMaybe_disJust : (('a34868) t_Vuna_dMaybe_dMaybe) -> (bool)
val v_Vuna_dMaybe_disNothing : (('a34872) t_Vuna_dMaybe_dMaybe) -> (bool)
val v_Vuna_dMaybe_dmaybe : ('a34877) -> ((('a34876) -> ('a34877)) -> ((('a34876) t_Vuna_dMaybe_dMaybe) -> ('a34877)))
val v_Vuna_dMaybe_dmapJust : (('a34885) -> ('a34884)) -> ((('a34885) t_Vuna_dMaybe_dMaybe) -> (('a34884) t_Vuna_dMaybe_dMaybe))
val v_vuna_uinst_ud_uVuna_uMaybe_uMaybe_ufmap : (('a34959) -> ('a34958)) -> ((('a34959) t_Vuna_dMaybe_dMaybe) -> (('a34958) t_Vuna_dMaybe_dMaybe))
val v_vuna_uinst_ud_uVuna_uMaybe_uMaybe_upure : ('a34968) -> (('a34968) t_Vuna_dMaybe_dMaybe)
val v_vuna_uinst_ud_uVuna_uMaybe_uMaybe_ubind : (('a34973) t_Vuna_dMaybe_dMaybe) -> ((('a34973) -> (('a34972) t_Vuna_dMaybe_dMaybe)) -> (('a34972) t_Vuna_dMaybe_dMaybe))
val v_vuna_ueq_uVuna_uMaybe_uMaybe : (('a36669) t_Vuna_dMaybe_dMaybe) -> ((('a36669) t_Vuna_dMaybe_dMaybe) -> (bool))
val v_vuna_uneq_uVuna_uMaybe_uMaybe : (('a36691) t_Vuna_dMaybe_dMaybe) -> ((('a36691) t_Vuna_dMaybe_dMaybe) -> (bool))
val show_Vuna_dMaybe_dMaybe : 'p0. ('p0 -> string) -> ('p0) t_Vuna_dMaybe_dMaybe -> string
