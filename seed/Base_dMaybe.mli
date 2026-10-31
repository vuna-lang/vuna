open Vuna_runtime
open Base_dPair
open Base_dBool
open Base_dMonad
type   'p0 t_Base_dMaybe_dMaybe =
    C_Base_dMaybe_dNothing
  | C_Base_dMaybe_dJust of ('p0)
val v_Base_dMaybe_dfromMaybe : ('a41769) -> ((('a41769) t_Base_dMaybe_dMaybe) -> ('a41769))
val v_Base_dMaybe_disJust : (('a41774) t_Base_dMaybe_dMaybe) -> (bool)
val v_Base_dMaybe_disNothing : (('a41778) t_Base_dMaybe_dMaybe) -> (bool)
val v_Base_dMaybe_dmaybe : ('a41783) -> ((('a41782) -> ('a41783)) -> ((('a41782) t_Base_dMaybe_dMaybe) -> ('a41783)))
val v_Base_dMaybe_dmapJust : (('a41791) -> ('a41790)) -> ((('a41791) t_Base_dMaybe_dMaybe) -> (('a41790) t_Base_dMaybe_dMaybe))
val v_vuna_uinst_ud_uBase_uMaybe_uMaybe_ufmap : (('a41865) -> ('a41864)) -> ((('a41865) t_Base_dMaybe_dMaybe) -> (('a41864) t_Base_dMaybe_dMaybe))
val v_vuna_uinst_ud_uBase_uMaybe_uMaybe_upure : ('a41874) -> (('a41874) t_Base_dMaybe_dMaybe)
val v_vuna_uinst_ud_uBase_uMaybe_uMaybe_ubind : (('a41879) t_Base_dMaybe_dMaybe) -> ((('a41879) -> (('a41878) t_Base_dMaybe_dMaybe)) -> (('a41878) t_Base_dMaybe_dMaybe))
val v_vuna_ueq_uBase_uMaybe_uMaybe : (('a43574) t_Base_dMaybe_dMaybe) -> ((('a43574) t_Base_dMaybe_dMaybe) -> (bool))
val v_vuna_uneq_uBase_uMaybe_uMaybe : (('a43596) t_Base_dMaybe_dMaybe) -> ((('a43596) t_Base_dMaybe_dMaybe) -> (bool))
val show_Base_dMaybe_dMaybe : 'p0. ('p0 -> string) -> ('p0) t_Base_dMaybe_dMaybe -> string
