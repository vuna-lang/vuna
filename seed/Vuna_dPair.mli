open Vuna_runtime
type   ('p0, 'p1) t_Vuna_dPair_dPair =
    C_Vuna_dPair_dPair of ('p0) * ('p1)
val v_Vuna_dPair_dfirstOf : (('a33830, 'a33829) t_Vuna_dPair_dPair) -> ('a33830)
val v_Vuna_dPair_dsecondOf : (('a33835, 'a33834) t_Vuna_dPair_dPair) -> ('a33834)
val v_vuna_ueq_uVuna_uPair_uPair : (('a35635, 'a35634) t_Vuna_dPair_dPair) -> ((('a35635, 'a35634) t_Vuna_dPair_dPair) -> (bool))
val v_vuna_uneq_uVuna_uPair_uPair : (('a35657, 'a35656) t_Vuna_dPair_dPair) -> ((('a35657, 'a35656) t_Vuna_dPair_dPair) -> (bool))
val show_Vuna_dPair_dPair : 'p0 'p1. ('p0 -> string) -> ('p1 -> string) -> ('p0, 'p1) t_Vuna_dPair_dPair -> string
