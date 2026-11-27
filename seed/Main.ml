open Vuna_runtime
let () = dt_record_backtrace true
open Vuna_runtime
# 68 "app/Main.vuna"
let v_sampleWanted = (fun (dtb_u_u1 : string) -> (Obj.repr ((fun (dtb_u_u8 : B_dEffect_dCore.t_EffUnit) -> (let dtb_u_u11 = (((B_dEffect_dEnv.v_envGetEnv_u_udirect dtb_u_u1) "VUNA_OBS_SAMPLE") dtb_u_u8) in (let dtb_u_u13 = (if (dtb_u_u11 = "") then false else true) in dtb_u_u13))))))

# 68 "app/Main.vuna"
let v_sampleWanted_u_udirect = (fun (nEnv : string) _u_ueffTok -> (let dtb_u_u11 = (((B_dEffect_dEnv.v_envGetEnv_u_udirect nEnv) "VUNA_OBS_SAMPLE") _u_ueffTok) in (let dtb_u_u13 = (if (dtb_u_u11 = "") then false else true) in dtb_u_u13)))

# 76 "app/Main.vuna"
let v_describeText = (String.concat "" ["vuna-plugin\t1\tcli\tcompiler\n"; "cmd\tcheck\tcore\tyes\tyes\t\230\163\128\230\159\165\229\140\133\230\136\150\230\150\135\228\187\182\231\154\132\231\177\187\229\158\139\tvuna check (<file.vuna> | <package-dir>)\n"; "cmd\tbuild\tcore\tyes\tyes\t\230\158\132\229\187\186\229\140\133\231\154\132\229\143\175\230\137\167\232\161\140\229\133\165\229\143\163\tvuna build [--out DIR] [--package NAME] [--target ocaml|wasm|native] [DIR]\n"; "cmd\tcompile\tcore\tyes\tyes\t\231\188\150\232\175\145\229\140\133\230\136\150\229\133\165\229\143\163\230\150\135\228\187\182\229\136\176\232\190\147\229\135\186\231\155\174\229\189\149\tvuna compile (<entry.vuna> | <package-dir>) <out-dir>\n"])

# 54 "app/Main.vuna"
let v_runMain = (fun (dtb_u_u15 : string B_dData_dList.t_List) -> (let dtb_u_u16 = dtb_u_u15 in (match dtb_u_u16 with
  | B_dData_dList.C_List__x58__x58_ (dtb_u_u17, dtb_u_u18) -> (if (dtb_u_u17 = "--vuna-describe") then (match dtb_u_u18 with
  | B_dData_dList.C_List__x58__x58_ (dtb_u_u19, dtb_u_u20) -> (Obj.repr ((fun (dtb_u_u25 : B_dEffect_dCore.t_EffUnit) -> (let dtb_u_u28 = ((((B_dEffect_dFs.v_fsWriteFileAtomic_u_udirect "default") dtb_u_u19) v_describeText) dtb_u_u25) in (let dtb_u_u30 = 0 in dtb_u_u30)))))
  | B_dData_dList.C_List_Nil -> (Obj.repr ((fun (dtb_u_u36 : B_dEffect_dCore.t_EffUnit) -> (let dtb_u_u39 = (((B_dEffect_dConsole.v_consolePrint_u_udirect "default") v_describeText) dtb_u_u36) in (let dtb_u_u41 = 0 in dtb_u_u41)))))
  | _ -> failwith "DT: impossible branch"
) else (if (dtb_u_u17 = "--vuna-describe") then (match dtb_u_u18 with
  | B_dData_dList.C_List__x58__x58_ (dtb_u_u43, dtb_u_u44) -> (Obj.repr ((fun (dtb_u_u49 : B_dEffect_dCore.t_EffUnit) -> (let dtb_u_u52 = ((((B_dEffect_dFs.v_fsWriteFileAtomic_u_udirect "default") dtb_u_u43) v_describeText) dtb_u_u49) in (let dtb_u_u54 = 0 in dtb_u_u54)))))
  | _ -> (((((((((Driver_dCompilerCli.v_runCompilerCli "default") "default") "default") "default") "default") "default") "default") "default") dtb_u_u15)
) else (((((((((Driver_dCompilerCli.v_runCompilerCli "default") "default") "default") "default") "default") "default") "default") "default") dtb_u_u15)))
  | _ -> (((((((((Driver_dCompilerCli.v_runCompilerCli "default") "default") "default") "default") "default") "default") "default") "default") dtb_u_u15)
)))

# 54 "app/Main.vuna"
let v_runMain_u_udirect = (fun (args : string B_dData_dList.t_List) _u_ueffTok -> (let dtb_u_u16 = args in (match dtb_u_u16 with
  | B_dData_dList.C_List__x58__x58_ (dtb_u_u17, dtb_u_u18) -> (if (dtb_u_u17 = "--vuna-describe") then (match dtb_u_u18 with
  | B_dData_dList.C_List__x58__x58_ (dtb_u_u19, dtb_u_u20) -> (let dtb_u_u28 = ((((B_dEffect_dFs.v_fsWriteFileAtomic_u_udirect "default") dtb_u_u19) v_describeText) _u_ueffTok) in (let dtb_u_u30 = 0 in dtb_u_u30))
  | B_dData_dList.C_List_Nil -> (let dtb_u_u39 = (((B_dEffect_dConsole.v_consolePrint_u_udirect "default") v_describeText) _u_ueffTok) in (let dtb_u_u41 = 0 in dtb_u_u41))
  | _ -> failwith "DT: impossible branch"
) else (if (dtb_u_u17 = "--vuna-describe") then (match dtb_u_u18 with
  | B_dData_dList.C_List__x58__x58_ (dtb_u_u43, dtb_u_u44) -> (let dtb_u_u52 = ((((B_dEffect_dFs.v_fsWriteFileAtomic_u_udirect "default") dtb_u_u43) v_describeText) _u_ueffTok) in (let dtb_u_u54 = 0 in dtb_u_u54))
  | _ -> ((Obj.magic (((((((((Driver_dCompilerCli.v_runCompilerCli "default") "default") "default") "default") "default") "default") "default") "default") args)) _u_ueffTok)
) else ((Obj.magic (((((((((Driver_dCompilerCli.v_runCompilerCli "default") "default") "default") "default") "default") "default") "default") "default") args)) _u_ueffTok)))
  | _ -> ((Obj.magic (((((((((Driver_dCompilerCli.v_runCompilerCli "default") "default") "default") "default") "default") "default") "default") "default") args)) _u_ueffTok)
)))

# 43 "app/Main.vuna"
let v_main = (try (Obj.repr ((fun (dtb_u_u60 : B_dEffect_dCore.t_EffUnit) -> (let dtb_u_u63 = ((v_sampleWanted_u_udirect "default") dtb_u_u60) in (let dtb_u_u69 = Obj.obj ((if dtb_u_u63 then (let dtb_u_u72 = ((Base_dObs.v_obsSampleStart "") 0) in (Obj.repr ((fun (dtb_u_u73 : B_dEffect_dCore.t_EffUnit) -> dtb_u_u72)))) else (let dtb_u_u75 = 0 in (Obj.repr ((fun (dtb_u_u76 : B_dEffect_dCore.t_EffUnit) -> dtb_u_u75)))))) in (let dtb_u_u77 = (dtb_u_u69 dtb_u_u60) in (let dtb_u_u85 = ((B_dEffect_dArgs.v_argsGetArgs_u_udirect "default") dtb_u_u60) in (let dtb_u_u93 = ((v_runMain_u_udirect dtb_u_u85) dtb_u_u60) in (let dtb_u_u99 = Obj.obj ((if dtb_u_u63 then (let dtb_u_u102 = (Base_dObs.v_obsSampleStop 0) in (Obj.repr ((fun (dtb_u_u103 : B_dEffect_dCore.t_EffUnit) -> dtb_u_u102)))) else (let dtb_u_u105 = 0 in (Obj.repr ((fun (dtb_u_u106 : B_dEffect_dCore.t_EffUnit) -> dtb_u_u105)))))) in (let dtb_u_u107 = (dtb_u_u99 dtb_u_u60) in ((Obj.magic ((B_dEffect_dExit.v_exitWith "default") dtb_u_u93)) dtb_u_u60))))))))))) with e -> dt_report_exn e (dt_get_raw_backtrace ()); exit 2)
let () =
  dt_record_backtrace true;
  try print_endline (string_of_int (dtp_sched_main (fun () -> B_dEffect_dCore.v_runMain (B_dEffect_dProcess.v_runProcessErrorHost (B_dEffect_dFs.v_runFsErrorHost (B_dEffect_dTty.v_runTtyHost (B_dEffect_dArgs.v_runArgsHost (B_dEffect_dExit.v_runExitHost (B_dEffect_dProcess.v_runProcessHost (B_dEffect_dEnv.v_runEnvHost (B_dEffect_dClock.v_runClockHost (B_dEffect_dConsole.v_runConsoleHost (B_dEffect_dFs.v_runFsHost v_main)))))))))))))
  with e -> dt_report_exn e (dt_get_raw_backtrace ()); exit 2
