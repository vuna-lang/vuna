open Vuna_runtime
open Base_dPair
open Base_dBool
open Base_dMonad
open Base_dMaybe
open Base_dList
open Base_dIO
open Base_dResult
open Base_dString
open Prelude
open Vuna_dCompiler_dCommon
type   t_Vuna_dCompiler_dToml_dTomlValue =
    C_Vuna_dCompiler_dToml_dTStr of (string)
  | C_Vuna_dCompiler_dToml_dTInt of (int)
  | C_Vuna_dCompiler_dToml_dTBool of (bool)
  | C_Vuna_dCompiler_dToml_dTList of ((string) list)
and   t_Vuna_dCompiler_dToml_dTomlEntry =
    C_Vuna_dCompiler_dToml_dTomlEntry of ((string) list) * (string) * (t_Vuna_dCompiler_dToml_dTomlValue) * (int)
and   t_Vuna_dCompiler_dToml_dTomlCursor =
    C_Vuna_dCompiler_dToml_dTomlCursor of ((int) list) * (int) * (int)
let rec show_Vuna_dCompiler_dToml_dTomlValue v =
  match v with
  | C_Vuna_dCompiler_dToml_dTStr f0 -> show_ctor "TStr" [(show_vstring) f0]
  | C_Vuna_dCompiler_dToml_dTInt f0 -> show_ctor "TInt" [(string_of_int) f0]
  | C_Vuna_dCompiler_dToml_dTBool f0 -> show_ctor "TBool" [(show_vbool) f0]
  | C_Vuna_dCompiler_dToml_dTList f0 -> show_ctor "TList" [((fun v -> let rec go = function [] -> "Nil" | x :: xs -> "(Cons " ^ (show_vstring) x ^ " " ^ go xs ^ ")" in go v)) f0]
and show_Vuna_dCompiler_dToml_dTomlEntry v =
  match v with
  | C_Vuna_dCompiler_dToml_dTomlEntry (f0, f1, f2, f3) -> show_ctor "TomlEntry" [((fun v -> let rec go = function [] -> "Nil" | x :: xs -> "(Cons " ^ (show_vstring) x ^ " " ^ go xs ^ ")" in go v)) f0; (show_vstring) f1; (show_Vuna_dCompiler_dToml_dTomlValue) f2; (string_of_int) f3]
and show_Vuna_dCompiler_dToml_dTomlCursor v =
  match v with
  | C_Vuna_dCompiler_dToml_dTomlCursor (f0, f1, f2) -> show_ctor "TomlCursor" [((fun v -> let rec go = function [] -> "Nil" | x :: xs -> "(Cons " ^ (string_of_int) x ^ " " ^ go xs ^ ")" in go v)) f0; (string_of_int) f1; (string_of_int) f2]
let v_Vuna_dCompiler_dToml_dcursorChars = fun a0 -> match a0 with
  | (C_Vuna_dCompiler_dToml_dTomlCursor (chars, line, col)) -> chars
  | _ -> vuna_fail "compiler/lib/Vuna/Compiler/Toml.vuna" 27 1 ("no matching clause for Vuna.Compiler.Toml.cursorChars")

let v_Vuna_dCompiler_dToml_dcursorLine = fun a0 -> match a0 with
  | (C_Vuna_dCompiler_dToml_dTomlCursor (chars, line, col)) -> line
  | _ -> vuna_fail "compiler/lib/Vuna/Compiler/Toml.vuna" 29 1 ("no matching clause for Vuna.Compiler.Toml.cursorLine")

let v_Vuna_dCompiler_dToml_dcursorCol = fun a0 -> match a0 with
  | (C_Vuna_dCompiler_dToml_dTomlCursor (chars, line, col)) -> col
  | _ -> vuna_fail "compiler/lib/Vuna/Compiler/Toml.vuna" 31 1 ("no matching clause for Vuna.Compiler.Toml.cursorCol")

let v_Vuna_dCompiler_dToml_dadvanceCursor = fun a0 -> match a0 with
  | (C_Vuna_dCompiler_dToml_dTomlCursor ([], line, col)) -> C_Vuna_dCompiler_dToml_dTomlCursor ([], line, col)
  | (C_Vuna_dCompiler_dToml_dTomlCursor ((c) :: (rest), line, col)) -> if v_vuna_ueq_uint c 10 then C_Vuna_dCompiler_dToml_dTomlCursor (rest, bi_add line 1, 1) else C_Vuna_dCompiler_dToml_dTomlCursor (rest, line, bi_add col 1)
  | _ -> vuna_fail "compiler/lib/Vuna/Compiler/Toml.vuna" 33 1 ("no matching clause for Vuna.Compiler.Toml.advanceCursor")

let v_Vuna_dCompiler_dToml_disDigitChar = fun c -> (if (v_vuna_uge_uint c 48) then (v_vuna_ule_uint c 57) else false)

let v_Vuna_dCompiler_dToml_disUpperAlphaChar = fun c -> (if (v_vuna_uge_uint c 65) then (v_vuna_ule_uint c 90) else false)

let v_Vuna_dCompiler_dToml_disLowerAlphaChar = fun c -> (if (v_vuna_uge_uint c 97) then (v_vuna_ule_uint c 122) else false)

let v_Vuna_dCompiler_dToml_disAlphaChar = fun c -> (if (v_Vuna_dCompiler_dToml_disUpperAlphaChar c) then true else (v_Vuna_dCompiler_dToml_disLowerAlphaChar c))

let v_Vuna_dCompiler_dToml_disBareKeyChar = fun c -> (if ((if ((if (v_Vuna_dCompiler_dToml_disAlphaChar c) then true else (v_Vuna_dCompiler_dToml_disDigitChar c))) then true else (v_vuna_ueq_uint c 95))) then true else (v_vuna_ueq_uint c 45))

let v_Vuna_dCompiler_dToml_disBlankChar = fun c -> (if (v_vuna_ueq_uint c 32) then true else (v_vuna_ueq_uint c 9))

let rec v_Vuna_dCompiler_dToml_dstripCR = fun a0 -> match a0 with
  | ([]) -> []
  | ((c) :: (rest)) -> if v_vuna_ueq_uint c 13 then v_Vuna_dCompiler_dToml_dstripCR rest else (c) :: (v_Vuna_dCompiler_dToml_dstripCR rest)
  | _ -> vuna_fail "compiler/lib/Vuna/Compiler/Toml.vuna" 52 1 ("no matching clause for Vuna.Compiler.Toml.stripCR")

let v_Vuna_dCompiler_dToml_dlocPrefix = fun path line -> if v_vuna_ueq_ustr path "" then (let vuna_cat0' = ("line ") in (let vuna_cat1' = (bi_str_from_int line) in (let vuna_cat2' = (": ") in String.concat "" [vuna_cat0'; vuna_cat1'; vuna_cat2']))) else (let vuna_cat0' = (path) in (let vuna_cat1' = (":") in (let vuna_cat2' = (bi_str_from_int line) in (let vuna_cat3' = (": ") in String.concat "" [vuna_cat0'; vuna_cat1'; vuna_cat2'; vuna_cat3']))))

let v_Vuna_dCompiler_dToml_dfailAt = fun path line msg -> C_Base_dResult_dErr (((v_Vuna_dCompiler_dToml_dlocPrefix path line) ^ (msg)))

let rec v_Vuna_dCompiler_dToml_dskipBlank = fun cs -> (match v_Vuna_dCompiler_dToml_dcursorChars cs with
  | [] -> cs
  | (c) :: (rest) -> if v_Vuna_dCompiler_dToml_disBlankChar c then v_Vuna_dCompiler_dToml_dskipBlank (v_Vuna_dCompiler_dToml_dadvanceCursor cs) else cs
  | _ -> vuna_fail "compiler/lib/Vuna/Compiler/Toml.vuna" 64 3 ("case pattern match failure"))

let rec v_Vuna_dCompiler_dToml_dskipComment = fun cs -> (match v_Vuna_dCompiler_dToml_dcursorChars cs with
  | [] -> cs
  | (c) :: (rest) -> if v_vuna_ueq_uint c 10 then cs else v_Vuna_dCompiler_dToml_dskipComment (v_Vuna_dCompiler_dToml_dadvanceCursor cs)
  | _ -> vuna_fail "compiler/lib/Vuna/Compiler/Toml.vuna" 70 3 ("case pattern match failure"))

let rec v_Vuna_dCompiler_dToml_dskipGap = fun cs -> (match v_Vuna_dCompiler_dToml_dcursorChars cs with
  | [] -> cs
  | (c) :: (rest) -> if (if (v_Vuna_dCompiler_dToml_disBlankChar c) then true else (v_vuna_ueq_uint c 10)) then v_Vuna_dCompiler_dToml_dskipGap (v_Vuna_dCompiler_dToml_dadvanceCursor cs) else if v_vuna_ueq_uint c 35 then v_Vuna_dCompiler_dToml_dskipGap (v_Vuna_dCompiler_dToml_dskipComment cs) else cs
  | _ -> vuna_fail "compiler/lib/Vuna/Compiler/Toml.vuna" 76 3 ("case pattern match failure"))

let rec v_Vuna_dCompiler_dToml_dcollectBareKey = fun cs acc -> (match v_Vuna_dCompiler_dToml_dcursorChars cs with
  | [] -> C_Base_dPair_dPair (bi_str_pack (v_Base_dList_dreverse acc), cs)
  | (c) :: (rest) -> if v_Vuna_dCompiler_dToml_disBareKeyChar c then v_Vuna_dCompiler_dToml_dcollectBareKey (v_Vuna_dCompiler_dToml_dadvanceCursor cs) ((c) :: (acc)) else C_Base_dPair_dPair (bi_str_pack (v_Base_dList_dreverse acc), cs)
  | _ -> vuna_fail "compiler/lib/Vuna/Compiler/Toml.vuna" 84 3 ("case pattern match failure"))

let v_Vuna_dCompiler_dToml_dparseBareKey = fun path cs -> (match v_Vuna_dCompiler_dToml_dcursorChars cs with
  | [] -> v_Vuna_dCompiler_dToml_dfailAt path (v_Vuna_dCompiler_dToml_dcursorLine cs) "expected a key"
  | (c) :: (rest) -> if v_Vuna_dCompiler_dToml_disBareKeyChar c then (match v_Vuna_dCompiler_dToml_dcollectBareKey cs [] with
  | C_Base_dPair_dPair (name, after) -> C_Base_dResult_dOk (C_Base_dPair_dPair (name, after))
  | _ -> vuna_fail "compiler/lib/Vuna/Compiler/Toml.vuna" 95 9 ("case pattern match failure")) else v_Vuna_dCompiler_dToml_dfailAt path (v_Vuna_dCompiler_dToml_dcursorLine cs) "expected a key"
  | _ -> vuna_fail "compiler/lib/Vuna/Compiler/Toml.vuna" 91 3 ("case pattern match failure"))

let rec v_Vuna_dCompiler_dToml_dparseStringChars = fun path startCs cs acc -> (match v_Vuna_dCompiler_dToml_dcursorChars cs with
  | [] -> v_Vuna_dCompiler_dToml_dfailAt path (v_Vuna_dCompiler_dToml_dcursorLine startCs) "unterminated basic string"
  | (c) :: (rest) -> if v_vuna_ueq_uint c 34 then C_Base_dResult_dOk (C_Base_dPair_dPair (bi_str_pack (v_Base_dList_dreverse acc), v_Vuna_dCompiler_dToml_dadvanceCursor cs)) else if v_vuna_ueq_uint c 10 then v_Vuna_dCompiler_dToml_dfailAt path (v_Vuna_dCompiler_dToml_dcursorLine startCs) "unterminated basic string (newline in string)" else if v_vuna_ueq_uint c 92 then v_Vuna_dCompiler_dToml_dparseStringEscape path startCs (v_Vuna_dCompiler_dToml_dadvanceCursor cs) acc else v_Vuna_dCompiler_dToml_dparseStringChars path startCs (v_Vuna_dCompiler_dToml_dadvanceCursor cs) ((c) :: (acc))
  | _ -> vuna_fail "compiler/lib/Vuna/Compiler/Toml.vuna" 106 3 ("case pattern match failure"))
and v_Vuna_dCompiler_dToml_dparseStringEscape = fun path startCs cs acc -> (match v_Vuna_dCompiler_dToml_dcursorChars cs with
  | [] -> v_Vuna_dCompiler_dToml_dfailAt path (v_Vuna_dCompiler_dToml_dcursorLine startCs) "unterminated escape sequence"
  | (c) :: (rest) -> if v_vuna_ueq_uint c 110 then v_Vuna_dCompiler_dToml_dparseStringChars path startCs (v_Vuna_dCompiler_dToml_dadvanceCursor cs) ((10) :: (acc)) else if v_vuna_ueq_uint c 116 then v_Vuna_dCompiler_dToml_dparseStringChars path startCs (v_Vuna_dCompiler_dToml_dadvanceCursor cs) ((9) :: (acc)) else if v_vuna_ueq_uint c 114 then v_Vuna_dCompiler_dToml_dparseStringChars path startCs (v_Vuna_dCompiler_dToml_dadvanceCursor cs) ((13) :: (acc)) else if v_vuna_ueq_uint c 98 then v_Vuna_dCompiler_dToml_dparseStringChars path startCs (v_Vuna_dCompiler_dToml_dadvanceCursor cs) ((8) :: (acc)) else if v_vuna_ueq_uint c 102 then v_Vuna_dCompiler_dToml_dparseStringChars path startCs (v_Vuna_dCompiler_dToml_dadvanceCursor cs) ((12) :: (acc)) else if v_vuna_ueq_uint c 34 then v_Vuna_dCompiler_dToml_dparseStringChars path startCs (v_Vuna_dCompiler_dToml_dadvanceCursor cs) ((34) :: (acc)) else if v_vuna_ueq_uint c 92 then v_Vuna_dCompiler_dToml_dparseStringChars path startCs (v_Vuna_dCompiler_dToml_dadvanceCursor cs) ((92) :: (acc)) else v_Vuna_dCompiler_dToml_dfailAt path (v_Vuna_dCompiler_dToml_dcursorLine cs) ((("unknown escape sequence \\") ^ (bi_str_pack ((c) :: ([])))))
  | _ -> vuna_fail "compiler/lib/Vuna/Compiler/Toml.vuna" 115 3 ("case pattern match failure"))

let v_Vuna_dCompiler_dToml_dparseStringValue = fun path cs -> (match v_Vuna_dCompiler_dToml_dcursorChars cs with
  | [] -> v_Vuna_dCompiler_dToml_dfailAt path (v_Vuna_dCompiler_dToml_dcursorLine cs) "unterminated basic string"
  | (c) :: (rest) -> v_Vuna_dCompiler_dToml_dparseStringChars path cs (v_Vuna_dCompiler_dToml_dadvanceCursor cs) []
  | _ -> vuna_fail "compiler/lib/Vuna/Compiler/Toml.vuna" 101 3 ("case pattern match failure"))

let v_Vuna_dCompiler_dToml_dmakeInteger = fun acc negative -> if negative then bi_sub 0 acc else acc

let v_Vuna_dCompiler_dToml_dfinishInteger = fun path startCs cs count acc negative -> if v_vuna_ueq_uint count 0 then v_Vuna_dCompiler_dToml_dfailAt path (v_Vuna_dCompiler_dToml_dcursorLine startCs) "expected digits for integer" else (match v_Vuna_dCompiler_dToml_dcursorChars cs with
  | [] -> C_Base_dResult_dOk (C_Base_dPair_dPair (v_Vuna_dCompiler_dToml_dmakeInteger acc negative, cs))
  | (c) :: (rest) -> if v_vuna_ueq_uint c 46 then v_Vuna_dCompiler_dToml_dfailAt path (v_Vuna_dCompiler_dToml_dcursorLine startCs) "floating point numbers are not supported" else if v_Vuna_dCompiler_dToml_disBareKeyChar c then v_Vuna_dCompiler_dToml_dfailAt path (v_Vuna_dCompiler_dToml_dcursorLine startCs) "invalid integer literal" else C_Base_dResult_dOk (C_Base_dPair_dPair (v_Vuna_dCompiler_dToml_dmakeInteger acc negative, cs))
  | _ -> vuna_fail "compiler/lib/Vuna/Compiler/Toml.vuna" 147 5 ("case pattern match failure"))

let rec v_Vuna_dCompiler_dToml_dparseIntegerDigits = fun path startCs cs count acc negative -> (match v_Vuna_dCompiler_dToml_dcursorChars cs with
  | [] -> v_Vuna_dCompiler_dToml_dfinishInteger path startCs cs count acc negative
  | (c) :: (rest) -> if v_Vuna_dCompiler_dToml_disDigitChar c then v_Vuna_dCompiler_dToml_dparseIntegerDigits path startCs (v_Vuna_dCompiler_dToml_dadvanceCursor cs) (bi_add count 1) (bi_add (bi_mul acc 10) (bi_sub c 48)) negative else v_Vuna_dCompiler_dToml_dfinishInteger path startCs cs count acc negative
  | _ -> vuna_fail "compiler/lib/Vuna/Compiler/Toml.vuna" 137 3 ("case pattern match failure"))

let v_Vuna_dCompiler_dToml_dparseInteger = fun path cs -> (match v_Vuna_dCompiler_dToml_dcursorChars cs with
  | [] -> v_Vuna_dCompiler_dToml_dfailAt path (v_Vuna_dCompiler_dToml_dcursorLine cs) "expected an integer"
  | (c) :: (rest) -> if v_vuna_ueq_uint c 45 then v_Vuna_dCompiler_dToml_dparseIntegerDigits path cs (v_Vuna_dCompiler_dToml_dadvanceCursor cs) 0 0 true else if v_Vuna_dCompiler_dToml_disDigitChar c then v_Vuna_dCompiler_dToml_dparseIntegerDigits path cs cs 0 0 false else v_Vuna_dCompiler_dToml_dfailAt path (v_Vuna_dCompiler_dToml_dcursorLine cs) "expected an integer"
  | _ -> vuna_fail "compiler/lib/Vuna/Compiler/Toml.vuna" 129 3 ("case pattern match failure"))

let v_Vuna_dCompiler_dToml_dparseIntValue = fun path cs -> (match v_Vuna_dCompiler_dToml_dparseInteger path cs with
  | C_Base_dResult_dErr (e) -> C_Base_dResult_dErr (e)
  | C_Base_dResult_dOk (C_Base_dPair_dPair (n, afterInteger)) -> C_Base_dResult_dOk (C_Base_dPair_dPair (C_Vuna_dCompiler_dToml_dTInt (n), afterInteger))
  | _ -> vuna_fail "compiler/lib/Vuna/Compiler/Toml.vuna" 157 3 ("case pattern match failure"))

let rec v_Vuna_dCompiler_dToml_dmatchChars = fun a0 a1 -> match (a0, a1) with
  | ([], cs) -> C_Base_dMaybe_dJust (cs)
  | ((want) :: (wants), cs) -> (match v_Vuna_dCompiler_dToml_dcursorChars cs with
  | [] -> C_Base_dMaybe_dNothing
  | (c) :: (rest) -> if v_vuna_ueq_uint c want then v_Vuna_dCompiler_dToml_dmatchChars wants (v_Vuna_dCompiler_dToml_dadvanceCursor cs) else C_Base_dMaybe_dNothing
  | _ -> vuna_fail "compiler/lib/Vuna/Compiler/Toml.vuna" 165 3 ("case pattern match failure"))
  | _ -> vuna_fail "compiler/lib/Vuna/Compiler/Toml.vuna" 162 1 ("no matching clause for Vuna.Compiler.Toml.matchChars")

let v_Vuna_dCompiler_dToml_dmatchWord = fun word cs -> (match v_Vuna_dCompiler_dToml_dmatchChars (bi_str_unpack word) cs with
  | C_Base_dMaybe_dNothing -> C_Base_dMaybe_dNothing
  | C_Base_dMaybe_dJust (after) -> (match v_Vuna_dCompiler_dToml_dcursorChars after with
  | [] -> C_Base_dMaybe_dJust (after)
  | (c) :: (rest) -> if v_Vuna_dCompiler_dToml_disBareKeyChar c then C_Base_dMaybe_dNothing else C_Base_dMaybe_dJust (after)
  | _ -> vuna_fail "compiler/lib/Vuna/Compiler/Toml.vuna" 173 7 ("case pattern match failure"))
  | _ -> vuna_fail "compiler/lib/Vuna/Compiler/Toml.vuna" 170 3 ("case pattern match failure"))

let rec v_Vuna_dCompiler_dToml_dparseArrayItems = fun path cs acc -> (match v_Vuna_dCompiler_dToml_dskipGap cs with
  | C_Vuna_dCompiler_dToml_dTomlCursor (chars, line, col) -> (match chars with
  | [] -> v_Vuna_dCompiler_dToml_dfailAt path line "unterminated array"
  | (c) :: (rest) -> if v_vuna_ueq_uint c 93 then C_Base_dResult_dOk (C_Base_dPair_dPair (C_Vuna_dCompiler_dToml_dTList (v_Base_dList_dreverse acc), v_Vuna_dCompiler_dToml_dadvanceCursor (C_Vuna_dCompiler_dToml_dTomlCursor (chars, line, col)))) else if v_vuna_ueq_uint c 34 then v_Vuna_dCompiler_dToml_dparseArrayString path (C_Vuna_dCompiler_dToml_dTomlCursor (chars, line, col)) acc else v_Vuna_dCompiler_dToml_dfailAt path line "expected a string in array"
  | _ -> vuna_fail "compiler/lib/Vuna/Compiler/Toml.vuna" 186 7 ("case pattern match failure"))
  | _ -> vuna_fail "compiler/lib/Vuna/Compiler/Toml.vuna" 184 3 ("case pattern match failure"))
and v_Vuna_dCompiler_dToml_dparseArrayString = fun path cs acc -> (match v_Vuna_dCompiler_dToml_dparseStringValue path cs with
  | C_Base_dResult_dErr (e) -> C_Base_dResult_dErr (e)
  | C_Base_dResult_dOk (C_Base_dPair_dPair (s, afterString)) -> (match v_Vuna_dCompiler_dToml_dskipGap afterString with
  | C_Vuna_dCompiler_dToml_dTomlCursor (chars, line, col) -> (match chars with
  | [] -> v_Vuna_dCompiler_dToml_dfailAt path line "unterminated array"
  | (c) :: (rest) -> if v_vuna_ueq_uint c 44 then v_Vuna_dCompiler_dToml_dparseArrayItems path (v_Vuna_dCompiler_dToml_dadvanceCursor (C_Vuna_dCompiler_dToml_dTomlCursor (chars, line, col))) ((s) :: (acc)) else if v_vuna_ueq_uint c 93 then C_Base_dResult_dOk (C_Base_dPair_dPair (C_Vuna_dCompiler_dToml_dTList (v_Base_dList_dreverse ((s) :: (acc))), v_Vuna_dCompiler_dToml_dadvanceCursor (C_Vuna_dCompiler_dToml_dTomlCursor (chars, line, col)))) else v_Vuna_dCompiler_dToml_dfailAt path line "expected ',' or ']' in array"
  | _ -> vuna_fail "compiler/lib/Vuna/Compiler/Toml.vuna" 199 11 ("case pattern match failure"))
  | _ -> vuna_fail "compiler/lib/Vuna/Compiler/Toml.vuna" 197 7 ("case pattern match failure"))
  | _ -> vuna_fail "compiler/lib/Vuna/Compiler/Toml.vuna" 194 3 ("case pattern match failure"))

let v_Vuna_dCompiler_dToml_dparseStringArray = fun path cs -> (match v_Vuna_dCompiler_dToml_dcursorChars cs with
  | [] -> v_Vuna_dCompiler_dToml_dfailAt path (v_Vuna_dCompiler_dToml_dcursorLine cs) "unterminated array"
  | (c) :: (rest) -> v_Vuna_dCompiler_dToml_dparseArrayItems path (v_Vuna_dCompiler_dToml_dadvanceCursor cs) []
  | _ -> vuna_fail "compiler/lib/Vuna/Compiler/Toml.vuna" 179 3 ("case pattern match failure"))

let v_Vuna_dCompiler_dToml_dparseValue = fun path cs -> (match v_Vuna_dCompiler_dToml_dcursorChars cs with
  | [] -> v_Vuna_dCompiler_dToml_dfailAt path (v_Vuna_dCompiler_dToml_dcursorLine cs) "expected a value"
  | (c) :: (rest) -> if v_vuna_ueq_uint c 34 then (match v_Vuna_dCompiler_dToml_dparseStringValue path cs with
  | C_Base_dResult_dErr (e) -> C_Base_dResult_dErr (e)
  | C_Base_dResult_dOk (C_Base_dPair_dPair (s, afterString)) -> C_Base_dResult_dOk (C_Base_dPair_dPair (C_Vuna_dCompiler_dToml_dTStr (s), afterString))
  | _ -> vuna_fail "compiler/lib/Vuna/Compiler/Toml.vuna" 212 9 ("case pattern match failure")) else if v_vuna_ueq_uint c 91 then v_Vuna_dCompiler_dToml_dparseStringArray path cs else if v_vuna_ueq_uint c 45 then v_Vuna_dCompiler_dToml_dparseIntValue path cs else if v_Vuna_dCompiler_dToml_disDigitChar c then v_Vuna_dCompiler_dToml_dparseIntValue path cs else (match v_Vuna_dCompiler_dToml_dmatchWord "true" cs with
  | C_Base_dMaybe_dJust (afterTrue) -> C_Base_dResult_dOk (C_Base_dPair_dPair (C_Vuna_dCompiler_dToml_dTBool (true), afterTrue))
  | C_Base_dMaybe_dNothing -> (match v_Vuna_dCompiler_dToml_dmatchWord "false" cs with
  | C_Base_dMaybe_dJust (afterFalse) -> C_Base_dResult_dOk (C_Base_dPair_dPair (C_Vuna_dCompiler_dToml_dTBool (false), afterFalse))
  | C_Base_dMaybe_dNothing -> v_Vuna_dCompiler_dToml_dfailAt path (v_Vuna_dCompiler_dToml_dcursorLine cs) "expected a value"
  | _ -> vuna_fail "compiler/lib/Vuna/Compiler/Toml.vuna" 222 13 ("case pattern match failure"))
  | _ -> vuna_fail "compiler/lib/Vuna/Compiler/Toml.vuna" 219 9 ("case pattern match failure"))
  | _ -> vuna_fail "compiler/lib/Vuna/Compiler/Toml.vuna" 208 3 ("case pattern match failure"))

let rec v_Vuna_dCompiler_dToml_dparseSectionSegments = fun path cs acc -> (match v_Vuna_dCompiler_dToml_dparseBareKey path (v_Vuna_dCompiler_dToml_dskipBlank cs) with
  | C_Base_dResult_dErr (e) -> C_Base_dResult_dErr (e)
  | C_Base_dResult_dOk (C_Base_dPair_dPair (seg, afterSeg)) -> (match v_Vuna_dCompiler_dToml_dskipBlank afterSeg with
  | C_Vuna_dCompiler_dToml_dTomlCursor (chars, line, col) -> (match chars with
  | [] -> v_Vuna_dCompiler_dToml_dfailAt path line "unterminated section header"
  | (c) :: (rest) -> if v_vuna_ueq_uint c 46 then v_Vuna_dCompiler_dToml_dparseSectionSegments path (C_Vuna_dCompiler_dToml_dTomlCursor (rest, line, bi_add col 1)) ((seg) :: (acc)) else if v_vuna_ueq_uint c 93 then C_Base_dResult_dOk (C_Base_dPair_dPair (v_Base_dList_dreverse ((seg) :: (acc)), C_Vuna_dCompiler_dToml_dTomlCursor (rest, line, bi_add col 1))) else v_Vuna_dCompiler_dToml_dfailAt path line "expected '.' or ']' in section header"
  | _ -> vuna_fail "compiler/lib/Vuna/Compiler/Toml.vuna" 235 11 ("case pattern match failure"))
  | _ -> vuna_fail "compiler/lib/Vuna/Compiler/Toml.vuna" 233 7 ("case pattern match failure"))
  | _ -> vuna_fail "compiler/lib/Vuna/Compiler/Toml.vuna" 230 3 ("case pattern match failure"))

let v_Vuna_dCompiler_dToml_dparseSectionPath = fun path cs -> v_Vuna_dCompiler_dToml_dparseSectionSegments path cs []

let v_Vuna_dCompiler_dToml_dexpectEolAfterComment = fun path cs -> (match v_Vuna_dCompiler_dToml_dskipComment cs with
  | C_Vuna_dCompiler_dToml_dTomlCursor (chars, line, col) -> (match chars with
  | [] -> C_Base_dResult_dOk (C_Vuna_dCompiler_dToml_dTomlCursor (chars, line, col))
  | (c) :: (rest) -> if v_vuna_ueq_uint c 10 then C_Base_dResult_dOk (C_Vuna_dCompiler_dToml_dTomlCursor (rest, bi_add line 1, 1)) else v_Vuna_dCompiler_dToml_dfailAt path line "unexpected character after comment"
  | _ -> vuna_fail "compiler/lib/Vuna/Compiler/Toml.vuna" 256 7 ("case pattern match failure"))
  | _ -> vuna_fail "compiler/lib/Vuna/Compiler/Toml.vuna" 254 3 ("case pattern match failure"))

let v_Vuna_dCompiler_dToml_dexpectEol = fun path cs -> (match v_Vuna_dCompiler_dToml_dskipBlank cs with
  | C_Vuna_dCompiler_dToml_dTomlCursor (chars, line, col) -> (match chars with
  | [] -> C_Base_dResult_dOk (C_Vuna_dCompiler_dToml_dTomlCursor (chars, line, col))
  | (c) :: (rest) -> if v_vuna_ueq_uint c 10 then C_Base_dResult_dOk (C_Vuna_dCompiler_dToml_dTomlCursor (rest, bi_add line 1, 1)) else if v_vuna_ueq_uint c 35 then v_Vuna_dCompiler_dToml_dexpectEolAfterComment path (C_Vuna_dCompiler_dToml_dTomlCursor (chars, line, col)) else v_Vuna_dCompiler_dToml_dfailAt path (v_Vuna_dCompiler_dToml_dcursorLine cs) "unexpected character at end of line"
  | _ -> vuna_fail "compiler/lib/Vuna/Compiler/Toml.vuna" 246 7 ("case pattern match failure"))
  | _ -> vuna_fail "compiler/lib/Vuna/Compiler/Toml.vuna" 244 3 ("case pattern match failure"))

let rec v_Vuna_dCompiler_dToml_dsamePath = fun a0 a1 -> match (a0, a1) with
  | ([], []) -> true
  | ((x) :: (xs), (y) :: (ys)) -> if v_vuna_ueq_ugeneric x y then v_Vuna_dCompiler_dToml_dsamePath xs ys else false
  | (_, _) -> false
  | _ -> vuna_fail "compiler/lib/Vuna/Compiler/Toml.vuna" 262 1 ("no matching clause for Vuna.Compiler.Toml.samePath")

let rec v_Vuna_dCompiler_dToml_dmemSectionPath = fun section seen -> (match seen with
  | [] -> false
  | (s) :: (rest) -> if v_Vuna_dCompiler_dToml_dsamePath section s then true else v_Vuna_dCompiler_dToml_dmemSectionPath section rest
  | _ -> vuna_fail "compiler/lib/Vuna/Compiler/Toml.vuna" 269 3 ("case pattern match failure"))

let v_Vuna_dCompiler_dToml_dsectionSuffix = fun section -> (match section with
  | [] -> ""
  | (first) :: (rest) -> (let vuna_cat0' = (" in [") in (let vuna_cat1' = (v_Vuna_dCompiler_dCommon_djoinDots section) in (let vuna_cat2' = ("]") in String.concat "" [vuna_cat0'; vuna_cat1'; vuna_cat2'])))
  | _ -> vuna_fail "compiler/lib/Vuna/Compiler/Toml.vuna" 274 3 ("case pattern match failure"))

let rec v_Vuna_dCompiler_dToml_dhasEntry = fun section key entries -> (match entries with
  | [] -> false
  | (C_Vuna_dCompiler_dToml_dTomlEntry (s, k, v, line)) :: (rest) -> if (if (v_Vuna_dCompiler_dToml_dsamePath section s) then (v_vuna_ueq_ustr k key) else false) then true else v_Vuna_dCompiler_dToml_dhasEntry section key rest
  | _ -> vuna_fail "compiler/lib/Vuna/Compiler/Toml.vuna" 279 3 ("case pattern match failure"))

let rec v_Vuna_dCompiler_dToml_dparseEntryValue = fun path cs keyLine key section seen entries -> (match v_Vuna_dCompiler_dToml_dparseValue path (v_Vuna_dCompiler_dToml_dskipBlank cs) with
  | C_Base_dResult_dErr (e) -> C_Base_dResult_dErr (e)
  | C_Base_dResult_dOk (C_Base_dPair_dPair (value, afterValue)) -> (match v_Vuna_dCompiler_dToml_dexpectEol path afterValue with
  | C_Base_dResult_dErr (e) -> C_Base_dResult_dErr (e)
  | C_Base_dResult_dOk (afterLine) -> if v_Vuna_dCompiler_dToml_dhasEntry section key entries then v_Vuna_dCompiler_dToml_dfailAt path keyLine ((let vuna_cat0' = ("duplicate key \"") in (let vuna_cat1' = (key) in (let vuna_cat2' = ("\"") in (let vuna_cat3' = (v_Vuna_dCompiler_dToml_dsectionSuffix section) in String.concat "" [vuna_cat0'; vuna_cat1'; vuna_cat2'; vuna_cat3']))))) else v_Vuna_dCompiler_dToml_dparseTomlLoop path afterLine section seen ((C_Vuna_dCompiler_dToml_dTomlEntry (section, key, value, keyLine)) :: (entries))
  | _ -> vuna_fail "compiler/lib/Vuna/Compiler/Toml.vuna" 288 7 ("case pattern match failure"))
  | _ -> vuna_fail "compiler/lib/Vuna/Compiler/Toml.vuna" 285 3 ("case pattern match failure"))
and v_Vuna_dCompiler_dToml_dparseKeyLine = fun path cs section seen entries -> (match v_Vuna_dCompiler_dToml_dparseBareKey path cs with
  | C_Base_dResult_dErr (e) -> C_Base_dResult_dErr (e)
  | C_Base_dResult_dOk (C_Base_dPair_dPair (key, afterKey)) -> (match v_Vuna_dCompiler_dToml_dskipBlank afterKey with
  | C_Vuna_dCompiler_dToml_dTomlCursor (chars, line, col) -> (match chars with
  | [] -> v_Vuna_dCompiler_dToml_dfailAt path (v_Vuna_dCompiler_dToml_dcursorLine cs) "expected '=' after key"
  | (c) :: (rest) -> if v_vuna_ueq_uint c 61 then v_Vuna_dCompiler_dToml_dparseEntryValue path (C_Vuna_dCompiler_dToml_dTomlCursor (rest, line, bi_add col 1)) (v_Vuna_dCompiler_dToml_dcursorLine cs) key section seen entries else v_Vuna_dCompiler_dToml_dfailAt path (v_Vuna_dCompiler_dToml_dcursorLine cs) ((let vuna_cat0' = ("expected '=' after key \"") in (let vuna_cat1' = (key) in (let vuna_cat2' = ("\"") in String.concat "" [vuna_cat0'; vuna_cat1'; vuna_cat2']))))
  | _ -> vuna_fail "compiler/lib/Vuna/Compiler/Toml.vuna" 301 11 ("case pattern match failure"))
  | _ -> vuna_fail "compiler/lib/Vuna/Compiler/Toml.vuna" 299 7 ("case pattern match failure"))
  | _ -> vuna_fail "compiler/lib/Vuna/Compiler/Toml.vuna" 296 3 ("case pattern match failure"))
and v_Vuna_dCompiler_dToml_dparseSectionLine = fun path cs section seen entries -> (match v_Vuna_dCompiler_dToml_dparseSectionPath path (v_Vuna_dCompiler_dToml_dadvanceCursor cs) with
  | C_Base_dResult_dErr (e) -> C_Base_dResult_dErr (e)
  | C_Base_dResult_dOk (C_Base_dPair_dPair (newSection, afterHeader)) -> if v_Vuna_dCompiler_dToml_dmemSectionPath newSection seen then v_Vuna_dCompiler_dToml_dfailAt path (v_Vuna_dCompiler_dToml_dcursorLine cs) ((let vuna_cat0' = ("duplicate section [") in (let vuna_cat1' = (v_Vuna_dCompiler_dCommon_djoinDots newSection) in (let vuna_cat2' = ("]") in String.concat "" [vuna_cat0'; vuna_cat1'; vuna_cat2'])))) else (match v_Vuna_dCompiler_dToml_dexpectEol path afterHeader with
  | C_Base_dResult_dErr (e) -> C_Base_dResult_dErr (e)
  | C_Base_dResult_dOk (afterLine) -> v_Vuna_dCompiler_dToml_dparseTomlLoop path afterLine newSection ((newSection) :: (seen)) entries
  | _ -> vuna_fail "compiler/lib/Vuna/Compiler/Toml.vuna" 315 9 ("case pattern match failure"))
  | _ -> vuna_fail "compiler/lib/Vuna/Compiler/Toml.vuna" 309 3 ("case pattern match failure"))
and v_Vuna_dCompiler_dToml_dparseTomlLoop = fun path cs section seen entries -> v_Vuna_dCompiler_dToml_dparseTomlLoopAt path (v_Vuna_dCompiler_dToml_dskipGap cs) section seen entries
and v_Vuna_dCompiler_dToml_dparseTomlLoopAt = fun path cs section seen entries -> (match v_Vuna_dCompiler_dToml_dcursorChars cs with
  | [] -> C_Base_dResult_dOk (v_Base_dList_dreverse entries)
  | (c) :: (rest) -> if v_vuna_ueq_uint c 91 then v_Vuna_dCompiler_dToml_dparseSectionLine path cs section seen entries else v_Vuna_dCompiler_dToml_dparseKeyLine path cs section seen entries
  | _ -> vuna_fail "compiler/lib/Vuna/Compiler/Toml.vuna" 322 3 ("case pattern match failure"))

let v_Vuna_dCompiler_dToml_dparseTomlAt = fun path source -> v_Vuna_dCompiler_dToml_dparseTomlLoop path (C_Vuna_dCompiler_dToml_dTomlCursor (v_Vuna_dCompiler_dToml_dstripCR (bi_str_unpack source), 1, 1)) [] [] []

let v_Vuna_dCompiler_dToml_dparseToml = fun source -> v_Vuna_dCompiler_dToml_dparseTomlAt "" source

let rec v_Vuna_dCompiler_dToml_dlookupEntry = fun section key entries -> (match entries with
  | [] -> C_Base_dMaybe_dNothing
  | (C_Vuna_dCompiler_dToml_dTomlEntry (s, k, v, line)) :: (rest) -> if (if (v_Vuna_dCompiler_dToml_dsamePath section s) then (v_vuna_ueq_ustr k key) else false) then C_Base_dMaybe_dJust (v) else v_Vuna_dCompiler_dToml_dlookupEntry section key rest
  | _ -> vuna_fail "compiler/lib/Vuna/Compiler/Toml.vuna" 337 3 ("case pattern match failure"))

let rec v_Vuna_dCompiler_dToml_dlookupEntryLine = fun section key entries -> (match entries with
  | [] -> C_Base_dMaybe_dNothing
  | (C_Vuna_dCompiler_dToml_dTomlEntry (s, k, v, line)) :: (rest) -> if (if (v_Vuna_dCompiler_dToml_dsamePath section s) then (v_vuna_ueq_ustr k key) else false) then C_Base_dMaybe_dJust (line) else v_Vuna_dCompiler_dToml_dlookupEntryLine section key rest
  | _ -> vuna_fail "compiler/lib/Vuna/Compiler/Toml.vuna" 344 3 ("case pattern match failure"))

let v_vuna_ueq_uVuna_uCompiler_uToml_uTomlValue = fun x y -> (match x with
  | C_Vuna_dCompiler_dToml_dTStr (v0) -> (match y with
  | C_Vuna_dCompiler_dToml_dTStr (w0) -> v_vuna_ueq_ustr v0 w0
  | _ -> v_vuna_ueq_uint 0 1
  | _ -> vuna_fail "<generated>" 437 33 ("case pattern match failure"))
  | C_Vuna_dCompiler_dToml_dTInt (v0) -> (match y with
  | C_Vuna_dCompiler_dToml_dTInt (w0) -> v_vuna_ueq_uint v0 w0
  | _ -> v_vuna_ueq_uint 0 1
  | _ -> vuna_fail "<generated>" 440 33 ("case pattern match failure"))
  | C_Vuna_dCompiler_dToml_dTBool (v0) -> (match y with
  | C_Vuna_dCompiler_dToml_dTBool (w0) -> v_vuna_ueq_ubool v0 w0
  | _ -> v_vuna_ueq_uint 0 1
  | _ -> vuna_fail "<generated>" 443 34 ("case pattern match failure"))
  | C_Vuna_dCompiler_dToml_dTList (v0) -> (match y with
  | C_Vuna_dCompiler_dToml_dTList (w0) -> v_vuna_ueq_uBase_uList_uList v0 w0
  | _ -> v_vuna_ueq_uint 0 1
  | _ -> vuna_fail "<generated>" 446 34 ("case pattern match failure"))
  | _ -> v_vuna_ueq_uint 0 1
  | _ -> vuna_fail "<generated>" 436 44 ("case pattern match failure"))

let v_vuna_uneq_uVuna_uCompiler_uToml_uTomlValue = fun x y -> if v_vuna_ueq_uVuna_uCompiler_uToml_uTomlValue x y then v_vuna_ueq_uint 0 1 else v_vuna_ueq_uint 0 0

let v_vuna_ueq_uVuna_uCompiler_uToml_uTomlEntry = fun x y -> (match x with
  | C_Vuna_dCompiler_dToml_dTomlEntry (v0, v1, v2, v3) -> (match y with
  | C_Vuna_dCompiler_dToml_dTomlEntry (w0, w1, w2, w3) -> (if ((if ((if (v_vuna_ueq_uBase_uList_uList v0 w0) then (v_vuna_ueq_ustr v1 w1) else false)) then (v_vuna_ueq_uVuna_uCompiler_uToml_uTomlValue v2 w2) else false)) then (v_vuna_ueq_uint v3 w3) else false)
  | _ -> v_vuna_ueq_uint 0 1
  | _ -> vuna_fail "<generated>" 455 47 ("case pattern match failure"))
  | _ -> v_vuna_ueq_uint 0 1
  | _ -> vuna_fail "<generated>" 454 44 ("case pattern match failure"))

let v_vuna_uneq_uVuna_uCompiler_uToml_uTomlEntry = fun x y -> if v_vuna_ueq_uVuna_uCompiler_uToml_uTomlEntry x y then v_vuna_ueq_uint 0 1 else v_vuna_ueq_uint 0 0

let v_vuna_ueq_uVuna_uCompiler_uToml_uTomlCursor = fun x y -> (match x with
  | C_Vuna_dCompiler_dToml_dTomlCursor (v0, v1, v2) -> (match y with
  | C_Vuna_dCompiler_dToml_dTomlCursor (w0, w1, w2) -> (if ((if (v_vuna_ueq_uBase_uList_uList v0 w0) then (v_vuna_ueq_uint v1 w1) else false)) then (v_vuna_ueq_uint v2 w2) else false)
  | _ -> v_vuna_ueq_uint 0 1
  | _ -> vuna_fail "<generated>" 464 45 ("case pattern match failure"))
  | _ -> v_vuna_ueq_uint 0 1
  | _ -> vuna_fail "<generated>" 463 45 ("case pattern match failure"))

let v_vuna_uneq_uVuna_uCompiler_uToml_uTomlCursor = fun x y -> if v_vuna_ueq_uVuna_uCompiler_uToml_uTomlCursor x y then v_vuna_ueq_uint 0 1 else v_vuna_ueq_uint 0 0
