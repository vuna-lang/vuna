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
val v_Base_dIO_dgetArgs : unit -> ((string) list) t_Base_dIO_dIO
val v_Base_dIO_dexit : (int) -> ((int) t_Base_dIO_dIO)
val v_vuna_uinst_ud_uBase_uIO_uIO_ufmap : (('a37958) -> ('a37957)) -> ((('a37958) t_Base_dIO_dIO) -> (('a37957) t_Base_dIO_dIO))
val v_vuna_uinst_ud_uBase_uIO_uIO_upure : ('a37965) -> (('a37965) t_Base_dIO_dIO)
val v_vuna_uinst_ud_uBase_uIO_uIO_ubind : (('a37970) t_Base_dIO_dIO) -> ((('a37970) -> (('a37969) t_Base_dIO_dIO)) -> (('a37969) t_Base_dIO_dIO))
val show_Base_dIO_dIO : 'p0. ('p0 -> string) -> ('p0) t_Base_dIO_dIO -> string

val __vuna_run_io : ('a) t_Base_dIO_dIO -> ('a)
