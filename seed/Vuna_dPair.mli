open Vuna_runtime
type   ('p0, 'p1) t_Vuna_dPair_dPair =
    C_Vuna_dPair_dPair of ('p0) * ('p1)
val v_Vuna_dPair_dfirstOf : (('a40470, 'a40469) t_Vuna_dPair_dPair) -> ('a40470)
val v_Vuna_dPair_dsecondOf : (('a40475, 'a40474) t_Vuna_dPair_dPair) -> ('a40474)
val v_vuna_ueq_uVuna_uPair_uPair : (('a42366, 'a42365) t_Vuna_dPair_dPair) -> ((('a42366, 'a42365) t_Vuna_dPair_dPair) -> (bool))
val v_vuna_uneq_uVuna_uPair_uPair : (('a42388, 'a42387) t_Vuna_dPair_dPair) -> ((('a42388, 'a42387) t_Vuna_dPair_dPair) -> (bool))
val show_Vuna_dPair_dPair : 'p0 'p1. ('p0 -> string) -> ('p1 -> string) -> ('p0, 'p1) t_Vuna_dPair_dPair -> string
