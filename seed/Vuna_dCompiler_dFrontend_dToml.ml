open Vuna_runtime
type t_Vuna_dCompiler_dFrontend_dToml_dTomlValue = C_Vuna_dCompiler_dFrontend_dToml_dTomlValue_Vuna_dCompiler_dFrontend_dToml_dTStr of (string) | C_Vuna_dCompiler_dFrontend_dToml_dTomlValue_Vuna_dCompiler_dFrontend_dToml_dTInt of (int) | C_Vuna_dCompiler_dFrontend_dToml_dTomlValue_Vuna_dCompiler_dFrontend_dToml_dTBool of (bool) | C_Vuna_dCompiler_dFrontend_dToml_dTomlValue_Vuna_dCompiler_dFrontend_dToml_dTList of (string Base_dList.t_Base_dList_dList)
and t_Vuna_dCompiler_dFrontend_dToml_dTomlEntry = C_Vuna_dCompiler_dFrontend_dToml_dTomlEntry_Vuna_dCompiler_dFrontend_dToml_dTomlEntry of (string Base_dList.t_Base_dList_dList) * (string) * (t_Vuna_dCompiler_dFrontend_dToml_dTomlValue) * (int)
and t_Vuna_dCompiler_dFrontend_dToml_dTomlCursor = C_Vuna_dCompiler_dFrontend_dToml_dTomlCursor_Vuna_dCompiler_dFrontend_dToml_dTomlCursor of (int Base_dList.t_Base_dList_dList) * (int) * (int)

let v_Vuna_dCompiler_dFrontend_dToml_dcursorFuel = (fun mc0 -> (match mc0 with
  | C_Vuna_dCompiler_dFrontend_dToml_dTomlCursor_Vuna_dCompiler_dFrontend_dToml_dTomlCursor (dtb__0, dtb__1, dtb__2) -> ((2 * (Base_dList.v_Base_dList_dlength dtb__0)) + 16)
  | _ -> failwith "DT: impossible branch"
))

let rec v_Vuna_dCompiler_dFrontend_dToml_dcountLines = (fun mc0 -> (match mc0 with
  | Base_dList.C_Base_dList_dList_Base_dList_dCons (dtb__3, dtb__4) -> (if (dtb__3 = 10) then (1 + (v_Vuna_dCompiler_dFrontend_dToml_dcountLines dtb__4)) else (v_Vuna_dCompiler_dFrontend_dToml_dcountLines dtb__4))
  | Base_dList.C_Base_dList_dList_Base_dList_dNil -> 1
  | _ -> failwith "DT: impossible branch"
))

let v_Vuna_dCompiler_dFrontend_dToml_dlineFuel = (fun mc0 -> (match mc0 with
  | C_Vuna_dCompiler_dFrontend_dToml_dTomlCursor_Vuna_dCompiler_dFrontend_dToml_dTomlCursor (dtb__5, dtb__6, dtb__7) -> ((4 * (v_Vuna_dCompiler_dFrontend_dToml_dcountLines dtb__5)) + 16)
  | _ -> failwith "DT: impossible branch"
))

let v_Vuna_dCompiler_dFrontend_dToml_dadvanceCursor = (fun mc0 -> (match mc0 with
  | C_Vuna_dCompiler_dFrontend_dToml_dTomlCursor_Vuna_dCompiler_dFrontend_dToml_dTomlCursor (dtb__8, dtb__9, dtb__10) -> (match dtb__8 with
  | Base_dList.C_Base_dList_dList_Base_dList_dCons (dtb__11, dtb__12) -> (if (dtb__11 = 10) then (C_Vuna_dCompiler_dFrontend_dToml_dTomlCursor_Vuna_dCompiler_dFrontend_dToml_dTomlCursor (dtb__12, (dtb__9 + 1), 1)) else (C_Vuna_dCompiler_dFrontend_dToml_dTomlCursor_Vuna_dCompiler_dFrontend_dToml_dTomlCursor (dtb__12, dtb__9, (dtb__10 + 1))))
  | Base_dList.C_Base_dList_dList_Base_dList_dNil -> (C_Vuna_dCompiler_dFrontend_dToml_dTomlCursor_Vuna_dCompiler_dFrontend_dToml_dTomlCursor (Base_dList.C_Base_dList_dList_Base_dList_dNil, dtb__9, dtb__10))
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
  | Base_dList.C_Base_dList_dList_Base_dList_dCons (dtb__13, dtb__14) -> (if (dtb__13 = 13) then (v_Vuna_dCompiler_dFrontend_dToml_dstripCR dtb__14) else (Base_dList.C_Base_dList_dList_Base_dList_dCons (dtb__13, (v_Vuna_dCompiler_dFrontend_dToml_dstripCR dtb__14))))
  | Base_dList.C_Base_dList_dList_Base_dList_dNil -> Base_dList.C_Base_dList_dList_Base_dList_dNil
  | _ -> failwith "DT: impossible branch"
))

let v_Vuna_dCompiler_dFrontend_dToml_dlocPrefix = (fun path line -> (if (path = "") then (String.concat "" ["line "; (bi_strFromInt line); ": "]) else (String.concat "" [path; ":"; (bi_strFromInt line); ": "])))

let v_Vuna_dCompiler_dFrontend_dToml_dfailAt = (fun path line msg -> (Base_dResult.C_Base_dResult_dResult_Base_dResult_dErr ((((v_Vuna_dCompiler_dFrontend_dToml_dlocPrefix path) line) ^ msg))))

let rec v_Vuna_dCompiler_dFrontend_dToml_dskipBlank = (fun mc0 -> (match mc0 with
  | C_Vuna_dCompiler_dFrontend_dToml_dTomlCursor_Vuna_dCompiler_dFrontend_dToml_dTomlCursor (dtb__15, dtb__16, dtb__17) -> (match dtb__15 with
  | Base_dList.C_Base_dList_dList_Base_dList_dCons (dtb__18, dtb__19) -> (if (v_Vuna_dCompiler_dFrontend_dToml_disBlankChar dtb__18) then (v_Vuna_dCompiler_dFrontend_dToml_dskipBlank (C_Vuna_dCompiler_dFrontend_dToml_dTomlCursor_Vuna_dCompiler_dFrontend_dToml_dTomlCursor (dtb__19, dtb__16, (dtb__17 + 1)))) else (C_Vuna_dCompiler_dFrontend_dToml_dTomlCursor_Vuna_dCompiler_dFrontend_dToml_dTomlCursor ((Base_dList.C_Base_dList_dList_Base_dList_dCons (dtb__18, dtb__19)), dtb__16, dtb__17)))
  | Base_dList.C_Base_dList_dList_Base_dList_dNil -> (C_Vuna_dCompiler_dFrontend_dToml_dTomlCursor_Vuna_dCompiler_dFrontend_dToml_dTomlCursor (Base_dList.C_Base_dList_dList_Base_dList_dNil, dtb__16, dtb__17))
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
))

let rec v_Vuna_dCompiler_dFrontend_dToml_dskipComment = (fun mc0 -> (match mc0 with
  | C_Vuna_dCompiler_dFrontend_dToml_dTomlCursor_Vuna_dCompiler_dFrontend_dToml_dTomlCursor (dtb__20, dtb__21, dtb__22) -> (match dtb__20 with
  | Base_dList.C_Base_dList_dList_Base_dList_dCons (dtb__23, dtb__24) -> (if (dtb__23 = 10) then (C_Vuna_dCompiler_dFrontend_dToml_dTomlCursor_Vuna_dCompiler_dFrontend_dToml_dTomlCursor ((Base_dList.C_Base_dList_dList_Base_dList_dCons (dtb__23, dtb__24)), dtb__21, dtb__22)) else (v_Vuna_dCompiler_dFrontend_dToml_dskipComment (C_Vuna_dCompiler_dFrontend_dToml_dTomlCursor_Vuna_dCompiler_dFrontend_dToml_dTomlCursor (dtb__24, dtb__21, (dtb__22 + 1)))))
  | Base_dList.C_Base_dList_dList_Base_dList_dNil -> (C_Vuna_dCompiler_dFrontend_dToml_dTomlCursor_Vuna_dCompiler_dFrontend_dToml_dTomlCursor (Base_dList.C_Base_dList_dList_Base_dList_dNil, dtb__21, dtb__22))
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
))

let rec v_Vuna_dCompiler_dFrontend_dToml_dskipGapGo = (fun mc0 mc1 -> (match mc1 with
  | C_Vuna_dCompiler_dFrontend_dToml_dTomlCursor_Vuna_dCompiler_dFrontend_dToml_dTomlCursor (dtb__25, dtb__26, dtb__27) -> (match dtb__25 with
  | Base_dList.C_Base_dList_dList_Base_dList_dCons (dtb__28, dtb__29) -> (if mc0 then (if (dtb__28 = 10) then ((v_Vuna_dCompiler_dFrontend_dToml_dskipGapGo false) (C_Vuna_dCompiler_dFrontend_dToml_dTomlCursor_Vuna_dCompiler_dFrontend_dToml_dTomlCursor (dtb__29, (dtb__26 + 1), 1))) else ((v_Vuna_dCompiler_dFrontend_dToml_dskipGapGo true) (C_Vuna_dCompiler_dFrontend_dToml_dTomlCursor_Vuna_dCompiler_dFrontend_dToml_dTomlCursor (dtb__29, dtb__26, (dtb__27 + 1))))) else (if (v_Vuna_dCompiler_dFrontend_dToml_disBlankChar dtb__28) then ((v_Vuna_dCompiler_dFrontend_dToml_dskipGapGo false) (C_Vuna_dCompiler_dFrontend_dToml_dTomlCursor_Vuna_dCompiler_dFrontend_dToml_dTomlCursor (dtb__29, dtb__26, (dtb__27 + 1)))) else (if (dtb__28 = 10) then ((v_Vuna_dCompiler_dFrontend_dToml_dskipGapGo false) (C_Vuna_dCompiler_dFrontend_dToml_dTomlCursor_Vuna_dCompiler_dFrontend_dToml_dTomlCursor (dtb__29, (dtb__26 + 1), 1))) else (if (dtb__28 = 35) then ((v_Vuna_dCompiler_dFrontend_dToml_dskipGapGo true) (C_Vuna_dCompiler_dFrontend_dToml_dTomlCursor_Vuna_dCompiler_dFrontend_dToml_dTomlCursor (dtb__29, dtb__26, (dtb__27 + 1)))) else (C_Vuna_dCompiler_dFrontend_dToml_dTomlCursor_Vuna_dCompiler_dFrontend_dToml_dTomlCursor ((Base_dList.C_Base_dList_dList_Base_dList_dCons (dtb__28, dtb__29)), dtb__26, dtb__27))))))
  | Base_dList.C_Base_dList_dList_Base_dList_dNil -> (C_Vuna_dCompiler_dFrontend_dToml_dTomlCursor_Vuna_dCompiler_dFrontend_dToml_dTomlCursor (Base_dList.C_Base_dList_dList_Base_dList_dNil, dtb__26, dtb__27))
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
))

let v_Vuna_dCompiler_dFrontend_dToml_dskipGap = (fun cs -> ((v_Vuna_dCompiler_dFrontend_dToml_dskipGapGo false) cs))

let rec v_Vuna_dCompiler_dFrontend_dToml_dcollectBareKey = (fun mc0 mc1 -> (match mc0 with
  | C_Vuna_dCompiler_dFrontend_dToml_dTomlCursor_Vuna_dCompiler_dFrontend_dToml_dTomlCursor (dtb__30, dtb__31, dtb__32) -> (match dtb__30 with
  | Base_dList.C_Base_dList_dList_Base_dList_dCons (dtb__33, dtb__34) -> (if (v_Vuna_dCompiler_dFrontend_dToml_disBareKeyChar dtb__33) then ((v_Vuna_dCompiler_dFrontend_dToml_dcollectBareKey (C_Vuna_dCompiler_dFrontend_dToml_dTomlCursor_Vuna_dCompiler_dFrontend_dToml_dTomlCursor (dtb__34, dtb__31, (dtb__32 + 1)))) (Base_dList.C_Base_dList_dList_Base_dList_dCons (dtb__33, mc1))) else (Base_dPair.C_Base_dPair_dPair_Base_dPair_dPair ((Base_dList.dtp_pack (Base_dList.v_Base_dList_dreverse mc1)), (C_Vuna_dCompiler_dFrontend_dToml_dTomlCursor_Vuna_dCompiler_dFrontend_dToml_dTomlCursor ((Base_dList.C_Base_dList_dList_Base_dList_dCons (dtb__33, dtb__34)), dtb__31, dtb__32)))))
  | Base_dList.C_Base_dList_dList_Base_dList_dNil -> (Base_dPair.C_Base_dPair_dPair_Base_dPair_dPair ((Base_dList.dtp_pack (Base_dList.v_Base_dList_dreverse mc1)), (C_Vuna_dCompiler_dFrontend_dToml_dTomlCursor_Vuna_dCompiler_dFrontend_dToml_dTomlCursor (Base_dList.C_Base_dList_dList_Base_dList_dNil, dtb__31, dtb__32))))
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
))

let v_Vuna_dCompiler_dFrontend_dToml_dparseBareKey = (fun path cs -> (match (match cs with
  | C_Vuna_dCompiler_dFrontend_dToml_dTomlCursor_Vuna_dCompiler_dFrontend_dToml_dTomlCursor (dtb__35, dtb__36, dtb__37) -> dtb__35
  | _ -> failwith "DT: impossible branch"
) with
  | Base_dList.C_Base_dList_dList_Base_dList_dNil -> (((v_Vuna_dCompiler_dFrontend_dToml_dfailAt path) (match cs with
  | C_Vuna_dCompiler_dFrontend_dToml_dTomlCursor_Vuna_dCompiler_dFrontend_dToml_dTomlCursor (dtb__38, dtb__39, dtb__40) -> dtb__39
  | _ -> failwith "DT: impossible branch"
)) "expected a key")
  | Base_dList.C_Base_dList_dList_Base_dList_dCons (dtb__41, dtb__42) -> (if (v_Vuna_dCompiler_dFrontend_dToml_disBareKeyChar dtb__41) then (match ((v_Vuna_dCompiler_dFrontend_dToml_dcollectBareKey cs) Base_dList.C_Base_dList_dList_Base_dList_dNil) with
  | Base_dPair.C_Base_dPair_dPair_Base_dPair_dPair (dtb__43, dtb__44) -> (Base_dResult.C_Base_dResult_dResult_Base_dResult_dOk ((Base_dPair.C_Base_dPair_dPair_Base_dPair_dPair (dtb__43, dtb__44))))
  | _ -> failwith "DT: impossible branch"
) else (((v_Vuna_dCompiler_dFrontend_dToml_dfailAt path) (match cs with
  | C_Vuna_dCompiler_dFrontend_dToml_dTomlCursor_Vuna_dCompiler_dFrontend_dToml_dTomlCursor (dtb__45, dtb__46, dtb__47) -> dtb__46
  | _ -> failwith "DT: impossible branch"
)) "expected a key"))
  | _ -> failwith "DT: impossible branch"
))

let rec v_Vuna_dCompiler_dFrontend_dToml_dparseStringChars = (fun fuel path startCs cs acc -> (if (fuel <= 0) then (Base_dResult.C_Base_dResult_dResult_Base_dResult_dErr ("DT: toml fuel exhausted (internal: toml parser made no progress)")) else (match (match cs with
  | C_Vuna_dCompiler_dFrontend_dToml_dTomlCursor_Vuna_dCompiler_dFrontend_dToml_dTomlCursor (dtb__48, dtb__49, dtb__50) -> dtb__48
  | _ -> failwith "DT: impossible branch"
) with
  | Base_dList.C_Base_dList_dList_Base_dList_dNil -> (((v_Vuna_dCompiler_dFrontend_dToml_dfailAt path) (match startCs with
  | C_Vuna_dCompiler_dFrontend_dToml_dTomlCursor_Vuna_dCompiler_dFrontend_dToml_dTomlCursor (dtb__51, dtb__52, dtb__53) -> dtb__52
  | _ -> failwith "DT: impossible branch"
)) "unterminated basic string")
  | Base_dList.C_Base_dList_dList_Base_dList_dCons (dtb__54, dtb__55) -> (if (dtb__54 = 34) then (Base_dResult.C_Base_dResult_dResult_Base_dResult_dOk ((Base_dPair.C_Base_dPair_dPair_Base_dPair_dPair ((Base_dList.dtp_pack (Base_dList.v_Base_dList_dreverse acc)), (v_Vuna_dCompiler_dFrontend_dToml_dadvanceCursor cs))))) else (if (dtb__54 = 10) then (((v_Vuna_dCompiler_dFrontend_dToml_dfailAt path) (match startCs with
  | C_Vuna_dCompiler_dFrontend_dToml_dTomlCursor_Vuna_dCompiler_dFrontend_dToml_dTomlCursor (dtb__56, dtb__57, dtb__58) -> dtb__57
  | _ -> failwith "DT: impossible branch"
)) "unterminated basic string (newline in string)") else (if (dtb__54 = 92) then (((((v_Vuna_dCompiler_dFrontend_dToml_dparseStringEscape (fuel - 1)) path) startCs) (v_Vuna_dCompiler_dFrontend_dToml_dadvanceCursor cs)) acc) else (((((v_Vuna_dCompiler_dFrontend_dToml_dparseStringChars (fuel - 1)) path) startCs) (v_Vuna_dCompiler_dFrontend_dToml_dadvanceCursor cs)) (Base_dList.C_Base_dList_dList_Base_dList_dCons (dtb__54, acc))))))
  | _ -> failwith "DT: impossible branch"
)))
and v_Vuna_dCompiler_dFrontend_dToml_dparseStringEscape = (fun fuel path startCs cs acc -> (if (fuel <= 0) then (Base_dResult.C_Base_dResult_dResult_Base_dResult_dErr ("DT: toml fuel exhausted (internal: toml parser made no progress)")) else (match (match cs with
  | C_Vuna_dCompiler_dFrontend_dToml_dTomlCursor_Vuna_dCompiler_dFrontend_dToml_dTomlCursor (dtb__59, dtb__60, dtb__61) -> dtb__59
  | _ -> failwith "DT: impossible branch"
) with
  | Base_dList.C_Base_dList_dList_Base_dList_dNil -> (((v_Vuna_dCompiler_dFrontend_dToml_dfailAt path) (match startCs with
  | C_Vuna_dCompiler_dFrontend_dToml_dTomlCursor_Vuna_dCompiler_dFrontend_dToml_dTomlCursor (dtb__62, dtb__63, dtb__64) -> dtb__63
  | _ -> failwith "DT: impossible branch"
)) "unterminated escape sequence")
  | Base_dList.C_Base_dList_dList_Base_dList_dCons (dtb__65, dtb__66) -> (if (dtb__65 = 110) then (((((v_Vuna_dCompiler_dFrontend_dToml_dparseStringChars (fuel - 1)) path) startCs) (v_Vuna_dCompiler_dFrontend_dToml_dadvanceCursor cs)) (Base_dList.C_Base_dList_dList_Base_dList_dCons (10, acc))) else (if (dtb__65 = 116) then (((((v_Vuna_dCompiler_dFrontend_dToml_dparseStringChars (fuel - 1)) path) startCs) (v_Vuna_dCompiler_dFrontend_dToml_dadvanceCursor cs)) (Base_dList.C_Base_dList_dList_Base_dList_dCons (9, acc))) else (if (dtb__65 = 114) then (((((v_Vuna_dCompiler_dFrontend_dToml_dparseStringChars (fuel - 1)) path) startCs) (v_Vuna_dCompiler_dFrontend_dToml_dadvanceCursor cs)) (Base_dList.C_Base_dList_dList_Base_dList_dCons (13, acc))) else (if (dtb__65 = 98) then (((((v_Vuna_dCompiler_dFrontend_dToml_dparseStringChars (fuel - 1)) path) startCs) (v_Vuna_dCompiler_dFrontend_dToml_dadvanceCursor cs)) (Base_dList.C_Base_dList_dList_Base_dList_dCons (8, acc))) else (if (dtb__65 = 102) then (((((v_Vuna_dCompiler_dFrontend_dToml_dparseStringChars (fuel - 1)) path) startCs) (v_Vuna_dCompiler_dFrontend_dToml_dadvanceCursor cs)) (Base_dList.C_Base_dList_dList_Base_dList_dCons (12, acc))) else (if (dtb__65 = 34) then (((((v_Vuna_dCompiler_dFrontend_dToml_dparseStringChars (fuel - 1)) path) startCs) (v_Vuna_dCompiler_dFrontend_dToml_dadvanceCursor cs)) (Base_dList.C_Base_dList_dList_Base_dList_dCons (34, acc))) else (if (dtb__65 = 92) then (((((v_Vuna_dCompiler_dFrontend_dToml_dparseStringChars (fuel - 1)) path) startCs) (v_Vuna_dCompiler_dFrontend_dToml_dadvanceCursor cs)) (Base_dList.C_Base_dList_dList_Base_dList_dCons (92, acc))) else (((v_Vuna_dCompiler_dFrontend_dToml_dfailAt path) (match cs with
  | C_Vuna_dCompiler_dFrontend_dToml_dTomlCursor_Vuna_dCompiler_dFrontend_dToml_dTomlCursor (dtb__67, dtb__68, dtb__69) -> dtb__68
  | _ -> failwith "DT: impossible branch"
)) ("unknown escape sequence \\" ^ (Base_dList.dtp_pack (Base_dList.C_Base_dList_dList_Base_dList_dCons (dtb__65, Base_dList.C_Base_dList_dList_Base_dList_dNil))))))))))))
  | _ -> failwith "DT: impossible branch"
)))

let v_Vuna_dCompiler_dFrontend_dToml_dparseStringValue = (fun path cs -> (match (match cs with
  | C_Vuna_dCompiler_dFrontend_dToml_dTomlCursor_Vuna_dCompiler_dFrontend_dToml_dTomlCursor (dtb__70, dtb__71, dtb__72) -> dtb__70
  | _ -> failwith "DT: impossible branch"
) with
  | Base_dList.C_Base_dList_dList_Base_dList_dNil -> (((v_Vuna_dCompiler_dFrontend_dToml_dfailAt path) (match cs with
  | C_Vuna_dCompiler_dFrontend_dToml_dTomlCursor_Vuna_dCompiler_dFrontend_dToml_dTomlCursor (dtb__73, dtb__74, dtb__75) -> dtb__74
  | _ -> failwith "DT: impossible branch"
)) "unterminated basic string")
  | Base_dList.C_Base_dList_dList_Base_dList_dCons (dtb__76, dtb__77) -> ((fun cs1 -> (((((v_Vuna_dCompiler_dFrontend_dToml_dparseStringChars (v_Vuna_dCompiler_dFrontend_dToml_dcursorFuel cs1)) path) cs) cs1) Base_dList.C_Base_dList_dList_Base_dList_dNil)) (v_Vuna_dCompiler_dFrontend_dToml_dadvanceCursor cs))
  | _ -> failwith "DT: impossible branch"
))

let v_Vuna_dCompiler_dFrontend_dToml_dmakeInteger = (fun acc negative -> (if negative then (0 - acc) else acc))

let v_Vuna_dCompiler_dFrontend_dToml_dfinishInteger = (fun path startCs cs count acc negative -> (if (count = 0) then (((v_Vuna_dCompiler_dFrontend_dToml_dfailAt path) (match startCs with
  | C_Vuna_dCompiler_dFrontend_dToml_dTomlCursor_Vuna_dCompiler_dFrontend_dToml_dTomlCursor (dtb__78, dtb__79, dtb__80) -> dtb__79
  | _ -> failwith "DT: impossible branch"
)) "expected digits for integer") else (match (match cs with
  | C_Vuna_dCompiler_dFrontend_dToml_dTomlCursor_Vuna_dCompiler_dFrontend_dToml_dTomlCursor (dtb__81, dtb__82, dtb__83) -> dtb__81
  | _ -> failwith "DT: impossible branch"
) with
  | Base_dList.C_Base_dList_dList_Base_dList_dNil -> (Base_dResult.C_Base_dResult_dResult_Base_dResult_dOk ((Base_dPair.C_Base_dPair_dPair_Base_dPair_dPair (((v_Vuna_dCompiler_dFrontend_dToml_dmakeInteger acc) negative), cs))))
  | Base_dList.C_Base_dList_dList_Base_dList_dCons (dtb__84, dtb__85) -> (if (dtb__84 = 46) then (((v_Vuna_dCompiler_dFrontend_dToml_dfailAt path) (match startCs with
  | C_Vuna_dCompiler_dFrontend_dToml_dTomlCursor_Vuna_dCompiler_dFrontend_dToml_dTomlCursor (dtb__86, dtb__87, dtb__88) -> dtb__87
  | _ -> failwith "DT: impossible branch"
)) "floating point numbers are not supported") else (if (v_Vuna_dCompiler_dFrontend_dToml_disBareKeyChar dtb__84) then (((v_Vuna_dCompiler_dFrontend_dToml_dfailAt path) (match startCs with
  | C_Vuna_dCompiler_dFrontend_dToml_dTomlCursor_Vuna_dCompiler_dFrontend_dToml_dTomlCursor (dtb__89, dtb__90, dtb__91) -> dtb__90
  | _ -> failwith "DT: impossible branch"
)) "invalid integer literal") else (Base_dResult.C_Base_dResult_dResult_Base_dResult_dOk ((Base_dPair.C_Base_dPair_dPair_Base_dPair_dPair (((v_Vuna_dCompiler_dFrontend_dToml_dmakeInteger acc) negative), cs))))))
  | _ -> failwith "DT: impossible branch"
)))

let rec v_Vuna_dCompiler_dFrontend_dToml_dparseIntegerDigits = (fun fuel path startCs cs count acc negative -> (if (fuel <= 0) then (Base_dResult.C_Base_dResult_dResult_Base_dResult_dErr ("DT: toml fuel exhausted (internal: toml parser made no progress)")) else (match (match cs with
  | C_Vuna_dCompiler_dFrontend_dToml_dTomlCursor_Vuna_dCompiler_dFrontend_dToml_dTomlCursor (dtb__92, dtb__93, dtb__94) -> dtb__92
  | _ -> failwith "DT: impossible branch"
) with
  | Base_dList.C_Base_dList_dList_Base_dList_dNil -> ((((((v_Vuna_dCompiler_dFrontend_dToml_dfinishInteger path) startCs) cs) count) acc) negative)
  | Base_dList.C_Base_dList_dList_Base_dList_dCons (dtb__95, dtb__96) -> (if (v_Vuna_dCompiler_dFrontend_dToml_disDigitChar dtb__95) then (((((((v_Vuna_dCompiler_dFrontend_dToml_dparseIntegerDigits (fuel - 1)) path) startCs) (v_Vuna_dCompiler_dFrontend_dToml_dadvanceCursor cs)) (count + 1)) ((acc * 10) + (dtb__95 - 48))) negative) else ((((((v_Vuna_dCompiler_dFrontend_dToml_dfinishInteger path) startCs) cs) count) acc) negative))
  | _ -> failwith "DT: impossible branch"
)))

let v_Vuna_dCompiler_dFrontend_dToml_dparseInteger = (fun path cs -> (match (match cs with
  | C_Vuna_dCompiler_dFrontend_dToml_dTomlCursor_Vuna_dCompiler_dFrontend_dToml_dTomlCursor (dtb__97, dtb__98, dtb__99) -> dtb__97
  | _ -> failwith "DT: impossible branch"
) with
  | Base_dList.C_Base_dList_dList_Base_dList_dNil -> (((v_Vuna_dCompiler_dFrontend_dToml_dfailAt path) (match cs with
  | C_Vuna_dCompiler_dFrontend_dToml_dTomlCursor_Vuna_dCompiler_dFrontend_dToml_dTomlCursor (dtb__100, dtb__101, dtb__102) -> dtb__101
  | _ -> failwith "DT: impossible branch"
)) "expected an integer")
  | Base_dList.C_Base_dList_dList_Base_dList_dCons (dtb__103, dtb__104) -> (if (dtb__103 = 45) then (((((((v_Vuna_dCompiler_dFrontend_dToml_dparseIntegerDigits (v_Vuna_dCompiler_dFrontend_dToml_dcursorFuel cs)) path) cs) (v_Vuna_dCompiler_dFrontend_dToml_dadvanceCursor cs)) 0) 0) true) else (if (v_Vuna_dCompiler_dFrontend_dToml_disDigitChar dtb__103) then (((((((v_Vuna_dCompiler_dFrontend_dToml_dparseIntegerDigits (v_Vuna_dCompiler_dFrontend_dToml_dcursorFuel cs)) path) cs) cs) 0) 0) false) else (((v_Vuna_dCompiler_dFrontend_dToml_dfailAt path) (match cs with
  | C_Vuna_dCompiler_dFrontend_dToml_dTomlCursor_Vuna_dCompiler_dFrontend_dToml_dTomlCursor (dtb__105, dtb__106, dtb__107) -> dtb__106
  | _ -> failwith "DT: impossible branch"
)) "expected an integer")))
  | _ -> failwith "DT: impossible branch"
))

let v_Vuna_dCompiler_dFrontend_dToml_dparseIntValue = (fun path cs -> ((fun nd_uscrut2 -> (match nd_uscrut2 with
  | Base_dResult.C_Base_dResult_dResult_Base_dResult_dOk (dtb__108) -> (match dtb__108 with
  | Base_dPair.C_Base_dPair_dPair_Base_dPair_dPair (dtb__109, dtb__110) -> (Base_dResult.C_Base_dResult_dResult_Base_dResult_dOk ((Base_dPair.C_Base_dPair_dPair_Base_dPair_dPair ((C_Vuna_dCompiler_dFrontend_dToml_dTomlValue_Vuna_dCompiler_dFrontend_dToml_dTInt (dtb__109)), dtb__110))))
  | _ -> failwith "DT: impossible branch"
)
  | Base_dResult.C_Base_dResult_dResult_Base_dResult_dErr (dtb__111) -> (Base_dResult.C_Base_dResult_dResult_Base_dResult_dErr (dtb__111))
  | _ -> failwith "DT: impossible branch"
)) ((v_Vuna_dCompiler_dFrontend_dToml_dparseInteger path) cs)))

let rec v_Vuna_dCompiler_dFrontend_dToml_dmatchChars = (fun mc0 mc1 -> (match mc0 with
  | Base_dList.C_Base_dList_dList_Base_dList_dCons (dtb__112, dtb__113) -> (match mc1 with
  | C_Vuna_dCompiler_dFrontend_dToml_dTomlCursor_Vuna_dCompiler_dFrontend_dToml_dTomlCursor (dtb__114, dtb__115, dtb__116) -> (match dtb__114 with
  | Base_dList.C_Base_dList_dList_Base_dList_dCons (dtb__117, dtb__118) -> (if (dtb__117 = dtb__112) then ((v_Vuna_dCompiler_dFrontend_dToml_dmatchChars dtb__113) (C_Vuna_dCompiler_dFrontend_dToml_dTomlCursor_Vuna_dCompiler_dFrontend_dToml_dTomlCursor (dtb__118, dtb__115, (dtb__116 + 1)))) else Base_dMaybe.C_Base_dMaybe_dMaybe_Base_dMaybe_dNothing)
  | Base_dList.C_Base_dList_dList_Base_dList_dNil -> Base_dMaybe.C_Base_dMaybe_dMaybe_Base_dMaybe_dNothing
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
)
  | Base_dList.C_Base_dList_dList_Base_dList_dNil -> (Base_dMaybe.C_Base_dMaybe_dMaybe_Base_dMaybe_dJust (mc1))
  | _ -> failwith "DT: impossible branch"
))

let v_Vuna_dCompiler_dFrontend_dToml_dmatchWord = (fun word cs -> (match ((v_Vuna_dCompiler_dFrontend_dToml_dmatchChars (Base_dList.dtp_unpack word)) cs) with
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Base_dMaybe_dNothing -> Base_dMaybe.C_Base_dMaybe_dMaybe_Base_dMaybe_dNothing
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Base_dMaybe_dJust (dtb__119) -> (match (match dtb__119 with
  | C_Vuna_dCompiler_dFrontend_dToml_dTomlCursor_Vuna_dCompiler_dFrontend_dToml_dTomlCursor (dtb__120, dtb__121, dtb__122) -> dtb__120
  | _ -> failwith "DT: impossible branch"
) with
  | Base_dList.C_Base_dList_dList_Base_dList_dNil -> (Base_dMaybe.C_Base_dMaybe_dMaybe_Base_dMaybe_dJust (dtb__119))
  | Base_dList.C_Base_dList_dList_Base_dList_dCons (dtb__123, dtb__124) -> (if (v_Vuna_dCompiler_dFrontend_dToml_disBareKeyChar dtb__123) then Base_dMaybe.C_Base_dMaybe_dMaybe_Base_dMaybe_dNothing else (Base_dMaybe.C_Base_dMaybe_dMaybe_Base_dMaybe_dJust (dtb__119)))
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
))

let rec v_Vuna_dCompiler_dFrontend_dToml_dparseArrayItems = (fun fuel path cs acc -> (if (fuel <= 0) then (Base_dResult.C_Base_dResult_dResult_Base_dResult_dErr ("DT: toml fuel exhausted (internal: toml parser made no progress)")) else (match (v_Vuna_dCompiler_dFrontend_dToml_dskipGap cs) with
  | C_Vuna_dCompiler_dFrontend_dToml_dTomlCursor_Vuna_dCompiler_dFrontend_dToml_dTomlCursor (dtb__125, dtb__126, dtb__127) -> (match dtb__125 with
  | Base_dList.C_Base_dList_dList_Base_dList_dNil -> (((v_Vuna_dCompiler_dFrontend_dToml_dfailAt path) dtb__126) "unterminated array")
  | Base_dList.C_Base_dList_dList_Base_dList_dCons (dtb__128, dtb__129) -> (if (dtb__128 = 93) then (Base_dResult.C_Base_dResult_dResult_Base_dResult_dOk ((Base_dPair.C_Base_dPair_dPair_Base_dPair_dPair ((C_Vuna_dCompiler_dFrontend_dToml_dTomlValue_Vuna_dCompiler_dFrontend_dToml_dTList ((Base_dList.v_Base_dList_dreverse acc))), (v_Vuna_dCompiler_dFrontend_dToml_dadvanceCursor (C_Vuna_dCompiler_dFrontend_dToml_dTomlCursor_Vuna_dCompiler_dFrontend_dToml_dTomlCursor (dtb__125, dtb__126, dtb__127))))))) else (if (dtb__128 = 34) then ((((v_Vuna_dCompiler_dFrontend_dToml_dparseArrayString (fuel - 1)) path) (C_Vuna_dCompiler_dFrontend_dToml_dTomlCursor_Vuna_dCompiler_dFrontend_dToml_dTomlCursor (dtb__125, dtb__126, dtb__127))) acc) else (((v_Vuna_dCompiler_dFrontend_dToml_dfailAt path) dtb__126) "expected a string in array")))
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
)))
and v_Vuna_dCompiler_dFrontend_dToml_dparseArrayString = (fun fuel path cs acc -> (if (fuel <= 0) then (Base_dResult.C_Base_dResult_dResult_Base_dResult_dErr ("DT: toml fuel exhausted (internal: toml parser made no progress)")) else ((fun nd_uscrut4 -> (match nd_uscrut4 with
  | Base_dResult.C_Base_dResult_dResult_Base_dResult_dOk (dtb__130) -> (match dtb__130 with
  | Base_dPair.C_Base_dPair_dPair_Base_dPair_dPair (dtb__131, dtb__132) -> (match (v_Vuna_dCompiler_dFrontend_dToml_dskipGap dtb__132) with
  | C_Vuna_dCompiler_dFrontend_dToml_dTomlCursor_Vuna_dCompiler_dFrontend_dToml_dTomlCursor (dtb__133, dtb__134, dtb__135) -> (match dtb__133 with
  | Base_dList.C_Base_dList_dList_Base_dList_dNil -> (((v_Vuna_dCompiler_dFrontend_dToml_dfailAt path) dtb__134) "unterminated array")
  | Base_dList.C_Base_dList_dList_Base_dList_dCons (dtb__136, dtb__137) -> (if (dtb__136 = 44) then ((((v_Vuna_dCompiler_dFrontend_dToml_dparseArrayItems (fuel - 1)) path) (v_Vuna_dCompiler_dFrontend_dToml_dadvanceCursor (C_Vuna_dCompiler_dFrontend_dToml_dTomlCursor_Vuna_dCompiler_dFrontend_dToml_dTomlCursor (dtb__133, dtb__134, dtb__135)))) (Base_dList.C_Base_dList_dList_Base_dList_dCons (dtb__131, acc))) else (if (dtb__136 = 93) then (Base_dResult.C_Base_dResult_dResult_Base_dResult_dOk ((Base_dPair.C_Base_dPair_dPair_Base_dPair_dPair ((C_Vuna_dCompiler_dFrontend_dToml_dTomlValue_Vuna_dCompiler_dFrontend_dToml_dTList ((Base_dList.v_Base_dList_dreverse (Base_dList.C_Base_dList_dList_Base_dList_dCons (dtb__131, acc))))), (v_Vuna_dCompiler_dFrontend_dToml_dadvanceCursor (C_Vuna_dCompiler_dFrontend_dToml_dTomlCursor_Vuna_dCompiler_dFrontend_dToml_dTomlCursor (dtb__133, dtb__134, dtb__135))))))) else (((v_Vuna_dCompiler_dFrontend_dToml_dfailAt path) dtb__134) "expected ',' or ']' in array")))
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
)
  | Base_dResult.C_Base_dResult_dResult_Base_dResult_dErr (dtb__138) -> (Base_dResult.C_Base_dResult_dResult_Base_dResult_dErr (dtb__138))
  | _ -> failwith "DT: impossible branch"
)) ((v_Vuna_dCompiler_dFrontend_dToml_dparseStringValue path) cs))))

let v_Vuna_dCompiler_dFrontend_dToml_dparseStringArray = (fun path cs -> (match (match cs with
  | C_Vuna_dCompiler_dFrontend_dToml_dTomlCursor_Vuna_dCompiler_dFrontend_dToml_dTomlCursor (dtb__139, dtb__140, dtb__141) -> dtb__139
  | _ -> failwith "DT: impossible branch"
) with
  | Base_dList.C_Base_dList_dList_Base_dList_dNil -> (((v_Vuna_dCompiler_dFrontend_dToml_dfailAt path) (match cs with
  | C_Vuna_dCompiler_dFrontend_dToml_dTomlCursor_Vuna_dCompiler_dFrontend_dToml_dTomlCursor (dtb__142, dtb__143, dtb__144) -> dtb__143
  | _ -> failwith "DT: impossible branch"
)) "unterminated array")
  | Base_dList.C_Base_dList_dList_Base_dList_dCons (dtb__145, dtb__146) -> ((fun cs1 -> ((((v_Vuna_dCompiler_dFrontend_dToml_dparseArrayItems (v_Vuna_dCompiler_dFrontend_dToml_dcursorFuel cs1)) path) cs1) Base_dList.C_Base_dList_dList_Base_dList_dNil)) (v_Vuna_dCompiler_dFrontend_dToml_dadvanceCursor cs))
  | _ -> failwith "DT: impossible branch"
))

let v_Vuna_dCompiler_dFrontend_dToml_dparseValue = (fun path cs -> (match (match cs with
  | C_Vuna_dCompiler_dFrontend_dToml_dTomlCursor_Vuna_dCompiler_dFrontend_dToml_dTomlCursor (dtb__147, dtb__148, dtb__149) -> dtb__147
  | _ -> failwith "DT: impossible branch"
) with
  | Base_dList.C_Base_dList_dList_Base_dList_dNil -> (((v_Vuna_dCompiler_dFrontend_dToml_dfailAt path) (match cs with
  | C_Vuna_dCompiler_dFrontend_dToml_dTomlCursor_Vuna_dCompiler_dFrontend_dToml_dTomlCursor (dtb__150, dtb__151, dtb__152) -> dtb__151
  | _ -> failwith "DT: impossible branch"
)) "expected a value")
  | Base_dList.C_Base_dList_dList_Base_dList_dCons (dtb__153, dtb__154) -> (if (dtb__153 = 34) then ((fun nd_uscrut5 -> (match nd_uscrut5 with
  | Base_dResult.C_Base_dResult_dResult_Base_dResult_dOk (dtb__155) -> (match dtb__155 with
  | Base_dPair.C_Base_dPair_dPair_Base_dPair_dPair (dtb__156, dtb__157) -> (Base_dResult.C_Base_dResult_dResult_Base_dResult_dOk ((Base_dPair.C_Base_dPair_dPair_Base_dPair_dPair ((C_Vuna_dCompiler_dFrontend_dToml_dTomlValue_Vuna_dCompiler_dFrontend_dToml_dTStr (dtb__156)), dtb__157))))
  | _ -> failwith "DT: impossible branch"
)
  | Base_dResult.C_Base_dResult_dResult_Base_dResult_dErr (dtb__158) -> (Base_dResult.C_Base_dResult_dResult_Base_dResult_dErr (dtb__158))
  | _ -> failwith "DT: impossible branch"
)) ((v_Vuna_dCompiler_dFrontend_dToml_dparseStringValue path) cs)) else (if (dtb__153 = 91) then ((v_Vuna_dCompiler_dFrontend_dToml_dparseStringArray path) cs) else (if (dtb__153 = 45) then ((v_Vuna_dCompiler_dFrontend_dToml_dparseIntValue path) cs) else (if (v_Vuna_dCompiler_dFrontend_dToml_disDigitChar dtb__153) then ((v_Vuna_dCompiler_dFrontend_dToml_dparseIntValue path) cs) else (match ((v_Vuna_dCompiler_dFrontend_dToml_dmatchWord "true") cs) with
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Base_dMaybe_dJust (dtb__159) -> (Base_dResult.C_Base_dResult_dResult_Base_dResult_dOk ((Base_dPair.C_Base_dPair_dPair_Base_dPair_dPair ((C_Vuna_dCompiler_dFrontend_dToml_dTomlValue_Vuna_dCompiler_dFrontend_dToml_dTBool (true)), dtb__159))))
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Base_dMaybe_dNothing -> (match ((v_Vuna_dCompiler_dFrontend_dToml_dmatchWord "false") cs) with
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Base_dMaybe_dJust (dtb__160) -> (Base_dResult.C_Base_dResult_dResult_Base_dResult_dOk ((Base_dPair.C_Base_dPair_dPair_Base_dPair_dPair ((C_Vuna_dCompiler_dFrontend_dToml_dTomlValue_Vuna_dCompiler_dFrontend_dToml_dTBool (false)), dtb__160))))
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Base_dMaybe_dNothing -> (((v_Vuna_dCompiler_dFrontend_dToml_dfailAt path) (match cs with
  | C_Vuna_dCompiler_dFrontend_dToml_dTomlCursor_Vuna_dCompiler_dFrontend_dToml_dTomlCursor (dtb__161, dtb__162, dtb__163) -> dtb__162
  | _ -> failwith "DT: impossible branch"
)) "expected a value")
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
)))))
  | _ -> failwith "DT: impossible branch"
))

let rec v_Vuna_dCompiler_dFrontend_dToml_dparseSectionSegments = (fun fuel path cs acc -> (if (fuel <= 0) then (Base_dResult.C_Base_dResult_dResult_Base_dResult_dErr ("DT: toml fuel exhausted (internal: toml parser made no progress)")) else ((fun nd_uscrut4 -> (match nd_uscrut4 with
  | Base_dResult.C_Base_dResult_dResult_Base_dResult_dOk (dtb__164) -> (match dtb__164 with
  | Base_dPair.C_Base_dPair_dPair_Base_dPair_dPair (dtb__165, dtb__166) -> (match (v_Vuna_dCompiler_dFrontend_dToml_dskipBlank dtb__166) with
  | C_Vuna_dCompiler_dFrontend_dToml_dTomlCursor_Vuna_dCompiler_dFrontend_dToml_dTomlCursor (dtb__167, dtb__168, dtb__169) -> (match dtb__167 with
  | Base_dList.C_Base_dList_dList_Base_dList_dNil -> (((v_Vuna_dCompiler_dFrontend_dToml_dfailAt path) dtb__168) "unterminated section header")
  | Base_dList.C_Base_dList_dList_Base_dList_dCons (dtb__170, dtb__171) -> (if (dtb__170 = 46) then ((((v_Vuna_dCompiler_dFrontend_dToml_dparseSectionSegments (fuel - 1)) path) (C_Vuna_dCompiler_dFrontend_dToml_dTomlCursor_Vuna_dCompiler_dFrontend_dToml_dTomlCursor (dtb__171, dtb__168, (dtb__169 + 1)))) (Base_dList.C_Base_dList_dList_Base_dList_dCons (dtb__165, acc))) else (if (dtb__170 = 93) then (Base_dResult.C_Base_dResult_dResult_Base_dResult_dOk ((Base_dPair.C_Base_dPair_dPair_Base_dPair_dPair ((Base_dList.v_Base_dList_dreverse (Base_dList.C_Base_dList_dList_Base_dList_dCons (dtb__165, acc))), (C_Vuna_dCompiler_dFrontend_dToml_dTomlCursor_Vuna_dCompiler_dFrontend_dToml_dTomlCursor (dtb__171, dtb__168, (dtb__169 + 1))))))) else (((v_Vuna_dCompiler_dFrontend_dToml_dfailAt path) dtb__168) "expected '.' or ']' in section header")))
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
)
  | Base_dResult.C_Base_dResult_dResult_Base_dResult_dErr (dtb__172) -> (Base_dResult.C_Base_dResult_dResult_Base_dResult_dErr (dtb__172))
  | _ -> failwith "DT: impossible branch"
)) ((v_Vuna_dCompiler_dFrontend_dToml_dparseBareKey path) (v_Vuna_dCompiler_dFrontend_dToml_dskipBlank cs)))))

let v_Vuna_dCompiler_dFrontend_dToml_dparseSectionPath = (fun path cs -> ((((v_Vuna_dCompiler_dFrontend_dToml_dparseSectionSegments (v_Vuna_dCompiler_dFrontend_dToml_dcursorFuel cs)) path) cs) Base_dList.C_Base_dList_dList_Base_dList_dNil))

let v_Vuna_dCompiler_dFrontend_dToml_dexpectEolAfterComment = (fun path cs -> (match (v_Vuna_dCompiler_dFrontend_dToml_dskipComment cs) with
  | C_Vuna_dCompiler_dFrontend_dToml_dTomlCursor_Vuna_dCompiler_dFrontend_dToml_dTomlCursor (dtb__173, dtb__174, dtb__175) -> (match dtb__173 with
  | Base_dList.C_Base_dList_dList_Base_dList_dNil -> (Base_dResult.C_Base_dResult_dResult_Base_dResult_dOk ((C_Vuna_dCompiler_dFrontend_dToml_dTomlCursor_Vuna_dCompiler_dFrontend_dToml_dTomlCursor (dtb__173, dtb__174, dtb__175))))
  | Base_dList.C_Base_dList_dList_Base_dList_dCons (dtb__176, dtb__177) -> (if (dtb__176 = 10) then (Base_dResult.C_Base_dResult_dResult_Base_dResult_dOk ((C_Vuna_dCompiler_dFrontend_dToml_dTomlCursor_Vuna_dCompiler_dFrontend_dToml_dTomlCursor (dtb__177, (dtb__174 + 1), 1)))) else (((v_Vuna_dCompiler_dFrontend_dToml_dfailAt path) dtb__174) "unexpected character after comment"))
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
))

let v_Vuna_dCompiler_dFrontend_dToml_dexpectEol = (fun path cs -> (match (v_Vuna_dCompiler_dFrontend_dToml_dskipBlank cs) with
  | C_Vuna_dCompiler_dFrontend_dToml_dTomlCursor_Vuna_dCompiler_dFrontend_dToml_dTomlCursor (dtb__178, dtb__179, dtb__180) -> (match dtb__178 with
  | Base_dList.C_Base_dList_dList_Base_dList_dNil -> (Base_dResult.C_Base_dResult_dResult_Base_dResult_dOk ((C_Vuna_dCompiler_dFrontend_dToml_dTomlCursor_Vuna_dCompiler_dFrontend_dToml_dTomlCursor (dtb__178, dtb__179, dtb__180))))
  | Base_dList.C_Base_dList_dList_Base_dList_dCons (dtb__181, dtb__182) -> (if (dtb__181 = 10) then (Base_dResult.C_Base_dResult_dResult_Base_dResult_dOk ((C_Vuna_dCompiler_dFrontend_dToml_dTomlCursor_Vuna_dCompiler_dFrontend_dToml_dTomlCursor (dtb__182, (dtb__179 + 1), 1)))) else (if (dtb__181 = 35) then ((v_Vuna_dCompiler_dFrontend_dToml_dexpectEolAfterComment path) (C_Vuna_dCompiler_dFrontend_dToml_dTomlCursor_Vuna_dCompiler_dFrontend_dToml_dTomlCursor (dtb__178, dtb__179, dtb__180))) else (((v_Vuna_dCompiler_dFrontend_dToml_dfailAt path) (match cs with
  | C_Vuna_dCompiler_dFrontend_dToml_dTomlCursor_Vuna_dCompiler_dFrontend_dToml_dTomlCursor (dtb__183, dtb__184, dtb__185) -> dtb__184
  | _ -> failwith "DT: impossible branch"
)) "unexpected character at end of line")))
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
))

let rec v_Vuna_dCompiler_dFrontend_dToml_dsamePath = (fun _uctx0 mc0 mc1 -> (match mc0 with
  | Base_dList.C_Base_dList_dList_Base_dList_dCons (dtb__186, dtb__187) -> (match mc1 with
  | Base_dList.C_Base_dList_dList_Base_dList_dCons (dtb__188, dtb__189) -> (if (((Base_dEq.v_Base_dEq_deq _uctx0) dtb__186) dtb__188) then (((v_Vuna_dCompiler_dFrontend_dToml_dsamePath _uctx0) dtb__187) dtb__189) else false)
  | _ -> false
)
  | Base_dList.C_Base_dList_dList_Base_dList_dNil -> (match mc1 with
  | Base_dList.C_Base_dList_dList_Base_dList_dNil -> true
  | _ -> false
)
  | _ -> failwith "DT: impossible branch"
))

let rec v_Vuna_dCompiler_dFrontend_dToml_dmemSectionPath = (fun _uctx0 mc0 mc1 -> (match mc1 with
  | Base_dList.C_Base_dList_dList_Base_dList_dCons (dtb__190, dtb__191) -> (if (((v_Vuna_dCompiler_dFrontend_dToml_dsamePath _uctx0) mc0) dtb__190) then true else (((v_Vuna_dCompiler_dFrontend_dToml_dmemSectionPath _uctx0) mc0) dtb__191))
  | Base_dList.C_Base_dList_dList_Base_dList_dNil -> false
  | _ -> failwith "DT: impossible branch"
))

let v_Vuna_dCompiler_dFrontend_dToml_dsectionSuffix = (fun mc0 -> (match mc0 with
  | Base_dList.C_Base_dList_dList_Base_dList_dCons (dtb__192, dtb__193) -> (String.concat "" [" in ["; (Vuna_dCompiler_dCommon.v_Vuna_dCompiler_dCommon_djoinDots mc0); "]"])
  | Base_dList.C_Base_dList_dList_Base_dList_dNil -> ""
  | _ -> failwith "DT: impossible branch"
))

let rec v_Vuna_dCompiler_dFrontend_dToml_dhasEntry = (fun mc0 mc1 mc2 -> (match mc2 with
  | Base_dList.C_Base_dList_dList_Base_dList_dCons (dtb__194, dtb__195) -> (match dtb__194 with
  | C_Vuna_dCompiler_dFrontend_dToml_dTomlEntry_Vuna_dCompiler_dFrontend_dToml_dTomlEntry (dtb__196, dtb__197, dtb__198, dtb__199) -> (if (if (((v_Vuna_dCompiler_dFrontend_dToml_dsamePath Base_dString.v_Eq_uString) mc0) dtb__196) then (dtb__197 = mc1) else false) then true else (((v_Vuna_dCompiler_dFrontend_dToml_dhasEntry mc0) mc1) dtb__195))
  | _ -> failwith "DT: impossible branch"
)
  | Base_dList.C_Base_dList_dList_Base_dList_dNil -> false
  | _ -> failwith "DT: impossible branch"
))

let rec v_Vuna_dCompiler_dFrontend_dToml_dparseEntryValue = (fun fuel path cs keyLine key section seen entries -> (if (fuel <= 0) then (Base_dResult.C_Base_dResult_dResult_Base_dResult_dErr ("DT: toml fuel exhausted (internal: toml parser made no progress)")) else ((fun nd_uscrut8 -> (match nd_uscrut8 with
  | Base_dResult.C_Base_dResult_dResult_Base_dResult_dOk (dtb__200) -> (match dtb__200 with
  | Base_dPair.C_Base_dPair_dPair_Base_dPair_dPair (dtb__201, dtb__202) -> (match ((v_Vuna_dCompiler_dFrontend_dToml_dexpectEol path) dtb__202) with
  | Base_dResult.C_Base_dResult_dResult_Base_dResult_dErr (dtb__203) -> (Base_dResult.C_Base_dResult_dResult_Base_dResult_dErr (dtb__203))
  | Base_dResult.C_Base_dResult_dResult_Base_dResult_dOk (dtb__204) -> (if (((v_Vuna_dCompiler_dFrontend_dToml_dhasEntry section) key) entries) then (((v_Vuna_dCompiler_dFrontend_dToml_dfailAt path) keyLine) (String.concat "" ["duplicate key \""; key; "\""; (v_Vuna_dCompiler_dFrontend_dToml_dsectionSuffix section)])) else ((((((v_Vuna_dCompiler_dFrontend_dToml_dparseTomlLoop (fuel - 1)) path) dtb__204) section) seen) (Base_dList.C_Base_dList_dList_Base_dList_dCons ((C_Vuna_dCompiler_dFrontend_dToml_dTomlEntry_Vuna_dCompiler_dFrontend_dToml_dTomlEntry (section, key, dtb__201, keyLine)), entries))))
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
)
  | Base_dResult.C_Base_dResult_dResult_Base_dResult_dErr (dtb__205) -> (Base_dResult.C_Base_dResult_dResult_Base_dResult_dErr (dtb__205))
  | _ -> failwith "DT: impossible branch"
)) ((v_Vuna_dCompiler_dFrontend_dToml_dparseValue path) (v_Vuna_dCompiler_dFrontend_dToml_dskipBlank cs)))))
and v_Vuna_dCompiler_dFrontend_dToml_dparseKeyLine = (fun fuel path cs section seen entries -> (if (fuel <= 0) then (Base_dResult.C_Base_dResult_dResult_Base_dResult_dErr ("DT: toml fuel exhausted (internal: toml parser made no progress)")) else ((fun nd_uscrut6 -> (match nd_uscrut6 with
  | Base_dResult.C_Base_dResult_dResult_Base_dResult_dOk (dtb__206) -> (match dtb__206 with
  | Base_dPair.C_Base_dPair_dPair_Base_dPair_dPair (dtb__207, dtb__208) -> (match (v_Vuna_dCompiler_dFrontend_dToml_dskipBlank dtb__208) with
  | C_Vuna_dCompiler_dFrontend_dToml_dTomlCursor_Vuna_dCompiler_dFrontend_dToml_dTomlCursor (dtb__209, dtb__210, dtb__211) -> (match dtb__209 with
  | Base_dList.C_Base_dList_dList_Base_dList_dNil -> (((v_Vuna_dCompiler_dFrontend_dToml_dfailAt path) (match cs with
  | C_Vuna_dCompiler_dFrontend_dToml_dTomlCursor_Vuna_dCompiler_dFrontend_dToml_dTomlCursor (dtb__212, dtb__213, dtb__214) -> dtb__213
  | _ -> failwith "DT: impossible branch"
)) "expected '=' after key")
  | Base_dList.C_Base_dList_dList_Base_dList_dCons (dtb__215, dtb__216) -> (if (dtb__215 = 61) then ((((((((v_Vuna_dCompiler_dFrontend_dToml_dparseEntryValue (fuel - 1)) path) (C_Vuna_dCompiler_dFrontend_dToml_dTomlCursor_Vuna_dCompiler_dFrontend_dToml_dTomlCursor (dtb__216, dtb__210, (dtb__211 + 1)))) (match cs with
  | C_Vuna_dCompiler_dFrontend_dToml_dTomlCursor_Vuna_dCompiler_dFrontend_dToml_dTomlCursor (dtb__217, dtb__218, dtb__219) -> dtb__218
  | _ -> failwith "DT: impossible branch"
)) dtb__207) section) seen) entries) else (((v_Vuna_dCompiler_dFrontend_dToml_dfailAt path) (match cs with
  | C_Vuna_dCompiler_dFrontend_dToml_dTomlCursor_Vuna_dCompiler_dFrontend_dToml_dTomlCursor (dtb__220, dtb__221, dtb__222) -> dtb__221
  | _ -> failwith "DT: impossible branch"
)) (String.concat "" ["expected '=' after key \""; dtb__207; "\""])))
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
)
  | Base_dResult.C_Base_dResult_dResult_Base_dResult_dErr (dtb__223) -> (Base_dResult.C_Base_dResult_dResult_Base_dResult_dErr (dtb__223))
  | _ -> failwith "DT: impossible branch"
)) ((v_Vuna_dCompiler_dFrontend_dToml_dparseBareKey path) cs))))
and v_Vuna_dCompiler_dFrontend_dToml_dparseSectionLine = (fun fuel path cs section seen entries -> (if (fuel <= 0) then (Base_dResult.C_Base_dResult_dResult_Base_dResult_dErr ("DT: toml fuel exhausted (internal: toml parser made no progress)")) else ((fun nd_uscrut7 -> (match nd_uscrut7 with
  | Base_dResult.C_Base_dResult_dResult_Base_dResult_dOk (dtb__224) -> (match dtb__224 with
  | Base_dPair.C_Base_dPair_dPair_Base_dPair_dPair (dtb__225, dtb__226) -> (if (((v_Vuna_dCompiler_dFrontend_dToml_dmemSectionPath Base_dString.v_Eq_uString) dtb__225) seen) then (((v_Vuna_dCompiler_dFrontend_dToml_dfailAt path) (match cs with
  | C_Vuna_dCompiler_dFrontend_dToml_dTomlCursor_Vuna_dCompiler_dFrontend_dToml_dTomlCursor (dtb__227, dtb__228, dtb__229) -> dtb__228
  | _ -> failwith "DT: impossible branch"
)) (String.concat "" ["duplicate section ["; (Vuna_dCompiler_dCommon.v_Vuna_dCompiler_dCommon_djoinDots dtb__225); "]"])) else (match ((v_Vuna_dCompiler_dFrontend_dToml_dexpectEol path) dtb__226) with
  | Base_dResult.C_Base_dResult_dResult_Base_dResult_dErr (dtb__230) -> (Base_dResult.C_Base_dResult_dResult_Base_dResult_dErr (dtb__230))
  | Base_dResult.C_Base_dResult_dResult_Base_dResult_dOk (dtb__231) -> ((((((v_Vuna_dCompiler_dFrontend_dToml_dparseTomlLoop (fuel - 1)) path) dtb__231) dtb__225) (Base_dList.C_Base_dList_dList_Base_dList_dCons (dtb__225, seen))) entries)
  | _ -> failwith "DT: impossible branch"
))
  | _ -> failwith "DT: impossible branch"
)
  | Base_dResult.C_Base_dResult_dResult_Base_dResult_dErr (dtb__232) -> (Base_dResult.C_Base_dResult_dResult_Base_dResult_dErr (dtb__232))
  | _ -> failwith "DT: impossible branch"
)) ((v_Vuna_dCompiler_dFrontend_dToml_dparseSectionPath path) (v_Vuna_dCompiler_dFrontend_dToml_dadvanceCursor cs)))))
and v_Vuna_dCompiler_dFrontend_dToml_dparseTomlLoop = (fun fuel path cs section seen entries -> (if (fuel <= 0) then (Base_dResult.C_Base_dResult_dResult_Base_dResult_dErr ("DT: toml fuel exhausted (internal: toml parser made no progress)")) else ((((((v_Vuna_dCompiler_dFrontend_dToml_dparseTomlLoopAt (fuel - 1)) path) (v_Vuna_dCompiler_dFrontend_dToml_dskipGap cs)) section) seen) entries)))
and v_Vuna_dCompiler_dFrontend_dToml_dparseTomlLoopAt = (fun fuel path cs section seen entries -> (if (fuel <= 0) then (Base_dResult.C_Base_dResult_dResult_Base_dResult_dErr ("DT: toml fuel exhausted (internal: toml parser made no progress)")) else (match (match cs with
  | C_Vuna_dCompiler_dFrontend_dToml_dTomlCursor_Vuna_dCompiler_dFrontend_dToml_dTomlCursor (dtb__233, dtb__234, dtb__235) -> dtb__233
  | _ -> failwith "DT: impossible branch"
) with
  | Base_dList.C_Base_dList_dList_Base_dList_dNil -> (Base_dResult.C_Base_dResult_dResult_Base_dResult_dOk ((Base_dList.v_Base_dList_dreverse entries)))
  | Base_dList.C_Base_dList_dList_Base_dList_dCons (dtb__236, dtb__237) -> (if (dtb__236 = 91) then ((((((v_Vuna_dCompiler_dFrontend_dToml_dparseSectionLine (fuel - 1)) path) cs) section) seen) entries) else ((((((v_Vuna_dCompiler_dFrontend_dToml_dparseKeyLine (fuel - 1)) path) cs) section) seen) entries))
  | _ -> failwith "DT: impossible branch"
)))

let v_Vuna_dCompiler_dFrontend_dToml_dparseTomlAt = (fun path source -> ((fun cs -> ((((((v_Vuna_dCompiler_dFrontend_dToml_dparseTomlLoop (v_Vuna_dCompiler_dFrontend_dToml_dlineFuel cs)) path) cs) Base_dList.C_Base_dList_dList_Base_dList_dNil) Base_dList.C_Base_dList_dList_Base_dList_dNil) Base_dList.C_Base_dList_dList_Base_dList_dNil)) (C_Vuna_dCompiler_dFrontend_dToml_dTomlCursor_Vuna_dCompiler_dFrontend_dToml_dTomlCursor ((v_Vuna_dCompiler_dFrontend_dToml_dstripCR (Base_dList.dtp_unpack source)), 1, 1))))

let v_Vuna_dCompiler_dFrontend_dToml_dparseToml = (fun source -> ((v_Vuna_dCompiler_dFrontend_dToml_dparseTomlAt "") source))

let rec v_Vuna_dCompiler_dFrontend_dToml_dlookupEntry = (fun mc0 mc1 mc2 -> (match mc2 with
  | Base_dList.C_Base_dList_dList_Base_dList_dCons (dtb__238, dtb__239) -> (match dtb__238 with
  | C_Vuna_dCompiler_dFrontend_dToml_dTomlEntry_Vuna_dCompiler_dFrontend_dToml_dTomlEntry (dtb__240, dtb__241, dtb__242, dtb__243) -> (if (if (((v_Vuna_dCompiler_dFrontend_dToml_dsamePath Base_dString.v_Eq_uString) mc0) dtb__240) then (dtb__241 = mc1) else false) then (Base_dMaybe.C_Base_dMaybe_dMaybe_Base_dMaybe_dJust (dtb__242)) else (((v_Vuna_dCompiler_dFrontend_dToml_dlookupEntry mc0) mc1) dtb__239))
  | _ -> failwith "DT: impossible branch"
)
  | Base_dList.C_Base_dList_dList_Base_dList_dNil -> Base_dMaybe.C_Base_dMaybe_dMaybe_Base_dMaybe_dNothing
  | _ -> failwith "DT: impossible branch"
))

let rec v_Vuna_dCompiler_dFrontend_dToml_dlookupEntryLine = (fun mc0 mc1 mc2 -> (match mc2 with
  | Base_dList.C_Base_dList_dList_Base_dList_dCons (dtb__244, dtb__245) -> (match dtb__244 with
  | C_Vuna_dCompiler_dFrontend_dToml_dTomlEntry_Vuna_dCompiler_dFrontend_dToml_dTomlEntry (dtb__246, dtb__247, dtb__248, dtb__249) -> (if (if (((v_Vuna_dCompiler_dFrontend_dToml_dsamePath Base_dString.v_Eq_uString) mc0) dtb__246) then (dtb__247 = mc1) else false) then (Base_dMaybe.C_Base_dMaybe_dMaybe_Base_dMaybe_dJust (dtb__249)) else (((v_Vuna_dCompiler_dFrontend_dToml_dlookupEntryLine mc0) mc1) dtb__245))
  | _ -> failwith "DT: impossible branch"
)
  | Base_dList.C_Base_dList_dList_Base_dList_dNil -> Base_dMaybe.C_Base_dMaybe_dMaybe_Base_dMaybe_dNothing
  | _ -> failwith "DT: impossible branch"
))
