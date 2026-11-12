open Vuna_runtime
let v_Vuna_dCompiler_dDriver_dDiagRender_disDigitCode = (fun c -> (if (c >= 48) then (c <= 57) else false))

let v_Vuna_dCompiler_dDriver_dDiagRender_disWordCode = (fun c -> (if (if (if (if (if (v_Vuna_dCompiler_dDriver_dDiagRender_disDigitCode c) then true else (if (c >= 65) then (c <= 90) else false)) then true else (if (c >= 97) then (c <= 122) else false)) then true else (c = 95)) then true else (c = 39)) then true else (c = 46)))

let rec v_Vuna_dCompiler_dDriver_dDiagRender_dcharAt = (fun mc0 mc1 -> (match mc0 with
  | Base_dList.C_Base_dList_dList_Cons (dtb__0, dtb__1) -> (if (mc1 <= 0) then dtb__0 else ((v_Vuna_dCompiler_dDriver_dDiagRender_dcharAt dtb__1) (mc1 - 1)))
  | Base_dList.C_Base_dList_dList_Nil -> (0 - 1)
  | _ -> failwith "DT: impossible branch"
))

let rec v_Vuna_dCompiler_dDriver_dDiagRender_dfindCharIdx = (fun mc0 mc1 mc2 -> (match mc1 with
  | Base_dList.C_Base_dList_dList_Cons (dtb__2, dtb__3) -> (if (dtb__2 = mc0) then mc2 else (((v_Vuna_dCompiler_dDriver_dDiagRender_dfindCharIdx mc0) dtb__3) (mc2 + 1)))
  | Base_dList.C_Base_dList_dList_Nil -> (0 - 1)
  | _ -> failwith "DT: impossible branch"
))

let v_Vuna_dCompiler_dDriver_dDiagRender_dclampInt = (fun lo hi v -> (if (v < lo) then lo else (if (v > hi) then hi else v)))

let v_Vuna_dCompiler_dDriver_dDiagRender_dpadLeft = (fun n s -> (if ((bi_strLength s) >= n) then s else (((Base_dString.v_Base_dString_drepeat (bi_natFromInt (n - (bi_strLength s)))) " ") ^ s)))

let rec v_Vuna_dCompiler_dDriver_dDiagRender_ddigitsValue = (fun mc0 mc1 -> (match mc0 with
  | Base_dList.C_Base_dList_dList_Cons (dtb__4, dtb__5) -> ((v_Vuna_dCompiler_dDriver_dDiagRender_ddigitsValue dtb__5) ((mc1 * 10) + (dtb__4 - 48)))
  | Base_dList.C_Base_dList_dList_Nil -> mc1
  | _ -> failwith "DT: impossible branch"
))

let v_Vuna_dCompiler_dDriver_dDiagRender_dparseNum = (fun s -> ((v_Vuna_dCompiler_dDriver_dDiagRender_ddigitsValue (Base_dList.dtp_unpack s)) 0))

let rec v_Vuna_dCompiler_dDriver_dDiagRender_dallDigitCodes = (fun mc0 -> (match mc0 with
  | Base_dList.C_Base_dList_dList_Cons (dtb__6, dtb__7) -> (if (v_Vuna_dCompiler_dDriver_dDiagRender_disDigitCode dtb__6) then (v_Vuna_dCompiler_dDriver_dDiagRender_dallDigitCodes dtb__7) else false)
  | Base_dList.C_Base_dList_dList_Nil -> true
  | _ -> failwith "DT: impossible branch"
))

let v_Vuna_dCompiler_dDriver_dDiagRender_disNumText = (fun s -> (if ((bi_strLength s) > 0) then (v_Vuna_dCompiler_dDriver_dDiagRender_dallDigitCodes (Base_dList.dtp_unpack s)) else false))

let rec v_Vuna_dCompiler_dDriver_dDiagRender_dlastText = (fun mc0 -> (match mc0 with
  | Base_dList.C_Base_dList_dList_Cons (dtb__8, dtb__9) -> (match dtb__9 with
  | Base_dList.C_Base_dList_dList_Nil -> dtb__8
  | _ -> (v_Vuna_dCompiler_dDriver_dDiagRender_dlastText dtb__9)
)
  | Base_dList.C_Base_dList_dList_Nil -> ""
  | _ -> failwith "DT: impossible branch"
))

let v_Vuna_dCompiler_dDriver_dDiagRender_dsplitCliPrefix = (fun s -> ((fun n -> { Base_dPair.f_Base_dPair_dPair_first = (((Base_dString.v_Base_dString_dsubstring 0) (bi_natFromInt n)) s); Base_dPair.f_Base_dPair_dPair_second = (((Base_dString.v_Base_dString_dsubstring (bi_natFromInt n)) (bi_natFromInt ((bi_strLength s) - n))) s) }) (if ((Base_dString.v_Base_dString_dstartsWith "error: ") s) then 7 else (if ((Base_dString.v_Base_dString_dstartsWith "warning: ") s) then 9 else 0))))

let v_Vuna_dCompiler_dDriver_dDiagRender_dsplitPkg = (fun s -> (if ((Base_dString.v_Base_dString_dstartsWith "[") s) then ((fun i -> (if (i < 0) then { Base_dPair.f_Base_dPair_dPair_first = ""; Base_dPair.f_Base_dPair_dPair_second = s } else (if (((v_Vuna_dCompiler_dDriver_dDiagRender_dcharAt (Base_dList.dtp_unpack s)) (i + 1)) = 32) then { Base_dPair.f_Base_dPair_dPair_first = (((Base_dString.v_Base_dString_dsubstring 0) (bi_natFromInt (i + 2))) s); Base_dPair.f_Base_dPair_dPair_second = (((Base_dString.v_Base_dString_dsubstring (bi_natFromInt (i + 2))) (bi_natFromInt (((bi_strLength s) - i) - 2))) s) } else { Base_dPair.f_Base_dPair_dPair_first = ""; Base_dPair.f_Base_dPair_dPair_second = s }))) (((v_Vuna_dCompiler_dDriver_dDiagRender_dfindCharIdx 93) (Base_dList.dtp_unpack s)) 0)) else { Base_dPair.f_Base_dPair_dPair_first = ""; Base_dPair.f_Base_dPair_dPair_second = s }))

let v_Vuna_dCompiler_dDriver_dDiagRender_ddropBracket = (fun s -> ((fun i -> (if (i < 0) then s else (Base_dString.v_Base_dString_dtrim (((Base_dString.v_Base_dString_dsubstring (bi_natFromInt (i + 1))) (bi_natFromInt (((bi_strLength s) - i) - 1))) s)))) (((v_Vuna_dCompiler_dDriver_dDiagRender_dfindCharIdx 93) (Base_dList.dtp_unpack s)) 0)))

let v_Vuna_dCompiler_dDriver_dDiagRender_dnormalizeFile = (fun part -> ((fun noBracket -> ((fun noLabel -> (Base_dString.v_Base_dString_dtrim noLabel)) (if ((Base_dString.v_Base_dString_dcontains ": ") noBracket) then (v_Vuna_dCompiler_dDriver_dDiagRender_dlastText ((Base_dString.v_Base_dString_dsplit ": ") noBracket)) else noBracket))) (if ((Base_dString.v_Base_dString_dstartsWith "[") part) then (v_Vuna_dCompiler_dDriver_dDiagRender_ddropBracket part) else part)))

let rec v_Vuna_dCompiler_dDriver_dDiagRender_dscanCandidates = (fun mc0 mc1 mc2 -> (match mc2 with
  | Base_dList.C_Base_dList_dList_Cons (dtb__10, dtb__11) -> (match dtb__11 with
  | Base_dList.C_Base_dList_dList_Nil -> Base_dList.C_Base_dList_dList_Nil
  | Base_dList.C_Base_dList_dList_Cons (dtb__12, dtb__13) -> (match dtb__13 with
  | Base_dList.C_Base_dList_dList_Nil -> Base_dList.C_Base_dList_dList_Nil
  | Base_dList.C_Base_dList_dList_Cons (dtb__14, dtb__15) -> ((fun next -> (if (if (v_Vuna_dCompiler_dDriver_dDiagRender_disNumText dtb__12) then (v_Vuna_dCompiler_dDriver_dDiagRender_disNumText dtb__14) else false) then (Base_dList.C_Base_dList_dList_Cons ({ Base_dPair.f_Base_dPair_dPair_first = (v_Vuna_dCompiler_dDriver_dDiagRender_dnormalizeFile ((Base_dString.v_Base_dString_djoin ":") (Base_dList.v_Base_dList_dreverse (Base_dList.C_Base_dList_dList_Cons (dtb__10, mc1))))); Base_dPair.f_Base_dPair_dPair_second = { Base_dPair.f_Base_dPair_dPair_first = (v_Vuna_dCompiler_dDriver_dDiagRender_dparseNum dtb__12); Base_dPair.f_Base_dPair_dPair_second = (v_Vuna_dCompiler_dDriver_dDiagRender_dparseNum dtb__14) } }, next)) else next)) (((v_Vuna_dCompiler_dDriver_dDiagRender_dscanCandidates mc0) (Base_dList.C_Base_dList_dList_Cons (dtb__10, mc1))) dtb__11))
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
)
  | Base_dList.C_Base_dList_dList_Nil -> Base_dList.C_Base_dList_dList_Nil
  | _ -> failwith "DT: impossible branch"
))

let v_Vuna_dCompiler_dDriver_dDiagRender_dlocCandidates = (fun msg -> (((v_Vuna_dCompiler_dDriver_dDiagRender_dscanCandidates msg) Base_dList.C_Base_dList_dList_Nil) ((Base_dString.v_Base_dString_dsplit ":") msg)))

let rec v_Vuna_dCompiler_dDriver_dDiagRender_dlineAt = (fun mc0 mc1 -> (match mc0 with
  | Base_dList.C_Base_dList_dList_Cons (dtb__16, dtb__17) -> (if (mc1 <= 1) then (Base_dMaybe.C_Base_dMaybe_dMaybe_Just (dtb__16)) else ((v_Vuna_dCompiler_dDriver_dDiagRender_dlineAt dtb__17) (mc1 - 1)))
  | Base_dList.C_Base_dList_dList_Nil -> Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing
  | _ -> failwith "DT: impossible branch"
))

let v_Vuna_dCompiler_dDriver_dDiagRender_dstripCr = (fun s -> (if ((Base_dString.v_Base_dString_dendsWith "\r") s) then (((Base_dString.v_Base_dString_dsubstring 0) (bi_natFromInt ((bi_strLength s) - 1))) s) else s))

let rec v_Vuna_dCompiler_dDriver_dDiagRender_dfirstReadableLocEff = (fun mc0 -> (match mc0 with
  | Base_dList.C_Base_dList_dList_Cons (dtb__18, dtb__19) -> (match dtb__18 with
  | { Base_dPair.f_Base_dPair_dPair_first = dtb__20; Base_dPair.f_Base_dPair_dPair_second = dtb__21 } -> (match dtb__21 with
  | { Base_dPair.f_Base_dPair_dPair_first = dtb__22; Base_dPair.f_Base_dPair_dPair_second = dtb__23 } -> (if (dtb__22 < 1) then (v_Vuna_dCompiler_dDriver_dDiagRender_dfirstReadableLocEff dtb__19) else (((Base_dMonad.v_Base_dMonad_dbind Base_dEff.v_Monad_uBase_uEff_uEff_ur) ((fun dtio_0 -> Base_dEff.C_Base_dEff_dEff_MkEff (fun (_ : Base_dEff.t_Base_dEff_dEffUnit) -> dtp_fileExists dtio_0)) dtb__20)) (fun exists -> (if exists then (((Base_dMonad.v_Base_dMonad_dbind Base_dEff.v_Monad_uBase_uEff_uEff_ur) ((fun dtio_0 -> Base_dEff.C_Base_dEff_dEff_MkEff (fun (_ : Base_dEff.t_Base_dEff_dEffUnit) -> dtp_isDirectory dtio_0)) dtb__20)) (fun isDir -> (if isDir then (v_Vuna_dCompiler_dDriver_dDiagRender_dfirstReadableLocEff dtb__19) else (((Base_dMonad.v_Base_dMonad_dbind Base_dEff.v_Monad_uBase_uEff_uEff_ur) ((fun dtio_0 -> Base_dEff.C_Base_dEff_dEff_MkEff (fun (_ : Base_dEff.t_Base_dEff_dEffUnit) -> dtp_readFile dtio_0)) dtb__20)) (fun raw -> (match ((v_Vuna_dCompiler_dDriver_dDiagRender_dlineAt (Base_dString.v_Base_dString_dlines raw)) dtb__22) with
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing -> (v_Vuna_dCompiler_dDriver_dDiagRender_dfirstReadableLocEff dtb__19)
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Just (dtb__24) -> ((Base_dApplicative.v_Base_dApplicative_dpure Base_dEff.v_Applicative_uBase_uEff_uEff_ur) (Base_dMaybe.C_Base_dMaybe_dMaybe_Just ({ Base_dPair.f_Base_dPair_dPair_first = dtb__20; Base_dPair.f_Base_dPair_dPair_second = { Base_dPair.f_Base_dPair_dPair_first = dtb__22; Base_dPair.f_Base_dPair_dPair_second = { Base_dPair.f_Base_dPair_dPair_first = dtb__23; Base_dPair.f_Base_dPair_dPair_second = (v_Vuna_dCompiler_dDriver_dDiagRender_dstripCr dtb__24) } } })))
  | _ -> failwith "DT: impossible branch"
)))))) else (v_Vuna_dCompiler_dDriver_dDiagRender_dfirstReadableLocEff dtb__19)))))
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
)
  | Base_dList.C_Base_dList_dList_Nil -> ((Base_dApplicative.v_Base_dApplicative_dpure Base_dEff.v_Applicative_uBase_uEff_uEff_ur) Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing)
  | _ -> failwith "DT: impossible branch"
))

let v_Vuna_dCompiler_dDriver_dDiagRender_dtabToSpace = (fun mc0 -> (if (mc0 = 9) then 32 else mc0))

let v_Vuna_dCompiler_dDriver_dDiagRender_ddisplayLine = (fun s -> (Base_dList.dtp_pack ((Base_dList.v_Base_dList_dmap v_Vuna_dCompiler_dDriver_dDiagRender_dtabToSpace) (Base_dList.dtp_unpack (v_Vuna_dCompiler_dDriver_dDiagRender_dstripCr s)))))

let v_Vuna_dCompiler_dDriver_dDiagRender_dcaretStart = (fun display col -> (((v_Vuna_dCompiler_dDriver_dDiagRender_dclampInt 0) (bi_strLength display)) (col - 1)))

let rec v_Vuna_dCompiler_dDriver_dDiagRender_dwordWidth = (fun mc0 mc1 -> (match mc0 with
  | Base_dList.C_Base_dList_dList_Cons (dtb__25, dtb__26) -> (if (v_Vuna_dCompiler_dDriver_dDiagRender_disWordCode dtb__25) then ((v_Vuna_dCompiler_dDriver_dDiagRender_dwordWidth dtb__26) (mc1 + 1)) else mc1)
  | Base_dList.C_Base_dList_dList_Nil -> mc1
  | _ -> failwith "DT: impossible branch"
))

let rec v_Vuna_dCompiler_dDriver_dDiagRender_dlitWidth = (fun mc0 mc1 mc2 -> (match mc0 with
  | Base_dList.C_Base_dList_dList_Cons (dtb__27, dtb__28) -> (if mc2 then (((v_Vuna_dCompiler_dDriver_dDiagRender_dlitWidth dtb__28) (mc1 + 1)) false) else (if (dtb__27 = 92) then (((v_Vuna_dCompiler_dDriver_dDiagRender_dlitWidth dtb__28) (mc1 + 1)) true) else (if (dtb__27 = 34) then (if (mc1 <= 0) then (((v_Vuna_dCompiler_dDriver_dDiagRender_dlitWidth dtb__28) (mc1 + 1)) false) else (mc1 + 1)) else (((v_Vuna_dCompiler_dDriver_dDiagRender_dlitWidth dtb__28) (mc1 + 1)) false))))
  | Base_dList.C_Base_dList_dList_Nil -> mc1
  | _ -> failwith "DT: impossible branch"
))

let v_Vuna_dCompiler_dDriver_dDiagRender_dcaretWidth = (fun chars start -> (match ((Base_dList.v_Base_dList_ddrop start) chars) with
  | Base_dList.C_Base_dList_dList_Nil -> 1
  | Base_dList.C_Base_dList_dList_Cons (dtb__29, dtb__30) -> (if (dtb__29 = 34) then (((v_Vuna_dCompiler_dDriver_dDiagRender_dlitWidth (Base_dList.C_Base_dList_dList_Cons (dtb__29, dtb__30))) 0) false) else (if (v_Vuna_dCompiler_dDriver_dDiagRender_disWordCode dtb__29) then ((v_Vuna_dCompiler_dDriver_dDiagRender_dwordWidth (Base_dList.C_Base_dList_dList_Cons (dtb__29, dtb__30))) 0) else 1))
  | _ -> failwith "DT: impossible branch"
))

let v_Vuna_dCompiler_dDriver_dDiagRender_dgutter = (fun width -> (((Base_dString.v_Base_dString_drepeat (bi_natFromInt (width + 1))) " ") ^ "|"))

let v_Vuna_dCompiler_dDriver_dDiagRender_dnumberRow = (fun width line display -> (String.concat "" [((v_Vuna_dCompiler_dDriver_dDiagRender_dpadLeft width) (bi_strFromInt line)); " | "; display]))

let v_Vuna_dCompiler_dDriver_dDiagRender_dcaretRow = (fun width start carets -> (String.concat "" [((Base_dString.v_Base_dString_drepeat (bi_natFromInt (width + 1))) " "); "|"; ((Base_dString.v_Base_dString_drepeat (bi_natFromInt (start + 1))) " "); ((Base_dString.v_Base_dString_drepeat (bi_natFromInt carets)) "^")]))

let v_Vuna_dCompiler_dDriver_dDiagRender_dsnippetBlock = (fun file line col srcLine -> ((fun display -> ((fun width -> ((fun start -> ((fun carets -> ((Base_dString.v_Base_dString_djoin "\n") (Base_dList.C_Base_dList_dList_Cons ((String.concat "" ["  --> "; file; ":"; (bi_strFromInt line); ":"; (bi_strFromInt col)]), (Base_dList.C_Base_dList_dList_Cons ((v_Vuna_dCompiler_dDriver_dDiagRender_dgutter width), (Base_dList.C_Base_dList_dList_Cons ((((v_Vuna_dCompiler_dDriver_dDiagRender_dnumberRow width) line) display), (Base_dList.C_Base_dList_dList_Cons ((((v_Vuna_dCompiler_dDriver_dDiagRender_dcaretRow width) start) carets), Base_dList.C_Base_dList_dList_Nil)))))))))) ((v_Vuna_dCompiler_dDriver_dDiagRender_dcaretWidth (Base_dList.dtp_unpack display)) start))) ((v_Vuna_dCompiler_dDriver_dDiagRender_dcaretStart display) col))) (bi_strLength (bi_strFromInt line)))) (v_Vuna_dCompiler_dDriver_dDiagRender_ddisplayLine srcLine)))

let v_Vuna_dCompiler_dDriver_dDiagRender_drenderBodyEff = (fun msg -> (((Base_dMonad.v_Base_dMonad_dbind Base_dEff.v_Monad_uBase_uEff_uEff_ur) (v_Vuna_dCompiler_dDriver_dDiagRender_dfirstReadableLocEff (v_Vuna_dCompiler_dDriver_dDiagRender_dlocCandidates msg))) (fun found -> ((fun nd_uscrut2 -> (match nd_uscrut2 with
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Just (dtb__31) -> (match dtb__31 with
  | { Base_dPair.f_Base_dPair_dPair_first = dtb__32; Base_dPair.f_Base_dPair_dPair_second = dtb__33 } -> (match dtb__33 with
  | { Base_dPair.f_Base_dPair_dPair_first = dtb__34; Base_dPair.f_Base_dPair_dPair_second = dtb__35 } -> (match dtb__35 with
  | { Base_dPair.f_Base_dPair_dPair_first = dtb__36; Base_dPair.f_Base_dPair_dPair_second = dtb__37 } -> ((Base_dApplicative.v_Base_dApplicative_dpure Base_dEff.v_Applicative_uBase_uEff_uEff_ur) (String.concat "" [msg; "\n"; ((((v_Vuna_dCompiler_dDriver_dDiagRender_dsnippetBlock dtb__32) dtb__34) dtb__36) dtb__37)]))
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
)
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing -> ((Base_dApplicative.v_Base_dApplicative_dpure Base_dEff.v_Applicative_uBase_uEff_uEff_ur) msg)
  | _ -> failwith "DT: impossible branch"
)) found))))

let v_Vuna_dCompiler_dDriver_dDiagRender_drenderBodyWithNewlineEff = (fun body -> ((fun trailing -> ((fun core -> (if ((Base_dString.v_Base_dString_dcontains "\n") core) then ((Base_dApplicative.v_Base_dApplicative_dpure Base_dEff.v_Applicative_uBase_uEff_uEff_ur) body) else (((Base_dMonad.v_Base_dMonad_dbind Base_dEff.v_Monad_uBase_uEff_uEff_ur) (v_Vuna_dCompiler_dDriver_dDiagRender_drenderBodyEff core)) (fun rendered -> ((Base_dApplicative.v_Base_dApplicative_dpure Base_dEff.v_Applicative_uBase_uEff_uEff_ur) (if trailing then (rendered ^ "\n") else rendered)))))) (if trailing then (((Base_dString.v_Base_dString_dsubstring 0) (bi_natFromInt ((bi_strLength body) - 1))) body) else body))) ((Base_dString.v_Base_dString_dendsWith "\n") body)))

let v_Vuna_dCompiler_dDriver_dDiagRender_drenderCliDiagnosticEff = (fun s -> ((fun pp -> ((fun pk -> (((Base_dMonad.v_Base_dMonad_dbind Base_dEff.v_Monad_uBase_uEff_uEff_ur) (v_Vuna_dCompiler_dDriver_dDiagRender_drenderBodyWithNewlineEff (Base_dPair.v_Base_dPair_dsecondOf pk))) (fun body -> ((Base_dApplicative.v_Base_dApplicative_dpure Base_dEff.v_Applicative_uBase_uEff_uEff_ur) (String.concat "" [(Base_dPair.v_Base_dPair_dfirstOf pp); (Base_dPair.v_Base_dPair_dfirstOf pk); body]))))) (v_Vuna_dCompiler_dDriver_dDiagRender_dsplitPkg (Base_dPair.v_Base_dPair_dsecondOf pp)))) (v_Vuna_dCompiler_dDriver_dDiagRender_dsplitCliPrefix s)))

let v_Vuna_dCompiler_dDriver_dDiagRender_drenderWithPrefixEff = (fun prefix msg -> ((fun pk -> (((Base_dMonad.v_Base_dMonad_dbind Base_dEff.v_Monad_uBase_uEff_uEff_ur) (v_Vuna_dCompiler_dDriver_dDiagRender_drenderBodyWithNewlineEff (Base_dPair.v_Base_dPair_dsecondOf pk))) (fun body -> ((Base_dApplicative.v_Base_dApplicative_dpure Base_dEff.v_Applicative_uBase_uEff_uEff_ur) (String.concat "" [prefix; (Base_dPair.v_Base_dPair_dfirstOf pk); body]))))) (v_Vuna_dCompiler_dDriver_dDiagRender_dsplitPkg msg)))
