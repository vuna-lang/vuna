open Vuna_runtime
type t_Vuna_dCompiler_dDriver_dCompilerCli_dCliOpts = { f_Vuna_dCompiler_dDriver_dCompilerCli_dCliOpts_optDiagFormat : string; f_Vuna_dCompiler_dDriver_dCompilerCli_dCliOpts_optDiagLang : string; f_Vuna_dCompiler_dDriver_dCompilerCli_dCliOpts_optLangExplicit : bool; f_Vuna_dCompiler_dDriver_dCompilerCli_dCliOpts_optDenyWarnings : bool; f_Vuna_dCompiler_dDriver_dCompilerCli_dCliOpts_optShowWarnings : bool; f_Vuna_dCompiler_dDriver_dCompilerCli_dCliOpts_optFormatExplicit : bool; f_Vuna_dCompiler_dDriver_dCompilerCli_dCliOpts_optWarningsExplicit : bool; f_Vuna_dCompiler_dDriver_dCompilerCli_dCliOpts_optDenyExplicit : bool; f_Vuna_dCompiler_dDriver_dCompilerCli_dCliOpts_optMaxErrors : int; f_Vuna_dCompiler_dDriver_dCompilerCli_dCliOpts_optContinueOnError : bool; f_Vuna_dCompiler_dDriver_dCompilerCli_dCliOpts_optSarifItems : Vuna_dCompiler_dBase_dDiag.t_Vuna_dCompiler_dBase_dDiag_dDiagnostic Base_dList.t_Base_dList_dList; f_Vuna_dCompiler_dDriver_dCompilerCli_dCliOpts_optRelease : bool; f_Vuna_dCompiler_dDriver_dCompilerCli_dCliOpts_optShowCascade : bool; f_Vuna_dCompiler_dDriver_dCompilerCli_dCliOpts_optWithSources : bool; f_Vuna_dCompiler_dDriver_dCompilerCli_dCliOpts_optFailFast : bool; f_Vuna_dCompiler_dDriver_dCompilerCli_dCliOpts_optTarget : string }

# 40 "Vuna/Compiler/Driver/CompilerCli.vuna"
let v_Vuna_dCompiler_dDriver_dCompilerCli_dcompilerUsageLines = (fun prog -> (String.concat "" ["  "; prog; " compile [--no-print] [--release] [--target ocaml|wasm|native] (<entry.vuna> | <package-dir>) <out-dir>\n  "; prog; " check [--release] [--continue-on-error] (<file.vuna> | <package-dir>)\n  <file.vuna>            \229\184\166 module \229\164\180\230\151\182\230\140\137\229\186\147\230\168\161\229\157\151\230\163\128\230\159\165\239\188\136\229\140\133\228\184\138\228\184\139\230\150\135\239\188\137\239\188\140\229\144\166\229\136\153\230\140\137\229\133\165\229\143\163\230\150\135\228\187\182\n  "; prog; " build [--release] [--no-compile] [--out DIR] [--package NAME] [--target ocaml|wasm|native] [DIR]\n  --no-print             \231\188\150\232\175\145\231\148\159\230\136\144\231\154\132\231\168\139\229\186\143\228\184\141\230\137\147\229\141\176 main \231\187\147\230\158\156\239\188\136\233\187\152\232\174\164\230\137\147\229\141\176\239\188\137\n  --release              \229\143\145\229\184\131\230\158\132\229\187\186\239\188\154\230\139\146\231\187\157 assert / todo \231\173\137\232\176\131\232\175\149\228\184\147\231\148\168\230\158\132\233\128\160\n  --continue-on-error    \229\164\154\233\148\153\232\175\175\239\188\154\233\128\144\228\184\170\229\174\154\228\185\137\230\148\182\233\155\134\239\188\136\229\164\177\232\180\165\229\174\154\228\185\137\229\155\158\230\187\154\229\144\142\232\183\179\232\191\135\239\188\155\228\187\133\229\133\165\229\143\163\230\150\135\228\187\182\230\136\150\229\186\147\229\140\133\239\188\137\n  "; prog; " version, --version  \230\152\190\231\164\186\231\137\136\230\156\172\n  "; prog; " help, -h\n"]))

# 52 "Vuna/Compiler/Driver/CompilerCli.vuna"
let v_Vuna_dCompiler_dDriver_dCompilerCli_dcompilerUsage = (fun prog -> ("usage:\n" ^ (v_Vuna_dCompiler_dDriver_dCompilerCli_dcompilerUsageLines prog)))

# 56 "Vuna/Compiler/Driver/CompilerCli.vuna"
let rec v_Vuna_dCompiler_dDriver_dCompilerCli_dmapEff = (fun mc0 mc1 -> (match mc1 with
  | Base_dList.C_Base_dList_dList__x58__x58_ (dtb__0, dtb__1) -> (((Base_dMonad.v_Base_dMonad_d_x62__x62__x61_ Base_dEff.v_Monad_uBase_uEff_uEff_ur) (mc0 dtb__0)) (fun y -> (((Base_dMonad.v_Base_dMonad_d_x62__x62__x61_ Base_dEff.v_Monad_uBase_uEff_uEff_ur) ((v_Vuna_dCompiler_dDriver_dCompilerCli_dmapEff mc0) dtb__1)) (fun ys -> ((Base_dApplicative.v_Base_dApplicative_dpure Base_dEff.v_Applicative_uBase_uEff_uEff_ur) (Base_dList.C_Base_dList_dList__x58__x58_ (y, ys)))))))
  | Base_dList.C_Base_dList_dList_Nil -> ((Base_dApplicative.v_Base_dApplicative_dpure Base_dEff.v_Applicative_uBase_uEff_uEff_ur) Base_dList.C_Base_dList_dList_Nil)
  | _ -> failwith "DT: impossible branch"
))

# 86 "Vuna/Compiler/Driver/CompilerCli.vuna"
let v_Vuna_dCompiler_dDriver_dCompilerCli_ddefaultCliOpts = { f_Vuna_dCompiler_dDriver_dCompilerCli_dCliOpts_optDiagFormat = "short"; f_Vuna_dCompiler_dDriver_dCompilerCli_dCliOpts_optDiagLang = "en"; f_Vuna_dCompiler_dDriver_dCompilerCli_dCliOpts_optLangExplicit = false; f_Vuna_dCompiler_dDriver_dCompilerCli_dCliOpts_optDenyWarnings = false; f_Vuna_dCompiler_dDriver_dCompilerCli_dCliOpts_optShowWarnings = false; f_Vuna_dCompiler_dDriver_dCompilerCli_dCliOpts_optFormatExplicit = false; f_Vuna_dCompiler_dDriver_dCompilerCli_dCliOpts_optWarningsExplicit = false; f_Vuna_dCompiler_dDriver_dCompilerCli_dCliOpts_optDenyExplicit = false; f_Vuna_dCompiler_dDriver_dCompilerCli_dCliOpts_optMaxErrors = 20; f_Vuna_dCompiler_dDriver_dCompilerCli_dCliOpts_optContinueOnError = false; f_Vuna_dCompiler_dDriver_dCompilerCli_dCliOpts_optSarifItems = Base_dList.C_Base_dList_dList_Nil; f_Vuna_dCompiler_dDriver_dCompilerCli_dCliOpts_optRelease = false; f_Vuna_dCompiler_dDriver_dCompilerCli_dCliOpts_optShowCascade = false; f_Vuna_dCompiler_dDriver_dCompilerCli_dCliOpts_optWithSources = false; f_Vuna_dCompiler_dDriver_dCompilerCli_dCliOpts_optFailFast = false; f_Vuna_dCompiler_dDriver_dCompilerCli_dCliOpts_optTarget = "ocaml" }

# 92 "Vuna/Compiler/Driver/CompilerCli.vuna"
let v_Vuna_dCompiler_dDriver_dCompilerCli_dmarkRelease = (fun o -> { o with f_Vuna_dCompiler_dDriver_dCompilerCli_dCliOpts_optRelease = true })

# 96 "Vuna/Compiler/Driver/CompilerCli.vuna"
let v_Vuna_dCompiler_dDriver_dCompilerCli_dmarkTarget = (fun t o -> { f_Vuna_dCompiler_dDriver_dCompilerCli_dCliOpts_optDiagFormat = (o).f_Vuna_dCompiler_dDriver_dCompilerCli_dCliOpts_optDiagFormat; f_Vuna_dCompiler_dDriver_dCompilerCli_dCliOpts_optDiagLang = (o).f_Vuna_dCompiler_dDriver_dCompilerCli_dCliOpts_optDiagLang; f_Vuna_dCompiler_dDriver_dCompilerCli_dCliOpts_optLangExplicit = (o).f_Vuna_dCompiler_dDriver_dCompilerCli_dCliOpts_optLangExplicit; f_Vuna_dCompiler_dDriver_dCompilerCli_dCliOpts_optDenyWarnings = (o).f_Vuna_dCompiler_dDriver_dCompilerCli_dCliOpts_optDenyWarnings; f_Vuna_dCompiler_dDriver_dCompilerCli_dCliOpts_optShowWarnings = (o).f_Vuna_dCompiler_dDriver_dCompilerCli_dCliOpts_optShowWarnings; f_Vuna_dCompiler_dDriver_dCompilerCli_dCliOpts_optFormatExplicit = (o).f_Vuna_dCompiler_dDriver_dCompilerCli_dCliOpts_optFormatExplicit; f_Vuna_dCompiler_dDriver_dCompilerCli_dCliOpts_optWarningsExplicit = (o).f_Vuna_dCompiler_dDriver_dCompilerCli_dCliOpts_optWarningsExplicit; f_Vuna_dCompiler_dDriver_dCompilerCli_dCliOpts_optDenyExplicit = (o).f_Vuna_dCompiler_dDriver_dCompilerCli_dCliOpts_optDenyExplicit; f_Vuna_dCompiler_dDriver_dCompilerCli_dCliOpts_optMaxErrors = (o).f_Vuna_dCompiler_dDriver_dCompilerCli_dCliOpts_optMaxErrors; f_Vuna_dCompiler_dDriver_dCompilerCli_dCliOpts_optContinueOnError = (o).f_Vuna_dCompiler_dDriver_dCompilerCli_dCliOpts_optContinueOnError; f_Vuna_dCompiler_dDriver_dCompilerCli_dCliOpts_optSarifItems = (o).f_Vuna_dCompiler_dDriver_dCompilerCli_dCliOpts_optSarifItems; f_Vuna_dCompiler_dDriver_dCompilerCli_dCliOpts_optRelease = (o).f_Vuna_dCompiler_dDriver_dCompilerCli_dCliOpts_optRelease; f_Vuna_dCompiler_dDriver_dCompilerCli_dCliOpts_optShowCascade = (o).f_Vuna_dCompiler_dDriver_dCompilerCli_dCliOpts_optShowCascade; f_Vuna_dCompiler_dDriver_dCompilerCli_dCliOpts_optWithSources = (o).f_Vuna_dCompiler_dDriver_dCompilerCli_dCliOpts_optWithSources; f_Vuna_dCompiler_dDriver_dCompilerCli_dCliOpts_optFailFast = (o).f_Vuna_dCompiler_dDriver_dCompilerCli_dCliOpts_optFailFast; f_Vuna_dCompiler_dDriver_dCompilerCli_dCliOpts_optTarget = t })

# 104 "Vuna/Compiler/Driver/CompilerCli.vuna"
let v_Vuna_dCompiler_dDriver_dCompilerCli_dmarkFormatExplicit = (fun o -> { f_Vuna_dCompiler_dDriver_dCompilerCli_dCliOpts_optDiagFormat = (o).f_Vuna_dCompiler_dDriver_dCompilerCli_dCliOpts_optDiagFormat; f_Vuna_dCompiler_dDriver_dCompilerCli_dCliOpts_optDiagLang = (o).f_Vuna_dCompiler_dDriver_dCompilerCli_dCliOpts_optDiagLang; f_Vuna_dCompiler_dDriver_dCompilerCli_dCliOpts_optLangExplicit = (o).f_Vuna_dCompiler_dDriver_dCompilerCli_dCliOpts_optLangExplicit; f_Vuna_dCompiler_dDriver_dCompilerCli_dCliOpts_optDenyWarnings = (o).f_Vuna_dCompiler_dDriver_dCompilerCli_dCliOpts_optDenyWarnings; f_Vuna_dCompiler_dDriver_dCompilerCli_dCliOpts_optShowWarnings = (o).f_Vuna_dCompiler_dDriver_dCompilerCli_dCliOpts_optShowWarnings; f_Vuna_dCompiler_dDriver_dCompilerCli_dCliOpts_optFormatExplicit = true; f_Vuna_dCompiler_dDriver_dCompilerCli_dCliOpts_optWarningsExplicit = (o).f_Vuna_dCompiler_dDriver_dCompilerCli_dCliOpts_optWarningsExplicit; f_Vuna_dCompiler_dDriver_dCompilerCli_dCliOpts_optDenyExplicit = (o).f_Vuna_dCompiler_dDriver_dCompilerCli_dCliOpts_optDenyExplicit; f_Vuna_dCompiler_dDriver_dCompilerCli_dCliOpts_optMaxErrors = (o).f_Vuna_dCompiler_dDriver_dCompilerCli_dCliOpts_optMaxErrors; f_Vuna_dCompiler_dDriver_dCompilerCli_dCliOpts_optContinueOnError = (o).f_Vuna_dCompiler_dDriver_dCompilerCli_dCliOpts_optContinueOnError; f_Vuna_dCompiler_dDriver_dCompilerCli_dCliOpts_optSarifItems = (o).f_Vuna_dCompiler_dDriver_dCompilerCli_dCliOpts_optSarifItems; f_Vuna_dCompiler_dDriver_dCompilerCli_dCliOpts_optRelease = (o).f_Vuna_dCompiler_dDriver_dCompilerCli_dCliOpts_optRelease; f_Vuna_dCompiler_dDriver_dCompilerCli_dCliOpts_optShowCascade = (o).f_Vuna_dCompiler_dDriver_dCompilerCli_dCliOpts_optShowCascade; f_Vuna_dCompiler_dDriver_dCompilerCli_dCliOpts_optWithSources = (o).f_Vuna_dCompiler_dDriver_dCompilerCli_dCliOpts_optWithSources; f_Vuna_dCompiler_dDriver_dCompilerCli_dCliOpts_optFailFast = (o).f_Vuna_dCompiler_dDriver_dCompilerCli_dCliOpts_optFailFast; f_Vuna_dCompiler_dDriver_dCompilerCli_dCliOpts_optTarget = (o).f_Vuna_dCompiler_dDriver_dCompilerCli_dCliOpts_optTarget })

# 111 "Vuna/Compiler/Driver/CompilerCli.vuna"
let v_Vuna_dCompiler_dDriver_dCompilerCli_dwithOpts = (fun o m -> (((Base_dMonad.v_Base_dMonad_d_x62__x62__x61_ Base_dEff.v_Monad_uBase_uEff_uEff_ur) m) (fun code -> ((Base_dApplicative.v_Base_dApplicative_dpure Base_dEff.v_Applicative_uBase_uEff_uEff_ur) { Base_dPair.f_Base_dPair_dPair_first = code; Base_dPair.f_Base_dPair_dPair_second = o }))))

# 116 "Vuna/Compiler/Driver/CompilerCli.vuna"
let v_Vuna_dCompiler_dDriver_dCompilerCli_ddiagExitFor = (fun d -> (if (d).Vuna_dCompiler_dBase_dDiag.f_Vuna_dCompiler_dBase_dDiag_dDiagnostic_diagInternal then 70 else (match (d).Vuna_dCompiler_dBase_dDiag.f_Vuna_dCompiler_dBase_dDiag_dDiagnostic_diagSeverity with
  | Vuna_dCompiler_dBase_dDiag.C_Vuna_dCompiler_dBase_dDiag_dSeverity_SevError -> 1
  | _ -> 0
)))

# 144 "Vuna/Compiler/Driver/CompilerCli.vuna"
let v_Vuna_dCompiler_dDriver_dCompilerCli_dapplyManifestOpts = (fun mc0 mc1 -> (match mc0 with
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Just (dtb__2) -> ((fun man -> ((fun fmt0 -> ((fun lang -> ((fun fmt -> ((fun showW -> ((fun deny -> ((fun showW2 -> ((fun maxE -> { f_Vuna_dCompiler_dDriver_dCompilerCli_dCliOpts_optDiagFormat = fmt; f_Vuna_dCompiler_dDriver_dCompilerCli_dCliOpts_optDiagLang = lang; f_Vuna_dCompiler_dDriver_dCompilerCli_dCliOpts_optLangExplicit = (mc1).f_Vuna_dCompiler_dDriver_dCompilerCli_dCliOpts_optLangExplicit; f_Vuna_dCompiler_dDriver_dCompilerCli_dCliOpts_optDenyWarnings = deny; f_Vuna_dCompiler_dDriver_dCompilerCli_dCliOpts_optShowWarnings = showW2; f_Vuna_dCompiler_dDriver_dCompilerCli_dCliOpts_optFormatExplicit = (mc1).f_Vuna_dCompiler_dDriver_dCompilerCli_dCliOpts_optFormatExplicit; f_Vuna_dCompiler_dDriver_dCompilerCli_dCliOpts_optWarningsExplicit = (mc1).f_Vuna_dCompiler_dDriver_dCompilerCli_dCliOpts_optWarningsExplicit; f_Vuna_dCompiler_dDriver_dCompilerCli_dCliOpts_optDenyExplicit = (mc1).f_Vuna_dCompiler_dDriver_dCompilerCli_dCliOpts_optDenyExplicit; f_Vuna_dCompiler_dDriver_dCompilerCli_dCliOpts_optMaxErrors = maxE; f_Vuna_dCompiler_dDriver_dCompilerCli_dCliOpts_optContinueOnError = (mc1).f_Vuna_dCompiler_dDriver_dCompilerCli_dCliOpts_optContinueOnError; f_Vuna_dCompiler_dDriver_dCompilerCli_dCliOpts_optSarifItems = (mc1).f_Vuna_dCompiler_dDriver_dCompilerCli_dCliOpts_optSarifItems; f_Vuna_dCompiler_dDriver_dCompilerCli_dCliOpts_optRelease = (mc1).f_Vuna_dCompiler_dDriver_dCompilerCli_dCliOpts_optRelease; f_Vuna_dCompiler_dDriver_dCompilerCli_dCliOpts_optShowCascade = (mc1).f_Vuna_dCompiler_dDriver_dCompilerCli_dCliOpts_optShowCascade; f_Vuna_dCompiler_dDriver_dCompilerCli_dCliOpts_optWithSources = (mc1).f_Vuna_dCompiler_dDriver_dCompilerCli_dCliOpts_optWithSources; f_Vuna_dCompiler_dDriver_dCompilerCli_dCliOpts_optFailFast = (mc1).f_Vuna_dCompiler_dDriver_dCompilerCli_dCliOpts_optFailFast; f_Vuna_dCompiler_dDriver_dCompilerCli_dCliOpts_optTarget = (mc1).f_Vuna_dCompiler_dDriver_dCompilerCli_dCliOpts_optTarget }) (match (man).Vuna_dCompiler_dFrontend_dManifest.f_Vuna_dCompiler_dFrontend_dManifest_dManifest_manifestDiagMaxErrors with
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Just (dtb__3) -> dtb__3
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing -> (mc1).f_Vuna_dCompiler_dDriver_dCompilerCli_dCliOpts_optMaxErrors
  | _ -> failwith "DT: impossible branch"
))) (if deny then true else showW))) (if (mc1).f_Vuna_dCompiler_dDriver_dCompilerCli_dCliOpts_optDenyExplicit then (mc1).f_Vuna_dCompiler_dDriver_dCompilerCli_dCliOpts_optDenyWarnings else (match (man).Vuna_dCompiler_dFrontend_dManifest.f_Vuna_dCompiler_dFrontend_dManifest_dManifest_manifestDiagDenyWarnings with
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Just (dtb__4) -> dtb__4
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing -> (mc1).f_Vuna_dCompiler_dDriver_dCompilerCli_dCliOpts_optDenyWarnings
  | _ -> failwith "DT: impossible branch"
)))) (if (mc1).f_Vuna_dCompiler_dDriver_dCompilerCli_dCliOpts_optWarningsExplicit then (mc1).f_Vuna_dCompiler_dDriver_dCompilerCli_dCliOpts_optShowWarnings else (match (man).Vuna_dCompiler_dFrontend_dManifest.f_Vuna_dCompiler_dFrontend_dManifest_dManifest_manifestDiagWarnings with
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Just (dtb__5) -> dtb__5
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing -> (mc1).f_Vuna_dCompiler_dDriver_dCompilerCli_dCliOpts_optShowWarnings
  | _ -> failwith "DT: impossible branch"
)))) (if (mc1).f_Vuna_dCompiler_dDriver_dCompilerCli_dCliOpts_optFormatExplicit then (mc1).f_Vuna_dCompiler_dDriver_dCompilerCli_dCliOpts_optDiagFormat else (if (lang = "en") then fmt0 else (if (((Base_dEq.v_Base_dEq_d_x61__x61_ (Base_dMaybe.v_Eq_uBase_uMaybe_uMaybe_ua Base_dString.v_Eq_uString)) (man).Vuna_dCompiler_dFrontend_dManifest.f_Vuna_dCompiler_dFrontend_dManifest_dManifest_manifestDiagFormat) Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing) then "human" else fmt0))))) (if (mc1).f_Vuna_dCompiler_dDriver_dCompilerCli_dCliOpts_optLangExplicit then (mc1).f_Vuna_dCompiler_dDriver_dCompilerCli_dCliOpts_optDiagLang else (match (man).Vuna_dCompiler_dFrontend_dManifest.f_Vuna_dCompiler_dFrontend_dManifest_dManifest_manifestDiagLang with
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Just (dtb__6) -> dtb__6
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing -> (mc1).f_Vuna_dCompiler_dDriver_dCompilerCli_dCliOpts_optDiagLang
  | _ -> failwith "DT: impossible branch"
)))) (match (man).Vuna_dCompiler_dFrontend_dManifest.f_Vuna_dCompiler_dFrontend_dManifest_dManifest_manifestDiagFormat with
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Just (dtb__7) -> dtb__7
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing -> (mc1).f_Vuna_dCompiler_dDriver_dCompilerCli_dCliOpts_optDiagFormat
  | _ -> failwith "DT: impossible branch"
))) (dtb__2).Vuna_dCompiler_dFrontend_dPackages_dPkg.f_Vuna_dCompiler_dFrontend_dPackages_dPkg_dPackage_packageManifest)
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing -> mc1
  | _ -> failwith "DT: impossible branch"
))

# 141 "Vuna/Compiler/Driver/CompilerCli.vuna"
let v_Vuna_dCompiler_dDriver_dCompilerCli_dapplyDiagConfig = (fun m o -> ((v_Vuna_dCompiler_dDriver_dCompilerCli_dapplyManifestOpts m) o))

# 176 "Vuna/Compiler/Driver/CompilerCli.vuna"
let v_Vuna_dCompiler_dDriver_dCompilerCli_dmaxErrorsOf = (fun o -> (if (o).f_Vuna_dCompiler_dDriver_dCompilerCli_dCliOpts_optFailFast then 1 else (o).f_Vuna_dCompiler_dDriver_dCompilerCli_dCliOpts_optMaxErrors))

# 184 "Vuna/Compiler/Driver/CompilerCli.vuna"
let rec v_Vuna_dCompiler_dDriver_dCompilerCli_dtakeDiagsGo = (fun mc0 mc1 -> (match mc1 with
  | Base_dList.C_Base_dList_dList__x58__x58_ (dtb__8, dtb__9) -> (if (mc0 <= 0) then Base_dList.C_Base_dList_dList_Nil else (Base_dList.C_Base_dList_dList__x58__x58_ (dtb__8, ((v_Vuna_dCompiler_dDriver_dCompilerCli_dtakeDiagsGo (mc0 - 1)) dtb__9))))
  | Base_dList.C_Base_dList_dList_Nil -> Base_dList.C_Base_dList_dList_Nil
  | _ -> failwith "DT: impossible branch"
))

# 180 "Vuna/Compiler/Driver/CompilerCli.vuna"
let v_Vuna_dCompiler_dDriver_dCompilerCli_dtakeDiags = (fun n ds -> (if (n <= 0) then ds else ((v_Vuna_dCompiler_dDriver_dCompilerCli_dtakeDiagsGo n) ds)))

# 189 "Vuna/Compiler/Driver/CompilerCli.vuna"
let rec v_Vuna_dCompiler_dDriver_dCompilerCli_dstripDenyWarnings = (fun mc0 -> (match mc0 with
  | Base_dList.C_Base_dList_dList__x58__x58_ (dtb__10, dtb__11) -> (if (if (if (dtb__10 = "--deny-warnings") then true else (dtb__10 = "--warnings")) then true else (dtb__10 = "-W")) then (v_Vuna_dCompiler_dDriver_dCompilerCli_dstripDenyWarnings dtb__11) else (Base_dList.C_Base_dList_dList__x58__x58_ (dtb__10, (v_Vuna_dCompiler_dDriver_dCompilerCli_dstripDenyWarnings dtb__11))))
  | Base_dList.C_Base_dList_dList_Nil -> Base_dList.C_Base_dList_dList_Nil
  | _ -> failwith "DT: impossible branch"
))

# 196 "Vuna/Compiler/Driver/CompilerCli.vuna"
let rec v_Vuna_dCompiler_dDriver_dCompilerCli_dhasDenyWarnings = (fun mc0 -> (match mc0 with
  | Base_dList.C_Base_dList_dList__x58__x58_ (dtb__12, dtb__13) -> (if (dtb__12 = "--deny-warnings") then true else (v_Vuna_dCompiler_dDriver_dCompilerCli_dhasDenyWarnings dtb__13))
  | Base_dList.C_Base_dList_dList_Nil -> false
  | _ -> failwith "DT: impossible branch"
))

# 201 "Vuna/Compiler/Driver/CompilerCli.vuna"
let rec v_Vuna_dCompiler_dDriver_dCompilerCli_dhasShowCascade = (fun mc0 -> (match mc0 with
  | Base_dList.C_Base_dList_dList__x58__x58_ (dtb__14, dtb__15) -> (if (dtb__14 = "--show-cascade") then true else (v_Vuna_dCompiler_dDriver_dCompilerCli_dhasShowCascade dtb__15))
  | Base_dList.C_Base_dList_dList_Nil -> false
  | _ -> failwith "DT: impossible branch"
))

# 205 "Vuna/Compiler/Driver/CompilerCli.vuna"
let rec v_Vuna_dCompiler_dDriver_dCompilerCli_dstripShowCascade = (fun mc0 -> (match mc0 with
  | Base_dList.C_Base_dList_dList__x58__x58_ (dtb__16, dtb__17) -> (if (dtb__16 = "--show-cascade") then (v_Vuna_dCompiler_dDriver_dCompilerCli_dstripShowCascade dtb__17) else (Base_dList.C_Base_dList_dList__x58__x58_ (dtb__16, (v_Vuna_dCompiler_dDriver_dCompilerCli_dstripShowCascade dtb__17))))
  | Base_dList.C_Base_dList_dList_Nil -> Base_dList.C_Base_dList_dList_Nil
  | _ -> failwith "DT: impossible branch"
))

# 210 "Vuna/Compiler/Driver/CompilerCli.vuna"
let rec v_Vuna_dCompiler_dDriver_dCompilerCli_dhasWithSources = (fun mc0 -> (match mc0 with
  | Base_dList.C_Base_dList_dList__x58__x58_ (dtb__18, dtb__19) -> (if (dtb__18 = "--with-sources") then true else (v_Vuna_dCompiler_dDriver_dCompilerCli_dhasWithSources dtb__19))
  | Base_dList.C_Base_dList_dList_Nil -> false
  | _ -> failwith "DT: impossible branch"
))

# 214 "Vuna/Compiler/Driver/CompilerCli.vuna"
let rec v_Vuna_dCompiler_dDriver_dCompilerCli_dhasFailFast = (fun mc0 -> (match mc0 with
  | Base_dList.C_Base_dList_dList__x58__x58_ (dtb__20, dtb__21) -> (if (dtb__20 = "--fail-fast") then true else (v_Vuna_dCompiler_dDriver_dCompilerCli_dhasFailFast dtb__21))
  | Base_dList.C_Base_dList_dList_Nil -> false
  | _ -> failwith "DT: impossible branch"
))

# 218 "Vuna/Compiler/Driver/CompilerCli.vuna"
let rec v_Vuna_dCompiler_dDriver_dCompilerCli_dstripFailFast = (fun mc0 -> (match mc0 with
  | Base_dList.C_Base_dList_dList__x58__x58_ (dtb__22, dtb__23) -> (if (dtb__22 = "--fail-fast") then (v_Vuna_dCompiler_dDriver_dCompilerCli_dstripFailFast dtb__23) else (Base_dList.C_Base_dList_dList__x58__x58_ (dtb__22, (v_Vuna_dCompiler_dDriver_dCompilerCli_dstripFailFast dtb__23))))
  | Base_dList.C_Base_dList_dList_Nil -> Base_dList.C_Base_dList_dList_Nil
  | _ -> failwith "DT: impossible branch"
))

# 223 "Vuna/Compiler/Driver/CompilerCli.vuna"
let rec v_Vuna_dCompiler_dDriver_dCompilerCli_dstripWithSources = (fun mc0 -> (match mc0 with
  | Base_dList.C_Base_dList_dList__x58__x58_ (dtb__24, dtb__25) -> (if (dtb__24 = "--with-sources") then (v_Vuna_dCompiler_dDriver_dCompilerCli_dstripWithSources dtb__25) else (Base_dList.C_Base_dList_dList__x58__x58_ (dtb__24, (v_Vuna_dCompiler_dDriver_dCompilerCli_dstripWithSources dtb__25))))
  | Base_dList.C_Base_dList_dList_Nil -> Base_dList.C_Base_dList_dList_Nil
  | _ -> failwith "DT: impossible branch"
))

# 240 "Vuna/Compiler/Driver/CompilerCli.vuna"
let rec v_Vuna_dCompiler_dDriver_dCompilerCli_dmemStr = (fun mc0 mc1 -> (match mc1 with
  | Base_dList.C_Base_dList_dList__x58__x58_ (dtb__26, dtb__27) -> (if (mc0 = dtb__26) then true else ((v_Vuna_dCompiler_dDriver_dCompilerCli_dmemStr mc0) dtb__27))
  | Base_dList.C_Base_dList_dList_Nil -> false
  | _ -> failwith "DT: impossible branch"
))

# 233 "Vuna/Compiler/Driver/CompilerCli.vuna"
let rec v_Vuna_dCompiler_dDriver_dCompilerCli_dlabelFiles = (fun mc0 mc1 -> (match mc0 with
  | Base_dList.C_Base_dList_dList__x58__x58_ (dtb__28, dtb__29) -> ((v_Vuna_dCompiler_dDriver_dCompilerCli_dlabelFiles dtb__29) (match (dtb__28).Vuna_dCompiler_dBase_dDiag.f_Vuna_dCompiler_dBase_dDiag_dLabel_labelSpan with
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing -> mc1
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Just (dtb__30) -> (if (if ((dtb__30).Vuna_dCompiler_dBase_dSource.f_Vuna_dCompiler_dBase_dSource_dSpan_spanFile = "") then true else ((v_Vuna_dCompiler_dDriver_dCompilerCli_dmemStr (dtb__30).Vuna_dCompiler_dBase_dSource.f_Vuna_dCompiler_dBase_dSource_dSpan_spanFile) mc1)) then mc1 else (Base_dList.C_Base_dList_dList__x58__x58_ ((dtb__30).Vuna_dCompiler_dBase_dSource.f_Vuna_dCompiler_dBase_dSource_dSpan_spanFile, mc1)))
  | _ -> failwith "DT: impossible branch"
))
  | Base_dList.C_Base_dList_dList_Nil -> mc1
  | _ -> failwith "DT: impossible branch"
))

# 229 "Vuna/Compiler/Driver/CompilerCli.vuna"
let rec v_Vuna_dCompiler_dDriver_dCompilerCli_dcollectLabelFiles = (fun mc0 mc1 -> (match mc0 with
  | Base_dList.C_Base_dList_dList__x58__x58_ (dtb__31, dtb__32) -> ((v_Vuna_dCompiler_dDriver_dCompilerCli_dcollectLabelFiles dtb__32) ((v_Vuna_dCompiler_dDriver_dCompilerCli_dlabelFiles (dtb__31).Vuna_dCompiler_dBase_dDiag.f_Vuna_dCompiler_dBase_dDiag_dDiagnostic_diagLabels) mc1))
  | Base_dList.C_Base_dList_dList_Nil -> mc1
  | _ -> failwith "DT: impossible branch"
))

# 245 "Vuna/Compiler/Driver/CompilerCli.vuna"
let rec v_Vuna_dCompiler_dDriver_dCompilerCli_dlastSlashGo = (fun mc0 mc1 mc2 -> (match mc0 with
  | Base_dList.C_Base_dList_dList__x58__x58_ (dtb__33, dtb__34) -> (((v_Vuna_dCompiler_dDriver_dCompilerCli_dlastSlashGo dtb__34) (mc1 + 1)) (if (dtb__33 = 47) then mc1 else mc2))
  | Base_dList.C_Base_dList_dList_Nil -> mc2
  | _ -> failwith "DT: impossible branch"
))

# 249 "Vuna/Compiler/Driver/CompilerCli.vuna"
let v_Vuna_dCompiler_dDriver_dCompilerCli_dlastSlashIndexOf = (fun s -> (((v_Vuna_dCompiler_dDriver_dCompilerCli_dlastSlashGo (Base_dList.dtp_unpack s)) 0) (0 - 1)))

# 252 "Vuna/Compiler/Driver/CompilerCli.vuna"
let v_Vuna_dCompiler_dDriver_dCompilerCli_ddirOf = (fun path -> ((fun n -> (if (n < 0) then "." else (if (n = 0) then "/" else (((Base_dString.v_Base_dString_dsubstring 0) (bi_natFromInt n)) path)))) (v_Vuna_dCompiler_dDriver_dCompilerCli_dlastSlashIndexOf path)))

# 258 "Vuna/Compiler/Driver/CompilerCli.vuna"
let v_Vuna_dCompiler_dDriver_dCompilerCli_dstripPathPrefix = (fun base file -> (if ((Base_dString.v_Base_dString_dstartsWith (base ^ "/")) file) then (((Base_dString.v_Base_dString_dsubstring (bi_natFromInt ((bi_strLength base) + 1))) (bi_natFromInt (((bi_strLength file) - (bi_strLength base)) - 1))) file) else file))

# 267 "Vuna/Compiler/Driver/CompilerCli.vuna"
let rec v_Vuna_dCompiler_dDriver_dCompilerCli_dsplitSlashGo = (fun mc0 mc1 mc2 -> (match mc0 with
  | Base_dList.C_Base_dList_dList__x58__x58_ (dtb__35, dtb__36) -> (if (dtb__35 = 47) then (((v_Vuna_dCompiler_dDriver_dCompilerCli_dsplitSlashGo dtb__36) Base_dList.C_Base_dList_dList_Nil) (Base_dList.C_Base_dList_dList__x58__x58_ ((Base_dList.dtp_pack (Base_dList.v_Base_dList_dreverse mc1)), mc2))) else (((v_Vuna_dCompiler_dDriver_dCompilerCli_dsplitSlashGo dtb__36) (Base_dList.C_Base_dList_dList__x58__x58_ (dtb__35, mc1))) mc2))
  | Base_dList.C_Base_dList_dList_Nil -> (Base_dList.v_Base_dList_dreverse (Base_dList.C_Base_dList_dList__x58__x58_ ((Base_dList.dtp_pack (Base_dList.v_Base_dList_dreverse mc1)), mc2)))
  | _ -> failwith "DT: impossible branch"
))

# 264 "Vuna/Compiler/Driver/CompilerCli.vuna"
let v_Vuna_dCompiler_dDriver_dCompilerCli_dsplitSlash = (fun s -> (((v_Vuna_dCompiler_dDriver_dCompilerCli_dsplitSlashGo (Base_dList.dtp_unpack s)) Base_dList.C_Base_dList_dList_Nil) Base_dList.C_Base_dList_dList_Nil))

# 273 "Vuna/Compiler/Driver/CompilerCli.vuna"
let v_Vuna_dCompiler_dDriver_dCompilerCli_dmoduleOfRel = (fun rel -> ((fun rel1 -> ((fun rel2 -> ((Base_dString.v_Base_dString_djoin ".") (v_Vuna_dCompiler_dDriver_dCompilerCli_dsplitSlash rel2))) (if ((Base_dString.v_Base_dString_dendsWith ".vuna") rel1) then (((Base_dString.v_Base_dString_dsubstring 0) (bi_natFromInt ((bi_strLength rel1) - 5))) rel1) else rel1))) (if ((Base_dString.v_Base_dString_dstartsWith "lib/") rel) then (((Base_dString.v_Base_dString_dsubstring (bi_natFromInt 4)) (bi_natFromInt ((bi_strLength rel) - 4))) rel) else (if ((Base_dString.v_Base_dString_dstartsWith "app/") rel) then (((Base_dString.v_Base_dString_dsubstring (bi_natFromInt 4)) (bi_natFromInt ((bi_strLength rel) - 4))) rel) else rel))))

# 284 "Vuna/Compiler/Driver/CompilerCli.vuna"
let rec v_Vuna_dCompiler_dDriver_dCompilerCli_dfindPkgRootGo = (fun nFs fuel dir -> (if (fuel <= 0) then ((Base_dApplicative.v_Base_dApplicative_dpure Base_dEff.v_Applicative_uBase_uEff_uEff_ur) { Base_dPair.f_Base_dPair_dPair_first = ""; Base_dPair.f_Base_dPair_dPair_second = "" }) else ((fun candidate -> (((Base_dMonad.v_Base_dMonad_d_x62__x62__x61_ Base_dEff.v_Monad_uBase_uEff_uEff_ur) ((Base_dEffFs.v_Base_dEffFs_dfsFileExists nFs) candidate)) (fun exists -> (if exists then (((Base_dMonad.v_Base_dMonad_d_x62__x62__x61_ Base_dEff.v_Monad_uBase_uEff_uEff_ur) ((Base_dEffFs.v_Base_dEffFs_dfsReadFile nFs) candidate)) (fun text -> ((fun name -> ((Base_dApplicative.v_Base_dApplicative_dpure Base_dEff.v_Applicative_uBase_uEff_uEff_ur) { Base_dPair.f_Base_dPair_dPair_first = dir; Base_dPair.f_Base_dPair_dPair_second = name })) (match ((Vuna_dCompiler_dFrontend_dManifest.v_Vuna_dCompiler_dFrontend_dManifest_dparseManifest candidate) text) with
  | Vuna_dCompiler_dBase_dDiag.C_Vuna_dCompiler_dBase_dDiag_dCheck_OkC (dtb__37) -> (match (dtb__37).Vuna_dCompiler_dFrontend_dManifest.f_Vuna_dCompiler_dFrontend_dManifest_dManifest_manifestName with
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing -> ""
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Just (dtb__38) -> dtb__38
  | _ -> failwith "DT: impossible branch"
)
  | Vuna_dCompiler_dBase_dDiag.C_Vuna_dCompiler_dBase_dDiag_dCheck_ErrC (dtb__39) -> ""
  | _ -> failwith "DT: impossible branch"
)))) else (if (if (dir = "/") then true else (dir = ".")) then ((Base_dApplicative.v_Base_dApplicative_dpure Base_dEff.v_Applicative_uBase_uEff_uEff_ur) { Base_dPair.f_Base_dPair_dPair_first = ""; Base_dPair.f_Base_dPair_dPair_second = "" }) else (((v_Vuna_dCompiler_dDriver_dCompilerCli_dfindPkgRootGo nFs) (fuel - 1)) (v_Vuna_dCompiler_dDriver_dCompilerCli_ddirOf dir))))))) (if (dir = "/") then "/vuna.toml" else (dir ^ "/vuna.toml")))))

# 302 "Vuna/Compiler/Driver/CompilerCli.vuna"
let v_Vuna_dCompiler_dDriver_dCompilerCli_dsourceRefEff = (fun nFs nEnv file -> (((Base_dMonad.v_Base_dMonad_d_x62__x62__x61_ Base_dEff.v_Monad_uBase_uEff_uEff_ur) ((Vuna_dCompiler_dFrontend_dPackages_dPkg.v_Vuna_dCompiler_dFrontend_dPackages_dPkg_dabsolutePath nEnv) file)) (fun abs -> (((Base_dMonad.v_Base_dMonad_d_x62__x62__x61_ Base_dEff.v_Monad_uBase_uEff_uEff_ur) ((Base_dEffFs.v_Base_dEffFs_dfsFileExists nFs) abs)) (fun exists -> (((Base_dMonad.v_Base_dMonad_d_x62__x62__x61_ Base_dEff.v_Monad_uBase_uEff_uEff_ur) (if exists then (((Base_dMonad.v_Base_dMonad_d_x62__x62__x61_ Base_dEff.v_Monad_uBase_uEff_uEff_ur) ((Base_dEffFs.v_Base_dEffFs_dfsReadFile nFs) abs)) (fun text -> ((Base_dApplicative.v_Base_dApplicative_dpure Base_dEff.v_Applicative_uBase_uEff_uEff_ur) (bi_strFromInt (Vuna_dCompiler_dLoader_dFingerprint.v_Vuna_dCompiler_dLoader_dFingerprint_dtextHashOf text))))) else ((Base_dApplicative.v_Base_dApplicative_dpure Base_dEff.v_Applicative_uBase_uEff_uEff_ur) ""))) (fun digest -> (((Base_dMonad.v_Base_dMonad_d_x62__x62__x61_ Base_dEff.v_Monad_uBase_uEff_uEff_ur) (((v_Vuna_dCompiler_dDriver_dCompilerCli_dfindPkgRootGo nFs) 12) (v_Vuna_dCompiler_dDriver_dCompilerCli_ddirOf abs))) (fun root -> ((fun pkgDir -> ((fun pkgName -> ((fun rel -> ((Base_dApplicative.v_Base_dApplicative_dpure Base_dEff.v_Applicative_uBase_uEff_uEff_ur) { Vuna_dCompiler_dBase_dDiag_dFormat.f_Vuna_dCompiler_dBase_dDiag_dFormat_dSourceRef_srcFile = file; Vuna_dCompiler_dBase_dDiag_dFormat.f_Vuna_dCompiler_dBase_dDiag_dFormat_dSourceRef_srcDigest = digest; Vuna_dCompiler_dBase_dDiag_dFormat.f_Vuna_dCompiler_dBase_dDiag_dFormat_dSourceRef_srcPackage = pkgName; Vuna_dCompiler_dBase_dDiag_dFormat.f_Vuna_dCompiler_dBase_dDiag_dFormat_dSourceRef_srcModule = (v_Vuna_dCompiler_dDriver_dCompilerCli_dmoduleOfRel rel); Vuna_dCompiler_dBase_dDiag_dFormat.f_Vuna_dCompiler_dBase_dDiag_dFormat_dSourceRef_srcRelPath = rel })) (if (pkgDir = "") then file else ((v_Vuna_dCompiler_dDriver_dCompilerCli_dstripPathPrefix pkgDir) abs)))) (Base_dPair.v_Base_dPair_dsecondOf root))) (Base_dPair.v_Base_dPair_dfirstOf root)))))))))))

# 317 "Vuna/Compiler/Driver/CompilerCli.vuna"
let rec v_Vuna_dCompiler_dDriver_dCompilerCli_dsourcePairsEff = (fun nFs nEnv mc0 -> (match mc0 with
  | Base_dList.C_Base_dList_dList__x58__x58_ (dtb__40, dtb__41) -> (((Base_dMonad.v_Base_dMonad_d_x62__x62__x61_ Base_dEff.v_Monad_uBase_uEff_uEff_ur) (((v_Vuna_dCompiler_dDriver_dCompilerCli_dsourcePairsEff nFs) nEnv) dtb__41)) (fun more -> (((Base_dMonad.v_Base_dMonad_d_x62__x62__x61_ Base_dEff.v_Monad_uBase_uEff_uEff_ur) (((v_Vuna_dCompiler_dDriver_dCompilerCli_dsourceRefEff nFs) nEnv) dtb__40)) (fun ref -> ((Base_dApplicative.v_Base_dApplicative_dpure Base_dEff.v_Applicative_uBase_uEff_uEff_ur) (Base_dList.C_Base_dList_dList__x58__x58_ (ref, more)))))))
  | Base_dList.C_Base_dList_dList_Nil -> ((Base_dApplicative.v_Base_dApplicative_dpure Base_dEff.v_Applicative_uBase_uEff_uEff_ur) Base_dList.C_Base_dList_dList_Nil)
  | _ -> failwith "DT: impossible branch"
))

# 123 "Vuna/Compiler/Driver/CompilerCli.vuna"
let v_Vuna_dCompiler_dDriver_dCompilerCli_dflushSarif = (fun nFs nConsole nEnv code o -> ((fun shown -> (if ((o).f_Vuna_dCompiler_dDriver_dCompilerCli_dCliOpts_optDiagFormat = "sarif") then (((Base_dMonad.v_Base_dMonad_d_x62__x62__x61_ Base_dEff.v_Monad_uBase_uEff_uEff_ur) ((Base_dEffConsole.v_Base_dEffConsole_dconsolePrint nConsole) ((Vuna_dCompiler_dBase_dDiag_dFormat.v_Vuna_dCompiler_dBase_dDiag_dFormat_drenderSarif shown) ^ "\n"))) (fun _u -> ((Base_dApplicative.v_Base_dApplicative_dpure Base_dEff.v_Applicative_uBase_uEff_uEff_ur) code))) else (if ((o).f_Vuna_dCompiler_dDriver_dCompilerCli_dCliOpts_optDiagFormat = "json") then (if (o).f_Vuna_dCompiler_dDriver_dCompilerCli_dCliOpts_optWithSources then (((Base_dMonad.v_Base_dMonad_d_x62__x62__x61_ Base_dEff.v_Monad_uBase_uEff_uEff_ur) (((v_Vuna_dCompiler_dDriver_dCompilerCli_dsourcePairsEff nFs) nEnv) (Base_dList.v_Base_dList_dreverse ((v_Vuna_dCompiler_dDriver_dCompilerCli_dcollectLabelFiles shown) Base_dList.C_Base_dList_dList_Nil)))) (fun sources -> (((Base_dMonad.v_Base_dMonad_d_x62__x62__x61_ Base_dEff.v_Monad_uBase_uEff_uEff_ur) ((Base_dEffConsole.v_Base_dEffConsole_dconsolePrint nConsole) ((((Vuna_dCompiler_dBase_dDiag_dFormat.v_Vuna_dCompiler_dBase_dDiag_dFormat_drenderJsonListWithSources (o).f_Vuna_dCompiler_dDriver_dCompilerCli_dCliOpts_optDiagLang) shown) sources) ^ "\n"))) (fun _u -> ((Base_dApplicative.v_Base_dApplicative_dpure Base_dEff.v_Applicative_uBase_uEff_uEff_ur) code))))) else (((Base_dMonad.v_Base_dMonad_d_x62__x62__x61_ Base_dEff.v_Monad_uBase_uEff_uEff_ur) ((Base_dEffConsole.v_Base_dEffConsole_dconsolePrint nConsole) (((Vuna_dCompiler_dBase_dDiag_dFormat.v_Vuna_dCompiler_dBase_dDiag_dFormat_drenderJsonList (o).f_Vuna_dCompiler_dDriver_dCompilerCli_dCliOpts_optDiagLang) shown) ^ "\n"))) (fun _u -> ((Base_dApplicative.v_Base_dApplicative_dpure Base_dEff.v_Applicative_uBase_uEff_uEff_ur) code)))) else ((Base_dApplicative.v_Base_dApplicative_dpure Base_dEff.v_Applicative_uBase_uEff_uEff_ur) code)))) ((v_Vuna_dCompiler_dDriver_dCompilerCli_dtakeDiags (o).f_Vuna_dCompiler_dDriver_dCompilerCli_dCliOpts_optMaxErrors) (o).f_Vuna_dCompiler_dDriver_dCompilerCli_dCliOpts_optSarifItems)))

# 324 "Vuna/Compiler/Driver/CompilerCli.vuna"
let v_Vuna_dCompiler_dDriver_dCompilerCli_disCascadeDiag = (fun d -> (match (d).Vuna_dCompiler_dBase_dDiag.f_Vuna_dCompiler_dBase_dDiag_dDiagnostic_diagOrigin with
  | Vuna_dCompiler_dBase_dDiag.C_Vuna_dCompiler_dBase_dDiag_dOrigin_OriginCascade (dtb__42) -> true
  | Vuna_dCompiler_dBase_dDiag.C_Vuna_dCompiler_dBase_dDiag_dOrigin_OriginDirect -> false
  | _ -> failwith "DT: impossible branch"
))

# 330 "Vuna/Compiler/Driver/CompilerCli.vuna"
let v_Vuna_dCompiler_dDriver_dCompilerCli_disTextDiagFormat = (fun f -> (if (f = "short") then true else (f = "human")))

# 333 "Vuna/Compiler/Driver/CompilerCli.vuna"
let v_Vuna_dCompiler_dDriver_dCompilerCli_dvisibleDiags = (fun o ds -> (if (if (o).f_Vuna_dCompiler_dDriver_dCompilerCli_dCliOpts_optShowCascade then true else (Base_dBool.v_Base_dBool_dnot (v_Vuna_dCompiler_dDriver_dCompilerCli_disTextDiagFormat (o).f_Vuna_dCompiler_dDriver_dCompilerCli_dCliOpts_optDiagFormat))) then ds else ((fun kept -> (if (if ((Base_dList.v_Base_dList_dlength kept) = 0) then ((Base_dList.v_Base_dList_dlength ds) > 0) else false) then ds else kept)) ((Base_dList.v_Base_dList_dfilter (fun d -> (Base_dBool.v_Base_dBool_dnot (v_Vuna_dCompiler_dDriver_dCompilerCli_disCascadeDiag d)))) ds))))

# 341 "Vuna/Compiler/Driver/CompilerCli.vuna"
let rec v_Vuna_dCompiler_dDriver_dCompilerCli_dhasShowWarnings = (fun mc0 -> (match mc0 with
  | Base_dList.C_Base_dList_dList__x58__x58_ (dtb__43, dtb__44) -> (if (if (dtb__43 = "--warnings") then true else (dtb__43 = "-W")) then true else (v_Vuna_dCompiler_dDriver_dCompilerCli_dhasShowWarnings dtb__44))
  | Base_dList.C_Base_dList_dList_Nil -> false
  | _ -> failwith "DT: impossible branch"
))

# 347 "Vuna/Compiler/Driver/CompilerCli.vuna"
let rec v_Vuna_dCompiler_dDriver_dCompilerCli_dhasFormatFlag = (fun mc0 -> (match mc0 with
  | Base_dList.C_Base_dList_dList__x58__x58_ (dtb__45, dtb__46) -> (if (if (if (dtb__45 = "--json") then true else ((Base_dString.v_Base_dString_dstartsWith "--error-format") dtb__45)) then true else ((Base_dString.v_Base_dString_dstartsWith "--message-format") dtb__45)) then true else (v_Vuna_dCompiler_dDriver_dCompilerCli_dhasFormatFlag dtb__46))
  | Base_dList.C_Base_dList_dList_Nil -> false
  | _ -> failwith "DT: impossible branch"
))

# 358 "Vuna/Compiler/Driver/CompilerCli.vuna"
let rec v_Vuna_dCompiler_dDriver_dCompilerCli_dstripDiagFormatGo = (fun mc0 mc1 mc2 -> (match mc0 with
  | Base_dList.C_Base_dList_dList__x58__x58_ (dtb__47, dtb__48) -> (if (dtb__47 = "--json") then (((v_Vuna_dCompiler_dDriver_dCompilerCli_dstripDiagFormatGo dtb__48) mc1) (Base_dMaybe.C_Base_dMaybe_dMaybe_Just ("json"))) else (if (dtb__47 = "--error-format") then (match dtb__48 with
  | Base_dList.C_Base_dList_dList__x58__x58_ (dtb__49, dtb__50) -> (((v_Vuna_dCompiler_dDriver_dCompilerCli_dstripDiagFormatGo dtb__50) mc1) (Base_dMaybe.C_Base_dMaybe_dMaybe_Just (dtb__49)))
  | Base_dList.C_Base_dList_dList_Nil -> { Base_dPair.f_Base_dPair_dPair_first = (Base_dList.v_Base_dList_dreverse mc1); Base_dPair.f_Base_dPair_dPair_second = (Base_dMaybe.C_Base_dMaybe_dMaybe_Just ("short")) }
  | _ -> failwith "DT: impossible branch"
) else (if ((Base_dString.v_Base_dString_dstartsWith "--error-format=") dtb__47) then (((v_Vuna_dCompiler_dDriver_dCompilerCli_dstripDiagFormatGo dtb__48) mc1) (Base_dMaybe.C_Base_dMaybe_dMaybe_Just ((((Base_dString.v_Base_dString_dsubstring (bi_natFromInt 15)) (bi_natFromInt ((bi_strLength dtb__47) - 15))) dtb__47)))) else (if ((Base_dString.v_Base_dString_dstartsWith "--message-format=") dtb__47) then (((v_Vuna_dCompiler_dDriver_dCompilerCli_dstripDiagFormatGo dtb__48) mc1) (Base_dMaybe.C_Base_dMaybe_dMaybe_Just ((((Base_dString.v_Base_dString_dsubstring (bi_natFromInt 17)) (bi_natFromInt ((bi_strLength dtb__47) - 17))) dtb__47)))) else (((v_Vuna_dCompiler_dDriver_dCompilerCli_dstripDiagFormatGo dtb__48) (Base_dList.C_Base_dList_dList__x58__x58_ (dtb__47, mc1))) mc2)))))
  | Base_dList.C_Base_dList_dList_Nil -> { Base_dPair.f_Base_dPair_dPair_first = (Base_dList.v_Base_dList_dreverse mc1); Base_dPair.f_Base_dPair_dPair_second = mc2 }
  | _ -> failwith "DT: impossible branch"
))

# 354 "Vuna/Compiler/Driver/CompilerCli.vuna"
let v_Vuna_dCompiler_dDriver_dCompilerCli_dstripDiagFormat = (fun args -> (((v_Vuna_dCompiler_dDriver_dCompilerCli_dstripDiagFormatGo args) Base_dList.C_Base_dList_dList_Nil) Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing))

# 372 "Vuna/Compiler/Driver/CompilerCli.vuna"
let v_Vuna_dCompiler_dDriver_dCompilerCli_dstdoutIsTty = (Base_dEff.v_Base_dEff_draise (Base_dEff.C_Base_dEff_dEff_MkEff (fun (_ : Base_dEff.t_Base_dEff_dEffUnit) -> (dtp_isTty ()))))

# 410 "Vuna/Compiler/Driver/CompilerCli.vuna"
let rec v_Vuna_dCompiler_dDriver_dCompilerCli_dparseIntChars = (fun mc0 mc1 mc2 mc3 -> (match mc0 with
  | Base_dList.C_Base_dList_dList__x58__x58_ (dtb__51, dtb__52) -> (if (if (dtb__51 >= 48) then (dtb__51 <= 57) else false) then ((((v_Vuna_dCompiler_dDriver_dCompilerCli_dparseIntChars dtb__52) ((mc1 * 10) + (dtb__51 - 48))) (mc2 + 1)) mc3) else (if (mc2 = 0) then mc3 else mc1))
  | Base_dList.C_Base_dList_dList_Nil -> (if (mc2 = 0) then mc3 else mc1)
  | _ -> failwith "DT: impossible branch"
))

# 406 "Vuna/Compiler/Driver/CompilerCli.vuna"
let v_Vuna_dCompiler_dDriver_dCompilerCli_dparseIntOr = (fun s fallback -> ((((v_Vuna_dCompiler_dDriver_dCompilerCli_dparseIntChars (Base_dList.dtp_unpack s)) 0) 0) fallback))

# 421 "Vuna/Compiler/Driver/CompilerCli.vuna"
let rec v_Vuna_dCompiler_dDriver_dCompilerCli_dstripMaxErrorsGo = (fun mc0 mc1 mc2 -> (match mc0 with
  | Base_dList.C_Base_dList_dList__x58__x58_ (dtb__53, dtb__54) -> (if (dtb__53 = "--max-errors") then (match dtb__54 with
  | Base_dList.C_Base_dList_dList__x58__x58_ (dtb__55, dtb__56) -> (((v_Vuna_dCompiler_dDriver_dCompilerCli_dstripMaxErrorsGo dtb__56) mc1) ((v_Vuna_dCompiler_dDriver_dCompilerCli_dparseIntOr dtb__55) mc2))
  | Base_dList.C_Base_dList_dList_Nil -> { Base_dPair.f_Base_dPair_dPair_first = (Base_dList.v_Base_dList_dreverse mc1); Base_dPair.f_Base_dPair_dPair_second = mc2 }
  | _ -> failwith "DT: impossible branch"
) else (if ((Base_dString.v_Base_dString_dstartsWith "--max-errors=") dtb__53) then (((v_Vuna_dCompiler_dDriver_dCompilerCli_dstripMaxErrorsGo dtb__54) mc1) ((v_Vuna_dCompiler_dDriver_dCompilerCli_dparseIntOr (((Base_dString.v_Base_dString_dsubstring (bi_natFromInt 13)) (bi_natFromInt ((bi_strLength dtb__53) - 13))) dtb__53)) mc2)) else (((v_Vuna_dCompiler_dDriver_dCompilerCli_dstripMaxErrorsGo dtb__54) (Base_dList.C_Base_dList_dList__x58__x58_ (dtb__53, mc1))) mc2)))
  | Base_dList.C_Base_dList_dList_Nil -> { Base_dPair.f_Base_dPair_dPair_first = (Base_dList.v_Base_dList_dreverse mc1); Base_dPair.f_Base_dPair_dPair_second = mc2 }
  | _ -> failwith "DT: impossible branch"
))

# 417 "Vuna/Compiler/Driver/CompilerCli.vuna"
let v_Vuna_dCompiler_dDriver_dCompilerCli_dstripMaxErrors = (fun args -> (((v_Vuna_dCompiler_dDriver_dCompilerCli_dstripMaxErrorsGo args) Base_dList.C_Base_dList_dList_Nil) 20))

# 447 "Vuna/Compiler/Driver/CompilerCli.vuna"
let v_Vuna_dCompiler_dDriver_dCompilerCli_dprintVersion = (fun nConsole _u -> (((Base_dMonad.v_Base_dMonad_d_x62__x62__x61_ Base_dEff.v_Monad_uBase_uEff_uEff_ur) ((Base_dEffConsole.v_Base_dEffConsole_dconsolePrint nConsole) (String.concat "" ["vuna-compiler "; Vuna_dCompiler_dBase_dVersion.v_Vuna_dCompiler_dBase_dVersion_dvunaVersion; "\n"]))) (fun _u -> ((Base_dApplicative.v_Base_dApplicative_dpure Base_dEff.v_Applicative_uBase_uEff_uEff_ur) 0))))

# 453 "Vuna/Compiler/Driver/CompilerCli.vuna"
let rec v_Vuna_dCompiler_dDriver_dCompilerCli_danyHelp = (fun mc0 -> (match mc0 with
  | Base_dList.C_Base_dList_dList__x58__x58_ (dtb__57, dtb__58) -> (if (if (dtb__57 = "-h") then true else (dtb__57 = "--help")) then true else (v_Vuna_dCompiler_dDriver_dCompilerCli_danyHelp dtb__58))
  | Base_dList.C_Base_dList_dList_Nil -> false
  | _ -> failwith "DT: impossible branch"
))

# 458 "Vuna/Compiler/Driver/CompilerCli.vuna"
let v_Vuna_dCompiler_dDriver_dCompilerCli_dhelpFor = (fun nConsole prog -> (((Base_dMonad.v_Base_dMonad_d_x62__x62__x61_ Base_dEff.v_Monad_uBase_uEff_uEff_ur) ((Base_dEffConsole.v_Base_dEffConsole_dconsolePrint nConsole) (v_Vuna_dCompiler_dDriver_dCompilerCli_dcompilerUsage prog))) (fun _u -> ((Base_dApplicative.v_Base_dApplicative_dpure Base_dEff.v_Applicative_uBase_uEff_uEff_ur) 0))))

# 464 "Vuna/Compiler/Driver/CompilerCli.vuna"
let v_Vuna_dCompiler_dDriver_dCompilerCli_dusageErr = (fun nConsole prog -> (((Base_dMonad.v_Base_dMonad_d_x62__x62__x61_ Base_dEff.v_Monad_uBase_uEff_uEff_ur) ((Base_dEffConsole.v_Base_dEffConsole_dconsolePrint nConsole) (v_Vuna_dCompiler_dDriver_dCompilerCli_dcompilerUsage prog))) (fun _u -> ((Base_dApplicative.v_Base_dApplicative_dpure Base_dEff.v_Applicative_uBase_uEff_uEff_ur) 2))))

# 470 "Vuna/Compiler/Driver/CompilerCli.vuna"
let v_Vuna_dCompiler_dDriver_dCompilerCli_dunknownCommand = (fun nConsole prog arg -> (((Base_dMonad.v_Base_dMonad_d_x62__x62__x61_ Base_dEff.v_Monad_uBase_uEff_uEff_ur) ((Base_dEffConsole.v_Base_dEffConsole_dconsolePrint nConsole) (String.concat "" ["error: unknown command "; arg; "\nrun "; prog; " help for the command list\n"]))) (fun _u -> ((Base_dApplicative.v_Base_dApplicative_dpure Base_dEff.v_Applicative_uBase_uEff_uEff_ur) 2))))

# 475 "Vuna/Compiler/Driver/CompilerCli.vuna"
let v_Vuna_dCompiler_dDriver_dCompilerCli_dremovedCommand = (fun nConsole prog cmd hint -> (((Base_dMonad.v_Base_dMonad_d_x62__x62__x61_ Base_dEff.v_Monad_uBase_uEff_uEff_ur) ((Base_dEffConsole.v_Base_dEffConsole_dconsolePrint nConsole) (String.concat "" ["error: "; cmd; " has been removed; "; hint; "\n"]))) (fun _u -> ((Base_dApplicative.v_Base_dApplicative_dpure Base_dEff.v_Applicative_uBase_uEff_uEff_ur) 2))))

# 482 "Vuna/Compiler/Driver/CompilerCli.vuna"
let v_Vuna_dCompiler_dDriver_dCompilerCli_ddashFlag = (fun name -> ("--" ^ name))

# 485 "Vuna/Compiler/Driver/CompilerCli.vuna"
let v_Vuna_dCompiler_dDriver_dCompilerCli_dremovedFlagHint = (fun flag -> (if (flag = (v_Vuna_dCompiler_dDriver_dCompilerCli_ddashFlag "dt")) then (Base_dMaybe.C_Base_dMaybe_dMaybe_Just ("DT is the only path; drop the flag")) else (if (flag = (v_Vuna_dCompiler_dDriver_dCompilerCli_ddashFlag "package")) then (Base_dMaybe.C_Base_dMaybe_dMaybe_Just ("use build or compile")) else (if (flag = (v_Vuna_dCompiler_dDriver_dCompilerCli_ddashFlag "split")) then (Base_dMaybe.C_Base_dMaybe_dMaybe_Just ("split is the only output model; use build --out OUT [DIR] or compile <pkg-dir> OUT")) else (if (flag = (v_Vuna_dCompiler_dDriver_dCompilerCli_ddashFlag "root")) then (Base_dMaybe.C_Base_dMaybe_dMaybe_Just ("module resolution is decided by the nearest vuna.toml; set VUNA_BASE for standalone files")) else (if (flag = (v_Vuna_dCompiler_dDriver_dCompilerCli_ddashFlag "out")) then (Base_dMaybe.C_Base_dMaybe_dMaybe_Just ("pass OUTDIR positionally to compile; build accepts --out DIR")) else (if (flag = (v_Vuna_dCompiler_dDriver_dCompilerCli_ddashFlag "no-typecheck")) then (Base_dMaybe.C_Base_dMaybe_dMaybe_Just ("checking is always enabled")) else (if (flag = (v_Vuna_dCompiler_dDriver_dCompilerCli_ddashFlag "typecheck")) then (Base_dMaybe.C_Base_dMaybe_dMaybe_Just ("checking is always enabled")) else (if (flag = (v_Vuna_dCompiler_dDriver_dCompilerCli_ddashFlag "typed")) then (Base_dMaybe.C_Base_dMaybe_dMaybe_Just ("DT is the only path")) else Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing)))))))))

# 497 "Vuna/Compiler/Driver/CompilerCli.vuna"
let v_Vuna_dCompiler_dDriver_dCompilerCli_dremovedFlag = (fun nConsole prog flag -> (match (v_Vuna_dCompiler_dDriver_dCompilerCli_dremovedFlagHint flag) with
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing -> ((v_Vuna_dCompiler_dDriver_dCompilerCli_dusageErr nConsole) prog)
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Just (dtb__59) -> (((Base_dMonad.v_Base_dMonad_d_x62__x62__x61_ Base_dEff.v_Monad_uBase_uEff_uEff_ur) ((Base_dEffConsole.v_Base_dEffConsole_dconsolePrint nConsole) (String.concat "" ["error: "; flag; " has been removed; "; dtb__59; "\n"]))) (fun _u -> ((Base_dApplicative.v_Base_dApplicative_dpure Base_dEff.v_Applicative_uBase_uEff_uEff_ur) 2)))
  | _ -> failwith "DT: impossible branch"
))

# 507 "Vuna/Compiler/Driver/CompilerCli.vuna"
let v_Vuna_dCompiler_dDriver_dCompilerCli_dprintErrText = (fun nConsole e -> (((Base_dMonad.v_Base_dMonad_d_x62__x62__x61_ Base_dEff.v_Monad_uBase_uEff_uEff_ur) ((Base_dEffConsole.v_Base_dEffConsole_dconsolePrint nConsole) e)) (fun _u -> ((Base_dApplicative.v_Base_dApplicative_dpure Base_dEff.v_Applicative_uBase_uEff_uEff_ur) 1))))

# 513 "Vuna/Compiler/Driver/CompilerCli.vuna"
let v_Vuna_dCompiler_dDriver_dCompilerCli_dseverityLabelOf = (fun d -> (match (d).Vuna_dCompiler_dBase_dDiag.f_Vuna_dCompiler_dBase_dDiag_dDiagnostic_diagSeverity with
  | Vuna_dCompiler_dBase_dDiag.C_Vuna_dCompiler_dBase_dDiag_dSeverity_SevError -> "error"
  | Vuna_dCompiler_dBase_dDiag.C_Vuna_dCompiler_dBase_dDiag_dSeverity_SevWarning -> "warning"
  | Vuna_dCompiler_dBase_dDiag.C_Vuna_dCompiler_dBase_dDiag_dSeverity_SevNote -> "note"
  | Vuna_dCompiler_dBase_dDiag.C_Vuna_dCompiler_dBase_dDiag_dSeverity_SevHelp -> "help"
  | _ -> failwith "DT: impossible branch"
))

# 538 "Vuna/Compiler/Driver/CompilerCli.vuna"
let v_Vuna_dCompiler_dDriver_dCompilerCli_dcollectSarifIn = (fun o d -> { o with f_Vuna_dCompiler_dDriver_dCompilerCli_dCliOpts_optSarifItems = ((Base_dList.v_Base_dList_dappend (o).f_Vuna_dCompiler_dDriver_dCompilerCli_dCliOpts_optSarifItems) (Base_dList.C_Base_dList_dList__x58__x58_ (d, Base_dList.C_Base_dList_dList_Nil))) })

# 521 "Vuna/Compiler/Driver/CompilerCli.vuna"
let v_Vuna_dCompiler_dDriver_dCompilerCli_demitDiag = (fun nFs nConsole o extra d -> (if ((o).f_Vuna_dCompiler_dDriver_dCompilerCli_dCliOpts_optDiagFormat = "json") then ((Base_dApplicative.v_Base_dApplicative_dpure Base_dEff.v_Applicative_uBase_uEff_uEff_ur) { Base_dPair.f_Base_dPair_dPair_first = (v_Vuna_dCompiler_dDriver_dCompilerCli_ddiagExitFor d); Base_dPair.f_Base_dPair_dPair_second = ((v_Vuna_dCompiler_dDriver_dCompilerCli_dcollectSarifIn o) d) }) else (if ((o).f_Vuna_dCompiler_dDriver_dCompilerCli_dCliOpts_optDiagFormat = "human") then (((Base_dMonad.v_Base_dMonad_d_x62__x62__x61_ Base_dEff.v_Monad_uBase_uEff_uEff_ur) (((Vuna_dCompiler_dBase_dDiag_dFormat.v_Vuna_dCompiler_dBase_dDiag_dFormat_drenderHuman nFs) (o).f_Vuna_dCompiler_dDriver_dCompilerCli_dCliOpts_optDiagLang) d)) (fun msg -> (((Base_dMonad.v_Base_dMonad_d_x62__x62__x61_ Base_dEff.v_Monad_uBase_uEff_uEff_ur) ((v_Vuna_dCompiler_dDriver_dCompilerCli_dprintErrText nConsole) (msg ^ "\n"))) (fun _u -> ((Base_dApplicative.v_Base_dApplicative_dpure Base_dEff.v_Applicative_uBase_uEff_uEff_ur) { Base_dPair.f_Base_dPair_dPair_first = (v_Vuna_dCompiler_dDriver_dCompilerCli_ddiagExitFor d); Base_dPair.f_Base_dPair_dPair_second = o }))))) else (if ((o).f_Vuna_dCompiler_dDriver_dCompilerCli_dCliOpts_optDiagFormat = "sarif") then ((Base_dApplicative.v_Base_dApplicative_dpure Base_dEff.v_Applicative_uBase_uEff_uEff_ur) { Base_dPair.f_Base_dPair_dPair_first = (v_Vuna_dCompiler_dDriver_dCompilerCli_ddiagExitFor d); Base_dPair.f_Base_dPair_dPair_second = ((v_Vuna_dCompiler_dDriver_dCompilerCli_dcollectSarifIn o) d) }) else (if ((o).f_Vuna_dCompiler_dDriver_dCompilerCli_dCliOpts_optDiagFormat = "github") then (((Base_dMonad.v_Base_dMonad_d_x62__x62__x61_ Base_dEff.v_Monad_uBase_uEff_uEff_ur) ((v_Vuna_dCompiler_dDriver_dCompilerCli_dprintErrText nConsole) ((Vuna_dCompiler_dBase_dDiag_dFormat.v_Vuna_dCompiler_dBase_dDiag_dFormat_drenderGithub d) ^ "\n"))) (fun _u -> ((Base_dApplicative.v_Base_dApplicative_dpure Base_dEff.v_Applicative_uBase_uEff_uEff_ur) { Base_dPair.f_Base_dPair_dPair_first = (v_Vuna_dCompiler_dDriver_dCompilerCli_ddiagExitFor d); Base_dPair.f_Base_dPair_dPair_second = o }))) else (((Base_dMonad.v_Base_dMonad_d_x62__x62__x61_ Base_dEff.v_Monad_uBase_uEff_uEff_ur) ((Vuna_dCompiler_dBase_dDiag_dFormat.v_Vuna_dCompiler_dBase_dDiag_dFormat_drenderShortSnippetEff nFs) d)) (fun snippet -> (((Base_dMonad.v_Base_dMonad_d_x62__x62__x61_ Base_dEff.v_Monad_uBase_uEff_uEff_ur) ((v_Vuna_dCompiler_dDriver_dCompilerCli_dprintErrText nConsole) (String.concat "" [(v_Vuna_dCompiler_dDriver_dCompilerCli_dseverityLabelOf d); ": "; extra; (Vuna_dCompiler_dBase_dDiag_dFormat.v_Vuna_dCompiler_dBase_dDiag_dFormat_drenderShort d); snippet; "\n"]))) (fun _u -> ((Base_dApplicative.v_Base_dApplicative_dpure Base_dEff.v_Applicative_uBase_uEff_uEff_ur) { Base_dPair.f_Base_dPair_dPair_first = (v_Vuna_dCompiler_dDriver_dCompilerCli_ddiagExitFor d); Base_dPair.f_Base_dPair_dPair_second = o }))))))))))

# 543 "Vuna/Compiler/Driver/CompilerCli.vuna"
let rec v_Vuna_dCompiler_dDriver_dCompilerCli_demitDiagRevSeq = (fun nFs nConsole mc0 mc1 mc2 -> (match mc2 with
  | Base_dList.C_Base_dList_dList__x58__x58_ (dtb__60, dtb__61) -> (((Base_dMonad.v_Base_dMonad_d_x62__x62__x61_ Base_dEff.v_Monad_uBase_uEff_uEff_ur) (((((v_Vuna_dCompiler_dDriver_dCompilerCli_demitDiagRevSeq nFs) nConsole) mc0) mc1) dtb__61)) (fun o1 -> (((Base_dMonad.v_Base_dMonad_d_x62__x62__x61_ Base_dEff.v_Monad_uBase_uEff_uEff_ur) (((((v_Vuna_dCompiler_dDriver_dCompilerCli_demitDiag nFs) nConsole) o1) mc1) dtb__60)) (fun r -> ((Base_dApplicative.v_Base_dApplicative_dpure Base_dEff.v_Applicative_uBase_uEff_uEff_ur) (Base_dPair.v_Base_dPair_dsecondOf r))))))
  | Base_dList.C_Base_dList_dList_Nil -> ((Base_dApplicative.v_Base_dApplicative_dpure Base_dEff.v_Applicative_uBase_uEff_uEff_ur) mc0)
  | _ -> failwith "DT: impossible branch"
))

# 550 "Vuna/Compiler/Driver/CompilerCli.vuna"
let v_Vuna_dCompiler_dDriver_dCompilerCli_dprintDiagWithPrefix = (fun nFs nConsole o extra d -> (match (d).Vuna_dCompiler_dBase_dDiag.f_Vuna_dCompiler_dBase_dDiag_dDiagnostic_diagChildren with
  | Base_dList.C_Base_dList_dList_Nil -> (((((v_Vuna_dCompiler_dDriver_dCompilerCli_demitDiag nFs) nConsole) o) extra) d)
  | _ -> ((fun shown -> (((Base_dMonad.v_Base_dMonad_d_x62__x62__x61_ Base_dEff.v_Monad_uBase_uEff_uEff_ur) (((((v_Vuna_dCompiler_dDriver_dCompilerCli_demitDiagRevSeq nFs) nConsole) o) extra) shown)) (fun o1 -> ((Base_dApplicative.v_Base_dApplicative_dpure Base_dEff.v_Applicative_uBase_uEff_uEff_ur) { Base_dPair.f_Base_dPair_dPair_first = (v_Vuna_dCompiler_dDriver_dCompilerCli_ddiagExitFor d); Base_dPair.f_Base_dPair_dPair_second = o1 })))) ((v_Vuna_dCompiler_dDriver_dCompilerCli_dtakeDiags (v_Vuna_dCompiler_dDriver_dCompilerCli_dmaxErrorsOf o)) (Base_dList.C_Base_dList_dList__x58__x58_ (d, ((v_Vuna_dCompiler_dDriver_dCompilerCli_dvisibleDiags o) (d).Vuna_dCompiler_dBase_dDiag.f_Vuna_dCompiler_dBase_dDiag_dDiagnostic_diagChildren)))))
))

# 561 "Vuna/Compiler/Driver/CompilerCli.vuna"
let v_Vuna_dCompiler_dDriver_dCompilerCli_dprintDiag = (fun nFs nConsole o d -> (((((v_Vuna_dCompiler_dDriver_dCompilerCli_dprintDiagWithPrefix nFs) nConsole) o) "") d))

# 565 "Vuna/Compiler/Driver/CompilerCli.vuna"
let v_Vuna_dCompiler_dDriver_dCompilerCli_dprintErr = (fun nConsole e -> ((v_Vuna_dCompiler_dDriver_dCompilerCli_dprintErrText nConsole) (String.concat "" ["error: "; e; "\n"])))

# 569 "Vuna/Compiler/Driver/CompilerCli.vuna"
let v_Vuna_dCompiler_dDriver_dCompilerCli_dprintDiagList = (fun nFs nConsole o extra ds -> ((fun shown -> (((Base_dMonad.v_Base_dMonad_d_x62__x62__x61_ Base_dEff.v_Monad_uBase_uEff_uEff_ur) (((((v_Vuna_dCompiler_dDriver_dCompilerCli_demitDiagRevSeq nFs) nConsole) o) extra) shown)) (fun o1 -> ((Base_dApplicative.v_Base_dApplicative_dpure Base_dEff.v_Applicative_uBase_uEff_uEff_ur) { Base_dPair.f_Base_dPair_dPair_first = 0; Base_dPair.f_Base_dPair_dPair_second = o1 })))) ((v_Vuna_dCompiler_dDriver_dCompilerCli_dtakeDiags (v_Vuna_dCompiler_dDriver_dCompilerCli_dmaxErrorsOf o)) ((v_Vuna_dCompiler_dDriver_dCompilerCli_dvisibleDiags o) ds))))

# 577 "Vuna/Compiler/Driver/CompilerCli.vuna"
let v_Vuna_dCompiler_dDriver_dCompilerCli_ddefaultDir = (fun mc0 -> (match mc0 with
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing -> "."
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Just (dtb__62) -> dtb__62
  | _ -> failwith "DT: impossible branch"
))

# 584 "Vuna/Compiler/Driver/CompilerCli.vuna"
let v_Vuna_dCompiler_dDriver_dCompilerCli_ddtPathErr = (fun nConsole path -> ((v_Vuna_dCompiler_dDriver_dCompilerCli_dprintErr nConsole) ("no such file or package directory: " ^ path)))

# 597 "Vuna/Compiler/Driver/CompilerCli.vuna"
let v_Vuna_dCompiler_dDriver_dCompilerCli_dexecutablePackageAt = (fun nFs nEnv label dir -> (((Base_dMonad.v_Base_dMonad_d_x62__x62__x61_ Base_dEff.v_Monad_uBase_uEff_uEff_ur) (((Vuna_dCompiler_dFrontend_dPackages_dPkg.v_Vuna_dCompiler_dFrontend_dPackages_dPkg_dloadPackage nFs) nEnv) dir)) (fun pkgR -> (match pkgR with
  | Vuna_dCompiler_dBase_dDiag.C_Vuna_dCompiler_dBase_dDiag_dCheck_ErrC (dtb__63) -> ((Base_dApplicative.v_Base_dApplicative_dpure Base_dEff.v_Applicative_uBase_uEff_uEff_ur) (Vuna_dCompiler_dBase_dDiag.C_Vuna_dCompiler_dBase_dDiag_dCheck_ErrC (dtb__63)))
  | Vuna_dCompiler_dBase_dDiag.C_Vuna_dCompiler_dBase_dDiag_dCheck_OkC (dtb__64) -> (((Base_dMonad.v_Base_dMonad_d_x62__x62__x61_ Base_dEff.v_Monad_uBase_uEff_uEff_ur) ((Base_dEffFs.v_Base_dEffFs_dfsFileExists nFs) (Vuna_dCompiler_dFrontend_dPackages_dPkg.v_Vuna_dCompiler_dFrontend_dPackages_dPkg_dpackageEntry dtb__64))) (fun exists -> (if exists then ((Base_dApplicative.v_Base_dApplicative_dpure Base_dEff.v_Applicative_uBase_uEff_uEff_ur) (Vuna_dCompiler_dBase_dDiag.C_Vuna_dCompiler_dBase_dDiag_dCheck_OkC (dtb__64))) else ((Base_dApplicative.v_Base_dApplicative_dpure Base_dEff.v_Applicative_uBase_uEff_uEff_ur) (Vuna_dCompiler_dBase_dDiag.v_Vuna_dCompiler_dBase_dDiag_derr (String.concat "" [label; ": library package "; (Vuna_dCompiler_dFrontend_dPackages_dPkg.v_Vuna_dCompiler_dFrontend_dPackages_dPkg_dpackageName dtb__64); " has no app/Main.vuna (an executable package is required)"]))))))
  | _ -> failwith "DT: impossible branch"
))))

# 588 "Vuna/Compiler/Driver/CompilerCli.vuna"
let v_Vuna_dCompiler_dDriver_dCompilerCli_dexecutablePackage = (fun nFs nEnv label dir -> (((Base_dMonad.v_Base_dMonad_d_x62__x62__x61_ Base_dEff.v_Monad_uBase_uEff_uEff_ur) ((Base_dEffFs.v_Base_dEffFs_dfsFileExists nFs) dir)) (fun exists -> (if exists then (((Base_dMonad.v_Base_dMonad_d_x62__x62__x61_ Base_dEff.v_Monad_uBase_uEff_uEff_ur) ((Base_dEffFs.v_Base_dEffFs_dfsIsDirectory nFs) dir)) (fun isDir -> (if isDir then ((((v_Vuna_dCompiler_dDriver_dCompilerCli_dexecutablePackageAt nFs) nEnv) label) dir) else ((Base_dApplicative.v_Base_dApplicative_dpure Base_dEff.v_Applicative_uBase_uEff_uEff_ur) (Vuna_dCompiler_dBase_dDiag.v_Vuna_dCompiler_dBase_dDiag_derr (String.concat "" [label; ": expected a package directory, not a file: "; dir])))))) else ((Base_dApplicative.v_Base_dApplicative_dpure Base_dEff.v_Applicative_uBase_uEff_uEff_ur) (Vuna_dCompiler_dBase_dDiag.v_Vuna_dCompiler_dBase_dDiag_derr ("no such file or package directory: " ^ dir)))))))

# 632 "Vuna/Compiler/Driver/CompilerCli.vuna"
let v_Vuna_dCompiler_dDriver_dCompilerCli_disKnownTarget = (fun t -> (if (if (t = "ocaml") then true else (t = "wasm")) then true else (t = "native")))

# 651 "Vuna/Compiler/Driver/CompilerCli.vuna"
let v_Vuna_dCompiler_dDriver_dCompilerCli_dcompileToTarget = (fun nFs nConsole nClock nEnv nProcess ctx entry printResult outDir target -> (if (target = "wasm") then (((Base_dMonad.v_Base_dMonad_d_x62__x62__x61_ Base_dEff.v_Monad_uBase_uEff_uEff_ur) (((((((Vuna_dCompiler_dDriver_dWasm.v_Vuna_dCompiler_dDriver_dWasm_dcompileWasm nFs) nEnv) nProcess) ctx) entry) printResult) outDir)) (fun r -> ((Base_dApplicative.v_Base_dApplicative_dpure Base_dEff.v_Applicative_uBase_uEff_uEff_ur) r))) else (if (target = "native") then (((Base_dMonad.v_Base_dMonad_d_x62__x62__x61_ Base_dEff.v_Monad_uBase_uEff_uEff_ur) (((((((Vuna_dCompiler_dDriver_dNative.v_Vuna_dCompiler_dDriver_dNative_dcompileNative nFs) nEnv) nProcess) ctx) entry) printResult) outDir)) (fun r -> ((Base_dApplicative.v_Base_dApplicative_dpure Base_dEff.v_Applicative_uBase_uEff_uEff_ur) (match r with
  | Vuna_dCompiler_dBase_dDiag.C_Vuna_dCompiler_dBase_dDiag_dCheck_ErrC (dtb__65) -> (Vuna_dCompiler_dBase_dDiag.C_Vuna_dCompiler_dBase_dDiag_dCheck_ErrC (dtb__65))
  | Vuna_dCompiler_dBase_dDiag.C_Vuna_dCompiler_dBase_dDiag_dCheck_OkC (dtb__66) -> (Vuna_dCompiler_dBase_dDiag.C_Vuna_dCompiler_dBase_dDiag_dCheck_OkC ({ Base_dPair.f_Base_dPair_dPair_first = dtb__66; Base_dPair.f_Base_dPair_dPair_second = Base_dList.C_Base_dList_dList_Nil }))
  | _ -> failwith "DT: impossible branch"
)))) else (((((((((Vuna_dCompiler_dDriver_dCompile.v_Vuna_dCompiler_dDriver_dCompile_dcompileToDir nFs) nConsole) nClock) nEnv) nProcess) ctx) entry) printResult) outDir))))

# 729 "Vuna/Compiler/Driver/CompilerCli.vuna"
let v_Vuna_dCompiler_dDriver_dCompilerCli_dcheckSpawnArgs = (fun o dir -> ((fun head0 -> ((fun base -> ((fun base2 -> ((fun base3 -> ((fun langArgs -> ((fun cascadeArgs -> ((fun sourceArgs -> ((fun failFastArgs -> ((fun maxArgs -> ((Base_dList.v_Base_dList_dappend base3) ((Base_dList.v_Base_dList_dappend langArgs) ((Base_dList.v_Base_dList_dappend maxArgs) ((Base_dList.v_Base_dList_dappend cascadeArgs) ((Base_dList.v_Base_dList_dappend sourceArgs) failFastArgs)))))) (if ((o).f_Vuna_dCompiler_dDriver_dCompilerCli_dCliOpts_optMaxErrors > 0) then (Base_dList.C_Base_dList_dList__x58__x58_ ("--max-errors", (Base_dList.C_Base_dList_dList__x58__x58_ ((bi_strFromInt (o).f_Vuna_dCompiler_dDriver_dCompilerCli_dCliOpts_optMaxErrors), Base_dList.C_Base_dList_dList_Nil)))) else Base_dList.C_Base_dList_dList_Nil))) (if (o).f_Vuna_dCompiler_dDriver_dCompilerCli_dCliOpts_optFailFast then (Base_dList.C_Base_dList_dList__x58__x58_ ("--fail-fast", Base_dList.C_Base_dList_dList_Nil)) else Base_dList.C_Base_dList_dList_Nil))) (if (o).f_Vuna_dCompiler_dDriver_dCompilerCli_dCliOpts_optWithSources then (Base_dList.C_Base_dList_dList__x58__x58_ ("--with-sources", Base_dList.C_Base_dList_dList_Nil)) else Base_dList.C_Base_dList_dList_Nil))) (if (o).f_Vuna_dCompiler_dDriver_dCompilerCli_dCliOpts_optShowCascade then (Base_dList.C_Base_dList_dList__x58__x58_ ("--show-cascade", Base_dList.C_Base_dList_dList_Nil)) else Base_dList.C_Base_dList_dList_Nil))) (if (o).f_Vuna_dCompiler_dDriver_dCompilerCli_dCliOpts_optLangExplicit then (Base_dList.C_Base_dList_dList__x58__x58_ ("--lang", (Base_dList.C_Base_dList_dList__x58__x58_ ((o).f_Vuna_dCompiler_dDriver_dCompilerCli_dCliOpts_optDiagLang, Base_dList.C_Base_dList_dList_Nil)))) else Base_dList.C_Base_dList_dList_Nil))) (if (o).f_Vuna_dCompiler_dDriver_dCompilerCli_dCliOpts_optDenyWarnings then ((Base_dList.v_Base_dList_dappend base2) (Base_dList.C_Base_dList_dList__x58__x58_ ("--deny-warnings", Base_dList.C_Base_dList_dList_Nil))) else base2))) (if (o).f_Vuna_dCompiler_dDriver_dCompilerCli_dCliOpts_optShowWarnings then ((Base_dList.v_Base_dList_dappend base) (Base_dList.C_Base_dList_dList__x58__x58_ ("--warnings", Base_dList.C_Base_dList_dList_Nil))) else base))) (if ((o).f_Vuna_dCompiler_dDriver_dCompilerCli_dCliOpts_optDiagFormat = "short") then ((Base_dList.v_Base_dList_dappend head0) (Base_dList.C_Base_dList_dList__x58__x58_ (dir, Base_dList.C_Base_dList_dList_Nil))) else ((Base_dList.v_Base_dList_dappend head0) (Base_dList.C_Base_dList_dList__x58__x58_ ("--error-format", (Base_dList.C_Base_dList_dList__x58__x58_ ((o).f_Vuna_dCompiler_dDriver_dCompilerCli_dCliOpts_optDiagFormat, (Base_dList.C_Base_dList_dList__x58__x58_ (dir, Base_dList.C_Base_dList_dList_Nil)))))))))) (if (o).f_Vuna_dCompiler_dDriver_dCompilerCli_dCliOpts_optRelease then (Base_dList.C_Base_dList_dList__x58__x58_ ("check", (Base_dList.C_Base_dList_dList__x58__x58_ ("--release", Base_dList.C_Base_dList_dList_Nil)))) else (Base_dList.C_Base_dList_dList__x58__x58_ ("check", Base_dList.C_Base_dList_dList_Nil)))))

# 748 "Vuna/Compiler/Driver/CompilerCli.vuna"
let v_Vuna_dCompiler_dDriver_dCompilerCli_disMachineFormat = (fun f -> (if (f = "json") then true else (f = "sarif")))

# 790 "Vuna/Compiler/Driver/CompilerCli.vuna"
let v_Vuna_dCompiler_dDriver_dCompilerCli_disWorkspaceRoot = (fun nFs nEnv pkg -> (((Base_dMonad.v_Base_dMonad_d_x62__x62__x61_ Base_dEff.v_Monad_uBase_uEff_uEff_ur) (((Vuna_dCompiler_dFrontend_dPackages_dPkg.v_Vuna_dCompiler_dFrontend_dPackages_dPkg_dworkspacePackages nFs) nEnv) (Vuna_dCompiler_dFrontend_dPackages_dPkg.v_Vuna_dCompiler_dFrontend_dPackages_dPkg_dpackageDir pkg))) (fun pkgsR -> ((Base_dApplicative.v_Base_dApplicative_dpure Base_dEff.v_Applicative_uBase_uEff_uEff_ur) (match pkgsR with
  | Vuna_dCompiler_dBase_dDiag.C_Vuna_dCompiler_dBase_dDiag_dCheck_OkC (dtb__67) -> ((Base_dList.v_Base_dList_dlength dtb__67) > 1)
  | Vuna_dCompiler_dBase_dDiag.C_Vuna_dCompiler_dBase_dDiag_dCheck_ErrC (dtb__68) -> false
  | _ -> failwith "DT: impossible branch"
)))))

# 832 "Vuna/Compiler/Driver/CompilerCli.vuna"
let rec v_Vuna_dCompiler_dDriver_dCompilerCli_dcountFailures = (fun mc0 mc1 -> (match mc1 with
  | Base_dList.C_Base_dList_dList__x58__x58_ (dtb__69, dtb__70) -> (if (dtb__69 = 0) then ((v_Vuna_dCompiler_dDriver_dCompilerCli_dcountFailures mc0) dtb__70) else ((v_Vuna_dCompiler_dDriver_dCompilerCli_dcountFailures 1) dtb__70))
  | Base_dList.C_Base_dList_dList_Nil -> mc0
  | _ -> failwith "DT: impossible branch"
))

# 952 "Vuna/Compiler/Driver/CompilerCli.vuna"
let v_Vuna_dCompiler_dDriver_dCompilerCli_disSingleLibraryPackage = (fun nFs mc0 -> (match mc0 with
  | Base_dList.C_Base_dList_dList__x58__x58_ (dtb__71, dtb__72) -> (match dtb__72 with
  | Base_dList.C_Base_dList_dList_Nil -> (((Base_dMonad.v_Base_dMonad_d_x62__x62__x61_ Base_dEff.v_Monad_uBase_uEff_uEff_ur) ((Base_dEffFs.v_Base_dEffFs_dfsFileExists nFs) (Vuna_dCompiler_dFrontend_dPackages_dPkg.v_Vuna_dCompiler_dFrontend_dPackages_dPkg_dpackageEntry dtb__71))) (fun exists -> ((Base_dApplicative.v_Base_dApplicative_dpure Base_dEff.v_Applicative_uBase_uEff_uEff_ur) (Base_dBool.v_Base_dBool_dnot exists))))
  | _ -> ((Base_dApplicative.v_Base_dApplicative_dpure Base_dEff.v_Applicative_uBase_uEff_uEff_ur) false)
)
  | _ -> ((Base_dApplicative.v_Base_dApplicative_dpure Base_dEff.v_Applicative_uBase_uEff_uEff_ur) false)
))

# 958 "Vuna/Compiler/Driver/CompilerCli.vuna"
let v_Vuna_dCompiler_dDriver_dCompilerCli_dlibraryOnlyMessage = (fun mc0 -> (match mc0 with
  | Base_dList.C_Base_dList_dList_Nil -> "no package to build"
  | Base_dList.C_Base_dList_dList__x58__x58_ (dtb__73, dtb__74) -> (String.concat "" ["library package "; (Vuna_dCompiler_dFrontend_dPackages_dPkg.v_Vuna_dCompiler_dFrontend_dPackages_dPkg_dpackageName dtb__73); " has no app/Main.vuna (an executable package is required; use check for libraries)"])
  | _ -> failwith "DT: impossible branch"
))

# 969 "Vuna/Compiler/Driver/CompilerCli.vuna"
let rec v_Vuna_dCompiler_dDriver_dCompilerCli_dfindPackageByName = (fun mc0 mc1 -> (match mc1 with
  | Base_dList.C_Base_dList_dList__x58__x58_ (dtb__75, dtb__76) -> (if ((Vuna_dCompiler_dFrontend_dPackages_dPkg.v_Vuna_dCompiler_dFrontend_dPackages_dPkg_dpackageName dtb__75) = mc0) then (Base_dMaybe.C_Base_dMaybe_dMaybe_Just (dtb__75)) else ((v_Vuna_dCompiler_dDriver_dCompilerCli_dfindPackageByName mc0) dtb__76))
  | Base_dList.C_Base_dList_dList_Nil -> Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing
  | _ -> failwith "DT: impossible branch"
))

# 963 "Vuna/Compiler/Driver/CompilerCli.vuna"
let v_Vuna_dCompiler_dDriver_dCompilerCli_dselectBuildTargets = (fun mc0 mc1 -> (match mc0 with
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Just (dtb__77) -> (match ((v_Vuna_dCompiler_dDriver_dCompilerCli_dfindPackageByName dtb__77) mc1) with
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing -> (Vuna_dCompiler_dBase_dDiag.v_Vuna_dCompiler_dBase_dDiag_derr ("no such package in workspace: " ^ dtb__77))
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Just (dtb__78) -> (Vuna_dCompiler_dBase_dDiag.C_Vuna_dCompiler_dBase_dDiag_dCheck_OkC ((Base_dList.C_Base_dList_dList__x58__x58_ (dtb__78, Base_dList.C_Base_dList_dList_Nil))))
  | _ -> failwith "DT: impossible branch"
)
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing -> (Vuna_dCompiler_dBase_dDiag.C_Vuna_dCompiler_dBase_dDiag_dCheck_OkC (mc1))
  | _ -> failwith "DT: impossible branch"
))

# 985 "Vuna/Compiler/Driver/CompilerCli.vuna"
let v_Vuna_dCompiler_dDriver_dCompilerCli_dbuildNativeOne = (fun nFs nConsole nEnv nProcess noCompile multiOut outM pkg o -> ((fun name -> ((fun outDir -> ((fun sPath -> ((fun binDir -> ((fun binPath -> ((fun script -> ((fun ccArgs -> (((Base_dMonad.v_Base_dMonad_d_x62__x62__x61_ Base_dEff.v_Monad_uBase_uEff_uEff_ur) (((((((Vuna_dCompiler_dDriver_dNative.v_Vuna_dCompiler_dDriver_dNative_dcompileNative nFs) nEnv) nProcess) ((Vuna_dCompiler_dFrontend_dPackages_dPkg.v_Vuna_dCompiler_dFrontend_dPackages_dPkg_dcontextWithRelease (o).f_Vuna_dCompiler_dDriver_dCompilerCli_dCliOpts_optRelease) (Vuna_dCompiler_dFrontend_dPackages_dPkg.v_Vuna_dCompiler_dFrontend_dPackages_dPkg_dpackageContext pkg))) (Vuna_dCompiler_dFrontend_dPackages_dPkg.v_Vuna_dCompiler_dFrontend_dPackages_dPkg_dpackageEntry pkg)) true) outDir)) (fun r -> (match r with
  | Vuna_dCompiler_dBase_dDiag.C_Vuna_dCompiler_dBase_dDiag_dCheck_ErrC (dtb__79) -> ((((v_Vuna_dCompiler_dDriver_dCompilerCli_dprintDiag nFs) nConsole) o) dtb__79)
  | Vuna_dCompiler_dBase_dDiag.C_Vuna_dCompiler_dBase_dDiag_dCheck_OkC (dtb__80) -> (((Base_dMonad.v_Base_dMonad_d_x62__x62__x61_ Base_dEff.v_Monad_uBase_uEff_uEff_ur) (((Base_dEffFs.v_Base_dEffFs_dfsWriteFile nFs) (outDir ^ "/build.sh")) script)) (fun _u -> (if noCompile then (((Base_dMonad.v_Base_dMonad_d_x62__x62__x61_ Base_dEff.v_Monad_uBase_uEff_uEff_ur) ((Base_dEffConsole.v_Base_dEffConsole_dconsolePrint nConsole) (String.concat "" ["wrote "; sPath; "\n"]))) (fun _u -> ((Base_dApplicative.v_Base_dApplicative_dpure Base_dEff.v_Applicative_uBase_uEff_uEff_ur) { Base_dPair.f_Base_dPair_dPair_first = 0; Base_dPair.f_Base_dPair_dPair_second = o }))) else (((Base_dMonad.v_Base_dMonad_d_x62__x62__x61_ Base_dEff.v_Monad_uBase_uEff_uEff_ur) (((Vuna_dCompiler_dDriver_dCompile.v_Vuna_dCompiler_dDriver_dCompile_densureDirPath nFs) nProcess) binDir)) (fun _u -> (((Base_dMonad.v_Base_dMonad_d_x62__x62__x61_ Base_dEff.v_Monad_uBase_uEff_uEff_ur) (((Base_dEffProcess.v_Base_dEffProcess_dprocessRunIn nProcess) ".") ccArgs)) (fun code -> (if (code = 0) then (((Base_dMonad.v_Base_dMonad_d_x62__x62__x61_ Base_dEff.v_Monad_uBase_uEff_uEff_ur) ((Base_dEffConsole.v_Base_dEffConsole_dconsolePrint nConsole) (String.concat "" ["wrote "; binPath; "\n"]))) (fun _u -> ((Base_dApplicative.v_Base_dApplicative_dpure Base_dEff.v_Applicative_uBase_uEff_uEff_ur) { Base_dPair.f_Base_dPair_dPair_first = 0; Base_dPair.f_Base_dPair_dPair_second = o }))) else (((Base_dMonad.v_Base_dMonad_d_x62__x62__x61_ Base_dEff.v_Monad_uBase_uEff_uEff_ur) ((Base_dEffConsole.v_Base_dEffConsole_dconsolePrint nConsole) (String.concat "" ["native link failed: cc exited "; (bi_strFromInt code); "\n"]))) (fun _u -> ((Base_dApplicative.v_Base_dApplicative_dpure Base_dEff.v_Applicative_uBase_uEff_uEff_ur) { Base_dPair.f_Base_dPair_dPair_first = 1; Base_dPair.f_Base_dPair_dPair_second = o })))))))))))
  | _ -> failwith "DT: impossible branch"
)))) (Base_dList.C_Base_dList_dList__x58__x58_ ("cc", (Base_dList.C_Base_dList_dList__x58__x58_ ("-static", (Base_dList.C_Base_dList_dList__x58__x58_ ("-nostdlib", (Base_dList.C_Base_dList_dList__x58__x58_ ("-no-pie", (Base_dList.C_Base_dList_dList__x58__x58_ ("-Wl,--build-id=none", (Base_dList.C_Base_dList_dList__x58__x58_ ("-o", (Base_dList.C_Base_dList_dList__x58__x58_ (binPath, (Base_dList.C_Base_dList_dList__x58__x58_ (sPath, Base_dList.C_Base_dList_dList_Nil)))))))))))))))))) (String.concat "" ["#!/bin/sh\nset -eu\ncd \"$(dirname \"$0\")\"\nmkdir -p bin\ncc -static -nostdlib -no-pie -Wl,--build-id=none -o \"bin/"; name; "\" main.s\n"]))) (String.concat "" [binDir; "/"; name]))) (outDir ^ "/bin"))) (outDir ^ "/main.s"))) (match outM with
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Just (dtb__81) -> (if multiOut then (String.concat "" [dtb__81; "/"; name]) else dtb__81)
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing -> ((Vuna_dCompiler_dFrontend_dPackages_dPkg.v_Vuna_dCompiler_dFrontend_dPackages_dPkg_dpackageDir pkg) ^ "/.output")
  | _ -> failwith "DT: impossible branch"
))) (Vuna_dCompiler_dFrontend_dPackages_dPkg.v_Vuna_dCompiler_dFrontend_dPackages_dPkg_dpackageName pkg)))

# 1149 "Vuna/Compiler/Driver/CompilerCli.vuna"
let rec v_Vuna_dCompiler_dDriver_dCompilerCli_dwaitView = (fun nFs nClock nEnv nProcess kind digest fuel -> (((Base_dMonad.v_Base_dMonad_d_x62__x62__x61_ Base_dEff.v_Monad_uBase_uEff_uEff_ur) ((((((Vuna_dCompiler_dBase_dStore.v_Vuna_dCompiler_dBase_dStore_dstoreViewLockEff nFs) nClock) nEnv) nProcess) kind) digest)) (fun ok -> (if ok then ((Base_dApplicative.v_Base_dApplicative_dpure Base_dEff.v_Applicative_uBase_uEff_uEff_ur) "locked") else (((Base_dMonad.v_Base_dMonad_d_x62__x62__x61_ Base_dEff.v_Monad_uBase_uEff_uEff_ur) (((((Vuna_dCompiler_dBase_dStore.v_Vuna_dCompiler_dBase_dStore_dstoreViewValidEff nFs) nEnv) nProcess) kind) digest)) (fun valid -> (if valid then ((Base_dApplicative.v_Base_dApplicative_dpure Base_dEff.v_Applicative_uBase_uEff_uEff_ur) "ready") else (if (fuel <= 0) then ((Base_dApplicative.v_Base_dApplicative_dpure Base_dEff.v_Applicative_uBase_uEff_uEff_ur) "timeout") else (((Base_dMonad.v_Base_dMonad_d_x62__x62__x61_ Base_dEff.v_Monad_uBase_uEff_uEff_ur) ((Base_dEffClock.v_Base_dEffClock_dclockSleepMicros nClock) 100000)) (fun _u -> (((((((v_Vuna_dCompiler_dDriver_dCompilerCli_dwaitView nFs) nClock) nEnv) nProcess) kind) digest) (fuel - 1))))))))))))

# 1161 "Vuna/Compiler/Driver/CompilerCli.vuna"
let v_Vuna_dCompiler_dDriver_dCompilerCli_dmarkViewComplete = (fun nFs dir digest -> (((Base_dEffFs.v_Base_dEffFs_dfsWriteFileAtomic nFs) (dir ^ "/.complete")) digest))

# 1167 "Vuna/Compiler/Driver/CompilerCli.vuna"
let v_Vuna_dCompiler_dDriver_dCompilerCli_dlinkDefaultOutput = (fun nFs mc0 mc1 mc2 mc3 -> (match mc0 with
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing -> ((fun link -> (((Base_dMonad.v_Base_dMonad_d_x62__x62__x61_ Base_dEff.v_Monad_uBase_uEff_uEff_ur) ((Base_dEffFs.v_Base_dEffFs_dfsRemoveTree nFs) link)) (fun _u -> (((Base_dEffFs.v_Base_dEffFs_dfsSymlink nFs) mc2) link)))) ((Vuna_dCompiler_dFrontend_dPackages_dPkg.v_Vuna_dCompiler_dFrontend_dPackages_dPkg_dpackageDir mc1) ^ "/.output"))
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Just (dtb__82) -> ((Base_dApplicative.v_Base_dApplicative_dpure Base_dEff.v_Applicative_uBase_uEff_uEff_ur) 0)
  | _ -> failwith "DT: impossible branch"
))

# 1176 "Vuna/Compiler/Driver/CompilerCli.vuna"
let v_Vuna_dCompiler_dDriver_dCompilerCli_dcompileCodegen = (fun nFs nConsole nClock nEnv nProcess ctx entry outDir o -> (((Base_dMonad.v_Base_dMonad_d_x62__x62__x61_ Base_dEff.v_Monad_uBase_uEff_uEff_ur) (((((((((Vuna_dCompiler_dDriver_dCompile.v_Vuna_dCompiler_dDriver_dCompile_dcompileToDir nFs) nConsole) nClock) nEnv) nProcess) ctx) entry) true) outDir)) (fun r -> (match r with
  | Vuna_dCompiler_dBase_dDiag.C_Vuna_dCompiler_dBase_dDiag_dCheck_ErrC (dtb__83) -> ((((v_Vuna_dCompiler_dDriver_dCompilerCli_dprintDiag nFs) nConsole) o) dtb__83)
  | Vuna_dCompiler_dBase_dDiag.C_Vuna_dCompiler_dBase_dDiag_dCheck_OkC (dtb__84) -> ((Base_dApplicative.v_Base_dApplicative_dpure Base_dEff.v_Applicative_uBase_uEff_uEff_ur) { Base_dPair.f_Base_dPair_dPair_first = 0; Base_dPair.f_Base_dPair_dPair_second = o })
  | _ -> failwith "DT: impossible branch"
))))

# 1185 "Vuna/Compiler/Driver/CompilerCli.vuna"
let v_Vuna_dCompiler_dDriver_dCompilerCli_dbuildLinked = (fun nFs nConsole nProcess ctx entry outDir name o -> (((Base_dMonad.v_Base_dMonad_d_x62__x62__x61_ Base_dEff.v_Monad_uBase_uEff_uEff_ur) (((Vuna_dCompiler_dDriver_dCompile.v_Vuna_dCompiler_dDriver_dCompile_densureDirPath nFs) nProcess) (outDir ^ "/bin"))) (fun _u -> (((Base_dMonad.v_Base_dMonad_d_x62__x62__x61_ Base_dEff.v_Monad_uBase_uEff_uEff_ur) ((((Vuna_dCompiler_dDriver_dCompile.v_Vuna_dCompiler_dDriver_dCompile_drunBuildScript nProcess) outDir) ("bin/" ^ name)) name)) (fun r -> (match r with
  | Vuna_dCompiler_dBase_dDiag.C_Vuna_dCompiler_dBase_dDiag_dCheck_ErrC (dtb__85) -> ((((v_Vuna_dCompiler_dDriver_dCompilerCli_dprintDiag nFs) nConsole) o) dtb__85)
  | Vuna_dCompiler_dBase_dDiag.C_Vuna_dCompiler_dBase_dDiag_dCheck_OkC (dtb__86) -> (((Base_dMonad.v_Base_dMonad_d_x62__x62__x61_ Base_dEff.v_Monad_uBase_uEff_uEff_ur) (((((Vuna_dCompiler_dDriver_dCompile.v_Vuna_dCompiler_dDriver_dCompile_dwriteBuildMeta nFs) outDir) ctx) entry) true)) (fun _u -> (((Base_dMonad.v_Base_dMonad_d_x62__x62__x61_ Base_dEff.v_Monad_uBase_uEff_uEff_ur) ((Base_dEffConsole.v_Base_dEffConsole_dconsolePrint nConsole) (String.concat "" ["built "; outDir; "/bin/"; name; "\n"]))) (fun _u -> ((Base_dApplicative.v_Base_dApplicative_dpure Base_dEff.v_Applicative_uBase_uEff_uEff_ur) { Base_dPair.f_Base_dPair_dPair_first = 0; Base_dPair.f_Base_dPair_dPair_second = o })))))
  | _ -> failwith "DT: impossible branch"
))))))

# 1082 "Vuna/Compiler/Driver/CompilerCli.vuna"
let v_Vuna_dCompiler_dDriver_dCompilerCli_dbuildExplicit = (fun nFs nConsole nClock nEnv nProcess out multiOut pkg ctx entry o -> ((fun name -> ((fun outDir -> ((fun binPath -> (((Base_dMonad.v_Base_dMonad_d_x62__x62__x61_ Base_dEff.v_Monad_uBase_uEff_uEff_ur) (((((Vuna_dCompiler_dDriver_dCompile.v_Vuna_dCompiler_dDriver_dCompile_dmetaUpToDate nFs) outDir) ctx) entry) binPath)) (fun fresh -> (if fresh then (((Base_dMonad.v_Base_dMonad_d_x62__x62__x61_ Base_dEff.v_Monad_uBase_uEff_uEff_ur) ((Base_dEffConsole.v_Base_dEffConsole_dconsolePrint nConsole) (String.concat "" ["up to date: "; binPath; "\n"]))) (fun _u -> ((Base_dApplicative.v_Base_dApplicative_dpure Base_dEff.v_Applicative_uBase_uEff_uEff_ur) { Base_dPair.f_Base_dPair_dPair_first = 0; Base_dPair.f_Base_dPair_dPair_second = o }))) else (((Base_dMonad.v_Base_dMonad_d_x62__x62__x61_ Base_dEff.v_Monad_uBase_uEff_uEff_ur) (((((((((Vuna_dCompiler_dDriver_dCompile.v_Vuna_dCompiler_dDriver_dCompile_dcompileToDir nFs) nConsole) nClock) nEnv) nProcess) ctx) entry) true) outDir)) (fun r -> (match r with
  | Vuna_dCompiler_dBase_dDiag.C_Vuna_dCompiler_dBase_dDiag_dCheck_ErrC (dtb__87) -> ((((v_Vuna_dCompiler_dDriver_dCompilerCli_dprintDiag nFs) nConsole) o) dtb__87)
  | Vuna_dCompiler_dBase_dDiag.C_Vuna_dCompiler_dBase_dDiag_dCheck_OkC (dtb__88) -> ((((((((v_Vuna_dCompiler_dDriver_dCompilerCli_dbuildLinked nFs) nConsole) nProcess) ctx) entry) outDir) name) o)
  | _ -> failwith "DT: impossible branch"
))))))) (String.concat "" [outDir; "/bin/"; name]))) (if multiOut then (String.concat "" [out; "/"; name]) else out))) (Vuna_dCompiler_dFrontend_dPackages_dPkg.v_Vuna_dCompiler_dFrontend_dPackages_dPkg_dpackageName pkg)))

# 1101 "Vuna/Compiler/Driver/CompilerCli.vuna"
let v_Vuna_dCompiler_dDriver_dCompilerCli_dbuildDefaultView = (fun nFs nConsole nClock nEnv nProcess ctx pkg name entry viewDigest o -> (((Base_dMonad.v_Base_dMonad_d_x62__x62__x61_ Base_dEff.v_Monad_uBase_uEff_uEff_ur) (((((Vuna_dCompiler_dBase_dStore.v_Vuna_dCompiler_dBase_dStore_dstoreViewPathEff nFs) nEnv) nProcess) "bin") viewDigest)) (fun view -> ((fun binPath -> (((Base_dMonad.v_Base_dMonad_d_x62__x62__x61_ Base_dEff.v_Monad_uBase_uEff_uEff_ur) (((((Vuna_dCompiler_dBase_dStore.v_Vuna_dCompiler_dBase_dStore_dstoreViewValidEff nFs) nEnv) nProcess) "bin") viewDigest)) (fun valid -> (((Base_dMonad.v_Base_dMonad_d_x62__x62__x61_ Base_dEff.v_Monad_uBase_uEff_uEff_ur) (if valid then (((((Vuna_dCompiler_dDriver_dCompile.v_Vuna_dCompiler_dDriver_dCompile_dmetaUpToDate nFs) view) ctx) entry) binPath) else ((Base_dApplicative.v_Base_dApplicative_dpure Base_dEff.v_Applicative_uBase_uEff_uEff_ur) false))) (fun fresh -> (if fresh then (((Base_dMonad.v_Base_dMonad_d_x62__x62__x61_ Base_dEff.v_Monad_uBase_uEff_uEff_ur) (((((v_Vuna_dCompiler_dDriver_dCompilerCli_dlinkDefaultOutput nFs) Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing) pkg) view) viewDigest)) (fun _u -> (((Base_dMonad.v_Base_dMonad_d_x62__x62__x61_ Base_dEff.v_Monad_uBase_uEff_uEff_ur) ((Base_dEffConsole.v_Base_dEffConsole_dconsolePrint nConsole) (String.concat "" ["up to date: "; binPath; "\n"]))) (fun _u -> ((Base_dApplicative.v_Base_dApplicative_dpure Base_dEff.v_Applicative_uBase_uEff_uEff_ur) { Base_dPair.f_Base_dPair_dPair_first = 0; Base_dPair.f_Base_dPair_dPair_second = o }))))) else (((Base_dMonad.v_Base_dMonad_d_x62__x62__x61_ Base_dEff.v_Monad_uBase_uEff_uEff_ur) (((((((v_Vuna_dCompiler_dDriver_dCompilerCli_dwaitView nFs) nClock) nEnv) nProcess) "bin") viewDigest) 600)) (fun state -> (if (state = "locked") then (((Base_dMonad.v_Base_dMonad_d_x62__x62__x61_ Base_dEff.v_Monad_uBase_uEff_uEff_ur) (((((Vuna_dCompiler_dBase_dStore.v_Vuna_dCompiler_dBase_dStore_dstoreViewValidEff nFs) nEnv) nProcess) "bin") viewDigest)) (fun valid2 -> (((Base_dMonad.v_Base_dMonad_d_x62__x62__x61_ Base_dEff.v_Monad_uBase_uEff_uEff_ur) (if valid2 then (((((Vuna_dCompiler_dDriver_dCompile.v_Vuna_dCompiler_dDriver_dCompile_dmetaUpToDate nFs) view) ctx) entry) binPath) else ((Base_dApplicative.v_Base_dApplicative_dpure Base_dEff.v_Applicative_uBase_uEff_uEff_ur) false))) (fun fresh2 -> (if fresh2 then (((Base_dMonad.v_Base_dMonad_d_x62__x62__x61_ Base_dEff.v_Monad_uBase_uEff_uEff_ur) (((((v_Vuna_dCompiler_dDriver_dCompilerCli_dlinkDefaultOutput nFs) Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing) pkg) view) viewDigest)) (fun _u -> (((Base_dMonad.v_Base_dMonad_d_x62__x62__x61_ Base_dEff.v_Monad_uBase_uEff_uEff_ur) (((((Vuna_dCompiler_dBase_dStore.v_Vuna_dCompiler_dBase_dStore_dstoreViewUnlockEff nFs) nEnv) nProcess) "bin") viewDigest)) (fun _u -> (((Base_dMonad.v_Base_dMonad_d_x62__x62__x61_ Base_dEff.v_Monad_uBase_uEff_uEff_ur) ((Base_dEffConsole.v_Base_dEffConsole_dconsolePrint nConsole) (String.concat "" ["up to date: "; binPath; "\n"]))) (fun _u -> ((Base_dApplicative.v_Base_dApplicative_dpure Base_dEff.v_Applicative_uBase_uEff_uEff_ur) { Base_dPair.f_Base_dPair_dPair_first = 0; Base_dPair.f_Base_dPair_dPair_second = o }))))))) else (((Base_dMonad.v_Base_dMonad_d_x62__x62__x61_ Base_dEff.v_Monad_uBase_uEff_uEff_ur) (((((((((Vuna_dCompiler_dDriver_dCompile.v_Vuna_dCompiler_dDriver_dCompile_dcompileToDir nFs) nConsole) nClock) nEnv) nProcess) ctx) entry) true) view)) (fun r -> (match r with
  | Vuna_dCompiler_dBase_dDiag.C_Vuna_dCompiler_dBase_dDiag_dCheck_ErrC (dtb__89) -> (((Base_dMonad.v_Base_dMonad_d_x62__x62__x61_ Base_dEff.v_Monad_uBase_uEff_uEff_ur) ((Base_dEffFs.v_Base_dEffFs_dfsRemoveTree nFs) view)) (fun _u -> (((Base_dMonad.v_Base_dMonad_d_x62__x62__x61_ Base_dEff.v_Monad_uBase_uEff_uEff_ur) (((((Vuna_dCompiler_dBase_dStore.v_Vuna_dCompiler_dBase_dStore_dstoreViewUnlockEff nFs) nEnv) nProcess) "bin") viewDigest)) (fun _u -> ((((v_Vuna_dCompiler_dDriver_dCompilerCli_dprintDiag nFs) nConsole) o) dtb__89)))))
  | Vuna_dCompiler_dBase_dDiag.C_Vuna_dCompiler_dBase_dDiag_dCheck_OkC (dtb__90) -> (((Base_dMonad.v_Base_dMonad_d_x62__x62__x61_ Base_dEff.v_Monad_uBase_uEff_uEff_ur) ((((((((v_Vuna_dCompiler_dDriver_dCompilerCli_dbuildLinked nFs) nConsole) nProcess) ctx) entry) view) name) o)) (fun br -> (if ((Base_dPair.v_Base_dPair_dfirstOf br) = 0) then (((Base_dMonad.v_Base_dMonad_d_x62__x62__x61_ Base_dEff.v_Monad_uBase_uEff_uEff_ur) (((v_Vuna_dCompiler_dDriver_dCompilerCli_dmarkViewComplete nFs) view) viewDigest)) (fun _u -> (((Base_dMonad.v_Base_dMonad_d_x62__x62__x61_ Base_dEff.v_Monad_uBase_uEff_uEff_ur) (((((v_Vuna_dCompiler_dDriver_dCompilerCli_dlinkDefaultOutput nFs) Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing) pkg) view) viewDigest)) (fun _u -> (((Base_dMonad.v_Base_dMonad_d_x62__x62__x61_ Base_dEff.v_Monad_uBase_uEff_uEff_ur) (((((Vuna_dCompiler_dBase_dStore.v_Vuna_dCompiler_dBase_dStore_dstoreViewUnlockEff nFs) nEnv) nProcess) "bin") viewDigest)) (fun _u -> ((Base_dApplicative.v_Base_dApplicative_dpure Base_dEff.v_Applicative_uBase_uEff_uEff_ur) br))))))) else (((Base_dMonad.v_Base_dMonad_d_x62__x62__x61_ Base_dEff.v_Monad_uBase_uEff_uEff_ur) (((((Vuna_dCompiler_dBase_dStore.v_Vuna_dCompiler_dBase_dStore_dstoreViewUnlockEff nFs) nEnv) nProcess) "bin") viewDigest)) (fun _u -> ((Base_dApplicative.v_Base_dApplicative_dpure Base_dEff.v_Applicative_uBase_uEff_uEff_ur) br))))))
  | _ -> failwith "DT: impossible branch"
)))))))) else (if (state = "ready") then (((Base_dMonad.v_Base_dMonad_d_x62__x62__x61_ Base_dEff.v_Monad_uBase_uEff_uEff_ur) (((((v_Vuna_dCompiler_dDriver_dCompilerCli_dlinkDefaultOutput nFs) Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing) pkg) view) viewDigest)) (fun _u -> (((Base_dMonad.v_Base_dMonad_d_x62__x62__x61_ Base_dEff.v_Monad_uBase_uEff_uEff_ur) ((Base_dEffConsole.v_Base_dEffConsole_dconsolePrint nConsole) (String.concat "" ["up to date: "; binPath; "\n"]))) (fun _u -> ((Base_dApplicative.v_Base_dApplicative_dpure Base_dEff.v_Applicative_uBase_uEff_uEff_ur) { Base_dPair.f_Base_dPair_dPair_first = 0; Base_dPair.f_Base_dPair_dPair_second = o }))))) else (((Base_dMonad.v_Base_dMonad_d_x62__x62__x61_ Base_dEff.v_Monad_uBase_uEff_uEff_ur) ((Base_dEffConsole.v_Base_dEffConsole_dconsolePrint nConsole) (String.concat "" ["error: timed out waiting for view "; viewDigest; "\n"]))) (fun _u -> ((Base_dApplicative.v_Base_dApplicative_dpure Base_dEff.v_Applicative_uBase_uEff_uEff_ur) { Base_dPair.f_Base_dPair_dPair_first = 1; Base_dPair.f_Base_dPair_dPair_second = o }))))))))))))) (String.concat "" [view; "/bin/"; name])))))

# 1200 "Vuna/Compiler/Driver/CompilerCli.vuna"
let v_Vuna_dCompiler_dDriver_dCompilerCli_dstripDotSlash = (fun s -> (if ((Base_dString.v_Base_dString_dstartsWith "./") s) then (((Base_dString.v_Base_dString_dsubstring (bi_natFromInt 2)) (bi_natFromInt ((bi_strLength s) - 2))) s) else s))

# 856 "Vuna/Compiler/Driver/CompilerCli.vuna"
let v_Vuna_dCompiler_dDriver_dCompilerCli_disPackageEntryPath = (fun nEnv ctx path -> (match (Vuna_dCompiler_dFrontend_dPackages_dPkg.v_Vuna_dCompiler_dFrontend_dPackages_dPkg_dcontextPackageOf ctx) with
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing -> ((Base_dApplicative.v_Base_dApplicative_dpure Base_dEff.v_Applicative_uBase_uEff_uEff_ur) false)
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Just (dtb__91) -> (((Base_dMonad.v_Base_dMonad_d_x62__x62__x61_ Base_dEff.v_Monad_uBase_uEff_uEff_ur) ((Vuna_dCompiler_dFrontend_dPackages_dPkg.v_Vuna_dCompiler_dFrontend_dPackages_dPkg_dabsolutePath nEnv) path)) (fun abs -> ((Base_dApplicative.v_Base_dApplicative_dpure Base_dEff.v_Applicative_uBase_uEff_uEff_ur) ((v_Vuna_dCompiler_dDriver_dCompilerCli_dstripDotSlash abs) = (v_Vuna_dCompiler_dDriver_dCompilerCli_dstripDotSlash (Vuna_dCompiler_dFrontend_dPackages_dPkg.v_Vuna_dCompiler_dFrontend_dPackages_dPkg_dpackageEntry dtb__91))))))
  | _ -> failwith "DT: impossible branch"
))

# 851 "Vuna/Compiler/Driver/CompilerCli.vuna"
let v_Vuna_dCompiler_dDriver_dCompilerCli_disModuleFileEntry = (fun nFs nEnv nProcess ctx path -> (((Base_dMonad.v_Base_dMonad_d_x62__x62__x61_ Base_dEff.v_Monad_uBase_uEff_uEff_ur) (((v_Vuna_dCompiler_dDriver_dCompilerCli_disPackageEntryPath nEnv) ctx) path)) (fun pkgEntry -> (if pkgEntry then ((Base_dApplicative.v_Base_dApplicative_dpure Base_dEff.v_Applicative_uBase_uEff_uEff_ur) false) else ((((Vuna_dCompiler_dDriver_dDt.v_Vuna_dCompiler_dDriver_dDt_ddtFileHasModuleHeader nFs) nEnv) nProcess) path)))))

# 1205 "Vuna/Compiler/Driver/CompilerCli.vuna"
let v_Vuna_dCompiler_dDriver_dCompilerCli_downedByFile = (fun path d -> ((v_Vuna_dCompiler_dDriver_dCompilerCli_dstripDotSlash (Vuna_dCompiler_dBase_dDiag.v_Vuna_dCompiler_dBase_dDiag_ddiagFileOf d)) = (v_Vuna_dCompiler_dDriver_dCompilerCli_dstripDotSlash path)))

# 865 "Vuna/Compiler/Driver/CompilerCli.vuna"
let v_Vuna_dCompiler_dDriver_dCompilerCli_dcheckModuleFileEntry = (fun nFs nConsole nEnv nProcess ctx path o -> (((Base_dMonad.v_Base_dMonad_d_x62__x62__x61_ Base_dEff.v_Monad_uBase_uEff_uEff_ur) (((((Vuna_dCompiler_dDriver_dDt.v_Vuna_dCompiler_dDriver_dDt_ddtCheckModuleFile nFs) nEnv) nProcess) ctx) path)) (fun checked -> (match checked with
  | Vuna_dCompiler_dBase_dDiag.C_Vuna_dCompiler_dBase_dDiag_dCheck_ErrC (dtb__92) -> ((((v_Vuna_dCompiler_dDriver_dCompilerCli_dprintDiag nFs) nConsole) o) dtb__92)
  | Vuna_dCompiler_dBase_dDiag.C_Vuna_dCompiler_dBase_dDiag_dCheck_OkC (dtb__93) -> ((fun ws -> ((fun shown -> (((Base_dMonad.v_Base_dMonad_d_x62__x62__x61_ Base_dEff.v_Monad_uBase_uEff_uEff_ur) (((((v_Vuna_dCompiler_dDriver_dCompilerCli_dprintDiagList nFs) nConsole) o) "") shown)) (fun r -> ((Base_dApplicative.v_Base_dApplicative_dpure Base_dEff.v_Applicative_uBase_uEff_uEff_ur) { Base_dPair.f_Base_dPair_dPair_first = (if (if (o).f_Vuna_dCompiler_dDriver_dCompilerCli_dCliOpts_optDenyWarnings then ((Base_dList.v_Base_dList_dlength ws) > 0) else false) then 1 else 0); Base_dPair.f_Base_dPair_dPair_second = (Base_dPair.v_Base_dPair_dsecondOf r) })))) (if (if (o).f_Vuna_dCompiler_dDriver_dCompilerCli_dCliOpts_optShowWarnings then true else (o).f_Vuna_dCompiler_dDriver_dCompilerCli_dCliOpts_optDenyWarnings) then ws else Base_dList.C_Base_dList_dList_Nil))) ((Base_dList.v_Base_dList_dfilter (v_Vuna_dCompiler_dDriver_dCompilerCli_downedByFile path)) (Vuna_dCompiler_dBase_dDiagnostics_dSink.v_Vuna_dCompiler_dBase_dDiagnostics_dSink_ddedupeWarnings dtb__93)))
  | _ -> failwith "DT: impossible branch"
))))

# 879 "Vuna/Compiler/Driver/CompilerCli.vuna"
let v_Vuna_dCompiler_dDriver_dCompilerCli_dcheckEntryFile = (fun nFs nConsole nEnv nProcess ctx path o -> (((Base_dMonad.v_Base_dMonad_d_x62__x62__x61_ Base_dEff.v_Monad_uBase_uEff_uEff_ur) (((((Vuna_dCompiler_dDriver_dDt.v_Vuna_dCompiler_dDriver_dDt_ddtCheck nFs) nEnv) nProcess) ctx) path)) (fun checked -> (match checked with
  | Vuna_dCompiler_dBase_dDiag.C_Vuna_dCompiler_dBase_dDiag_dCheck_ErrC (dtb__94) -> (if (o).f_Vuna_dCompiler_dDriver_dCompilerCli_dCliOpts_optContinueOnError then (((Base_dMonad.v_Base_dMonad_d_x62__x62__x61_ Base_dEff.v_Monad_uBase_uEff_uEff_ur) (((((Vuna_dCompiler_dDriver_dDt.v_Vuna_dCompiler_dDriver_dDt_ddtCheckRecovering nFs) nEnv) nProcess) ctx) path)) (fun recovered -> (match recovered with
  | Vuna_dCompiler_dBase_dDiag.C_Vuna_dCompiler_dBase_dDiag_dCheck_OkC (dtb__95) -> ((fun shown -> (((Base_dMonad.v_Base_dMonad_d_x62__x62__x61_ Base_dEff.v_Monad_uBase_uEff_uEff_ur) (((((v_Vuna_dCompiler_dDriver_dCompilerCli_dprintDiagList nFs) nConsole) o) "") shown)) (fun r -> (if ((Base_dList.v_Base_dList_dlength shown) = 0) then ((((v_Vuna_dCompiler_dDriver_dCompilerCli_dprintDiag nFs) nConsole) (Base_dPair.v_Base_dPair_dsecondOf r)) dtb__94) else ((Base_dApplicative.v_Base_dApplicative_dpure Base_dEff.v_Applicative_uBase_uEff_uEff_ur) { Base_dPair.f_Base_dPair_dPair_first = 1; Base_dPair.f_Base_dPair_dPair_second = (Base_dPair.v_Base_dPair_dsecondOf r) }))))) ((v_Vuna_dCompiler_dDriver_dCompilerCli_dtakeDiags (o).f_Vuna_dCompiler_dDriver_dCompilerCli_dCliOpts_optMaxErrors) dtb__95))
  | Vuna_dCompiler_dBase_dDiag.C_Vuna_dCompiler_dBase_dDiag_dCheck_ErrC (dtb__96) -> ((((v_Vuna_dCompiler_dDriver_dCompilerCli_dprintDiag nFs) nConsole) o) dtb__94)
  | _ -> failwith "DT: impossible branch"
))) else ((((v_Vuna_dCompiler_dDriver_dCompilerCli_dprintDiag nFs) nConsole) o) dtb__94))
  | Vuna_dCompiler_dBase_dDiag.C_Vuna_dCompiler_dBase_dDiag_dCheck_OkC (dtb__97) -> ((fun ws -> ((fun shown -> (((Base_dMonad.v_Base_dMonad_d_x62__x62__x61_ Base_dEff.v_Monad_uBase_uEff_uEff_ur) (((((v_Vuna_dCompiler_dDriver_dCompilerCli_dprintDiagList nFs) nConsole) o) "") shown)) (fun r -> ((Base_dApplicative.v_Base_dApplicative_dpure Base_dEff.v_Applicative_uBase_uEff_uEff_ur) { Base_dPair.f_Base_dPair_dPair_first = (if (if (o).f_Vuna_dCompiler_dDriver_dCompilerCli_dCliOpts_optDenyWarnings then ((Base_dList.v_Base_dList_dlength ws) > 0) else false) then 1 else 0); Base_dPair.f_Base_dPair_dPair_second = (Base_dPair.v_Base_dPair_dsecondOf r) })))) (if (if (o).f_Vuna_dCompiler_dDriver_dCompilerCli_dCliOpts_optShowWarnings then true else (o).f_Vuna_dCompiler_dDriver_dCompilerCli_dCliOpts_optDenyWarnings) then ws else Base_dList.C_Base_dList_dList_Nil))) ((Base_dList.v_Base_dList_dfilter (v_Vuna_dCompiler_dDriver_dCompilerCli_downedByFile path)) (Vuna_dCompiler_dBase_dDiagnostics_dSink.v_Vuna_dCompiler_dBase_dDiagnostics_dSink_ddedupeWarnings dtb__97)))
  | _ -> failwith "DT: impossible branch"
))))

# 836 "Vuna/Compiler/Driver/CompilerCli.vuna"
let v_Vuna_dCompiler_dDriver_dCompilerCli_dcheckFileEntry = (fun nFs nConsole nEnv nProcess path o -> (((Base_dMonad.v_Base_dMonad_d_x62__x62__x61_ Base_dEff.v_Monad_uBase_uEff_uEff_ur) (((Vuna_dCompiler_dFrontend_dPackages_dPkg.v_Vuna_dCompiler_dFrontend_dPackages_dPkg_dcontextForFile nFs) nEnv) path)) (fun ctxR -> (match ctxR with
  | Vuna_dCompiler_dBase_dDiag.C_Vuna_dCompiler_dBase_dDiag_dCheck_ErrC (dtb__98) -> ((((v_Vuna_dCompiler_dDriver_dCompilerCli_dprintDiag nFs) nConsole) o) dtb__98)
  | Vuna_dCompiler_dBase_dDiag.C_Vuna_dCompiler_dBase_dDiag_dCheck_OkC (dtb__99) -> ((fun ctx -> ((fun o1 -> (((Base_dMonad.v_Base_dMonad_d_x62__x62__x61_ Base_dEff.v_Monad_uBase_uEff_uEff_ur) (((((v_Vuna_dCompiler_dDriver_dCompilerCli_disModuleFileEntry nFs) nEnv) nProcess) ctx) path)) (fun moduleEntry -> (if moduleEntry then (((((((v_Vuna_dCompiler_dDriver_dCompilerCli_dcheckModuleFileEntry nFs) nConsole) nEnv) nProcess) ctx) path) o1) else (((((((v_Vuna_dCompiler_dDriver_dCompilerCli_dcheckEntryFile nFs) nConsole) nEnv) nProcess) ctx) path) o1))))) ((v_Vuna_dCompiler_dDriver_dCompilerCli_dapplyDiagConfig (Vuna_dCompiler_dFrontend_dPackages_dPkg.v_Vuna_dCompiler_dFrontend_dPackages_dPkg_dcontextPackageOf ctx)) o))) ((Vuna_dCompiler_dFrontend_dPackages_dPkg.v_Vuna_dCompiler_dFrontend_dPackages_dPkg_dcontextWithRelease (o).f_Vuna_dCompiler_dDriver_dCompilerCli_dCliOpts_optRelease) dtb__99))
  | _ -> failwith "DT: impossible branch"
))))

# 1209 "Vuna/Compiler/Driver/CompilerCli.vuna"
let v_Vuna_dCompiler_dDriver_dCompilerCli_downedByPackage = (fun pkg d -> ((fun dir -> ((fun file -> ((fun prefix -> (if (if ((Base_dString.v_Base_dString_dstartsWith (prefix ^ "lib/")) file) then true else ((Base_dString.v_Base_dString_dstartsWith (prefix ^ "app/")) file)) then true else ((Base_dString.v_Base_dString_dstartsWith (prefix ^ "test/")) file))) (if (if (dir = ".") then true else (dir = "")) then "" else (dir ^ "/")))) (v_Vuna_dCompiler_dDriver_dCompilerCli_dstripDotSlash (Vuna_dCompiler_dBase_dDiag.v_Vuna_dCompiler_dBase_dDiag_ddiagFileOf d)))) (v_Vuna_dCompiler_dDriver_dCompilerCli_dstripDotSlash (Vuna_dCompiler_dFrontend_dPackages_dPkg.v_Vuna_dCompiler_dFrontend_dPackages_dPkg_dpackageDir pkg))))

# 1221 "Vuna/Compiler/Driver/CompilerCli.vuna"
let v_Vuna_dCompiler_dDriver_dCompilerCli_dfinishWarnings = (fun nFs nConsole warns code o -> ((fun ws -> ((fun shown -> (((Base_dMonad.v_Base_dMonad_d_x62__x62__x61_ Base_dEff.v_Monad_uBase_uEff_uEff_ur) (((((v_Vuna_dCompiler_dDriver_dCompilerCli_dprintDiagList nFs) nConsole) o) "") shown)) (fun r -> ((Base_dApplicative.v_Base_dApplicative_dpure Base_dEff.v_Applicative_uBase_uEff_uEff_ur) { Base_dPair.f_Base_dPair_dPair_first = (if (if (o).f_Vuna_dCompiler_dDriver_dCompilerCli_dCliOpts_optDenyWarnings then ((Base_dList.v_Base_dList_dlength ws) > 0) else false) then 1 else code); Base_dPair.f_Base_dPair_dPair_second = (Base_dPair.v_Base_dPair_dsecondOf r) })))) (if (if (o).f_Vuna_dCompiler_dDriver_dCompilerCli_dCliOpts_optShowWarnings then true else (o).f_Vuna_dCompiler_dDriver_dCompilerCli_dCliOpts_optDenyWarnings) then ws else Base_dList.C_Base_dList_dList_Nil))) (Vuna_dCompiler_dBase_dDiagnostics_dSink.v_Vuna_dCompiler_dBase_dDiagnostics_dSink_ddedupeWarnings warns)))

# 1232 "Vuna/Compiler/Driver/CompilerCli.vuna"
let v_Vuna_dCompiler_dDriver_dCompilerCli_dfinishWarningsDir = (fun nFs nConsole nProcess warns o dir code -> ((fun ws -> ((fun shown -> (((Base_dMonad.v_Base_dMonad_d_x62__x62__x61_ Base_dEff.v_Monad_uBase_uEff_uEff_ur) (((((v_Vuna_dCompiler_dDriver_dCompilerCli_dprintDiagList nFs) nConsole) o) "") shown)) (fun r -> (if (if (o).f_Vuna_dCompiler_dDriver_dCompilerCli_dCliOpts_optDenyWarnings then ((Base_dList.v_Base_dList_dlength ws) > 0) else false) then (((Base_dMonad.v_Base_dMonad_d_x62__x62__x61_ Base_dEff.v_Monad_uBase_uEff_uEff_ur) ((Base_dEffFs.v_Base_dEffFs_dfsRemoveTree nFs) dir)) (fun _u -> ((Base_dApplicative.v_Base_dApplicative_dpure Base_dEff.v_Applicative_uBase_uEff_uEff_ur) { Base_dPair.f_Base_dPair_dPair_first = 1; Base_dPair.f_Base_dPair_dPair_second = (Base_dPair.v_Base_dPair_dsecondOf r) }))) else ((Base_dApplicative.v_Base_dApplicative_dpure Base_dEff.v_Applicative_uBase_uEff_uEff_ur) { Base_dPair.f_Base_dPair_dPair_first = code; Base_dPair.f_Base_dPair_dPair_second = (Base_dPair.v_Base_dPair_dsecondOf r) }))))) (if (if (o).f_Vuna_dCompiler_dDriver_dCompilerCli_dCliOpts_optShowWarnings then true else (o).f_Vuna_dCompiler_dDriver_dCompilerCli_dCliOpts_optDenyWarnings) then ws else Base_dList.C_Base_dList_dList_Nil))) (Vuna_dCompiler_dBase_dDiagnostics_dSink.v_Vuna_dCompiler_dBase_dDiagnostics_dSink_ddedupeWarnings warns)))

# 663 "Vuna/Compiler/Driver/CompilerCli.vuna"
let v_Vuna_dCompiler_dDriver_dCompilerCli_dcompileFileEntry = (fun nFs nConsole nClock nEnv nProcess printResult entry outDir o -> (((Base_dMonad.v_Base_dMonad_d_x62__x62__x61_ Base_dEff.v_Monad_uBase_uEff_uEff_ur) (((Vuna_dCompiler_dFrontend_dPackages_dPkg.v_Vuna_dCompiler_dFrontend_dPackages_dPkg_dcontextForFile nFs) nEnv) entry)) (fun ctxR -> (match ctxR with
  | Vuna_dCompiler_dBase_dDiag.C_Vuna_dCompiler_dBase_dDiag_dCheck_ErrC (dtb__100) -> ((((v_Vuna_dCompiler_dDriver_dCompilerCli_dprintDiag nFs) nConsole) o) dtb__100)
  | Vuna_dCompiler_dBase_dDiag.C_Vuna_dCompiler_dBase_dDiag_dCheck_OkC (dtb__101) -> ((fun ctx -> ((fun o1 -> (((Base_dMonad.v_Base_dMonad_d_x62__x62__x61_ Base_dEff.v_Monad_uBase_uEff_uEff_ur) ((((((((((v_Vuna_dCompiler_dDriver_dCompilerCli_dcompileToTarget nFs) nConsole) nClock) nEnv) nProcess) ctx) entry) printResult) outDir) (o).f_Vuna_dCompiler_dDriver_dCompilerCli_dCliOpts_optTarget)) (fun r -> (match r with
  | Vuna_dCompiler_dBase_dDiag.C_Vuna_dCompiler_dBase_dDiag_dCheck_ErrC (dtb__102) -> ((((v_Vuna_dCompiler_dDriver_dCompilerCli_dprintDiag nFs) nConsole) o1) dtb__102)
  | Vuna_dCompiler_dBase_dDiag.C_Vuna_dCompiler_dBase_dDiag_dCheck_OkC (dtb__103) -> (((((((v_Vuna_dCompiler_dDriver_dCompilerCli_dfinishWarningsDir nFs) nConsole) nProcess) (Base_dPair.v_Base_dPair_dsecondOf dtb__103)) o1) outDir) 0)
  | _ -> failwith "DT: impossible branch"
)))) ((v_Vuna_dCompiler_dDriver_dCompilerCli_dapplyDiagConfig (Vuna_dCompiler_dFrontend_dPackages_dPkg.v_Vuna_dCompiler_dFrontend_dPackages_dPkg_dcontextPackageOf ctx)) o))) ((Vuna_dCompiler_dFrontend_dPackages_dPkg.v_Vuna_dCompiler_dFrontend_dPackages_dPkg_dcontextWithRelease (o).f_Vuna_dCompiler_dDriver_dCompilerCli_dCliOpts_optRelease) dtb__101))
  | _ -> failwith "DT: impossible branch"
))))

# 678 "Vuna/Compiler/Driver/CompilerCli.vuna"
let v_Vuna_dCompiler_dDriver_dCompilerCli_dcompilePkgDir = (fun nFs nConsole nClock nEnv nProcess printResult dir outDir o -> (((Base_dMonad.v_Base_dMonad_d_x62__x62__x61_ Base_dEff.v_Monad_uBase_uEff_uEff_ur) ((((v_Vuna_dCompiler_dDriver_dCompilerCli_dexecutablePackage nFs) nEnv) "compile") dir)) (fun pkgR -> (match pkgR with
  | Vuna_dCompiler_dBase_dDiag.C_Vuna_dCompiler_dBase_dDiag_dCheck_ErrC (dtb__104) -> ((((v_Vuna_dCompiler_dDriver_dCompilerCli_dprintDiag nFs) nConsole) o) dtb__104)
  | Vuna_dCompiler_dBase_dDiag.C_Vuna_dCompiler_dBase_dDiag_dCheck_OkC (dtb__105) -> ((fun o1 -> (((Base_dMonad.v_Base_dMonad_d_x62__x62__x61_ Base_dEff.v_Monad_uBase_uEff_uEff_ur) ((((((((((v_Vuna_dCompiler_dDriver_dCompilerCli_dcompileToTarget nFs) nConsole) nClock) nEnv) nProcess) ((Vuna_dCompiler_dFrontend_dPackages_dPkg.v_Vuna_dCompiler_dFrontend_dPackages_dPkg_dcontextWithRelease (o).f_Vuna_dCompiler_dDriver_dCompilerCli_dCliOpts_optRelease) (Vuna_dCompiler_dFrontend_dPackages_dPkg.v_Vuna_dCompiler_dFrontend_dPackages_dPkg_dpackageContext dtb__105))) (Vuna_dCompiler_dFrontend_dPackages_dPkg.v_Vuna_dCompiler_dFrontend_dPackages_dPkg_dpackageEntry dtb__105)) printResult) outDir) (o).f_Vuna_dCompiler_dDriver_dCompilerCli_dCliOpts_optTarget)) (fun r -> (match r with
  | Vuna_dCompiler_dBase_dDiag.C_Vuna_dCompiler_dBase_dDiag_dCheck_ErrC (dtb__106) -> ((((v_Vuna_dCompiler_dDriver_dCompilerCli_dprintDiag nFs) nConsole) o1) dtb__106)
  | Vuna_dCompiler_dBase_dDiag.C_Vuna_dCompiler_dBase_dDiag_dCheck_OkC (dtb__107) -> (((((((v_Vuna_dCompiler_dDriver_dCompilerCli_dfinishWarningsDir nFs) nConsole) nProcess) (Base_dPair.v_Base_dPair_dsecondOf dtb__107)) o1) outDir) 0)
  | _ -> failwith "DT: impossible branch"
)))) ((v_Vuna_dCompiler_dDriver_dCompilerCli_dapplyDiagConfig (Base_dMaybe.C_Base_dMaybe_dMaybe_Just (dtb__105))) o))
  | _ -> failwith "DT: impossible branch"
))))

# 641 "Vuna/Compiler/Driver/CompilerCli.vuna"
let v_Vuna_dCompiler_dDriver_dCompilerCli_dcompileRun = (fun nFs nConsole nClock nEnv nProcess printResult entry outDir o -> (((Base_dMonad.v_Base_dMonad_d_x62__x62__x61_ Base_dEff.v_Monad_uBase_uEff_uEff_ur) ((Base_dEffFs.v_Base_dEffFs_dfsFileExists nFs) entry)) (fun exists -> (if exists then (((Base_dMonad.v_Base_dMonad_d_x62__x62__x61_ Base_dEff.v_Monad_uBase_uEff_uEff_ur) ((Base_dEffFs.v_Base_dEffFs_dfsIsDirectory nFs) entry)) (fun isDir -> (if isDir then (((((((((v_Vuna_dCompiler_dDriver_dCompilerCli_dcompilePkgDir nFs) nConsole) nClock) nEnv) nProcess) printResult) entry) outDir) o) else (((((((((v_Vuna_dCompiler_dDriver_dCompilerCli_dcompileFileEntry nFs) nConsole) nClock) nEnv) nProcess) printResult) entry) outDir) o)))) else ((v_Vuna_dCompiler_dDriver_dCompilerCli_dwithOpts o) ((v_Vuna_dCompiler_dDriver_dCompilerCli_ddtPathErr nConsole) entry))))))

# 635 "Vuna/Compiler/Driver/CompilerCli.vuna"
let v_Vuna_dCompiler_dDriver_dCompilerCli_dcompileFinish = (fun nFs nConsole nClock nEnv nProcess mc0 mc1 mc2 mc3 mc4 -> (match mc2 with
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Just (dtb__108) -> (match mc3 with
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing -> ((v_Vuna_dCompiler_dDriver_dCompilerCli_dwithOpts mc4) ((v_Vuna_dCompiler_dDriver_dCompilerCli_dusageErr nConsole) mc0))
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Just (dtb__109) -> (((((((((v_Vuna_dCompiler_dDriver_dCompilerCli_dcompileRun nFs) nConsole) nClock) nEnv) nProcess) mc1) dtb__108) dtb__109) mc4)
  | _ -> failwith "DT: impossible branch"
)
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing -> ((v_Vuna_dCompiler_dDriver_dCompilerCli_dwithOpts mc4) ((v_Vuna_dCompiler_dDriver_dCompilerCli_dusageErr nConsole) mc0))
  | _ -> failwith "DT: impossible branch"
))

# 616 "Vuna/Compiler/Driver/CompilerCli.vuna"
let rec v_Vuna_dCompiler_dDriver_dCompilerCli_dcompileParse = (fun nFs nConsole nClock nEnv nProcess prog printResult entry outDir args o -> ((fun nd_uscrut17 -> (match nd_uscrut17 with
  | Base_dList.C_Base_dList_dList__x58__x58_ (dtb__110, dtb__111) -> (if (dtb__110 = "--no-print") then (((((((((((v_Vuna_dCompiler_dDriver_dCompilerCli_dcompileParse nFs) nConsole) nClock) nEnv) nProcess) prog) false) entry) outDir) dtb__111) o) else (if (dtb__110 = "--release") then (((((((((((v_Vuna_dCompiler_dDriver_dCompilerCli_dcompileParse nFs) nConsole) nClock) nEnv) nProcess) prog) printResult) entry) outDir) dtb__111) (v_Vuna_dCompiler_dDriver_dCompilerCli_dmarkRelease o)) else (if (dtb__110 = "--target") then (match dtb__111 with
  | Base_dList.C_Base_dList_dList__x58__x58_ (dtb__112, dtb__113) -> (if (v_Vuna_dCompiler_dDriver_dCompilerCli_disKnownTarget dtb__112) then (((((((((((v_Vuna_dCompiler_dDriver_dCompilerCli_dcompileParse nFs) nConsole) nClock) nEnv) nProcess) prog) printResult) entry) outDir) dtb__113) ((v_Vuna_dCompiler_dDriver_dCompilerCli_dmarkTarget dtb__112) o)) else ((v_Vuna_dCompiler_dDriver_dCompilerCli_dwithOpts o) ((v_Vuna_dCompiler_dDriver_dCompilerCli_dusageErr nConsole) prog)))
  | _ -> (if ((Base_dString.v_Base_dString_dstartsWith "-") dtb__110) then ((v_Vuna_dCompiler_dDriver_dCompilerCli_dwithOpts o) (((v_Vuna_dCompiler_dDriver_dCompilerCli_dremovedFlag nConsole) prog) dtb__110)) else (match entry with
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing -> (((((((((((v_Vuna_dCompiler_dDriver_dCompilerCli_dcompileParse nFs) nConsole) nClock) nEnv) nProcess) prog) printResult) (Base_dMaybe.C_Base_dMaybe_dMaybe_Just (dtb__110))) outDir) dtb__111) o)
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Just (dtb__114) -> (match outDir with
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing -> (((((((((((v_Vuna_dCompiler_dDriver_dCompilerCli_dcompileParse nFs) nConsole) nClock) nEnv) nProcess) prog) printResult) entry) (Base_dMaybe.C_Base_dMaybe_dMaybe_Just (dtb__110))) dtb__111) o)
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Just (dtb__115) -> ((v_Vuna_dCompiler_dDriver_dCompilerCli_dwithOpts o) ((v_Vuna_dCompiler_dDriver_dCompilerCli_dusageErr nConsole) prog))
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
))
) else (if ((Base_dString.v_Base_dString_dstartsWith "-") dtb__110) then ((v_Vuna_dCompiler_dDriver_dCompilerCli_dwithOpts o) (((v_Vuna_dCompiler_dDriver_dCompilerCli_dremovedFlag nConsole) prog) dtb__110)) else (match entry with
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing -> (((((((((((v_Vuna_dCompiler_dDriver_dCompilerCli_dcompileParse nFs) nConsole) nClock) nEnv) nProcess) prog) printResult) (Base_dMaybe.C_Base_dMaybe_dMaybe_Just (dtb__110))) outDir) dtb__111) o)
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Just (dtb__116) -> (match outDir with
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing -> (((((((((((v_Vuna_dCompiler_dDriver_dCompilerCli_dcompileParse nFs) nConsole) nClock) nEnv) nProcess) prog) printResult) entry) (Base_dMaybe.C_Base_dMaybe_dMaybe_Just (dtb__110))) dtb__111) o)
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Just (dtb__117) -> ((v_Vuna_dCompiler_dDriver_dCompilerCli_dwithOpts o) ((v_Vuna_dCompiler_dDriver_dCompilerCli_dusageErr nConsole) prog))
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
)))))
  | Base_dList.C_Base_dList_dList_Nil -> ((((((((((v_Vuna_dCompiler_dDriver_dCompilerCli_dcompileFinish nFs) nConsole) nClock) nEnv) nProcess) prog) printResult) entry) outDir) o)
  | _ -> failwith "DT: impossible branch"
)) args))

# 613 "Vuna/Compiler/Driver/CompilerCli.vuna"
let v_Vuna_dCompiler_dDriver_dCompilerCli_dcompileArgs = (fun nFs nConsole nClock nEnv nProcess prog args o -> (((((((((((v_Vuna_dCompiler_dDriver_dCompilerCli_dcompileParse nFs) nConsole) nClock) nEnv) nProcess) prog) true) Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing) Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing) args) o))

# 1021 "Vuna/Compiler/Driver/CompilerCli.vuna"
let v_Vuna_dCompiler_dDriver_dCompilerCli_dbuildWasmOne = (fun nFs nConsole nEnv nProcess noCompile outM pkg o -> ((fun outDir -> ((fun watPath -> ((fun wasmPath -> ((fun script -> ((fun args -> (((Base_dMonad.v_Base_dMonad_d_x62__x62__x61_ Base_dEff.v_Monad_uBase_uEff_uEff_ur) (((((((Vuna_dCompiler_dDriver_dWasm.v_Vuna_dCompiler_dDriver_dWasm_dcompileWasm nFs) nEnv) nProcess) ((Vuna_dCompiler_dFrontend_dPackages_dPkg.v_Vuna_dCompiler_dFrontend_dPackages_dPkg_dcontextWithRelease (o).f_Vuna_dCompiler_dDriver_dCompilerCli_dCliOpts_optRelease) (Vuna_dCompiler_dFrontend_dPackages_dPkg.v_Vuna_dCompiler_dFrontend_dPackages_dPkg_dpackageContext pkg))) (Vuna_dCompiler_dFrontend_dPackages_dPkg.v_Vuna_dCompiler_dFrontend_dPackages_dPkg_dpackageEntry pkg)) true) outDir)) (fun r -> (match r with
  | Vuna_dCompiler_dBase_dDiag.C_Vuna_dCompiler_dBase_dDiag_dCheck_ErrC (dtb__118) -> ((((v_Vuna_dCompiler_dDriver_dCompilerCli_dprintDiag nFs) nConsole) o) dtb__118)
  | Vuna_dCompiler_dBase_dDiag.C_Vuna_dCompiler_dBase_dDiag_dCheck_OkC (dtb__119) -> (((Base_dMonad.v_Base_dMonad_d_x62__x62__x61_ Base_dEff.v_Monad_uBase_uEff_uEff_ur) (((Base_dEffFs.v_Base_dEffFs_dfsWriteFile nFs) (outDir ^ "/build.sh")) script)) (fun _u -> (((Base_dMonad.v_Base_dMonad_d_x62__x62__x61_ Base_dEff.v_Monad_uBase_uEff_uEff_ur) (if noCompile then (((Base_dMonad.v_Base_dMonad_d_x62__x62__x61_ Base_dEff.v_Monad_uBase_uEff_uEff_ur) ((Base_dEffConsole.v_Base_dEffConsole_dconsolePrint nConsole) (String.concat "" ["wrote "; watPath; "\n"]))) (fun _u -> ((Base_dApplicative.v_Base_dApplicative_dpure Base_dEff.v_Applicative_uBase_uEff_uEff_ur) 0))) else (((Base_dMonad.v_Base_dMonad_d_x62__x62__x61_ Base_dEff.v_Monad_uBase_uEff_uEff_ur) (((Base_dEffProcess.v_Base_dEffProcess_dprocessRunIn nProcess) outDir) args)) (fun c -> (if (c = 0) then (((Base_dMonad.v_Base_dMonad_d_x62__x62__x61_ Base_dEff.v_Monad_uBase_uEff_uEff_ur) ((Base_dEffConsole.v_Base_dEffConsole_dconsolePrint nConsole) (String.concat "" ["wrote "; wasmPath; "\n"]))) (fun _u -> ((Base_dApplicative.v_Base_dApplicative_dpure Base_dEff.v_Applicative_uBase_uEff_uEff_ur) 0))) else (((Base_dMonad.v_Base_dMonad_d_x62__x62__x61_ Base_dEff.v_Monad_uBase_uEff_uEff_ur) ((Base_dEffConsole.v_Base_dEffConsole_dconsolePrint nConsole) (String.concat "" ["wasm assembly failed: wasm-tools exited "; (bi_strFromInt c); "\n"]))) (fun _u -> ((Base_dApplicative.v_Base_dApplicative_dpure Base_dEff.v_Applicative_uBase_uEff_uEff_ur) 1)))))))) (fun code -> (if (code = 0) then (((((((v_Vuna_dCompiler_dDriver_dCompilerCli_dfinishWarningsDir nFs) nConsole) nProcess) (Base_dPair.v_Base_dPair_dsecondOf dtb__119)) o) outDir) 0) else ((Base_dApplicative.v_Base_dApplicative_dpure Base_dEff.v_Applicative_uBase_uEff_uEff_ur) { Base_dPair.f_Base_dPair_dPair_first = 1; Base_dPair.f_Base_dPair_dPair_second = o }))))))
  | _ -> failwith "DT: impossible branch"
)))) (Base_dList.C_Base_dList_dList__x58__x58_ ("wasm-tools", (Base_dList.C_Base_dList_dList__x58__x58_ ("parse", (Base_dList.C_Base_dList_dList__x58__x58_ ("main.wat", (Base_dList.C_Base_dList_dList__x58__x58_ ("-o", (Base_dList.C_Base_dList_dList__x58__x58_ ("main.wasm", Base_dList.C_Base_dList_dList_Nil)))))))))))) "#!/bin/sh\nset -eu\ncd \"$(dirname \"$0\")\"\nwasm-tools parse main.wat -o main.wasm\n")) (outDir ^ "/main.wasm"))) (outDir ^ "/main.wat"))) (match outM with
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Just (dtb__120) -> dtb__120
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing -> ((Vuna_dCompiler_dFrontend_dPackages_dPkg.v_Vuna_dCompiler_dFrontend_dPackages_dPkg_dpackageDir pkg) ^ "/.output")
  | _ -> failwith "DT: impossible branch"
)))

# 1053 "Vuna/Compiler/Driver/CompilerCli.vuna"
let v_Vuna_dCompiler_dDriver_dCompilerCli_dbuildOne = (fun nFs nConsole nClock nEnv nProcess nExit nArgs noCompile multiOut outM pkg o -> (if ((o).f_Vuna_dCompiler_dDriver_dCompilerCli_dCliOpts_optTarget = "wasm") then ((((((((v_Vuna_dCompiler_dDriver_dCompilerCli_dbuildWasmOne nFs) nConsole) nEnv) nProcess) noCompile) outM) pkg) o) else (if ((o).f_Vuna_dCompiler_dDriver_dCompilerCli_dCliOpts_optTarget = "native") then (((((((((v_Vuna_dCompiler_dDriver_dCompilerCli_dbuildNativeOne nFs) nConsole) nEnv) nProcess) noCompile) multiOut) outM) pkg) o) else ((fun name -> ((fun entry -> (((Base_dMonad.v_Base_dMonad_d_x62__x62__x61_ Base_dEff.v_Monad_uBase_uEff_uEff_ur) ((Base_dEffFs.v_Base_dEffFs_dfsFileExists nFs) entry)) (fun exists -> (if exists then ((fun ctx -> (if noCompile then (match outM with
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Just (dtb__121) -> (((((((((v_Vuna_dCompiler_dDriver_dCompilerCli_dcompileCodegen nFs) nConsole) nClock) nEnv) nProcess) ctx) entry) (if multiOut then (String.concat "" [dtb__121; "/"; name]) else dtb__121)) o)
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing -> (((((((((v_Vuna_dCompiler_dDriver_dCompilerCli_dcompileCodegen nFs) nConsole) nClock) nEnv) nProcess) ctx) entry) ((Vuna_dCompiler_dFrontend_dPackages_dPkg.v_Vuna_dCompiler_dFrontend_dPackages_dPkg_dpackageDir pkg) ^ "/.output")) o)
  | _ -> failwith "DT: impossible branch"
) else (match outM with
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Just (dtb__122) -> (((((((((((v_Vuna_dCompiler_dDriver_dCompilerCli_dbuildExplicit nFs) nConsole) nClock) nEnv) nProcess) dtb__122) multiOut) pkg) ctx) entry) o)
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing -> (((Base_dMonad.v_Base_dMonad_d_x62__x62__x61_ Base_dEff.v_Monad_uBase_uEff_uEff_ur) (((((((Vuna_dCompiler_dDriver_dCompile.v_Vuna_dCompiler_dDriver_dCompile_dbuildViewAddrOf nFs) nClock) nEnv) nProcess) ctx) entry) true)) (fun viewDigest -> (((((((((((v_Vuna_dCompiler_dDriver_dCompilerCli_dbuildDefaultView nFs) nConsole) nClock) nEnv) nProcess) ctx) pkg) name) entry) viewDigest) o)))
  | _ -> failwith "DT: impossible branch"
))) ((Vuna_dCompiler_dFrontend_dPackages_dPkg.v_Vuna_dCompiler_dFrontend_dPackages_dPkg_dcontextWithRelease (o).f_Vuna_dCompiler_dDriver_dCompilerCli_dCliOpts_optRelease) (Vuna_dCompiler_dFrontend_dPackages_dPkg.v_Vuna_dCompiler_dFrontend_dPackages_dPkg_dpackageContext pkg))) else (((Base_dMonad.v_Base_dMonad_d_x62__x62__x61_ Base_dEff.v_Monad_uBase_uEff_uEff_ur) (((((((((Vuna_dCompiler_dDriver_dCompile.v_Vuna_dCompiler_dDriver_dCompile_dcheckPackage nFs) nClock) nEnv) nProcess) nExit) nArgs) (o).f_Vuna_dCompiler_dDriver_dCompilerCli_dCliOpts_optRelease) false) pkg)) (fun r -> (match r with
  | Vuna_dCompiler_dBase_dDiag.C_Vuna_dCompiler_dBase_dDiag_dCheck_ErrC (dtb__123) -> ((((v_Vuna_dCompiler_dDriver_dCompilerCli_dprintDiag nFs) nConsole) o) dtb__123)
  | Vuna_dCompiler_dBase_dDiag.C_Vuna_dCompiler_dBase_dDiag_dCheck_OkC (dtb__124) -> (((Base_dMonad.v_Base_dMonad_d_x62__x62__x61_ Base_dEff.v_Monad_uBase_uEff_uEff_ur) ((Base_dEffConsole.v_Base_dEffConsole_dconsolePrint nConsole) (String.concat "" ["skipped (library): "; name; "\n"]))) (fun _u -> ((Base_dApplicative.v_Base_dApplicative_dpure Base_dEff.v_Applicative_uBase_uEff_uEff_ur) { Base_dPair.f_Base_dPair_dPair_first = 0; Base_dPair.f_Base_dPair_dPair_second = o })))
  | _ -> failwith "DT: impossible branch"
))))))) (Vuna_dCompiler_dFrontend_dPackages_dPkg.v_Vuna_dCompiler_dFrontend_dPackages_dPkg_dpackageEntry pkg))) (Vuna_dCompiler_dFrontend_dPackages_dPkg.v_Vuna_dCompiler_dFrontend_dPackages_dPkg_dpackageName pkg)))))

# 975 "Vuna/Compiler/Driver/CompilerCli.vuna"
let rec v_Vuna_dCompiler_dDriver_dCompilerCli_dbuildTargets = (fun nFs nConsole nClock nEnv nProcess nExit nArgs mc0 mc1 mc2 mc3 mc4 mc5 -> (match mc3 with
  | Base_dList.C_Base_dList_dList__x58__x58_ (dtb__125, dtb__126) -> (((Base_dMonad.v_Base_dMonad_d_x62__x62__x61_ Base_dEff.v_Monad_uBase_uEff_uEff_ur) ((((((((((((v_Vuna_dCompiler_dDriver_dCompilerCli_dbuildOne nFs) nConsole) nClock) nEnv) nProcess) nExit) nArgs) mc0) mc1) mc2) dtb__125) mc5)) (fun r -> ((fun next -> (((((((((((((v_Vuna_dCompiler_dDriver_dCompilerCli_dbuildTargets nFs) nConsole) nClock) nEnv) nProcess) nExit) nArgs) mc0) mc1) mc2) dtb__126) next) (Base_dPair.v_Base_dPair_dsecondOf r))) (if ((Base_dPair.v_Base_dPair_dfirstOf r) > mc4) then (Base_dPair.v_Base_dPair_dfirstOf r) else mc4))))
  | Base_dList.C_Base_dList_dList_Nil -> ((Base_dApplicative.v_Base_dApplicative_dpure Base_dEff.v_Applicative_uBase_uEff_uEff_ur) { Base_dPair.f_Base_dPair_dPair_first = mc4; Base_dPair.f_Base_dPair_dPair_second = mc5 })
  | _ -> failwith "DT: impossible branch"
))

# 938 "Vuna/Compiler/Driver/CompilerCli.vuna"
let v_Vuna_dCompiler_dDriver_dCompilerCli_dbuildRun = (fun nFs nConsole nClock nEnv nProcess nExit nArgs noCompile dir outM pkgM o -> (((Base_dMonad.v_Base_dMonad_d_x62__x62__x61_ Base_dEff.v_Monad_uBase_uEff_uEff_ur) (((Vuna_dCompiler_dFrontend_dPackages_dPkg.v_Vuna_dCompiler_dFrontend_dPackages_dPkg_dworkspacePackages nFs) nEnv) dir)) (fun pkgsR -> (match pkgsR with
  | Vuna_dCompiler_dBase_dDiag.C_Vuna_dCompiler_dBase_dDiag_dCheck_ErrC (dtb__127) -> ((((v_Vuna_dCompiler_dDriver_dCompilerCli_dprintDiag nFs) nConsole) o) dtb__127)
  | Vuna_dCompiler_dBase_dDiag.C_Vuna_dCompiler_dBase_dDiag_dCheck_OkC (dtb__128) -> (((Base_dMonad.v_Base_dMonad_d_x62__x62__x61_ Base_dEff.v_Monad_uBase_uEff_uEff_ur) ((v_Vuna_dCompiler_dDriver_dCompilerCli_disSingleLibraryPackage nFs) dtb__128)) (fun libOnly -> (if libOnly then ((v_Vuna_dCompiler_dDriver_dCompilerCli_dwithOpts o) ((v_Vuna_dCompiler_dDriver_dCompilerCli_dprintErr nConsole) (v_Vuna_dCompiler_dDriver_dCompilerCli_dlibraryOnlyMessage dtb__128))) else (match ((v_Vuna_dCompiler_dDriver_dCompilerCli_dselectBuildTargets pkgM) dtb__128) with
  | Vuna_dCompiler_dBase_dDiag.C_Vuna_dCompiler_dBase_dDiag_dCheck_ErrC (dtb__129) -> ((((v_Vuna_dCompiler_dDriver_dCompilerCli_dprintDiag nFs) nConsole) o) dtb__129)
  | Vuna_dCompiler_dBase_dDiag.C_Vuna_dCompiler_dBase_dDiag_dCheck_OkC (dtb__130) -> (((((((((((((v_Vuna_dCompiler_dDriver_dCompilerCli_dbuildTargets nFs) nConsole) nClock) nEnv) nProcess) nExit) nArgs) noCompile) ((Base_dList.v_Base_dList_dlength dtb__128) > 1)) outM) dtb__130) 0) o)
  | _ -> failwith "DT: impossible branch"
))))
  | _ -> failwith "DT: impossible branch"
))))

# 913 "Vuna/Compiler/Driver/CompilerCli.vuna"
let rec v_Vuna_dCompiler_dDriver_dCompilerCli_dbuildParse = (fun nFs nConsole nClock nEnv nProcess nExit nArgs prog noCompile out dir pkg args o -> ((fun nd_uscrut22 -> (match nd_uscrut22 with
  | Base_dList.C_Base_dList_dList__x58__x58_ (dtb__131, dtb__132) -> (if (dtb__131 = "--no-compile") then ((((((((((((((v_Vuna_dCompiler_dDriver_dCompilerCli_dbuildParse nFs) nConsole) nClock) nEnv) nProcess) nExit) nArgs) prog) true) out) dir) pkg) dtb__132) o) else (if (dtb__131 = "--release") then ((((((((((((((v_Vuna_dCompiler_dDriver_dCompilerCli_dbuildParse nFs) nConsole) nClock) nEnv) nProcess) nExit) nArgs) prog) noCompile) out) dir) pkg) dtb__132) (v_Vuna_dCompiler_dDriver_dCompilerCli_dmarkRelease o)) else (if (dtb__131 = "--target") then (match dtb__132 with
  | Base_dList.C_Base_dList_dList__x58__x58_ (dtb__133, dtb__134) -> (if (v_Vuna_dCompiler_dDriver_dCompilerCli_disKnownTarget dtb__133) then ((((((((((((((v_Vuna_dCompiler_dDriver_dCompilerCli_dbuildParse nFs) nConsole) nClock) nEnv) nProcess) nExit) nArgs) prog) noCompile) out) dir) pkg) dtb__134) ((v_Vuna_dCompiler_dDriver_dCompilerCli_dmarkTarget dtb__133) o)) else ((v_Vuna_dCompiler_dDriver_dCompilerCli_dwithOpts o) ((v_Vuna_dCompiler_dDriver_dCompilerCli_dusageErr nConsole) prog)))
  | _ -> (if ((Base_dString.v_Base_dString_dstartsWith "-") dtb__131) then ((v_Vuna_dCompiler_dDriver_dCompilerCli_dwithOpts o) (((v_Vuna_dCompiler_dDriver_dCompilerCli_dremovedFlag nConsole) prog) dtb__131)) else (match dir with
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing -> ((((((((((((((v_Vuna_dCompiler_dDriver_dCompilerCli_dbuildParse nFs) nConsole) nClock) nEnv) nProcess) nExit) nArgs) prog) noCompile) out) (Base_dMaybe.C_Base_dMaybe_dMaybe_Just (dtb__131))) pkg) dtb__132) o)
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Just (dtb__135) -> ((v_Vuna_dCompiler_dDriver_dCompilerCli_dwithOpts o) ((v_Vuna_dCompiler_dDriver_dCompilerCli_dusageErr nConsole) prog))
  | _ -> failwith "DT: impossible branch"
))
) else (if (dtb__131 = "--out") then (match dtb__132 with
  | Base_dList.C_Base_dList_dList__x58__x58_ (dtb__136, dtb__137) -> (if ((Base_dString.v_Base_dString_dstartsWith "-") dtb__136) then ((v_Vuna_dCompiler_dDriver_dCompilerCli_dwithOpts o) (((v_Vuna_dCompiler_dDriver_dCompilerCli_dremovedFlag nConsole) prog) dtb__136)) else (match out with
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing -> ((((((((((((((v_Vuna_dCompiler_dDriver_dCompilerCli_dbuildParse nFs) nConsole) nClock) nEnv) nProcess) nExit) nArgs) prog) noCompile) (Base_dMaybe.C_Base_dMaybe_dMaybe_Just (dtb__136))) dir) pkg) dtb__137) o)
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Just (dtb__138) -> ((v_Vuna_dCompiler_dDriver_dCompilerCli_dwithOpts o) ((v_Vuna_dCompiler_dDriver_dCompilerCli_dusageErr nConsole) prog))
  | _ -> failwith "DT: impossible branch"
))
  | Base_dList.C_Base_dList_dList_Nil -> ((v_Vuna_dCompiler_dDriver_dCompilerCli_dwithOpts o) ((v_Vuna_dCompiler_dDriver_dCompilerCli_dusageErr nConsole) prog))
  | _ -> failwith "DT: impossible branch"
) else (if (dtb__131 = "--package") then (match dtb__132 with
  | Base_dList.C_Base_dList_dList__x58__x58_ (dtb__139, dtb__140) -> (if ((Base_dString.v_Base_dString_dstartsWith "-") dtb__139) then ((v_Vuna_dCompiler_dDriver_dCompilerCli_dwithOpts o) (((v_Vuna_dCompiler_dDriver_dCompilerCli_dremovedFlag nConsole) prog) dtb__139)) else (match pkg with
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing -> ((((((((((((((v_Vuna_dCompiler_dDriver_dCompilerCli_dbuildParse nFs) nConsole) nClock) nEnv) nProcess) nExit) nArgs) prog) noCompile) out) dir) (Base_dMaybe.C_Base_dMaybe_dMaybe_Just (dtb__139))) dtb__140) o)
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Just (dtb__141) -> ((v_Vuna_dCompiler_dDriver_dCompilerCli_dwithOpts o) ((v_Vuna_dCompiler_dDriver_dCompilerCli_dusageErr nConsole) prog))
  | _ -> failwith "DT: impossible branch"
))
  | Base_dList.C_Base_dList_dList_Nil -> ((v_Vuna_dCompiler_dDriver_dCompilerCli_dwithOpts o) ((v_Vuna_dCompiler_dDriver_dCompilerCli_dusageErr nConsole) prog))
  | _ -> failwith "DT: impossible branch"
) else (if ((Base_dString.v_Base_dString_dstartsWith "-") dtb__131) then ((v_Vuna_dCompiler_dDriver_dCompilerCli_dwithOpts o) (((v_Vuna_dCompiler_dDriver_dCompilerCli_dremovedFlag nConsole) prog) dtb__131)) else (match dir with
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing -> ((((((((((((((v_Vuna_dCompiler_dDriver_dCompilerCli_dbuildParse nFs) nConsole) nClock) nEnv) nProcess) nExit) nArgs) prog) noCompile) out) (Base_dMaybe.C_Base_dMaybe_dMaybe_Just (dtb__131))) pkg) dtb__132) o)
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Just (dtb__142) -> ((v_Vuna_dCompiler_dDriver_dCompilerCli_dwithOpts o) ((v_Vuna_dCompiler_dDriver_dCompilerCli_dusageErr nConsole) prog))
  | _ -> failwith "DT: impossible branch"
)))))))
  | Base_dList.C_Base_dList_dList_Nil -> ((((((((((((v_Vuna_dCompiler_dDriver_dCompilerCli_dbuildRun nFs) nConsole) nClock) nEnv) nProcess) nExit) nArgs) noCompile) (v_Vuna_dCompiler_dDriver_dCompilerCli_ddefaultDir dir)) out) pkg) o)
  | _ -> failwith "DT: impossible branch"
)) args))

# 910 "Vuna/Compiler/Driver/CompilerCli.vuna"
let v_Vuna_dCompiler_dDriver_dCompilerCli_dbuildArgs = (fun nFs nConsole nClock nEnv nProcess nExit nArgs prog args o -> ((((((((((((((v_Vuna_dCompiler_dDriver_dCompilerCli_dbuildParse nFs) nConsole) nClock) nEnv) nProcess) nExit) nArgs) prog) false) Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing) Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing) Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing) args) o))

# 1250 "Vuna/Compiler/Driver/CompilerCli.vuna"
let rec v_Vuna_dCompiler_dDriver_dCompilerCli_dstripLangGo = (fun mc0 mc1 mc2 -> (match mc0 with
  | Base_dList.C_Base_dList_dList__x58__x58_ (dtb__143, dtb__144) -> (if (dtb__143 = "--lang") then (match dtb__144 with
  | Base_dList.C_Base_dList_dList__x58__x58_ (dtb__145, dtb__146) -> (((v_Vuna_dCompiler_dDriver_dCompilerCli_dstripLangGo dtb__146) mc1) dtb__145)
  | Base_dList.C_Base_dList_dList_Nil -> { Base_dPair.f_Base_dPair_dPair_first = (Base_dList.v_Base_dList_dreverse mc1); Base_dPair.f_Base_dPair_dPair_second = mc2 }
  | _ -> failwith "DT: impossible branch"
) else (if ((Base_dString.v_Base_dString_dstartsWith "--lang=") dtb__143) then (((v_Vuna_dCompiler_dDriver_dCompilerCli_dstripLangGo dtb__144) mc1) (((Base_dString.v_Base_dString_dsubstring (bi_natFromInt 7)) (bi_natFromInt ((bi_strLength dtb__143) - 7))) dtb__143)) else (((v_Vuna_dCompiler_dDriver_dCompilerCli_dstripLangGo dtb__144) (Base_dList.C_Base_dList_dList__x58__x58_ (dtb__143, mc1))) mc2)))
  | Base_dList.C_Base_dList_dList_Nil -> { Base_dPair.f_Base_dPair_dPair_first = (Base_dList.v_Base_dList_dreverse mc1); Base_dPair.f_Base_dPair_dPair_second = mc2 }
  | _ -> failwith "DT: impossible branch"
))

# 1246 "Vuna/Compiler/Driver/CompilerCli.vuna"
let v_Vuna_dCompiler_dDriver_dCompilerCli_dstripLang = (fun args -> (((v_Vuna_dCompiler_dDriver_dCompilerCli_dstripLangGo args) Base_dList.C_Base_dList_dList_Nil) "en"))

# 1260 "Vuna/Compiler/Driver/CompilerCli.vuna"
let rec v_Vuna_dCompiler_dDriver_dCompilerCli_dhasLangFlag = (fun mc0 -> (match mc0 with
  | Base_dList.C_Base_dList_dList__x58__x58_ (dtb__147, dtb__148) -> (if (if (dtb__147 = "--lang") then true else ((Base_dString.v_Base_dString_dstartsWith "--lang=") dtb__147)) then true else (v_Vuna_dCompiler_dDriver_dCompilerCli_dhasLangFlag dtb__148))
  | Base_dList.C_Base_dList_dList_Nil -> false
  | _ -> failwith "DT: impossible branch"
))

# 1268 "Vuna/Compiler/Driver/CompilerCli.vuna"
let rec v_Vuna_dCompiler_dDriver_dCompilerCli_dstripContinueGo = (fun mc0 mc1 mc2 -> (match mc0 with
  | Base_dList.C_Base_dList_dList__x58__x58_ (dtb__149, dtb__150) -> (if (dtb__149 = "--continue-on-error") then (((v_Vuna_dCompiler_dDriver_dCompilerCli_dstripContinueGo dtb__150) mc1) true) else (((v_Vuna_dCompiler_dDriver_dCompilerCli_dstripContinueGo dtb__150) (Base_dList.C_Base_dList_dList__x58__x58_ (dtb__149, mc1))) mc2))
  | Base_dList.C_Base_dList_dList_Nil -> { Base_dPair.f_Base_dPair_dPair_first = (Base_dList.v_Base_dList_dreverse mc1); Base_dPair.f_Base_dPair_dPair_second = mc2 }
  | _ -> failwith "DT: impossible branch"
))

# 1265 "Vuna/Compiler/Driver/CompilerCli.vuna"
let v_Vuna_dCompiler_dDriver_dCompilerCli_dstripContinueOnError = (fun args -> (((v_Vuna_dCompiler_dDriver_dCompilerCli_dstripContinueGo args) Base_dList.C_Base_dList_dList_Nil) false))

# 1306 "Vuna/Compiler/Driver/CompilerCli.vuna"
let v_Vuna_dCompiler_dDriver_dCompilerCli_dprintRecovered = (fun nFs nConsole pkg e ds o -> ((fun shown -> (((Base_dMonad.v_Base_dMonad_d_x62__x62__x61_ Base_dEff.v_Monad_uBase_uEff_uEff_ur) (((((v_Vuna_dCompiler_dDriver_dCompilerCli_dprintDiagList nFs) nConsole) o) (String.concat "" ["["; (Vuna_dCompiler_dFrontend_dPackages_dPkg.v_Vuna_dCompiler_dFrontend_dPackages_dPkg_dpackageName pkg); "] "])) shown)) (fun r -> (if ((Base_dList.v_Base_dList_dlength shown) = 0) then (((((v_Vuna_dCompiler_dDriver_dCompilerCli_dprintDiagWithPrefix nFs) nConsole) (Base_dPair.v_Base_dPair_dsecondOf r)) (String.concat "" ["["; (Vuna_dCompiler_dFrontend_dPackages_dPkg.v_Vuna_dCompiler_dFrontend_dPackages_dPkg_dpackageName pkg); "] "])) e) else ((Base_dApplicative.v_Base_dApplicative_dpure Base_dEff.v_Applicative_uBase_uEff_uEff_ur) { Base_dPair.f_Base_dPair_dPair_first = 1; Base_dPair.f_Base_dPair_dPair_second = (Base_dPair.v_Base_dPair_dsecondOf r) }))))) ((v_Vuna_dCompiler_dDriver_dCompilerCli_dtakeDiags (o).f_Vuna_dCompiler_dDriver_dCompilerCli_dCliOpts_optMaxErrors) ds)))

# 1286 "Vuna/Compiler/Driver/CompilerCli.vuna"
let v_Vuna_dCompiler_dDriver_dCompilerCli_dpackageRecoverExe = (fun nFs nConsole nEnv nProcess pkg e o -> (((Base_dMonad.v_Base_dMonad_d_x62__x62__x61_ Base_dEff.v_Monad_uBase_uEff_uEff_ur) (((((Vuna_dCompiler_dDriver_dDt.v_Vuna_dCompiler_dDriver_dDt_ddtCheckRecovering nFs) nEnv) nProcess) ((Vuna_dCompiler_dFrontend_dPackages_dPkg.v_Vuna_dCompiler_dFrontend_dPackages_dPkg_dcontextWithRelease (o).f_Vuna_dCompiler_dDriver_dCompilerCli_dCliOpts_optRelease) (Vuna_dCompiler_dFrontend_dPackages_dPkg.v_Vuna_dCompiler_dFrontend_dPackages_dPkg_dpackageContext pkg))) (Vuna_dCompiler_dFrontend_dPackages_dPkg.v_Vuna_dCompiler_dFrontend_dPackages_dPkg_dpackageEntry pkg))) (fun recovered -> (match recovered with
  | Vuna_dCompiler_dBase_dDiag.C_Vuna_dCompiler_dBase_dDiag_dCheck_OkC (dtb__151) -> ((((((v_Vuna_dCompiler_dDriver_dCompilerCli_dprintRecovered nFs) nConsole) pkg) e) dtb__151) o)
  | Vuna_dCompiler_dBase_dDiag.C_Vuna_dCompiler_dBase_dDiag_dCheck_ErrC (dtb__152) -> (((((v_Vuna_dCompiler_dDriver_dCompilerCli_dprintDiagWithPrefix nFs) nConsole) o) (String.concat "" ["["; (Vuna_dCompiler_dFrontend_dPackages_dPkg.v_Vuna_dCompiler_dFrontend_dPackages_dPkg_dpackageName pkg); "] "])) dtb__152)
  | _ -> failwith "DT: impossible branch"
))))

# 1295 "Vuna/Compiler/Driver/CompilerCli.vuna"
let v_Vuna_dCompiler_dDriver_dCompilerCli_dpackageRecoverLib = (fun nFs nConsole nEnv nProcess pkg e o -> (match (Vuna_dCompiler_dFrontend_dPackages_dPkg.v_Vuna_dCompiler_dFrontend_dPackages_dPkg_dpackageExports pkg) with
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Just (dtb__153) -> (((Base_dMonad.v_Base_dMonad_d_x62__x62__x61_ Base_dEff.v_Monad_uBase_uEff_uEff_ur) (((((Vuna_dCompiler_dDriver_dDt.v_Vuna_dCompiler_dDriver_dDt_ddtCheckLibraryRecovering nFs) nEnv) nProcess) ((Vuna_dCompiler_dFrontend_dPackages_dPkg.v_Vuna_dCompiler_dFrontend_dPackages_dPkg_dcontextWithRelease (o).f_Vuna_dCompiler_dDriver_dCompilerCli_dCliOpts_optRelease) (Vuna_dCompiler_dFrontend_dPackages_dPkg.v_Vuna_dCompiler_dFrontend_dPackages_dPkg_dpackageContext pkg))) dtb__153)) (fun recovered -> (match recovered with
  | Vuna_dCompiler_dBase_dDiag.C_Vuna_dCompiler_dBase_dDiag_dCheck_OkC (dtb__154) -> ((((((v_Vuna_dCompiler_dDriver_dCompilerCli_dprintRecovered nFs) nConsole) pkg) e) dtb__154) o)
  | Vuna_dCompiler_dBase_dDiag.C_Vuna_dCompiler_dBase_dDiag_dCheck_ErrC (dtb__155) -> (((((v_Vuna_dCompiler_dDriver_dCompilerCli_dprintDiagWithPrefix nFs) nConsole) o) (String.concat "" ["["; (Vuna_dCompiler_dFrontend_dPackages_dPkg.v_Vuna_dCompiler_dFrontend_dPackages_dPkg_dpackageName pkg); "] "])) dtb__155)
  | _ -> failwith "DT: impossible branch"
)))
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing -> (((((v_Vuna_dCompiler_dDriver_dCompilerCli_dprintDiagWithPrefix nFs) nConsole) o) (String.concat "" ["["; (Vuna_dCompiler_dFrontend_dPackages_dPkg.v_Vuna_dCompiler_dFrontend_dPackages_dPkg_dpackageName pkg); "] "])) e)
  | _ -> failwith "DT: impossible branch"
))

# 1280 "Vuna/Compiler/Driver/CompilerCli.vuna"
let v_Vuna_dCompiler_dDriver_dCompilerCli_dpackageRecover = (fun nFs nConsole nEnv nProcess pkg e o -> (((Base_dMonad.v_Base_dMonad_d_x62__x62__x61_ Base_dEff.v_Monad_uBase_uEff_uEff_ur) ((Base_dEffFs.v_Base_dEffFs_dfsFileExists nFs) (Vuna_dCompiler_dFrontend_dPackages_dPkg.v_Vuna_dCompiler_dFrontend_dPackages_dPkg_dpackageEntry pkg))) (fun exists -> (if exists then (((((((v_Vuna_dCompiler_dDriver_dCompilerCli_dpackageRecoverExe nFs) nConsole) nEnv) nProcess) pkg) e) o) else (((((((v_Vuna_dCompiler_dDriver_dCompilerCli_dpackageRecoverLib nFs) nConsole) nEnv) nProcess) pkg) e) o)))))

# 1273 "Vuna/Compiler/Driver/CompilerCli.vuna"
let v_Vuna_dCompiler_dDriver_dCompilerCli_dcheckPackageErr = (fun nFs nConsole nEnv nProcess pkg e o -> (if (o).f_Vuna_dCompiler_dDriver_dCompilerCli_dCliOpts_optContinueOnError then (((((((v_Vuna_dCompiler_dDriver_dCompilerCli_dpackageRecover nFs) nConsole) nEnv) nProcess) pkg) e) o) else (((((v_Vuna_dCompiler_dDriver_dCompilerCli_dprintDiagWithPrefix nFs) nConsole) o) (String.concat "" ["["; (Vuna_dCompiler_dFrontend_dPackages_dPkg.v_Vuna_dCompiler_dFrontend_dPackages_dPkg_dpackageName pkg); "] "])) e)))

# 818 "Vuna/Compiler/Driver/CompilerCli.vuna"
let v_Vuna_dCompiler_dDriver_dCompilerCli_dcheckPackageCode = (fun nFs nConsole nClock nEnv nProcess nExit nArgs pkg wantWarnings o -> (((Base_dMonad.v_Base_dMonad_d_x62__x62__x61_ Base_dEff.v_Monad_uBase_uEff_uEff_ur) (((((((((Vuna_dCompiler_dDriver_dCompile.v_Vuna_dCompiler_dDriver_dCompile_dcheckPackage nFs) nClock) nEnv) nProcess) nExit) nArgs) (o).f_Vuna_dCompiler_dDriver_dCompilerCli_dCliOpts_optRelease) wantWarnings) pkg)) (fun r -> (match r with
  | Vuna_dCompiler_dBase_dDiag.C_Vuna_dCompiler_dBase_dDiag_dCheck_ErrC (dtb__156) -> (((((((v_Vuna_dCompiler_dDriver_dCompilerCli_dcheckPackageErr nFs) nConsole) nEnv) nProcess) pkg) dtb__156) o)
  | Vuna_dCompiler_dBase_dDiag.C_Vuna_dCompiler_dBase_dDiag_dCheck_OkC (dtb__157) -> ((fun ws -> ((fun shown -> ((fun failed -> (((Base_dMonad.v_Base_dMonad_d_x62__x62__x61_ Base_dEff.v_Monad_uBase_uEff_uEff_ur) (((((v_Vuna_dCompiler_dDriver_dCompilerCli_dprintDiagList nFs) nConsole) o) (String.concat "" ["["; (Vuna_dCompiler_dFrontend_dPackages_dPkg.v_Vuna_dCompiler_dFrontend_dPackages_dPkg_dpackageName pkg); "] "])) shown)) (fun r1 -> ((Base_dApplicative.v_Base_dApplicative_dpure Base_dEff.v_Applicative_uBase_uEff_uEff_ur) { Base_dPair.f_Base_dPair_dPair_first = failed; Base_dPair.f_Base_dPair_dPair_second = (Base_dPair.v_Base_dPair_dsecondOf r1) })))) (if (if (o).f_Vuna_dCompiler_dDriver_dCompilerCli_dCliOpts_optDenyWarnings then ((Base_dList.v_Base_dList_dlength ws) > 0) else false) then 1 else 0))) (if (if (o).f_Vuna_dCompiler_dDriver_dCompilerCli_dCliOpts_optShowWarnings then true else (o).f_Vuna_dCompiler_dDriver_dCompilerCli_dCliOpts_optDenyWarnings) then ws else Base_dList.C_Base_dList_dList_Nil))) ((Base_dList.v_Base_dList_dfilter (v_Vuna_dCompiler_dDriver_dCompilerCli_downedByPackage pkg)) (Vuna_dCompiler_dBase_dDiagnostics_dSink.v_Vuna_dCompiler_dBase_dDiagnostics_dSink_ddedupeWarnings dtb__157)))
  | _ -> failwith "DT: impossible branch"
))))

# 807 "Vuna/Compiler/Driver/CompilerCli.vuna"
let v_Vuna_dCompiler_dDriver_dCompilerCli_dcheckPackageSeq = (fun nFs nConsole nClock nEnv nProcess nExit nArgs pkg code o -> ((fun o1 -> ((fun wantWarnings -> (((Base_dMonad.v_Base_dMonad_d_x62__x62__x61_ Base_dEff.v_Monad_uBase_uEff_uEff_ur) ((((((((((v_Vuna_dCompiler_dDriver_dCompilerCli_dcheckPackageCode nFs) nConsole) nClock) nEnv) nProcess) nExit) nArgs) pkg) wantWarnings) o1)) (fun r -> ((Base_dApplicative.v_Base_dApplicative_dpure Base_dEff.v_Applicative_uBase_uEff_uEff_ur) { Base_dPair.f_Base_dPair_dPair_first = (if ((Base_dPair.v_Base_dPair_dfirstOf r) > code) then (Base_dPair.v_Base_dPair_dfirstOf r) else code); Base_dPair.f_Base_dPair_dPair_second = (Base_dPair.v_Base_dPair_dsecondOf r) })))) (if (o1).f_Vuna_dCompiler_dDriver_dCompilerCli_dCliOpts_optShowWarnings then true else (o1).f_Vuna_dCompiler_dDriver_dCompilerCli_dCliOpts_optDenyWarnings))) ((v_Vuna_dCompiler_dDriver_dCompilerCli_dapplyDiagConfig (Base_dMaybe.C_Base_dMaybe_dMaybe_Just (pkg))) o)))

# 784 "Vuna/Compiler/Driver/CompilerCli.vuna"
let rec v_Vuna_dCompiler_dDriver_dCompilerCli_dcheckPkgsInProcess = (fun nFs nConsole nClock nEnv nProcess nExit nArgs mc0 mc1 mc2 -> (match mc0 with
  | Base_dList.C_Base_dList_dList__x58__x58_ (dtb__158, dtb__159) -> (((Base_dMonad.v_Base_dMonad_d_x62__x62__x61_ Base_dEff.v_Monad_uBase_uEff_uEff_ur) ((((((((((v_Vuna_dCompiler_dDriver_dCompilerCli_dcheckPackageSeq nFs) nConsole) nClock) nEnv) nProcess) nExit) nArgs) dtb__158) mc1) mc2)) (fun r -> ((((((((((v_Vuna_dCompiler_dDriver_dCompilerCli_dcheckPkgsInProcess nFs) nConsole) nClock) nEnv) nProcess) nExit) nArgs) dtb__159) (Base_dPair.v_Base_dPair_dfirstOf r)) (Base_dPair.v_Base_dPair_dsecondOf r))))
  | Base_dList.C_Base_dList_dList_Nil -> ((Base_dApplicative.v_Base_dApplicative_dpure Base_dEff.v_Applicative_uBase_uEff_uEff_ur) { Base_dPair.f_Base_dPair_dPair_first = mc1; Base_dPair.f_Base_dPair_dPair_second = mc2 })
  | _ -> failwith "DT: impossible branch"
))

# 798 "Vuna/Compiler/Driver/CompilerCli.vuna"
let rec v_Vuna_dCompiler_dDriver_dCompilerCli_dcheckRootsSeq = (fun nFs nConsole nClock nEnv nProcess nExit nArgs mc0 mc1 mc2 -> (match mc0 with
  | Base_dList.C_Base_dList_dList__x58__x58_ (dtb__160, dtb__161) -> (((Base_dMonad.v_Base_dMonad_d_x62__x62__x61_ Base_dEff.v_Monad_uBase_uEff_uEff_ur) ((((((((((v_Vuna_dCompiler_dDriver_dCompilerCli_dcheckPackageSeq nFs) nConsole) nClock) nEnv) nProcess) nExit) nArgs) dtb__160) mc1) mc2)) (fun r -> ((fun code1 -> (if (if (mc2).f_Vuna_dCompiler_dDriver_dCompilerCli_dCliOpts_optFailFast then (code1 <> 0) else false) then ((Base_dApplicative.v_Base_dApplicative_dpure Base_dEff.v_Applicative_uBase_uEff_uEff_ur) { Base_dPair.f_Base_dPair_dPair_first = code1; Base_dPair.f_Base_dPair_dPair_second = (Base_dPair.v_Base_dPair_dsecondOf r) }) else ((((((((((v_Vuna_dCompiler_dDriver_dCompilerCli_dcheckRootsSeq nFs) nConsole) nClock) nEnv) nProcess) nExit) nArgs) dtb__161) code1) (Base_dPair.v_Base_dPair_dsecondOf r)))) (Base_dPair.v_Base_dPair_dfirstOf r))))
  | Base_dList.C_Base_dList_dList_Nil -> ((Base_dApplicative.v_Base_dApplicative_dpure Base_dEff.v_Applicative_uBase_uEff_uEff_ur) { Base_dPair.f_Base_dPair_dPair_first = mc1; Base_dPair.f_Base_dPair_dPair_second = mc2 })
  | _ -> failwith "DT: impossible branch"
))

# 764 "Vuna/Compiler/Driver/CompilerCli.vuna"
let v_Vuna_dCompiler_dDriver_dCompilerCli_dcheckPackagesSpawn = (fun nFs nConsole nClock nEnv nProcess nExit nArgs mc0 mc1 mc2 -> (match mc0 with
  | Base_dList.C_Base_dList_dList_Nil -> ((Base_dApplicative.v_Base_dApplicative_dpure Base_dEff.v_Applicative_uBase_uEff_uEff_ur) { Base_dPair.f_Base_dPair_dPair_first = mc1; Base_dPair.f_Base_dPair_dPair_second = mc2 })
  | _ -> (((Base_dMonad.v_Base_dMonad_d_x62__x62__x61_ Base_dEff.v_Monad_uBase_uEff_uEff_ur) ((v_Vuna_dCompiler_dDriver_dCompilerCli_dmapEff (fun pkg -> (((Base_dMonad.v_Base_dMonad_d_x62__x62__x61_ Base_dEff.v_Monad_uBase_uEff_uEff_ur) (((v_Vuna_dCompiler_dDriver_dCompilerCli_disWorkspaceRoot nFs) nEnv) pkg)) (fun root -> ((Base_dApplicative.v_Base_dApplicative_dpure Base_dEff.v_Applicative_uBase_uEff_uEff_ur) { Base_dPair.f_Base_dPair_dPair_first = pkg; Base_dPair.f_Base_dPair_dPair_second = root }))))) mc0)) (fun classified -> ((fun members -> ((fun roots -> (((Base_dMonad.v_Base_dMonad_d_x62__x62__x61_ Base_dEff.v_Monad_uBase_uEff_uEff_ur) ((v_Vuna_dCompiler_dDriver_dCompilerCli_dmapEff (fun pkg -> (((Base_dMonad.v_Base_dMonad_d_x62__x62__x61_ Base_dEff.v_Monad_uBase_uEff_uEff_ur) ((Base_dEffProcess.v_Base_dEffProcess_dprocessSpawn nProcess) ((v_Vuna_dCompiler_dDriver_dCompilerCli_dcheckSpawnArgs mc2) (Vuna_dCompiler_dFrontend_dPackages_dPkg.v_Vuna_dCompiler_dFrontend_dPackages_dPkg_dpackageDir pkg)))) (fun pid -> ((Base_dApplicative.v_Base_dApplicative_dpure Base_dEff.v_Applicative_uBase_uEff_uEff_ur) { Base_dPair.f_Base_dPair_dPair_first = pkg; Base_dPair.f_Base_dPair_dPair_second = pid }))))) members)) (fun started -> (((Base_dMonad.v_Base_dMonad_d_x62__x62__x61_ Base_dEff.v_Monad_uBase_uEff_uEff_ur) ((((((((((v_Vuna_dCompiler_dDriver_dCompilerCli_dcheckRootsSeq nFs) nConsole) nClock) nEnv) nProcess) nExit) nArgs) roots) mc1) mc2)) (fun r1 -> (((Base_dMonad.v_Base_dMonad_d_x62__x62__x61_ Base_dEff.v_Monad_uBase_uEff_uEff_ur) ((v_Vuna_dCompiler_dDriver_dCompilerCli_dmapEff (fun pr -> ((Base_dEffProcess.v_Base_dEffProcess_dprocessWait nProcess) (Base_dPair.v_Base_dPair_dsecondOf pr)))) started)) (fun codes -> ((Base_dApplicative.v_Base_dApplicative_dpure Base_dEff.v_Applicative_uBase_uEff_uEff_ur) { Base_dPair.f_Base_dPair_dPair_first = ((v_Vuna_dCompiler_dDriver_dCompilerCli_dcountFailures (Base_dPair.v_Base_dPair_dfirstOf r1)) codes); Base_dPair.f_Base_dPair_dPair_second = (Base_dPair.v_Base_dPair_dsecondOf r1) })))))))) ((Base_dList.v_Base_dList_dmap Base_dPair.v_Base_dPair_dfirstOf) ((Base_dList.v_Base_dList_dfilter (fun p -> (Base_dPair.v_Base_dPair_dsecondOf p))) classified)))) ((Base_dList.v_Base_dList_dmap Base_dPair.v_Base_dPair_dfirstOf) ((Base_dList.v_Base_dList_dfilter (fun p -> (Base_dBool.v_Base_dBool_dnot (Base_dPair.v_Base_dPair_dsecondOf p)))) classified)))))
))

# 751 "Vuna/Compiler/Driver/CompilerCli.vuna"
let v_Vuna_dCompiler_dDriver_dCompilerCli_dcheckPackages = (fun nFs nConsole nClock nEnv nProcess nExit nArgs mc0 mc1 mc2 -> (match mc0 with
  | Base_dList.C_Base_dList_dList__x58__x58_ (dtb__162, dtb__163) -> (match dtb__163 with
  | Base_dList.C_Base_dList_dList_Nil -> ((((((((((v_Vuna_dCompiler_dDriver_dCompilerCli_dcheckPackageSeq nFs) nConsole) nClock) nEnv) nProcess) nExit) nArgs) dtb__162) mc1) mc2)
  | _ -> ((fun oMachine -> (if (v_Vuna_dCompiler_dDriver_dCompilerCli_disMachineFormat (mc2).f_Vuna_dCompiler_dDriver_dCompilerCli_dCliOpts_optDiagFormat) then ((((((((((v_Vuna_dCompiler_dDriver_dCompilerCli_dcheckPkgsInProcess nFs) nConsole) nClock) nEnv) nProcess) nExit) nArgs) mc0) mc1) oMachine) else ((((((((((v_Vuna_dCompiler_dDriver_dCompilerCli_dcheckPackagesSpawn nFs) nConsole) nClock) nEnv) nProcess) nExit) nArgs) mc0) mc1) mc2))) (v_Vuna_dCompiler_dDriver_dCompilerCli_dmarkFormatExplicit mc2))
)
  | Base_dList.C_Base_dList_dList_Nil -> ((Base_dApplicative.v_Base_dApplicative_dpure Base_dEff.v_Applicative_uBase_uEff_uEff_ur) { Base_dPair.f_Base_dPair_dPair_first = mc1; Base_dPair.f_Base_dPair_dPair_second = mc2 })
  | _ -> failwith "DT: impossible branch"
))

# 715 "Vuna/Compiler/Driver/CompilerCli.vuna"
let v_Vuna_dCompiler_dDriver_dCompilerCli_dcheckPkgDir = (fun nFs nConsole nClock nEnv nProcess nExit nArgs dir o -> (((Base_dMonad.v_Base_dMonad_d_x62__x62__x61_ Base_dEff.v_Monad_uBase_uEff_uEff_ur) (((Vuna_dCompiler_dFrontend_dPackages_dPkg.v_Vuna_dCompiler_dFrontend_dPackages_dPkg_dworkspacePackages nFs) nEnv) dir)) (fun pkgsR -> (match pkgsR with
  | Vuna_dCompiler_dBase_dDiag.C_Vuna_dCompiler_dBase_dDiag_dCheck_ErrC (dtb__164) -> ((((v_Vuna_dCompiler_dDriver_dCompilerCli_dprintDiag nFs) nConsole) o) dtb__164)
  | Vuna_dCompiler_dBase_dDiag.C_Vuna_dCompiler_dBase_dDiag_dCheck_OkC (dtb__165) -> ((((((((((v_Vuna_dCompiler_dDriver_dCompilerCli_dcheckPackages nFs) nConsole) nClock) nEnv) nProcess) nExit) nArgs) dtb__165) 0) o)
  | _ -> failwith "DT: impossible branch"
))))

# 707 "Vuna/Compiler/Driver/CompilerCli.vuna"
let v_Vuna_dCompiler_dDriver_dCompilerCli_dcheckEmit = (fun nFs nConsole nClock nEnv nProcess nExit nArgs path o -> (((Base_dMonad.v_Base_dMonad_d_x62__x62__x61_ Base_dEff.v_Monad_uBase_uEff_uEff_ur) ((Base_dEffFs.v_Base_dEffFs_dfsFileExists nFs) path)) (fun exists -> (if exists then (((Base_dMonad.v_Base_dMonad_d_x62__x62__x61_ Base_dEff.v_Monad_uBase_uEff_uEff_ur) ((Base_dEffFs.v_Base_dEffFs_dfsIsDirectory nFs) path)) (fun isDir -> (if isDir then (((((((((v_Vuna_dCompiler_dDriver_dCompilerCli_dcheckPkgDir nFs) nConsole) nClock) nEnv) nProcess) nExit) nArgs) path) o) else ((((((v_Vuna_dCompiler_dDriver_dCompilerCli_dcheckFileEntry nFs) nConsole) nEnv) nProcess) path) o)))) else ((v_Vuna_dCompiler_dDriver_dCompilerCli_dwithOpts o) ((v_Vuna_dCompiler_dDriver_dCompilerCli_ddtPathErr nConsole) path))))))

# 698 "Vuna/Compiler/Driver/CompilerCli.vuna"
let rec v_Vuna_dCompiler_dDriver_dCompilerCli_dcheckArgs = (fun nFs nConsole nClock nEnv nProcess nExit nArgs mc0 mc1 mc2 -> (match mc1 with
  | Base_dList.C_Base_dList_dList__x58__x58_ (dtb__166, dtb__167) -> (if (dtb__166 = "--release") then ((((((((((v_Vuna_dCompiler_dDriver_dCompilerCli_dcheckArgs nFs) nConsole) nClock) nEnv) nProcess) nExit) nArgs) mc0) dtb__167) (v_Vuna_dCompiler_dDriver_dCompilerCli_dmarkRelease mc2)) else (if ((Base_dString.v_Base_dString_dstartsWith "-") dtb__166) then ((v_Vuna_dCompiler_dDriver_dCompilerCli_dwithOpts mc2) (((v_Vuna_dCompiler_dDriver_dCompilerCli_dremovedFlag nConsole) mc0) dtb__166)) else (match dtb__167 with
  | Base_dList.C_Base_dList_dList_Nil -> (((((((((v_Vuna_dCompiler_dDriver_dCompilerCli_dcheckEmit nFs) nConsole) nClock) nEnv) nProcess) nExit) nArgs) dtb__166) mc2)
  | _ -> ((v_Vuna_dCompiler_dDriver_dCompilerCli_dwithOpts mc2) ((v_Vuna_dCompiler_dDriver_dCompilerCli_dusageErr nConsole) mc0))
)))
  | Base_dList.C_Base_dList_dList_Nil -> ((v_Vuna_dCompiler_dDriver_dCompilerCli_dwithOpts mc2) ((v_Vuna_dCompiler_dDriver_dCompilerCli_dusageErr nConsole) mc0))
  | _ -> failwith "DT: impossible branch"
))

# 432 "Vuna/Compiler/Driver/CompilerCli.vuna"
let v_Vuna_dCompiler_dDriver_dCompilerCli_drunCompilerCliFor1 = (fun nFs nConsole nClock nEnv nProcess nExit nArgs prog args o -> (match args with
  | Base_dList.C_Base_dList_dList_Nil -> ((v_Vuna_dCompiler_dDriver_dCompilerCli_dwithOpts o) ((v_Vuna_dCompiler_dDriver_dCompilerCli_dusageErr nConsole) prog))
  | Base_dList.C_Base_dList_dList__x58__x58_ (dtb__168, dtb__169) -> (if (dtb__168 = "compile") then ((((((((v_Vuna_dCompiler_dDriver_dCompilerCli_dcompileArgs nFs) nConsole) nClock) nEnv) nProcess) prog) dtb__169) o) else (if (dtb__168 = "check") then ((((((((((v_Vuna_dCompiler_dDriver_dCompilerCli_dcheckArgs nFs) nConsole) nClock) nEnv) nProcess) nExit) nArgs) prog) dtb__169) o) else (if (dtb__168 = "build") then ((((((((((v_Vuna_dCompiler_dDriver_dCompilerCli_dbuildArgs nFs) nConsole) nClock) nEnv) nProcess) nExit) nArgs) prog) dtb__169) o) else (if (dtb__168 = "version") then ((v_Vuna_dCompiler_dDriver_dCompilerCli_dwithOpts o) ((v_Vuna_dCompiler_dDriver_dCompilerCli_dprintVersion nConsole) 0)) else (if (dtb__168 = "--version") then ((v_Vuna_dCompiler_dDriver_dCompilerCli_dwithOpts o) ((v_Vuna_dCompiler_dDriver_dCompilerCli_dprintVersion nConsole) 0)) else (if (dtb__168 = "seed") then ((v_Vuna_dCompiler_dDriver_dCompilerCli_dwithOpts o) ((((v_Vuna_dCompiler_dDriver_dCompilerCli_dremovedCommand nConsole) prog) "seed") "use build --out OUT [DIR] or compile DIR OUT")) else (if (dtb__168 = "help") then ((v_Vuna_dCompiler_dDriver_dCompilerCli_dwithOpts o) ((v_Vuna_dCompiler_dDriver_dCompilerCli_dhelpFor nConsole) prog)) else (if ((Base_dString.v_Base_dString_dstartsWith "-") dtb__168) then ((v_Vuna_dCompiler_dDriver_dCompilerCli_dwithOpts o) (((v_Vuna_dCompiler_dDriver_dCompilerCli_dremovedFlag nConsole) prog) dtb__168)) else ((v_Vuna_dCompiler_dDriver_dCompilerCli_dwithOpts o) (((v_Vuna_dCompiler_dDriver_dCompilerCli_dunknownCommand nConsole) prog) dtb__168))))))))))
  | _ -> failwith "DT: impossible branch"
))

# 376 "Vuna/Compiler/Driver/CompilerCli.vuna"
let v_Vuna_dCompiler_dDriver_dCompilerCli_drunCompilerCliFor = (fun nFs nConsole nClock nEnv nProcess nExit nArgs prog args -> (((Base_dMonad.v_Base_dMonad_d_x62__x62__x61_ Base_dEff.v_Monad_uBase_uEff_uEff_ur) ((Base_dEffEnv.v_Base_dEffEnv_denvGetEnv nEnv) "VUNA_RELEASE")) (fun envRel -> (((Base_dMonad.v_Base_dMonad_d_x62__x62__x61_ Base_dEff.v_Monad_uBase_uEff_uEff_ur) v_Vuna_dCompiler_dDriver_dCompilerCli_dstdoutIsTty) (fun tty -> ((fun stripped -> ((fun strippedLang -> ((fun strippedMax -> ((fun kept -> ((fun strippedContinue -> ((fun detectedLang -> ((fun fmt -> ((fun opts -> (if (v_Vuna_dCompiler_dDriver_dCompilerCli_danyHelp (Base_dPair.v_Base_dPair_dfirstOf strippedContinue)) then ((v_Vuna_dCompiler_dDriver_dCompilerCli_dhelpFor nConsole) prog) else (((Base_dMonad.v_Base_dMonad_d_x62__x62__x61_ Base_dEff.v_Monad_uBase_uEff_uEff_ur) ((((((((((v_Vuna_dCompiler_dDriver_dCompilerCli_drunCompilerCliFor1 nFs) nConsole) nClock) nEnv) nProcess) nExit) nArgs) prog) (v_Vuna_dCompiler_dDriver_dCompilerCli_dstripFailFast (v_Vuna_dCompiler_dDriver_dCompilerCli_dstripWithSources (v_Vuna_dCompiler_dDriver_dCompilerCli_dstripShowCascade (Base_dPair.v_Base_dPair_dfirstOf strippedContinue))))) opts)) (fun r -> (((((v_Vuna_dCompiler_dDriver_dCompilerCli_dflushSarif nFs) nConsole) nEnv) (Base_dPair.v_Base_dPair_dfirstOf r)) (Base_dPair.v_Base_dPair_dsecondOf r)))))) { f_Vuna_dCompiler_dDriver_dCompilerCli_dCliOpts_optDiagFormat = fmt; f_Vuna_dCompiler_dDriver_dCompilerCli_dCliOpts_optDiagLang = detectedLang; f_Vuna_dCompiler_dDriver_dCompilerCli_dCliOpts_optLangExplicit = (v_Vuna_dCompiler_dDriver_dCompilerCli_dhasLangFlag args); f_Vuna_dCompiler_dDriver_dCompilerCli_dCliOpts_optDenyWarnings = (v_Vuna_dCompiler_dDriver_dCompilerCli_dhasDenyWarnings args); f_Vuna_dCompiler_dDriver_dCompilerCli_dCliOpts_optShowWarnings = (if (v_Vuna_dCompiler_dDriver_dCompilerCli_dhasDenyWarnings args) then true else (v_Vuna_dCompiler_dDriver_dCompilerCli_dhasShowWarnings args)); f_Vuna_dCompiler_dDriver_dCompilerCli_dCliOpts_optFormatExplicit = (v_Vuna_dCompiler_dDriver_dCompilerCli_dhasFormatFlag args); f_Vuna_dCompiler_dDriver_dCompilerCli_dCliOpts_optWarningsExplicit = (if (v_Vuna_dCompiler_dDriver_dCompilerCli_dhasDenyWarnings args) then true else (v_Vuna_dCompiler_dDriver_dCompilerCli_dhasShowWarnings args)); f_Vuna_dCompiler_dDriver_dCompilerCli_dCliOpts_optDenyExplicit = (v_Vuna_dCompiler_dDriver_dCompilerCli_dhasDenyWarnings args); f_Vuna_dCompiler_dDriver_dCompilerCli_dCliOpts_optMaxErrors = (Base_dPair.v_Base_dPair_dsecondOf strippedMax); f_Vuna_dCompiler_dDriver_dCompilerCli_dCliOpts_optContinueOnError = (Base_dPair.v_Base_dPair_dsecondOf strippedContinue); f_Vuna_dCompiler_dDriver_dCompilerCli_dCliOpts_optSarifItems = Base_dList.C_Base_dList_dList_Nil; f_Vuna_dCompiler_dDriver_dCompilerCli_dCliOpts_optRelease = (envRel = "1"); f_Vuna_dCompiler_dDriver_dCompilerCli_dCliOpts_optShowCascade = (v_Vuna_dCompiler_dDriver_dCompilerCli_dhasShowCascade args); f_Vuna_dCompiler_dDriver_dCompilerCli_dCliOpts_optWithSources = (v_Vuna_dCompiler_dDriver_dCompilerCli_dhasWithSources args); f_Vuna_dCompiler_dDriver_dCompilerCli_dCliOpts_optFailFast = (v_Vuna_dCompiler_dDriver_dCompilerCli_dhasFailFast args); f_Vuna_dCompiler_dDriver_dCompilerCli_dCliOpts_optTarget = "ocaml" })) (match (Base_dPair.v_Base_dPair_dsecondOf stripped) with
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Just (dtb__170) -> dtb__170
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing -> (if (detectedLang = "en") then (if tty then "human" else "short") else "human")
  | _ -> failwith "DT: impossible branch"
))) (Base_dPair.v_Base_dPair_dsecondOf strippedLang))) (v_Vuna_dCompiler_dDriver_dCompilerCli_dstripContinueOnError kept))) (v_Vuna_dCompiler_dDriver_dCompilerCli_dstripDenyWarnings (Base_dPair.v_Base_dPair_dfirstOf strippedMax)))) (v_Vuna_dCompiler_dDriver_dCompilerCli_dstripMaxErrors (Base_dPair.v_Base_dPair_dfirstOf strippedLang)))) (v_Vuna_dCompiler_dDriver_dCompilerCli_dstripLang (Base_dPair.v_Base_dPair_dfirstOf stripped)))) (v_Vuna_dCompiler_dDriver_dCompilerCli_dstripDiagFormat args)))))))

# 64 "Vuna/Compiler/Driver/CompilerCli.vuna"
let v_Vuna_dCompiler_dDriver_dCompilerCli_drunCompilerCli = (fun nFs nConsole nClock nEnv nProcess nExit nArgs args -> (((((((((v_Vuna_dCompiler_dDriver_dCompilerCli_drunCompilerCliFor nFs) nConsole) nClock) nEnv) nProcess) nExit) nArgs) "vuna-compiler") args))
