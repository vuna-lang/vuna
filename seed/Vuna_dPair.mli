open Vuna_runtime
type   ('p0, 'p1) t_Vuna_dPair_dPair =
    C_Vuna_dPair_dPair of ('p0) * ('p1)
val v_Vuna_dPair_dfirstOf : (('a34535, 'a34534) t_Vuna_dPair_dPair) -> ('a34535)
val v_Vuna_dPair_dsecondOf : (('a34540, 'a34539) t_Vuna_dPair_dPair) -> ('a34539)
val v_vuna_ueq_uVuna_uPair_uPair : (('a36360, 'a36359) t_Vuna_dPair_dPair) -> ((('a36360, 'a36359) t_Vuna_dPair_dPair) -> (bool))
val v_vuna_uneq_uVuna_uPair_uPair : (('a36382, 'a36381) t_Vuna_dPair_dPair) -> ((('a36382, 'a36381) t_Vuna_dPair_dPair) -> (bool))
val show_Vuna_dPair_dPair : 'p0 'p1. ('p0 -> string) -> ('p1 -> string) -> ('p0, 'p1) t_Vuna_dPair_dPair -> string
