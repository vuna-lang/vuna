open Vuna_runtime
let () = dt_record_backtrace true
open Vuna_runtime
# 68 "app/Main.vuna"
let v_sampleWanted = (fun (nEnv : string) -> (((fun e k -> Obj.repr ((fun (u : B_dEffect_dCore.t_EffUnit) -> (let dtb__0 = Obj.obj (e) in (let dtb__1 = Obj.obj ((k (dtb__0 u))) in (dtb__1 u)))))) ((B_dEffect_dEnv.v_envGetEnv nEnv) "VUNA_OBS_SAMPLE")) (fun mode -> (let x = (if (mode = "") then false else true) in Obj.repr ((fun (_u : B_dEffect_dCore.t_EffUnit) -> x))))))

# 76 "app/Main.vuna"
let v_describeText = (String.concat "" ["vuna-plugin\t1\tcli\tcompiler\n"; "cmd\tcheck\tcore\tyes\tyes\t\230\163\128\230\159\165\229\140\133\230\136\150\230\150\135\228\187\182\231\154\132\231\177\187\229\158\139\tvuna check (<file.vuna> | <package-dir>)\n"; "cmd\tbuild\tcore\tyes\tyes\t\230\158\132\229\187\186\229\140\133\231\154\132\229\143\175\230\137\167\232\161\140\229\133\165\229\143\163\tvuna build [--out DIR] [--package NAME] [--target ocaml|wasm|native] [DIR]\n"; "cmd\tcompile\tcore\tyes\tyes\t\231\188\150\232\175\145\229\140\133\230\136\150\229\133\165\229\143\163\230\150\135\228\187\182\229\136\176\232\190\147\229\135\186\231\155\174\229\189\149\tvuna compile (<entry.vuna> | <package-dir>) <out-dir>\n"])

# 54 "app/Main.vuna"
let v_runMain = (fun (args : string B_dData_dList.t_List) -> (let nd_uscrut1 = args in (match nd_uscrut1 with
  | B_dData_dList.C_List__x58__x58_ (dtb__2, dtb__3) -> (if (dtb__2 = "--vuna-describe") then (match dtb__3 with
  | B_dData_dList.C_List__x58__x58_ (dtb__4, dtb__5) -> (((fun e k -> Obj.repr ((fun (u : B_dEffect_dCore.t_EffUnit) -> (let dtb__6 = Obj.obj (e) in (let dtb__7 = Obj.obj ((k (dtb__6 u))) in (dtb__7 u)))))) (((B_dEffect_dFs.v_fsWriteFileAtomic "default") dtb__4) v_describeText)) (fun _u -> (let x = 0 in Obj.repr ((fun (_u : B_dEffect_dCore.t_EffUnit) -> x)))))
  | B_dData_dList.C_List_Nil -> (((fun e k -> Obj.repr ((fun (u : B_dEffect_dCore.t_EffUnit) -> (let dtb__8 = Obj.obj (e) in (let dtb__9 = Obj.obj ((k (dtb__8 u))) in (dtb__9 u)))))) ((B_dEffect_dConsole.v_consolePrint "default") v_describeText)) (fun _u -> (let x = 0 in Obj.repr ((fun (_u : B_dEffect_dCore.t_EffUnit) -> x)))))
  | _ -> failwith "DT: impossible branch"
) else (if (dtb__2 = "--vuna-describe") then (match dtb__3 with
  | B_dData_dList.C_List__x58__x58_ (dtb__10, dtb__11) -> (((fun e k -> Obj.repr ((fun (u : B_dEffect_dCore.t_EffUnit) -> (let dtb__12 = Obj.obj (e) in (let dtb__13 = Obj.obj ((k (dtb__12 u))) in (dtb__13 u)))))) (((B_dEffect_dFs.v_fsWriteFileAtomic "default") dtb__10) v_describeText)) (fun _u -> (let x = 0 in Obj.repr ((fun (_u : B_dEffect_dCore.t_EffUnit) -> x)))))
  | _ -> (((((((((Driver_dCompilerCli.v_runCompilerCli "default") "default") "default") "default") "default") "default") "default") "default") args)
) else (((((((((Driver_dCompilerCli.v_runCompilerCli "default") "default") "default") "default") "default") "default") "default") "default") args)))
  | _ -> (((((((((Driver_dCompilerCli.v_runCompilerCli "default") "default") "default") "default") "default") "default") "default") "default") args)
)))

# 43 "app/Main.vuna"
let v_main = (try (((fun e k -> Obj.repr ((fun (u : B_dEffect_dCore.t_EffUnit) -> (let dtb__14 = Obj.obj (e) in (let dtb__15 = Obj.obj ((k (dtb__14 u))) in (dtb__15 u)))))) (v_sampleWanted "default")) (fun sample -> (((fun e k -> Obj.repr ((fun (u : B_dEffect_dCore.t_EffUnit) -> (let dtb__16 = Obj.obj (e) in (let dtb__17 = Obj.obj ((k (dtb__16 u))) in (dtb__17 u)))))) (if sample then (let x = ((Base_dObs.v_obsSampleStart "") 0) in Obj.repr ((fun (_u : B_dEffect_dCore.t_EffUnit) -> x))) else (let x = 0 in Obj.repr ((fun (_u : B_dEffect_dCore.t_EffUnit) -> x))))) (fun _u -> (((fun e k -> Obj.repr ((fun (u : B_dEffect_dCore.t_EffUnit) -> (let dtb__18 = Obj.obj (e) in (let dtb__19 = Obj.obj ((k (dtb__18 u))) in (dtb__19 u)))))) (B_dEffect_dArgs.v_argsGetArgs "default")) (fun args -> (((fun e k -> Obj.repr ((fun (u : B_dEffect_dCore.t_EffUnit) -> (let dtb__20 = Obj.obj (e) in (let dtb__21 = Obj.obj ((k (dtb__20 u))) in (dtb__21 u)))))) (v_runMain args)) (fun code -> (((fun e k -> Obj.repr ((fun (u : B_dEffect_dCore.t_EffUnit) -> (let dtb__22 = Obj.obj (e) in (let dtb__23 = Obj.obj ((k (dtb__22 u))) in (dtb__23 u)))))) (if sample then (let x = (Base_dObs.v_obsSampleStop 0) in Obj.repr ((fun (_u : B_dEffect_dCore.t_EffUnit) -> x))) else (let x = 0 in Obj.repr ((fun (_u : B_dEffect_dCore.t_EffUnit) -> x))))) (fun _u -> ((B_dEffect_dExit.v_exitWith "default") code))))))))))) with e -> dt_report_exn e (dt_get_raw_backtrace ()); exit 2)
let () =
  dt_record_backtrace true;
  try print_endline (string_of_int (dtp_sched_main (fun () -> B_dEffect_dCore.v_runMain (B_dEffect_dProcess.v_runProcessErrorHost (B_dEffect_dFs.v_runFsErrorHost (B_dEffect_dTty.v_runTtyHost (B_dEffect_dArgs.v_runArgsHost (B_dEffect_dExit.v_runExitHost (B_dEffect_dProcess.v_runProcessHost (B_dEffect_dEnv.v_runEnvHost (B_dEffect_dClock.v_runClockHost (B_dEffect_dConsole.v_runConsoleHost (B_dEffect_dFs.v_runFsHost v_main)))))))))))))
  with e -> dt_report_exn e (dt_get_raw_backtrace ()); exit 2
