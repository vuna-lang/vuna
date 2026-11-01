open Vuna_runtime
type   ('p0, 'p1) t_Base_dPair_dPair =
    C_Base_dPair_dPair of ('p0) * ('p1)
val v_Base_dPair_dfirstOf : (('a50357, 'a50356) t_Base_dPair_dPair) -> ('a50357)
val v_Base_dPair_dsecondOf : (('a50362, 'a50361) t_Base_dPair_dPair) -> ('a50361)
val v_vuna_ueq_uBase_uPair_uPair : (('a52325, 'a52324) t_Base_dPair_dPair) -> ((('a52325, 'a52324) t_Base_dPair_dPair) -> (bool))
val v_vuna_uneq_uBase_uPair_uPair : (('a52347, 'a52346) t_Base_dPair_dPair) -> ((('a52347, 'a52346) t_Base_dPair_dPair) -> (bool))
val show_Base_dPair_dPair : 'p0 'p1. ('p0 -> string) -> ('p1 -> string) -> ('p0, 'p1) t_Base_dPair_dPair -> string
