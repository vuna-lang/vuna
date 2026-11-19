open Vuna_runtime
type t_Vuna_dCompiler_dFrontend_dToml_dTomlValue = C_Vuna_dCompiler_dFrontend_dToml_dTomlValue_TStr of (string) | C_Vuna_dCompiler_dFrontend_dToml_dTomlValue_TInt of (int) | C_Vuna_dCompiler_dFrontend_dToml_dTomlValue_TBool of (bool) | C_Vuna_dCompiler_dFrontend_dToml_dTomlValue_TArray of (t_Vuna_dCompiler_dFrontend_dToml_dTomlValue Base_dData_dList.t_Base_dData_dList_dList) | C_Vuna_dCompiler_dFrontend_dToml_dTomlValue_TTable of ((string, t_Vuna_dCompiler_dFrontend_dToml_dTomlValue) Base_dData_dPair.t_Base_dData_dPair_dPair Base_dData_dList.t_Base_dData_dList_dList) | C_Vuna_dCompiler_dFrontend_dToml_dTomlValue_TTableArray of ((string, t_Vuna_dCompiler_dFrontend_dToml_dTomlValue) Base_dData_dPair.t_Base_dData_dPair_dPair Base_dData_dList.t_Base_dData_dList_dList Base_dData_dList.t_Base_dData_dList_dList)
and t_Vuna_dCompiler_dFrontend_dToml_dTomlEntry = { f_Vuna_dCompiler_dFrontend_dToml_dTomlEntry_tomlEntrySection : string Base_dData_dList.t_Base_dData_dList_dList; f_Vuna_dCompiler_dFrontend_dToml_dTomlEntry_tomlEntryKey : string; f_Vuna_dCompiler_dFrontend_dToml_dTomlEntry_tomlEntryValue : t_Vuna_dCompiler_dFrontend_dToml_dTomlValue; f_Vuna_dCompiler_dFrontend_dToml_dTomlEntry_tomlEntryLine : int }
and t_Vuna_dCompiler_dFrontend_dToml_dTomlCursor = { f_Vuna_dCompiler_dFrontend_dToml_dTomlCursor_cursorChars : int Base_dData_dList.t_Base_dData_dList_dList; f_Vuna_dCompiler_dFrontend_dToml_dTomlCursor_cursorLine : int; f_Vuna_dCompiler_dFrontend_dToml_dTomlCursor_cursorCol : int }
and t_Vuna_dCompiler_dFrontend_dToml_dTableKind = C_Vuna_dCompiler_dFrontend_dToml_dTableKind_KindImplicit | C_Vuna_dCompiler_dFrontend_dToml_dTableKind_KindDotted | C_Vuna_dCompiler_dFrontend_dToml_dTableKind_KindExplicit
and t_Vuna_dCompiler_dFrontend_dToml_dTomlNode = C_Vuna_dCompiler_dFrontend_dToml_dTomlNode_NodeLeaf of (t_Vuna_dCompiler_dFrontend_dToml_dTomlValue) * (int) | C_Vuna_dCompiler_dFrontend_dToml_dTomlNode_NodeTable of ((string, t_Vuna_dCompiler_dFrontend_dToml_dTomlNode) Base_dData_dPair.t_Base_dData_dPair_dPair Base_dData_dList.t_Base_dData_dList_dList) * (t_Vuna_dCompiler_dFrontend_dToml_dTableKind) * (int) | C_Vuna_dCompiler_dFrontend_dToml_dTomlNode_NodeTableArray of (t_Vuna_dCompiler_dFrontend_dToml_dTomlNode Base_dData_dList.t_Base_dData_dList_dList) * (int)

# 76 "Vuna/Compiler/Frontend/Toml.vuna"
let rec v_Vuna_dCompiler_dFrontend_dToml_dlenInt = (fun mc0 -> (match mc0 with
  | Base_dData_dList.C_Base_dData_dList_dList__x58__x58_ (dtb__0, dtb__1) -> (1 + (v_Vuna_dCompiler_dFrontend_dToml_dlenInt dtb__1))
  | Base_dData_dList.C_Base_dData_dList_dList_Nil -> 0
  | _ -> failwith "DT: impossible branch"
))

# 81 "Vuna/Compiler/Frontend/Toml.vuna"
let v_Vuna_dCompiler_dFrontend_dToml_dcursorFuel = (fun (mc0 : t_Vuna_dCompiler_dFrontend_dToml_dTomlCursor) -> (match mc0 with
  | { f_Vuna_dCompiler_dFrontend_dToml_dTomlCursor_cursorChars = dtb__2; f_Vuna_dCompiler_dFrontend_dToml_dTomlCursor_cursorLine = dtb__3; f_Vuna_dCompiler_dFrontend_dToml_dTomlCursor_cursorCol = dtb__4 } -> ((2 * (v_Vuna_dCompiler_dFrontend_dToml_dlenInt dtb__2)) + 16)
  | _ -> failwith "DT: impossible branch"
))

# 88 "Vuna/Compiler/Frontend/Toml.vuna"
let rec v_Vuna_dCompiler_dFrontend_dToml_dcountLines = (fun (mc0 : int Base_dData_dList.t_Base_dData_dList_dList) -> (match mc0 with
  | Base_dData_dList.C_Base_dData_dList_dList__x58__x58_ (dtb__5, dtb__6) -> (if (dtb__5 = 10) then (1 + (v_Vuna_dCompiler_dFrontend_dToml_dcountLines dtb__6)) else (v_Vuna_dCompiler_dFrontend_dToml_dcountLines dtb__6))
  | Base_dData_dList.C_Base_dData_dList_dList_Nil -> 1
  | _ -> failwith "DT: impossible branch"
))

# 85 "Vuna/Compiler/Frontend/Toml.vuna"
let v_Vuna_dCompiler_dFrontend_dToml_dlineFuel = (fun (mc0 : t_Vuna_dCompiler_dFrontend_dToml_dTomlCursor) -> (match mc0 with
  | { f_Vuna_dCompiler_dFrontend_dToml_dTomlCursor_cursorChars = dtb__7; f_Vuna_dCompiler_dFrontend_dToml_dTomlCursor_cursorLine = dtb__8; f_Vuna_dCompiler_dFrontend_dToml_dTomlCursor_cursorCol = dtb__9 } -> ((4 * (v_Vuna_dCompiler_dFrontend_dToml_dcountLines dtb__7)) + 16)
  | _ -> failwith "DT: impossible branch"
))

# 93 "Vuna/Compiler/Frontend/Toml.vuna"
let v_Vuna_dCompiler_dFrontend_dToml_dpathFuel = (fun (path : string Base_dData_dList.t_Base_dData_dList_dList) -> ((2 * (v_Vuna_dCompiler_dFrontend_dToml_dlenInt path)) + 4))

# 97 "Vuna/Compiler/Frontend/Toml.vuna"
let v_Vuna_dCompiler_dFrontend_dToml_dflattenFuel = (fun (cs : t_Vuna_dCompiler_dFrontend_dToml_dTomlCursor) -> ((v_Vuna_dCompiler_dFrontend_dToml_dcursorFuel cs) + (v_Vuna_dCompiler_dFrontend_dToml_dlineFuel cs)))

# 100 "Vuna/Compiler/Frontend/Toml.vuna"
let v_Vuna_dCompiler_dFrontend_dToml_dadvanceCursor = (fun (mc0 : t_Vuna_dCompiler_dFrontend_dToml_dTomlCursor) -> (match mc0 with
  | { f_Vuna_dCompiler_dFrontend_dToml_dTomlCursor_cursorChars = dtb__10; f_Vuna_dCompiler_dFrontend_dToml_dTomlCursor_cursorLine = dtb__11; f_Vuna_dCompiler_dFrontend_dToml_dTomlCursor_cursorCol = dtb__12 } -> (match dtb__10 with
  | Base_dData_dList.C_Base_dData_dList_dList__x58__x58_ (dtb__13, dtb__14) -> (if (dtb__13 = 10) then { f_Vuna_dCompiler_dFrontend_dToml_dTomlCursor_cursorChars = dtb__14; f_Vuna_dCompiler_dFrontend_dToml_dTomlCursor_cursorLine = (dtb__11 + 1); f_Vuna_dCompiler_dFrontend_dToml_dTomlCursor_cursorCol = 1 } else { f_Vuna_dCompiler_dFrontend_dToml_dTomlCursor_cursorChars = dtb__14; f_Vuna_dCompiler_dFrontend_dToml_dTomlCursor_cursorLine = dtb__11; f_Vuna_dCompiler_dFrontend_dToml_dTomlCursor_cursorCol = (dtb__12 + 1) })
  | Base_dData_dList.C_Base_dData_dList_dList_Nil -> { f_Vuna_dCompiler_dFrontend_dToml_dTomlCursor_cursorChars = Base_dData_dList.C_Base_dData_dList_dList_Nil; f_Vuna_dCompiler_dFrontend_dToml_dTomlCursor_cursorLine = dtb__11; f_Vuna_dCompiler_dFrontend_dToml_dTomlCursor_cursorCol = dtb__12 }
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
))

# 106 "Vuna/Compiler/Frontend/Toml.vuna"
let v_Vuna_dCompiler_dFrontend_dToml_disDigitChar = (fun (c : int) -> (if (c >= 48) then (c <= 57) else false))

# 109 "Vuna/Compiler/Frontend/Toml.vuna"
let v_Vuna_dCompiler_dFrontend_dToml_disUpperAlphaChar = (fun (c : int) -> (if (c >= 65) then (c <= 90) else false))

# 112 "Vuna/Compiler/Frontend/Toml.vuna"
let v_Vuna_dCompiler_dFrontend_dToml_disLowerAlphaChar = (fun (c : int) -> (if (c >= 97) then (c <= 122) else false))

# 115 "Vuna/Compiler/Frontend/Toml.vuna"
let v_Vuna_dCompiler_dFrontend_dToml_disAlphaChar = (fun (c : int) -> (if (v_Vuna_dCompiler_dFrontend_dToml_disUpperAlphaChar c) then true else (v_Vuna_dCompiler_dFrontend_dToml_disLowerAlphaChar c)))

# 118 "Vuna/Compiler/Frontend/Toml.vuna"
let v_Vuna_dCompiler_dFrontend_dToml_disBareKeyChar = (fun (c : int) -> (if (if (if (v_Vuna_dCompiler_dFrontend_dToml_disAlphaChar c) then true else (v_Vuna_dCompiler_dFrontend_dToml_disDigitChar c)) then true else (c = 95)) then true else (c = 45)))

# 121 "Vuna/Compiler/Frontend/Toml.vuna"
let v_Vuna_dCompiler_dFrontend_dToml_disHexDigit = (fun (c : int) -> (if (if (v_Vuna_dCompiler_dFrontend_dToml_disDigitChar c) then true else (if (c >= 65) then (c <= 70) else false)) then true else (if (c >= 97) then (c <= 102) else false)))

# 124 "Vuna/Compiler/Frontend/Toml.vuna"
let v_Vuna_dCompiler_dFrontend_dToml_dhexValue = (fun (c : int) -> (if (v_Vuna_dCompiler_dFrontend_dToml_disDigitChar c) then (c - 48) else (if (if (c >= 65) then (c <= 70) else false) then (c - 55) else (c - 87))))

# 127 "Vuna/Compiler/Frontend/Toml.vuna"
let v_Vuna_dCompiler_dFrontend_dToml_disBlankChar = (fun (c : int) -> (if (c = 32) then true else (c = 9)))

# 131 "Vuna/Compiler/Frontend/Toml.vuna"
let rec v_Vuna_dCompiler_dFrontend_dToml_ddropChars = (fun (n : int) (xs : int Base_dData_dList.t_Base_dData_dList_dList) -> (if (n <= 0) then xs else (match xs with
  | Base_dData_dList.C_Base_dData_dList_dList_Nil -> Base_dData_dList.C_Base_dData_dList_dList_Nil
  | Base_dData_dList.C_Base_dData_dList_dList__x58__x58_ (dtb__15, dtb__16) -> ((v_Vuna_dCompiler_dFrontend_dToml_ddropChars (n - 1)) dtb__16)
  | _ -> failwith "DT: impossible branch"
)))

# 141 "Vuna/Compiler/Frontend/Toml.vuna"
let rec v_Vuna_dCompiler_dFrontend_dToml_dadvanceChars = (fun (n : int) (cs : t_Vuna_dCompiler_dFrontend_dToml_dTomlCursor) -> (if (n <= 0) then cs else ((v_Vuna_dCompiler_dFrontend_dToml_dadvanceChars (n - 1)) (v_Vuna_dCompiler_dFrontend_dToml_dadvanceCursor cs))))

# 145 "Vuna/Compiler/Frontend/Toml.vuna"
let v_Vuna_dCompiler_dFrontend_dToml_dstartsWithTripleOf = (fun (mc0 : int) (mc1 : int Base_dData_dList.t_Base_dData_dList_dList) -> (match mc1 with
  | Base_dData_dList.C_Base_dData_dList_dList__x58__x58_ (dtb__17, dtb__18) -> (match dtb__18 with
  | Base_dData_dList.C_Base_dData_dList_dList__x58__x58_ (dtb__19, dtb__20) -> (match dtb__20 with
  | Base_dData_dList.C_Base_dData_dList_dList__x58__x58_ (dtb__21, dtb__22) -> (if (if (dtb__17 = mc0) then (dtb__19 = mc0) else false) then (dtb__21 = mc0) else false)
  | _ -> false
)
  | _ -> false
)
  | _ -> false
))

# 150 "Vuna/Compiler/Frontend/Toml.vuna"
let rec v_Vuna_dCompiler_dFrontend_dToml_dstripCR = (fun (mc0 : int Base_dData_dList.t_Base_dData_dList_dList) -> (match mc0 with
  | Base_dData_dList.C_Base_dData_dList_dList__x58__x58_ (dtb__23, dtb__24) -> (if (dtb__23 = 13) then (v_Vuna_dCompiler_dFrontend_dToml_dstripCR dtb__24) else (Base_dData_dList.C_Base_dData_dList_dList__x58__x58_ (dtb__23, (v_Vuna_dCompiler_dFrontend_dToml_dstripCR dtb__24))))
  | Base_dData_dList.C_Base_dData_dList_dList_Nil -> Base_dData_dList.C_Base_dData_dList_dList_Nil
  | _ -> failwith "DT: impossible branch"
))

# 154 "Vuna/Compiler/Frontend/Toml.vuna"
let v_Vuna_dCompiler_dFrontend_dToml_dfailAt = (fun (path : string) (line : int) (msg : string) -> ((((Vuna_dCompiler_dBase_dDiagnostics_dPkg.v_Vuna_dCompiler_dBase_dDiagnostics_dPkg_dpkgAt1 path) line) (Vuna_dCompiler_dBase_dDiagnostics_dPkg.C_Vuna_dCompiler_dBase_dDiagnostics_dPkg_dPkgErr_TomlSyntax (msg))) msg))

# 157 "Vuna/Compiler/Frontend/Toml.vuna"
let v_Vuna_dCompiler_dFrontend_dToml_dappendPath = (fun (xs : string Base_dData_dList.t_Base_dData_dList_dList) (ys : string Base_dData_dList.t_Base_dData_dList_dList) -> ((Base_dData_dList.v_Base_dData_dList_dappend xs) ys))

# 160 "Vuna/Compiler/Frontend/Toml.vuna"
let rec v_Vuna_dCompiler_dFrontend_dToml_dsplitLast = (fun (mc0 : string Base_dData_dList.t_Base_dData_dList_dList) -> (match mc0 with
  | Base_dData_dList.C_Base_dData_dList_dList__x58__x58_ (dtb__25, dtb__26) -> (match dtb__26 with
  | Base_dData_dList.C_Base_dData_dList_dList_Nil -> (Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Just ({ Base_dData_dPair.f_Base_dData_dPair_dPair_first = Base_dData_dList.C_Base_dData_dList_dList_Nil; Base_dData_dPair.f_Base_dData_dPair_dPair_second = dtb__25 }))
  | _ -> ((fun nd_uscrut4 -> (match nd_uscrut4 with
  | Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Just (dtb__27) -> (match dtb__27 with
  | { Base_dData_dPair.f_Base_dData_dPair_dPair_first = dtb__28; Base_dData_dPair.f_Base_dData_dPair_dPair_second = dtb__29 } -> (Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Just ({ Base_dData_dPair.f_Base_dData_dPair_dPair_first = (Base_dData_dList.C_Base_dData_dList_dList__x58__x58_ (dtb__25, dtb__28)); Base_dData_dPair.f_Base_dData_dPair_dPair_second = dtb__29 }))
  | _ -> failwith "DT: impossible branch"
)
  | Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Nothing -> Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Nothing
  | _ -> failwith "DT: impossible branch"
)) (v_Vuna_dCompiler_dFrontend_dToml_dsplitLast dtb__26))
)
  | Base_dData_dList.C_Base_dData_dList_dList_Nil -> Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Nothing
  | _ -> failwith "DT: impossible branch"
))

# 169 "Vuna/Compiler/Frontend/Toml.vuna"
let rec v_Vuna_dCompiler_dFrontend_dToml_dlookupField = (fun (mc0 : string) (mc1 : (string, t_Vuna_dCompiler_dFrontend_dToml_dTomlNode) Base_dData_dPair.t_Base_dData_dPair_dPair Base_dData_dList.t_Base_dData_dList_dList) -> (match mc1 with
  | Base_dData_dList.C_Base_dData_dList_dList__x58__x58_ (dtb__30, dtb__31) -> (match dtb__30 with
  | { Base_dData_dPair.f_Base_dData_dPair_dPair_first = dtb__32; Base_dData_dPair.f_Base_dData_dPair_dPair_second = dtb__33 } -> (if (dtb__32 = mc0) then (Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Just (dtb__33)) else ((v_Vuna_dCompiler_dFrontend_dToml_dlookupField mc0) dtb__31))
  | _ -> failwith "DT: impossible branch"
)
  | Base_dData_dList.C_Base_dData_dList_dList_Nil -> Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Nothing
  | _ -> failwith "DT: impossible branch"
))

# 173 "Vuna/Compiler/Frontend/Toml.vuna"
let rec v_Vuna_dCompiler_dFrontend_dToml_dreplaceField = (fun (mc0 : string) (mc1 : t_Vuna_dCompiler_dFrontend_dToml_dTomlNode) (mc2 : (string, t_Vuna_dCompiler_dFrontend_dToml_dTomlNode) Base_dData_dPair.t_Base_dData_dPair_dPair Base_dData_dList.t_Base_dData_dList_dList) -> (match mc2 with
  | Base_dData_dList.C_Base_dData_dList_dList__x58__x58_ (dtb__34, dtb__35) -> (match dtb__34 with
  | { Base_dData_dPair.f_Base_dData_dPair_dPair_first = dtb__36; Base_dData_dPair.f_Base_dData_dPair_dPair_second = dtb__37 } -> (if (dtb__36 = mc0) then (Base_dData_dList.C_Base_dData_dList_dList__x58__x58_ ({ Base_dData_dPair.f_Base_dData_dPair_dPair_first = dtb__36; Base_dData_dPair.f_Base_dData_dPair_dPair_second = mc1 }, dtb__35)) else (Base_dData_dList.C_Base_dData_dList_dList__x58__x58_ ({ Base_dData_dPair.f_Base_dData_dPair_dPair_first = dtb__36; Base_dData_dPair.f_Base_dData_dPair_dPair_second = dtb__37 }, (((v_Vuna_dCompiler_dFrontend_dToml_dreplaceField mc0) mc1) dtb__35))))
  | _ -> failwith "DT: impossible branch"
)
  | Base_dData_dList.C_Base_dData_dList_dList_Nil -> (Base_dData_dList.C_Base_dData_dList_dList__x58__x58_ ({ Base_dData_dPair.f_Base_dData_dPair_dPair_first = mc0; Base_dData_dPair.f_Base_dData_dPair_dPair_second = mc1 }, Base_dData_dList.C_Base_dData_dList_dList_Nil))
  | _ -> failwith "DT: impossible branch"
))

# 179 "Vuna/Compiler/Frontend/Toml.vuna"
let rec v_Vuna_dCompiler_dFrontend_dToml_dlastNode = (fun (mc0 : t_Vuna_dCompiler_dFrontend_dToml_dTomlNode Base_dData_dList.t_Base_dData_dList_dList) -> (match mc0 with
  | Base_dData_dList.C_Base_dData_dList_dList__x58__x58_ (dtb__38, dtb__39) -> (match dtb__39 with
  | Base_dData_dList.C_Base_dData_dList_dList_Nil -> (Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Just (dtb__38))
  | _ -> (v_Vuna_dCompiler_dFrontend_dToml_dlastNode dtb__39)
)
  | Base_dData_dList.C_Base_dData_dList_dList_Nil -> Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Nothing
  | _ -> failwith "DT: impossible branch"
))

# 184 "Vuna/Compiler/Frontend/Toml.vuna"
let rec v_Vuna_dCompiler_dFrontend_dToml_dreplaceLastNode = (fun (mc0 : t_Vuna_dCompiler_dFrontend_dToml_dTomlNode) (mc1 : t_Vuna_dCompiler_dFrontend_dToml_dTomlNode Base_dData_dList.t_Base_dData_dList_dList) -> (match mc1 with
  | Base_dData_dList.C_Base_dData_dList_dList__x58__x58_ (dtb__40, dtb__41) -> (match dtb__41 with
  | Base_dData_dList.C_Base_dData_dList_dList_Nil -> (Base_dData_dList.C_Base_dData_dList_dList__x58__x58_ (mc0, Base_dData_dList.C_Base_dData_dList_dList_Nil))
  | _ -> (Base_dData_dList.C_Base_dData_dList_dList__x58__x58_ (dtb__40, ((v_Vuna_dCompiler_dFrontend_dToml_dreplaceLastNode mc0) dtb__41)))
)
  | Base_dData_dList.C_Base_dData_dList_dList_Nil -> (Base_dData_dList.C_Base_dData_dList_dList__x58__x58_ (mc0, Base_dData_dList.C_Base_dData_dList_dList_Nil))
  | _ -> failwith "DT: impossible branch"
))

# 189 "Vuna/Compiler/Frontend/Toml.vuna"
let v_Vuna_dCompiler_dFrontend_dToml_dkindIsExplicit = (fun (mc0 : t_Vuna_dCompiler_dFrontend_dToml_dTableKind) -> (match mc0 with
  | C_Vuna_dCompiler_dFrontend_dToml_dTableKind_KindExplicit -> true
  | _ -> false
))

# 193 "Vuna/Compiler/Frontend/Toml.vuna"
let v_Vuna_dCompiler_dFrontend_dToml_dkindIsDotted = (fun (mc0 : t_Vuna_dCompiler_dFrontend_dToml_dTableKind) -> (match mc0 with
  | C_Vuna_dCompiler_dFrontend_dToml_dTableKind_KindDotted -> true
  | _ -> false
))

# 199 "Vuna/Compiler/Frontend/Toml.vuna"
let rec v_Vuna_dCompiler_dFrontend_dToml_densureTable = (fun (fuel : int) (path : string) (line : int) (pathSegs : string Base_dData_dList.t_Base_dData_dList_dList) (kind : t_Vuna_dCompiler_dFrontend_dToml_dTableKind) (fields : (string, t_Vuna_dCompiler_dFrontend_dToml_dTomlNode) Base_dData_dPair.t_Base_dData_dPair_dPair Base_dData_dList.t_Base_dData_dList_dList) -> (if (fuel <= 0) then (Vuna_dCompiler_dBase_dDiag.v_Vuna_dCompiler_dBase_dDiag_dicFuel "toml") else ((fun nd_uscrut6 -> (match nd_uscrut6 with
  | Base_dData_dList.C_Base_dData_dList_dList__x58__x58_ (dtb__42, dtb__43) -> (match dtb__43 with
  | Base_dData_dList.C_Base_dData_dList_dList_Nil -> (match ((v_Vuna_dCompiler_dFrontend_dToml_dlookupField dtb__42) fields) with
  | Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Nothing -> (Vuna_dCompiler_dBase_dDiag.C_Vuna_dCompiler_dBase_dDiag_dCheck_OkC (((Base_dData_dList.v_Base_dData_dList_dappend fields) (Base_dData_dList.C_Base_dData_dList_dList__x58__x58_ ({ Base_dData_dPair.f_Base_dData_dPair_dPair_first = dtb__42; Base_dData_dPair.f_Base_dData_dPair_dPair_second = (C_Vuna_dCompiler_dFrontend_dToml_dTomlNode_NodeTable (Base_dData_dList.C_Base_dData_dList_dList_Nil, kind, line)) }, Base_dData_dList.C_Base_dData_dList_dList_Nil)))))
  | Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Just (dtb__44) -> (match dtb__44 with
  | C_Vuna_dCompiler_dFrontend_dToml_dTomlNode_NodeTable (dtb__45, dtb__46, dtb__47) -> (if (if (v_Vuna_dCompiler_dFrontend_dToml_dkindIsExplicit kind) then (v_Vuna_dCompiler_dFrontend_dToml_dkindIsExplicit dtb__46) else false) then (((v_Vuna_dCompiler_dFrontend_dToml_dfailAt path) line) (String.concat "" ["duplicate table ["; dtb__42; "]"])) else (if (if (v_Vuna_dCompiler_dFrontend_dToml_dkindIsExplicit kind) then (v_Vuna_dCompiler_dFrontend_dToml_dkindIsDotted dtb__46) else false) then (((v_Vuna_dCompiler_dFrontend_dToml_dfailAt path) line) (String.concat "" ["table ["; dtb__42; "] was already defined by dotted keys"])) else (Vuna_dCompiler_dBase_dDiag.C_Vuna_dCompiler_dBase_dDiag_dCheck_OkC ((((v_Vuna_dCompiler_dFrontend_dToml_dreplaceField dtb__42) (C_Vuna_dCompiler_dFrontend_dToml_dTomlNode_NodeTable (dtb__45, kind, dtb__47))) fields)))))
  | _ -> (((v_Vuna_dCompiler_dFrontend_dToml_dfailAt path) line) (String.concat "" ["key \""; dtb__42; "\" is not a table"]))
)
  | _ -> failwith "DT: impossible branch"
)
  | _ -> (match ((v_Vuna_dCompiler_dFrontend_dToml_dlookupField dtb__42) fields) with
  | Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Nothing -> (match ((((((v_Vuna_dCompiler_dFrontend_dToml_densureTable (fuel - 1)) path) line) dtb__43) kind) Base_dData_dList.C_Base_dData_dList_dList_Nil) with
  | Vuna_dCompiler_dBase_dDiag.C_Vuna_dCompiler_dBase_dDiag_dCheck_ErrC (dtb__48) -> (Vuna_dCompiler_dBase_dDiag.C_Vuna_dCompiler_dBase_dDiag_dCheck_ErrC (dtb__48))
  | Vuna_dCompiler_dBase_dDiag.C_Vuna_dCompiler_dBase_dDiag_dCheck_OkC (dtb__49) -> (Vuna_dCompiler_dBase_dDiag.C_Vuna_dCompiler_dBase_dDiag_dCheck_OkC (((Base_dData_dList.v_Base_dData_dList_dappend fields) (Base_dData_dList.C_Base_dData_dList_dList__x58__x58_ ({ Base_dData_dPair.f_Base_dData_dPair_dPair_first = dtb__42; Base_dData_dPair.f_Base_dData_dPair_dPair_second = (C_Vuna_dCompiler_dFrontend_dToml_dTomlNode_NodeTable (dtb__49, C_Vuna_dCompiler_dFrontend_dToml_dTableKind_KindImplicit, line)) }, Base_dData_dList.C_Base_dData_dList_dList_Nil)))))
  | _ -> failwith "DT: impossible branch"
)
  | Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Just (dtb__50) -> (match dtb__50 with
  | C_Vuna_dCompiler_dFrontend_dToml_dTomlNode_NodeTable (dtb__51, dtb__52, dtb__53) -> (match ((((((v_Vuna_dCompiler_dFrontend_dToml_densureTable (fuel - 1)) path) line) dtb__43) kind) dtb__51) with
  | Vuna_dCompiler_dBase_dDiag.C_Vuna_dCompiler_dBase_dDiag_dCheck_ErrC (dtb__54) -> (Vuna_dCompiler_dBase_dDiag.C_Vuna_dCompiler_dBase_dDiag_dCheck_ErrC (dtb__54))
  | Vuna_dCompiler_dBase_dDiag.C_Vuna_dCompiler_dBase_dDiag_dCheck_OkC (dtb__55) -> (Vuna_dCompiler_dBase_dDiag.C_Vuna_dCompiler_dBase_dDiag_dCheck_OkC ((((v_Vuna_dCompiler_dFrontend_dToml_dreplaceField dtb__42) (C_Vuna_dCompiler_dFrontend_dToml_dTomlNode_NodeTable (dtb__55, dtb__52, dtb__53))) fields)))
  | _ -> failwith "DT: impossible branch"
)
  | C_Vuna_dCompiler_dFrontend_dToml_dTomlNode_NodeTableArray (dtb__56, dtb__57) -> ((fun nd_uscrut14 -> (match nd_uscrut14 with
  | Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Just (dtb__58) -> (match dtb__58 with
  | C_Vuna_dCompiler_dFrontend_dToml_dTomlNode_NodeTable (dtb__59, dtb__60, dtb__61) -> (match ((((((v_Vuna_dCompiler_dFrontend_dToml_densureTable (fuel - 1)) path) line) dtb__43) kind) dtb__59) with
  | Vuna_dCompiler_dBase_dDiag.C_Vuna_dCompiler_dBase_dDiag_dCheck_ErrC (dtb__62) -> (Vuna_dCompiler_dBase_dDiag.C_Vuna_dCompiler_dBase_dDiag_dCheck_ErrC (dtb__62))
  | Vuna_dCompiler_dBase_dDiag.C_Vuna_dCompiler_dBase_dDiag_dCheck_OkC (dtb__63) -> (Vuna_dCompiler_dBase_dDiag.C_Vuna_dCompiler_dBase_dDiag_dCheck_OkC ((((v_Vuna_dCompiler_dFrontend_dToml_dreplaceField dtb__42) (C_Vuna_dCompiler_dFrontend_dToml_dTomlNode_NodeTableArray (((v_Vuna_dCompiler_dFrontend_dToml_dreplaceLastNode (C_Vuna_dCompiler_dFrontend_dToml_dTomlNode_NodeTable (dtb__63, dtb__60, dtb__61))) dtb__56), dtb__57))) fields)))
  | _ -> failwith "DT: impossible branch"
)
  | _ -> (((v_Vuna_dCompiler_dFrontend_dToml_dfailAt path) line) (String.concat "" ["table array \""; dtb__42; "\" has no current element"]))
)
  | _ -> (((v_Vuna_dCompiler_dFrontend_dToml_dfailAt path) line) (String.concat "" ["table array \""; dtb__42; "\" has no current element"]))
)) (v_Vuna_dCompiler_dFrontend_dToml_dlastNode dtb__56))
  | C_Vuna_dCompiler_dFrontend_dToml_dTomlNode_NodeLeaf (dtb__64, dtb__65) -> (((v_Vuna_dCompiler_dFrontend_dToml_dfailAt path) dtb__65) (String.concat "" ["key \""; dtb__42; "\" is not a table"]))
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
)
)
  | Base_dData_dList.C_Base_dData_dList_dList_Nil -> (((v_Vuna_dCompiler_dFrontend_dToml_dfailAt path) line) "empty table path")
  | _ -> failwith "DT: impossible branch"
)) pathSegs)))

# 235 "Vuna/Compiler/Frontend/Toml.vuna"
let rec v_Vuna_dCompiler_dFrontend_dToml_dappendTableArray = (fun (fuel : int) (path : string) (line : int) (pathSegs : string Base_dData_dList.t_Base_dData_dList_dList) (fields : (string, t_Vuna_dCompiler_dFrontend_dToml_dTomlNode) Base_dData_dPair.t_Base_dData_dPair_dPair Base_dData_dList.t_Base_dData_dList_dList) -> (if (fuel <= 0) then (Vuna_dCompiler_dBase_dDiag.v_Vuna_dCompiler_dBase_dDiag_dicFuel "toml") else ((fun nd_uscrut5 -> (match nd_uscrut5 with
  | Base_dData_dList.C_Base_dData_dList_dList__x58__x58_ (dtb__66, dtb__67) -> (match dtb__67 with
  | Base_dData_dList.C_Base_dData_dList_dList_Nil -> (match ((v_Vuna_dCompiler_dFrontend_dToml_dlookupField dtb__66) fields) with
  | Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Nothing -> (Vuna_dCompiler_dBase_dDiag.C_Vuna_dCompiler_dBase_dDiag_dCheck_OkC (((Base_dData_dList.v_Base_dData_dList_dappend fields) (Base_dData_dList.C_Base_dData_dList_dList__x58__x58_ ({ Base_dData_dPair.f_Base_dData_dPair_dPair_first = dtb__66; Base_dData_dPair.f_Base_dData_dPair_dPair_second = (C_Vuna_dCompiler_dFrontend_dToml_dTomlNode_NodeTableArray ((Base_dData_dList.C_Base_dData_dList_dList__x58__x58_ ((C_Vuna_dCompiler_dFrontend_dToml_dTomlNode_NodeTable (Base_dData_dList.C_Base_dData_dList_dList_Nil, C_Vuna_dCompiler_dFrontend_dToml_dTableKind_KindExplicit, line)), Base_dData_dList.C_Base_dData_dList_dList_Nil)), line)) }, Base_dData_dList.C_Base_dData_dList_dList_Nil)))))
  | Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Just (dtb__68) -> (match dtb__68 with
  | C_Vuna_dCompiler_dFrontend_dToml_dTomlNode_NodeTableArray (dtb__69, dtb__70) -> (Vuna_dCompiler_dBase_dDiag.C_Vuna_dCompiler_dBase_dDiag_dCheck_OkC ((((v_Vuna_dCompiler_dFrontend_dToml_dreplaceField dtb__66) (C_Vuna_dCompiler_dFrontend_dToml_dTomlNode_NodeTableArray (((Base_dData_dList.v_Base_dData_dList_dappend dtb__69) (Base_dData_dList.C_Base_dData_dList_dList__x58__x58_ ((C_Vuna_dCompiler_dFrontend_dToml_dTomlNode_NodeTable (Base_dData_dList.C_Base_dData_dList_dList_Nil, C_Vuna_dCompiler_dFrontend_dToml_dTableKind_KindExplicit, line)), Base_dData_dList.C_Base_dData_dList_dList_Nil))), dtb__70))) fields)))
  | C_Vuna_dCompiler_dFrontend_dToml_dTomlNode_NodeTable (dtb__71, dtb__72, dtb__73) -> (((v_Vuna_dCompiler_dFrontend_dToml_dfailAt path) dtb__73) (String.concat "" ["table ["; dtb__66; "] cannot become a table array"]))
  | C_Vuna_dCompiler_dFrontend_dToml_dTomlNode_NodeLeaf (dtb__74, dtb__75) -> (((v_Vuna_dCompiler_dFrontend_dToml_dfailAt path) dtb__75) (String.concat "" ["key \""; dtb__66; "\" is not a table"]))
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
)
  | _ -> (match ((v_Vuna_dCompiler_dFrontend_dToml_dlookupField dtb__66) fields) with
  | Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Nothing -> (match (((((v_Vuna_dCompiler_dFrontend_dToml_dappendTableArray (fuel - 1)) path) line) dtb__67) Base_dData_dList.C_Base_dData_dList_dList_Nil) with
  | Vuna_dCompiler_dBase_dDiag.C_Vuna_dCompiler_dBase_dDiag_dCheck_ErrC (dtb__76) -> (Vuna_dCompiler_dBase_dDiag.C_Vuna_dCompiler_dBase_dDiag_dCheck_ErrC (dtb__76))
  | Vuna_dCompiler_dBase_dDiag.C_Vuna_dCompiler_dBase_dDiag_dCheck_OkC (dtb__77) -> (Vuna_dCompiler_dBase_dDiag.C_Vuna_dCompiler_dBase_dDiag_dCheck_OkC (((Base_dData_dList.v_Base_dData_dList_dappend fields) (Base_dData_dList.C_Base_dData_dList_dList__x58__x58_ ({ Base_dData_dPair.f_Base_dData_dPair_dPair_first = dtb__66; Base_dData_dPair.f_Base_dData_dPair_dPair_second = (C_Vuna_dCompiler_dFrontend_dToml_dTomlNode_NodeTable (dtb__77, C_Vuna_dCompiler_dFrontend_dToml_dTableKind_KindImplicit, line)) }, Base_dData_dList.C_Base_dData_dList_dList_Nil)))))
  | _ -> failwith "DT: impossible branch"
)
  | Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Just (dtb__78) -> (match dtb__78 with
  | C_Vuna_dCompiler_dFrontend_dToml_dTomlNode_NodeTable (dtb__79, dtb__80, dtb__81) -> (match (((((v_Vuna_dCompiler_dFrontend_dToml_dappendTableArray (fuel - 1)) path) line) dtb__67) dtb__79) with
  | Vuna_dCompiler_dBase_dDiag.C_Vuna_dCompiler_dBase_dDiag_dCheck_ErrC (dtb__82) -> (Vuna_dCompiler_dBase_dDiag.C_Vuna_dCompiler_dBase_dDiag_dCheck_ErrC (dtb__82))
  | Vuna_dCompiler_dBase_dDiag.C_Vuna_dCompiler_dBase_dDiag_dCheck_OkC (dtb__83) -> (Vuna_dCompiler_dBase_dDiag.C_Vuna_dCompiler_dBase_dDiag_dCheck_OkC ((((v_Vuna_dCompiler_dFrontend_dToml_dreplaceField dtb__66) (C_Vuna_dCompiler_dFrontend_dToml_dTomlNode_NodeTable (dtb__83, dtb__80, dtb__81))) fields)))
  | _ -> failwith "DT: impossible branch"
)
  | C_Vuna_dCompiler_dFrontend_dToml_dTomlNode_NodeTableArray (dtb__84, dtb__85) -> ((fun nd_uscrut13 -> (match nd_uscrut13 with
  | Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Just (dtb__86) -> (match dtb__86 with
  | C_Vuna_dCompiler_dFrontend_dToml_dTomlNode_NodeTable (dtb__87, dtb__88, dtb__89) -> (match (((((v_Vuna_dCompiler_dFrontend_dToml_dappendTableArray (fuel - 1)) path) line) dtb__67) dtb__87) with
  | Vuna_dCompiler_dBase_dDiag.C_Vuna_dCompiler_dBase_dDiag_dCheck_ErrC (dtb__90) -> (Vuna_dCompiler_dBase_dDiag.C_Vuna_dCompiler_dBase_dDiag_dCheck_ErrC (dtb__90))
  | Vuna_dCompiler_dBase_dDiag.C_Vuna_dCompiler_dBase_dDiag_dCheck_OkC (dtb__91) -> (Vuna_dCompiler_dBase_dDiag.C_Vuna_dCompiler_dBase_dDiag_dCheck_OkC ((((v_Vuna_dCompiler_dFrontend_dToml_dreplaceField dtb__66) (C_Vuna_dCompiler_dFrontend_dToml_dTomlNode_NodeTableArray (((v_Vuna_dCompiler_dFrontend_dToml_dreplaceLastNode (C_Vuna_dCompiler_dFrontend_dToml_dTomlNode_NodeTable (dtb__91, dtb__88, dtb__89))) dtb__84), dtb__85))) fields)))
  | _ -> failwith "DT: impossible branch"
)
  | _ -> (((v_Vuna_dCompiler_dFrontend_dToml_dfailAt path) line) (String.concat "" ["table array \""; dtb__66; "\" has no current element"]))
)
  | _ -> (((v_Vuna_dCompiler_dFrontend_dToml_dfailAt path) line) (String.concat "" ["table array \""; dtb__66; "\" has no current element"]))
)) (v_Vuna_dCompiler_dFrontend_dToml_dlastNode dtb__84))
  | C_Vuna_dCompiler_dFrontend_dToml_dTomlNode_NodeLeaf (dtb__92, dtb__93) -> (((v_Vuna_dCompiler_dFrontend_dToml_dfailAt path) dtb__93) (String.concat "" ["key \""; dtb__66; "\" is not a table"]))
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
)
)
  | Base_dData_dList.C_Base_dData_dList_dList_Nil -> (((v_Vuna_dCompiler_dFrontend_dToml_dfailAt path) line) "empty table array path")
  | _ -> failwith "DT: impossible branch"
)) pathSegs)))

# 272 "Vuna/Compiler/Frontend/Toml.vuna"
let v_Vuna_dCompiler_dFrontend_dToml_dsectionOfPath = (fun (pathSegs : string Base_dData_dList.t_Base_dData_dList_dList) -> ((fun nd_uscrut1 -> (match nd_uscrut1 with
  | Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Nothing -> Base_dData_dList.C_Base_dData_dList_dList_Nil
  | Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Just (dtb__94) -> (match dtb__94 with
  | { Base_dData_dPair.f_Base_dData_dPair_dPair_first = dtb__95; Base_dData_dPair.f_Base_dData_dPair_dPair_second = dtb__96 } -> dtb__95
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
)) (v_Vuna_dCompiler_dFrontend_dToml_dsplitLast pathSegs)))

# 278 "Vuna/Compiler/Frontend/Toml.vuna"
let v_Vuna_dCompiler_dFrontend_dToml_dduplicateKeyMsg = (fun (name : string) (section : string Base_dData_dList.t_Base_dData_dList_dList) -> (if ((v_Vuna_dCompiler_dFrontend_dToml_dlenInt section) = 0) then (String.concat "" ["duplicate key \""; name; "\""]) else (String.concat "" ["duplicate key \""; name; "\" in ["; (Vuna_dCompiler_dBase_dSource.v_Vuna_dCompiler_dBase_dSource_djoinDots section); "]"])))

# 286 "Vuna/Compiler/Frontend/Toml.vuna"
let rec v_Vuna_dCompiler_dFrontend_dToml_dinsertValue = (fun (fuel : int) (path : string) (line : int) (pathSegs : string Base_dData_dList.t_Base_dData_dList_dList) (section : string Base_dData_dList.t_Base_dData_dList_dList) (value : t_Vuna_dCompiler_dFrontend_dToml_dTomlValue) (fields : (string, t_Vuna_dCompiler_dFrontend_dToml_dTomlNode) Base_dData_dPair.t_Base_dData_dPair_dPair Base_dData_dList.t_Base_dData_dList_dList) -> (if (fuel <= 0) then (Vuna_dCompiler_dBase_dDiag.v_Vuna_dCompiler_dBase_dDiag_dicFuel "toml") else ((fun nd_uscrut7 -> (match nd_uscrut7 with
  | Base_dData_dList.C_Base_dData_dList_dList__x58__x58_ (dtb__97, dtb__98) -> (match dtb__98 with
  | Base_dData_dList.C_Base_dData_dList_dList_Nil -> (match ((v_Vuna_dCompiler_dFrontend_dToml_dlookupField dtb__97) fields) with
  | Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Nothing -> (Vuna_dCompiler_dBase_dDiag.C_Vuna_dCompiler_dBase_dDiag_dCheck_OkC (((Base_dData_dList.v_Base_dData_dList_dappend fields) (Base_dData_dList.C_Base_dData_dList_dList__x58__x58_ ({ Base_dData_dPair.f_Base_dData_dPair_dPair_first = dtb__97; Base_dData_dPair.f_Base_dData_dPair_dPair_second = (C_Vuna_dCompiler_dFrontend_dToml_dTomlNode_NodeLeaf (value, line)) }, Base_dData_dList.C_Base_dData_dList_dList_Nil)))))
  | Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Just (dtb__99) -> (match dtb__99 with
  | C_Vuna_dCompiler_dFrontend_dToml_dTomlNode_NodeLeaf (dtb__100, dtb__101) -> (((v_Vuna_dCompiler_dFrontend_dToml_dfailAt path) line) ((v_Vuna_dCompiler_dFrontend_dToml_dduplicateKeyMsg dtb__97) section))
  | _ -> (((v_Vuna_dCompiler_dFrontend_dToml_dfailAt path) line) (String.concat "" ["key \""; dtb__97; "\" conflicts with a table"]))
)
  | _ -> failwith "DT: impossible branch"
)
  | _ -> (match ((v_Vuna_dCompiler_dFrontend_dToml_dlookupField dtb__97) fields) with
  | Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Nothing -> (match (((((((v_Vuna_dCompiler_dFrontend_dToml_dinsertValue (fuel - 1)) path) line) dtb__98) section) value) Base_dData_dList.C_Base_dData_dList_dList_Nil) with
  | Vuna_dCompiler_dBase_dDiag.C_Vuna_dCompiler_dBase_dDiag_dCheck_ErrC (dtb__102) -> (Vuna_dCompiler_dBase_dDiag.C_Vuna_dCompiler_dBase_dDiag_dCheck_ErrC (dtb__102))
  | Vuna_dCompiler_dBase_dDiag.C_Vuna_dCompiler_dBase_dDiag_dCheck_OkC (dtb__103) -> (Vuna_dCompiler_dBase_dDiag.C_Vuna_dCompiler_dBase_dDiag_dCheck_OkC (((Base_dData_dList.v_Base_dData_dList_dappend fields) (Base_dData_dList.C_Base_dData_dList_dList__x58__x58_ ({ Base_dData_dPair.f_Base_dData_dPair_dPair_first = dtb__97; Base_dData_dPair.f_Base_dData_dPair_dPair_second = (C_Vuna_dCompiler_dFrontend_dToml_dTomlNode_NodeTable (dtb__103, C_Vuna_dCompiler_dFrontend_dToml_dTableKind_KindDotted, line)) }, Base_dData_dList.C_Base_dData_dList_dList_Nil)))))
  | _ -> failwith "DT: impossible branch"
)
  | Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Just (dtb__104) -> (match dtb__104 with
  | C_Vuna_dCompiler_dFrontend_dToml_dTomlNode_NodeTable (dtb__105, dtb__106, dtb__107) -> (match (((((((v_Vuna_dCompiler_dFrontend_dToml_dinsertValue (fuel - 1)) path) line) dtb__98) section) value) dtb__105) with
  | Vuna_dCompiler_dBase_dDiag.C_Vuna_dCompiler_dBase_dDiag_dCheck_ErrC (dtb__108) -> (Vuna_dCompiler_dBase_dDiag.C_Vuna_dCompiler_dBase_dDiag_dCheck_ErrC (dtb__108))
  | Vuna_dCompiler_dBase_dDiag.C_Vuna_dCompiler_dBase_dDiag_dCheck_OkC (dtb__109) -> (Vuna_dCompiler_dBase_dDiag.C_Vuna_dCompiler_dBase_dDiag_dCheck_OkC ((((v_Vuna_dCompiler_dFrontend_dToml_dreplaceField dtb__97) (C_Vuna_dCompiler_dFrontend_dToml_dTomlNode_NodeTable (dtb__109, dtb__106, dtb__107))) fields)))
  | _ -> failwith "DT: impossible branch"
)
  | C_Vuna_dCompiler_dFrontend_dToml_dTomlNode_NodeTableArray (dtb__110, dtb__111) -> ((fun nd_uscrut15 -> (match nd_uscrut15 with
  | Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Just (dtb__112) -> (match dtb__112 with
  | C_Vuna_dCompiler_dFrontend_dToml_dTomlNode_NodeTable (dtb__113, dtb__114, dtb__115) -> (match (((((((v_Vuna_dCompiler_dFrontend_dToml_dinsertValue (fuel - 1)) path) line) dtb__98) section) value) dtb__113) with
  | Vuna_dCompiler_dBase_dDiag.C_Vuna_dCompiler_dBase_dDiag_dCheck_ErrC (dtb__116) -> (Vuna_dCompiler_dBase_dDiag.C_Vuna_dCompiler_dBase_dDiag_dCheck_ErrC (dtb__116))
  | Vuna_dCompiler_dBase_dDiag.C_Vuna_dCompiler_dBase_dDiag_dCheck_OkC (dtb__117) -> (Vuna_dCompiler_dBase_dDiag.C_Vuna_dCompiler_dBase_dDiag_dCheck_OkC ((((v_Vuna_dCompiler_dFrontend_dToml_dreplaceField dtb__97) (C_Vuna_dCompiler_dFrontend_dToml_dTomlNode_NodeTableArray (((v_Vuna_dCompiler_dFrontend_dToml_dreplaceLastNode (C_Vuna_dCompiler_dFrontend_dToml_dTomlNode_NodeTable (dtb__117, dtb__114, dtb__115))) dtb__110), dtb__111))) fields)))
  | _ -> failwith "DT: impossible branch"
)
  | _ -> (((v_Vuna_dCompiler_dFrontend_dToml_dfailAt path) line) (String.concat "" ["table array \""; dtb__97; "\" has no current element"]))
)
  | _ -> (((v_Vuna_dCompiler_dFrontend_dToml_dfailAt path) line) (String.concat "" ["table array \""; dtb__97; "\" has no current element"]))
)) (v_Vuna_dCompiler_dFrontend_dToml_dlastNode dtb__110))
  | C_Vuna_dCompiler_dFrontend_dToml_dTomlNode_NodeLeaf (dtb__118, dtb__119) -> (((v_Vuna_dCompiler_dFrontend_dToml_dfailAt path) dtb__119) (String.concat "" ["key \""; dtb__97; "\" is not a table"]))
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
)
)
  | Base_dData_dList.C_Base_dData_dList_dList_Nil -> (((v_Vuna_dCompiler_dFrontend_dToml_dfailAt path) line) "empty key")
  | _ -> failwith "DT: impossible branch"
)) pathSegs)))

# 344 "Vuna/Compiler/Frontend/Toml.vuna"
let rec v_Vuna_dCompiler_dFrontend_dToml_dflattenLeaf = (fun (mc0 : int) (mc1 : string Base_dData_dList.t_Base_dData_dList_dList) (mc2 : t_Vuna_dCompiler_dFrontend_dToml_dTomlValue) (mc3 : int) -> (match mc2 with
  | C_Vuna_dCompiler_dFrontend_dToml_dTomlValue_TTable (dtb__120) -> ((((v_Vuna_dCompiler_dFrontend_dToml_dflattenLeafFields (mc0 - 1)) mc1) dtb__120) mc3)
  | _ -> ((fun nd_uscrut4 -> (match nd_uscrut4 with
  | Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Just (dtb__121) -> (match dtb__121 with
  | { Base_dData_dPair.f_Base_dData_dPair_dPair_first = dtb__122; Base_dData_dPair.f_Base_dData_dPair_dPair_second = dtb__123 } -> (Base_dData_dList.C_Base_dData_dList_dList__x58__x58_ ({ f_Vuna_dCompiler_dFrontend_dToml_dTomlEntry_tomlEntrySection = dtb__122; f_Vuna_dCompiler_dFrontend_dToml_dTomlEntry_tomlEntryKey = dtb__123; f_Vuna_dCompiler_dFrontend_dToml_dTomlEntry_tomlEntryValue = mc2; f_Vuna_dCompiler_dFrontend_dToml_dTomlEntry_tomlEntryLine = mc3 }, Base_dData_dList.C_Base_dData_dList_dList_Nil))
  | _ -> failwith "DT: impossible branch"
)
  | Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Nothing -> Base_dData_dList.C_Base_dData_dList_dList_Nil
  | _ -> failwith "DT: impossible branch"
)) (v_Vuna_dCompiler_dFrontend_dToml_dsplitLast mc1))
))
# 351 "Vuna/Compiler/Frontend/Toml.vuna"
and v_Vuna_dCompiler_dFrontend_dToml_dflattenLeafFields = (fun (mc0 : int) (mc1 : string Base_dData_dList.t_Base_dData_dList_dList) (mc2 : (string, t_Vuna_dCompiler_dFrontend_dToml_dTomlValue) Base_dData_dPair.t_Base_dData_dPair_dPair Base_dData_dList.t_Base_dData_dList_dList) (mc3 : int) -> (match mc2 with
  | Base_dData_dList.C_Base_dData_dList_dList__x58__x58_ (dtb__124, dtb__125) -> ((Base_dData_dList.v_Base_dData_dList_dappend ((((v_Vuna_dCompiler_dFrontend_dToml_dflattenLeaf (mc0 - 1)) ((v_Vuna_dCompiler_dFrontend_dToml_dappendPath mc1) (Base_dData_dList.C_Base_dData_dList_dList__x58__x58_ ((Base_dData_dPair.v_Base_dData_dPair_dfirstOf dtb__124), Base_dData_dList.C_Base_dData_dList_dList_Nil)))) (Base_dData_dPair.v_Base_dData_dPair_dsecondOf dtb__124)) mc3)) ((((v_Vuna_dCompiler_dFrontend_dToml_dflattenLeafFields (mc0 - 1)) mc1) dtb__125) mc3))
  | Base_dData_dList.C_Base_dData_dList_dList_Nil -> Base_dData_dList.C_Base_dData_dList_dList_Nil
  | _ -> failwith "DT: impossible branch"
))

# 324 "Vuna/Compiler/Frontend/Toml.vuna"
let rec v_Vuna_dCompiler_dFrontend_dToml_dflattenFields = (fun (mc0 : int) (mc1 : string Base_dData_dList.t_Base_dData_dList_dList) (mc2 : (string, t_Vuna_dCompiler_dFrontend_dToml_dTomlNode) Base_dData_dPair.t_Base_dData_dPair_dPair Base_dData_dList.t_Base_dData_dList_dList) -> (match mc2 with
  | Base_dData_dList.C_Base_dData_dList_dList__x58__x58_ (dtb__126, dtb__127) -> ((Base_dData_dList.v_Base_dData_dList_dappend (((v_Vuna_dCompiler_dFrontend_dToml_dflattenNode (mc0 - 1)) ((v_Vuna_dCompiler_dFrontend_dToml_dappendPath mc1) (Base_dData_dList.C_Base_dData_dList_dList__x58__x58_ ((Base_dData_dPair.v_Base_dData_dPair_dfirstOf dtb__126), Base_dData_dList.C_Base_dData_dList_dList_Nil)))) (Base_dData_dPair.v_Base_dData_dPair_dsecondOf dtb__126))) (((v_Vuna_dCompiler_dFrontend_dToml_dflattenFields (mc0 - 1)) mc1) dtb__127))
  | Base_dData_dList.C_Base_dData_dList_dList_Nil -> Base_dData_dList.C_Base_dData_dList_dList_Nil
  | _ -> failwith "DT: impossible branch"
))
# 331 "Vuna/Compiler/Frontend/Toml.vuna"
and v_Vuna_dCompiler_dFrontend_dToml_dflattenNode = (fun (mc0 : int) (mc1 : string Base_dData_dList.t_Base_dData_dList_dList) (mc2 : t_Vuna_dCompiler_dFrontend_dToml_dTomlNode) -> (match mc2 with
  | C_Vuna_dCompiler_dFrontend_dToml_dTomlNode_NodeTableArray (dtb__128, dtb__129) -> ((((v_Vuna_dCompiler_dFrontend_dToml_dflattenElems (mc0 - 1)) 0) mc1) dtb__128)
  | C_Vuna_dCompiler_dFrontend_dToml_dTomlNode_NodeTable (dtb__130, dtb__131, dtb__132) -> (((v_Vuna_dCompiler_dFrontend_dToml_dflattenFields (mc0 - 1)) mc1) dtb__130)
  | C_Vuna_dCompiler_dFrontend_dToml_dTomlNode_NodeLeaf (dtb__133, dtb__134) -> ((((v_Vuna_dCompiler_dFrontend_dToml_dflattenLeaf (mc0 - 1)) mc1) dtb__133) dtb__134)
  | _ -> failwith "DT: impossible branch"
))
# 336 "Vuna/Compiler/Frontend/Toml.vuna"
and v_Vuna_dCompiler_dFrontend_dToml_dflattenElems = (fun (mc0 : int) (mc1 : int) (mc2 : string Base_dData_dList.t_Base_dData_dList_dList) (mc3 : t_Vuna_dCompiler_dFrontend_dToml_dTomlNode Base_dData_dList.t_Base_dData_dList_dList) -> (match mc3 with
  | Base_dData_dList.C_Base_dData_dList_dList__x58__x58_ (dtb__135, dtb__136) -> ((Base_dData_dList.v_Base_dData_dList_dappend (((v_Vuna_dCompiler_dFrontend_dToml_dflattenNode (mc0 - 1)) ((v_Vuna_dCompiler_dFrontend_dToml_dappendPath mc2) (Base_dData_dList.C_Base_dData_dList_dList__x58__x58_ ((bi_strFromInt mc1), Base_dData_dList.C_Base_dData_dList_dList_Nil)))) dtb__135)) ((((v_Vuna_dCompiler_dFrontend_dToml_dflattenElems (mc0 - 1)) (mc1 + 1)) mc2) dtb__136))
  | Base_dData_dList.C_Base_dData_dList_dList_Nil -> Base_dData_dList.C_Base_dData_dList_dList_Nil
  | _ -> failwith "DT: impossible branch"
))

# 359 "Vuna/Compiler/Frontend/Toml.vuna"
let rec v_Vuna_dCompiler_dFrontend_dToml_dnodeValue = (fun (mc0 : int) (mc1 : t_Vuna_dCompiler_dFrontend_dToml_dTomlNode) -> (match mc1 with
  | C_Vuna_dCompiler_dFrontend_dToml_dTomlNode_NodeTableArray (dtb__137, dtb__138) -> (C_Vuna_dCompiler_dFrontend_dToml_dTomlValue_TTableArray (((v_Vuna_dCompiler_dFrontend_dToml_dtableFields (mc0 - 1)) dtb__137)))
  | C_Vuna_dCompiler_dFrontend_dToml_dTomlNode_NodeTable (dtb__139, dtb__140, dtb__141) -> (C_Vuna_dCompiler_dFrontend_dToml_dTomlValue_TTable (((v_Vuna_dCompiler_dFrontend_dToml_dfieldValues (mc0 - 1)) dtb__139)))
  | C_Vuna_dCompiler_dFrontend_dToml_dTomlNode_NodeLeaf (dtb__142, dtb__143) -> dtb__142
  | _ -> failwith "DT: impossible branch"
))
# 364 "Vuna/Compiler/Frontend/Toml.vuna"
and v_Vuna_dCompiler_dFrontend_dToml_dfieldValues = (fun (mc0 : int) (mc1 : (string, t_Vuna_dCompiler_dFrontend_dToml_dTomlNode) Base_dData_dPair.t_Base_dData_dPair_dPair Base_dData_dList.t_Base_dData_dList_dList) -> (match mc1 with
  | Base_dData_dList.C_Base_dData_dList_dList__x58__x58_ (dtb__144, dtb__145) -> (Base_dData_dList.C_Base_dData_dList_dList__x58__x58_ ({ Base_dData_dPair.f_Base_dData_dPair_dPair_first = (Base_dData_dPair.v_Base_dData_dPair_dfirstOf dtb__144); Base_dData_dPair.f_Base_dData_dPair_dPair_second = ((v_Vuna_dCompiler_dFrontend_dToml_dnodeValue (mc0 - 1)) (Base_dData_dPair.v_Base_dData_dPair_dsecondOf dtb__144)) }, ((v_Vuna_dCompiler_dFrontend_dToml_dfieldValues (mc0 - 1)) dtb__145)))
  | Base_dData_dList.C_Base_dData_dList_dList_Nil -> Base_dData_dList.C_Base_dData_dList_dList_Nil
  | _ -> failwith "DT: impossible branch"
))
# 369 "Vuna/Compiler/Frontend/Toml.vuna"
and v_Vuna_dCompiler_dFrontend_dToml_dtableFields = (fun (mc0 : int) (mc1 : t_Vuna_dCompiler_dFrontend_dToml_dTomlNode Base_dData_dList.t_Base_dData_dList_dList) -> (match mc1 with
  | Base_dData_dList.C_Base_dData_dList_dList__x58__x58_ (dtb__146, dtb__147) -> (Base_dData_dList.C_Base_dData_dList_dList__x58__x58_ (((v_Vuna_dCompiler_dFrontend_dToml_dnodeFields (mc0 - 1)) dtb__146), ((v_Vuna_dCompiler_dFrontend_dToml_dtableFields (mc0 - 1)) dtb__147)))
  | Base_dData_dList.C_Base_dData_dList_dList_Nil -> Base_dData_dList.C_Base_dData_dList_dList_Nil
  | _ -> failwith "DT: impossible branch"
))
# 373 "Vuna/Compiler/Frontend/Toml.vuna"
and v_Vuna_dCompiler_dFrontend_dToml_dnodeFields = (fun (mc0 : int) (mc1 : t_Vuna_dCompiler_dFrontend_dToml_dTomlNode) -> (match mc1 with
  | C_Vuna_dCompiler_dFrontend_dToml_dTomlNode_NodeTable (dtb__148, dtb__149, dtb__150) -> ((v_Vuna_dCompiler_dFrontend_dToml_dfieldValues (mc0 - 1)) dtb__148)
  | _ -> Base_dData_dList.C_Base_dData_dList_dList_Nil
))

# 377 "Vuna/Compiler/Frontend/Toml.vuna"
let v_Vuna_dCompiler_dFrontend_dToml_drootValue = (fun (fuel : int) (fields : (string, t_Vuna_dCompiler_dFrontend_dToml_dTomlNode) Base_dData_dPair.t_Base_dData_dPair_dPair Base_dData_dList.t_Base_dData_dList_dList) -> ((v_Vuna_dCompiler_dFrontend_dToml_dfieldValues fuel) fields))

# 382 "Vuna/Compiler/Frontend/Toml.vuna"
let rec v_Vuna_dCompiler_dFrontend_dToml_dskipBlank = (fun (mc0 : t_Vuna_dCompiler_dFrontend_dToml_dTomlCursor) -> (match mc0 with
  | { f_Vuna_dCompiler_dFrontend_dToml_dTomlCursor_cursorChars = dtb__151; f_Vuna_dCompiler_dFrontend_dToml_dTomlCursor_cursorLine = dtb__152; f_Vuna_dCompiler_dFrontend_dToml_dTomlCursor_cursorCol = dtb__153 } -> (match dtb__151 with
  | Base_dData_dList.C_Base_dData_dList_dList__x58__x58_ (dtb__154, dtb__155) -> (if (v_Vuna_dCompiler_dFrontend_dToml_disBlankChar dtb__154) then (v_Vuna_dCompiler_dFrontend_dToml_dskipBlank { f_Vuna_dCompiler_dFrontend_dToml_dTomlCursor_cursorChars = dtb__155; f_Vuna_dCompiler_dFrontend_dToml_dTomlCursor_cursorLine = dtb__152; f_Vuna_dCompiler_dFrontend_dToml_dTomlCursor_cursorCol = (dtb__153 + 1) }) else { f_Vuna_dCompiler_dFrontend_dToml_dTomlCursor_cursorChars = (Base_dData_dList.C_Base_dData_dList_dList__x58__x58_ (dtb__154, dtb__155)); f_Vuna_dCompiler_dFrontend_dToml_dTomlCursor_cursorLine = dtb__152; f_Vuna_dCompiler_dFrontend_dToml_dTomlCursor_cursorCol = dtb__153 })
  | Base_dData_dList.C_Base_dData_dList_dList_Nil -> { f_Vuna_dCompiler_dFrontend_dToml_dTomlCursor_cursorChars = Base_dData_dList.C_Base_dData_dList_dList_Nil; f_Vuna_dCompiler_dFrontend_dToml_dTomlCursor_cursorLine = dtb__152; f_Vuna_dCompiler_dFrontend_dToml_dTomlCursor_cursorCol = dtb__153 }
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
))

# 391 "Vuna/Compiler/Frontend/Toml.vuna"
let rec v_Vuna_dCompiler_dFrontend_dToml_dskipComment = (fun (mc0 : t_Vuna_dCompiler_dFrontend_dToml_dTomlCursor) -> (match mc0 with
  | { f_Vuna_dCompiler_dFrontend_dToml_dTomlCursor_cursorChars = dtb__156; f_Vuna_dCompiler_dFrontend_dToml_dTomlCursor_cursorLine = dtb__157; f_Vuna_dCompiler_dFrontend_dToml_dTomlCursor_cursorCol = dtb__158 } -> (match dtb__156 with
  | Base_dData_dList.C_Base_dData_dList_dList__x58__x58_ (dtb__159, dtb__160) -> (if (dtb__159 = 10) then { f_Vuna_dCompiler_dFrontend_dToml_dTomlCursor_cursorChars = (Base_dData_dList.C_Base_dData_dList_dList__x58__x58_ (dtb__159, dtb__160)); f_Vuna_dCompiler_dFrontend_dToml_dTomlCursor_cursorLine = dtb__157; f_Vuna_dCompiler_dFrontend_dToml_dTomlCursor_cursorCol = dtb__158 } else (v_Vuna_dCompiler_dFrontend_dToml_dskipComment { f_Vuna_dCompiler_dFrontend_dToml_dTomlCursor_cursorChars = dtb__160; f_Vuna_dCompiler_dFrontend_dToml_dTomlCursor_cursorLine = dtb__157; f_Vuna_dCompiler_dFrontend_dToml_dTomlCursor_cursorCol = (dtb__158 + 1) }))
  | Base_dData_dList.C_Base_dData_dList_dList_Nil -> { f_Vuna_dCompiler_dFrontend_dToml_dTomlCursor_cursorChars = Base_dData_dList.C_Base_dData_dList_dList_Nil; f_Vuna_dCompiler_dFrontend_dToml_dTomlCursor_cursorLine = dtb__157; f_Vuna_dCompiler_dFrontend_dToml_dTomlCursor_cursorCol = dtb__158 }
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
))

# 400 "Vuna/Compiler/Frontend/Toml.vuna"
let rec v_Vuna_dCompiler_dFrontend_dToml_dskipGapGo = (fun (mc0 : bool) (mc1 : t_Vuna_dCompiler_dFrontend_dToml_dTomlCursor) -> (match mc1 with
  | { f_Vuna_dCompiler_dFrontend_dToml_dTomlCursor_cursorChars = dtb__161; f_Vuna_dCompiler_dFrontend_dToml_dTomlCursor_cursorLine = dtb__162; f_Vuna_dCompiler_dFrontend_dToml_dTomlCursor_cursorCol = dtb__163 } -> (match dtb__161 with
  | Base_dData_dList.C_Base_dData_dList_dList__x58__x58_ (dtb__164, dtb__165) -> (if mc0 then (if (dtb__164 = 10) then ((v_Vuna_dCompiler_dFrontend_dToml_dskipGapGo false) { f_Vuna_dCompiler_dFrontend_dToml_dTomlCursor_cursorChars = dtb__165; f_Vuna_dCompiler_dFrontend_dToml_dTomlCursor_cursorLine = (dtb__162 + 1); f_Vuna_dCompiler_dFrontend_dToml_dTomlCursor_cursorCol = 1 }) else ((v_Vuna_dCompiler_dFrontend_dToml_dskipGapGo true) { f_Vuna_dCompiler_dFrontend_dToml_dTomlCursor_cursorChars = dtb__165; f_Vuna_dCompiler_dFrontend_dToml_dTomlCursor_cursorLine = dtb__162; f_Vuna_dCompiler_dFrontend_dToml_dTomlCursor_cursorCol = (dtb__163 + 1) })) else (if (v_Vuna_dCompiler_dFrontend_dToml_disBlankChar dtb__164) then ((v_Vuna_dCompiler_dFrontend_dToml_dskipGapGo false) { f_Vuna_dCompiler_dFrontend_dToml_dTomlCursor_cursorChars = dtb__165; f_Vuna_dCompiler_dFrontend_dToml_dTomlCursor_cursorLine = dtb__162; f_Vuna_dCompiler_dFrontend_dToml_dTomlCursor_cursorCol = (dtb__163 + 1) }) else (if (dtb__164 = 10) then ((v_Vuna_dCompiler_dFrontend_dToml_dskipGapGo false) { f_Vuna_dCompiler_dFrontend_dToml_dTomlCursor_cursorChars = dtb__165; f_Vuna_dCompiler_dFrontend_dToml_dTomlCursor_cursorLine = (dtb__162 + 1); f_Vuna_dCompiler_dFrontend_dToml_dTomlCursor_cursorCol = 1 }) else (if (dtb__164 = 35) then ((v_Vuna_dCompiler_dFrontend_dToml_dskipGapGo true) { f_Vuna_dCompiler_dFrontend_dToml_dTomlCursor_cursorChars = dtb__165; f_Vuna_dCompiler_dFrontend_dToml_dTomlCursor_cursorLine = dtb__162; f_Vuna_dCompiler_dFrontend_dToml_dTomlCursor_cursorCol = (dtb__163 + 1) }) else { f_Vuna_dCompiler_dFrontend_dToml_dTomlCursor_cursorChars = (Base_dData_dList.C_Base_dData_dList_dList__x58__x58_ (dtb__164, dtb__165)); f_Vuna_dCompiler_dFrontend_dToml_dTomlCursor_cursorLine = dtb__162; f_Vuna_dCompiler_dFrontend_dToml_dTomlCursor_cursorCol = dtb__163 }))))
  | Base_dData_dList.C_Base_dData_dList_dList_Nil -> { f_Vuna_dCompiler_dFrontend_dToml_dTomlCursor_cursorChars = Base_dData_dList.C_Base_dData_dList_dList_Nil; f_Vuna_dCompiler_dFrontend_dToml_dTomlCursor_cursorLine = dtb__162; f_Vuna_dCompiler_dFrontend_dToml_dTomlCursor_cursorCol = dtb__163 }
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
))

# 397 "Vuna/Compiler/Frontend/Toml.vuna"
let v_Vuna_dCompiler_dFrontend_dToml_dskipGap = (fun (cs : t_Vuna_dCompiler_dFrontend_dToml_dTomlCursor) -> ((v_Vuna_dCompiler_dFrontend_dToml_dskipGapGo false) cs))

# 415 "Vuna/Compiler/Frontend/Toml.vuna"
let v_Vuna_dCompiler_dFrontend_dToml_dutf8OfCode = (fun (c : int) -> (if (c < 128) then (Base_dData_dList.C_Base_dData_dList_dList__x58__x58_ (c, Base_dData_dList.C_Base_dData_dList_dList_Nil)) else (if (c < 2048) then (Base_dData_dList.C_Base_dData_dList_dList__x58__x58_ ((192 + ((Base_dData_dBits.v_Base_dData_dBits_dshr c) 6)), (Base_dData_dList.C_Base_dData_dList_dList__x58__x58_ ((128 + ((Base_dData_dBits.v_Base_dData_dBits_dband c) 63)), Base_dData_dList.C_Base_dData_dList_dList_Nil)))) else (if (c < 65536) then (Base_dData_dList.C_Base_dData_dList_dList__x58__x58_ ((224 + ((Base_dData_dBits.v_Base_dData_dBits_dshr c) 12)), (Base_dData_dList.C_Base_dData_dList_dList__x58__x58_ ((128 + ((Base_dData_dBits.v_Base_dData_dBits_dband ((Base_dData_dBits.v_Base_dData_dBits_dshr c) 6)) 63)), (Base_dData_dList.C_Base_dData_dList_dList__x58__x58_ ((128 + ((Base_dData_dBits.v_Base_dData_dBits_dband c) 63)), Base_dData_dList.C_Base_dData_dList_dList_Nil)))))) else (Base_dData_dList.C_Base_dData_dList_dList__x58__x58_ ((240 + ((Base_dData_dBits.v_Base_dData_dBits_dshr c) 18)), (Base_dData_dList.C_Base_dData_dList_dList__x58__x58_ ((128 + ((Base_dData_dBits.v_Base_dData_dBits_dband ((Base_dData_dBits.v_Base_dData_dBits_dshr c) 12)) 63)), (Base_dData_dList.C_Base_dData_dList_dList__x58__x58_ ((128 + ((Base_dData_dBits.v_Base_dData_dBits_dband ((Base_dData_dBits.v_Base_dData_dBits_dshr c) 6)) 63)), (Base_dData_dList.C_Base_dData_dList_dList__x58__x58_ ((128 + ((Base_dData_dBits.v_Base_dData_dBits_dband c) 63)), Base_dData_dList.C_Base_dData_dList_dList_Nil))))))))))))

# 426 "Vuna/Compiler/Frontend/Toml.vuna"
let v_Vuna_dCompiler_dFrontend_dToml_disSurrogate = (fun (c : int) -> (if (c >= 55296) then (c <= 57343) else false))

# 481 "Vuna/Compiler/Frontend/Toml.vuna"
let rec v_Vuna_dCompiler_dFrontend_dToml_dparseHexCode = (fun (fuel : int) (digits : int) (path : string) (cs : t_Vuna_dCompiler_dFrontend_dToml_dTomlCursor) (count : int) (acc : int) -> (if (count >= digits) then (Vuna_dCompiler_dBase_dDiag.C_Vuna_dCompiler_dBase_dDiag_dCheck_OkC ({ Base_dData_dPair.f_Base_dData_dPair_dPair_first = acc; Base_dData_dPair.f_Base_dData_dPair_dPair_second = cs })) else (if (fuel <= 0) then (Vuna_dCompiler_dBase_dDiag.v_Vuna_dCompiler_dBase_dDiag_dicFuel "toml") else (match (cs).f_Vuna_dCompiler_dFrontend_dToml_dTomlCursor_cursorChars with
  | Base_dData_dList.C_Base_dData_dList_dList_Nil -> (((v_Vuna_dCompiler_dFrontend_dToml_dfailAt path) (cs).f_Vuna_dCompiler_dFrontend_dToml_dTomlCursor_cursorLine) "unterminated unicode escape")
  | Base_dData_dList.C_Base_dData_dList_dList__x58__x58_ (dtb__166, dtb__167) -> (if (v_Vuna_dCompiler_dFrontend_dToml_disHexDigit dtb__166) then ((((((v_Vuna_dCompiler_dFrontend_dToml_dparseHexCode (fuel - 1)) digits) path) (v_Vuna_dCompiler_dFrontend_dToml_dadvanceCursor cs)) (count + 1)) ((acc * 16) + (v_Vuna_dCompiler_dFrontend_dToml_dhexValue dtb__166))) else (((v_Vuna_dCompiler_dFrontend_dToml_dfailAt path) (cs).f_Vuna_dCompiler_dFrontend_dToml_dTomlCursor_cursorLine) "invalid hex digit in unicode escape"))
  | _ -> failwith "DT: impossible branch"
))))

# 437 "Vuna/Compiler/Frontend/Toml.vuna"
let rec v_Vuna_dCompiler_dFrontend_dToml_dparseBasicChars = (fun (fuel : int) (path : string) (startCs : t_Vuna_dCompiler_dFrontend_dToml_dTomlCursor) (cs : t_Vuna_dCompiler_dFrontend_dToml_dTomlCursor) (acc : int Base_dData_dList.t_Base_dData_dList_dList) -> (if (fuel <= 0) then (Vuna_dCompiler_dBase_dDiag.v_Vuna_dCompiler_dBase_dDiag_dicFuel "toml") else (match (cs).f_Vuna_dCompiler_dFrontend_dToml_dTomlCursor_cursorChars with
  | Base_dData_dList.C_Base_dData_dList_dList_Nil -> (((v_Vuna_dCompiler_dFrontend_dToml_dfailAt path) (startCs).f_Vuna_dCompiler_dFrontend_dToml_dTomlCursor_cursorLine) "unterminated basic string")
  | Base_dData_dList.C_Base_dData_dList_dList__x58__x58_ (dtb__168, dtb__169) -> (if (dtb__168 = 34) then (Vuna_dCompiler_dBase_dDiag.C_Vuna_dCompiler_dBase_dDiag_dCheck_OkC ({ Base_dData_dPair.f_Base_dData_dPair_dPair_first = (Base_dData_dList.dtp_pack (Base_dData_dList.v_Base_dData_dList_dreverse acc)); Base_dData_dPair.f_Base_dData_dPair_dPair_second = (v_Vuna_dCompiler_dFrontend_dToml_dadvanceCursor cs) })) else (if (dtb__168 = 10) then (((v_Vuna_dCompiler_dFrontend_dToml_dfailAt path) (startCs).f_Vuna_dCompiler_dFrontend_dToml_dTomlCursor_cursorLine) "unterminated basic string (newline in string)") else (if (dtb__168 = 92) then (((((v_Vuna_dCompiler_dFrontend_dToml_dparseBasicEscape (fuel - 1)) path) startCs) (v_Vuna_dCompiler_dFrontend_dToml_dadvanceCursor cs)) acc) else (((((v_Vuna_dCompiler_dFrontend_dToml_dparseBasicChars (fuel - 1)) path) startCs) (v_Vuna_dCompiler_dFrontend_dToml_dadvanceCursor cs)) (Base_dData_dList.C_Base_dData_dList_dList__x58__x58_ (dtb__168, acc))))))
  | _ -> failwith "DT: impossible branch"
)))
# 451 "Vuna/Compiler/Frontend/Toml.vuna"
and v_Vuna_dCompiler_dFrontend_dToml_dparseBasicEscape = (fun (fuel : int) (path : string) (startCs : t_Vuna_dCompiler_dFrontend_dToml_dTomlCursor) (cs : t_Vuna_dCompiler_dFrontend_dToml_dTomlCursor) (acc : int Base_dData_dList.t_Base_dData_dList_dList) -> (if (fuel <= 0) then (Vuna_dCompiler_dBase_dDiag.v_Vuna_dCompiler_dBase_dDiag_dicFuel "toml") else (match (cs).f_Vuna_dCompiler_dFrontend_dToml_dTomlCursor_cursorChars with
  | Base_dData_dList.C_Base_dData_dList_dList_Nil -> (((v_Vuna_dCompiler_dFrontend_dToml_dfailAt path) (startCs).f_Vuna_dCompiler_dFrontend_dToml_dTomlCursor_cursorLine) "unterminated escape sequence")
  | Base_dData_dList.C_Base_dData_dList_dList__x58__x58_ (dtb__170, dtb__171) -> (if (dtb__170 = 110) then (((((v_Vuna_dCompiler_dFrontend_dToml_dparseBasicChars (fuel - 1)) path) startCs) (v_Vuna_dCompiler_dFrontend_dToml_dadvanceCursor cs)) (Base_dData_dList.C_Base_dData_dList_dList__x58__x58_ (10, acc))) else (if (dtb__170 = 116) then (((((v_Vuna_dCompiler_dFrontend_dToml_dparseBasicChars (fuel - 1)) path) startCs) (v_Vuna_dCompiler_dFrontend_dToml_dadvanceCursor cs)) (Base_dData_dList.C_Base_dData_dList_dList__x58__x58_ (9, acc))) else (if (dtb__170 = 114) then (((((v_Vuna_dCompiler_dFrontend_dToml_dparseBasicChars (fuel - 1)) path) startCs) (v_Vuna_dCompiler_dFrontend_dToml_dadvanceCursor cs)) (Base_dData_dList.C_Base_dData_dList_dList__x58__x58_ (13, acc))) else (if (dtb__170 = 98) then (((((v_Vuna_dCompiler_dFrontend_dToml_dparseBasicChars (fuel - 1)) path) startCs) (v_Vuna_dCompiler_dFrontend_dToml_dadvanceCursor cs)) (Base_dData_dList.C_Base_dData_dList_dList__x58__x58_ (8, acc))) else (if (dtb__170 = 102) then (((((v_Vuna_dCompiler_dFrontend_dToml_dparseBasicChars (fuel - 1)) path) startCs) (v_Vuna_dCompiler_dFrontend_dToml_dadvanceCursor cs)) (Base_dData_dList.C_Base_dData_dList_dList__x58__x58_ (12, acc))) else (if (dtb__170 = 34) then (((((v_Vuna_dCompiler_dFrontend_dToml_dparseBasicChars (fuel - 1)) path) startCs) (v_Vuna_dCompiler_dFrontend_dToml_dadvanceCursor cs)) (Base_dData_dList.C_Base_dData_dList_dList__x58__x58_ (34, acc))) else (if (dtb__170 = 92) then (((((v_Vuna_dCompiler_dFrontend_dToml_dparseBasicChars (fuel - 1)) path) startCs) (v_Vuna_dCompiler_dFrontend_dToml_dadvanceCursor cs)) (Base_dData_dList.C_Base_dData_dList_dList__x58__x58_ (92, acc))) else (if (dtb__170 = 117) then ((((((v_Vuna_dCompiler_dFrontend_dToml_dparseUnicodeEscape (fuel - 1)) 4) path) startCs) (v_Vuna_dCompiler_dFrontend_dToml_dadvanceCursor cs)) acc) else (if (dtb__170 = 85) then ((((((v_Vuna_dCompiler_dFrontend_dToml_dparseUnicodeEscape (fuel - 1)) 8) path) startCs) (v_Vuna_dCompiler_dFrontend_dToml_dadvanceCursor cs)) acc) else (((v_Vuna_dCompiler_dFrontend_dToml_dfailAt path) (cs).f_Vuna_dCompiler_dFrontend_dToml_dTomlCursor_cursorLine) ("unknown escape sequence \\" ^ (Base_dData_dList.dtp_pack (Base_dData_dList.C_Base_dData_dList_dList__x58__x58_ (dtb__170, Base_dData_dList.C_Base_dData_dList_dList_Nil))))))))))))))
  | _ -> failwith "DT: impossible branch"
)))
# 471 "Vuna/Compiler/Frontend/Toml.vuna"
and v_Vuna_dCompiler_dFrontend_dToml_dparseUnicodeEscape = (fun (fuel : int) (digits : int) (path : string) (startCs : t_Vuna_dCompiler_dFrontend_dToml_dTomlCursor) (cs : t_Vuna_dCompiler_dFrontend_dToml_dTomlCursor) (acc : int Base_dData_dList.t_Base_dData_dList_dList) -> (if (fuel <= 0) then (Vuna_dCompiler_dBase_dDiag.v_Vuna_dCompiler_dBase_dDiag_dicFuel "toml") else ((fun nd_uscrut6 -> (match nd_uscrut6 with
  | Vuna_dCompiler_dBase_dDiag.C_Vuna_dCompiler_dBase_dDiag_dCheck_OkC (dtb__172) -> (match dtb__172 with
  | { Base_dData_dPair.f_Base_dData_dPair_dPair_first = dtb__173; Base_dData_dPair.f_Base_dData_dPair_dPair_second = dtb__174 } -> (if (dtb__173 > 1114111) then (((v_Vuna_dCompiler_dFrontend_dToml_dfailAt path) (startCs).f_Vuna_dCompiler_dFrontend_dToml_dTomlCursor_cursorLine) "unicode escape out of range") else (if (v_Vuna_dCompiler_dFrontend_dToml_disSurrogate dtb__173) then (((v_Vuna_dCompiler_dFrontend_dToml_dfailAt path) (startCs).f_Vuna_dCompiler_dFrontend_dToml_dTomlCursor_cursorLine) "unicode escape is a surrogate code point") else (((((v_Vuna_dCompiler_dFrontend_dToml_dparseBasicChars (fuel - 1)) path) startCs) dtb__174) ((Base_dData_dList.v_Base_dData_dList_dappend (Base_dData_dList.v_Base_dData_dList_dreverse (v_Vuna_dCompiler_dFrontend_dToml_dutf8OfCode dtb__173))) acc))))
  | _ -> failwith "DT: impossible branch"
)
  | Vuna_dCompiler_dBase_dDiag.C_Vuna_dCompiler_dBase_dDiag_dCheck_ErrC (dtb__175) -> (Vuna_dCompiler_dBase_dDiag.C_Vuna_dCompiler_dBase_dDiag_dCheck_ErrC (dtb__175))
  | _ -> failwith "DT: impossible branch"
)) ((((((v_Vuna_dCompiler_dFrontend_dToml_dparseHexCode (v_Vuna_dCompiler_dFrontend_dToml_dcursorFuel cs)) digits) path) cs) 0) 0))))

# 431 "Vuna/Compiler/Frontend/Toml.vuna"
let v_Vuna_dCompiler_dFrontend_dToml_dparseBasicString = (fun (path : string) (cs : t_Vuna_dCompiler_dFrontend_dToml_dTomlCursor) -> (match (cs).f_Vuna_dCompiler_dFrontend_dToml_dTomlCursor_cursorChars with
  | Base_dData_dList.C_Base_dData_dList_dList_Nil -> (((v_Vuna_dCompiler_dFrontend_dToml_dfailAt path) (cs).f_Vuna_dCompiler_dFrontend_dToml_dTomlCursor_cursorLine) "unterminated basic string")
  | Base_dData_dList.C_Base_dData_dList_dList__x58__x58_ (dtb__176, dtb__177) -> (((((v_Vuna_dCompiler_dFrontend_dToml_dparseBasicChars (v_Vuna_dCompiler_dFrontend_dToml_dcursorFuel (v_Vuna_dCompiler_dFrontend_dToml_dadvanceCursor cs))) path) cs) (v_Vuna_dCompiler_dFrontend_dToml_dadvanceCursor cs)) Base_dData_dList.C_Base_dData_dList_dList_Nil)
  | _ -> failwith "DT: impossible branch"
))

# 499 "Vuna/Compiler/Frontend/Toml.vuna"
let rec v_Vuna_dCompiler_dFrontend_dToml_dparseLiteralChars = (fun (fuel : int) (path : string) (startCs : t_Vuna_dCompiler_dFrontend_dToml_dTomlCursor) (cs : t_Vuna_dCompiler_dFrontend_dToml_dTomlCursor) (acc : int Base_dData_dList.t_Base_dData_dList_dList) -> (if (fuel <= 0) then (Vuna_dCompiler_dBase_dDiag.v_Vuna_dCompiler_dBase_dDiag_dicFuel "toml") else (match (cs).f_Vuna_dCompiler_dFrontend_dToml_dTomlCursor_cursorChars with
  | Base_dData_dList.C_Base_dData_dList_dList_Nil -> (((v_Vuna_dCompiler_dFrontend_dToml_dfailAt path) (startCs).f_Vuna_dCompiler_dFrontend_dToml_dTomlCursor_cursorLine) "unterminated literal string")
  | Base_dData_dList.C_Base_dData_dList_dList__x58__x58_ (dtb__178, dtb__179) -> (if (dtb__178 = 39) then (Vuna_dCompiler_dBase_dDiag.C_Vuna_dCompiler_dBase_dDiag_dCheck_OkC ({ Base_dData_dPair.f_Base_dData_dPair_dPair_first = (Base_dData_dList.dtp_pack (Base_dData_dList.v_Base_dData_dList_dreverse acc)); Base_dData_dPair.f_Base_dData_dPair_dPair_second = (v_Vuna_dCompiler_dFrontend_dToml_dadvanceCursor cs) })) else (if (dtb__178 = 10) then (((v_Vuna_dCompiler_dFrontend_dToml_dfailAt path) (startCs).f_Vuna_dCompiler_dFrontend_dToml_dTomlCursor_cursorLine) "unterminated literal string (newline in string)") else (((((v_Vuna_dCompiler_dFrontend_dToml_dparseLiteralChars (fuel - 1)) path) startCs) (v_Vuna_dCompiler_dFrontend_dToml_dadvanceCursor cs)) (Base_dData_dList.C_Base_dData_dList_dList__x58__x58_ (dtb__178, acc)))))
  | _ -> failwith "DT: impossible branch"
)))

# 493 "Vuna/Compiler/Frontend/Toml.vuna"
let v_Vuna_dCompiler_dFrontend_dToml_dparseLiteralString = (fun (path : string) (cs : t_Vuna_dCompiler_dFrontend_dToml_dTomlCursor) -> (match (cs).f_Vuna_dCompiler_dFrontend_dToml_dTomlCursor_cursorChars with
  | Base_dData_dList.C_Base_dData_dList_dList_Nil -> (((v_Vuna_dCompiler_dFrontend_dToml_dfailAt path) (cs).f_Vuna_dCompiler_dFrontend_dToml_dTomlCursor_cursorLine) "unterminated literal string")
  | Base_dData_dList.C_Base_dData_dList_dList__x58__x58_ (dtb__180, dtb__181) -> (((((v_Vuna_dCompiler_dFrontend_dToml_dparseLiteralChars (v_Vuna_dCompiler_dFrontend_dToml_dcursorFuel (v_Vuna_dCompiler_dFrontend_dToml_dadvanceCursor cs))) path) cs) (v_Vuna_dCompiler_dFrontend_dToml_dadvanceCursor cs)) Base_dData_dList.C_Base_dData_dList_dList_Nil)
  | _ -> failwith "DT: impossible branch"
))

# 520 "Vuna/Compiler/Frontend/Toml.vuna"
let v_Vuna_dCompiler_dFrontend_dToml_ddropFirstNewline = (fun (mc0 : t_Vuna_dCompiler_dFrontend_dToml_dTomlCursor) -> (match mc0 with
  | { f_Vuna_dCompiler_dFrontend_dToml_dTomlCursor_cursorChars = dtb__182; f_Vuna_dCompiler_dFrontend_dToml_dTomlCursor_cursorLine = dtb__183; f_Vuna_dCompiler_dFrontend_dToml_dTomlCursor_cursorCol = dtb__184 } -> (match dtb__182 with
  | Base_dData_dList.C_Base_dData_dList_dList__x58__x58_ (dtb__185, dtb__186) -> (if (dtb__185 = 10) then { f_Vuna_dCompiler_dFrontend_dToml_dTomlCursor_cursorChars = dtb__186; f_Vuna_dCompiler_dFrontend_dToml_dTomlCursor_cursorLine = (dtb__183 + 1); f_Vuna_dCompiler_dFrontend_dToml_dTomlCursor_cursorCol = 1 } else { f_Vuna_dCompiler_dFrontend_dToml_dTomlCursor_cursorChars = (Base_dData_dList.C_Base_dData_dList_dList__x58__x58_ (dtb__185, dtb__186)); f_Vuna_dCompiler_dFrontend_dToml_dTomlCursor_cursorLine = dtb__183; f_Vuna_dCompiler_dFrontend_dToml_dTomlCursor_cursorCol = dtb__184 })
  | Base_dData_dList.C_Base_dData_dList_dList_Nil -> { f_Vuna_dCompiler_dFrontend_dToml_dTomlCursor_cursorChars = Base_dData_dList.C_Base_dData_dList_dList_Nil; f_Vuna_dCompiler_dFrontend_dToml_dTomlCursor_cursorLine = dtb__183; f_Vuna_dCompiler_dFrontend_dToml_dTomlCursor_cursorCol = dtb__184 }
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
))

# 554 "Vuna/Compiler/Frontend/Toml.vuna"
let rec v_Vuna_dCompiler_dFrontend_dToml_dskipContinuation = (fun (mc0 : t_Vuna_dCompiler_dFrontend_dToml_dTomlCursor) -> (match mc0 with
  | { f_Vuna_dCompiler_dFrontend_dToml_dTomlCursor_cursorChars = dtb__187; f_Vuna_dCompiler_dFrontend_dToml_dTomlCursor_cursorLine = dtb__188; f_Vuna_dCompiler_dFrontend_dToml_dTomlCursor_cursorCol = dtb__189 } -> (match dtb__187 with
  | Base_dData_dList.C_Base_dData_dList_dList__x58__x58_ (dtb__190, dtb__191) -> (if (v_Vuna_dCompiler_dFrontend_dToml_disBlankChar dtb__190) then (v_Vuna_dCompiler_dFrontend_dToml_dskipContinuation { f_Vuna_dCompiler_dFrontend_dToml_dTomlCursor_cursorChars = dtb__191; f_Vuna_dCompiler_dFrontend_dToml_dTomlCursor_cursorLine = dtb__188; f_Vuna_dCompiler_dFrontend_dToml_dTomlCursor_cursorCol = (dtb__189 + 1) }) else (if (dtb__190 = 10) then (v_Vuna_dCompiler_dFrontend_dToml_dskipContinuation { f_Vuna_dCompiler_dFrontend_dToml_dTomlCursor_cursorChars = dtb__191; f_Vuna_dCompiler_dFrontend_dToml_dTomlCursor_cursorLine = (dtb__188 + 1); f_Vuna_dCompiler_dFrontend_dToml_dTomlCursor_cursorCol = 1 }) else { f_Vuna_dCompiler_dFrontend_dToml_dTomlCursor_cursorChars = (Base_dData_dList.C_Base_dData_dList_dList__x58__x58_ (dtb__190, dtb__191)); f_Vuna_dCompiler_dFrontend_dToml_dTomlCursor_cursorLine = dtb__188; f_Vuna_dCompiler_dFrontend_dToml_dTomlCursor_cursorCol = dtb__189 }))
  | Base_dData_dList.C_Base_dData_dList_dList_Nil -> { f_Vuna_dCompiler_dFrontend_dToml_dTomlCursor_cursorChars = Base_dData_dList.C_Base_dData_dList_dList_Nil; f_Vuna_dCompiler_dFrontend_dToml_dTomlCursor_cursorLine = dtb__188; f_Vuna_dCompiler_dFrontend_dToml_dTomlCursor_cursorCol = dtb__189 }
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
))

# 525 "Vuna/Compiler/Frontend/Toml.vuna"
let rec v_Vuna_dCompiler_dFrontend_dToml_dparseMultilineBasicChars = (fun (fuel : int) (path : string) (startCs : t_Vuna_dCompiler_dFrontend_dToml_dTomlCursor) (cs : t_Vuna_dCompiler_dFrontend_dToml_dTomlCursor) (acc : int Base_dData_dList.t_Base_dData_dList_dList) -> (if (fuel <= 0) then (Vuna_dCompiler_dBase_dDiag.v_Vuna_dCompiler_dBase_dDiag_dicFuel "toml") else (match (cs).f_Vuna_dCompiler_dFrontend_dToml_dTomlCursor_cursorChars with
  | Base_dData_dList.C_Base_dData_dList_dList_Nil -> (((v_Vuna_dCompiler_dFrontend_dToml_dfailAt path) (startCs).f_Vuna_dCompiler_dFrontend_dToml_dTomlCursor_cursorLine) "unterminated multiline string")
  | Base_dData_dList.C_Base_dData_dList_dList__x58__x58_ (dtb__192, dtb__193) -> (if (dtb__192 = 34) then (if ((v_Vuna_dCompiler_dFrontend_dToml_dstartsWithTripleOf 34) (cs).f_Vuna_dCompiler_dFrontend_dToml_dTomlCursor_cursorChars) then (Vuna_dCompiler_dBase_dDiag.C_Vuna_dCompiler_dBase_dDiag_dCheck_OkC ({ Base_dData_dPair.f_Base_dData_dPair_dPair_first = (Base_dData_dList.dtp_pack (Base_dData_dList.v_Base_dData_dList_dreverse acc)); Base_dData_dPair.f_Base_dData_dPair_dPair_second = ((v_Vuna_dCompiler_dFrontend_dToml_dadvanceChars 3) cs) })) else (((((v_Vuna_dCompiler_dFrontend_dToml_dparseMultilineBasicChars (fuel - 1)) path) startCs) (v_Vuna_dCompiler_dFrontend_dToml_dadvanceCursor cs)) (Base_dData_dList.C_Base_dData_dList_dList__x58__x58_ (34, acc)))) else (if (dtb__192 = 10) then (((((v_Vuna_dCompiler_dFrontend_dToml_dparseMultilineBasicChars (fuel - 1)) path) startCs) { f_Vuna_dCompiler_dFrontend_dToml_dTomlCursor_cursorChars = dtb__193; f_Vuna_dCompiler_dFrontend_dToml_dTomlCursor_cursorLine = ((cs).f_Vuna_dCompiler_dFrontend_dToml_dTomlCursor_cursorLine + 1); f_Vuna_dCompiler_dFrontend_dToml_dTomlCursor_cursorCol = 1 }) (Base_dData_dList.C_Base_dData_dList_dList__x58__x58_ (10, acc))) else (if (dtb__192 = 92) then (((((v_Vuna_dCompiler_dFrontend_dToml_dparseMultilineEscape (fuel - 1)) path) startCs) (v_Vuna_dCompiler_dFrontend_dToml_dadvanceCursor cs)) acc) else (((((v_Vuna_dCompiler_dFrontend_dToml_dparseMultilineBasicChars (fuel - 1)) path) startCs) (v_Vuna_dCompiler_dFrontend_dToml_dadvanceCursor cs)) (Base_dData_dList.C_Base_dData_dList_dList__x58__x58_ (dtb__192, acc))))))
  | _ -> failwith "DT: impossible branch"
)))
# 540 "Vuna/Compiler/Frontend/Toml.vuna"
and v_Vuna_dCompiler_dFrontend_dToml_dparseMultilineEscape = (fun (fuel : int) (path : string) (startCs : t_Vuna_dCompiler_dFrontend_dToml_dTomlCursor) (cs : t_Vuna_dCompiler_dFrontend_dToml_dTomlCursor) (acc : int Base_dData_dList.t_Base_dData_dList_dList) -> (if (fuel <= 0) then (Vuna_dCompiler_dBase_dDiag.v_Vuna_dCompiler_dBase_dDiag_dicFuel "toml") else (match (cs).f_Vuna_dCompiler_dFrontend_dToml_dTomlCursor_cursorChars with
  | Base_dData_dList.C_Base_dData_dList_dList_Nil -> (((v_Vuna_dCompiler_dFrontend_dToml_dfailAt path) (startCs).f_Vuna_dCompiler_dFrontend_dToml_dTomlCursor_cursorLine) "unterminated escape sequence")
  | Base_dData_dList.C_Base_dData_dList_dList__x58__x58_ (dtb__194, dtb__195) -> (if (dtb__194 = 10) then (((((v_Vuna_dCompiler_dFrontend_dToml_dparseMultilineBasicChars (fuel - 1)) path) startCs) (v_Vuna_dCompiler_dFrontend_dToml_dskipContinuation { f_Vuna_dCompiler_dFrontend_dToml_dTomlCursor_cursorChars = dtb__195; f_Vuna_dCompiler_dFrontend_dToml_dTomlCursor_cursorLine = ((cs).f_Vuna_dCompiler_dFrontend_dToml_dTomlCursor_cursorLine + 1); f_Vuna_dCompiler_dFrontend_dToml_dTomlCursor_cursorCol = 1 })) acc) else (if (dtb__194 = 32) then (((((v_Vuna_dCompiler_dFrontend_dToml_dparseMultilineBasicChars (fuel - 1)) path) startCs) (v_Vuna_dCompiler_dFrontend_dToml_dskipContinuation cs)) acc) else (if (dtb__194 = 9) then (((((v_Vuna_dCompiler_dFrontend_dToml_dparseMultilineBasicChars (fuel - 1)) path) startCs) (v_Vuna_dCompiler_dFrontend_dToml_dskipContinuation cs)) acc) else (((((v_Vuna_dCompiler_dFrontend_dToml_dparseBasicEscape (fuel - 1)) path) startCs) cs) acc))))
  | _ -> failwith "DT: impossible branch"
)))

# 514 "Vuna/Compiler/Frontend/Toml.vuna"
let v_Vuna_dCompiler_dFrontend_dToml_dparseMultilineBasic = (fun (path : string) (cs : t_Vuna_dCompiler_dFrontend_dToml_dTomlCursor) -> ((fun afterOpen -> (((((v_Vuna_dCompiler_dFrontend_dToml_dparseMultilineBasicChars (v_Vuna_dCompiler_dFrontend_dToml_dcursorFuel afterOpen)) path) cs) afterOpen) Base_dData_dList.C_Base_dData_dList_dList_Nil)) (v_Vuna_dCompiler_dFrontend_dToml_ddropFirstNewline cs)))

# 571 "Vuna/Compiler/Frontend/Toml.vuna"
let rec v_Vuna_dCompiler_dFrontend_dToml_dparseMultilineLiteralChars = (fun (fuel : int) (path : string) (startCs : t_Vuna_dCompiler_dFrontend_dToml_dTomlCursor) (cs : t_Vuna_dCompiler_dFrontend_dToml_dTomlCursor) (acc : int Base_dData_dList.t_Base_dData_dList_dList) -> (if (fuel <= 0) then (Vuna_dCompiler_dBase_dDiag.v_Vuna_dCompiler_dBase_dDiag_dicFuel "toml") else (match (cs).f_Vuna_dCompiler_dFrontend_dToml_dTomlCursor_cursorChars with
  | Base_dData_dList.C_Base_dData_dList_dList_Nil -> (((v_Vuna_dCompiler_dFrontend_dToml_dfailAt path) (startCs).f_Vuna_dCompiler_dFrontend_dToml_dTomlCursor_cursorLine) "unterminated multiline literal string")
  | Base_dData_dList.C_Base_dData_dList_dList__x58__x58_ (dtb__196, dtb__197) -> (if (dtb__196 = 39) then (if ((v_Vuna_dCompiler_dFrontend_dToml_dstartsWithTripleOf 39) (cs).f_Vuna_dCompiler_dFrontend_dToml_dTomlCursor_cursorChars) then (Vuna_dCompiler_dBase_dDiag.C_Vuna_dCompiler_dBase_dDiag_dCheck_OkC ({ Base_dData_dPair.f_Base_dData_dPair_dPair_first = (Base_dData_dList.dtp_pack (Base_dData_dList.v_Base_dData_dList_dreverse acc)); Base_dData_dPair.f_Base_dData_dPair_dPair_second = ((v_Vuna_dCompiler_dFrontend_dToml_dadvanceChars 3) cs) })) else (((((v_Vuna_dCompiler_dFrontend_dToml_dparseMultilineLiteralChars (fuel - 1)) path) startCs) (v_Vuna_dCompiler_dFrontend_dToml_dadvanceCursor cs)) (Base_dData_dList.C_Base_dData_dList_dList__x58__x58_ (39, acc)))) else (if (dtb__196 = 10) then (((((v_Vuna_dCompiler_dFrontend_dToml_dparseMultilineLiteralChars (fuel - 1)) path) startCs) { f_Vuna_dCompiler_dFrontend_dToml_dTomlCursor_cursorChars = dtb__197; f_Vuna_dCompiler_dFrontend_dToml_dTomlCursor_cursorLine = ((cs).f_Vuna_dCompiler_dFrontend_dToml_dTomlCursor_cursorLine + 1); f_Vuna_dCompiler_dFrontend_dToml_dTomlCursor_cursorCol = 1 }) (Base_dData_dList.C_Base_dData_dList_dList__x58__x58_ (10, acc))) else (((((v_Vuna_dCompiler_dFrontend_dToml_dparseMultilineLiteralChars (fuel - 1)) path) startCs) (v_Vuna_dCompiler_dFrontend_dToml_dadvanceCursor cs)) (Base_dData_dList.C_Base_dData_dList_dList__x58__x58_ (dtb__196, acc)))))
  | _ -> failwith "DT: impossible branch"
)))

# 565 "Vuna/Compiler/Frontend/Toml.vuna"
let v_Vuna_dCompiler_dFrontend_dToml_dparseMultilineLiteral = (fun (path : string) (cs : t_Vuna_dCompiler_dFrontend_dToml_dTomlCursor) -> ((fun afterOpen -> (((((v_Vuna_dCompiler_dFrontend_dToml_dparseMultilineLiteralChars (v_Vuna_dCompiler_dFrontend_dToml_dcursorFuel afterOpen)) path) cs) afterOpen) Base_dData_dList.C_Base_dData_dList_dList_Nil)) (v_Vuna_dCompiler_dFrontend_dToml_ddropFirstNewline cs)))

# 585 "Vuna/Compiler/Frontend/Toml.vuna"
let rec v_Vuna_dCompiler_dFrontend_dToml_dcollectBareKey = (fun (mc0 : t_Vuna_dCompiler_dFrontend_dToml_dTomlCursor) (mc1 : int Base_dData_dList.t_Base_dData_dList_dList) -> (match mc0 with
  | { f_Vuna_dCompiler_dFrontend_dToml_dTomlCursor_cursorChars = dtb__198; f_Vuna_dCompiler_dFrontend_dToml_dTomlCursor_cursorLine = dtb__199; f_Vuna_dCompiler_dFrontend_dToml_dTomlCursor_cursorCol = dtb__200 } -> (match dtb__198 with
  | Base_dData_dList.C_Base_dData_dList_dList__x58__x58_ (dtb__201, dtb__202) -> (if (v_Vuna_dCompiler_dFrontend_dToml_disBareKeyChar dtb__201) then ((v_Vuna_dCompiler_dFrontend_dToml_dcollectBareKey { f_Vuna_dCompiler_dFrontend_dToml_dTomlCursor_cursorChars = dtb__202; f_Vuna_dCompiler_dFrontend_dToml_dTomlCursor_cursorLine = dtb__199; f_Vuna_dCompiler_dFrontend_dToml_dTomlCursor_cursorCol = (dtb__200 + 1) }) (Base_dData_dList.C_Base_dData_dList_dList__x58__x58_ (dtb__201, mc1))) else { Base_dData_dPair.f_Base_dData_dPair_dPair_first = (Base_dData_dList.dtp_pack (Base_dData_dList.v_Base_dData_dList_dreverse mc1)); Base_dData_dPair.f_Base_dData_dPair_dPair_second = { f_Vuna_dCompiler_dFrontend_dToml_dTomlCursor_cursorChars = (Base_dData_dList.C_Base_dData_dList_dList__x58__x58_ (dtb__201, dtb__202)); f_Vuna_dCompiler_dFrontend_dToml_dTomlCursor_cursorLine = dtb__199; f_Vuna_dCompiler_dFrontend_dToml_dTomlCursor_cursorCol = dtb__200 } })
  | Base_dData_dList.C_Base_dData_dList_dList_Nil -> { Base_dData_dPair.f_Base_dData_dPair_dPair_first = (Base_dData_dList.dtp_pack (Base_dData_dList.v_Base_dData_dList_dreverse mc1)); Base_dData_dPair.f_Base_dData_dPair_dPair_second = { f_Vuna_dCompiler_dFrontend_dToml_dTomlCursor_cursorChars = Base_dData_dList.C_Base_dData_dList_dList_Nil; f_Vuna_dCompiler_dFrontend_dToml_dTomlCursor_cursorLine = dtb__199; f_Vuna_dCompiler_dFrontend_dToml_dTomlCursor_cursorCol = dtb__200 } }
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
))

# 593 "Vuna/Compiler/Frontend/Toml.vuna"
let v_Vuna_dCompiler_dFrontend_dToml_dparseBareKey = (fun (path : string) (cs : t_Vuna_dCompiler_dFrontend_dToml_dTomlCursor) -> (match (cs).f_Vuna_dCompiler_dFrontend_dToml_dTomlCursor_cursorChars with
  | Base_dData_dList.C_Base_dData_dList_dList_Nil -> (((v_Vuna_dCompiler_dFrontend_dToml_dfailAt path) (cs).f_Vuna_dCompiler_dFrontend_dToml_dTomlCursor_cursorLine) "expected a key")
  | Base_dData_dList.C_Base_dData_dList_dList__x58__x58_ (dtb__203, dtb__204) -> (if (v_Vuna_dCompiler_dFrontend_dToml_disBareKeyChar dtb__203) then (Vuna_dCompiler_dBase_dDiag.C_Vuna_dCompiler_dBase_dDiag_dCheck_OkC (((v_Vuna_dCompiler_dFrontend_dToml_dcollectBareKey cs) Base_dData_dList.C_Base_dData_dList_dList_Nil))) else (((v_Vuna_dCompiler_dFrontend_dToml_dfailAt path) (cs).f_Vuna_dCompiler_dFrontend_dToml_dTomlCursor_cursorLine) "expected a key"))
  | _ -> failwith "DT: impossible branch"
))

# 604 "Vuna/Compiler/Frontend/Toml.vuna"
let v_Vuna_dCompiler_dFrontend_dToml_dparseKeySegment = (fun (path : string) (cs : t_Vuna_dCompiler_dFrontend_dToml_dTomlCursor) -> (match (cs).f_Vuna_dCompiler_dFrontend_dToml_dTomlCursor_cursorChars with
  | Base_dData_dList.C_Base_dData_dList_dList_Nil -> (((v_Vuna_dCompiler_dFrontend_dToml_dfailAt path) (cs).f_Vuna_dCompiler_dFrontend_dToml_dTomlCursor_cursorLine) "expected a key")
  | Base_dData_dList.C_Base_dData_dList_dList__x58__x58_ (dtb__205, dtb__206) -> (if (dtb__205 = 34) then ((fun nd_uscrut5 -> (match nd_uscrut5 with
  | Vuna_dCompiler_dBase_dDiag.C_Vuna_dCompiler_dBase_dDiag_dCheck_OkC (dtb__207) -> (match dtb__207 with
  | { Base_dData_dPair.f_Base_dData_dPair_dPair_first = dtb__208; Base_dData_dPair.f_Base_dData_dPair_dPair_second = dtb__209 } -> (if (dtb__208 = "") then (((v_Vuna_dCompiler_dFrontend_dToml_dfailAt path) (cs).f_Vuna_dCompiler_dFrontend_dToml_dTomlCursor_cursorLine) "expected a key") else (Vuna_dCompiler_dBase_dDiag.C_Vuna_dCompiler_dBase_dDiag_dCheck_OkC ({ Base_dData_dPair.f_Base_dData_dPair_dPair_first = dtb__208; Base_dData_dPair.f_Base_dData_dPair_dPair_second = dtb__209 })))
  | _ -> failwith "DT: impossible branch"
)
  | Vuna_dCompiler_dBase_dDiag.C_Vuna_dCompiler_dBase_dDiag_dCheck_ErrC (dtb__210) -> (Vuna_dCompiler_dBase_dDiag.C_Vuna_dCompiler_dBase_dDiag_dCheck_ErrC (dtb__210))
  | _ -> failwith "DT: impossible branch"
)) ((v_Vuna_dCompiler_dFrontend_dToml_dparseBasicString path) cs)) else (if (dtb__205 = 39) then ((fun nd_uscrut5 -> (match nd_uscrut5 with
  | Vuna_dCompiler_dBase_dDiag.C_Vuna_dCompiler_dBase_dDiag_dCheck_OkC (dtb__211) -> (match dtb__211 with
  | { Base_dData_dPair.f_Base_dData_dPair_dPair_first = dtb__212; Base_dData_dPair.f_Base_dData_dPair_dPair_second = dtb__213 } -> (if (dtb__212 = "") then (((v_Vuna_dCompiler_dFrontend_dToml_dfailAt path) (cs).f_Vuna_dCompiler_dFrontend_dToml_dTomlCursor_cursorLine) "expected a key") else (Vuna_dCompiler_dBase_dDiag.C_Vuna_dCompiler_dBase_dDiag_dCheck_OkC ({ Base_dData_dPair.f_Base_dData_dPair_dPair_first = dtb__212; Base_dData_dPair.f_Base_dData_dPair_dPair_second = dtb__213 })))
  | _ -> failwith "DT: impossible branch"
)
  | Vuna_dCompiler_dBase_dDiag.C_Vuna_dCompiler_dBase_dDiag_dCheck_ErrC (dtb__214) -> (Vuna_dCompiler_dBase_dDiag.C_Vuna_dCompiler_dBase_dDiag_dCheck_ErrC (dtb__214))
  | _ -> failwith "DT: impossible branch"
)) ((v_Vuna_dCompiler_dFrontend_dToml_dparseLiteralString path) cs)) else ((v_Vuna_dCompiler_dFrontend_dToml_dparseBareKey path) cs)))
  | _ -> failwith "DT: impossible branch"
))

# 626 "Vuna/Compiler/Frontend/Toml.vuna"
let rec v_Vuna_dCompiler_dFrontend_dToml_dparseKeySegments = (fun (fuel : int) (path : string) (cs : t_Vuna_dCompiler_dFrontend_dToml_dTomlCursor) (acc : string Base_dData_dList.t_Base_dData_dList_dList) -> (if (fuel <= 0) then (Vuna_dCompiler_dBase_dDiag.v_Vuna_dCompiler_dBase_dDiag_dicFuel "toml") else ((fun nd_uscrut4 -> (match nd_uscrut4 with
  | Vuna_dCompiler_dBase_dDiag.C_Vuna_dCompiler_dBase_dDiag_dCheck_OkC (dtb__215) -> (match dtb__215 with
  | { Base_dData_dPair.f_Base_dData_dPair_dPair_first = dtb__216; Base_dData_dPair.f_Base_dData_dPair_dPair_second = dtb__217 } -> (match (v_Vuna_dCompiler_dFrontend_dToml_dskipBlank dtb__217) with
  | { f_Vuna_dCompiler_dFrontend_dToml_dTomlCursor_cursorChars = dtb__218; f_Vuna_dCompiler_dFrontend_dToml_dTomlCursor_cursorLine = dtb__219; f_Vuna_dCompiler_dFrontend_dToml_dTomlCursor_cursorCol = dtb__220 } -> (match dtb__218 with
  | Base_dData_dList.C_Base_dData_dList_dList_Nil -> (Vuna_dCompiler_dBase_dDiag.C_Vuna_dCompiler_dBase_dDiag_dCheck_OkC ({ Base_dData_dPair.f_Base_dData_dPair_dPair_first = (Base_dData_dList.v_Base_dData_dList_dreverse (Base_dData_dList.C_Base_dData_dList_dList__x58__x58_ (dtb__216, acc))); Base_dData_dPair.f_Base_dData_dPair_dPair_second = { f_Vuna_dCompiler_dFrontend_dToml_dTomlCursor_cursorChars = dtb__218; f_Vuna_dCompiler_dFrontend_dToml_dTomlCursor_cursorLine = dtb__219; f_Vuna_dCompiler_dFrontend_dToml_dTomlCursor_cursorCol = dtb__220 } }))
  | Base_dData_dList.C_Base_dData_dList_dList__x58__x58_ (dtb__221, dtb__222) -> (if (dtb__221 = 46) then ((((v_Vuna_dCompiler_dFrontend_dToml_dparseKeySegments (fuel - 1)) path) { f_Vuna_dCompiler_dFrontend_dToml_dTomlCursor_cursorChars = dtb__222; f_Vuna_dCompiler_dFrontend_dToml_dTomlCursor_cursorLine = dtb__219; f_Vuna_dCompiler_dFrontend_dToml_dTomlCursor_cursorCol = (dtb__220 + 1) }) (Base_dData_dList.C_Base_dData_dList_dList__x58__x58_ (dtb__216, acc))) else (Vuna_dCompiler_dBase_dDiag.C_Vuna_dCompiler_dBase_dDiag_dCheck_OkC ({ Base_dData_dPair.f_Base_dData_dPair_dPair_first = (Base_dData_dList.v_Base_dData_dList_dreverse (Base_dData_dList.C_Base_dData_dList_dList__x58__x58_ (dtb__216, acc))); Base_dData_dPair.f_Base_dData_dPair_dPair_second = { f_Vuna_dCompiler_dFrontend_dToml_dTomlCursor_cursorChars = dtb__218; f_Vuna_dCompiler_dFrontend_dToml_dTomlCursor_cursorLine = dtb__219; f_Vuna_dCompiler_dFrontend_dToml_dTomlCursor_cursorCol = dtb__220 } })))
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
)
  | Vuna_dCompiler_dBase_dDiag.C_Vuna_dCompiler_dBase_dDiag_dCheck_ErrC (dtb__223) -> (Vuna_dCompiler_dBase_dDiag.C_Vuna_dCompiler_dBase_dDiag_dCheck_ErrC (dtb__223))
  | _ -> failwith "DT: impossible branch"
)) ((v_Vuna_dCompiler_dFrontend_dToml_dparseKeySegment path) (v_Vuna_dCompiler_dFrontend_dToml_dskipBlank cs)))))

# 623 "Vuna/Compiler/Frontend/Toml.vuna"
let v_Vuna_dCompiler_dFrontend_dToml_dparseKeyPath = (fun (path : string) (cs : t_Vuna_dCompiler_dFrontend_dToml_dTomlCursor) -> ((((v_Vuna_dCompiler_dFrontend_dToml_dparseKeySegments (v_Vuna_dCompiler_dFrontend_dToml_dcursorFuel cs)) path) cs) Base_dData_dList.C_Base_dData_dList_dList_Nil))

# 670 "Vuna/Compiler/Frontend/Toml.vuna"
let v_Vuna_dCompiler_dFrontend_dToml_dparseSingleStringValue = (fun (path : string) (cs : t_Vuna_dCompiler_dFrontend_dToml_dTomlCursor) -> (match (cs).f_Vuna_dCompiler_dFrontend_dToml_dTomlCursor_cursorChars with
  | Base_dData_dList.C_Base_dData_dList_dList_Nil -> (((v_Vuna_dCompiler_dFrontend_dToml_dfailAt path) (cs).f_Vuna_dCompiler_dFrontend_dToml_dTomlCursor_cursorLine) "expected a string")
  | Base_dData_dList.C_Base_dData_dList_dList__x58__x58_ (dtb__224, dtb__225) -> (if (dtb__224 = 34) then ((fun nd_uscrut5 -> (match nd_uscrut5 with
  | Vuna_dCompiler_dBase_dDiag.C_Vuna_dCompiler_dBase_dDiag_dCheck_OkC (dtb__226) -> (match dtb__226 with
  | { Base_dData_dPair.f_Base_dData_dPair_dPair_first = dtb__227; Base_dData_dPair.f_Base_dData_dPair_dPair_second = dtb__228 } -> (Vuna_dCompiler_dBase_dDiag.C_Vuna_dCompiler_dBase_dDiag_dCheck_OkC ({ Base_dData_dPair.f_Base_dData_dPair_dPair_first = (C_Vuna_dCompiler_dFrontend_dToml_dTomlValue_TStr (dtb__227)); Base_dData_dPair.f_Base_dData_dPair_dPair_second = dtb__228 }))
  | _ -> failwith "DT: impossible branch"
)
  | Vuna_dCompiler_dBase_dDiag.C_Vuna_dCompiler_dBase_dDiag_dCheck_ErrC (dtb__229) -> (Vuna_dCompiler_dBase_dDiag.C_Vuna_dCompiler_dBase_dDiag_dCheck_ErrC (dtb__229))
  | _ -> failwith "DT: impossible branch"
)) ((v_Vuna_dCompiler_dFrontend_dToml_dparseBasicString path) cs)) else ((fun nd_uscrut5 -> (match nd_uscrut5 with
  | Vuna_dCompiler_dBase_dDiag.C_Vuna_dCompiler_dBase_dDiag_dCheck_OkC (dtb__230) -> (match dtb__230 with
  | { Base_dData_dPair.f_Base_dData_dPair_dPair_first = dtb__231; Base_dData_dPair.f_Base_dData_dPair_dPair_second = dtb__232 } -> (Vuna_dCompiler_dBase_dDiag.C_Vuna_dCompiler_dBase_dDiag_dCheck_OkC ({ Base_dData_dPair.f_Base_dData_dPair_dPair_first = (C_Vuna_dCompiler_dFrontend_dToml_dTomlValue_TStr (dtb__231)); Base_dData_dPair.f_Base_dData_dPair_dPair_second = dtb__232 }))
  | _ -> failwith "DT: impossible branch"
)
  | Vuna_dCompiler_dBase_dDiag.C_Vuna_dCompiler_dBase_dDiag_dCheck_ErrC (dtb__233) -> (Vuna_dCompiler_dBase_dDiag.C_Vuna_dCompiler_dBase_dDiag_dCheck_ErrC (dtb__233))
  | _ -> failwith "DT: impossible branch"
)) ((v_Vuna_dCompiler_dFrontend_dToml_dparseLiteralString path) cs)))
  | _ -> failwith "DT: impossible branch"
))

# 685 "Vuna/Compiler/Frontend/Toml.vuna"
let v_Vuna_dCompiler_dFrontend_dToml_dparseMultilineValue = (fun (basic : bool) (path : string) (cs : t_Vuna_dCompiler_dFrontend_dToml_dTomlCursor) -> ((fun after -> (if basic then ((fun nd_uscrut4 -> (match nd_uscrut4 with
  | Vuna_dCompiler_dBase_dDiag.C_Vuna_dCompiler_dBase_dDiag_dCheck_OkC (dtb__234) -> (match dtb__234 with
  | { Base_dData_dPair.f_Base_dData_dPair_dPair_first = dtb__235; Base_dData_dPair.f_Base_dData_dPair_dPair_second = dtb__236 } -> (Vuna_dCompiler_dBase_dDiag.C_Vuna_dCompiler_dBase_dDiag_dCheck_OkC ({ Base_dData_dPair.f_Base_dData_dPair_dPair_first = (C_Vuna_dCompiler_dFrontend_dToml_dTomlValue_TStr (dtb__235)); Base_dData_dPair.f_Base_dData_dPair_dPair_second = dtb__236 }))
  | _ -> failwith "DT: impossible branch"
)
  | Vuna_dCompiler_dBase_dDiag.C_Vuna_dCompiler_dBase_dDiag_dCheck_ErrC (dtb__237) -> (Vuna_dCompiler_dBase_dDiag.C_Vuna_dCompiler_dBase_dDiag_dCheck_ErrC (dtb__237))
  | _ -> failwith "DT: impossible branch"
)) ((v_Vuna_dCompiler_dFrontend_dToml_dparseMultilineBasic path) after)) else ((fun nd_uscrut4 -> (match nd_uscrut4 with
  | Vuna_dCompiler_dBase_dDiag.C_Vuna_dCompiler_dBase_dDiag_dCheck_OkC (dtb__238) -> (match dtb__238 with
  | { Base_dData_dPair.f_Base_dData_dPair_dPair_first = dtb__239; Base_dData_dPair.f_Base_dData_dPair_dPair_second = dtb__240 } -> (Vuna_dCompiler_dBase_dDiag.C_Vuna_dCompiler_dBase_dDiag_dCheck_OkC ({ Base_dData_dPair.f_Base_dData_dPair_dPair_first = (C_Vuna_dCompiler_dFrontend_dToml_dTomlValue_TStr (dtb__239)); Base_dData_dPair.f_Base_dData_dPair_dPair_second = dtb__240 }))
  | _ -> failwith "DT: impossible branch"
)
  | Vuna_dCompiler_dBase_dDiag.C_Vuna_dCompiler_dBase_dDiag_dCheck_ErrC (dtb__241) -> (Vuna_dCompiler_dBase_dDiag.C_Vuna_dCompiler_dBase_dDiag_dCheck_ErrC (dtb__241))
  | _ -> failwith "DT: impossible branch"
)) ((v_Vuna_dCompiler_dFrontend_dToml_dparseMultilineLiteral path) after)))) ((v_Vuna_dCompiler_dFrontend_dToml_dadvanceChars 3) cs)))

# 813 "Vuna/Compiler/Frontend/Toml.vuna"
let v_Vuna_dCompiler_dFrontend_dToml_dmakeInteger = (fun (mc0 : int) (mc1 : bool) -> (if mc1 then (0 - mc0) else mc0))

# 804 "Vuna/Compiler/Frontend/Toml.vuna"
let v_Vuna_dCompiler_dFrontend_dToml_dfinishInteger = (fun (path : string) (startCs : t_Vuna_dCompiler_dFrontend_dToml_dTomlCursor) (cs : t_Vuna_dCompiler_dFrontend_dToml_dTomlCursor) (count : int) (acc : int) (negative : bool) -> (if (count = 0) then (((v_Vuna_dCompiler_dFrontend_dToml_dfailAt path) (startCs).f_Vuna_dCompiler_dFrontend_dToml_dTomlCursor_cursorLine) "expected digits for integer") else (match (cs).f_Vuna_dCompiler_dFrontend_dToml_dTomlCursor_cursorChars with
  | Base_dData_dList.C_Base_dData_dList_dList_Nil -> (Vuna_dCompiler_dBase_dDiag.C_Vuna_dCompiler_dBase_dDiag_dCheck_OkC ({ Base_dData_dPair.f_Base_dData_dPair_dPair_first = ((v_Vuna_dCompiler_dFrontend_dToml_dmakeInteger acc) negative); Base_dData_dPair.f_Base_dData_dPair_dPair_second = cs }))
  | Base_dData_dList.C_Base_dData_dList_dList__x58__x58_ (dtb__242, dtb__243) -> (if (dtb__242 = 46) then (((v_Vuna_dCompiler_dFrontend_dToml_dfailAt path) (startCs).f_Vuna_dCompiler_dFrontend_dToml_dTomlCursor_cursorLine) "floating point numbers are not supported") else (if (v_Vuna_dCompiler_dFrontend_dToml_disBareKeyChar dtb__242) then (((v_Vuna_dCompiler_dFrontend_dToml_dfailAt path) (startCs).f_Vuna_dCompiler_dFrontend_dToml_dTomlCursor_cursorLine) "invalid integer literal") else (Vuna_dCompiler_dBase_dDiag.C_Vuna_dCompiler_dBase_dDiag_dCheck_OkC ({ Base_dData_dPair.f_Base_dData_dPair_dPair_first = ((v_Vuna_dCompiler_dFrontend_dToml_dmakeInteger acc) negative); Base_dData_dPair.f_Base_dData_dPair_dPair_second = cs }))))
  | _ -> failwith "DT: impossible branch"
)))

# 789 "Vuna/Compiler/Frontend/Toml.vuna"
let rec v_Vuna_dCompiler_dFrontend_dToml_dparseIntegerDigits = (fun (fuel : int) (path : string) (startCs : t_Vuna_dCompiler_dFrontend_dToml_dTomlCursor) (cs : t_Vuna_dCompiler_dFrontend_dToml_dTomlCursor) (count : int) (acc : int) (negative : bool) -> (if (fuel <= 0) then (Vuna_dCompiler_dBase_dDiag.v_Vuna_dCompiler_dBase_dDiag_dicFuel "toml") else (match (cs).f_Vuna_dCompiler_dFrontend_dToml_dTomlCursor_cursorChars with
  | Base_dData_dList.C_Base_dData_dList_dList_Nil -> ((((((v_Vuna_dCompiler_dFrontend_dToml_dfinishInteger path) startCs) cs) count) acc) negative)
  | Base_dData_dList.C_Base_dData_dList_dList__x58__x58_ (dtb__244, dtb__245) -> (if (v_Vuna_dCompiler_dFrontend_dToml_disDigitChar dtb__244) then ((fun d -> (if (acc > (if 10 = 0 then failwith "division by zero" else (Vuna_dCompiler_dFrontend_dLexer.v_Vuna_dCompiler_dFrontend_dLexer_dmaxIntLiteral - d) / 10)) then (((v_Vuna_dCompiler_dFrontend_dToml_dfailAt path) (startCs).f_Vuna_dCompiler_dFrontend_dToml_dTomlCursor_cursorLine) "integer literal is out of range (max is 4611686018427387903)") else (((((((v_Vuna_dCompiler_dFrontend_dToml_dparseIntegerDigits (fuel - 1)) path) startCs) (v_Vuna_dCompiler_dFrontend_dToml_dadvanceCursor cs)) (count + 1)) ((acc * 10) + d)) negative))) (dtb__244 - 48)) else ((((((v_Vuna_dCompiler_dFrontend_dToml_dfinishInteger path) startCs) cs) count) acc) negative))
  | _ -> failwith "DT: impossible branch"
)))

# 777 "Vuna/Compiler/Frontend/Toml.vuna"
let v_Vuna_dCompiler_dFrontend_dToml_dparseInteger = (fun (path : string) (cs : t_Vuna_dCompiler_dFrontend_dToml_dTomlCursor) -> (match (cs).f_Vuna_dCompiler_dFrontend_dToml_dTomlCursor_cursorChars with
  | Base_dData_dList.C_Base_dData_dList_dList_Nil -> (((v_Vuna_dCompiler_dFrontend_dToml_dfailAt path) (cs).f_Vuna_dCompiler_dFrontend_dToml_dTomlCursor_cursorLine) "expected an integer")
  | Base_dData_dList.C_Base_dData_dList_dList__x58__x58_ (dtb__246, dtb__247) -> (if (dtb__246 = 45) then (((((((v_Vuna_dCompiler_dFrontend_dToml_dparseIntegerDigits (v_Vuna_dCompiler_dFrontend_dToml_dcursorFuel cs)) path) cs) (v_Vuna_dCompiler_dFrontend_dToml_dadvanceCursor cs)) 0) 0) true) else (if (v_Vuna_dCompiler_dFrontend_dToml_disDigitChar dtb__246) then (((((((v_Vuna_dCompiler_dFrontend_dToml_dparseIntegerDigits (v_Vuna_dCompiler_dFrontend_dToml_dcursorFuel cs)) path) cs) cs) 0) 0) false) else (((v_Vuna_dCompiler_dFrontend_dToml_dfailAt path) (cs).f_Vuna_dCompiler_dFrontend_dToml_dTomlCursor_cursorLine) "expected an integer")))
  | _ -> failwith "DT: impossible branch"
))

# 817 "Vuna/Compiler/Frontend/Toml.vuna"
let v_Vuna_dCompiler_dFrontend_dToml_dparseIntValue = (fun (path : string) (cs : t_Vuna_dCompiler_dFrontend_dToml_dTomlCursor) -> ((fun nd_uscrut2 -> (match nd_uscrut2 with
  | Vuna_dCompiler_dBase_dDiag.C_Vuna_dCompiler_dBase_dDiag_dCheck_OkC (dtb__248) -> (match dtb__248 with
  | { Base_dData_dPair.f_Base_dData_dPair_dPair_first = dtb__249; Base_dData_dPair.f_Base_dData_dPair_dPair_second = dtb__250 } -> (Vuna_dCompiler_dBase_dDiag.C_Vuna_dCompiler_dBase_dDiag_dCheck_OkC ({ Base_dData_dPair.f_Base_dData_dPair_dPair_first = (C_Vuna_dCompiler_dFrontend_dToml_dTomlValue_TInt (dtb__249)); Base_dData_dPair.f_Base_dData_dPair_dPair_second = dtb__250 }))
  | _ -> failwith "DT: impossible branch"
)
  | Vuna_dCompiler_dBase_dDiag.C_Vuna_dCompiler_dBase_dDiag_dCheck_ErrC (dtb__251) -> (Vuna_dCompiler_dBase_dDiag.C_Vuna_dCompiler_dBase_dDiag_dCheck_ErrC (dtb__251))
  | _ -> failwith "DT: impossible branch"
)) ((v_Vuna_dCompiler_dFrontend_dToml_dparseInteger path) cs)))

# 824 "Vuna/Compiler/Frontend/Toml.vuna"
let rec v_Vuna_dCompiler_dFrontend_dToml_dmatchChars = (fun (mc0 : int Base_dData_dList.t_Base_dData_dList_dList) (mc1 : t_Vuna_dCompiler_dFrontend_dToml_dTomlCursor) -> (match mc0 with
  | Base_dData_dList.C_Base_dData_dList_dList__x58__x58_ (dtb__252, dtb__253) -> (match mc1 with
  | { f_Vuna_dCompiler_dFrontend_dToml_dTomlCursor_cursorChars = dtb__254; f_Vuna_dCompiler_dFrontend_dToml_dTomlCursor_cursorLine = dtb__255; f_Vuna_dCompiler_dFrontend_dToml_dTomlCursor_cursorCol = dtb__256 } -> (match dtb__254 with
  | Base_dData_dList.C_Base_dData_dList_dList__x58__x58_ (dtb__257, dtb__258) -> (if (dtb__257 = dtb__252) then ((v_Vuna_dCompiler_dFrontend_dToml_dmatchChars dtb__253) { f_Vuna_dCompiler_dFrontend_dToml_dTomlCursor_cursorChars = dtb__258; f_Vuna_dCompiler_dFrontend_dToml_dTomlCursor_cursorLine = dtb__255; f_Vuna_dCompiler_dFrontend_dToml_dTomlCursor_cursorCol = (dtb__256 + 1) }) else Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Nothing)
  | Base_dData_dList.C_Base_dData_dList_dList_Nil -> Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Nothing
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
)
  | Base_dData_dList.C_Base_dData_dList_dList_Nil -> (Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Just (mc1))
  | _ -> failwith "DT: impossible branch"
))

# 830 "Vuna/Compiler/Frontend/Toml.vuna"
let v_Vuna_dCompiler_dFrontend_dToml_dmatchWord = (fun (word : string) (cs : t_Vuna_dCompiler_dFrontend_dToml_dTomlCursor) -> (match ((v_Vuna_dCompiler_dFrontend_dToml_dmatchChars (Base_dData_dList.dtp_unpack word)) cs) with
  | Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Nothing -> Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Nothing
  | Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Just (dtb__259) -> (match (dtb__259).f_Vuna_dCompiler_dFrontend_dToml_dTomlCursor_cursorChars with
  | Base_dData_dList.C_Base_dData_dList_dList_Nil -> (Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Just (dtb__259))
  | Base_dData_dList.C_Base_dData_dList_dList__x58__x58_ (dtb__260, dtb__261) -> (if (v_Vuna_dCompiler_dFrontend_dToml_disBareKeyChar dtb__260) then Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Nothing else (Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Just (dtb__259)))
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
))

# 641 "Vuna/Compiler/Frontend/Toml.vuna"
let rec v_Vuna_dCompiler_dFrontend_dToml_dparseValue = (fun (fuel : int) (path : string) (cs : t_Vuna_dCompiler_dFrontend_dToml_dTomlCursor) -> (if (fuel <= 0) then (Vuna_dCompiler_dBase_dDiag.v_Vuna_dCompiler_dBase_dDiag_dicFuel "toml") else (match (cs).f_Vuna_dCompiler_dFrontend_dToml_dTomlCursor_cursorChars with
  | Base_dData_dList.C_Base_dData_dList_dList_Nil -> (((v_Vuna_dCompiler_dFrontend_dToml_dfailAt path) (cs).f_Vuna_dCompiler_dFrontend_dToml_dTomlCursor_cursorLine) "expected a value")
  | Base_dData_dList.C_Base_dData_dList_dList__x58__x58_ (dtb__262, dtb__263) -> (if (dtb__262 = 34) then (if ((v_Vuna_dCompiler_dFrontend_dToml_dstartsWithTripleOf 34) (cs).f_Vuna_dCompiler_dFrontend_dToml_dTomlCursor_cursorChars) then (((v_Vuna_dCompiler_dFrontend_dToml_dparseMultilineValue true) path) cs) else ((v_Vuna_dCompiler_dFrontend_dToml_dparseSingleStringValue path) cs)) else (if (dtb__262 = 39) then (if ((v_Vuna_dCompiler_dFrontend_dToml_dstartsWithTripleOf 39) (cs).f_Vuna_dCompiler_dFrontend_dToml_dTomlCursor_cursorChars) then (((v_Vuna_dCompiler_dFrontend_dToml_dparseMultilineValue false) path) cs) else ((v_Vuna_dCompiler_dFrontend_dToml_dparseSingleStringValue path) cs)) else (if (dtb__262 = 91) then (((v_Vuna_dCompiler_dFrontend_dToml_dparseArrayValue (fuel - 1)) path) cs) else (if (dtb__262 = 123) then (((v_Vuna_dCompiler_dFrontend_dToml_dparseInlineTable (fuel - 1)) path) cs) else (if (dtb__262 = 45) then ((v_Vuna_dCompiler_dFrontend_dToml_dparseIntValue path) cs) else (if (v_Vuna_dCompiler_dFrontend_dToml_disDigitChar dtb__262) then ((v_Vuna_dCompiler_dFrontend_dToml_dparseIntValue path) cs) else (match ((v_Vuna_dCompiler_dFrontend_dToml_dmatchWord "true") cs) with
  | Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Just (dtb__264) -> (Vuna_dCompiler_dBase_dDiag.C_Vuna_dCompiler_dBase_dDiag_dCheck_OkC ({ Base_dData_dPair.f_Base_dData_dPair_dPair_first = (C_Vuna_dCompiler_dFrontend_dToml_dTomlValue_TBool (true)); Base_dData_dPair.f_Base_dData_dPair_dPair_second = dtb__264 }))
  | Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Nothing -> (match ((v_Vuna_dCompiler_dFrontend_dToml_dmatchWord "false") cs) with
  | Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Just (dtb__265) -> (Vuna_dCompiler_dBase_dDiag.C_Vuna_dCompiler_dBase_dDiag_dCheck_OkC ({ Base_dData_dPair.f_Base_dData_dPair_dPair_first = (C_Vuna_dCompiler_dFrontend_dToml_dTomlValue_TBool (false)); Base_dData_dPair.f_Base_dData_dPair_dPair_second = dtb__265 }))
  | Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Nothing -> (((v_Vuna_dCompiler_dFrontend_dToml_dfailAt path) (cs).f_Vuna_dCompiler_dFrontend_dToml_dTomlCursor_cursorLine) "expected a value")
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
)))))))
  | _ -> failwith "DT: impossible branch"
)))
# 699 "Vuna/Compiler/Frontend/Toml.vuna"
and v_Vuna_dCompiler_dFrontend_dToml_dparseArrayValue = (fun (fuel : int) (path : string) (cs : t_Vuna_dCompiler_dFrontend_dToml_dTomlCursor) -> (if (fuel <= 0) then (Vuna_dCompiler_dBase_dDiag.v_Vuna_dCompiler_dBase_dDiag_dicFuel "toml") else (match (cs).f_Vuna_dCompiler_dFrontend_dToml_dTomlCursor_cursorChars with
  | Base_dData_dList.C_Base_dData_dList_dList_Nil -> (((v_Vuna_dCompiler_dFrontend_dToml_dfailAt path) (cs).f_Vuna_dCompiler_dFrontend_dToml_dTomlCursor_cursorLine) "unterminated array")
  | Base_dData_dList.C_Base_dData_dList_dList__x58__x58_ (dtb__266, dtb__267) -> ((((v_Vuna_dCompiler_dFrontend_dToml_dparseArrayItems (v_Vuna_dCompiler_dFrontend_dToml_dcursorFuel (v_Vuna_dCompiler_dFrontend_dToml_dadvanceCursor cs))) path) (v_Vuna_dCompiler_dFrontend_dToml_dadvanceCursor cs)) Base_dData_dList.C_Base_dData_dList_dList_Nil)
  | _ -> failwith "DT: impossible branch"
)))
# 708 "Vuna/Compiler/Frontend/Toml.vuna"
and v_Vuna_dCompiler_dFrontend_dToml_dparseArrayItems = (fun (fuel : int) (path : string) (cs : t_Vuna_dCompiler_dFrontend_dToml_dTomlCursor) (acc : t_Vuna_dCompiler_dFrontend_dToml_dTomlValue Base_dData_dList.t_Base_dData_dList_dList) -> (if (fuel <= 0) then (Vuna_dCompiler_dBase_dDiag.v_Vuna_dCompiler_dBase_dDiag_dicFuel "toml") else (match (v_Vuna_dCompiler_dFrontend_dToml_dskipGap cs) with
  | { f_Vuna_dCompiler_dFrontend_dToml_dTomlCursor_cursorChars = dtb__268; f_Vuna_dCompiler_dFrontend_dToml_dTomlCursor_cursorLine = dtb__269; f_Vuna_dCompiler_dFrontend_dToml_dTomlCursor_cursorCol = dtb__270 } -> (match dtb__268 with
  | Base_dData_dList.C_Base_dData_dList_dList_Nil -> (((v_Vuna_dCompiler_dFrontend_dToml_dfailAt path) dtb__269) "unterminated array")
  | Base_dData_dList.C_Base_dData_dList_dList__x58__x58_ (dtb__271, dtb__272) -> (if (dtb__271 = 93) then (Vuna_dCompiler_dBase_dDiag.C_Vuna_dCompiler_dBase_dDiag_dCheck_OkC ({ Base_dData_dPair.f_Base_dData_dPair_dPair_first = (C_Vuna_dCompiler_dFrontend_dToml_dTomlValue_TArray ((Base_dData_dList.v_Base_dData_dList_dreverse acc))); Base_dData_dPair.f_Base_dData_dPair_dPair_second = (v_Vuna_dCompiler_dFrontend_dToml_dadvanceCursor { f_Vuna_dCompiler_dFrontend_dToml_dTomlCursor_cursorChars = dtb__268; f_Vuna_dCompiler_dFrontend_dToml_dTomlCursor_cursorLine = dtb__269; f_Vuna_dCompiler_dFrontend_dToml_dTomlCursor_cursorCol = dtb__270 }) })) else ((fun nd_uscrut10 -> (match nd_uscrut10 with
  | Vuna_dCompiler_dBase_dDiag.C_Vuna_dCompiler_dBase_dDiag_dCheck_OkC (dtb__273) -> (match dtb__273 with
  | { Base_dData_dPair.f_Base_dData_dPair_dPair_first = dtb__274; Base_dData_dPair.f_Base_dData_dPair_dPair_second = dtb__275 } -> (match (v_Vuna_dCompiler_dFrontend_dToml_dskipGap dtb__275) with
  | { f_Vuna_dCompiler_dFrontend_dToml_dTomlCursor_cursorChars = dtb__276; f_Vuna_dCompiler_dFrontend_dToml_dTomlCursor_cursorLine = dtb__277; f_Vuna_dCompiler_dFrontend_dToml_dTomlCursor_cursorCol = dtb__278 } -> (match dtb__276 with
  | Base_dData_dList.C_Base_dData_dList_dList_Nil -> (((v_Vuna_dCompiler_dFrontend_dToml_dfailAt path) dtb__277) "unterminated array")
  | Base_dData_dList.C_Base_dData_dList_dList__x58__x58_ (dtb__279, dtb__280) -> (if (dtb__279 = 44) then ((((v_Vuna_dCompiler_dFrontend_dToml_dparseArrayItems (fuel - 1)) path) (v_Vuna_dCompiler_dFrontend_dToml_dadvanceCursor { f_Vuna_dCompiler_dFrontend_dToml_dTomlCursor_cursorChars = dtb__276; f_Vuna_dCompiler_dFrontend_dToml_dTomlCursor_cursorLine = dtb__277; f_Vuna_dCompiler_dFrontend_dToml_dTomlCursor_cursorCol = dtb__278 })) (Base_dData_dList.C_Base_dData_dList_dList__x58__x58_ (dtb__274, acc))) else (if (dtb__279 = 93) then (Vuna_dCompiler_dBase_dDiag.C_Vuna_dCompiler_dBase_dDiag_dCheck_OkC ({ Base_dData_dPair.f_Base_dData_dPair_dPair_first = (C_Vuna_dCompiler_dFrontend_dToml_dTomlValue_TArray ((Base_dData_dList.v_Base_dData_dList_dreverse (Base_dData_dList.C_Base_dData_dList_dList__x58__x58_ (dtb__274, acc))))); Base_dData_dPair.f_Base_dData_dPair_dPair_second = (v_Vuna_dCompiler_dFrontend_dToml_dadvanceCursor { f_Vuna_dCompiler_dFrontend_dToml_dTomlCursor_cursorChars = dtb__276; f_Vuna_dCompiler_dFrontend_dToml_dTomlCursor_cursorLine = dtb__277; f_Vuna_dCompiler_dFrontend_dToml_dTomlCursor_cursorCol = dtb__278 }) })) else (((v_Vuna_dCompiler_dFrontend_dToml_dfailAt path) dtb__277) "expected ',' or ']' in array")))
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
)
  | Vuna_dCompiler_dBase_dDiag.C_Vuna_dCompiler_dBase_dDiag_dCheck_ErrC (dtb__281) -> (Vuna_dCompiler_dBase_dDiag.C_Vuna_dCompiler_dBase_dDiag_dCheck_ErrC (dtb__281))
  | _ -> failwith "DT: impossible branch"
)) (((v_Vuna_dCompiler_dFrontend_dToml_dparseValue (fuel - 1)) path) { f_Vuna_dCompiler_dFrontend_dToml_dTomlCursor_cursorChars = dtb__268; f_Vuna_dCompiler_dFrontend_dToml_dTomlCursor_cursorLine = dtb__269; f_Vuna_dCompiler_dFrontend_dToml_dTomlCursor_cursorCol = dtb__270 })))
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
)))
# 731 "Vuna/Compiler/Frontend/Toml.vuna"
and v_Vuna_dCompiler_dFrontend_dToml_dparseInlineTable = (fun (fuel : int) (path : string) (cs : t_Vuna_dCompiler_dFrontend_dToml_dTomlCursor) -> (if (fuel <= 0) then (Vuna_dCompiler_dBase_dDiag.v_Vuna_dCompiler_dBase_dDiag_dicFuel "toml") else (match (cs).f_Vuna_dCompiler_dFrontend_dToml_dTomlCursor_cursorChars with
  | Base_dData_dList.C_Base_dData_dList_dList_Nil -> (((v_Vuna_dCompiler_dFrontend_dToml_dfailAt path) (cs).f_Vuna_dCompiler_dFrontend_dToml_dTomlCursor_cursorLine) "unterminated inline table")
  | Base_dData_dList.C_Base_dData_dList_dList__x58__x58_ (dtb__282, dtb__283) -> ((((v_Vuna_dCompiler_dFrontend_dToml_dparseInlineFields (v_Vuna_dCompiler_dFrontend_dToml_dcursorFuel (v_Vuna_dCompiler_dFrontend_dToml_dadvanceCursor cs))) path) (v_Vuna_dCompiler_dFrontend_dToml_dadvanceCursor cs)) Base_dData_dList.C_Base_dData_dList_dList_Nil)
  | _ -> failwith "DT: impossible branch"
)))
# 740 "Vuna/Compiler/Frontend/Toml.vuna"
and v_Vuna_dCompiler_dFrontend_dToml_dparseInlineFields = (fun (fuel : int) (path : string) (cs : t_Vuna_dCompiler_dFrontend_dToml_dTomlCursor) (fields : (string, t_Vuna_dCompiler_dFrontend_dToml_dTomlNode) Base_dData_dPair.t_Base_dData_dPair_dPair Base_dData_dList.t_Base_dData_dList_dList) -> (if (fuel <= 0) then (Vuna_dCompiler_dBase_dDiag.v_Vuna_dCompiler_dBase_dDiag_dicFuel "toml") else (match (v_Vuna_dCompiler_dFrontend_dToml_dskipBlank cs) with
  | { f_Vuna_dCompiler_dFrontend_dToml_dTomlCursor_cursorChars = dtb__284; f_Vuna_dCompiler_dFrontend_dToml_dTomlCursor_cursorLine = dtb__285; f_Vuna_dCompiler_dFrontend_dToml_dTomlCursor_cursorCol = dtb__286 } -> (match dtb__284 with
  | Base_dData_dList.C_Base_dData_dList_dList_Nil -> (((v_Vuna_dCompiler_dFrontend_dToml_dfailAt path) dtb__285) "unterminated inline table")
  | Base_dData_dList.C_Base_dData_dList_dList__x58__x58_ (dtb__287, dtb__288) -> (if (dtb__287 = 125) then (Vuna_dCompiler_dBase_dDiag.C_Vuna_dCompiler_dBase_dDiag_dCheck_OkC ({ Base_dData_dPair.f_Base_dData_dPair_dPair_first = (C_Vuna_dCompiler_dFrontend_dToml_dTomlValue_TTable (((v_Vuna_dCompiler_dFrontend_dToml_drootValue fuel) fields))); Base_dData_dPair.f_Base_dData_dPair_dPair_second = (v_Vuna_dCompiler_dFrontend_dToml_dadvanceCursor { f_Vuna_dCompiler_dFrontend_dToml_dTomlCursor_cursorChars = dtb__284; f_Vuna_dCompiler_dFrontend_dToml_dTomlCursor_cursorLine = dtb__285; f_Vuna_dCompiler_dFrontend_dToml_dTomlCursor_cursorCol = dtb__286 }) })) else ((fun nd_uscrut10 -> (match nd_uscrut10 with
  | Vuna_dCompiler_dBase_dDiag.C_Vuna_dCompiler_dBase_dDiag_dCheck_OkC (dtb__289) -> (match dtb__289 with
  | { Base_dData_dPair.f_Base_dData_dPair_dPair_first = dtb__290; Base_dData_dPair.f_Base_dData_dPair_dPair_second = dtb__291 } -> (match (v_Vuna_dCompiler_dFrontend_dToml_dskipBlank dtb__291) with
  | { f_Vuna_dCompiler_dFrontend_dToml_dTomlCursor_cursorChars = dtb__292; f_Vuna_dCompiler_dFrontend_dToml_dTomlCursor_cursorLine = dtb__293; f_Vuna_dCompiler_dFrontend_dToml_dTomlCursor_cursorCol = dtb__294 } -> (match dtb__292 with
  | Base_dData_dList.C_Base_dData_dList_dList_Nil -> (((v_Vuna_dCompiler_dFrontend_dToml_dfailAt path) dtb__293) "expected '=' in inline table")
  | Base_dData_dList.C_Base_dData_dList_dList__x58__x58_ (dtb__295, dtb__296) -> (if (dtb__295 = 61) then ((fun nd_uscrut23 -> (match nd_uscrut23 with
  | Vuna_dCompiler_dBase_dDiag.C_Vuna_dCompiler_dBase_dDiag_dCheck_OkC (dtb__297) -> (match dtb__297 with
  | { Base_dData_dPair.f_Base_dData_dPair_dPair_first = dtb__298; Base_dData_dPair.f_Base_dData_dPair_dPair_second = dtb__299 } -> (match (((((((v_Vuna_dCompiler_dFrontend_dToml_dinsertValue (v_Vuna_dCompiler_dFrontend_dToml_dpathFuel dtb__290)) path) dtb__293) dtb__290) (v_Vuna_dCompiler_dFrontend_dToml_dsectionOfPath dtb__290)) dtb__298) fields) with
  | Vuna_dCompiler_dBase_dDiag.C_Vuna_dCompiler_dBase_dDiag_dCheck_ErrC (dtb__300) -> (Vuna_dCompiler_dBase_dDiag.C_Vuna_dCompiler_dBase_dDiag_dCheck_ErrC (dtb__300))
  | Vuna_dCompiler_dBase_dDiag.C_Vuna_dCompiler_dBase_dDiag_dCheck_OkC (dtb__301) -> (match (v_Vuna_dCompiler_dFrontend_dToml_dskipBlank dtb__299) with
  | { f_Vuna_dCompiler_dFrontend_dToml_dTomlCursor_cursorChars = dtb__302; f_Vuna_dCompiler_dFrontend_dToml_dTomlCursor_cursorLine = dtb__303; f_Vuna_dCompiler_dFrontend_dToml_dTomlCursor_cursorCol = dtb__304 } -> (match dtb__302 with
  | Base_dData_dList.C_Base_dData_dList_dList_Nil -> (((v_Vuna_dCompiler_dFrontend_dToml_dfailAt path) dtb__303) "unterminated inline table")
  | Base_dData_dList.C_Base_dData_dList_dList__x58__x58_ (dtb__305, dtb__306) -> (if (dtb__305 = 44) then ((((v_Vuna_dCompiler_dFrontend_dToml_dparseInlineFields (fuel - 1)) path) { f_Vuna_dCompiler_dFrontend_dToml_dTomlCursor_cursorChars = dtb__306; f_Vuna_dCompiler_dFrontend_dToml_dTomlCursor_cursorLine = dtb__303; f_Vuna_dCompiler_dFrontend_dToml_dTomlCursor_cursorCol = (dtb__304 + 1) }) dtb__301) else (if (dtb__305 = 125) then (Vuna_dCompiler_dBase_dDiag.C_Vuna_dCompiler_dBase_dDiag_dCheck_OkC ({ Base_dData_dPair.f_Base_dData_dPair_dPair_first = (C_Vuna_dCompiler_dFrontend_dToml_dTomlValue_TTable (((v_Vuna_dCompiler_dFrontend_dToml_drootValue fuel) dtb__301))); Base_dData_dPair.f_Base_dData_dPair_dPair_second = (v_Vuna_dCompiler_dFrontend_dToml_dadvanceCursor { f_Vuna_dCompiler_dFrontend_dToml_dTomlCursor_cursorChars = dtb__302; f_Vuna_dCompiler_dFrontend_dToml_dTomlCursor_cursorLine = dtb__303; f_Vuna_dCompiler_dFrontend_dToml_dTomlCursor_cursorCol = dtb__304 }) })) else (((v_Vuna_dCompiler_dFrontend_dToml_dfailAt path) dtb__303) "expected ',' or '}' in inline table")))
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
)
  | Vuna_dCompiler_dBase_dDiag.C_Vuna_dCompiler_dBase_dDiag_dCheck_ErrC (dtb__307) -> (Vuna_dCompiler_dBase_dDiag.C_Vuna_dCompiler_dBase_dDiag_dCheck_ErrC (dtb__307))
  | _ -> failwith "DT: impossible branch"
)) (((v_Vuna_dCompiler_dFrontend_dToml_dparseValue (fuel - 1)) path) (v_Vuna_dCompiler_dFrontend_dToml_dskipBlank { f_Vuna_dCompiler_dFrontend_dToml_dTomlCursor_cursorChars = dtb__296; f_Vuna_dCompiler_dFrontend_dToml_dTomlCursor_cursorLine = dtb__293; f_Vuna_dCompiler_dFrontend_dToml_dTomlCursor_cursorCol = (dtb__294 + 1) }))) else (((v_Vuna_dCompiler_dFrontend_dToml_dfailAt path) dtb__293) "expected '=' in inline table"))
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
)
  | Vuna_dCompiler_dBase_dDiag.C_Vuna_dCompiler_dBase_dDiag_dCheck_ErrC (dtb__308) -> (Vuna_dCompiler_dBase_dDiag.C_Vuna_dCompiler_dBase_dDiag_dCheck_ErrC (dtb__308))
  | _ -> failwith "DT: impossible branch"
)) ((v_Vuna_dCompiler_dFrontend_dToml_dparseKeyPath path) { f_Vuna_dCompiler_dFrontend_dToml_dTomlCursor_cursorChars = dtb__284; f_Vuna_dCompiler_dFrontend_dToml_dTomlCursor_cursorLine = dtb__285; f_Vuna_dCompiler_dFrontend_dToml_dTomlCursor_cursorCol = dtb__286 })))
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
)))

# 852 "Vuna/Compiler/Frontend/Toml.vuna"
let v_Vuna_dCompiler_dFrontend_dToml_dexpectEolAfterComment = (fun (path : string) (cs : t_Vuna_dCompiler_dFrontend_dToml_dTomlCursor) -> (match (v_Vuna_dCompiler_dFrontend_dToml_dskipComment cs) with
  | { f_Vuna_dCompiler_dFrontend_dToml_dTomlCursor_cursorChars = dtb__309; f_Vuna_dCompiler_dFrontend_dToml_dTomlCursor_cursorLine = dtb__310; f_Vuna_dCompiler_dFrontend_dToml_dTomlCursor_cursorCol = dtb__311 } -> (match dtb__309 with
  | Base_dData_dList.C_Base_dData_dList_dList_Nil -> (Vuna_dCompiler_dBase_dDiag.C_Vuna_dCompiler_dBase_dDiag_dCheck_OkC ({ f_Vuna_dCompiler_dFrontend_dToml_dTomlCursor_cursorChars = dtb__309; f_Vuna_dCompiler_dFrontend_dToml_dTomlCursor_cursorLine = dtb__310; f_Vuna_dCompiler_dFrontend_dToml_dTomlCursor_cursorCol = dtb__311 }))
  | Base_dData_dList.C_Base_dData_dList_dList__x58__x58_ (dtb__312, dtb__313) -> (if (dtb__312 = 10) then (Vuna_dCompiler_dBase_dDiag.C_Vuna_dCompiler_dBase_dDiag_dCheck_OkC ({ f_Vuna_dCompiler_dFrontend_dToml_dTomlCursor_cursorChars = dtb__313; f_Vuna_dCompiler_dFrontend_dToml_dTomlCursor_cursorLine = (dtb__310 + 1); f_Vuna_dCompiler_dFrontend_dToml_dTomlCursor_cursorCol = 1 })) else (((v_Vuna_dCompiler_dFrontend_dToml_dfailAt path) dtb__310) "unexpected character after comment"))
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
))

# 840 "Vuna/Compiler/Frontend/Toml.vuna"
let v_Vuna_dCompiler_dFrontend_dToml_dexpectEol = (fun (path : string) (cs : t_Vuna_dCompiler_dFrontend_dToml_dTomlCursor) -> (match (v_Vuna_dCompiler_dFrontend_dToml_dskipBlank cs) with
  | { f_Vuna_dCompiler_dFrontend_dToml_dTomlCursor_cursorChars = dtb__314; f_Vuna_dCompiler_dFrontend_dToml_dTomlCursor_cursorLine = dtb__315; f_Vuna_dCompiler_dFrontend_dToml_dTomlCursor_cursorCol = dtb__316 } -> (match dtb__314 with
  | Base_dData_dList.C_Base_dData_dList_dList_Nil -> (Vuna_dCompiler_dBase_dDiag.C_Vuna_dCompiler_dBase_dDiag_dCheck_OkC ({ f_Vuna_dCompiler_dFrontend_dToml_dTomlCursor_cursorChars = dtb__314; f_Vuna_dCompiler_dFrontend_dToml_dTomlCursor_cursorLine = dtb__315; f_Vuna_dCompiler_dFrontend_dToml_dTomlCursor_cursorCol = dtb__316 }))
  | Base_dData_dList.C_Base_dData_dList_dList__x58__x58_ (dtb__317, dtb__318) -> (if (dtb__317 = 10) then (Vuna_dCompiler_dBase_dDiag.C_Vuna_dCompiler_dBase_dDiag_dCheck_OkC ({ f_Vuna_dCompiler_dFrontend_dToml_dTomlCursor_cursorChars = dtb__318; f_Vuna_dCompiler_dFrontend_dToml_dTomlCursor_cursorLine = (dtb__315 + 1); f_Vuna_dCompiler_dFrontend_dToml_dTomlCursor_cursorCol = 1 })) else (if (dtb__317 = 35) then ((v_Vuna_dCompiler_dFrontend_dToml_dexpectEolAfterComment path) { f_Vuna_dCompiler_dFrontend_dToml_dTomlCursor_cursorChars = dtb__314; f_Vuna_dCompiler_dFrontend_dToml_dTomlCursor_cursorLine = dtb__315; f_Vuna_dCompiler_dFrontend_dToml_dTomlCursor_cursorCol = dtb__316 }) else (((v_Vuna_dCompiler_dFrontend_dToml_dfailAt path) (cs).f_Vuna_dCompiler_dFrontend_dToml_dTomlCursor_cursorLine) "unexpected character at end of line")))
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
))

# 865 "Vuna/Compiler/Frontend/Toml.vuna"
let rec v_Vuna_dCompiler_dFrontend_dToml_dparseSectionLine = (fun (fuel : int) (path : string) (cs : t_Vuna_dCompiler_dFrontend_dToml_dTomlCursor) (currentPath : string Base_dData_dList.t_Base_dData_dList_dList) (fields : (string, t_Vuna_dCompiler_dFrontend_dToml_dTomlNode) Base_dData_dPair.t_Base_dData_dPair_dPair Base_dData_dList.t_Base_dData_dList_dList) -> (if (fuel <= 0) then (Vuna_dCompiler_dBase_dDiag.v_Vuna_dCompiler_dBase_dDiag_dicFuel "toml") else ((fun nd_uscrut5 -> (match nd_uscrut5 with
  | Vuna_dCompiler_dBase_dDiag.C_Vuna_dCompiler_dBase_dDiag_dCheck_OkC (dtb__319) -> (match dtb__319 with
  | { Base_dData_dPair.f_Base_dData_dPair_dPair_first = dtb__320; Base_dData_dPair.f_Base_dData_dPair_dPair_second = dtb__321 } -> (match (v_Vuna_dCompiler_dFrontend_dToml_dskipBlank dtb__321) with
  | { f_Vuna_dCompiler_dFrontend_dToml_dTomlCursor_cursorChars = dtb__322; f_Vuna_dCompiler_dFrontend_dToml_dTomlCursor_cursorLine = dtb__323; f_Vuna_dCompiler_dFrontend_dToml_dTomlCursor_cursorCol = dtb__324 } -> (match dtb__322 with
  | Base_dData_dList.C_Base_dData_dList_dList_Nil -> (((v_Vuna_dCompiler_dFrontend_dToml_dfailAt path) dtb__323) "unterminated section header")
  | Base_dData_dList.C_Base_dData_dList_dList__x58__x58_ (dtb__325, dtb__326) -> (if (dtb__325 = 93) then (((((((v_Vuna_dCompiler_dFrontend_dToml_dafterSingleBracket (fuel - 1)) path) dtb__323) dtb__324) dtb__326) dtb__320) fields) else (((v_Vuna_dCompiler_dFrontend_dToml_dfailAt path) dtb__323) "expected '.' or ']' in section header"))
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
)
  | Vuna_dCompiler_dBase_dDiag.C_Vuna_dCompiler_dBase_dDiag_dCheck_ErrC (dtb__327) -> (Vuna_dCompiler_dBase_dDiag.C_Vuna_dCompiler_dBase_dDiag_dCheck_ErrC (dtb__327))
  | _ -> failwith "DT: impossible branch"
)) ((v_Vuna_dCompiler_dFrontend_dToml_dparseKeyPath path) (v_Vuna_dCompiler_dFrontend_dToml_dadvanceCursor cs)))))
# 879 "Vuna/Compiler/Frontend/Toml.vuna"
and v_Vuna_dCompiler_dFrontend_dToml_dafterSingleBracket = (fun (fuel : int) (path : string) (line : int) (col : int) (rest : int Base_dData_dList.t_Base_dData_dList_dList) (newSection : string Base_dData_dList.t_Base_dData_dList_dList) (fields : (string, t_Vuna_dCompiler_dFrontend_dToml_dTomlNode) Base_dData_dPair.t_Base_dData_dPair_dPair Base_dData_dList.t_Base_dData_dList_dList) -> (if (fuel <= 0) then (Vuna_dCompiler_dBase_dDiag.v_Vuna_dCompiler_dBase_dDiag_dicFuel "toml") else (match ((v_Vuna_dCompiler_dFrontend_dToml_dexpectEol path) { f_Vuna_dCompiler_dFrontend_dToml_dTomlCursor_cursorChars = rest; f_Vuna_dCompiler_dFrontend_dToml_dTomlCursor_cursorLine = line; f_Vuna_dCompiler_dFrontend_dToml_dTomlCursor_cursorCol = (col + 1) }) with
  | Vuna_dCompiler_dBase_dDiag.C_Vuna_dCompiler_dBase_dDiag_dCheck_ErrC (dtb__328) -> (Vuna_dCompiler_dBase_dDiag.C_Vuna_dCompiler_dBase_dDiag_dCheck_ErrC (dtb__328))
  | Vuna_dCompiler_dBase_dDiag.C_Vuna_dCompiler_dBase_dDiag_dCheck_OkC (dtb__329) -> (match ((((((v_Vuna_dCompiler_dFrontend_dToml_densureTable (v_Vuna_dCompiler_dFrontend_dToml_dpathFuel newSection)) path) line) newSection) C_Vuna_dCompiler_dFrontend_dToml_dTableKind_KindExplicit) fields) with
  | Vuna_dCompiler_dBase_dDiag.C_Vuna_dCompiler_dBase_dDiag_dCheck_ErrC (dtb__330) -> (Vuna_dCompiler_dBase_dDiag.C_Vuna_dCompiler_dBase_dDiag_dCheck_ErrC (dtb__330))
  | Vuna_dCompiler_dBase_dDiag.C_Vuna_dCompiler_dBase_dDiag_dCheck_OkC (dtb__331) -> (((((v_Vuna_dCompiler_dFrontend_dToml_dparseTomlLoop (fuel - 1)) path) dtb__329) newSection) dtb__331)
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
)))
# 892 "Vuna/Compiler/Frontend/Toml.vuna"
and v_Vuna_dCompiler_dFrontend_dToml_dparseTableArrayLine = (fun (fuel : int) (path : string) (cs : t_Vuna_dCompiler_dFrontend_dToml_dTomlCursor) (currentPath : string Base_dData_dList.t_Base_dData_dList_dList) (fields : (string, t_Vuna_dCompiler_dFrontend_dToml_dTomlNode) Base_dData_dPair.t_Base_dData_dPair_dPair Base_dData_dList.t_Base_dData_dList_dList) -> (if (fuel <= 0) then (Vuna_dCompiler_dBase_dDiag.v_Vuna_dCompiler_dBase_dDiag_dicFuel "toml") else ((fun nd_uscrut5 -> (match nd_uscrut5 with
  | Vuna_dCompiler_dBase_dDiag.C_Vuna_dCompiler_dBase_dDiag_dCheck_OkC (dtb__332) -> (match dtb__332 with
  | { Base_dData_dPair.f_Base_dData_dPair_dPair_first = dtb__333; Base_dData_dPair.f_Base_dData_dPair_dPair_second = dtb__334 } -> (match (v_Vuna_dCompiler_dFrontend_dToml_dskipBlank dtb__334) with
  | { f_Vuna_dCompiler_dFrontend_dToml_dTomlCursor_cursorChars = dtb__335; f_Vuna_dCompiler_dFrontend_dToml_dTomlCursor_cursorLine = dtb__336; f_Vuna_dCompiler_dFrontend_dToml_dTomlCursor_cursorCol = dtb__337 } -> (match dtb__335 with
  | Base_dData_dList.C_Base_dData_dList_dList_Nil -> (((v_Vuna_dCompiler_dFrontend_dToml_dfailAt path) dtb__336) "unterminated table array header")
  | Base_dData_dList.C_Base_dData_dList_dList__x58__x58_ (dtb__338, dtb__339) -> (if (dtb__338 = 93) then (((((((v_Vuna_dCompiler_dFrontend_dToml_dafterDoubleBracket (fuel - 1)) path) dtb__336) dtb__337) dtb__339) dtb__333) fields) else (((v_Vuna_dCompiler_dFrontend_dToml_dfailAt path) dtb__336) "expected ']]' in table array header"))
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
)
  | Vuna_dCompiler_dBase_dDiag.C_Vuna_dCompiler_dBase_dDiag_dCheck_ErrC (dtb__340) -> (Vuna_dCompiler_dBase_dDiag.C_Vuna_dCompiler_dBase_dDiag_dCheck_ErrC (dtb__340))
  | _ -> failwith "DT: impossible branch"
)) ((v_Vuna_dCompiler_dFrontend_dToml_dparseKeyPath path) (v_Vuna_dCompiler_dFrontend_dToml_dadvanceCursor (v_Vuna_dCompiler_dFrontend_dToml_dadvanceCursor cs))))))
# 906 "Vuna/Compiler/Frontend/Toml.vuna"
and v_Vuna_dCompiler_dFrontend_dToml_dafterDoubleBracket = (fun (fuel : int) (path : string) (line : int) (col : int) (rest : int Base_dData_dList.t_Base_dData_dList_dList) (newSection : string Base_dData_dList.t_Base_dData_dList_dList) (fields : (string, t_Vuna_dCompiler_dFrontend_dToml_dTomlNode) Base_dData_dPair.t_Base_dData_dPair_dPair Base_dData_dList.t_Base_dData_dList_dList) -> (if (fuel <= 0) then (Vuna_dCompiler_dBase_dDiag.v_Vuna_dCompiler_dBase_dDiag_dicFuel "toml") else (match rest with
  | Base_dData_dList.C_Base_dData_dList_dList__x58__x58_ (dtb__341, dtb__342) -> (if (dtb__341 = 93) then (match ((v_Vuna_dCompiler_dFrontend_dToml_dexpectEol path) { f_Vuna_dCompiler_dFrontend_dToml_dTomlCursor_cursorChars = dtb__342; f_Vuna_dCompiler_dFrontend_dToml_dTomlCursor_cursorLine = line; f_Vuna_dCompiler_dFrontend_dToml_dTomlCursor_cursorCol = (col + 2) }) with
  | Vuna_dCompiler_dBase_dDiag.C_Vuna_dCompiler_dBase_dDiag_dCheck_ErrC (dtb__343) -> (Vuna_dCompiler_dBase_dDiag.C_Vuna_dCompiler_dBase_dDiag_dCheck_ErrC (dtb__343))
  | Vuna_dCompiler_dBase_dDiag.C_Vuna_dCompiler_dBase_dDiag_dCheck_OkC (dtb__344) -> (match (((((v_Vuna_dCompiler_dFrontend_dToml_dappendTableArray (v_Vuna_dCompiler_dFrontend_dToml_dpathFuel newSection)) path) line) newSection) fields) with
  | Vuna_dCompiler_dBase_dDiag.C_Vuna_dCompiler_dBase_dDiag_dCheck_ErrC (dtb__345) -> (Vuna_dCompiler_dBase_dDiag.C_Vuna_dCompiler_dBase_dDiag_dCheck_ErrC (dtb__345))
  | Vuna_dCompiler_dBase_dDiag.C_Vuna_dCompiler_dBase_dDiag_dCheck_OkC (dtb__346) -> (((((v_Vuna_dCompiler_dFrontend_dToml_dparseTomlLoop (fuel - 1)) path) dtb__344) newSection) dtb__346)
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
) else (((v_Vuna_dCompiler_dFrontend_dToml_dfailAt path) line) "expected ']]' in table array header"))
  | _ -> (((v_Vuna_dCompiler_dFrontend_dToml_dfailAt path) line) "expected ']]' in table array header")
)))
# 924 "Vuna/Compiler/Frontend/Toml.vuna"
and v_Vuna_dCompiler_dFrontend_dToml_dparseEntryValue = (fun (fuel : int) (path : string) (cs : t_Vuna_dCompiler_dFrontend_dToml_dTomlCursor) (keyLine : int) (keyPath : string Base_dData_dList.t_Base_dData_dList_dList) (currentPath : string Base_dData_dList.t_Base_dData_dList_dList) (fields : (string, t_Vuna_dCompiler_dFrontend_dToml_dTomlNode) Base_dData_dPair.t_Base_dData_dPair_dPair Base_dData_dList.t_Base_dData_dList_dList) -> (if (fuel <= 0) then (Vuna_dCompiler_dBase_dDiag.v_Vuna_dCompiler_dBase_dDiag_dicFuel "toml") else ((fun nd_uscrut7 -> (match nd_uscrut7 with
  | Vuna_dCompiler_dBase_dDiag.C_Vuna_dCompiler_dBase_dDiag_dCheck_OkC (dtb__347) -> (match dtb__347 with
  | { Base_dData_dPair.f_Base_dData_dPair_dPair_first = dtb__348; Base_dData_dPair.f_Base_dData_dPair_dPair_second = dtb__349 } -> (match ((v_Vuna_dCompiler_dFrontend_dToml_dexpectEol path) dtb__349) with
  | Vuna_dCompiler_dBase_dDiag.C_Vuna_dCompiler_dBase_dDiag_dCheck_ErrC (dtb__350) -> (Vuna_dCompiler_dBase_dDiag.C_Vuna_dCompiler_dBase_dDiag_dCheck_ErrC (dtb__350))
  | Vuna_dCompiler_dBase_dDiag.C_Vuna_dCompiler_dBase_dDiag_dCheck_OkC (dtb__351) -> ((fun fullPath -> (match (((((((v_Vuna_dCompiler_dFrontend_dToml_dinsertValue (v_Vuna_dCompiler_dFrontend_dToml_dpathFuel fullPath)) path) keyLine) fullPath) (v_Vuna_dCompiler_dFrontend_dToml_dsectionOfPath fullPath)) dtb__348) fields) with
  | Vuna_dCompiler_dBase_dDiag.C_Vuna_dCompiler_dBase_dDiag_dCheck_ErrC (dtb__352) -> (Vuna_dCompiler_dBase_dDiag.C_Vuna_dCompiler_dBase_dDiag_dCheck_ErrC (dtb__352))
  | Vuna_dCompiler_dBase_dDiag.C_Vuna_dCompiler_dBase_dDiag_dCheck_OkC (dtb__353) -> (((((v_Vuna_dCompiler_dFrontend_dToml_dparseTomlLoop (fuel - 1)) path) dtb__351) currentPath) dtb__353)
  | _ -> failwith "DT: impossible branch"
)) ((v_Vuna_dCompiler_dFrontend_dToml_dappendPath currentPath) keyPath))
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
)
  | Vuna_dCompiler_dBase_dDiag.C_Vuna_dCompiler_dBase_dDiag_dCheck_ErrC (dtb__354) -> (Vuna_dCompiler_dBase_dDiag.C_Vuna_dCompiler_dBase_dDiag_dCheck_ErrC (dtb__354))
  | _ -> failwith "DT: impossible branch"
)) (((v_Vuna_dCompiler_dFrontend_dToml_dparseValue (fuel - 1)) path) (v_Vuna_dCompiler_dFrontend_dToml_dskipBlank cs)))))
# 941 "Vuna/Compiler/Frontend/Toml.vuna"
and v_Vuna_dCompiler_dFrontend_dToml_dparseKeyLine = (fun (fuel : int) (path : string) (cs : t_Vuna_dCompiler_dFrontend_dToml_dTomlCursor) (currentPath : string Base_dData_dList.t_Base_dData_dList_dList) (fields : (string, t_Vuna_dCompiler_dFrontend_dToml_dTomlNode) Base_dData_dPair.t_Base_dData_dPair_dPair Base_dData_dList.t_Base_dData_dList_dList) -> (if (fuel <= 0) then (Vuna_dCompiler_dBase_dDiag.v_Vuna_dCompiler_dBase_dDiag_dicFuel "toml") else ((fun nd_uscrut5 -> (match nd_uscrut5 with
  | Vuna_dCompiler_dBase_dDiag.C_Vuna_dCompiler_dBase_dDiag_dCheck_OkC (dtb__355) -> (match dtb__355 with
  | { Base_dData_dPair.f_Base_dData_dPair_dPair_first = dtb__356; Base_dData_dPair.f_Base_dData_dPair_dPair_second = dtb__357 } -> (match (v_Vuna_dCompiler_dFrontend_dToml_dskipBlank dtb__357) with
  | { f_Vuna_dCompiler_dFrontend_dToml_dTomlCursor_cursorChars = dtb__358; f_Vuna_dCompiler_dFrontend_dToml_dTomlCursor_cursorLine = dtb__359; f_Vuna_dCompiler_dFrontend_dToml_dTomlCursor_cursorCol = dtb__360 } -> (match dtb__358 with
  | Base_dData_dList.C_Base_dData_dList_dList_Nil -> (((v_Vuna_dCompiler_dFrontend_dToml_dfailAt path) (cs).f_Vuna_dCompiler_dFrontend_dToml_dTomlCursor_cursorLine) "expected '=' after key")
  | Base_dData_dList.C_Base_dData_dList_dList__x58__x58_ (dtb__361, dtb__362) -> (if (dtb__361 = 61) then (((((((v_Vuna_dCompiler_dFrontend_dToml_dparseEntryValue (fuel - 1)) path) { f_Vuna_dCompiler_dFrontend_dToml_dTomlCursor_cursorChars = dtb__362; f_Vuna_dCompiler_dFrontend_dToml_dTomlCursor_cursorLine = dtb__359; f_Vuna_dCompiler_dFrontend_dToml_dTomlCursor_cursorCol = (dtb__360 + 1) }) (cs).f_Vuna_dCompiler_dFrontend_dToml_dTomlCursor_cursorLine) dtb__356) currentPath) fields) else (((v_Vuna_dCompiler_dFrontend_dToml_dfailAt path) (cs).f_Vuna_dCompiler_dFrontend_dToml_dTomlCursor_cursorLine) "expected '=' after key"))
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
)
  | Vuna_dCompiler_dBase_dDiag.C_Vuna_dCompiler_dBase_dDiag_dCheck_ErrC (dtb__363) -> (Vuna_dCompiler_dBase_dDiag.C_Vuna_dCompiler_dBase_dDiag_dCheck_ErrC (dtb__363))
  | _ -> failwith "DT: impossible branch"
)) ((v_Vuna_dCompiler_dFrontend_dToml_dparseKeyPath path) cs))))
# 955 "Vuna/Compiler/Frontend/Toml.vuna"
and v_Vuna_dCompiler_dFrontend_dToml_dparseTomlLoop = (fun (fuel : int) (path : string) (cs : t_Vuna_dCompiler_dFrontend_dToml_dTomlCursor) (currentPath : string Base_dData_dList.t_Base_dData_dList_dList) (fields : (string, t_Vuna_dCompiler_dFrontend_dToml_dTomlNode) Base_dData_dPair.t_Base_dData_dPair_dPair Base_dData_dList.t_Base_dData_dList_dList) -> (if (fuel <= 0) then (Vuna_dCompiler_dBase_dDiag.v_Vuna_dCompiler_dBase_dDiag_dicFuel "toml") else (((((v_Vuna_dCompiler_dFrontend_dToml_dparseTomlLoopAt (fuel - 1)) path) (v_Vuna_dCompiler_dFrontend_dToml_dskipGap cs)) currentPath) fields)))
# 962 "Vuna/Compiler/Frontend/Toml.vuna"
and v_Vuna_dCompiler_dFrontend_dToml_dparseTomlLoopAt = (fun (fuel : int) (path : string) (cs : t_Vuna_dCompiler_dFrontend_dToml_dTomlCursor) (currentPath : string Base_dData_dList.t_Base_dData_dList_dList) (fields : (string, t_Vuna_dCompiler_dFrontend_dToml_dTomlNode) Base_dData_dPair.t_Base_dData_dPair_dPair Base_dData_dList.t_Base_dData_dList_dList) -> (if (fuel <= 0) then (Vuna_dCompiler_dBase_dDiag.v_Vuna_dCompiler_dBase_dDiag_dicFuel "toml") else (match (cs).f_Vuna_dCompiler_dFrontend_dToml_dTomlCursor_cursorChars with
  | Base_dData_dList.C_Base_dData_dList_dList_Nil -> (Vuna_dCompiler_dBase_dDiag.C_Vuna_dCompiler_dBase_dDiag_dCheck_OkC (fields))
  | Base_dData_dList.C_Base_dData_dList_dList__x58__x58_ (dtb__364, dtb__365) -> (if (dtb__364 = 91) then (((((v_Vuna_dCompiler_dFrontend_dToml_dparseBracketLine (fuel - 1)) path) cs) currentPath) fields) else (((((v_Vuna_dCompiler_dFrontend_dToml_dparseKeyLine (fuel - 1)) path) cs) currentPath) fields))
  | _ -> failwith "DT: impossible branch"
)))
# 972 "Vuna/Compiler/Frontend/Toml.vuna"
and v_Vuna_dCompiler_dFrontend_dToml_dparseBracketLine = (fun (fuel : int) (path : string) (cs : t_Vuna_dCompiler_dFrontend_dToml_dTomlCursor) (currentPath : string Base_dData_dList.t_Base_dData_dList_dList) (fields : (string, t_Vuna_dCompiler_dFrontend_dToml_dTomlNode) Base_dData_dPair.t_Base_dData_dPair_dPair Base_dData_dList.t_Base_dData_dList_dList) -> (if (fuel <= 0) then (Vuna_dCompiler_dBase_dDiag.v_Vuna_dCompiler_dBase_dDiag_dicFuel "toml") else (match (cs).f_Vuna_dCompiler_dFrontend_dToml_dTomlCursor_cursorChars with
  | Base_dData_dList.C_Base_dData_dList_dList__x58__x58_ (dtb__366, dtb__367) -> (match dtb__367 with
  | Base_dData_dList.C_Base_dData_dList_dList__x58__x58_ (dtb__368, dtb__369) -> (if (dtb__368 = 91) then (((((v_Vuna_dCompiler_dFrontend_dToml_dparseTableArrayLine (fuel - 1)) path) cs) currentPath) fields) else (((((v_Vuna_dCompiler_dFrontend_dToml_dparseSectionLine (fuel - 1)) path) cs) currentPath) fields))
  | _ -> (((((v_Vuna_dCompiler_dFrontend_dToml_dparseSectionLine (fuel - 1)) path) cs) currentPath) fields)
)
  | _ -> (((((v_Vuna_dCompiler_dFrontend_dToml_dparseSectionLine (fuel - 1)) path) cs) currentPath) fields)
)))

# 988 "Vuna/Compiler/Frontend/Toml.vuna"
let v_Vuna_dCompiler_dFrontend_dToml_dparseTomlAt = (fun (path : string) (source : string) -> ((fun cs -> (match (((((v_Vuna_dCompiler_dFrontend_dToml_dparseTomlLoop (v_Vuna_dCompiler_dFrontend_dToml_dlineFuel cs)) path) cs) Base_dData_dList.C_Base_dData_dList_dList_Nil) Base_dData_dList.C_Base_dData_dList_dList_Nil) with
  | Vuna_dCompiler_dBase_dDiag.C_Vuna_dCompiler_dBase_dDiag_dCheck_ErrC (dtb__370) -> (Vuna_dCompiler_dBase_dDiag.C_Vuna_dCompiler_dBase_dDiag_dCheck_ErrC (dtb__370))
  | Vuna_dCompiler_dBase_dDiag.C_Vuna_dCompiler_dBase_dDiag_dCheck_OkC (dtb__371) -> (Vuna_dCompiler_dBase_dDiag.C_Vuna_dCompiler_dBase_dDiag_dCheck_OkC ((((v_Vuna_dCompiler_dFrontend_dToml_dflattenFields (v_Vuna_dCompiler_dFrontend_dToml_dflattenFuel cs)) Base_dData_dList.C_Base_dData_dList_dList_Nil) dtb__371)))
  | _ -> failwith "DT: impossible branch"
)) { f_Vuna_dCompiler_dFrontend_dToml_dTomlCursor_cursorChars = (v_Vuna_dCompiler_dFrontend_dToml_dstripCR (Base_dData_dList.dtp_unpack source)); f_Vuna_dCompiler_dFrontend_dToml_dTomlCursor_cursorLine = 1; f_Vuna_dCompiler_dFrontend_dToml_dTomlCursor_cursorCol = 1 }))

# 985 "Vuna/Compiler/Frontend/Toml.vuna"
let v_Vuna_dCompiler_dFrontend_dToml_dparseToml = (fun (source : string) -> ((v_Vuna_dCompiler_dFrontend_dToml_dparseTomlAt "") source))

# 997 "Vuna/Compiler/Frontend/Toml.vuna"
let v_Vuna_dCompiler_dFrontend_dToml_dparseTomlDoc = (fun (path : string) (source : string) -> ((fun cs -> (match (((((v_Vuna_dCompiler_dFrontend_dToml_dparseTomlLoop (v_Vuna_dCompiler_dFrontend_dToml_dlineFuel cs)) path) cs) Base_dData_dList.C_Base_dData_dList_dList_Nil) Base_dData_dList.C_Base_dData_dList_dList_Nil) with
  | Vuna_dCompiler_dBase_dDiag.C_Vuna_dCompiler_dBase_dDiag_dCheck_ErrC (dtb__372) -> (Obj.magic (Vuna_dCompiler_dBase_dDiag.C_Vuna_dCompiler_dBase_dDiag_dCheck_ErrC (dtb__372)))
  | Vuna_dCompiler_dBase_dDiag.C_Vuna_dCompiler_dBase_dDiag_dCheck_OkC (dtb__373) -> (Obj.magic (Vuna_dCompiler_dBase_dDiag.C_Vuna_dCompiler_dBase_dDiag_dCheck_OkC (((v_Vuna_dCompiler_dFrontend_dToml_drootValue (v_Vuna_dCompiler_dFrontend_dToml_dflattenFuel cs)) dtb__373))))
  | _ -> failwith "DT: impossible branch"
)) { f_Vuna_dCompiler_dFrontend_dToml_dTomlCursor_cursorChars = (v_Vuna_dCompiler_dFrontend_dToml_dstripCR (Base_dData_dList.dtp_unpack source)); f_Vuna_dCompiler_dFrontend_dToml_dTomlCursor_cursorLine = 1; f_Vuna_dCompiler_dFrontend_dToml_dTomlCursor_cursorCol = 1 }))

# 1006 "Vuna/Compiler/Frontend/Toml.vuna"
let rec v_Vuna_dCompiler_dFrontend_dToml_darrayStrings = (fun (mc0 : t_Vuna_dCompiler_dFrontend_dToml_dTomlValue Base_dData_dList.t_Base_dData_dList_dList) -> (match mc0 with
  | Base_dData_dList.C_Base_dData_dList_dList__x58__x58_ (dtb__374, dtb__375) -> (match dtb__374 with
  | C_Vuna_dCompiler_dFrontend_dToml_dTomlValue_TStr (dtb__376) -> (match (v_Vuna_dCompiler_dFrontend_dToml_darrayStrings dtb__375) with
  | Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Nothing -> Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Nothing
  | Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Just (dtb__377) -> (Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Just ((Base_dData_dList.C_Base_dData_dList_dList__x58__x58_ (dtb__376, dtb__377))))
  | _ -> failwith "DT: impossible branch"
)
  | _ -> Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Nothing
)
  | Base_dData_dList.C_Base_dData_dList_dList_Nil -> (Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Just (Base_dData_dList.C_Base_dData_dList_dList_Nil))
  | _ -> failwith "DT: impossible branch"
))

# 1054 "Vuna/Compiler/Frontend/Toml.vuna"
let rec v_Vuna_dCompiler_dFrontend_dToml_dsplitAtList = (fun (n : int) xs -> (if (n <= 0) then (Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Just ({ Base_dData_dPair.f_Base_dData_dPair_dPair_first = Base_dData_dList.C_Base_dData_dList_dList_Nil; Base_dData_dPair.f_Base_dData_dPair_dPair_second = xs })) else (match xs with
  | Base_dData_dList.C_Base_dData_dList_dList_Nil -> Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Nothing
  | Base_dData_dList.C_Base_dData_dList_dList__x58__x58_ (dtb__378, dtb__379) -> ((fun nd_uscrut6 -> (match nd_uscrut6 with
  | Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Just (dtb__380) -> (match dtb__380 with
  | { Base_dData_dPair.f_Base_dData_dPair_dPair_first = dtb__381; Base_dData_dPair.f_Base_dData_dPair_dPair_second = dtb__382 } -> (Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Just ({ Base_dData_dPair.f_Base_dData_dPair_dPair_first = (Base_dData_dList.C_Base_dData_dList_dList__x58__x58_ (dtb__378, dtb__381)); Base_dData_dPair.f_Base_dData_dPair_dPair_second = dtb__382 }))
  | _ -> failwith "DT: impossible branch"
)
  | Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Nothing -> Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Nothing
  | _ -> failwith "DT: impossible branch"
)) ((v_Vuna_dCompiler_dFrontend_dToml_dsplitAtList (n - 1)) dtb__379))
  | _ -> failwith "DT: impossible branch"
)))

# 1066 "Vuna/Compiler/Frontend/Toml.vuna"
let rec v_Vuna_dCompiler_dFrontend_dToml_dsamePath = (fun _uctx0 mc0 mc1 -> (match mc0 with
  | Base_dData_dList.C_Base_dData_dList_dList__x58__x58_ (dtb__383, dtb__384) -> (match mc1 with
  | Base_dData_dList.C_Base_dData_dList_dList__x58__x58_ (dtb__385, dtb__386) -> (if (((Base_dTrait_dEq.v_Base_dTrait_dEq_d_x61__x61_ _uctx0) dtb__383) dtb__385) then (((v_Vuna_dCompiler_dFrontend_dToml_dsamePath _uctx0) dtb__384) dtb__386) else false)
  | _ -> false
)
  | Base_dData_dList.C_Base_dData_dList_dList_Nil -> (match mc1 with
  | Base_dData_dList.C_Base_dData_dList_dList_Nil -> true
  | _ -> false
)
  | _ -> failwith "DT: impossible branch"
))

# 1014 "Vuna/Compiler/Frontend/Toml.vuna"
let rec v_Vuna_dCompiler_dFrontend_dToml_dlookupEntry = (fun (mc0 : string Base_dData_dList.t_Base_dData_dList_dList) (mc1 : string) (mc2 : t_Vuna_dCompiler_dFrontend_dToml_dTomlEntry Base_dData_dList.t_Base_dData_dList_dList) -> (match mc2 with
  | Base_dData_dList.C_Base_dData_dList_dList__x58__x58_ (dtb__387, dtb__388) -> (match dtb__387 with
  | { f_Vuna_dCompiler_dFrontend_dToml_dTomlEntry_tomlEntrySection = dtb__389; f_Vuna_dCompiler_dFrontend_dToml_dTomlEntry_tomlEntryKey = dtb__390; f_Vuna_dCompiler_dFrontend_dToml_dTomlEntry_tomlEntryValue = dtb__391; f_Vuna_dCompiler_dFrontend_dToml_dTomlEntry_tomlEntryLine = dtb__392 } -> (if (if (((v_Vuna_dCompiler_dFrontend_dToml_dsamePath Base_dData_dString.v_Eq_uString) mc0) dtb__389) then (dtb__390 = mc1) else false) then (Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Just (dtb__391)) else (((v_Vuna_dCompiler_dFrontend_dToml_dlookupEntry mc0) mc1) dtb__388))
  | _ -> failwith "DT: impossible branch"
)
  | Base_dData_dList.C_Base_dData_dList_dList_Nil -> Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Nothing
  | _ -> failwith "DT: impossible branch"
))

# 1019 "Vuna/Compiler/Frontend/Toml.vuna"
let rec v_Vuna_dCompiler_dFrontend_dToml_dlookupEntryLine = (fun (mc0 : string Base_dData_dList.t_Base_dData_dList_dList) (mc1 : string) (mc2 : t_Vuna_dCompiler_dFrontend_dToml_dTomlEntry Base_dData_dList.t_Base_dData_dList_dList) -> (match mc2 with
  | Base_dData_dList.C_Base_dData_dList_dList__x58__x58_ (dtb__393, dtb__394) -> (match dtb__393 with
  | { f_Vuna_dCompiler_dFrontend_dToml_dTomlEntry_tomlEntrySection = dtb__395; f_Vuna_dCompiler_dFrontend_dToml_dTomlEntry_tomlEntryKey = dtb__396; f_Vuna_dCompiler_dFrontend_dToml_dTomlEntry_tomlEntryValue = dtb__397; f_Vuna_dCompiler_dFrontend_dToml_dTomlEntry_tomlEntryLine = dtb__398 } -> (if (if (((v_Vuna_dCompiler_dFrontend_dToml_dsamePath Base_dData_dString.v_Eq_uString) mc0) dtb__395) then (dtb__396 = mc1) else false) then (Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Just (dtb__398)) else (((v_Vuna_dCompiler_dFrontend_dToml_dlookupEntryLine mc0) mc1) dtb__394))
  | _ -> failwith "DT: impossible branch"
)
  | Base_dData_dList.C_Base_dData_dList_dList_Nil -> Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Nothing
  | _ -> failwith "DT: impossible branch"
))

# 1042 "Vuna/Compiler/Frontend/Toml.vuna"
let v_Vuna_dCompiler_dFrontend_dToml_dchildSectionOf = (fun (prefix : string Base_dData_dList.t_Base_dData_dList_dList) (section : string Base_dData_dList.t_Base_dData_dList_dList) -> ((fun nd_uscrut2 -> (match nd_uscrut2 with
  | Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Just (dtb__399) -> (match dtb__399 with
  | { Base_dData_dPair.f_Base_dData_dPair_dPair_first = dtb__400; Base_dData_dPair.f_Base_dData_dPair_dPair_second = dtb__401 } -> (if (((v_Vuna_dCompiler_dFrontend_dToml_dsamePath Base_dData_dString.v_Eq_uString) dtb__400) prefix) then ((fun nd_uscrut9 -> (match nd_uscrut9 with
  | Base_dData_dList.C_Base_dData_dList_dList__x58__x58_ (dtb__402, dtb__403) -> (match dtb__403 with
  | Base_dData_dList.C_Base_dData_dList_dList_Nil -> (Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Just (dtb__402))
  | _ -> Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Nothing
)
  | _ -> Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Nothing
)) dtb__401) else Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Nothing)
  | _ -> failwith "DT: impossible branch"
)
  | Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Nothing -> Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Nothing
  | _ -> failwith "DT: impossible branch"
)) ((v_Vuna_dCompiler_dFrontend_dToml_dsplitAtList (v_Vuna_dCompiler_dFrontend_dToml_dlenInt prefix)) section)))

# 1028 "Vuna/Compiler/Frontend/Toml.vuna"
let rec v_Vuna_dCompiler_dFrontend_dToml_dsectionsUnderGo = (fun (mc0 : string Base_dData_dList.t_Base_dData_dList_dList) (mc1 : t_Vuna_dCompiler_dFrontend_dToml_dTomlEntry Base_dData_dList.t_Base_dData_dList_dList) (mc2 : string Base_dData_dList.t_Base_dData_dList_dList) -> (match mc1 with
  | Base_dData_dList.C_Base_dData_dList_dList__x58__x58_ (dtb__404, dtb__405) -> (match dtb__404 with
  | { f_Vuna_dCompiler_dFrontend_dToml_dTomlEntry_tomlEntrySection = dtb__406; f_Vuna_dCompiler_dFrontend_dToml_dTomlEntry_tomlEntryKey = dtb__407; f_Vuna_dCompiler_dFrontend_dToml_dTomlEntry_tomlEntryValue = dtb__408; f_Vuna_dCompiler_dFrontend_dToml_dTomlEntry_tomlEntryLine = dtb__409 } -> ((fun childName -> (match childName with
  | Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Nothing -> (((v_Vuna_dCompiler_dFrontend_dToml_dsectionsUnderGo mc0) dtb__405) mc2)
  | Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Just (dtb__410) -> (if ((Base_dData_dList.v_Base_dData_dList_dmemName dtb__410) mc2) then (((v_Vuna_dCompiler_dFrontend_dToml_dsectionsUnderGo mc0) dtb__405) mc2) else (((v_Vuna_dCompiler_dFrontend_dToml_dsectionsUnderGo mc0) dtb__405) (Base_dData_dList.C_Base_dData_dList_dList__x58__x58_ (dtb__410, mc2))))
  | _ -> failwith "DT: impossible branch"
)) ((v_Vuna_dCompiler_dFrontend_dToml_dchildSectionOf mc0) dtb__406))
  | _ -> failwith "DT: impossible branch"
)
  | Base_dData_dList.C_Base_dData_dList_dList_Nil -> (Base_dData_dList.v_Base_dData_dList_dreverse mc2)
  | _ -> failwith "DT: impossible branch"
))

# 1025 "Vuna/Compiler/Frontend/Toml.vuna"
let v_Vuna_dCompiler_dFrontend_dToml_dsectionsUnder = (fun (prefix : string Base_dData_dList.t_Base_dData_dList_dList) (entries : t_Vuna_dCompiler_dFrontend_dToml_dTomlEntry Base_dData_dList.t_Base_dData_dList_dList) -> (((v_Vuna_dCompiler_dFrontend_dToml_dsectionsUnderGo prefix) entries) Base_dData_dList.C_Base_dData_dList_dList_Nil))
