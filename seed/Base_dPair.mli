open Vuna_runtime
type   ('p0, 'p1) t_Base_dPair_dPair =
    C_Base_dPair_dPair of ('p0) * ('p1)
val v_Base_dPair_dfirstOf : (('a41697, 'a41696) t_Base_dPair_dPair) -> ('a41697)
val v_Base_dPair_dsecondOf : (('a41702, 'a41701) t_Base_dPair_dPair) -> ('a41701)
val v_vuna_ueq_uBase_uPair_uPair : (('a43521, 'a43520) t_Base_dPair_dPair) -> ((('a43521, 'a43520) t_Base_dPair_dPair) -> (bool))
val v_vuna_uneq_uBase_uPair_uPair : (('a43543, 'a43542) t_Base_dPair_dPair) -> ((('a43543, 'a43542) t_Base_dPair_dPair) -> (bool))
val show_Base_dPair_dPair : 'p0 'p1. ('p0 -> string) -> ('p1 -> string) -> ('p0, 'p1) t_Base_dPair_dPair -> string
