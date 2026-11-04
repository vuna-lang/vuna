open Vuna_runtime
open Base_dPair
open Base_dBool
open Base_dMonad
open Base_dMaybe
open Base_dEq
open Base_dOrd
open Base_dInt
open Base_dList
open Base_dResult
open Base_dString
open Base_dShow
open Prelude
open Vuna_dCompiler_dCommon
open Vuna_dCompiler_dFrontend_dToml
open Vuna_dCompiler_dFrontend_dManifest
type 'a0 t_Base_dIO_dIO = C_Base_dIO_dIO_Base_dIO_dMkIO of ((int) -> 'a0)

let v_Base_dIO_drunIO = (fun mc0 -> (match mc0 with
  | C_Base_dIO_dIO_Base_dIO_dMkIO (dtb__0) -> (dtb__0 0)
  | _ -> failwith "DT: impossible branch"
))

let v_Base_dIO_dioPure = (fun x -> (C_Base_dIO_dIO_Base_dIO_dMkIO ((fun w -> x))))

let v_Base_dIO_dioBind = (fun mc0 -> (fun mc1 -> (match mc0 with
  | C_Base_dIO_dIO_Base_dIO_dMkIO (dtb__1) -> (C_Base_dIO_dIO_Base_dIO_dMkIO ((fun w -> (match (mc1 (dtb__1 w)) with
  | C_Base_dIO_dIO_Base_dIO_dMkIO (dtb__2) -> (dtb__2 w)
  | _ -> failwith "DT: impossible branch"
))))
  | _ -> failwith "DT: impossible branch"
)))

let v_Monad_uBase_dIO_dIO = (C_Dict_uBase_dMonad_dMonad_MkDict_uBase_dMonad_dMonad ((fun io -> (fun k -> ((v_Base_dIO_dioBind io) k))), (fun x -> (v_Base_dIO_dioPure x))))

let v_Base_dIO_dioFmap = (fun mc0 -> (fun mc1 -> (match mc1 with
  | C_Base_dIO_dIO_Base_dIO_dMkIO (dtb__3) -> (C_Base_dIO_dIO_Base_dIO_dMkIO ((fun w -> (mc0 (dtb__3 w)))))
  | _ -> failwith "DT: impossible branch"
)))

let v_Functor_uBase_dIO_dIO = (C_Dict_uBase_dMonad_dFunctor_MkDict_uBase_dMonad_dFunctor ((fun f -> (fun io -> ((v_Base_dIO_dioFmap f) io)))))

let v_Base_dIO_dprint = (fun _uarity0 -> ((fun dtio_0 -> C_Base_dIO_dIO_Base_dIO_dMkIO (fun _ -> dtp_print dtio_0)) _uarity0))

let v_Base_dIO_dprintln = (fun s -> (v_Base_dIO_dprint ((bi_concat s) "\n")))

let v_Base_dIO_dreadFile = (fun _uarity0 -> ((fun dtio_0 -> C_Base_dIO_dIO_Base_dIO_dMkIO (fun _ -> dtp_readFile dtio_0)) _uarity0))

let v_Base_dIO_dwriteFile = (fun _uarity0 -> (fun _uarity1 -> (((fun dtio_0 dtio_1 -> C_Base_dIO_dIO_Base_dIO_dMkIO (fun _ -> dtp_writeFile dtio_0 dtio_1)) _uarity0) _uarity1)))

let v_Base_dIO_dreadLine = (C_Base_dIO_dIO_Base_dIO_dMkIO (fun _ -> (dtp_readLine ())))

let v_Base_dIO_dreadDir = (fun _uarity0 -> ((fun dtio_0 -> C_Base_dIO_dIO_Base_dIO_dMkIO (fun _ -> (fun p -> dtp_listOf (dtp_readDir p)) dtio_0)) _uarity0))

let v_Base_dIO_disDirectory = (fun _uarity0 -> ((fun dtio_0 -> C_Base_dIO_dIO_Base_dIO_dMkIO (fun _ -> dtp_isDirectory dtio_0)) _uarity0))

let v_Base_dIO_dmakeDir = (fun _uarity0 -> ((fun dtio_0 -> C_Base_dIO_dIO_Base_dIO_dMkIO (fun _ -> dtp_makeDir dtio_0)) _uarity0))

let v_Base_dIO_dremoveFile = (fun _uarity0 -> ((fun dtio_0 -> C_Base_dIO_dIO_Base_dIO_dMkIO (fun _ -> dtp_removeFile dtio_0)) _uarity0))

let v_Base_dIO_dfileExists = (fun _uarity0 -> ((fun dtio_0 -> C_Base_dIO_dIO_Base_dIO_dMkIO (fun _ -> dtp_fileExists dtio_0)) _uarity0))

let v_Base_dIO_dfileMtime = (fun _uarity0 -> ((fun dtio_0 -> C_Base_dIO_dIO_Base_dIO_dMkIO (fun _ -> dtp_fileMtime dtio_0)) _uarity0))

let v_Base_dIO_dfileSize = (fun _uarity0 -> ((fun dtio_0 -> C_Base_dIO_dIO_Base_dIO_dMkIO (fun _ -> dtp_fileSize dtio_0)) _uarity0))

let v_Base_dIO_dgetArgs = (C_Base_dIO_dIO_Base_dIO_dMkIO (fun _ -> (dtp_listOf (dtp_getArgs ()))))

let v_Base_dIO_dexit = (fun _uarity0 -> ((fun dtio_0 -> C_Base_dIO_dIO_Base_dIO_dMkIO (fun _ -> dtp_exit dtio_0)) _uarity0))
