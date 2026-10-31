open Vuna_runtime
type   ('p0, 'p1) t_Vuna_dPair_dPair =
    C_Vuna_dPair_dPair of ('p0) * ('p1)
val v_Vuna_dPair_dfirstOf : (('a33544, 'a33543) t_Vuna_dPair_dPair) -> ('a33544)
val v_Vuna_dPair_dsecondOf : (('a33549, 'a33548) t_Vuna_dPair_dPair) -> ('a33548)
val v_vuna_ueq_uVuna_uPair_uPair : (('a35307, 'a35306) t_Vuna_dPair_dPair) -> ((('a35307, 'a35306) t_Vuna_dPair_dPair) -> (bool))
val v_vuna_uneq_uVuna_uPair_uPair : (('a35329, 'a35328) t_Vuna_dPair_dPair) -> ((('a35329, 'a35328) t_Vuna_dPair_dPair) -> (bool))
val show_Vuna_dPair_dPair : 'p0 'p1. ('p0 -> string) -> ('p1 -> string) -> ('p0, 'p1) t_Vuna_dPair_dPair -> string
