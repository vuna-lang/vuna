open Vuna_runtime
type t_Vuna_dCompiler_dFrontend_dToml_dTomlValue = C_Vuna_dCompiler_dFrontend_dToml_dTomlValue_TStr of (string) | C_Vuna_dCompiler_dFrontend_dToml_dTomlValue_TInt of (int) | C_Vuna_dCompiler_dFrontend_dToml_dTomlValue_TBool of (bool) | C_Vuna_dCompiler_dFrontend_dToml_dTomlValue_TList of (string Base_dList.t_Base_dList_dList)
and t_Vuna_dCompiler_dFrontend_dToml_dTomlEntry = { f_Vuna_dCompiler_dFrontend_dToml_dTomlEntry_tomlEntrySection : string Base_dList.t_Base_dList_dList; f_Vuna_dCompiler_dFrontend_dToml_dTomlEntry_tomlEntryKey : string; f_Vuna_dCompiler_dFrontend_dToml_dTomlEntry_tomlEntryValue : t_Vuna_dCompiler_dFrontend_dToml_dTomlValue; f_Vuna_dCompiler_dFrontend_dToml_dTomlEntry_tomlEntryLine : int }
and t_Vuna_dCompiler_dFrontend_dToml_dTomlCursor = { f_Vuna_dCompiler_dFrontend_dToml_dTomlCursor_cursorChars : int Base_dList.t_Base_dList_dList; f_Vuna_dCompiler_dFrontend_dToml_dTomlCursor_cursorLine : int; f_Vuna_dCompiler_dFrontend_dToml_dTomlCursor_cursorCol : int }

let v_Vuna_dCompiler_dFrontend_dToml_dcursorFuel = (fun mc0 -> (match mc0 with
  | { f_Vuna_dCompiler_dFrontend_dToml_dTomlCursor_cursorChars = dtb__0; f_Vuna_dCompiler_dFrontend_dToml_dTomlCursor_cursorLine = dtb__1; f_Vuna_dCompiler_dFrontend_dToml_dTomlCursor_cursorCol = dtb__2 } -> ((2 * (Base_dList.v_Base_dList_dlength dtb__0)) + 16)
  | _ -> failwith "DT: impossible branch"
))

let rec v_Vuna_dCompiler_dFrontend_dToml_dcountLines = (fun mc0 -> (match mc0 with
  | Base_dList.C_Base_dList_dList_Cons (dtb__3, dtb__4) -> (if (dtb__3 = 10) then (1 + (v_Vuna_dCompiler_dFrontend_dToml_dcountLines dtb__4)) else (v_Vuna_dCompiler_dFrontend_dToml_dcountLines dtb__4))
  | Base_dList.C_Base_dList_dList_Nil -> 1
  | _ -> failwith "DT: impossible branch"
))

let v_Vuna_dCompiler_dFrontend_dToml_dlineFuel = (fun mc0 -> (match mc0 with
  | { f_Vuna_dCompiler_dFrontend_dToml_dTomlCursor_cursorChars = dtb__5; f_Vuna_dCompiler_dFrontend_dToml_dTomlCursor_cursorLine = dtb__6; f_Vuna_dCompiler_dFrontend_dToml_dTomlCursor_cursorCol = dtb__7 } -> ((4 * (v_Vuna_dCompiler_dFrontend_dToml_dcountLines dtb__5)) + 16)
  | _ -> failwith "DT: impossible branch"
))

let v_Vuna_dCompiler_dFrontend_dToml_dadvanceCursor = (fun mc0 -> (match mc0 with
  | { f_Vuna_dCompiler_dFrontend_dToml_dTomlCursor_cursorChars = dtb__8; f_Vuna_dCompiler_dFrontend_dToml_dTomlCursor_cursorLine = dtb__9; f_Vuna_dCompiler_dFrontend_dToml_dTomlCursor_cursorCol = dtb__10 } -> (match dtb__8 with
  | Base_dList.C_Base_dList_dList_Cons (dtb__11, dtb__12) -> (if (dtb__11 = 10) then { f_Vuna_dCompiler_dFrontend_dToml_dTomlCursor_cursorChars = dtb__12; f_Vuna_dCompiler_dFrontend_dToml_dTomlCursor_cursorLine = (dtb__9 + 1); f_Vuna_dCompiler_dFrontend_dToml_dTomlCursor_cursorCol = 1 } else { f_Vuna_dCompiler_dFrontend_dToml_dTomlCursor_cursorChars = dtb__12; f_Vuna_dCompiler_dFrontend_dToml_dTomlCursor_cursorLine = dtb__9; f_Vuna_dCompiler_dFrontend_dToml_dTomlCursor_cursorCol = (dtb__10 + 1) })
  | Base_dList.C_Base_dList_dList_Nil -> { f_Vuna_dCompiler_dFrontend_dToml_dTomlCursor_cursorChars = Base_dList.C_Base_dList_dList_Nil; f_Vuna_dCompiler_dFrontend_dToml_dTomlCursor_cursorLine = dtb__9; f_Vuna_dCompiler_dFrontend_dToml_dTomlCursor_cursorCol = dtb__10 }
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
))

let v_Vuna_dCompiler_dFrontend_dToml_disDigitChar = (fun c -> (if (c >= 48) then (c <= 57) else false))

let v_Vuna_dCompiler_dFrontend_dToml_disUpperAlphaChar = (fun c -> (if (c >= 65) then (c <= 90) else false))

let v_Vuna_dCompiler_dFrontend_dToml_disLowerAlphaChar = (fun c -> (if (c >= 97) then (c <= 122) else false))

let v_Vuna_dCompiler_dFrontend_dToml_disAlphaChar = (fun c -> (if (v_Vuna_dCompiler_dFrontend_dToml_disUpperAlphaChar c) then true else (v_Vuna_dCompiler_dFrontend_dToml_disLowerAlphaChar c)))

let v_Vuna_dCompiler_dFrontend_dToml_disBareKeyChar = (fun c -> (if (if (if (v_Vuna_dCompiler_dFrontend_dToml_disAlphaChar c) then true else (v_Vuna_dCompiler_dFrontend_dToml_disDigitChar c)) then true else (c = 95)) then true else (c = 45)))

let v_Vuna_dCompiler_dFrontend_dToml_disBlankChar = (fun c -> (if (c = 32) then true else (c = 9)))

let rec v_Vuna_dCompiler_dFrontend_dToml_dstripCR = (fun mc0 -> (match mc0 with
  | Base_dList.C_Base_dList_dList_Cons (dtb__13, dtb__14) -> (if (dtb__13 = 13) then (v_Vuna_dCompiler_dFrontend_dToml_dstripCR dtb__14) else (Base_dList.C_Base_dList_dList_Cons (dtb__13, (v_Vuna_dCompiler_dFrontend_dToml_dstripCR dtb__14))))
  | Base_dList.C_Base_dList_dList_Nil -> Base_dList.C_Base_dList_dList_Nil
  | _ -> failwith "DT: impossible branch"
))

let v_Vuna_dCompiler_dFrontend_dToml_dlocPrefix = (fun path line -> (if (path = "") then (String.concat "" ["line "; (bi_strFromInt line); ": "]) else (String.concat "" [path; ":"; (bi_strFromInt line); ": "])))

let v_Vuna_dCompiler_dFrontend_dToml_dfailAt = (fun path line msg -> (Base_dResult.C_Base_dResult_dResult_Err ((((v_Vuna_dCompiler_dFrontend_dToml_dlocPrefix path) line) ^ msg))))

let rec v_Vuna_dCompiler_dFrontend_dToml_dskipBlank = (fun mc0 -> (match mc0 with
  | { f_Vuna_dCompiler_dFrontend_dToml_dTomlCursor_cursorChars = dtb__15; f_Vuna_dCompiler_dFrontend_dToml_dTomlCursor_cursorLine = dtb__16; f_Vuna_dCompiler_dFrontend_dToml_dTomlCursor_cursorCol = dtb__17 } -> (match dtb__15 with
  | Base_dList.C_Base_dList_dList_Cons (dtb__18, dtb__19) -> (if (v_Vuna_dCompiler_dFrontend_dToml_disBlankChar dtb__18) then (v_Vuna_dCompiler_dFrontend_dToml_dskipBlank { f_Vuna_dCompiler_dFrontend_dToml_dTomlCursor_cursorChars = dtb__19; f_Vuna_dCompiler_dFrontend_dToml_dTomlCursor_cursorLine = dtb__16; f_Vuna_dCompiler_dFrontend_dToml_dTomlCursor_cursorCol = (dtb__17 + 1) }) else { f_Vuna_dCompiler_dFrontend_dToml_dTomlCursor_cursorChars = (Base_dList.C_Base_dList_dList_Cons (dtb__18, dtb__19)); f_Vuna_dCompiler_dFrontend_dToml_dTomlCursor_cursorLine = dtb__16; f_Vuna_dCompiler_dFrontend_dToml_dTomlCursor_cursorCol = dtb__17 })
  | Base_dList.C_Base_dList_dList_Nil -> { f_Vuna_dCompiler_dFrontend_dToml_dTomlCursor_cursorChars = Base_dList.C_Base_dList_dList_Nil; f_Vuna_dCompiler_dFrontend_dToml_dTomlCursor_cursorLine = dtb__16; f_Vuna_dCompiler_dFrontend_dToml_dTomlCursor_cursorCol = dtb__17 }
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
))

let rec v_Vuna_dCompiler_dFrontend_dToml_dskipComment = (fun mc0 -> (match mc0 with
  | { f_Vuna_dCompiler_dFrontend_dToml_dTomlCursor_cursorChars = dtb__20; f_Vuna_dCompiler_dFrontend_dToml_dTomlCursor_cursorLine = dtb__21; f_Vuna_dCompiler_dFrontend_dToml_dTomlCursor_cursorCol = dtb__22 } -> (match dtb__20 with
  | Base_dList.C_Base_dList_dList_Cons (dtb__23, dtb__24) -> (if (dtb__23 = 10) then { f_Vuna_dCompiler_dFrontend_dToml_dTomlCursor_cursorChars = (Base_dList.C_Base_dList_dList_Cons (dtb__23, dtb__24)); f_Vuna_dCompiler_dFrontend_dToml_dTomlCursor_cursorLine = dtb__21; f_Vuna_dCompiler_dFrontend_dToml_dTomlCursor_cursorCol = dtb__22 } else (v_Vuna_dCompiler_dFrontend_dToml_dskipComment { f_Vuna_dCompiler_dFrontend_dToml_dTomlCursor_cursorChars = dtb__24; f_Vuna_dCompiler_dFrontend_dToml_dTomlCursor_cursorLine = dtb__21; f_Vuna_dCompiler_dFrontend_dToml_dTomlCursor_cursorCol = (dtb__22 + 1) }))
  | Base_dList.C_Base_dList_dList_Nil -> { f_Vuna_dCompiler_dFrontend_dToml_dTomlCursor_cursorChars = Base_dList.C_Base_dList_dList_Nil; f_Vuna_dCompiler_dFrontend_dToml_dTomlCursor_cursorLine = dtb__21; f_Vuna_dCompiler_dFrontend_dToml_dTomlCursor_cursorCol = dtb__22 }
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
))

let rec v_Vuna_dCompiler_dFrontend_dToml_dskipGapGo = (fun mc0 mc1 -> (match mc1 with
  | { f_Vuna_dCompiler_dFrontend_dToml_dTomlCursor_cursorChars = dtb__25; f_Vuna_dCompiler_dFrontend_dToml_dTomlCursor_cursorLine = dtb__26; f_Vuna_dCompiler_dFrontend_dToml_dTomlCursor_cursorCol = dtb__27 } -> (match dtb__25 with
  | Base_dList.C_Base_dList_dList_Cons (dtb__28, dtb__29) -> (if mc0 then (if (dtb__28 = 10) then ((v_Vuna_dCompiler_dFrontend_dToml_dskipGapGo false) { f_Vuna_dCompiler_dFrontend_dToml_dTomlCursor_cursorChars = dtb__29; f_Vuna_dCompiler_dFrontend_dToml_dTomlCursor_cursorLine = (dtb__26 + 1); f_Vuna_dCompiler_dFrontend_dToml_dTomlCursor_cursorCol = 1 }) else ((v_Vuna_dCompiler_dFrontend_dToml_dskipGapGo true) { f_Vuna_dCompiler_dFrontend_dToml_dTomlCursor_cursorChars = dtb__29; f_Vuna_dCompiler_dFrontend_dToml_dTomlCursor_cursorLine = dtb__26; f_Vuna_dCompiler_dFrontend_dToml_dTomlCursor_cursorCol = (dtb__27 + 1) })) else (if (v_Vuna_dCompiler_dFrontend_dToml_disBlankChar dtb__28) then ((v_Vuna_dCompiler_dFrontend_dToml_dskipGapGo false) { f_Vuna_dCompiler_dFrontend_dToml_dTomlCursor_cursorChars = dtb__29; f_Vuna_dCompiler_dFrontend_dToml_dTomlCursor_cursorLine = dtb__26; f_Vuna_dCompiler_dFrontend_dToml_dTomlCursor_cursorCol = (dtb__27 + 1) }) else (if (dtb__28 = 10) then ((v_Vuna_dCompiler_dFrontend_dToml_dskipGapGo false) { f_Vuna_dCompiler_dFrontend_dToml_dTomlCursor_cursorChars = dtb__29; f_Vuna_dCompiler_dFrontend_dToml_dTomlCursor_cursorLine = (dtb__26 + 1); f_Vuna_dCompiler_dFrontend_dToml_dTomlCursor_cursorCol = 1 }) else (if (dtb__28 = 35) then ((v_Vuna_dCompiler_dFrontend_dToml_dskipGapGo true) { f_Vuna_dCompiler_dFrontend_dToml_dTomlCursor_cursorChars = dtb__29; f_Vuna_dCompiler_dFrontend_dToml_dTomlCursor_cursorLine = dtb__26; f_Vuna_dCompiler_dFrontend_dToml_dTomlCursor_cursorCol = (dtb__27 + 1) }) else { f_Vuna_dCompiler_dFrontend_dToml_dTomlCursor_cursorChars = (Base_dList.C_Base_dList_dList_Cons (dtb__28, dtb__29)); f_Vuna_dCompiler_dFrontend_dToml_dTomlCursor_cursorLine = dtb__26; f_Vuna_dCompiler_dFrontend_dToml_dTomlCursor_cursorCol = dtb__27 }))))
  | Base_dList.C_Base_dList_dList_Nil -> { f_Vuna_dCompiler_dFrontend_dToml_dTomlCursor_cursorChars = Base_dList.C_Base_dList_dList_Nil; f_Vuna_dCompiler_dFrontend_dToml_dTomlCursor_cursorLine = dtb__26; f_Vuna_dCompiler_dFrontend_dToml_dTomlCursor_cursorCol = dtb__27 }
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
))

let v_Vuna_dCompiler_dFrontend_dToml_dskipGap = (fun cs -> ((v_Vuna_dCompiler_dFrontend_dToml_dskipGapGo false) cs))

let rec v_Vuna_dCompiler_dFrontend_dToml_dcollectBareKey = (fun mc0 mc1 -> (match mc0 with
  | { f_Vuna_dCompiler_dFrontend_dToml_dTomlCursor_cursorChars = dtb__30; f_Vuna_dCompiler_dFrontend_dToml_dTomlCursor_cursorLine = dtb__31; f_Vuna_dCompiler_dFrontend_dToml_dTomlCursor_cursorCol = dtb__32 } -> (match dtb__30 with
  | Base_dList.C_Base_dList_dList_Cons (dtb__33, dtb__34) -> (if (v_Vuna_dCompiler_dFrontend_dToml_disBareKeyChar dtb__33) then ((v_Vuna_dCompiler_dFrontend_dToml_dcollectBareKey { f_Vuna_dCompiler_dFrontend_dToml_dTomlCursor_cursorChars = dtb__34; f_Vuna_dCompiler_dFrontend_dToml_dTomlCursor_cursorLine = dtb__31; f_Vuna_dCompiler_dFrontend_dToml_dTomlCursor_cursorCol = (dtb__32 + 1) }) (Base_dList.C_Base_dList_dList_Cons (dtb__33, mc1))) else { Base_dPair.f_Base_dPair_dPair_first = (Base_dList.dtp_pack (Base_dList.v_Base_dList_dreverse mc1)); Base_dPair.f_Base_dPair_dPair_second = { f_Vuna_dCompiler_dFrontend_dToml_dTomlCursor_cursorChars = (Base_dList.C_Base_dList_dList_Cons (dtb__33, dtb__34)); f_Vuna_dCompiler_dFrontend_dToml_dTomlCursor_cursorLine = dtb__31; f_Vuna_dCompiler_dFrontend_dToml_dTomlCursor_cursorCol = dtb__32 } })
  | Base_dList.C_Base_dList_dList_Nil -> { Base_dPair.f_Base_dPair_dPair_first = (Base_dList.dtp_pack (Base_dList.v_Base_dList_dreverse mc1)); Base_dPair.f_Base_dPair_dPair_second = { f_Vuna_dCompiler_dFrontend_dToml_dTomlCursor_cursorChars = Base_dList.C_Base_dList_dList_Nil; f_Vuna_dCompiler_dFrontend_dToml_dTomlCursor_cursorLine = dtb__31; f_Vuna_dCompiler_dFrontend_dToml_dTomlCursor_cursorCol = dtb__32 } }
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
))

let v_Vuna_dCompiler_dFrontend_dToml_dparseBareKey = (fun path cs -> (match (cs).f_Vuna_dCompiler_dFrontend_dToml_dTomlCursor_cursorChars with
  | Base_dList.C_Base_dList_dList_Nil -> (((v_Vuna_dCompiler_dFrontend_dToml_dfailAt path) (cs).f_Vuna_dCompiler_dFrontend_dToml_dTomlCursor_cursorLine) "expected a key")
  | Base_dList.C_Base_dList_dList_Cons (dtb__35, dtb__36) -> (if (v_Vuna_dCompiler_dFrontend_dToml_disBareKeyChar dtb__35) then (match ((v_Vuna_dCompiler_dFrontend_dToml_dcollectBareKey cs) Base_dList.C_Base_dList_dList_Nil) with
  | { Base_dPair.f_Base_dPair_dPair_first = dtb__37; Base_dPair.f_Base_dPair_dPair_second = dtb__38 } -> (Base_dResult.C_Base_dResult_dResult_Ok ({ Base_dPair.f_Base_dPair_dPair_first = dtb__37; Base_dPair.f_Base_dPair_dPair_second = dtb__38 }))
  | _ -> failwith "DT: impossible branch"
) else (((v_Vuna_dCompiler_dFrontend_dToml_dfailAt path) (cs).f_Vuna_dCompiler_dFrontend_dToml_dTomlCursor_cursorLine) "expected a key"))
  | _ -> failwith "DT: impossible branch"
))

let rec v_Vuna_dCompiler_dFrontend_dToml_dparseStringChars = (fun fuel path startCs cs acc -> (if (fuel <= 0) then (Base_dResult.C_Base_dResult_dResult_Err ("DT: toml fuel exhausted (internal: toml parser made no progress)")) else (match (cs).f_Vuna_dCompiler_dFrontend_dToml_dTomlCursor_cursorChars with
  | Base_dList.C_Base_dList_dList_Nil -> (((v_Vuna_dCompiler_dFrontend_dToml_dfailAt path) (startCs).f_Vuna_dCompiler_dFrontend_dToml_dTomlCursor_cursorLine) "unterminated basic string")
  | Base_dList.C_Base_dList_dList_Cons (dtb__39, dtb__40) -> (if (dtb__39 = 34) then (Base_dResult.C_Base_dResult_dResult_Ok ({ Base_dPair.f_Base_dPair_dPair_first = (Base_dList.dtp_pack (Base_dList.v_Base_dList_dreverse acc)); Base_dPair.f_Base_dPair_dPair_second = (v_Vuna_dCompiler_dFrontend_dToml_dadvanceCursor cs) })) else (if (dtb__39 = 10) then (((v_Vuna_dCompiler_dFrontend_dToml_dfailAt path) (startCs).f_Vuna_dCompiler_dFrontend_dToml_dTomlCursor_cursorLine) "unterminated basic string (newline in string)") else (if (dtb__39 = 92) then (((((v_Vuna_dCompiler_dFrontend_dToml_dparseStringEscape (fuel - 1)) path) startCs) (v_Vuna_dCompiler_dFrontend_dToml_dadvanceCursor cs)) acc) else (((((v_Vuna_dCompiler_dFrontend_dToml_dparseStringChars (fuel - 1)) path) startCs) (v_Vuna_dCompiler_dFrontend_dToml_dadvanceCursor cs)) (Base_dList.C_Base_dList_dList_Cons (dtb__39, acc))))))
  | _ -> failwith "DT: impossible branch"
)))
and v_Vuna_dCompiler_dFrontend_dToml_dparseStringEscape = (fun fuel path startCs cs acc -> (if (fuel <= 0) then (Base_dResult.C_Base_dResult_dResult_Err ("DT: toml fuel exhausted (internal: toml parser made no progress)")) else (match (cs).f_Vuna_dCompiler_dFrontend_dToml_dTomlCursor_cursorChars with
  | Base_dList.C_Base_dList_dList_Nil -> (((v_Vuna_dCompiler_dFrontend_dToml_dfailAt path) (startCs).f_Vuna_dCompiler_dFrontend_dToml_dTomlCursor_cursorLine) "unterminated escape sequence")
  | Base_dList.C_Base_dList_dList_Cons (dtb__41, dtb__42) -> (if (dtb__41 = 110) then (((((v_Vuna_dCompiler_dFrontend_dToml_dparseStringChars (fuel - 1)) path) startCs) (v_Vuna_dCompiler_dFrontend_dToml_dadvanceCursor cs)) (Base_dList.C_Base_dList_dList_Cons (10, acc))) else (if (dtb__41 = 116) then (((((v_Vuna_dCompiler_dFrontend_dToml_dparseStringChars (fuel - 1)) path) startCs) (v_Vuna_dCompiler_dFrontend_dToml_dadvanceCursor cs)) (Base_dList.C_Base_dList_dList_Cons (9, acc))) else (if (dtb__41 = 114) then (((((v_Vuna_dCompiler_dFrontend_dToml_dparseStringChars (fuel - 1)) path) startCs) (v_Vuna_dCompiler_dFrontend_dToml_dadvanceCursor cs)) (Base_dList.C_Base_dList_dList_Cons (13, acc))) else (if (dtb__41 = 98) then (((((v_Vuna_dCompiler_dFrontend_dToml_dparseStringChars (fuel - 1)) path) startCs) (v_Vuna_dCompiler_dFrontend_dToml_dadvanceCursor cs)) (Base_dList.C_Base_dList_dList_Cons (8, acc))) else (if (dtb__41 = 102) then (((((v_Vuna_dCompiler_dFrontend_dToml_dparseStringChars (fuel - 1)) path) startCs) (v_Vuna_dCompiler_dFrontend_dToml_dadvanceCursor cs)) (Base_dList.C_Base_dList_dList_Cons (12, acc))) else (if (dtb__41 = 34) then (((((v_Vuna_dCompiler_dFrontend_dToml_dparseStringChars (fuel - 1)) path) startCs) (v_Vuna_dCompiler_dFrontend_dToml_dadvanceCursor cs)) (Base_dList.C_Base_dList_dList_Cons (34, acc))) else (if (dtb__41 = 92) then (((((v_Vuna_dCompiler_dFrontend_dToml_dparseStringChars (fuel - 1)) path) startCs) (v_Vuna_dCompiler_dFrontend_dToml_dadvanceCursor cs)) (Base_dList.C_Base_dList_dList_Cons (92, acc))) else (((v_Vuna_dCompiler_dFrontend_dToml_dfailAt path) (cs).f_Vuna_dCompiler_dFrontend_dToml_dTomlCursor_cursorLine) ("unknown escape sequence \\" ^ (Base_dList.dtp_pack (Base_dList.C_Base_dList_dList_Cons (dtb__41, Base_dList.C_Base_dList_dList_Nil))))))))))))
  | _ -> failwith "DT: impossible branch"
)))

let v_Vuna_dCompiler_dFrontend_dToml_dparseStringValue = (fun path cs -> (match (cs).f_Vuna_dCompiler_dFrontend_dToml_dTomlCursor_cursorChars with
  | Base_dList.C_Base_dList_dList_Nil -> (((v_Vuna_dCompiler_dFrontend_dToml_dfailAt path) (cs).f_Vuna_dCompiler_dFrontend_dToml_dTomlCursor_cursorLine) "unterminated basic string")
  | Base_dList.C_Base_dList_dList_Cons (dtb__43, dtb__44) -> ((fun cs1 -> (((((v_Vuna_dCompiler_dFrontend_dToml_dparseStringChars (v_Vuna_dCompiler_dFrontend_dToml_dcursorFuel cs1)) path) cs) cs1) Base_dList.C_Base_dList_dList_Nil)) (v_Vuna_dCompiler_dFrontend_dToml_dadvanceCursor cs))
  | _ -> failwith "DT: impossible branch"
))

let v_Vuna_dCompiler_dFrontend_dToml_dmakeInteger = (fun mc0 mc1 -> (if mc1 then (0 - mc0) else mc0))

let v_Vuna_dCompiler_dFrontend_dToml_dfinishInteger = (fun path startCs cs count acc negative -> (if (count = 0) then (((v_Vuna_dCompiler_dFrontend_dToml_dfailAt path) (startCs).f_Vuna_dCompiler_dFrontend_dToml_dTomlCursor_cursorLine) "expected digits for integer") else (match (cs).f_Vuna_dCompiler_dFrontend_dToml_dTomlCursor_cursorChars with
  | Base_dList.C_Base_dList_dList_Nil -> (Base_dResult.C_Base_dResult_dResult_Ok ({ Base_dPair.f_Base_dPair_dPair_first = ((v_Vuna_dCompiler_dFrontend_dToml_dmakeInteger acc) negative); Base_dPair.f_Base_dPair_dPair_second = cs }))
  | Base_dList.C_Base_dList_dList_Cons (dtb__45, dtb__46) -> (if (dtb__45 = 46) then (((v_Vuna_dCompiler_dFrontend_dToml_dfailAt path) (startCs).f_Vuna_dCompiler_dFrontend_dToml_dTomlCursor_cursorLine) "floating point numbers are not supported") else (if (v_Vuna_dCompiler_dFrontend_dToml_disBareKeyChar dtb__45) then (((v_Vuna_dCompiler_dFrontend_dToml_dfailAt path) (startCs).f_Vuna_dCompiler_dFrontend_dToml_dTomlCursor_cursorLine) "invalid integer literal") else (Base_dResult.C_Base_dResult_dResult_Ok ({ Base_dPair.f_Base_dPair_dPair_first = ((v_Vuna_dCompiler_dFrontend_dToml_dmakeInteger acc) negative); Base_dPair.f_Base_dPair_dPair_second = cs }))))
  | _ -> failwith "DT: impossible branch"
)))

let rec v_Vuna_dCompiler_dFrontend_dToml_dparseIntegerDigits = (fun fuel path startCs cs count acc negative -> (if (fuel <= 0) then (Base_dResult.C_Base_dResult_dResult_Err ("DT: toml fuel exhausted (internal: toml parser made no progress)")) else (match (cs).f_Vuna_dCompiler_dFrontend_dToml_dTomlCursor_cursorChars with
  | Base_dList.C_Base_dList_dList_Nil -> ((((((v_Vuna_dCompiler_dFrontend_dToml_dfinishInteger path) startCs) cs) count) acc) negative)
  | Base_dList.C_Base_dList_dList_Cons (dtb__47, dtb__48) -> (if (v_Vuna_dCompiler_dFrontend_dToml_disDigitChar dtb__47) then (((((((v_Vuna_dCompiler_dFrontend_dToml_dparseIntegerDigits (fuel - 1)) path) startCs) (v_Vuna_dCompiler_dFrontend_dToml_dadvanceCursor cs)) (count + 1)) ((acc * 10) + (dtb__47 - 48))) negative) else ((((((v_Vuna_dCompiler_dFrontend_dToml_dfinishInteger path) startCs) cs) count) acc) negative))
  | _ -> failwith "DT: impossible branch"
)))

let v_Vuna_dCompiler_dFrontend_dToml_dparseInteger = (fun path cs -> (match (cs).f_Vuna_dCompiler_dFrontend_dToml_dTomlCursor_cursorChars with
  | Base_dList.C_Base_dList_dList_Nil -> (((v_Vuna_dCompiler_dFrontend_dToml_dfailAt path) (cs).f_Vuna_dCompiler_dFrontend_dToml_dTomlCursor_cursorLine) "expected an integer")
  | Base_dList.C_Base_dList_dList_Cons (dtb__49, dtb__50) -> (if (dtb__49 = 45) then (((((((v_Vuna_dCompiler_dFrontend_dToml_dparseIntegerDigits (v_Vuna_dCompiler_dFrontend_dToml_dcursorFuel cs)) path) cs) (v_Vuna_dCompiler_dFrontend_dToml_dadvanceCursor cs)) 0) 0) true) else (if (v_Vuna_dCompiler_dFrontend_dToml_disDigitChar dtb__49) then (((((((v_Vuna_dCompiler_dFrontend_dToml_dparseIntegerDigits (v_Vuna_dCompiler_dFrontend_dToml_dcursorFuel cs)) path) cs) cs) 0) 0) false) else (((v_Vuna_dCompiler_dFrontend_dToml_dfailAt path) (cs).f_Vuna_dCompiler_dFrontend_dToml_dTomlCursor_cursorLine) "expected an integer")))
  | _ -> failwith "DT: impossible branch"
))

let v_Vuna_dCompiler_dFrontend_dToml_dparseIntValue = (fun path cs -> ((fun nd_uscrut2 -> (match nd_uscrut2 with
  | Base_dResult.C_Base_dResult_dResult_Ok (dtb__51) -> (match dtb__51 with
  | { Base_dPair.f_Base_dPair_dPair_first = dtb__52; Base_dPair.f_Base_dPair_dPair_second = dtb__53 } -> (Base_dResult.C_Base_dResult_dResult_Ok ({ Base_dPair.f_Base_dPair_dPair_first = (C_Vuna_dCompiler_dFrontend_dToml_dTomlValue_TInt (dtb__52)); Base_dPair.f_Base_dPair_dPair_second = dtb__53 }))
  | _ -> failwith "DT: impossible branch"
)
  | Base_dResult.C_Base_dResult_dResult_Err (dtb__54) -> (Base_dResult.C_Base_dResult_dResult_Err (dtb__54))
  | _ -> failwith "DT: impossible branch"
)) ((v_Vuna_dCompiler_dFrontend_dToml_dparseInteger path) cs)))

let rec v_Vuna_dCompiler_dFrontend_dToml_dmatchChars = (fun mc0 mc1 -> (match mc0 with
  | Base_dList.C_Base_dList_dList_Cons (dtb__55, dtb__56) -> (match mc1 with
  | { f_Vuna_dCompiler_dFrontend_dToml_dTomlCursor_cursorChars = dtb__57; f_Vuna_dCompiler_dFrontend_dToml_dTomlCursor_cursorLine = dtb__58; f_Vuna_dCompiler_dFrontend_dToml_dTomlCursor_cursorCol = dtb__59 } -> (match dtb__57 with
  | Base_dList.C_Base_dList_dList_Cons (dtb__60, dtb__61) -> (if (dtb__60 = dtb__55) then ((v_Vuna_dCompiler_dFrontend_dToml_dmatchChars dtb__56) { f_Vuna_dCompiler_dFrontend_dToml_dTomlCursor_cursorChars = dtb__61; f_Vuna_dCompiler_dFrontend_dToml_dTomlCursor_cursorLine = dtb__58; f_Vuna_dCompiler_dFrontend_dToml_dTomlCursor_cursorCol = (dtb__59 + 1) }) else Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing)
  | Base_dList.C_Base_dList_dList_Nil -> Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
)
  | Base_dList.C_Base_dList_dList_Nil -> (Base_dMaybe.C_Base_dMaybe_dMaybe_Just (mc1))
  | _ -> failwith "DT: impossible branch"
))

let v_Vuna_dCompiler_dFrontend_dToml_dmatchWord = (fun word cs -> (match ((v_Vuna_dCompiler_dFrontend_dToml_dmatchChars (Base_dList.dtp_unpack word)) cs) with
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing -> Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Just (dtb__62) -> (match (dtb__62).f_Vuna_dCompiler_dFrontend_dToml_dTomlCursor_cursorChars with
  | Base_dList.C_Base_dList_dList_Nil -> (Base_dMaybe.C_Base_dMaybe_dMaybe_Just (dtb__62))
  | Base_dList.C_Base_dList_dList_Cons (dtb__63, dtb__64) -> (if (v_Vuna_dCompiler_dFrontend_dToml_disBareKeyChar dtb__63) then Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing else (Base_dMaybe.C_Base_dMaybe_dMaybe_Just (dtb__62)))
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
))

let rec v_Vuna_dCompiler_dFrontend_dToml_dparseArrayItems = (fun fuel path cs acc -> (if (fuel <= 0) then (Base_dResult.C_Base_dResult_dResult_Err ("DT: toml fuel exhausted (internal: toml parser made no progress)")) else (match (v_Vuna_dCompiler_dFrontend_dToml_dskipGap cs) with
  | { f_Vuna_dCompiler_dFrontend_dToml_dTomlCursor_cursorChars = dtb__65; f_Vuna_dCompiler_dFrontend_dToml_dTomlCursor_cursorLine = dtb__66; f_Vuna_dCompiler_dFrontend_dToml_dTomlCursor_cursorCol = dtb__67 } -> (match dtb__65 with
  | Base_dList.C_Base_dList_dList_Nil -> (((v_Vuna_dCompiler_dFrontend_dToml_dfailAt path) dtb__66) "unterminated array")
  | Base_dList.C_Base_dList_dList_Cons (dtb__68, dtb__69) -> (if (dtb__68 = 93) then (Base_dResult.C_Base_dResult_dResult_Ok ({ Base_dPair.f_Base_dPair_dPair_first = (C_Vuna_dCompiler_dFrontend_dToml_dTomlValue_TList ((Base_dList.v_Base_dList_dreverse acc))); Base_dPair.f_Base_dPair_dPair_second = (v_Vuna_dCompiler_dFrontend_dToml_dadvanceCursor { f_Vuna_dCompiler_dFrontend_dToml_dTomlCursor_cursorChars = dtb__65; f_Vuna_dCompiler_dFrontend_dToml_dTomlCursor_cursorLine = dtb__66; f_Vuna_dCompiler_dFrontend_dToml_dTomlCursor_cursorCol = dtb__67 }) })) else (if (dtb__68 = 34) then ((((v_Vuna_dCompiler_dFrontend_dToml_dparseArrayString (fuel - 1)) path) { f_Vuna_dCompiler_dFrontend_dToml_dTomlCursor_cursorChars = dtb__65; f_Vuna_dCompiler_dFrontend_dToml_dTomlCursor_cursorLine = dtb__66; f_Vuna_dCompiler_dFrontend_dToml_dTomlCursor_cursorCol = dtb__67 }) acc) else (((v_Vuna_dCompiler_dFrontend_dToml_dfailAt path) dtb__66) "expected a string in array")))
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
)))
and v_Vuna_dCompiler_dFrontend_dToml_dparseArrayString = (fun fuel path cs acc -> (if (fuel <= 0) then (Base_dResult.C_Base_dResult_dResult_Err ("DT: toml fuel exhausted (internal: toml parser made no progress)")) else ((fun nd_uscrut4 -> (match nd_uscrut4 with
  | Base_dResult.C_Base_dResult_dResult_Ok (dtb__70) -> (match dtb__70 with
  | { Base_dPair.f_Base_dPair_dPair_first = dtb__71; Base_dPair.f_Base_dPair_dPair_second = dtb__72 } -> (match (v_Vuna_dCompiler_dFrontend_dToml_dskipGap dtb__72) with
  | { f_Vuna_dCompiler_dFrontend_dToml_dTomlCursor_cursorChars = dtb__73; f_Vuna_dCompiler_dFrontend_dToml_dTomlCursor_cursorLine = dtb__74; f_Vuna_dCompiler_dFrontend_dToml_dTomlCursor_cursorCol = dtb__75 } -> (match dtb__73 with
  | Base_dList.C_Base_dList_dList_Nil -> (((v_Vuna_dCompiler_dFrontend_dToml_dfailAt path) dtb__74) "unterminated array")
  | Base_dList.C_Base_dList_dList_Cons (dtb__76, dtb__77) -> (if (dtb__76 = 44) then ((((v_Vuna_dCompiler_dFrontend_dToml_dparseArrayItems (fuel - 1)) path) (v_Vuna_dCompiler_dFrontend_dToml_dadvanceCursor { f_Vuna_dCompiler_dFrontend_dToml_dTomlCursor_cursorChars = dtb__73; f_Vuna_dCompiler_dFrontend_dToml_dTomlCursor_cursorLine = dtb__74; f_Vuna_dCompiler_dFrontend_dToml_dTomlCursor_cursorCol = dtb__75 })) (Base_dList.C_Base_dList_dList_Cons (dtb__71, acc))) else (if (dtb__76 = 93) then (Base_dResult.C_Base_dResult_dResult_Ok ({ Base_dPair.f_Base_dPair_dPair_first = (C_Vuna_dCompiler_dFrontend_dToml_dTomlValue_TList ((Base_dList.v_Base_dList_dreverse (Base_dList.C_Base_dList_dList_Cons (dtb__71, acc))))); Base_dPair.f_Base_dPair_dPair_second = (v_Vuna_dCompiler_dFrontend_dToml_dadvanceCursor { f_Vuna_dCompiler_dFrontend_dToml_dTomlCursor_cursorChars = dtb__73; f_Vuna_dCompiler_dFrontend_dToml_dTomlCursor_cursorLine = dtb__74; f_Vuna_dCompiler_dFrontend_dToml_dTomlCursor_cursorCol = dtb__75 }) })) else (((v_Vuna_dCompiler_dFrontend_dToml_dfailAt path) dtb__74) "expected ',' or ']' in array")))
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
)
  | Base_dResult.C_Base_dResult_dResult_Err (dtb__78) -> (Base_dResult.C_Base_dResult_dResult_Err (dtb__78))
  | _ -> failwith "DT: impossible branch"
)) ((v_Vuna_dCompiler_dFrontend_dToml_dparseStringValue path) cs))))

let v_Vuna_dCompiler_dFrontend_dToml_dparseStringArray = (fun path cs -> (match (cs).f_Vuna_dCompiler_dFrontend_dToml_dTomlCursor_cursorChars with
  | Base_dList.C_Base_dList_dList_Nil -> (((v_Vuna_dCompiler_dFrontend_dToml_dfailAt path) (cs).f_Vuna_dCompiler_dFrontend_dToml_dTomlCursor_cursorLine) "unterminated array")
  | Base_dList.C_Base_dList_dList_Cons (dtb__79, dtb__80) -> ((fun cs1 -> ((((v_Vuna_dCompiler_dFrontend_dToml_dparseArrayItems (v_Vuna_dCompiler_dFrontend_dToml_dcursorFuel cs1)) path) cs1) Base_dList.C_Base_dList_dList_Nil)) (v_Vuna_dCompiler_dFrontend_dToml_dadvanceCursor cs))
  | _ -> failwith "DT: impossible branch"
))

let v_Vuna_dCompiler_dFrontend_dToml_dparseValue = (fun path cs -> (match (cs).f_Vuna_dCompiler_dFrontend_dToml_dTomlCursor_cursorChars with
  | Base_dList.C_Base_dList_dList_Nil -> (((v_Vuna_dCompiler_dFrontend_dToml_dfailAt path) (cs).f_Vuna_dCompiler_dFrontend_dToml_dTomlCursor_cursorLine) "expected a value")
  | Base_dList.C_Base_dList_dList_Cons (dtb__81, dtb__82) -> (if (dtb__81 = 34) then ((fun nd_uscrut5 -> (match nd_uscrut5 with
  | Base_dResult.C_Base_dResult_dResult_Ok (dtb__83) -> (match dtb__83 with
  | { Base_dPair.f_Base_dPair_dPair_first = dtb__84; Base_dPair.f_Base_dPair_dPair_second = dtb__85 } -> (Base_dResult.C_Base_dResult_dResult_Ok ({ Base_dPair.f_Base_dPair_dPair_first = (C_Vuna_dCompiler_dFrontend_dToml_dTomlValue_TStr (dtb__84)); Base_dPair.f_Base_dPair_dPair_second = dtb__85 }))
  | _ -> failwith "DT: impossible branch"
)
  | Base_dResult.C_Base_dResult_dResult_Err (dtb__86) -> (Base_dResult.C_Base_dResult_dResult_Err (dtb__86))
  | _ -> failwith "DT: impossible branch"
)) ((v_Vuna_dCompiler_dFrontend_dToml_dparseStringValue path) cs)) else (if (dtb__81 = 91) then ((v_Vuna_dCompiler_dFrontend_dToml_dparseStringArray path) cs) else (if (dtb__81 = 45) then ((v_Vuna_dCompiler_dFrontend_dToml_dparseIntValue path) cs) else (if (v_Vuna_dCompiler_dFrontend_dToml_disDigitChar dtb__81) then ((v_Vuna_dCompiler_dFrontend_dToml_dparseIntValue path) cs) else (match ((v_Vuna_dCompiler_dFrontend_dToml_dmatchWord "true") cs) with
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Just (dtb__87) -> (Base_dResult.C_Base_dResult_dResult_Ok ({ Base_dPair.f_Base_dPair_dPair_first = (C_Vuna_dCompiler_dFrontend_dToml_dTomlValue_TBool (true)); Base_dPair.f_Base_dPair_dPair_second = dtb__87 }))
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing -> (match ((v_Vuna_dCompiler_dFrontend_dToml_dmatchWord "false") cs) with
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Just (dtb__88) -> (Base_dResult.C_Base_dResult_dResult_Ok ({ Base_dPair.f_Base_dPair_dPair_first = (C_Vuna_dCompiler_dFrontend_dToml_dTomlValue_TBool (false)); Base_dPair.f_Base_dPair_dPair_second = dtb__88 }))
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing -> (((v_Vuna_dCompiler_dFrontend_dToml_dfailAt path) (cs).f_Vuna_dCompiler_dFrontend_dToml_dTomlCursor_cursorLine) "expected a value")
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
)))))
  | _ -> failwith "DT: impossible branch"
))

let rec v_Vuna_dCompiler_dFrontend_dToml_dparseSectionSegments = (fun fuel path cs acc -> (if (fuel <= 0) then (Base_dResult.C_Base_dResult_dResult_Err ("DT: toml fuel exhausted (internal: toml parser made no progress)")) else ((fun nd_uscrut4 -> (match nd_uscrut4 with
  | Base_dResult.C_Base_dResult_dResult_Ok (dtb__89) -> (match dtb__89 with
  | { Base_dPair.f_Base_dPair_dPair_first = dtb__90; Base_dPair.f_Base_dPair_dPair_second = dtb__91 } -> (match (v_Vuna_dCompiler_dFrontend_dToml_dskipBlank dtb__91) with
  | { f_Vuna_dCompiler_dFrontend_dToml_dTomlCursor_cursorChars = dtb__92; f_Vuna_dCompiler_dFrontend_dToml_dTomlCursor_cursorLine = dtb__93; f_Vuna_dCompiler_dFrontend_dToml_dTomlCursor_cursorCol = dtb__94 } -> (match dtb__92 with
  | Base_dList.C_Base_dList_dList_Nil -> (((v_Vuna_dCompiler_dFrontend_dToml_dfailAt path) dtb__93) "unterminated section header")
  | Base_dList.C_Base_dList_dList_Cons (dtb__95, dtb__96) -> (if (dtb__95 = 46) then ((((v_Vuna_dCompiler_dFrontend_dToml_dparseSectionSegments (fuel - 1)) path) { f_Vuna_dCompiler_dFrontend_dToml_dTomlCursor_cursorChars = dtb__96; f_Vuna_dCompiler_dFrontend_dToml_dTomlCursor_cursorLine = dtb__93; f_Vuna_dCompiler_dFrontend_dToml_dTomlCursor_cursorCol = (dtb__94 + 1) }) (Base_dList.C_Base_dList_dList_Cons (dtb__90, acc))) else (if (dtb__95 = 93) then (Base_dResult.C_Base_dResult_dResult_Ok ({ Base_dPair.f_Base_dPair_dPair_first = (Base_dList.v_Base_dList_dreverse (Base_dList.C_Base_dList_dList_Cons (dtb__90, acc))); Base_dPair.f_Base_dPair_dPair_second = { f_Vuna_dCompiler_dFrontend_dToml_dTomlCursor_cursorChars = dtb__96; f_Vuna_dCompiler_dFrontend_dToml_dTomlCursor_cursorLine = dtb__93; f_Vuna_dCompiler_dFrontend_dToml_dTomlCursor_cursorCol = (dtb__94 + 1) } })) else (((v_Vuna_dCompiler_dFrontend_dToml_dfailAt path) dtb__93) "expected '.' or ']' in section header")))
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
)
  | Base_dResult.C_Base_dResult_dResult_Err (dtb__97) -> (Base_dResult.C_Base_dResult_dResult_Err (dtb__97))
  | _ -> failwith "DT: impossible branch"
)) ((v_Vuna_dCompiler_dFrontend_dToml_dparseBareKey path) (v_Vuna_dCompiler_dFrontend_dToml_dskipBlank cs)))))

let v_Vuna_dCompiler_dFrontend_dToml_dparseSectionPath = (fun path cs -> ((((v_Vuna_dCompiler_dFrontend_dToml_dparseSectionSegments (v_Vuna_dCompiler_dFrontend_dToml_dcursorFuel cs)) path) cs) Base_dList.C_Base_dList_dList_Nil))

let v_Vuna_dCompiler_dFrontend_dToml_dexpectEolAfterComment = (fun path cs -> (match (v_Vuna_dCompiler_dFrontend_dToml_dskipComment cs) with
  | { f_Vuna_dCompiler_dFrontend_dToml_dTomlCursor_cursorChars = dtb__98; f_Vuna_dCompiler_dFrontend_dToml_dTomlCursor_cursorLine = dtb__99; f_Vuna_dCompiler_dFrontend_dToml_dTomlCursor_cursorCol = dtb__100 } -> (match dtb__98 with
  | Base_dList.C_Base_dList_dList_Nil -> (Base_dResult.C_Base_dResult_dResult_Ok ({ f_Vuna_dCompiler_dFrontend_dToml_dTomlCursor_cursorChars = dtb__98; f_Vuna_dCompiler_dFrontend_dToml_dTomlCursor_cursorLine = dtb__99; f_Vuna_dCompiler_dFrontend_dToml_dTomlCursor_cursorCol = dtb__100 }))
  | Base_dList.C_Base_dList_dList_Cons (dtb__101, dtb__102) -> (if (dtb__101 = 10) then (Base_dResult.C_Base_dResult_dResult_Ok ({ f_Vuna_dCompiler_dFrontend_dToml_dTomlCursor_cursorChars = dtb__102; f_Vuna_dCompiler_dFrontend_dToml_dTomlCursor_cursorLine = (dtb__99 + 1); f_Vuna_dCompiler_dFrontend_dToml_dTomlCursor_cursorCol = 1 })) else (((v_Vuna_dCompiler_dFrontend_dToml_dfailAt path) dtb__99) "unexpected character after comment"))
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
))

let v_Vuna_dCompiler_dFrontend_dToml_dexpectEol = (fun path cs -> (match (v_Vuna_dCompiler_dFrontend_dToml_dskipBlank cs) with
  | { f_Vuna_dCompiler_dFrontend_dToml_dTomlCursor_cursorChars = dtb__103; f_Vuna_dCompiler_dFrontend_dToml_dTomlCursor_cursorLine = dtb__104; f_Vuna_dCompiler_dFrontend_dToml_dTomlCursor_cursorCol = dtb__105 } -> (match dtb__103 with
  | Base_dList.C_Base_dList_dList_Nil -> (Base_dResult.C_Base_dResult_dResult_Ok ({ f_Vuna_dCompiler_dFrontend_dToml_dTomlCursor_cursorChars = dtb__103; f_Vuna_dCompiler_dFrontend_dToml_dTomlCursor_cursorLine = dtb__104; f_Vuna_dCompiler_dFrontend_dToml_dTomlCursor_cursorCol = dtb__105 }))
  | Base_dList.C_Base_dList_dList_Cons (dtb__106, dtb__107) -> (if (dtb__106 = 10) then (Base_dResult.C_Base_dResult_dResult_Ok ({ f_Vuna_dCompiler_dFrontend_dToml_dTomlCursor_cursorChars = dtb__107; f_Vuna_dCompiler_dFrontend_dToml_dTomlCursor_cursorLine = (dtb__104 + 1); f_Vuna_dCompiler_dFrontend_dToml_dTomlCursor_cursorCol = 1 })) else (if (dtb__106 = 35) then ((v_Vuna_dCompiler_dFrontend_dToml_dexpectEolAfterComment path) { f_Vuna_dCompiler_dFrontend_dToml_dTomlCursor_cursorChars = dtb__103; f_Vuna_dCompiler_dFrontend_dToml_dTomlCursor_cursorLine = dtb__104; f_Vuna_dCompiler_dFrontend_dToml_dTomlCursor_cursorCol = dtb__105 }) else (((v_Vuna_dCompiler_dFrontend_dToml_dfailAt path) (cs).f_Vuna_dCompiler_dFrontend_dToml_dTomlCursor_cursorLine) "unexpected character at end of line")))
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
))

let rec v_Vuna_dCompiler_dFrontend_dToml_dsamePath = (fun _uctx0 mc0 mc1 -> (match mc0 with
  | Base_dList.C_Base_dList_dList_Cons (dtb__108, dtb__109) -> (match mc1 with
  | Base_dList.C_Base_dList_dList_Cons (dtb__110, dtb__111) -> (if (((Base_dEq.v_Base_dEq_deq _uctx0) dtb__108) dtb__110) then (((v_Vuna_dCompiler_dFrontend_dToml_dsamePath _uctx0) dtb__109) dtb__111) else false)
  | _ -> false
)
  | Base_dList.C_Base_dList_dList_Nil -> (match mc1 with
  | Base_dList.C_Base_dList_dList_Nil -> true
  | _ -> false
)
  | _ -> failwith "DT: impossible branch"
))

let rec v_Vuna_dCompiler_dFrontend_dToml_dmemSectionPath = (fun _uctx0 mc0 mc1 -> (match mc1 with
  | Base_dList.C_Base_dList_dList_Cons (dtb__112, dtb__113) -> (if (((v_Vuna_dCompiler_dFrontend_dToml_dsamePath _uctx0) mc0) dtb__112) then true else (((v_Vuna_dCompiler_dFrontend_dToml_dmemSectionPath _uctx0) mc0) dtb__113))
  | Base_dList.C_Base_dList_dList_Nil -> false
  | _ -> failwith "DT: impossible branch"
))

let v_Vuna_dCompiler_dFrontend_dToml_dsectionSuffix = (fun mc0 -> (match mc0 with
  | Base_dList.C_Base_dList_dList_Cons (dtb__114, dtb__115) -> (String.concat "" [" in ["; (Vuna_dCompiler_dCommon.v_Vuna_dCompiler_dCommon_djoinDots mc0); "]"])
  | Base_dList.C_Base_dList_dList_Nil -> ""
  | _ -> failwith "DT: impossible branch"
))

let rec v_Vuna_dCompiler_dFrontend_dToml_dhasEntry = (fun mc0 mc1 mc2 -> (match mc2 with
  | Base_dList.C_Base_dList_dList_Cons (dtb__116, dtb__117) -> (match dtb__116 with
  | { f_Vuna_dCompiler_dFrontend_dToml_dTomlEntry_tomlEntrySection = dtb__118; f_Vuna_dCompiler_dFrontend_dToml_dTomlEntry_tomlEntryKey = dtb__119; f_Vuna_dCompiler_dFrontend_dToml_dTomlEntry_tomlEntryValue = dtb__120; f_Vuna_dCompiler_dFrontend_dToml_dTomlEntry_tomlEntryLine = dtb__121 } -> (if (if (((v_Vuna_dCompiler_dFrontend_dToml_dsamePath Base_dString.v_Eq_uString) mc0) dtb__118) then (dtb__119 = mc1) else false) then true else (((v_Vuna_dCompiler_dFrontend_dToml_dhasEntry mc0) mc1) dtb__117))
  | _ -> failwith "DT: impossible branch"
)
  | Base_dList.C_Base_dList_dList_Nil -> false
  | _ -> failwith "DT: impossible branch"
))

let rec v_Vuna_dCompiler_dFrontend_dToml_dparseEntryValue = (fun fuel path cs keyLine key section seen entries -> (if (fuel <= 0) then (Base_dResult.C_Base_dResult_dResult_Err ("DT: toml fuel exhausted (internal: toml parser made no progress)")) else ((fun nd_uscrut8 -> (match nd_uscrut8 with
  | Base_dResult.C_Base_dResult_dResult_Ok (dtb__122) -> (match dtb__122 with
  | { Base_dPair.f_Base_dPair_dPair_first = dtb__123; Base_dPair.f_Base_dPair_dPair_second = dtb__124 } -> (match ((v_Vuna_dCompiler_dFrontend_dToml_dexpectEol path) dtb__124) with
  | Base_dResult.C_Base_dResult_dResult_Err (dtb__125) -> (Base_dResult.C_Base_dResult_dResult_Err (dtb__125))
  | Base_dResult.C_Base_dResult_dResult_Ok (dtb__126) -> (if (((v_Vuna_dCompiler_dFrontend_dToml_dhasEntry section) key) entries) then (((v_Vuna_dCompiler_dFrontend_dToml_dfailAt path) keyLine) (String.concat "" ["duplicate key \""; key; "\""; (v_Vuna_dCompiler_dFrontend_dToml_dsectionSuffix section)])) else ((((((v_Vuna_dCompiler_dFrontend_dToml_dparseTomlLoop (fuel - 1)) path) dtb__126) section) seen) (Base_dList.C_Base_dList_dList_Cons ({ f_Vuna_dCompiler_dFrontend_dToml_dTomlEntry_tomlEntrySection = section; f_Vuna_dCompiler_dFrontend_dToml_dTomlEntry_tomlEntryKey = key; f_Vuna_dCompiler_dFrontend_dToml_dTomlEntry_tomlEntryValue = dtb__123; f_Vuna_dCompiler_dFrontend_dToml_dTomlEntry_tomlEntryLine = keyLine }, entries))))
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
)
  | Base_dResult.C_Base_dResult_dResult_Err (dtb__127) -> (Base_dResult.C_Base_dResult_dResult_Err (dtb__127))
  | _ -> failwith "DT: impossible branch"
)) ((v_Vuna_dCompiler_dFrontend_dToml_dparseValue path) (v_Vuna_dCompiler_dFrontend_dToml_dskipBlank cs)))))
and v_Vuna_dCompiler_dFrontend_dToml_dparseKeyLine = (fun fuel path cs section seen entries -> (if (fuel <= 0) then (Base_dResult.C_Base_dResult_dResult_Err ("DT: toml fuel exhausted (internal: toml parser made no progress)")) else ((fun nd_uscrut6 -> (match nd_uscrut6 with
  | Base_dResult.C_Base_dResult_dResult_Ok (dtb__128) -> (match dtb__128 with
  | { Base_dPair.f_Base_dPair_dPair_first = dtb__129; Base_dPair.f_Base_dPair_dPair_second = dtb__130 } -> (match (v_Vuna_dCompiler_dFrontend_dToml_dskipBlank dtb__130) with
  | { f_Vuna_dCompiler_dFrontend_dToml_dTomlCursor_cursorChars = dtb__131; f_Vuna_dCompiler_dFrontend_dToml_dTomlCursor_cursorLine = dtb__132; f_Vuna_dCompiler_dFrontend_dToml_dTomlCursor_cursorCol = dtb__133 } -> (match dtb__131 with
  | Base_dList.C_Base_dList_dList_Nil -> (((v_Vuna_dCompiler_dFrontend_dToml_dfailAt path) (cs).f_Vuna_dCompiler_dFrontend_dToml_dTomlCursor_cursorLine) "expected '=' after key")
  | Base_dList.C_Base_dList_dList_Cons (dtb__134, dtb__135) -> (if (dtb__134 = 61) then ((((((((v_Vuna_dCompiler_dFrontend_dToml_dparseEntryValue (fuel - 1)) path) { f_Vuna_dCompiler_dFrontend_dToml_dTomlCursor_cursorChars = dtb__135; f_Vuna_dCompiler_dFrontend_dToml_dTomlCursor_cursorLine = dtb__132; f_Vuna_dCompiler_dFrontend_dToml_dTomlCursor_cursorCol = (dtb__133 + 1) }) (cs).f_Vuna_dCompiler_dFrontend_dToml_dTomlCursor_cursorLine) dtb__129) section) seen) entries) else (((v_Vuna_dCompiler_dFrontend_dToml_dfailAt path) (cs).f_Vuna_dCompiler_dFrontend_dToml_dTomlCursor_cursorLine) (String.concat "" ["expected '=' after key \""; dtb__129; "\""])))
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
)
  | Base_dResult.C_Base_dResult_dResult_Err (dtb__136) -> (Base_dResult.C_Base_dResult_dResult_Err (dtb__136))
  | _ -> failwith "DT: impossible branch"
)) ((v_Vuna_dCompiler_dFrontend_dToml_dparseBareKey path) cs))))
and v_Vuna_dCompiler_dFrontend_dToml_dparseSectionLine = (fun fuel path cs section seen entries -> (if (fuel <= 0) then (Base_dResult.C_Base_dResult_dResult_Err ("DT: toml fuel exhausted (internal: toml parser made no progress)")) else ((fun nd_uscrut7 -> (match nd_uscrut7 with
  | Base_dResult.C_Base_dResult_dResult_Ok (dtb__137) -> (match dtb__137 with
  | { Base_dPair.f_Base_dPair_dPair_first = dtb__138; Base_dPair.f_Base_dPair_dPair_second = dtb__139 } -> (if (((v_Vuna_dCompiler_dFrontend_dToml_dmemSectionPath Base_dString.v_Eq_uString) dtb__138) seen) then (((v_Vuna_dCompiler_dFrontend_dToml_dfailAt path) (cs).f_Vuna_dCompiler_dFrontend_dToml_dTomlCursor_cursorLine) (String.concat "" ["duplicate section ["; (Vuna_dCompiler_dCommon.v_Vuna_dCompiler_dCommon_djoinDots dtb__138); "]"])) else (match ((v_Vuna_dCompiler_dFrontend_dToml_dexpectEol path) dtb__139) with
  | Base_dResult.C_Base_dResult_dResult_Err (dtb__140) -> (Base_dResult.C_Base_dResult_dResult_Err (dtb__140))
  | Base_dResult.C_Base_dResult_dResult_Ok (dtb__141) -> ((((((v_Vuna_dCompiler_dFrontend_dToml_dparseTomlLoop (fuel - 1)) path) dtb__141) dtb__138) (Base_dList.C_Base_dList_dList_Cons (dtb__138, seen))) entries)
  | _ -> failwith "DT: impossible branch"
))
  | _ -> failwith "DT: impossible branch"
)
  | Base_dResult.C_Base_dResult_dResult_Err (dtb__142) -> (Base_dResult.C_Base_dResult_dResult_Err (dtb__142))
  | _ -> failwith "DT: impossible branch"
)) ((v_Vuna_dCompiler_dFrontend_dToml_dparseSectionPath path) (v_Vuna_dCompiler_dFrontend_dToml_dadvanceCursor cs)))))
and v_Vuna_dCompiler_dFrontend_dToml_dparseTomlLoop = (fun fuel path cs section seen entries -> (if (fuel <= 0) then (Base_dResult.C_Base_dResult_dResult_Err ("DT: toml fuel exhausted (internal: toml parser made no progress)")) else ((((((v_Vuna_dCompiler_dFrontend_dToml_dparseTomlLoopAt (fuel - 1)) path) (v_Vuna_dCompiler_dFrontend_dToml_dskipGap cs)) section) seen) entries)))
and v_Vuna_dCompiler_dFrontend_dToml_dparseTomlLoopAt = (fun fuel path cs section seen entries -> (if (fuel <= 0) then (Base_dResult.C_Base_dResult_dResult_Err ("DT: toml fuel exhausted (internal: toml parser made no progress)")) else (match (cs).f_Vuna_dCompiler_dFrontend_dToml_dTomlCursor_cursorChars with
  | Base_dList.C_Base_dList_dList_Nil -> (Base_dResult.C_Base_dResult_dResult_Ok ((Base_dList.v_Base_dList_dreverse entries)))
  | Base_dList.C_Base_dList_dList_Cons (dtb__143, dtb__144) -> (if (dtb__143 = 91) then ((((((v_Vuna_dCompiler_dFrontend_dToml_dparseSectionLine (fuel - 1)) path) cs) section) seen) entries) else ((((((v_Vuna_dCompiler_dFrontend_dToml_dparseKeyLine (fuel - 1)) path) cs) section) seen) entries))
  | _ -> failwith "DT: impossible branch"
)))

let v_Vuna_dCompiler_dFrontend_dToml_dparseTomlAt = (fun path source -> ((fun cs -> ((((((v_Vuna_dCompiler_dFrontend_dToml_dparseTomlLoop (v_Vuna_dCompiler_dFrontend_dToml_dlineFuel cs)) path) cs) Base_dList.C_Base_dList_dList_Nil) Base_dList.C_Base_dList_dList_Nil) Base_dList.C_Base_dList_dList_Nil)) { f_Vuna_dCompiler_dFrontend_dToml_dTomlCursor_cursorChars = (v_Vuna_dCompiler_dFrontend_dToml_dstripCR (Base_dList.dtp_unpack source)); f_Vuna_dCompiler_dFrontend_dToml_dTomlCursor_cursorLine = 1; f_Vuna_dCompiler_dFrontend_dToml_dTomlCursor_cursorCol = 1 }))

let v_Vuna_dCompiler_dFrontend_dToml_dparseToml = (fun source -> ((v_Vuna_dCompiler_dFrontend_dToml_dparseTomlAt "") source))

let rec v_Vuna_dCompiler_dFrontend_dToml_dlookupEntry = (fun mc0 mc1 mc2 -> (match mc2 with
  | Base_dList.C_Base_dList_dList_Cons (dtb__145, dtb__146) -> (match dtb__145 with
  | { f_Vuna_dCompiler_dFrontend_dToml_dTomlEntry_tomlEntrySection = dtb__147; f_Vuna_dCompiler_dFrontend_dToml_dTomlEntry_tomlEntryKey = dtb__148; f_Vuna_dCompiler_dFrontend_dToml_dTomlEntry_tomlEntryValue = dtb__149; f_Vuna_dCompiler_dFrontend_dToml_dTomlEntry_tomlEntryLine = dtb__150 } -> (if (if (((v_Vuna_dCompiler_dFrontend_dToml_dsamePath Base_dString.v_Eq_uString) mc0) dtb__147) then (dtb__148 = mc1) else false) then (Base_dMaybe.C_Base_dMaybe_dMaybe_Just (dtb__149)) else (((v_Vuna_dCompiler_dFrontend_dToml_dlookupEntry mc0) mc1) dtb__146))
  | _ -> failwith "DT: impossible branch"
)
  | Base_dList.C_Base_dList_dList_Nil -> Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing
  | _ -> failwith "DT: impossible branch"
))

let rec v_Vuna_dCompiler_dFrontend_dToml_dlookupEntryLine = (fun mc0 mc1 mc2 -> (match mc2 with
  | Base_dList.C_Base_dList_dList_Cons (dtb__151, dtb__152) -> (match dtb__151 with
  | { f_Vuna_dCompiler_dFrontend_dToml_dTomlEntry_tomlEntrySection = dtb__153; f_Vuna_dCompiler_dFrontend_dToml_dTomlEntry_tomlEntryKey = dtb__154; f_Vuna_dCompiler_dFrontend_dToml_dTomlEntry_tomlEntryValue = dtb__155; f_Vuna_dCompiler_dFrontend_dToml_dTomlEntry_tomlEntryLine = dtb__156 } -> (if (if (((v_Vuna_dCompiler_dFrontend_dToml_dsamePath Base_dString.v_Eq_uString) mc0) dtb__153) then (dtb__154 = mc1) else false) then (Base_dMaybe.C_Base_dMaybe_dMaybe_Just (dtb__156)) else (((v_Vuna_dCompiler_dFrontend_dToml_dlookupEntryLine mc0) mc1) dtb__152))
  | _ -> failwith "DT: impossible branch"
)
  | Base_dList.C_Base_dList_dList_Nil -> Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing
  | _ -> failwith "DT: impossible branch"
))
