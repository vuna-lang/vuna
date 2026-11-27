open Vuna_runtime
type t_CliOpts = { f_CliOpts_optDiagFormat : string; f_CliOpts_optDiagLang : string; f_CliOpts_optLangExplicit : bool; f_CliOpts_optDenyWarnings : bool; f_CliOpts_optShowWarnings : bool; f_CliOpts_optFormatExplicit : bool; f_CliOpts_optWarningsExplicit : bool; f_CliOpts_optDenyExplicit : bool; f_CliOpts_optMaxErrors : int; f_CliOpts_optContinueOnError : bool; f_CliOpts_optSarifItems : Base_dDiag.t_Diagnostic B_dData_dList.t_List; f_CliOpts_optRelease : bool; f_CliOpts_optShowCascade : bool; f_CliOpts_optWithSources : bool; f_CliOpts_optFailFast : bool; f_CliOpts_optTarget : string; f_CliOpts_optWasmOpt : int; f_CliOpts_optExplain : bool }

# 43 "Vuna/Compiler/Driver/CompilerCli.vuna"
let v_compilerUsageLines = (fun (dtb_u_u1 : string) -> (String.concat "" ["  "; dtb_u_u1; " compile [--no-print] [--release] [--target ocaml|wasm|native] (<entry.vuna> | <package-dir>) <out-dir>\n  "; dtb_u_u1; " check [--release] [--continue-on-error] (<file.vuna> | <package-dir>)\n  <file.vuna>            \229\184\166 module \229\164\180\230\151\182\230\140\137\229\186\147\230\168\161\229\157\151\230\163\128\230\159\165\239\188\136\229\140\133\228\184\138\228\184\139\230\150\135\239\188\137\239\188\140\229\144\166\229\136\153\230\140\137\229\133\165\229\143\163\230\150\135\228\187\182\n  "; dtb_u_u1; " build [--release] [--no-compile] [--out DIR] [--package NAME] [--target ocaml|wasm|native] [--wasm-opt N] [DIR]\n  --no-print             \231\188\150\232\175\145\231\148\159\230\136\144\231\154\132\231\168\139\229\186\143\228\184\141\230\137\147\229\141\176 main \231\187\147\230\158\156\239\188\136\233\187\152\232\174\164\230\137\147\229\141\176\239\188\137\n  --release              \229\143\145\229\184\131\230\158\132\229\187\186\239\188\154\230\139\146\231\187\157 assert / todo \231\173\137\232\176\131\232\175\149\228\184\147\231\148\168\230\158\132\233\128\160\n  --wasm-opt N           wasm \228\186\167\231\137\169\231\154\132 binaryen \228\188\152\229\140\150\231\186\167\229\136\171\239\188\1360\226\128\1473\239\188\140\233\187\152\232\174\164 3\239\188\1550 = \228\184\141\228\188\152\229\140\150\239\188\137\n  --continue-on-error    \229\164\154\233\148\153\232\175\175\239\188\154\233\128\144\228\184\170\229\174\154\228\185\137\230\148\182\233\155\134\239\188\136\229\164\177\232\180\165\229\174\154\228\185\137\229\155\158\230\187\154\229\144\142\232\183\179\232\191\135\239\188\155\228\187\133\229\133\165\229\143\163\230\150\135\228\187\182\230\136\150\229\186\147\229\140\133\239\188\137\n  "; dtb_u_u1; " version, --version  \230\152\190\231\164\186\231\137\136\230\156\172\n  "; dtb_u_u1; " help, -h\n"]))

# 56 "Vuna/Compiler/Driver/CompilerCli.vuna"
let v_compilerUsage = (fun (dtb_u_u2 : string) -> ("usage:\n" ^ (v_compilerUsageLines dtb_u_u2)))

# 60 "Vuna/Compiler/Driver/CompilerCli.vuna"
let rec v_mapEff = (fun dtb_u_u6 dtb_u_u7 -> (match dtb_u_u7 with
  | B_dData_dList.C_List__x58__x58_ (dtb_u_u8, dtb_u_u9) -> (Obj.repr ((fun (dtb_u_u14 : B_dEffect_dCore.t_EffUnit) -> (let dtb_u_u15 = Obj.obj ((dtb_u_u6 dtb_u_u8)) in (let dtb_u_u17 = (dtb_u_u15 dtb_u_u14) in (let dtb_u_u25 = (((v_mapEff_u_udirect dtb_u_u6) dtb_u_u9) dtb_u_u14) in (let dtb_u_u27 = (B_dData_dList.C_List__x58__x58_ (dtb_u_u17, dtb_u_u25)) in dtb_u_u27)))))))
  | B_dData_dList.C_List_Nil -> (let dtb_u_u30 = B_dData_dList.C_List_Nil in (Obj.repr ((fun (dtb_u_u31 : B_dEffect_dCore.t_EffUnit) -> dtb_u_u30))))
  | _ -> failwith "DT: impossible branch"
))
# 60 "Vuna/Compiler/Driver/CompilerCli.vuna"
and v_mapEff_u_udirect = (fun mc0 mc1 _u_ueffTok -> (match mc1 with
  | B_dData_dList.C_List__x58__x58_ (dtb_u_u8, dtb_u_u9) -> (let dtb_u_u15 = Obj.obj ((mc0 dtb_u_u8)) in (let dtb_u_u17 = (dtb_u_u15 _u_ueffTok) in (let dtb_u_u25 = (((v_mapEff_u_udirect mc0) dtb_u_u9) _u_ueffTok) in (let dtb_u_u27 = (B_dData_dList.C_List__x58__x58_ (dtb_u_u17, dtb_u_u25)) in dtb_u_u27))))
  | B_dData_dList.C_List_Nil -> (let dtb_u_u30 = B_dData_dList.C_List_Nil in dtb_u_u30)
  | _ -> failwith "DT: impossible branch"
))

# 93 "Vuna/Compiler/Driver/CompilerCli.vuna"
let v_defaultCliOpts = { f_CliOpts_optDiagFormat = "short"; f_CliOpts_optDiagLang = "en"; f_CliOpts_optLangExplicit = false; f_CliOpts_optDenyWarnings = false; f_CliOpts_optShowWarnings = false; f_CliOpts_optFormatExplicit = false; f_CliOpts_optWarningsExplicit = false; f_CliOpts_optDenyExplicit = false; f_CliOpts_optMaxErrors = 20; f_CliOpts_optContinueOnError = false; f_CliOpts_optSarifItems = B_dData_dList.C_List_Nil; f_CliOpts_optRelease = false; f_CliOpts_optShowCascade = false; f_CliOpts_optWithSources = false; f_CliOpts_optFailFast = false; f_CliOpts_optTarget = "ocaml"; f_CliOpts_optWasmOpt = 3; f_CliOpts_optExplain = false }

# 116 "Vuna/Compiler/Driver/CompilerCli.vuna"
let v_markRelease = (fun (dtb_u_u32 : t_CliOpts) -> { dtb_u_u32 with f_CliOpts_optRelease = true })

# 120 "Vuna/Compiler/Driver/CompilerCli.vuna"
let v_markExplain = (fun (dtb_u_u33 : t_CliOpts) -> { dtb_u_u33 with f_CliOpts_optExplain = true })

# 124 "Vuna/Compiler/Driver/CompilerCli.vuna"
let v_markWasmOpt = (fun (dtb_u_u34 : int) (dtb_u_u35 : t_CliOpts) -> { dtb_u_u35 with f_CliOpts_optWasmOpt = dtb_u_u34 })

# 128 "Vuna/Compiler/Driver/CompilerCli.vuna"
let v_markTarget = (fun (dtb_u_u36 : string) (dtb_u_u37 : t_CliOpts) -> { f_CliOpts_optDiagFormat = (dtb_u_u37).f_CliOpts_optDiagFormat; f_CliOpts_optDiagLang = (dtb_u_u37).f_CliOpts_optDiagLang; f_CliOpts_optLangExplicit = (dtb_u_u37).f_CliOpts_optLangExplicit; f_CliOpts_optDenyWarnings = (dtb_u_u37).f_CliOpts_optDenyWarnings; f_CliOpts_optShowWarnings = (dtb_u_u37).f_CliOpts_optShowWarnings; f_CliOpts_optFormatExplicit = (dtb_u_u37).f_CliOpts_optFormatExplicit; f_CliOpts_optWarningsExplicit = (dtb_u_u37).f_CliOpts_optWarningsExplicit; f_CliOpts_optDenyExplicit = (dtb_u_u37).f_CliOpts_optDenyExplicit; f_CliOpts_optMaxErrors = (dtb_u_u37).f_CliOpts_optMaxErrors; f_CliOpts_optContinueOnError = (dtb_u_u37).f_CliOpts_optContinueOnError; f_CliOpts_optSarifItems = (dtb_u_u37).f_CliOpts_optSarifItems; f_CliOpts_optRelease = (dtb_u_u37).f_CliOpts_optRelease; f_CliOpts_optShowCascade = (dtb_u_u37).f_CliOpts_optShowCascade; f_CliOpts_optWithSources = (dtb_u_u37).f_CliOpts_optWithSources; f_CliOpts_optFailFast = (dtb_u_u37).f_CliOpts_optFailFast; f_CliOpts_optTarget = dtb_u_u36; f_CliOpts_optWasmOpt = (dtb_u_u37).f_CliOpts_optWasmOpt; f_CliOpts_optExplain = (dtb_u_u37).f_CliOpts_optExplain })

# 152 "Vuna/Compiler/Driver/CompilerCli.vuna"
let v_markFormatExplicit = (fun (dtb_u_u38 : t_CliOpts) -> { f_CliOpts_optDiagFormat = (dtb_u_u38).f_CliOpts_optDiagFormat; f_CliOpts_optDiagLang = (dtb_u_u38).f_CliOpts_optDiagLang; f_CliOpts_optLangExplicit = (dtb_u_u38).f_CliOpts_optLangExplicit; f_CliOpts_optDenyWarnings = (dtb_u_u38).f_CliOpts_optDenyWarnings; f_CliOpts_optShowWarnings = (dtb_u_u38).f_CliOpts_optShowWarnings; f_CliOpts_optFormatExplicit = true; f_CliOpts_optWarningsExplicit = (dtb_u_u38).f_CliOpts_optWarningsExplicit; f_CliOpts_optDenyExplicit = (dtb_u_u38).f_CliOpts_optDenyExplicit; f_CliOpts_optMaxErrors = (dtb_u_u38).f_CliOpts_optMaxErrors; f_CliOpts_optContinueOnError = (dtb_u_u38).f_CliOpts_optContinueOnError; f_CliOpts_optSarifItems = (dtb_u_u38).f_CliOpts_optSarifItems; f_CliOpts_optRelease = (dtb_u_u38).f_CliOpts_optRelease; f_CliOpts_optShowCascade = (dtb_u_u38).f_CliOpts_optShowCascade; f_CliOpts_optWithSources = (dtb_u_u38).f_CliOpts_optWithSources; f_CliOpts_optFailFast = (dtb_u_u38).f_CliOpts_optFailFast; f_CliOpts_optTarget = (dtb_u_u38).f_CliOpts_optTarget; f_CliOpts_optWasmOpt = (dtb_u_u38).f_CliOpts_optWasmOpt; f_CliOpts_optExplain = (dtb_u_u38).f_CliOpts_optExplain })

# 175 "Vuna/Compiler/Driver/CompilerCli.vuna"
let v_withOpts = (fun (dtb_u_u40 : t_CliOpts) (dtb_u_u41 : int B_dEffect_dCore.t_Eff) -> (Obj.repr ((fun (dtb_u_u46 : B_dEffect_dCore.t_EffUnit) -> (let dtb_u_u47 = Obj.obj (dtb_u_u41) in (let dtb_u_u49 = (dtb_u_u47 dtb_u_u46) in (let dtb_u_u51 = { B_dData_dPair.f_Pair_first = dtb_u_u49; B_dData_dPair.f_Pair_second = dtb_u_u40 } in dtb_u_u51)))))))

# 175 "Vuna/Compiler/Driver/CompilerCli.vuna"
let v_withOpts_u_udirect = (fun (o : t_CliOpts) (m : int B_dEffect_dCore.t_Eff) _u_ueffTok -> (let dtb_u_u47 = Obj.obj (m) in (let dtb_u_u49 = (dtb_u_u47 _u_ueffTok) in (let dtb_u_u51 = { B_dData_dPair.f_Pair_first = dtb_u_u49; B_dData_dPair.f_Pair_second = o } in dtb_u_u51))))

# 181 "Vuna/Compiler/Driver/CompilerCli.vuna"
let v_diagExitFor = (fun (dtb_u_u53 : Base_dDiag.t_Diagnostic) -> (if (dtb_u_u53).Base_dDiag.f_Diagnostic_diagInternal then 70 else (match (dtb_u_u53).Base_dDiag.f_Diagnostic_diagSeverity with
  | Base_dDiag.C_Severity_SevError -> 1
  | _ -> 0
)))

# 217 "Vuna/Compiler/Driver/CompilerCli.vuna"
let v_applyManifestOpts = (fun (dtb_u_u54 : Frontend_dPackages_dPkg.t_Package B_dData_dMaybe.t_Maybe) (dtb_u_u55 : t_CliOpts) -> (match dtb_u_u54 with
  | B_dData_dMaybe.C_Maybe_Just (dtb_u_u56) -> (let dtb_u_u57 = (dtb_u_u56).Frontend_dPackages_dPkg.f_Package_packageManifest in (let dtb_u_u58 = (match (dtb_u_u57).Frontend_dManifest.f_Manifest_manifestDiagFormat with
  | B_dData_dMaybe.C_Maybe_Just (dtb_u_u69) -> dtb_u_u69
  | B_dData_dMaybe.C_Maybe_Nothing -> (dtb_u_u55).f_CliOpts_optDiagFormat
  | _ -> failwith "DT: impossible branch"
) in (let dtb_u_u59 = (if (dtb_u_u55).f_CliOpts_optLangExplicit then (dtb_u_u55).f_CliOpts_optDiagLang else (match (dtb_u_u57).Frontend_dManifest.f_Manifest_manifestDiagLang with
  | B_dData_dMaybe.C_Maybe_Just (dtb_u_u68) -> dtb_u_u68
  | B_dData_dMaybe.C_Maybe_Nothing -> (dtb_u_u55).f_CliOpts_optDiagLang
  | _ -> failwith "DT: impossible branch"
)) in (let dtb_u_u60 = (if (dtb_u_u55).f_CliOpts_optFormatExplicit then (dtb_u_u55).f_CliOpts_optDiagFormat else (if (dtb_u_u59 = "en") then dtb_u_u58 else (if (((B_dTrait_dEq.v__x61__x61_ (B_dData_dMaybe.v_Eq_u018fc178ff3df1b4_uBase_x36_46_x36_Data_x36_46_x36_Maybe_x36_46_x36_Maybe_ua B_dData_dString.v_Eq_u018fc178ff3df1b4_uString)) (dtb_u_u57).Frontend_dManifest.f_Manifest_manifestDiagFormat) B_dData_dMaybe.C_Maybe_Nothing) then "human" else dtb_u_u58))) in (let dtb_u_u61 = (if (dtb_u_u55).f_CliOpts_optWarningsExplicit then (dtb_u_u55).f_CliOpts_optShowWarnings else (match (dtb_u_u57).Frontend_dManifest.f_Manifest_manifestDiagWarnings with
  | B_dData_dMaybe.C_Maybe_Just (dtb_u_u67) -> dtb_u_u67
  | B_dData_dMaybe.C_Maybe_Nothing -> (dtb_u_u55).f_CliOpts_optShowWarnings
  | _ -> failwith "DT: impossible branch"
)) in (let dtb_u_u62 = (if (dtb_u_u55).f_CliOpts_optDenyExplicit then (dtb_u_u55).f_CliOpts_optDenyWarnings else (match (dtb_u_u57).Frontend_dManifest.f_Manifest_manifestDiagDenyWarnings with
  | B_dData_dMaybe.C_Maybe_Just (dtb_u_u66) -> dtb_u_u66
  | B_dData_dMaybe.C_Maybe_Nothing -> (dtb_u_u55).f_CliOpts_optDenyWarnings
  | _ -> failwith "DT: impossible branch"
)) in (let dtb_u_u63 = (if dtb_u_u62 then true else dtb_u_u61) in (let dtb_u_u64 = (match (dtb_u_u57).Frontend_dManifest.f_Manifest_manifestDiagMaxErrors with
  | B_dData_dMaybe.C_Maybe_Just (dtb_u_u65) -> dtb_u_u65
  | B_dData_dMaybe.C_Maybe_Nothing -> (dtb_u_u55).f_CliOpts_optMaxErrors
  | _ -> failwith "DT: impossible branch"
) in { f_CliOpts_optDiagFormat = dtb_u_u60; f_CliOpts_optDiagLang = dtb_u_u59; f_CliOpts_optLangExplicit = (dtb_u_u55).f_CliOpts_optLangExplicit; f_CliOpts_optDenyWarnings = dtb_u_u62; f_CliOpts_optShowWarnings = dtb_u_u63; f_CliOpts_optFormatExplicit = (dtb_u_u55).f_CliOpts_optFormatExplicit; f_CliOpts_optWarningsExplicit = (dtb_u_u55).f_CliOpts_optWarningsExplicit; f_CliOpts_optDenyExplicit = (dtb_u_u55).f_CliOpts_optDenyExplicit; f_CliOpts_optMaxErrors = dtb_u_u64; f_CliOpts_optContinueOnError = (dtb_u_u55).f_CliOpts_optContinueOnError; f_CliOpts_optSarifItems = (dtb_u_u55).f_CliOpts_optSarifItems; f_CliOpts_optRelease = (dtb_u_u55).f_CliOpts_optRelease; f_CliOpts_optShowCascade = (dtb_u_u55).f_CliOpts_optShowCascade; f_CliOpts_optWithSources = (dtb_u_u55).f_CliOpts_optWithSources; f_CliOpts_optFailFast = (dtb_u_u55).f_CliOpts_optFailFast; f_CliOpts_optTarget = (dtb_u_u55).f_CliOpts_optTarget; f_CliOpts_optWasmOpt = (dtb_u_u55).f_CliOpts_optWasmOpt; f_CliOpts_optExplain = (dtb_u_u55).f_CliOpts_optExplain }))))))))
  | B_dData_dMaybe.C_Maybe_Nothing -> dtb_u_u55
  | _ -> failwith "DT: impossible branch"
))

# 214 "Vuna/Compiler/Driver/CompilerCli.vuna"
let v_applyDiagConfig = (fun (dtb_u_u70 : Frontend_dPackages_dPkg.t_Package B_dData_dMaybe.t_Maybe) (dtb_u_u71 : t_CliOpts) -> ((v_applyManifestOpts dtb_u_u70) dtb_u_u71))

# 279 "Vuna/Compiler/Driver/CompilerCli.vuna"
let v_maxErrorsOf = (fun (dtb_u_u72 : t_CliOpts) -> (if (dtb_u_u72).f_CliOpts_optFailFast then 1 else (dtb_u_u72).f_CliOpts_optMaxErrors))

# 287 "Vuna/Compiler/Driver/CompilerCli.vuna"
let[@tail_mod_cons] rec v_takeDiagsGo = (fun (dtb_u_u73 : int) (dtb_u_u74 : Base_dDiag.t_Diagnostic B_dData_dList.t_List) -> (match dtb_u_u74 with
  | B_dData_dList.C_List__x58__x58_ (dtb_u_u75, dtb_u_u76) -> (if (dtb_u_u73 <= 0) then B_dData_dList.C_List_Nil else (B_dData_dList.C_List__x58__x58_ (dtb_u_u75, ((v_takeDiagsGo (dtb_u_u73 - 1)) dtb_u_u76))))
  | B_dData_dList.C_List_Nil -> B_dData_dList.C_List_Nil
  | _ -> failwith "DT: impossible branch"
))

# 283 "Vuna/Compiler/Driver/CompilerCli.vuna"
let v_takeDiags = (fun (dtb_u_u77 : int) (dtb_u_u78 : Base_dDiag.t_Diagnostic B_dData_dList.t_List) -> (if (dtb_u_u77 <= 0) then dtb_u_u78 else ((v_takeDiagsGo dtb_u_u77) dtb_u_u78)))

# 292 "Vuna/Compiler/Driver/CompilerCli.vuna"
let[@tail_mod_cons] rec v_stripDenyWarnings = (fun (dtb_u_u79 : string B_dData_dList.t_List) -> (match dtb_u_u79 with
  | B_dData_dList.C_List__x58__x58_ (dtb_u_u80, dtb_u_u81) -> (if (if (if (dtb_u_u80 = "--deny-warnings") then true else (dtb_u_u80 = "--warnings")) then true else (dtb_u_u80 = "-W")) then (v_stripDenyWarnings dtb_u_u81) else (B_dData_dList.C_List__x58__x58_ (dtb_u_u80, (v_stripDenyWarnings dtb_u_u81))))
  | B_dData_dList.C_List_Nil -> B_dData_dList.C_List_Nil
  | _ -> failwith "DT: impossible branch"
))

# 301 "Vuna/Compiler/Driver/CompilerCli.vuna"
let rec v_hasDenyWarnings = (fun (dtb_u_u82 : string B_dData_dList.t_List) -> (match dtb_u_u82 with
  | B_dData_dList.C_List__x58__x58_ (dtb_u_u83, dtb_u_u84) -> (if (dtb_u_u83 = "--deny-warnings") then true else (v_hasDenyWarnings dtb_u_u84))
  | B_dData_dList.C_List_Nil -> false
  | _ -> failwith "DT: impossible branch"
))

# 306 "Vuna/Compiler/Driver/CompilerCli.vuna"
let rec v_hasShowCascade = (fun (dtb_u_u85 : string B_dData_dList.t_List) -> (match dtb_u_u85 with
  | B_dData_dList.C_List__x58__x58_ (dtb_u_u86, dtb_u_u87) -> (if (dtb_u_u86 = "--show-cascade") then true else (v_hasShowCascade dtb_u_u87))
  | B_dData_dList.C_List_Nil -> false
  | _ -> failwith "DT: impossible branch"
))

# 310 "Vuna/Compiler/Driver/CompilerCli.vuna"
let[@tail_mod_cons] rec v_stripShowCascade = (fun (dtb_u_u88 : string B_dData_dList.t_List) -> (match dtb_u_u88 with
  | B_dData_dList.C_List__x58__x58_ (dtb_u_u89, dtb_u_u90) -> (if (dtb_u_u89 = "--show-cascade") then (v_stripShowCascade dtb_u_u90) else (B_dData_dList.C_List__x58__x58_ (dtb_u_u89, (v_stripShowCascade dtb_u_u90))))
  | B_dData_dList.C_List_Nil -> B_dData_dList.C_List_Nil
  | _ -> failwith "DT: impossible branch"
))

# 315 "Vuna/Compiler/Driver/CompilerCli.vuna"
let rec v_hasWithSources = (fun (dtb_u_u91 : string B_dData_dList.t_List) -> (match dtb_u_u91 with
  | B_dData_dList.C_List__x58__x58_ (dtb_u_u92, dtb_u_u93) -> (if (dtb_u_u92 = "--with-sources") then true else (v_hasWithSources dtb_u_u93))
  | B_dData_dList.C_List_Nil -> false
  | _ -> failwith "DT: impossible branch"
))

# 319 "Vuna/Compiler/Driver/CompilerCli.vuna"
let rec v_hasFailFast = (fun (dtb_u_u94 : string B_dData_dList.t_List) -> (match dtb_u_u94 with
  | B_dData_dList.C_List__x58__x58_ (dtb_u_u95, dtb_u_u96) -> (if (dtb_u_u95 = "--fail-fast") then true else (v_hasFailFast dtb_u_u96))
  | B_dData_dList.C_List_Nil -> false
  | _ -> failwith "DT: impossible branch"
))

# 323 "Vuna/Compiler/Driver/CompilerCli.vuna"
let[@tail_mod_cons] rec v_stripFailFast = (fun (dtb_u_u97 : string B_dData_dList.t_List) -> (match dtb_u_u97 with
  | B_dData_dList.C_List__x58__x58_ (dtb_u_u98, dtb_u_u99) -> (if (dtb_u_u98 = "--fail-fast") then (v_stripFailFast dtb_u_u99) else (B_dData_dList.C_List__x58__x58_ (dtb_u_u98, (v_stripFailFast dtb_u_u99))))
  | B_dData_dList.C_List_Nil -> B_dData_dList.C_List_Nil
  | _ -> failwith "DT: impossible branch"
))

# 328 "Vuna/Compiler/Driver/CompilerCli.vuna"
let[@tail_mod_cons] rec v_stripWithSources = (fun (dtb_u_u100 : string B_dData_dList.t_List) -> (match dtb_u_u100 with
  | B_dData_dList.C_List__x58__x58_ (dtb_u_u101, dtb_u_u102) -> (if (dtb_u_u101 = "--with-sources") then (v_stripWithSources dtb_u_u102) else (B_dData_dList.C_List__x58__x58_ (dtb_u_u101, (v_stripWithSources dtb_u_u102))))
  | B_dData_dList.C_List_Nil -> B_dData_dList.C_List_Nil
  | _ -> failwith "DT: impossible branch"
))

# 347 "Vuna/Compiler/Driver/CompilerCli.vuna"
let rec v_memStr = (fun (dtb_u_u103 : string) (dtb_u_u104 : string B_dData_dList.t_List) -> (match dtb_u_u104 with
  | B_dData_dList.C_List__x58__x58_ (dtb_u_u105, dtb_u_u106) -> (if (dtb_u_u103 = dtb_u_u105) then true else ((v_memStr dtb_u_u103) dtb_u_u106))
  | B_dData_dList.C_List_Nil -> false
  | _ -> failwith "DT: impossible branch"
))

# 338 "Vuna/Compiler/Driver/CompilerCli.vuna"
let rec v_labelFiles = (fun (dtb_u_u107 : Base_dDiag.t_Label B_dData_dList.t_List) (dtb_u_u108 : string B_dData_dList.t_List) -> (match dtb_u_u107 with
  | B_dData_dList.C_List__x58__x58_ (dtb_u_u109, dtb_u_u110) -> ((v_labelFiles dtb_u_u110) (match (dtb_u_u109).Base_dDiag.f_Label_labelSpan with
  | B_dData_dMaybe.C_Maybe_Nothing -> dtb_u_u108
  | B_dData_dMaybe.C_Maybe_Just (dtb_u_u111) -> (if (if ((dtb_u_u111).Base_dSource.f_Span_spanFile = "") then true else ((v_memStr (dtb_u_u111).Base_dSource.f_Span_spanFile) dtb_u_u108)) then dtb_u_u108 else (B_dData_dList.C_List__x58__x58_ ((dtb_u_u111).Base_dSource.f_Span_spanFile, dtb_u_u108)))
  | _ -> failwith "DT: impossible branch"
))
  | B_dData_dList.C_List_Nil -> dtb_u_u108
  | _ -> failwith "DT: impossible branch"
))

# 334 "Vuna/Compiler/Driver/CompilerCli.vuna"
let rec v_collectLabelFiles = (fun (dtb_u_u112 : Base_dDiag.t_Diagnostic B_dData_dList.t_List) (dtb_u_u113 : string B_dData_dList.t_List) -> (match dtb_u_u112 with
  | B_dData_dList.C_List__x58__x58_ (dtb_u_u114, dtb_u_u115) -> ((v_collectLabelFiles dtb_u_u115) ((v_labelFiles (dtb_u_u114).Base_dDiag.f_Diagnostic_diagLabels) dtb_u_u113))
  | B_dData_dList.C_List_Nil -> dtb_u_u113
  | _ -> failwith "DT: impossible branch"
))

# 352 "Vuna/Compiler/Driver/CompilerCli.vuna"
let rec v_lastSlashGo = (fun (dtb_u_u116 : int B_dData_dList.t_List) (dtb_u_u117 : int) (dtb_u_u118 : int) -> (match dtb_u_u116 with
  | B_dData_dList.C_List__x58__x58_ (dtb_u_u119, dtb_u_u120) -> (((v_lastSlashGo dtb_u_u120) (dtb_u_u117 + 1)) (if (dtb_u_u119 = 47) then dtb_u_u117 else dtb_u_u118))
  | B_dData_dList.C_List_Nil -> dtb_u_u118
  | _ -> failwith "DT: impossible branch"
))

# 356 "Vuna/Compiler/Driver/CompilerCli.vuna"
let v_lastSlashIndexOf = (fun (dtb_u_u121 : string) -> (((v_lastSlashGo (B_dData_dList.dtp_unpack dtb_u_u121)) 0) (0 - 1)))

# 359 "Vuna/Compiler/Driver/CompilerCli.vuna"
let v_dirOf = (fun (dtb_u_u122 : string) -> (let dtb_u_u123 = (v_lastSlashIndexOf dtb_u_u122) in (if (dtb_u_u123 < 0) then "." else (if (dtb_u_u123 = 0) then "/" else (((B_dData_dString.v_substring 0) (bi_natFromInt dtb_u_u123)) dtb_u_u122)))))

# 365 "Vuna/Compiler/Driver/CompilerCli.vuna"
let v_stripPathPrefix = (fun (dtb_u_u124 : string) (dtb_u_u125 : string) -> (if ((B_dData_dString.v_startsWith (dtb_u_u124 ^ "/")) dtb_u_u125) then (((B_dData_dString.v_substring (bi_natFromInt ((String.length dtb_u_u124) + 1))) (bi_natFromInt (((String.length dtb_u_u125) - (String.length dtb_u_u124)) - 1))) dtb_u_u125) else dtb_u_u125))

# 378 "Vuna/Compiler/Driver/CompilerCli.vuna"
let rec v_splitSlashGo = (fun (dtb_u_u126 : int B_dData_dList.t_List) (dtb_u_u127 : int B_dData_dList.t_List) (dtb_u_u128 : string B_dData_dList.t_List) -> (match dtb_u_u126 with
  | B_dData_dList.C_List__x58__x58_ (dtb_u_u129, dtb_u_u130) -> (if (dtb_u_u129 = 47) then (((v_splitSlashGo dtb_u_u130) B_dData_dList.C_List_Nil) (B_dData_dList.C_List__x58__x58_ ((B_dData_dList.dtp_pack (B_dData_dList.v_reverse dtb_u_u127)), dtb_u_u128))) else (((v_splitSlashGo dtb_u_u130) (B_dData_dList.C_List__x58__x58_ (dtb_u_u129, dtb_u_u127))) dtb_u_u128))
  | B_dData_dList.C_List_Nil -> (B_dData_dList.v_reverse (B_dData_dList.C_List__x58__x58_ ((B_dData_dList.dtp_pack (B_dData_dList.v_reverse dtb_u_u127)), dtb_u_u128)))
  | _ -> failwith "DT: impossible branch"
))

# 375 "Vuna/Compiler/Driver/CompilerCli.vuna"
let v_splitSlash = (fun (dtb_u_u131 : string) -> (((v_splitSlashGo (B_dData_dList.dtp_unpack dtb_u_u131)) B_dData_dList.C_List_Nil) B_dData_dList.C_List_Nil))

# 386 "Vuna/Compiler/Driver/CompilerCli.vuna"
let v_moduleOfRel = (fun (dtb_u_u132 : string) -> (let dtb_u_u133 = (if ((B_dData_dString.v_startsWith "lib/") dtb_u_u132) then (((B_dData_dString.v_substring (bi_natFromInt 4)) (bi_natFromInt ((String.length dtb_u_u132) - 4))) dtb_u_u132) else (if ((B_dData_dString.v_startsWith "app/") dtb_u_u132) then (((B_dData_dString.v_substring (bi_natFromInt 4)) (bi_natFromInt ((String.length dtb_u_u132) - 4))) dtb_u_u132) else dtb_u_u132)) in (let dtb_u_u134 = (if ((B_dData_dString.v_endsWith ".vuna") dtb_u_u133) then (((B_dData_dString.v_substring 0) (bi_natFromInt ((String.length dtb_u_u133) - 5))) dtb_u_u133) else dtb_u_u133) in ((B_dData_dString.v_join ".") (v_splitSlash dtb_u_u134)))))

# 400 "Vuna/Compiler/Driver/CompilerCli.vuna"
let rec v_findPkgRootGo = (fun (dtb_u_u135 : string) (dtb_u_u138 : int) (dtb_u_u139 : string) -> (if (dtb_u_u138 <= 0) then (let dtb_u_u141 = { B_dData_dPair.f_Pair_first = ""; B_dData_dPair.f_Pair_second = "" } in (Obj.repr ((fun (dtb_u_u142 : B_dEffect_dCore.t_EffUnit) -> dtb_u_u141)))) else (let dtb_u_u143 = (if (dtb_u_u139 = "/") then "/vuna.toml" else (dtb_u_u139 ^ "/vuna.toml")) in (Obj.repr ((fun (dtb_u_u148 : B_dEffect_dCore.t_EffUnit) -> (let dtb_u_u151 = (((B_dEffect_dFs.v_fsFileExists_u_udirect dtb_u_u135) dtb_u_u143) dtb_u_u148) in (if dtb_u_u151 then (let dtb_u_u159 = (((B_dEffect_dFs.v_fsReadFile_u_udirect dtb_u_u135) dtb_u_u143) dtb_u_u148) in (let dtb_u_u160 = (match ((Frontend_dManifest.v_parseManifest dtb_u_u143) dtb_u_u159) with
  | Base_dDiag.C_Check_OkC (dtb_u_u164) -> (match (dtb_u_u164).Frontend_dManifest.f_Manifest_manifestName with
  | B_dData_dMaybe.C_Maybe_Nothing -> ""
  | B_dData_dMaybe.C_Maybe_Just (dtb_u_u165) -> dtb_u_u165
  | _ -> failwith "DT: impossible branch"
)
  | Base_dDiag.C_Check_ErrC (dtb_u_u166) -> ""
  | _ -> failwith "DT: impossible branch"
) in (let dtb_u_u162 = { B_dData_dPair.f_Pair_first = dtb_u_u139; B_dData_dPair.f_Pair_second = dtb_u_u160 } in dtb_u_u162))) else (if (if (dtb_u_u139 = "/") then true else (dtb_u_u139 = ".")) then (let dtb_u_u168 = { B_dData_dPair.f_Pair_first = ""; B_dData_dPair.f_Pair_second = "" } in dtb_u_u168) else ((Obj.magic (((v_findPkgRootGo dtb_u_u135) (dtb_u_u138 - 1)) (v_dirOf dtb_u_u139))) dtb_u_u148))))))))))
# 400 "Vuna/Compiler/Driver/CompilerCli.vuna"
and v_findPkgRootGo_u_udirect = (fun (nFs : string) (fuel : int) (dir : string) _u_ueffTok -> (if (fuel <= 0) then (let dtb_u_u141 = { B_dData_dPair.f_Pair_first = ""; B_dData_dPair.f_Pair_second = "" } in dtb_u_u141) else (let dtb_u_u143 = (if (dir = "/") then "/vuna.toml" else (dir ^ "/vuna.toml")) in (let dtb_u_u151 = (((B_dEffect_dFs.v_fsFileExists_u_udirect nFs) dtb_u_u143) _u_ueffTok) in (if dtb_u_u151 then (let dtb_u_u159 = (((B_dEffect_dFs.v_fsReadFile_u_udirect nFs) dtb_u_u143) _u_ueffTok) in (let dtb_u_u160 = (match ((Frontend_dManifest.v_parseManifest dtb_u_u143) dtb_u_u159) with
  | Base_dDiag.C_Check_OkC (dtb_u_u164) -> (match (dtb_u_u164).Frontend_dManifest.f_Manifest_manifestName with
  | B_dData_dMaybe.C_Maybe_Nothing -> ""
  | B_dData_dMaybe.C_Maybe_Just (dtb_u_u165) -> dtb_u_u165
  | _ -> failwith "DT: impossible branch"
)
  | Base_dDiag.C_Check_ErrC (dtb_u_u166) -> ""
  | _ -> failwith "DT: impossible branch"
) in (let dtb_u_u162 = { B_dData_dPair.f_Pair_first = dir; B_dData_dPair.f_Pair_second = dtb_u_u160 } in dtb_u_u162))) else (if (if (dir = "/") then true else (dir = ".")) then (let dtb_u_u168 = { B_dData_dPair.f_Pair_first = ""; B_dData_dPair.f_Pair_second = "" } in dtb_u_u168) else ((Obj.magic (((v_findPkgRootGo nFs) (fuel - 1)) (v_dirOf dir))) _u_ueffTok)))))))

# 423 "Vuna/Compiler/Driver/CompilerCli.vuna"
let v_sourceRefEff = (fun (dtb_u_u170 : string) (dtb_u_u171 : string) (dtb_u_u175 : string) -> (Obj.repr ((fun (dtb_u_u180 : B_dEffect_dCore.t_EffUnit) -> (let dtb_u_u183 = (((Frontend_dPackages_dPkg.v_absolutePath_u_udirect dtb_u_u171) dtb_u_u175) dtb_u_u180) in (let dtb_u_u191 = (((B_dEffect_dFs.v_fsFileExists_u_udirect dtb_u_u170) dtb_u_u183) dtb_u_u180) in (let dtb_u_u197 = Obj.obj ((if dtb_u_u191 then (Obj.repr ((fun (dtb_u_u203 : B_dEffect_dCore.t_EffUnit) -> (let dtb_u_u206 = (((B_dEffect_dFs.v_fsReadFile_u_udirect dtb_u_u170) dtb_u_u183) dtb_u_u203) in (let dtb_u_u208 = (string_of_int (Loader_dFingerprint.v_textHashOf dtb_u_u206)) in dtb_u_u208))))) else (let dtb_u_u211 = "" in (Obj.repr ((fun (dtb_u_u212 : B_dEffect_dCore.t_EffUnit) -> dtb_u_u211)))))) in (let dtb_u_u213 = (dtb_u_u197 dtb_u_u180) in (let dtb_u_u221 = ((((v_findPkgRootGo_u_udirect dtb_u_u170) 12) (v_dirOf dtb_u_u183)) dtb_u_u180) in (let dtb_u_u222 = (B_dData_dPair.v_firstOf dtb_u_u221) in (let dtb_u_u223 = (B_dData_dPair.v_secondOf dtb_u_u221) in (let dtb_u_u224 = (if (dtb_u_u222 = "") then dtb_u_u175 else ((v_stripPathPrefix dtb_u_u222) dtb_u_u183)) in (let dtb_u_u226 = { Base_dDiag_dFormat.f_SourceRef_srcFile = dtb_u_u175; Base_dDiag_dFormat.f_SourceRef_srcDigest = dtb_u_u213; Base_dDiag_dFormat.f_SourceRef_srcPackage = dtb_u_u223; Base_dDiag_dFormat.f_SourceRef_srcModule = (v_moduleOfRel dtb_u_u224); Base_dDiag_dFormat.f_SourceRef_srcRelPath = dtb_u_u224 } in dtb_u_u226)))))))))))))

# 423 "Vuna/Compiler/Driver/CompilerCli.vuna"
let v_sourceRefEff_u_udirect = (fun (nFs : string) (nEnv : string) (file : string) _u_ueffTok -> (let dtb_u_u183 = (((Frontend_dPackages_dPkg.v_absolutePath_u_udirect nEnv) file) _u_ueffTok) in (let dtb_u_u191 = (((B_dEffect_dFs.v_fsFileExists_u_udirect nFs) dtb_u_u183) _u_ueffTok) in (let dtb_u_u197 = Obj.obj ((if dtb_u_u191 then (Obj.repr ((fun (dtb_u_u203 : B_dEffect_dCore.t_EffUnit) -> (let dtb_u_u206 = (((B_dEffect_dFs.v_fsReadFile_u_udirect nFs) dtb_u_u183) dtb_u_u203) in (let dtb_u_u208 = (string_of_int (Loader_dFingerprint.v_textHashOf dtb_u_u206)) in dtb_u_u208))))) else (let dtb_u_u211 = "" in (Obj.repr ((fun (dtb_u_u212 : B_dEffect_dCore.t_EffUnit) -> dtb_u_u211)))))) in (let dtb_u_u213 = (dtb_u_u197 _u_ueffTok) in (let dtb_u_u221 = ((((v_findPkgRootGo_u_udirect nFs) 12) (v_dirOf dtb_u_u183)) _u_ueffTok) in (let dtb_u_u222 = (B_dData_dPair.v_firstOf dtb_u_u221) in (let dtb_u_u223 = (B_dData_dPair.v_secondOf dtb_u_u221) in (let dtb_u_u224 = (if (dtb_u_u222 = "") then file else ((v_stripPathPrefix dtb_u_u222) dtb_u_u183)) in (let dtb_u_u226 = { Base_dDiag_dFormat.f_SourceRef_srcFile = file; Base_dDiag_dFormat.f_SourceRef_srcDigest = dtb_u_u213; Base_dDiag_dFormat.f_SourceRef_srcPackage = dtb_u_u223; Base_dDiag_dFormat.f_SourceRef_srcModule = (v_moduleOfRel dtb_u_u224); Base_dDiag_dFormat.f_SourceRef_srcRelPath = dtb_u_u224 } in dtb_u_u226))))))))))

# 442 "Vuna/Compiler/Driver/CompilerCli.vuna"
let rec v_sourcePairsEff = (fun (dtb_u_u228 : string) (dtb_u_u229 : string) (dtb_u_u233 : string B_dData_dList.t_List) -> (match dtb_u_u233 with
  | B_dData_dList.C_List__x58__x58_ (dtb_u_u234, dtb_u_u235) -> (Obj.repr ((fun (dtb_u_u240 : B_dEffect_dCore.t_EffUnit) -> (let dtb_u_u243 = ((((v_sourcePairsEff_u_udirect dtb_u_u228) dtb_u_u229) dtb_u_u235) dtb_u_u240) in (let dtb_u_u251 = ((((v_sourceRefEff_u_udirect dtb_u_u228) dtb_u_u229) dtb_u_u234) dtb_u_u240) in (let dtb_u_u253 = (B_dData_dList.C_List__x58__x58_ (dtb_u_u251, dtb_u_u243)) in dtb_u_u253))))))
  | B_dData_dList.C_List_Nil -> (let dtb_u_u256 = B_dData_dList.C_List_Nil in (Obj.repr ((fun (dtb_u_u257 : B_dEffect_dCore.t_EffUnit) -> dtb_u_u256))))
  | _ -> failwith "DT: impossible branch"
))
# 442 "Vuna/Compiler/Driver/CompilerCli.vuna"
and v_sourcePairsEff_u_udirect = (fun (nFs : string) (nEnv : string) (mc0 : string B_dData_dList.t_List) _u_ueffTok -> (match mc0 with
  | B_dData_dList.C_List__x58__x58_ (dtb_u_u234, dtb_u_u235) -> (let dtb_u_u243 = ((((v_sourcePairsEff_u_udirect nFs) nEnv) dtb_u_u235) _u_ueffTok) in (let dtb_u_u251 = ((((v_sourceRefEff_u_udirect nFs) nEnv) dtb_u_u234) _u_ueffTok) in (let dtb_u_u253 = (B_dData_dList.C_List__x58__x58_ (dtb_u_u251, dtb_u_u243)) in dtb_u_u253)))
  | B_dData_dList.C_List_Nil -> (let dtb_u_u256 = B_dData_dList.C_List_Nil in dtb_u_u256)
  | _ -> failwith "DT: impossible branch"
))

# 191 "Vuna/Compiler/Driver/CompilerCli.vuna"
let v_flushSarif = (fun (dtb_u_u258 : string) (dtb_u_u259 : string) (dtb_u_u260 : string) (dtb_u_u265 : int) (dtb_u_u266 : t_CliOpts) -> (let dtb_u_u267 = ((v_takeDiags (dtb_u_u266).f_CliOpts_optMaxErrors) (dtb_u_u266).f_CliOpts_optSarifItems) in (if ((dtb_u_u266).f_CliOpts_optDiagFormat = "sarif") then (Obj.repr ((fun (dtb_u_u272 : B_dEffect_dCore.t_EffUnit) -> (let dtb_u_u275 = (((B_dEffect_dConsole.v_consolePrint_u_udirect dtb_u_u259) ((Base_dDiag_dFormat.v_renderSarif dtb_u_u267) ^ "\n")) dtb_u_u272) in (let dtb_u_u277 = dtb_u_u265 in dtb_u_u277))))) else (if ((dtb_u_u266).f_CliOpts_optDiagFormat = "json") then (if (dtb_u_u266).f_CliOpts_optWithSources then (Obj.repr ((fun (dtb_u_u283 : B_dEffect_dCore.t_EffUnit) -> (let dtb_u_u286 = ((((v_sourcePairsEff_u_udirect dtb_u_u258) dtb_u_u260) (B_dData_dList.v_reverse ((v_collectLabelFiles dtb_u_u267) B_dData_dList.C_List_Nil))) dtb_u_u283) in (let dtb_u_u294 = (((B_dEffect_dConsole.v_consolePrint_u_udirect dtb_u_u259) ((((Base_dDiag_dFormat.v_renderJsonListWithSources (dtb_u_u266).f_CliOpts_optDiagLang) dtb_u_u267) dtb_u_u286) ^ "\n")) dtb_u_u283) in (let dtb_u_u296 = dtb_u_u265 in dtb_u_u296)))))) else (Obj.repr ((fun (dtb_u_u302 : B_dEffect_dCore.t_EffUnit) -> (let dtb_u_u305 = (((B_dEffect_dConsole.v_consolePrint_u_udirect dtb_u_u259) (((Base_dDiag_dFormat.v_renderJsonList (dtb_u_u266).f_CliOpts_optDiagLang) dtb_u_u267) ^ "\n")) dtb_u_u302) in (let dtb_u_u307 = dtb_u_u265 in dtb_u_u307)))))) else (let dtb_u_u310 = dtb_u_u265 in (Obj.repr ((fun (dtb_u_u311 : B_dEffect_dCore.t_EffUnit) -> dtb_u_u310))))))))

# 191 "Vuna/Compiler/Driver/CompilerCli.vuna"
let v_flushSarif_u_udirect = (fun (nFs : string) (nConsole : string) (nEnv : string) (code : int) (o : t_CliOpts) _u_ueffTok -> (let dtb_u_u267 = ((v_takeDiags (o).f_CliOpts_optMaxErrors) (o).f_CliOpts_optSarifItems) in (if ((o).f_CliOpts_optDiagFormat = "sarif") then (let dtb_u_u275 = (((B_dEffect_dConsole.v_consolePrint_u_udirect nConsole) ((Base_dDiag_dFormat.v_renderSarif dtb_u_u267) ^ "\n")) _u_ueffTok) in (let dtb_u_u277 = code in dtb_u_u277)) else (if ((o).f_CliOpts_optDiagFormat = "json") then (if (o).f_CliOpts_optWithSources then (let dtb_u_u286 = ((((v_sourcePairsEff_u_udirect nFs) nEnv) (B_dData_dList.v_reverse ((v_collectLabelFiles dtb_u_u267) B_dData_dList.C_List_Nil))) _u_ueffTok) in (let dtb_u_u294 = (((B_dEffect_dConsole.v_consolePrint_u_udirect nConsole) ((((Base_dDiag_dFormat.v_renderJsonListWithSources (o).f_CliOpts_optDiagLang) dtb_u_u267) dtb_u_u286) ^ "\n")) _u_ueffTok) in (let dtb_u_u296 = code in dtb_u_u296))) else (let dtb_u_u305 = (((B_dEffect_dConsole.v_consolePrint_u_udirect nConsole) (((Base_dDiag_dFormat.v_renderJsonList (o).f_CliOpts_optDiagLang) dtb_u_u267) ^ "\n")) _u_ueffTok) in (let dtb_u_u307 = code in dtb_u_u307))) else (let dtb_u_u310 = code in dtb_u_u310)))))

# 450 "Vuna/Compiler/Driver/CompilerCli.vuna"
let v_isCascadeDiag = (fun (dtb_u_u312 : Base_dDiag.t_Diagnostic) -> (match (dtb_u_u312).Base_dDiag.f_Diagnostic_diagOrigin with
  | Base_dDiag.C_Origin_OriginCascade (dtb_u_u313) -> true
  | Base_dDiag.C_Origin_OriginDirect -> false
  | _ -> failwith "DT: impossible branch"
))

# 457 "Vuna/Compiler/Driver/CompilerCli.vuna"
let v_isTextDiagFormat = (fun (dtb_u_u314 : string) -> (if (dtb_u_u314 = "short") then true else (dtb_u_u314 = "human")))

# 460 "Vuna/Compiler/Driver/CompilerCli.vuna"
let v_visibleDiags = (fun (dtb_u_u315 : t_CliOpts) (dtb_u_u316 : Base_dDiag.t_Diagnostic B_dData_dList.t_List) -> (if (if (dtb_u_u315).f_CliOpts_optShowCascade then true else (B_dData_dBool.v_not (v_isTextDiagFormat (dtb_u_u315).f_CliOpts_optDiagFormat))) then dtb_u_u316 else (let dtb_u_u317 = ((B_dData_dList.v_filter (fun (dtb_u_u318 : Base_dDiag.t_Diagnostic) -> (B_dData_dBool.v_not (v_isCascadeDiag dtb_u_u318)))) dtb_u_u316) in (if (if ((B_dData_dList.v_length dtb_u_u317) = 0) then ((B_dData_dList.v_length dtb_u_u316) > 0) else false) then dtb_u_u316 else dtb_u_u317))))

# 470 "Vuna/Compiler/Driver/CompilerCli.vuna"
let rec v_hasShowWarnings = (fun (dtb_u_u319 : string B_dData_dList.t_List) -> (match dtb_u_u319 with
  | B_dData_dList.C_List__x58__x58_ (dtb_u_u320, dtb_u_u321) -> (if (if (dtb_u_u320 = "--warnings") then true else (dtb_u_u320 = "-W")) then true else (v_hasShowWarnings dtb_u_u321))
  | B_dData_dList.C_List_Nil -> false
  | _ -> failwith "DT: impossible branch"
))

# 476 "Vuna/Compiler/Driver/CompilerCli.vuna"
let rec v_hasFormatFlag = (fun (dtb_u_u322 : string B_dData_dList.t_List) -> (match dtb_u_u322 with
  | B_dData_dList.C_List__x58__x58_ (dtb_u_u323, dtb_u_u324) -> (if (if (if (dtb_u_u323 = "--json") then true else ((B_dData_dString.v_startsWith "--error-format") dtb_u_u323)) then true else ((B_dData_dString.v_startsWith "--message-format") dtb_u_u323)) then true else (v_hasFormatFlag dtb_u_u324))
  | B_dData_dList.C_List_Nil -> false
  | _ -> failwith "DT: impossible branch"
))

# 489 "Vuna/Compiler/Driver/CompilerCli.vuna"
let rec v_stripDiagFormatGo = (fun (dtb_u_u325 : string B_dData_dList.t_List) (dtb_u_u326 : string B_dData_dList.t_List) (dtb_u_u327 : string B_dData_dMaybe.t_Maybe) -> (match dtb_u_u325 with
  | B_dData_dList.C_List__x58__x58_ (dtb_u_u328, dtb_u_u329) -> (if (dtb_u_u328 = "--json") then (((v_stripDiagFormatGo dtb_u_u329) dtb_u_u326) (B_dData_dMaybe.C_Maybe_Just ("json"))) else (if (dtb_u_u328 = "--error-format") then (match dtb_u_u329 with
  | B_dData_dList.C_List__x58__x58_ (dtb_u_u330, dtb_u_u331) -> (((v_stripDiagFormatGo dtb_u_u331) dtb_u_u326) (B_dData_dMaybe.C_Maybe_Just (dtb_u_u330)))
  | B_dData_dList.C_List_Nil -> { B_dData_dPair.f_Pair_first = (B_dData_dList.v_reverse dtb_u_u326); B_dData_dPair.f_Pair_second = (B_dData_dMaybe.C_Maybe_Just ("short")) }
  | _ -> failwith "DT: impossible branch"
) else (if ((B_dData_dString.v_startsWith "--error-format=") dtb_u_u328) then (((v_stripDiagFormatGo dtb_u_u329) dtb_u_u326) (B_dData_dMaybe.C_Maybe_Just ((((B_dData_dString.v_substring (bi_natFromInt 15)) (bi_natFromInt ((String.length dtb_u_u328) - 15))) dtb_u_u328)))) else (if ((B_dData_dString.v_startsWith "--message-format=") dtb_u_u328) then (((v_stripDiagFormatGo dtb_u_u329) dtb_u_u326) (B_dData_dMaybe.C_Maybe_Just ((((B_dData_dString.v_substring (bi_natFromInt 17)) (bi_natFromInt ((String.length dtb_u_u328) - 17))) dtb_u_u328)))) else (((v_stripDiagFormatGo dtb_u_u329) (B_dData_dList.C_List__x58__x58_ (dtb_u_u328, dtb_u_u326))) dtb_u_u327)))))
  | B_dData_dList.C_List_Nil -> { B_dData_dPair.f_Pair_first = (B_dData_dList.v_reverse dtb_u_u326); B_dData_dPair.f_Pair_second = dtb_u_u327 }
  | _ -> failwith "DT: impossible branch"
))

# 485 "Vuna/Compiler/Driver/CompilerCli.vuna"
let v_stripDiagFormat = (fun (dtb_u_u332 : string B_dData_dList.t_List) -> (((v_stripDiagFormatGo dtb_u_u332) B_dData_dList.C_List_Nil) B_dData_dMaybe.C_Maybe_Nothing))

# 542 "Vuna/Compiler/Driver/CompilerCli.vuna"
let rec v_parseIntChars = (fun (dtb_u_u333 : int B_dData_dList.t_List) (dtb_u_u334 : int) (dtb_u_u335 : int) (dtb_u_u336 : int) -> (match dtb_u_u333 with
  | B_dData_dList.C_List__x58__x58_ (dtb_u_u337, dtb_u_u338) -> (if (if (dtb_u_u337 >= 48) then (dtb_u_u337 <= 57) else false) then ((((v_parseIntChars dtb_u_u338) ((dtb_u_u334 * 10) + (dtb_u_u337 - 48))) (dtb_u_u335 + 1)) dtb_u_u336) else (if (dtb_u_u335 = 0) then dtb_u_u336 else dtb_u_u334))
  | B_dData_dList.C_List_Nil -> (if (dtb_u_u335 = 0) then dtb_u_u336 else dtb_u_u334)
  | _ -> failwith "DT: impossible branch"
))

# 538 "Vuna/Compiler/Driver/CompilerCli.vuna"
let v_parseIntOr = (fun (dtb_u_u339 : string) (dtb_u_u340 : int) -> ((((v_parseIntChars (B_dData_dList.dtp_unpack dtb_u_u339)) 0) 0) dtb_u_u340))

# 550 "Vuna/Compiler/Driver/CompilerCli.vuna"
let v_parseWasmOptLevel = (fun (dtb_u_u341 : string) -> (let dtb_u_u342 = ((v_parseIntOr dtb_u_u341) (0 - 1)) in (if (if (dtb_u_u342 >= 0) then (dtb_u_u342 <= 3) else false) then (B_dData_dMaybe.C_Maybe_Just (dtb_u_u342)) else B_dData_dMaybe.C_Maybe_Nothing)))

# 561 "Vuna/Compiler/Driver/CompilerCli.vuna"
let rec v_stripMaxErrorsGo = (fun (dtb_u_u343 : string B_dData_dList.t_List) (dtb_u_u344 : string B_dData_dList.t_List) (dtb_u_u345 : int) -> (match dtb_u_u343 with
  | B_dData_dList.C_List__x58__x58_ (dtb_u_u346, dtb_u_u347) -> (if (dtb_u_u346 = "--max-errors") then (match dtb_u_u347 with
  | B_dData_dList.C_List__x58__x58_ (dtb_u_u348, dtb_u_u349) -> (((v_stripMaxErrorsGo dtb_u_u349) dtb_u_u344) ((v_parseIntOr dtb_u_u348) dtb_u_u345))
  | B_dData_dList.C_List_Nil -> { B_dData_dPair.f_Pair_first = (B_dData_dList.v_reverse dtb_u_u344); B_dData_dPair.f_Pair_second = dtb_u_u345 }
  | _ -> failwith "DT: impossible branch"
) else (if ((B_dData_dString.v_startsWith "--max-errors=") dtb_u_u346) then (((v_stripMaxErrorsGo dtb_u_u347) dtb_u_u344) ((v_parseIntOr (((B_dData_dString.v_substring (bi_natFromInt 13)) (bi_natFromInt ((String.length dtb_u_u346) - 13))) dtb_u_u346)) dtb_u_u345)) else (((v_stripMaxErrorsGo dtb_u_u347) (B_dData_dList.C_List__x58__x58_ (dtb_u_u346, dtb_u_u344))) dtb_u_u345)))
  | B_dData_dList.C_List_Nil -> { B_dData_dPair.f_Pair_first = (B_dData_dList.v_reverse dtb_u_u344); B_dData_dPair.f_Pair_second = dtb_u_u345 }
  | _ -> failwith "DT: impossible branch"
))

# 557 "Vuna/Compiler/Driver/CompilerCli.vuna"
let v_stripMaxErrors = (fun (dtb_u_u350 : string B_dData_dList.t_List) -> (((v_stripMaxErrorsGo dtb_u_u350) B_dData_dList.C_List_Nil) 20))

# 597 "Vuna/Compiler/Driver/CompilerCli.vuna"
let v_printVersion = (fun (dtb_u_u351 : string) (dtb_u_u354 : int) -> (Obj.repr ((fun (dtb_u_u359 : B_dEffect_dCore.t_EffUnit) -> (let dtb_u_u362 = (((B_dEffect_dConsole.v_consolePrint_u_udirect dtb_u_u351) (String.concat "" ["vuna-compiler "; Base_dVersion.v_vunaVersion; "\n"])) dtb_u_u359) in (let dtb_u_u364 = 0 in dtb_u_u364))))))

# 597 "Vuna/Compiler/Driver/CompilerCli.vuna"
let v_printVersion_u_udirect = (fun (nConsole : string) (_u : int) _u_ueffTok -> (let dtb_u_u362 = (((B_dEffect_dConsole.v_consolePrint_u_udirect nConsole) (String.concat "" ["vuna-compiler "; Base_dVersion.v_vunaVersion; "\n"])) _u_ueffTok) in (let dtb_u_u364 = 0 in dtb_u_u364)))

# 604 "Vuna/Compiler/Driver/CompilerCli.vuna"
let rec v_anyHelp = (fun (dtb_u_u366 : string B_dData_dList.t_List) -> (match dtb_u_u366 with
  | B_dData_dList.C_List__x58__x58_ (dtb_u_u367, dtb_u_u368) -> (if (if (dtb_u_u367 = "-h") then true else (dtb_u_u367 = "--help")) then true else (v_anyHelp dtb_u_u368))
  | B_dData_dList.C_List_Nil -> false
  | _ -> failwith "DT: impossible branch"
))

# 609 "Vuna/Compiler/Driver/CompilerCli.vuna"
let v_helpFor = (fun (dtb_u_u369 : string) (dtb_u_u372 : string) -> (Obj.repr ((fun (dtb_u_u377 : B_dEffect_dCore.t_EffUnit) -> (let dtb_u_u380 = (((B_dEffect_dConsole.v_consolePrint_u_udirect dtb_u_u369) (v_compilerUsage dtb_u_u372)) dtb_u_u377) in (let dtb_u_u382 = 0 in dtb_u_u382))))))

# 609 "Vuna/Compiler/Driver/CompilerCli.vuna"
let v_helpFor_u_udirect = (fun (nConsole : string) (prog : string) _u_ueffTok -> (let dtb_u_u380 = (((B_dEffect_dConsole.v_consolePrint_u_udirect nConsole) (v_compilerUsage prog)) _u_ueffTok) in (let dtb_u_u382 = 0 in dtb_u_u382)))

# 616 "Vuna/Compiler/Driver/CompilerCli.vuna"
let v_usageErr = (fun (dtb_u_u384 : string) (dtb_u_u387 : string) -> (Obj.repr ((fun (dtb_u_u392 : B_dEffect_dCore.t_EffUnit) -> (let dtb_u_u395 = (((B_dEffect_dConsole.v_consolePrint_u_udirect dtb_u_u384) (v_compilerUsage dtb_u_u387)) dtb_u_u392) in (let dtb_u_u397 = 2 in dtb_u_u397))))))

# 616 "Vuna/Compiler/Driver/CompilerCli.vuna"
let v_usageErr_u_udirect = (fun (nConsole : string) (prog : string) _u_ueffTok -> (let dtb_u_u395 = (((B_dEffect_dConsole.v_consolePrint_u_udirect nConsole) (v_compilerUsage prog)) _u_ueffTok) in (let dtb_u_u397 = 2 in dtb_u_u397)))

# 623 "Vuna/Compiler/Driver/CompilerCli.vuna"
let v_unknownCommand = (fun (dtb_u_u399 : string) (dtb_u_u402 : string) (dtb_u_u403 : string) -> (Obj.repr ((fun (dtb_u_u408 : B_dEffect_dCore.t_EffUnit) -> (let dtb_u_u411 = (((B_dEffect_dConsole.v_consolePrint_u_udirect dtb_u_u399) (String.concat "" ["error: unknown command "; dtb_u_u403; "\nrun "; dtb_u_u402; " help for the command list\n"])) dtb_u_u408) in (let dtb_u_u413 = 2 in dtb_u_u413))))))

# 623 "Vuna/Compiler/Driver/CompilerCli.vuna"
let v_unknownCommand_u_udirect = (fun (nConsole : string) (prog : string) (arg : string) _u_ueffTok -> (let dtb_u_u411 = (((B_dEffect_dConsole.v_consolePrint_u_udirect nConsole) (String.concat "" ["error: unknown command "; arg; "\nrun "; prog; " help for the command list\n"])) _u_ueffTok) in (let dtb_u_u413 = 2 in dtb_u_u413)))

# 629 "Vuna/Compiler/Driver/CompilerCli.vuna"
let v_removedCommand = (fun (dtb_u_u415 : string) (dtb_u_u418 : string) (dtb_u_u419 : string) (dtb_u_u420 : string) -> (Obj.repr ((fun (dtb_u_u425 : B_dEffect_dCore.t_EffUnit) -> (let dtb_u_u428 = (((B_dEffect_dConsole.v_consolePrint_u_udirect dtb_u_u415) (String.concat "" ["error: "; dtb_u_u419; " has been removed; "; dtb_u_u420; "\n"])) dtb_u_u425) in (let dtb_u_u430 = 2 in dtb_u_u430))))))

# 629 "Vuna/Compiler/Driver/CompilerCli.vuna"
let v_removedCommand_u_udirect = (fun (nConsole : string) (prog : string) (cmd : string) (hint : string) _u_ueffTok -> (let dtb_u_u428 = (((B_dEffect_dConsole.v_consolePrint_u_udirect nConsole) (String.concat "" ["error: "; cmd; " has been removed; "; hint; "\n"])) _u_ueffTok) in (let dtb_u_u430 = 2 in dtb_u_u430)))

# 637 "Vuna/Compiler/Driver/CompilerCli.vuna"
let v_dashFlag = (fun (dtb_u_u432 : string) -> ("--" ^ dtb_u_u432))

# 640 "Vuna/Compiler/Driver/CompilerCli.vuna"
let v_removedFlagHint = (fun (dtb_u_u433 : string) -> (if (dtb_u_u433 = (v_dashFlag "dt")) then (B_dData_dMaybe.C_Maybe_Just ("DT is the only path; drop the flag")) else (if (dtb_u_u433 = (v_dashFlag "package")) then (B_dData_dMaybe.C_Maybe_Just ("use build or compile")) else (if (dtb_u_u433 = (v_dashFlag "split")) then (B_dData_dMaybe.C_Maybe_Just ("split is the only output model; use build --out OUT [DIR] or compile <pkg-dir> OUT")) else (if (dtb_u_u433 = (v_dashFlag "root")) then (B_dData_dMaybe.C_Maybe_Just ("module resolution is decided by the nearest vuna.toml; set VUNA_BASE for standalone files")) else (if (dtb_u_u433 = (v_dashFlag "out")) then (B_dData_dMaybe.C_Maybe_Just ("pass OUTDIR positionally to compile; build accepts --out DIR")) else (if (dtb_u_u433 = (v_dashFlag "no-typecheck")) then (B_dData_dMaybe.C_Maybe_Just ("checking is always enabled")) else (if (dtb_u_u433 = (v_dashFlag "typecheck")) then (B_dData_dMaybe.C_Maybe_Just ("checking is always enabled")) else (if (dtb_u_u433 = (v_dashFlag "typed")) then (B_dData_dMaybe.C_Maybe_Just ("DT is the only path")) else B_dData_dMaybe.C_Maybe_Nothing)))))))))

# 659 "Vuna/Compiler/Driver/CompilerCli.vuna"
let v_removedFlag = (fun (dtb_u_u434 : string) (dtb_u_u437 : string) (dtb_u_u438 : string) -> (match (v_removedFlagHint dtb_u_u438) with
  | B_dData_dMaybe.C_Maybe_Nothing -> ((v_usageErr dtb_u_u434) dtb_u_u437)
  | B_dData_dMaybe.C_Maybe_Just (dtb_u_u439) -> (Obj.repr ((fun (dtb_u_u444 : B_dEffect_dCore.t_EffUnit) -> (let dtb_u_u447 = (((B_dEffect_dConsole.v_consolePrint_u_udirect dtb_u_u434) (String.concat "" ["error: "; dtb_u_u438; " has been removed; "; dtb_u_u439; "\n"])) dtb_u_u444) in (let dtb_u_u449 = 2 in dtb_u_u449)))))
  | _ -> failwith "DT: impossible branch"
))

# 659 "Vuna/Compiler/Driver/CompilerCli.vuna"
let v_removedFlag_u_udirect = (fun (nConsole : string) (prog : string) (flag : string) _u_ueffTok -> (match (v_removedFlagHint flag) with
  | B_dData_dMaybe.C_Maybe_Nothing -> ((Obj.magic ((v_usageErr nConsole) prog)) _u_ueffTok)
  | B_dData_dMaybe.C_Maybe_Just (dtb_u_u439) -> (let dtb_u_u447 = (((B_dEffect_dConsole.v_consolePrint_u_udirect nConsole) (String.concat "" ["error: "; flag; " has been removed; "; dtb_u_u439; "\n"])) _u_ueffTok) in (let dtb_u_u449 = 2 in dtb_u_u449))
  | _ -> failwith "DT: impossible branch"
))

# 671 "Vuna/Compiler/Driver/CompilerCli.vuna"
let v_printErrText = (fun (dtb_u_u451 : string) (dtb_u_u454 : string) -> (Obj.repr ((fun (dtb_u_u459 : B_dEffect_dCore.t_EffUnit) -> (let dtb_u_u462 = (((B_dEffect_dConsole.v_consolePrint_u_udirect dtb_u_u451) dtb_u_u454) dtb_u_u459) in (let dtb_u_u464 = 1 in dtb_u_u464))))))

# 671 "Vuna/Compiler/Driver/CompilerCli.vuna"
let v_printErrText_u_udirect = (fun (nConsole : string) (e : string) _u_ueffTok -> (let dtb_u_u462 = (((B_dEffect_dConsole.v_consolePrint_u_udirect nConsole) e) _u_ueffTok) in (let dtb_u_u464 = 1 in dtb_u_u464)))

# 678 "Vuna/Compiler/Driver/CompilerCli.vuna"
let v_severityLabelOf = (fun (dtb_u_u466 : Base_dDiag.t_Diagnostic) -> (match (dtb_u_u466).Base_dDiag.f_Diagnostic_diagSeverity with
  | Base_dDiag.C_Severity_SevError -> "error"
  | Base_dDiag.C_Severity_SevWarning -> "warning"
  | Base_dDiag.C_Severity_SevNote -> "note"
  | Base_dDiag.C_Severity_SevHelp -> "help"
  | _ -> failwith "DT: impossible branch"
))

# 711 "Vuna/Compiler/Driver/CompilerCli.vuna"
let v_collectSarifIn = (fun (dtb_u_u467 : t_CliOpts) (dtb_u_u468 : Base_dDiag.t_Diagnostic) -> { dtb_u_u467 with f_CliOpts_optSarifItems = ((B_dData_dList.v_append (dtb_u_u467).f_CliOpts_optSarifItems) (B_dData_dList.C_List__x58__x58_ (dtb_u_u468, B_dData_dList.C_List_Nil))) })

# 687 "Vuna/Compiler/Driver/CompilerCli.vuna"
let v_emitDiag = (fun (dtb_u_u469 : string) (dtb_u_u470 : string) (dtb_u_u474 : t_CliOpts) (dtb_u_u475 : string) (dtb_u_u476 : Base_dDiag.t_Diagnostic) -> (if ((dtb_u_u474).f_CliOpts_optDiagFormat = "json") then (let dtb_u_u478 = { B_dData_dPair.f_Pair_first = (v_diagExitFor dtb_u_u476); B_dData_dPair.f_Pair_second = ((v_collectSarifIn dtb_u_u474) dtb_u_u476) } in (Obj.repr ((fun (dtb_u_u479 : B_dEffect_dCore.t_EffUnit) -> dtb_u_u478)))) else (if ((dtb_u_u474).f_CliOpts_optDiagFormat = "human") then (Obj.repr ((fun (dtb_u_u484 : B_dEffect_dCore.t_EffUnit) -> (let dtb_u_u487 = ((((Base_dDiag_dFormat.v_renderHuman_u_udirect dtb_u_u469) (dtb_u_u474).f_CliOpts_optDiagLang) dtb_u_u476) dtb_u_u484) in (let dtb_u_u495 = (((v_printErrText_u_udirect dtb_u_u470) (dtb_u_u487 ^ "\n")) dtb_u_u484) in (let dtb_u_u497 = { B_dData_dPair.f_Pair_first = (v_diagExitFor dtb_u_u476); B_dData_dPair.f_Pair_second = dtb_u_u474 } in dtb_u_u497)))))) else (if ((dtb_u_u474).f_CliOpts_optDiagFormat = "sarif") then (let dtb_u_u500 = { B_dData_dPair.f_Pair_first = (v_diagExitFor dtb_u_u476); B_dData_dPair.f_Pair_second = ((v_collectSarifIn dtb_u_u474) dtb_u_u476) } in (Obj.repr ((fun (dtb_u_u501 : B_dEffect_dCore.t_EffUnit) -> dtb_u_u500)))) else (if ((dtb_u_u474).f_CliOpts_optDiagFormat = "github") then (Obj.repr ((fun (dtb_u_u506 : B_dEffect_dCore.t_EffUnit) -> (let dtb_u_u509 = (((v_printErrText_u_udirect dtb_u_u470) ((Base_dDiag_dFormat.v_renderGithub dtb_u_u476) ^ "\n")) dtb_u_u506) in (let dtb_u_u511 = { B_dData_dPair.f_Pair_first = (v_diagExitFor dtb_u_u476); B_dData_dPair.f_Pair_second = dtb_u_u474 } in dtb_u_u511))))) else (Obj.repr ((fun (dtb_u_u517 : B_dEffect_dCore.t_EffUnit) -> (let dtb_u_u520 = (((Base_dDiag_dFormat.v_renderShortSnippetEff_u_udirect dtb_u_u469) dtb_u_u476) dtb_u_u517) in (let dtb_u_u528 = (((v_printErrText_u_udirect dtb_u_u470) (String.concat "" [(v_severityLabelOf dtb_u_u476); ": "; dtb_u_u475; (Base_dDiag_dFormat.v_renderShort dtb_u_u476); dtb_u_u520; (Base_dDiag_dFormat.v_callFieldSuffix (dtb_u_u476).Base_dDiag.f_Diagnostic_diagFields); "\n"])) dtb_u_u517) in (let dtb_u_u530 = { B_dData_dPair.f_Pair_first = (v_diagExitFor dtb_u_u476); B_dData_dPair.f_Pair_second = dtb_u_u474 } in dtb_u_u530)))))))))))

# 687 "Vuna/Compiler/Driver/CompilerCli.vuna"
let v_emitDiag_u_udirect = (fun (nFs : string) (nConsole : string) (o : t_CliOpts) (extra : string) (d : Base_dDiag.t_Diagnostic) _u_ueffTok -> (if ((o).f_CliOpts_optDiagFormat = "json") then (let dtb_u_u478 = { B_dData_dPair.f_Pair_first = (v_diagExitFor d); B_dData_dPair.f_Pair_second = ((v_collectSarifIn o) d) } in dtb_u_u478) else (if ((o).f_CliOpts_optDiagFormat = "human") then (let dtb_u_u487 = ((((Base_dDiag_dFormat.v_renderHuman_u_udirect nFs) (o).f_CliOpts_optDiagLang) d) _u_ueffTok) in (let dtb_u_u495 = (((v_printErrText_u_udirect nConsole) (dtb_u_u487 ^ "\n")) _u_ueffTok) in (let dtb_u_u497 = { B_dData_dPair.f_Pair_first = (v_diagExitFor d); B_dData_dPair.f_Pair_second = o } in dtb_u_u497))) else (if ((o).f_CliOpts_optDiagFormat = "sarif") then (let dtb_u_u500 = { B_dData_dPair.f_Pair_first = (v_diagExitFor d); B_dData_dPair.f_Pair_second = ((v_collectSarifIn o) d) } in dtb_u_u500) else (if ((o).f_CliOpts_optDiagFormat = "github") then (let dtb_u_u509 = (((v_printErrText_u_udirect nConsole) ((Base_dDiag_dFormat.v_renderGithub d) ^ "\n")) _u_ueffTok) in (let dtb_u_u511 = { B_dData_dPair.f_Pair_first = (v_diagExitFor d); B_dData_dPair.f_Pair_second = o } in dtb_u_u511)) else (let dtb_u_u520 = (((Base_dDiag_dFormat.v_renderShortSnippetEff_u_udirect nFs) d) _u_ueffTok) in (let dtb_u_u528 = (((v_printErrText_u_udirect nConsole) (String.concat "" [(v_severityLabelOf d); ": "; extra; (Base_dDiag_dFormat.v_renderShort d); dtb_u_u520; (Base_dDiag_dFormat.v_callFieldSuffix (d).Base_dDiag.f_Diagnostic_diagFields); "\n"])) _u_ueffTok) in (let dtb_u_u530 = { B_dData_dPair.f_Pair_first = (v_diagExitFor d); B_dData_dPair.f_Pair_second = o } in dtb_u_u530))))))))

# 718 "Vuna/Compiler/Driver/CompilerCli.vuna"
let rec v_emitDiagSeq = (fun (dtb_u_u532 : string) (dtb_u_u533 : string) (dtb_u_u537 : t_CliOpts) (dtb_u_u538 : string) (dtb_u_u539 : Base_dDiag.t_Diagnostic B_dData_dList.t_List) -> (match dtb_u_u539 with
  | B_dData_dList.C_List__x58__x58_ (dtb_u_u540, dtb_u_u541) -> (Obj.repr ((fun (dtb_u_u546 : B_dEffect_dCore.t_EffUnit) -> (let dtb_u_u549 = ((((((v_emitDiag_u_udirect dtb_u_u532) dtb_u_u533) dtb_u_u537) dtb_u_u538) dtb_u_u540) dtb_u_u546) in ((Obj.magic (((((v_emitDiagSeq dtb_u_u532) dtb_u_u533) (B_dData_dPair.v_secondOf dtb_u_u549)) dtb_u_u538) dtb_u_u541)) dtb_u_u546)))))
  | B_dData_dList.C_List_Nil -> (let dtb_u_u551 = dtb_u_u537 in (Obj.repr ((fun (dtb_u_u552 : B_dEffect_dCore.t_EffUnit) -> dtb_u_u551))))
  | _ -> failwith "DT: impossible branch"
))
# 718 "Vuna/Compiler/Driver/CompilerCli.vuna"
and v_emitDiagSeq_u_udirect = (fun (nFs : string) (nConsole : string) (mc0 : t_CliOpts) (mc1 : string) (mc2 : Base_dDiag.t_Diagnostic B_dData_dList.t_List) _u_ueffTok -> (match mc2 with
  | B_dData_dList.C_List__x58__x58_ (dtb_u_u540, dtb_u_u541) -> (let dtb_u_u549 = ((((((v_emitDiag_u_udirect nFs) nConsole) mc0) mc1) dtb_u_u540) _u_ueffTok) in ((Obj.magic (((((v_emitDiagSeq nFs) nConsole) (B_dData_dPair.v_secondOf dtb_u_u549)) mc1) dtb_u_u541)) _u_ueffTok))
  | B_dData_dList.C_List_Nil -> (let dtb_u_u551 = mc0 in dtb_u_u551)
  | _ -> failwith "DT: impossible branch"
))

# 715 "Vuna/Compiler/Driver/CompilerCli.vuna"
let v_emitDiagRevSeq = (fun (dtb_u_u553 : string) (dtb_u_u554 : string) (dtb_u_u558 : t_CliOpts) (dtb_u_u559 : string) (dtb_u_u560 : Base_dDiag.t_Diagnostic B_dData_dList.t_List) -> (((((v_emitDiagSeq dtb_u_u553) dtb_u_u554) dtb_u_u558) dtb_u_u559) (B_dData_dList.v_reverse dtb_u_u560)))

# 715 "Vuna/Compiler/Driver/CompilerCli.vuna"
let v_emitDiagRevSeq_u_udirect = (fun (nFs : string) (nConsole : string) (o : t_CliOpts) (extra : string) (ds : Base_dDiag.t_Diagnostic B_dData_dList.t_List) _u_ueffTok -> ((Obj.magic (((((v_emitDiagSeq nFs) nConsole) o) extra) (B_dData_dList.v_reverse ds))) _u_ueffTok))

# 725 "Vuna/Compiler/Driver/CompilerCli.vuna"
let v_printDiagWithPrefix = (fun (dtb_u_u561 : string) (dtb_u_u562 : string) (dtb_u_u566 : t_CliOpts) (dtb_u_u567 : string) (dtb_u_u568 : Base_dDiag.t_Diagnostic) -> (match (dtb_u_u568).Base_dDiag.f_Diagnostic_diagChildren with
  | B_dData_dList.C_List_Nil -> (((((v_emitDiag dtb_u_u561) dtb_u_u562) dtb_u_u566) dtb_u_u567) dtb_u_u568)
  | _ -> (let dtb_u_u569 = ((v_takeDiags (v_maxErrorsOf dtb_u_u566)) (B_dData_dList.C_List__x58__x58_ (dtb_u_u568, ((v_visibleDiags dtb_u_u566) (dtb_u_u568).Base_dDiag.f_Diagnostic_diagChildren)))) in (Obj.repr ((fun (dtb_u_u574 : B_dEffect_dCore.t_EffUnit) -> (let dtb_u_u577 = ((((((v_emitDiagRevSeq_u_udirect dtb_u_u561) dtb_u_u562) dtb_u_u566) dtb_u_u567) dtb_u_u569) dtb_u_u574) in (let dtb_u_u579 = { B_dData_dPair.f_Pair_first = (v_diagExitFor dtb_u_u568); B_dData_dPair.f_Pair_second = dtb_u_u577 } in dtb_u_u579))))))
))

# 725 "Vuna/Compiler/Driver/CompilerCli.vuna"
let v_printDiagWithPrefix_u_udirect = (fun (nFs : string) (nConsole : string) (o : t_CliOpts) (extra : string) (d : Base_dDiag.t_Diagnostic) _u_ueffTok -> (match (d).Base_dDiag.f_Diagnostic_diagChildren with
  | B_dData_dList.C_List_Nil -> ((Obj.magic (((((v_emitDiag nFs) nConsole) o) extra) d)) _u_ueffTok)
  | _ -> (let dtb_u_u569 = ((v_takeDiags (v_maxErrorsOf o)) (B_dData_dList.C_List__x58__x58_ (d, ((v_visibleDiags o) (d).Base_dDiag.f_Diagnostic_diagChildren)))) in (let dtb_u_u577 = ((((((v_emitDiagRevSeq_u_udirect nFs) nConsole) o) extra) dtb_u_u569) _u_ueffTok) in (let dtb_u_u579 = { B_dData_dPair.f_Pair_first = (v_diagExitFor d); B_dData_dPair.f_Pair_second = dtb_u_u577 } in dtb_u_u579)))
))

# 737 "Vuna/Compiler/Driver/CompilerCli.vuna"
let v_printDiag = (fun (dtb_u_u581 : string) (dtb_u_u582 : string) (dtb_u_u586 : t_CliOpts) (dtb_u_u587 : Base_dDiag.t_Diagnostic) -> (((((v_printDiagWithPrefix dtb_u_u581) dtb_u_u582) dtb_u_u586) "") dtb_u_u587))

# 737 "Vuna/Compiler/Driver/CompilerCli.vuna"
let v_printDiag_u_udirect = (fun (nFs : string) (nConsole : string) (o : t_CliOpts) (d : Base_dDiag.t_Diagnostic) _u_ueffTok -> ((Obj.magic (((((v_printDiagWithPrefix nFs) nConsole) o) "") d)) _u_ueffTok))

# 741 "Vuna/Compiler/Driver/CompilerCli.vuna"
let v_printErr = (fun (dtb_u_u588 : string) (dtb_u_u591 : string) -> ((v_printErrText dtb_u_u588) (String.concat "" ["error: "; dtb_u_u591; "\n"])))

# 741 "Vuna/Compiler/Driver/CompilerCli.vuna"
let v_printErr_u_udirect = (fun (nConsole : string) (e : string) _u_ueffTok -> ((Obj.magic ((v_printErrText nConsole) (String.concat "" ["error: "; e; "\n"]))) _u_ueffTok))

# 745 "Vuna/Compiler/Driver/CompilerCli.vuna"
let v_printDiagList = (fun (dtb_u_u592 : string) (dtb_u_u593 : string) (dtb_u_u597 : t_CliOpts) (dtb_u_u598 : string) (dtb_u_u599 : Base_dDiag.t_Diagnostic B_dData_dList.t_List) -> (let dtb_u_u600 = ((v_takeDiags (v_maxErrorsOf dtb_u_u597)) ((v_visibleDiags dtb_u_u597) dtb_u_u599)) in (Obj.repr ((fun (dtb_u_u605 : B_dEffect_dCore.t_EffUnit) -> (let dtb_u_u608 = ((((((v_emitDiagRevSeq_u_udirect dtb_u_u592) dtb_u_u593) dtb_u_u597) dtb_u_u598) dtb_u_u600) dtb_u_u605) in (let dtb_u_u610 = { B_dData_dPair.f_Pair_first = 0; B_dData_dPair.f_Pair_second = dtb_u_u608 } in dtb_u_u610)))))))

# 745 "Vuna/Compiler/Driver/CompilerCli.vuna"
let v_printDiagList_u_udirect = (fun (nFs : string) (nConsole : string) (o : t_CliOpts) (extra : string) (ds : Base_dDiag.t_Diagnostic B_dData_dList.t_List) _u_ueffTok -> (let dtb_u_u600 = ((v_takeDiags (v_maxErrorsOf o)) ((v_visibleDiags o) ds)) in (let dtb_u_u608 = ((((((v_emitDiagRevSeq_u_udirect nFs) nConsole) o) extra) dtb_u_u600) _u_ueffTok) in (let dtb_u_u610 = { B_dData_dPair.f_Pair_first = 0; B_dData_dPair.f_Pair_second = dtb_u_u608 } in dtb_u_u610))))

# 753 "Vuna/Compiler/Driver/CompilerCli.vuna"
let v_defaultDir = (fun (dtb_u_u612 : string B_dData_dMaybe.t_Maybe) -> (match dtb_u_u612 with
  | B_dData_dMaybe.C_Maybe_Nothing -> "."
  | B_dData_dMaybe.C_Maybe_Just (dtb_u_u613) -> dtb_u_u613
  | _ -> failwith "DT: impossible branch"
))

# 760 "Vuna/Compiler/Driver/CompilerCli.vuna"
let v_dtPathErr = (fun (dtb_u_u614 : string) (dtb_u_u617 : string) -> ((v_printErr dtb_u_u614) ("no such file or package directory: " ^ dtb_u_u617)))

# 760 "Vuna/Compiler/Driver/CompilerCli.vuna"
let v_dtPathErr_u_udirect = (fun (nConsole : string) (path : string) _u_ueffTok -> ((Obj.magic ((v_printErr nConsole) ("no such file or package directory: " ^ path))) _u_ueffTok))

# 775 "Vuna/Compiler/Driver/CompilerCli.vuna"
let v_executablePackageAt = (fun (dtb_u_u618 : string) (dtb_u_u619 : string) (dtb_u_u623 : string) (dtb_u_u624 : string) -> (Obj.repr ((fun (dtb_u_u629 : B_dEffect_dCore.t_EffUnit) -> (let dtb_u_u632 = ((((Frontend_dPackages_dPkg.v_loadPackage_u_udirect dtb_u_u618) dtb_u_u619) dtb_u_u624) dtb_u_u629) in (match dtb_u_u632 with
  | Base_dDiag.C_Check_ErrC (dtb_u_u633) -> (let dtb_u_u635 = (Base_dDiag.C_Check_ErrC (dtb_u_u633)) in dtb_u_u635)
  | Base_dDiag.C_Check_OkC (dtb_u_u637) -> (let dtb_u_u645 = (((B_dEffect_dFs.v_fsFileExists_u_udirect dtb_u_u618) (Frontend_dPackages_dPkg.v_packageEntry dtb_u_u637)) dtb_u_u629) in (if dtb_u_u645 then (let dtb_u_u647 = (Base_dDiag.C_Check_OkC (dtb_u_u637)) in dtb_u_u647) else (let dtb_u_u650 = (Base_dDiag.v_err (String.concat "" [dtb_u_u623; ": library package "; (Frontend_dPackages_dPkg.v_packageName dtb_u_u637); " has no app/Main.vuna (an executable package is required)"])) in dtb_u_u650)))
  | _ -> failwith "DT: impossible branch"
))))))

# 775 "Vuna/Compiler/Driver/CompilerCli.vuna"
let v_executablePackageAt_u_udirect = (fun (nFs : string) (nEnv : string) (label : string) (dir : string) _u_ueffTok -> (let dtb_u_u632 = ((((Frontend_dPackages_dPkg.v_loadPackage_u_udirect nFs) nEnv) dir) _u_ueffTok) in (match dtb_u_u632 with
  | Base_dDiag.C_Check_ErrC (dtb_u_u633) -> (let dtb_u_u635 = (Base_dDiag.C_Check_ErrC (dtb_u_u633)) in dtb_u_u635)
  | Base_dDiag.C_Check_OkC (dtb_u_u637) -> (let dtb_u_u645 = (((B_dEffect_dFs.v_fsFileExists_u_udirect nFs) (Frontend_dPackages_dPkg.v_packageEntry dtb_u_u637)) _u_ueffTok) in (if dtb_u_u645 then (let dtb_u_u647 = (Base_dDiag.C_Check_OkC (dtb_u_u637)) in dtb_u_u647) else (let dtb_u_u650 = (Base_dDiag.v_err (String.concat "" [label; ": library package "; (Frontend_dPackages_dPkg.v_packageName dtb_u_u637); " has no app/Main.vuna (an executable package is required)"])) in dtb_u_u650)))
  | _ -> failwith "DT: impossible branch"
)))

# 764 "Vuna/Compiler/Driver/CompilerCli.vuna"
let v_executablePackage = (fun (dtb_u_u652 : string) (dtb_u_u653 : string) (dtb_u_u657 : string) (dtb_u_u658 : string) -> (Obj.repr ((fun (dtb_u_u663 : B_dEffect_dCore.t_EffUnit) -> (let dtb_u_u666 = (((B_dEffect_dFs.v_fsFileExists_u_udirect dtb_u_u652) dtb_u_u658) dtb_u_u663) in (if dtb_u_u666 then (let dtb_u_u674 = (((B_dEffect_dFs.v_fsIsDirectory_u_udirect dtb_u_u652) dtb_u_u658) dtb_u_u663) in (if dtb_u_u674 then ((Obj.magic ((((v_executablePackageAt dtb_u_u652) dtb_u_u653) dtb_u_u657) dtb_u_u658)) dtb_u_u663) else (let dtb_u_u676 = (Base_dDiag.v_err (String.concat "" [dtb_u_u657; ": expected a package directory, not a file: "; dtb_u_u658])) in dtb_u_u676))) else (let dtb_u_u679 = (Base_dDiag.v_err ("no such file or package directory: " ^ dtb_u_u658)) in dtb_u_u679)))))))

# 764 "Vuna/Compiler/Driver/CompilerCli.vuna"
let v_executablePackage_u_udirect = (fun (nFs : string) (nEnv : string) (label : string) (dir : string) _u_ueffTok -> (let dtb_u_u666 = (((B_dEffect_dFs.v_fsFileExists_u_udirect nFs) dir) _u_ueffTok) in (if dtb_u_u666 then (let dtb_u_u674 = (((B_dEffect_dFs.v_fsIsDirectory_u_udirect nFs) dir) _u_ueffTok) in (if dtb_u_u674 then ((Obj.magic ((((v_executablePackageAt nFs) nEnv) label) dir)) _u_ueffTok) else (let dtb_u_u676 = (Base_dDiag.v_err (String.concat "" [label; ": expected a package directory, not a file: "; dir])) in dtb_u_u676))) else (let dtb_u_u679 = (Base_dDiag.v_err ("no such file or package directory: " ^ dir)) in dtb_u_u679))))

# 817 "Vuna/Compiler/Driver/CompilerCli.vuna"
let v_isKnownTarget = (fun (dtb_u_u681 : string) -> (if (if (dtb_u_u681 = "ocaml") then true else (dtb_u_u681 = "wasm")) then true else (dtb_u_u681 = "native")))

# 839 "Vuna/Compiler/Driver/CompilerCli.vuna"
let v_compileToTarget = (fun (dtb_u_u682 : string) (dtb_u_u683 : string) (dtb_u_u684 : string) (dtb_u_u685 : string) (dtb_u_u686 : string) (dtb_u_u693 : Frontend_dPackages_dPkg.t_PackageContext) (dtb_u_u694 : string) (dtb_u_u695 : bool) (dtb_u_u696 : string) (dtb_u_u697 : string) -> (if (dtb_u_u697 = "ocaml") then (Obj.repr ((fun (dtb_u_u702 : B_dEffect_dCore.t_EffUnit) -> (let dtb_u_u705 = ((((((((((Driver_dCompile.v_compileToDir_u_udirect dtb_u_u682) dtb_u_u683) dtb_u_u684) dtb_u_u685) dtb_u_u686) dtb_u_u693) dtb_u_u694) dtb_u_u695) dtb_u_u696) dtb_u_u702) in (let dtb_u_u707 = (match dtb_u_u705 with
  | Base_dDiag.C_Check_ErrC (dtb_u_u709) -> (Base_dDiag.C_Check_ErrC (dtb_u_u709))
  | Base_dDiag.C_Check_OkC (dtb_u_u710) -> (Base_dDiag.C_Check_OkC ({ B_dData_dPair.f_Pair_first = B_dData_dList.C_List_Nil; B_dData_dPair.f_Pair_second = (B_dData_dPair.v_secondOf dtb_u_u710) }))
  | _ -> failwith "DT: impossible branch"
) in dtb_u_u707))))) else ((((((((Driver_dTarget.v_compileBackend dtb_u_u682) dtb_u_u685) dtb_u_u686) dtb_u_u693) dtb_u_u697) dtb_u_u694) dtb_u_u695) dtb_u_u696)))

# 839 "Vuna/Compiler/Driver/CompilerCli.vuna"
let v_compileToTarget_u_udirect = (fun (nFs : string) (nConsole : string) (nClock : string) (nEnv : string) (nProcess : string) (ctx : Frontend_dPackages_dPkg.t_PackageContext) (entry : string) (printResult : bool) (outDir : string) (target : string) _u_ueffTok -> (if (target = "ocaml") then (let dtb_u_u705 = ((((((((((Driver_dCompile.v_compileToDir_u_udirect nFs) nConsole) nClock) nEnv) nProcess) ctx) entry) printResult) outDir) _u_ueffTok) in (let dtb_u_u707 = (match dtb_u_u705 with
  | Base_dDiag.C_Check_ErrC (dtb_u_u709) -> (Base_dDiag.C_Check_ErrC (dtb_u_u709))
  | Base_dDiag.C_Check_OkC (dtb_u_u710) -> (Base_dDiag.C_Check_OkC ({ B_dData_dPair.f_Pair_first = B_dData_dList.C_List_Nil; B_dData_dPair.f_Pair_second = (B_dData_dPair.v_secondOf dtb_u_u710) }))
  | _ -> failwith "DT: impossible branch"
) in dtb_u_u707)) else ((Obj.magic ((((((((Driver_dTarget.v_compileBackend nFs) nEnv) nProcess) ctx) target) entry) printResult) outDir)) _u_ueffTok)))

# 926 "Vuna/Compiler/Driver/CompilerCli.vuna"
let v_checkSpawnArgs = (fun (dtb_u_u711 : t_CliOpts) (dtb_u_u712 : string) -> (let dtb_u_u713 = (if (dtb_u_u711).f_CliOpts_optRelease then (B_dData_dList.C_List__x58__x58_ ("check", (B_dData_dList.C_List__x58__x58_ ("--release", B_dData_dList.C_List_Nil)))) else (B_dData_dList.C_List__x58__x58_ ("check", B_dData_dList.C_List_Nil))) in (let dtb_u_u714 = (if ((dtb_u_u711).f_CliOpts_optDiagFormat = "short") then ((B_dData_dList.v_append dtb_u_u713) (B_dData_dList.C_List__x58__x58_ (dtb_u_u712, B_dData_dList.C_List_Nil))) else ((B_dData_dList.v_append dtb_u_u713) (B_dData_dList.C_List__x58__x58_ ("--error-format", (B_dData_dList.C_List__x58__x58_ ((dtb_u_u711).f_CliOpts_optDiagFormat, (B_dData_dList.C_List__x58__x58_ (dtb_u_u712, B_dData_dList.C_List_Nil)))))))) in (let dtb_u_u715 = (if (dtb_u_u711).f_CliOpts_optShowWarnings then ((B_dData_dList.v_append dtb_u_u714) (B_dData_dList.C_List__x58__x58_ ("--warnings", B_dData_dList.C_List_Nil))) else dtb_u_u714) in (let dtb_u_u716 = (if (dtb_u_u711).f_CliOpts_optDenyWarnings then ((B_dData_dList.v_append dtb_u_u715) (B_dData_dList.C_List__x58__x58_ ("--deny-warnings", B_dData_dList.C_List_Nil))) else dtb_u_u715) in (let dtb_u_u717 = (if (dtb_u_u711).f_CliOpts_optLangExplicit then (B_dData_dList.C_List__x58__x58_ ("--lang", (B_dData_dList.C_List__x58__x58_ ((dtb_u_u711).f_CliOpts_optDiagLang, B_dData_dList.C_List_Nil)))) else B_dData_dList.C_List_Nil) in (let dtb_u_u718 = (if (dtb_u_u711).f_CliOpts_optShowCascade then (B_dData_dList.C_List__x58__x58_ ("--show-cascade", B_dData_dList.C_List_Nil)) else B_dData_dList.C_List_Nil) in (let dtb_u_u719 = (if (dtb_u_u711).f_CliOpts_optWithSources then (B_dData_dList.C_List__x58__x58_ ("--with-sources", B_dData_dList.C_List_Nil)) else B_dData_dList.C_List_Nil) in (let dtb_u_u720 = (if (dtb_u_u711).f_CliOpts_optFailFast then (B_dData_dList.C_List__x58__x58_ ("--fail-fast", B_dData_dList.C_List_Nil)) else B_dData_dList.C_List_Nil) in (let dtb_u_u721 = (if (dtb_u_u711).f_CliOpts_optExplain then (B_dData_dList.C_List__x58__x58_ ("--explain", B_dData_dList.C_List_Nil)) else B_dData_dList.C_List_Nil) in (let dtb_u_u722 = (if ((dtb_u_u711).f_CliOpts_optMaxErrors > 0) then (B_dData_dList.C_List__x58__x58_ ("--max-errors", (B_dData_dList.C_List__x58__x58_ ((string_of_int (dtb_u_u711).f_CliOpts_optMaxErrors), B_dData_dList.C_List_Nil)))) else B_dData_dList.C_List_Nil) in ((B_dData_dList.v_append dtb_u_u716) ((B_dData_dList.v_append dtb_u_u717) ((B_dData_dList.v_append dtb_u_u722) ((B_dData_dList.v_append dtb_u_u718) ((B_dData_dList.v_append dtb_u_u719) ((B_dData_dList.v_append dtb_u_u720) dtb_u_u721)))))))))))))))))

# 949 "Vuna/Compiler/Driver/CompilerCli.vuna"
let v_isMachineFormat = (fun (dtb_u_u723 : string) -> (if (dtb_u_u723 = "json") then true else (dtb_u_u723 = "sarif")))

# 1008 "Vuna/Compiler/Driver/CompilerCli.vuna"
let rec v_depsReadyList = (fun (dtb_u_u724 : string B_dData_dList.t_List) (dtb_u_u725 : string B_dData_dList.t_List) (dtb_u_u726 : Frontend_dPackages_dPkg.t_Package B_dData_dList.t_List) -> (match dtb_u_u726 with
  | B_dData_dList.C_List__x58__x58_ (dtb_u_u727, dtb_u_u728) -> (let dtb_u_u729 = ((B_dData_dList.v_memName (Frontend_dPackages_dPkg.v_packageName dtb_u_u727)) dtb_u_u724) in (let dtb_u_u730 = ((B_dData_dList.v_memName (Frontend_dPackages_dPkg.v_packageName dtb_u_u727)) dtb_u_u725) in (if (if (B_dData_dBool.v_not dtb_u_u729) then true else dtb_u_u730) then (((v_depsReadyList dtb_u_u724) dtb_u_u725) dtb_u_u728) else false)))
  | B_dData_dList.C_List_Nil -> true
  | _ -> failwith "DT: impossible branch"
))

# 1005 "Vuna/Compiler/Driver/CompilerCli.vuna"
let v_depsReady = (fun (dtb_u_u731 : string B_dData_dList.t_List) (dtb_u_u732 : string B_dData_dList.t_List) (dtb_u_u733 : Frontend_dPackages_dPkg.t_Package) -> (((v_depsReadyList dtb_u_u731) dtb_u_u732) (dtb_u_u733).Frontend_dPackages_dPkg.f_Package_packageDependencies))

# 1041 "Vuna/Compiler/Driver/CompilerCli.vuna"
let v_isWorkspaceRoot = (fun (dtb_u_u734 : Frontend_dPackages_dPkg.t_Package) -> ((dtb_u_u734).Frontend_dPackages_dPkg.f_Package_packageManifest).Frontend_dManifest.f_Manifest_manifestIsWorkspace)

# 1064 "Vuna/Compiler/Driver/CompilerCli.vuna"
let rec v_printExplainLines = (fun (dtb_u_u735 : string) (dtb_u_u738 : string B_dData_dList.t_List) -> (match dtb_u_u738 with
  | B_dData_dList.C_List__x58__x58_ (dtb_u_u739, dtb_u_u740) -> (Obj.repr ((fun (dtb_u_u745 : B_dEffect_dCore.t_EffUnit) -> (let dtb_u_u748 = (((B_dEffect_dConsole.v_consolePrint_u_udirect dtb_u_u735) (dtb_u_u739 ^ "\n")) dtb_u_u745) in ((Obj.magic ((v_printExplainLines dtb_u_u735) dtb_u_u740)) dtb_u_u745)))))
  | B_dData_dList.C_List_Nil -> (let dtb_u_u750 = 0 in (Obj.repr ((fun (dtb_u_u751 : B_dEffect_dCore.t_EffUnit) -> dtb_u_u750))))
  | _ -> failwith "DT: impossible branch"
))
# 1064 "Vuna/Compiler/Driver/CompilerCli.vuna"
and v_printExplainLines_u_udirect = (fun (nConsole : string) (mc0 : string B_dData_dList.t_List) _u_ueffTok -> (match mc0 with
  | B_dData_dList.C_List__x58__x58_ (dtb_u_u739, dtb_u_u740) -> (let dtb_u_u748 = (((B_dEffect_dConsole.v_consolePrint_u_udirect nConsole) (dtb_u_u739 ^ "\n")) _u_ueffTok) in ((Obj.magic ((v_printExplainLines nConsole) dtb_u_u740)) _u_ueffTok))
  | B_dData_dList.C_List_Nil -> (let dtb_u_u750 = 0 in dtb_u_u750)
  | _ -> failwith "DT: impossible branch"
))

# 1071 "Vuna/Compiler/Driver/CompilerCli.vuna"
let v_printExplainEff = (fun (dtb_u_u752 : string) (dtb_u_u753 : string) (dtb_u_u754 : string) (dtb_u_u755 : string) (dtb_u_u756 : string) (dtb_u_u763 : Frontend_dPackages_dPkg.t_Package) -> (Obj.repr ((fun (dtb_u_u768 : B_dEffect_dCore.t_EffUnit) -> (let dtb_u_u771 = ((((((Driver_dCompile.v_explainPackageEff_u_udirect dtb_u_u752) dtb_u_u754) dtb_u_u755) dtb_u_u756) dtb_u_u763) dtb_u_u768) in ((Obj.magic ((v_printExplainLines dtb_u_u753) dtb_u_u771)) dtb_u_u768))))))

# 1071 "Vuna/Compiler/Driver/CompilerCli.vuna"
let v_printExplainEff_u_udirect = (fun (nFs : string) (nConsole : string) (nClock : string) (nEnv : string) (nProcess : string) (pkg : Frontend_dPackages_dPkg.t_Package) _u_ueffTok -> (let dtb_u_u771 = ((((((Driver_dCompile.v_explainPackageEff_u_udirect nFs) nClock) nEnv) nProcess) pkg) _u_ueffTok) in ((Obj.magic ((v_printExplainLines nConsole) dtb_u_u771)) _u_ueffTok)))

# 1094 "Vuna/Compiler/Driver/CompilerCli.vuna"
let rec v_countFailures = (fun (dtb_u_u772 : int) (dtb_u_u773 : int B_dData_dList.t_List) -> (match dtb_u_u773 with
  | B_dData_dList.C_List__x58__x58_ (dtb_u_u774, dtb_u_u775) -> (if (dtb_u_u774 = 0) then ((v_countFailures dtb_u_u772) dtb_u_u775) else ((v_countFailures 1) dtb_u_u775))
  | B_dData_dList.C_List_Nil -> dtb_u_u772
  | _ -> failwith "DT: impossible branch"
))

# 1017 "Vuna/Compiler/Driver/CompilerCli.vuna"
let v_checkMembersParallel = (fun (dtb_u_u776 : string) (dtb_u_u777 : string) (dtb_u_u778 : string) (dtb_u_u779 : string) (dtb_u_u780 : string) (dtb_u_u781 : string) (dtb_u_u782 : string) (dtb_u_u791 : Frontend_dPackages_dPkg.t_Package B_dData_dList.t_List) (dtb_u_u792 : int) (dtb_u_u793 : t_CliOpts) -> (match dtb_u_u791 with
  | B_dData_dList.C_List_Nil -> (let dtb_u_u795 = { B_dData_dPair.f_Pair_first = dtb_u_u792; B_dData_dPair.f_Pair_second = dtb_u_u793 } in (Obj.repr ((fun (dtb_u_u796 : B_dEffect_dCore.t_EffUnit) -> dtb_u_u795))))
  | _ -> (Obj.repr ((fun (dtb_u_u801 : B_dEffect_dCore.t_EffUnit) -> (let dtb_u_u816 = (((v_mapEff_u_udirect (fun (dtb_u_u804 : Frontend_dPackages_dPkg.t_Package) -> (Obj.repr ((fun (dtb_u_u809 : B_dEffect_dCore.t_EffUnit) -> (let dtb_u_u812 = (((B_dEffect_dProcess.v_processSpawn_u_udirect dtb_u_u780) ((v_checkSpawnArgs dtb_u_u793) (Frontend_dPackages_dPkg.v_packageDir dtb_u_u804))) dtb_u_u809) in (let dtb_u_u814 = { B_dData_dPair.f_Pair_first = dtb_u_u804; B_dData_dPair.f_Pair_second = dtb_u_u812 } in dtb_u_u814))))))) dtb_u_u791) dtb_u_u801) in (let dtb_u_u825 = (((v_mapEff_u_udirect (fun (dtb_u_u824 : (Frontend_dPackages_dPkg.t_Package, int) B_dData_dPair.t_Pair) -> ((B_dEffect_dProcess.v_processWait dtb_u_u780) (B_dData_dPair.v_secondOf dtb_u_u824)))) dtb_u_u816) dtb_u_u801) in (let dtb_u_u827 = { B_dData_dPair.f_Pair_first = ((v_countFailures dtb_u_u792) dtb_u_u825); B_dData_dPair.f_Pair_second = dtb_u_u793 } in dtb_u_u827))))))
))

# 1017 "Vuna/Compiler/Driver/CompilerCli.vuna"
let v_checkMembersParallel_u_udirect = (fun (nFs : string) (nConsole : string) (nClock : string) (nEnv : string) (nProcess : string) (nExit : string) (nArgs : string) (mc0 : Frontend_dPackages_dPkg.t_Package B_dData_dList.t_List) (mc1 : int) (mc2 : t_CliOpts) _u_ueffTok -> (match mc0 with
  | B_dData_dList.C_List_Nil -> (let dtb_u_u795 = { B_dData_dPair.f_Pair_first = mc1; B_dData_dPair.f_Pair_second = mc2 } in dtb_u_u795)
  | _ -> (let dtb_u_u816 = (((v_mapEff_u_udirect (fun (dtb_u_u804 : Frontend_dPackages_dPkg.t_Package) -> (Obj.repr ((fun (dtb_u_u809 : B_dEffect_dCore.t_EffUnit) -> (let dtb_u_u812 = (((B_dEffect_dProcess.v_processSpawn_u_udirect nProcess) ((v_checkSpawnArgs mc2) (Frontend_dPackages_dPkg.v_packageDir dtb_u_u804))) dtb_u_u809) in (let dtb_u_u814 = { B_dData_dPair.f_Pair_first = dtb_u_u804; B_dData_dPair.f_Pair_second = dtb_u_u812 } in dtb_u_u814))))))) mc0) _u_ueffTok) in (let dtb_u_u825 = (((v_mapEff_u_udirect (fun (dtb_u_u824 : (Frontend_dPackages_dPkg.t_Package, int) B_dData_dPair.t_Pair) -> ((B_dEffect_dProcess.v_processWait nProcess) (B_dData_dPair.v_secondOf dtb_u_u824)))) dtb_u_u816) _u_ueffTok) in (let dtb_u_u827 = { B_dData_dPair.f_Pair_first = ((v_countFailures mc1) dtb_u_u825); B_dData_dPair.f_Pair_second = mc2 } in dtb_u_u827)))
))

# 987 "Vuna/Compiler/Driver/CompilerCli.vuna"
let rec v_checkMembersByLevel = (fun (dtb_u_u829 : string) (dtb_u_u830 : string) (dtb_u_u831 : string) (dtb_u_u832 : string) (dtb_u_u833 : string) (dtb_u_u834 : string) (dtb_u_u835 : string) (dtb_u_u844 : int) (dtb_u_u845 : Frontend_dPackages_dPkg.t_Package B_dData_dList.t_List) (dtb_u_u846 : string B_dData_dList.t_List) (dtb_u_u847 : string B_dData_dList.t_List) (dtb_u_u848 : int) (dtb_u_u849 : t_CliOpts) -> (if ((B_dData_dList.v_length dtb_u_u845) = 0) then (let dtb_u_u851 = { B_dData_dPair.f_Pair_first = dtb_u_u848; B_dData_dPair.f_Pair_second = dtb_u_u849 } in (Obj.repr ((fun (dtb_u_u852 : B_dEffect_dCore.t_EffUnit) -> dtb_u_u851)))) else (if (dtb_u_u844 <= 0) then ((((((((((v_checkMembersParallel dtb_u_u829) dtb_u_u830) dtb_u_u831) dtb_u_u832) dtb_u_u833) dtb_u_u834) dtb_u_u835) dtb_u_u845) dtb_u_u848) dtb_u_u849) else (let dtb_u_u853 = ((B_dData_dList.v_filter (fun (dtb_u_u864 : Frontend_dPackages_dPkg.t_Package) -> (((v_depsReady dtb_u_u846) dtb_u_u847) dtb_u_u864))) dtb_u_u845) in (let dtb_u_u854 = ((B_dData_dList.v_filter (fun (dtb_u_u863 : Frontend_dPackages_dPkg.t_Package) -> (B_dData_dBool.v_not (((v_depsReady dtb_u_u846) dtb_u_u847) dtb_u_u863)))) dtb_u_u845) in (if ((B_dData_dList.v_length dtb_u_u853) = 0) then ((((((((((v_checkMembersParallel dtb_u_u829) dtb_u_u830) dtb_u_u831) dtb_u_u832) dtb_u_u833) dtb_u_u834) dtb_u_u835) dtb_u_u845) dtb_u_u848) dtb_u_u849) else (Obj.repr ((fun (dtb_u_u859 : B_dEffect_dCore.t_EffUnit) -> (let dtb_u_u862 = (((((((((((v_checkMembersParallel_u_udirect dtb_u_u829) dtb_u_u830) dtb_u_u831) dtb_u_u832) dtb_u_u833) dtb_u_u834) dtb_u_u835) dtb_u_u853) dtb_u_u848) dtb_u_u849) dtb_u_u859) in ((Obj.magic (((((((((((((v_checkMembersByLevel dtb_u_u829) dtb_u_u830) dtb_u_u831) dtb_u_u832) dtb_u_u833) dtb_u_u834) dtb_u_u835) (dtb_u_u844 - 1)) dtb_u_u854) dtb_u_u846) ((B_dData_dList.v_append dtb_u_u847) ((B_dData_dList.v_map Frontend_dPackages_dPkg.v_packageName) dtb_u_u853))) (B_dData_dPair.v_firstOf dtb_u_u862)) (B_dData_dPair.v_secondOf dtb_u_u862))) dtb_u_u859)))))))))))
# 987 "Vuna/Compiler/Driver/CompilerCli.vuna"
and v_checkMembersByLevel_u_udirect = (fun (nFs : string) (nConsole : string) (nClock : string) (nEnv : string) (nProcess : string) (nExit : string) (nArgs : string) (fuel : int) (pending : Frontend_dPackages_dPkg.t_Package B_dData_dList.t_List) (memberNames : string B_dData_dList.t_List) (done_ : string B_dData_dList.t_List) (code : int) (o : t_CliOpts) _u_ueffTok -> (if ((B_dData_dList.v_length pending) = 0) then (let dtb_u_u851 = { B_dData_dPair.f_Pair_first = code; B_dData_dPair.f_Pair_second = o } in dtb_u_u851) else (if (fuel <= 0) then ((Obj.magic ((((((((((v_checkMembersParallel nFs) nConsole) nClock) nEnv) nProcess) nExit) nArgs) pending) code) o)) _u_ueffTok) else (let dtb_u_u853 = ((B_dData_dList.v_filter (fun (dtb_u_u864 : Frontend_dPackages_dPkg.t_Package) -> (((v_depsReady memberNames) done_) dtb_u_u864))) pending) in (let dtb_u_u854 = ((B_dData_dList.v_filter (fun (dtb_u_u863 : Frontend_dPackages_dPkg.t_Package) -> (B_dData_dBool.v_not (((v_depsReady memberNames) done_) dtb_u_u863)))) pending) in (if ((B_dData_dList.v_length dtb_u_u853) = 0) then ((Obj.magic ((((((((((v_checkMembersParallel nFs) nConsole) nClock) nEnv) nProcess) nExit) nArgs) pending) code) o)) _u_ueffTok) else (let dtb_u_u862 = (((((((((((v_checkMembersParallel_u_udirect nFs) nConsole) nClock) nEnv) nProcess) nExit) nArgs) dtb_u_u853) code) o) _u_ueffTok) in ((Obj.magic (((((((((((((v_checkMembersByLevel nFs) nConsole) nClock) nEnv) nProcess) nExit) nArgs) (fuel - 1)) dtb_u_u854) memberNames) ((B_dData_dList.v_append done_) ((B_dData_dList.v_map Frontend_dPackages_dPkg.v_packageName) dtb_u_u853))) (B_dData_dPair.v_firstOf dtb_u_u862)) (B_dData_dPair.v_secondOf dtb_u_u862))) _u_ueffTok))))))))

# 1251 "Vuna/Compiler/Driver/CompilerCli.vuna"
let v_workspaceMultiOut = (fun (dtb_u_u865 : Frontend_dPackages_dPkg.t_Workspace) -> (match (dtb_u_u865).Frontend_dPackages_dPkg.f_Workspace_workspaceRoot with
  | B_dData_dMaybe.C_Maybe_Just (dtb_u_u866) -> (v_isWorkspaceRoot dtb_u_u866)
  | B_dData_dMaybe.C_Maybe_Nothing -> true
  | _ -> failwith "DT: impossible branch"
))

# 1259 "Vuna/Compiler/Driver/CompilerCli.vuna"
let v_isSingleLibraryPackage = (fun (dtb_u_u867 : string) (dtb_u_u870 : Frontend_dPackages_dPkg.t_Package B_dData_dList.t_List) -> (match dtb_u_u870 with
  | B_dData_dList.C_List__x58__x58_ (dtb_u_u871, dtb_u_u872) -> (match dtb_u_u872 with
  | B_dData_dList.C_List_Nil -> (Obj.repr ((fun (dtb_u_u877 : B_dEffect_dCore.t_EffUnit) -> (let dtb_u_u880 = (((B_dEffect_dFs.v_fsFileExists_u_udirect dtb_u_u867) (Frontend_dPackages_dPkg.v_packageEntry dtb_u_u871)) dtb_u_u877) in (let dtb_u_u882 = (B_dData_dBool.v_not dtb_u_u880) in dtb_u_u882)))))
  | _ -> (let dtb_u_u885 = false in (Obj.repr ((fun (dtb_u_u886 : B_dEffect_dCore.t_EffUnit) -> dtb_u_u885))))
)
  | _ -> (let dtb_u_u888 = false in (Obj.repr ((fun (dtb_u_u889 : B_dEffect_dCore.t_EffUnit) -> dtb_u_u888))))
))

# 1259 "Vuna/Compiler/Driver/CompilerCli.vuna"
let v_isSingleLibraryPackage_u_udirect = (fun (nFs : string) (mc0 : Frontend_dPackages_dPkg.t_Package B_dData_dList.t_List) _u_ueffTok -> (match mc0 with
  | B_dData_dList.C_List__x58__x58_ (dtb_u_u871, dtb_u_u872) -> (match dtb_u_u872 with
  | B_dData_dList.C_List_Nil -> (let dtb_u_u880 = (((B_dEffect_dFs.v_fsFileExists_u_udirect nFs) (Frontend_dPackages_dPkg.v_packageEntry dtb_u_u871)) _u_ueffTok) in (let dtb_u_u882 = (B_dData_dBool.v_not dtb_u_u880) in dtb_u_u882))
  | _ -> (let dtb_u_u885 = false in dtb_u_u885)
)
  | _ -> (let dtb_u_u888 = false in dtb_u_u888)
))

# 1266 "Vuna/Compiler/Driver/CompilerCli.vuna"
let v_libraryOnlyMessage = (fun (dtb_u_u890 : Frontend_dPackages_dPkg.t_Package B_dData_dList.t_List) -> (match dtb_u_u890 with
  | B_dData_dList.C_List_Nil -> "no package to build"
  | B_dData_dList.C_List__x58__x58_ (dtb_u_u891, dtb_u_u892) -> (String.concat "" ["library package "; (Frontend_dPackages_dPkg.v_packageName dtb_u_u891); " has no app/Main.vuna (an executable package is required; use check for libraries)"])
  | _ -> failwith "DT: impossible branch"
))

# 1278 "Vuna/Compiler/Driver/CompilerCli.vuna"
let rec v_findPackageByName = (fun (dtb_u_u893 : string) (dtb_u_u894 : Frontend_dPackages_dPkg.t_Package B_dData_dList.t_List) -> (match dtb_u_u894 with
  | B_dData_dList.C_List__x58__x58_ (dtb_u_u895, dtb_u_u896) -> (if ((Frontend_dPackages_dPkg.v_packageName dtb_u_u895) = dtb_u_u893) then (B_dData_dMaybe.C_Maybe_Just (dtb_u_u895)) else ((v_findPackageByName dtb_u_u893) dtb_u_u896))
  | B_dData_dList.C_List_Nil -> B_dData_dMaybe.C_Maybe_Nothing
  | _ -> failwith "DT: impossible branch"
))

# 1271 "Vuna/Compiler/Driver/CompilerCli.vuna"
let v_selectBuildTargets = (fun (dtb_u_u897 : string B_dData_dMaybe.t_Maybe) (dtb_u_u898 : Frontend_dPackages_dPkg.t_Package B_dData_dList.t_List) -> (match dtb_u_u897 with
  | B_dData_dMaybe.C_Maybe_Just (dtb_u_u899) -> (match ((v_findPackageByName dtb_u_u899) dtb_u_u898) with
  | B_dData_dMaybe.C_Maybe_Nothing -> (Base_dDiag.v_err ("no such package in workspace: " ^ dtb_u_u899))
  | B_dData_dMaybe.C_Maybe_Just (dtb_u_u900) -> (Base_dDiag.C_Check_OkC ((B_dData_dList.C_List__x58__x58_ (dtb_u_u900, B_dData_dList.C_List_Nil))))
  | _ -> failwith "DT: impossible branch"
)
  | B_dData_dMaybe.C_Maybe_Nothing -> (Base_dDiag.C_Check_OkC (dtb_u_u898))
  | _ -> failwith "DT: impossible branch"
))

# 1295 "Vuna/Compiler/Driver/CompilerCli.vuna"
let v_buildNativeOne = (fun (dtb_u_u901 : string) (dtb_u_u902 : string) (dtb_u_u903 : string) (dtb_u_u904 : string) (dtb_u_u910 : bool) (dtb_u_u911 : bool) (dtb_u_u912 : string B_dData_dMaybe.t_Maybe) (dtb_u_u913 : Frontend_dPackages_dPkg.t_Package) (dtb_u_u914 : t_CliOpts) -> (let dtb_u_u915 = (Frontend_dPackages_dPkg.v_packageName dtb_u_u913) in (let dtb_u_u916 = (match dtb_u_u912 with
  | B_dData_dMaybe.C_Maybe_Just (dtb_u_u988) -> (if dtb_u_u911 then (String.concat "" [dtb_u_u988; "/"; dtb_u_u915]) else dtb_u_u988)
  | B_dData_dMaybe.C_Maybe_Nothing -> ((Frontend_dPackages_dPkg.v_packageDir dtb_u_u913) ^ "/.output")
  | _ -> failwith "DT: impossible branch"
) in (let dtb_u_u917 = (dtb_u_u916 ^ "/build.sh") in (let dtb_u_u918 = (dtb_u_u916 ^ "/bin") in (let dtb_u_u919 = (String.concat "" [dtb_u_u918; "/"; dtb_u_u915]) in (Obj.repr ((fun (dtb_u_u924 : B_dEffect_dCore.t_EffUnit) -> (let dtb_u_u927 = (((((((((Driver_dTarget.v_compileBackend_u_udirect dtb_u_u901) dtb_u_u903) dtb_u_u904) ((Frontend_dPackages_dPkg.v_contextWithRelease (dtb_u_u914).f_CliOpts_optRelease) (Frontend_dPackages_dPkg.v_packageContext dtb_u_u913))) "native") (Frontend_dPackages_dPkg.v_packageEntry dtb_u_u913)) true) dtb_u_u916) dtb_u_u924) in (match dtb_u_u927 with
  | Base_dDiag.C_Check_ErrC (dtb_u_u928) -> ((Obj.magic ((((v_printDiag dtb_u_u901) dtb_u_u902) dtb_u_u914) dtb_u_u928)) dtb_u_u924)
  | Base_dDiag.C_Check_OkC (dtb_u_u929) -> (let dtb_u_u930 = (B_dData_dPair.v_firstOf dtb_u_u929) in (let dtb_u_u938 = ((((B_dEffect_dFs.v_fsWriteFile_u_udirect dtb_u_u901) dtb_u_u917) ((Driver_dTargetBuild.v_nativeBuildScript dtb_u_u915) dtb_u_u930)) dtb_u_u924) in (if dtb_u_u910 then (let dtb_u_u946 = (((B_dEffect_dConsole.v_consolePrint_u_udirect dtb_u_u902) (String.concat "" ["wrote "; dtb_u_u917; "\n"])) dtb_u_u924) in (let dtb_u_u948 = { B_dData_dPair.f_Pair_first = 0; B_dData_dPair.f_Pair_second = dtb_u_u914 } in dtb_u_u948)) else (let dtb_u_u957 = ((((Driver_dCompile.v_ensureDirPath_u_udirect dtb_u_u901) dtb_u_u904) dtb_u_u918) dtb_u_u924) in (let dtb_u_u965 = ((((B_dEffect_dProcess.v_processRunIn_u_udirect dtb_u_u904) dtb_u_u916) (B_dData_dList.C_List__x58__x58_ ("sh", (B_dData_dList.C_List__x58__x58_ ("build.sh", B_dData_dList.C_List_Nil))))) dtb_u_u924) in (if (dtb_u_u965 = 0) then (let dtb_u_u973 = (((B_dEffect_dConsole.v_consolePrint_u_udirect dtb_u_u902) (String.concat "" ["wrote "; dtb_u_u919; "\n"])) dtb_u_u924) in (let dtb_u_u975 = { B_dData_dPair.f_Pair_first = 0; B_dData_dPair.f_Pair_second = dtb_u_u914 } in dtb_u_u975)) else (let dtb_u_u984 = (((B_dEffect_dConsole.v_consolePrint_u_udirect dtb_u_u902) (String.concat "" ["native link failed: cc exited "; (string_of_int dtb_u_u965); "\n"])) dtb_u_u924) in (let dtb_u_u986 = { B_dData_dPair.f_Pair_first = 1; B_dData_dPair.f_Pair_second = dtb_u_u914 } in dtb_u_u986))))))))
  | _ -> failwith "DT: impossible branch"
)))))))))))

# 1295 "Vuna/Compiler/Driver/CompilerCli.vuna"
let v_buildNativeOne_u_udirect = (fun (nFs : string) (nConsole : string) (nEnv : string) (nProcess : string) (noCompile : bool) (multiOut : bool) (outM : string B_dData_dMaybe.t_Maybe) (pkg : Frontend_dPackages_dPkg.t_Package) (o : t_CliOpts) _u_ueffTok -> (let dtb_u_u915 = (Frontend_dPackages_dPkg.v_packageName pkg) in (let dtb_u_u916 = (match outM with
  | B_dData_dMaybe.C_Maybe_Just (dtb_u_u988) -> (if multiOut then (String.concat "" [dtb_u_u988; "/"; dtb_u_u915]) else dtb_u_u988)
  | B_dData_dMaybe.C_Maybe_Nothing -> ((Frontend_dPackages_dPkg.v_packageDir pkg) ^ "/.output")
  | _ -> failwith "DT: impossible branch"
) in (let dtb_u_u917 = (dtb_u_u916 ^ "/build.sh") in (let dtb_u_u918 = (dtb_u_u916 ^ "/bin") in (let dtb_u_u919 = (String.concat "" [dtb_u_u918; "/"; dtb_u_u915]) in (let dtb_u_u927 = (((((((((Driver_dTarget.v_compileBackend_u_udirect nFs) nEnv) nProcess) ((Frontend_dPackages_dPkg.v_contextWithRelease (o).f_CliOpts_optRelease) (Frontend_dPackages_dPkg.v_packageContext pkg))) "native") (Frontend_dPackages_dPkg.v_packageEntry pkg)) true) dtb_u_u916) _u_ueffTok) in (match dtb_u_u927 with
  | Base_dDiag.C_Check_ErrC (dtb_u_u928) -> ((Obj.magic ((((v_printDiag nFs) nConsole) o) dtb_u_u928)) _u_ueffTok)
  | Base_dDiag.C_Check_OkC (dtb_u_u929) -> (let dtb_u_u930 = (B_dData_dPair.v_firstOf dtb_u_u929) in (let dtb_u_u938 = ((((B_dEffect_dFs.v_fsWriteFile_u_udirect nFs) dtb_u_u917) ((Driver_dTargetBuild.v_nativeBuildScript dtb_u_u915) dtb_u_u930)) _u_ueffTok) in (if noCompile then (let dtb_u_u946 = (((B_dEffect_dConsole.v_consolePrint_u_udirect nConsole) (String.concat "" ["wrote "; dtb_u_u917; "\n"])) _u_ueffTok) in (let dtb_u_u948 = { B_dData_dPair.f_Pair_first = 0; B_dData_dPair.f_Pair_second = o } in dtb_u_u948)) else (let dtb_u_u957 = ((((Driver_dCompile.v_ensureDirPath_u_udirect nFs) nProcess) dtb_u_u918) _u_ueffTok) in (let dtb_u_u965 = ((((B_dEffect_dProcess.v_processRunIn_u_udirect nProcess) dtb_u_u916) (B_dData_dList.C_List__x58__x58_ ("sh", (B_dData_dList.C_List__x58__x58_ ("build.sh", B_dData_dList.C_List_Nil))))) _u_ueffTok) in (if (dtb_u_u965 = 0) then (let dtb_u_u973 = (((B_dEffect_dConsole.v_consolePrint_u_udirect nConsole) (String.concat "" ["wrote "; dtb_u_u919; "\n"])) _u_ueffTok) in (let dtb_u_u975 = { B_dData_dPair.f_Pair_first = 0; B_dData_dPair.f_Pair_second = o } in dtb_u_u975)) else (let dtb_u_u984 = (((B_dEffect_dConsole.v_consolePrint_u_udirect nConsole) (String.concat "" ["native link failed: cc exited "; (string_of_int dtb_u_u965); "\n"])) _u_ueffTok) in (let dtb_u_u986 = { B_dData_dPair.f_Pair_first = 1; B_dData_dPair.f_Pair_second = o } in dtb_u_u986))))))))
  | _ -> failwith "DT: impossible branch"
))))))))

# 1387 "Vuna/Compiler/Driver/CompilerCli.vuna"
let v_wasmBuildScript = (fun (dtb_u_u989 : int) -> (let dtb_u_u990 = "wasm-tools parse main.wat -o main.wasm\n" in (if (dtb_u_u989 <= 0) then ("#!/bin/sh\nset -eu\ncd \"$(dirname \"$0\")\"\n" ^ dtb_u_u990) else (let dtb_u_u991 = "--enable-gc --enable-bulk-memory --enable-tail-call --enable-reference-types" in (let dtb_u_u992 = (string_of_int dtb_u_u989) in (let dtb_u_u993 = (String.concat "" ["if ! wasm-opt "; dtb_u_u991; " -g -O"; dtb_u_u992; " main.wasm -o main.wasm.tmp 2>opt.log; then\n  cat opt.log >&2\n  rm -f opt.log main.wasm.tmp\n  exit 1\nfi\nrm -f opt.log\nmv main.wasm.tmp main.wasm\n"]) in (String.concat "" ["#!/bin/sh\nset -eu\ncd \"$(dirname \"$0\")\"\n"; dtb_u_u990; dtb_u_u993])))))))

# 1483 "Vuna/Compiler/Driver/CompilerCli.vuna"
let v_compileCodegen = (fun (dtb_u_u994 : string) (dtb_u_u995 : string) (dtb_u_u996 : string) (dtb_u_u997 : string) (dtb_u_u998 : string) (dtb_u_u1005 : Frontend_dPackages_dPkg.t_PackageContext) (dtb_u_u1006 : string) (dtb_u_u1007 : string) (dtb_u_u1008 : t_CliOpts) -> (Obj.repr ((fun (dtb_u_u1013 : B_dEffect_dCore.t_EffUnit) -> (let dtb_u_u1016 = ((((((((((Driver_dCompile.v_compileToDir_u_udirect dtb_u_u994) dtb_u_u995) dtb_u_u996) dtb_u_u997) dtb_u_u998) dtb_u_u1005) dtb_u_u1006) true) dtb_u_u1007) dtb_u_u1013) in (match dtb_u_u1016 with
  | Base_dDiag.C_Check_ErrC (dtb_u_u1017) -> ((Obj.magic ((((v_printDiag dtb_u_u994) dtb_u_u995) dtb_u_u1008) dtb_u_u1017)) dtb_u_u1013)
  | Base_dDiag.C_Check_OkC (dtb_u_u1018) -> (let dtb_u_u1020 = { B_dData_dPair.f_Pair_first = 0; B_dData_dPair.f_Pair_second = dtb_u_u1008 } in dtb_u_u1020)
  | _ -> failwith "DT: impossible branch"
))))))

# 1483 "Vuna/Compiler/Driver/CompilerCli.vuna"
let v_compileCodegen_u_udirect = (fun (nFs : string) (nConsole : string) (nClock : string) (nEnv : string) (nProcess : string) (ctx : Frontend_dPackages_dPkg.t_PackageContext) (entry : string) (outDir : string) (o : t_CliOpts) _u_ueffTok -> (let dtb_u_u1016 = ((((((((((Driver_dCompile.v_compileToDir_u_udirect nFs) nConsole) nClock) nEnv) nProcess) ctx) entry) true) outDir) _u_ueffTok) in (match dtb_u_u1016 with
  | Base_dDiag.C_Check_ErrC (dtb_u_u1017) -> ((Obj.magic ((((v_printDiag nFs) nConsole) o) dtb_u_u1017)) _u_ueffTok)
  | Base_dDiag.C_Check_OkC (dtb_u_u1018) -> (let dtb_u_u1020 = { B_dData_dPair.f_Pair_first = 0; B_dData_dPair.f_Pair_second = o } in dtb_u_u1020)
  | _ -> failwith "DT: impossible branch"
)))

# 1493 "Vuna/Compiler/Driver/CompilerCli.vuna"
let v_buildLinked = (fun (dtb_u_u1022 : string) (dtb_u_u1023 : string) (dtb_u_u1024 : string) (dtb_u_u1025 : string) (dtb_u_u1031 : Frontend_dPackages_dPkg.t_PackageContext) (dtb_u_u1032 : string) (dtb_u_u1033 : string) (dtb_u_u1034 : string) (dtb_u_u1035 : t_CliOpts) -> (Obj.repr ((fun (dtb_u_u1040 : B_dEffect_dCore.t_EffUnit) -> (let dtb_u_u1043 = ((((Driver_dCompile.v_ensureDirPath_u_udirect dtb_u_u1022) dtb_u_u1025) (dtb_u_u1033 ^ "/bin")) dtb_u_u1040) in (let dtb_u_u1051 = (((((Driver_dCompile.v_runBuildScript_u_udirect dtb_u_u1025) dtb_u_u1033) ("bin/" ^ dtb_u_u1034)) dtb_u_u1034) dtb_u_u1040) in (match dtb_u_u1051 with
  | Base_dDiag.C_Check_ErrC (dtb_u_u1052) -> ((Obj.magic ((((v_printDiag dtb_u_u1022) dtb_u_u1023) dtb_u_u1035) dtb_u_u1052)) dtb_u_u1040)
  | Base_dDiag.C_Check_OkC (dtb_u_u1053) -> (let dtb_u_u1061 = (((((((Driver_dCompile.v_writeBuildMeta_u_udirect dtb_u_u1022) dtb_u_u1024) dtb_u_u1033) dtb_u_u1031) dtb_u_u1032) true) dtb_u_u1040) in (let dtb_u_u1069 = (((B_dEffect_dConsole.v_consolePrint_u_udirect dtb_u_u1023) (String.concat "" ["built "; dtb_u_u1033; "/bin/"; dtb_u_u1034; "\n"])) dtb_u_u1040) in (let dtb_u_u1071 = { B_dData_dPair.f_Pair_first = 0; B_dData_dPair.f_Pair_second = dtb_u_u1035 } in dtb_u_u1071)))
  | _ -> failwith "DT: impossible branch"
)))))))

# 1493 "Vuna/Compiler/Driver/CompilerCli.vuna"
let v_buildLinked_u_udirect = (fun (nFs : string) (nConsole : string) (nEnv : string) (nProcess : string) (ctx : Frontend_dPackages_dPkg.t_PackageContext) (entry : string) (outDir : string) (name : string) (o : t_CliOpts) _u_ueffTok -> (let dtb_u_u1043 = ((((Driver_dCompile.v_ensureDirPath_u_udirect nFs) nProcess) (outDir ^ "/bin")) _u_ueffTok) in (let dtb_u_u1051 = (((((Driver_dCompile.v_runBuildScript_u_udirect nProcess) outDir) ("bin/" ^ name)) name) _u_ueffTok) in (match dtb_u_u1051 with
  | Base_dDiag.C_Check_ErrC (dtb_u_u1052) -> ((Obj.magic ((((v_printDiag nFs) nConsole) o) dtb_u_u1052)) _u_ueffTok)
  | Base_dDiag.C_Check_OkC (dtb_u_u1053) -> (let dtb_u_u1061 = (((((((Driver_dCompile.v_writeBuildMeta_u_udirect nFs) nEnv) outDir) ctx) entry) true) _u_ueffTok) in (let dtb_u_u1069 = (((B_dEffect_dConsole.v_consolePrint_u_udirect nConsole) (String.concat "" ["built "; outDir; "/bin/"; name; "\n"])) _u_ueffTok) in (let dtb_u_u1071 = { B_dData_dPair.f_Pair_first = 0; B_dData_dPair.f_Pair_second = o } in dtb_u_u1071)))
  | _ -> failwith "DT: impossible branch"
))))

# 1444 "Vuna/Compiler/Driver/CompilerCli.vuna"
let v_buildDefault = (fun (dtb_u_u1073 : string) (dtb_u_u1074 : string) (dtb_u_u1075 : string) (dtb_u_u1076 : string) (dtb_u_u1077 : string) (dtb_u_u1084 : Frontend_dPackages_dPkg.t_Package) (dtb_u_u1085 : Frontend_dPackages_dPkg.t_PackageContext) (dtb_u_u1086 : string) (dtb_u_u1087 : string) (dtb_u_u1088 : t_CliOpts) -> (let dtb_u_u1089 = ((Frontend_dPackages_dPkg.v_packageDir dtb_u_u1084) ^ "/.output") in (let dtb_u_u1090 = (String.concat "" [dtb_u_u1089; "/bin/"; dtb_u_u1087]) in (Obj.repr ((fun (dtb_u_u1095 : B_dEffect_dCore.t_EffUnit) -> (let dtb_u_u1098 = (((((((Driver_dCompile.v_metaUpToDate_u_udirect dtb_u_u1073) dtb_u_u1076) dtb_u_u1089) dtb_u_u1085) dtb_u_u1086) dtb_u_u1090) dtb_u_u1095) in (if dtb_u_u1098 then (let dtb_u_u1106 = (((B_dEffect_dConsole.v_consolePrint_u_udirect dtb_u_u1074) (String.concat "" ["up to date: "; dtb_u_u1090; "\n"])) dtb_u_u1095) in (let dtb_u_u1108 = { B_dData_dPair.f_Pair_first = 0; B_dData_dPair.f_Pair_second = dtb_u_u1088 } in dtb_u_u1108)) else (let dtb_u_u1117 = (((B_dEffect_dFs.v_fsRemoveTree_u_udirect dtb_u_u1073) dtb_u_u1089) dtb_u_u1095) in (let dtb_u_u1125 = ((((((((((Driver_dCompile.v_compileToDir_u_udirect dtb_u_u1073) dtb_u_u1074) dtb_u_u1075) dtb_u_u1076) dtb_u_u1077) dtb_u_u1085) dtb_u_u1086) true) dtb_u_u1089) dtb_u_u1095) in (match dtb_u_u1125 with
  | Base_dDiag.C_Check_ErrC (dtb_u_u1126) -> ((Obj.magic ((((v_printDiag dtb_u_u1073) dtb_u_u1074) dtb_u_u1088) dtb_u_u1126)) dtb_u_u1095)
  | Base_dDiag.C_Check_OkC (dtb_u_u1127) -> ((Obj.magic (((((((((v_buildLinked dtb_u_u1073) dtb_u_u1074) dtb_u_u1076) dtb_u_u1077) dtb_u_u1085) dtb_u_u1086) dtb_u_u1089) dtb_u_u1087) dtb_u_u1088)) dtb_u_u1095)
  | _ -> failwith "DT: impossible branch"
)))))))))))

# 1444 "Vuna/Compiler/Driver/CompilerCli.vuna"
let v_buildDefault_u_udirect = (fun (nFs : string) (nConsole : string) (nClock : string) (nEnv : string) (nProcess : string) (pkg : Frontend_dPackages_dPkg.t_Package) (ctx : Frontend_dPackages_dPkg.t_PackageContext) (entry : string) (name : string) (o : t_CliOpts) _u_ueffTok -> (let dtb_u_u1089 = ((Frontend_dPackages_dPkg.v_packageDir pkg) ^ "/.output") in (let dtb_u_u1090 = (String.concat "" [dtb_u_u1089; "/bin/"; name]) in (let dtb_u_u1098 = (((((((Driver_dCompile.v_metaUpToDate_u_udirect nFs) nEnv) dtb_u_u1089) ctx) entry) dtb_u_u1090) _u_ueffTok) in (if dtb_u_u1098 then (let dtb_u_u1106 = (((B_dEffect_dConsole.v_consolePrint_u_udirect nConsole) (String.concat "" ["up to date: "; dtb_u_u1090; "\n"])) _u_ueffTok) in (let dtb_u_u1108 = { B_dData_dPair.f_Pair_first = 0; B_dData_dPair.f_Pair_second = o } in dtb_u_u1108)) else (let dtb_u_u1117 = (((B_dEffect_dFs.v_fsRemoveTree_u_udirect nFs) dtb_u_u1089) _u_ueffTok) in (let dtb_u_u1125 = ((((((((((Driver_dCompile.v_compileToDir_u_udirect nFs) nConsole) nClock) nEnv) nProcess) ctx) entry) true) dtb_u_u1089) _u_ueffTok) in (match dtb_u_u1125 with
  | Base_dDiag.C_Check_ErrC (dtb_u_u1126) -> ((Obj.magic ((((v_printDiag nFs) nConsole) o) dtb_u_u1126)) _u_ueffTok)
  | Base_dDiag.C_Check_OkC (dtb_u_u1127) -> ((Obj.magic (((((((((v_buildLinked nFs) nConsole) nEnv) nProcess) ctx) entry) dtb_u_u1089) name) o)) _u_ueffTok)
  | _ -> failwith "DT: impossible branch"
))))))))

# 1464 "Vuna/Compiler/Driver/CompilerCli.vuna"
let v_buildExplicit = (fun (dtb_u_u1128 : string) (dtb_u_u1129 : string) (dtb_u_u1130 : string) (dtb_u_u1131 : string) (dtb_u_u1132 : string) (dtb_u_u1139 : string) (dtb_u_u1140 : bool) (dtb_u_u1141 : Frontend_dPackages_dPkg.t_Package) (dtb_u_u1142 : Frontend_dPackages_dPkg.t_PackageContext) (dtb_u_u1143 : string) (dtb_u_u1144 : t_CliOpts) -> (let dtb_u_u1145 = (Frontend_dPackages_dPkg.v_packageName dtb_u_u1141) in (let dtb_u_u1146 = (if dtb_u_u1140 then (String.concat "" [dtb_u_u1139; "/"; dtb_u_u1145]) else dtb_u_u1139) in (let dtb_u_u1147 = (String.concat "" [dtb_u_u1146; "/bin/"; dtb_u_u1145]) in (Obj.repr ((fun (dtb_u_u1152 : B_dEffect_dCore.t_EffUnit) -> (let dtb_u_u1155 = (((((((Driver_dCompile.v_metaUpToDate_u_udirect dtb_u_u1128) dtb_u_u1131) dtb_u_u1146) dtb_u_u1142) dtb_u_u1143) dtb_u_u1147) dtb_u_u1152) in (if dtb_u_u1155 then (let dtb_u_u1163 = (((B_dEffect_dConsole.v_consolePrint_u_udirect dtb_u_u1129) (String.concat "" ["up to date: "; dtb_u_u1147; "\n"])) dtb_u_u1152) in (let dtb_u_u1165 = { B_dData_dPair.f_Pair_first = 0; B_dData_dPair.f_Pair_second = dtb_u_u1144 } in dtb_u_u1165)) else (let dtb_u_u1174 = ((((((((((Driver_dCompile.v_compileToDir_u_udirect dtb_u_u1128) dtb_u_u1129) dtb_u_u1130) dtb_u_u1131) dtb_u_u1132) dtb_u_u1142) dtb_u_u1143) true) dtb_u_u1146) dtb_u_u1152) in (match dtb_u_u1174 with
  | Base_dDiag.C_Check_ErrC (dtb_u_u1175) -> ((Obj.magic ((((v_printDiag dtb_u_u1128) dtb_u_u1129) dtb_u_u1144) dtb_u_u1175)) dtb_u_u1152)
  | Base_dDiag.C_Check_OkC (dtb_u_u1176) -> ((Obj.magic (((((((((v_buildLinked dtb_u_u1128) dtb_u_u1129) dtb_u_u1131) dtb_u_u1132) dtb_u_u1142) dtb_u_u1143) dtb_u_u1146) dtb_u_u1145) dtb_u_u1144)) dtb_u_u1152)
  | _ -> failwith "DT: impossible branch"
)))))))))))

# 1464 "Vuna/Compiler/Driver/CompilerCli.vuna"
let v_buildExplicit_u_udirect = (fun (nFs : string) (nConsole : string) (nClock : string) (nEnv : string) (nProcess : string) (out : string) (multiOut : bool) (pkg : Frontend_dPackages_dPkg.t_Package) (ctx : Frontend_dPackages_dPkg.t_PackageContext) (entry : string) (o : t_CliOpts) _u_ueffTok -> (let dtb_u_u1145 = (Frontend_dPackages_dPkg.v_packageName pkg) in (let dtb_u_u1146 = (if multiOut then (String.concat "" [out; "/"; dtb_u_u1145]) else out) in (let dtb_u_u1147 = (String.concat "" [dtb_u_u1146; "/bin/"; dtb_u_u1145]) in (let dtb_u_u1155 = (((((((Driver_dCompile.v_metaUpToDate_u_udirect nFs) nEnv) dtb_u_u1146) ctx) entry) dtb_u_u1147) _u_ueffTok) in (if dtb_u_u1155 then (let dtb_u_u1163 = (((B_dEffect_dConsole.v_consolePrint_u_udirect nConsole) (String.concat "" ["up to date: "; dtb_u_u1147; "\n"])) _u_ueffTok) in (let dtb_u_u1165 = { B_dData_dPair.f_Pair_first = 0; B_dData_dPair.f_Pair_second = o } in dtb_u_u1165)) else (let dtb_u_u1174 = ((((((((((Driver_dCompile.v_compileToDir_u_udirect nFs) nConsole) nClock) nEnv) nProcess) ctx) entry) true) dtb_u_u1146) _u_ueffTok) in (match dtb_u_u1174 with
  | Base_dDiag.C_Check_ErrC (dtb_u_u1175) -> ((Obj.magic ((((v_printDiag nFs) nConsole) o) dtb_u_u1175)) _u_ueffTok)
  | Base_dDiag.C_Check_OkC (dtb_u_u1176) -> ((Obj.magic (((((((((v_buildLinked nFs) nConsole) nEnv) nProcess) ctx) entry) dtb_u_u1146) dtb_u_u1145) o)) _u_ueffTok)
  | _ -> failwith "DT: impossible branch"
))))))))

# 1510 "Vuna/Compiler/Driver/CompilerCli.vuna"
let v_stripDotSlash = (fun (dtb_u_u1177 : string) -> (if ((B_dData_dString.v_startsWith "./") dtb_u_u1177) then (((B_dData_dString.v_substring (bi_natFromInt 2)) (bi_natFromInt ((String.length dtb_u_u1177) - 2))) dtb_u_u1177) else dtb_u_u1177))

# 1120 "Vuna/Compiler/Driver/CompilerCli.vuna"
let v_isPackageEntryPath = (fun (dtb_u_u1178 : string) (dtb_u_u1181 : Frontend_dPackages_dPkg.t_PackageContext) (dtb_u_u1182 : string) -> (match (Frontend_dPackages_dPkg.v_contextPackageOf dtb_u_u1181) with
  | B_dData_dMaybe.C_Maybe_Nothing -> (let dtb_u_u1184 = false in (Obj.repr ((fun (dtb_u_u1185 : B_dEffect_dCore.t_EffUnit) -> dtb_u_u1184))))
  | B_dData_dMaybe.C_Maybe_Just (dtb_u_u1186) -> (Obj.repr ((fun (dtb_u_u1191 : B_dEffect_dCore.t_EffUnit) -> (let dtb_u_u1194 = (((Frontend_dPackages_dPkg.v_absolutePath_u_udirect dtb_u_u1178) dtb_u_u1182) dtb_u_u1191) in (let dtb_u_u1196 = ((v_stripDotSlash dtb_u_u1194) = (v_stripDotSlash (Frontend_dPackages_dPkg.v_packageEntry dtb_u_u1186))) in dtb_u_u1196)))))
  | _ -> failwith "DT: impossible branch"
))

# 1120 "Vuna/Compiler/Driver/CompilerCli.vuna"
let v_isPackageEntryPath_u_udirect = (fun (nEnv : string) (ctx : Frontend_dPackages_dPkg.t_PackageContext) (path : string) _u_ueffTok -> (match (Frontend_dPackages_dPkg.v_contextPackageOf ctx) with
  | B_dData_dMaybe.C_Maybe_Nothing -> (let dtb_u_u1184 = false in dtb_u_u1184)
  | B_dData_dMaybe.C_Maybe_Just (dtb_u_u1186) -> (let dtb_u_u1194 = (((Frontend_dPackages_dPkg.v_absolutePath_u_udirect nEnv) path) _u_ueffTok) in (let dtb_u_u1196 = ((v_stripDotSlash dtb_u_u1194) = (v_stripDotSlash (Frontend_dPackages_dPkg.v_packageEntry dtb_u_u1186))) in dtb_u_u1196))
  | _ -> failwith "DT: impossible branch"
))

# 1114 "Vuna/Compiler/Driver/CompilerCli.vuna"
let v_isModuleFileEntry = (fun (dtb_u_u1198 : string) (dtb_u_u1199 : string) (dtb_u_u1200 : string) (dtb_u_u1205 : Frontend_dPackages_dPkg.t_PackageContext) (dtb_u_u1206 : string) -> (Obj.repr ((fun (dtb_u_u1211 : B_dEffect_dCore.t_EffUnit) -> (let dtb_u_u1214 = ((((v_isPackageEntryPath_u_udirect dtb_u_u1199) dtb_u_u1205) dtb_u_u1206) dtb_u_u1211) in (if dtb_u_u1214 then (let dtb_u_u1216 = false in dtb_u_u1216) else ((Obj.magic ((((Driver_dDt.v_dtFileHasModuleHeader dtb_u_u1198) dtb_u_u1199) dtb_u_u1200) dtb_u_u1206)) dtb_u_u1211)))))))

# 1114 "Vuna/Compiler/Driver/CompilerCli.vuna"
let v_isModuleFileEntry_u_udirect = (fun (nFs : string) (nEnv : string) (nProcess : string) (ctx : Frontend_dPackages_dPkg.t_PackageContext) (path : string) _u_ueffTok -> (let dtb_u_u1214 = ((((v_isPackageEntryPath_u_udirect nEnv) ctx) path) _u_ueffTok) in (if dtb_u_u1214 then (let dtb_u_u1216 = false in dtb_u_u1216) else ((Obj.magic ((((Driver_dDt.v_dtFileHasModuleHeader nFs) nEnv) nProcess) path)) _u_ueffTok))))

# 1515 "Vuna/Compiler/Driver/CompilerCli.vuna"
let v_ownedByFile = (fun (dtb_u_u1218 : string) (dtb_u_u1219 : Base_dDiag.t_Diagnostic) -> ((v_stripDotSlash (Base_dDiag.v_diagFileOf dtb_u_u1219)) = (v_stripDotSlash dtb_u_u1218)))

# 1131 "Vuna/Compiler/Driver/CompilerCli.vuna"
let v_checkModuleFileEntry = (fun (dtb_u_u1220 : string) (dtb_u_u1221 : string) (dtb_u_u1222 : string) (dtb_u_u1223 : string) (dtb_u_u1229 : Frontend_dPackages_dPkg.t_PackageContext) (dtb_u_u1230 : string) (dtb_u_u1231 : t_CliOpts) -> (Obj.repr ((fun (dtb_u_u1236 : B_dEffect_dCore.t_EffUnit) -> (let dtb_u_u1239 = ((((((Driver_dDt.v_dtCheckModuleFile_u_udirect dtb_u_u1220) dtb_u_u1222) dtb_u_u1223) dtb_u_u1229) dtb_u_u1230) dtb_u_u1236) in (match dtb_u_u1239 with
  | Base_dDiag.C_Check_ErrC (dtb_u_u1240) -> ((Obj.magic ((((v_printDiag dtb_u_u1220) dtb_u_u1221) dtb_u_u1231) dtb_u_u1240)) dtb_u_u1236)
  | Base_dDiag.C_Check_OkC (dtb_u_u1241) -> (let dtb_u_u1242 = ((B_dData_dList.v_filter (v_ownedByFile dtb_u_u1230)) (Base_dDiagnostics_dSink.v_dedupeWarnings dtb_u_u1241)) in (let dtb_u_u1243 = (if (if (dtb_u_u1231).f_CliOpts_optShowWarnings then true else (dtb_u_u1231).f_CliOpts_optDenyWarnings) then dtb_u_u1242 else B_dData_dList.C_List_Nil) in (let dtb_u_u1251 = ((((((v_printDiagList_u_udirect dtb_u_u1220) dtb_u_u1221) dtb_u_u1231) "") dtb_u_u1243) dtb_u_u1236) in (let dtb_u_u1253 = { B_dData_dPair.f_Pair_first = (if (if (dtb_u_u1231).f_CliOpts_optDenyWarnings then ((B_dData_dList.v_length dtb_u_u1242) > 0) else false) then 1 else 0); B_dData_dPair.f_Pair_second = (B_dData_dPair.v_secondOf dtb_u_u1251) } in dtb_u_u1253))))
  | _ -> failwith "DT: impossible branch"
))))))

# 1131 "Vuna/Compiler/Driver/CompilerCli.vuna"
let v_checkModuleFileEntry_u_udirect = (fun (nFs : string) (nConsole : string) (nEnv : string) (nProcess : string) (ctx : Frontend_dPackages_dPkg.t_PackageContext) (path : string) (o : t_CliOpts) _u_ueffTok -> (let dtb_u_u1239 = ((((((Driver_dDt.v_dtCheckModuleFile_u_udirect nFs) nEnv) nProcess) ctx) path) _u_ueffTok) in (match dtb_u_u1239 with
  | Base_dDiag.C_Check_ErrC (dtb_u_u1240) -> ((Obj.magic ((((v_printDiag nFs) nConsole) o) dtb_u_u1240)) _u_ueffTok)
  | Base_dDiag.C_Check_OkC (dtb_u_u1241) -> (let dtb_u_u1242 = ((B_dData_dList.v_filter (v_ownedByFile path)) (Base_dDiagnostics_dSink.v_dedupeWarnings dtb_u_u1241)) in (let dtb_u_u1243 = (if (if (o).f_CliOpts_optShowWarnings then true else (o).f_CliOpts_optDenyWarnings) then dtb_u_u1242 else B_dData_dList.C_List_Nil) in (let dtb_u_u1251 = ((((((v_printDiagList_u_udirect nFs) nConsole) o) "") dtb_u_u1243) _u_ueffTok) in (let dtb_u_u1253 = { B_dData_dPair.f_Pair_first = (if (if (o).f_CliOpts_optDenyWarnings then ((B_dData_dList.v_length dtb_u_u1242) > 0) else false) then 1 else 0); B_dData_dPair.f_Pair_second = (B_dData_dPair.v_secondOf dtb_u_u1251) } in dtb_u_u1253))))
  | _ -> failwith "DT: impossible branch"
)))

# 1146 "Vuna/Compiler/Driver/CompilerCli.vuna"
let v_checkEntryFile = (fun (dtb_u_u1255 : string) (dtb_u_u1256 : string) (dtb_u_u1257 : string) (dtb_u_u1258 : string) (dtb_u_u1264 : Frontend_dPackages_dPkg.t_PackageContext) (dtb_u_u1265 : string) (dtb_u_u1266 : t_CliOpts) -> (Obj.repr ((fun (dtb_u_u1271 : B_dEffect_dCore.t_EffUnit) -> (let dtb_u_u1274 = ((((((Driver_dDt.v_dtCheck_u_udirect dtb_u_u1255) dtb_u_u1257) dtb_u_u1258) dtb_u_u1264) dtb_u_u1265) dtb_u_u1271) in (match dtb_u_u1274 with
  | Base_dDiag.C_Check_ErrC (dtb_u_u1275) -> (if (dtb_u_u1266).f_CliOpts_optContinueOnError then (let dtb_u_u1283 = ((((((Driver_dDt.v_dtCheckRecovering_u_udirect dtb_u_u1255) dtb_u_u1257) dtb_u_u1258) dtb_u_u1264) dtb_u_u1265) dtb_u_u1271) in (match dtb_u_u1283 with
  | Base_dDiag.C_Check_OkC (dtb_u_u1284) -> (let dtb_u_u1285 = ((v_takeDiags (dtb_u_u1266).f_CliOpts_optMaxErrors) dtb_u_u1284) in (let dtb_u_u1293 = ((((((v_printDiagList_u_udirect dtb_u_u1255) dtb_u_u1256) dtb_u_u1266) "") dtb_u_u1285) dtb_u_u1271) in (if ((B_dData_dList.v_length dtb_u_u1285) = 0) then ((Obj.magic ((((v_printDiag dtb_u_u1255) dtb_u_u1256) (B_dData_dPair.v_secondOf dtb_u_u1293)) dtb_u_u1275)) dtb_u_u1271) else (let dtb_u_u1295 = { B_dData_dPair.f_Pair_first = 1; B_dData_dPair.f_Pair_second = (B_dData_dPair.v_secondOf dtb_u_u1293) } in dtb_u_u1295))))
  | Base_dDiag.C_Check_ErrC (dtb_u_u1297) -> ((Obj.magic ((((v_printDiag dtb_u_u1255) dtb_u_u1256) dtb_u_u1266) dtb_u_u1275)) dtb_u_u1271)
  | _ -> failwith "DT: impossible branch"
)) else ((Obj.magic ((((v_printDiag dtb_u_u1255) dtb_u_u1256) dtb_u_u1266) dtb_u_u1275)) dtb_u_u1271))
  | Base_dDiag.C_Check_OkC (dtb_u_u1298) -> (let dtb_u_u1299 = ((B_dData_dList.v_filter (v_ownedByFile dtb_u_u1265)) (Base_dDiagnostics_dSink.v_dedupeWarnings dtb_u_u1298)) in (let dtb_u_u1300 = (if (if (dtb_u_u1266).f_CliOpts_optShowWarnings then true else (dtb_u_u1266).f_CliOpts_optDenyWarnings) then dtb_u_u1299 else B_dData_dList.C_List_Nil) in (let dtb_u_u1308 = ((((((v_printDiagList_u_udirect dtb_u_u1255) dtb_u_u1256) dtb_u_u1266) "") dtb_u_u1300) dtb_u_u1271) in (let dtb_u_u1310 = { B_dData_dPair.f_Pair_first = (if (if (dtb_u_u1266).f_CliOpts_optDenyWarnings then ((B_dData_dList.v_length dtb_u_u1299) > 0) else false) then 1 else 0); B_dData_dPair.f_Pair_second = (B_dData_dPair.v_secondOf dtb_u_u1308) } in dtb_u_u1310))))
  | _ -> failwith "DT: impossible branch"
))))))

# 1146 "Vuna/Compiler/Driver/CompilerCli.vuna"
let v_checkEntryFile_u_udirect = (fun (nFs : string) (nConsole : string) (nEnv : string) (nProcess : string) (ctx : Frontend_dPackages_dPkg.t_PackageContext) (path : string) (o : t_CliOpts) _u_ueffTok -> (let dtb_u_u1274 = ((((((Driver_dDt.v_dtCheck_u_udirect nFs) nEnv) nProcess) ctx) path) _u_ueffTok) in (match dtb_u_u1274 with
  | Base_dDiag.C_Check_ErrC (dtb_u_u1275) -> (if (o).f_CliOpts_optContinueOnError then (let dtb_u_u1283 = ((((((Driver_dDt.v_dtCheckRecovering_u_udirect nFs) nEnv) nProcess) ctx) path) _u_ueffTok) in (match dtb_u_u1283 with
  | Base_dDiag.C_Check_OkC (dtb_u_u1284) -> (let dtb_u_u1285 = ((v_takeDiags (o).f_CliOpts_optMaxErrors) dtb_u_u1284) in (let dtb_u_u1293 = ((((((v_printDiagList_u_udirect nFs) nConsole) o) "") dtb_u_u1285) _u_ueffTok) in (if ((B_dData_dList.v_length dtb_u_u1285) = 0) then ((Obj.magic ((((v_printDiag nFs) nConsole) (B_dData_dPair.v_secondOf dtb_u_u1293)) dtb_u_u1275)) _u_ueffTok) else (let dtb_u_u1295 = { B_dData_dPair.f_Pair_first = 1; B_dData_dPair.f_Pair_second = (B_dData_dPair.v_secondOf dtb_u_u1293) } in dtb_u_u1295))))
  | Base_dDiag.C_Check_ErrC (dtb_u_u1297) -> ((Obj.magic ((((v_printDiag nFs) nConsole) o) dtb_u_u1275)) _u_ueffTok)
  | _ -> failwith "DT: impossible branch"
)) else ((Obj.magic ((((v_printDiag nFs) nConsole) o) dtb_u_u1275)) _u_ueffTok))
  | Base_dDiag.C_Check_OkC (dtb_u_u1298) -> (let dtb_u_u1299 = ((B_dData_dList.v_filter (v_ownedByFile path)) (Base_dDiagnostics_dSink.v_dedupeWarnings dtb_u_u1298)) in (let dtb_u_u1300 = (if (if (o).f_CliOpts_optShowWarnings then true else (o).f_CliOpts_optDenyWarnings) then dtb_u_u1299 else B_dData_dList.C_List_Nil) in (let dtb_u_u1308 = ((((((v_printDiagList_u_udirect nFs) nConsole) o) "") dtb_u_u1300) _u_ueffTok) in (let dtb_u_u1310 = { B_dData_dPair.f_Pair_first = (if (if (o).f_CliOpts_optDenyWarnings then ((B_dData_dList.v_length dtb_u_u1299) > 0) else false) then 1 else 0); B_dData_dPair.f_Pair_second = (B_dData_dPair.v_secondOf dtb_u_u1308) } in dtb_u_u1310))))
  | _ -> failwith "DT: impossible branch"
)))

# 1098 "Vuna/Compiler/Driver/CompilerCli.vuna"
let v_checkFileEntry = (fun (dtb_u_u1312 : string) (dtb_u_u1313 : string) (dtb_u_u1314 : string) (dtb_u_u1315 : string) (dtb_u_u1321 : string) (dtb_u_u1322 : t_CliOpts) -> (Obj.repr ((fun (dtb_u_u1327 : B_dEffect_dCore.t_EffUnit) -> (let dtb_u_u1330 = ((((Frontend_dPackages_dPkg.v_contextForFile_u_udirect dtb_u_u1312) dtb_u_u1314) dtb_u_u1321) dtb_u_u1327) in (match dtb_u_u1330 with
  | Base_dDiag.C_Check_ErrC (dtb_u_u1331) -> ((Obj.magic ((((v_printDiag dtb_u_u1312) dtb_u_u1313) dtb_u_u1322) dtb_u_u1331)) dtb_u_u1327)
  | Base_dDiag.C_Check_OkC (dtb_u_u1332) -> (let dtb_u_u1333 = ((Frontend_dPackages_dPkg.v_contextWithRelease (dtb_u_u1322).f_CliOpts_optRelease) dtb_u_u1332) in (let dtb_u_u1334 = ((v_applyDiagConfig (Frontend_dPackages_dPkg.v_contextPackageOf dtb_u_u1333)) dtb_u_u1322) in (let dtb_u_u1342 = ((((((v_isModuleFileEntry_u_udirect dtb_u_u1312) dtb_u_u1314) dtb_u_u1315) dtb_u_u1333) dtb_u_u1321) dtb_u_u1327) in (if dtb_u_u1342 then ((Obj.magic (((((((v_checkModuleFileEntry dtb_u_u1312) dtb_u_u1313) dtb_u_u1314) dtb_u_u1315) dtb_u_u1333) dtb_u_u1321) dtb_u_u1334)) dtb_u_u1327) else ((Obj.magic (((((((v_checkEntryFile dtb_u_u1312) dtb_u_u1313) dtb_u_u1314) dtb_u_u1315) dtb_u_u1333) dtb_u_u1321) dtb_u_u1334)) dtb_u_u1327)))))
  | _ -> failwith "DT: impossible branch"
))))))

# 1098 "Vuna/Compiler/Driver/CompilerCli.vuna"
let v_checkFileEntry_u_udirect = (fun (nFs : string) (nConsole : string) (nEnv : string) (nProcess : string) (path : string) (o : t_CliOpts) _u_ueffTok -> (let dtb_u_u1330 = ((((Frontend_dPackages_dPkg.v_contextForFile_u_udirect nFs) nEnv) path) _u_ueffTok) in (match dtb_u_u1330 with
  | Base_dDiag.C_Check_ErrC (dtb_u_u1331) -> ((Obj.magic ((((v_printDiag nFs) nConsole) o) dtb_u_u1331)) _u_ueffTok)
  | Base_dDiag.C_Check_OkC (dtb_u_u1332) -> (let dtb_u_u1333 = ((Frontend_dPackages_dPkg.v_contextWithRelease (o).f_CliOpts_optRelease) dtb_u_u1332) in (let dtb_u_u1334 = ((v_applyDiagConfig (Frontend_dPackages_dPkg.v_contextPackageOf dtb_u_u1333)) o) in (let dtb_u_u1342 = ((((((v_isModuleFileEntry_u_udirect nFs) nEnv) nProcess) dtb_u_u1333) path) _u_ueffTok) in (if dtb_u_u1342 then ((Obj.magic (((((((v_checkModuleFileEntry nFs) nConsole) nEnv) nProcess) dtb_u_u1333) path) dtb_u_u1334)) _u_ueffTok) else ((Obj.magic (((((((v_checkEntryFile nFs) nConsole) nEnv) nProcess) dtb_u_u1333) path) dtb_u_u1334)) _u_ueffTok)))))
  | _ -> failwith "DT: impossible branch"
)))

# 1519 "Vuna/Compiler/Driver/CompilerCli.vuna"
let v_ownedByPackage = (fun (dtb_u_u1343 : Frontend_dPackages_dPkg.t_Package) (dtb_u_u1344 : Base_dDiag.t_Diagnostic) -> (let dtb_u_u1345 = (v_stripDotSlash (Frontend_dPackages_dPkg.v_packageDir dtb_u_u1343)) in (let dtb_u_u1346 = (v_stripDotSlash (Base_dDiag.v_diagFileOf dtb_u_u1344)) in (let dtb_u_u1347 = (if (if (dtb_u_u1345 = ".") then true else (dtb_u_u1345 = "")) then "" else (dtb_u_u1345 ^ "/")) in (if (if ((B_dData_dString.v_startsWith (dtb_u_u1347 ^ "lib/")) dtb_u_u1346) then true else ((B_dData_dString.v_startsWith (dtb_u_u1347 ^ "app/")) dtb_u_u1346)) then true else ((B_dData_dString.v_startsWith (dtb_u_u1347 ^ "test/")) dtb_u_u1346))))))

# 1530 "Vuna/Compiler/Driver/CompilerCli.vuna"
let v_finishWarnings = (fun (dtb_u_u1348 : string) (dtb_u_u1349 : string) (dtb_u_u1353 : Base_dDiag.t_Diagnostic B_dData_dList.t_List) (dtb_u_u1354 : int) (dtb_u_u1355 : t_CliOpts) -> (let dtb_u_u1356 = (Base_dDiagnostics_dSink.v_dedupeWarnings dtb_u_u1353) in (let dtb_u_u1357 = (if (if (dtb_u_u1355).f_CliOpts_optShowWarnings then true else (dtb_u_u1355).f_CliOpts_optDenyWarnings) then dtb_u_u1356 else B_dData_dList.C_List_Nil) in (Obj.repr ((fun (dtb_u_u1362 : B_dEffect_dCore.t_EffUnit) -> (let dtb_u_u1365 = ((((((v_printDiagList_u_udirect dtb_u_u1348) dtb_u_u1349) dtb_u_u1355) "") dtb_u_u1357) dtb_u_u1362) in (let dtb_u_u1367 = { B_dData_dPair.f_Pair_first = (if (if (dtb_u_u1355).f_CliOpts_optDenyWarnings then ((B_dData_dList.v_length dtb_u_u1356) > 0) else false) then 1 else dtb_u_u1354); B_dData_dPair.f_Pair_second = (B_dData_dPair.v_secondOf dtb_u_u1365) } in dtb_u_u1367))))))))

# 1530 "Vuna/Compiler/Driver/CompilerCli.vuna"
let v_finishWarnings_u_udirect = (fun (nFs : string) (nConsole : string) (warns : Base_dDiag.t_Diagnostic B_dData_dList.t_List) (code : int) (o : t_CliOpts) _u_ueffTok -> (let dtb_u_u1356 = (Base_dDiagnostics_dSink.v_dedupeWarnings warns) in (let dtb_u_u1357 = (if (if (o).f_CliOpts_optShowWarnings then true else (o).f_CliOpts_optDenyWarnings) then dtb_u_u1356 else B_dData_dList.C_List_Nil) in (let dtb_u_u1365 = ((((((v_printDiagList_u_udirect nFs) nConsole) o) "") dtb_u_u1357) _u_ueffTok) in (let dtb_u_u1367 = { B_dData_dPair.f_Pair_first = (if (if (o).f_CliOpts_optDenyWarnings then ((B_dData_dList.v_length dtb_u_u1356) > 0) else false) then 1 else code); B_dData_dPair.f_Pair_second = (B_dData_dPair.v_secondOf dtb_u_u1365) } in dtb_u_u1367)))))

# 1541 "Vuna/Compiler/Driver/CompilerCli.vuna"
let v_finishWarningsDir = (fun (dtb_u_u1369 : string) (dtb_u_u1370 : string) (dtb_u_u1371 : string) (dtb_u_u1376 : Base_dDiag.t_Diagnostic B_dData_dList.t_List) (dtb_u_u1377 : t_CliOpts) (dtb_u_u1378 : string) (dtb_u_u1379 : int) -> (let dtb_u_u1380 = (Base_dDiagnostics_dSink.v_dedupeWarnings dtb_u_u1376) in (let dtb_u_u1381 = (if (if (dtb_u_u1377).f_CliOpts_optShowWarnings then true else (dtb_u_u1377).f_CliOpts_optDenyWarnings) then dtb_u_u1380 else B_dData_dList.C_List_Nil) in (Obj.repr ((fun (dtb_u_u1386 : B_dEffect_dCore.t_EffUnit) -> (let dtb_u_u1389 = ((((((v_printDiagList_u_udirect dtb_u_u1369) dtb_u_u1370) dtb_u_u1377) "") dtb_u_u1381) dtb_u_u1386) in (if (if (dtb_u_u1377).f_CliOpts_optDenyWarnings then ((B_dData_dList.v_length dtb_u_u1380) > 0) else false) then (let dtb_u_u1397 = (((B_dEffect_dFs.v_fsRemoveTree_u_udirect dtb_u_u1369) dtb_u_u1378) dtb_u_u1386) in (let dtb_u_u1399 = { B_dData_dPair.f_Pair_first = 1; B_dData_dPair.f_Pair_second = (B_dData_dPair.v_secondOf dtb_u_u1389) } in dtb_u_u1399)) else (let dtb_u_u1402 = { B_dData_dPair.f_Pair_first = dtb_u_u1379; B_dData_dPair.f_Pair_second = (B_dData_dPair.v_secondOf dtb_u_u1389) } in dtb_u_u1402)))))))))

# 1541 "Vuna/Compiler/Driver/CompilerCli.vuna"
let v_finishWarningsDir_u_udirect = (fun (nFs : string) (nConsole : string) (nProcess : string) (warns : Base_dDiag.t_Diagnostic B_dData_dList.t_List) (o : t_CliOpts) (dir : string) (code : int) _u_ueffTok -> (let dtb_u_u1380 = (Base_dDiagnostics_dSink.v_dedupeWarnings warns) in (let dtb_u_u1381 = (if (if (o).f_CliOpts_optShowWarnings then true else (o).f_CliOpts_optDenyWarnings) then dtb_u_u1380 else B_dData_dList.C_List_Nil) in (let dtb_u_u1389 = ((((((v_printDiagList_u_udirect nFs) nConsole) o) "") dtb_u_u1381) _u_ueffTok) in (if (if (o).f_CliOpts_optDenyWarnings then ((B_dData_dList.v_length dtb_u_u1380) > 0) else false) then (let dtb_u_u1397 = (((B_dEffect_dFs.v_fsRemoveTree_u_udirect nFs) dir) _u_ueffTok) in (let dtb_u_u1399 = { B_dData_dPair.f_Pair_first = 1; B_dData_dPair.f_Pair_second = (B_dData_dPair.v_secondOf dtb_u_u1389) } in dtb_u_u1399)) else (let dtb_u_u1402 = { B_dData_dPair.f_Pair_first = code; B_dData_dPair.f_Pair_second = (B_dData_dPair.v_secondOf dtb_u_u1389) } in dtb_u_u1402))))))

# 852 "Vuna/Compiler/Driver/CompilerCli.vuna"
let v_compileFileEntry = (fun (dtb_u_u1404 : string) (dtb_u_u1405 : string) (dtb_u_u1406 : string) (dtb_u_u1407 : string) (dtb_u_u1408 : string) (dtb_u_u1415 : bool) (dtb_u_u1416 : string) (dtb_u_u1417 : string) (dtb_u_u1418 : t_CliOpts) -> (Obj.repr ((fun (dtb_u_u1423 : B_dEffect_dCore.t_EffUnit) -> (let dtb_u_u1426 = ((((Frontend_dPackages_dPkg.v_contextForFile_u_udirect dtb_u_u1404) dtb_u_u1407) dtb_u_u1416) dtb_u_u1423) in (match dtb_u_u1426 with
  | Base_dDiag.C_Check_ErrC (dtb_u_u1427) -> ((Obj.magic ((((v_printDiag dtb_u_u1404) dtb_u_u1405) dtb_u_u1418) dtb_u_u1427)) dtb_u_u1423)
  | Base_dDiag.C_Check_OkC (dtb_u_u1428) -> (let dtb_u_u1429 = ((Frontend_dPackages_dPkg.v_contextWithRelease (dtb_u_u1418).f_CliOpts_optRelease) dtb_u_u1428) in (let dtb_u_u1430 = ((v_applyDiagConfig (Frontend_dPackages_dPkg.v_contextPackageOf dtb_u_u1429)) dtb_u_u1418) in (let dtb_u_u1438 = (((((((((((v_compileToTarget_u_udirect dtb_u_u1404) dtb_u_u1405) dtb_u_u1406) dtb_u_u1407) dtb_u_u1408) dtb_u_u1429) dtb_u_u1416) dtb_u_u1415) dtb_u_u1417) (dtb_u_u1418).f_CliOpts_optTarget) dtb_u_u1423) in (match dtb_u_u1438 with
  | Base_dDiag.C_Check_ErrC (dtb_u_u1439) -> ((Obj.magic ((((v_printDiag dtb_u_u1404) dtb_u_u1405) dtb_u_u1430) dtb_u_u1439)) dtb_u_u1423)
  | Base_dDiag.C_Check_OkC (dtb_u_u1440) -> ((Obj.magic (((((((v_finishWarningsDir dtb_u_u1404) dtb_u_u1405) dtb_u_u1408) (B_dData_dPair.v_secondOf dtb_u_u1440)) dtb_u_u1430) dtb_u_u1417) 0)) dtb_u_u1423)
  | _ -> failwith "DT: impossible branch"
))))
  | _ -> failwith "DT: impossible branch"
))))))

# 852 "Vuna/Compiler/Driver/CompilerCli.vuna"
let v_compileFileEntry_u_udirect = (fun (nFs : string) (nConsole : string) (nClock : string) (nEnv : string) (nProcess : string) (printResult : bool) (entry : string) (outDir : string) (o : t_CliOpts) _u_ueffTok -> (let dtb_u_u1426 = ((((Frontend_dPackages_dPkg.v_contextForFile_u_udirect nFs) nEnv) entry) _u_ueffTok) in (match dtb_u_u1426 with
  | Base_dDiag.C_Check_ErrC (dtb_u_u1427) -> ((Obj.magic ((((v_printDiag nFs) nConsole) o) dtb_u_u1427)) _u_ueffTok)
  | Base_dDiag.C_Check_OkC (dtb_u_u1428) -> (let dtb_u_u1429 = ((Frontend_dPackages_dPkg.v_contextWithRelease (o).f_CliOpts_optRelease) dtb_u_u1428) in (let dtb_u_u1430 = ((v_applyDiagConfig (Frontend_dPackages_dPkg.v_contextPackageOf dtb_u_u1429)) o) in (let dtb_u_u1438 = (((((((((((v_compileToTarget_u_udirect nFs) nConsole) nClock) nEnv) nProcess) dtb_u_u1429) entry) printResult) outDir) (o).f_CliOpts_optTarget) _u_ueffTok) in (match dtb_u_u1438 with
  | Base_dDiag.C_Check_ErrC (dtb_u_u1439) -> ((Obj.magic ((((v_printDiag nFs) nConsole) dtb_u_u1430) dtb_u_u1439)) _u_ueffTok)
  | Base_dDiag.C_Check_OkC (dtb_u_u1440) -> ((Obj.magic (((((((v_finishWarningsDir nFs) nConsole) nProcess) (B_dData_dPair.v_secondOf dtb_u_u1440)) dtb_u_u1430) outDir) 0)) _u_ueffTok)
  | _ -> failwith "DT: impossible branch"
))))
  | _ -> failwith "DT: impossible branch"
)))

# 868 "Vuna/Compiler/Driver/CompilerCli.vuna"
let v_compilePkgDir = (fun (dtb_u_u1441 : string) (dtb_u_u1442 : string) (dtb_u_u1443 : string) (dtb_u_u1444 : string) (dtb_u_u1445 : string) (dtb_u_u1452 : bool) (dtb_u_u1453 : string) (dtb_u_u1454 : string) (dtb_u_u1455 : t_CliOpts) -> (Obj.repr ((fun (dtb_u_u1460 : B_dEffect_dCore.t_EffUnit) -> (let dtb_u_u1463 = (((((v_executablePackage_u_udirect dtb_u_u1441) dtb_u_u1444) "compile") dtb_u_u1453) dtb_u_u1460) in (match dtb_u_u1463 with
  | Base_dDiag.C_Check_ErrC (dtb_u_u1464) -> ((Obj.magic ((((v_printDiag dtb_u_u1441) dtb_u_u1442) dtb_u_u1455) dtb_u_u1464)) dtb_u_u1460)
  | Base_dDiag.C_Check_OkC (dtb_u_u1465) -> (let dtb_u_u1466 = ((v_applyDiagConfig (B_dData_dMaybe.C_Maybe_Just (dtb_u_u1465))) dtb_u_u1455) in (let dtb_u_u1474 = (((((((((((v_compileToTarget_u_udirect dtb_u_u1441) dtb_u_u1442) dtb_u_u1443) dtb_u_u1444) dtb_u_u1445) ((Frontend_dPackages_dPkg.v_contextWithRelease (dtb_u_u1455).f_CliOpts_optRelease) (Frontend_dPackages_dPkg.v_packageContext dtb_u_u1465))) (Frontend_dPackages_dPkg.v_packageEntry dtb_u_u1465)) dtb_u_u1452) dtb_u_u1454) (dtb_u_u1455).f_CliOpts_optTarget) dtb_u_u1460) in (match dtb_u_u1474 with
  | Base_dDiag.C_Check_ErrC (dtb_u_u1475) -> ((Obj.magic ((((v_printDiag dtb_u_u1441) dtb_u_u1442) dtb_u_u1466) dtb_u_u1475)) dtb_u_u1460)
  | Base_dDiag.C_Check_OkC (dtb_u_u1476) -> ((Obj.magic (((((((v_finishWarningsDir dtb_u_u1441) dtb_u_u1442) dtb_u_u1445) (B_dData_dPair.v_secondOf dtb_u_u1476)) dtb_u_u1466) dtb_u_u1454) 0)) dtb_u_u1460)
  | _ -> failwith "DT: impossible branch"
)))
  | _ -> failwith "DT: impossible branch"
))))))

# 868 "Vuna/Compiler/Driver/CompilerCli.vuna"
let v_compilePkgDir_u_udirect = (fun (nFs : string) (nConsole : string) (nClock : string) (nEnv : string) (nProcess : string) (printResult : bool) (dir : string) (outDir : string) (o : t_CliOpts) _u_ueffTok -> (let dtb_u_u1463 = (((((v_executablePackage_u_udirect nFs) nEnv) "compile") dir) _u_ueffTok) in (match dtb_u_u1463 with
  | Base_dDiag.C_Check_ErrC (dtb_u_u1464) -> ((Obj.magic ((((v_printDiag nFs) nConsole) o) dtb_u_u1464)) _u_ueffTok)
  | Base_dDiag.C_Check_OkC (dtb_u_u1465) -> (let dtb_u_u1466 = ((v_applyDiagConfig (B_dData_dMaybe.C_Maybe_Just (dtb_u_u1465))) o) in (let dtb_u_u1474 = (((((((((((v_compileToTarget_u_udirect nFs) nConsole) nClock) nEnv) nProcess) ((Frontend_dPackages_dPkg.v_contextWithRelease (o).f_CliOpts_optRelease) (Frontend_dPackages_dPkg.v_packageContext dtb_u_u1465))) (Frontend_dPackages_dPkg.v_packageEntry dtb_u_u1465)) printResult) outDir) (o).f_CliOpts_optTarget) _u_ueffTok) in (match dtb_u_u1474 with
  | Base_dDiag.C_Check_ErrC (dtb_u_u1475) -> ((Obj.magic ((((v_printDiag nFs) nConsole) dtb_u_u1466) dtb_u_u1475)) _u_ueffTok)
  | Base_dDiag.C_Check_OkC (dtb_u_u1476) -> ((Obj.magic (((((((v_finishWarningsDir nFs) nConsole) nProcess) (B_dData_dPair.v_secondOf dtb_u_u1476)) dtb_u_u1466) outDir) 0)) _u_ueffTok)
  | _ -> failwith "DT: impossible branch"
)))
  | _ -> failwith "DT: impossible branch"
)))

# 827 "Vuna/Compiler/Driver/CompilerCli.vuna"
let v_compileRun = (fun (dtb_u_u1477 : string) (dtb_u_u1478 : string) (dtb_u_u1479 : string) (dtb_u_u1480 : string) (dtb_u_u1481 : string) (dtb_u_u1488 : bool) (dtb_u_u1489 : string) (dtb_u_u1490 : string) (dtb_u_u1491 : t_CliOpts) -> (Obj.repr ((fun (dtb_u_u1496 : B_dEffect_dCore.t_EffUnit) -> (let dtb_u_u1499 = (((B_dEffect_dFs.v_fsFileExists_u_udirect dtb_u_u1477) dtb_u_u1489) dtb_u_u1496) in (if dtb_u_u1499 then (let dtb_u_u1507 = (((B_dEffect_dFs.v_fsIsDirectory_u_udirect dtb_u_u1477) dtb_u_u1489) dtb_u_u1496) in (if dtb_u_u1507 then ((Obj.magic (((((((((v_compilePkgDir dtb_u_u1477) dtb_u_u1478) dtb_u_u1479) dtb_u_u1480) dtb_u_u1481) dtb_u_u1488) dtb_u_u1489) dtb_u_u1490) dtb_u_u1491)) dtb_u_u1496) else ((Obj.magic (((((((((v_compileFileEntry dtb_u_u1477) dtb_u_u1478) dtb_u_u1479) dtb_u_u1480) dtb_u_u1481) dtb_u_u1488) dtb_u_u1489) dtb_u_u1490) dtb_u_u1491)) dtb_u_u1496))) else ((Obj.magic ((v_withOpts dtb_u_u1491) ((v_dtPathErr dtb_u_u1478) dtb_u_u1489))) dtb_u_u1496)))))))

# 827 "Vuna/Compiler/Driver/CompilerCli.vuna"
let v_compileRun_u_udirect = (fun (nFs : string) (nConsole : string) (nClock : string) (nEnv : string) (nProcess : string) (printResult : bool) (entry : string) (outDir : string) (o : t_CliOpts) _u_ueffTok -> (let dtb_u_u1499 = (((B_dEffect_dFs.v_fsFileExists_u_udirect nFs) entry) _u_ueffTok) in (if dtb_u_u1499 then (let dtb_u_u1507 = (((B_dEffect_dFs.v_fsIsDirectory_u_udirect nFs) entry) _u_ueffTok) in (if dtb_u_u1507 then ((Obj.magic (((((((((v_compilePkgDir nFs) nConsole) nClock) nEnv) nProcess) printResult) entry) outDir) o)) _u_ueffTok) else ((Obj.magic (((((((((v_compileFileEntry nFs) nConsole) nClock) nEnv) nProcess) printResult) entry) outDir) o)) _u_ueffTok))) else ((Obj.magic ((v_withOpts o) ((v_dtPathErr nConsole) entry))) _u_ueffTok))))

# 820 "Vuna/Compiler/Driver/CompilerCli.vuna"
let v_compileFinish = (fun (dtb_u_u1508 : string) (dtb_u_u1509 : string) (dtb_u_u1510 : string) (dtb_u_u1511 : string) (dtb_u_u1512 : string) (dtb_u_u1519 : string) (dtb_u_u1520 : bool) (dtb_u_u1521 : string B_dData_dMaybe.t_Maybe) (dtb_u_u1522 : string B_dData_dMaybe.t_Maybe) (dtb_u_u1523 : t_CliOpts) -> (match dtb_u_u1521 with
  | B_dData_dMaybe.C_Maybe_Just (dtb_u_u1524) -> (match dtb_u_u1522 with
  | B_dData_dMaybe.C_Maybe_Nothing -> ((v_withOpts dtb_u_u1523) ((v_usageErr dtb_u_u1509) dtb_u_u1519))
  | B_dData_dMaybe.C_Maybe_Just (dtb_u_u1525) -> (((((((((v_compileRun dtb_u_u1508) dtb_u_u1509) dtb_u_u1510) dtb_u_u1511) dtb_u_u1512) dtb_u_u1520) dtb_u_u1524) dtb_u_u1525) dtb_u_u1523)
  | _ -> failwith "DT: impossible branch"
)
  | B_dData_dMaybe.C_Maybe_Nothing -> ((v_withOpts dtb_u_u1523) ((v_usageErr dtb_u_u1509) dtb_u_u1519))
  | _ -> failwith "DT: impossible branch"
))

# 820 "Vuna/Compiler/Driver/CompilerCli.vuna"
let v_compileFinish_u_udirect = (fun (nFs : string) (nConsole : string) (nClock : string) (nEnv : string) (nProcess : string) (mc0 : string) (mc1 : bool) (mc2 : string B_dData_dMaybe.t_Maybe) (mc3 : string B_dData_dMaybe.t_Maybe) (mc4 : t_CliOpts) _u_ueffTok -> (match mc2 with
  | B_dData_dMaybe.C_Maybe_Just (dtb_u_u1524) -> (match mc3 with
  | B_dData_dMaybe.C_Maybe_Nothing -> ((Obj.magic ((v_withOpts mc4) ((v_usageErr nConsole) mc0))) _u_ueffTok)
  | B_dData_dMaybe.C_Maybe_Just (dtb_u_u1525) -> ((Obj.magic (((((((((v_compileRun nFs) nConsole) nClock) nEnv) nProcess) mc1) dtb_u_u1524) dtb_u_u1525) mc4)) _u_ueffTok)
  | _ -> failwith "DT: impossible branch"
)
  | B_dData_dMaybe.C_Maybe_Nothing -> ((Obj.magic ((v_withOpts mc4) ((v_usageErr nConsole) mc0))) _u_ueffTok)
  | _ -> failwith "DT: impossible branch"
))

# 794 "Vuna/Compiler/Driver/CompilerCli.vuna"
let rec v_compileParse = (fun (dtb_u_u1526 : string) (dtb_u_u1527 : string) (dtb_u_u1528 : string) (dtb_u_u1529 : string) (dtb_u_u1530 : string) (dtb_u_u1537 : string) (dtb_u_u1538 : bool) (dtb_u_u1539 : string B_dData_dMaybe.t_Maybe) (dtb_u_u1540 : string B_dData_dMaybe.t_Maybe) (dtb_u_u1541 : string B_dData_dList.t_List) (dtb_u_u1542 : t_CliOpts) -> (let dtb_u_u1543 = dtb_u_u1541 in (match dtb_u_u1543 with
  | B_dData_dList.C_List__x58__x58_ (dtb_u_u1544, dtb_u_u1545) -> (if (dtb_u_u1544 = "--no-print") then (((((((((((v_compileParse dtb_u_u1526) dtb_u_u1527) dtb_u_u1528) dtb_u_u1529) dtb_u_u1530) dtb_u_u1537) false) dtb_u_u1539) dtb_u_u1540) dtb_u_u1545) dtb_u_u1542) else (if (dtb_u_u1544 = "--release") then (((((((((((v_compileParse dtb_u_u1526) dtb_u_u1527) dtb_u_u1528) dtb_u_u1529) dtb_u_u1530) dtb_u_u1537) dtb_u_u1538) dtb_u_u1539) dtb_u_u1540) dtb_u_u1545) (v_markRelease dtb_u_u1542)) else (if (dtb_u_u1544 = "--target") then (match dtb_u_u1545 with
  | B_dData_dList.C_List__x58__x58_ (dtb_u_u1546, dtb_u_u1547) -> (if (v_isKnownTarget dtb_u_u1546) then (((((((((((v_compileParse dtb_u_u1526) dtb_u_u1527) dtb_u_u1528) dtb_u_u1529) dtb_u_u1530) dtb_u_u1537) dtb_u_u1538) dtb_u_u1539) dtb_u_u1540) dtb_u_u1547) ((v_markTarget dtb_u_u1546) dtb_u_u1542)) else ((v_withOpts dtb_u_u1542) ((v_usageErr dtb_u_u1527) dtb_u_u1537)))
  | _ -> (if ((B_dData_dString.v_startsWith "-") dtb_u_u1544) then ((v_withOpts dtb_u_u1542) (((v_removedFlag dtb_u_u1527) dtb_u_u1537) dtb_u_u1544)) else (match dtb_u_u1539 with
  | B_dData_dMaybe.C_Maybe_Nothing -> (((((((((((v_compileParse dtb_u_u1526) dtb_u_u1527) dtb_u_u1528) dtb_u_u1529) dtb_u_u1530) dtb_u_u1537) dtb_u_u1538) (B_dData_dMaybe.C_Maybe_Just (dtb_u_u1544))) dtb_u_u1540) dtb_u_u1545) dtb_u_u1542)
  | B_dData_dMaybe.C_Maybe_Just (dtb_u_u1548) -> (match dtb_u_u1540 with
  | B_dData_dMaybe.C_Maybe_Nothing -> (((((((((((v_compileParse dtb_u_u1526) dtb_u_u1527) dtb_u_u1528) dtb_u_u1529) dtb_u_u1530) dtb_u_u1537) dtb_u_u1538) dtb_u_u1539) (B_dData_dMaybe.C_Maybe_Just (dtb_u_u1544))) dtb_u_u1545) dtb_u_u1542)
  | B_dData_dMaybe.C_Maybe_Just (dtb_u_u1549) -> ((v_withOpts dtb_u_u1542) ((v_usageErr dtb_u_u1527) dtb_u_u1537))
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
))
) else (if ((B_dData_dString.v_startsWith "-") dtb_u_u1544) then ((v_withOpts dtb_u_u1542) (((v_removedFlag dtb_u_u1527) dtb_u_u1537) dtb_u_u1544)) else (match dtb_u_u1539 with
  | B_dData_dMaybe.C_Maybe_Nothing -> (((((((((((v_compileParse dtb_u_u1526) dtb_u_u1527) dtb_u_u1528) dtb_u_u1529) dtb_u_u1530) dtb_u_u1537) dtb_u_u1538) (B_dData_dMaybe.C_Maybe_Just (dtb_u_u1544))) dtb_u_u1540) dtb_u_u1545) dtb_u_u1542)
  | B_dData_dMaybe.C_Maybe_Just (dtb_u_u1550) -> (match dtb_u_u1540 with
  | B_dData_dMaybe.C_Maybe_Nothing -> (((((((((((v_compileParse dtb_u_u1526) dtb_u_u1527) dtb_u_u1528) dtb_u_u1529) dtb_u_u1530) dtb_u_u1537) dtb_u_u1538) dtb_u_u1539) (B_dData_dMaybe.C_Maybe_Just (dtb_u_u1544))) dtb_u_u1545) dtb_u_u1542)
  | B_dData_dMaybe.C_Maybe_Just (dtb_u_u1551) -> ((v_withOpts dtb_u_u1542) ((v_usageErr dtb_u_u1527) dtb_u_u1537))
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
)))))
  | B_dData_dList.C_List_Nil -> ((((((((((v_compileFinish dtb_u_u1526) dtb_u_u1527) dtb_u_u1528) dtb_u_u1529) dtb_u_u1530) dtb_u_u1537) dtb_u_u1538) dtb_u_u1539) dtb_u_u1540) dtb_u_u1542)
  | _ -> failwith "DT: impossible branch"
)))
# 794 "Vuna/Compiler/Driver/CompilerCli.vuna"
and v_compileParse_u_udirect = (fun (nFs : string) (nConsole : string) (nClock : string) (nEnv : string) (nProcess : string) (prog : string) (printResult : bool) (entry : string B_dData_dMaybe.t_Maybe) (outDir : string B_dData_dMaybe.t_Maybe) (args : string B_dData_dList.t_List) (o : t_CliOpts) _u_ueffTok -> (let dtb_u_u1543 = args in (match dtb_u_u1543 with
  | B_dData_dList.C_List__x58__x58_ (dtb_u_u1544, dtb_u_u1545) -> (if (dtb_u_u1544 = "--no-print") then ((Obj.magic (((((((((((v_compileParse nFs) nConsole) nClock) nEnv) nProcess) prog) false) entry) outDir) dtb_u_u1545) o)) _u_ueffTok) else (if (dtb_u_u1544 = "--release") then ((Obj.magic (((((((((((v_compileParse nFs) nConsole) nClock) nEnv) nProcess) prog) printResult) entry) outDir) dtb_u_u1545) (v_markRelease o))) _u_ueffTok) else (if (dtb_u_u1544 = "--target") then (match dtb_u_u1545 with
  | B_dData_dList.C_List__x58__x58_ (dtb_u_u1546, dtb_u_u1547) -> (if (v_isKnownTarget dtb_u_u1546) then ((Obj.magic (((((((((((v_compileParse nFs) nConsole) nClock) nEnv) nProcess) prog) printResult) entry) outDir) dtb_u_u1547) ((v_markTarget dtb_u_u1546) o))) _u_ueffTok) else ((Obj.magic ((v_withOpts o) ((v_usageErr nConsole) prog))) _u_ueffTok))
  | _ -> (if ((B_dData_dString.v_startsWith "-") dtb_u_u1544) then ((Obj.magic ((v_withOpts o) (((v_removedFlag nConsole) prog) dtb_u_u1544))) _u_ueffTok) else (match entry with
  | B_dData_dMaybe.C_Maybe_Nothing -> ((Obj.magic (((((((((((v_compileParse nFs) nConsole) nClock) nEnv) nProcess) prog) printResult) (B_dData_dMaybe.C_Maybe_Just (dtb_u_u1544))) outDir) dtb_u_u1545) o)) _u_ueffTok)
  | B_dData_dMaybe.C_Maybe_Just (dtb_u_u1548) -> (match outDir with
  | B_dData_dMaybe.C_Maybe_Nothing -> ((Obj.magic (((((((((((v_compileParse nFs) nConsole) nClock) nEnv) nProcess) prog) printResult) entry) (B_dData_dMaybe.C_Maybe_Just (dtb_u_u1544))) dtb_u_u1545) o)) _u_ueffTok)
  | B_dData_dMaybe.C_Maybe_Just (dtb_u_u1549) -> ((Obj.magic ((v_withOpts o) ((v_usageErr nConsole) prog))) _u_ueffTok)
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
))
) else (if ((B_dData_dString.v_startsWith "-") dtb_u_u1544) then ((Obj.magic ((v_withOpts o) (((v_removedFlag nConsole) prog) dtb_u_u1544))) _u_ueffTok) else (match entry with
  | B_dData_dMaybe.C_Maybe_Nothing -> ((Obj.magic (((((((((((v_compileParse nFs) nConsole) nClock) nEnv) nProcess) prog) printResult) (B_dData_dMaybe.C_Maybe_Just (dtb_u_u1544))) outDir) dtb_u_u1545) o)) _u_ueffTok)
  | B_dData_dMaybe.C_Maybe_Just (dtb_u_u1550) -> (match outDir with
  | B_dData_dMaybe.C_Maybe_Nothing -> ((Obj.magic (((((((((((v_compileParse nFs) nConsole) nClock) nEnv) nProcess) prog) printResult) entry) (B_dData_dMaybe.C_Maybe_Just (dtb_u_u1544))) dtb_u_u1545) o)) _u_ueffTok)
  | B_dData_dMaybe.C_Maybe_Just (dtb_u_u1551) -> ((Obj.magic ((v_withOpts o) ((v_usageErr nConsole) prog))) _u_ueffTok)
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
)))))
  | B_dData_dList.C_List_Nil -> ((Obj.magic ((((((((((v_compileFinish nFs) nConsole) nClock) nEnv) nProcess) prog) printResult) entry) outDir) o)) _u_ueffTok)
  | _ -> failwith "DT: impossible branch"
)))

# 791 "Vuna/Compiler/Driver/CompilerCli.vuna"
let v_compileArgs = (fun (dtb_u_u1552 : string) (dtb_u_u1553 : string) (dtb_u_u1554 : string) (dtb_u_u1555 : string) (dtb_u_u1556 : string) (dtb_u_u1563 : string) (dtb_u_u1564 : string B_dData_dList.t_List) (dtb_u_u1565 : t_CliOpts) -> (((((((((((v_compileParse dtb_u_u1552) dtb_u_u1553) dtb_u_u1554) dtb_u_u1555) dtb_u_u1556) dtb_u_u1563) true) B_dData_dMaybe.C_Maybe_Nothing) B_dData_dMaybe.C_Maybe_Nothing) dtb_u_u1564) dtb_u_u1565))

# 791 "Vuna/Compiler/Driver/CompilerCli.vuna"
let v_compileArgs_u_udirect = (fun (nFs : string) (nConsole : string) (nClock : string) (nEnv : string) (nProcess : string) (prog : string) (args : string B_dData_dList.t_List) (o : t_CliOpts) _u_ueffTok -> ((Obj.magic (((((((((((v_compileParse nFs) nConsole) nClock) nEnv) nProcess) prog) true) B_dData_dMaybe.C_Maybe_Nothing) B_dData_dMaybe.C_Maybe_Nothing) args) o)) _u_ueffTok))

# 1341 "Vuna/Compiler/Driver/CompilerCli.vuna"
let v_buildWasmOne = (fun (dtb_u_u1566 : string) (dtb_u_u1567 : string) (dtb_u_u1568 : string) (dtb_u_u1569 : string) (dtb_u_u1575 : bool) (dtb_u_u1576 : string B_dData_dMaybe.t_Maybe) (dtb_u_u1577 : Frontend_dPackages_dPkg.t_Package) (dtb_u_u1578 : t_CliOpts) -> (let dtb_u_u1579 = (match dtb_u_u1576 with
  | B_dData_dMaybe.C_Maybe_Just (dtb_u_u1653) -> dtb_u_u1653
  | B_dData_dMaybe.C_Maybe_Nothing -> ((Frontend_dPackages_dPkg.v_packageDir dtb_u_u1577) ^ "/.output")
  | _ -> failwith "DT: impossible branch"
) in (let dtb_u_u1580 = (dtb_u_u1579 ^ "/main.wat") in (let dtb_u_u1581 = (dtb_u_u1579 ^ "/main.wasm") in (let dtb_u_u1582 = (v_wasmBuildScript (dtb_u_u1578).f_CliOpts_optWasmOpt) in (Obj.repr ((fun (dtb_u_u1587 : B_dEffect_dCore.t_EffUnit) -> (let dtb_u_u1590 = (((((((((Driver_dTarget.v_compileBackend_u_udirect dtb_u_u1566) dtb_u_u1568) dtb_u_u1569) ((Frontend_dPackages_dPkg.v_contextWithRelease (dtb_u_u1578).f_CliOpts_optRelease) (Frontend_dPackages_dPkg.v_packageContext dtb_u_u1577))) "wasm") (Frontend_dPackages_dPkg.v_packageEntry dtb_u_u1577)) true) dtb_u_u1579) dtb_u_u1587) in (match dtb_u_u1590 with
  | Base_dDiag.C_Check_ErrC (dtb_u_u1591) -> ((Obj.magic ((((v_printDiag dtb_u_u1566) dtb_u_u1567) dtb_u_u1578) dtb_u_u1591)) dtb_u_u1587)
  | Base_dDiag.C_Check_OkC (dtb_u_u1592) -> (let dtb_u_u1600 = ((((B_dEffect_dFs.v_fsWriteFile_u_udirect dtb_u_u1566) (dtb_u_u1579 ^ "/build.sh")) dtb_u_u1582) dtb_u_u1587) in (let dtb_u_u1606 = Obj.obj ((if dtb_u_u1575 then (Obj.repr ((fun (dtb_u_u1612 : B_dEffect_dCore.t_EffUnit) -> (let dtb_u_u1615 = (((B_dEffect_dConsole.v_consolePrint_u_udirect dtb_u_u1567) (String.concat "" ["wrote "; dtb_u_u1580; "\n"])) dtb_u_u1612) in (let dtb_u_u1617 = 0 in dtb_u_u1617))))) else (Obj.repr ((fun (dtb_u_u1623 : B_dEffect_dCore.t_EffUnit) -> (let dtb_u_u1626 = ((((B_dEffect_dProcess.v_processRunIn_u_udirect dtb_u_u1569) dtb_u_u1579) (B_dData_dList.C_List__x58__x58_ ("sh", (B_dData_dList.C_List__x58__x58_ ("build.sh", B_dData_dList.C_List_Nil))))) dtb_u_u1623) in (if (dtb_u_u1626 = 0) then (let dtb_u_u1634 = (((B_dEffect_dConsole.v_consolePrint_u_udirect dtb_u_u1567) (String.concat "" ["wrote "; dtb_u_u1581; "\n"])) dtb_u_u1623) in (let dtb_u_u1636 = 0 in dtb_u_u1636)) else (let dtb_u_u1645 = (((B_dEffect_dConsole.v_consolePrint_u_udirect dtb_u_u1567) (String.concat "" ["wasm assembly failed: build.sh exited "; (string_of_int dtb_u_u1626); "\n"])) dtb_u_u1623) in (let dtb_u_u1647 = 1 in dtb_u_u1647))))))))) in (let dtb_u_u1649 = (dtb_u_u1606 dtb_u_u1587) in (if (dtb_u_u1649 = 0) then ((Obj.magic (((((((v_finishWarningsDir dtb_u_u1566) dtb_u_u1567) dtb_u_u1569) (B_dData_dPair.v_secondOf dtb_u_u1592)) dtb_u_u1578) dtb_u_u1579) 0)) dtb_u_u1587) else (let dtb_u_u1651 = { B_dData_dPair.f_Pair_first = 1; B_dData_dPair.f_Pair_second = dtb_u_u1578 } in dtb_u_u1651)))))
  | _ -> failwith "DT: impossible branch"
))))))))))

# 1341 "Vuna/Compiler/Driver/CompilerCli.vuna"
let v_buildWasmOne_u_udirect = (fun (nFs : string) (nConsole : string) (nEnv : string) (nProcess : string) (noCompile : bool) (outM : string B_dData_dMaybe.t_Maybe) (pkg : Frontend_dPackages_dPkg.t_Package) (o : t_CliOpts) _u_ueffTok -> (let dtb_u_u1579 = (match outM with
  | B_dData_dMaybe.C_Maybe_Just (dtb_u_u1653) -> dtb_u_u1653
  | B_dData_dMaybe.C_Maybe_Nothing -> ((Frontend_dPackages_dPkg.v_packageDir pkg) ^ "/.output")
  | _ -> failwith "DT: impossible branch"
) in (let dtb_u_u1580 = (dtb_u_u1579 ^ "/main.wat") in (let dtb_u_u1581 = (dtb_u_u1579 ^ "/main.wasm") in (let dtb_u_u1582 = (v_wasmBuildScript (o).f_CliOpts_optWasmOpt) in (let dtb_u_u1590 = (((((((((Driver_dTarget.v_compileBackend_u_udirect nFs) nEnv) nProcess) ((Frontend_dPackages_dPkg.v_contextWithRelease (o).f_CliOpts_optRelease) (Frontend_dPackages_dPkg.v_packageContext pkg))) "wasm") (Frontend_dPackages_dPkg.v_packageEntry pkg)) true) dtb_u_u1579) _u_ueffTok) in (match dtb_u_u1590 with
  | Base_dDiag.C_Check_ErrC (dtb_u_u1591) -> ((Obj.magic ((((v_printDiag nFs) nConsole) o) dtb_u_u1591)) _u_ueffTok)
  | Base_dDiag.C_Check_OkC (dtb_u_u1592) -> (let dtb_u_u1600 = ((((B_dEffect_dFs.v_fsWriteFile_u_udirect nFs) (dtb_u_u1579 ^ "/build.sh")) dtb_u_u1582) _u_ueffTok) in (let dtb_u_u1606 = Obj.obj ((if noCompile then (Obj.repr ((fun (dtb_u_u1612 : B_dEffect_dCore.t_EffUnit) -> (let dtb_u_u1615 = (((B_dEffect_dConsole.v_consolePrint_u_udirect nConsole) (String.concat "" ["wrote "; dtb_u_u1580; "\n"])) dtb_u_u1612) in (let dtb_u_u1617 = 0 in dtb_u_u1617))))) else (Obj.repr ((fun (dtb_u_u1623 : B_dEffect_dCore.t_EffUnit) -> (let dtb_u_u1626 = ((((B_dEffect_dProcess.v_processRunIn_u_udirect nProcess) dtb_u_u1579) (B_dData_dList.C_List__x58__x58_ ("sh", (B_dData_dList.C_List__x58__x58_ ("build.sh", B_dData_dList.C_List_Nil))))) dtb_u_u1623) in (if (dtb_u_u1626 = 0) then (let dtb_u_u1634 = (((B_dEffect_dConsole.v_consolePrint_u_udirect nConsole) (String.concat "" ["wrote "; dtb_u_u1581; "\n"])) dtb_u_u1623) in (let dtb_u_u1636 = 0 in dtb_u_u1636)) else (let dtb_u_u1645 = (((B_dEffect_dConsole.v_consolePrint_u_udirect nConsole) (String.concat "" ["wasm assembly failed: build.sh exited "; (string_of_int dtb_u_u1626); "\n"])) dtb_u_u1623) in (let dtb_u_u1647 = 1 in dtb_u_u1647))))))))) in (let dtb_u_u1649 = (dtb_u_u1606 _u_ueffTok) in (if (dtb_u_u1649 = 0) then ((Obj.magic (((((((v_finishWarningsDir nFs) nConsole) nProcess) (B_dData_dPair.v_secondOf dtb_u_u1592)) o) dtb_u_u1579) 0)) _u_ueffTok) else (let dtb_u_u1651 = { B_dData_dPair.f_Pair_first = 1; B_dData_dPair.f_Pair_second = o } in dtb_u_u1651)))))
  | _ -> failwith "DT: impossible branch"
)))))))

# 1409 "Vuna/Compiler/Driver/CompilerCli.vuna"
let v_buildOneGo = (fun (dtb_u_u1654 : string) (dtb_u_u1655 : string) (dtb_u_u1656 : string) (dtb_u_u1657 : string) (dtb_u_u1658 : string) (dtb_u_u1659 : string) (dtb_u_u1660 : string) (dtb_u_u1669 : bool) (dtb_u_u1670 : bool) (dtb_u_u1671 : string B_dData_dMaybe.t_Maybe) (dtb_u_u1672 : Frontend_dPackages_dPkg.t_Package) (dtb_u_u1673 : t_CliOpts) -> (if ((dtb_u_u1673).f_CliOpts_optTarget = "wasm") then ((((((((v_buildWasmOne dtb_u_u1654) dtb_u_u1655) dtb_u_u1657) dtb_u_u1658) dtb_u_u1669) dtb_u_u1671) dtb_u_u1672) dtb_u_u1673) else (if ((dtb_u_u1673).f_CliOpts_optTarget = "native") then (((((((((v_buildNativeOne dtb_u_u1654) dtb_u_u1655) dtb_u_u1657) dtb_u_u1658) dtb_u_u1669) dtb_u_u1670) dtb_u_u1671) dtb_u_u1672) dtb_u_u1673) else (let dtb_u_u1674 = (Frontend_dPackages_dPkg.v_packageName dtb_u_u1672) in (let dtb_u_u1675 = (Frontend_dPackages_dPkg.v_packageEntry dtb_u_u1672) in (Obj.repr ((fun (dtb_u_u1680 : B_dEffect_dCore.t_EffUnit) -> (let dtb_u_u1683 = (((B_dEffect_dFs.v_fsFileExists_u_udirect dtb_u_u1654) dtb_u_u1675) dtb_u_u1680) in (if dtb_u_u1683 then (let dtb_u_u1684 = ((Frontend_dPackages_dPkg.v_contextWithRelease (dtb_u_u1673).f_CliOpts_optRelease) (Frontend_dPackages_dPkg.v_packageContext dtb_u_u1672)) in (if dtb_u_u1669 then (match dtb_u_u1671 with
  | B_dData_dMaybe.C_Maybe_Just (dtb_u_u1685) -> ((Obj.magic (((((((((v_compileCodegen dtb_u_u1654) dtb_u_u1655) dtb_u_u1656) dtb_u_u1657) dtb_u_u1658) dtb_u_u1684) dtb_u_u1675) (if dtb_u_u1670 then (String.concat "" [dtb_u_u1685; "/"; dtb_u_u1674]) else dtb_u_u1685)) dtb_u_u1673)) dtb_u_u1680)
  | B_dData_dMaybe.C_Maybe_Nothing -> ((Obj.magic (((((((((v_compileCodegen dtb_u_u1654) dtb_u_u1655) dtb_u_u1656) dtb_u_u1657) dtb_u_u1658) dtb_u_u1684) dtb_u_u1675) ((Frontend_dPackages_dPkg.v_packageDir dtb_u_u1672) ^ "/.output")) dtb_u_u1673)) dtb_u_u1680)
  | _ -> failwith "DT: impossible branch"
) else (match dtb_u_u1671 with
  | B_dData_dMaybe.C_Maybe_Just (dtb_u_u1686) -> ((Obj.magic (((((((((((v_buildExplicit dtb_u_u1654) dtb_u_u1655) dtb_u_u1656) dtb_u_u1657) dtb_u_u1658) dtb_u_u1686) dtb_u_u1670) dtb_u_u1672) dtb_u_u1684) dtb_u_u1675) dtb_u_u1673)) dtb_u_u1680)
  | B_dData_dMaybe.C_Maybe_Nothing -> ((Obj.magic ((((((((((v_buildDefault dtb_u_u1654) dtb_u_u1655) dtb_u_u1656) dtb_u_u1657) dtb_u_u1658) dtb_u_u1672) dtb_u_u1684) dtb_u_u1675) dtb_u_u1674) dtb_u_u1673)) dtb_u_u1680)
  | _ -> failwith "DT: impossible branch"
))) else (let dtb_u_u1694 = ((((((((Driver_dCompile.v_checkPackage_u_udirect dtb_u_u1654) dtb_u_u1656) dtb_u_u1657) dtb_u_u1658) (dtb_u_u1673).f_CliOpts_optRelease) false) dtb_u_u1672) dtb_u_u1680) in (match dtb_u_u1694 with
  | Base_dDiag.C_Check_ErrC (dtb_u_u1695) -> ((Obj.magic ((((v_printDiag dtb_u_u1654) dtb_u_u1655) dtb_u_u1673) dtb_u_u1695)) dtb_u_u1680)
  | Base_dDiag.C_Check_OkC (dtb_u_u1696) -> (let dtb_u_u1704 = (((B_dEffect_dConsole.v_consolePrint_u_udirect dtb_u_u1655) (String.concat "" ["skipped (library): "; dtb_u_u1674; "\n"])) dtb_u_u1680) in (let dtb_u_u1706 = { B_dData_dPair.f_Pair_first = 0; B_dData_dPair.f_Pair_second = dtb_u_u1673 } in dtb_u_u1706))
  | _ -> failwith "DT: impossible branch"
))))))))))))

# 1409 "Vuna/Compiler/Driver/CompilerCli.vuna"
let v_buildOneGo_u_udirect = (fun (nFs : string) (nConsole : string) (nClock : string) (nEnv : string) (nProcess : string) (nExit : string) (nArgs : string) (noCompile : bool) (multiOut : bool) (outM : string B_dData_dMaybe.t_Maybe) (pkg : Frontend_dPackages_dPkg.t_Package) (o : t_CliOpts) _u_ueffTok -> (if ((o).f_CliOpts_optTarget = "wasm") then ((Obj.magic ((((((((v_buildWasmOne nFs) nConsole) nEnv) nProcess) noCompile) outM) pkg) o)) _u_ueffTok) else (if ((o).f_CliOpts_optTarget = "native") then ((Obj.magic (((((((((v_buildNativeOne nFs) nConsole) nEnv) nProcess) noCompile) multiOut) outM) pkg) o)) _u_ueffTok) else (let dtb_u_u1674 = (Frontend_dPackages_dPkg.v_packageName pkg) in (let dtb_u_u1675 = (Frontend_dPackages_dPkg.v_packageEntry pkg) in (let dtb_u_u1683 = (((B_dEffect_dFs.v_fsFileExists_u_udirect nFs) dtb_u_u1675) _u_ueffTok) in (if dtb_u_u1683 then (let dtb_u_u1684 = ((Frontend_dPackages_dPkg.v_contextWithRelease (o).f_CliOpts_optRelease) (Frontend_dPackages_dPkg.v_packageContext pkg)) in (if noCompile then (match outM with
  | B_dData_dMaybe.C_Maybe_Just (dtb_u_u1685) -> ((Obj.magic (((((((((v_compileCodegen nFs) nConsole) nClock) nEnv) nProcess) dtb_u_u1684) dtb_u_u1675) (if multiOut then (String.concat "" [dtb_u_u1685; "/"; dtb_u_u1674]) else dtb_u_u1685)) o)) _u_ueffTok)
  | B_dData_dMaybe.C_Maybe_Nothing -> ((Obj.magic (((((((((v_compileCodegen nFs) nConsole) nClock) nEnv) nProcess) dtb_u_u1684) dtb_u_u1675) ((Frontend_dPackages_dPkg.v_packageDir pkg) ^ "/.output")) o)) _u_ueffTok)
  | _ -> failwith "DT: impossible branch"
) else (match outM with
  | B_dData_dMaybe.C_Maybe_Just (dtb_u_u1686) -> ((Obj.magic (((((((((((v_buildExplicit nFs) nConsole) nClock) nEnv) nProcess) dtb_u_u1686) multiOut) pkg) dtb_u_u1684) dtb_u_u1675) o)) _u_ueffTok)
  | B_dData_dMaybe.C_Maybe_Nothing -> ((Obj.magic ((((((((((v_buildDefault nFs) nConsole) nClock) nEnv) nProcess) pkg) dtb_u_u1684) dtb_u_u1675) dtb_u_u1674) o)) _u_ueffTok)
  | _ -> failwith "DT: impossible branch"
))) else (let dtb_u_u1694 = ((((((((Driver_dCompile.v_checkPackage_u_udirect nFs) nClock) nEnv) nProcess) (o).f_CliOpts_optRelease) false) pkg) _u_ueffTok) in (match dtb_u_u1694 with
  | Base_dDiag.C_Check_ErrC (dtb_u_u1695) -> ((Obj.magic ((((v_printDiag nFs) nConsole) o) dtb_u_u1695)) _u_ueffTok)
  | Base_dDiag.C_Check_OkC (dtb_u_u1696) -> (let dtb_u_u1704 = (((B_dEffect_dConsole.v_consolePrint_u_udirect nConsole) (String.concat "" ["skipped (library): "; dtb_u_u1674; "\n"])) _u_ueffTok) in (let dtb_u_u1706 = { B_dData_dPair.f_Pair_first = 0; B_dData_dPair.f_Pair_second = o } in dtb_u_u1706))
  | _ -> failwith "DT: impossible branch"
)))))))))

# 1400 "Vuna/Compiler/Driver/CompilerCli.vuna"
let v_buildOne = (fun (dtb_u_u1708 : string) (dtb_u_u1709 : string) (dtb_u_u1710 : string) (dtb_u_u1711 : string) (dtb_u_u1712 : string) (dtb_u_u1713 : string) (dtb_u_u1714 : string) (dtb_u_u1723 : bool) (dtb_u_u1724 : bool) (dtb_u_u1725 : string B_dData_dMaybe.t_Maybe) (dtb_u_u1726 : Frontend_dPackages_dPkg.t_Package) (dtb_u_u1727 : t_CliOpts) -> (if (dtb_u_u1727).f_CliOpts_optExplain then (Obj.repr ((fun (dtb_u_u1732 : B_dEffect_dCore.t_EffUnit) -> (let dtb_u_u1733 = Obj.obj ((if (v_isMachineFormat (dtb_u_u1727).f_CliOpts_optDiagFormat) then (let dtb_u_u1736 = 0 in (Obj.repr ((fun (dtb_u_u1737 : B_dEffect_dCore.t_EffUnit) -> dtb_u_u1736)))) else ((((((v_printExplainEff dtb_u_u1708) dtb_u_u1709) dtb_u_u1710) dtb_u_u1711) dtb_u_u1712) dtb_u_u1726))) in (let dtb_u_u1738 = (dtb_u_u1733 dtb_u_u1732) in ((Obj.magic ((((((((((((v_buildOneGo dtb_u_u1708) dtb_u_u1709) dtb_u_u1710) dtb_u_u1711) dtb_u_u1712) dtb_u_u1713) dtb_u_u1714) dtb_u_u1723) dtb_u_u1724) dtb_u_u1725) dtb_u_u1726) dtb_u_u1727)) dtb_u_u1732)))))) else ((((((((((((v_buildOneGo dtb_u_u1708) dtb_u_u1709) dtb_u_u1710) dtb_u_u1711) dtb_u_u1712) dtb_u_u1713) dtb_u_u1714) dtb_u_u1723) dtb_u_u1724) dtb_u_u1725) dtb_u_u1726) dtb_u_u1727)))

# 1400 "Vuna/Compiler/Driver/CompilerCli.vuna"
let v_buildOne_u_udirect = (fun (nFs : string) (nConsole : string) (nClock : string) (nEnv : string) (nProcess : string) (nExit : string) (nArgs : string) (noCompile : bool) (multiOut : bool) (outM : string B_dData_dMaybe.t_Maybe) (pkg : Frontend_dPackages_dPkg.t_Package) (o : t_CliOpts) _u_ueffTok -> (if (o).f_CliOpts_optExplain then (let dtb_u_u1733 = Obj.obj ((if (v_isMachineFormat (o).f_CliOpts_optDiagFormat) then (let dtb_u_u1736 = 0 in (Obj.repr ((fun (dtb_u_u1737 : B_dEffect_dCore.t_EffUnit) -> dtb_u_u1736)))) else ((((((v_printExplainEff nFs) nConsole) nClock) nEnv) nProcess) pkg))) in (let dtb_u_u1738 = (dtb_u_u1733 _u_ueffTok) in ((Obj.magic ((((((((((((v_buildOneGo nFs) nConsole) nClock) nEnv) nProcess) nExit) nArgs) noCompile) multiOut) outM) pkg) o)) _u_ueffTok))) else ((Obj.magic ((((((((((((v_buildOneGo nFs) nConsole) nClock) nEnv) nProcess) nExit) nArgs) noCompile) multiOut) outM) pkg) o)) _u_ueffTok)))

# 1284 "Vuna/Compiler/Driver/CompilerCli.vuna"
let rec v_buildTargets = (fun (dtb_u_u1739 : string) (dtb_u_u1740 : string) (dtb_u_u1741 : string) (dtb_u_u1742 : string) (dtb_u_u1743 : string) (dtb_u_u1744 : string) (dtb_u_u1745 : string) (dtb_u_u1754 : bool) (dtb_u_u1755 : bool) (dtb_u_u1756 : string B_dData_dMaybe.t_Maybe) (dtb_u_u1757 : Frontend_dPackages_dPkg.t_Package B_dData_dList.t_List) (dtb_u_u1758 : int) (dtb_u_u1759 : t_CliOpts) -> (match dtb_u_u1757 with
  | B_dData_dList.C_List__x58__x58_ (dtb_u_u1760, dtb_u_u1761) -> (Obj.repr ((fun (dtb_u_u1766 : B_dEffect_dCore.t_EffUnit) -> (let dtb_u_u1769 = (((((((((((((v_buildOne_u_udirect dtb_u_u1739) dtb_u_u1740) dtb_u_u1741) dtb_u_u1742) dtb_u_u1743) dtb_u_u1744) dtb_u_u1745) dtb_u_u1754) dtb_u_u1755) dtb_u_u1756) dtb_u_u1760) dtb_u_u1759) dtb_u_u1766) in (let dtb_u_u1770 = (if ((B_dData_dPair.v_firstOf dtb_u_u1769) > dtb_u_u1758) then (B_dData_dPair.v_firstOf dtb_u_u1769) else dtb_u_u1758) in ((Obj.magic (((((((((((((v_buildTargets dtb_u_u1739) dtb_u_u1740) dtb_u_u1741) dtb_u_u1742) dtb_u_u1743) dtb_u_u1744) dtb_u_u1745) dtb_u_u1754) dtb_u_u1755) dtb_u_u1756) dtb_u_u1761) dtb_u_u1770) (B_dData_dPair.v_secondOf dtb_u_u1769))) dtb_u_u1766))))))
  | B_dData_dList.C_List_Nil -> (let dtb_u_u1772 = { B_dData_dPair.f_Pair_first = dtb_u_u1758; B_dData_dPair.f_Pair_second = dtb_u_u1759 } in (Obj.repr ((fun (dtb_u_u1773 : B_dEffect_dCore.t_EffUnit) -> dtb_u_u1772))))
  | _ -> failwith "DT: impossible branch"
))
# 1284 "Vuna/Compiler/Driver/CompilerCli.vuna"
and v_buildTargets_u_udirect = (fun (nFs : string) (nConsole : string) (nClock : string) (nEnv : string) (nProcess : string) (nExit : string) (nArgs : string) (mc0 : bool) (mc1 : bool) (mc2 : string B_dData_dMaybe.t_Maybe) (mc3 : Frontend_dPackages_dPkg.t_Package B_dData_dList.t_List) (mc4 : int) (mc5 : t_CliOpts) _u_ueffTok -> (match mc3 with
  | B_dData_dList.C_List__x58__x58_ (dtb_u_u1760, dtb_u_u1761) -> (let dtb_u_u1769 = (((((((((((((v_buildOne_u_udirect nFs) nConsole) nClock) nEnv) nProcess) nExit) nArgs) mc0) mc1) mc2) dtb_u_u1760) mc5) _u_ueffTok) in (let dtb_u_u1770 = (if ((B_dData_dPair.v_firstOf dtb_u_u1769) > mc4) then (B_dData_dPair.v_firstOf dtb_u_u1769) else mc4) in ((Obj.magic (((((((((((((v_buildTargets nFs) nConsole) nClock) nEnv) nProcess) nExit) nArgs) mc0) mc1) mc2) dtb_u_u1761) dtb_u_u1770) (B_dData_dPair.v_secondOf dtb_u_u1769))) _u_ueffTok)))
  | B_dData_dList.C_List_Nil -> (let dtb_u_u1772 = { B_dData_dPair.f_Pair_first = mc4; B_dData_dPair.f_Pair_second = mc5 } in dtb_u_u1772)
  | _ -> failwith "DT: impossible branch"
))

# 1234 "Vuna/Compiler/Driver/CompilerCli.vuna"
let v_buildRun = (fun (dtb_u_u1774 : string) (dtb_u_u1775 : string) (dtb_u_u1776 : string) (dtb_u_u1777 : string) (dtb_u_u1778 : string) (dtb_u_u1779 : string) (dtb_u_u1780 : string) (dtb_u_u1789 : bool) (dtb_u_u1790 : string) (dtb_u_u1791 : string B_dData_dMaybe.t_Maybe) (dtb_u_u1792 : string B_dData_dMaybe.t_Maybe) (dtb_u_u1793 : t_CliOpts) -> (Obj.repr ((fun (dtb_u_u1798 : B_dEffect_dCore.t_EffUnit) -> (let dtb_u_u1801 = ((((Frontend_dPackages_dPkg.v_loadWorkspace_u_udirect dtb_u_u1774) dtb_u_u1777) dtb_u_u1790) dtb_u_u1798) in (match dtb_u_u1801 with
  | Base_dDiag.C_Check_ErrC (dtb_u_u1802) -> ((Obj.magic ((((v_printDiag dtb_u_u1774) dtb_u_u1775) dtb_u_u1793) dtb_u_u1802)) dtb_u_u1798)
  | Base_dDiag.C_Check_OkC (dtb_u_u1803) -> (let dtb_u_u1811 = (((v_isSingleLibraryPackage_u_udirect dtb_u_u1774) (Frontend_dPackages_dPkg.v_workspaceAllPackages dtb_u_u1803)) dtb_u_u1798) in (if dtb_u_u1811 then ((Obj.magic ((v_withOpts dtb_u_u1793) ((v_printErr dtb_u_u1775) (v_libraryOnlyMessage (Frontend_dPackages_dPkg.v_workspaceAllPackages dtb_u_u1803))))) dtb_u_u1798) else (match ((v_selectBuildTargets dtb_u_u1792) (Frontend_dPackages_dPkg.v_workspaceAllPackages dtb_u_u1803)) with
  | Base_dDiag.C_Check_ErrC (dtb_u_u1812) -> ((Obj.magic ((((v_printDiag dtb_u_u1774) dtb_u_u1775) dtb_u_u1793) dtb_u_u1812)) dtb_u_u1798)
  | Base_dDiag.C_Check_OkC (dtb_u_u1813) -> ((Obj.magic (((((((((((((v_buildTargets dtb_u_u1774) dtb_u_u1775) dtb_u_u1776) dtb_u_u1777) dtb_u_u1778) dtb_u_u1779) dtb_u_u1780) dtb_u_u1789) (v_workspaceMultiOut dtb_u_u1803)) dtb_u_u1791) dtb_u_u1813) 0) dtb_u_u1793)) dtb_u_u1798)
  | _ -> failwith "DT: impossible branch"
)))
  | _ -> failwith "DT: impossible branch"
))))))

# 1234 "Vuna/Compiler/Driver/CompilerCli.vuna"
let v_buildRun_u_udirect = (fun (nFs : string) (nConsole : string) (nClock : string) (nEnv : string) (nProcess : string) (nExit : string) (nArgs : string) (noCompile : bool) (dir : string) (outM : string B_dData_dMaybe.t_Maybe) (pkgM : string B_dData_dMaybe.t_Maybe) (o : t_CliOpts) _u_ueffTok -> (let dtb_u_u1801 = ((((Frontend_dPackages_dPkg.v_loadWorkspace_u_udirect nFs) nEnv) dir) _u_ueffTok) in (match dtb_u_u1801 with
  | Base_dDiag.C_Check_ErrC (dtb_u_u1802) -> ((Obj.magic ((((v_printDiag nFs) nConsole) o) dtb_u_u1802)) _u_ueffTok)
  | Base_dDiag.C_Check_OkC (dtb_u_u1803) -> (let dtb_u_u1811 = (((v_isSingleLibraryPackage_u_udirect nFs) (Frontend_dPackages_dPkg.v_workspaceAllPackages dtb_u_u1803)) _u_ueffTok) in (if dtb_u_u1811 then ((Obj.magic ((v_withOpts o) ((v_printErr nConsole) (v_libraryOnlyMessage (Frontend_dPackages_dPkg.v_workspaceAllPackages dtb_u_u1803))))) _u_ueffTok) else (match ((v_selectBuildTargets pkgM) (Frontend_dPackages_dPkg.v_workspaceAllPackages dtb_u_u1803)) with
  | Base_dDiag.C_Check_ErrC (dtb_u_u1812) -> ((Obj.magic ((((v_printDiag nFs) nConsole) o) dtb_u_u1812)) _u_ueffTok)
  | Base_dDiag.C_Check_OkC (dtb_u_u1813) -> ((Obj.magic (((((((((((((v_buildTargets nFs) nConsole) nClock) nEnv) nProcess) nExit) nArgs) noCompile) (v_workspaceMultiOut dtb_u_u1803)) outM) dtb_u_u1813) 0) o)) _u_ueffTok)
  | _ -> failwith "DT: impossible branch"
)))
  | _ -> failwith "DT: impossible branch"
)))

# 1184 "Vuna/Compiler/Driver/CompilerCli.vuna"
let rec v_buildParse = (fun (dtb_u_u1814 : string) (dtb_u_u1815 : string) (dtb_u_u1816 : string) (dtb_u_u1817 : string) (dtb_u_u1818 : string) (dtb_u_u1819 : string) (dtb_u_u1820 : string) (dtb_u_u1829 : string) (dtb_u_u1830 : bool) (dtb_u_u1831 : string B_dData_dMaybe.t_Maybe) (dtb_u_u1832 : string B_dData_dMaybe.t_Maybe) (dtb_u_u1833 : string B_dData_dMaybe.t_Maybe) (dtb_u_u1834 : string B_dData_dList.t_List) (dtb_u_u1835 : t_CliOpts) -> (let dtb_u_u1836 = dtb_u_u1834 in (match dtb_u_u1836 with
  | B_dData_dList.C_List__x58__x58_ (dtb_u_u1837, dtb_u_u1838) -> (if (dtb_u_u1837 = "--no-compile") then ((((((((((((((v_buildParse dtb_u_u1814) dtb_u_u1815) dtb_u_u1816) dtb_u_u1817) dtb_u_u1818) dtb_u_u1819) dtb_u_u1820) dtb_u_u1829) true) dtb_u_u1831) dtb_u_u1832) dtb_u_u1833) dtb_u_u1838) dtb_u_u1835) else (if (dtb_u_u1837 = "--explain") then ((((((((((((((v_buildParse dtb_u_u1814) dtb_u_u1815) dtb_u_u1816) dtb_u_u1817) dtb_u_u1818) dtb_u_u1819) dtb_u_u1820) dtb_u_u1829) dtb_u_u1830) dtb_u_u1831) dtb_u_u1832) dtb_u_u1833) dtb_u_u1838) (v_markExplain dtb_u_u1835)) else (if (dtb_u_u1837 = "--release") then ((((((((((((((v_buildParse dtb_u_u1814) dtb_u_u1815) dtb_u_u1816) dtb_u_u1817) dtb_u_u1818) dtb_u_u1819) dtb_u_u1820) dtb_u_u1829) dtb_u_u1830) dtb_u_u1831) dtb_u_u1832) dtb_u_u1833) dtb_u_u1838) (v_markRelease dtb_u_u1835)) else (if (dtb_u_u1837 = "--wasm-opt") then (match dtb_u_u1838 with
  | B_dData_dList.C_List__x58__x58_ (dtb_u_u1839, dtb_u_u1840) -> (if ((B_dData_dString.v_startsWith "-") dtb_u_u1839) then ((v_withOpts dtb_u_u1835) (((v_removedFlag dtb_u_u1815) dtb_u_u1829) dtb_u_u1839)) else (match (v_parseWasmOptLevel dtb_u_u1839) with
  | B_dData_dMaybe.C_Maybe_Just (dtb_u_u1841) -> ((((((((((((((v_buildParse dtb_u_u1814) dtb_u_u1815) dtb_u_u1816) dtb_u_u1817) dtb_u_u1818) dtb_u_u1819) dtb_u_u1820) dtb_u_u1829) dtb_u_u1830) dtb_u_u1831) dtb_u_u1832) dtb_u_u1833) dtb_u_u1840) ((v_markWasmOpt dtb_u_u1841) dtb_u_u1835))
  | B_dData_dMaybe.C_Maybe_Nothing -> ((v_withOpts dtb_u_u1835) ((v_usageErr dtb_u_u1815) dtb_u_u1829))
  | _ -> failwith "DT: impossible branch"
))
  | B_dData_dList.C_List_Nil -> ((v_withOpts dtb_u_u1835) ((v_usageErr dtb_u_u1815) dtb_u_u1829))
  | _ -> failwith "DT: impossible branch"
) else (if (dtb_u_u1837 = "--target") then (match dtb_u_u1838 with
  | B_dData_dList.C_List__x58__x58_ (dtb_u_u1842, dtb_u_u1843) -> (if (v_isKnownTarget dtb_u_u1842) then ((((((((((((((v_buildParse dtb_u_u1814) dtb_u_u1815) dtb_u_u1816) dtb_u_u1817) dtb_u_u1818) dtb_u_u1819) dtb_u_u1820) dtb_u_u1829) dtb_u_u1830) dtb_u_u1831) dtb_u_u1832) dtb_u_u1833) dtb_u_u1843) ((v_markTarget dtb_u_u1842) dtb_u_u1835)) else ((v_withOpts dtb_u_u1835) ((v_usageErr dtb_u_u1815) dtb_u_u1829)))
  | _ -> (if ((B_dData_dString.v_startsWith "-") dtb_u_u1837) then ((v_withOpts dtb_u_u1835) (((v_removedFlag dtb_u_u1815) dtb_u_u1829) dtb_u_u1837)) else (match dtb_u_u1832 with
  | B_dData_dMaybe.C_Maybe_Nothing -> ((((((((((((((v_buildParse dtb_u_u1814) dtb_u_u1815) dtb_u_u1816) dtb_u_u1817) dtb_u_u1818) dtb_u_u1819) dtb_u_u1820) dtb_u_u1829) dtb_u_u1830) dtb_u_u1831) (B_dData_dMaybe.C_Maybe_Just (dtb_u_u1837))) dtb_u_u1833) dtb_u_u1838) dtb_u_u1835)
  | B_dData_dMaybe.C_Maybe_Just (dtb_u_u1844) -> ((v_withOpts dtb_u_u1835) ((v_usageErr dtb_u_u1815) dtb_u_u1829))
  | _ -> failwith "DT: impossible branch"
))
) else (if (dtb_u_u1837 = "--out") then (match dtb_u_u1838 with
  | B_dData_dList.C_List__x58__x58_ (dtb_u_u1845, dtb_u_u1846) -> (if ((B_dData_dString.v_startsWith "-") dtb_u_u1845) then ((v_withOpts dtb_u_u1835) (((v_removedFlag dtb_u_u1815) dtb_u_u1829) dtb_u_u1845)) else (match dtb_u_u1831 with
  | B_dData_dMaybe.C_Maybe_Nothing -> ((((((((((((((v_buildParse dtb_u_u1814) dtb_u_u1815) dtb_u_u1816) dtb_u_u1817) dtb_u_u1818) dtb_u_u1819) dtb_u_u1820) dtb_u_u1829) dtb_u_u1830) (B_dData_dMaybe.C_Maybe_Just (dtb_u_u1845))) dtb_u_u1832) dtb_u_u1833) dtb_u_u1846) dtb_u_u1835)
  | B_dData_dMaybe.C_Maybe_Just (dtb_u_u1847) -> ((v_withOpts dtb_u_u1835) ((v_usageErr dtb_u_u1815) dtb_u_u1829))
  | _ -> failwith "DT: impossible branch"
))
  | B_dData_dList.C_List_Nil -> ((v_withOpts dtb_u_u1835) ((v_usageErr dtb_u_u1815) dtb_u_u1829))
  | _ -> failwith "DT: impossible branch"
) else (if (dtb_u_u1837 = "--package") then (match dtb_u_u1838 with
  | B_dData_dList.C_List__x58__x58_ (dtb_u_u1848, dtb_u_u1849) -> (if ((B_dData_dString.v_startsWith "-") dtb_u_u1848) then ((v_withOpts dtb_u_u1835) (((v_removedFlag dtb_u_u1815) dtb_u_u1829) dtb_u_u1848)) else (match dtb_u_u1833 with
  | B_dData_dMaybe.C_Maybe_Nothing -> ((((((((((((((v_buildParse dtb_u_u1814) dtb_u_u1815) dtb_u_u1816) dtb_u_u1817) dtb_u_u1818) dtb_u_u1819) dtb_u_u1820) dtb_u_u1829) dtb_u_u1830) dtb_u_u1831) dtb_u_u1832) (B_dData_dMaybe.C_Maybe_Just (dtb_u_u1848))) dtb_u_u1849) dtb_u_u1835)
  | B_dData_dMaybe.C_Maybe_Just (dtb_u_u1850) -> ((v_withOpts dtb_u_u1835) ((v_usageErr dtb_u_u1815) dtb_u_u1829))
  | _ -> failwith "DT: impossible branch"
))
  | B_dData_dList.C_List_Nil -> ((v_withOpts dtb_u_u1835) ((v_usageErr dtb_u_u1815) dtb_u_u1829))
  | _ -> failwith "DT: impossible branch"
) else (if ((B_dData_dString.v_startsWith "-") dtb_u_u1837) then ((v_withOpts dtb_u_u1835) (((v_removedFlag dtb_u_u1815) dtb_u_u1829) dtb_u_u1837)) else (match dtb_u_u1832 with
  | B_dData_dMaybe.C_Maybe_Nothing -> ((((((((((((((v_buildParse dtb_u_u1814) dtb_u_u1815) dtb_u_u1816) dtb_u_u1817) dtb_u_u1818) dtb_u_u1819) dtb_u_u1820) dtb_u_u1829) dtb_u_u1830) dtb_u_u1831) (B_dData_dMaybe.C_Maybe_Just (dtb_u_u1837))) dtb_u_u1833) dtb_u_u1838) dtb_u_u1835)
  | B_dData_dMaybe.C_Maybe_Just (dtb_u_u1851) -> ((v_withOpts dtb_u_u1835) ((v_usageErr dtb_u_u1815) dtb_u_u1829))
  | _ -> failwith "DT: impossible branch"
)))))))))
  | B_dData_dList.C_List_Nil -> ((((((((((((v_buildRun dtb_u_u1814) dtb_u_u1815) dtb_u_u1816) dtb_u_u1817) dtb_u_u1818) dtb_u_u1819) dtb_u_u1820) dtb_u_u1830) (v_defaultDir dtb_u_u1832)) dtb_u_u1831) dtb_u_u1833) dtb_u_u1835)
  | _ -> failwith "DT: impossible branch"
)))
# 1184 "Vuna/Compiler/Driver/CompilerCli.vuna"
and v_buildParse_u_udirect = (fun (nFs : string) (nConsole : string) (nClock : string) (nEnv : string) (nProcess : string) (nExit : string) (nArgs : string) (prog : string) (noCompile : bool) (out : string B_dData_dMaybe.t_Maybe) (dir : string B_dData_dMaybe.t_Maybe) (pkg : string B_dData_dMaybe.t_Maybe) (args : string B_dData_dList.t_List) (o : t_CliOpts) _u_ueffTok -> (let dtb_u_u1836 = args in (match dtb_u_u1836 with
  | B_dData_dList.C_List__x58__x58_ (dtb_u_u1837, dtb_u_u1838) -> (if (dtb_u_u1837 = "--no-compile") then ((Obj.magic ((((((((((((((v_buildParse nFs) nConsole) nClock) nEnv) nProcess) nExit) nArgs) prog) true) out) dir) pkg) dtb_u_u1838) o)) _u_ueffTok) else (if (dtb_u_u1837 = "--explain") then ((Obj.magic ((((((((((((((v_buildParse nFs) nConsole) nClock) nEnv) nProcess) nExit) nArgs) prog) noCompile) out) dir) pkg) dtb_u_u1838) (v_markExplain o))) _u_ueffTok) else (if (dtb_u_u1837 = "--release") then ((Obj.magic ((((((((((((((v_buildParse nFs) nConsole) nClock) nEnv) nProcess) nExit) nArgs) prog) noCompile) out) dir) pkg) dtb_u_u1838) (v_markRelease o))) _u_ueffTok) else (if (dtb_u_u1837 = "--wasm-opt") then (match dtb_u_u1838 with
  | B_dData_dList.C_List__x58__x58_ (dtb_u_u1839, dtb_u_u1840) -> (if ((B_dData_dString.v_startsWith "-") dtb_u_u1839) then ((Obj.magic ((v_withOpts o) (((v_removedFlag nConsole) prog) dtb_u_u1839))) _u_ueffTok) else (match (v_parseWasmOptLevel dtb_u_u1839) with
  | B_dData_dMaybe.C_Maybe_Just (dtb_u_u1841) -> ((Obj.magic ((((((((((((((v_buildParse nFs) nConsole) nClock) nEnv) nProcess) nExit) nArgs) prog) noCompile) out) dir) pkg) dtb_u_u1840) ((v_markWasmOpt dtb_u_u1841) o))) _u_ueffTok)
  | B_dData_dMaybe.C_Maybe_Nothing -> ((Obj.magic ((v_withOpts o) ((v_usageErr nConsole) prog))) _u_ueffTok)
  | _ -> failwith "DT: impossible branch"
))
  | B_dData_dList.C_List_Nil -> ((Obj.magic ((v_withOpts o) ((v_usageErr nConsole) prog))) _u_ueffTok)
  | _ -> failwith "DT: impossible branch"
) else (if (dtb_u_u1837 = "--target") then (match dtb_u_u1838 with
  | B_dData_dList.C_List__x58__x58_ (dtb_u_u1842, dtb_u_u1843) -> (if (v_isKnownTarget dtb_u_u1842) then ((Obj.magic ((((((((((((((v_buildParse nFs) nConsole) nClock) nEnv) nProcess) nExit) nArgs) prog) noCompile) out) dir) pkg) dtb_u_u1843) ((v_markTarget dtb_u_u1842) o))) _u_ueffTok) else ((Obj.magic ((v_withOpts o) ((v_usageErr nConsole) prog))) _u_ueffTok))
  | _ -> (if ((B_dData_dString.v_startsWith "-") dtb_u_u1837) then ((Obj.magic ((v_withOpts o) (((v_removedFlag nConsole) prog) dtb_u_u1837))) _u_ueffTok) else (match dir with
  | B_dData_dMaybe.C_Maybe_Nothing -> ((Obj.magic ((((((((((((((v_buildParse nFs) nConsole) nClock) nEnv) nProcess) nExit) nArgs) prog) noCompile) out) (B_dData_dMaybe.C_Maybe_Just (dtb_u_u1837))) pkg) dtb_u_u1838) o)) _u_ueffTok)
  | B_dData_dMaybe.C_Maybe_Just (dtb_u_u1844) -> ((Obj.magic ((v_withOpts o) ((v_usageErr nConsole) prog))) _u_ueffTok)
  | _ -> failwith "DT: impossible branch"
))
) else (if (dtb_u_u1837 = "--out") then (match dtb_u_u1838 with
  | B_dData_dList.C_List__x58__x58_ (dtb_u_u1845, dtb_u_u1846) -> (if ((B_dData_dString.v_startsWith "-") dtb_u_u1845) then ((Obj.magic ((v_withOpts o) (((v_removedFlag nConsole) prog) dtb_u_u1845))) _u_ueffTok) else (match out with
  | B_dData_dMaybe.C_Maybe_Nothing -> ((Obj.magic ((((((((((((((v_buildParse nFs) nConsole) nClock) nEnv) nProcess) nExit) nArgs) prog) noCompile) (B_dData_dMaybe.C_Maybe_Just (dtb_u_u1845))) dir) pkg) dtb_u_u1846) o)) _u_ueffTok)
  | B_dData_dMaybe.C_Maybe_Just (dtb_u_u1847) -> ((Obj.magic ((v_withOpts o) ((v_usageErr nConsole) prog))) _u_ueffTok)
  | _ -> failwith "DT: impossible branch"
))
  | B_dData_dList.C_List_Nil -> ((Obj.magic ((v_withOpts o) ((v_usageErr nConsole) prog))) _u_ueffTok)
  | _ -> failwith "DT: impossible branch"
) else (if (dtb_u_u1837 = "--package") then (match dtb_u_u1838 with
  | B_dData_dList.C_List__x58__x58_ (dtb_u_u1848, dtb_u_u1849) -> (if ((B_dData_dString.v_startsWith "-") dtb_u_u1848) then ((Obj.magic ((v_withOpts o) (((v_removedFlag nConsole) prog) dtb_u_u1848))) _u_ueffTok) else (match pkg with
  | B_dData_dMaybe.C_Maybe_Nothing -> ((Obj.magic ((((((((((((((v_buildParse nFs) nConsole) nClock) nEnv) nProcess) nExit) nArgs) prog) noCompile) out) dir) (B_dData_dMaybe.C_Maybe_Just (dtb_u_u1848))) dtb_u_u1849) o)) _u_ueffTok)
  | B_dData_dMaybe.C_Maybe_Just (dtb_u_u1850) -> ((Obj.magic ((v_withOpts o) ((v_usageErr nConsole) prog))) _u_ueffTok)
  | _ -> failwith "DT: impossible branch"
))
  | B_dData_dList.C_List_Nil -> ((Obj.magic ((v_withOpts o) ((v_usageErr nConsole) prog))) _u_ueffTok)
  | _ -> failwith "DT: impossible branch"
) else (if ((B_dData_dString.v_startsWith "-") dtb_u_u1837) then ((Obj.magic ((v_withOpts o) (((v_removedFlag nConsole) prog) dtb_u_u1837))) _u_ueffTok) else (match dir with
  | B_dData_dMaybe.C_Maybe_Nothing -> ((Obj.magic ((((((((((((((v_buildParse nFs) nConsole) nClock) nEnv) nProcess) nExit) nArgs) prog) noCompile) out) (B_dData_dMaybe.C_Maybe_Just (dtb_u_u1837))) pkg) dtb_u_u1838) o)) _u_ueffTok)
  | B_dData_dMaybe.C_Maybe_Just (dtb_u_u1851) -> ((Obj.magic ((v_withOpts o) ((v_usageErr nConsole) prog))) _u_ueffTok)
  | _ -> failwith "DT: impossible branch"
)))))))))
  | B_dData_dList.C_List_Nil -> ((Obj.magic ((((((((((((v_buildRun nFs) nConsole) nClock) nEnv) nProcess) nExit) nArgs) noCompile) (v_defaultDir dir)) out) pkg) o)) _u_ueffTok)
  | _ -> failwith "DT: impossible branch"
)))

# 1181 "Vuna/Compiler/Driver/CompilerCli.vuna"
let v_buildArgs = (fun (dtb_u_u1852 : string) (dtb_u_u1853 : string) (dtb_u_u1854 : string) (dtb_u_u1855 : string) (dtb_u_u1856 : string) (dtb_u_u1857 : string) (dtb_u_u1858 : string) (dtb_u_u1867 : string) (dtb_u_u1868 : string B_dData_dList.t_List) (dtb_u_u1869 : t_CliOpts) -> ((((((((((((((v_buildParse dtb_u_u1852) dtb_u_u1853) dtb_u_u1854) dtb_u_u1855) dtb_u_u1856) dtb_u_u1857) dtb_u_u1858) dtb_u_u1867) false) B_dData_dMaybe.C_Maybe_Nothing) B_dData_dMaybe.C_Maybe_Nothing) B_dData_dMaybe.C_Maybe_Nothing) dtb_u_u1868) dtb_u_u1869))

# 1181 "Vuna/Compiler/Driver/CompilerCli.vuna"
let v_buildArgs_u_udirect = (fun (nFs : string) (nConsole : string) (nClock : string) (nEnv : string) (nProcess : string) (nExit : string) (nArgs : string) (prog : string) (args : string B_dData_dList.t_List) (o : t_CliOpts) _u_ueffTok -> ((Obj.magic ((((((((((((((v_buildParse nFs) nConsole) nClock) nEnv) nProcess) nExit) nArgs) prog) false) B_dData_dMaybe.C_Maybe_Nothing) B_dData_dMaybe.C_Maybe_Nothing) B_dData_dMaybe.C_Maybe_Nothing) args) o)) _u_ueffTok))

# 1561 "Vuna/Compiler/Driver/CompilerCli.vuna"
let rec v_stripLangGo = (fun (dtb_u_u1870 : string B_dData_dList.t_List) (dtb_u_u1871 : string B_dData_dList.t_List) (dtb_u_u1872 : string) -> (match dtb_u_u1870 with
  | B_dData_dList.C_List__x58__x58_ (dtb_u_u1873, dtb_u_u1874) -> (if (dtb_u_u1873 = "--lang") then (match dtb_u_u1874 with
  | B_dData_dList.C_List__x58__x58_ (dtb_u_u1875, dtb_u_u1876) -> (((v_stripLangGo dtb_u_u1876) dtb_u_u1871) dtb_u_u1875)
  | B_dData_dList.C_List_Nil -> { B_dData_dPair.f_Pair_first = (B_dData_dList.v_reverse dtb_u_u1871); B_dData_dPair.f_Pair_second = dtb_u_u1872 }
  | _ -> failwith "DT: impossible branch"
) else (if ((B_dData_dString.v_startsWith "--lang=") dtb_u_u1873) then (((v_stripLangGo dtb_u_u1874) dtb_u_u1871) (((B_dData_dString.v_substring (bi_natFromInt 7)) (bi_natFromInt ((String.length dtb_u_u1873) - 7))) dtb_u_u1873)) else (((v_stripLangGo dtb_u_u1874) (B_dData_dList.C_List__x58__x58_ (dtb_u_u1873, dtb_u_u1871))) dtb_u_u1872)))
  | B_dData_dList.C_List_Nil -> { B_dData_dPair.f_Pair_first = (B_dData_dList.v_reverse dtb_u_u1871); B_dData_dPair.f_Pair_second = dtb_u_u1872 }
  | _ -> failwith "DT: impossible branch"
))

# 1557 "Vuna/Compiler/Driver/CompilerCli.vuna"
let v_stripLang = (fun (dtb_u_u1877 : string B_dData_dList.t_List) -> (((v_stripLangGo dtb_u_u1877) B_dData_dList.C_List_Nil) "en"))

# 1574 "Vuna/Compiler/Driver/CompilerCli.vuna"
let rec v_hasLangFlag = (fun (dtb_u_u1878 : string B_dData_dList.t_List) -> (match dtb_u_u1878 with
  | B_dData_dList.C_List__x58__x58_ (dtb_u_u1879, dtb_u_u1880) -> (if (if (dtb_u_u1879 = "--lang") then true else ((B_dData_dString.v_startsWith "--lang=") dtb_u_u1879)) then true else (v_hasLangFlag dtb_u_u1880))
  | B_dData_dList.C_List_Nil -> false
  | _ -> failwith "DT: impossible branch"
))

# 1582 "Vuna/Compiler/Driver/CompilerCli.vuna"
let rec v_stripContinueGo = (fun (dtb_u_u1881 : string B_dData_dList.t_List) (dtb_u_u1882 : string B_dData_dList.t_List) (dtb_u_u1883 : bool) -> (match dtb_u_u1881 with
  | B_dData_dList.C_List__x58__x58_ (dtb_u_u1884, dtb_u_u1885) -> (if (dtb_u_u1884 = "--continue-on-error") then (((v_stripContinueGo dtb_u_u1885) dtb_u_u1882) true) else (((v_stripContinueGo dtb_u_u1885) (B_dData_dList.C_List__x58__x58_ (dtb_u_u1884, dtb_u_u1882))) dtb_u_u1883))
  | B_dData_dList.C_List_Nil -> { B_dData_dPair.f_Pair_first = (B_dData_dList.v_reverse dtb_u_u1882); B_dData_dPair.f_Pair_second = dtb_u_u1883 }
  | _ -> failwith "DT: impossible branch"
))

# 1579 "Vuna/Compiler/Driver/CompilerCli.vuna"
let v_stripContinueOnError = (fun (dtb_u_u1886 : string B_dData_dList.t_List) -> (((v_stripContinueGo dtb_u_u1886) B_dData_dList.C_List_Nil) false))

# 1626 "Vuna/Compiler/Driver/CompilerCli.vuna"
let v_printRecovered = (fun (dtb_u_u1887 : string) (dtb_u_u1888 : string) (dtb_u_u1892 : Frontend_dPackages_dPkg.t_Package) (dtb_u_u1893 : Base_dDiag.t_Diagnostic) (dtb_u_u1894 : Base_dDiag.t_Diagnostic B_dData_dList.t_List) (dtb_u_u1895 : t_CliOpts) -> (let dtb_u_u1896 = ((v_takeDiags (dtb_u_u1895).f_CliOpts_optMaxErrors) dtb_u_u1894) in (Obj.repr ((fun (dtb_u_u1901 : B_dEffect_dCore.t_EffUnit) -> (let dtb_u_u1904 = ((((((v_printDiagList_u_udirect dtb_u_u1887) dtb_u_u1888) dtb_u_u1895) (String.concat "" ["["; (Frontend_dPackages_dPkg.v_packageName dtb_u_u1892); "] "])) dtb_u_u1896) dtb_u_u1901) in (if ((B_dData_dList.v_length dtb_u_u1896) = 0) then ((Obj.magic (((((v_printDiagWithPrefix dtb_u_u1887) dtb_u_u1888) (B_dData_dPair.v_secondOf dtb_u_u1904)) (String.concat "" ["["; (Frontend_dPackages_dPkg.v_packageName dtb_u_u1892); "] "])) dtb_u_u1893)) dtb_u_u1901) else (let dtb_u_u1906 = { B_dData_dPair.f_Pair_first = 1; B_dData_dPair.f_Pair_second = (B_dData_dPair.v_secondOf dtb_u_u1904) } in dtb_u_u1906))))))))

# 1626 "Vuna/Compiler/Driver/CompilerCli.vuna"
let v_printRecovered_u_udirect = (fun (nFs : string) (nConsole : string) (pkg : Frontend_dPackages_dPkg.t_Package) (e : Base_dDiag.t_Diagnostic) (ds : Base_dDiag.t_Diagnostic B_dData_dList.t_List) (o : t_CliOpts) _u_ueffTok -> (let dtb_u_u1896 = ((v_takeDiags (o).f_CliOpts_optMaxErrors) ds) in (let dtb_u_u1904 = ((((((v_printDiagList_u_udirect nFs) nConsole) o) (String.concat "" ["["; (Frontend_dPackages_dPkg.v_packageName pkg); "] "])) dtb_u_u1896) _u_ueffTok) in (if ((B_dData_dList.v_length dtb_u_u1896) = 0) then ((Obj.magic (((((v_printDiagWithPrefix nFs) nConsole) (B_dData_dPair.v_secondOf dtb_u_u1904)) (String.concat "" ["["; (Frontend_dPackages_dPkg.v_packageName pkg); "] "])) e)) _u_ueffTok) else (let dtb_u_u1906 = { B_dData_dPair.f_Pair_first = 1; B_dData_dPair.f_Pair_second = (B_dData_dPair.v_secondOf dtb_u_u1904) } in dtb_u_u1906)))))

# 1603 "Vuna/Compiler/Driver/CompilerCli.vuna"
let v_packageRecoverExe = (fun (dtb_u_u1908 : string) (dtb_u_u1909 : string) (dtb_u_u1910 : string) (dtb_u_u1911 : string) (dtb_u_u1917 : Frontend_dPackages_dPkg.t_Package) (dtb_u_u1918 : Base_dDiag.t_Diagnostic) (dtb_u_u1919 : t_CliOpts) -> (Obj.repr ((fun (dtb_u_u1924 : B_dEffect_dCore.t_EffUnit) -> (let dtb_u_u1927 = ((((((Driver_dDt.v_dtCheckRecovering_u_udirect dtb_u_u1908) dtb_u_u1910) dtb_u_u1911) ((Frontend_dPackages_dPkg.v_contextWithRelease (dtb_u_u1919).f_CliOpts_optRelease) (Frontend_dPackages_dPkg.v_packageContext dtb_u_u1917))) (Frontend_dPackages_dPkg.v_packageEntry dtb_u_u1917)) dtb_u_u1924) in (match dtb_u_u1927 with
  | Base_dDiag.C_Check_OkC (dtb_u_u1928) -> ((Obj.magic ((((((v_printRecovered dtb_u_u1908) dtb_u_u1909) dtb_u_u1917) dtb_u_u1918) dtb_u_u1928) dtb_u_u1919)) dtb_u_u1924)
  | Base_dDiag.C_Check_ErrC (dtb_u_u1929) -> ((Obj.magic (((((v_printDiagWithPrefix dtb_u_u1908) dtb_u_u1909) dtb_u_u1919) (String.concat "" ["["; (Frontend_dPackages_dPkg.v_packageName dtb_u_u1917); "] "])) dtb_u_u1929)) dtb_u_u1924)
  | _ -> failwith "DT: impossible branch"
))))))

# 1603 "Vuna/Compiler/Driver/CompilerCli.vuna"
let v_packageRecoverExe_u_udirect = (fun (nFs : string) (nConsole : string) (nEnv : string) (nProcess : string) (pkg : Frontend_dPackages_dPkg.t_Package) (e : Base_dDiag.t_Diagnostic) (o : t_CliOpts) _u_ueffTok -> (let dtb_u_u1927 = ((((((Driver_dDt.v_dtCheckRecovering_u_udirect nFs) nEnv) nProcess) ((Frontend_dPackages_dPkg.v_contextWithRelease (o).f_CliOpts_optRelease) (Frontend_dPackages_dPkg.v_packageContext pkg))) (Frontend_dPackages_dPkg.v_packageEntry pkg)) _u_ueffTok) in (match dtb_u_u1927 with
  | Base_dDiag.C_Check_OkC (dtb_u_u1928) -> ((Obj.magic ((((((v_printRecovered nFs) nConsole) pkg) e) dtb_u_u1928) o)) _u_ueffTok)
  | Base_dDiag.C_Check_ErrC (dtb_u_u1929) -> ((Obj.magic (((((v_printDiagWithPrefix nFs) nConsole) o) (String.concat "" ["["; (Frontend_dPackages_dPkg.v_packageName pkg); "] "])) dtb_u_u1929)) _u_ueffTok)
  | _ -> failwith "DT: impossible branch"
)))

# 1613 "Vuna/Compiler/Driver/CompilerCli.vuna"
let v_packageRecoverLib = (fun (dtb_u_u1930 : string) (dtb_u_u1931 : string) (dtb_u_u1932 : string) (dtb_u_u1933 : string) (dtb_u_u1939 : Frontend_dPackages_dPkg.t_Package) (dtb_u_u1940 : Base_dDiag.t_Diagnostic) (dtb_u_u1941 : t_CliOpts) -> (match (Frontend_dPackages_dPkg.v_packageExports dtb_u_u1939) with
  | B_dData_dMaybe.C_Maybe_Just (dtb_u_u1942) -> (Obj.repr ((fun (dtb_u_u1947 : B_dEffect_dCore.t_EffUnit) -> (let dtb_u_u1950 = ((((((Driver_dDt.v_dtCheckLibraryRecovering_u_udirect dtb_u_u1930) dtb_u_u1932) dtb_u_u1933) ((Frontend_dPackages_dPkg.v_contextWithRelease (dtb_u_u1941).f_CliOpts_optRelease) (Frontend_dPackages_dPkg.v_packageContext dtb_u_u1939))) dtb_u_u1942) dtb_u_u1947) in (match dtb_u_u1950 with
  | Base_dDiag.C_Check_OkC (dtb_u_u1951) -> ((Obj.magic ((((((v_printRecovered dtb_u_u1930) dtb_u_u1931) dtb_u_u1939) dtb_u_u1940) dtb_u_u1951) dtb_u_u1941)) dtb_u_u1947)
  | Base_dDiag.C_Check_ErrC (dtb_u_u1952) -> ((Obj.magic (((((v_printDiagWithPrefix dtb_u_u1930) dtb_u_u1931) dtb_u_u1941) (String.concat "" ["["; (Frontend_dPackages_dPkg.v_packageName dtb_u_u1939); "] "])) dtb_u_u1952)) dtb_u_u1947)
  | _ -> failwith "DT: impossible branch"
)))))
  | B_dData_dMaybe.C_Maybe_Nothing -> (((((v_printDiagWithPrefix dtb_u_u1930) dtb_u_u1931) dtb_u_u1941) (String.concat "" ["["; (Frontend_dPackages_dPkg.v_packageName dtb_u_u1939); "] "])) dtb_u_u1940)
  | _ -> failwith "DT: impossible branch"
))

# 1613 "Vuna/Compiler/Driver/CompilerCli.vuna"
let v_packageRecoverLib_u_udirect = (fun (nFs : string) (nConsole : string) (nEnv : string) (nProcess : string) (pkg : Frontend_dPackages_dPkg.t_Package) (e : Base_dDiag.t_Diagnostic) (o : t_CliOpts) _u_ueffTok -> (match (Frontend_dPackages_dPkg.v_packageExports pkg) with
  | B_dData_dMaybe.C_Maybe_Just (dtb_u_u1942) -> (let dtb_u_u1950 = ((((((Driver_dDt.v_dtCheckLibraryRecovering_u_udirect nFs) nEnv) nProcess) ((Frontend_dPackages_dPkg.v_contextWithRelease (o).f_CliOpts_optRelease) (Frontend_dPackages_dPkg.v_packageContext pkg))) dtb_u_u1942) _u_ueffTok) in (match dtb_u_u1950 with
  | Base_dDiag.C_Check_OkC (dtb_u_u1951) -> ((Obj.magic ((((((v_printRecovered nFs) nConsole) pkg) e) dtb_u_u1951) o)) _u_ueffTok)
  | Base_dDiag.C_Check_ErrC (dtb_u_u1952) -> ((Obj.magic (((((v_printDiagWithPrefix nFs) nConsole) o) (String.concat "" ["["; (Frontend_dPackages_dPkg.v_packageName pkg); "] "])) dtb_u_u1952)) _u_ueffTok)
  | _ -> failwith "DT: impossible branch"
))
  | B_dData_dMaybe.C_Maybe_Nothing -> ((Obj.magic (((((v_printDiagWithPrefix nFs) nConsole) o) (String.concat "" ["["; (Frontend_dPackages_dPkg.v_packageName pkg); "] "])) e)) _u_ueffTok)
  | _ -> failwith "DT: impossible branch"
))

# 1596 "Vuna/Compiler/Driver/CompilerCli.vuna"
let v_packageRecover = (fun (dtb_u_u1953 : string) (dtb_u_u1954 : string) (dtb_u_u1955 : string) (dtb_u_u1956 : string) (dtb_u_u1962 : Frontend_dPackages_dPkg.t_Package) (dtb_u_u1963 : Base_dDiag.t_Diagnostic) (dtb_u_u1964 : t_CliOpts) -> (Obj.repr ((fun (dtb_u_u1969 : B_dEffect_dCore.t_EffUnit) -> (let dtb_u_u1972 = (((B_dEffect_dFs.v_fsFileExists_u_udirect dtb_u_u1953) (Frontend_dPackages_dPkg.v_packageEntry dtb_u_u1962)) dtb_u_u1969) in (if dtb_u_u1972 then ((Obj.magic (((((((v_packageRecoverExe dtb_u_u1953) dtb_u_u1954) dtb_u_u1955) dtb_u_u1956) dtb_u_u1962) dtb_u_u1963) dtb_u_u1964)) dtb_u_u1969) else ((Obj.magic (((((((v_packageRecoverLib dtb_u_u1953) dtb_u_u1954) dtb_u_u1955) dtb_u_u1956) dtb_u_u1962) dtb_u_u1963) dtb_u_u1964)) dtb_u_u1969)))))))

# 1596 "Vuna/Compiler/Driver/CompilerCli.vuna"
let v_packageRecover_u_udirect = (fun (nFs : string) (nConsole : string) (nEnv : string) (nProcess : string) (pkg : Frontend_dPackages_dPkg.t_Package) (e : Base_dDiag.t_Diagnostic) (o : t_CliOpts) _u_ueffTok -> (let dtb_u_u1972 = (((B_dEffect_dFs.v_fsFileExists_u_udirect nFs) (Frontend_dPackages_dPkg.v_packageEntry pkg)) _u_ueffTok) in (if dtb_u_u1972 then ((Obj.magic (((((((v_packageRecoverExe nFs) nConsole) nEnv) nProcess) pkg) e) o)) _u_ueffTok) else ((Obj.magic (((((((v_packageRecoverLib nFs) nConsole) nEnv) nProcess) pkg) e) o)) _u_ueffTok))))

# 1587 "Vuna/Compiler/Driver/CompilerCli.vuna"
let v_checkPackageErr = (fun (dtb_u_u1973 : string) (dtb_u_u1974 : string) (dtb_u_u1975 : string) (dtb_u_u1976 : string) (dtb_u_u1982 : Frontend_dPackages_dPkg.t_Package) (dtb_u_u1983 : Base_dDiag.t_Diagnostic) (dtb_u_u1984 : t_CliOpts) -> (if (dtb_u_u1984).f_CliOpts_optContinueOnError then (((((((v_packageRecover dtb_u_u1973) dtb_u_u1974) dtb_u_u1975) dtb_u_u1976) dtb_u_u1982) dtb_u_u1983) dtb_u_u1984) else (((((v_printDiagWithPrefix dtb_u_u1973) dtb_u_u1974) dtb_u_u1984) (String.concat "" ["["; (Frontend_dPackages_dPkg.v_packageName dtb_u_u1982); "] "])) dtb_u_u1983)))

# 1587 "Vuna/Compiler/Driver/CompilerCli.vuna"
let v_checkPackageErr_u_udirect = (fun (nFs : string) (nConsole : string) (nEnv : string) (nProcess : string) (pkg : Frontend_dPackages_dPkg.t_Package) (e : Base_dDiag.t_Diagnostic) (o : t_CliOpts) _u_ueffTok -> (if (o).f_CliOpts_optContinueOnError then ((Obj.magic (((((((v_packageRecover nFs) nConsole) nEnv) nProcess) pkg) e) o)) _u_ueffTok) else ((Obj.magic (((((v_printDiagWithPrefix nFs) nConsole) o) (String.concat "" ["["; (Frontend_dPackages_dPkg.v_packageName pkg); "] "])) e)) _u_ueffTok)))

# 1077 "Vuna/Compiler/Driver/CompilerCli.vuna"
let v_checkPackageCode = (fun (dtb_u_u1985 : string) (dtb_u_u1986 : string) (dtb_u_u1987 : string) (dtb_u_u1988 : string) (dtb_u_u1989 : string) (dtb_u_u1990 : string) (dtb_u_u1991 : string) (dtb_u_u2000 : Frontend_dPackages_dPkg.t_Package) (dtb_u_u2001 : bool) (dtb_u_u2002 : t_CliOpts) -> (Obj.repr ((fun (dtb_u_u2007 : B_dEffect_dCore.t_EffUnit) -> (let dtb_u_u2008 = Obj.obj ((if (if (dtb_u_u2002).f_CliOpts_optExplain then (B_dData_dBool.v_not (v_isMachineFormat (dtb_u_u2002).f_CliOpts_optDiagFormat)) else false) then ((((((v_printExplainEff dtb_u_u1985) dtb_u_u1986) dtb_u_u1987) dtb_u_u1988) dtb_u_u1989) dtb_u_u2000) else (let dtb_u_u2011 = 0 in (Obj.repr ((fun (dtb_u_u2012 : B_dEffect_dCore.t_EffUnit) -> dtb_u_u2011)))))) in (let dtb_u_u2013 = (dtb_u_u2008 dtb_u_u2007) in (let dtb_u_u2021 = ((((((((Driver_dCompile.v_checkPackage_u_udirect dtb_u_u1985) dtb_u_u1987) dtb_u_u1988) dtb_u_u1989) (dtb_u_u2002).f_CliOpts_optRelease) dtb_u_u2001) dtb_u_u2000) dtb_u_u2007) in (match dtb_u_u2021 with
  | Base_dDiag.C_Check_ErrC (dtb_u_u2022) -> ((Obj.magic (((((((v_checkPackageErr dtb_u_u1985) dtb_u_u1986) dtb_u_u1988) dtb_u_u1989) dtb_u_u2000) dtb_u_u2022) dtb_u_u2002)) dtb_u_u2007)
  | Base_dDiag.C_Check_OkC (dtb_u_u2023) -> (let dtb_u_u2024 = ((B_dData_dList.v_filter (v_ownedByPackage dtb_u_u2000)) (Base_dDiagnostics_dSink.v_dedupeWarnings dtb_u_u2023)) in (let dtb_u_u2025 = (if (if (dtb_u_u2002).f_CliOpts_optShowWarnings then true else (dtb_u_u2002).f_CliOpts_optDenyWarnings) then dtb_u_u2024 else B_dData_dList.C_List_Nil) in (let dtb_u_u2026 = (if (if (dtb_u_u2002).f_CliOpts_optDenyWarnings then ((B_dData_dList.v_length dtb_u_u2024) > 0) else false) then 1 else 0) in (let dtb_u_u2034 = ((((((v_printDiagList_u_udirect dtb_u_u1985) dtb_u_u1986) dtb_u_u2002) (String.concat "" ["["; (Frontend_dPackages_dPkg.v_packageName dtb_u_u2000); "] "])) dtb_u_u2025) dtb_u_u2007) in (let dtb_u_u2036 = { B_dData_dPair.f_Pair_first = dtb_u_u2026; B_dData_dPair.f_Pair_second = (B_dData_dPair.v_secondOf dtb_u_u2034) } in dtb_u_u2036)))))
  | _ -> failwith "DT: impossible branch"
))))))))

# 1077 "Vuna/Compiler/Driver/CompilerCli.vuna"
let v_checkPackageCode_u_udirect = (fun (nFs : string) (nConsole : string) (nClock : string) (nEnv : string) (nProcess : string) (nExit : string) (nArgs : string) (pkg : Frontend_dPackages_dPkg.t_Package) (wantWarnings : bool) (o : t_CliOpts) _u_ueffTok -> (let dtb_u_u2008 = Obj.obj ((if (if (o).f_CliOpts_optExplain then (B_dData_dBool.v_not (v_isMachineFormat (o).f_CliOpts_optDiagFormat)) else false) then ((((((v_printExplainEff nFs) nConsole) nClock) nEnv) nProcess) pkg) else (let dtb_u_u2011 = 0 in (Obj.repr ((fun (dtb_u_u2012 : B_dEffect_dCore.t_EffUnit) -> dtb_u_u2011)))))) in (let dtb_u_u2013 = (dtb_u_u2008 _u_ueffTok) in (let dtb_u_u2021 = ((((((((Driver_dCompile.v_checkPackage_u_udirect nFs) nClock) nEnv) nProcess) (o).f_CliOpts_optRelease) wantWarnings) pkg) _u_ueffTok) in (match dtb_u_u2021 with
  | Base_dDiag.C_Check_ErrC (dtb_u_u2022) -> ((Obj.magic (((((((v_checkPackageErr nFs) nConsole) nEnv) nProcess) pkg) dtb_u_u2022) o)) _u_ueffTok)
  | Base_dDiag.C_Check_OkC (dtb_u_u2023) -> (let dtb_u_u2024 = ((B_dData_dList.v_filter (v_ownedByPackage pkg)) (Base_dDiagnostics_dSink.v_dedupeWarnings dtb_u_u2023)) in (let dtb_u_u2025 = (if (if (o).f_CliOpts_optShowWarnings then true else (o).f_CliOpts_optDenyWarnings) then dtb_u_u2024 else B_dData_dList.C_List_Nil) in (let dtb_u_u2026 = (if (if (o).f_CliOpts_optDenyWarnings then ((B_dData_dList.v_length dtb_u_u2024) > 0) else false) then 1 else 0) in (let dtb_u_u2034 = ((((((v_printDiagList_u_udirect nFs) nConsole) o) (String.concat "" ["["; (Frontend_dPackages_dPkg.v_packageName pkg); "] "])) dtb_u_u2025) _u_ueffTok) in (let dtb_u_u2036 = { B_dData_dPair.f_Pair_first = dtb_u_u2026; B_dData_dPair.f_Pair_second = (B_dData_dPair.v_secondOf dtb_u_u2034) } in dtb_u_u2036)))))
  | _ -> failwith "DT: impossible branch"
)))))

# 1053 "Vuna/Compiler/Driver/CompilerCli.vuna"
let v_checkPackageSeq = (fun (dtb_u_u2038 : string) (dtb_u_u2039 : string) (dtb_u_u2040 : string) (dtb_u_u2041 : string) (dtb_u_u2042 : string) (dtb_u_u2043 : string) (dtb_u_u2044 : string) (dtb_u_u2053 : Frontend_dPackages_dPkg.t_Package) (dtb_u_u2054 : int) (dtb_u_u2055 : t_CliOpts) -> (let dtb_u_u2056 = ((v_applyDiagConfig (B_dData_dMaybe.C_Maybe_Just (dtb_u_u2053))) dtb_u_u2055) in (let dtb_u_u2057 = (if (dtb_u_u2056).f_CliOpts_optShowWarnings then true else (dtb_u_u2056).f_CliOpts_optDenyWarnings) in (Obj.repr ((fun (dtb_u_u2062 : B_dEffect_dCore.t_EffUnit) -> (let dtb_u_u2065 = (((((((((((v_checkPackageCode_u_udirect dtb_u_u2038) dtb_u_u2039) dtb_u_u2040) dtb_u_u2041) dtb_u_u2042) dtb_u_u2043) dtb_u_u2044) dtb_u_u2053) dtb_u_u2057) dtb_u_u2056) dtb_u_u2062) in (let dtb_u_u2067 = { B_dData_dPair.f_Pair_first = (if ((B_dData_dPair.v_firstOf dtb_u_u2065) > dtb_u_u2054) then (B_dData_dPair.v_firstOf dtb_u_u2065) else dtb_u_u2054); B_dData_dPair.f_Pair_second = (B_dData_dPair.v_secondOf dtb_u_u2065) } in dtb_u_u2067))))))))

# 1053 "Vuna/Compiler/Driver/CompilerCli.vuna"
let v_checkPackageSeq_u_udirect = (fun (nFs : string) (nConsole : string) (nClock : string) (nEnv : string) (nProcess : string) (nExit : string) (nArgs : string) (pkg : Frontend_dPackages_dPkg.t_Package) (code : int) (o : t_CliOpts) _u_ueffTok -> (let dtb_u_u2056 = ((v_applyDiagConfig (B_dData_dMaybe.C_Maybe_Just (pkg))) o) in (let dtb_u_u2057 = (if (dtb_u_u2056).f_CliOpts_optShowWarnings then true else (dtb_u_u2056).f_CliOpts_optDenyWarnings) in (let dtb_u_u2065 = (((((((((((v_checkPackageCode_u_udirect nFs) nConsole) nClock) nEnv) nProcess) nExit) nArgs) pkg) dtb_u_u2057) dtb_u_u2056) _u_ueffTok) in (let dtb_u_u2067 = { B_dData_dPair.f_Pair_first = (if ((B_dData_dPair.v_firstOf dtb_u_u2065) > code) then (B_dData_dPair.v_firstOf dtb_u_u2065) else code); B_dData_dPair.f_Pair_second = (B_dData_dPair.v_secondOf dtb_u_u2065) } in dtb_u_u2067)))))

# 1032 "Vuna/Compiler/Driver/CompilerCli.vuna"
let rec v_checkPkgsInProcess = (fun (dtb_u_u2069 : string) (dtb_u_u2070 : string) (dtb_u_u2071 : string) (dtb_u_u2072 : string) (dtb_u_u2073 : string) (dtb_u_u2074 : string) (dtb_u_u2075 : string) (dtb_u_u2084 : Frontend_dPackages_dPkg.t_Package B_dData_dList.t_List) (dtb_u_u2085 : int) (dtb_u_u2086 : t_CliOpts) -> (match dtb_u_u2084 with
  | B_dData_dList.C_List__x58__x58_ (dtb_u_u2087, dtb_u_u2088) -> (Obj.repr ((fun (dtb_u_u2093 : B_dEffect_dCore.t_EffUnit) -> (let dtb_u_u2096 = (((((((((((v_checkPackageSeq_u_udirect dtb_u_u2069) dtb_u_u2070) dtb_u_u2071) dtb_u_u2072) dtb_u_u2073) dtb_u_u2074) dtb_u_u2075) dtb_u_u2087) dtb_u_u2085) dtb_u_u2086) dtb_u_u2093) in ((Obj.magic ((((((((((v_checkPkgsInProcess dtb_u_u2069) dtb_u_u2070) dtb_u_u2071) dtb_u_u2072) dtb_u_u2073) dtb_u_u2074) dtb_u_u2075) dtb_u_u2088) (B_dData_dPair.v_firstOf dtb_u_u2096)) (B_dData_dPair.v_secondOf dtb_u_u2096))) dtb_u_u2093)))))
  | B_dData_dList.C_List_Nil -> (let dtb_u_u2098 = { B_dData_dPair.f_Pair_first = dtb_u_u2085; B_dData_dPair.f_Pair_second = dtb_u_u2086 } in (Obj.repr ((fun (dtb_u_u2099 : B_dEffect_dCore.t_EffUnit) -> dtb_u_u2098))))
  | _ -> failwith "DT: impossible branch"
))
# 1032 "Vuna/Compiler/Driver/CompilerCli.vuna"
and v_checkPkgsInProcess_u_udirect = (fun (nFs : string) (nConsole : string) (nClock : string) (nEnv : string) (nProcess : string) (nExit : string) (nArgs : string) (mc0 : Frontend_dPackages_dPkg.t_Package B_dData_dList.t_List) (mc1 : int) (mc2 : t_CliOpts) _u_ueffTok -> (match mc0 with
  | B_dData_dList.C_List__x58__x58_ (dtb_u_u2087, dtb_u_u2088) -> (let dtb_u_u2096 = (((((((((((v_checkPackageSeq_u_udirect nFs) nConsole) nClock) nEnv) nProcess) nExit) nArgs) dtb_u_u2087) mc1) mc2) _u_ueffTok) in ((Obj.magic ((((((((((v_checkPkgsInProcess nFs) nConsole) nClock) nEnv) nProcess) nExit) nArgs) dtb_u_u2088) (B_dData_dPair.v_firstOf dtb_u_u2096)) (B_dData_dPair.v_secondOf dtb_u_u2096))) _u_ueffTok))
  | B_dData_dList.C_List_Nil -> (let dtb_u_u2098 = { B_dData_dPair.f_Pair_first = mc1; B_dData_dPair.f_Pair_second = mc2 } in dtb_u_u2098)
  | _ -> failwith "DT: impossible branch"
))

# 1044 "Vuna/Compiler/Driver/CompilerCli.vuna"
let rec v_checkRootsSeq = (fun (dtb_u_u2100 : string) (dtb_u_u2101 : string) (dtb_u_u2102 : string) (dtb_u_u2103 : string) (dtb_u_u2104 : string) (dtb_u_u2105 : string) (dtb_u_u2106 : string) (dtb_u_u2115 : Frontend_dPackages_dPkg.t_Package B_dData_dList.t_List) (dtb_u_u2116 : int) (dtb_u_u2117 : t_CliOpts) -> (match dtb_u_u2115 with
  | B_dData_dList.C_List__x58__x58_ (dtb_u_u2118, dtb_u_u2119) -> (Obj.repr ((fun (dtb_u_u2124 : B_dEffect_dCore.t_EffUnit) -> (let dtb_u_u2127 = (((((((((((v_checkPackageSeq_u_udirect dtb_u_u2100) dtb_u_u2101) dtb_u_u2102) dtb_u_u2103) dtb_u_u2104) dtb_u_u2105) dtb_u_u2106) dtb_u_u2118) dtb_u_u2116) dtb_u_u2117) dtb_u_u2124) in (let dtb_u_u2128 = (B_dData_dPair.v_firstOf dtb_u_u2127) in (if (if (dtb_u_u2117).f_CliOpts_optFailFast then (dtb_u_u2128 <> 0) else false) then (let dtb_u_u2130 = { B_dData_dPair.f_Pair_first = dtb_u_u2128; B_dData_dPair.f_Pair_second = (B_dData_dPair.v_secondOf dtb_u_u2127) } in dtb_u_u2130) else ((Obj.magic ((((((((((v_checkRootsSeq dtb_u_u2100) dtb_u_u2101) dtb_u_u2102) dtb_u_u2103) dtb_u_u2104) dtb_u_u2105) dtb_u_u2106) dtb_u_u2119) dtb_u_u2128) (B_dData_dPair.v_secondOf dtb_u_u2127))) dtb_u_u2124)))))))
  | B_dData_dList.C_List_Nil -> (let dtb_u_u2133 = { B_dData_dPair.f_Pair_first = dtb_u_u2116; B_dData_dPair.f_Pair_second = dtb_u_u2117 } in (Obj.repr ((fun (dtb_u_u2134 : B_dEffect_dCore.t_EffUnit) -> dtb_u_u2133))))
  | _ -> failwith "DT: impossible branch"
))
# 1044 "Vuna/Compiler/Driver/CompilerCli.vuna"
and v_checkRootsSeq_u_udirect = (fun (nFs : string) (nConsole : string) (nClock : string) (nEnv : string) (nProcess : string) (nExit : string) (nArgs : string) (mc0 : Frontend_dPackages_dPkg.t_Package B_dData_dList.t_List) (mc1 : int) (mc2 : t_CliOpts) _u_ueffTok -> (match mc0 with
  | B_dData_dList.C_List__x58__x58_ (dtb_u_u2118, dtb_u_u2119) -> (let dtb_u_u2127 = (((((((((((v_checkPackageSeq_u_udirect nFs) nConsole) nClock) nEnv) nProcess) nExit) nArgs) dtb_u_u2118) mc1) mc2) _u_ueffTok) in (let dtb_u_u2128 = (B_dData_dPair.v_firstOf dtb_u_u2127) in (if (if (mc2).f_CliOpts_optFailFast then (dtb_u_u2128 <> 0) else false) then (let dtb_u_u2130 = { B_dData_dPair.f_Pair_first = dtb_u_u2128; B_dData_dPair.f_Pair_second = (B_dData_dPair.v_secondOf dtb_u_u2127) } in dtb_u_u2130) else ((Obj.magic ((((((((((v_checkRootsSeq nFs) nConsole) nClock) nEnv) nProcess) nExit) nArgs) dtb_u_u2119) dtb_u_u2128) (B_dData_dPair.v_secondOf dtb_u_u2127))) _u_ueffTok))))
  | B_dData_dList.C_List_Nil -> (let dtb_u_u2133 = { B_dData_dPair.f_Pair_first = mc1; B_dData_dPair.f_Pair_second = mc2 } in dtb_u_u2133)
  | _ -> failwith "DT: impossible branch"
))

# 972 "Vuna/Compiler/Driver/CompilerCli.vuna"
let v_checkPackagesSpawn = (fun (dtb_u_u2135 : string) (dtb_u_u2136 : string) (dtb_u_u2137 : string) (dtb_u_u2138 : string) (dtb_u_u2139 : string) (dtb_u_u2140 : string) (dtb_u_u2141 : string) (dtb_u_u2150 : Frontend_dPackages_dPkg.t_Package B_dData_dList.t_List) (dtb_u_u2151 : int) (dtb_u_u2152 : t_CliOpts) -> (match dtb_u_u2150 with
  | B_dData_dList.C_List_Nil -> (let dtb_u_u2154 = { B_dData_dPair.f_Pair_first = dtb_u_u2151; B_dData_dPair.f_Pair_second = dtb_u_u2152 } in (Obj.repr ((fun (dtb_u_u2155 : B_dEffect_dCore.t_EffUnit) -> dtb_u_u2154))))
  | _ -> (let dtb_u_u2156 = ((B_dData_dList.v_filter (fun (dtb_u_u2167 : Frontend_dPackages_dPkg.t_Package) -> (B_dData_dBool.v_not (v_isWorkspaceRoot dtb_u_u2167)))) dtb_u_u2150) in (let dtb_u_u2157 = ((B_dData_dList.v_filter v_isWorkspaceRoot) dtb_u_u2150) in (let dtb_u_u2158 = ((B_dData_dList.v_map Frontend_dPackages_dPkg.v_packageName) dtb_u_u2156) in (Obj.repr ((fun (dtb_u_u2163 : B_dEffect_dCore.t_EffUnit) -> (let dtb_u_u2166 = (((((((((((v_checkRootsSeq_u_udirect dtb_u_u2135) dtb_u_u2136) dtb_u_u2137) dtb_u_u2138) dtb_u_u2139) dtb_u_u2140) dtb_u_u2141) dtb_u_u2157) dtb_u_u2151) dtb_u_u2152) dtb_u_u2163) in ((Obj.magic (((((((((((((v_checkMembersByLevel dtb_u_u2135) dtb_u_u2136) dtb_u_u2137) dtb_u_u2138) dtb_u_u2139) dtb_u_u2140) dtb_u_u2141) (B_dData_dList.v_length dtb_u_u2156)) dtb_u_u2156) dtb_u_u2158) B_dData_dList.C_List_Nil) (B_dData_dPair.v_firstOf dtb_u_u2166)) (B_dData_dPair.v_secondOf dtb_u_u2166))) dtb_u_u2163))))))))
))

# 972 "Vuna/Compiler/Driver/CompilerCli.vuna"
let v_checkPackagesSpawn_u_udirect = (fun (nFs : string) (nConsole : string) (nClock : string) (nEnv : string) (nProcess : string) (nExit : string) (nArgs : string) (mc0 : Frontend_dPackages_dPkg.t_Package B_dData_dList.t_List) (mc1 : int) (mc2 : t_CliOpts) _u_ueffTok -> (match mc0 with
  | B_dData_dList.C_List_Nil -> (let dtb_u_u2154 = { B_dData_dPair.f_Pair_first = mc1; B_dData_dPair.f_Pair_second = mc2 } in dtb_u_u2154)
  | _ -> (let dtb_u_u2156 = ((B_dData_dList.v_filter (fun (dtb_u_u2167 : Frontend_dPackages_dPkg.t_Package) -> (B_dData_dBool.v_not (v_isWorkspaceRoot dtb_u_u2167)))) mc0) in (let dtb_u_u2157 = ((B_dData_dList.v_filter v_isWorkspaceRoot) mc0) in (let dtb_u_u2158 = ((B_dData_dList.v_map Frontend_dPackages_dPkg.v_packageName) dtb_u_u2156) in (let dtb_u_u2166 = (((((((((((v_checkRootsSeq_u_udirect nFs) nConsole) nClock) nEnv) nProcess) nExit) nArgs) dtb_u_u2157) mc1) mc2) _u_ueffTok) in ((Obj.magic (((((((((((((v_checkMembersByLevel nFs) nConsole) nClock) nEnv) nProcess) nExit) nArgs) (B_dData_dList.v_length dtb_u_u2156)) dtb_u_u2156) dtb_u_u2158) B_dData_dList.C_List_Nil) (B_dData_dPair.v_firstOf dtb_u_u2166)) (B_dData_dPair.v_secondOf dtb_u_u2166))) _u_ueffTok)))))
))

# 952 "Vuna/Compiler/Driver/CompilerCli.vuna"
let v_checkPackages = (fun (dtb_u_u2168 : string) (dtb_u_u2169 : string) (dtb_u_u2170 : string) (dtb_u_u2171 : string) (dtb_u_u2172 : string) (dtb_u_u2173 : string) (dtb_u_u2174 : string) (dtb_u_u2183 : Frontend_dPackages_dPkg.t_Package B_dData_dList.t_List) (dtb_u_u2184 : int) (dtb_u_u2185 : t_CliOpts) -> (match dtb_u_u2183 with
  | B_dData_dList.C_List__x58__x58_ (dtb_u_u2186, dtb_u_u2187) -> (match dtb_u_u2187 with
  | B_dData_dList.C_List_Nil -> ((((((((((v_checkPackageSeq dtb_u_u2168) dtb_u_u2169) dtb_u_u2170) dtb_u_u2171) dtb_u_u2172) dtb_u_u2173) dtb_u_u2174) dtb_u_u2186) dtb_u_u2184) dtb_u_u2185)
  | _ -> (let dtb_u_u2188 = (v_markFormatExplicit dtb_u_u2185) in (if (v_isMachineFormat (dtb_u_u2185).f_CliOpts_optDiagFormat) then ((((((((((v_checkPkgsInProcess dtb_u_u2168) dtb_u_u2169) dtb_u_u2170) dtb_u_u2171) dtb_u_u2172) dtb_u_u2173) dtb_u_u2174) dtb_u_u2183) dtb_u_u2184) dtb_u_u2188) else ((((((((((v_checkPackagesSpawn dtb_u_u2168) dtb_u_u2169) dtb_u_u2170) dtb_u_u2171) dtb_u_u2172) dtb_u_u2173) dtb_u_u2174) dtb_u_u2183) dtb_u_u2184) dtb_u_u2185)))
)
  | B_dData_dList.C_List_Nil -> (let dtb_u_u2190 = { B_dData_dPair.f_Pair_first = dtb_u_u2184; B_dData_dPair.f_Pair_second = dtb_u_u2185 } in (Obj.repr ((fun (dtb_u_u2191 : B_dEffect_dCore.t_EffUnit) -> dtb_u_u2190))))
  | _ -> failwith "DT: impossible branch"
))

# 952 "Vuna/Compiler/Driver/CompilerCli.vuna"
let v_checkPackages_u_udirect = (fun (nFs : string) (nConsole : string) (nClock : string) (nEnv : string) (nProcess : string) (nExit : string) (nArgs : string) (mc0 : Frontend_dPackages_dPkg.t_Package B_dData_dList.t_List) (mc1 : int) (mc2 : t_CliOpts) _u_ueffTok -> (match mc0 with
  | B_dData_dList.C_List__x58__x58_ (dtb_u_u2186, dtb_u_u2187) -> (match dtb_u_u2187 with
  | B_dData_dList.C_List_Nil -> ((Obj.magic ((((((((((v_checkPackageSeq nFs) nConsole) nClock) nEnv) nProcess) nExit) nArgs) dtb_u_u2186) mc1) mc2)) _u_ueffTok)
  | _ -> (let dtb_u_u2188 = (v_markFormatExplicit mc2) in (if (v_isMachineFormat (mc2).f_CliOpts_optDiagFormat) then ((Obj.magic ((((((((((v_checkPkgsInProcess nFs) nConsole) nClock) nEnv) nProcess) nExit) nArgs) mc0) mc1) dtb_u_u2188)) _u_ueffTok) else ((Obj.magic ((((((((((v_checkPackagesSpawn nFs) nConsole) nClock) nEnv) nProcess) nExit) nArgs) mc0) mc1) mc2)) _u_ueffTok)))
)
  | B_dData_dList.C_List_Nil -> (let dtb_u_u2190 = { B_dData_dPair.f_Pair_first = mc1; B_dData_dPair.f_Pair_second = mc2 } in dtb_u_u2190)
  | _ -> failwith "DT: impossible branch"
))

# 911 "Vuna/Compiler/Driver/CompilerCli.vuna"
let v_checkPkgDir = (fun (dtb_u_u2192 : string) (dtb_u_u2193 : string) (dtb_u_u2194 : string) (dtb_u_u2195 : string) (dtb_u_u2196 : string) (dtb_u_u2197 : string) (dtb_u_u2198 : string) (dtb_u_u2207 : string) (dtb_u_u2208 : t_CliOpts) -> (Obj.repr ((fun (dtb_u_u2213 : B_dEffect_dCore.t_EffUnit) -> (let dtb_u_u2216 = ((((Frontend_dPackages_dPkg.v_workspacePackages_u_udirect dtb_u_u2192) dtb_u_u2195) dtb_u_u2207) dtb_u_u2213) in (match dtb_u_u2216 with
  | Base_dDiag.C_Check_ErrC (dtb_u_u2217) -> ((Obj.magic ((((v_printDiag dtb_u_u2192) dtb_u_u2193) dtb_u_u2208) dtb_u_u2217)) dtb_u_u2213)
  | Base_dDiag.C_Check_OkC (dtb_u_u2218) -> ((Obj.magic ((((((((((v_checkPackages dtb_u_u2192) dtb_u_u2193) dtb_u_u2194) dtb_u_u2195) dtb_u_u2196) dtb_u_u2197) dtb_u_u2198) dtb_u_u2218) 0) dtb_u_u2208)) dtb_u_u2213)
  | _ -> failwith "DT: impossible branch"
))))))

# 911 "Vuna/Compiler/Driver/CompilerCli.vuna"
let v_checkPkgDir_u_udirect = (fun (nFs : string) (nConsole : string) (nClock : string) (nEnv : string) (nProcess : string) (nExit : string) (nArgs : string) (dir : string) (o : t_CliOpts) _u_ueffTok -> (let dtb_u_u2216 = ((((Frontend_dPackages_dPkg.v_workspacePackages_u_udirect nFs) nEnv) dir) _u_ueffTok) in (match dtb_u_u2216 with
  | Base_dDiag.C_Check_ErrC (dtb_u_u2217) -> ((Obj.magic ((((v_printDiag nFs) nConsole) o) dtb_u_u2217)) _u_ueffTok)
  | Base_dDiag.C_Check_OkC (dtb_u_u2218) -> ((Obj.magic ((((((((((v_checkPackages nFs) nConsole) nClock) nEnv) nProcess) nExit) nArgs) dtb_u_u2218) 0) o)) _u_ueffTok)
  | _ -> failwith "DT: impossible branch"
)))

# 900 "Vuna/Compiler/Driver/CompilerCli.vuna"
let v_checkEmit = (fun (dtb_u_u2219 : string) (dtb_u_u2220 : string) (dtb_u_u2221 : string) (dtb_u_u2222 : string) (dtb_u_u2223 : string) (dtb_u_u2224 : string) (dtb_u_u2225 : string) (dtb_u_u2234 : string) (dtb_u_u2235 : t_CliOpts) -> (Obj.repr ((fun (dtb_u_u2240 : B_dEffect_dCore.t_EffUnit) -> (let dtb_u_u2243 = (((B_dEffect_dFs.v_fsFileExists_u_udirect dtb_u_u2219) dtb_u_u2234) dtb_u_u2240) in (if dtb_u_u2243 then (let dtb_u_u2251 = (((B_dEffect_dFs.v_fsIsDirectory_u_udirect dtb_u_u2219) dtb_u_u2234) dtb_u_u2240) in (if dtb_u_u2251 then ((Obj.magic (((((((((v_checkPkgDir dtb_u_u2219) dtb_u_u2220) dtb_u_u2221) dtb_u_u2222) dtb_u_u2223) dtb_u_u2224) dtb_u_u2225) dtb_u_u2234) dtb_u_u2235)) dtb_u_u2240) else ((Obj.magic ((((((v_checkFileEntry dtb_u_u2219) dtb_u_u2220) dtb_u_u2222) dtb_u_u2223) dtb_u_u2234) dtb_u_u2235)) dtb_u_u2240))) else ((Obj.magic ((v_withOpts dtb_u_u2235) ((v_dtPathErr dtb_u_u2220) dtb_u_u2234))) dtb_u_u2240)))))))

# 900 "Vuna/Compiler/Driver/CompilerCli.vuna"
let v_checkEmit_u_udirect = (fun (nFs : string) (nConsole : string) (nClock : string) (nEnv : string) (nProcess : string) (nExit : string) (nArgs : string) (path : string) (o : t_CliOpts) _u_ueffTok -> (let dtb_u_u2243 = (((B_dEffect_dFs.v_fsFileExists_u_udirect nFs) path) _u_ueffTok) in (if dtb_u_u2243 then (let dtb_u_u2251 = (((B_dEffect_dFs.v_fsIsDirectory_u_udirect nFs) path) _u_ueffTok) in (if dtb_u_u2251 then ((Obj.magic (((((((((v_checkPkgDir nFs) nConsole) nClock) nEnv) nProcess) nExit) nArgs) path) o)) _u_ueffTok) else ((Obj.magic ((((((v_checkFileEntry nFs) nConsole) nEnv) nProcess) path) o)) _u_ueffTok))) else ((Obj.magic ((v_withOpts o) ((v_dtPathErr nConsole) path))) _u_ueffTok))))

# 887 "Vuna/Compiler/Driver/CompilerCli.vuna"
let rec v_checkArgs = (fun (dtb_u_u2252 : string) (dtb_u_u2253 : string) (dtb_u_u2254 : string) (dtb_u_u2255 : string) (dtb_u_u2256 : string) (dtb_u_u2257 : string) (dtb_u_u2258 : string) (dtb_u_u2267 : string) (dtb_u_u2268 : string B_dData_dList.t_List) (dtb_u_u2269 : t_CliOpts) -> (match dtb_u_u2268 with
  | B_dData_dList.C_List__x58__x58_ (dtb_u_u2270, dtb_u_u2271) -> (if (dtb_u_u2270 = "--release") then ((((((((((v_checkArgs dtb_u_u2252) dtb_u_u2253) dtb_u_u2254) dtb_u_u2255) dtb_u_u2256) dtb_u_u2257) dtb_u_u2258) dtb_u_u2267) dtb_u_u2271) (v_markRelease dtb_u_u2269)) else (if (dtb_u_u2270 = "--explain") then ((((((((((v_checkArgs dtb_u_u2252) dtb_u_u2253) dtb_u_u2254) dtb_u_u2255) dtb_u_u2256) dtb_u_u2257) dtb_u_u2258) dtb_u_u2267) dtb_u_u2271) (v_markExplain dtb_u_u2269)) else (if ((B_dData_dString.v_startsWith "-") dtb_u_u2270) then ((v_withOpts dtb_u_u2269) (((v_removedFlag dtb_u_u2253) dtb_u_u2267) dtb_u_u2270)) else (match dtb_u_u2271 with
  | B_dData_dList.C_List_Nil -> (((((((((v_checkEmit dtb_u_u2252) dtb_u_u2253) dtb_u_u2254) dtb_u_u2255) dtb_u_u2256) dtb_u_u2257) dtb_u_u2258) dtb_u_u2270) dtb_u_u2269)
  | _ -> ((v_withOpts dtb_u_u2269) ((v_usageErr dtb_u_u2253) dtb_u_u2267))
))))
  | B_dData_dList.C_List_Nil -> ((v_withOpts dtb_u_u2269) ((v_usageErr dtb_u_u2253) dtb_u_u2267))
  | _ -> failwith "DT: impossible branch"
))
# 887 "Vuna/Compiler/Driver/CompilerCli.vuna"
and v_checkArgs_u_udirect = (fun (nFs : string) (nConsole : string) (nClock : string) (nEnv : string) (nProcess : string) (nExit : string) (nArgs : string) (mc0 : string) (mc1 : string B_dData_dList.t_List) (mc2 : t_CliOpts) _u_ueffTok -> (match mc1 with
  | B_dData_dList.C_List__x58__x58_ (dtb_u_u2270, dtb_u_u2271) -> (if (dtb_u_u2270 = "--release") then ((Obj.magic ((((((((((v_checkArgs nFs) nConsole) nClock) nEnv) nProcess) nExit) nArgs) mc0) dtb_u_u2271) (v_markRelease mc2))) _u_ueffTok) else (if (dtb_u_u2270 = "--explain") then ((Obj.magic ((((((((((v_checkArgs nFs) nConsole) nClock) nEnv) nProcess) nExit) nArgs) mc0) dtb_u_u2271) (v_markExplain mc2))) _u_ueffTok) else (if ((B_dData_dString.v_startsWith "-") dtb_u_u2270) then ((Obj.magic ((v_withOpts mc2) (((v_removedFlag nConsole) mc0) dtb_u_u2270))) _u_ueffTok) else (match dtb_u_u2271 with
  | B_dData_dList.C_List_Nil -> ((Obj.magic (((((((((v_checkEmit nFs) nConsole) nClock) nEnv) nProcess) nExit) nArgs) dtb_u_u2270) mc2)) _u_ueffTok)
  | _ -> ((Obj.magic ((v_withOpts mc2) ((v_usageErr nConsole) mc0))) _u_ueffTok)
))))
  | B_dData_dList.C_List_Nil -> ((Obj.magic ((v_withOpts mc2) ((v_usageErr nConsole) mc0))) _u_ueffTok)
  | _ -> failwith "DT: impossible branch"
))

# 577 "Vuna/Compiler/Driver/CompilerCli.vuna"
let v_runCompilerCliFor1 = (fun (dtb_u_u2272 : string) (dtb_u_u2273 : string) (dtb_u_u2274 : string) (dtb_u_u2275 : string) (dtb_u_u2276 : string) (dtb_u_u2277 : string) (dtb_u_u2278 : string) (dtb_u_u2279 : string) (dtb_u_u2289 : string) (dtb_u_u2290 : string B_dData_dList.t_List) (dtb_u_u2291 : t_CliOpts) -> (match dtb_u_u2290 with
  | B_dData_dList.C_List_Nil -> ((v_withOpts dtb_u_u2291) ((v_usageErr dtb_u_u2273) dtb_u_u2289))
  | B_dData_dList.C_List__x58__x58_ (dtb_u_u2292, dtb_u_u2293) -> (if (dtb_u_u2292 = "compile") then ((((((((v_compileArgs dtb_u_u2272) dtb_u_u2273) dtb_u_u2274) dtb_u_u2275) dtb_u_u2276) dtb_u_u2289) dtb_u_u2293) dtb_u_u2291) else (if (dtb_u_u2292 = "check") then ((((((((((v_checkArgs dtb_u_u2272) dtb_u_u2273) dtb_u_u2274) dtb_u_u2275) dtb_u_u2276) dtb_u_u2277) dtb_u_u2278) dtb_u_u2289) dtb_u_u2293) dtb_u_u2291) else (if (dtb_u_u2292 = "build") then ((((((((((v_buildArgs dtb_u_u2272) dtb_u_u2273) dtb_u_u2274) dtb_u_u2275) dtb_u_u2276) dtb_u_u2277) dtb_u_u2278) dtb_u_u2289) dtb_u_u2293) dtb_u_u2291) else (if (dtb_u_u2292 = "version") then ((v_withOpts dtb_u_u2291) ((v_printVersion dtb_u_u2273) 0)) else (if (dtb_u_u2292 = "--version") then ((v_withOpts dtb_u_u2291) ((v_printVersion dtb_u_u2273) 0)) else (if (dtb_u_u2292 = "seed") then ((v_withOpts dtb_u_u2291) ((((v_removedCommand dtb_u_u2273) dtb_u_u2289) "seed") "use build --out OUT [DIR] or compile DIR OUT")) else (if (dtb_u_u2292 = "help") then ((v_withOpts dtb_u_u2291) ((v_helpFor dtb_u_u2273) dtb_u_u2289)) else (if ((B_dData_dString.v_startsWith "-") dtb_u_u2292) then ((v_withOpts dtb_u_u2291) (((v_removedFlag dtb_u_u2273) dtb_u_u2289) dtb_u_u2292)) else ((v_withOpts dtb_u_u2291) (((v_unknownCommand dtb_u_u2273) dtb_u_u2289) dtb_u_u2292))))))))))
  | _ -> failwith "DT: impossible branch"
))

# 577 "Vuna/Compiler/Driver/CompilerCli.vuna"
let v_runCompilerCliFor1_u_udirect = (fun (nFs : string) (nConsole : string) (nClock : string) (nEnv : string) (nProcess : string) (nExit : string) (nArgs : string) (nTty : string) (prog : string) (args : string B_dData_dList.t_List) (o : t_CliOpts) _u_ueffTok -> (match args with
  | B_dData_dList.C_List_Nil -> ((Obj.magic ((v_withOpts o) ((v_usageErr nConsole) prog))) _u_ueffTok)
  | B_dData_dList.C_List__x58__x58_ (dtb_u_u2292, dtb_u_u2293) -> (if (dtb_u_u2292 = "compile") then ((Obj.magic ((((((((v_compileArgs nFs) nConsole) nClock) nEnv) nProcess) prog) dtb_u_u2293) o)) _u_ueffTok) else (if (dtb_u_u2292 = "check") then ((Obj.magic ((((((((((v_checkArgs nFs) nConsole) nClock) nEnv) nProcess) nExit) nArgs) prog) dtb_u_u2293) o)) _u_ueffTok) else (if (dtb_u_u2292 = "build") then ((Obj.magic ((((((((((v_buildArgs nFs) nConsole) nClock) nEnv) nProcess) nExit) nArgs) prog) dtb_u_u2293) o)) _u_ueffTok) else (if (dtb_u_u2292 = "version") then ((Obj.magic ((v_withOpts o) ((v_printVersion nConsole) 0))) _u_ueffTok) else (if (dtb_u_u2292 = "--version") then ((Obj.magic ((v_withOpts o) ((v_printVersion nConsole) 0))) _u_ueffTok) else (if (dtb_u_u2292 = "seed") then ((Obj.magic ((v_withOpts o) ((((v_removedCommand nConsole) prog) "seed") "use build --out OUT [DIR] or compile DIR OUT"))) _u_ueffTok) else (if (dtb_u_u2292 = "help") then ((Obj.magic ((v_withOpts o) ((v_helpFor nConsole) prog))) _u_ueffTok) else (if ((B_dData_dString.v_startsWith "-") dtb_u_u2292) then ((Obj.magic ((v_withOpts o) (((v_removedFlag nConsole) prog) dtb_u_u2292))) _u_ueffTok) else ((Obj.magic ((v_withOpts o) (((v_unknownCommand nConsole) prog) dtb_u_u2292))) _u_ueffTok)))))))))
  | _ -> failwith "DT: impossible branch"
))

# 511 "Vuna/Compiler/Driver/CompilerCli.vuna"
let v_runCompilerCliFor = (fun (dtb_u_u2294 : string) (dtb_u_u2295 : string) (dtb_u_u2296 : string) (dtb_u_u2297 : string) (dtb_u_u2298 : string) (dtb_u_u2299 : string) (dtb_u_u2300 : string) (dtb_u_u2301 : string) (dtb_u_u2311 : string) (dtb_u_u2312 : string B_dData_dList.t_List) -> (Obj.repr ((fun (dtb_u_u2317 : B_dEffect_dCore.t_EffUnit) -> (let dtb_u_u2320 = (((B_dEffect_dEnv.v_envGetEnv_u_udirect dtb_u_u2297) "VUNA_RELEASE") dtb_u_u2317) in (let dtb_u_u2328 = ((B_dEffect_dTty.v_ttyIsTty_u_udirect dtb_u_u2301) dtb_u_u2317) in (let dtb_u_u2329 = (v_stripDiagFormat dtb_u_u2312) in (let dtb_u_u2330 = (v_stripLang (B_dData_dPair.v_firstOf dtb_u_u2329)) in (let dtb_u_u2331 = (v_stripMaxErrors (B_dData_dPair.v_firstOf dtb_u_u2330)) in (let dtb_u_u2332 = (v_stripDenyWarnings (B_dData_dPair.v_firstOf dtb_u_u2331)) in (let dtb_u_u2333 = (v_stripContinueOnError dtb_u_u2332) in (let dtb_u_u2334 = (B_dData_dPair.v_secondOf dtb_u_u2330) in (let dtb_u_u2335 = (match (B_dData_dPair.v_secondOf dtb_u_u2329) with
  | B_dData_dMaybe.C_Maybe_Just (dtb_u_u2345) -> dtb_u_u2345
  | B_dData_dMaybe.C_Maybe_Nothing -> (if (dtb_u_u2334 = "en") then (if dtb_u_u2328 then "human" else "short") else "human")
  | _ -> failwith "DT: impossible branch"
) in (let dtb_u_u2336 = { f_CliOpts_optDiagFormat = dtb_u_u2335; f_CliOpts_optDiagLang = dtb_u_u2334; f_CliOpts_optLangExplicit = (v_hasLangFlag dtb_u_u2312); f_CliOpts_optDenyWarnings = (v_hasDenyWarnings dtb_u_u2312); f_CliOpts_optShowWarnings = (if (v_hasDenyWarnings dtb_u_u2312) then true else (v_hasShowWarnings dtb_u_u2312)); f_CliOpts_optFormatExplicit = (v_hasFormatFlag dtb_u_u2312); f_CliOpts_optWarningsExplicit = (if (v_hasDenyWarnings dtb_u_u2312) then true else (v_hasShowWarnings dtb_u_u2312)); f_CliOpts_optDenyExplicit = (v_hasDenyWarnings dtb_u_u2312); f_CliOpts_optMaxErrors = (B_dData_dPair.v_secondOf dtb_u_u2331); f_CliOpts_optContinueOnError = (B_dData_dPair.v_secondOf dtb_u_u2333); f_CliOpts_optSarifItems = B_dData_dList.C_List_Nil; f_CliOpts_optRelease = (dtb_u_u2320 = "1"); f_CliOpts_optShowCascade = (v_hasShowCascade dtb_u_u2312); f_CliOpts_optWithSources = (v_hasWithSources dtb_u_u2312); f_CliOpts_optFailFast = (v_hasFailFast dtb_u_u2312); f_CliOpts_optTarget = "ocaml"; f_CliOpts_optWasmOpt = 3; f_CliOpts_optExplain = false } in (if (v_anyHelp (B_dData_dPair.v_firstOf dtb_u_u2333)) then ((Obj.magic ((v_helpFor dtb_u_u2295) dtb_u_u2311)) dtb_u_u2317) else (let dtb_u_u2344 = ((((((((((((v_runCompilerCliFor1_u_udirect dtb_u_u2294) dtb_u_u2295) dtb_u_u2296) dtb_u_u2297) dtb_u_u2298) dtb_u_u2299) dtb_u_u2300) dtb_u_u2301) dtb_u_u2311) (v_stripFailFast (v_stripWithSources (v_stripShowCascade (B_dData_dPair.v_firstOf dtb_u_u2333))))) dtb_u_u2336) dtb_u_u2317) in ((Obj.magic (((((v_flushSarif dtb_u_u2294) dtb_u_u2295) dtb_u_u2297) (B_dData_dPair.v_firstOf dtb_u_u2344)) (B_dData_dPair.v_secondOf dtb_u_u2344))) dtb_u_u2317)))))))))))))))))

# 511 "Vuna/Compiler/Driver/CompilerCli.vuna"
let v_runCompilerCliFor_u_udirect = (fun (nFs : string) (nConsole : string) (nClock : string) (nEnv : string) (nProcess : string) (nExit : string) (nArgs : string) (nTty : string) (prog : string) (args : string B_dData_dList.t_List) _u_ueffTok -> (let dtb_u_u2320 = (((B_dEffect_dEnv.v_envGetEnv_u_udirect nEnv) "VUNA_RELEASE") _u_ueffTok) in (let dtb_u_u2328 = ((B_dEffect_dTty.v_ttyIsTty_u_udirect nTty) _u_ueffTok) in (let dtb_u_u2329 = (v_stripDiagFormat args) in (let dtb_u_u2330 = (v_stripLang (B_dData_dPair.v_firstOf dtb_u_u2329)) in (let dtb_u_u2331 = (v_stripMaxErrors (B_dData_dPair.v_firstOf dtb_u_u2330)) in (let dtb_u_u2332 = (v_stripDenyWarnings (B_dData_dPair.v_firstOf dtb_u_u2331)) in (let dtb_u_u2333 = (v_stripContinueOnError dtb_u_u2332) in (let dtb_u_u2334 = (B_dData_dPair.v_secondOf dtb_u_u2330) in (let dtb_u_u2335 = (match (B_dData_dPair.v_secondOf dtb_u_u2329) with
  | B_dData_dMaybe.C_Maybe_Just (dtb_u_u2345) -> dtb_u_u2345
  | B_dData_dMaybe.C_Maybe_Nothing -> (if (dtb_u_u2334 = "en") then (if dtb_u_u2328 then "human" else "short") else "human")
  | _ -> failwith "DT: impossible branch"
) in (let dtb_u_u2336 = { f_CliOpts_optDiagFormat = dtb_u_u2335; f_CliOpts_optDiagLang = dtb_u_u2334; f_CliOpts_optLangExplicit = (v_hasLangFlag args); f_CliOpts_optDenyWarnings = (v_hasDenyWarnings args); f_CliOpts_optShowWarnings = (if (v_hasDenyWarnings args) then true else (v_hasShowWarnings args)); f_CliOpts_optFormatExplicit = (v_hasFormatFlag args); f_CliOpts_optWarningsExplicit = (if (v_hasDenyWarnings args) then true else (v_hasShowWarnings args)); f_CliOpts_optDenyExplicit = (v_hasDenyWarnings args); f_CliOpts_optMaxErrors = (B_dData_dPair.v_secondOf dtb_u_u2331); f_CliOpts_optContinueOnError = (B_dData_dPair.v_secondOf dtb_u_u2333); f_CliOpts_optSarifItems = B_dData_dList.C_List_Nil; f_CliOpts_optRelease = (dtb_u_u2320 = "1"); f_CliOpts_optShowCascade = (v_hasShowCascade args); f_CliOpts_optWithSources = (v_hasWithSources args); f_CliOpts_optFailFast = (v_hasFailFast args); f_CliOpts_optTarget = "ocaml"; f_CliOpts_optWasmOpt = 3; f_CliOpts_optExplain = false } in (if (v_anyHelp (B_dData_dPair.v_firstOf dtb_u_u2333)) then ((Obj.magic ((v_helpFor nConsole) prog)) _u_ueffTok) else (let dtb_u_u2344 = ((((((((((((v_runCompilerCliFor1_u_udirect nFs) nConsole) nClock) nEnv) nProcess) nExit) nArgs) nTty) prog) (v_stripFailFast (v_stripWithSources (v_stripShowCascade (B_dData_dPair.v_firstOf dtb_u_u2333))))) dtb_u_u2336) _u_ueffTok) in ((Obj.magic (((((v_flushSarif nFs) nConsole) nEnv) (B_dData_dPair.v_firstOf dtb_u_u2344)) (B_dData_dPair.v_secondOf dtb_u_u2344))) _u_ueffTok))))))))))))))

# 69 "Vuna/Compiler/Driver/CompilerCli.vuna"
let v_runCompilerCli = (fun (dtb_u_u2346 : string) (dtb_u_u2347 : string) (dtb_u_u2348 : string) (dtb_u_u2349 : string) (dtb_u_u2350 : string) (dtb_u_u2351 : string) (dtb_u_u2352 : string) (dtb_u_u2353 : string) (dtb_u_u2363 : string B_dData_dList.t_List) -> ((((((((((v_runCompilerCliFor dtb_u_u2346) dtb_u_u2347) dtb_u_u2348) dtb_u_u2349) dtb_u_u2350) dtb_u_u2351) dtb_u_u2352) dtb_u_u2353) "vuna") dtb_u_u2363))

# 69 "Vuna/Compiler/Driver/CompilerCli.vuna"
let v_runCompilerCli_u_udirect = (fun (nFs : string) (nConsole : string) (nClock : string) (nEnv : string) (nProcess : string) (nExit : string) (nArgs : string) (nTty : string) (args : string B_dData_dList.t_List) _u_ueffTok -> ((Obj.magic ((((((((((v_runCompilerCliFor nFs) nConsole) nClock) nEnv) nProcess) nExit) nArgs) nTty) "vuna") args)) _u_ueffTok))

# 73 "Vuna/Compiler/Driver/CompilerCli.vuna"
let v_optDiagFormat = (fun (dtb_u_u2364 : t_CliOpts) -> (match dtb_u_u2364 with
  | { f_CliOpts_optDiagFormat = dtb_u_u2365; f_CliOpts_optDiagLang = dtb_u_u2366; f_CliOpts_optLangExplicit = dtb_u_u2367; f_CliOpts_optDenyWarnings = dtb_u_u2368; f_CliOpts_optShowWarnings = dtb_u_u2369; f_CliOpts_optFormatExplicit = dtb_u_u2370; f_CliOpts_optWarningsExplicit = dtb_u_u2371; f_CliOpts_optDenyExplicit = dtb_u_u2372; f_CliOpts_optMaxErrors = dtb_u_u2373; f_CliOpts_optContinueOnError = dtb_u_u2374; f_CliOpts_optSarifItems = dtb_u_u2375; f_CliOpts_optRelease = dtb_u_u2376; f_CliOpts_optShowCascade = dtb_u_u2377; f_CliOpts_optWithSources = dtb_u_u2378; f_CliOpts_optFailFast = dtb_u_u2379; f_CliOpts_optTarget = dtb_u_u2380; f_CliOpts_optWasmOpt = dtb_u_u2381; f_CliOpts_optExplain = dtb_u_u2382 } -> dtb_u_u2365
  | _ -> failwith "DT: impossible branch"
))

# 74 "Vuna/Compiler/Driver/CompilerCli.vuna"
let v_optDiagLang = (fun (dtb_u_u2383 : t_CliOpts) -> (match dtb_u_u2383 with
  | { f_CliOpts_optDiagFormat = dtb_u_u2384; f_CliOpts_optDiagLang = dtb_u_u2385; f_CliOpts_optLangExplicit = dtb_u_u2386; f_CliOpts_optDenyWarnings = dtb_u_u2387; f_CliOpts_optShowWarnings = dtb_u_u2388; f_CliOpts_optFormatExplicit = dtb_u_u2389; f_CliOpts_optWarningsExplicit = dtb_u_u2390; f_CliOpts_optDenyExplicit = dtb_u_u2391; f_CliOpts_optMaxErrors = dtb_u_u2392; f_CliOpts_optContinueOnError = dtb_u_u2393; f_CliOpts_optSarifItems = dtb_u_u2394; f_CliOpts_optRelease = dtb_u_u2395; f_CliOpts_optShowCascade = dtb_u_u2396; f_CliOpts_optWithSources = dtb_u_u2397; f_CliOpts_optFailFast = dtb_u_u2398; f_CliOpts_optTarget = dtb_u_u2399; f_CliOpts_optWasmOpt = dtb_u_u2400; f_CliOpts_optExplain = dtb_u_u2401 } -> dtb_u_u2385
  | _ -> failwith "DT: impossible branch"
))

# 75 "Vuna/Compiler/Driver/CompilerCli.vuna"
let v_optLangExplicit = (fun (dtb_u_u2402 : t_CliOpts) -> (match dtb_u_u2402 with
  | { f_CliOpts_optDiagFormat = dtb_u_u2403; f_CliOpts_optDiagLang = dtb_u_u2404; f_CliOpts_optLangExplicit = dtb_u_u2405; f_CliOpts_optDenyWarnings = dtb_u_u2406; f_CliOpts_optShowWarnings = dtb_u_u2407; f_CliOpts_optFormatExplicit = dtb_u_u2408; f_CliOpts_optWarningsExplicit = dtb_u_u2409; f_CliOpts_optDenyExplicit = dtb_u_u2410; f_CliOpts_optMaxErrors = dtb_u_u2411; f_CliOpts_optContinueOnError = dtb_u_u2412; f_CliOpts_optSarifItems = dtb_u_u2413; f_CliOpts_optRelease = dtb_u_u2414; f_CliOpts_optShowCascade = dtb_u_u2415; f_CliOpts_optWithSources = dtb_u_u2416; f_CliOpts_optFailFast = dtb_u_u2417; f_CliOpts_optTarget = dtb_u_u2418; f_CliOpts_optWasmOpt = dtb_u_u2419; f_CliOpts_optExplain = dtb_u_u2420 } -> dtb_u_u2405
  | _ -> failwith "DT: impossible branch"
))

# 76 "Vuna/Compiler/Driver/CompilerCli.vuna"
let v_optDenyWarnings = (fun (dtb_u_u2421 : t_CliOpts) -> (match dtb_u_u2421 with
  | { f_CliOpts_optDiagFormat = dtb_u_u2422; f_CliOpts_optDiagLang = dtb_u_u2423; f_CliOpts_optLangExplicit = dtb_u_u2424; f_CliOpts_optDenyWarnings = dtb_u_u2425; f_CliOpts_optShowWarnings = dtb_u_u2426; f_CliOpts_optFormatExplicit = dtb_u_u2427; f_CliOpts_optWarningsExplicit = dtb_u_u2428; f_CliOpts_optDenyExplicit = dtb_u_u2429; f_CliOpts_optMaxErrors = dtb_u_u2430; f_CliOpts_optContinueOnError = dtb_u_u2431; f_CliOpts_optSarifItems = dtb_u_u2432; f_CliOpts_optRelease = dtb_u_u2433; f_CliOpts_optShowCascade = dtb_u_u2434; f_CliOpts_optWithSources = dtb_u_u2435; f_CliOpts_optFailFast = dtb_u_u2436; f_CliOpts_optTarget = dtb_u_u2437; f_CliOpts_optWasmOpt = dtb_u_u2438; f_CliOpts_optExplain = dtb_u_u2439 } -> dtb_u_u2425
  | _ -> failwith "DT: impossible branch"
))

# 77 "Vuna/Compiler/Driver/CompilerCli.vuna"
let v_optShowWarnings = (fun (dtb_u_u2440 : t_CliOpts) -> (match dtb_u_u2440 with
  | { f_CliOpts_optDiagFormat = dtb_u_u2441; f_CliOpts_optDiagLang = dtb_u_u2442; f_CliOpts_optLangExplicit = dtb_u_u2443; f_CliOpts_optDenyWarnings = dtb_u_u2444; f_CliOpts_optShowWarnings = dtb_u_u2445; f_CliOpts_optFormatExplicit = dtb_u_u2446; f_CliOpts_optWarningsExplicit = dtb_u_u2447; f_CliOpts_optDenyExplicit = dtb_u_u2448; f_CliOpts_optMaxErrors = dtb_u_u2449; f_CliOpts_optContinueOnError = dtb_u_u2450; f_CliOpts_optSarifItems = dtb_u_u2451; f_CliOpts_optRelease = dtb_u_u2452; f_CliOpts_optShowCascade = dtb_u_u2453; f_CliOpts_optWithSources = dtb_u_u2454; f_CliOpts_optFailFast = dtb_u_u2455; f_CliOpts_optTarget = dtb_u_u2456; f_CliOpts_optWasmOpt = dtb_u_u2457; f_CliOpts_optExplain = dtb_u_u2458 } -> dtb_u_u2445
  | _ -> failwith "DT: impossible branch"
))

# 78 "Vuna/Compiler/Driver/CompilerCli.vuna"
let v_optFormatExplicit = (fun (dtb_u_u2459 : t_CliOpts) -> (match dtb_u_u2459 with
  | { f_CliOpts_optDiagFormat = dtb_u_u2460; f_CliOpts_optDiagLang = dtb_u_u2461; f_CliOpts_optLangExplicit = dtb_u_u2462; f_CliOpts_optDenyWarnings = dtb_u_u2463; f_CliOpts_optShowWarnings = dtb_u_u2464; f_CliOpts_optFormatExplicit = dtb_u_u2465; f_CliOpts_optWarningsExplicit = dtb_u_u2466; f_CliOpts_optDenyExplicit = dtb_u_u2467; f_CliOpts_optMaxErrors = dtb_u_u2468; f_CliOpts_optContinueOnError = dtb_u_u2469; f_CliOpts_optSarifItems = dtb_u_u2470; f_CliOpts_optRelease = dtb_u_u2471; f_CliOpts_optShowCascade = dtb_u_u2472; f_CliOpts_optWithSources = dtb_u_u2473; f_CliOpts_optFailFast = dtb_u_u2474; f_CliOpts_optTarget = dtb_u_u2475; f_CliOpts_optWasmOpt = dtb_u_u2476; f_CliOpts_optExplain = dtb_u_u2477 } -> dtb_u_u2465
  | _ -> failwith "DT: impossible branch"
))

# 79 "Vuna/Compiler/Driver/CompilerCli.vuna"
let v_optWarningsExplicit = (fun (dtb_u_u2478 : t_CliOpts) -> (match dtb_u_u2478 with
  | { f_CliOpts_optDiagFormat = dtb_u_u2479; f_CliOpts_optDiagLang = dtb_u_u2480; f_CliOpts_optLangExplicit = dtb_u_u2481; f_CliOpts_optDenyWarnings = dtb_u_u2482; f_CliOpts_optShowWarnings = dtb_u_u2483; f_CliOpts_optFormatExplicit = dtb_u_u2484; f_CliOpts_optWarningsExplicit = dtb_u_u2485; f_CliOpts_optDenyExplicit = dtb_u_u2486; f_CliOpts_optMaxErrors = dtb_u_u2487; f_CliOpts_optContinueOnError = dtb_u_u2488; f_CliOpts_optSarifItems = dtb_u_u2489; f_CliOpts_optRelease = dtb_u_u2490; f_CliOpts_optShowCascade = dtb_u_u2491; f_CliOpts_optWithSources = dtb_u_u2492; f_CliOpts_optFailFast = dtb_u_u2493; f_CliOpts_optTarget = dtb_u_u2494; f_CliOpts_optWasmOpt = dtb_u_u2495; f_CliOpts_optExplain = dtb_u_u2496 } -> dtb_u_u2485
  | _ -> failwith "DT: impossible branch"
))

# 80 "Vuna/Compiler/Driver/CompilerCli.vuna"
let v_optDenyExplicit = (fun (dtb_u_u2497 : t_CliOpts) -> (match dtb_u_u2497 with
  | { f_CliOpts_optDiagFormat = dtb_u_u2498; f_CliOpts_optDiagLang = dtb_u_u2499; f_CliOpts_optLangExplicit = dtb_u_u2500; f_CliOpts_optDenyWarnings = dtb_u_u2501; f_CliOpts_optShowWarnings = dtb_u_u2502; f_CliOpts_optFormatExplicit = dtb_u_u2503; f_CliOpts_optWarningsExplicit = dtb_u_u2504; f_CliOpts_optDenyExplicit = dtb_u_u2505; f_CliOpts_optMaxErrors = dtb_u_u2506; f_CliOpts_optContinueOnError = dtb_u_u2507; f_CliOpts_optSarifItems = dtb_u_u2508; f_CliOpts_optRelease = dtb_u_u2509; f_CliOpts_optShowCascade = dtb_u_u2510; f_CliOpts_optWithSources = dtb_u_u2511; f_CliOpts_optFailFast = dtb_u_u2512; f_CliOpts_optTarget = dtb_u_u2513; f_CliOpts_optWasmOpt = dtb_u_u2514; f_CliOpts_optExplain = dtb_u_u2515 } -> dtb_u_u2505
  | _ -> failwith "DT: impossible branch"
))

# 81 "Vuna/Compiler/Driver/CompilerCli.vuna"
let v_optMaxErrors = (fun (dtb_u_u2516 : t_CliOpts) -> (match dtb_u_u2516 with
  | { f_CliOpts_optDiagFormat = dtb_u_u2517; f_CliOpts_optDiagLang = dtb_u_u2518; f_CliOpts_optLangExplicit = dtb_u_u2519; f_CliOpts_optDenyWarnings = dtb_u_u2520; f_CliOpts_optShowWarnings = dtb_u_u2521; f_CliOpts_optFormatExplicit = dtb_u_u2522; f_CliOpts_optWarningsExplicit = dtb_u_u2523; f_CliOpts_optDenyExplicit = dtb_u_u2524; f_CliOpts_optMaxErrors = dtb_u_u2525; f_CliOpts_optContinueOnError = dtb_u_u2526; f_CliOpts_optSarifItems = dtb_u_u2527; f_CliOpts_optRelease = dtb_u_u2528; f_CliOpts_optShowCascade = dtb_u_u2529; f_CliOpts_optWithSources = dtb_u_u2530; f_CliOpts_optFailFast = dtb_u_u2531; f_CliOpts_optTarget = dtb_u_u2532; f_CliOpts_optWasmOpt = dtb_u_u2533; f_CliOpts_optExplain = dtb_u_u2534 } -> dtb_u_u2525
  | _ -> failwith "DT: impossible branch"
))

# 82 "Vuna/Compiler/Driver/CompilerCli.vuna"
let v_optContinueOnError = (fun (dtb_u_u2535 : t_CliOpts) -> (match dtb_u_u2535 with
  | { f_CliOpts_optDiagFormat = dtb_u_u2536; f_CliOpts_optDiagLang = dtb_u_u2537; f_CliOpts_optLangExplicit = dtb_u_u2538; f_CliOpts_optDenyWarnings = dtb_u_u2539; f_CliOpts_optShowWarnings = dtb_u_u2540; f_CliOpts_optFormatExplicit = dtb_u_u2541; f_CliOpts_optWarningsExplicit = dtb_u_u2542; f_CliOpts_optDenyExplicit = dtb_u_u2543; f_CliOpts_optMaxErrors = dtb_u_u2544; f_CliOpts_optContinueOnError = dtb_u_u2545; f_CliOpts_optSarifItems = dtb_u_u2546; f_CliOpts_optRelease = dtb_u_u2547; f_CliOpts_optShowCascade = dtb_u_u2548; f_CliOpts_optWithSources = dtb_u_u2549; f_CliOpts_optFailFast = dtb_u_u2550; f_CliOpts_optTarget = dtb_u_u2551; f_CliOpts_optWasmOpt = dtb_u_u2552; f_CliOpts_optExplain = dtb_u_u2553 } -> dtb_u_u2545
  | _ -> failwith "DT: impossible branch"
))

# 83 "Vuna/Compiler/Driver/CompilerCli.vuna"
let v_optSarifItems = (fun (dtb_u_u2554 : t_CliOpts) -> (match dtb_u_u2554 with
  | { f_CliOpts_optDiagFormat = dtb_u_u2555; f_CliOpts_optDiagLang = dtb_u_u2556; f_CliOpts_optLangExplicit = dtb_u_u2557; f_CliOpts_optDenyWarnings = dtb_u_u2558; f_CliOpts_optShowWarnings = dtb_u_u2559; f_CliOpts_optFormatExplicit = dtb_u_u2560; f_CliOpts_optWarningsExplicit = dtb_u_u2561; f_CliOpts_optDenyExplicit = dtb_u_u2562; f_CliOpts_optMaxErrors = dtb_u_u2563; f_CliOpts_optContinueOnError = dtb_u_u2564; f_CliOpts_optSarifItems = dtb_u_u2565; f_CliOpts_optRelease = dtb_u_u2566; f_CliOpts_optShowCascade = dtb_u_u2567; f_CliOpts_optWithSources = dtb_u_u2568; f_CliOpts_optFailFast = dtb_u_u2569; f_CliOpts_optTarget = dtb_u_u2570; f_CliOpts_optWasmOpt = dtb_u_u2571; f_CliOpts_optExplain = dtb_u_u2572 } -> dtb_u_u2565
  | _ -> failwith "DT: impossible branch"
))

# 84 "Vuna/Compiler/Driver/CompilerCli.vuna"
let v_optRelease = (fun (dtb_u_u2573 : t_CliOpts) -> (match dtb_u_u2573 with
  | { f_CliOpts_optDiagFormat = dtb_u_u2574; f_CliOpts_optDiagLang = dtb_u_u2575; f_CliOpts_optLangExplicit = dtb_u_u2576; f_CliOpts_optDenyWarnings = dtb_u_u2577; f_CliOpts_optShowWarnings = dtb_u_u2578; f_CliOpts_optFormatExplicit = dtb_u_u2579; f_CliOpts_optWarningsExplicit = dtb_u_u2580; f_CliOpts_optDenyExplicit = dtb_u_u2581; f_CliOpts_optMaxErrors = dtb_u_u2582; f_CliOpts_optContinueOnError = dtb_u_u2583; f_CliOpts_optSarifItems = dtb_u_u2584; f_CliOpts_optRelease = dtb_u_u2585; f_CliOpts_optShowCascade = dtb_u_u2586; f_CliOpts_optWithSources = dtb_u_u2587; f_CliOpts_optFailFast = dtb_u_u2588; f_CliOpts_optTarget = dtb_u_u2589; f_CliOpts_optWasmOpt = dtb_u_u2590; f_CliOpts_optExplain = dtb_u_u2591 } -> dtb_u_u2585
  | _ -> failwith "DT: impossible branch"
))

# 85 "Vuna/Compiler/Driver/CompilerCli.vuna"
let v_optShowCascade = (fun (dtb_u_u2592 : t_CliOpts) -> (match dtb_u_u2592 with
  | { f_CliOpts_optDiagFormat = dtb_u_u2593; f_CliOpts_optDiagLang = dtb_u_u2594; f_CliOpts_optLangExplicit = dtb_u_u2595; f_CliOpts_optDenyWarnings = dtb_u_u2596; f_CliOpts_optShowWarnings = dtb_u_u2597; f_CliOpts_optFormatExplicit = dtb_u_u2598; f_CliOpts_optWarningsExplicit = dtb_u_u2599; f_CliOpts_optDenyExplicit = dtb_u_u2600; f_CliOpts_optMaxErrors = dtb_u_u2601; f_CliOpts_optContinueOnError = dtb_u_u2602; f_CliOpts_optSarifItems = dtb_u_u2603; f_CliOpts_optRelease = dtb_u_u2604; f_CliOpts_optShowCascade = dtb_u_u2605; f_CliOpts_optWithSources = dtb_u_u2606; f_CliOpts_optFailFast = dtb_u_u2607; f_CliOpts_optTarget = dtb_u_u2608; f_CliOpts_optWasmOpt = dtb_u_u2609; f_CliOpts_optExplain = dtb_u_u2610 } -> dtb_u_u2605
  | _ -> failwith "DT: impossible branch"
))

# 86 "Vuna/Compiler/Driver/CompilerCli.vuna"
let v_optWithSources = (fun (dtb_u_u2611 : t_CliOpts) -> (match dtb_u_u2611 with
  | { f_CliOpts_optDiagFormat = dtb_u_u2612; f_CliOpts_optDiagLang = dtb_u_u2613; f_CliOpts_optLangExplicit = dtb_u_u2614; f_CliOpts_optDenyWarnings = dtb_u_u2615; f_CliOpts_optShowWarnings = dtb_u_u2616; f_CliOpts_optFormatExplicit = dtb_u_u2617; f_CliOpts_optWarningsExplicit = dtb_u_u2618; f_CliOpts_optDenyExplicit = dtb_u_u2619; f_CliOpts_optMaxErrors = dtb_u_u2620; f_CliOpts_optContinueOnError = dtb_u_u2621; f_CliOpts_optSarifItems = dtb_u_u2622; f_CliOpts_optRelease = dtb_u_u2623; f_CliOpts_optShowCascade = dtb_u_u2624; f_CliOpts_optWithSources = dtb_u_u2625; f_CliOpts_optFailFast = dtb_u_u2626; f_CliOpts_optTarget = dtb_u_u2627; f_CliOpts_optWasmOpt = dtb_u_u2628; f_CliOpts_optExplain = dtb_u_u2629 } -> dtb_u_u2625
  | _ -> failwith "DT: impossible branch"
))

# 87 "Vuna/Compiler/Driver/CompilerCli.vuna"
let v_optFailFast = (fun (dtb_u_u2630 : t_CliOpts) -> (match dtb_u_u2630 with
  | { f_CliOpts_optDiagFormat = dtb_u_u2631; f_CliOpts_optDiagLang = dtb_u_u2632; f_CliOpts_optLangExplicit = dtb_u_u2633; f_CliOpts_optDenyWarnings = dtb_u_u2634; f_CliOpts_optShowWarnings = dtb_u_u2635; f_CliOpts_optFormatExplicit = dtb_u_u2636; f_CliOpts_optWarningsExplicit = dtb_u_u2637; f_CliOpts_optDenyExplicit = dtb_u_u2638; f_CliOpts_optMaxErrors = dtb_u_u2639; f_CliOpts_optContinueOnError = dtb_u_u2640; f_CliOpts_optSarifItems = dtb_u_u2641; f_CliOpts_optRelease = dtb_u_u2642; f_CliOpts_optShowCascade = dtb_u_u2643; f_CliOpts_optWithSources = dtb_u_u2644; f_CliOpts_optFailFast = dtb_u_u2645; f_CliOpts_optTarget = dtb_u_u2646; f_CliOpts_optWasmOpt = dtb_u_u2647; f_CliOpts_optExplain = dtb_u_u2648 } -> dtb_u_u2645
  | _ -> failwith "DT: impossible branch"
))

# 88 "Vuna/Compiler/Driver/CompilerCli.vuna"
let v_optTarget = (fun (dtb_u_u2649 : t_CliOpts) -> (match dtb_u_u2649 with
  | { f_CliOpts_optDiagFormat = dtb_u_u2650; f_CliOpts_optDiagLang = dtb_u_u2651; f_CliOpts_optLangExplicit = dtb_u_u2652; f_CliOpts_optDenyWarnings = dtb_u_u2653; f_CliOpts_optShowWarnings = dtb_u_u2654; f_CliOpts_optFormatExplicit = dtb_u_u2655; f_CliOpts_optWarningsExplicit = dtb_u_u2656; f_CliOpts_optDenyExplicit = dtb_u_u2657; f_CliOpts_optMaxErrors = dtb_u_u2658; f_CliOpts_optContinueOnError = dtb_u_u2659; f_CliOpts_optSarifItems = dtb_u_u2660; f_CliOpts_optRelease = dtb_u_u2661; f_CliOpts_optShowCascade = dtb_u_u2662; f_CliOpts_optWithSources = dtb_u_u2663; f_CliOpts_optFailFast = dtb_u_u2664; f_CliOpts_optTarget = dtb_u_u2665; f_CliOpts_optWasmOpt = dtb_u_u2666; f_CliOpts_optExplain = dtb_u_u2667 } -> dtb_u_u2665
  | _ -> failwith "DT: impossible branch"
))

# 89 "Vuna/Compiler/Driver/CompilerCli.vuna"
let v_optWasmOpt = (fun (dtb_u_u2668 : t_CliOpts) -> (match dtb_u_u2668 with
  | { f_CliOpts_optDiagFormat = dtb_u_u2669; f_CliOpts_optDiagLang = dtb_u_u2670; f_CliOpts_optLangExplicit = dtb_u_u2671; f_CliOpts_optDenyWarnings = dtb_u_u2672; f_CliOpts_optShowWarnings = dtb_u_u2673; f_CliOpts_optFormatExplicit = dtb_u_u2674; f_CliOpts_optWarningsExplicit = dtb_u_u2675; f_CliOpts_optDenyExplicit = dtb_u_u2676; f_CliOpts_optMaxErrors = dtb_u_u2677; f_CliOpts_optContinueOnError = dtb_u_u2678; f_CliOpts_optSarifItems = dtb_u_u2679; f_CliOpts_optRelease = dtb_u_u2680; f_CliOpts_optShowCascade = dtb_u_u2681; f_CliOpts_optWithSources = dtb_u_u2682; f_CliOpts_optFailFast = dtb_u_u2683; f_CliOpts_optTarget = dtb_u_u2684; f_CliOpts_optWasmOpt = dtb_u_u2685; f_CliOpts_optExplain = dtb_u_u2686 } -> dtb_u_u2685
  | _ -> failwith "DT: impossible branch"
))

# 90 "Vuna/Compiler/Driver/CompilerCli.vuna"
let v_optExplain = (fun (dtb_u_u2687 : t_CliOpts) -> (match dtb_u_u2687 with
  | { f_CliOpts_optDiagFormat = dtb_u_u2688; f_CliOpts_optDiagLang = dtb_u_u2689; f_CliOpts_optLangExplicit = dtb_u_u2690; f_CliOpts_optDenyWarnings = dtb_u_u2691; f_CliOpts_optShowWarnings = dtb_u_u2692; f_CliOpts_optFormatExplicit = dtb_u_u2693; f_CliOpts_optWarningsExplicit = dtb_u_u2694; f_CliOpts_optDenyExplicit = dtb_u_u2695; f_CliOpts_optMaxErrors = dtb_u_u2696; f_CliOpts_optContinueOnError = dtb_u_u2697; f_CliOpts_optSarifItems = dtb_u_u2698; f_CliOpts_optRelease = dtb_u_u2699; f_CliOpts_optShowCascade = dtb_u_u2700; f_CliOpts_optWithSources = dtb_u_u2701; f_CliOpts_optFailFast = dtb_u_u2702; f_CliOpts_optTarget = dtb_u_u2703; f_CliOpts_optWasmOpt = dtb_u_u2704; f_CliOpts_optExplain = dtb_u_u2705 } -> dtb_u_u2705
  | _ -> failwith "DT: impossible branch"
))
