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
let v_Vuna_dIO_dpureIO = fun x -> C_Vuna_dIO_dMkIO (fun w -> x)

let v_Vuna_dIO_dbindIO = fun a0 a1 -> match (a0, a1) with
  | (C_Vuna_dIO_dMkIO (f), k) -> C_Vuna_dIO_dMkIO (fun w -> (match k (f w) with
  | C_Vuna_dIO_dMkIO (g) -> g w
  | _ -> vuna_fail "stdlib/lib/Vuna/IO.vuna" 20 15 ("case pattern match failure")))
  | _ -> vuna_fail "stdlib/lib/Vuna/IO.vuna" 19 1 ("no matching clause for Vuna.IO.bindIO")

let v_Vuna_dIO_dfmapIO = fun a0 a1 -> match (a0, a1) with
  | (f, C_Vuna_dIO_dMkIO (g)) -> C_Vuna_dIO_dMkIO (fun w -> f (g w))
  | _ -> vuna_fail "stdlib/lib/Vuna/IO.vuna" 24 1 ("no matching clause for Vuna.IO.fmapIO")

let v_Vuna_dIO_dprintIO = fun s -> C_Vuna_dIO_dMkIO (fun w -> bi_print s)

let v_Vuna_dIO_dprintlnIO = fun s -> v_Vuna_dIO_dprintIO (((s) ^ ("\n")))

let v_Vuna_dIO_dreadFileIO = fun path -> C_Vuna_dIO_dMkIO (fun w -> bi_read_file path)

let v_Vuna_dIO_dwriteFileIO = fun path contents -> C_Vuna_dIO_dMkIO (fun w -> bi_write_file path contents)

let v_Vuna_dIO_dgetArgsIO = fun () -> C_Vuna_dIO_dMkIO (fun w -> bi_get_args ())

let v_Vuna_dIO_dexitIO = fun code -> C_Vuna_dIO_dMkIO (fun w -> bi_exit code)

let v_vuna_uinst_ud_uVuna_uIO_uIO_ufmap = fun f io -> v_Vuna_dIO_dfmapIO f io

let v_vuna_uinst_ud_uVuna_uIO_uIO_upure = fun x -> v_Vuna_dIO_dpureIO x

let v_vuna_uinst_ud_uVuna_uIO_uIO_ubind = fun io k -> v_Vuna_dIO_dbindIO io k

let __vuna_run_io (C_Vuna_dIO_dMkIO f) = f 0
