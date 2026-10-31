open Vuna_runtime
open Vuna_dPair
open Vuna_dBool
open Vuna_dMonad
open Vuna_dMaybe
open Vuna_dList
type 'p0 t_Vuna_dIO_dIO
val v_Vuna_dIO_dpureIO : ('a1179) -> (('a1179) t_Vuna_dIO_dIO)
val v_Vuna_dIO_dbindIO : (('a1185) t_Vuna_dIO_dIO) -> ((('a1185) -> (('a1184) t_Vuna_dIO_dIO)) -> (('a1184) t_Vuna_dIO_dIO))
val v_Vuna_dIO_dfmapIO : (('a1197) -> ('a1196)) -> ((('a1197) t_Vuna_dIO_dIO) -> (('a1196) t_Vuna_dIO_dIO))
val v_Vuna_dIO_dprintIO : (string) -> ((int) t_Vuna_dIO_dIO)
val v_Vuna_dIO_dprintlnIO : (string) -> ((int) t_Vuna_dIO_dIO)
val v_Vuna_dIO_dreadFileIO : (string) -> ((string) t_Vuna_dIO_dIO)
val v_Vuna_dIO_dwriteFileIO : (string) -> ((string) -> ((int) t_Vuna_dIO_dIO))
val v_Vuna_dIO_dgetArgsIO : unit -> ((string) list) t_Vuna_dIO_dIO
val v_Vuna_dIO_dexitIO : (int) -> ((int) t_Vuna_dIO_dIO)
val v_vuna_uinst_ud_uVuna_uIO_uIO_ufmap : (('a34510) -> ('a34509)) -> ((('a34510) t_Vuna_dIO_dIO) -> (('a34509) t_Vuna_dIO_dIO))
val v_vuna_uinst_ud_uVuna_uIO_uIO_upure : ('a34517) -> (('a34517) t_Vuna_dIO_dIO)
val v_vuna_uinst_ud_uVuna_uIO_uIO_ubind : (('a34522) t_Vuna_dIO_dIO) -> ((('a34522) -> (('a34521) t_Vuna_dIO_dIO)) -> (('a34521) t_Vuna_dIO_dIO))
val show_Vuna_dIO_dIO : 'p0. ('p0 -> string) -> ('p0) t_Vuna_dIO_dIO -> string

val __vuna_run_io : ('a) t_Vuna_dIO_dIO -> ('a)
