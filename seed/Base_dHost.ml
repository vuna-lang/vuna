open Vuna_runtime
let v_Base_dHost_dprint = (fun s -> (((Base_dMonad.v_Base_dMonad_dfmap Base_dEff.v_Functor_uBase_uEff_uEff_ur) bi_natFromInt) ((fun dtio_0 -> Base_dEff.C_Base_dEff_dEff_MkEff (fun (_ : Base_dEff.t_Base_dEff_dEffUnit) -> dtp_print dtio_0)) s)))

let v_Base_dHost_deprint = (fun _uarity0 -> ((fun dtio_0 -> Base_dEff.C_Base_dEff_dEff_MkEff (fun (_ : Base_dEff.t_Base_dEff_dEffUnit) -> (fun s -> prerr_string s; flush stderr; String.length s) dtio_0)) _uarity0))

let v_Base_dHost_dprintln = (fun s -> (v_Base_dHost_dprint (s ^ "\n")))

let v_Base_dHost_dreadFile = (fun _uarity0 -> ((fun dtio_0 -> Base_dEff.C_Base_dEff_dEff_MkEff (fun (_ : Base_dEff.t_Base_dEff_dEffUnit) -> dtp_readFile dtio_0)) _uarity0))

let v_Base_dHost_dwriteFile = (fun path s -> (((Base_dMonad.v_Base_dMonad_dfmap Base_dEff.v_Functor_uBase_uEff_uEff_ur) bi_natFromInt) (((fun dtio_0 dtio_1 -> Base_dEff.C_Base_dEff_dEff_MkEff (fun (_ : Base_dEff.t_Base_dEff_dEffUnit) -> dtp_writeFile dtio_0 dtio_1)) path) s)))

let v_Base_dHost_dwriteFileAtomic = (fun _uarity0 _uarity1 -> (((fun dtio_0 dtio_1 -> Base_dEff.C_Base_dEff_dEff_MkEff (fun (_ : Base_dEff.t_Base_dEff_dEffUnit) -> dtp_writeFileAtomic dtio_0 dtio_1)) _uarity0) _uarity1))

let v_Base_dHost_dreadLine = (Base_dEff.C_Base_dEff_dEff_MkEff (fun (_ : Base_dEff.t_Base_dEff_dEffUnit) -> (dtp_readLine ())))

let v_Base_dHost_dreadBytes = (fun n -> ((fun dtio_0 -> Base_dEff.C_Base_dEff_dEff_MkEff (fun (_ : Base_dEff.t_Base_dEff_dEffUnit) -> dtp_readBytes dtio_0)) n))

let v_Base_dHost_dreadDir = (fun _uarity0 -> ((fun dtio_0 -> Base_dEff.C_Base_dEff_dEff_MkEff (fun (_ : Base_dEff.t_Base_dEff_dEffUnit) -> (fun p -> Base_dList.dtp_listOf (dtp_readDir p)) dtio_0)) _uarity0))

let v_Base_dHost_disDirectory = (fun _uarity0 -> ((fun dtio_0 -> Base_dEff.C_Base_dEff_dEff_MkEff (fun (_ : Base_dEff.t_Base_dEff_dEffUnit) -> dtp_isDirectory dtio_0)) _uarity0))

let v_Base_dHost_dmakeDir = (fun _uarity0 -> ((fun dtio_0 -> Base_dEff.C_Base_dEff_dEff_MkEff (fun (_ : Base_dEff.t_Base_dEff_dEffUnit) -> dtp_makeDir dtio_0)) _uarity0))

let v_Base_dHost_dremoveFile = (fun _uarity0 -> ((fun dtio_0 -> Base_dEff.C_Base_dEff_dEff_MkEff (fun (_ : Base_dEff.t_Base_dEff_dEffUnit) -> dtp_removeFile dtio_0)) _uarity0))

let v_Base_dHost_dfileExists = (fun _uarity0 -> ((fun dtio_0 -> Base_dEff.C_Base_dEff_dEff_MkEff (fun (_ : Base_dEff.t_Base_dEff_dEffUnit) -> dtp_fileExists dtio_0)) _uarity0))

let v_Base_dHost_dfileMtime = (fun _uarity0 -> ((fun dtio_0 -> Base_dEff.C_Base_dEff_dEff_MkEff (fun (_ : Base_dEff.t_Base_dEff_dEffUnit) -> dtp_fileMtime dtio_0)) _uarity0))

let v_Base_dHost_dfileSize = (fun path -> (((Base_dMonad.v_Base_dMonad_dfmap Base_dEff.v_Functor_uBase_uEff_uEff_ur) bi_natFromInt) ((fun dtio_0 -> Base_dEff.C_Base_dEff_dEff_MkEff (fun (_ : Base_dEff.t_Base_dEff_dEffUnit) -> dtp_fileSize dtio_0)) path)))

let v_Base_dHost_dgetArgs = (Base_dEff.C_Base_dEff_dEff_MkEff (fun (_ : Base_dEff.t_Base_dEff_dEffUnit) -> (Base_dList.dtp_listOf (dtp_getArgs ()))))

let v_Base_dHost_dgetEnv = (fun _uarity0 -> ((fun dtio_0 -> Base_dEff.C_Base_dEff_dEff_MkEff (fun (_ : Base_dEff.t_Base_dEff_dEffUnit) -> dtp_getenv dtio_0)) _uarity0))

let v_Base_dHost_dgetCwd = (Base_dEff.C_Base_dEff_dEff_MkEff (fun (_ : Base_dEff.t_Base_dEff_dEffUnit) -> (dtp_getcwd ())))

let v_Base_dHost_dexecPath = (Base_dEff.C_Base_dEff_dEff_MkEff (fun (_ : Base_dEff.t_Base_dEff_dEffUnit) -> (dtp_execPath ())))

let v_Base_dHost_dexit = (fun _uarity0 -> ((fun dtio_0 -> Base_dEff.C_Base_dEff_dEff_MkEff (fun (_ : Base_dEff.t_Base_dEff_dEffUnit) -> dtp_exit dtio_0)) _uarity0))

let v_Base_dHost_drunIn = (fun _uarity0 _uarity1 -> (((fun dtio_0 dtio_1 -> Base_dEff.C_Base_dEff_dEff_MkEff (fun (_ : Base_dEff.t_Base_dEff_dEffUnit) -> (fun dir args -> dtp_runIn dir (Base_dList.dtp_ocamlOf args)) dtio_0 dtio_1)) _uarity0) _uarity1))

let v_Base_dHost_dnowMicros = (Base_dEff.C_Base_dEff_dEff_MkEff (fun (_ : Base_dEff.t_Base_dEff_dEffUnit) -> (dtp_timeUs ())))

let v_Base_dHost_dsleepMicros = (fun us -> (if (us <= 0) then ((Base_dApplicative.v_Base_dApplicative_dpure Base_dEff.v_Applicative_uBase_uEff_uEff_ur) 0) else ((fun dtio_0 -> Base_dEff.C_Base_dEff_dEff_MkEff (fun (_ : Base_dEff.t_Base_dEff_dEffUnit) -> dtp_sleep dtio_0)) us)))
