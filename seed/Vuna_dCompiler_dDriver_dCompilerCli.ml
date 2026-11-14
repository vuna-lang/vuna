open Vuna_runtime
type t_Vuna_dCompiler_dDriver_dCompilerCli_dCliOpts = { f_Vuna_dCompiler_dDriver_dCompilerCli_dCliOpts_optDiagFormat : string; f_Vuna_dCompiler_dDriver_dCompilerCli_dCliOpts_optDiagLang : string; f_Vuna_dCompiler_dDriver_dCompilerCli_dCliOpts_optLangExplicit : bool; f_Vuna_dCompiler_dDriver_dCompilerCli_dCliOpts_optDenyWarnings : bool; f_Vuna_dCompiler_dDriver_dCompilerCli_dCliOpts_optShowWarnings : bool; f_Vuna_dCompiler_dDriver_dCompilerCli_dCliOpts_optFormatExplicit : bool; f_Vuna_dCompiler_dDriver_dCompilerCli_dCliOpts_optWarningsExplicit : bool; f_Vuna_dCompiler_dDriver_dCompilerCli_dCliOpts_optDenyExplicit : bool; f_Vuna_dCompiler_dDriver_dCompilerCli_dCliOpts_optMaxErrors : int; f_Vuna_dCompiler_dDriver_dCompilerCli_dCliOpts_optContinueOnError : bool; f_Vuna_dCompiler_dDriver_dCompilerCli_dCliOpts_optSarifItems : Vuna_dCompiler_dDiag.t_Vuna_dCompiler_dDiag_dDiagnostic Base_dList.t_Base_dList_dList; f_Vuna_dCompiler_dDriver_dCompilerCli_dCliOpts_optRelease : bool; f_Vuna_dCompiler_dDriver_dCompilerCli_dCliOpts_optShowCascade : bool; f_Vuna_dCompiler_dDriver_dCompilerCli_dCliOpts_optWithSources : bool; f_Vuna_dCompiler_dDriver_dCompilerCli_dCliOpts_optFailFast : bool; f_Vuna_dCompiler_dDriver_dCompilerCli_dCliOpts_optTarget : string }

# 34 "Vuna/Compiler/Driver/CompilerCli.vuna"
let v_Vuna_dCompiler_dDriver_dCompilerCli_dcompilerUsageLines = (fun prog -> (String.concat "" ["  "; prog; " compile [--no-print] [--release] [--target ocaml|wasm|native] (<entry.vuna> | <package-dir>) <out-dir>\n  "; prog; " check [--release] [--continue-on-error] (<file.vuna> | <package-dir>)\n  <file.vuna>                   \229\184\166 module \229\164\180 \226\134\146 \230\140\137\229\186\147\230\168\161\229\157\151\230\163\128\230\159\165\239\188\136\229\140\133\228\184\138\228\184\139\230\150\135\239\188\137\239\188\155\230\151\160\229\164\180 \226\134\146 \229\133\165\229\143\163\230\150\135\228\187\182\n  "; prog; " build [--release] [--no-compile] [--out DIR] [--package NAME] [--target ocaml|wasm|native] [DIR]\n  --no-print                    compile \231\148\159\230\136\144\231\154\132\231\168\139\229\186\143\228\184\141\230\137\147\229\141\176 main \231\187\147\230\158\156\239\188\136\233\187\152\232\174\164\230\137\147\229\141\176\239\188\137\n  --release                     release \230\158\132\229\187\186\239\188\154\230\139\146\231\187\157 assert / todo \231\173\137 debug \228\184\147\231\148\168\230\158\132\233\128\160\n  --continue-on-error           best-effort \229\164\154\233\148\153\232\175\175\239\188\154\233\128\144\230\172\161\231\167\187\233\153\164\229\164\177\232\180\165\229\163\176\230\152\142\229\144\142\231\187\167\231\187\173\239\188\136\228\187\133\229\133\165\229\143\163\230\150\135\228\187\182\239\188\137\n  "; prog; " version, --version          \230\152\190\231\164\186\231\137\136\230\156\172\n  "; prog; " help, -h\n"]))

# 46 "Vuna/Compiler/Driver/CompilerCli.vuna"
let v_Vuna_dCompiler_dDriver_dCompilerCli_dcompilerUsage = (fun prog -> ("usage:\n" ^ (v_Vuna_dCompiler_dDriver_dCompilerCli_dcompilerUsageLines prog)))

# 50 "Vuna/Compiler/Driver/CompilerCli.vuna"
let rec v_Vuna_dCompiler_dDriver_dCompilerCli_dmapEff = (fun mc0 mc1 -> (match mc1 with
  | Base_dList.C_Base_dList_dList_Cons (dtb__0, dtb__1) -> (((Base_dMonad.v_Base_dMonad_dbind Base_dEff.v_Monad_uBase_uEff_uEff_ur) (mc0 dtb__0)) (fun y -> (((Base_dMonad.v_Base_dMonad_dbind Base_dEff.v_Monad_uBase_uEff_uEff_ur) ((v_Vuna_dCompiler_dDriver_dCompilerCli_dmapEff mc0) dtb__1)) (fun ys -> ((Base_dApplicative.v_Base_dApplicative_dpure Base_dEff.v_Applicative_uBase_uEff_uEff_ur) (Base_dList.C_Base_dList_dList_Cons (y, ys)))))))
  | Base_dList.C_Base_dList_dList_Nil -> ((Base_dApplicative.v_Base_dApplicative_dpure Base_dEff.v_Applicative_uBase_uEff_uEff_ur) Base_dList.C_Base_dList_dList_Nil)
  | _ -> failwith "DT: impossible branch"
))

# 80 "Vuna/Compiler/Driver/CompilerCli.vuna"
let v_Vuna_dCompiler_dDriver_dCompilerCli_ddefaultCliOpts = { f_Vuna_dCompiler_dDriver_dCompilerCli_dCliOpts_optDiagFormat = "short"; f_Vuna_dCompiler_dDriver_dCompilerCli_dCliOpts_optDiagLang = "en"; f_Vuna_dCompiler_dDriver_dCompilerCli_dCliOpts_optLangExplicit = false; f_Vuna_dCompiler_dDriver_dCompilerCli_dCliOpts_optDenyWarnings = false; f_Vuna_dCompiler_dDriver_dCompilerCli_dCliOpts_optShowWarnings = false; f_Vuna_dCompiler_dDriver_dCompilerCli_dCliOpts_optFormatExplicit = false; f_Vuna_dCompiler_dDriver_dCompilerCli_dCliOpts_optWarningsExplicit = false; f_Vuna_dCompiler_dDriver_dCompilerCli_dCliOpts_optDenyExplicit = false; f_Vuna_dCompiler_dDriver_dCompilerCli_dCliOpts_optMaxErrors = 20; f_Vuna_dCompiler_dDriver_dCompilerCli_dCliOpts_optContinueOnError = false; f_Vuna_dCompiler_dDriver_dCompilerCli_dCliOpts_optSarifItems = Base_dList.C_Base_dList_dList_Nil; f_Vuna_dCompiler_dDriver_dCompilerCli_dCliOpts_optRelease = false; f_Vuna_dCompiler_dDriver_dCompilerCli_dCliOpts_optShowCascade = false; f_Vuna_dCompiler_dDriver_dCompilerCli_dCliOpts_optWithSources = false; f_Vuna_dCompiler_dDriver_dCompilerCli_dCliOpts_optFailFast = false; f_Vuna_dCompiler_dDriver_dCompilerCli_dCliOpts_optTarget = "ocaml" }

# 86 "Vuna/Compiler/Driver/CompilerCli.vuna"
let v_Vuna_dCompiler_dDriver_dCompilerCli_dmarkRelease = (fun o -> { o with f_Vuna_dCompiler_dDriver_dCompilerCli_dCliOpts_optRelease = true })

# 90 "Vuna/Compiler/Driver/CompilerCli.vuna"
let v_Vuna_dCompiler_dDriver_dCompilerCli_dmarkTarget = (fun t o -> { f_Vuna_dCompiler_dDriver_dCompilerCli_dCliOpts_optDiagFormat = (o).f_Vuna_dCompiler_dDriver_dCompilerCli_dCliOpts_optDiagFormat; f_Vuna_dCompiler_dDriver_dCompilerCli_dCliOpts_optDiagLang = (o).f_Vuna_dCompiler_dDriver_dCompilerCli_dCliOpts_optDiagLang; f_Vuna_dCompiler_dDriver_dCompilerCli_dCliOpts_optLangExplicit = (o).f_Vuna_dCompiler_dDriver_dCompilerCli_dCliOpts_optLangExplicit; f_Vuna_dCompiler_dDriver_dCompilerCli_dCliOpts_optDenyWarnings = (o).f_Vuna_dCompiler_dDriver_dCompilerCli_dCliOpts_optDenyWarnings; f_Vuna_dCompiler_dDriver_dCompilerCli_dCliOpts_optShowWarnings = (o).f_Vuna_dCompiler_dDriver_dCompilerCli_dCliOpts_optShowWarnings; f_Vuna_dCompiler_dDriver_dCompilerCli_dCliOpts_optFormatExplicit = (o).f_Vuna_dCompiler_dDriver_dCompilerCli_dCliOpts_optFormatExplicit; f_Vuna_dCompiler_dDriver_dCompilerCli_dCliOpts_optWarningsExplicit = (o).f_Vuna_dCompiler_dDriver_dCompilerCli_dCliOpts_optWarningsExplicit; f_Vuna_dCompiler_dDriver_dCompilerCli_dCliOpts_optDenyExplicit = (o).f_Vuna_dCompiler_dDriver_dCompilerCli_dCliOpts_optDenyExplicit; f_Vuna_dCompiler_dDriver_dCompilerCli_dCliOpts_optMaxErrors = (o).f_Vuna_dCompiler_dDriver_dCompilerCli_dCliOpts_optMaxErrors; f_Vuna_dCompiler_dDriver_dCompilerCli_dCliOpts_optContinueOnError = (o).f_Vuna_dCompiler_dDriver_dCompilerCli_dCliOpts_optContinueOnError; f_Vuna_dCompiler_dDriver_dCompilerCli_dCliOpts_optSarifItems = (o).f_Vuna_dCompiler_dDriver_dCompilerCli_dCliOpts_optSarifItems; f_Vuna_dCompiler_dDriver_dCompilerCli_dCliOpts_optRelease = (o).f_Vuna_dCompiler_dDriver_dCompilerCli_dCliOpts_optRelease; f_Vuna_dCompiler_dDriver_dCompilerCli_dCliOpts_optShowCascade = (o).f_Vuna_dCompiler_dDriver_dCompilerCli_dCliOpts_optShowCascade; f_Vuna_dCompiler_dDriver_dCompilerCli_dCliOpts_optWithSources = (o).f_Vuna_dCompiler_dDriver_dCompilerCli_dCliOpts_optWithSources; f_Vuna_dCompiler_dDriver_dCompilerCli_dCliOpts_optFailFast = (o).f_Vuna_dCompiler_dDriver_dCompilerCli_dCliOpts_optFailFast; f_Vuna_dCompiler_dDriver_dCompilerCli_dCliOpts_optTarget = t })

# 98 "Vuna/Compiler/Driver/CompilerCli.vuna"
let v_Vuna_dCompiler_dDriver_dCompilerCli_dmarkFormatExplicit = (fun o -> { f_Vuna_dCompiler_dDriver_dCompilerCli_dCliOpts_optDiagFormat = (o).f_Vuna_dCompiler_dDriver_dCompilerCli_dCliOpts_optDiagFormat; f_Vuna_dCompiler_dDriver_dCompilerCli_dCliOpts_optDiagLang = (o).f_Vuna_dCompiler_dDriver_dCompilerCli_dCliOpts_optDiagLang; f_Vuna_dCompiler_dDriver_dCompilerCli_dCliOpts_optLangExplicit = (o).f_Vuna_dCompiler_dDriver_dCompilerCli_dCliOpts_optLangExplicit; f_Vuna_dCompiler_dDriver_dCompilerCli_dCliOpts_optDenyWarnings = (o).f_Vuna_dCompiler_dDriver_dCompilerCli_dCliOpts_optDenyWarnings; f_Vuna_dCompiler_dDriver_dCompilerCli_dCliOpts_optShowWarnings = (o).f_Vuna_dCompiler_dDriver_dCompilerCli_dCliOpts_optShowWarnings; f_Vuna_dCompiler_dDriver_dCompilerCli_dCliOpts_optFormatExplicit = true; f_Vuna_dCompiler_dDriver_dCompilerCli_dCliOpts_optWarningsExplicit = (o).f_Vuna_dCompiler_dDriver_dCompilerCli_dCliOpts_optWarningsExplicit; f_Vuna_dCompiler_dDriver_dCompilerCli_dCliOpts_optDenyExplicit = (o).f_Vuna_dCompiler_dDriver_dCompilerCli_dCliOpts_optDenyExplicit; f_Vuna_dCompiler_dDriver_dCompilerCli_dCliOpts_optMaxErrors = (o).f_Vuna_dCompiler_dDriver_dCompilerCli_dCliOpts_optMaxErrors; f_Vuna_dCompiler_dDriver_dCompilerCli_dCliOpts_optContinueOnError = (o).f_Vuna_dCompiler_dDriver_dCompilerCli_dCliOpts_optContinueOnError; f_Vuna_dCompiler_dDriver_dCompilerCli_dCliOpts_optSarifItems = (o).f_Vuna_dCompiler_dDriver_dCompilerCli_dCliOpts_optSarifItems; f_Vuna_dCompiler_dDriver_dCompilerCli_dCliOpts_optRelease = (o).f_Vuna_dCompiler_dDriver_dCompilerCli_dCliOpts_optRelease; f_Vuna_dCompiler_dDriver_dCompilerCli_dCliOpts_optShowCascade = (o).f_Vuna_dCompiler_dDriver_dCompilerCli_dCliOpts_optShowCascade; f_Vuna_dCompiler_dDriver_dCompilerCli_dCliOpts_optWithSources = (o).f_Vuna_dCompiler_dDriver_dCompilerCli_dCliOpts_optWithSources; f_Vuna_dCompiler_dDriver_dCompilerCli_dCliOpts_optFailFast = (o).f_Vuna_dCompiler_dDriver_dCompilerCli_dCliOpts_optFailFast; f_Vuna_dCompiler_dDriver_dCompilerCli_dCliOpts_optTarget = (o).f_Vuna_dCompiler_dDriver_dCompilerCli_dCliOpts_optTarget })

# 105 "Vuna/Compiler/Driver/CompilerCli.vuna"
let v_Vuna_dCompiler_dDriver_dCompilerCli_dwithOpts = (fun o m -> (((Base_dMonad.v_Base_dMonad_dbind Base_dEff.v_Monad_uBase_uEff_uEff_ur) m) (fun code -> ((Base_dApplicative.v_Base_dApplicative_dpure Base_dEff.v_Applicative_uBase_uEff_uEff_ur) { Base_dPair.f_Base_dPair_dPair_first = code; Base_dPair.f_Base_dPair_dPair_second = o }))))

# 110 "Vuna/Compiler/Driver/CompilerCli.vuna"
let v_Vuna_dCompiler_dDriver_dCompilerCli_ddiagExitFor = (fun d -> (if (d).Vuna_dCompiler_dDiag.f_Vuna_dCompiler_dDiag_dDiagnostic_diagInternal then 70 else (match (d).Vuna_dCompiler_dDiag.f_Vuna_dCompiler_dDiag_dDiagnostic_diagSeverity with
  | Vuna_dCompiler_dDiag.C_Vuna_dCompiler_dDiag_dSeverity_SevError -> 1
  | _ -> 0
)))

# 140 "Vuna/Compiler/Driver/CompilerCli.vuna"
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
)))) (if (mc1).f_Vuna_dCompiler_dDriver_dCompilerCli_dCliOpts_optFormatExplicit then (mc1).f_Vuna_dCompiler_dDriver_dCompilerCli_dCliOpts_optDiagFormat else (if (lang = "en") then fmt0 else (if (((Base_dEq.v_Base_dEq_deq (Base_dMaybe.v_Eq_uBase_uMaybe_uMaybe_ua Base_dString.v_Eq_uString)) (man).Vuna_dCompiler_dFrontend_dManifest.f_Vuna_dCompiler_dFrontend_dManifest_dManifest_manifestDiagFormat) Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing) then "human" else fmt0))))) (if (mc1).f_Vuna_dCompiler_dDriver_dCompilerCli_dCliOpts_optLangExplicit then (mc1).f_Vuna_dCompiler_dDriver_dCompilerCli_dCliOpts_optDiagLang else (match (man).Vuna_dCompiler_dFrontend_dManifest.f_Vuna_dCompiler_dFrontend_dManifest_dManifest_manifestDiagLang with
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Just (dtb__6) -> dtb__6
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing -> (mc1).f_Vuna_dCompiler_dDriver_dCompilerCli_dCliOpts_optDiagLang
  | _ -> failwith "DT: impossible branch"
)))) (match (man).Vuna_dCompiler_dFrontend_dManifest.f_Vuna_dCompiler_dFrontend_dManifest_dManifest_manifestDiagFormat with
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Just (dtb__7) -> dtb__7
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing -> (mc1).f_Vuna_dCompiler_dDriver_dCompilerCli_dCliOpts_optDiagFormat
  | _ -> failwith "DT: impossible branch"
))) (dtb__2).Vuna_dCompiler_dPackages_dPkg.f_Vuna_dCompiler_dPackages_dPkg_dPackage_packageManifest)
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing -> mc1
  | _ -> failwith "DT: impossible branch"
))

# 137 "Vuna/Compiler/Driver/CompilerCli.vuna"
let v_Vuna_dCompiler_dDriver_dCompilerCli_dapplyDiagConfig = (fun m o -> ((v_Vuna_dCompiler_dDriver_dCompilerCli_dapplyManifestOpts m) o))

# 172 "Vuna/Compiler/Driver/CompilerCli.vuna"
let v_Vuna_dCompiler_dDriver_dCompilerCli_dmaxErrorsOf = (fun o -> (if (o).f_Vuna_dCompiler_dDriver_dCompilerCli_dCliOpts_optFailFast then 1 else (o).f_Vuna_dCompiler_dDriver_dCompilerCli_dCliOpts_optMaxErrors))

# 180 "Vuna/Compiler/Driver/CompilerCli.vuna"
let rec v_Vuna_dCompiler_dDriver_dCompilerCli_dtakeDiagsGo = (fun mc0 mc1 -> (match mc1 with
  | Base_dList.C_Base_dList_dList_Cons (dtb__8, dtb__9) -> (if (mc0 <= 0) then Base_dList.C_Base_dList_dList_Nil else (Base_dList.C_Base_dList_dList_Cons (dtb__8, ((v_Vuna_dCompiler_dDriver_dCompilerCli_dtakeDiagsGo (mc0 - 1)) dtb__9))))
  | Base_dList.C_Base_dList_dList_Nil -> Base_dList.C_Base_dList_dList_Nil
  | _ -> failwith "DT: impossible branch"
))

# 176 "Vuna/Compiler/Driver/CompilerCli.vuna"
let v_Vuna_dCompiler_dDriver_dCompilerCli_dtakeDiags = (fun n ds -> (if (n <= 0) then ds else ((v_Vuna_dCompiler_dDriver_dCompilerCli_dtakeDiagsGo n) ds)))

# 185 "Vuna/Compiler/Driver/CompilerCli.vuna"
let rec v_Vuna_dCompiler_dDriver_dCompilerCli_dstripDenyWarnings = (fun mc0 -> (match mc0 with
  | Base_dList.C_Base_dList_dList_Cons (dtb__10, dtb__11) -> (if (if (if (dtb__10 = "--deny-warnings") then true else (dtb__10 = "--warnings")) then true else (dtb__10 = "-W")) then (v_Vuna_dCompiler_dDriver_dCompilerCli_dstripDenyWarnings dtb__11) else (Base_dList.C_Base_dList_dList_Cons (dtb__10, (v_Vuna_dCompiler_dDriver_dCompilerCli_dstripDenyWarnings dtb__11))))
  | Base_dList.C_Base_dList_dList_Nil -> Base_dList.C_Base_dList_dList_Nil
  | _ -> failwith "DT: impossible branch"
))

# 192 "Vuna/Compiler/Driver/CompilerCli.vuna"
let rec v_Vuna_dCompiler_dDriver_dCompilerCli_dhasDenyWarnings = (fun mc0 -> (match mc0 with
  | Base_dList.C_Base_dList_dList_Cons (dtb__12, dtb__13) -> (if (dtb__12 = "--deny-warnings") then true else (v_Vuna_dCompiler_dDriver_dCompilerCli_dhasDenyWarnings dtb__13))
  | Base_dList.C_Base_dList_dList_Nil -> false
  | _ -> failwith "DT: impossible branch"
))

# 197 "Vuna/Compiler/Driver/CompilerCli.vuna"
let rec v_Vuna_dCompiler_dDriver_dCompilerCli_dhasShowCascade = (fun mc0 -> (match mc0 with
  | Base_dList.C_Base_dList_dList_Cons (dtb__14, dtb__15) -> (if (dtb__14 = "--show-cascade") then true else (v_Vuna_dCompiler_dDriver_dCompilerCli_dhasShowCascade dtb__15))
  | Base_dList.C_Base_dList_dList_Nil -> false
  | _ -> failwith "DT: impossible branch"
))

# 201 "Vuna/Compiler/Driver/CompilerCli.vuna"
let rec v_Vuna_dCompiler_dDriver_dCompilerCli_dstripShowCascade = (fun mc0 -> (match mc0 with
  | Base_dList.C_Base_dList_dList_Cons (dtb__16, dtb__17) -> (if (dtb__16 = "--show-cascade") then (v_Vuna_dCompiler_dDriver_dCompilerCli_dstripShowCascade dtb__17) else (Base_dList.C_Base_dList_dList_Cons (dtb__16, (v_Vuna_dCompiler_dDriver_dCompilerCli_dstripShowCascade dtb__17))))
  | Base_dList.C_Base_dList_dList_Nil -> Base_dList.C_Base_dList_dList_Nil
  | _ -> failwith "DT: impossible branch"
))

# 206 "Vuna/Compiler/Driver/CompilerCli.vuna"
let rec v_Vuna_dCompiler_dDriver_dCompilerCli_dhasWithSources = (fun mc0 -> (match mc0 with
  | Base_dList.C_Base_dList_dList_Cons (dtb__18, dtb__19) -> (if (dtb__18 = "--with-sources") then true else (v_Vuna_dCompiler_dDriver_dCompilerCli_dhasWithSources dtb__19))
  | Base_dList.C_Base_dList_dList_Nil -> false
  | _ -> failwith "DT: impossible branch"
))

# 210 "Vuna/Compiler/Driver/CompilerCli.vuna"
let rec v_Vuna_dCompiler_dDriver_dCompilerCli_dhasFailFast = (fun mc0 -> (match mc0 with
  | Base_dList.C_Base_dList_dList_Cons (dtb__20, dtb__21) -> (if (dtb__20 = "--fail-fast") then true else (v_Vuna_dCompiler_dDriver_dCompilerCli_dhasFailFast dtb__21))
  | Base_dList.C_Base_dList_dList_Nil -> false
  | _ -> failwith "DT: impossible branch"
))

# 214 "Vuna/Compiler/Driver/CompilerCli.vuna"
let rec v_Vuna_dCompiler_dDriver_dCompilerCli_dstripFailFast = (fun mc0 -> (match mc0 with
  | Base_dList.C_Base_dList_dList_Cons (dtb__22, dtb__23) -> (if (dtb__22 = "--fail-fast") then (v_Vuna_dCompiler_dDriver_dCompilerCli_dstripFailFast dtb__23) else (Base_dList.C_Base_dList_dList_Cons (dtb__22, (v_Vuna_dCompiler_dDriver_dCompilerCli_dstripFailFast dtb__23))))
  | Base_dList.C_Base_dList_dList_Nil -> Base_dList.C_Base_dList_dList_Nil
  | _ -> failwith "DT: impossible branch"
))

# 219 "Vuna/Compiler/Driver/CompilerCli.vuna"
let rec v_Vuna_dCompiler_dDriver_dCompilerCli_dstripWithSources = (fun mc0 -> (match mc0 with
  | Base_dList.C_Base_dList_dList_Cons (dtb__24, dtb__25) -> (if (dtb__24 = "--with-sources") then (v_Vuna_dCompiler_dDriver_dCompilerCli_dstripWithSources dtb__25) else (Base_dList.C_Base_dList_dList_Cons (dtb__24, (v_Vuna_dCompiler_dDriver_dCompilerCli_dstripWithSources dtb__25))))
  | Base_dList.C_Base_dList_dList_Nil -> Base_dList.C_Base_dList_dList_Nil
  | _ -> failwith "DT: impossible branch"
))

# 236 "Vuna/Compiler/Driver/CompilerCli.vuna"
let rec v_Vuna_dCompiler_dDriver_dCompilerCli_dmemStr = (fun mc0 mc1 -> (match mc1 with
  | Base_dList.C_Base_dList_dList_Cons (dtb__26, dtb__27) -> (if (mc0 = dtb__26) then true else ((v_Vuna_dCompiler_dDriver_dCompilerCli_dmemStr mc0) dtb__27))
  | Base_dList.C_Base_dList_dList_Nil -> false
  | _ -> failwith "DT: impossible branch"
))

# 229 "Vuna/Compiler/Driver/CompilerCli.vuna"
let rec v_Vuna_dCompiler_dDriver_dCompilerCli_dlabelFiles = (fun mc0 mc1 -> (match mc0 with
  | Base_dList.C_Base_dList_dList_Cons (dtb__28, dtb__29) -> ((v_Vuna_dCompiler_dDriver_dCompilerCli_dlabelFiles dtb__29) (match (dtb__28).Vuna_dCompiler_dDiag.f_Vuna_dCompiler_dDiag_dLabel_labelSpan with
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing -> mc1
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Just (dtb__30) -> (if (if ((dtb__30).Vuna_dCompiler_dSource.f_Vuna_dCompiler_dSource_dSpan_spanFile = "") then true else ((v_Vuna_dCompiler_dDriver_dCompilerCli_dmemStr (dtb__30).Vuna_dCompiler_dSource.f_Vuna_dCompiler_dSource_dSpan_spanFile) mc1)) then mc1 else (Base_dList.C_Base_dList_dList_Cons ((dtb__30).Vuna_dCompiler_dSource.f_Vuna_dCompiler_dSource_dSpan_spanFile, mc1)))
  | _ -> failwith "DT: impossible branch"
))
  | Base_dList.C_Base_dList_dList_Nil -> mc1
  | _ -> failwith "DT: impossible branch"
))

# 225 "Vuna/Compiler/Driver/CompilerCli.vuna"
let rec v_Vuna_dCompiler_dDriver_dCompilerCli_dcollectLabelFiles = (fun mc0 mc1 -> (match mc0 with
  | Base_dList.C_Base_dList_dList_Cons (dtb__31, dtb__32) -> ((v_Vuna_dCompiler_dDriver_dCompilerCli_dcollectLabelFiles dtb__32) ((v_Vuna_dCompiler_dDriver_dCompilerCli_dlabelFiles (dtb__31).Vuna_dCompiler_dDiag.f_Vuna_dCompiler_dDiag_dDiagnostic_diagLabels) mc1))
  | Base_dList.C_Base_dList_dList_Nil -> mc1
  | _ -> failwith "DT: impossible branch"
))

# 241 "Vuna/Compiler/Driver/CompilerCli.vuna"
let rec v_Vuna_dCompiler_dDriver_dCompilerCli_dlastSlashGo = (fun mc0 mc1 mc2 -> (match mc0 with
  | Base_dList.C_Base_dList_dList_Cons (dtb__33, dtb__34) -> (((v_Vuna_dCompiler_dDriver_dCompilerCli_dlastSlashGo dtb__34) (mc1 + 1)) (if (dtb__33 = 47) then mc1 else mc2))
  | Base_dList.C_Base_dList_dList_Nil -> mc2
  | _ -> failwith "DT: impossible branch"
))

# 245 "Vuna/Compiler/Driver/CompilerCli.vuna"
let v_Vuna_dCompiler_dDriver_dCompilerCli_dlastSlashIndexOf = (fun s -> (((v_Vuna_dCompiler_dDriver_dCompilerCli_dlastSlashGo (Base_dList.dtp_unpack s)) 0) (0 - 1)))

# 248 "Vuna/Compiler/Driver/CompilerCli.vuna"
let v_Vuna_dCompiler_dDriver_dCompilerCli_ddirOf = (fun path -> ((fun n -> (if (n < 0) then "." else (if (n = 0) then "/" else (((Base_dString.v_Base_dString_dsubstring 0) (bi_natFromInt n)) path)))) (v_Vuna_dCompiler_dDriver_dCompilerCli_dlastSlashIndexOf path)))

# 254 "Vuna/Compiler/Driver/CompilerCli.vuna"
let v_Vuna_dCompiler_dDriver_dCompilerCli_dstripPathPrefix = (fun base file -> (if ((Base_dString.v_Base_dString_dstartsWith (base ^ "/")) file) then (((Base_dString.v_Base_dString_dsubstring (bi_natFromInt ((bi_strLength base) + 1))) (bi_natFromInt (((bi_strLength file) - (bi_strLength base)) - 1))) file) else file))

# 263 "Vuna/Compiler/Driver/CompilerCli.vuna"
let rec v_Vuna_dCompiler_dDriver_dCompilerCli_dsplitSlashGo = (fun mc0 mc1 mc2 -> (match mc0 with
  | Base_dList.C_Base_dList_dList_Cons (dtb__35, dtb__36) -> (if (dtb__35 = 47) then (((v_Vuna_dCompiler_dDriver_dCompilerCli_dsplitSlashGo dtb__36) Base_dList.C_Base_dList_dList_Nil) (Base_dList.C_Base_dList_dList_Cons ((Base_dList.dtp_pack (Base_dList.v_Base_dList_dreverse mc1)), mc2))) else (((v_Vuna_dCompiler_dDriver_dCompilerCli_dsplitSlashGo dtb__36) (Base_dList.C_Base_dList_dList_Cons (dtb__35, mc1))) mc2))
  | Base_dList.C_Base_dList_dList_Nil -> (Base_dList.v_Base_dList_dreverse (Base_dList.C_Base_dList_dList_Cons ((Base_dList.dtp_pack (Base_dList.v_Base_dList_dreverse mc1)), mc2)))
  | _ -> failwith "DT: impossible branch"
))

# 260 "Vuna/Compiler/Driver/CompilerCli.vuna"
let v_Vuna_dCompiler_dDriver_dCompilerCli_dsplitSlash = (fun s -> (((v_Vuna_dCompiler_dDriver_dCompilerCli_dsplitSlashGo (Base_dList.dtp_unpack s)) Base_dList.C_Base_dList_dList_Nil) Base_dList.C_Base_dList_dList_Nil))

# 269 "Vuna/Compiler/Driver/CompilerCli.vuna"
let v_Vuna_dCompiler_dDriver_dCompilerCli_dmoduleOfRel = (fun rel -> ((fun rel1 -> ((fun rel2 -> ((Base_dString.v_Base_dString_djoin ".") (v_Vuna_dCompiler_dDriver_dCompilerCli_dsplitSlash rel2))) (if ((Base_dString.v_Base_dString_dendsWith ".vuna") rel1) then (((Base_dString.v_Base_dString_dsubstring 0) (bi_natFromInt ((bi_strLength rel1) - 5))) rel1) else rel1))) (if ((Base_dString.v_Base_dString_dstartsWith "lib/") rel) then (((Base_dString.v_Base_dString_dsubstring (bi_natFromInt 4)) (bi_natFromInt ((bi_strLength rel) - 4))) rel) else (if ((Base_dString.v_Base_dString_dstartsWith "app/") rel) then (((Base_dString.v_Base_dString_dsubstring (bi_natFromInt 4)) (bi_natFromInt ((bi_strLength rel) - 4))) rel) else rel))))

# 280 "Vuna/Compiler/Driver/CompilerCli.vuna"
let rec v_Vuna_dCompiler_dDriver_dCompilerCli_dfindPkgRootGo = (fun fuel dir -> (if (fuel <= 0) then ((Base_dApplicative.v_Base_dApplicative_dpure Base_dEff.v_Applicative_uBase_uEff_uEff_ur) { Base_dPair.f_Base_dPair_dPair_first = ""; Base_dPair.f_Base_dPair_dPair_second = "" }) else ((fun candidate -> (((Base_dMonad.v_Base_dMonad_dbind Base_dEff.v_Monad_uBase_uEff_uEff_ur) ((Base_dHostRow.v_Base_dHostRow_draiseToRow Base_dHostRow.v_Base_dHostRow_dhostRow) ((fun dtio_0 -> Base_dEff.C_Base_dEff_dEff_MkEff (fun (_ : Base_dEff.t_Base_dEff_dEffUnit) -> dtp_fileExists dtio_0)) candidate))) (fun exists -> (if exists then (((Base_dMonad.v_Base_dMonad_dbind Base_dEff.v_Monad_uBase_uEff_uEff_ur) ((Base_dHostRow.v_Base_dHostRow_draiseToRow Base_dHostRow.v_Base_dHostRow_dhostRow) ((fun dtio_0 -> Base_dEff.C_Base_dEff_dEff_MkEff (fun (_ : Base_dEff.t_Base_dEff_dEffUnit) -> dtp_readFile dtio_0)) candidate))) (fun text -> ((fun name -> ((Base_dApplicative.v_Base_dApplicative_dpure Base_dEff.v_Applicative_uBase_uEff_uEff_ur) { Base_dPair.f_Base_dPair_dPair_first = dir; Base_dPair.f_Base_dPair_dPair_second = name })) (match ((Vuna_dCompiler_dFrontend_dManifest.v_Vuna_dCompiler_dFrontend_dManifest_dparseManifest candidate) text) with
  | Vuna_dCompiler_dDiag.C_Vuna_dCompiler_dDiag_dCheck_OkC (dtb__37) -> (match (dtb__37).Vuna_dCompiler_dFrontend_dManifest.f_Vuna_dCompiler_dFrontend_dManifest_dManifest_manifestName with
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing -> ""
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Just (dtb__38) -> dtb__38
  | _ -> failwith "DT: impossible branch"
)
  | Vuna_dCompiler_dDiag.C_Vuna_dCompiler_dDiag_dCheck_ErrC (dtb__39) -> ""
  | _ -> failwith "DT: impossible branch"
)))) else (if (if (dir = "/") then true else (dir = ".")) then ((Base_dApplicative.v_Base_dApplicative_dpure Base_dEff.v_Applicative_uBase_uEff_uEff_ur) { Base_dPair.f_Base_dPair_dPair_first = ""; Base_dPair.f_Base_dPair_dPair_second = "" }) else ((v_Vuna_dCompiler_dDriver_dCompilerCli_dfindPkgRootGo (fuel - 1)) (v_Vuna_dCompiler_dDriver_dCompilerCli_ddirOf dir))))))) (if (dir = "/") then "/vuna.toml" else (dir ^ "/vuna.toml")))))

# 298 "Vuna/Compiler/Driver/CompilerCli.vuna"
let v_Vuna_dCompiler_dDriver_dCompilerCli_dsourceRefEff = (fun file -> (((Base_dMonad.v_Base_dMonad_dbind Base_dEff.v_Monad_uBase_uEff_uEff_ur) (Vuna_dCompiler_dPackages_dPkg.v_Vuna_dCompiler_dPackages_dPkg_dabsolutePath file)) (fun abs -> (((Base_dMonad.v_Base_dMonad_dbind Base_dEff.v_Monad_uBase_uEff_uEff_ur) ((Base_dHostRow.v_Base_dHostRow_draiseToRow Base_dHostRow.v_Base_dHostRow_dhostRow) ((fun dtio_0 -> Base_dEff.C_Base_dEff_dEff_MkEff (fun (_ : Base_dEff.t_Base_dEff_dEffUnit) -> dtp_fileExists dtio_0)) abs))) (fun exists -> (((Base_dMonad.v_Base_dMonad_dbind Base_dEff.v_Monad_uBase_uEff_uEff_ur) (if exists then (((Base_dMonad.v_Base_dMonad_dbind Base_dEff.v_Monad_uBase_uEff_uEff_ur) ((Base_dHostRow.v_Base_dHostRow_draiseToRow Base_dHostRow.v_Base_dHostRow_dhostRow) ((fun dtio_0 -> Base_dEff.C_Base_dEff_dEff_MkEff (fun (_ : Base_dEff.t_Base_dEff_dEffUnit) -> dtp_readFile dtio_0)) abs))) (fun text -> ((Base_dApplicative.v_Base_dApplicative_dpure Base_dEff.v_Applicative_uBase_uEff_uEff_ur) (bi_strFromInt (Vuna_dCompiler_dFingerprint.v_Vuna_dCompiler_dFingerprint_dtextHashOf text))))) else ((Base_dApplicative.v_Base_dApplicative_dpure Base_dEff.v_Applicative_uBase_uEff_uEff_ur) ""))) (fun digest -> (((Base_dMonad.v_Base_dMonad_dbind Base_dEff.v_Monad_uBase_uEff_uEff_ur) ((v_Vuna_dCompiler_dDriver_dCompilerCli_dfindPkgRootGo 12) (v_Vuna_dCompiler_dDriver_dCompilerCli_ddirOf abs))) (fun root -> ((fun pkgDir -> ((fun pkgName -> ((fun rel -> ((Base_dApplicative.v_Base_dApplicative_dpure Base_dEff.v_Applicative_uBase_uEff_uEff_ur) { Vuna_dCompiler_dDiag_dFormat.f_Vuna_dCompiler_dDiag_dFormat_dSourceRef_srcFile = file; Vuna_dCompiler_dDiag_dFormat.f_Vuna_dCompiler_dDiag_dFormat_dSourceRef_srcDigest = digest; Vuna_dCompiler_dDiag_dFormat.f_Vuna_dCompiler_dDiag_dFormat_dSourceRef_srcPackage = pkgName; Vuna_dCompiler_dDiag_dFormat.f_Vuna_dCompiler_dDiag_dFormat_dSourceRef_srcModule = (v_Vuna_dCompiler_dDriver_dCompilerCli_dmoduleOfRel rel); Vuna_dCompiler_dDiag_dFormat.f_Vuna_dCompiler_dDiag_dFormat_dSourceRef_srcRelPath = rel })) (if (pkgDir = "") then file else ((v_Vuna_dCompiler_dDriver_dCompilerCli_dstripPathPrefix pkgDir) abs)))) (Base_dPair.v_Base_dPair_dsecondOf root))) (Base_dPair.v_Base_dPair_dfirstOf root)))))))))))

# 313 "Vuna/Compiler/Driver/CompilerCli.vuna"
let rec v_Vuna_dCompiler_dDriver_dCompilerCli_dsourcePairsEff = (fun mc0 -> (match mc0 with
  | Base_dList.C_Base_dList_dList_Cons (dtb__40, dtb__41) -> (((Base_dMonad.v_Base_dMonad_dbind Base_dEff.v_Monad_uBase_uEff_uEff_ur) (v_Vuna_dCompiler_dDriver_dCompilerCli_dsourcePairsEff dtb__41)) (fun more -> (((Base_dMonad.v_Base_dMonad_dbind Base_dEff.v_Monad_uBase_uEff_uEff_ur) (v_Vuna_dCompiler_dDriver_dCompilerCli_dsourceRefEff dtb__40)) (fun ref -> ((Base_dApplicative.v_Base_dApplicative_dpure Base_dEff.v_Applicative_uBase_uEff_uEff_ur) (Base_dList.C_Base_dList_dList_Cons (ref, more)))))))
  | Base_dList.C_Base_dList_dList_Nil -> ((Base_dApplicative.v_Base_dApplicative_dpure Base_dEff.v_Applicative_uBase_uEff_uEff_ur) Base_dList.C_Base_dList_dList_Nil)
  | _ -> failwith "DT: impossible branch"
))

# 117 "Vuna/Compiler/Driver/CompilerCli.vuna"
let v_Vuna_dCompiler_dDriver_dCompilerCli_dflushSarif = (fun code o -> ((fun shown -> (if ((o).f_Vuna_dCompiler_dDriver_dCompilerCli_dCliOpts_optDiagFormat = "sarif") then (((Base_dMonad.v_Base_dMonad_dbind Base_dEff.v_Monad_uBase_uEff_uEff_ur) ((Base_dHostRow.v_Base_dHostRow_draiseToRow Base_dHostRow.v_Base_dHostRow_dhostRow) ((fun dtio_0 -> Base_dEff.C_Base_dEff_dEff_MkEff (fun (_ : Base_dEff.t_Base_dEff_dEffUnit) -> dtp_print dtio_0)) ((Vuna_dCompiler_dDiag_dFormat.v_Vuna_dCompiler_dDiag_dFormat_drenderSarif shown) ^ "\n")))) (fun _u -> ((Base_dApplicative.v_Base_dApplicative_dpure Base_dEff.v_Applicative_uBase_uEff_uEff_ur) code))) else (if ((o).f_Vuna_dCompiler_dDriver_dCompilerCli_dCliOpts_optDiagFormat = "json") then (if (o).f_Vuna_dCompiler_dDriver_dCompilerCli_dCliOpts_optWithSources then (((Base_dMonad.v_Base_dMonad_dbind Base_dEff.v_Monad_uBase_uEff_uEff_ur) (v_Vuna_dCompiler_dDriver_dCompilerCli_dsourcePairsEff (Base_dList.v_Base_dList_dreverse ((v_Vuna_dCompiler_dDriver_dCompilerCli_dcollectLabelFiles shown) Base_dList.C_Base_dList_dList_Nil)))) (fun sources -> (((Base_dMonad.v_Base_dMonad_dbind Base_dEff.v_Monad_uBase_uEff_uEff_ur) ((Base_dHostRow.v_Base_dHostRow_draiseToRow Base_dHostRow.v_Base_dHostRow_dhostRow) ((fun dtio_0 -> Base_dEff.C_Base_dEff_dEff_MkEff (fun (_ : Base_dEff.t_Base_dEff_dEffUnit) -> dtp_print dtio_0)) ((((Vuna_dCompiler_dDiag_dFormat.v_Vuna_dCompiler_dDiag_dFormat_drenderJsonListWithSources (o).f_Vuna_dCompiler_dDriver_dCompilerCli_dCliOpts_optDiagLang) shown) sources) ^ "\n")))) (fun _u -> ((Base_dApplicative.v_Base_dApplicative_dpure Base_dEff.v_Applicative_uBase_uEff_uEff_ur) code))))) else (((Base_dMonad.v_Base_dMonad_dbind Base_dEff.v_Monad_uBase_uEff_uEff_ur) ((Base_dHostRow.v_Base_dHostRow_draiseToRow Base_dHostRow.v_Base_dHostRow_dhostRow) ((fun dtio_0 -> Base_dEff.C_Base_dEff_dEff_MkEff (fun (_ : Base_dEff.t_Base_dEff_dEffUnit) -> dtp_print dtio_0)) (((Vuna_dCompiler_dDiag_dFormat.v_Vuna_dCompiler_dDiag_dFormat_drenderJsonList (o).f_Vuna_dCompiler_dDriver_dCompilerCli_dCliOpts_optDiagLang) shown) ^ "\n")))) (fun _u -> ((Base_dApplicative.v_Base_dApplicative_dpure Base_dEff.v_Applicative_uBase_uEff_uEff_ur) code)))) else ((Base_dApplicative.v_Base_dApplicative_dpure Base_dEff.v_Applicative_uBase_uEff_uEff_ur) code)))) ((v_Vuna_dCompiler_dDriver_dCompilerCli_dtakeDiags (o).f_Vuna_dCompiler_dDriver_dCompilerCli_dCliOpts_optMaxErrors) (o).f_Vuna_dCompiler_dDriver_dCompilerCli_dCliOpts_optSarifItems)))

# 320 "Vuna/Compiler/Driver/CompilerCli.vuna"
let v_Vuna_dCompiler_dDriver_dCompilerCli_disCascadeDiag = (fun d -> (match (d).Vuna_dCompiler_dDiag.f_Vuna_dCompiler_dDiag_dDiagnostic_diagOrigin with
  | Vuna_dCompiler_dDiag.C_Vuna_dCompiler_dDiag_dOrigin_OriginCascade (dtb__42) -> true
  | Vuna_dCompiler_dDiag.C_Vuna_dCompiler_dDiag_dOrigin_OriginDirect -> false
  | _ -> failwith "DT: impossible branch"
))

# 326 "Vuna/Compiler/Driver/CompilerCli.vuna"
let v_Vuna_dCompiler_dDriver_dCompilerCli_disTextDiagFormat = (fun f -> (if (f = "short") then true else (f = "human")))

# 329 "Vuna/Compiler/Driver/CompilerCli.vuna"
let v_Vuna_dCompiler_dDriver_dCompilerCli_dvisibleDiags = (fun o ds -> (if (if (o).f_Vuna_dCompiler_dDriver_dCompilerCli_dCliOpts_optShowCascade then true else (Base_dBool.v_Base_dBool_dnot (v_Vuna_dCompiler_dDriver_dCompilerCli_disTextDiagFormat (o).f_Vuna_dCompiler_dDriver_dCompilerCli_dCliOpts_optDiagFormat))) then ds else ((fun kept -> (if (if ((Base_dList.v_Base_dList_dlength kept) = 0) then ((Base_dList.v_Base_dList_dlength ds) > 0) else false) then ds else kept)) ((Base_dList.v_Base_dList_dfilter (fun d -> (Base_dBool.v_Base_dBool_dnot (v_Vuna_dCompiler_dDriver_dCompilerCli_disCascadeDiag d)))) ds))))

# 337 "Vuna/Compiler/Driver/CompilerCli.vuna"
let rec v_Vuna_dCompiler_dDriver_dCompilerCli_dhasShowWarnings = (fun mc0 -> (match mc0 with
  | Base_dList.C_Base_dList_dList_Cons (dtb__43, dtb__44) -> (if (if (dtb__43 = "--warnings") then true else (dtb__43 = "-W")) then true else (v_Vuna_dCompiler_dDriver_dCompilerCli_dhasShowWarnings dtb__44))
  | Base_dList.C_Base_dList_dList_Nil -> false
  | _ -> failwith "DT: impossible branch"
))

# 343 "Vuna/Compiler/Driver/CompilerCli.vuna"
let rec v_Vuna_dCompiler_dDriver_dCompilerCli_dhasFormatFlag = (fun mc0 -> (match mc0 with
  | Base_dList.C_Base_dList_dList_Cons (dtb__45, dtb__46) -> (if (if (if (dtb__45 = "--json") then true else ((Base_dString.v_Base_dString_dstartsWith "--error-format") dtb__45)) then true else ((Base_dString.v_Base_dString_dstartsWith "--message-format") dtb__45)) then true else (v_Vuna_dCompiler_dDriver_dCompilerCli_dhasFormatFlag dtb__46))
  | Base_dList.C_Base_dList_dList_Nil -> false
  | _ -> failwith "DT: impossible branch"
))

# 354 "Vuna/Compiler/Driver/CompilerCli.vuna"
let rec v_Vuna_dCompiler_dDriver_dCompilerCli_dstripDiagFormatGo = (fun mc0 mc1 mc2 -> (match mc0 with
  | Base_dList.C_Base_dList_dList_Cons (dtb__47, dtb__48) -> (if (dtb__47 = "--json") then (((v_Vuna_dCompiler_dDriver_dCompilerCli_dstripDiagFormatGo dtb__48) mc1) (Base_dMaybe.C_Base_dMaybe_dMaybe_Just ("json"))) else (if (dtb__47 = "--error-format") then (match dtb__48 with
  | Base_dList.C_Base_dList_dList_Cons (dtb__49, dtb__50) -> (((v_Vuna_dCompiler_dDriver_dCompilerCli_dstripDiagFormatGo dtb__50) mc1) (Base_dMaybe.C_Base_dMaybe_dMaybe_Just (dtb__49)))
  | Base_dList.C_Base_dList_dList_Nil -> { Base_dPair.f_Base_dPair_dPair_first = (Base_dList.v_Base_dList_dreverse mc1); Base_dPair.f_Base_dPair_dPair_second = (Base_dMaybe.C_Base_dMaybe_dMaybe_Just ("short")) }
  | _ -> failwith "DT: impossible branch"
) else (if ((Base_dString.v_Base_dString_dstartsWith "--error-format=") dtb__47) then (((v_Vuna_dCompiler_dDriver_dCompilerCli_dstripDiagFormatGo dtb__48) mc1) (Base_dMaybe.C_Base_dMaybe_dMaybe_Just ((((Base_dString.v_Base_dString_dsubstring (bi_natFromInt 15)) (bi_natFromInt ((bi_strLength dtb__47) - 15))) dtb__47)))) else (if ((Base_dString.v_Base_dString_dstartsWith "--message-format=") dtb__47) then (((v_Vuna_dCompiler_dDriver_dCompilerCli_dstripDiagFormatGo dtb__48) mc1) (Base_dMaybe.C_Base_dMaybe_dMaybe_Just ((((Base_dString.v_Base_dString_dsubstring (bi_natFromInt 17)) (bi_natFromInt ((bi_strLength dtb__47) - 17))) dtb__47)))) else (((v_Vuna_dCompiler_dDriver_dCompilerCli_dstripDiagFormatGo dtb__48) (Base_dList.C_Base_dList_dList_Cons (dtb__47, mc1))) mc2)))))
  | Base_dList.C_Base_dList_dList_Nil -> { Base_dPair.f_Base_dPair_dPair_first = (Base_dList.v_Base_dList_dreverse mc1); Base_dPair.f_Base_dPair_dPair_second = mc2 }
  | _ -> failwith "DT: impossible branch"
))

# 350 "Vuna/Compiler/Driver/CompilerCli.vuna"
let v_Vuna_dCompiler_dDriver_dCompilerCli_dstripDiagFormat = (fun args -> (((v_Vuna_dCompiler_dDriver_dCompilerCli_dstripDiagFormatGo args) Base_dList.C_Base_dList_dList_Nil) Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing))

# 368 "Vuna/Compiler/Driver/CompilerCli.vuna"
let v_Vuna_dCompiler_dDriver_dCompilerCli_dstdoutIsTty = (((Base_dMonad.v_Base_dMonad_dbind Base_dEff.v_Monad_uBase_uEff_uEff_ur) ((Base_dHostRow.v_Base_dHostRow_draiseToRow Base_dHostRow.v_Base_dHostRow_dhostRow) (((fun dtio_0 dtio_1 -> Base_dEff.C_Base_dEff_dEff_MkEff (fun (_ : Base_dEff.t_Base_dEff_dEffUnit) -> (fun dir args -> dtp_runIn dir (Base_dList.dtp_ocamlOf args)) dtio_0 dtio_1)) ".") (Base_dList.C_Base_dList_dList_Cons ("sh", (Base_dList.C_Base_dList_dList_Cons ("-c", (Base_dList.C_Base_dList_dList_Cons ("[ -t 1 ]", Base_dList.C_Base_dList_dList_Nil))))))))) (fun code -> ((Base_dApplicative.v_Base_dApplicative_dpure Base_dEff.v_Applicative_uBase_uEff_uEff_ur) (code = 0))))

# 408 "Vuna/Compiler/Driver/CompilerCli.vuna"
let rec v_Vuna_dCompiler_dDriver_dCompilerCli_dparseIntChars = (fun mc0 mc1 mc2 mc3 -> (match mc0 with
  | Base_dList.C_Base_dList_dList_Cons (dtb__51, dtb__52) -> (if (if (dtb__51 >= 48) then (dtb__51 <= 57) else false) then ((((v_Vuna_dCompiler_dDriver_dCompilerCli_dparseIntChars dtb__52) ((mc1 * 10) + (dtb__51 - 48))) (mc2 + 1)) mc3) else (if (mc2 = 0) then mc3 else mc1))
  | Base_dList.C_Base_dList_dList_Nil -> (if (mc2 = 0) then mc3 else mc1)
  | _ -> failwith "DT: impossible branch"
))

# 404 "Vuna/Compiler/Driver/CompilerCli.vuna"
let v_Vuna_dCompiler_dDriver_dCompilerCli_dparseIntOr = (fun s fallback -> ((((v_Vuna_dCompiler_dDriver_dCompilerCli_dparseIntChars (Base_dList.dtp_unpack s)) 0) 0) fallback))

# 419 "Vuna/Compiler/Driver/CompilerCli.vuna"
let rec v_Vuna_dCompiler_dDriver_dCompilerCli_dstripMaxErrorsGo = (fun mc0 mc1 mc2 -> (match mc0 with
  | Base_dList.C_Base_dList_dList_Cons (dtb__53, dtb__54) -> (if (dtb__53 = "--max-errors") then (match dtb__54 with
  | Base_dList.C_Base_dList_dList_Cons (dtb__55, dtb__56) -> (((v_Vuna_dCompiler_dDriver_dCompilerCli_dstripMaxErrorsGo dtb__56) mc1) ((v_Vuna_dCompiler_dDriver_dCompilerCli_dparseIntOr dtb__55) mc2))
  | Base_dList.C_Base_dList_dList_Nil -> { Base_dPair.f_Base_dPair_dPair_first = (Base_dList.v_Base_dList_dreverse mc1); Base_dPair.f_Base_dPair_dPair_second = mc2 }
  | _ -> failwith "DT: impossible branch"
) else (if ((Base_dString.v_Base_dString_dstartsWith "--max-errors=") dtb__53) then (((v_Vuna_dCompiler_dDriver_dCompilerCli_dstripMaxErrorsGo dtb__54) mc1) ((v_Vuna_dCompiler_dDriver_dCompilerCli_dparseIntOr (((Base_dString.v_Base_dString_dsubstring (bi_natFromInt 13)) (bi_natFromInt ((bi_strLength dtb__53) - 13))) dtb__53)) mc2)) else (((v_Vuna_dCompiler_dDriver_dCompilerCli_dstripMaxErrorsGo dtb__54) (Base_dList.C_Base_dList_dList_Cons (dtb__53, mc1))) mc2)))
  | Base_dList.C_Base_dList_dList_Nil -> { Base_dPair.f_Base_dPair_dPair_first = (Base_dList.v_Base_dList_dreverse mc1); Base_dPair.f_Base_dPair_dPair_second = mc2 }
  | _ -> failwith "DT: impossible branch"
))

# 415 "Vuna/Compiler/Driver/CompilerCli.vuna"
let v_Vuna_dCompiler_dDriver_dCompilerCli_dstripMaxErrors = (fun args -> (((v_Vuna_dCompiler_dDriver_dCompilerCli_dstripMaxErrorsGo args) Base_dList.C_Base_dList_dList_Nil) 20))

# 446 "Vuna/Compiler/Driver/CompilerCli.vuna"
let v_Vuna_dCompiler_dDriver_dCompilerCli_dprintVersion = (fun _u -> (((Base_dMonad.v_Base_dMonad_dbind Base_dEff.v_Monad_uBase_uEff_uEff_ur) ((Base_dHostRow.v_Base_dHostRow_draiseToRow Base_dHostRow.v_Base_dHostRow_dhostRow) ((fun dtio_0 -> Base_dEff.C_Base_dEff_dEff_MkEff (fun (_ : Base_dEff.t_Base_dEff_dEffUnit) -> dtp_print dtio_0)) (String.concat "" ["vuna-compiler "; Vuna_dCompiler_dVersion.v_Vuna_dCompiler_dVersion_dvunaVersion; "\n"])))) (fun _u -> ((Base_dApplicative.v_Base_dApplicative_dpure Base_dEff.v_Applicative_uBase_uEff_uEff_ur) 0))))

# 452 "Vuna/Compiler/Driver/CompilerCli.vuna"
let rec v_Vuna_dCompiler_dDriver_dCompilerCli_danyHelp = (fun mc0 -> (match mc0 with
  | Base_dList.C_Base_dList_dList_Cons (dtb__57, dtb__58) -> (if (if (dtb__57 = "-h") then true else (dtb__57 = "--help")) then true else (v_Vuna_dCompiler_dDriver_dCompilerCli_danyHelp dtb__58))
  | Base_dList.C_Base_dList_dList_Nil -> false
  | _ -> failwith "DT: impossible branch"
))

# 457 "Vuna/Compiler/Driver/CompilerCli.vuna"
let v_Vuna_dCompiler_dDriver_dCompilerCli_dhelpFor = (fun prog -> (((Base_dMonad.v_Base_dMonad_dbind Base_dEff.v_Monad_uBase_uEff_uEff_ur) ((Base_dHostRow.v_Base_dHostRow_draiseToRow Base_dHostRow.v_Base_dHostRow_dhostRow) ((fun dtio_0 -> Base_dEff.C_Base_dEff_dEff_MkEff (fun (_ : Base_dEff.t_Base_dEff_dEffUnit) -> dtp_print dtio_0)) (v_Vuna_dCompiler_dDriver_dCompilerCli_dcompilerUsage prog)))) (fun _u -> ((Base_dApplicative.v_Base_dApplicative_dpure Base_dEff.v_Applicative_uBase_uEff_uEff_ur) 0))))

# 463 "Vuna/Compiler/Driver/CompilerCli.vuna"
let v_Vuna_dCompiler_dDriver_dCompilerCli_dusageErr = (fun prog -> (((Base_dMonad.v_Base_dMonad_dbind Base_dEff.v_Monad_uBase_uEff_uEff_ur) ((Base_dHostRow.v_Base_dHostRow_draiseToRow Base_dHostRow.v_Base_dHostRow_dhostRow) ((fun dtio_0 -> Base_dEff.C_Base_dEff_dEff_MkEff (fun (_ : Base_dEff.t_Base_dEff_dEffUnit) -> dtp_print dtio_0)) (v_Vuna_dCompiler_dDriver_dCompilerCli_dcompilerUsage prog)))) (fun _u -> ((Base_dApplicative.v_Base_dApplicative_dpure Base_dEff.v_Applicative_uBase_uEff_uEff_ur) 2))))

# 469 "Vuna/Compiler/Driver/CompilerCli.vuna"
let v_Vuna_dCompiler_dDriver_dCompilerCli_dunknownCommand = (fun prog arg -> (((Base_dMonad.v_Base_dMonad_dbind Base_dEff.v_Monad_uBase_uEff_uEff_ur) ((Base_dHostRow.v_Base_dHostRow_draiseToRow Base_dHostRow.v_Base_dHostRow_dhostRow) ((fun dtio_0 -> Base_dEff.C_Base_dEff_dEff_MkEff (fun (_ : Base_dEff.t_Base_dEff_dEffUnit) -> dtp_print dtio_0)) (String.concat "" ["error: unknown command `"; arg; "`\nrun `"; prog; " help` for the command list\n"])))) (fun _u -> ((Base_dApplicative.v_Base_dApplicative_dpure Base_dEff.v_Applicative_uBase_uEff_uEff_ur) 2))))

# 476 "Vuna/Compiler/Driver/CompilerCli.vuna"
let v_Vuna_dCompiler_dDriver_dCompilerCli_dremovedCommand = (fun prog cmd hint -> (((Base_dMonad.v_Base_dMonad_dbind Base_dEff.v_Monad_uBase_uEff_uEff_ur) ((Base_dHostRow.v_Base_dHostRow_draiseToRow Base_dHostRow.v_Base_dHostRow_dhostRow) ((fun dtio_0 -> Base_dEff.C_Base_dEff_dEff_MkEff (fun (_ : Base_dEff.t_Base_dEff_dEffUnit) -> dtp_print dtio_0)) (String.concat "" ["error: `"; cmd; "` has been removed; "; hint; "\n"])))) (fun _u -> ((Base_dApplicative.v_Base_dApplicative_dpure Base_dEff.v_Applicative_uBase_uEff_uEff_ur) 2))))

# 484 "Vuna/Compiler/Driver/CompilerCli.vuna"
let v_Vuna_dCompiler_dDriver_dCompilerCli_ddashFlag = (fun name -> ("--" ^ name))

# 487 "Vuna/Compiler/Driver/CompilerCli.vuna"
let v_Vuna_dCompiler_dDriver_dCompilerCli_dremovedFlagHint = (fun flag -> (if (flag = (v_Vuna_dCompiler_dDriver_dCompilerCli_ddashFlag "dt")) then (Base_dMaybe.C_Base_dMaybe_dMaybe_Just ("DT is the only path; drop the flag")) else (if (flag = (v_Vuna_dCompiler_dDriver_dCompilerCli_ddashFlag "package")) then (Base_dMaybe.C_Base_dMaybe_dMaybe_Just ("use `build` or `compile`")) else (if (flag = (v_Vuna_dCompiler_dDriver_dCompilerCli_ddashFlag "split")) then (Base_dMaybe.C_Base_dMaybe_dMaybe_Just ("split is the only output model; use `build --out OUT [DIR]` or `compile <pkg-dir> OUT`")) else (if (flag = (v_Vuna_dCompiler_dDriver_dCompilerCli_ddashFlag "root")) then (Base_dMaybe.C_Base_dMaybe_dMaybe_Just ("module resolution is decided by the nearest vuna.toml; set VUNA_BASE for standalone files")) else (if (flag = (v_Vuna_dCompiler_dDriver_dCompilerCli_ddashFlag "out")) then (Base_dMaybe.C_Base_dMaybe_dMaybe_Just ("pass OUTDIR positionally to `compile`; `build` accepts --out DIR")) else (if (flag = (v_Vuna_dCompiler_dDriver_dCompilerCli_ddashFlag "no-typecheck")) then (Base_dMaybe.C_Base_dMaybe_dMaybe_Just ("checking is always enabled")) else (if (flag = (v_Vuna_dCompiler_dDriver_dCompilerCli_ddashFlag "typecheck")) then (Base_dMaybe.C_Base_dMaybe_dMaybe_Just ("checking is always enabled")) else (if (flag = (v_Vuna_dCompiler_dDriver_dCompilerCli_ddashFlag "typed")) then (Base_dMaybe.C_Base_dMaybe_dMaybe_Just ("DT is the only path")) else Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing)))))))))

# 499 "Vuna/Compiler/Driver/CompilerCli.vuna"
let v_Vuna_dCompiler_dDriver_dCompilerCli_dremovedFlag = (fun prog flag -> (match (v_Vuna_dCompiler_dDriver_dCompilerCli_dremovedFlagHint flag) with
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing -> (v_Vuna_dCompiler_dDriver_dCompilerCli_dusageErr prog)
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Just (dtb__59) -> (((Base_dMonad.v_Base_dMonad_dbind Base_dEff.v_Monad_uBase_uEff_uEff_ur) ((Base_dHostRow.v_Base_dHostRow_draiseToRow Base_dHostRow.v_Base_dHostRow_dhostRow) ((fun dtio_0 -> Base_dEff.C_Base_dEff_dEff_MkEff (fun (_ : Base_dEff.t_Base_dEff_dEffUnit) -> dtp_print dtio_0)) (String.concat "" ["error: "; flag; " has been removed; "; dtb__59; "\n"])))) (fun _u -> ((Base_dApplicative.v_Base_dApplicative_dpure Base_dEff.v_Applicative_uBase_uEff_uEff_ur) 2)))
  | _ -> failwith "DT: impossible branch"
))

# 509 "Vuna/Compiler/Driver/CompilerCli.vuna"
let v_Vuna_dCompiler_dDriver_dCompilerCli_dprintErrText = (fun e -> (((Base_dMonad.v_Base_dMonad_dbind Base_dEff.v_Monad_uBase_uEff_uEff_ur) ((Base_dHostRow.v_Base_dHostRow_draiseToRow Base_dHostRow.v_Base_dHostRow_dhostRow) ((fun dtio_0 -> Base_dEff.C_Base_dEff_dEff_MkEff (fun (_ : Base_dEff.t_Base_dEff_dEffUnit) -> dtp_print dtio_0)) e))) (fun _u -> ((Base_dApplicative.v_Base_dApplicative_dpure Base_dEff.v_Applicative_uBase_uEff_uEff_ur) 1))))

# 515 "Vuna/Compiler/Driver/CompilerCli.vuna"
let v_Vuna_dCompiler_dDriver_dCompilerCli_dseverityLabelOf = (fun d -> (match (d).Vuna_dCompiler_dDiag.f_Vuna_dCompiler_dDiag_dDiagnostic_diagSeverity with
  | Vuna_dCompiler_dDiag.C_Vuna_dCompiler_dDiag_dSeverity_SevError -> "error"
  | Vuna_dCompiler_dDiag.C_Vuna_dCompiler_dDiag_dSeverity_SevWarning -> "warning"
  | Vuna_dCompiler_dDiag.C_Vuna_dCompiler_dDiag_dSeverity_SevNote -> "note"
  | Vuna_dCompiler_dDiag.C_Vuna_dCompiler_dDiag_dSeverity_SevHelp -> "help"
  | _ -> failwith "DT: impossible branch"
))

# 540 "Vuna/Compiler/Driver/CompilerCli.vuna"
let v_Vuna_dCompiler_dDriver_dCompilerCli_dcollectSarifIn = (fun o d -> { o with f_Vuna_dCompiler_dDriver_dCompilerCli_dCliOpts_optSarifItems = ((Base_dList.v_Base_dList_dappend (o).f_Vuna_dCompiler_dDriver_dCompilerCli_dCliOpts_optSarifItems) (Base_dList.C_Base_dList_dList_Cons (d, Base_dList.C_Base_dList_dList_Nil))) })

# 523 "Vuna/Compiler/Driver/CompilerCli.vuna"
let v_Vuna_dCompiler_dDriver_dCompilerCli_demitDiag = (fun o extra d -> (if ((o).f_Vuna_dCompiler_dDriver_dCompilerCli_dCliOpts_optDiagFormat = "json") then ((Base_dApplicative.v_Base_dApplicative_dpure Base_dEff.v_Applicative_uBase_uEff_uEff_ur) { Base_dPair.f_Base_dPair_dPair_first = (v_Vuna_dCompiler_dDriver_dCompilerCli_ddiagExitFor d); Base_dPair.f_Base_dPair_dPair_second = ((v_Vuna_dCompiler_dDriver_dCompilerCli_dcollectSarifIn o) d) }) else (if ((o).f_Vuna_dCompiler_dDriver_dCompilerCli_dCliOpts_optDiagFormat = "human") then (((Base_dMonad.v_Base_dMonad_dbind Base_dEff.v_Monad_uBase_uEff_uEff_ur) ((Vuna_dCompiler_dDiag_dFormat.v_Vuna_dCompiler_dDiag_dFormat_drenderHuman (o).f_Vuna_dCompiler_dDriver_dCompilerCli_dCliOpts_optDiagLang) d)) (fun msg -> (((Base_dMonad.v_Base_dMonad_dbind Base_dEff.v_Monad_uBase_uEff_uEff_ur) (v_Vuna_dCompiler_dDriver_dCompilerCli_dprintErrText (msg ^ "\n"))) (fun _u -> ((Base_dApplicative.v_Base_dApplicative_dpure Base_dEff.v_Applicative_uBase_uEff_uEff_ur) { Base_dPair.f_Base_dPair_dPair_first = (v_Vuna_dCompiler_dDriver_dCompilerCli_ddiagExitFor d); Base_dPair.f_Base_dPair_dPair_second = o }))))) else (if ((o).f_Vuna_dCompiler_dDriver_dCompilerCli_dCliOpts_optDiagFormat = "sarif") then ((Base_dApplicative.v_Base_dApplicative_dpure Base_dEff.v_Applicative_uBase_uEff_uEff_ur) { Base_dPair.f_Base_dPair_dPair_first = (v_Vuna_dCompiler_dDriver_dCompilerCli_ddiagExitFor d); Base_dPair.f_Base_dPair_dPair_second = ((v_Vuna_dCompiler_dDriver_dCompilerCli_dcollectSarifIn o) d) }) else (if ((o).f_Vuna_dCompiler_dDriver_dCompilerCli_dCliOpts_optDiagFormat = "github") then (((Base_dMonad.v_Base_dMonad_dbind Base_dEff.v_Monad_uBase_uEff_uEff_ur) (v_Vuna_dCompiler_dDriver_dCompilerCli_dprintErrText ((Vuna_dCompiler_dDiag_dFormat.v_Vuna_dCompiler_dDiag_dFormat_drenderGithub d) ^ "\n"))) (fun _u -> ((Base_dApplicative.v_Base_dApplicative_dpure Base_dEff.v_Applicative_uBase_uEff_uEff_ur) { Base_dPair.f_Base_dPair_dPair_first = (v_Vuna_dCompiler_dDriver_dCompilerCli_ddiagExitFor d); Base_dPair.f_Base_dPair_dPair_second = o }))) else (((Base_dMonad.v_Base_dMonad_dbind Base_dEff.v_Monad_uBase_uEff_uEff_ur) (Vuna_dCompiler_dDiag_dFormat.v_Vuna_dCompiler_dDiag_dFormat_drenderShortSnippetEff d)) (fun snippet -> (((Base_dMonad.v_Base_dMonad_dbind Base_dEff.v_Monad_uBase_uEff_uEff_ur) (v_Vuna_dCompiler_dDriver_dCompilerCli_dprintErrText (String.concat "" [(v_Vuna_dCompiler_dDriver_dCompilerCli_dseverityLabelOf d); ": "; extra; (Vuna_dCompiler_dDiag_dFormat.v_Vuna_dCompiler_dDiag_dFormat_drenderShort d); snippet; "\n"]))) (fun _u -> ((Base_dApplicative.v_Base_dApplicative_dpure Base_dEff.v_Applicative_uBase_uEff_uEff_ur) { Base_dPair.f_Base_dPair_dPair_first = (v_Vuna_dCompiler_dDriver_dCompilerCli_ddiagExitFor d); Base_dPair.f_Base_dPair_dPair_second = o }))))))))))

# 546 "Vuna/Compiler/Driver/CompilerCli.vuna"
let rec v_Vuna_dCompiler_dDriver_dCompilerCli_demitDiagRevSeq = (fun mc0 mc1 mc2 -> (match mc2 with
  | Base_dList.C_Base_dList_dList_Cons (dtb__60, dtb__61) -> (((Base_dMonad.v_Base_dMonad_dbind Base_dEff.v_Monad_uBase_uEff_uEff_ur) (((v_Vuna_dCompiler_dDriver_dCompilerCli_demitDiagRevSeq mc0) mc1) dtb__61)) (fun o1 -> (((Base_dMonad.v_Base_dMonad_dbind Base_dEff.v_Monad_uBase_uEff_uEff_ur) (((v_Vuna_dCompiler_dDriver_dCompilerCli_demitDiag o1) mc1) dtb__60)) (fun r -> ((Base_dApplicative.v_Base_dApplicative_dpure Base_dEff.v_Applicative_uBase_uEff_uEff_ur) (Base_dPair.v_Base_dPair_dsecondOf r))))))
  | Base_dList.C_Base_dList_dList_Nil -> ((Base_dApplicative.v_Base_dApplicative_dpure Base_dEff.v_Applicative_uBase_uEff_uEff_ur) mc0)
  | _ -> failwith "DT: impossible branch"
))

# 553 "Vuna/Compiler/Driver/CompilerCli.vuna"
let v_Vuna_dCompiler_dDriver_dCompilerCli_dprintDiagWithPrefix = (fun o extra d -> (match (d).Vuna_dCompiler_dDiag.f_Vuna_dCompiler_dDiag_dDiagnostic_diagChildren with
  | Base_dList.C_Base_dList_dList_Nil -> (((v_Vuna_dCompiler_dDriver_dCompilerCli_demitDiag o) extra) d)
  | _ -> ((fun shown -> (((Base_dMonad.v_Base_dMonad_dbind Base_dEff.v_Monad_uBase_uEff_uEff_ur) (((v_Vuna_dCompiler_dDriver_dCompilerCli_demitDiagRevSeq o) extra) shown)) (fun o1 -> ((Base_dApplicative.v_Base_dApplicative_dpure Base_dEff.v_Applicative_uBase_uEff_uEff_ur) { Base_dPair.f_Base_dPair_dPair_first = (v_Vuna_dCompiler_dDriver_dCompilerCli_ddiagExitFor d); Base_dPair.f_Base_dPair_dPair_second = o1 })))) ((v_Vuna_dCompiler_dDriver_dCompilerCli_dtakeDiags (v_Vuna_dCompiler_dDriver_dCompilerCli_dmaxErrorsOf o)) (Base_dList.C_Base_dList_dList_Cons (d, ((v_Vuna_dCompiler_dDriver_dCompilerCli_dvisibleDiags o) (d).Vuna_dCompiler_dDiag.f_Vuna_dCompiler_dDiag_dDiagnostic_diagChildren)))))
))

# 564 "Vuna/Compiler/Driver/CompilerCli.vuna"
let v_Vuna_dCompiler_dDriver_dCompilerCli_dprintDiag = (fun o d -> (((v_Vuna_dCompiler_dDriver_dCompilerCli_dprintDiagWithPrefix o) "") d))

# 568 "Vuna/Compiler/Driver/CompilerCli.vuna"
let v_Vuna_dCompiler_dDriver_dCompilerCli_dprintErr = (fun e -> (v_Vuna_dCompiler_dDriver_dCompilerCli_dprintErrText (String.concat "" ["error: "; e; "\n"])))

# 572 "Vuna/Compiler/Driver/CompilerCli.vuna"
let v_Vuna_dCompiler_dDriver_dCompilerCli_dprintDiagList = (fun o extra ds -> ((fun shown -> (((Base_dMonad.v_Base_dMonad_dbind Base_dEff.v_Monad_uBase_uEff_uEff_ur) (((v_Vuna_dCompiler_dDriver_dCompilerCli_demitDiagRevSeq o) extra) shown)) (fun o1 -> ((Base_dApplicative.v_Base_dApplicative_dpure Base_dEff.v_Applicative_uBase_uEff_uEff_ur) { Base_dPair.f_Base_dPair_dPair_first = 0; Base_dPair.f_Base_dPair_dPair_second = o1 })))) ((v_Vuna_dCompiler_dDriver_dCompilerCli_dtakeDiags (v_Vuna_dCompiler_dDriver_dCompilerCli_dmaxErrorsOf o)) ((v_Vuna_dCompiler_dDriver_dCompilerCli_dvisibleDiags o) ds))))

# 580 "Vuna/Compiler/Driver/CompilerCli.vuna"
let v_Vuna_dCompiler_dDriver_dCompilerCli_ddefaultDir = (fun mc0 -> (match mc0 with
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing -> "."
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Just (dtb__62) -> dtb__62
  | _ -> failwith "DT: impossible branch"
))

# 587 "Vuna/Compiler/Driver/CompilerCli.vuna"
let v_Vuna_dCompiler_dDriver_dCompilerCli_ddtPathErr = (fun path -> (v_Vuna_dCompiler_dDriver_dCompilerCli_dprintErr ("no such file or package directory: " ^ path)))

# 600 "Vuna/Compiler/Driver/CompilerCli.vuna"
let v_Vuna_dCompiler_dDriver_dCompilerCli_dexecutablePackageAt = (fun label dir -> (((Base_dMonad.v_Base_dMonad_dbind Base_dEff.v_Monad_uBase_uEff_uEff_ur) (Vuna_dCompiler_dPackages_dPkg.v_Vuna_dCompiler_dPackages_dPkg_dloadPackage dir)) (fun pkgR -> (match pkgR with
  | Vuna_dCompiler_dDiag.C_Vuna_dCompiler_dDiag_dCheck_ErrC (dtb__63) -> ((Base_dApplicative.v_Base_dApplicative_dpure Base_dEff.v_Applicative_uBase_uEff_uEff_ur) (Vuna_dCompiler_dDiag.C_Vuna_dCompiler_dDiag_dCheck_ErrC (dtb__63)))
  | Vuna_dCompiler_dDiag.C_Vuna_dCompiler_dDiag_dCheck_OkC (dtb__64) -> (((Base_dMonad.v_Base_dMonad_dbind Base_dEff.v_Monad_uBase_uEff_uEff_ur) ((Base_dHostRow.v_Base_dHostRow_draiseToRow Base_dHostRow.v_Base_dHostRow_dhostRow) ((fun dtio_0 -> Base_dEff.C_Base_dEff_dEff_MkEff (fun (_ : Base_dEff.t_Base_dEff_dEffUnit) -> dtp_fileExists dtio_0)) (Vuna_dCompiler_dPackages_dPkg.v_Vuna_dCompiler_dPackages_dPkg_dpackageEntry dtb__64)))) (fun exists -> (if exists then ((Base_dApplicative.v_Base_dApplicative_dpure Base_dEff.v_Applicative_uBase_uEff_uEff_ur) (Vuna_dCompiler_dDiag.C_Vuna_dCompiler_dDiag_dCheck_OkC (dtb__64))) else ((Base_dApplicative.v_Base_dApplicative_dpure Base_dEff.v_Applicative_uBase_uEff_uEff_ur) (Vuna_dCompiler_dDiag.v_Vuna_dCompiler_dDiag_derr (String.concat "" [label; ": library package "; (Vuna_dCompiler_dPackages_dPkg.v_Vuna_dCompiler_dPackages_dPkg_dpackageName dtb__64); " has no app/Main.vuna (executable package required)"]))))))
  | _ -> failwith "DT: impossible branch"
))))

# 591 "Vuna/Compiler/Driver/CompilerCli.vuna"
let v_Vuna_dCompiler_dDriver_dCompilerCli_dexecutablePackage = (fun label dir -> (((Base_dMonad.v_Base_dMonad_dbind Base_dEff.v_Monad_uBase_uEff_uEff_ur) ((Base_dHostRow.v_Base_dHostRow_draiseToRow Base_dHostRow.v_Base_dHostRow_dhostRow) ((fun dtio_0 -> Base_dEff.C_Base_dEff_dEff_MkEff (fun (_ : Base_dEff.t_Base_dEff_dEffUnit) -> dtp_fileExists dtio_0)) dir))) (fun exists -> (if exists then (((Base_dMonad.v_Base_dMonad_dbind Base_dEff.v_Monad_uBase_uEff_uEff_ur) ((Base_dHostRow.v_Base_dHostRow_draiseToRow Base_dHostRow.v_Base_dHostRow_dhostRow) ((fun dtio_0 -> Base_dEff.C_Base_dEff_dEff_MkEff (fun (_ : Base_dEff.t_Base_dEff_dEffUnit) -> dtp_isDirectory dtio_0)) dir))) (fun isDir -> (if isDir then ((v_Vuna_dCompiler_dDriver_dCompilerCli_dexecutablePackageAt label) dir) else ((Base_dApplicative.v_Base_dApplicative_dpure Base_dEff.v_Applicative_uBase_uEff_uEff_ur) (Vuna_dCompiler_dDiag.v_Vuna_dCompiler_dDiag_derr (String.concat "" [label; ": expects a package directory, not a file: "; dir])))))) else ((Base_dApplicative.v_Base_dApplicative_dpure Base_dEff.v_Applicative_uBase_uEff_uEff_ur) (Vuna_dCompiler_dDiag.v_Vuna_dCompiler_dDiag_derr ("no such file or package directory: " ^ dir)))))))

# 635 "Vuna/Compiler/Driver/CompilerCli.vuna"
let v_Vuna_dCompiler_dDriver_dCompilerCli_disKnownTarget = (fun t -> (if (if (t = "ocaml") then true else (t = "wasm")) then true else (t = "native")))

# 654 "Vuna/Compiler/Driver/CompilerCli.vuna"
let v_Vuna_dCompiler_dDriver_dCompilerCli_dcompileToTarget = (fun ctx entry printResult outDir target -> (if (target = "wasm") then (((Base_dMonad.v_Base_dMonad_dbind Base_dEff.v_Monad_uBase_uEff_uEff_ur) ((((Vuna_dCompiler_dDriver_dWasm.v_Vuna_dCompiler_dDriver_dWasm_dcompileWasm ctx) entry) printResult) outDir)) (fun r -> ((Base_dApplicative.v_Base_dApplicative_dpure Base_dEff.v_Applicative_uBase_uEff_uEff_ur) (match r with
  | Vuna_dCompiler_dDiag.C_Vuna_dCompiler_dDiag_dCheck_ErrC (dtb__65) -> (Vuna_dCompiler_dDiag.C_Vuna_dCompiler_dDiag_dCheck_ErrC (dtb__65))
  | Vuna_dCompiler_dDiag.C_Vuna_dCompiler_dDiag_dCheck_OkC (dtb__66) -> (Vuna_dCompiler_dDiag.C_Vuna_dCompiler_dDiag_dCheck_OkC ({ Base_dPair.f_Base_dPair_dPair_first = dtb__66; Base_dPair.f_Base_dPair_dPair_second = Base_dList.C_Base_dList_dList_Nil }))
  | _ -> failwith "DT: impossible branch"
)))) else (if (target = "native") then (((Base_dMonad.v_Base_dMonad_dbind Base_dEff.v_Monad_uBase_uEff_uEff_ur) ((((Vuna_dCompiler_dDriver_dNative.v_Vuna_dCompiler_dDriver_dNative_dcompileNative ctx) entry) printResult) outDir)) (fun r -> ((Base_dApplicative.v_Base_dApplicative_dpure Base_dEff.v_Applicative_uBase_uEff_uEff_ur) (match r with
  | Vuna_dCompiler_dDiag.C_Vuna_dCompiler_dDiag_dCheck_ErrC (dtb__67) -> (Vuna_dCompiler_dDiag.C_Vuna_dCompiler_dDiag_dCheck_ErrC (dtb__67))
  | Vuna_dCompiler_dDiag.C_Vuna_dCompiler_dDiag_dCheck_OkC (dtb__68) -> (Vuna_dCompiler_dDiag.C_Vuna_dCompiler_dDiag_dCheck_OkC ({ Base_dPair.f_Base_dPair_dPair_first = dtb__68; Base_dPair.f_Base_dPair_dPair_second = Base_dList.C_Base_dList_dList_Nil }))
  | _ -> failwith "DT: impossible branch"
)))) else ((((Vuna_dCompiler_dDriver_dCompile.v_Vuna_dCompiler_dDriver_dCompile_dcompileToDir ctx) entry) printResult) outDir))))

# 735 "Vuna/Compiler/Driver/CompilerCli.vuna"
let v_Vuna_dCompiler_dDriver_dCompilerCli_dcheckSpawnArgs = (fun o dir -> ((fun head0 -> ((fun base -> ((fun base2 -> ((fun base3 -> ((fun langArgs -> ((fun cascadeArgs -> ((fun sourceArgs -> ((fun failFastArgs -> ((fun maxArgs -> ((Base_dList.v_Base_dList_dappend base3) ((Base_dList.v_Base_dList_dappend langArgs) ((Base_dList.v_Base_dList_dappend maxArgs) ((Base_dList.v_Base_dList_dappend cascadeArgs) ((Base_dList.v_Base_dList_dappend sourceArgs) failFastArgs)))))) (if ((o).f_Vuna_dCompiler_dDriver_dCompilerCli_dCliOpts_optMaxErrors > 0) then (Base_dList.C_Base_dList_dList_Cons ("--max-errors", (Base_dList.C_Base_dList_dList_Cons ((bi_strFromInt (o).f_Vuna_dCompiler_dDriver_dCompilerCli_dCliOpts_optMaxErrors), Base_dList.C_Base_dList_dList_Nil)))) else Base_dList.C_Base_dList_dList_Nil))) (if (o).f_Vuna_dCompiler_dDriver_dCompilerCli_dCliOpts_optFailFast then (Base_dList.C_Base_dList_dList_Cons ("--fail-fast", Base_dList.C_Base_dList_dList_Nil)) else Base_dList.C_Base_dList_dList_Nil))) (if (o).f_Vuna_dCompiler_dDriver_dCompilerCli_dCliOpts_optWithSources then (Base_dList.C_Base_dList_dList_Cons ("--with-sources", Base_dList.C_Base_dList_dList_Nil)) else Base_dList.C_Base_dList_dList_Nil))) (if (o).f_Vuna_dCompiler_dDriver_dCompilerCli_dCliOpts_optShowCascade then (Base_dList.C_Base_dList_dList_Cons ("--show-cascade", Base_dList.C_Base_dList_dList_Nil)) else Base_dList.C_Base_dList_dList_Nil))) (if (o).f_Vuna_dCompiler_dDriver_dCompilerCli_dCliOpts_optLangExplicit then (Base_dList.C_Base_dList_dList_Cons ("--lang", (Base_dList.C_Base_dList_dList_Cons ((o).f_Vuna_dCompiler_dDriver_dCompilerCli_dCliOpts_optDiagLang, Base_dList.C_Base_dList_dList_Nil)))) else Base_dList.C_Base_dList_dList_Nil))) (if (o).f_Vuna_dCompiler_dDriver_dCompilerCli_dCliOpts_optDenyWarnings then ((Base_dList.v_Base_dList_dappend base2) (Base_dList.C_Base_dList_dList_Cons ("--deny-warnings", Base_dList.C_Base_dList_dList_Nil))) else base2))) (if (o).f_Vuna_dCompiler_dDriver_dCompilerCli_dCliOpts_optShowWarnings then ((Base_dList.v_Base_dList_dappend base) (Base_dList.C_Base_dList_dList_Cons ("--warnings", Base_dList.C_Base_dList_dList_Nil))) else base))) (if ((o).f_Vuna_dCompiler_dDriver_dCompilerCli_dCliOpts_optDiagFormat = "short") then ((Base_dList.v_Base_dList_dappend head0) (Base_dList.C_Base_dList_dList_Cons (dir, Base_dList.C_Base_dList_dList_Nil))) else ((Base_dList.v_Base_dList_dappend head0) (Base_dList.C_Base_dList_dList_Cons ("--error-format", (Base_dList.C_Base_dList_dList_Cons ((o).f_Vuna_dCompiler_dDriver_dCompilerCli_dCliOpts_optDiagFormat, (Base_dList.C_Base_dList_dList_Cons (dir, Base_dList.C_Base_dList_dList_Nil)))))))))) (if (o).f_Vuna_dCompiler_dDriver_dCompilerCli_dCliOpts_optRelease then (Base_dList.C_Base_dList_dList_Cons ("check", (Base_dList.C_Base_dList_dList_Cons ("--release", Base_dList.C_Base_dList_dList_Nil)))) else (Base_dList.C_Base_dList_dList_Cons ("check", Base_dList.C_Base_dList_dList_Nil)))))

# 754 "Vuna/Compiler/Driver/CompilerCli.vuna"
let v_Vuna_dCompiler_dDriver_dCompilerCli_disMachineFormat = (fun f -> (if (f = "json") then true else (f = "sarif")))

# 796 "Vuna/Compiler/Driver/CompilerCli.vuna"
let v_Vuna_dCompiler_dDriver_dCompilerCli_disWorkspaceRoot = (fun pkg -> (((Base_dMonad.v_Base_dMonad_dbind Base_dEff.v_Monad_uBase_uEff_uEff_ur) (Vuna_dCompiler_dPackages_dPkg.v_Vuna_dCompiler_dPackages_dPkg_dworkspacePackages (Vuna_dCompiler_dPackages_dPkg.v_Vuna_dCompiler_dPackages_dPkg_dpackageDir pkg))) (fun pkgsR -> ((Base_dApplicative.v_Base_dApplicative_dpure Base_dEff.v_Applicative_uBase_uEff_uEff_ur) (match pkgsR with
  | Vuna_dCompiler_dDiag.C_Vuna_dCompiler_dDiag_dCheck_OkC (dtb__69) -> ((Base_dList.v_Base_dList_dlength dtb__69) > 1)
  | Vuna_dCompiler_dDiag.C_Vuna_dCompiler_dDiag_dCheck_ErrC (dtb__70) -> false
  | _ -> failwith "DT: impossible branch"
)))))

# 838 "Vuna/Compiler/Driver/CompilerCli.vuna"
let rec v_Vuna_dCompiler_dDriver_dCompilerCli_dcountFailures = (fun mc0 mc1 -> (match mc1 with
  | Base_dList.C_Base_dList_dList_Cons (dtb__71, dtb__72) -> (if (dtb__71 = 0) then ((v_Vuna_dCompiler_dDriver_dCompilerCli_dcountFailures mc0) dtb__72) else ((v_Vuna_dCompiler_dDriver_dCompilerCli_dcountFailures 1) dtb__72))
  | Base_dList.C_Base_dList_dList_Nil -> mc0
  | _ -> failwith "DT: impossible branch"
))

# 958 "Vuna/Compiler/Driver/CompilerCli.vuna"
let v_Vuna_dCompiler_dDriver_dCompilerCli_disSingleLibraryPackage = (fun mc0 -> (match mc0 with
  | Base_dList.C_Base_dList_dList_Cons (dtb__73, dtb__74) -> (match dtb__74 with
  | Base_dList.C_Base_dList_dList_Nil -> (((Base_dMonad.v_Base_dMonad_dbind Base_dEff.v_Monad_uBase_uEff_uEff_ur) ((Base_dHostRow.v_Base_dHostRow_draiseToRow Base_dHostRow.v_Base_dHostRow_dhostRow) ((fun dtio_0 -> Base_dEff.C_Base_dEff_dEff_MkEff (fun (_ : Base_dEff.t_Base_dEff_dEffUnit) -> dtp_fileExists dtio_0)) (Vuna_dCompiler_dPackages_dPkg.v_Vuna_dCompiler_dPackages_dPkg_dpackageEntry dtb__73)))) (fun exists -> ((Base_dApplicative.v_Base_dApplicative_dpure Base_dEff.v_Applicative_uBase_uEff_uEff_ur) (Base_dBool.v_Base_dBool_dnot exists))))
  | _ -> ((Base_dApplicative.v_Base_dApplicative_dpure Base_dEff.v_Applicative_uBase_uEff_uEff_ur) false)
)
  | _ -> ((Base_dApplicative.v_Base_dApplicative_dpure Base_dEff.v_Applicative_uBase_uEff_uEff_ur) false)
))

# 964 "Vuna/Compiler/Driver/CompilerCli.vuna"
let v_Vuna_dCompiler_dDriver_dCompilerCli_dlibraryOnlyMessage = (fun mc0 -> (match mc0 with
  | Base_dList.C_Base_dList_dList_Nil -> "no package to build"
  | Base_dList.C_Base_dList_dList_Cons (dtb__75, dtb__76) -> (String.concat "" ["library package "; (Vuna_dCompiler_dPackages_dPkg.v_Vuna_dCompiler_dPackages_dPkg_dpackageName dtb__75); " has no app/Main.vuna (executable package required; use `check` for libraries)"])
  | _ -> failwith "DT: impossible branch"
))

# 975 "Vuna/Compiler/Driver/CompilerCli.vuna"
let rec v_Vuna_dCompiler_dDriver_dCompilerCli_dfindPackageByName = (fun mc0 mc1 -> (match mc1 with
  | Base_dList.C_Base_dList_dList_Cons (dtb__77, dtb__78) -> (if ((Vuna_dCompiler_dPackages_dPkg.v_Vuna_dCompiler_dPackages_dPkg_dpackageName dtb__77) = mc0) then (Base_dMaybe.C_Base_dMaybe_dMaybe_Just (dtb__77)) else ((v_Vuna_dCompiler_dDriver_dCompilerCli_dfindPackageByName mc0) dtb__78))
  | Base_dList.C_Base_dList_dList_Nil -> Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing
  | _ -> failwith "DT: impossible branch"
))

# 969 "Vuna/Compiler/Driver/CompilerCli.vuna"
let v_Vuna_dCompiler_dDriver_dCompilerCli_dselectBuildTargets = (fun mc0 mc1 -> (match mc0 with
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Just (dtb__79) -> (match ((v_Vuna_dCompiler_dDriver_dCompilerCli_dfindPackageByName dtb__79) mc1) with
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing -> (Vuna_dCompiler_dDiag.v_Vuna_dCompiler_dDiag_derr ("no such package in workspace: " ^ dtb__79))
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Just (dtb__80) -> (Vuna_dCompiler_dDiag.C_Vuna_dCompiler_dDiag_dCheck_OkC ((Base_dList.C_Base_dList_dList_Cons (dtb__80, Base_dList.C_Base_dList_dList_Nil))))
  | _ -> failwith "DT: impossible branch"
)
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing -> (Vuna_dCompiler_dDiag.C_Vuna_dCompiler_dDiag_dCheck_OkC (mc1))
  | _ -> failwith "DT: impossible branch"
))

# 991 "Vuna/Compiler/Driver/CompilerCli.vuna"
let v_Vuna_dCompiler_dDriver_dCompilerCli_dbuildNativeOne = (fun noCompile multiOut outM pkg o -> ((fun name -> ((fun outDir -> ((fun sPath -> ((fun binDir -> ((fun binPath -> ((fun script -> ((fun ccArgs -> (((Base_dMonad.v_Base_dMonad_dbind Base_dEff.v_Monad_uBase_uEff_uEff_ur) ((((Vuna_dCompiler_dDriver_dNative.v_Vuna_dCompiler_dDriver_dNative_dcompileNative ((Vuna_dCompiler_dPackages_dPkg.v_Vuna_dCompiler_dPackages_dPkg_dcontextWithRelease (o).f_Vuna_dCompiler_dDriver_dCompilerCli_dCliOpts_optRelease) (Vuna_dCompiler_dPackages_dPkg.v_Vuna_dCompiler_dPackages_dPkg_dpackageContext pkg))) (Vuna_dCompiler_dPackages_dPkg.v_Vuna_dCompiler_dPackages_dPkg_dpackageEntry pkg)) true) outDir)) (fun r -> (match r with
  | Vuna_dCompiler_dDiag.C_Vuna_dCompiler_dDiag_dCheck_ErrC (dtb__81) -> ((v_Vuna_dCompiler_dDriver_dCompilerCli_dprintDiag o) dtb__81)
  | Vuna_dCompiler_dDiag.C_Vuna_dCompiler_dDiag_dCheck_OkC (dtb__82) -> (((Base_dMonad.v_Base_dMonad_dbind Base_dEff.v_Monad_uBase_uEff_uEff_ur) ((Base_dHostRow.v_Base_dHostRow_draiseToRow Base_dHostRow.v_Base_dHostRow_dhostRow) (((fun dtio_0 dtio_1 -> Base_dEff.C_Base_dEff_dEff_MkEff (fun (_ : Base_dEff.t_Base_dEff_dEffUnit) -> dtp_writeFile dtio_0 dtio_1)) (outDir ^ "/build.sh")) script))) (fun _u -> (if noCompile then (((Base_dMonad.v_Base_dMonad_dbind Base_dEff.v_Monad_uBase_uEff_uEff_ur) ((Base_dHostRow.v_Base_dHostRow_draiseToRow Base_dHostRow.v_Base_dHostRow_dhostRow) ((fun dtio_0 -> Base_dEff.C_Base_dEff_dEff_MkEff (fun (_ : Base_dEff.t_Base_dEff_dEffUnit) -> dtp_print dtio_0)) (String.concat "" ["wrote "; sPath; "\n"])))) (fun _u -> ((Base_dApplicative.v_Base_dApplicative_dpure Base_dEff.v_Applicative_uBase_uEff_uEff_ur) { Base_dPair.f_Base_dPair_dPair_first = 0; Base_dPair.f_Base_dPair_dPair_second = o }))) else (((Base_dMonad.v_Base_dMonad_dbind Base_dEff.v_Monad_uBase_uEff_uEff_ur) (Vuna_dCompiler_dDriver_dCompile.v_Vuna_dCompiler_dDriver_dCompile_densureDirPath binDir)) (fun _u -> (((Base_dMonad.v_Base_dMonad_dbind Base_dEff.v_Monad_uBase_uEff_uEff_ur) ((Base_dHostRow.v_Base_dHostRow_draiseToRow Base_dHostRow.v_Base_dHostRow_dhostRow) (((fun dtio_0 dtio_1 -> Base_dEff.C_Base_dEff_dEff_MkEff (fun (_ : Base_dEff.t_Base_dEff_dEffUnit) -> (fun dir args -> dtp_runIn dir (Base_dList.dtp_ocamlOf args)) dtio_0 dtio_1)) ".") ccArgs))) (fun code -> (if (code = 0) then (((Base_dMonad.v_Base_dMonad_dbind Base_dEff.v_Monad_uBase_uEff_uEff_ur) ((Base_dHostRow.v_Base_dHostRow_draiseToRow Base_dHostRow.v_Base_dHostRow_dhostRow) ((fun dtio_0 -> Base_dEff.C_Base_dEff_dEff_MkEff (fun (_ : Base_dEff.t_Base_dEff_dEffUnit) -> dtp_print dtio_0)) (String.concat "" ["wrote "; binPath; "\n"])))) (fun _u -> ((Base_dApplicative.v_Base_dApplicative_dpure Base_dEff.v_Applicative_uBase_uEff_uEff_ur) { Base_dPair.f_Base_dPair_dPair_first = 0; Base_dPair.f_Base_dPair_dPair_second = o }))) else (((Base_dMonad.v_Base_dMonad_dbind Base_dEff.v_Monad_uBase_uEff_uEff_ur) ((Base_dHostRow.v_Base_dHostRow_draiseToRow Base_dHostRow.v_Base_dHostRow_dhostRow) ((fun dtio_0 -> Base_dEff.C_Base_dEff_dEff_MkEff (fun (_ : Base_dEff.t_Base_dEff_dEffUnit) -> dtp_print dtio_0)) (String.concat "" ["native link failed: cc exited "; (bi_strFromInt code); "\n"])))) (fun _u -> ((Base_dApplicative.v_Base_dApplicative_dpure Base_dEff.v_Applicative_uBase_uEff_uEff_ur) { Base_dPair.f_Base_dPair_dPair_first = 1; Base_dPair.f_Base_dPair_dPair_second = o })))))))))))
  | _ -> failwith "DT: impossible branch"
)))) (Base_dList.C_Base_dList_dList_Cons ("cc", (Base_dList.C_Base_dList_dList_Cons ("-static", (Base_dList.C_Base_dList_dList_Cons ("-nostdlib", (Base_dList.C_Base_dList_dList_Cons ("-no-pie", (Base_dList.C_Base_dList_dList_Cons ("-Wl,--build-id=none", (Base_dList.C_Base_dList_dList_Cons ("-o", (Base_dList.C_Base_dList_dList_Cons (binPath, (Base_dList.C_Base_dList_dList_Cons (sPath, Base_dList.C_Base_dList_dList_Nil)))))))))))))))))) (String.concat "" ["#!/bin/sh\nset -eu\ncd \"$(dirname \"$0\")\"\nmkdir -p bin\ncc -static -nostdlib -no-pie -Wl,--build-id=none -o \"bin/"; name; "\" main.s\n"]))) (String.concat "" [binDir; "/"; name]))) (outDir ^ "/bin"))) (outDir ^ "/main.s"))) (match outM with
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Just (dtb__83) -> (if multiOut then (String.concat "" [dtb__83; "/"; name]) else dtb__83)
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing -> ((Vuna_dCompiler_dPackages_dPkg.v_Vuna_dCompiler_dPackages_dPkg_dpackageDir pkg) ^ "/.output")
  | _ -> failwith "DT: impossible branch"
))) (Vuna_dCompiler_dPackages_dPkg.v_Vuna_dCompiler_dPackages_dPkg_dpackageName pkg)))

# 1029 "Vuna/Compiler/Driver/CompilerCli.vuna"
let v_Vuna_dCompiler_dDriver_dCompilerCli_dbuildWasmOne = (fun noCompile outM pkg o -> ((fun outDir -> ((fun watPath -> ((fun wasmPath -> ((fun script -> ((fun args -> (((Base_dMonad.v_Base_dMonad_dbind Base_dEff.v_Monad_uBase_uEff_uEff_ur) ((((Vuna_dCompiler_dDriver_dWasm.v_Vuna_dCompiler_dDriver_dWasm_dcompileWasm ((Vuna_dCompiler_dPackages_dPkg.v_Vuna_dCompiler_dPackages_dPkg_dcontextWithRelease (o).f_Vuna_dCompiler_dDriver_dCompilerCli_dCliOpts_optRelease) (Vuna_dCompiler_dPackages_dPkg.v_Vuna_dCompiler_dPackages_dPkg_dpackageContext pkg))) (Vuna_dCompiler_dPackages_dPkg.v_Vuna_dCompiler_dPackages_dPkg_dpackageEntry pkg)) true) outDir)) (fun r -> (match r with
  | Vuna_dCompiler_dDiag.C_Vuna_dCompiler_dDiag_dCheck_ErrC (dtb__84) -> ((v_Vuna_dCompiler_dDriver_dCompilerCli_dprintDiag o) dtb__84)
  | Vuna_dCompiler_dDiag.C_Vuna_dCompiler_dDiag_dCheck_OkC (dtb__85) -> (((Base_dMonad.v_Base_dMonad_dbind Base_dEff.v_Monad_uBase_uEff_uEff_ur) ((Base_dHostRow.v_Base_dHostRow_draiseToRow Base_dHostRow.v_Base_dHostRow_dhostRow) (((fun dtio_0 dtio_1 -> Base_dEff.C_Base_dEff_dEff_MkEff (fun (_ : Base_dEff.t_Base_dEff_dEffUnit) -> dtp_writeFile dtio_0 dtio_1)) (outDir ^ "/build.sh")) script))) (fun _u -> (if noCompile then (((Base_dMonad.v_Base_dMonad_dbind Base_dEff.v_Monad_uBase_uEff_uEff_ur) ((Base_dHostRow.v_Base_dHostRow_draiseToRow Base_dHostRow.v_Base_dHostRow_dhostRow) ((fun dtio_0 -> Base_dEff.C_Base_dEff_dEff_MkEff (fun (_ : Base_dEff.t_Base_dEff_dEffUnit) -> dtp_print dtio_0)) (String.concat "" ["wrote "; watPath; "\n"])))) (fun _u -> ((Base_dApplicative.v_Base_dApplicative_dpure Base_dEff.v_Applicative_uBase_uEff_uEff_ur) { Base_dPair.f_Base_dPair_dPair_first = 0; Base_dPair.f_Base_dPair_dPair_second = o }))) else (((Base_dMonad.v_Base_dMonad_dbind Base_dEff.v_Monad_uBase_uEff_uEff_ur) ((Base_dHostRow.v_Base_dHostRow_draiseToRow Base_dHostRow.v_Base_dHostRow_dhostRow) (((fun dtio_0 dtio_1 -> Base_dEff.C_Base_dEff_dEff_MkEff (fun (_ : Base_dEff.t_Base_dEff_dEffUnit) -> (fun dir args -> dtp_runIn dir (Base_dList.dtp_ocamlOf args)) dtio_0 dtio_1)) outDir) args))) (fun code -> (if (code = 0) then (((Base_dMonad.v_Base_dMonad_dbind Base_dEff.v_Monad_uBase_uEff_uEff_ur) ((Base_dHostRow.v_Base_dHostRow_draiseToRow Base_dHostRow.v_Base_dHostRow_dhostRow) ((fun dtio_0 -> Base_dEff.C_Base_dEff_dEff_MkEff (fun (_ : Base_dEff.t_Base_dEff_dEffUnit) -> dtp_print dtio_0)) (String.concat "" ["wrote "; wasmPath; "\n"])))) (fun _u -> ((Base_dApplicative.v_Base_dApplicative_dpure Base_dEff.v_Applicative_uBase_uEff_uEff_ur) { Base_dPair.f_Base_dPair_dPair_first = 0; Base_dPair.f_Base_dPair_dPair_second = o }))) else (((Base_dMonad.v_Base_dMonad_dbind Base_dEff.v_Monad_uBase_uEff_uEff_ur) ((Base_dHostRow.v_Base_dHostRow_draiseToRow Base_dHostRow.v_Base_dHostRow_dhostRow) ((fun dtio_0 -> Base_dEff.C_Base_dEff_dEff_MkEff (fun (_ : Base_dEff.t_Base_dEff_dEffUnit) -> dtp_print dtio_0)) (String.concat "" ["wasm assembly failed: wasm-tools exited "; (bi_strFromInt code); "\n"])))) (fun _u -> ((Base_dApplicative.v_Base_dApplicative_dpure Base_dEff.v_Applicative_uBase_uEff_uEff_ur) { Base_dPair.f_Base_dPair_dPair_first = 1; Base_dPair.f_Base_dPair_dPair_second = o })))))))))
  | _ -> failwith "DT: impossible branch"
)))) (Base_dList.C_Base_dList_dList_Cons ("wasm-tools", (Base_dList.C_Base_dList_dList_Cons ("parse", (Base_dList.C_Base_dList_dList_Cons ("main.wat", (Base_dList.C_Base_dList_dList_Cons ("-o", (Base_dList.C_Base_dList_dList_Cons ("main.wasm", Base_dList.C_Base_dList_dList_Nil)))))))))))) "#!/bin/sh\nset -eu\ncd \"$(dirname \"$0\")\"\nwasm-tools parse main.wat -o main.wasm\n")) (outDir ^ "/main.wasm"))) (outDir ^ "/main.wat"))) (match outM with
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Just (dtb__86) -> dtb__86
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing -> ((Vuna_dCompiler_dPackages_dPkg.v_Vuna_dCompiler_dPackages_dPkg_dpackageDir pkg) ^ "/.output")
  | _ -> failwith "DT: impossible branch"
)))

# 1160 "Vuna/Compiler/Driver/CompilerCli.vuna"
let rec v_Vuna_dCompiler_dDriver_dCompilerCli_dwaitView = (fun kind digest fuel -> (((Base_dMonad.v_Base_dMonad_dbind Base_dEff.v_Monad_uBase_uEff_uEff_ur) ((Vuna_dCompiler_dStore.v_Vuna_dCompiler_dStore_dstoreViewLockEff kind) digest)) (fun ok -> (if ok then ((Base_dApplicative.v_Base_dApplicative_dpure Base_dEff.v_Applicative_uBase_uEff_uEff_ur) "locked") else (((Base_dMonad.v_Base_dMonad_dbind Base_dEff.v_Monad_uBase_uEff_uEff_ur) ((Vuna_dCompiler_dStore.v_Vuna_dCompiler_dStore_dstoreViewValidEff kind) digest)) (fun valid -> (if valid then ((Base_dApplicative.v_Base_dApplicative_dpure Base_dEff.v_Applicative_uBase_uEff_uEff_ur) "ready") else (if (fuel <= 0) then ((Base_dApplicative.v_Base_dApplicative_dpure Base_dEff.v_Applicative_uBase_uEff_uEff_ur) "timeout") else (((Base_dMonad.v_Base_dMonad_dbind Base_dEff.v_Monad_uBase_uEff_uEff_ur) ((Base_dHostRow.v_Base_dHostRow_draiseToRow Base_dHostRow.v_Base_dHostRow_dhostRow) ((fun dtio_0 -> Base_dEff.C_Base_dEff_dEff_MkEff (fun (_ : Base_dEff.t_Base_dEff_dEffUnit) -> dtp_sleep dtio_0)) 100000))) (fun _u -> (((v_Vuna_dCompiler_dDriver_dCompilerCli_dwaitView kind) digest) (fuel - 1))))))))))))

# 1172 "Vuna/Compiler/Driver/CompilerCli.vuna"
let v_Vuna_dCompiler_dDriver_dCompilerCli_dmarkViewComplete = (fun dir digest -> ((Base_dHostRow.v_Base_dHostRow_draiseToRow Base_dHostRow.v_Base_dHostRow_dhostRow) (((fun dtio_0 dtio_1 -> Base_dEff.C_Base_dEff_dEff_MkEff (fun (_ : Base_dEff.t_Base_dEff_dEffUnit) -> dtp_writeFileAtomic dtio_0 dtio_1)) (dir ^ "/.complete")) digest)))

# 1179 "Vuna/Compiler/Driver/CompilerCli.vuna"
let v_Vuna_dCompiler_dDriver_dCompilerCli_dlinkDefaultOutput = (fun mc0 mc1 mc2 mc3 -> (match mc0 with
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing -> ((fun link -> (((Base_dMonad.v_Base_dMonad_dbind Base_dEff.v_Monad_uBase_uEff_uEff_ur) ((Base_dHostRow.v_Base_dHostRow_draiseToRow Base_dHostRow.v_Base_dHostRow_dhostRow) (((fun dtio_0 dtio_1 -> Base_dEff.C_Base_dEff_dEff_MkEff (fun (_ : Base_dEff.t_Base_dEff_dEffUnit) -> (fun dir args -> dtp_runIn dir (Base_dList.dtp_ocamlOf args)) dtio_0 dtio_1)) ".") (Base_dList.C_Base_dList_dList_Cons ("rm", (Base_dList.C_Base_dList_dList_Cons ("-rf", (Base_dList.C_Base_dList_dList_Cons (link, Base_dList.C_Base_dList_dList_Nil))))))))) (fun _u -> (((fun dtio_0 dtio_1 -> Base_dEff.C_Base_dEff_dEff_MkEff (fun (_ : Base_dEff.t_Base_dEff_dEffUnit) -> (fun dir args -> dtp_runIn dir (Base_dList.dtp_ocamlOf args)) dtio_0 dtio_1)) ".") (Base_dList.C_Base_dList_dList_Cons ("ln", (Base_dList.C_Base_dList_dList_Cons ("-s", (Base_dList.C_Base_dList_dList_Cons (mc2, (Base_dList.C_Base_dList_dList_Cons (link, Base_dList.C_Base_dList_dList_Nil)))))))))))) ((Vuna_dCompiler_dPackages_dPkg.v_Vuna_dCompiler_dPackages_dPkg_dpackageDir mc1) ^ "/.output"))
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Just (dtb__87) -> ((Base_dApplicative.v_Base_dApplicative_dpure Base_dEff.v_Applicative_uBase_uEff_uEff_ur) 0)
  | _ -> failwith "DT: impossible branch"
))

# 1188 "Vuna/Compiler/Driver/CompilerCli.vuna"
let v_Vuna_dCompiler_dDriver_dCompilerCli_dcompileCodegen = (fun ctx entry outDir o -> (((Base_dMonad.v_Base_dMonad_dbind Base_dEff.v_Monad_uBase_uEff_uEff_ur) ((((Vuna_dCompiler_dDriver_dCompile.v_Vuna_dCompiler_dDriver_dCompile_dcompileToDir ctx) entry) true) outDir)) (fun r -> (match r with
  | Vuna_dCompiler_dDiag.C_Vuna_dCompiler_dDiag_dCheck_ErrC (dtb__88) -> ((v_Vuna_dCompiler_dDriver_dCompilerCli_dprintDiag o) dtb__88)
  | Vuna_dCompiler_dDiag.C_Vuna_dCompiler_dDiag_dCheck_OkC (dtb__89) -> ((Base_dApplicative.v_Base_dApplicative_dpure Base_dEff.v_Applicative_uBase_uEff_uEff_ur) { Base_dPair.f_Base_dPair_dPair_first = 0; Base_dPair.f_Base_dPair_dPair_second = o })
  | _ -> failwith "DT: impossible branch"
))))

# 1197 "Vuna/Compiler/Driver/CompilerCli.vuna"
let v_Vuna_dCompiler_dDriver_dCompilerCli_dbuildLinked = (fun ctx entry outDir name o -> (((Base_dMonad.v_Base_dMonad_dbind Base_dEff.v_Monad_uBase_uEff_uEff_ur) (Vuna_dCompiler_dDriver_dCompile.v_Vuna_dCompiler_dDriver_dCompile_densureDirPath (outDir ^ "/bin"))) (fun _u -> (((Base_dMonad.v_Base_dMonad_dbind Base_dEff.v_Monad_uBase_uEff_uEff_ur) (((Vuna_dCompiler_dDriver_dCompile.v_Vuna_dCompiler_dDriver_dCompile_drunBuildScript outDir) ("bin/" ^ name)) name)) (fun r -> (match r with
  | Vuna_dCompiler_dDiag.C_Vuna_dCompiler_dDiag_dCheck_ErrC (dtb__90) -> ((v_Vuna_dCompiler_dDriver_dCompilerCli_dprintDiag o) dtb__90)
  | Vuna_dCompiler_dDiag.C_Vuna_dCompiler_dDiag_dCheck_OkC (dtb__91) -> (((Base_dMonad.v_Base_dMonad_dbind Base_dEff.v_Monad_uBase_uEff_uEff_ur) ((((Vuna_dCompiler_dDriver_dCompile.v_Vuna_dCompiler_dDriver_dCompile_dwriteBuildMeta outDir) ctx) entry) true)) (fun _u -> (((Base_dMonad.v_Base_dMonad_dbind Base_dEff.v_Monad_uBase_uEff_uEff_ur) ((Base_dHostRow.v_Base_dHostRow_draiseToRow Base_dHostRow.v_Base_dHostRow_dhostRow) ((fun dtio_0 -> Base_dEff.C_Base_dEff_dEff_MkEff (fun (_ : Base_dEff.t_Base_dEff_dEffUnit) -> dtp_print dtio_0)) (String.concat "" ["built "; outDir; "/bin/"; name; "\n"])))) (fun _u -> ((Base_dApplicative.v_Base_dApplicative_dpure Base_dEff.v_Applicative_uBase_uEff_uEff_ur) { Base_dPair.f_Base_dPair_dPair_first = 0; Base_dPair.f_Base_dPair_dPair_second = o })))))
  | _ -> failwith "DT: impossible branch"
))))))

# 1091 "Vuna/Compiler/Driver/CompilerCli.vuna"
let v_Vuna_dCompiler_dDriver_dCompilerCli_dbuildExplicit = (fun out multiOut pkg ctx entry o -> ((fun name -> ((fun outDir -> ((fun binPath -> (((Base_dMonad.v_Base_dMonad_dbind Base_dEff.v_Monad_uBase_uEff_uEff_ur) ((((Vuna_dCompiler_dDriver_dCompile.v_Vuna_dCompiler_dDriver_dCompile_dmetaUpToDate outDir) ctx) entry) binPath)) (fun fresh -> (if fresh then (((Base_dMonad.v_Base_dMonad_dbind Base_dEff.v_Monad_uBase_uEff_uEff_ur) ((Base_dHostRow.v_Base_dHostRow_draiseToRow Base_dHostRow.v_Base_dHostRow_dhostRow) ((fun dtio_0 -> Base_dEff.C_Base_dEff_dEff_MkEff (fun (_ : Base_dEff.t_Base_dEff_dEffUnit) -> dtp_print dtio_0)) (String.concat "" ["up to date: "; binPath; "\n"])))) (fun _u -> ((Base_dApplicative.v_Base_dApplicative_dpure Base_dEff.v_Applicative_uBase_uEff_uEff_ur) { Base_dPair.f_Base_dPair_dPair_first = 0; Base_dPair.f_Base_dPair_dPair_second = o }))) else (((Base_dMonad.v_Base_dMonad_dbind Base_dEff.v_Monad_uBase_uEff_uEff_ur) ((((Vuna_dCompiler_dDriver_dCompile.v_Vuna_dCompiler_dDriver_dCompile_dcompileToDir ctx) entry) true) outDir)) (fun r -> (match r with
  | Vuna_dCompiler_dDiag.C_Vuna_dCompiler_dDiag_dCheck_ErrC (dtb__92) -> ((v_Vuna_dCompiler_dDriver_dCompilerCli_dprintDiag o) dtb__92)
  | Vuna_dCompiler_dDiag.C_Vuna_dCompiler_dDiag_dCheck_OkC (dtb__93) -> (((((v_Vuna_dCompiler_dDriver_dCompilerCli_dbuildLinked ctx) entry) outDir) name) o)
  | _ -> failwith "DT: impossible branch"
))))))) (String.concat "" [outDir; "/bin/"; name]))) (if multiOut then (String.concat "" [out; "/"; name]) else out))) (Vuna_dCompiler_dPackages_dPkg.v_Vuna_dCompiler_dPackages_dPkg_dpackageName pkg)))

# 1110 "Vuna/Compiler/Driver/CompilerCli.vuna"
let v_Vuna_dCompiler_dDriver_dCompilerCli_dbuildDefaultView = (fun ctx pkg name entry viewDigest o -> (((Base_dMonad.v_Base_dMonad_dbind Base_dEff.v_Monad_uBase_uEff_uEff_ur) ((Vuna_dCompiler_dStore.v_Vuna_dCompiler_dStore_dstoreViewPathEff "bin") viewDigest)) (fun view -> ((fun binPath -> (((Base_dMonad.v_Base_dMonad_dbind Base_dEff.v_Monad_uBase_uEff_uEff_ur) ((Vuna_dCompiler_dStore.v_Vuna_dCompiler_dStore_dstoreViewValidEff "bin") viewDigest)) (fun valid -> (((Base_dMonad.v_Base_dMonad_dbind Base_dEff.v_Monad_uBase_uEff_uEff_ur) (if valid then ((((Vuna_dCompiler_dDriver_dCompile.v_Vuna_dCompiler_dDriver_dCompile_dmetaUpToDate view) ctx) entry) binPath) else ((Base_dApplicative.v_Base_dApplicative_dpure Base_dEff.v_Applicative_uBase_uEff_uEff_ur) false))) (fun fresh -> (if fresh then (((Base_dMonad.v_Base_dMonad_dbind Base_dEff.v_Monad_uBase_uEff_uEff_ur) ((((v_Vuna_dCompiler_dDriver_dCompilerCli_dlinkDefaultOutput Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing) pkg) view) viewDigest)) (fun _u -> (((Base_dMonad.v_Base_dMonad_dbind Base_dEff.v_Monad_uBase_uEff_uEff_ur) ((Base_dHostRow.v_Base_dHostRow_draiseToRow Base_dHostRow.v_Base_dHostRow_dhostRow) ((fun dtio_0 -> Base_dEff.C_Base_dEff_dEff_MkEff (fun (_ : Base_dEff.t_Base_dEff_dEffUnit) -> dtp_print dtio_0)) (String.concat "" ["up to date: "; binPath; "\n"])))) (fun _u -> ((Base_dApplicative.v_Base_dApplicative_dpure Base_dEff.v_Applicative_uBase_uEff_uEff_ur) { Base_dPair.f_Base_dPair_dPair_first = 0; Base_dPair.f_Base_dPair_dPair_second = o }))))) else (((Base_dMonad.v_Base_dMonad_dbind Base_dEff.v_Monad_uBase_uEff_uEff_ur) (((v_Vuna_dCompiler_dDriver_dCompilerCli_dwaitView "bin") viewDigest) 600)) (fun state -> (if (state = "locked") then (((Base_dMonad.v_Base_dMonad_dbind Base_dEff.v_Monad_uBase_uEff_uEff_ur) ((Vuna_dCompiler_dStore.v_Vuna_dCompiler_dStore_dstoreViewValidEff "bin") viewDigest)) (fun valid2 -> (((Base_dMonad.v_Base_dMonad_dbind Base_dEff.v_Monad_uBase_uEff_uEff_ur) (if valid2 then ((((Vuna_dCompiler_dDriver_dCompile.v_Vuna_dCompiler_dDriver_dCompile_dmetaUpToDate view) ctx) entry) binPath) else ((Base_dApplicative.v_Base_dApplicative_dpure Base_dEff.v_Applicative_uBase_uEff_uEff_ur) false))) (fun fresh2 -> (if fresh2 then (((Base_dMonad.v_Base_dMonad_dbind Base_dEff.v_Monad_uBase_uEff_uEff_ur) ((((v_Vuna_dCompiler_dDriver_dCompilerCli_dlinkDefaultOutput Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing) pkg) view) viewDigest)) (fun _u -> (((Base_dMonad.v_Base_dMonad_dbind Base_dEff.v_Monad_uBase_uEff_uEff_ur) ((Vuna_dCompiler_dStore.v_Vuna_dCompiler_dStore_dstoreViewUnlockEff "bin") viewDigest)) (fun _u -> (((Base_dMonad.v_Base_dMonad_dbind Base_dEff.v_Monad_uBase_uEff_uEff_ur) ((Base_dHostRow.v_Base_dHostRow_draiseToRow Base_dHostRow.v_Base_dHostRow_dhostRow) ((fun dtio_0 -> Base_dEff.C_Base_dEff_dEff_MkEff (fun (_ : Base_dEff.t_Base_dEff_dEffUnit) -> dtp_print dtio_0)) (String.concat "" ["up to date: "; binPath; "\n"])))) (fun _u -> ((Base_dApplicative.v_Base_dApplicative_dpure Base_dEff.v_Applicative_uBase_uEff_uEff_ur) { Base_dPair.f_Base_dPair_dPair_first = 0; Base_dPair.f_Base_dPair_dPair_second = o }))))))) else (((Base_dMonad.v_Base_dMonad_dbind Base_dEff.v_Monad_uBase_uEff_uEff_ur) ((((Vuna_dCompiler_dDriver_dCompile.v_Vuna_dCompiler_dDriver_dCompile_dcompileToDir ctx) entry) true) view)) (fun r -> (match r with
  | Vuna_dCompiler_dDiag.C_Vuna_dCompiler_dDiag_dCheck_ErrC (dtb__94) -> (((Base_dMonad.v_Base_dMonad_dbind Base_dEff.v_Monad_uBase_uEff_uEff_ur) ((Base_dHostRow.v_Base_dHostRow_draiseToRow Base_dHostRow.v_Base_dHostRow_dhostRow) (((fun dtio_0 dtio_1 -> Base_dEff.C_Base_dEff_dEff_MkEff (fun (_ : Base_dEff.t_Base_dEff_dEffUnit) -> (fun dir args -> dtp_runIn dir (Base_dList.dtp_ocamlOf args)) dtio_0 dtio_1)) ".") (Base_dList.C_Base_dList_dList_Cons ("rm", (Base_dList.C_Base_dList_dList_Cons ("-rf", (Base_dList.C_Base_dList_dList_Cons (view, Base_dList.C_Base_dList_dList_Nil))))))))) (fun _u -> (((Base_dMonad.v_Base_dMonad_dbind Base_dEff.v_Monad_uBase_uEff_uEff_ur) ((Vuna_dCompiler_dStore.v_Vuna_dCompiler_dStore_dstoreViewUnlockEff "bin") viewDigest)) (fun _u -> ((v_Vuna_dCompiler_dDriver_dCompilerCli_dprintDiag o) dtb__94)))))
  | Vuna_dCompiler_dDiag.C_Vuna_dCompiler_dDiag_dCheck_OkC (dtb__95) -> (((Base_dMonad.v_Base_dMonad_dbind Base_dEff.v_Monad_uBase_uEff_uEff_ur) (((((v_Vuna_dCompiler_dDriver_dCompilerCli_dbuildLinked ctx) entry) view) name) o)) (fun br -> (if ((Base_dPair.v_Base_dPair_dfirstOf br) = 0) then (((Base_dMonad.v_Base_dMonad_dbind Base_dEff.v_Monad_uBase_uEff_uEff_ur) ((v_Vuna_dCompiler_dDriver_dCompilerCli_dmarkViewComplete view) viewDigest)) (fun _u -> (((Base_dMonad.v_Base_dMonad_dbind Base_dEff.v_Monad_uBase_uEff_uEff_ur) ((((v_Vuna_dCompiler_dDriver_dCompilerCli_dlinkDefaultOutput Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing) pkg) view) viewDigest)) (fun _u -> (((Base_dMonad.v_Base_dMonad_dbind Base_dEff.v_Monad_uBase_uEff_uEff_ur) ((Vuna_dCompiler_dStore.v_Vuna_dCompiler_dStore_dstoreViewUnlockEff "bin") viewDigest)) (fun _u -> ((Base_dApplicative.v_Base_dApplicative_dpure Base_dEff.v_Applicative_uBase_uEff_uEff_ur) br))))))) else (((Base_dMonad.v_Base_dMonad_dbind Base_dEff.v_Monad_uBase_uEff_uEff_ur) ((Vuna_dCompiler_dStore.v_Vuna_dCompiler_dStore_dstoreViewUnlockEff "bin") viewDigest)) (fun _u -> ((Base_dApplicative.v_Base_dApplicative_dpure Base_dEff.v_Applicative_uBase_uEff_uEff_ur) br))))))
  | _ -> failwith "DT: impossible branch"
)))))))) else (if (state = "ready") then (((Base_dMonad.v_Base_dMonad_dbind Base_dEff.v_Monad_uBase_uEff_uEff_ur) ((((v_Vuna_dCompiler_dDriver_dCompilerCli_dlinkDefaultOutput Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing) pkg) view) viewDigest)) (fun _u -> (((Base_dMonad.v_Base_dMonad_dbind Base_dEff.v_Monad_uBase_uEff_uEff_ur) ((Base_dHostRow.v_Base_dHostRow_draiseToRow Base_dHostRow.v_Base_dHostRow_dhostRow) ((fun dtio_0 -> Base_dEff.C_Base_dEff_dEff_MkEff (fun (_ : Base_dEff.t_Base_dEff_dEffUnit) -> dtp_print dtio_0)) (String.concat "" ["up to date: "; binPath; "\n"])))) (fun _u -> ((Base_dApplicative.v_Base_dApplicative_dpure Base_dEff.v_Applicative_uBase_uEff_uEff_ur) { Base_dPair.f_Base_dPair_dPair_first = 0; Base_dPair.f_Base_dPair_dPair_second = o }))))) else (((Base_dMonad.v_Base_dMonad_dbind Base_dEff.v_Monad_uBase_uEff_uEff_ur) ((Base_dHostRow.v_Base_dHostRow_draiseToRow Base_dHostRow.v_Base_dHostRow_dhostRow) ((fun dtio_0 -> Base_dEff.C_Base_dEff_dEff_MkEff (fun (_ : Base_dEff.t_Base_dEff_dEffUnit) -> dtp_print dtio_0)) (String.concat "" ["error: timed out waiting for view "; viewDigest; "\n"])))) (fun _u -> ((Base_dApplicative.v_Base_dApplicative_dpure Base_dEff.v_Applicative_uBase_uEff_uEff_ur) { Base_dPair.f_Base_dPair_dPair_first = 1; Base_dPair.f_Base_dPair_dPair_second = o }))))))))))))) (String.concat "" [view; "/bin/"; name])))))

# 1062 "Vuna/Compiler/Driver/CompilerCli.vuna"
let v_Vuna_dCompiler_dDriver_dCompilerCli_dbuildOne = (fun noCompile multiOut outM pkg o -> (if ((o).f_Vuna_dCompiler_dDriver_dCompilerCli_dCliOpts_optTarget = "wasm") then ((((v_Vuna_dCompiler_dDriver_dCompilerCli_dbuildWasmOne noCompile) outM) pkg) o) else (if ((o).f_Vuna_dCompiler_dDriver_dCompilerCli_dCliOpts_optTarget = "native") then (((((v_Vuna_dCompiler_dDriver_dCompilerCli_dbuildNativeOne noCompile) multiOut) outM) pkg) o) else ((fun name -> ((fun entry -> (((Base_dMonad.v_Base_dMonad_dbind Base_dEff.v_Monad_uBase_uEff_uEff_ur) ((Base_dHostRow.v_Base_dHostRow_draiseToRow Base_dHostRow.v_Base_dHostRow_dhostRow) ((fun dtio_0 -> Base_dEff.C_Base_dEff_dEff_MkEff (fun (_ : Base_dEff.t_Base_dEff_dEffUnit) -> dtp_fileExists dtio_0)) entry))) (fun exists -> (if exists then ((fun ctx -> (if noCompile then (match outM with
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Just (dtb__96) -> ((((v_Vuna_dCompiler_dDriver_dCompilerCli_dcompileCodegen ctx) entry) (if multiOut then (String.concat "" [dtb__96; "/"; name]) else dtb__96)) o)
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing -> ((((v_Vuna_dCompiler_dDriver_dCompilerCli_dcompileCodegen ctx) entry) ((Vuna_dCompiler_dPackages_dPkg.v_Vuna_dCompiler_dPackages_dPkg_dpackageDir pkg) ^ "/.output")) o)
  | _ -> failwith "DT: impossible branch"
) else (match outM with
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Just (dtb__97) -> ((((((v_Vuna_dCompiler_dDriver_dCompilerCli_dbuildExplicit dtb__97) multiOut) pkg) ctx) entry) o)
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing -> (((Base_dMonad.v_Base_dMonad_dbind Base_dEff.v_Monad_uBase_uEff_uEff_ur) (((Vuna_dCompiler_dDriver_dCompile.v_Vuna_dCompiler_dDriver_dCompile_dbuildViewAddrOf ctx) entry) true)) (fun viewDigest -> ((((((v_Vuna_dCompiler_dDriver_dCompilerCli_dbuildDefaultView ctx) pkg) name) entry) viewDigest) o)))
  | _ -> failwith "DT: impossible branch"
))) ((Vuna_dCompiler_dPackages_dPkg.v_Vuna_dCompiler_dPackages_dPkg_dcontextWithRelease (o).f_Vuna_dCompiler_dDriver_dCompilerCli_dCliOpts_optRelease) (Vuna_dCompiler_dPackages_dPkg.v_Vuna_dCompiler_dPackages_dPkg_dpackageContext pkg))) else (((Base_dMonad.v_Base_dMonad_dbind Base_dEff.v_Monad_uBase_uEff_uEff_ur) (((Vuna_dCompiler_dDriver_dCompile.v_Vuna_dCompiler_dDriver_dCompile_dcheckPackage (o).f_Vuna_dCompiler_dDriver_dCompilerCli_dCliOpts_optRelease) false) pkg)) (fun r -> (match r with
  | Vuna_dCompiler_dDiag.C_Vuna_dCompiler_dDiag_dCheck_ErrC (dtb__98) -> ((v_Vuna_dCompiler_dDriver_dCompilerCli_dprintDiag o) dtb__98)
  | Vuna_dCompiler_dDiag.C_Vuna_dCompiler_dDiag_dCheck_OkC (dtb__99) -> (((Base_dMonad.v_Base_dMonad_dbind Base_dEff.v_Monad_uBase_uEff_uEff_ur) ((Base_dHostRow.v_Base_dHostRow_draiseToRow Base_dHostRow.v_Base_dHostRow_dhostRow) ((fun dtio_0 -> Base_dEff.C_Base_dEff_dEff_MkEff (fun (_ : Base_dEff.t_Base_dEff_dEffUnit) -> dtp_print dtio_0)) (String.concat "" ["skipped (library): "; name; "\n"])))) (fun _u -> ((Base_dApplicative.v_Base_dApplicative_dpure Base_dEff.v_Applicative_uBase_uEff_uEff_ur) { Base_dPair.f_Base_dPair_dPair_first = 0; Base_dPair.f_Base_dPair_dPair_second = o })))
  | _ -> failwith "DT: impossible branch"
))))))) (Vuna_dCompiler_dPackages_dPkg.v_Vuna_dCompiler_dPackages_dPkg_dpackageEntry pkg))) (Vuna_dCompiler_dPackages_dPkg.v_Vuna_dCompiler_dPackages_dPkg_dpackageName pkg)))))

# 981 "Vuna/Compiler/Driver/CompilerCli.vuna"
let rec v_Vuna_dCompiler_dDriver_dCompilerCli_dbuildTargets = (fun mc0 mc1 mc2 mc3 mc4 mc5 -> (match mc3 with
  | Base_dList.C_Base_dList_dList_Cons (dtb__100, dtb__101) -> (((Base_dMonad.v_Base_dMonad_dbind Base_dEff.v_Monad_uBase_uEff_uEff_ur) (((((v_Vuna_dCompiler_dDriver_dCompilerCli_dbuildOne mc0) mc1) mc2) dtb__100) mc5)) (fun r -> ((fun next -> ((((((v_Vuna_dCompiler_dDriver_dCompilerCli_dbuildTargets mc0) mc1) mc2) dtb__101) next) (Base_dPair.v_Base_dPair_dsecondOf r))) (if ((Base_dPair.v_Base_dPair_dfirstOf r) > mc4) then (Base_dPair.v_Base_dPair_dfirstOf r) else mc4))))
  | Base_dList.C_Base_dList_dList_Nil -> ((Base_dApplicative.v_Base_dApplicative_dpure Base_dEff.v_Applicative_uBase_uEff_uEff_ur) { Base_dPair.f_Base_dPair_dPair_first = mc4; Base_dPair.f_Base_dPair_dPair_second = mc5 })
  | _ -> failwith "DT: impossible branch"
))

# 944 "Vuna/Compiler/Driver/CompilerCli.vuna"
let v_Vuna_dCompiler_dDriver_dCompilerCli_dbuildRun = (fun noCompile dir outM pkgM o -> (((Base_dMonad.v_Base_dMonad_dbind Base_dEff.v_Monad_uBase_uEff_uEff_ur) (Vuna_dCompiler_dPackages_dPkg.v_Vuna_dCompiler_dPackages_dPkg_dworkspacePackages dir)) (fun pkgsR -> (match pkgsR with
  | Vuna_dCompiler_dDiag.C_Vuna_dCompiler_dDiag_dCheck_ErrC (dtb__102) -> ((v_Vuna_dCompiler_dDriver_dCompilerCli_dprintDiag o) dtb__102)
  | Vuna_dCompiler_dDiag.C_Vuna_dCompiler_dDiag_dCheck_OkC (dtb__103) -> (((Base_dMonad.v_Base_dMonad_dbind Base_dEff.v_Monad_uBase_uEff_uEff_ur) (v_Vuna_dCompiler_dDriver_dCompilerCli_disSingleLibraryPackage dtb__103)) (fun libOnly -> (if libOnly then ((v_Vuna_dCompiler_dDriver_dCompilerCli_dwithOpts o) (v_Vuna_dCompiler_dDriver_dCompilerCli_dprintErr (v_Vuna_dCompiler_dDriver_dCompilerCli_dlibraryOnlyMessage dtb__103))) else (match ((v_Vuna_dCompiler_dDriver_dCompilerCli_dselectBuildTargets pkgM) dtb__103) with
  | Vuna_dCompiler_dDiag.C_Vuna_dCompiler_dDiag_dCheck_ErrC (dtb__104) -> ((v_Vuna_dCompiler_dDriver_dCompilerCli_dprintDiag o) dtb__104)
  | Vuna_dCompiler_dDiag.C_Vuna_dCompiler_dDiag_dCheck_OkC (dtb__105) -> ((((((v_Vuna_dCompiler_dDriver_dCompilerCli_dbuildTargets noCompile) ((Base_dList.v_Base_dList_dlength dtb__103) > 1)) outM) dtb__105) 0) o)
  | _ -> failwith "DT: impossible branch"
))))
  | _ -> failwith "DT: impossible branch"
))))

# 919 "Vuna/Compiler/Driver/CompilerCli.vuna"
let rec v_Vuna_dCompiler_dDriver_dCompilerCli_dbuildParse = (fun prog noCompile out dir pkg args o -> ((fun nd_uscrut7 -> (match nd_uscrut7 with
  | Base_dList.C_Base_dList_dList_Cons (dtb__106, dtb__107) -> (if (dtb__106 = "--no-compile") then (((((((v_Vuna_dCompiler_dDriver_dCompilerCli_dbuildParse prog) true) out) dir) pkg) dtb__107) o) else (if (dtb__106 = "--release") then (((((((v_Vuna_dCompiler_dDriver_dCompilerCli_dbuildParse prog) noCompile) out) dir) pkg) dtb__107) (v_Vuna_dCompiler_dDriver_dCompilerCli_dmarkRelease o)) else (if (dtb__106 = "--target") then (match dtb__107 with
  | Base_dList.C_Base_dList_dList_Cons (dtb__108, dtb__109) -> (if (v_Vuna_dCompiler_dDriver_dCompilerCli_disKnownTarget dtb__108) then (((((((v_Vuna_dCompiler_dDriver_dCompilerCli_dbuildParse prog) noCompile) out) dir) pkg) dtb__109) ((v_Vuna_dCompiler_dDriver_dCompilerCli_dmarkTarget dtb__108) o)) else ((v_Vuna_dCompiler_dDriver_dCompilerCli_dwithOpts o) (v_Vuna_dCompiler_dDriver_dCompilerCli_dusageErr prog)))
  | _ -> (if ((Base_dString.v_Base_dString_dstartsWith "-") dtb__106) then ((v_Vuna_dCompiler_dDriver_dCompilerCli_dwithOpts o) ((v_Vuna_dCompiler_dDriver_dCompilerCli_dremovedFlag prog) dtb__106)) else (match dir with
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing -> (((((((v_Vuna_dCompiler_dDriver_dCompilerCli_dbuildParse prog) noCompile) out) (Base_dMaybe.C_Base_dMaybe_dMaybe_Just (dtb__106))) pkg) dtb__107) o)
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Just (dtb__110) -> ((v_Vuna_dCompiler_dDriver_dCompilerCli_dwithOpts o) (v_Vuna_dCompiler_dDriver_dCompilerCli_dusageErr prog))
  | _ -> failwith "DT: impossible branch"
))
) else (if (dtb__106 = "--out") then (match dtb__107 with
  | Base_dList.C_Base_dList_dList_Cons (dtb__111, dtb__112) -> (if ((Base_dString.v_Base_dString_dstartsWith "-") dtb__111) then ((v_Vuna_dCompiler_dDriver_dCompilerCli_dwithOpts o) ((v_Vuna_dCompiler_dDriver_dCompilerCli_dremovedFlag prog) dtb__111)) else (match out with
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing -> (((((((v_Vuna_dCompiler_dDriver_dCompilerCli_dbuildParse prog) noCompile) (Base_dMaybe.C_Base_dMaybe_dMaybe_Just (dtb__111))) dir) pkg) dtb__112) o)
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Just (dtb__113) -> ((v_Vuna_dCompiler_dDriver_dCompilerCli_dwithOpts o) (v_Vuna_dCompiler_dDriver_dCompilerCli_dusageErr prog))
  | _ -> failwith "DT: impossible branch"
))
  | Base_dList.C_Base_dList_dList_Nil -> ((v_Vuna_dCompiler_dDriver_dCompilerCli_dwithOpts o) (v_Vuna_dCompiler_dDriver_dCompilerCli_dusageErr prog))
  | _ -> failwith "DT: impossible branch"
) else (if (dtb__106 = "--package") then (match dtb__107 with
  | Base_dList.C_Base_dList_dList_Cons (dtb__114, dtb__115) -> (if ((Base_dString.v_Base_dString_dstartsWith "-") dtb__114) then ((v_Vuna_dCompiler_dDriver_dCompilerCli_dwithOpts o) ((v_Vuna_dCompiler_dDriver_dCompilerCli_dremovedFlag prog) dtb__114)) else (match pkg with
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing -> (((((((v_Vuna_dCompiler_dDriver_dCompilerCli_dbuildParse prog) noCompile) out) dir) (Base_dMaybe.C_Base_dMaybe_dMaybe_Just (dtb__114))) dtb__115) o)
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Just (dtb__116) -> ((v_Vuna_dCompiler_dDriver_dCompilerCli_dwithOpts o) (v_Vuna_dCompiler_dDriver_dCompilerCli_dusageErr prog))
  | _ -> failwith "DT: impossible branch"
))
  | Base_dList.C_Base_dList_dList_Nil -> ((v_Vuna_dCompiler_dDriver_dCompilerCli_dwithOpts o) (v_Vuna_dCompiler_dDriver_dCompilerCli_dusageErr prog))
  | _ -> failwith "DT: impossible branch"
) else (if ((Base_dString.v_Base_dString_dstartsWith "-") dtb__106) then ((v_Vuna_dCompiler_dDriver_dCompilerCli_dwithOpts o) ((v_Vuna_dCompiler_dDriver_dCompilerCli_dremovedFlag prog) dtb__106)) else (match dir with
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing -> (((((((v_Vuna_dCompiler_dDriver_dCompilerCli_dbuildParse prog) noCompile) out) (Base_dMaybe.C_Base_dMaybe_dMaybe_Just (dtb__106))) pkg) dtb__107) o)
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Just (dtb__117) -> ((v_Vuna_dCompiler_dDriver_dCompilerCli_dwithOpts o) (v_Vuna_dCompiler_dDriver_dCompilerCli_dusageErr prog))
  | _ -> failwith "DT: impossible branch"
)))))))
  | Base_dList.C_Base_dList_dList_Nil -> (((((v_Vuna_dCompiler_dDriver_dCompilerCli_dbuildRun noCompile) (v_Vuna_dCompiler_dDriver_dCompilerCli_ddefaultDir dir)) out) pkg) o)
  | _ -> failwith "DT: impossible branch"
)) args))

# 916 "Vuna/Compiler/Driver/CompilerCli.vuna"
let v_Vuna_dCompiler_dDriver_dCompilerCli_dbuildArgs = (fun prog args o -> (((((((v_Vuna_dCompiler_dDriver_dCompilerCli_dbuildParse prog) false) Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing) Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing) Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing) args) o))

# 1212 "Vuna/Compiler/Driver/CompilerCli.vuna"
let v_Vuna_dCompiler_dDriver_dCompilerCli_dstripDotSlash = (fun s -> (if ((Base_dString.v_Base_dString_dstartsWith "./") s) then (((Base_dString.v_Base_dString_dsubstring (bi_natFromInt 2)) (bi_natFromInt ((bi_strLength s) - 2))) s) else s))

# 862 "Vuna/Compiler/Driver/CompilerCli.vuna"
let v_Vuna_dCompiler_dDriver_dCompilerCli_disPackageEntryPath = (fun ctx path -> (match (Vuna_dCompiler_dPackages_dPkg.v_Vuna_dCompiler_dPackages_dPkg_dcontextPackageOf ctx) with
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing -> ((Base_dApplicative.v_Base_dApplicative_dpure Base_dEff.v_Applicative_uBase_uEff_uEff_ur) false)
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Just (dtb__118) -> (((Base_dMonad.v_Base_dMonad_dbind Base_dEff.v_Monad_uBase_uEff_uEff_ur) (Vuna_dCompiler_dPackages_dPkg.v_Vuna_dCompiler_dPackages_dPkg_dabsolutePath path)) (fun abs -> ((Base_dApplicative.v_Base_dApplicative_dpure Base_dEff.v_Applicative_uBase_uEff_uEff_ur) ((v_Vuna_dCompiler_dDriver_dCompilerCli_dstripDotSlash abs) = (v_Vuna_dCompiler_dDriver_dCompilerCli_dstripDotSlash (Vuna_dCompiler_dPackages_dPkg.v_Vuna_dCompiler_dPackages_dPkg_dpackageEntry dtb__118))))))
  | _ -> failwith "DT: impossible branch"
))

# 857 "Vuna/Compiler/Driver/CompilerCli.vuna"
let v_Vuna_dCompiler_dDriver_dCompilerCli_disModuleFileEntry = (fun ctx path -> (((Base_dMonad.v_Base_dMonad_dbind Base_dEff.v_Monad_uBase_uEff_uEff_ur) ((v_Vuna_dCompiler_dDriver_dCompilerCli_disPackageEntryPath ctx) path)) (fun pkgEntry -> (if pkgEntry then ((Base_dApplicative.v_Base_dApplicative_dpure Base_dEff.v_Applicative_uBase_uEff_uEff_ur) false) else (Vuna_dCompiler_dDriver_dDt.v_Vuna_dCompiler_dDriver_dDt_ddtFileHasModuleHeader path)))))

# 1217 "Vuna/Compiler/Driver/CompilerCli.vuna"
let v_Vuna_dCompiler_dDriver_dCompilerCli_downedByFile = (fun path d -> ((v_Vuna_dCompiler_dDriver_dCompilerCli_dstripDotSlash (Vuna_dCompiler_dDiag.v_Vuna_dCompiler_dDiag_ddiagFileOf d)) = (v_Vuna_dCompiler_dDriver_dCompilerCli_dstripDotSlash path)))

# 871 "Vuna/Compiler/Driver/CompilerCli.vuna"
let v_Vuna_dCompiler_dDriver_dCompilerCli_dcheckModuleFileEntry = (fun ctx path o -> (((Base_dMonad.v_Base_dMonad_dbind Base_dEff.v_Monad_uBase_uEff_uEff_ur) ((Vuna_dCompiler_dDriver_dDt.v_Vuna_dCompiler_dDriver_dDt_ddtCheckModuleFile ctx) path)) (fun checked -> (match checked with
  | Vuna_dCompiler_dDiag.C_Vuna_dCompiler_dDiag_dCheck_ErrC (dtb__119) -> ((v_Vuna_dCompiler_dDriver_dCompilerCli_dprintDiag o) dtb__119)
  | Vuna_dCompiler_dDiag.C_Vuna_dCompiler_dDiag_dCheck_OkC (dtb__120) -> ((fun ws -> ((fun shown -> (((Base_dMonad.v_Base_dMonad_dbind Base_dEff.v_Monad_uBase_uEff_uEff_ur) (((v_Vuna_dCompiler_dDriver_dCompilerCli_dprintDiagList o) "") shown)) (fun r -> ((Base_dApplicative.v_Base_dApplicative_dpure Base_dEff.v_Applicative_uBase_uEff_uEff_ur) { Base_dPair.f_Base_dPair_dPair_first = (if (if (o).f_Vuna_dCompiler_dDriver_dCompilerCli_dCliOpts_optDenyWarnings then ((Base_dList.v_Base_dList_dlength ws) > 0) else false) then 1 else 0); Base_dPair.f_Base_dPair_dPair_second = (Base_dPair.v_Base_dPair_dsecondOf r) })))) (if (if (o).f_Vuna_dCompiler_dDriver_dCompilerCli_dCliOpts_optShowWarnings then true else (o).f_Vuna_dCompiler_dDriver_dCompilerCli_dCliOpts_optDenyWarnings) then ws else Base_dList.C_Base_dList_dList_Nil))) ((Base_dList.v_Base_dList_dfilter (v_Vuna_dCompiler_dDriver_dCompilerCli_downedByFile path)) (Vuna_dCompiler_dDiagnostics_dSink.v_Vuna_dCompiler_dDiagnostics_dSink_ddedupeWarnings dtb__120)))
  | _ -> failwith "DT: impossible branch"
))))

# 885 "Vuna/Compiler/Driver/CompilerCli.vuna"
let v_Vuna_dCompiler_dDriver_dCompilerCli_dcheckEntryFile = (fun ctx path o -> (((Base_dMonad.v_Base_dMonad_dbind Base_dEff.v_Monad_uBase_uEff_uEff_ur) ((Vuna_dCompiler_dDriver_dDt.v_Vuna_dCompiler_dDriver_dDt_ddtCheck ctx) path)) (fun checked -> (match checked with
  | Vuna_dCompiler_dDiag.C_Vuna_dCompiler_dDiag_dCheck_ErrC (dtb__121) -> (if (o).f_Vuna_dCompiler_dDriver_dCompilerCli_dCliOpts_optContinueOnError then (((Base_dMonad.v_Base_dMonad_dbind Base_dEff.v_Monad_uBase_uEff_uEff_ur) ((Vuna_dCompiler_dDriver_dDt.v_Vuna_dCompiler_dDriver_dDt_ddtCheckRecovering ctx) path)) (fun recovered -> (match recovered with
  | Vuna_dCompiler_dDiag.C_Vuna_dCompiler_dDiag_dCheck_OkC (dtb__122) -> ((fun shown -> (((Base_dMonad.v_Base_dMonad_dbind Base_dEff.v_Monad_uBase_uEff_uEff_ur) (((v_Vuna_dCompiler_dDriver_dCompilerCli_dprintDiagList o) "") shown)) (fun r -> (if ((Base_dList.v_Base_dList_dlength shown) = 0) then ((v_Vuna_dCompiler_dDriver_dCompilerCli_dprintDiag (Base_dPair.v_Base_dPair_dsecondOf r)) dtb__121) else ((Base_dApplicative.v_Base_dApplicative_dpure Base_dEff.v_Applicative_uBase_uEff_uEff_ur) { Base_dPair.f_Base_dPair_dPair_first = 1; Base_dPair.f_Base_dPair_dPair_second = (Base_dPair.v_Base_dPair_dsecondOf r) }))))) ((v_Vuna_dCompiler_dDriver_dCompilerCli_dtakeDiags (o).f_Vuna_dCompiler_dDriver_dCompilerCli_dCliOpts_optMaxErrors) dtb__122))
  | Vuna_dCompiler_dDiag.C_Vuna_dCompiler_dDiag_dCheck_ErrC (dtb__123) -> ((v_Vuna_dCompiler_dDriver_dCompilerCli_dprintDiag o) dtb__121)
  | _ -> failwith "DT: impossible branch"
))) else ((v_Vuna_dCompiler_dDriver_dCompilerCli_dprintDiag o) dtb__121))
  | Vuna_dCompiler_dDiag.C_Vuna_dCompiler_dDiag_dCheck_OkC (dtb__124) -> ((fun ws -> ((fun shown -> (((Base_dMonad.v_Base_dMonad_dbind Base_dEff.v_Monad_uBase_uEff_uEff_ur) (((v_Vuna_dCompiler_dDriver_dCompilerCli_dprintDiagList o) "") shown)) (fun r -> ((Base_dApplicative.v_Base_dApplicative_dpure Base_dEff.v_Applicative_uBase_uEff_uEff_ur) { Base_dPair.f_Base_dPair_dPair_first = (if (if (o).f_Vuna_dCompiler_dDriver_dCompilerCli_dCliOpts_optDenyWarnings then ((Base_dList.v_Base_dList_dlength ws) > 0) else false) then 1 else 0); Base_dPair.f_Base_dPair_dPair_second = (Base_dPair.v_Base_dPair_dsecondOf r) })))) (if (if (o).f_Vuna_dCompiler_dDriver_dCompilerCli_dCliOpts_optShowWarnings then true else (o).f_Vuna_dCompiler_dDriver_dCompilerCli_dCliOpts_optDenyWarnings) then ws else Base_dList.C_Base_dList_dList_Nil))) ((Base_dList.v_Base_dList_dfilter (v_Vuna_dCompiler_dDriver_dCompilerCli_downedByFile path)) (Vuna_dCompiler_dDiagnostics_dSink.v_Vuna_dCompiler_dDiagnostics_dSink_ddedupeWarnings dtb__124)))
  | _ -> failwith "DT: impossible branch"
))))

# 842 "Vuna/Compiler/Driver/CompilerCli.vuna"
let v_Vuna_dCompiler_dDriver_dCompilerCli_dcheckFileEntry = (fun path o -> (((Base_dMonad.v_Base_dMonad_dbind Base_dEff.v_Monad_uBase_uEff_uEff_ur) (Vuna_dCompiler_dPackages_dPkg.v_Vuna_dCompiler_dPackages_dPkg_dcontextForFile path)) (fun ctxR -> (match ctxR with
  | Vuna_dCompiler_dDiag.C_Vuna_dCompiler_dDiag_dCheck_ErrC (dtb__125) -> ((v_Vuna_dCompiler_dDriver_dCompilerCli_dprintDiag o) dtb__125)
  | Vuna_dCompiler_dDiag.C_Vuna_dCompiler_dDiag_dCheck_OkC (dtb__126) -> ((fun ctx -> ((fun o1 -> (((Base_dMonad.v_Base_dMonad_dbind Base_dEff.v_Monad_uBase_uEff_uEff_ur) ((v_Vuna_dCompiler_dDriver_dCompilerCli_disModuleFileEntry ctx) path)) (fun moduleEntry -> (if moduleEntry then (((v_Vuna_dCompiler_dDriver_dCompilerCli_dcheckModuleFileEntry ctx) path) o1) else (((v_Vuna_dCompiler_dDriver_dCompilerCli_dcheckEntryFile ctx) path) o1))))) ((v_Vuna_dCompiler_dDriver_dCompilerCli_dapplyDiagConfig (Vuna_dCompiler_dPackages_dPkg.v_Vuna_dCompiler_dPackages_dPkg_dcontextPackageOf ctx)) o))) ((Vuna_dCompiler_dPackages_dPkg.v_Vuna_dCompiler_dPackages_dPkg_dcontextWithRelease (o).f_Vuna_dCompiler_dDriver_dCompilerCli_dCliOpts_optRelease) dtb__126))
  | _ -> failwith "DT: impossible branch"
))))

# 1221 "Vuna/Compiler/Driver/CompilerCli.vuna"
let v_Vuna_dCompiler_dDriver_dCompilerCli_downedByPackage = (fun pkg d -> ((fun dir -> ((fun file -> ((fun prefix -> (if (if ((Base_dString.v_Base_dString_dstartsWith (prefix ^ "lib/")) file) then true else ((Base_dString.v_Base_dString_dstartsWith (prefix ^ "app/")) file)) then true else ((Base_dString.v_Base_dString_dstartsWith (prefix ^ "test/")) file))) (if (if (dir = ".") then true else (dir = "")) then "" else (dir ^ "/")))) (v_Vuna_dCompiler_dDriver_dCompilerCli_dstripDotSlash (Vuna_dCompiler_dDiag.v_Vuna_dCompiler_dDiag_ddiagFileOf d)))) (v_Vuna_dCompiler_dDriver_dCompilerCli_dstripDotSlash (Vuna_dCompiler_dPackages_dPkg.v_Vuna_dCompiler_dPackages_dPkg_dpackageDir pkg))))

# 1233 "Vuna/Compiler/Driver/CompilerCli.vuna"
let v_Vuna_dCompiler_dDriver_dCompilerCli_dfinishWarnings = (fun warns code o -> ((fun ws -> ((fun shown -> (((Base_dMonad.v_Base_dMonad_dbind Base_dEff.v_Monad_uBase_uEff_uEff_ur) (((v_Vuna_dCompiler_dDriver_dCompilerCli_dprintDiagList o) "") shown)) (fun r -> ((Base_dApplicative.v_Base_dApplicative_dpure Base_dEff.v_Applicative_uBase_uEff_uEff_ur) { Base_dPair.f_Base_dPair_dPair_first = (if (if (o).f_Vuna_dCompiler_dDriver_dCompilerCli_dCliOpts_optDenyWarnings then ((Base_dList.v_Base_dList_dlength ws) > 0) else false) then 1 else code); Base_dPair.f_Base_dPair_dPair_second = (Base_dPair.v_Base_dPair_dsecondOf r) })))) (if (if (o).f_Vuna_dCompiler_dDriver_dCompilerCli_dCliOpts_optShowWarnings then true else (o).f_Vuna_dCompiler_dDriver_dCompilerCli_dCliOpts_optDenyWarnings) then ws else Base_dList.C_Base_dList_dList_Nil))) (Vuna_dCompiler_dDiagnostics_dSink.v_Vuna_dCompiler_dDiagnostics_dSink_ddedupeWarnings warns)))

# 1244 "Vuna/Compiler/Driver/CompilerCli.vuna"
let v_Vuna_dCompiler_dDriver_dCompilerCli_dfinishWarningsDir = (fun warns o dir code -> ((fun ws -> ((fun shown -> (((Base_dMonad.v_Base_dMonad_dbind Base_dEff.v_Monad_uBase_uEff_uEff_ur) (((v_Vuna_dCompiler_dDriver_dCompilerCli_dprintDiagList o) "") shown)) (fun r -> (if (if (o).f_Vuna_dCompiler_dDriver_dCompilerCli_dCliOpts_optDenyWarnings then ((Base_dList.v_Base_dList_dlength ws) > 0) else false) then (((Base_dMonad.v_Base_dMonad_dbind Base_dEff.v_Monad_uBase_uEff_uEff_ur) ((Base_dHostRow.v_Base_dHostRow_draiseToRow Base_dHostRow.v_Base_dHostRow_dhostRow) (((fun dtio_0 dtio_1 -> Base_dEff.C_Base_dEff_dEff_MkEff (fun (_ : Base_dEff.t_Base_dEff_dEffUnit) -> (fun dir args -> dtp_runIn dir (Base_dList.dtp_ocamlOf args)) dtio_0 dtio_1)) "/") (Base_dList.C_Base_dList_dList_Cons ("rm", (Base_dList.C_Base_dList_dList_Cons ("-rf", (Base_dList.C_Base_dList_dList_Cons (dir, Base_dList.C_Base_dList_dList_Nil))))))))) (fun _u -> ((Base_dApplicative.v_Base_dApplicative_dpure Base_dEff.v_Applicative_uBase_uEff_uEff_ur) { Base_dPair.f_Base_dPair_dPair_first = 1; Base_dPair.f_Base_dPair_dPair_second = (Base_dPair.v_Base_dPair_dsecondOf r) }))) else ((Base_dApplicative.v_Base_dApplicative_dpure Base_dEff.v_Applicative_uBase_uEff_uEff_ur) { Base_dPair.f_Base_dPair_dPair_first = code; Base_dPair.f_Base_dPair_dPair_second = (Base_dPair.v_Base_dPair_dsecondOf r) }))))) (if (if (o).f_Vuna_dCompiler_dDriver_dCompilerCli_dCliOpts_optShowWarnings then true else (o).f_Vuna_dCompiler_dDriver_dCompilerCli_dCliOpts_optDenyWarnings) then ws else Base_dList.C_Base_dList_dList_Nil))) (Vuna_dCompiler_dDiagnostics_dSink.v_Vuna_dCompiler_dDiagnostics_dSink_ddedupeWarnings warns)))

# 669 "Vuna/Compiler/Driver/CompilerCli.vuna"
let v_Vuna_dCompiler_dDriver_dCompilerCli_dcompileFileEntry = (fun printResult entry outDir o -> (((Base_dMonad.v_Base_dMonad_dbind Base_dEff.v_Monad_uBase_uEff_uEff_ur) (Vuna_dCompiler_dPackages_dPkg.v_Vuna_dCompiler_dPackages_dPkg_dcontextForFile entry)) (fun ctxR -> (match ctxR with
  | Vuna_dCompiler_dDiag.C_Vuna_dCompiler_dDiag_dCheck_ErrC (dtb__127) -> ((v_Vuna_dCompiler_dDriver_dCompilerCli_dprintDiag o) dtb__127)
  | Vuna_dCompiler_dDiag.C_Vuna_dCompiler_dDiag_dCheck_OkC (dtb__128) -> ((fun ctx -> ((fun o1 -> (((Base_dMonad.v_Base_dMonad_dbind Base_dEff.v_Monad_uBase_uEff_uEff_ur) (((((v_Vuna_dCompiler_dDriver_dCompilerCli_dcompileToTarget ctx) entry) printResult) outDir) (o).f_Vuna_dCompiler_dDriver_dCompilerCli_dCliOpts_optTarget)) (fun r -> (match r with
  | Vuna_dCompiler_dDiag.C_Vuna_dCompiler_dDiag_dCheck_ErrC (dtb__129) -> ((v_Vuna_dCompiler_dDriver_dCompilerCli_dprintDiag o1) dtb__129)
  | Vuna_dCompiler_dDiag.C_Vuna_dCompiler_dDiag_dCheck_OkC (dtb__130) -> ((((v_Vuna_dCompiler_dDriver_dCompilerCli_dfinishWarningsDir (Base_dPair.v_Base_dPair_dsecondOf dtb__130)) o1) outDir) 0)
  | _ -> failwith "DT: impossible branch"
)))) ((v_Vuna_dCompiler_dDriver_dCompilerCli_dapplyDiagConfig (Vuna_dCompiler_dPackages_dPkg.v_Vuna_dCompiler_dPackages_dPkg_dcontextPackageOf ctx)) o))) ((Vuna_dCompiler_dPackages_dPkg.v_Vuna_dCompiler_dPackages_dPkg_dcontextWithRelease (o).f_Vuna_dCompiler_dDriver_dCompilerCli_dCliOpts_optRelease) dtb__128))
  | _ -> failwith "DT: impossible branch"
))))

# 684 "Vuna/Compiler/Driver/CompilerCli.vuna"
let v_Vuna_dCompiler_dDriver_dCompilerCli_dcompilePkgDir = (fun printResult dir outDir o -> (((Base_dMonad.v_Base_dMonad_dbind Base_dEff.v_Monad_uBase_uEff_uEff_ur) ((v_Vuna_dCompiler_dDriver_dCompilerCli_dexecutablePackage "compile") dir)) (fun pkgR -> (match pkgR with
  | Vuna_dCompiler_dDiag.C_Vuna_dCompiler_dDiag_dCheck_ErrC (dtb__131) -> ((v_Vuna_dCompiler_dDriver_dCompilerCli_dprintDiag o) dtb__131)
  | Vuna_dCompiler_dDiag.C_Vuna_dCompiler_dDiag_dCheck_OkC (dtb__132) -> ((fun o1 -> (((Base_dMonad.v_Base_dMonad_dbind Base_dEff.v_Monad_uBase_uEff_uEff_ur) (((((v_Vuna_dCompiler_dDriver_dCompilerCli_dcompileToTarget ((Vuna_dCompiler_dPackages_dPkg.v_Vuna_dCompiler_dPackages_dPkg_dcontextWithRelease (o).f_Vuna_dCompiler_dDriver_dCompilerCli_dCliOpts_optRelease) (Vuna_dCompiler_dPackages_dPkg.v_Vuna_dCompiler_dPackages_dPkg_dpackageContext dtb__132))) (Vuna_dCompiler_dPackages_dPkg.v_Vuna_dCompiler_dPackages_dPkg_dpackageEntry dtb__132)) printResult) outDir) (o).f_Vuna_dCompiler_dDriver_dCompilerCli_dCliOpts_optTarget)) (fun r -> (match r with
  | Vuna_dCompiler_dDiag.C_Vuna_dCompiler_dDiag_dCheck_ErrC (dtb__133) -> ((v_Vuna_dCompiler_dDriver_dCompilerCli_dprintDiag o1) dtb__133)
  | Vuna_dCompiler_dDiag.C_Vuna_dCompiler_dDiag_dCheck_OkC (dtb__134) -> ((((v_Vuna_dCompiler_dDriver_dCompilerCli_dfinishWarningsDir (Base_dPair.v_Base_dPair_dsecondOf dtb__134)) o1) outDir) 0)
  | _ -> failwith "DT: impossible branch"
)))) ((v_Vuna_dCompiler_dDriver_dCompilerCli_dapplyDiagConfig (Base_dMaybe.C_Base_dMaybe_dMaybe_Just (dtb__132))) o))
  | _ -> failwith "DT: impossible branch"
))))

# 644 "Vuna/Compiler/Driver/CompilerCli.vuna"
let v_Vuna_dCompiler_dDriver_dCompilerCli_dcompileRun = (fun printResult entry outDir o -> (((Base_dMonad.v_Base_dMonad_dbind Base_dEff.v_Monad_uBase_uEff_uEff_ur) ((Base_dHostRow.v_Base_dHostRow_draiseToRow Base_dHostRow.v_Base_dHostRow_dhostRow) ((fun dtio_0 -> Base_dEff.C_Base_dEff_dEff_MkEff (fun (_ : Base_dEff.t_Base_dEff_dEffUnit) -> dtp_fileExists dtio_0)) entry))) (fun exists -> (if exists then (((Base_dMonad.v_Base_dMonad_dbind Base_dEff.v_Monad_uBase_uEff_uEff_ur) ((Base_dHostRow.v_Base_dHostRow_draiseToRow Base_dHostRow.v_Base_dHostRow_dhostRow) ((fun dtio_0 -> Base_dEff.C_Base_dEff_dEff_MkEff (fun (_ : Base_dEff.t_Base_dEff_dEffUnit) -> dtp_isDirectory dtio_0)) entry))) (fun isDir -> (if isDir then ((((v_Vuna_dCompiler_dDriver_dCompilerCli_dcompilePkgDir printResult) entry) outDir) o) else ((((v_Vuna_dCompiler_dDriver_dCompilerCli_dcompileFileEntry printResult) entry) outDir) o)))) else ((v_Vuna_dCompiler_dDriver_dCompilerCli_dwithOpts o) (v_Vuna_dCompiler_dDriver_dCompilerCli_ddtPathErr entry))))))

# 638 "Vuna/Compiler/Driver/CompilerCli.vuna"
let v_Vuna_dCompiler_dDriver_dCompilerCli_dcompileFinish = (fun mc0 mc1 mc2 mc3 mc4 -> (match mc2 with
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Just (dtb__135) -> (match mc3 with
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing -> ((v_Vuna_dCompiler_dDriver_dCompilerCli_dwithOpts mc4) (v_Vuna_dCompiler_dDriver_dCompilerCli_dusageErr mc0))
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Just (dtb__136) -> ((((v_Vuna_dCompiler_dDriver_dCompilerCli_dcompileRun mc1) dtb__135) dtb__136) mc4)
  | _ -> failwith "DT: impossible branch"
)
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing -> ((v_Vuna_dCompiler_dDriver_dCompilerCli_dwithOpts mc4) (v_Vuna_dCompiler_dDriver_dCompilerCli_dusageErr mc0))
  | _ -> failwith "DT: impossible branch"
))

# 619 "Vuna/Compiler/Driver/CompilerCli.vuna"
let rec v_Vuna_dCompiler_dDriver_dCompilerCli_dcompileParse = (fun prog printResult entry outDir args o -> ((fun nd_uscrut6 -> (match nd_uscrut6 with
  | Base_dList.C_Base_dList_dList_Cons (dtb__137, dtb__138) -> (if (dtb__137 = "--no-print") then ((((((v_Vuna_dCompiler_dDriver_dCompilerCli_dcompileParse prog) false) entry) outDir) dtb__138) o) else (if (dtb__137 = "--release") then ((((((v_Vuna_dCompiler_dDriver_dCompilerCli_dcompileParse prog) printResult) entry) outDir) dtb__138) (v_Vuna_dCompiler_dDriver_dCompilerCli_dmarkRelease o)) else (if (dtb__137 = "--target") then (match dtb__138 with
  | Base_dList.C_Base_dList_dList_Cons (dtb__139, dtb__140) -> (if (v_Vuna_dCompiler_dDriver_dCompilerCli_disKnownTarget dtb__139) then ((((((v_Vuna_dCompiler_dDriver_dCompilerCli_dcompileParse prog) printResult) entry) outDir) dtb__140) ((v_Vuna_dCompiler_dDriver_dCompilerCli_dmarkTarget dtb__139) o)) else ((v_Vuna_dCompiler_dDriver_dCompilerCli_dwithOpts o) (v_Vuna_dCompiler_dDriver_dCompilerCli_dusageErr prog)))
  | _ -> (if ((Base_dString.v_Base_dString_dstartsWith "-") dtb__137) then ((v_Vuna_dCompiler_dDriver_dCompilerCli_dwithOpts o) ((v_Vuna_dCompiler_dDriver_dCompilerCli_dremovedFlag prog) dtb__137)) else (match entry with
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing -> ((((((v_Vuna_dCompiler_dDriver_dCompilerCli_dcompileParse prog) printResult) (Base_dMaybe.C_Base_dMaybe_dMaybe_Just (dtb__137))) outDir) dtb__138) o)
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Just (dtb__141) -> (match outDir with
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing -> ((((((v_Vuna_dCompiler_dDriver_dCompilerCli_dcompileParse prog) printResult) entry) (Base_dMaybe.C_Base_dMaybe_dMaybe_Just (dtb__137))) dtb__138) o)
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Just (dtb__142) -> ((v_Vuna_dCompiler_dDriver_dCompilerCli_dwithOpts o) (v_Vuna_dCompiler_dDriver_dCompilerCli_dusageErr prog))
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
))
) else (if ((Base_dString.v_Base_dString_dstartsWith "-") dtb__137) then ((v_Vuna_dCompiler_dDriver_dCompilerCli_dwithOpts o) ((v_Vuna_dCompiler_dDriver_dCompilerCli_dremovedFlag prog) dtb__137)) else (match entry with
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing -> ((((((v_Vuna_dCompiler_dDriver_dCompilerCli_dcompileParse prog) printResult) (Base_dMaybe.C_Base_dMaybe_dMaybe_Just (dtb__137))) outDir) dtb__138) o)
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Just (dtb__143) -> (match outDir with
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing -> ((((((v_Vuna_dCompiler_dDriver_dCompilerCli_dcompileParse prog) printResult) entry) (Base_dMaybe.C_Base_dMaybe_dMaybe_Just (dtb__137))) dtb__138) o)
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Just (dtb__144) -> ((v_Vuna_dCompiler_dDriver_dCompilerCli_dwithOpts o) (v_Vuna_dCompiler_dDriver_dCompilerCli_dusageErr prog))
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
)))))
  | Base_dList.C_Base_dList_dList_Nil -> (((((v_Vuna_dCompiler_dDriver_dCompilerCli_dcompileFinish prog) printResult) entry) outDir) o)
  | _ -> failwith "DT: impossible branch"
)) args))

# 616 "Vuna/Compiler/Driver/CompilerCli.vuna"
let v_Vuna_dCompiler_dDriver_dCompilerCli_dcompileArgs = (fun prog args o -> ((((((v_Vuna_dCompiler_dDriver_dCompilerCli_dcompileParse prog) true) Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing) Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing) args) o))

# 1262 "Vuna/Compiler/Driver/CompilerCli.vuna"
let rec v_Vuna_dCompiler_dDriver_dCompilerCli_dstripLangGo = (fun mc0 mc1 mc2 -> (match mc0 with
  | Base_dList.C_Base_dList_dList_Cons (dtb__145, dtb__146) -> (if (dtb__145 = "--lang") then (match dtb__146 with
  | Base_dList.C_Base_dList_dList_Cons (dtb__147, dtb__148) -> (((v_Vuna_dCompiler_dDriver_dCompilerCli_dstripLangGo dtb__148) mc1) dtb__147)
  | Base_dList.C_Base_dList_dList_Nil -> { Base_dPair.f_Base_dPair_dPair_first = (Base_dList.v_Base_dList_dreverse mc1); Base_dPair.f_Base_dPair_dPair_second = mc2 }
  | _ -> failwith "DT: impossible branch"
) else (if ((Base_dString.v_Base_dString_dstartsWith "--lang=") dtb__145) then (((v_Vuna_dCompiler_dDriver_dCompilerCli_dstripLangGo dtb__146) mc1) (((Base_dString.v_Base_dString_dsubstring (bi_natFromInt 7)) (bi_natFromInt ((bi_strLength dtb__145) - 7))) dtb__145)) else (((v_Vuna_dCompiler_dDriver_dCompilerCli_dstripLangGo dtb__146) (Base_dList.C_Base_dList_dList_Cons (dtb__145, mc1))) mc2)))
  | Base_dList.C_Base_dList_dList_Nil -> { Base_dPair.f_Base_dPair_dPair_first = (Base_dList.v_Base_dList_dreverse mc1); Base_dPair.f_Base_dPair_dPair_second = mc2 }
  | _ -> failwith "DT: impossible branch"
))

# 1258 "Vuna/Compiler/Driver/CompilerCli.vuna"
let v_Vuna_dCompiler_dDriver_dCompilerCli_dstripLang = (fun args -> (((v_Vuna_dCompiler_dDriver_dCompilerCli_dstripLangGo args) Base_dList.C_Base_dList_dList_Nil) "en"))

# 1272 "Vuna/Compiler/Driver/CompilerCli.vuna"
let rec v_Vuna_dCompiler_dDriver_dCompilerCli_dhasLangFlag = (fun mc0 -> (match mc0 with
  | Base_dList.C_Base_dList_dList_Cons (dtb__149, dtb__150) -> (if (if (dtb__149 = "--lang") then true else ((Base_dString.v_Base_dString_dstartsWith "--lang=") dtb__149)) then true else (v_Vuna_dCompiler_dDriver_dCompilerCli_dhasLangFlag dtb__150))
  | Base_dList.C_Base_dList_dList_Nil -> false
  | _ -> failwith "DT: impossible branch"
))

# 1280 "Vuna/Compiler/Driver/CompilerCli.vuna"
let rec v_Vuna_dCompiler_dDriver_dCompilerCli_dstripContinueGo = (fun mc0 mc1 mc2 -> (match mc0 with
  | Base_dList.C_Base_dList_dList_Cons (dtb__151, dtb__152) -> (if (dtb__151 = "--continue-on-error") then (((v_Vuna_dCompiler_dDriver_dCompilerCli_dstripContinueGo dtb__152) mc1) true) else (((v_Vuna_dCompiler_dDriver_dCompilerCli_dstripContinueGo dtb__152) (Base_dList.C_Base_dList_dList_Cons (dtb__151, mc1))) mc2))
  | Base_dList.C_Base_dList_dList_Nil -> { Base_dPair.f_Base_dPair_dPair_first = (Base_dList.v_Base_dList_dreverse mc1); Base_dPair.f_Base_dPair_dPair_second = mc2 }
  | _ -> failwith "DT: impossible branch"
))

# 1277 "Vuna/Compiler/Driver/CompilerCli.vuna"
let v_Vuna_dCompiler_dDriver_dCompilerCli_dstripContinueOnError = (fun args -> (((v_Vuna_dCompiler_dDriver_dCompilerCli_dstripContinueGo args) Base_dList.C_Base_dList_dList_Nil) false))

# 1318 "Vuna/Compiler/Driver/CompilerCli.vuna"
let v_Vuna_dCompiler_dDriver_dCompilerCli_dprintRecovered = (fun pkg e ds o -> ((fun shown -> (((Base_dMonad.v_Base_dMonad_dbind Base_dEff.v_Monad_uBase_uEff_uEff_ur) (((v_Vuna_dCompiler_dDriver_dCompilerCli_dprintDiagList o) (String.concat "" ["["; (Vuna_dCompiler_dPackages_dPkg.v_Vuna_dCompiler_dPackages_dPkg_dpackageName pkg); "] "])) shown)) (fun r -> (if ((Base_dList.v_Base_dList_dlength shown) = 0) then (((v_Vuna_dCompiler_dDriver_dCompilerCli_dprintDiagWithPrefix (Base_dPair.v_Base_dPair_dsecondOf r)) (String.concat "" ["["; (Vuna_dCompiler_dPackages_dPkg.v_Vuna_dCompiler_dPackages_dPkg_dpackageName pkg); "] "])) e) else ((Base_dApplicative.v_Base_dApplicative_dpure Base_dEff.v_Applicative_uBase_uEff_uEff_ur) { Base_dPair.f_Base_dPair_dPair_first = 1; Base_dPair.f_Base_dPair_dPair_second = (Base_dPair.v_Base_dPair_dsecondOf r) }))))) ((v_Vuna_dCompiler_dDriver_dCompilerCli_dtakeDiags (o).f_Vuna_dCompiler_dDriver_dCompilerCli_dCliOpts_optMaxErrors) ds)))

# 1298 "Vuna/Compiler/Driver/CompilerCli.vuna"
let v_Vuna_dCompiler_dDriver_dCompilerCli_dpackageRecoverExe = (fun pkg e o -> (((Base_dMonad.v_Base_dMonad_dbind Base_dEff.v_Monad_uBase_uEff_uEff_ur) ((Vuna_dCompiler_dDriver_dDt.v_Vuna_dCompiler_dDriver_dDt_ddtCheckRecovering ((Vuna_dCompiler_dPackages_dPkg.v_Vuna_dCompiler_dPackages_dPkg_dcontextWithRelease (o).f_Vuna_dCompiler_dDriver_dCompilerCli_dCliOpts_optRelease) (Vuna_dCompiler_dPackages_dPkg.v_Vuna_dCompiler_dPackages_dPkg_dpackageContext pkg))) (Vuna_dCompiler_dPackages_dPkg.v_Vuna_dCompiler_dPackages_dPkg_dpackageEntry pkg))) (fun recovered -> (match recovered with
  | Vuna_dCompiler_dDiag.C_Vuna_dCompiler_dDiag_dCheck_OkC (dtb__153) -> ((((v_Vuna_dCompiler_dDriver_dCompilerCli_dprintRecovered pkg) e) dtb__153) o)
  | Vuna_dCompiler_dDiag.C_Vuna_dCompiler_dDiag_dCheck_ErrC (dtb__154) -> (((v_Vuna_dCompiler_dDriver_dCompilerCli_dprintDiagWithPrefix o) (String.concat "" ["["; (Vuna_dCompiler_dPackages_dPkg.v_Vuna_dCompiler_dPackages_dPkg_dpackageName pkg); "] "])) dtb__154)
  | _ -> failwith "DT: impossible branch"
))))

# 1307 "Vuna/Compiler/Driver/CompilerCli.vuna"
let v_Vuna_dCompiler_dDriver_dCompilerCli_dpackageRecoverLib = (fun pkg e o -> (match (Vuna_dCompiler_dPackages_dPkg.v_Vuna_dCompiler_dPackages_dPkg_dpackageExports pkg) with
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Just (dtb__155) -> (((Base_dMonad.v_Base_dMonad_dbind Base_dEff.v_Monad_uBase_uEff_uEff_ur) ((Vuna_dCompiler_dDriver_dDt.v_Vuna_dCompiler_dDriver_dDt_ddtCheckLibraryRecovering ((Vuna_dCompiler_dPackages_dPkg.v_Vuna_dCompiler_dPackages_dPkg_dcontextWithRelease (o).f_Vuna_dCompiler_dDriver_dCompilerCli_dCliOpts_optRelease) (Vuna_dCompiler_dPackages_dPkg.v_Vuna_dCompiler_dPackages_dPkg_dpackageContext pkg))) dtb__155)) (fun recovered -> (match recovered with
  | Vuna_dCompiler_dDiag.C_Vuna_dCompiler_dDiag_dCheck_OkC (dtb__156) -> ((((v_Vuna_dCompiler_dDriver_dCompilerCli_dprintRecovered pkg) e) dtb__156) o)
  | Vuna_dCompiler_dDiag.C_Vuna_dCompiler_dDiag_dCheck_ErrC (dtb__157) -> (((v_Vuna_dCompiler_dDriver_dCompilerCli_dprintDiagWithPrefix o) (String.concat "" ["["; (Vuna_dCompiler_dPackages_dPkg.v_Vuna_dCompiler_dPackages_dPkg_dpackageName pkg); "] "])) dtb__157)
  | _ -> failwith "DT: impossible branch"
)))
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing -> (((v_Vuna_dCompiler_dDriver_dCompilerCli_dprintDiagWithPrefix o) (String.concat "" ["["; (Vuna_dCompiler_dPackages_dPkg.v_Vuna_dCompiler_dPackages_dPkg_dpackageName pkg); "] "])) e)
  | _ -> failwith "DT: impossible branch"
))

# 1292 "Vuna/Compiler/Driver/CompilerCli.vuna"
let v_Vuna_dCompiler_dDriver_dCompilerCli_dpackageRecover = (fun pkg e o -> (((Base_dMonad.v_Base_dMonad_dbind Base_dEff.v_Monad_uBase_uEff_uEff_ur) ((Base_dHostRow.v_Base_dHostRow_draiseToRow Base_dHostRow.v_Base_dHostRow_dhostRow) ((fun dtio_0 -> Base_dEff.C_Base_dEff_dEff_MkEff (fun (_ : Base_dEff.t_Base_dEff_dEffUnit) -> dtp_fileExists dtio_0)) (Vuna_dCompiler_dPackages_dPkg.v_Vuna_dCompiler_dPackages_dPkg_dpackageEntry pkg)))) (fun exists -> (if exists then (((v_Vuna_dCompiler_dDriver_dCompilerCli_dpackageRecoverExe pkg) e) o) else (((v_Vuna_dCompiler_dDriver_dCompilerCli_dpackageRecoverLib pkg) e) o)))))

# 1285 "Vuna/Compiler/Driver/CompilerCli.vuna"
let v_Vuna_dCompiler_dDriver_dCompilerCli_dcheckPackageErr = (fun pkg e o -> (if (o).f_Vuna_dCompiler_dDriver_dCompilerCli_dCliOpts_optContinueOnError then (((v_Vuna_dCompiler_dDriver_dCompilerCli_dpackageRecover pkg) e) o) else (((v_Vuna_dCompiler_dDriver_dCompilerCli_dprintDiagWithPrefix o) (String.concat "" ["["; (Vuna_dCompiler_dPackages_dPkg.v_Vuna_dCompiler_dPackages_dPkg_dpackageName pkg); "] "])) e)))

# 824 "Vuna/Compiler/Driver/CompilerCli.vuna"
let v_Vuna_dCompiler_dDriver_dCompilerCli_dcheckPackageCode = (fun pkg wantWarnings o -> (((Base_dMonad.v_Base_dMonad_dbind Base_dEff.v_Monad_uBase_uEff_uEff_ur) (((Vuna_dCompiler_dDriver_dCompile.v_Vuna_dCompiler_dDriver_dCompile_dcheckPackage (o).f_Vuna_dCompiler_dDriver_dCompilerCli_dCliOpts_optRelease) wantWarnings) pkg)) (fun r -> (match r with
  | Vuna_dCompiler_dDiag.C_Vuna_dCompiler_dDiag_dCheck_ErrC (dtb__158) -> (((v_Vuna_dCompiler_dDriver_dCompilerCli_dcheckPackageErr pkg) dtb__158) o)
  | Vuna_dCompiler_dDiag.C_Vuna_dCompiler_dDiag_dCheck_OkC (dtb__159) -> ((fun ws -> ((fun shown -> ((fun failed -> (((Base_dMonad.v_Base_dMonad_dbind Base_dEff.v_Monad_uBase_uEff_uEff_ur) (((v_Vuna_dCompiler_dDriver_dCompilerCli_dprintDiagList o) (String.concat "" ["["; (Vuna_dCompiler_dPackages_dPkg.v_Vuna_dCompiler_dPackages_dPkg_dpackageName pkg); "] "])) shown)) (fun r1 -> ((Base_dApplicative.v_Base_dApplicative_dpure Base_dEff.v_Applicative_uBase_uEff_uEff_ur) { Base_dPair.f_Base_dPair_dPair_first = failed; Base_dPair.f_Base_dPair_dPair_second = (Base_dPair.v_Base_dPair_dsecondOf r1) })))) (if (if (o).f_Vuna_dCompiler_dDriver_dCompilerCli_dCliOpts_optDenyWarnings then ((Base_dList.v_Base_dList_dlength ws) > 0) else false) then 1 else 0))) (if (if (o).f_Vuna_dCompiler_dDriver_dCompilerCli_dCliOpts_optShowWarnings then true else (o).f_Vuna_dCompiler_dDriver_dCompilerCli_dCliOpts_optDenyWarnings) then ws else Base_dList.C_Base_dList_dList_Nil))) ((Base_dList.v_Base_dList_dfilter (v_Vuna_dCompiler_dDriver_dCompilerCli_downedByPackage pkg)) (Vuna_dCompiler_dDiagnostics_dSink.v_Vuna_dCompiler_dDiagnostics_dSink_ddedupeWarnings dtb__159)))
  | _ -> failwith "DT: impossible branch"
))))

# 813 "Vuna/Compiler/Driver/CompilerCli.vuna"
let v_Vuna_dCompiler_dDriver_dCompilerCli_dcheckPackageSeq = (fun pkg code o -> ((fun o1 -> ((fun wantWarnings -> (((Base_dMonad.v_Base_dMonad_dbind Base_dEff.v_Monad_uBase_uEff_uEff_ur) (((v_Vuna_dCompiler_dDriver_dCompilerCli_dcheckPackageCode pkg) wantWarnings) o1)) (fun r -> ((Base_dApplicative.v_Base_dApplicative_dpure Base_dEff.v_Applicative_uBase_uEff_uEff_ur) { Base_dPair.f_Base_dPair_dPair_first = (if ((Base_dPair.v_Base_dPair_dfirstOf r) > code) then (Base_dPair.v_Base_dPair_dfirstOf r) else code); Base_dPair.f_Base_dPair_dPair_second = (Base_dPair.v_Base_dPair_dsecondOf r) })))) (if (o1).f_Vuna_dCompiler_dDriver_dCompilerCli_dCliOpts_optShowWarnings then true else (o1).f_Vuna_dCompiler_dDriver_dCompilerCli_dCliOpts_optDenyWarnings))) ((v_Vuna_dCompiler_dDriver_dCompilerCli_dapplyDiagConfig (Base_dMaybe.C_Base_dMaybe_dMaybe_Just (pkg))) o)))

# 790 "Vuna/Compiler/Driver/CompilerCli.vuna"
let rec v_Vuna_dCompiler_dDriver_dCompilerCli_dcheckPkgsInProcess = (fun mc0 mc1 mc2 -> (match mc0 with
  | Base_dList.C_Base_dList_dList_Cons (dtb__160, dtb__161) -> (((Base_dMonad.v_Base_dMonad_dbind Base_dEff.v_Monad_uBase_uEff_uEff_ur) (((v_Vuna_dCompiler_dDriver_dCompilerCli_dcheckPackageSeq dtb__160) mc1) mc2)) (fun r -> (((v_Vuna_dCompiler_dDriver_dCompilerCli_dcheckPkgsInProcess dtb__161) (Base_dPair.v_Base_dPair_dfirstOf r)) (Base_dPair.v_Base_dPair_dsecondOf r))))
  | Base_dList.C_Base_dList_dList_Nil -> ((Base_dApplicative.v_Base_dApplicative_dpure Base_dEff.v_Applicative_uBase_uEff_uEff_ur) { Base_dPair.f_Base_dPair_dPair_first = mc1; Base_dPair.f_Base_dPair_dPair_second = mc2 })
  | _ -> failwith "DT: impossible branch"
))

# 804 "Vuna/Compiler/Driver/CompilerCli.vuna"
let rec v_Vuna_dCompiler_dDriver_dCompilerCli_dcheckRootsSeq = (fun mc0 mc1 mc2 -> (match mc0 with
  | Base_dList.C_Base_dList_dList_Cons (dtb__162, dtb__163) -> (((Base_dMonad.v_Base_dMonad_dbind Base_dEff.v_Monad_uBase_uEff_uEff_ur) (((v_Vuna_dCompiler_dDriver_dCompilerCli_dcheckPackageSeq dtb__162) mc1) mc2)) (fun r -> ((fun code1 -> (if (if (mc2).f_Vuna_dCompiler_dDriver_dCompilerCli_dCliOpts_optFailFast then (code1 <> 0) else false) then ((Base_dApplicative.v_Base_dApplicative_dpure Base_dEff.v_Applicative_uBase_uEff_uEff_ur) { Base_dPair.f_Base_dPair_dPair_first = code1; Base_dPair.f_Base_dPair_dPair_second = (Base_dPair.v_Base_dPair_dsecondOf r) }) else (((v_Vuna_dCompiler_dDriver_dCompilerCli_dcheckRootsSeq dtb__163) code1) (Base_dPair.v_Base_dPair_dsecondOf r)))) (Base_dPair.v_Base_dPair_dfirstOf r))))
  | Base_dList.C_Base_dList_dList_Nil -> ((Base_dApplicative.v_Base_dApplicative_dpure Base_dEff.v_Applicative_uBase_uEff_uEff_ur) { Base_dPair.f_Base_dPair_dPair_first = mc1; Base_dPair.f_Base_dPair_dPair_second = mc2 })
  | _ -> failwith "DT: impossible branch"
))

# 770 "Vuna/Compiler/Driver/CompilerCli.vuna"
let v_Vuna_dCompiler_dDriver_dCompilerCli_dcheckPackagesSpawn = (fun mc0 mc1 mc2 -> (match mc0 with
  | Base_dList.C_Base_dList_dList_Nil -> ((Base_dApplicative.v_Base_dApplicative_dpure Base_dEff.v_Applicative_uBase_uEff_uEff_ur) { Base_dPair.f_Base_dPair_dPair_first = mc1; Base_dPair.f_Base_dPair_dPair_second = mc2 })
  | _ -> (((Base_dMonad.v_Base_dMonad_dbind Base_dEff.v_Monad_uBase_uEff_uEff_ur) ((v_Vuna_dCompiler_dDriver_dCompilerCli_dmapEff (fun pkg -> (((Base_dMonad.v_Base_dMonad_dbind Base_dEff.v_Monad_uBase_uEff_uEff_ur) (v_Vuna_dCompiler_dDriver_dCompilerCli_disWorkspaceRoot pkg)) (fun root -> ((Base_dApplicative.v_Base_dApplicative_dpure Base_dEff.v_Applicative_uBase_uEff_uEff_ur) { Base_dPair.f_Base_dPair_dPair_first = pkg; Base_dPair.f_Base_dPair_dPair_second = root }))))) mc0)) (fun classified -> ((fun members -> ((fun roots -> (((Base_dMonad.v_Base_dMonad_dbind Base_dEff.v_Monad_uBase_uEff_uEff_ur) ((v_Vuna_dCompiler_dDriver_dCompilerCli_dmapEff (fun pkg -> (((Base_dMonad.v_Base_dMonad_dbind Base_dEff.v_Monad_uBase_uEff_uEff_ur) ((Base_dHostRow.v_Base_dHostRow_draiseToRow Base_dHostRow.v_Base_dHostRow_dhostRow) ((fun dtio_0 -> Base_dEff.C_Base_dEff_dEff_MkEff (fun (_ : Base_dEff.t_Base_dEff_dEffUnit) -> (fun args -> dtp_spawn (Base_dList.dtp_ocamlOf args)) dtio_0)) ((v_Vuna_dCompiler_dDriver_dCompilerCli_dcheckSpawnArgs mc2) (Vuna_dCompiler_dPackages_dPkg.v_Vuna_dCompiler_dPackages_dPkg_dpackageDir pkg))))) (fun pid -> ((Base_dApplicative.v_Base_dApplicative_dpure Base_dEff.v_Applicative_uBase_uEff_uEff_ur) { Base_dPair.f_Base_dPair_dPair_first = pkg; Base_dPair.f_Base_dPair_dPair_second = pid }))))) members)) (fun started -> (((Base_dMonad.v_Base_dMonad_dbind Base_dEff.v_Monad_uBase_uEff_uEff_ur) (((v_Vuna_dCompiler_dDriver_dCompilerCli_dcheckRootsSeq roots) mc1) mc2)) (fun r1 -> (((Base_dMonad.v_Base_dMonad_dbind Base_dEff.v_Monad_uBase_uEff_uEff_ur) ((v_Vuna_dCompiler_dDriver_dCompilerCli_dmapEff (fun pr -> ((fun dtio_0 -> Base_dEff.C_Base_dEff_dEff_MkEff (fun (_ : Base_dEff.t_Base_dEff_dEffUnit) -> dtp_wait dtio_0)) (Base_dPair.v_Base_dPair_dsecondOf pr)))) started)) (fun codes -> ((Base_dApplicative.v_Base_dApplicative_dpure Base_dEff.v_Applicative_uBase_uEff_uEff_ur) { Base_dPair.f_Base_dPair_dPair_first = ((v_Vuna_dCompiler_dDriver_dCompilerCli_dcountFailures (Base_dPair.v_Base_dPair_dfirstOf r1)) codes); Base_dPair.f_Base_dPair_dPair_second = (Base_dPair.v_Base_dPair_dsecondOf r1) })))))))) ((Base_dList.v_Base_dList_dmap Base_dPair.v_Base_dPair_dfirstOf) ((Base_dList.v_Base_dList_dfilter (fun p -> (Base_dPair.v_Base_dPair_dsecondOf p))) classified)))) ((Base_dList.v_Base_dList_dmap Base_dPair.v_Base_dPair_dfirstOf) ((Base_dList.v_Base_dList_dfilter (fun p -> (Base_dBool.v_Base_dBool_dnot (Base_dPair.v_Base_dPair_dsecondOf p)))) classified)))))
))

# 757 "Vuna/Compiler/Driver/CompilerCli.vuna"
let v_Vuna_dCompiler_dDriver_dCompilerCli_dcheckPackages = (fun mc0 mc1 mc2 -> (match mc0 with
  | Base_dList.C_Base_dList_dList_Cons (dtb__164, dtb__165) -> (match dtb__165 with
  | Base_dList.C_Base_dList_dList_Nil -> (((v_Vuna_dCompiler_dDriver_dCompilerCli_dcheckPackageSeq dtb__164) mc1) mc2)
  | _ -> ((fun oMachine -> (if (v_Vuna_dCompiler_dDriver_dCompilerCli_disMachineFormat (mc2).f_Vuna_dCompiler_dDriver_dCompilerCli_dCliOpts_optDiagFormat) then (((v_Vuna_dCompiler_dDriver_dCompilerCli_dcheckPkgsInProcess mc0) mc1) oMachine) else (((v_Vuna_dCompiler_dDriver_dCompilerCli_dcheckPackagesSpawn mc0) mc1) mc2))) (v_Vuna_dCompiler_dDriver_dCompilerCli_dmarkFormatExplicit mc2))
)
  | Base_dList.C_Base_dList_dList_Nil -> ((Base_dApplicative.v_Base_dApplicative_dpure Base_dEff.v_Applicative_uBase_uEff_uEff_ur) { Base_dPair.f_Base_dPair_dPair_first = mc1; Base_dPair.f_Base_dPair_dPair_second = mc2 })
  | _ -> failwith "DT: impossible branch"
))

# 721 "Vuna/Compiler/Driver/CompilerCli.vuna"
let v_Vuna_dCompiler_dDriver_dCompilerCli_dcheckPkgDir = (fun dir o -> (((Base_dMonad.v_Base_dMonad_dbind Base_dEff.v_Monad_uBase_uEff_uEff_ur) (Vuna_dCompiler_dPackages_dPkg.v_Vuna_dCompiler_dPackages_dPkg_dworkspacePackages dir)) (fun pkgsR -> (match pkgsR with
  | Vuna_dCompiler_dDiag.C_Vuna_dCompiler_dDiag_dCheck_ErrC (dtb__166) -> ((v_Vuna_dCompiler_dDriver_dCompilerCli_dprintDiag o) dtb__166)
  | Vuna_dCompiler_dDiag.C_Vuna_dCompiler_dDiag_dCheck_OkC (dtb__167) -> (((v_Vuna_dCompiler_dDriver_dCompilerCli_dcheckPackages dtb__167) 0) o)
  | _ -> failwith "DT: impossible branch"
))))

# 713 "Vuna/Compiler/Driver/CompilerCli.vuna"
let v_Vuna_dCompiler_dDriver_dCompilerCli_dcheckEmit = (fun path o -> (((Base_dMonad.v_Base_dMonad_dbind Base_dEff.v_Monad_uBase_uEff_uEff_ur) ((Base_dHostRow.v_Base_dHostRow_draiseToRow Base_dHostRow.v_Base_dHostRow_dhostRow) ((fun dtio_0 -> Base_dEff.C_Base_dEff_dEff_MkEff (fun (_ : Base_dEff.t_Base_dEff_dEffUnit) -> dtp_fileExists dtio_0)) path))) (fun exists -> (if exists then (((Base_dMonad.v_Base_dMonad_dbind Base_dEff.v_Monad_uBase_uEff_uEff_ur) ((Base_dHostRow.v_Base_dHostRow_draiseToRow Base_dHostRow.v_Base_dHostRow_dhostRow) ((fun dtio_0 -> Base_dEff.C_Base_dEff_dEff_MkEff (fun (_ : Base_dEff.t_Base_dEff_dEffUnit) -> dtp_isDirectory dtio_0)) path))) (fun isDir -> (if isDir then ((v_Vuna_dCompiler_dDriver_dCompilerCli_dcheckPkgDir path) o) else ((v_Vuna_dCompiler_dDriver_dCompilerCli_dcheckFileEntry path) o)))) else ((v_Vuna_dCompiler_dDriver_dCompilerCli_dwithOpts o) (v_Vuna_dCompiler_dDriver_dCompilerCli_ddtPathErr path))))))

# 704 "Vuna/Compiler/Driver/CompilerCli.vuna"
let rec v_Vuna_dCompiler_dDriver_dCompilerCli_dcheckArgs = (fun mc0 mc1 mc2 -> (match mc1 with
  | Base_dList.C_Base_dList_dList_Cons (dtb__168, dtb__169) -> (if (dtb__168 = "--release") then (((v_Vuna_dCompiler_dDriver_dCompilerCli_dcheckArgs mc0) dtb__169) (v_Vuna_dCompiler_dDriver_dCompilerCli_dmarkRelease mc2)) else (if ((Base_dString.v_Base_dString_dstartsWith "-") dtb__168) then ((v_Vuna_dCompiler_dDriver_dCompilerCli_dwithOpts mc2) ((v_Vuna_dCompiler_dDriver_dCompilerCli_dremovedFlag mc0) dtb__168)) else (match dtb__169 with
  | Base_dList.C_Base_dList_dList_Nil -> ((v_Vuna_dCompiler_dDriver_dCompilerCli_dcheckEmit dtb__168) mc2)
  | _ -> ((v_Vuna_dCompiler_dDriver_dCompilerCli_dwithOpts mc2) (v_Vuna_dCompiler_dDriver_dCompilerCli_dusageErr mc0))
)))
  | Base_dList.C_Base_dList_dList_Nil -> ((v_Vuna_dCompiler_dDriver_dCompilerCli_dwithOpts mc2) (v_Vuna_dCompiler_dDriver_dCompilerCli_dusageErr mc0))
  | _ -> failwith "DT: impossible branch"
))

# 430 "Vuna/Compiler/Driver/CompilerCli.vuna"
let v_Vuna_dCompiler_dDriver_dCompilerCli_drunCompilerCliFor1 = (fun prog args o -> (match args with
  | Base_dList.C_Base_dList_dList_Nil -> ((v_Vuna_dCompiler_dDriver_dCompilerCli_dwithOpts o) (v_Vuna_dCompiler_dDriver_dCompilerCli_dusageErr prog))
  | Base_dList.C_Base_dList_dList_Cons (dtb__170, dtb__171) -> (if (dtb__170 = "compile") then (((v_Vuna_dCompiler_dDriver_dCompilerCli_dcompileArgs prog) dtb__171) o) else (if (dtb__170 = "check") then (((v_Vuna_dCompiler_dDriver_dCompilerCli_dcheckArgs prog) dtb__171) o) else (if (dtb__170 = "build") then (((v_Vuna_dCompiler_dDriver_dCompilerCli_dbuildArgs prog) dtb__171) o) else (if (dtb__170 = "version") then ((v_Vuna_dCompiler_dDriver_dCompilerCli_dwithOpts o) (v_Vuna_dCompiler_dDriver_dCompilerCli_dprintVersion 0)) else (if (dtb__170 = "--version") then ((v_Vuna_dCompiler_dDriver_dCompilerCli_dwithOpts o) (v_Vuna_dCompiler_dDriver_dCompilerCli_dprintVersion 0)) else (if (dtb__170 = "seed") then ((v_Vuna_dCompiler_dDriver_dCompilerCli_dwithOpts o) (((v_Vuna_dCompiler_dDriver_dCompilerCli_dremovedCommand prog) "seed") "use `build --out OUT [DIR]` or `compile DIR OUT`")) else (if (dtb__170 = "help") then ((v_Vuna_dCompiler_dDriver_dCompilerCli_dwithOpts o) (v_Vuna_dCompiler_dDriver_dCompilerCli_dhelpFor prog)) else (if ((Base_dString.v_Base_dString_dstartsWith "-") dtb__170) then ((v_Vuna_dCompiler_dDriver_dCompilerCli_dwithOpts o) ((v_Vuna_dCompiler_dDriver_dCompilerCli_dremovedFlag prog) dtb__170)) else ((v_Vuna_dCompiler_dDriver_dCompilerCli_dwithOpts o) ((v_Vuna_dCompiler_dDriver_dCompilerCli_dunknownCommand prog) dtb__170))))))))))
  | _ -> failwith "DT: impossible branch"
))

# 374 "Vuna/Compiler/Driver/CompilerCli.vuna"
let v_Vuna_dCompiler_dDriver_dCompilerCli_drunCompilerCliFor = (fun prog args -> (((Base_dMonad.v_Base_dMonad_dbind Base_dEff.v_Monad_uBase_uEff_uEff_ur) ((Base_dHostRow.v_Base_dHostRow_draiseToRow Base_dHostRow.v_Base_dHostRow_dhostRow) ((fun dtio_0 -> Base_dEff.C_Base_dEff_dEff_MkEff (fun (_ : Base_dEff.t_Base_dEff_dEffUnit) -> dtp_getenv dtio_0)) "VUNA_RELEASE"))) (fun envRel -> (((Base_dMonad.v_Base_dMonad_dbind Base_dEff.v_Monad_uBase_uEff_uEff_ur) v_Vuna_dCompiler_dDriver_dCompilerCli_dstdoutIsTty) (fun tty -> ((fun stripped -> ((fun strippedLang -> ((fun strippedMax -> ((fun kept -> ((fun strippedContinue -> ((fun detectedLang -> ((fun fmt -> ((fun opts -> (if (v_Vuna_dCompiler_dDriver_dCompilerCli_danyHelp (Base_dPair.v_Base_dPair_dfirstOf strippedContinue)) then (v_Vuna_dCompiler_dDriver_dCompilerCli_dhelpFor prog) else (((Base_dMonad.v_Base_dMonad_dbind Base_dEff.v_Monad_uBase_uEff_uEff_ur) (((v_Vuna_dCompiler_dDriver_dCompilerCli_drunCompilerCliFor1 prog) (v_Vuna_dCompiler_dDriver_dCompilerCli_dstripFailFast (v_Vuna_dCompiler_dDriver_dCompilerCli_dstripWithSources (v_Vuna_dCompiler_dDriver_dCompilerCli_dstripShowCascade (Base_dPair.v_Base_dPair_dfirstOf strippedContinue))))) opts)) (fun r -> ((v_Vuna_dCompiler_dDriver_dCompilerCli_dflushSarif (Base_dPair.v_Base_dPair_dfirstOf r)) (Base_dPair.v_Base_dPair_dsecondOf r)))))) { f_Vuna_dCompiler_dDriver_dCompilerCli_dCliOpts_optDiagFormat = fmt; f_Vuna_dCompiler_dDriver_dCompilerCli_dCliOpts_optDiagLang = detectedLang; f_Vuna_dCompiler_dDriver_dCompilerCli_dCliOpts_optLangExplicit = (v_Vuna_dCompiler_dDriver_dCompilerCli_dhasLangFlag args); f_Vuna_dCompiler_dDriver_dCompilerCli_dCliOpts_optDenyWarnings = (v_Vuna_dCompiler_dDriver_dCompilerCli_dhasDenyWarnings args); f_Vuna_dCompiler_dDriver_dCompilerCli_dCliOpts_optShowWarnings = (if (v_Vuna_dCompiler_dDriver_dCompilerCli_dhasDenyWarnings args) then true else (v_Vuna_dCompiler_dDriver_dCompilerCli_dhasShowWarnings args)); f_Vuna_dCompiler_dDriver_dCompilerCli_dCliOpts_optFormatExplicit = (v_Vuna_dCompiler_dDriver_dCompilerCli_dhasFormatFlag args); f_Vuna_dCompiler_dDriver_dCompilerCli_dCliOpts_optWarningsExplicit = (if (v_Vuna_dCompiler_dDriver_dCompilerCli_dhasDenyWarnings args) then true else (v_Vuna_dCompiler_dDriver_dCompilerCli_dhasShowWarnings args)); f_Vuna_dCompiler_dDriver_dCompilerCli_dCliOpts_optDenyExplicit = (v_Vuna_dCompiler_dDriver_dCompilerCli_dhasDenyWarnings args); f_Vuna_dCompiler_dDriver_dCompilerCli_dCliOpts_optMaxErrors = (Base_dPair.v_Base_dPair_dsecondOf strippedMax); f_Vuna_dCompiler_dDriver_dCompilerCli_dCliOpts_optContinueOnError = (Base_dPair.v_Base_dPair_dsecondOf strippedContinue); f_Vuna_dCompiler_dDriver_dCompilerCli_dCliOpts_optSarifItems = Base_dList.C_Base_dList_dList_Nil; f_Vuna_dCompiler_dDriver_dCompilerCli_dCliOpts_optRelease = (envRel = "1"); f_Vuna_dCompiler_dDriver_dCompilerCli_dCliOpts_optShowCascade = (v_Vuna_dCompiler_dDriver_dCompilerCli_dhasShowCascade args); f_Vuna_dCompiler_dDriver_dCompilerCli_dCliOpts_optWithSources = (v_Vuna_dCompiler_dDriver_dCompilerCli_dhasWithSources args); f_Vuna_dCompiler_dDriver_dCompilerCli_dCliOpts_optFailFast = (v_Vuna_dCompiler_dDriver_dCompilerCli_dhasFailFast args); f_Vuna_dCompiler_dDriver_dCompilerCli_dCliOpts_optTarget = "ocaml" })) (match (Base_dPair.v_Base_dPair_dsecondOf stripped) with
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Just (dtb__172) -> dtb__172
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing -> (if (detectedLang = "en") then (if tty then "human" else "short") else "human")
  | _ -> failwith "DT: impossible branch"
))) (Base_dPair.v_Base_dPair_dsecondOf strippedLang))) (v_Vuna_dCompiler_dDriver_dCompilerCli_dstripContinueOnError kept))) (v_Vuna_dCompiler_dDriver_dCompilerCli_dstripDenyWarnings (Base_dPair.v_Base_dPair_dfirstOf strippedMax)))) (v_Vuna_dCompiler_dDriver_dCompilerCli_dstripMaxErrors (Base_dPair.v_Base_dPair_dfirstOf strippedLang)))) (v_Vuna_dCompiler_dDriver_dCompilerCli_dstripLang (Base_dPair.v_Base_dPair_dfirstOf stripped)))) (v_Vuna_dCompiler_dDriver_dCompilerCli_dstripDiagFormat args)))))))

# 58 "Vuna/Compiler/Driver/CompilerCli.vuna"
let v_Vuna_dCompiler_dDriver_dCompilerCli_drunCompilerCli = (fun args -> ((v_Vuna_dCompiler_dDriver_dCompilerCli_drunCompilerCliFor "vuna-compiler") args))
