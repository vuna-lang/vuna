let () = Printexc.record_backtrace true
open Vuna_runtime
let v_main = (try (((Base_dMonad.v_Base_dMonad_dbind Base_dIO.v_Monad_uIO) Base_dIO.v_Base_dIO_dgetArgs) (fun args -> (((Base_dMonad.v_Base_dMonad_dbind Base_dIO.v_Monad_uIO) ((Base_dApplicative.v_Base_dApplicative_dpure Base_dIO.v_Applicative_uIO) (Vuna_dCompiler_dDriver_dCompilerCli.v_Vuna_dCompiler_dDriver_dCompilerCli_drunCompilerCli args))) (fun code -> (Base_dIO.v_Base_dIO_dexit code))))) with e -> dt_report_exn e (Printexc.get_raw_backtrace ()); exit 2)
let () =
  Printexc.record_backtrace true;
  try print_endline (string_of_int (dtp_sched_main (fun () -> v_main 0)))
  with e -> dt_report_exn e (Printexc.get_raw_backtrace ()); exit 2
