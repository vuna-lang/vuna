let () = Printexc.record_backtrace true
open Vuna_runtime
let v_main = (try (((Base_dMonad.v_Base_dMonad_dbind Base_dEff.v_Monad_uBase_uEff_uEff_ur) (Base_dEffArgs.v_Base_dEffArgs_dargsGetArgs "default")) (fun args -> (((Base_dMonad.v_Base_dMonad_dbind Base_dEff.v_Monad_uBase_uEff_uEff_ur) (Base_dEff.v_Base_dEff_draise (Vuna_dCompiler_dDriver_dCompilerCli.v_Vuna_dCompiler_dDriver_dCompilerCli_drunCompilerCli args))) (fun code -> ((Base_dEffExit.v_Base_dEffExit_dexitWith "default") code))))) with e -> dt_report_exn e (Printexc.get_raw_backtrace ()); exit 2)
let () =
  Printexc.record_backtrace true;
  try print_endline (string_of_int (dtp_sched_main (fun () -> Base_dEff.v_Base_dEff_drunMain (Base_dEffExit.v_Base_dEffExit_drunExitHost (Base_dEffArgs.v_Base_dEffArgs_drunArgsHost v_main)))))
  with e -> dt_report_exn e (Printexc.get_raw_backtrace ()); exit 2
