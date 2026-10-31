open Vuna_runtime
type   ('p0, 'p1) t_Vuna_dPair_dPair =
    C_Vuna_dPair_dPair of ('p0) * ('p1)
val v_Vuna_dPair_dfirstOf : (('a37006, 'a37005) t_Vuna_dPair_dPair) -> ('a37006)
val v_Vuna_dPair_dsecondOf : (('a37011, 'a37010) t_Vuna_dPair_dPair) -> ('a37010)
val v_vuna_ueq_uVuna_uPair_uPair : (('a39153, 'a39152) t_Vuna_dPair_dPair) -> ((('a39153, 'a39152) t_Vuna_dPair_dPair) -> (bool))
val v_vuna_uneq_uVuna_uPair_uPair : (('a39175, 'a39174) t_Vuna_dPair_dPair) -> ((('a39175, 'a39174) t_Vuna_dPair_dPair) -> (bool))
val show_Vuna_dPair_dPair : 'p0 'p1. ('p0 -> string) -> ('p1 -> string) -> ('p0, 'p1) t_Vuna_dPair_dPair -> string
