open Vuna_runtime
type t_CliOpts = { f_CliOpts_optDiagFormat : string; f_CliOpts_optDiagLang : string; f_CliOpts_optLangExplicit : bool; f_CliOpts_optDenyWarnings : bool; f_CliOpts_optShowWarnings : bool; f_CliOpts_optFormatExplicit : bool; f_CliOpts_optWarningsExplicit : bool; f_CliOpts_optDenyExplicit : bool; f_CliOpts_optMaxErrors : int; f_CliOpts_optContinueOnError : bool; f_CliOpts_optSarifItems : Base_dDiag.t_Diagnostic B_dData_dList.t_List; f_CliOpts_optRelease : bool; f_CliOpts_optShowCascade : bool; f_CliOpts_optWithSources : bool; f_CliOpts_optFailFast : bool; f_CliOpts_optTarget : string; f_CliOpts_optWasmOpt : int; f_CliOpts_optExplain : bool }

# 43 "Vuna/Compiler/Driver/CompilerCli.vuna"
let v_compilerUsageLines = (fun (prog : string) -> (String.concat "" ["  "; prog; " compile [--no-print] [--release] [--target ocaml|wasm|native] (<entry.vuna> | <package-dir>) <out-dir>\n  "; prog; " check [--release] [--continue-on-error] (<file.vuna> | <package-dir>)\n  <file.vuna>            \229\184\166 module \229\164\180\230\151\182\230\140\137\229\186\147\230\168\161\229\157\151\230\163\128\230\159\165\239\188\136\229\140\133\228\184\138\228\184\139\230\150\135\239\188\137\239\188\140\229\144\166\229\136\153\230\140\137\229\133\165\229\143\163\230\150\135\228\187\182\n  "; prog; " build [--release] [--no-compile] [--out DIR] [--package NAME] [--target ocaml|wasm|native] [--wasm-opt N] [DIR]\n  --no-print             \231\188\150\232\175\145\231\148\159\230\136\144\231\154\132\231\168\139\229\186\143\228\184\141\230\137\147\229\141\176 main \231\187\147\230\158\156\239\188\136\233\187\152\232\174\164\230\137\147\229\141\176\239\188\137\n  --release              \229\143\145\229\184\131\230\158\132\229\187\186\239\188\154\230\139\146\231\187\157 assert / todo \231\173\137\232\176\131\232\175\149\228\184\147\231\148\168\230\158\132\233\128\160\n  --wasm-opt N           wasm \228\186\167\231\137\169\231\154\132 binaryen \228\188\152\229\140\150\231\186\167\229\136\171\239\188\1360\226\128\1473\239\188\140\233\187\152\232\174\164 3\239\188\1550 = \228\184\141\228\188\152\229\140\150\239\188\137\n  --continue-on-error    \229\164\154\233\148\153\232\175\175\239\188\154\233\128\144\228\184\170\229\174\154\228\185\137\230\148\182\233\155\134\239\188\136\229\164\177\232\180\165\229\174\154\228\185\137\229\155\158\230\187\154\229\144\142\232\183\179\232\191\135\239\188\155\228\187\133\229\133\165\229\143\163\230\150\135\228\187\182\230\136\150\229\186\147\229\140\133\239\188\137\n  "; prog; " version, --version  \230\152\190\231\164\186\231\137\136\230\156\172\n  "; prog; " help, -h\n"]))

# 56 "Vuna/Compiler/Driver/CompilerCli.vuna"
let v_compilerUsage = (fun (prog : string) -> ("usage:\n" ^ (v_compilerUsageLines prog)))

# 60 "Vuna/Compiler/Driver/CompilerCli.vuna"
let rec v_mapEff = (fun mc0 mc1 -> (match mc1 with
  | B_dData_dList.C_List__x58__x58_ (dtb__0, dtb__1) -> (((fun e k -> Obj.repr ((fun (u : B_dEffect_dCore.t_EffUnit) -> (let dtb__2 = Obj.obj (e) in (let dtb__3 = Obj.obj ((k (dtb__2 u))) in (dtb__3 u)))))) (mc0 dtb__0)) (fun y -> (((fun e k -> Obj.repr ((fun (u : B_dEffect_dCore.t_EffUnit) -> (let dtb__4 = Obj.obj (e) in (let dtb__5 = Obj.obj ((k (dtb__4 u))) in (dtb__5 u)))))) ((v_mapEff mc0) dtb__1)) (fun ys -> (let x = (B_dData_dList.C_List__x58__x58_ (y, ys)) in Obj.repr ((fun (_u : B_dEffect_dCore.t_EffUnit) -> x)))))))
  | B_dData_dList.C_List_Nil -> (let x = B_dData_dList.C_List_Nil in Obj.repr ((fun (_u : B_dEffect_dCore.t_EffUnit) -> x)))
  | _ -> failwith "DT: impossible branch"
))

# 93 "Vuna/Compiler/Driver/CompilerCli.vuna"
let v_defaultCliOpts = { f_CliOpts_optDiagFormat = "short"; f_CliOpts_optDiagLang = "en"; f_CliOpts_optLangExplicit = false; f_CliOpts_optDenyWarnings = false; f_CliOpts_optShowWarnings = false; f_CliOpts_optFormatExplicit = false; f_CliOpts_optWarningsExplicit = false; f_CliOpts_optDenyExplicit = false; f_CliOpts_optMaxErrors = 20; f_CliOpts_optContinueOnError = false; f_CliOpts_optSarifItems = B_dData_dList.C_List_Nil; f_CliOpts_optRelease = false; f_CliOpts_optShowCascade = false; f_CliOpts_optWithSources = false; f_CliOpts_optFailFast = false; f_CliOpts_optTarget = "ocaml"; f_CliOpts_optWasmOpt = 3; f_CliOpts_optExplain = false }

# 116 "Vuna/Compiler/Driver/CompilerCli.vuna"
let v_markRelease = (fun (o : t_CliOpts) -> { o with f_CliOpts_optRelease = true })

# 120 "Vuna/Compiler/Driver/CompilerCli.vuna"
let v_markExplain = (fun (o : t_CliOpts) -> { o with f_CliOpts_optExplain = true })

# 124 "Vuna/Compiler/Driver/CompilerCli.vuna"
let v_markWasmOpt = (fun (n : int) (o : t_CliOpts) -> { o with f_CliOpts_optWasmOpt = n })

# 128 "Vuna/Compiler/Driver/CompilerCli.vuna"
let v_markTarget = (fun (t : string) (o : t_CliOpts) -> { f_CliOpts_optDiagFormat = (o).f_CliOpts_optDiagFormat; f_CliOpts_optDiagLang = (o).f_CliOpts_optDiagLang; f_CliOpts_optLangExplicit = (o).f_CliOpts_optLangExplicit; f_CliOpts_optDenyWarnings = (o).f_CliOpts_optDenyWarnings; f_CliOpts_optShowWarnings = (o).f_CliOpts_optShowWarnings; f_CliOpts_optFormatExplicit = (o).f_CliOpts_optFormatExplicit; f_CliOpts_optWarningsExplicit = (o).f_CliOpts_optWarningsExplicit; f_CliOpts_optDenyExplicit = (o).f_CliOpts_optDenyExplicit; f_CliOpts_optMaxErrors = (o).f_CliOpts_optMaxErrors; f_CliOpts_optContinueOnError = (o).f_CliOpts_optContinueOnError; f_CliOpts_optSarifItems = (o).f_CliOpts_optSarifItems; f_CliOpts_optRelease = (o).f_CliOpts_optRelease; f_CliOpts_optShowCascade = (o).f_CliOpts_optShowCascade; f_CliOpts_optWithSources = (o).f_CliOpts_optWithSources; f_CliOpts_optFailFast = (o).f_CliOpts_optFailFast; f_CliOpts_optTarget = t; f_CliOpts_optWasmOpt = (o).f_CliOpts_optWasmOpt; f_CliOpts_optExplain = (o).f_CliOpts_optExplain })

# 152 "Vuna/Compiler/Driver/CompilerCli.vuna"
let v_markFormatExplicit = (fun (o : t_CliOpts) -> { f_CliOpts_optDiagFormat = (o).f_CliOpts_optDiagFormat; f_CliOpts_optDiagLang = (o).f_CliOpts_optDiagLang; f_CliOpts_optLangExplicit = (o).f_CliOpts_optLangExplicit; f_CliOpts_optDenyWarnings = (o).f_CliOpts_optDenyWarnings; f_CliOpts_optShowWarnings = (o).f_CliOpts_optShowWarnings; f_CliOpts_optFormatExplicit = true; f_CliOpts_optWarningsExplicit = (o).f_CliOpts_optWarningsExplicit; f_CliOpts_optDenyExplicit = (o).f_CliOpts_optDenyExplicit; f_CliOpts_optMaxErrors = (o).f_CliOpts_optMaxErrors; f_CliOpts_optContinueOnError = (o).f_CliOpts_optContinueOnError; f_CliOpts_optSarifItems = (o).f_CliOpts_optSarifItems; f_CliOpts_optRelease = (o).f_CliOpts_optRelease; f_CliOpts_optShowCascade = (o).f_CliOpts_optShowCascade; f_CliOpts_optWithSources = (o).f_CliOpts_optWithSources; f_CliOpts_optFailFast = (o).f_CliOpts_optFailFast; f_CliOpts_optTarget = (o).f_CliOpts_optTarget; f_CliOpts_optWasmOpt = (o).f_CliOpts_optWasmOpt; f_CliOpts_optExplain = (o).f_CliOpts_optExplain })

# 175 "Vuna/Compiler/Driver/CompilerCli.vuna"
let v_withOpts = (fun (o : t_CliOpts) (m : int B_dEffect_dCore.t_Eff) -> (((fun e k -> Obj.repr ((fun (u : B_dEffect_dCore.t_EffUnit) -> (let dtb__6 = Obj.obj (e) in (let dtb__7 = Obj.obj ((k (dtb__6 u))) in (dtb__7 u)))))) m) (fun code -> (let x = { B_dData_dPair.f_Pair_first = code; B_dData_dPair.f_Pair_second = o } in Obj.repr ((fun (_u : B_dEffect_dCore.t_EffUnit) -> x))))))

# 181 "Vuna/Compiler/Driver/CompilerCli.vuna"
let v_diagExitFor = (fun (d : Base_dDiag.t_Diagnostic) -> (if (d).Base_dDiag.f_Diagnostic_diagInternal then 70 else (match (d).Base_dDiag.f_Diagnostic_diagSeverity with
  | Base_dDiag.C_Severity_SevError -> 1
  | _ -> 0
)))

# 217 "Vuna/Compiler/Driver/CompilerCli.vuna"
let v_applyManifestOpts = (fun (mc0 : Frontend_dPackages_dPkg.t_Package B_dData_dMaybe.t_Maybe) (mc1 : t_CliOpts) -> (match mc0 with
  | B_dData_dMaybe.C_Maybe_Just (dtb__8) -> (let man = (dtb__8).Frontend_dPackages_dPkg.f_Package_packageManifest in (let fmt0 = (match (man).Frontend_dManifest.f_Manifest_manifestDiagFormat with
  | B_dData_dMaybe.C_Maybe_Just (dtb__13) -> dtb__13
  | B_dData_dMaybe.C_Maybe_Nothing -> (mc1).f_CliOpts_optDiagFormat
  | _ -> failwith "DT: impossible branch"
) in (let lang = (if (mc1).f_CliOpts_optLangExplicit then (mc1).f_CliOpts_optDiagLang else (match (man).Frontend_dManifest.f_Manifest_manifestDiagLang with
  | B_dData_dMaybe.C_Maybe_Just (dtb__12) -> dtb__12
  | B_dData_dMaybe.C_Maybe_Nothing -> (mc1).f_CliOpts_optDiagLang
  | _ -> failwith "DT: impossible branch"
)) in (let fmt = (if (mc1).f_CliOpts_optFormatExplicit then (mc1).f_CliOpts_optDiagFormat else (if (lang = "en") then fmt0 else (if (((B_dTrait_dEq.v__x61__x61_ (B_dData_dMaybe.v_Eq_u018fc178ff3df1b4_uBase_x36_46_x36_Data_x36_46_x36_Maybe_x36_46_x36_Maybe_ua B_dData_dString.v_Eq_u018fc178ff3df1b4_uString)) (man).Frontend_dManifest.f_Manifest_manifestDiagFormat) B_dData_dMaybe.C_Maybe_Nothing) then "human" else fmt0))) in (let showW = (if (mc1).f_CliOpts_optWarningsExplicit then (mc1).f_CliOpts_optShowWarnings else (match (man).Frontend_dManifest.f_Manifest_manifestDiagWarnings with
  | B_dData_dMaybe.C_Maybe_Just (dtb__11) -> dtb__11
  | B_dData_dMaybe.C_Maybe_Nothing -> (mc1).f_CliOpts_optShowWarnings
  | _ -> failwith "DT: impossible branch"
)) in (let deny = (if (mc1).f_CliOpts_optDenyExplicit then (mc1).f_CliOpts_optDenyWarnings else (match (man).Frontend_dManifest.f_Manifest_manifestDiagDenyWarnings with
  | B_dData_dMaybe.C_Maybe_Just (dtb__10) -> dtb__10
  | B_dData_dMaybe.C_Maybe_Nothing -> (mc1).f_CliOpts_optDenyWarnings
  | _ -> failwith "DT: impossible branch"
)) in (let showW2 = (if deny then true else showW) in (let maxE = (match (man).Frontend_dManifest.f_Manifest_manifestDiagMaxErrors with
  | B_dData_dMaybe.C_Maybe_Just (dtb__9) -> dtb__9
  | B_dData_dMaybe.C_Maybe_Nothing -> (mc1).f_CliOpts_optMaxErrors
  | _ -> failwith "DT: impossible branch"
) in { f_CliOpts_optDiagFormat = fmt; f_CliOpts_optDiagLang = lang; f_CliOpts_optLangExplicit = (mc1).f_CliOpts_optLangExplicit; f_CliOpts_optDenyWarnings = deny; f_CliOpts_optShowWarnings = showW2; f_CliOpts_optFormatExplicit = (mc1).f_CliOpts_optFormatExplicit; f_CliOpts_optWarningsExplicit = (mc1).f_CliOpts_optWarningsExplicit; f_CliOpts_optDenyExplicit = (mc1).f_CliOpts_optDenyExplicit; f_CliOpts_optMaxErrors = maxE; f_CliOpts_optContinueOnError = (mc1).f_CliOpts_optContinueOnError; f_CliOpts_optSarifItems = (mc1).f_CliOpts_optSarifItems; f_CliOpts_optRelease = (mc1).f_CliOpts_optRelease; f_CliOpts_optShowCascade = (mc1).f_CliOpts_optShowCascade; f_CliOpts_optWithSources = (mc1).f_CliOpts_optWithSources; f_CliOpts_optFailFast = (mc1).f_CliOpts_optFailFast; f_CliOpts_optTarget = (mc1).f_CliOpts_optTarget; f_CliOpts_optWasmOpt = (mc1).f_CliOpts_optWasmOpt; f_CliOpts_optExplain = (mc1).f_CliOpts_optExplain }))))))))
  | B_dData_dMaybe.C_Maybe_Nothing -> mc1
  | _ -> failwith "DT: impossible branch"
))

# 214 "Vuna/Compiler/Driver/CompilerCli.vuna"
let v_applyDiagConfig = (fun (m : Frontend_dPackages_dPkg.t_Package B_dData_dMaybe.t_Maybe) (o : t_CliOpts) -> ((v_applyManifestOpts m) o))

# 279 "Vuna/Compiler/Driver/CompilerCli.vuna"
let v_maxErrorsOf = (fun (o : t_CliOpts) -> (if (o).f_CliOpts_optFailFast then 1 else (o).f_CliOpts_optMaxErrors))

# 287 "Vuna/Compiler/Driver/CompilerCli.vuna"
let[@tail_mod_cons] rec v_takeDiagsGo = (fun (mc0 : int) (mc1 : Base_dDiag.t_Diagnostic B_dData_dList.t_List) -> (match mc1 with
  | B_dData_dList.C_List__x58__x58_ (dtb__14, dtb__15) -> (if (mc0 <= 0) then B_dData_dList.C_List_Nil else (B_dData_dList.C_List__x58__x58_ (dtb__14, ((v_takeDiagsGo (mc0 - 1)) dtb__15))))
  | B_dData_dList.C_List_Nil -> B_dData_dList.C_List_Nil
  | _ -> failwith "DT: impossible branch"
))

# 283 "Vuna/Compiler/Driver/CompilerCli.vuna"
let v_takeDiags = (fun (n : int) (ds : Base_dDiag.t_Diagnostic B_dData_dList.t_List) -> (if (n <= 0) then ds else ((v_takeDiagsGo n) ds)))

# 292 "Vuna/Compiler/Driver/CompilerCli.vuna"
let[@tail_mod_cons] rec v_stripDenyWarnings = (fun (mc0 : string B_dData_dList.t_List) -> (match mc0 with
  | B_dData_dList.C_List__x58__x58_ (dtb__16, dtb__17) -> (if (if (if (dtb__16 = "--deny-warnings") then true else (dtb__16 = "--warnings")) then true else (dtb__16 = "-W")) then (v_stripDenyWarnings dtb__17) else (B_dData_dList.C_List__x58__x58_ (dtb__16, (v_stripDenyWarnings dtb__17))))
  | B_dData_dList.C_List_Nil -> B_dData_dList.C_List_Nil
  | _ -> failwith "DT: impossible branch"
))

# 301 "Vuna/Compiler/Driver/CompilerCli.vuna"
let rec v_hasDenyWarnings = (fun (mc0 : string B_dData_dList.t_List) -> (match mc0 with
  | B_dData_dList.C_List__x58__x58_ (dtb__18, dtb__19) -> (if (dtb__18 = "--deny-warnings") then true else (v_hasDenyWarnings dtb__19))
  | B_dData_dList.C_List_Nil -> false
  | _ -> failwith "DT: impossible branch"
))

# 306 "Vuna/Compiler/Driver/CompilerCli.vuna"
let rec v_hasShowCascade = (fun (mc0 : string B_dData_dList.t_List) -> (match mc0 with
  | B_dData_dList.C_List__x58__x58_ (dtb__20, dtb__21) -> (if (dtb__20 = "--show-cascade") then true else (v_hasShowCascade dtb__21))
  | B_dData_dList.C_List_Nil -> false
  | _ -> failwith "DT: impossible branch"
))

# 310 "Vuna/Compiler/Driver/CompilerCli.vuna"
let[@tail_mod_cons] rec v_stripShowCascade = (fun (mc0 : string B_dData_dList.t_List) -> (match mc0 with
  | B_dData_dList.C_List__x58__x58_ (dtb__22, dtb__23) -> (if (dtb__22 = "--show-cascade") then (v_stripShowCascade dtb__23) else (B_dData_dList.C_List__x58__x58_ (dtb__22, (v_stripShowCascade dtb__23))))
  | B_dData_dList.C_List_Nil -> B_dData_dList.C_List_Nil
  | _ -> failwith "DT: impossible branch"
))

# 315 "Vuna/Compiler/Driver/CompilerCli.vuna"
let rec v_hasWithSources = (fun (mc0 : string B_dData_dList.t_List) -> (match mc0 with
  | B_dData_dList.C_List__x58__x58_ (dtb__24, dtb__25) -> (if (dtb__24 = "--with-sources") then true else (v_hasWithSources dtb__25))
  | B_dData_dList.C_List_Nil -> false
  | _ -> failwith "DT: impossible branch"
))

# 319 "Vuna/Compiler/Driver/CompilerCli.vuna"
let rec v_hasFailFast = (fun (mc0 : string B_dData_dList.t_List) -> (match mc0 with
  | B_dData_dList.C_List__x58__x58_ (dtb__26, dtb__27) -> (if (dtb__26 = "--fail-fast") then true else (v_hasFailFast dtb__27))
  | B_dData_dList.C_List_Nil -> false
  | _ -> failwith "DT: impossible branch"
))

# 323 "Vuna/Compiler/Driver/CompilerCli.vuna"
let[@tail_mod_cons] rec v_stripFailFast = (fun (mc0 : string B_dData_dList.t_List) -> (match mc0 with
  | B_dData_dList.C_List__x58__x58_ (dtb__28, dtb__29) -> (if (dtb__28 = "--fail-fast") then (v_stripFailFast dtb__29) else (B_dData_dList.C_List__x58__x58_ (dtb__28, (v_stripFailFast dtb__29))))
  | B_dData_dList.C_List_Nil -> B_dData_dList.C_List_Nil
  | _ -> failwith "DT: impossible branch"
))

# 328 "Vuna/Compiler/Driver/CompilerCli.vuna"
let[@tail_mod_cons] rec v_stripWithSources = (fun (mc0 : string B_dData_dList.t_List) -> (match mc0 with
  | B_dData_dList.C_List__x58__x58_ (dtb__30, dtb__31) -> (if (dtb__30 = "--with-sources") then (v_stripWithSources dtb__31) else (B_dData_dList.C_List__x58__x58_ (dtb__30, (v_stripWithSources dtb__31))))
  | B_dData_dList.C_List_Nil -> B_dData_dList.C_List_Nil
  | _ -> failwith "DT: impossible branch"
))

# 347 "Vuna/Compiler/Driver/CompilerCli.vuna"
let rec v_memStr = (fun (mc0 : string) (mc1 : string B_dData_dList.t_List) -> (match mc1 with
  | B_dData_dList.C_List__x58__x58_ (dtb__32, dtb__33) -> (if (mc0 = dtb__32) then true else ((v_memStr mc0) dtb__33))
  | B_dData_dList.C_List_Nil -> false
  | _ -> failwith "DT: impossible branch"
))

# 338 "Vuna/Compiler/Driver/CompilerCli.vuna"
let rec v_labelFiles = (fun (mc0 : Base_dDiag.t_Label B_dData_dList.t_List) (mc1 : string B_dData_dList.t_List) -> (match mc0 with
  | B_dData_dList.C_List__x58__x58_ (dtb__34, dtb__35) -> ((v_labelFiles dtb__35) (match (dtb__34).Base_dDiag.f_Label_labelSpan with
  | B_dData_dMaybe.C_Maybe_Nothing -> mc1
  | B_dData_dMaybe.C_Maybe_Just (dtb__36) -> (if (if ((dtb__36).Base_dSource.f_Span_spanFile = "") then true else ((v_memStr (dtb__36).Base_dSource.f_Span_spanFile) mc1)) then mc1 else (B_dData_dList.C_List__x58__x58_ ((dtb__36).Base_dSource.f_Span_spanFile, mc1)))
  | _ -> failwith "DT: impossible branch"
))
  | B_dData_dList.C_List_Nil -> mc1
  | _ -> failwith "DT: impossible branch"
))

# 334 "Vuna/Compiler/Driver/CompilerCli.vuna"
let rec v_collectLabelFiles = (fun (mc0 : Base_dDiag.t_Diagnostic B_dData_dList.t_List) (mc1 : string B_dData_dList.t_List) -> (match mc0 with
  | B_dData_dList.C_List__x58__x58_ (dtb__37, dtb__38) -> ((v_collectLabelFiles dtb__38) ((v_labelFiles (dtb__37).Base_dDiag.f_Diagnostic_diagLabels) mc1))
  | B_dData_dList.C_List_Nil -> mc1
  | _ -> failwith "DT: impossible branch"
))

# 352 "Vuna/Compiler/Driver/CompilerCli.vuna"
let rec v_lastSlashGo = (fun (mc0 : int B_dData_dList.t_List) (mc1 : int) (mc2 : int) -> (match mc0 with
  | B_dData_dList.C_List__x58__x58_ (dtb__39, dtb__40) -> (((v_lastSlashGo dtb__40) (mc1 + 1)) (if (dtb__39 = 47) then mc1 else mc2))
  | B_dData_dList.C_List_Nil -> mc2
  | _ -> failwith "DT: impossible branch"
))

# 356 "Vuna/Compiler/Driver/CompilerCli.vuna"
let v_lastSlashIndexOf = (fun (s : string) -> (((v_lastSlashGo (B_dData_dList.dtp_unpack s)) 0) (0 - 1)))

# 359 "Vuna/Compiler/Driver/CompilerCli.vuna"
let v_dirOf = (fun (path : string) -> (let n = (v_lastSlashIndexOf path) in (if (n < 0) then "." else (if (n = 0) then "/" else (((B_dData_dString.v_substring 0) (bi_natFromInt n)) path)))))

# 365 "Vuna/Compiler/Driver/CompilerCli.vuna"
let v_stripPathPrefix = (fun (base : string) (file : string) -> (if ((B_dData_dString.v_startsWith (base ^ "/")) file) then (((B_dData_dString.v_substring (bi_natFromInt ((String.length base) + 1))) (bi_natFromInt (((String.length file) - (String.length base)) - 1))) file) else file))

# 378 "Vuna/Compiler/Driver/CompilerCli.vuna"
let rec v_splitSlashGo = (fun (mc0 : int B_dData_dList.t_List) (mc1 : int B_dData_dList.t_List) (mc2 : string B_dData_dList.t_List) -> (match mc0 with
  | B_dData_dList.C_List__x58__x58_ (dtb__41, dtb__42) -> (if (dtb__41 = 47) then (((v_splitSlashGo dtb__42) B_dData_dList.C_List_Nil) (B_dData_dList.C_List__x58__x58_ ((B_dData_dList.dtp_pack (B_dData_dList.v_reverse mc1)), mc2))) else (((v_splitSlashGo dtb__42) (B_dData_dList.C_List__x58__x58_ (dtb__41, mc1))) mc2))
  | B_dData_dList.C_List_Nil -> (B_dData_dList.v_reverse (B_dData_dList.C_List__x58__x58_ ((B_dData_dList.dtp_pack (B_dData_dList.v_reverse mc1)), mc2)))
  | _ -> failwith "DT: impossible branch"
))

# 375 "Vuna/Compiler/Driver/CompilerCli.vuna"
let v_splitSlash = (fun (s : string) -> (((v_splitSlashGo (B_dData_dList.dtp_unpack s)) B_dData_dList.C_List_Nil) B_dData_dList.C_List_Nil))

# 386 "Vuna/Compiler/Driver/CompilerCli.vuna"
let v_moduleOfRel = (fun (rel : string) -> (let rel1 = (if ((B_dData_dString.v_startsWith "lib/") rel) then (((B_dData_dString.v_substring (bi_natFromInt 4)) (bi_natFromInt ((String.length rel) - 4))) rel) else (if ((B_dData_dString.v_startsWith "app/") rel) then (((B_dData_dString.v_substring (bi_natFromInt 4)) (bi_natFromInt ((String.length rel) - 4))) rel) else rel)) in (let rel2 = (if ((B_dData_dString.v_endsWith ".vuna") rel1) then (((B_dData_dString.v_substring 0) (bi_natFromInt ((String.length rel1) - 5))) rel1) else rel1) in ((B_dData_dString.v_join ".") (v_splitSlash rel2)))))

# 400 "Vuna/Compiler/Driver/CompilerCli.vuna"
let rec v_findPkgRootGo = (fun (nFs : string) (fuel : int) (dir : string) -> (if (fuel <= 0) then (let x = { B_dData_dPair.f_Pair_first = ""; B_dData_dPair.f_Pair_second = "" } in Obj.repr ((fun (_u : B_dEffect_dCore.t_EffUnit) -> x))) else (let candidate = (if (dir = "/") then "/vuna.toml" else (dir ^ "/vuna.toml")) in (((fun e k -> Obj.repr ((fun (u : B_dEffect_dCore.t_EffUnit) -> (let dtb__43 = Obj.obj (e) in (let dtb__44 = Obj.obj ((k (dtb__43 u))) in (dtb__44 u)))))) ((B_dEffect_dFs.v_fsFileExists nFs) candidate)) (fun exists -> (if exists then (((fun e k -> Obj.repr ((fun (u : B_dEffect_dCore.t_EffUnit) -> (let dtb__45 = Obj.obj (e) in (let dtb__46 = Obj.obj ((k (dtb__45 u))) in (dtb__46 u)))))) ((B_dEffect_dFs.v_fsReadFile nFs) candidate)) (fun text -> (let name = (match ((Frontend_dManifest.v_parseManifest candidate) text) with
  | Base_dDiag.C_Check_OkC (dtb__47) -> (match (dtb__47).Frontend_dManifest.f_Manifest_manifestName with
  | B_dData_dMaybe.C_Maybe_Nothing -> ""
  | B_dData_dMaybe.C_Maybe_Just (dtb__48) -> dtb__48
  | _ -> failwith "DT: impossible branch"
)
  | Base_dDiag.C_Check_ErrC (dtb__49) -> ""
  | _ -> failwith "DT: impossible branch"
) in (let x = { B_dData_dPair.f_Pair_first = dir; B_dData_dPair.f_Pair_second = name } in Obj.repr ((fun (_u : B_dEffect_dCore.t_EffUnit) -> x)))))) else (if (if (dir = "/") then true else (dir = ".")) then (let x = { B_dData_dPair.f_Pair_first = ""; B_dData_dPair.f_Pair_second = "" } in Obj.repr ((fun (_u : B_dEffect_dCore.t_EffUnit) -> x))) else (((v_findPkgRootGo nFs) (fuel - 1)) (v_dirOf dir)))))))))

# 423 "Vuna/Compiler/Driver/CompilerCli.vuna"
let v_sourceRefEff = (fun (nFs : string) (nEnv : string) (file : string) -> (((fun e k -> Obj.repr ((fun (u : B_dEffect_dCore.t_EffUnit) -> (let dtb__50 = Obj.obj (e) in (let dtb__51 = Obj.obj ((k (dtb__50 u))) in (dtb__51 u)))))) ((Frontend_dPackages_dPkg.v_absolutePath nEnv) file)) (fun abs -> (((fun e k -> Obj.repr ((fun (u : B_dEffect_dCore.t_EffUnit) -> (let dtb__52 = Obj.obj (e) in (let dtb__53 = Obj.obj ((k (dtb__52 u))) in (dtb__53 u)))))) ((B_dEffect_dFs.v_fsFileExists nFs) abs)) (fun exists -> (((fun e k -> Obj.repr ((fun (u : B_dEffect_dCore.t_EffUnit) -> (let dtb__54 = Obj.obj (e) in (let dtb__55 = Obj.obj ((k (dtb__54 u))) in (dtb__55 u)))))) (if exists then (((fun e k -> Obj.repr ((fun (u : B_dEffect_dCore.t_EffUnit) -> (let dtb__56 = Obj.obj (e) in (let dtb__57 = Obj.obj ((k (dtb__56 u))) in (dtb__57 u)))))) ((B_dEffect_dFs.v_fsReadFile nFs) abs)) (fun text -> (let x = (string_of_int (Loader_dFingerprint.v_textHashOf text)) in Obj.repr ((fun (_u : B_dEffect_dCore.t_EffUnit) -> x))))) else (let x = "" in Obj.repr ((fun (_u : B_dEffect_dCore.t_EffUnit) -> x))))) (fun digest -> (((fun e k -> Obj.repr ((fun (u : B_dEffect_dCore.t_EffUnit) -> (let dtb__58 = Obj.obj (e) in (let dtb__59 = Obj.obj ((k (dtb__58 u))) in (dtb__59 u)))))) (((v_findPkgRootGo nFs) 12) (v_dirOf abs))) (fun root -> (let pkgDir = (B_dData_dPair.v_firstOf root) in (let pkgName = (B_dData_dPair.v_secondOf root) in (let rel = (if (pkgDir = "") then file else ((v_stripPathPrefix pkgDir) abs)) in (let x = { Base_dDiag_dFormat.f_SourceRef_srcFile = file; Base_dDiag_dFormat.f_SourceRef_srcDigest = digest; Base_dDiag_dFormat.f_SourceRef_srcPackage = pkgName; Base_dDiag_dFormat.f_SourceRef_srcModule = (v_moduleOfRel rel); Base_dDiag_dFormat.f_SourceRef_srcRelPath = rel } in Obj.repr ((fun (_u : B_dEffect_dCore.t_EffUnit) -> x)))))))))))))))

# 442 "Vuna/Compiler/Driver/CompilerCli.vuna"
let rec v_sourcePairsEff = (fun (nFs : string) (nEnv : string) (mc0 : string B_dData_dList.t_List) -> (match mc0 with
  | B_dData_dList.C_List__x58__x58_ (dtb__60, dtb__61) -> (((fun e k -> Obj.repr ((fun (u : B_dEffect_dCore.t_EffUnit) -> (let dtb__62 = Obj.obj (e) in (let dtb__63 = Obj.obj ((k (dtb__62 u))) in (dtb__63 u)))))) (((v_sourcePairsEff nFs) nEnv) dtb__61)) (fun more -> (((fun e k -> Obj.repr ((fun (u : B_dEffect_dCore.t_EffUnit) -> (let dtb__64 = Obj.obj (e) in (let dtb__65 = Obj.obj ((k (dtb__64 u))) in (dtb__65 u)))))) (((v_sourceRefEff nFs) nEnv) dtb__60)) (fun ref -> (let x = (B_dData_dList.C_List__x58__x58_ (ref, more)) in Obj.repr ((fun (_u : B_dEffect_dCore.t_EffUnit) -> x)))))))
  | B_dData_dList.C_List_Nil -> (let x = B_dData_dList.C_List_Nil in Obj.repr ((fun (_u : B_dEffect_dCore.t_EffUnit) -> x)))
  | _ -> failwith "DT: impossible branch"
))

# 191 "Vuna/Compiler/Driver/CompilerCli.vuna"
let v_flushSarif = (fun (nFs : string) (nConsole : string) (nEnv : string) (code : int) (o : t_CliOpts) -> (let shown = ((v_takeDiags (o).f_CliOpts_optMaxErrors) (o).f_CliOpts_optSarifItems) in (if ((o).f_CliOpts_optDiagFormat = "sarif") then (((fun e k -> Obj.repr ((fun (u : B_dEffect_dCore.t_EffUnit) -> (let dtb__66 = Obj.obj (e) in (let dtb__67 = Obj.obj ((k (dtb__66 u))) in (dtb__67 u)))))) ((B_dEffect_dConsole.v_consolePrint nConsole) ((Base_dDiag_dFormat.v_renderSarif shown) ^ "\n"))) (fun _u -> (let x = code in Obj.repr ((fun (_u : B_dEffect_dCore.t_EffUnit) -> x))))) else (if ((o).f_CliOpts_optDiagFormat = "json") then (if (o).f_CliOpts_optWithSources then (((fun e k -> Obj.repr ((fun (u : B_dEffect_dCore.t_EffUnit) -> (let dtb__68 = Obj.obj (e) in (let dtb__69 = Obj.obj ((k (dtb__68 u))) in (dtb__69 u)))))) (((v_sourcePairsEff nFs) nEnv) (B_dData_dList.v_reverse ((v_collectLabelFiles shown) B_dData_dList.C_List_Nil)))) (fun sources -> (((fun e k -> Obj.repr ((fun (u : B_dEffect_dCore.t_EffUnit) -> (let dtb__70 = Obj.obj (e) in (let dtb__71 = Obj.obj ((k (dtb__70 u))) in (dtb__71 u)))))) ((B_dEffect_dConsole.v_consolePrint nConsole) ((((Base_dDiag_dFormat.v_renderJsonListWithSources (o).f_CliOpts_optDiagLang) shown) sources) ^ "\n"))) (fun _u -> (let x = code in Obj.repr ((fun (_u : B_dEffect_dCore.t_EffUnit) -> x))))))) else (((fun e k -> Obj.repr ((fun (u : B_dEffect_dCore.t_EffUnit) -> (let dtb__72 = Obj.obj (e) in (let dtb__73 = Obj.obj ((k (dtb__72 u))) in (dtb__73 u)))))) ((B_dEffect_dConsole.v_consolePrint nConsole) (((Base_dDiag_dFormat.v_renderJsonList (o).f_CliOpts_optDiagLang) shown) ^ "\n"))) (fun _u -> (let x = code in Obj.repr ((fun (_u : B_dEffect_dCore.t_EffUnit) -> x)))))) else (let x = code in Obj.repr ((fun (_u : B_dEffect_dCore.t_EffUnit) -> x)))))))

# 450 "Vuna/Compiler/Driver/CompilerCli.vuna"
let v_isCascadeDiag = (fun (d : Base_dDiag.t_Diagnostic) -> (match (d).Base_dDiag.f_Diagnostic_diagOrigin with
  | Base_dDiag.C_Origin_OriginCascade (dtb__74) -> true
  | Base_dDiag.C_Origin_OriginDirect -> false
  | _ -> failwith "DT: impossible branch"
))

# 457 "Vuna/Compiler/Driver/CompilerCli.vuna"
let v_isTextDiagFormat = (fun (f : string) -> (if (f = "short") then true else (f = "human")))

# 460 "Vuna/Compiler/Driver/CompilerCli.vuna"
let v_visibleDiags = (fun (o : t_CliOpts) (ds : Base_dDiag.t_Diagnostic B_dData_dList.t_List) -> (if (if (o).f_CliOpts_optShowCascade then true else (B_dData_dBool.v_not (v_isTextDiagFormat (o).f_CliOpts_optDiagFormat))) then ds else (let kept = ((B_dData_dList.v_filter (fun (d : Base_dDiag.t_Diagnostic) -> (B_dData_dBool.v_not (v_isCascadeDiag d)))) ds) in (if (if ((B_dData_dList.v_length kept) = 0) then ((B_dData_dList.v_length ds) > 0) else false) then ds else kept))))

# 470 "Vuna/Compiler/Driver/CompilerCli.vuna"
let rec v_hasShowWarnings = (fun (mc0 : string B_dData_dList.t_List) -> (match mc0 with
  | B_dData_dList.C_List__x58__x58_ (dtb__75, dtb__76) -> (if (if (dtb__75 = "--warnings") then true else (dtb__75 = "-W")) then true else (v_hasShowWarnings dtb__76))
  | B_dData_dList.C_List_Nil -> false
  | _ -> failwith "DT: impossible branch"
))

# 476 "Vuna/Compiler/Driver/CompilerCli.vuna"
let rec v_hasFormatFlag = (fun (mc0 : string B_dData_dList.t_List) -> (match mc0 with
  | B_dData_dList.C_List__x58__x58_ (dtb__77, dtb__78) -> (if (if (if (dtb__77 = "--json") then true else ((B_dData_dString.v_startsWith "--error-format") dtb__77)) then true else ((B_dData_dString.v_startsWith "--message-format") dtb__77)) then true else (v_hasFormatFlag dtb__78))
  | B_dData_dList.C_List_Nil -> false
  | _ -> failwith "DT: impossible branch"
))

# 489 "Vuna/Compiler/Driver/CompilerCli.vuna"
let rec v_stripDiagFormatGo = (fun (mc0 : string B_dData_dList.t_List) (mc1 : string B_dData_dList.t_List) (mc2 : string B_dData_dMaybe.t_Maybe) -> (match mc0 with
  | B_dData_dList.C_List__x58__x58_ (dtb__79, dtb__80) -> (if (dtb__79 = "--json") then (((v_stripDiagFormatGo dtb__80) mc1) (B_dData_dMaybe.C_Maybe_Just ("json"))) else (if (dtb__79 = "--error-format") then (match dtb__80 with
  | B_dData_dList.C_List__x58__x58_ (dtb__81, dtb__82) -> (((v_stripDiagFormatGo dtb__82) mc1) (B_dData_dMaybe.C_Maybe_Just (dtb__81)))
  | B_dData_dList.C_List_Nil -> { B_dData_dPair.f_Pair_first = (B_dData_dList.v_reverse mc1); B_dData_dPair.f_Pair_second = (B_dData_dMaybe.C_Maybe_Just ("short")) }
  | _ -> failwith "DT: impossible branch"
) else (if ((B_dData_dString.v_startsWith "--error-format=") dtb__79) then (((v_stripDiagFormatGo dtb__80) mc1) (B_dData_dMaybe.C_Maybe_Just ((((B_dData_dString.v_substring (bi_natFromInt 15)) (bi_natFromInt ((String.length dtb__79) - 15))) dtb__79)))) else (if ((B_dData_dString.v_startsWith "--message-format=") dtb__79) then (((v_stripDiagFormatGo dtb__80) mc1) (B_dData_dMaybe.C_Maybe_Just ((((B_dData_dString.v_substring (bi_natFromInt 17)) (bi_natFromInt ((String.length dtb__79) - 17))) dtb__79)))) else (((v_stripDiagFormatGo dtb__80) (B_dData_dList.C_List__x58__x58_ (dtb__79, mc1))) mc2)))))
  | B_dData_dList.C_List_Nil -> { B_dData_dPair.f_Pair_first = (B_dData_dList.v_reverse mc1); B_dData_dPair.f_Pair_second = mc2 }
  | _ -> failwith "DT: impossible branch"
))

# 485 "Vuna/Compiler/Driver/CompilerCli.vuna"
let v_stripDiagFormat = (fun (args : string B_dData_dList.t_List) -> (((v_stripDiagFormatGo args) B_dData_dList.C_List_Nil) B_dData_dMaybe.C_Maybe_Nothing))

# 542 "Vuna/Compiler/Driver/CompilerCli.vuna"
let rec v_parseIntChars = (fun (mc0 : int B_dData_dList.t_List) (mc1 : int) (mc2 : int) (mc3 : int) -> (match mc0 with
  | B_dData_dList.C_List__x58__x58_ (dtb__83, dtb__84) -> (if (if (dtb__83 >= 48) then (dtb__83 <= 57) else false) then ((((v_parseIntChars dtb__84) ((mc1 * 10) + (dtb__83 - 48))) (mc2 + 1)) mc3) else (if (mc2 = 0) then mc3 else mc1))
  | B_dData_dList.C_List_Nil -> (if (mc2 = 0) then mc3 else mc1)
  | _ -> failwith "DT: impossible branch"
))

# 538 "Vuna/Compiler/Driver/CompilerCli.vuna"
let v_parseIntOr = (fun (s : string) (fallback : int) -> ((((v_parseIntChars (B_dData_dList.dtp_unpack s)) 0) 0) fallback))

# 550 "Vuna/Compiler/Driver/CompilerCli.vuna"
let v_parseWasmOptLevel = (fun (s : string) -> (let n = ((v_parseIntOr s) (0 - 1)) in (if (if (n >= 0) then (n <= 3) else false) then (B_dData_dMaybe.C_Maybe_Just (n)) else B_dData_dMaybe.C_Maybe_Nothing)))

# 561 "Vuna/Compiler/Driver/CompilerCli.vuna"
let rec v_stripMaxErrorsGo = (fun (mc0 : string B_dData_dList.t_List) (mc1 : string B_dData_dList.t_List) (mc2 : int) -> (match mc0 with
  | B_dData_dList.C_List__x58__x58_ (dtb__85, dtb__86) -> (if (dtb__85 = "--max-errors") then (match dtb__86 with
  | B_dData_dList.C_List__x58__x58_ (dtb__87, dtb__88) -> (((v_stripMaxErrorsGo dtb__88) mc1) ((v_parseIntOr dtb__87) mc2))
  | B_dData_dList.C_List_Nil -> { B_dData_dPair.f_Pair_first = (B_dData_dList.v_reverse mc1); B_dData_dPair.f_Pair_second = mc2 }
  | _ -> failwith "DT: impossible branch"
) else (if ((B_dData_dString.v_startsWith "--max-errors=") dtb__85) then (((v_stripMaxErrorsGo dtb__86) mc1) ((v_parseIntOr (((B_dData_dString.v_substring (bi_natFromInt 13)) (bi_natFromInt ((String.length dtb__85) - 13))) dtb__85)) mc2)) else (((v_stripMaxErrorsGo dtb__86) (B_dData_dList.C_List__x58__x58_ (dtb__85, mc1))) mc2)))
  | B_dData_dList.C_List_Nil -> { B_dData_dPair.f_Pair_first = (B_dData_dList.v_reverse mc1); B_dData_dPair.f_Pair_second = mc2 }
  | _ -> failwith "DT: impossible branch"
))

# 557 "Vuna/Compiler/Driver/CompilerCli.vuna"
let v_stripMaxErrors = (fun (args : string B_dData_dList.t_List) -> (((v_stripMaxErrorsGo args) B_dData_dList.C_List_Nil) 20))

# 597 "Vuna/Compiler/Driver/CompilerCli.vuna"
let v_printVersion = (fun (nConsole : string) (_u : int) -> (((fun e k -> Obj.repr ((fun (u : B_dEffect_dCore.t_EffUnit) -> (let dtb__89 = Obj.obj (e) in (let dtb__90 = Obj.obj ((k (dtb__89 u))) in (dtb__90 u)))))) ((B_dEffect_dConsole.v_consolePrint nConsole) (String.concat "" ["vuna-compiler "; Base_dVersion.v_vunaVersion; "\n"]))) (fun _u -> (let x = 0 in Obj.repr ((fun (_u : B_dEffect_dCore.t_EffUnit) -> x))))))

# 604 "Vuna/Compiler/Driver/CompilerCli.vuna"
let rec v_anyHelp = (fun (mc0 : string B_dData_dList.t_List) -> (match mc0 with
  | B_dData_dList.C_List__x58__x58_ (dtb__91, dtb__92) -> (if (if (dtb__91 = "-h") then true else (dtb__91 = "--help")) then true else (v_anyHelp dtb__92))
  | B_dData_dList.C_List_Nil -> false
  | _ -> failwith "DT: impossible branch"
))

# 609 "Vuna/Compiler/Driver/CompilerCli.vuna"
let v_helpFor = (fun (nConsole : string) (prog : string) -> (((fun e k -> Obj.repr ((fun (u : B_dEffect_dCore.t_EffUnit) -> (let dtb__93 = Obj.obj (e) in (let dtb__94 = Obj.obj ((k (dtb__93 u))) in (dtb__94 u)))))) ((B_dEffect_dConsole.v_consolePrint nConsole) (v_compilerUsage prog))) (fun _u -> (let x = 0 in Obj.repr ((fun (_u : B_dEffect_dCore.t_EffUnit) -> x))))))

# 616 "Vuna/Compiler/Driver/CompilerCli.vuna"
let v_usageErr = (fun (nConsole : string) (prog : string) -> (((fun e k -> Obj.repr ((fun (u : B_dEffect_dCore.t_EffUnit) -> (let dtb__95 = Obj.obj (e) in (let dtb__96 = Obj.obj ((k (dtb__95 u))) in (dtb__96 u)))))) ((B_dEffect_dConsole.v_consolePrint nConsole) (v_compilerUsage prog))) (fun _u -> (let x = 2 in Obj.repr ((fun (_u : B_dEffect_dCore.t_EffUnit) -> x))))))

# 623 "Vuna/Compiler/Driver/CompilerCli.vuna"
let v_unknownCommand = (fun (nConsole : string) (prog : string) (arg : string) -> (((fun e k -> Obj.repr ((fun (u : B_dEffect_dCore.t_EffUnit) -> (let dtb__97 = Obj.obj (e) in (let dtb__98 = Obj.obj ((k (dtb__97 u))) in (dtb__98 u)))))) ((B_dEffect_dConsole.v_consolePrint nConsole) (String.concat "" ["error: unknown command "; arg; "\nrun "; prog; " help for the command list\n"]))) (fun _u -> (let x = 2 in Obj.repr ((fun (_u : B_dEffect_dCore.t_EffUnit) -> x))))))

# 629 "Vuna/Compiler/Driver/CompilerCli.vuna"
let v_removedCommand = (fun (nConsole : string) (prog : string) (cmd : string) (hint : string) -> (((fun e k -> Obj.repr ((fun (u : B_dEffect_dCore.t_EffUnit) -> (let dtb__99 = Obj.obj (e) in (let dtb__100 = Obj.obj ((k (dtb__99 u))) in (dtb__100 u)))))) ((B_dEffect_dConsole.v_consolePrint nConsole) (String.concat "" ["error: "; cmd; " has been removed; "; hint; "\n"]))) (fun _u -> (let x = 2 in Obj.repr ((fun (_u : B_dEffect_dCore.t_EffUnit) -> x))))))

# 637 "Vuna/Compiler/Driver/CompilerCli.vuna"
let v_dashFlag = (fun (name : string) -> ("--" ^ name))

# 640 "Vuna/Compiler/Driver/CompilerCli.vuna"
let v_removedFlagHint = (fun (flag : string) -> (if (flag = (v_dashFlag "dt")) then (B_dData_dMaybe.C_Maybe_Just ("DT is the only path; drop the flag")) else (if (flag = (v_dashFlag "package")) then (B_dData_dMaybe.C_Maybe_Just ("use build or compile")) else (if (flag = (v_dashFlag "split")) then (B_dData_dMaybe.C_Maybe_Just ("split is the only output model; use build --out OUT [DIR] or compile <pkg-dir> OUT")) else (if (flag = (v_dashFlag "root")) then (B_dData_dMaybe.C_Maybe_Just ("module resolution is decided by the nearest vuna.toml; set VUNA_BASE for standalone files")) else (if (flag = (v_dashFlag "out")) then (B_dData_dMaybe.C_Maybe_Just ("pass OUTDIR positionally to compile; build accepts --out DIR")) else (if (flag = (v_dashFlag "no-typecheck")) then (B_dData_dMaybe.C_Maybe_Just ("checking is always enabled")) else (if (flag = (v_dashFlag "typecheck")) then (B_dData_dMaybe.C_Maybe_Just ("checking is always enabled")) else (if (flag = (v_dashFlag "typed")) then (B_dData_dMaybe.C_Maybe_Just ("DT is the only path")) else B_dData_dMaybe.C_Maybe_Nothing)))))))))

# 659 "Vuna/Compiler/Driver/CompilerCli.vuna"
let v_removedFlag = (fun (nConsole : string) (prog : string) (flag : string) -> (match (v_removedFlagHint flag) with
  | B_dData_dMaybe.C_Maybe_Nothing -> ((v_usageErr nConsole) prog)
  | B_dData_dMaybe.C_Maybe_Just (dtb__101) -> (((fun e k -> Obj.repr ((fun (u : B_dEffect_dCore.t_EffUnit) -> (let dtb__102 = Obj.obj (e) in (let dtb__103 = Obj.obj ((k (dtb__102 u))) in (dtb__103 u)))))) ((B_dEffect_dConsole.v_consolePrint nConsole) (String.concat "" ["error: "; flag; " has been removed; "; dtb__101; "\n"]))) (fun _u -> (let x = 2 in Obj.repr ((fun (_u : B_dEffect_dCore.t_EffUnit) -> x)))))
  | _ -> failwith "DT: impossible branch"
))

# 671 "Vuna/Compiler/Driver/CompilerCli.vuna"
let v_printErrText = (fun (nConsole : string) (e : string) -> (((fun e k -> Obj.repr ((fun (u : B_dEffect_dCore.t_EffUnit) -> (let dtb__104 = Obj.obj (e) in (let dtb__105 = Obj.obj ((k (dtb__104 u))) in (dtb__105 u)))))) ((B_dEffect_dConsole.v_consolePrint nConsole) e)) (fun _u -> (let x = 1 in Obj.repr ((fun (_u : B_dEffect_dCore.t_EffUnit) -> x))))))

# 678 "Vuna/Compiler/Driver/CompilerCli.vuna"
let v_severityLabelOf = (fun (d : Base_dDiag.t_Diagnostic) -> (match (d).Base_dDiag.f_Diagnostic_diagSeverity with
  | Base_dDiag.C_Severity_SevError -> "error"
  | Base_dDiag.C_Severity_SevWarning -> "warning"
  | Base_dDiag.C_Severity_SevNote -> "note"
  | Base_dDiag.C_Severity_SevHelp -> "help"
  | _ -> failwith "DT: impossible branch"
))

# 711 "Vuna/Compiler/Driver/CompilerCli.vuna"
let v_collectSarifIn = (fun (o : t_CliOpts) (d : Base_dDiag.t_Diagnostic) -> { o with f_CliOpts_optSarifItems = ((B_dData_dList.v_append (o).f_CliOpts_optSarifItems) (B_dData_dList.C_List__x58__x58_ (d, B_dData_dList.C_List_Nil))) })

# 687 "Vuna/Compiler/Driver/CompilerCli.vuna"
let v_emitDiag = (fun (nFs : string) (nConsole : string) (o : t_CliOpts) (extra : string) (d : Base_dDiag.t_Diagnostic) -> (if ((o).f_CliOpts_optDiagFormat = "json") then (let x = { B_dData_dPair.f_Pair_first = (v_diagExitFor d); B_dData_dPair.f_Pair_second = ((v_collectSarifIn o) d) } in Obj.repr ((fun (_u : B_dEffect_dCore.t_EffUnit) -> x))) else (if ((o).f_CliOpts_optDiagFormat = "human") then (((fun e k -> Obj.repr ((fun (u : B_dEffect_dCore.t_EffUnit) -> (let dtb__106 = Obj.obj (e) in (let dtb__107 = Obj.obj ((k (dtb__106 u))) in (dtb__107 u)))))) (((Base_dDiag_dFormat.v_renderHuman nFs) (o).f_CliOpts_optDiagLang) d)) (fun msg -> (((fun e k -> Obj.repr ((fun (u : B_dEffect_dCore.t_EffUnit) -> (let dtb__108 = Obj.obj (e) in (let dtb__109 = Obj.obj ((k (dtb__108 u))) in (dtb__109 u)))))) ((v_printErrText nConsole) (msg ^ "\n"))) (fun _u -> (let x = { B_dData_dPair.f_Pair_first = (v_diagExitFor d); B_dData_dPair.f_Pair_second = o } in Obj.repr ((fun (_u : B_dEffect_dCore.t_EffUnit) -> x))))))) else (if ((o).f_CliOpts_optDiagFormat = "sarif") then (let x = { B_dData_dPair.f_Pair_first = (v_diagExitFor d); B_dData_dPair.f_Pair_second = ((v_collectSarifIn o) d) } in Obj.repr ((fun (_u : B_dEffect_dCore.t_EffUnit) -> x))) else (if ((o).f_CliOpts_optDiagFormat = "github") then (((fun e k -> Obj.repr ((fun (u : B_dEffect_dCore.t_EffUnit) -> (let dtb__110 = Obj.obj (e) in (let dtb__111 = Obj.obj ((k (dtb__110 u))) in (dtb__111 u)))))) ((v_printErrText nConsole) ((Base_dDiag_dFormat.v_renderGithub d) ^ "\n"))) (fun _u -> (let x = { B_dData_dPair.f_Pair_first = (v_diagExitFor d); B_dData_dPair.f_Pair_second = o } in Obj.repr ((fun (_u : B_dEffect_dCore.t_EffUnit) -> x))))) else (((fun e k -> Obj.repr ((fun (u : B_dEffect_dCore.t_EffUnit) -> (let dtb__112 = Obj.obj (e) in (let dtb__113 = Obj.obj ((k (dtb__112 u))) in (dtb__113 u)))))) ((Base_dDiag_dFormat.v_renderShortSnippetEff nFs) d)) (fun snippet -> (((fun e k -> Obj.repr ((fun (u : B_dEffect_dCore.t_EffUnit) -> (let dtb__114 = Obj.obj (e) in (let dtb__115 = Obj.obj ((k (dtb__114 u))) in (dtb__115 u)))))) ((v_printErrText nConsole) (String.concat "" [(v_severityLabelOf d); ": "; extra; (Base_dDiag_dFormat.v_renderShort d); snippet; (Base_dDiag_dFormat.v_callFieldSuffix (d).Base_dDiag.f_Diagnostic_diagFields); "\n"]))) (fun _u -> (let x = { B_dData_dPair.f_Pair_first = (v_diagExitFor d); B_dData_dPair.f_Pair_second = o } in Obj.repr ((fun (_u : B_dEffect_dCore.t_EffUnit) -> x))))))))))))

# 718 "Vuna/Compiler/Driver/CompilerCli.vuna"
let rec v_emitDiagSeq = (fun (nFs : string) (nConsole : string) (mc0 : t_CliOpts) (mc1 : string) (mc2 : Base_dDiag.t_Diagnostic B_dData_dList.t_List) -> (match mc2 with
  | B_dData_dList.C_List__x58__x58_ (dtb__116, dtb__117) -> (((fun e k -> Obj.repr ((fun (u : B_dEffect_dCore.t_EffUnit) -> (let dtb__118 = Obj.obj (e) in (let dtb__119 = Obj.obj ((k (dtb__118 u))) in (dtb__119 u)))))) (((((v_emitDiag nFs) nConsole) mc0) mc1) dtb__116)) (fun r -> (((((v_emitDiagSeq nFs) nConsole) (B_dData_dPair.v_secondOf r)) mc1) dtb__117)))
  | B_dData_dList.C_List_Nil -> (let x = mc0 in Obj.repr ((fun (_u : B_dEffect_dCore.t_EffUnit) -> x)))
  | _ -> failwith "DT: impossible branch"
))

# 715 "Vuna/Compiler/Driver/CompilerCli.vuna"
let v_emitDiagRevSeq = (fun (nFs : string) (nConsole : string) (o : t_CliOpts) (extra : string) (ds : Base_dDiag.t_Diagnostic B_dData_dList.t_List) -> (((((v_emitDiagSeq nFs) nConsole) o) extra) (B_dData_dList.v_reverse ds)))

# 725 "Vuna/Compiler/Driver/CompilerCli.vuna"
let v_printDiagWithPrefix = (fun (nFs : string) (nConsole : string) (o : t_CliOpts) (extra : string) (d : Base_dDiag.t_Diagnostic) -> (match (d).Base_dDiag.f_Diagnostic_diagChildren with
  | B_dData_dList.C_List_Nil -> (((((v_emitDiag nFs) nConsole) o) extra) d)
  | _ -> (let shown = ((v_takeDiags (v_maxErrorsOf o)) (B_dData_dList.C_List__x58__x58_ (d, ((v_visibleDiags o) (d).Base_dDiag.f_Diagnostic_diagChildren)))) in (((fun e k -> Obj.repr ((fun (u : B_dEffect_dCore.t_EffUnit) -> (let dtb__120 = Obj.obj (e) in (let dtb__121 = Obj.obj ((k (dtb__120 u))) in (dtb__121 u)))))) (((((v_emitDiagRevSeq nFs) nConsole) o) extra) shown)) (fun o1 -> (let x = { B_dData_dPair.f_Pair_first = (v_diagExitFor d); B_dData_dPair.f_Pair_second = o1 } in Obj.repr ((fun (_u : B_dEffect_dCore.t_EffUnit) -> x))))))
))

# 737 "Vuna/Compiler/Driver/CompilerCli.vuna"
let v_printDiag = (fun (nFs : string) (nConsole : string) (o : t_CliOpts) (d : Base_dDiag.t_Diagnostic) -> (((((v_printDiagWithPrefix nFs) nConsole) o) "") d))

# 741 "Vuna/Compiler/Driver/CompilerCli.vuna"
let v_printErr = (fun (nConsole : string) (e : string) -> ((v_printErrText nConsole) (String.concat "" ["error: "; e; "\n"])))

# 745 "Vuna/Compiler/Driver/CompilerCli.vuna"
let v_printDiagList = (fun (nFs : string) (nConsole : string) (o : t_CliOpts) (extra : string) (ds : Base_dDiag.t_Diagnostic B_dData_dList.t_List) -> (let shown = ((v_takeDiags (v_maxErrorsOf o)) ((v_visibleDiags o) ds)) in (((fun e k -> Obj.repr ((fun (u : B_dEffect_dCore.t_EffUnit) -> (let dtb__122 = Obj.obj (e) in (let dtb__123 = Obj.obj ((k (dtb__122 u))) in (dtb__123 u)))))) (((((v_emitDiagRevSeq nFs) nConsole) o) extra) shown)) (fun o1 -> (let x = { B_dData_dPair.f_Pair_first = 0; B_dData_dPair.f_Pair_second = o1 } in Obj.repr ((fun (_u : B_dEffect_dCore.t_EffUnit) -> x)))))))

# 753 "Vuna/Compiler/Driver/CompilerCli.vuna"
let v_defaultDir = (fun (mc0 : string B_dData_dMaybe.t_Maybe) -> (match mc0 with
  | B_dData_dMaybe.C_Maybe_Nothing -> "."
  | B_dData_dMaybe.C_Maybe_Just (dtb__124) -> dtb__124
  | _ -> failwith "DT: impossible branch"
))

# 760 "Vuna/Compiler/Driver/CompilerCli.vuna"
let v_dtPathErr = (fun (nConsole : string) (path : string) -> ((v_printErr nConsole) ("no such file or package directory: " ^ path)))

# 775 "Vuna/Compiler/Driver/CompilerCli.vuna"
let v_executablePackageAt = (fun (nFs : string) (nEnv : string) (label : string) (dir : string) -> (((fun e k -> Obj.repr ((fun (u : B_dEffect_dCore.t_EffUnit) -> (let dtb__125 = Obj.obj (e) in (let dtb__126 = Obj.obj ((k (dtb__125 u))) in (dtb__126 u)))))) (((Frontend_dPackages_dPkg.v_loadPackage nFs) nEnv) dir)) (fun pkgR -> (match pkgR with
  | Base_dDiag.C_Check_ErrC (dtb__127) -> (let x = (Base_dDiag.C_Check_ErrC (dtb__127)) in Obj.repr ((fun (_u : B_dEffect_dCore.t_EffUnit) -> x)))
  | Base_dDiag.C_Check_OkC (dtb__128) -> (((fun e k -> Obj.repr ((fun (u : B_dEffect_dCore.t_EffUnit) -> (let dtb__129 = Obj.obj (e) in (let dtb__130 = Obj.obj ((k (dtb__129 u))) in (dtb__130 u)))))) ((B_dEffect_dFs.v_fsFileExists nFs) (Frontend_dPackages_dPkg.v_packageEntry dtb__128))) (fun exists -> (if exists then (let x = (Base_dDiag.C_Check_OkC (dtb__128)) in Obj.repr ((fun (_u : B_dEffect_dCore.t_EffUnit) -> x))) else (let x = (Base_dDiag.v_err (String.concat "" [label; ": library package "; (Frontend_dPackages_dPkg.v_packageName dtb__128); " has no app/Main.vuna (an executable package is required)"])) in Obj.repr ((fun (_u : B_dEffect_dCore.t_EffUnit) -> x))))))
  | _ -> failwith "DT: impossible branch"
))))

# 764 "Vuna/Compiler/Driver/CompilerCli.vuna"
let v_executablePackage = (fun (nFs : string) (nEnv : string) (label : string) (dir : string) -> (((fun e k -> Obj.repr ((fun (u : B_dEffect_dCore.t_EffUnit) -> (let dtb__131 = Obj.obj (e) in (let dtb__132 = Obj.obj ((k (dtb__131 u))) in (dtb__132 u)))))) ((B_dEffect_dFs.v_fsFileExists nFs) dir)) (fun exists -> (if exists then (((fun e k -> Obj.repr ((fun (u : B_dEffect_dCore.t_EffUnit) -> (let dtb__133 = Obj.obj (e) in (let dtb__134 = Obj.obj ((k (dtb__133 u))) in (dtb__134 u)))))) ((B_dEffect_dFs.v_fsIsDirectory nFs) dir)) (fun isDir -> (if isDir then ((((v_executablePackageAt nFs) nEnv) label) dir) else (let x = (Base_dDiag.v_err (String.concat "" [label; ": expected a package directory, not a file: "; dir])) in Obj.repr ((fun (_u : B_dEffect_dCore.t_EffUnit) -> x)))))) else (let x = (Base_dDiag.v_err ("no such file or package directory: " ^ dir)) in Obj.repr ((fun (_u : B_dEffect_dCore.t_EffUnit) -> x)))))))

# 817 "Vuna/Compiler/Driver/CompilerCli.vuna"
let v_isKnownTarget = (fun (t : string) -> (if (if (t = "ocaml") then true else (t = "wasm")) then true else (t = "native")))

# 839 "Vuna/Compiler/Driver/CompilerCli.vuna"
let v_compileToTarget = (fun (nFs : string) (nConsole : string) (nClock : string) (nEnv : string) (nProcess : string) (ctx : Frontend_dPackages_dPkg.t_PackageContext) (entry : string) (printResult : bool) (outDir : string) (target : string) -> (if (target = "ocaml") then (((fun e k -> Obj.repr ((fun (u : B_dEffect_dCore.t_EffUnit) -> (let dtb__135 = Obj.obj (e) in (let dtb__136 = Obj.obj ((k (dtb__135 u))) in (dtb__136 u)))))) (((((((((Driver_dCompile.v_compileToDir nFs) nConsole) nClock) nEnv) nProcess) ctx) entry) printResult) outDir)) (fun r -> (let x = (match r with
  | Base_dDiag.C_Check_ErrC (dtb__137) -> (Base_dDiag.C_Check_ErrC (dtb__137))
  | Base_dDiag.C_Check_OkC (dtb__138) -> (Base_dDiag.C_Check_OkC ({ B_dData_dPair.f_Pair_first = B_dData_dList.C_List_Nil; B_dData_dPair.f_Pair_second = (B_dData_dPair.v_secondOf dtb__138) }))
  | _ -> failwith "DT: impossible branch"
) in Obj.repr ((fun (_u : B_dEffect_dCore.t_EffUnit) -> x))))) else ((((((((Driver_dTarget.v_compileBackend nFs) nEnv) nProcess) ctx) target) entry) printResult) outDir)))

# 926 "Vuna/Compiler/Driver/CompilerCli.vuna"
let v_checkSpawnArgs = (fun (o : t_CliOpts) (dir : string) -> (let head0 = (if (o).f_CliOpts_optRelease then (B_dData_dList.C_List__x58__x58_ ("check", (B_dData_dList.C_List__x58__x58_ ("--release", B_dData_dList.C_List_Nil)))) else (B_dData_dList.C_List__x58__x58_ ("check", B_dData_dList.C_List_Nil))) in (let base = (if ((o).f_CliOpts_optDiagFormat = "short") then ((B_dData_dList.v_append head0) (B_dData_dList.C_List__x58__x58_ (dir, B_dData_dList.C_List_Nil))) else ((B_dData_dList.v_append head0) (B_dData_dList.C_List__x58__x58_ ("--error-format", (B_dData_dList.C_List__x58__x58_ ((o).f_CliOpts_optDiagFormat, (B_dData_dList.C_List__x58__x58_ (dir, B_dData_dList.C_List_Nil)))))))) in (let base2 = (if (o).f_CliOpts_optShowWarnings then ((B_dData_dList.v_append base) (B_dData_dList.C_List__x58__x58_ ("--warnings", B_dData_dList.C_List_Nil))) else base) in (let base3 = (if (o).f_CliOpts_optDenyWarnings then ((B_dData_dList.v_append base2) (B_dData_dList.C_List__x58__x58_ ("--deny-warnings", B_dData_dList.C_List_Nil))) else base2) in (let langArgs = (if (o).f_CliOpts_optLangExplicit then (B_dData_dList.C_List__x58__x58_ ("--lang", (B_dData_dList.C_List__x58__x58_ ((o).f_CliOpts_optDiagLang, B_dData_dList.C_List_Nil)))) else B_dData_dList.C_List_Nil) in (let cascadeArgs = (if (o).f_CliOpts_optShowCascade then (B_dData_dList.C_List__x58__x58_ ("--show-cascade", B_dData_dList.C_List_Nil)) else B_dData_dList.C_List_Nil) in (let sourceArgs = (if (o).f_CliOpts_optWithSources then (B_dData_dList.C_List__x58__x58_ ("--with-sources", B_dData_dList.C_List_Nil)) else B_dData_dList.C_List_Nil) in (let failFastArgs = (if (o).f_CliOpts_optFailFast then (B_dData_dList.C_List__x58__x58_ ("--fail-fast", B_dData_dList.C_List_Nil)) else B_dData_dList.C_List_Nil) in (let explainArgs = (if (o).f_CliOpts_optExplain then (B_dData_dList.C_List__x58__x58_ ("--explain", B_dData_dList.C_List_Nil)) else B_dData_dList.C_List_Nil) in (let maxArgs = (if ((o).f_CliOpts_optMaxErrors > 0) then (B_dData_dList.C_List__x58__x58_ ("--max-errors", (B_dData_dList.C_List__x58__x58_ ((string_of_int (o).f_CliOpts_optMaxErrors), B_dData_dList.C_List_Nil)))) else B_dData_dList.C_List_Nil) in ((B_dData_dList.v_append base3) ((B_dData_dList.v_append langArgs) ((B_dData_dList.v_append maxArgs) ((B_dData_dList.v_append cascadeArgs) ((B_dData_dList.v_append sourceArgs) ((B_dData_dList.v_append failFastArgs) explainArgs)))))))))))))))))

# 949 "Vuna/Compiler/Driver/CompilerCli.vuna"
let v_isMachineFormat = (fun (f : string) -> (if (f = "json") then true else (f = "sarif")))

# 1008 "Vuna/Compiler/Driver/CompilerCli.vuna"
let rec v_depsReadyList = (fun (mc0 : string B_dData_dList.t_List) (mc1 : string B_dData_dList.t_List) (mc2 : Frontend_dPackages_dPkg.t_Package B_dData_dList.t_List) -> (match mc2 with
  | B_dData_dList.C_List__x58__x58_ (dtb__139, dtb__140) -> (let isMember = ((B_dData_dList.v_memName (Frontend_dPackages_dPkg.v_packageName dtb__139)) mc0) in (let isDone = ((B_dData_dList.v_memName (Frontend_dPackages_dPkg.v_packageName dtb__139)) mc1) in (if (if (B_dData_dBool.v_not isMember) then true else isDone) then (((v_depsReadyList mc0) mc1) dtb__140) else false)))
  | B_dData_dList.C_List_Nil -> true
  | _ -> failwith "DT: impossible branch"
))

# 1005 "Vuna/Compiler/Driver/CompilerCli.vuna"
let v_depsReady = (fun (memberNames : string B_dData_dList.t_List) (done_ : string B_dData_dList.t_List) (pkg : Frontend_dPackages_dPkg.t_Package) -> (((v_depsReadyList memberNames) done_) (pkg).Frontend_dPackages_dPkg.f_Package_packageDependencies))

# 1041 "Vuna/Compiler/Driver/CompilerCli.vuna"
let v_isWorkspaceRoot = (fun (pkg : Frontend_dPackages_dPkg.t_Package) -> ((pkg).Frontend_dPackages_dPkg.f_Package_packageManifest).Frontend_dManifest.f_Manifest_manifestIsWorkspace)

# 1064 "Vuna/Compiler/Driver/CompilerCli.vuna"
let rec v_printExplainLines = (fun (nConsole : string) (mc0 : string B_dData_dList.t_List) -> (match mc0 with
  | B_dData_dList.C_List__x58__x58_ (dtb__141, dtb__142) -> (((fun e k -> Obj.repr ((fun (u : B_dEffect_dCore.t_EffUnit) -> (let dtb__143 = Obj.obj (e) in (let dtb__144 = Obj.obj ((k (dtb__143 u))) in (dtb__144 u)))))) ((B_dEffect_dConsole.v_consolePrint nConsole) (dtb__141 ^ "\n"))) (fun _u -> ((v_printExplainLines nConsole) dtb__142)))
  | B_dData_dList.C_List_Nil -> (let x = 0 in Obj.repr ((fun (_u : B_dEffect_dCore.t_EffUnit) -> x)))
  | _ -> failwith "DT: impossible branch"
))

# 1071 "Vuna/Compiler/Driver/CompilerCli.vuna"
let v_printExplainEff = (fun (nFs : string) (nConsole : string) (nClock : string) (nEnv : string) (nProcess : string) (pkg : Frontend_dPackages_dPkg.t_Package) -> (((fun e k -> Obj.repr ((fun (u : B_dEffect_dCore.t_EffUnit) -> (let dtb__145 = Obj.obj (e) in (let dtb__146 = Obj.obj ((k (dtb__145 u))) in (dtb__146 u)))))) (((((Driver_dCompile.v_explainPackageEff nFs) nClock) nEnv) nProcess) pkg)) (fun lines -> ((v_printExplainLines nConsole) lines))))

# 1094 "Vuna/Compiler/Driver/CompilerCli.vuna"
let rec v_countFailures = (fun (mc0 : int) (mc1 : int B_dData_dList.t_List) -> (match mc1 with
  | B_dData_dList.C_List__x58__x58_ (dtb__147, dtb__148) -> (if (dtb__147 = 0) then ((v_countFailures mc0) dtb__148) else ((v_countFailures 1) dtb__148))
  | B_dData_dList.C_List_Nil -> mc0
  | _ -> failwith "DT: impossible branch"
))

# 1017 "Vuna/Compiler/Driver/CompilerCli.vuna"
let v_checkMembersParallel = (fun (nFs : string) (nConsole : string) (nClock : string) (nEnv : string) (nProcess : string) (nExit : string) (nArgs : string) (mc0 : Frontend_dPackages_dPkg.t_Package B_dData_dList.t_List) (mc1 : int) (mc2 : t_CliOpts) -> (match mc0 with
  | B_dData_dList.C_List_Nil -> (let x = { B_dData_dPair.f_Pair_first = mc1; B_dData_dPair.f_Pair_second = mc2 } in Obj.repr ((fun (_u : B_dEffect_dCore.t_EffUnit) -> x)))
  | _ -> (((fun e k -> Obj.repr ((fun (u : B_dEffect_dCore.t_EffUnit) -> (let dtb__149 = Obj.obj (e) in (let dtb__150 = Obj.obj ((k (dtb__149 u))) in (dtb__150 u)))))) ((v_mapEff (fun (pkg : Frontend_dPackages_dPkg.t_Package) -> (((fun e k -> Obj.repr ((fun (u : B_dEffect_dCore.t_EffUnit) -> (let dtb__151 = Obj.obj (e) in (let dtb__152 = Obj.obj ((k (dtb__151 u))) in (dtb__152 u)))))) ((B_dEffect_dProcess.v_processSpawn nProcess) ((v_checkSpawnArgs mc2) (Frontend_dPackages_dPkg.v_packageDir pkg)))) (fun pid -> (let x = { B_dData_dPair.f_Pair_first = pkg; B_dData_dPair.f_Pair_second = pid } in Obj.repr ((fun (_u : B_dEffect_dCore.t_EffUnit) -> x))))))) mc0)) (fun started -> (((fun e k -> Obj.repr ((fun (u : B_dEffect_dCore.t_EffUnit) -> (let dtb__153 = Obj.obj (e) in (let dtb__154 = Obj.obj ((k (dtb__153 u))) in (dtb__154 u)))))) ((v_mapEff (fun (pr : (Frontend_dPackages_dPkg.t_Package, int) B_dData_dPair.t_Pair) -> ((B_dEffect_dProcess.v_processWait nProcess) (B_dData_dPair.v_secondOf pr)))) started)) (fun codes -> (let x = { B_dData_dPair.f_Pair_first = ((v_countFailures mc1) codes); B_dData_dPair.f_Pair_second = mc2 } in Obj.repr ((fun (_u : B_dEffect_dCore.t_EffUnit) -> x)))))))
))

# 987 "Vuna/Compiler/Driver/CompilerCli.vuna"
let rec v_checkMembersByLevel = (fun (nFs : string) (nConsole : string) (nClock : string) (nEnv : string) (nProcess : string) (nExit : string) (nArgs : string) (fuel : int) (pending : Frontend_dPackages_dPkg.t_Package B_dData_dList.t_List) (memberNames : string B_dData_dList.t_List) (done_ : string B_dData_dList.t_List) (code : int) (o : t_CliOpts) -> (if ((B_dData_dList.v_length pending) = 0) then (let x = { B_dData_dPair.f_Pair_first = code; B_dData_dPair.f_Pair_second = o } in Obj.repr ((fun (_u : B_dEffect_dCore.t_EffUnit) -> x))) else (if (fuel <= 0) then ((((((((((v_checkMembersParallel nFs) nConsole) nClock) nEnv) nProcess) nExit) nArgs) pending) code) o) else (let ready = ((B_dData_dList.v_filter (fun (p : Frontend_dPackages_dPkg.t_Package) -> (((v_depsReady memberNames) done_) p))) pending) in (let rest = ((B_dData_dList.v_filter (fun (p : Frontend_dPackages_dPkg.t_Package) -> (B_dData_dBool.v_not (((v_depsReady memberNames) done_) p)))) pending) in (if ((B_dData_dList.v_length ready) = 0) then ((((((((((v_checkMembersParallel nFs) nConsole) nClock) nEnv) nProcess) nExit) nArgs) pending) code) o) else (((fun e k -> Obj.repr ((fun (u : B_dEffect_dCore.t_EffUnit) -> (let dtb__155 = Obj.obj (e) in (let dtb__156 = Obj.obj ((k (dtb__155 u))) in (dtb__156 u)))))) ((((((((((v_checkMembersParallel nFs) nConsole) nClock) nEnv) nProcess) nExit) nArgs) ready) code) o)) (fun r -> (((((((((((((v_checkMembersByLevel nFs) nConsole) nClock) nEnv) nProcess) nExit) nArgs) (fuel - 1)) rest) memberNames) ((B_dData_dList.v_append done_) ((B_dData_dList.v_map Frontend_dPackages_dPkg.v_packageName) ready))) (B_dData_dPair.v_firstOf r)) (B_dData_dPair.v_secondOf r))))))))))

# 1251 "Vuna/Compiler/Driver/CompilerCli.vuna"
let v_workspaceMultiOut = (fun (workspace : Frontend_dPackages_dPkg.t_Workspace) -> (match (workspace).Frontend_dPackages_dPkg.f_Workspace_workspaceRoot with
  | B_dData_dMaybe.C_Maybe_Just (dtb__157) -> (v_isWorkspaceRoot dtb__157)
  | B_dData_dMaybe.C_Maybe_Nothing -> true
  | _ -> failwith "DT: impossible branch"
))

# 1259 "Vuna/Compiler/Driver/CompilerCli.vuna"
let v_isSingleLibraryPackage = (fun (nFs : string) (mc0 : Frontend_dPackages_dPkg.t_Package B_dData_dList.t_List) -> (match mc0 with
  | B_dData_dList.C_List__x58__x58_ (dtb__158, dtb__159) -> (match dtb__159 with
  | B_dData_dList.C_List_Nil -> (((fun e k -> Obj.repr ((fun (u : B_dEffect_dCore.t_EffUnit) -> (let dtb__160 = Obj.obj (e) in (let dtb__161 = Obj.obj ((k (dtb__160 u))) in (dtb__161 u)))))) ((B_dEffect_dFs.v_fsFileExists nFs) (Frontend_dPackages_dPkg.v_packageEntry dtb__158))) (fun exists -> (let x = (B_dData_dBool.v_not exists) in Obj.repr ((fun (_u : B_dEffect_dCore.t_EffUnit) -> x)))))
  | _ -> (let x = false in Obj.repr ((fun (_u : B_dEffect_dCore.t_EffUnit) -> x)))
)
  | _ -> (let x = false in Obj.repr ((fun (_u : B_dEffect_dCore.t_EffUnit) -> x)))
))

# 1266 "Vuna/Compiler/Driver/CompilerCli.vuna"
let v_libraryOnlyMessage = (fun (mc0 : Frontend_dPackages_dPkg.t_Package B_dData_dList.t_List) -> (match mc0 with
  | B_dData_dList.C_List_Nil -> "no package to build"
  | B_dData_dList.C_List__x58__x58_ (dtb__162, dtb__163) -> (String.concat "" ["library package "; (Frontend_dPackages_dPkg.v_packageName dtb__162); " has no app/Main.vuna (an executable package is required; use check for libraries)"])
  | _ -> failwith "DT: impossible branch"
))

# 1278 "Vuna/Compiler/Driver/CompilerCli.vuna"
let rec v_findPackageByName = (fun (mc0 : string) (mc1 : Frontend_dPackages_dPkg.t_Package B_dData_dList.t_List) -> (match mc1 with
  | B_dData_dList.C_List__x58__x58_ (dtb__164, dtb__165) -> (if ((Frontend_dPackages_dPkg.v_packageName dtb__164) = mc0) then (B_dData_dMaybe.C_Maybe_Just (dtb__164)) else ((v_findPackageByName mc0) dtb__165))
  | B_dData_dList.C_List_Nil -> B_dData_dMaybe.C_Maybe_Nothing
  | _ -> failwith "DT: impossible branch"
))

# 1271 "Vuna/Compiler/Driver/CompilerCli.vuna"
let v_selectBuildTargets = (fun (mc0 : string B_dData_dMaybe.t_Maybe) (mc1 : Frontend_dPackages_dPkg.t_Package B_dData_dList.t_List) -> (match mc0 with
  | B_dData_dMaybe.C_Maybe_Just (dtb__166) -> (match ((v_findPackageByName dtb__166) mc1) with
  | B_dData_dMaybe.C_Maybe_Nothing -> (Base_dDiag.v_err ("no such package in workspace: " ^ dtb__166))
  | B_dData_dMaybe.C_Maybe_Just (dtb__167) -> (Base_dDiag.C_Check_OkC ((B_dData_dList.C_List__x58__x58_ (dtb__167, B_dData_dList.C_List_Nil))))
  | _ -> failwith "DT: impossible branch"
)
  | B_dData_dMaybe.C_Maybe_Nothing -> (Base_dDiag.C_Check_OkC (mc1))
  | _ -> failwith "DT: impossible branch"
))

# 1295 "Vuna/Compiler/Driver/CompilerCli.vuna"
let v_buildNativeOne = (fun (nFs : string) (nConsole : string) (nEnv : string) (nProcess : string) (noCompile : bool) (multiOut : bool) (outM : string B_dData_dMaybe.t_Maybe) (pkg : Frontend_dPackages_dPkg.t_Package) (o : t_CliOpts) -> (let name = (Frontend_dPackages_dPkg.v_packageName pkg) in (let outDir = (match outM with
  | B_dData_dMaybe.C_Maybe_Just (dtb__184) -> (if multiOut then (String.concat "" [dtb__184; "/"; name]) else dtb__184)
  | B_dData_dMaybe.C_Maybe_Nothing -> ((Frontend_dPackages_dPkg.v_packageDir pkg) ^ "/.output")
  | _ -> failwith "DT: impossible branch"
) in (let scriptPath = (outDir ^ "/build.sh") in (let binDir = (outDir ^ "/bin") in (let binPath = (String.concat "" [binDir; "/"; name]) in (((fun e k -> Obj.repr ((fun (u : B_dEffect_dCore.t_EffUnit) -> (let dtb__168 = Obj.obj (e) in (let dtb__169 = Obj.obj ((k (dtb__168 u))) in (dtb__169 u)))))) ((((((((Driver_dTarget.v_compileBackend nFs) nEnv) nProcess) ((Frontend_dPackages_dPkg.v_contextWithRelease (o).f_CliOpts_optRelease) (Frontend_dPackages_dPkg.v_packageContext pkg))) "native") (Frontend_dPackages_dPkg.v_packageEntry pkg)) true) outDir)) (fun r -> (match r with
  | Base_dDiag.C_Check_ErrC (dtb__170) -> ((((v_printDiag nFs) nConsole) o) dtb__170)
  | Base_dDiag.C_Check_OkC (dtb__171) -> (let files = (B_dData_dPair.v_firstOf dtb__171) in (((fun e k -> Obj.repr ((fun (u : B_dEffect_dCore.t_EffUnit) -> (let dtb__172 = Obj.obj (e) in (let dtb__173 = Obj.obj ((k (dtb__172 u))) in (dtb__173 u)))))) (((B_dEffect_dFs.v_fsWriteFile nFs) scriptPath) ((Driver_dTargetBuild.v_nativeBuildScript name) files))) (fun _u -> (if noCompile then (((fun e k -> Obj.repr ((fun (u : B_dEffect_dCore.t_EffUnit) -> (let dtb__174 = Obj.obj (e) in (let dtb__175 = Obj.obj ((k (dtb__174 u))) in (dtb__175 u)))))) ((B_dEffect_dConsole.v_consolePrint nConsole) (String.concat "" ["wrote "; scriptPath; "\n"]))) (fun _u -> (let x = { B_dData_dPair.f_Pair_first = 0; B_dData_dPair.f_Pair_second = o } in Obj.repr ((fun (_u : B_dEffect_dCore.t_EffUnit) -> x))))) else (((fun e k -> Obj.repr ((fun (u : B_dEffect_dCore.t_EffUnit) -> (let dtb__176 = Obj.obj (e) in (let dtb__177 = Obj.obj ((k (dtb__176 u))) in (dtb__177 u)))))) (((Driver_dCompile.v_ensureDirPath nFs) nProcess) binDir)) (fun _u -> (((fun e k -> Obj.repr ((fun (u : B_dEffect_dCore.t_EffUnit) -> (let dtb__178 = Obj.obj (e) in (let dtb__179 = Obj.obj ((k (dtb__178 u))) in (dtb__179 u)))))) (((B_dEffect_dProcess.v_processRunIn nProcess) outDir) (B_dData_dList.C_List__x58__x58_ ("sh", (B_dData_dList.C_List__x58__x58_ ("build.sh", B_dData_dList.C_List_Nil)))))) (fun code -> (if (code = 0) then (((fun e k -> Obj.repr ((fun (u : B_dEffect_dCore.t_EffUnit) -> (let dtb__180 = Obj.obj (e) in (let dtb__181 = Obj.obj ((k (dtb__180 u))) in (dtb__181 u)))))) ((B_dEffect_dConsole.v_consolePrint nConsole) (String.concat "" ["wrote "; binPath; "\n"]))) (fun _u -> (let x = { B_dData_dPair.f_Pair_first = 0; B_dData_dPair.f_Pair_second = o } in Obj.repr ((fun (_u : B_dEffect_dCore.t_EffUnit) -> x))))) else (((fun e k -> Obj.repr ((fun (u : B_dEffect_dCore.t_EffUnit) -> (let dtb__182 = Obj.obj (e) in (let dtb__183 = Obj.obj ((k (dtb__182 u))) in (dtb__183 u)))))) ((B_dEffect_dConsole.v_consolePrint nConsole) (String.concat "" ["native link failed: cc exited "; (string_of_int code); "\n"]))) (fun _u -> (let x = { B_dData_dPair.f_Pair_first = 1; B_dData_dPair.f_Pair_second = o } in Obj.repr ((fun (_u : B_dEffect_dCore.t_EffUnit) -> x))))))))))))))
  | _ -> failwith "DT: impossible branch"
)))))))))

# 1387 "Vuna/Compiler/Driver/CompilerCli.vuna"
let v_wasmBuildScript = (fun (optLevel : int) -> (let assemble = "wasm-tools parse main.wat -o main.wasm\n" in (if (optLevel <= 0) then ("#!/bin/sh\nset -eu\ncd \"$(dirname \"$0\")\"\n" ^ assemble) else (let features = "--enable-gc --enable-bulk-memory --enable-tail-call --enable-reference-types" in (let level = (string_of_int optLevel) in (let optimize = (String.concat "" ["if ! wasm-opt "; features; " -g -O"; level; " main.wasm -o main.wasm.tmp 2>opt.log; then\n  cat opt.log >&2\n  rm -f opt.log main.wasm.tmp\n  exit 1\nfi\nrm -f opt.log\nmv main.wasm.tmp main.wasm\n"]) in (String.concat "" ["#!/bin/sh\nset -eu\ncd \"$(dirname \"$0\")\"\n"; assemble; optimize])))))))

# 1483 "Vuna/Compiler/Driver/CompilerCli.vuna"
let v_compileCodegen = (fun (nFs : string) (nConsole : string) (nClock : string) (nEnv : string) (nProcess : string) (ctx : Frontend_dPackages_dPkg.t_PackageContext) (entry : string) (outDir : string) (o : t_CliOpts) -> (((fun e k -> Obj.repr ((fun (u : B_dEffect_dCore.t_EffUnit) -> (let dtb__185 = Obj.obj (e) in (let dtb__186 = Obj.obj ((k (dtb__185 u))) in (dtb__186 u)))))) (((((((((Driver_dCompile.v_compileToDir nFs) nConsole) nClock) nEnv) nProcess) ctx) entry) true) outDir)) (fun r -> (match r with
  | Base_dDiag.C_Check_ErrC (dtb__187) -> ((((v_printDiag nFs) nConsole) o) dtb__187)
  | Base_dDiag.C_Check_OkC (dtb__188) -> (let x = { B_dData_dPair.f_Pair_first = 0; B_dData_dPair.f_Pair_second = o } in Obj.repr ((fun (_u : B_dEffect_dCore.t_EffUnit) -> x)))
  | _ -> failwith "DT: impossible branch"
))))

# 1493 "Vuna/Compiler/Driver/CompilerCli.vuna"
let v_buildLinked = (fun (nFs : string) (nConsole : string) (nEnv : string) (nProcess : string) (ctx : Frontend_dPackages_dPkg.t_PackageContext) (entry : string) (outDir : string) (name : string) (o : t_CliOpts) -> (((fun e k -> Obj.repr ((fun (u : B_dEffect_dCore.t_EffUnit) -> (let dtb__189 = Obj.obj (e) in (let dtb__190 = Obj.obj ((k (dtb__189 u))) in (dtb__190 u)))))) (((Driver_dCompile.v_ensureDirPath nFs) nProcess) (outDir ^ "/bin"))) (fun _u -> (((fun e k -> Obj.repr ((fun (u : B_dEffect_dCore.t_EffUnit) -> (let dtb__191 = Obj.obj (e) in (let dtb__192 = Obj.obj ((k (dtb__191 u))) in (dtb__192 u)))))) ((((Driver_dCompile.v_runBuildScript nProcess) outDir) ("bin/" ^ name)) name)) (fun r -> (match r with
  | Base_dDiag.C_Check_ErrC (dtb__193) -> ((((v_printDiag nFs) nConsole) o) dtb__193)
  | Base_dDiag.C_Check_OkC (dtb__194) -> (((fun e k -> Obj.repr ((fun (u : B_dEffect_dCore.t_EffUnit) -> (let dtb__195 = Obj.obj (e) in (let dtb__196 = Obj.obj ((k (dtb__195 u))) in (dtb__196 u)))))) ((((((Driver_dCompile.v_writeBuildMeta nFs) nEnv) outDir) ctx) entry) true)) (fun _u -> (((fun e k -> Obj.repr ((fun (u : B_dEffect_dCore.t_EffUnit) -> (let dtb__197 = Obj.obj (e) in (let dtb__198 = Obj.obj ((k (dtb__197 u))) in (dtb__198 u)))))) ((B_dEffect_dConsole.v_consolePrint nConsole) (String.concat "" ["built "; outDir; "/bin/"; name; "\n"]))) (fun _u -> (let x = { B_dData_dPair.f_Pair_first = 0; B_dData_dPair.f_Pair_second = o } in Obj.repr ((fun (_u : B_dEffect_dCore.t_EffUnit) -> x)))))))
  | _ -> failwith "DT: impossible branch"
))))))

# 1444 "Vuna/Compiler/Driver/CompilerCli.vuna"
let v_buildDefault = (fun (nFs : string) (nConsole : string) (nClock : string) (nEnv : string) (nProcess : string) (pkg : Frontend_dPackages_dPkg.t_Package) (ctx : Frontend_dPackages_dPkg.t_PackageContext) (entry : string) (name : string) (o : t_CliOpts) -> (let outDir = ((Frontend_dPackages_dPkg.v_packageDir pkg) ^ "/.output") in (let binPath = (String.concat "" [outDir; "/bin/"; name]) in (((fun e k -> Obj.repr ((fun (u : B_dEffect_dCore.t_EffUnit) -> (let dtb__199 = Obj.obj (e) in (let dtb__200 = Obj.obj ((k (dtb__199 u))) in (dtb__200 u)))))) ((((((Driver_dCompile.v_metaUpToDate nFs) nEnv) outDir) ctx) entry) binPath)) (fun fresh -> (if fresh then (((fun e k -> Obj.repr ((fun (u : B_dEffect_dCore.t_EffUnit) -> (let dtb__201 = Obj.obj (e) in (let dtb__202 = Obj.obj ((k (dtb__201 u))) in (dtb__202 u)))))) ((B_dEffect_dConsole.v_consolePrint nConsole) (String.concat "" ["up to date: "; binPath; "\n"]))) (fun _u -> (let x = { B_dData_dPair.f_Pair_first = 0; B_dData_dPair.f_Pair_second = o } in Obj.repr ((fun (_u : B_dEffect_dCore.t_EffUnit) -> x))))) else (((fun e k -> Obj.repr ((fun (u : B_dEffect_dCore.t_EffUnit) -> (let dtb__203 = Obj.obj (e) in (let dtb__204 = Obj.obj ((k (dtb__203 u))) in (dtb__204 u)))))) ((B_dEffect_dFs.v_fsRemoveTree nFs) outDir)) (fun _u -> (((fun e k -> Obj.repr ((fun (u : B_dEffect_dCore.t_EffUnit) -> (let dtb__205 = Obj.obj (e) in (let dtb__206 = Obj.obj ((k (dtb__205 u))) in (dtb__206 u)))))) (((((((((Driver_dCompile.v_compileToDir nFs) nConsole) nClock) nEnv) nProcess) ctx) entry) true) outDir)) (fun r -> (match r with
  | Base_dDiag.C_Check_ErrC (dtb__207) -> ((((v_printDiag nFs) nConsole) o) dtb__207)
  | Base_dDiag.C_Check_OkC (dtb__208) -> (((((((((v_buildLinked nFs) nConsole) nEnv) nProcess) ctx) entry) outDir) name) o)
  | _ -> failwith "DT: impossible branch"
)))))))))))

# 1464 "Vuna/Compiler/Driver/CompilerCli.vuna"
let v_buildExplicit = (fun (nFs : string) (nConsole : string) (nClock : string) (nEnv : string) (nProcess : string) (out : string) (multiOut : bool) (pkg : Frontend_dPackages_dPkg.t_Package) (ctx : Frontend_dPackages_dPkg.t_PackageContext) (entry : string) (o : t_CliOpts) -> (let name = (Frontend_dPackages_dPkg.v_packageName pkg) in (let outDir = (if multiOut then (String.concat "" [out; "/"; name]) else out) in (let binPath = (String.concat "" [outDir; "/bin/"; name]) in (((fun e k -> Obj.repr ((fun (u : B_dEffect_dCore.t_EffUnit) -> (let dtb__209 = Obj.obj (e) in (let dtb__210 = Obj.obj ((k (dtb__209 u))) in (dtb__210 u)))))) ((((((Driver_dCompile.v_metaUpToDate nFs) nEnv) outDir) ctx) entry) binPath)) (fun fresh -> (if fresh then (((fun e k -> Obj.repr ((fun (u : B_dEffect_dCore.t_EffUnit) -> (let dtb__211 = Obj.obj (e) in (let dtb__212 = Obj.obj ((k (dtb__211 u))) in (dtb__212 u)))))) ((B_dEffect_dConsole.v_consolePrint nConsole) (String.concat "" ["up to date: "; binPath; "\n"]))) (fun _u -> (let x = { B_dData_dPair.f_Pair_first = 0; B_dData_dPair.f_Pair_second = o } in Obj.repr ((fun (_u : B_dEffect_dCore.t_EffUnit) -> x))))) else (((fun e k -> Obj.repr ((fun (u : B_dEffect_dCore.t_EffUnit) -> (let dtb__213 = Obj.obj (e) in (let dtb__214 = Obj.obj ((k (dtb__213 u))) in (dtb__214 u)))))) (((((((((Driver_dCompile.v_compileToDir nFs) nConsole) nClock) nEnv) nProcess) ctx) entry) true) outDir)) (fun r -> (match r with
  | Base_dDiag.C_Check_ErrC (dtb__215) -> ((((v_printDiag nFs) nConsole) o) dtb__215)
  | Base_dDiag.C_Check_OkC (dtb__216) -> (((((((((v_buildLinked nFs) nConsole) nEnv) nProcess) ctx) entry) outDir) name) o)
  | _ -> failwith "DT: impossible branch"
))))))))))

# 1510 "Vuna/Compiler/Driver/CompilerCli.vuna"
let v_stripDotSlash = (fun (s : string) -> (if ((B_dData_dString.v_startsWith "./") s) then (((B_dData_dString.v_substring (bi_natFromInt 2)) (bi_natFromInt ((String.length s) - 2))) s) else s))

# 1120 "Vuna/Compiler/Driver/CompilerCli.vuna"
let v_isPackageEntryPath = (fun (nEnv : string) (ctx : Frontend_dPackages_dPkg.t_PackageContext) (path : string) -> (match (Frontend_dPackages_dPkg.v_contextPackageOf ctx) with
  | B_dData_dMaybe.C_Maybe_Nothing -> (let x = false in Obj.repr ((fun (_u : B_dEffect_dCore.t_EffUnit) -> x)))
  | B_dData_dMaybe.C_Maybe_Just (dtb__217) -> (((fun e k -> Obj.repr ((fun (u : B_dEffect_dCore.t_EffUnit) -> (let dtb__218 = Obj.obj (e) in (let dtb__219 = Obj.obj ((k (dtb__218 u))) in (dtb__219 u)))))) ((Frontend_dPackages_dPkg.v_absolutePath nEnv) path)) (fun abs -> (let x = ((v_stripDotSlash abs) = (v_stripDotSlash (Frontend_dPackages_dPkg.v_packageEntry dtb__217))) in Obj.repr ((fun (_u : B_dEffect_dCore.t_EffUnit) -> x)))))
  | _ -> failwith "DT: impossible branch"
))

# 1114 "Vuna/Compiler/Driver/CompilerCli.vuna"
let v_isModuleFileEntry = (fun (nFs : string) (nEnv : string) (nProcess : string) (ctx : Frontend_dPackages_dPkg.t_PackageContext) (path : string) -> (((fun e k -> Obj.repr ((fun (u : B_dEffect_dCore.t_EffUnit) -> (let dtb__220 = Obj.obj (e) in (let dtb__221 = Obj.obj ((k (dtb__220 u))) in (dtb__221 u)))))) (((v_isPackageEntryPath nEnv) ctx) path)) (fun pkgEntry -> (if pkgEntry then (let x = false in Obj.repr ((fun (_u : B_dEffect_dCore.t_EffUnit) -> x))) else ((((Driver_dDt.v_dtFileHasModuleHeader nFs) nEnv) nProcess) path)))))

# 1515 "Vuna/Compiler/Driver/CompilerCli.vuna"
let v_ownedByFile = (fun (path : string) (d : Base_dDiag.t_Diagnostic) -> ((v_stripDotSlash (Base_dDiag.v_diagFileOf d)) = (v_stripDotSlash path)))

# 1131 "Vuna/Compiler/Driver/CompilerCli.vuna"
let v_checkModuleFileEntry = (fun (nFs : string) (nConsole : string) (nEnv : string) (nProcess : string) (ctx : Frontend_dPackages_dPkg.t_PackageContext) (path : string) (o : t_CliOpts) -> (((fun e k -> Obj.repr ((fun (u : B_dEffect_dCore.t_EffUnit) -> (let dtb__222 = Obj.obj (e) in (let dtb__223 = Obj.obj ((k (dtb__222 u))) in (dtb__223 u)))))) (((((Driver_dDt.v_dtCheckModuleFile nFs) nEnv) nProcess) ctx) path)) (fun checked -> (match checked with
  | Base_dDiag.C_Check_ErrC (dtb__224) -> ((((v_printDiag nFs) nConsole) o) dtb__224)
  | Base_dDiag.C_Check_OkC (dtb__225) -> (let ws = ((B_dData_dList.v_filter (v_ownedByFile path)) (Base_dDiagnostics_dSink.v_dedupeWarnings dtb__225)) in (let shown = (if (if (o).f_CliOpts_optShowWarnings then true else (o).f_CliOpts_optDenyWarnings) then ws else B_dData_dList.C_List_Nil) in (((fun e k -> Obj.repr ((fun (u : B_dEffect_dCore.t_EffUnit) -> (let dtb__226 = Obj.obj (e) in (let dtb__227 = Obj.obj ((k (dtb__226 u))) in (dtb__227 u)))))) (((((v_printDiagList nFs) nConsole) o) "") shown)) (fun r -> (let x = { B_dData_dPair.f_Pair_first = (if (if (o).f_CliOpts_optDenyWarnings then ((B_dData_dList.v_length ws) > 0) else false) then 1 else 0); B_dData_dPair.f_Pair_second = (B_dData_dPair.v_secondOf r) } in Obj.repr ((fun (_u : B_dEffect_dCore.t_EffUnit) -> x)))))))
  | _ -> failwith "DT: impossible branch"
))))

# 1146 "Vuna/Compiler/Driver/CompilerCli.vuna"
let v_checkEntryFile = (fun (nFs : string) (nConsole : string) (nEnv : string) (nProcess : string) (ctx : Frontend_dPackages_dPkg.t_PackageContext) (path : string) (o : t_CliOpts) -> (((fun e k -> Obj.repr ((fun (u : B_dEffect_dCore.t_EffUnit) -> (let dtb__228 = Obj.obj (e) in (let dtb__229 = Obj.obj ((k (dtb__228 u))) in (dtb__229 u)))))) (((((Driver_dDt.v_dtCheck nFs) nEnv) nProcess) ctx) path)) (fun checked -> (match checked with
  | Base_dDiag.C_Check_ErrC (dtb__230) -> (if (o).f_CliOpts_optContinueOnError then (((fun e k -> Obj.repr ((fun (u : B_dEffect_dCore.t_EffUnit) -> (let dtb__231 = Obj.obj (e) in (let dtb__232 = Obj.obj ((k (dtb__231 u))) in (dtb__232 u)))))) (((((Driver_dDt.v_dtCheckRecovering nFs) nEnv) nProcess) ctx) path)) (fun recovered -> (match recovered with
  | Base_dDiag.C_Check_OkC (dtb__233) -> (let shown = ((v_takeDiags (o).f_CliOpts_optMaxErrors) dtb__233) in (((fun e k -> Obj.repr ((fun (u : B_dEffect_dCore.t_EffUnit) -> (let dtb__234 = Obj.obj (e) in (let dtb__235 = Obj.obj ((k (dtb__234 u))) in (dtb__235 u)))))) (((((v_printDiagList nFs) nConsole) o) "") shown)) (fun r -> (if ((B_dData_dList.v_length shown) = 0) then ((((v_printDiag nFs) nConsole) (B_dData_dPair.v_secondOf r)) dtb__230) else (let x = { B_dData_dPair.f_Pair_first = 1; B_dData_dPair.f_Pair_second = (B_dData_dPair.v_secondOf r) } in Obj.repr ((fun (_u : B_dEffect_dCore.t_EffUnit) -> x)))))))
  | Base_dDiag.C_Check_ErrC (dtb__236) -> ((((v_printDiag nFs) nConsole) o) dtb__230)
  | _ -> failwith "DT: impossible branch"
))) else ((((v_printDiag nFs) nConsole) o) dtb__230))
  | Base_dDiag.C_Check_OkC (dtb__237) -> (let ws = ((B_dData_dList.v_filter (v_ownedByFile path)) (Base_dDiagnostics_dSink.v_dedupeWarnings dtb__237)) in (let shown = (if (if (o).f_CliOpts_optShowWarnings then true else (o).f_CliOpts_optDenyWarnings) then ws else B_dData_dList.C_List_Nil) in (((fun e k -> Obj.repr ((fun (u : B_dEffect_dCore.t_EffUnit) -> (let dtb__238 = Obj.obj (e) in (let dtb__239 = Obj.obj ((k (dtb__238 u))) in (dtb__239 u)))))) (((((v_printDiagList nFs) nConsole) o) "") shown)) (fun r -> (let x = { B_dData_dPair.f_Pair_first = (if (if (o).f_CliOpts_optDenyWarnings then ((B_dData_dList.v_length ws) > 0) else false) then 1 else 0); B_dData_dPair.f_Pair_second = (B_dData_dPair.v_secondOf r) } in Obj.repr ((fun (_u : B_dEffect_dCore.t_EffUnit) -> x)))))))
  | _ -> failwith "DT: impossible branch"
))))

# 1098 "Vuna/Compiler/Driver/CompilerCli.vuna"
let v_checkFileEntry = (fun (nFs : string) (nConsole : string) (nEnv : string) (nProcess : string) (path : string) (o : t_CliOpts) -> (((fun e k -> Obj.repr ((fun (u : B_dEffect_dCore.t_EffUnit) -> (let dtb__240 = Obj.obj (e) in (let dtb__241 = Obj.obj ((k (dtb__240 u))) in (dtb__241 u)))))) (((Frontend_dPackages_dPkg.v_contextForFile nFs) nEnv) path)) (fun ctxR -> (match ctxR with
  | Base_dDiag.C_Check_ErrC (dtb__242) -> ((((v_printDiag nFs) nConsole) o) dtb__242)
  | Base_dDiag.C_Check_OkC (dtb__243) -> (let ctx = ((Frontend_dPackages_dPkg.v_contextWithRelease (o).f_CliOpts_optRelease) dtb__243) in (let o1 = ((v_applyDiagConfig (Frontend_dPackages_dPkg.v_contextPackageOf ctx)) o) in (((fun e k -> Obj.repr ((fun (u : B_dEffect_dCore.t_EffUnit) -> (let dtb__244 = Obj.obj (e) in (let dtb__245 = Obj.obj ((k (dtb__244 u))) in (dtb__245 u)))))) (((((v_isModuleFileEntry nFs) nEnv) nProcess) ctx) path)) (fun moduleEntry -> (if moduleEntry then (((((((v_checkModuleFileEntry nFs) nConsole) nEnv) nProcess) ctx) path) o1) else (((((((v_checkEntryFile nFs) nConsole) nEnv) nProcess) ctx) path) o1))))))
  | _ -> failwith "DT: impossible branch"
))))

# 1519 "Vuna/Compiler/Driver/CompilerCli.vuna"
let v_ownedByPackage = (fun (pkg : Frontend_dPackages_dPkg.t_Package) (d : Base_dDiag.t_Diagnostic) -> (let dir = (v_stripDotSlash (Frontend_dPackages_dPkg.v_packageDir pkg)) in (let file = (v_stripDotSlash (Base_dDiag.v_diagFileOf d)) in (let prefix = (if (if (dir = ".") then true else (dir = "")) then "" else (dir ^ "/")) in (if (if ((B_dData_dString.v_startsWith (prefix ^ "lib/")) file) then true else ((B_dData_dString.v_startsWith (prefix ^ "app/")) file)) then true else ((B_dData_dString.v_startsWith (prefix ^ "test/")) file))))))

# 1530 "Vuna/Compiler/Driver/CompilerCli.vuna"
let v_finishWarnings = (fun (nFs : string) (nConsole : string) (warns : Base_dDiag.t_Diagnostic B_dData_dList.t_List) (code : int) (o : t_CliOpts) -> (let ws = (Base_dDiagnostics_dSink.v_dedupeWarnings warns) in (let shown = (if (if (o).f_CliOpts_optShowWarnings then true else (o).f_CliOpts_optDenyWarnings) then ws else B_dData_dList.C_List_Nil) in (((fun e k -> Obj.repr ((fun (u : B_dEffect_dCore.t_EffUnit) -> (let dtb__246 = Obj.obj (e) in (let dtb__247 = Obj.obj ((k (dtb__246 u))) in (dtb__247 u)))))) (((((v_printDiagList nFs) nConsole) o) "") shown)) (fun r -> (let x = { B_dData_dPair.f_Pair_first = (if (if (o).f_CliOpts_optDenyWarnings then ((B_dData_dList.v_length ws) > 0) else false) then 1 else code); B_dData_dPair.f_Pair_second = (B_dData_dPair.v_secondOf r) } in Obj.repr ((fun (_u : B_dEffect_dCore.t_EffUnit) -> x))))))))

# 1541 "Vuna/Compiler/Driver/CompilerCli.vuna"
let v_finishWarningsDir = (fun (nFs : string) (nConsole : string) (nProcess : string) (warns : Base_dDiag.t_Diagnostic B_dData_dList.t_List) (o : t_CliOpts) (dir : string) (code : int) -> (let ws = (Base_dDiagnostics_dSink.v_dedupeWarnings warns) in (let shown = (if (if (o).f_CliOpts_optShowWarnings then true else (o).f_CliOpts_optDenyWarnings) then ws else B_dData_dList.C_List_Nil) in (((fun e k -> Obj.repr ((fun (u : B_dEffect_dCore.t_EffUnit) -> (let dtb__248 = Obj.obj (e) in (let dtb__249 = Obj.obj ((k (dtb__248 u))) in (dtb__249 u)))))) (((((v_printDiagList nFs) nConsole) o) "") shown)) (fun r -> (if (if (o).f_CliOpts_optDenyWarnings then ((B_dData_dList.v_length ws) > 0) else false) then (((fun e k -> Obj.repr ((fun (u : B_dEffect_dCore.t_EffUnit) -> (let dtb__250 = Obj.obj (e) in (let dtb__251 = Obj.obj ((k (dtb__250 u))) in (dtb__251 u)))))) ((B_dEffect_dFs.v_fsRemoveTree nFs) dir)) (fun _u -> (let x = { B_dData_dPair.f_Pair_first = 1; B_dData_dPair.f_Pair_second = (B_dData_dPair.v_secondOf r) } in Obj.repr ((fun (_u : B_dEffect_dCore.t_EffUnit) -> x))))) else (let x = { B_dData_dPair.f_Pair_first = code; B_dData_dPair.f_Pair_second = (B_dData_dPair.v_secondOf r) } in Obj.repr ((fun (_u : B_dEffect_dCore.t_EffUnit) -> x)))))))))

# 852 "Vuna/Compiler/Driver/CompilerCli.vuna"
let v_compileFileEntry = (fun (nFs : string) (nConsole : string) (nClock : string) (nEnv : string) (nProcess : string) (printResult : bool) (entry : string) (outDir : string) (o : t_CliOpts) -> (((fun e k -> Obj.repr ((fun (u : B_dEffect_dCore.t_EffUnit) -> (let dtb__252 = Obj.obj (e) in (let dtb__253 = Obj.obj ((k (dtb__252 u))) in (dtb__253 u)))))) (((Frontend_dPackages_dPkg.v_contextForFile nFs) nEnv) entry)) (fun ctxR -> (match ctxR with
  | Base_dDiag.C_Check_ErrC (dtb__254) -> ((((v_printDiag nFs) nConsole) o) dtb__254)
  | Base_dDiag.C_Check_OkC (dtb__255) -> (let ctx = ((Frontend_dPackages_dPkg.v_contextWithRelease (o).f_CliOpts_optRelease) dtb__255) in (let o1 = ((v_applyDiagConfig (Frontend_dPackages_dPkg.v_contextPackageOf ctx)) o) in (((fun e k -> Obj.repr ((fun (u : B_dEffect_dCore.t_EffUnit) -> (let dtb__256 = Obj.obj (e) in (let dtb__257 = Obj.obj ((k (dtb__256 u))) in (dtb__257 u)))))) ((((((((((v_compileToTarget nFs) nConsole) nClock) nEnv) nProcess) ctx) entry) printResult) outDir) (o).f_CliOpts_optTarget)) (fun r -> (match r with
  | Base_dDiag.C_Check_ErrC (dtb__258) -> ((((v_printDiag nFs) nConsole) o1) dtb__258)
  | Base_dDiag.C_Check_OkC (dtb__259) -> (((((((v_finishWarningsDir nFs) nConsole) nProcess) (B_dData_dPair.v_secondOf dtb__259)) o1) outDir) 0)
  | _ -> failwith "DT: impossible branch"
)))))
  | _ -> failwith "DT: impossible branch"
))))

# 868 "Vuna/Compiler/Driver/CompilerCli.vuna"
let v_compilePkgDir = (fun (nFs : string) (nConsole : string) (nClock : string) (nEnv : string) (nProcess : string) (printResult : bool) (dir : string) (outDir : string) (o : t_CliOpts) -> (((fun e k -> Obj.repr ((fun (u : B_dEffect_dCore.t_EffUnit) -> (let dtb__260 = Obj.obj (e) in (let dtb__261 = Obj.obj ((k (dtb__260 u))) in (dtb__261 u)))))) ((((v_executablePackage nFs) nEnv) "compile") dir)) (fun pkgR -> (match pkgR with
  | Base_dDiag.C_Check_ErrC (dtb__262) -> ((((v_printDiag nFs) nConsole) o) dtb__262)
  | Base_dDiag.C_Check_OkC (dtb__263) -> (let o1 = ((v_applyDiagConfig (B_dData_dMaybe.C_Maybe_Just (dtb__263))) o) in (((fun e k -> Obj.repr ((fun (u : B_dEffect_dCore.t_EffUnit) -> (let dtb__264 = Obj.obj (e) in (let dtb__265 = Obj.obj ((k (dtb__264 u))) in (dtb__265 u)))))) ((((((((((v_compileToTarget nFs) nConsole) nClock) nEnv) nProcess) ((Frontend_dPackages_dPkg.v_contextWithRelease (o).f_CliOpts_optRelease) (Frontend_dPackages_dPkg.v_packageContext dtb__263))) (Frontend_dPackages_dPkg.v_packageEntry dtb__263)) printResult) outDir) (o).f_CliOpts_optTarget)) (fun r -> (match r with
  | Base_dDiag.C_Check_ErrC (dtb__266) -> ((((v_printDiag nFs) nConsole) o1) dtb__266)
  | Base_dDiag.C_Check_OkC (dtb__267) -> (((((((v_finishWarningsDir nFs) nConsole) nProcess) (B_dData_dPair.v_secondOf dtb__267)) o1) outDir) 0)
  | _ -> failwith "DT: impossible branch"
))))
  | _ -> failwith "DT: impossible branch"
))))

# 827 "Vuna/Compiler/Driver/CompilerCli.vuna"
let v_compileRun = (fun (nFs : string) (nConsole : string) (nClock : string) (nEnv : string) (nProcess : string) (printResult : bool) (entry : string) (outDir : string) (o : t_CliOpts) -> (((fun e k -> Obj.repr ((fun (u : B_dEffect_dCore.t_EffUnit) -> (let dtb__268 = Obj.obj (e) in (let dtb__269 = Obj.obj ((k (dtb__268 u))) in (dtb__269 u)))))) ((B_dEffect_dFs.v_fsFileExists nFs) entry)) (fun exists -> (if exists then (((fun e k -> Obj.repr ((fun (u : B_dEffect_dCore.t_EffUnit) -> (let dtb__270 = Obj.obj (e) in (let dtb__271 = Obj.obj ((k (dtb__270 u))) in (dtb__271 u)))))) ((B_dEffect_dFs.v_fsIsDirectory nFs) entry)) (fun isDir -> (if isDir then (((((((((v_compilePkgDir nFs) nConsole) nClock) nEnv) nProcess) printResult) entry) outDir) o) else (((((((((v_compileFileEntry nFs) nConsole) nClock) nEnv) nProcess) printResult) entry) outDir) o)))) else ((v_withOpts o) ((v_dtPathErr nConsole) entry))))))

# 820 "Vuna/Compiler/Driver/CompilerCli.vuna"
let v_compileFinish = (fun (nFs : string) (nConsole : string) (nClock : string) (nEnv : string) (nProcess : string) (mc0 : string) (mc1 : bool) (mc2 : string B_dData_dMaybe.t_Maybe) (mc3 : string B_dData_dMaybe.t_Maybe) (mc4 : t_CliOpts) -> (match mc2 with
  | B_dData_dMaybe.C_Maybe_Just (dtb__272) -> (match mc3 with
  | B_dData_dMaybe.C_Maybe_Nothing -> ((v_withOpts mc4) ((v_usageErr nConsole) mc0))
  | B_dData_dMaybe.C_Maybe_Just (dtb__273) -> (((((((((v_compileRun nFs) nConsole) nClock) nEnv) nProcess) mc1) dtb__272) dtb__273) mc4)
  | _ -> failwith "DT: impossible branch"
)
  | B_dData_dMaybe.C_Maybe_Nothing -> ((v_withOpts mc4) ((v_usageErr nConsole) mc0))
  | _ -> failwith "DT: impossible branch"
))

# 794 "Vuna/Compiler/Driver/CompilerCli.vuna"
let rec v_compileParse = (fun (nFs : string) (nConsole : string) (nClock : string) (nEnv : string) (nProcess : string) (prog : string) (printResult : bool) (entry : string B_dData_dMaybe.t_Maybe) (outDir : string B_dData_dMaybe.t_Maybe) (args : string B_dData_dList.t_List) (o : t_CliOpts) -> (let nd_uscrut17 = args in (match nd_uscrut17 with
  | B_dData_dList.C_List__x58__x58_ (dtb__274, dtb__275) -> (if (dtb__274 = "--no-print") then (((((((((((v_compileParse nFs) nConsole) nClock) nEnv) nProcess) prog) false) entry) outDir) dtb__275) o) else (if (dtb__274 = "--release") then (((((((((((v_compileParse nFs) nConsole) nClock) nEnv) nProcess) prog) printResult) entry) outDir) dtb__275) (v_markRelease o)) else (if (dtb__274 = "--target") then (match dtb__275 with
  | B_dData_dList.C_List__x58__x58_ (dtb__276, dtb__277) -> (if (v_isKnownTarget dtb__276) then (((((((((((v_compileParse nFs) nConsole) nClock) nEnv) nProcess) prog) printResult) entry) outDir) dtb__277) ((v_markTarget dtb__276) o)) else ((v_withOpts o) ((v_usageErr nConsole) prog)))
  | _ -> (if ((B_dData_dString.v_startsWith "-") dtb__274) then ((v_withOpts o) (((v_removedFlag nConsole) prog) dtb__274)) else (match entry with
  | B_dData_dMaybe.C_Maybe_Nothing -> (((((((((((v_compileParse nFs) nConsole) nClock) nEnv) nProcess) prog) printResult) (B_dData_dMaybe.C_Maybe_Just (dtb__274))) outDir) dtb__275) o)
  | B_dData_dMaybe.C_Maybe_Just (dtb__278) -> (match outDir with
  | B_dData_dMaybe.C_Maybe_Nothing -> (((((((((((v_compileParse nFs) nConsole) nClock) nEnv) nProcess) prog) printResult) entry) (B_dData_dMaybe.C_Maybe_Just (dtb__274))) dtb__275) o)
  | B_dData_dMaybe.C_Maybe_Just (dtb__279) -> ((v_withOpts o) ((v_usageErr nConsole) prog))
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
))
) else (if ((B_dData_dString.v_startsWith "-") dtb__274) then ((v_withOpts o) (((v_removedFlag nConsole) prog) dtb__274)) else (match entry with
  | B_dData_dMaybe.C_Maybe_Nothing -> (((((((((((v_compileParse nFs) nConsole) nClock) nEnv) nProcess) prog) printResult) (B_dData_dMaybe.C_Maybe_Just (dtb__274))) outDir) dtb__275) o)
  | B_dData_dMaybe.C_Maybe_Just (dtb__280) -> (match outDir with
  | B_dData_dMaybe.C_Maybe_Nothing -> (((((((((((v_compileParse nFs) nConsole) nClock) nEnv) nProcess) prog) printResult) entry) (B_dData_dMaybe.C_Maybe_Just (dtb__274))) dtb__275) o)
  | B_dData_dMaybe.C_Maybe_Just (dtb__281) -> ((v_withOpts o) ((v_usageErr nConsole) prog))
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
)))))
  | B_dData_dList.C_List_Nil -> ((((((((((v_compileFinish nFs) nConsole) nClock) nEnv) nProcess) prog) printResult) entry) outDir) o)
  | _ -> failwith "DT: impossible branch"
)))

# 791 "Vuna/Compiler/Driver/CompilerCli.vuna"
let v_compileArgs = (fun (nFs : string) (nConsole : string) (nClock : string) (nEnv : string) (nProcess : string) (prog : string) (args : string B_dData_dList.t_List) (o : t_CliOpts) -> (((((((((((v_compileParse nFs) nConsole) nClock) nEnv) nProcess) prog) true) B_dData_dMaybe.C_Maybe_Nothing) B_dData_dMaybe.C_Maybe_Nothing) args) o))

# 1341 "Vuna/Compiler/Driver/CompilerCli.vuna"
let v_buildWasmOne = (fun (nFs : string) (nConsole : string) (nEnv : string) (nProcess : string) (noCompile : bool) (outM : string B_dData_dMaybe.t_Maybe) (pkg : Frontend_dPackages_dPkg.t_Package) (o : t_CliOpts) -> (let outDir = (match outM with
  | B_dData_dMaybe.C_Maybe_Just (dtb__298) -> dtb__298
  | B_dData_dMaybe.C_Maybe_Nothing -> ((Frontend_dPackages_dPkg.v_packageDir pkg) ^ "/.output")
  | _ -> failwith "DT: impossible branch"
) in (let watPath = (outDir ^ "/main.wat") in (let wasmPath = (outDir ^ "/main.wasm") in (let script = (v_wasmBuildScript (o).f_CliOpts_optWasmOpt) in (((fun e k -> Obj.repr ((fun (u : B_dEffect_dCore.t_EffUnit) -> (let dtb__282 = Obj.obj (e) in (let dtb__283 = Obj.obj ((k (dtb__282 u))) in (dtb__283 u)))))) ((((((((Driver_dTarget.v_compileBackend nFs) nEnv) nProcess) ((Frontend_dPackages_dPkg.v_contextWithRelease (o).f_CliOpts_optRelease) (Frontend_dPackages_dPkg.v_packageContext pkg))) "wasm") (Frontend_dPackages_dPkg.v_packageEntry pkg)) true) outDir)) (fun r -> (match r with
  | Base_dDiag.C_Check_ErrC (dtb__284) -> ((((v_printDiag nFs) nConsole) o) dtb__284)
  | Base_dDiag.C_Check_OkC (dtb__285) -> (((fun e k -> Obj.repr ((fun (u : B_dEffect_dCore.t_EffUnit) -> (let dtb__286 = Obj.obj (e) in (let dtb__287 = Obj.obj ((k (dtb__286 u))) in (dtb__287 u)))))) (((B_dEffect_dFs.v_fsWriteFile nFs) (outDir ^ "/build.sh")) script)) (fun _u -> (((fun e k -> Obj.repr ((fun (u : B_dEffect_dCore.t_EffUnit) -> (let dtb__288 = Obj.obj (e) in (let dtb__289 = Obj.obj ((k (dtb__288 u))) in (dtb__289 u)))))) (if noCompile then (((fun e k -> Obj.repr ((fun (u : B_dEffect_dCore.t_EffUnit) -> (let dtb__290 = Obj.obj (e) in (let dtb__291 = Obj.obj ((k (dtb__290 u))) in (dtb__291 u)))))) ((B_dEffect_dConsole.v_consolePrint nConsole) (String.concat "" ["wrote "; watPath; "\n"]))) (fun _u -> (let x = 0 in Obj.repr ((fun (_u : B_dEffect_dCore.t_EffUnit) -> x))))) else (((fun e k -> Obj.repr ((fun (u : B_dEffect_dCore.t_EffUnit) -> (let dtb__292 = Obj.obj (e) in (let dtb__293 = Obj.obj ((k (dtb__292 u))) in (dtb__293 u)))))) (((B_dEffect_dProcess.v_processRunIn nProcess) outDir) (B_dData_dList.C_List__x58__x58_ ("sh", (B_dData_dList.C_List__x58__x58_ ("build.sh", B_dData_dList.C_List_Nil)))))) (fun c -> (if (c = 0) then (((fun e k -> Obj.repr ((fun (u : B_dEffect_dCore.t_EffUnit) -> (let dtb__294 = Obj.obj (e) in (let dtb__295 = Obj.obj ((k (dtb__294 u))) in (dtb__295 u)))))) ((B_dEffect_dConsole.v_consolePrint nConsole) (String.concat "" ["wrote "; wasmPath; "\n"]))) (fun _u -> (let x = 0 in Obj.repr ((fun (_u : B_dEffect_dCore.t_EffUnit) -> x))))) else (((fun e k -> Obj.repr ((fun (u : B_dEffect_dCore.t_EffUnit) -> (let dtb__296 = Obj.obj (e) in (let dtb__297 = Obj.obj ((k (dtb__296 u))) in (dtb__297 u)))))) ((B_dEffect_dConsole.v_consolePrint nConsole) (String.concat "" ["wasm assembly failed: build.sh exited "; (string_of_int c); "\n"]))) (fun _u -> (let x = 1 in Obj.repr ((fun (_u : B_dEffect_dCore.t_EffUnit) -> x)))))))))) (fun code -> (if (code = 0) then (((((((v_finishWarningsDir nFs) nConsole) nProcess) (B_dData_dPair.v_secondOf dtb__285)) o) outDir) 0) else (let x = { B_dData_dPair.f_Pair_first = 1; B_dData_dPair.f_Pair_second = o } in Obj.repr ((fun (_u : B_dEffect_dCore.t_EffUnit) -> x))))))))
  | _ -> failwith "DT: impossible branch"
))))))))

# 1409 "Vuna/Compiler/Driver/CompilerCli.vuna"
let v_buildOneGo = (fun (nFs : string) (nConsole : string) (nClock : string) (nEnv : string) (nProcess : string) (nExit : string) (nArgs : string) (noCompile : bool) (multiOut : bool) (outM : string B_dData_dMaybe.t_Maybe) (pkg : Frontend_dPackages_dPkg.t_Package) (o : t_CliOpts) -> (if ((o).f_CliOpts_optTarget = "wasm") then ((((((((v_buildWasmOne nFs) nConsole) nEnv) nProcess) noCompile) outM) pkg) o) else (if ((o).f_CliOpts_optTarget = "native") then (((((((((v_buildNativeOne nFs) nConsole) nEnv) nProcess) noCompile) multiOut) outM) pkg) o) else (let name = (Frontend_dPackages_dPkg.v_packageName pkg) in (let entry = (Frontend_dPackages_dPkg.v_packageEntry pkg) in (((fun e k -> Obj.repr ((fun (u : B_dEffect_dCore.t_EffUnit) -> (let dtb__299 = Obj.obj (e) in (let dtb__300 = Obj.obj ((k (dtb__299 u))) in (dtb__300 u)))))) ((B_dEffect_dFs.v_fsFileExists nFs) entry)) (fun exists -> (if exists then (let ctx = ((Frontend_dPackages_dPkg.v_contextWithRelease (o).f_CliOpts_optRelease) (Frontend_dPackages_dPkg.v_packageContext pkg)) in (if noCompile then (match outM with
  | B_dData_dMaybe.C_Maybe_Just (dtb__301) -> (((((((((v_compileCodegen nFs) nConsole) nClock) nEnv) nProcess) ctx) entry) (if multiOut then (String.concat "" [dtb__301; "/"; name]) else dtb__301)) o)
  | B_dData_dMaybe.C_Maybe_Nothing -> (((((((((v_compileCodegen nFs) nConsole) nClock) nEnv) nProcess) ctx) entry) ((Frontend_dPackages_dPkg.v_packageDir pkg) ^ "/.output")) o)
  | _ -> failwith "DT: impossible branch"
) else (match outM with
  | B_dData_dMaybe.C_Maybe_Just (dtb__302) -> (((((((((((v_buildExplicit nFs) nConsole) nClock) nEnv) nProcess) dtb__302) multiOut) pkg) ctx) entry) o)
  | B_dData_dMaybe.C_Maybe_Nothing -> ((((((((((v_buildDefault nFs) nConsole) nClock) nEnv) nProcess) pkg) ctx) entry) name) o)
  | _ -> failwith "DT: impossible branch"
))) else (((fun e k -> Obj.repr ((fun (u : B_dEffect_dCore.t_EffUnit) -> (let dtb__303 = Obj.obj (e) in (let dtb__304 = Obj.obj ((k (dtb__303 u))) in (dtb__304 u)))))) (((((((Driver_dCompile.v_checkPackage nFs) nClock) nEnv) nProcess) (o).f_CliOpts_optRelease) false) pkg)) (fun r -> (match r with
  | Base_dDiag.C_Check_ErrC (dtb__305) -> ((((v_printDiag nFs) nConsole) o) dtb__305)
  | Base_dDiag.C_Check_OkC (dtb__306) -> (((fun e k -> Obj.repr ((fun (u : B_dEffect_dCore.t_EffUnit) -> (let dtb__307 = Obj.obj (e) in (let dtb__308 = Obj.obj ((k (dtb__307 u))) in (dtb__308 u)))))) ((B_dEffect_dConsole.v_consolePrint nConsole) (String.concat "" ["skipped (library): "; name; "\n"]))) (fun _u -> (let x = { B_dData_dPair.f_Pair_first = 0; B_dData_dPair.f_Pair_second = o } in Obj.repr ((fun (_u : B_dEffect_dCore.t_EffUnit) -> x)))))
  | _ -> failwith "DT: impossible branch"
)))))))))))

# 1400 "Vuna/Compiler/Driver/CompilerCli.vuna"
let v_buildOne = (fun (nFs : string) (nConsole : string) (nClock : string) (nEnv : string) (nProcess : string) (nExit : string) (nArgs : string) (noCompile : bool) (multiOut : bool) (outM : string B_dData_dMaybe.t_Maybe) (pkg : Frontend_dPackages_dPkg.t_Package) (o : t_CliOpts) -> (if (o).f_CliOpts_optExplain then (((fun e k -> Obj.repr ((fun (u : B_dEffect_dCore.t_EffUnit) -> (let dtb__309 = Obj.obj (e) in (let dtb__310 = Obj.obj ((k (dtb__309 u))) in (dtb__310 u)))))) (if (v_isMachineFormat (o).f_CliOpts_optDiagFormat) then (let x = 0 in Obj.repr ((fun (_u : B_dEffect_dCore.t_EffUnit) -> x))) else ((((((v_printExplainEff nFs) nConsole) nClock) nEnv) nProcess) pkg))) (fun _u -> ((((((((((((v_buildOneGo nFs) nConsole) nClock) nEnv) nProcess) nExit) nArgs) noCompile) multiOut) outM) pkg) o))) else ((((((((((((v_buildOneGo nFs) nConsole) nClock) nEnv) nProcess) nExit) nArgs) noCompile) multiOut) outM) pkg) o)))

# 1284 "Vuna/Compiler/Driver/CompilerCli.vuna"
let rec v_buildTargets = (fun (nFs : string) (nConsole : string) (nClock : string) (nEnv : string) (nProcess : string) (nExit : string) (nArgs : string) (mc0 : bool) (mc1 : bool) (mc2 : string B_dData_dMaybe.t_Maybe) (mc3 : Frontend_dPackages_dPkg.t_Package B_dData_dList.t_List) (mc4 : int) (mc5 : t_CliOpts) -> (match mc3 with
  | B_dData_dList.C_List__x58__x58_ (dtb__311, dtb__312) -> (((fun e k -> Obj.repr ((fun (u : B_dEffect_dCore.t_EffUnit) -> (let dtb__313 = Obj.obj (e) in (let dtb__314 = Obj.obj ((k (dtb__313 u))) in (dtb__314 u)))))) ((((((((((((v_buildOne nFs) nConsole) nClock) nEnv) nProcess) nExit) nArgs) mc0) mc1) mc2) dtb__311) mc5)) (fun r -> (let next = (if ((B_dData_dPair.v_firstOf r) > mc4) then (B_dData_dPair.v_firstOf r) else mc4) in (((((((((((((v_buildTargets nFs) nConsole) nClock) nEnv) nProcess) nExit) nArgs) mc0) mc1) mc2) dtb__312) next) (B_dData_dPair.v_secondOf r)))))
  | B_dData_dList.C_List_Nil -> (let x = { B_dData_dPair.f_Pair_first = mc4; B_dData_dPair.f_Pair_second = mc5 } in Obj.repr ((fun (_u : B_dEffect_dCore.t_EffUnit) -> x)))
  | _ -> failwith "DT: impossible branch"
))

# 1234 "Vuna/Compiler/Driver/CompilerCli.vuna"
let v_buildRun = (fun (nFs : string) (nConsole : string) (nClock : string) (nEnv : string) (nProcess : string) (nExit : string) (nArgs : string) (noCompile : bool) (dir : string) (outM : string B_dData_dMaybe.t_Maybe) (pkgM : string B_dData_dMaybe.t_Maybe) (o : t_CliOpts) -> (((fun e k -> Obj.repr ((fun (u : B_dEffect_dCore.t_EffUnit) -> (let dtb__315 = Obj.obj (e) in (let dtb__316 = Obj.obj ((k (dtb__315 u))) in (dtb__316 u)))))) (((Frontend_dPackages_dPkg.v_loadWorkspace nFs) nEnv) dir)) (fun workspaceR -> (match workspaceR with
  | Base_dDiag.C_Check_ErrC (dtb__317) -> ((((v_printDiag nFs) nConsole) o) dtb__317)
  | Base_dDiag.C_Check_OkC (dtb__318) -> (((fun e k -> Obj.repr ((fun (u : B_dEffect_dCore.t_EffUnit) -> (let dtb__319 = Obj.obj (e) in (let dtb__320 = Obj.obj ((k (dtb__319 u))) in (dtb__320 u)))))) ((v_isSingleLibraryPackage nFs) (Frontend_dPackages_dPkg.v_workspaceAllPackages dtb__318))) (fun libOnly -> (if libOnly then ((v_withOpts o) ((v_printErr nConsole) (v_libraryOnlyMessage (Frontend_dPackages_dPkg.v_workspaceAllPackages dtb__318)))) else (match ((v_selectBuildTargets pkgM) (Frontend_dPackages_dPkg.v_workspaceAllPackages dtb__318)) with
  | Base_dDiag.C_Check_ErrC (dtb__321) -> ((((v_printDiag nFs) nConsole) o) dtb__321)
  | Base_dDiag.C_Check_OkC (dtb__322) -> (((((((((((((v_buildTargets nFs) nConsole) nClock) nEnv) nProcess) nExit) nArgs) noCompile) (v_workspaceMultiOut dtb__318)) outM) dtb__322) 0) o)
  | _ -> failwith "DT: impossible branch"
))))
  | _ -> failwith "DT: impossible branch"
))))

# 1184 "Vuna/Compiler/Driver/CompilerCli.vuna"
let rec v_buildParse = (fun (nFs : string) (nConsole : string) (nClock : string) (nEnv : string) (nProcess : string) (nExit : string) (nArgs : string) (prog : string) (noCompile : bool) (out : string B_dData_dMaybe.t_Maybe) (dir : string B_dData_dMaybe.t_Maybe) (pkg : string B_dData_dMaybe.t_Maybe) (args : string B_dData_dList.t_List) (o : t_CliOpts) -> (let nd_uscrut22 = args in (match nd_uscrut22 with
  | B_dData_dList.C_List__x58__x58_ (dtb__323, dtb__324) -> (if (dtb__323 = "--no-compile") then ((((((((((((((v_buildParse nFs) nConsole) nClock) nEnv) nProcess) nExit) nArgs) prog) true) out) dir) pkg) dtb__324) o) else (if (dtb__323 = "--explain") then ((((((((((((((v_buildParse nFs) nConsole) nClock) nEnv) nProcess) nExit) nArgs) prog) noCompile) out) dir) pkg) dtb__324) (v_markExplain o)) else (if (dtb__323 = "--release") then ((((((((((((((v_buildParse nFs) nConsole) nClock) nEnv) nProcess) nExit) nArgs) prog) noCompile) out) dir) pkg) dtb__324) (v_markRelease o)) else (if (dtb__323 = "--wasm-opt") then (match dtb__324 with
  | B_dData_dList.C_List__x58__x58_ (dtb__325, dtb__326) -> (if ((B_dData_dString.v_startsWith "-") dtb__325) then ((v_withOpts o) (((v_removedFlag nConsole) prog) dtb__325)) else (match (v_parseWasmOptLevel dtb__325) with
  | B_dData_dMaybe.C_Maybe_Just (dtb__327) -> ((((((((((((((v_buildParse nFs) nConsole) nClock) nEnv) nProcess) nExit) nArgs) prog) noCompile) out) dir) pkg) dtb__326) ((v_markWasmOpt dtb__327) o))
  | B_dData_dMaybe.C_Maybe_Nothing -> ((v_withOpts o) ((v_usageErr nConsole) prog))
  | _ -> failwith "DT: impossible branch"
))
  | B_dData_dList.C_List_Nil -> ((v_withOpts o) ((v_usageErr nConsole) prog))
  | _ -> failwith "DT: impossible branch"
) else (if (dtb__323 = "--target") then (match dtb__324 with
  | B_dData_dList.C_List__x58__x58_ (dtb__328, dtb__329) -> (if (v_isKnownTarget dtb__328) then ((((((((((((((v_buildParse nFs) nConsole) nClock) nEnv) nProcess) nExit) nArgs) prog) noCompile) out) dir) pkg) dtb__329) ((v_markTarget dtb__328) o)) else ((v_withOpts o) ((v_usageErr nConsole) prog)))
  | _ -> (if ((B_dData_dString.v_startsWith "-") dtb__323) then ((v_withOpts o) (((v_removedFlag nConsole) prog) dtb__323)) else (match dir with
  | B_dData_dMaybe.C_Maybe_Nothing -> ((((((((((((((v_buildParse nFs) nConsole) nClock) nEnv) nProcess) nExit) nArgs) prog) noCompile) out) (B_dData_dMaybe.C_Maybe_Just (dtb__323))) pkg) dtb__324) o)
  | B_dData_dMaybe.C_Maybe_Just (dtb__330) -> ((v_withOpts o) ((v_usageErr nConsole) prog))
  | _ -> failwith "DT: impossible branch"
))
) else (if (dtb__323 = "--out") then (match dtb__324 with
  | B_dData_dList.C_List__x58__x58_ (dtb__331, dtb__332) -> (if ((B_dData_dString.v_startsWith "-") dtb__331) then ((v_withOpts o) (((v_removedFlag nConsole) prog) dtb__331)) else (match out with
  | B_dData_dMaybe.C_Maybe_Nothing -> ((((((((((((((v_buildParse nFs) nConsole) nClock) nEnv) nProcess) nExit) nArgs) prog) noCompile) (B_dData_dMaybe.C_Maybe_Just (dtb__331))) dir) pkg) dtb__332) o)
  | B_dData_dMaybe.C_Maybe_Just (dtb__333) -> ((v_withOpts o) ((v_usageErr nConsole) prog))
  | _ -> failwith "DT: impossible branch"
))
  | B_dData_dList.C_List_Nil -> ((v_withOpts o) ((v_usageErr nConsole) prog))
  | _ -> failwith "DT: impossible branch"
) else (if (dtb__323 = "--package") then (match dtb__324 with
  | B_dData_dList.C_List__x58__x58_ (dtb__334, dtb__335) -> (if ((B_dData_dString.v_startsWith "-") dtb__334) then ((v_withOpts o) (((v_removedFlag nConsole) prog) dtb__334)) else (match pkg with
  | B_dData_dMaybe.C_Maybe_Nothing -> ((((((((((((((v_buildParse nFs) nConsole) nClock) nEnv) nProcess) nExit) nArgs) prog) noCompile) out) dir) (B_dData_dMaybe.C_Maybe_Just (dtb__334))) dtb__335) o)
  | B_dData_dMaybe.C_Maybe_Just (dtb__336) -> ((v_withOpts o) ((v_usageErr nConsole) prog))
  | _ -> failwith "DT: impossible branch"
))
  | B_dData_dList.C_List_Nil -> ((v_withOpts o) ((v_usageErr nConsole) prog))
  | _ -> failwith "DT: impossible branch"
) else (if ((B_dData_dString.v_startsWith "-") dtb__323) then ((v_withOpts o) (((v_removedFlag nConsole) prog) dtb__323)) else (match dir with
  | B_dData_dMaybe.C_Maybe_Nothing -> ((((((((((((((v_buildParse nFs) nConsole) nClock) nEnv) nProcess) nExit) nArgs) prog) noCompile) out) (B_dData_dMaybe.C_Maybe_Just (dtb__323))) pkg) dtb__324) o)
  | B_dData_dMaybe.C_Maybe_Just (dtb__337) -> ((v_withOpts o) ((v_usageErr nConsole) prog))
  | _ -> failwith "DT: impossible branch"
)))))))))
  | B_dData_dList.C_List_Nil -> ((((((((((((v_buildRun nFs) nConsole) nClock) nEnv) nProcess) nExit) nArgs) noCompile) (v_defaultDir dir)) out) pkg) o)
  | _ -> failwith "DT: impossible branch"
)))

# 1181 "Vuna/Compiler/Driver/CompilerCli.vuna"
let v_buildArgs = (fun (nFs : string) (nConsole : string) (nClock : string) (nEnv : string) (nProcess : string) (nExit : string) (nArgs : string) (prog : string) (args : string B_dData_dList.t_List) (o : t_CliOpts) -> ((((((((((((((v_buildParse nFs) nConsole) nClock) nEnv) nProcess) nExit) nArgs) prog) false) B_dData_dMaybe.C_Maybe_Nothing) B_dData_dMaybe.C_Maybe_Nothing) B_dData_dMaybe.C_Maybe_Nothing) args) o))

# 1561 "Vuna/Compiler/Driver/CompilerCli.vuna"
let rec v_stripLangGo = (fun (mc0 : string B_dData_dList.t_List) (mc1 : string B_dData_dList.t_List) (mc2 : string) -> (match mc0 with
  | B_dData_dList.C_List__x58__x58_ (dtb__338, dtb__339) -> (if (dtb__338 = "--lang") then (match dtb__339 with
  | B_dData_dList.C_List__x58__x58_ (dtb__340, dtb__341) -> (((v_stripLangGo dtb__341) mc1) dtb__340)
  | B_dData_dList.C_List_Nil -> { B_dData_dPair.f_Pair_first = (B_dData_dList.v_reverse mc1); B_dData_dPair.f_Pair_second = mc2 }
  | _ -> failwith "DT: impossible branch"
) else (if ((B_dData_dString.v_startsWith "--lang=") dtb__338) then (((v_stripLangGo dtb__339) mc1) (((B_dData_dString.v_substring (bi_natFromInt 7)) (bi_natFromInt ((String.length dtb__338) - 7))) dtb__338)) else (((v_stripLangGo dtb__339) (B_dData_dList.C_List__x58__x58_ (dtb__338, mc1))) mc2)))
  | B_dData_dList.C_List_Nil -> { B_dData_dPair.f_Pair_first = (B_dData_dList.v_reverse mc1); B_dData_dPair.f_Pair_second = mc2 }
  | _ -> failwith "DT: impossible branch"
))

# 1557 "Vuna/Compiler/Driver/CompilerCli.vuna"
let v_stripLang = (fun (args : string B_dData_dList.t_List) -> (((v_stripLangGo args) B_dData_dList.C_List_Nil) "en"))

# 1574 "Vuna/Compiler/Driver/CompilerCli.vuna"
let rec v_hasLangFlag = (fun (mc0 : string B_dData_dList.t_List) -> (match mc0 with
  | B_dData_dList.C_List__x58__x58_ (dtb__342, dtb__343) -> (if (if (dtb__342 = "--lang") then true else ((B_dData_dString.v_startsWith "--lang=") dtb__342)) then true else (v_hasLangFlag dtb__343))
  | B_dData_dList.C_List_Nil -> false
  | _ -> failwith "DT: impossible branch"
))

# 1582 "Vuna/Compiler/Driver/CompilerCli.vuna"
let rec v_stripContinueGo = (fun (mc0 : string B_dData_dList.t_List) (mc1 : string B_dData_dList.t_List) (mc2 : bool) -> (match mc0 with
  | B_dData_dList.C_List__x58__x58_ (dtb__344, dtb__345) -> (if (dtb__344 = "--continue-on-error") then (((v_stripContinueGo dtb__345) mc1) true) else (((v_stripContinueGo dtb__345) (B_dData_dList.C_List__x58__x58_ (dtb__344, mc1))) mc2))
  | B_dData_dList.C_List_Nil -> { B_dData_dPair.f_Pair_first = (B_dData_dList.v_reverse mc1); B_dData_dPair.f_Pair_second = mc2 }
  | _ -> failwith "DT: impossible branch"
))

# 1579 "Vuna/Compiler/Driver/CompilerCli.vuna"
let v_stripContinueOnError = (fun (args : string B_dData_dList.t_List) -> (((v_stripContinueGo args) B_dData_dList.C_List_Nil) false))

# 1626 "Vuna/Compiler/Driver/CompilerCli.vuna"
let v_printRecovered = (fun (nFs : string) (nConsole : string) (pkg : Frontend_dPackages_dPkg.t_Package) (e : Base_dDiag.t_Diagnostic) (ds : Base_dDiag.t_Diagnostic B_dData_dList.t_List) (o : t_CliOpts) -> (let shown = ((v_takeDiags (o).f_CliOpts_optMaxErrors) ds) in (((fun e k -> Obj.repr ((fun (u : B_dEffect_dCore.t_EffUnit) -> (let dtb__346 = Obj.obj (e) in (let dtb__347 = Obj.obj ((k (dtb__346 u))) in (dtb__347 u)))))) (((((v_printDiagList nFs) nConsole) o) (String.concat "" ["["; (Frontend_dPackages_dPkg.v_packageName pkg); "] "])) shown)) (fun r -> (if ((B_dData_dList.v_length shown) = 0) then (((((v_printDiagWithPrefix nFs) nConsole) (B_dData_dPair.v_secondOf r)) (String.concat "" ["["; (Frontend_dPackages_dPkg.v_packageName pkg); "] "])) e) else (let x = { B_dData_dPair.f_Pair_first = 1; B_dData_dPair.f_Pair_second = (B_dData_dPair.v_secondOf r) } in Obj.repr ((fun (_u : B_dEffect_dCore.t_EffUnit) -> x))))))))

# 1603 "Vuna/Compiler/Driver/CompilerCli.vuna"
let v_packageRecoverExe = (fun (nFs : string) (nConsole : string) (nEnv : string) (nProcess : string) (pkg : Frontend_dPackages_dPkg.t_Package) (e : Base_dDiag.t_Diagnostic) (o : t_CliOpts) -> (((fun e k -> Obj.repr ((fun (u : B_dEffect_dCore.t_EffUnit) -> (let dtb__348 = Obj.obj (e) in (let dtb__349 = Obj.obj ((k (dtb__348 u))) in (dtb__349 u)))))) (((((Driver_dDt.v_dtCheckRecovering nFs) nEnv) nProcess) ((Frontend_dPackages_dPkg.v_contextWithRelease (o).f_CliOpts_optRelease) (Frontend_dPackages_dPkg.v_packageContext pkg))) (Frontend_dPackages_dPkg.v_packageEntry pkg))) (fun recovered -> (match recovered with
  | Base_dDiag.C_Check_OkC (dtb__350) -> ((((((v_printRecovered nFs) nConsole) pkg) e) dtb__350) o)
  | Base_dDiag.C_Check_ErrC (dtb__351) -> (((((v_printDiagWithPrefix nFs) nConsole) o) (String.concat "" ["["; (Frontend_dPackages_dPkg.v_packageName pkg); "] "])) dtb__351)
  | _ -> failwith "DT: impossible branch"
))))

# 1613 "Vuna/Compiler/Driver/CompilerCli.vuna"
let v_packageRecoverLib = (fun (nFs : string) (nConsole : string) (nEnv : string) (nProcess : string) (pkg : Frontend_dPackages_dPkg.t_Package) (e : Base_dDiag.t_Diagnostic) (o : t_CliOpts) -> (match (Frontend_dPackages_dPkg.v_packageExports pkg) with
  | B_dData_dMaybe.C_Maybe_Just (dtb__352) -> (((fun e k -> Obj.repr ((fun (u : B_dEffect_dCore.t_EffUnit) -> (let dtb__353 = Obj.obj (e) in (let dtb__354 = Obj.obj ((k (dtb__353 u))) in (dtb__354 u)))))) (((((Driver_dDt.v_dtCheckLibraryRecovering nFs) nEnv) nProcess) ((Frontend_dPackages_dPkg.v_contextWithRelease (o).f_CliOpts_optRelease) (Frontend_dPackages_dPkg.v_packageContext pkg))) dtb__352)) (fun recovered -> (match recovered with
  | Base_dDiag.C_Check_OkC (dtb__355) -> ((((((v_printRecovered nFs) nConsole) pkg) e) dtb__355) o)
  | Base_dDiag.C_Check_ErrC (dtb__356) -> (((((v_printDiagWithPrefix nFs) nConsole) o) (String.concat "" ["["; (Frontend_dPackages_dPkg.v_packageName pkg); "] "])) dtb__356)
  | _ -> failwith "DT: impossible branch"
)))
  | B_dData_dMaybe.C_Maybe_Nothing -> (((((v_printDiagWithPrefix nFs) nConsole) o) (String.concat "" ["["; (Frontend_dPackages_dPkg.v_packageName pkg); "] "])) e)
  | _ -> failwith "DT: impossible branch"
))

# 1596 "Vuna/Compiler/Driver/CompilerCli.vuna"
let v_packageRecover = (fun (nFs : string) (nConsole : string) (nEnv : string) (nProcess : string) (pkg : Frontend_dPackages_dPkg.t_Package) (e : Base_dDiag.t_Diagnostic) (o : t_CliOpts) -> (((fun e k -> Obj.repr ((fun (u : B_dEffect_dCore.t_EffUnit) -> (let dtb__357 = Obj.obj (e) in (let dtb__358 = Obj.obj ((k (dtb__357 u))) in (dtb__358 u)))))) ((B_dEffect_dFs.v_fsFileExists nFs) (Frontend_dPackages_dPkg.v_packageEntry pkg))) (fun exists -> (if exists then (((((((v_packageRecoverExe nFs) nConsole) nEnv) nProcess) pkg) e) o) else (((((((v_packageRecoverLib nFs) nConsole) nEnv) nProcess) pkg) e) o)))))

# 1587 "Vuna/Compiler/Driver/CompilerCli.vuna"
let v_checkPackageErr = (fun (nFs : string) (nConsole : string) (nEnv : string) (nProcess : string) (pkg : Frontend_dPackages_dPkg.t_Package) (e : Base_dDiag.t_Diagnostic) (o : t_CliOpts) -> (if (o).f_CliOpts_optContinueOnError then (((((((v_packageRecover nFs) nConsole) nEnv) nProcess) pkg) e) o) else (((((v_printDiagWithPrefix nFs) nConsole) o) (String.concat "" ["["; (Frontend_dPackages_dPkg.v_packageName pkg); "] "])) e)))

# 1077 "Vuna/Compiler/Driver/CompilerCli.vuna"
let v_checkPackageCode = (fun (nFs : string) (nConsole : string) (nClock : string) (nEnv : string) (nProcess : string) (nExit : string) (nArgs : string) (pkg : Frontend_dPackages_dPkg.t_Package) (wantWarnings : bool) (o : t_CliOpts) -> (((fun e k -> Obj.repr ((fun (u : B_dEffect_dCore.t_EffUnit) -> (let dtb__359 = Obj.obj (e) in (let dtb__360 = Obj.obj ((k (dtb__359 u))) in (dtb__360 u)))))) (if (if (o).f_CliOpts_optExplain then (B_dData_dBool.v_not (v_isMachineFormat (o).f_CliOpts_optDiagFormat)) else false) then ((((((v_printExplainEff nFs) nConsole) nClock) nEnv) nProcess) pkg) else (let x = 0 in Obj.repr ((fun (_u : B_dEffect_dCore.t_EffUnit) -> x))))) (fun _u -> (((fun e k -> Obj.repr ((fun (u : B_dEffect_dCore.t_EffUnit) -> (let dtb__361 = Obj.obj (e) in (let dtb__362 = Obj.obj ((k (dtb__361 u))) in (dtb__362 u)))))) (((((((Driver_dCompile.v_checkPackage nFs) nClock) nEnv) nProcess) (o).f_CliOpts_optRelease) wantWarnings) pkg)) (fun r -> (match r with
  | Base_dDiag.C_Check_ErrC (dtb__363) -> (((((((v_checkPackageErr nFs) nConsole) nEnv) nProcess) pkg) dtb__363) o)
  | Base_dDiag.C_Check_OkC (dtb__364) -> (let ws = ((B_dData_dList.v_filter (v_ownedByPackage pkg)) (Base_dDiagnostics_dSink.v_dedupeWarnings dtb__364)) in (let shown = (if (if (o).f_CliOpts_optShowWarnings then true else (o).f_CliOpts_optDenyWarnings) then ws else B_dData_dList.C_List_Nil) in (let failed = (if (if (o).f_CliOpts_optDenyWarnings then ((B_dData_dList.v_length ws) > 0) else false) then 1 else 0) in (((fun e k -> Obj.repr ((fun (u : B_dEffect_dCore.t_EffUnit) -> (let dtb__365 = Obj.obj (e) in (let dtb__366 = Obj.obj ((k (dtb__365 u))) in (dtb__366 u)))))) (((((v_printDiagList nFs) nConsole) o) (String.concat "" ["["; (Frontend_dPackages_dPkg.v_packageName pkg); "] "])) shown)) (fun r1 -> (let x = { B_dData_dPair.f_Pair_first = failed; B_dData_dPair.f_Pair_second = (B_dData_dPair.v_secondOf r1) } in Obj.repr ((fun (_u : B_dEffect_dCore.t_EffUnit) -> x))))))))
  | _ -> failwith "DT: impossible branch"
))))))

# 1053 "Vuna/Compiler/Driver/CompilerCli.vuna"
let v_checkPackageSeq = (fun (nFs : string) (nConsole : string) (nClock : string) (nEnv : string) (nProcess : string) (nExit : string) (nArgs : string) (pkg : Frontend_dPackages_dPkg.t_Package) (code : int) (o : t_CliOpts) -> (let o1 = ((v_applyDiagConfig (B_dData_dMaybe.C_Maybe_Just (pkg))) o) in (let wantWarnings = (if (o1).f_CliOpts_optShowWarnings then true else (o1).f_CliOpts_optDenyWarnings) in (((fun e k -> Obj.repr ((fun (u : B_dEffect_dCore.t_EffUnit) -> (let dtb__367 = Obj.obj (e) in (let dtb__368 = Obj.obj ((k (dtb__367 u))) in (dtb__368 u)))))) ((((((((((v_checkPackageCode nFs) nConsole) nClock) nEnv) nProcess) nExit) nArgs) pkg) wantWarnings) o1)) (fun r -> (let x = { B_dData_dPair.f_Pair_first = (if ((B_dData_dPair.v_firstOf r) > code) then (B_dData_dPair.v_firstOf r) else code); B_dData_dPair.f_Pair_second = (B_dData_dPair.v_secondOf r) } in Obj.repr ((fun (_u : B_dEffect_dCore.t_EffUnit) -> x))))))))

# 1032 "Vuna/Compiler/Driver/CompilerCli.vuna"
let rec v_checkPkgsInProcess = (fun (nFs : string) (nConsole : string) (nClock : string) (nEnv : string) (nProcess : string) (nExit : string) (nArgs : string) (mc0 : Frontend_dPackages_dPkg.t_Package B_dData_dList.t_List) (mc1 : int) (mc2 : t_CliOpts) -> (match mc0 with
  | B_dData_dList.C_List__x58__x58_ (dtb__369, dtb__370) -> (((fun e k -> Obj.repr ((fun (u : B_dEffect_dCore.t_EffUnit) -> (let dtb__371 = Obj.obj (e) in (let dtb__372 = Obj.obj ((k (dtb__371 u))) in (dtb__372 u)))))) ((((((((((v_checkPackageSeq nFs) nConsole) nClock) nEnv) nProcess) nExit) nArgs) dtb__369) mc1) mc2)) (fun r -> ((((((((((v_checkPkgsInProcess nFs) nConsole) nClock) nEnv) nProcess) nExit) nArgs) dtb__370) (B_dData_dPair.v_firstOf r)) (B_dData_dPair.v_secondOf r))))
  | B_dData_dList.C_List_Nil -> (let x = { B_dData_dPair.f_Pair_first = mc1; B_dData_dPair.f_Pair_second = mc2 } in Obj.repr ((fun (_u : B_dEffect_dCore.t_EffUnit) -> x)))
  | _ -> failwith "DT: impossible branch"
))

# 1044 "Vuna/Compiler/Driver/CompilerCli.vuna"
let rec v_checkRootsSeq = (fun (nFs : string) (nConsole : string) (nClock : string) (nEnv : string) (nProcess : string) (nExit : string) (nArgs : string) (mc0 : Frontend_dPackages_dPkg.t_Package B_dData_dList.t_List) (mc1 : int) (mc2 : t_CliOpts) -> (match mc0 with
  | B_dData_dList.C_List__x58__x58_ (dtb__373, dtb__374) -> (((fun e k -> Obj.repr ((fun (u : B_dEffect_dCore.t_EffUnit) -> (let dtb__375 = Obj.obj (e) in (let dtb__376 = Obj.obj ((k (dtb__375 u))) in (dtb__376 u)))))) ((((((((((v_checkPackageSeq nFs) nConsole) nClock) nEnv) nProcess) nExit) nArgs) dtb__373) mc1) mc2)) (fun r -> (let code1 = (B_dData_dPair.v_firstOf r) in (if (if (mc2).f_CliOpts_optFailFast then (code1 <> 0) else false) then (let x = { B_dData_dPair.f_Pair_first = code1; B_dData_dPair.f_Pair_second = (B_dData_dPair.v_secondOf r) } in Obj.repr ((fun (_u : B_dEffect_dCore.t_EffUnit) -> x))) else ((((((((((v_checkRootsSeq nFs) nConsole) nClock) nEnv) nProcess) nExit) nArgs) dtb__374) code1) (B_dData_dPair.v_secondOf r))))))
  | B_dData_dList.C_List_Nil -> (let x = { B_dData_dPair.f_Pair_first = mc1; B_dData_dPair.f_Pair_second = mc2 } in Obj.repr ((fun (_u : B_dEffect_dCore.t_EffUnit) -> x)))
  | _ -> failwith "DT: impossible branch"
))

# 972 "Vuna/Compiler/Driver/CompilerCli.vuna"
let v_checkPackagesSpawn = (fun (nFs : string) (nConsole : string) (nClock : string) (nEnv : string) (nProcess : string) (nExit : string) (nArgs : string) (mc0 : Frontend_dPackages_dPkg.t_Package B_dData_dList.t_List) (mc1 : int) (mc2 : t_CliOpts) -> (match mc0 with
  | B_dData_dList.C_List_Nil -> (let x = { B_dData_dPair.f_Pair_first = mc1; B_dData_dPair.f_Pair_second = mc2 } in Obj.repr ((fun (_u : B_dEffect_dCore.t_EffUnit) -> x)))
  | _ -> (let members = ((B_dData_dList.v_filter (fun (p : Frontend_dPackages_dPkg.t_Package) -> (B_dData_dBool.v_not (v_isWorkspaceRoot p)))) mc0) in (let roots = ((B_dData_dList.v_filter v_isWorkspaceRoot) mc0) in (let memberNames = ((B_dData_dList.v_map Frontend_dPackages_dPkg.v_packageName) members) in (((fun e k -> Obj.repr ((fun (u : B_dEffect_dCore.t_EffUnit) -> (let dtb__377 = Obj.obj (e) in (let dtb__378 = Obj.obj ((k (dtb__377 u))) in (dtb__378 u)))))) ((((((((((v_checkRootsSeq nFs) nConsole) nClock) nEnv) nProcess) nExit) nArgs) roots) mc1) mc2)) (fun r1 -> (((((((((((((v_checkMembersByLevel nFs) nConsole) nClock) nEnv) nProcess) nExit) nArgs) (B_dData_dList.v_length members)) members) memberNames) B_dData_dList.C_List_Nil) (B_dData_dPair.v_firstOf r1)) (B_dData_dPair.v_secondOf r1)))))))
))

# 952 "Vuna/Compiler/Driver/CompilerCli.vuna"
let v_checkPackages = (fun (nFs : string) (nConsole : string) (nClock : string) (nEnv : string) (nProcess : string) (nExit : string) (nArgs : string) (mc0 : Frontend_dPackages_dPkg.t_Package B_dData_dList.t_List) (mc1 : int) (mc2 : t_CliOpts) -> (match mc0 with
  | B_dData_dList.C_List__x58__x58_ (dtb__379, dtb__380) -> (match dtb__380 with
  | B_dData_dList.C_List_Nil -> ((((((((((v_checkPackageSeq nFs) nConsole) nClock) nEnv) nProcess) nExit) nArgs) dtb__379) mc1) mc2)
  | _ -> (let oMachine = (v_markFormatExplicit mc2) in (if (v_isMachineFormat (mc2).f_CliOpts_optDiagFormat) then ((((((((((v_checkPkgsInProcess nFs) nConsole) nClock) nEnv) nProcess) nExit) nArgs) mc0) mc1) oMachine) else ((((((((((v_checkPackagesSpawn nFs) nConsole) nClock) nEnv) nProcess) nExit) nArgs) mc0) mc1) mc2)))
)
  | B_dData_dList.C_List_Nil -> (let x = { B_dData_dPair.f_Pair_first = mc1; B_dData_dPair.f_Pair_second = mc2 } in Obj.repr ((fun (_u : B_dEffect_dCore.t_EffUnit) -> x)))
  | _ -> failwith "DT: impossible branch"
))

# 911 "Vuna/Compiler/Driver/CompilerCli.vuna"
let v_checkPkgDir = (fun (nFs : string) (nConsole : string) (nClock : string) (nEnv : string) (nProcess : string) (nExit : string) (nArgs : string) (dir : string) (o : t_CliOpts) -> (((fun e k -> Obj.repr ((fun (u : B_dEffect_dCore.t_EffUnit) -> (let dtb__381 = Obj.obj (e) in (let dtb__382 = Obj.obj ((k (dtb__381 u))) in (dtb__382 u)))))) (((Frontend_dPackages_dPkg.v_workspacePackages nFs) nEnv) dir)) (fun pkgsR -> (match pkgsR with
  | Base_dDiag.C_Check_ErrC (dtb__383) -> ((((v_printDiag nFs) nConsole) o) dtb__383)
  | Base_dDiag.C_Check_OkC (dtb__384) -> ((((((((((v_checkPackages nFs) nConsole) nClock) nEnv) nProcess) nExit) nArgs) dtb__384) 0) o)
  | _ -> failwith "DT: impossible branch"
))))

# 900 "Vuna/Compiler/Driver/CompilerCli.vuna"
let v_checkEmit = (fun (nFs : string) (nConsole : string) (nClock : string) (nEnv : string) (nProcess : string) (nExit : string) (nArgs : string) (path : string) (o : t_CliOpts) -> (((fun e k -> Obj.repr ((fun (u : B_dEffect_dCore.t_EffUnit) -> (let dtb__385 = Obj.obj (e) in (let dtb__386 = Obj.obj ((k (dtb__385 u))) in (dtb__386 u)))))) ((B_dEffect_dFs.v_fsFileExists nFs) path)) (fun exists -> (if exists then (((fun e k -> Obj.repr ((fun (u : B_dEffect_dCore.t_EffUnit) -> (let dtb__387 = Obj.obj (e) in (let dtb__388 = Obj.obj ((k (dtb__387 u))) in (dtb__388 u)))))) ((B_dEffect_dFs.v_fsIsDirectory nFs) path)) (fun isDir -> (if isDir then (((((((((v_checkPkgDir nFs) nConsole) nClock) nEnv) nProcess) nExit) nArgs) path) o) else ((((((v_checkFileEntry nFs) nConsole) nEnv) nProcess) path) o)))) else ((v_withOpts o) ((v_dtPathErr nConsole) path))))))

# 887 "Vuna/Compiler/Driver/CompilerCli.vuna"
let rec v_checkArgs = (fun (nFs : string) (nConsole : string) (nClock : string) (nEnv : string) (nProcess : string) (nExit : string) (nArgs : string) (mc0 : string) (mc1 : string B_dData_dList.t_List) (mc2 : t_CliOpts) -> (match mc1 with
  | B_dData_dList.C_List__x58__x58_ (dtb__389, dtb__390) -> (if (dtb__389 = "--release") then ((((((((((v_checkArgs nFs) nConsole) nClock) nEnv) nProcess) nExit) nArgs) mc0) dtb__390) (v_markRelease mc2)) else (if (dtb__389 = "--explain") then ((((((((((v_checkArgs nFs) nConsole) nClock) nEnv) nProcess) nExit) nArgs) mc0) dtb__390) (v_markExplain mc2)) else (if ((B_dData_dString.v_startsWith "-") dtb__389) then ((v_withOpts mc2) (((v_removedFlag nConsole) mc0) dtb__389)) else (match dtb__390 with
  | B_dData_dList.C_List_Nil -> (((((((((v_checkEmit nFs) nConsole) nClock) nEnv) nProcess) nExit) nArgs) dtb__389) mc2)
  | _ -> ((v_withOpts mc2) ((v_usageErr nConsole) mc0))
))))
  | B_dData_dList.C_List_Nil -> ((v_withOpts mc2) ((v_usageErr nConsole) mc0))
  | _ -> failwith "DT: impossible branch"
))

# 577 "Vuna/Compiler/Driver/CompilerCli.vuna"
let v_runCompilerCliFor1 = (fun (nFs : string) (nConsole : string) (nClock : string) (nEnv : string) (nProcess : string) (nExit : string) (nArgs : string) (nTty : string) (prog : string) (args : string B_dData_dList.t_List) (o : t_CliOpts) -> (match args with
  | B_dData_dList.C_List_Nil -> ((v_withOpts o) ((v_usageErr nConsole) prog))
  | B_dData_dList.C_List__x58__x58_ (dtb__391, dtb__392) -> (if (dtb__391 = "compile") then ((((((((v_compileArgs nFs) nConsole) nClock) nEnv) nProcess) prog) dtb__392) o) else (if (dtb__391 = "check") then ((((((((((v_checkArgs nFs) nConsole) nClock) nEnv) nProcess) nExit) nArgs) prog) dtb__392) o) else (if (dtb__391 = "build") then ((((((((((v_buildArgs nFs) nConsole) nClock) nEnv) nProcess) nExit) nArgs) prog) dtb__392) o) else (if (dtb__391 = "version") then ((v_withOpts o) ((v_printVersion nConsole) 0)) else (if (dtb__391 = "--version") then ((v_withOpts o) ((v_printVersion nConsole) 0)) else (if (dtb__391 = "seed") then ((v_withOpts o) ((((v_removedCommand nConsole) prog) "seed") "use build --out OUT [DIR] or compile DIR OUT")) else (if (dtb__391 = "help") then ((v_withOpts o) ((v_helpFor nConsole) prog)) else (if ((B_dData_dString.v_startsWith "-") dtb__391) then ((v_withOpts o) (((v_removedFlag nConsole) prog) dtb__391)) else ((v_withOpts o) (((v_unknownCommand nConsole) prog) dtb__391))))))))))
  | _ -> failwith "DT: impossible branch"
))

# 511 "Vuna/Compiler/Driver/CompilerCli.vuna"
let v_runCompilerCliFor = (fun (nFs : string) (nConsole : string) (nClock : string) (nEnv : string) (nProcess : string) (nExit : string) (nArgs : string) (nTty : string) (prog : string) (args : string B_dData_dList.t_List) -> (((fun e k -> Obj.repr ((fun (u : B_dEffect_dCore.t_EffUnit) -> (let dtb__393 = Obj.obj (e) in (let dtb__394 = Obj.obj ((k (dtb__393 u))) in (dtb__394 u)))))) ((B_dEffect_dEnv.v_envGetEnv nEnv) "VUNA_RELEASE")) (fun envRel -> (((fun e k -> Obj.repr ((fun (u : B_dEffect_dCore.t_EffUnit) -> (let dtb__395 = Obj.obj (e) in (let dtb__396 = Obj.obj ((k (dtb__395 u))) in (dtb__396 u)))))) (B_dEffect_dTty.v_ttyIsTty nTty)) (fun tty -> (let stripped = (v_stripDiagFormat args) in (let strippedLang = (v_stripLang (B_dData_dPair.v_firstOf stripped)) in (let strippedMax = (v_stripMaxErrors (B_dData_dPair.v_firstOf strippedLang)) in (let kept = (v_stripDenyWarnings (B_dData_dPair.v_firstOf strippedMax)) in (let strippedContinue = (v_stripContinueOnError kept) in (let detectedLang = (B_dData_dPair.v_secondOf strippedLang) in (let fmt = (match (B_dData_dPair.v_secondOf stripped) with
  | B_dData_dMaybe.C_Maybe_Just (dtb__399) -> dtb__399
  | B_dData_dMaybe.C_Maybe_Nothing -> (if (detectedLang = "en") then (if tty then "human" else "short") else "human")
  | _ -> failwith "DT: impossible branch"
) in (let opts = { f_CliOpts_optDiagFormat = fmt; f_CliOpts_optDiagLang = detectedLang; f_CliOpts_optLangExplicit = (v_hasLangFlag args); f_CliOpts_optDenyWarnings = (v_hasDenyWarnings args); f_CliOpts_optShowWarnings = (if (v_hasDenyWarnings args) then true else (v_hasShowWarnings args)); f_CliOpts_optFormatExplicit = (v_hasFormatFlag args); f_CliOpts_optWarningsExplicit = (if (v_hasDenyWarnings args) then true else (v_hasShowWarnings args)); f_CliOpts_optDenyExplicit = (v_hasDenyWarnings args); f_CliOpts_optMaxErrors = (B_dData_dPair.v_secondOf strippedMax); f_CliOpts_optContinueOnError = (B_dData_dPair.v_secondOf strippedContinue); f_CliOpts_optSarifItems = B_dData_dList.C_List_Nil; f_CliOpts_optRelease = (envRel = "1"); f_CliOpts_optShowCascade = (v_hasShowCascade args); f_CliOpts_optWithSources = (v_hasWithSources args); f_CliOpts_optFailFast = (v_hasFailFast args); f_CliOpts_optTarget = "ocaml"; f_CliOpts_optWasmOpt = 3; f_CliOpts_optExplain = false } in (if (v_anyHelp (B_dData_dPair.v_firstOf strippedContinue)) then ((v_helpFor nConsole) prog) else (((fun e k -> Obj.repr ((fun (u : B_dEffect_dCore.t_EffUnit) -> (let dtb__397 = Obj.obj (e) in (let dtb__398 = Obj.obj ((k (dtb__397 u))) in (dtb__398 u)))))) (((((((((((v_runCompilerCliFor1 nFs) nConsole) nClock) nEnv) nProcess) nExit) nArgs) nTty) prog) (v_stripFailFast (v_stripWithSources (v_stripShowCascade (B_dData_dPair.v_firstOf strippedContinue))))) opts)) (fun r -> (((((v_flushSarif nFs) nConsole) nEnv) (B_dData_dPair.v_firstOf r)) (B_dData_dPair.v_secondOf r))))))))))))))))))

# 69 "Vuna/Compiler/Driver/CompilerCli.vuna"
let v_runCompilerCli = (fun (nFs : string) (nConsole : string) (nClock : string) (nEnv : string) (nProcess : string) (nExit : string) (nArgs : string) (nTty : string) (args : string B_dData_dList.t_List) -> ((((((((((v_runCompilerCliFor nFs) nConsole) nClock) nEnv) nProcess) nExit) nArgs) nTty) "vuna") args))

# 73 "Vuna/Compiler/Driver/CompilerCli.vuna"
let v_optDiagFormat = (fun (p : t_CliOpts) -> (match p with
  | { f_CliOpts_optDiagFormat = dtb__400; f_CliOpts_optDiagLang = dtb__401; f_CliOpts_optLangExplicit = dtb__402; f_CliOpts_optDenyWarnings = dtb__403; f_CliOpts_optShowWarnings = dtb__404; f_CliOpts_optFormatExplicit = dtb__405; f_CliOpts_optWarningsExplicit = dtb__406; f_CliOpts_optDenyExplicit = dtb__407; f_CliOpts_optMaxErrors = dtb__408; f_CliOpts_optContinueOnError = dtb__409; f_CliOpts_optSarifItems = dtb__410; f_CliOpts_optRelease = dtb__411; f_CliOpts_optShowCascade = dtb__412; f_CliOpts_optWithSources = dtb__413; f_CliOpts_optFailFast = dtb__414; f_CliOpts_optTarget = dtb__415; f_CliOpts_optWasmOpt = dtb__416; f_CliOpts_optExplain = dtb__417 } -> dtb__400
  | _ -> failwith "DT: impossible branch"
))

# 74 "Vuna/Compiler/Driver/CompilerCli.vuna"
let v_optDiagLang = (fun (p : t_CliOpts) -> (match p with
  | { f_CliOpts_optDiagFormat = dtb__418; f_CliOpts_optDiagLang = dtb__419; f_CliOpts_optLangExplicit = dtb__420; f_CliOpts_optDenyWarnings = dtb__421; f_CliOpts_optShowWarnings = dtb__422; f_CliOpts_optFormatExplicit = dtb__423; f_CliOpts_optWarningsExplicit = dtb__424; f_CliOpts_optDenyExplicit = dtb__425; f_CliOpts_optMaxErrors = dtb__426; f_CliOpts_optContinueOnError = dtb__427; f_CliOpts_optSarifItems = dtb__428; f_CliOpts_optRelease = dtb__429; f_CliOpts_optShowCascade = dtb__430; f_CliOpts_optWithSources = dtb__431; f_CliOpts_optFailFast = dtb__432; f_CliOpts_optTarget = dtb__433; f_CliOpts_optWasmOpt = dtb__434; f_CliOpts_optExplain = dtb__435 } -> dtb__419
  | _ -> failwith "DT: impossible branch"
))

# 75 "Vuna/Compiler/Driver/CompilerCli.vuna"
let v_optLangExplicit = (fun (p : t_CliOpts) -> (match p with
  | { f_CliOpts_optDiagFormat = dtb__436; f_CliOpts_optDiagLang = dtb__437; f_CliOpts_optLangExplicit = dtb__438; f_CliOpts_optDenyWarnings = dtb__439; f_CliOpts_optShowWarnings = dtb__440; f_CliOpts_optFormatExplicit = dtb__441; f_CliOpts_optWarningsExplicit = dtb__442; f_CliOpts_optDenyExplicit = dtb__443; f_CliOpts_optMaxErrors = dtb__444; f_CliOpts_optContinueOnError = dtb__445; f_CliOpts_optSarifItems = dtb__446; f_CliOpts_optRelease = dtb__447; f_CliOpts_optShowCascade = dtb__448; f_CliOpts_optWithSources = dtb__449; f_CliOpts_optFailFast = dtb__450; f_CliOpts_optTarget = dtb__451; f_CliOpts_optWasmOpt = dtb__452; f_CliOpts_optExplain = dtb__453 } -> dtb__438
  | _ -> failwith "DT: impossible branch"
))

# 76 "Vuna/Compiler/Driver/CompilerCli.vuna"
let v_optDenyWarnings = (fun (p : t_CliOpts) -> (match p with
  | { f_CliOpts_optDiagFormat = dtb__454; f_CliOpts_optDiagLang = dtb__455; f_CliOpts_optLangExplicit = dtb__456; f_CliOpts_optDenyWarnings = dtb__457; f_CliOpts_optShowWarnings = dtb__458; f_CliOpts_optFormatExplicit = dtb__459; f_CliOpts_optWarningsExplicit = dtb__460; f_CliOpts_optDenyExplicit = dtb__461; f_CliOpts_optMaxErrors = dtb__462; f_CliOpts_optContinueOnError = dtb__463; f_CliOpts_optSarifItems = dtb__464; f_CliOpts_optRelease = dtb__465; f_CliOpts_optShowCascade = dtb__466; f_CliOpts_optWithSources = dtb__467; f_CliOpts_optFailFast = dtb__468; f_CliOpts_optTarget = dtb__469; f_CliOpts_optWasmOpt = dtb__470; f_CliOpts_optExplain = dtb__471 } -> dtb__457
  | _ -> failwith "DT: impossible branch"
))

# 77 "Vuna/Compiler/Driver/CompilerCli.vuna"
let v_optShowWarnings = (fun (p : t_CliOpts) -> (match p with
  | { f_CliOpts_optDiagFormat = dtb__472; f_CliOpts_optDiagLang = dtb__473; f_CliOpts_optLangExplicit = dtb__474; f_CliOpts_optDenyWarnings = dtb__475; f_CliOpts_optShowWarnings = dtb__476; f_CliOpts_optFormatExplicit = dtb__477; f_CliOpts_optWarningsExplicit = dtb__478; f_CliOpts_optDenyExplicit = dtb__479; f_CliOpts_optMaxErrors = dtb__480; f_CliOpts_optContinueOnError = dtb__481; f_CliOpts_optSarifItems = dtb__482; f_CliOpts_optRelease = dtb__483; f_CliOpts_optShowCascade = dtb__484; f_CliOpts_optWithSources = dtb__485; f_CliOpts_optFailFast = dtb__486; f_CliOpts_optTarget = dtb__487; f_CliOpts_optWasmOpt = dtb__488; f_CliOpts_optExplain = dtb__489 } -> dtb__476
  | _ -> failwith "DT: impossible branch"
))

# 78 "Vuna/Compiler/Driver/CompilerCli.vuna"
let v_optFormatExplicit = (fun (p : t_CliOpts) -> (match p with
  | { f_CliOpts_optDiagFormat = dtb__490; f_CliOpts_optDiagLang = dtb__491; f_CliOpts_optLangExplicit = dtb__492; f_CliOpts_optDenyWarnings = dtb__493; f_CliOpts_optShowWarnings = dtb__494; f_CliOpts_optFormatExplicit = dtb__495; f_CliOpts_optWarningsExplicit = dtb__496; f_CliOpts_optDenyExplicit = dtb__497; f_CliOpts_optMaxErrors = dtb__498; f_CliOpts_optContinueOnError = dtb__499; f_CliOpts_optSarifItems = dtb__500; f_CliOpts_optRelease = dtb__501; f_CliOpts_optShowCascade = dtb__502; f_CliOpts_optWithSources = dtb__503; f_CliOpts_optFailFast = dtb__504; f_CliOpts_optTarget = dtb__505; f_CliOpts_optWasmOpt = dtb__506; f_CliOpts_optExplain = dtb__507 } -> dtb__495
  | _ -> failwith "DT: impossible branch"
))

# 79 "Vuna/Compiler/Driver/CompilerCli.vuna"
let v_optWarningsExplicit = (fun (p : t_CliOpts) -> (match p with
  | { f_CliOpts_optDiagFormat = dtb__508; f_CliOpts_optDiagLang = dtb__509; f_CliOpts_optLangExplicit = dtb__510; f_CliOpts_optDenyWarnings = dtb__511; f_CliOpts_optShowWarnings = dtb__512; f_CliOpts_optFormatExplicit = dtb__513; f_CliOpts_optWarningsExplicit = dtb__514; f_CliOpts_optDenyExplicit = dtb__515; f_CliOpts_optMaxErrors = dtb__516; f_CliOpts_optContinueOnError = dtb__517; f_CliOpts_optSarifItems = dtb__518; f_CliOpts_optRelease = dtb__519; f_CliOpts_optShowCascade = dtb__520; f_CliOpts_optWithSources = dtb__521; f_CliOpts_optFailFast = dtb__522; f_CliOpts_optTarget = dtb__523; f_CliOpts_optWasmOpt = dtb__524; f_CliOpts_optExplain = dtb__525 } -> dtb__514
  | _ -> failwith "DT: impossible branch"
))

# 80 "Vuna/Compiler/Driver/CompilerCli.vuna"
let v_optDenyExplicit = (fun (p : t_CliOpts) -> (match p with
  | { f_CliOpts_optDiagFormat = dtb__526; f_CliOpts_optDiagLang = dtb__527; f_CliOpts_optLangExplicit = dtb__528; f_CliOpts_optDenyWarnings = dtb__529; f_CliOpts_optShowWarnings = dtb__530; f_CliOpts_optFormatExplicit = dtb__531; f_CliOpts_optWarningsExplicit = dtb__532; f_CliOpts_optDenyExplicit = dtb__533; f_CliOpts_optMaxErrors = dtb__534; f_CliOpts_optContinueOnError = dtb__535; f_CliOpts_optSarifItems = dtb__536; f_CliOpts_optRelease = dtb__537; f_CliOpts_optShowCascade = dtb__538; f_CliOpts_optWithSources = dtb__539; f_CliOpts_optFailFast = dtb__540; f_CliOpts_optTarget = dtb__541; f_CliOpts_optWasmOpt = dtb__542; f_CliOpts_optExplain = dtb__543 } -> dtb__533
  | _ -> failwith "DT: impossible branch"
))

# 81 "Vuna/Compiler/Driver/CompilerCli.vuna"
let v_optMaxErrors = (fun (p : t_CliOpts) -> (match p with
  | { f_CliOpts_optDiagFormat = dtb__544; f_CliOpts_optDiagLang = dtb__545; f_CliOpts_optLangExplicit = dtb__546; f_CliOpts_optDenyWarnings = dtb__547; f_CliOpts_optShowWarnings = dtb__548; f_CliOpts_optFormatExplicit = dtb__549; f_CliOpts_optWarningsExplicit = dtb__550; f_CliOpts_optDenyExplicit = dtb__551; f_CliOpts_optMaxErrors = dtb__552; f_CliOpts_optContinueOnError = dtb__553; f_CliOpts_optSarifItems = dtb__554; f_CliOpts_optRelease = dtb__555; f_CliOpts_optShowCascade = dtb__556; f_CliOpts_optWithSources = dtb__557; f_CliOpts_optFailFast = dtb__558; f_CliOpts_optTarget = dtb__559; f_CliOpts_optWasmOpt = dtb__560; f_CliOpts_optExplain = dtb__561 } -> dtb__552
  | _ -> failwith "DT: impossible branch"
))

# 82 "Vuna/Compiler/Driver/CompilerCli.vuna"
let v_optContinueOnError = (fun (p : t_CliOpts) -> (match p with
  | { f_CliOpts_optDiagFormat = dtb__562; f_CliOpts_optDiagLang = dtb__563; f_CliOpts_optLangExplicit = dtb__564; f_CliOpts_optDenyWarnings = dtb__565; f_CliOpts_optShowWarnings = dtb__566; f_CliOpts_optFormatExplicit = dtb__567; f_CliOpts_optWarningsExplicit = dtb__568; f_CliOpts_optDenyExplicit = dtb__569; f_CliOpts_optMaxErrors = dtb__570; f_CliOpts_optContinueOnError = dtb__571; f_CliOpts_optSarifItems = dtb__572; f_CliOpts_optRelease = dtb__573; f_CliOpts_optShowCascade = dtb__574; f_CliOpts_optWithSources = dtb__575; f_CliOpts_optFailFast = dtb__576; f_CliOpts_optTarget = dtb__577; f_CliOpts_optWasmOpt = dtb__578; f_CliOpts_optExplain = dtb__579 } -> dtb__571
  | _ -> failwith "DT: impossible branch"
))

# 83 "Vuna/Compiler/Driver/CompilerCli.vuna"
let v_optSarifItems = (fun (p : t_CliOpts) -> (match p with
  | { f_CliOpts_optDiagFormat = dtb__580; f_CliOpts_optDiagLang = dtb__581; f_CliOpts_optLangExplicit = dtb__582; f_CliOpts_optDenyWarnings = dtb__583; f_CliOpts_optShowWarnings = dtb__584; f_CliOpts_optFormatExplicit = dtb__585; f_CliOpts_optWarningsExplicit = dtb__586; f_CliOpts_optDenyExplicit = dtb__587; f_CliOpts_optMaxErrors = dtb__588; f_CliOpts_optContinueOnError = dtb__589; f_CliOpts_optSarifItems = dtb__590; f_CliOpts_optRelease = dtb__591; f_CliOpts_optShowCascade = dtb__592; f_CliOpts_optWithSources = dtb__593; f_CliOpts_optFailFast = dtb__594; f_CliOpts_optTarget = dtb__595; f_CliOpts_optWasmOpt = dtb__596; f_CliOpts_optExplain = dtb__597 } -> dtb__590
  | _ -> failwith "DT: impossible branch"
))

# 84 "Vuna/Compiler/Driver/CompilerCli.vuna"
let v_optRelease = (fun (p : t_CliOpts) -> (match p with
  | { f_CliOpts_optDiagFormat = dtb__598; f_CliOpts_optDiagLang = dtb__599; f_CliOpts_optLangExplicit = dtb__600; f_CliOpts_optDenyWarnings = dtb__601; f_CliOpts_optShowWarnings = dtb__602; f_CliOpts_optFormatExplicit = dtb__603; f_CliOpts_optWarningsExplicit = dtb__604; f_CliOpts_optDenyExplicit = dtb__605; f_CliOpts_optMaxErrors = dtb__606; f_CliOpts_optContinueOnError = dtb__607; f_CliOpts_optSarifItems = dtb__608; f_CliOpts_optRelease = dtb__609; f_CliOpts_optShowCascade = dtb__610; f_CliOpts_optWithSources = dtb__611; f_CliOpts_optFailFast = dtb__612; f_CliOpts_optTarget = dtb__613; f_CliOpts_optWasmOpt = dtb__614; f_CliOpts_optExplain = dtb__615 } -> dtb__609
  | _ -> failwith "DT: impossible branch"
))

# 85 "Vuna/Compiler/Driver/CompilerCli.vuna"
let v_optShowCascade = (fun (p : t_CliOpts) -> (match p with
  | { f_CliOpts_optDiagFormat = dtb__616; f_CliOpts_optDiagLang = dtb__617; f_CliOpts_optLangExplicit = dtb__618; f_CliOpts_optDenyWarnings = dtb__619; f_CliOpts_optShowWarnings = dtb__620; f_CliOpts_optFormatExplicit = dtb__621; f_CliOpts_optWarningsExplicit = dtb__622; f_CliOpts_optDenyExplicit = dtb__623; f_CliOpts_optMaxErrors = dtb__624; f_CliOpts_optContinueOnError = dtb__625; f_CliOpts_optSarifItems = dtb__626; f_CliOpts_optRelease = dtb__627; f_CliOpts_optShowCascade = dtb__628; f_CliOpts_optWithSources = dtb__629; f_CliOpts_optFailFast = dtb__630; f_CliOpts_optTarget = dtb__631; f_CliOpts_optWasmOpt = dtb__632; f_CliOpts_optExplain = dtb__633 } -> dtb__628
  | _ -> failwith "DT: impossible branch"
))

# 86 "Vuna/Compiler/Driver/CompilerCli.vuna"
let v_optWithSources = (fun (p : t_CliOpts) -> (match p with
  | { f_CliOpts_optDiagFormat = dtb__634; f_CliOpts_optDiagLang = dtb__635; f_CliOpts_optLangExplicit = dtb__636; f_CliOpts_optDenyWarnings = dtb__637; f_CliOpts_optShowWarnings = dtb__638; f_CliOpts_optFormatExplicit = dtb__639; f_CliOpts_optWarningsExplicit = dtb__640; f_CliOpts_optDenyExplicit = dtb__641; f_CliOpts_optMaxErrors = dtb__642; f_CliOpts_optContinueOnError = dtb__643; f_CliOpts_optSarifItems = dtb__644; f_CliOpts_optRelease = dtb__645; f_CliOpts_optShowCascade = dtb__646; f_CliOpts_optWithSources = dtb__647; f_CliOpts_optFailFast = dtb__648; f_CliOpts_optTarget = dtb__649; f_CliOpts_optWasmOpt = dtb__650; f_CliOpts_optExplain = dtb__651 } -> dtb__647
  | _ -> failwith "DT: impossible branch"
))

# 87 "Vuna/Compiler/Driver/CompilerCli.vuna"
let v_optFailFast = (fun (p : t_CliOpts) -> (match p with
  | { f_CliOpts_optDiagFormat = dtb__652; f_CliOpts_optDiagLang = dtb__653; f_CliOpts_optLangExplicit = dtb__654; f_CliOpts_optDenyWarnings = dtb__655; f_CliOpts_optShowWarnings = dtb__656; f_CliOpts_optFormatExplicit = dtb__657; f_CliOpts_optWarningsExplicit = dtb__658; f_CliOpts_optDenyExplicit = dtb__659; f_CliOpts_optMaxErrors = dtb__660; f_CliOpts_optContinueOnError = dtb__661; f_CliOpts_optSarifItems = dtb__662; f_CliOpts_optRelease = dtb__663; f_CliOpts_optShowCascade = dtb__664; f_CliOpts_optWithSources = dtb__665; f_CliOpts_optFailFast = dtb__666; f_CliOpts_optTarget = dtb__667; f_CliOpts_optWasmOpt = dtb__668; f_CliOpts_optExplain = dtb__669 } -> dtb__666
  | _ -> failwith "DT: impossible branch"
))

# 88 "Vuna/Compiler/Driver/CompilerCli.vuna"
let v_optTarget = (fun (p : t_CliOpts) -> (match p with
  | { f_CliOpts_optDiagFormat = dtb__670; f_CliOpts_optDiagLang = dtb__671; f_CliOpts_optLangExplicit = dtb__672; f_CliOpts_optDenyWarnings = dtb__673; f_CliOpts_optShowWarnings = dtb__674; f_CliOpts_optFormatExplicit = dtb__675; f_CliOpts_optWarningsExplicit = dtb__676; f_CliOpts_optDenyExplicit = dtb__677; f_CliOpts_optMaxErrors = dtb__678; f_CliOpts_optContinueOnError = dtb__679; f_CliOpts_optSarifItems = dtb__680; f_CliOpts_optRelease = dtb__681; f_CliOpts_optShowCascade = dtb__682; f_CliOpts_optWithSources = dtb__683; f_CliOpts_optFailFast = dtb__684; f_CliOpts_optTarget = dtb__685; f_CliOpts_optWasmOpt = dtb__686; f_CliOpts_optExplain = dtb__687 } -> dtb__685
  | _ -> failwith "DT: impossible branch"
))

# 89 "Vuna/Compiler/Driver/CompilerCli.vuna"
let v_optWasmOpt = (fun (p : t_CliOpts) -> (match p with
  | { f_CliOpts_optDiagFormat = dtb__688; f_CliOpts_optDiagLang = dtb__689; f_CliOpts_optLangExplicit = dtb__690; f_CliOpts_optDenyWarnings = dtb__691; f_CliOpts_optShowWarnings = dtb__692; f_CliOpts_optFormatExplicit = dtb__693; f_CliOpts_optWarningsExplicit = dtb__694; f_CliOpts_optDenyExplicit = dtb__695; f_CliOpts_optMaxErrors = dtb__696; f_CliOpts_optContinueOnError = dtb__697; f_CliOpts_optSarifItems = dtb__698; f_CliOpts_optRelease = dtb__699; f_CliOpts_optShowCascade = dtb__700; f_CliOpts_optWithSources = dtb__701; f_CliOpts_optFailFast = dtb__702; f_CliOpts_optTarget = dtb__703; f_CliOpts_optWasmOpt = dtb__704; f_CliOpts_optExplain = dtb__705 } -> dtb__704
  | _ -> failwith "DT: impossible branch"
))

# 90 "Vuna/Compiler/Driver/CompilerCli.vuna"
let v_optExplain = (fun (p : t_CliOpts) -> (match p with
  | { f_CliOpts_optDiagFormat = dtb__706; f_CliOpts_optDiagLang = dtb__707; f_CliOpts_optLangExplicit = dtb__708; f_CliOpts_optDenyWarnings = dtb__709; f_CliOpts_optShowWarnings = dtb__710; f_CliOpts_optFormatExplicit = dtb__711; f_CliOpts_optWarningsExplicit = dtb__712; f_CliOpts_optDenyExplicit = dtb__713; f_CliOpts_optMaxErrors = dtb__714; f_CliOpts_optContinueOnError = dtb__715; f_CliOpts_optSarifItems = dtb__716; f_CliOpts_optRelease = dtb__717; f_CliOpts_optShowCascade = dtb__718; f_CliOpts_optWithSources = dtb__719; f_CliOpts_optFailFast = dtb__720; f_CliOpts_optTarget = dtb__721; f_CliOpts_optWasmOpt = dtb__722; f_CliOpts_optExplain = dtb__723 } -> dtb__723
  | _ -> failwith "DT: impossible branch"
))
