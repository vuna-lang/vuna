open Vuna_runtime
open Vuna_builtins
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
type t_Vuna_dCompiler_dToml_dTomlValue = C_Vuna_dCompiler_dToml_dTomlValue_Vuna_dCompiler_dToml_dTStr of (string) | C_Vuna_dCompiler_dToml_dTomlValue_Vuna_dCompiler_dToml_dTInt of (int) | C_Vuna_dCompiler_dToml_dTomlValue_Vuna_dCompiler_dToml_dTBool of (bool) | C_Vuna_dCompiler_dToml_dTomlValue_Vuna_dCompiler_dToml_dTList of (string t_Base_dList_dList)
and t_Vuna_dCompiler_dToml_dTomlEntry = C_Vuna_dCompiler_dToml_dTomlEntry_Vuna_dCompiler_dToml_dTomlEntry of (string t_Base_dList_dList) * (string) * (t_Vuna_dCompiler_dToml_dTomlValue) * (int)
and t_Vuna_dCompiler_dToml_dTomlCursor = C_Vuna_dCompiler_dToml_dTomlCursor_Vuna_dCompiler_dToml_dTomlCursor of (int t_Base_dList_dList) * (int) * (int)

let v_Vuna_dCompiler_dToml_dcursorChars = (fun mc0 -> (match mc0 with
  | C_Vuna_dCompiler_dToml_dTomlCursor_Vuna_dCompiler_dToml_dTomlCursor (dtb__0, dtb__1, dtb__2) -> dtb__0
  | _ -> failwith "DT: impossible branch"
))

let v_Vuna_dCompiler_dToml_dcursorLine = (fun mc0 -> (match mc0 with
  | C_Vuna_dCompiler_dToml_dTomlCursor_Vuna_dCompiler_dToml_dTomlCursor (dtb__3, dtb__4, dtb__5) -> dtb__4
  | _ -> failwith "DT: impossible branch"
))

let v_Vuna_dCompiler_dToml_dcursorCol = (fun mc0 -> (match mc0 with
  | C_Vuna_dCompiler_dToml_dTomlCursor_Vuna_dCompiler_dToml_dTomlCursor (dtb__6, dtb__7, dtb__8) -> dtb__8
  | _ -> failwith "DT: impossible branch"
))

let v_Vuna_dCompiler_dToml_dadvanceCursor = (fun mc0 -> (match mc0 with
  | C_Vuna_dCompiler_dToml_dTomlCursor_Vuna_dCompiler_dToml_dTomlCursor (dtb__9, dtb__10, dtb__11) -> (match dtb__9 with
  | C_Base_dList_dList_Cons (dtb__12, dtb__13) -> (if ((bi_eq_int dtb__12) 10) then (C_Vuna_dCompiler_dToml_dTomlCursor_Vuna_dCompiler_dToml_dTomlCursor (dtb__13, ((bi_add dtb__10) 1), 1)) else (C_Vuna_dCompiler_dToml_dTomlCursor_Vuna_dCompiler_dToml_dTomlCursor (dtb__13, dtb__10, ((bi_add dtb__11) 1))))
  | C_Base_dList_dList_Nil -> (C_Vuna_dCompiler_dToml_dTomlCursor_Vuna_dCompiler_dToml_dTomlCursor (C_Base_dList_dList_Nil, dtb__10, dtb__11))
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
))

let v_Vuna_dCompiler_dToml_disDigitChar = (fun c -> (if ((bi_ge_int c) 48) then ((bi_le_int c) 57) else false))

let v_Vuna_dCompiler_dToml_disUpperAlphaChar = (fun c -> (if ((bi_ge_int c) 65) then ((bi_le_int c) 90) else false))

let v_Vuna_dCompiler_dToml_disLowerAlphaChar = (fun c -> (if ((bi_ge_int c) 97) then ((bi_le_int c) 122) else false))

let v_Vuna_dCompiler_dToml_disAlphaChar = (fun c -> (if (v_Vuna_dCompiler_dToml_disUpperAlphaChar c) then true else (v_Vuna_dCompiler_dToml_disLowerAlphaChar c)))

let v_Vuna_dCompiler_dToml_disBareKeyChar = (fun c -> (if (if (if (v_Vuna_dCompiler_dToml_disAlphaChar c) then true else (v_Vuna_dCompiler_dToml_disDigitChar c)) then true else ((bi_eq_int c) 95)) then true else ((bi_eq_int c) 45)))

let v_Vuna_dCompiler_dToml_disBlankChar = (fun c -> (if ((bi_eq_int c) 32) then true else ((bi_eq_int c) 9)))

let rec v_Vuna_dCompiler_dToml_dstripCR = (fun mc0 -> (match mc0 with
  | C_Base_dList_dList_Cons (dtb__14, dtb__15) -> (if ((bi_eq_int dtb__14) 13) then (v_Vuna_dCompiler_dToml_dstripCR dtb__15) else (C_Base_dList_dList_Cons (dtb__14, (v_Vuna_dCompiler_dToml_dstripCR dtb__15))))
  | C_Base_dList_dList_Nil -> C_Base_dList_dList_Nil
  | _ -> failwith "DT: impossible branch"
))

let v_Vuna_dCompiler_dToml_dlocPrefix = (fun path -> (fun line -> (if ((bi_eq_str path) "") then ((bi_concat "line ") ((bi_concat (bi_strFromInt line)) ": ")) else ((bi_concat path) ((bi_concat ":") ((bi_concat (bi_strFromInt line)) ": "))))))

let v_Vuna_dCompiler_dToml_dfailAt = (fun path -> (fun line -> (fun msg -> (C_Base_dResult_dResult_Base_dResult_dErr (((bi_concat ((v_Vuna_dCompiler_dToml_dlocPrefix path) line)) msg))))))

let rec v_Vuna_dCompiler_dToml_dskipBlank = (fun cs -> (match (v_Vuna_dCompiler_dToml_dcursorChars cs) with
  | C_Base_dList_dList_Nil -> cs
  | C_Base_dList_dList_Cons (dtb__16, dtb__17) -> (if (v_Vuna_dCompiler_dToml_disBlankChar dtb__16) then (v_Vuna_dCompiler_dToml_dskipBlank (v_Vuna_dCompiler_dToml_dadvanceCursor cs)) else cs)
  | _ -> failwith "DT: impossible branch"
))

let rec v_Vuna_dCompiler_dToml_dskipComment = (fun cs -> (match (v_Vuna_dCompiler_dToml_dcursorChars cs) with
  | C_Base_dList_dList_Nil -> cs
  | C_Base_dList_dList_Cons (dtb__18, dtb__19) -> (if ((bi_eq_int dtb__18) 10) then cs else (v_Vuna_dCompiler_dToml_dskipComment (v_Vuna_dCompiler_dToml_dadvanceCursor cs)))
  | _ -> failwith "DT: impossible branch"
))

let rec v_Vuna_dCompiler_dToml_dskipGap = (fun cs -> (match (v_Vuna_dCompiler_dToml_dcursorChars cs) with
  | C_Base_dList_dList_Nil -> cs
  | C_Base_dList_dList_Cons (dtb__20, dtb__21) -> (if (if (v_Vuna_dCompiler_dToml_disBlankChar dtb__20) then true else ((bi_eq_int dtb__20) 10)) then (v_Vuna_dCompiler_dToml_dskipGap (v_Vuna_dCompiler_dToml_dadvanceCursor cs)) else (if ((bi_eq_int dtb__20) 35) then (v_Vuna_dCompiler_dToml_dskipGap (v_Vuna_dCompiler_dToml_dskipComment cs)) else cs))
  | _ -> failwith "DT: impossible branch"
))

let rec v_Vuna_dCompiler_dToml_dcollectBareKey = (fun cs -> (fun acc -> (match (v_Vuna_dCompiler_dToml_dcursorChars cs) with
  | C_Base_dList_dList_Nil -> (C_Base_dPair_dPair_Base_dPair_dPair ((dtp_pack (v_Base_dList_dreverse acc)), cs))
  | C_Base_dList_dList_Cons (dtb__22, dtb__23) -> (if (v_Vuna_dCompiler_dToml_disBareKeyChar dtb__22) then ((v_Vuna_dCompiler_dToml_dcollectBareKey (v_Vuna_dCompiler_dToml_dadvanceCursor cs)) (C_Base_dList_dList_Cons (dtb__22, acc))) else (C_Base_dPair_dPair_Base_dPair_dPair ((dtp_pack (v_Base_dList_dreverse acc)), cs)))
  | _ -> failwith "DT: impossible branch"
)))

let v_Vuna_dCompiler_dToml_dparseBareKey = (fun path -> (fun cs -> (match (v_Vuna_dCompiler_dToml_dcursorChars cs) with
  | C_Base_dList_dList_Nil -> (((v_Vuna_dCompiler_dToml_dfailAt path) (v_Vuna_dCompiler_dToml_dcursorLine cs)) "expected a key")
  | C_Base_dList_dList_Cons (dtb__24, dtb__25) -> (if (v_Vuna_dCompiler_dToml_disBareKeyChar dtb__24) then (match ((v_Vuna_dCompiler_dToml_dcollectBareKey cs) C_Base_dList_dList_Nil) with
  | C_Base_dPair_dPair_Base_dPair_dPair (dtb__26, dtb__27) -> (C_Base_dResult_dResult_Base_dResult_dOk ((C_Base_dPair_dPair_Base_dPair_dPair (dtb__26, dtb__27))))
  | _ -> failwith "DT: impossible branch"
) else (((v_Vuna_dCompiler_dToml_dfailAt path) (v_Vuna_dCompiler_dToml_dcursorLine cs)) "expected a key"))
  | _ -> failwith "DT: impossible branch"
)))

let rec v_Vuna_dCompiler_dToml_dparseStringChars = (fun path -> (fun startCs -> (fun cs -> (fun acc -> (match (v_Vuna_dCompiler_dToml_dcursorChars cs) with
  | C_Base_dList_dList_Nil -> (((v_Vuna_dCompiler_dToml_dfailAt path) (v_Vuna_dCompiler_dToml_dcursorLine startCs)) "unterminated basic string")
  | C_Base_dList_dList_Cons (dtb__28, dtb__29) -> (if ((bi_eq_int dtb__28) 34) then (C_Base_dResult_dResult_Base_dResult_dOk ((C_Base_dPair_dPair_Base_dPair_dPair ((dtp_pack (v_Base_dList_dreverse acc)), (v_Vuna_dCompiler_dToml_dadvanceCursor cs))))) else (if ((bi_eq_int dtb__28) 10) then (((v_Vuna_dCompiler_dToml_dfailAt path) (v_Vuna_dCompiler_dToml_dcursorLine startCs)) "unterminated basic string (newline in string)") else (if ((bi_eq_int dtb__28) 92) then ((((v_Vuna_dCompiler_dToml_dparseStringEscape path) startCs) (v_Vuna_dCompiler_dToml_dadvanceCursor cs)) acc) else ((((v_Vuna_dCompiler_dToml_dparseStringChars path) startCs) (v_Vuna_dCompiler_dToml_dadvanceCursor cs)) (C_Base_dList_dList_Cons (dtb__28, acc))))))
  | _ -> failwith "DT: impossible branch"
)))))
and v_Vuna_dCompiler_dToml_dparseStringEscape = (fun path -> (fun startCs -> (fun cs -> (fun acc -> (match (v_Vuna_dCompiler_dToml_dcursorChars cs) with
  | C_Base_dList_dList_Nil -> (((v_Vuna_dCompiler_dToml_dfailAt path) (v_Vuna_dCompiler_dToml_dcursorLine startCs)) "unterminated escape sequence")
  | C_Base_dList_dList_Cons (dtb__30, dtb__31) -> (if ((bi_eq_int dtb__30) 110) then ((((v_Vuna_dCompiler_dToml_dparseStringChars path) startCs) (v_Vuna_dCompiler_dToml_dadvanceCursor cs)) (C_Base_dList_dList_Cons (10, acc))) else (if ((bi_eq_int dtb__30) 116) then ((((v_Vuna_dCompiler_dToml_dparseStringChars path) startCs) (v_Vuna_dCompiler_dToml_dadvanceCursor cs)) (C_Base_dList_dList_Cons (9, acc))) else (if ((bi_eq_int dtb__30) 114) then ((((v_Vuna_dCompiler_dToml_dparseStringChars path) startCs) (v_Vuna_dCompiler_dToml_dadvanceCursor cs)) (C_Base_dList_dList_Cons (13, acc))) else (if ((bi_eq_int dtb__30) 98) then ((((v_Vuna_dCompiler_dToml_dparseStringChars path) startCs) (v_Vuna_dCompiler_dToml_dadvanceCursor cs)) (C_Base_dList_dList_Cons (8, acc))) else (if ((bi_eq_int dtb__30) 102) then ((((v_Vuna_dCompiler_dToml_dparseStringChars path) startCs) (v_Vuna_dCompiler_dToml_dadvanceCursor cs)) (C_Base_dList_dList_Cons (12, acc))) else (if ((bi_eq_int dtb__30) 34) then ((((v_Vuna_dCompiler_dToml_dparseStringChars path) startCs) (v_Vuna_dCompiler_dToml_dadvanceCursor cs)) (C_Base_dList_dList_Cons (34, acc))) else (if ((bi_eq_int dtb__30) 92) then ((((v_Vuna_dCompiler_dToml_dparseStringChars path) startCs) (v_Vuna_dCompiler_dToml_dadvanceCursor cs)) (C_Base_dList_dList_Cons (92, acc))) else (((v_Vuna_dCompiler_dToml_dfailAt path) (v_Vuna_dCompiler_dToml_dcursorLine cs)) ((bi_concat "unknown escape sequence \\") (dtp_pack (C_Base_dList_dList_Cons (dtb__30, C_Base_dList_dList_Nil))))))))))))
  | _ -> failwith "DT: impossible branch"
)))))

let v_Vuna_dCompiler_dToml_dparseStringValue = (fun path -> (fun cs -> (match (v_Vuna_dCompiler_dToml_dcursorChars cs) with
  | C_Base_dList_dList_Nil -> (((v_Vuna_dCompiler_dToml_dfailAt path) (v_Vuna_dCompiler_dToml_dcursorLine cs)) "unterminated basic string")
  | C_Base_dList_dList_Cons (dtb__32, dtb__33) -> ((((v_Vuna_dCompiler_dToml_dparseStringChars path) cs) (v_Vuna_dCompiler_dToml_dadvanceCursor cs)) C_Base_dList_dList_Nil)
  | _ -> failwith "DT: impossible branch"
)))

let v_Vuna_dCompiler_dToml_dmakeInteger = (fun acc -> (fun negative -> (if negative then ((bi_sub 0) acc) else acc)))

let v_Vuna_dCompiler_dToml_dfinishInteger = (fun path -> (fun startCs -> (fun cs -> (fun count -> (fun acc -> (fun negative -> (if ((bi_eq_int count) 0) then (((v_Vuna_dCompiler_dToml_dfailAt path) (v_Vuna_dCompiler_dToml_dcursorLine startCs)) "expected digits for integer") else (match (v_Vuna_dCompiler_dToml_dcursorChars cs) with
  | C_Base_dList_dList_Nil -> (C_Base_dResult_dResult_Base_dResult_dOk ((C_Base_dPair_dPair_Base_dPair_dPair (((v_Vuna_dCompiler_dToml_dmakeInteger acc) negative), cs))))
  | C_Base_dList_dList_Cons (dtb__34, dtb__35) -> (if ((bi_eq_int dtb__34) 46) then (((v_Vuna_dCompiler_dToml_dfailAt path) (v_Vuna_dCompiler_dToml_dcursorLine startCs)) "floating point numbers are not supported") else (if (v_Vuna_dCompiler_dToml_disBareKeyChar dtb__34) then (((v_Vuna_dCompiler_dToml_dfailAt path) (v_Vuna_dCompiler_dToml_dcursorLine startCs)) "invalid integer literal") else (C_Base_dResult_dResult_Base_dResult_dOk ((C_Base_dPair_dPair_Base_dPair_dPair (((v_Vuna_dCompiler_dToml_dmakeInteger acc) negative), cs))))))
  | _ -> failwith "DT: impossible branch"
))))))))

let rec v_Vuna_dCompiler_dToml_dparseIntegerDigits = (fun path -> (fun startCs -> (fun cs -> (fun count -> (fun acc -> (fun negative -> (match (v_Vuna_dCompiler_dToml_dcursorChars cs) with
  | C_Base_dList_dList_Nil -> ((((((v_Vuna_dCompiler_dToml_dfinishInteger path) startCs) cs) count) acc) negative)
  | C_Base_dList_dList_Cons (dtb__36, dtb__37) -> (if (v_Vuna_dCompiler_dToml_disDigitChar dtb__36) then ((((((v_Vuna_dCompiler_dToml_dparseIntegerDigits path) startCs) (v_Vuna_dCompiler_dToml_dadvanceCursor cs)) ((bi_add count) 1)) ((bi_add ((bi_mul acc) 10)) ((bi_sub dtb__36) 48))) negative) else ((((((v_Vuna_dCompiler_dToml_dfinishInteger path) startCs) cs) count) acc) negative))
  | _ -> failwith "DT: impossible branch"
)))))))

let v_Vuna_dCompiler_dToml_dparseInteger = (fun path -> (fun cs -> (match (v_Vuna_dCompiler_dToml_dcursorChars cs) with
  | C_Base_dList_dList_Nil -> (((v_Vuna_dCompiler_dToml_dfailAt path) (v_Vuna_dCompiler_dToml_dcursorLine cs)) "expected an integer")
  | C_Base_dList_dList_Cons (dtb__38, dtb__39) -> (if ((bi_eq_int dtb__38) 45) then ((((((v_Vuna_dCompiler_dToml_dparseIntegerDigits path) cs) (v_Vuna_dCompiler_dToml_dadvanceCursor cs)) 0) 0) true) else (if (v_Vuna_dCompiler_dToml_disDigitChar dtb__38) then ((((((v_Vuna_dCompiler_dToml_dparseIntegerDigits path) cs) cs) 0) 0) false) else (((v_Vuna_dCompiler_dToml_dfailAt path) (v_Vuna_dCompiler_dToml_dcursorLine cs)) "expected an integer")))
  | _ -> failwith "DT: impossible branch"
)))

let v_Vuna_dCompiler_dToml_dparseIntValue = (fun path -> (fun cs -> (match ((v_Vuna_dCompiler_dToml_dparseInteger path) cs) with
  | C_Base_dResult_dResult_Base_dResult_dErr (dtb__40) -> (C_Base_dResult_dResult_Base_dResult_dErr (dtb__40))
  | C_Base_dResult_dResult_Base_dResult_dOk (dtb__41) -> (match dtb__41 with
  | C_Base_dPair_dPair_Base_dPair_dPair (dtb__42, dtb__43) -> (C_Base_dResult_dResult_Base_dResult_dOk ((C_Base_dPair_dPair_Base_dPair_dPair ((C_Vuna_dCompiler_dToml_dTomlValue_Vuna_dCompiler_dToml_dTInt (dtb__42)), dtb__43))))
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
)))

let rec v_Vuna_dCompiler_dToml_dmatchChars = (fun mc0 -> (fun mc1 -> (match mc0 with
  | C_Base_dList_dList_Cons (dtb__44, dtb__45) -> (match (v_Vuna_dCompiler_dToml_dcursorChars mc1) with
  | C_Base_dList_dList_Nil -> C_Base_dMaybe_dMaybe_Base_dMaybe_dNothing
  | C_Base_dList_dList_Cons (dtb__46, dtb__47) -> (if ((bi_eq_int dtb__46) dtb__44) then ((v_Vuna_dCompiler_dToml_dmatchChars dtb__45) (v_Vuna_dCompiler_dToml_dadvanceCursor mc1)) else C_Base_dMaybe_dMaybe_Base_dMaybe_dNothing)
  | _ -> failwith "DT: impossible branch"
)
  | C_Base_dList_dList_Nil -> (C_Base_dMaybe_dMaybe_Base_dMaybe_dJust (mc1))
  | _ -> failwith "DT: impossible branch"
)))

let v_Vuna_dCompiler_dToml_dmatchWord = (fun word -> (fun cs -> (match ((v_Vuna_dCompiler_dToml_dmatchChars (dtp_unpack word)) cs) with
  | C_Base_dMaybe_dMaybe_Base_dMaybe_dNothing -> C_Base_dMaybe_dMaybe_Base_dMaybe_dNothing
  | C_Base_dMaybe_dMaybe_Base_dMaybe_dJust (dtb__48) -> (match (v_Vuna_dCompiler_dToml_dcursorChars dtb__48) with
  | C_Base_dList_dList_Nil -> (C_Base_dMaybe_dMaybe_Base_dMaybe_dJust (dtb__48))
  | C_Base_dList_dList_Cons (dtb__49, dtb__50) -> (if (v_Vuna_dCompiler_dToml_disBareKeyChar dtb__49) then C_Base_dMaybe_dMaybe_Base_dMaybe_dNothing else (C_Base_dMaybe_dMaybe_Base_dMaybe_dJust (dtb__48)))
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
)))

let rec v_Vuna_dCompiler_dToml_dparseArrayItems = (fun path -> (fun cs -> (fun acc -> (match (v_Vuna_dCompiler_dToml_dskipGap cs) with
  | C_Vuna_dCompiler_dToml_dTomlCursor_Vuna_dCompiler_dToml_dTomlCursor (dtb__51, dtb__52, dtb__53) -> (match dtb__51 with
  | C_Base_dList_dList_Nil -> (((v_Vuna_dCompiler_dToml_dfailAt path) dtb__52) "unterminated array")
  | C_Base_dList_dList_Cons (dtb__54, dtb__55) -> (if ((bi_eq_int dtb__54) 93) then (C_Base_dResult_dResult_Base_dResult_dOk ((C_Base_dPair_dPair_Base_dPair_dPair ((C_Vuna_dCompiler_dToml_dTomlValue_Vuna_dCompiler_dToml_dTList ((v_Base_dList_dreverse acc))), (v_Vuna_dCompiler_dToml_dadvanceCursor (C_Vuna_dCompiler_dToml_dTomlCursor_Vuna_dCompiler_dToml_dTomlCursor (dtb__51, dtb__52, dtb__53))))))) else (if ((bi_eq_int dtb__54) 34) then (((v_Vuna_dCompiler_dToml_dparseArrayString path) (C_Vuna_dCompiler_dToml_dTomlCursor_Vuna_dCompiler_dToml_dTomlCursor (dtb__51, dtb__52, dtb__53))) acc) else (((v_Vuna_dCompiler_dToml_dfailAt path) dtb__52) "expected a string in array")))
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
))))
and v_Vuna_dCompiler_dToml_dparseArrayString = (fun path -> (fun cs -> (fun acc -> (match ((v_Vuna_dCompiler_dToml_dparseStringValue path) cs) with
  | C_Base_dResult_dResult_Base_dResult_dErr (dtb__56) -> (C_Base_dResult_dResult_Base_dResult_dErr (dtb__56))
  | C_Base_dResult_dResult_Base_dResult_dOk (dtb__57) -> (match dtb__57 with
  | C_Base_dPair_dPair_Base_dPair_dPair (dtb__58, dtb__59) -> (match (v_Vuna_dCompiler_dToml_dskipGap dtb__59) with
  | C_Vuna_dCompiler_dToml_dTomlCursor_Vuna_dCompiler_dToml_dTomlCursor (dtb__60, dtb__61, dtb__62) -> (match dtb__60 with
  | C_Base_dList_dList_Nil -> (((v_Vuna_dCompiler_dToml_dfailAt path) dtb__61) "unterminated array")
  | C_Base_dList_dList_Cons (dtb__63, dtb__64) -> (if ((bi_eq_int dtb__63) 44) then (((v_Vuna_dCompiler_dToml_dparseArrayItems path) (v_Vuna_dCompiler_dToml_dadvanceCursor (C_Vuna_dCompiler_dToml_dTomlCursor_Vuna_dCompiler_dToml_dTomlCursor (dtb__60, dtb__61, dtb__62)))) (C_Base_dList_dList_Cons (dtb__58, acc))) else (if ((bi_eq_int dtb__63) 93) then (C_Base_dResult_dResult_Base_dResult_dOk ((C_Base_dPair_dPair_Base_dPair_dPair ((C_Vuna_dCompiler_dToml_dTomlValue_Vuna_dCompiler_dToml_dTList ((v_Base_dList_dreverse (C_Base_dList_dList_Cons (dtb__58, acc))))), (v_Vuna_dCompiler_dToml_dadvanceCursor (C_Vuna_dCompiler_dToml_dTomlCursor_Vuna_dCompiler_dToml_dTomlCursor (dtb__60, dtb__61, dtb__62))))))) else (((v_Vuna_dCompiler_dToml_dfailAt path) dtb__61) "expected ',' or ']' in array")))
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
))))

let v_Vuna_dCompiler_dToml_dparseStringArray = (fun path -> (fun cs -> (match (v_Vuna_dCompiler_dToml_dcursorChars cs) with
  | C_Base_dList_dList_Nil -> (((v_Vuna_dCompiler_dToml_dfailAt path) (v_Vuna_dCompiler_dToml_dcursorLine cs)) "unterminated array")
  | C_Base_dList_dList_Cons (dtb__65, dtb__66) -> (((v_Vuna_dCompiler_dToml_dparseArrayItems path) (v_Vuna_dCompiler_dToml_dadvanceCursor cs)) C_Base_dList_dList_Nil)
  | _ -> failwith "DT: impossible branch"
)))

let v_Vuna_dCompiler_dToml_dparseValue = (fun path -> (fun cs -> (match (v_Vuna_dCompiler_dToml_dcursorChars cs) with
  | C_Base_dList_dList_Nil -> (((v_Vuna_dCompiler_dToml_dfailAt path) (v_Vuna_dCompiler_dToml_dcursorLine cs)) "expected a value")
  | C_Base_dList_dList_Cons (dtb__67, dtb__68) -> (if ((bi_eq_int dtb__67) 34) then (match ((v_Vuna_dCompiler_dToml_dparseStringValue path) cs) with
  | C_Base_dResult_dResult_Base_dResult_dErr (dtb__69) -> (C_Base_dResult_dResult_Base_dResult_dErr (dtb__69))
  | C_Base_dResult_dResult_Base_dResult_dOk (dtb__70) -> (match dtb__70 with
  | C_Base_dPair_dPair_Base_dPair_dPair (dtb__71, dtb__72) -> (C_Base_dResult_dResult_Base_dResult_dOk ((C_Base_dPair_dPair_Base_dPair_dPair ((C_Vuna_dCompiler_dToml_dTomlValue_Vuna_dCompiler_dToml_dTStr (dtb__71)), dtb__72))))
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
) else (if ((bi_eq_int dtb__67) 91) then ((v_Vuna_dCompiler_dToml_dparseStringArray path) cs) else (if ((bi_eq_int dtb__67) 45) then ((v_Vuna_dCompiler_dToml_dparseIntValue path) cs) else (if (v_Vuna_dCompiler_dToml_disDigitChar dtb__67) then ((v_Vuna_dCompiler_dToml_dparseIntValue path) cs) else (match ((v_Vuna_dCompiler_dToml_dmatchWord "true") cs) with
  | C_Base_dMaybe_dMaybe_Base_dMaybe_dJust (dtb__73) -> (C_Base_dResult_dResult_Base_dResult_dOk ((C_Base_dPair_dPair_Base_dPair_dPair ((C_Vuna_dCompiler_dToml_dTomlValue_Vuna_dCompiler_dToml_dTBool (true)), dtb__73))))
  | C_Base_dMaybe_dMaybe_Base_dMaybe_dNothing -> (match ((v_Vuna_dCompiler_dToml_dmatchWord "false") cs) with
  | C_Base_dMaybe_dMaybe_Base_dMaybe_dJust (dtb__74) -> (C_Base_dResult_dResult_Base_dResult_dOk ((C_Base_dPair_dPair_Base_dPair_dPair ((C_Vuna_dCompiler_dToml_dTomlValue_Vuna_dCompiler_dToml_dTBool (false)), dtb__74))))
  | C_Base_dMaybe_dMaybe_Base_dMaybe_dNothing -> (((v_Vuna_dCompiler_dToml_dfailAt path) (v_Vuna_dCompiler_dToml_dcursorLine cs)) "expected a value")
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
)))))
  | _ -> failwith "DT: impossible branch"
)))

let rec v_Vuna_dCompiler_dToml_dparseSectionSegments = (fun path -> (fun cs -> (fun acc -> (match ((v_Vuna_dCompiler_dToml_dparseBareKey path) (v_Vuna_dCompiler_dToml_dskipBlank cs)) with
  | C_Base_dResult_dResult_Base_dResult_dErr (dtb__75) -> (C_Base_dResult_dResult_Base_dResult_dErr (dtb__75))
  | C_Base_dResult_dResult_Base_dResult_dOk (dtb__76) -> (match dtb__76 with
  | C_Base_dPair_dPair_Base_dPair_dPair (dtb__77, dtb__78) -> (match (v_Vuna_dCompiler_dToml_dskipBlank dtb__78) with
  | C_Vuna_dCompiler_dToml_dTomlCursor_Vuna_dCompiler_dToml_dTomlCursor (dtb__79, dtb__80, dtb__81) -> (match dtb__79 with
  | C_Base_dList_dList_Nil -> (((v_Vuna_dCompiler_dToml_dfailAt path) dtb__80) "unterminated section header")
  | C_Base_dList_dList_Cons (dtb__82, dtb__83) -> (if ((bi_eq_int dtb__82) 46) then (((v_Vuna_dCompiler_dToml_dparseSectionSegments path) (C_Vuna_dCompiler_dToml_dTomlCursor_Vuna_dCompiler_dToml_dTomlCursor (dtb__83, dtb__80, ((bi_add dtb__81) 1)))) (C_Base_dList_dList_Cons (dtb__77, acc))) else (if ((bi_eq_int dtb__82) 93) then (C_Base_dResult_dResult_Base_dResult_dOk ((C_Base_dPair_dPair_Base_dPair_dPair ((v_Base_dList_dreverse (C_Base_dList_dList_Cons (dtb__77, acc))), (C_Vuna_dCompiler_dToml_dTomlCursor_Vuna_dCompiler_dToml_dTomlCursor (dtb__83, dtb__80, ((bi_add dtb__81) 1))))))) else (((v_Vuna_dCompiler_dToml_dfailAt path) dtb__80) "expected '.' or ']' in section header")))
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
))))

let v_Vuna_dCompiler_dToml_dparseSectionPath = (fun path -> (fun cs -> (((v_Vuna_dCompiler_dToml_dparseSectionSegments path) cs) C_Base_dList_dList_Nil)))

let v_Vuna_dCompiler_dToml_dexpectEolAfterComment = (fun path -> (fun cs -> (match (v_Vuna_dCompiler_dToml_dskipComment cs) with
  | C_Vuna_dCompiler_dToml_dTomlCursor_Vuna_dCompiler_dToml_dTomlCursor (dtb__84, dtb__85, dtb__86) -> (match dtb__84 with
  | C_Base_dList_dList_Nil -> (C_Base_dResult_dResult_Base_dResult_dOk ((C_Vuna_dCompiler_dToml_dTomlCursor_Vuna_dCompiler_dToml_dTomlCursor (dtb__84, dtb__85, dtb__86))))
  | C_Base_dList_dList_Cons (dtb__87, dtb__88) -> (if ((bi_eq_int dtb__87) 10) then (C_Base_dResult_dResult_Base_dResult_dOk ((C_Vuna_dCompiler_dToml_dTomlCursor_Vuna_dCompiler_dToml_dTomlCursor (dtb__88, ((bi_add dtb__85) 1), 1)))) else (((v_Vuna_dCompiler_dToml_dfailAt path) dtb__85) "unexpected character after comment"))
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
)))

let v_Vuna_dCompiler_dToml_dexpectEol = (fun path -> (fun cs -> (match (v_Vuna_dCompiler_dToml_dskipBlank cs) with
  | C_Vuna_dCompiler_dToml_dTomlCursor_Vuna_dCompiler_dToml_dTomlCursor (dtb__89, dtb__90, dtb__91) -> (match dtb__89 with
  | C_Base_dList_dList_Nil -> (C_Base_dResult_dResult_Base_dResult_dOk ((C_Vuna_dCompiler_dToml_dTomlCursor_Vuna_dCompiler_dToml_dTomlCursor (dtb__89, dtb__90, dtb__91))))
  | C_Base_dList_dList_Cons (dtb__92, dtb__93) -> (if ((bi_eq_int dtb__92) 10) then (C_Base_dResult_dResult_Base_dResult_dOk ((C_Vuna_dCompiler_dToml_dTomlCursor_Vuna_dCompiler_dToml_dTomlCursor (dtb__93, ((bi_add dtb__90) 1), 1)))) else (if ((bi_eq_int dtb__92) 35) then ((v_Vuna_dCompiler_dToml_dexpectEolAfterComment path) (C_Vuna_dCompiler_dToml_dTomlCursor_Vuna_dCompiler_dToml_dTomlCursor (dtb__89, dtb__90, dtb__91))) else (((v_Vuna_dCompiler_dToml_dfailAt path) (v_Vuna_dCompiler_dToml_dcursorLine cs)) "unexpected character at end of line")))
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
)))

let rec v_Vuna_dCompiler_dToml_dsamePath = (fun d233 -> (fun mc0 -> (fun mc1 -> (match mc0 with
  | C_Base_dList_dList_Cons (dtb__94, dtb__95) -> (match mc1 with
  | C_Base_dList_dList_Cons (dtb__96, dtb__97) -> (if (((v_Base_dEq_deq d233) dtb__94) dtb__96) then (((v_Vuna_dCompiler_dToml_dsamePath d233) dtb__95) dtb__97) else false)
  | _ -> false
)
  | C_Base_dList_dList_Nil -> (match mc1 with
  | C_Base_dList_dList_Nil -> true
  | _ -> false
)
  | _ -> failwith "DT: impossible branch"
))))

let rec v_Vuna_dCompiler_dToml_dmemSectionPath = (fun d236 -> (fun section -> (fun seen -> (match seen with
  | C_Base_dList_dList_Nil -> false
  | C_Base_dList_dList_Cons (dtb__98, dtb__99) -> (if (((v_Vuna_dCompiler_dToml_dsamePath d236) section) dtb__98) then true else (((v_Vuna_dCompiler_dToml_dmemSectionPath d236) section) dtb__99))
  | _ -> failwith "DT: impossible branch"
))))

let v_Vuna_dCompiler_dToml_dsectionSuffix = (fun section -> (match section with
  | C_Base_dList_dList_Nil -> ""
  | C_Base_dList_dList_Cons (dtb__100, dtb__101) -> ((bi_concat " in [") ((bi_concat (v_Vuna_dCompiler_dCommon_djoinDots section)) "]"))
  | _ -> failwith "DT: impossible branch"
))

let rec v_Vuna_dCompiler_dToml_dhasEntry = (fun section -> (fun key -> (fun entries -> (match entries with
  | C_Base_dList_dList_Nil -> false
  | C_Base_dList_dList_Cons (dtb__102, dtb__103) -> (match dtb__102 with
  | C_Vuna_dCompiler_dToml_dTomlEntry_Vuna_dCompiler_dToml_dTomlEntry (dtb__104, dtb__105, dtb__106, dtb__107) -> (if (if (((v_Vuna_dCompiler_dToml_dsamePath (v_Base_dEq_dBase_dEq_dEq_uBase_dEq_dEq_uString ())) section) dtb__104) then ((bi_eq_str dtb__105) key) else false) then true else (((v_Vuna_dCompiler_dToml_dhasEntry section) key) dtb__103))
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
))))

let rec v_Vuna_dCompiler_dToml_dparseEntryValue = (fun path -> (fun cs -> (fun keyLine -> (fun key -> (fun section -> (fun seen -> (fun entries -> (match ((v_Vuna_dCompiler_dToml_dparseValue path) (v_Vuna_dCompiler_dToml_dskipBlank cs)) with
  | C_Base_dResult_dResult_Base_dResult_dErr (dtb__108) -> (C_Base_dResult_dResult_Base_dResult_dErr (dtb__108))
  | C_Base_dResult_dResult_Base_dResult_dOk (dtb__109) -> (match dtb__109 with
  | C_Base_dPair_dPair_Base_dPair_dPair (dtb__110, dtb__111) -> (match ((v_Vuna_dCompiler_dToml_dexpectEol path) dtb__111) with
  | C_Base_dResult_dResult_Base_dResult_dErr (dtb__112) -> (C_Base_dResult_dResult_Base_dResult_dErr (dtb__112))
  | C_Base_dResult_dResult_Base_dResult_dOk (dtb__113) -> (if (((v_Vuna_dCompiler_dToml_dhasEntry section) key) entries) then (((v_Vuna_dCompiler_dToml_dfailAt path) keyLine) ((bi_concat "duplicate key \"") ((bi_concat key) ((bi_concat "\"") (v_Vuna_dCompiler_dToml_dsectionSuffix section))))) else (((((v_Vuna_dCompiler_dToml_dparseTomlLoop path) dtb__113) section) seen) (C_Base_dList_dList_Cons ((C_Vuna_dCompiler_dToml_dTomlEntry_Vuna_dCompiler_dToml_dTomlEntry (section, key, dtb__110, keyLine)), entries))))
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
))))))))
and v_Vuna_dCompiler_dToml_dparseKeyLine = (fun path -> (fun cs -> (fun section -> (fun seen -> (fun entries -> (match ((v_Vuna_dCompiler_dToml_dparseBareKey path) cs) with
  | C_Base_dResult_dResult_Base_dResult_dErr (dtb__114) -> (C_Base_dResult_dResult_Base_dResult_dErr (dtb__114))
  | C_Base_dResult_dResult_Base_dResult_dOk (dtb__115) -> (match dtb__115 with
  | C_Base_dPair_dPair_Base_dPair_dPair (dtb__116, dtb__117) -> (match (v_Vuna_dCompiler_dToml_dskipBlank dtb__117) with
  | C_Vuna_dCompiler_dToml_dTomlCursor_Vuna_dCompiler_dToml_dTomlCursor (dtb__118, dtb__119, dtb__120) -> (match dtb__118 with
  | C_Base_dList_dList_Nil -> (((v_Vuna_dCompiler_dToml_dfailAt path) (v_Vuna_dCompiler_dToml_dcursorLine cs)) "expected '=' after key")
  | C_Base_dList_dList_Cons (dtb__121, dtb__122) -> (if ((bi_eq_int dtb__121) 61) then (((((((v_Vuna_dCompiler_dToml_dparseEntryValue path) (C_Vuna_dCompiler_dToml_dTomlCursor_Vuna_dCompiler_dToml_dTomlCursor (dtb__122, dtb__119, ((bi_add dtb__120) 1)))) (v_Vuna_dCompiler_dToml_dcursorLine cs)) dtb__116) section) seen) entries) else (((v_Vuna_dCompiler_dToml_dfailAt path) (v_Vuna_dCompiler_dToml_dcursorLine cs)) ((bi_concat "expected '=' after key \"") ((bi_concat dtb__116) "\""))))
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
))))))
and v_Vuna_dCompiler_dToml_dparseSectionLine = (fun path -> (fun cs -> (fun section -> (fun seen -> (fun entries -> (match ((v_Vuna_dCompiler_dToml_dparseSectionPath path) (v_Vuna_dCompiler_dToml_dadvanceCursor cs)) with
  | C_Base_dResult_dResult_Base_dResult_dErr (dtb__123) -> (C_Base_dResult_dResult_Base_dResult_dErr (dtb__123))
  | C_Base_dResult_dResult_Base_dResult_dOk (dtb__124) -> (match dtb__124 with
  | C_Base_dPair_dPair_Base_dPair_dPair (dtb__125, dtb__126) -> (if (((v_Vuna_dCompiler_dToml_dmemSectionPath (v_Base_dEq_dBase_dEq_dEq_uBase_dEq_dEq_uString ())) dtb__125) seen) then (((v_Vuna_dCompiler_dToml_dfailAt path) (v_Vuna_dCompiler_dToml_dcursorLine cs)) ((bi_concat "duplicate section [") ((bi_concat (v_Vuna_dCompiler_dCommon_djoinDots dtb__125)) "]"))) else (match ((v_Vuna_dCompiler_dToml_dexpectEol path) dtb__126) with
  | C_Base_dResult_dResult_Base_dResult_dErr (dtb__127) -> (C_Base_dResult_dResult_Base_dResult_dErr (dtb__127))
  | C_Base_dResult_dResult_Base_dResult_dOk (dtb__128) -> (((((v_Vuna_dCompiler_dToml_dparseTomlLoop path) dtb__128) dtb__125) (C_Base_dList_dList_Cons (dtb__125, seen))) entries)
  | _ -> failwith "DT: impossible branch"
))
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
))))))
and v_Vuna_dCompiler_dToml_dparseTomlLoop = (fun path -> (fun cs -> (fun section -> (fun seen -> (fun entries -> (((((v_Vuna_dCompiler_dToml_dparseTomlLoopAt path) (v_Vuna_dCompiler_dToml_dskipGap cs)) section) seen) entries))))))
and v_Vuna_dCompiler_dToml_dparseTomlLoopAt = (fun path -> (fun cs -> (fun section -> (fun seen -> (fun entries -> (match (v_Vuna_dCompiler_dToml_dcursorChars cs) with
  | C_Base_dList_dList_Nil -> (C_Base_dResult_dResult_Base_dResult_dOk ((v_Base_dList_dreverse entries)))
  | C_Base_dList_dList_Cons (dtb__129, dtb__130) -> (if ((bi_eq_int dtb__129) 91) then (((((v_Vuna_dCompiler_dToml_dparseSectionLine path) cs) section) seen) entries) else (((((v_Vuna_dCompiler_dToml_dparseKeyLine path) cs) section) seen) entries))
  | _ -> failwith "DT: impossible branch"
))))))

let v_Vuna_dCompiler_dToml_dparseTomlAt = (fun path -> (fun source -> (((((v_Vuna_dCompiler_dToml_dparseTomlLoop path) (C_Vuna_dCompiler_dToml_dTomlCursor_Vuna_dCompiler_dToml_dTomlCursor ((v_Vuna_dCompiler_dToml_dstripCR (dtp_unpack source)), 1, 1))) C_Base_dList_dList_Nil) C_Base_dList_dList_Nil) C_Base_dList_dList_Nil)))

let v_Vuna_dCompiler_dToml_dparseToml = (fun source -> ((v_Vuna_dCompiler_dToml_dparseTomlAt "") source))

let rec v_Vuna_dCompiler_dToml_dlookupEntry = (fun section -> (fun key -> (fun entries -> (match entries with
  | C_Base_dList_dList_Nil -> C_Base_dMaybe_dMaybe_Base_dMaybe_dNothing
  | C_Base_dList_dList_Cons (dtb__131, dtb__132) -> (match dtb__131 with
  | C_Vuna_dCompiler_dToml_dTomlEntry_Vuna_dCompiler_dToml_dTomlEntry (dtb__133, dtb__134, dtb__135, dtb__136) -> (if (if (((v_Vuna_dCompiler_dToml_dsamePath (v_Base_dEq_dBase_dEq_dEq_uBase_dEq_dEq_uString ())) section) dtb__133) then ((bi_eq_str dtb__134) key) else false) then (C_Base_dMaybe_dMaybe_Base_dMaybe_dJust (dtb__135)) else (((v_Vuna_dCompiler_dToml_dlookupEntry section) key) dtb__132))
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
))))

let rec v_Vuna_dCompiler_dToml_dlookupEntryLine = (fun section -> (fun key -> (fun entries -> (match entries with
  | C_Base_dList_dList_Nil -> C_Base_dMaybe_dMaybe_Base_dMaybe_dNothing
  | C_Base_dList_dList_Cons (dtb__137, dtb__138) -> (match dtb__137 with
  | C_Vuna_dCompiler_dToml_dTomlEntry_Vuna_dCompiler_dToml_dTomlEntry (dtb__139, dtb__140, dtb__141, dtb__142) -> (if (if (((v_Vuna_dCompiler_dToml_dsamePath (v_Base_dEq_dBase_dEq_dEq_uBase_dEq_dEq_uString ())) section) dtb__139) then ((bi_eq_str dtb__140) key) else false) then (C_Base_dMaybe_dMaybe_Base_dMaybe_dJust (dtb__142)) else (((v_Vuna_dCompiler_dToml_dlookupEntryLine section) key) dtb__138))
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
))))
