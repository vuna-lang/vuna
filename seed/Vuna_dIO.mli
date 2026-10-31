open Vuna_runtime
open Vuna_dPair
open Vuna_dBool
open Vuna_dMonad
open Vuna_dMaybe
open Vuna_dList
type 'p0 t_Vuna_dIO_dIO
val v_Vuna_dIO_dprint : (string) -> ((int) t_Vuna_dIO_dIO)
val v_Vuna_dIO_dprintln : (string) -> ((int) t_Vuna_dIO_dIO)
val v_Vuna_dIO_dreadFile : (string) -> ((string) t_Vuna_dIO_dIO)
val v_Vuna_dIO_dwriteFile : (string) -> ((string) -> ((int) t_Vuna_dIO_dIO))
val v_Vuna_dIO_dreadLine : unit -> (string) t_Vuna_dIO_dIO
val v_Vuna_dIO_dreadDir : (string) -> (((string) list) t_Vuna_dIO_dIO)
val v_Vuna_dIO_disDirectory : (string) -> ((bool) t_Vuna_dIO_dIO)
val v_Vuna_dIO_dmakeDir : (string) -> ((int) t_Vuna_dIO_dIO)
val v_Vuna_dIO_dremoveFile : (string) -> ((int) t_Vuna_dIO_dIO)
val v_Vuna_dIO_dfileExists : (string) -> ((bool) t_Vuna_dIO_dIO)
val v_Vuna_dIO_dgetArgs : unit -> ((string) list) t_Vuna_dIO_dIO
val v_Vuna_dIO_dexit : (int) -> ((int) t_Vuna_dIO_dIO)
val v_vuna_uinst_ud_uVuna_uIO_uIO_ufmap : (('a32726) -> ('a32725)) -> ((('a32726) t_Vuna_dIO_dIO) -> (('a32725) t_Vuna_dIO_dIO))
val v_vuna_uinst_ud_uVuna_uIO_uIO_upure : ('a32733) -> (('a32733) t_Vuna_dIO_dIO)
val v_vuna_uinst_ud_uVuna_uIO_uIO_ubind : (('a32738) t_Vuna_dIO_dIO) -> ((('a32738) -> (('a32737) t_Vuna_dIO_dIO)) -> (('a32737) t_Vuna_dIO_dIO))
val show_Vuna_dIO_dIO : 'p0. ('p0 -> string) -> ('p0) t_Vuna_dIO_dIO -> string

val __vuna_run_io : ('a) t_Vuna_dIO_dIO -> ('a)
