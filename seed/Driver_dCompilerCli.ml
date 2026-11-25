open Vuna_runtime
type t_CliOpts = { f_CliOpts_optDiagFormat : string; f_CliOpts_optDiagLang : string; f_CliOpts_optLangExplicit : bool; f_CliOpts_optDenyWarnings : bool; f_CliOpts_optShowWarnings : bool; f_CliOpts_optFormatExplicit : bool; f_CliOpts_optWarningsExplicit : bool; f_CliOpts_optDenyExplicit : bool; f_CliOpts_optMaxErrors : int; f_CliOpts_optContinueOnError : bool; f_CliOpts_optSarifItems : Base_dDiag.t_Diagnostic B_dData_dList.t_List; f_CliOpts_optRelease : bool; f_CliOpts_optShowCascade : bool; f_CliOpts_optWithSources : bool; f_CliOpts_optFailFast : bool; f_CliOpts_optTarget : string; f_CliOpts_optWasmOpt : int }

# 43 "Vuna/Compiler/Driver/CompilerCli.vuna"
let v_compilerUsageLines = (fun (prog : string) -> (String.concat "" ["  "; prog; " compile [--no-print] [--release] [--target ocaml|wasm|native] (<entry.vuna> | <package-dir>) <out-dir>\n  "; prog; " check [--release] [--continue-on-error] (<file.vuna> | <package-dir>)\n  <file.vuna>            \229\184\166 module \229\164\180\230\151\182\230\140\137\229\186\147\230\168\161\229\157\151\230\163\128\230\159\165\239\188\136\229\140\133\228\184\138\228\184\139\230\150\135\239\188\137\239\188\140\229\144\166\229\136\153\230\140\137\229\133\165\229\143\163\230\150\135\228\187\182\n  "; prog; " build [--release] [--no-compile] [--out DIR] [--package NAME] [--target ocaml|wasm|native] [--wasm-opt N] [DIR]\n  --no-print             \231\188\150\232\175\145\231\148\159\230\136\144\231\154\132\231\168\139\229\186\143\228\184\141\230\137\147\229\141\176 main \231\187\147\230\158\156\239\188\136\233\187\152\232\174\164\230\137\147\229\141\176\239\188\137\n  --release              \229\143\145\229\184\131\230\158\132\229\187\186\239\188\154\230\139\146\231\187\157 assert / todo \231\173\137\232\176\131\232\175\149\228\184\147\231\148\168\230\158\132\233\128\160\n  --wasm-opt N           wasm \228\186\167\231\137\169\231\154\132 binaryen \228\188\152\229\140\150\231\186\167\229\136\171\239\188\1360\226\128\1473\239\188\140\233\187\152\232\174\164 3\239\188\1550 = \228\184\141\228\188\152\229\140\150\239\188\137\n  --continue-on-error    \229\164\154\233\148\153\232\175\175\239\188\154\233\128\144\228\184\170\229\174\154\228\185\137\230\148\182\233\155\134\239\188\136\229\164\177\232\180\165\229\174\154\228\185\137\229\155\158\230\187\154\229\144\142\232\183\179\232\191\135\239\188\155\228\187\133\229\133\165\229\143\163\230\150\135\228\187\182\230\136\150\229\186\147\229\140\133\239\188\137\n  "; prog; " version, --version  \230\152\190\231\164\186\231\137\136\230\156\172\n  "; prog; " help, -h\n"]))

# 56 "Vuna/Compiler/Driver/CompilerCli.vuna"
let v_compilerUsage = (fun (prog : string) -> ("usage:\n" ^ (v_compilerUsageLines prog)))

# 60 "Vuna/Compiler/Driver/CompilerCli.vuna"
let rec v_mapEff = (fun mc0 mc1 -> (match mc1 with
  | B_dData_dList.C_List__x58__x58_ (dtb__0, dtb__1) -> (((B_dTrait_dMonad.v__x62__x62__x61_ B_dEffect_dCore.v_Monad_ucc99eea03f4e7df1_uBase_x36_46_x36_Effect_x36_46_x36_Core_x36_46_x36_Eff_ur) (mc0 dtb__0)) (fun y -> (((B_dTrait_dMonad.v__x62__x62__x61_ B_dEffect_dCore.v_Monad_ucc99eea03f4e7df1_uBase_x36_46_x36_Effect_x36_46_x36_Core_x36_46_x36_Eff_ur) ((v_mapEff mc0) dtb__1)) (fun ys -> ((B_dTrait_dApplicative.v_pure B_dEffect_dCore.v_Applicative_u19070277251d295b_uBase_x36_46_x36_Effect_x36_46_x36_Core_x36_46_x36_Eff_ur) (B_dData_dList.C_List__x58__x58_ (y, ys)))))))
  | B_dData_dList.C_List_Nil -> ((B_dTrait_dApplicative.v_pure B_dEffect_dCore.v_Applicative_u19070277251d295b_uBase_x36_46_x36_Effect_x36_46_x36_Core_x36_46_x36_Eff_ur) B_dData_dList.C_List_Nil)
  | _ -> failwith "DT: impossible branch"
))

# 92 "Vuna/Compiler/Driver/CompilerCli.vuna"
let v_defaultCliOpts = { f_CliOpts_optDiagFormat = "short"; f_CliOpts_optDiagLang = "en"; f_CliOpts_optLangExplicit = false; f_CliOpts_optDenyWarnings = false; f_CliOpts_optShowWarnings = false; f_CliOpts_optFormatExplicit = false; f_CliOpts_optWarningsExplicit = false; f_CliOpts_optDenyExplicit = false; f_CliOpts_optMaxErrors = 20; f_CliOpts_optContinueOnError = false; f_CliOpts_optSarifItems = B_dData_dList.C_List_Nil; f_CliOpts_optRelease = false; f_CliOpts_optShowCascade = false; f_CliOpts_optWithSources = false; f_CliOpts_optFailFast = false; f_CliOpts_optTarget = "ocaml"; f_CliOpts_optWasmOpt = 3 }

# 114 "Vuna/Compiler/Driver/CompilerCli.vuna"
let v_markRelease = (fun (o : t_CliOpts) -> { o with f_CliOpts_optRelease = true })

# 118 "Vuna/Compiler/Driver/CompilerCli.vuna"
let v_markWasmOpt = (fun (n : int) (o : t_CliOpts) -> { o with f_CliOpts_optWasmOpt = n })

# 122 "Vuna/Compiler/Driver/CompilerCli.vuna"
let v_markTarget = (fun (t : string) (o : t_CliOpts) -> { f_CliOpts_optDiagFormat = (o).f_CliOpts_optDiagFormat; f_CliOpts_optDiagLang = (o).f_CliOpts_optDiagLang; f_CliOpts_optLangExplicit = (o).f_CliOpts_optLangExplicit; f_CliOpts_optDenyWarnings = (o).f_CliOpts_optDenyWarnings; f_CliOpts_optShowWarnings = (o).f_CliOpts_optShowWarnings; f_CliOpts_optFormatExplicit = (o).f_CliOpts_optFormatExplicit; f_CliOpts_optWarningsExplicit = (o).f_CliOpts_optWarningsExplicit; f_CliOpts_optDenyExplicit = (o).f_CliOpts_optDenyExplicit; f_CliOpts_optMaxErrors = (o).f_CliOpts_optMaxErrors; f_CliOpts_optContinueOnError = (o).f_CliOpts_optContinueOnError; f_CliOpts_optSarifItems = (o).f_CliOpts_optSarifItems; f_CliOpts_optRelease = (o).f_CliOpts_optRelease; f_CliOpts_optShowCascade = (o).f_CliOpts_optShowCascade; f_CliOpts_optWithSources = (o).f_CliOpts_optWithSources; f_CliOpts_optFailFast = (o).f_CliOpts_optFailFast; f_CliOpts_optTarget = t; f_CliOpts_optWasmOpt = (o).f_CliOpts_optWasmOpt })

# 145 "Vuna/Compiler/Driver/CompilerCli.vuna"
let v_markFormatExplicit = (fun (o : t_CliOpts) -> { f_CliOpts_optDiagFormat = (o).f_CliOpts_optDiagFormat; f_CliOpts_optDiagLang = (o).f_CliOpts_optDiagLang; f_CliOpts_optLangExplicit = (o).f_CliOpts_optLangExplicit; f_CliOpts_optDenyWarnings = (o).f_CliOpts_optDenyWarnings; f_CliOpts_optShowWarnings = (o).f_CliOpts_optShowWarnings; f_CliOpts_optFormatExplicit = true; f_CliOpts_optWarningsExplicit = (o).f_CliOpts_optWarningsExplicit; f_CliOpts_optDenyExplicit = (o).f_CliOpts_optDenyExplicit; f_CliOpts_optMaxErrors = (o).f_CliOpts_optMaxErrors; f_CliOpts_optContinueOnError = (o).f_CliOpts_optContinueOnError; f_CliOpts_optSarifItems = (o).f_CliOpts_optSarifItems; f_CliOpts_optRelease = (o).f_CliOpts_optRelease; f_CliOpts_optShowCascade = (o).f_CliOpts_optShowCascade; f_CliOpts_optWithSources = (o).f_CliOpts_optWithSources; f_CliOpts_optFailFast = (o).f_CliOpts_optFailFast; f_CliOpts_optTarget = (o).f_CliOpts_optTarget; f_CliOpts_optWasmOpt = (o).f_CliOpts_optWasmOpt })

# 167 "Vuna/Compiler/Driver/CompilerCli.vuna"
let v_withOpts = (fun (o : t_CliOpts) (m : int B_dEffect_dCore.t_Eff) -> (((B_dTrait_dMonad.v__x62__x62__x61_ B_dEffect_dCore.v_Monad_ucc99eea03f4e7df1_uBase_x36_46_x36_Effect_x36_46_x36_Core_x36_46_x36_Eff_ur) m) (fun code -> ((B_dTrait_dApplicative.v_pure B_dEffect_dCore.v_Applicative_u19070277251d295b_uBase_x36_46_x36_Effect_x36_46_x36_Core_x36_46_x36_Eff_ur) { B_dData_dPair.f_Pair_first = code; B_dData_dPair.f_Pair_second = o }))))

# 173 "Vuna/Compiler/Driver/CompilerCli.vuna"
let v_diagExitFor = (fun (d : Base_dDiag.t_Diagnostic) -> (if (d).Base_dDiag.f_Diagnostic_diagInternal then 70 else (match (d).Base_dDiag.f_Diagnostic_diagSeverity with
  | Base_dDiag.C_Severity_SevError -> 1
  | _ -> 0
)))

# 209 "Vuna/Compiler/Driver/CompilerCli.vuna"
let v_applyManifestOpts = (fun (mc0 : Frontend_dPackages_dPkg.t_Package B_dData_dMaybe.t_Maybe) (mc1 : t_CliOpts) -> (match mc0 with
  | B_dData_dMaybe.C_Maybe_Just (dtb__2) -> (let man = (dtb__2).Frontend_dPackages_dPkg.f_Package_packageManifest in (let fmt0 = (match (man).Frontend_dManifest.f_Manifest_manifestDiagFormat with
  | B_dData_dMaybe.C_Maybe_Just (dtb__7) -> dtb__7
  | B_dData_dMaybe.C_Maybe_Nothing -> (mc1).f_CliOpts_optDiagFormat
  | _ -> failwith "DT: impossible branch"
) in (let lang = (if (mc1).f_CliOpts_optLangExplicit then (mc1).f_CliOpts_optDiagLang else (match (man).Frontend_dManifest.f_Manifest_manifestDiagLang with
  | B_dData_dMaybe.C_Maybe_Just (dtb__6) -> dtb__6
  | B_dData_dMaybe.C_Maybe_Nothing -> (mc1).f_CliOpts_optDiagLang
  | _ -> failwith "DT: impossible branch"
)) in (let fmt = (if (mc1).f_CliOpts_optFormatExplicit then (mc1).f_CliOpts_optDiagFormat else (if (lang = "en") then fmt0 else (if (((B_dTrait_dEq.v__x61__x61_ (B_dData_dMaybe.v_Eq_u018fc178ff3df1b4_uBase_x36_46_x36_Data_x36_46_x36_Maybe_x36_46_x36_Maybe_ua B_dData_dString.v_Eq_u018fc178ff3df1b4_uString)) (man).Frontend_dManifest.f_Manifest_manifestDiagFormat) B_dData_dMaybe.C_Maybe_Nothing) then "human" else fmt0))) in (let showW = (if (mc1).f_CliOpts_optWarningsExplicit then (mc1).f_CliOpts_optShowWarnings else (match (man).Frontend_dManifest.f_Manifest_manifestDiagWarnings with
  | B_dData_dMaybe.C_Maybe_Just (dtb__5) -> dtb__5
  | B_dData_dMaybe.C_Maybe_Nothing -> (mc1).f_CliOpts_optShowWarnings
  | _ -> failwith "DT: impossible branch"
)) in (let deny = (if (mc1).f_CliOpts_optDenyExplicit then (mc1).f_CliOpts_optDenyWarnings else (match (man).Frontend_dManifest.f_Manifest_manifestDiagDenyWarnings with
  | B_dData_dMaybe.C_Maybe_Just (dtb__4) -> dtb__4
  | B_dData_dMaybe.C_Maybe_Nothing -> (mc1).f_CliOpts_optDenyWarnings
  | _ -> failwith "DT: impossible branch"
)) in (let showW2 = (if deny then true else showW) in (let maxE = (match (man).Frontend_dManifest.f_Manifest_manifestDiagMaxErrors with
  | B_dData_dMaybe.C_Maybe_Just (dtb__3) -> dtb__3
  | B_dData_dMaybe.C_Maybe_Nothing -> (mc1).f_CliOpts_optMaxErrors
  | _ -> failwith "DT: impossible branch"
) in { f_CliOpts_optDiagFormat = fmt; f_CliOpts_optDiagLang = lang; f_CliOpts_optLangExplicit = (mc1).f_CliOpts_optLangExplicit; f_CliOpts_optDenyWarnings = deny; f_CliOpts_optShowWarnings = showW2; f_CliOpts_optFormatExplicit = (mc1).f_CliOpts_optFormatExplicit; f_CliOpts_optWarningsExplicit = (mc1).f_CliOpts_optWarningsExplicit; f_CliOpts_optDenyExplicit = (mc1).f_CliOpts_optDenyExplicit; f_CliOpts_optMaxErrors = maxE; f_CliOpts_optContinueOnError = (mc1).f_CliOpts_optContinueOnError; f_CliOpts_optSarifItems = (mc1).f_CliOpts_optSarifItems; f_CliOpts_optRelease = (mc1).f_CliOpts_optRelease; f_CliOpts_optShowCascade = (mc1).f_CliOpts_optShowCascade; f_CliOpts_optWithSources = (mc1).f_CliOpts_optWithSources; f_CliOpts_optFailFast = (mc1).f_CliOpts_optFailFast; f_CliOpts_optTarget = (mc1).f_CliOpts_optTarget; f_CliOpts_optWasmOpt = (mc1).f_CliOpts_optWasmOpt }))))))))
  | B_dData_dMaybe.C_Maybe_Nothing -> mc1
  | _ -> failwith "DT: impossible branch"
))

# 206 "Vuna/Compiler/Driver/CompilerCli.vuna"
let v_applyDiagConfig = (fun (m : Frontend_dPackages_dPkg.t_Package B_dData_dMaybe.t_Maybe) (o : t_CliOpts) -> ((v_applyManifestOpts m) o))

# 270 "Vuna/Compiler/Driver/CompilerCli.vuna"
let v_maxErrorsOf = (fun (o : t_CliOpts) -> (if (o).f_CliOpts_optFailFast then 1 else (o).f_CliOpts_optMaxErrors))

# 278 "Vuna/Compiler/Driver/CompilerCli.vuna"
let rec v_takeDiagsGo = (fun (mc0 : int) (mc1 : Base_dDiag.t_Diagnostic B_dData_dList.t_List) -> (match mc1 with
  | B_dData_dList.C_List__x58__x58_ (dtb__8, dtb__9) -> (if (mc0 <= 0) then B_dData_dList.C_List_Nil else (B_dData_dList.C_List__x58__x58_ (dtb__8, ((v_takeDiagsGo (mc0 - 1)) dtb__9))))
  | B_dData_dList.C_List_Nil -> B_dData_dList.C_List_Nil
  | _ -> failwith "DT: impossible branch"
))

# 274 "Vuna/Compiler/Driver/CompilerCli.vuna"
let v_takeDiags = (fun (n : int) (ds : Base_dDiag.t_Diagnostic B_dData_dList.t_List) -> (if (n <= 0) then ds else ((v_takeDiagsGo n) ds)))

# 283 "Vuna/Compiler/Driver/CompilerCli.vuna"
let rec v_stripDenyWarnings = (fun (mc0 : string B_dData_dList.t_List) -> (match mc0 with
  | B_dData_dList.C_List__x58__x58_ (dtb__10, dtb__11) -> (if (if (if (dtb__10 = "--deny-warnings") then true else (dtb__10 = "--warnings")) then true else (dtb__10 = "-W")) then (v_stripDenyWarnings dtb__11) else (B_dData_dList.C_List__x58__x58_ (dtb__10, (v_stripDenyWarnings dtb__11))))
  | B_dData_dList.C_List_Nil -> B_dData_dList.C_List_Nil
  | _ -> failwith "DT: impossible branch"
))

# 292 "Vuna/Compiler/Driver/CompilerCli.vuna"
let rec v_hasDenyWarnings = (fun (mc0 : string B_dData_dList.t_List) -> (match mc0 with
  | B_dData_dList.C_List__x58__x58_ (dtb__12, dtb__13) -> (if (dtb__12 = "--deny-warnings") then true else (v_hasDenyWarnings dtb__13))
  | B_dData_dList.C_List_Nil -> false
  | _ -> failwith "DT: impossible branch"
))

# 297 "Vuna/Compiler/Driver/CompilerCli.vuna"
let rec v_hasShowCascade = (fun (mc0 : string B_dData_dList.t_List) -> (match mc0 with
  | B_dData_dList.C_List__x58__x58_ (dtb__14, dtb__15) -> (if (dtb__14 = "--show-cascade") then true else (v_hasShowCascade dtb__15))
  | B_dData_dList.C_List_Nil -> false
  | _ -> failwith "DT: impossible branch"
))

# 301 "Vuna/Compiler/Driver/CompilerCli.vuna"
let rec v_stripShowCascade = (fun (mc0 : string B_dData_dList.t_List) -> (match mc0 with
  | B_dData_dList.C_List__x58__x58_ (dtb__16, dtb__17) -> (if (dtb__16 = "--show-cascade") then (v_stripShowCascade dtb__17) else (B_dData_dList.C_List__x58__x58_ (dtb__16, (v_stripShowCascade dtb__17))))
  | B_dData_dList.C_List_Nil -> B_dData_dList.C_List_Nil
  | _ -> failwith "DT: impossible branch"
))

# 306 "Vuna/Compiler/Driver/CompilerCli.vuna"
let rec v_hasWithSources = (fun (mc0 : string B_dData_dList.t_List) -> (match mc0 with
  | B_dData_dList.C_List__x58__x58_ (dtb__18, dtb__19) -> (if (dtb__18 = "--with-sources") then true else (v_hasWithSources dtb__19))
  | B_dData_dList.C_List_Nil -> false
  | _ -> failwith "DT: impossible branch"
))

# 310 "Vuna/Compiler/Driver/CompilerCli.vuna"
let rec v_hasFailFast = (fun (mc0 : string B_dData_dList.t_List) -> (match mc0 with
  | B_dData_dList.C_List__x58__x58_ (dtb__20, dtb__21) -> (if (dtb__20 = "--fail-fast") then true else (v_hasFailFast dtb__21))
  | B_dData_dList.C_List_Nil -> false
  | _ -> failwith "DT: impossible branch"
))

# 314 "Vuna/Compiler/Driver/CompilerCli.vuna"
let rec v_stripFailFast = (fun (mc0 : string B_dData_dList.t_List) -> (match mc0 with
  | B_dData_dList.C_List__x58__x58_ (dtb__22, dtb__23) -> (if (dtb__22 = "--fail-fast") then (v_stripFailFast dtb__23) else (B_dData_dList.C_List__x58__x58_ (dtb__22, (v_stripFailFast dtb__23))))
  | B_dData_dList.C_List_Nil -> B_dData_dList.C_List_Nil
  | _ -> failwith "DT: impossible branch"
))

# 319 "Vuna/Compiler/Driver/CompilerCli.vuna"
let rec v_stripWithSources = (fun (mc0 : string B_dData_dList.t_List) -> (match mc0 with
  | B_dData_dList.C_List__x58__x58_ (dtb__24, dtb__25) -> (if (dtb__24 = "--with-sources") then (v_stripWithSources dtb__25) else (B_dData_dList.C_List__x58__x58_ (dtb__24, (v_stripWithSources dtb__25))))
  | B_dData_dList.C_List_Nil -> B_dData_dList.C_List_Nil
  | _ -> failwith "DT: impossible branch"
))

# 338 "Vuna/Compiler/Driver/CompilerCli.vuna"
let rec v_memStr = (fun (mc0 : string) (mc1 : string B_dData_dList.t_List) -> (match mc1 with
  | B_dData_dList.C_List__x58__x58_ (dtb__26, dtb__27) -> (if (mc0 = dtb__26) then true else ((v_memStr mc0) dtb__27))
  | B_dData_dList.C_List_Nil -> false
  | _ -> failwith "DT: impossible branch"
))

# 329 "Vuna/Compiler/Driver/CompilerCli.vuna"
let rec v_labelFiles = (fun (mc0 : Base_dDiag.t_Label B_dData_dList.t_List) (mc1 : string B_dData_dList.t_List) -> (match mc0 with
  | B_dData_dList.C_List__x58__x58_ (dtb__28, dtb__29) -> ((v_labelFiles dtb__29) (match (dtb__28).Base_dDiag.f_Label_labelSpan with
  | B_dData_dMaybe.C_Maybe_Nothing -> mc1
  | B_dData_dMaybe.C_Maybe_Just (dtb__30) -> (if (if ((dtb__30).Base_dSource.f_Span_spanFile = "") then true else ((v_memStr (dtb__30).Base_dSource.f_Span_spanFile) mc1)) then mc1 else (B_dData_dList.C_List__x58__x58_ ((dtb__30).Base_dSource.f_Span_spanFile, mc1)))
  | _ -> failwith "DT: impossible branch"
))
  | B_dData_dList.C_List_Nil -> mc1
  | _ -> failwith "DT: impossible branch"
))

# 325 "Vuna/Compiler/Driver/CompilerCli.vuna"
let rec v_collectLabelFiles = (fun (mc0 : Base_dDiag.t_Diagnostic B_dData_dList.t_List) (mc1 : string B_dData_dList.t_List) -> (match mc0 with
  | B_dData_dList.C_List__x58__x58_ (dtb__31, dtb__32) -> ((v_collectLabelFiles dtb__32) ((v_labelFiles (dtb__31).Base_dDiag.f_Diagnostic_diagLabels) mc1))
  | B_dData_dList.C_List_Nil -> mc1
  | _ -> failwith "DT: impossible branch"
))

# 343 "Vuna/Compiler/Driver/CompilerCli.vuna"
let rec v_lastSlashGo = (fun (mc0 : int B_dData_dList.t_List) (mc1 : int) (mc2 : int) -> (match mc0 with
  | B_dData_dList.C_List__x58__x58_ (dtb__33, dtb__34) -> (((v_lastSlashGo dtb__34) (mc1 + 1)) (if (dtb__33 = 47) then mc1 else mc2))
  | B_dData_dList.C_List_Nil -> mc2
  | _ -> failwith "DT: impossible branch"
))

# 347 "Vuna/Compiler/Driver/CompilerCli.vuna"
let v_lastSlashIndexOf = (fun (s : string) -> (((v_lastSlashGo (B_dData_dList.dtp_unpack s)) 0) (0 - 1)))

# 350 "Vuna/Compiler/Driver/CompilerCli.vuna"
let v_dirOf = (fun (path : string) -> (let n = (v_lastSlashIndexOf path) in (if (n < 0) then "." else (if (n = 0) then "/" else (((B_dData_dString.v_substring 0) (bi_natFromInt n)) path)))))

# 356 "Vuna/Compiler/Driver/CompilerCli.vuna"
let v_stripPathPrefix = (fun (base : string) (file : string) -> (if ((B_dData_dString.v_startsWith (base ^ "/")) file) then (((B_dData_dString.v_substring (bi_natFromInt ((bi_strLength base) + 1))) (bi_natFromInt (((bi_strLength file) - (bi_strLength base)) - 1))) file) else file))

# 369 "Vuna/Compiler/Driver/CompilerCli.vuna"
let rec v_splitSlashGo = (fun (mc0 : int B_dData_dList.t_List) (mc1 : int B_dData_dList.t_List) (mc2 : string B_dData_dList.t_List) -> (match mc0 with
  | B_dData_dList.C_List__x58__x58_ (dtb__35, dtb__36) -> (if (dtb__35 = 47) then (((v_splitSlashGo dtb__36) B_dData_dList.C_List_Nil) (B_dData_dList.C_List__x58__x58_ ((B_dData_dList.dtp_pack (B_dData_dList.v_reverse mc1)), mc2))) else (((v_splitSlashGo dtb__36) (B_dData_dList.C_List__x58__x58_ (dtb__35, mc1))) mc2))
  | B_dData_dList.C_List_Nil -> (B_dData_dList.v_reverse (B_dData_dList.C_List__x58__x58_ ((B_dData_dList.dtp_pack (B_dData_dList.v_reverse mc1)), mc2)))
  | _ -> failwith "DT: impossible branch"
))

# 366 "Vuna/Compiler/Driver/CompilerCli.vuna"
let v_splitSlash = (fun (s : string) -> (((v_splitSlashGo (B_dData_dList.dtp_unpack s)) B_dData_dList.C_List_Nil) B_dData_dList.C_List_Nil))

# 377 "Vuna/Compiler/Driver/CompilerCli.vuna"
let v_moduleOfRel = (fun (rel : string) -> (let rel1 = (if ((B_dData_dString.v_startsWith "lib/") rel) then (((B_dData_dString.v_substring (bi_natFromInt 4)) (bi_natFromInt ((bi_strLength rel) - 4))) rel) else (if ((B_dData_dString.v_startsWith "app/") rel) then (((B_dData_dString.v_substring (bi_natFromInt 4)) (bi_natFromInt ((bi_strLength rel) - 4))) rel) else rel)) in (let rel2 = (if ((B_dData_dString.v_endsWith ".vuna") rel1) then (((B_dData_dString.v_substring 0) (bi_natFromInt ((bi_strLength rel1) - 5))) rel1) else rel1) in ((B_dData_dString.v_join ".") (v_splitSlash rel2)))))

# 391 "Vuna/Compiler/Driver/CompilerCli.vuna"
let rec v_findPkgRootGo = (fun (nFs : string) (fuel : int) (dir : string) -> (if (fuel <= 0) then ((B_dTrait_dApplicative.v_pure B_dEffect_dCore.v_Applicative_u19070277251d295b_uBase_x36_46_x36_Effect_x36_46_x36_Core_x36_46_x36_Eff_ur) { B_dData_dPair.f_Pair_first = ""; B_dData_dPair.f_Pair_second = "" }) else (let candidate = (if (dir = "/") then "/vuna.toml" else (dir ^ "/vuna.toml")) in (((B_dTrait_dMonad.v__x62__x62__x61_ B_dEffect_dCore.v_Monad_ucc99eea03f4e7df1_uBase_x36_46_x36_Effect_x36_46_x36_Core_x36_46_x36_Eff_ur) ((B_dEffect_dFs.v_fsFileExists nFs) candidate)) (fun exists -> (if exists then (((B_dTrait_dMonad.v__x62__x62__x61_ B_dEffect_dCore.v_Monad_ucc99eea03f4e7df1_uBase_x36_46_x36_Effect_x36_46_x36_Core_x36_46_x36_Eff_ur) ((B_dEffect_dFs.v_fsReadFile nFs) candidate)) (fun text -> (let name = (match ((Frontend_dManifest.v_parseManifest candidate) text) with
  | Base_dDiag.C_Check_OkC (dtb__37) -> (match (dtb__37).Frontend_dManifest.f_Manifest_manifestName with
  | B_dData_dMaybe.C_Maybe_Nothing -> ""
  | B_dData_dMaybe.C_Maybe_Just (dtb__38) -> dtb__38
  | _ -> failwith "DT: impossible branch"
)
  | Base_dDiag.C_Check_ErrC (dtb__39) -> ""
  | _ -> failwith "DT: impossible branch"
) in ((B_dTrait_dApplicative.v_pure B_dEffect_dCore.v_Applicative_u19070277251d295b_uBase_x36_46_x36_Effect_x36_46_x36_Core_x36_46_x36_Eff_ur) { B_dData_dPair.f_Pair_first = dir; B_dData_dPair.f_Pair_second = name })))) else (if (if (dir = "/") then true else (dir = ".")) then ((B_dTrait_dApplicative.v_pure B_dEffect_dCore.v_Applicative_u19070277251d295b_uBase_x36_46_x36_Effect_x36_46_x36_Core_x36_46_x36_Eff_ur) { B_dData_dPair.f_Pair_first = ""; B_dData_dPair.f_Pair_second = "" }) else (((v_findPkgRootGo nFs) (fuel - 1)) (v_dirOf dir)))))))))

# 414 "Vuna/Compiler/Driver/CompilerCli.vuna"
let v_sourceRefEff = (fun (nFs : string) (nEnv : string) (file : string) -> (((B_dTrait_dMonad.v__x62__x62__x61_ B_dEffect_dCore.v_Monad_ucc99eea03f4e7df1_uBase_x36_46_x36_Effect_x36_46_x36_Core_x36_46_x36_Eff_ur) ((Frontend_dPackages_dPkg.v_absolutePath nEnv) file)) (fun abs -> (((B_dTrait_dMonad.v__x62__x62__x61_ B_dEffect_dCore.v_Monad_ucc99eea03f4e7df1_uBase_x36_46_x36_Effect_x36_46_x36_Core_x36_46_x36_Eff_ur) ((B_dEffect_dFs.v_fsFileExists nFs) abs)) (fun exists -> (((B_dTrait_dMonad.v__x62__x62__x61_ B_dEffect_dCore.v_Monad_ucc99eea03f4e7df1_uBase_x36_46_x36_Effect_x36_46_x36_Core_x36_46_x36_Eff_ur) (if exists then (((B_dTrait_dMonad.v__x62__x62__x61_ B_dEffect_dCore.v_Monad_ucc99eea03f4e7df1_uBase_x36_46_x36_Effect_x36_46_x36_Core_x36_46_x36_Eff_ur) ((B_dEffect_dFs.v_fsReadFile nFs) abs)) (fun text -> ((B_dTrait_dApplicative.v_pure B_dEffect_dCore.v_Applicative_u19070277251d295b_uBase_x36_46_x36_Effect_x36_46_x36_Core_x36_46_x36_Eff_ur) (bi_strFromInt (Loader_dFingerprint.v_textHashOf text))))) else ((B_dTrait_dApplicative.v_pure B_dEffect_dCore.v_Applicative_u19070277251d295b_uBase_x36_46_x36_Effect_x36_46_x36_Core_x36_46_x36_Eff_ur) ""))) (fun digest -> (((B_dTrait_dMonad.v__x62__x62__x61_ B_dEffect_dCore.v_Monad_ucc99eea03f4e7df1_uBase_x36_46_x36_Effect_x36_46_x36_Core_x36_46_x36_Eff_ur) (((v_findPkgRootGo nFs) 12) (v_dirOf abs))) (fun root -> (let pkgDir = (B_dData_dPair.v_firstOf root) in (let pkgName = (B_dData_dPair.v_secondOf root) in (let rel = (if (pkgDir = "") then file else ((v_stripPathPrefix pkgDir) abs)) in ((B_dTrait_dApplicative.v_pure B_dEffect_dCore.v_Applicative_u19070277251d295b_uBase_x36_46_x36_Effect_x36_46_x36_Core_x36_46_x36_Eff_ur) { Base_dDiag_dFormat.f_SourceRef_srcFile = file; Base_dDiag_dFormat.f_SourceRef_srcDigest = digest; Base_dDiag_dFormat.f_SourceRef_srcPackage = pkgName; Base_dDiag_dFormat.f_SourceRef_srcModule = (v_moduleOfRel rel); Base_dDiag_dFormat.f_SourceRef_srcRelPath = rel })))))))))))))

# 433 "Vuna/Compiler/Driver/CompilerCli.vuna"
let rec v_sourcePairsEff = (fun (nFs : string) (nEnv : string) (mc0 : string B_dData_dList.t_List) -> (match mc0 with
  | B_dData_dList.C_List__x58__x58_ (dtb__40, dtb__41) -> (((B_dTrait_dMonad.v__x62__x62__x61_ B_dEffect_dCore.v_Monad_ucc99eea03f4e7df1_uBase_x36_46_x36_Effect_x36_46_x36_Core_x36_46_x36_Eff_ur) (((v_sourcePairsEff nFs) nEnv) dtb__41)) (fun more -> (((B_dTrait_dMonad.v__x62__x62__x61_ B_dEffect_dCore.v_Monad_ucc99eea03f4e7df1_uBase_x36_46_x36_Effect_x36_46_x36_Core_x36_46_x36_Eff_ur) (((v_sourceRefEff nFs) nEnv) dtb__40)) (fun ref -> ((B_dTrait_dApplicative.v_pure B_dEffect_dCore.v_Applicative_u19070277251d295b_uBase_x36_46_x36_Effect_x36_46_x36_Core_x36_46_x36_Eff_ur) (B_dData_dList.C_List__x58__x58_ (ref, more)))))))
  | B_dData_dList.C_List_Nil -> ((B_dTrait_dApplicative.v_pure B_dEffect_dCore.v_Applicative_u19070277251d295b_uBase_x36_46_x36_Effect_x36_46_x36_Core_x36_46_x36_Eff_ur) B_dData_dList.C_List_Nil)
  | _ -> failwith "DT: impossible branch"
))

# 183 "Vuna/Compiler/Driver/CompilerCli.vuna"
let v_flushSarif = (fun (nFs : string) (nConsole : string) (nEnv : string) (code : int) (o : t_CliOpts) -> (let shown = ((v_takeDiags (o).f_CliOpts_optMaxErrors) (o).f_CliOpts_optSarifItems) in (if ((o).f_CliOpts_optDiagFormat = "sarif") then (((B_dTrait_dMonad.v__x62__x62__x61_ B_dEffect_dCore.v_Monad_ucc99eea03f4e7df1_uBase_x36_46_x36_Effect_x36_46_x36_Core_x36_46_x36_Eff_ur) ((B_dEffect_dConsole.v_consolePrint nConsole) ((Base_dDiag_dFormat.v_renderSarif shown) ^ "\n"))) (fun _u -> ((B_dTrait_dApplicative.v_pure B_dEffect_dCore.v_Applicative_u19070277251d295b_uBase_x36_46_x36_Effect_x36_46_x36_Core_x36_46_x36_Eff_ur) code))) else (if ((o).f_CliOpts_optDiagFormat = "json") then (if (o).f_CliOpts_optWithSources then (((B_dTrait_dMonad.v__x62__x62__x61_ B_dEffect_dCore.v_Monad_ucc99eea03f4e7df1_uBase_x36_46_x36_Effect_x36_46_x36_Core_x36_46_x36_Eff_ur) (((v_sourcePairsEff nFs) nEnv) (B_dData_dList.v_reverse ((v_collectLabelFiles shown) B_dData_dList.C_List_Nil)))) (fun sources -> (((B_dTrait_dMonad.v__x62__x62__x61_ B_dEffect_dCore.v_Monad_ucc99eea03f4e7df1_uBase_x36_46_x36_Effect_x36_46_x36_Core_x36_46_x36_Eff_ur) ((B_dEffect_dConsole.v_consolePrint nConsole) ((((Base_dDiag_dFormat.v_renderJsonListWithSources (o).f_CliOpts_optDiagLang) shown) sources) ^ "\n"))) (fun _u -> ((B_dTrait_dApplicative.v_pure B_dEffect_dCore.v_Applicative_u19070277251d295b_uBase_x36_46_x36_Effect_x36_46_x36_Core_x36_46_x36_Eff_ur) code))))) else (((B_dTrait_dMonad.v__x62__x62__x61_ B_dEffect_dCore.v_Monad_ucc99eea03f4e7df1_uBase_x36_46_x36_Effect_x36_46_x36_Core_x36_46_x36_Eff_ur) ((B_dEffect_dConsole.v_consolePrint nConsole) (((Base_dDiag_dFormat.v_renderJsonList (o).f_CliOpts_optDiagLang) shown) ^ "\n"))) (fun _u -> ((B_dTrait_dApplicative.v_pure B_dEffect_dCore.v_Applicative_u19070277251d295b_uBase_x36_46_x36_Effect_x36_46_x36_Core_x36_46_x36_Eff_ur) code)))) else ((B_dTrait_dApplicative.v_pure B_dEffect_dCore.v_Applicative_u19070277251d295b_uBase_x36_46_x36_Effect_x36_46_x36_Core_x36_46_x36_Eff_ur) code)))))

# 441 "Vuna/Compiler/Driver/CompilerCli.vuna"
let v_isCascadeDiag = (fun (d : Base_dDiag.t_Diagnostic) -> (match (d).Base_dDiag.f_Diagnostic_diagOrigin with
  | Base_dDiag.C_Origin_OriginCascade (dtb__42) -> true
  | Base_dDiag.C_Origin_OriginDirect -> false
  | _ -> failwith "DT: impossible branch"
))

# 448 "Vuna/Compiler/Driver/CompilerCli.vuna"
let v_isTextDiagFormat = (fun (f : string) -> (if (f = "short") then true else (f = "human")))

# 451 "Vuna/Compiler/Driver/CompilerCli.vuna"
let v_visibleDiags = (fun (o : t_CliOpts) (ds : Base_dDiag.t_Diagnostic B_dData_dList.t_List) -> (if (if (o).f_CliOpts_optShowCascade then true else (B_dData_dBool.v_not (v_isTextDiagFormat (o).f_CliOpts_optDiagFormat))) then ds else (let kept = ((B_dData_dList.v_filter (fun (d : Base_dDiag.t_Diagnostic) -> (B_dData_dBool.v_not (v_isCascadeDiag d)))) ds) in (if (if ((B_dData_dList.v_length kept) = 0) then ((B_dData_dList.v_length ds) > 0) else false) then ds else kept))))

# 461 "Vuna/Compiler/Driver/CompilerCli.vuna"
let rec v_hasShowWarnings = (fun (mc0 : string B_dData_dList.t_List) -> (match mc0 with
  | B_dData_dList.C_List__x58__x58_ (dtb__43, dtb__44) -> (if (if (dtb__43 = "--warnings") then true else (dtb__43 = "-W")) then true else (v_hasShowWarnings dtb__44))
  | B_dData_dList.C_List_Nil -> false
  | _ -> failwith "DT: impossible branch"
))

# 467 "Vuna/Compiler/Driver/CompilerCli.vuna"
let rec v_hasFormatFlag = (fun (mc0 : string B_dData_dList.t_List) -> (match mc0 with
  | B_dData_dList.C_List__x58__x58_ (dtb__45, dtb__46) -> (if (if (if (dtb__45 = "--json") then true else ((B_dData_dString.v_startsWith "--error-format") dtb__45)) then true else ((B_dData_dString.v_startsWith "--message-format") dtb__45)) then true else (v_hasFormatFlag dtb__46))
  | B_dData_dList.C_List_Nil -> false
  | _ -> failwith "DT: impossible branch"
))

# 480 "Vuna/Compiler/Driver/CompilerCli.vuna"
let rec v_stripDiagFormatGo = (fun (mc0 : string B_dData_dList.t_List) (mc1 : string B_dData_dList.t_List) (mc2 : string B_dData_dMaybe.t_Maybe) -> (match mc0 with
  | B_dData_dList.C_List__x58__x58_ (dtb__47, dtb__48) -> (if (dtb__47 = "--json") then (((v_stripDiagFormatGo dtb__48) mc1) (B_dData_dMaybe.C_Maybe_Just ("json"))) else (if (dtb__47 = "--error-format") then (match dtb__48 with
  | B_dData_dList.C_List__x58__x58_ (dtb__49, dtb__50) -> (((v_stripDiagFormatGo dtb__50) mc1) (B_dData_dMaybe.C_Maybe_Just (dtb__49)))
  | B_dData_dList.C_List_Nil -> { B_dData_dPair.f_Pair_first = (B_dData_dList.v_reverse mc1); B_dData_dPair.f_Pair_second = (B_dData_dMaybe.C_Maybe_Just ("short")) }
  | _ -> failwith "DT: impossible branch"
) else (if ((B_dData_dString.v_startsWith "--error-format=") dtb__47) then (((v_stripDiagFormatGo dtb__48) mc1) (B_dData_dMaybe.C_Maybe_Just ((((B_dData_dString.v_substring (bi_natFromInt 15)) (bi_natFromInt ((bi_strLength dtb__47) - 15))) dtb__47)))) else (if ((B_dData_dString.v_startsWith "--message-format=") dtb__47) then (((v_stripDiagFormatGo dtb__48) mc1) (B_dData_dMaybe.C_Maybe_Just ((((B_dData_dString.v_substring (bi_natFromInt 17)) (bi_natFromInt ((bi_strLength dtb__47) - 17))) dtb__47)))) else (((v_stripDiagFormatGo dtb__48) (B_dData_dList.C_List__x58__x58_ (dtb__47, mc1))) mc2)))))
  | B_dData_dList.C_List_Nil -> { B_dData_dPair.f_Pair_first = (B_dData_dList.v_reverse mc1); B_dData_dPair.f_Pair_second = mc2 }
  | _ -> failwith "DT: impossible branch"
))

# 476 "Vuna/Compiler/Driver/CompilerCli.vuna"
let v_stripDiagFormat = (fun (args : string B_dData_dList.t_List) -> (((v_stripDiagFormatGo args) B_dData_dList.C_List_Nil) B_dData_dMaybe.C_Maybe_Nothing))

# 533 "Vuna/Compiler/Driver/CompilerCli.vuna"
let rec v_parseIntChars = (fun (mc0 : int B_dData_dList.t_List) (mc1 : int) (mc2 : int) (mc3 : int) -> (match mc0 with
  | B_dData_dList.C_List__x58__x58_ (dtb__51, dtb__52) -> (if (if (dtb__51 >= 48) then (dtb__51 <= 57) else false) then ((((v_parseIntChars dtb__52) ((mc1 * 10) + (dtb__51 - 48))) (mc2 + 1)) mc3) else (if (mc2 = 0) then mc3 else mc1))
  | B_dData_dList.C_List_Nil -> (if (mc2 = 0) then mc3 else mc1)
  | _ -> failwith "DT: impossible branch"
))

# 529 "Vuna/Compiler/Driver/CompilerCli.vuna"
let v_parseIntOr = (fun (s : string) (fallback : int) -> ((((v_parseIntChars (B_dData_dList.dtp_unpack s)) 0) 0) fallback))

# 541 "Vuna/Compiler/Driver/CompilerCli.vuna"
let v_parseWasmOptLevel = (fun (s : string) -> (let n = ((v_parseIntOr s) (0 - 1)) in (if (if (n >= 0) then (n <= 3) else false) then (B_dData_dMaybe.C_Maybe_Just (n)) else B_dData_dMaybe.C_Maybe_Nothing)))

# 552 "Vuna/Compiler/Driver/CompilerCli.vuna"
let rec v_stripMaxErrorsGo = (fun (mc0 : string B_dData_dList.t_List) (mc1 : string B_dData_dList.t_List) (mc2 : int) -> (match mc0 with
  | B_dData_dList.C_List__x58__x58_ (dtb__53, dtb__54) -> (if (dtb__53 = "--max-errors") then (match dtb__54 with
  | B_dData_dList.C_List__x58__x58_ (dtb__55, dtb__56) -> (((v_stripMaxErrorsGo dtb__56) mc1) ((v_parseIntOr dtb__55) mc2))
  | B_dData_dList.C_List_Nil -> { B_dData_dPair.f_Pair_first = (B_dData_dList.v_reverse mc1); B_dData_dPair.f_Pair_second = mc2 }
  | _ -> failwith "DT: impossible branch"
) else (if ((B_dData_dString.v_startsWith "--max-errors=") dtb__53) then (((v_stripMaxErrorsGo dtb__54) mc1) ((v_parseIntOr (((B_dData_dString.v_substring (bi_natFromInt 13)) (bi_natFromInt ((bi_strLength dtb__53) - 13))) dtb__53)) mc2)) else (((v_stripMaxErrorsGo dtb__54) (B_dData_dList.C_List__x58__x58_ (dtb__53, mc1))) mc2)))
  | B_dData_dList.C_List_Nil -> { B_dData_dPair.f_Pair_first = (B_dData_dList.v_reverse mc1); B_dData_dPair.f_Pair_second = mc2 }
  | _ -> failwith "DT: impossible branch"
))

# 548 "Vuna/Compiler/Driver/CompilerCli.vuna"
let v_stripMaxErrors = (fun (args : string B_dData_dList.t_List) -> (((v_stripMaxErrorsGo args) B_dData_dList.C_List_Nil) 20))

# 588 "Vuna/Compiler/Driver/CompilerCli.vuna"
let v_printVersion = (fun (nConsole : string) (_u : int) -> (((B_dTrait_dMonad.v__x62__x62__x61_ B_dEffect_dCore.v_Monad_ucc99eea03f4e7df1_uBase_x36_46_x36_Effect_x36_46_x36_Core_x36_46_x36_Eff_ur) ((B_dEffect_dConsole.v_consolePrint nConsole) (String.concat "" ["vuna-compiler "; Base_dVersion.v_vunaVersion; "\n"]))) (fun _u -> ((B_dTrait_dApplicative.v_pure B_dEffect_dCore.v_Applicative_u19070277251d295b_uBase_x36_46_x36_Effect_x36_46_x36_Core_x36_46_x36_Eff_ur) 0))))

# 595 "Vuna/Compiler/Driver/CompilerCli.vuna"
let rec v_anyHelp = (fun (mc0 : string B_dData_dList.t_List) -> (match mc0 with
  | B_dData_dList.C_List__x58__x58_ (dtb__57, dtb__58) -> (if (if (dtb__57 = "-h") then true else (dtb__57 = "--help")) then true else (v_anyHelp dtb__58))
  | B_dData_dList.C_List_Nil -> false
  | _ -> failwith "DT: impossible branch"
))

# 600 "Vuna/Compiler/Driver/CompilerCli.vuna"
let v_helpFor = (fun (nConsole : string) (prog : string) -> (((B_dTrait_dMonad.v__x62__x62__x61_ B_dEffect_dCore.v_Monad_ucc99eea03f4e7df1_uBase_x36_46_x36_Effect_x36_46_x36_Core_x36_46_x36_Eff_ur) ((B_dEffect_dConsole.v_consolePrint nConsole) (v_compilerUsage prog))) (fun _u -> ((B_dTrait_dApplicative.v_pure B_dEffect_dCore.v_Applicative_u19070277251d295b_uBase_x36_46_x36_Effect_x36_46_x36_Core_x36_46_x36_Eff_ur) 0))))

# 607 "Vuna/Compiler/Driver/CompilerCli.vuna"
let v_usageErr = (fun (nConsole : string) (prog : string) -> (((B_dTrait_dMonad.v__x62__x62__x61_ B_dEffect_dCore.v_Monad_ucc99eea03f4e7df1_uBase_x36_46_x36_Effect_x36_46_x36_Core_x36_46_x36_Eff_ur) ((B_dEffect_dConsole.v_consolePrint nConsole) (v_compilerUsage prog))) (fun _u -> ((B_dTrait_dApplicative.v_pure B_dEffect_dCore.v_Applicative_u19070277251d295b_uBase_x36_46_x36_Effect_x36_46_x36_Core_x36_46_x36_Eff_ur) 2))))

# 614 "Vuna/Compiler/Driver/CompilerCli.vuna"
let v_unknownCommand = (fun (nConsole : string) (prog : string) (arg : string) -> (((B_dTrait_dMonad.v__x62__x62__x61_ B_dEffect_dCore.v_Monad_ucc99eea03f4e7df1_uBase_x36_46_x36_Effect_x36_46_x36_Core_x36_46_x36_Eff_ur) ((B_dEffect_dConsole.v_consolePrint nConsole) (String.concat "" ["error: unknown command "; arg; "\nrun "; prog; " help for the command list\n"]))) (fun _u -> ((B_dTrait_dApplicative.v_pure B_dEffect_dCore.v_Applicative_u19070277251d295b_uBase_x36_46_x36_Effect_x36_46_x36_Core_x36_46_x36_Eff_ur) 2))))

# 620 "Vuna/Compiler/Driver/CompilerCli.vuna"
let v_removedCommand = (fun (nConsole : string) (prog : string) (cmd : string) (hint : string) -> (((B_dTrait_dMonad.v__x62__x62__x61_ B_dEffect_dCore.v_Monad_ucc99eea03f4e7df1_uBase_x36_46_x36_Effect_x36_46_x36_Core_x36_46_x36_Eff_ur) ((B_dEffect_dConsole.v_consolePrint nConsole) (String.concat "" ["error: "; cmd; " has been removed; "; hint; "\n"]))) (fun _u -> ((B_dTrait_dApplicative.v_pure B_dEffect_dCore.v_Applicative_u19070277251d295b_uBase_x36_46_x36_Effect_x36_46_x36_Core_x36_46_x36_Eff_ur) 2))))

# 628 "Vuna/Compiler/Driver/CompilerCli.vuna"
let v_dashFlag = (fun (name : string) -> ("--" ^ name))

# 631 "Vuna/Compiler/Driver/CompilerCli.vuna"
let v_removedFlagHint = (fun (flag : string) -> (if (flag = (v_dashFlag "dt")) then (B_dData_dMaybe.C_Maybe_Just ("DT is the only path; drop the flag")) else (if (flag = (v_dashFlag "package")) then (B_dData_dMaybe.C_Maybe_Just ("use build or compile")) else (if (flag = (v_dashFlag "split")) then (B_dData_dMaybe.C_Maybe_Just ("split is the only output model; use build --out OUT [DIR] or compile <pkg-dir> OUT")) else (if (flag = (v_dashFlag "root")) then (B_dData_dMaybe.C_Maybe_Just ("module resolution is decided by the nearest vuna.toml; set VUNA_BASE for standalone files")) else (if (flag = (v_dashFlag "out")) then (B_dData_dMaybe.C_Maybe_Just ("pass OUTDIR positionally to compile; build accepts --out DIR")) else (if (flag = (v_dashFlag "no-typecheck")) then (B_dData_dMaybe.C_Maybe_Just ("checking is always enabled")) else (if (flag = (v_dashFlag "typecheck")) then (B_dData_dMaybe.C_Maybe_Just ("checking is always enabled")) else (if (flag = (v_dashFlag "typed")) then (B_dData_dMaybe.C_Maybe_Just ("DT is the only path")) else B_dData_dMaybe.C_Maybe_Nothing)))))))))

# 650 "Vuna/Compiler/Driver/CompilerCli.vuna"
let v_removedFlag = (fun (nConsole : string) (prog : string) (flag : string) -> (match (v_removedFlagHint flag) with
  | B_dData_dMaybe.C_Maybe_Nothing -> ((v_usageErr nConsole) prog)
  | B_dData_dMaybe.C_Maybe_Just (dtb__59) -> (((B_dTrait_dMonad.v__x62__x62__x61_ B_dEffect_dCore.v_Monad_ucc99eea03f4e7df1_uBase_x36_46_x36_Effect_x36_46_x36_Core_x36_46_x36_Eff_ur) ((B_dEffect_dConsole.v_consolePrint nConsole) (String.concat "" ["error: "; flag; " has been removed; "; dtb__59; "\n"]))) (fun _u -> ((B_dTrait_dApplicative.v_pure B_dEffect_dCore.v_Applicative_u19070277251d295b_uBase_x36_46_x36_Effect_x36_46_x36_Core_x36_46_x36_Eff_ur) 2)))
  | _ -> failwith "DT: impossible branch"
))

# 662 "Vuna/Compiler/Driver/CompilerCli.vuna"
let v_printErrText = (fun (nConsole : string) (e : string) -> (((B_dTrait_dMonad.v__x62__x62__x61_ B_dEffect_dCore.v_Monad_ucc99eea03f4e7df1_uBase_x36_46_x36_Effect_x36_46_x36_Core_x36_46_x36_Eff_ur) ((B_dEffect_dConsole.v_consolePrint nConsole) e)) (fun _u -> ((B_dTrait_dApplicative.v_pure B_dEffect_dCore.v_Applicative_u19070277251d295b_uBase_x36_46_x36_Effect_x36_46_x36_Core_x36_46_x36_Eff_ur) 1))))

# 669 "Vuna/Compiler/Driver/CompilerCli.vuna"
let v_severityLabelOf = (fun (d : Base_dDiag.t_Diagnostic) -> (match (d).Base_dDiag.f_Diagnostic_diagSeverity with
  | Base_dDiag.C_Severity_SevError -> "error"
  | Base_dDiag.C_Severity_SevWarning -> "warning"
  | Base_dDiag.C_Severity_SevNote -> "note"
  | Base_dDiag.C_Severity_SevHelp -> "help"
  | _ -> failwith "DT: impossible branch"
))

# 702 "Vuna/Compiler/Driver/CompilerCli.vuna"
let v_collectSarifIn = (fun (o : t_CliOpts) (d : Base_dDiag.t_Diagnostic) -> { o with f_CliOpts_optSarifItems = ((B_dData_dList.v_append (o).f_CliOpts_optSarifItems) (B_dData_dList.C_List__x58__x58_ (d, B_dData_dList.C_List_Nil))) })

# 678 "Vuna/Compiler/Driver/CompilerCli.vuna"
let v_emitDiag = (fun (nFs : string) (nConsole : string) (o : t_CliOpts) (extra : string) (d : Base_dDiag.t_Diagnostic) -> (if ((o).f_CliOpts_optDiagFormat = "json") then ((B_dTrait_dApplicative.v_pure B_dEffect_dCore.v_Applicative_u19070277251d295b_uBase_x36_46_x36_Effect_x36_46_x36_Core_x36_46_x36_Eff_ur) { B_dData_dPair.f_Pair_first = (v_diagExitFor d); B_dData_dPair.f_Pair_second = ((v_collectSarifIn o) d) }) else (if ((o).f_CliOpts_optDiagFormat = "human") then (((B_dTrait_dMonad.v__x62__x62__x61_ B_dEffect_dCore.v_Monad_ucc99eea03f4e7df1_uBase_x36_46_x36_Effect_x36_46_x36_Core_x36_46_x36_Eff_ur) (((Base_dDiag_dFormat.v_renderHuman nFs) (o).f_CliOpts_optDiagLang) d)) (fun msg -> (((B_dTrait_dMonad.v__x62__x62__x61_ B_dEffect_dCore.v_Monad_ucc99eea03f4e7df1_uBase_x36_46_x36_Effect_x36_46_x36_Core_x36_46_x36_Eff_ur) ((v_printErrText nConsole) (msg ^ "\n"))) (fun _u -> ((B_dTrait_dApplicative.v_pure B_dEffect_dCore.v_Applicative_u19070277251d295b_uBase_x36_46_x36_Effect_x36_46_x36_Core_x36_46_x36_Eff_ur) { B_dData_dPair.f_Pair_first = (v_diagExitFor d); B_dData_dPair.f_Pair_second = o }))))) else (if ((o).f_CliOpts_optDiagFormat = "sarif") then ((B_dTrait_dApplicative.v_pure B_dEffect_dCore.v_Applicative_u19070277251d295b_uBase_x36_46_x36_Effect_x36_46_x36_Core_x36_46_x36_Eff_ur) { B_dData_dPair.f_Pair_first = (v_diagExitFor d); B_dData_dPair.f_Pair_second = ((v_collectSarifIn o) d) }) else (if ((o).f_CliOpts_optDiagFormat = "github") then (((B_dTrait_dMonad.v__x62__x62__x61_ B_dEffect_dCore.v_Monad_ucc99eea03f4e7df1_uBase_x36_46_x36_Effect_x36_46_x36_Core_x36_46_x36_Eff_ur) ((v_printErrText nConsole) ((Base_dDiag_dFormat.v_renderGithub d) ^ "\n"))) (fun _u -> ((B_dTrait_dApplicative.v_pure B_dEffect_dCore.v_Applicative_u19070277251d295b_uBase_x36_46_x36_Effect_x36_46_x36_Core_x36_46_x36_Eff_ur) { B_dData_dPair.f_Pair_first = (v_diagExitFor d); B_dData_dPair.f_Pair_second = o }))) else (((B_dTrait_dMonad.v__x62__x62__x61_ B_dEffect_dCore.v_Monad_ucc99eea03f4e7df1_uBase_x36_46_x36_Effect_x36_46_x36_Core_x36_46_x36_Eff_ur) ((Base_dDiag_dFormat.v_renderShortSnippetEff nFs) d)) (fun snippet -> (((B_dTrait_dMonad.v__x62__x62__x61_ B_dEffect_dCore.v_Monad_ucc99eea03f4e7df1_uBase_x36_46_x36_Effect_x36_46_x36_Core_x36_46_x36_Eff_ur) ((v_printErrText nConsole) (String.concat "" [(v_severityLabelOf d); ": "; extra; (Base_dDiag_dFormat.v_renderShort d); snippet; (Base_dDiag_dFormat.v_callFieldSuffix (d).Base_dDiag.f_Diagnostic_diagFields); "\n"]))) (fun _u -> ((B_dTrait_dApplicative.v_pure B_dEffect_dCore.v_Applicative_u19070277251d295b_uBase_x36_46_x36_Effect_x36_46_x36_Core_x36_46_x36_Eff_ur) { B_dData_dPair.f_Pair_first = (v_diagExitFor d); B_dData_dPair.f_Pair_second = o }))))))))))

# 709 "Vuna/Compiler/Driver/CompilerCli.vuna"
let rec v_emitDiagSeq = (fun (nFs : string) (nConsole : string) (mc0 : t_CliOpts) (mc1 : string) (mc2 : Base_dDiag.t_Diagnostic B_dData_dList.t_List) -> (match mc2 with
  | B_dData_dList.C_List__x58__x58_ (dtb__60, dtb__61) -> (((B_dTrait_dMonad.v__x62__x62__x61_ B_dEffect_dCore.v_Monad_ucc99eea03f4e7df1_uBase_x36_46_x36_Effect_x36_46_x36_Core_x36_46_x36_Eff_ur) (((((v_emitDiag nFs) nConsole) mc0) mc1) dtb__60)) (fun r -> (((((v_emitDiagSeq nFs) nConsole) (B_dData_dPair.v_secondOf r)) mc1) dtb__61)))
  | B_dData_dList.C_List_Nil -> ((B_dTrait_dApplicative.v_pure B_dEffect_dCore.v_Applicative_u19070277251d295b_uBase_x36_46_x36_Effect_x36_46_x36_Core_x36_46_x36_Eff_ur) mc0)
  | _ -> failwith "DT: impossible branch"
))

# 706 "Vuna/Compiler/Driver/CompilerCli.vuna"
let v_emitDiagRevSeq = (fun (nFs : string) (nConsole : string) (o : t_CliOpts) (extra : string) (ds : Base_dDiag.t_Diagnostic B_dData_dList.t_List) -> (((((v_emitDiagSeq nFs) nConsole) o) extra) (B_dData_dList.v_reverse ds)))

# 716 "Vuna/Compiler/Driver/CompilerCli.vuna"
let v_printDiagWithPrefix = (fun (nFs : string) (nConsole : string) (o : t_CliOpts) (extra : string) (d : Base_dDiag.t_Diagnostic) -> (match (d).Base_dDiag.f_Diagnostic_diagChildren with
  | B_dData_dList.C_List_Nil -> (((((v_emitDiag nFs) nConsole) o) extra) d)
  | _ -> (let shown = ((v_takeDiags (v_maxErrorsOf o)) (B_dData_dList.C_List__x58__x58_ (d, ((v_visibleDiags o) (d).Base_dDiag.f_Diagnostic_diagChildren)))) in (((B_dTrait_dMonad.v__x62__x62__x61_ B_dEffect_dCore.v_Monad_ucc99eea03f4e7df1_uBase_x36_46_x36_Effect_x36_46_x36_Core_x36_46_x36_Eff_ur) (((((v_emitDiagRevSeq nFs) nConsole) o) extra) shown)) (fun o1 -> ((B_dTrait_dApplicative.v_pure B_dEffect_dCore.v_Applicative_u19070277251d295b_uBase_x36_46_x36_Effect_x36_46_x36_Core_x36_46_x36_Eff_ur) { B_dData_dPair.f_Pair_first = (v_diagExitFor d); B_dData_dPair.f_Pair_second = o1 }))))
))

# 728 "Vuna/Compiler/Driver/CompilerCli.vuna"
let v_printDiag = (fun (nFs : string) (nConsole : string) (o : t_CliOpts) (d : Base_dDiag.t_Diagnostic) -> (((((v_printDiagWithPrefix nFs) nConsole) o) "") d))

# 732 "Vuna/Compiler/Driver/CompilerCli.vuna"
let v_printErr = (fun (nConsole : string) (e : string) -> ((v_printErrText nConsole) (String.concat "" ["error: "; e; "\n"])))

# 736 "Vuna/Compiler/Driver/CompilerCli.vuna"
let v_printDiagList = (fun (nFs : string) (nConsole : string) (o : t_CliOpts) (extra : string) (ds : Base_dDiag.t_Diagnostic B_dData_dList.t_List) -> (let shown = ((v_takeDiags (v_maxErrorsOf o)) ((v_visibleDiags o) ds)) in (((B_dTrait_dMonad.v__x62__x62__x61_ B_dEffect_dCore.v_Monad_ucc99eea03f4e7df1_uBase_x36_46_x36_Effect_x36_46_x36_Core_x36_46_x36_Eff_ur) (((((v_emitDiagRevSeq nFs) nConsole) o) extra) shown)) (fun o1 -> ((B_dTrait_dApplicative.v_pure B_dEffect_dCore.v_Applicative_u19070277251d295b_uBase_x36_46_x36_Effect_x36_46_x36_Core_x36_46_x36_Eff_ur) { B_dData_dPair.f_Pair_first = 0; B_dData_dPair.f_Pair_second = o1 })))))

# 744 "Vuna/Compiler/Driver/CompilerCli.vuna"
let v_defaultDir = (fun (mc0 : string B_dData_dMaybe.t_Maybe) -> (match mc0 with
  | B_dData_dMaybe.C_Maybe_Nothing -> "."
  | B_dData_dMaybe.C_Maybe_Just (dtb__62) -> dtb__62
  | _ -> failwith "DT: impossible branch"
))

# 751 "Vuna/Compiler/Driver/CompilerCli.vuna"
let v_dtPathErr = (fun (nConsole : string) (path : string) -> ((v_printErr nConsole) ("no such file or package directory: " ^ path)))

# 766 "Vuna/Compiler/Driver/CompilerCli.vuna"
let v_executablePackageAt = (fun (nFs : string) (nEnv : string) (label : string) (dir : string) -> (((B_dTrait_dMonad.v__x62__x62__x61_ B_dEffect_dCore.v_Monad_ucc99eea03f4e7df1_uBase_x36_46_x36_Effect_x36_46_x36_Core_x36_46_x36_Eff_ur) (((Frontend_dPackages_dPkg.v_loadPackage nFs) nEnv) dir)) (fun pkgR -> (match pkgR with
  | Base_dDiag.C_Check_ErrC (dtb__63) -> ((B_dTrait_dApplicative.v_pure B_dEffect_dCore.v_Applicative_u19070277251d295b_uBase_x36_46_x36_Effect_x36_46_x36_Core_x36_46_x36_Eff_ur) (Base_dDiag.C_Check_ErrC (dtb__63)))
  | Base_dDiag.C_Check_OkC (dtb__64) -> (((B_dTrait_dMonad.v__x62__x62__x61_ B_dEffect_dCore.v_Monad_ucc99eea03f4e7df1_uBase_x36_46_x36_Effect_x36_46_x36_Core_x36_46_x36_Eff_ur) ((B_dEffect_dFs.v_fsFileExists nFs) (Frontend_dPackages_dPkg.v_packageEntry dtb__64))) (fun exists -> (if exists then ((B_dTrait_dApplicative.v_pure B_dEffect_dCore.v_Applicative_u19070277251d295b_uBase_x36_46_x36_Effect_x36_46_x36_Core_x36_46_x36_Eff_ur) (Base_dDiag.C_Check_OkC (dtb__64))) else ((B_dTrait_dApplicative.v_pure B_dEffect_dCore.v_Applicative_u19070277251d295b_uBase_x36_46_x36_Effect_x36_46_x36_Core_x36_46_x36_Eff_ur) (Base_dDiag.v_err (String.concat "" [label; ": library package "; (Frontend_dPackages_dPkg.v_packageName dtb__64); " has no app/Main.vuna (an executable package is required)"]))))))
  | _ -> failwith "DT: impossible branch"
))))

# 755 "Vuna/Compiler/Driver/CompilerCli.vuna"
let v_executablePackage = (fun (nFs : string) (nEnv : string) (label : string) (dir : string) -> (((B_dTrait_dMonad.v__x62__x62__x61_ B_dEffect_dCore.v_Monad_ucc99eea03f4e7df1_uBase_x36_46_x36_Effect_x36_46_x36_Core_x36_46_x36_Eff_ur) ((B_dEffect_dFs.v_fsFileExists nFs) dir)) (fun exists -> (if exists then (((B_dTrait_dMonad.v__x62__x62__x61_ B_dEffect_dCore.v_Monad_ucc99eea03f4e7df1_uBase_x36_46_x36_Effect_x36_46_x36_Core_x36_46_x36_Eff_ur) ((B_dEffect_dFs.v_fsIsDirectory nFs) dir)) (fun isDir -> (if isDir then ((((v_executablePackageAt nFs) nEnv) label) dir) else ((B_dTrait_dApplicative.v_pure B_dEffect_dCore.v_Applicative_u19070277251d295b_uBase_x36_46_x36_Effect_x36_46_x36_Core_x36_46_x36_Eff_ur) (Base_dDiag.v_err (String.concat "" [label; ": expected a package directory, not a file: "; dir])))))) else ((B_dTrait_dApplicative.v_pure B_dEffect_dCore.v_Applicative_u19070277251d295b_uBase_x36_46_x36_Effect_x36_46_x36_Core_x36_46_x36_Eff_ur) (Base_dDiag.v_err ("no such file or package directory: " ^ dir)))))))

# 808 "Vuna/Compiler/Driver/CompilerCli.vuna"
let v_isKnownTarget = (fun (t : string) -> (if (if (t = "ocaml") then true else (t = "wasm")) then true else (t = "native")))

# 830 "Vuna/Compiler/Driver/CompilerCli.vuna"
let v_compileToTarget = (fun (nFs : string) (nConsole : string) (nClock : string) (nEnv : string) (nProcess : string) (ctx : Frontend_dPackages_dPkg.t_PackageContext) (entry : string) (printResult : bool) (outDir : string) (target : string) -> (if (target = "ocaml") then (((B_dTrait_dMonad.v__x62__x62__x61_ B_dEffect_dCore.v_Monad_ucc99eea03f4e7df1_uBase_x36_46_x36_Effect_x36_46_x36_Core_x36_46_x36_Eff_ur) (((((((((Driver_dCompile.v_compileToDir nFs) nConsole) nClock) nEnv) nProcess) ctx) entry) printResult) outDir)) (fun r -> ((B_dTrait_dApplicative.v_pure B_dEffect_dCore.v_Applicative_u19070277251d295b_uBase_x36_46_x36_Effect_x36_46_x36_Core_x36_46_x36_Eff_ur) (match r with
  | Base_dDiag.C_Check_ErrC (dtb__65) -> (Base_dDiag.C_Check_ErrC (dtb__65))
  | Base_dDiag.C_Check_OkC (dtb__66) -> (Base_dDiag.C_Check_OkC ({ B_dData_dPair.f_Pair_first = B_dData_dList.C_List_Nil; B_dData_dPair.f_Pair_second = (B_dData_dPair.v_secondOf dtb__66) }))
  | _ -> failwith "DT: impossible branch"
)))) else ((((((((Driver_dTarget.v_compileBackend nFs) nEnv) nProcess) ctx) target) entry) printResult) outDir)))

# 916 "Vuna/Compiler/Driver/CompilerCli.vuna"
let v_checkSpawnArgs = (fun (o : t_CliOpts) (dir : string) -> (let head0 = (if (o).f_CliOpts_optRelease then (B_dData_dList.C_List__x58__x58_ ("check", (B_dData_dList.C_List__x58__x58_ ("--release", B_dData_dList.C_List_Nil)))) else (B_dData_dList.C_List__x58__x58_ ("check", B_dData_dList.C_List_Nil))) in (let base = (if ((o).f_CliOpts_optDiagFormat = "short") then ((B_dData_dList.v_append head0) (B_dData_dList.C_List__x58__x58_ (dir, B_dData_dList.C_List_Nil))) else ((B_dData_dList.v_append head0) (B_dData_dList.C_List__x58__x58_ ("--error-format", (B_dData_dList.C_List__x58__x58_ ((o).f_CliOpts_optDiagFormat, (B_dData_dList.C_List__x58__x58_ (dir, B_dData_dList.C_List_Nil)))))))) in (let base2 = (if (o).f_CliOpts_optShowWarnings then ((B_dData_dList.v_append base) (B_dData_dList.C_List__x58__x58_ ("--warnings", B_dData_dList.C_List_Nil))) else base) in (let base3 = (if (o).f_CliOpts_optDenyWarnings then ((B_dData_dList.v_append base2) (B_dData_dList.C_List__x58__x58_ ("--deny-warnings", B_dData_dList.C_List_Nil))) else base2) in (let langArgs = (if (o).f_CliOpts_optLangExplicit then (B_dData_dList.C_List__x58__x58_ ("--lang", (B_dData_dList.C_List__x58__x58_ ((o).f_CliOpts_optDiagLang, B_dData_dList.C_List_Nil)))) else B_dData_dList.C_List_Nil) in (let cascadeArgs = (if (o).f_CliOpts_optShowCascade then (B_dData_dList.C_List__x58__x58_ ("--show-cascade", B_dData_dList.C_List_Nil)) else B_dData_dList.C_List_Nil) in (let sourceArgs = (if (o).f_CliOpts_optWithSources then (B_dData_dList.C_List__x58__x58_ ("--with-sources", B_dData_dList.C_List_Nil)) else B_dData_dList.C_List_Nil) in (let failFastArgs = (if (o).f_CliOpts_optFailFast then (B_dData_dList.C_List__x58__x58_ ("--fail-fast", B_dData_dList.C_List_Nil)) else B_dData_dList.C_List_Nil) in (let maxArgs = (if ((o).f_CliOpts_optMaxErrors > 0) then (B_dData_dList.C_List__x58__x58_ ("--max-errors", (B_dData_dList.C_List__x58__x58_ ((bi_strFromInt (o).f_CliOpts_optMaxErrors), B_dData_dList.C_List_Nil)))) else B_dData_dList.C_List_Nil) in ((B_dData_dList.v_append base3) ((B_dData_dList.v_append langArgs) ((B_dData_dList.v_append maxArgs) ((B_dData_dList.v_append cascadeArgs) ((B_dData_dList.v_append sourceArgs) failFastArgs)))))))))))))))

# 938 "Vuna/Compiler/Driver/CompilerCli.vuna"
let v_isMachineFormat = (fun (f : string) -> (if (f = "json") then true else (f = "sarif")))

# 997 "Vuna/Compiler/Driver/CompilerCli.vuna"
let rec v_depsReadyList = (fun (mc0 : string B_dData_dList.t_List) (mc1 : string B_dData_dList.t_List) (mc2 : Frontend_dPackages_dPkg.t_Package B_dData_dList.t_List) -> (match mc2 with
  | B_dData_dList.C_List__x58__x58_ (dtb__67, dtb__68) -> (let isMember = ((B_dData_dList.v_memName (Frontend_dPackages_dPkg.v_packageName dtb__67)) mc0) in (let isDone = ((B_dData_dList.v_memName (Frontend_dPackages_dPkg.v_packageName dtb__67)) mc1) in (if (if (B_dData_dBool.v_not isMember) then true else isDone) then (((v_depsReadyList mc0) mc1) dtb__68) else false)))
  | B_dData_dList.C_List_Nil -> true
  | _ -> failwith "DT: impossible branch"
))

# 994 "Vuna/Compiler/Driver/CompilerCli.vuna"
let v_depsReady = (fun (memberNames : string B_dData_dList.t_List) (done_ : string B_dData_dList.t_List) (pkg : Frontend_dPackages_dPkg.t_Package) -> (((v_depsReadyList memberNames) done_) (pkg).Frontend_dPackages_dPkg.f_Package_packageDependencies))

# 1030 "Vuna/Compiler/Driver/CompilerCli.vuna"
let v_isWorkspaceRoot = (fun (pkg : Frontend_dPackages_dPkg.t_Package) -> ((pkg).Frontend_dPackages_dPkg.f_Package_packageManifest).Frontend_dManifest.f_Manifest_manifestIsWorkspace)

# 1068 "Vuna/Compiler/Driver/CompilerCli.vuna"
let rec v_countFailures = (fun (mc0 : int) (mc1 : int B_dData_dList.t_List) -> (match mc1 with
  | B_dData_dList.C_List__x58__x58_ (dtb__69, dtb__70) -> (if (dtb__69 = 0) then ((v_countFailures mc0) dtb__70) else ((v_countFailures 1) dtb__70))
  | B_dData_dList.C_List_Nil -> mc0
  | _ -> failwith "DT: impossible branch"
))

# 1006 "Vuna/Compiler/Driver/CompilerCli.vuna"
let v_checkMembersParallel = (fun (nFs : string) (nConsole : string) (nClock : string) (nEnv : string) (nProcess : string) (nExit : string) (nArgs : string) (mc0 : Frontend_dPackages_dPkg.t_Package B_dData_dList.t_List) (mc1 : int) (mc2 : t_CliOpts) -> (match mc0 with
  | B_dData_dList.C_List_Nil -> ((B_dTrait_dApplicative.v_pure B_dEffect_dCore.v_Applicative_u19070277251d295b_uBase_x36_46_x36_Effect_x36_46_x36_Core_x36_46_x36_Eff_ur) { B_dData_dPair.f_Pair_first = mc1; B_dData_dPair.f_Pair_second = mc2 })
  | _ -> (((B_dTrait_dMonad.v__x62__x62__x61_ B_dEffect_dCore.v_Monad_ucc99eea03f4e7df1_uBase_x36_46_x36_Effect_x36_46_x36_Core_x36_46_x36_Eff_ur) ((v_mapEff (fun (pkg : Frontend_dPackages_dPkg.t_Package) -> (((B_dTrait_dMonad.v__x62__x62__x61_ B_dEffect_dCore.v_Monad_ucc99eea03f4e7df1_uBase_x36_46_x36_Effect_x36_46_x36_Core_x36_46_x36_Eff_ur) ((B_dEffect_dProcess.v_processSpawn nProcess) ((v_checkSpawnArgs mc2) (Frontend_dPackages_dPkg.v_packageDir pkg)))) (fun pid -> ((B_dTrait_dApplicative.v_pure B_dEffect_dCore.v_Applicative_u19070277251d295b_uBase_x36_46_x36_Effect_x36_46_x36_Core_x36_46_x36_Eff_ur) { B_dData_dPair.f_Pair_first = pkg; B_dData_dPair.f_Pair_second = pid }))))) mc0)) (fun started -> (((B_dTrait_dMonad.v__x62__x62__x61_ B_dEffect_dCore.v_Monad_ucc99eea03f4e7df1_uBase_x36_46_x36_Effect_x36_46_x36_Core_x36_46_x36_Eff_ur) ((v_mapEff (fun (pr : (Frontend_dPackages_dPkg.t_Package, int) B_dData_dPair.t_Pair) -> ((B_dEffect_dProcess.v_processWait nProcess) (B_dData_dPair.v_secondOf pr)))) started)) (fun codes -> ((B_dTrait_dApplicative.v_pure B_dEffect_dCore.v_Applicative_u19070277251d295b_uBase_x36_46_x36_Effect_x36_46_x36_Core_x36_46_x36_Eff_ur) { B_dData_dPair.f_Pair_first = ((v_countFailures mc1) codes); B_dData_dPair.f_Pair_second = mc2 })))))
))

# 976 "Vuna/Compiler/Driver/CompilerCli.vuna"
let rec v_checkMembersByLevel = (fun (nFs : string) (nConsole : string) (nClock : string) (nEnv : string) (nProcess : string) (nExit : string) (nArgs : string) (fuel : int) (pending : Frontend_dPackages_dPkg.t_Package B_dData_dList.t_List) (memberNames : string B_dData_dList.t_List) (done_ : string B_dData_dList.t_List) (code : int) (o : t_CliOpts) -> (if ((B_dData_dList.v_length pending) = 0) then ((B_dTrait_dApplicative.v_pure B_dEffect_dCore.v_Applicative_u19070277251d295b_uBase_x36_46_x36_Effect_x36_46_x36_Core_x36_46_x36_Eff_ur) { B_dData_dPair.f_Pair_first = code; B_dData_dPair.f_Pair_second = o }) else (if (fuel <= 0) then ((((((((((v_checkMembersParallel nFs) nConsole) nClock) nEnv) nProcess) nExit) nArgs) pending) code) o) else (let ready = ((B_dData_dList.v_filter (fun (p : Frontend_dPackages_dPkg.t_Package) -> (((v_depsReady memberNames) done_) p))) pending) in (let rest = ((B_dData_dList.v_filter (fun (p : Frontend_dPackages_dPkg.t_Package) -> (B_dData_dBool.v_not (((v_depsReady memberNames) done_) p)))) pending) in (if ((B_dData_dList.v_length ready) = 0) then ((((((((((v_checkMembersParallel nFs) nConsole) nClock) nEnv) nProcess) nExit) nArgs) pending) code) o) else (((B_dTrait_dMonad.v__x62__x62__x61_ B_dEffect_dCore.v_Monad_ucc99eea03f4e7df1_uBase_x36_46_x36_Effect_x36_46_x36_Core_x36_46_x36_Eff_ur) ((((((((((v_checkMembersParallel nFs) nConsole) nClock) nEnv) nProcess) nExit) nArgs) ready) code) o)) (fun r -> (((((((((((((v_checkMembersByLevel nFs) nConsole) nClock) nEnv) nProcess) nExit) nArgs) (fuel - 1)) rest) memberNames) ((B_dData_dList.v_append done_) ((B_dData_dList.v_map Frontend_dPackages_dPkg.v_packageName) ready))) (B_dData_dPair.v_firstOf r)) (B_dData_dPair.v_secondOf r))))))))))

# 1224 "Vuna/Compiler/Driver/CompilerCli.vuna"
let v_workspaceMultiOut = (fun (workspace : Frontend_dPackages_dPkg.t_Workspace) -> (match (workspace).Frontend_dPackages_dPkg.f_Workspace_workspaceRoot with
  | B_dData_dMaybe.C_Maybe_Just (dtb__71) -> (v_isWorkspaceRoot dtb__71)
  | B_dData_dMaybe.C_Maybe_Nothing -> true
  | _ -> failwith "DT: impossible branch"
))

# 1232 "Vuna/Compiler/Driver/CompilerCli.vuna"
let v_isSingleLibraryPackage = (fun (nFs : string) (mc0 : Frontend_dPackages_dPkg.t_Package B_dData_dList.t_List) -> (match mc0 with
  | B_dData_dList.C_List__x58__x58_ (dtb__72, dtb__73) -> (match dtb__73 with
  | B_dData_dList.C_List_Nil -> (((B_dTrait_dMonad.v__x62__x62__x61_ B_dEffect_dCore.v_Monad_ucc99eea03f4e7df1_uBase_x36_46_x36_Effect_x36_46_x36_Core_x36_46_x36_Eff_ur) ((B_dEffect_dFs.v_fsFileExists nFs) (Frontend_dPackages_dPkg.v_packageEntry dtb__72))) (fun exists -> ((B_dTrait_dApplicative.v_pure B_dEffect_dCore.v_Applicative_u19070277251d295b_uBase_x36_46_x36_Effect_x36_46_x36_Core_x36_46_x36_Eff_ur) (B_dData_dBool.v_not exists))))
  | _ -> ((B_dTrait_dApplicative.v_pure B_dEffect_dCore.v_Applicative_u19070277251d295b_uBase_x36_46_x36_Effect_x36_46_x36_Core_x36_46_x36_Eff_ur) false)
)
  | _ -> ((B_dTrait_dApplicative.v_pure B_dEffect_dCore.v_Applicative_u19070277251d295b_uBase_x36_46_x36_Effect_x36_46_x36_Core_x36_46_x36_Eff_ur) false)
))

# 1239 "Vuna/Compiler/Driver/CompilerCli.vuna"
let v_libraryOnlyMessage = (fun (mc0 : Frontend_dPackages_dPkg.t_Package B_dData_dList.t_List) -> (match mc0 with
  | B_dData_dList.C_List_Nil -> "no package to build"
  | B_dData_dList.C_List__x58__x58_ (dtb__74, dtb__75) -> (String.concat "" ["library package "; (Frontend_dPackages_dPkg.v_packageName dtb__74); " has no app/Main.vuna (an executable package is required; use check for libraries)"])
  | _ -> failwith "DT: impossible branch"
))

# 1251 "Vuna/Compiler/Driver/CompilerCli.vuna"
let rec v_findPackageByName = (fun (mc0 : string) (mc1 : Frontend_dPackages_dPkg.t_Package B_dData_dList.t_List) -> (match mc1 with
  | B_dData_dList.C_List__x58__x58_ (dtb__76, dtb__77) -> (if ((Frontend_dPackages_dPkg.v_packageName dtb__76) = mc0) then (B_dData_dMaybe.C_Maybe_Just (dtb__76)) else ((v_findPackageByName mc0) dtb__77))
  | B_dData_dList.C_List_Nil -> B_dData_dMaybe.C_Maybe_Nothing
  | _ -> failwith "DT: impossible branch"
))

# 1244 "Vuna/Compiler/Driver/CompilerCli.vuna"
let v_selectBuildTargets = (fun (mc0 : string B_dData_dMaybe.t_Maybe) (mc1 : Frontend_dPackages_dPkg.t_Package B_dData_dList.t_List) -> (match mc0 with
  | B_dData_dMaybe.C_Maybe_Just (dtb__78) -> (match ((v_findPackageByName dtb__78) mc1) with
  | B_dData_dMaybe.C_Maybe_Nothing -> (Base_dDiag.v_err ("no such package in workspace: " ^ dtb__78))
  | B_dData_dMaybe.C_Maybe_Just (dtb__79) -> (Base_dDiag.C_Check_OkC ((B_dData_dList.C_List__x58__x58_ (dtb__79, B_dData_dList.C_List_Nil))))
  | _ -> failwith "DT: impossible branch"
)
  | B_dData_dMaybe.C_Maybe_Nothing -> (Base_dDiag.C_Check_OkC (mc1))
  | _ -> failwith "DT: impossible branch"
))

# 1268 "Vuna/Compiler/Driver/CompilerCli.vuna"
let v_buildNativeOne = (fun (nFs : string) (nConsole : string) (nEnv : string) (nProcess : string) (noCompile : bool) (multiOut : bool) (outM : string B_dData_dMaybe.t_Maybe) (pkg : Frontend_dPackages_dPkg.t_Package) (o : t_CliOpts) -> (let name = (Frontend_dPackages_dPkg.v_packageName pkg) in (let outDir = (match outM with
  | B_dData_dMaybe.C_Maybe_Just (dtb__82) -> (if multiOut then (String.concat "" [dtb__82; "/"; name]) else dtb__82)
  | B_dData_dMaybe.C_Maybe_Nothing -> ((Frontend_dPackages_dPkg.v_packageDir pkg) ^ "/.output")
  | _ -> failwith "DT: impossible branch"
) in (let scriptPath = (outDir ^ "/build.sh") in (let binDir = (outDir ^ "/bin") in (let binPath = (String.concat "" [binDir; "/"; name]) in (((B_dTrait_dMonad.v__x62__x62__x61_ B_dEffect_dCore.v_Monad_ucc99eea03f4e7df1_uBase_x36_46_x36_Effect_x36_46_x36_Core_x36_46_x36_Eff_ur) ((((((((Driver_dTarget.v_compileBackend nFs) nEnv) nProcess) ((Frontend_dPackages_dPkg.v_contextWithRelease (o).f_CliOpts_optRelease) (Frontend_dPackages_dPkg.v_packageContext pkg))) "native") (Frontend_dPackages_dPkg.v_packageEntry pkg)) true) outDir)) (fun r -> (match r with
  | Base_dDiag.C_Check_ErrC (dtb__80) -> ((((v_printDiag nFs) nConsole) o) dtb__80)
  | Base_dDiag.C_Check_OkC (dtb__81) -> (let files = (B_dData_dPair.v_firstOf dtb__81) in (((B_dTrait_dMonad.v__x62__x62__x61_ B_dEffect_dCore.v_Monad_ucc99eea03f4e7df1_uBase_x36_46_x36_Effect_x36_46_x36_Core_x36_46_x36_Eff_ur) (((B_dEffect_dFs.v_fsWriteFile nFs) scriptPath) ((Driver_dTargetBuild.v_nativeBuildScript name) files))) (fun _u -> (if noCompile then (((B_dTrait_dMonad.v__x62__x62__x61_ B_dEffect_dCore.v_Monad_ucc99eea03f4e7df1_uBase_x36_46_x36_Effect_x36_46_x36_Core_x36_46_x36_Eff_ur) ((B_dEffect_dConsole.v_consolePrint nConsole) (String.concat "" ["wrote "; scriptPath; "\n"]))) (fun _u -> ((B_dTrait_dApplicative.v_pure B_dEffect_dCore.v_Applicative_u19070277251d295b_uBase_x36_46_x36_Effect_x36_46_x36_Core_x36_46_x36_Eff_ur) { B_dData_dPair.f_Pair_first = 0; B_dData_dPair.f_Pair_second = o }))) else (((B_dTrait_dMonad.v__x62__x62__x61_ B_dEffect_dCore.v_Monad_ucc99eea03f4e7df1_uBase_x36_46_x36_Effect_x36_46_x36_Core_x36_46_x36_Eff_ur) (((Driver_dCompile.v_ensureDirPath nFs) nProcess) binDir)) (fun _u -> (((B_dTrait_dMonad.v__x62__x62__x61_ B_dEffect_dCore.v_Monad_ucc99eea03f4e7df1_uBase_x36_46_x36_Effect_x36_46_x36_Core_x36_46_x36_Eff_ur) (((B_dEffect_dProcess.v_processRunIn nProcess) outDir) (B_dData_dList.C_List__x58__x58_ ("sh", (B_dData_dList.C_List__x58__x58_ ("build.sh", B_dData_dList.C_List_Nil)))))) (fun code -> (if (code = 0) then (((B_dTrait_dMonad.v__x62__x62__x61_ B_dEffect_dCore.v_Monad_ucc99eea03f4e7df1_uBase_x36_46_x36_Effect_x36_46_x36_Core_x36_46_x36_Eff_ur) ((B_dEffect_dConsole.v_consolePrint nConsole) (String.concat "" ["wrote "; binPath; "\n"]))) (fun _u -> ((B_dTrait_dApplicative.v_pure B_dEffect_dCore.v_Applicative_u19070277251d295b_uBase_x36_46_x36_Effect_x36_46_x36_Core_x36_46_x36_Eff_ur) { B_dData_dPair.f_Pair_first = 0; B_dData_dPair.f_Pair_second = o }))) else (((B_dTrait_dMonad.v__x62__x62__x61_ B_dEffect_dCore.v_Monad_ucc99eea03f4e7df1_uBase_x36_46_x36_Effect_x36_46_x36_Core_x36_46_x36_Eff_ur) ((B_dEffect_dConsole.v_consolePrint nConsole) (String.concat "" ["native link failed: cc exited "; (bi_strFromInt code); "\n"]))) (fun _u -> ((B_dTrait_dApplicative.v_pure B_dEffect_dCore.v_Applicative_u19070277251d295b_uBase_x36_46_x36_Effect_x36_46_x36_Core_x36_46_x36_Eff_ur) { B_dData_dPair.f_Pair_first = 1; B_dData_dPair.f_Pair_second = o }))))))))))))
  | _ -> failwith "DT: impossible branch"
)))))))))

# 1360 "Vuna/Compiler/Driver/CompilerCli.vuna"
let v_wasmBuildScript = (fun (optLevel : int) -> (let assemble = "wasm-tools parse main.wat -o main.wasm\n" in (if (optLevel <= 0) then ("#!/bin/sh\nset -eu\ncd \"$(dirname \"$0\")\"\n" ^ assemble) else (let features = "--enable-gc --enable-bulk-memory --enable-tail-call --enable-reference-types" in (let level = (bi_strFromInt optLevel) in (let optimize = (String.concat "" ["if ! wasm-opt "; features; " -g -O"; level; " main.wasm -o main.wasm.tmp 2>opt.log; then\n  cat opt.log >&2\n  rm -f opt.log main.wasm.tmp\n  exit 1\nfi\nrm -f opt.log\nmv main.wasm.tmp main.wasm\n"]) in (String.concat "" ["#!/bin/sh\nset -eu\ncd \"$(dirname \"$0\")\"\n"; assemble; optimize])))))))

# 1492 "Vuna/Compiler/Driver/CompilerCli.vuna"
let rec v_waitView = (fun (nFs : string) (nClock : string) (nEnv : string) (nProcess : string) (kind : string) (digest : string) (fuel : int) -> (((B_dTrait_dMonad.v__x62__x62__x61_ B_dEffect_dCore.v_Monad_ucc99eea03f4e7df1_uBase_x36_46_x36_Effect_x36_46_x36_Core_x36_46_x36_Eff_ur) ((((((Base_dStore.v_storeViewLockEff nFs) nClock) nEnv) nProcess) kind) digest)) (fun ok -> (if ok then ((B_dTrait_dApplicative.v_pure B_dEffect_dCore.v_Applicative_u19070277251d295b_uBase_x36_46_x36_Effect_x36_46_x36_Core_x36_46_x36_Eff_ur) "locked") else (((B_dTrait_dMonad.v__x62__x62__x61_ B_dEffect_dCore.v_Monad_ucc99eea03f4e7df1_uBase_x36_46_x36_Effect_x36_46_x36_Core_x36_46_x36_Eff_ur) (((((Base_dStore.v_storeViewValidEff nFs) nEnv) nProcess) kind) digest)) (fun valid -> (if valid then ((B_dTrait_dApplicative.v_pure B_dEffect_dCore.v_Applicative_u19070277251d295b_uBase_x36_46_x36_Effect_x36_46_x36_Core_x36_46_x36_Eff_ur) "ready") else (if (fuel <= 0) then ((B_dTrait_dApplicative.v_pure B_dEffect_dCore.v_Applicative_u19070277251d295b_uBase_x36_46_x36_Effect_x36_46_x36_Core_x36_46_x36_Eff_ur) "timeout") else (((B_dTrait_dMonad.v__x62__x62__x61_ B_dEffect_dCore.v_Monad_ucc99eea03f4e7df1_uBase_x36_46_x36_Effect_x36_46_x36_Core_x36_46_x36_Eff_ur) ((B_dEffect_dClock.v_clockSleepMicros nClock) 100000)) (fun _u -> (((((((v_waitView nFs) nClock) nEnv) nProcess) kind) digest) (fuel - 1))))))))))))

# 1510 "Vuna/Compiler/Driver/CompilerCli.vuna"
let v_markViewComplete = (fun (nFs : string) (dir : string) (digest : string) -> (((B_dEffect_dFs.v_fsWriteFileAtomic nFs) (dir ^ "/.complete")) digest))

# 1516 "Vuna/Compiler/Driver/CompilerCli.vuna"
let v_linkDefaultOutput = (fun (nFs : string) (mc0 : string B_dData_dMaybe.t_Maybe) (mc1 : Frontend_dPackages_dPkg.t_Package) (mc2 : string) (mc3 : string) -> (match mc0 with
  | B_dData_dMaybe.C_Maybe_Nothing -> (let link = ((Frontend_dPackages_dPkg.v_packageDir mc1) ^ "/.output") in (((B_dTrait_dMonad.v__x62__x62__x61_ B_dEffect_dCore.v_Monad_ucc99eea03f4e7df1_uBase_x36_46_x36_Effect_x36_46_x36_Core_x36_46_x36_Eff_ur) ((B_dEffect_dFs.v_fsRemoveTree nFs) link)) (fun _u -> (((B_dEffect_dFs.v_fsSymlink nFs) mc2) link))))
  | B_dData_dMaybe.C_Maybe_Just (dtb__83) -> ((B_dTrait_dApplicative.v_pure B_dEffect_dCore.v_Applicative_u19070277251d295b_uBase_x36_46_x36_Effect_x36_46_x36_Core_x36_46_x36_Eff_ur) 0)
  | _ -> failwith "DT: impossible branch"
))

# 1526 "Vuna/Compiler/Driver/CompilerCli.vuna"
let v_compileCodegen = (fun (nFs : string) (nConsole : string) (nClock : string) (nEnv : string) (nProcess : string) (ctx : Frontend_dPackages_dPkg.t_PackageContext) (entry : string) (outDir : string) (o : t_CliOpts) -> (((B_dTrait_dMonad.v__x62__x62__x61_ B_dEffect_dCore.v_Monad_ucc99eea03f4e7df1_uBase_x36_46_x36_Effect_x36_46_x36_Core_x36_46_x36_Eff_ur) (((((((((Driver_dCompile.v_compileToDir nFs) nConsole) nClock) nEnv) nProcess) ctx) entry) true) outDir)) (fun r -> (match r with
  | Base_dDiag.C_Check_ErrC (dtb__84) -> ((((v_printDiag nFs) nConsole) o) dtb__84)
  | Base_dDiag.C_Check_OkC (dtb__85) -> ((B_dTrait_dApplicative.v_pure B_dEffect_dCore.v_Applicative_u19070277251d295b_uBase_x36_46_x36_Effect_x36_46_x36_Core_x36_46_x36_Eff_ur) { B_dData_dPair.f_Pair_first = 0; B_dData_dPair.f_Pair_second = o })
  | _ -> failwith "DT: impossible branch"
))))

# 1536 "Vuna/Compiler/Driver/CompilerCli.vuna"
let v_buildLinked = (fun (nFs : string) (nConsole : string) (nProcess : string) (ctx : Frontend_dPackages_dPkg.t_PackageContext) (entry : string) (outDir : string) (name : string) (o : t_CliOpts) -> (((B_dTrait_dMonad.v__x62__x62__x61_ B_dEffect_dCore.v_Monad_ucc99eea03f4e7df1_uBase_x36_46_x36_Effect_x36_46_x36_Core_x36_46_x36_Eff_ur) (((Driver_dCompile.v_ensureDirPath nFs) nProcess) (outDir ^ "/bin"))) (fun _u -> (((B_dTrait_dMonad.v__x62__x62__x61_ B_dEffect_dCore.v_Monad_ucc99eea03f4e7df1_uBase_x36_46_x36_Effect_x36_46_x36_Core_x36_46_x36_Eff_ur) ((((Driver_dCompile.v_runBuildScript nProcess) outDir) ("bin/" ^ name)) name)) (fun r -> (match r with
  | Base_dDiag.C_Check_ErrC (dtb__86) -> ((((v_printDiag nFs) nConsole) o) dtb__86)
  | Base_dDiag.C_Check_OkC (dtb__87) -> (((B_dTrait_dMonad.v__x62__x62__x61_ B_dEffect_dCore.v_Monad_ucc99eea03f4e7df1_uBase_x36_46_x36_Effect_x36_46_x36_Core_x36_46_x36_Eff_ur) (((((Driver_dCompile.v_writeBuildMeta nFs) outDir) ctx) entry) true)) (fun _u -> (((B_dTrait_dMonad.v__x62__x62__x61_ B_dEffect_dCore.v_Monad_ucc99eea03f4e7df1_uBase_x36_46_x36_Effect_x36_46_x36_Core_x36_46_x36_Eff_ur) ((B_dEffect_dConsole.v_consolePrint nConsole) (String.concat "" ["built "; outDir; "/bin/"; name; "\n"]))) (fun _u -> ((B_dTrait_dApplicative.v_pure B_dEffect_dCore.v_Applicative_u19070277251d295b_uBase_x36_46_x36_Effect_x36_46_x36_Core_x36_46_x36_Eff_ur) { B_dData_dPair.f_Pair_first = 0; B_dData_dPair.f_Pair_second = o })))))
  | _ -> failwith "DT: impossible branch"
))))))

# 1411 "Vuna/Compiler/Driver/CompilerCli.vuna"
let v_buildExplicit = (fun (nFs : string) (nConsole : string) (nClock : string) (nEnv : string) (nProcess : string) (out : string) (multiOut : bool) (pkg : Frontend_dPackages_dPkg.t_Package) (ctx : Frontend_dPackages_dPkg.t_PackageContext) (entry : string) (o : t_CliOpts) -> (let name = (Frontend_dPackages_dPkg.v_packageName pkg) in (let outDir = (if multiOut then (String.concat "" [out; "/"; name]) else out) in (let binPath = (String.concat "" [outDir; "/bin/"; name]) in (((B_dTrait_dMonad.v__x62__x62__x61_ B_dEffect_dCore.v_Monad_ucc99eea03f4e7df1_uBase_x36_46_x36_Effect_x36_46_x36_Core_x36_46_x36_Eff_ur) (((((Driver_dCompile.v_metaUpToDate nFs) outDir) ctx) entry) binPath)) (fun fresh -> (if fresh then (((B_dTrait_dMonad.v__x62__x62__x61_ B_dEffect_dCore.v_Monad_ucc99eea03f4e7df1_uBase_x36_46_x36_Effect_x36_46_x36_Core_x36_46_x36_Eff_ur) ((B_dEffect_dConsole.v_consolePrint nConsole) (String.concat "" ["up to date: "; binPath; "\n"]))) (fun _u -> ((B_dTrait_dApplicative.v_pure B_dEffect_dCore.v_Applicative_u19070277251d295b_uBase_x36_46_x36_Effect_x36_46_x36_Core_x36_46_x36_Eff_ur) { B_dData_dPair.f_Pair_first = 0; B_dData_dPair.f_Pair_second = o }))) else (((B_dTrait_dMonad.v__x62__x62__x61_ B_dEffect_dCore.v_Monad_ucc99eea03f4e7df1_uBase_x36_46_x36_Effect_x36_46_x36_Core_x36_46_x36_Eff_ur) (((((((((Driver_dCompile.v_compileToDir nFs) nConsole) nClock) nEnv) nProcess) ctx) entry) true) outDir)) (fun r -> (match r with
  | Base_dDiag.C_Check_ErrC (dtb__88) -> ((((v_printDiag nFs) nConsole) o) dtb__88)
  | Base_dDiag.C_Check_OkC (dtb__89) -> ((((((((v_buildLinked nFs) nConsole) nProcess) ctx) entry) outDir) name) o)
  | _ -> failwith "DT: impossible branch"
))))))))))

# 1432 "Vuna/Compiler/Driver/CompilerCli.vuna"
let v_buildDefaultView = (fun (nFs : string) (nConsole : string) (nClock : string) (nEnv : string) (nProcess : string) (inputs : Driver_dCompile.t_SplitInputs) (ctx : Frontend_dPackages_dPkg.t_PackageContext) (pkg : Frontend_dPackages_dPkg.t_Package) (name : string) (entry : string) (viewDigest : string) (o : t_CliOpts) -> (((B_dTrait_dMonad.v__x62__x62__x61_ B_dEffect_dCore.v_Monad_ucc99eea03f4e7df1_uBase_x36_46_x36_Effect_x36_46_x36_Core_x36_46_x36_Eff_ur) (((((Base_dStore.v_storeViewPathEff nFs) nEnv) nProcess) "bin") viewDigest)) (fun view -> (let binPath = (String.concat "" [view; "/bin/"; name]) in (((B_dTrait_dMonad.v__x62__x62__x61_ B_dEffect_dCore.v_Monad_ucc99eea03f4e7df1_uBase_x36_46_x36_Effect_x36_46_x36_Core_x36_46_x36_Eff_ur) (((((Base_dStore.v_storeViewValidEff nFs) nEnv) nProcess) "bin") viewDigest)) (fun valid -> (((B_dTrait_dMonad.v__x62__x62__x61_ B_dEffect_dCore.v_Monad_ucc99eea03f4e7df1_uBase_x36_46_x36_Effect_x36_46_x36_Core_x36_46_x36_Eff_ur) (if valid then (((((Driver_dCompile.v_metaUpToDate nFs) view) ctx) entry) binPath) else ((B_dTrait_dApplicative.v_pure B_dEffect_dCore.v_Applicative_u19070277251d295b_uBase_x36_46_x36_Effect_x36_46_x36_Core_x36_46_x36_Eff_ur) false))) (fun fresh -> (if fresh then (((B_dTrait_dMonad.v__x62__x62__x61_ B_dEffect_dCore.v_Monad_ucc99eea03f4e7df1_uBase_x36_46_x36_Effect_x36_46_x36_Core_x36_46_x36_Eff_ur) (((((v_linkDefaultOutput nFs) B_dData_dMaybe.C_Maybe_Nothing) pkg) view) viewDigest)) (fun _u -> (((B_dTrait_dMonad.v__x62__x62__x61_ B_dEffect_dCore.v_Monad_ucc99eea03f4e7df1_uBase_x36_46_x36_Effect_x36_46_x36_Core_x36_46_x36_Eff_ur) ((B_dEffect_dConsole.v_consolePrint nConsole) (String.concat "" ["up to date: "; binPath; "\n"]))) (fun _u -> ((B_dTrait_dApplicative.v_pure B_dEffect_dCore.v_Applicative_u19070277251d295b_uBase_x36_46_x36_Effect_x36_46_x36_Core_x36_46_x36_Eff_ur) { B_dData_dPair.f_Pair_first = 0; B_dData_dPair.f_Pair_second = o }))))) else (((B_dTrait_dMonad.v__x62__x62__x61_ B_dEffect_dCore.v_Monad_ucc99eea03f4e7df1_uBase_x36_46_x36_Effect_x36_46_x36_Core_x36_46_x36_Eff_ur) (((((((v_waitView nFs) nClock) nEnv) nProcess) "bin") viewDigest) 600)) (fun state -> (if (state = "locked") then (((B_dTrait_dMonad.v__x62__x62__x61_ B_dEffect_dCore.v_Monad_ucc99eea03f4e7df1_uBase_x36_46_x36_Effect_x36_46_x36_Core_x36_46_x36_Eff_ur) (((((Base_dStore.v_storeViewValidEff nFs) nEnv) nProcess) "bin") viewDigest)) (fun valid2 -> (((B_dTrait_dMonad.v__x62__x62__x61_ B_dEffect_dCore.v_Monad_ucc99eea03f4e7df1_uBase_x36_46_x36_Effect_x36_46_x36_Core_x36_46_x36_Eff_ur) (if valid2 then (((((Driver_dCompile.v_metaUpToDate nFs) view) ctx) entry) binPath) else ((B_dTrait_dApplicative.v_pure B_dEffect_dCore.v_Applicative_u19070277251d295b_uBase_x36_46_x36_Effect_x36_46_x36_Core_x36_46_x36_Eff_ur) false))) (fun fresh2 -> (if fresh2 then (((B_dTrait_dMonad.v__x62__x62__x61_ B_dEffect_dCore.v_Monad_ucc99eea03f4e7df1_uBase_x36_46_x36_Effect_x36_46_x36_Core_x36_46_x36_Eff_ur) (((((v_linkDefaultOutput nFs) B_dData_dMaybe.C_Maybe_Nothing) pkg) view) viewDigest)) (fun _u -> (((B_dTrait_dMonad.v__x62__x62__x61_ B_dEffect_dCore.v_Monad_ucc99eea03f4e7df1_uBase_x36_46_x36_Effect_x36_46_x36_Core_x36_46_x36_Eff_ur) (((((Base_dStore.v_storeViewUnlockEff nFs) nEnv) nProcess) "bin") viewDigest)) (fun _u -> (((B_dTrait_dMonad.v__x62__x62__x61_ B_dEffect_dCore.v_Monad_ucc99eea03f4e7df1_uBase_x36_46_x36_Effect_x36_46_x36_Core_x36_46_x36_Eff_ur) ((B_dEffect_dConsole.v_consolePrint nConsole) (String.concat "" ["up to date: "; binPath; "\n"]))) (fun _u -> ((B_dTrait_dApplicative.v_pure B_dEffect_dCore.v_Applicative_u19070277251d295b_uBase_x36_46_x36_Effect_x36_46_x36_Core_x36_46_x36_Eff_ur) { B_dData_dPair.f_Pair_first = 0; B_dData_dPair.f_Pair_second = o }))))))) else (((B_dTrait_dMonad.v__x62__x62__x61_ B_dEffect_dCore.v_Monad_ucc99eea03f4e7df1_uBase_x36_46_x36_Effect_x36_46_x36_Core_x36_46_x36_Eff_ur) ((((((((((Driver_dCompile.v_compileToDirGiven nFs) nConsole) nClock) nEnv) nProcess) inputs) ctx) entry) true) view)) (fun r -> (match r with
  | Base_dDiag.C_Check_ErrC (dtb__90) -> (((B_dTrait_dMonad.v__x62__x62__x61_ B_dEffect_dCore.v_Monad_ucc99eea03f4e7df1_uBase_x36_46_x36_Effect_x36_46_x36_Core_x36_46_x36_Eff_ur) ((B_dEffect_dFs.v_fsRemoveTree nFs) view)) (fun _u -> (((B_dTrait_dMonad.v__x62__x62__x61_ B_dEffect_dCore.v_Monad_ucc99eea03f4e7df1_uBase_x36_46_x36_Effect_x36_46_x36_Core_x36_46_x36_Eff_ur) (((((Base_dStore.v_storeViewUnlockEff nFs) nEnv) nProcess) "bin") viewDigest)) (fun _u -> ((((v_printDiag nFs) nConsole) o) dtb__90)))))
  | Base_dDiag.C_Check_OkC (dtb__91) -> (((B_dTrait_dMonad.v__x62__x62__x61_ B_dEffect_dCore.v_Monad_ucc99eea03f4e7df1_uBase_x36_46_x36_Effect_x36_46_x36_Core_x36_46_x36_Eff_ur) ((((((((v_buildLinked nFs) nConsole) nProcess) ctx) entry) view) name) o)) (fun br -> (if ((B_dData_dPair.v_firstOf br) = 0) then (((B_dTrait_dMonad.v__x62__x62__x61_ B_dEffect_dCore.v_Monad_ucc99eea03f4e7df1_uBase_x36_46_x36_Effect_x36_46_x36_Core_x36_46_x36_Eff_ur) (((v_markViewComplete nFs) view) viewDigest)) (fun _u -> (((B_dTrait_dMonad.v__x62__x62__x61_ B_dEffect_dCore.v_Monad_ucc99eea03f4e7df1_uBase_x36_46_x36_Effect_x36_46_x36_Core_x36_46_x36_Eff_ur) (((((v_linkDefaultOutput nFs) B_dData_dMaybe.C_Maybe_Nothing) pkg) view) viewDigest)) (fun _u -> (((B_dTrait_dMonad.v__x62__x62__x61_ B_dEffect_dCore.v_Monad_ucc99eea03f4e7df1_uBase_x36_46_x36_Effect_x36_46_x36_Core_x36_46_x36_Eff_ur) (((((Base_dStore.v_storeViewUnlockEff nFs) nEnv) nProcess) "bin") viewDigest)) (fun _u -> ((B_dTrait_dApplicative.v_pure B_dEffect_dCore.v_Applicative_u19070277251d295b_uBase_x36_46_x36_Effect_x36_46_x36_Core_x36_46_x36_Eff_ur) br))))))) else (((B_dTrait_dMonad.v__x62__x62__x61_ B_dEffect_dCore.v_Monad_ucc99eea03f4e7df1_uBase_x36_46_x36_Effect_x36_46_x36_Core_x36_46_x36_Eff_ur) (((((Base_dStore.v_storeViewUnlockEff nFs) nEnv) nProcess) "bin") viewDigest)) (fun _u -> ((B_dTrait_dApplicative.v_pure B_dEffect_dCore.v_Applicative_u19070277251d295b_uBase_x36_46_x36_Effect_x36_46_x36_Core_x36_46_x36_Eff_ur) br))))))
  | _ -> failwith "DT: impossible branch"
)))))))) else (if (state = "ready") then (((B_dTrait_dMonad.v__x62__x62__x61_ B_dEffect_dCore.v_Monad_ucc99eea03f4e7df1_uBase_x36_46_x36_Effect_x36_46_x36_Core_x36_46_x36_Eff_ur) (((((v_linkDefaultOutput nFs) B_dData_dMaybe.C_Maybe_Nothing) pkg) view) viewDigest)) (fun _u -> (((B_dTrait_dMonad.v__x62__x62__x61_ B_dEffect_dCore.v_Monad_ucc99eea03f4e7df1_uBase_x36_46_x36_Effect_x36_46_x36_Core_x36_46_x36_Eff_ur) ((B_dEffect_dConsole.v_consolePrint nConsole) (String.concat "" ["up to date: "; binPath; "\n"]))) (fun _u -> ((B_dTrait_dApplicative.v_pure B_dEffect_dCore.v_Applicative_u19070277251d295b_uBase_x36_46_x36_Effect_x36_46_x36_Core_x36_46_x36_Eff_ur) { B_dData_dPair.f_Pair_first = 0; B_dData_dPair.f_Pair_second = o }))))) else (((B_dTrait_dMonad.v__x62__x62__x61_ B_dEffect_dCore.v_Monad_ucc99eea03f4e7df1_uBase_x36_46_x36_Effect_x36_46_x36_Core_x36_46_x36_Eff_ur) ((B_dEffect_dConsole.v_consolePrint nConsole) (String.concat "" ["error: timed out waiting for view "; viewDigest; "\n"]))) (fun _u -> ((B_dTrait_dApplicative.v_pure B_dEffect_dCore.v_Applicative_u19070277251d295b_uBase_x36_46_x36_Effect_x36_46_x36_Core_x36_46_x36_Eff_ur) { B_dData_dPair.f_Pair_first = 1; B_dData_dPair.f_Pair_second = o }))))))))))))))))

# 1553 "Vuna/Compiler/Driver/CompilerCli.vuna"
let v_stripDotSlash = (fun (s : string) -> (if ((B_dData_dString.v_startsWith "./") s) then (((B_dData_dString.v_substring (bi_natFromInt 2)) (bi_natFromInt ((bi_strLength s) - 2))) s) else s))

# 1094 "Vuna/Compiler/Driver/CompilerCli.vuna"
let v_isPackageEntryPath = (fun (nEnv : string) (ctx : Frontend_dPackages_dPkg.t_PackageContext) (path : string) -> (match (Frontend_dPackages_dPkg.v_contextPackageOf ctx) with
  | B_dData_dMaybe.C_Maybe_Nothing -> ((B_dTrait_dApplicative.v_pure B_dEffect_dCore.v_Applicative_u19070277251d295b_uBase_x36_46_x36_Effect_x36_46_x36_Core_x36_46_x36_Eff_ur) false)
  | B_dData_dMaybe.C_Maybe_Just (dtb__92) -> (((B_dTrait_dMonad.v__x62__x62__x61_ B_dEffect_dCore.v_Monad_ucc99eea03f4e7df1_uBase_x36_46_x36_Effect_x36_46_x36_Core_x36_46_x36_Eff_ur) ((Frontend_dPackages_dPkg.v_absolutePath nEnv) path)) (fun abs -> ((B_dTrait_dApplicative.v_pure B_dEffect_dCore.v_Applicative_u19070277251d295b_uBase_x36_46_x36_Effect_x36_46_x36_Core_x36_46_x36_Eff_ur) ((v_stripDotSlash abs) = (v_stripDotSlash (Frontend_dPackages_dPkg.v_packageEntry dtb__92))))))
  | _ -> failwith "DT: impossible branch"
))

# 1088 "Vuna/Compiler/Driver/CompilerCli.vuna"
let v_isModuleFileEntry = (fun (nFs : string) (nEnv : string) (nProcess : string) (ctx : Frontend_dPackages_dPkg.t_PackageContext) (path : string) -> (((B_dTrait_dMonad.v__x62__x62__x61_ B_dEffect_dCore.v_Monad_ucc99eea03f4e7df1_uBase_x36_46_x36_Effect_x36_46_x36_Core_x36_46_x36_Eff_ur) (((v_isPackageEntryPath nEnv) ctx) path)) (fun pkgEntry -> (if pkgEntry then ((B_dTrait_dApplicative.v_pure B_dEffect_dCore.v_Applicative_u19070277251d295b_uBase_x36_46_x36_Effect_x36_46_x36_Core_x36_46_x36_Eff_ur) false) else ((((Driver_dDt.v_dtFileHasModuleHeader nFs) nEnv) nProcess) path)))))

# 1558 "Vuna/Compiler/Driver/CompilerCli.vuna"
let v_ownedByFile = (fun (path : string) (d : Base_dDiag.t_Diagnostic) -> ((v_stripDotSlash (Base_dDiag.v_diagFileOf d)) = (v_stripDotSlash path)))

# 1105 "Vuna/Compiler/Driver/CompilerCli.vuna"
let v_checkModuleFileEntry = (fun (nFs : string) (nConsole : string) (nEnv : string) (nProcess : string) (ctx : Frontend_dPackages_dPkg.t_PackageContext) (path : string) (o : t_CliOpts) -> (((B_dTrait_dMonad.v__x62__x62__x61_ B_dEffect_dCore.v_Monad_ucc99eea03f4e7df1_uBase_x36_46_x36_Effect_x36_46_x36_Core_x36_46_x36_Eff_ur) (((((Driver_dDt.v_dtCheckModuleFile nFs) nEnv) nProcess) ctx) path)) (fun checked -> (match checked with
  | Base_dDiag.C_Check_ErrC (dtb__93) -> ((((v_printDiag nFs) nConsole) o) dtb__93)
  | Base_dDiag.C_Check_OkC (dtb__94) -> (let ws = ((B_dData_dList.v_filter (v_ownedByFile path)) (Base_dDiagnostics_dSink.v_dedupeWarnings dtb__94)) in (let shown = (if (if (o).f_CliOpts_optShowWarnings then true else (o).f_CliOpts_optDenyWarnings) then ws else B_dData_dList.C_List_Nil) in (((B_dTrait_dMonad.v__x62__x62__x61_ B_dEffect_dCore.v_Monad_ucc99eea03f4e7df1_uBase_x36_46_x36_Effect_x36_46_x36_Core_x36_46_x36_Eff_ur) (((((v_printDiagList nFs) nConsole) o) "") shown)) (fun r -> ((B_dTrait_dApplicative.v_pure B_dEffect_dCore.v_Applicative_u19070277251d295b_uBase_x36_46_x36_Effect_x36_46_x36_Core_x36_46_x36_Eff_ur) { B_dData_dPair.f_Pair_first = (if (if (o).f_CliOpts_optDenyWarnings then ((B_dData_dList.v_length ws) > 0) else false) then 1 else 0); B_dData_dPair.f_Pair_second = (B_dData_dPair.v_secondOf r) })))))
  | _ -> failwith "DT: impossible branch"
))))

# 1120 "Vuna/Compiler/Driver/CompilerCli.vuna"
let v_checkEntryFile = (fun (nFs : string) (nConsole : string) (nEnv : string) (nProcess : string) (ctx : Frontend_dPackages_dPkg.t_PackageContext) (path : string) (o : t_CliOpts) -> (((B_dTrait_dMonad.v__x62__x62__x61_ B_dEffect_dCore.v_Monad_ucc99eea03f4e7df1_uBase_x36_46_x36_Effect_x36_46_x36_Core_x36_46_x36_Eff_ur) (((((Driver_dDt.v_dtCheck nFs) nEnv) nProcess) ctx) path)) (fun checked -> (match checked with
  | Base_dDiag.C_Check_ErrC (dtb__95) -> (if (o).f_CliOpts_optContinueOnError then (((B_dTrait_dMonad.v__x62__x62__x61_ B_dEffect_dCore.v_Monad_ucc99eea03f4e7df1_uBase_x36_46_x36_Effect_x36_46_x36_Core_x36_46_x36_Eff_ur) (((((Driver_dDt.v_dtCheckRecovering nFs) nEnv) nProcess) ctx) path)) (fun recovered -> (match recovered with
  | Base_dDiag.C_Check_OkC (dtb__96) -> (let shown = ((v_takeDiags (o).f_CliOpts_optMaxErrors) dtb__96) in (((B_dTrait_dMonad.v__x62__x62__x61_ B_dEffect_dCore.v_Monad_ucc99eea03f4e7df1_uBase_x36_46_x36_Effect_x36_46_x36_Core_x36_46_x36_Eff_ur) (((((v_printDiagList nFs) nConsole) o) "") shown)) (fun r -> (if ((B_dData_dList.v_length shown) = 0) then ((((v_printDiag nFs) nConsole) (B_dData_dPair.v_secondOf r)) dtb__95) else ((B_dTrait_dApplicative.v_pure B_dEffect_dCore.v_Applicative_u19070277251d295b_uBase_x36_46_x36_Effect_x36_46_x36_Core_x36_46_x36_Eff_ur) { B_dData_dPair.f_Pair_first = 1; B_dData_dPair.f_Pair_second = (B_dData_dPair.v_secondOf r) })))))
  | Base_dDiag.C_Check_ErrC (dtb__97) -> ((((v_printDiag nFs) nConsole) o) dtb__95)
  | _ -> failwith "DT: impossible branch"
))) else ((((v_printDiag nFs) nConsole) o) dtb__95))
  | Base_dDiag.C_Check_OkC (dtb__98) -> (let ws = ((B_dData_dList.v_filter (v_ownedByFile path)) (Base_dDiagnostics_dSink.v_dedupeWarnings dtb__98)) in (let shown = (if (if (o).f_CliOpts_optShowWarnings then true else (o).f_CliOpts_optDenyWarnings) then ws else B_dData_dList.C_List_Nil) in (((B_dTrait_dMonad.v__x62__x62__x61_ B_dEffect_dCore.v_Monad_ucc99eea03f4e7df1_uBase_x36_46_x36_Effect_x36_46_x36_Core_x36_46_x36_Eff_ur) (((((v_printDiagList nFs) nConsole) o) "") shown)) (fun r -> ((B_dTrait_dApplicative.v_pure B_dEffect_dCore.v_Applicative_u19070277251d295b_uBase_x36_46_x36_Effect_x36_46_x36_Core_x36_46_x36_Eff_ur) { B_dData_dPair.f_Pair_first = (if (if (o).f_CliOpts_optDenyWarnings then ((B_dData_dList.v_length ws) > 0) else false) then 1 else 0); B_dData_dPair.f_Pair_second = (B_dData_dPair.v_secondOf r) })))))
  | _ -> failwith "DT: impossible branch"
))))

# 1072 "Vuna/Compiler/Driver/CompilerCli.vuna"
let v_checkFileEntry = (fun (nFs : string) (nConsole : string) (nEnv : string) (nProcess : string) (path : string) (o : t_CliOpts) -> (((B_dTrait_dMonad.v__x62__x62__x61_ B_dEffect_dCore.v_Monad_ucc99eea03f4e7df1_uBase_x36_46_x36_Effect_x36_46_x36_Core_x36_46_x36_Eff_ur) (((Frontend_dPackages_dPkg.v_contextForFile nFs) nEnv) path)) (fun ctxR -> (match ctxR with
  | Base_dDiag.C_Check_ErrC (dtb__99) -> ((((v_printDiag nFs) nConsole) o) dtb__99)
  | Base_dDiag.C_Check_OkC (dtb__100) -> (let ctx = ((Frontend_dPackages_dPkg.v_contextWithRelease (o).f_CliOpts_optRelease) dtb__100) in (let o1 = ((v_applyDiagConfig (Frontend_dPackages_dPkg.v_contextPackageOf ctx)) o) in (((B_dTrait_dMonad.v__x62__x62__x61_ B_dEffect_dCore.v_Monad_ucc99eea03f4e7df1_uBase_x36_46_x36_Effect_x36_46_x36_Core_x36_46_x36_Eff_ur) (((((v_isModuleFileEntry nFs) nEnv) nProcess) ctx) path)) (fun moduleEntry -> (if moduleEntry then (((((((v_checkModuleFileEntry nFs) nConsole) nEnv) nProcess) ctx) path) o1) else (((((((v_checkEntryFile nFs) nConsole) nEnv) nProcess) ctx) path) o1))))))
  | _ -> failwith "DT: impossible branch"
))))

# 1562 "Vuna/Compiler/Driver/CompilerCli.vuna"
let v_ownedByPackage = (fun (pkg : Frontend_dPackages_dPkg.t_Package) (d : Base_dDiag.t_Diagnostic) -> (let dir = (v_stripDotSlash (Frontend_dPackages_dPkg.v_packageDir pkg)) in (let file = (v_stripDotSlash (Base_dDiag.v_diagFileOf d)) in (let prefix = (if (if (dir = ".") then true else (dir = "")) then "" else (dir ^ "/")) in (if (if ((B_dData_dString.v_startsWith (prefix ^ "lib/")) file) then true else ((B_dData_dString.v_startsWith (prefix ^ "app/")) file)) then true else ((B_dData_dString.v_startsWith (prefix ^ "test/")) file))))))

# 1573 "Vuna/Compiler/Driver/CompilerCli.vuna"
let v_finishWarnings = (fun (nFs : string) (nConsole : string) (warns : Base_dDiag.t_Diagnostic B_dData_dList.t_List) (code : int) (o : t_CliOpts) -> (let ws = (Base_dDiagnostics_dSink.v_dedupeWarnings warns) in (let shown = (if (if (o).f_CliOpts_optShowWarnings then true else (o).f_CliOpts_optDenyWarnings) then ws else B_dData_dList.C_List_Nil) in (((B_dTrait_dMonad.v__x62__x62__x61_ B_dEffect_dCore.v_Monad_ucc99eea03f4e7df1_uBase_x36_46_x36_Effect_x36_46_x36_Core_x36_46_x36_Eff_ur) (((((v_printDiagList nFs) nConsole) o) "") shown)) (fun r -> ((B_dTrait_dApplicative.v_pure B_dEffect_dCore.v_Applicative_u19070277251d295b_uBase_x36_46_x36_Effect_x36_46_x36_Core_x36_46_x36_Eff_ur) { B_dData_dPair.f_Pair_first = (if (if (o).f_CliOpts_optDenyWarnings then ((B_dData_dList.v_length ws) > 0) else false) then 1 else code); B_dData_dPair.f_Pair_second = (B_dData_dPair.v_secondOf r) }))))))

# 1584 "Vuna/Compiler/Driver/CompilerCli.vuna"
let v_finishWarningsDir = (fun (nFs : string) (nConsole : string) (nProcess : string) (warns : Base_dDiag.t_Diagnostic B_dData_dList.t_List) (o : t_CliOpts) (dir : string) (code : int) -> (let ws = (Base_dDiagnostics_dSink.v_dedupeWarnings warns) in (let shown = (if (if (o).f_CliOpts_optShowWarnings then true else (o).f_CliOpts_optDenyWarnings) then ws else B_dData_dList.C_List_Nil) in (((B_dTrait_dMonad.v__x62__x62__x61_ B_dEffect_dCore.v_Monad_ucc99eea03f4e7df1_uBase_x36_46_x36_Effect_x36_46_x36_Core_x36_46_x36_Eff_ur) (((((v_printDiagList nFs) nConsole) o) "") shown)) (fun r -> (if (if (o).f_CliOpts_optDenyWarnings then ((B_dData_dList.v_length ws) > 0) else false) then (((B_dTrait_dMonad.v__x62__x62__x61_ B_dEffect_dCore.v_Monad_ucc99eea03f4e7df1_uBase_x36_46_x36_Effect_x36_46_x36_Core_x36_46_x36_Eff_ur) ((B_dEffect_dFs.v_fsRemoveTree nFs) dir)) (fun _u -> ((B_dTrait_dApplicative.v_pure B_dEffect_dCore.v_Applicative_u19070277251d295b_uBase_x36_46_x36_Effect_x36_46_x36_Core_x36_46_x36_Eff_ur) { B_dData_dPair.f_Pair_first = 1; B_dData_dPair.f_Pair_second = (B_dData_dPair.v_secondOf r) }))) else ((B_dTrait_dApplicative.v_pure B_dEffect_dCore.v_Applicative_u19070277251d295b_uBase_x36_46_x36_Effect_x36_46_x36_Core_x36_46_x36_Eff_ur) { B_dData_dPair.f_Pair_first = code; B_dData_dPair.f_Pair_second = (B_dData_dPair.v_secondOf r) })))))))

# 843 "Vuna/Compiler/Driver/CompilerCli.vuna"
let v_compileFileEntry = (fun (nFs : string) (nConsole : string) (nClock : string) (nEnv : string) (nProcess : string) (printResult : bool) (entry : string) (outDir : string) (o : t_CliOpts) -> (((B_dTrait_dMonad.v__x62__x62__x61_ B_dEffect_dCore.v_Monad_ucc99eea03f4e7df1_uBase_x36_46_x36_Effect_x36_46_x36_Core_x36_46_x36_Eff_ur) (((Frontend_dPackages_dPkg.v_contextForFile nFs) nEnv) entry)) (fun ctxR -> (match ctxR with
  | Base_dDiag.C_Check_ErrC (dtb__101) -> ((((v_printDiag nFs) nConsole) o) dtb__101)
  | Base_dDiag.C_Check_OkC (dtb__102) -> (let ctx = ((Frontend_dPackages_dPkg.v_contextWithRelease (o).f_CliOpts_optRelease) dtb__102) in (let o1 = ((v_applyDiagConfig (Frontend_dPackages_dPkg.v_contextPackageOf ctx)) o) in (((B_dTrait_dMonad.v__x62__x62__x61_ B_dEffect_dCore.v_Monad_ucc99eea03f4e7df1_uBase_x36_46_x36_Effect_x36_46_x36_Core_x36_46_x36_Eff_ur) ((((((((((v_compileToTarget nFs) nConsole) nClock) nEnv) nProcess) ctx) entry) printResult) outDir) (o).f_CliOpts_optTarget)) (fun r -> (match r with
  | Base_dDiag.C_Check_ErrC (dtb__103) -> ((((v_printDiag nFs) nConsole) o1) dtb__103)
  | Base_dDiag.C_Check_OkC (dtb__104) -> (((((((v_finishWarningsDir nFs) nConsole) nProcess) (B_dData_dPair.v_secondOf dtb__104)) o1) outDir) 0)
  | _ -> failwith "DT: impossible branch"
)))))
  | _ -> failwith "DT: impossible branch"
))))

# 859 "Vuna/Compiler/Driver/CompilerCli.vuna"
let v_compilePkgDir = (fun (nFs : string) (nConsole : string) (nClock : string) (nEnv : string) (nProcess : string) (printResult : bool) (dir : string) (outDir : string) (o : t_CliOpts) -> (((B_dTrait_dMonad.v__x62__x62__x61_ B_dEffect_dCore.v_Monad_ucc99eea03f4e7df1_uBase_x36_46_x36_Effect_x36_46_x36_Core_x36_46_x36_Eff_ur) ((((v_executablePackage nFs) nEnv) "compile") dir)) (fun pkgR -> (match pkgR with
  | Base_dDiag.C_Check_ErrC (dtb__105) -> ((((v_printDiag nFs) nConsole) o) dtb__105)
  | Base_dDiag.C_Check_OkC (dtb__106) -> (let o1 = ((v_applyDiagConfig (B_dData_dMaybe.C_Maybe_Just (dtb__106))) o) in (((B_dTrait_dMonad.v__x62__x62__x61_ B_dEffect_dCore.v_Monad_ucc99eea03f4e7df1_uBase_x36_46_x36_Effect_x36_46_x36_Core_x36_46_x36_Eff_ur) ((((((((((v_compileToTarget nFs) nConsole) nClock) nEnv) nProcess) ((Frontend_dPackages_dPkg.v_contextWithRelease (o).f_CliOpts_optRelease) (Frontend_dPackages_dPkg.v_packageContext dtb__106))) (Frontend_dPackages_dPkg.v_packageEntry dtb__106)) printResult) outDir) (o).f_CliOpts_optTarget)) (fun r -> (match r with
  | Base_dDiag.C_Check_ErrC (dtb__107) -> ((((v_printDiag nFs) nConsole) o1) dtb__107)
  | Base_dDiag.C_Check_OkC (dtb__108) -> (((((((v_finishWarningsDir nFs) nConsole) nProcess) (B_dData_dPair.v_secondOf dtb__108)) o1) outDir) 0)
  | _ -> failwith "DT: impossible branch"
))))
  | _ -> failwith "DT: impossible branch"
))))

# 818 "Vuna/Compiler/Driver/CompilerCli.vuna"
let v_compileRun = (fun (nFs : string) (nConsole : string) (nClock : string) (nEnv : string) (nProcess : string) (printResult : bool) (entry : string) (outDir : string) (o : t_CliOpts) -> (((B_dTrait_dMonad.v__x62__x62__x61_ B_dEffect_dCore.v_Monad_ucc99eea03f4e7df1_uBase_x36_46_x36_Effect_x36_46_x36_Core_x36_46_x36_Eff_ur) ((B_dEffect_dFs.v_fsFileExists nFs) entry)) (fun exists -> (if exists then (((B_dTrait_dMonad.v__x62__x62__x61_ B_dEffect_dCore.v_Monad_ucc99eea03f4e7df1_uBase_x36_46_x36_Effect_x36_46_x36_Core_x36_46_x36_Eff_ur) ((B_dEffect_dFs.v_fsIsDirectory nFs) entry)) (fun isDir -> (if isDir then (((((((((v_compilePkgDir nFs) nConsole) nClock) nEnv) nProcess) printResult) entry) outDir) o) else (((((((((v_compileFileEntry nFs) nConsole) nClock) nEnv) nProcess) printResult) entry) outDir) o)))) else ((v_withOpts o) ((v_dtPathErr nConsole) entry))))))

# 811 "Vuna/Compiler/Driver/CompilerCli.vuna"
let v_compileFinish = (fun (nFs : string) (nConsole : string) (nClock : string) (nEnv : string) (nProcess : string) (mc0 : string) (mc1 : bool) (mc2 : string B_dData_dMaybe.t_Maybe) (mc3 : string B_dData_dMaybe.t_Maybe) (mc4 : t_CliOpts) -> (match mc2 with
  | B_dData_dMaybe.C_Maybe_Just (dtb__109) -> (match mc3 with
  | B_dData_dMaybe.C_Maybe_Nothing -> ((v_withOpts mc4) ((v_usageErr nConsole) mc0))
  | B_dData_dMaybe.C_Maybe_Just (dtb__110) -> (((((((((v_compileRun nFs) nConsole) nClock) nEnv) nProcess) mc1) dtb__109) dtb__110) mc4)
  | _ -> failwith "DT: impossible branch"
)
  | B_dData_dMaybe.C_Maybe_Nothing -> ((v_withOpts mc4) ((v_usageErr nConsole) mc0))
  | _ -> failwith "DT: impossible branch"
))

# 785 "Vuna/Compiler/Driver/CompilerCli.vuna"
let rec v_compileParse = (fun (nFs : string) (nConsole : string) (nClock : string) (nEnv : string) (nProcess : string) (prog : string) (printResult : bool) (entry : string B_dData_dMaybe.t_Maybe) (outDir : string B_dData_dMaybe.t_Maybe) (args : string B_dData_dList.t_List) (o : t_CliOpts) -> (let nd_uscrut17 = args in (match nd_uscrut17 with
  | B_dData_dList.C_List__x58__x58_ (dtb__111, dtb__112) -> (if (dtb__111 = "--no-print") then (((((((((((v_compileParse nFs) nConsole) nClock) nEnv) nProcess) prog) false) entry) outDir) dtb__112) o) else (if (dtb__111 = "--release") then (((((((((((v_compileParse nFs) nConsole) nClock) nEnv) nProcess) prog) printResult) entry) outDir) dtb__112) (v_markRelease o)) else (if (dtb__111 = "--target") then (match dtb__112 with
  | B_dData_dList.C_List__x58__x58_ (dtb__113, dtb__114) -> (if (v_isKnownTarget dtb__113) then (((((((((((v_compileParse nFs) nConsole) nClock) nEnv) nProcess) prog) printResult) entry) outDir) dtb__114) ((v_markTarget dtb__113) o)) else ((v_withOpts o) ((v_usageErr nConsole) prog)))
  | _ -> (if ((B_dData_dString.v_startsWith "-") dtb__111) then ((v_withOpts o) (((v_removedFlag nConsole) prog) dtb__111)) else (match entry with
  | B_dData_dMaybe.C_Maybe_Nothing -> (((((((((((v_compileParse nFs) nConsole) nClock) nEnv) nProcess) prog) printResult) (B_dData_dMaybe.C_Maybe_Just (dtb__111))) outDir) dtb__112) o)
  | B_dData_dMaybe.C_Maybe_Just (dtb__115) -> (match outDir with
  | B_dData_dMaybe.C_Maybe_Nothing -> (((((((((((v_compileParse nFs) nConsole) nClock) nEnv) nProcess) prog) printResult) entry) (B_dData_dMaybe.C_Maybe_Just (dtb__111))) dtb__112) o)
  | B_dData_dMaybe.C_Maybe_Just (dtb__116) -> ((v_withOpts o) ((v_usageErr nConsole) prog))
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
))
) else (if ((B_dData_dString.v_startsWith "-") dtb__111) then ((v_withOpts o) (((v_removedFlag nConsole) prog) dtb__111)) else (match entry with
  | B_dData_dMaybe.C_Maybe_Nothing -> (((((((((((v_compileParse nFs) nConsole) nClock) nEnv) nProcess) prog) printResult) (B_dData_dMaybe.C_Maybe_Just (dtb__111))) outDir) dtb__112) o)
  | B_dData_dMaybe.C_Maybe_Just (dtb__117) -> (match outDir with
  | B_dData_dMaybe.C_Maybe_Nothing -> (((((((((((v_compileParse nFs) nConsole) nClock) nEnv) nProcess) prog) printResult) entry) (B_dData_dMaybe.C_Maybe_Just (dtb__111))) dtb__112) o)
  | B_dData_dMaybe.C_Maybe_Just (dtb__118) -> ((v_withOpts o) ((v_usageErr nConsole) prog))
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
)))))
  | B_dData_dList.C_List_Nil -> ((((((((((v_compileFinish nFs) nConsole) nClock) nEnv) nProcess) prog) printResult) entry) outDir) o)
  | _ -> failwith "DT: impossible branch"
)))

# 782 "Vuna/Compiler/Driver/CompilerCli.vuna"
let v_compileArgs = (fun (nFs : string) (nConsole : string) (nClock : string) (nEnv : string) (nProcess : string) (prog : string) (args : string B_dData_dList.t_List) (o : t_CliOpts) -> (((((((((((v_compileParse nFs) nConsole) nClock) nEnv) nProcess) prog) true) B_dData_dMaybe.C_Maybe_Nothing) B_dData_dMaybe.C_Maybe_Nothing) args) o))

# 1314 "Vuna/Compiler/Driver/CompilerCli.vuna"
let v_buildWasmOne = (fun (nFs : string) (nConsole : string) (nEnv : string) (nProcess : string) (noCompile : bool) (outM : string B_dData_dMaybe.t_Maybe) (pkg : Frontend_dPackages_dPkg.t_Package) (o : t_CliOpts) -> (let outDir = (match outM with
  | B_dData_dMaybe.C_Maybe_Just (dtb__121) -> dtb__121
  | B_dData_dMaybe.C_Maybe_Nothing -> ((Frontend_dPackages_dPkg.v_packageDir pkg) ^ "/.output")
  | _ -> failwith "DT: impossible branch"
) in (let watPath = (outDir ^ "/main.wat") in (let wasmPath = (outDir ^ "/main.wasm") in (let script = (v_wasmBuildScript (o).f_CliOpts_optWasmOpt) in (((B_dTrait_dMonad.v__x62__x62__x61_ B_dEffect_dCore.v_Monad_ucc99eea03f4e7df1_uBase_x36_46_x36_Effect_x36_46_x36_Core_x36_46_x36_Eff_ur) ((((((((Driver_dTarget.v_compileBackend nFs) nEnv) nProcess) ((Frontend_dPackages_dPkg.v_contextWithRelease (o).f_CliOpts_optRelease) (Frontend_dPackages_dPkg.v_packageContext pkg))) "wasm") (Frontend_dPackages_dPkg.v_packageEntry pkg)) true) outDir)) (fun r -> (match r with
  | Base_dDiag.C_Check_ErrC (dtb__119) -> ((((v_printDiag nFs) nConsole) o) dtb__119)
  | Base_dDiag.C_Check_OkC (dtb__120) -> (((B_dTrait_dMonad.v__x62__x62__x61_ B_dEffect_dCore.v_Monad_ucc99eea03f4e7df1_uBase_x36_46_x36_Effect_x36_46_x36_Core_x36_46_x36_Eff_ur) (((B_dEffect_dFs.v_fsWriteFile nFs) (outDir ^ "/build.sh")) script)) (fun _u -> (((B_dTrait_dMonad.v__x62__x62__x61_ B_dEffect_dCore.v_Monad_ucc99eea03f4e7df1_uBase_x36_46_x36_Effect_x36_46_x36_Core_x36_46_x36_Eff_ur) (if noCompile then (((B_dTrait_dMonad.v__x62__x62__x61_ B_dEffect_dCore.v_Monad_ucc99eea03f4e7df1_uBase_x36_46_x36_Effect_x36_46_x36_Core_x36_46_x36_Eff_ur) ((B_dEffect_dConsole.v_consolePrint nConsole) (String.concat "" ["wrote "; watPath; "\n"]))) (fun _u -> ((B_dTrait_dApplicative.v_pure B_dEffect_dCore.v_Applicative_u19070277251d295b_uBase_x36_46_x36_Effect_x36_46_x36_Core_x36_46_x36_Eff_ur) 0))) else (((B_dTrait_dMonad.v__x62__x62__x61_ B_dEffect_dCore.v_Monad_ucc99eea03f4e7df1_uBase_x36_46_x36_Effect_x36_46_x36_Core_x36_46_x36_Eff_ur) (((B_dEffect_dProcess.v_processRunIn nProcess) outDir) (B_dData_dList.C_List__x58__x58_ ("sh", (B_dData_dList.C_List__x58__x58_ ("build.sh", B_dData_dList.C_List_Nil)))))) (fun c -> (if (c = 0) then (((B_dTrait_dMonad.v__x62__x62__x61_ B_dEffect_dCore.v_Monad_ucc99eea03f4e7df1_uBase_x36_46_x36_Effect_x36_46_x36_Core_x36_46_x36_Eff_ur) ((B_dEffect_dConsole.v_consolePrint nConsole) (String.concat "" ["wrote "; wasmPath; "\n"]))) (fun _u -> ((B_dTrait_dApplicative.v_pure B_dEffect_dCore.v_Applicative_u19070277251d295b_uBase_x36_46_x36_Effect_x36_46_x36_Core_x36_46_x36_Eff_ur) 0))) else (((B_dTrait_dMonad.v__x62__x62__x61_ B_dEffect_dCore.v_Monad_ucc99eea03f4e7df1_uBase_x36_46_x36_Effect_x36_46_x36_Core_x36_46_x36_Eff_ur) ((B_dEffect_dConsole.v_consolePrint nConsole) (String.concat "" ["wasm assembly failed: build.sh exited "; (bi_strFromInt c); "\n"]))) (fun _u -> ((B_dTrait_dApplicative.v_pure B_dEffect_dCore.v_Applicative_u19070277251d295b_uBase_x36_46_x36_Effect_x36_46_x36_Core_x36_46_x36_Eff_ur) 1)))))))) (fun code -> (if (code = 0) then (((((((v_finishWarningsDir nFs) nConsole) nProcess) (B_dData_dPair.v_secondOf dtb__120)) o) outDir) 0) else ((B_dTrait_dApplicative.v_pure B_dEffect_dCore.v_Applicative_u19070277251d295b_uBase_x36_46_x36_Effect_x36_46_x36_Core_x36_46_x36_Eff_ur) { B_dData_dPair.f_Pair_first = 1; B_dData_dPair.f_Pair_second = o }))))))
  | _ -> failwith "DT: impossible branch"
))))))))

# 1373 "Vuna/Compiler/Driver/CompilerCli.vuna"
let v_buildOne = (fun (nFs : string) (nConsole : string) (nClock : string) (nEnv : string) (nProcess : string) (nExit : string) (nArgs : string) (noCompile : bool) (multiOut : bool) (outM : string B_dData_dMaybe.t_Maybe) (pkg : Frontend_dPackages_dPkg.t_Package) (o : t_CliOpts) -> (if ((o).f_CliOpts_optTarget = "wasm") then ((((((((v_buildWasmOne nFs) nConsole) nEnv) nProcess) noCompile) outM) pkg) o) else (if ((o).f_CliOpts_optTarget = "native") then (((((((((v_buildNativeOne nFs) nConsole) nEnv) nProcess) noCompile) multiOut) outM) pkg) o) else (let name = (Frontend_dPackages_dPkg.v_packageName pkg) in (let entry = (Frontend_dPackages_dPkg.v_packageEntry pkg) in (((B_dTrait_dMonad.v__x62__x62__x61_ B_dEffect_dCore.v_Monad_ucc99eea03f4e7df1_uBase_x36_46_x36_Effect_x36_46_x36_Core_x36_46_x36_Eff_ur) ((B_dEffect_dFs.v_fsFileExists nFs) entry)) (fun exists -> (if exists then (let ctx = ((Frontend_dPackages_dPkg.v_contextWithRelease (o).f_CliOpts_optRelease) (Frontend_dPackages_dPkg.v_packageContext pkg)) in (if noCompile then (match outM with
  | B_dData_dMaybe.C_Maybe_Just (dtb__122) -> (((((((((v_compileCodegen nFs) nConsole) nClock) nEnv) nProcess) ctx) entry) (if multiOut then (String.concat "" [dtb__122; "/"; name]) else dtb__122)) o)
  | B_dData_dMaybe.C_Maybe_Nothing -> (((((((((v_compileCodegen nFs) nConsole) nClock) nEnv) nProcess) ctx) entry) ((Frontend_dPackages_dPkg.v_packageDir pkg) ^ "/.output")) o)
  | _ -> failwith "DT: impossible branch"
) else (match outM with
  | B_dData_dMaybe.C_Maybe_Just (dtb__123) -> (((((((((((v_buildExplicit nFs) nConsole) nClock) nEnv) nProcess) dtb__123) multiOut) pkg) ctx) entry) o)
  | B_dData_dMaybe.C_Maybe_Nothing -> (((B_dTrait_dMonad.v__x62__x62__x61_ B_dEffect_dCore.v_Monad_ucc99eea03f4e7df1_uBase_x36_46_x36_Effect_x36_46_x36_Core_x36_46_x36_Eff_ur) (((((((Driver_dCompile.v_splitInputsOf nFs) nClock) nEnv) nProcess) ctx) entry) true)) (fun inputs -> (((B_dTrait_dMonad.v__x62__x62__x61_ B_dEffect_dCore.v_Monad_ucc99eea03f4e7df1_uBase_x36_46_x36_Effect_x36_46_x36_Core_x36_46_x36_Eff_ur) ((((Driver_dCompile.v_buildViewAddrOf nFs) nEnv) nProcess) inputs)) (fun viewDigest -> ((((((((((((v_buildDefaultView nFs) nConsole) nClock) nEnv) nProcess) inputs) ctx) pkg) name) entry) viewDigest) o)))))
  | _ -> failwith "DT: impossible branch"
))) else (((B_dTrait_dMonad.v__x62__x62__x61_ B_dEffect_dCore.v_Monad_ucc99eea03f4e7df1_uBase_x36_46_x36_Effect_x36_46_x36_Core_x36_46_x36_Eff_ur) (((((((((Driver_dCompile.v_checkPackage nFs) nClock) nEnv) nProcess) nExit) nArgs) (o).f_CliOpts_optRelease) false) pkg)) (fun r -> (match r with
  | Base_dDiag.C_Check_ErrC (dtb__124) -> ((((v_printDiag nFs) nConsole) o) dtb__124)
  | Base_dDiag.C_Check_OkC (dtb__125) -> (((B_dTrait_dMonad.v__x62__x62__x61_ B_dEffect_dCore.v_Monad_ucc99eea03f4e7df1_uBase_x36_46_x36_Effect_x36_46_x36_Core_x36_46_x36_Eff_ur) ((B_dEffect_dConsole.v_consolePrint nConsole) (String.concat "" ["skipped (library): "; name; "\n"]))) (fun _u -> ((B_dTrait_dApplicative.v_pure B_dEffect_dCore.v_Applicative_u19070277251d295b_uBase_x36_46_x36_Effect_x36_46_x36_Core_x36_46_x36_Eff_ur) { B_dData_dPair.f_Pair_first = 0; B_dData_dPair.f_Pair_second = o })))
  | _ -> failwith "DT: impossible branch"
)))))))))))

# 1257 "Vuna/Compiler/Driver/CompilerCli.vuna"
let rec v_buildTargets = (fun (nFs : string) (nConsole : string) (nClock : string) (nEnv : string) (nProcess : string) (nExit : string) (nArgs : string) (mc0 : bool) (mc1 : bool) (mc2 : string B_dData_dMaybe.t_Maybe) (mc3 : Frontend_dPackages_dPkg.t_Package B_dData_dList.t_List) (mc4 : int) (mc5 : t_CliOpts) -> (match mc3 with
  | B_dData_dList.C_List__x58__x58_ (dtb__126, dtb__127) -> (((B_dTrait_dMonad.v__x62__x62__x61_ B_dEffect_dCore.v_Monad_ucc99eea03f4e7df1_uBase_x36_46_x36_Effect_x36_46_x36_Core_x36_46_x36_Eff_ur) ((((((((((((v_buildOne nFs) nConsole) nClock) nEnv) nProcess) nExit) nArgs) mc0) mc1) mc2) dtb__126) mc5)) (fun r -> (let next = (if ((B_dData_dPair.v_firstOf r) > mc4) then (B_dData_dPair.v_firstOf r) else mc4) in (((((((((((((v_buildTargets nFs) nConsole) nClock) nEnv) nProcess) nExit) nArgs) mc0) mc1) mc2) dtb__127) next) (B_dData_dPair.v_secondOf r)))))
  | B_dData_dList.C_List_Nil -> ((B_dTrait_dApplicative.v_pure B_dEffect_dCore.v_Applicative_u19070277251d295b_uBase_x36_46_x36_Effect_x36_46_x36_Core_x36_46_x36_Eff_ur) { B_dData_dPair.f_Pair_first = mc4; B_dData_dPair.f_Pair_second = mc5 })
  | _ -> failwith "DT: impossible branch"
))

# 1207 "Vuna/Compiler/Driver/CompilerCli.vuna"
let v_buildRun = (fun (nFs : string) (nConsole : string) (nClock : string) (nEnv : string) (nProcess : string) (nExit : string) (nArgs : string) (noCompile : bool) (dir : string) (outM : string B_dData_dMaybe.t_Maybe) (pkgM : string B_dData_dMaybe.t_Maybe) (o : t_CliOpts) -> (((B_dTrait_dMonad.v__x62__x62__x61_ B_dEffect_dCore.v_Monad_ucc99eea03f4e7df1_uBase_x36_46_x36_Effect_x36_46_x36_Core_x36_46_x36_Eff_ur) (((Frontend_dPackages_dPkg.v_loadWorkspace nFs) nEnv) dir)) (fun workspaceR -> (match workspaceR with
  | Base_dDiag.C_Check_ErrC (dtb__128) -> ((((v_printDiag nFs) nConsole) o) dtb__128)
  | Base_dDiag.C_Check_OkC (dtb__129) -> (((B_dTrait_dMonad.v__x62__x62__x61_ B_dEffect_dCore.v_Monad_ucc99eea03f4e7df1_uBase_x36_46_x36_Effect_x36_46_x36_Core_x36_46_x36_Eff_ur) ((v_isSingleLibraryPackage nFs) (Frontend_dPackages_dPkg.v_workspaceAllPackages dtb__129))) (fun libOnly -> (if libOnly then ((v_withOpts o) ((v_printErr nConsole) (v_libraryOnlyMessage (Frontend_dPackages_dPkg.v_workspaceAllPackages dtb__129)))) else (match ((v_selectBuildTargets pkgM) (Frontend_dPackages_dPkg.v_workspaceAllPackages dtb__129)) with
  | Base_dDiag.C_Check_ErrC (dtb__130) -> ((((v_printDiag nFs) nConsole) o) dtb__130)
  | Base_dDiag.C_Check_OkC (dtb__131) -> (((((((((((((v_buildTargets nFs) nConsole) nClock) nEnv) nProcess) nExit) nArgs) noCompile) (v_workspaceMultiOut dtb__129)) outM) dtb__131) 0) o)
  | _ -> failwith "DT: impossible branch"
))))
  | _ -> failwith "DT: impossible branch"
))))

# 1158 "Vuna/Compiler/Driver/CompilerCli.vuna"
let rec v_buildParse = (fun (nFs : string) (nConsole : string) (nClock : string) (nEnv : string) (nProcess : string) (nExit : string) (nArgs : string) (prog : string) (noCompile : bool) (out : string B_dData_dMaybe.t_Maybe) (dir : string B_dData_dMaybe.t_Maybe) (pkg : string B_dData_dMaybe.t_Maybe) (args : string B_dData_dList.t_List) (o : t_CliOpts) -> (let nd_uscrut22 = args in (match nd_uscrut22 with
  | B_dData_dList.C_List__x58__x58_ (dtb__132, dtb__133) -> (if (dtb__132 = "--no-compile") then ((((((((((((((v_buildParse nFs) nConsole) nClock) nEnv) nProcess) nExit) nArgs) prog) true) out) dir) pkg) dtb__133) o) else (if (dtb__132 = "--release") then ((((((((((((((v_buildParse nFs) nConsole) nClock) nEnv) nProcess) nExit) nArgs) prog) noCompile) out) dir) pkg) dtb__133) (v_markRelease o)) else (if (dtb__132 = "--wasm-opt") then (match dtb__133 with
  | B_dData_dList.C_List__x58__x58_ (dtb__134, dtb__135) -> (if ((B_dData_dString.v_startsWith "-") dtb__134) then ((v_withOpts o) (((v_removedFlag nConsole) prog) dtb__134)) else (match (v_parseWasmOptLevel dtb__134) with
  | B_dData_dMaybe.C_Maybe_Just (dtb__136) -> ((((((((((((((v_buildParse nFs) nConsole) nClock) nEnv) nProcess) nExit) nArgs) prog) noCompile) out) dir) pkg) dtb__135) ((v_markWasmOpt dtb__136) o))
  | B_dData_dMaybe.C_Maybe_Nothing -> ((v_withOpts o) ((v_usageErr nConsole) prog))
  | _ -> failwith "DT: impossible branch"
))
  | B_dData_dList.C_List_Nil -> ((v_withOpts o) ((v_usageErr nConsole) prog))
  | _ -> failwith "DT: impossible branch"
) else (if (dtb__132 = "--target") then (match dtb__133 with
  | B_dData_dList.C_List__x58__x58_ (dtb__137, dtb__138) -> (if (v_isKnownTarget dtb__137) then ((((((((((((((v_buildParse nFs) nConsole) nClock) nEnv) nProcess) nExit) nArgs) prog) noCompile) out) dir) pkg) dtb__138) ((v_markTarget dtb__137) o)) else ((v_withOpts o) ((v_usageErr nConsole) prog)))
  | _ -> (if ((B_dData_dString.v_startsWith "-") dtb__132) then ((v_withOpts o) (((v_removedFlag nConsole) prog) dtb__132)) else (match dir with
  | B_dData_dMaybe.C_Maybe_Nothing -> ((((((((((((((v_buildParse nFs) nConsole) nClock) nEnv) nProcess) nExit) nArgs) prog) noCompile) out) (B_dData_dMaybe.C_Maybe_Just (dtb__132))) pkg) dtb__133) o)
  | B_dData_dMaybe.C_Maybe_Just (dtb__139) -> ((v_withOpts o) ((v_usageErr nConsole) prog))
  | _ -> failwith "DT: impossible branch"
))
) else (if (dtb__132 = "--out") then (match dtb__133 with
  | B_dData_dList.C_List__x58__x58_ (dtb__140, dtb__141) -> (if ((B_dData_dString.v_startsWith "-") dtb__140) then ((v_withOpts o) (((v_removedFlag nConsole) prog) dtb__140)) else (match out with
  | B_dData_dMaybe.C_Maybe_Nothing -> ((((((((((((((v_buildParse nFs) nConsole) nClock) nEnv) nProcess) nExit) nArgs) prog) noCompile) (B_dData_dMaybe.C_Maybe_Just (dtb__140))) dir) pkg) dtb__141) o)
  | B_dData_dMaybe.C_Maybe_Just (dtb__142) -> ((v_withOpts o) ((v_usageErr nConsole) prog))
  | _ -> failwith "DT: impossible branch"
))
  | B_dData_dList.C_List_Nil -> ((v_withOpts o) ((v_usageErr nConsole) prog))
  | _ -> failwith "DT: impossible branch"
) else (if (dtb__132 = "--package") then (match dtb__133 with
  | B_dData_dList.C_List__x58__x58_ (dtb__143, dtb__144) -> (if ((B_dData_dString.v_startsWith "-") dtb__143) then ((v_withOpts o) (((v_removedFlag nConsole) prog) dtb__143)) else (match pkg with
  | B_dData_dMaybe.C_Maybe_Nothing -> ((((((((((((((v_buildParse nFs) nConsole) nClock) nEnv) nProcess) nExit) nArgs) prog) noCompile) out) dir) (B_dData_dMaybe.C_Maybe_Just (dtb__143))) dtb__144) o)
  | B_dData_dMaybe.C_Maybe_Just (dtb__145) -> ((v_withOpts o) ((v_usageErr nConsole) prog))
  | _ -> failwith "DT: impossible branch"
))
  | B_dData_dList.C_List_Nil -> ((v_withOpts o) ((v_usageErr nConsole) prog))
  | _ -> failwith "DT: impossible branch"
) else (if ((B_dData_dString.v_startsWith "-") dtb__132) then ((v_withOpts o) (((v_removedFlag nConsole) prog) dtb__132)) else (match dir with
  | B_dData_dMaybe.C_Maybe_Nothing -> ((((((((((((((v_buildParse nFs) nConsole) nClock) nEnv) nProcess) nExit) nArgs) prog) noCompile) out) (B_dData_dMaybe.C_Maybe_Just (dtb__132))) pkg) dtb__133) o)
  | B_dData_dMaybe.C_Maybe_Just (dtb__146) -> ((v_withOpts o) ((v_usageErr nConsole) prog))
  | _ -> failwith "DT: impossible branch"
))))))))
  | B_dData_dList.C_List_Nil -> ((((((((((((v_buildRun nFs) nConsole) nClock) nEnv) nProcess) nExit) nArgs) noCompile) (v_defaultDir dir)) out) pkg) o)
  | _ -> failwith "DT: impossible branch"
)))

# 1155 "Vuna/Compiler/Driver/CompilerCli.vuna"
let v_buildArgs = (fun (nFs : string) (nConsole : string) (nClock : string) (nEnv : string) (nProcess : string) (nExit : string) (nArgs : string) (prog : string) (args : string B_dData_dList.t_List) (o : t_CliOpts) -> ((((((((((((((v_buildParse nFs) nConsole) nClock) nEnv) nProcess) nExit) nArgs) prog) false) B_dData_dMaybe.C_Maybe_Nothing) B_dData_dMaybe.C_Maybe_Nothing) B_dData_dMaybe.C_Maybe_Nothing) args) o))

# 1604 "Vuna/Compiler/Driver/CompilerCli.vuna"
let rec v_stripLangGo = (fun (mc0 : string B_dData_dList.t_List) (mc1 : string B_dData_dList.t_List) (mc2 : string) -> (match mc0 with
  | B_dData_dList.C_List__x58__x58_ (dtb__147, dtb__148) -> (if (dtb__147 = "--lang") then (match dtb__148 with
  | B_dData_dList.C_List__x58__x58_ (dtb__149, dtb__150) -> (((v_stripLangGo dtb__150) mc1) dtb__149)
  | B_dData_dList.C_List_Nil -> { B_dData_dPair.f_Pair_first = (B_dData_dList.v_reverse mc1); B_dData_dPair.f_Pair_second = mc2 }
  | _ -> failwith "DT: impossible branch"
) else (if ((B_dData_dString.v_startsWith "--lang=") dtb__147) then (((v_stripLangGo dtb__148) mc1) (((B_dData_dString.v_substring (bi_natFromInt 7)) (bi_natFromInt ((bi_strLength dtb__147) - 7))) dtb__147)) else (((v_stripLangGo dtb__148) (B_dData_dList.C_List__x58__x58_ (dtb__147, mc1))) mc2)))
  | B_dData_dList.C_List_Nil -> { B_dData_dPair.f_Pair_first = (B_dData_dList.v_reverse mc1); B_dData_dPair.f_Pair_second = mc2 }
  | _ -> failwith "DT: impossible branch"
))

# 1600 "Vuna/Compiler/Driver/CompilerCli.vuna"
let v_stripLang = (fun (args : string B_dData_dList.t_List) -> (((v_stripLangGo args) B_dData_dList.C_List_Nil) "en"))

# 1617 "Vuna/Compiler/Driver/CompilerCli.vuna"
let rec v_hasLangFlag = (fun (mc0 : string B_dData_dList.t_List) -> (match mc0 with
  | B_dData_dList.C_List__x58__x58_ (dtb__151, dtb__152) -> (if (if (dtb__151 = "--lang") then true else ((B_dData_dString.v_startsWith "--lang=") dtb__151)) then true else (v_hasLangFlag dtb__152))
  | B_dData_dList.C_List_Nil -> false
  | _ -> failwith "DT: impossible branch"
))

# 1625 "Vuna/Compiler/Driver/CompilerCli.vuna"
let rec v_stripContinueGo = (fun (mc0 : string B_dData_dList.t_List) (mc1 : string B_dData_dList.t_List) (mc2 : bool) -> (match mc0 with
  | B_dData_dList.C_List__x58__x58_ (dtb__153, dtb__154) -> (if (dtb__153 = "--continue-on-error") then (((v_stripContinueGo dtb__154) mc1) true) else (((v_stripContinueGo dtb__154) (B_dData_dList.C_List__x58__x58_ (dtb__153, mc1))) mc2))
  | B_dData_dList.C_List_Nil -> { B_dData_dPair.f_Pair_first = (B_dData_dList.v_reverse mc1); B_dData_dPair.f_Pair_second = mc2 }
  | _ -> failwith "DT: impossible branch"
))

# 1622 "Vuna/Compiler/Driver/CompilerCli.vuna"
let v_stripContinueOnError = (fun (args : string B_dData_dList.t_List) -> (((v_stripContinueGo args) B_dData_dList.C_List_Nil) false))

# 1669 "Vuna/Compiler/Driver/CompilerCli.vuna"
let v_printRecovered = (fun (nFs : string) (nConsole : string) (pkg : Frontend_dPackages_dPkg.t_Package) (e : Base_dDiag.t_Diagnostic) (ds : Base_dDiag.t_Diagnostic B_dData_dList.t_List) (o : t_CliOpts) -> (let shown = ((v_takeDiags (o).f_CliOpts_optMaxErrors) ds) in (((B_dTrait_dMonad.v__x62__x62__x61_ B_dEffect_dCore.v_Monad_ucc99eea03f4e7df1_uBase_x36_46_x36_Effect_x36_46_x36_Core_x36_46_x36_Eff_ur) (((((v_printDiagList nFs) nConsole) o) (String.concat "" ["["; (Frontend_dPackages_dPkg.v_packageName pkg); "] "])) shown)) (fun r -> (if ((B_dData_dList.v_length shown) = 0) then (((((v_printDiagWithPrefix nFs) nConsole) (B_dData_dPair.v_secondOf r)) (String.concat "" ["["; (Frontend_dPackages_dPkg.v_packageName pkg); "] "])) e) else ((B_dTrait_dApplicative.v_pure B_dEffect_dCore.v_Applicative_u19070277251d295b_uBase_x36_46_x36_Effect_x36_46_x36_Core_x36_46_x36_Eff_ur) { B_dData_dPair.f_Pair_first = 1; B_dData_dPair.f_Pair_second = (B_dData_dPair.v_secondOf r) }))))))

# 1646 "Vuna/Compiler/Driver/CompilerCli.vuna"
let v_packageRecoverExe = (fun (nFs : string) (nConsole : string) (nEnv : string) (nProcess : string) (pkg : Frontend_dPackages_dPkg.t_Package) (e : Base_dDiag.t_Diagnostic) (o : t_CliOpts) -> (((B_dTrait_dMonad.v__x62__x62__x61_ B_dEffect_dCore.v_Monad_ucc99eea03f4e7df1_uBase_x36_46_x36_Effect_x36_46_x36_Core_x36_46_x36_Eff_ur) (((((Driver_dDt.v_dtCheckRecovering nFs) nEnv) nProcess) ((Frontend_dPackages_dPkg.v_contextWithRelease (o).f_CliOpts_optRelease) (Frontend_dPackages_dPkg.v_packageContext pkg))) (Frontend_dPackages_dPkg.v_packageEntry pkg))) (fun recovered -> (match recovered with
  | Base_dDiag.C_Check_OkC (dtb__155) -> ((((((v_printRecovered nFs) nConsole) pkg) e) dtb__155) o)
  | Base_dDiag.C_Check_ErrC (dtb__156) -> (((((v_printDiagWithPrefix nFs) nConsole) o) (String.concat "" ["["; (Frontend_dPackages_dPkg.v_packageName pkg); "] "])) dtb__156)
  | _ -> failwith "DT: impossible branch"
))))

# 1656 "Vuna/Compiler/Driver/CompilerCli.vuna"
let v_packageRecoverLib = (fun (nFs : string) (nConsole : string) (nEnv : string) (nProcess : string) (pkg : Frontend_dPackages_dPkg.t_Package) (e : Base_dDiag.t_Diagnostic) (o : t_CliOpts) -> (match (Frontend_dPackages_dPkg.v_packageExports pkg) with
  | B_dData_dMaybe.C_Maybe_Just (dtb__157) -> (((B_dTrait_dMonad.v__x62__x62__x61_ B_dEffect_dCore.v_Monad_ucc99eea03f4e7df1_uBase_x36_46_x36_Effect_x36_46_x36_Core_x36_46_x36_Eff_ur) (((((Driver_dDt.v_dtCheckLibraryRecovering nFs) nEnv) nProcess) ((Frontend_dPackages_dPkg.v_contextWithRelease (o).f_CliOpts_optRelease) (Frontend_dPackages_dPkg.v_packageContext pkg))) dtb__157)) (fun recovered -> (match recovered with
  | Base_dDiag.C_Check_OkC (dtb__158) -> ((((((v_printRecovered nFs) nConsole) pkg) e) dtb__158) o)
  | Base_dDiag.C_Check_ErrC (dtb__159) -> (((((v_printDiagWithPrefix nFs) nConsole) o) (String.concat "" ["["; (Frontend_dPackages_dPkg.v_packageName pkg); "] "])) dtb__159)
  | _ -> failwith "DT: impossible branch"
)))
  | B_dData_dMaybe.C_Maybe_Nothing -> (((((v_printDiagWithPrefix nFs) nConsole) o) (String.concat "" ["["; (Frontend_dPackages_dPkg.v_packageName pkg); "] "])) e)
  | _ -> failwith "DT: impossible branch"
))

# 1639 "Vuna/Compiler/Driver/CompilerCli.vuna"
let v_packageRecover = (fun (nFs : string) (nConsole : string) (nEnv : string) (nProcess : string) (pkg : Frontend_dPackages_dPkg.t_Package) (e : Base_dDiag.t_Diagnostic) (o : t_CliOpts) -> (((B_dTrait_dMonad.v__x62__x62__x61_ B_dEffect_dCore.v_Monad_ucc99eea03f4e7df1_uBase_x36_46_x36_Effect_x36_46_x36_Core_x36_46_x36_Eff_ur) ((B_dEffect_dFs.v_fsFileExists nFs) (Frontend_dPackages_dPkg.v_packageEntry pkg))) (fun exists -> (if exists then (((((((v_packageRecoverExe nFs) nConsole) nEnv) nProcess) pkg) e) o) else (((((((v_packageRecoverLib nFs) nConsole) nEnv) nProcess) pkg) e) o)))))

# 1630 "Vuna/Compiler/Driver/CompilerCli.vuna"
let v_checkPackageErr = (fun (nFs : string) (nConsole : string) (nEnv : string) (nProcess : string) (pkg : Frontend_dPackages_dPkg.t_Package) (e : Base_dDiag.t_Diagnostic) (o : t_CliOpts) -> (if (o).f_CliOpts_optContinueOnError then (((((((v_packageRecover nFs) nConsole) nEnv) nProcess) pkg) e) o) else (((((v_printDiagWithPrefix nFs) nConsole) o) (String.concat "" ["["; (Frontend_dPackages_dPkg.v_packageName pkg); "] "])) e)))

# 1053 "Vuna/Compiler/Driver/CompilerCli.vuna"
let v_checkPackageCode = (fun (nFs : string) (nConsole : string) (nClock : string) (nEnv : string) (nProcess : string) (nExit : string) (nArgs : string) (pkg : Frontend_dPackages_dPkg.t_Package) (wantWarnings : bool) (o : t_CliOpts) -> (((B_dTrait_dMonad.v__x62__x62__x61_ B_dEffect_dCore.v_Monad_ucc99eea03f4e7df1_uBase_x36_46_x36_Effect_x36_46_x36_Core_x36_46_x36_Eff_ur) (((((((((Driver_dCompile.v_checkPackage nFs) nClock) nEnv) nProcess) nExit) nArgs) (o).f_CliOpts_optRelease) wantWarnings) pkg)) (fun r -> (match r with
  | Base_dDiag.C_Check_ErrC (dtb__160) -> (((((((v_checkPackageErr nFs) nConsole) nEnv) nProcess) pkg) dtb__160) o)
  | Base_dDiag.C_Check_OkC (dtb__161) -> (let ws = ((B_dData_dList.v_filter (v_ownedByPackage pkg)) (Base_dDiagnostics_dSink.v_dedupeWarnings dtb__161)) in (let shown = (if (if (o).f_CliOpts_optShowWarnings then true else (o).f_CliOpts_optDenyWarnings) then ws else B_dData_dList.C_List_Nil) in (let failed = (if (if (o).f_CliOpts_optDenyWarnings then ((B_dData_dList.v_length ws) > 0) else false) then 1 else 0) in (((B_dTrait_dMonad.v__x62__x62__x61_ B_dEffect_dCore.v_Monad_ucc99eea03f4e7df1_uBase_x36_46_x36_Effect_x36_46_x36_Core_x36_46_x36_Eff_ur) (((((v_printDiagList nFs) nConsole) o) (String.concat "" ["["; (Frontend_dPackages_dPkg.v_packageName pkg); "] "])) shown)) (fun r1 -> ((B_dTrait_dApplicative.v_pure B_dEffect_dCore.v_Applicative_u19070277251d295b_uBase_x36_46_x36_Effect_x36_46_x36_Core_x36_46_x36_Eff_ur) { B_dData_dPair.f_Pair_first = failed; B_dData_dPair.f_Pair_second = (B_dData_dPair.v_secondOf r1) }))))))
  | _ -> failwith "DT: impossible branch"
))))

# 1042 "Vuna/Compiler/Driver/CompilerCli.vuna"
let v_checkPackageSeq = (fun (nFs : string) (nConsole : string) (nClock : string) (nEnv : string) (nProcess : string) (nExit : string) (nArgs : string) (pkg : Frontend_dPackages_dPkg.t_Package) (code : int) (o : t_CliOpts) -> (let o1 = ((v_applyDiagConfig (B_dData_dMaybe.C_Maybe_Just (pkg))) o) in (let wantWarnings = (if (o1).f_CliOpts_optShowWarnings then true else (o1).f_CliOpts_optDenyWarnings) in (((B_dTrait_dMonad.v__x62__x62__x61_ B_dEffect_dCore.v_Monad_ucc99eea03f4e7df1_uBase_x36_46_x36_Effect_x36_46_x36_Core_x36_46_x36_Eff_ur) ((((((((((v_checkPackageCode nFs) nConsole) nClock) nEnv) nProcess) nExit) nArgs) pkg) wantWarnings) o1)) (fun r -> ((B_dTrait_dApplicative.v_pure B_dEffect_dCore.v_Applicative_u19070277251d295b_uBase_x36_46_x36_Effect_x36_46_x36_Core_x36_46_x36_Eff_ur) { B_dData_dPair.f_Pair_first = (if ((B_dData_dPair.v_firstOf r) > code) then (B_dData_dPair.v_firstOf r) else code); B_dData_dPair.f_Pair_second = (B_dData_dPair.v_secondOf r) }))))))

# 1021 "Vuna/Compiler/Driver/CompilerCli.vuna"
let rec v_checkPkgsInProcess = (fun (nFs : string) (nConsole : string) (nClock : string) (nEnv : string) (nProcess : string) (nExit : string) (nArgs : string) (mc0 : Frontend_dPackages_dPkg.t_Package B_dData_dList.t_List) (mc1 : int) (mc2 : t_CliOpts) -> (match mc0 with
  | B_dData_dList.C_List__x58__x58_ (dtb__162, dtb__163) -> (((B_dTrait_dMonad.v__x62__x62__x61_ B_dEffect_dCore.v_Monad_ucc99eea03f4e7df1_uBase_x36_46_x36_Effect_x36_46_x36_Core_x36_46_x36_Eff_ur) ((((((((((v_checkPackageSeq nFs) nConsole) nClock) nEnv) nProcess) nExit) nArgs) dtb__162) mc1) mc2)) (fun r -> ((((((((((v_checkPkgsInProcess nFs) nConsole) nClock) nEnv) nProcess) nExit) nArgs) dtb__163) (B_dData_dPair.v_firstOf r)) (B_dData_dPair.v_secondOf r))))
  | B_dData_dList.C_List_Nil -> ((B_dTrait_dApplicative.v_pure B_dEffect_dCore.v_Applicative_u19070277251d295b_uBase_x36_46_x36_Effect_x36_46_x36_Core_x36_46_x36_Eff_ur) { B_dData_dPair.f_Pair_first = mc1; B_dData_dPair.f_Pair_second = mc2 })
  | _ -> failwith "DT: impossible branch"
))

# 1033 "Vuna/Compiler/Driver/CompilerCli.vuna"
let rec v_checkRootsSeq = (fun (nFs : string) (nConsole : string) (nClock : string) (nEnv : string) (nProcess : string) (nExit : string) (nArgs : string) (mc0 : Frontend_dPackages_dPkg.t_Package B_dData_dList.t_List) (mc1 : int) (mc2 : t_CliOpts) -> (match mc0 with
  | B_dData_dList.C_List__x58__x58_ (dtb__164, dtb__165) -> (((B_dTrait_dMonad.v__x62__x62__x61_ B_dEffect_dCore.v_Monad_ucc99eea03f4e7df1_uBase_x36_46_x36_Effect_x36_46_x36_Core_x36_46_x36_Eff_ur) ((((((((((v_checkPackageSeq nFs) nConsole) nClock) nEnv) nProcess) nExit) nArgs) dtb__164) mc1) mc2)) (fun r -> (let code1 = (B_dData_dPair.v_firstOf r) in (if (if (mc2).f_CliOpts_optFailFast then (code1 <> 0) else false) then ((B_dTrait_dApplicative.v_pure B_dEffect_dCore.v_Applicative_u19070277251d295b_uBase_x36_46_x36_Effect_x36_46_x36_Core_x36_46_x36_Eff_ur) { B_dData_dPair.f_Pair_first = code1; B_dData_dPair.f_Pair_second = (B_dData_dPair.v_secondOf r) }) else ((((((((((v_checkRootsSeq nFs) nConsole) nClock) nEnv) nProcess) nExit) nArgs) dtb__165) code1) (B_dData_dPair.v_secondOf r))))))
  | B_dData_dList.C_List_Nil -> ((B_dTrait_dApplicative.v_pure B_dEffect_dCore.v_Applicative_u19070277251d295b_uBase_x36_46_x36_Effect_x36_46_x36_Core_x36_46_x36_Eff_ur) { B_dData_dPair.f_Pair_first = mc1; B_dData_dPair.f_Pair_second = mc2 })
  | _ -> failwith "DT: impossible branch"
))

# 961 "Vuna/Compiler/Driver/CompilerCli.vuna"
let v_checkPackagesSpawn = (fun (nFs : string) (nConsole : string) (nClock : string) (nEnv : string) (nProcess : string) (nExit : string) (nArgs : string) (mc0 : Frontend_dPackages_dPkg.t_Package B_dData_dList.t_List) (mc1 : int) (mc2 : t_CliOpts) -> (match mc0 with
  | B_dData_dList.C_List_Nil -> ((B_dTrait_dApplicative.v_pure B_dEffect_dCore.v_Applicative_u19070277251d295b_uBase_x36_46_x36_Effect_x36_46_x36_Core_x36_46_x36_Eff_ur) { B_dData_dPair.f_Pair_first = mc1; B_dData_dPair.f_Pair_second = mc2 })
  | _ -> (let members = ((B_dData_dList.v_filter (fun (p : Frontend_dPackages_dPkg.t_Package) -> (B_dData_dBool.v_not (v_isWorkspaceRoot p)))) mc0) in (let roots = ((B_dData_dList.v_filter v_isWorkspaceRoot) mc0) in (let memberNames = ((B_dData_dList.v_map Frontend_dPackages_dPkg.v_packageName) members) in (((B_dTrait_dMonad.v__x62__x62__x61_ B_dEffect_dCore.v_Monad_ucc99eea03f4e7df1_uBase_x36_46_x36_Effect_x36_46_x36_Core_x36_46_x36_Eff_ur) ((((((((((v_checkRootsSeq nFs) nConsole) nClock) nEnv) nProcess) nExit) nArgs) roots) mc1) mc2)) (fun r1 -> (((((((((((((v_checkMembersByLevel nFs) nConsole) nClock) nEnv) nProcess) nExit) nArgs) (B_dData_dList.v_length members)) members) memberNames) B_dData_dList.C_List_Nil) (B_dData_dPair.v_firstOf r1)) (B_dData_dPair.v_secondOf r1)))))))
))

# 941 "Vuna/Compiler/Driver/CompilerCli.vuna"
let v_checkPackages = (fun (nFs : string) (nConsole : string) (nClock : string) (nEnv : string) (nProcess : string) (nExit : string) (nArgs : string) (mc0 : Frontend_dPackages_dPkg.t_Package B_dData_dList.t_List) (mc1 : int) (mc2 : t_CliOpts) -> (match mc0 with
  | B_dData_dList.C_List__x58__x58_ (dtb__166, dtb__167) -> (match dtb__167 with
  | B_dData_dList.C_List_Nil -> ((((((((((v_checkPackageSeq nFs) nConsole) nClock) nEnv) nProcess) nExit) nArgs) dtb__166) mc1) mc2)
  | _ -> (let oMachine = (v_markFormatExplicit mc2) in (if (v_isMachineFormat (mc2).f_CliOpts_optDiagFormat) then ((((((((((v_checkPkgsInProcess nFs) nConsole) nClock) nEnv) nProcess) nExit) nArgs) mc0) mc1) oMachine) else ((((((((((v_checkPackagesSpawn nFs) nConsole) nClock) nEnv) nProcess) nExit) nArgs) mc0) mc1) mc2)))
)
  | B_dData_dList.C_List_Nil -> ((B_dTrait_dApplicative.v_pure B_dEffect_dCore.v_Applicative_u19070277251d295b_uBase_x36_46_x36_Effect_x36_46_x36_Core_x36_46_x36_Eff_ur) { B_dData_dPair.f_Pair_first = mc1; B_dData_dPair.f_Pair_second = mc2 })
  | _ -> failwith "DT: impossible branch"
))

# 901 "Vuna/Compiler/Driver/CompilerCli.vuna"
let v_checkPkgDir = (fun (nFs : string) (nConsole : string) (nClock : string) (nEnv : string) (nProcess : string) (nExit : string) (nArgs : string) (dir : string) (o : t_CliOpts) -> (((B_dTrait_dMonad.v__x62__x62__x61_ B_dEffect_dCore.v_Monad_ucc99eea03f4e7df1_uBase_x36_46_x36_Effect_x36_46_x36_Core_x36_46_x36_Eff_ur) (((Frontend_dPackages_dPkg.v_workspacePackages nFs) nEnv) dir)) (fun pkgsR -> (match pkgsR with
  | Base_dDiag.C_Check_ErrC (dtb__168) -> ((((v_printDiag nFs) nConsole) o) dtb__168)
  | Base_dDiag.C_Check_OkC (dtb__169) -> ((((((((((v_checkPackages nFs) nConsole) nClock) nEnv) nProcess) nExit) nArgs) dtb__169) 0) o)
  | _ -> failwith "DT: impossible branch"
))))

# 890 "Vuna/Compiler/Driver/CompilerCli.vuna"
let v_checkEmit = (fun (nFs : string) (nConsole : string) (nClock : string) (nEnv : string) (nProcess : string) (nExit : string) (nArgs : string) (path : string) (o : t_CliOpts) -> (((B_dTrait_dMonad.v__x62__x62__x61_ B_dEffect_dCore.v_Monad_ucc99eea03f4e7df1_uBase_x36_46_x36_Effect_x36_46_x36_Core_x36_46_x36_Eff_ur) ((B_dEffect_dFs.v_fsFileExists nFs) path)) (fun exists -> (if exists then (((B_dTrait_dMonad.v__x62__x62__x61_ B_dEffect_dCore.v_Monad_ucc99eea03f4e7df1_uBase_x36_46_x36_Effect_x36_46_x36_Core_x36_46_x36_Eff_ur) ((B_dEffect_dFs.v_fsIsDirectory nFs) path)) (fun isDir -> (if isDir then (((((((((v_checkPkgDir nFs) nConsole) nClock) nEnv) nProcess) nExit) nArgs) path) o) else ((((((v_checkFileEntry nFs) nConsole) nEnv) nProcess) path) o)))) else ((v_withOpts o) ((v_dtPathErr nConsole) path))))))

# 878 "Vuna/Compiler/Driver/CompilerCli.vuna"
let rec v_checkArgs = (fun (nFs : string) (nConsole : string) (nClock : string) (nEnv : string) (nProcess : string) (nExit : string) (nArgs : string) (mc0 : string) (mc1 : string B_dData_dList.t_List) (mc2 : t_CliOpts) -> (match mc1 with
  | B_dData_dList.C_List__x58__x58_ (dtb__170, dtb__171) -> (if (dtb__170 = "--release") then ((((((((((v_checkArgs nFs) nConsole) nClock) nEnv) nProcess) nExit) nArgs) mc0) dtb__171) (v_markRelease mc2)) else (if ((B_dData_dString.v_startsWith "-") dtb__170) then ((v_withOpts mc2) (((v_removedFlag nConsole) mc0) dtb__170)) else (match dtb__171 with
  | B_dData_dList.C_List_Nil -> (((((((((v_checkEmit nFs) nConsole) nClock) nEnv) nProcess) nExit) nArgs) dtb__170) mc2)
  | _ -> ((v_withOpts mc2) ((v_usageErr nConsole) mc0))
)))
  | B_dData_dList.C_List_Nil -> ((v_withOpts mc2) ((v_usageErr nConsole) mc0))
  | _ -> failwith "DT: impossible branch"
))

# 568 "Vuna/Compiler/Driver/CompilerCli.vuna"
let v_runCompilerCliFor1 = (fun (nFs : string) (nConsole : string) (nClock : string) (nEnv : string) (nProcess : string) (nExit : string) (nArgs : string) (nTty : string) (prog : string) (args : string B_dData_dList.t_List) (o : t_CliOpts) -> (match args with
  | B_dData_dList.C_List_Nil -> ((v_withOpts o) ((v_usageErr nConsole) prog))
  | B_dData_dList.C_List__x58__x58_ (dtb__172, dtb__173) -> (if (dtb__172 = "compile") then ((((((((v_compileArgs nFs) nConsole) nClock) nEnv) nProcess) prog) dtb__173) o) else (if (dtb__172 = "check") then ((((((((((v_checkArgs nFs) nConsole) nClock) nEnv) nProcess) nExit) nArgs) prog) dtb__173) o) else (if (dtb__172 = "build") then ((((((((((v_buildArgs nFs) nConsole) nClock) nEnv) nProcess) nExit) nArgs) prog) dtb__173) o) else (if (dtb__172 = "version") then ((v_withOpts o) ((v_printVersion nConsole) 0)) else (if (dtb__172 = "--version") then ((v_withOpts o) ((v_printVersion nConsole) 0)) else (if (dtb__172 = "seed") then ((v_withOpts o) ((((v_removedCommand nConsole) prog) "seed") "use build --out OUT [DIR] or compile DIR OUT")) else (if (dtb__172 = "help") then ((v_withOpts o) ((v_helpFor nConsole) prog)) else (if ((B_dData_dString.v_startsWith "-") dtb__172) then ((v_withOpts o) (((v_removedFlag nConsole) prog) dtb__172)) else ((v_withOpts o) (((v_unknownCommand nConsole) prog) dtb__172))))))))))
  | _ -> failwith "DT: impossible branch"
))

# 502 "Vuna/Compiler/Driver/CompilerCli.vuna"
let v_runCompilerCliFor = (fun (nFs : string) (nConsole : string) (nClock : string) (nEnv : string) (nProcess : string) (nExit : string) (nArgs : string) (nTty : string) (prog : string) (args : string B_dData_dList.t_List) -> (((B_dTrait_dMonad.v__x62__x62__x61_ B_dEffect_dCore.v_Monad_ucc99eea03f4e7df1_uBase_x36_46_x36_Effect_x36_46_x36_Core_x36_46_x36_Eff_ur) ((B_dEffect_dEnv.v_envGetEnv nEnv) "VUNA_RELEASE")) (fun envRel -> (((B_dTrait_dMonad.v__x62__x62__x61_ B_dEffect_dCore.v_Monad_ucc99eea03f4e7df1_uBase_x36_46_x36_Effect_x36_46_x36_Core_x36_46_x36_Eff_ur) (B_dEffect_dTty.v_ttyIsTty nTty)) (fun tty -> (let stripped = (v_stripDiagFormat args) in (let strippedLang = (v_stripLang (B_dData_dPair.v_firstOf stripped)) in (let strippedMax = (v_stripMaxErrors (B_dData_dPair.v_firstOf strippedLang)) in (let kept = (v_stripDenyWarnings (B_dData_dPair.v_firstOf strippedMax)) in (let strippedContinue = (v_stripContinueOnError kept) in (let detectedLang = (B_dData_dPair.v_secondOf strippedLang) in (let fmt = (match (B_dData_dPair.v_secondOf stripped) with
  | B_dData_dMaybe.C_Maybe_Just (dtb__174) -> dtb__174
  | B_dData_dMaybe.C_Maybe_Nothing -> (if (detectedLang = "en") then (if tty then "human" else "short") else "human")
  | _ -> failwith "DT: impossible branch"
) in (let opts = { f_CliOpts_optDiagFormat = fmt; f_CliOpts_optDiagLang = detectedLang; f_CliOpts_optLangExplicit = (v_hasLangFlag args); f_CliOpts_optDenyWarnings = (v_hasDenyWarnings args); f_CliOpts_optShowWarnings = (if (v_hasDenyWarnings args) then true else (v_hasShowWarnings args)); f_CliOpts_optFormatExplicit = (v_hasFormatFlag args); f_CliOpts_optWarningsExplicit = (if (v_hasDenyWarnings args) then true else (v_hasShowWarnings args)); f_CliOpts_optDenyExplicit = (v_hasDenyWarnings args); f_CliOpts_optMaxErrors = (B_dData_dPair.v_secondOf strippedMax); f_CliOpts_optContinueOnError = (B_dData_dPair.v_secondOf strippedContinue); f_CliOpts_optSarifItems = B_dData_dList.C_List_Nil; f_CliOpts_optRelease = (envRel = "1"); f_CliOpts_optShowCascade = (v_hasShowCascade args); f_CliOpts_optWithSources = (v_hasWithSources args); f_CliOpts_optFailFast = (v_hasFailFast args); f_CliOpts_optTarget = "ocaml"; f_CliOpts_optWasmOpt = 3 } in (if (v_anyHelp (B_dData_dPair.v_firstOf strippedContinue)) then ((v_helpFor nConsole) prog) else (((B_dTrait_dMonad.v__x62__x62__x61_ B_dEffect_dCore.v_Monad_ucc99eea03f4e7df1_uBase_x36_46_x36_Effect_x36_46_x36_Core_x36_46_x36_Eff_ur) (((((((((((v_runCompilerCliFor1 nFs) nConsole) nClock) nEnv) nProcess) nExit) nArgs) nTty) prog) (v_stripFailFast (v_stripWithSources (v_stripShowCascade (B_dData_dPair.v_firstOf strippedContinue))))) opts)) (fun r -> (((((v_flushSarif nFs) nConsole) nEnv) (B_dData_dPair.v_firstOf r)) (B_dData_dPair.v_secondOf r))))))))))))))))))

# 69 "Vuna/Compiler/Driver/CompilerCli.vuna"
let v_runCompilerCli = (fun (nFs : string) (nConsole : string) (nClock : string) (nEnv : string) (nProcess : string) (nExit : string) (nArgs : string) (nTty : string) (args : string B_dData_dList.t_List) -> ((((((((((v_runCompilerCliFor nFs) nConsole) nClock) nEnv) nProcess) nExit) nArgs) nTty) "vuna") args))

# 73 "Vuna/Compiler/Driver/CompilerCli.vuna"
let v_optDiagFormat = (fun (p : t_CliOpts) -> (match p with
  | { f_CliOpts_optDiagFormat = dtb__175; f_CliOpts_optDiagLang = dtb__176; f_CliOpts_optLangExplicit = dtb__177; f_CliOpts_optDenyWarnings = dtb__178; f_CliOpts_optShowWarnings = dtb__179; f_CliOpts_optFormatExplicit = dtb__180; f_CliOpts_optWarningsExplicit = dtb__181; f_CliOpts_optDenyExplicit = dtb__182; f_CliOpts_optMaxErrors = dtb__183; f_CliOpts_optContinueOnError = dtb__184; f_CliOpts_optSarifItems = dtb__185; f_CliOpts_optRelease = dtb__186; f_CliOpts_optShowCascade = dtb__187; f_CliOpts_optWithSources = dtb__188; f_CliOpts_optFailFast = dtb__189; f_CliOpts_optTarget = dtb__190; f_CliOpts_optWasmOpt = dtb__191 } -> dtb__175
  | _ -> failwith "DT: impossible branch"
))

# 74 "Vuna/Compiler/Driver/CompilerCli.vuna"
let v_optDiagLang = (fun (p : t_CliOpts) -> (match p with
  | { f_CliOpts_optDiagFormat = dtb__192; f_CliOpts_optDiagLang = dtb__193; f_CliOpts_optLangExplicit = dtb__194; f_CliOpts_optDenyWarnings = dtb__195; f_CliOpts_optShowWarnings = dtb__196; f_CliOpts_optFormatExplicit = dtb__197; f_CliOpts_optWarningsExplicit = dtb__198; f_CliOpts_optDenyExplicit = dtb__199; f_CliOpts_optMaxErrors = dtb__200; f_CliOpts_optContinueOnError = dtb__201; f_CliOpts_optSarifItems = dtb__202; f_CliOpts_optRelease = dtb__203; f_CliOpts_optShowCascade = dtb__204; f_CliOpts_optWithSources = dtb__205; f_CliOpts_optFailFast = dtb__206; f_CliOpts_optTarget = dtb__207; f_CliOpts_optWasmOpt = dtb__208 } -> dtb__193
  | _ -> failwith "DT: impossible branch"
))

# 75 "Vuna/Compiler/Driver/CompilerCli.vuna"
let v_optLangExplicit = (fun (p : t_CliOpts) -> (match p with
  | { f_CliOpts_optDiagFormat = dtb__209; f_CliOpts_optDiagLang = dtb__210; f_CliOpts_optLangExplicit = dtb__211; f_CliOpts_optDenyWarnings = dtb__212; f_CliOpts_optShowWarnings = dtb__213; f_CliOpts_optFormatExplicit = dtb__214; f_CliOpts_optWarningsExplicit = dtb__215; f_CliOpts_optDenyExplicit = dtb__216; f_CliOpts_optMaxErrors = dtb__217; f_CliOpts_optContinueOnError = dtb__218; f_CliOpts_optSarifItems = dtb__219; f_CliOpts_optRelease = dtb__220; f_CliOpts_optShowCascade = dtb__221; f_CliOpts_optWithSources = dtb__222; f_CliOpts_optFailFast = dtb__223; f_CliOpts_optTarget = dtb__224; f_CliOpts_optWasmOpt = dtb__225 } -> dtb__211
  | _ -> failwith "DT: impossible branch"
))

# 76 "Vuna/Compiler/Driver/CompilerCli.vuna"
let v_optDenyWarnings = (fun (p : t_CliOpts) -> (match p with
  | { f_CliOpts_optDiagFormat = dtb__226; f_CliOpts_optDiagLang = dtb__227; f_CliOpts_optLangExplicit = dtb__228; f_CliOpts_optDenyWarnings = dtb__229; f_CliOpts_optShowWarnings = dtb__230; f_CliOpts_optFormatExplicit = dtb__231; f_CliOpts_optWarningsExplicit = dtb__232; f_CliOpts_optDenyExplicit = dtb__233; f_CliOpts_optMaxErrors = dtb__234; f_CliOpts_optContinueOnError = dtb__235; f_CliOpts_optSarifItems = dtb__236; f_CliOpts_optRelease = dtb__237; f_CliOpts_optShowCascade = dtb__238; f_CliOpts_optWithSources = dtb__239; f_CliOpts_optFailFast = dtb__240; f_CliOpts_optTarget = dtb__241; f_CliOpts_optWasmOpt = dtb__242 } -> dtb__229
  | _ -> failwith "DT: impossible branch"
))

# 77 "Vuna/Compiler/Driver/CompilerCli.vuna"
let v_optShowWarnings = (fun (p : t_CliOpts) -> (match p with
  | { f_CliOpts_optDiagFormat = dtb__243; f_CliOpts_optDiagLang = dtb__244; f_CliOpts_optLangExplicit = dtb__245; f_CliOpts_optDenyWarnings = dtb__246; f_CliOpts_optShowWarnings = dtb__247; f_CliOpts_optFormatExplicit = dtb__248; f_CliOpts_optWarningsExplicit = dtb__249; f_CliOpts_optDenyExplicit = dtb__250; f_CliOpts_optMaxErrors = dtb__251; f_CliOpts_optContinueOnError = dtb__252; f_CliOpts_optSarifItems = dtb__253; f_CliOpts_optRelease = dtb__254; f_CliOpts_optShowCascade = dtb__255; f_CliOpts_optWithSources = dtb__256; f_CliOpts_optFailFast = dtb__257; f_CliOpts_optTarget = dtb__258; f_CliOpts_optWasmOpt = dtb__259 } -> dtb__247
  | _ -> failwith "DT: impossible branch"
))

# 78 "Vuna/Compiler/Driver/CompilerCli.vuna"
let v_optFormatExplicit = (fun (p : t_CliOpts) -> (match p with
  | { f_CliOpts_optDiagFormat = dtb__260; f_CliOpts_optDiagLang = dtb__261; f_CliOpts_optLangExplicit = dtb__262; f_CliOpts_optDenyWarnings = dtb__263; f_CliOpts_optShowWarnings = dtb__264; f_CliOpts_optFormatExplicit = dtb__265; f_CliOpts_optWarningsExplicit = dtb__266; f_CliOpts_optDenyExplicit = dtb__267; f_CliOpts_optMaxErrors = dtb__268; f_CliOpts_optContinueOnError = dtb__269; f_CliOpts_optSarifItems = dtb__270; f_CliOpts_optRelease = dtb__271; f_CliOpts_optShowCascade = dtb__272; f_CliOpts_optWithSources = dtb__273; f_CliOpts_optFailFast = dtb__274; f_CliOpts_optTarget = dtb__275; f_CliOpts_optWasmOpt = dtb__276 } -> dtb__265
  | _ -> failwith "DT: impossible branch"
))

# 79 "Vuna/Compiler/Driver/CompilerCli.vuna"
let v_optWarningsExplicit = (fun (p : t_CliOpts) -> (match p with
  | { f_CliOpts_optDiagFormat = dtb__277; f_CliOpts_optDiagLang = dtb__278; f_CliOpts_optLangExplicit = dtb__279; f_CliOpts_optDenyWarnings = dtb__280; f_CliOpts_optShowWarnings = dtb__281; f_CliOpts_optFormatExplicit = dtb__282; f_CliOpts_optWarningsExplicit = dtb__283; f_CliOpts_optDenyExplicit = dtb__284; f_CliOpts_optMaxErrors = dtb__285; f_CliOpts_optContinueOnError = dtb__286; f_CliOpts_optSarifItems = dtb__287; f_CliOpts_optRelease = dtb__288; f_CliOpts_optShowCascade = dtb__289; f_CliOpts_optWithSources = dtb__290; f_CliOpts_optFailFast = dtb__291; f_CliOpts_optTarget = dtb__292; f_CliOpts_optWasmOpt = dtb__293 } -> dtb__283
  | _ -> failwith "DT: impossible branch"
))

# 80 "Vuna/Compiler/Driver/CompilerCli.vuna"
let v_optDenyExplicit = (fun (p : t_CliOpts) -> (match p with
  | { f_CliOpts_optDiagFormat = dtb__294; f_CliOpts_optDiagLang = dtb__295; f_CliOpts_optLangExplicit = dtb__296; f_CliOpts_optDenyWarnings = dtb__297; f_CliOpts_optShowWarnings = dtb__298; f_CliOpts_optFormatExplicit = dtb__299; f_CliOpts_optWarningsExplicit = dtb__300; f_CliOpts_optDenyExplicit = dtb__301; f_CliOpts_optMaxErrors = dtb__302; f_CliOpts_optContinueOnError = dtb__303; f_CliOpts_optSarifItems = dtb__304; f_CliOpts_optRelease = dtb__305; f_CliOpts_optShowCascade = dtb__306; f_CliOpts_optWithSources = dtb__307; f_CliOpts_optFailFast = dtb__308; f_CliOpts_optTarget = dtb__309; f_CliOpts_optWasmOpt = dtb__310 } -> dtb__301
  | _ -> failwith "DT: impossible branch"
))

# 81 "Vuna/Compiler/Driver/CompilerCli.vuna"
let v_optMaxErrors = (fun (p : t_CliOpts) -> (match p with
  | { f_CliOpts_optDiagFormat = dtb__311; f_CliOpts_optDiagLang = dtb__312; f_CliOpts_optLangExplicit = dtb__313; f_CliOpts_optDenyWarnings = dtb__314; f_CliOpts_optShowWarnings = dtb__315; f_CliOpts_optFormatExplicit = dtb__316; f_CliOpts_optWarningsExplicit = dtb__317; f_CliOpts_optDenyExplicit = dtb__318; f_CliOpts_optMaxErrors = dtb__319; f_CliOpts_optContinueOnError = dtb__320; f_CliOpts_optSarifItems = dtb__321; f_CliOpts_optRelease = dtb__322; f_CliOpts_optShowCascade = dtb__323; f_CliOpts_optWithSources = dtb__324; f_CliOpts_optFailFast = dtb__325; f_CliOpts_optTarget = dtb__326; f_CliOpts_optWasmOpt = dtb__327 } -> dtb__319
  | _ -> failwith "DT: impossible branch"
))

# 82 "Vuna/Compiler/Driver/CompilerCli.vuna"
let v_optContinueOnError = (fun (p : t_CliOpts) -> (match p with
  | { f_CliOpts_optDiagFormat = dtb__328; f_CliOpts_optDiagLang = dtb__329; f_CliOpts_optLangExplicit = dtb__330; f_CliOpts_optDenyWarnings = dtb__331; f_CliOpts_optShowWarnings = dtb__332; f_CliOpts_optFormatExplicit = dtb__333; f_CliOpts_optWarningsExplicit = dtb__334; f_CliOpts_optDenyExplicit = dtb__335; f_CliOpts_optMaxErrors = dtb__336; f_CliOpts_optContinueOnError = dtb__337; f_CliOpts_optSarifItems = dtb__338; f_CliOpts_optRelease = dtb__339; f_CliOpts_optShowCascade = dtb__340; f_CliOpts_optWithSources = dtb__341; f_CliOpts_optFailFast = dtb__342; f_CliOpts_optTarget = dtb__343; f_CliOpts_optWasmOpt = dtb__344 } -> dtb__337
  | _ -> failwith "DT: impossible branch"
))

# 83 "Vuna/Compiler/Driver/CompilerCli.vuna"
let v_optSarifItems = (fun (p : t_CliOpts) -> (match p with
  | { f_CliOpts_optDiagFormat = dtb__345; f_CliOpts_optDiagLang = dtb__346; f_CliOpts_optLangExplicit = dtb__347; f_CliOpts_optDenyWarnings = dtb__348; f_CliOpts_optShowWarnings = dtb__349; f_CliOpts_optFormatExplicit = dtb__350; f_CliOpts_optWarningsExplicit = dtb__351; f_CliOpts_optDenyExplicit = dtb__352; f_CliOpts_optMaxErrors = dtb__353; f_CliOpts_optContinueOnError = dtb__354; f_CliOpts_optSarifItems = dtb__355; f_CliOpts_optRelease = dtb__356; f_CliOpts_optShowCascade = dtb__357; f_CliOpts_optWithSources = dtb__358; f_CliOpts_optFailFast = dtb__359; f_CliOpts_optTarget = dtb__360; f_CliOpts_optWasmOpt = dtb__361 } -> dtb__355
  | _ -> failwith "DT: impossible branch"
))

# 84 "Vuna/Compiler/Driver/CompilerCli.vuna"
let v_optRelease = (fun (p : t_CliOpts) -> (match p with
  | { f_CliOpts_optDiagFormat = dtb__362; f_CliOpts_optDiagLang = dtb__363; f_CliOpts_optLangExplicit = dtb__364; f_CliOpts_optDenyWarnings = dtb__365; f_CliOpts_optShowWarnings = dtb__366; f_CliOpts_optFormatExplicit = dtb__367; f_CliOpts_optWarningsExplicit = dtb__368; f_CliOpts_optDenyExplicit = dtb__369; f_CliOpts_optMaxErrors = dtb__370; f_CliOpts_optContinueOnError = dtb__371; f_CliOpts_optSarifItems = dtb__372; f_CliOpts_optRelease = dtb__373; f_CliOpts_optShowCascade = dtb__374; f_CliOpts_optWithSources = dtb__375; f_CliOpts_optFailFast = dtb__376; f_CliOpts_optTarget = dtb__377; f_CliOpts_optWasmOpt = dtb__378 } -> dtb__373
  | _ -> failwith "DT: impossible branch"
))

# 85 "Vuna/Compiler/Driver/CompilerCli.vuna"
let v_optShowCascade = (fun (p : t_CliOpts) -> (match p with
  | { f_CliOpts_optDiagFormat = dtb__379; f_CliOpts_optDiagLang = dtb__380; f_CliOpts_optLangExplicit = dtb__381; f_CliOpts_optDenyWarnings = dtb__382; f_CliOpts_optShowWarnings = dtb__383; f_CliOpts_optFormatExplicit = dtb__384; f_CliOpts_optWarningsExplicit = dtb__385; f_CliOpts_optDenyExplicit = dtb__386; f_CliOpts_optMaxErrors = dtb__387; f_CliOpts_optContinueOnError = dtb__388; f_CliOpts_optSarifItems = dtb__389; f_CliOpts_optRelease = dtb__390; f_CliOpts_optShowCascade = dtb__391; f_CliOpts_optWithSources = dtb__392; f_CliOpts_optFailFast = dtb__393; f_CliOpts_optTarget = dtb__394; f_CliOpts_optWasmOpt = dtb__395 } -> dtb__391
  | _ -> failwith "DT: impossible branch"
))

# 86 "Vuna/Compiler/Driver/CompilerCli.vuna"
let v_optWithSources = (fun (p : t_CliOpts) -> (match p with
  | { f_CliOpts_optDiagFormat = dtb__396; f_CliOpts_optDiagLang = dtb__397; f_CliOpts_optLangExplicit = dtb__398; f_CliOpts_optDenyWarnings = dtb__399; f_CliOpts_optShowWarnings = dtb__400; f_CliOpts_optFormatExplicit = dtb__401; f_CliOpts_optWarningsExplicit = dtb__402; f_CliOpts_optDenyExplicit = dtb__403; f_CliOpts_optMaxErrors = dtb__404; f_CliOpts_optContinueOnError = dtb__405; f_CliOpts_optSarifItems = dtb__406; f_CliOpts_optRelease = dtb__407; f_CliOpts_optShowCascade = dtb__408; f_CliOpts_optWithSources = dtb__409; f_CliOpts_optFailFast = dtb__410; f_CliOpts_optTarget = dtb__411; f_CliOpts_optWasmOpt = dtb__412 } -> dtb__409
  | _ -> failwith "DT: impossible branch"
))

# 87 "Vuna/Compiler/Driver/CompilerCli.vuna"
let v_optFailFast = (fun (p : t_CliOpts) -> (match p with
  | { f_CliOpts_optDiagFormat = dtb__413; f_CliOpts_optDiagLang = dtb__414; f_CliOpts_optLangExplicit = dtb__415; f_CliOpts_optDenyWarnings = dtb__416; f_CliOpts_optShowWarnings = dtb__417; f_CliOpts_optFormatExplicit = dtb__418; f_CliOpts_optWarningsExplicit = dtb__419; f_CliOpts_optDenyExplicit = dtb__420; f_CliOpts_optMaxErrors = dtb__421; f_CliOpts_optContinueOnError = dtb__422; f_CliOpts_optSarifItems = dtb__423; f_CliOpts_optRelease = dtb__424; f_CliOpts_optShowCascade = dtb__425; f_CliOpts_optWithSources = dtb__426; f_CliOpts_optFailFast = dtb__427; f_CliOpts_optTarget = dtb__428; f_CliOpts_optWasmOpt = dtb__429 } -> dtb__427
  | _ -> failwith "DT: impossible branch"
))

# 88 "Vuna/Compiler/Driver/CompilerCli.vuna"
let v_optTarget = (fun (p : t_CliOpts) -> (match p with
  | { f_CliOpts_optDiagFormat = dtb__430; f_CliOpts_optDiagLang = dtb__431; f_CliOpts_optLangExplicit = dtb__432; f_CliOpts_optDenyWarnings = dtb__433; f_CliOpts_optShowWarnings = dtb__434; f_CliOpts_optFormatExplicit = dtb__435; f_CliOpts_optWarningsExplicit = dtb__436; f_CliOpts_optDenyExplicit = dtb__437; f_CliOpts_optMaxErrors = dtb__438; f_CliOpts_optContinueOnError = dtb__439; f_CliOpts_optSarifItems = dtb__440; f_CliOpts_optRelease = dtb__441; f_CliOpts_optShowCascade = dtb__442; f_CliOpts_optWithSources = dtb__443; f_CliOpts_optFailFast = dtb__444; f_CliOpts_optTarget = dtb__445; f_CliOpts_optWasmOpt = dtb__446 } -> dtb__445
  | _ -> failwith "DT: impossible branch"
))

# 89 "Vuna/Compiler/Driver/CompilerCli.vuna"
let v_optWasmOpt = (fun (p : t_CliOpts) -> (match p with
  | { f_CliOpts_optDiagFormat = dtb__447; f_CliOpts_optDiagLang = dtb__448; f_CliOpts_optLangExplicit = dtb__449; f_CliOpts_optDenyWarnings = dtb__450; f_CliOpts_optShowWarnings = dtb__451; f_CliOpts_optFormatExplicit = dtb__452; f_CliOpts_optWarningsExplicit = dtb__453; f_CliOpts_optDenyExplicit = dtb__454; f_CliOpts_optMaxErrors = dtb__455; f_CliOpts_optContinueOnError = dtb__456; f_CliOpts_optSarifItems = dtb__457; f_CliOpts_optRelease = dtb__458; f_CliOpts_optShowCascade = dtb__459; f_CliOpts_optWithSources = dtb__460; f_CliOpts_optFailFast = dtb__461; f_CliOpts_optTarget = dtb__462; f_CliOpts_optWasmOpt = dtb__463 } -> dtb__463
  | _ -> failwith "DT: impossible branch"
))
