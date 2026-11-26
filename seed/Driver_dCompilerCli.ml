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
let[@tail_mod_cons] rec v_takeDiagsGo = (fun (mc0 : int) (mc1 : Base_dDiag.t_Diagnostic B_dData_dList.t_List) -> (match mc1 with
  | B_dData_dList.C_List__x58__x58_ (dtb__8, dtb__9) -> (if (mc0 <= 0) then B_dData_dList.C_List_Nil else (B_dData_dList.C_List__x58__x58_ (dtb__8, ((v_takeDiagsGo (mc0 - 1)) dtb__9))))
  | B_dData_dList.C_List_Nil -> B_dData_dList.C_List_Nil
  | _ -> failwith "DT: impossible branch"
))

# 274 "Vuna/Compiler/Driver/CompilerCli.vuna"
let v_takeDiags = (fun (n : int) (ds : Base_dDiag.t_Diagnostic B_dData_dList.t_List) -> (if (n <= 0) then ds else ((v_takeDiagsGo n) ds)))

# 283 "Vuna/Compiler/Driver/CompilerCli.vuna"
let[@tail_mod_cons] rec v_stripDenyWarnings = (fun (mc0 : string B_dData_dList.t_List) -> (match mc0 with
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
let[@tail_mod_cons] rec v_stripShowCascade = (fun (mc0 : string B_dData_dList.t_List) -> (match mc0 with
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
let[@tail_mod_cons] rec v_stripFailFast = (fun (mc0 : string B_dData_dList.t_List) -> (match mc0 with
  | B_dData_dList.C_List__x58__x58_ (dtb__22, dtb__23) -> (if (dtb__22 = "--fail-fast") then (v_stripFailFast dtb__23) else (B_dData_dList.C_List__x58__x58_ (dtb__22, (v_stripFailFast dtb__23))))
  | B_dData_dList.C_List_Nil -> B_dData_dList.C_List_Nil
  | _ -> failwith "DT: impossible branch"
))

# 319 "Vuna/Compiler/Driver/CompilerCli.vuna"
let[@tail_mod_cons] rec v_stripWithSources = (fun (mc0 : string B_dData_dList.t_List) -> (match mc0 with
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
let v_stripPathPrefix = (fun (base : string) (file : string) -> (if ((B_dData_dString.v_startsWith (base ^ "/")) file) then (((B_dData_dString.v_substring (bi_natFromInt ((String.length base) + 1))) (bi_natFromInt (((String.length file) - (String.length base)) - 1))) file) else file))

# 369 "Vuna/Compiler/Driver/CompilerCli.vuna"
let rec v_splitSlashGo = (fun (mc0 : int B_dData_dList.t_List) (mc1 : int B_dData_dList.t_List) (mc2 : string B_dData_dList.t_List) -> (match mc0 with
  | B_dData_dList.C_List__x58__x58_ (dtb__35, dtb__36) -> (if (dtb__35 = 47) then (((v_splitSlashGo dtb__36) B_dData_dList.C_List_Nil) (B_dData_dList.C_List__x58__x58_ ((B_dData_dList.dtp_pack (B_dData_dList.v_reverse mc1)), mc2))) else (((v_splitSlashGo dtb__36) (B_dData_dList.C_List__x58__x58_ (dtb__35, mc1))) mc2))
  | B_dData_dList.C_List_Nil -> (B_dData_dList.v_reverse (B_dData_dList.C_List__x58__x58_ ((B_dData_dList.dtp_pack (B_dData_dList.v_reverse mc1)), mc2)))
  | _ -> failwith "DT: impossible branch"
))

# 366 "Vuna/Compiler/Driver/CompilerCli.vuna"
let v_splitSlash = (fun (s : string) -> (((v_splitSlashGo (B_dData_dList.dtp_unpack s)) B_dData_dList.C_List_Nil) B_dData_dList.C_List_Nil))

# 377 "Vuna/Compiler/Driver/CompilerCli.vuna"
let v_moduleOfRel = (fun (rel : string) -> (let rel1 = (if ((B_dData_dString.v_startsWith "lib/") rel) then (((B_dData_dString.v_substring (bi_natFromInt 4)) (bi_natFromInt ((String.length rel) - 4))) rel) else (if ((B_dData_dString.v_startsWith "app/") rel) then (((B_dData_dString.v_substring (bi_natFromInt 4)) (bi_natFromInt ((String.length rel) - 4))) rel) else rel)) in (let rel2 = (if ((B_dData_dString.v_endsWith ".vuna") rel1) then (((B_dData_dString.v_substring 0) (bi_natFromInt ((String.length rel1) - 5))) rel1) else rel1) in ((B_dData_dString.v_join ".") (v_splitSlash rel2)))))

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
let v_sourceRefEff = (fun (nFs : string) (nEnv : string) (file : string) -> (((B_dTrait_dMonad.v__x62__x62__x61_ B_dEffect_dCore.v_Monad_ucc99eea03f4e7df1_uBase_x36_46_x36_Effect_x36_46_x36_Core_x36_46_x36_Eff_ur) ((Frontend_dPackages_dPkg.v_absolutePath nEnv) file)) (fun abs -> (((B_dTrait_dMonad.v__x62__x62__x61_ B_dEffect_dCore.v_Monad_ucc99eea03f4e7df1_uBase_x36_46_x36_Effect_x36_46_x36_Core_x36_46_x36_Eff_ur) ((B_dEffect_dFs.v_fsFileExists nFs) abs)) (fun exists -> (((B_dTrait_dMonad.v__x62__x62__x61_ B_dEffect_dCore.v_Monad_ucc99eea03f4e7df1_uBase_x36_46_x36_Effect_x36_46_x36_Core_x36_46_x36_Eff_ur) (if exists then (((B_dTrait_dMonad.v__x62__x62__x61_ B_dEffect_dCore.v_Monad_ucc99eea03f4e7df1_uBase_x36_46_x36_Effect_x36_46_x36_Core_x36_46_x36_Eff_ur) ((B_dEffect_dFs.v_fsReadFile nFs) abs)) (fun text -> ((B_dTrait_dApplicative.v_pure B_dEffect_dCore.v_Applicative_u19070277251d295b_uBase_x36_46_x36_Effect_x36_46_x36_Core_x36_46_x36_Eff_ur) (string_of_int (Loader_dFingerprint.v_textHashOf text))))) else ((B_dTrait_dApplicative.v_pure B_dEffect_dCore.v_Applicative_u19070277251d295b_uBase_x36_46_x36_Effect_x36_46_x36_Core_x36_46_x36_Eff_ur) ""))) (fun digest -> (((B_dTrait_dMonad.v__x62__x62__x61_ B_dEffect_dCore.v_Monad_ucc99eea03f4e7df1_uBase_x36_46_x36_Effect_x36_46_x36_Core_x36_46_x36_Eff_ur) (((v_findPkgRootGo nFs) 12) (v_dirOf abs))) (fun root -> (let pkgDir = (B_dData_dPair.v_firstOf root) in (let pkgName = (B_dData_dPair.v_secondOf root) in (let rel = (if (pkgDir = "") then file else ((v_stripPathPrefix pkgDir) abs)) in ((B_dTrait_dApplicative.v_pure B_dEffect_dCore.v_Applicative_u19070277251d295b_uBase_x36_46_x36_Effect_x36_46_x36_Core_x36_46_x36_Eff_ur) { Base_dDiag_dFormat.f_SourceRef_srcFile = file; Base_dDiag_dFormat.f_SourceRef_srcDigest = digest; Base_dDiag_dFormat.f_SourceRef_srcPackage = pkgName; Base_dDiag_dFormat.f_SourceRef_srcModule = (v_moduleOfRel rel); Base_dDiag_dFormat.f_SourceRef_srcRelPath = rel })))))))))))))

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
) else (if ((B_dData_dString.v_startsWith "--error-format=") dtb__47) then (((v_stripDiagFormatGo dtb__48) mc1) (B_dData_dMaybe.C_Maybe_Just ((((B_dData_dString.v_substring (bi_natFromInt 15)) (bi_natFromInt ((String.length dtb__47) - 15))) dtb__47)))) else (if ((B_dData_dString.v_startsWith "--message-format=") dtb__47) then (((v_stripDiagFormatGo dtb__48) mc1) (B_dData_dMaybe.C_Maybe_Just ((((B_dData_dString.v_substring (bi_natFromInt 17)) (bi_natFromInt ((String.length dtb__47) - 17))) dtb__47)))) else (((v_stripDiagFormatGo dtb__48) (B_dData_dList.C_List__x58__x58_ (dtb__47, mc1))) mc2)))))
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
) else (if ((B_dData_dString.v_startsWith "--max-errors=") dtb__53) then (((v_stripMaxErrorsGo dtb__54) mc1) ((v_parseIntOr (((B_dData_dString.v_substring (bi_natFromInt 13)) (bi_natFromInt ((String.length dtb__53) - 13))) dtb__53)) mc2)) else (((v_stripMaxErrorsGo dtb__54) (B_dData_dList.C_List__x58__x58_ (dtb__53, mc1))) mc2)))
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
let v_checkSpawnArgs = (fun (o : t_CliOpts) (dir : string) -> (let head0 = (if (o).f_CliOpts_optRelease then (B_dData_dList.C_List__x58__x58_ ("check", (B_dData_dList.C_List__x58__x58_ ("--release", B_dData_dList.C_List_Nil)))) else (B_dData_dList.C_List__x58__x58_ ("check", B_dData_dList.C_List_Nil))) in (let base = (if ((o).f_CliOpts_optDiagFormat = "short") then ((B_dData_dList.v_append head0) (B_dData_dList.C_List__x58__x58_ (dir, B_dData_dList.C_List_Nil))) else ((B_dData_dList.v_append head0) (B_dData_dList.C_List__x58__x58_ ("--error-format", (B_dData_dList.C_List__x58__x58_ ((o).f_CliOpts_optDiagFormat, (B_dData_dList.C_List__x58__x58_ (dir, B_dData_dList.C_List_Nil)))))))) in (let base2 = (if (o).f_CliOpts_optShowWarnings then ((B_dData_dList.v_append base) (B_dData_dList.C_List__x58__x58_ ("--warnings", B_dData_dList.C_List_Nil))) else base) in (let base3 = (if (o).f_CliOpts_optDenyWarnings then ((B_dData_dList.v_append base2) (B_dData_dList.C_List__x58__x58_ ("--deny-warnings", B_dData_dList.C_List_Nil))) else base2) in (let langArgs = (if (o).f_CliOpts_optLangExplicit then (B_dData_dList.C_List__x58__x58_ ("--lang", (B_dData_dList.C_List__x58__x58_ ((o).f_CliOpts_optDiagLang, B_dData_dList.C_List_Nil)))) else B_dData_dList.C_List_Nil) in (let cascadeArgs = (if (o).f_CliOpts_optShowCascade then (B_dData_dList.C_List__x58__x58_ ("--show-cascade", B_dData_dList.C_List_Nil)) else B_dData_dList.C_List_Nil) in (let sourceArgs = (if (o).f_CliOpts_optWithSources then (B_dData_dList.C_List__x58__x58_ ("--with-sources", B_dData_dList.C_List_Nil)) else B_dData_dList.C_List_Nil) in (let failFastArgs = (if (o).f_CliOpts_optFailFast then (B_dData_dList.C_List__x58__x58_ ("--fail-fast", B_dData_dList.C_List_Nil)) else B_dData_dList.C_List_Nil) in (let maxArgs = (if ((o).f_CliOpts_optMaxErrors > 0) then (B_dData_dList.C_List__x58__x58_ ("--max-errors", (B_dData_dList.C_List__x58__x58_ ((string_of_int (o).f_CliOpts_optMaxErrors), B_dData_dList.C_List_Nil)))) else B_dData_dList.C_List_Nil) in ((B_dData_dList.v_append base3) ((B_dData_dList.v_append langArgs) ((B_dData_dList.v_append maxArgs) ((B_dData_dList.v_append cascadeArgs) ((B_dData_dList.v_append sourceArgs) failFastArgs)))))))))))))))

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
  | Base_dDiag.C_Check_OkC (dtb__81) -> (let files = (B_dData_dPair.v_firstOf dtb__81) in (((B_dTrait_dMonad.v__x62__x62__x61_ B_dEffect_dCore.v_Monad_ucc99eea03f4e7df1_uBase_x36_46_x36_Effect_x36_46_x36_Core_x36_46_x36_Eff_ur) (((B_dEffect_dFs.v_fsWriteFile nFs) scriptPath) ((Driver_dTargetBuild.v_nativeBuildScript name) files))) (fun _u -> (if noCompile then (((B_dTrait_dMonad.v__x62__x62__x61_ B_dEffect_dCore.v_Monad_ucc99eea03f4e7df1_uBase_x36_46_x36_Effect_x36_46_x36_Core_x36_46_x36_Eff_ur) ((B_dEffect_dConsole.v_consolePrint nConsole) (String.concat "" ["wrote "; scriptPath; "\n"]))) (fun _u -> ((B_dTrait_dApplicative.v_pure B_dEffect_dCore.v_Applicative_u19070277251d295b_uBase_x36_46_x36_Effect_x36_46_x36_Core_x36_46_x36_Eff_ur) { B_dData_dPair.f_Pair_first = 0; B_dData_dPair.f_Pair_second = o }))) else (((B_dTrait_dMonad.v__x62__x62__x61_ B_dEffect_dCore.v_Monad_ucc99eea03f4e7df1_uBase_x36_46_x36_Effect_x36_46_x36_Core_x36_46_x36_Eff_ur) (((Driver_dCompile.v_ensureDirPath nFs) nProcess) binDir)) (fun _u -> (((B_dTrait_dMonad.v__x62__x62__x61_ B_dEffect_dCore.v_Monad_ucc99eea03f4e7df1_uBase_x36_46_x36_Effect_x36_46_x36_Core_x36_46_x36_Eff_ur) (((B_dEffect_dProcess.v_processRunIn nProcess) outDir) (B_dData_dList.C_List__x58__x58_ ("sh", (B_dData_dList.C_List__x58__x58_ ("build.sh", B_dData_dList.C_List_Nil)))))) (fun code -> (if (code = 0) then (((B_dTrait_dMonad.v__x62__x62__x61_ B_dEffect_dCore.v_Monad_ucc99eea03f4e7df1_uBase_x36_46_x36_Effect_x36_46_x36_Core_x36_46_x36_Eff_ur) ((B_dEffect_dConsole.v_consolePrint nConsole) (String.concat "" ["wrote "; binPath; "\n"]))) (fun _u -> ((B_dTrait_dApplicative.v_pure B_dEffect_dCore.v_Applicative_u19070277251d295b_uBase_x36_46_x36_Effect_x36_46_x36_Core_x36_46_x36_Eff_ur) { B_dData_dPair.f_Pair_first = 0; B_dData_dPair.f_Pair_second = o }))) else (((B_dTrait_dMonad.v__x62__x62__x61_ B_dEffect_dCore.v_Monad_ucc99eea03f4e7df1_uBase_x36_46_x36_Effect_x36_46_x36_Core_x36_46_x36_Eff_ur) ((B_dEffect_dConsole.v_consolePrint nConsole) (String.concat "" ["native link failed: cc exited "; (string_of_int code); "\n"]))) (fun _u -> ((B_dTrait_dApplicative.v_pure B_dEffect_dCore.v_Applicative_u19070277251d295b_uBase_x36_46_x36_Effect_x36_46_x36_Core_x36_46_x36_Eff_ur) { B_dData_dPair.f_Pair_first = 1; B_dData_dPair.f_Pair_second = o }))))))))))))
  | _ -> failwith "DT: impossible branch"
)))))))))

# 1360 "Vuna/Compiler/Driver/CompilerCli.vuna"
let v_wasmBuildScript = (fun (optLevel : int) -> (let assemble = "wasm-tools parse main.wat -o main.wasm\n" in (if (optLevel <= 0) then ("#!/bin/sh\nset -eu\ncd \"$(dirname \"$0\")\"\n" ^ assemble) else (let features = "--enable-gc --enable-bulk-memory --enable-tail-call --enable-reference-types" in (let level = (string_of_int optLevel) in (let optimize = (String.concat "" ["if ! wasm-opt "; features; " -g -O"; level; " main.wasm -o main.wasm.tmp 2>opt.log; then\n  cat opt.log >&2\n  rm -f opt.log main.wasm.tmp\n  exit 1\nfi\nrm -f opt.log\nmv main.wasm.tmp main.wasm\n"]) in (String.concat "" ["#!/bin/sh\nset -eu\ncd \"$(dirname \"$0\")\"\n"; assemble; optimize])))))))

# 1447 "Vuna/Compiler/Driver/CompilerCli.vuna"
let v_compileCodegen = (fun (nFs : string) (nConsole : string) (nClock : string) (nEnv : string) (nProcess : string) (ctx : Frontend_dPackages_dPkg.t_PackageContext) (entry : string) (outDir : string) (o : t_CliOpts) -> (((B_dTrait_dMonad.v__x62__x62__x61_ B_dEffect_dCore.v_Monad_ucc99eea03f4e7df1_uBase_x36_46_x36_Effect_x36_46_x36_Core_x36_46_x36_Eff_ur) (((((((((Driver_dCompile.v_compileToDir nFs) nConsole) nClock) nEnv) nProcess) ctx) entry) true) outDir)) (fun r -> (match r with
  | Base_dDiag.C_Check_ErrC (dtb__83) -> ((((v_printDiag nFs) nConsole) o) dtb__83)
  | Base_dDiag.C_Check_OkC (dtb__84) -> ((B_dTrait_dApplicative.v_pure B_dEffect_dCore.v_Applicative_u19070277251d295b_uBase_x36_46_x36_Effect_x36_46_x36_Core_x36_46_x36_Eff_ur) { B_dData_dPair.f_Pair_first = 0; B_dData_dPair.f_Pair_second = o })
  | _ -> failwith "DT: impossible branch"
))))

# 1457 "Vuna/Compiler/Driver/CompilerCli.vuna"
let v_buildLinked = (fun (nFs : string) (nConsole : string) (nEnv : string) (nProcess : string) (ctx : Frontend_dPackages_dPkg.t_PackageContext) (entry : string) (outDir : string) (name : string) (o : t_CliOpts) -> (((B_dTrait_dMonad.v__x62__x62__x61_ B_dEffect_dCore.v_Monad_ucc99eea03f4e7df1_uBase_x36_46_x36_Effect_x36_46_x36_Core_x36_46_x36_Eff_ur) (((Driver_dCompile.v_ensureDirPath nFs) nProcess) (outDir ^ "/bin"))) (fun _u -> (((B_dTrait_dMonad.v__x62__x62__x61_ B_dEffect_dCore.v_Monad_ucc99eea03f4e7df1_uBase_x36_46_x36_Effect_x36_46_x36_Core_x36_46_x36_Eff_ur) ((((Driver_dCompile.v_runBuildScript nProcess) outDir) ("bin/" ^ name)) name)) (fun r -> (match r with
  | Base_dDiag.C_Check_ErrC (dtb__85) -> ((((v_printDiag nFs) nConsole) o) dtb__85)
  | Base_dDiag.C_Check_OkC (dtb__86) -> (((B_dTrait_dMonad.v__x62__x62__x61_ B_dEffect_dCore.v_Monad_ucc99eea03f4e7df1_uBase_x36_46_x36_Effect_x36_46_x36_Core_x36_46_x36_Eff_ur) ((((((Driver_dCompile.v_writeBuildMeta nFs) nEnv) outDir) ctx) entry) true)) (fun _u -> (((B_dTrait_dMonad.v__x62__x62__x61_ B_dEffect_dCore.v_Monad_ucc99eea03f4e7df1_uBase_x36_46_x36_Effect_x36_46_x36_Core_x36_46_x36_Eff_ur) ((B_dEffect_dConsole.v_consolePrint nConsole) (String.concat "" ["built "; outDir; "/bin/"; name; "\n"]))) (fun _u -> ((B_dTrait_dApplicative.v_pure B_dEffect_dCore.v_Applicative_u19070277251d295b_uBase_x36_46_x36_Effect_x36_46_x36_Core_x36_46_x36_Eff_ur) { B_dData_dPair.f_Pair_first = 0; B_dData_dPair.f_Pair_second = o })))))
  | _ -> failwith "DT: impossible branch"
))))))

# 1408 "Vuna/Compiler/Driver/CompilerCli.vuna"
let v_buildDefault = (fun (nFs : string) (nConsole : string) (nClock : string) (nEnv : string) (nProcess : string) (pkg : Frontend_dPackages_dPkg.t_Package) (ctx : Frontend_dPackages_dPkg.t_PackageContext) (entry : string) (name : string) (o : t_CliOpts) -> (let outDir = ((Frontend_dPackages_dPkg.v_packageDir pkg) ^ "/.output") in (let binPath = (String.concat "" [outDir; "/bin/"; name]) in (((B_dTrait_dMonad.v__x62__x62__x61_ B_dEffect_dCore.v_Monad_ucc99eea03f4e7df1_uBase_x36_46_x36_Effect_x36_46_x36_Core_x36_46_x36_Eff_ur) ((((((Driver_dCompile.v_metaUpToDate nFs) nEnv) outDir) ctx) entry) binPath)) (fun fresh -> (if fresh then (((B_dTrait_dMonad.v__x62__x62__x61_ B_dEffect_dCore.v_Monad_ucc99eea03f4e7df1_uBase_x36_46_x36_Effect_x36_46_x36_Core_x36_46_x36_Eff_ur) ((B_dEffect_dConsole.v_consolePrint nConsole) (String.concat "" ["up to date: "; binPath; "\n"]))) (fun _u -> ((B_dTrait_dApplicative.v_pure B_dEffect_dCore.v_Applicative_u19070277251d295b_uBase_x36_46_x36_Effect_x36_46_x36_Core_x36_46_x36_Eff_ur) { B_dData_dPair.f_Pair_first = 0; B_dData_dPair.f_Pair_second = o }))) else (((B_dTrait_dMonad.v__x62__x62__x61_ B_dEffect_dCore.v_Monad_ucc99eea03f4e7df1_uBase_x36_46_x36_Effect_x36_46_x36_Core_x36_46_x36_Eff_ur) ((B_dEffect_dFs.v_fsRemoveTree nFs) outDir)) (fun _u -> (((B_dTrait_dMonad.v__x62__x62__x61_ B_dEffect_dCore.v_Monad_ucc99eea03f4e7df1_uBase_x36_46_x36_Effect_x36_46_x36_Core_x36_46_x36_Eff_ur) (((((((((Driver_dCompile.v_compileToDir nFs) nConsole) nClock) nEnv) nProcess) ctx) entry) true) outDir)) (fun r -> (match r with
  | Base_dDiag.C_Check_ErrC (dtb__87) -> ((((v_printDiag nFs) nConsole) o) dtb__87)
  | Base_dDiag.C_Check_OkC (dtb__88) -> (((((((((v_buildLinked nFs) nConsole) nEnv) nProcess) ctx) entry) outDir) name) o)
  | _ -> failwith "DT: impossible branch"
)))))))))))

# 1428 "Vuna/Compiler/Driver/CompilerCli.vuna"
let v_buildExplicit = (fun (nFs : string) (nConsole : string) (nClock : string) (nEnv : string) (nProcess : string) (out : string) (multiOut : bool) (pkg : Frontend_dPackages_dPkg.t_Package) (ctx : Frontend_dPackages_dPkg.t_PackageContext) (entry : string) (o : t_CliOpts) -> (let name = (Frontend_dPackages_dPkg.v_packageName pkg) in (let outDir = (if multiOut then (String.concat "" [out; "/"; name]) else out) in (let binPath = (String.concat "" [outDir; "/bin/"; name]) in (((B_dTrait_dMonad.v__x62__x62__x61_ B_dEffect_dCore.v_Monad_ucc99eea03f4e7df1_uBase_x36_46_x36_Effect_x36_46_x36_Core_x36_46_x36_Eff_ur) ((((((Driver_dCompile.v_metaUpToDate nFs) nEnv) outDir) ctx) entry) binPath)) (fun fresh -> (if fresh then (((B_dTrait_dMonad.v__x62__x62__x61_ B_dEffect_dCore.v_Monad_ucc99eea03f4e7df1_uBase_x36_46_x36_Effect_x36_46_x36_Core_x36_46_x36_Eff_ur) ((B_dEffect_dConsole.v_consolePrint nConsole) (String.concat "" ["up to date: "; binPath; "\n"]))) (fun _u -> ((B_dTrait_dApplicative.v_pure B_dEffect_dCore.v_Applicative_u19070277251d295b_uBase_x36_46_x36_Effect_x36_46_x36_Core_x36_46_x36_Eff_ur) { B_dData_dPair.f_Pair_first = 0; B_dData_dPair.f_Pair_second = o }))) else (((B_dTrait_dMonad.v__x62__x62__x61_ B_dEffect_dCore.v_Monad_ucc99eea03f4e7df1_uBase_x36_46_x36_Effect_x36_46_x36_Core_x36_46_x36_Eff_ur) (((((((((Driver_dCompile.v_compileToDir nFs) nConsole) nClock) nEnv) nProcess) ctx) entry) true) outDir)) (fun r -> (match r with
  | Base_dDiag.C_Check_ErrC (dtb__89) -> ((((v_printDiag nFs) nConsole) o) dtb__89)
  | Base_dDiag.C_Check_OkC (dtb__90) -> (((((((((v_buildLinked nFs) nConsole) nEnv) nProcess) ctx) entry) outDir) name) o)
  | _ -> failwith "DT: impossible branch"
))))))))))

# 1474 "Vuna/Compiler/Driver/CompilerCli.vuna"
let v_stripDotSlash = (fun (s : string) -> (if ((B_dData_dString.v_startsWith "./") s) then (((B_dData_dString.v_substring (bi_natFromInt 2)) (bi_natFromInt ((String.length s) - 2))) s) else s))

# 1094 "Vuna/Compiler/Driver/CompilerCli.vuna"
let v_isPackageEntryPath = (fun (nEnv : string) (ctx : Frontend_dPackages_dPkg.t_PackageContext) (path : string) -> (match (Frontend_dPackages_dPkg.v_contextPackageOf ctx) with
  | B_dData_dMaybe.C_Maybe_Nothing -> ((B_dTrait_dApplicative.v_pure B_dEffect_dCore.v_Applicative_u19070277251d295b_uBase_x36_46_x36_Effect_x36_46_x36_Core_x36_46_x36_Eff_ur) false)
  | B_dData_dMaybe.C_Maybe_Just (dtb__91) -> (((B_dTrait_dMonad.v__x62__x62__x61_ B_dEffect_dCore.v_Monad_ucc99eea03f4e7df1_uBase_x36_46_x36_Effect_x36_46_x36_Core_x36_46_x36_Eff_ur) ((Frontend_dPackages_dPkg.v_absolutePath nEnv) path)) (fun abs -> ((B_dTrait_dApplicative.v_pure B_dEffect_dCore.v_Applicative_u19070277251d295b_uBase_x36_46_x36_Effect_x36_46_x36_Core_x36_46_x36_Eff_ur) ((v_stripDotSlash abs) = (v_stripDotSlash (Frontend_dPackages_dPkg.v_packageEntry dtb__91))))))
  | _ -> failwith "DT: impossible branch"
))

# 1088 "Vuna/Compiler/Driver/CompilerCli.vuna"
let v_isModuleFileEntry = (fun (nFs : string) (nEnv : string) (nProcess : string) (ctx : Frontend_dPackages_dPkg.t_PackageContext) (path : string) -> (((B_dTrait_dMonad.v__x62__x62__x61_ B_dEffect_dCore.v_Monad_ucc99eea03f4e7df1_uBase_x36_46_x36_Effect_x36_46_x36_Core_x36_46_x36_Eff_ur) (((v_isPackageEntryPath nEnv) ctx) path)) (fun pkgEntry -> (if pkgEntry then ((B_dTrait_dApplicative.v_pure B_dEffect_dCore.v_Applicative_u19070277251d295b_uBase_x36_46_x36_Effect_x36_46_x36_Core_x36_46_x36_Eff_ur) false) else ((((Driver_dDt.v_dtFileHasModuleHeader nFs) nEnv) nProcess) path)))))

# 1479 "Vuna/Compiler/Driver/CompilerCli.vuna"
let v_ownedByFile = (fun (path : string) (d : Base_dDiag.t_Diagnostic) -> ((v_stripDotSlash (Base_dDiag.v_diagFileOf d)) = (v_stripDotSlash path)))

# 1105 "Vuna/Compiler/Driver/CompilerCli.vuna"
let v_checkModuleFileEntry = (fun (nFs : string) (nConsole : string) (nEnv : string) (nProcess : string) (ctx : Frontend_dPackages_dPkg.t_PackageContext) (path : string) (o : t_CliOpts) -> (((B_dTrait_dMonad.v__x62__x62__x61_ B_dEffect_dCore.v_Monad_ucc99eea03f4e7df1_uBase_x36_46_x36_Effect_x36_46_x36_Core_x36_46_x36_Eff_ur) (((((Driver_dDt.v_dtCheckModuleFile nFs) nEnv) nProcess) ctx) path)) (fun checked -> (match checked with
  | Base_dDiag.C_Check_ErrC (dtb__92) -> ((((v_printDiag nFs) nConsole) o) dtb__92)
  | Base_dDiag.C_Check_OkC (dtb__93) -> (let ws = ((B_dData_dList.v_filter (v_ownedByFile path)) (Base_dDiagnostics_dSink.v_dedupeWarnings dtb__93)) in (let shown = (if (if (o).f_CliOpts_optShowWarnings then true else (o).f_CliOpts_optDenyWarnings) then ws else B_dData_dList.C_List_Nil) in (((B_dTrait_dMonad.v__x62__x62__x61_ B_dEffect_dCore.v_Monad_ucc99eea03f4e7df1_uBase_x36_46_x36_Effect_x36_46_x36_Core_x36_46_x36_Eff_ur) (((((v_printDiagList nFs) nConsole) o) "") shown)) (fun r -> ((B_dTrait_dApplicative.v_pure B_dEffect_dCore.v_Applicative_u19070277251d295b_uBase_x36_46_x36_Effect_x36_46_x36_Core_x36_46_x36_Eff_ur) { B_dData_dPair.f_Pair_first = (if (if (o).f_CliOpts_optDenyWarnings then ((B_dData_dList.v_length ws) > 0) else false) then 1 else 0); B_dData_dPair.f_Pair_second = (B_dData_dPair.v_secondOf r) })))))
  | _ -> failwith "DT: impossible branch"
))))

# 1120 "Vuna/Compiler/Driver/CompilerCli.vuna"
let v_checkEntryFile = (fun (nFs : string) (nConsole : string) (nEnv : string) (nProcess : string) (ctx : Frontend_dPackages_dPkg.t_PackageContext) (path : string) (o : t_CliOpts) -> (((B_dTrait_dMonad.v__x62__x62__x61_ B_dEffect_dCore.v_Monad_ucc99eea03f4e7df1_uBase_x36_46_x36_Effect_x36_46_x36_Core_x36_46_x36_Eff_ur) (((((Driver_dDt.v_dtCheck nFs) nEnv) nProcess) ctx) path)) (fun checked -> (match checked with
  | Base_dDiag.C_Check_ErrC (dtb__94) -> (if (o).f_CliOpts_optContinueOnError then (((B_dTrait_dMonad.v__x62__x62__x61_ B_dEffect_dCore.v_Monad_ucc99eea03f4e7df1_uBase_x36_46_x36_Effect_x36_46_x36_Core_x36_46_x36_Eff_ur) (((((Driver_dDt.v_dtCheckRecovering nFs) nEnv) nProcess) ctx) path)) (fun recovered -> (match recovered with
  | Base_dDiag.C_Check_OkC (dtb__95) -> (let shown = ((v_takeDiags (o).f_CliOpts_optMaxErrors) dtb__95) in (((B_dTrait_dMonad.v__x62__x62__x61_ B_dEffect_dCore.v_Monad_ucc99eea03f4e7df1_uBase_x36_46_x36_Effect_x36_46_x36_Core_x36_46_x36_Eff_ur) (((((v_printDiagList nFs) nConsole) o) "") shown)) (fun r -> (if ((B_dData_dList.v_length shown) = 0) then ((((v_printDiag nFs) nConsole) (B_dData_dPair.v_secondOf r)) dtb__94) else ((B_dTrait_dApplicative.v_pure B_dEffect_dCore.v_Applicative_u19070277251d295b_uBase_x36_46_x36_Effect_x36_46_x36_Core_x36_46_x36_Eff_ur) { B_dData_dPair.f_Pair_first = 1; B_dData_dPair.f_Pair_second = (B_dData_dPair.v_secondOf r) })))))
  | Base_dDiag.C_Check_ErrC (dtb__96) -> ((((v_printDiag nFs) nConsole) o) dtb__94)
  | _ -> failwith "DT: impossible branch"
))) else ((((v_printDiag nFs) nConsole) o) dtb__94))
  | Base_dDiag.C_Check_OkC (dtb__97) -> (let ws = ((B_dData_dList.v_filter (v_ownedByFile path)) (Base_dDiagnostics_dSink.v_dedupeWarnings dtb__97)) in (let shown = (if (if (o).f_CliOpts_optShowWarnings then true else (o).f_CliOpts_optDenyWarnings) then ws else B_dData_dList.C_List_Nil) in (((B_dTrait_dMonad.v__x62__x62__x61_ B_dEffect_dCore.v_Monad_ucc99eea03f4e7df1_uBase_x36_46_x36_Effect_x36_46_x36_Core_x36_46_x36_Eff_ur) (((((v_printDiagList nFs) nConsole) o) "") shown)) (fun r -> ((B_dTrait_dApplicative.v_pure B_dEffect_dCore.v_Applicative_u19070277251d295b_uBase_x36_46_x36_Effect_x36_46_x36_Core_x36_46_x36_Eff_ur) { B_dData_dPair.f_Pair_first = (if (if (o).f_CliOpts_optDenyWarnings then ((B_dData_dList.v_length ws) > 0) else false) then 1 else 0); B_dData_dPair.f_Pair_second = (B_dData_dPair.v_secondOf r) })))))
  | _ -> failwith "DT: impossible branch"
))))

# 1072 "Vuna/Compiler/Driver/CompilerCli.vuna"
let v_checkFileEntry = (fun (nFs : string) (nConsole : string) (nEnv : string) (nProcess : string) (path : string) (o : t_CliOpts) -> (((B_dTrait_dMonad.v__x62__x62__x61_ B_dEffect_dCore.v_Monad_ucc99eea03f4e7df1_uBase_x36_46_x36_Effect_x36_46_x36_Core_x36_46_x36_Eff_ur) (((Frontend_dPackages_dPkg.v_contextForFile nFs) nEnv) path)) (fun ctxR -> (match ctxR with
  | Base_dDiag.C_Check_ErrC (dtb__98) -> ((((v_printDiag nFs) nConsole) o) dtb__98)
  | Base_dDiag.C_Check_OkC (dtb__99) -> (let ctx = ((Frontend_dPackages_dPkg.v_contextWithRelease (o).f_CliOpts_optRelease) dtb__99) in (let o1 = ((v_applyDiagConfig (Frontend_dPackages_dPkg.v_contextPackageOf ctx)) o) in (((B_dTrait_dMonad.v__x62__x62__x61_ B_dEffect_dCore.v_Monad_ucc99eea03f4e7df1_uBase_x36_46_x36_Effect_x36_46_x36_Core_x36_46_x36_Eff_ur) (((((v_isModuleFileEntry nFs) nEnv) nProcess) ctx) path)) (fun moduleEntry -> (if moduleEntry then (((((((v_checkModuleFileEntry nFs) nConsole) nEnv) nProcess) ctx) path) o1) else (((((((v_checkEntryFile nFs) nConsole) nEnv) nProcess) ctx) path) o1))))))
  | _ -> failwith "DT: impossible branch"
))))

# 1483 "Vuna/Compiler/Driver/CompilerCli.vuna"
let v_ownedByPackage = (fun (pkg : Frontend_dPackages_dPkg.t_Package) (d : Base_dDiag.t_Diagnostic) -> (let dir = (v_stripDotSlash (Frontend_dPackages_dPkg.v_packageDir pkg)) in (let file = (v_stripDotSlash (Base_dDiag.v_diagFileOf d)) in (let prefix = (if (if (dir = ".") then true else (dir = "")) then "" else (dir ^ "/")) in (if (if ((B_dData_dString.v_startsWith (prefix ^ "lib/")) file) then true else ((B_dData_dString.v_startsWith (prefix ^ "app/")) file)) then true else ((B_dData_dString.v_startsWith (prefix ^ "test/")) file))))))

# 1494 "Vuna/Compiler/Driver/CompilerCli.vuna"
let v_finishWarnings = (fun (nFs : string) (nConsole : string) (warns : Base_dDiag.t_Diagnostic B_dData_dList.t_List) (code : int) (o : t_CliOpts) -> (let ws = (Base_dDiagnostics_dSink.v_dedupeWarnings warns) in (let shown = (if (if (o).f_CliOpts_optShowWarnings then true else (o).f_CliOpts_optDenyWarnings) then ws else B_dData_dList.C_List_Nil) in (((B_dTrait_dMonad.v__x62__x62__x61_ B_dEffect_dCore.v_Monad_ucc99eea03f4e7df1_uBase_x36_46_x36_Effect_x36_46_x36_Core_x36_46_x36_Eff_ur) (((((v_printDiagList nFs) nConsole) o) "") shown)) (fun r -> ((B_dTrait_dApplicative.v_pure B_dEffect_dCore.v_Applicative_u19070277251d295b_uBase_x36_46_x36_Effect_x36_46_x36_Core_x36_46_x36_Eff_ur) { B_dData_dPair.f_Pair_first = (if (if (o).f_CliOpts_optDenyWarnings then ((B_dData_dList.v_length ws) > 0) else false) then 1 else code); B_dData_dPair.f_Pair_second = (B_dData_dPair.v_secondOf r) }))))))

# 1505 "Vuna/Compiler/Driver/CompilerCli.vuna"
let v_finishWarningsDir = (fun (nFs : string) (nConsole : string) (nProcess : string) (warns : Base_dDiag.t_Diagnostic B_dData_dList.t_List) (o : t_CliOpts) (dir : string) (code : int) -> (let ws = (Base_dDiagnostics_dSink.v_dedupeWarnings warns) in (let shown = (if (if (o).f_CliOpts_optShowWarnings then true else (o).f_CliOpts_optDenyWarnings) then ws else B_dData_dList.C_List_Nil) in (((B_dTrait_dMonad.v__x62__x62__x61_ B_dEffect_dCore.v_Monad_ucc99eea03f4e7df1_uBase_x36_46_x36_Effect_x36_46_x36_Core_x36_46_x36_Eff_ur) (((((v_printDiagList nFs) nConsole) o) "") shown)) (fun r -> (if (if (o).f_CliOpts_optDenyWarnings then ((B_dData_dList.v_length ws) > 0) else false) then (((B_dTrait_dMonad.v__x62__x62__x61_ B_dEffect_dCore.v_Monad_ucc99eea03f4e7df1_uBase_x36_46_x36_Effect_x36_46_x36_Core_x36_46_x36_Eff_ur) ((B_dEffect_dFs.v_fsRemoveTree nFs) dir)) (fun _u -> ((B_dTrait_dApplicative.v_pure B_dEffect_dCore.v_Applicative_u19070277251d295b_uBase_x36_46_x36_Effect_x36_46_x36_Core_x36_46_x36_Eff_ur) { B_dData_dPair.f_Pair_first = 1; B_dData_dPair.f_Pair_second = (B_dData_dPair.v_secondOf r) }))) else ((B_dTrait_dApplicative.v_pure B_dEffect_dCore.v_Applicative_u19070277251d295b_uBase_x36_46_x36_Effect_x36_46_x36_Core_x36_46_x36_Eff_ur) { B_dData_dPair.f_Pair_first = code; B_dData_dPair.f_Pair_second = (B_dData_dPair.v_secondOf r) })))))))

# 843 "Vuna/Compiler/Driver/CompilerCli.vuna"
let v_compileFileEntry = (fun (nFs : string) (nConsole : string) (nClock : string) (nEnv : string) (nProcess : string) (printResult : bool) (entry : string) (outDir : string) (o : t_CliOpts) -> (((B_dTrait_dMonad.v__x62__x62__x61_ B_dEffect_dCore.v_Monad_ucc99eea03f4e7df1_uBase_x36_46_x36_Effect_x36_46_x36_Core_x36_46_x36_Eff_ur) (((Frontend_dPackages_dPkg.v_contextForFile nFs) nEnv) entry)) (fun ctxR -> (match ctxR with
  | Base_dDiag.C_Check_ErrC (dtb__100) -> ((((v_printDiag nFs) nConsole) o) dtb__100)
  | Base_dDiag.C_Check_OkC (dtb__101) -> (let ctx = ((Frontend_dPackages_dPkg.v_contextWithRelease (o).f_CliOpts_optRelease) dtb__101) in (let o1 = ((v_applyDiagConfig (Frontend_dPackages_dPkg.v_contextPackageOf ctx)) o) in (((B_dTrait_dMonad.v__x62__x62__x61_ B_dEffect_dCore.v_Monad_ucc99eea03f4e7df1_uBase_x36_46_x36_Effect_x36_46_x36_Core_x36_46_x36_Eff_ur) ((((((((((v_compileToTarget nFs) nConsole) nClock) nEnv) nProcess) ctx) entry) printResult) outDir) (o).f_CliOpts_optTarget)) (fun r -> (match r with
  | Base_dDiag.C_Check_ErrC (dtb__102) -> ((((v_printDiag nFs) nConsole) o1) dtb__102)
  | Base_dDiag.C_Check_OkC (dtb__103) -> (((((((v_finishWarningsDir nFs) nConsole) nProcess) (B_dData_dPair.v_secondOf dtb__103)) o1) outDir) 0)
  | _ -> failwith "DT: impossible branch"
)))))
  | _ -> failwith "DT: impossible branch"
))))

# 859 "Vuna/Compiler/Driver/CompilerCli.vuna"
let v_compilePkgDir = (fun (nFs : string) (nConsole : string) (nClock : string) (nEnv : string) (nProcess : string) (printResult : bool) (dir : string) (outDir : string) (o : t_CliOpts) -> (((B_dTrait_dMonad.v__x62__x62__x61_ B_dEffect_dCore.v_Monad_ucc99eea03f4e7df1_uBase_x36_46_x36_Effect_x36_46_x36_Core_x36_46_x36_Eff_ur) ((((v_executablePackage nFs) nEnv) "compile") dir)) (fun pkgR -> (match pkgR with
  | Base_dDiag.C_Check_ErrC (dtb__104) -> ((((v_printDiag nFs) nConsole) o) dtb__104)
  | Base_dDiag.C_Check_OkC (dtb__105) -> (let o1 = ((v_applyDiagConfig (B_dData_dMaybe.C_Maybe_Just (dtb__105))) o) in (((B_dTrait_dMonad.v__x62__x62__x61_ B_dEffect_dCore.v_Monad_ucc99eea03f4e7df1_uBase_x36_46_x36_Effect_x36_46_x36_Core_x36_46_x36_Eff_ur) ((((((((((v_compileToTarget nFs) nConsole) nClock) nEnv) nProcess) ((Frontend_dPackages_dPkg.v_contextWithRelease (o).f_CliOpts_optRelease) (Frontend_dPackages_dPkg.v_packageContext dtb__105))) (Frontend_dPackages_dPkg.v_packageEntry dtb__105)) printResult) outDir) (o).f_CliOpts_optTarget)) (fun r -> (match r with
  | Base_dDiag.C_Check_ErrC (dtb__106) -> ((((v_printDiag nFs) nConsole) o1) dtb__106)
  | Base_dDiag.C_Check_OkC (dtb__107) -> (((((((v_finishWarningsDir nFs) nConsole) nProcess) (B_dData_dPair.v_secondOf dtb__107)) o1) outDir) 0)
  | _ -> failwith "DT: impossible branch"
))))
  | _ -> failwith "DT: impossible branch"
))))

# 818 "Vuna/Compiler/Driver/CompilerCli.vuna"
let v_compileRun = (fun (nFs : string) (nConsole : string) (nClock : string) (nEnv : string) (nProcess : string) (printResult : bool) (entry : string) (outDir : string) (o : t_CliOpts) -> (((B_dTrait_dMonad.v__x62__x62__x61_ B_dEffect_dCore.v_Monad_ucc99eea03f4e7df1_uBase_x36_46_x36_Effect_x36_46_x36_Core_x36_46_x36_Eff_ur) ((B_dEffect_dFs.v_fsFileExists nFs) entry)) (fun exists -> (if exists then (((B_dTrait_dMonad.v__x62__x62__x61_ B_dEffect_dCore.v_Monad_ucc99eea03f4e7df1_uBase_x36_46_x36_Effect_x36_46_x36_Core_x36_46_x36_Eff_ur) ((B_dEffect_dFs.v_fsIsDirectory nFs) entry)) (fun isDir -> (if isDir then (((((((((v_compilePkgDir nFs) nConsole) nClock) nEnv) nProcess) printResult) entry) outDir) o) else (((((((((v_compileFileEntry nFs) nConsole) nClock) nEnv) nProcess) printResult) entry) outDir) o)))) else ((v_withOpts o) ((v_dtPathErr nConsole) entry))))))

# 811 "Vuna/Compiler/Driver/CompilerCli.vuna"
let v_compileFinish = (fun (nFs : string) (nConsole : string) (nClock : string) (nEnv : string) (nProcess : string) (mc0 : string) (mc1 : bool) (mc2 : string B_dData_dMaybe.t_Maybe) (mc3 : string B_dData_dMaybe.t_Maybe) (mc4 : t_CliOpts) -> (match mc2 with
  | B_dData_dMaybe.C_Maybe_Just (dtb__108) -> (match mc3 with
  | B_dData_dMaybe.C_Maybe_Nothing -> ((v_withOpts mc4) ((v_usageErr nConsole) mc0))
  | B_dData_dMaybe.C_Maybe_Just (dtb__109) -> (((((((((v_compileRun nFs) nConsole) nClock) nEnv) nProcess) mc1) dtb__108) dtb__109) mc4)
  | _ -> failwith "DT: impossible branch"
)
  | B_dData_dMaybe.C_Maybe_Nothing -> ((v_withOpts mc4) ((v_usageErr nConsole) mc0))
  | _ -> failwith "DT: impossible branch"
))

# 785 "Vuna/Compiler/Driver/CompilerCli.vuna"
let rec v_compileParse = (fun (nFs : string) (nConsole : string) (nClock : string) (nEnv : string) (nProcess : string) (prog : string) (printResult : bool) (entry : string B_dData_dMaybe.t_Maybe) (outDir : string B_dData_dMaybe.t_Maybe) (args : string B_dData_dList.t_List) (o : t_CliOpts) -> (let nd_uscrut17 = args in (match nd_uscrut17 with
  | B_dData_dList.C_List__x58__x58_ (dtb__110, dtb__111) -> (if (dtb__110 = "--no-print") then (((((((((((v_compileParse nFs) nConsole) nClock) nEnv) nProcess) prog) false) entry) outDir) dtb__111) o) else (if (dtb__110 = "--release") then (((((((((((v_compileParse nFs) nConsole) nClock) nEnv) nProcess) prog) printResult) entry) outDir) dtb__111) (v_markRelease o)) else (if (dtb__110 = "--target") then (match dtb__111 with
  | B_dData_dList.C_List__x58__x58_ (dtb__112, dtb__113) -> (if (v_isKnownTarget dtb__112) then (((((((((((v_compileParse nFs) nConsole) nClock) nEnv) nProcess) prog) printResult) entry) outDir) dtb__113) ((v_markTarget dtb__112) o)) else ((v_withOpts o) ((v_usageErr nConsole) prog)))
  | _ -> (if ((B_dData_dString.v_startsWith "-") dtb__110) then ((v_withOpts o) (((v_removedFlag nConsole) prog) dtb__110)) else (match entry with
  | B_dData_dMaybe.C_Maybe_Nothing -> (((((((((((v_compileParse nFs) nConsole) nClock) nEnv) nProcess) prog) printResult) (B_dData_dMaybe.C_Maybe_Just (dtb__110))) outDir) dtb__111) o)
  | B_dData_dMaybe.C_Maybe_Just (dtb__114) -> (match outDir with
  | B_dData_dMaybe.C_Maybe_Nothing -> (((((((((((v_compileParse nFs) nConsole) nClock) nEnv) nProcess) prog) printResult) entry) (B_dData_dMaybe.C_Maybe_Just (dtb__110))) dtb__111) o)
  | B_dData_dMaybe.C_Maybe_Just (dtb__115) -> ((v_withOpts o) ((v_usageErr nConsole) prog))
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
))
) else (if ((B_dData_dString.v_startsWith "-") dtb__110) then ((v_withOpts o) (((v_removedFlag nConsole) prog) dtb__110)) else (match entry with
  | B_dData_dMaybe.C_Maybe_Nothing -> (((((((((((v_compileParse nFs) nConsole) nClock) nEnv) nProcess) prog) printResult) (B_dData_dMaybe.C_Maybe_Just (dtb__110))) outDir) dtb__111) o)
  | B_dData_dMaybe.C_Maybe_Just (dtb__116) -> (match outDir with
  | B_dData_dMaybe.C_Maybe_Nothing -> (((((((((((v_compileParse nFs) nConsole) nClock) nEnv) nProcess) prog) printResult) entry) (B_dData_dMaybe.C_Maybe_Just (dtb__110))) dtb__111) o)
  | B_dData_dMaybe.C_Maybe_Just (dtb__117) -> ((v_withOpts o) ((v_usageErr nConsole) prog))
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
  | B_dData_dMaybe.C_Maybe_Just (dtb__120) -> dtb__120
  | B_dData_dMaybe.C_Maybe_Nothing -> ((Frontend_dPackages_dPkg.v_packageDir pkg) ^ "/.output")
  | _ -> failwith "DT: impossible branch"
) in (let watPath = (outDir ^ "/main.wat") in (let wasmPath = (outDir ^ "/main.wasm") in (let script = (v_wasmBuildScript (o).f_CliOpts_optWasmOpt) in (((B_dTrait_dMonad.v__x62__x62__x61_ B_dEffect_dCore.v_Monad_ucc99eea03f4e7df1_uBase_x36_46_x36_Effect_x36_46_x36_Core_x36_46_x36_Eff_ur) ((((((((Driver_dTarget.v_compileBackend nFs) nEnv) nProcess) ((Frontend_dPackages_dPkg.v_contextWithRelease (o).f_CliOpts_optRelease) (Frontend_dPackages_dPkg.v_packageContext pkg))) "wasm") (Frontend_dPackages_dPkg.v_packageEntry pkg)) true) outDir)) (fun r -> (match r with
  | Base_dDiag.C_Check_ErrC (dtb__118) -> ((((v_printDiag nFs) nConsole) o) dtb__118)
  | Base_dDiag.C_Check_OkC (dtb__119) -> (((B_dTrait_dMonad.v__x62__x62__x61_ B_dEffect_dCore.v_Monad_ucc99eea03f4e7df1_uBase_x36_46_x36_Effect_x36_46_x36_Core_x36_46_x36_Eff_ur) (((B_dEffect_dFs.v_fsWriteFile nFs) (outDir ^ "/build.sh")) script)) (fun _u -> (((B_dTrait_dMonad.v__x62__x62__x61_ B_dEffect_dCore.v_Monad_ucc99eea03f4e7df1_uBase_x36_46_x36_Effect_x36_46_x36_Core_x36_46_x36_Eff_ur) (if noCompile then (((B_dTrait_dMonad.v__x62__x62__x61_ B_dEffect_dCore.v_Monad_ucc99eea03f4e7df1_uBase_x36_46_x36_Effect_x36_46_x36_Core_x36_46_x36_Eff_ur) ((B_dEffect_dConsole.v_consolePrint nConsole) (String.concat "" ["wrote "; watPath; "\n"]))) (fun _u -> ((B_dTrait_dApplicative.v_pure B_dEffect_dCore.v_Applicative_u19070277251d295b_uBase_x36_46_x36_Effect_x36_46_x36_Core_x36_46_x36_Eff_ur) 0))) else (((B_dTrait_dMonad.v__x62__x62__x61_ B_dEffect_dCore.v_Monad_ucc99eea03f4e7df1_uBase_x36_46_x36_Effect_x36_46_x36_Core_x36_46_x36_Eff_ur) (((B_dEffect_dProcess.v_processRunIn nProcess) outDir) (B_dData_dList.C_List__x58__x58_ ("sh", (B_dData_dList.C_List__x58__x58_ ("build.sh", B_dData_dList.C_List_Nil)))))) (fun c -> (if (c = 0) then (((B_dTrait_dMonad.v__x62__x62__x61_ B_dEffect_dCore.v_Monad_ucc99eea03f4e7df1_uBase_x36_46_x36_Effect_x36_46_x36_Core_x36_46_x36_Eff_ur) ((B_dEffect_dConsole.v_consolePrint nConsole) (String.concat "" ["wrote "; wasmPath; "\n"]))) (fun _u -> ((B_dTrait_dApplicative.v_pure B_dEffect_dCore.v_Applicative_u19070277251d295b_uBase_x36_46_x36_Effect_x36_46_x36_Core_x36_46_x36_Eff_ur) 0))) else (((B_dTrait_dMonad.v__x62__x62__x61_ B_dEffect_dCore.v_Monad_ucc99eea03f4e7df1_uBase_x36_46_x36_Effect_x36_46_x36_Core_x36_46_x36_Eff_ur) ((B_dEffect_dConsole.v_consolePrint nConsole) (String.concat "" ["wasm assembly failed: build.sh exited "; (string_of_int c); "\n"]))) (fun _u -> ((B_dTrait_dApplicative.v_pure B_dEffect_dCore.v_Applicative_u19070277251d295b_uBase_x36_46_x36_Effect_x36_46_x36_Core_x36_46_x36_Eff_ur) 1)))))))) (fun code -> (if (code = 0) then (((((((v_finishWarningsDir nFs) nConsole) nProcess) (B_dData_dPair.v_secondOf dtb__119)) o) outDir) 0) else ((B_dTrait_dApplicative.v_pure B_dEffect_dCore.v_Applicative_u19070277251d295b_uBase_x36_46_x36_Effect_x36_46_x36_Core_x36_46_x36_Eff_ur) { B_dData_dPair.f_Pair_first = 1; B_dData_dPair.f_Pair_second = o }))))))
  | _ -> failwith "DT: impossible branch"
))))))))

# 1373 "Vuna/Compiler/Driver/CompilerCli.vuna"
let v_buildOne = (fun (nFs : string) (nConsole : string) (nClock : string) (nEnv : string) (nProcess : string) (nExit : string) (nArgs : string) (noCompile : bool) (multiOut : bool) (outM : string B_dData_dMaybe.t_Maybe) (pkg : Frontend_dPackages_dPkg.t_Package) (o : t_CliOpts) -> (if ((o).f_CliOpts_optTarget = "wasm") then ((((((((v_buildWasmOne nFs) nConsole) nEnv) nProcess) noCompile) outM) pkg) o) else (if ((o).f_CliOpts_optTarget = "native") then (((((((((v_buildNativeOne nFs) nConsole) nEnv) nProcess) noCompile) multiOut) outM) pkg) o) else (let name = (Frontend_dPackages_dPkg.v_packageName pkg) in (let entry = (Frontend_dPackages_dPkg.v_packageEntry pkg) in (((B_dTrait_dMonad.v__x62__x62__x61_ B_dEffect_dCore.v_Monad_ucc99eea03f4e7df1_uBase_x36_46_x36_Effect_x36_46_x36_Core_x36_46_x36_Eff_ur) ((B_dEffect_dFs.v_fsFileExists nFs) entry)) (fun exists -> (if exists then (let ctx = ((Frontend_dPackages_dPkg.v_contextWithRelease (o).f_CliOpts_optRelease) (Frontend_dPackages_dPkg.v_packageContext pkg)) in (if noCompile then (match outM with
  | B_dData_dMaybe.C_Maybe_Just (dtb__121) -> (((((((((v_compileCodegen nFs) nConsole) nClock) nEnv) nProcess) ctx) entry) (if multiOut then (String.concat "" [dtb__121; "/"; name]) else dtb__121)) o)
  | B_dData_dMaybe.C_Maybe_Nothing -> (((((((((v_compileCodegen nFs) nConsole) nClock) nEnv) nProcess) ctx) entry) ((Frontend_dPackages_dPkg.v_packageDir pkg) ^ "/.output")) o)
  | _ -> failwith "DT: impossible branch"
) else (match outM with
  | B_dData_dMaybe.C_Maybe_Just (dtb__122) -> (((((((((((v_buildExplicit nFs) nConsole) nClock) nEnv) nProcess) dtb__122) multiOut) pkg) ctx) entry) o)
  | B_dData_dMaybe.C_Maybe_Nothing -> ((((((((((v_buildDefault nFs) nConsole) nClock) nEnv) nProcess) pkg) ctx) entry) name) o)
  | _ -> failwith "DT: impossible branch"
))) else (((B_dTrait_dMonad.v__x62__x62__x61_ B_dEffect_dCore.v_Monad_ucc99eea03f4e7df1_uBase_x36_46_x36_Effect_x36_46_x36_Core_x36_46_x36_Eff_ur) (((((((((Driver_dCompile.v_checkPackage nFs) nClock) nEnv) nProcess) nExit) nArgs) (o).f_CliOpts_optRelease) false) pkg)) (fun r -> (match r with
  | Base_dDiag.C_Check_ErrC (dtb__123) -> ((((v_printDiag nFs) nConsole) o) dtb__123)
  | Base_dDiag.C_Check_OkC (dtb__124) -> (((B_dTrait_dMonad.v__x62__x62__x61_ B_dEffect_dCore.v_Monad_ucc99eea03f4e7df1_uBase_x36_46_x36_Effect_x36_46_x36_Core_x36_46_x36_Eff_ur) ((B_dEffect_dConsole.v_consolePrint nConsole) (String.concat "" ["skipped (library): "; name; "\n"]))) (fun _u -> ((B_dTrait_dApplicative.v_pure B_dEffect_dCore.v_Applicative_u19070277251d295b_uBase_x36_46_x36_Effect_x36_46_x36_Core_x36_46_x36_Eff_ur) { B_dData_dPair.f_Pair_first = 0; B_dData_dPair.f_Pair_second = o })))
  | _ -> failwith "DT: impossible branch"
)))))))))))

# 1257 "Vuna/Compiler/Driver/CompilerCli.vuna"
let rec v_buildTargets = (fun (nFs : string) (nConsole : string) (nClock : string) (nEnv : string) (nProcess : string) (nExit : string) (nArgs : string) (mc0 : bool) (mc1 : bool) (mc2 : string B_dData_dMaybe.t_Maybe) (mc3 : Frontend_dPackages_dPkg.t_Package B_dData_dList.t_List) (mc4 : int) (mc5 : t_CliOpts) -> (match mc3 with
  | B_dData_dList.C_List__x58__x58_ (dtb__125, dtb__126) -> (((B_dTrait_dMonad.v__x62__x62__x61_ B_dEffect_dCore.v_Monad_ucc99eea03f4e7df1_uBase_x36_46_x36_Effect_x36_46_x36_Core_x36_46_x36_Eff_ur) ((((((((((((v_buildOne nFs) nConsole) nClock) nEnv) nProcess) nExit) nArgs) mc0) mc1) mc2) dtb__125) mc5)) (fun r -> (let next = (if ((B_dData_dPair.v_firstOf r) > mc4) then (B_dData_dPair.v_firstOf r) else mc4) in (((((((((((((v_buildTargets nFs) nConsole) nClock) nEnv) nProcess) nExit) nArgs) mc0) mc1) mc2) dtb__126) next) (B_dData_dPair.v_secondOf r)))))
  | B_dData_dList.C_List_Nil -> ((B_dTrait_dApplicative.v_pure B_dEffect_dCore.v_Applicative_u19070277251d295b_uBase_x36_46_x36_Effect_x36_46_x36_Core_x36_46_x36_Eff_ur) { B_dData_dPair.f_Pair_first = mc4; B_dData_dPair.f_Pair_second = mc5 })
  | _ -> failwith "DT: impossible branch"
))

# 1207 "Vuna/Compiler/Driver/CompilerCli.vuna"
let v_buildRun = (fun (nFs : string) (nConsole : string) (nClock : string) (nEnv : string) (nProcess : string) (nExit : string) (nArgs : string) (noCompile : bool) (dir : string) (outM : string B_dData_dMaybe.t_Maybe) (pkgM : string B_dData_dMaybe.t_Maybe) (o : t_CliOpts) -> (((B_dTrait_dMonad.v__x62__x62__x61_ B_dEffect_dCore.v_Monad_ucc99eea03f4e7df1_uBase_x36_46_x36_Effect_x36_46_x36_Core_x36_46_x36_Eff_ur) (((Frontend_dPackages_dPkg.v_loadWorkspace nFs) nEnv) dir)) (fun workspaceR -> (match workspaceR with
  | Base_dDiag.C_Check_ErrC (dtb__127) -> ((((v_printDiag nFs) nConsole) o) dtb__127)
  | Base_dDiag.C_Check_OkC (dtb__128) -> (((B_dTrait_dMonad.v__x62__x62__x61_ B_dEffect_dCore.v_Monad_ucc99eea03f4e7df1_uBase_x36_46_x36_Effect_x36_46_x36_Core_x36_46_x36_Eff_ur) ((v_isSingleLibraryPackage nFs) (Frontend_dPackages_dPkg.v_workspaceAllPackages dtb__128))) (fun libOnly -> (if libOnly then ((v_withOpts o) ((v_printErr nConsole) (v_libraryOnlyMessage (Frontend_dPackages_dPkg.v_workspaceAllPackages dtb__128)))) else (match ((v_selectBuildTargets pkgM) (Frontend_dPackages_dPkg.v_workspaceAllPackages dtb__128)) with
  | Base_dDiag.C_Check_ErrC (dtb__129) -> ((((v_printDiag nFs) nConsole) o) dtb__129)
  | Base_dDiag.C_Check_OkC (dtb__130) -> (((((((((((((v_buildTargets nFs) nConsole) nClock) nEnv) nProcess) nExit) nArgs) noCompile) (v_workspaceMultiOut dtb__128)) outM) dtb__130) 0) o)
  | _ -> failwith "DT: impossible branch"
))))
  | _ -> failwith "DT: impossible branch"
))))

# 1158 "Vuna/Compiler/Driver/CompilerCli.vuna"
let rec v_buildParse = (fun (nFs : string) (nConsole : string) (nClock : string) (nEnv : string) (nProcess : string) (nExit : string) (nArgs : string) (prog : string) (noCompile : bool) (out : string B_dData_dMaybe.t_Maybe) (dir : string B_dData_dMaybe.t_Maybe) (pkg : string B_dData_dMaybe.t_Maybe) (args : string B_dData_dList.t_List) (o : t_CliOpts) -> (let nd_uscrut22 = args in (match nd_uscrut22 with
  | B_dData_dList.C_List__x58__x58_ (dtb__131, dtb__132) -> (if (dtb__131 = "--no-compile") then ((((((((((((((v_buildParse nFs) nConsole) nClock) nEnv) nProcess) nExit) nArgs) prog) true) out) dir) pkg) dtb__132) o) else (if (dtb__131 = "--release") then ((((((((((((((v_buildParse nFs) nConsole) nClock) nEnv) nProcess) nExit) nArgs) prog) noCompile) out) dir) pkg) dtb__132) (v_markRelease o)) else (if (dtb__131 = "--wasm-opt") then (match dtb__132 with
  | B_dData_dList.C_List__x58__x58_ (dtb__133, dtb__134) -> (if ((B_dData_dString.v_startsWith "-") dtb__133) then ((v_withOpts o) (((v_removedFlag nConsole) prog) dtb__133)) else (match (v_parseWasmOptLevel dtb__133) with
  | B_dData_dMaybe.C_Maybe_Just (dtb__135) -> ((((((((((((((v_buildParse nFs) nConsole) nClock) nEnv) nProcess) nExit) nArgs) prog) noCompile) out) dir) pkg) dtb__134) ((v_markWasmOpt dtb__135) o))
  | B_dData_dMaybe.C_Maybe_Nothing -> ((v_withOpts o) ((v_usageErr nConsole) prog))
  | _ -> failwith "DT: impossible branch"
))
  | B_dData_dList.C_List_Nil -> ((v_withOpts o) ((v_usageErr nConsole) prog))
  | _ -> failwith "DT: impossible branch"
) else (if (dtb__131 = "--target") then (match dtb__132 with
  | B_dData_dList.C_List__x58__x58_ (dtb__136, dtb__137) -> (if (v_isKnownTarget dtb__136) then ((((((((((((((v_buildParse nFs) nConsole) nClock) nEnv) nProcess) nExit) nArgs) prog) noCompile) out) dir) pkg) dtb__137) ((v_markTarget dtb__136) o)) else ((v_withOpts o) ((v_usageErr nConsole) prog)))
  | _ -> (if ((B_dData_dString.v_startsWith "-") dtb__131) then ((v_withOpts o) (((v_removedFlag nConsole) prog) dtb__131)) else (match dir with
  | B_dData_dMaybe.C_Maybe_Nothing -> ((((((((((((((v_buildParse nFs) nConsole) nClock) nEnv) nProcess) nExit) nArgs) prog) noCompile) out) (B_dData_dMaybe.C_Maybe_Just (dtb__131))) pkg) dtb__132) o)
  | B_dData_dMaybe.C_Maybe_Just (dtb__138) -> ((v_withOpts o) ((v_usageErr nConsole) prog))
  | _ -> failwith "DT: impossible branch"
))
) else (if (dtb__131 = "--out") then (match dtb__132 with
  | B_dData_dList.C_List__x58__x58_ (dtb__139, dtb__140) -> (if ((B_dData_dString.v_startsWith "-") dtb__139) then ((v_withOpts o) (((v_removedFlag nConsole) prog) dtb__139)) else (match out with
  | B_dData_dMaybe.C_Maybe_Nothing -> ((((((((((((((v_buildParse nFs) nConsole) nClock) nEnv) nProcess) nExit) nArgs) prog) noCompile) (B_dData_dMaybe.C_Maybe_Just (dtb__139))) dir) pkg) dtb__140) o)
  | B_dData_dMaybe.C_Maybe_Just (dtb__141) -> ((v_withOpts o) ((v_usageErr nConsole) prog))
  | _ -> failwith "DT: impossible branch"
))
  | B_dData_dList.C_List_Nil -> ((v_withOpts o) ((v_usageErr nConsole) prog))
  | _ -> failwith "DT: impossible branch"
) else (if (dtb__131 = "--package") then (match dtb__132 with
  | B_dData_dList.C_List__x58__x58_ (dtb__142, dtb__143) -> (if ((B_dData_dString.v_startsWith "-") dtb__142) then ((v_withOpts o) (((v_removedFlag nConsole) prog) dtb__142)) else (match pkg with
  | B_dData_dMaybe.C_Maybe_Nothing -> ((((((((((((((v_buildParse nFs) nConsole) nClock) nEnv) nProcess) nExit) nArgs) prog) noCompile) out) dir) (B_dData_dMaybe.C_Maybe_Just (dtb__142))) dtb__143) o)
  | B_dData_dMaybe.C_Maybe_Just (dtb__144) -> ((v_withOpts o) ((v_usageErr nConsole) prog))
  | _ -> failwith "DT: impossible branch"
))
  | B_dData_dList.C_List_Nil -> ((v_withOpts o) ((v_usageErr nConsole) prog))
  | _ -> failwith "DT: impossible branch"
) else (if ((B_dData_dString.v_startsWith "-") dtb__131) then ((v_withOpts o) (((v_removedFlag nConsole) prog) dtb__131)) else (match dir with
  | B_dData_dMaybe.C_Maybe_Nothing -> ((((((((((((((v_buildParse nFs) nConsole) nClock) nEnv) nProcess) nExit) nArgs) prog) noCompile) out) (B_dData_dMaybe.C_Maybe_Just (dtb__131))) pkg) dtb__132) o)
  | B_dData_dMaybe.C_Maybe_Just (dtb__145) -> ((v_withOpts o) ((v_usageErr nConsole) prog))
  | _ -> failwith "DT: impossible branch"
))))))))
  | B_dData_dList.C_List_Nil -> ((((((((((((v_buildRun nFs) nConsole) nClock) nEnv) nProcess) nExit) nArgs) noCompile) (v_defaultDir dir)) out) pkg) o)
  | _ -> failwith "DT: impossible branch"
)))

# 1155 "Vuna/Compiler/Driver/CompilerCli.vuna"
let v_buildArgs = (fun (nFs : string) (nConsole : string) (nClock : string) (nEnv : string) (nProcess : string) (nExit : string) (nArgs : string) (prog : string) (args : string B_dData_dList.t_List) (o : t_CliOpts) -> ((((((((((((((v_buildParse nFs) nConsole) nClock) nEnv) nProcess) nExit) nArgs) prog) false) B_dData_dMaybe.C_Maybe_Nothing) B_dData_dMaybe.C_Maybe_Nothing) B_dData_dMaybe.C_Maybe_Nothing) args) o))

# 1525 "Vuna/Compiler/Driver/CompilerCli.vuna"
let rec v_stripLangGo = (fun (mc0 : string B_dData_dList.t_List) (mc1 : string B_dData_dList.t_List) (mc2 : string) -> (match mc0 with
  | B_dData_dList.C_List__x58__x58_ (dtb__146, dtb__147) -> (if (dtb__146 = "--lang") then (match dtb__147 with
  | B_dData_dList.C_List__x58__x58_ (dtb__148, dtb__149) -> (((v_stripLangGo dtb__149) mc1) dtb__148)
  | B_dData_dList.C_List_Nil -> { B_dData_dPair.f_Pair_first = (B_dData_dList.v_reverse mc1); B_dData_dPair.f_Pair_second = mc2 }
  | _ -> failwith "DT: impossible branch"
) else (if ((B_dData_dString.v_startsWith "--lang=") dtb__146) then (((v_stripLangGo dtb__147) mc1) (((B_dData_dString.v_substring (bi_natFromInt 7)) (bi_natFromInt ((String.length dtb__146) - 7))) dtb__146)) else (((v_stripLangGo dtb__147) (B_dData_dList.C_List__x58__x58_ (dtb__146, mc1))) mc2)))
  | B_dData_dList.C_List_Nil -> { B_dData_dPair.f_Pair_first = (B_dData_dList.v_reverse mc1); B_dData_dPair.f_Pair_second = mc2 }
  | _ -> failwith "DT: impossible branch"
))

# 1521 "Vuna/Compiler/Driver/CompilerCli.vuna"
let v_stripLang = (fun (args : string B_dData_dList.t_List) -> (((v_stripLangGo args) B_dData_dList.C_List_Nil) "en"))

# 1538 "Vuna/Compiler/Driver/CompilerCli.vuna"
let rec v_hasLangFlag = (fun (mc0 : string B_dData_dList.t_List) -> (match mc0 with
  | B_dData_dList.C_List__x58__x58_ (dtb__150, dtb__151) -> (if (if (dtb__150 = "--lang") then true else ((B_dData_dString.v_startsWith "--lang=") dtb__150)) then true else (v_hasLangFlag dtb__151))
  | B_dData_dList.C_List_Nil -> false
  | _ -> failwith "DT: impossible branch"
))

# 1546 "Vuna/Compiler/Driver/CompilerCli.vuna"
let rec v_stripContinueGo = (fun (mc0 : string B_dData_dList.t_List) (mc1 : string B_dData_dList.t_List) (mc2 : bool) -> (match mc0 with
  | B_dData_dList.C_List__x58__x58_ (dtb__152, dtb__153) -> (if (dtb__152 = "--continue-on-error") then (((v_stripContinueGo dtb__153) mc1) true) else (((v_stripContinueGo dtb__153) (B_dData_dList.C_List__x58__x58_ (dtb__152, mc1))) mc2))
  | B_dData_dList.C_List_Nil -> { B_dData_dPair.f_Pair_first = (B_dData_dList.v_reverse mc1); B_dData_dPair.f_Pair_second = mc2 }
  | _ -> failwith "DT: impossible branch"
))

# 1543 "Vuna/Compiler/Driver/CompilerCli.vuna"
let v_stripContinueOnError = (fun (args : string B_dData_dList.t_List) -> (((v_stripContinueGo args) B_dData_dList.C_List_Nil) false))

# 1590 "Vuna/Compiler/Driver/CompilerCli.vuna"
let v_printRecovered = (fun (nFs : string) (nConsole : string) (pkg : Frontend_dPackages_dPkg.t_Package) (e : Base_dDiag.t_Diagnostic) (ds : Base_dDiag.t_Diagnostic B_dData_dList.t_List) (o : t_CliOpts) -> (let shown = ((v_takeDiags (o).f_CliOpts_optMaxErrors) ds) in (((B_dTrait_dMonad.v__x62__x62__x61_ B_dEffect_dCore.v_Monad_ucc99eea03f4e7df1_uBase_x36_46_x36_Effect_x36_46_x36_Core_x36_46_x36_Eff_ur) (((((v_printDiagList nFs) nConsole) o) (String.concat "" ["["; (Frontend_dPackages_dPkg.v_packageName pkg); "] "])) shown)) (fun r -> (if ((B_dData_dList.v_length shown) = 0) then (((((v_printDiagWithPrefix nFs) nConsole) (B_dData_dPair.v_secondOf r)) (String.concat "" ["["; (Frontend_dPackages_dPkg.v_packageName pkg); "] "])) e) else ((B_dTrait_dApplicative.v_pure B_dEffect_dCore.v_Applicative_u19070277251d295b_uBase_x36_46_x36_Effect_x36_46_x36_Core_x36_46_x36_Eff_ur) { B_dData_dPair.f_Pair_first = 1; B_dData_dPair.f_Pair_second = (B_dData_dPair.v_secondOf r) }))))))

# 1567 "Vuna/Compiler/Driver/CompilerCli.vuna"
let v_packageRecoverExe = (fun (nFs : string) (nConsole : string) (nEnv : string) (nProcess : string) (pkg : Frontend_dPackages_dPkg.t_Package) (e : Base_dDiag.t_Diagnostic) (o : t_CliOpts) -> (((B_dTrait_dMonad.v__x62__x62__x61_ B_dEffect_dCore.v_Monad_ucc99eea03f4e7df1_uBase_x36_46_x36_Effect_x36_46_x36_Core_x36_46_x36_Eff_ur) (((((Driver_dDt.v_dtCheckRecovering nFs) nEnv) nProcess) ((Frontend_dPackages_dPkg.v_contextWithRelease (o).f_CliOpts_optRelease) (Frontend_dPackages_dPkg.v_packageContext pkg))) (Frontend_dPackages_dPkg.v_packageEntry pkg))) (fun recovered -> (match recovered with
  | Base_dDiag.C_Check_OkC (dtb__154) -> ((((((v_printRecovered nFs) nConsole) pkg) e) dtb__154) o)
  | Base_dDiag.C_Check_ErrC (dtb__155) -> (((((v_printDiagWithPrefix nFs) nConsole) o) (String.concat "" ["["; (Frontend_dPackages_dPkg.v_packageName pkg); "] "])) dtb__155)
  | _ -> failwith "DT: impossible branch"
))))

# 1577 "Vuna/Compiler/Driver/CompilerCli.vuna"
let v_packageRecoverLib = (fun (nFs : string) (nConsole : string) (nEnv : string) (nProcess : string) (pkg : Frontend_dPackages_dPkg.t_Package) (e : Base_dDiag.t_Diagnostic) (o : t_CliOpts) -> (match (Frontend_dPackages_dPkg.v_packageExports pkg) with
  | B_dData_dMaybe.C_Maybe_Just (dtb__156) -> (((B_dTrait_dMonad.v__x62__x62__x61_ B_dEffect_dCore.v_Monad_ucc99eea03f4e7df1_uBase_x36_46_x36_Effect_x36_46_x36_Core_x36_46_x36_Eff_ur) (((((Driver_dDt.v_dtCheckLibraryRecovering nFs) nEnv) nProcess) ((Frontend_dPackages_dPkg.v_contextWithRelease (o).f_CliOpts_optRelease) (Frontend_dPackages_dPkg.v_packageContext pkg))) dtb__156)) (fun recovered -> (match recovered with
  | Base_dDiag.C_Check_OkC (dtb__157) -> ((((((v_printRecovered nFs) nConsole) pkg) e) dtb__157) o)
  | Base_dDiag.C_Check_ErrC (dtb__158) -> (((((v_printDiagWithPrefix nFs) nConsole) o) (String.concat "" ["["; (Frontend_dPackages_dPkg.v_packageName pkg); "] "])) dtb__158)
  | _ -> failwith "DT: impossible branch"
)))
  | B_dData_dMaybe.C_Maybe_Nothing -> (((((v_printDiagWithPrefix nFs) nConsole) o) (String.concat "" ["["; (Frontend_dPackages_dPkg.v_packageName pkg); "] "])) e)
  | _ -> failwith "DT: impossible branch"
))

# 1560 "Vuna/Compiler/Driver/CompilerCli.vuna"
let v_packageRecover = (fun (nFs : string) (nConsole : string) (nEnv : string) (nProcess : string) (pkg : Frontend_dPackages_dPkg.t_Package) (e : Base_dDiag.t_Diagnostic) (o : t_CliOpts) -> (((B_dTrait_dMonad.v__x62__x62__x61_ B_dEffect_dCore.v_Monad_ucc99eea03f4e7df1_uBase_x36_46_x36_Effect_x36_46_x36_Core_x36_46_x36_Eff_ur) ((B_dEffect_dFs.v_fsFileExists nFs) (Frontend_dPackages_dPkg.v_packageEntry pkg))) (fun exists -> (if exists then (((((((v_packageRecoverExe nFs) nConsole) nEnv) nProcess) pkg) e) o) else (((((((v_packageRecoverLib nFs) nConsole) nEnv) nProcess) pkg) e) o)))))

# 1551 "Vuna/Compiler/Driver/CompilerCli.vuna"
let v_checkPackageErr = (fun (nFs : string) (nConsole : string) (nEnv : string) (nProcess : string) (pkg : Frontend_dPackages_dPkg.t_Package) (e : Base_dDiag.t_Diagnostic) (o : t_CliOpts) -> (if (o).f_CliOpts_optContinueOnError then (((((((v_packageRecover nFs) nConsole) nEnv) nProcess) pkg) e) o) else (((((v_printDiagWithPrefix nFs) nConsole) o) (String.concat "" ["["; (Frontend_dPackages_dPkg.v_packageName pkg); "] "])) e)))

# 1053 "Vuna/Compiler/Driver/CompilerCli.vuna"
let v_checkPackageCode = (fun (nFs : string) (nConsole : string) (nClock : string) (nEnv : string) (nProcess : string) (nExit : string) (nArgs : string) (pkg : Frontend_dPackages_dPkg.t_Package) (wantWarnings : bool) (o : t_CliOpts) -> (((B_dTrait_dMonad.v__x62__x62__x61_ B_dEffect_dCore.v_Monad_ucc99eea03f4e7df1_uBase_x36_46_x36_Effect_x36_46_x36_Core_x36_46_x36_Eff_ur) (((((((((Driver_dCompile.v_checkPackage nFs) nClock) nEnv) nProcess) nExit) nArgs) (o).f_CliOpts_optRelease) wantWarnings) pkg)) (fun r -> (match r with
  | Base_dDiag.C_Check_ErrC (dtb__159) -> (((((((v_checkPackageErr nFs) nConsole) nEnv) nProcess) pkg) dtb__159) o)
  | Base_dDiag.C_Check_OkC (dtb__160) -> (let ws = ((B_dData_dList.v_filter (v_ownedByPackage pkg)) (Base_dDiagnostics_dSink.v_dedupeWarnings dtb__160)) in (let shown = (if (if (o).f_CliOpts_optShowWarnings then true else (o).f_CliOpts_optDenyWarnings) then ws else B_dData_dList.C_List_Nil) in (let failed = (if (if (o).f_CliOpts_optDenyWarnings then ((B_dData_dList.v_length ws) > 0) else false) then 1 else 0) in (((B_dTrait_dMonad.v__x62__x62__x61_ B_dEffect_dCore.v_Monad_ucc99eea03f4e7df1_uBase_x36_46_x36_Effect_x36_46_x36_Core_x36_46_x36_Eff_ur) (((((v_printDiagList nFs) nConsole) o) (String.concat "" ["["; (Frontend_dPackages_dPkg.v_packageName pkg); "] "])) shown)) (fun r1 -> ((B_dTrait_dApplicative.v_pure B_dEffect_dCore.v_Applicative_u19070277251d295b_uBase_x36_46_x36_Effect_x36_46_x36_Core_x36_46_x36_Eff_ur) { B_dData_dPair.f_Pair_first = failed; B_dData_dPair.f_Pair_second = (B_dData_dPair.v_secondOf r1) }))))))
  | _ -> failwith "DT: impossible branch"
))))

# 1042 "Vuna/Compiler/Driver/CompilerCli.vuna"
let v_checkPackageSeq = (fun (nFs : string) (nConsole : string) (nClock : string) (nEnv : string) (nProcess : string) (nExit : string) (nArgs : string) (pkg : Frontend_dPackages_dPkg.t_Package) (code : int) (o : t_CliOpts) -> (let o1 = ((v_applyDiagConfig (B_dData_dMaybe.C_Maybe_Just (pkg))) o) in (let wantWarnings = (if (o1).f_CliOpts_optShowWarnings then true else (o1).f_CliOpts_optDenyWarnings) in (((B_dTrait_dMonad.v__x62__x62__x61_ B_dEffect_dCore.v_Monad_ucc99eea03f4e7df1_uBase_x36_46_x36_Effect_x36_46_x36_Core_x36_46_x36_Eff_ur) ((((((((((v_checkPackageCode nFs) nConsole) nClock) nEnv) nProcess) nExit) nArgs) pkg) wantWarnings) o1)) (fun r -> ((B_dTrait_dApplicative.v_pure B_dEffect_dCore.v_Applicative_u19070277251d295b_uBase_x36_46_x36_Effect_x36_46_x36_Core_x36_46_x36_Eff_ur) { B_dData_dPair.f_Pair_first = (if ((B_dData_dPair.v_firstOf r) > code) then (B_dData_dPair.v_firstOf r) else code); B_dData_dPair.f_Pair_second = (B_dData_dPair.v_secondOf r) }))))))

# 1021 "Vuna/Compiler/Driver/CompilerCli.vuna"
let rec v_checkPkgsInProcess = (fun (nFs : string) (nConsole : string) (nClock : string) (nEnv : string) (nProcess : string) (nExit : string) (nArgs : string) (mc0 : Frontend_dPackages_dPkg.t_Package B_dData_dList.t_List) (mc1 : int) (mc2 : t_CliOpts) -> (match mc0 with
  | B_dData_dList.C_List__x58__x58_ (dtb__161, dtb__162) -> (((B_dTrait_dMonad.v__x62__x62__x61_ B_dEffect_dCore.v_Monad_ucc99eea03f4e7df1_uBase_x36_46_x36_Effect_x36_46_x36_Core_x36_46_x36_Eff_ur) ((((((((((v_checkPackageSeq nFs) nConsole) nClock) nEnv) nProcess) nExit) nArgs) dtb__161) mc1) mc2)) (fun r -> ((((((((((v_checkPkgsInProcess nFs) nConsole) nClock) nEnv) nProcess) nExit) nArgs) dtb__162) (B_dData_dPair.v_firstOf r)) (B_dData_dPair.v_secondOf r))))
  | B_dData_dList.C_List_Nil -> ((B_dTrait_dApplicative.v_pure B_dEffect_dCore.v_Applicative_u19070277251d295b_uBase_x36_46_x36_Effect_x36_46_x36_Core_x36_46_x36_Eff_ur) { B_dData_dPair.f_Pair_first = mc1; B_dData_dPair.f_Pair_second = mc2 })
  | _ -> failwith "DT: impossible branch"
))

# 1033 "Vuna/Compiler/Driver/CompilerCli.vuna"
let rec v_checkRootsSeq = (fun (nFs : string) (nConsole : string) (nClock : string) (nEnv : string) (nProcess : string) (nExit : string) (nArgs : string) (mc0 : Frontend_dPackages_dPkg.t_Package B_dData_dList.t_List) (mc1 : int) (mc2 : t_CliOpts) -> (match mc0 with
  | B_dData_dList.C_List__x58__x58_ (dtb__163, dtb__164) -> (((B_dTrait_dMonad.v__x62__x62__x61_ B_dEffect_dCore.v_Monad_ucc99eea03f4e7df1_uBase_x36_46_x36_Effect_x36_46_x36_Core_x36_46_x36_Eff_ur) ((((((((((v_checkPackageSeq nFs) nConsole) nClock) nEnv) nProcess) nExit) nArgs) dtb__163) mc1) mc2)) (fun r -> (let code1 = (B_dData_dPair.v_firstOf r) in (if (if (mc2).f_CliOpts_optFailFast then (code1 <> 0) else false) then ((B_dTrait_dApplicative.v_pure B_dEffect_dCore.v_Applicative_u19070277251d295b_uBase_x36_46_x36_Effect_x36_46_x36_Core_x36_46_x36_Eff_ur) { B_dData_dPair.f_Pair_first = code1; B_dData_dPair.f_Pair_second = (B_dData_dPair.v_secondOf r) }) else ((((((((((v_checkRootsSeq nFs) nConsole) nClock) nEnv) nProcess) nExit) nArgs) dtb__164) code1) (B_dData_dPair.v_secondOf r))))))
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
  | B_dData_dList.C_List__x58__x58_ (dtb__165, dtb__166) -> (match dtb__166 with
  | B_dData_dList.C_List_Nil -> ((((((((((v_checkPackageSeq nFs) nConsole) nClock) nEnv) nProcess) nExit) nArgs) dtb__165) mc1) mc2)
  | _ -> (let oMachine = (v_markFormatExplicit mc2) in (if (v_isMachineFormat (mc2).f_CliOpts_optDiagFormat) then ((((((((((v_checkPkgsInProcess nFs) nConsole) nClock) nEnv) nProcess) nExit) nArgs) mc0) mc1) oMachine) else ((((((((((v_checkPackagesSpawn nFs) nConsole) nClock) nEnv) nProcess) nExit) nArgs) mc0) mc1) mc2)))
)
  | B_dData_dList.C_List_Nil -> ((B_dTrait_dApplicative.v_pure B_dEffect_dCore.v_Applicative_u19070277251d295b_uBase_x36_46_x36_Effect_x36_46_x36_Core_x36_46_x36_Eff_ur) { B_dData_dPair.f_Pair_first = mc1; B_dData_dPair.f_Pair_second = mc2 })
  | _ -> failwith "DT: impossible branch"
))

# 901 "Vuna/Compiler/Driver/CompilerCli.vuna"
let v_checkPkgDir = (fun (nFs : string) (nConsole : string) (nClock : string) (nEnv : string) (nProcess : string) (nExit : string) (nArgs : string) (dir : string) (o : t_CliOpts) -> (((B_dTrait_dMonad.v__x62__x62__x61_ B_dEffect_dCore.v_Monad_ucc99eea03f4e7df1_uBase_x36_46_x36_Effect_x36_46_x36_Core_x36_46_x36_Eff_ur) (((Frontend_dPackages_dPkg.v_workspacePackages nFs) nEnv) dir)) (fun pkgsR -> (match pkgsR with
  | Base_dDiag.C_Check_ErrC (dtb__167) -> ((((v_printDiag nFs) nConsole) o) dtb__167)
  | Base_dDiag.C_Check_OkC (dtb__168) -> ((((((((((v_checkPackages nFs) nConsole) nClock) nEnv) nProcess) nExit) nArgs) dtb__168) 0) o)
  | _ -> failwith "DT: impossible branch"
))))

# 890 "Vuna/Compiler/Driver/CompilerCli.vuna"
let v_checkEmit = (fun (nFs : string) (nConsole : string) (nClock : string) (nEnv : string) (nProcess : string) (nExit : string) (nArgs : string) (path : string) (o : t_CliOpts) -> (((B_dTrait_dMonad.v__x62__x62__x61_ B_dEffect_dCore.v_Monad_ucc99eea03f4e7df1_uBase_x36_46_x36_Effect_x36_46_x36_Core_x36_46_x36_Eff_ur) ((B_dEffect_dFs.v_fsFileExists nFs) path)) (fun exists -> (if exists then (((B_dTrait_dMonad.v__x62__x62__x61_ B_dEffect_dCore.v_Monad_ucc99eea03f4e7df1_uBase_x36_46_x36_Effect_x36_46_x36_Core_x36_46_x36_Eff_ur) ((B_dEffect_dFs.v_fsIsDirectory nFs) path)) (fun isDir -> (if isDir then (((((((((v_checkPkgDir nFs) nConsole) nClock) nEnv) nProcess) nExit) nArgs) path) o) else ((((((v_checkFileEntry nFs) nConsole) nEnv) nProcess) path) o)))) else ((v_withOpts o) ((v_dtPathErr nConsole) path))))))

# 878 "Vuna/Compiler/Driver/CompilerCli.vuna"
let rec v_checkArgs = (fun (nFs : string) (nConsole : string) (nClock : string) (nEnv : string) (nProcess : string) (nExit : string) (nArgs : string) (mc0 : string) (mc1 : string B_dData_dList.t_List) (mc2 : t_CliOpts) -> (match mc1 with
  | B_dData_dList.C_List__x58__x58_ (dtb__169, dtb__170) -> (if (dtb__169 = "--release") then ((((((((((v_checkArgs nFs) nConsole) nClock) nEnv) nProcess) nExit) nArgs) mc0) dtb__170) (v_markRelease mc2)) else (if ((B_dData_dString.v_startsWith "-") dtb__169) then ((v_withOpts mc2) (((v_removedFlag nConsole) mc0) dtb__169)) else (match dtb__170 with
  | B_dData_dList.C_List_Nil -> (((((((((v_checkEmit nFs) nConsole) nClock) nEnv) nProcess) nExit) nArgs) dtb__169) mc2)
  | _ -> ((v_withOpts mc2) ((v_usageErr nConsole) mc0))
)))
  | B_dData_dList.C_List_Nil -> ((v_withOpts mc2) ((v_usageErr nConsole) mc0))
  | _ -> failwith "DT: impossible branch"
))

# 568 "Vuna/Compiler/Driver/CompilerCli.vuna"
let v_runCompilerCliFor1 = (fun (nFs : string) (nConsole : string) (nClock : string) (nEnv : string) (nProcess : string) (nExit : string) (nArgs : string) (nTty : string) (prog : string) (args : string B_dData_dList.t_List) (o : t_CliOpts) -> (match args with
  | B_dData_dList.C_List_Nil -> ((v_withOpts o) ((v_usageErr nConsole) prog))
  | B_dData_dList.C_List__x58__x58_ (dtb__171, dtb__172) -> (if (dtb__171 = "compile") then ((((((((v_compileArgs nFs) nConsole) nClock) nEnv) nProcess) prog) dtb__172) o) else (if (dtb__171 = "check") then ((((((((((v_checkArgs nFs) nConsole) nClock) nEnv) nProcess) nExit) nArgs) prog) dtb__172) o) else (if (dtb__171 = "build") then ((((((((((v_buildArgs nFs) nConsole) nClock) nEnv) nProcess) nExit) nArgs) prog) dtb__172) o) else (if (dtb__171 = "version") then ((v_withOpts o) ((v_printVersion nConsole) 0)) else (if (dtb__171 = "--version") then ((v_withOpts o) ((v_printVersion nConsole) 0)) else (if (dtb__171 = "seed") then ((v_withOpts o) ((((v_removedCommand nConsole) prog) "seed") "use build --out OUT [DIR] or compile DIR OUT")) else (if (dtb__171 = "help") then ((v_withOpts o) ((v_helpFor nConsole) prog)) else (if ((B_dData_dString.v_startsWith "-") dtb__171) then ((v_withOpts o) (((v_removedFlag nConsole) prog) dtb__171)) else ((v_withOpts o) (((v_unknownCommand nConsole) prog) dtb__171))))))))))
  | _ -> failwith "DT: impossible branch"
))

# 502 "Vuna/Compiler/Driver/CompilerCli.vuna"
let v_runCompilerCliFor = (fun (nFs : string) (nConsole : string) (nClock : string) (nEnv : string) (nProcess : string) (nExit : string) (nArgs : string) (nTty : string) (prog : string) (args : string B_dData_dList.t_List) -> (((B_dTrait_dMonad.v__x62__x62__x61_ B_dEffect_dCore.v_Monad_ucc99eea03f4e7df1_uBase_x36_46_x36_Effect_x36_46_x36_Core_x36_46_x36_Eff_ur) ((B_dEffect_dEnv.v_envGetEnv nEnv) "VUNA_RELEASE")) (fun envRel -> (((B_dTrait_dMonad.v__x62__x62__x61_ B_dEffect_dCore.v_Monad_ucc99eea03f4e7df1_uBase_x36_46_x36_Effect_x36_46_x36_Core_x36_46_x36_Eff_ur) (B_dEffect_dTty.v_ttyIsTty nTty)) (fun tty -> (let stripped = (v_stripDiagFormat args) in (let strippedLang = (v_stripLang (B_dData_dPair.v_firstOf stripped)) in (let strippedMax = (v_stripMaxErrors (B_dData_dPair.v_firstOf strippedLang)) in (let kept = (v_stripDenyWarnings (B_dData_dPair.v_firstOf strippedMax)) in (let strippedContinue = (v_stripContinueOnError kept) in (let detectedLang = (B_dData_dPair.v_secondOf strippedLang) in (let fmt = (match (B_dData_dPair.v_secondOf stripped) with
  | B_dData_dMaybe.C_Maybe_Just (dtb__173) -> dtb__173
  | B_dData_dMaybe.C_Maybe_Nothing -> (if (detectedLang = "en") then (if tty then "human" else "short") else "human")
  | _ -> failwith "DT: impossible branch"
) in (let opts = { f_CliOpts_optDiagFormat = fmt; f_CliOpts_optDiagLang = detectedLang; f_CliOpts_optLangExplicit = (v_hasLangFlag args); f_CliOpts_optDenyWarnings = (v_hasDenyWarnings args); f_CliOpts_optShowWarnings = (if (v_hasDenyWarnings args) then true else (v_hasShowWarnings args)); f_CliOpts_optFormatExplicit = (v_hasFormatFlag args); f_CliOpts_optWarningsExplicit = (if (v_hasDenyWarnings args) then true else (v_hasShowWarnings args)); f_CliOpts_optDenyExplicit = (v_hasDenyWarnings args); f_CliOpts_optMaxErrors = (B_dData_dPair.v_secondOf strippedMax); f_CliOpts_optContinueOnError = (B_dData_dPair.v_secondOf strippedContinue); f_CliOpts_optSarifItems = B_dData_dList.C_List_Nil; f_CliOpts_optRelease = (envRel = "1"); f_CliOpts_optShowCascade = (v_hasShowCascade args); f_CliOpts_optWithSources = (v_hasWithSources args); f_CliOpts_optFailFast = (v_hasFailFast args); f_CliOpts_optTarget = "ocaml"; f_CliOpts_optWasmOpt = 3 } in (if (v_anyHelp (B_dData_dPair.v_firstOf strippedContinue)) then ((v_helpFor nConsole) prog) else (((B_dTrait_dMonad.v__x62__x62__x61_ B_dEffect_dCore.v_Monad_ucc99eea03f4e7df1_uBase_x36_46_x36_Effect_x36_46_x36_Core_x36_46_x36_Eff_ur) (((((((((((v_runCompilerCliFor1 nFs) nConsole) nClock) nEnv) nProcess) nExit) nArgs) nTty) prog) (v_stripFailFast (v_stripWithSources (v_stripShowCascade (B_dData_dPair.v_firstOf strippedContinue))))) opts)) (fun r -> (((((v_flushSarif nFs) nConsole) nEnv) (B_dData_dPair.v_firstOf r)) (B_dData_dPair.v_secondOf r))))))))))))))))))

# 69 "Vuna/Compiler/Driver/CompilerCli.vuna"
let v_runCompilerCli = (fun (nFs : string) (nConsole : string) (nClock : string) (nEnv : string) (nProcess : string) (nExit : string) (nArgs : string) (nTty : string) (args : string B_dData_dList.t_List) -> ((((((((((v_runCompilerCliFor nFs) nConsole) nClock) nEnv) nProcess) nExit) nArgs) nTty) "vuna") args))

# 73 "Vuna/Compiler/Driver/CompilerCli.vuna"
let v_optDiagFormat = (fun (p : t_CliOpts) -> (match p with
  | { f_CliOpts_optDiagFormat = dtb__174; f_CliOpts_optDiagLang = dtb__175; f_CliOpts_optLangExplicit = dtb__176; f_CliOpts_optDenyWarnings = dtb__177; f_CliOpts_optShowWarnings = dtb__178; f_CliOpts_optFormatExplicit = dtb__179; f_CliOpts_optWarningsExplicit = dtb__180; f_CliOpts_optDenyExplicit = dtb__181; f_CliOpts_optMaxErrors = dtb__182; f_CliOpts_optContinueOnError = dtb__183; f_CliOpts_optSarifItems = dtb__184; f_CliOpts_optRelease = dtb__185; f_CliOpts_optShowCascade = dtb__186; f_CliOpts_optWithSources = dtb__187; f_CliOpts_optFailFast = dtb__188; f_CliOpts_optTarget = dtb__189; f_CliOpts_optWasmOpt = dtb__190 } -> dtb__174
  | _ -> failwith "DT: impossible branch"
))

# 74 "Vuna/Compiler/Driver/CompilerCli.vuna"
let v_optDiagLang = (fun (p : t_CliOpts) -> (match p with
  | { f_CliOpts_optDiagFormat = dtb__191; f_CliOpts_optDiagLang = dtb__192; f_CliOpts_optLangExplicit = dtb__193; f_CliOpts_optDenyWarnings = dtb__194; f_CliOpts_optShowWarnings = dtb__195; f_CliOpts_optFormatExplicit = dtb__196; f_CliOpts_optWarningsExplicit = dtb__197; f_CliOpts_optDenyExplicit = dtb__198; f_CliOpts_optMaxErrors = dtb__199; f_CliOpts_optContinueOnError = dtb__200; f_CliOpts_optSarifItems = dtb__201; f_CliOpts_optRelease = dtb__202; f_CliOpts_optShowCascade = dtb__203; f_CliOpts_optWithSources = dtb__204; f_CliOpts_optFailFast = dtb__205; f_CliOpts_optTarget = dtb__206; f_CliOpts_optWasmOpt = dtb__207 } -> dtb__192
  | _ -> failwith "DT: impossible branch"
))

# 75 "Vuna/Compiler/Driver/CompilerCli.vuna"
let v_optLangExplicit = (fun (p : t_CliOpts) -> (match p with
  | { f_CliOpts_optDiagFormat = dtb__208; f_CliOpts_optDiagLang = dtb__209; f_CliOpts_optLangExplicit = dtb__210; f_CliOpts_optDenyWarnings = dtb__211; f_CliOpts_optShowWarnings = dtb__212; f_CliOpts_optFormatExplicit = dtb__213; f_CliOpts_optWarningsExplicit = dtb__214; f_CliOpts_optDenyExplicit = dtb__215; f_CliOpts_optMaxErrors = dtb__216; f_CliOpts_optContinueOnError = dtb__217; f_CliOpts_optSarifItems = dtb__218; f_CliOpts_optRelease = dtb__219; f_CliOpts_optShowCascade = dtb__220; f_CliOpts_optWithSources = dtb__221; f_CliOpts_optFailFast = dtb__222; f_CliOpts_optTarget = dtb__223; f_CliOpts_optWasmOpt = dtb__224 } -> dtb__210
  | _ -> failwith "DT: impossible branch"
))

# 76 "Vuna/Compiler/Driver/CompilerCli.vuna"
let v_optDenyWarnings = (fun (p : t_CliOpts) -> (match p with
  | { f_CliOpts_optDiagFormat = dtb__225; f_CliOpts_optDiagLang = dtb__226; f_CliOpts_optLangExplicit = dtb__227; f_CliOpts_optDenyWarnings = dtb__228; f_CliOpts_optShowWarnings = dtb__229; f_CliOpts_optFormatExplicit = dtb__230; f_CliOpts_optWarningsExplicit = dtb__231; f_CliOpts_optDenyExplicit = dtb__232; f_CliOpts_optMaxErrors = dtb__233; f_CliOpts_optContinueOnError = dtb__234; f_CliOpts_optSarifItems = dtb__235; f_CliOpts_optRelease = dtb__236; f_CliOpts_optShowCascade = dtb__237; f_CliOpts_optWithSources = dtb__238; f_CliOpts_optFailFast = dtb__239; f_CliOpts_optTarget = dtb__240; f_CliOpts_optWasmOpt = dtb__241 } -> dtb__228
  | _ -> failwith "DT: impossible branch"
))

# 77 "Vuna/Compiler/Driver/CompilerCli.vuna"
let v_optShowWarnings = (fun (p : t_CliOpts) -> (match p with
  | { f_CliOpts_optDiagFormat = dtb__242; f_CliOpts_optDiagLang = dtb__243; f_CliOpts_optLangExplicit = dtb__244; f_CliOpts_optDenyWarnings = dtb__245; f_CliOpts_optShowWarnings = dtb__246; f_CliOpts_optFormatExplicit = dtb__247; f_CliOpts_optWarningsExplicit = dtb__248; f_CliOpts_optDenyExplicit = dtb__249; f_CliOpts_optMaxErrors = dtb__250; f_CliOpts_optContinueOnError = dtb__251; f_CliOpts_optSarifItems = dtb__252; f_CliOpts_optRelease = dtb__253; f_CliOpts_optShowCascade = dtb__254; f_CliOpts_optWithSources = dtb__255; f_CliOpts_optFailFast = dtb__256; f_CliOpts_optTarget = dtb__257; f_CliOpts_optWasmOpt = dtb__258 } -> dtb__246
  | _ -> failwith "DT: impossible branch"
))

# 78 "Vuna/Compiler/Driver/CompilerCli.vuna"
let v_optFormatExplicit = (fun (p : t_CliOpts) -> (match p with
  | { f_CliOpts_optDiagFormat = dtb__259; f_CliOpts_optDiagLang = dtb__260; f_CliOpts_optLangExplicit = dtb__261; f_CliOpts_optDenyWarnings = dtb__262; f_CliOpts_optShowWarnings = dtb__263; f_CliOpts_optFormatExplicit = dtb__264; f_CliOpts_optWarningsExplicit = dtb__265; f_CliOpts_optDenyExplicit = dtb__266; f_CliOpts_optMaxErrors = dtb__267; f_CliOpts_optContinueOnError = dtb__268; f_CliOpts_optSarifItems = dtb__269; f_CliOpts_optRelease = dtb__270; f_CliOpts_optShowCascade = dtb__271; f_CliOpts_optWithSources = dtb__272; f_CliOpts_optFailFast = dtb__273; f_CliOpts_optTarget = dtb__274; f_CliOpts_optWasmOpt = dtb__275 } -> dtb__264
  | _ -> failwith "DT: impossible branch"
))

# 79 "Vuna/Compiler/Driver/CompilerCli.vuna"
let v_optWarningsExplicit = (fun (p : t_CliOpts) -> (match p with
  | { f_CliOpts_optDiagFormat = dtb__276; f_CliOpts_optDiagLang = dtb__277; f_CliOpts_optLangExplicit = dtb__278; f_CliOpts_optDenyWarnings = dtb__279; f_CliOpts_optShowWarnings = dtb__280; f_CliOpts_optFormatExplicit = dtb__281; f_CliOpts_optWarningsExplicit = dtb__282; f_CliOpts_optDenyExplicit = dtb__283; f_CliOpts_optMaxErrors = dtb__284; f_CliOpts_optContinueOnError = dtb__285; f_CliOpts_optSarifItems = dtb__286; f_CliOpts_optRelease = dtb__287; f_CliOpts_optShowCascade = dtb__288; f_CliOpts_optWithSources = dtb__289; f_CliOpts_optFailFast = dtb__290; f_CliOpts_optTarget = dtb__291; f_CliOpts_optWasmOpt = dtb__292 } -> dtb__282
  | _ -> failwith "DT: impossible branch"
))

# 80 "Vuna/Compiler/Driver/CompilerCli.vuna"
let v_optDenyExplicit = (fun (p : t_CliOpts) -> (match p with
  | { f_CliOpts_optDiagFormat = dtb__293; f_CliOpts_optDiagLang = dtb__294; f_CliOpts_optLangExplicit = dtb__295; f_CliOpts_optDenyWarnings = dtb__296; f_CliOpts_optShowWarnings = dtb__297; f_CliOpts_optFormatExplicit = dtb__298; f_CliOpts_optWarningsExplicit = dtb__299; f_CliOpts_optDenyExplicit = dtb__300; f_CliOpts_optMaxErrors = dtb__301; f_CliOpts_optContinueOnError = dtb__302; f_CliOpts_optSarifItems = dtb__303; f_CliOpts_optRelease = dtb__304; f_CliOpts_optShowCascade = dtb__305; f_CliOpts_optWithSources = dtb__306; f_CliOpts_optFailFast = dtb__307; f_CliOpts_optTarget = dtb__308; f_CliOpts_optWasmOpt = dtb__309 } -> dtb__300
  | _ -> failwith "DT: impossible branch"
))

# 81 "Vuna/Compiler/Driver/CompilerCli.vuna"
let v_optMaxErrors = (fun (p : t_CliOpts) -> (match p with
  | { f_CliOpts_optDiagFormat = dtb__310; f_CliOpts_optDiagLang = dtb__311; f_CliOpts_optLangExplicit = dtb__312; f_CliOpts_optDenyWarnings = dtb__313; f_CliOpts_optShowWarnings = dtb__314; f_CliOpts_optFormatExplicit = dtb__315; f_CliOpts_optWarningsExplicit = dtb__316; f_CliOpts_optDenyExplicit = dtb__317; f_CliOpts_optMaxErrors = dtb__318; f_CliOpts_optContinueOnError = dtb__319; f_CliOpts_optSarifItems = dtb__320; f_CliOpts_optRelease = dtb__321; f_CliOpts_optShowCascade = dtb__322; f_CliOpts_optWithSources = dtb__323; f_CliOpts_optFailFast = dtb__324; f_CliOpts_optTarget = dtb__325; f_CliOpts_optWasmOpt = dtb__326 } -> dtb__318
  | _ -> failwith "DT: impossible branch"
))

# 82 "Vuna/Compiler/Driver/CompilerCli.vuna"
let v_optContinueOnError = (fun (p : t_CliOpts) -> (match p with
  | { f_CliOpts_optDiagFormat = dtb__327; f_CliOpts_optDiagLang = dtb__328; f_CliOpts_optLangExplicit = dtb__329; f_CliOpts_optDenyWarnings = dtb__330; f_CliOpts_optShowWarnings = dtb__331; f_CliOpts_optFormatExplicit = dtb__332; f_CliOpts_optWarningsExplicit = dtb__333; f_CliOpts_optDenyExplicit = dtb__334; f_CliOpts_optMaxErrors = dtb__335; f_CliOpts_optContinueOnError = dtb__336; f_CliOpts_optSarifItems = dtb__337; f_CliOpts_optRelease = dtb__338; f_CliOpts_optShowCascade = dtb__339; f_CliOpts_optWithSources = dtb__340; f_CliOpts_optFailFast = dtb__341; f_CliOpts_optTarget = dtb__342; f_CliOpts_optWasmOpt = dtb__343 } -> dtb__336
  | _ -> failwith "DT: impossible branch"
))

# 83 "Vuna/Compiler/Driver/CompilerCli.vuna"
let v_optSarifItems = (fun (p : t_CliOpts) -> (match p with
  | { f_CliOpts_optDiagFormat = dtb__344; f_CliOpts_optDiagLang = dtb__345; f_CliOpts_optLangExplicit = dtb__346; f_CliOpts_optDenyWarnings = dtb__347; f_CliOpts_optShowWarnings = dtb__348; f_CliOpts_optFormatExplicit = dtb__349; f_CliOpts_optWarningsExplicit = dtb__350; f_CliOpts_optDenyExplicit = dtb__351; f_CliOpts_optMaxErrors = dtb__352; f_CliOpts_optContinueOnError = dtb__353; f_CliOpts_optSarifItems = dtb__354; f_CliOpts_optRelease = dtb__355; f_CliOpts_optShowCascade = dtb__356; f_CliOpts_optWithSources = dtb__357; f_CliOpts_optFailFast = dtb__358; f_CliOpts_optTarget = dtb__359; f_CliOpts_optWasmOpt = dtb__360 } -> dtb__354
  | _ -> failwith "DT: impossible branch"
))

# 84 "Vuna/Compiler/Driver/CompilerCli.vuna"
let v_optRelease = (fun (p : t_CliOpts) -> (match p with
  | { f_CliOpts_optDiagFormat = dtb__361; f_CliOpts_optDiagLang = dtb__362; f_CliOpts_optLangExplicit = dtb__363; f_CliOpts_optDenyWarnings = dtb__364; f_CliOpts_optShowWarnings = dtb__365; f_CliOpts_optFormatExplicit = dtb__366; f_CliOpts_optWarningsExplicit = dtb__367; f_CliOpts_optDenyExplicit = dtb__368; f_CliOpts_optMaxErrors = dtb__369; f_CliOpts_optContinueOnError = dtb__370; f_CliOpts_optSarifItems = dtb__371; f_CliOpts_optRelease = dtb__372; f_CliOpts_optShowCascade = dtb__373; f_CliOpts_optWithSources = dtb__374; f_CliOpts_optFailFast = dtb__375; f_CliOpts_optTarget = dtb__376; f_CliOpts_optWasmOpt = dtb__377 } -> dtb__372
  | _ -> failwith "DT: impossible branch"
))

# 85 "Vuna/Compiler/Driver/CompilerCli.vuna"
let v_optShowCascade = (fun (p : t_CliOpts) -> (match p with
  | { f_CliOpts_optDiagFormat = dtb__378; f_CliOpts_optDiagLang = dtb__379; f_CliOpts_optLangExplicit = dtb__380; f_CliOpts_optDenyWarnings = dtb__381; f_CliOpts_optShowWarnings = dtb__382; f_CliOpts_optFormatExplicit = dtb__383; f_CliOpts_optWarningsExplicit = dtb__384; f_CliOpts_optDenyExplicit = dtb__385; f_CliOpts_optMaxErrors = dtb__386; f_CliOpts_optContinueOnError = dtb__387; f_CliOpts_optSarifItems = dtb__388; f_CliOpts_optRelease = dtb__389; f_CliOpts_optShowCascade = dtb__390; f_CliOpts_optWithSources = dtb__391; f_CliOpts_optFailFast = dtb__392; f_CliOpts_optTarget = dtb__393; f_CliOpts_optWasmOpt = dtb__394 } -> dtb__390
  | _ -> failwith "DT: impossible branch"
))

# 86 "Vuna/Compiler/Driver/CompilerCli.vuna"
let v_optWithSources = (fun (p : t_CliOpts) -> (match p with
  | { f_CliOpts_optDiagFormat = dtb__395; f_CliOpts_optDiagLang = dtb__396; f_CliOpts_optLangExplicit = dtb__397; f_CliOpts_optDenyWarnings = dtb__398; f_CliOpts_optShowWarnings = dtb__399; f_CliOpts_optFormatExplicit = dtb__400; f_CliOpts_optWarningsExplicit = dtb__401; f_CliOpts_optDenyExplicit = dtb__402; f_CliOpts_optMaxErrors = dtb__403; f_CliOpts_optContinueOnError = dtb__404; f_CliOpts_optSarifItems = dtb__405; f_CliOpts_optRelease = dtb__406; f_CliOpts_optShowCascade = dtb__407; f_CliOpts_optWithSources = dtb__408; f_CliOpts_optFailFast = dtb__409; f_CliOpts_optTarget = dtb__410; f_CliOpts_optWasmOpt = dtb__411 } -> dtb__408
  | _ -> failwith "DT: impossible branch"
))

# 87 "Vuna/Compiler/Driver/CompilerCli.vuna"
let v_optFailFast = (fun (p : t_CliOpts) -> (match p with
  | { f_CliOpts_optDiagFormat = dtb__412; f_CliOpts_optDiagLang = dtb__413; f_CliOpts_optLangExplicit = dtb__414; f_CliOpts_optDenyWarnings = dtb__415; f_CliOpts_optShowWarnings = dtb__416; f_CliOpts_optFormatExplicit = dtb__417; f_CliOpts_optWarningsExplicit = dtb__418; f_CliOpts_optDenyExplicit = dtb__419; f_CliOpts_optMaxErrors = dtb__420; f_CliOpts_optContinueOnError = dtb__421; f_CliOpts_optSarifItems = dtb__422; f_CliOpts_optRelease = dtb__423; f_CliOpts_optShowCascade = dtb__424; f_CliOpts_optWithSources = dtb__425; f_CliOpts_optFailFast = dtb__426; f_CliOpts_optTarget = dtb__427; f_CliOpts_optWasmOpt = dtb__428 } -> dtb__426
  | _ -> failwith "DT: impossible branch"
))

# 88 "Vuna/Compiler/Driver/CompilerCli.vuna"
let v_optTarget = (fun (p : t_CliOpts) -> (match p with
  | { f_CliOpts_optDiagFormat = dtb__429; f_CliOpts_optDiagLang = dtb__430; f_CliOpts_optLangExplicit = dtb__431; f_CliOpts_optDenyWarnings = dtb__432; f_CliOpts_optShowWarnings = dtb__433; f_CliOpts_optFormatExplicit = dtb__434; f_CliOpts_optWarningsExplicit = dtb__435; f_CliOpts_optDenyExplicit = dtb__436; f_CliOpts_optMaxErrors = dtb__437; f_CliOpts_optContinueOnError = dtb__438; f_CliOpts_optSarifItems = dtb__439; f_CliOpts_optRelease = dtb__440; f_CliOpts_optShowCascade = dtb__441; f_CliOpts_optWithSources = dtb__442; f_CliOpts_optFailFast = dtb__443; f_CliOpts_optTarget = dtb__444; f_CliOpts_optWasmOpt = dtb__445 } -> dtb__444
  | _ -> failwith "DT: impossible branch"
))

# 89 "Vuna/Compiler/Driver/CompilerCli.vuna"
let v_optWasmOpt = (fun (p : t_CliOpts) -> (match p with
  | { f_CliOpts_optDiagFormat = dtb__446; f_CliOpts_optDiagLang = dtb__447; f_CliOpts_optLangExplicit = dtb__448; f_CliOpts_optDenyWarnings = dtb__449; f_CliOpts_optShowWarnings = dtb__450; f_CliOpts_optFormatExplicit = dtb__451; f_CliOpts_optWarningsExplicit = dtb__452; f_CliOpts_optDenyExplicit = dtb__453; f_CliOpts_optMaxErrors = dtb__454; f_CliOpts_optContinueOnError = dtb__455; f_CliOpts_optSarifItems = dtb__456; f_CliOpts_optRelease = dtb__457; f_CliOpts_optShowCascade = dtb__458; f_CliOpts_optWithSources = dtb__459; f_CliOpts_optFailFast = dtb__460; f_CliOpts_optTarget = dtb__461; f_CliOpts_optWasmOpt = dtb__462 } -> dtb__462
  | _ -> failwith "DT: impossible branch"
))
