open Vuna_runtime
let v_Vuna_dCompiler_dDriver_dDiagRender_disDigitCode = (fun c -> (if (c >= 48) then (c <= 57) else false))

let v_Vuna_dCompiler_dDriver_dDiagRender_disWordCode = (fun c -> (if (if (if (if (if (v_Vuna_dCompiler_dDriver_dDiagRender_disDigitCode c) then true else (if (c >= 65) then (c <= 90) else false)) then true else (if (c >= 97) then (c <= 122) else false)) then true else (c = 95)) then true else (c = 39)) then true else (c = 46)))

let rec v_Vuna_dCompiler_dDriver_dDiagRender_dcharAt = (fun mc0 mc1 -> (match mc0 with
  | Base_dList.C_Base_dList_dList_Base_dList_dCons (dtb__0, dtb__1) -> (if (mc1 <= 0) then dtb__0 else ((v_Vuna_dCompiler_dDriver_dDiagRender_dcharAt dtb__1) (mc1 - 1)))
  | Base_dList.C_Base_dList_dList_Base_dList_dNil -> (0 - 1)
  | _ -> failwith "DT: impossible branch"
))

let rec v_Vuna_dCompiler_dDriver_dDiagRender_dfindCharIdx = (fun mc0 mc1 mc2 -> (match mc1 with
  | Base_dList.C_Base_dList_dList_Base_dList_dCons (dtb__2, dtb__3) -> (if (dtb__2 = mc0) then mc2 else (((v_Vuna_dCompiler_dDriver_dDiagRender_dfindCharIdx mc0) dtb__3) (mc2 + 1)))
  | Base_dList.C_Base_dList_dList_Base_dList_dNil -> (0 - 1)
  | _ -> failwith "DT: impossible branch"
))

let v_Vuna_dCompiler_dDriver_dDiagRender_dclampInt = (fun lo hi v -> (if (v < lo) then lo else (if (v > hi) then hi else v)))

let v_Vuna_dCompiler_dDriver_dDiagRender_dpadLeft = (fun n s -> (if ((bi_strLength s) >= n) then s else (((Base_dString.v_Base_dString_drepeat (bi_natFromInt (n - (bi_strLength s)))) " ") ^ s)))

let rec v_Vuna_dCompiler_dDriver_dDiagRender_ddigitsValue = (fun mc0 mc1 -> (match mc0 with
  | Base_dList.C_Base_dList_dList_Base_dList_dCons (dtb__4, dtb__5) -> ((v_Vuna_dCompiler_dDriver_dDiagRender_ddigitsValue dtb__5) ((mc1 * 10) + (dtb__4 - 48)))
  | Base_dList.C_Base_dList_dList_Base_dList_dNil -> mc1
  | _ -> failwith "DT: impossible branch"
))

let v_Vuna_dCompiler_dDriver_dDiagRender_dparseNum = (fun s -> ((v_Vuna_dCompiler_dDriver_dDiagRender_ddigitsValue (Base_dList.dtp_unpack s)) 0))

let rec v_Vuna_dCompiler_dDriver_dDiagRender_dallDigitCodes = (fun mc0 -> (match mc0 with
  | Base_dList.C_Base_dList_dList_Base_dList_dCons (dtb__6, dtb__7) -> (if (v_Vuna_dCompiler_dDriver_dDiagRender_disDigitCode dtb__6) then (v_Vuna_dCompiler_dDriver_dDiagRender_dallDigitCodes dtb__7) else false)
  | Base_dList.C_Base_dList_dList_Base_dList_dNil -> true
  | _ -> failwith "DT: impossible branch"
))

let v_Vuna_dCompiler_dDriver_dDiagRender_disNumText = (fun s -> (if ((bi_strLength s) > 0) then (v_Vuna_dCompiler_dDriver_dDiagRender_dallDigitCodes (Base_dList.dtp_unpack s)) else false))

let rec v_Vuna_dCompiler_dDriver_dDiagRender_dlastText = (fun mc0 -> (match mc0 with
  | Base_dList.C_Base_dList_dList_Base_dList_dCons (dtb__8, dtb__9) -> (match dtb__9 with
  | Base_dList.C_Base_dList_dList_Base_dList_dNil -> dtb__8
  | _ -> (v_Vuna_dCompiler_dDriver_dDiagRender_dlastText dtb__9)
)
  | Base_dList.C_Base_dList_dList_Base_dList_dNil -> ""
  | _ -> failwith "DT: impossible branch"
))

let v_Vuna_dCompiler_dDriver_dDiagRender_dsplitCliPrefix = (fun s -> ((fun n -> (Base_dPair.C_Base_dPair_dPair_Base_dPair_dPair ((((Base_dString.v_Base_dString_dsubstring 0) (bi_natFromInt n)) s), (((Base_dString.v_Base_dString_dsubstring (bi_natFromInt n)) (bi_natFromInt ((bi_strLength s) - n))) s)))) (if ((Base_dString.v_Base_dString_dstartsWith "error: ") s) then 7 else (if ((Base_dString.v_Base_dString_dstartsWith "warning: ") s) then 9 else 0))))

let v_Vuna_dCompiler_dDriver_dDiagRender_dsplitPkg = (fun s -> (if ((Base_dString.v_Base_dString_dstartsWith "[") s) then ((fun i -> (if (i < 0) then (Base_dPair.C_Base_dPair_dPair_Base_dPair_dPair ("", s)) else (if (((v_Vuna_dCompiler_dDriver_dDiagRender_dcharAt (Base_dList.dtp_unpack s)) (i + 1)) = 32) then (Base_dPair.C_Base_dPair_dPair_Base_dPair_dPair ((((Base_dString.v_Base_dString_dsubstring 0) (bi_natFromInt (i + 2))) s), (((Base_dString.v_Base_dString_dsubstring (bi_natFromInt (i + 2))) (bi_natFromInt (((bi_strLength s) - i) - 2))) s))) else (Base_dPair.C_Base_dPair_dPair_Base_dPair_dPair ("", s))))) (((v_Vuna_dCompiler_dDriver_dDiagRender_dfindCharIdx 93) (Base_dList.dtp_unpack s)) 0)) else (Base_dPair.C_Base_dPair_dPair_Base_dPair_dPair ("", s))))

let v_Vuna_dCompiler_dDriver_dDiagRender_ddropBracket = (fun s -> ((fun i -> (if (i < 0) then s else (Base_dString.v_Base_dString_dtrim (((Base_dString.v_Base_dString_dsubstring (bi_natFromInt (i + 1))) (bi_natFromInt (((bi_strLength s) - i) - 1))) s)))) (((v_Vuna_dCompiler_dDriver_dDiagRender_dfindCharIdx 93) (Base_dList.dtp_unpack s)) 0)))

let v_Vuna_dCompiler_dDriver_dDiagRender_dnormalizeFile = (fun part -> ((fun noBracket -> ((fun noLabel -> (Base_dString.v_Base_dString_dtrim noLabel)) (if ((Base_dString.v_Base_dString_dcontains ": ") noBracket) then (v_Vuna_dCompiler_dDriver_dDiagRender_dlastText ((Base_dString.v_Base_dString_dsplit ": ") noBracket)) else noBracket))) (if ((Base_dString.v_Base_dString_dstartsWith "[") part) then (v_Vuna_dCompiler_dDriver_dDiagRender_ddropBracket part) else part)))

let rec v_Vuna_dCompiler_dDriver_dDiagRender_dscanCandidates = (fun mc0 mc1 mc2 -> (match mc2 with
  | Base_dList.C_Base_dList_dList_Base_dList_dCons (dtb__10, dtb__11) -> (match dtb__11 with
  | Base_dList.C_Base_dList_dList_Base_dList_dNil -> Base_dList.C_Base_dList_dList_Base_dList_dNil
  | Base_dList.C_Base_dList_dList_Base_dList_dCons (dtb__12, dtb__13) -> (match dtb__13 with
  | Base_dList.C_Base_dList_dList_Base_dList_dNil -> Base_dList.C_Base_dList_dList_Base_dList_dNil
  | Base_dList.C_Base_dList_dList_Base_dList_dCons (dtb__14, dtb__15) -> ((fun next -> (if (if (v_Vuna_dCompiler_dDriver_dDiagRender_disNumText dtb__12) then (v_Vuna_dCompiler_dDriver_dDiagRender_disNumText dtb__14) else false) then (Base_dList.C_Base_dList_dList_Base_dList_dCons ((Base_dPair.C_Base_dPair_dPair_Base_dPair_dPair ((v_Vuna_dCompiler_dDriver_dDiagRender_dnormalizeFile ((Base_dString.v_Base_dString_djoin ":") (Base_dList.v_Base_dList_dreverse (Base_dList.C_Base_dList_dList_Base_dList_dCons (dtb__10, mc1))))), (Base_dPair.C_Base_dPair_dPair_Base_dPair_dPair ((v_Vuna_dCompiler_dDriver_dDiagRender_dparseNum dtb__12), (v_Vuna_dCompiler_dDriver_dDiagRender_dparseNum dtb__14))))), next)) else next)) (((v_Vuna_dCompiler_dDriver_dDiagRender_dscanCandidates mc0) (Base_dList.C_Base_dList_dList_Base_dList_dCons (dtb__10, mc1))) dtb__11))
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
)
  | Base_dList.C_Base_dList_dList_Base_dList_dNil -> Base_dList.C_Base_dList_dList_Base_dList_dNil
  | _ -> failwith "DT: impossible branch"
))

let v_Vuna_dCompiler_dDriver_dDiagRender_dlocCandidates = (fun msg -> (((v_Vuna_dCompiler_dDriver_dDiagRender_dscanCandidates msg) Base_dList.C_Base_dList_dList_Base_dList_dNil) ((Base_dString.v_Base_dString_dsplit ":") msg)))

let rec v_Vuna_dCompiler_dDriver_dDiagRender_dlineAt = (fun mc0 mc1 -> (match mc0 with
  | Base_dList.C_Base_dList_dList_Base_dList_dCons (dtb__16, dtb__17) -> (if (mc1 <= 1) then (Base_dMaybe.C_Base_dMaybe_dMaybe_Base_dMaybe_dJust (dtb__16)) else ((v_Vuna_dCompiler_dDriver_dDiagRender_dlineAt dtb__17) (mc1 - 1)))
  | Base_dList.C_Base_dList_dList_Base_dList_dNil -> Base_dMaybe.C_Base_dMaybe_dMaybe_Base_dMaybe_dNothing
  | _ -> failwith "DT: impossible branch"
))

let v_Vuna_dCompiler_dDriver_dDiagRender_dstripCr = (fun s -> (if ((Base_dString.v_Base_dString_dendsWith "\r") s) then (((Base_dString.v_Base_dString_dsubstring 0) (bi_natFromInt ((bi_strLength s) - 1))) s) else s))

let rec v_Vuna_dCompiler_dDriver_dDiagRender_dfirstReadableLoc = (fun mc0 -> (match mc0 with
  | Base_dList.C_Base_dList_dList_Base_dList_dCons (dtb__18, dtb__19) -> (match dtb__18 with
  | Base_dPair.C_Base_dPair_dPair_Base_dPair_dPair (dtb__20, dtb__21) -> (match dtb__21 with
  | Base_dPair.C_Base_dPair_dPair_Base_dPair_dPair (dtb__22, dtb__23) -> (if (dtb__22 < 1) then (v_Vuna_dCompiler_dDriver_dDiagRender_dfirstReadableLoc dtb__19) else (if (Base_dIO.v_Base_dIO_drunIO (Base_dIO.v_Base_dIO_dfileExists dtb__20)) then (if (Base_dIO.v_Base_dIO_drunIO (Base_dIO.v_Base_dIO_disDirectory dtb__20)) then (v_Vuna_dCompiler_dDriver_dDiagRender_dfirstReadableLoc dtb__19) else ((fun srcLines -> (match ((v_Vuna_dCompiler_dDriver_dDiagRender_dlineAt srcLines) dtb__22) with
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Base_dMaybe_dNothing -> (v_Vuna_dCompiler_dDriver_dDiagRender_dfirstReadableLoc dtb__19)
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Base_dMaybe_dJust (dtb__24) -> (Base_dMaybe.C_Base_dMaybe_dMaybe_Base_dMaybe_dJust ((Base_dPair.C_Base_dPair_dPair_Base_dPair_dPair (dtb__20, (Base_dPair.C_Base_dPair_dPair_Base_dPair_dPair (dtb__22, (Base_dPair.C_Base_dPair_dPair_Base_dPair_dPair (dtb__23, (v_Vuna_dCompiler_dDriver_dDiagRender_dstripCr dtb__24)))))))))
  | _ -> failwith "DT: impossible branch"
)) (Base_dString.v_Base_dString_dlines (Base_dIO.v_Base_dIO_drunIO (Base_dIO.v_Base_dIO_dreadFile dtb__20))))) else (v_Vuna_dCompiler_dDriver_dDiagRender_dfirstReadableLoc dtb__19)))
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
)
  | Base_dList.C_Base_dList_dList_Base_dList_dNil -> Base_dMaybe.C_Base_dMaybe_dMaybe_Base_dMaybe_dNothing
  | _ -> failwith "DT: impossible branch"
))

let v_Vuna_dCompiler_dDriver_dDiagRender_dtabToSpace = (fun mc0 -> (if (mc0 = 9) then 32 else mc0))

let v_Vuna_dCompiler_dDriver_dDiagRender_ddisplayLine = (fun s -> (Base_dList.dtp_pack ((Base_dList.v_Base_dList_dmap v_Vuna_dCompiler_dDriver_dDiagRender_dtabToSpace) (Base_dList.dtp_unpack (v_Vuna_dCompiler_dDriver_dDiagRender_dstripCr s)))))

let v_Vuna_dCompiler_dDriver_dDiagRender_dcaretStart = (fun display col -> (((v_Vuna_dCompiler_dDriver_dDiagRender_dclampInt 0) (bi_strLength display)) (col - 1)))

let rec v_Vuna_dCompiler_dDriver_dDiagRender_dwordWidth = (fun mc0 mc1 -> (match mc0 with
  | Base_dList.C_Base_dList_dList_Base_dList_dCons (dtb__25, dtb__26) -> (if (v_Vuna_dCompiler_dDriver_dDiagRender_disWordCode dtb__25) then ((v_Vuna_dCompiler_dDriver_dDiagRender_dwordWidth dtb__26) (mc1 + 1)) else mc1)
  | Base_dList.C_Base_dList_dList_Base_dList_dNil -> mc1
  | _ -> failwith "DT: impossible branch"
))

let rec v_Vuna_dCompiler_dDriver_dDiagRender_dlitWidth = (fun mc0 mc1 mc2 -> (match mc0 with
  | Base_dList.C_Base_dList_dList_Base_dList_dCons (dtb__27, dtb__28) -> (if mc2 then (((v_Vuna_dCompiler_dDriver_dDiagRender_dlitWidth dtb__28) (mc1 + 1)) false) else (if (dtb__27 = 92) then (((v_Vuna_dCompiler_dDriver_dDiagRender_dlitWidth dtb__28) (mc1 + 1)) true) else (if (dtb__27 = 34) then (if (mc1 <= 0) then (((v_Vuna_dCompiler_dDriver_dDiagRender_dlitWidth dtb__28) (mc1 + 1)) false) else (mc1 + 1)) else (((v_Vuna_dCompiler_dDriver_dDiagRender_dlitWidth dtb__28) (mc1 + 1)) false))))
  | Base_dList.C_Base_dList_dList_Base_dList_dNil -> mc1
  | _ -> failwith "DT: impossible branch"
))

let v_Vuna_dCompiler_dDriver_dDiagRender_dcaretWidth = (fun chars start -> (match ((Base_dList.v_Base_dList_ddrop start) chars) with
  | Base_dList.C_Base_dList_dList_Base_dList_dNil -> 1
  | Base_dList.C_Base_dList_dList_Base_dList_dCons (dtb__29, dtb__30) -> (if (dtb__29 = 34) then (((v_Vuna_dCompiler_dDriver_dDiagRender_dlitWidth (Base_dList.C_Base_dList_dList_Base_dList_dCons (dtb__29, dtb__30))) 0) false) else (if (v_Vuna_dCompiler_dDriver_dDiagRender_disWordCode dtb__29) then ((v_Vuna_dCompiler_dDriver_dDiagRender_dwordWidth (Base_dList.C_Base_dList_dList_Base_dList_dCons (dtb__29, dtb__30))) 0) else 1))
  | _ -> failwith "DT: impossible branch"
))

let v_Vuna_dCompiler_dDriver_dDiagRender_dgutter = (fun width -> (((Base_dString.v_Base_dString_drepeat (bi_natFromInt (width + 1))) " ") ^ "|"))

let v_Vuna_dCompiler_dDriver_dDiagRender_dnumberRow = (fun width line display -> (String.concat "" [((v_Vuna_dCompiler_dDriver_dDiagRender_dpadLeft width) (bi_strFromInt line)); " | "; display]))

let v_Vuna_dCompiler_dDriver_dDiagRender_dcaretRow = (fun width start carets -> (String.concat "" [((Base_dString.v_Base_dString_drepeat (bi_natFromInt (width + 1))) " "); "|"; ((Base_dString.v_Base_dString_drepeat (bi_natFromInt (start + 1))) " "); ((Base_dString.v_Base_dString_drepeat (bi_natFromInt carets)) "^")]))

let v_Vuna_dCompiler_dDriver_dDiagRender_dsnippetBlock = (fun file line col srcLine -> ((fun display -> ((fun width -> ((fun start -> ((fun carets -> ((Base_dString.v_Base_dString_djoin "\n") (Base_dList.C_Base_dList_dList_Base_dList_dCons ((String.concat "" ["  --> "; file; ":"; (bi_strFromInt line); ":"; (bi_strFromInt col)]), (Base_dList.C_Base_dList_dList_Base_dList_dCons ((v_Vuna_dCompiler_dDriver_dDiagRender_dgutter width), (Base_dList.C_Base_dList_dList_Base_dList_dCons ((((v_Vuna_dCompiler_dDriver_dDiagRender_dnumberRow width) line) display), (Base_dList.C_Base_dList_dList_Base_dList_dCons ((((v_Vuna_dCompiler_dDriver_dDiagRender_dcaretRow width) start) carets), Base_dList.C_Base_dList_dList_Base_dList_dNil)))))))))) ((v_Vuna_dCompiler_dDriver_dDiagRender_dcaretWidth (Base_dList.dtp_unpack display)) start))) ((v_Vuna_dCompiler_dDriver_dDiagRender_dcaretStart display) col))) (bi_strLength (bi_strFromInt line)))) (v_Vuna_dCompiler_dDriver_dDiagRender_ddisplayLine srcLine)))

let v_Vuna_dCompiler_dDriver_dDiagRender_drenderBody = (fun msg -> ((fun nd_uscrut1 -> (match nd_uscrut1 with
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Base_dMaybe_dJust (dtb__31) -> (match dtb__31 with
  | Base_dPair.C_Base_dPair_dPair_Base_dPair_dPair (dtb__32, dtb__33) -> (match dtb__33 with
  | Base_dPair.C_Base_dPair_dPair_Base_dPair_dPair (dtb__34, dtb__35) -> (match dtb__35 with
  | Base_dPair.C_Base_dPair_dPair_Base_dPair_dPair (dtb__36, dtb__37) -> (String.concat "" [msg; "\n"; ((((v_Vuna_dCompiler_dDriver_dDiagRender_dsnippetBlock dtb__32) dtb__34) dtb__36) dtb__37)])
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
)
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Base_dMaybe_dNothing -> msg
  | _ -> failwith "DT: impossible branch"
)) (v_Vuna_dCompiler_dDriver_dDiagRender_dfirstReadableLoc (v_Vuna_dCompiler_dDriver_dDiagRender_dlocCandidates msg))))

let v_Vuna_dCompiler_dDriver_dDiagRender_drenderBodyWithNewline = (fun body -> ((fun trailing -> ((fun core -> (if ((Base_dString.v_Base_dString_dcontains "\n") core) then body else ((fun rendered -> (if trailing then (rendered ^ "\n") else rendered)) (v_Vuna_dCompiler_dDriver_dDiagRender_drenderBody core)))) (if trailing then (((Base_dString.v_Base_dString_dsubstring 0) (bi_natFromInt ((bi_strLength body) - 1))) body) else body))) ((Base_dString.v_Base_dString_dendsWith "\n") body)))

let v_Vuna_dCompiler_dDriver_dDiagRender_drenderCliDiagnostic = (fun s -> ((fun pp -> ((fun pk -> (String.concat "" [(Base_dPair.v_Base_dPair_dfirstOf pp); (Base_dPair.v_Base_dPair_dfirstOf pk); (v_Vuna_dCompiler_dDriver_dDiagRender_drenderBodyWithNewline (Base_dPair.v_Base_dPair_dsecondOf pk))])) (v_Vuna_dCompiler_dDriver_dDiagRender_dsplitPkg (Base_dPair.v_Base_dPair_dsecondOf pp)))) (v_Vuna_dCompiler_dDriver_dDiagRender_dsplitCliPrefix s)))

let v_Vuna_dCompiler_dDriver_dDiagRender_drenderWithPrefix = (fun prefix msg -> ((fun pk -> (String.concat "" [prefix; (Base_dPair.v_Base_dPair_dfirstOf pk); (v_Vuna_dCompiler_dDriver_dDiagRender_drenderBodyWithNewline (Base_dPair.v_Base_dPair_dsecondOf pk))])) (v_Vuna_dCompiler_dDriver_dDiagRender_dsplitPkg msg)))
