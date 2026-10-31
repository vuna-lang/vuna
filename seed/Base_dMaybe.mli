open Vuna_runtime
open Base_dPair
open Base_dBool
open Base_dMonad
type   'p0 t_Base_dMaybe_dMaybe =
    C_Base_dMaybe_dNothing
  | C_Base_dMaybe_dJust of ('p0)
val v_Base_dMaybe_dfromMaybe : ('a41653) -> ((('a41653) t_Base_dMaybe_dMaybe) -> ('a41653))
val v_Base_dMaybe_disJust : (('a41658) t_Base_dMaybe_dMaybe) -> (bool)
val v_Base_dMaybe_disNothing : (('a41662) t_Base_dMaybe_dMaybe) -> (bool)
val v_Base_dMaybe_dmaybe : ('a41667) -> ((('a41666) -> ('a41667)) -> ((('a41666) t_Base_dMaybe_dMaybe) -> ('a41667)))
val v_Base_dMaybe_dmapJust : (('a41675) -> ('a41674)) -> ((('a41675) t_Base_dMaybe_dMaybe) -> (('a41674) t_Base_dMaybe_dMaybe))
val v_vuna_uinst_ud_uBase_uMaybe_uMaybe_ufmap : (('a41749) -> ('a41748)) -> ((('a41749) t_Base_dMaybe_dMaybe) -> (('a41748) t_Base_dMaybe_dMaybe))
val v_vuna_uinst_ud_uBase_uMaybe_uMaybe_upure : ('a41758) -> (('a41758) t_Base_dMaybe_dMaybe)
val v_vuna_uinst_ud_uBase_uMaybe_uMaybe_ubind : (('a41763) t_Base_dMaybe_dMaybe) -> ((('a41763) -> (('a41762) t_Base_dMaybe_dMaybe)) -> (('a41762) t_Base_dMaybe_dMaybe))
val v_vuna_ueq_uBase_uMaybe_uMaybe : (('a43458) t_Base_dMaybe_dMaybe) -> ((('a43458) t_Base_dMaybe_dMaybe) -> (bool))
val v_vuna_uneq_uBase_uMaybe_uMaybe : (('a43480) t_Base_dMaybe_dMaybe) -> ((('a43480) t_Base_dMaybe_dMaybe) -> (bool))
val show_Base_dMaybe_dMaybe : 'p0. ('p0 -> string) -> ('p0) t_Base_dMaybe_dMaybe -> string
