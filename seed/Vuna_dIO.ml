open Vuna_runtime
open Vuna_dPair
open Vuna_dBool
open Vuna_dMonad
open Vuna_dMaybe
open Vuna_dList
type   'p0 t_Vuna_dIO_dIO =
    C_Vuna_dIO_dMkIO of ((int) -> ('p0))
let show_Vuna_dIO_dIO : 'p0. ('p0 -> string) -> ('p0) t_Vuna_dIO_dIO -> string = fun s0 v -> match v with
  | C_Vuna_dIO_dMkIO f0 -> show_ctor "MkIO" [((fun _ -> "<function>")) f0]
let v_Vuna_dIO_dioPure = fun x -> C_Vuna_dIO_dMkIO (fun w -> x)

let v_Vuna_dIO_dioBind = fun a0 a1 -> match (a0, a1) with
  | (C_Vuna_dIO_dMkIO (f), k) -> C_Vuna_dIO_dMkIO (fun w -> (match k (f w) with
  | C_Vuna_dIO_dMkIO (g) -> g w
  | _ -> vuna_fail "stdlib/lib/Vuna/IO.vuna" 24 15 ("case pattern match failure")))
  | _ -> vuna_fail "stdlib/lib/Vuna/IO.vuna" 23 1 ("no matching clause for Vuna.IO.ioBind")

let v_Vuna_dIO_dioFmap = fun a0 a1 -> match (a0, a1) with
  | (f, C_Vuna_dIO_dMkIO (g)) -> C_Vuna_dIO_dMkIO (fun w -> f (g w))
  | _ -> vuna_fail "stdlib/lib/Vuna/IO.vuna" 28 1 ("no matching clause for Vuna.IO.ioFmap")

let v_Vuna_dIO_dprint = fun s -> C_Vuna_dIO_dMkIO (fun w -> bi_print s)

let v_Vuna_dIO_dprintln = fun s -> v_Vuna_dIO_dprint (((s) ^ ("\n")))

let v_Vuna_dIO_dreadFile = fun path -> C_Vuna_dIO_dMkIO (fun w -> bi_read_file path)

let v_Vuna_dIO_dwriteFile = fun path contents -> C_Vuna_dIO_dMkIO (fun w -> bi_write_file path contents)

let v_Vuna_dIO_dreadLine = fun () -> C_Vuna_dIO_dMkIO (fun w -> bi_read_line ())

let v_Vuna_dIO_dreadDir = fun path -> C_Vuna_dIO_dMkIO (fun w -> bi_read_dir path)

let v_Vuna_dIO_disDirectory = fun path -> C_Vuna_dIO_dMkIO (fun w -> bi_is_directory path)

let v_Vuna_dIO_dmakeDir = fun path -> C_Vuna_dIO_dMkIO (fun w -> bi_make_dir path)

let v_Vuna_dIO_dremoveFile = fun path -> C_Vuna_dIO_dMkIO (fun w -> bi_remove_file path)

let v_Vuna_dIO_dfileExists = fun path -> C_Vuna_dIO_dMkIO (fun w -> bi_file_exists path)

let v_Vuna_dIO_dgetArgs = fun () -> C_Vuna_dIO_dMkIO (fun w -> bi_get_args ())

let v_Vuna_dIO_dexit = fun code -> C_Vuna_dIO_dMkIO (fun w -> bi_exit code)

let v_vuna_uinst_ud_uVuna_uIO_uIO_ufmap = fun f io -> v_Vuna_dIO_dioFmap f io

let v_vuna_uinst_ud_uVuna_uIO_uIO_upure = fun x -> v_Vuna_dIO_dioPure x

let v_vuna_uinst_ud_uVuna_uIO_uIO_ubind = fun io k -> v_Vuna_dIO_dioBind io k

let __vuna_run_io (C_Vuna_dIO_dMkIO f) = f 0
