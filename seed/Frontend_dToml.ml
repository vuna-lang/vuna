open Vuna_runtime
type t_TomlValue = C_TomlValue_TStr of (string) | C_TomlValue_TInt of (int) | C_TomlValue_TBool of (bool) | C_TomlValue_TArray of (t_TomlValue B_dData_dList.t_List) | C_TomlValue_TTable of ((string, t_TomlValue) B_dData_dPair.t_Pair B_dData_dList.t_List) | C_TomlValue_TTableArray of ((string, t_TomlValue) B_dData_dPair.t_Pair B_dData_dList.t_List B_dData_dList.t_List)
and t_TomlEntry = { f_TomlEntry_tomlEntrySection : string B_dData_dList.t_List; f_TomlEntry_tomlEntryKey : string; f_TomlEntry_tomlEntryValue : t_TomlValue; f_TomlEntry_tomlEntryLine : int }
and t_TomlCursor = { f_TomlCursor_cursorChars : int B_dData_dList.t_List; f_TomlCursor_cursorLine : int; f_TomlCursor_cursorCol : int }
and t_TableKind = C_TableKind_KindImplicit | C_TableKind_KindDotted | C_TableKind_KindExplicit
and t_TomlNode = C_TomlNode_NodeLeaf of (t_TomlValue) * (int) | C_TomlNode_NodeTable of ((string, t_TomlNode) B_dData_dPair.t_Pair B_dData_dList.t_List) * (t_TableKind) * (int) | C_TomlNode_NodeTableArray of ((string, t_TomlNode) B_dData_dPair.t_Pair B_dData_dList.t_List B_dData_dList.t_List) * (int)

# 77 "Vuna/Compiler/Frontend/Toml.vuna"
let rec v_lenInt = (fun dtb_u_u2 -> (match dtb_u_u2 with
  | B_dData_dList.C_List__x58__x58_ (dtb_u_u3, dtb_u_u4) -> (1 + (v_lenInt dtb_u_u4))
  | B_dData_dList.C_List_Nil -> 0
  | _ -> failwith "DT: impossible branch"
))

# 82 "Vuna/Compiler/Frontend/Toml.vuna"
let v_cursorFuel = (fun (dtb_u_u5 : t_TomlCursor) -> (match dtb_u_u5 with
  | { f_TomlCursor_cursorChars = dtb_u_u6; f_TomlCursor_cursorLine = dtb_u_u7; f_TomlCursor_cursorCol = dtb_u_u8 } -> ((2 * (v_lenInt dtb_u_u6)) + 16)
  | _ -> failwith "DT: impossible branch"
))

# 89 "Vuna/Compiler/Frontend/Toml.vuna"
let rec v_countLines = (fun (dtb_u_u9 : int B_dData_dList.t_List) -> (match dtb_u_u9 with
  | B_dData_dList.C_List__x58__x58_ (dtb_u_u10, dtb_u_u11) -> (if (dtb_u_u10 = 10) then (1 + (v_countLines dtb_u_u11)) else (v_countLines dtb_u_u11))
  | B_dData_dList.C_List_Nil -> 1
  | _ -> failwith "DT: impossible branch"
))

# 86 "Vuna/Compiler/Frontend/Toml.vuna"
let v_lineFuel = (fun (dtb_u_u12 : t_TomlCursor) -> (match dtb_u_u12 with
  | { f_TomlCursor_cursorChars = dtb_u_u13; f_TomlCursor_cursorLine = dtb_u_u14; f_TomlCursor_cursorCol = dtb_u_u15 } -> ((4 * (v_countLines dtb_u_u13)) + 16)
  | _ -> failwith "DT: impossible branch"
))

# 94 "Vuna/Compiler/Frontend/Toml.vuna"
let v_pathFuel = (fun (dtb_u_u16 : string B_dData_dList.t_List) -> ((2 * (v_lenInt dtb_u_u16)) + 4))

# 98 "Vuna/Compiler/Frontend/Toml.vuna"
let v_flattenFuel = (fun (dtb_u_u17 : t_TomlCursor) -> ((v_cursorFuel dtb_u_u17) + (v_lineFuel dtb_u_u17)))

# 101 "Vuna/Compiler/Frontend/Toml.vuna"
let v_advanceCursor = (fun (dtb_u_u18 : t_TomlCursor) -> (match dtb_u_u18 with
  | { f_TomlCursor_cursorChars = dtb_u_u19; f_TomlCursor_cursorLine = dtb_u_u20; f_TomlCursor_cursorCol = dtb_u_u21 } -> (match dtb_u_u19 with
  | B_dData_dList.C_List__x58__x58_ (dtb_u_u22, dtb_u_u23) -> (if (dtb_u_u22 = 10) then { f_TomlCursor_cursorChars = dtb_u_u23; f_TomlCursor_cursorLine = (dtb_u_u20 + 1); f_TomlCursor_cursorCol = 1 } else { f_TomlCursor_cursorChars = dtb_u_u23; f_TomlCursor_cursorLine = dtb_u_u20; f_TomlCursor_cursorCol = (dtb_u_u21 + 1) })
  | B_dData_dList.C_List_Nil -> { f_TomlCursor_cursorChars = B_dData_dList.C_List_Nil; f_TomlCursor_cursorLine = dtb_u_u20; f_TomlCursor_cursorCol = dtb_u_u21 }
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
))

# 107 "Vuna/Compiler/Frontend/Toml.vuna"
let v_isDigitChar = (fun (dtb_u_u24 : int) -> (if (dtb_u_u24 >= 48) then (dtb_u_u24 <= 57) else false))

# 110 "Vuna/Compiler/Frontend/Toml.vuna"
let v_isUpperAlphaChar = (fun (dtb_u_u25 : int) -> (if (dtb_u_u25 >= 65) then (dtb_u_u25 <= 90) else false))

# 113 "Vuna/Compiler/Frontend/Toml.vuna"
let v_isLowerAlphaChar = (fun (dtb_u_u26 : int) -> (if (dtb_u_u26 >= 97) then (dtb_u_u26 <= 122) else false))

# 116 "Vuna/Compiler/Frontend/Toml.vuna"
let v_isAlphaChar = (fun (dtb_u_u27 : int) -> (if (v_isUpperAlphaChar dtb_u_u27) then true else (v_isLowerAlphaChar dtb_u_u27)))

# 119 "Vuna/Compiler/Frontend/Toml.vuna"
let v_isBareKeyChar = (fun (dtb_u_u28 : int) -> (if (if (if (v_isAlphaChar dtb_u_u28) then true else (v_isDigitChar dtb_u_u28)) then true else (dtb_u_u28 = 95)) then true else (dtb_u_u28 = 45)))

# 122 "Vuna/Compiler/Frontend/Toml.vuna"
let v_isHexDigit = (fun (dtb_u_u29 : int) -> (if (if (v_isDigitChar dtb_u_u29) then true else (if (dtb_u_u29 >= 65) then (dtb_u_u29 <= 70) else false)) then true else (if (dtb_u_u29 >= 97) then (dtb_u_u29 <= 102) else false)))

# 125 "Vuna/Compiler/Frontend/Toml.vuna"
let v_hexValue = (fun (dtb_u_u30 : int) -> (if (v_isDigitChar dtb_u_u30) then (dtb_u_u30 - 48) else (if (if (dtb_u_u30 >= 65) then (dtb_u_u30 <= 70) else false) then (dtb_u_u30 - 55) else (dtb_u_u30 - 87))))

# 128 "Vuna/Compiler/Frontend/Toml.vuna"
let v_isBlankChar = (fun (dtb_u_u31 : int) -> (if (dtb_u_u31 = 32) then true else (dtb_u_u31 = 9)))

# 132 "Vuna/Compiler/Frontend/Toml.vuna"
let rec v_dropChars = (fun (dtb_u_u32 : int) (dtb_u_u33 : int B_dData_dList.t_List) -> (if (dtb_u_u32 <= 0) then dtb_u_u33 else (match dtb_u_u33 with
  | B_dData_dList.C_List_Nil -> B_dData_dList.C_List_Nil
  | B_dData_dList.C_List__x58__x58_ (dtb_u_u34, dtb_u_u35) -> ((v_dropChars (dtb_u_u32 - 1)) dtb_u_u35)
  | _ -> failwith "DT: impossible branch"
)))

# 142 "Vuna/Compiler/Frontend/Toml.vuna"
let rec v_advanceChars = (fun (dtb_u_u36 : int) (dtb_u_u37 : t_TomlCursor) -> (if (dtb_u_u36 <= 0) then dtb_u_u37 else ((v_advanceChars (dtb_u_u36 - 1)) (v_advanceCursor dtb_u_u37))))

# 146 "Vuna/Compiler/Frontend/Toml.vuna"
let v_startsWithTripleOf = (fun (dtb_u_u38 : int) (dtb_u_u39 : int B_dData_dList.t_List) -> (match dtb_u_u39 with
  | B_dData_dList.C_List__x58__x58_ (dtb_u_u40, dtb_u_u41) -> (match dtb_u_u41 with
  | B_dData_dList.C_List__x58__x58_ (dtb_u_u42, dtb_u_u43) -> (match dtb_u_u43 with
  | B_dData_dList.C_List__x58__x58_ (dtb_u_u44, dtb_u_u45) -> (if (if (dtb_u_u40 = dtb_u_u38) then (dtb_u_u42 = dtb_u_u38) else false) then (dtb_u_u44 = dtb_u_u38) else false)
  | _ -> false
)
  | _ -> false
)
  | _ -> false
))

# 151 "Vuna/Compiler/Frontend/Toml.vuna"
let[@tail_mod_cons] rec v_stripCR = (fun (dtb_u_u46 : int B_dData_dList.t_List) -> (match dtb_u_u46 with
  | B_dData_dList.C_List__x58__x58_ (dtb_u_u47, dtb_u_u48) -> (if (dtb_u_u47 = 13) then (v_stripCR dtb_u_u48) else (B_dData_dList.C_List__x58__x58_ (dtb_u_u47, (v_stripCR dtb_u_u48))))
  | B_dData_dList.C_List_Nil -> B_dData_dList.C_List_Nil
  | _ -> failwith "DT: impossible branch"
))

# 155 "Vuna/Compiler/Frontend/Toml.vuna"
let v_failAt = (fun (dtb_u_u50 : string) (dtb_u_u51 : int) (dtb_u_u52 : string) -> ((((Base_dDiagnostics_dPkg.v_pkgAt1 dtb_u_u50) dtb_u_u51) (Base_dDiagnostics_dPkg.C_PkgErr_TomlSyntax (dtb_u_u52))) dtb_u_u52))

# 158 "Vuna/Compiler/Frontend/Toml.vuna"
let v_appendPath = (fun (dtb_u_u53 : string B_dData_dList.t_List) (dtb_u_u54 : string B_dData_dList.t_List) -> ((B_dData_dList.v_append dtb_u_u53) dtb_u_u54))

# 161 "Vuna/Compiler/Frontend/Toml.vuna"
let rec v_splitLast = (fun (dtb_u_u55 : string B_dData_dList.t_List) -> (match dtb_u_u55 with
  | B_dData_dList.C_List__x58__x58_ (dtb_u_u56, dtb_u_u57) -> (match dtb_u_u57 with
  | B_dData_dList.C_List_Nil -> (B_dData_dMaybe.C_Maybe_Just ({ B_dData_dPair.f_Pair_first = B_dData_dList.C_List_Nil; B_dData_dPair.f_Pair_second = dtb_u_u56 }))
  | _ -> (let dtb_u_u58 = (v_splitLast dtb_u_u57) in (match dtb_u_u58 with
  | B_dData_dMaybe.C_Maybe_Just (dtb_u_u59) -> (match dtb_u_u59 with
  | { B_dData_dPair.f_Pair_first = dtb_u_u60; B_dData_dPair.f_Pair_second = dtb_u_u61 } -> (B_dData_dMaybe.C_Maybe_Just ({ B_dData_dPair.f_Pair_first = (B_dData_dList.C_List__x58__x58_ (dtb_u_u56, dtb_u_u60)); B_dData_dPair.f_Pair_second = dtb_u_u61 }))
  | _ -> failwith "DT: impossible branch"
)
  | B_dData_dMaybe.C_Maybe_Nothing -> B_dData_dMaybe.C_Maybe_Nothing
  | _ -> failwith "DT: impossible branch"
))
)
  | B_dData_dList.C_List_Nil -> B_dData_dMaybe.C_Maybe_Nothing
  | _ -> failwith "DT: impossible branch"
))

# 170 "Vuna/Compiler/Frontend/Toml.vuna"
let rec v_lookupField = (fun (dtb_u_u62 : string) (dtb_u_u63 : (string, t_TomlNode) B_dData_dPair.t_Pair B_dData_dList.t_List) -> (match dtb_u_u63 with
  | B_dData_dList.C_List__x58__x58_ (dtb_u_u64, dtb_u_u65) -> (match dtb_u_u64 with
  | { B_dData_dPair.f_Pair_first = dtb_u_u66; B_dData_dPair.f_Pair_second = dtb_u_u67 } -> (if (dtb_u_u66 = dtb_u_u62) then (B_dData_dMaybe.C_Maybe_Just (dtb_u_u67)) else ((v_lookupField dtb_u_u62) dtb_u_u65))
  | _ -> failwith "DT: impossible branch"
)
  | B_dData_dList.C_List_Nil -> B_dData_dMaybe.C_Maybe_Nothing
  | _ -> failwith "DT: impossible branch"
))

# 174 "Vuna/Compiler/Frontend/Toml.vuna"
let[@tail_mod_cons] rec v_replaceField = (fun (dtb_u_u68 : string) (dtb_u_u69 : t_TomlNode) (dtb_u_u70 : (string, t_TomlNode) B_dData_dPair.t_Pair B_dData_dList.t_List) -> (match dtb_u_u70 with
  | B_dData_dList.C_List__x58__x58_ (dtb_u_u71, dtb_u_u72) -> (match dtb_u_u71 with
  | { B_dData_dPair.f_Pair_first = dtb_u_u73; B_dData_dPair.f_Pair_second = dtb_u_u74 } -> (if (dtb_u_u73 = dtb_u_u68) then (B_dData_dList.C_List__x58__x58_ ({ B_dData_dPair.f_Pair_first = dtb_u_u73; B_dData_dPair.f_Pair_second = dtb_u_u69 }, dtb_u_u72)) else (B_dData_dList.C_List__x58__x58_ ({ B_dData_dPair.f_Pair_first = dtb_u_u73; B_dData_dPair.f_Pair_second = dtb_u_u74 }, (((v_replaceField dtb_u_u68) dtb_u_u69) dtb_u_u72))))
  | _ -> failwith "DT: impossible branch"
)
  | B_dData_dList.C_List_Nil -> (B_dData_dList.C_List__x58__x58_ ({ B_dData_dPair.f_Pair_first = dtb_u_u68; B_dData_dPair.f_Pair_second = dtb_u_u69 }, B_dData_dList.C_List_Nil))
  | _ -> failwith "DT: impossible branch"
))

# 180 "Vuna/Compiler/Frontend/Toml.vuna"
let rec v_lastFields = (fun (dtb_u_u75 : (string, t_TomlNode) B_dData_dPair.t_Pair B_dData_dList.t_List B_dData_dList.t_List) -> (match dtb_u_u75 with
  | B_dData_dList.C_List__x58__x58_ (dtb_u_u76, dtb_u_u77) -> (match dtb_u_u77 with
  | B_dData_dList.C_List_Nil -> (B_dData_dMaybe.C_Maybe_Just (dtb_u_u76))
  | _ -> (v_lastFields dtb_u_u77)
)
  | B_dData_dList.C_List_Nil -> B_dData_dMaybe.C_Maybe_Nothing
  | _ -> failwith "DT: impossible branch"
))

# 185 "Vuna/Compiler/Frontend/Toml.vuna"
let[@tail_mod_cons] rec v_replaceLastFields = (fun (dtb_u_u78 : (string, t_TomlNode) B_dData_dPair.t_Pair B_dData_dList.t_List) (dtb_u_u79 : (string, t_TomlNode) B_dData_dPair.t_Pair B_dData_dList.t_List B_dData_dList.t_List) -> (match dtb_u_u79 with
  | B_dData_dList.C_List__x58__x58_ (dtb_u_u80, dtb_u_u81) -> (match dtb_u_u81 with
  | B_dData_dList.C_List_Nil -> (B_dData_dList.C_List__x58__x58_ (dtb_u_u78, B_dData_dList.C_List_Nil))
  | _ -> (B_dData_dList.C_List__x58__x58_ (dtb_u_u80, ((v_replaceLastFields dtb_u_u78) dtb_u_u81)))
)
  | B_dData_dList.C_List_Nil -> (B_dData_dList.C_List__x58__x58_ (dtb_u_u78, B_dData_dList.C_List_Nil))
  | _ -> failwith "DT: impossible branch"
))

# 190 "Vuna/Compiler/Frontend/Toml.vuna"
let v_kindIsExplicit = (fun (dtb_u_u82 : t_TableKind) -> (match dtb_u_u82 with
  | C_TableKind_KindExplicit -> true
  | _ -> false
))

# 194 "Vuna/Compiler/Frontend/Toml.vuna"
let v_kindIsDotted = (fun (dtb_u_u83 : t_TableKind) -> (match dtb_u_u83 with
  | C_TableKind_KindDotted -> true
  | _ -> false
))

# 200 "Vuna/Compiler/Frontend/Toml.vuna"
let rec v_ensureTable = (fun (dtb_u_u84 : int) (dtb_u_u85 : string) (dtb_u_u86 : int) (dtb_u_u87 : string B_dData_dList.t_List) (dtb_u_u88 : t_TableKind) (dtb_u_u89 : (string, t_TomlNode) B_dData_dPair.t_Pair B_dData_dList.t_List) -> (if (dtb_u_u84 <= 0) then (Base_dDiag.v_icFuel "toml") else (let dtb_u_u90 = dtb_u_u87 in (match dtb_u_u90 with
  | B_dData_dList.C_List__x58__x58_ (dtb_u_u91, dtb_u_u92) -> (match dtb_u_u92 with
  | B_dData_dList.C_List_Nil -> (match ((v_lookupField dtb_u_u91) dtb_u_u89) with
  | B_dData_dMaybe.C_Maybe_Nothing -> (Base_dDiag.C_Check_OkC (((B_dData_dList.v_append dtb_u_u89) (B_dData_dList.C_List__x58__x58_ ({ B_dData_dPair.f_Pair_first = dtb_u_u91; B_dData_dPair.f_Pair_second = (C_TomlNode_NodeTable (B_dData_dList.C_List_Nil, dtb_u_u88, dtb_u_u86)) }, B_dData_dList.C_List_Nil)))))
  | B_dData_dMaybe.C_Maybe_Just (dtb_u_u93) -> (match dtb_u_u93 with
  | C_TomlNode_NodeTable (dtb_u_u94, dtb_u_u95, dtb_u_u96) -> (if (if (v_kindIsExplicit dtb_u_u88) then (v_kindIsExplicit dtb_u_u95) else false) then (((v_failAt dtb_u_u85) dtb_u_u86) (String.concat "" ["duplicate table ["; dtb_u_u91; "]"])) else (if (if (v_kindIsExplicit dtb_u_u88) then (v_kindIsDotted dtb_u_u95) else false) then (((v_failAt dtb_u_u85) dtb_u_u86) (String.concat "" ["table ["; dtb_u_u91; "] was already defined by dotted keys"])) else (Base_dDiag.C_Check_OkC ((((v_replaceField dtb_u_u91) (C_TomlNode_NodeTable (dtb_u_u94, dtb_u_u88, dtb_u_u96))) dtb_u_u89)))))
  | _ -> (((v_failAt dtb_u_u85) dtb_u_u86) (String.concat "" ["key \""; dtb_u_u91; "\" is not a table"]))
)
  | _ -> failwith "DT: impossible branch"
)
  | _ -> (match ((v_lookupField dtb_u_u91) dtb_u_u89) with
  | B_dData_dMaybe.C_Maybe_Nothing -> (match ((((((v_ensureTable (dtb_u_u84 - 1)) dtb_u_u85) dtb_u_u86) dtb_u_u92) dtb_u_u88) B_dData_dList.C_List_Nil) with
  | Base_dDiag.C_Check_ErrC (dtb_u_u97) -> (Base_dDiag.C_Check_ErrC (dtb_u_u97))
  | Base_dDiag.C_Check_OkC (dtb_u_u98) -> (Base_dDiag.C_Check_OkC (((B_dData_dList.v_append dtb_u_u89) (B_dData_dList.C_List__x58__x58_ ({ B_dData_dPair.f_Pair_first = dtb_u_u91; B_dData_dPair.f_Pair_second = (C_TomlNode_NodeTable (dtb_u_u98, C_TableKind_KindImplicit, dtb_u_u86)) }, B_dData_dList.C_List_Nil)))))
  | _ -> failwith "DT: impossible branch"
)
  | B_dData_dMaybe.C_Maybe_Just (dtb_u_u99) -> (match dtb_u_u99 with
  | C_TomlNode_NodeTable (dtb_u_u100, dtb_u_u101, dtb_u_u102) -> (match ((((((v_ensureTable (dtb_u_u84 - 1)) dtb_u_u85) dtb_u_u86) dtb_u_u92) dtb_u_u88) dtb_u_u100) with
  | Base_dDiag.C_Check_ErrC (dtb_u_u103) -> (Base_dDiag.C_Check_ErrC (dtb_u_u103))
  | Base_dDiag.C_Check_OkC (dtb_u_u104) -> (Base_dDiag.C_Check_OkC ((((v_replaceField dtb_u_u91) (C_TomlNode_NodeTable (dtb_u_u104, dtb_u_u101, dtb_u_u102))) dtb_u_u89)))
  | _ -> failwith "DT: impossible branch"
)
  | C_TomlNode_NodeTableArray (dtb_u_u105, dtb_u_u106) -> (match (v_lastFields dtb_u_u105) with
  | B_dData_dMaybe.C_Maybe_Just (dtb_u_u107) -> (match ((((((v_ensureTable (dtb_u_u84 - 1)) dtb_u_u85) dtb_u_u86) dtb_u_u92) dtb_u_u88) dtb_u_u107) with
  | Base_dDiag.C_Check_ErrC (dtb_u_u108) -> (Base_dDiag.C_Check_ErrC (dtb_u_u108))
  | Base_dDiag.C_Check_OkC (dtb_u_u109) -> (Base_dDiag.C_Check_OkC ((((v_replaceField dtb_u_u91) (C_TomlNode_NodeTableArray (((v_replaceLastFields dtb_u_u109) dtb_u_u105), dtb_u_u106))) dtb_u_u89)))
  | _ -> failwith "DT: impossible branch"
)
  | B_dData_dMaybe.C_Maybe_Nothing -> (((v_failAt dtb_u_u85) dtb_u_u86) (String.concat "" ["table array \""; dtb_u_u91; "\" has no current element"]))
  | _ -> failwith "DT: impossible branch"
)
  | C_TomlNode_NodeLeaf (dtb_u_u110, dtb_u_u111) -> (((v_failAt dtb_u_u85) dtb_u_u111) (String.concat "" ["key \""; dtb_u_u91; "\" is not a table"]))
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
)
)
  | B_dData_dList.C_List_Nil -> (((v_failAt dtb_u_u85) dtb_u_u86) "empty table path")
  | _ -> failwith "DT: impossible branch"
))))

# 236 "Vuna/Compiler/Frontend/Toml.vuna"
let rec v_appendTableArray = (fun (dtb_u_u112 : int) (dtb_u_u113 : string) (dtb_u_u114 : int) (dtb_u_u115 : string B_dData_dList.t_List) (dtb_u_u116 : (string, t_TomlNode) B_dData_dPair.t_Pair B_dData_dList.t_List) -> (if (dtb_u_u112 <= 0) then (Base_dDiag.v_icFuel "toml") else (let dtb_u_u117 = dtb_u_u115 in (match dtb_u_u117 with
  | B_dData_dList.C_List__x58__x58_ (dtb_u_u118, dtb_u_u119) -> (match dtb_u_u119 with
  | B_dData_dList.C_List_Nil -> (match ((v_lookupField dtb_u_u118) dtb_u_u116) with
  | B_dData_dMaybe.C_Maybe_Nothing -> (Base_dDiag.C_Check_OkC (((B_dData_dList.v_append dtb_u_u116) (B_dData_dList.C_List__x58__x58_ ({ B_dData_dPair.f_Pair_first = dtb_u_u118; B_dData_dPair.f_Pair_second = (C_TomlNode_NodeTableArray ((B_dData_dList.C_List__x58__x58_ (B_dData_dList.C_List_Nil, B_dData_dList.C_List_Nil)), dtb_u_u114)) }, B_dData_dList.C_List_Nil)))))
  | B_dData_dMaybe.C_Maybe_Just (dtb_u_u120) -> (match dtb_u_u120 with
  | C_TomlNode_NodeTableArray (dtb_u_u121, dtb_u_u122) -> (Base_dDiag.C_Check_OkC ((((v_replaceField dtb_u_u118) (C_TomlNode_NodeTableArray (((B_dData_dList.v_append dtb_u_u121) (B_dData_dList.C_List__x58__x58_ (B_dData_dList.C_List_Nil, B_dData_dList.C_List_Nil))), dtb_u_u122))) dtb_u_u116)))
  | C_TomlNode_NodeTable (dtb_u_u123, dtb_u_u124, dtb_u_u125) -> (((v_failAt dtb_u_u113) dtb_u_u125) (String.concat "" ["table ["; dtb_u_u118; "] cannot become a table array"]))
  | C_TomlNode_NodeLeaf (dtb_u_u126, dtb_u_u127) -> (((v_failAt dtb_u_u113) dtb_u_u127) (String.concat "" ["key \""; dtb_u_u118; "\" is not a table"]))
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
)
  | _ -> (match ((v_lookupField dtb_u_u118) dtb_u_u116) with
  | B_dData_dMaybe.C_Maybe_Nothing -> (match (((((v_appendTableArray (dtb_u_u112 - 1)) dtb_u_u113) dtb_u_u114) dtb_u_u119) B_dData_dList.C_List_Nil) with
  | Base_dDiag.C_Check_ErrC (dtb_u_u128) -> (Base_dDiag.C_Check_ErrC (dtb_u_u128))
  | Base_dDiag.C_Check_OkC (dtb_u_u129) -> (Base_dDiag.C_Check_OkC (((B_dData_dList.v_append dtb_u_u116) (B_dData_dList.C_List__x58__x58_ ({ B_dData_dPair.f_Pair_first = dtb_u_u118; B_dData_dPair.f_Pair_second = (C_TomlNode_NodeTable (dtb_u_u129, C_TableKind_KindImplicit, dtb_u_u114)) }, B_dData_dList.C_List_Nil)))))
  | _ -> failwith "DT: impossible branch"
)
  | B_dData_dMaybe.C_Maybe_Just (dtb_u_u130) -> (match dtb_u_u130 with
  | C_TomlNode_NodeTable (dtb_u_u131, dtb_u_u132, dtb_u_u133) -> (match (((((v_appendTableArray (dtb_u_u112 - 1)) dtb_u_u113) dtb_u_u114) dtb_u_u119) dtb_u_u131) with
  | Base_dDiag.C_Check_ErrC (dtb_u_u134) -> (Base_dDiag.C_Check_ErrC (dtb_u_u134))
  | Base_dDiag.C_Check_OkC (dtb_u_u135) -> (Base_dDiag.C_Check_OkC ((((v_replaceField dtb_u_u118) (C_TomlNode_NodeTable (dtb_u_u135, dtb_u_u132, dtb_u_u133))) dtb_u_u116)))
  | _ -> failwith "DT: impossible branch"
)
  | C_TomlNode_NodeTableArray (dtb_u_u136, dtb_u_u137) -> (match (v_lastFields dtb_u_u136) with
  | B_dData_dMaybe.C_Maybe_Just (dtb_u_u138) -> (match (((((v_appendTableArray (dtb_u_u112 - 1)) dtb_u_u113) dtb_u_u114) dtb_u_u119) dtb_u_u138) with
  | Base_dDiag.C_Check_ErrC (dtb_u_u139) -> (Base_dDiag.C_Check_ErrC (dtb_u_u139))
  | Base_dDiag.C_Check_OkC (dtb_u_u140) -> (Base_dDiag.C_Check_OkC ((((v_replaceField dtb_u_u118) (C_TomlNode_NodeTableArray (((v_replaceLastFields dtb_u_u140) dtb_u_u136), dtb_u_u137))) dtb_u_u116)))
  | _ -> failwith "DT: impossible branch"
)
  | B_dData_dMaybe.C_Maybe_Nothing -> (((v_failAt dtb_u_u113) dtb_u_u114) (String.concat "" ["table array \""; dtb_u_u118; "\" has no current element"]))
  | _ -> failwith "DT: impossible branch"
)
  | C_TomlNode_NodeLeaf (dtb_u_u141, dtb_u_u142) -> (((v_failAt dtb_u_u113) dtb_u_u142) (String.concat "" ["key \""; dtb_u_u118; "\" is not a table"]))
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
)
)
  | B_dData_dList.C_List_Nil -> (((v_failAt dtb_u_u113) dtb_u_u114) "empty table array path")
  | _ -> failwith "DT: impossible branch"
))))

# 273 "Vuna/Compiler/Frontend/Toml.vuna"
let v_sectionOfPath = (fun (dtb_u_u143 : string B_dData_dList.t_List) -> (let dtb_u_u144 = (v_splitLast dtb_u_u143) in (match dtb_u_u144 with
  | B_dData_dMaybe.C_Maybe_Nothing -> B_dData_dList.C_List_Nil
  | B_dData_dMaybe.C_Maybe_Just (dtb_u_u145) -> (match dtb_u_u145 with
  | { B_dData_dPair.f_Pair_first = dtb_u_u146; B_dData_dPair.f_Pair_second = dtb_u_u147 } -> dtb_u_u146
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
)))

# 279 "Vuna/Compiler/Frontend/Toml.vuna"
let v_duplicateKeyMsg = (fun (dtb_u_u148 : string) (dtb_u_u149 : string B_dData_dList.t_List) -> (if ((v_lenInt dtb_u_u149) = 0) then (String.concat "" ["duplicate key \""; dtb_u_u148; "\""]) else (String.concat "" ["duplicate key \""; dtb_u_u148; "\" in ["; (Base_dSource.v_joinDots dtb_u_u149); "]"])))

# 287 "Vuna/Compiler/Frontend/Toml.vuna"
let rec v_insertValue = (fun (dtb_u_u150 : int) (dtb_u_u151 : string) (dtb_u_u152 : int) (dtb_u_u153 : string B_dData_dList.t_List) (dtb_u_u154 : string B_dData_dList.t_List) (dtb_u_u155 : t_TomlValue) (dtb_u_u156 : (string, t_TomlNode) B_dData_dPair.t_Pair B_dData_dList.t_List) -> (if (dtb_u_u150 <= 0) then (Base_dDiag.v_icFuel "toml") else (let dtb_u_u157 = dtb_u_u153 in (match dtb_u_u157 with
  | B_dData_dList.C_List__x58__x58_ (dtb_u_u158, dtb_u_u159) -> (match dtb_u_u159 with
  | B_dData_dList.C_List_Nil -> (match ((v_lookupField dtb_u_u158) dtb_u_u156) with
  | B_dData_dMaybe.C_Maybe_Nothing -> (Base_dDiag.C_Check_OkC (((B_dData_dList.v_append dtb_u_u156) (B_dData_dList.C_List__x58__x58_ ({ B_dData_dPair.f_Pair_first = dtb_u_u158; B_dData_dPair.f_Pair_second = (C_TomlNode_NodeLeaf (dtb_u_u155, dtb_u_u152)) }, B_dData_dList.C_List_Nil)))))
  | B_dData_dMaybe.C_Maybe_Just (dtb_u_u160) -> (match dtb_u_u160 with
  | C_TomlNode_NodeLeaf (dtb_u_u161, dtb_u_u162) -> (((v_failAt dtb_u_u151) dtb_u_u152) ((v_duplicateKeyMsg dtb_u_u158) dtb_u_u154))
  | _ -> (((v_failAt dtb_u_u151) dtb_u_u152) (String.concat "" ["key \""; dtb_u_u158; "\" conflicts with a table"]))
)
  | _ -> failwith "DT: impossible branch"
)
  | _ -> (match ((v_lookupField dtb_u_u158) dtb_u_u156) with
  | B_dData_dMaybe.C_Maybe_Nothing -> (match (((((((v_insertValue (dtb_u_u150 - 1)) dtb_u_u151) dtb_u_u152) dtb_u_u159) dtb_u_u154) dtb_u_u155) B_dData_dList.C_List_Nil) with
  | Base_dDiag.C_Check_ErrC (dtb_u_u163) -> (Base_dDiag.C_Check_ErrC (dtb_u_u163))
  | Base_dDiag.C_Check_OkC (dtb_u_u164) -> (Base_dDiag.C_Check_OkC (((B_dData_dList.v_append dtb_u_u156) (B_dData_dList.C_List__x58__x58_ ({ B_dData_dPair.f_Pair_first = dtb_u_u158; B_dData_dPair.f_Pair_second = (C_TomlNode_NodeTable (dtb_u_u164, C_TableKind_KindDotted, dtb_u_u152)) }, B_dData_dList.C_List_Nil)))))
  | _ -> failwith "DT: impossible branch"
)
  | B_dData_dMaybe.C_Maybe_Just (dtb_u_u165) -> (match dtb_u_u165 with
  | C_TomlNode_NodeTable (dtb_u_u166, dtb_u_u167, dtb_u_u168) -> (match (((((((v_insertValue (dtb_u_u150 - 1)) dtb_u_u151) dtb_u_u152) dtb_u_u159) dtb_u_u154) dtb_u_u155) dtb_u_u166) with
  | Base_dDiag.C_Check_ErrC (dtb_u_u169) -> (Base_dDiag.C_Check_ErrC (dtb_u_u169))
  | Base_dDiag.C_Check_OkC (dtb_u_u170) -> (Base_dDiag.C_Check_OkC ((((v_replaceField dtb_u_u158) (C_TomlNode_NodeTable (dtb_u_u170, dtb_u_u167, dtb_u_u168))) dtb_u_u156)))
  | _ -> failwith "DT: impossible branch"
)
  | C_TomlNode_NodeTableArray (dtb_u_u171, dtb_u_u172) -> (match (v_lastFields dtb_u_u171) with
  | B_dData_dMaybe.C_Maybe_Just (dtb_u_u173) -> (match (((((((v_insertValue (dtb_u_u150 - 1)) dtb_u_u151) dtb_u_u152) dtb_u_u159) dtb_u_u154) dtb_u_u155) dtb_u_u173) with
  | Base_dDiag.C_Check_ErrC (dtb_u_u174) -> (Base_dDiag.C_Check_ErrC (dtb_u_u174))
  | Base_dDiag.C_Check_OkC (dtb_u_u175) -> (Base_dDiag.C_Check_OkC ((((v_replaceField dtb_u_u158) (C_TomlNode_NodeTableArray (((v_replaceLastFields dtb_u_u175) dtb_u_u171), dtb_u_u172))) dtb_u_u156)))
  | _ -> failwith "DT: impossible branch"
)
  | B_dData_dMaybe.C_Maybe_Nothing -> (((v_failAt dtb_u_u151) dtb_u_u152) (String.concat "" ["table array \""; dtb_u_u158; "\" has no current element"]))
  | _ -> failwith "DT: impossible branch"
)
  | C_TomlNode_NodeLeaf (dtb_u_u176, dtb_u_u177) -> (((v_failAt dtb_u_u151) dtb_u_u177) (String.concat "" ["key \""; dtb_u_u158; "\" is not a table"]))
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
)
)
  | B_dData_dList.C_List_Nil -> (((v_failAt dtb_u_u151) dtb_u_u152) "empty key")
  | _ -> failwith "DT: impossible branch"
))))

# 345 "Vuna/Compiler/Frontend/Toml.vuna"
let rec v_flattenLeaf = (fun (dtb_u_u178 : int) (dtb_u_u179 : string B_dData_dList.t_List) (dtb_u_u180 : t_TomlValue) (dtb_u_u181 : int) -> (match dtb_u_u180 with
  | C_TomlValue_TTable (dtb_u_u182) -> ((((v_flattenLeafFields (dtb_u_u178 - 1)) dtb_u_u179) dtb_u_u182) dtb_u_u181)
  | _ -> (let dtb_u_u183 = (v_splitLast dtb_u_u179) in (match dtb_u_u183 with
  | B_dData_dMaybe.C_Maybe_Just (dtb_u_u184) -> (match dtb_u_u184 with
  | { B_dData_dPair.f_Pair_first = dtb_u_u185; B_dData_dPair.f_Pair_second = dtb_u_u186 } -> (B_dData_dList.C_List__x58__x58_ ({ f_TomlEntry_tomlEntrySection = dtb_u_u185; f_TomlEntry_tomlEntryKey = dtb_u_u186; f_TomlEntry_tomlEntryValue = dtb_u_u180; f_TomlEntry_tomlEntryLine = dtb_u_u181 }, B_dData_dList.C_List_Nil))
  | _ -> failwith "DT: impossible branch"
)
  | B_dData_dMaybe.C_Maybe_Nothing -> B_dData_dList.C_List_Nil
  | _ -> failwith "DT: impossible branch"
))
))
# 352 "Vuna/Compiler/Frontend/Toml.vuna"
and v_flattenLeafFields = (fun (dtb_u_u187 : int) (dtb_u_u188 : string B_dData_dList.t_List) (dtb_u_u189 : (string, t_TomlValue) B_dData_dPair.t_Pair B_dData_dList.t_List) (dtb_u_u190 : int) -> (match dtb_u_u189 with
  | B_dData_dList.C_List__x58__x58_ (dtb_u_u191, dtb_u_u192) -> ((B_dData_dList.v_append ((((v_flattenLeaf (dtb_u_u187 - 1)) ((v_appendPath dtb_u_u188) (B_dData_dList.C_List__x58__x58_ ((B_dData_dPair.v_firstOf dtb_u_u191), B_dData_dList.C_List_Nil)))) (B_dData_dPair.v_secondOf dtb_u_u191)) dtb_u_u190)) ((((v_flattenLeafFields (dtb_u_u187 - 1)) dtb_u_u188) dtb_u_u192) dtb_u_u190))
  | B_dData_dList.C_List_Nil -> B_dData_dList.C_List_Nil
  | _ -> failwith "DT: impossible branch"
))

# 325 "Vuna/Compiler/Frontend/Toml.vuna"
let rec v_flattenFields = (fun (dtb_u_u193 : int) (dtb_u_u194 : string B_dData_dList.t_List) (dtb_u_u195 : (string, t_TomlNode) B_dData_dPair.t_Pair B_dData_dList.t_List) -> (match dtb_u_u195 with
  | B_dData_dList.C_List__x58__x58_ (dtb_u_u196, dtb_u_u197) -> ((B_dData_dList.v_append (((v_flattenNode (dtb_u_u193 - 1)) ((v_appendPath dtb_u_u194) (B_dData_dList.C_List__x58__x58_ ((B_dData_dPair.v_firstOf dtb_u_u196), B_dData_dList.C_List_Nil)))) (B_dData_dPair.v_secondOf dtb_u_u196))) (((v_flattenFields (dtb_u_u193 - 1)) dtb_u_u194) dtb_u_u197))
  | B_dData_dList.C_List_Nil -> B_dData_dList.C_List_Nil
  | _ -> failwith "DT: impossible branch"
))
# 332 "Vuna/Compiler/Frontend/Toml.vuna"
and v_flattenNode = (fun (dtb_u_u198 : int) (dtb_u_u199 : string B_dData_dList.t_List) (dtb_u_u200 : t_TomlNode) -> (match dtb_u_u200 with
  | C_TomlNode_NodeTableArray (dtb_u_u201, dtb_u_u202) -> ((((v_flattenElems (dtb_u_u198 - 1)) 0) dtb_u_u199) dtb_u_u201)
  | C_TomlNode_NodeTable (dtb_u_u203, dtb_u_u204, dtb_u_u205) -> (((v_flattenFields (dtb_u_u198 - 1)) dtb_u_u199) dtb_u_u203)
  | C_TomlNode_NodeLeaf (dtb_u_u206, dtb_u_u207) -> ((((v_flattenLeaf (dtb_u_u198 - 1)) dtb_u_u199) dtb_u_u206) dtb_u_u207)
  | _ -> failwith "DT: impossible branch"
))
# 337 "Vuna/Compiler/Frontend/Toml.vuna"
and v_flattenElems = (fun (dtb_u_u208 : int) (dtb_u_u209 : int) (dtb_u_u210 : string B_dData_dList.t_List) (dtb_u_u211 : (string, t_TomlNode) B_dData_dPair.t_Pair B_dData_dList.t_List B_dData_dList.t_List) -> (match dtb_u_u211 with
  | B_dData_dList.C_List__x58__x58_ (dtb_u_u212, dtb_u_u213) -> ((B_dData_dList.v_append (((v_flattenFields (dtb_u_u208 - 1)) ((v_appendPath dtb_u_u210) (B_dData_dList.C_List__x58__x58_ ((string_of_int dtb_u_u209), B_dData_dList.C_List_Nil)))) dtb_u_u212)) ((((v_flattenElems (dtb_u_u208 - 1)) (dtb_u_u209 + 1)) dtb_u_u210) dtb_u_u213))
  | B_dData_dList.C_List_Nil -> B_dData_dList.C_List_Nil
  | _ -> failwith "DT: impossible branch"
))

# 360 "Vuna/Compiler/Frontend/Toml.vuna"
let rec v_nodeValue = (fun (dtb_u_u214 : int) (dtb_u_u215 : t_TomlNode) -> (match dtb_u_u215 with
  | C_TomlNode_NodeTableArray (dtb_u_u216, dtb_u_u217) -> (C_TomlValue_TTableArray (((v_tableFields (dtb_u_u214 - 1)) dtb_u_u216)))
  | C_TomlNode_NodeTable (dtb_u_u218, dtb_u_u219, dtb_u_u220) -> (C_TomlValue_TTable (((v_fieldValues (dtb_u_u214 - 1)) dtb_u_u218)))
  | C_TomlNode_NodeLeaf (dtb_u_u221, dtb_u_u222) -> dtb_u_u221
  | _ -> failwith "DT: impossible branch"
))
# 365 "Vuna/Compiler/Frontend/Toml.vuna"
and v_fieldValues = (fun (dtb_u_u223 : int) (dtb_u_u224 : (string, t_TomlNode) B_dData_dPair.t_Pair B_dData_dList.t_List) -> (match dtb_u_u224 with
  | B_dData_dList.C_List__x58__x58_ (dtb_u_u225, dtb_u_u226) -> (B_dData_dList.C_List__x58__x58_ ({ B_dData_dPair.f_Pair_first = (B_dData_dPair.v_firstOf dtb_u_u225); B_dData_dPair.f_Pair_second = ((v_nodeValue (dtb_u_u223 - 1)) (B_dData_dPair.v_secondOf dtb_u_u225)) }, ((v_fieldValues (dtb_u_u223 - 1)) dtb_u_u226)))
  | B_dData_dList.C_List_Nil -> B_dData_dList.C_List_Nil
  | _ -> failwith "DT: impossible branch"
))
# 370 "Vuna/Compiler/Frontend/Toml.vuna"
and v_tableFields = (fun (dtb_u_u227 : int) (dtb_u_u228 : (string, t_TomlNode) B_dData_dPair.t_Pair B_dData_dList.t_List B_dData_dList.t_List) -> (match dtb_u_u228 with
  | B_dData_dList.C_List__x58__x58_ (dtb_u_u229, dtb_u_u230) -> (B_dData_dList.C_List__x58__x58_ (((v_fieldValues (dtb_u_u227 - 1)) dtb_u_u229), ((v_tableFields (dtb_u_u227 - 1)) dtb_u_u230)))
  | B_dData_dList.C_List_Nil -> B_dData_dList.C_List_Nil
  | _ -> failwith "DT: impossible branch"
))

# 374 "Vuna/Compiler/Frontend/Toml.vuna"
let v_rootValue = (fun (dtb_u_u231 : int) (dtb_u_u232 : (string, t_TomlNode) B_dData_dPair.t_Pair B_dData_dList.t_List) -> ((v_fieldValues dtb_u_u231) dtb_u_u232))

# 379 "Vuna/Compiler/Frontend/Toml.vuna"
let rec v_skipBlank = (fun (dtb_u_u233 : t_TomlCursor) -> (match dtb_u_u233 with
  | { f_TomlCursor_cursorChars = dtb_u_u234; f_TomlCursor_cursorLine = dtb_u_u235; f_TomlCursor_cursorCol = dtb_u_u236 } -> (match dtb_u_u234 with
  | B_dData_dList.C_List__x58__x58_ (dtb_u_u237, dtb_u_u238) -> (if (v_isBlankChar dtb_u_u237) then (v_skipBlank { f_TomlCursor_cursorChars = dtb_u_u238; f_TomlCursor_cursorLine = dtb_u_u235; f_TomlCursor_cursorCol = (dtb_u_u236 + 1) }) else { f_TomlCursor_cursorChars = (B_dData_dList.C_List__x58__x58_ (dtb_u_u237, dtb_u_u238)); f_TomlCursor_cursorLine = dtb_u_u235; f_TomlCursor_cursorCol = dtb_u_u236 })
  | B_dData_dList.C_List_Nil -> { f_TomlCursor_cursorChars = B_dData_dList.C_List_Nil; f_TomlCursor_cursorLine = dtb_u_u235; f_TomlCursor_cursorCol = dtb_u_u236 }
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
))

# 388 "Vuna/Compiler/Frontend/Toml.vuna"
let rec v_skipComment = (fun (dtb_u_u239 : t_TomlCursor) -> (match dtb_u_u239 with
  | { f_TomlCursor_cursorChars = dtb_u_u240; f_TomlCursor_cursorLine = dtb_u_u241; f_TomlCursor_cursorCol = dtb_u_u242 } -> (match dtb_u_u240 with
  | B_dData_dList.C_List__x58__x58_ (dtb_u_u243, dtb_u_u244) -> (if (dtb_u_u243 = 10) then { f_TomlCursor_cursorChars = (B_dData_dList.C_List__x58__x58_ (dtb_u_u243, dtb_u_u244)); f_TomlCursor_cursorLine = dtb_u_u241; f_TomlCursor_cursorCol = dtb_u_u242 } else (v_skipComment { f_TomlCursor_cursorChars = dtb_u_u244; f_TomlCursor_cursorLine = dtb_u_u241; f_TomlCursor_cursorCol = (dtb_u_u242 + 1) }))
  | B_dData_dList.C_List_Nil -> { f_TomlCursor_cursorChars = B_dData_dList.C_List_Nil; f_TomlCursor_cursorLine = dtb_u_u241; f_TomlCursor_cursorCol = dtb_u_u242 }
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
))

# 397 "Vuna/Compiler/Frontend/Toml.vuna"
let rec v_skipGapGo = (fun (dtb_u_u245 : bool) (dtb_u_u246 : t_TomlCursor) -> (match dtb_u_u246 with
  | { f_TomlCursor_cursorChars = dtb_u_u247; f_TomlCursor_cursorLine = dtb_u_u248; f_TomlCursor_cursorCol = dtb_u_u249 } -> (match dtb_u_u247 with
  | B_dData_dList.C_List__x58__x58_ (dtb_u_u250, dtb_u_u251) -> (if dtb_u_u245 then (if (dtb_u_u250 = 10) then ((v_skipGapGo false) { f_TomlCursor_cursorChars = dtb_u_u251; f_TomlCursor_cursorLine = (dtb_u_u248 + 1); f_TomlCursor_cursorCol = 1 }) else ((v_skipGapGo true) { f_TomlCursor_cursorChars = dtb_u_u251; f_TomlCursor_cursorLine = dtb_u_u248; f_TomlCursor_cursorCol = (dtb_u_u249 + 1) })) else (if (v_isBlankChar dtb_u_u250) then ((v_skipGapGo false) { f_TomlCursor_cursorChars = dtb_u_u251; f_TomlCursor_cursorLine = dtb_u_u248; f_TomlCursor_cursorCol = (dtb_u_u249 + 1) }) else (if (dtb_u_u250 = 10) then ((v_skipGapGo false) { f_TomlCursor_cursorChars = dtb_u_u251; f_TomlCursor_cursorLine = (dtb_u_u248 + 1); f_TomlCursor_cursorCol = 1 }) else (if (dtb_u_u250 = 35) then ((v_skipGapGo true) { f_TomlCursor_cursorChars = dtb_u_u251; f_TomlCursor_cursorLine = dtb_u_u248; f_TomlCursor_cursorCol = (dtb_u_u249 + 1) }) else { f_TomlCursor_cursorChars = (B_dData_dList.C_List__x58__x58_ (dtb_u_u250, dtb_u_u251)); f_TomlCursor_cursorLine = dtb_u_u248; f_TomlCursor_cursorCol = dtb_u_u249 }))))
  | B_dData_dList.C_List_Nil -> { f_TomlCursor_cursorChars = B_dData_dList.C_List_Nil; f_TomlCursor_cursorLine = dtb_u_u248; f_TomlCursor_cursorCol = dtb_u_u249 }
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
))

# 394 "Vuna/Compiler/Frontend/Toml.vuna"
let v_skipGap = (fun (dtb_u_u252 : t_TomlCursor) -> ((v_skipGapGo false) dtb_u_u252))

# 412 "Vuna/Compiler/Frontend/Toml.vuna"
let v_utf8OfCode = (fun (dtb_u_u253 : int) -> (if (dtb_u_u253 < 128) then (B_dData_dList.C_List__x58__x58_ (dtb_u_u253, B_dData_dList.C_List_Nil)) else (if (dtb_u_u253 < 2048) then (B_dData_dList.C_List__x58__x58_ ((192 + ((B_dData_dBits.v_shr dtb_u_u253) 6)), (B_dData_dList.C_List__x58__x58_ ((128 + ((B_dData_dBits.v_band dtb_u_u253) 63)), B_dData_dList.C_List_Nil)))) else (if (dtb_u_u253 < 65536) then (B_dData_dList.C_List__x58__x58_ ((224 + ((B_dData_dBits.v_shr dtb_u_u253) 12)), (B_dData_dList.C_List__x58__x58_ ((128 + ((B_dData_dBits.v_band ((B_dData_dBits.v_shr dtb_u_u253) 6)) 63)), (B_dData_dList.C_List__x58__x58_ ((128 + ((B_dData_dBits.v_band dtb_u_u253) 63)), B_dData_dList.C_List_Nil)))))) else (B_dData_dList.C_List__x58__x58_ ((240 + ((B_dData_dBits.v_shr dtb_u_u253) 18)), (B_dData_dList.C_List__x58__x58_ ((128 + ((B_dData_dBits.v_band ((B_dData_dBits.v_shr dtb_u_u253) 12)) 63)), (B_dData_dList.C_List__x58__x58_ ((128 + ((B_dData_dBits.v_band ((B_dData_dBits.v_shr dtb_u_u253) 6)) 63)), (B_dData_dList.C_List__x58__x58_ ((128 + ((B_dData_dBits.v_band dtb_u_u253) 63)), B_dData_dList.C_List_Nil))))))))))))

# 423 "Vuna/Compiler/Frontend/Toml.vuna"
let v_isSurrogate = (fun (dtb_u_u254 : int) -> (if (dtb_u_u254 >= 55296) then (dtb_u_u254 <= 57343) else false))

# 478 "Vuna/Compiler/Frontend/Toml.vuna"
let rec v_parseHexCode = (fun (dtb_u_u255 : int) (dtb_u_u256 : int) (dtb_u_u257 : string) (dtb_u_u258 : t_TomlCursor) (dtb_u_u259 : int) (dtb_u_u260 : int) -> (if (dtb_u_u259 >= dtb_u_u256) then (Base_dDiag.C_Check_OkC ({ B_dData_dPair.f_Pair_first = dtb_u_u260; B_dData_dPair.f_Pair_second = dtb_u_u258 })) else (if (dtb_u_u255 <= 0) then (Base_dDiag.v_icFuel "toml") else (match (dtb_u_u258).f_TomlCursor_cursorChars with
  | B_dData_dList.C_List_Nil -> (((v_failAt dtb_u_u257) (dtb_u_u258).f_TomlCursor_cursorLine) "unterminated unicode escape")
  | B_dData_dList.C_List__x58__x58_ (dtb_u_u261, dtb_u_u262) -> (if (v_isHexDigit dtb_u_u261) then ((((((v_parseHexCode (dtb_u_u255 - 1)) dtb_u_u256) dtb_u_u257) (v_advanceCursor dtb_u_u258)) (dtb_u_u259 + 1)) ((dtb_u_u260 * 16) + (v_hexValue dtb_u_u261))) else (((v_failAt dtb_u_u257) (dtb_u_u258).f_TomlCursor_cursorLine) "invalid hex digit in unicode escape"))
  | _ -> failwith "DT: impossible branch"
))))

# 434 "Vuna/Compiler/Frontend/Toml.vuna"
let rec v_parseBasicChars = (fun (dtb_u_u263 : int) (dtb_u_u264 : string) (dtb_u_u265 : t_TomlCursor) (dtb_u_u266 : t_TomlCursor) (dtb_u_u267 : int B_dData_dList.t_List) -> (if (dtb_u_u263 <= 0) then (Base_dDiag.v_icFuel "toml") else (match (dtb_u_u266).f_TomlCursor_cursorChars with
  | B_dData_dList.C_List_Nil -> (((v_failAt dtb_u_u264) (dtb_u_u265).f_TomlCursor_cursorLine) "unterminated basic string")
  | B_dData_dList.C_List__x58__x58_ (dtb_u_u268, dtb_u_u269) -> (if (dtb_u_u268 = 34) then (Base_dDiag.C_Check_OkC ({ B_dData_dPair.f_Pair_first = (B_dData_dList.dtp_pack (B_dData_dList.v_reverse dtb_u_u267)); B_dData_dPair.f_Pair_second = (v_advanceCursor dtb_u_u266) })) else (if (dtb_u_u268 = 10) then (((v_failAt dtb_u_u264) (dtb_u_u265).f_TomlCursor_cursorLine) "unterminated basic string (newline in string)") else (if (dtb_u_u268 = 92) then (((((v_parseBasicEscape (dtb_u_u263 - 1)) dtb_u_u264) dtb_u_u265) (v_advanceCursor dtb_u_u266)) dtb_u_u267) else (((((v_parseBasicChars (dtb_u_u263 - 1)) dtb_u_u264) dtb_u_u265) (v_advanceCursor dtb_u_u266)) (B_dData_dList.C_List__x58__x58_ (dtb_u_u268, dtb_u_u267))))))
  | _ -> failwith "DT: impossible branch"
)))
# 448 "Vuna/Compiler/Frontend/Toml.vuna"
and v_parseBasicEscape = (fun (dtb_u_u270 : int) (dtb_u_u271 : string) (dtb_u_u272 : t_TomlCursor) (dtb_u_u273 : t_TomlCursor) (dtb_u_u274 : int B_dData_dList.t_List) -> (if (dtb_u_u270 <= 0) then (Base_dDiag.v_icFuel "toml") else (match (dtb_u_u273).f_TomlCursor_cursorChars with
  | B_dData_dList.C_List_Nil -> (((v_failAt dtb_u_u271) (dtb_u_u272).f_TomlCursor_cursorLine) "unterminated escape sequence")
  | B_dData_dList.C_List__x58__x58_ (dtb_u_u275, dtb_u_u276) -> (if (dtb_u_u275 = 110) then (((((v_parseBasicChars (dtb_u_u270 - 1)) dtb_u_u271) dtb_u_u272) (v_advanceCursor dtb_u_u273)) (B_dData_dList.C_List__x58__x58_ (10, dtb_u_u274))) else (if (dtb_u_u275 = 116) then (((((v_parseBasicChars (dtb_u_u270 - 1)) dtb_u_u271) dtb_u_u272) (v_advanceCursor dtb_u_u273)) (B_dData_dList.C_List__x58__x58_ (9, dtb_u_u274))) else (if (dtb_u_u275 = 114) then (((((v_parseBasicChars (dtb_u_u270 - 1)) dtb_u_u271) dtb_u_u272) (v_advanceCursor dtb_u_u273)) (B_dData_dList.C_List__x58__x58_ (13, dtb_u_u274))) else (if (dtb_u_u275 = 98) then (((((v_parseBasicChars (dtb_u_u270 - 1)) dtb_u_u271) dtb_u_u272) (v_advanceCursor dtb_u_u273)) (B_dData_dList.C_List__x58__x58_ (8, dtb_u_u274))) else (if (dtb_u_u275 = 102) then (((((v_parseBasicChars (dtb_u_u270 - 1)) dtb_u_u271) dtb_u_u272) (v_advanceCursor dtb_u_u273)) (B_dData_dList.C_List__x58__x58_ (12, dtb_u_u274))) else (if (dtb_u_u275 = 34) then (((((v_parseBasicChars (dtb_u_u270 - 1)) dtb_u_u271) dtb_u_u272) (v_advanceCursor dtb_u_u273)) (B_dData_dList.C_List__x58__x58_ (34, dtb_u_u274))) else (if (dtb_u_u275 = 92) then (((((v_parseBasicChars (dtb_u_u270 - 1)) dtb_u_u271) dtb_u_u272) (v_advanceCursor dtb_u_u273)) (B_dData_dList.C_List__x58__x58_ (92, dtb_u_u274))) else (if (dtb_u_u275 = 117) then ((((((v_parseUnicodeEscape (dtb_u_u270 - 1)) 4) dtb_u_u271) dtb_u_u272) (v_advanceCursor dtb_u_u273)) dtb_u_u274) else (if (dtb_u_u275 = 85) then ((((((v_parseUnicodeEscape (dtb_u_u270 - 1)) 8) dtb_u_u271) dtb_u_u272) (v_advanceCursor dtb_u_u273)) dtb_u_u274) else (((v_failAt dtb_u_u271) (dtb_u_u273).f_TomlCursor_cursorLine) ("unknown escape sequence \\" ^ (B_dData_dList.dtp_pack (B_dData_dList.C_List__x58__x58_ (dtb_u_u275, B_dData_dList.C_List_Nil))))))))))))))
  | _ -> failwith "DT: impossible branch"
)))
# 468 "Vuna/Compiler/Frontend/Toml.vuna"
and v_parseUnicodeEscape = (fun (dtb_u_u277 : int) (dtb_u_u278 : int) (dtb_u_u279 : string) (dtb_u_u280 : t_TomlCursor) (dtb_u_u281 : t_TomlCursor) (dtb_u_u282 : int B_dData_dList.t_List) -> (if (dtb_u_u277 <= 0) then (Base_dDiag.v_icFuel "toml") else (let dtb_u_u283 = ((((((v_parseHexCode (v_cursorFuel dtb_u_u281)) dtb_u_u278) dtb_u_u279) dtb_u_u281) 0) 0) in (match dtb_u_u283 with
  | Base_dDiag.C_Check_OkC (dtb_u_u284) -> (match dtb_u_u284 with
  | { B_dData_dPair.f_Pair_first = dtb_u_u285; B_dData_dPair.f_Pair_second = dtb_u_u286 } -> (if (dtb_u_u285 > 1114111) then (((v_failAt dtb_u_u279) (dtb_u_u280).f_TomlCursor_cursorLine) "unicode escape out of range") else (if (v_isSurrogate dtb_u_u285) then (((v_failAt dtb_u_u279) (dtb_u_u280).f_TomlCursor_cursorLine) "unicode escape is a surrogate code point") else (((((v_parseBasicChars (dtb_u_u277 - 1)) dtb_u_u279) dtb_u_u280) dtb_u_u286) ((B_dData_dList.v_append (B_dData_dList.v_reverse (v_utf8OfCode dtb_u_u285))) dtb_u_u282))))
  | _ -> failwith "DT: impossible branch"
)
  | Base_dDiag.C_Check_ErrC (dtb_u_u287) -> (Base_dDiag.C_Check_ErrC (dtb_u_u287))
  | _ -> failwith "DT: impossible branch"
))))

# 428 "Vuna/Compiler/Frontend/Toml.vuna"
let v_parseBasicString = (fun (dtb_u_u288 : string) (dtb_u_u289 : t_TomlCursor) -> (match (dtb_u_u289).f_TomlCursor_cursorChars with
  | B_dData_dList.C_List_Nil -> (((v_failAt dtb_u_u288) (dtb_u_u289).f_TomlCursor_cursorLine) "unterminated basic string")
  | B_dData_dList.C_List__x58__x58_ (dtb_u_u290, dtb_u_u291) -> (((((v_parseBasicChars (v_cursorFuel (v_advanceCursor dtb_u_u289))) dtb_u_u288) dtb_u_u289) (v_advanceCursor dtb_u_u289)) B_dData_dList.C_List_Nil)
  | _ -> failwith "DT: impossible branch"
))

# 496 "Vuna/Compiler/Frontend/Toml.vuna"
let rec v_parseLiteralChars = (fun (dtb_u_u292 : int) (dtb_u_u293 : string) (dtb_u_u294 : t_TomlCursor) (dtb_u_u295 : t_TomlCursor) (dtb_u_u296 : int B_dData_dList.t_List) -> (if (dtb_u_u292 <= 0) then (Base_dDiag.v_icFuel "toml") else (match (dtb_u_u295).f_TomlCursor_cursorChars with
  | B_dData_dList.C_List_Nil -> (((v_failAt dtb_u_u293) (dtb_u_u294).f_TomlCursor_cursorLine) "unterminated literal string")
  | B_dData_dList.C_List__x58__x58_ (dtb_u_u297, dtb_u_u298) -> (if (dtb_u_u297 = 39) then (Base_dDiag.C_Check_OkC ({ B_dData_dPair.f_Pair_first = (B_dData_dList.dtp_pack (B_dData_dList.v_reverse dtb_u_u296)); B_dData_dPair.f_Pair_second = (v_advanceCursor dtb_u_u295) })) else (if (dtb_u_u297 = 10) then (((v_failAt dtb_u_u293) (dtb_u_u294).f_TomlCursor_cursorLine) "unterminated literal string (newline in string)") else (((((v_parseLiteralChars (dtb_u_u292 - 1)) dtb_u_u293) dtb_u_u294) (v_advanceCursor dtb_u_u295)) (B_dData_dList.C_List__x58__x58_ (dtb_u_u297, dtb_u_u296)))))
  | _ -> failwith "DT: impossible branch"
)))

# 490 "Vuna/Compiler/Frontend/Toml.vuna"
let v_parseLiteralString = (fun (dtb_u_u299 : string) (dtb_u_u300 : t_TomlCursor) -> (match (dtb_u_u300).f_TomlCursor_cursorChars with
  | B_dData_dList.C_List_Nil -> (((v_failAt dtb_u_u299) (dtb_u_u300).f_TomlCursor_cursorLine) "unterminated literal string")
  | B_dData_dList.C_List__x58__x58_ (dtb_u_u301, dtb_u_u302) -> (((((v_parseLiteralChars (v_cursorFuel (v_advanceCursor dtb_u_u300))) dtb_u_u299) dtb_u_u300) (v_advanceCursor dtb_u_u300)) B_dData_dList.C_List_Nil)
  | _ -> failwith "DT: impossible branch"
))

# 517 "Vuna/Compiler/Frontend/Toml.vuna"
let v_dropFirstNewline = (fun (dtb_u_u303 : t_TomlCursor) -> (match dtb_u_u303 with
  | { f_TomlCursor_cursorChars = dtb_u_u304; f_TomlCursor_cursorLine = dtb_u_u305; f_TomlCursor_cursorCol = dtb_u_u306 } -> (match dtb_u_u304 with
  | B_dData_dList.C_List__x58__x58_ (dtb_u_u307, dtb_u_u308) -> (if (dtb_u_u307 = 10) then { f_TomlCursor_cursorChars = dtb_u_u308; f_TomlCursor_cursorLine = (dtb_u_u305 + 1); f_TomlCursor_cursorCol = 1 } else { f_TomlCursor_cursorChars = (B_dData_dList.C_List__x58__x58_ (dtb_u_u307, dtb_u_u308)); f_TomlCursor_cursorLine = dtb_u_u305; f_TomlCursor_cursorCol = dtb_u_u306 })
  | B_dData_dList.C_List_Nil -> { f_TomlCursor_cursorChars = B_dData_dList.C_List_Nil; f_TomlCursor_cursorLine = dtb_u_u305; f_TomlCursor_cursorCol = dtb_u_u306 }
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
))

# 551 "Vuna/Compiler/Frontend/Toml.vuna"
let rec v_skipContinuation = (fun (dtb_u_u309 : t_TomlCursor) -> (match dtb_u_u309 with
  | { f_TomlCursor_cursorChars = dtb_u_u310; f_TomlCursor_cursorLine = dtb_u_u311; f_TomlCursor_cursorCol = dtb_u_u312 } -> (match dtb_u_u310 with
  | B_dData_dList.C_List__x58__x58_ (dtb_u_u313, dtb_u_u314) -> (if (v_isBlankChar dtb_u_u313) then (v_skipContinuation { f_TomlCursor_cursorChars = dtb_u_u314; f_TomlCursor_cursorLine = dtb_u_u311; f_TomlCursor_cursorCol = (dtb_u_u312 + 1) }) else (if (dtb_u_u313 = 10) then (v_skipContinuation { f_TomlCursor_cursorChars = dtb_u_u314; f_TomlCursor_cursorLine = (dtb_u_u311 + 1); f_TomlCursor_cursorCol = 1 }) else { f_TomlCursor_cursorChars = (B_dData_dList.C_List__x58__x58_ (dtb_u_u313, dtb_u_u314)); f_TomlCursor_cursorLine = dtb_u_u311; f_TomlCursor_cursorCol = dtb_u_u312 }))
  | B_dData_dList.C_List_Nil -> { f_TomlCursor_cursorChars = B_dData_dList.C_List_Nil; f_TomlCursor_cursorLine = dtb_u_u311; f_TomlCursor_cursorCol = dtb_u_u312 }
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
))

# 522 "Vuna/Compiler/Frontend/Toml.vuna"
let rec v_parseMultilineBasicChars = (fun (dtb_u_u315 : int) (dtb_u_u316 : string) (dtb_u_u317 : t_TomlCursor) (dtb_u_u318 : t_TomlCursor) (dtb_u_u319 : int B_dData_dList.t_List) -> (if (dtb_u_u315 <= 0) then (Base_dDiag.v_icFuel "toml") else (match (dtb_u_u318).f_TomlCursor_cursorChars with
  | B_dData_dList.C_List_Nil -> (((v_failAt dtb_u_u316) (dtb_u_u317).f_TomlCursor_cursorLine) "unterminated multiline string")
  | B_dData_dList.C_List__x58__x58_ (dtb_u_u320, dtb_u_u321) -> (if (dtb_u_u320 = 34) then (if ((v_startsWithTripleOf 34) (dtb_u_u318).f_TomlCursor_cursorChars) then (Base_dDiag.C_Check_OkC ({ B_dData_dPair.f_Pair_first = (B_dData_dList.dtp_pack (B_dData_dList.v_reverse dtb_u_u319)); B_dData_dPair.f_Pair_second = ((v_advanceChars 3) dtb_u_u318) })) else (((((v_parseMultilineBasicChars (dtb_u_u315 - 1)) dtb_u_u316) dtb_u_u317) (v_advanceCursor dtb_u_u318)) (B_dData_dList.C_List__x58__x58_ (34, dtb_u_u319)))) else (if (dtb_u_u320 = 10) then (((((v_parseMultilineBasicChars (dtb_u_u315 - 1)) dtb_u_u316) dtb_u_u317) { f_TomlCursor_cursorChars = dtb_u_u321; f_TomlCursor_cursorLine = ((dtb_u_u318).f_TomlCursor_cursorLine + 1); f_TomlCursor_cursorCol = 1 }) (B_dData_dList.C_List__x58__x58_ (10, dtb_u_u319))) else (if (dtb_u_u320 = 92) then (((((v_parseMultilineEscape (dtb_u_u315 - 1)) dtb_u_u316) dtb_u_u317) (v_advanceCursor dtb_u_u318)) dtb_u_u319) else (((((v_parseMultilineBasicChars (dtb_u_u315 - 1)) dtb_u_u316) dtb_u_u317) (v_advanceCursor dtb_u_u318)) (B_dData_dList.C_List__x58__x58_ (dtb_u_u320, dtb_u_u319))))))
  | _ -> failwith "DT: impossible branch"
)))
# 537 "Vuna/Compiler/Frontend/Toml.vuna"
and v_parseMultilineEscape = (fun (dtb_u_u322 : int) (dtb_u_u323 : string) (dtb_u_u324 : t_TomlCursor) (dtb_u_u325 : t_TomlCursor) (dtb_u_u326 : int B_dData_dList.t_List) -> (if (dtb_u_u322 <= 0) then (Base_dDiag.v_icFuel "toml") else (match (dtb_u_u325).f_TomlCursor_cursorChars with
  | B_dData_dList.C_List_Nil -> (((v_failAt dtb_u_u323) (dtb_u_u324).f_TomlCursor_cursorLine) "unterminated escape sequence")
  | B_dData_dList.C_List__x58__x58_ (dtb_u_u327, dtb_u_u328) -> (if (dtb_u_u327 = 10) then (((((v_parseMultilineBasicChars (dtb_u_u322 - 1)) dtb_u_u323) dtb_u_u324) (v_skipContinuation { f_TomlCursor_cursorChars = dtb_u_u328; f_TomlCursor_cursorLine = ((dtb_u_u325).f_TomlCursor_cursorLine + 1); f_TomlCursor_cursorCol = 1 })) dtb_u_u326) else (if (dtb_u_u327 = 32) then (((((v_parseMultilineBasicChars (dtb_u_u322 - 1)) dtb_u_u323) dtb_u_u324) (v_skipContinuation dtb_u_u325)) dtb_u_u326) else (if (dtb_u_u327 = 9) then (((((v_parseMultilineBasicChars (dtb_u_u322 - 1)) dtb_u_u323) dtb_u_u324) (v_skipContinuation dtb_u_u325)) dtb_u_u326) else (((((v_parseBasicEscape (dtb_u_u322 - 1)) dtb_u_u323) dtb_u_u324) dtb_u_u325) dtb_u_u326))))
  | _ -> failwith "DT: impossible branch"
)))

# 511 "Vuna/Compiler/Frontend/Toml.vuna"
let v_parseMultilineBasic = (fun (dtb_u_u329 : string) (dtb_u_u330 : t_TomlCursor) -> (let dtb_u_u331 = (v_dropFirstNewline dtb_u_u330) in (((((v_parseMultilineBasicChars (v_cursorFuel dtb_u_u331)) dtb_u_u329) dtb_u_u330) dtb_u_u331) B_dData_dList.C_List_Nil)))

# 568 "Vuna/Compiler/Frontend/Toml.vuna"
let rec v_parseMultilineLiteralChars = (fun (dtb_u_u332 : int) (dtb_u_u333 : string) (dtb_u_u334 : t_TomlCursor) (dtb_u_u335 : t_TomlCursor) (dtb_u_u336 : int B_dData_dList.t_List) -> (if (dtb_u_u332 <= 0) then (Base_dDiag.v_icFuel "toml") else (match (dtb_u_u335).f_TomlCursor_cursorChars with
  | B_dData_dList.C_List_Nil -> (((v_failAt dtb_u_u333) (dtb_u_u334).f_TomlCursor_cursorLine) "unterminated multiline literal string")
  | B_dData_dList.C_List__x58__x58_ (dtb_u_u337, dtb_u_u338) -> (if (dtb_u_u337 = 39) then (if ((v_startsWithTripleOf 39) (dtb_u_u335).f_TomlCursor_cursorChars) then (Base_dDiag.C_Check_OkC ({ B_dData_dPair.f_Pair_first = (B_dData_dList.dtp_pack (B_dData_dList.v_reverse dtb_u_u336)); B_dData_dPair.f_Pair_second = ((v_advanceChars 3) dtb_u_u335) })) else (((((v_parseMultilineLiteralChars (dtb_u_u332 - 1)) dtb_u_u333) dtb_u_u334) (v_advanceCursor dtb_u_u335)) (B_dData_dList.C_List__x58__x58_ (39, dtb_u_u336)))) else (if (dtb_u_u337 = 10) then (((((v_parseMultilineLiteralChars (dtb_u_u332 - 1)) dtb_u_u333) dtb_u_u334) { f_TomlCursor_cursorChars = dtb_u_u338; f_TomlCursor_cursorLine = ((dtb_u_u335).f_TomlCursor_cursorLine + 1); f_TomlCursor_cursorCol = 1 }) (B_dData_dList.C_List__x58__x58_ (10, dtb_u_u336))) else (((((v_parseMultilineLiteralChars (dtb_u_u332 - 1)) dtb_u_u333) dtb_u_u334) (v_advanceCursor dtb_u_u335)) (B_dData_dList.C_List__x58__x58_ (dtb_u_u337, dtb_u_u336)))))
  | _ -> failwith "DT: impossible branch"
)))

# 562 "Vuna/Compiler/Frontend/Toml.vuna"
let v_parseMultilineLiteral = (fun (dtb_u_u339 : string) (dtb_u_u340 : t_TomlCursor) -> (let dtb_u_u341 = (v_dropFirstNewline dtb_u_u340) in (((((v_parseMultilineLiteralChars (v_cursorFuel dtb_u_u341)) dtb_u_u339) dtb_u_u340) dtb_u_u341) B_dData_dList.C_List_Nil)))

# 582 "Vuna/Compiler/Frontend/Toml.vuna"
let rec v_collectBareKey = (fun (dtb_u_u342 : t_TomlCursor) (dtb_u_u343 : int B_dData_dList.t_List) -> (match dtb_u_u342 with
  | { f_TomlCursor_cursorChars = dtb_u_u344; f_TomlCursor_cursorLine = dtb_u_u345; f_TomlCursor_cursorCol = dtb_u_u346 } -> (match dtb_u_u344 with
  | B_dData_dList.C_List__x58__x58_ (dtb_u_u347, dtb_u_u348) -> (if (v_isBareKeyChar dtb_u_u347) then ((v_collectBareKey { f_TomlCursor_cursorChars = dtb_u_u348; f_TomlCursor_cursorLine = dtb_u_u345; f_TomlCursor_cursorCol = (dtb_u_u346 + 1) }) (B_dData_dList.C_List__x58__x58_ (dtb_u_u347, dtb_u_u343))) else { B_dData_dPair.f_Pair_first = (B_dData_dList.dtp_pack (B_dData_dList.v_reverse dtb_u_u343)); B_dData_dPair.f_Pair_second = { f_TomlCursor_cursorChars = (B_dData_dList.C_List__x58__x58_ (dtb_u_u347, dtb_u_u348)); f_TomlCursor_cursorLine = dtb_u_u345; f_TomlCursor_cursorCol = dtb_u_u346 } })
  | B_dData_dList.C_List_Nil -> { B_dData_dPair.f_Pair_first = (B_dData_dList.dtp_pack (B_dData_dList.v_reverse dtb_u_u343)); B_dData_dPair.f_Pair_second = { f_TomlCursor_cursorChars = B_dData_dList.C_List_Nil; f_TomlCursor_cursorLine = dtb_u_u345; f_TomlCursor_cursorCol = dtb_u_u346 } }
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
))

# 590 "Vuna/Compiler/Frontend/Toml.vuna"
let v_parseBareKey = (fun (dtb_u_u349 : string) (dtb_u_u350 : t_TomlCursor) -> (match (dtb_u_u350).f_TomlCursor_cursorChars with
  | B_dData_dList.C_List_Nil -> (((v_failAt dtb_u_u349) (dtb_u_u350).f_TomlCursor_cursorLine) "expected a key")
  | B_dData_dList.C_List__x58__x58_ (dtb_u_u351, dtb_u_u352) -> (if (v_isBareKeyChar dtb_u_u351) then (Base_dDiag.C_Check_OkC (((v_collectBareKey dtb_u_u350) B_dData_dList.C_List_Nil))) else (((v_failAt dtb_u_u349) (dtb_u_u350).f_TomlCursor_cursorLine) "expected a key"))
  | _ -> failwith "DT: impossible branch"
))

# 601 "Vuna/Compiler/Frontend/Toml.vuna"
let v_parseKeySegment = (fun (dtb_u_u353 : string) (dtb_u_u354 : t_TomlCursor) -> (match (dtb_u_u354).f_TomlCursor_cursorChars with
  | B_dData_dList.C_List_Nil -> (((v_failAt dtb_u_u353) (dtb_u_u354).f_TomlCursor_cursorLine) "expected a key")
  | B_dData_dList.C_List__x58__x58_ (dtb_u_u355, dtb_u_u356) -> (if (dtb_u_u355 = 34) then (let dtb_u_u357 = ((v_parseBasicString dtb_u_u353) dtb_u_u354) in (match dtb_u_u357 with
  | Base_dDiag.C_Check_OkC (dtb_u_u358) -> (match dtb_u_u358 with
  | { B_dData_dPair.f_Pair_first = dtb_u_u359; B_dData_dPair.f_Pair_second = dtb_u_u360 } -> (if (dtb_u_u359 = "") then (((v_failAt dtb_u_u353) (dtb_u_u354).f_TomlCursor_cursorLine) "expected a key") else (Base_dDiag.C_Check_OkC ({ B_dData_dPair.f_Pair_first = dtb_u_u359; B_dData_dPair.f_Pair_second = dtb_u_u360 })))
  | _ -> failwith "DT: impossible branch"
)
  | Base_dDiag.C_Check_ErrC (dtb_u_u361) -> (Base_dDiag.C_Check_ErrC (dtb_u_u361))
  | _ -> failwith "DT: impossible branch"
)) else (if (dtb_u_u355 = 39) then (let dtb_u_u362 = ((v_parseLiteralString dtb_u_u353) dtb_u_u354) in (match dtb_u_u362 with
  | Base_dDiag.C_Check_OkC (dtb_u_u363) -> (match dtb_u_u363 with
  | { B_dData_dPair.f_Pair_first = dtb_u_u364; B_dData_dPair.f_Pair_second = dtb_u_u365 } -> (if (dtb_u_u364 = "") then (((v_failAt dtb_u_u353) (dtb_u_u354).f_TomlCursor_cursorLine) "expected a key") else (Base_dDiag.C_Check_OkC ({ B_dData_dPair.f_Pair_first = dtb_u_u364; B_dData_dPair.f_Pair_second = dtb_u_u365 })))
  | _ -> failwith "DT: impossible branch"
)
  | Base_dDiag.C_Check_ErrC (dtb_u_u366) -> (Base_dDiag.C_Check_ErrC (dtb_u_u366))
  | _ -> failwith "DT: impossible branch"
)) else ((v_parseBareKey dtb_u_u353) dtb_u_u354)))
  | _ -> failwith "DT: impossible branch"
))

# 623 "Vuna/Compiler/Frontend/Toml.vuna"
let rec v_parseKeySegments = (fun (dtb_u_u367 : int) (dtb_u_u368 : string) (dtb_u_u369 : t_TomlCursor) (dtb_u_u370 : string B_dData_dList.t_List) -> (if (dtb_u_u367 <= 0) then (Base_dDiag.v_icFuel "toml") else (let dtb_u_u371 = ((v_parseKeySegment dtb_u_u368) (v_skipBlank dtb_u_u369)) in (match dtb_u_u371 with
  | Base_dDiag.C_Check_OkC (dtb_u_u372) -> (match dtb_u_u372 with
  | { B_dData_dPair.f_Pair_first = dtb_u_u373; B_dData_dPair.f_Pair_second = dtb_u_u374 } -> (match (v_skipBlank dtb_u_u374) with
  | { f_TomlCursor_cursorChars = dtb_u_u375; f_TomlCursor_cursorLine = dtb_u_u376; f_TomlCursor_cursorCol = dtb_u_u377 } -> (match dtb_u_u375 with
  | B_dData_dList.C_List_Nil -> (Base_dDiag.C_Check_OkC ({ B_dData_dPair.f_Pair_first = (B_dData_dList.v_reverse (B_dData_dList.C_List__x58__x58_ (dtb_u_u373, dtb_u_u370))); B_dData_dPair.f_Pair_second = { f_TomlCursor_cursorChars = dtb_u_u375; f_TomlCursor_cursorLine = dtb_u_u376; f_TomlCursor_cursorCol = dtb_u_u377 } }))
  | B_dData_dList.C_List__x58__x58_ (dtb_u_u378, dtb_u_u379) -> (if (dtb_u_u378 = 46) then ((((v_parseKeySegments (dtb_u_u367 - 1)) dtb_u_u368) { f_TomlCursor_cursorChars = dtb_u_u379; f_TomlCursor_cursorLine = dtb_u_u376; f_TomlCursor_cursorCol = (dtb_u_u377 + 1) }) (B_dData_dList.C_List__x58__x58_ (dtb_u_u373, dtb_u_u370))) else (Base_dDiag.C_Check_OkC ({ B_dData_dPair.f_Pair_first = (B_dData_dList.v_reverse (B_dData_dList.C_List__x58__x58_ (dtb_u_u373, dtb_u_u370))); B_dData_dPair.f_Pair_second = { f_TomlCursor_cursorChars = dtb_u_u375; f_TomlCursor_cursorLine = dtb_u_u376; f_TomlCursor_cursorCol = dtb_u_u377 } })))
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
)
  | Base_dDiag.C_Check_ErrC (dtb_u_u380) -> (Base_dDiag.C_Check_ErrC (dtb_u_u380))
  | _ -> failwith "DT: impossible branch"
))))

# 620 "Vuna/Compiler/Frontend/Toml.vuna"
let v_parseKeyPath = (fun (dtb_u_u381 : string) (dtb_u_u382 : t_TomlCursor) -> ((((v_parseKeySegments (v_cursorFuel dtb_u_u382)) dtb_u_u381) dtb_u_u382) B_dData_dList.C_List_Nil))

# 667 "Vuna/Compiler/Frontend/Toml.vuna"
let v_parseSingleStringValue = (fun (dtb_u_u383 : string) (dtb_u_u384 : t_TomlCursor) -> (match (dtb_u_u384).f_TomlCursor_cursorChars with
  | B_dData_dList.C_List_Nil -> (((v_failAt dtb_u_u383) (dtb_u_u384).f_TomlCursor_cursorLine) "expected a string")
  | B_dData_dList.C_List__x58__x58_ (dtb_u_u385, dtb_u_u386) -> (if (dtb_u_u385 = 34) then (let dtb_u_u387 = ((v_parseBasicString dtb_u_u383) dtb_u_u384) in (match dtb_u_u387 with
  | Base_dDiag.C_Check_OkC (dtb_u_u388) -> (match dtb_u_u388 with
  | { B_dData_dPair.f_Pair_first = dtb_u_u389; B_dData_dPair.f_Pair_second = dtb_u_u390 } -> (Base_dDiag.C_Check_OkC ({ B_dData_dPair.f_Pair_first = (C_TomlValue_TStr (dtb_u_u389)); B_dData_dPair.f_Pair_second = dtb_u_u390 }))
  | _ -> failwith "DT: impossible branch"
)
  | Base_dDiag.C_Check_ErrC (dtb_u_u391) -> (Base_dDiag.C_Check_ErrC (dtb_u_u391))
  | _ -> failwith "DT: impossible branch"
)) else (let dtb_u_u392 = ((v_parseLiteralString dtb_u_u383) dtb_u_u384) in (match dtb_u_u392 with
  | Base_dDiag.C_Check_OkC (dtb_u_u393) -> (match dtb_u_u393 with
  | { B_dData_dPair.f_Pair_first = dtb_u_u394; B_dData_dPair.f_Pair_second = dtb_u_u395 } -> (Base_dDiag.C_Check_OkC ({ B_dData_dPair.f_Pair_first = (C_TomlValue_TStr (dtb_u_u394)); B_dData_dPair.f_Pair_second = dtb_u_u395 }))
  | _ -> failwith "DT: impossible branch"
)
  | Base_dDiag.C_Check_ErrC (dtb_u_u396) -> (Base_dDiag.C_Check_ErrC (dtb_u_u396))
  | _ -> failwith "DT: impossible branch"
)))
  | _ -> failwith "DT: impossible branch"
))

# 682 "Vuna/Compiler/Frontend/Toml.vuna"
let v_parseMultilineValue = (fun (dtb_u_u397 : bool) (dtb_u_u398 : string) (dtb_u_u399 : t_TomlCursor) -> (let dtb_u_u400 = ((v_advanceChars 3) dtb_u_u399) in (if dtb_u_u397 then (let dtb_u_u401 = ((v_parseMultilineBasic dtb_u_u398) dtb_u_u400) in (match dtb_u_u401 with
  | Base_dDiag.C_Check_OkC (dtb_u_u402) -> (match dtb_u_u402 with
  | { B_dData_dPair.f_Pair_first = dtb_u_u403; B_dData_dPair.f_Pair_second = dtb_u_u404 } -> (Base_dDiag.C_Check_OkC ({ B_dData_dPair.f_Pair_first = (C_TomlValue_TStr (dtb_u_u403)); B_dData_dPair.f_Pair_second = dtb_u_u404 }))
  | _ -> failwith "DT: impossible branch"
)
  | Base_dDiag.C_Check_ErrC (dtb_u_u405) -> (Base_dDiag.C_Check_ErrC (dtb_u_u405))
  | _ -> failwith "DT: impossible branch"
)) else (let dtb_u_u406 = ((v_parseMultilineLiteral dtb_u_u398) dtb_u_u400) in (match dtb_u_u406 with
  | Base_dDiag.C_Check_OkC (dtb_u_u407) -> (match dtb_u_u407 with
  | { B_dData_dPair.f_Pair_first = dtb_u_u408; B_dData_dPair.f_Pair_second = dtb_u_u409 } -> (Base_dDiag.C_Check_OkC ({ B_dData_dPair.f_Pair_first = (C_TomlValue_TStr (dtb_u_u408)); B_dData_dPair.f_Pair_second = dtb_u_u409 }))
  | _ -> failwith "DT: impossible branch"
)
  | Base_dDiag.C_Check_ErrC (dtb_u_u410) -> (Base_dDiag.C_Check_ErrC (dtb_u_u410))
  | _ -> failwith "DT: impossible branch"
)))))

# 814 "Vuna/Compiler/Frontend/Toml.vuna"
let v_makeInteger = (fun (dtb_u_u411 : int) (dtb_u_u412 : bool) -> (if dtb_u_u412 then (0 - dtb_u_u411) else dtb_u_u411))

# 805 "Vuna/Compiler/Frontend/Toml.vuna"
let v_finishInteger = (fun (dtb_u_u413 : string) (dtb_u_u414 : t_TomlCursor) (dtb_u_u415 : t_TomlCursor) (dtb_u_u416 : int) (dtb_u_u417 : int) (dtb_u_u418 : bool) -> (if (dtb_u_u416 = 0) then (((v_failAt dtb_u_u413) (dtb_u_u414).f_TomlCursor_cursorLine) "expected digits for integer") else (match (dtb_u_u415).f_TomlCursor_cursorChars with
  | B_dData_dList.C_List_Nil -> (Base_dDiag.C_Check_OkC ({ B_dData_dPair.f_Pair_first = ((v_makeInteger dtb_u_u417) dtb_u_u418); B_dData_dPair.f_Pair_second = dtb_u_u415 }))
  | B_dData_dList.C_List__x58__x58_ (dtb_u_u419, dtb_u_u420) -> (if (dtb_u_u419 = 46) then (((v_failAt dtb_u_u413) (dtb_u_u414).f_TomlCursor_cursorLine) "floating point numbers are not supported") else (if (v_isBareKeyChar dtb_u_u419) then (((v_failAt dtb_u_u413) (dtb_u_u414).f_TomlCursor_cursorLine) "invalid integer literal") else (Base_dDiag.C_Check_OkC ({ B_dData_dPair.f_Pair_first = ((v_makeInteger dtb_u_u417) dtb_u_u418); B_dData_dPair.f_Pair_second = dtb_u_u415 }))))
  | _ -> failwith "DT: impossible branch"
)))

# 790 "Vuna/Compiler/Frontend/Toml.vuna"
let rec v_parseIntegerDigits = (fun (dtb_u_u421 : int) (dtb_u_u422 : string) (dtb_u_u423 : t_TomlCursor) (dtb_u_u424 : t_TomlCursor) (dtb_u_u425 : int) (dtb_u_u426 : int) (dtb_u_u427 : bool) -> (if (dtb_u_u421 <= 0) then (Base_dDiag.v_icFuel "toml") else (match (dtb_u_u424).f_TomlCursor_cursorChars with
  | B_dData_dList.C_List_Nil -> ((((((v_finishInteger dtb_u_u422) dtb_u_u423) dtb_u_u424) dtb_u_u425) dtb_u_u426) dtb_u_u427)
  | B_dData_dList.C_List__x58__x58_ (dtb_u_u428, dtb_u_u429) -> (if (v_isDigitChar dtb_u_u428) then (let dtb_u_u430 = (dtb_u_u428 - 48) in (if (dtb_u_u426 > (if 10 = 0 then failwith "division by zero" else (Frontend_dLexer.v_maxIntLiteral - dtb_u_u430) / 10)) then (((v_failAt dtb_u_u422) (dtb_u_u423).f_TomlCursor_cursorLine) "integer literal is out of range (max is 4611686018427387903)") else (((((((v_parseIntegerDigits (dtb_u_u421 - 1)) dtb_u_u422) dtb_u_u423) (v_advanceCursor dtb_u_u424)) (dtb_u_u425 + 1)) ((dtb_u_u426 * 10) + dtb_u_u430)) dtb_u_u427))) else ((((((v_finishInteger dtb_u_u422) dtb_u_u423) dtb_u_u424) dtb_u_u425) dtb_u_u426) dtb_u_u427))
  | _ -> failwith "DT: impossible branch"
)))

# 778 "Vuna/Compiler/Frontend/Toml.vuna"
let v_parseInteger = (fun (dtb_u_u431 : string) (dtb_u_u432 : t_TomlCursor) -> (match (dtb_u_u432).f_TomlCursor_cursorChars with
  | B_dData_dList.C_List_Nil -> (((v_failAt dtb_u_u431) (dtb_u_u432).f_TomlCursor_cursorLine) "expected an integer")
  | B_dData_dList.C_List__x58__x58_ (dtb_u_u433, dtb_u_u434) -> (if (dtb_u_u433 = 45) then (((((((v_parseIntegerDigits (v_cursorFuel dtb_u_u432)) dtb_u_u431) dtb_u_u432) (v_advanceCursor dtb_u_u432)) 0) 0) true) else (if (v_isDigitChar dtb_u_u433) then (((((((v_parseIntegerDigits (v_cursorFuel dtb_u_u432)) dtb_u_u431) dtb_u_u432) dtb_u_u432) 0) 0) false) else (((v_failAt dtb_u_u431) (dtb_u_u432).f_TomlCursor_cursorLine) "expected an integer")))
  | _ -> failwith "DT: impossible branch"
))

# 818 "Vuna/Compiler/Frontend/Toml.vuna"
let v_parseIntValue = (fun (dtb_u_u435 : string) (dtb_u_u436 : t_TomlCursor) -> (let dtb_u_u437 = ((v_parseInteger dtb_u_u435) dtb_u_u436) in (match dtb_u_u437 with
  | Base_dDiag.C_Check_OkC (dtb_u_u438) -> (match dtb_u_u438 with
  | { B_dData_dPair.f_Pair_first = dtb_u_u439; B_dData_dPair.f_Pair_second = dtb_u_u440 } -> (Base_dDiag.C_Check_OkC ({ B_dData_dPair.f_Pair_first = (C_TomlValue_TInt (dtb_u_u439)); B_dData_dPair.f_Pair_second = dtb_u_u440 }))
  | _ -> failwith "DT: impossible branch"
)
  | Base_dDiag.C_Check_ErrC (dtb_u_u441) -> (Base_dDiag.C_Check_ErrC (dtb_u_u441))
  | _ -> failwith "DT: impossible branch"
)))

# 825 "Vuna/Compiler/Frontend/Toml.vuna"
let rec v_matchChars = (fun (dtb_u_u442 : int B_dData_dList.t_List) (dtb_u_u443 : t_TomlCursor) -> (match dtb_u_u442 with
  | B_dData_dList.C_List__x58__x58_ (dtb_u_u444, dtb_u_u445) -> (match dtb_u_u443 with
  | { f_TomlCursor_cursorChars = dtb_u_u446; f_TomlCursor_cursorLine = dtb_u_u447; f_TomlCursor_cursorCol = dtb_u_u448 } -> (match dtb_u_u446 with
  | B_dData_dList.C_List__x58__x58_ (dtb_u_u449, dtb_u_u450) -> (if (dtb_u_u449 = dtb_u_u444) then ((v_matchChars dtb_u_u445) { f_TomlCursor_cursorChars = dtb_u_u450; f_TomlCursor_cursorLine = dtb_u_u447; f_TomlCursor_cursorCol = (dtb_u_u448 + 1) }) else B_dData_dMaybe.C_Maybe_Nothing)
  | B_dData_dList.C_List_Nil -> B_dData_dMaybe.C_Maybe_Nothing
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
)
  | B_dData_dList.C_List_Nil -> (B_dData_dMaybe.C_Maybe_Just (dtb_u_u443))
  | _ -> failwith "DT: impossible branch"
))

# 831 "Vuna/Compiler/Frontend/Toml.vuna"
let v_matchWord = (fun (dtb_u_u451 : string) (dtb_u_u452 : t_TomlCursor) -> (match ((v_matchChars (B_dData_dList.dtp_unpack dtb_u_u451)) dtb_u_u452) with
  | B_dData_dMaybe.C_Maybe_Nothing -> B_dData_dMaybe.C_Maybe_Nothing
  | B_dData_dMaybe.C_Maybe_Just (dtb_u_u453) -> (match (dtb_u_u453).f_TomlCursor_cursorChars with
  | B_dData_dList.C_List_Nil -> (B_dData_dMaybe.C_Maybe_Just (dtb_u_u453))
  | B_dData_dList.C_List__x58__x58_ (dtb_u_u454, dtb_u_u455) -> (if (v_isBareKeyChar dtb_u_u454) then B_dData_dMaybe.C_Maybe_Nothing else (B_dData_dMaybe.C_Maybe_Just (dtb_u_u453)))
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
))

# 638 "Vuna/Compiler/Frontend/Toml.vuna"
let rec v_parseValue = (fun (dtb_u_u456 : int) (dtb_u_u457 : string) (dtb_u_u458 : t_TomlCursor) -> (if (dtb_u_u456 <= 0) then (Base_dDiag.v_icFuel "toml") else (match (dtb_u_u458).f_TomlCursor_cursorChars with
  | B_dData_dList.C_List_Nil -> (((v_failAt dtb_u_u457) (dtb_u_u458).f_TomlCursor_cursorLine) "expected a value")
  | B_dData_dList.C_List__x58__x58_ (dtb_u_u459, dtb_u_u460) -> (if (dtb_u_u459 = 34) then (if ((v_startsWithTripleOf 34) (dtb_u_u458).f_TomlCursor_cursorChars) then (((v_parseMultilineValue true) dtb_u_u457) dtb_u_u458) else ((v_parseSingleStringValue dtb_u_u457) dtb_u_u458)) else (if (dtb_u_u459 = 39) then (if ((v_startsWithTripleOf 39) (dtb_u_u458).f_TomlCursor_cursorChars) then (((v_parseMultilineValue false) dtb_u_u457) dtb_u_u458) else ((v_parseSingleStringValue dtb_u_u457) dtb_u_u458)) else (if (dtb_u_u459 = 91) then (((v_parseArrayValue (dtb_u_u456 - 1)) dtb_u_u457) dtb_u_u458) else (if (dtb_u_u459 = 123) then (((v_parseInlineTable (dtb_u_u456 - 1)) dtb_u_u457) dtb_u_u458) else (if (dtb_u_u459 = 45) then ((v_parseIntValue dtb_u_u457) dtb_u_u458) else (if (v_isDigitChar dtb_u_u459) then ((v_parseIntValue dtb_u_u457) dtb_u_u458) else (match ((v_matchWord "true") dtb_u_u458) with
  | B_dData_dMaybe.C_Maybe_Just (dtb_u_u461) -> (Base_dDiag.C_Check_OkC ({ B_dData_dPair.f_Pair_first = (C_TomlValue_TBool (true)); B_dData_dPair.f_Pair_second = dtb_u_u461 }))
  | B_dData_dMaybe.C_Maybe_Nothing -> (match ((v_matchWord "false") dtb_u_u458) with
  | B_dData_dMaybe.C_Maybe_Just (dtb_u_u462) -> (Base_dDiag.C_Check_OkC ({ B_dData_dPair.f_Pair_first = (C_TomlValue_TBool (false)); B_dData_dPair.f_Pair_second = dtb_u_u462 }))
  | B_dData_dMaybe.C_Maybe_Nothing -> (((v_failAt dtb_u_u457) (dtb_u_u458).f_TomlCursor_cursorLine) "expected a value")
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
)))))))
  | _ -> failwith "DT: impossible branch"
)))
# 696 "Vuna/Compiler/Frontend/Toml.vuna"
and v_parseArrayValue = (fun (dtb_u_u463 : int) (dtb_u_u464 : string) (dtb_u_u465 : t_TomlCursor) -> (if (dtb_u_u463 <= 0) then (Base_dDiag.v_icFuel "toml") else (match (dtb_u_u465).f_TomlCursor_cursorChars with
  | B_dData_dList.C_List_Nil -> (((v_failAt dtb_u_u464) (dtb_u_u465).f_TomlCursor_cursorLine) "unterminated array")
  | B_dData_dList.C_List__x58__x58_ (dtb_u_u466, dtb_u_u467) -> ((((v_parseArrayItems (v_cursorFuel (v_advanceCursor dtb_u_u465))) dtb_u_u464) (v_advanceCursor dtb_u_u465)) B_dData_dList.C_List_Nil)
  | _ -> failwith "DT: impossible branch"
)))
# 705 "Vuna/Compiler/Frontend/Toml.vuna"
and v_parseArrayItems = (fun (dtb_u_u468 : int) (dtb_u_u469 : string) (dtb_u_u470 : t_TomlCursor) (dtb_u_u471 : t_TomlValue B_dData_dList.t_List) -> (if (dtb_u_u468 <= 0) then (Base_dDiag.v_icFuel "toml") else (match (v_skipGap dtb_u_u470) with
  | { f_TomlCursor_cursorChars = dtb_u_u472; f_TomlCursor_cursorLine = dtb_u_u473; f_TomlCursor_cursorCol = dtb_u_u474 } -> (match dtb_u_u472 with
  | B_dData_dList.C_List_Nil -> (((v_failAt dtb_u_u469) dtb_u_u473) "unterminated array")
  | B_dData_dList.C_List__x58__x58_ (dtb_u_u475, dtb_u_u476) -> (if (dtb_u_u475 = 93) then (Base_dDiag.C_Check_OkC ({ B_dData_dPair.f_Pair_first = (C_TomlValue_TArray ((B_dData_dList.v_reverse dtb_u_u471))); B_dData_dPair.f_Pair_second = (v_advanceCursor { f_TomlCursor_cursorChars = dtb_u_u472; f_TomlCursor_cursorLine = dtb_u_u473; f_TomlCursor_cursorCol = dtb_u_u474 }) })) else (let dtb_u_u477 = (((v_parseValue (dtb_u_u468 - 1)) dtb_u_u469) { f_TomlCursor_cursorChars = dtb_u_u472; f_TomlCursor_cursorLine = dtb_u_u473; f_TomlCursor_cursorCol = dtb_u_u474 }) in (match dtb_u_u477 with
  | Base_dDiag.C_Check_OkC (dtb_u_u478) -> (match dtb_u_u478 with
  | { B_dData_dPair.f_Pair_first = dtb_u_u479; B_dData_dPair.f_Pair_second = dtb_u_u480 } -> (match (v_skipGap dtb_u_u480) with
  | { f_TomlCursor_cursorChars = dtb_u_u481; f_TomlCursor_cursorLine = dtb_u_u482; f_TomlCursor_cursorCol = dtb_u_u483 } -> (let dtb_u_u484 = dtb_u_u481 in (match dtb_u_u484 with
  | B_dData_dList.C_List__x58__x58_ (dtb_u_u485, dtb_u_u486) -> (if (dtb_u_u485 = 44) then ((((v_parseArrayItems (dtb_u_u468 - 1)) dtb_u_u469) (v_advanceCursor { f_TomlCursor_cursorChars = dtb_u_u481; f_TomlCursor_cursorLine = dtb_u_u482; f_TomlCursor_cursorCol = dtb_u_u483 })) (B_dData_dList.C_List__x58__x58_ (dtb_u_u479, dtb_u_u471))) else (if (dtb_u_u485 = 93) then (Base_dDiag.C_Check_OkC ({ B_dData_dPair.f_Pair_first = (C_TomlValue_TArray ((B_dData_dList.v_reverse (B_dData_dList.C_List__x58__x58_ (dtb_u_u479, dtb_u_u471))))); B_dData_dPair.f_Pair_second = (v_advanceCursor { f_TomlCursor_cursorChars = dtb_u_u481; f_TomlCursor_cursorLine = dtb_u_u482; f_TomlCursor_cursorCol = dtb_u_u483 }) })) else (((v_failAt dtb_u_u469) dtb_u_u482) "expected ',' or ']' in array")))
  | B_dData_dList.C_List_Nil -> (((v_failAt dtb_u_u469) dtb_u_u482) "unterminated array")
  | _ -> failwith "DT: impossible branch"
))
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
)
  | Base_dDiag.C_Check_ErrC (dtb_u_u487) -> (Base_dDiag.C_Check_ErrC (dtb_u_u487))
  | _ -> failwith "DT: impossible branch"
)))
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
)))
# 730 "Vuna/Compiler/Frontend/Toml.vuna"
and v_parseInlineTable = (fun (dtb_u_u488 : int) (dtb_u_u489 : string) (dtb_u_u490 : t_TomlCursor) -> (if (dtb_u_u488 <= 0) then (Base_dDiag.v_icFuel "toml") else (match (dtb_u_u490).f_TomlCursor_cursorChars with
  | B_dData_dList.C_List_Nil -> (((v_failAt dtb_u_u489) (dtb_u_u490).f_TomlCursor_cursorLine) "unterminated inline table")
  | B_dData_dList.C_List__x58__x58_ (dtb_u_u491, dtb_u_u492) -> ((((v_parseInlineFields (v_cursorFuel (v_advanceCursor dtb_u_u490))) dtb_u_u489) (v_advanceCursor dtb_u_u490)) B_dData_dList.C_List_Nil)
  | _ -> failwith "DT: impossible branch"
)))
# 739 "Vuna/Compiler/Frontend/Toml.vuna"
and v_parseInlineFields = (fun (dtb_u_u493 : int) (dtb_u_u494 : string) (dtb_u_u495 : t_TomlCursor) (dtb_u_u496 : (string, t_TomlNode) B_dData_dPair.t_Pair B_dData_dList.t_List) -> (if (dtb_u_u493 <= 0) then (Base_dDiag.v_icFuel "toml") else (match (v_skipBlank dtb_u_u495) with
  | { f_TomlCursor_cursorChars = dtb_u_u497; f_TomlCursor_cursorLine = dtb_u_u498; f_TomlCursor_cursorCol = dtb_u_u499 } -> (match dtb_u_u497 with
  | B_dData_dList.C_List_Nil -> (((v_failAt dtb_u_u494) dtb_u_u498) "unterminated inline table")
  | B_dData_dList.C_List__x58__x58_ (dtb_u_u500, dtb_u_u501) -> (if (dtb_u_u500 = 125) then (Base_dDiag.C_Check_OkC ({ B_dData_dPair.f_Pair_first = (C_TomlValue_TTable (((v_rootValue dtb_u_u493) dtb_u_u496))); B_dData_dPair.f_Pair_second = (v_advanceCursor { f_TomlCursor_cursorChars = dtb_u_u497; f_TomlCursor_cursorLine = dtb_u_u498; f_TomlCursor_cursorCol = dtb_u_u499 }) })) else (let dtb_u_u502 = ((v_parseKeyPath dtb_u_u494) { f_TomlCursor_cursorChars = dtb_u_u497; f_TomlCursor_cursorLine = dtb_u_u498; f_TomlCursor_cursorCol = dtb_u_u499 }) in (match dtb_u_u502 with
  | Base_dDiag.C_Check_OkC (dtb_u_u503) -> (match dtb_u_u503 with
  | { B_dData_dPair.f_Pair_first = dtb_u_u504; B_dData_dPair.f_Pair_second = dtb_u_u505 } -> (match (v_skipBlank dtb_u_u505) with
  | { f_TomlCursor_cursorChars = dtb_u_u506; f_TomlCursor_cursorLine = dtb_u_u507; f_TomlCursor_cursorCol = dtb_u_u508 } -> (match dtb_u_u506 with
  | B_dData_dList.C_List_Nil -> (((v_failAt dtb_u_u494) dtb_u_u507) "expected '=' in inline table")
  | B_dData_dList.C_List__x58__x58_ (dtb_u_u509, dtb_u_u510) -> (if (dtb_u_u509 = 61) then (let dtb_u_u511 = (((v_parseValue (dtb_u_u493 - 1)) dtb_u_u494) (v_skipBlank { f_TomlCursor_cursorChars = dtb_u_u510; f_TomlCursor_cursorLine = dtb_u_u507; f_TomlCursor_cursorCol = (dtb_u_u508 + 1) })) in (match dtb_u_u511 with
  | Base_dDiag.C_Check_OkC (dtb_u_u512) -> (match dtb_u_u512 with
  | { B_dData_dPair.f_Pair_first = dtb_u_u513; B_dData_dPair.f_Pair_second = dtb_u_u514 } -> (match (((((((v_insertValue (v_pathFuel dtb_u_u504)) dtb_u_u494) dtb_u_u507) dtb_u_u504) (v_sectionOfPath dtb_u_u504)) dtb_u_u513) dtb_u_u496) with
  | Base_dDiag.C_Check_ErrC (dtb_u_u515) -> (Base_dDiag.C_Check_ErrC (dtb_u_u515))
  | Base_dDiag.C_Check_OkC (dtb_u_u516) -> (match (v_skipBlank dtb_u_u514) with
  | { f_TomlCursor_cursorChars = dtb_u_u517; f_TomlCursor_cursorLine = dtb_u_u518; f_TomlCursor_cursorCol = dtb_u_u519 } -> (let dtb_u_u520 = dtb_u_u517 in (match dtb_u_u520 with
  | B_dData_dList.C_List__x58__x58_ (dtb_u_u521, dtb_u_u522) -> (if (dtb_u_u521 = 44) then ((((v_parseInlineFields (dtb_u_u493 - 1)) dtb_u_u494) { f_TomlCursor_cursorChars = dtb_u_u522; f_TomlCursor_cursorLine = dtb_u_u518; f_TomlCursor_cursorCol = (dtb_u_u519 + 1) }) dtb_u_u516) else (if (dtb_u_u521 = 125) then (Base_dDiag.C_Check_OkC ({ B_dData_dPair.f_Pair_first = (C_TomlValue_TTable (((v_rootValue dtb_u_u493) dtb_u_u516))); B_dData_dPair.f_Pair_second = (v_advanceCursor { f_TomlCursor_cursorChars = dtb_u_u517; f_TomlCursor_cursorLine = dtb_u_u518; f_TomlCursor_cursorCol = dtb_u_u519 }) })) else (((v_failAt dtb_u_u494) dtb_u_u518) "expected ',' or '}' in inline table")))
  | B_dData_dList.C_List_Nil -> (((v_failAt dtb_u_u494) dtb_u_u518) "unterminated inline table")
  | _ -> failwith "DT: impossible branch"
))
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
)
  | Base_dDiag.C_Check_ErrC (dtb_u_u523) -> (Base_dDiag.C_Check_ErrC (dtb_u_u523))
  | _ -> failwith "DT: impossible branch"
)) else (((v_failAt dtb_u_u494) dtb_u_u507) "expected '=' in inline table"))
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
)
  | Base_dDiag.C_Check_ErrC (dtb_u_u524) -> (Base_dDiag.C_Check_ErrC (dtb_u_u524))
  | _ -> failwith "DT: impossible branch"
)))
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
)))

# 853 "Vuna/Compiler/Frontend/Toml.vuna"
let v_expectEolAfterComment = (fun (dtb_u_u525 : string) (dtb_u_u526 : t_TomlCursor) -> (match (v_skipComment dtb_u_u526) with
  | { f_TomlCursor_cursorChars = dtb_u_u527; f_TomlCursor_cursorLine = dtb_u_u528; f_TomlCursor_cursorCol = dtb_u_u529 } -> (match dtb_u_u527 with
  | B_dData_dList.C_List_Nil -> (Base_dDiag.C_Check_OkC ({ f_TomlCursor_cursorChars = dtb_u_u527; f_TomlCursor_cursorLine = dtb_u_u528; f_TomlCursor_cursorCol = dtb_u_u529 }))
  | B_dData_dList.C_List__x58__x58_ (dtb_u_u530, dtb_u_u531) -> (if (dtb_u_u530 = 10) then (Base_dDiag.C_Check_OkC ({ f_TomlCursor_cursorChars = dtb_u_u531; f_TomlCursor_cursorLine = (dtb_u_u528 + 1); f_TomlCursor_cursorCol = 1 })) else (((v_failAt dtb_u_u525) dtb_u_u528) "unexpected character after comment"))
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
))

# 841 "Vuna/Compiler/Frontend/Toml.vuna"
let v_expectEol = (fun (dtb_u_u532 : string) (dtb_u_u533 : t_TomlCursor) -> (match (v_skipBlank dtb_u_u533) with
  | { f_TomlCursor_cursorChars = dtb_u_u534; f_TomlCursor_cursorLine = dtb_u_u535; f_TomlCursor_cursorCol = dtb_u_u536 } -> (match dtb_u_u534 with
  | B_dData_dList.C_List_Nil -> (Base_dDiag.C_Check_OkC ({ f_TomlCursor_cursorChars = dtb_u_u534; f_TomlCursor_cursorLine = dtb_u_u535; f_TomlCursor_cursorCol = dtb_u_u536 }))
  | B_dData_dList.C_List__x58__x58_ (dtb_u_u537, dtb_u_u538) -> (if (dtb_u_u537 = 10) then (Base_dDiag.C_Check_OkC ({ f_TomlCursor_cursorChars = dtb_u_u538; f_TomlCursor_cursorLine = (dtb_u_u535 + 1); f_TomlCursor_cursorCol = 1 })) else (if (dtb_u_u537 = 35) then ((v_expectEolAfterComment dtb_u_u532) { f_TomlCursor_cursorChars = dtb_u_u534; f_TomlCursor_cursorLine = dtb_u_u535; f_TomlCursor_cursorCol = dtb_u_u536 }) else (((v_failAt dtb_u_u532) (dtb_u_u533).f_TomlCursor_cursorLine) "unexpected character at end of line")))
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
))

# 866 "Vuna/Compiler/Frontend/Toml.vuna"
let rec v_parseSectionLine = (fun (dtb_u_u539 : int) (dtb_u_u540 : string) (dtb_u_u541 : t_TomlCursor) (dtb_u_u542 : string B_dData_dList.t_List) (dtb_u_u543 : (string, t_TomlNode) B_dData_dPair.t_Pair B_dData_dList.t_List) -> (if (dtb_u_u539 <= 0) then (Base_dDiag.v_icFuel "toml") else (let dtb_u_u544 = ((v_parseKeyPath dtb_u_u540) (v_advanceCursor dtb_u_u541)) in (match dtb_u_u544 with
  | Base_dDiag.C_Check_OkC (dtb_u_u545) -> (match dtb_u_u545 with
  | { B_dData_dPair.f_Pair_first = dtb_u_u546; B_dData_dPair.f_Pair_second = dtb_u_u547 } -> (match (v_skipBlank dtb_u_u547) with
  | { f_TomlCursor_cursorChars = dtb_u_u548; f_TomlCursor_cursorLine = dtb_u_u549; f_TomlCursor_cursorCol = dtb_u_u550 } -> (match dtb_u_u548 with
  | B_dData_dList.C_List_Nil -> (((v_failAt dtb_u_u540) dtb_u_u549) "unterminated section header")
  | B_dData_dList.C_List__x58__x58_ (dtb_u_u551, dtb_u_u552) -> (if (dtb_u_u551 = 93) then (((((((v_afterSingleBracket (dtb_u_u539 - 1)) dtb_u_u540) dtb_u_u549) dtb_u_u550) dtb_u_u552) dtb_u_u546) dtb_u_u543) else (((v_failAt dtb_u_u540) dtb_u_u549) "expected '.' or ']' in section header"))
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
)
  | Base_dDiag.C_Check_ErrC (dtb_u_u553) -> (Base_dDiag.C_Check_ErrC (dtb_u_u553))
  | _ -> failwith "DT: impossible branch"
))))
# 880 "Vuna/Compiler/Frontend/Toml.vuna"
and v_afterSingleBracket = (fun (dtb_u_u554 : int) (dtb_u_u555 : string) (dtb_u_u556 : int) (dtb_u_u557 : int) (dtb_u_u558 : int B_dData_dList.t_List) (dtb_u_u559 : string B_dData_dList.t_List) (dtb_u_u560 : (string, t_TomlNode) B_dData_dPair.t_Pair B_dData_dList.t_List) -> (if (dtb_u_u554 <= 0) then (Base_dDiag.v_icFuel "toml") else (match ((v_expectEol dtb_u_u555) { f_TomlCursor_cursorChars = dtb_u_u558; f_TomlCursor_cursorLine = dtb_u_u556; f_TomlCursor_cursorCol = (dtb_u_u557 + 1) }) with
  | Base_dDiag.C_Check_ErrC (dtb_u_u561) -> (Base_dDiag.C_Check_ErrC (dtb_u_u561))
  | Base_dDiag.C_Check_OkC (dtb_u_u562) -> (match ((((((v_ensureTable (v_pathFuel dtb_u_u559)) dtb_u_u555) dtb_u_u556) dtb_u_u559) C_TableKind_KindExplicit) dtb_u_u560) with
  | Base_dDiag.C_Check_ErrC (dtb_u_u563) -> (Base_dDiag.C_Check_ErrC (dtb_u_u563))
  | Base_dDiag.C_Check_OkC (dtb_u_u564) -> (((((v_parseTomlLoop (dtb_u_u554 - 1)) dtb_u_u555) dtb_u_u562) dtb_u_u559) dtb_u_u564)
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
)))
# 893 "Vuna/Compiler/Frontend/Toml.vuna"
and v_parseTableArrayLine = (fun (dtb_u_u565 : int) (dtb_u_u566 : string) (dtb_u_u567 : t_TomlCursor) (dtb_u_u568 : string B_dData_dList.t_List) (dtb_u_u569 : (string, t_TomlNode) B_dData_dPair.t_Pair B_dData_dList.t_List) -> (if (dtb_u_u565 <= 0) then (Base_dDiag.v_icFuel "toml") else (let dtb_u_u570 = ((v_parseKeyPath dtb_u_u566) (v_advanceCursor (v_advanceCursor dtb_u_u567))) in (match dtb_u_u570 with
  | Base_dDiag.C_Check_OkC (dtb_u_u571) -> (match dtb_u_u571 with
  | { B_dData_dPair.f_Pair_first = dtb_u_u572; B_dData_dPair.f_Pair_second = dtb_u_u573 } -> (match (v_skipBlank dtb_u_u573) with
  | { f_TomlCursor_cursorChars = dtb_u_u574; f_TomlCursor_cursorLine = dtb_u_u575; f_TomlCursor_cursorCol = dtb_u_u576 } -> (match dtb_u_u574 with
  | B_dData_dList.C_List_Nil -> (((v_failAt dtb_u_u566) dtb_u_u575) "unterminated table array header")
  | B_dData_dList.C_List__x58__x58_ (dtb_u_u577, dtb_u_u578) -> (if (dtb_u_u577 = 93) then (((((((v_afterDoubleBracket (dtb_u_u565 - 1)) dtb_u_u566) dtb_u_u575) dtb_u_u576) dtb_u_u578) dtb_u_u572) dtb_u_u569) else (((v_failAt dtb_u_u566) dtb_u_u575) "expected ']]' in table array header"))
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
)
  | Base_dDiag.C_Check_ErrC (dtb_u_u579) -> (Base_dDiag.C_Check_ErrC (dtb_u_u579))
  | _ -> failwith "DT: impossible branch"
))))
# 907 "Vuna/Compiler/Frontend/Toml.vuna"
and v_afterDoubleBracket = (fun (dtb_u_u580 : int) (dtb_u_u581 : string) (dtb_u_u582 : int) (dtb_u_u583 : int) (dtb_u_u584 : int B_dData_dList.t_List) (dtb_u_u585 : string B_dData_dList.t_List) (dtb_u_u586 : (string, t_TomlNode) B_dData_dPair.t_Pair B_dData_dList.t_List) -> (if (dtb_u_u580 <= 0) then (Base_dDiag.v_icFuel "toml") else (match dtb_u_u584 with
  | B_dData_dList.C_List__x58__x58_ (dtb_u_u587, dtb_u_u588) -> (if (dtb_u_u587 = 93) then (match ((v_expectEol dtb_u_u581) { f_TomlCursor_cursorChars = dtb_u_u588; f_TomlCursor_cursorLine = dtb_u_u582; f_TomlCursor_cursorCol = (dtb_u_u583 + 2) }) with
  | Base_dDiag.C_Check_ErrC (dtb_u_u589) -> (Base_dDiag.C_Check_ErrC (dtb_u_u589))
  | Base_dDiag.C_Check_OkC (dtb_u_u590) -> (match (((((v_appendTableArray (v_pathFuel dtb_u_u585)) dtb_u_u581) dtb_u_u582) dtb_u_u585) dtb_u_u586) with
  | Base_dDiag.C_Check_ErrC (dtb_u_u591) -> (Base_dDiag.C_Check_ErrC (dtb_u_u591))
  | Base_dDiag.C_Check_OkC (dtb_u_u592) -> (((((v_parseTomlLoop (dtb_u_u580 - 1)) dtb_u_u581) dtb_u_u590) dtb_u_u585) dtb_u_u592)
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
) else (((v_failAt dtb_u_u581) dtb_u_u582) "expected ']]' in table array header"))
  | _ -> (((v_failAt dtb_u_u581) dtb_u_u582) "expected ']]' in table array header")
)))
# 925 "Vuna/Compiler/Frontend/Toml.vuna"
and v_parseEntryValue = (fun (dtb_u_u593 : int) (dtb_u_u594 : string) (dtb_u_u595 : t_TomlCursor) (dtb_u_u596 : int) (dtb_u_u597 : string B_dData_dList.t_List) (dtb_u_u598 : string B_dData_dList.t_List) (dtb_u_u599 : (string, t_TomlNode) B_dData_dPair.t_Pair B_dData_dList.t_List) -> (if (dtb_u_u593 <= 0) then (Base_dDiag.v_icFuel "toml") else (let dtb_u_u600 = (((v_parseValue (dtb_u_u593 - 1)) dtb_u_u594) (v_skipBlank dtb_u_u595)) in (match dtb_u_u600 with
  | Base_dDiag.C_Check_OkC (dtb_u_u601) -> (match dtb_u_u601 with
  | { B_dData_dPair.f_Pair_first = dtb_u_u602; B_dData_dPair.f_Pair_second = dtb_u_u603 } -> (match ((v_expectEol dtb_u_u594) dtb_u_u603) with
  | Base_dDiag.C_Check_ErrC (dtb_u_u604) -> (Base_dDiag.C_Check_ErrC (dtb_u_u604))
  | Base_dDiag.C_Check_OkC (dtb_u_u605) -> (let dtb_u_u606 = ((v_appendPath dtb_u_u598) dtb_u_u597) in (match (((((((v_insertValue (v_pathFuel dtb_u_u606)) dtb_u_u594) dtb_u_u596) dtb_u_u606) (v_sectionOfPath dtb_u_u606)) dtb_u_u602) dtb_u_u599) with
  | Base_dDiag.C_Check_ErrC (dtb_u_u607) -> (Base_dDiag.C_Check_ErrC (dtb_u_u607))
  | Base_dDiag.C_Check_OkC (dtb_u_u608) -> (((((v_parseTomlLoop (dtb_u_u593 - 1)) dtb_u_u594) dtb_u_u605) dtb_u_u598) dtb_u_u608)
  | _ -> failwith "DT: impossible branch"
))
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
)
  | Base_dDiag.C_Check_ErrC (dtb_u_u609) -> (Base_dDiag.C_Check_ErrC (dtb_u_u609))
  | _ -> failwith "DT: impossible branch"
))))
# 942 "Vuna/Compiler/Frontend/Toml.vuna"
and v_parseKeyLine = (fun (dtb_u_u610 : int) (dtb_u_u611 : string) (dtb_u_u612 : t_TomlCursor) (dtb_u_u613 : string B_dData_dList.t_List) (dtb_u_u614 : (string, t_TomlNode) B_dData_dPair.t_Pair B_dData_dList.t_List) -> (if (dtb_u_u610 <= 0) then (Base_dDiag.v_icFuel "toml") else (let dtb_u_u615 = ((v_parseKeyPath dtb_u_u611) dtb_u_u612) in (match dtb_u_u615 with
  | Base_dDiag.C_Check_OkC (dtb_u_u616) -> (match dtb_u_u616 with
  | { B_dData_dPair.f_Pair_first = dtb_u_u617; B_dData_dPair.f_Pair_second = dtb_u_u618 } -> (match (v_skipBlank dtb_u_u618) with
  | { f_TomlCursor_cursorChars = dtb_u_u619; f_TomlCursor_cursorLine = dtb_u_u620; f_TomlCursor_cursorCol = dtb_u_u621 } -> (match dtb_u_u619 with
  | B_dData_dList.C_List_Nil -> (((v_failAt dtb_u_u611) (dtb_u_u612).f_TomlCursor_cursorLine) "expected '=' after key")
  | B_dData_dList.C_List__x58__x58_ (dtb_u_u622, dtb_u_u623) -> (if (dtb_u_u622 = 61) then (((((((v_parseEntryValue (dtb_u_u610 - 1)) dtb_u_u611) { f_TomlCursor_cursorChars = dtb_u_u623; f_TomlCursor_cursorLine = dtb_u_u620; f_TomlCursor_cursorCol = (dtb_u_u621 + 1) }) (dtb_u_u612).f_TomlCursor_cursorLine) dtb_u_u617) dtb_u_u613) dtb_u_u614) else (((v_failAt dtb_u_u611) (dtb_u_u612).f_TomlCursor_cursorLine) "expected '=' after key"))
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
)
  | Base_dDiag.C_Check_ErrC (dtb_u_u624) -> (Base_dDiag.C_Check_ErrC (dtb_u_u624))
  | _ -> failwith "DT: impossible branch"
))))
# 956 "Vuna/Compiler/Frontend/Toml.vuna"
and v_parseTomlLoop = (fun (dtb_u_u625 : int) (dtb_u_u626 : string) (dtb_u_u627 : t_TomlCursor) (dtb_u_u628 : string B_dData_dList.t_List) (dtb_u_u629 : (string, t_TomlNode) B_dData_dPair.t_Pair B_dData_dList.t_List) -> (if (dtb_u_u625 <= 0) then (Base_dDiag.v_icFuel "toml") else (((((v_parseTomlLoopAt (dtb_u_u625 - 1)) dtb_u_u626) (v_skipGap dtb_u_u627)) dtb_u_u628) dtb_u_u629)))
# 963 "Vuna/Compiler/Frontend/Toml.vuna"
and v_parseTomlLoopAt = (fun (dtb_u_u630 : int) (dtb_u_u631 : string) (dtb_u_u632 : t_TomlCursor) (dtb_u_u633 : string B_dData_dList.t_List) (dtb_u_u634 : (string, t_TomlNode) B_dData_dPair.t_Pair B_dData_dList.t_List) -> (if (dtb_u_u630 <= 0) then (Base_dDiag.v_icFuel "toml") else (match (dtb_u_u632).f_TomlCursor_cursorChars with
  | B_dData_dList.C_List_Nil -> (Base_dDiag.C_Check_OkC (dtb_u_u634))
  | B_dData_dList.C_List__x58__x58_ (dtb_u_u635, dtb_u_u636) -> (if (dtb_u_u635 = 91) then (((((v_parseBracketLine (dtb_u_u630 - 1)) dtb_u_u631) dtb_u_u632) dtb_u_u633) dtb_u_u634) else (((((v_parseKeyLine (dtb_u_u630 - 1)) dtb_u_u631) dtb_u_u632) dtb_u_u633) dtb_u_u634))
  | _ -> failwith "DT: impossible branch"
)))
# 973 "Vuna/Compiler/Frontend/Toml.vuna"
and v_parseBracketLine = (fun (dtb_u_u637 : int) (dtb_u_u638 : string) (dtb_u_u639 : t_TomlCursor) (dtb_u_u640 : string B_dData_dList.t_List) (dtb_u_u641 : (string, t_TomlNode) B_dData_dPair.t_Pair B_dData_dList.t_List) -> (if (dtb_u_u637 <= 0) then (Base_dDiag.v_icFuel "toml") else (match (dtb_u_u639).f_TomlCursor_cursorChars with
  | B_dData_dList.C_List__x58__x58_ (dtb_u_u642, dtb_u_u643) -> (match dtb_u_u643 with
  | B_dData_dList.C_List__x58__x58_ (dtb_u_u644, dtb_u_u645) -> (if (dtb_u_u644 = 91) then (((((v_parseTableArrayLine (dtb_u_u637 - 1)) dtb_u_u638) dtb_u_u639) dtb_u_u640) dtb_u_u641) else (((((v_parseSectionLine (dtb_u_u637 - 1)) dtb_u_u638) dtb_u_u639) dtb_u_u640) dtb_u_u641))
  | _ -> (((((v_parseSectionLine (dtb_u_u637 - 1)) dtb_u_u638) dtb_u_u639) dtb_u_u640) dtb_u_u641)
)
  | _ -> (((((v_parseSectionLine (dtb_u_u637 - 1)) dtb_u_u638) dtb_u_u639) dtb_u_u640) dtb_u_u641)
)))

# 989 "Vuna/Compiler/Frontend/Toml.vuna"
let v_parseTomlAt = (fun (dtb_u_u646 : string) (dtb_u_u647 : string) -> (let dtb_u_u648 = { f_TomlCursor_cursorChars = (v_stripCR (B_dData_dList.dtp_unpack dtb_u_u647)); f_TomlCursor_cursorLine = 1; f_TomlCursor_cursorCol = 1 } in (match (((((v_parseTomlLoop (v_lineFuel dtb_u_u648)) dtb_u_u646) dtb_u_u648) B_dData_dList.C_List_Nil) B_dData_dList.C_List_Nil) with
  | Base_dDiag.C_Check_ErrC (dtb_u_u649) -> (Base_dDiag.C_Check_ErrC (dtb_u_u649))
  | Base_dDiag.C_Check_OkC (dtb_u_u650) -> (Base_dDiag.C_Check_OkC ((((v_flattenFields (v_flattenFuel dtb_u_u648)) B_dData_dList.C_List_Nil) dtb_u_u650)))
  | _ -> failwith "DT: impossible branch"
)))

# 986 "Vuna/Compiler/Frontend/Toml.vuna"
let v_parseToml = (fun (dtb_u_u651 : string) -> ((v_parseTomlAt "") dtb_u_u651))

# 998 "Vuna/Compiler/Frontend/Toml.vuna"
let v_parseTomlDoc = (fun (dtb_u_u652 : string) (dtb_u_u653 : string) -> (let dtb_u_u654 = { f_TomlCursor_cursorChars = (v_stripCR (B_dData_dList.dtp_unpack dtb_u_u653)); f_TomlCursor_cursorLine = 1; f_TomlCursor_cursorCol = 1 } in (match (((((v_parseTomlLoop (v_lineFuel dtb_u_u654)) dtb_u_u652) dtb_u_u654) B_dData_dList.C_List_Nil) B_dData_dList.C_List_Nil) with
  | Base_dDiag.C_Check_ErrC (dtb_u_u655) -> (Obj.magic (Base_dDiag.C_Check_ErrC (dtb_u_u655)))
  | Base_dDiag.C_Check_OkC (dtb_u_u656) -> (Obj.magic (Base_dDiag.C_Check_OkC (((v_rootValue (v_flattenFuel dtb_u_u654)) dtb_u_u656))))
  | _ -> failwith "DT: impossible branch"
)))

# 1007 "Vuna/Compiler/Frontend/Toml.vuna"
let rec v_arrayStrings = (fun (dtb_u_u657 : t_TomlValue B_dData_dList.t_List) -> (match dtb_u_u657 with
  | B_dData_dList.C_List__x58__x58_ (dtb_u_u658, dtb_u_u659) -> (match dtb_u_u658 with
  | C_TomlValue_TStr (dtb_u_u660) -> (match (v_arrayStrings dtb_u_u659) with
  | B_dData_dMaybe.C_Maybe_Nothing -> B_dData_dMaybe.C_Maybe_Nothing
  | B_dData_dMaybe.C_Maybe_Just (dtb_u_u661) -> (B_dData_dMaybe.C_Maybe_Just ((B_dData_dList.C_List__x58__x58_ (dtb_u_u660, dtb_u_u661))))
  | _ -> failwith "DT: impossible branch"
)
  | _ -> B_dData_dMaybe.C_Maybe_Nothing
)
  | B_dData_dList.C_List_Nil -> (B_dData_dMaybe.C_Maybe_Just (B_dData_dList.C_List_Nil))
  | _ -> failwith "DT: impossible branch"
))

# 1055 "Vuna/Compiler/Frontend/Toml.vuna"
let rec v_splitAtList = (fun (dtb_u_u663 : int) dtb_u_u664 -> (if (dtb_u_u663 <= 0) then (B_dData_dMaybe.C_Maybe_Just ({ B_dData_dPair.f_Pair_first = B_dData_dList.C_List_Nil; B_dData_dPair.f_Pair_second = dtb_u_u664 })) else (match dtb_u_u664 with
  | B_dData_dList.C_List_Nil -> B_dData_dMaybe.C_Maybe_Nothing
  | B_dData_dList.C_List__x58__x58_ (dtb_u_u665, dtb_u_u666) -> (let dtb_u_u667 = ((v_splitAtList (dtb_u_u663 - 1)) dtb_u_u666) in (match dtb_u_u667 with
  | B_dData_dMaybe.C_Maybe_Just (dtb_u_u668) -> (match dtb_u_u668 with
  | { B_dData_dPair.f_Pair_first = dtb_u_u669; B_dData_dPair.f_Pair_second = dtb_u_u670 } -> (B_dData_dMaybe.C_Maybe_Just ({ B_dData_dPair.f_Pair_first = (B_dData_dList.C_List__x58__x58_ (dtb_u_u665, dtb_u_u669)); B_dData_dPair.f_Pair_second = dtb_u_u670 }))
  | _ -> failwith "DT: impossible branch"
)
  | B_dData_dMaybe.C_Maybe_Nothing -> B_dData_dMaybe.C_Maybe_Nothing
  | _ -> failwith "DT: impossible branch"
))
  | _ -> failwith "DT: impossible branch"
)))

# 1067 "Vuna/Compiler/Frontend/Toml.vuna"
let rec v_samePath = (fun dtb_u_u672 dtb_u_u673 dtb_u_u674 -> (match dtb_u_u673 with
  | B_dData_dList.C_List__x58__x58_ (dtb_u_u675, dtb_u_u676) -> (match dtb_u_u674 with
  | B_dData_dList.C_List__x58__x58_ (dtb_u_u677, dtb_u_u678) -> (if (((B_dTrait_dEq.v__x61__x61_ dtb_u_u672) dtb_u_u675) dtb_u_u677) then (((v_samePath dtb_u_u672) dtb_u_u676) dtb_u_u678) else false)
  | _ -> false
)
  | B_dData_dList.C_List_Nil -> (match dtb_u_u674 with
  | B_dData_dList.C_List_Nil -> true
  | _ -> false
)
  | _ -> failwith "DT: impossible branch"
))

# 1015 "Vuna/Compiler/Frontend/Toml.vuna"
let rec v_lookupEntry = (fun (dtb_u_u679 : string B_dData_dList.t_List) (dtb_u_u680 : string) (dtb_u_u681 : t_TomlEntry B_dData_dList.t_List) -> (match dtb_u_u681 with
  | B_dData_dList.C_List__x58__x58_ (dtb_u_u682, dtb_u_u683) -> (match dtb_u_u682 with
  | { f_TomlEntry_tomlEntrySection = dtb_u_u684; f_TomlEntry_tomlEntryKey = dtb_u_u685; f_TomlEntry_tomlEntryValue = dtb_u_u686; f_TomlEntry_tomlEntryLine = dtb_u_u687 } -> (if (if (((v_samePath B_dData_dString.v_Eq_u018fc178ff3df1b4_uString) dtb_u_u679) dtb_u_u684) then (dtb_u_u685 = dtb_u_u680) else false) then (B_dData_dMaybe.C_Maybe_Just (dtb_u_u686)) else (((v_lookupEntry dtb_u_u679) dtb_u_u680) dtb_u_u683))
  | _ -> failwith "DT: impossible branch"
)
  | B_dData_dList.C_List_Nil -> B_dData_dMaybe.C_Maybe_Nothing
  | _ -> failwith "DT: impossible branch"
))

# 1020 "Vuna/Compiler/Frontend/Toml.vuna"
let rec v_lookupEntryLine = (fun (dtb_u_u688 : string B_dData_dList.t_List) (dtb_u_u689 : string) (dtb_u_u690 : t_TomlEntry B_dData_dList.t_List) -> (match dtb_u_u690 with
  | B_dData_dList.C_List__x58__x58_ (dtb_u_u691, dtb_u_u692) -> (match dtb_u_u691 with
  | { f_TomlEntry_tomlEntrySection = dtb_u_u693; f_TomlEntry_tomlEntryKey = dtb_u_u694; f_TomlEntry_tomlEntryValue = dtb_u_u695; f_TomlEntry_tomlEntryLine = dtb_u_u696 } -> (if (if (((v_samePath B_dData_dString.v_Eq_u018fc178ff3df1b4_uString) dtb_u_u688) dtb_u_u693) then (dtb_u_u694 = dtb_u_u689) else false) then (B_dData_dMaybe.C_Maybe_Just (dtb_u_u696)) else (((v_lookupEntryLine dtb_u_u688) dtb_u_u689) dtb_u_u692))
  | _ -> failwith "DT: impossible branch"
)
  | B_dData_dList.C_List_Nil -> B_dData_dMaybe.C_Maybe_Nothing
  | _ -> failwith "DT: impossible branch"
))

# 1043 "Vuna/Compiler/Frontend/Toml.vuna"
let v_childSectionOf = (fun (dtb_u_u697 : string B_dData_dList.t_List) (dtb_u_u698 : string B_dData_dList.t_List) -> (let dtb_u_u699 = ((v_splitAtList (v_lenInt dtb_u_u697)) dtb_u_u698) in (match dtb_u_u699 with
  | B_dData_dMaybe.C_Maybe_Just (dtb_u_u700) -> (match dtb_u_u700 with
  | { B_dData_dPair.f_Pair_first = dtb_u_u701; B_dData_dPair.f_Pair_second = dtb_u_u702 } -> (if (((v_samePath B_dData_dString.v_Eq_u018fc178ff3df1b4_uString) dtb_u_u701) dtb_u_u697) then (let dtb_u_u703 = dtb_u_u702 in (match dtb_u_u703 with
  | B_dData_dList.C_List__x58__x58_ (dtb_u_u704, dtb_u_u705) -> (match dtb_u_u705 with
  | B_dData_dList.C_List_Nil -> (B_dData_dMaybe.C_Maybe_Just (dtb_u_u704))
  | _ -> B_dData_dMaybe.C_Maybe_Nothing
)
  | _ -> B_dData_dMaybe.C_Maybe_Nothing
)) else B_dData_dMaybe.C_Maybe_Nothing)
  | _ -> failwith "DT: impossible branch"
)
  | B_dData_dMaybe.C_Maybe_Nothing -> B_dData_dMaybe.C_Maybe_Nothing
  | _ -> failwith "DT: impossible branch"
)))

# 1029 "Vuna/Compiler/Frontend/Toml.vuna"
let rec v_sectionsUnderGo = (fun (dtb_u_u706 : string B_dData_dList.t_List) (dtb_u_u707 : t_TomlEntry B_dData_dList.t_List) (dtb_u_u708 : string B_dData_dList.t_List) -> (match dtb_u_u707 with
  | B_dData_dList.C_List__x58__x58_ (dtb_u_u709, dtb_u_u710) -> (match dtb_u_u709 with
  | { f_TomlEntry_tomlEntrySection = dtb_u_u711; f_TomlEntry_tomlEntryKey = dtb_u_u712; f_TomlEntry_tomlEntryValue = dtb_u_u713; f_TomlEntry_tomlEntryLine = dtb_u_u714 } -> (let dtb_u_u715 = ((v_childSectionOf dtb_u_u706) dtb_u_u711) in (match dtb_u_u715 with
  | B_dData_dMaybe.C_Maybe_Nothing -> (((v_sectionsUnderGo dtb_u_u706) dtb_u_u710) dtb_u_u708)
  | B_dData_dMaybe.C_Maybe_Just (dtb_u_u716) -> (if ((B_dData_dList.v_memName dtb_u_u716) dtb_u_u708) then (((v_sectionsUnderGo dtb_u_u706) dtb_u_u710) dtb_u_u708) else (((v_sectionsUnderGo dtb_u_u706) dtb_u_u710) (B_dData_dList.C_List__x58__x58_ (dtb_u_u716, dtb_u_u708))))
  | _ -> failwith "DT: impossible branch"
))
  | _ -> failwith "DT: impossible branch"
)
  | B_dData_dList.C_List_Nil -> (B_dData_dList.v_reverse dtb_u_u708)
  | _ -> failwith "DT: impossible branch"
))

# 1026 "Vuna/Compiler/Frontend/Toml.vuna"
let v_sectionsUnder = (fun (dtb_u_u717 : string B_dData_dList.t_List) (dtb_u_u718 : t_TomlEntry B_dData_dList.t_List) -> (((v_sectionsUnderGo dtb_u_u717) dtb_u_u718) B_dData_dList.C_List_Nil))

# 51 "Vuna/Compiler/Frontend/Toml.vuna"
let v_tomlEntrySection = (fun (dtb_u_u719 : t_TomlEntry) -> (match dtb_u_u719 with
  | { f_TomlEntry_tomlEntrySection = dtb_u_u720; f_TomlEntry_tomlEntryKey = dtb_u_u721; f_TomlEntry_tomlEntryValue = dtb_u_u722; f_TomlEntry_tomlEntryLine = dtb_u_u723 } -> dtb_u_u720
  | _ -> failwith "DT: impossible branch"
))

# 52 "Vuna/Compiler/Frontend/Toml.vuna"
let v_tomlEntryKey = (fun (dtb_u_u724 : t_TomlEntry) -> (match dtb_u_u724 with
  | { f_TomlEntry_tomlEntrySection = dtb_u_u725; f_TomlEntry_tomlEntryKey = dtb_u_u726; f_TomlEntry_tomlEntryValue = dtb_u_u727; f_TomlEntry_tomlEntryLine = dtb_u_u728 } -> dtb_u_u726
  | _ -> failwith "DT: impossible branch"
))

# 53 "Vuna/Compiler/Frontend/Toml.vuna"
let v_tomlEntryValue = (fun (dtb_u_u729 : t_TomlEntry) -> (match dtb_u_u729 with
  | { f_TomlEntry_tomlEntrySection = dtb_u_u730; f_TomlEntry_tomlEntryKey = dtb_u_u731; f_TomlEntry_tomlEntryValue = dtb_u_u732; f_TomlEntry_tomlEntryLine = dtb_u_u733 } -> dtb_u_u732
  | _ -> failwith "DT: impossible branch"
))

# 54 "Vuna/Compiler/Frontend/Toml.vuna"
let v_tomlEntryLine = (fun (dtb_u_u734 : t_TomlEntry) -> (match dtb_u_u734 with
  | { f_TomlEntry_tomlEntrySection = dtb_u_u735; f_TomlEntry_tomlEntryKey = dtb_u_u736; f_TomlEntry_tomlEntryValue = dtb_u_u737; f_TomlEntry_tomlEntryLine = dtb_u_u738 } -> dtb_u_u738
  | _ -> failwith "DT: impossible branch"
))

# 58 "Vuna/Compiler/Frontend/Toml.vuna"
let v_cursorChars = (fun (dtb_u_u739 : t_TomlCursor) -> (match dtb_u_u739 with
  | { f_TomlCursor_cursorChars = dtb_u_u740; f_TomlCursor_cursorLine = dtb_u_u741; f_TomlCursor_cursorCol = dtb_u_u742 } -> dtb_u_u740
  | _ -> failwith "DT: impossible branch"
))

# 59 "Vuna/Compiler/Frontend/Toml.vuna"
let v_cursorLine = (fun (dtb_u_u743 : t_TomlCursor) -> (match dtb_u_u743 with
  | { f_TomlCursor_cursorChars = dtb_u_u744; f_TomlCursor_cursorLine = dtb_u_u745; f_TomlCursor_cursorCol = dtb_u_u746 } -> dtb_u_u745
  | _ -> failwith "DT: impossible branch"
))

# 60 "Vuna/Compiler/Frontend/Toml.vuna"
let v_cursorCol = (fun (dtb_u_u747 : t_TomlCursor) -> (match dtb_u_u747 with
  | { f_TomlCursor_cursorChars = dtb_u_u748; f_TomlCursor_cursorLine = dtb_u_u749; f_TomlCursor_cursorCol = dtb_u_u750 } -> dtb_u_u750
  | _ -> failwith "DT: impossible branch"
))
