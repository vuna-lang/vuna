open Vuna_runtime
open Vuna_dPair
open Vuna_dBool
open Vuna_dMonad
open Vuna_dMaybe
open Vuna_dList
type 'p0 t_Vuna_dIO_dIO
val v_Vuna_dIO_dprintIO : (string) -> ((int) t_Vuna_dIO_dIO)
val v_Vuna_dIO_dprintlnIO : (string) -> ((int) t_Vuna_dIO_dIO)
val v_Vuna_dIO_dreadFileIO : (string) -> ((string) t_Vuna_dIO_dIO)
val v_Vuna_dIO_dwriteFileIO : (string) -> ((string) -> ((int) t_Vuna_dIO_dIO))
val v_Vuna_dIO_dreadLineIO : unit -> (string) t_Vuna_dIO_dIO
val v_Vuna_dIO_dreadDirIO : (string) -> (((string) list) t_Vuna_dIO_dIO)
val v_Vuna_dIO_disDirectoryIO : (string) -> ((bool) t_Vuna_dIO_dIO)
val v_Vuna_dIO_dmakeDirIO : (string) -> ((int) t_Vuna_dIO_dIO)
val v_Vuna_dIO_dremoveFileIO : (string) -> ((int) t_Vuna_dIO_dIO)
val v_Vuna_dIO_dfileExistsIO : (string) -> ((bool) t_Vuna_dIO_dIO)
val v_Vuna_dIO_dgetArgsIO : unit -> ((string) list) t_Vuna_dIO_dIO
val v_Vuna_dIO_dexitIO : (int) -> ((int) t_Vuna_dIO_dIO)
val v_vuna_uinst_ud_uVuna_uIO_uIO_ufmap : (('a34545) -> ('a34544)) -> ((('a34545) t_Vuna_dIO_dIO) -> (('a34544) t_Vuna_dIO_dIO))
val v_vuna_uinst_ud_uVuna_uIO_uIO_upure : ('a34552) -> (('a34552) t_Vuna_dIO_dIO)
val v_vuna_uinst_ud_uVuna_uIO_uIO_ubind : (('a34557) t_Vuna_dIO_dIO) -> ((('a34557) -> (('a34556) t_Vuna_dIO_dIO)) -> (('a34556) t_Vuna_dIO_dIO))
val show_Vuna_dIO_dIO : 'p0. ('p0 -> string) -> ('p0) t_Vuna_dIO_dIO -> string

val __vuna_run_io : ('a) t_Vuna_dIO_dIO -> ('a)
