open Vuna_runtime
open Base_dPair
open Base_dBool
open Base_dMonad
open Base_dMaybe
open Base_dList
type   'p0 t_Base_dIO_dIO =
    C_Base_dIO_dMkIO of ((int) -> ('p0))
let show_Base_dIO_dIO : 'p0. ('p0 -> string) -> ('p0) t_Base_dIO_dIO -> string = fun s0 v -> match v with
  | C_Base_dIO_dMkIO f0 -> show_ctor "MkIO" [((fun _ -> "<function>")) f0]
let v_Base_dIO_dioPure = fun x -> C_Base_dIO_dMkIO (fun w -> x)

let v_Base_dIO_dioBind = fun a0 a1 -> match (a0, a1) with
  | (C_Base_dIO_dMkIO (f), k) -> C_Base_dIO_dMkIO (fun w -> (match k (f w) with
  | C_Base_dIO_dMkIO (g) -> g w
  | _ -> vuna_fail "base/lib/Base/IO.vuna" 21 33 ("case pattern match failure")))
  | _ -> vuna_fail "base/lib/Base/IO.vuna" 21 1 ("no matching clause for Base.IO.ioBind")

let v_Base_dIO_dioFmap = fun a0 a1 -> match (a0, a1) with
  | (f, C_Base_dIO_dMkIO (g)) -> C_Base_dIO_dMkIO (fun w -> f (g w))
  | _ -> vuna_fail "base/lib/Base/IO.vuna" 26 1 ("no matching clause for Base.IO.ioFmap")

let v_Base_dIO_dprint = fun s -> C_Base_dIO_dMkIO (fun w -> bi_print s)

let v_Base_dIO_dprintln = fun s -> v_Base_dIO_dprint (((s) ^ ("\n")))

let v_Base_dIO_dreadFile = fun path -> C_Base_dIO_dMkIO (fun w -> bi_read_file path)

let v_Base_dIO_dwriteFile = fun path contents -> C_Base_dIO_dMkIO (fun w -> bi_write_file path contents)

let v_Base_dIO_dreadLine = fun () -> C_Base_dIO_dMkIO (fun w -> bi_read_line ())

let v_Base_dIO_dreadDir = fun path -> C_Base_dIO_dMkIO (fun w -> bi_read_dir path)

let v_Base_dIO_disDirectory = fun path -> C_Base_dIO_dMkIO (fun w -> bi_is_directory path)

let v_Base_dIO_dmakeDir = fun path -> C_Base_dIO_dMkIO (fun w -> bi_make_dir path)

let v_Base_dIO_dremoveFile = fun path -> C_Base_dIO_dMkIO (fun w -> bi_remove_file path)

let v_Base_dIO_dfileExists = fun path -> C_Base_dIO_dMkIO (fun w -> bi_file_exists path)

let v_Base_dIO_dfileMtime = fun path -> C_Base_dIO_dMkIO (fun w -> bi_file_mtime path)

let v_Base_dIO_dfileSize = fun path -> C_Base_dIO_dMkIO (fun w -> bi_file_size path)

let v_Base_dIO_dgetArgs = fun () -> C_Base_dIO_dMkIO (fun w -> bi_get_args ())

let v_Base_dIO_dexit = fun code -> C_Base_dIO_dMkIO (fun w -> bi_exit code)

let v_vuna_uinst_ud_uBase_uIO_uIO_ufmap = fun f io -> v_Base_dIO_dioFmap f io

let v_vuna_uinst_ud_uBase_uIO_uIO_upure = fun x -> v_Base_dIO_dioPure x

let v_vuna_uinst_ud_uBase_uIO_uIO_ubind = fun io k -> v_Base_dIO_dioBind io k

let __vuna_run_io (C_Base_dIO_dMkIO f) = f 0
