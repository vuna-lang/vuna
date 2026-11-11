open Vuna_runtime
type t_Vuna_dCompiler_dDriver_dCompilerCli_dSarifBox = { f_Vuna_dCompiler_dDriver_dCompilerCli_dSarifBox_sarifItems : Vuna_dCompiler_dDiag.t_Vuna_dCompiler_dDiag_dDiagnostic Base_dList.t_Base_dList_dList; f_Vuna_dCompiler_dDriver_dCompilerCli_dSarifBox_sarifTag : int }

let v_Vuna_dCompiler_dDriver_dCompilerCli_dcompilerUsageLines = (fun prog -> (String.concat "" ["  "; prog; " compile [--no-print] [--release] (<entry.vuna> | <package-dir>) <out-dir>\n  "; prog; " check [--release] [--continue-on-error] (<file.vuna> | <package-dir>)\n  <file.vuna>                   \229\184\166 module \229\164\180 \226\134\146 \230\140\137\229\186\147\230\168\161\229\157\151\230\163\128\230\159\165\239\188\136\229\140\133\228\184\138\228\184\139\230\150\135\239\188\137\239\188\155\230\151\160\229\164\180 \226\134\146 \229\133\165\229\143\163\230\150\135\228\187\182\n  "; prog; " build [--release] [--no-compile] [--out DIR] [--package NAME] [DIR]\n  --no-print                    compile \231\148\159\230\136\144\231\154\132\231\168\139\229\186\143\228\184\141\230\137\147\229\141\176 main \231\187\147\230\158\156\239\188\136\233\187\152\232\174\164\230\137\147\229\141\176\239\188\137\n  --release                     release \230\158\132\229\187\186\239\188\154\230\139\146\231\187\157 assert / todo \231\173\137 debug \228\184\147\231\148\168\230\158\132\233\128\160\n  --continue-on-error           best-effort \229\164\154\233\148\153\232\175\175\239\188\154\233\128\144\230\172\161\231\167\187\233\153\164\229\164\177\232\180\165\229\163\176\230\152\142\229\144\142\231\187\167\231\187\173\239\188\136\228\187\133\229\133\165\229\143\163\230\150\135\228\187\182\239\188\137\n  "; prog; " version, --version          \230\152\190\231\164\186\231\137\136\230\156\172\n  "; prog; " help, -h\n"]))

let v_Vuna_dCompiler_dDriver_dCompilerCli_dcompilerUsage = (fun prog -> ("usage:\n" ^ (v_Vuna_dCompiler_dDriver_dCompilerCli_dcompilerUsageLines prog)))

let v_Vuna_dCompiler_dDriver_dCompilerCli_ddiagFormatRef = (Base_dEff.v_Base_dEff_drunPure (Base_dIORef.v_Base_dIORef_dnewRef "short"))

let v_Vuna_dCompiler_dDriver_dCompilerCli_dsarifRef = (Base_dEff.v_Base_dEff_drunPure (Base_dIORef.v_Base_dIORef_dnewRef { f_Vuna_dCompiler_dDriver_dCompilerCli_dSarifBox_sarifItems = Base_dList.C_Base_dList_dList_Nil; f_Vuna_dCompiler_dDriver_dCompilerCli_dSarifBox_sarifTag = 0 }))

let v_Vuna_dCompiler_dDriver_dCompilerCli_dresetSarif = (fun _u -> (Base_dEff.v_Base_dEff_drunPure ((Base_dIORef.v_Base_dIORef_dwriteRef v_Vuna_dCompiler_dDriver_dCompilerCli_dsarifRef) { f_Vuna_dCompiler_dDriver_dCompilerCli_dSarifBox_sarifItems = Base_dList.C_Base_dList_dList_Nil; f_Vuna_dCompiler_dDriver_dCompilerCli_dSarifBox_sarifTag = 0 })))

let v_Vuna_dCompiler_dDriver_dCompilerCli_dcollectSarif = (fun d -> (Base_dEff.v_Base_dEff_drunPure ((Base_dIORef.v_Base_dIORef_dmodifyRef v_Vuna_dCompiler_dDriver_dCompilerCli_dsarifRef) (fun b -> { f_Vuna_dCompiler_dDriver_dCompilerCli_dSarifBox_sarifItems = ((Base_dList.v_Base_dList_dappend (b).f_Vuna_dCompiler_dDriver_dCompilerCli_dSarifBox_sarifItems) (Base_dList.C_Base_dList_dList_Cons (d, Base_dList.C_Base_dList_dList_Nil))); f_Vuna_dCompiler_dDriver_dCompilerCli_dSarifBox_sarifTag = 0 }))))

let v_Vuna_dCompiler_dDriver_dCompilerCli_ddiagExitFor = (fun d -> (if (d).Vuna_dCompiler_dDiag.f_Vuna_dCompiler_dDiag_dDiagnostic_diagInternal then 70 else (match (d).Vuna_dCompiler_dDiag.f_Vuna_dCompiler_dDiag_dDiagnostic_diagSeverity with
  | Vuna_dCompiler_dDiag.C_Vuna_dCompiler_dDiag_dSeverity_SevError -> 1
  | _ -> 0
)))

let v_Vuna_dCompiler_dDriver_dCompilerCli_ddenyWarningsRef = (Base_dEff.v_Base_dEff_drunPure (Base_dIORef.v_Base_dIORef_dnewRef false))

let v_Vuna_dCompiler_dDriver_dCompilerCli_dshowWarningsRef = (Base_dEff.v_Base_dEff_drunPure (Base_dIORef.v_Base_dIORef_dnewRef false))

let v_Vuna_dCompiler_dDriver_dCompilerCli_dformatExplicitRef = (Base_dEff.v_Base_dEff_drunPure (Base_dIORef.v_Base_dIORef_dnewRef false))

let v_Vuna_dCompiler_dDriver_dCompilerCli_dwarningsExplicitRef = (Base_dEff.v_Base_dEff_drunPure (Base_dIORef.v_Base_dIORef_dnewRef false))

let v_Vuna_dCompiler_dDriver_dCompilerCli_dmaxErrorsRef = (Base_dEff.v_Base_dEff_drunPure (Base_dIORef.v_Base_dIORef_dnewRef 0))

let v_Vuna_dCompiler_dDriver_dCompilerCli_dmaxErrorsOf = (fun _u -> (Base_dEff.v_Base_dEff_drunPure (Base_dIORef.v_Base_dIORef_dreadRef v_Vuna_dCompiler_dDriver_dCompilerCli_dmaxErrorsRef)))

let rec v_Vuna_dCompiler_dDriver_dCompilerCli_dtakeDiagsGo = (fun mc0 mc1 -> (match mc1 with
  | Base_dList.C_Base_dList_dList_Cons (dtb__0, dtb__1) -> (if (mc0 <= 0) then Base_dList.C_Base_dList_dList_Nil else (Base_dList.C_Base_dList_dList_Cons (dtb__0, ((v_Vuna_dCompiler_dDriver_dCompilerCli_dtakeDiagsGo (mc0 - 1)) dtb__1))))
  | Base_dList.C_Base_dList_dList_Nil -> Base_dList.C_Base_dList_dList_Nil
  | _ -> failwith "DT: impossible branch"
))

let v_Vuna_dCompiler_dDriver_dCompilerCli_dtakeDiags = (fun n ds -> (if (n <= 0) then ds else ((v_Vuna_dCompiler_dDriver_dCompilerCli_dtakeDiagsGo n) ds)))

let v_Vuna_dCompiler_dDriver_dCompilerCli_ddenyWarningsOn = (fun _u -> (Base_dEff.v_Base_dEff_drunPure (Base_dIORef.v_Base_dIORef_dreadRef v_Vuna_dCompiler_dDriver_dCompilerCli_ddenyWarningsRef)))

let v_Vuna_dCompiler_dDriver_dCompilerCli_dshowWarningsOn = (fun _u -> (Base_dEff.v_Base_dEff_drunPure (Base_dIORef.v_Base_dIORef_dreadRef v_Vuna_dCompiler_dDriver_dCompilerCli_dshowWarningsRef)))

let rec v_Vuna_dCompiler_dDriver_dCompilerCli_dstripDenyWarnings = (fun mc0 -> (match mc0 with
  | Base_dList.C_Base_dList_dList_Cons (dtb__2, dtb__3) -> (if (if (if (dtb__2 = "--deny-warnings") then true else (dtb__2 = "--warnings")) then true else (dtb__2 = "-W")) then (v_Vuna_dCompiler_dDriver_dCompilerCli_dstripDenyWarnings dtb__3) else (Base_dList.C_Base_dList_dList_Cons (dtb__2, (v_Vuna_dCompiler_dDriver_dCompilerCli_dstripDenyWarnings dtb__3))))
  | Base_dList.C_Base_dList_dList_Nil -> Base_dList.C_Base_dList_dList_Nil
  | _ -> failwith "DT: impossible branch"
))

let rec v_Vuna_dCompiler_dDriver_dCompilerCli_dhasDenyWarnings = (fun mc0 -> (match mc0 with
  | Base_dList.C_Base_dList_dList_Cons (dtb__4, dtb__5) -> (if (dtb__4 = "--deny-warnings") then true else (v_Vuna_dCompiler_dDriver_dCompilerCli_dhasDenyWarnings dtb__5))
  | Base_dList.C_Base_dList_dList_Nil -> false
  | _ -> failwith "DT: impossible branch"
))

let rec v_Vuna_dCompiler_dDriver_dCompilerCli_dhasShowWarnings = (fun mc0 -> (match mc0 with
  | Base_dList.C_Base_dList_dList_Cons (dtb__6, dtb__7) -> (if (if (dtb__6 = "--warnings") then true else (dtb__6 = "-W")) then true else (v_Vuna_dCompiler_dDriver_dCompilerCli_dhasShowWarnings dtb__7))
  | Base_dList.C_Base_dList_dList_Nil -> false
  | _ -> failwith "DT: impossible branch"
))

let rec v_Vuna_dCompiler_dDriver_dCompilerCli_dhasFormatFlag = (fun mc0 -> (match mc0 with
  | Base_dList.C_Base_dList_dList_Cons (dtb__8, dtb__9) -> (if (if (if (dtb__8 = "--json") then true else ((Base_dString.v_Base_dString_dstartsWith "--error-format") dtb__8)) then true else ((Base_dString.v_Base_dString_dstartsWith "--message-format") dtb__8)) then true else (v_Vuna_dCompiler_dDriver_dCompilerCli_dhasFormatFlag dtb__9))
  | Base_dList.C_Base_dList_dList_Nil -> false
  | _ -> failwith "DT: impossible branch"
))

let rec v_Vuna_dCompiler_dDriver_dCompilerCli_dstripDiagFormatGo = (fun mc0 mc1 mc2 -> (match mc0 with
  | Base_dList.C_Base_dList_dList_Cons (dtb__10, dtb__11) -> (if (dtb__10 = "--json") then (((v_Vuna_dCompiler_dDriver_dCompilerCli_dstripDiagFormatGo dtb__11) mc1) (Base_dMaybe.C_Base_dMaybe_dMaybe_Just ("json"))) else (if (dtb__10 = "--error-format") then (match dtb__11 with
  | Base_dList.C_Base_dList_dList_Cons (dtb__12, dtb__13) -> (((v_Vuna_dCompiler_dDriver_dCompilerCli_dstripDiagFormatGo dtb__13) mc1) (Base_dMaybe.C_Base_dMaybe_dMaybe_Just (dtb__12)))
  | Base_dList.C_Base_dList_dList_Nil -> { Base_dPair.f_Base_dPair_dPair_first = (Base_dList.v_Base_dList_dreverse mc1); Base_dPair.f_Base_dPair_dPair_second = (Base_dMaybe.C_Base_dMaybe_dMaybe_Just ("short")) }
  | _ -> failwith "DT: impossible branch"
) else (if ((Base_dString.v_Base_dString_dstartsWith "--error-format=") dtb__10) then (((v_Vuna_dCompiler_dDriver_dCompilerCli_dstripDiagFormatGo dtb__11) mc1) (Base_dMaybe.C_Base_dMaybe_dMaybe_Just ((((Base_dString.v_Base_dString_dsubstring (bi_natFromInt 15)) (bi_natFromInt ((bi_strLength dtb__10) - 15))) dtb__10)))) else (if ((Base_dString.v_Base_dString_dstartsWith "--message-format=") dtb__10) then (((v_Vuna_dCompiler_dDriver_dCompilerCli_dstripDiagFormatGo dtb__11) mc1) (Base_dMaybe.C_Base_dMaybe_dMaybe_Just ((((Base_dString.v_Base_dString_dsubstring (bi_natFromInt 17)) (bi_natFromInt ((bi_strLength dtb__10) - 17))) dtb__10)))) else (((v_Vuna_dCompiler_dDriver_dCompilerCli_dstripDiagFormatGo dtb__11) (Base_dList.C_Base_dList_dList_Cons (dtb__10, mc1))) mc2)))))
  | Base_dList.C_Base_dList_dList_Nil -> { Base_dPair.f_Base_dPair_dPair_first = (Base_dList.v_Base_dList_dreverse mc1); Base_dPair.f_Base_dPair_dPair_second = mc2 }
  | _ -> failwith "DT: impossible branch"
))

let v_Vuna_dCompiler_dDriver_dCompilerCli_dstripDiagFormat = (fun args -> (((v_Vuna_dCompiler_dDriver_dCompilerCli_dstripDiagFormatGo args) Base_dList.C_Base_dList_dList_Nil) Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing))

let rec v_Vuna_dCompiler_dDriver_dCompilerCli_dparseIntChars = (fun mc0 mc1 mc2 mc3 -> (match mc0 with
  | Base_dList.C_Base_dList_dList_Cons (dtb__14, dtb__15) -> (if (if (dtb__14 >= 48) then (dtb__14 <= 57) else false) then ((((v_Vuna_dCompiler_dDriver_dCompilerCli_dparseIntChars dtb__15) ((mc1 * 10) + (dtb__14 - 48))) (mc2 + 1)) mc3) else (if (mc2 = 0) then mc3 else mc1))
  | Base_dList.C_Base_dList_dList_Nil -> (if (mc2 = 0) then mc3 else mc1)
  | _ -> failwith "DT: impossible branch"
))

let v_Vuna_dCompiler_dDriver_dCompilerCli_dparseIntOr = (fun s fallback -> ((((v_Vuna_dCompiler_dDriver_dCompilerCli_dparseIntChars (Base_dList.dtp_unpack s)) 0) 0) fallback))

let rec v_Vuna_dCompiler_dDriver_dCompilerCli_dstripMaxErrorsGo = (fun mc0 mc1 mc2 -> (match mc0 with
  | Base_dList.C_Base_dList_dList_Cons (dtb__16, dtb__17) -> (if (dtb__16 = "--max-errors") then (match dtb__17 with
  | Base_dList.C_Base_dList_dList_Cons (dtb__18, dtb__19) -> (((v_Vuna_dCompiler_dDriver_dCompilerCli_dstripMaxErrorsGo dtb__19) mc1) ((v_Vuna_dCompiler_dDriver_dCompilerCli_dparseIntOr dtb__18) mc2))
  | Base_dList.C_Base_dList_dList_Nil -> { Base_dPair.f_Base_dPair_dPair_first = (Base_dList.v_Base_dList_dreverse mc1); Base_dPair.f_Base_dPair_dPair_second = mc2 }
  | _ -> failwith "DT: impossible branch"
) else (if ((Base_dString.v_Base_dString_dstartsWith "--max-errors=") dtb__16) then (((v_Vuna_dCompiler_dDriver_dCompilerCli_dstripMaxErrorsGo dtb__17) mc1) ((v_Vuna_dCompiler_dDriver_dCompilerCli_dparseIntOr (((Base_dString.v_Base_dString_dsubstring (bi_natFromInt 13)) (bi_natFromInt ((bi_strLength dtb__16) - 13))) dtb__16)) mc2)) else (((v_Vuna_dCompiler_dDriver_dCompilerCli_dstripMaxErrorsGo dtb__17) (Base_dList.C_Base_dList_dList_Cons (dtb__16, mc1))) mc2)))
  | Base_dList.C_Base_dList_dList_Nil -> { Base_dPair.f_Base_dPair_dPair_first = (Base_dList.v_Base_dList_dreverse mc1); Base_dPair.f_Base_dPair_dPair_second = mc2 }
  | _ -> failwith "DT: impossible branch"
))

let v_Vuna_dCompiler_dDriver_dCompilerCli_dstripMaxErrors = (fun args -> (((v_Vuna_dCompiler_dDriver_dCompilerCli_dstripMaxErrorsGo args) Base_dList.C_Base_dList_dList_Nil) 0))

let v_Vuna_dCompiler_dDriver_dCompilerCli_dprintVersion = (fun _u -> ((fun _u -> 0) (Base_dEff.v_Base_dEff_drunPure ((fun dtio_0 -> Base_dEff.C_Base_dEff_dEff_MkEff (fun (_ : Base_dEff.t_Base_dEff_dEffUnit) -> dtp_print dtio_0)) (String.concat "" ["vuna-compiler "; Vuna_dCompiler_dVersion.v_Vuna_dCompiler_dVersion_dvunaVersion; "\n"])))))

let rec v_Vuna_dCompiler_dDriver_dCompilerCli_danyHelp = (fun mc0 -> (match mc0 with
  | Base_dList.C_Base_dList_dList_Cons (dtb__20, dtb__21) -> (if (if (dtb__20 = "-h") then true else (dtb__20 = "--help")) then true else (v_Vuna_dCompiler_dDriver_dCompilerCli_danyHelp dtb__21))
  | Base_dList.C_Base_dList_dList_Nil -> false
  | _ -> failwith "DT: impossible branch"
))

let v_Vuna_dCompiler_dDriver_dCompilerCli_dhelpFor = (fun prog -> ((fun _u -> 0) (Base_dEff.v_Base_dEff_drunPure ((fun dtio_0 -> Base_dEff.C_Base_dEff_dEff_MkEff (fun (_ : Base_dEff.t_Base_dEff_dEffUnit) -> dtp_print dtio_0)) (v_Vuna_dCompiler_dDriver_dCompilerCli_dcompilerUsage prog)))))

let v_Vuna_dCompiler_dDriver_dCompilerCli_dusageErr = (fun prog -> ((fun _u -> 2) (Base_dEff.v_Base_dEff_drunPure ((fun dtio_0 -> Base_dEff.C_Base_dEff_dEff_MkEff (fun (_ : Base_dEff.t_Base_dEff_dEffUnit) -> dtp_print dtio_0)) (v_Vuna_dCompiler_dDriver_dCompilerCli_dcompilerUsage prog)))))

let v_Vuna_dCompiler_dDriver_dCompilerCli_dunknownCommand = (fun prog arg -> ((fun _u -> 2) (Base_dEff.v_Base_dEff_drunPure ((fun dtio_0 -> Base_dEff.C_Base_dEff_dEff_MkEff (fun (_ : Base_dEff.t_Base_dEff_dEffUnit) -> dtp_print dtio_0)) (String.concat "" ["error: unknown command `"; arg; "`\nrun `"; prog; " help` for the command list\n"])))))

let v_Vuna_dCompiler_dDriver_dCompilerCli_dremovedCommand = (fun prog cmd hint -> ((fun _u -> 2) (Base_dEff.v_Base_dEff_drunPure ((fun dtio_0 -> Base_dEff.C_Base_dEff_dEff_MkEff (fun (_ : Base_dEff.t_Base_dEff_dEffUnit) -> dtp_print dtio_0)) (String.concat "" ["error: `"; cmd; "` has been removed; "; hint; "\n"])))))

let v_Vuna_dCompiler_dDriver_dCompilerCli_ddashFlag = (fun name -> ("--" ^ name))

let v_Vuna_dCompiler_dDriver_dCompilerCli_dremovedFlagHint = (fun flag -> (if (flag = (v_Vuna_dCompiler_dDriver_dCompilerCli_ddashFlag "dt")) then (Base_dMaybe.C_Base_dMaybe_dMaybe_Just ("DT is the only path; drop the flag")) else (if (flag = (v_Vuna_dCompiler_dDriver_dCompilerCli_ddashFlag "package")) then (Base_dMaybe.C_Base_dMaybe_dMaybe_Just ("use `build` or `compile`")) else (if (flag = (v_Vuna_dCompiler_dDriver_dCompilerCli_ddashFlag "split")) then (Base_dMaybe.C_Base_dMaybe_dMaybe_Just ("split is the only output model; use `build --out OUT [DIR]` or `compile <pkg-dir> OUT`")) else (if (flag = (v_Vuna_dCompiler_dDriver_dCompilerCli_ddashFlag "root")) then (Base_dMaybe.C_Base_dMaybe_dMaybe_Just ("module resolution is decided by the nearest vuna.toml; set VUNA_BASE for standalone files")) else (if (flag = (v_Vuna_dCompiler_dDriver_dCompilerCli_ddashFlag "out")) then (Base_dMaybe.C_Base_dMaybe_dMaybe_Just ("pass OUTDIR positionally to `compile`; `build` accepts --out DIR")) else (if (flag = (v_Vuna_dCompiler_dDriver_dCompilerCli_ddashFlag "no-typecheck")) then (Base_dMaybe.C_Base_dMaybe_dMaybe_Just ("checking is always enabled")) else (if (flag = (v_Vuna_dCompiler_dDriver_dCompilerCli_ddashFlag "typecheck")) then (Base_dMaybe.C_Base_dMaybe_dMaybe_Just ("checking is always enabled")) else (if (flag = (v_Vuna_dCompiler_dDriver_dCompilerCli_ddashFlag "typed")) then (Base_dMaybe.C_Base_dMaybe_dMaybe_Just ("DT is the only path")) else Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing)))))))))

let v_Vuna_dCompiler_dDriver_dCompilerCli_dremovedFlag = (fun prog flag -> (match (v_Vuna_dCompiler_dDriver_dCompilerCli_dremovedFlagHint flag) with
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing -> (v_Vuna_dCompiler_dDriver_dCompilerCli_dusageErr prog)
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Just (dtb__22) -> ((fun _u -> 2) (Base_dEff.v_Base_dEff_drunPure ((fun dtio_0 -> Base_dEff.C_Base_dEff_dEff_MkEff (fun (_ : Base_dEff.t_Base_dEff_dEffUnit) -> dtp_print dtio_0)) (String.concat "" ["error: "; flag; " has been removed; "; dtb__22; "\n"]))))
  | _ -> failwith "DT: impossible branch"
))

let v_Vuna_dCompiler_dDriver_dCompilerCli_dprintErrText = (fun e -> ((fun _u -> 1) (Base_dEff.v_Base_dEff_drunPure ((fun dtio_0 -> Base_dEff.C_Base_dEff_dEff_MkEff (fun (_ : Base_dEff.t_Base_dEff_dEffUnit) -> dtp_print dtio_0)) (Vuna_dCompiler_dDriver_dDiagRender.v_Vuna_dCompiler_dDriver_dDiagRender_drenderCliDiagnostic e)))))

let v_Vuna_dCompiler_dDriver_dCompilerCli_ddiagFormatOf = (fun _u -> (Base_dEff.v_Base_dEff_drunPure (Base_dIORef.v_Base_dIORef_dreadRef v_Vuna_dCompiler_dDriver_dCompilerCli_ddiagFormatRef)))

let v_Vuna_dCompiler_dDriver_dCompilerCli_dflushSarif = (fun code -> ((fun fmt -> ((fun box -> ((fun shown -> ((fun _u -> ((fun _u -> code) (v_Vuna_dCompiler_dDriver_dCompilerCli_dresetSarif 0))) (if (fmt = "sarif") then (Base_dEff.v_Base_dEff_drunPure ((fun dtio_0 -> Base_dEff.C_Base_dEff_dEff_MkEff (fun (_ : Base_dEff.t_Base_dEff_dEffUnit) -> dtp_print dtio_0)) ((Vuna_dCompiler_dDiag_dFormat.v_Vuna_dCompiler_dDiag_dFormat_drenderSarif shown) ^ "\n"))) else (if (fmt = "json") then (Base_dEff.v_Base_dEff_drunPure ((fun dtio_0 -> Base_dEff.C_Base_dEff_dEff_MkEff (fun (_ : Base_dEff.t_Base_dEff_dEffUnit) -> dtp_print dtio_0)) ((Vuna_dCompiler_dDiag_dFormat.v_Vuna_dCompiler_dDiag_dFormat_drenderJsonList shown) ^ "\n"))) else 0)))) ((v_Vuna_dCompiler_dDriver_dCompilerCli_dtakeDiags (v_Vuna_dCompiler_dDriver_dCompilerCli_dmaxErrorsOf 0)) (box).f_Vuna_dCompiler_dDriver_dCompilerCli_dSarifBox_sarifItems))) (Base_dEff.v_Base_dEff_drunPure (Base_dIORef.v_Base_dIORef_dreadRef v_Vuna_dCompiler_dDriver_dCompilerCli_dsarifRef)))) (v_Vuna_dCompiler_dDriver_dCompilerCli_ddiagFormatOf 0)))

let v_Vuna_dCompiler_dDriver_dCompilerCli_dseverityLabelOf = (fun d -> (match (d).Vuna_dCompiler_dDiag.f_Vuna_dCompiler_dDiag_dDiagnostic_diagSeverity with
  | Vuna_dCompiler_dDiag.C_Vuna_dCompiler_dDiag_dSeverity_SevError -> "error"
  | Vuna_dCompiler_dDiag.C_Vuna_dCompiler_dDiag_dSeverity_SevWarning -> "warning"
  | Vuna_dCompiler_dDiag.C_Vuna_dCompiler_dDiag_dSeverity_SevNote -> "note"
  | Vuna_dCompiler_dDiag.C_Vuna_dCompiler_dDiag_dSeverity_SevHelp -> "help"
  | _ -> failwith "DT: impossible branch"
))

let v_Vuna_dCompiler_dDriver_dCompilerCli_demitDiag = (fun extra d -> ((fun fmt -> (if (fmt = "json") then ((fun _u -> (v_Vuna_dCompiler_dDriver_dCompilerCli_ddiagExitFor d)) (v_Vuna_dCompiler_dDriver_dCompilerCli_dcollectSarif d)) else (if (fmt = "human") then ((fun _u -> (v_Vuna_dCompiler_dDriver_dCompilerCli_ddiagExitFor d)) (v_Vuna_dCompiler_dDriver_dCompilerCli_dprintErrText ((Vuna_dCompiler_dDiag_dFormat.v_Vuna_dCompiler_dDiag_dFormat_drenderHuman d) ^ "\n"))) else (if (fmt = "sarif") then ((fun _u -> (v_Vuna_dCompiler_dDriver_dCompilerCli_ddiagExitFor d)) (v_Vuna_dCompiler_dDriver_dCompilerCli_dcollectSarif d)) else ((fun _u -> (v_Vuna_dCompiler_dDriver_dCompilerCli_ddiagExitFor d)) (v_Vuna_dCompiler_dDriver_dCompilerCli_dprintErrText (String.concat "" [(v_Vuna_dCompiler_dDriver_dCompilerCli_dseverityLabelOf d); ": "; extra; (Vuna_dCompiler_dDiag_dFormat.v_Vuna_dCompiler_dDiag_dFormat_drenderShort d); "\n"]))))))) (v_Vuna_dCompiler_dDriver_dCompilerCli_ddiagFormatOf 0)))

let v_Vuna_dCompiler_dDriver_dCompilerCli_dprintDiagWithPrefix = (fun extra d -> ((fun errs -> (match errs with
  | Base_dList.C_Base_dList_dList_Nil -> ((v_Vuna_dCompiler_dDriver_dCompilerCli_demitDiag extra) d)
  | Base_dList.C_Base_dList_dList_Cons (dtb__23, dtb__24) -> ((fun shown -> ((fun _u -> (v_Vuna_dCompiler_dDriver_dCompilerCli_ddiagExitFor dtb__23)) ((Base_dList.v_Base_dList_dmap (v_Vuna_dCompiler_dDriver_dCompilerCli_demitDiag extra)) shown))) ((v_Vuna_dCompiler_dDriver_dCompilerCli_dtakeDiags (v_Vuna_dCompiler_dDriver_dCompilerCli_dmaxErrorsOf 0)) errs))
  | _ -> failwith "DT: impossible branch"
)) (Vuna_dCompiler_dDiagnostics_dSink.v_Vuna_dCompiler_dDiagnostics_dSink_dtakeParseErrors 0)))

let v_Vuna_dCompiler_dDriver_dCompilerCli_dprintDiag = (fun d -> ((v_Vuna_dCompiler_dDriver_dCompilerCli_dprintDiagWithPrefix "") d))

let v_Vuna_dCompiler_dDriver_dCompilerCli_dprintErr = (fun e -> (v_Vuna_dCompiler_dDriver_dCompilerCli_dprintErrText (String.concat "" ["error: "; e; "\n"])))

let v_Vuna_dCompiler_dDriver_dCompilerCli_dprintDiagList = (fun extra ds -> ((fun _u -> 0) ((Base_dList.v_Base_dList_dmap (v_Vuna_dCompiler_dDriver_dCompilerCli_dprintDiagWithPrefix extra)) ((v_Vuna_dCompiler_dDriver_dCompilerCli_dtakeDiags (v_Vuna_dCompiler_dDriver_dCompilerCli_dmaxErrorsOf 0)) ds))))

let rec v_Vuna_dCompiler_dDriver_dCompilerCli_dprintWarnings = (fun mc0 -> (match mc0 with
  | Base_dList.C_Base_dList_dList_Cons (dtb__25, dtb__26) -> ((fun _u -> (v_Vuna_dCompiler_dDriver_dCompilerCli_dprintWarnings dtb__26)) (Base_dEff.v_Base_dEff_drunPure ((fun dtio_0 -> Base_dEff.C_Base_dEff_dEff_MkEff (fun (_ : Base_dEff.t_Base_dEff_dEffUnit) -> dtp_print dtio_0)) (Vuna_dCompiler_dDriver_dDiagRender.v_Vuna_dCompiler_dDriver_dDiagRender_drenderCliDiagnostic (dtb__25 ^ "\n")))))
  | Base_dList.C_Base_dList_dList_Nil -> 0
  | _ -> failwith "DT: impossible branch"
))

let v_Vuna_dCompiler_dDriver_dCompilerCli_ddefaultDir = (fun mc0 -> (match mc0 with
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing -> "."
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Just (dtb__27) -> dtb__27
  | _ -> failwith "DT: impossible branch"
))

let v_Vuna_dCompiler_dDriver_dCompilerCli_ddtPathErr = (fun path -> (v_Vuna_dCompiler_dDriver_dCompilerCli_dprintErr ("no such file or package directory: " ^ path)))

let v_Vuna_dCompiler_dDriver_dCompilerCli_dexecutablePackageAt = (fun label dir -> ((Vuna_dCompiler_dCommon.v_Vuna_dCompiler_dCommon_dbind (Vuna_dCompiler_dPackages_dPkg.v_Vuna_dCompiler_dPackages_dPkg_dloadPackage dir)) (fun pkg -> (if (Base_dEff.v_Base_dEff_drunPure ((fun dtio_0 -> Base_dEff.C_Base_dEff_dEff_MkEff (fun (_ : Base_dEff.t_Base_dEff_dEffUnit) -> dtp_fileExists dtio_0)) (Vuna_dCompiler_dPackages_dPkg.v_Vuna_dCompiler_dPackages_dPkg_dpackageEntry pkg))) then (Vuna_dCompiler_dDiag.C_Vuna_dCompiler_dDiag_dCheck_OkC (pkg)) else (Vuna_dCompiler_dDiag.v_Vuna_dCompiler_dDiag_derr (String.concat "" [label; ": library package "; (Vuna_dCompiler_dPackages_dPkg.v_Vuna_dCompiler_dPackages_dPkg_dpackageName pkg); " has no app/Main.vuna (executable package required)"]))))))

let v_Vuna_dCompiler_dDriver_dCompilerCli_dexecutablePackage = (fun label dir -> (if (Base_dEff.v_Base_dEff_drunPure ((fun dtio_0 -> Base_dEff.C_Base_dEff_dEff_MkEff (fun (_ : Base_dEff.t_Base_dEff_dEffUnit) -> dtp_fileExists dtio_0)) dir)) then (if (Base_dEff.v_Base_dEff_drunPure ((fun dtio_0 -> Base_dEff.C_Base_dEff_dEff_MkEff (fun (_ : Base_dEff.t_Base_dEff_dEffUnit) -> dtp_isDirectory dtio_0)) dir)) then ((v_Vuna_dCompiler_dDriver_dCompilerCli_dexecutablePackageAt label) dir) else (Vuna_dCompiler_dDiag.v_Vuna_dCompiler_dDiag_derr (String.concat "" [label; ": expects a package directory, not a file: "; dir]))) else (Vuna_dCompiler_dDiag.v_Vuna_dCompiler_dDiag_derr ("no such file or package directory: " ^ dir))))

let v_Vuna_dCompiler_dDriver_dCompilerCli_dcheckSpawnArgs = (fun dir -> ((fun fmt -> ((fun base -> ((fun base2 -> (if (v_Vuna_dCompiler_dDriver_dCompilerCli_ddenyWarningsOn 0) then ((Base_dList.v_Base_dList_dappend base2) (Base_dList.C_Base_dList_dList_Cons ("--deny-warnings", Base_dList.C_Base_dList_dList_Nil))) else base2)) (if (v_Vuna_dCompiler_dDriver_dCompilerCli_dshowWarningsOn 0) then ((Base_dList.v_Base_dList_dappend base) (Base_dList.C_Base_dList_dList_Cons ("--warnings", Base_dList.C_Base_dList_dList_Nil))) else base))) (if (fmt = "short") then (Base_dList.C_Base_dList_dList_Cons ("check", (Base_dList.C_Base_dList_dList_Cons (dir, Base_dList.C_Base_dList_dList_Nil)))) else (Base_dList.C_Base_dList_dList_Cons ("check", (Base_dList.C_Base_dList_dList_Cons ("--error-format", (Base_dList.C_Base_dList_dList_Cons (fmt, (Base_dList.C_Base_dList_dList_Cons (dir, Base_dList.C_Base_dList_dList_Nil))))))))))) (v_Vuna_dCompiler_dDriver_dCompilerCli_ddiagFormatOf 0)))

let v_Vuna_dCompiler_dDriver_dCompilerCli_disWorkspaceRoot = (fun pkg -> (match (Vuna_dCompiler_dPackages_dPkg.v_Vuna_dCompiler_dPackages_dPkg_dworkspacePackages (Vuna_dCompiler_dPackages_dPkg.v_Vuna_dCompiler_dPackages_dPkg_dpackageDir pkg)) with
  | Vuna_dCompiler_dDiag.C_Vuna_dCompiler_dDiag_dCheck_OkC (dtb__28) -> ((Base_dList.v_Base_dList_dlength dtb__28) > 1)
  | Vuna_dCompiler_dDiag.C_Vuna_dCompiler_dDiag_dCheck_ErrC (dtb__29) -> false
  | _ -> failwith "DT: impossible branch"
))

let rec v_Vuna_dCompiler_dDriver_dCompilerCli_dcountFailures = (fun mc0 mc1 -> (match mc1 with
  | Base_dList.C_Base_dList_dList_Cons (dtb__30, dtb__31) -> (if (dtb__30 = 0) then ((v_Vuna_dCompiler_dDriver_dCompilerCli_dcountFailures mc0) dtb__31) else ((v_Vuna_dCompiler_dDriver_dCompilerCli_dcountFailures 1) dtb__31))
  | Base_dList.C_Base_dList_dList_Nil -> mc0
  | _ -> failwith "DT: impossible branch"
))

let v_Vuna_dCompiler_dDriver_dCompilerCli_disSingleLibraryPackage = (fun mc0 -> (match mc0 with
  | Base_dList.C_Base_dList_dList_Cons (dtb__32, dtb__33) -> (match dtb__33 with
  | Base_dList.C_Base_dList_dList_Nil -> (Base_dBool.v_Base_dBool_dnot (Base_dEff.v_Base_dEff_drunPure ((fun dtio_0 -> Base_dEff.C_Base_dEff_dEff_MkEff (fun (_ : Base_dEff.t_Base_dEff_dEffUnit) -> dtp_fileExists dtio_0)) (Vuna_dCompiler_dPackages_dPkg.v_Vuna_dCompiler_dPackages_dPkg_dpackageEntry dtb__32))))
  | _ -> false
)
  | _ -> false
))

let v_Vuna_dCompiler_dDriver_dCompilerCli_dlibraryOnlyMessage = (fun mc0 -> (match mc0 with
  | Base_dList.C_Base_dList_dList_Nil -> "no package to build"
  | Base_dList.C_Base_dList_dList_Cons (dtb__34, dtb__35) -> (String.concat "" ["library package "; (Vuna_dCompiler_dPackages_dPkg.v_Vuna_dCompiler_dPackages_dPkg_dpackageName dtb__34); " has no app/Main.vuna (executable package required; use `check` for libraries)"])
  | _ -> failwith "DT: impossible branch"
))

let rec v_Vuna_dCompiler_dDriver_dCompilerCli_dfindPackageByName = (fun mc0 mc1 -> (match mc1 with
  | Base_dList.C_Base_dList_dList_Cons (dtb__36, dtb__37) -> (if ((Vuna_dCompiler_dPackages_dPkg.v_Vuna_dCompiler_dPackages_dPkg_dpackageName dtb__36) = mc0) then (Base_dMaybe.C_Base_dMaybe_dMaybe_Just (dtb__36)) else ((v_Vuna_dCompiler_dDriver_dCompilerCli_dfindPackageByName mc0) dtb__37))
  | Base_dList.C_Base_dList_dList_Nil -> Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing
  | _ -> failwith "DT: impossible branch"
))

let v_Vuna_dCompiler_dDriver_dCompilerCli_dselectBuildTargets = (fun mc0 mc1 -> (match mc0 with
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Just (dtb__38) -> (match ((v_Vuna_dCompiler_dDriver_dCompilerCli_dfindPackageByName dtb__38) mc1) with
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing -> (Vuna_dCompiler_dDiag.v_Vuna_dCompiler_dDiag_derr ("no such package in workspace: " ^ dtb__38))
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Just (dtb__39) -> (Vuna_dCompiler_dDiag.C_Vuna_dCompiler_dDiag_dCheck_OkC ((Base_dList.C_Base_dList_dList_Cons (dtb__39, Base_dList.C_Base_dList_dList_Nil))))
  | _ -> failwith "DT: impossible branch"
)
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing -> (Vuna_dCompiler_dDiag.C_Vuna_dCompiler_dDiag_dCheck_OkC (mc1))
  | _ -> failwith "DT: impossible branch"
))

let v_Vuna_dCompiler_dDriver_dCompilerCli_dcompileCodegen = (fun ctx entry outDir -> (match ((((Vuna_dCompiler_dDriver_dCompile.v_Vuna_dCompiler_dDriver_dCompile_dcompileToDir ctx) entry) true) outDir) with
  | Vuna_dCompiler_dDiag.C_Vuna_dCompiler_dDiag_dCheck_ErrC (dtb__40) -> (v_Vuna_dCompiler_dDriver_dCompilerCli_dprintDiag dtb__40)
  | Vuna_dCompiler_dDiag.C_Vuna_dCompiler_dDiag_dCheck_OkC (dtb__41) -> 0
  | _ -> failwith "DT: impossible branch"
))

let v_Vuna_dCompiler_dDriver_dCompilerCli_dbuildLinked = (fun ctx entry outDir name -> ((fun _u -> (match (((Vuna_dCompiler_dDriver_dCompile.v_Vuna_dCompiler_dDriver_dCompile_drunBuildScript outDir) ("bin/" ^ name)) name) with
  | Vuna_dCompiler_dDiag.C_Vuna_dCompiler_dDiag_dCheck_ErrC (dtb__42) -> (v_Vuna_dCompiler_dDriver_dCompilerCli_dprintDiag dtb__42)
  | Vuna_dCompiler_dDiag.C_Vuna_dCompiler_dDiag_dCheck_OkC (dtb__43) -> ((fun _u -> ((fun _u -> 0) (Base_dEff.v_Base_dEff_drunPure ((fun dtio_0 -> Base_dEff.C_Base_dEff_dEff_MkEff (fun (_ : Base_dEff.t_Base_dEff_dEffUnit) -> dtp_print dtio_0)) (String.concat "" ["built "; outDir; "/bin/"; name; "\n"]))))) ((((Vuna_dCompiler_dDriver_dCompile.v_Vuna_dCompiler_dDriver_dCompile_dwriteBuildMeta outDir) ctx) entry) true))
  | _ -> failwith "DT: impossible branch"
)) (Vuna_dCompiler_dDriver_dCompile.v_Vuna_dCompiler_dDriver_dCompile_densureDirPath (outDir ^ "/bin"))))

let v_Vuna_dCompiler_dDriver_dCompilerCli_dbuildOne = (fun noCompile multiOut outM pkg -> ((fun name -> ((fun outDir -> ((fun entry -> (if (Base_dEff.v_Base_dEff_drunPure ((fun dtio_0 -> Base_dEff.C_Base_dEff_dEff_MkEff (fun (_ : Base_dEff.t_Base_dEff_dEffUnit) -> dtp_fileExists dtio_0)) entry)) then ((fun ctx -> ((fun binPath -> (if noCompile then (((v_Vuna_dCompiler_dDriver_dCompilerCli_dcompileCodegen ctx) entry) outDir) else (if ((((Vuna_dCompiler_dDriver_dCompile.v_Vuna_dCompiler_dDriver_dCompile_dmetaUpToDate outDir) ctx) entry) binPath) then ((fun _u -> 0) (Base_dEff.v_Base_dEff_drunPure ((fun dtio_0 -> Base_dEff.C_Base_dEff_dEff_MkEff (fun (_ : Base_dEff.t_Base_dEff_dEffUnit) -> dtp_print dtio_0)) (String.concat "" ["up to date: "; binPath; "\n"])))) else (match ((((Vuna_dCompiler_dDriver_dCompile.v_Vuna_dCompiler_dDriver_dCompile_dcompileToDir ctx) entry) true) outDir) with
  | Vuna_dCompiler_dDiag.C_Vuna_dCompiler_dDiag_dCheck_ErrC (dtb__44) -> (v_Vuna_dCompiler_dDriver_dCompilerCli_dprintDiag dtb__44)
  | Vuna_dCompiler_dDiag.C_Vuna_dCompiler_dDiag_dCheck_OkC (dtb__45) -> ((((v_Vuna_dCompiler_dDriver_dCompilerCli_dbuildLinked ctx) entry) outDir) name)
  | _ -> failwith "DT: impossible branch"
)))) (String.concat "" [outDir; "/bin/"; name]))) (Vuna_dCompiler_dPackages_dPkg.v_Vuna_dCompiler_dPackages_dPkg_dpackageContext pkg)) else (match ((Vuna_dCompiler_dDriver_dCompile.v_Vuna_dCompiler_dDriver_dCompile_dcheckPackage false) pkg) with
  | Vuna_dCompiler_dDiag.C_Vuna_dCompiler_dDiag_dCheck_ErrC (dtb__46) -> (v_Vuna_dCompiler_dDriver_dCompilerCli_dprintDiag dtb__46)
  | Vuna_dCompiler_dDiag.C_Vuna_dCompiler_dDiag_dCheck_OkC (dtb__47) -> ((fun _u -> ((fun _u -> 0) (Base_dEff.v_Base_dEff_drunPure ((fun dtio_0 -> Base_dEff.C_Base_dEff_dEff_MkEff (fun (_ : Base_dEff.t_Base_dEff_dEffUnit) -> dtp_print dtio_0)) (String.concat "" ["skipped (library): "; name; " -> "; outDir; "\n"]))))) (v_Vuna_dCompiler_dDriver_dCompilerCli_dprintWarnings dtb__47))
  | _ -> failwith "DT: impossible branch"
))) (Vuna_dCompiler_dPackages_dPkg.v_Vuna_dCompiler_dPackages_dPkg_dpackageEntry pkg))) (match outM with
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Just (dtb__48) -> (if multiOut then (String.concat "" [dtb__48; "/"; name]) else dtb__48)
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing -> ((Vuna_dCompiler_dPackages_dPkg.v_Vuna_dCompiler_dPackages_dPkg_dpackageDir pkg) ^ "/.output")
  | _ -> failwith "DT: impossible branch"
))) (Vuna_dCompiler_dPackages_dPkg.v_Vuna_dCompiler_dPackages_dPkg_dpackageName pkg)))

let rec v_Vuna_dCompiler_dDriver_dCompilerCli_dbuildTargets = (fun mc0 mc1 mc2 mc3 mc4 -> (match mc3 with
  | Base_dList.C_Base_dList_dList_Cons (dtb__49, dtb__50) -> ((fun c -> ((fun next -> (((((v_Vuna_dCompiler_dDriver_dCompilerCli_dbuildTargets mc0) mc1) mc2) dtb__50) next)) (if (c > mc4) then c else mc4))) ((((v_Vuna_dCompiler_dDriver_dCompilerCli_dbuildOne mc0) mc1) mc2) dtb__49))
  | Base_dList.C_Base_dList_dList_Nil -> mc4
  | _ -> failwith "DT: impossible branch"
))

let v_Vuna_dCompiler_dDriver_dCompilerCli_dbuildRun = (fun noCompile dir outM pkgM -> (match (Vuna_dCompiler_dPackages_dPkg.v_Vuna_dCompiler_dPackages_dPkg_dworkspacePackages dir) with
  | Vuna_dCompiler_dDiag.C_Vuna_dCompiler_dDiag_dCheck_ErrC (dtb__51) -> (v_Vuna_dCompiler_dDriver_dCompilerCli_dprintDiag dtb__51)
  | Vuna_dCompiler_dDiag.C_Vuna_dCompiler_dDiag_dCheck_OkC (dtb__52) -> (if (v_Vuna_dCompiler_dDriver_dCompilerCli_disSingleLibraryPackage dtb__52) then (v_Vuna_dCompiler_dDriver_dCompilerCli_dprintErr (v_Vuna_dCompiler_dDriver_dCompilerCli_dlibraryOnlyMessage dtb__52)) else (match ((v_Vuna_dCompiler_dDriver_dCompilerCli_dselectBuildTargets pkgM) dtb__52) with
  | Vuna_dCompiler_dDiag.C_Vuna_dCompiler_dDiag_dCheck_ErrC (dtb__53) -> (v_Vuna_dCompiler_dDriver_dCompilerCli_dprintDiag dtb__53)
  | Vuna_dCompiler_dDiag.C_Vuna_dCompiler_dDiag_dCheck_OkC (dtb__54) -> (((((v_Vuna_dCompiler_dDriver_dCompilerCli_dbuildTargets noCompile) ((Base_dList.v_Base_dList_dlength dtb__52) > 1)) outM) dtb__54) 0)
  | _ -> failwith "DT: impossible branch"
))
  | _ -> failwith "DT: impossible branch"
))

let rec v_Vuna_dCompiler_dDriver_dCompilerCli_dbuildParse = (fun prog noCompile out dir pkg args -> ((fun nd_uscrut6 -> (match nd_uscrut6 with
  | Base_dList.C_Base_dList_dList_Cons (dtb__55, dtb__56) -> (if (dtb__55 = "--no-compile") then ((((((v_Vuna_dCompiler_dDriver_dCompilerCli_dbuildParse prog) true) out) dir) pkg) dtb__56) else (if (dtb__55 = "--release") then ((((((v_Vuna_dCompiler_dDriver_dCompilerCli_dbuildParse prog) noCompile) out) dir) pkg) dtb__56) else (if (dtb__55 = "--out") then (match dtb__56 with
  | Base_dList.C_Base_dList_dList_Cons (dtb__57, dtb__58) -> (if ((Base_dString.v_Base_dString_dstartsWith "-") dtb__57) then ((v_Vuna_dCompiler_dDriver_dCompilerCli_dremovedFlag prog) dtb__57) else (match out with
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing -> ((((((v_Vuna_dCompiler_dDriver_dCompilerCli_dbuildParse prog) noCompile) (Base_dMaybe.C_Base_dMaybe_dMaybe_Just (dtb__57))) dir) pkg) dtb__58)
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Just (dtb__59) -> (v_Vuna_dCompiler_dDriver_dCompilerCli_dusageErr prog)
  | _ -> failwith "DT: impossible branch"
))
  | Base_dList.C_Base_dList_dList_Nil -> (v_Vuna_dCompiler_dDriver_dCompilerCli_dusageErr prog)
  | _ -> failwith "DT: impossible branch"
) else (if (dtb__55 = "--package") then (match dtb__56 with
  | Base_dList.C_Base_dList_dList_Cons (dtb__60, dtb__61) -> (if ((Base_dString.v_Base_dString_dstartsWith "-") dtb__60) then ((v_Vuna_dCompiler_dDriver_dCompilerCli_dremovedFlag prog) dtb__60) else (match pkg with
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing -> ((((((v_Vuna_dCompiler_dDriver_dCompilerCli_dbuildParse prog) noCompile) out) dir) (Base_dMaybe.C_Base_dMaybe_dMaybe_Just (dtb__60))) dtb__61)
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Just (dtb__62) -> (v_Vuna_dCompiler_dDriver_dCompilerCli_dusageErr prog)
  | _ -> failwith "DT: impossible branch"
))
  | Base_dList.C_Base_dList_dList_Nil -> (v_Vuna_dCompiler_dDriver_dCompilerCli_dusageErr prog)
  | _ -> failwith "DT: impossible branch"
) else (if ((Base_dString.v_Base_dString_dstartsWith "-") dtb__55) then ((v_Vuna_dCompiler_dDriver_dCompilerCli_dremovedFlag prog) dtb__55) else (match dir with
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing -> ((((((v_Vuna_dCompiler_dDriver_dCompilerCli_dbuildParse prog) noCompile) out) (Base_dMaybe.C_Base_dMaybe_dMaybe_Just (dtb__55))) pkg) dtb__56)
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Just (dtb__63) -> (v_Vuna_dCompiler_dDriver_dCompilerCli_dusageErr prog)
  | _ -> failwith "DT: impossible branch"
))))))
  | Base_dList.C_Base_dList_dList_Nil -> ((((v_Vuna_dCompiler_dDriver_dCompilerCli_dbuildRun noCompile) (v_Vuna_dCompiler_dDriver_dCompilerCli_ddefaultDir dir)) out) pkg)
  | _ -> failwith "DT: impossible branch"
)) args))

let v_Vuna_dCompiler_dDriver_dCompilerCli_dbuildArgs = (fun prog args -> ((((((v_Vuna_dCompiler_dDriver_dCompilerCli_dbuildParse prog) false) Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing) Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing) Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing) args))

let v_Vuna_dCompiler_dDriver_dCompilerCli_dstripDotSlash = (fun s -> (if ((Base_dString.v_Base_dString_dstartsWith "./") s) then (((Base_dString.v_Base_dString_dsubstring (bi_natFromInt 2)) (bi_natFromInt ((bi_strLength s) - 2))) s) else s))

let v_Vuna_dCompiler_dDriver_dCompilerCli_disPackageEntryPath = (fun ctx path -> (match (Vuna_dCompiler_dPackages_dPkg.v_Vuna_dCompiler_dPackages_dPkg_dcontextPackageOf ctx) with
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing -> false
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Just (dtb__64) -> ((v_Vuna_dCompiler_dDriver_dCompilerCli_dstripDotSlash (Vuna_dCompiler_dPackages_dPkg.v_Vuna_dCompiler_dPackages_dPkg_dabsolutePath path)) = (v_Vuna_dCompiler_dDriver_dCompilerCli_dstripDotSlash (Vuna_dCompiler_dPackages_dPkg.v_Vuna_dCompiler_dPackages_dPkg_dpackageEntry dtb__64)))
  | _ -> failwith "DT: impossible branch"
))

let v_Vuna_dCompiler_dDriver_dCompilerCli_disModuleFileEntry = (fun ctx path -> (if ((v_Vuna_dCompiler_dDriver_dCompilerCli_disPackageEntryPath ctx) path) then false else (Vuna_dCompiler_dDriver_dDt.v_Vuna_dCompiler_dDriver_dDt_ddtFileHasModuleHeader path)))

let v_Vuna_dCompiler_dDriver_dCompilerCli_downedByFile = (fun path d -> ((v_Vuna_dCompiler_dDriver_dCompilerCli_dstripDotSlash (Vuna_dCompiler_dDiag.v_Vuna_dCompiler_dDiag_ddiagFileOf d)) = (v_Vuna_dCompiler_dDriver_dCompilerCli_dstripDotSlash path)))

let v_Vuna_dCompiler_dDriver_dCompilerCli_dcheckModuleFileEntry = (fun ctx path -> (match ((Vuna_dCompiler_dDriver_dDt.v_Vuna_dCompiler_dDriver_dDt_ddtCheckModuleFile ctx) path) with
  | Vuna_dCompiler_dDiag.C_Vuna_dCompiler_dDiag_dCheck_ErrC (dtb__65) -> (v_Vuna_dCompiler_dDriver_dCompilerCli_dprintDiag dtb__65)
  | Vuna_dCompiler_dDiag.C_Vuna_dCompiler_dDiag_dCheck_OkC (dtb__66) -> ((fun ws -> ((fun shown -> ((fun _u -> (if (if (v_Vuna_dCompiler_dDriver_dCompilerCli_ddenyWarningsOn 0) then ((Base_dList.v_Base_dList_dlength ws) > 0) else false) then 1 else 0)) ((v_Vuna_dCompiler_dDriver_dCompilerCli_dprintDiagList "") shown))) (if (if (v_Vuna_dCompiler_dDriver_dCompilerCli_dshowWarningsOn 0) then true else (v_Vuna_dCompiler_dDriver_dCompilerCli_ddenyWarningsOn 0)) then ws else Base_dList.C_Base_dList_dList_Nil))) ((Base_dList.v_Base_dList_dfilter (v_Vuna_dCompiler_dDriver_dCompilerCli_downedByFile path)) (Vuna_dCompiler_dDiagnostics_dSink.v_Vuna_dCompiler_dDiagnostics_dSink_dtakeWarnings 0)))
  | _ -> failwith "DT: impossible branch"
))

let v_Vuna_dCompiler_dDriver_dCompilerCli_downedByPackage = (fun pkg d -> ((fun dir -> ((fun file -> ((fun prefix -> (if (if ((Base_dString.v_Base_dString_dstartsWith (prefix ^ "lib/")) file) then true else ((Base_dString.v_Base_dString_dstartsWith (prefix ^ "app/")) file)) then true else ((Base_dString.v_Base_dString_dstartsWith (prefix ^ "test/")) file))) (if (if (dir = ".") then true else (dir = "")) then "" else (dir ^ "/")))) (v_Vuna_dCompiler_dDriver_dCompilerCli_dstripDotSlash (Vuna_dCompiler_dDiag.v_Vuna_dCompiler_dDiag_ddiagFileOf d)))) (v_Vuna_dCompiler_dDriver_dCompilerCli_dstripDotSlash (Vuna_dCompiler_dPackages_dPkg.v_Vuna_dCompiler_dPackages_dPkg_dpackageDir pkg))))

let v_Vuna_dCompiler_dDriver_dCompilerCli_dfinishWarnings = (fun code -> ((fun ws -> ((fun shown -> ((fun _u -> (if (if (v_Vuna_dCompiler_dDriver_dCompilerCli_ddenyWarningsOn 0) then ((Base_dList.v_Base_dList_dlength ws) > 0) else false) then 1 else code)) ((v_Vuna_dCompiler_dDriver_dCompilerCli_dprintDiagList "") shown))) (if (if (v_Vuna_dCompiler_dDriver_dCompilerCli_dshowWarningsOn 0) then true else (v_Vuna_dCompiler_dDriver_dCompilerCli_ddenyWarningsOn 0)) then ws else Base_dList.C_Base_dList_dList_Nil))) (Vuna_dCompiler_dDiagnostics_dSink.v_Vuna_dCompiler_dDiagnostics_dSink_dtakeWarnings 0)))

let v_Vuna_dCompiler_dDriver_dCompilerCli_dfinishWarningsDir = (fun dir code -> ((fun ws -> ((fun shown -> ((fun _u -> (if (if (v_Vuna_dCompiler_dDriver_dCompilerCli_ddenyWarningsOn 0) then ((Base_dList.v_Base_dList_dlength ws) > 0) else false) then ((fun _u -> 1) (Base_dEff.v_Base_dEff_drunPure (((fun dtio_0 dtio_1 -> Base_dEff.C_Base_dEff_dEff_MkEff (fun (_ : Base_dEff.t_Base_dEff_dEffUnit) -> (fun dir args -> dtp_runIn dir (Base_dList.dtp_ocamlOf args)) dtio_0 dtio_1)) "/") (Base_dList.C_Base_dList_dList_Cons ("rm", (Base_dList.C_Base_dList_dList_Cons ("-rf", (Base_dList.C_Base_dList_dList_Cons (dir, Base_dList.C_Base_dList_dList_Nil))))))))) else code)) ((v_Vuna_dCompiler_dDriver_dCompilerCli_dprintDiagList "") shown))) (if (if (v_Vuna_dCompiler_dDriver_dCompilerCli_dshowWarningsOn 0) then true else (v_Vuna_dCompiler_dDriver_dCompilerCli_ddenyWarningsOn 0)) then ws else Base_dList.C_Base_dList_dList_Nil))) (Vuna_dCompiler_dDiagnostics_dSink.v_Vuna_dCompiler_dDiagnostics_dSink_dtakeWarnings 0)))

let rec v_Vuna_dCompiler_dDriver_dCompilerCli_dstripLangGo = (fun mc0 mc1 mc2 -> (match mc0 with
  | Base_dList.C_Base_dList_dList_Cons (dtb__67, dtb__68) -> (if (dtb__67 = "--lang") then (match dtb__68 with
  | Base_dList.C_Base_dList_dList_Cons (dtb__69, dtb__70) -> (((v_Vuna_dCompiler_dDriver_dCompilerCli_dstripLangGo dtb__70) mc1) dtb__69)
  | Base_dList.C_Base_dList_dList_Nil -> { Base_dPair.f_Base_dPair_dPair_first = (Base_dList.v_Base_dList_dreverse mc1); Base_dPair.f_Base_dPair_dPair_second = mc2 }
  | _ -> failwith "DT: impossible branch"
) else (if ((Base_dString.v_Base_dString_dstartsWith "--lang=") dtb__67) then (((v_Vuna_dCompiler_dDriver_dCompilerCli_dstripLangGo dtb__68) mc1) (((Base_dString.v_Base_dString_dsubstring (bi_natFromInt 7)) (bi_natFromInt ((bi_strLength dtb__67) - 7))) dtb__67)) else (((v_Vuna_dCompiler_dDriver_dCompilerCli_dstripLangGo dtb__68) (Base_dList.C_Base_dList_dList_Cons (dtb__67, mc1))) mc2)))
  | Base_dList.C_Base_dList_dList_Nil -> { Base_dPair.f_Base_dPair_dPair_first = (Base_dList.v_Base_dList_dreverse mc1); Base_dPair.f_Base_dPair_dPair_second = mc2 }
  | _ -> failwith "DT: impossible branch"
))

let v_Vuna_dCompiler_dDriver_dCompilerCli_dstripLang = (fun args -> (((v_Vuna_dCompiler_dDriver_dCompilerCli_dstripLangGo args) Base_dList.C_Base_dList_dList_Nil) "en"))

let v_Vuna_dCompiler_dDriver_dCompilerCli_dlangExplicitRef = (Base_dEff.v_Base_dEff_drunPure (Base_dIORef.v_Base_dIORef_dnewRef false))

let rec v_Vuna_dCompiler_dDriver_dCompilerCli_dhasLangFlag = (fun mc0 -> (match mc0 with
  | Base_dList.C_Base_dList_dList_Cons (dtb__71, dtb__72) -> (if (if (dtb__71 = "--lang") then true else ((Base_dString.v_Base_dString_dstartsWith "--lang=") dtb__71)) then true else (v_Vuna_dCompiler_dDriver_dCompilerCli_dhasLangFlag dtb__72))
  | Base_dList.C_Base_dList_dList_Nil -> false
  | _ -> failwith "DT: impossible branch"
))

let v_Vuna_dCompiler_dDriver_dCompilerCli_ddenyExplicitRef = (Base_dEff.v_Base_dEff_drunPure (Base_dIORef.v_Base_dIORef_dnewRef false))

let v_Vuna_dCompiler_dDriver_dCompilerCli_dapplyDiagConfig = (fun mc0 -> (match mc0 with
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Just (dtb__73) -> ((fun m -> ((fun _u -> ((fun _u -> ((fun _u -> ((fun _u -> ((fun _u -> 0) (match (m).Vuna_dCompiler_dFrontend_dManifest.f_Vuna_dCompiler_dFrontend_dManifest_dManifest_manifestDiagMaxErrors with
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Just (dtb__74) -> (Base_dEff.v_Base_dEff_drunPure ((Base_dIORef.v_Base_dIORef_dwriteRef v_Vuna_dCompiler_dDriver_dCompilerCli_dmaxErrorsRef) dtb__74))
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing -> 0
  | _ -> failwith "DT: impossible branch"
))) (if (Base_dBool.v_Base_dBool_dnot (Base_dEff.v_Base_dEff_drunPure (Base_dIORef.v_Base_dIORef_dreadRef v_Vuna_dCompiler_dDriver_dCompilerCli_ddenyExplicitRef))) then (match (m).Vuna_dCompiler_dFrontend_dManifest.f_Vuna_dCompiler_dFrontend_dManifest_dManifest_manifestDiagDenyWarnings with
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Just (dtb__75) -> ((fun _u -> ((fun _u -> 0) (if dtb__75 then (Base_dEff.v_Base_dEff_drunPure ((Base_dIORef.v_Base_dIORef_dwriteRef v_Vuna_dCompiler_dDriver_dCompilerCli_dshowWarningsRef) true)) else 0))) (Base_dEff.v_Base_dEff_drunPure ((Base_dIORef.v_Base_dIORef_dwriteRef v_Vuna_dCompiler_dDriver_dCompilerCli_ddenyWarningsRef) dtb__75)))
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing -> 0
  | _ -> failwith "DT: impossible branch"
) else 0))) (if (Base_dBool.v_Base_dBool_dnot (Base_dEff.v_Base_dEff_drunPure (Base_dIORef.v_Base_dIORef_dreadRef v_Vuna_dCompiler_dDriver_dCompilerCli_dlangExplicitRef))) then (match (m).Vuna_dCompiler_dFrontend_dManifest.f_Vuna_dCompiler_dFrontend_dManifest_dManifest_manifestDiagLang with
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Just (dtb__76) -> ((fun _u -> ((fun _u -> 0) (if (dtb__76 = "en") then 0 else (if (Base_dBool.v_Base_dBool_dnot (Base_dEff.v_Base_dEff_drunPure (Base_dIORef.v_Base_dIORef_dreadRef v_Vuna_dCompiler_dDriver_dCompilerCli_dformatExplicitRef))) then (match (m).Vuna_dCompiler_dFrontend_dManifest.f_Vuna_dCompiler_dFrontend_dManifest_dManifest_manifestDiagFormat with
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing -> (Base_dEff.v_Base_dEff_drunPure ((Base_dIORef.v_Base_dIORef_dwriteRef v_Vuna_dCompiler_dDriver_dCompilerCli_ddiagFormatRef) "human"))
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Just (dtb__77) -> 0
  | _ -> failwith "DT: impossible branch"
) else 0)))) (Vuna_dCompiler_dDiag_dFormat.v_Vuna_dCompiler_dDiag_dFormat_dsetDiagLang dtb__76))
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing -> 0
  | _ -> failwith "DT: impossible branch"
) else 0))) (if (Base_dBool.v_Base_dBool_dnot (Base_dEff.v_Base_dEff_drunPure (Base_dIORef.v_Base_dIORef_dreadRef v_Vuna_dCompiler_dDriver_dCompilerCli_dwarningsExplicitRef))) then (match (m).Vuna_dCompiler_dFrontend_dManifest.f_Vuna_dCompiler_dFrontend_dManifest_dManifest_manifestDiagWarnings with
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Just (dtb__78) -> (Base_dEff.v_Base_dEff_drunPure ((Base_dIORef.v_Base_dIORef_dwriteRef v_Vuna_dCompiler_dDriver_dCompilerCli_dshowWarningsRef) dtb__78))
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing -> 0
  | _ -> failwith "DT: impossible branch"
) else 0))) (if (Base_dBool.v_Base_dBool_dnot (Base_dEff.v_Base_dEff_drunPure (Base_dIORef.v_Base_dIORef_dreadRef v_Vuna_dCompiler_dDriver_dCompilerCli_dformatExplicitRef))) then (match (m).Vuna_dCompiler_dFrontend_dManifest.f_Vuna_dCompiler_dFrontend_dManifest_dManifest_manifestDiagFormat with
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Just (dtb__79) -> (Base_dEff.v_Base_dEff_drunPure ((Base_dIORef.v_Base_dIORef_dwriteRef v_Vuna_dCompiler_dDriver_dCompilerCli_ddiagFormatRef) dtb__79))
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing -> 0
  | _ -> failwith "DT: impossible branch"
) else 0))) (dtb__73).Vuna_dCompiler_dPackages_dPkg.f_Vuna_dCompiler_dPackages_dPkg_dPackage_packageManifest)
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing -> 0
  | _ -> failwith "DT: impossible branch"
))

let v_Vuna_dCompiler_dDriver_dCompilerCli_dcompileFileEntry = (fun printResult entry outDir -> (match (Vuna_dCompiler_dPackages_dPkg.v_Vuna_dCompiler_dPackages_dPkg_dcontextForFile entry) with
  | Vuna_dCompiler_dDiag.C_Vuna_dCompiler_dDiag_dCheck_ErrC (dtb__80) -> (v_Vuna_dCompiler_dDriver_dCompilerCli_dprintDiag dtb__80)
  | Vuna_dCompiler_dDiag.C_Vuna_dCompiler_dDiag_dCheck_OkC (dtb__81) -> ((fun _u -> (match ((((Vuna_dCompiler_dDriver_dCompile.v_Vuna_dCompiler_dDriver_dCompile_dcompileToDir dtb__81) entry) printResult) outDir) with
  | Vuna_dCompiler_dDiag.C_Vuna_dCompiler_dDiag_dCheck_ErrC (dtb__82) -> (v_Vuna_dCompiler_dDriver_dCompilerCli_dprintDiag dtb__82)
  | Vuna_dCompiler_dDiag.C_Vuna_dCompiler_dDiag_dCheck_OkC (dtb__83) -> ((v_Vuna_dCompiler_dDriver_dCompilerCli_dfinishWarningsDir outDir) 0)
  | _ -> failwith "DT: impossible branch"
)) (v_Vuna_dCompiler_dDriver_dCompilerCli_dapplyDiagConfig (Vuna_dCompiler_dPackages_dPkg.v_Vuna_dCompiler_dPackages_dPkg_dcontextPackageOf dtb__81)))
  | _ -> failwith "DT: impossible branch"
))

let v_Vuna_dCompiler_dDriver_dCompilerCli_dcompilePkgDir = (fun printResult dir outDir -> (match ((v_Vuna_dCompiler_dDriver_dCompilerCli_dexecutablePackage "compile") dir) with
  | Vuna_dCompiler_dDiag.C_Vuna_dCompiler_dDiag_dCheck_ErrC (dtb__84) -> (v_Vuna_dCompiler_dDriver_dCompilerCli_dprintDiag dtb__84)
  | Vuna_dCompiler_dDiag.C_Vuna_dCompiler_dDiag_dCheck_OkC (dtb__85) -> ((fun _u -> (match ((((Vuna_dCompiler_dDriver_dCompile.v_Vuna_dCompiler_dDriver_dCompile_dcompileToDir (Vuna_dCompiler_dPackages_dPkg.v_Vuna_dCompiler_dPackages_dPkg_dpackageContext dtb__85)) (Vuna_dCompiler_dPackages_dPkg.v_Vuna_dCompiler_dPackages_dPkg_dpackageEntry dtb__85)) printResult) outDir) with
  | Vuna_dCompiler_dDiag.C_Vuna_dCompiler_dDiag_dCheck_ErrC (dtb__86) -> (v_Vuna_dCompiler_dDriver_dCompilerCli_dprintDiag dtb__86)
  | Vuna_dCompiler_dDiag.C_Vuna_dCompiler_dDiag_dCheck_OkC (dtb__87) -> ((v_Vuna_dCompiler_dDriver_dCompilerCli_dfinishWarningsDir outDir) 0)
  | _ -> failwith "DT: impossible branch"
)) (v_Vuna_dCompiler_dDriver_dCompilerCli_dapplyDiagConfig (Base_dMaybe.C_Base_dMaybe_dMaybe_Just (dtb__85))))
  | _ -> failwith "DT: impossible branch"
))

let v_Vuna_dCompiler_dDriver_dCompilerCli_dcompileRun = (fun printResult entry outDir -> (if (Base_dEff.v_Base_dEff_drunPure ((fun dtio_0 -> Base_dEff.C_Base_dEff_dEff_MkEff (fun (_ : Base_dEff.t_Base_dEff_dEffUnit) -> dtp_fileExists dtio_0)) entry)) then (if (Base_dEff.v_Base_dEff_drunPure ((fun dtio_0 -> Base_dEff.C_Base_dEff_dEff_MkEff (fun (_ : Base_dEff.t_Base_dEff_dEffUnit) -> dtp_isDirectory dtio_0)) entry)) then (((v_Vuna_dCompiler_dDriver_dCompilerCli_dcompilePkgDir printResult) entry) outDir) else (((v_Vuna_dCompiler_dDriver_dCompilerCli_dcompileFileEntry printResult) entry) outDir)) else (v_Vuna_dCompiler_dDriver_dCompilerCli_ddtPathErr entry)))

let v_Vuna_dCompiler_dDriver_dCompilerCli_dcompileFinish = (fun mc0 mc1 mc2 mc3 -> (match mc2 with
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Just (dtb__88) -> (match mc3 with
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing -> (v_Vuna_dCompiler_dDriver_dCompilerCli_dusageErr mc0)
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Just (dtb__89) -> (((v_Vuna_dCompiler_dDriver_dCompilerCli_dcompileRun mc1) dtb__88) dtb__89)
  | _ -> failwith "DT: impossible branch"
)
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing -> (v_Vuna_dCompiler_dDriver_dCompilerCli_dusageErr mc0)
  | _ -> failwith "DT: impossible branch"
))

let rec v_Vuna_dCompiler_dDriver_dCompilerCli_dcompileParse = (fun prog printResult entry outDir args -> ((fun nd_uscrut5 -> (match nd_uscrut5 with
  | Base_dList.C_Base_dList_dList_Cons (dtb__90, dtb__91) -> (if (dtb__90 = "--no-print") then (((((v_Vuna_dCompiler_dDriver_dCompilerCli_dcompileParse prog) false) entry) outDir) dtb__91) else (if (dtb__90 = "--release") then (((((v_Vuna_dCompiler_dDriver_dCompilerCli_dcompileParse prog) printResult) entry) outDir) dtb__91) else (if ((Base_dString.v_Base_dString_dstartsWith "-") dtb__90) then ((v_Vuna_dCompiler_dDriver_dCompilerCli_dremovedFlag prog) dtb__90) else (match entry with
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing -> (((((v_Vuna_dCompiler_dDriver_dCompilerCli_dcompileParse prog) printResult) (Base_dMaybe.C_Base_dMaybe_dMaybe_Just (dtb__90))) outDir) dtb__91)
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Just (dtb__92) -> (match outDir with
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing -> (((((v_Vuna_dCompiler_dDriver_dCompilerCli_dcompileParse prog) printResult) entry) (Base_dMaybe.C_Base_dMaybe_dMaybe_Just (dtb__90))) dtb__91)
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Just (dtb__93) -> (v_Vuna_dCompiler_dDriver_dCompilerCli_dusageErr prog)
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
))))
  | Base_dList.C_Base_dList_dList_Nil -> ((((v_Vuna_dCompiler_dDriver_dCompilerCli_dcompileFinish prog) printResult) entry) outDir)
  | _ -> failwith "DT: impossible branch"
)) args))

let v_Vuna_dCompiler_dDriver_dCompilerCli_dcompileArgs = (fun prog args -> (((((v_Vuna_dCompiler_dDriver_dCompilerCli_dcompileParse prog) true) Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing) Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing) args))

let v_Vuna_dCompiler_dDriver_dCompilerCli_dcontinueOnErrorRef = (Base_dEff.v_Base_dEff_drunPure (Base_dIORef.v_Base_dIORef_dnewRef false))

let v_Vuna_dCompiler_dDriver_dCompilerCli_dcheckEntryFile = (fun ctx path -> (match ((Vuna_dCompiler_dDriver_dDt.v_Vuna_dCompiler_dDriver_dDt_ddtCheck ctx) path) with
  | Vuna_dCompiler_dDiag.C_Vuna_dCompiler_dDiag_dCheck_ErrC (dtb__94) -> (if (Base_dEff.v_Base_dEff_drunPure (Base_dIORef.v_Base_dIORef_dreadRef v_Vuna_dCompiler_dDriver_dCompilerCli_dcontinueOnErrorRef)) then (match ((Vuna_dCompiler_dDriver_dDt.v_Vuna_dCompiler_dDriver_dDt_ddtCheckRecovering ctx) path) with
  | Vuna_dCompiler_dDiag.C_Vuna_dCompiler_dDiag_dCheck_OkC (dtb__95) -> ((fun shown -> ((fun _u -> (if ((Base_dList.v_Base_dList_dlength shown) = 0) then (v_Vuna_dCompiler_dDriver_dCompilerCli_dprintDiag dtb__94) else 1)) ((v_Vuna_dCompiler_dDriver_dCompilerCli_dprintDiagList "") shown))) ((v_Vuna_dCompiler_dDriver_dCompilerCli_dtakeDiags (Base_dEff.v_Base_dEff_drunPure (Base_dIORef.v_Base_dIORef_dreadRef v_Vuna_dCompiler_dDriver_dCompilerCli_dmaxErrorsRef))) dtb__95))
  | Vuna_dCompiler_dDiag.C_Vuna_dCompiler_dDiag_dCheck_ErrC (dtb__96) -> (v_Vuna_dCompiler_dDriver_dCompilerCli_dprintDiag dtb__94)
  | _ -> failwith "DT: impossible branch"
) else (v_Vuna_dCompiler_dDriver_dCompilerCli_dprintDiag dtb__94))
  | Vuna_dCompiler_dDiag.C_Vuna_dCompiler_dDiag_dCheck_OkC (dtb__97) -> ((fun ws -> ((fun shown -> ((fun _u -> (if (if (v_Vuna_dCompiler_dDriver_dCompilerCli_ddenyWarningsOn 0) then ((Base_dList.v_Base_dList_dlength ws) > 0) else false) then 1 else 0)) ((v_Vuna_dCompiler_dDriver_dCompilerCli_dprintDiagList "") shown))) (if (if (v_Vuna_dCompiler_dDriver_dCompilerCli_dshowWarningsOn 0) then true else (v_Vuna_dCompiler_dDriver_dCompilerCli_ddenyWarningsOn 0)) then ws else Base_dList.C_Base_dList_dList_Nil))) ((Base_dList.v_Base_dList_dfilter (v_Vuna_dCompiler_dDriver_dCompilerCli_downedByFile path)) (Vuna_dCompiler_dDiagnostics_dSink.v_Vuna_dCompiler_dDiagnostics_dSink_dtakeWarnings 0)))
  | _ -> failwith "DT: impossible branch"
))

let v_Vuna_dCompiler_dDriver_dCompilerCli_dcheckFileEntry = (fun path -> (match (Vuna_dCompiler_dPackages_dPkg.v_Vuna_dCompiler_dPackages_dPkg_dcontextForFile path) with
  | Vuna_dCompiler_dDiag.C_Vuna_dCompiler_dDiag_dCheck_ErrC (dtb__98) -> (v_Vuna_dCompiler_dDriver_dCompilerCli_dprintDiag dtb__98)
  | Vuna_dCompiler_dDiag.C_Vuna_dCompiler_dDiag_dCheck_OkC (dtb__99) -> ((fun _u -> (if ((v_Vuna_dCompiler_dDriver_dCompilerCli_disModuleFileEntry dtb__99) path) then ((v_Vuna_dCompiler_dDriver_dCompilerCli_dcheckModuleFileEntry dtb__99) path) else ((v_Vuna_dCompiler_dDriver_dCompilerCli_dcheckEntryFile dtb__99) path))) (v_Vuna_dCompiler_dDriver_dCompilerCli_dapplyDiagConfig (Vuna_dCompiler_dPackages_dPkg.v_Vuna_dCompiler_dPackages_dPkg_dcontextPackageOf dtb__99)))
  | _ -> failwith "DT: impossible branch"
))

let rec v_Vuna_dCompiler_dDriver_dCompilerCli_dstripContinueGo = (fun mc0 mc1 mc2 -> (match mc0 with
  | Base_dList.C_Base_dList_dList_Cons (dtb__100, dtb__101) -> (if (dtb__100 = "--continue-on-error") then (((v_Vuna_dCompiler_dDriver_dCompilerCli_dstripContinueGo dtb__101) mc1) true) else (((v_Vuna_dCompiler_dDriver_dCompilerCli_dstripContinueGo dtb__101) (Base_dList.C_Base_dList_dList_Cons (dtb__100, mc1))) mc2))
  | Base_dList.C_Base_dList_dList_Nil -> { Base_dPair.f_Base_dPair_dPair_first = (Base_dList.v_Base_dList_dreverse mc1); Base_dPair.f_Base_dPair_dPair_second = mc2 }
  | _ -> failwith "DT: impossible branch"
))

let v_Vuna_dCompiler_dDriver_dCompilerCli_dstripContinueOnError = (fun args -> (((v_Vuna_dCompiler_dDriver_dCompilerCli_dstripContinueGo args) Base_dList.C_Base_dList_dList_Nil) false))

let v_Vuna_dCompiler_dDriver_dCompilerCli_dprintRecovered = (fun pkg e ds -> ((fun shown -> ((fun _u -> (if ((Base_dList.v_Base_dList_dlength shown) = 0) then ((v_Vuna_dCompiler_dDriver_dCompilerCli_dprintDiagWithPrefix (String.concat "" ["["; (Vuna_dCompiler_dPackages_dPkg.v_Vuna_dCompiler_dPackages_dPkg_dpackageName pkg); "] "])) e) else 1)) ((v_Vuna_dCompiler_dDriver_dCompilerCli_dprintDiagList (String.concat "" ["["; (Vuna_dCompiler_dPackages_dPkg.v_Vuna_dCompiler_dPackages_dPkg_dpackageName pkg); "] "])) shown))) ((v_Vuna_dCompiler_dDriver_dCompilerCli_dtakeDiags (Base_dEff.v_Base_dEff_drunPure (Base_dIORef.v_Base_dIORef_dreadRef v_Vuna_dCompiler_dDriver_dCompilerCli_dmaxErrorsRef))) ds)))

let v_Vuna_dCompiler_dDriver_dCompilerCli_dpackageRecoverExe = (fun pkg e -> (match ((Vuna_dCompiler_dDriver_dDt.v_Vuna_dCompiler_dDriver_dDt_ddtCheckRecovering (Vuna_dCompiler_dPackages_dPkg.v_Vuna_dCompiler_dPackages_dPkg_dpackageContext pkg)) (Vuna_dCompiler_dPackages_dPkg.v_Vuna_dCompiler_dPackages_dPkg_dpackageEntry pkg)) with
  | Vuna_dCompiler_dDiag.C_Vuna_dCompiler_dDiag_dCheck_OkC (dtb__102) -> (((v_Vuna_dCompiler_dDriver_dCompilerCli_dprintRecovered pkg) e) dtb__102)
  | Vuna_dCompiler_dDiag.C_Vuna_dCompiler_dDiag_dCheck_ErrC (dtb__103) -> ((v_Vuna_dCompiler_dDriver_dCompilerCli_dprintDiagWithPrefix (String.concat "" ["["; (Vuna_dCompiler_dPackages_dPkg.v_Vuna_dCompiler_dPackages_dPkg_dpackageName pkg); "] "])) dtb__103)
  | _ -> failwith "DT: impossible branch"
))

let v_Vuna_dCompiler_dDriver_dCompilerCli_dpackageRecoverLib = (fun pkg e -> (match (Vuna_dCompiler_dPackages_dPkg.v_Vuna_dCompiler_dPackages_dPkg_dpackageExports pkg) with
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Just (dtb__104) -> (match ((Vuna_dCompiler_dDriver_dDt.v_Vuna_dCompiler_dDriver_dDt_ddtCheckLibraryRecovering (Vuna_dCompiler_dPackages_dPkg.v_Vuna_dCompiler_dPackages_dPkg_dpackageContext pkg)) dtb__104) with
  | Vuna_dCompiler_dDiag.C_Vuna_dCompiler_dDiag_dCheck_OkC (dtb__105) -> (((v_Vuna_dCompiler_dDriver_dCompilerCli_dprintRecovered pkg) e) dtb__105)
  | Vuna_dCompiler_dDiag.C_Vuna_dCompiler_dDiag_dCheck_ErrC (dtb__106) -> ((v_Vuna_dCompiler_dDriver_dCompilerCli_dprintDiagWithPrefix (String.concat "" ["["; (Vuna_dCompiler_dPackages_dPkg.v_Vuna_dCompiler_dPackages_dPkg_dpackageName pkg); "] "])) dtb__106)
  | _ -> failwith "DT: impossible branch"
)
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing -> ((v_Vuna_dCompiler_dDriver_dCompilerCli_dprintDiagWithPrefix (String.concat "" ["["; (Vuna_dCompiler_dPackages_dPkg.v_Vuna_dCompiler_dPackages_dPkg_dpackageName pkg); "] "])) e)
  | _ -> failwith "DT: impossible branch"
))

let v_Vuna_dCompiler_dDriver_dCompilerCli_dpackageRecover = (fun pkg e -> (if (Base_dEff.v_Base_dEff_drunPure ((fun dtio_0 -> Base_dEff.C_Base_dEff_dEff_MkEff (fun (_ : Base_dEff.t_Base_dEff_dEffUnit) -> dtp_fileExists dtio_0)) (Vuna_dCompiler_dPackages_dPkg.v_Vuna_dCompiler_dPackages_dPkg_dpackageEntry pkg))) then ((v_Vuna_dCompiler_dDriver_dCompilerCli_dpackageRecoverExe pkg) e) else ((v_Vuna_dCompiler_dDriver_dCompilerCli_dpackageRecoverLib pkg) e)))

let v_Vuna_dCompiler_dDriver_dCompilerCli_dcheckPackageErr = (fun pkg e -> (if (Base_dEff.v_Base_dEff_drunPure (Base_dIORef.v_Base_dIORef_dreadRef v_Vuna_dCompiler_dDriver_dCompilerCli_dcontinueOnErrorRef)) then ((v_Vuna_dCompiler_dDriver_dCompilerCli_dpackageRecover pkg) e) else ((v_Vuna_dCompiler_dDriver_dCompilerCli_dprintDiagWithPrefix (String.concat "" ["["; (Vuna_dCompiler_dPackages_dPkg.v_Vuna_dCompiler_dPackages_dPkg_dpackageName pkg); "] "])) e)))

let v_Vuna_dCompiler_dDriver_dCompilerCli_dcheckPackageSeq = (fun pkg code -> ((fun _u -> ((fun wantWarnings -> ((fun c -> (if (c > code) then c else code)) (match ((Vuna_dCompiler_dDriver_dCompile.v_Vuna_dCompiler_dDriver_dCompile_dcheckPackage wantWarnings) pkg) with
  | Vuna_dCompiler_dDiag.C_Vuna_dCompiler_dDiag_dCheck_ErrC (dtb__107) -> ((v_Vuna_dCompiler_dDriver_dCompilerCli_dcheckPackageErr pkg) dtb__107)
  | Vuna_dCompiler_dDiag.C_Vuna_dCompiler_dDiag_dCheck_OkC (dtb__108) -> ((fun ws -> ((fun shown -> ((fun _u -> ((fun failed -> failed) (if (if (v_Vuna_dCompiler_dDriver_dCompilerCli_ddenyWarningsOn 0) then ((Base_dList.v_Base_dList_dlength ws) > 0) else false) then 1 else 0))) ((v_Vuna_dCompiler_dDriver_dCompilerCli_dprintDiagList (String.concat "" ["["; (Vuna_dCompiler_dPackages_dPkg.v_Vuna_dCompiler_dPackages_dPkg_dpackageName pkg); "] "])) shown))) (if (if (v_Vuna_dCompiler_dDriver_dCompilerCli_dshowWarningsOn 0) then true else (v_Vuna_dCompiler_dDriver_dCompilerCli_ddenyWarningsOn 0)) then ws else Base_dList.C_Base_dList_dList_Nil))) ((Base_dList.v_Base_dList_dfilter (v_Vuna_dCompiler_dDriver_dCompilerCli_downedByPackage pkg)) (Vuna_dCompiler_dDiagnostics_dSink.v_Vuna_dCompiler_dDiagnostics_dSink_dtakeWarnings 0)))
  | _ -> failwith "DT: impossible branch"
))) (if (v_Vuna_dCompiler_dDriver_dCompilerCli_dshowWarningsOn 0) then true else (v_Vuna_dCompiler_dDriver_dCompilerCli_ddenyWarningsOn 0)))) (v_Vuna_dCompiler_dDriver_dCompilerCli_dapplyDiagConfig (Base_dMaybe.C_Base_dMaybe_dMaybe_Just (pkg)))))

let rec v_Vuna_dCompiler_dDriver_dCompilerCli_dcheckRootsSeq = (fun mc0 mc1 -> (match mc0 with
  | Base_dList.C_Base_dList_dList_Cons (dtb__109, dtb__110) -> ((v_Vuna_dCompiler_dDriver_dCompilerCli_dcheckRootsSeq dtb__110) ((v_Vuna_dCompiler_dDriver_dCompilerCli_dcheckPackageSeq dtb__109) mc1))
  | Base_dList.C_Base_dList_dList_Nil -> mc1
  | _ -> failwith "DT: impossible branch"
))

let v_Vuna_dCompiler_dDriver_dCompilerCli_dcheckPackages = (fun mc0 mc1 -> (match mc0 with
  | Base_dList.C_Base_dList_dList_Cons (dtb__111, dtb__112) -> (match dtb__112 with
  | Base_dList.C_Base_dList_dList_Nil -> ((v_Vuna_dCompiler_dDriver_dCompilerCli_dcheckPackageSeq dtb__111) mc1)
  | _ -> ((fun members -> ((fun roots -> ((fun started -> ((fun code1 -> ((fun codes -> ((v_Vuna_dCompiler_dDriver_dCompilerCli_dcountFailures code1) codes)) ((Base_dList.v_Base_dList_dmap (fun pr -> (Base_dEff.v_Base_dEff_drunPure ((fun dtio_0 -> Base_dEff.C_Base_dEff_dEff_MkEff (fun (_ : Base_dEff.t_Base_dEff_dEffUnit) -> dtp_wait dtio_0)) (Base_dPair.v_Base_dPair_dsecondOf pr))))) started))) ((v_Vuna_dCompiler_dDriver_dCompilerCli_dcheckRootsSeq roots) mc1))) ((Base_dList.v_Base_dList_dmap (fun pkg -> { Base_dPair.f_Base_dPair_dPair_first = pkg; Base_dPair.f_Base_dPair_dPair_second = (Base_dEff.v_Base_dEff_drunPure ((fun dtio_0 -> Base_dEff.C_Base_dEff_dEff_MkEff (fun (_ : Base_dEff.t_Base_dEff_dEffUnit) -> (fun args -> dtp_spawn (Base_dList.dtp_ocamlOf args)) dtio_0)) (v_Vuna_dCompiler_dDriver_dCompilerCli_dcheckSpawnArgs (Vuna_dCompiler_dPackages_dPkg.v_Vuna_dCompiler_dPackages_dPkg_dpackageDir pkg)))) })) members))) ((Base_dList.v_Base_dList_dfilter (fun pkg -> (v_Vuna_dCompiler_dDriver_dCompilerCli_disWorkspaceRoot pkg))) mc0))) ((Base_dList.v_Base_dList_dfilter (fun pkg -> (Base_dBool.v_Base_dBool_dnot (v_Vuna_dCompiler_dDriver_dCompilerCli_disWorkspaceRoot pkg)))) mc0))
)
  | Base_dList.C_Base_dList_dList_Nil -> mc1
  | _ -> failwith "DT: impossible branch"
))

let v_Vuna_dCompiler_dDriver_dCompilerCli_dcheckPkgDir = (fun dir -> (match (Vuna_dCompiler_dPackages_dPkg.v_Vuna_dCompiler_dPackages_dPkg_dworkspacePackages dir) with
  | Vuna_dCompiler_dDiag.C_Vuna_dCompiler_dDiag_dCheck_ErrC (dtb__113) -> (v_Vuna_dCompiler_dDriver_dCompilerCli_dprintDiag dtb__113)
  | Vuna_dCompiler_dDiag.C_Vuna_dCompiler_dDiag_dCheck_OkC (dtb__114) -> ((v_Vuna_dCompiler_dDriver_dCompilerCli_dcheckPackages dtb__114) 0)
  | _ -> failwith "DT: impossible branch"
))

let v_Vuna_dCompiler_dDriver_dCompilerCli_dcheckEmit = (fun path -> (if (Base_dEff.v_Base_dEff_drunPure ((fun dtio_0 -> Base_dEff.C_Base_dEff_dEff_MkEff (fun (_ : Base_dEff.t_Base_dEff_dEffUnit) -> dtp_fileExists dtio_0)) path)) then (if (Base_dEff.v_Base_dEff_drunPure ((fun dtio_0 -> Base_dEff.C_Base_dEff_dEff_MkEff (fun (_ : Base_dEff.t_Base_dEff_dEffUnit) -> dtp_isDirectory dtio_0)) path)) then (v_Vuna_dCompiler_dDriver_dCompilerCli_dcheckPkgDir path) else (v_Vuna_dCompiler_dDriver_dCompilerCli_dcheckFileEntry path)) else (v_Vuna_dCompiler_dDriver_dCompilerCli_ddtPathErr path)))

let rec v_Vuna_dCompiler_dDriver_dCompilerCli_dcheckArgs = (fun mc0 mc1 -> (match mc1 with
  | Base_dList.C_Base_dList_dList_Cons (dtb__115, dtb__116) -> (if (dtb__115 = "--release") then ((v_Vuna_dCompiler_dDriver_dCompilerCli_dcheckArgs mc0) dtb__116) else (if ((Base_dString.v_Base_dString_dstartsWith "-") dtb__115) then ((v_Vuna_dCompiler_dDriver_dCompilerCli_dremovedFlag mc0) dtb__115) else (match dtb__116 with
  | Base_dList.C_Base_dList_dList_Nil -> (v_Vuna_dCompiler_dDriver_dCompilerCli_dcheckEmit dtb__115)
  | _ -> (v_Vuna_dCompiler_dDriver_dCompilerCli_dusageErr mc0)
)))
  | Base_dList.C_Base_dList_dList_Nil -> (v_Vuna_dCompiler_dDriver_dCompilerCli_dusageErr mc0)
  | _ -> failwith "DT: impossible branch"
))

let v_Vuna_dCompiler_dDriver_dCompilerCli_drunCompilerCliFor1 = (fun prog args -> (match args with
  | Base_dList.C_Base_dList_dList_Nil -> (v_Vuna_dCompiler_dDriver_dCompilerCli_dusageErr prog)
  | Base_dList.C_Base_dList_dList_Cons (dtb__117, dtb__118) -> (if (dtb__117 = "compile") then ((v_Vuna_dCompiler_dDriver_dCompilerCli_dcompileArgs prog) dtb__118) else (if (dtb__117 = "check") then ((v_Vuna_dCompiler_dDriver_dCompilerCli_dcheckArgs prog) dtb__118) else (if (dtb__117 = "build") then ((v_Vuna_dCompiler_dDriver_dCompilerCli_dbuildArgs prog) dtb__118) else (if (dtb__117 = "version") then (v_Vuna_dCompiler_dDriver_dCompilerCli_dprintVersion 0) else (if (dtb__117 = "--version") then (v_Vuna_dCompiler_dDriver_dCompilerCli_dprintVersion 0) else (if (dtb__117 = "seed") then (((v_Vuna_dCompiler_dDriver_dCompilerCli_dremovedCommand prog) "seed") "use `build --out OUT [DIR]` or `compile DIR OUT`") else (if (dtb__117 = "help") then (v_Vuna_dCompiler_dDriver_dCompilerCli_dhelpFor prog) else (if ((Base_dString.v_Base_dString_dstartsWith "-") dtb__117) then ((v_Vuna_dCompiler_dDriver_dCompilerCli_dremovedFlag prog) dtb__117) else ((v_Vuna_dCompiler_dDriver_dCompilerCli_dunknownCommand prog) dtb__117)))))))))
  | _ -> failwith "DT: impossible branch"
))

let v_Vuna_dCompiler_dDriver_dCompilerCli_drunCompilerCliFor = (fun prog args -> ((fun stripped -> ((fun strippedLang -> ((fun strippedMax -> ((fun _u -> ((fun kept -> ((fun strippedContinue -> ((fun _u -> ((fun _u -> ((fun _u -> ((fun _u -> ((fun _u -> ((fun _u -> ((fun _u -> ((fun _u -> ((fun _u -> ((fun _u -> ((fun _u -> (if (v_Vuna_dCompiler_dDriver_dCompilerCli_danyHelp (Base_dPair.v_Base_dPair_dfirstOf strippedContinue)) then (v_Vuna_dCompiler_dDriver_dCompilerCli_dhelpFor prog) else (v_Vuna_dCompiler_dDriver_dCompilerCli_dflushSarif ((v_Vuna_dCompiler_dDriver_dCompilerCli_drunCompilerCliFor1 prog) (Base_dPair.v_Base_dPair_dfirstOf strippedContinue))))) (Base_dEff.v_Base_dEff_drunPure ((Base_dIORef.v_Base_dIORef_dwriteRef v_Vuna_dCompiler_dDriver_dCompilerCli_dcontinueOnErrorRef) (Base_dPair.v_Base_dPair_dsecondOf strippedContinue))))) (Base_dEff.v_Base_dEff_drunPure ((Base_dIORef.v_Base_dIORef_dwriteRef v_Vuna_dCompiler_dDriver_dCompilerCli_dwarningsExplicitRef) (if (v_Vuna_dCompiler_dDriver_dCompilerCli_dhasDenyWarnings args) then true else (v_Vuna_dCompiler_dDriver_dCompilerCli_dhasShowWarnings args)))))) (Base_dEff.v_Base_dEff_drunPure ((Base_dIORef.v_Base_dIORef_dwriteRef v_Vuna_dCompiler_dDriver_dCompilerCli_ddenyExplicitRef) (v_Vuna_dCompiler_dDriver_dCompilerCli_dhasDenyWarnings args))))) (Base_dEff.v_Base_dEff_drunPure ((Base_dIORef.v_Base_dIORef_dwriteRef v_Vuna_dCompiler_dDriver_dCompilerCli_dlangExplicitRef) (v_Vuna_dCompiler_dDriver_dCompilerCli_dhasLangFlag args))))) (Base_dEff.v_Base_dEff_drunPure ((Base_dIORef.v_Base_dIORef_dwriteRef v_Vuna_dCompiler_dDriver_dCompilerCli_dformatExplicitRef) (v_Vuna_dCompiler_dDriver_dCompilerCli_dhasFormatFlag args))))) (Base_dEff.v_Base_dEff_drunPure ((Base_dIORef.v_Base_dIORef_dwriteRef v_Vuna_dCompiler_dDriver_dCompilerCli_dshowWarningsRef) (if (v_Vuna_dCompiler_dDriver_dCompilerCli_dhasDenyWarnings args) then true else (v_Vuna_dCompiler_dDriver_dCompilerCli_dhasShowWarnings args)))))) (Base_dEff.v_Base_dEff_drunPure ((Base_dIORef.v_Base_dIORef_dwriteRef v_Vuna_dCompiler_dDriver_dCompilerCli_ddenyWarningsRef) (v_Vuna_dCompiler_dDriver_dCompilerCli_dhasDenyWarnings args))))) (v_Vuna_dCompiler_dDriver_dCompilerCli_dresetSarif 0))) (if ((Base_dPair.v_Base_dPair_dsecondOf strippedMax) > 0) then (Base_dEff.v_Base_dEff_drunPure ((Base_dIORef.v_Base_dIORef_dwriteRef v_Vuna_dCompiler_dDriver_dCompilerCli_dmaxErrorsRef) (Base_dPair.v_Base_dPair_dsecondOf strippedMax))) else 0))) (if ((Base_dPair.v_Base_dPair_dsecondOf strippedLang) = "en") then 0 else (if (((Base_dEq.v_Base_dEq_deq (Base_dMaybe.v_Eq_uBase_uMaybe_uMaybe_ua Base_dString.v_Eq_uString)) (Base_dPair.v_Base_dPair_dsecondOf stripped)) Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing) then (Base_dEff.v_Base_dEff_drunPure ((Base_dIORef.v_Base_dIORef_dwriteRef v_Vuna_dCompiler_dDriver_dCompilerCli_ddiagFormatRef) "human")) else 0)))) (Vuna_dCompiler_dDiag_dFormat.v_Vuna_dCompiler_dDiag_dFormat_dsetDiagLang (Base_dPair.v_Base_dPair_dsecondOf strippedLang)))) (v_Vuna_dCompiler_dDriver_dCompilerCli_dstripContinueOnError kept))) (v_Vuna_dCompiler_dDriver_dCompilerCli_dstripDenyWarnings (Base_dPair.v_Base_dPair_dfirstOf strippedMax)))) (match (Base_dPair.v_Base_dPair_dsecondOf stripped) with
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Just (dtb__119) -> (Base_dEff.v_Base_dEff_drunPure ((Base_dIORef.v_Base_dIORef_dwriteRef v_Vuna_dCompiler_dDriver_dCompilerCli_ddiagFormatRef) dtb__119))
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing -> 0
  | _ -> failwith "DT: impossible branch"
))) (v_Vuna_dCompiler_dDriver_dCompilerCli_dstripMaxErrors (Base_dPair.v_Base_dPair_dfirstOf strippedLang)))) (v_Vuna_dCompiler_dDriver_dCompilerCli_dstripLang (Base_dPair.v_Base_dPair_dfirstOf stripped)))) (v_Vuna_dCompiler_dDriver_dCompilerCli_dstripDiagFormat args)))

let v_Vuna_dCompiler_dDriver_dCompilerCli_drunCompilerCli = (fun args -> ((v_Vuna_dCompiler_dDriver_dCompilerCli_drunCompilerCliFor "vuna-compiler") args))
