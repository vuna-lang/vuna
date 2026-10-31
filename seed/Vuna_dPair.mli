open Vuna_runtime
type   ('p0, 'p1) t_Vuna_dPair_dPair =
    C_Vuna_dPair_dPair of ('p0) * ('p1)
val v_Vuna_dPair_dfirstOf : (('a32716, 'a32715) t_Vuna_dPair_dPair) -> ('a32716)
val v_Vuna_dPair_dsecondOf : (('a32721, 'a32720) t_Vuna_dPair_dPair) -> ('a32720)
val v_vuna_ueq_uVuna_uPair_uPair : (('a34480, 'a34479) t_Vuna_dPair_dPair) -> ((('a34480, 'a34479) t_Vuna_dPair_dPair) -> (bool))
val v_vuna_uneq_uVuna_uPair_uPair : (('a34502, 'a34501) t_Vuna_dPair_dPair) -> ((('a34502, 'a34501) t_Vuna_dPair_dPair) -> (bool))
val show_Vuna_dPair_dPair : 'p0 'p1. ('p0 -> string) -> ('p1 -> string) -> ('p0, 'p1) t_Vuna_dPair_dPair -> string
