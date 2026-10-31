open Vuna_runtime
type   ('p0, 'p1) t_Base_dPair_dPair =
    C_Base_dPair_dPair of ('p0) * ('p1)
val v_Base_dPair_dfirstOf : (('a37948, 'a37947) t_Base_dPair_dPair) -> ('a37948)
val v_Base_dPair_dsecondOf : (('a37953, 'a37952) t_Base_dPair_dPair) -> ('a37952)
val v_vuna_ueq_uBase_uPair_uPair : (('a40095, 'a40094) t_Base_dPair_dPair) -> ((('a40095, 'a40094) t_Base_dPair_dPair) -> (bool))
val v_vuna_uneq_uBase_uPair_uPair : (('a40117, 'a40116) t_Base_dPair_dPair) -> ((('a40117, 'a40116) t_Base_dPair_dPair) -> (bool))
val show_Base_dPair_dPair : 'p0 'p1. ('p0 -> string) -> ('p1 -> string) -> ('p0, 'p1) t_Base_dPair_dPair -> string
