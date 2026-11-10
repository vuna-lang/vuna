open Vuna_runtime
let v_Base_dIO_dHost_drunIO = (fun _uarity1 -> ((fun io -> io 0) _uarity1))

let v_Base_dIO_dHost_dprint = (fun s -> (((Base_dMonad.v_Base_dMonad_dfmap Base_dIO.v_Functor_uIO) bi_natFromInt) ((fun dtio_0 -> fun (_ : int) -> dtp_print dtio_0) s)))

let v_Base_dIO_dHost_deprint = (fun _uarity0 -> ((fun dtio_0 -> fun (_ : int) -> (fun s -> prerr_string s; flush stderr; String.length s) dtio_0) _uarity0))

let v_Base_dIO_dHost_dprintln = (fun s -> (v_Base_dIO_dHost_dprint (s ^ "\n")))

let v_Base_dIO_dHost_dreadFile = (fun _uarity0 -> ((fun dtio_0 -> fun (_ : int) -> dtp_readFile dtio_0) _uarity0))

let v_Base_dIO_dHost_dwriteFile = (fun path s -> (((Base_dMonad.v_Base_dMonad_dfmap Base_dIO.v_Functor_uIO) bi_natFromInt) (((fun dtio_0 dtio_1 -> fun (_ : int) -> dtp_writeFile dtio_0 dtio_1) path) s)))

let v_Base_dIO_dHost_dreadLine = (fun (_ : int) -> (dtp_readLine ()))

let v_Base_dIO_dHost_dreadBytes = (fun n -> ((fun dtio_0 -> fun (_ : int) -> dtp_readBytes dtio_0) n))

let v_Base_dIO_dHost_dreadDir = (fun _uarity0 -> ((fun dtio_0 -> fun (_ : int) -> (fun p -> Base_dList.dtp_listOf (dtp_readDir p)) dtio_0) _uarity0))

let v_Base_dIO_dHost_disDirectory = (fun _uarity0 -> ((fun dtio_0 -> fun (_ : int) -> dtp_isDirectory dtio_0) _uarity0))

let v_Base_dIO_dHost_dmakeDir = (fun _uarity0 -> ((fun dtio_0 -> fun (_ : int) -> dtp_makeDir dtio_0) _uarity0))

let v_Base_dIO_dHost_dremoveFile = (fun _uarity0 -> ((fun dtio_0 -> fun (_ : int) -> dtp_removeFile dtio_0) _uarity0))

let v_Base_dIO_dHost_dfileExists = (fun _uarity0 -> ((fun dtio_0 -> fun (_ : int) -> dtp_fileExists dtio_0) _uarity0))

let v_Base_dIO_dHost_dfileMtime = (fun _uarity0 -> ((fun dtio_0 -> fun (_ : int) -> dtp_fileMtime dtio_0) _uarity0))

let v_Base_dIO_dHost_dfileSize = (fun path -> (((Base_dMonad.v_Base_dMonad_dfmap Base_dIO.v_Functor_uIO) bi_natFromInt) ((fun dtio_0 -> fun (_ : int) -> dtp_fileSize dtio_0) path)))

let v_Base_dIO_dHost_dgetArgs = (fun (_ : int) -> (Base_dList.dtp_listOf (dtp_getArgs ())))

let v_Base_dIO_dHost_dgetEnv = (fun _uarity0 -> ((fun dtio_0 -> fun (_ : int) -> dtp_getenv dtio_0) _uarity0))

let v_Base_dIO_dHost_dgetCwd = (fun (_ : int) -> (dtp_getcwd ()))

let v_Base_dIO_dHost_dexecPath = (fun (_ : int) -> (dtp_execPath ()))

let v_Base_dIO_dHost_dexit = (fun _uarity0 -> ((fun dtio_0 -> fun (_ : int) -> dtp_exit dtio_0) _uarity0))

let v_Base_dIO_dHost_dnowMicros = (fun (_ : int) -> (dtp_timeUs ()))

let v_Base_dIO_dHost_dsleepMicros = (fun us -> (if (us <= 0) then ((fun x -> fun (_ : int) -> x) 0) else ((fun dtio_0 -> fun (_ : int) -> dtp_sleep dtio_0) us)))
