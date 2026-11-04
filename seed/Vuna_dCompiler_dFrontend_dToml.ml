open Vuna_runtime
open Base_dPair
open Base_dBool
open Base_dMonad
open Base_dMaybe
open Base_dEq
open Base_dList
open Base_dResult
open Base_dString
open Base_dShow
open Base_dOrd
open Prelude
open Vuna_dCompiler_dCommon
type t_Vuna_dCompiler_dFrontend_dToml_dTomlValue = C_Vuna_dCompiler_dFrontend_dToml_dTomlValue_Vuna_dCompiler_dFrontend_dToml_dTStr of (string) | C_Vuna_dCompiler_dFrontend_dToml_dTomlValue_Vuna_dCompiler_dFrontend_dToml_dTInt of (int) | C_Vuna_dCompiler_dFrontend_dToml_dTomlValue_Vuna_dCompiler_dFrontend_dToml_dTBool of (bool) | C_Vuna_dCompiler_dFrontend_dToml_dTomlValue_Vuna_dCompiler_dFrontend_dToml_dTList of (string t_Base_dList_dList)
and t_Vuna_dCompiler_dFrontend_dToml_dTomlEntry = C_Vuna_dCompiler_dFrontend_dToml_dTomlEntry_Vuna_dCompiler_dFrontend_dToml_dTomlEntry of (string t_Base_dList_dList) * (string) * (t_Vuna_dCompiler_dFrontend_dToml_dTomlValue) * (int)
and t_Vuna_dCompiler_dFrontend_dToml_dTomlCursor = C_Vuna_dCompiler_dFrontend_dToml_dTomlCursor_Vuna_dCompiler_dFrontend_dToml_dTomlCursor of (int t_Base_dList_dList) * (int) * (int)

let v_Vuna_dCompiler_dFrontend_dToml_dcursorChars = (fun mc0 -> (match mc0 with
  | C_Vuna_dCompiler_dFrontend_dToml_dTomlCursor_Vuna_dCompiler_dFrontend_dToml_dTomlCursor (dtb__0, dtb__1, dtb__2) -> dtb__0
  | _ -> failwith "DT: impossible branch"
))

let v_Vuna_dCompiler_dFrontend_dToml_dcursorLine = (fun mc0 -> (match mc0 with
  | C_Vuna_dCompiler_dFrontend_dToml_dTomlCursor_Vuna_dCompiler_dFrontend_dToml_dTomlCursor (dtb__3, dtb__4, dtb__5) -> dtb__4
  | _ -> failwith "DT: impossible branch"
))

let v_Vuna_dCompiler_dFrontend_dToml_dcursorCol = (fun mc0 -> (match mc0 with
  | C_Vuna_dCompiler_dFrontend_dToml_dTomlCursor_Vuna_dCompiler_dFrontend_dToml_dTomlCursor (dtb__6, dtb__7, dtb__8) -> dtb__8
  | _ -> failwith "DT: impossible branch"
))

let v_Vuna_dCompiler_dFrontend_dToml_dcursorFuel = (fun mc0 -> (match mc0 with
  | C_Vuna_dCompiler_dFrontend_dToml_dTomlCursor_Vuna_dCompiler_dFrontend_dToml_dTomlCursor (dtb__9, dtb__10, dtb__11) -> ((bi_add ((bi_mul 2) (v_Base_dList_dlength dtb__9))) 16)
  | _ -> failwith "DT: impossible branch"
))

let rec v_Vuna_dCompiler_dFrontend_dToml_dcountLines = (fun mc0 -> (match mc0 with
  | C_Base_dList_dList_Base_dList_dCons (dtb__12, dtb__13) -> (if ((bi_eq_int dtb__12) 10) then ((bi_add 1) (v_Vuna_dCompiler_dFrontend_dToml_dcountLines dtb__13)) else (v_Vuna_dCompiler_dFrontend_dToml_dcountLines dtb__13))
  | C_Base_dList_dList_Base_dList_dNil -> 1
  | _ -> failwith "DT: impossible branch"
))

let v_Vuna_dCompiler_dFrontend_dToml_dlineFuel = (fun mc0 -> (match mc0 with
  | C_Vuna_dCompiler_dFrontend_dToml_dTomlCursor_Vuna_dCompiler_dFrontend_dToml_dTomlCursor (dtb__14, dtb__15, dtb__16) -> ((bi_add ((bi_mul 4) (v_Vuna_dCompiler_dFrontend_dToml_dcountLines dtb__14))) 16)
  | _ -> failwith "DT: impossible branch"
))

let v_Vuna_dCompiler_dFrontend_dToml_dadvanceCursor = (fun mc0 -> (match mc0 with
  | C_Vuna_dCompiler_dFrontend_dToml_dTomlCursor_Vuna_dCompiler_dFrontend_dToml_dTomlCursor (dtb__17, dtb__18, dtb__19) -> (match dtb__17 with
  | C_Base_dList_dList_Base_dList_dCons (dtb__20, dtb__21) -> (if ((bi_eq_int dtb__20) 10) then (C_Vuna_dCompiler_dFrontend_dToml_dTomlCursor_Vuna_dCompiler_dFrontend_dToml_dTomlCursor (dtb__21, ((bi_add dtb__18) 1), 1)) else (C_Vuna_dCompiler_dFrontend_dToml_dTomlCursor_Vuna_dCompiler_dFrontend_dToml_dTomlCursor (dtb__21, dtb__18, ((bi_add dtb__19) 1))))
  | C_Base_dList_dList_Base_dList_dNil -> (C_Vuna_dCompiler_dFrontend_dToml_dTomlCursor_Vuna_dCompiler_dFrontend_dToml_dTomlCursor (C_Base_dList_dList_Base_dList_dNil, dtb__18, dtb__19))
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
))

let v_Vuna_dCompiler_dFrontend_dToml_disDigitChar = (fun c -> (if ((bi_ge_int c) 48) then ((bi_le_int c) 57) else false))

let v_Vuna_dCompiler_dFrontend_dToml_disUpperAlphaChar = (fun c -> (if ((bi_ge_int c) 65) then ((bi_le_int c) 90) else false))

let v_Vuna_dCompiler_dFrontend_dToml_disLowerAlphaChar = (fun c -> (if ((bi_ge_int c) 97) then ((bi_le_int c) 122) else false))

let v_Vuna_dCompiler_dFrontend_dToml_disAlphaChar = (fun c -> (if (v_Vuna_dCompiler_dFrontend_dToml_disUpperAlphaChar c) then true else (v_Vuna_dCompiler_dFrontend_dToml_disLowerAlphaChar c)))

let v_Vuna_dCompiler_dFrontend_dToml_disBareKeyChar = (fun c -> (if (if (if (v_Vuna_dCompiler_dFrontend_dToml_disAlphaChar c) then true else (v_Vuna_dCompiler_dFrontend_dToml_disDigitChar c)) then true else ((bi_eq_int c) 95)) then true else ((bi_eq_int c) 45)))

let v_Vuna_dCompiler_dFrontend_dToml_disBlankChar = (fun c -> (if ((bi_eq_int c) 32) then true else ((bi_eq_int c) 9)))

let rec v_Vuna_dCompiler_dFrontend_dToml_dstripCR = (fun mc0 -> (match mc0 with
  | C_Base_dList_dList_Base_dList_dCons (dtb__22, dtb__23) -> (if ((bi_eq_int dtb__22) 13) then (v_Vuna_dCompiler_dFrontend_dToml_dstripCR dtb__23) else (C_Base_dList_dList_Base_dList_dCons (dtb__22, (v_Vuna_dCompiler_dFrontend_dToml_dstripCR dtb__23))))
  | C_Base_dList_dList_Base_dList_dNil -> C_Base_dList_dList_Base_dList_dNil
  | _ -> failwith "DT: impossible branch"
))

let v_Vuna_dCompiler_dFrontend_dToml_dlocPrefix = (fun path -> (fun line -> (if ((bi_eq_str path) "") then ((bi_concat "line ") ((bi_concat (bi_strFromInt line)) ": ")) else ((bi_concat path) ((bi_concat ":") ((bi_concat (bi_strFromInt line)) ": "))))))

let v_Vuna_dCompiler_dFrontend_dToml_dfailAt = (fun path -> (fun line -> (fun msg -> (C_Base_dResult_dResult_Base_dResult_dErr (((bi_concat ((v_Vuna_dCompiler_dFrontend_dToml_dlocPrefix path) line)) msg))))))

let rec v_Vuna_dCompiler_dFrontend_dToml_dskipBlank = (fun mc0 -> (match mc0 with
  | C_Vuna_dCompiler_dFrontend_dToml_dTomlCursor_Vuna_dCompiler_dFrontend_dToml_dTomlCursor (dtb__24, dtb__25, dtb__26) -> (match dtb__24 with
  | C_Base_dList_dList_Base_dList_dCons (dtb__27, dtb__28) -> (if (v_Vuna_dCompiler_dFrontend_dToml_disBlankChar dtb__27) then (v_Vuna_dCompiler_dFrontend_dToml_dskipBlank (C_Vuna_dCompiler_dFrontend_dToml_dTomlCursor_Vuna_dCompiler_dFrontend_dToml_dTomlCursor (dtb__28, dtb__25, ((bi_add dtb__26) 1)))) else (C_Vuna_dCompiler_dFrontend_dToml_dTomlCursor_Vuna_dCompiler_dFrontend_dToml_dTomlCursor ((C_Base_dList_dList_Base_dList_dCons (dtb__27, dtb__28)), dtb__25, dtb__26)))
  | C_Base_dList_dList_Base_dList_dNil -> (C_Vuna_dCompiler_dFrontend_dToml_dTomlCursor_Vuna_dCompiler_dFrontend_dToml_dTomlCursor (C_Base_dList_dList_Base_dList_dNil, dtb__25, dtb__26))
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
))

let rec v_Vuna_dCompiler_dFrontend_dToml_dskipComment = (fun mc0 -> (match mc0 with
  | C_Vuna_dCompiler_dFrontend_dToml_dTomlCursor_Vuna_dCompiler_dFrontend_dToml_dTomlCursor (dtb__29, dtb__30, dtb__31) -> (match dtb__29 with
  | C_Base_dList_dList_Base_dList_dCons (dtb__32, dtb__33) -> (if ((bi_eq_int dtb__32) 10) then (C_Vuna_dCompiler_dFrontend_dToml_dTomlCursor_Vuna_dCompiler_dFrontend_dToml_dTomlCursor ((C_Base_dList_dList_Base_dList_dCons (dtb__32, dtb__33)), dtb__30, dtb__31)) else (v_Vuna_dCompiler_dFrontend_dToml_dskipComment (C_Vuna_dCompiler_dFrontend_dToml_dTomlCursor_Vuna_dCompiler_dFrontend_dToml_dTomlCursor (dtb__33, dtb__30, ((bi_add dtb__31) 1)))))
  | C_Base_dList_dList_Base_dList_dNil -> (C_Vuna_dCompiler_dFrontend_dToml_dTomlCursor_Vuna_dCompiler_dFrontend_dToml_dTomlCursor (C_Base_dList_dList_Base_dList_dNil, dtb__30, dtb__31))
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
))

let rec v_Vuna_dCompiler_dFrontend_dToml_dskipGapGo = (fun mc0 -> (fun mc1 -> (match mc1 with
  | C_Vuna_dCompiler_dFrontend_dToml_dTomlCursor_Vuna_dCompiler_dFrontend_dToml_dTomlCursor (dtb__34, dtb__35, dtb__36) -> (match dtb__34 with
  | C_Base_dList_dList_Base_dList_dCons (dtb__37, dtb__38) -> (if mc0 then (if ((bi_eq_int dtb__37) 10) then ((v_Vuna_dCompiler_dFrontend_dToml_dskipGapGo false) (C_Vuna_dCompiler_dFrontend_dToml_dTomlCursor_Vuna_dCompiler_dFrontend_dToml_dTomlCursor (dtb__38, ((bi_add dtb__35) 1), 1))) else ((v_Vuna_dCompiler_dFrontend_dToml_dskipGapGo true) (C_Vuna_dCompiler_dFrontend_dToml_dTomlCursor_Vuna_dCompiler_dFrontend_dToml_dTomlCursor (dtb__38, dtb__35, ((bi_add dtb__36) 1))))) else (if (v_Vuna_dCompiler_dFrontend_dToml_disBlankChar dtb__37) then ((v_Vuna_dCompiler_dFrontend_dToml_dskipGapGo false) (C_Vuna_dCompiler_dFrontend_dToml_dTomlCursor_Vuna_dCompiler_dFrontend_dToml_dTomlCursor (dtb__38, dtb__35, ((bi_add dtb__36) 1)))) else (if ((bi_eq_int dtb__37) 10) then ((v_Vuna_dCompiler_dFrontend_dToml_dskipGapGo false) (C_Vuna_dCompiler_dFrontend_dToml_dTomlCursor_Vuna_dCompiler_dFrontend_dToml_dTomlCursor (dtb__38, ((bi_add dtb__35) 1), 1))) else (if ((bi_eq_int dtb__37) 35) then ((v_Vuna_dCompiler_dFrontend_dToml_dskipGapGo true) (C_Vuna_dCompiler_dFrontend_dToml_dTomlCursor_Vuna_dCompiler_dFrontend_dToml_dTomlCursor (dtb__38, dtb__35, ((bi_add dtb__36) 1)))) else (C_Vuna_dCompiler_dFrontend_dToml_dTomlCursor_Vuna_dCompiler_dFrontend_dToml_dTomlCursor ((C_Base_dList_dList_Base_dList_dCons (dtb__37, dtb__38)), dtb__35, dtb__36))))))
  | C_Base_dList_dList_Base_dList_dNil -> (C_Vuna_dCompiler_dFrontend_dToml_dTomlCursor_Vuna_dCompiler_dFrontend_dToml_dTomlCursor (C_Base_dList_dList_Base_dList_dNil, dtb__35, dtb__36))
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
)))

let v_Vuna_dCompiler_dFrontend_dToml_dskipGap = (fun cs -> ((v_Vuna_dCompiler_dFrontend_dToml_dskipGapGo false) cs))

let rec v_Vuna_dCompiler_dFrontend_dToml_dcollectBareKey = (fun mc0 -> (fun mc1 -> (match mc0 with
  | C_Vuna_dCompiler_dFrontend_dToml_dTomlCursor_Vuna_dCompiler_dFrontend_dToml_dTomlCursor (dtb__39, dtb__40, dtb__41) -> (match dtb__39 with
  | C_Base_dList_dList_Base_dList_dCons (dtb__42, dtb__43) -> (if (v_Vuna_dCompiler_dFrontend_dToml_disBareKeyChar dtb__42) then ((v_Vuna_dCompiler_dFrontend_dToml_dcollectBareKey (C_Vuna_dCompiler_dFrontend_dToml_dTomlCursor_Vuna_dCompiler_dFrontend_dToml_dTomlCursor (dtb__43, dtb__40, ((bi_add dtb__41) 1)))) (C_Base_dList_dList_Base_dList_dCons (dtb__42, mc1))) else (C_Base_dPair_dPair_Base_dPair_dPair ((dtp_pack (v_Base_dList_dreverse mc1)), (C_Vuna_dCompiler_dFrontend_dToml_dTomlCursor_Vuna_dCompiler_dFrontend_dToml_dTomlCursor ((C_Base_dList_dList_Base_dList_dCons (dtb__42, dtb__43)), dtb__40, dtb__41)))))
  | C_Base_dList_dList_Base_dList_dNil -> (C_Base_dPair_dPair_Base_dPair_dPair ((dtp_pack (v_Base_dList_dreverse mc1)), (C_Vuna_dCompiler_dFrontend_dToml_dTomlCursor_Vuna_dCompiler_dFrontend_dToml_dTomlCursor (C_Base_dList_dList_Base_dList_dNil, dtb__40, dtb__41))))
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
)))

let v_Vuna_dCompiler_dFrontend_dToml_dparseBareKey = (fun path -> (fun cs -> (match (v_Vuna_dCompiler_dFrontend_dToml_dcursorChars cs) with
  | C_Base_dList_dList_Base_dList_dNil -> (((v_Vuna_dCompiler_dFrontend_dToml_dfailAt path) (v_Vuna_dCompiler_dFrontend_dToml_dcursorLine cs)) "expected a key")
  | C_Base_dList_dList_Base_dList_dCons (dtb__44, dtb__45) -> (if (v_Vuna_dCompiler_dFrontend_dToml_disBareKeyChar dtb__44) then (match ((v_Vuna_dCompiler_dFrontend_dToml_dcollectBareKey cs) C_Base_dList_dList_Base_dList_dNil) with
  | C_Base_dPair_dPair_Base_dPair_dPair (dtb__46, dtb__47) -> (C_Base_dResult_dResult_Base_dResult_dOk ((C_Base_dPair_dPair_Base_dPair_dPair (dtb__46, dtb__47))))
  | _ -> failwith "DT: impossible branch"
) else (((v_Vuna_dCompiler_dFrontend_dToml_dfailAt path) (v_Vuna_dCompiler_dFrontend_dToml_dcursorLine cs)) "expected a key"))
  | _ -> failwith "DT: impossible branch"
)))

let rec v_Vuna_dCompiler_dFrontend_dToml_dparseStringChars = (fun fuel -> (fun path -> (fun startCs -> (fun cs -> (fun acc -> (if ((bi_le_int fuel) 0) then (C_Base_dResult_dResult_Base_dResult_dErr ("DT: toml fuel exhausted (internal: toml parser made no progress)")) else (match (v_Vuna_dCompiler_dFrontend_dToml_dcursorChars cs) with
  | C_Base_dList_dList_Base_dList_dNil -> (((v_Vuna_dCompiler_dFrontend_dToml_dfailAt path) (v_Vuna_dCompiler_dFrontend_dToml_dcursorLine startCs)) "unterminated basic string")
  | C_Base_dList_dList_Base_dList_dCons (dtb__48, dtb__49) -> (if ((bi_eq_int dtb__48) 34) then (C_Base_dResult_dResult_Base_dResult_dOk ((C_Base_dPair_dPair_Base_dPair_dPair ((dtp_pack (v_Base_dList_dreverse acc)), (v_Vuna_dCompiler_dFrontend_dToml_dadvanceCursor cs))))) else (if ((bi_eq_int dtb__48) 10) then (((v_Vuna_dCompiler_dFrontend_dToml_dfailAt path) (v_Vuna_dCompiler_dFrontend_dToml_dcursorLine startCs)) "unterminated basic string (newline in string)") else (if ((bi_eq_int dtb__48) 92) then (((((v_Vuna_dCompiler_dFrontend_dToml_dparseStringEscape ((bi_sub fuel) 1)) path) startCs) (v_Vuna_dCompiler_dFrontend_dToml_dadvanceCursor cs)) acc) else (((((v_Vuna_dCompiler_dFrontend_dToml_dparseStringChars ((bi_sub fuel) 1)) path) startCs) (v_Vuna_dCompiler_dFrontend_dToml_dadvanceCursor cs)) (C_Base_dList_dList_Base_dList_dCons (dtb__48, acc))))))
  | _ -> failwith "DT: impossible branch"
)))))))
and v_Vuna_dCompiler_dFrontend_dToml_dparseStringEscape = (fun fuel -> (fun path -> (fun startCs -> (fun cs -> (fun acc -> (if ((bi_le_int fuel) 0) then (C_Base_dResult_dResult_Base_dResult_dErr ("DT: toml fuel exhausted (internal: toml parser made no progress)")) else (match (v_Vuna_dCompiler_dFrontend_dToml_dcursorChars cs) with
  | C_Base_dList_dList_Base_dList_dNil -> (((v_Vuna_dCompiler_dFrontend_dToml_dfailAt path) (v_Vuna_dCompiler_dFrontend_dToml_dcursorLine startCs)) "unterminated escape sequence")
  | C_Base_dList_dList_Base_dList_dCons (dtb__50, dtb__51) -> (if ((bi_eq_int dtb__50) 110) then (((((v_Vuna_dCompiler_dFrontend_dToml_dparseStringChars ((bi_sub fuel) 1)) path) startCs) (v_Vuna_dCompiler_dFrontend_dToml_dadvanceCursor cs)) (C_Base_dList_dList_Base_dList_dCons (10, acc))) else (if ((bi_eq_int dtb__50) 116) then (((((v_Vuna_dCompiler_dFrontend_dToml_dparseStringChars ((bi_sub fuel) 1)) path) startCs) (v_Vuna_dCompiler_dFrontend_dToml_dadvanceCursor cs)) (C_Base_dList_dList_Base_dList_dCons (9, acc))) else (if ((bi_eq_int dtb__50) 114) then (((((v_Vuna_dCompiler_dFrontend_dToml_dparseStringChars ((bi_sub fuel) 1)) path) startCs) (v_Vuna_dCompiler_dFrontend_dToml_dadvanceCursor cs)) (C_Base_dList_dList_Base_dList_dCons (13, acc))) else (if ((bi_eq_int dtb__50) 98) then (((((v_Vuna_dCompiler_dFrontend_dToml_dparseStringChars ((bi_sub fuel) 1)) path) startCs) (v_Vuna_dCompiler_dFrontend_dToml_dadvanceCursor cs)) (C_Base_dList_dList_Base_dList_dCons (8, acc))) else (if ((bi_eq_int dtb__50) 102) then (((((v_Vuna_dCompiler_dFrontend_dToml_dparseStringChars ((bi_sub fuel) 1)) path) startCs) (v_Vuna_dCompiler_dFrontend_dToml_dadvanceCursor cs)) (C_Base_dList_dList_Base_dList_dCons (12, acc))) else (if ((bi_eq_int dtb__50) 34) then (((((v_Vuna_dCompiler_dFrontend_dToml_dparseStringChars ((bi_sub fuel) 1)) path) startCs) (v_Vuna_dCompiler_dFrontend_dToml_dadvanceCursor cs)) (C_Base_dList_dList_Base_dList_dCons (34, acc))) else (if ((bi_eq_int dtb__50) 92) then (((((v_Vuna_dCompiler_dFrontend_dToml_dparseStringChars ((bi_sub fuel) 1)) path) startCs) (v_Vuna_dCompiler_dFrontend_dToml_dadvanceCursor cs)) (C_Base_dList_dList_Base_dList_dCons (92, acc))) else (((v_Vuna_dCompiler_dFrontend_dToml_dfailAt path) (v_Vuna_dCompiler_dFrontend_dToml_dcursorLine cs)) ((bi_concat "unknown escape sequence \\") (dtp_pack (C_Base_dList_dList_Base_dList_dCons (dtb__50, C_Base_dList_dList_Base_dList_dNil))))))))))))
  | _ -> failwith "DT: impossible branch"
)))))))

let v_Vuna_dCompiler_dFrontend_dToml_dparseStringValue = (fun path -> (fun cs -> (match (v_Vuna_dCompiler_dFrontend_dToml_dcursorChars cs) with
  | C_Base_dList_dList_Base_dList_dNil -> (((v_Vuna_dCompiler_dFrontend_dToml_dfailAt path) (v_Vuna_dCompiler_dFrontend_dToml_dcursorLine cs)) "unterminated basic string")
  | C_Base_dList_dList_Base_dList_dCons (dtb__52, dtb__53) -> ((fun cs1 -> (((((v_Vuna_dCompiler_dFrontend_dToml_dparseStringChars (v_Vuna_dCompiler_dFrontend_dToml_dcursorFuel cs1)) path) cs) cs1) C_Base_dList_dList_Base_dList_dNil)) (v_Vuna_dCompiler_dFrontend_dToml_dadvanceCursor cs))
  | _ -> failwith "DT: impossible branch"
)))

let v_Vuna_dCompiler_dFrontend_dToml_dmakeInteger = (fun acc -> (fun negative -> (if negative then ((bi_sub 0) acc) else acc)))

let v_Vuna_dCompiler_dFrontend_dToml_dfinishInteger = (fun path -> (fun startCs -> (fun cs -> (fun count -> (fun acc -> (fun negative -> (if ((bi_eq_int count) 0) then (((v_Vuna_dCompiler_dFrontend_dToml_dfailAt path) (v_Vuna_dCompiler_dFrontend_dToml_dcursorLine startCs)) "expected digits for integer") else (match (v_Vuna_dCompiler_dFrontend_dToml_dcursorChars cs) with
  | C_Base_dList_dList_Base_dList_dNil -> (C_Base_dResult_dResult_Base_dResult_dOk ((C_Base_dPair_dPair_Base_dPair_dPair (((v_Vuna_dCompiler_dFrontend_dToml_dmakeInteger acc) negative), cs))))
  | C_Base_dList_dList_Base_dList_dCons (dtb__54, dtb__55) -> (if ((bi_eq_int dtb__54) 46) then (((v_Vuna_dCompiler_dFrontend_dToml_dfailAt path) (v_Vuna_dCompiler_dFrontend_dToml_dcursorLine startCs)) "floating point numbers are not supported") else (if (v_Vuna_dCompiler_dFrontend_dToml_disBareKeyChar dtb__54) then (((v_Vuna_dCompiler_dFrontend_dToml_dfailAt path) (v_Vuna_dCompiler_dFrontend_dToml_dcursorLine startCs)) "invalid integer literal") else (C_Base_dResult_dResult_Base_dResult_dOk ((C_Base_dPair_dPair_Base_dPair_dPair (((v_Vuna_dCompiler_dFrontend_dToml_dmakeInteger acc) negative), cs))))))
  | _ -> failwith "DT: impossible branch"
))))))))

let rec v_Vuna_dCompiler_dFrontend_dToml_dparseIntegerDigits = (fun fuel -> (fun path -> (fun startCs -> (fun cs -> (fun count -> (fun acc -> (fun negative -> (if ((bi_le_int fuel) 0) then (C_Base_dResult_dResult_Base_dResult_dErr ("DT: toml fuel exhausted (internal: toml parser made no progress)")) else (match (v_Vuna_dCompiler_dFrontend_dToml_dcursorChars cs) with
  | C_Base_dList_dList_Base_dList_dNil -> ((((((v_Vuna_dCompiler_dFrontend_dToml_dfinishInteger path) startCs) cs) count) acc) negative)
  | C_Base_dList_dList_Base_dList_dCons (dtb__56, dtb__57) -> (if (v_Vuna_dCompiler_dFrontend_dToml_disDigitChar dtb__56) then (((((((v_Vuna_dCompiler_dFrontend_dToml_dparseIntegerDigits ((bi_sub fuel) 1)) path) startCs) (v_Vuna_dCompiler_dFrontend_dToml_dadvanceCursor cs)) ((bi_add count) 1)) ((bi_add ((bi_mul acc) 10)) ((bi_sub dtb__56) 48))) negative) else ((((((v_Vuna_dCompiler_dFrontend_dToml_dfinishInteger path) startCs) cs) count) acc) negative))
  | _ -> failwith "DT: impossible branch"
)))))))))

let v_Vuna_dCompiler_dFrontend_dToml_dparseInteger = (fun path -> (fun cs -> (match (v_Vuna_dCompiler_dFrontend_dToml_dcursorChars cs) with
  | C_Base_dList_dList_Base_dList_dNil -> (((v_Vuna_dCompiler_dFrontend_dToml_dfailAt path) (v_Vuna_dCompiler_dFrontend_dToml_dcursorLine cs)) "expected an integer")
  | C_Base_dList_dList_Base_dList_dCons (dtb__58, dtb__59) -> (if ((bi_eq_int dtb__58) 45) then (((((((v_Vuna_dCompiler_dFrontend_dToml_dparseIntegerDigits (v_Vuna_dCompiler_dFrontend_dToml_dcursorFuel cs)) path) cs) (v_Vuna_dCompiler_dFrontend_dToml_dadvanceCursor cs)) 0) 0) true) else (if (v_Vuna_dCompiler_dFrontend_dToml_disDigitChar dtb__58) then (((((((v_Vuna_dCompiler_dFrontend_dToml_dparseIntegerDigits (v_Vuna_dCompiler_dFrontend_dToml_dcursorFuel cs)) path) cs) cs) 0) 0) false) else (((v_Vuna_dCompiler_dFrontend_dToml_dfailAt path) (v_Vuna_dCompiler_dFrontend_dToml_dcursorLine cs)) "expected an integer")))
  | _ -> failwith "DT: impossible branch"
)))

let v_Vuna_dCompiler_dFrontend_dToml_dparseIntValue = (fun path -> (fun cs -> ((fun nd_uscrut2 -> (match nd_uscrut2 with
  | C_Base_dResult_dResult_Base_dResult_dOk (dtb__60) -> (match dtb__60 with
  | C_Base_dPair_dPair_Base_dPair_dPair (dtb__61, dtb__62) -> (C_Base_dResult_dResult_Base_dResult_dOk ((C_Base_dPair_dPair_Base_dPair_dPair ((C_Vuna_dCompiler_dFrontend_dToml_dTomlValue_Vuna_dCompiler_dFrontend_dToml_dTInt (dtb__61)), dtb__62))))
  | _ -> failwith "DT: impossible branch"
)
  | C_Base_dResult_dResult_Base_dResult_dErr (dtb__63) -> (C_Base_dResult_dResult_Base_dResult_dErr (dtb__63))
  | _ -> failwith "DT: impossible branch"
)) ((v_Vuna_dCompiler_dFrontend_dToml_dparseInteger path) cs))))

let rec v_Vuna_dCompiler_dFrontend_dToml_dmatchChars = (fun mc0 -> (fun mc1 -> (match mc0 with
  | C_Base_dList_dList_Base_dList_dCons (dtb__64, dtb__65) -> (match mc1 with
  | C_Vuna_dCompiler_dFrontend_dToml_dTomlCursor_Vuna_dCompiler_dFrontend_dToml_dTomlCursor (dtb__66, dtb__67, dtb__68) -> (match dtb__66 with
  | C_Base_dList_dList_Base_dList_dCons (dtb__69, dtb__70) -> (if ((bi_eq_int dtb__69) dtb__64) then ((v_Vuna_dCompiler_dFrontend_dToml_dmatchChars dtb__65) (C_Vuna_dCompiler_dFrontend_dToml_dTomlCursor_Vuna_dCompiler_dFrontend_dToml_dTomlCursor (dtb__70, dtb__67, ((bi_add dtb__68) 1)))) else C_Base_dMaybe_dMaybe_Base_dMaybe_dNothing)
  | C_Base_dList_dList_Base_dList_dNil -> C_Base_dMaybe_dMaybe_Base_dMaybe_dNothing
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
)
  | C_Base_dList_dList_Base_dList_dNil -> (C_Base_dMaybe_dMaybe_Base_dMaybe_dJust (mc1))
  | _ -> failwith "DT: impossible branch"
)))

let v_Vuna_dCompiler_dFrontend_dToml_dmatchWord = (fun word -> (fun cs -> (match ((v_Vuna_dCompiler_dFrontend_dToml_dmatchChars (dtp_unpack word)) cs) with
  | C_Base_dMaybe_dMaybe_Base_dMaybe_dNothing -> C_Base_dMaybe_dMaybe_Base_dMaybe_dNothing
  | C_Base_dMaybe_dMaybe_Base_dMaybe_dJust (dtb__71) -> (match (v_Vuna_dCompiler_dFrontend_dToml_dcursorChars dtb__71) with
  | C_Base_dList_dList_Base_dList_dNil -> (C_Base_dMaybe_dMaybe_Base_dMaybe_dJust (dtb__71))
  | C_Base_dList_dList_Base_dList_dCons (dtb__72, dtb__73) -> (if (v_Vuna_dCompiler_dFrontend_dToml_disBareKeyChar dtb__72) then C_Base_dMaybe_dMaybe_Base_dMaybe_dNothing else (C_Base_dMaybe_dMaybe_Base_dMaybe_dJust (dtb__71)))
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
)))

let rec v_Vuna_dCompiler_dFrontend_dToml_dparseArrayItems = (fun fuel -> (fun path -> (fun cs -> (fun acc -> (if ((bi_le_int fuel) 0) then (C_Base_dResult_dResult_Base_dResult_dErr ("DT: toml fuel exhausted (internal: toml parser made no progress)")) else (match (v_Vuna_dCompiler_dFrontend_dToml_dskipGap cs) with
  | C_Vuna_dCompiler_dFrontend_dToml_dTomlCursor_Vuna_dCompiler_dFrontend_dToml_dTomlCursor (dtb__74, dtb__75, dtb__76) -> (match dtb__74 with
  | C_Base_dList_dList_Base_dList_dNil -> (((v_Vuna_dCompiler_dFrontend_dToml_dfailAt path) dtb__75) "unterminated array")
  | C_Base_dList_dList_Base_dList_dCons (dtb__77, dtb__78) -> (if ((bi_eq_int dtb__77) 93) then (C_Base_dResult_dResult_Base_dResult_dOk ((C_Base_dPair_dPair_Base_dPair_dPair ((C_Vuna_dCompiler_dFrontend_dToml_dTomlValue_Vuna_dCompiler_dFrontend_dToml_dTList ((v_Base_dList_dreverse acc))), (v_Vuna_dCompiler_dFrontend_dToml_dadvanceCursor (C_Vuna_dCompiler_dFrontend_dToml_dTomlCursor_Vuna_dCompiler_dFrontend_dToml_dTomlCursor (dtb__74, dtb__75, dtb__76))))))) else (if ((bi_eq_int dtb__77) 34) then ((((v_Vuna_dCompiler_dFrontend_dToml_dparseArrayString ((bi_sub fuel) 1)) path) (C_Vuna_dCompiler_dFrontend_dToml_dTomlCursor_Vuna_dCompiler_dFrontend_dToml_dTomlCursor (dtb__74, dtb__75, dtb__76))) acc) else (((v_Vuna_dCompiler_dFrontend_dToml_dfailAt path) dtb__75) "expected a string in array")))
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
))))))
and v_Vuna_dCompiler_dFrontend_dToml_dparseArrayString = (fun fuel -> (fun path -> (fun cs -> (fun acc -> (if ((bi_le_int fuel) 0) then (C_Base_dResult_dResult_Base_dResult_dErr ("DT: toml fuel exhausted (internal: toml parser made no progress)")) else ((fun nd_uscrut4 -> (match nd_uscrut4 with
  | C_Base_dResult_dResult_Base_dResult_dOk (dtb__79) -> (match dtb__79 with
  | C_Base_dPair_dPair_Base_dPair_dPair (dtb__80, dtb__81) -> (match (v_Vuna_dCompiler_dFrontend_dToml_dskipGap dtb__81) with
  | C_Vuna_dCompiler_dFrontend_dToml_dTomlCursor_Vuna_dCompiler_dFrontend_dToml_dTomlCursor (dtb__82, dtb__83, dtb__84) -> (match dtb__82 with
  | C_Base_dList_dList_Base_dList_dNil -> (((v_Vuna_dCompiler_dFrontend_dToml_dfailAt path) dtb__83) "unterminated array")
  | C_Base_dList_dList_Base_dList_dCons (dtb__85, dtb__86) -> (if ((bi_eq_int dtb__85) 44) then ((((v_Vuna_dCompiler_dFrontend_dToml_dparseArrayItems ((bi_sub fuel) 1)) path) (v_Vuna_dCompiler_dFrontend_dToml_dadvanceCursor (C_Vuna_dCompiler_dFrontend_dToml_dTomlCursor_Vuna_dCompiler_dFrontend_dToml_dTomlCursor (dtb__82, dtb__83, dtb__84)))) (C_Base_dList_dList_Base_dList_dCons (dtb__80, acc))) else (if ((bi_eq_int dtb__85) 93) then (C_Base_dResult_dResult_Base_dResult_dOk ((C_Base_dPair_dPair_Base_dPair_dPair ((C_Vuna_dCompiler_dFrontend_dToml_dTomlValue_Vuna_dCompiler_dFrontend_dToml_dTList ((v_Base_dList_dreverse (C_Base_dList_dList_Base_dList_dCons (dtb__80, acc))))), (v_Vuna_dCompiler_dFrontend_dToml_dadvanceCursor (C_Vuna_dCompiler_dFrontend_dToml_dTomlCursor_Vuna_dCompiler_dFrontend_dToml_dTomlCursor (dtb__82, dtb__83, dtb__84))))))) else (((v_Vuna_dCompiler_dFrontend_dToml_dfailAt path) dtb__83) "expected ',' or ']' in array")))
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
)
  | C_Base_dResult_dResult_Base_dResult_dErr (dtb__87) -> (C_Base_dResult_dResult_Base_dResult_dErr (dtb__87))
  | _ -> failwith "DT: impossible branch"
)) ((v_Vuna_dCompiler_dFrontend_dToml_dparseStringValue path) cs)))))))

let v_Vuna_dCompiler_dFrontend_dToml_dparseStringArray = (fun path -> (fun cs -> (match (v_Vuna_dCompiler_dFrontend_dToml_dcursorChars cs) with
  | C_Base_dList_dList_Base_dList_dNil -> (((v_Vuna_dCompiler_dFrontend_dToml_dfailAt path) (v_Vuna_dCompiler_dFrontend_dToml_dcursorLine cs)) "unterminated array")
  | C_Base_dList_dList_Base_dList_dCons (dtb__88, dtb__89) -> ((fun cs1 -> ((((v_Vuna_dCompiler_dFrontend_dToml_dparseArrayItems (v_Vuna_dCompiler_dFrontend_dToml_dcursorFuel cs1)) path) cs1) C_Base_dList_dList_Base_dList_dNil)) (v_Vuna_dCompiler_dFrontend_dToml_dadvanceCursor cs))
  | _ -> failwith "DT: impossible branch"
)))

let v_Vuna_dCompiler_dFrontend_dToml_dparseValue = (fun path -> (fun cs -> (match (v_Vuna_dCompiler_dFrontend_dToml_dcursorChars cs) with
  | C_Base_dList_dList_Base_dList_dNil -> (((v_Vuna_dCompiler_dFrontend_dToml_dfailAt path) (v_Vuna_dCompiler_dFrontend_dToml_dcursorLine cs)) "expected a value")
  | C_Base_dList_dList_Base_dList_dCons (dtb__90, dtb__91) -> (if ((bi_eq_int dtb__90) 34) then ((fun nd_uscrut5 -> (match nd_uscrut5 with
  | C_Base_dResult_dResult_Base_dResult_dOk (dtb__92) -> (match dtb__92 with
  | C_Base_dPair_dPair_Base_dPair_dPair (dtb__93, dtb__94) -> (C_Base_dResult_dResult_Base_dResult_dOk ((C_Base_dPair_dPair_Base_dPair_dPair ((C_Vuna_dCompiler_dFrontend_dToml_dTomlValue_Vuna_dCompiler_dFrontend_dToml_dTStr (dtb__93)), dtb__94))))
  | _ -> failwith "DT: impossible branch"
)
  | C_Base_dResult_dResult_Base_dResult_dErr (dtb__95) -> (C_Base_dResult_dResult_Base_dResult_dErr (dtb__95))
  | _ -> failwith "DT: impossible branch"
)) ((v_Vuna_dCompiler_dFrontend_dToml_dparseStringValue path) cs)) else (if ((bi_eq_int dtb__90) 91) then ((v_Vuna_dCompiler_dFrontend_dToml_dparseStringArray path) cs) else (if ((bi_eq_int dtb__90) 45) then ((v_Vuna_dCompiler_dFrontend_dToml_dparseIntValue path) cs) else (if (v_Vuna_dCompiler_dFrontend_dToml_disDigitChar dtb__90) then ((v_Vuna_dCompiler_dFrontend_dToml_dparseIntValue path) cs) else (match ((v_Vuna_dCompiler_dFrontend_dToml_dmatchWord "true") cs) with
  | C_Base_dMaybe_dMaybe_Base_dMaybe_dJust (dtb__96) -> (C_Base_dResult_dResult_Base_dResult_dOk ((C_Base_dPair_dPair_Base_dPair_dPair ((C_Vuna_dCompiler_dFrontend_dToml_dTomlValue_Vuna_dCompiler_dFrontend_dToml_dTBool (true)), dtb__96))))
  | C_Base_dMaybe_dMaybe_Base_dMaybe_dNothing -> (match ((v_Vuna_dCompiler_dFrontend_dToml_dmatchWord "false") cs) with
  | C_Base_dMaybe_dMaybe_Base_dMaybe_dJust (dtb__97) -> (C_Base_dResult_dResult_Base_dResult_dOk ((C_Base_dPair_dPair_Base_dPair_dPair ((C_Vuna_dCompiler_dFrontend_dToml_dTomlValue_Vuna_dCompiler_dFrontend_dToml_dTBool (false)), dtb__97))))
  | C_Base_dMaybe_dMaybe_Base_dMaybe_dNothing -> (((v_Vuna_dCompiler_dFrontend_dToml_dfailAt path) (v_Vuna_dCompiler_dFrontend_dToml_dcursorLine cs)) "expected a value")
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
)))))
  | _ -> failwith "DT: impossible branch"
)))

let rec v_Vuna_dCompiler_dFrontend_dToml_dparseSectionSegments = (fun fuel -> (fun path -> (fun cs -> (fun acc -> (if ((bi_le_int fuel) 0) then (C_Base_dResult_dResult_Base_dResult_dErr ("DT: toml fuel exhausted (internal: toml parser made no progress)")) else ((fun nd_uscrut4 -> (match nd_uscrut4 with
  | C_Base_dResult_dResult_Base_dResult_dOk (dtb__98) -> (match dtb__98 with
  | C_Base_dPair_dPair_Base_dPair_dPair (dtb__99, dtb__100) -> (match (v_Vuna_dCompiler_dFrontend_dToml_dskipBlank dtb__100) with
  | C_Vuna_dCompiler_dFrontend_dToml_dTomlCursor_Vuna_dCompiler_dFrontend_dToml_dTomlCursor (dtb__101, dtb__102, dtb__103) -> (match dtb__101 with
  | C_Base_dList_dList_Base_dList_dNil -> (((v_Vuna_dCompiler_dFrontend_dToml_dfailAt path) dtb__102) "unterminated section header")
  | C_Base_dList_dList_Base_dList_dCons (dtb__104, dtb__105) -> (if ((bi_eq_int dtb__104) 46) then ((((v_Vuna_dCompiler_dFrontend_dToml_dparseSectionSegments ((bi_sub fuel) 1)) path) (C_Vuna_dCompiler_dFrontend_dToml_dTomlCursor_Vuna_dCompiler_dFrontend_dToml_dTomlCursor (dtb__105, dtb__102, ((bi_add dtb__103) 1)))) (C_Base_dList_dList_Base_dList_dCons (dtb__99, acc))) else (if ((bi_eq_int dtb__104) 93) then (C_Base_dResult_dResult_Base_dResult_dOk ((C_Base_dPair_dPair_Base_dPair_dPair ((v_Base_dList_dreverse (C_Base_dList_dList_Base_dList_dCons (dtb__99, acc))), (C_Vuna_dCompiler_dFrontend_dToml_dTomlCursor_Vuna_dCompiler_dFrontend_dToml_dTomlCursor (dtb__105, dtb__102, ((bi_add dtb__103) 1))))))) else (((v_Vuna_dCompiler_dFrontend_dToml_dfailAt path) dtb__102) "expected '.' or ']' in section header")))
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
)
  | C_Base_dResult_dResult_Base_dResult_dErr (dtb__106) -> (C_Base_dResult_dResult_Base_dResult_dErr (dtb__106))
  | _ -> failwith "DT: impossible branch"
)) ((v_Vuna_dCompiler_dFrontend_dToml_dparseBareKey path) (v_Vuna_dCompiler_dFrontend_dToml_dskipBlank cs))))))))

let v_Vuna_dCompiler_dFrontend_dToml_dparseSectionPath = (fun path -> (fun cs -> ((((v_Vuna_dCompiler_dFrontend_dToml_dparseSectionSegments (v_Vuna_dCompiler_dFrontend_dToml_dcursorFuel cs)) path) cs) C_Base_dList_dList_Base_dList_dNil)))

let v_Vuna_dCompiler_dFrontend_dToml_dexpectEolAfterComment = (fun path -> (fun cs -> (match (v_Vuna_dCompiler_dFrontend_dToml_dskipComment cs) with
  | C_Vuna_dCompiler_dFrontend_dToml_dTomlCursor_Vuna_dCompiler_dFrontend_dToml_dTomlCursor (dtb__107, dtb__108, dtb__109) -> (match dtb__107 with
  | C_Base_dList_dList_Base_dList_dNil -> (C_Base_dResult_dResult_Base_dResult_dOk ((C_Vuna_dCompiler_dFrontend_dToml_dTomlCursor_Vuna_dCompiler_dFrontend_dToml_dTomlCursor (dtb__107, dtb__108, dtb__109))))
  | C_Base_dList_dList_Base_dList_dCons (dtb__110, dtb__111) -> (if ((bi_eq_int dtb__110) 10) then (C_Base_dResult_dResult_Base_dResult_dOk ((C_Vuna_dCompiler_dFrontend_dToml_dTomlCursor_Vuna_dCompiler_dFrontend_dToml_dTomlCursor (dtb__111, ((bi_add dtb__108) 1), 1)))) else (((v_Vuna_dCompiler_dFrontend_dToml_dfailAt path) dtb__108) "unexpected character after comment"))
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
)))

let v_Vuna_dCompiler_dFrontend_dToml_dexpectEol = (fun path -> (fun cs -> (match (v_Vuna_dCompiler_dFrontend_dToml_dskipBlank cs) with
  | C_Vuna_dCompiler_dFrontend_dToml_dTomlCursor_Vuna_dCompiler_dFrontend_dToml_dTomlCursor (dtb__112, dtb__113, dtb__114) -> (match dtb__112 with
  | C_Base_dList_dList_Base_dList_dNil -> (C_Base_dResult_dResult_Base_dResult_dOk ((C_Vuna_dCompiler_dFrontend_dToml_dTomlCursor_Vuna_dCompiler_dFrontend_dToml_dTomlCursor (dtb__112, dtb__113, dtb__114))))
  | C_Base_dList_dList_Base_dList_dCons (dtb__115, dtb__116) -> (if ((bi_eq_int dtb__115) 10) then (C_Base_dResult_dResult_Base_dResult_dOk ((C_Vuna_dCompiler_dFrontend_dToml_dTomlCursor_Vuna_dCompiler_dFrontend_dToml_dTomlCursor (dtb__116, ((bi_add dtb__113) 1), 1)))) else (if ((bi_eq_int dtb__115) 35) then ((v_Vuna_dCompiler_dFrontend_dToml_dexpectEolAfterComment path) (C_Vuna_dCompiler_dFrontend_dToml_dTomlCursor_Vuna_dCompiler_dFrontend_dToml_dTomlCursor (dtb__112, dtb__113, dtb__114))) else (((v_Vuna_dCompiler_dFrontend_dToml_dfailAt path) (v_Vuna_dCompiler_dFrontend_dToml_dcursorLine cs)) "unexpected character at end of line")))
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
)))

let rec v_Vuna_dCompiler_dFrontend_dToml_dsamePath = (fun d304 -> (fun mc0 -> (fun mc1 -> (match mc0 with
  | C_Base_dList_dList_Base_dList_dCons (dtb__117, dtb__118) -> (match mc1 with
  | C_Base_dList_dList_Base_dList_dCons (dtb__119, dtb__120) -> (if (((v_Base_dEq_deq d304) dtb__117) dtb__119) then (((v_Vuna_dCompiler_dFrontend_dToml_dsamePath d304) dtb__118) dtb__120) else false)
  | _ -> false
)
  | C_Base_dList_dList_Base_dList_dNil -> (match mc1 with
  | C_Base_dList_dList_Base_dList_dNil -> true
  | _ -> false
)
  | _ -> failwith "DT: impossible branch"
))))

let rec v_Vuna_dCompiler_dFrontend_dToml_dmemSectionPath = (fun d307 -> (fun section -> (fun seen -> (match seen with
  | C_Base_dList_dList_Base_dList_dNil -> false
  | C_Base_dList_dList_Base_dList_dCons (dtb__121, dtb__122) -> (if (((v_Vuna_dCompiler_dFrontend_dToml_dsamePath d307) section) dtb__121) then true else (((v_Vuna_dCompiler_dFrontend_dToml_dmemSectionPath d307) section) dtb__122))
  | _ -> failwith "DT: impossible branch"
))))

let v_Vuna_dCompiler_dFrontend_dToml_dsectionSuffix = (fun section -> (match section with
  | C_Base_dList_dList_Base_dList_dNil -> ""
  | C_Base_dList_dList_Base_dList_dCons (dtb__123, dtb__124) -> ((bi_concat " in [") ((bi_concat (v_Vuna_dCompiler_dCommon_djoinDots section)) "]"))
  | _ -> failwith "DT: impossible branch"
))

let rec v_Vuna_dCompiler_dFrontend_dToml_dhasEntry = (fun section -> (fun key -> (fun entries -> ((fun nd_uscrut3 -> (match nd_uscrut3 with
  | C_Base_dList_dList_Base_dList_dCons (dtb__125, dtb__126) -> (match dtb__125 with
  | C_Vuna_dCompiler_dFrontend_dToml_dTomlEntry_Vuna_dCompiler_dFrontend_dToml_dTomlEntry (dtb__127, dtb__128, dtb__129, dtb__130) -> (if (if (((v_Vuna_dCompiler_dFrontend_dToml_dsamePath v_Eq_uString) section) dtb__127) then ((bi_eq_str dtb__128) key) else false) then true else (((v_Vuna_dCompiler_dFrontend_dToml_dhasEntry section) key) dtb__126))
  | _ -> failwith "DT: impossible branch"
)
  | C_Base_dList_dList_Base_dList_dNil -> false
  | _ -> failwith "DT: impossible branch"
)) entries))))

let rec v_Vuna_dCompiler_dFrontend_dToml_dparseEntryValue = (fun fuel -> (fun path -> (fun cs -> (fun keyLine -> (fun key -> (fun section -> (fun seen -> (fun entries -> (if ((bi_le_int fuel) 0) then (C_Base_dResult_dResult_Base_dResult_dErr ("DT: toml fuel exhausted (internal: toml parser made no progress)")) else ((fun nd_uscrut8 -> (match nd_uscrut8 with
  | C_Base_dResult_dResult_Base_dResult_dOk (dtb__131) -> (match dtb__131 with
  | C_Base_dPair_dPair_Base_dPair_dPair (dtb__132, dtb__133) -> (match ((v_Vuna_dCompiler_dFrontend_dToml_dexpectEol path) dtb__133) with
  | C_Base_dResult_dResult_Base_dResult_dErr (dtb__134) -> (C_Base_dResult_dResult_Base_dResult_dErr (dtb__134))
  | C_Base_dResult_dResult_Base_dResult_dOk (dtb__135) -> (if (((v_Vuna_dCompiler_dFrontend_dToml_dhasEntry section) key) entries) then (((v_Vuna_dCompiler_dFrontend_dToml_dfailAt path) keyLine) ((bi_concat "duplicate key \"") ((bi_concat key) ((bi_concat "\"") (v_Vuna_dCompiler_dFrontend_dToml_dsectionSuffix section))))) else ((((((v_Vuna_dCompiler_dFrontend_dToml_dparseTomlLoop ((bi_sub fuel) 1)) path) dtb__135) section) seen) (C_Base_dList_dList_Base_dList_dCons ((C_Vuna_dCompiler_dFrontend_dToml_dTomlEntry_Vuna_dCompiler_dFrontend_dToml_dTomlEntry (section, key, dtb__132, keyLine)), entries))))
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
)
  | C_Base_dResult_dResult_Base_dResult_dErr (dtb__136) -> (C_Base_dResult_dResult_Base_dResult_dErr (dtb__136))
  | _ -> failwith "DT: impossible branch"
)) ((v_Vuna_dCompiler_dFrontend_dToml_dparseValue path) (v_Vuna_dCompiler_dFrontend_dToml_dskipBlank cs))))))))))))
and v_Vuna_dCompiler_dFrontend_dToml_dparseKeyLine = (fun fuel -> (fun path -> (fun cs -> (fun section -> (fun seen -> (fun entries -> (if ((bi_le_int fuel) 0) then (C_Base_dResult_dResult_Base_dResult_dErr ("DT: toml fuel exhausted (internal: toml parser made no progress)")) else ((fun nd_uscrut6 -> (match nd_uscrut6 with
  | C_Base_dResult_dResult_Base_dResult_dOk (dtb__137) -> (match dtb__137 with
  | C_Base_dPair_dPair_Base_dPair_dPair (dtb__138, dtb__139) -> (match (v_Vuna_dCompiler_dFrontend_dToml_dskipBlank dtb__139) with
  | C_Vuna_dCompiler_dFrontend_dToml_dTomlCursor_Vuna_dCompiler_dFrontend_dToml_dTomlCursor (dtb__140, dtb__141, dtb__142) -> (match dtb__140 with
  | C_Base_dList_dList_Base_dList_dNil -> (((v_Vuna_dCompiler_dFrontend_dToml_dfailAt path) (v_Vuna_dCompiler_dFrontend_dToml_dcursorLine cs)) "expected '=' after key")
  | C_Base_dList_dList_Base_dList_dCons (dtb__143, dtb__144) -> (if ((bi_eq_int dtb__143) 61) then ((((((((v_Vuna_dCompiler_dFrontend_dToml_dparseEntryValue ((bi_sub fuel) 1)) path) (C_Vuna_dCompiler_dFrontend_dToml_dTomlCursor_Vuna_dCompiler_dFrontend_dToml_dTomlCursor (dtb__144, dtb__141, ((bi_add dtb__142) 1)))) (v_Vuna_dCompiler_dFrontend_dToml_dcursorLine cs)) dtb__138) section) seen) entries) else (((v_Vuna_dCompiler_dFrontend_dToml_dfailAt path) (v_Vuna_dCompiler_dFrontend_dToml_dcursorLine cs)) ((bi_concat "expected '=' after key \"") ((bi_concat dtb__138) "\""))))
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
)
  | C_Base_dResult_dResult_Base_dResult_dErr (dtb__145) -> (C_Base_dResult_dResult_Base_dResult_dErr (dtb__145))
  | _ -> failwith "DT: impossible branch"
)) ((v_Vuna_dCompiler_dFrontend_dToml_dparseBareKey path) cs)))))))))
and v_Vuna_dCompiler_dFrontend_dToml_dparseSectionLine = (fun fuel -> (fun path -> (fun cs -> (fun section -> (fun seen -> (fun entries -> (if ((bi_le_int fuel) 0) then (C_Base_dResult_dResult_Base_dResult_dErr ("DT: toml fuel exhausted (internal: toml parser made no progress)")) else ((fun nd_uscrut7 -> (match nd_uscrut7 with
  | C_Base_dResult_dResult_Base_dResult_dOk (dtb__146) -> (match dtb__146 with
  | C_Base_dPair_dPair_Base_dPair_dPair (dtb__147, dtb__148) -> (if (((v_Vuna_dCompiler_dFrontend_dToml_dmemSectionPath v_Eq_uString) dtb__147) seen) then (((v_Vuna_dCompiler_dFrontend_dToml_dfailAt path) (v_Vuna_dCompiler_dFrontend_dToml_dcursorLine cs)) ((bi_concat "duplicate section [") ((bi_concat (v_Vuna_dCompiler_dCommon_djoinDots dtb__147)) "]"))) else (match ((v_Vuna_dCompiler_dFrontend_dToml_dexpectEol path) dtb__148) with
  | C_Base_dResult_dResult_Base_dResult_dErr (dtb__149) -> (C_Base_dResult_dResult_Base_dResult_dErr (dtb__149))
  | C_Base_dResult_dResult_Base_dResult_dOk (dtb__150) -> ((((((v_Vuna_dCompiler_dFrontend_dToml_dparseTomlLoop ((bi_sub fuel) 1)) path) dtb__150) dtb__147) (C_Base_dList_dList_Base_dList_dCons (dtb__147, seen))) entries)
  | _ -> failwith "DT: impossible branch"
))
  | _ -> failwith "DT: impossible branch"
)
  | C_Base_dResult_dResult_Base_dResult_dErr (dtb__151) -> (C_Base_dResult_dResult_Base_dResult_dErr (dtb__151))
  | _ -> failwith "DT: impossible branch"
)) ((v_Vuna_dCompiler_dFrontend_dToml_dparseSectionPath path) (v_Vuna_dCompiler_dFrontend_dToml_dadvanceCursor cs))))))))))
and v_Vuna_dCompiler_dFrontend_dToml_dparseTomlLoop = (fun fuel -> (fun path -> (fun cs -> (fun section -> (fun seen -> (fun entries -> (if ((bi_le_int fuel) 0) then (C_Base_dResult_dResult_Base_dResult_dErr ("DT: toml fuel exhausted (internal: toml parser made no progress)")) else ((((((v_Vuna_dCompiler_dFrontend_dToml_dparseTomlLoopAt ((bi_sub fuel) 1)) path) (v_Vuna_dCompiler_dFrontend_dToml_dskipGap cs)) section) seen) entries))))))))
and v_Vuna_dCompiler_dFrontend_dToml_dparseTomlLoopAt = (fun fuel -> (fun path -> (fun cs -> (fun section -> (fun seen -> (fun entries -> (if ((bi_le_int fuel) 0) then (C_Base_dResult_dResult_Base_dResult_dErr ("DT: toml fuel exhausted (internal: toml parser made no progress)")) else (match (v_Vuna_dCompiler_dFrontend_dToml_dcursorChars cs) with
  | C_Base_dList_dList_Base_dList_dNil -> (C_Base_dResult_dResult_Base_dResult_dOk ((v_Base_dList_dreverse entries)))
  | C_Base_dList_dList_Base_dList_dCons (dtb__152, dtb__153) -> (if ((bi_eq_int dtb__152) 91) then ((((((v_Vuna_dCompiler_dFrontend_dToml_dparseSectionLine ((bi_sub fuel) 1)) path) cs) section) seen) entries) else ((((((v_Vuna_dCompiler_dFrontend_dToml_dparseKeyLine ((bi_sub fuel) 1)) path) cs) section) seen) entries))
  | _ -> failwith "DT: impossible branch"
))))))))

let v_Vuna_dCompiler_dFrontend_dToml_dparseTomlAt = (fun path -> (fun source -> ((fun cs -> ((((((v_Vuna_dCompiler_dFrontend_dToml_dparseTomlLoop (v_Vuna_dCompiler_dFrontend_dToml_dlineFuel cs)) path) cs) C_Base_dList_dList_Base_dList_dNil) C_Base_dList_dList_Base_dList_dNil) C_Base_dList_dList_Base_dList_dNil)) (C_Vuna_dCompiler_dFrontend_dToml_dTomlCursor_Vuna_dCompiler_dFrontend_dToml_dTomlCursor ((v_Vuna_dCompiler_dFrontend_dToml_dstripCR (dtp_unpack source)), 1, 1)))))

let v_Vuna_dCompiler_dFrontend_dToml_dparseToml = (fun source -> ((v_Vuna_dCompiler_dFrontend_dToml_dparseTomlAt "") source))

let rec v_Vuna_dCompiler_dFrontend_dToml_dlookupEntry = (fun section -> (fun key -> (fun entries -> ((fun nd_uscrut3 -> (match nd_uscrut3 with
  | C_Base_dList_dList_Base_dList_dCons (dtb__154, dtb__155) -> (match dtb__154 with
  | C_Vuna_dCompiler_dFrontend_dToml_dTomlEntry_Vuna_dCompiler_dFrontend_dToml_dTomlEntry (dtb__156, dtb__157, dtb__158, dtb__159) -> (if (if (((v_Vuna_dCompiler_dFrontend_dToml_dsamePath v_Eq_uString) section) dtb__156) then ((bi_eq_str dtb__157) key) else false) then (C_Base_dMaybe_dMaybe_Base_dMaybe_dJust (dtb__158)) else (((v_Vuna_dCompiler_dFrontend_dToml_dlookupEntry section) key) dtb__155))
  | _ -> failwith "DT: impossible branch"
)
  | C_Base_dList_dList_Base_dList_dNil -> C_Base_dMaybe_dMaybe_Base_dMaybe_dNothing
  | _ -> failwith "DT: impossible branch"
)) entries))))

let rec v_Vuna_dCompiler_dFrontend_dToml_dlookupEntryLine = (fun section -> (fun key -> (fun entries -> ((fun nd_uscrut3 -> (match nd_uscrut3 with
  | C_Base_dList_dList_Base_dList_dCons (dtb__160, dtb__161) -> (match dtb__160 with
  | C_Vuna_dCompiler_dFrontend_dToml_dTomlEntry_Vuna_dCompiler_dFrontend_dToml_dTomlEntry (dtb__162, dtb__163, dtb__164, dtb__165) -> (if (if (((v_Vuna_dCompiler_dFrontend_dToml_dsamePath v_Eq_uString) section) dtb__162) then ((bi_eq_str dtb__163) key) else false) then (C_Base_dMaybe_dMaybe_Base_dMaybe_dJust (dtb__165)) else (((v_Vuna_dCompiler_dFrontend_dToml_dlookupEntryLine section) key) dtb__161))
  | _ -> failwith "DT: impossible branch"
)
  | C_Base_dList_dList_Base_dList_dNil -> C_Base_dMaybe_dMaybe_Base_dMaybe_dNothing
  | _ -> failwith "DT: impossible branch"
)) entries))))
