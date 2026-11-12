let () = Printexc.record_backtrace true
open Vuna_runtime
let v_main = (try (((Base_dMonad.v_Base_dMonad_dbind Base_dEff.v_Monad_uBase_uEff_uEff_ur) (Base_dEff.C_Base_dEff_dEff_MkEff (fun (_ : Base_dEff.t_Base_dEff_dEffUnit) -> (Base_dList.dtp_listOf (dtp_getArgs ()))))) (fun args -> (((Base_dMonad.v_Base_dMonad_dbind Base_dEff.v_Monad_uBase_uEff_uEff_ur) (Vuna_dCompiler_dDriver_dCompilerCli.v_Vuna_dCompiler_dDriver_dCompilerCli_drunCompilerCli args)) (fun code -> ((fun dtio_0 -> Base_dEff.C_Base_dEff_dEff_MkEff (fun (_ : Base_dEff.t_Base_dEff_dEffUnit) -> dtp_exit dtio_0)) code))))) with e -> dt_report_exn e (Printexc.get_raw_backtrace ()); exit 2)
let () =
  Printexc.record_backtrace true;
  try print_endline (string_of_int (dtp_sched_main (fun () -> Base_dEff.v_Base_dEff_drunMain v_main)))
  with e -> dt_report_exn e (Printexc.get_raw_backtrace ()); exit 2
