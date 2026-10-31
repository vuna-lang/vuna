open Vuna_runtime
type   ('p0, 'p1) t_Vuna_dPair_dPair =
    C_Vuna_dPair_dPair of ('p0) * ('p1)
val v_Vuna_dPair_dfirstOf : (('a34500, 'a34499) t_Vuna_dPair_dPair) -> ('a34500)
val v_Vuna_dPair_dsecondOf : (('a34505, 'a34504) t_Vuna_dPair_dPair) -> ('a34504)
val v_vuna_ueq_uVuna_uPair_uPair : (('a36325, 'a36324) t_Vuna_dPair_dPair) -> ((('a36325, 'a36324) t_Vuna_dPair_dPair) -> (bool))
val v_vuna_uneq_uVuna_uPair_uPair : (('a36347, 'a36346) t_Vuna_dPair_dPair) -> ((('a36347, 'a36346) t_Vuna_dPair_dPair) -> (bool))
val show_Vuna_dPair_dPair : 'p0 'p1. ('p0 -> string) -> ('p1 -> string) -> ('p0, 'p1) t_Vuna_dPair_dPair -> string
