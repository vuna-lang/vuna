open Vuna_runtime
type   ('p0, 'p1) t_Base_dPair_dPair =
    C_Base_dPair_dPair of ('p0) * ('p1)
val v_Base_dPair_dfirstOf : (('a50533, 'a50532) t_Base_dPair_dPair) -> ('a50533)
val v_Base_dPair_dsecondOf : (('a50538, 'a50537) t_Base_dPair_dPair) -> ('a50537)
val v_vuna_ueq_uBase_uPair_uPair : (('a52501, 'a52500) t_Base_dPair_dPair) -> ((('a52501, 'a52500) t_Base_dPair_dPair) -> (bool))
val v_vuna_uneq_uBase_uPair_uPair : (('a52523, 'a52522) t_Base_dPair_dPair) -> ((('a52523, 'a52522) t_Base_dPair_dPair) -> (bool))
val show_Base_dPair_dPair : 'p0 'p1. ('p0 -> string) -> ('p1 -> string) -> ('p0, 'p1) t_Base_dPair_dPair -> string
