let () = Printexc.record_backtrace true
open Vuna_runtime
# 43 "app/Main.vuna"
let v_main = (try (((B_dTrait_dMonad.v__x62__x62__x61_ B_dEffect_dCore.v_Monad_uBase_uEffect_uCore_uEff_ur) (B_dEffect_dArgs.v_argsGetArgs "default")) (fun args -> (((B_dTrait_dMonad.v__x62__x62__x61_ B_dEffect_dCore.v_Monad_uBase_uEffect_uCore_uEff_ur) ((((((((Driver_dCompilerCli.v_runCompilerCli "default") "default") "default") "default") "default") "default") "default") args)) (fun code -> ((B_dEffect_dExit.v_exitWith "default") code))))) with e -> dt_report_exn e (Printexc.get_raw_backtrace ()); exit 2)
let () =
  Printexc.record_backtrace true;
  try print_endline (string_of_int (dtp_sched_main (fun () -> B_dEffect_dCore.v_runMain (B_dEffect_dProcess.v_runProcessErrorHost (B_dEffect_dFs.v_runFsErrorHost (B_dEffect_dArgs.v_runArgsHost (B_dEffect_dExit.v_runExitHost (B_dEffect_dProcess.v_runProcessHost (B_dEffect_dEnv.v_runEnvHost (B_dEffect_dClock.v_runClockHost (B_dEffect_dConsole.v_runConsoleHost (B_dEffect_dFs.v_runFsHost v_main))))))))))))
  with e -> dt_report_exn e (Printexc.get_raw_backtrace ()); exit 2
