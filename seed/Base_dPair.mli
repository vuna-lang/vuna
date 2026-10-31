open Vuna_runtime
type   ('p0, 'p1) t_Base_dPair_dPair =
    C_Base_dPair_dPair of ('p0) * ('p1)
val v_Base_dPair_dfirstOf : (('a41813, 'a41812) t_Base_dPair_dPair) -> ('a41813)
val v_Base_dPair_dsecondOf : (('a41818, 'a41817) t_Base_dPair_dPair) -> ('a41817)
val v_vuna_ueq_uBase_uPair_uPair : (('a43637, 'a43636) t_Base_dPair_dPair) -> ((('a43637, 'a43636) t_Base_dPair_dPair) -> (bool))
val v_vuna_uneq_uBase_uPair_uPair : (('a43659, 'a43658) t_Base_dPair_dPair) -> ((('a43659, 'a43658) t_Base_dPair_dPair) -> (bool))
val show_Base_dPair_dPair : 'p0 'p1. ('p0 -> string) -> ('p1 -> string) -> ('p0, 'p1) t_Base_dPair_dPair -> string
