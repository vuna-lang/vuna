open Vuna_runtime
type   ('p0, 'p1) t_Base_dPair_dPair =
    C_Base_dPair_dPair of ('p0) * ('p1)
val v_Base_dPair_dfirstOf : (('a44697, 'a44696) t_Base_dPair_dPair) -> ('a44697)
val v_Base_dPair_dsecondOf : (('a44702, 'a44701) t_Base_dPair_dPair) -> ('a44701)
val v_vuna_ueq_uBase_uPair_uPair : (('a46550, 'a46549) t_Base_dPair_dPair) -> ((('a46550, 'a46549) t_Base_dPair_dPair) -> (bool))
val v_vuna_uneq_uBase_uPair_uPair : (('a46572, 'a46571) t_Base_dPair_dPair) -> ((('a46572, 'a46571) t_Base_dPair_dPair) -> (bool))
val show_Base_dPair_dPair : 'p0 'p1. ('p0 -> string) -> ('p1 -> string) -> ('p0, 'p1) t_Base_dPair_dPair -> string
