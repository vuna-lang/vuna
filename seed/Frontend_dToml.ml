open Vuna_runtime
type t_TomlValue = C_TomlValue_TStr of (string) | C_TomlValue_TInt of (int) | C_TomlValue_TBool of (bool) | C_TomlValue_TArray of (t_TomlValue B_dData_dList.t_List) | C_TomlValue_TTable of ((string, t_TomlValue) B_dData_dPair.t_Pair B_dData_dList.t_List) | C_TomlValue_TTableArray of ((string, t_TomlValue) B_dData_dPair.t_Pair B_dData_dList.t_List B_dData_dList.t_List)
and t_TomlEntry = { f_TomlEntry_tomlEntrySection : string B_dData_dList.t_List; f_TomlEntry_tomlEntryKey : string; f_TomlEntry_tomlEntryValue : t_TomlValue; f_TomlEntry_tomlEntryLine : int }
and t_TomlCursor = { f_TomlCursor_cursorChars : int B_dData_dList.t_List; f_TomlCursor_cursorLine : int; f_TomlCursor_cursorCol : int }
and t_TableKind = C_TableKind_KindImplicit | C_TableKind_KindDotted | C_TableKind_KindExplicit
and t_TomlNode = C_TomlNode_NodeLeaf of (t_TomlValue) * (int) | C_TomlNode_NodeTable of ((string, t_TomlNode) B_dData_dPair.t_Pair B_dData_dList.t_List) * (t_TableKind) * (int) | C_TomlNode_NodeTableArray of ((string, t_TomlNode) B_dData_dPair.t_Pair B_dData_dList.t_List B_dData_dList.t_List) * (int)

# 77 "Vuna/Compiler/Frontend/Toml.vuna"
let rec v_lenInt = (fun mc0 -> (match mc0 with
  | B_dData_dList.C_List__x58__x58_ (dtb__0, dtb__1) -> (1 + (v_lenInt dtb__1))
  | B_dData_dList.C_List_Nil -> 0
  | _ -> failwith "DT: impossible branch"
))

# 82 "Vuna/Compiler/Frontend/Toml.vuna"
let v_cursorFuel = (fun (mc0 : t_TomlCursor) -> (match mc0 with
  | { f_TomlCursor_cursorChars = dtb__2; f_TomlCursor_cursorLine = dtb__3; f_TomlCursor_cursorCol = dtb__4 } -> ((2 * (v_lenInt dtb__2)) + 16)
  | _ -> failwith "DT: impossible branch"
))

# 89 "Vuna/Compiler/Frontend/Toml.vuna"
let rec v_countLines = (fun (mc0 : int B_dData_dList.t_List) -> (match mc0 with
  | B_dData_dList.C_List__x58__x58_ (dtb__5, dtb__6) -> (if (dtb__5 = 10) then (1 + (v_countLines dtb__6)) else (v_countLines dtb__6))
  | B_dData_dList.C_List_Nil -> 1
  | _ -> failwith "DT: impossible branch"
))

# 86 "Vuna/Compiler/Frontend/Toml.vuna"
let v_lineFuel = (fun (mc0 : t_TomlCursor) -> (match mc0 with
  | { f_TomlCursor_cursorChars = dtb__7; f_TomlCursor_cursorLine = dtb__8; f_TomlCursor_cursorCol = dtb__9 } -> ((4 * (v_countLines dtb__7)) + 16)
  | _ -> failwith "DT: impossible branch"
))

# 94 "Vuna/Compiler/Frontend/Toml.vuna"
let v_pathFuel = (fun (path : string B_dData_dList.t_List) -> ((2 * (v_lenInt path)) + 4))

# 98 "Vuna/Compiler/Frontend/Toml.vuna"
let v_flattenFuel = (fun (cs : t_TomlCursor) -> ((v_cursorFuel cs) + (v_lineFuel cs)))

# 101 "Vuna/Compiler/Frontend/Toml.vuna"
let v_advanceCursor = (fun (mc0 : t_TomlCursor) -> (match mc0 with
  | { f_TomlCursor_cursorChars = dtb__10; f_TomlCursor_cursorLine = dtb__11; f_TomlCursor_cursorCol = dtb__12 } -> (match dtb__10 with
  | B_dData_dList.C_List__x58__x58_ (dtb__13, dtb__14) -> (if (dtb__13 = 10) then { f_TomlCursor_cursorChars = dtb__14; f_TomlCursor_cursorLine = (dtb__11 + 1); f_TomlCursor_cursorCol = 1 } else { f_TomlCursor_cursorChars = dtb__14; f_TomlCursor_cursorLine = dtb__11; f_TomlCursor_cursorCol = (dtb__12 + 1) })
  | B_dData_dList.C_List_Nil -> { f_TomlCursor_cursorChars = B_dData_dList.C_List_Nil; f_TomlCursor_cursorLine = dtb__11; f_TomlCursor_cursorCol = dtb__12 }
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
))

# 107 "Vuna/Compiler/Frontend/Toml.vuna"
let v_isDigitChar = (fun (c : int) -> (if (c >= 48) then (c <= 57) else false))

# 110 "Vuna/Compiler/Frontend/Toml.vuna"
let v_isUpperAlphaChar = (fun (c : int) -> (if (c >= 65) then (c <= 90) else false))

# 113 "Vuna/Compiler/Frontend/Toml.vuna"
let v_isLowerAlphaChar = (fun (c : int) -> (if (c >= 97) then (c <= 122) else false))

# 116 "Vuna/Compiler/Frontend/Toml.vuna"
let v_isAlphaChar = (fun (c : int) -> (if (v_isUpperAlphaChar c) then true else (v_isLowerAlphaChar c)))

# 119 "Vuna/Compiler/Frontend/Toml.vuna"
let v_isBareKeyChar = (fun (c : int) -> (if (if (if (v_isAlphaChar c) then true else (v_isDigitChar c)) then true else (c = 95)) then true else (c = 45)))

# 122 "Vuna/Compiler/Frontend/Toml.vuna"
let v_isHexDigit = (fun (c : int) -> (if (if (v_isDigitChar c) then true else (if (c >= 65) then (c <= 70) else false)) then true else (if (c >= 97) then (c <= 102) else false)))

# 125 "Vuna/Compiler/Frontend/Toml.vuna"
let v_hexValue = (fun (c : int) -> (if (v_isDigitChar c) then (c - 48) else (if (if (c >= 65) then (c <= 70) else false) then (c - 55) else (c - 87))))

# 128 "Vuna/Compiler/Frontend/Toml.vuna"
let v_isBlankChar = (fun (c : int) -> (if (c = 32) then true else (c = 9)))

# 132 "Vuna/Compiler/Frontend/Toml.vuna"
let rec v_dropChars = (fun (n : int) (xs : int B_dData_dList.t_List) -> (if (n <= 0) then xs else (match xs with
  | B_dData_dList.C_List_Nil -> B_dData_dList.C_List_Nil
  | B_dData_dList.C_List__x58__x58_ (dtb__15, dtb__16) -> ((v_dropChars (n - 1)) dtb__16)
  | _ -> failwith "DT: impossible branch"
)))

# 142 "Vuna/Compiler/Frontend/Toml.vuna"
let rec v_advanceChars = (fun (n : int) (cs : t_TomlCursor) -> (if (n <= 0) then cs else ((v_advanceChars (n - 1)) (v_advanceCursor cs))))

# 146 "Vuna/Compiler/Frontend/Toml.vuna"
let v_startsWithTripleOf = (fun (mc0 : int) (mc1 : int B_dData_dList.t_List) -> (match mc1 with
  | B_dData_dList.C_List__x58__x58_ (dtb__17, dtb__18) -> (match dtb__18 with
  | B_dData_dList.C_List__x58__x58_ (dtb__19, dtb__20) -> (match dtb__20 with
  | B_dData_dList.C_List__x58__x58_ (dtb__21, dtb__22) -> (if (if (dtb__17 = mc0) then (dtb__19 = mc0) else false) then (dtb__21 = mc0) else false)
  | _ -> false
)
  | _ -> false
)
  | _ -> false
))

# 151 "Vuna/Compiler/Frontend/Toml.vuna"
let rec v_stripCR = (fun (mc0 : int B_dData_dList.t_List) -> (match mc0 with
  | B_dData_dList.C_List__x58__x58_ (dtb__23, dtb__24) -> (if (dtb__23 = 13) then (v_stripCR dtb__24) else (B_dData_dList.C_List__x58__x58_ (dtb__23, (v_stripCR dtb__24))))
  | B_dData_dList.C_List_Nil -> B_dData_dList.C_List_Nil
  | _ -> failwith "DT: impossible branch"
))

# 155 "Vuna/Compiler/Frontend/Toml.vuna"
let v_failAt = (fun (path : string) (line : int) (msg : string) -> ((((Base_dDiagnostics_dPkg.v_pkgAt1 path) line) (Base_dDiagnostics_dPkg.C_PkgErr_TomlSyntax (msg))) msg))

# 158 "Vuna/Compiler/Frontend/Toml.vuna"
let v_appendPath = (fun (xs : string B_dData_dList.t_List) (ys : string B_dData_dList.t_List) -> ((B_dData_dList.v_append xs) ys))

# 161 "Vuna/Compiler/Frontend/Toml.vuna"
let rec v_splitLast = (fun (mc0 : string B_dData_dList.t_List) -> (match mc0 with
  | B_dData_dList.C_List__x58__x58_ (dtb__25, dtb__26) -> (match dtb__26 with
  | B_dData_dList.C_List_Nil -> (B_dData_dMaybe.C_Maybe_Just ({ B_dData_dPair.f_Pair_first = B_dData_dList.C_List_Nil; B_dData_dPair.f_Pair_second = dtb__25 }))
  | _ -> (let nd_uscrut4 = (v_splitLast dtb__26) in (match nd_uscrut4 with
  | B_dData_dMaybe.C_Maybe_Just (dtb__27) -> (match dtb__27 with
  | { B_dData_dPair.f_Pair_first = dtb__28; B_dData_dPair.f_Pair_second = dtb__29 } -> (B_dData_dMaybe.C_Maybe_Just ({ B_dData_dPair.f_Pair_first = (B_dData_dList.C_List__x58__x58_ (dtb__25, dtb__28)); B_dData_dPair.f_Pair_second = dtb__29 }))
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
let rec v_lookupField = (fun (mc0 : string) (mc1 : (string, t_TomlNode) B_dData_dPair.t_Pair B_dData_dList.t_List) -> (match mc1 with
  | B_dData_dList.C_List__x58__x58_ (dtb__30, dtb__31) -> (match dtb__30 with
  | { B_dData_dPair.f_Pair_first = dtb__32; B_dData_dPair.f_Pair_second = dtb__33 } -> (if (dtb__32 = mc0) then (B_dData_dMaybe.C_Maybe_Just (dtb__33)) else ((v_lookupField mc0) dtb__31))
  | _ -> failwith "DT: impossible branch"
)
  | B_dData_dList.C_List_Nil -> B_dData_dMaybe.C_Maybe_Nothing
  | _ -> failwith "DT: impossible branch"
))

# 174 "Vuna/Compiler/Frontend/Toml.vuna"
let rec v_replaceField = (fun (mc0 : string) (mc1 : t_TomlNode) (mc2 : (string, t_TomlNode) B_dData_dPair.t_Pair B_dData_dList.t_List) -> (match mc2 with
  | B_dData_dList.C_List__x58__x58_ (dtb__34, dtb__35) -> (match dtb__34 with
  | { B_dData_dPair.f_Pair_first = dtb__36; B_dData_dPair.f_Pair_second = dtb__37 } -> (if (dtb__36 = mc0) then (B_dData_dList.C_List__x58__x58_ ({ B_dData_dPair.f_Pair_first = dtb__36; B_dData_dPair.f_Pair_second = mc1 }, dtb__35)) else (B_dData_dList.C_List__x58__x58_ ({ B_dData_dPair.f_Pair_first = dtb__36; B_dData_dPair.f_Pair_second = dtb__37 }, (((v_replaceField mc0) mc1) dtb__35))))
  | _ -> failwith "DT: impossible branch"
)
  | B_dData_dList.C_List_Nil -> (B_dData_dList.C_List__x58__x58_ ({ B_dData_dPair.f_Pair_first = mc0; B_dData_dPair.f_Pair_second = mc1 }, B_dData_dList.C_List_Nil))
  | _ -> failwith "DT: impossible branch"
))

# 180 "Vuna/Compiler/Frontend/Toml.vuna"
let rec v_lastFields = (fun (mc0 : (string, t_TomlNode) B_dData_dPair.t_Pair B_dData_dList.t_List B_dData_dList.t_List) -> (match mc0 with
  | B_dData_dList.C_List__x58__x58_ (dtb__38, dtb__39) -> (match dtb__39 with
  | B_dData_dList.C_List_Nil -> (B_dData_dMaybe.C_Maybe_Just (dtb__38))
  | _ -> (v_lastFields dtb__39)
)
  | B_dData_dList.C_List_Nil -> B_dData_dMaybe.C_Maybe_Nothing
  | _ -> failwith "DT: impossible branch"
))

# 185 "Vuna/Compiler/Frontend/Toml.vuna"
let rec v_replaceLastFields = (fun (mc0 : (string, t_TomlNode) B_dData_dPair.t_Pair B_dData_dList.t_List) (mc1 : (string, t_TomlNode) B_dData_dPair.t_Pair B_dData_dList.t_List B_dData_dList.t_List) -> (match mc1 with
  | B_dData_dList.C_List__x58__x58_ (dtb__40, dtb__41) -> (match dtb__41 with
  | B_dData_dList.C_List_Nil -> (B_dData_dList.C_List__x58__x58_ (mc0, B_dData_dList.C_List_Nil))
  | _ -> (B_dData_dList.C_List__x58__x58_ (dtb__40, ((v_replaceLastFields mc0) dtb__41)))
)
  | B_dData_dList.C_List_Nil -> (B_dData_dList.C_List__x58__x58_ (mc0, B_dData_dList.C_List_Nil))
  | _ -> failwith "DT: impossible branch"
))

# 190 "Vuna/Compiler/Frontend/Toml.vuna"
let v_kindIsExplicit = (fun (mc0 : t_TableKind) -> (match mc0 with
  | C_TableKind_KindExplicit -> true
  | _ -> false
))

# 194 "Vuna/Compiler/Frontend/Toml.vuna"
let v_kindIsDotted = (fun (mc0 : t_TableKind) -> (match mc0 with
  | C_TableKind_KindDotted -> true
  | _ -> false
))

# 200 "Vuna/Compiler/Frontend/Toml.vuna"
let rec v_ensureTable = (fun (fuel : int) (path : string) (line : int) (pathSegs : string B_dData_dList.t_List) (kind : t_TableKind) (fields : (string, t_TomlNode) B_dData_dPair.t_Pair B_dData_dList.t_List) -> (if (fuel <= 0) then (Base_dDiag.v_icFuel "toml") else (let nd_uscrut6 = pathSegs in (match nd_uscrut6 with
  | B_dData_dList.C_List__x58__x58_ (dtb__42, dtb__43) -> (match dtb__43 with
  | B_dData_dList.C_List_Nil -> (match ((v_lookupField dtb__42) fields) with
  | B_dData_dMaybe.C_Maybe_Nothing -> (Base_dDiag.C_Check_OkC (((B_dData_dList.v_append fields) (B_dData_dList.C_List__x58__x58_ ({ B_dData_dPair.f_Pair_first = dtb__42; B_dData_dPair.f_Pair_second = (C_TomlNode_NodeTable (B_dData_dList.C_List_Nil, kind, line)) }, B_dData_dList.C_List_Nil)))))
  | B_dData_dMaybe.C_Maybe_Just (dtb__44) -> (match dtb__44 with
  | C_TomlNode_NodeTable (dtb__45, dtb__46, dtb__47) -> (if (if (v_kindIsExplicit kind) then (v_kindIsExplicit dtb__46) else false) then (((v_failAt path) line) (String.concat "" ["duplicate table ["; dtb__42; "]"])) else (if (if (v_kindIsExplicit kind) then (v_kindIsDotted dtb__46) else false) then (((v_failAt path) line) (String.concat "" ["table ["; dtb__42; "] was already defined by dotted keys"])) else (Base_dDiag.C_Check_OkC ((((v_replaceField dtb__42) (C_TomlNode_NodeTable (dtb__45, kind, dtb__47))) fields)))))
  | _ -> (((v_failAt path) line) (String.concat "" ["key \""; dtb__42; "\" is not a table"]))
)
  | _ -> failwith "DT: impossible branch"
)
  | _ -> (match ((v_lookupField dtb__42) fields) with
  | B_dData_dMaybe.C_Maybe_Nothing -> (match ((((((v_ensureTable (fuel - 1)) path) line) dtb__43) kind) B_dData_dList.C_List_Nil) with
  | Base_dDiag.C_Check_ErrC (dtb__48) -> (Base_dDiag.C_Check_ErrC (dtb__48))
  | Base_dDiag.C_Check_OkC (dtb__49) -> (Base_dDiag.C_Check_OkC (((B_dData_dList.v_append fields) (B_dData_dList.C_List__x58__x58_ ({ B_dData_dPair.f_Pair_first = dtb__42; B_dData_dPair.f_Pair_second = (C_TomlNode_NodeTable (dtb__49, C_TableKind_KindImplicit, line)) }, B_dData_dList.C_List_Nil)))))
  | _ -> failwith "DT: impossible branch"
)
  | B_dData_dMaybe.C_Maybe_Just (dtb__50) -> (match dtb__50 with
  | C_TomlNode_NodeTable (dtb__51, dtb__52, dtb__53) -> (match ((((((v_ensureTable (fuel - 1)) path) line) dtb__43) kind) dtb__51) with
  | Base_dDiag.C_Check_ErrC (dtb__54) -> (Base_dDiag.C_Check_ErrC (dtb__54))
  | Base_dDiag.C_Check_OkC (dtb__55) -> (Base_dDiag.C_Check_OkC ((((v_replaceField dtb__42) (C_TomlNode_NodeTable (dtb__55, dtb__52, dtb__53))) fields)))
  | _ -> failwith "DT: impossible branch"
)
  | C_TomlNode_NodeTableArray (dtb__56, dtb__57) -> (match (v_lastFields dtb__56) with
  | B_dData_dMaybe.C_Maybe_Just (dtb__58) -> (match ((((((v_ensureTable (fuel - 1)) path) line) dtb__43) kind) dtb__58) with
  | Base_dDiag.C_Check_ErrC (dtb__59) -> (Base_dDiag.C_Check_ErrC (dtb__59))
  | Base_dDiag.C_Check_OkC (dtb__60) -> (Base_dDiag.C_Check_OkC ((((v_replaceField dtb__42) (C_TomlNode_NodeTableArray (((v_replaceLastFields dtb__60) dtb__56), dtb__57))) fields)))
  | _ -> failwith "DT: impossible branch"
)
  | B_dData_dMaybe.C_Maybe_Nothing -> (((v_failAt path) line) (String.concat "" ["table array \""; dtb__42; "\" has no current element"]))
  | _ -> failwith "DT: impossible branch"
)
  | C_TomlNode_NodeLeaf (dtb__61, dtb__62) -> (((v_failAt path) dtb__62) (String.concat "" ["key \""; dtb__42; "\" is not a table"]))
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
)
)
  | B_dData_dList.C_List_Nil -> (((v_failAt path) line) "empty table path")
  | _ -> failwith "DT: impossible branch"
))))

# 236 "Vuna/Compiler/Frontend/Toml.vuna"
let rec v_appendTableArray = (fun (fuel : int) (path : string) (line : int) (pathSegs : string B_dData_dList.t_List) (fields : (string, t_TomlNode) B_dData_dPair.t_Pair B_dData_dList.t_List) -> (if (fuel <= 0) then (Base_dDiag.v_icFuel "toml") else (let nd_uscrut5 = pathSegs in (match nd_uscrut5 with
  | B_dData_dList.C_List__x58__x58_ (dtb__63, dtb__64) -> (match dtb__64 with
  | B_dData_dList.C_List_Nil -> (match ((v_lookupField dtb__63) fields) with
  | B_dData_dMaybe.C_Maybe_Nothing -> (Base_dDiag.C_Check_OkC (((B_dData_dList.v_append fields) (B_dData_dList.C_List__x58__x58_ ({ B_dData_dPair.f_Pair_first = dtb__63; B_dData_dPair.f_Pair_second = (C_TomlNode_NodeTableArray ((B_dData_dList.C_List__x58__x58_ (B_dData_dList.C_List_Nil, B_dData_dList.C_List_Nil)), line)) }, B_dData_dList.C_List_Nil)))))
  | B_dData_dMaybe.C_Maybe_Just (dtb__65) -> (match dtb__65 with
  | C_TomlNode_NodeTableArray (dtb__66, dtb__67) -> (Base_dDiag.C_Check_OkC ((((v_replaceField dtb__63) (C_TomlNode_NodeTableArray (((B_dData_dList.v_append dtb__66) (B_dData_dList.C_List__x58__x58_ (B_dData_dList.C_List_Nil, B_dData_dList.C_List_Nil))), dtb__67))) fields)))
  | C_TomlNode_NodeTable (dtb__68, dtb__69, dtb__70) -> (((v_failAt path) dtb__70) (String.concat "" ["table ["; dtb__63; "] cannot become a table array"]))
  | C_TomlNode_NodeLeaf (dtb__71, dtb__72) -> (((v_failAt path) dtb__72) (String.concat "" ["key \""; dtb__63; "\" is not a table"]))
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
)
  | _ -> (match ((v_lookupField dtb__63) fields) with
  | B_dData_dMaybe.C_Maybe_Nothing -> (match (((((v_appendTableArray (fuel - 1)) path) line) dtb__64) B_dData_dList.C_List_Nil) with
  | Base_dDiag.C_Check_ErrC (dtb__73) -> (Base_dDiag.C_Check_ErrC (dtb__73))
  | Base_dDiag.C_Check_OkC (dtb__74) -> (Base_dDiag.C_Check_OkC (((B_dData_dList.v_append fields) (B_dData_dList.C_List__x58__x58_ ({ B_dData_dPair.f_Pair_first = dtb__63; B_dData_dPair.f_Pair_second = (C_TomlNode_NodeTable (dtb__74, C_TableKind_KindImplicit, line)) }, B_dData_dList.C_List_Nil)))))
  | _ -> failwith "DT: impossible branch"
)
  | B_dData_dMaybe.C_Maybe_Just (dtb__75) -> (match dtb__75 with
  | C_TomlNode_NodeTable (dtb__76, dtb__77, dtb__78) -> (match (((((v_appendTableArray (fuel - 1)) path) line) dtb__64) dtb__76) with
  | Base_dDiag.C_Check_ErrC (dtb__79) -> (Base_dDiag.C_Check_ErrC (dtb__79))
  | Base_dDiag.C_Check_OkC (dtb__80) -> (Base_dDiag.C_Check_OkC ((((v_replaceField dtb__63) (C_TomlNode_NodeTable (dtb__80, dtb__77, dtb__78))) fields)))
  | _ -> failwith "DT: impossible branch"
)
  | C_TomlNode_NodeTableArray (dtb__81, dtb__82) -> (match (v_lastFields dtb__81) with
  | B_dData_dMaybe.C_Maybe_Just (dtb__83) -> (match (((((v_appendTableArray (fuel - 1)) path) line) dtb__64) dtb__83) with
  | Base_dDiag.C_Check_ErrC (dtb__84) -> (Base_dDiag.C_Check_ErrC (dtb__84))
  | Base_dDiag.C_Check_OkC (dtb__85) -> (Base_dDiag.C_Check_OkC ((((v_replaceField dtb__63) (C_TomlNode_NodeTableArray (((v_replaceLastFields dtb__85) dtb__81), dtb__82))) fields)))
  | _ -> failwith "DT: impossible branch"
)
  | B_dData_dMaybe.C_Maybe_Nothing -> (((v_failAt path) line) (String.concat "" ["table array \""; dtb__63; "\" has no current element"]))
  | _ -> failwith "DT: impossible branch"
)
  | C_TomlNode_NodeLeaf (dtb__86, dtb__87) -> (((v_failAt path) dtb__87) (String.concat "" ["key \""; dtb__63; "\" is not a table"]))
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
)
)
  | B_dData_dList.C_List_Nil -> (((v_failAt path) line) "empty table array path")
  | _ -> failwith "DT: impossible branch"
))))

# 273 "Vuna/Compiler/Frontend/Toml.vuna"
let v_sectionOfPath = (fun (pathSegs : string B_dData_dList.t_List) -> (let nd_uscrut1 = (v_splitLast pathSegs) in (match nd_uscrut1 with
  | B_dData_dMaybe.C_Maybe_Nothing -> B_dData_dList.C_List_Nil
  | B_dData_dMaybe.C_Maybe_Just (dtb__88) -> (match dtb__88 with
  | { B_dData_dPair.f_Pair_first = dtb__89; B_dData_dPair.f_Pair_second = dtb__90 } -> dtb__89
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
)))

# 279 "Vuna/Compiler/Frontend/Toml.vuna"
let v_duplicateKeyMsg = (fun (name : string) (section : string B_dData_dList.t_List) -> (if ((v_lenInt section) = 0) then (String.concat "" ["duplicate key \""; name; "\""]) else (String.concat "" ["duplicate key \""; name; "\" in ["; (Base_dSource.v_joinDots section); "]"])))

# 287 "Vuna/Compiler/Frontend/Toml.vuna"
let rec v_insertValue = (fun (fuel : int) (path : string) (line : int) (pathSegs : string B_dData_dList.t_List) (section : string B_dData_dList.t_List) (value : t_TomlValue) (fields : (string, t_TomlNode) B_dData_dPair.t_Pair B_dData_dList.t_List) -> (if (fuel <= 0) then (Base_dDiag.v_icFuel "toml") else (let nd_uscrut7 = pathSegs in (match nd_uscrut7 with
  | B_dData_dList.C_List__x58__x58_ (dtb__91, dtb__92) -> (match dtb__92 with
  | B_dData_dList.C_List_Nil -> (match ((v_lookupField dtb__91) fields) with
  | B_dData_dMaybe.C_Maybe_Nothing -> (Base_dDiag.C_Check_OkC (((B_dData_dList.v_append fields) (B_dData_dList.C_List__x58__x58_ ({ B_dData_dPair.f_Pair_first = dtb__91; B_dData_dPair.f_Pair_second = (C_TomlNode_NodeLeaf (value, line)) }, B_dData_dList.C_List_Nil)))))
  | B_dData_dMaybe.C_Maybe_Just (dtb__93) -> (match dtb__93 with
  | C_TomlNode_NodeLeaf (dtb__94, dtb__95) -> (((v_failAt path) line) ((v_duplicateKeyMsg dtb__91) section))
  | _ -> (((v_failAt path) line) (String.concat "" ["key \""; dtb__91; "\" conflicts with a table"]))
)
  | _ -> failwith "DT: impossible branch"
)
  | _ -> (match ((v_lookupField dtb__91) fields) with
  | B_dData_dMaybe.C_Maybe_Nothing -> (match (((((((v_insertValue (fuel - 1)) path) line) dtb__92) section) value) B_dData_dList.C_List_Nil) with
  | Base_dDiag.C_Check_ErrC (dtb__96) -> (Base_dDiag.C_Check_ErrC (dtb__96))
  | Base_dDiag.C_Check_OkC (dtb__97) -> (Base_dDiag.C_Check_OkC (((B_dData_dList.v_append fields) (B_dData_dList.C_List__x58__x58_ ({ B_dData_dPair.f_Pair_first = dtb__91; B_dData_dPair.f_Pair_second = (C_TomlNode_NodeTable (dtb__97, C_TableKind_KindDotted, line)) }, B_dData_dList.C_List_Nil)))))
  | _ -> failwith "DT: impossible branch"
)
  | B_dData_dMaybe.C_Maybe_Just (dtb__98) -> (match dtb__98 with
  | C_TomlNode_NodeTable (dtb__99, dtb__100, dtb__101) -> (match (((((((v_insertValue (fuel - 1)) path) line) dtb__92) section) value) dtb__99) with
  | Base_dDiag.C_Check_ErrC (dtb__102) -> (Base_dDiag.C_Check_ErrC (dtb__102))
  | Base_dDiag.C_Check_OkC (dtb__103) -> (Base_dDiag.C_Check_OkC ((((v_replaceField dtb__91) (C_TomlNode_NodeTable (dtb__103, dtb__100, dtb__101))) fields)))
  | _ -> failwith "DT: impossible branch"
)
  | C_TomlNode_NodeTableArray (dtb__104, dtb__105) -> (match (v_lastFields dtb__104) with
  | B_dData_dMaybe.C_Maybe_Just (dtb__106) -> (match (((((((v_insertValue (fuel - 1)) path) line) dtb__92) section) value) dtb__106) with
  | Base_dDiag.C_Check_ErrC (dtb__107) -> (Base_dDiag.C_Check_ErrC (dtb__107))
  | Base_dDiag.C_Check_OkC (dtb__108) -> (Base_dDiag.C_Check_OkC ((((v_replaceField dtb__91) (C_TomlNode_NodeTableArray (((v_replaceLastFields dtb__108) dtb__104), dtb__105))) fields)))
  | _ -> failwith "DT: impossible branch"
)
  | B_dData_dMaybe.C_Maybe_Nothing -> (((v_failAt path) line) (String.concat "" ["table array \""; dtb__91; "\" has no current element"]))
  | _ -> failwith "DT: impossible branch"
)
  | C_TomlNode_NodeLeaf (dtb__109, dtb__110) -> (((v_failAt path) dtb__110) (String.concat "" ["key \""; dtb__91; "\" is not a table"]))
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
)
)
  | B_dData_dList.C_List_Nil -> (((v_failAt path) line) "empty key")
  | _ -> failwith "DT: impossible branch"
))))

# 345 "Vuna/Compiler/Frontend/Toml.vuna"
let rec v_flattenLeaf = (fun (mc0 : int) (mc1 : string B_dData_dList.t_List) (mc2 : t_TomlValue) (mc3 : int) -> (match mc2 with
  | C_TomlValue_TTable (dtb__111) -> ((((v_flattenLeafFields (mc0 - 1)) mc1) dtb__111) mc3)
  | _ -> (let nd_uscrut4 = (v_splitLast mc1) in (match nd_uscrut4 with
  | B_dData_dMaybe.C_Maybe_Just (dtb__112) -> (match dtb__112 with
  | { B_dData_dPair.f_Pair_first = dtb__113; B_dData_dPair.f_Pair_second = dtb__114 } -> (B_dData_dList.C_List__x58__x58_ ({ f_TomlEntry_tomlEntrySection = dtb__113; f_TomlEntry_tomlEntryKey = dtb__114; f_TomlEntry_tomlEntryValue = mc2; f_TomlEntry_tomlEntryLine = mc3 }, B_dData_dList.C_List_Nil))
  | _ -> failwith "DT: impossible branch"
)
  | B_dData_dMaybe.C_Maybe_Nothing -> B_dData_dList.C_List_Nil
  | _ -> failwith "DT: impossible branch"
))
))
# 352 "Vuna/Compiler/Frontend/Toml.vuna"
and v_flattenLeafFields = (fun (mc0 : int) (mc1 : string B_dData_dList.t_List) (mc2 : (string, t_TomlValue) B_dData_dPair.t_Pair B_dData_dList.t_List) (mc3 : int) -> (match mc2 with
  | B_dData_dList.C_List__x58__x58_ (dtb__115, dtb__116) -> ((B_dData_dList.v_append ((((v_flattenLeaf (mc0 - 1)) ((v_appendPath mc1) (B_dData_dList.C_List__x58__x58_ ((B_dData_dPair.v_firstOf dtb__115), B_dData_dList.C_List_Nil)))) (B_dData_dPair.v_secondOf dtb__115)) mc3)) ((((v_flattenLeafFields (mc0 - 1)) mc1) dtb__116) mc3))
  | B_dData_dList.C_List_Nil -> B_dData_dList.C_List_Nil
  | _ -> failwith "DT: impossible branch"
))

# 325 "Vuna/Compiler/Frontend/Toml.vuna"
let rec v_flattenFields = (fun (mc0 : int) (mc1 : string B_dData_dList.t_List) (mc2 : (string, t_TomlNode) B_dData_dPair.t_Pair B_dData_dList.t_List) -> (match mc2 with
  | B_dData_dList.C_List__x58__x58_ (dtb__117, dtb__118) -> ((B_dData_dList.v_append (((v_flattenNode (mc0 - 1)) ((v_appendPath mc1) (B_dData_dList.C_List__x58__x58_ ((B_dData_dPair.v_firstOf dtb__117), B_dData_dList.C_List_Nil)))) (B_dData_dPair.v_secondOf dtb__117))) (((v_flattenFields (mc0 - 1)) mc1) dtb__118))
  | B_dData_dList.C_List_Nil -> B_dData_dList.C_List_Nil
  | _ -> failwith "DT: impossible branch"
))
# 332 "Vuna/Compiler/Frontend/Toml.vuna"
and v_flattenNode = (fun (mc0 : int) (mc1 : string B_dData_dList.t_List) (mc2 : t_TomlNode) -> (match mc2 with
  | C_TomlNode_NodeTableArray (dtb__119, dtb__120) -> ((((v_flattenElems (mc0 - 1)) 0) mc1) dtb__119)
  | C_TomlNode_NodeTable (dtb__121, dtb__122, dtb__123) -> (((v_flattenFields (mc0 - 1)) mc1) dtb__121)
  | C_TomlNode_NodeLeaf (dtb__124, dtb__125) -> ((((v_flattenLeaf (mc0 - 1)) mc1) dtb__124) dtb__125)
  | _ -> failwith "DT: impossible branch"
))
# 337 "Vuna/Compiler/Frontend/Toml.vuna"
and v_flattenElems = (fun (mc0 : int) (mc1 : int) (mc2 : string B_dData_dList.t_List) (mc3 : (string, t_TomlNode) B_dData_dPair.t_Pair B_dData_dList.t_List B_dData_dList.t_List) -> (match mc3 with
  | B_dData_dList.C_List__x58__x58_ (dtb__126, dtb__127) -> ((B_dData_dList.v_append (((v_flattenFields (mc0 - 1)) ((v_appendPath mc2) (B_dData_dList.C_List__x58__x58_ ((bi_strFromInt mc1), B_dData_dList.C_List_Nil)))) dtb__126)) ((((v_flattenElems (mc0 - 1)) (mc1 + 1)) mc2) dtb__127))
  | B_dData_dList.C_List_Nil -> B_dData_dList.C_List_Nil
  | _ -> failwith "DT: impossible branch"
))

# 360 "Vuna/Compiler/Frontend/Toml.vuna"
let rec v_nodeValue = (fun (mc0 : int) (mc1 : t_TomlNode) -> (match mc1 with
  | C_TomlNode_NodeTableArray (dtb__128, dtb__129) -> (C_TomlValue_TTableArray (((v_tableFields (mc0 - 1)) dtb__128)))
  | C_TomlNode_NodeTable (dtb__130, dtb__131, dtb__132) -> (C_TomlValue_TTable (((v_fieldValues (mc0 - 1)) dtb__130)))
  | C_TomlNode_NodeLeaf (dtb__133, dtb__134) -> dtb__133
  | _ -> failwith "DT: impossible branch"
))
# 365 "Vuna/Compiler/Frontend/Toml.vuna"
and v_fieldValues = (fun (mc0 : int) (mc1 : (string, t_TomlNode) B_dData_dPair.t_Pair B_dData_dList.t_List) -> (match mc1 with
  | B_dData_dList.C_List__x58__x58_ (dtb__135, dtb__136) -> (B_dData_dList.C_List__x58__x58_ ({ B_dData_dPair.f_Pair_first = (B_dData_dPair.v_firstOf dtb__135); B_dData_dPair.f_Pair_second = ((v_nodeValue (mc0 - 1)) (B_dData_dPair.v_secondOf dtb__135)) }, ((v_fieldValues (mc0 - 1)) dtb__136)))
  | B_dData_dList.C_List_Nil -> B_dData_dList.C_List_Nil
  | _ -> failwith "DT: impossible branch"
))
# 370 "Vuna/Compiler/Frontend/Toml.vuna"
and v_tableFields = (fun (mc0 : int) (mc1 : (string, t_TomlNode) B_dData_dPair.t_Pair B_dData_dList.t_List B_dData_dList.t_List) -> (match mc1 with
  | B_dData_dList.C_List__x58__x58_ (dtb__137, dtb__138) -> (B_dData_dList.C_List__x58__x58_ (((v_fieldValues (mc0 - 1)) dtb__137), ((v_tableFields (mc0 - 1)) dtb__138)))
  | B_dData_dList.C_List_Nil -> B_dData_dList.C_List_Nil
  | _ -> failwith "DT: impossible branch"
))

# 374 "Vuna/Compiler/Frontend/Toml.vuna"
let v_rootValue = (fun (fuel : int) (fields : (string, t_TomlNode) B_dData_dPair.t_Pair B_dData_dList.t_List) -> ((v_fieldValues fuel) fields))

# 379 "Vuna/Compiler/Frontend/Toml.vuna"
let rec v_skipBlank = (fun (mc0 : t_TomlCursor) -> (match mc0 with
  | { f_TomlCursor_cursorChars = dtb__139; f_TomlCursor_cursorLine = dtb__140; f_TomlCursor_cursorCol = dtb__141 } -> (match dtb__139 with
  | B_dData_dList.C_List__x58__x58_ (dtb__142, dtb__143) -> (if (v_isBlankChar dtb__142) then (v_skipBlank { f_TomlCursor_cursorChars = dtb__143; f_TomlCursor_cursorLine = dtb__140; f_TomlCursor_cursorCol = (dtb__141 + 1) }) else { f_TomlCursor_cursorChars = (B_dData_dList.C_List__x58__x58_ (dtb__142, dtb__143)); f_TomlCursor_cursorLine = dtb__140; f_TomlCursor_cursorCol = dtb__141 })
  | B_dData_dList.C_List_Nil -> { f_TomlCursor_cursorChars = B_dData_dList.C_List_Nil; f_TomlCursor_cursorLine = dtb__140; f_TomlCursor_cursorCol = dtb__141 }
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
))

# 388 "Vuna/Compiler/Frontend/Toml.vuna"
let rec v_skipComment = (fun (mc0 : t_TomlCursor) -> (match mc0 with
  | { f_TomlCursor_cursorChars = dtb__144; f_TomlCursor_cursorLine = dtb__145; f_TomlCursor_cursorCol = dtb__146 } -> (match dtb__144 with
  | B_dData_dList.C_List__x58__x58_ (dtb__147, dtb__148) -> (if (dtb__147 = 10) then { f_TomlCursor_cursorChars = (B_dData_dList.C_List__x58__x58_ (dtb__147, dtb__148)); f_TomlCursor_cursorLine = dtb__145; f_TomlCursor_cursorCol = dtb__146 } else (v_skipComment { f_TomlCursor_cursorChars = dtb__148; f_TomlCursor_cursorLine = dtb__145; f_TomlCursor_cursorCol = (dtb__146 + 1) }))
  | B_dData_dList.C_List_Nil -> { f_TomlCursor_cursorChars = B_dData_dList.C_List_Nil; f_TomlCursor_cursorLine = dtb__145; f_TomlCursor_cursorCol = dtb__146 }
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
))

# 397 "Vuna/Compiler/Frontend/Toml.vuna"
let rec v_skipGapGo = (fun (mc0 : bool) (mc1 : t_TomlCursor) -> (match mc1 with
  | { f_TomlCursor_cursorChars = dtb__149; f_TomlCursor_cursorLine = dtb__150; f_TomlCursor_cursorCol = dtb__151 } -> (match dtb__149 with
  | B_dData_dList.C_List__x58__x58_ (dtb__152, dtb__153) -> (if mc0 then (if (dtb__152 = 10) then ((v_skipGapGo false) { f_TomlCursor_cursorChars = dtb__153; f_TomlCursor_cursorLine = (dtb__150 + 1); f_TomlCursor_cursorCol = 1 }) else ((v_skipGapGo true) { f_TomlCursor_cursorChars = dtb__153; f_TomlCursor_cursorLine = dtb__150; f_TomlCursor_cursorCol = (dtb__151 + 1) })) else (if (v_isBlankChar dtb__152) then ((v_skipGapGo false) { f_TomlCursor_cursorChars = dtb__153; f_TomlCursor_cursorLine = dtb__150; f_TomlCursor_cursorCol = (dtb__151 + 1) }) else (if (dtb__152 = 10) then ((v_skipGapGo false) { f_TomlCursor_cursorChars = dtb__153; f_TomlCursor_cursorLine = (dtb__150 + 1); f_TomlCursor_cursorCol = 1 }) else (if (dtb__152 = 35) then ((v_skipGapGo true) { f_TomlCursor_cursorChars = dtb__153; f_TomlCursor_cursorLine = dtb__150; f_TomlCursor_cursorCol = (dtb__151 + 1) }) else { f_TomlCursor_cursorChars = (B_dData_dList.C_List__x58__x58_ (dtb__152, dtb__153)); f_TomlCursor_cursorLine = dtb__150; f_TomlCursor_cursorCol = dtb__151 }))))
  | B_dData_dList.C_List_Nil -> { f_TomlCursor_cursorChars = B_dData_dList.C_List_Nil; f_TomlCursor_cursorLine = dtb__150; f_TomlCursor_cursorCol = dtb__151 }
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
))

# 394 "Vuna/Compiler/Frontend/Toml.vuna"
let v_skipGap = (fun (cs : t_TomlCursor) -> ((v_skipGapGo false) cs))

# 412 "Vuna/Compiler/Frontend/Toml.vuna"
let v_utf8OfCode = (fun (c : int) -> (if (c < 128) then (B_dData_dList.C_List__x58__x58_ (c, B_dData_dList.C_List_Nil)) else (if (c < 2048) then (B_dData_dList.C_List__x58__x58_ ((192 + ((B_dData_dBits.v_shr c) 6)), (B_dData_dList.C_List__x58__x58_ ((128 + ((B_dData_dBits.v_band c) 63)), B_dData_dList.C_List_Nil)))) else (if (c < 65536) then (B_dData_dList.C_List__x58__x58_ ((224 + ((B_dData_dBits.v_shr c) 12)), (B_dData_dList.C_List__x58__x58_ ((128 + ((B_dData_dBits.v_band ((B_dData_dBits.v_shr c) 6)) 63)), (B_dData_dList.C_List__x58__x58_ ((128 + ((B_dData_dBits.v_band c) 63)), B_dData_dList.C_List_Nil)))))) else (B_dData_dList.C_List__x58__x58_ ((240 + ((B_dData_dBits.v_shr c) 18)), (B_dData_dList.C_List__x58__x58_ ((128 + ((B_dData_dBits.v_band ((B_dData_dBits.v_shr c) 12)) 63)), (B_dData_dList.C_List__x58__x58_ ((128 + ((B_dData_dBits.v_band ((B_dData_dBits.v_shr c) 6)) 63)), (B_dData_dList.C_List__x58__x58_ ((128 + ((B_dData_dBits.v_band c) 63)), B_dData_dList.C_List_Nil))))))))))))

# 423 "Vuna/Compiler/Frontend/Toml.vuna"
let v_isSurrogate = (fun (c : int) -> (if (c >= 55296) then (c <= 57343) else false))

# 478 "Vuna/Compiler/Frontend/Toml.vuna"
let rec v_parseHexCode = (fun (fuel : int) (digits : int) (path : string) (cs : t_TomlCursor) (count : int) (acc : int) -> (if (count >= digits) then (Base_dDiag.C_Check_OkC ({ B_dData_dPair.f_Pair_first = acc; B_dData_dPair.f_Pair_second = cs })) else (if (fuel <= 0) then (Base_dDiag.v_icFuel "toml") else (match (cs).f_TomlCursor_cursorChars with
  | B_dData_dList.C_List_Nil -> (((v_failAt path) (cs).f_TomlCursor_cursorLine) "unterminated unicode escape")
  | B_dData_dList.C_List__x58__x58_ (dtb__154, dtb__155) -> (if (v_isHexDigit dtb__154) then ((((((v_parseHexCode (fuel - 1)) digits) path) (v_advanceCursor cs)) (count + 1)) ((acc * 16) + (v_hexValue dtb__154))) else (((v_failAt path) (cs).f_TomlCursor_cursorLine) "invalid hex digit in unicode escape"))
  | _ -> failwith "DT: impossible branch"
))))

# 434 "Vuna/Compiler/Frontend/Toml.vuna"
let rec v_parseBasicChars = (fun (fuel : int) (path : string) (startCs : t_TomlCursor) (cs : t_TomlCursor) (acc : int B_dData_dList.t_List) -> (if (fuel <= 0) then (Base_dDiag.v_icFuel "toml") else (match (cs).f_TomlCursor_cursorChars with
  | B_dData_dList.C_List_Nil -> (((v_failAt path) (startCs).f_TomlCursor_cursorLine) "unterminated basic string")
  | B_dData_dList.C_List__x58__x58_ (dtb__156, dtb__157) -> (if (dtb__156 = 34) then (Base_dDiag.C_Check_OkC ({ B_dData_dPair.f_Pair_first = (B_dData_dList.dtp_pack (B_dData_dList.v_reverse acc)); B_dData_dPair.f_Pair_second = (v_advanceCursor cs) })) else (if (dtb__156 = 10) then (((v_failAt path) (startCs).f_TomlCursor_cursorLine) "unterminated basic string (newline in string)") else (if (dtb__156 = 92) then (((((v_parseBasicEscape (fuel - 1)) path) startCs) (v_advanceCursor cs)) acc) else (((((v_parseBasicChars (fuel - 1)) path) startCs) (v_advanceCursor cs)) (B_dData_dList.C_List__x58__x58_ (dtb__156, acc))))))
  | _ -> failwith "DT: impossible branch"
)))
# 448 "Vuna/Compiler/Frontend/Toml.vuna"
and v_parseBasicEscape = (fun (fuel : int) (path : string) (startCs : t_TomlCursor) (cs : t_TomlCursor) (acc : int B_dData_dList.t_List) -> (if (fuel <= 0) then (Base_dDiag.v_icFuel "toml") else (match (cs).f_TomlCursor_cursorChars with
  | B_dData_dList.C_List_Nil -> (((v_failAt path) (startCs).f_TomlCursor_cursorLine) "unterminated escape sequence")
  | B_dData_dList.C_List__x58__x58_ (dtb__158, dtb__159) -> (if (dtb__158 = 110) then (((((v_parseBasicChars (fuel - 1)) path) startCs) (v_advanceCursor cs)) (B_dData_dList.C_List__x58__x58_ (10, acc))) else (if (dtb__158 = 116) then (((((v_parseBasicChars (fuel - 1)) path) startCs) (v_advanceCursor cs)) (B_dData_dList.C_List__x58__x58_ (9, acc))) else (if (dtb__158 = 114) then (((((v_parseBasicChars (fuel - 1)) path) startCs) (v_advanceCursor cs)) (B_dData_dList.C_List__x58__x58_ (13, acc))) else (if (dtb__158 = 98) then (((((v_parseBasicChars (fuel - 1)) path) startCs) (v_advanceCursor cs)) (B_dData_dList.C_List__x58__x58_ (8, acc))) else (if (dtb__158 = 102) then (((((v_parseBasicChars (fuel - 1)) path) startCs) (v_advanceCursor cs)) (B_dData_dList.C_List__x58__x58_ (12, acc))) else (if (dtb__158 = 34) then (((((v_parseBasicChars (fuel - 1)) path) startCs) (v_advanceCursor cs)) (B_dData_dList.C_List__x58__x58_ (34, acc))) else (if (dtb__158 = 92) then (((((v_parseBasicChars (fuel - 1)) path) startCs) (v_advanceCursor cs)) (B_dData_dList.C_List__x58__x58_ (92, acc))) else (if (dtb__158 = 117) then ((((((v_parseUnicodeEscape (fuel - 1)) 4) path) startCs) (v_advanceCursor cs)) acc) else (if (dtb__158 = 85) then ((((((v_parseUnicodeEscape (fuel - 1)) 8) path) startCs) (v_advanceCursor cs)) acc) else (((v_failAt path) (cs).f_TomlCursor_cursorLine) ("unknown escape sequence \\" ^ (B_dData_dList.dtp_pack (B_dData_dList.C_List__x58__x58_ (dtb__158, B_dData_dList.C_List_Nil))))))))))))))
  | _ -> failwith "DT: impossible branch"
)))
# 468 "Vuna/Compiler/Frontend/Toml.vuna"
and v_parseUnicodeEscape = (fun (fuel : int) (digits : int) (path : string) (startCs : t_TomlCursor) (cs : t_TomlCursor) (acc : int B_dData_dList.t_List) -> (if (fuel <= 0) then (Base_dDiag.v_icFuel "toml") else (let nd_uscrut6 = ((((((v_parseHexCode (v_cursorFuel cs)) digits) path) cs) 0) 0) in (match nd_uscrut6 with
  | Base_dDiag.C_Check_OkC (dtb__160) -> (match dtb__160 with
  | { B_dData_dPair.f_Pair_first = dtb__161; B_dData_dPair.f_Pair_second = dtb__162 } -> (if (dtb__161 > 1114111) then (((v_failAt path) (startCs).f_TomlCursor_cursorLine) "unicode escape out of range") else (if (v_isSurrogate dtb__161) then (((v_failAt path) (startCs).f_TomlCursor_cursorLine) "unicode escape is a surrogate code point") else (((((v_parseBasicChars (fuel - 1)) path) startCs) dtb__162) ((B_dData_dList.v_append (B_dData_dList.v_reverse (v_utf8OfCode dtb__161))) acc))))
  | _ -> failwith "DT: impossible branch"
)
  | Base_dDiag.C_Check_ErrC (dtb__163) -> (Base_dDiag.C_Check_ErrC (dtb__163))
  | _ -> failwith "DT: impossible branch"
))))

# 428 "Vuna/Compiler/Frontend/Toml.vuna"
let v_parseBasicString = (fun (path : string) (cs : t_TomlCursor) -> (match (cs).f_TomlCursor_cursorChars with
  | B_dData_dList.C_List_Nil -> (((v_failAt path) (cs).f_TomlCursor_cursorLine) "unterminated basic string")
  | B_dData_dList.C_List__x58__x58_ (dtb__164, dtb__165) -> (((((v_parseBasicChars (v_cursorFuel (v_advanceCursor cs))) path) cs) (v_advanceCursor cs)) B_dData_dList.C_List_Nil)
  | _ -> failwith "DT: impossible branch"
))

# 496 "Vuna/Compiler/Frontend/Toml.vuna"
let rec v_parseLiteralChars = (fun (fuel : int) (path : string) (startCs : t_TomlCursor) (cs : t_TomlCursor) (acc : int B_dData_dList.t_List) -> (if (fuel <= 0) then (Base_dDiag.v_icFuel "toml") else (match (cs).f_TomlCursor_cursorChars with
  | B_dData_dList.C_List_Nil -> (((v_failAt path) (startCs).f_TomlCursor_cursorLine) "unterminated literal string")
  | B_dData_dList.C_List__x58__x58_ (dtb__166, dtb__167) -> (if (dtb__166 = 39) then (Base_dDiag.C_Check_OkC ({ B_dData_dPair.f_Pair_first = (B_dData_dList.dtp_pack (B_dData_dList.v_reverse acc)); B_dData_dPair.f_Pair_second = (v_advanceCursor cs) })) else (if (dtb__166 = 10) then (((v_failAt path) (startCs).f_TomlCursor_cursorLine) "unterminated literal string (newline in string)") else (((((v_parseLiteralChars (fuel - 1)) path) startCs) (v_advanceCursor cs)) (B_dData_dList.C_List__x58__x58_ (dtb__166, acc)))))
  | _ -> failwith "DT: impossible branch"
)))

# 490 "Vuna/Compiler/Frontend/Toml.vuna"
let v_parseLiteralString = (fun (path : string) (cs : t_TomlCursor) -> (match (cs).f_TomlCursor_cursorChars with
  | B_dData_dList.C_List_Nil -> (((v_failAt path) (cs).f_TomlCursor_cursorLine) "unterminated literal string")
  | B_dData_dList.C_List__x58__x58_ (dtb__168, dtb__169) -> (((((v_parseLiteralChars (v_cursorFuel (v_advanceCursor cs))) path) cs) (v_advanceCursor cs)) B_dData_dList.C_List_Nil)
  | _ -> failwith "DT: impossible branch"
))

# 517 "Vuna/Compiler/Frontend/Toml.vuna"
let v_dropFirstNewline = (fun (mc0 : t_TomlCursor) -> (match mc0 with
  | { f_TomlCursor_cursorChars = dtb__170; f_TomlCursor_cursorLine = dtb__171; f_TomlCursor_cursorCol = dtb__172 } -> (match dtb__170 with
  | B_dData_dList.C_List__x58__x58_ (dtb__173, dtb__174) -> (if (dtb__173 = 10) then { f_TomlCursor_cursorChars = dtb__174; f_TomlCursor_cursorLine = (dtb__171 + 1); f_TomlCursor_cursorCol = 1 } else { f_TomlCursor_cursorChars = (B_dData_dList.C_List__x58__x58_ (dtb__173, dtb__174)); f_TomlCursor_cursorLine = dtb__171; f_TomlCursor_cursorCol = dtb__172 })
  | B_dData_dList.C_List_Nil -> { f_TomlCursor_cursorChars = B_dData_dList.C_List_Nil; f_TomlCursor_cursorLine = dtb__171; f_TomlCursor_cursorCol = dtb__172 }
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
))

# 551 "Vuna/Compiler/Frontend/Toml.vuna"
let rec v_skipContinuation = (fun (mc0 : t_TomlCursor) -> (match mc0 with
  | { f_TomlCursor_cursorChars = dtb__175; f_TomlCursor_cursorLine = dtb__176; f_TomlCursor_cursorCol = dtb__177 } -> (match dtb__175 with
  | B_dData_dList.C_List__x58__x58_ (dtb__178, dtb__179) -> (if (v_isBlankChar dtb__178) then (v_skipContinuation { f_TomlCursor_cursorChars = dtb__179; f_TomlCursor_cursorLine = dtb__176; f_TomlCursor_cursorCol = (dtb__177 + 1) }) else (if (dtb__178 = 10) then (v_skipContinuation { f_TomlCursor_cursorChars = dtb__179; f_TomlCursor_cursorLine = (dtb__176 + 1); f_TomlCursor_cursorCol = 1 }) else { f_TomlCursor_cursorChars = (B_dData_dList.C_List__x58__x58_ (dtb__178, dtb__179)); f_TomlCursor_cursorLine = dtb__176; f_TomlCursor_cursorCol = dtb__177 }))
  | B_dData_dList.C_List_Nil -> { f_TomlCursor_cursorChars = B_dData_dList.C_List_Nil; f_TomlCursor_cursorLine = dtb__176; f_TomlCursor_cursorCol = dtb__177 }
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
))

# 522 "Vuna/Compiler/Frontend/Toml.vuna"
let rec v_parseMultilineBasicChars = (fun (fuel : int) (path : string) (startCs : t_TomlCursor) (cs : t_TomlCursor) (acc : int B_dData_dList.t_List) -> (if (fuel <= 0) then (Base_dDiag.v_icFuel "toml") else (match (cs).f_TomlCursor_cursorChars with
  | B_dData_dList.C_List_Nil -> (((v_failAt path) (startCs).f_TomlCursor_cursorLine) "unterminated multiline string")
  | B_dData_dList.C_List__x58__x58_ (dtb__180, dtb__181) -> (if (dtb__180 = 34) then (if ((v_startsWithTripleOf 34) (cs).f_TomlCursor_cursorChars) then (Base_dDiag.C_Check_OkC ({ B_dData_dPair.f_Pair_first = (B_dData_dList.dtp_pack (B_dData_dList.v_reverse acc)); B_dData_dPair.f_Pair_second = ((v_advanceChars 3) cs) })) else (((((v_parseMultilineBasicChars (fuel - 1)) path) startCs) (v_advanceCursor cs)) (B_dData_dList.C_List__x58__x58_ (34, acc)))) else (if (dtb__180 = 10) then (((((v_parseMultilineBasicChars (fuel - 1)) path) startCs) { f_TomlCursor_cursorChars = dtb__181; f_TomlCursor_cursorLine = ((cs).f_TomlCursor_cursorLine + 1); f_TomlCursor_cursorCol = 1 }) (B_dData_dList.C_List__x58__x58_ (10, acc))) else (if (dtb__180 = 92) then (((((v_parseMultilineEscape (fuel - 1)) path) startCs) (v_advanceCursor cs)) acc) else (((((v_parseMultilineBasicChars (fuel - 1)) path) startCs) (v_advanceCursor cs)) (B_dData_dList.C_List__x58__x58_ (dtb__180, acc))))))
  | _ -> failwith "DT: impossible branch"
)))
# 537 "Vuna/Compiler/Frontend/Toml.vuna"
and v_parseMultilineEscape = (fun (fuel : int) (path : string) (startCs : t_TomlCursor) (cs : t_TomlCursor) (acc : int B_dData_dList.t_List) -> (if (fuel <= 0) then (Base_dDiag.v_icFuel "toml") else (match (cs).f_TomlCursor_cursorChars with
  | B_dData_dList.C_List_Nil -> (((v_failAt path) (startCs).f_TomlCursor_cursorLine) "unterminated escape sequence")
  | B_dData_dList.C_List__x58__x58_ (dtb__182, dtb__183) -> (if (dtb__182 = 10) then (((((v_parseMultilineBasicChars (fuel - 1)) path) startCs) (v_skipContinuation { f_TomlCursor_cursorChars = dtb__183; f_TomlCursor_cursorLine = ((cs).f_TomlCursor_cursorLine + 1); f_TomlCursor_cursorCol = 1 })) acc) else (if (dtb__182 = 32) then (((((v_parseMultilineBasicChars (fuel - 1)) path) startCs) (v_skipContinuation cs)) acc) else (if (dtb__182 = 9) then (((((v_parseMultilineBasicChars (fuel - 1)) path) startCs) (v_skipContinuation cs)) acc) else (((((v_parseBasicEscape (fuel - 1)) path) startCs) cs) acc))))
  | _ -> failwith "DT: impossible branch"
)))

# 511 "Vuna/Compiler/Frontend/Toml.vuna"
let v_parseMultilineBasic = (fun (path : string) (cs : t_TomlCursor) -> (let afterOpen = (v_dropFirstNewline cs) in (((((v_parseMultilineBasicChars (v_cursorFuel afterOpen)) path) cs) afterOpen) B_dData_dList.C_List_Nil)))

# 568 "Vuna/Compiler/Frontend/Toml.vuna"
let rec v_parseMultilineLiteralChars = (fun (fuel : int) (path : string) (startCs : t_TomlCursor) (cs : t_TomlCursor) (acc : int B_dData_dList.t_List) -> (if (fuel <= 0) then (Base_dDiag.v_icFuel "toml") else (match (cs).f_TomlCursor_cursorChars with
  | B_dData_dList.C_List_Nil -> (((v_failAt path) (startCs).f_TomlCursor_cursorLine) "unterminated multiline literal string")
  | B_dData_dList.C_List__x58__x58_ (dtb__184, dtb__185) -> (if (dtb__184 = 39) then (if ((v_startsWithTripleOf 39) (cs).f_TomlCursor_cursorChars) then (Base_dDiag.C_Check_OkC ({ B_dData_dPair.f_Pair_first = (B_dData_dList.dtp_pack (B_dData_dList.v_reverse acc)); B_dData_dPair.f_Pair_second = ((v_advanceChars 3) cs) })) else (((((v_parseMultilineLiteralChars (fuel - 1)) path) startCs) (v_advanceCursor cs)) (B_dData_dList.C_List__x58__x58_ (39, acc)))) else (if (dtb__184 = 10) then (((((v_parseMultilineLiteralChars (fuel - 1)) path) startCs) { f_TomlCursor_cursorChars = dtb__185; f_TomlCursor_cursorLine = ((cs).f_TomlCursor_cursorLine + 1); f_TomlCursor_cursorCol = 1 }) (B_dData_dList.C_List__x58__x58_ (10, acc))) else (((((v_parseMultilineLiteralChars (fuel - 1)) path) startCs) (v_advanceCursor cs)) (B_dData_dList.C_List__x58__x58_ (dtb__184, acc)))))
  | _ -> failwith "DT: impossible branch"
)))

# 562 "Vuna/Compiler/Frontend/Toml.vuna"
let v_parseMultilineLiteral = (fun (path : string) (cs : t_TomlCursor) -> (let afterOpen = (v_dropFirstNewline cs) in (((((v_parseMultilineLiteralChars (v_cursorFuel afterOpen)) path) cs) afterOpen) B_dData_dList.C_List_Nil)))

# 582 "Vuna/Compiler/Frontend/Toml.vuna"
let rec v_collectBareKey = (fun (mc0 : t_TomlCursor) (mc1 : int B_dData_dList.t_List) -> (match mc0 with
  | { f_TomlCursor_cursorChars = dtb__186; f_TomlCursor_cursorLine = dtb__187; f_TomlCursor_cursorCol = dtb__188 } -> (match dtb__186 with
  | B_dData_dList.C_List__x58__x58_ (dtb__189, dtb__190) -> (if (v_isBareKeyChar dtb__189) then ((v_collectBareKey { f_TomlCursor_cursorChars = dtb__190; f_TomlCursor_cursorLine = dtb__187; f_TomlCursor_cursorCol = (dtb__188 + 1) }) (B_dData_dList.C_List__x58__x58_ (dtb__189, mc1))) else { B_dData_dPair.f_Pair_first = (B_dData_dList.dtp_pack (B_dData_dList.v_reverse mc1)); B_dData_dPair.f_Pair_second = { f_TomlCursor_cursorChars = (B_dData_dList.C_List__x58__x58_ (dtb__189, dtb__190)); f_TomlCursor_cursorLine = dtb__187; f_TomlCursor_cursorCol = dtb__188 } })
  | B_dData_dList.C_List_Nil -> { B_dData_dPair.f_Pair_first = (B_dData_dList.dtp_pack (B_dData_dList.v_reverse mc1)); B_dData_dPair.f_Pair_second = { f_TomlCursor_cursorChars = B_dData_dList.C_List_Nil; f_TomlCursor_cursorLine = dtb__187; f_TomlCursor_cursorCol = dtb__188 } }
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
))

# 590 "Vuna/Compiler/Frontend/Toml.vuna"
let v_parseBareKey = (fun (path : string) (cs : t_TomlCursor) -> (match (cs).f_TomlCursor_cursorChars with
  | B_dData_dList.C_List_Nil -> (((v_failAt path) (cs).f_TomlCursor_cursorLine) "expected a key")
  | B_dData_dList.C_List__x58__x58_ (dtb__191, dtb__192) -> (if (v_isBareKeyChar dtb__191) then (Base_dDiag.C_Check_OkC (((v_collectBareKey cs) B_dData_dList.C_List_Nil))) else (((v_failAt path) (cs).f_TomlCursor_cursorLine) "expected a key"))
  | _ -> failwith "DT: impossible branch"
))

# 601 "Vuna/Compiler/Frontend/Toml.vuna"
let v_parseKeySegment = (fun (path : string) (cs : t_TomlCursor) -> (match (cs).f_TomlCursor_cursorChars with
  | B_dData_dList.C_List_Nil -> (((v_failAt path) (cs).f_TomlCursor_cursorLine) "expected a key")
  | B_dData_dList.C_List__x58__x58_ (dtb__193, dtb__194) -> (if (dtb__193 = 34) then (let nd_uscrut5 = ((v_parseBasicString path) cs) in (match nd_uscrut5 with
  | Base_dDiag.C_Check_OkC (dtb__195) -> (match dtb__195 with
  | { B_dData_dPair.f_Pair_first = dtb__196; B_dData_dPair.f_Pair_second = dtb__197 } -> (if (dtb__196 = "") then (((v_failAt path) (cs).f_TomlCursor_cursorLine) "expected a key") else (Base_dDiag.C_Check_OkC ({ B_dData_dPair.f_Pair_first = dtb__196; B_dData_dPair.f_Pair_second = dtb__197 })))
  | _ -> failwith "DT: impossible branch"
)
  | Base_dDiag.C_Check_ErrC (dtb__198) -> (Base_dDiag.C_Check_ErrC (dtb__198))
  | _ -> failwith "DT: impossible branch"
)) else (if (dtb__193 = 39) then (let nd_uscrut5 = ((v_parseLiteralString path) cs) in (match nd_uscrut5 with
  | Base_dDiag.C_Check_OkC (dtb__199) -> (match dtb__199 with
  | { B_dData_dPair.f_Pair_first = dtb__200; B_dData_dPair.f_Pair_second = dtb__201 } -> (if (dtb__200 = "") then (((v_failAt path) (cs).f_TomlCursor_cursorLine) "expected a key") else (Base_dDiag.C_Check_OkC ({ B_dData_dPair.f_Pair_first = dtb__200; B_dData_dPair.f_Pair_second = dtb__201 })))
  | _ -> failwith "DT: impossible branch"
)
  | Base_dDiag.C_Check_ErrC (dtb__202) -> (Base_dDiag.C_Check_ErrC (dtb__202))
  | _ -> failwith "DT: impossible branch"
)) else ((v_parseBareKey path) cs)))
  | _ -> failwith "DT: impossible branch"
))

# 623 "Vuna/Compiler/Frontend/Toml.vuna"
let rec v_parseKeySegments = (fun (fuel : int) (path : string) (cs : t_TomlCursor) (acc : string B_dData_dList.t_List) -> (if (fuel <= 0) then (Base_dDiag.v_icFuel "toml") else (let nd_uscrut4 = ((v_parseKeySegment path) (v_skipBlank cs)) in (match nd_uscrut4 with
  | Base_dDiag.C_Check_OkC (dtb__203) -> (match dtb__203 with
  | { B_dData_dPair.f_Pair_first = dtb__204; B_dData_dPair.f_Pair_second = dtb__205 } -> (match (v_skipBlank dtb__205) with
  | { f_TomlCursor_cursorChars = dtb__206; f_TomlCursor_cursorLine = dtb__207; f_TomlCursor_cursorCol = dtb__208 } -> (match dtb__206 with
  | B_dData_dList.C_List_Nil -> (Base_dDiag.C_Check_OkC ({ B_dData_dPair.f_Pair_first = (B_dData_dList.v_reverse (B_dData_dList.C_List__x58__x58_ (dtb__204, acc))); B_dData_dPair.f_Pair_second = { f_TomlCursor_cursorChars = dtb__206; f_TomlCursor_cursorLine = dtb__207; f_TomlCursor_cursorCol = dtb__208 } }))
  | B_dData_dList.C_List__x58__x58_ (dtb__209, dtb__210) -> (if (dtb__209 = 46) then ((((v_parseKeySegments (fuel - 1)) path) { f_TomlCursor_cursorChars = dtb__210; f_TomlCursor_cursorLine = dtb__207; f_TomlCursor_cursorCol = (dtb__208 + 1) }) (B_dData_dList.C_List__x58__x58_ (dtb__204, acc))) else (Base_dDiag.C_Check_OkC ({ B_dData_dPair.f_Pair_first = (B_dData_dList.v_reverse (B_dData_dList.C_List__x58__x58_ (dtb__204, acc))); B_dData_dPair.f_Pair_second = { f_TomlCursor_cursorChars = dtb__206; f_TomlCursor_cursorLine = dtb__207; f_TomlCursor_cursorCol = dtb__208 } })))
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
)
  | Base_dDiag.C_Check_ErrC (dtb__211) -> (Base_dDiag.C_Check_ErrC (dtb__211))
  | _ -> failwith "DT: impossible branch"
))))

# 620 "Vuna/Compiler/Frontend/Toml.vuna"
let v_parseKeyPath = (fun (path : string) (cs : t_TomlCursor) -> ((((v_parseKeySegments (v_cursorFuel cs)) path) cs) B_dData_dList.C_List_Nil))

# 667 "Vuna/Compiler/Frontend/Toml.vuna"
let v_parseSingleStringValue = (fun (path : string) (cs : t_TomlCursor) -> (match (cs).f_TomlCursor_cursorChars with
  | B_dData_dList.C_List_Nil -> (((v_failAt path) (cs).f_TomlCursor_cursorLine) "expected a string")
  | B_dData_dList.C_List__x58__x58_ (dtb__212, dtb__213) -> (if (dtb__212 = 34) then (let nd_uscrut5 = ((v_parseBasicString path) cs) in (match nd_uscrut5 with
  | Base_dDiag.C_Check_OkC (dtb__214) -> (match dtb__214 with
  | { B_dData_dPair.f_Pair_first = dtb__215; B_dData_dPair.f_Pair_second = dtb__216 } -> (Base_dDiag.C_Check_OkC ({ B_dData_dPair.f_Pair_first = (C_TomlValue_TStr (dtb__215)); B_dData_dPair.f_Pair_second = dtb__216 }))
  | _ -> failwith "DT: impossible branch"
)
  | Base_dDiag.C_Check_ErrC (dtb__217) -> (Base_dDiag.C_Check_ErrC (dtb__217))
  | _ -> failwith "DT: impossible branch"
)) else (let nd_uscrut5 = ((v_parseLiteralString path) cs) in (match nd_uscrut5 with
  | Base_dDiag.C_Check_OkC (dtb__218) -> (match dtb__218 with
  | { B_dData_dPair.f_Pair_first = dtb__219; B_dData_dPair.f_Pair_second = dtb__220 } -> (Base_dDiag.C_Check_OkC ({ B_dData_dPair.f_Pair_first = (C_TomlValue_TStr (dtb__219)); B_dData_dPair.f_Pair_second = dtb__220 }))
  | _ -> failwith "DT: impossible branch"
)
  | Base_dDiag.C_Check_ErrC (dtb__221) -> (Base_dDiag.C_Check_ErrC (dtb__221))
  | _ -> failwith "DT: impossible branch"
)))
  | _ -> failwith "DT: impossible branch"
))

# 682 "Vuna/Compiler/Frontend/Toml.vuna"
let v_parseMultilineValue = (fun (basic : bool) (path : string) (cs : t_TomlCursor) -> (let after = ((v_advanceChars 3) cs) in (if basic then (let nd_uscrut4 = ((v_parseMultilineBasic path) after) in (match nd_uscrut4 with
  | Base_dDiag.C_Check_OkC (dtb__222) -> (match dtb__222 with
  | { B_dData_dPair.f_Pair_first = dtb__223; B_dData_dPair.f_Pair_second = dtb__224 } -> (Base_dDiag.C_Check_OkC ({ B_dData_dPair.f_Pair_first = (C_TomlValue_TStr (dtb__223)); B_dData_dPair.f_Pair_second = dtb__224 }))
  | _ -> failwith "DT: impossible branch"
)
  | Base_dDiag.C_Check_ErrC (dtb__225) -> (Base_dDiag.C_Check_ErrC (dtb__225))
  | _ -> failwith "DT: impossible branch"
)) else (let nd_uscrut4 = ((v_parseMultilineLiteral path) after) in (match nd_uscrut4 with
  | Base_dDiag.C_Check_OkC (dtb__226) -> (match dtb__226 with
  | { B_dData_dPair.f_Pair_first = dtb__227; B_dData_dPair.f_Pair_second = dtb__228 } -> (Base_dDiag.C_Check_OkC ({ B_dData_dPair.f_Pair_first = (C_TomlValue_TStr (dtb__227)); B_dData_dPair.f_Pair_second = dtb__228 }))
  | _ -> failwith "DT: impossible branch"
)
  | Base_dDiag.C_Check_ErrC (dtb__229) -> (Base_dDiag.C_Check_ErrC (dtb__229))
  | _ -> failwith "DT: impossible branch"
)))))

# 814 "Vuna/Compiler/Frontend/Toml.vuna"
let v_makeInteger = (fun (mc0 : int) (mc1 : bool) -> (if mc1 then (0 - mc0) else mc0))

# 805 "Vuna/Compiler/Frontend/Toml.vuna"
let v_finishInteger = (fun (path : string) (startCs : t_TomlCursor) (cs : t_TomlCursor) (count : int) (acc : int) (negative : bool) -> (if (count = 0) then (((v_failAt path) (startCs).f_TomlCursor_cursorLine) "expected digits for integer") else (match (cs).f_TomlCursor_cursorChars with
  | B_dData_dList.C_List_Nil -> (Base_dDiag.C_Check_OkC ({ B_dData_dPair.f_Pair_first = ((v_makeInteger acc) negative); B_dData_dPair.f_Pair_second = cs }))
  | B_dData_dList.C_List__x58__x58_ (dtb__230, dtb__231) -> (if (dtb__230 = 46) then (((v_failAt path) (startCs).f_TomlCursor_cursorLine) "floating point numbers are not supported") else (if (v_isBareKeyChar dtb__230) then (((v_failAt path) (startCs).f_TomlCursor_cursorLine) "invalid integer literal") else (Base_dDiag.C_Check_OkC ({ B_dData_dPair.f_Pair_first = ((v_makeInteger acc) negative); B_dData_dPair.f_Pair_second = cs }))))
  | _ -> failwith "DT: impossible branch"
)))

# 790 "Vuna/Compiler/Frontend/Toml.vuna"
let rec v_parseIntegerDigits = (fun (fuel : int) (path : string) (startCs : t_TomlCursor) (cs : t_TomlCursor) (count : int) (acc : int) (negative : bool) -> (if (fuel <= 0) then (Base_dDiag.v_icFuel "toml") else (match (cs).f_TomlCursor_cursorChars with
  | B_dData_dList.C_List_Nil -> ((((((v_finishInteger path) startCs) cs) count) acc) negative)
  | B_dData_dList.C_List__x58__x58_ (dtb__232, dtb__233) -> (if (v_isDigitChar dtb__232) then (let d = (dtb__232 - 48) in (if (acc > (if 10 = 0 then failwith "division by zero" else (Frontend_dLexer.v_maxIntLiteral - d) / 10)) then (((v_failAt path) (startCs).f_TomlCursor_cursorLine) "integer literal is out of range (max is 4611686018427387903)") else (((((((v_parseIntegerDigits (fuel - 1)) path) startCs) (v_advanceCursor cs)) (count + 1)) ((acc * 10) + d)) negative))) else ((((((v_finishInteger path) startCs) cs) count) acc) negative))
  | _ -> failwith "DT: impossible branch"
)))

# 778 "Vuna/Compiler/Frontend/Toml.vuna"
let v_parseInteger = (fun (path : string) (cs : t_TomlCursor) -> (match (cs).f_TomlCursor_cursorChars with
  | B_dData_dList.C_List_Nil -> (((v_failAt path) (cs).f_TomlCursor_cursorLine) "expected an integer")
  | B_dData_dList.C_List__x58__x58_ (dtb__234, dtb__235) -> (if (dtb__234 = 45) then (((((((v_parseIntegerDigits (v_cursorFuel cs)) path) cs) (v_advanceCursor cs)) 0) 0) true) else (if (v_isDigitChar dtb__234) then (((((((v_parseIntegerDigits (v_cursorFuel cs)) path) cs) cs) 0) 0) false) else (((v_failAt path) (cs).f_TomlCursor_cursorLine) "expected an integer")))
  | _ -> failwith "DT: impossible branch"
))

# 818 "Vuna/Compiler/Frontend/Toml.vuna"
let v_parseIntValue = (fun (path : string) (cs : t_TomlCursor) -> (let nd_uscrut2 = ((v_parseInteger path) cs) in (match nd_uscrut2 with
  | Base_dDiag.C_Check_OkC (dtb__236) -> (match dtb__236 with
  | { B_dData_dPair.f_Pair_first = dtb__237; B_dData_dPair.f_Pair_second = dtb__238 } -> (Base_dDiag.C_Check_OkC ({ B_dData_dPair.f_Pair_first = (C_TomlValue_TInt (dtb__237)); B_dData_dPair.f_Pair_second = dtb__238 }))
  | _ -> failwith "DT: impossible branch"
)
  | Base_dDiag.C_Check_ErrC (dtb__239) -> (Base_dDiag.C_Check_ErrC (dtb__239))
  | _ -> failwith "DT: impossible branch"
)))

# 825 "Vuna/Compiler/Frontend/Toml.vuna"
let rec v_matchChars = (fun (mc0 : int B_dData_dList.t_List) (mc1 : t_TomlCursor) -> (match mc0 with
  | B_dData_dList.C_List__x58__x58_ (dtb__240, dtb__241) -> (match mc1 with
  | { f_TomlCursor_cursorChars = dtb__242; f_TomlCursor_cursorLine = dtb__243; f_TomlCursor_cursorCol = dtb__244 } -> (match dtb__242 with
  | B_dData_dList.C_List__x58__x58_ (dtb__245, dtb__246) -> (if (dtb__245 = dtb__240) then ((v_matchChars dtb__241) { f_TomlCursor_cursorChars = dtb__246; f_TomlCursor_cursorLine = dtb__243; f_TomlCursor_cursorCol = (dtb__244 + 1) }) else B_dData_dMaybe.C_Maybe_Nothing)
  | B_dData_dList.C_List_Nil -> B_dData_dMaybe.C_Maybe_Nothing
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
)
  | B_dData_dList.C_List_Nil -> (B_dData_dMaybe.C_Maybe_Just (mc1))
  | _ -> failwith "DT: impossible branch"
))

# 831 "Vuna/Compiler/Frontend/Toml.vuna"
let v_matchWord = (fun (word : string) (cs : t_TomlCursor) -> (match ((v_matchChars (B_dData_dList.dtp_unpack word)) cs) with
  | B_dData_dMaybe.C_Maybe_Nothing -> B_dData_dMaybe.C_Maybe_Nothing
  | B_dData_dMaybe.C_Maybe_Just (dtb__247) -> (match (dtb__247).f_TomlCursor_cursorChars with
  | B_dData_dList.C_List_Nil -> (B_dData_dMaybe.C_Maybe_Just (dtb__247))
  | B_dData_dList.C_List__x58__x58_ (dtb__248, dtb__249) -> (if (v_isBareKeyChar dtb__248) then B_dData_dMaybe.C_Maybe_Nothing else (B_dData_dMaybe.C_Maybe_Just (dtb__247)))
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
))

# 638 "Vuna/Compiler/Frontend/Toml.vuna"
let rec v_parseValue = (fun (fuel : int) (path : string) (cs : t_TomlCursor) -> (if (fuel <= 0) then (Base_dDiag.v_icFuel "toml") else (match (cs).f_TomlCursor_cursorChars with
  | B_dData_dList.C_List_Nil -> (((v_failAt path) (cs).f_TomlCursor_cursorLine) "expected a value")
  | B_dData_dList.C_List__x58__x58_ (dtb__250, dtb__251) -> (if (dtb__250 = 34) then (if ((v_startsWithTripleOf 34) (cs).f_TomlCursor_cursorChars) then (((v_parseMultilineValue true) path) cs) else ((v_parseSingleStringValue path) cs)) else (if (dtb__250 = 39) then (if ((v_startsWithTripleOf 39) (cs).f_TomlCursor_cursorChars) then (((v_parseMultilineValue false) path) cs) else ((v_parseSingleStringValue path) cs)) else (if (dtb__250 = 91) then (((v_parseArrayValue (fuel - 1)) path) cs) else (if (dtb__250 = 123) then (((v_parseInlineTable (fuel - 1)) path) cs) else (if (dtb__250 = 45) then ((v_parseIntValue path) cs) else (if (v_isDigitChar dtb__250) then ((v_parseIntValue path) cs) else (match ((v_matchWord "true") cs) with
  | B_dData_dMaybe.C_Maybe_Just (dtb__252) -> (Base_dDiag.C_Check_OkC ({ B_dData_dPair.f_Pair_first = (C_TomlValue_TBool (true)); B_dData_dPair.f_Pair_second = dtb__252 }))
  | B_dData_dMaybe.C_Maybe_Nothing -> (match ((v_matchWord "false") cs) with
  | B_dData_dMaybe.C_Maybe_Just (dtb__253) -> (Base_dDiag.C_Check_OkC ({ B_dData_dPair.f_Pair_first = (C_TomlValue_TBool (false)); B_dData_dPair.f_Pair_second = dtb__253 }))
  | B_dData_dMaybe.C_Maybe_Nothing -> (((v_failAt path) (cs).f_TomlCursor_cursorLine) "expected a value")
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
)))))))
  | _ -> failwith "DT: impossible branch"
)))
# 696 "Vuna/Compiler/Frontend/Toml.vuna"
and v_parseArrayValue = (fun (fuel : int) (path : string) (cs : t_TomlCursor) -> (if (fuel <= 0) then (Base_dDiag.v_icFuel "toml") else (match (cs).f_TomlCursor_cursorChars with
  | B_dData_dList.C_List_Nil -> (((v_failAt path) (cs).f_TomlCursor_cursorLine) "unterminated array")
  | B_dData_dList.C_List__x58__x58_ (dtb__254, dtb__255) -> ((((v_parseArrayItems (v_cursorFuel (v_advanceCursor cs))) path) (v_advanceCursor cs)) B_dData_dList.C_List_Nil)
  | _ -> failwith "DT: impossible branch"
)))
# 705 "Vuna/Compiler/Frontend/Toml.vuna"
and v_parseArrayItems = (fun (fuel : int) (path : string) (cs : t_TomlCursor) (acc : t_TomlValue B_dData_dList.t_List) -> (if (fuel <= 0) then (Base_dDiag.v_icFuel "toml") else (match (v_skipGap cs) with
  | { f_TomlCursor_cursorChars = dtb__256; f_TomlCursor_cursorLine = dtb__257; f_TomlCursor_cursorCol = dtb__258 } -> (match dtb__256 with
  | B_dData_dList.C_List_Nil -> (((v_failAt path) dtb__257) "unterminated array")
  | B_dData_dList.C_List__x58__x58_ (dtb__259, dtb__260) -> (if (dtb__259 = 93) then (Base_dDiag.C_Check_OkC ({ B_dData_dPair.f_Pair_first = (C_TomlValue_TArray ((B_dData_dList.v_reverse acc))); B_dData_dPair.f_Pair_second = (v_advanceCursor { f_TomlCursor_cursorChars = dtb__256; f_TomlCursor_cursorLine = dtb__257; f_TomlCursor_cursorCol = dtb__258 }) })) else (let nd_uscrut10 = (((v_parseValue (fuel - 1)) path) { f_TomlCursor_cursorChars = dtb__256; f_TomlCursor_cursorLine = dtb__257; f_TomlCursor_cursorCol = dtb__258 }) in (match nd_uscrut10 with
  | Base_dDiag.C_Check_OkC (dtb__261) -> (match dtb__261 with
  | { B_dData_dPair.f_Pair_first = dtb__262; B_dData_dPair.f_Pair_second = dtb__263 } -> (match (v_skipGap dtb__263) with
  | { f_TomlCursor_cursorChars = dtb__264; f_TomlCursor_cursorLine = dtb__265; f_TomlCursor_cursorCol = dtb__266 } -> (let nd_uscrut20 = dtb__264 in (match nd_uscrut20 with
  | B_dData_dList.C_List__x58__x58_ (dtb__267, dtb__268) -> (if (dtb__267 = 44) then ((((v_parseArrayItems (fuel - 1)) path) (v_advanceCursor { f_TomlCursor_cursorChars = dtb__264; f_TomlCursor_cursorLine = dtb__265; f_TomlCursor_cursorCol = dtb__266 })) (B_dData_dList.C_List__x58__x58_ (dtb__262, acc))) else (if (dtb__267 = 93) then (Base_dDiag.C_Check_OkC ({ B_dData_dPair.f_Pair_first = (C_TomlValue_TArray ((B_dData_dList.v_reverse (B_dData_dList.C_List__x58__x58_ (dtb__262, acc))))); B_dData_dPair.f_Pair_second = (v_advanceCursor { f_TomlCursor_cursorChars = dtb__264; f_TomlCursor_cursorLine = dtb__265; f_TomlCursor_cursorCol = dtb__266 }) })) else (((v_failAt path) dtb__265) "expected ',' or ']' in array")))
  | B_dData_dList.C_List_Nil -> (((v_failAt path) dtb__265) "unterminated array")
  | _ -> failwith "DT: impossible branch"
))
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
)
  | Base_dDiag.C_Check_ErrC (dtb__269) -> (Base_dDiag.C_Check_ErrC (dtb__269))
  | _ -> failwith "DT: impossible branch"
)))
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
)))
# 730 "Vuna/Compiler/Frontend/Toml.vuna"
and v_parseInlineTable = (fun (fuel : int) (path : string) (cs : t_TomlCursor) -> (if (fuel <= 0) then (Base_dDiag.v_icFuel "toml") else (match (cs).f_TomlCursor_cursorChars with
  | B_dData_dList.C_List_Nil -> (((v_failAt path) (cs).f_TomlCursor_cursorLine) "unterminated inline table")
  | B_dData_dList.C_List__x58__x58_ (dtb__270, dtb__271) -> ((((v_parseInlineFields (v_cursorFuel (v_advanceCursor cs))) path) (v_advanceCursor cs)) B_dData_dList.C_List_Nil)
  | _ -> failwith "DT: impossible branch"
)))
# 739 "Vuna/Compiler/Frontend/Toml.vuna"
and v_parseInlineFields = (fun (fuel : int) (path : string) (cs : t_TomlCursor) (fields : (string, t_TomlNode) B_dData_dPair.t_Pair B_dData_dList.t_List) -> (if (fuel <= 0) then (Base_dDiag.v_icFuel "toml") else (match (v_skipBlank cs) with
  | { f_TomlCursor_cursorChars = dtb__272; f_TomlCursor_cursorLine = dtb__273; f_TomlCursor_cursorCol = dtb__274 } -> (match dtb__272 with
  | B_dData_dList.C_List_Nil -> (((v_failAt path) dtb__273) "unterminated inline table")
  | B_dData_dList.C_List__x58__x58_ (dtb__275, dtb__276) -> (if (dtb__275 = 125) then (Base_dDiag.C_Check_OkC ({ B_dData_dPair.f_Pair_first = (C_TomlValue_TTable (((v_rootValue fuel) fields))); B_dData_dPair.f_Pair_second = (v_advanceCursor { f_TomlCursor_cursorChars = dtb__272; f_TomlCursor_cursorLine = dtb__273; f_TomlCursor_cursorCol = dtb__274 }) })) else (let nd_uscrut10 = ((v_parseKeyPath path) { f_TomlCursor_cursorChars = dtb__272; f_TomlCursor_cursorLine = dtb__273; f_TomlCursor_cursorCol = dtb__274 }) in (match nd_uscrut10 with
  | Base_dDiag.C_Check_OkC (dtb__277) -> (match dtb__277 with
  | { B_dData_dPair.f_Pair_first = dtb__278; B_dData_dPair.f_Pair_second = dtb__279 } -> (match (v_skipBlank dtb__279) with
  | { f_TomlCursor_cursorChars = dtb__280; f_TomlCursor_cursorLine = dtb__281; f_TomlCursor_cursorCol = dtb__282 } -> (match dtb__280 with
  | B_dData_dList.C_List_Nil -> (((v_failAt path) dtb__281) "expected '=' in inline table")
  | B_dData_dList.C_List__x58__x58_ (dtb__283, dtb__284) -> (if (dtb__283 = 61) then (let nd_uscrut23 = (((v_parseValue (fuel - 1)) path) (v_skipBlank { f_TomlCursor_cursorChars = dtb__284; f_TomlCursor_cursorLine = dtb__281; f_TomlCursor_cursorCol = (dtb__282 + 1) })) in (match nd_uscrut23 with
  | Base_dDiag.C_Check_OkC (dtb__285) -> (match dtb__285 with
  | { B_dData_dPair.f_Pair_first = dtb__286; B_dData_dPair.f_Pair_second = dtb__287 } -> (match (((((((v_insertValue (v_pathFuel dtb__278)) path) dtb__281) dtb__278) (v_sectionOfPath dtb__278)) dtb__286) fields) with
  | Base_dDiag.C_Check_ErrC (dtb__288) -> (Base_dDiag.C_Check_ErrC (dtb__288))
  | Base_dDiag.C_Check_OkC (dtb__289) -> (match (v_skipBlank dtb__287) with
  | { f_TomlCursor_cursorChars = dtb__290; f_TomlCursor_cursorLine = dtb__291; f_TomlCursor_cursorCol = dtb__292 } -> (let nd_uscrut35 = dtb__290 in (match nd_uscrut35 with
  | B_dData_dList.C_List__x58__x58_ (dtb__293, dtb__294) -> (if (dtb__293 = 44) then ((((v_parseInlineFields (fuel - 1)) path) { f_TomlCursor_cursorChars = dtb__294; f_TomlCursor_cursorLine = dtb__291; f_TomlCursor_cursorCol = (dtb__292 + 1) }) dtb__289) else (if (dtb__293 = 125) then (Base_dDiag.C_Check_OkC ({ B_dData_dPair.f_Pair_first = (C_TomlValue_TTable (((v_rootValue fuel) dtb__289))); B_dData_dPair.f_Pair_second = (v_advanceCursor { f_TomlCursor_cursorChars = dtb__290; f_TomlCursor_cursorLine = dtb__291; f_TomlCursor_cursorCol = dtb__292 }) })) else (((v_failAt path) dtb__291) "expected ',' or '}' in inline table")))
  | B_dData_dList.C_List_Nil -> (((v_failAt path) dtb__291) "unterminated inline table")
  | _ -> failwith "DT: impossible branch"
))
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
)
  | Base_dDiag.C_Check_ErrC (dtb__295) -> (Base_dDiag.C_Check_ErrC (dtb__295))
  | _ -> failwith "DT: impossible branch"
)) else (((v_failAt path) dtb__281) "expected '=' in inline table"))
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
)
  | Base_dDiag.C_Check_ErrC (dtb__296) -> (Base_dDiag.C_Check_ErrC (dtb__296))
  | _ -> failwith "DT: impossible branch"
)))
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
)))

# 853 "Vuna/Compiler/Frontend/Toml.vuna"
let v_expectEolAfterComment = (fun (path : string) (cs : t_TomlCursor) -> (match (v_skipComment cs) with
  | { f_TomlCursor_cursorChars = dtb__297; f_TomlCursor_cursorLine = dtb__298; f_TomlCursor_cursorCol = dtb__299 } -> (match dtb__297 with
  | B_dData_dList.C_List_Nil -> (Base_dDiag.C_Check_OkC ({ f_TomlCursor_cursorChars = dtb__297; f_TomlCursor_cursorLine = dtb__298; f_TomlCursor_cursorCol = dtb__299 }))
  | B_dData_dList.C_List__x58__x58_ (dtb__300, dtb__301) -> (if (dtb__300 = 10) then (Base_dDiag.C_Check_OkC ({ f_TomlCursor_cursorChars = dtb__301; f_TomlCursor_cursorLine = (dtb__298 + 1); f_TomlCursor_cursorCol = 1 })) else (((v_failAt path) dtb__298) "unexpected character after comment"))
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
))

# 841 "Vuna/Compiler/Frontend/Toml.vuna"
let v_expectEol = (fun (path : string) (cs : t_TomlCursor) -> (match (v_skipBlank cs) with
  | { f_TomlCursor_cursorChars = dtb__302; f_TomlCursor_cursorLine = dtb__303; f_TomlCursor_cursorCol = dtb__304 } -> (match dtb__302 with
  | B_dData_dList.C_List_Nil -> (Base_dDiag.C_Check_OkC ({ f_TomlCursor_cursorChars = dtb__302; f_TomlCursor_cursorLine = dtb__303; f_TomlCursor_cursorCol = dtb__304 }))
  | B_dData_dList.C_List__x58__x58_ (dtb__305, dtb__306) -> (if (dtb__305 = 10) then (Base_dDiag.C_Check_OkC ({ f_TomlCursor_cursorChars = dtb__306; f_TomlCursor_cursorLine = (dtb__303 + 1); f_TomlCursor_cursorCol = 1 })) else (if (dtb__305 = 35) then ((v_expectEolAfterComment path) { f_TomlCursor_cursorChars = dtb__302; f_TomlCursor_cursorLine = dtb__303; f_TomlCursor_cursorCol = dtb__304 }) else (((v_failAt path) (cs).f_TomlCursor_cursorLine) "unexpected character at end of line")))
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
))

# 866 "Vuna/Compiler/Frontend/Toml.vuna"
let rec v_parseSectionLine = (fun (fuel : int) (path : string) (cs : t_TomlCursor) (currentPath : string B_dData_dList.t_List) (fields : (string, t_TomlNode) B_dData_dPair.t_Pair B_dData_dList.t_List) -> (if (fuel <= 0) then (Base_dDiag.v_icFuel "toml") else (let nd_uscrut5 = ((v_parseKeyPath path) (v_advanceCursor cs)) in (match nd_uscrut5 with
  | Base_dDiag.C_Check_OkC (dtb__307) -> (match dtb__307 with
  | { B_dData_dPair.f_Pair_first = dtb__308; B_dData_dPair.f_Pair_second = dtb__309 } -> (match (v_skipBlank dtb__309) with
  | { f_TomlCursor_cursorChars = dtb__310; f_TomlCursor_cursorLine = dtb__311; f_TomlCursor_cursorCol = dtb__312 } -> (match dtb__310 with
  | B_dData_dList.C_List_Nil -> (((v_failAt path) dtb__311) "unterminated section header")
  | B_dData_dList.C_List__x58__x58_ (dtb__313, dtb__314) -> (if (dtb__313 = 93) then (((((((v_afterSingleBracket (fuel - 1)) path) dtb__311) dtb__312) dtb__314) dtb__308) fields) else (((v_failAt path) dtb__311) "expected '.' or ']' in section header"))
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
)
  | Base_dDiag.C_Check_ErrC (dtb__315) -> (Base_dDiag.C_Check_ErrC (dtb__315))
  | _ -> failwith "DT: impossible branch"
))))
# 880 "Vuna/Compiler/Frontend/Toml.vuna"
and v_afterSingleBracket = (fun (fuel : int) (path : string) (line : int) (col : int) (rest : int B_dData_dList.t_List) (newSection : string B_dData_dList.t_List) (fields : (string, t_TomlNode) B_dData_dPair.t_Pair B_dData_dList.t_List) -> (if (fuel <= 0) then (Base_dDiag.v_icFuel "toml") else (match ((v_expectEol path) { f_TomlCursor_cursorChars = rest; f_TomlCursor_cursorLine = line; f_TomlCursor_cursorCol = (col + 1) }) with
  | Base_dDiag.C_Check_ErrC (dtb__316) -> (Base_dDiag.C_Check_ErrC (dtb__316))
  | Base_dDiag.C_Check_OkC (dtb__317) -> (match ((((((v_ensureTable (v_pathFuel newSection)) path) line) newSection) C_TableKind_KindExplicit) fields) with
  | Base_dDiag.C_Check_ErrC (dtb__318) -> (Base_dDiag.C_Check_ErrC (dtb__318))
  | Base_dDiag.C_Check_OkC (dtb__319) -> (((((v_parseTomlLoop (fuel - 1)) path) dtb__317) newSection) dtb__319)
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
)))
# 893 "Vuna/Compiler/Frontend/Toml.vuna"
and v_parseTableArrayLine = (fun (fuel : int) (path : string) (cs : t_TomlCursor) (currentPath : string B_dData_dList.t_List) (fields : (string, t_TomlNode) B_dData_dPair.t_Pair B_dData_dList.t_List) -> (if (fuel <= 0) then (Base_dDiag.v_icFuel "toml") else (let nd_uscrut5 = ((v_parseKeyPath path) (v_advanceCursor (v_advanceCursor cs))) in (match nd_uscrut5 with
  | Base_dDiag.C_Check_OkC (dtb__320) -> (match dtb__320 with
  | { B_dData_dPair.f_Pair_first = dtb__321; B_dData_dPair.f_Pair_second = dtb__322 } -> (match (v_skipBlank dtb__322) with
  | { f_TomlCursor_cursorChars = dtb__323; f_TomlCursor_cursorLine = dtb__324; f_TomlCursor_cursorCol = dtb__325 } -> (match dtb__323 with
  | B_dData_dList.C_List_Nil -> (((v_failAt path) dtb__324) "unterminated table array header")
  | B_dData_dList.C_List__x58__x58_ (dtb__326, dtb__327) -> (if (dtb__326 = 93) then (((((((v_afterDoubleBracket (fuel - 1)) path) dtb__324) dtb__325) dtb__327) dtb__321) fields) else (((v_failAt path) dtb__324) "expected ']]' in table array header"))
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
)
  | Base_dDiag.C_Check_ErrC (dtb__328) -> (Base_dDiag.C_Check_ErrC (dtb__328))
  | _ -> failwith "DT: impossible branch"
))))
# 907 "Vuna/Compiler/Frontend/Toml.vuna"
and v_afterDoubleBracket = (fun (fuel : int) (path : string) (line : int) (col : int) (rest : int B_dData_dList.t_List) (newSection : string B_dData_dList.t_List) (fields : (string, t_TomlNode) B_dData_dPair.t_Pair B_dData_dList.t_List) -> (if (fuel <= 0) then (Base_dDiag.v_icFuel "toml") else (match rest with
  | B_dData_dList.C_List__x58__x58_ (dtb__329, dtb__330) -> (if (dtb__329 = 93) then (match ((v_expectEol path) { f_TomlCursor_cursorChars = dtb__330; f_TomlCursor_cursorLine = line; f_TomlCursor_cursorCol = (col + 2) }) with
  | Base_dDiag.C_Check_ErrC (dtb__331) -> (Base_dDiag.C_Check_ErrC (dtb__331))
  | Base_dDiag.C_Check_OkC (dtb__332) -> (match (((((v_appendTableArray (v_pathFuel newSection)) path) line) newSection) fields) with
  | Base_dDiag.C_Check_ErrC (dtb__333) -> (Base_dDiag.C_Check_ErrC (dtb__333))
  | Base_dDiag.C_Check_OkC (dtb__334) -> (((((v_parseTomlLoop (fuel - 1)) path) dtb__332) newSection) dtb__334)
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
) else (((v_failAt path) line) "expected ']]' in table array header"))
  | _ -> (((v_failAt path) line) "expected ']]' in table array header")
)))
# 925 "Vuna/Compiler/Frontend/Toml.vuna"
and v_parseEntryValue = (fun (fuel : int) (path : string) (cs : t_TomlCursor) (keyLine : int) (keyPath : string B_dData_dList.t_List) (currentPath : string B_dData_dList.t_List) (fields : (string, t_TomlNode) B_dData_dPair.t_Pair B_dData_dList.t_List) -> (if (fuel <= 0) then (Base_dDiag.v_icFuel "toml") else (let nd_uscrut7 = (((v_parseValue (fuel - 1)) path) (v_skipBlank cs)) in (match nd_uscrut7 with
  | Base_dDiag.C_Check_OkC (dtb__335) -> (match dtb__335 with
  | { B_dData_dPair.f_Pair_first = dtb__336; B_dData_dPair.f_Pair_second = dtb__337 } -> (match ((v_expectEol path) dtb__337) with
  | Base_dDiag.C_Check_ErrC (dtb__338) -> (Base_dDiag.C_Check_ErrC (dtb__338))
  | Base_dDiag.C_Check_OkC (dtb__339) -> (let fullPath = ((v_appendPath currentPath) keyPath) in (match (((((((v_insertValue (v_pathFuel fullPath)) path) keyLine) fullPath) (v_sectionOfPath fullPath)) dtb__336) fields) with
  | Base_dDiag.C_Check_ErrC (dtb__340) -> (Base_dDiag.C_Check_ErrC (dtb__340))
  | Base_dDiag.C_Check_OkC (dtb__341) -> (((((v_parseTomlLoop (fuel - 1)) path) dtb__339) currentPath) dtb__341)
  | _ -> failwith "DT: impossible branch"
))
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
)
  | Base_dDiag.C_Check_ErrC (dtb__342) -> (Base_dDiag.C_Check_ErrC (dtb__342))
  | _ -> failwith "DT: impossible branch"
))))
# 942 "Vuna/Compiler/Frontend/Toml.vuna"
and v_parseKeyLine = (fun (fuel : int) (path : string) (cs : t_TomlCursor) (currentPath : string B_dData_dList.t_List) (fields : (string, t_TomlNode) B_dData_dPair.t_Pair B_dData_dList.t_List) -> (if (fuel <= 0) then (Base_dDiag.v_icFuel "toml") else (let nd_uscrut5 = ((v_parseKeyPath path) cs) in (match nd_uscrut5 with
  | Base_dDiag.C_Check_OkC (dtb__343) -> (match dtb__343 with
  | { B_dData_dPair.f_Pair_first = dtb__344; B_dData_dPair.f_Pair_second = dtb__345 } -> (match (v_skipBlank dtb__345) with
  | { f_TomlCursor_cursorChars = dtb__346; f_TomlCursor_cursorLine = dtb__347; f_TomlCursor_cursorCol = dtb__348 } -> (match dtb__346 with
  | B_dData_dList.C_List_Nil -> (((v_failAt path) (cs).f_TomlCursor_cursorLine) "expected '=' after key")
  | B_dData_dList.C_List__x58__x58_ (dtb__349, dtb__350) -> (if (dtb__349 = 61) then (((((((v_parseEntryValue (fuel - 1)) path) { f_TomlCursor_cursorChars = dtb__350; f_TomlCursor_cursorLine = dtb__347; f_TomlCursor_cursorCol = (dtb__348 + 1) }) (cs).f_TomlCursor_cursorLine) dtb__344) currentPath) fields) else (((v_failAt path) (cs).f_TomlCursor_cursorLine) "expected '=' after key"))
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
)
  | Base_dDiag.C_Check_ErrC (dtb__351) -> (Base_dDiag.C_Check_ErrC (dtb__351))
  | _ -> failwith "DT: impossible branch"
))))
# 956 "Vuna/Compiler/Frontend/Toml.vuna"
and v_parseTomlLoop = (fun (fuel : int) (path : string) (cs : t_TomlCursor) (currentPath : string B_dData_dList.t_List) (fields : (string, t_TomlNode) B_dData_dPair.t_Pair B_dData_dList.t_List) -> (if (fuel <= 0) then (Base_dDiag.v_icFuel "toml") else (((((v_parseTomlLoopAt (fuel - 1)) path) (v_skipGap cs)) currentPath) fields)))
# 963 "Vuna/Compiler/Frontend/Toml.vuna"
and v_parseTomlLoopAt = (fun (fuel : int) (path : string) (cs : t_TomlCursor) (currentPath : string B_dData_dList.t_List) (fields : (string, t_TomlNode) B_dData_dPair.t_Pair B_dData_dList.t_List) -> (if (fuel <= 0) then (Base_dDiag.v_icFuel "toml") else (match (cs).f_TomlCursor_cursorChars with
  | B_dData_dList.C_List_Nil -> (Base_dDiag.C_Check_OkC (fields))
  | B_dData_dList.C_List__x58__x58_ (dtb__352, dtb__353) -> (if (dtb__352 = 91) then (((((v_parseBracketLine (fuel - 1)) path) cs) currentPath) fields) else (((((v_parseKeyLine (fuel - 1)) path) cs) currentPath) fields))
  | _ -> failwith "DT: impossible branch"
)))
# 973 "Vuna/Compiler/Frontend/Toml.vuna"
and v_parseBracketLine = (fun (fuel : int) (path : string) (cs : t_TomlCursor) (currentPath : string B_dData_dList.t_List) (fields : (string, t_TomlNode) B_dData_dPair.t_Pair B_dData_dList.t_List) -> (if (fuel <= 0) then (Base_dDiag.v_icFuel "toml") else (match (cs).f_TomlCursor_cursorChars with
  | B_dData_dList.C_List__x58__x58_ (dtb__354, dtb__355) -> (match dtb__355 with
  | B_dData_dList.C_List__x58__x58_ (dtb__356, dtb__357) -> (if (dtb__356 = 91) then (((((v_parseTableArrayLine (fuel - 1)) path) cs) currentPath) fields) else (((((v_parseSectionLine (fuel - 1)) path) cs) currentPath) fields))
  | _ -> (((((v_parseSectionLine (fuel - 1)) path) cs) currentPath) fields)
)
  | _ -> (((((v_parseSectionLine (fuel - 1)) path) cs) currentPath) fields)
)))

# 989 "Vuna/Compiler/Frontend/Toml.vuna"
let v_parseTomlAt = (fun (path : string) (source : string) -> (let cs = { f_TomlCursor_cursorChars = (v_stripCR (B_dData_dList.dtp_unpack source)); f_TomlCursor_cursorLine = 1; f_TomlCursor_cursorCol = 1 } in (match (((((v_parseTomlLoop (v_lineFuel cs)) path) cs) B_dData_dList.C_List_Nil) B_dData_dList.C_List_Nil) with
  | Base_dDiag.C_Check_ErrC (dtb__358) -> (Base_dDiag.C_Check_ErrC (dtb__358))
  | Base_dDiag.C_Check_OkC (dtb__359) -> (Base_dDiag.C_Check_OkC ((((v_flattenFields (v_flattenFuel cs)) B_dData_dList.C_List_Nil) dtb__359)))
  | _ -> failwith "DT: impossible branch"
)))

# 986 "Vuna/Compiler/Frontend/Toml.vuna"
let v_parseToml = (fun (source : string) -> ((v_parseTomlAt "") source))

# 998 "Vuna/Compiler/Frontend/Toml.vuna"
let v_parseTomlDoc = (fun (path : string) (source : string) -> (let cs = { f_TomlCursor_cursorChars = (v_stripCR (B_dData_dList.dtp_unpack source)); f_TomlCursor_cursorLine = 1; f_TomlCursor_cursorCol = 1 } in (match (((((v_parseTomlLoop (v_lineFuel cs)) path) cs) B_dData_dList.C_List_Nil) B_dData_dList.C_List_Nil) with
  | Base_dDiag.C_Check_ErrC (dtb__360) -> (Obj.magic (Base_dDiag.C_Check_ErrC (dtb__360)))
  | Base_dDiag.C_Check_OkC (dtb__361) -> (Obj.magic (Base_dDiag.C_Check_OkC (((v_rootValue (v_flattenFuel cs)) dtb__361))))
  | _ -> failwith "DT: impossible branch"
)))

# 1007 "Vuna/Compiler/Frontend/Toml.vuna"
let rec v_arrayStrings = (fun (mc0 : t_TomlValue B_dData_dList.t_List) -> (match mc0 with
  | B_dData_dList.C_List__x58__x58_ (dtb__362, dtb__363) -> (match dtb__362 with
  | C_TomlValue_TStr (dtb__364) -> (match (v_arrayStrings dtb__363) with
  | B_dData_dMaybe.C_Maybe_Nothing -> B_dData_dMaybe.C_Maybe_Nothing
  | B_dData_dMaybe.C_Maybe_Just (dtb__365) -> (B_dData_dMaybe.C_Maybe_Just ((B_dData_dList.C_List__x58__x58_ (dtb__364, dtb__365))))
  | _ -> failwith "DT: impossible branch"
)
  | _ -> B_dData_dMaybe.C_Maybe_Nothing
)
  | B_dData_dList.C_List_Nil -> (B_dData_dMaybe.C_Maybe_Just (B_dData_dList.C_List_Nil))
  | _ -> failwith "DT: impossible branch"
))

# 1055 "Vuna/Compiler/Frontend/Toml.vuna"
let rec v_splitAtList = (fun (n : int) xs -> (if (n <= 0) then (B_dData_dMaybe.C_Maybe_Just ({ B_dData_dPair.f_Pair_first = B_dData_dList.C_List_Nil; B_dData_dPair.f_Pair_second = xs })) else (match xs with
  | B_dData_dList.C_List_Nil -> B_dData_dMaybe.C_Maybe_Nothing
  | B_dData_dList.C_List__x58__x58_ (dtb__366, dtb__367) -> (let nd_uscrut6 = ((v_splitAtList (n - 1)) dtb__367) in (match nd_uscrut6 with
  | B_dData_dMaybe.C_Maybe_Just (dtb__368) -> (match dtb__368 with
  | { B_dData_dPair.f_Pair_first = dtb__369; B_dData_dPair.f_Pair_second = dtb__370 } -> (B_dData_dMaybe.C_Maybe_Just ({ B_dData_dPair.f_Pair_first = (B_dData_dList.C_List__x58__x58_ (dtb__366, dtb__369)); B_dData_dPair.f_Pair_second = dtb__370 }))
  | _ -> failwith "DT: impossible branch"
)
  | B_dData_dMaybe.C_Maybe_Nothing -> B_dData_dMaybe.C_Maybe_Nothing
  | _ -> failwith "DT: impossible branch"
))
  | _ -> failwith "DT: impossible branch"
)))

# 1067 "Vuna/Compiler/Frontend/Toml.vuna"
let rec v_samePath = (fun _uctx0 mc0 mc1 -> (match mc0 with
  | B_dData_dList.C_List__x58__x58_ (dtb__371, dtb__372) -> (match mc1 with
  | B_dData_dList.C_List__x58__x58_ (dtb__373, dtb__374) -> (if (((B_dTrait_dEq.v__x61__x61_ _uctx0) dtb__371) dtb__373) then (((v_samePath _uctx0) dtb__372) dtb__374) else false)
  | _ -> false
)
  | B_dData_dList.C_List_Nil -> (match mc1 with
  | B_dData_dList.C_List_Nil -> true
  | _ -> false
)
  | _ -> failwith "DT: impossible branch"
))

# 1015 "Vuna/Compiler/Frontend/Toml.vuna"
let rec v_lookupEntry = (fun (mc0 : string B_dData_dList.t_List) (mc1 : string) (mc2 : t_TomlEntry B_dData_dList.t_List) -> (match mc2 with
  | B_dData_dList.C_List__x58__x58_ (dtb__375, dtb__376) -> (match dtb__375 with
  | { f_TomlEntry_tomlEntrySection = dtb__377; f_TomlEntry_tomlEntryKey = dtb__378; f_TomlEntry_tomlEntryValue = dtb__379; f_TomlEntry_tomlEntryLine = dtb__380 } -> (if (if (((v_samePath B_dData_dString.v_Eq_u018fc178ff3df1b4_uString) mc0) dtb__377) then (dtb__378 = mc1) else false) then (B_dData_dMaybe.C_Maybe_Just (dtb__379)) else (((v_lookupEntry mc0) mc1) dtb__376))
  | _ -> failwith "DT: impossible branch"
)
  | B_dData_dList.C_List_Nil -> B_dData_dMaybe.C_Maybe_Nothing
  | _ -> failwith "DT: impossible branch"
))

# 1020 "Vuna/Compiler/Frontend/Toml.vuna"
let rec v_lookupEntryLine = (fun (mc0 : string B_dData_dList.t_List) (mc1 : string) (mc2 : t_TomlEntry B_dData_dList.t_List) -> (match mc2 with
  | B_dData_dList.C_List__x58__x58_ (dtb__381, dtb__382) -> (match dtb__381 with
  | { f_TomlEntry_tomlEntrySection = dtb__383; f_TomlEntry_tomlEntryKey = dtb__384; f_TomlEntry_tomlEntryValue = dtb__385; f_TomlEntry_tomlEntryLine = dtb__386 } -> (if (if (((v_samePath B_dData_dString.v_Eq_u018fc178ff3df1b4_uString) mc0) dtb__383) then (dtb__384 = mc1) else false) then (B_dData_dMaybe.C_Maybe_Just (dtb__386)) else (((v_lookupEntryLine mc0) mc1) dtb__382))
  | _ -> failwith "DT: impossible branch"
)
  | B_dData_dList.C_List_Nil -> B_dData_dMaybe.C_Maybe_Nothing
  | _ -> failwith "DT: impossible branch"
))

# 1043 "Vuna/Compiler/Frontend/Toml.vuna"
let v_childSectionOf = (fun (prefix : string B_dData_dList.t_List) (section : string B_dData_dList.t_List) -> (let nd_uscrut2 = ((v_splitAtList (v_lenInt prefix)) section) in (match nd_uscrut2 with
  | B_dData_dMaybe.C_Maybe_Just (dtb__387) -> (match dtb__387 with
  | { B_dData_dPair.f_Pair_first = dtb__388; B_dData_dPair.f_Pair_second = dtb__389 } -> (if (((v_samePath B_dData_dString.v_Eq_u018fc178ff3df1b4_uString) dtb__388) prefix) then (let nd_uscrut9 = dtb__389 in (match nd_uscrut9 with
  | B_dData_dList.C_List__x58__x58_ (dtb__390, dtb__391) -> (match dtb__391 with
  | B_dData_dList.C_List_Nil -> (B_dData_dMaybe.C_Maybe_Just (dtb__390))
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
let rec v_sectionsUnderGo = (fun (mc0 : string B_dData_dList.t_List) (mc1 : t_TomlEntry B_dData_dList.t_List) (mc2 : string B_dData_dList.t_List) -> (match mc1 with
  | B_dData_dList.C_List__x58__x58_ (dtb__392, dtb__393) -> (match dtb__392 with
  | { f_TomlEntry_tomlEntrySection = dtb__394; f_TomlEntry_tomlEntryKey = dtb__395; f_TomlEntry_tomlEntryValue = dtb__396; f_TomlEntry_tomlEntryLine = dtb__397 } -> (let childName = ((v_childSectionOf mc0) dtb__394) in (match childName with
  | B_dData_dMaybe.C_Maybe_Nothing -> (((v_sectionsUnderGo mc0) dtb__393) mc2)
  | B_dData_dMaybe.C_Maybe_Just (dtb__398) -> (if ((B_dData_dList.v_memName dtb__398) mc2) then (((v_sectionsUnderGo mc0) dtb__393) mc2) else (((v_sectionsUnderGo mc0) dtb__393) (B_dData_dList.C_List__x58__x58_ (dtb__398, mc2))))
  | _ -> failwith "DT: impossible branch"
))
  | _ -> failwith "DT: impossible branch"
)
  | B_dData_dList.C_List_Nil -> (B_dData_dList.v_reverse mc2)
  | _ -> failwith "DT: impossible branch"
))

# 1026 "Vuna/Compiler/Frontend/Toml.vuna"
let v_sectionsUnder = (fun (prefix : string B_dData_dList.t_List) (entries : t_TomlEntry B_dData_dList.t_List) -> (((v_sectionsUnderGo prefix) entries) B_dData_dList.C_List_Nil))
