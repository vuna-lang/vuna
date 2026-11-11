open Vuna_runtime
type t_Vuna_dCompiler_dFrontend_dManifest_dManifest = { f_Vuna_dCompiler_dFrontend_dManifest_dManifest_manifestName : string Base_dMaybe.t_Base_dMaybe_dMaybe; f_Vuna_dCompiler_dFrontend_dManifest_dManifest_manifestMembers : string Base_dList.t_Base_dList_dList; f_Vuna_dCompiler_dFrontend_dManifest_dManifest_manifestExports : string Base_dList.t_Base_dList_dList Base_dMaybe.t_Base_dMaybe_dMaybe; f_Vuna_dCompiler_dFrontend_dManifest_dManifest_manifestDependencies : (string, string) Base_dPair.t_Base_dPair_dPair Base_dList.t_Base_dList_dList; f_Vuna_dCompiler_dFrontend_dManifest_dManifest_manifestCapabilities : string Base_dList.t_Base_dList_dList; f_Vuna_dCompiler_dFrontend_dManifest_dManifest_manifestTrustUnsafe : string Base_dList.t_Base_dList_dList Base_dMaybe.t_Base_dMaybe_dMaybe; f_Vuna_dCompiler_dFrontend_dManifest_dManifest_manifestPrivileged : bool; f_Vuna_dCompiler_dFrontend_dManifest_dManifest_manifestHostModules : string Base_dList.t_Base_dList_dList; f_Vuna_dCompiler_dFrontend_dManifest_dManifest_manifestPath : string; f_Vuna_dCompiler_dFrontend_dManifest_dManifest_manifestDiagFormat : string Base_dMaybe.t_Base_dMaybe_dMaybe; f_Vuna_dCompiler_dFrontend_dManifest_dManifest_manifestDiagWarnings : bool Base_dMaybe.t_Base_dMaybe_dMaybe; f_Vuna_dCompiler_dFrontend_dManifest_dManifest_manifestDiagMaxErrors : int Base_dMaybe.t_Base_dMaybe_dMaybe; f_Vuna_dCompiler_dFrontend_dManifest_dManifest_manifestDiagLang : string Base_dMaybe.t_Base_dMaybe_dMaybe; f_Vuna_dCompiler_dFrontend_dManifest_dManifest_manifestDiagDenyWarnings : bool Base_dMaybe.t_Base_dMaybe_dMaybe }

let v_Vuna_dCompiler_dFrontend_dManifest_disDigitChar = (fun c -> (if (c >= 48) then (c <= 57) else false))

let v_Vuna_dCompiler_dFrontend_dManifest_disUpperAlphaChar = (fun c -> (if (c >= 65) then (c <= 90) else false))

let v_Vuna_dCompiler_dFrontend_dManifest_disLowerAlphaChar = (fun c -> (if (c >= 97) then (c <= 122) else false))

let v_Vuna_dCompiler_dFrontend_dManifest_datLine = (fun path line msg -> (if (path = "") then (String.concat "" ["line "; (bi_strFromInt line); ": "; msg]) else (String.concat "" [path; ":"; (bi_strFromInt line); ": "; msg])))

let v_Vuna_dCompiler_dFrontend_dManifest_dmanifestErr = (fun path msg -> (if (path = "") then msg else (String.concat "" [path; ": "; msg])))

let rec v_Vuna_dCompiler_dFrontend_dManifest_dsameSection = (fun _uctx0 mc0 mc1 -> (match mc0 with
  | Base_dList.C_Base_dList_dList_Cons (dtb__0, dtb__1) -> (match mc1 with
  | Base_dList.C_Base_dList_dList_Cons (dtb__2, dtb__3) -> (if (((Base_dEq.v_Base_dEq_deq _uctx0) dtb__0) dtb__2) then (((v_Vuna_dCompiler_dFrontend_dManifest_dsameSection _uctx0) dtb__1) dtb__3) else false)
  | _ -> false
)
  | Base_dList.C_Base_dList_dList_Nil -> (match mc1 with
  | Base_dList.C_Base_dList_dList_Nil -> true
  | _ -> false
)
  | _ -> failwith "DT: impossible branch"
))

let v_Vuna_dCompiler_dFrontend_dManifest_dfieldLine = (fun path section key entries -> (match (((Vuna_dCompiler_dFrontend_dToml.v_Vuna_dCompiler_dFrontend_dToml_dlookupEntryLine section) key) entries) with
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Just (dtb__4) -> dtb__4
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing -> 1
  | _ -> failwith "DT: impossible branch"
))

let v_Vuna_dCompiler_dFrontend_dManifest_dfieldLoc = (fun path section key entries -> (match (((Vuna_dCompiler_dFrontend_dToml.v_Vuna_dCompiler_dFrontend_dToml_dlookupEntryLine section) key) entries) with
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Just (dtb__5) -> (if (path = "") then (String.concat "" ["line "; (bi_strFromInt dtb__5); ": "]) else (String.concat "" [path; ":"; (bi_strFromInt dtb__5); ": "]))
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing -> (if (path = "") then "" else (path ^ ": "))
  | _ -> failwith "DT: impossible branch"
))

let v_Vuna_dCompiler_dFrontend_dManifest_dstringField = (fun path section key entries -> ((fun nd_uscrut4 -> (match nd_uscrut4 with
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Just (dtb__6) -> (match dtb__6 with
  | Vuna_dCompiler_dFrontend_dToml.C_Vuna_dCompiler_dFrontend_dToml_dTomlValue_TStr (dtb__7) -> (Vuna_dCompiler_dDiag.C_Vuna_dCompiler_dDiag_dCheck_OkC ((Base_dMaybe.C_Base_dMaybe_dMaybe_Just (dtb__7))))
  | _ -> ((((Vuna_dCompiler_dDiagnostics_dPkg.v_Vuna_dCompiler_dDiagnostics_dPkg_dpkgAt1 path) ((((v_Vuna_dCompiler_dFrontend_dManifest_dfieldLine path) section) key) entries)) (Vuna_dCompiler_dDiagnostics_dPkg.C_Vuna_dCompiler_dDiagnostics_dPkg_dPkgErr_ExpectedString (key))) key)
)
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing -> (Vuna_dCompiler_dDiag.C_Vuna_dCompiler_dDiag_dCheck_OkC (Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing))
  | _ -> failwith "DT: impossible branch"
)) (((Vuna_dCompiler_dFrontend_dToml.v_Vuna_dCompiler_dFrontend_dToml_dlookupEntry section) key) entries)))

let v_Vuna_dCompiler_dFrontend_dManifest_dstringListField = (fun path section key entries -> ((fun nd_uscrut4 -> (match nd_uscrut4 with
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Just (dtb__8) -> (match dtb__8 with
  | Vuna_dCompiler_dFrontend_dToml.C_Vuna_dCompiler_dFrontend_dToml_dTomlValue_TList (dtb__9) -> (Vuna_dCompiler_dDiag.C_Vuna_dCompiler_dDiag_dCheck_OkC ((Base_dMaybe.C_Base_dMaybe_dMaybe_Just (dtb__9))))
  | _ -> ((((Vuna_dCompiler_dDiagnostics_dPkg.v_Vuna_dCompiler_dDiagnostics_dPkg_dpkgAt1 path) ((((v_Vuna_dCompiler_dFrontend_dManifest_dfieldLine path) section) key) entries)) (Vuna_dCompiler_dDiagnostics_dPkg.C_Vuna_dCompiler_dDiagnostics_dPkg_dPkgErr_ExpectedStringArray (key))) key)
)
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing -> (Vuna_dCompiler_dDiag.C_Vuna_dCompiler_dDiag_dCheck_OkC (Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing))
  | _ -> failwith "DT: impossible branch"
)) (((Vuna_dCompiler_dFrontend_dToml.v_Vuna_dCompiler_dFrontend_dToml_dlookupEntry section) key) entries)))

let v_Vuna_dCompiler_dFrontend_dManifest_dintField = (fun path section key entries -> ((fun nd_uscrut4 -> (match nd_uscrut4 with
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Just (dtb__10) -> (match dtb__10 with
  | Vuna_dCompiler_dFrontend_dToml.C_Vuna_dCompiler_dFrontend_dToml_dTomlValue_TInt (dtb__11) -> (Vuna_dCompiler_dDiag.C_Vuna_dCompiler_dDiag_dCheck_OkC ((Base_dMaybe.C_Base_dMaybe_dMaybe_Just (dtb__11))))
  | _ -> ((((Vuna_dCompiler_dDiagnostics_dPkg.v_Vuna_dCompiler_dDiagnostics_dPkg_dpkgAt1 path) ((((v_Vuna_dCompiler_dFrontend_dManifest_dfieldLine path) section) key) entries)) (Vuna_dCompiler_dDiagnostics_dPkg.C_Vuna_dCompiler_dDiagnostics_dPkg_dPkgErr_ExpectedInt (key))) key)
)
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing -> (Vuna_dCompiler_dDiag.C_Vuna_dCompiler_dDiag_dCheck_OkC (Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing))
  | _ -> failwith "DT: impossible branch"
)) (((Vuna_dCompiler_dFrontend_dToml.v_Vuna_dCompiler_dFrontend_dToml_dlookupEntry section) key) entries)))

let v_Vuna_dCompiler_dFrontend_dManifest_dboolField = (fun path section key entries -> ((fun nd_uscrut4 -> (match nd_uscrut4 with
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Just (dtb__12) -> (match dtb__12 with
  | Vuna_dCompiler_dFrontend_dToml.C_Vuna_dCompiler_dFrontend_dToml_dTomlValue_TBool (dtb__13) -> (Vuna_dCompiler_dDiag.C_Vuna_dCompiler_dDiag_dCheck_OkC ((Base_dMaybe.C_Base_dMaybe_dMaybe_Just (dtb__13))))
  | _ -> ((((Vuna_dCompiler_dDiagnostics_dPkg.v_Vuna_dCompiler_dDiagnostics_dPkg_dpkgAt1 path) ((((v_Vuna_dCompiler_dFrontend_dManifest_dfieldLine path) section) key) entries)) (Vuna_dCompiler_dDiagnostics_dPkg.C_Vuna_dCompiler_dDiagnostics_dPkg_dPkgErr_ExpectedBool (key))) key)
)
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing -> (Vuna_dCompiler_dDiag.C_Vuna_dCompiler_dDiag_dCheck_OkC (Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing))
  | _ -> failwith "DT: impossible branch"
)) (((Vuna_dCompiler_dFrontend_dToml.v_Vuna_dCompiler_dFrontend_dToml_dlookupEntry section) key) entries)))

let v_Vuna_dCompiler_dFrontend_dManifest_dorEmptyList = (fun mc0 -> (match mc0 with
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Just (dtb__14) -> dtb__14
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing -> Base_dList.C_Base_dList_dList_Nil
  | _ -> failwith "DT: impossible branch"
))

let v_Vuna_dCompiler_dFrontend_dManifest_dorFalse = (fun mc0 -> (match mc0 with
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Just (dtb__15) -> dtb__15
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing -> false
  | _ -> failwith "DT: impossible branch"
))

let v_Vuna_dCompiler_dFrontend_dManifest_dcheckOneEntry = (fun mc0 mc1 -> (match mc1 with
  | { Vuna_dCompiler_dFrontend_dToml.f_Vuna_dCompiler_dFrontend_dToml_dTomlEntry_tomlEntrySection = dtb__16; Vuna_dCompiler_dFrontend_dToml.f_Vuna_dCompiler_dFrontend_dToml_dTomlEntry_tomlEntryKey = dtb__17; Vuna_dCompiler_dFrontend_dToml.f_Vuna_dCompiler_dFrontend_dToml_dTomlEntry_tomlEntryValue = dtb__18; Vuna_dCompiler_dFrontend_dToml.f_Vuna_dCompiler_dFrontend_dToml_dTomlEntry_tomlEntryLine = dtb__19 } -> (if (((v_Vuna_dCompiler_dFrontend_dManifest_dsameSection Base_dString.v_Eq_uString) dtb__16) Base_dList.C_Base_dList_dList_Nil) then ((((Vuna_dCompiler_dDiagnostics_dPkg.v_Vuna_dCompiler_dDiagnostics_dPkg_dpkgAt1 mc0) dtb__19) (Vuna_dCompiler_dDiagnostics_dPkg.C_Vuna_dCompiler_dDiagnostics_dPkg_dPkgErr_UnexpectedTopLevelKey (dtb__17))) dtb__17) else (if (((v_Vuna_dCompiler_dFrontend_dManifest_dsameSection Base_dString.v_Eq_uString) dtb__16) (Base_dList.C_Base_dList_dList_Cons ("package", Base_dList.C_Base_dList_dList_Nil))) then (if (if (dtb__17 = "name") then true else (dtb__17 = "privileged")) then (Vuna_dCompiler_dDiag.C_Vuna_dCompiler_dDiag_dCheck_OkC (0)) else (((((Vuna_dCompiler_dDiagnostics_dPkg.v_Vuna_dCompiler_dDiagnostics_dPkg_dpkgAt2 mc0) dtb__19) (Vuna_dCompiler_dDiagnostics_dPkg.C_Vuna_dCompiler_dDiagnostics_dPkg_dPkgErr_UnknownKey (dtb__17, "package"))) dtb__17) "package")) else (if (((v_Vuna_dCompiler_dFrontend_dManifest_dsameSection Base_dString.v_Eq_uString) dtb__16) (Base_dList.C_Base_dList_dList_Cons ("workspace", Base_dList.C_Base_dList_dList_Nil))) then (if (dtb__17 = "members") then (Vuna_dCompiler_dDiag.C_Vuna_dCompiler_dDiag_dCheck_OkC (0)) else (((((Vuna_dCompiler_dDiagnostics_dPkg.v_Vuna_dCompiler_dDiagnostics_dPkg_dpkgAt2 mc0) dtb__19) (Vuna_dCompiler_dDiagnostics_dPkg.C_Vuna_dCompiler_dDiagnostics_dPkg_dPkgErr_UnknownKey (dtb__17, "workspace"))) dtb__17) "workspace")) else (if (((v_Vuna_dCompiler_dFrontend_dManifest_dsameSection Base_dString.v_Eq_uString) dtb__16) (Base_dList.C_Base_dList_dList_Cons ("export", Base_dList.C_Base_dList_dList_Nil))) then (if (dtb__17 = "modules") then (Vuna_dCompiler_dDiag.C_Vuna_dCompiler_dDiag_dCheck_OkC (0)) else (((((Vuna_dCompiler_dDiagnostics_dPkg.v_Vuna_dCompiler_dDiagnostics_dPkg_dpkgAt2 mc0) dtb__19) (Vuna_dCompiler_dDiagnostics_dPkg.C_Vuna_dCompiler_dDiagnostics_dPkg_dPkgErr_UnknownKey (dtb__17, "export"))) dtb__17) "export")) else (if (((v_Vuna_dCompiler_dFrontend_dManifest_dsameSection Base_dString.v_Eq_uString) dtb__16) (Base_dList.C_Base_dList_dList_Cons ("capabilities", Base_dList.C_Base_dList_dList_Nil))) then (if (dtb__17 = "effects") then (Vuna_dCompiler_dDiag.C_Vuna_dCompiler_dDiag_dCheck_OkC (0)) else (((((Vuna_dCompiler_dDiagnostics_dPkg.v_Vuna_dCompiler_dDiagnostics_dPkg_dpkgAt2 mc0) dtb__19) (Vuna_dCompiler_dDiagnostics_dPkg.C_Vuna_dCompiler_dDiagnostics_dPkg_dPkgErr_UnknownKey (dtb__17, "capabilities"))) dtb__17) "capabilities")) else (if (((v_Vuna_dCompiler_dFrontend_dManifest_dsameSection Base_dString.v_Eq_uString) dtb__16) (Base_dList.C_Base_dList_dList_Cons ("trust", Base_dList.C_Base_dList_dList_Nil))) then (if (dtb__17 = "unsafe") then (Vuna_dCompiler_dDiag.C_Vuna_dCompiler_dDiag_dCheck_OkC (0)) else (((((Vuna_dCompiler_dDiagnostics_dPkg.v_Vuna_dCompiler_dDiagnostics_dPkg_dpkgAt2 mc0) dtb__19) (Vuna_dCompiler_dDiagnostics_dPkg.C_Vuna_dCompiler_dDiagnostics_dPkg_dPkgErr_UnknownKey (dtb__17, "trust"))) dtb__17) "trust")) else (if (((v_Vuna_dCompiler_dFrontend_dManifest_dsameSection Base_dString.v_Eq_uString) dtb__16) (Base_dList.C_Base_dList_dList_Cons ("privileged", Base_dList.C_Base_dList_dList_Nil))) then (if (dtb__17 = "modules") then (Vuna_dCompiler_dDiag.C_Vuna_dCompiler_dDiag_dCheck_OkC (0)) else (((((Vuna_dCompiler_dDiagnostics_dPkg.v_Vuna_dCompiler_dDiagnostics_dPkg_dpkgAt2 mc0) dtb__19) (Vuna_dCompiler_dDiagnostics_dPkg.C_Vuna_dCompiler_dDiagnostics_dPkg_dPkgErr_UnknownKey (dtb__17, "privileged"))) dtb__17) "privileged")) else (if (((v_Vuna_dCompiler_dFrontend_dManifest_dsameSection Base_dString.v_Eq_uString) dtb__16) (Base_dList.C_Base_dList_dList_Cons ("diagnostics", Base_dList.C_Base_dList_dList_Nil))) then (if (if (if (if (if (dtb__17 = "format") then true else (dtb__17 = "warnings")) then true else (dtb__17 = "max-errors")) then true else (dtb__17 = "lang")) then true else (dtb__17 = "deny-warnings")) then (Vuna_dCompiler_dDiag.C_Vuna_dCompiler_dDiag_dCheck_OkC (0)) else (((((Vuna_dCompiler_dDiagnostics_dPkg.v_Vuna_dCompiler_dDiagnostics_dPkg_dpkgAt2 mc0) dtb__19) (Vuna_dCompiler_dDiagnostics_dPkg.C_Vuna_dCompiler_dDiagnostics_dPkg_dPkgErr_UnknownKey (dtb__17, "diagnostics"))) dtb__17) "diagnostics")) else (if (((v_Vuna_dCompiler_dFrontend_dManifest_dsameSection Base_dString.v_Eq_uString) dtb__16) (Base_dList.C_Base_dList_dList_Cons ("dependencies", Base_dList.C_Base_dList_dList_Nil))) then (Vuna_dCompiler_dDiag.C_Vuna_dCompiler_dDiag_dCheck_OkC (0)) else ((((Vuna_dCompiler_dDiagnostics_dPkg.v_Vuna_dCompiler_dDiagnostics_dPkg_dpkgAt1 mc0) dtb__19) (Vuna_dCompiler_dDiagnostics_dPkg.C_Vuna_dCompiler_dDiagnostics_dPkg_dPkgErr_UnknownSection ((Vuna_dCompiler_dSource.v_Vuna_dCompiler_dSource_djoinDots dtb__16)))) (Vuna_dCompiler_dSource.v_Vuna_dCompiler_dSource_djoinDots dtb__16)))))))))))
  | _ -> failwith "DT: impossible branch"
))

let rec v_Vuna_dCompiler_dFrontend_dManifest_dcheckEntries = (fun mc0 mc1 -> (match mc1 with
  | Base_dList.C_Base_dList_dList_Cons (dtb__20, dtb__21) -> (match ((v_Vuna_dCompiler_dFrontend_dManifest_dcheckOneEntry mc0) dtb__20) with
  | Vuna_dCompiler_dDiag.C_Vuna_dCompiler_dDiag_dCheck_ErrC (dtb__22) -> (Vuna_dCompiler_dDiag.C_Vuna_dCompiler_dDiag_dCheck_ErrC (dtb__22))
  | Vuna_dCompiler_dDiag.C_Vuna_dCompiler_dDiag_dCheck_OkC (dtb__23) -> ((v_Vuna_dCompiler_dFrontend_dManifest_dcheckEntries mc0) dtb__21)
  | _ -> failwith "DT: impossible branch"
)
  | Base_dList.C_Base_dList_dList_Nil -> (Vuna_dCompiler_dDiag.C_Vuna_dCompiler_dDiag_dCheck_OkC (0))
  | _ -> failwith "DT: impossible branch"
))

let rec v_Vuna_dCompiler_dFrontend_dManifest_dcollectDependenciesAcc = (fun mc0 mc1 mc2 -> (match mc1 with
  | Base_dList.C_Base_dList_dList_Cons (dtb__24, dtb__25) -> (match dtb__24 with
  | { Vuna_dCompiler_dFrontend_dToml.f_Vuna_dCompiler_dFrontend_dToml_dTomlEntry_tomlEntrySection = dtb__26; Vuna_dCompiler_dFrontend_dToml.f_Vuna_dCompiler_dFrontend_dToml_dTomlEntry_tomlEntryKey = dtb__27; Vuna_dCompiler_dFrontend_dToml.f_Vuna_dCompiler_dFrontend_dToml_dTomlEntry_tomlEntryValue = dtb__28; Vuna_dCompiler_dFrontend_dToml.f_Vuna_dCompiler_dFrontend_dToml_dTomlEntry_tomlEntryLine = dtb__29 } -> (if (((v_Vuna_dCompiler_dFrontend_dManifest_dsameSection Base_dString.v_Eq_uString) dtb__26) (Base_dList.C_Base_dList_dList_Cons ("dependencies", Base_dList.C_Base_dList_dList_Nil))) then (match dtb__28 with
  | Vuna_dCompiler_dFrontend_dToml.C_Vuna_dCompiler_dFrontend_dToml_dTomlValue_TStr (dtb__30) -> (((v_Vuna_dCompiler_dFrontend_dManifest_dcollectDependenciesAcc mc0) dtb__25) (Base_dList.C_Base_dList_dList_Cons ({ Base_dPair.f_Base_dPair_dPair_first = dtb__27; Base_dPair.f_Base_dPair_dPair_second = dtb__30 }, mc2)))
  | _ -> ((((Vuna_dCompiler_dDiagnostics_dPkg.v_Vuna_dCompiler_dDiagnostics_dPkg_dpkgAt1 mc0) dtb__29) (Vuna_dCompiler_dDiagnostics_dPkg.C_Vuna_dCompiler_dDiagnostics_dPkg_dPkgErr_DependencyPathNotString (dtb__27))) dtb__27)
) else (((v_Vuna_dCompiler_dFrontend_dManifest_dcollectDependenciesAcc mc0) dtb__25) mc2))
  | _ -> failwith "DT: impossible branch"
)
  | Base_dList.C_Base_dList_dList_Nil -> (Vuna_dCompiler_dDiag.C_Vuna_dCompiler_dDiag_dCheck_OkC ((Base_dList.v_Base_dList_dreverse mc2)))
  | _ -> failwith "DT: impossible branch"
))

let v_Vuna_dCompiler_dFrontend_dManifest_dcollectDependencies = (fun path entries -> (((v_Vuna_dCompiler_dFrontend_dManifest_dcollectDependenciesAcc path) entries) Base_dList.C_Base_dList_dList_Nil))

let v_Vuna_dCompiler_dFrontend_dManifest_dvalidateDiagFormat = (fun mc0 mc1 -> (match mc1 with
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Just (dtb__31) -> (if (if (if (if (dtb__31 = "short") then true else (dtb__31 = "human")) then true else (dtb__31 = "json")) then true else (dtb__31 = "sarif")) then (Vuna_dCompiler_dDiag.C_Vuna_dCompiler_dDiag_dCheck_OkC (0)) else (((Vuna_dCompiler_dDiagnostics_dPkg.v_Vuna_dCompiler_dDiagnostics_dPkg_dpkgPath1 mc0) (Vuna_dCompiler_dDiagnostics_dPkg.C_Vuna_dCompiler_dDiagnostics_dPkg_dPkgErr_InvalidDiagFormat (dtb__31))) dtb__31))
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing -> (Vuna_dCompiler_dDiag.C_Vuna_dCompiler_dDiag_dCheck_OkC (0))
  | _ -> failwith "DT: impossible branch"
))

let v_Vuna_dCompiler_dFrontend_dManifest_dvalidateDiagMax = (fun mc0 mc1 -> (match mc1 with
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Just (dtb__32) -> (if (dtb__32 >= 1) then (Vuna_dCompiler_dDiag.C_Vuna_dCompiler_dDiag_dCheck_OkC (0)) else (((Vuna_dCompiler_dDiagnostics_dPkg.v_Vuna_dCompiler_dDiagnostics_dPkg_dpkgPath1 mc0) (Vuna_dCompiler_dDiagnostics_dPkg.C_Vuna_dCompiler_dDiagnostics_dPkg_dPkgErr_InvalidDiagMaxErrors ((bi_strFromInt dtb__32)))) (bi_strFromInt dtb__32)))
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing -> (Vuna_dCompiler_dDiag.C_Vuna_dCompiler_dDiag_dCheck_OkC (0))
  | _ -> failwith "DT: impossible branch"
))

let rec v_Vuna_dCompiler_dFrontend_dManifest_dvalidPackageChars = (fun mc0 -> (match mc0 with
  | Base_dList.C_Base_dList_dList_Cons (dtb__33, dtb__34) -> (if (if (if (v_Vuna_dCompiler_dFrontend_dManifest_disLowerAlphaChar dtb__33) then true else (v_Vuna_dCompiler_dFrontend_dManifest_disDigitChar dtb__33)) then true else (dtb__33 = 45)) then (v_Vuna_dCompiler_dFrontend_dManifest_dvalidPackageChars dtb__34) else false)
  | Base_dList.C_Base_dList_dList_Nil -> true
  | _ -> failwith "DT: impossible branch"
))

let v_Vuna_dCompiler_dFrontend_dManifest_dvalidPackageName = (fun name -> (v_Vuna_dCompiler_dFrontend_dManifest_dvalidPackageChars (Base_dList.dtp_unpack name)))

let rec v_Vuna_dCompiler_dFrontend_dManifest_dvalidModuleTail = (fun mc0 -> (match mc0 with
  | Base_dList.C_Base_dList_dList_Cons (dtb__35, dtb__36) -> (if (if (if (if (v_Vuna_dCompiler_dFrontend_dManifest_disUpperAlphaChar dtb__35) then true else (v_Vuna_dCompiler_dFrontend_dManifest_disLowerAlphaChar dtb__35)) then true else (v_Vuna_dCompiler_dFrontend_dManifest_disDigitChar dtb__35)) then true else (dtb__35 = 95)) then (v_Vuna_dCompiler_dFrontend_dManifest_dvalidModuleTail dtb__36) else false)
  | Base_dList.C_Base_dList_dList_Nil -> true
  | _ -> failwith "DT: impossible branch"
))

let v_Vuna_dCompiler_dFrontend_dManifest_dvalidModuleSegmentChars = (fun mc0 -> (match mc0 with
  | Base_dList.C_Base_dList_dList_Cons (dtb__37, dtb__38) -> (if (v_Vuna_dCompiler_dFrontend_dManifest_disUpperAlphaChar dtb__37) then (v_Vuna_dCompiler_dFrontend_dManifest_dvalidModuleTail dtb__38) else false)
  | Base_dList.C_Base_dList_dList_Nil -> false
  | _ -> failwith "DT: impossible branch"
))

let v_Vuna_dCompiler_dFrontend_dManifest_dvalidModuleSegment = (fun seg -> (v_Vuna_dCompiler_dFrontend_dManifest_dvalidModuleSegmentChars (Base_dList.dtp_unpack seg)))

let rec v_Vuna_dCompiler_dFrontend_dManifest_dvalidModuleSegments = (fun mc0 -> (match mc0 with
  | Base_dList.C_Base_dList_dList_Cons (dtb__39, dtb__40) -> (if (v_Vuna_dCompiler_dFrontend_dManifest_dvalidModuleSegment dtb__39) then (v_Vuna_dCompiler_dFrontend_dManifest_dvalidModuleSegments dtb__40) else false)
  | Base_dList.C_Base_dList_dList_Nil -> true
  | _ -> failwith "DT: impossible branch"
))

let v_Vuna_dCompiler_dFrontend_dManifest_dvalidModuleName = (fun name -> (v_Vuna_dCompiler_dFrontend_dManifest_dvalidModuleSegments (Vuna_dCompiler_dSource.v_Vuna_dCompiler_dSource_dsplitOnDot name)))

let v_Vuna_dCompiler_dFrontend_dManifest_dvalidateName = (fun mc0 mc1 -> (match mc1 with
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Just (dtb__41) -> (if (dtb__41 = "") then ((Vuna_dCompiler_dDiagnostics_dPkg.v_Vuna_dCompiler_dDiagnostics_dPkg_dpkgPath0 mc0) Vuna_dCompiler_dDiagnostics_dPkg.C_Vuna_dCompiler_dDiagnostics_dPkg_dPkgErr_EmptyPackageName) else (if (v_Vuna_dCompiler_dFrontend_dManifest_dvalidPackageName dtb__41) then (Vuna_dCompiler_dDiag.C_Vuna_dCompiler_dDiag_dCheck_OkC (0)) else (((Vuna_dCompiler_dDiagnostics_dPkg.v_Vuna_dCompiler_dDiagnostics_dPkg_dpkgPath1 mc0) (Vuna_dCompiler_dDiagnostics_dPkg.C_Vuna_dCompiler_dDiagnostics_dPkg_dPkgErr_InvalidPackageName (dtb__41))) dtb__41)))
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing -> ((Vuna_dCompiler_dDiagnostics_dPkg.v_Vuna_dCompiler_dDiagnostics_dPkg_dpkgPath0 mc0) Vuna_dCompiler_dDiagnostics_dPkg.C_Vuna_dCompiler_dDiagnostics_dPkg_dPkgErr_MissingPackageName)
  | _ -> failwith "DT: impossible branch"
))

let rec v_Vuna_dCompiler_dFrontend_dManifest_dvalidateMembers = (fun mc0 mc1 -> (match mc1 with
  | Base_dList.C_Base_dList_dList_Cons (dtb__42, dtb__43) -> (if (dtb__42 = "") then ((Vuna_dCompiler_dDiagnostics_dPkg.v_Vuna_dCompiler_dDiagnostics_dPkg_dpkgPath0 mc0) Vuna_dCompiler_dDiagnostics_dPkg.C_Vuna_dCompiler_dDiagnostics_dPkg_dPkgErr_EmptyMember) else ((v_Vuna_dCompiler_dFrontend_dManifest_dvalidateMembers mc0) dtb__43))
  | Base_dList.C_Base_dList_dList_Nil -> (Vuna_dCompiler_dDiag.C_Vuna_dCompiler_dDiag_dCheck_OkC (0))
  | _ -> failwith "DT: impossible branch"
))

let rec v_Vuna_dCompiler_dFrontend_dManifest_dvalidateModules = (fun mc0 mc1 -> (match mc1 with
  | Base_dList.C_Base_dList_dList_Cons (dtb__44, dtb__45) -> (if (v_Vuna_dCompiler_dFrontend_dManifest_dvalidModuleName dtb__44) then ((v_Vuna_dCompiler_dFrontend_dManifest_dvalidateModules mc0) dtb__45) else (((Vuna_dCompiler_dDiagnostics_dPkg.v_Vuna_dCompiler_dDiagnostics_dPkg_dpkgPath1 mc0) (Vuna_dCompiler_dDiagnostics_dPkg.C_Vuna_dCompiler_dDiagnostics_dPkg_dPkgErr_InvalidExportModule (dtb__44))) dtb__44))
  | Base_dList.C_Base_dList_dList_Nil -> (Vuna_dCompiler_dDiag.C_Vuna_dCompiler_dDiag_dCheck_OkC (0))
  | _ -> failwith "DT: impossible branch"
))

let v_Vuna_dCompiler_dFrontend_dManifest_dvalidateExports = (fun mc0 mc1 -> (match mc1 with
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Just (dtb__46) -> ((v_Vuna_dCompiler_dFrontend_dManifest_dvalidateModules mc0) dtb__46)
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing -> (Vuna_dCompiler_dDiag.C_Vuna_dCompiler_dDiag_dCheck_OkC (0))
  | _ -> failwith "DT: impossible branch"
))

let rec v_Vuna_dCompiler_dFrontend_dManifest_dvalidateDepsSeen = (fun mc0 mc1 mc2 -> (match mc2 with
  | Base_dList.C_Base_dList_dList_Cons (dtb__47, dtb__48) -> (match dtb__47 with
  | { Base_dPair.f_Base_dPair_dPair_first = dtb__49; Base_dPair.f_Base_dPair_dPair_second = dtb__50 } -> (if (dtb__49 = "") then ((Vuna_dCompiler_dDiagnostics_dPkg.v_Vuna_dCompiler_dDiagnostics_dPkg_dpkgPath0 mc0) Vuna_dCompiler_dDiagnostics_dPkg.C_Vuna_dCompiler_dDiagnostics_dPkg_dPkgErr_EmptyDependencyName) else (if (dtb__50 = "") then (((Vuna_dCompiler_dDiagnostics_dPkg.v_Vuna_dCompiler_dDiagnostics_dPkg_dpkgPath1 mc0) (Vuna_dCompiler_dDiagnostics_dPkg.C_Vuna_dCompiler_dDiagnostics_dPkg_dPkgErr_EmptyDependencyPath (dtb__49))) dtb__49) else (if ((Base_dList.v_Base_dList_dmemName dtb__49) mc1) then (((Vuna_dCompiler_dDiagnostics_dPkg.v_Vuna_dCompiler_dDiagnostics_dPkg_dpkgPath1 mc0) (Vuna_dCompiler_dDiagnostics_dPkg.C_Vuna_dCompiler_dDiagnostics_dPkg_dPkgErr_DuplicateDependency (dtb__49))) dtb__49) else (((v_Vuna_dCompiler_dFrontend_dManifest_dvalidateDepsSeen mc0) (Base_dList.C_Base_dList_dList_Cons (dtb__49, mc1))) dtb__48))))
  | _ -> failwith "DT: impossible branch"
)
  | Base_dList.C_Base_dList_dList_Nil -> (Vuna_dCompiler_dDiag.C_Vuna_dCompiler_dDiag_dCheck_OkC (0))
  | _ -> failwith "DT: impossible branch"
))

let v_Vuna_dCompiler_dFrontend_dManifest_dvalidateDependencies = (fun path deps -> (((v_Vuna_dCompiler_dFrontend_dManifest_dvalidateDepsSeen path) Base_dList.C_Base_dList_dList_Nil) deps))

let rec v_Vuna_dCompiler_dFrontend_dManifest_dvalidateCapsSeen = (fun mc0 mc1 mc2 -> (match mc2 with
  | Base_dList.C_Base_dList_dList_Cons (dtb__51, dtb__52) -> (if (dtb__51 = "") then ((Vuna_dCompiler_dDiagnostics_dPkg.v_Vuna_dCompiler_dDiagnostics_dPkg_dpkgPath0 mc0) Vuna_dCompiler_dDiagnostics_dPkg.C_Vuna_dCompiler_dDiagnostics_dPkg_dPkgErr_EmptyCapability) else (if ((Base_dList.v_Base_dList_dmemName dtb__51) mc1) then (((Vuna_dCompiler_dDiagnostics_dPkg.v_Vuna_dCompiler_dDiagnostics_dPkg_dpkgPath1 mc0) (Vuna_dCompiler_dDiagnostics_dPkg.C_Vuna_dCompiler_dDiagnostics_dPkg_dPkgErr_DuplicateCapability (dtb__51))) dtb__51) else (((v_Vuna_dCompiler_dFrontend_dManifest_dvalidateCapsSeen mc0) (Base_dList.C_Base_dList_dList_Cons (dtb__51, mc1))) dtb__52)))
  | Base_dList.C_Base_dList_dList_Nil -> (Vuna_dCompiler_dDiag.C_Vuna_dCompiler_dDiag_dCheck_OkC (0))
  | _ -> failwith "DT: impossible branch"
))

let v_Vuna_dCompiler_dFrontend_dManifest_dvalidateCapabilities = (fun path caps -> (((v_Vuna_dCompiler_dFrontend_dManifest_dvalidateCapsSeen path) Base_dList.C_Base_dList_dList_Nil) caps))

let v_Vuna_dCompiler_dFrontend_dManifest_dvalidTrustPointName = (fun name -> (match (Vuna_dCompiler_dSource.v_Vuna_dCompiler_dSource_dsplitLastDot (Vuna_dCompiler_dSource.v_Vuna_dCompiler_dSource_dsplitOnDot name)) with
  | { Base_dPair.f_Base_dPair_dPair_first = dtb__53; Base_dPair.f_Base_dPair_dPair_second = dtb__54 } -> (if (if (v_Vuna_dCompiler_dFrontend_dManifest_dvalidModuleName (Vuna_dCompiler_dSource.v_Vuna_dCompiler_dSource_djoinDots dtb__53)) then (dtb__54 <> "") else false) then (dtb__54 <> "_") else false)
  | _ -> failwith "DT: impossible branch"
))

let rec v_Vuna_dCompiler_dFrontend_dManifest_dvalidateTrustEntries = (fun mc0 mc1 mc2 -> (match mc2 with
  | Base_dList.C_Base_dList_dList_Cons (dtb__55, dtb__56) -> (if (dtb__55 = "") then ((Vuna_dCompiler_dDiagnostics_dPkg.v_Vuna_dCompiler_dDiagnostics_dPkg_dpkgPath0 mc0) Vuna_dCompiler_dDiagnostics_dPkg.C_Vuna_dCompiler_dDiagnostics_dPkg_dPkgErr_EmptyTrustPoint) else (if ((Base_dList.v_Base_dList_dmemName dtb__55) mc1) then (((Vuna_dCompiler_dDiagnostics_dPkg.v_Vuna_dCompiler_dDiagnostics_dPkg_dpkgPath1 mc0) (Vuna_dCompiler_dDiagnostics_dPkg.C_Vuna_dCompiler_dDiagnostics_dPkg_dPkgErr_DuplicateTrustPoint (dtb__55))) dtb__55) else (if (v_Vuna_dCompiler_dFrontend_dManifest_dvalidTrustPointName dtb__55) then (((v_Vuna_dCompiler_dFrontend_dManifest_dvalidateTrustEntries mc0) (Base_dList.C_Base_dList_dList_Cons (dtb__55, mc1))) dtb__56) else (((Vuna_dCompiler_dDiagnostics_dPkg.v_Vuna_dCompiler_dDiagnostics_dPkg_dpkgPath1 mc0) (Vuna_dCompiler_dDiagnostics_dPkg.C_Vuna_dCompiler_dDiagnostics_dPkg_dPkgErr_InvalidTrustPoint (dtb__55))) dtb__55))))
  | Base_dList.C_Base_dList_dList_Nil -> (Vuna_dCompiler_dDiag.C_Vuna_dCompiler_dDiag_dCheck_OkC (0))
  | _ -> failwith "DT: impossible branch"
))

let v_Vuna_dCompiler_dFrontend_dManifest_dvalidateTrust = (fun mc0 mc1 mc2 -> (match mc2 with
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Just (dtb__57) -> (if ((Base_dList.v_Base_dList_dmemName "unsafe") mc1) then (((v_Vuna_dCompiler_dFrontend_dManifest_dvalidateTrustEntries mc0) Base_dList.C_Base_dList_dList_Nil) dtb__57) else ((Vuna_dCompiler_dDiagnostics_dPkg.v_Vuna_dCompiler_dDiagnostics_dPkg_dpkgPath0 mc0) Vuna_dCompiler_dDiagnostics_dPkg.C_Vuna_dCompiler_dDiagnostics_dPkg_dPkgErr_TrustNeedsUnsafe))
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing -> (Vuna_dCompiler_dDiag.C_Vuna_dCompiler_dDiag_dCheck_OkC (0))
  | _ -> failwith "DT: impossible branch"
))

let v_Vuna_dCompiler_dFrontend_dManifest_dvalidatePrivilege = (fun mc0 mc1 mc2 mc3 mc4 -> (if mc1 then ((v_Vuna_dCompiler_dFrontend_dManifest_dvalidateModules mc0) mc4) else (match mc2 with
  | Base_dList.C_Base_dList_dList_Nil -> (match mc3 with
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing -> (match mc4 with
  | Base_dList.C_Base_dList_dList_Nil -> (Vuna_dCompiler_dDiag.C_Vuna_dCompiler_dDiag_dCheck_OkC (0))
  | _ -> ((Vuna_dCompiler_dDiagnostics_dPkg.v_Vuna_dCompiler_dDiagnostics_dPkg_dpkgPath0 mc0) Vuna_dCompiler_dDiagnostics_dPkg.C_Vuna_dCompiler_dDiagnostics_dPkg_dPkgErr_NonPrivileged)
)
  | _ -> ((Vuna_dCompiler_dDiagnostics_dPkg.v_Vuna_dCompiler_dDiagnostics_dPkg_dpkgPath0 mc0) Vuna_dCompiler_dDiagnostics_dPkg.C_Vuna_dCompiler_dDiagnostics_dPkg_dPkgErr_NonPrivileged)
)
  | _ -> ((Vuna_dCompiler_dDiagnostics_dPkg.v_Vuna_dCompiler_dDiagnostics_dPkg_dpkgPath0 mc0) Vuna_dCompiler_dDiagnostics_dPkg.C_Vuna_dCompiler_dDiagnostics_dPkg_dPkgErr_NonPrivileged)
)))

let v_Vuna_dCompiler_dFrontend_dManifest_dvalidateManifest = (fun mc0 -> (match mc0 with
  | { f_Vuna_dCompiler_dFrontend_dManifest_dManifest_manifestName = dtb__58; f_Vuna_dCompiler_dFrontend_dManifest_dManifest_manifestMembers = dtb__59; f_Vuna_dCompiler_dFrontend_dManifest_dManifest_manifestExports = dtb__60; f_Vuna_dCompiler_dFrontend_dManifest_dManifest_manifestDependencies = dtb__61; f_Vuna_dCompiler_dFrontend_dManifest_dManifest_manifestCapabilities = dtb__62; f_Vuna_dCompiler_dFrontend_dManifest_dManifest_manifestTrustUnsafe = dtb__63; f_Vuna_dCompiler_dFrontend_dManifest_dManifest_manifestPrivileged = dtb__64; f_Vuna_dCompiler_dFrontend_dManifest_dManifest_manifestHostModules = dtb__65; f_Vuna_dCompiler_dFrontend_dManifest_dManifest_manifestPath = dtb__66; f_Vuna_dCompiler_dFrontend_dManifest_dManifest_manifestDiagFormat = dtb__67; f_Vuna_dCompiler_dFrontend_dManifest_dManifest_manifestDiagWarnings = dtb__68; f_Vuna_dCompiler_dFrontend_dManifest_dManifest_manifestDiagMaxErrors = dtb__69; f_Vuna_dCompiler_dFrontend_dManifest_dManifest_manifestDiagLang = dtb__70; f_Vuna_dCompiler_dFrontend_dManifest_dManifest_manifestDiagDenyWarnings = dtb__71 } -> ((Vuna_dCompiler_dCommon.v_Vuna_dCompiler_dCommon_dbind ((v_Vuna_dCompiler_dFrontend_dManifest_dvalidateName dtb__66) dtb__58)) (fun okName -> ((Vuna_dCompiler_dCommon.v_Vuna_dCompiler_dCommon_dbind ((v_Vuna_dCompiler_dFrontend_dManifest_dvalidateMembers dtb__66) dtb__59)) (fun okMembers -> ((Vuna_dCompiler_dCommon.v_Vuna_dCompiler_dCommon_dbind ((v_Vuna_dCompiler_dFrontend_dManifest_dvalidateExports dtb__66) dtb__60)) (fun okExports -> ((Vuna_dCompiler_dCommon.v_Vuna_dCompiler_dCommon_dbind ((v_Vuna_dCompiler_dFrontend_dManifest_dvalidateDependencies dtb__66) dtb__61)) (fun okDeps -> ((Vuna_dCompiler_dCommon.v_Vuna_dCompiler_dCommon_dbind ((v_Vuna_dCompiler_dFrontend_dManifest_dvalidateCapabilities dtb__66) dtb__62)) (fun okCaps -> ((Vuna_dCompiler_dCommon.v_Vuna_dCompiler_dCommon_dbind (((v_Vuna_dCompiler_dFrontend_dManifest_dvalidateTrust dtb__66) dtb__62) dtb__63)) (fun okTrust -> ((Vuna_dCompiler_dCommon.v_Vuna_dCompiler_dCommon_dbind (((((v_Vuna_dCompiler_dFrontend_dManifest_dvalidatePrivilege dtb__66) dtb__64) dtb__62) dtb__63) dtb__65)) (fun okPriv -> (Vuna_dCompiler_dDiag.C_Vuna_dCompiler_dDiag_dCheck_OkC ({ f_Vuna_dCompiler_dFrontend_dManifest_dManifest_manifestName = dtb__58; f_Vuna_dCompiler_dFrontend_dManifest_dManifest_manifestMembers = dtb__59; f_Vuna_dCompiler_dFrontend_dManifest_dManifest_manifestExports = dtb__60; f_Vuna_dCompiler_dFrontend_dManifest_dManifest_manifestDependencies = dtb__61; f_Vuna_dCompiler_dFrontend_dManifest_dManifest_manifestCapabilities = dtb__62; f_Vuna_dCompiler_dFrontend_dManifest_dManifest_manifestTrustUnsafe = dtb__63; f_Vuna_dCompiler_dFrontend_dManifest_dManifest_manifestPrivileged = dtb__64; f_Vuna_dCompiler_dFrontend_dManifest_dManifest_manifestHostModules = dtb__65; f_Vuna_dCompiler_dFrontend_dManifest_dManifest_manifestPath = dtb__66; f_Vuna_dCompiler_dFrontend_dManifest_dManifest_manifestDiagFormat = dtb__67; f_Vuna_dCompiler_dFrontend_dManifest_dManifest_manifestDiagWarnings = dtb__68; f_Vuna_dCompiler_dFrontend_dManifest_dManifest_manifestDiagMaxErrors = dtb__69; f_Vuna_dCompiler_dFrontend_dManifest_dManifest_manifestDiagLang = dtb__70; f_Vuna_dCompiler_dFrontend_dManifest_dManifest_manifestDiagDenyWarnings = dtb__71 }))))))))))))))))
  | _ -> failwith "DT: impossible branch"
))

let v_Vuna_dCompiler_dFrontend_dManifest_ddirResult = (fun dir -> (if (dir = "") then "/" else dir))

let rec v_Vuna_dCompiler_dFrontend_dManifest_ddirFromRev = (fun mc0 -> (match mc0 with
  | Base_dList.C_Base_dList_dList_Cons (dtb__72, dtb__73) -> (if (dtb__72 = 47) then (v_Vuna_dCompiler_dFrontend_dManifest_ddirResult (Base_dList.dtp_pack (Base_dList.v_Base_dList_dreverse dtb__73))) else (v_Vuna_dCompiler_dFrontend_dManifest_ddirFromRev dtb__73))
  | Base_dList.C_Base_dList_dList_Nil -> "."
  | _ -> failwith "DT: impossible branch"
))

let v_Vuna_dCompiler_dFrontend_dManifest_dmanifestDir = (fun path -> (v_Vuna_dCompiler_dFrontend_dManifest_ddirFromRev (Base_dList.v_Base_dList_dreverse (Base_dList.dtp_unpack path))))

let v_Vuna_dCompiler_dFrontend_dManifest_dresolveManifestPath = (fun manifest rel -> ((fun dir -> (if ((Base_dString.v_Base_dString_dstartsWith "/") rel) then rel else (if (dir = ".") then rel else (String.concat "" [dir; "/"; rel])))) (v_Vuna_dCompiler_dFrontend_dManifest_dmanifestDir (manifest).f_Vuna_dCompiler_dFrontend_dManifest_dManifest_manifestPath)))

let v_Vuna_dCompiler_dFrontend_dManifest_dvalidateDiagLang = (fun mc0 mc1 -> (match mc1 with
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Just (dtb__74) -> (if (if (dtb__74 = "en") then true else (dtb__74 = "zh")) then (Vuna_dCompiler_dDiag.C_Vuna_dCompiler_dDiag_dCheck_OkC (0)) else (((Vuna_dCompiler_dDiagnostics_dPkg.v_Vuna_dCompiler_dDiagnostics_dPkg_dpkgPath1 mc0) (Vuna_dCompiler_dDiagnostics_dPkg.C_Vuna_dCompiler_dDiagnostics_dPkg_dPkgErr_InvalidDiagLang (dtb__74))) dtb__74))
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing -> (Vuna_dCompiler_dDiag.C_Vuna_dCompiler_dDiag_dCheck_OkC (0))
  | _ -> failwith "DT: impossible branch"
))

let v_Vuna_dCompiler_dFrontend_dManifest_dbuildManifest = (fun path entries -> ((Vuna_dCompiler_dCommon.v_Vuna_dCompiler_dCommon_dbind ((v_Vuna_dCompiler_dFrontend_dManifest_dcheckEntries path) entries)) (fun checked -> ((Vuna_dCompiler_dCommon.v_Vuna_dCompiler_dCommon_dbind ((((v_Vuna_dCompiler_dFrontend_dManifest_dstringField path) (Base_dList.C_Base_dList_dList_Cons ("package", Base_dList.C_Base_dList_dList_Nil))) "name") entries)) (fun name -> ((Vuna_dCompiler_dCommon.v_Vuna_dCompiler_dCommon_dbind ((((v_Vuna_dCompiler_dFrontend_dManifest_dstringListField path) (Base_dList.C_Base_dList_dList_Cons ("workspace", Base_dList.C_Base_dList_dList_Nil))) "members") entries)) (fun members -> ((Vuna_dCompiler_dCommon.v_Vuna_dCompiler_dCommon_dbind ((((v_Vuna_dCompiler_dFrontend_dManifest_dstringListField path) (Base_dList.C_Base_dList_dList_Cons ("export", Base_dList.C_Base_dList_dList_Nil))) "modules") entries)) (fun exports -> ((Vuna_dCompiler_dCommon.v_Vuna_dCompiler_dCommon_dbind ((v_Vuna_dCompiler_dFrontend_dManifest_dcollectDependencies path) entries)) (fun deps -> ((Vuna_dCompiler_dCommon.v_Vuna_dCompiler_dCommon_dbind ((((v_Vuna_dCompiler_dFrontend_dManifest_dstringListField path) (Base_dList.C_Base_dList_dList_Cons ("capabilities", Base_dList.C_Base_dList_dList_Nil))) "effects") entries)) (fun caps -> ((Vuna_dCompiler_dCommon.v_Vuna_dCompiler_dCommon_dbind ((((v_Vuna_dCompiler_dFrontend_dManifest_dstringListField path) (Base_dList.C_Base_dList_dList_Cons ("trust", Base_dList.C_Base_dList_dList_Nil))) "unsafe") entries)) (fun trust -> ((Vuna_dCompiler_dCommon.v_Vuna_dCompiler_dCommon_dbind ((((v_Vuna_dCompiler_dFrontend_dManifest_dboolField path) (Base_dList.C_Base_dList_dList_Cons ("package", Base_dList.C_Base_dList_dList_Nil))) "privileged") entries)) (fun privileged -> ((Vuna_dCompiler_dCommon.v_Vuna_dCompiler_dCommon_dbind ((((v_Vuna_dCompiler_dFrontend_dManifest_dstringListField path) (Base_dList.C_Base_dList_dList_Cons ("privileged", Base_dList.C_Base_dList_dList_Nil))) "modules") entries)) (fun hosts -> ((Vuna_dCompiler_dCommon.v_Vuna_dCompiler_dCommon_dbind ((((v_Vuna_dCompiler_dFrontend_dManifest_dstringField path) (Base_dList.C_Base_dList_dList_Cons ("diagnostics", Base_dList.C_Base_dList_dList_Nil))) "format") entries)) (fun diagFmt -> ((Vuna_dCompiler_dCommon.v_Vuna_dCompiler_dCommon_dbind ((((v_Vuna_dCompiler_dFrontend_dManifest_dboolField path) (Base_dList.C_Base_dList_dList_Cons ("diagnostics", Base_dList.C_Base_dList_dList_Nil))) "warnings") entries)) (fun diagWarns -> ((Vuna_dCompiler_dCommon.v_Vuna_dCompiler_dCommon_dbind ((((v_Vuna_dCompiler_dFrontend_dManifest_dintField path) (Base_dList.C_Base_dList_dList_Cons ("diagnostics", Base_dList.C_Base_dList_dList_Nil))) "max-errors") entries)) (fun diagMax -> ((Vuna_dCompiler_dCommon.v_Vuna_dCompiler_dCommon_dbind ((((v_Vuna_dCompiler_dFrontend_dManifest_dstringField path) (Base_dList.C_Base_dList_dList_Cons ("diagnostics", Base_dList.C_Base_dList_dList_Nil))) "lang") entries)) (fun diagLang -> ((Vuna_dCompiler_dCommon.v_Vuna_dCompiler_dCommon_dbind ((((v_Vuna_dCompiler_dFrontend_dManifest_dboolField path) (Base_dList.C_Base_dList_dList_Cons ("diagnostics", Base_dList.C_Base_dList_dList_Nil))) "deny-warnings") entries)) (fun diagDeny -> ((Vuna_dCompiler_dCommon.v_Vuna_dCompiler_dCommon_dbind ((v_Vuna_dCompiler_dFrontend_dManifest_dvalidateDiagFormat path) diagFmt)) (fun _u -> ((Vuna_dCompiler_dCommon.v_Vuna_dCompiler_dCommon_dbind ((v_Vuna_dCompiler_dFrontend_dManifest_dvalidateDiagMax path) diagMax)) (fun _u -> ((Vuna_dCompiler_dCommon.v_Vuna_dCompiler_dCommon_dbind ((v_Vuna_dCompiler_dFrontend_dManifest_dvalidateDiagLang path) diagLang)) (fun _u -> (Vuna_dCompiler_dDiag.C_Vuna_dCompiler_dDiag_dCheck_OkC ({ f_Vuna_dCompiler_dFrontend_dManifest_dManifest_manifestName = name; f_Vuna_dCompiler_dFrontend_dManifest_dManifest_manifestMembers = (v_Vuna_dCompiler_dFrontend_dManifest_dorEmptyList members); f_Vuna_dCompiler_dFrontend_dManifest_dManifest_manifestExports = exports; f_Vuna_dCompiler_dFrontend_dManifest_dManifest_manifestDependencies = deps; f_Vuna_dCompiler_dFrontend_dManifest_dManifest_manifestCapabilities = (v_Vuna_dCompiler_dFrontend_dManifest_dorEmptyList caps); f_Vuna_dCompiler_dFrontend_dManifest_dManifest_manifestTrustUnsafe = trust; f_Vuna_dCompiler_dFrontend_dManifest_dManifest_manifestPrivileged = (v_Vuna_dCompiler_dFrontend_dManifest_dorFalse privileged); f_Vuna_dCompiler_dFrontend_dManifest_dManifest_manifestHostModules = (v_Vuna_dCompiler_dFrontend_dManifest_dorEmptyList hosts); f_Vuna_dCompiler_dFrontend_dManifest_dManifest_manifestPath = path; f_Vuna_dCompiler_dFrontend_dManifest_dManifest_manifestDiagFormat = diagFmt; f_Vuna_dCompiler_dFrontend_dManifest_dManifest_manifestDiagWarnings = diagWarns; f_Vuna_dCompiler_dFrontend_dManifest_dManifest_manifestDiagMaxErrors = diagMax; f_Vuna_dCompiler_dFrontend_dManifest_dManifest_manifestDiagLang = diagLang; f_Vuna_dCompiler_dFrontend_dManifest_dManifest_manifestDiagDenyWarnings = diagDeny })))))))))))))))))))))))))))))))))))))

let v_Vuna_dCompiler_dFrontend_dManifest_dparseManifest = (fun path contents -> ((Vuna_dCompiler_dCommon.v_Vuna_dCompiler_dCommon_dbind ((Vuna_dCompiler_dFrontend_dToml.v_Vuna_dCompiler_dFrontend_dToml_dparseTomlAt path) contents)) (fun entries -> ((v_Vuna_dCompiler_dFrontend_dManifest_dbuildManifest path) entries))))
