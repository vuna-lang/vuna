open Vuna_runtime
open Base_dPair
open Base_dBool
open Base_dMonad
open Base_dMaybe
open Base_dList
type 'p0 t_Base_dIO_dIO
val v_Base_dIO_dprint : (string) -> ((int) t_Base_dIO_dIO)
val v_Base_dIO_dprintln : (string) -> ((int) t_Base_dIO_dIO)
val v_Base_dIO_dreadFile : (string) -> ((string) t_Base_dIO_dIO)
val v_Base_dIO_dwriteFile : (string) -> ((string) -> ((int) t_Base_dIO_dIO))
val v_Base_dIO_dreadLine : unit -> (string) t_Base_dIO_dIO
val v_Base_dIO_dreadDir : (string) -> (((string) list) t_Base_dIO_dIO)
val v_Base_dIO_disDirectory : (string) -> ((bool) t_Base_dIO_dIO)
val v_Base_dIO_dmakeDir : (string) -> ((int) t_Base_dIO_dIO)
val v_Base_dIO_dremoveFile : (string) -> ((int) t_Base_dIO_dIO)
val v_Base_dIO_dfileExists : (string) -> ((bool) t_Base_dIO_dIO)
val v_Base_dIO_dfileMtime : (string) -> ((int) t_Base_dIO_dIO)
val v_Base_dIO_dfileSize : (string) -> ((int) t_Base_dIO_dIO)
val v_Base_dIO_dgetArgs : unit -> ((string) list) t_Base_dIO_dIO
val v_Base_dIO_dexit : (int) -> ((int) t_Base_dIO_dIO)
val v_vuna_uinst_ud_uBase_uIO_uIO_ufmap : (('a50367) -> ('a50366)) -> ((('a50367) t_Base_dIO_dIO) -> (('a50366) t_Base_dIO_dIO))
val v_vuna_uinst_ud_uBase_uIO_uIO_upure : ('a50374) -> (('a50374) t_Base_dIO_dIO)
val v_vuna_uinst_ud_uBase_uIO_uIO_ubind : (('a50379) t_Base_dIO_dIO) -> ((('a50379) -> (('a50378) t_Base_dIO_dIO)) -> (('a50378) t_Base_dIO_dIO))
val show_Base_dIO_dIO : 'p0. ('p0 -> string) -> ('p0) t_Base_dIO_dIO -> string

val __vuna_run_io : ('a) t_Base_dIO_dIO -> ('a)
