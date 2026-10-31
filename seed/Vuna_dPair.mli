open Vuna_runtime
type   ('p0, 'p1) t_Vuna_dPair_dPair =
    C_Vuna_dPair_dPair of ('p0) * ('p1)
val v_Vuna_dPair_dfirstOf : (('a34907, 'a34906) t_Vuna_dPair_dPair) -> ('a34907)
val v_Vuna_dPair_dsecondOf : (('a34912, 'a34911) t_Vuna_dPair_dPair) -> ('a34911)
val v_vuna_ueq_uVuna_uPair_uPair : (('a36732, 'a36731) t_Vuna_dPair_dPair) -> ((('a36732, 'a36731) t_Vuna_dPair_dPair) -> (bool))
val v_vuna_uneq_uVuna_uPair_uPair : (('a36754, 'a36753) t_Vuna_dPair_dPair) -> ((('a36754, 'a36753) t_Vuna_dPair_dPair) -> (bool))
val show_Vuna_dPair_dPair : 'p0 'p1. ('p0 -> string) -> ('p1 -> string) -> ('p0, 'p1) t_Vuna_dPair_dPair -> string
