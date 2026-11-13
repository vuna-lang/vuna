open Vuna_runtime
type t_Vuna_dCompiler_dDriver_dCompilerCli_dCliOpts = { f_Vuna_dCompiler_dDriver_dCompilerCli_dCliOpts_optDiagFormat : string; f_Vuna_dCompiler_dDriver_dCompilerCli_dCliOpts_optDiagLang : string; f_Vuna_dCompiler_dDriver_dCompilerCli_dCliOpts_optLangExplicit : bool; f_Vuna_dCompiler_dDriver_dCompilerCli_dCliOpts_optDenyWarnings : bool; f_Vuna_dCompiler_dDriver_dCompilerCli_dCliOpts_optShowWarnings : bool; f_Vuna_dCompiler_dDriver_dCompilerCli_dCliOpts_optFormatExplicit : bool; f_Vuna_dCompiler_dDriver_dCompilerCli_dCliOpts_optWarningsExplicit : bool; f_Vuna_dCompiler_dDriver_dCompilerCli_dCliOpts_optDenyExplicit : bool; f_Vuna_dCompiler_dDriver_dCompilerCli_dCliOpts_optMaxErrors : int; f_Vuna_dCompiler_dDriver_dCompilerCli_dCliOpts_optContinueOnError : bool; f_Vuna_dCompiler_dDriver_dCompilerCli_dCliOpts_optSarifItems : Vuna_dCompiler_dDiag.t_Vuna_dCompiler_dDiag_dDiagnostic Base_dList.t_Base_dList_dList; f_Vuna_dCompiler_dDriver_dCompilerCli_dCliOpts_optRelease : bool }

let v_Vuna_dCompiler_dDriver_dCompilerCli_dcompilerUsageLines = (fun prog -> (String.concat "" ["  "; prog; " compile [--no-print] [--release] (<entry.vuna> | <package-dir>) <out-dir>\n  "; prog; " check [--release] [--continue-on-error] (<file.vuna> | <package-dir>)\n  <file.vuna>                   \229\184\166 module \229\164\180 \226\134\146 \230\140\137\229\186\147\230\168\161\229\157\151\230\163\128\230\159\165\239\188\136\229\140\133\228\184\138\228\184\139\230\150\135\239\188\137\239\188\155\230\151\160\229\164\180 \226\134\146 \229\133\165\229\143\163\230\150\135\228\187\182\n  "; prog; " build [--release] [--no-compile] [--out DIR] [--package NAME] [DIR]\n  --no-print                    compile \231\148\159\230\136\144\231\154\132\231\168\139\229\186\143\228\184\141\230\137\147\229\141\176 main \231\187\147\230\158\156\239\188\136\233\187\152\232\174\164\230\137\147\229\141\176\239\188\137\n  --release                     release \230\158\132\229\187\186\239\188\154\230\139\146\231\187\157 assert / todo \231\173\137 debug \228\184\147\231\148\168\230\158\132\233\128\160\n  --continue-on-error           best-effort \229\164\154\233\148\153\232\175\175\239\188\154\233\128\144\230\172\161\231\167\187\233\153\164\229\164\177\232\180\165\229\163\176\230\152\142\229\144\142\231\187\167\231\187\173\239\188\136\228\187\133\229\133\165\229\143\163\230\150\135\228\187\182\239\188\137\n  "; prog; " version, --version          \230\152\190\231\164\186\231\137\136\230\156\172\n  "; prog; " help, -h\n"]))

let v_Vuna_dCompiler_dDriver_dCompilerCli_dcompilerUsage = (fun prog -> ("usage:\n" ^ (v_Vuna_dCompiler_dDriver_dCompilerCli_dcompilerUsageLines prog)))

let rec v_Vuna_dCompiler_dDriver_dCompilerCli_dmapEff = (fun mc0 mc1 -> (match mc1 with
  | Base_dList.C_Base_dList_dList_Cons (dtb__0, dtb__1) -> (((Base_dMonad.v_Base_dMonad_dbind Base_dEff.v_Monad_uBase_uEff_uEff_ur) (mc0 dtb__0)) (fun y -> (((Base_dMonad.v_Base_dMonad_dbind Base_dEff.v_Monad_uBase_uEff_uEff_ur) ((v_Vuna_dCompiler_dDriver_dCompilerCli_dmapEff mc0) dtb__1)) (fun ys -> ((Base_dApplicative.v_Base_dApplicative_dpure Base_dEff.v_Applicative_uBase_uEff_uEff_ur) (Base_dList.C_Base_dList_dList_Cons (y, ys)))))))
  | Base_dList.C_Base_dList_dList_Nil -> ((Base_dApplicative.v_Base_dApplicative_dpure Base_dEff.v_Applicative_uBase_uEff_uEff_ur) Base_dList.C_Base_dList_dList_Nil)
  | _ -> failwith "DT: impossible branch"
))

let v_Vuna_dCompiler_dDriver_dCompilerCli_ddefaultCliOpts = { f_Vuna_dCompiler_dDriver_dCompilerCli_dCliOpts_optDiagFormat = "short"; f_Vuna_dCompiler_dDriver_dCompilerCli_dCliOpts_optDiagLang = "en"; f_Vuna_dCompiler_dDriver_dCompilerCli_dCliOpts_optLangExplicit = false; f_Vuna_dCompiler_dDriver_dCompilerCli_dCliOpts_optDenyWarnings = false; f_Vuna_dCompiler_dDriver_dCompilerCli_dCliOpts_optShowWarnings = false; f_Vuna_dCompiler_dDriver_dCompilerCli_dCliOpts_optFormatExplicit = false; f_Vuna_dCompiler_dDriver_dCompilerCli_dCliOpts_optWarningsExplicit = false; f_Vuna_dCompiler_dDriver_dCompilerCli_dCliOpts_optDenyExplicit = false; f_Vuna_dCompiler_dDriver_dCompilerCli_dCliOpts_optMaxErrors = 0; f_Vuna_dCompiler_dDriver_dCompilerCli_dCliOpts_optContinueOnError = false; f_Vuna_dCompiler_dDriver_dCompilerCli_dCliOpts_optSarifItems = Base_dList.C_Base_dList_dList_Nil; f_Vuna_dCompiler_dDriver_dCompilerCli_dCliOpts_optRelease = false }

let v_Vuna_dCompiler_dDriver_dCompilerCli_dmarkRelease = (fun o -> { o with f_Vuna_dCompiler_dDriver_dCompilerCli_dCliOpts_optRelease = true })

let v_Vuna_dCompiler_dDriver_dCompilerCli_dwithOpts = (fun o m -> (((Base_dMonad.v_Base_dMonad_dbind Base_dEff.v_Monad_uBase_uEff_uEff_ur) m) (fun code -> ((Base_dApplicative.v_Base_dApplicative_dpure Base_dEff.v_Applicative_uBase_uEff_uEff_ur) { Base_dPair.f_Base_dPair_dPair_first = code; Base_dPair.f_Base_dPair_dPair_second = o }))))

let v_Vuna_dCompiler_dDriver_dCompilerCli_ddiagExitFor = (fun d -> (if (d).Vuna_dCompiler_dDiag.f_Vuna_dCompiler_dDiag_dDiagnostic_diagInternal then 70 else (match (d).Vuna_dCompiler_dDiag.f_Vuna_dCompiler_dDiag_dDiagnostic_diagSeverity with
  | Vuna_dCompiler_dDiag.C_Vuna_dCompiler_dDiag_dSeverity_SevError -> 1
  | _ -> 0
)))

let v_Vuna_dCompiler_dDriver_dCompilerCli_dapplyManifestOpts = (fun mc0 mc1 -> (match mc0 with
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Just (dtb__2) -> ((fun man -> ((fun fmt0 -> ((fun lang -> ((fun fmt -> ((fun showW -> ((fun deny -> ((fun showW2 -> ((fun maxE -> { f_Vuna_dCompiler_dDriver_dCompilerCli_dCliOpts_optDiagFormat = fmt; f_Vuna_dCompiler_dDriver_dCompilerCli_dCliOpts_optDiagLang = lang; f_Vuna_dCompiler_dDriver_dCompilerCli_dCliOpts_optLangExplicit = (mc1).f_Vuna_dCompiler_dDriver_dCompilerCli_dCliOpts_optLangExplicit; f_Vuna_dCompiler_dDriver_dCompilerCli_dCliOpts_optDenyWarnings = deny; f_Vuna_dCompiler_dDriver_dCompilerCli_dCliOpts_optShowWarnings = showW2; f_Vuna_dCompiler_dDriver_dCompilerCli_dCliOpts_optFormatExplicit = (mc1).f_Vuna_dCompiler_dDriver_dCompilerCli_dCliOpts_optFormatExplicit; f_Vuna_dCompiler_dDriver_dCompilerCli_dCliOpts_optWarningsExplicit = (mc1).f_Vuna_dCompiler_dDriver_dCompilerCli_dCliOpts_optWarningsExplicit; f_Vuna_dCompiler_dDriver_dCompilerCli_dCliOpts_optDenyExplicit = (mc1).f_Vuna_dCompiler_dDriver_dCompilerCli_dCliOpts_optDenyExplicit; f_Vuna_dCompiler_dDriver_dCompilerCli_dCliOpts_optMaxErrors = maxE; f_Vuna_dCompiler_dDriver_dCompilerCli_dCliOpts_optContinueOnError = (mc1).f_Vuna_dCompiler_dDriver_dCompilerCli_dCliOpts_optContinueOnError; f_Vuna_dCompiler_dDriver_dCompilerCli_dCliOpts_optSarifItems = (mc1).f_Vuna_dCompiler_dDriver_dCompilerCli_dCliOpts_optSarifItems; f_Vuna_dCompiler_dDriver_dCompilerCli_dCliOpts_optRelease = (mc1).f_Vuna_dCompiler_dDriver_dCompilerCli_dCliOpts_optRelease }) (match (man).Vuna_dCompiler_dFrontend_dManifest.f_Vuna_dCompiler_dFrontend_dManifest_dManifest_manifestDiagMaxErrors with
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

let v_Vuna_dCompiler_dDriver_dCompilerCli_dapplyDiagConfig = (fun m o -> ((v_Vuna_dCompiler_dDriver_dCompilerCli_dapplyManifestOpts m) o))

let rec v_Vuna_dCompiler_dDriver_dCompilerCli_dtakeDiagsGo = (fun mc0 mc1 -> (match mc1 with
  | Base_dList.C_Base_dList_dList_Cons (dtb__8, dtb__9) -> (if (mc0 <= 0) then Base_dList.C_Base_dList_dList_Nil else (Base_dList.C_Base_dList_dList_Cons (dtb__8, ((v_Vuna_dCompiler_dDriver_dCompilerCli_dtakeDiagsGo (mc0 - 1)) dtb__9))))
  | Base_dList.C_Base_dList_dList_Nil -> Base_dList.C_Base_dList_dList_Nil
  | _ -> failwith "DT: impossible branch"
))

let v_Vuna_dCompiler_dDriver_dCompilerCli_dtakeDiags = (fun n ds -> (if (n <= 0) then ds else ((v_Vuna_dCompiler_dDriver_dCompilerCli_dtakeDiagsGo n) ds)))

let v_Vuna_dCompiler_dDriver_dCompilerCli_dflushSarif = (fun code o -> ((fun shown -> (if ((o).f_Vuna_dCompiler_dDriver_dCompilerCli_dCliOpts_optDiagFormat = "sarif") then (((Base_dMonad.v_Base_dMonad_dbind Base_dEff.v_Monad_uBase_uEff_uEff_ur) ((Base_dHostRow.v_Base_dHostRow_draiseToRow Base_dHostRow.v_Base_dHostRow_dhostRow) ((fun dtio_0 -> Base_dEff.C_Base_dEff_dEff_MkEff (fun (_ : Base_dEff.t_Base_dEff_dEffUnit) -> dtp_print dtio_0)) ((Vuna_dCompiler_dDiag_dFormat.v_Vuna_dCompiler_dDiag_dFormat_drenderSarif shown) ^ "\n")))) (fun _u -> ((Base_dApplicative.v_Base_dApplicative_dpure Base_dEff.v_Applicative_uBase_uEff_uEff_ur) code))) else (if ((o).f_Vuna_dCompiler_dDriver_dCompilerCli_dCliOpts_optDiagFormat = "json") then (((Base_dMonad.v_Base_dMonad_dbind Base_dEff.v_Monad_uBase_uEff_uEff_ur) ((Base_dHostRow.v_Base_dHostRow_draiseToRow Base_dHostRow.v_Base_dHostRow_dhostRow) ((fun dtio_0 -> Base_dEff.C_Base_dEff_dEff_MkEff (fun (_ : Base_dEff.t_Base_dEff_dEffUnit) -> dtp_print dtio_0)) (((Vuna_dCompiler_dDiag_dFormat.v_Vuna_dCompiler_dDiag_dFormat_drenderJsonList (o).f_Vuna_dCompiler_dDriver_dCompilerCli_dCliOpts_optDiagLang) shown) ^ "\n")))) (fun _u -> ((Base_dApplicative.v_Base_dApplicative_dpure Base_dEff.v_Applicative_uBase_uEff_uEff_ur) code))) else ((Base_dApplicative.v_Base_dApplicative_dpure Base_dEff.v_Applicative_uBase_uEff_uEff_ur) code)))) ((v_Vuna_dCompiler_dDriver_dCompilerCli_dtakeDiags (o).f_Vuna_dCompiler_dDriver_dCompilerCli_dCliOpts_optMaxErrors) (o).f_Vuna_dCompiler_dDriver_dCompilerCli_dCliOpts_optSarifItems)))

let rec v_Vuna_dCompiler_dDriver_dCompilerCli_dstripDenyWarnings = (fun mc0 -> (match mc0 with
  | Base_dList.C_Base_dList_dList_Cons (dtb__10, dtb__11) -> (if (if (if (dtb__10 = "--deny-warnings") then true else (dtb__10 = "--warnings")) then true else (dtb__10 = "-W")) then (v_Vuna_dCompiler_dDriver_dCompilerCli_dstripDenyWarnings dtb__11) else (Base_dList.C_Base_dList_dList_Cons (dtb__10, (v_Vuna_dCompiler_dDriver_dCompilerCli_dstripDenyWarnings dtb__11))))
  | Base_dList.C_Base_dList_dList_Nil -> Base_dList.C_Base_dList_dList_Nil
  | _ -> failwith "DT: impossible branch"
))

let rec v_Vuna_dCompiler_dDriver_dCompilerCli_dhasDenyWarnings = (fun mc0 -> (match mc0 with
  | Base_dList.C_Base_dList_dList_Cons (dtb__12, dtb__13) -> (if (dtb__12 = "--deny-warnings") then true else (v_Vuna_dCompiler_dDriver_dCompilerCli_dhasDenyWarnings dtb__13))
  | Base_dList.C_Base_dList_dList_Nil -> false
  | _ -> failwith "DT: impossible branch"
))

let rec v_Vuna_dCompiler_dDriver_dCompilerCli_dhasShowWarnings = (fun mc0 -> (match mc0 with
  | Base_dList.C_Base_dList_dList_Cons (dtb__14, dtb__15) -> (if (if (dtb__14 = "--warnings") then true else (dtb__14 = "-W")) then true else (v_Vuna_dCompiler_dDriver_dCompilerCli_dhasShowWarnings dtb__15))
  | Base_dList.C_Base_dList_dList_Nil -> false
  | _ -> failwith "DT: impossible branch"
))

let rec v_Vuna_dCompiler_dDriver_dCompilerCli_dhasFormatFlag = (fun mc0 -> (match mc0 with
  | Base_dList.C_Base_dList_dList_Cons (dtb__16, dtb__17) -> (if (if (if (dtb__16 = "--json") then true else ((Base_dString.v_Base_dString_dstartsWith "--error-format") dtb__16)) then true else ((Base_dString.v_Base_dString_dstartsWith "--message-format") dtb__16)) then true else (v_Vuna_dCompiler_dDriver_dCompilerCli_dhasFormatFlag dtb__17))
  | Base_dList.C_Base_dList_dList_Nil -> false
  | _ -> failwith "DT: impossible branch"
))

let rec v_Vuna_dCompiler_dDriver_dCompilerCli_dstripDiagFormatGo = (fun mc0 mc1 mc2 -> (match mc0 with
  | Base_dList.C_Base_dList_dList_Cons (dtb__18, dtb__19) -> (if (dtb__18 = "--json") then (((v_Vuna_dCompiler_dDriver_dCompilerCli_dstripDiagFormatGo dtb__19) mc1) (Base_dMaybe.C_Base_dMaybe_dMaybe_Just ("json"))) else (if (dtb__18 = "--error-format") then (match dtb__19 with
  | Base_dList.C_Base_dList_dList_Cons (dtb__20, dtb__21) -> (((v_Vuna_dCompiler_dDriver_dCompilerCli_dstripDiagFormatGo dtb__21) mc1) (Base_dMaybe.C_Base_dMaybe_dMaybe_Just (dtb__20)))
  | Base_dList.C_Base_dList_dList_Nil -> { Base_dPair.f_Base_dPair_dPair_first = (Base_dList.v_Base_dList_dreverse mc1); Base_dPair.f_Base_dPair_dPair_second = (Base_dMaybe.C_Base_dMaybe_dMaybe_Just ("short")) }
  | _ -> failwith "DT: impossible branch"
) else (if ((Base_dString.v_Base_dString_dstartsWith "--error-format=") dtb__18) then (((v_Vuna_dCompiler_dDriver_dCompilerCli_dstripDiagFormatGo dtb__19) mc1) (Base_dMaybe.C_Base_dMaybe_dMaybe_Just ((((Base_dString.v_Base_dString_dsubstring (bi_natFromInt 15)) (bi_natFromInt ((bi_strLength dtb__18) - 15))) dtb__18)))) else (if ((Base_dString.v_Base_dString_dstartsWith "--message-format=") dtb__18) then (((v_Vuna_dCompiler_dDriver_dCompilerCli_dstripDiagFormatGo dtb__19) mc1) (Base_dMaybe.C_Base_dMaybe_dMaybe_Just ((((Base_dString.v_Base_dString_dsubstring (bi_natFromInt 17)) (bi_natFromInt ((bi_strLength dtb__18) - 17))) dtb__18)))) else (((v_Vuna_dCompiler_dDriver_dCompilerCli_dstripDiagFormatGo dtb__19) (Base_dList.C_Base_dList_dList_Cons (dtb__18, mc1))) mc2)))))
  | Base_dList.C_Base_dList_dList_Nil -> { Base_dPair.f_Base_dPair_dPair_first = (Base_dList.v_Base_dList_dreverse mc1); Base_dPair.f_Base_dPair_dPair_second = mc2 }
  | _ -> failwith "DT: impossible branch"
))

let v_Vuna_dCompiler_dDriver_dCompilerCli_dstripDiagFormat = (fun args -> (((v_Vuna_dCompiler_dDriver_dCompilerCli_dstripDiagFormatGo args) Base_dList.C_Base_dList_dList_Nil) Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing))

let rec v_Vuna_dCompiler_dDriver_dCompilerCli_dparseIntChars = (fun mc0 mc1 mc2 mc3 -> (match mc0 with
  | Base_dList.C_Base_dList_dList_Cons (dtb__22, dtb__23) -> (if (if (dtb__22 >= 48) then (dtb__22 <= 57) else false) then ((((v_Vuna_dCompiler_dDriver_dCompilerCli_dparseIntChars dtb__23) ((mc1 * 10) + (dtb__22 - 48))) (mc2 + 1)) mc3) else (if (mc2 = 0) then mc3 else mc1))
  | Base_dList.C_Base_dList_dList_Nil -> (if (mc2 = 0) then mc3 else mc1)
  | _ -> failwith "DT: impossible branch"
))

let v_Vuna_dCompiler_dDriver_dCompilerCli_dparseIntOr = (fun s fallback -> ((((v_Vuna_dCompiler_dDriver_dCompilerCli_dparseIntChars (Base_dList.dtp_unpack s)) 0) 0) fallback))

let rec v_Vuna_dCompiler_dDriver_dCompilerCli_dstripMaxErrorsGo = (fun mc0 mc1 mc2 -> (match mc0 with
  | Base_dList.C_Base_dList_dList_Cons (dtb__24, dtb__25) -> (if (dtb__24 = "--max-errors") then (match dtb__25 with
  | Base_dList.C_Base_dList_dList_Cons (dtb__26, dtb__27) -> (((v_Vuna_dCompiler_dDriver_dCompilerCli_dstripMaxErrorsGo dtb__27) mc1) ((v_Vuna_dCompiler_dDriver_dCompilerCli_dparseIntOr dtb__26) mc2))
  | Base_dList.C_Base_dList_dList_Nil -> { Base_dPair.f_Base_dPair_dPair_first = (Base_dList.v_Base_dList_dreverse mc1); Base_dPair.f_Base_dPair_dPair_second = mc2 }
  | _ -> failwith "DT: impossible branch"
) else (if ((Base_dString.v_Base_dString_dstartsWith "--max-errors=") dtb__24) then (((v_Vuna_dCompiler_dDriver_dCompilerCli_dstripMaxErrorsGo dtb__25) mc1) ((v_Vuna_dCompiler_dDriver_dCompilerCli_dparseIntOr (((Base_dString.v_Base_dString_dsubstring (bi_natFromInt 13)) (bi_natFromInt ((bi_strLength dtb__24) - 13))) dtb__24)) mc2)) else (((v_Vuna_dCompiler_dDriver_dCompilerCli_dstripMaxErrorsGo dtb__25) (Base_dList.C_Base_dList_dList_Cons (dtb__24, mc1))) mc2)))
  | Base_dList.C_Base_dList_dList_Nil -> { Base_dPair.f_Base_dPair_dPair_first = (Base_dList.v_Base_dList_dreverse mc1); Base_dPair.f_Base_dPair_dPair_second = mc2 }
  | _ -> failwith "DT: impossible branch"
))

let v_Vuna_dCompiler_dDriver_dCompilerCli_dstripMaxErrors = (fun args -> (((v_Vuna_dCompiler_dDriver_dCompilerCli_dstripMaxErrorsGo args) Base_dList.C_Base_dList_dList_Nil) 0))

let v_Vuna_dCompiler_dDriver_dCompilerCli_dprintVersion = (fun _u -> (((Base_dMonad.v_Base_dMonad_dbind Base_dEff.v_Monad_uBase_uEff_uEff_ur) ((Base_dHostRow.v_Base_dHostRow_draiseToRow Base_dHostRow.v_Base_dHostRow_dhostRow) ((fun dtio_0 -> Base_dEff.C_Base_dEff_dEff_MkEff (fun (_ : Base_dEff.t_Base_dEff_dEffUnit) -> dtp_print dtio_0)) (String.concat "" ["vuna-compiler "; Vuna_dCompiler_dVersion.v_Vuna_dCompiler_dVersion_dvunaVersion; "\n"])))) (fun _u -> ((Base_dApplicative.v_Base_dApplicative_dpure Base_dEff.v_Applicative_uBase_uEff_uEff_ur) 0))))

let rec v_Vuna_dCompiler_dDriver_dCompilerCli_danyHelp = (fun mc0 -> (match mc0 with
  | Base_dList.C_Base_dList_dList_Cons (dtb__28, dtb__29) -> (if (if (dtb__28 = "-h") then true else (dtb__28 = "--help")) then true else (v_Vuna_dCompiler_dDriver_dCompilerCli_danyHelp dtb__29))
  | Base_dList.C_Base_dList_dList_Nil -> false
  | _ -> failwith "DT: impossible branch"
))

let v_Vuna_dCompiler_dDriver_dCompilerCli_dhelpFor = (fun prog -> (((Base_dMonad.v_Base_dMonad_dbind Base_dEff.v_Monad_uBase_uEff_uEff_ur) ((Base_dHostRow.v_Base_dHostRow_draiseToRow Base_dHostRow.v_Base_dHostRow_dhostRow) ((fun dtio_0 -> Base_dEff.C_Base_dEff_dEff_MkEff (fun (_ : Base_dEff.t_Base_dEff_dEffUnit) -> dtp_print dtio_0)) (v_Vuna_dCompiler_dDriver_dCompilerCli_dcompilerUsage prog)))) (fun _u -> ((Base_dApplicative.v_Base_dApplicative_dpure Base_dEff.v_Applicative_uBase_uEff_uEff_ur) 0))))

let v_Vuna_dCompiler_dDriver_dCompilerCli_dusageErr = (fun prog -> (((Base_dMonad.v_Base_dMonad_dbind Base_dEff.v_Monad_uBase_uEff_uEff_ur) ((Base_dHostRow.v_Base_dHostRow_draiseToRow Base_dHostRow.v_Base_dHostRow_dhostRow) ((fun dtio_0 -> Base_dEff.C_Base_dEff_dEff_MkEff (fun (_ : Base_dEff.t_Base_dEff_dEffUnit) -> dtp_print dtio_0)) (v_Vuna_dCompiler_dDriver_dCompilerCli_dcompilerUsage prog)))) (fun _u -> ((Base_dApplicative.v_Base_dApplicative_dpure Base_dEff.v_Applicative_uBase_uEff_uEff_ur) 2))))

let v_Vuna_dCompiler_dDriver_dCompilerCli_dunknownCommand = (fun prog arg -> (((Base_dMonad.v_Base_dMonad_dbind Base_dEff.v_Monad_uBase_uEff_uEff_ur) ((Base_dHostRow.v_Base_dHostRow_draiseToRow Base_dHostRow.v_Base_dHostRow_dhostRow) ((fun dtio_0 -> Base_dEff.C_Base_dEff_dEff_MkEff (fun (_ : Base_dEff.t_Base_dEff_dEffUnit) -> dtp_print dtio_0)) (String.concat "" ["error: unknown command `"; arg; "`\nrun `"; prog; " help` for the command list\n"])))) (fun _u -> ((Base_dApplicative.v_Base_dApplicative_dpure Base_dEff.v_Applicative_uBase_uEff_uEff_ur) 2))))

let v_Vuna_dCompiler_dDriver_dCompilerCli_dremovedCommand = (fun prog cmd hint -> (((Base_dMonad.v_Base_dMonad_dbind Base_dEff.v_Monad_uBase_uEff_uEff_ur) ((Base_dHostRow.v_Base_dHostRow_draiseToRow Base_dHostRow.v_Base_dHostRow_dhostRow) ((fun dtio_0 -> Base_dEff.C_Base_dEff_dEff_MkEff (fun (_ : Base_dEff.t_Base_dEff_dEffUnit) -> dtp_print dtio_0)) (String.concat "" ["error: `"; cmd; "` has been removed; "; hint; "\n"])))) (fun _u -> ((Base_dApplicative.v_Base_dApplicative_dpure Base_dEff.v_Applicative_uBase_uEff_uEff_ur) 2))))

let v_Vuna_dCompiler_dDriver_dCompilerCli_ddashFlag = (fun name -> ("--" ^ name))

let v_Vuna_dCompiler_dDriver_dCompilerCli_dremovedFlagHint = (fun flag -> (if (flag = (v_Vuna_dCompiler_dDriver_dCompilerCli_ddashFlag "dt")) then (Base_dMaybe.C_Base_dMaybe_dMaybe_Just ("DT is the only path; drop the flag")) else (if (flag = (v_Vuna_dCompiler_dDriver_dCompilerCli_ddashFlag "package")) then (Base_dMaybe.C_Base_dMaybe_dMaybe_Just ("use `build` or `compile`")) else (if (flag = (v_Vuna_dCompiler_dDriver_dCompilerCli_ddashFlag "split")) then (Base_dMaybe.C_Base_dMaybe_dMaybe_Just ("split is the only output model; use `build --out OUT [DIR]` or `compile <pkg-dir> OUT`")) else (if (flag = (v_Vuna_dCompiler_dDriver_dCompilerCli_ddashFlag "root")) then (Base_dMaybe.C_Base_dMaybe_dMaybe_Just ("module resolution is decided by the nearest vuna.toml; set VUNA_BASE for standalone files")) else (if (flag = (v_Vuna_dCompiler_dDriver_dCompilerCli_ddashFlag "out")) then (Base_dMaybe.C_Base_dMaybe_dMaybe_Just ("pass OUTDIR positionally to `compile`; `build` accepts --out DIR")) else (if (flag = (v_Vuna_dCompiler_dDriver_dCompilerCli_ddashFlag "no-typecheck")) then (Base_dMaybe.C_Base_dMaybe_dMaybe_Just ("checking is always enabled")) else (if (flag = (v_Vuna_dCompiler_dDriver_dCompilerCli_ddashFlag "typecheck")) then (Base_dMaybe.C_Base_dMaybe_dMaybe_Just ("checking is always enabled")) else (if (flag = (v_Vuna_dCompiler_dDriver_dCompilerCli_ddashFlag "typed")) then (Base_dMaybe.C_Base_dMaybe_dMaybe_Just ("DT is the only path")) else Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing)))))))))

let v_Vuna_dCompiler_dDriver_dCompilerCli_dremovedFlag = (fun prog flag -> (match (v_Vuna_dCompiler_dDriver_dCompilerCli_dremovedFlagHint flag) with
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing -> (v_Vuna_dCompiler_dDriver_dCompilerCli_dusageErr prog)
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Just (dtb__30) -> (((Base_dMonad.v_Base_dMonad_dbind Base_dEff.v_Monad_uBase_uEff_uEff_ur) ((Base_dHostRow.v_Base_dHostRow_draiseToRow Base_dHostRow.v_Base_dHostRow_dhostRow) ((fun dtio_0 -> Base_dEff.C_Base_dEff_dEff_MkEff (fun (_ : Base_dEff.t_Base_dEff_dEffUnit) -> dtp_print dtio_0)) (String.concat "" ["error: "; flag; " has been removed; "; dtb__30; "\n"])))) (fun _u -> ((Base_dApplicative.v_Base_dApplicative_dpure Base_dEff.v_Applicative_uBase_uEff_uEff_ur) 2)))
  | _ -> failwith "DT: impossible branch"
))

let v_Vuna_dCompiler_dDriver_dCompilerCli_dprintErrText = (fun e -> (((Base_dMonad.v_Base_dMonad_dbind Base_dEff.v_Monad_uBase_uEff_uEff_ur) (Vuna_dCompiler_dDriver_dDiagRender.v_Vuna_dCompiler_dDriver_dDiagRender_drenderCliDiagnosticEff e)) (fun rendered -> (((Base_dMonad.v_Base_dMonad_dbind Base_dEff.v_Monad_uBase_uEff_uEff_ur) ((Base_dHostRow.v_Base_dHostRow_draiseToRow Base_dHostRow.v_Base_dHostRow_dhostRow) ((fun dtio_0 -> Base_dEff.C_Base_dEff_dEff_MkEff (fun (_ : Base_dEff.t_Base_dEff_dEffUnit) -> dtp_print dtio_0)) rendered))) (fun _u -> ((Base_dApplicative.v_Base_dApplicative_dpure Base_dEff.v_Applicative_uBase_uEff_uEff_ur) 1))))))

let v_Vuna_dCompiler_dDriver_dCompilerCli_dseverityLabelOf = (fun d -> (match (d).Vuna_dCompiler_dDiag.f_Vuna_dCompiler_dDiag_dDiagnostic_diagSeverity with
  | Vuna_dCompiler_dDiag.C_Vuna_dCompiler_dDiag_dSeverity_SevError -> "error"
  | Vuna_dCompiler_dDiag.C_Vuna_dCompiler_dDiag_dSeverity_SevWarning -> "warning"
  | Vuna_dCompiler_dDiag.C_Vuna_dCompiler_dDiag_dSeverity_SevNote -> "note"
  | Vuna_dCompiler_dDiag.C_Vuna_dCompiler_dDiag_dSeverity_SevHelp -> "help"
  | _ -> failwith "DT: impossible branch"
))

let v_Vuna_dCompiler_dDriver_dCompilerCli_dcollectSarifIn = (fun o d -> { o with f_Vuna_dCompiler_dDriver_dCompilerCli_dCliOpts_optSarifItems = ((Base_dList.v_Base_dList_dappend (o).f_Vuna_dCompiler_dDriver_dCompilerCli_dCliOpts_optSarifItems) (Base_dList.C_Base_dList_dList_Cons (d, Base_dList.C_Base_dList_dList_Nil))) })

let v_Vuna_dCompiler_dDriver_dCompilerCli_demitDiag = (fun o extra d -> (if ((o).f_Vuna_dCompiler_dDriver_dCompilerCli_dCliOpts_optDiagFormat = "json") then ((Base_dApplicative.v_Base_dApplicative_dpure Base_dEff.v_Applicative_uBase_uEff_uEff_ur) { Base_dPair.f_Base_dPair_dPair_first = (v_Vuna_dCompiler_dDriver_dCompilerCli_ddiagExitFor d); Base_dPair.f_Base_dPair_dPair_second = ((v_Vuna_dCompiler_dDriver_dCompilerCli_dcollectSarifIn o) d) }) else (if ((o).f_Vuna_dCompiler_dDriver_dCompilerCli_dCliOpts_optDiagFormat = "human") then (((Base_dMonad.v_Base_dMonad_dbind Base_dEff.v_Monad_uBase_uEff_uEff_ur) ((Vuna_dCompiler_dDiag_dFormat.v_Vuna_dCompiler_dDiag_dFormat_drenderHuman (o).f_Vuna_dCompiler_dDriver_dCompilerCli_dCliOpts_optDiagLang) d)) (fun msg -> (((Base_dMonad.v_Base_dMonad_dbind Base_dEff.v_Monad_uBase_uEff_uEff_ur) (v_Vuna_dCompiler_dDriver_dCompilerCli_dprintErrText (msg ^ "\n"))) (fun _u -> ((Base_dApplicative.v_Base_dApplicative_dpure Base_dEff.v_Applicative_uBase_uEff_uEff_ur) { Base_dPair.f_Base_dPair_dPair_first = (v_Vuna_dCompiler_dDriver_dCompilerCli_ddiagExitFor d); Base_dPair.f_Base_dPair_dPair_second = o }))))) else (if ((o).f_Vuna_dCompiler_dDriver_dCompilerCli_dCliOpts_optDiagFormat = "sarif") then ((Base_dApplicative.v_Base_dApplicative_dpure Base_dEff.v_Applicative_uBase_uEff_uEff_ur) { Base_dPair.f_Base_dPair_dPair_first = (v_Vuna_dCompiler_dDriver_dCompilerCli_ddiagExitFor d); Base_dPair.f_Base_dPair_dPair_second = ((v_Vuna_dCompiler_dDriver_dCompilerCli_dcollectSarifIn o) d) }) else (((Base_dMonad.v_Base_dMonad_dbind Base_dEff.v_Monad_uBase_uEff_uEff_ur) (v_Vuna_dCompiler_dDriver_dCompilerCli_dprintErrText (String.concat "" [(v_Vuna_dCompiler_dDriver_dCompilerCli_dseverityLabelOf d); ": "; extra; (Vuna_dCompiler_dDiag_dFormat.v_Vuna_dCompiler_dDiag_dFormat_drenderShort d); "\n"]))) (fun _u -> ((Base_dApplicative.v_Base_dApplicative_dpure Base_dEff.v_Applicative_uBase_uEff_uEff_ur) { Base_dPair.f_Base_dPair_dPair_first = (v_Vuna_dCompiler_dDriver_dCompilerCli_ddiagExitFor d); Base_dPair.f_Base_dPair_dPair_second = o })))))))

let rec v_Vuna_dCompiler_dDriver_dCompilerCli_demitDiagRevSeq = (fun mc0 mc1 mc2 -> (match mc2 with
  | Base_dList.C_Base_dList_dList_Cons (dtb__31, dtb__32) -> (((Base_dMonad.v_Base_dMonad_dbind Base_dEff.v_Monad_uBase_uEff_uEff_ur) (((v_Vuna_dCompiler_dDriver_dCompilerCli_demitDiagRevSeq mc0) mc1) dtb__32)) (fun o1 -> (((Base_dMonad.v_Base_dMonad_dbind Base_dEff.v_Monad_uBase_uEff_uEff_ur) (((v_Vuna_dCompiler_dDriver_dCompilerCli_demitDiag o1) mc1) dtb__31)) (fun r -> ((Base_dApplicative.v_Base_dApplicative_dpure Base_dEff.v_Applicative_uBase_uEff_uEff_ur) (Base_dPair.v_Base_dPair_dsecondOf r))))))
  | Base_dList.C_Base_dList_dList_Nil -> ((Base_dApplicative.v_Base_dApplicative_dpure Base_dEff.v_Applicative_uBase_uEff_uEff_ur) mc0)
  | _ -> failwith "DT: impossible branch"
))

let v_Vuna_dCompiler_dDriver_dCompilerCli_dprintDiagWithPrefix = (fun o extra d -> (match (d).Vuna_dCompiler_dDiag.f_Vuna_dCompiler_dDiag_dDiagnostic_diagChildren with
  | Base_dList.C_Base_dList_dList_Nil -> (((v_Vuna_dCompiler_dDriver_dCompilerCli_demitDiag o) extra) d)
  | _ -> ((fun shown -> (((Base_dMonad.v_Base_dMonad_dbind Base_dEff.v_Monad_uBase_uEff_uEff_ur) (((v_Vuna_dCompiler_dDriver_dCompilerCli_demitDiagRevSeq o) extra) shown)) (fun o1 -> ((Base_dApplicative.v_Base_dApplicative_dpure Base_dEff.v_Applicative_uBase_uEff_uEff_ur) { Base_dPair.f_Base_dPair_dPair_first = (v_Vuna_dCompiler_dDriver_dCompilerCli_ddiagExitFor d); Base_dPair.f_Base_dPair_dPair_second = o1 })))) ((v_Vuna_dCompiler_dDriver_dCompilerCli_dtakeDiags (o).f_Vuna_dCompiler_dDriver_dCompilerCli_dCliOpts_optMaxErrors) (Base_dList.C_Base_dList_dList_Cons (d, (d).Vuna_dCompiler_dDiag.f_Vuna_dCompiler_dDiag_dDiagnostic_diagChildren))))
))

let v_Vuna_dCompiler_dDriver_dCompilerCli_dprintDiag = (fun o d -> (((v_Vuna_dCompiler_dDriver_dCompilerCli_dprintDiagWithPrefix o) "") d))

let v_Vuna_dCompiler_dDriver_dCompilerCli_dprintErr = (fun e -> (v_Vuna_dCompiler_dDriver_dCompilerCli_dprintErrText (String.concat "" ["error: "; e; "\n"])))

let v_Vuna_dCompiler_dDriver_dCompilerCli_dprintDiagList = (fun o extra ds -> ((fun shown -> (((Base_dMonad.v_Base_dMonad_dbind Base_dEff.v_Monad_uBase_uEff_uEff_ur) (((v_Vuna_dCompiler_dDriver_dCompilerCli_demitDiagRevSeq o) extra) shown)) (fun o1 -> ((Base_dApplicative.v_Base_dApplicative_dpure Base_dEff.v_Applicative_uBase_uEff_uEff_ur) { Base_dPair.f_Base_dPair_dPair_first = 0; Base_dPair.f_Base_dPair_dPair_second = o1 })))) ((v_Vuna_dCompiler_dDriver_dCompilerCli_dtakeDiags (o).f_Vuna_dCompiler_dDriver_dCompilerCli_dCliOpts_optMaxErrors) ds)))

let v_Vuna_dCompiler_dDriver_dCompilerCli_ddefaultDir = (fun mc0 -> (match mc0 with
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing -> "."
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Just (dtb__33) -> dtb__33
  | _ -> failwith "DT: impossible branch"
))

let v_Vuna_dCompiler_dDriver_dCompilerCli_ddtPathErr = (fun path -> (v_Vuna_dCompiler_dDriver_dCompilerCli_dprintErr ("no such file or package directory: " ^ path)))

let v_Vuna_dCompiler_dDriver_dCompilerCli_dexecutablePackageAt = (fun label dir -> (((Base_dMonad.v_Base_dMonad_dbind Base_dEff.v_Monad_uBase_uEff_uEff_ur) (Vuna_dCompiler_dPackages_dPkg.v_Vuna_dCompiler_dPackages_dPkg_dloadPackage dir)) (fun pkgR -> (match pkgR with
  | Vuna_dCompiler_dDiag.C_Vuna_dCompiler_dDiag_dCheck_ErrC (dtb__34) -> ((Base_dApplicative.v_Base_dApplicative_dpure Base_dEff.v_Applicative_uBase_uEff_uEff_ur) (Vuna_dCompiler_dDiag.C_Vuna_dCompiler_dDiag_dCheck_ErrC (dtb__34)))
  | Vuna_dCompiler_dDiag.C_Vuna_dCompiler_dDiag_dCheck_OkC (dtb__35) -> (((Base_dMonad.v_Base_dMonad_dbind Base_dEff.v_Monad_uBase_uEff_uEff_ur) ((Base_dHostRow.v_Base_dHostRow_draiseToRow Base_dHostRow.v_Base_dHostRow_dhostRow) ((fun dtio_0 -> Base_dEff.C_Base_dEff_dEff_MkEff (fun (_ : Base_dEff.t_Base_dEff_dEffUnit) -> dtp_fileExists dtio_0)) (Vuna_dCompiler_dPackages_dPkg.v_Vuna_dCompiler_dPackages_dPkg_dpackageEntry dtb__35)))) (fun exists -> (if exists then ((Base_dApplicative.v_Base_dApplicative_dpure Base_dEff.v_Applicative_uBase_uEff_uEff_ur) (Vuna_dCompiler_dDiag.C_Vuna_dCompiler_dDiag_dCheck_OkC (dtb__35))) else ((Base_dApplicative.v_Base_dApplicative_dpure Base_dEff.v_Applicative_uBase_uEff_uEff_ur) (Vuna_dCompiler_dDiag.v_Vuna_dCompiler_dDiag_derr (String.concat "" [label; ": library package "; (Vuna_dCompiler_dPackages_dPkg.v_Vuna_dCompiler_dPackages_dPkg_dpackageName dtb__35); " has no app/Main.vuna (executable package required)"]))))))
  | _ -> failwith "DT: impossible branch"
))))

let v_Vuna_dCompiler_dDriver_dCompilerCli_dexecutablePackage = (fun label dir -> (((Base_dMonad.v_Base_dMonad_dbind Base_dEff.v_Monad_uBase_uEff_uEff_ur) ((Base_dHostRow.v_Base_dHostRow_draiseToRow Base_dHostRow.v_Base_dHostRow_dhostRow) ((fun dtio_0 -> Base_dEff.C_Base_dEff_dEff_MkEff (fun (_ : Base_dEff.t_Base_dEff_dEffUnit) -> dtp_fileExists dtio_0)) dir))) (fun exists -> (if exists then (((Base_dMonad.v_Base_dMonad_dbind Base_dEff.v_Monad_uBase_uEff_uEff_ur) ((Base_dHostRow.v_Base_dHostRow_draiseToRow Base_dHostRow.v_Base_dHostRow_dhostRow) ((fun dtio_0 -> Base_dEff.C_Base_dEff_dEff_MkEff (fun (_ : Base_dEff.t_Base_dEff_dEffUnit) -> dtp_isDirectory dtio_0)) dir))) (fun isDir -> (if isDir then ((v_Vuna_dCompiler_dDriver_dCompilerCli_dexecutablePackageAt label) dir) else ((Base_dApplicative.v_Base_dApplicative_dpure Base_dEff.v_Applicative_uBase_uEff_uEff_ur) (Vuna_dCompiler_dDiag.v_Vuna_dCompiler_dDiag_derr (String.concat "" [label; ": expects a package directory, not a file: "; dir])))))) else ((Base_dApplicative.v_Base_dApplicative_dpure Base_dEff.v_Applicative_uBase_uEff_uEff_ur) (Vuna_dCompiler_dDiag.v_Vuna_dCompiler_dDiag_derr ("no such file or package directory: " ^ dir)))))))

let v_Vuna_dCompiler_dDriver_dCompilerCli_dcheckSpawnArgs = (fun o dir -> ((fun head0 -> ((fun base -> ((fun base2 -> (if (o).f_Vuna_dCompiler_dDriver_dCompilerCli_dCliOpts_optDenyWarnings then ((Base_dList.v_Base_dList_dappend base2) (Base_dList.C_Base_dList_dList_Cons ("--deny-warnings", Base_dList.C_Base_dList_dList_Nil))) else base2)) (if (o).f_Vuna_dCompiler_dDriver_dCompilerCli_dCliOpts_optShowWarnings then ((Base_dList.v_Base_dList_dappend base) (Base_dList.C_Base_dList_dList_Cons ("--warnings", Base_dList.C_Base_dList_dList_Nil))) else base))) (if ((o).f_Vuna_dCompiler_dDriver_dCompilerCli_dCliOpts_optDiagFormat = "short") then ((Base_dList.v_Base_dList_dappend head0) (Base_dList.C_Base_dList_dList_Cons (dir, Base_dList.C_Base_dList_dList_Nil))) else ((Base_dList.v_Base_dList_dappend head0) (Base_dList.C_Base_dList_dList_Cons ("--error-format", (Base_dList.C_Base_dList_dList_Cons ((o).f_Vuna_dCompiler_dDriver_dCompilerCli_dCliOpts_optDiagFormat, (Base_dList.C_Base_dList_dList_Cons (dir, Base_dList.C_Base_dList_dList_Nil)))))))))) (if (o).f_Vuna_dCompiler_dDriver_dCompilerCli_dCliOpts_optRelease then (Base_dList.C_Base_dList_dList_Cons ("check", (Base_dList.C_Base_dList_dList_Cons ("--release", Base_dList.C_Base_dList_dList_Nil)))) else (Base_dList.C_Base_dList_dList_Cons ("check", Base_dList.C_Base_dList_dList_Nil)))))

let v_Vuna_dCompiler_dDriver_dCompilerCli_disWorkspaceRoot = (fun pkg -> (((Base_dMonad.v_Base_dMonad_dbind Base_dEff.v_Monad_uBase_uEff_uEff_ur) (Vuna_dCompiler_dPackages_dPkg.v_Vuna_dCompiler_dPackages_dPkg_dworkspacePackages (Vuna_dCompiler_dPackages_dPkg.v_Vuna_dCompiler_dPackages_dPkg_dpackageDir pkg))) (fun pkgsR -> ((Base_dApplicative.v_Base_dApplicative_dpure Base_dEff.v_Applicative_uBase_uEff_uEff_ur) (match pkgsR with
  | Vuna_dCompiler_dDiag.C_Vuna_dCompiler_dDiag_dCheck_OkC (dtb__36) -> ((Base_dList.v_Base_dList_dlength dtb__36) > 1)
  | Vuna_dCompiler_dDiag.C_Vuna_dCompiler_dDiag_dCheck_ErrC (dtb__37) -> false
  | _ -> failwith "DT: impossible branch"
)))))

let rec v_Vuna_dCompiler_dDriver_dCompilerCli_dcountFailures = (fun mc0 mc1 -> (match mc1 with
  | Base_dList.C_Base_dList_dList_Cons (dtb__38, dtb__39) -> (if (dtb__38 = 0) then ((v_Vuna_dCompiler_dDriver_dCompilerCli_dcountFailures mc0) dtb__39) else ((v_Vuna_dCompiler_dDriver_dCompilerCli_dcountFailures 1) dtb__39))
  | Base_dList.C_Base_dList_dList_Nil -> mc0
  | _ -> failwith "DT: impossible branch"
))

let v_Vuna_dCompiler_dDriver_dCompilerCli_disSingleLibraryPackage = (fun mc0 -> (match mc0 with
  | Base_dList.C_Base_dList_dList_Cons (dtb__40, dtb__41) -> (match dtb__41 with
  | Base_dList.C_Base_dList_dList_Nil -> (((Base_dMonad.v_Base_dMonad_dbind Base_dEff.v_Monad_uBase_uEff_uEff_ur) ((Base_dHostRow.v_Base_dHostRow_draiseToRow Base_dHostRow.v_Base_dHostRow_dhostRow) ((fun dtio_0 -> Base_dEff.C_Base_dEff_dEff_MkEff (fun (_ : Base_dEff.t_Base_dEff_dEffUnit) -> dtp_fileExists dtio_0)) (Vuna_dCompiler_dPackages_dPkg.v_Vuna_dCompiler_dPackages_dPkg_dpackageEntry dtb__40)))) (fun exists -> ((Base_dApplicative.v_Base_dApplicative_dpure Base_dEff.v_Applicative_uBase_uEff_uEff_ur) (Base_dBool.v_Base_dBool_dnot exists))))
  | _ -> ((Base_dApplicative.v_Base_dApplicative_dpure Base_dEff.v_Applicative_uBase_uEff_uEff_ur) false)
)
  | _ -> ((Base_dApplicative.v_Base_dApplicative_dpure Base_dEff.v_Applicative_uBase_uEff_uEff_ur) false)
))

let v_Vuna_dCompiler_dDriver_dCompilerCli_dlibraryOnlyMessage = (fun mc0 -> (match mc0 with
  | Base_dList.C_Base_dList_dList_Nil -> "no package to build"
  | Base_dList.C_Base_dList_dList_Cons (dtb__42, dtb__43) -> (String.concat "" ["library package "; (Vuna_dCompiler_dPackages_dPkg.v_Vuna_dCompiler_dPackages_dPkg_dpackageName dtb__42); " has no app/Main.vuna (executable package required; use `check` for libraries)"])
  | _ -> failwith "DT: impossible branch"
))

let rec v_Vuna_dCompiler_dDriver_dCompilerCli_dfindPackageByName = (fun mc0 mc1 -> (match mc1 with
  | Base_dList.C_Base_dList_dList_Cons (dtb__44, dtb__45) -> (if ((Vuna_dCompiler_dPackages_dPkg.v_Vuna_dCompiler_dPackages_dPkg_dpackageName dtb__44) = mc0) then (Base_dMaybe.C_Base_dMaybe_dMaybe_Just (dtb__44)) else ((v_Vuna_dCompiler_dDriver_dCompilerCli_dfindPackageByName mc0) dtb__45))
  | Base_dList.C_Base_dList_dList_Nil -> Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing
  | _ -> failwith "DT: impossible branch"
))

let v_Vuna_dCompiler_dDriver_dCompilerCli_dselectBuildTargets = (fun mc0 mc1 -> (match mc0 with
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Just (dtb__46) -> (match ((v_Vuna_dCompiler_dDriver_dCompilerCli_dfindPackageByName dtb__46) mc1) with
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing -> (Vuna_dCompiler_dDiag.v_Vuna_dCompiler_dDiag_derr ("no such package in workspace: " ^ dtb__46))
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Just (dtb__47) -> (Vuna_dCompiler_dDiag.C_Vuna_dCompiler_dDiag_dCheck_OkC ((Base_dList.C_Base_dList_dList_Cons (dtb__47, Base_dList.C_Base_dList_dList_Nil))))
  | _ -> failwith "DT: impossible branch"
)
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing -> (Vuna_dCompiler_dDiag.C_Vuna_dCompiler_dDiag_dCheck_OkC (mc1))
  | _ -> failwith "DT: impossible branch"
))

let v_Vuna_dCompiler_dDriver_dCompilerCli_dlinkDefaultOutput = (fun outM pkg outDir viewDigest -> (match outM with
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Just (dtb__48) -> ((Base_dApplicative.v_Base_dApplicative_dpure Base_dEff.v_Applicative_uBase_uEff_uEff_ur) 0)
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing -> ((fun link -> (((Base_dMonad.v_Base_dMonad_dbind Base_dEff.v_Monad_uBase_uEff_uEff_ur) ((Base_dHostRow.v_Base_dHostRow_draiseToRow Base_dHostRow.v_Base_dHostRow_dhostRow) (((fun dtio_0 dtio_1 -> Base_dEff.C_Base_dEff_dEff_MkEff (fun (_ : Base_dEff.t_Base_dEff_dEffUnit) -> dtp_writeFile dtio_0 dtio_1)) (outDir ^ "/.complete")) viewDigest))) (fun _u -> (((Base_dMonad.v_Base_dMonad_dbind Base_dEff.v_Monad_uBase_uEff_uEff_ur) ((Base_dHostRow.v_Base_dHostRow_draiseToRow Base_dHostRow.v_Base_dHostRow_dhostRow) (((fun dtio_0 dtio_1 -> Base_dEff.C_Base_dEff_dEff_MkEff (fun (_ : Base_dEff.t_Base_dEff_dEffUnit) -> (fun dir args -> dtp_runIn dir (Base_dList.dtp_ocamlOf args)) dtio_0 dtio_1)) ".") (Base_dList.C_Base_dList_dList_Cons ("rm", (Base_dList.C_Base_dList_dList_Cons ("-rf", (Base_dList.C_Base_dList_dList_Cons (link, Base_dList.C_Base_dList_dList_Nil))))))))) (fun _u -> (((fun dtio_0 dtio_1 -> Base_dEff.C_Base_dEff_dEff_MkEff (fun (_ : Base_dEff.t_Base_dEff_dEffUnit) -> (fun dir args -> dtp_runIn dir (Base_dList.dtp_ocamlOf args)) dtio_0 dtio_1)) ".") (Base_dList.C_Base_dList_dList_Cons ("ln", (Base_dList.C_Base_dList_dList_Cons ("-s", (Base_dList.C_Base_dList_dList_Cons (outDir, (Base_dList.C_Base_dList_dList_Cons (link, Base_dList.C_Base_dList_dList_Nil)))))))))))))) ((Vuna_dCompiler_dPackages_dPkg.v_Vuna_dCompiler_dPackages_dPkg_dpackageDir pkg) ^ "/.output"))
  | _ -> failwith "DT: impossible branch"
))

let v_Vuna_dCompiler_dDriver_dCompilerCli_dcompileCodegen = (fun ctx entry outDir o -> (((Base_dMonad.v_Base_dMonad_dbind Base_dEff.v_Monad_uBase_uEff_uEff_ur) ((((Vuna_dCompiler_dDriver_dCompile.v_Vuna_dCompiler_dDriver_dCompile_dcompileToDir ctx) entry) true) outDir)) (fun r -> (match r with
  | Vuna_dCompiler_dDiag.C_Vuna_dCompiler_dDiag_dCheck_ErrC (dtb__49) -> ((v_Vuna_dCompiler_dDriver_dCompilerCli_dprintDiag o) dtb__49)
  | Vuna_dCompiler_dDiag.C_Vuna_dCompiler_dDiag_dCheck_OkC (dtb__50) -> ((Base_dApplicative.v_Base_dApplicative_dpure Base_dEff.v_Applicative_uBase_uEff_uEff_ur) { Base_dPair.f_Base_dPair_dPair_first = 0; Base_dPair.f_Base_dPair_dPair_second = o })
  | _ -> failwith "DT: impossible branch"
))))

let v_Vuna_dCompiler_dDriver_dCompilerCli_dbuildLinked = (fun ctx entry outDir name o -> (((Base_dMonad.v_Base_dMonad_dbind Base_dEff.v_Monad_uBase_uEff_uEff_ur) (Vuna_dCompiler_dDriver_dCompile.v_Vuna_dCompiler_dDriver_dCompile_densureDirPath (outDir ^ "/bin"))) (fun _u -> (((Base_dMonad.v_Base_dMonad_dbind Base_dEff.v_Monad_uBase_uEff_uEff_ur) (((Vuna_dCompiler_dDriver_dCompile.v_Vuna_dCompiler_dDriver_dCompile_drunBuildScript outDir) ("bin/" ^ name)) name)) (fun r -> (match r with
  | Vuna_dCompiler_dDiag.C_Vuna_dCompiler_dDiag_dCheck_ErrC (dtb__51) -> ((v_Vuna_dCompiler_dDriver_dCompilerCli_dprintDiag o) dtb__51)
  | Vuna_dCompiler_dDiag.C_Vuna_dCompiler_dDiag_dCheck_OkC (dtb__52) -> (((Base_dMonad.v_Base_dMonad_dbind Base_dEff.v_Monad_uBase_uEff_uEff_ur) ((((Vuna_dCompiler_dDriver_dCompile.v_Vuna_dCompiler_dDriver_dCompile_dwriteBuildMeta outDir) ctx) entry) true)) (fun _u -> (((Base_dMonad.v_Base_dMonad_dbind Base_dEff.v_Monad_uBase_uEff_uEff_ur) ((Base_dHostRow.v_Base_dHostRow_draiseToRow Base_dHostRow.v_Base_dHostRow_dhostRow) ((fun dtio_0 -> Base_dEff.C_Base_dEff_dEff_MkEff (fun (_ : Base_dEff.t_Base_dEff_dEffUnit) -> dtp_print dtio_0)) (String.concat "" ["built "; outDir; "/bin/"; name; "\n"])))) (fun _u -> ((Base_dApplicative.v_Base_dApplicative_dpure Base_dEff.v_Applicative_uBase_uEff_uEff_ur) { Base_dPair.f_Base_dPair_dPair_first = 0; Base_dPair.f_Base_dPair_dPair_second = o })))))
  | _ -> failwith "DT: impossible branch"
))))))

let v_Vuna_dCompiler_dDriver_dCompilerCli_dbuildOne = (fun noCompile multiOut outM pkg o -> ((fun name -> ((fun entry -> (((Base_dMonad.v_Base_dMonad_dbind Base_dEff.v_Monad_uBase_uEff_uEff_ur) ((Base_dHostRow.v_Base_dHostRow_draiseToRow Base_dHostRow.v_Base_dHostRow_dhostRow) ((fun dtio_0 -> Base_dEff.C_Base_dEff_dEff_MkEff (fun (_ : Base_dEff.t_Base_dEff_dEffUnit) -> dtp_fileExists dtio_0)) entry))) (fun exists -> (if exists then ((fun ctx -> (((Base_dMonad.v_Base_dMonad_dbind Base_dEff.v_Monad_uBase_uEff_uEff_ur) (match outM with
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Just (dtb__53) -> ((Base_dApplicative.v_Base_dApplicative_dpure Base_dEff.v_Applicative_uBase_uEff_uEff_ur) "")
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing -> (if noCompile then ((Base_dApplicative.v_Base_dApplicative_dpure Base_dEff.v_Applicative_uBase_uEff_uEff_ur) "") else (((Vuna_dCompiler_dDriver_dCompile.v_Vuna_dCompiler_dDriver_dCompile_dbuildViewAddrOf ctx) entry) true))
  | _ -> failwith "DT: impossible branch"
)) (fun viewDigest -> (((Base_dMonad.v_Base_dMonad_dbind Base_dEff.v_Monad_uBase_uEff_uEff_ur) (match outM with
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Just (dtb__54) -> ((Base_dApplicative.v_Base_dApplicative_dpure Base_dEff.v_Applicative_uBase_uEff_uEff_ur) (if multiOut then (String.concat "" [dtb__54; "/"; name]) else dtb__54))
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing -> (if noCompile then ((Base_dApplicative.v_Base_dApplicative_dpure Base_dEff.v_Applicative_uBase_uEff_uEff_ur) ((Vuna_dCompiler_dPackages_dPkg.v_Vuna_dCompiler_dPackages_dPkg_dpackageDir pkg) ^ "/.output")) else ((Vuna_dCompiler_dStore.v_Vuna_dCompiler_dStore_dstoreViewPathEff "bin") viewDigest))
  | _ -> failwith "DT: impossible branch"
)) (fun outDir -> ((fun binPath -> (if noCompile then (((Base_dMonad.v_Base_dMonad_dbind Base_dEff.v_Monad_uBase_uEff_uEff_ur) ((((v_Vuna_dCompiler_dDriver_dCompilerCli_dcompileCodegen ctx) entry) outDir) o)) (fun r -> ((Base_dApplicative.v_Base_dApplicative_dpure Base_dEff.v_Applicative_uBase_uEff_uEff_ur) r))) else (((Base_dMonad.v_Base_dMonad_dbind Base_dEff.v_Monad_uBase_uEff_uEff_ur) ((((Vuna_dCompiler_dDriver_dCompile.v_Vuna_dCompiler_dDriver_dCompile_dmetaUpToDate outDir) ctx) entry) binPath)) (fun fresh -> (if fresh then (((Base_dMonad.v_Base_dMonad_dbind Base_dEff.v_Monad_uBase_uEff_uEff_ur) ((((v_Vuna_dCompiler_dDriver_dCompilerCli_dlinkDefaultOutput outM) pkg) outDir) viewDigest)) (fun _u -> (((Base_dMonad.v_Base_dMonad_dbind Base_dEff.v_Monad_uBase_uEff_uEff_ur) ((Base_dHostRow.v_Base_dHostRow_draiseToRow Base_dHostRow.v_Base_dHostRow_dhostRow) ((fun dtio_0 -> Base_dEff.C_Base_dEff_dEff_MkEff (fun (_ : Base_dEff.t_Base_dEff_dEffUnit) -> dtp_print dtio_0)) (String.concat "" ["up to date: "; binPath; "\n"])))) (fun _u -> ((Base_dApplicative.v_Base_dApplicative_dpure Base_dEff.v_Applicative_uBase_uEff_uEff_ur) { Base_dPair.f_Base_dPair_dPair_first = 0; Base_dPair.f_Base_dPair_dPair_second = o }))))) else (((Base_dMonad.v_Base_dMonad_dbind Base_dEff.v_Monad_uBase_uEff_uEff_ur) ((((Vuna_dCompiler_dDriver_dCompile.v_Vuna_dCompiler_dDriver_dCompile_dcompileToDir ctx) entry) true) outDir)) (fun r -> (match r with
  | Vuna_dCompiler_dDiag.C_Vuna_dCompiler_dDiag_dCheck_ErrC (dtb__55) -> ((v_Vuna_dCompiler_dDriver_dCompilerCli_dprintDiag o) dtb__55)
  | Vuna_dCompiler_dDiag.C_Vuna_dCompiler_dDiag_dCheck_OkC (dtb__56) -> (((Base_dMonad.v_Base_dMonad_dbind Base_dEff.v_Monad_uBase_uEff_uEff_ur) ((((v_Vuna_dCompiler_dDriver_dCompilerCli_dlinkDefaultOutput outM) pkg) outDir) viewDigest)) (fun _u -> (((((v_Vuna_dCompiler_dDriver_dCompilerCli_dbuildLinked ctx) entry) outDir) name) o)))
  | _ -> failwith "DT: impossible branch"
)))))))) (String.concat "" [outDir; "/bin/"; name]))))))) ((Vuna_dCompiler_dPackages_dPkg.v_Vuna_dCompiler_dPackages_dPkg_dcontextWithRelease (o).f_Vuna_dCompiler_dDriver_dCompilerCli_dCliOpts_optRelease) (Vuna_dCompiler_dPackages_dPkg.v_Vuna_dCompiler_dPackages_dPkg_dpackageContext pkg))) else (((Base_dMonad.v_Base_dMonad_dbind Base_dEff.v_Monad_uBase_uEff_uEff_ur) (((Vuna_dCompiler_dDriver_dCompile.v_Vuna_dCompiler_dDriver_dCompile_dcheckPackage (o).f_Vuna_dCompiler_dDriver_dCompilerCli_dCliOpts_optRelease) false) pkg)) (fun r -> (match r with
  | Vuna_dCompiler_dDiag.C_Vuna_dCompiler_dDiag_dCheck_ErrC (dtb__57) -> ((v_Vuna_dCompiler_dDriver_dCompilerCli_dprintDiag o) dtb__57)
  | Vuna_dCompiler_dDiag.C_Vuna_dCompiler_dDiag_dCheck_OkC (dtb__58) -> (((Base_dMonad.v_Base_dMonad_dbind Base_dEff.v_Monad_uBase_uEff_uEff_ur) ((Base_dHostRow.v_Base_dHostRow_draiseToRow Base_dHostRow.v_Base_dHostRow_dhostRow) ((fun dtio_0 -> Base_dEff.C_Base_dEff_dEff_MkEff (fun (_ : Base_dEff.t_Base_dEff_dEffUnit) -> dtp_print dtio_0)) (String.concat "" ["skipped (library): "; name; "\n"])))) (fun _u -> ((Base_dApplicative.v_Base_dApplicative_dpure Base_dEff.v_Applicative_uBase_uEff_uEff_ur) { Base_dPair.f_Base_dPair_dPair_first = 0; Base_dPair.f_Base_dPair_dPair_second = o })))
  | _ -> failwith "DT: impossible branch"
))))))) (Vuna_dCompiler_dPackages_dPkg.v_Vuna_dCompiler_dPackages_dPkg_dpackageEntry pkg))) (Vuna_dCompiler_dPackages_dPkg.v_Vuna_dCompiler_dPackages_dPkg_dpackageName pkg)))

let rec v_Vuna_dCompiler_dDriver_dCompilerCli_dbuildTargets = (fun mc0 mc1 mc2 mc3 mc4 mc5 -> (match mc3 with
  | Base_dList.C_Base_dList_dList_Cons (dtb__59, dtb__60) -> (((Base_dMonad.v_Base_dMonad_dbind Base_dEff.v_Monad_uBase_uEff_uEff_ur) (((((v_Vuna_dCompiler_dDriver_dCompilerCli_dbuildOne mc0) mc1) mc2) dtb__59) mc5)) (fun r -> ((fun next -> ((((((v_Vuna_dCompiler_dDriver_dCompilerCli_dbuildTargets mc0) mc1) mc2) dtb__60) next) (Base_dPair.v_Base_dPair_dsecondOf r))) (if ((Base_dPair.v_Base_dPair_dfirstOf r) > mc4) then (Base_dPair.v_Base_dPair_dfirstOf r) else mc4))))
  | Base_dList.C_Base_dList_dList_Nil -> ((Base_dApplicative.v_Base_dApplicative_dpure Base_dEff.v_Applicative_uBase_uEff_uEff_ur) { Base_dPair.f_Base_dPair_dPair_first = mc4; Base_dPair.f_Base_dPair_dPair_second = mc5 })
  | _ -> failwith "DT: impossible branch"
))

let v_Vuna_dCompiler_dDriver_dCompilerCli_dbuildRun = (fun noCompile dir outM pkgM o -> (((Base_dMonad.v_Base_dMonad_dbind Base_dEff.v_Monad_uBase_uEff_uEff_ur) (Vuna_dCompiler_dPackages_dPkg.v_Vuna_dCompiler_dPackages_dPkg_dworkspacePackages dir)) (fun pkgsR -> (match pkgsR with
  | Vuna_dCompiler_dDiag.C_Vuna_dCompiler_dDiag_dCheck_ErrC (dtb__61) -> ((v_Vuna_dCompiler_dDriver_dCompilerCli_dprintDiag o) dtb__61)
  | Vuna_dCompiler_dDiag.C_Vuna_dCompiler_dDiag_dCheck_OkC (dtb__62) -> (((Base_dMonad.v_Base_dMonad_dbind Base_dEff.v_Monad_uBase_uEff_uEff_ur) (v_Vuna_dCompiler_dDriver_dCompilerCli_disSingleLibraryPackage dtb__62)) (fun libOnly -> (if libOnly then ((v_Vuna_dCompiler_dDriver_dCompilerCli_dwithOpts o) (v_Vuna_dCompiler_dDriver_dCompilerCli_dprintErr (v_Vuna_dCompiler_dDriver_dCompilerCli_dlibraryOnlyMessage dtb__62))) else (match ((v_Vuna_dCompiler_dDriver_dCompilerCli_dselectBuildTargets pkgM) dtb__62) with
  | Vuna_dCompiler_dDiag.C_Vuna_dCompiler_dDiag_dCheck_ErrC (dtb__63) -> ((v_Vuna_dCompiler_dDriver_dCompilerCli_dprintDiag o) dtb__63)
  | Vuna_dCompiler_dDiag.C_Vuna_dCompiler_dDiag_dCheck_OkC (dtb__64) -> ((((((v_Vuna_dCompiler_dDriver_dCompilerCli_dbuildTargets noCompile) ((Base_dList.v_Base_dList_dlength dtb__62) > 1)) outM) dtb__64) 0) o)
  | _ -> failwith "DT: impossible branch"
))))
  | _ -> failwith "DT: impossible branch"
))))

let rec v_Vuna_dCompiler_dDriver_dCompilerCli_dbuildParse = (fun prog noCompile out dir pkg args o -> ((fun nd_uscrut7 -> (match nd_uscrut7 with
  | Base_dList.C_Base_dList_dList_Cons (dtb__65, dtb__66) -> (if (dtb__65 = "--no-compile") then (((((((v_Vuna_dCompiler_dDriver_dCompilerCli_dbuildParse prog) true) out) dir) pkg) dtb__66) o) else (if (dtb__65 = "--release") then (((((((v_Vuna_dCompiler_dDriver_dCompilerCli_dbuildParse prog) noCompile) out) dir) pkg) dtb__66) (v_Vuna_dCompiler_dDriver_dCompilerCli_dmarkRelease o)) else (if (dtb__65 = "--out") then (match dtb__66 with
  | Base_dList.C_Base_dList_dList_Cons (dtb__67, dtb__68) -> (if ((Base_dString.v_Base_dString_dstartsWith "-") dtb__67) then ((v_Vuna_dCompiler_dDriver_dCompilerCli_dwithOpts o) ((v_Vuna_dCompiler_dDriver_dCompilerCli_dremovedFlag prog) dtb__67)) else (match out with
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing -> (((((((v_Vuna_dCompiler_dDriver_dCompilerCli_dbuildParse prog) noCompile) (Base_dMaybe.C_Base_dMaybe_dMaybe_Just (dtb__67))) dir) pkg) dtb__68) o)
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Just (dtb__69) -> ((v_Vuna_dCompiler_dDriver_dCompilerCli_dwithOpts o) (v_Vuna_dCompiler_dDriver_dCompilerCli_dusageErr prog))
  | _ -> failwith "DT: impossible branch"
))
  | Base_dList.C_Base_dList_dList_Nil -> ((v_Vuna_dCompiler_dDriver_dCompilerCli_dwithOpts o) (v_Vuna_dCompiler_dDriver_dCompilerCli_dusageErr prog))
  | _ -> failwith "DT: impossible branch"
) else (if (dtb__65 = "--package") then (match dtb__66 with
  | Base_dList.C_Base_dList_dList_Cons (dtb__70, dtb__71) -> (if ((Base_dString.v_Base_dString_dstartsWith "-") dtb__70) then ((v_Vuna_dCompiler_dDriver_dCompilerCli_dwithOpts o) ((v_Vuna_dCompiler_dDriver_dCompilerCli_dremovedFlag prog) dtb__70)) else (match pkg with
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing -> (((((((v_Vuna_dCompiler_dDriver_dCompilerCli_dbuildParse prog) noCompile) out) dir) (Base_dMaybe.C_Base_dMaybe_dMaybe_Just (dtb__70))) dtb__71) o)
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Just (dtb__72) -> ((v_Vuna_dCompiler_dDriver_dCompilerCli_dwithOpts o) (v_Vuna_dCompiler_dDriver_dCompilerCli_dusageErr prog))
  | _ -> failwith "DT: impossible branch"
))
  | Base_dList.C_Base_dList_dList_Nil -> ((v_Vuna_dCompiler_dDriver_dCompilerCli_dwithOpts o) (v_Vuna_dCompiler_dDriver_dCompilerCli_dusageErr prog))
  | _ -> failwith "DT: impossible branch"
) else (if ((Base_dString.v_Base_dString_dstartsWith "-") dtb__65) then ((v_Vuna_dCompiler_dDriver_dCompilerCli_dwithOpts o) ((v_Vuna_dCompiler_dDriver_dCompilerCli_dremovedFlag prog) dtb__65)) else (match dir with
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing -> (((((((v_Vuna_dCompiler_dDriver_dCompilerCli_dbuildParse prog) noCompile) out) (Base_dMaybe.C_Base_dMaybe_dMaybe_Just (dtb__65))) pkg) dtb__66) o)
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Just (dtb__73) -> ((v_Vuna_dCompiler_dDriver_dCompilerCli_dwithOpts o) (v_Vuna_dCompiler_dDriver_dCompilerCli_dusageErr prog))
  | _ -> failwith "DT: impossible branch"
))))))
  | Base_dList.C_Base_dList_dList_Nil -> (((((v_Vuna_dCompiler_dDriver_dCompilerCli_dbuildRun noCompile) (v_Vuna_dCompiler_dDriver_dCompilerCli_ddefaultDir dir)) out) pkg) o)
  | _ -> failwith "DT: impossible branch"
)) args))

let v_Vuna_dCompiler_dDriver_dCompilerCli_dbuildArgs = (fun prog args o -> (((((((v_Vuna_dCompiler_dDriver_dCompilerCli_dbuildParse prog) false) Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing) Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing) Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing) args) o))

let v_Vuna_dCompiler_dDriver_dCompilerCli_dstripDotSlash = (fun s -> (if ((Base_dString.v_Base_dString_dstartsWith "./") s) then (((Base_dString.v_Base_dString_dsubstring (bi_natFromInt 2)) (bi_natFromInt ((bi_strLength s) - 2))) s) else s))

let v_Vuna_dCompiler_dDriver_dCompilerCli_disPackageEntryPath = (fun ctx path -> (match (Vuna_dCompiler_dPackages_dPkg.v_Vuna_dCompiler_dPackages_dPkg_dcontextPackageOf ctx) with
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing -> ((Base_dApplicative.v_Base_dApplicative_dpure Base_dEff.v_Applicative_uBase_uEff_uEff_ur) false)
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Just (dtb__74) -> (((Base_dMonad.v_Base_dMonad_dbind Base_dEff.v_Monad_uBase_uEff_uEff_ur) (Vuna_dCompiler_dPackages_dPkg.v_Vuna_dCompiler_dPackages_dPkg_dabsolutePath path)) (fun abs -> ((Base_dApplicative.v_Base_dApplicative_dpure Base_dEff.v_Applicative_uBase_uEff_uEff_ur) ((v_Vuna_dCompiler_dDriver_dCompilerCli_dstripDotSlash abs) = (v_Vuna_dCompiler_dDriver_dCompilerCli_dstripDotSlash (Vuna_dCompiler_dPackages_dPkg.v_Vuna_dCompiler_dPackages_dPkg_dpackageEntry dtb__74))))))
  | _ -> failwith "DT: impossible branch"
))

let v_Vuna_dCompiler_dDriver_dCompilerCli_disModuleFileEntry = (fun ctx path -> (((Base_dMonad.v_Base_dMonad_dbind Base_dEff.v_Monad_uBase_uEff_uEff_ur) ((v_Vuna_dCompiler_dDriver_dCompilerCli_disPackageEntryPath ctx) path)) (fun pkgEntry -> (if pkgEntry then ((Base_dApplicative.v_Base_dApplicative_dpure Base_dEff.v_Applicative_uBase_uEff_uEff_ur) false) else (Vuna_dCompiler_dDriver_dDt.v_Vuna_dCompiler_dDriver_dDt_ddtFileHasModuleHeader path)))))

let v_Vuna_dCompiler_dDriver_dCompilerCli_downedByFile = (fun path d -> ((v_Vuna_dCompiler_dDriver_dCompilerCli_dstripDotSlash (Vuna_dCompiler_dDiag.v_Vuna_dCompiler_dDiag_ddiagFileOf d)) = (v_Vuna_dCompiler_dDriver_dCompilerCli_dstripDotSlash path)))

let v_Vuna_dCompiler_dDriver_dCompilerCli_dcheckModuleFileEntry = (fun ctx path o -> (((Base_dMonad.v_Base_dMonad_dbind Base_dEff.v_Monad_uBase_uEff_uEff_ur) ((Vuna_dCompiler_dDriver_dDt.v_Vuna_dCompiler_dDriver_dDt_ddtCheckModuleFile ctx) path)) (fun checked -> (match checked with
  | Vuna_dCompiler_dDiag.C_Vuna_dCompiler_dDiag_dCheck_ErrC (dtb__75) -> ((v_Vuna_dCompiler_dDriver_dCompilerCli_dprintDiag o) dtb__75)
  | Vuna_dCompiler_dDiag.C_Vuna_dCompiler_dDiag_dCheck_OkC (dtb__76) -> ((fun ws -> ((fun shown -> (((Base_dMonad.v_Base_dMonad_dbind Base_dEff.v_Monad_uBase_uEff_uEff_ur) (((v_Vuna_dCompiler_dDriver_dCompilerCli_dprintDiagList o) "") shown)) (fun r -> ((Base_dApplicative.v_Base_dApplicative_dpure Base_dEff.v_Applicative_uBase_uEff_uEff_ur) { Base_dPair.f_Base_dPair_dPair_first = (if (if (o).f_Vuna_dCompiler_dDriver_dCompilerCli_dCliOpts_optDenyWarnings then ((Base_dList.v_Base_dList_dlength ws) > 0) else false) then 1 else 0); Base_dPair.f_Base_dPair_dPair_second = (Base_dPair.v_Base_dPair_dsecondOf r) })))) (if (if (o).f_Vuna_dCompiler_dDriver_dCompilerCli_dCliOpts_optShowWarnings then true else (o).f_Vuna_dCompiler_dDriver_dCompilerCli_dCliOpts_optDenyWarnings) then ws else Base_dList.C_Base_dList_dList_Nil))) ((Base_dList.v_Base_dList_dfilter (v_Vuna_dCompiler_dDriver_dCompilerCli_downedByFile path)) (Vuna_dCompiler_dDiagnostics_dSink.v_Vuna_dCompiler_dDiagnostics_dSink_ddedupeWarnings dtb__76)))
  | _ -> failwith "DT: impossible branch"
))))

let v_Vuna_dCompiler_dDriver_dCompilerCli_dcheckEntryFile = (fun ctx path o -> (((Base_dMonad.v_Base_dMonad_dbind Base_dEff.v_Monad_uBase_uEff_uEff_ur) ((Vuna_dCompiler_dDriver_dDt.v_Vuna_dCompiler_dDriver_dDt_ddtCheck ctx) path)) (fun checked -> (match checked with
  | Vuna_dCompiler_dDiag.C_Vuna_dCompiler_dDiag_dCheck_ErrC (dtb__77) -> (if (o).f_Vuna_dCompiler_dDriver_dCompilerCli_dCliOpts_optContinueOnError then (((Base_dMonad.v_Base_dMonad_dbind Base_dEff.v_Monad_uBase_uEff_uEff_ur) ((Vuna_dCompiler_dDriver_dDt.v_Vuna_dCompiler_dDriver_dDt_ddtCheckRecovering ctx) path)) (fun recovered -> (match recovered with
  | Vuna_dCompiler_dDiag.C_Vuna_dCompiler_dDiag_dCheck_OkC (dtb__78) -> ((fun shown -> (((Base_dMonad.v_Base_dMonad_dbind Base_dEff.v_Monad_uBase_uEff_uEff_ur) (((v_Vuna_dCompiler_dDriver_dCompilerCli_dprintDiagList o) "") shown)) (fun r -> (if ((Base_dList.v_Base_dList_dlength shown) = 0) then ((v_Vuna_dCompiler_dDriver_dCompilerCli_dprintDiag (Base_dPair.v_Base_dPair_dsecondOf r)) dtb__77) else ((Base_dApplicative.v_Base_dApplicative_dpure Base_dEff.v_Applicative_uBase_uEff_uEff_ur) { Base_dPair.f_Base_dPair_dPair_first = 1; Base_dPair.f_Base_dPair_dPair_second = (Base_dPair.v_Base_dPair_dsecondOf r) }))))) ((v_Vuna_dCompiler_dDriver_dCompilerCli_dtakeDiags (o).f_Vuna_dCompiler_dDriver_dCompilerCli_dCliOpts_optMaxErrors) dtb__78))
  | Vuna_dCompiler_dDiag.C_Vuna_dCompiler_dDiag_dCheck_ErrC (dtb__79) -> ((v_Vuna_dCompiler_dDriver_dCompilerCli_dprintDiag o) dtb__77)
  | _ -> failwith "DT: impossible branch"
))) else ((v_Vuna_dCompiler_dDriver_dCompilerCli_dprintDiag o) dtb__77))
  | Vuna_dCompiler_dDiag.C_Vuna_dCompiler_dDiag_dCheck_OkC (dtb__80) -> ((fun ws -> ((fun shown -> (((Base_dMonad.v_Base_dMonad_dbind Base_dEff.v_Monad_uBase_uEff_uEff_ur) (((v_Vuna_dCompiler_dDriver_dCompilerCli_dprintDiagList o) "") shown)) (fun r -> ((Base_dApplicative.v_Base_dApplicative_dpure Base_dEff.v_Applicative_uBase_uEff_uEff_ur) { Base_dPair.f_Base_dPair_dPair_first = (if (if (o).f_Vuna_dCompiler_dDriver_dCompilerCli_dCliOpts_optDenyWarnings then ((Base_dList.v_Base_dList_dlength ws) > 0) else false) then 1 else 0); Base_dPair.f_Base_dPair_dPair_second = (Base_dPair.v_Base_dPair_dsecondOf r) })))) (if (if (o).f_Vuna_dCompiler_dDriver_dCompilerCli_dCliOpts_optShowWarnings then true else (o).f_Vuna_dCompiler_dDriver_dCompilerCli_dCliOpts_optDenyWarnings) then ws else Base_dList.C_Base_dList_dList_Nil))) ((Base_dList.v_Base_dList_dfilter (v_Vuna_dCompiler_dDriver_dCompilerCli_downedByFile path)) (Vuna_dCompiler_dDiagnostics_dSink.v_Vuna_dCompiler_dDiagnostics_dSink_ddedupeWarnings dtb__80)))
  | _ -> failwith "DT: impossible branch"
))))

let v_Vuna_dCompiler_dDriver_dCompilerCli_dcheckFileEntry = (fun path o -> (((Base_dMonad.v_Base_dMonad_dbind Base_dEff.v_Monad_uBase_uEff_uEff_ur) (Vuna_dCompiler_dPackages_dPkg.v_Vuna_dCompiler_dPackages_dPkg_dcontextForFile path)) (fun ctxR -> (match ctxR with
  | Vuna_dCompiler_dDiag.C_Vuna_dCompiler_dDiag_dCheck_ErrC (dtb__81) -> ((v_Vuna_dCompiler_dDriver_dCompilerCli_dprintDiag o) dtb__81)
  | Vuna_dCompiler_dDiag.C_Vuna_dCompiler_dDiag_dCheck_OkC (dtb__82) -> ((fun ctx -> ((fun o1 -> (((Base_dMonad.v_Base_dMonad_dbind Base_dEff.v_Monad_uBase_uEff_uEff_ur) ((v_Vuna_dCompiler_dDriver_dCompilerCli_disModuleFileEntry ctx) path)) (fun moduleEntry -> (if moduleEntry then (((v_Vuna_dCompiler_dDriver_dCompilerCli_dcheckModuleFileEntry ctx) path) o1) else (((v_Vuna_dCompiler_dDriver_dCompilerCli_dcheckEntryFile ctx) path) o1))))) ((v_Vuna_dCompiler_dDriver_dCompilerCli_dapplyDiagConfig (Vuna_dCompiler_dPackages_dPkg.v_Vuna_dCompiler_dPackages_dPkg_dcontextPackageOf ctx)) o))) ((Vuna_dCompiler_dPackages_dPkg.v_Vuna_dCompiler_dPackages_dPkg_dcontextWithRelease (o).f_Vuna_dCompiler_dDriver_dCompilerCli_dCliOpts_optRelease) dtb__82))
  | _ -> failwith "DT: impossible branch"
))))

let v_Vuna_dCompiler_dDriver_dCompilerCli_downedByPackage = (fun pkg d -> ((fun dir -> ((fun file -> ((fun prefix -> (if (if ((Base_dString.v_Base_dString_dstartsWith (prefix ^ "lib/")) file) then true else ((Base_dString.v_Base_dString_dstartsWith (prefix ^ "app/")) file)) then true else ((Base_dString.v_Base_dString_dstartsWith (prefix ^ "test/")) file))) (if (if (dir = ".") then true else (dir = "")) then "" else (dir ^ "/")))) (v_Vuna_dCompiler_dDriver_dCompilerCli_dstripDotSlash (Vuna_dCompiler_dDiag.v_Vuna_dCompiler_dDiag_ddiagFileOf d)))) (v_Vuna_dCompiler_dDriver_dCompilerCli_dstripDotSlash (Vuna_dCompiler_dPackages_dPkg.v_Vuna_dCompiler_dPackages_dPkg_dpackageDir pkg))))

let v_Vuna_dCompiler_dDriver_dCompilerCli_dfinishWarnings = (fun warns code o -> ((fun ws -> ((fun shown -> (((Base_dMonad.v_Base_dMonad_dbind Base_dEff.v_Monad_uBase_uEff_uEff_ur) (((v_Vuna_dCompiler_dDriver_dCompilerCli_dprintDiagList o) "") shown)) (fun r -> ((Base_dApplicative.v_Base_dApplicative_dpure Base_dEff.v_Applicative_uBase_uEff_uEff_ur) { Base_dPair.f_Base_dPair_dPair_first = (if (if (o).f_Vuna_dCompiler_dDriver_dCompilerCli_dCliOpts_optDenyWarnings then ((Base_dList.v_Base_dList_dlength ws) > 0) else false) then 1 else code); Base_dPair.f_Base_dPair_dPair_second = (Base_dPair.v_Base_dPair_dsecondOf r) })))) (if (if (o).f_Vuna_dCompiler_dDriver_dCompilerCli_dCliOpts_optShowWarnings then true else (o).f_Vuna_dCompiler_dDriver_dCompilerCli_dCliOpts_optDenyWarnings) then ws else Base_dList.C_Base_dList_dList_Nil))) (Vuna_dCompiler_dDiagnostics_dSink.v_Vuna_dCompiler_dDiagnostics_dSink_ddedupeWarnings warns)))

let v_Vuna_dCompiler_dDriver_dCompilerCli_dfinishWarningsDir = (fun warns o dir code -> ((fun ws -> ((fun shown -> (((Base_dMonad.v_Base_dMonad_dbind Base_dEff.v_Monad_uBase_uEff_uEff_ur) (((v_Vuna_dCompiler_dDriver_dCompilerCli_dprintDiagList o) "") shown)) (fun r -> (if (if (o).f_Vuna_dCompiler_dDriver_dCompilerCli_dCliOpts_optDenyWarnings then ((Base_dList.v_Base_dList_dlength ws) > 0) else false) then (((Base_dMonad.v_Base_dMonad_dbind Base_dEff.v_Monad_uBase_uEff_uEff_ur) ((Base_dHostRow.v_Base_dHostRow_draiseToRow Base_dHostRow.v_Base_dHostRow_dhostRow) (((fun dtio_0 dtio_1 -> Base_dEff.C_Base_dEff_dEff_MkEff (fun (_ : Base_dEff.t_Base_dEff_dEffUnit) -> (fun dir args -> dtp_runIn dir (Base_dList.dtp_ocamlOf args)) dtio_0 dtio_1)) "/") (Base_dList.C_Base_dList_dList_Cons ("rm", (Base_dList.C_Base_dList_dList_Cons ("-rf", (Base_dList.C_Base_dList_dList_Cons (dir, Base_dList.C_Base_dList_dList_Nil))))))))) (fun _u -> ((Base_dApplicative.v_Base_dApplicative_dpure Base_dEff.v_Applicative_uBase_uEff_uEff_ur) { Base_dPair.f_Base_dPair_dPair_first = 1; Base_dPair.f_Base_dPair_dPair_second = (Base_dPair.v_Base_dPair_dsecondOf r) }))) else ((Base_dApplicative.v_Base_dApplicative_dpure Base_dEff.v_Applicative_uBase_uEff_uEff_ur) { Base_dPair.f_Base_dPair_dPair_first = code; Base_dPair.f_Base_dPair_dPair_second = (Base_dPair.v_Base_dPair_dsecondOf r) }))))) (if (if (o).f_Vuna_dCompiler_dDriver_dCompilerCli_dCliOpts_optShowWarnings then true else (o).f_Vuna_dCompiler_dDriver_dCompilerCli_dCliOpts_optDenyWarnings) then ws else Base_dList.C_Base_dList_dList_Nil))) (Vuna_dCompiler_dDiagnostics_dSink.v_Vuna_dCompiler_dDiagnostics_dSink_ddedupeWarnings warns)))

let v_Vuna_dCompiler_dDriver_dCompilerCli_dcompileFileEntry = (fun printResult entry outDir o -> (((Base_dMonad.v_Base_dMonad_dbind Base_dEff.v_Monad_uBase_uEff_uEff_ur) (Vuna_dCompiler_dPackages_dPkg.v_Vuna_dCompiler_dPackages_dPkg_dcontextForFile entry)) (fun ctxR -> (match ctxR with
  | Vuna_dCompiler_dDiag.C_Vuna_dCompiler_dDiag_dCheck_ErrC (dtb__83) -> ((v_Vuna_dCompiler_dDriver_dCompilerCli_dprintDiag o) dtb__83)
  | Vuna_dCompiler_dDiag.C_Vuna_dCompiler_dDiag_dCheck_OkC (dtb__84) -> ((fun ctx -> ((fun o1 -> (((Base_dMonad.v_Base_dMonad_dbind Base_dEff.v_Monad_uBase_uEff_uEff_ur) ((((Vuna_dCompiler_dDriver_dCompile.v_Vuna_dCompiler_dDriver_dCompile_dcompileToDir ctx) entry) printResult) outDir)) (fun r -> (match r with
  | Vuna_dCompiler_dDiag.C_Vuna_dCompiler_dDiag_dCheck_ErrC (dtb__85) -> ((v_Vuna_dCompiler_dDriver_dCompilerCli_dprintDiag o1) dtb__85)
  | Vuna_dCompiler_dDiag.C_Vuna_dCompiler_dDiag_dCheck_OkC (dtb__86) -> ((((v_Vuna_dCompiler_dDriver_dCompilerCli_dfinishWarningsDir (Base_dPair.v_Base_dPair_dsecondOf dtb__86)) o1) outDir) 0)
  | _ -> failwith "DT: impossible branch"
)))) ((v_Vuna_dCompiler_dDriver_dCompilerCli_dapplyDiagConfig (Vuna_dCompiler_dPackages_dPkg.v_Vuna_dCompiler_dPackages_dPkg_dcontextPackageOf ctx)) o))) ((Vuna_dCompiler_dPackages_dPkg.v_Vuna_dCompiler_dPackages_dPkg_dcontextWithRelease (o).f_Vuna_dCompiler_dDriver_dCompilerCli_dCliOpts_optRelease) dtb__84))
  | _ -> failwith "DT: impossible branch"
))))

let v_Vuna_dCompiler_dDriver_dCompilerCli_dcompilePkgDir = (fun printResult dir outDir o -> (((Base_dMonad.v_Base_dMonad_dbind Base_dEff.v_Monad_uBase_uEff_uEff_ur) ((v_Vuna_dCompiler_dDriver_dCompilerCli_dexecutablePackage "compile") dir)) (fun pkgR -> (match pkgR with
  | Vuna_dCompiler_dDiag.C_Vuna_dCompiler_dDiag_dCheck_ErrC (dtb__87) -> ((v_Vuna_dCompiler_dDriver_dCompilerCli_dprintDiag o) dtb__87)
  | Vuna_dCompiler_dDiag.C_Vuna_dCompiler_dDiag_dCheck_OkC (dtb__88) -> ((fun o1 -> (((Base_dMonad.v_Base_dMonad_dbind Base_dEff.v_Monad_uBase_uEff_uEff_ur) ((((Vuna_dCompiler_dDriver_dCompile.v_Vuna_dCompiler_dDriver_dCompile_dcompileToDir ((Vuna_dCompiler_dPackages_dPkg.v_Vuna_dCompiler_dPackages_dPkg_dcontextWithRelease (o).f_Vuna_dCompiler_dDriver_dCompilerCli_dCliOpts_optRelease) (Vuna_dCompiler_dPackages_dPkg.v_Vuna_dCompiler_dPackages_dPkg_dpackageContext dtb__88))) (Vuna_dCompiler_dPackages_dPkg.v_Vuna_dCompiler_dPackages_dPkg_dpackageEntry dtb__88)) printResult) outDir)) (fun r -> (match r with
  | Vuna_dCompiler_dDiag.C_Vuna_dCompiler_dDiag_dCheck_ErrC (dtb__89) -> ((v_Vuna_dCompiler_dDriver_dCompilerCli_dprintDiag o1) dtb__89)
  | Vuna_dCompiler_dDiag.C_Vuna_dCompiler_dDiag_dCheck_OkC (dtb__90) -> ((((v_Vuna_dCompiler_dDriver_dCompilerCli_dfinishWarningsDir (Base_dPair.v_Base_dPair_dsecondOf dtb__90)) o1) outDir) 0)
  | _ -> failwith "DT: impossible branch"
)))) ((v_Vuna_dCompiler_dDriver_dCompilerCli_dapplyDiagConfig (Base_dMaybe.C_Base_dMaybe_dMaybe_Just (dtb__88))) o))
  | _ -> failwith "DT: impossible branch"
))))

let v_Vuna_dCompiler_dDriver_dCompilerCli_dcompileRun = (fun printResult entry outDir o -> (((Base_dMonad.v_Base_dMonad_dbind Base_dEff.v_Monad_uBase_uEff_uEff_ur) ((Base_dHostRow.v_Base_dHostRow_draiseToRow Base_dHostRow.v_Base_dHostRow_dhostRow) ((fun dtio_0 -> Base_dEff.C_Base_dEff_dEff_MkEff (fun (_ : Base_dEff.t_Base_dEff_dEffUnit) -> dtp_fileExists dtio_0)) entry))) (fun exists -> (if exists then (((Base_dMonad.v_Base_dMonad_dbind Base_dEff.v_Monad_uBase_uEff_uEff_ur) ((Base_dHostRow.v_Base_dHostRow_draiseToRow Base_dHostRow.v_Base_dHostRow_dhostRow) ((fun dtio_0 -> Base_dEff.C_Base_dEff_dEff_MkEff (fun (_ : Base_dEff.t_Base_dEff_dEffUnit) -> dtp_isDirectory dtio_0)) entry))) (fun isDir -> (if isDir then ((((v_Vuna_dCompiler_dDriver_dCompilerCli_dcompilePkgDir printResult) entry) outDir) o) else ((((v_Vuna_dCompiler_dDriver_dCompilerCli_dcompileFileEntry printResult) entry) outDir) o)))) else ((v_Vuna_dCompiler_dDriver_dCompilerCli_dwithOpts o) (v_Vuna_dCompiler_dDriver_dCompilerCli_ddtPathErr entry))))))

let v_Vuna_dCompiler_dDriver_dCompilerCli_dcompileFinish = (fun mc0 mc1 mc2 mc3 mc4 -> (match mc2 with
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Just (dtb__91) -> (match mc3 with
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing -> ((v_Vuna_dCompiler_dDriver_dCompilerCli_dwithOpts mc4) (v_Vuna_dCompiler_dDriver_dCompilerCli_dusageErr mc0))
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Just (dtb__92) -> ((((v_Vuna_dCompiler_dDriver_dCompilerCli_dcompileRun mc1) dtb__91) dtb__92) mc4)
  | _ -> failwith "DT: impossible branch"
)
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing -> ((v_Vuna_dCompiler_dDriver_dCompilerCli_dwithOpts mc4) (v_Vuna_dCompiler_dDriver_dCompilerCli_dusageErr mc0))
  | _ -> failwith "DT: impossible branch"
))

let rec v_Vuna_dCompiler_dDriver_dCompilerCli_dcompileParse = (fun prog printResult entry outDir args o -> ((fun nd_uscrut6 -> (match nd_uscrut6 with
  | Base_dList.C_Base_dList_dList_Cons (dtb__93, dtb__94) -> (if (dtb__93 = "--no-print") then ((((((v_Vuna_dCompiler_dDriver_dCompilerCli_dcompileParse prog) false) entry) outDir) dtb__94) o) else (if (dtb__93 = "--release") then ((((((v_Vuna_dCompiler_dDriver_dCompilerCli_dcompileParse prog) printResult) entry) outDir) dtb__94) (v_Vuna_dCompiler_dDriver_dCompilerCli_dmarkRelease o)) else (if ((Base_dString.v_Base_dString_dstartsWith "-") dtb__93) then ((v_Vuna_dCompiler_dDriver_dCompilerCli_dwithOpts o) ((v_Vuna_dCompiler_dDriver_dCompilerCli_dremovedFlag prog) dtb__93)) else (match entry with
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing -> ((((((v_Vuna_dCompiler_dDriver_dCompilerCli_dcompileParse prog) printResult) (Base_dMaybe.C_Base_dMaybe_dMaybe_Just (dtb__93))) outDir) dtb__94) o)
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Just (dtb__95) -> (match outDir with
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing -> ((((((v_Vuna_dCompiler_dDriver_dCompilerCli_dcompileParse prog) printResult) entry) (Base_dMaybe.C_Base_dMaybe_dMaybe_Just (dtb__93))) dtb__94) o)
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Just (dtb__96) -> ((v_Vuna_dCompiler_dDriver_dCompilerCli_dwithOpts o) (v_Vuna_dCompiler_dDriver_dCompilerCli_dusageErr prog))
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
))))
  | Base_dList.C_Base_dList_dList_Nil -> (((((v_Vuna_dCompiler_dDriver_dCompilerCli_dcompileFinish prog) printResult) entry) outDir) o)
  | _ -> failwith "DT: impossible branch"
)) args))

let v_Vuna_dCompiler_dDriver_dCompilerCli_dcompileArgs = (fun prog args o -> ((((((v_Vuna_dCompiler_dDriver_dCompilerCli_dcompileParse prog) true) Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing) Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing) args) o))

let rec v_Vuna_dCompiler_dDriver_dCompilerCli_dstripLangGo = (fun mc0 mc1 mc2 -> (match mc0 with
  | Base_dList.C_Base_dList_dList_Cons (dtb__97, dtb__98) -> (if (dtb__97 = "--lang") then (match dtb__98 with
  | Base_dList.C_Base_dList_dList_Cons (dtb__99, dtb__100) -> (((v_Vuna_dCompiler_dDriver_dCompilerCli_dstripLangGo dtb__100) mc1) dtb__99)
  | Base_dList.C_Base_dList_dList_Nil -> { Base_dPair.f_Base_dPair_dPair_first = (Base_dList.v_Base_dList_dreverse mc1); Base_dPair.f_Base_dPair_dPair_second = mc2 }
  | _ -> failwith "DT: impossible branch"
) else (if ((Base_dString.v_Base_dString_dstartsWith "--lang=") dtb__97) then (((v_Vuna_dCompiler_dDriver_dCompilerCli_dstripLangGo dtb__98) mc1) (((Base_dString.v_Base_dString_dsubstring (bi_natFromInt 7)) (bi_natFromInt ((bi_strLength dtb__97) - 7))) dtb__97)) else (((v_Vuna_dCompiler_dDriver_dCompilerCli_dstripLangGo dtb__98) (Base_dList.C_Base_dList_dList_Cons (dtb__97, mc1))) mc2)))
  | Base_dList.C_Base_dList_dList_Nil -> { Base_dPair.f_Base_dPair_dPair_first = (Base_dList.v_Base_dList_dreverse mc1); Base_dPair.f_Base_dPair_dPair_second = mc2 }
  | _ -> failwith "DT: impossible branch"
))

let v_Vuna_dCompiler_dDriver_dCompilerCli_dstripLang = (fun args -> (((v_Vuna_dCompiler_dDriver_dCompilerCli_dstripLangGo args) Base_dList.C_Base_dList_dList_Nil) "en"))

let rec v_Vuna_dCompiler_dDriver_dCompilerCli_dhasLangFlag = (fun mc0 -> (match mc0 with
  | Base_dList.C_Base_dList_dList_Cons (dtb__101, dtb__102) -> (if (if (dtb__101 = "--lang") then true else ((Base_dString.v_Base_dString_dstartsWith "--lang=") dtb__101)) then true else (v_Vuna_dCompiler_dDriver_dCompilerCli_dhasLangFlag dtb__102))
  | Base_dList.C_Base_dList_dList_Nil -> false
  | _ -> failwith "DT: impossible branch"
))

let rec v_Vuna_dCompiler_dDriver_dCompilerCli_dstripContinueGo = (fun mc0 mc1 mc2 -> (match mc0 with
  | Base_dList.C_Base_dList_dList_Cons (dtb__103, dtb__104) -> (if (dtb__103 = "--continue-on-error") then (((v_Vuna_dCompiler_dDriver_dCompilerCli_dstripContinueGo dtb__104) mc1) true) else (((v_Vuna_dCompiler_dDriver_dCompilerCli_dstripContinueGo dtb__104) (Base_dList.C_Base_dList_dList_Cons (dtb__103, mc1))) mc2))
  | Base_dList.C_Base_dList_dList_Nil -> { Base_dPair.f_Base_dPair_dPair_first = (Base_dList.v_Base_dList_dreverse mc1); Base_dPair.f_Base_dPair_dPair_second = mc2 }
  | _ -> failwith "DT: impossible branch"
))

let v_Vuna_dCompiler_dDriver_dCompilerCli_dstripContinueOnError = (fun args -> (((v_Vuna_dCompiler_dDriver_dCompilerCli_dstripContinueGo args) Base_dList.C_Base_dList_dList_Nil) false))

let v_Vuna_dCompiler_dDriver_dCompilerCli_dprintRecovered = (fun pkg e ds o -> ((fun shown -> (((Base_dMonad.v_Base_dMonad_dbind Base_dEff.v_Monad_uBase_uEff_uEff_ur) (((v_Vuna_dCompiler_dDriver_dCompilerCli_dprintDiagList o) (String.concat "" ["["; (Vuna_dCompiler_dPackages_dPkg.v_Vuna_dCompiler_dPackages_dPkg_dpackageName pkg); "] "])) shown)) (fun r -> (if ((Base_dList.v_Base_dList_dlength shown) = 0) then (((v_Vuna_dCompiler_dDriver_dCompilerCli_dprintDiagWithPrefix (Base_dPair.v_Base_dPair_dsecondOf r)) (String.concat "" ["["; (Vuna_dCompiler_dPackages_dPkg.v_Vuna_dCompiler_dPackages_dPkg_dpackageName pkg); "] "])) e) else ((Base_dApplicative.v_Base_dApplicative_dpure Base_dEff.v_Applicative_uBase_uEff_uEff_ur) { Base_dPair.f_Base_dPair_dPair_first = 1; Base_dPair.f_Base_dPair_dPair_second = (Base_dPair.v_Base_dPair_dsecondOf r) }))))) ((v_Vuna_dCompiler_dDriver_dCompilerCli_dtakeDiags (o).f_Vuna_dCompiler_dDriver_dCompilerCli_dCliOpts_optMaxErrors) ds)))

let v_Vuna_dCompiler_dDriver_dCompilerCli_dpackageRecoverExe = (fun pkg e o -> (((Base_dMonad.v_Base_dMonad_dbind Base_dEff.v_Monad_uBase_uEff_uEff_ur) ((Vuna_dCompiler_dDriver_dDt.v_Vuna_dCompiler_dDriver_dDt_ddtCheckRecovering ((Vuna_dCompiler_dPackages_dPkg.v_Vuna_dCompiler_dPackages_dPkg_dcontextWithRelease (o).f_Vuna_dCompiler_dDriver_dCompilerCli_dCliOpts_optRelease) (Vuna_dCompiler_dPackages_dPkg.v_Vuna_dCompiler_dPackages_dPkg_dpackageContext pkg))) (Vuna_dCompiler_dPackages_dPkg.v_Vuna_dCompiler_dPackages_dPkg_dpackageEntry pkg))) (fun recovered -> (match recovered with
  | Vuna_dCompiler_dDiag.C_Vuna_dCompiler_dDiag_dCheck_OkC (dtb__105) -> ((((v_Vuna_dCompiler_dDriver_dCompilerCli_dprintRecovered pkg) e) dtb__105) o)
  | Vuna_dCompiler_dDiag.C_Vuna_dCompiler_dDiag_dCheck_ErrC (dtb__106) -> (((v_Vuna_dCompiler_dDriver_dCompilerCli_dprintDiagWithPrefix o) (String.concat "" ["["; (Vuna_dCompiler_dPackages_dPkg.v_Vuna_dCompiler_dPackages_dPkg_dpackageName pkg); "] "])) dtb__106)
  | _ -> failwith "DT: impossible branch"
))))

let v_Vuna_dCompiler_dDriver_dCompilerCli_dpackageRecoverLib = (fun pkg e o -> (match (Vuna_dCompiler_dPackages_dPkg.v_Vuna_dCompiler_dPackages_dPkg_dpackageExports pkg) with
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Just (dtb__107) -> (((Base_dMonad.v_Base_dMonad_dbind Base_dEff.v_Monad_uBase_uEff_uEff_ur) ((Vuna_dCompiler_dDriver_dDt.v_Vuna_dCompiler_dDriver_dDt_ddtCheckLibraryRecovering ((Vuna_dCompiler_dPackages_dPkg.v_Vuna_dCompiler_dPackages_dPkg_dcontextWithRelease (o).f_Vuna_dCompiler_dDriver_dCompilerCli_dCliOpts_optRelease) (Vuna_dCompiler_dPackages_dPkg.v_Vuna_dCompiler_dPackages_dPkg_dpackageContext pkg))) dtb__107)) (fun recovered -> (match recovered with
  | Vuna_dCompiler_dDiag.C_Vuna_dCompiler_dDiag_dCheck_OkC (dtb__108) -> ((((v_Vuna_dCompiler_dDriver_dCompilerCli_dprintRecovered pkg) e) dtb__108) o)
  | Vuna_dCompiler_dDiag.C_Vuna_dCompiler_dDiag_dCheck_ErrC (dtb__109) -> (((v_Vuna_dCompiler_dDriver_dCompilerCli_dprintDiagWithPrefix o) (String.concat "" ["["; (Vuna_dCompiler_dPackages_dPkg.v_Vuna_dCompiler_dPackages_dPkg_dpackageName pkg); "] "])) dtb__109)
  | _ -> failwith "DT: impossible branch"
)))
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing -> (((v_Vuna_dCompiler_dDriver_dCompilerCli_dprintDiagWithPrefix o) (String.concat "" ["["; (Vuna_dCompiler_dPackages_dPkg.v_Vuna_dCompiler_dPackages_dPkg_dpackageName pkg); "] "])) e)
  | _ -> failwith "DT: impossible branch"
))

let v_Vuna_dCompiler_dDriver_dCompilerCli_dpackageRecover = (fun pkg e o -> (((Base_dMonad.v_Base_dMonad_dbind Base_dEff.v_Monad_uBase_uEff_uEff_ur) ((Base_dHostRow.v_Base_dHostRow_draiseToRow Base_dHostRow.v_Base_dHostRow_dhostRow) ((fun dtio_0 -> Base_dEff.C_Base_dEff_dEff_MkEff (fun (_ : Base_dEff.t_Base_dEff_dEffUnit) -> dtp_fileExists dtio_0)) (Vuna_dCompiler_dPackages_dPkg.v_Vuna_dCompiler_dPackages_dPkg_dpackageEntry pkg)))) (fun exists -> (if exists then (((v_Vuna_dCompiler_dDriver_dCompilerCli_dpackageRecoverExe pkg) e) o) else (((v_Vuna_dCompiler_dDriver_dCompilerCli_dpackageRecoverLib pkg) e) o)))))

let v_Vuna_dCompiler_dDriver_dCompilerCli_dcheckPackageErr = (fun pkg e o -> (if (o).f_Vuna_dCompiler_dDriver_dCompilerCli_dCliOpts_optContinueOnError then (((v_Vuna_dCompiler_dDriver_dCompilerCli_dpackageRecover pkg) e) o) else (((v_Vuna_dCompiler_dDriver_dCompilerCli_dprintDiagWithPrefix o) (String.concat "" ["["; (Vuna_dCompiler_dPackages_dPkg.v_Vuna_dCompiler_dPackages_dPkg_dpackageName pkg); "] "])) e)))

let v_Vuna_dCompiler_dDriver_dCompilerCli_dcheckPackageCode = (fun pkg wantWarnings o -> (((Base_dMonad.v_Base_dMonad_dbind Base_dEff.v_Monad_uBase_uEff_uEff_ur) (((Vuna_dCompiler_dDriver_dCompile.v_Vuna_dCompiler_dDriver_dCompile_dcheckPackage (o).f_Vuna_dCompiler_dDriver_dCompilerCli_dCliOpts_optRelease) wantWarnings) pkg)) (fun r -> (match r with
  | Vuna_dCompiler_dDiag.C_Vuna_dCompiler_dDiag_dCheck_ErrC (dtb__110) -> (((v_Vuna_dCompiler_dDriver_dCompilerCli_dcheckPackageErr pkg) dtb__110) o)
  | Vuna_dCompiler_dDiag.C_Vuna_dCompiler_dDiag_dCheck_OkC (dtb__111) -> ((fun ws -> ((fun shown -> ((fun failed -> (((Base_dMonad.v_Base_dMonad_dbind Base_dEff.v_Monad_uBase_uEff_uEff_ur) (((v_Vuna_dCompiler_dDriver_dCompilerCli_dprintDiagList o) (String.concat "" ["["; (Vuna_dCompiler_dPackages_dPkg.v_Vuna_dCompiler_dPackages_dPkg_dpackageName pkg); "] "])) shown)) (fun r1 -> ((Base_dApplicative.v_Base_dApplicative_dpure Base_dEff.v_Applicative_uBase_uEff_uEff_ur) { Base_dPair.f_Base_dPair_dPair_first = failed; Base_dPair.f_Base_dPair_dPair_second = (Base_dPair.v_Base_dPair_dsecondOf r1) })))) (if (if (o).f_Vuna_dCompiler_dDriver_dCompilerCli_dCliOpts_optDenyWarnings then ((Base_dList.v_Base_dList_dlength ws) > 0) else false) then 1 else 0))) (if (if (o).f_Vuna_dCompiler_dDriver_dCompilerCli_dCliOpts_optShowWarnings then true else (o).f_Vuna_dCompiler_dDriver_dCompilerCli_dCliOpts_optDenyWarnings) then ws else Base_dList.C_Base_dList_dList_Nil))) ((Base_dList.v_Base_dList_dfilter (v_Vuna_dCompiler_dDriver_dCompilerCli_downedByPackage pkg)) (Vuna_dCompiler_dDiagnostics_dSink.v_Vuna_dCompiler_dDiagnostics_dSink_ddedupeWarnings dtb__111)))
  | _ -> failwith "DT: impossible branch"
))))

let v_Vuna_dCompiler_dDriver_dCompilerCli_dcheckPackageSeq = (fun pkg code o -> ((fun o1 -> ((fun wantWarnings -> (((Base_dMonad.v_Base_dMonad_dbind Base_dEff.v_Monad_uBase_uEff_uEff_ur) (((v_Vuna_dCompiler_dDriver_dCompilerCli_dcheckPackageCode pkg) wantWarnings) o1)) (fun r -> ((Base_dApplicative.v_Base_dApplicative_dpure Base_dEff.v_Applicative_uBase_uEff_uEff_ur) { Base_dPair.f_Base_dPair_dPair_first = (if ((Base_dPair.v_Base_dPair_dfirstOf r) > code) then (Base_dPair.v_Base_dPair_dfirstOf r) else code); Base_dPair.f_Base_dPair_dPair_second = (Base_dPair.v_Base_dPair_dsecondOf r) })))) (if (o1).f_Vuna_dCompiler_dDriver_dCompilerCli_dCliOpts_optShowWarnings then true else (o1).f_Vuna_dCompiler_dDriver_dCompilerCli_dCliOpts_optDenyWarnings))) ((v_Vuna_dCompiler_dDriver_dCompilerCli_dapplyDiagConfig (Base_dMaybe.C_Base_dMaybe_dMaybe_Just (pkg))) o)))

let rec v_Vuna_dCompiler_dDriver_dCompilerCli_dcheckRootsSeq = (fun mc0 mc1 mc2 -> (match mc0 with
  | Base_dList.C_Base_dList_dList_Cons (dtb__112, dtb__113) -> (((Base_dMonad.v_Base_dMonad_dbind Base_dEff.v_Monad_uBase_uEff_uEff_ur) (((v_Vuna_dCompiler_dDriver_dCompilerCli_dcheckPackageSeq dtb__112) mc1) mc2)) (fun r -> (((v_Vuna_dCompiler_dDriver_dCompilerCli_dcheckRootsSeq dtb__113) (Base_dPair.v_Base_dPair_dfirstOf r)) (Base_dPair.v_Base_dPair_dsecondOf r))))
  | Base_dList.C_Base_dList_dList_Nil -> ((Base_dApplicative.v_Base_dApplicative_dpure Base_dEff.v_Applicative_uBase_uEff_uEff_ur) { Base_dPair.f_Base_dPair_dPair_first = mc1; Base_dPair.f_Base_dPair_dPair_second = mc2 })
  | _ -> failwith "DT: impossible branch"
))

let v_Vuna_dCompiler_dDriver_dCompilerCli_dcheckPackages = (fun mc0 mc1 mc2 -> (match mc0 with
  | Base_dList.C_Base_dList_dList_Cons (dtb__114, dtb__115) -> (match dtb__115 with
  | Base_dList.C_Base_dList_dList_Nil -> (((v_Vuna_dCompiler_dDriver_dCompilerCli_dcheckPackageSeq dtb__114) mc1) mc2)
  | _ -> (((Base_dMonad.v_Base_dMonad_dbind Base_dEff.v_Monad_uBase_uEff_uEff_ur) ((v_Vuna_dCompiler_dDriver_dCompilerCli_dmapEff (fun pkg -> (((Base_dMonad.v_Base_dMonad_dbind Base_dEff.v_Monad_uBase_uEff_uEff_ur) (v_Vuna_dCompiler_dDriver_dCompilerCli_disWorkspaceRoot pkg)) (fun root -> ((Base_dApplicative.v_Base_dApplicative_dpure Base_dEff.v_Applicative_uBase_uEff_uEff_ur) { Base_dPair.f_Base_dPair_dPair_first = pkg; Base_dPair.f_Base_dPair_dPair_second = root }))))) mc0)) (fun classified -> ((fun members -> ((fun roots -> (((Base_dMonad.v_Base_dMonad_dbind Base_dEff.v_Monad_uBase_uEff_uEff_ur) ((v_Vuna_dCompiler_dDriver_dCompilerCli_dmapEff (fun pkg -> (((Base_dMonad.v_Base_dMonad_dbind Base_dEff.v_Monad_uBase_uEff_uEff_ur) ((Base_dHostRow.v_Base_dHostRow_draiseToRow Base_dHostRow.v_Base_dHostRow_dhostRow) ((fun dtio_0 -> Base_dEff.C_Base_dEff_dEff_MkEff (fun (_ : Base_dEff.t_Base_dEff_dEffUnit) -> (fun args -> dtp_spawn (Base_dList.dtp_ocamlOf args)) dtio_0)) ((v_Vuna_dCompiler_dDriver_dCompilerCli_dcheckSpawnArgs mc2) (Vuna_dCompiler_dPackages_dPkg.v_Vuna_dCompiler_dPackages_dPkg_dpackageDir pkg))))) (fun pid -> ((Base_dApplicative.v_Base_dApplicative_dpure Base_dEff.v_Applicative_uBase_uEff_uEff_ur) { Base_dPair.f_Base_dPair_dPair_first = pkg; Base_dPair.f_Base_dPair_dPair_second = pid }))))) members)) (fun started -> (((Base_dMonad.v_Base_dMonad_dbind Base_dEff.v_Monad_uBase_uEff_uEff_ur) (((v_Vuna_dCompiler_dDriver_dCompilerCli_dcheckRootsSeq roots) mc1) mc2)) (fun r1 -> (((Base_dMonad.v_Base_dMonad_dbind Base_dEff.v_Monad_uBase_uEff_uEff_ur) ((v_Vuna_dCompiler_dDriver_dCompilerCli_dmapEff (fun pr -> ((fun dtio_0 -> Base_dEff.C_Base_dEff_dEff_MkEff (fun (_ : Base_dEff.t_Base_dEff_dEffUnit) -> dtp_wait dtio_0)) (Base_dPair.v_Base_dPair_dsecondOf pr)))) started)) (fun codes -> ((Base_dApplicative.v_Base_dApplicative_dpure Base_dEff.v_Applicative_uBase_uEff_uEff_ur) { Base_dPair.f_Base_dPair_dPair_first = ((v_Vuna_dCompiler_dDriver_dCompilerCli_dcountFailures (Base_dPair.v_Base_dPair_dfirstOf r1)) codes); Base_dPair.f_Base_dPair_dPair_second = (Base_dPair.v_Base_dPair_dsecondOf r1) })))))))) ((Base_dList.v_Base_dList_dmap Base_dPair.v_Base_dPair_dfirstOf) ((Base_dList.v_Base_dList_dfilter (fun p -> (Base_dPair.v_Base_dPair_dsecondOf p))) classified)))) ((Base_dList.v_Base_dList_dmap Base_dPair.v_Base_dPair_dfirstOf) ((Base_dList.v_Base_dList_dfilter (fun p -> (Base_dBool.v_Base_dBool_dnot (Base_dPair.v_Base_dPair_dsecondOf p)))) classified)))))
)
  | Base_dList.C_Base_dList_dList_Nil -> ((Base_dApplicative.v_Base_dApplicative_dpure Base_dEff.v_Applicative_uBase_uEff_uEff_ur) { Base_dPair.f_Base_dPair_dPair_first = mc1; Base_dPair.f_Base_dPair_dPair_second = mc2 })
  | _ -> failwith "DT: impossible branch"
))

let v_Vuna_dCompiler_dDriver_dCompilerCli_dcheckPkgDir = (fun dir o -> (((Base_dMonad.v_Base_dMonad_dbind Base_dEff.v_Monad_uBase_uEff_uEff_ur) (Vuna_dCompiler_dPackages_dPkg.v_Vuna_dCompiler_dPackages_dPkg_dworkspacePackages dir)) (fun pkgsR -> (match pkgsR with
  | Vuna_dCompiler_dDiag.C_Vuna_dCompiler_dDiag_dCheck_ErrC (dtb__116) -> ((v_Vuna_dCompiler_dDriver_dCompilerCli_dprintDiag o) dtb__116)
  | Vuna_dCompiler_dDiag.C_Vuna_dCompiler_dDiag_dCheck_OkC (dtb__117) -> (((v_Vuna_dCompiler_dDriver_dCompilerCli_dcheckPackages dtb__117) 0) o)
  | _ -> failwith "DT: impossible branch"
))))

let v_Vuna_dCompiler_dDriver_dCompilerCli_dcheckEmit = (fun path o -> (((Base_dMonad.v_Base_dMonad_dbind Base_dEff.v_Monad_uBase_uEff_uEff_ur) ((Base_dHostRow.v_Base_dHostRow_draiseToRow Base_dHostRow.v_Base_dHostRow_dhostRow) ((fun dtio_0 -> Base_dEff.C_Base_dEff_dEff_MkEff (fun (_ : Base_dEff.t_Base_dEff_dEffUnit) -> dtp_fileExists dtio_0)) path))) (fun exists -> (if exists then (((Base_dMonad.v_Base_dMonad_dbind Base_dEff.v_Monad_uBase_uEff_uEff_ur) ((Base_dHostRow.v_Base_dHostRow_draiseToRow Base_dHostRow.v_Base_dHostRow_dhostRow) ((fun dtio_0 -> Base_dEff.C_Base_dEff_dEff_MkEff (fun (_ : Base_dEff.t_Base_dEff_dEffUnit) -> dtp_isDirectory dtio_0)) path))) (fun isDir -> (if isDir then ((v_Vuna_dCompiler_dDriver_dCompilerCli_dcheckPkgDir path) o) else ((v_Vuna_dCompiler_dDriver_dCompilerCli_dcheckFileEntry path) o)))) else ((v_Vuna_dCompiler_dDriver_dCompilerCli_dwithOpts o) (v_Vuna_dCompiler_dDriver_dCompilerCli_ddtPathErr path))))))

let rec v_Vuna_dCompiler_dDriver_dCompilerCli_dcheckArgs = (fun mc0 mc1 mc2 -> (match mc1 with
  | Base_dList.C_Base_dList_dList_Cons (dtb__118, dtb__119) -> (if (dtb__118 = "--release") then (((v_Vuna_dCompiler_dDriver_dCompilerCli_dcheckArgs mc0) dtb__119) (v_Vuna_dCompiler_dDriver_dCompilerCli_dmarkRelease mc2)) else (if ((Base_dString.v_Base_dString_dstartsWith "-") dtb__118) then ((v_Vuna_dCompiler_dDriver_dCompilerCli_dwithOpts mc2) ((v_Vuna_dCompiler_dDriver_dCompilerCli_dremovedFlag mc0) dtb__118)) else (match dtb__119 with
  | Base_dList.C_Base_dList_dList_Nil -> ((v_Vuna_dCompiler_dDriver_dCompilerCli_dcheckEmit dtb__118) mc2)
  | _ -> ((v_Vuna_dCompiler_dDriver_dCompilerCli_dwithOpts mc2) (v_Vuna_dCompiler_dDriver_dCompilerCli_dusageErr mc0))
)))
  | Base_dList.C_Base_dList_dList_Nil -> ((v_Vuna_dCompiler_dDriver_dCompilerCli_dwithOpts mc2) (v_Vuna_dCompiler_dDriver_dCompilerCli_dusageErr mc0))
  | _ -> failwith "DT: impossible branch"
))

let v_Vuna_dCompiler_dDriver_dCompilerCli_drunCompilerCliFor1 = (fun prog args o -> (match args with
  | Base_dList.C_Base_dList_dList_Nil -> ((v_Vuna_dCompiler_dDriver_dCompilerCli_dwithOpts o) (v_Vuna_dCompiler_dDriver_dCompilerCli_dusageErr prog))
  | Base_dList.C_Base_dList_dList_Cons (dtb__120, dtb__121) -> (if (dtb__120 = "compile") then (((v_Vuna_dCompiler_dDriver_dCompilerCli_dcompileArgs prog) dtb__121) o) else (if (dtb__120 = "check") then (((v_Vuna_dCompiler_dDriver_dCompilerCli_dcheckArgs prog) dtb__121) o) else (if (dtb__120 = "build") then (((v_Vuna_dCompiler_dDriver_dCompilerCli_dbuildArgs prog) dtb__121) o) else (if (dtb__120 = "version") then ((v_Vuna_dCompiler_dDriver_dCompilerCli_dwithOpts o) (v_Vuna_dCompiler_dDriver_dCompilerCli_dprintVersion 0)) else (if (dtb__120 = "--version") then ((v_Vuna_dCompiler_dDriver_dCompilerCli_dwithOpts o) (v_Vuna_dCompiler_dDriver_dCompilerCli_dprintVersion 0)) else (if (dtb__120 = "seed") then ((v_Vuna_dCompiler_dDriver_dCompilerCli_dwithOpts o) (((v_Vuna_dCompiler_dDriver_dCompilerCli_dremovedCommand prog) "seed") "use `build --out OUT [DIR]` or `compile DIR OUT`")) else (if (dtb__120 = "help") then ((v_Vuna_dCompiler_dDriver_dCompilerCli_dwithOpts o) (v_Vuna_dCompiler_dDriver_dCompilerCli_dhelpFor prog)) else (if ((Base_dString.v_Base_dString_dstartsWith "-") dtb__120) then ((v_Vuna_dCompiler_dDriver_dCompilerCli_dwithOpts o) ((v_Vuna_dCompiler_dDriver_dCompilerCli_dremovedFlag prog) dtb__120)) else ((v_Vuna_dCompiler_dDriver_dCompilerCli_dwithOpts o) ((v_Vuna_dCompiler_dDriver_dCompilerCli_dunknownCommand prog) dtb__120))))))))))
  | _ -> failwith "DT: impossible branch"
))

let v_Vuna_dCompiler_dDriver_dCompilerCli_drunCompilerCliFor = (fun prog args -> (((Base_dMonad.v_Base_dMonad_dbind Base_dEff.v_Monad_uBase_uEff_uEff_ur) ((Base_dHostRow.v_Base_dHostRow_draiseToRow Base_dHostRow.v_Base_dHostRow_dhostRow) ((fun dtio_0 -> Base_dEff.C_Base_dEff_dEff_MkEff (fun (_ : Base_dEff.t_Base_dEff_dEffUnit) -> dtp_getenv dtio_0)) "VUNA_RELEASE"))) (fun envRel -> ((fun stripped -> ((fun strippedLang -> ((fun strippedMax -> ((fun kept -> ((fun strippedContinue -> ((fun detectedLang -> ((fun fmt -> ((fun opts -> (if (v_Vuna_dCompiler_dDriver_dCompilerCli_danyHelp (Base_dPair.v_Base_dPair_dfirstOf strippedContinue)) then (v_Vuna_dCompiler_dDriver_dCompilerCli_dhelpFor prog) else (((Base_dMonad.v_Base_dMonad_dbind Base_dEff.v_Monad_uBase_uEff_uEff_ur) (((v_Vuna_dCompiler_dDriver_dCompilerCli_drunCompilerCliFor1 prog) (Base_dPair.v_Base_dPair_dfirstOf strippedContinue)) opts)) (fun r -> ((v_Vuna_dCompiler_dDriver_dCompilerCli_dflushSarif (Base_dPair.v_Base_dPair_dfirstOf r)) (Base_dPair.v_Base_dPair_dsecondOf r)))))) { f_Vuna_dCompiler_dDriver_dCompilerCli_dCliOpts_optDiagFormat = fmt; f_Vuna_dCompiler_dDriver_dCompilerCli_dCliOpts_optDiagLang = detectedLang; f_Vuna_dCompiler_dDriver_dCompilerCli_dCliOpts_optLangExplicit = (v_Vuna_dCompiler_dDriver_dCompilerCli_dhasLangFlag args); f_Vuna_dCompiler_dDriver_dCompilerCli_dCliOpts_optDenyWarnings = (v_Vuna_dCompiler_dDriver_dCompilerCli_dhasDenyWarnings args); f_Vuna_dCompiler_dDriver_dCompilerCli_dCliOpts_optShowWarnings = (if (v_Vuna_dCompiler_dDriver_dCompilerCli_dhasDenyWarnings args) then true else (v_Vuna_dCompiler_dDriver_dCompilerCli_dhasShowWarnings args)); f_Vuna_dCompiler_dDriver_dCompilerCli_dCliOpts_optFormatExplicit = (v_Vuna_dCompiler_dDriver_dCompilerCli_dhasFormatFlag args); f_Vuna_dCompiler_dDriver_dCompilerCli_dCliOpts_optWarningsExplicit = (if (v_Vuna_dCompiler_dDriver_dCompilerCli_dhasDenyWarnings args) then true else (v_Vuna_dCompiler_dDriver_dCompilerCli_dhasShowWarnings args)); f_Vuna_dCompiler_dDriver_dCompilerCli_dCliOpts_optDenyExplicit = (v_Vuna_dCompiler_dDriver_dCompilerCli_dhasDenyWarnings args); f_Vuna_dCompiler_dDriver_dCompilerCli_dCliOpts_optMaxErrors = (Base_dPair.v_Base_dPair_dsecondOf strippedMax); f_Vuna_dCompiler_dDriver_dCompilerCli_dCliOpts_optContinueOnError = (Base_dPair.v_Base_dPair_dsecondOf strippedContinue); f_Vuna_dCompiler_dDriver_dCompilerCli_dCliOpts_optSarifItems = Base_dList.C_Base_dList_dList_Nil; f_Vuna_dCompiler_dDriver_dCompilerCli_dCliOpts_optRelease = (envRel = "1") })) (match (Base_dPair.v_Base_dPair_dsecondOf stripped) with
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Just (dtb__122) -> dtb__122
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing -> (if (detectedLang = "en") then "short" else "human")
  | _ -> failwith "DT: impossible branch"
))) (Base_dPair.v_Base_dPair_dsecondOf strippedLang))) (v_Vuna_dCompiler_dDriver_dCompilerCli_dstripContinueOnError kept))) (v_Vuna_dCompiler_dDriver_dCompilerCli_dstripDenyWarnings (Base_dPair.v_Base_dPair_dfirstOf strippedMax)))) (v_Vuna_dCompiler_dDriver_dCompilerCli_dstripMaxErrors (Base_dPair.v_Base_dPair_dfirstOf strippedLang)))) (v_Vuna_dCompiler_dDriver_dCompilerCli_dstripLang (Base_dPair.v_Base_dPair_dfirstOf stripped)))) (v_Vuna_dCompiler_dDriver_dCompilerCli_dstripDiagFormat args)))))

let v_Vuna_dCompiler_dDriver_dCompilerCli_drunCompilerCli = (fun args -> ((v_Vuna_dCompiler_dDriver_dCompilerCli_drunCompilerCliFor "vuna-compiler") args))
