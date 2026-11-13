let () = Printexc.record_backtrace true
open Vuna_runtime
let v_main = (try (((Base_dMonad.v_Base_dMonad_dbind Base_dEff.v_Monad_uBase_uEff_uEff_ur) (Base_dEffArgs.v_Base_dEffArgs_dargsGetArgs "default")) (fun args -> (((Base_dMonad.v_Base_dMonad_dbind Base_dEff.v_Monad_uBase_uEff_uEff_ur) (Vuna_dCompiler_dDriver_dCompilerCli.v_Vuna_dCompiler_dDriver_dCompilerCli_drunCompilerCli args)) (fun code -> ((Base_dEffExit.v_Base_dEffExit_dexitWith "default") code))))) with e -> dt_report_exn e (Printexc.get_raw_backtrace ()); exit 2)
let () =
  Printexc.record_backtrace true;
  try print_endline (string_of_int (dtp_sched_main (fun () -> Base_dEff.v_Base_dEff_drunMain (Base_dEffArgs.v_Base_dEffArgs_drunArgsHost (Base_dEffStdin.v_Base_dEffStdin_drunStdinHost (Base_dEffExit.v_Base_dEffExit_drunExitHost (Base_dEffProcess.v_Base_dEffProcess_drunProcessHost (Base_dEffEnv.v_Base_dEffEnv_drunEnvHost (Base_dEffClock.v_Base_dEffClock_drunClockHost (Base_dEffConsole.v_Base_dEffConsole_drunConsoleHost (Base_dEffFs.v_Base_dEffFs_drunFsHost v_main)))))))))))
  with e -> dt_report_exn e (Printexc.get_raw_backtrace ()); exit 2
