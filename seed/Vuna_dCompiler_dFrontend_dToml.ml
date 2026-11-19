open Vuna_runtime
type t_Vuna_dCompiler_dFrontend_dToml_dTomlValue = C_Vuna_dCompiler_dFrontend_dToml_dTomlValue_TStr of (string) | C_Vuna_dCompiler_dFrontend_dToml_dTomlValue_TInt of (int) | C_Vuna_dCompiler_dFrontend_dToml_dTomlValue_TBool of (bool) | C_Vuna_dCompiler_dFrontend_dToml_dTomlValue_TArray of (t_Vuna_dCompiler_dFrontend_dToml_dTomlValue Base_dData_dList.t_Base_dData_dList_dList) | C_Vuna_dCompiler_dFrontend_dToml_dTomlValue_TTable of ((string, t_Vuna_dCompiler_dFrontend_dToml_dTomlValue) Base_dData_dPair.t_Base_dData_dPair_dPair Base_dData_dList.t_Base_dData_dList_dList) | C_Vuna_dCompiler_dFrontend_dToml_dTomlValue_TTableArray of ((string, t_Vuna_dCompiler_dFrontend_dToml_dTomlValue) Base_dData_dPair.t_Base_dData_dPair_dPair Base_dData_dList.t_Base_dData_dList_dList Base_dData_dList.t_Base_dData_dList_dList)
and t_Vuna_dCompiler_dFrontend_dToml_dTomlEntry = { f_Vuna_dCompiler_dFrontend_dToml_dTomlEntry_tomlEntrySection : string Base_dData_dList.t_Base_dData_dList_dList; f_Vuna_dCompiler_dFrontend_dToml_dTomlEntry_tomlEntryKey : string; f_Vuna_dCompiler_dFrontend_dToml_dTomlEntry_tomlEntryValue : t_Vuna_dCompiler_dFrontend_dToml_dTomlValue; f_Vuna_dCompiler_dFrontend_dToml_dTomlEntry_tomlEntryLine : int }
and t_Vuna_dCompiler_dFrontend_dToml_dTomlCursor = { f_Vuna_dCompiler_dFrontend_dToml_dTomlCursor_cursorChars : int Base_dData_dList.t_Base_dData_dList_dList; f_Vuna_dCompiler_dFrontend_dToml_dTomlCursor_cursorLine : int; f_Vuna_dCompiler_dFrontend_dToml_dTomlCursor_cursorCol : int }
and t_Vuna_dCompiler_dFrontend_dToml_dTableKind = C_Vuna_dCompiler_dFrontend_dToml_dTableKind_KindImplicit | C_Vuna_dCompiler_dFrontend_dToml_dTableKind_KindDotted | C_Vuna_dCompiler_dFrontend_dToml_dTableKind_KindExplicit
and t_Vuna_dCompiler_dFrontend_dToml_dTomlNode = C_Vuna_dCompiler_dFrontend_dToml_dTomlNode_NodeLeaf of (t_Vuna_dCompiler_dFrontend_dToml_dTomlValue) * (int) | C_Vuna_dCompiler_dFrontend_dToml_dTomlNode_NodeTable of ((string, t_Vuna_dCompiler_dFrontend_dToml_dTomlNode) Base_dData_dPair.t_Base_dData_dPair_dPair Base_dData_dList.t_Base_dData_dList_dList) * (t_Vuna_dCompiler_dFrontend_dToml_dTableKind) * (int) | C_Vuna_dCompiler_dFrontend_dToml_dTomlNode_NodeTableArray of ((string, t_Vuna_dCompiler_dFrontend_dToml_dTomlNode) Base_dData_dPair.t_Base_dData_dPair_dPair Base_dData_dList.t_Base_dData_dList_dList Base_dData_dList.t_Base_dData_dList_dList) * (int)

# 77 "Vuna/Compiler/Frontend/Toml.vuna"
let rec v_Vuna_dCompiler_dFrontend_dToml_dlenInt = (fun mc0 -> (match mc0 with
  | Base_dData_dList.C_Base_dData_dList_dList__x58__x58_ (dtb__0, dtb__1) -> (1 + (v_Vuna_dCompiler_dFrontend_dToml_dlenInt dtb__1))
  | Base_dData_dList.C_Base_dData_dList_dList_Nil -> 0
  | _ -> failwith "DT: impossible branch"
))

# 82 "Vuna/Compiler/Frontend/Toml.vuna"
let v_Vuna_dCompiler_dFrontend_dToml_dcursorFuel = (fun (mc0 : t_Vuna_dCompiler_dFrontend_dToml_dTomlCursor) -> (match mc0 with
  | { f_Vuna_dCompiler_dFrontend_dToml_dTomlCursor_cursorChars = dtb__2; f_Vuna_dCompiler_dFrontend_dToml_dTomlCursor_cursorLine = dtb__3; f_Vuna_dCompiler_dFrontend_dToml_dTomlCursor_cursorCol = dtb__4 } -> ((2 * (v_Vuna_dCompiler_dFrontend_dToml_dlenInt dtb__2)) + 16)
  | _ -> failwith "DT: impossible branch"
))

# 89 "Vuna/Compiler/Frontend/Toml.vuna"
let rec v_Vuna_dCompiler_dFrontend_dToml_dcountLines = (fun (mc0 : int Base_dData_dList.t_Base_dData_dList_dList) -> (match mc0 with
  | Base_dData_dList.C_Base_dData_dList_dList__x58__x58_ (dtb__5, dtb__6) -> (if (dtb__5 = 10) then (1 + (v_Vuna_dCompiler_dFrontend_dToml_dcountLines dtb__6)) else (v_Vuna_dCompiler_dFrontend_dToml_dcountLines dtb__6))
  | Base_dData_dList.C_Base_dData_dList_dList_Nil -> 1
  | _ -> failwith "DT: impossible branch"
))

# 86 "Vuna/Compiler/Frontend/Toml.vuna"
let v_Vuna_dCompiler_dFrontend_dToml_dlineFuel = (fun (mc0 : t_Vuna_dCompiler_dFrontend_dToml_dTomlCursor) -> (match mc0 with
  | { f_Vuna_dCompiler_dFrontend_dToml_dTomlCursor_cursorChars = dtb__7; f_Vuna_dCompiler_dFrontend_dToml_dTomlCursor_cursorLine = dtb__8; f_Vuna_dCompiler_dFrontend_dToml_dTomlCursor_cursorCol = dtb__9 } -> ((4 * (v_Vuna_dCompiler_dFrontend_dToml_dcountLines dtb__7)) + 16)
  | _ -> failwith "DT: impossible branch"
))

# 94 "Vuna/Compiler/Frontend/Toml.vuna"
let v_Vuna_dCompiler_dFrontend_dToml_dpathFuel = (fun (path : string Base_dData_dList.t_Base_dData_dList_dList) -> ((2 * (v_Vuna_dCompiler_dFrontend_dToml_dlenInt path)) + 4))

# 98 "Vuna/Compiler/Frontend/Toml.vuna"
let v_Vuna_dCompiler_dFrontend_dToml_dflattenFuel = (fun (cs : t_Vuna_dCompiler_dFrontend_dToml_dTomlCursor) -> ((v_Vuna_dCompiler_dFrontend_dToml_dcursorFuel cs) + (v_Vuna_dCompiler_dFrontend_dToml_dlineFuel cs)))

# 101 "Vuna/Compiler/Frontend/Toml.vuna"
let v_Vuna_dCompiler_dFrontend_dToml_dadvanceCursor = (fun (mc0 : t_Vuna_dCompiler_dFrontend_dToml_dTomlCursor) -> (match mc0 with
  | { f_Vuna_dCompiler_dFrontend_dToml_dTomlCursor_cursorChars = dtb__10; f_Vuna_dCompiler_dFrontend_dToml_dTomlCursor_cursorLine = dtb__11; f_Vuna_dCompiler_dFrontend_dToml_dTomlCursor_cursorCol = dtb__12 } -> (match dtb__10 with
  | Base_dData_dList.C_Base_dData_dList_dList__x58__x58_ (dtb__13, dtb__14) -> (if (dtb__13 = 10) then { f_Vuna_dCompiler_dFrontend_dToml_dTomlCursor_cursorChars = dtb__14; f_Vuna_dCompiler_dFrontend_dToml_dTomlCursor_cursorLine = (dtb__11 + 1); f_Vuna_dCompiler_dFrontend_dToml_dTomlCursor_cursorCol = 1 } else { f_Vuna_dCompiler_dFrontend_dToml_dTomlCursor_cursorChars = dtb__14; f_Vuna_dCompiler_dFrontend_dToml_dTomlCursor_cursorLine = dtb__11; f_Vuna_dCompiler_dFrontend_dToml_dTomlCursor_cursorCol = (dtb__12 + 1) })
  | Base_dData_dList.C_Base_dData_dList_dList_Nil -> { f_Vuna_dCompiler_dFrontend_dToml_dTomlCursor_cursorChars = Base_dData_dList.C_Base_dData_dList_dList_Nil; f_Vuna_dCompiler_dFrontend_dToml_dTomlCursor_cursorLine = dtb__11; f_Vuna_dCompiler_dFrontend_dToml_dTomlCursor_cursorCol = dtb__12 }
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
))

# 107 "Vuna/Compiler/Frontend/Toml.vuna"
let v_Vuna_dCompiler_dFrontend_dToml_disDigitChar = (fun (c : int) -> (if (c >= 48) then (c <= 57) else false))

# 110 "Vuna/Compiler/Frontend/Toml.vuna"
let v_Vuna_dCompiler_dFrontend_dToml_disUpperAlphaChar = (fun (c : int) -> (if (c >= 65) then (c <= 90) else false))

# 113 "Vuna/Compiler/Frontend/Toml.vuna"
let v_Vuna_dCompiler_dFrontend_dToml_disLowerAlphaChar = (fun (c : int) -> (if (c >= 97) then (c <= 122) else false))

# 116 "Vuna/Compiler/Frontend/Toml.vuna"
let v_Vuna_dCompiler_dFrontend_dToml_disAlphaChar = (fun (c : int) -> (if (v_Vuna_dCompiler_dFrontend_dToml_disUpperAlphaChar c) then true else (v_Vuna_dCompiler_dFrontend_dToml_disLowerAlphaChar c)))

# 119 "Vuna/Compiler/Frontend/Toml.vuna"
let v_Vuna_dCompiler_dFrontend_dToml_disBareKeyChar = (fun (c : int) -> (if (if (if (v_Vuna_dCompiler_dFrontend_dToml_disAlphaChar c) then true else (v_Vuna_dCompiler_dFrontend_dToml_disDigitChar c)) then true else (c = 95)) then true else (c = 45)))

# 122 "Vuna/Compiler/Frontend/Toml.vuna"
let v_Vuna_dCompiler_dFrontend_dToml_disHexDigit = (fun (c : int) -> (if (if (v_Vuna_dCompiler_dFrontend_dToml_disDigitChar c) then true else (if (c >= 65) then (c <= 70) else false)) then true else (if (c >= 97) then (c <= 102) else false)))

# 125 "Vuna/Compiler/Frontend/Toml.vuna"
let v_Vuna_dCompiler_dFrontend_dToml_dhexValue = (fun (c : int) -> (if (v_Vuna_dCompiler_dFrontend_dToml_disDigitChar c) then (c - 48) else (if (if (c >= 65) then (c <= 70) else false) then (c - 55) else (c - 87))))

# 128 "Vuna/Compiler/Frontend/Toml.vuna"
let v_Vuna_dCompiler_dFrontend_dToml_disBlankChar = (fun (c : int) -> (if (c = 32) then true else (c = 9)))

# 132 "Vuna/Compiler/Frontend/Toml.vuna"
let rec v_Vuna_dCompiler_dFrontend_dToml_ddropChars = (fun (n : int) (xs : int Base_dData_dList.t_Base_dData_dList_dList) -> (if (n <= 0) then xs else (match xs with
  | Base_dData_dList.C_Base_dData_dList_dList_Nil -> Base_dData_dList.C_Base_dData_dList_dList_Nil
  | Base_dData_dList.C_Base_dData_dList_dList__x58__x58_ (dtb__15, dtb__16) -> ((v_Vuna_dCompiler_dFrontend_dToml_ddropChars (n - 1)) dtb__16)
  | _ -> failwith "DT: impossible branch"
)))

# 142 "Vuna/Compiler/Frontend/Toml.vuna"
let rec v_Vuna_dCompiler_dFrontend_dToml_dadvanceChars = (fun (n : int) (cs : t_Vuna_dCompiler_dFrontend_dToml_dTomlCursor) -> (if (n <= 0) then cs else ((v_Vuna_dCompiler_dFrontend_dToml_dadvanceChars (n - 1)) (v_Vuna_dCompiler_dFrontend_dToml_dadvanceCursor cs))))

# 146 "Vuna/Compiler/Frontend/Toml.vuna"
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

# 151 "Vuna/Compiler/Frontend/Toml.vuna"
let rec v_Vuna_dCompiler_dFrontend_dToml_dstripCR = (fun (mc0 : int Base_dData_dList.t_Base_dData_dList_dList) -> (match mc0 with
  | Base_dData_dList.C_Base_dData_dList_dList__x58__x58_ (dtb__23, dtb__24) -> (if (dtb__23 = 13) then (v_Vuna_dCompiler_dFrontend_dToml_dstripCR dtb__24) else (Base_dData_dList.C_Base_dData_dList_dList__x58__x58_ (dtb__23, (v_Vuna_dCompiler_dFrontend_dToml_dstripCR dtb__24))))
  | Base_dData_dList.C_Base_dData_dList_dList_Nil -> Base_dData_dList.C_Base_dData_dList_dList_Nil
  | _ -> failwith "DT: impossible branch"
))

# 155 "Vuna/Compiler/Frontend/Toml.vuna"
let v_Vuna_dCompiler_dFrontend_dToml_dfailAt = (fun (path : string) (line : int) (msg : string) -> ((((Vuna_dCompiler_dBase_dDiagnostics_dPkg.v_Vuna_dCompiler_dBase_dDiagnostics_dPkg_dpkgAt1 path) line) (Vuna_dCompiler_dBase_dDiagnostics_dPkg.C_Vuna_dCompiler_dBase_dDiagnostics_dPkg_dPkgErr_TomlSyntax (msg))) msg))

# 158 "Vuna/Compiler/Frontend/Toml.vuna"
let v_Vuna_dCompiler_dFrontend_dToml_dappendPath = (fun (xs : string Base_dData_dList.t_Base_dData_dList_dList) (ys : string Base_dData_dList.t_Base_dData_dList_dList) -> ((Base_dData_dList.v_Base_dData_dList_dappend xs) ys))

# 161 "Vuna/Compiler/Frontend/Toml.vuna"
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

# 170 "Vuna/Compiler/Frontend/Toml.vuna"
let rec v_Vuna_dCompiler_dFrontend_dToml_dlookupField = (fun (mc0 : string) (mc1 : (string, t_Vuna_dCompiler_dFrontend_dToml_dTomlNode) Base_dData_dPair.t_Base_dData_dPair_dPair Base_dData_dList.t_Base_dData_dList_dList) -> (match mc1 with
  | Base_dData_dList.C_Base_dData_dList_dList__x58__x58_ (dtb__30, dtb__31) -> (match dtb__30 with
  | { Base_dData_dPair.f_Base_dData_dPair_dPair_first = dtb__32; Base_dData_dPair.f_Base_dData_dPair_dPair_second = dtb__33 } -> (if (dtb__32 = mc0) then (Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Just (dtb__33)) else ((v_Vuna_dCompiler_dFrontend_dToml_dlookupField mc0) dtb__31))
  | _ -> failwith "DT: impossible branch"
)
  | Base_dData_dList.C_Base_dData_dList_dList_Nil -> Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Nothing
  | _ -> failwith "DT: impossible branch"
))

# 174 "Vuna/Compiler/Frontend/Toml.vuna"
let rec v_Vuna_dCompiler_dFrontend_dToml_dreplaceField = (fun (mc0 : string) (mc1 : t_Vuna_dCompiler_dFrontend_dToml_dTomlNode) (mc2 : (string, t_Vuna_dCompiler_dFrontend_dToml_dTomlNode) Base_dData_dPair.t_Base_dData_dPair_dPair Base_dData_dList.t_Base_dData_dList_dList) -> (match mc2 with
  | Base_dData_dList.C_Base_dData_dList_dList__x58__x58_ (dtb__34, dtb__35) -> (match dtb__34 with
  | { Base_dData_dPair.f_Base_dData_dPair_dPair_first = dtb__36; Base_dData_dPair.f_Base_dData_dPair_dPair_second = dtb__37 } -> (if (dtb__36 = mc0) then (Base_dData_dList.C_Base_dData_dList_dList__x58__x58_ ({ Base_dData_dPair.f_Base_dData_dPair_dPair_first = dtb__36; Base_dData_dPair.f_Base_dData_dPair_dPair_second = mc1 }, dtb__35)) else (Base_dData_dList.C_Base_dData_dList_dList__x58__x58_ ({ Base_dData_dPair.f_Base_dData_dPair_dPair_first = dtb__36; Base_dData_dPair.f_Base_dData_dPair_dPair_second = dtb__37 }, (((v_Vuna_dCompiler_dFrontend_dToml_dreplaceField mc0) mc1) dtb__35))))
  | _ -> failwith "DT: impossible branch"
)
  | Base_dData_dList.C_Base_dData_dList_dList_Nil -> (Base_dData_dList.C_Base_dData_dList_dList__x58__x58_ ({ Base_dData_dPair.f_Base_dData_dPair_dPair_first = mc0; Base_dData_dPair.f_Base_dData_dPair_dPair_second = mc1 }, Base_dData_dList.C_Base_dData_dList_dList_Nil))
  | _ -> failwith "DT: impossible branch"
))

# 180 "Vuna/Compiler/Frontend/Toml.vuna"
let rec v_Vuna_dCompiler_dFrontend_dToml_dlastFields = (fun (mc0 : (string, t_Vuna_dCompiler_dFrontend_dToml_dTomlNode) Base_dData_dPair.t_Base_dData_dPair_dPair Base_dData_dList.t_Base_dData_dList_dList Base_dData_dList.t_Base_dData_dList_dList) -> (match mc0 with
  | Base_dData_dList.C_Base_dData_dList_dList__x58__x58_ (dtb__38, dtb__39) -> (match dtb__39 with
  | Base_dData_dList.C_Base_dData_dList_dList_Nil -> (Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Just (dtb__38))
  | _ -> (v_Vuna_dCompiler_dFrontend_dToml_dlastFields dtb__39)
)
  | Base_dData_dList.C_Base_dData_dList_dList_Nil -> Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Nothing
  | _ -> failwith "DT: impossible branch"
))

# 185 "Vuna/Compiler/Frontend/Toml.vuna"
let rec v_Vuna_dCompiler_dFrontend_dToml_dreplaceLastFields = (fun (mc0 : (string, t_Vuna_dCompiler_dFrontend_dToml_dTomlNode) Base_dData_dPair.t_Base_dData_dPair_dPair Base_dData_dList.t_Base_dData_dList_dList) (mc1 : (string, t_Vuna_dCompiler_dFrontend_dToml_dTomlNode) Base_dData_dPair.t_Base_dData_dPair_dPair Base_dData_dList.t_Base_dData_dList_dList Base_dData_dList.t_Base_dData_dList_dList) -> (match mc1 with
  | Base_dData_dList.C_Base_dData_dList_dList__x58__x58_ (dtb__40, dtb__41) -> (match dtb__41 with
  | Base_dData_dList.C_Base_dData_dList_dList_Nil -> (Base_dData_dList.C_Base_dData_dList_dList__x58__x58_ (mc0, Base_dData_dList.C_Base_dData_dList_dList_Nil))
  | _ -> (Base_dData_dList.C_Base_dData_dList_dList__x58__x58_ (dtb__40, ((v_Vuna_dCompiler_dFrontend_dToml_dreplaceLastFields mc0) dtb__41)))
)
  | Base_dData_dList.C_Base_dData_dList_dList_Nil -> (Base_dData_dList.C_Base_dData_dList_dList__x58__x58_ (mc0, Base_dData_dList.C_Base_dData_dList_dList_Nil))
  | _ -> failwith "DT: impossible branch"
))

# 190 "Vuna/Compiler/Frontend/Toml.vuna"
let v_Vuna_dCompiler_dFrontend_dToml_dkindIsExplicit = (fun (mc0 : t_Vuna_dCompiler_dFrontend_dToml_dTableKind) -> (match mc0 with
  | C_Vuna_dCompiler_dFrontend_dToml_dTableKind_KindExplicit -> true
  | _ -> false
))

# 194 "Vuna/Compiler/Frontend/Toml.vuna"
let v_Vuna_dCompiler_dFrontend_dToml_dkindIsDotted = (fun (mc0 : t_Vuna_dCompiler_dFrontend_dToml_dTableKind) -> (match mc0 with
  | C_Vuna_dCompiler_dFrontend_dToml_dTableKind_KindDotted -> true
  | _ -> false
))

# 200 "Vuna/Compiler/Frontend/Toml.vuna"
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
  | C_Vuna_dCompiler_dFrontend_dToml_dTomlNode_NodeTableArray (dtb__56, dtb__57) -> (match (v_Vuna_dCompiler_dFrontend_dToml_dlastFields dtb__56) with
  | Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Just (dtb__58) -> (match ((((((v_Vuna_dCompiler_dFrontend_dToml_densureTable (fuel - 1)) path) line) dtb__43) kind) dtb__58) with
  | Vuna_dCompiler_dBase_dDiag.C_Vuna_dCompiler_dBase_dDiag_dCheck_ErrC (dtb__59) -> (Vuna_dCompiler_dBase_dDiag.C_Vuna_dCompiler_dBase_dDiag_dCheck_ErrC (dtb__59))
  | Vuna_dCompiler_dBase_dDiag.C_Vuna_dCompiler_dBase_dDiag_dCheck_OkC (dtb__60) -> (Vuna_dCompiler_dBase_dDiag.C_Vuna_dCompiler_dBase_dDiag_dCheck_OkC ((((v_Vuna_dCompiler_dFrontend_dToml_dreplaceField dtb__42) (C_Vuna_dCompiler_dFrontend_dToml_dTomlNode_NodeTableArray (((v_Vuna_dCompiler_dFrontend_dToml_dreplaceLastFields dtb__60) dtb__56), dtb__57))) fields)))
  | _ -> failwith "DT: impossible branch"
)
  | Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Nothing -> (((v_Vuna_dCompiler_dFrontend_dToml_dfailAt path) line) (String.concat "" ["table array \""; dtb__42; "\" has no current element"]))
  | _ -> failwith "DT: impossible branch"
)
  | C_Vuna_dCompiler_dFrontend_dToml_dTomlNode_NodeLeaf (dtb__61, dtb__62) -> (((v_Vuna_dCompiler_dFrontend_dToml_dfailAt path) dtb__62) (String.concat "" ["key \""; dtb__42; "\" is not a table"]))
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
)
)
  | Base_dData_dList.C_Base_dData_dList_dList_Nil -> (((v_Vuna_dCompiler_dFrontend_dToml_dfailAt path) line) "empty table path")
  | _ -> failwith "DT: impossible branch"
)) pathSegs)))

# 236 "Vuna/Compiler/Frontend/Toml.vuna"
let rec v_Vuna_dCompiler_dFrontend_dToml_dappendTableArray = (fun (fuel : int) (path : string) (line : int) (pathSegs : string Base_dData_dList.t_Base_dData_dList_dList) (fields : (string, t_Vuna_dCompiler_dFrontend_dToml_dTomlNode) Base_dData_dPair.t_Base_dData_dPair_dPair Base_dData_dList.t_Base_dData_dList_dList) -> (if (fuel <= 0) then (Vuna_dCompiler_dBase_dDiag.v_Vuna_dCompiler_dBase_dDiag_dicFuel "toml") else ((fun nd_uscrut5 -> (match nd_uscrut5 with
  | Base_dData_dList.C_Base_dData_dList_dList__x58__x58_ (dtb__63, dtb__64) -> (match dtb__64 with
  | Base_dData_dList.C_Base_dData_dList_dList_Nil -> (match ((v_Vuna_dCompiler_dFrontend_dToml_dlookupField dtb__63) fields) with
  | Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Nothing -> (Vuna_dCompiler_dBase_dDiag.C_Vuna_dCompiler_dBase_dDiag_dCheck_OkC (((Base_dData_dList.v_Base_dData_dList_dappend fields) (Base_dData_dList.C_Base_dData_dList_dList__x58__x58_ ({ Base_dData_dPair.f_Base_dData_dPair_dPair_first = dtb__63; Base_dData_dPair.f_Base_dData_dPair_dPair_second = (C_Vuna_dCompiler_dFrontend_dToml_dTomlNode_NodeTableArray ((Base_dData_dList.C_Base_dData_dList_dList__x58__x58_ (Base_dData_dList.C_Base_dData_dList_dList_Nil, Base_dData_dList.C_Base_dData_dList_dList_Nil)), line)) }, Base_dData_dList.C_Base_dData_dList_dList_Nil)))))
  | Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Just (dtb__65) -> (match dtb__65 with
  | C_Vuna_dCompiler_dFrontend_dToml_dTomlNode_NodeTableArray (dtb__66, dtb__67) -> (Vuna_dCompiler_dBase_dDiag.C_Vuna_dCompiler_dBase_dDiag_dCheck_OkC ((((v_Vuna_dCompiler_dFrontend_dToml_dreplaceField dtb__63) (C_Vuna_dCompiler_dFrontend_dToml_dTomlNode_NodeTableArray (((Base_dData_dList.v_Base_dData_dList_dappend dtb__66) (Base_dData_dList.C_Base_dData_dList_dList__x58__x58_ (Base_dData_dList.C_Base_dData_dList_dList_Nil, Base_dData_dList.C_Base_dData_dList_dList_Nil))), dtb__67))) fields)))
  | C_Vuna_dCompiler_dFrontend_dToml_dTomlNode_NodeTable (dtb__68, dtb__69, dtb__70) -> (((v_Vuna_dCompiler_dFrontend_dToml_dfailAt path) dtb__70) (String.concat "" ["table ["; dtb__63; "] cannot become a table array"]))
  | C_Vuna_dCompiler_dFrontend_dToml_dTomlNode_NodeLeaf (dtb__71, dtb__72) -> (((v_Vuna_dCompiler_dFrontend_dToml_dfailAt path) dtb__72) (String.concat "" ["key \""; dtb__63; "\" is not a table"]))
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
)
  | _ -> (match ((v_Vuna_dCompiler_dFrontend_dToml_dlookupField dtb__63) fields) with
  | Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Nothing -> (match (((((v_Vuna_dCompiler_dFrontend_dToml_dappendTableArray (fuel - 1)) path) line) dtb__64) Base_dData_dList.C_Base_dData_dList_dList_Nil) with
  | Vuna_dCompiler_dBase_dDiag.C_Vuna_dCompiler_dBase_dDiag_dCheck_ErrC (dtb__73) -> (Vuna_dCompiler_dBase_dDiag.C_Vuna_dCompiler_dBase_dDiag_dCheck_ErrC (dtb__73))
  | Vuna_dCompiler_dBase_dDiag.C_Vuna_dCompiler_dBase_dDiag_dCheck_OkC (dtb__74) -> (Vuna_dCompiler_dBase_dDiag.C_Vuna_dCompiler_dBase_dDiag_dCheck_OkC (((Base_dData_dList.v_Base_dData_dList_dappend fields) (Base_dData_dList.C_Base_dData_dList_dList__x58__x58_ ({ Base_dData_dPair.f_Base_dData_dPair_dPair_first = dtb__63; Base_dData_dPair.f_Base_dData_dPair_dPair_second = (C_Vuna_dCompiler_dFrontend_dToml_dTomlNode_NodeTable (dtb__74, C_Vuna_dCompiler_dFrontend_dToml_dTableKind_KindImplicit, line)) }, Base_dData_dList.C_Base_dData_dList_dList_Nil)))))
  | _ -> failwith "DT: impossible branch"
)
  | Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Just (dtb__75) -> (match dtb__75 with
  | C_Vuna_dCompiler_dFrontend_dToml_dTomlNode_NodeTable (dtb__76, dtb__77, dtb__78) -> (match (((((v_Vuna_dCompiler_dFrontend_dToml_dappendTableArray (fuel - 1)) path) line) dtb__64) dtb__76) with
  | Vuna_dCompiler_dBase_dDiag.C_Vuna_dCompiler_dBase_dDiag_dCheck_ErrC (dtb__79) -> (Vuna_dCompiler_dBase_dDiag.C_Vuna_dCompiler_dBase_dDiag_dCheck_ErrC (dtb__79))
  | Vuna_dCompiler_dBase_dDiag.C_Vuna_dCompiler_dBase_dDiag_dCheck_OkC (dtb__80) -> (Vuna_dCompiler_dBase_dDiag.C_Vuna_dCompiler_dBase_dDiag_dCheck_OkC ((((v_Vuna_dCompiler_dFrontend_dToml_dreplaceField dtb__63) (C_Vuna_dCompiler_dFrontend_dToml_dTomlNode_NodeTable (dtb__80, dtb__77, dtb__78))) fields)))
  | _ -> failwith "DT: impossible branch"
)
  | C_Vuna_dCompiler_dFrontend_dToml_dTomlNode_NodeTableArray (dtb__81, dtb__82) -> (match (v_Vuna_dCompiler_dFrontend_dToml_dlastFields dtb__81) with
  | Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Just (dtb__83) -> (match (((((v_Vuna_dCompiler_dFrontend_dToml_dappendTableArray (fuel - 1)) path) line) dtb__64) dtb__83) with
  | Vuna_dCompiler_dBase_dDiag.C_Vuna_dCompiler_dBase_dDiag_dCheck_ErrC (dtb__84) -> (Vuna_dCompiler_dBase_dDiag.C_Vuna_dCompiler_dBase_dDiag_dCheck_ErrC (dtb__84))
  | Vuna_dCompiler_dBase_dDiag.C_Vuna_dCompiler_dBase_dDiag_dCheck_OkC (dtb__85) -> (Vuna_dCompiler_dBase_dDiag.C_Vuna_dCompiler_dBase_dDiag_dCheck_OkC ((((v_Vuna_dCompiler_dFrontend_dToml_dreplaceField dtb__63) (C_Vuna_dCompiler_dFrontend_dToml_dTomlNode_NodeTableArray (((v_Vuna_dCompiler_dFrontend_dToml_dreplaceLastFields dtb__85) dtb__81), dtb__82))) fields)))
  | _ -> failwith "DT: impossible branch"
)
  | Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Nothing -> (((v_Vuna_dCompiler_dFrontend_dToml_dfailAt path) line) (String.concat "" ["table array \""; dtb__63; "\" has no current element"]))
  | _ -> failwith "DT: impossible branch"
)
  | C_Vuna_dCompiler_dFrontend_dToml_dTomlNode_NodeLeaf (dtb__86, dtb__87) -> (((v_Vuna_dCompiler_dFrontend_dToml_dfailAt path) dtb__87) (String.concat "" ["key \""; dtb__63; "\" is not a table"]))
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
)
)
  | Base_dData_dList.C_Base_dData_dList_dList_Nil -> (((v_Vuna_dCompiler_dFrontend_dToml_dfailAt path) line) "empty table array path")
  | _ -> failwith "DT: impossible branch"
)) pathSegs)))

# 273 "Vuna/Compiler/Frontend/Toml.vuna"
let v_Vuna_dCompiler_dFrontend_dToml_dsectionOfPath = (fun (pathSegs : string Base_dData_dList.t_Base_dData_dList_dList) -> ((fun nd_uscrut1 -> (match nd_uscrut1 with
  | Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Nothing -> Base_dData_dList.C_Base_dData_dList_dList_Nil
  | Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Just (dtb__88) -> (match dtb__88 with
  | { Base_dData_dPair.f_Base_dData_dPair_dPair_first = dtb__89; Base_dData_dPair.f_Base_dData_dPair_dPair_second = dtb__90 } -> dtb__89
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
)) (v_Vuna_dCompiler_dFrontend_dToml_dsplitLast pathSegs)))

# 279 "Vuna/Compiler/Frontend/Toml.vuna"
let v_Vuna_dCompiler_dFrontend_dToml_dduplicateKeyMsg = (fun (name : string) (section : string Base_dData_dList.t_Base_dData_dList_dList) -> (if ((v_Vuna_dCompiler_dFrontend_dToml_dlenInt section) = 0) then (String.concat "" ["duplicate key \""; name; "\""]) else (String.concat "" ["duplicate key \""; name; "\" in ["; (Vuna_dCompiler_dBase_dSource.v_Vuna_dCompiler_dBase_dSource_djoinDots section); "]"])))

# 287 "Vuna/Compiler/Frontend/Toml.vuna"
let rec v_Vuna_dCompiler_dFrontend_dToml_dinsertValue = (fun (fuel : int) (path : string) (line : int) (pathSegs : string Base_dData_dList.t_Base_dData_dList_dList) (section : string Base_dData_dList.t_Base_dData_dList_dList) (value : t_Vuna_dCompiler_dFrontend_dToml_dTomlValue) (fields : (string, t_Vuna_dCompiler_dFrontend_dToml_dTomlNode) Base_dData_dPair.t_Base_dData_dPair_dPair Base_dData_dList.t_Base_dData_dList_dList) -> (if (fuel <= 0) then (Vuna_dCompiler_dBase_dDiag.v_Vuna_dCompiler_dBase_dDiag_dicFuel "toml") else ((fun nd_uscrut7 -> (match nd_uscrut7 with
  | Base_dData_dList.C_Base_dData_dList_dList__x58__x58_ (dtb__91, dtb__92) -> (match dtb__92 with
  | Base_dData_dList.C_Base_dData_dList_dList_Nil -> (match ((v_Vuna_dCompiler_dFrontend_dToml_dlookupField dtb__91) fields) with
  | Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Nothing -> (Vuna_dCompiler_dBase_dDiag.C_Vuna_dCompiler_dBase_dDiag_dCheck_OkC (((Base_dData_dList.v_Base_dData_dList_dappend fields) (Base_dData_dList.C_Base_dData_dList_dList__x58__x58_ ({ Base_dData_dPair.f_Base_dData_dPair_dPair_first = dtb__91; Base_dData_dPair.f_Base_dData_dPair_dPair_second = (C_Vuna_dCompiler_dFrontend_dToml_dTomlNode_NodeLeaf (value, line)) }, Base_dData_dList.C_Base_dData_dList_dList_Nil)))))
  | Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Just (dtb__93) -> (match dtb__93 with
  | C_Vuna_dCompiler_dFrontend_dToml_dTomlNode_NodeLeaf (dtb__94, dtb__95) -> (((v_Vuna_dCompiler_dFrontend_dToml_dfailAt path) line) ((v_Vuna_dCompiler_dFrontend_dToml_dduplicateKeyMsg dtb__91) section))
  | _ -> (((v_Vuna_dCompiler_dFrontend_dToml_dfailAt path) line) (String.concat "" ["key \""; dtb__91; "\" conflicts with a table"]))
)
  | _ -> failwith "DT: impossible branch"
)
  | _ -> (match ((v_Vuna_dCompiler_dFrontend_dToml_dlookupField dtb__91) fields) with
  | Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Nothing -> (match (((((((v_Vuna_dCompiler_dFrontend_dToml_dinsertValue (fuel - 1)) path) line) dtb__92) section) value) Base_dData_dList.C_Base_dData_dList_dList_Nil) with
  | Vuna_dCompiler_dBase_dDiag.C_Vuna_dCompiler_dBase_dDiag_dCheck_ErrC (dtb__96) -> (Vuna_dCompiler_dBase_dDiag.C_Vuna_dCompiler_dBase_dDiag_dCheck_ErrC (dtb__96))
  | Vuna_dCompiler_dBase_dDiag.C_Vuna_dCompiler_dBase_dDiag_dCheck_OkC (dtb__97) -> (Vuna_dCompiler_dBase_dDiag.C_Vuna_dCompiler_dBase_dDiag_dCheck_OkC (((Base_dData_dList.v_Base_dData_dList_dappend fields) (Base_dData_dList.C_Base_dData_dList_dList__x58__x58_ ({ Base_dData_dPair.f_Base_dData_dPair_dPair_first = dtb__91; Base_dData_dPair.f_Base_dData_dPair_dPair_second = (C_Vuna_dCompiler_dFrontend_dToml_dTomlNode_NodeTable (dtb__97, C_Vuna_dCompiler_dFrontend_dToml_dTableKind_KindDotted, line)) }, Base_dData_dList.C_Base_dData_dList_dList_Nil)))))
  | _ -> failwith "DT: impossible branch"
)
  | Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Just (dtb__98) -> (match dtb__98 with
  | C_Vuna_dCompiler_dFrontend_dToml_dTomlNode_NodeTable (dtb__99, dtb__100, dtb__101) -> (match (((((((v_Vuna_dCompiler_dFrontend_dToml_dinsertValue (fuel - 1)) path) line) dtb__92) section) value) dtb__99) with
  | Vuna_dCompiler_dBase_dDiag.C_Vuna_dCompiler_dBase_dDiag_dCheck_ErrC (dtb__102) -> (Vuna_dCompiler_dBase_dDiag.C_Vuna_dCompiler_dBase_dDiag_dCheck_ErrC (dtb__102))
  | Vuna_dCompiler_dBase_dDiag.C_Vuna_dCompiler_dBase_dDiag_dCheck_OkC (dtb__103) -> (Vuna_dCompiler_dBase_dDiag.C_Vuna_dCompiler_dBase_dDiag_dCheck_OkC ((((v_Vuna_dCompiler_dFrontend_dToml_dreplaceField dtb__91) (C_Vuna_dCompiler_dFrontend_dToml_dTomlNode_NodeTable (dtb__103, dtb__100, dtb__101))) fields)))
  | _ -> failwith "DT: impossible branch"
)
  | C_Vuna_dCompiler_dFrontend_dToml_dTomlNode_NodeTableArray (dtb__104, dtb__105) -> (match (v_Vuna_dCompiler_dFrontend_dToml_dlastFields dtb__104) with
  | Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Just (dtb__106) -> (match (((((((v_Vuna_dCompiler_dFrontend_dToml_dinsertValue (fuel - 1)) path) line) dtb__92) section) value) dtb__106) with
  | Vuna_dCompiler_dBase_dDiag.C_Vuna_dCompiler_dBase_dDiag_dCheck_ErrC (dtb__107) -> (Vuna_dCompiler_dBase_dDiag.C_Vuna_dCompiler_dBase_dDiag_dCheck_ErrC (dtb__107))
  | Vuna_dCompiler_dBase_dDiag.C_Vuna_dCompiler_dBase_dDiag_dCheck_OkC (dtb__108) -> (Vuna_dCompiler_dBase_dDiag.C_Vuna_dCompiler_dBase_dDiag_dCheck_OkC ((((v_Vuna_dCompiler_dFrontend_dToml_dreplaceField dtb__91) (C_Vuna_dCompiler_dFrontend_dToml_dTomlNode_NodeTableArray (((v_Vuna_dCompiler_dFrontend_dToml_dreplaceLastFields dtb__108) dtb__104), dtb__105))) fields)))
  | _ -> failwith "DT: impossible branch"
)
  | Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Nothing -> (((v_Vuna_dCompiler_dFrontend_dToml_dfailAt path) line) (String.concat "" ["table array \""; dtb__91; "\" has no current element"]))
  | _ -> failwith "DT: impossible branch"
)
  | C_Vuna_dCompiler_dFrontend_dToml_dTomlNode_NodeLeaf (dtb__109, dtb__110) -> (((v_Vuna_dCompiler_dFrontend_dToml_dfailAt path) dtb__110) (String.concat "" ["key \""; dtb__91; "\" is not a table"]))
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
)
)
  | Base_dData_dList.C_Base_dData_dList_dList_Nil -> (((v_Vuna_dCompiler_dFrontend_dToml_dfailAt path) line) "empty key")
  | _ -> failwith "DT: impossible branch"
)) pathSegs)))

# 345 "Vuna/Compiler/Frontend/Toml.vuna"
let rec v_Vuna_dCompiler_dFrontend_dToml_dflattenLeaf = (fun (mc0 : int) (mc1 : string Base_dData_dList.t_Base_dData_dList_dList) (mc2 : t_Vuna_dCompiler_dFrontend_dToml_dTomlValue) (mc3 : int) -> (match mc2 with
  | C_Vuna_dCompiler_dFrontend_dToml_dTomlValue_TTable (dtb__111) -> ((((v_Vuna_dCompiler_dFrontend_dToml_dflattenLeafFields (mc0 - 1)) mc1) dtb__111) mc3)
  | _ -> ((fun nd_uscrut4 -> (match nd_uscrut4 with
  | Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Just (dtb__112) -> (match dtb__112 with
  | { Base_dData_dPair.f_Base_dData_dPair_dPair_first = dtb__113; Base_dData_dPair.f_Base_dData_dPair_dPair_second = dtb__114 } -> (Base_dData_dList.C_Base_dData_dList_dList__x58__x58_ ({ f_Vuna_dCompiler_dFrontend_dToml_dTomlEntry_tomlEntrySection = dtb__113; f_Vuna_dCompiler_dFrontend_dToml_dTomlEntry_tomlEntryKey = dtb__114; f_Vuna_dCompiler_dFrontend_dToml_dTomlEntry_tomlEntryValue = mc2; f_Vuna_dCompiler_dFrontend_dToml_dTomlEntry_tomlEntryLine = mc3 }, Base_dData_dList.C_Base_dData_dList_dList_Nil))
  | _ -> failwith "DT: impossible branch"
)
  | Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Nothing -> Base_dData_dList.C_Base_dData_dList_dList_Nil
  | _ -> failwith "DT: impossible branch"
)) (v_Vuna_dCompiler_dFrontend_dToml_dsplitLast mc1))
))
# 352 "Vuna/Compiler/Frontend/Toml.vuna"
and v_Vuna_dCompiler_dFrontend_dToml_dflattenLeafFields = (fun (mc0 : int) (mc1 : string Base_dData_dList.t_Base_dData_dList_dList) (mc2 : (string, t_Vuna_dCompiler_dFrontend_dToml_dTomlValue) Base_dData_dPair.t_Base_dData_dPair_dPair Base_dData_dList.t_Base_dData_dList_dList) (mc3 : int) -> (match mc2 with
  | Base_dData_dList.C_Base_dData_dList_dList__x58__x58_ (dtb__115, dtb__116) -> ((Base_dData_dList.v_Base_dData_dList_dappend ((((v_Vuna_dCompiler_dFrontend_dToml_dflattenLeaf (mc0 - 1)) ((v_Vuna_dCompiler_dFrontend_dToml_dappendPath mc1) (Base_dData_dList.C_Base_dData_dList_dList__x58__x58_ ((Base_dData_dPair.v_Base_dData_dPair_dfirstOf dtb__115), Base_dData_dList.C_Base_dData_dList_dList_Nil)))) (Base_dData_dPair.v_Base_dData_dPair_dsecondOf dtb__115)) mc3)) ((((v_Vuna_dCompiler_dFrontend_dToml_dflattenLeafFields (mc0 - 1)) mc1) dtb__116) mc3))
  | Base_dData_dList.C_Base_dData_dList_dList_Nil -> Base_dData_dList.C_Base_dData_dList_dList_Nil
  | _ -> failwith "DT: impossible branch"
))

# 325 "Vuna/Compiler/Frontend/Toml.vuna"
let rec v_Vuna_dCompiler_dFrontend_dToml_dflattenFields = (fun (mc0 : int) (mc1 : string Base_dData_dList.t_Base_dData_dList_dList) (mc2 : (string, t_Vuna_dCompiler_dFrontend_dToml_dTomlNode) Base_dData_dPair.t_Base_dData_dPair_dPair Base_dData_dList.t_Base_dData_dList_dList) -> (match mc2 with
  | Base_dData_dList.C_Base_dData_dList_dList__x58__x58_ (dtb__117, dtb__118) -> ((Base_dData_dList.v_Base_dData_dList_dappend (((v_Vuna_dCompiler_dFrontend_dToml_dflattenNode (mc0 - 1)) ((v_Vuna_dCompiler_dFrontend_dToml_dappendPath mc1) (Base_dData_dList.C_Base_dData_dList_dList__x58__x58_ ((Base_dData_dPair.v_Base_dData_dPair_dfirstOf dtb__117), Base_dData_dList.C_Base_dData_dList_dList_Nil)))) (Base_dData_dPair.v_Base_dData_dPair_dsecondOf dtb__117))) (((v_Vuna_dCompiler_dFrontend_dToml_dflattenFields (mc0 - 1)) mc1) dtb__118))
  | Base_dData_dList.C_Base_dData_dList_dList_Nil -> Base_dData_dList.C_Base_dData_dList_dList_Nil
  | _ -> failwith "DT: impossible branch"
))
# 332 "Vuna/Compiler/Frontend/Toml.vuna"
and v_Vuna_dCompiler_dFrontend_dToml_dflattenNode = (fun (mc0 : int) (mc1 : string Base_dData_dList.t_Base_dData_dList_dList) (mc2 : t_Vuna_dCompiler_dFrontend_dToml_dTomlNode) -> (match mc2 with
  | C_Vuna_dCompiler_dFrontend_dToml_dTomlNode_NodeTableArray (dtb__119, dtb__120) -> ((((v_Vuna_dCompiler_dFrontend_dToml_dflattenElems (mc0 - 1)) 0) mc1) dtb__119)
  | C_Vuna_dCompiler_dFrontend_dToml_dTomlNode_NodeTable (dtb__121, dtb__122, dtb__123) -> (((v_Vuna_dCompiler_dFrontend_dToml_dflattenFields (mc0 - 1)) mc1) dtb__121)
  | C_Vuna_dCompiler_dFrontend_dToml_dTomlNode_NodeLeaf (dtb__124, dtb__125) -> ((((v_Vuna_dCompiler_dFrontend_dToml_dflattenLeaf (mc0 - 1)) mc1) dtb__124) dtb__125)
  | _ -> failwith "DT: impossible branch"
))
# 337 "Vuna/Compiler/Frontend/Toml.vuna"
and v_Vuna_dCompiler_dFrontend_dToml_dflattenElems = (fun (mc0 : int) (mc1 : int) (mc2 : string Base_dData_dList.t_Base_dData_dList_dList) (mc3 : (string, t_Vuna_dCompiler_dFrontend_dToml_dTomlNode) Base_dData_dPair.t_Base_dData_dPair_dPair Base_dData_dList.t_Base_dData_dList_dList Base_dData_dList.t_Base_dData_dList_dList) -> (match mc3 with
  | Base_dData_dList.C_Base_dData_dList_dList__x58__x58_ (dtb__126, dtb__127) -> ((Base_dData_dList.v_Base_dData_dList_dappend (((v_Vuna_dCompiler_dFrontend_dToml_dflattenFields (mc0 - 1)) ((v_Vuna_dCompiler_dFrontend_dToml_dappendPath mc2) (Base_dData_dList.C_Base_dData_dList_dList__x58__x58_ ((bi_strFromInt mc1), Base_dData_dList.C_Base_dData_dList_dList_Nil)))) dtb__126)) ((((v_Vuna_dCompiler_dFrontend_dToml_dflattenElems (mc0 - 1)) (mc1 + 1)) mc2) dtb__127))
  | Base_dData_dList.C_Base_dData_dList_dList_Nil -> Base_dData_dList.C_Base_dData_dList_dList_Nil
  | _ -> failwith "DT: impossible branch"
))

# 360 "Vuna/Compiler/Frontend/Toml.vuna"
let rec v_Vuna_dCompiler_dFrontend_dToml_dnodeValue = (fun (mc0 : int) (mc1 : t_Vuna_dCompiler_dFrontend_dToml_dTomlNode) -> (match mc1 with
  | C_Vuna_dCompiler_dFrontend_dToml_dTomlNode_NodeTableArray (dtb__128, dtb__129) -> (C_Vuna_dCompiler_dFrontend_dToml_dTomlValue_TTableArray (((v_Vuna_dCompiler_dFrontend_dToml_dtableFields (mc0 - 1)) dtb__128)))
  | C_Vuna_dCompiler_dFrontend_dToml_dTomlNode_NodeTable (dtb__130, dtb__131, dtb__132) -> (C_Vuna_dCompiler_dFrontend_dToml_dTomlValue_TTable (((v_Vuna_dCompiler_dFrontend_dToml_dfieldValues (mc0 - 1)) dtb__130)))
  | C_Vuna_dCompiler_dFrontend_dToml_dTomlNode_NodeLeaf (dtb__133, dtb__134) -> dtb__133
  | _ -> failwith "DT: impossible branch"
))
# 365 "Vuna/Compiler/Frontend/Toml.vuna"
and v_Vuna_dCompiler_dFrontend_dToml_dfieldValues = (fun (mc0 : int) (mc1 : (string, t_Vuna_dCompiler_dFrontend_dToml_dTomlNode) Base_dData_dPair.t_Base_dData_dPair_dPair Base_dData_dList.t_Base_dData_dList_dList) -> (match mc1 with
  | Base_dData_dList.C_Base_dData_dList_dList__x58__x58_ (dtb__135, dtb__136) -> (Base_dData_dList.C_Base_dData_dList_dList__x58__x58_ ({ Base_dData_dPair.f_Base_dData_dPair_dPair_first = (Base_dData_dPair.v_Base_dData_dPair_dfirstOf dtb__135); Base_dData_dPair.f_Base_dData_dPair_dPair_second = ((v_Vuna_dCompiler_dFrontend_dToml_dnodeValue (mc0 - 1)) (Base_dData_dPair.v_Base_dData_dPair_dsecondOf dtb__135)) }, ((v_Vuna_dCompiler_dFrontend_dToml_dfieldValues (mc0 - 1)) dtb__136)))
  | Base_dData_dList.C_Base_dData_dList_dList_Nil -> Base_dData_dList.C_Base_dData_dList_dList_Nil
  | _ -> failwith "DT: impossible branch"
))
# 370 "Vuna/Compiler/Frontend/Toml.vuna"
and v_Vuna_dCompiler_dFrontend_dToml_dtableFields = (fun (mc0 : int) (mc1 : (string, t_Vuna_dCompiler_dFrontend_dToml_dTomlNode) Base_dData_dPair.t_Base_dData_dPair_dPair Base_dData_dList.t_Base_dData_dList_dList Base_dData_dList.t_Base_dData_dList_dList) -> (match mc1 with
  | Base_dData_dList.C_Base_dData_dList_dList__x58__x58_ (dtb__137, dtb__138) -> (Base_dData_dList.C_Base_dData_dList_dList__x58__x58_ (((v_Vuna_dCompiler_dFrontend_dToml_dfieldValues (mc0 - 1)) dtb__137), ((v_Vuna_dCompiler_dFrontend_dToml_dtableFields (mc0 - 1)) dtb__138)))
  | Base_dData_dList.C_Base_dData_dList_dList_Nil -> Base_dData_dList.C_Base_dData_dList_dList_Nil
  | _ -> failwith "DT: impossible branch"
))

# 374 "Vuna/Compiler/Frontend/Toml.vuna"
let v_Vuna_dCompiler_dFrontend_dToml_drootValue = (fun (fuel : int) (fields : (string, t_Vuna_dCompiler_dFrontend_dToml_dTomlNode) Base_dData_dPair.t_Base_dData_dPair_dPair Base_dData_dList.t_Base_dData_dList_dList) -> ((v_Vuna_dCompiler_dFrontend_dToml_dfieldValues fuel) fields))

# 379 "Vuna/Compiler/Frontend/Toml.vuna"
let rec v_Vuna_dCompiler_dFrontend_dToml_dskipBlank = (fun (mc0 : t_Vuna_dCompiler_dFrontend_dToml_dTomlCursor) -> (match mc0 with
  | { f_Vuna_dCompiler_dFrontend_dToml_dTomlCursor_cursorChars = dtb__139; f_Vuna_dCompiler_dFrontend_dToml_dTomlCursor_cursorLine = dtb__140; f_Vuna_dCompiler_dFrontend_dToml_dTomlCursor_cursorCol = dtb__141 } -> (match dtb__139 with
  | Base_dData_dList.C_Base_dData_dList_dList__x58__x58_ (dtb__142, dtb__143) -> (if (v_Vuna_dCompiler_dFrontend_dToml_disBlankChar dtb__142) then (v_Vuna_dCompiler_dFrontend_dToml_dskipBlank { f_Vuna_dCompiler_dFrontend_dToml_dTomlCursor_cursorChars = dtb__143; f_Vuna_dCompiler_dFrontend_dToml_dTomlCursor_cursorLine = dtb__140; f_Vuna_dCompiler_dFrontend_dToml_dTomlCursor_cursorCol = (dtb__141 + 1) }) else { f_Vuna_dCompiler_dFrontend_dToml_dTomlCursor_cursorChars = (Base_dData_dList.C_Base_dData_dList_dList__x58__x58_ (dtb__142, dtb__143)); f_Vuna_dCompiler_dFrontend_dToml_dTomlCursor_cursorLine = dtb__140; f_Vuna_dCompiler_dFrontend_dToml_dTomlCursor_cursorCol = dtb__141 })
  | Base_dData_dList.C_Base_dData_dList_dList_Nil -> { f_Vuna_dCompiler_dFrontend_dToml_dTomlCursor_cursorChars = Base_dData_dList.C_Base_dData_dList_dList_Nil; f_Vuna_dCompiler_dFrontend_dToml_dTomlCursor_cursorLine = dtb__140; f_Vuna_dCompiler_dFrontend_dToml_dTomlCursor_cursorCol = dtb__141 }
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
))

# 388 "Vuna/Compiler/Frontend/Toml.vuna"
let rec v_Vuna_dCompiler_dFrontend_dToml_dskipComment = (fun (mc0 : t_Vuna_dCompiler_dFrontend_dToml_dTomlCursor) -> (match mc0 with
  | { f_Vuna_dCompiler_dFrontend_dToml_dTomlCursor_cursorChars = dtb__144; f_Vuna_dCompiler_dFrontend_dToml_dTomlCursor_cursorLine = dtb__145; f_Vuna_dCompiler_dFrontend_dToml_dTomlCursor_cursorCol = dtb__146 } -> (match dtb__144 with
  | Base_dData_dList.C_Base_dData_dList_dList__x58__x58_ (dtb__147, dtb__148) -> (if (dtb__147 = 10) then { f_Vuna_dCompiler_dFrontend_dToml_dTomlCursor_cursorChars = (Base_dData_dList.C_Base_dData_dList_dList__x58__x58_ (dtb__147, dtb__148)); f_Vuna_dCompiler_dFrontend_dToml_dTomlCursor_cursorLine = dtb__145; f_Vuna_dCompiler_dFrontend_dToml_dTomlCursor_cursorCol = dtb__146 } else (v_Vuna_dCompiler_dFrontend_dToml_dskipComment { f_Vuna_dCompiler_dFrontend_dToml_dTomlCursor_cursorChars = dtb__148; f_Vuna_dCompiler_dFrontend_dToml_dTomlCursor_cursorLine = dtb__145; f_Vuna_dCompiler_dFrontend_dToml_dTomlCursor_cursorCol = (dtb__146 + 1) }))
  | Base_dData_dList.C_Base_dData_dList_dList_Nil -> { f_Vuna_dCompiler_dFrontend_dToml_dTomlCursor_cursorChars = Base_dData_dList.C_Base_dData_dList_dList_Nil; f_Vuna_dCompiler_dFrontend_dToml_dTomlCursor_cursorLine = dtb__145; f_Vuna_dCompiler_dFrontend_dToml_dTomlCursor_cursorCol = dtb__146 }
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
))

# 397 "Vuna/Compiler/Frontend/Toml.vuna"
let rec v_Vuna_dCompiler_dFrontend_dToml_dskipGapGo = (fun (mc0 : bool) (mc1 : t_Vuna_dCompiler_dFrontend_dToml_dTomlCursor) -> (match mc1 with
  | { f_Vuna_dCompiler_dFrontend_dToml_dTomlCursor_cursorChars = dtb__149; f_Vuna_dCompiler_dFrontend_dToml_dTomlCursor_cursorLine = dtb__150; f_Vuna_dCompiler_dFrontend_dToml_dTomlCursor_cursorCol = dtb__151 } -> (match dtb__149 with
  | Base_dData_dList.C_Base_dData_dList_dList__x58__x58_ (dtb__152, dtb__153) -> (if mc0 then (if (dtb__152 = 10) then ((v_Vuna_dCompiler_dFrontend_dToml_dskipGapGo false) { f_Vuna_dCompiler_dFrontend_dToml_dTomlCursor_cursorChars = dtb__153; f_Vuna_dCompiler_dFrontend_dToml_dTomlCursor_cursorLine = (dtb__150 + 1); f_Vuna_dCompiler_dFrontend_dToml_dTomlCursor_cursorCol = 1 }) else ((v_Vuna_dCompiler_dFrontend_dToml_dskipGapGo true) { f_Vuna_dCompiler_dFrontend_dToml_dTomlCursor_cursorChars = dtb__153; f_Vuna_dCompiler_dFrontend_dToml_dTomlCursor_cursorLine = dtb__150; f_Vuna_dCompiler_dFrontend_dToml_dTomlCursor_cursorCol = (dtb__151 + 1) })) else (if (v_Vuna_dCompiler_dFrontend_dToml_disBlankChar dtb__152) then ((v_Vuna_dCompiler_dFrontend_dToml_dskipGapGo false) { f_Vuna_dCompiler_dFrontend_dToml_dTomlCursor_cursorChars = dtb__153; f_Vuna_dCompiler_dFrontend_dToml_dTomlCursor_cursorLine = dtb__150; f_Vuna_dCompiler_dFrontend_dToml_dTomlCursor_cursorCol = (dtb__151 + 1) }) else (if (dtb__152 = 10) then ((v_Vuna_dCompiler_dFrontend_dToml_dskipGapGo false) { f_Vuna_dCompiler_dFrontend_dToml_dTomlCursor_cursorChars = dtb__153; f_Vuna_dCompiler_dFrontend_dToml_dTomlCursor_cursorLine = (dtb__150 + 1); f_Vuna_dCompiler_dFrontend_dToml_dTomlCursor_cursorCol = 1 }) else (if (dtb__152 = 35) then ((v_Vuna_dCompiler_dFrontend_dToml_dskipGapGo true) { f_Vuna_dCompiler_dFrontend_dToml_dTomlCursor_cursorChars = dtb__153; f_Vuna_dCompiler_dFrontend_dToml_dTomlCursor_cursorLine = dtb__150; f_Vuna_dCompiler_dFrontend_dToml_dTomlCursor_cursorCol = (dtb__151 + 1) }) else { f_Vuna_dCompiler_dFrontend_dToml_dTomlCursor_cursorChars = (Base_dData_dList.C_Base_dData_dList_dList__x58__x58_ (dtb__152, dtb__153)); f_Vuna_dCompiler_dFrontend_dToml_dTomlCursor_cursorLine = dtb__150; f_Vuna_dCompiler_dFrontend_dToml_dTomlCursor_cursorCol = dtb__151 }))))
  | Base_dData_dList.C_Base_dData_dList_dList_Nil -> { f_Vuna_dCompiler_dFrontend_dToml_dTomlCursor_cursorChars = Base_dData_dList.C_Base_dData_dList_dList_Nil; f_Vuna_dCompiler_dFrontend_dToml_dTomlCursor_cursorLine = dtb__150; f_Vuna_dCompiler_dFrontend_dToml_dTomlCursor_cursorCol = dtb__151 }
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
))

# 394 "Vuna/Compiler/Frontend/Toml.vuna"
let v_Vuna_dCompiler_dFrontend_dToml_dskipGap = (fun (cs : t_Vuna_dCompiler_dFrontend_dToml_dTomlCursor) -> ((v_Vuna_dCompiler_dFrontend_dToml_dskipGapGo false) cs))

# 412 "Vuna/Compiler/Frontend/Toml.vuna"
let v_Vuna_dCompiler_dFrontend_dToml_dutf8OfCode = (fun (c : int) -> (if (c < 128) then (Base_dData_dList.C_Base_dData_dList_dList__x58__x58_ (c, Base_dData_dList.C_Base_dData_dList_dList_Nil)) else (if (c < 2048) then (Base_dData_dList.C_Base_dData_dList_dList__x58__x58_ ((192 + ((Base_dData_dBits.v_Base_dData_dBits_dshr c) 6)), (Base_dData_dList.C_Base_dData_dList_dList__x58__x58_ ((128 + ((Base_dData_dBits.v_Base_dData_dBits_dband c) 63)), Base_dData_dList.C_Base_dData_dList_dList_Nil)))) else (if (c < 65536) then (Base_dData_dList.C_Base_dData_dList_dList__x58__x58_ ((224 + ((Base_dData_dBits.v_Base_dData_dBits_dshr c) 12)), (Base_dData_dList.C_Base_dData_dList_dList__x58__x58_ ((128 + ((Base_dData_dBits.v_Base_dData_dBits_dband ((Base_dData_dBits.v_Base_dData_dBits_dshr c) 6)) 63)), (Base_dData_dList.C_Base_dData_dList_dList__x58__x58_ ((128 + ((Base_dData_dBits.v_Base_dData_dBits_dband c) 63)), Base_dData_dList.C_Base_dData_dList_dList_Nil)))))) else (Base_dData_dList.C_Base_dData_dList_dList__x58__x58_ ((240 + ((Base_dData_dBits.v_Base_dData_dBits_dshr c) 18)), (Base_dData_dList.C_Base_dData_dList_dList__x58__x58_ ((128 + ((Base_dData_dBits.v_Base_dData_dBits_dband ((Base_dData_dBits.v_Base_dData_dBits_dshr c) 12)) 63)), (Base_dData_dList.C_Base_dData_dList_dList__x58__x58_ ((128 + ((Base_dData_dBits.v_Base_dData_dBits_dband ((Base_dData_dBits.v_Base_dData_dBits_dshr c) 6)) 63)), (Base_dData_dList.C_Base_dData_dList_dList__x58__x58_ ((128 + ((Base_dData_dBits.v_Base_dData_dBits_dband c) 63)), Base_dData_dList.C_Base_dData_dList_dList_Nil))))))))))))

# 423 "Vuna/Compiler/Frontend/Toml.vuna"
let v_Vuna_dCompiler_dFrontend_dToml_disSurrogate = (fun (c : int) -> (if (c >= 55296) then (c <= 57343) else false))

# 478 "Vuna/Compiler/Frontend/Toml.vuna"
let rec v_Vuna_dCompiler_dFrontend_dToml_dparseHexCode = (fun (fuel : int) (digits : int) (path : string) (cs : t_Vuna_dCompiler_dFrontend_dToml_dTomlCursor) (count : int) (acc : int) -> (if (count >= digits) then (Vuna_dCompiler_dBase_dDiag.C_Vuna_dCompiler_dBase_dDiag_dCheck_OkC ({ Base_dData_dPair.f_Base_dData_dPair_dPair_first = acc; Base_dData_dPair.f_Base_dData_dPair_dPair_second = cs })) else (if (fuel <= 0) then (Vuna_dCompiler_dBase_dDiag.v_Vuna_dCompiler_dBase_dDiag_dicFuel "toml") else (match (cs).f_Vuna_dCompiler_dFrontend_dToml_dTomlCursor_cursorChars with
  | Base_dData_dList.C_Base_dData_dList_dList_Nil -> (((v_Vuna_dCompiler_dFrontend_dToml_dfailAt path) (cs).f_Vuna_dCompiler_dFrontend_dToml_dTomlCursor_cursorLine) "unterminated unicode escape")
  | Base_dData_dList.C_Base_dData_dList_dList__x58__x58_ (dtb__154, dtb__155) -> (if (v_Vuna_dCompiler_dFrontend_dToml_disHexDigit dtb__154) then ((((((v_Vuna_dCompiler_dFrontend_dToml_dparseHexCode (fuel - 1)) digits) path) (v_Vuna_dCompiler_dFrontend_dToml_dadvanceCursor cs)) (count + 1)) ((acc * 16) + (v_Vuna_dCompiler_dFrontend_dToml_dhexValue dtb__154))) else (((v_Vuna_dCompiler_dFrontend_dToml_dfailAt path) (cs).f_Vuna_dCompiler_dFrontend_dToml_dTomlCursor_cursorLine) "invalid hex digit in unicode escape"))
  | _ -> failwith "DT: impossible branch"
))))

# 434 "Vuna/Compiler/Frontend/Toml.vuna"
let rec v_Vuna_dCompiler_dFrontend_dToml_dparseBasicChars = (fun (fuel : int) (path : string) (startCs : t_Vuna_dCompiler_dFrontend_dToml_dTomlCursor) (cs : t_Vuna_dCompiler_dFrontend_dToml_dTomlCursor) (acc : int Base_dData_dList.t_Base_dData_dList_dList) -> (if (fuel <= 0) then (Vuna_dCompiler_dBase_dDiag.v_Vuna_dCompiler_dBase_dDiag_dicFuel "toml") else (match (cs).f_Vuna_dCompiler_dFrontend_dToml_dTomlCursor_cursorChars with
  | Base_dData_dList.C_Base_dData_dList_dList_Nil -> (((v_Vuna_dCompiler_dFrontend_dToml_dfailAt path) (startCs).f_Vuna_dCompiler_dFrontend_dToml_dTomlCursor_cursorLine) "unterminated basic string")
  | Base_dData_dList.C_Base_dData_dList_dList__x58__x58_ (dtb__156, dtb__157) -> (if (dtb__156 = 34) then (Vuna_dCompiler_dBase_dDiag.C_Vuna_dCompiler_dBase_dDiag_dCheck_OkC ({ Base_dData_dPair.f_Base_dData_dPair_dPair_first = (Base_dData_dList.dtp_pack (Base_dData_dList.v_Base_dData_dList_dreverse acc)); Base_dData_dPair.f_Base_dData_dPair_dPair_second = (v_Vuna_dCompiler_dFrontend_dToml_dadvanceCursor cs) })) else (if (dtb__156 = 10) then (((v_Vuna_dCompiler_dFrontend_dToml_dfailAt path) (startCs).f_Vuna_dCompiler_dFrontend_dToml_dTomlCursor_cursorLine) "unterminated basic string (newline in string)") else (if (dtb__156 = 92) then (((((v_Vuna_dCompiler_dFrontend_dToml_dparseBasicEscape (fuel - 1)) path) startCs) (v_Vuna_dCompiler_dFrontend_dToml_dadvanceCursor cs)) acc) else (((((v_Vuna_dCompiler_dFrontend_dToml_dparseBasicChars (fuel - 1)) path) startCs) (v_Vuna_dCompiler_dFrontend_dToml_dadvanceCursor cs)) (Base_dData_dList.C_Base_dData_dList_dList__x58__x58_ (dtb__156, acc))))))
  | _ -> failwith "DT: impossible branch"
)))
# 448 "Vuna/Compiler/Frontend/Toml.vuna"
and v_Vuna_dCompiler_dFrontend_dToml_dparseBasicEscape = (fun (fuel : int) (path : string) (startCs : t_Vuna_dCompiler_dFrontend_dToml_dTomlCursor) (cs : t_Vuna_dCompiler_dFrontend_dToml_dTomlCursor) (acc : int Base_dData_dList.t_Base_dData_dList_dList) -> (if (fuel <= 0) then (Vuna_dCompiler_dBase_dDiag.v_Vuna_dCompiler_dBase_dDiag_dicFuel "toml") else (match (cs).f_Vuna_dCompiler_dFrontend_dToml_dTomlCursor_cursorChars with
  | Base_dData_dList.C_Base_dData_dList_dList_Nil -> (((v_Vuna_dCompiler_dFrontend_dToml_dfailAt path) (startCs).f_Vuna_dCompiler_dFrontend_dToml_dTomlCursor_cursorLine) "unterminated escape sequence")
  | Base_dData_dList.C_Base_dData_dList_dList__x58__x58_ (dtb__158, dtb__159) -> (if (dtb__158 = 110) then (((((v_Vuna_dCompiler_dFrontend_dToml_dparseBasicChars (fuel - 1)) path) startCs) (v_Vuna_dCompiler_dFrontend_dToml_dadvanceCursor cs)) (Base_dData_dList.C_Base_dData_dList_dList__x58__x58_ (10, acc))) else (if (dtb__158 = 116) then (((((v_Vuna_dCompiler_dFrontend_dToml_dparseBasicChars (fuel - 1)) path) startCs) (v_Vuna_dCompiler_dFrontend_dToml_dadvanceCursor cs)) (Base_dData_dList.C_Base_dData_dList_dList__x58__x58_ (9, acc))) else (if (dtb__158 = 114) then (((((v_Vuna_dCompiler_dFrontend_dToml_dparseBasicChars (fuel - 1)) path) startCs) (v_Vuna_dCompiler_dFrontend_dToml_dadvanceCursor cs)) (Base_dData_dList.C_Base_dData_dList_dList__x58__x58_ (13, acc))) else (if (dtb__158 = 98) then (((((v_Vuna_dCompiler_dFrontend_dToml_dparseBasicChars (fuel - 1)) path) startCs) (v_Vuna_dCompiler_dFrontend_dToml_dadvanceCursor cs)) (Base_dData_dList.C_Base_dData_dList_dList__x58__x58_ (8, acc))) else (if (dtb__158 = 102) then (((((v_Vuna_dCompiler_dFrontend_dToml_dparseBasicChars (fuel - 1)) path) startCs) (v_Vuna_dCompiler_dFrontend_dToml_dadvanceCursor cs)) (Base_dData_dList.C_Base_dData_dList_dList__x58__x58_ (12, acc))) else (if (dtb__158 = 34) then (((((v_Vuna_dCompiler_dFrontend_dToml_dparseBasicChars (fuel - 1)) path) startCs) (v_Vuna_dCompiler_dFrontend_dToml_dadvanceCursor cs)) (Base_dData_dList.C_Base_dData_dList_dList__x58__x58_ (34, acc))) else (if (dtb__158 = 92) then (((((v_Vuna_dCompiler_dFrontend_dToml_dparseBasicChars (fuel - 1)) path) startCs) (v_Vuna_dCompiler_dFrontend_dToml_dadvanceCursor cs)) (Base_dData_dList.C_Base_dData_dList_dList__x58__x58_ (92, acc))) else (if (dtb__158 = 117) then ((((((v_Vuna_dCompiler_dFrontend_dToml_dparseUnicodeEscape (fuel - 1)) 4) path) startCs) (v_Vuna_dCompiler_dFrontend_dToml_dadvanceCursor cs)) acc) else (if (dtb__158 = 85) then ((((((v_Vuna_dCompiler_dFrontend_dToml_dparseUnicodeEscape (fuel - 1)) 8) path) startCs) (v_Vuna_dCompiler_dFrontend_dToml_dadvanceCursor cs)) acc) else (((v_Vuna_dCompiler_dFrontend_dToml_dfailAt path) (cs).f_Vuna_dCompiler_dFrontend_dToml_dTomlCursor_cursorLine) ("unknown escape sequence \\" ^ (Base_dData_dList.dtp_pack (Base_dData_dList.C_Base_dData_dList_dList__x58__x58_ (dtb__158, Base_dData_dList.C_Base_dData_dList_dList_Nil))))))))))))))
  | _ -> failwith "DT: impossible branch"
)))
# 468 "Vuna/Compiler/Frontend/Toml.vuna"
and v_Vuna_dCompiler_dFrontend_dToml_dparseUnicodeEscape = (fun (fuel : int) (digits : int) (path : string) (startCs : t_Vuna_dCompiler_dFrontend_dToml_dTomlCursor) (cs : t_Vuna_dCompiler_dFrontend_dToml_dTomlCursor) (acc : int Base_dData_dList.t_Base_dData_dList_dList) -> (if (fuel <= 0) then (Vuna_dCompiler_dBase_dDiag.v_Vuna_dCompiler_dBase_dDiag_dicFuel "toml") else ((fun nd_uscrut6 -> (match nd_uscrut6 with
  | Vuna_dCompiler_dBase_dDiag.C_Vuna_dCompiler_dBase_dDiag_dCheck_OkC (dtb__160) -> (match dtb__160 with
  | { Base_dData_dPair.f_Base_dData_dPair_dPair_first = dtb__161; Base_dData_dPair.f_Base_dData_dPair_dPair_second = dtb__162 } -> (if (dtb__161 > 1114111) then (((v_Vuna_dCompiler_dFrontend_dToml_dfailAt path) (startCs).f_Vuna_dCompiler_dFrontend_dToml_dTomlCursor_cursorLine) "unicode escape out of range") else (if (v_Vuna_dCompiler_dFrontend_dToml_disSurrogate dtb__161) then (((v_Vuna_dCompiler_dFrontend_dToml_dfailAt path) (startCs).f_Vuna_dCompiler_dFrontend_dToml_dTomlCursor_cursorLine) "unicode escape is a surrogate code point") else (((((v_Vuna_dCompiler_dFrontend_dToml_dparseBasicChars (fuel - 1)) path) startCs) dtb__162) ((Base_dData_dList.v_Base_dData_dList_dappend (Base_dData_dList.v_Base_dData_dList_dreverse (v_Vuna_dCompiler_dFrontend_dToml_dutf8OfCode dtb__161))) acc))))
  | _ -> failwith "DT: impossible branch"
)
  | Vuna_dCompiler_dBase_dDiag.C_Vuna_dCompiler_dBase_dDiag_dCheck_ErrC (dtb__163) -> (Vuna_dCompiler_dBase_dDiag.C_Vuna_dCompiler_dBase_dDiag_dCheck_ErrC (dtb__163))
  | _ -> failwith "DT: impossible branch"
)) ((((((v_Vuna_dCompiler_dFrontend_dToml_dparseHexCode (v_Vuna_dCompiler_dFrontend_dToml_dcursorFuel cs)) digits) path) cs) 0) 0))))

# 428 "Vuna/Compiler/Frontend/Toml.vuna"
let v_Vuna_dCompiler_dFrontend_dToml_dparseBasicString = (fun (path : string) (cs : t_Vuna_dCompiler_dFrontend_dToml_dTomlCursor) -> (match (cs).f_Vuna_dCompiler_dFrontend_dToml_dTomlCursor_cursorChars with
  | Base_dData_dList.C_Base_dData_dList_dList_Nil -> (((v_Vuna_dCompiler_dFrontend_dToml_dfailAt path) (cs).f_Vuna_dCompiler_dFrontend_dToml_dTomlCursor_cursorLine) "unterminated basic string")
  | Base_dData_dList.C_Base_dData_dList_dList__x58__x58_ (dtb__164, dtb__165) -> (((((v_Vuna_dCompiler_dFrontend_dToml_dparseBasicChars (v_Vuna_dCompiler_dFrontend_dToml_dcursorFuel (v_Vuna_dCompiler_dFrontend_dToml_dadvanceCursor cs))) path) cs) (v_Vuna_dCompiler_dFrontend_dToml_dadvanceCursor cs)) Base_dData_dList.C_Base_dData_dList_dList_Nil)
  | _ -> failwith "DT: impossible branch"
))

# 496 "Vuna/Compiler/Frontend/Toml.vuna"
let rec v_Vuna_dCompiler_dFrontend_dToml_dparseLiteralChars = (fun (fuel : int) (path : string) (startCs : t_Vuna_dCompiler_dFrontend_dToml_dTomlCursor) (cs : t_Vuna_dCompiler_dFrontend_dToml_dTomlCursor) (acc : int Base_dData_dList.t_Base_dData_dList_dList) -> (if (fuel <= 0) then (Vuna_dCompiler_dBase_dDiag.v_Vuna_dCompiler_dBase_dDiag_dicFuel "toml") else (match (cs).f_Vuna_dCompiler_dFrontend_dToml_dTomlCursor_cursorChars with
  | Base_dData_dList.C_Base_dData_dList_dList_Nil -> (((v_Vuna_dCompiler_dFrontend_dToml_dfailAt path) (startCs).f_Vuna_dCompiler_dFrontend_dToml_dTomlCursor_cursorLine) "unterminated literal string")
  | Base_dData_dList.C_Base_dData_dList_dList__x58__x58_ (dtb__166, dtb__167) -> (if (dtb__166 = 39) then (Vuna_dCompiler_dBase_dDiag.C_Vuna_dCompiler_dBase_dDiag_dCheck_OkC ({ Base_dData_dPair.f_Base_dData_dPair_dPair_first = (Base_dData_dList.dtp_pack (Base_dData_dList.v_Base_dData_dList_dreverse acc)); Base_dData_dPair.f_Base_dData_dPair_dPair_second = (v_Vuna_dCompiler_dFrontend_dToml_dadvanceCursor cs) })) else (if (dtb__166 = 10) then (((v_Vuna_dCompiler_dFrontend_dToml_dfailAt path) (startCs).f_Vuna_dCompiler_dFrontend_dToml_dTomlCursor_cursorLine) "unterminated literal string (newline in string)") else (((((v_Vuna_dCompiler_dFrontend_dToml_dparseLiteralChars (fuel - 1)) path) startCs) (v_Vuna_dCompiler_dFrontend_dToml_dadvanceCursor cs)) (Base_dData_dList.C_Base_dData_dList_dList__x58__x58_ (dtb__166, acc)))))
  | _ -> failwith "DT: impossible branch"
)))

# 490 "Vuna/Compiler/Frontend/Toml.vuna"
let v_Vuna_dCompiler_dFrontend_dToml_dparseLiteralString = (fun (path : string) (cs : t_Vuna_dCompiler_dFrontend_dToml_dTomlCursor) -> (match (cs).f_Vuna_dCompiler_dFrontend_dToml_dTomlCursor_cursorChars with
  | Base_dData_dList.C_Base_dData_dList_dList_Nil -> (((v_Vuna_dCompiler_dFrontend_dToml_dfailAt path) (cs).f_Vuna_dCompiler_dFrontend_dToml_dTomlCursor_cursorLine) "unterminated literal string")
  | Base_dData_dList.C_Base_dData_dList_dList__x58__x58_ (dtb__168, dtb__169) -> (((((v_Vuna_dCompiler_dFrontend_dToml_dparseLiteralChars (v_Vuna_dCompiler_dFrontend_dToml_dcursorFuel (v_Vuna_dCompiler_dFrontend_dToml_dadvanceCursor cs))) path) cs) (v_Vuna_dCompiler_dFrontend_dToml_dadvanceCursor cs)) Base_dData_dList.C_Base_dData_dList_dList_Nil)
  | _ -> failwith "DT: impossible branch"
))

# 517 "Vuna/Compiler/Frontend/Toml.vuna"
let v_Vuna_dCompiler_dFrontend_dToml_ddropFirstNewline = (fun (mc0 : t_Vuna_dCompiler_dFrontend_dToml_dTomlCursor) -> (match mc0 with
  | { f_Vuna_dCompiler_dFrontend_dToml_dTomlCursor_cursorChars = dtb__170; f_Vuna_dCompiler_dFrontend_dToml_dTomlCursor_cursorLine = dtb__171; f_Vuna_dCompiler_dFrontend_dToml_dTomlCursor_cursorCol = dtb__172 } -> (match dtb__170 with
  | Base_dData_dList.C_Base_dData_dList_dList__x58__x58_ (dtb__173, dtb__174) -> (if (dtb__173 = 10) then { f_Vuna_dCompiler_dFrontend_dToml_dTomlCursor_cursorChars = dtb__174; f_Vuna_dCompiler_dFrontend_dToml_dTomlCursor_cursorLine = (dtb__171 + 1); f_Vuna_dCompiler_dFrontend_dToml_dTomlCursor_cursorCol = 1 } else { f_Vuna_dCompiler_dFrontend_dToml_dTomlCursor_cursorChars = (Base_dData_dList.C_Base_dData_dList_dList__x58__x58_ (dtb__173, dtb__174)); f_Vuna_dCompiler_dFrontend_dToml_dTomlCursor_cursorLine = dtb__171; f_Vuna_dCompiler_dFrontend_dToml_dTomlCursor_cursorCol = dtb__172 })
  | Base_dData_dList.C_Base_dData_dList_dList_Nil -> { f_Vuna_dCompiler_dFrontend_dToml_dTomlCursor_cursorChars = Base_dData_dList.C_Base_dData_dList_dList_Nil; f_Vuna_dCompiler_dFrontend_dToml_dTomlCursor_cursorLine = dtb__171; f_Vuna_dCompiler_dFrontend_dToml_dTomlCursor_cursorCol = dtb__172 }
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
))

# 551 "Vuna/Compiler/Frontend/Toml.vuna"
let rec v_Vuna_dCompiler_dFrontend_dToml_dskipContinuation = (fun (mc0 : t_Vuna_dCompiler_dFrontend_dToml_dTomlCursor) -> (match mc0 with
  | { f_Vuna_dCompiler_dFrontend_dToml_dTomlCursor_cursorChars = dtb__175; f_Vuna_dCompiler_dFrontend_dToml_dTomlCursor_cursorLine = dtb__176; f_Vuna_dCompiler_dFrontend_dToml_dTomlCursor_cursorCol = dtb__177 } -> (match dtb__175 with
  | Base_dData_dList.C_Base_dData_dList_dList__x58__x58_ (dtb__178, dtb__179) -> (if (v_Vuna_dCompiler_dFrontend_dToml_disBlankChar dtb__178) then (v_Vuna_dCompiler_dFrontend_dToml_dskipContinuation { f_Vuna_dCompiler_dFrontend_dToml_dTomlCursor_cursorChars = dtb__179; f_Vuna_dCompiler_dFrontend_dToml_dTomlCursor_cursorLine = dtb__176; f_Vuna_dCompiler_dFrontend_dToml_dTomlCursor_cursorCol = (dtb__177 + 1) }) else (if (dtb__178 = 10) then (v_Vuna_dCompiler_dFrontend_dToml_dskipContinuation { f_Vuna_dCompiler_dFrontend_dToml_dTomlCursor_cursorChars = dtb__179; f_Vuna_dCompiler_dFrontend_dToml_dTomlCursor_cursorLine = (dtb__176 + 1); f_Vuna_dCompiler_dFrontend_dToml_dTomlCursor_cursorCol = 1 }) else { f_Vuna_dCompiler_dFrontend_dToml_dTomlCursor_cursorChars = (Base_dData_dList.C_Base_dData_dList_dList__x58__x58_ (dtb__178, dtb__179)); f_Vuna_dCompiler_dFrontend_dToml_dTomlCursor_cursorLine = dtb__176; f_Vuna_dCompiler_dFrontend_dToml_dTomlCursor_cursorCol = dtb__177 }))
  | Base_dData_dList.C_Base_dData_dList_dList_Nil -> { f_Vuna_dCompiler_dFrontend_dToml_dTomlCursor_cursorChars = Base_dData_dList.C_Base_dData_dList_dList_Nil; f_Vuna_dCompiler_dFrontend_dToml_dTomlCursor_cursorLine = dtb__176; f_Vuna_dCompiler_dFrontend_dToml_dTomlCursor_cursorCol = dtb__177 }
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
))

# 522 "Vuna/Compiler/Frontend/Toml.vuna"
let rec v_Vuna_dCompiler_dFrontend_dToml_dparseMultilineBasicChars = (fun (fuel : int) (path : string) (startCs : t_Vuna_dCompiler_dFrontend_dToml_dTomlCursor) (cs : t_Vuna_dCompiler_dFrontend_dToml_dTomlCursor) (acc : int Base_dData_dList.t_Base_dData_dList_dList) -> (if (fuel <= 0) then (Vuna_dCompiler_dBase_dDiag.v_Vuna_dCompiler_dBase_dDiag_dicFuel "toml") else (match (cs).f_Vuna_dCompiler_dFrontend_dToml_dTomlCursor_cursorChars with
  | Base_dData_dList.C_Base_dData_dList_dList_Nil -> (((v_Vuna_dCompiler_dFrontend_dToml_dfailAt path) (startCs).f_Vuna_dCompiler_dFrontend_dToml_dTomlCursor_cursorLine) "unterminated multiline string")
  | Base_dData_dList.C_Base_dData_dList_dList__x58__x58_ (dtb__180, dtb__181) -> (if (dtb__180 = 34) then (if ((v_Vuna_dCompiler_dFrontend_dToml_dstartsWithTripleOf 34) (cs).f_Vuna_dCompiler_dFrontend_dToml_dTomlCursor_cursorChars) then (Vuna_dCompiler_dBase_dDiag.C_Vuna_dCompiler_dBase_dDiag_dCheck_OkC ({ Base_dData_dPair.f_Base_dData_dPair_dPair_first = (Base_dData_dList.dtp_pack (Base_dData_dList.v_Base_dData_dList_dreverse acc)); Base_dData_dPair.f_Base_dData_dPair_dPair_second = ((v_Vuna_dCompiler_dFrontend_dToml_dadvanceChars 3) cs) })) else (((((v_Vuna_dCompiler_dFrontend_dToml_dparseMultilineBasicChars (fuel - 1)) path) startCs) (v_Vuna_dCompiler_dFrontend_dToml_dadvanceCursor cs)) (Base_dData_dList.C_Base_dData_dList_dList__x58__x58_ (34, acc)))) else (if (dtb__180 = 10) then (((((v_Vuna_dCompiler_dFrontend_dToml_dparseMultilineBasicChars (fuel - 1)) path) startCs) { f_Vuna_dCompiler_dFrontend_dToml_dTomlCursor_cursorChars = dtb__181; f_Vuna_dCompiler_dFrontend_dToml_dTomlCursor_cursorLine = ((cs).f_Vuna_dCompiler_dFrontend_dToml_dTomlCursor_cursorLine + 1); f_Vuna_dCompiler_dFrontend_dToml_dTomlCursor_cursorCol = 1 }) (Base_dData_dList.C_Base_dData_dList_dList__x58__x58_ (10, acc))) else (if (dtb__180 = 92) then (((((v_Vuna_dCompiler_dFrontend_dToml_dparseMultilineEscape (fuel - 1)) path) startCs) (v_Vuna_dCompiler_dFrontend_dToml_dadvanceCursor cs)) acc) else (((((v_Vuna_dCompiler_dFrontend_dToml_dparseMultilineBasicChars (fuel - 1)) path) startCs) (v_Vuna_dCompiler_dFrontend_dToml_dadvanceCursor cs)) (Base_dData_dList.C_Base_dData_dList_dList__x58__x58_ (dtb__180, acc))))))
  | _ -> failwith "DT: impossible branch"
)))
# 537 "Vuna/Compiler/Frontend/Toml.vuna"
and v_Vuna_dCompiler_dFrontend_dToml_dparseMultilineEscape = (fun (fuel : int) (path : string) (startCs : t_Vuna_dCompiler_dFrontend_dToml_dTomlCursor) (cs : t_Vuna_dCompiler_dFrontend_dToml_dTomlCursor) (acc : int Base_dData_dList.t_Base_dData_dList_dList) -> (if (fuel <= 0) then (Vuna_dCompiler_dBase_dDiag.v_Vuna_dCompiler_dBase_dDiag_dicFuel "toml") else (match (cs).f_Vuna_dCompiler_dFrontend_dToml_dTomlCursor_cursorChars with
  | Base_dData_dList.C_Base_dData_dList_dList_Nil -> (((v_Vuna_dCompiler_dFrontend_dToml_dfailAt path) (startCs).f_Vuna_dCompiler_dFrontend_dToml_dTomlCursor_cursorLine) "unterminated escape sequence")
  | Base_dData_dList.C_Base_dData_dList_dList__x58__x58_ (dtb__182, dtb__183) -> (if (dtb__182 = 10) then (((((v_Vuna_dCompiler_dFrontend_dToml_dparseMultilineBasicChars (fuel - 1)) path) startCs) (v_Vuna_dCompiler_dFrontend_dToml_dskipContinuation { f_Vuna_dCompiler_dFrontend_dToml_dTomlCursor_cursorChars = dtb__183; f_Vuna_dCompiler_dFrontend_dToml_dTomlCursor_cursorLine = ((cs).f_Vuna_dCompiler_dFrontend_dToml_dTomlCursor_cursorLine + 1); f_Vuna_dCompiler_dFrontend_dToml_dTomlCursor_cursorCol = 1 })) acc) else (if (dtb__182 = 32) then (((((v_Vuna_dCompiler_dFrontend_dToml_dparseMultilineBasicChars (fuel - 1)) path) startCs) (v_Vuna_dCompiler_dFrontend_dToml_dskipContinuation cs)) acc) else (if (dtb__182 = 9) then (((((v_Vuna_dCompiler_dFrontend_dToml_dparseMultilineBasicChars (fuel - 1)) path) startCs) (v_Vuna_dCompiler_dFrontend_dToml_dskipContinuation cs)) acc) else (((((v_Vuna_dCompiler_dFrontend_dToml_dparseBasicEscape (fuel - 1)) path) startCs) cs) acc))))
  | _ -> failwith "DT: impossible branch"
)))

# 511 "Vuna/Compiler/Frontend/Toml.vuna"
let v_Vuna_dCompiler_dFrontend_dToml_dparseMultilineBasic = (fun (path : string) (cs : t_Vuna_dCompiler_dFrontend_dToml_dTomlCursor) -> ((fun afterOpen -> (((((v_Vuna_dCompiler_dFrontend_dToml_dparseMultilineBasicChars (v_Vuna_dCompiler_dFrontend_dToml_dcursorFuel afterOpen)) path) cs) afterOpen) Base_dData_dList.C_Base_dData_dList_dList_Nil)) (v_Vuna_dCompiler_dFrontend_dToml_ddropFirstNewline cs)))

# 568 "Vuna/Compiler/Frontend/Toml.vuna"
let rec v_Vuna_dCompiler_dFrontend_dToml_dparseMultilineLiteralChars = (fun (fuel : int) (path : string) (startCs : t_Vuna_dCompiler_dFrontend_dToml_dTomlCursor) (cs : t_Vuna_dCompiler_dFrontend_dToml_dTomlCursor) (acc : int Base_dData_dList.t_Base_dData_dList_dList) -> (if (fuel <= 0) then (Vuna_dCompiler_dBase_dDiag.v_Vuna_dCompiler_dBase_dDiag_dicFuel "toml") else (match (cs).f_Vuna_dCompiler_dFrontend_dToml_dTomlCursor_cursorChars with
  | Base_dData_dList.C_Base_dData_dList_dList_Nil -> (((v_Vuna_dCompiler_dFrontend_dToml_dfailAt path) (startCs).f_Vuna_dCompiler_dFrontend_dToml_dTomlCursor_cursorLine) "unterminated multiline literal string")
  | Base_dData_dList.C_Base_dData_dList_dList__x58__x58_ (dtb__184, dtb__185) -> (if (dtb__184 = 39) then (if ((v_Vuna_dCompiler_dFrontend_dToml_dstartsWithTripleOf 39) (cs).f_Vuna_dCompiler_dFrontend_dToml_dTomlCursor_cursorChars) then (Vuna_dCompiler_dBase_dDiag.C_Vuna_dCompiler_dBase_dDiag_dCheck_OkC ({ Base_dData_dPair.f_Base_dData_dPair_dPair_first = (Base_dData_dList.dtp_pack (Base_dData_dList.v_Base_dData_dList_dreverse acc)); Base_dData_dPair.f_Base_dData_dPair_dPair_second = ((v_Vuna_dCompiler_dFrontend_dToml_dadvanceChars 3) cs) })) else (((((v_Vuna_dCompiler_dFrontend_dToml_dparseMultilineLiteralChars (fuel - 1)) path) startCs) (v_Vuna_dCompiler_dFrontend_dToml_dadvanceCursor cs)) (Base_dData_dList.C_Base_dData_dList_dList__x58__x58_ (39, acc)))) else (if (dtb__184 = 10) then (((((v_Vuna_dCompiler_dFrontend_dToml_dparseMultilineLiteralChars (fuel - 1)) path) startCs) { f_Vuna_dCompiler_dFrontend_dToml_dTomlCursor_cursorChars = dtb__185; f_Vuna_dCompiler_dFrontend_dToml_dTomlCursor_cursorLine = ((cs).f_Vuna_dCompiler_dFrontend_dToml_dTomlCursor_cursorLine + 1); f_Vuna_dCompiler_dFrontend_dToml_dTomlCursor_cursorCol = 1 }) (Base_dData_dList.C_Base_dData_dList_dList__x58__x58_ (10, acc))) else (((((v_Vuna_dCompiler_dFrontend_dToml_dparseMultilineLiteralChars (fuel - 1)) path) startCs) (v_Vuna_dCompiler_dFrontend_dToml_dadvanceCursor cs)) (Base_dData_dList.C_Base_dData_dList_dList__x58__x58_ (dtb__184, acc)))))
  | _ -> failwith "DT: impossible branch"
)))

# 562 "Vuna/Compiler/Frontend/Toml.vuna"
let v_Vuna_dCompiler_dFrontend_dToml_dparseMultilineLiteral = (fun (path : string) (cs : t_Vuna_dCompiler_dFrontend_dToml_dTomlCursor) -> ((fun afterOpen -> (((((v_Vuna_dCompiler_dFrontend_dToml_dparseMultilineLiteralChars (v_Vuna_dCompiler_dFrontend_dToml_dcursorFuel afterOpen)) path) cs) afterOpen) Base_dData_dList.C_Base_dData_dList_dList_Nil)) (v_Vuna_dCompiler_dFrontend_dToml_ddropFirstNewline cs)))

# 582 "Vuna/Compiler/Frontend/Toml.vuna"
let rec v_Vuna_dCompiler_dFrontend_dToml_dcollectBareKey = (fun (mc0 : t_Vuna_dCompiler_dFrontend_dToml_dTomlCursor) (mc1 : int Base_dData_dList.t_Base_dData_dList_dList) -> (match mc0 with
  | { f_Vuna_dCompiler_dFrontend_dToml_dTomlCursor_cursorChars = dtb__186; f_Vuna_dCompiler_dFrontend_dToml_dTomlCursor_cursorLine = dtb__187; f_Vuna_dCompiler_dFrontend_dToml_dTomlCursor_cursorCol = dtb__188 } -> (match dtb__186 with
  | Base_dData_dList.C_Base_dData_dList_dList__x58__x58_ (dtb__189, dtb__190) -> (if (v_Vuna_dCompiler_dFrontend_dToml_disBareKeyChar dtb__189) then ((v_Vuna_dCompiler_dFrontend_dToml_dcollectBareKey { f_Vuna_dCompiler_dFrontend_dToml_dTomlCursor_cursorChars = dtb__190; f_Vuna_dCompiler_dFrontend_dToml_dTomlCursor_cursorLine = dtb__187; f_Vuna_dCompiler_dFrontend_dToml_dTomlCursor_cursorCol = (dtb__188 + 1) }) (Base_dData_dList.C_Base_dData_dList_dList__x58__x58_ (dtb__189, mc1))) else { Base_dData_dPair.f_Base_dData_dPair_dPair_first = (Base_dData_dList.dtp_pack (Base_dData_dList.v_Base_dData_dList_dreverse mc1)); Base_dData_dPair.f_Base_dData_dPair_dPair_second = { f_Vuna_dCompiler_dFrontend_dToml_dTomlCursor_cursorChars = (Base_dData_dList.C_Base_dData_dList_dList__x58__x58_ (dtb__189, dtb__190)); f_Vuna_dCompiler_dFrontend_dToml_dTomlCursor_cursorLine = dtb__187; f_Vuna_dCompiler_dFrontend_dToml_dTomlCursor_cursorCol = dtb__188 } })
  | Base_dData_dList.C_Base_dData_dList_dList_Nil -> { Base_dData_dPair.f_Base_dData_dPair_dPair_first = (Base_dData_dList.dtp_pack (Base_dData_dList.v_Base_dData_dList_dreverse mc1)); Base_dData_dPair.f_Base_dData_dPair_dPair_second = { f_Vuna_dCompiler_dFrontend_dToml_dTomlCursor_cursorChars = Base_dData_dList.C_Base_dData_dList_dList_Nil; f_Vuna_dCompiler_dFrontend_dToml_dTomlCursor_cursorLine = dtb__187; f_Vuna_dCompiler_dFrontend_dToml_dTomlCursor_cursorCol = dtb__188 } }
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
))

# 590 "Vuna/Compiler/Frontend/Toml.vuna"
let v_Vuna_dCompiler_dFrontend_dToml_dparseBareKey = (fun (path : string) (cs : t_Vuna_dCompiler_dFrontend_dToml_dTomlCursor) -> (match (cs).f_Vuna_dCompiler_dFrontend_dToml_dTomlCursor_cursorChars with
  | Base_dData_dList.C_Base_dData_dList_dList_Nil -> (((v_Vuna_dCompiler_dFrontend_dToml_dfailAt path) (cs).f_Vuna_dCompiler_dFrontend_dToml_dTomlCursor_cursorLine) "expected a key")
  | Base_dData_dList.C_Base_dData_dList_dList__x58__x58_ (dtb__191, dtb__192) -> (if (v_Vuna_dCompiler_dFrontend_dToml_disBareKeyChar dtb__191) then (Vuna_dCompiler_dBase_dDiag.C_Vuna_dCompiler_dBase_dDiag_dCheck_OkC (((v_Vuna_dCompiler_dFrontend_dToml_dcollectBareKey cs) Base_dData_dList.C_Base_dData_dList_dList_Nil))) else (((v_Vuna_dCompiler_dFrontend_dToml_dfailAt path) (cs).f_Vuna_dCompiler_dFrontend_dToml_dTomlCursor_cursorLine) "expected a key"))
  | _ -> failwith "DT: impossible branch"
))

# 601 "Vuna/Compiler/Frontend/Toml.vuna"
let v_Vuna_dCompiler_dFrontend_dToml_dparseKeySegment = (fun (path : string) (cs : t_Vuna_dCompiler_dFrontend_dToml_dTomlCursor) -> (match (cs).f_Vuna_dCompiler_dFrontend_dToml_dTomlCursor_cursorChars with
  | Base_dData_dList.C_Base_dData_dList_dList_Nil -> (((v_Vuna_dCompiler_dFrontend_dToml_dfailAt path) (cs).f_Vuna_dCompiler_dFrontend_dToml_dTomlCursor_cursorLine) "expected a key")
  | Base_dData_dList.C_Base_dData_dList_dList__x58__x58_ (dtb__193, dtb__194) -> (if (dtb__193 = 34) then ((fun nd_uscrut5 -> (match nd_uscrut5 with
  | Vuna_dCompiler_dBase_dDiag.C_Vuna_dCompiler_dBase_dDiag_dCheck_OkC (dtb__195) -> (match dtb__195 with
  | { Base_dData_dPair.f_Base_dData_dPair_dPair_first = dtb__196; Base_dData_dPair.f_Base_dData_dPair_dPair_second = dtb__197 } -> (if (dtb__196 = "") then (((v_Vuna_dCompiler_dFrontend_dToml_dfailAt path) (cs).f_Vuna_dCompiler_dFrontend_dToml_dTomlCursor_cursorLine) "expected a key") else (Vuna_dCompiler_dBase_dDiag.C_Vuna_dCompiler_dBase_dDiag_dCheck_OkC ({ Base_dData_dPair.f_Base_dData_dPair_dPair_first = dtb__196; Base_dData_dPair.f_Base_dData_dPair_dPair_second = dtb__197 })))
  | _ -> failwith "DT: impossible branch"
)
  | Vuna_dCompiler_dBase_dDiag.C_Vuna_dCompiler_dBase_dDiag_dCheck_ErrC (dtb__198) -> (Vuna_dCompiler_dBase_dDiag.C_Vuna_dCompiler_dBase_dDiag_dCheck_ErrC (dtb__198))
  | _ -> failwith "DT: impossible branch"
)) ((v_Vuna_dCompiler_dFrontend_dToml_dparseBasicString path) cs)) else (if (dtb__193 = 39) then ((fun nd_uscrut5 -> (match nd_uscrut5 with
  | Vuna_dCompiler_dBase_dDiag.C_Vuna_dCompiler_dBase_dDiag_dCheck_OkC (dtb__199) -> (match dtb__199 with
  | { Base_dData_dPair.f_Base_dData_dPair_dPair_first = dtb__200; Base_dData_dPair.f_Base_dData_dPair_dPair_second = dtb__201 } -> (if (dtb__200 = "") then (((v_Vuna_dCompiler_dFrontend_dToml_dfailAt path) (cs).f_Vuna_dCompiler_dFrontend_dToml_dTomlCursor_cursorLine) "expected a key") else (Vuna_dCompiler_dBase_dDiag.C_Vuna_dCompiler_dBase_dDiag_dCheck_OkC ({ Base_dData_dPair.f_Base_dData_dPair_dPair_first = dtb__200; Base_dData_dPair.f_Base_dData_dPair_dPair_second = dtb__201 })))
  | _ -> failwith "DT: impossible branch"
)
  | Vuna_dCompiler_dBase_dDiag.C_Vuna_dCompiler_dBase_dDiag_dCheck_ErrC (dtb__202) -> (Vuna_dCompiler_dBase_dDiag.C_Vuna_dCompiler_dBase_dDiag_dCheck_ErrC (dtb__202))
  | _ -> failwith "DT: impossible branch"
)) ((v_Vuna_dCompiler_dFrontend_dToml_dparseLiteralString path) cs)) else ((v_Vuna_dCompiler_dFrontend_dToml_dparseBareKey path) cs)))
  | _ -> failwith "DT: impossible branch"
))

# 623 "Vuna/Compiler/Frontend/Toml.vuna"
let rec v_Vuna_dCompiler_dFrontend_dToml_dparseKeySegments = (fun (fuel : int) (path : string) (cs : t_Vuna_dCompiler_dFrontend_dToml_dTomlCursor) (acc : string Base_dData_dList.t_Base_dData_dList_dList) -> (if (fuel <= 0) then (Vuna_dCompiler_dBase_dDiag.v_Vuna_dCompiler_dBase_dDiag_dicFuel "toml") else ((fun nd_uscrut4 -> (match nd_uscrut4 with
  | Vuna_dCompiler_dBase_dDiag.C_Vuna_dCompiler_dBase_dDiag_dCheck_OkC (dtb__203) -> (match dtb__203 with
  | { Base_dData_dPair.f_Base_dData_dPair_dPair_first = dtb__204; Base_dData_dPair.f_Base_dData_dPair_dPair_second = dtb__205 } -> (match (v_Vuna_dCompiler_dFrontend_dToml_dskipBlank dtb__205) with
  | { f_Vuna_dCompiler_dFrontend_dToml_dTomlCursor_cursorChars = dtb__206; f_Vuna_dCompiler_dFrontend_dToml_dTomlCursor_cursorLine = dtb__207; f_Vuna_dCompiler_dFrontend_dToml_dTomlCursor_cursorCol = dtb__208 } -> (match dtb__206 with
  | Base_dData_dList.C_Base_dData_dList_dList_Nil -> (Vuna_dCompiler_dBase_dDiag.C_Vuna_dCompiler_dBase_dDiag_dCheck_OkC ({ Base_dData_dPair.f_Base_dData_dPair_dPair_first = (Base_dData_dList.v_Base_dData_dList_dreverse (Base_dData_dList.C_Base_dData_dList_dList__x58__x58_ (dtb__204, acc))); Base_dData_dPair.f_Base_dData_dPair_dPair_second = { f_Vuna_dCompiler_dFrontend_dToml_dTomlCursor_cursorChars = dtb__206; f_Vuna_dCompiler_dFrontend_dToml_dTomlCursor_cursorLine = dtb__207; f_Vuna_dCompiler_dFrontend_dToml_dTomlCursor_cursorCol = dtb__208 } }))
  | Base_dData_dList.C_Base_dData_dList_dList__x58__x58_ (dtb__209, dtb__210) -> (if (dtb__209 = 46) then ((((v_Vuna_dCompiler_dFrontend_dToml_dparseKeySegments (fuel - 1)) path) { f_Vuna_dCompiler_dFrontend_dToml_dTomlCursor_cursorChars = dtb__210; f_Vuna_dCompiler_dFrontend_dToml_dTomlCursor_cursorLine = dtb__207; f_Vuna_dCompiler_dFrontend_dToml_dTomlCursor_cursorCol = (dtb__208 + 1) }) (Base_dData_dList.C_Base_dData_dList_dList__x58__x58_ (dtb__204, acc))) else (Vuna_dCompiler_dBase_dDiag.C_Vuna_dCompiler_dBase_dDiag_dCheck_OkC ({ Base_dData_dPair.f_Base_dData_dPair_dPair_first = (Base_dData_dList.v_Base_dData_dList_dreverse (Base_dData_dList.C_Base_dData_dList_dList__x58__x58_ (dtb__204, acc))); Base_dData_dPair.f_Base_dData_dPair_dPair_second = { f_Vuna_dCompiler_dFrontend_dToml_dTomlCursor_cursorChars = dtb__206; f_Vuna_dCompiler_dFrontend_dToml_dTomlCursor_cursorLine = dtb__207; f_Vuna_dCompiler_dFrontend_dToml_dTomlCursor_cursorCol = dtb__208 } })))
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
)
  | Vuna_dCompiler_dBase_dDiag.C_Vuna_dCompiler_dBase_dDiag_dCheck_ErrC (dtb__211) -> (Vuna_dCompiler_dBase_dDiag.C_Vuna_dCompiler_dBase_dDiag_dCheck_ErrC (dtb__211))
  | _ -> failwith "DT: impossible branch"
)) ((v_Vuna_dCompiler_dFrontend_dToml_dparseKeySegment path) (v_Vuna_dCompiler_dFrontend_dToml_dskipBlank cs)))))

# 620 "Vuna/Compiler/Frontend/Toml.vuna"
let v_Vuna_dCompiler_dFrontend_dToml_dparseKeyPath = (fun (path : string) (cs : t_Vuna_dCompiler_dFrontend_dToml_dTomlCursor) -> ((((v_Vuna_dCompiler_dFrontend_dToml_dparseKeySegments (v_Vuna_dCompiler_dFrontend_dToml_dcursorFuel cs)) path) cs) Base_dData_dList.C_Base_dData_dList_dList_Nil))

# 667 "Vuna/Compiler/Frontend/Toml.vuna"
let v_Vuna_dCompiler_dFrontend_dToml_dparseSingleStringValue = (fun (path : string) (cs : t_Vuna_dCompiler_dFrontend_dToml_dTomlCursor) -> (match (cs).f_Vuna_dCompiler_dFrontend_dToml_dTomlCursor_cursorChars with
  | Base_dData_dList.C_Base_dData_dList_dList_Nil -> (((v_Vuna_dCompiler_dFrontend_dToml_dfailAt path) (cs).f_Vuna_dCompiler_dFrontend_dToml_dTomlCursor_cursorLine) "expected a string")
  | Base_dData_dList.C_Base_dData_dList_dList__x58__x58_ (dtb__212, dtb__213) -> (if (dtb__212 = 34) then ((fun nd_uscrut5 -> (match nd_uscrut5 with
  | Vuna_dCompiler_dBase_dDiag.C_Vuna_dCompiler_dBase_dDiag_dCheck_OkC (dtb__214) -> (match dtb__214 with
  | { Base_dData_dPair.f_Base_dData_dPair_dPair_first = dtb__215; Base_dData_dPair.f_Base_dData_dPair_dPair_second = dtb__216 } -> (Vuna_dCompiler_dBase_dDiag.C_Vuna_dCompiler_dBase_dDiag_dCheck_OkC ({ Base_dData_dPair.f_Base_dData_dPair_dPair_first = (C_Vuna_dCompiler_dFrontend_dToml_dTomlValue_TStr (dtb__215)); Base_dData_dPair.f_Base_dData_dPair_dPair_second = dtb__216 }))
  | _ -> failwith "DT: impossible branch"
)
  | Vuna_dCompiler_dBase_dDiag.C_Vuna_dCompiler_dBase_dDiag_dCheck_ErrC (dtb__217) -> (Vuna_dCompiler_dBase_dDiag.C_Vuna_dCompiler_dBase_dDiag_dCheck_ErrC (dtb__217))
  | _ -> failwith "DT: impossible branch"
)) ((v_Vuna_dCompiler_dFrontend_dToml_dparseBasicString path) cs)) else ((fun nd_uscrut5 -> (match nd_uscrut5 with
  | Vuna_dCompiler_dBase_dDiag.C_Vuna_dCompiler_dBase_dDiag_dCheck_OkC (dtb__218) -> (match dtb__218 with
  | { Base_dData_dPair.f_Base_dData_dPair_dPair_first = dtb__219; Base_dData_dPair.f_Base_dData_dPair_dPair_second = dtb__220 } -> (Vuna_dCompiler_dBase_dDiag.C_Vuna_dCompiler_dBase_dDiag_dCheck_OkC ({ Base_dData_dPair.f_Base_dData_dPair_dPair_first = (C_Vuna_dCompiler_dFrontend_dToml_dTomlValue_TStr (dtb__219)); Base_dData_dPair.f_Base_dData_dPair_dPair_second = dtb__220 }))
  | _ -> failwith "DT: impossible branch"
)
  | Vuna_dCompiler_dBase_dDiag.C_Vuna_dCompiler_dBase_dDiag_dCheck_ErrC (dtb__221) -> (Vuna_dCompiler_dBase_dDiag.C_Vuna_dCompiler_dBase_dDiag_dCheck_ErrC (dtb__221))
  | _ -> failwith "DT: impossible branch"
)) ((v_Vuna_dCompiler_dFrontend_dToml_dparseLiteralString path) cs)))
  | _ -> failwith "DT: impossible branch"
))

# 682 "Vuna/Compiler/Frontend/Toml.vuna"
let v_Vuna_dCompiler_dFrontend_dToml_dparseMultilineValue = (fun (basic : bool) (path : string) (cs : t_Vuna_dCompiler_dFrontend_dToml_dTomlCursor) -> ((fun after -> (if basic then ((fun nd_uscrut4 -> (match nd_uscrut4 with
  | Vuna_dCompiler_dBase_dDiag.C_Vuna_dCompiler_dBase_dDiag_dCheck_OkC (dtb__222) -> (match dtb__222 with
  | { Base_dData_dPair.f_Base_dData_dPair_dPair_first = dtb__223; Base_dData_dPair.f_Base_dData_dPair_dPair_second = dtb__224 } -> (Vuna_dCompiler_dBase_dDiag.C_Vuna_dCompiler_dBase_dDiag_dCheck_OkC ({ Base_dData_dPair.f_Base_dData_dPair_dPair_first = (C_Vuna_dCompiler_dFrontend_dToml_dTomlValue_TStr (dtb__223)); Base_dData_dPair.f_Base_dData_dPair_dPair_second = dtb__224 }))
  | _ -> failwith "DT: impossible branch"
)
  | Vuna_dCompiler_dBase_dDiag.C_Vuna_dCompiler_dBase_dDiag_dCheck_ErrC (dtb__225) -> (Vuna_dCompiler_dBase_dDiag.C_Vuna_dCompiler_dBase_dDiag_dCheck_ErrC (dtb__225))
  | _ -> failwith "DT: impossible branch"
)) ((v_Vuna_dCompiler_dFrontend_dToml_dparseMultilineBasic path) after)) else ((fun nd_uscrut4 -> (match nd_uscrut4 with
  | Vuna_dCompiler_dBase_dDiag.C_Vuna_dCompiler_dBase_dDiag_dCheck_OkC (dtb__226) -> (match dtb__226 with
  | { Base_dData_dPair.f_Base_dData_dPair_dPair_first = dtb__227; Base_dData_dPair.f_Base_dData_dPair_dPair_second = dtb__228 } -> (Vuna_dCompiler_dBase_dDiag.C_Vuna_dCompiler_dBase_dDiag_dCheck_OkC ({ Base_dData_dPair.f_Base_dData_dPair_dPair_first = (C_Vuna_dCompiler_dFrontend_dToml_dTomlValue_TStr (dtb__227)); Base_dData_dPair.f_Base_dData_dPair_dPair_second = dtb__228 }))
  | _ -> failwith "DT: impossible branch"
)
  | Vuna_dCompiler_dBase_dDiag.C_Vuna_dCompiler_dBase_dDiag_dCheck_ErrC (dtb__229) -> (Vuna_dCompiler_dBase_dDiag.C_Vuna_dCompiler_dBase_dDiag_dCheck_ErrC (dtb__229))
  | _ -> failwith "DT: impossible branch"
)) ((v_Vuna_dCompiler_dFrontend_dToml_dparseMultilineLiteral path) after)))) ((v_Vuna_dCompiler_dFrontend_dToml_dadvanceChars 3) cs)))

# 810 "Vuna/Compiler/Frontend/Toml.vuna"
let v_Vuna_dCompiler_dFrontend_dToml_dmakeInteger = (fun (mc0 : int) (mc1 : bool) -> (if mc1 then (0 - mc0) else mc0))

# 801 "Vuna/Compiler/Frontend/Toml.vuna"
let v_Vuna_dCompiler_dFrontend_dToml_dfinishInteger = (fun (path : string) (startCs : t_Vuna_dCompiler_dFrontend_dToml_dTomlCursor) (cs : t_Vuna_dCompiler_dFrontend_dToml_dTomlCursor) (count : int) (acc : int) (negative : bool) -> (if (count = 0) then (((v_Vuna_dCompiler_dFrontend_dToml_dfailAt path) (startCs).f_Vuna_dCompiler_dFrontend_dToml_dTomlCursor_cursorLine) "expected digits for integer") else (match (cs).f_Vuna_dCompiler_dFrontend_dToml_dTomlCursor_cursorChars with
  | Base_dData_dList.C_Base_dData_dList_dList_Nil -> (Vuna_dCompiler_dBase_dDiag.C_Vuna_dCompiler_dBase_dDiag_dCheck_OkC ({ Base_dData_dPair.f_Base_dData_dPair_dPair_first = ((v_Vuna_dCompiler_dFrontend_dToml_dmakeInteger acc) negative); Base_dData_dPair.f_Base_dData_dPair_dPair_second = cs }))
  | Base_dData_dList.C_Base_dData_dList_dList__x58__x58_ (dtb__230, dtb__231) -> (if (dtb__230 = 46) then (((v_Vuna_dCompiler_dFrontend_dToml_dfailAt path) (startCs).f_Vuna_dCompiler_dFrontend_dToml_dTomlCursor_cursorLine) "floating point numbers are not supported") else (if (v_Vuna_dCompiler_dFrontend_dToml_disBareKeyChar dtb__230) then (((v_Vuna_dCompiler_dFrontend_dToml_dfailAt path) (startCs).f_Vuna_dCompiler_dFrontend_dToml_dTomlCursor_cursorLine) "invalid integer literal") else (Vuna_dCompiler_dBase_dDiag.C_Vuna_dCompiler_dBase_dDiag_dCheck_OkC ({ Base_dData_dPair.f_Base_dData_dPair_dPair_first = ((v_Vuna_dCompiler_dFrontend_dToml_dmakeInteger acc) negative); Base_dData_dPair.f_Base_dData_dPair_dPair_second = cs }))))
  | _ -> failwith "DT: impossible branch"
)))

# 786 "Vuna/Compiler/Frontend/Toml.vuna"
let rec v_Vuna_dCompiler_dFrontend_dToml_dparseIntegerDigits = (fun (fuel : int) (path : string) (startCs : t_Vuna_dCompiler_dFrontend_dToml_dTomlCursor) (cs : t_Vuna_dCompiler_dFrontend_dToml_dTomlCursor) (count : int) (acc : int) (negative : bool) -> (if (fuel <= 0) then (Vuna_dCompiler_dBase_dDiag.v_Vuna_dCompiler_dBase_dDiag_dicFuel "toml") else (match (cs).f_Vuna_dCompiler_dFrontend_dToml_dTomlCursor_cursorChars with
  | Base_dData_dList.C_Base_dData_dList_dList_Nil -> ((((((v_Vuna_dCompiler_dFrontend_dToml_dfinishInteger path) startCs) cs) count) acc) negative)
  | Base_dData_dList.C_Base_dData_dList_dList__x58__x58_ (dtb__232, dtb__233) -> (if (v_Vuna_dCompiler_dFrontend_dToml_disDigitChar dtb__232) then ((fun d -> (if (acc > (if 10 = 0 then failwith "division by zero" else (Vuna_dCompiler_dFrontend_dLexer.v_Vuna_dCompiler_dFrontend_dLexer_dmaxIntLiteral - d) / 10)) then (((v_Vuna_dCompiler_dFrontend_dToml_dfailAt path) (startCs).f_Vuna_dCompiler_dFrontend_dToml_dTomlCursor_cursorLine) "integer literal is out of range (max is 4611686018427387903)") else (((((((v_Vuna_dCompiler_dFrontend_dToml_dparseIntegerDigits (fuel - 1)) path) startCs) (v_Vuna_dCompiler_dFrontend_dToml_dadvanceCursor cs)) (count + 1)) ((acc * 10) + d)) negative))) (dtb__232 - 48)) else ((((((v_Vuna_dCompiler_dFrontend_dToml_dfinishInteger path) startCs) cs) count) acc) negative))
  | _ -> failwith "DT: impossible branch"
)))

# 774 "Vuna/Compiler/Frontend/Toml.vuna"
let v_Vuna_dCompiler_dFrontend_dToml_dparseInteger = (fun (path : string) (cs : t_Vuna_dCompiler_dFrontend_dToml_dTomlCursor) -> (match (cs).f_Vuna_dCompiler_dFrontend_dToml_dTomlCursor_cursorChars with
  | Base_dData_dList.C_Base_dData_dList_dList_Nil -> (((v_Vuna_dCompiler_dFrontend_dToml_dfailAt path) (cs).f_Vuna_dCompiler_dFrontend_dToml_dTomlCursor_cursorLine) "expected an integer")
  | Base_dData_dList.C_Base_dData_dList_dList__x58__x58_ (dtb__234, dtb__235) -> (if (dtb__234 = 45) then (((((((v_Vuna_dCompiler_dFrontend_dToml_dparseIntegerDigits (v_Vuna_dCompiler_dFrontend_dToml_dcursorFuel cs)) path) cs) (v_Vuna_dCompiler_dFrontend_dToml_dadvanceCursor cs)) 0) 0) true) else (if (v_Vuna_dCompiler_dFrontend_dToml_disDigitChar dtb__234) then (((((((v_Vuna_dCompiler_dFrontend_dToml_dparseIntegerDigits (v_Vuna_dCompiler_dFrontend_dToml_dcursorFuel cs)) path) cs) cs) 0) 0) false) else (((v_Vuna_dCompiler_dFrontend_dToml_dfailAt path) (cs).f_Vuna_dCompiler_dFrontend_dToml_dTomlCursor_cursorLine) "expected an integer")))
  | _ -> failwith "DT: impossible branch"
))

# 814 "Vuna/Compiler/Frontend/Toml.vuna"
let v_Vuna_dCompiler_dFrontend_dToml_dparseIntValue = (fun (path : string) (cs : t_Vuna_dCompiler_dFrontend_dToml_dTomlCursor) -> ((fun nd_uscrut2 -> (match nd_uscrut2 with
  | Vuna_dCompiler_dBase_dDiag.C_Vuna_dCompiler_dBase_dDiag_dCheck_OkC (dtb__236) -> (match dtb__236 with
  | { Base_dData_dPair.f_Base_dData_dPair_dPair_first = dtb__237; Base_dData_dPair.f_Base_dData_dPair_dPair_second = dtb__238 } -> (Vuna_dCompiler_dBase_dDiag.C_Vuna_dCompiler_dBase_dDiag_dCheck_OkC ({ Base_dData_dPair.f_Base_dData_dPair_dPair_first = (C_Vuna_dCompiler_dFrontend_dToml_dTomlValue_TInt (dtb__237)); Base_dData_dPair.f_Base_dData_dPair_dPair_second = dtb__238 }))
  | _ -> failwith "DT: impossible branch"
)
  | Vuna_dCompiler_dBase_dDiag.C_Vuna_dCompiler_dBase_dDiag_dCheck_ErrC (dtb__239) -> (Vuna_dCompiler_dBase_dDiag.C_Vuna_dCompiler_dBase_dDiag_dCheck_ErrC (dtb__239))
  | _ -> failwith "DT: impossible branch"
)) ((v_Vuna_dCompiler_dFrontend_dToml_dparseInteger path) cs)))

# 821 "Vuna/Compiler/Frontend/Toml.vuna"
let rec v_Vuna_dCompiler_dFrontend_dToml_dmatchChars = (fun (mc0 : int Base_dData_dList.t_Base_dData_dList_dList) (mc1 : t_Vuna_dCompiler_dFrontend_dToml_dTomlCursor) -> (match mc0 with
  | Base_dData_dList.C_Base_dData_dList_dList__x58__x58_ (dtb__240, dtb__241) -> (match mc1 with
  | { f_Vuna_dCompiler_dFrontend_dToml_dTomlCursor_cursorChars = dtb__242; f_Vuna_dCompiler_dFrontend_dToml_dTomlCursor_cursorLine = dtb__243; f_Vuna_dCompiler_dFrontend_dToml_dTomlCursor_cursorCol = dtb__244 } -> (match dtb__242 with
  | Base_dData_dList.C_Base_dData_dList_dList__x58__x58_ (dtb__245, dtb__246) -> (if (dtb__245 = dtb__240) then ((v_Vuna_dCompiler_dFrontend_dToml_dmatchChars dtb__241) { f_Vuna_dCompiler_dFrontend_dToml_dTomlCursor_cursorChars = dtb__246; f_Vuna_dCompiler_dFrontend_dToml_dTomlCursor_cursorLine = dtb__243; f_Vuna_dCompiler_dFrontend_dToml_dTomlCursor_cursorCol = (dtb__244 + 1) }) else Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Nothing)
  | Base_dData_dList.C_Base_dData_dList_dList_Nil -> Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Nothing
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
)
  | Base_dData_dList.C_Base_dData_dList_dList_Nil -> (Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Just (mc1))
  | _ -> failwith "DT: impossible branch"
))

# 827 "Vuna/Compiler/Frontend/Toml.vuna"
let v_Vuna_dCompiler_dFrontend_dToml_dmatchWord = (fun (word : string) (cs : t_Vuna_dCompiler_dFrontend_dToml_dTomlCursor) -> (match ((v_Vuna_dCompiler_dFrontend_dToml_dmatchChars (Base_dData_dList.dtp_unpack word)) cs) with
  | Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Nothing -> Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Nothing
  | Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Just (dtb__247) -> (match (dtb__247).f_Vuna_dCompiler_dFrontend_dToml_dTomlCursor_cursorChars with
  | Base_dData_dList.C_Base_dData_dList_dList_Nil -> (Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Just (dtb__247))
  | Base_dData_dList.C_Base_dData_dList_dList__x58__x58_ (dtb__248, dtb__249) -> (if (v_Vuna_dCompiler_dFrontend_dToml_disBareKeyChar dtb__248) then Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Nothing else (Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Just (dtb__247)))
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
))

# 638 "Vuna/Compiler/Frontend/Toml.vuna"
let rec v_Vuna_dCompiler_dFrontend_dToml_dparseValue = (fun (fuel : int) (path : string) (cs : t_Vuna_dCompiler_dFrontend_dToml_dTomlCursor) -> (if (fuel <= 0) then (Vuna_dCompiler_dBase_dDiag.v_Vuna_dCompiler_dBase_dDiag_dicFuel "toml") else (match (cs).f_Vuna_dCompiler_dFrontend_dToml_dTomlCursor_cursorChars with
  | Base_dData_dList.C_Base_dData_dList_dList_Nil -> (((v_Vuna_dCompiler_dFrontend_dToml_dfailAt path) (cs).f_Vuna_dCompiler_dFrontend_dToml_dTomlCursor_cursorLine) "expected a value")
  | Base_dData_dList.C_Base_dData_dList_dList__x58__x58_ (dtb__250, dtb__251) -> (if (dtb__250 = 34) then (if ((v_Vuna_dCompiler_dFrontend_dToml_dstartsWithTripleOf 34) (cs).f_Vuna_dCompiler_dFrontend_dToml_dTomlCursor_cursorChars) then (((v_Vuna_dCompiler_dFrontend_dToml_dparseMultilineValue true) path) cs) else ((v_Vuna_dCompiler_dFrontend_dToml_dparseSingleStringValue path) cs)) else (if (dtb__250 = 39) then (if ((v_Vuna_dCompiler_dFrontend_dToml_dstartsWithTripleOf 39) (cs).f_Vuna_dCompiler_dFrontend_dToml_dTomlCursor_cursorChars) then (((v_Vuna_dCompiler_dFrontend_dToml_dparseMultilineValue false) path) cs) else ((v_Vuna_dCompiler_dFrontend_dToml_dparseSingleStringValue path) cs)) else (if (dtb__250 = 91) then (((v_Vuna_dCompiler_dFrontend_dToml_dparseArrayValue (fuel - 1)) path) cs) else (if (dtb__250 = 123) then (((v_Vuna_dCompiler_dFrontend_dToml_dparseInlineTable (fuel - 1)) path) cs) else (if (dtb__250 = 45) then ((v_Vuna_dCompiler_dFrontend_dToml_dparseIntValue path) cs) else (if (v_Vuna_dCompiler_dFrontend_dToml_disDigitChar dtb__250) then ((v_Vuna_dCompiler_dFrontend_dToml_dparseIntValue path) cs) else (match ((v_Vuna_dCompiler_dFrontend_dToml_dmatchWord "true") cs) with
  | Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Just (dtb__252) -> (Vuna_dCompiler_dBase_dDiag.C_Vuna_dCompiler_dBase_dDiag_dCheck_OkC ({ Base_dData_dPair.f_Base_dData_dPair_dPair_first = (C_Vuna_dCompiler_dFrontend_dToml_dTomlValue_TBool (true)); Base_dData_dPair.f_Base_dData_dPair_dPair_second = dtb__252 }))
  | Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Nothing -> (match ((v_Vuna_dCompiler_dFrontend_dToml_dmatchWord "false") cs) with
  | Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Just (dtb__253) -> (Vuna_dCompiler_dBase_dDiag.C_Vuna_dCompiler_dBase_dDiag_dCheck_OkC ({ Base_dData_dPair.f_Base_dData_dPair_dPair_first = (C_Vuna_dCompiler_dFrontend_dToml_dTomlValue_TBool (false)); Base_dData_dPair.f_Base_dData_dPair_dPair_second = dtb__253 }))
  | Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Nothing -> (((v_Vuna_dCompiler_dFrontend_dToml_dfailAt path) (cs).f_Vuna_dCompiler_dFrontend_dToml_dTomlCursor_cursorLine) "expected a value")
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
)))))))
  | _ -> failwith "DT: impossible branch"
)))
# 696 "Vuna/Compiler/Frontend/Toml.vuna"
and v_Vuna_dCompiler_dFrontend_dToml_dparseArrayValue = (fun (fuel : int) (path : string) (cs : t_Vuna_dCompiler_dFrontend_dToml_dTomlCursor) -> (if (fuel <= 0) then (Vuna_dCompiler_dBase_dDiag.v_Vuna_dCompiler_dBase_dDiag_dicFuel "toml") else (match (cs).f_Vuna_dCompiler_dFrontend_dToml_dTomlCursor_cursorChars with
  | Base_dData_dList.C_Base_dData_dList_dList_Nil -> (((v_Vuna_dCompiler_dFrontend_dToml_dfailAt path) (cs).f_Vuna_dCompiler_dFrontend_dToml_dTomlCursor_cursorLine) "unterminated array")
  | Base_dData_dList.C_Base_dData_dList_dList__x58__x58_ (dtb__254, dtb__255) -> ((((v_Vuna_dCompiler_dFrontend_dToml_dparseArrayItems (v_Vuna_dCompiler_dFrontend_dToml_dcursorFuel (v_Vuna_dCompiler_dFrontend_dToml_dadvanceCursor cs))) path) (v_Vuna_dCompiler_dFrontend_dToml_dadvanceCursor cs)) Base_dData_dList.C_Base_dData_dList_dList_Nil)
  | _ -> failwith "DT: impossible branch"
)))
# 705 "Vuna/Compiler/Frontend/Toml.vuna"
and v_Vuna_dCompiler_dFrontend_dToml_dparseArrayItems = (fun (fuel : int) (path : string) (cs : t_Vuna_dCompiler_dFrontend_dToml_dTomlCursor) (acc : t_Vuna_dCompiler_dFrontend_dToml_dTomlValue Base_dData_dList.t_Base_dData_dList_dList) -> (if (fuel <= 0) then (Vuna_dCompiler_dBase_dDiag.v_Vuna_dCompiler_dBase_dDiag_dicFuel "toml") else (match (v_Vuna_dCompiler_dFrontend_dToml_dskipGap cs) with
  | { f_Vuna_dCompiler_dFrontend_dToml_dTomlCursor_cursorChars = dtb__256; f_Vuna_dCompiler_dFrontend_dToml_dTomlCursor_cursorLine = dtb__257; f_Vuna_dCompiler_dFrontend_dToml_dTomlCursor_cursorCol = dtb__258 } -> (match dtb__256 with
  | Base_dData_dList.C_Base_dData_dList_dList_Nil -> (((v_Vuna_dCompiler_dFrontend_dToml_dfailAt path) dtb__257) "unterminated array")
  | Base_dData_dList.C_Base_dData_dList_dList__x58__x58_ (dtb__259, dtb__260) -> (if (dtb__259 = 93) then (Vuna_dCompiler_dBase_dDiag.C_Vuna_dCompiler_dBase_dDiag_dCheck_OkC ({ Base_dData_dPair.f_Base_dData_dPair_dPair_first = (C_Vuna_dCompiler_dFrontend_dToml_dTomlValue_TArray ((Base_dData_dList.v_Base_dData_dList_dreverse acc))); Base_dData_dPair.f_Base_dData_dPair_dPair_second = (v_Vuna_dCompiler_dFrontend_dToml_dadvanceCursor { f_Vuna_dCompiler_dFrontend_dToml_dTomlCursor_cursorChars = dtb__256; f_Vuna_dCompiler_dFrontend_dToml_dTomlCursor_cursorLine = dtb__257; f_Vuna_dCompiler_dFrontend_dToml_dTomlCursor_cursorCol = dtb__258 }) })) else ((fun nd_uscrut10 -> (match nd_uscrut10 with
  | Vuna_dCompiler_dBase_dDiag.C_Vuna_dCompiler_dBase_dDiag_dCheck_OkC (dtb__261) -> (match dtb__261 with
  | { Base_dData_dPair.f_Base_dData_dPair_dPair_first = dtb__262; Base_dData_dPair.f_Base_dData_dPair_dPair_second = dtb__263 } -> (match (v_Vuna_dCompiler_dFrontend_dToml_dskipGap dtb__263) with
  | { f_Vuna_dCompiler_dFrontend_dToml_dTomlCursor_cursorChars = dtb__264; f_Vuna_dCompiler_dFrontend_dToml_dTomlCursor_cursorLine = dtb__265; f_Vuna_dCompiler_dFrontend_dToml_dTomlCursor_cursorCol = dtb__266 } -> (match dtb__264 with
  | Base_dData_dList.C_Base_dData_dList_dList_Nil -> (((v_Vuna_dCompiler_dFrontend_dToml_dfailAt path) dtb__265) "unterminated array")
  | Base_dData_dList.C_Base_dData_dList_dList__x58__x58_ (dtb__267, dtb__268) -> (if (dtb__267 = 44) then ((((v_Vuna_dCompiler_dFrontend_dToml_dparseArrayItems (fuel - 1)) path) (v_Vuna_dCompiler_dFrontend_dToml_dadvanceCursor { f_Vuna_dCompiler_dFrontend_dToml_dTomlCursor_cursorChars = dtb__264; f_Vuna_dCompiler_dFrontend_dToml_dTomlCursor_cursorLine = dtb__265; f_Vuna_dCompiler_dFrontend_dToml_dTomlCursor_cursorCol = dtb__266 })) (Base_dData_dList.C_Base_dData_dList_dList__x58__x58_ (dtb__262, acc))) else (if (dtb__267 = 93) then (Vuna_dCompiler_dBase_dDiag.C_Vuna_dCompiler_dBase_dDiag_dCheck_OkC ({ Base_dData_dPair.f_Base_dData_dPair_dPair_first = (C_Vuna_dCompiler_dFrontend_dToml_dTomlValue_TArray ((Base_dData_dList.v_Base_dData_dList_dreverse (Base_dData_dList.C_Base_dData_dList_dList__x58__x58_ (dtb__262, acc))))); Base_dData_dPair.f_Base_dData_dPair_dPair_second = (v_Vuna_dCompiler_dFrontend_dToml_dadvanceCursor { f_Vuna_dCompiler_dFrontend_dToml_dTomlCursor_cursorChars = dtb__264; f_Vuna_dCompiler_dFrontend_dToml_dTomlCursor_cursorLine = dtb__265; f_Vuna_dCompiler_dFrontend_dToml_dTomlCursor_cursorCol = dtb__266 }) })) else (((v_Vuna_dCompiler_dFrontend_dToml_dfailAt path) dtb__265) "expected ',' or ']' in array")))
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
)
  | Vuna_dCompiler_dBase_dDiag.C_Vuna_dCompiler_dBase_dDiag_dCheck_ErrC (dtb__269) -> (Vuna_dCompiler_dBase_dDiag.C_Vuna_dCompiler_dBase_dDiag_dCheck_ErrC (dtb__269))
  | _ -> failwith "DT: impossible branch"
)) (((v_Vuna_dCompiler_dFrontend_dToml_dparseValue (fuel - 1)) path) { f_Vuna_dCompiler_dFrontend_dToml_dTomlCursor_cursorChars = dtb__256; f_Vuna_dCompiler_dFrontend_dToml_dTomlCursor_cursorLine = dtb__257; f_Vuna_dCompiler_dFrontend_dToml_dTomlCursor_cursorCol = dtb__258 })))
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
)))
# 728 "Vuna/Compiler/Frontend/Toml.vuna"
and v_Vuna_dCompiler_dFrontend_dToml_dparseInlineTable = (fun (fuel : int) (path : string) (cs : t_Vuna_dCompiler_dFrontend_dToml_dTomlCursor) -> (if (fuel <= 0) then (Vuna_dCompiler_dBase_dDiag.v_Vuna_dCompiler_dBase_dDiag_dicFuel "toml") else (match (cs).f_Vuna_dCompiler_dFrontend_dToml_dTomlCursor_cursorChars with
  | Base_dData_dList.C_Base_dData_dList_dList_Nil -> (((v_Vuna_dCompiler_dFrontend_dToml_dfailAt path) (cs).f_Vuna_dCompiler_dFrontend_dToml_dTomlCursor_cursorLine) "unterminated inline table")
  | Base_dData_dList.C_Base_dData_dList_dList__x58__x58_ (dtb__270, dtb__271) -> ((((v_Vuna_dCompiler_dFrontend_dToml_dparseInlineFields (v_Vuna_dCompiler_dFrontend_dToml_dcursorFuel (v_Vuna_dCompiler_dFrontend_dToml_dadvanceCursor cs))) path) (v_Vuna_dCompiler_dFrontend_dToml_dadvanceCursor cs)) Base_dData_dList.C_Base_dData_dList_dList_Nil)
  | _ -> failwith "DT: impossible branch"
)))
# 737 "Vuna/Compiler/Frontend/Toml.vuna"
and v_Vuna_dCompiler_dFrontend_dToml_dparseInlineFields = (fun (fuel : int) (path : string) (cs : t_Vuna_dCompiler_dFrontend_dToml_dTomlCursor) (fields : (string, t_Vuna_dCompiler_dFrontend_dToml_dTomlNode) Base_dData_dPair.t_Base_dData_dPair_dPair Base_dData_dList.t_Base_dData_dList_dList) -> (if (fuel <= 0) then (Vuna_dCompiler_dBase_dDiag.v_Vuna_dCompiler_dBase_dDiag_dicFuel "toml") else (match (v_Vuna_dCompiler_dFrontend_dToml_dskipBlank cs) with
  | { f_Vuna_dCompiler_dFrontend_dToml_dTomlCursor_cursorChars = dtb__272; f_Vuna_dCompiler_dFrontend_dToml_dTomlCursor_cursorLine = dtb__273; f_Vuna_dCompiler_dFrontend_dToml_dTomlCursor_cursorCol = dtb__274 } -> (match dtb__272 with
  | Base_dData_dList.C_Base_dData_dList_dList_Nil -> (((v_Vuna_dCompiler_dFrontend_dToml_dfailAt path) dtb__273) "unterminated inline table")
  | Base_dData_dList.C_Base_dData_dList_dList__x58__x58_ (dtb__275, dtb__276) -> (if (dtb__275 = 125) then (Vuna_dCompiler_dBase_dDiag.C_Vuna_dCompiler_dBase_dDiag_dCheck_OkC ({ Base_dData_dPair.f_Base_dData_dPair_dPair_first = (C_Vuna_dCompiler_dFrontend_dToml_dTomlValue_TTable (((v_Vuna_dCompiler_dFrontend_dToml_drootValue fuel) fields))); Base_dData_dPair.f_Base_dData_dPair_dPair_second = (v_Vuna_dCompiler_dFrontend_dToml_dadvanceCursor { f_Vuna_dCompiler_dFrontend_dToml_dTomlCursor_cursorChars = dtb__272; f_Vuna_dCompiler_dFrontend_dToml_dTomlCursor_cursorLine = dtb__273; f_Vuna_dCompiler_dFrontend_dToml_dTomlCursor_cursorCol = dtb__274 }) })) else ((fun nd_uscrut10 -> (match nd_uscrut10 with
  | Vuna_dCompiler_dBase_dDiag.C_Vuna_dCompiler_dBase_dDiag_dCheck_OkC (dtb__277) -> (match dtb__277 with
  | { Base_dData_dPair.f_Base_dData_dPair_dPair_first = dtb__278; Base_dData_dPair.f_Base_dData_dPair_dPair_second = dtb__279 } -> (match (v_Vuna_dCompiler_dFrontend_dToml_dskipBlank dtb__279) with
  | { f_Vuna_dCompiler_dFrontend_dToml_dTomlCursor_cursorChars = dtb__280; f_Vuna_dCompiler_dFrontend_dToml_dTomlCursor_cursorLine = dtb__281; f_Vuna_dCompiler_dFrontend_dToml_dTomlCursor_cursorCol = dtb__282 } -> (match dtb__280 with
  | Base_dData_dList.C_Base_dData_dList_dList_Nil -> (((v_Vuna_dCompiler_dFrontend_dToml_dfailAt path) dtb__281) "expected '=' in inline table")
  | Base_dData_dList.C_Base_dData_dList_dList__x58__x58_ (dtb__283, dtb__284) -> (if (dtb__283 = 61) then ((fun nd_uscrut23 -> (match nd_uscrut23 with
  | Vuna_dCompiler_dBase_dDiag.C_Vuna_dCompiler_dBase_dDiag_dCheck_OkC (dtb__285) -> (match dtb__285 with
  | { Base_dData_dPair.f_Base_dData_dPair_dPair_first = dtb__286; Base_dData_dPair.f_Base_dData_dPair_dPair_second = dtb__287 } -> (match (((((((v_Vuna_dCompiler_dFrontend_dToml_dinsertValue (v_Vuna_dCompiler_dFrontend_dToml_dpathFuel dtb__278)) path) dtb__281) dtb__278) (v_Vuna_dCompiler_dFrontend_dToml_dsectionOfPath dtb__278)) dtb__286) fields) with
  | Vuna_dCompiler_dBase_dDiag.C_Vuna_dCompiler_dBase_dDiag_dCheck_ErrC (dtb__288) -> (Vuna_dCompiler_dBase_dDiag.C_Vuna_dCompiler_dBase_dDiag_dCheck_ErrC (dtb__288))
  | Vuna_dCompiler_dBase_dDiag.C_Vuna_dCompiler_dBase_dDiag_dCheck_OkC (dtb__289) -> (match (v_Vuna_dCompiler_dFrontend_dToml_dskipBlank dtb__287) with
  | { f_Vuna_dCompiler_dFrontend_dToml_dTomlCursor_cursorChars = dtb__290; f_Vuna_dCompiler_dFrontend_dToml_dTomlCursor_cursorLine = dtb__291; f_Vuna_dCompiler_dFrontend_dToml_dTomlCursor_cursorCol = dtb__292 } -> (match dtb__290 with
  | Base_dData_dList.C_Base_dData_dList_dList_Nil -> (((v_Vuna_dCompiler_dFrontend_dToml_dfailAt path) dtb__291) "unterminated inline table")
  | Base_dData_dList.C_Base_dData_dList_dList__x58__x58_ (dtb__293, dtb__294) -> (if (dtb__293 = 44) then ((((v_Vuna_dCompiler_dFrontend_dToml_dparseInlineFields (fuel - 1)) path) { f_Vuna_dCompiler_dFrontend_dToml_dTomlCursor_cursorChars = dtb__294; f_Vuna_dCompiler_dFrontend_dToml_dTomlCursor_cursorLine = dtb__291; f_Vuna_dCompiler_dFrontend_dToml_dTomlCursor_cursorCol = (dtb__292 + 1) }) dtb__289) else (if (dtb__293 = 125) then (Vuna_dCompiler_dBase_dDiag.C_Vuna_dCompiler_dBase_dDiag_dCheck_OkC ({ Base_dData_dPair.f_Base_dData_dPair_dPair_first = (C_Vuna_dCompiler_dFrontend_dToml_dTomlValue_TTable (((v_Vuna_dCompiler_dFrontend_dToml_drootValue fuel) dtb__289))); Base_dData_dPair.f_Base_dData_dPair_dPair_second = (v_Vuna_dCompiler_dFrontend_dToml_dadvanceCursor { f_Vuna_dCompiler_dFrontend_dToml_dTomlCursor_cursorChars = dtb__290; f_Vuna_dCompiler_dFrontend_dToml_dTomlCursor_cursorLine = dtb__291; f_Vuna_dCompiler_dFrontend_dToml_dTomlCursor_cursorCol = dtb__292 }) })) else (((v_Vuna_dCompiler_dFrontend_dToml_dfailAt path) dtb__291) "expected ',' or '}' in inline table")))
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
)
  | Vuna_dCompiler_dBase_dDiag.C_Vuna_dCompiler_dBase_dDiag_dCheck_ErrC (dtb__295) -> (Vuna_dCompiler_dBase_dDiag.C_Vuna_dCompiler_dBase_dDiag_dCheck_ErrC (dtb__295))
  | _ -> failwith "DT: impossible branch"
)) (((v_Vuna_dCompiler_dFrontend_dToml_dparseValue (fuel - 1)) path) (v_Vuna_dCompiler_dFrontend_dToml_dskipBlank { f_Vuna_dCompiler_dFrontend_dToml_dTomlCursor_cursorChars = dtb__284; f_Vuna_dCompiler_dFrontend_dToml_dTomlCursor_cursorLine = dtb__281; f_Vuna_dCompiler_dFrontend_dToml_dTomlCursor_cursorCol = (dtb__282 + 1) }))) else (((v_Vuna_dCompiler_dFrontend_dToml_dfailAt path) dtb__281) "expected '=' in inline table"))
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
)
  | Vuna_dCompiler_dBase_dDiag.C_Vuna_dCompiler_dBase_dDiag_dCheck_ErrC (dtb__296) -> (Vuna_dCompiler_dBase_dDiag.C_Vuna_dCompiler_dBase_dDiag_dCheck_ErrC (dtb__296))
  | _ -> failwith "DT: impossible branch"
)) ((v_Vuna_dCompiler_dFrontend_dToml_dparseKeyPath path) { f_Vuna_dCompiler_dFrontend_dToml_dTomlCursor_cursorChars = dtb__272; f_Vuna_dCompiler_dFrontend_dToml_dTomlCursor_cursorLine = dtb__273; f_Vuna_dCompiler_dFrontend_dToml_dTomlCursor_cursorCol = dtb__274 })))
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
)))

# 849 "Vuna/Compiler/Frontend/Toml.vuna"
let v_Vuna_dCompiler_dFrontend_dToml_dexpectEolAfterComment = (fun (path : string) (cs : t_Vuna_dCompiler_dFrontend_dToml_dTomlCursor) -> (match (v_Vuna_dCompiler_dFrontend_dToml_dskipComment cs) with
  | { f_Vuna_dCompiler_dFrontend_dToml_dTomlCursor_cursorChars = dtb__297; f_Vuna_dCompiler_dFrontend_dToml_dTomlCursor_cursorLine = dtb__298; f_Vuna_dCompiler_dFrontend_dToml_dTomlCursor_cursorCol = dtb__299 } -> (match dtb__297 with
  | Base_dData_dList.C_Base_dData_dList_dList_Nil -> (Vuna_dCompiler_dBase_dDiag.C_Vuna_dCompiler_dBase_dDiag_dCheck_OkC ({ f_Vuna_dCompiler_dFrontend_dToml_dTomlCursor_cursorChars = dtb__297; f_Vuna_dCompiler_dFrontend_dToml_dTomlCursor_cursorLine = dtb__298; f_Vuna_dCompiler_dFrontend_dToml_dTomlCursor_cursorCol = dtb__299 }))
  | Base_dData_dList.C_Base_dData_dList_dList__x58__x58_ (dtb__300, dtb__301) -> (if (dtb__300 = 10) then (Vuna_dCompiler_dBase_dDiag.C_Vuna_dCompiler_dBase_dDiag_dCheck_OkC ({ f_Vuna_dCompiler_dFrontend_dToml_dTomlCursor_cursorChars = dtb__301; f_Vuna_dCompiler_dFrontend_dToml_dTomlCursor_cursorLine = (dtb__298 + 1); f_Vuna_dCompiler_dFrontend_dToml_dTomlCursor_cursorCol = 1 })) else (((v_Vuna_dCompiler_dFrontend_dToml_dfailAt path) dtb__298) "unexpected character after comment"))
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
))

# 837 "Vuna/Compiler/Frontend/Toml.vuna"
let v_Vuna_dCompiler_dFrontend_dToml_dexpectEol = (fun (path : string) (cs : t_Vuna_dCompiler_dFrontend_dToml_dTomlCursor) -> (match (v_Vuna_dCompiler_dFrontend_dToml_dskipBlank cs) with
  | { f_Vuna_dCompiler_dFrontend_dToml_dTomlCursor_cursorChars = dtb__302; f_Vuna_dCompiler_dFrontend_dToml_dTomlCursor_cursorLine = dtb__303; f_Vuna_dCompiler_dFrontend_dToml_dTomlCursor_cursorCol = dtb__304 } -> (match dtb__302 with
  | Base_dData_dList.C_Base_dData_dList_dList_Nil -> (Vuna_dCompiler_dBase_dDiag.C_Vuna_dCompiler_dBase_dDiag_dCheck_OkC ({ f_Vuna_dCompiler_dFrontend_dToml_dTomlCursor_cursorChars = dtb__302; f_Vuna_dCompiler_dFrontend_dToml_dTomlCursor_cursorLine = dtb__303; f_Vuna_dCompiler_dFrontend_dToml_dTomlCursor_cursorCol = dtb__304 }))
  | Base_dData_dList.C_Base_dData_dList_dList__x58__x58_ (dtb__305, dtb__306) -> (if (dtb__305 = 10) then (Vuna_dCompiler_dBase_dDiag.C_Vuna_dCompiler_dBase_dDiag_dCheck_OkC ({ f_Vuna_dCompiler_dFrontend_dToml_dTomlCursor_cursorChars = dtb__306; f_Vuna_dCompiler_dFrontend_dToml_dTomlCursor_cursorLine = (dtb__303 + 1); f_Vuna_dCompiler_dFrontend_dToml_dTomlCursor_cursorCol = 1 })) else (if (dtb__305 = 35) then ((v_Vuna_dCompiler_dFrontend_dToml_dexpectEolAfterComment path) { f_Vuna_dCompiler_dFrontend_dToml_dTomlCursor_cursorChars = dtb__302; f_Vuna_dCompiler_dFrontend_dToml_dTomlCursor_cursorLine = dtb__303; f_Vuna_dCompiler_dFrontend_dToml_dTomlCursor_cursorCol = dtb__304 }) else (((v_Vuna_dCompiler_dFrontend_dToml_dfailAt path) (cs).f_Vuna_dCompiler_dFrontend_dToml_dTomlCursor_cursorLine) "unexpected character at end of line")))
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
))

# 862 "Vuna/Compiler/Frontend/Toml.vuna"
let rec v_Vuna_dCompiler_dFrontend_dToml_dparseSectionLine = (fun (fuel : int) (path : string) (cs : t_Vuna_dCompiler_dFrontend_dToml_dTomlCursor) (currentPath : string Base_dData_dList.t_Base_dData_dList_dList) (fields : (string, t_Vuna_dCompiler_dFrontend_dToml_dTomlNode) Base_dData_dPair.t_Base_dData_dPair_dPair Base_dData_dList.t_Base_dData_dList_dList) -> (if (fuel <= 0) then (Vuna_dCompiler_dBase_dDiag.v_Vuna_dCompiler_dBase_dDiag_dicFuel "toml") else ((fun nd_uscrut5 -> (match nd_uscrut5 with
  | Vuna_dCompiler_dBase_dDiag.C_Vuna_dCompiler_dBase_dDiag_dCheck_OkC (dtb__307) -> (match dtb__307 with
  | { Base_dData_dPair.f_Base_dData_dPair_dPair_first = dtb__308; Base_dData_dPair.f_Base_dData_dPair_dPair_second = dtb__309 } -> (match (v_Vuna_dCompiler_dFrontend_dToml_dskipBlank dtb__309) with
  | { f_Vuna_dCompiler_dFrontend_dToml_dTomlCursor_cursorChars = dtb__310; f_Vuna_dCompiler_dFrontend_dToml_dTomlCursor_cursorLine = dtb__311; f_Vuna_dCompiler_dFrontend_dToml_dTomlCursor_cursorCol = dtb__312 } -> (match dtb__310 with
  | Base_dData_dList.C_Base_dData_dList_dList_Nil -> (((v_Vuna_dCompiler_dFrontend_dToml_dfailAt path) dtb__311) "unterminated section header")
  | Base_dData_dList.C_Base_dData_dList_dList__x58__x58_ (dtb__313, dtb__314) -> (if (dtb__313 = 93) then (((((((v_Vuna_dCompiler_dFrontend_dToml_dafterSingleBracket (fuel - 1)) path) dtb__311) dtb__312) dtb__314) dtb__308) fields) else (((v_Vuna_dCompiler_dFrontend_dToml_dfailAt path) dtb__311) "expected '.' or ']' in section header"))
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
)
  | Vuna_dCompiler_dBase_dDiag.C_Vuna_dCompiler_dBase_dDiag_dCheck_ErrC (dtb__315) -> (Vuna_dCompiler_dBase_dDiag.C_Vuna_dCompiler_dBase_dDiag_dCheck_ErrC (dtb__315))
  | _ -> failwith "DT: impossible branch"
)) ((v_Vuna_dCompiler_dFrontend_dToml_dparseKeyPath path) (v_Vuna_dCompiler_dFrontend_dToml_dadvanceCursor cs)))))
# 876 "Vuna/Compiler/Frontend/Toml.vuna"
and v_Vuna_dCompiler_dFrontend_dToml_dafterSingleBracket = (fun (fuel : int) (path : string) (line : int) (col : int) (rest : int Base_dData_dList.t_Base_dData_dList_dList) (newSection : string Base_dData_dList.t_Base_dData_dList_dList) (fields : (string, t_Vuna_dCompiler_dFrontend_dToml_dTomlNode) Base_dData_dPair.t_Base_dData_dPair_dPair Base_dData_dList.t_Base_dData_dList_dList) -> (if (fuel <= 0) then (Vuna_dCompiler_dBase_dDiag.v_Vuna_dCompiler_dBase_dDiag_dicFuel "toml") else (match ((v_Vuna_dCompiler_dFrontend_dToml_dexpectEol path) { f_Vuna_dCompiler_dFrontend_dToml_dTomlCursor_cursorChars = rest; f_Vuna_dCompiler_dFrontend_dToml_dTomlCursor_cursorLine = line; f_Vuna_dCompiler_dFrontend_dToml_dTomlCursor_cursorCol = (col + 1) }) with
  | Vuna_dCompiler_dBase_dDiag.C_Vuna_dCompiler_dBase_dDiag_dCheck_ErrC (dtb__316) -> (Vuna_dCompiler_dBase_dDiag.C_Vuna_dCompiler_dBase_dDiag_dCheck_ErrC (dtb__316))
  | Vuna_dCompiler_dBase_dDiag.C_Vuna_dCompiler_dBase_dDiag_dCheck_OkC (dtb__317) -> (match ((((((v_Vuna_dCompiler_dFrontend_dToml_densureTable (v_Vuna_dCompiler_dFrontend_dToml_dpathFuel newSection)) path) line) newSection) C_Vuna_dCompiler_dFrontend_dToml_dTableKind_KindExplicit) fields) with
  | Vuna_dCompiler_dBase_dDiag.C_Vuna_dCompiler_dBase_dDiag_dCheck_ErrC (dtb__318) -> (Vuna_dCompiler_dBase_dDiag.C_Vuna_dCompiler_dBase_dDiag_dCheck_ErrC (dtb__318))
  | Vuna_dCompiler_dBase_dDiag.C_Vuna_dCompiler_dBase_dDiag_dCheck_OkC (dtb__319) -> (((((v_Vuna_dCompiler_dFrontend_dToml_dparseTomlLoop (fuel - 1)) path) dtb__317) newSection) dtb__319)
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
)))
# 889 "Vuna/Compiler/Frontend/Toml.vuna"
and v_Vuna_dCompiler_dFrontend_dToml_dparseTableArrayLine = (fun (fuel : int) (path : string) (cs : t_Vuna_dCompiler_dFrontend_dToml_dTomlCursor) (currentPath : string Base_dData_dList.t_Base_dData_dList_dList) (fields : (string, t_Vuna_dCompiler_dFrontend_dToml_dTomlNode) Base_dData_dPair.t_Base_dData_dPair_dPair Base_dData_dList.t_Base_dData_dList_dList) -> (if (fuel <= 0) then (Vuna_dCompiler_dBase_dDiag.v_Vuna_dCompiler_dBase_dDiag_dicFuel "toml") else ((fun nd_uscrut5 -> (match nd_uscrut5 with
  | Vuna_dCompiler_dBase_dDiag.C_Vuna_dCompiler_dBase_dDiag_dCheck_OkC (dtb__320) -> (match dtb__320 with
  | { Base_dData_dPair.f_Base_dData_dPair_dPair_first = dtb__321; Base_dData_dPair.f_Base_dData_dPair_dPair_second = dtb__322 } -> (match (v_Vuna_dCompiler_dFrontend_dToml_dskipBlank dtb__322) with
  | { f_Vuna_dCompiler_dFrontend_dToml_dTomlCursor_cursorChars = dtb__323; f_Vuna_dCompiler_dFrontend_dToml_dTomlCursor_cursorLine = dtb__324; f_Vuna_dCompiler_dFrontend_dToml_dTomlCursor_cursorCol = dtb__325 } -> (match dtb__323 with
  | Base_dData_dList.C_Base_dData_dList_dList_Nil -> (((v_Vuna_dCompiler_dFrontend_dToml_dfailAt path) dtb__324) "unterminated table array header")
  | Base_dData_dList.C_Base_dData_dList_dList__x58__x58_ (dtb__326, dtb__327) -> (if (dtb__326 = 93) then (((((((v_Vuna_dCompiler_dFrontend_dToml_dafterDoubleBracket (fuel - 1)) path) dtb__324) dtb__325) dtb__327) dtb__321) fields) else (((v_Vuna_dCompiler_dFrontend_dToml_dfailAt path) dtb__324) "expected ']]' in table array header"))
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
)
  | Vuna_dCompiler_dBase_dDiag.C_Vuna_dCompiler_dBase_dDiag_dCheck_ErrC (dtb__328) -> (Vuna_dCompiler_dBase_dDiag.C_Vuna_dCompiler_dBase_dDiag_dCheck_ErrC (dtb__328))
  | _ -> failwith "DT: impossible branch"
)) ((v_Vuna_dCompiler_dFrontend_dToml_dparseKeyPath path) (v_Vuna_dCompiler_dFrontend_dToml_dadvanceCursor (v_Vuna_dCompiler_dFrontend_dToml_dadvanceCursor cs))))))
# 903 "Vuna/Compiler/Frontend/Toml.vuna"
and v_Vuna_dCompiler_dFrontend_dToml_dafterDoubleBracket = (fun (fuel : int) (path : string) (line : int) (col : int) (rest : int Base_dData_dList.t_Base_dData_dList_dList) (newSection : string Base_dData_dList.t_Base_dData_dList_dList) (fields : (string, t_Vuna_dCompiler_dFrontend_dToml_dTomlNode) Base_dData_dPair.t_Base_dData_dPair_dPair Base_dData_dList.t_Base_dData_dList_dList) -> (if (fuel <= 0) then (Vuna_dCompiler_dBase_dDiag.v_Vuna_dCompiler_dBase_dDiag_dicFuel "toml") else (match rest with
  | Base_dData_dList.C_Base_dData_dList_dList__x58__x58_ (dtb__329, dtb__330) -> (if (dtb__329 = 93) then (match ((v_Vuna_dCompiler_dFrontend_dToml_dexpectEol path) { f_Vuna_dCompiler_dFrontend_dToml_dTomlCursor_cursorChars = dtb__330; f_Vuna_dCompiler_dFrontend_dToml_dTomlCursor_cursorLine = line; f_Vuna_dCompiler_dFrontend_dToml_dTomlCursor_cursorCol = (col + 2) }) with
  | Vuna_dCompiler_dBase_dDiag.C_Vuna_dCompiler_dBase_dDiag_dCheck_ErrC (dtb__331) -> (Vuna_dCompiler_dBase_dDiag.C_Vuna_dCompiler_dBase_dDiag_dCheck_ErrC (dtb__331))
  | Vuna_dCompiler_dBase_dDiag.C_Vuna_dCompiler_dBase_dDiag_dCheck_OkC (dtb__332) -> (match (((((v_Vuna_dCompiler_dFrontend_dToml_dappendTableArray (v_Vuna_dCompiler_dFrontend_dToml_dpathFuel newSection)) path) line) newSection) fields) with
  | Vuna_dCompiler_dBase_dDiag.C_Vuna_dCompiler_dBase_dDiag_dCheck_ErrC (dtb__333) -> (Vuna_dCompiler_dBase_dDiag.C_Vuna_dCompiler_dBase_dDiag_dCheck_ErrC (dtb__333))
  | Vuna_dCompiler_dBase_dDiag.C_Vuna_dCompiler_dBase_dDiag_dCheck_OkC (dtb__334) -> (((((v_Vuna_dCompiler_dFrontend_dToml_dparseTomlLoop (fuel - 1)) path) dtb__332) newSection) dtb__334)
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
) else (((v_Vuna_dCompiler_dFrontend_dToml_dfailAt path) line) "expected ']]' in table array header"))
  | _ -> (((v_Vuna_dCompiler_dFrontend_dToml_dfailAt path) line) "expected ']]' in table array header")
)))
# 921 "Vuna/Compiler/Frontend/Toml.vuna"
and v_Vuna_dCompiler_dFrontend_dToml_dparseEntryValue = (fun (fuel : int) (path : string) (cs : t_Vuna_dCompiler_dFrontend_dToml_dTomlCursor) (keyLine : int) (keyPath : string Base_dData_dList.t_Base_dData_dList_dList) (currentPath : string Base_dData_dList.t_Base_dData_dList_dList) (fields : (string, t_Vuna_dCompiler_dFrontend_dToml_dTomlNode) Base_dData_dPair.t_Base_dData_dPair_dPair Base_dData_dList.t_Base_dData_dList_dList) -> (if (fuel <= 0) then (Vuna_dCompiler_dBase_dDiag.v_Vuna_dCompiler_dBase_dDiag_dicFuel "toml") else ((fun nd_uscrut7 -> (match nd_uscrut7 with
  | Vuna_dCompiler_dBase_dDiag.C_Vuna_dCompiler_dBase_dDiag_dCheck_OkC (dtb__335) -> (match dtb__335 with
  | { Base_dData_dPair.f_Base_dData_dPair_dPair_first = dtb__336; Base_dData_dPair.f_Base_dData_dPair_dPair_second = dtb__337 } -> (match ((v_Vuna_dCompiler_dFrontend_dToml_dexpectEol path) dtb__337) with
  | Vuna_dCompiler_dBase_dDiag.C_Vuna_dCompiler_dBase_dDiag_dCheck_ErrC (dtb__338) -> (Vuna_dCompiler_dBase_dDiag.C_Vuna_dCompiler_dBase_dDiag_dCheck_ErrC (dtb__338))
  | Vuna_dCompiler_dBase_dDiag.C_Vuna_dCompiler_dBase_dDiag_dCheck_OkC (dtb__339) -> ((fun fullPath -> (match (((((((v_Vuna_dCompiler_dFrontend_dToml_dinsertValue (v_Vuna_dCompiler_dFrontend_dToml_dpathFuel fullPath)) path) keyLine) fullPath) (v_Vuna_dCompiler_dFrontend_dToml_dsectionOfPath fullPath)) dtb__336) fields) with
  | Vuna_dCompiler_dBase_dDiag.C_Vuna_dCompiler_dBase_dDiag_dCheck_ErrC (dtb__340) -> (Vuna_dCompiler_dBase_dDiag.C_Vuna_dCompiler_dBase_dDiag_dCheck_ErrC (dtb__340))
  | Vuna_dCompiler_dBase_dDiag.C_Vuna_dCompiler_dBase_dDiag_dCheck_OkC (dtb__341) -> (((((v_Vuna_dCompiler_dFrontend_dToml_dparseTomlLoop (fuel - 1)) path) dtb__339) currentPath) dtb__341)
  | _ -> failwith "DT: impossible branch"
)) ((v_Vuna_dCompiler_dFrontend_dToml_dappendPath currentPath) keyPath))
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
)
  | Vuna_dCompiler_dBase_dDiag.C_Vuna_dCompiler_dBase_dDiag_dCheck_ErrC (dtb__342) -> (Vuna_dCompiler_dBase_dDiag.C_Vuna_dCompiler_dBase_dDiag_dCheck_ErrC (dtb__342))
  | _ -> failwith "DT: impossible branch"
)) (((v_Vuna_dCompiler_dFrontend_dToml_dparseValue (fuel - 1)) path) (v_Vuna_dCompiler_dFrontend_dToml_dskipBlank cs)))))
# 938 "Vuna/Compiler/Frontend/Toml.vuna"
and v_Vuna_dCompiler_dFrontend_dToml_dparseKeyLine = (fun (fuel : int) (path : string) (cs : t_Vuna_dCompiler_dFrontend_dToml_dTomlCursor) (currentPath : string Base_dData_dList.t_Base_dData_dList_dList) (fields : (string, t_Vuna_dCompiler_dFrontend_dToml_dTomlNode) Base_dData_dPair.t_Base_dData_dPair_dPair Base_dData_dList.t_Base_dData_dList_dList) -> (if (fuel <= 0) then (Vuna_dCompiler_dBase_dDiag.v_Vuna_dCompiler_dBase_dDiag_dicFuel "toml") else ((fun nd_uscrut5 -> (match nd_uscrut5 with
  | Vuna_dCompiler_dBase_dDiag.C_Vuna_dCompiler_dBase_dDiag_dCheck_OkC (dtb__343) -> (match dtb__343 with
  | { Base_dData_dPair.f_Base_dData_dPair_dPair_first = dtb__344; Base_dData_dPair.f_Base_dData_dPair_dPair_second = dtb__345 } -> (match (v_Vuna_dCompiler_dFrontend_dToml_dskipBlank dtb__345) with
  | { f_Vuna_dCompiler_dFrontend_dToml_dTomlCursor_cursorChars = dtb__346; f_Vuna_dCompiler_dFrontend_dToml_dTomlCursor_cursorLine = dtb__347; f_Vuna_dCompiler_dFrontend_dToml_dTomlCursor_cursorCol = dtb__348 } -> (match dtb__346 with
  | Base_dData_dList.C_Base_dData_dList_dList_Nil -> (((v_Vuna_dCompiler_dFrontend_dToml_dfailAt path) (cs).f_Vuna_dCompiler_dFrontend_dToml_dTomlCursor_cursorLine) "expected '=' after key")
  | Base_dData_dList.C_Base_dData_dList_dList__x58__x58_ (dtb__349, dtb__350) -> (if (dtb__349 = 61) then (((((((v_Vuna_dCompiler_dFrontend_dToml_dparseEntryValue (fuel - 1)) path) { f_Vuna_dCompiler_dFrontend_dToml_dTomlCursor_cursorChars = dtb__350; f_Vuna_dCompiler_dFrontend_dToml_dTomlCursor_cursorLine = dtb__347; f_Vuna_dCompiler_dFrontend_dToml_dTomlCursor_cursorCol = (dtb__348 + 1) }) (cs).f_Vuna_dCompiler_dFrontend_dToml_dTomlCursor_cursorLine) dtb__344) currentPath) fields) else (((v_Vuna_dCompiler_dFrontend_dToml_dfailAt path) (cs).f_Vuna_dCompiler_dFrontend_dToml_dTomlCursor_cursorLine) "expected '=' after key"))
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
)
  | Vuna_dCompiler_dBase_dDiag.C_Vuna_dCompiler_dBase_dDiag_dCheck_ErrC (dtb__351) -> (Vuna_dCompiler_dBase_dDiag.C_Vuna_dCompiler_dBase_dDiag_dCheck_ErrC (dtb__351))
  | _ -> failwith "DT: impossible branch"
)) ((v_Vuna_dCompiler_dFrontend_dToml_dparseKeyPath path) cs))))
# 952 "Vuna/Compiler/Frontend/Toml.vuna"
and v_Vuna_dCompiler_dFrontend_dToml_dparseTomlLoop = (fun (fuel : int) (path : string) (cs : t_Vuna_dCompiler_dFrontend_dToml_dTomlCursor) (currentPath : string Base_dData_dList.t_Base_dData_dList_dList) (fields : (string, t_Vuna_dCompiler_dFrontend_dToml_dTomlNode) Base_dData_dPair.t_Base_dData_dPair_dPair Base_dData_dList.t_Base_dData_dList_dList) -> (if (fuel <= 0) then (Vuna_dCompiler_dBase_dDiag.v_Vuna_dCompiler_dBase_dDiag_dicFuel "toml") else (((((v_Vuna_dCompiler_dFrontend_dToml_dparseTomlLoopAt (fuel - 1)) path) (v_Vuna_dCompiler_dFrontend_dToml_dskipGap cs)) currentPath) fields)))
# 959 "Vuna/Compiler/Frontend/Toml.vuna"
and v_Vuna_dCompiler_dFrontend_dToml_dparseTomlLoopAt = (fun (fuel : int) (path : string) (cs : t_Vuna_dCompiler_dFrontend_dToml_dTomlCursor) (currentPath : string Base_dData_dList.t_Base_dData_dList_dList) (fields : (string, t_Vuna_dCompiler_dFrontend_dToml_dTomlNode) Base_dData_dPair.t_Base_dData_dPair_dPair Base_dData_dList.t_Base_dData_dList_dList) -> (if (fuel <= 0) then (Vuna_dCompiler_dBase_dDiag.v_Vuna_dCompiler_dBase_dDiag_dicFuel "toml") else (match (cs).f_Vuna_dCompiler_dFrontend_dToml_dTomlCursor_cursorChars with
  | Base_dData_dList.C_Base_dData_dList_dList_Nil -> (Vuna_dCompiler_dBase_dDiag.C_Vuna_dCompiler_dBase_dDiag_dCheck_OkC (fields))
  | Base_dData_dList.C_Base_dData_dList_dList__x58__x58_ (dtb__352, dtb__353) -> (if (dtb__352 = 91) then (((((v_Vuna_dCompiler_dFrontend_dToml_dparseBracketLine (fuel - 1)) path) cs) currentPath) fields) else (((((v_Vuna_dCompiler_dFrontend_dToml_dparseKeyLine (fuel - 1)) path) cs) currentPath) fields))
  | _ -> failwith "DT: impossible branch"
)))
# 969 "Vuna/Compiler/Frontend/Toml.vuna"
and v_Vuna_dCompiler_dFrontend_dToml_dparseBracketLine = (fun (fuel : int) (path : string) (cs : t_Vuna_dCompiler_dFrontend_dToml_dTomlCursor) (currentPath : string Base_dData_dList.t_Base_dData_dList_dList) (fields : (string, t_Vuna_dCompiler_dFrontend_dToml_dTomlNode) Base_dData_dPair.t_Base_dData_dPair_dPair Base_dData_dList.t_Base_dData_dList_dList) -> (if (fuel <= 0) then (Vuna_dCompiler_dBase_dDiag.v_Vuna_dCompiler_dBase_dDiag_dicFuel "toml") else (match (cs).f_Vuna_dCompiler_dFrontend_dToml_dTomlCursor_cursorChars with
  | Base_dData_dList.C_Base_dData_dList_dList__x58__x58_ (dtb__354, dtb__355) -> (match dtb__355 with
  | Base_dData_dList.C_Base_dData_dList_dList__x58__x58_ (dtb__356, dtb__357) -> (if (dtb__356 = 91) then (((((v_Vuna_dCompiler_dFrontend_dToml_dparseTableArrayLine (fuel - 1)) path) cs) currentPath) fields) else (((((v_Vuna_dCompiler_dFrontend_dToml_dparseSectionLine (fuel - 1)) path) cs) currentPath) fields))
  | _ -> (((((v_Vuna_dCompiler_dFrontend_dToml_dparseSectionLine (fuel - 1)) path) cs) currentPath) fields)
)
  | _ -> (((((v_Vuna_dCompiler_dFrontend_dToml_dparseSectionLine (fuel - 1)) path) cs) currentPath) fields)
)))

# 985 "Vuna/Compiler/Frontend/Toml.vuna"
let v_Vuna_dCompiler_dFrontend_dToml_dparseTomlAt = (fun (path : string) (source : string) -> ((fun cs -> (match (((((v_Vuna_dCompiler_dFrontend_dToml_dparseTomlLoop (v_Vuna_dCompiler_dFrontend_dToml_dlineFuel cs)) path) cs) Base_dData_dList.C_Base_dData_dList_dList_Nil) Base_dData_dList.C_Base_dData_dList_dList_Nil) with
  | Vuna_dCompiler_dBase_dDiag.C_Vuna_dCompiler_dBase_dDiag_dCheck_ErrC (dtb__358) -> (Vuna_dCompiler_dBase_dDiag.C_Vuna_dCompiler_dBase_dDiag_dCheck_ErrC (dtb__358))
  | Vuna_dCompiler_dBase_dDiag.C_Vuna_dCompiler_dBase_dDiag_dCheck_OkC (dtb__359) -> (Vuna_dCompiler_dBase_dDiag.C_Vuna_dCompiler_dBase_dDiag_dCheck_OkC ((((v_Vuna_dCompiler_dFrontend_dToml_dflattenFields (v_Vuna_dCompiler_dFrontend_dToml_dflattenFuel cs)) Base_dData_dList.C_Base_dData_dList_dList_Nil) dtb__359)))
  | _ -> failwith "DT: impossible branch"
)) { f_Vuna_dCompiler_dFrontend_dToml_dTomlCursor_cursorChars = (v_Vuna_dCompiler_dFrontend_dToml_dstripCR (Base_dData_dList.dtp_unpack source)); f_Vuna_dCompiler_dFrontend_dToml_dTomlCursor_cursorLine = 1; f_Vuna_dCompiler_dFrontend_dToml_dTomlCursor_cursorCol = 1 }))

# 982 "Vuna/Compiler/Frontend/Toml.vuna"
let v_Vuna_dCompiler_dFrontend_dToml_dparseToml = (fun (source : string) -> ((v_Vuna_dCompiler_dFrontend_dToml_dparseTomlAt "") source))

# 994 "Vuna/Compiler/Frontend/Toml.vuna"
let v_Vuna_dCompiler_dFrontend_dToml_dparseTomlDoc = (fun (path : string) (source : string) -> ((fun cs -> (match (((((v_Vuna_dCompiler_dFrontend_dToml_dparseTomlLoop (v_Vuna_dCompiler_dFrontend_dToml_dlineFuel cs)) path) cs) Base_dData_dList.C_Base_dData_dList_dList_Nil) Base_dData_dList.C_Base_dData_dList_dList_Nil) with
  | Vuna_dCompiler_dBase_dDiag.C_Vuna_dCompiler_dBase_dDiag_dCheck_ErrC (dtb__360) -> (Obj.magic (Vuna_dCompiler_dBase_dDiag.C_Vuna_dCompiler_dBase_dDiag_dCheck_ErrC (dtb__360)))
  | Vuna_dCompiler_dBase_dDiag.C_Vuna_dCompiler_dBase_dDiag_dCheck_OkC (dtb__361) -> (Obj.magic (Vuna_dCompiler_dBase_dDiag.C_Vuna_dCompiler_dBase_dDiag_dCheck_OkC (((v_Vuna_dCompiler_dFrontend_dToml_drootValue (v_Vuna_dCompiler_dFrontend_dToml_dflattenFuel cs)) dtb__361))))
  | _ -> failwith "DT: impossible branch"
)) { f_Vuna_dCompiler_dFrontend_dToml_dTomlCursor_cursorChars = (v_Vuna_dCompiler_dFrontend_dToml_dstripCR (Base_dData_dList.dtp_unpack source)); f_Vuna_dCompiler_dFrontend_dToml_dTomlCursor_cursorLine = 1; f_Vuna_dCompiler_dFrontend_dToml_dTomlCursor_cursorCol = 1 }))

# 1003 "Vuna/Compiler/Frontend/Toml.vuna"
let rec v_Vuna_dCompiler_dFrontend_dToml_darrayStrings = (fun (mc0 : t_Vuna_dCompiler_dFrontend_dToml_dTomlValue Base_dData_dList.t_Base_dData_dList_dList) -> (match mc0 with
  | Base_dData_dList.C_Base_dData_dList_dList__x58__x58_ (dtb__362, dtb__363) -> (match dtb__362 with
  | C_Vuna_dCompiler_dFrontend_dToml_dTomlValue_TStr (dtb__364) -> (match (v_Vuna_dCompiler_dFrontend_dToml_darrayStrings dtb__363) with
  | Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Nothing -> Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Nothing
  | Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Just (dtb__365) -> (Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Just ((Base_dData_dList.C_Base_dData_dList_dList__x58__x58_ (dtb__364, dtb__365))))
  | _ -> failwith "DT: impossible branch"
)
  | _ -> Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Nothing
)
  | Base_dData_dList.C_Base_dData_dList_dList_Nil -> (Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Just (Base_dData_dList.C_Base_dData_dList_dList_Nil))
  | _ -> failwith "DT: impossible branch"
))

# 1051 "Vuna/Compiler/Frontend/Toml.vuna"
let rec v_Vuna_dCompiler_dFrontend_dToml_dsplitAtList = (fun (n : int) xs -> (if (n <= 0) then (Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Just ({ Base_dData_dPair.f_Base_dData_dPair_dPair_first = Base_dData_dList.C_Base_dData_dList_dList_Nil; Base_dData_dPair.f_Base_dData_dPair_dPair_second = xs })) else (match xs with
  | Base_dData_dList.C_Base_dData_dList_dList_Nil -> Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Nothing
  | Base_dData_dList.C_Base_dData_dList_dList__x58__x58_ (dtb__366, dtb__367) -> ((fun nd_uscrut6 -> (match nd_uscrut6 with
  | Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Just (dtb__368) -> (match dtb__368 with
  | { Base_dData_dPair.f_Base_dData_dPair_dPair_first = dtb__369; Base_dData_dPair.f_Base_dData_dPair_dPair_second = dtb__370 } -> (Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Just ({ Base_dData_dPair.f_Base_dData_dPair_dPair_first = (Base_dData_dList.C_Base_dData_dList_dList__x58__x58_ (dtb__366, dtb__369)); Base_dData_dPair.f_Base_dData_dPair_dPair_second = dtb__370 }))
  | _ -> failwith "DT: impossible branch"
)
  | Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Nothing -> Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Nothing
  | _ -> failwith "DT: impossible branch"
)) ((v_Vuna_dCompiler_dFrontend_dToml_dsplitAtList (n - 1)) dtb__367))
  | _ -> failwith "DT: impossible branch"
)))

# 1063 "Vuna/Compiler/Frontend/Toml.vuna"
let rec v_Vuna_dCompiler_dFrontend_dToml_dsamePath = (fun _uctx0 mc0 mc1 -> (match mc0 with
  | Base_dData_dList.C_Base_dData_dList_dList__x58__x58_ (dtb__371, dtb__372) -> (match mc1 with
  | Base_dData_dList.C_Base_dData_dList_dList__x58__x58_ (dtb__373, dtb__374) -> (if (((Base_dTrait_dEq.v_Base_dTrait_dEq_d_x61__x61_ _uctx0) dtb__371) dtb__373) then (((v_Vuna_dCompiler_dFrontend_dToml_dsamePath _uctx0) dtb__372) dtb__374) else false)
  | _ -> false
)
  | Base_dData_dList.C_Base_dData_dList_dList_Nil -> (match mc1 with
  | Base_dData_dList.C_Base_dData_dList_dList_Nil -> true
  | _ -> false
)
  | _ -> failwith "DT: impossible branch"
))

# 1011 "Vuna/Compiler/Frontend/Toml.vuna"
let rec v_Vuna_dCompiler_dFrontend_dToml_dlookupEntry = (fun (mc0 : string Base_dData_dList.t_Base_dData_dList_dList) (mc1 : string) (mc2 : t_Vuna_dCompiler_dFrontend_dToml_dTomlEntry Base_dData_dList.t_Base_dData_dList_dList) -> (match mc2 with
  | Base_dData_dList.C_Base_dData_dList_dList__x58__x58_ (dtb__375, dtb__376) -> (match dtb__375 with
  | { f_Vuna_dCompiler_dFrontend_dToml_dTomlEntry_tomlEntrySection = dtb__377; f_Vuna_dCompiler_dFrontend_dToml_dTomlEntry_tomlEntryKey = dtb__378; f_Vuna_dCompiler_dFrontend_dToml_dTomlEntry_tomlEntryValue = dtb__379; f_Vuna_dCompiler_dFrontend_dToml_dTomlEntry_tomlEntryLine = dtb__380 } -> (if (if (((v_Vuna_dCompiler_dFrontend_dToml_dsamePath Base_dData_dString.v_Eq_uString) mc0) dtb__377) then (dtb__378 = mc1) else false) then (Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Just (dtb__379)) else (((v_Vuna_dCompiler_dFrontend_dToml_dlookupEntry mc0) mc1) dtb__376))
  | _ -> failwith "DT: impossible branch"
)
  | Base_dData_dList.C_Base_dData_dList_dList_Nil -> Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Nothing
  | _ -> failwith "DT: impossible branch"
))

# 1016 "Vuna/Compiler/Frontend/Toml.vuna"
let rec v_Vuna_dCompiler_dFrontend_dToml_dlookupEntryLine = (fun (mc0 : string Base_dData_dList.t_Base_dData_dList_dList) (mc1 : string) (mc2 : t_Vuna_dCompiler_dFrontend_dToml_dTomlEntry Base_dData_dList.t_Base_dData_dList_dList) -> (match mc2 with
  | Base_dData_dList.C_Base_dData_dList_dList__x58__x58_ (dtb__381, dtb__382) -> (match dtb__381 with
  | { f_Vuna_dCompiler_dFrontend_dToml_dTomlEntry_tomlEntrySection = dtb__383; f_Vuna_dCompiler_dFrontend_dToml_dTomlEntry_tomlEntryKey = dtb__384; f_Vuna_dCompiler_dFrontend_dToml_dTomlEntry_tomlEntryValue = dtb__385; f_Vuna_dCompiler_dFrontend_dToml_dTomlEntry_tomlEntryLine = dtb__386 } -> (if (if (((v_Vuna_dCompiler_dFrontend_dToml_dsamePath Base_dData_dString.v_Eq_uString) mc0) dtb__383) then (dtb__384 = mc1) else false) then (Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Just (dtb__386)) else (((v_Vuna_dCompiler_dFrontend_dToml_dlookupEntryLine mc0) mc1) dtb__382))
  | _ -> failwith "DT: impossible branch"
)
  | Base_dData_dList.C_Base_dData_dList_dList_Nil -> Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Nothing
  | _ -> failwith "DT: impossible branch"
))

# 1039 "Vuna/Compiler/Frontend/Toml.vuna"
let v_Vuna_dCompiler_dFrontend_dToml_dchildSectionOf = (fun (prefix : string Base_dData_dList.t_Base_dData_dList_dList) (section : string Base_dData_dList.t_Base_dData_dList_dList) -> ((fun nd_uscrut2 -> (match nd_uscrut2 with
  | Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Just (dtb__387) -> (match dtb__387 with
  | { Base_dData_dPair.f_Base_dData_dPair_dPair_first = dtb__388; Base_dData_dPair.f_Base_dData_dPair_dPair_second = dtb__389 } -> (if (((v_Vuna_dCompiler_dFrontend_dToml_dsamePath Base_dData_dString.v_Eq_uString) dtb__388) prefix) then ((fun nd_uscrut9 -> (match nd_uscrut9 with
  | Base_dData_dList.C_Base_dData_dList_dList__x58__x58_ (dtb__390, dtb__391) -> (match dtb__391 with
  | Base_dData_dList.C_Base_dData_dList_dList_Nil -> (Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Just (dtb__390))
  | _ -> Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Nothing
)
  | _ -> Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Nothing
)) dtb__389) else Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Nothing)
  | _ -> failwith "DT: impossible branch"
)
  | Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Nothing -> Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Nothing
  | _ -> failwith "DT: impossible branch"
)) ((v_Vuna_dCompiler_dFrontend_dToml_dsplitAtList (v_Vuna_dCompiler_dFrontend_dToml_dlenInt prefix)) section)))

# 1025 "Vuna/Compiler/Frontend/Toml.vuna"
let rec v_Vuna_dCompiler_dFrontend_dToml_dsectionsUnderGo = (fun (mc0 : string Base_dData_dList.t_Base_dData_dList_dList) (mc1 : t_Vuna_dCompiler_dFrontend_dToml_dTomlEntry Base_dData_dList.t_Base_dData_dList_dList) (mc2 : string Base_dData_dList.t_Base_dData_dList_dList) -> (match mc1 with
  | Base_dData_dList.C_Base_dData_dList_dList__x58__x58_ (dtb__392, dtb__393) -> (match dtb__392 with
  | { f_Vuna_dCompiler_dFrontend_dToml_dTomlEntry_tomlEntrySection = dtb__394; f_Vuna_dCompiler_dFrontend_dToml_dTomlEntry_tomlEntryKey = dtb__395; f_Vuna_dCompiler_dFrontend_dToml_dTomlEntry_tomlEntryValue = dtb__396; f_Vuna_dCompiler_dFrontend_dToml_dTomlEntry_tomlEntryLine = dtb__397 } -> ((fun childName -> (match childName with
  | Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Nothing -> (((v_Vuna_dCompiler_dFrontend_dToml_dsectionsUnderGo mc0) dtb__393) mc2)
  | Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Just (dtb__398) -> (if ((Base_dData_dList.v_Base_dData_dList_dmemName dtb__398) mc2) then (((v_Vuna_dCompiler_dFrontend_dToml_dsectionsUnderGo mc0) dtb__393) mc2) else (((v_Vuna_dCompiler_dFrontend_dToml_dsectionsUnderGo mc0) dtb__393) (Base_dData_dList.C_Base_dData_dList_dList__x58__x58_ (dtb__398, mc2))))
  | _ -> failwith "DT: impossible branch"
)) ((v_Vuna_dCompiler_dFrontend_dToml_dchildSectionOf mc0) dtb__394))
  | _ -> failwith "DT: impossible branch"
)
  | Base_dData_dList.C_Base_dData_dList_dList_Nil -> (Base_dData_dList.v_Base_dData_dList_dreverse mc2)
  | _ -> failwith "DT: impossible branch"
))

# 1022 "Vuna/Compiler/Frontend/Toml.vuna"
let v_Vuna_dCompiler_dFrontend_dToml_dsectionsUnder = (fun (prefix : string Base_dData_dList.t_Base_dData_dList_dList) (entries : t_Vuna_dCompiler_dFrontend_dToml_dTomlEntry Base_dData_dList.t_Base_dData_dList_dList) -> (((v_Vuna_dCompiler_dFrontend_dToml_dsectionsUnderGo prefix) entries) Base_dData_dList.C_Base_dData_dList_dList_Nil))
