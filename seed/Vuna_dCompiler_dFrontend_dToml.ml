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
  | C_Vuna_dCompiler_dFrontend_dToml_dTomlCursor_Vuna_dCompiler_dFrontend_dToml_dTomlCursor (dtb__9, dtb__10, dtb__11) -> ((bi_add ((bi_mul 8) (v_Base_dList_dlength dtb__9))) 64)
  | _ -> failwith "DT: impossible branch"
))

let v_Vuna_dCompiler_dFrontend_dToml_dadvanceCursor = (fun mc0 -> (match mc0 with
  | C_Vuna_dCompiler_dFrontend_dToml_dTomlCursor_Vuna_dCompiler_dFrontend_dToml_dTomlCursor (dtb__12, dtb__13, dtb__14) -> (match dtb__12 with
  | C_Base_dList_dList_Cons (dtb__15, dtb__16) -> (if ((bi_eq_int dtb__15) 10) then (C_Vuna_dCompiler_dFrontend_dToml_dTomlCursor_Vuna_dCompiler_dFrontend_dToml_dTomlCursor (dtb__16, ((bi_add dtb__13) 1), 1)) else (C_Vuna_dCompiler_dFrontend_dToml_dTomlCursor_Vuna_dCompiler_dFrontend_dToml_dTomlCursor (dtb__16, dtb__13, ((bi_add dtb__14) 1))))
  | C_Base_dList_dList_Nil -> (C_Vuna_dCompiler_dFrontend_dToml_dTomlCursor_Vuna_dCompiler_dFrontend_dToml_dTomlCursor (C_Base_dList_dList_Nil, dtb__13, dtb__14))
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
  | C_Base_dList_dList_Cons (dtb__17, dtb__18) -> (if ((bi_eq_int dtb__17) 13) then (v_Vuna_dCompiler_dFrontend_dToml_dstripCR dtb__18) else (C_Base_dList_dList_Cons (dtb__17, (v_Vuna_dCompiler_dFrontend_dToml_dstripCR dtb__18))))
  | C_Base_dList_dList_Nil -> C_Base_dList_dList_Nil
  | _ -> failwith "DT: impossible branch"
))

let v_Vuna_dCompiler_dFrontend_dToml_dlocPrefix = (fun path -> (fun line -> (if ((bi_eq_str path) "") then ((bi_concat "line ") ((bi_concat (bi_strFromInt line)) ": ")) else ((bi_concat path) ((bi_concat ":") ((bi_concat (bi_strFromInt line)) ": "))))))

let v_Vuna_dCompiler_dFrontend_dToml_dfailAt = (fun path -> (fun line -> (fun msg -> (C_Base_dResult_dResult_Base_dResult_dErr (((bi_concat ((v_Vuna_dCompiler_dFrontend_dToml_dlocPrefix path) line)) msg))))))

let rec v_Vuna_dCompiler_dFrontend_dToml_dskipBlank = (fun mc0 -> (match mc0 with
  | C_Vuna_dCompiler_dFrontend_dToml_dTomlCursor_Vuna_dCompiler_dFrontend_dToml_dTomlCursor (dtb__19, dtb__20, dtb__21) -> (match dtb__19 with
  | C_Base_dList_dList_Cons (dtb__22, dtb__23) -> (if (v_Vuna_dCompiler_dFrontend_dToml_disBlankChar dtb__22) then (v_Vuna_dCompiler_dFrontend_dToml_dskipBlank (C_Vuna_dCompiler_dFrontend_dToml_dTomlCursor_Vuna_dCompiler_dFrontend_dToml_dTomlCursor (dtb__23, dtb__20, ((bi_add dtb__21) 1)))) else (C_Vuna_dCompiler_dFrontend_dToml_dTomlCursor_Vuna_dCompiler_dFrontend_dToml_dTomlCursor ((C_Base_dList_dList_Cons (dtb__22, dtb__23)), dtb__20, dtb__21)))
  | C_Base_dList_dList_Nil -> (C_Vuna_dCompiler_dFrontend_dToml_dTomlCursor_Vuna_dCompiler_dFrontend_dToml_dTomlCursor (C_Base_dList_dList_Nil, dtb__20, dtb__21))
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
))

let rec v_Vuna_dCompiler_dFrontend_dToml_dskipComment = (fun mc0 -> (match mc0 with
  | C_Vuna_dCompiler_dFrontend_dToml_dTomlCursor_Vuna_dCompiler_dFrontend_dToml_dTomlCursor (dtb__24, dtb__25, dtb__26) -> (match dtb__24 with
  | C_Base_dList_dList_Cons (dtb__27, dtb__28) -> (if ((bi_eq_int dtb__27) 10) then (C_Vuna_dCompiler_dFrontend_dToml_dTomlCursor_Vuna_dCompiler_dFrontend_dToml_dTomlCursor ((C_Base_dList_dList_Cons (dtb__27, dtb__28)), dtb__25, dtb__26)) else (v_Vuna_dCompiler_dFrontend_dToml_dskipComment (C_Vuna_dCompiler_dFrontend_dToml_dTomlCursor_Vuna_dCompiler_dFrontend_dToml_dTomlCursor (dtb__28, dtb__25, ((bi_add dtb__26) 1)))))
  | C_Base_dList_dList_Nil -> (C_Vuna_dCompiler_dFrontend_dToml_dTomlCursor_Vuna_dCompiler_dFrontend_dToml_dTomlCursor (C_Base_dList_dList_Nil, dtb__25, dtb__26))
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
))

let rec v_Vuna_dCompiler_dFrontend_dToml_dskipGapGo = (fun mc0 -> (fun mc1 -> (match mc1 with
  | C_Vuna_dCompiler_dFrontend_dToml_dTomlCursor_Vuna_dCompiler_dFrontend_dToml_dTomlCursor (dtb__29, dtb__30, dtb__31) -> (match dtb__29 with
  | C_Base_dList_dList_Cons (dtb__32, dtb__33) -> (if mc0 then (if ((bi_eq_int dtb__32) 10) then ((v_Vuna_dCompiler_dFrontend_dToml_dskipGapGo false) (C_Vuna_dCompiler_dFrontend_dToml_dTomlCursor_Vuna_dCompiler_dFrontend_dToml_dTomlCursor (dtb__33, ((bi_add dtb__30) 1), 1))) else ((v_Vuna_dCompiler_dFrontend_dToml_dskipGapGo true) (C_Vuna_dCompiler_dFrontend_dToml_dTomlCursor_Vuna_dCompiler_dFrontend_dToml_dTomlCursor (dtb__33, dtb__30, ((bi_add dtb__31) 1))))) else (if (v_Vuna_dCompiler_dFrontend_dToml_disBlankChar dtb__32) then ((v_Vuna_dCompiler_dFrontend_dToml_dskipGapGo false) (C_Vuna_dCompiler_dFrontend_dToml_dTomlCursor_Vuna_dCompiler_dFrontend_dToml_dTomlCursor (dtb__33, dtb__30, ((bi_add dtb__31) 1)))) else (if ((bi_eq_int dtb__32) 10) then ((v_Vuna_dCompiler_dFrontend_dToml_dskipGapGo false) (C_Vuna_dCompiler_dFrontend_dToml_dTomlCursor_Vuna_dCompiler_dFrontend_dToml_dTomlCursor (dtb__33, ((bi_add dtb__30) 1), 1))) else (if ((bi_eq_int dtb__32) 35) then ((v_Vuna_dCompiler_dFrontend_dToml_dskipGapGo true) (C_Vuna_dCompiler_dFrontend_dToml_dTomlCursor_Vuna_dCompiler_dFrontend_dToml_dTomlCursor (dtb__33, dtb__30, ((bi_add dtb__31) 1)))) else (C_Vuna_dCompiler_dFrontend_dToml_dTomlCursor_Vuna_dCompiler_dFrontend_dToml_dTomlCursor ((C_Base_dList_dList_Cons (dtb__32, dtb__33)), dtb__30, dtb__31))))))
  | C_Base_dList_dList_Nil -> (C_Vuna_dCompiler_dFrontend_dToml_dTomlCursor_Vuna_dCompiler_dFrontend_dToml_dTomlCursor (C_Base_dList_dList_Nil, dtb__30, dtb__31))
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
)))

let v_Vuna_dCompiler_dFrontend_dToml_dskipGap = (fun cs -> ((v_Vuna_dCompiler_dFrontend_dToml_dskipGapGo false) cs))

let rec v_Vuna_dCompiler_dFrontend_dToml_dcollectBareKey = (fun mc0 -> (fun mc1 -> (match mc0 with
  | C_Vuna_dCompiler_dFrontend_dToml_dTomlCursor_Vuna_dCompiler_dFrontend_dToml_dTomlCursor (dtb__34, dtb__35, dtb__36) -> (match dtb__34 with
  | C_Base_dList_dList_Cons (dtb__37, dtb__38) -> (if (v_Vuna_dCompiler_dFrontend_dToml_disBareKeyChar dtb__37) then ((v_Vuna_dCompiler_dFrontend_dToml_dcollectBareKey (C_Vuna_dCompiler_dFrontend_dToml_dTomlCursor_Vuna_dCompiler_dFrontend_dToml_dTomlCursor (dtb__38, dtb__35, ((bi_add dtb__36) 1)))) (C_Base_dList_dList_Cons (dtb__37, mc1))) else (C_Base_dPair_dPair_Base_dPair_dPair ((dtp_pack (v_Base_dList_dreverse mc1)), (C_Vuna_dCompiler_dFrontend_dToml_dTomlCursor_Vuna_dCompiler_dFrontend_dToml_dTomlCursor ((C_Base_dList_dList_Cons (dtb__37, dtb__38)), dtb__35, dtb__36)))))
  | C_Base_dList_dList_Nil -> (C_Base_dPair_dPair_Base_dPair_dPair ((dtp_pack (v_Base_dList_dreverse mc1)), (C_Vuna_dCompiler_dFrontend_dToml_dTomlCursor_Vuna_dCompiler_dFrontend_dToml_dTomlCursor (C_Base_dList_dList_Nil, dtb__35, dtb__36))))
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
)))

let v_Vuna_dCompiler_dFrontend_dToml_dparseBareKey = (fun path -> (fun cs -> (match (v_Vuna_dCompiler_dFrontend_dToml_dcursorChars cs) with
  | C_Base_dList_dList_Nil -> (((v_Vuna_dCompiler_dFrontend_dToml_dfailAt path) (v_Vuna_dCompiler_dFrontend_dToml_dcursorLine cs)) "expected a key")
  | C_Base_dList_dList_Cons (dtb__39, dtb__40) -> (if (v_Vuna_dCompiler_dFrontend_dToml_disBareKeyChar dtb__39) then (match ((v_Vuna_dCompiler_dFrontend_dToml_dcollectBareKey cs) C_Base_dList_dList_Nil) with
  | C_Base_dPair_dPair_Base_dPair_dPair (dtb__41, dtb__42) -> (C_Base_dResult_dResult_Base_dResult_dOk ((C_Base_dPair_dPair_Base_dPair_dPair (dtb__41, dtb__42))))
  | _ -> failwith "DT: impossible branch"
) else (((v_Vuna_dCompiler_dFrontend_dToml_dfailAt path) (v_Vuna_dCompiler_dFrontend_dToml_dcursorLine cs)) "expected a key"))
  | _ -> failwith "DT: impossible branch"
)))

let rec v_Vuna_dCompiler_dFrontend_dToml_dparseStringChars = (fun fuel -> (fun path -> (fun startCs -> (fun cs -> (fun acc -> (if ((bi_le_int fuel) 0) then (C_Base_dResult_dResult_Base_dResult_dErr ("DT: toml fuel exhausted (internal: toml parser made no progress)")) else (match (v_Vuna_dCompiler_dFrontend_dToml_dcursorChars cs) with
  | C_Base_dList_dList_Nil -> (((v_Vuna_dCompiler_dFrontend_dToml_dfailAt path) (v_Vuna_dCompiler_dFrontend_dToml_dcursorLine startCs)) "unterminated basic string")
  | C_Base_dList_dList_Cons (dtb__43, dtb__44) -> (if ((bi_eq_int dtb__43) 34) then (C_Base_dResult_dResult_Base_dResult_dOk ((C_Base_dPair_dPair_Base_dPair_dPair ((dtp_pack (v_Base_dList_dreverse acc)), (v_Vuna_dCompiler_dFrontend_dToml_dadvanceCursor cs))))) else (if ((bi_eq_int dtb__43) 10) then (((v_Vuna_dCompiler_dFrontend_dToml_dfailAt path) (v_Vuna_dCompiler_dFrontend_dToml_dcursorLine startCs)) "unterminated basic string (newline in string)") else (if ((bi_eq_int dtb__43) 92) then (((((v_Vuna_dCompiler_dFrontend_dToml_dparseStringEscape ((bi_sub fuel) 1)) path) startCs) (v_Vuna_dCompiler_dFrontend_dToml_dadvanceCursor cs)) acc) else (((((v_Vuna_dCompiler_dFrontend_dToml_dparseStringChars ((bi_sub fuel) 1)) path) startCs) (v_Vuna_dCompiler_dFrontend_dToml_dadvanceCursor cs)) (C_Base_dList_dList_Cons (dtb__43, acc))))))
  | _ -> failwith "DT: impossible branch"
)))))))
and v_Vuna_dCompiler_dFrontend_dToml_dparseStringEscape = (fun fuel -> (fun path -> (fun startCs -> (fun cs -> (fun acc -> (if ((bi_le_int fuel) 0) then (C_Base_dResult_dResult_Base_dResult_dErr ("DT: toml fuel exhausted (internal: toml parser made no progress)")) else (match (v_Vuna_dCompiler_dFrontend_dToml_dcursorChars cs) with
  | C_Base_dList_dList_Nil -> (((v_Vuna_dCompiler_dFrontend_dToml_dfailAt path) (v_Vuna_dCompiler_dFrontend_dToml_dcursorLine startCs)) "unterminated escape sequence")
  | C_Base_dList_dList_Cons (dtb__45, dtb__46) -> (if ((bi_eq_int dtb__45) 110) then (((((v_Vuna_dCompiler_dFrontend_dToml_dparseStringChars ((bi_sub fuel) 1)) path) startCs) (v_Vuna_dCompiler_dFrontend_dToml_dadvanceCursor cs)) (C_Base_dList_dList_Cons (10, acc))) else (if ((bi_eq_int dtb__45) 116) then (((((v_Vuna_dCompiler_dFrontend_dToml_dparseStringChars ((bi_sub fuel) 1)) path) startCs) (v_Vuna_dCompiler_dFrontend_dToml_dadvanceCursor cs)) (C_Base_dList_dList_Cons (9, acc))) else (if ((bi_eq_int dtb__45) 114) then (((((v_Vuna_dCompiler_dFrontend_dToml_dparseStringChars ((bi_sub fuel) 1)) path) startCs) (v_Vuna_dCompiler_dFrontend_dToml_dadvanceCursor cs)) (C_Base_dList_dList_Cons (13, acc))) else (if ((bi_eq_int dtb__45) 98) then (((((v_Vuna_dCompiler_dFrontend_dToml_dparseStringChars ((bi_sub fuel) 1)) path) startCs) (v_Vuna_dCompiler_dFrontend_dToml_dadvanceCursor cs)) (C_Base_dList_dList_Cons (8, acc))) else (if ((bi_eq_int dtb__45) 102) then (((((v_Vuna_dCompiler_dFrontend_dToml_dparseStringChars ((bi_sub fuel) 1)) path) startCs) (v_Vuna_dCompiler_dFrontend_dToml_dadvanceCursor cs)) (C_Base_dList_dList_Cons (12, acc))) else (if ((bi_eq_int dtb__45) 34) then (((((v_Vuna_dCompiler_dFrontend_dToml_dparseStringChars ((bi_sub fuel) 1)) path) startCs) (v_Vuna_dCompiler_dFrontend_dToml_dadvanceCursor cs)) (C_Base_dList_dList_Cons (34, acc))) else (if ((bi_eq_int dtb__45) 92) then (((((v_Vuna_dCompiler_dFrontend_dToml_dparseStringChars ((bi_sub fuel) 1)) path) startCs) (v_Vuna_dCompiler_dFrontend_dToml_dadvanceCursor cs)) (C_Base_dList_dList_Cons (92, acc))) else (((v_Vuna_dCompiler_dFrontend_dToml_dfailAt path) (v_Vuna_dCompiler_dFrontend_dToml_dcursorLine cs)) ((bi_concat "unknown escape sequence \\") (dtp_pack (C_Base_dList_dList_Cons (dtb__45, C_Base_dList_dList_Nil))))))))))))
  | _ -> failwith "DT: impossible branch"
)))))))

let v_Vuna_dCompiler_dFrontend_dToml_dparseStringValue = (fun path -> (fun cs -> (match (v_Vuna_dCompiler_dFrontend_dToml_dcursorChars cs) with
  | C_Base_dList_dList_Nil -> (((v_Vuna_dCompiler_dFrontend_dToml_dfailAt path) (v_Vuna_dCompiler_dFrontend_dToml_dcursorLine cs)) "unterminated basic string")
  | C_Base_dList_dList_Cons (dtb__47, dtb__48) -> ((fun cs1 -> (((((v_Vuna_dCompiler_dFrontend_dToml_dparseStringChars (v_Vuna_dCompiler_dFrontend_dToml_dcursorFuel cs1)) path) cs) cs1) C_Base_dList_dList_Nil)) (v_Vuna_dCompiler_dFrontend_dToml_dadvanceCursor cs))
  | _ -> failwith "DT: impossible branch"
)))

let v_Vuna_dCompiler_dFrontend_dToml_dmakeInteger = (fun acc -> (fun negative -> (if negative then ((bi_sub 0) acc) else acc)))

let v_Vuna_dCompiler_dFrontend_dToml_dfinishInteger = (fun path -> (fun startCs -> (fun cs -> (fun count -> (fun acc -> (fun negative -> (if ((bi_eq_int count) 0) then (((v_Vuna_dCompiler_dFrontend_dToml_dfailAt path) (v_Vuna_dCompiler_dFrontend_dToml_dcursorLine startCs)) "expected digits for integer") else (match (v_Vuna_dCompiler_dFrontend_dToml_dcursorChars cs) with
  | C_Base_dList_dList_Nil -> (C_Base_dResult_dResult_Base_dResult_dOk ((C_Base_dPair_dPair_Base_dPair_dPair (((v_Vuna_dCompiler_dFrontend_dToml_dmakeInteger acc) negative), cs))))
  | C_Base_dList_dList_Cons (dtb__49, dtb__50) -> (if ((bi_eq_int dtb__49) 46) then (((v_Vuna_dCompiler_dFrontend_dToml_dfailAt path) (v_Vuna_dCompiler_dFrontend_dToml_dcursorLine startCs)) "floating point numbers are not supported") else (if (v_Vuna_dCompiler_dFrontend_dToml_disBareKeyChar dtb__49) then (((v_Vuna_dCompiler_dFrontend_dToml_dfailAt path) (v_Vuna_dCompiler_dFrontend_dToml_dcursorLine startCs)) "invalid integer literal") else (C_Base_dResult_dResult_Base_dResult_dOk ((C_Base_dPair_dPair_Base_dPair_dPair (((v_Vuna_dCompiler_dFrontend_dToml_dmakeInteger acc) negative), cs))))))
  | _ -> failwith "DT: impossible branch"
))))))))

let rec v_Vuna_dCompiler_dFrontend_dToml_dparseIntegerDigits = (fun fuel -> (fun path -> (fun startCs -> (fun cs -> (fun count -> (fun acc -> (fun negative -> (if ((bi_le_int fuel) 0) then (C_Base_dResult_dResult_Base_dResult_dErr ("DT: toml fuel exhausted (internal: toml parser made no progress)")) else (match (v_Vuna_dCompiler_dFrontend_dToml_dcursorChars cs) with
  | C_Base_dList_dList_Nil -> ((((((v_Vuna_dCompiler_dFrontend_dToml_dfinishInteger path) startCs) cs) count) acc) negative)
  | C_Base_dList_dList_Cons (dtb__51, dtb__52) -> (if (v_Vuna_dCompiler_dFrontend_dToml_disDigitChar dtb__51) then (((((((v_Vuna_dCompiler_dFrontend_dToml_dparseIntegerDigits ((bi_sub fuel) 1)) path) startCs) (v_Vuna_dCompiler_dFrontend_dToml_dadvanceCursor cs)) ((bi_add count) 1)) ((bi_add ((bi_mul acc) 10)) ((bi_sub dtb__51) 48))) negative) else ((((((v_Vuna_dCompiler_dFrontend_dToml_dfinishInteger path) startCs) cs) count) acc) negative))
  | _ -> failwith "DT: impossible branch"
)))))))))

let v_Vuna_dCompiler_dFrontend_dToml_dparseInteger = (fun path -> (fun cs -> (match (v_Vuna_dCompiler_dFrontend_dToml_dcursorChars cs) with
  | C_Base_dList_dList_Nil -> (((v_Vuna_dCompiler_dFrontend_dToml_dfailAt path) (v_Vuna_dCompiler_dFrontend_dToml_dcursorLine cs)) "expected an integer")
  | C_Base_dList_dList_Cons (dtb__53, dtb__54) -> (if ((bi_eq_int dtb__53) 45) then (((((((v_Vuna_dCompiler_dFrontend_dToml_dparseIntegerDigits (v_Vuna_dCompiler_dFrontend_dToml_dcursorFuel cs)) path) cs) (v_Vuna_dCompiler_dFrontend_dToml_dadvanceCursor cs)) 0) 0) true) else (if (v_Vuna_dCompiler_dFrontend_dToml_disDigitChar dtb__53) then (((((((v_Vuna_dCompiler_dFrontend_dToml_dparseIntegerDigits (v_Vuna_dCompiler_dFrontend_dToml_dcursorFuel cs)) path) cs) cs) 0) 0) false) else (((v_Vuna_dCompiler_dFrontend_dToml_dfailAt path) (v_Vuna_dCompiler_dFrontend_dToml_dcursorLine cs)) "expected an integer")))
  | _ -> failwith "DT: impossible branch"
)))

let v_Vuna_dCompiler_dFrontend_dToml_dparseIntValue = (fun path -> (fun cs -> (match ((v_Vuna_dCompiler_dFrontend_dToml_dparseInteger path) cs) with
  | C_Base_dResult_dResult_Base_dResult_dErr (dtb__55) -> (C_Base_dResult_dResult_Base_dResult_dErr (dtb__55))
  | C_Base_dResult_dResult_Base_dResult_dOk (dtb__56) -> (match dtb__56 with
  | C_Base_dPair_dPair_Base_dPair_dPair (dtb__57, dtb__58) -> (C_Base_dResult_dResult_Base_dResult_dOk ((C_Base_dPair_dPair_Base_dPair_dPair ((C_Vuna_dCompiler_dFrontend_dToml_dTomlValue_Vuna_dCompiler_dFrontend_dToml_dTInt (dtb__57)), dtb__58))))
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
)))

let rec v_Vuna_dCompiler_dFrontend_dToml_dmatchChars = (fun mc0 -> (fun mc1 -> (match mc0 with
  | C_Base_dList_dList_Cons (dtb__59, dtb__60) -> (match mc1 with
  | C_Vuna_dCompiler_dFrontend_dToml_dTomlCursor_Vuna_dCompiler_dFrontend_dToml_dTomlCursor (dtb__61, dtb__62, dtb__63) -> (match dtb__61 with
  | C_Base_dList_dList_Cons (dtb__64, dtb__65) -> (if ((bi_eq_int dtb__64) dtb__59) then ((v_Vuna_dCompiler_dFrontend_dToml_dmatchChars dtb__60) (C_Vuna_dCompiler_dFrontend_dToml_dTomlCursor_Vuna_dCompiler_dFrontend_dToml_dTomlCursor (dtb__65, dtb__62, ((bi_add dtb__63) 1)))) else C_Base_dMaybe_dMaybe_Base_dMaybe_dNothing)
  | C_Base_dList_dList_Nil -> C_Base_dMaybe_dMaybe_Base_dMaybe_dNothing
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
)
  | C_Base_dList_dList_Nil -> (C_Base_dMaybe_dMaybe_Base_dMaybe_dJust (mc1))
  | _ -> failwith "DT: impossible branch"
)))

let v_Vuna_dCompiler_dFrontend_dToml_dmatchWord = (fun word -> (fun cs -> (match ((v_Vuna_dCompiler_dFrontend_dToml_dmatchChars (dtp_unpack word)) cs) with
  | C_Base_dMaybe_dMaybe_Base_dMaybe_dNothing -> C_Base_dMaybe_dMaybe_Base_dMaybe_dNothing
  | C_Base_dMaybe_dMaybe_Base_dMaybe_dJust (dtb__66) -> (match (v_Vuna_dCompiler_dFrontend_dToml_dcursorChars dtb__66) with
  | C_Base_dList_dList_Nil -> (C_Base_dMaybe_dMaybe_Base_dMaybe_dJust (dtb__66))
  | C_Base_dList_dList_Cons (dtb__67, dtb__68) -> (if (v_Vuna_dCompiler_dFrontend_dToml_disBareKeyChar dtb__67) then C_Base_dMaybe_dMaybe_Base_dMaybe_dNothing else (C_Base_dMaybe_dMaybe_Base_dMaybe_dJust (dtb__66)))
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
)))

let rec v_Vuna_dCompiler_dFrontend_dToml_dparseArrayItems = (fun fuel -> (fun path -> (fun cs -> (fun acc -> (if ((bi_le_int fuel) 0) then (C_Base_dResult_dResult_Base_dResult_dErr ("DT: toml fuel exhausted (internal: toml parser made no progress)")) else (match (v_Vuna_dCompiler_dFrontend_dToml_dskipGap cs) with
  | C_Vuna_dCompiler_dFrontend_dToml_dTomlCursor_Vuna_dCompiler_dFrontend_dToml_dTomlCursor (dtb__69, dtb__70, dtb__71) -> (match dtb__69 with
  | C_Base_dList_dList_Nil -> (((v_Vuna_dCompiler_dFrontend_dToml_dfailAt path) dtb__70) "unterminated array")
  | C_Base_dList_dList_Cons (dtb__72, dtb__73) -> (if ((bi_eq_int dtb__72) 93) then (C_Base_dResult_dResult_Base_dResult_dOk ((C_Base_dPair_dPair_Base_dPair_dPair ((C_Vuna_dCompiler_dFrontend_dToml_dTomlValue_Vuna_dCompiler_dFrontend_dToml_dTList ((v_Base_dList_dreverse acc))), (v_Vuna_dCompiler_dFrontend_dToml_dadvanceCursor (C_Vuna_dCompiler_dFrontend_dToml_dTomlCursor_Vuna_dCompiler_dFrontend_dToml_dTomlCursor (dtb__69, dtb__70, dtb__71))))))) else (if ((bi_eq_int dtb__72) 34) then ((((v_Vuna_dCompiler_dFrontend_dToml_dparseArrayString ((bi_sub fuel) 1)) path) (C_Vuna_dCompiler_dFrontend_dToml_dTomlCursor_Vuna_dCompiler_dFrontend_dToml_dTomlCursor (dtb__69, dtb__70, dtb__71))) acc) else (((v_Vuna_dCompiler_dFrontend_dToml_dfailAt path) dtb__70) "expected a string in array")))
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
))))))
and v_Vuna_dCompiler_dFrontend_dToml_dparseArrayString = (fun fuel -> (fun path -> (fun cs -> (fun acc -> (if ((bi_le_int fuel) 0) then (C_Base_dResult_dResult_Base_dResult_dErr ("DT: toml fuel exhausted (internal: toml parser made no progress)")) else (match ((v_Vuna_dCompiler_dFrontend_dToml_dparseStringValue path) cs) with
  | C_Base_dResult_dResult_Base_dResult_dErr (dtb__74) -> (C_Base_dResult_dResult_Base_dResult_dErr (dtb__74))
  | C_Base_dResult_dResult_Base_dResult_dOk (dtb__75) -> (match dtb__75 with
  | C_Base_dPair_dPair_Base_dPair_dPair (dtb__76, dtb__77) -> (match (v_Vuna_dCompiler_dFrontend_dToml_dskipGap dtb__77) with
  | C_Vuna_dCompiler_dFrontend_dToml_dTomlCursor_Vuna_dCompiler_dFrontend_dToml_dTomlCursor (dtb__78, dtb__79, dtb__80) -> (match dtb__78 with
  | C_Base_dList_dList_Nil -> (((v_Vuna_dCompiler_dFrontend_dToml_dfailAt path) dtb__79) "unterminated array")
  | C_Base_dList_dList_Cons (dtb__81, dtb__82) -> (if ((bi_eq_int dtb__81) 44) then ((((v_Vuna_dCompiler_dFrontend_dToml_dparseArrayItems ((bi_sub fuel) 1)) path) (v_Vuna_dCompiler_dFrontend_dToml_dadvanceCursor (C_Vuna_dCompiler_dFrontend_dToml_dTomlCursor_Vuna_dCompiler_dFrontend_dToml_dTomlCursor (dtb__78, dtb__79, dtb__80)))) (C_Base_dList_dList_Cons (dtb__76, acc))) else (if ((bi_eq_int dtb__81) 93) then (C_Base_dResult_dResult_Base_dResult_dOk ((C_Base_dPair_dPair_Base_dPair_dPair ((C_Vuna_dCompiler_dFrontend_dToml_dTomlValue_Vuna_dCompiler_dFrontend_dToml_dTList ((v_Base_dList_dreverse (C_Base_dList_dList_Cons (dtb__76, acc))))), (v_Vuna_dCompiler_dFrontend_dToml_dadvanceCursor (C_Vuna_dCompiler_dFrontend_dToml_dTomlCursor_Vuna_dCompiler_dFrontend_dToml_dTomlCursor (dtb__78, dtb__79, dtb__80))))))) else (((v_Vuna_dCompiler_dFrontend_dToml_dfailAt path) dtb__79) "expected ',' or ']' in array")))
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
))))))

let v_Vuna_dCompiler_dFrontend_dToml_dparseStringArray = (fun path -> (fun cs -> (match (v_Vuna_dCompiler_dFrontend_dToml_dcursorChars cs) with
  | C_Base_dList_dList_Nil -> (((v_Vuna_dCompiler_dFrontend_dToml_dfailAt path) (v_Vuna_dCompiler_dFrontend_dToml_dcursorLine cs)) "unterminated array")
  | C_Base_dList_dList_Cons (dtb__83, dtb__84) -> ((fun cs1 -> ((((v_Vuna_dCompiler_dFrontend_dToml_dparseArrayItems (v_Vuna_dCompiler_dFrontend_dToml_dcursorFuel cs1)) path) cs1) C_Base_dList_dList_Nil)) (v_Vuna_dCompiler_dFrontend_dToml_dadvanceCursor cs))
  | _ -> failwith "DT: impossible branch"
)))

let v_Vuna_dCompiler_dFrontend_dToml_dparseValue = (fun path -> (fun cs -> (match (v_Vuna_dCompiler_dFrontend_dToml_dcursorChars cs) with
  | C_Base_dList_dList_Nil -> (((v_Vuna_dCompiler_dFrontend_dToml_dfailAt path) (v_Vuna_dCompiler_dFrontend_dToml_dcursorLine cs)) "expected a value")
  | C_Base_dList_dList_Cons (dtb__85, dtb__86) -> (if ((bi_eq_int dtb__85) 34) then (match ((v_Vuna_dCompiler_dFrontend_dToml_dparseStringValue path) cs) with
  | C_Base_dResult_dResult_Base_dResult_dErr (dtb__87) -> (C_Base_dResult_dResult_Base_dResult_dErr (dtb__87))
  | C_Base_dResult_dResult_Base_dResult_dOk (dtb__88) -> (match dtb__88 with
  | C_Base_dPair_dPair_Base_dPair_dPair (dtb__89, dtb__90) -> (C_Base_dResult_dResult_Base_dResult_dOk ((C_Base_dPair_dPair_Base_dPair_dPair ((C_Vuna_dCompiler_dFrontend_dToml_dTomlValue_Vuna_dCompiler_dFrontend_dToml_dTStr (dtb__89)), dtb__90))))
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
) else (if ((bi_eq_int dtb__85) 91) then ((v_Vuna_dCompiler_dFrontend_dToml_dparseStringArray path) cs) else (if ((bi_eq_int dtb__85) 45) then ((v_Vuna_dCompiler_dFrontend_dToml_dparseIntValue path) cs) else (if (v_Vuna_dCompiler_dFrontend_dToml_disDigitChar dtb__85) then ((v_Vuna_dCompiler_dFrontend_dToml_dparseIntValue path) cs) else (match ((v_Vuna_dCompiler_dFrontend_dToml_dmatchWord "true") cs) with
  | C_Base_dMaybe_dMaybe_Base_dMaybe_dJust (dtb__91) -> (C_Base_dResult_dResult_Base_dResult_dOk ((C_Base_dPair_dPair_Base_dPair_dPair ((C_Vuna_dCompiler_dFrontend_dToml_dTomlValue_Vuna_dCompiler_dFrontend_dToml_dTBool (true)), dtb__91))))
  | C_Base_dMaybe_dMaybe_Base_dMaybe_dNothing -> (match ((v_Vuna_dCompiler_dFrontend_dToml_dmatchWord "false") cs) with
  | C_Base_dMaybe_dMaybe_Base_dMaybe_dJust (dtb__92) -> (C_Base_dResult_dResult_Base_dResult_dOk ((C_Base_dPair_dPair_Base_dPair_dPair ((C_Vuna_dCompiler_dFrontend_dToml_dTomlValue_Vuna_dCompiler_dFrontend_dToml_dTBool (false)), dtb__92))))
  | C_Base_dMaybe_dMaybe_Base_dMaybe_dNothing -> (((v_Vuna_dCompiler_dFrontend_dToml_dfailAt path) (v_Vuna_dCompiler_dFrontend_dToml_dcursorLine cs)) "expected a value")
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
)))))
  | _ -> failwith "DT: impossible branch"
)))

let rec v_Vuna_dCompiler_dFrontend_dToml_dparseSectionSegments = (fun fuel -> (fun path -> (fun cs -> (fun acc -> (if ((bi_le_int fuel) 0) then (C_Base_dResult_dResult_Base_dResult_dErr ("DT: toml fuel exhausted (internal: toml parser made no progress)")) else (match ((v_Vuna_dCompiler_dFrontend_dToml_dparseBareKey path) (v_Vuna_dCompiler_dFrontend_dToml_dskipBlank cs)) with
  | C_Base_dResult_dResult_Base_dResult_dErr (dtb__93) -> (C_Base_dResult_dResult_Base_dResult_dErr (dtb__93))
  | C_Base_dResult_dResult_Base_dResult_dOk (dtb__94) -> (match dtb__94 with
  | C_Base_dPair_dPair_Base_dPair_dPair (dtb__95, dtb__96) -> (match (v_Vuna_dCompiler_dFrontend_dToml_dskipBlank dtb__96) with
  | C_Vuna_dCompiler_dFrontend_dToml_dTomlCursor_Vuna_dCompiler_dFrontend_dToml_dTomlCursor (dtb__97, dtb__98, dtb__99) -> (match dtb__97 with
  | C_Base_dList_dList_Nil -> (((v_Vuna_dCompiler_dFrontend_dToml_dfailAt path) dtb__98) "unterminated section header")
  | C_Base_dList_dList_Cons (dtb__100, dtb__101) -> (if ((bi_eq_int dtb__100) 46) then ((((v_Vuna_dCompiler_dFrontend_dToml_dparseSectionSegments ((bi_sub fuel) 1)) path) (C_Vuna_dCompiler_dFrontend_dToml_dTomlCursor_Vuna_dCompiler_dFrontend_dToml_dTomlCursor (dtb__101, dtb__98, ((bi_add dtb__99) 1)))) (C_Base_dList_dList_Cons (dtb__95, acc))) else (if ((bi_eq_int dtb__100) 93) then (C_Base_dResult_dResult_Base_dResult_dOk ((C_Base_dPair_dPair_Base_dPair_dPair ((v_Base_dList_dreverse (C_Base_dList_dList_Cons (dtb__95, acc))), (C_Vuna_dCompiler_dFrontend_dToml_dTomlCursor_Vuna_dCompiler_dFrontend_dToml_dTomlCursor (dtb__101, dtb__98, ((bi_add dtb__99) 1))))))) else (((v_Vuna_dCompiler_dFrontend_dToml_dfailAt path) dtb__98) "expected '.' or ']' in section header")))
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
))))))

let v_Vuna_dCompiler_dFrontend_dToml_dparseSectionPath = (fun path -> (fun cs -> ((((v_Vuna_dCompiler_dFrontend_dToml_dparseSectionSegments (v_Vuna_dCompiler_dFrontend_dToml_dcursorFuel cs)) path) cs) C_Base_dList_dList_Nil)))

let v_Vuna_dCompiler_dFrontend_dToml_dexpectEolAfterComment = (fun path -> (fun cs -> (match (v_Vuna_dCompiler_dFrontend_dToml_dskipComment cs) with
  | C_Vuna_dCompiler_dFrontend_dToml_dTomlCursor_Vuna_dCompiler_dFrontend_dToml_dTomlCursor (dtb__102, dtb__103, dtb__104) -> (match dtb__102 with
  | C_Base_dList_dList_Nil -> (C_Base_dResult_dResult_Base_dResult_dOk ((C_Vuna_dCompiler_dFrontend_dToml_dTomlCursor_Vuna_dCompiler_dFrontend_dToml_dTomlCursor (dtb__102, dtb__103, dtb__104))))
  | C_Base_dList_dList_Cons (dtb__105, dtb__106) -> (if ((bi_eq_int dtb__105) 10) then (C_Base_dResult_dResult_Base_dResult_dOk ((C_Vuna_dCompiler_dFrontend_dToml_dTomlCursor_Vuna_dCompiler_dFrontend_dToml_dTomlCursor (dtb__106, ((bi_add dtb__103) 1), 1)))) else (((v_Vuna_dCompiler_dFrontend_dToml_dfailAt path) dtb__103) "unexpected character after comment"))
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
)))

let v_Vuna_dCompiler_dFrontend_dToml_dexpectEol = (fun path -> (fun cs -> (match (v_Vuna_dCompiler_dFrontend_dToml_dskipBlank cs) with
  | C_Vuna_dCompiler_dFrontend_dToml_dTomlCursor_Vuna_dCompiler_dFrontend_dToml_dTomlCursor (dtb__107, dtb__108, dtb__109) -> (match dtb__107 with
  | C_Base_dList_dList_Nil -> (C_Base_dResult_dResult_Base_dResult_dOk ((C_Vuna_dCompiler_dFrontend_dToml_dTomlCursor_Vuna_dCompiler_dFrontend_dToml_dTomlCursor (dtb__107, dtb__108, dtb__109))))
  | C_Base_dList_dList_Cons (dtb__110, dtb__111) -> (if ((bi_eq_int dtb__110) 10) then (C_Base_dResult_dResult_Base_dResult_dOk ((C_Vuna_dCompiler_dFrontend_dToml_dTomlCursor_Vuna_dCompiler_dFrontend_dToml_dTomlCursor (dtb__111, ((bi_add dtb__108) 1), 1)))) else (if ((bi_eq_int dtb__110) 35) then ((v_Vuna_dCompiler_dFrontend_dToml_dexpectEolAfterComment path) (C_Vuna_dCompiler_dFrontend_dToml_dTomlCursor_Vuna_dCompiler_dFrontend_dToml_dTomlCursor (dtb__107, dtb__108, dtb__109))) else (((v_Vuna_dCompiler_dFrontend_dToml_dfailAt path) (v_Vuna_dCompiler_dFrontend_dToml_dcursorLine cs)) "unexpected character at end of line")))
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
)))

let rec v_Vuna_dCompiler_dFrontend_dToml_dsamePath = (fun d303 -> (fun mc0 -> (fun mc1 -> (match mc0 with
  | C_Base_dList_dList_Cons (dtb__112, dtb__113) -> (match mc1 with
  | C_Base_dList_dList_Cons (dtb__114, dtb__115) -> (if (((v_Base_dEq_deq d303) dtb__112) dtb__114) then (((v_Vuna_dCompiler_dFrontend_dToml_dsamePath d303) dtb__113) dtb__115) else false)
  | _ -> false
)
  | C_Base_dList_dList_Nil -> (match mc1 with
  | C_Base_dList_dList_Nil -> true
  | _ -> false
)
  | _ -> failwith "DT: impossible branch"
))))

let rec v_Vuna_dCompiler_dFrontend_dToml_dmemSectionPath = (fun d306 -> (fun section -> (fun seen -> (match seen with
  | C_Base_dList_dList_Nil -> false
  | C_Base_dList_dList_Cons (dtb__116, dtb__117) -> (if (((v_Vuna_dCompiler_dFrontend_dToml_dsamePath d306) section) dtb__116) then true else (((v_Vuna_dCompiler_dFrontend_dToml_dmemSectionPath d306) section) dtb__117))
  | _ -> failwith "DT: impossible branch"
))))

let v_Vuna_dCompiler_dFrontend_dToml_dsectionSuffix = (fun section -> (match section with
  | C_Base_dList_dList_Nil -> ""
  | C_Base_dList_dList_Cons (dtb__118, dtb__119) -> ((bi_concat " in [") ((bi_concat (v_Vuna_dCompiler_dCommon_djoinDots section)) "]"))
  | _ -> failwith "DT: impossible branch"
))

let rec v_Vuna_dCompiler_dFrontend_dToml_dhasEntry = (fun section -> (fun key -> (fun entries -> (match entries with
  | C_Base_dList_dList_Nil -> false
  | C_Base_dList_dList_Cons (dtb__120, dtb__121) -> (match dtb__120 with
  | C_Vuna_dCompiler_dFrontend_dToml_dTomlEntry_Vuna_dCompiler_dFrontend_dToml_dTomlEntry (dtb__122, dtb__123, dtb__124, dtb__125) -> (if (if (((v_Vuna_dCompiler_dFrontend_dToml_dsamePath v_Base_dEq_dBase_dEq_dEq_uBase_dEq_dEq_uString) section) dtb__122) then ((bi_eq_str dtb__123) key) else false) then true else (((v_Vuna_dCompiler_dFrontend_dToml_dhasEntry section) key) dtb__121))
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
))))

let rec v_Vuna_dCompiler_dFrontend_dToml_dparseEntryValue = (fun fuel -> (fun path -> (fun cs -> (fun keyLine -> (fun key -> (fun section -> (fun seen -> (fun entries -> (if ((bi_le_int fuel) 0) then (C_Base_dResult_dResult_Base_dResult_dErr ("DT: toml fuel exhausted (internal: toml parser made no progress)")) else (match ((v_Vuna_dCompiler_dFrontend_dToml_dparseValue path) (v_Vuna_dCompiler_dFrontend_dToml_dskipBlank cs)) with
  | C_Base_dResult_dResult_Base_dResult_dErr (dtb__126) -> (C_Base_dResult_dResult_Base_dResult_dErr (dtb__126))
  | C_Base_dResult_dResult_Base_dResult_dOk (dtb__127) -> (match dtb__127 with
  | C_Base_dPair_dPair_Base_dPair_dPair (dtb__128, dtb__129) -> (match ((v_Vuna_dCompiler_dFrontend_dToml_dexpectEol path) dtb__129) with
  | C_Base_dResult_dResult_Base_dResult_dErr (dtb__130) -> (C_Base_dResult_dResult_Base_dResult_dErr (dtb__130))
  | C_Base_dResult_dResult_Base_dResult_dOk (dtb__131) -> (if (((v_Vuna_dCompiler_dFrontend_dToml_dhasEntry section) key) entries) then (((v_Vuna_dCompiler_dFrontend_dToml_dfailAt path) keyLine) ((bi_concat "duplicate key \"") ((bi_concat key) ((bi_concat "\"") (v_Vuna_dCompiler_dFrontend_dToml_dsectionSuffix section))))) else ((((((v_Vuna_dCompiler_dFrontend_dToml_dparseTomlLoop ((bi_sub fuel) 1)) path) dtb__131) section) seen) (C_Base_dList_dList_Cons ((C_Vuna_dCompiler_dFrontend_dToml_dTomlEntry_Vuna_dCompiler_dFrontend_dToml_dTomlEntry (section, key, dtb__128, keyLine)), entries))))
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
))))))))))
and v_Vuna_dCompiler_dFrontend_dToml_dparseKeyLine = (fun fuel -> (fun path -> (fun cs -> (fun section -> (fun seen -> (fun entries -> (if ((bi_le_int fuel) 0) then (C_Base_dResult_dResult_Base_dResult_dErr ("DT: toml fuel exhausted (internal: toml parser made no progress)")) else (match ((v_Vuna_dCompiler_dFrontend_dToml_dparseBareKey path) cs) with
  | C_Base_dResult_dResult_Base_dResult_dErr (dtb__132) -> (C_Base_dResult_dResult_Base_dResult_dErr (dtb__132))
  | C_Base_dResult_dResult_Base_dResult_dOk (dtb__133) -> (match dtb__133 with
  | C_Base_dPair_dPair_Base_dPair_dPair (dtb__134, dtb__135) -> (match (v_Vuna_dCompiler_dFrontend_dToml_dskipBlank dtb__135) with
  | C_Vuna_dCompiler_dFrontend_dToml_dTomlCursor_Vuna_dCompiler_dFrontend_dToml_dTomlCursor (dtb__136, dtb__137, dtb__138) -> (match dtb__136 with
  | C_Base_dList_dList_Nil -> (((v_Vuna_dCompiler_dFrontend_dToml_dfailAt path) (v_Vuna_dCompiler_dFrontend_dToml_dcursorLine cs)) "expected '=' after key")
  | C_Base_dList_dList_Cons (dtb__139, dtb__140) -> (if ((bi_eq_int dtb__139) 61) then ((((((((v_Vuna_dCompiler_dFrontend_dToml_dparseEntryValue ((bi_sub fuel) 1)) path) (C_Vuna_dCompiler_dFrontend_dToml_dTomlCursor_Vuna_dCompiler_dFrontend_dToml_dTomlCursor (dtb__140, dtb__137, ((bi_add dtb__138) 1)))) (v_Vuna_dCompiler_dFrontend_dToml_dcursorLine cs)) dtb__134) section) seen) entries) else (((v_Vuna_dCompiler_dFrontend_dToml_dfailAt path) (v_Vuna_dCompiler_dFrontend_dToml_dcursorLine cs)) ((bi_concat "expected '=' after key \"") ((bi_concat dtb__134) "\""))))
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
))))))))
and v_Vuna_dCompiler_dFrontend_dToml_dparseSectionLine = (fun fuel -> (fun path -> (fun cs -> (fun section -> (fun seen -> (fun entries -> (if ((bi_le_int fuel) 0) then (C_Base_dResult_dResult_Base_dResult_dErr ("DT: toml fuel exhausted (internal: toml parser made no progress)")) else (match ((v_Vuna_dCompiler_dFrontend_dToml_dparseSectionPath path) (v_Vuna_dCompiler_dFrontend_dToml_dadvanceCursor cs)) with
  | C_Base_dResult_dResult_Base_dResult_dErr (dtb__141) -> (C_Base_dResult_dResult_Base_dResult_dErr (dtb__141))
  | C_Base_dResult_dResult_Base_dResult_dOk (dtb__142) -> (match dtb__142 with
  | C_Base_dPair_dPair_Base_dPair_dPair (dtb__143, dtb__144) -> (if (((v_Vuna_dCompiler_dFrontend_dToml_dmemSectionPath v_Base_dEq_dBase_dEq_dEq_uBase_dEq_dEq_uString) dtb__143) seen) then (((v_Vuna_dCompiler_dFrontend_dToml_dfailAt path) (v_Vuna_dCompiler_dFrontend_dToml_dcursorLine cs)) ((bi_concat "duplicate section [") ((bi_concat (v_Vuna_dCompiler_dCommon_djoinDots dtb__143)) "]"))) else (match ((v_Vuna_dCompiler_dFrontend_dToml_dexpectEol path) dtb__144) with
  | C_Base_dResult_dResult_Base_dResult_dErr (dtb__145) -> (C_Base_dResult_dResult_Base_dResult_dErr (dtb__145))
  | C_Base_dResult_dResult_Base_dResult_dOk (dtb__146) -> ((((((v_Vuna_dCompiler_dFrontend_dToml_dparseTomlLoop ((bi_sub fuel) 1)) path) dtb__146) dtb__143) (C_Base_dList_dList_Cons (dtb__143, seen))) entries)
  | _ -> failwith "DT: impossible branch"
))
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
))))))))
and v_Vuna_dCompiler_dFrontend_dToml_dparseTomlLoop = (fun fuel -> (fun path -> (fun cs -> (fun section -> (fun seen -> (fun entries -> (if ((bi_le_int fuel) 0) then (C_Base_dResult_dResult_Base_dResult_dErr ("DT: toml fuel exhausted (internal: toml parser made no progress)")) else ((((((v_Vuna_dCompiler_dFrontend_dToml_dparseTomlLoopAt ((bi_sub fuel) 1)) path) (v_Vuna_dCompiler_dFrontend_dToml_dskipGap cs)) section) seen) entries))))))))
and v_Vuna_dCompiler_dFrontend_dToml_dparseTomlLoopAt = (fun fuel -> (fun path -> (fun cs -> (fun section -> (fun seen -> (fun entries -> (if ((bi_le_int fuel) 0) then (C_Base_dResult_dResult_Base_dResult_dErr ("DT: toml fuel exhausted (internal: toml parser made no progress)")) else (match (v_Vuna_dCompiler_dFrontend_dToml_dcursorChars cs) with
  | C_Base_dList_dList_Nil -> (C_Base_dResult_dResult_Base_dResult_dOk ((v_Base_dList_dreverse entries)))
  | C_Base_dList_dList_Cons (dtb__147, dtb__148) -> (if ((bi_eq_int dtb__147) 91) then ((((((v_Vuna_dCompiler_dFrontend_dToml_dparseSectionLine ((bi_sub fuel) 1)) path) cs) section) seen) entries) else ((((((v_Vuna_dCompiler_dFrontend_dToml_dparseKeyLine ((bi_sub fuel) 1)) path) cs) section) seen) entries))
  | _ -> failwith "DT: impossible branch"
))))))))

let v_Vuna_dCompiler_dFrontend_dToml_dparseTomlAt = (fun path -> (fun source -> ((fun cs -> ((((((v_Vuna_dCompiler_dFrontend_dToml_dparseTomlLoop (v_Vuna_dCompiler_dFrontend_dToml_dcursorFuel cs)) path) cs) C_Base_dList_dList_Nil) C_Base_dList_dList_Nil) C_Base_dList_dList_Nil)) (C_Vuna_dCompiler_dFrontend_dToml_dTomlCursor_Vuna_dCompiler_dFrontend_dToml_dTomlCursor ((v_Vuna_dCompiler_dFrontend_dToml_dstripCR (dtp_unpack source)), 1, 1)))))

let v_Vuna_dCompiler_dFrontend_dToml_dparseToml = (fun source -> ((v_Vuna_dCompiler_dFrontend_dToml_dparseTomlAt "") source))

let rec v_Vuna_dCompiler_dFrontend_dToml_dlookupEntry = (fun section -> (fun key -> (fun entries -> (match entries with
  | C_Base_dList_dList_Nil -> C_Base_dMaybe_dMaybe_Base_dMaybe_dNothing
  | C_Base_dList_dList_Cons (dtb__149, dtb__150) -> (match dtb__149 with
  | C_Vuna_dCompiler_dFrontend_dToml_dTomlEntry_Vuna_dCompiler_dFrontend_dToml_dTomlEntry (dtb__151, dtb__152, dtb__153, dtb__154) -> (if (if (((v_Vuna_dCompiler_dFrontend_dToml_dsamePath v_Base_dEq_dBase_dEq_dEq_uBase_dEq_dEq_uString) section) dtb__151) then ((bi_eq_str dtb__152) key) else false) then (C_Base_dMaybe_dMaybe_Base_dMaybe_dJust (dtb__153)) else (((v_Vuna_dCompiler_dFrontend_dToml_dlookupEntry section) key) dtb__150))
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
))))

let rec v_Vuna_dCompiler_dFrontend_dToml_dlookupEntryLine = (fun section -> (fun key -> (fun entries -> (match entries with
  | C_Base_dList_dList_Nil -> C_Base_dMaybe_dMaybe_Base_dMaybe_dNothing
  | C_Base_dList_dList_Cons (dtb__155, dtb__156) -> (match dtb__155 with
  | C_Vuna_dCompiler_dFrontend_dToml_dTomlEntry_Vuna_dCompiler_dFrontend_dToml_dTomlEntry (dtb__157, dtb__158, dtb__159, dtb__160) -> (if (if (((v_Vuna_dCompiler_dFrontend_dToml_dsamePath v_Base_dEq_dBase_dEq_dEq_uBase_dEq_dEq_uString) section) dtb__157) then ((bi_eq_str dtb__158) key) else false) then (C_Base_dMaybe_dMaybe_Base_dMaybe_dJust (dtb__160)) else (((v_Vuna_dCompiler_dFrontend_dToml_dlookupEntryLine section) key) dtb__156))
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
))))
