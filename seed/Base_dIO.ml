open Vuna_runtime
let v_Functor_uIO = (Base_dMonad.C_Dict_uBase_dMonad_dFunctor_MkDict_uBase_dMonad_dFunctor ((fun f io -> (((fun io k -> fun (w : int) -> k (io w) w) io) (fun x -> ((fun x -> fun (_ : int) -> x) (f x)))))))

let v_Monad_uIO = (Base_dMonad.C_Dict_uBase_dMonad_dMonad_MkDict_uBase_dMonad_dMonad ((fun io k -> (((fun io k -> fun (w : int) -> k (io w) w) io) k)), (fun x -> ((fun x -> fun (_ : int) -> x) x))))

let v_Base_dIO_drunIO = (fun _uarity1 -> ((fun io -> io 0) _uarity1))

let v_Base_dIO_dprint = (fun _uarity0 -> ((fun dtio_0 -> fun (_ : int) -> dtp_print dtio_0) _uarity0))

let v_Base_dIO_dprintln = (fun s -> (v_Base_dIO_dprint (s ^ "\n")))

let v_Base_dIO_dreadFile = (fun _uarity0 -> ((fun dtio_0 -> fun (_ : int) -> dtp_readFile dtio_0) _uarity0))

let v_Base_dIO_dwriteFile = (fun _uarity0 _uarity1 -> (((fun dtio_0 dtio_1 -> fun (_ : int) -> dtp_writeFile dtio_0 dtio_1) _uarity0) _uarity1))

let v_Base_dIO_dreadLine = (fun (_ : int) -> (dtp_readLine ()))

let v_Base_dIO_dreadBytes = (fun n -> ((fun dtio_0 -> fun (_ : int) -> dtp_readBytes dtio_0) n))

let v_Base_dIO_dreadDir = (fun _uarity0 -> ((fun dtio_0 -> fun (_ : int) -> (fun p -> Base_dList.dtp_listOf (dtp_readDir p)) dtio_0) _uarity0))

let v_Base_dIO_disDirectory = (fun _uarity0 -> ((fun dtio_0 -> fun (_ : int) -> dtp_isDirectory dtio_0) _uarity0))

let v_Base_dIO_dmakeDir = (fun _uarity0 -> ((fun dtio_0 -> fun (_ : int) -> dtp_makeDir dtio_0) _uarity0))

let v_Base_dIO_dremoveFile = (fun _uarity0 -> ((fun dtio_0 -> fun (_ : int) -> dtp_removeFile dtio_0) _uarity0))

let v_Base_dIO_dfileExists = (fun _uarity0 -> ((fun dtio_0 -> fun (_ : int) -> dtp_fileExists dtio_0) _uarity0))

let v_Base_dIO_dfileMtime = (fun _uarity0 -> ((fun dtio_0 -> fun (_ : int) -> dtp_fileMtime dtio_0) _uarity0))

let v_Base_dIO_dfileSize = (fun path -> (((Base_dMonad.v_Base_dMonad_dfmap v_Functor_uIO) bi_natFromInt) ((fun dtio_0 -> fun (_ : int) -> dtp_fileSize dtio_0) path)))

let v_Base_dIO_dgetArgs = (fun (_ : int) -> (Base_dList.dtp_listOf (dtp_getArgs ())))

let v_Base_dIO_dexit = (fun _uarity0 -> ((fun dtio_0 -> fun (_ : int) -> dtp_exit dtio_0) _uarity0))
