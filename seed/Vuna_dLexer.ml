open Vuna_runtime
open Vuna_dPair
open Vuna_dBool
open Vuna_dMonad
open Vuna_dMaybe
open Vuna_dList
open Vuna_dIO
open Vuna_dResult
open Vuna_dString
open Vuna_dBase
open Vuna_dToml
open Vuna_dManifest
open Vuna_dPkg
open Vuna_dAst
type   t_Vuna_dLexer_dTok =
    C_Vuna_dLexer_dTIdent of (string)
  | C_Vuna_dLexer_dTKw of (string)
  | C_Vuna_dLexer_dTInt of (int)
  | C_Vuna_dLexer_dTStr of (string)
  | C_Vuna_dLexer_dTSym of (string)
  | C_Vuna_dLexer_dTEof
and   t_Vuna_dLexer_dPTok =
    C_Vuna_dLexer_dPTok of (t_Vuna_dLexer_dTok) * (t_Vuna_dBase_dPos)
and   t_Vuna_dLexer_dChars =
    C_Vuna_dLexer_dChars of ((int) list) * (t_Vuna_dBase_dPos)
and   t_Vuna_dLexer_dCKind =
    C_Vuna_dLexer_dCLine
  | C_Vuna_dLexer_dCBlock
and   t_Vuna_dLexer_dComment =
    C_Vuna_dLexer_dComment of (t_Vuna_dLexer_dCKind) * (string) * (t_Vuna_dBase_dSpan)
let rec show_Vuna_dLexer_dTok v =
  match v with
  | C_Vuna_dLexer_dTIdent f0 -> show_ctor "TIdent" [(show_vstring) f0]
  | C_Vuna_dLexer_dTKw f0 -> show_ctor "TKw" [(show_vstring) f0]
  | C_Vuna_dLexer_dTInt f0 -> show_ctor "TInt" [(string_of_int) f0]
  | C_Vuna_dLexer_dTStr f0 -> show_ctor "TStr" [(show_vstring) f0]
  | C_Vuna_dLexer_dTSym f0 -> show_ctor "TSym" [(show_vstring) f0]
  | C_Vuna_dLexer_dTEof -> "TEof"
and show_Vuna_dLexer_dPTok v =
  match v with
  | C_Vuna_dLexer_dPTok (f0, f1) -> show_ctor "PTok" [(show_Vuna_dLexer_dTok) f0; (show_Vuna_dBase_dPos) f1]
and show_Vuna_dLexer_dChars v =
  match v with
  | C_Vuna_dLexer_dChars (f0, f1) -> show_ctor "Chars" [((fun v -> let rec go = function [] -> "Nil" | x :: xs -> "(Cons " ^ (string_of_int) x ^ " " ^ go xs ^ ")" in go v)) f0; (show_Vuna_dBase_dPos) f1]
and show_Vuna_dLexer_dCKind v =
  match v with
  | C_Vuna_dLexer_dCLine -> "CLine"
  | C_Vuna_dLexer_dCBlock -> "CBlock"
and show_Vuna_dLexer_dComment v =
  match v with
  | C_Vuna_dLexer_dComment (f0, f1, f2) -> show_ctor "Comment" [(show_Vuna_dLexer_dCKind) f0; (show_vstring) f1; (show_Vuna_dBase_dSpan) f2]
let v_Vuna_dLexer_dadvanceChar = fun a0 a1 -> match (a0, a1) with
  | (c, C_Vuna_dBase_dPos (line, col)) -> if v_vuna_ueq_uint c 10 then C_Vuna_dBase_dPos (bi_add line 1, 1) else C_Vuna_dBase_dPos (line, bi_add col 1)
  | _ -> vuna_fail "compiler/lib/Vuna/Lexer.vuna" 21 1 ("no matching clause for Vuna.Lexer.advanceChar")

let v_Vuna_dLexer_disUpperChar = fun c -> (if (v_vuna_uge_uint c 65) then (v_vuna_ule_uint c 90) else false)

let v_Vuna_dLexer_disLowerChar = fun c -> (if (v_vuna_uge_uint c 97) then (v_vuna_ule_uint c 122) else false)

let v_Vuna_dLexer_disIdentStart = fun c -> (if ((if (v_Vuna_dLexer_disUpperChar c) then true else (v_Vuna_dLexer_disLowerChar c))) then true else (v_vuna_ueq_uint c 95))

let v_Vuna_dLexer_disDigit = fun c -> (if (v_vuna_uge_uint c 48) then (v_vuna_ule_uint c 57) else false)

let v_Vuna_dLexer_disIdentChar = fun c -> (if ((if (v_Vuna_dLexer_disIdentStart c) then true else (v_Vuna_dLexer_disDigit c))) then true else (v_vuna_ueq_uint c 39))

let v_Vuna_dLexer_disSpace = fun c -> (if ((if ((if (v_vuna_ueq_uint c 32) then true else (v_vuna_ueq_uint c 9))) then true else (v_vuna_ueq_uint c 10))) then true else (v_vuna_ueq_uint c 13))

let v_Vuna_dLexer_disOpChar = fun c -> (if ((if ((if ((if ((if ((if ((if ((if ((if ((if ((if ((if ((if ((if ((if ((if ((if ((if (v_vuna_ueq_uint c 33) then true else (v_vuna_ueq_uint c 36))) then true else (v_vuna_ueq_uint c 37))) then true else (v_vuna_ueq_uint c 38))) then true else (v_vuna_ueq_uint c 42))) then true else (v_vuna_ueq_uint c 43))) then true else (v_vuna_ueq_uint c 45))) then true else (v_vuna_ueq_uint c 46))) then true else (v_vuna_ueq_uint c 47))) then true else (v_vuna_ueq_uint c 60))) then true else (v_vuna_ueq_uint c 61))) then true else (v_vuna_ueq_uint c 62))) then true else (v_vuna_ueq_uint c 63))) then true else (v_vuna_ueq_uint c 64))) then true else (v_vuna_ueq_uint c 92))) then true else (v_vuna_ueq_uint c 94))) then true else (v_vuna_ueq_uint c 124))) then true else (v_vuna_ueq_uint c 126))) then true else (v_vuna_ueq_uint c 58))

let v_Vuna_dLexer_disKeyword = fun s -> (if ((if ((if ((if ((if ((if ((if ((if ((if ((if ((if ((if ((if ((if ((if ((if ((if ((if (v_vuna_ueq_ustr s "data") then true else (v_vuna_ueq_ustr s "case"))) then true else (v_vuna_ueq_ustr s "of"))) then true else (v_vuna_ueq_ustr s "let"))) then true else (v_vuna_ueq_ustr s "in"))) then true else (v_vuna_ueq_ustr s "if"))) then true else (v_vuna_ueq_ustr s "then"))) then true else (v_vuna_ueq_ustr s "else"))) then true else (v_vuna_ueq_ustr s "where"))) then true else (v_vuna_ueq_ustr s "Type"))) then true else (v_vuna_ueq_ustr s "import"))) then true else (v_vuna_ueq_ustr s "module"))) then true else (v_vuna_ueq_ustr s "qualified"))) then true else (v_vuna_ueq_ustr s "as"))) then true else (v_vuna_ueq_ustr s "record"))) then true else (v_vuna_ueq_ustr s "trait"))) then true else (v_vuna_ueq_ustr s "instance"))) then true else (v_vuna_ueq_ustr s "deriving"))) then true else (v_vuna_ueq_ustr s "do"))

let v_Vuna_dLexer_dclassifyIdent = fun s -> if v_Vuna_dLexer_disKeyword s then C_Vuna_dLexer_dTKw (s) else C_Vuna_dLexer_dTIdent (s)

let rec v_Vuna_dLexer_dskipLineComment = fun a0 -> match a0 with
  | (C_Vuna_dLexer_dChars ([], p)) -> C_Vuna_dLexer_dChars ([], p)
  | (C_Vuna_dLexer_dChars ((c) :: (rest), p)) -> if v_vuna_ueq_uint c 10 then C_Vuna_dLexer_dChars ((c) :: (rest), p) else v_Vuna_dLexer_dskipLineComment (C_Vuna_dLexer_dChars (rest, v_Vuna_dLexer_dadvanceChar c p))
  | _ -> vuna_fail "compiler/lib/Vuna/Lexer.vuna" 50 1 ("no matching clause for Vuna.Lexer.skipLineComment")

let rec v_Vuna_dLexer_dskipBlockComment = fun depth cs -> (match cs with
  | C_Vuna_dLexer_dChars ([], p) -> C_Vuna_dResult_dErr ("unterminated block comment")
  | C_Vuna_dLexer_dChars ((c) :: (rest), p) -> (match rest with
  | (c2) :: (rest2) -> if (if (v_vuna_ueq_uint c 123) then (v_vuna_ueq_uint c2 45) else false) then v_Vuna_dLexer_dskipBlockComment (bi_add depth 1) (C_Vuna_dLexer_dChars (rest2, v_Vuna_dLexer_dadvanceChar c2 (v_Vuna_dLexer_dadvanceChar c p))) else if (if (v_vuna_ueq_uint c 45) then (v_vuna_ueq_uint c2 125) else false) then if v_vuna_ueq_uint depth 1 then C_Vuna_dResult_dOk (C_Vuna_dLexer_dChars (rest2, v_Vuna_dLexer_dadvanceChar c2 (v_Vuna_dLexer_dadvanceChar c p))) else v_Vuna_dLexer_dskipBlockComment (bi_sub depth 1) (C_Vuna_dLexer_dChars (rest2, v_Vuna_dLexer_dadvanceChar c2 (v_Vuna_dLexer_dadvanceChar c p))) else v_Vuna_dLexer_dskipBlockComment depth (C_Vuna_dLexer_dChars (rest, v_Vuna_dLexer_dadvanceChar c p))
  | [] -> v_Vuna_dLexer_dskipBlockComment depth (C_Vuna_dLexer_dChars (rest, v_Vuna_dLexer_dadvanceChar c p))
  | _ -> vuna_fail "compiler/lib/Vuna/Lexer.vuna" 59 7 ("case pattern match failure"))
  | _ -> vuna_fail "compiler/lib/Vuna/Lexer.vuna" 56 3 ("case pattern match failure"))

let rec v_Vuna_dLexer_dskipTrivia = fun cs -> (match cs with
  | C_Vuna_dLexer_dChars ([], p) -> C_Vuna_dResult_dOk (cs)
  | C_Vuna_dLexer_dChars ((c) :: (rest), p) -> if v_Vuna_dLexer_disSpace c then v_Vuna_dLexer_dskipTrivia (C_Vuna_dLexer_dChars (rest, v_Vuna_dLexer_dadvanceChar c p)) else (match rest with
  | (c2) :: (rest2) -> if (if (v_vuna_ueq_uint c 45) then (v_vuna_ueq_uint c2 45) else false) then v_Vuna_dLexer_dskipTrivia (v_Vuna_dLexer_dskipLineComment (C_Vuna_dLexer_dChars (rest, v_Vuna_dLexer_dadvanceChar c p))) else if (if (v_vuna_ueq_uint c 123) then (v_vuna_ueq_uint c2 45) else false) then (match v_Vuna_dLexer_dskipBlockComment 1 (C_Vuna_dLexer_dChars (rest, v_Vuna_dLexer_dadvanceChar c p)) with
  | C_Vuna_dResult_dErr (e) -> C_Vuna_dResult_dErr (e)
  | C_Vuna_dResult_dOk (cs2) -> v_Vuna_dLexer_dskipTrivia cs2
  | _ -> vuna_fail "compiler/lib/Vuna/Lexer.vuna" 80 15 ("case pattern match failure")) else C_Vuna_dResult_dOk (cs)
  | [] -> C_Vuna_dResult_dOk (cs)
  | _ -> vuna_fail "compiler/lib/Vuna/Lexer.vuna" 75 9 ("case pattern match failure"))
  | _ -> vuna_fail "compiler/lib/Vuna/Lexer.vuna" 70 3 ("case pattern match failure"))

let rec v_Vuna_dLexer_dcollectIdent = fun a0 a1 -> match (a0, a1) with
  | (C_Vuna_dLexer_dChars ([], p), acc) -> C_Vuna_dPair_dPair (bi_str_pack (v_Vuna_dList_dreverse acc), C_Vuna_dLexer_dChars ([], p))
  | (C_Vuna_dLexer_dChars ((c) :: (rest), p), acc) -> if v_Vuna_dLexer_disIdentChar c then v_Vuna_dLexer_dcollectIdent (C_Vuna_dLexer_dChars (rest, v_Vuna_dLexer_dadvanceChar c p)) ((c) :: (acc)) else if v_vuna_ueq_uint c 46 then (match rest with
  | (c2) :: (rest2) -> if v_Vuna_dLexer_disIdentStart c2 then v_Vuna_dLexer_dcollectIdent (C_Vuna_dLexer_dChars (rest, v_Vuna_dLexer_dadvanceChar c p)) ((c) :: (acc)) else C_Vuna_dPair_dPair (bi_str_pack (v_Vuna_dList_dreverse acc), C_Vuna_dLexer_dChars ((c) :: (rest), p))
  | [] -> C_Vuna_dPair_dPair (bi_str_pack (v_Vuna_dList_dreverse acc), C_Vuna_dLexer_dChars ((c) :: (rest), p))
  | _ -> vuna_fail "compiler/lib/Vuna/Lexer.vuna" 90 5 ("case pattern match failure")) else C_Vuna_dPair_dPair (bi_str_pack (v_Vuna_dList_dreverse acc), C_Vuna_dLexer_dChars ((c) :: (rest), p))
  | _ -> vuna_fail "compiler/lib/Vuna/Lexer.vuna" 86 1 ("no matching clause for Vuna.Lexer.collectIdent")

let rec v_Vuna_dLexer_dcollectInt = fun a0 a1 -> match (a0, a1) with
  | (C_Vuna_dLexer_dChars ([], p), acc) -> C_Vuna_dPair_dPair (acc, C_Vuna_dLexer_dChars ([], p))
  | (C_Vuna_dLexer_dChars ((c) :: (rest), p), acc) -> if v_Vuna_dLexer_disDigit c then v_Vuna_dLexer_dcollectInt (C_Vuna_dLexer_dChars (rest, v_Vuna_dLexer_dadvanceChar c p)) (bi_add (bi_mul acc 10) (bi_sub c 48)) else C_Vuna_dPair_dPair (acc, C_Vuna_dLexer_dChars ((c) :: (rest), p))
  | _ -> vuna_fail "compiler/lib/Vuna/Lexer.vuna" 98 1 ("no matching clause for Vuna.Lexer.collectInt")

let rec v_Vuna_dLexer_dcollectOp = fun a0 a1 -> match (a0, a1) with
  | (C_Vuna_dLexer_dChars ([], p), acc) -> C_Vuna_dPair_dPair (bi_str_pack (v_Vuna_dList_dreverse acc), C_Vuna_dLexer_dChars ([], p))
  | (C_Vuna_dLexer_dChars ((c) :: (rest), p), acc) -> if v_Vuna_dLexer_disOpChar c then v_Vuna_dLexer_dcollectOp (C_Vuna_dLexer_dChars (rest, v_Vuna_dLexer_dadvanceChar c p)) ((c) :: (acc)) else C_Vuna_dPair_dPair (bi_str_pack (v_Vuna_dList_dreverse acc), C_Vuna_dLexer_dChars ((c) :: (rest), p))
  | _ -> vuna_fail "compiler/lib/Vuna/Lexer.vuna" 103 1 ("no matching clause for Vuna.Lexer.collectOp")

let rec v_Vuna_dLexer_dscanString = fun a0 a1 -> match (a0, a1) with
  | (C_Vuna_dLexer_dChars ([], p), acc) -> C_Vuna_dResult_dErr ("unterminated string literal")
  | (C_Vuna_dLexer_dChars ((c) :: (rest), p), acc) -> if v_vuna_ueq_uint c 34 then C_Vuna_dResult_dOk (C_Vuna_dPair_dPair (bi_str_pack (v_Vuna_dList_dreverse acc), C_Vuna_dLexer_dChars (rest, v_Vuna_dLexer_dadvanceChar c p))) else if v_vuna_ueq_uint c 10 then C_Vuna_dResult_dErr ("unterminated string literal") else if v_vuna_ueq_uint c 92 then v_Vuna_dLexer_dscanEscape (C_Vuna_dLexer_dChars (rest, v_Vuna_dLexer_dadvanceChar c p)) acc else v_Vuna_dLexer_dscanString (C_Vuna_dLexer_dChars (rest, v_Vuna_dLexer_dadvanceChar c p)) ((c) :: (acc))
  | _ -> vuna_fail "compiler/lib/Vuna/Lexer.vuna" 108 1 ("no matching clause for Vuna.Lexer.scanString")
and v_Vuna_dLexer_dscanEscape = fun a0 a1 -> match (a0, a1) with
  | (C_Vuna_dLexer_dChars ([], p), acc) -> C_Vuna_dResult_dErr ("unterminated string literal")
  | (C_Vuna_dLexer_dChars ((c) :: (rest), p), acc) -> if v_vuna_ueq_uint c 110 then v_Vuna_dLexer_dscanString (C_Vuna_dLexer_dChars (rest, v_Vuna_dLexer_dadvanceChar c p)) ((10) :: (acc)) else if v_vuna_ueq_uint c 116 then v_Vuna_dLexer_dscanString (C_Vuna_dLexer_dChars (rest, v_Vuna_dLexer_dadvanceChar c p)) ((9) :: (acc)) else if v_vuna_ueq_uint c 114 then v_Vuna_dLexer_dscanString (C_Vuna_dLexer_dChars (rest, v_Vuna_dLexer_dadvanceChar c p)) ((13) :: (acc)) else if v_vuna_ueq_uint c 34 then v_Vuna_dLexer_dscanString (C_Vuna_dLexer_dChars (rest, v_Vuna_dLexer_dadvanceChar c p)) ((34) :: (acc)) else if v_vuna_ueq_uint c 92 then v_Vuna_dLexer_dscanString (C_Vuna_dLexer_dChars (rest, v_Vuna_dLexer_dadvanceChar c p)) ((92) :: (acc)) else if v_vuna_ueq_uint c 39 then v_Vuna_dLexer_dscanString (C_Vuna_dLexer_dChars (rest, v_Vuna_dLexer_dadvanceChar c p)) ((39) :: (acc)) else C_Vuna_dResult_dErr ("unknown escape sequence")
  | _ -> vuna_fail "compiler/lib/Vuna/Lexer.vuna" 115 1 ("no matching clause for Vuna.Lexer.scanEscape")

let rec v_Vuna_dLexer_dlexChars = fun cs -> (match v_Vuna_dLexer_dskipTrivia cs with
  | C_Vuna_dResult_dErr (e) -> C_Vuna_dResult_dErr (e)
  | C_Vuna_dResult_dOk (cs2) -> (match cs2 with
  | C_Vuna_dLexer_dChars ([], p) -> C_Vuna_dResult_dOk ((C_Vuna_dLexer_dPTok (C_Vuna_dLexer_dTEof, p)) :: ([]))
  | C_Vuna_dLexer_dChars ((c) :: (rest), p) -> v_Vuna_dLexer_dlexToken c rest p
  | _ -> vuna_fail "compiler/lib/Vuna/Lexer.vuna" 129 7 ("case pattern match failure"))
  | _ -> vuna_fail "compiler/lib/Vuna/Lexer.vuna" 126 3 ("case pattern match failure"))
and v_Vuna_dLexer_dlexToken = fun c rest p -> if v_Vuna_dLexer_disIdentStart c then (match v_Vuna_dLexer_dcollectIdent (C_Vuna_dLexer_dChars (rest, v_Vuna_dLexer_dadvanceChar c p)) ((c) :: ([])) with
  | C_Vuna_dPair_dPair (name, cs2) -> (match v_Vuna_dLexer_dlexChars cs2 with
  | C_Vuna_dResult_dErr (e) -> C_Vuna_dResult_dErr (e)
  | C_Vuna_dResult_dOk (toks) -> C_Vuna_dResult_dOk ((C_Vuna_dLexer_dPTok (v_Vuna_dLexer_dclassifyIdent name, p)) :: (toks))
  | _ -> vuna_fail "compiler/lib/Vuna/Lexer.vuna" 137 9 ("case pattern match failure"))
  | _ -> vuna_fail "compiler/lib/Vuna/Lexer.vuna" 135 5 ("case pattern match failure")) else if v_Vuna_dLexer_disDigit c then (match v_Vuna_dLexer_dcollectInt (C_Vuna_dLexer_dChars (rest, v_Vuna_dLexer_dadvanceChar c p)) (bi_sub c 48) with
  | C_Vuna_dPair_dPair (n, cs2) -> (match v_Vuna_dLexer_dlexChars cs2 with
  | C_Vuna_dResult_dErr (e) -> C_Vuna_dResult_dErr (e)
  | C_Vuna_dResult_dOk (toks) -> C_Vuna_dResult_dOk ((C_Vuna_dLexer_dPTok (C_Vuna_dLexer_dTInt (n), p)) :: (toks))
  | _ -> vuna_fail "compiler/lib/Vuna/Lexer.vuna" 143 9 ("case pattern match failure"))
  | _ -> vuna_fail "compiler/lib/Vuna/Lexer.vuna" 141 5 ("case pattern match failure")) else if v_vuna_ueq_uint c 34 then (match v_Vuna_dLexer_dscanString (C_Vuna_dLexer_dChars (rest, v_Vuna_dLexer_dadvanceChar c p)) [] with
  | C_Vuna_dResult_dErr (e) -> C_Vuna_dResult_dErr (e)
  | C_Vuna_dResult_dOk (C_Vuna_dPair_dPair (s, cs2)) -> (match v_Vuna_dLexer_dlexChars cs2 with
  | C_Vuna_dResult_dErr (e) -> C_Vuna_dResult_dErr (e)
  | C_Vuna_dResult_dOk (toks) -> C_Vuna_dResult_dOk ((C_Vuna_dLexer_dPTok (C_Vuna_dLexer_dTStr (s), p)) :: (toks))
  | _ -> vuna_fail "compiler/lib/Vuna/Lexer.vuna" 150 9 ("case pattern match failure"))
  | _ -> vuna_fail "compiler/lib/Vuna/Lexer.vuna" 147 5 ("case pattern match failure")) else if (if ((if ((if ((if ((if ((if (v_vuna_ueq_uint c 40) then true else (v_vuna_ueq_uint c 41))) then true else (v_vuna_ueq_uint c 91))) then true else (v_vuna_ueq_uint c 93))) then true else (v_vuna_ueq_uint c 44))) then true else (v_vuna_ueq_uint c 123))) then true else (v_vuna_ueq_uint c 125)) then (match v_Vuna_dLexer_dlexChars (C_Vuna_dLexer_dChars (rest, v_Vuna_dLexer_dadvanceChar c p)) with
  | C_Vuna_dResult_dErr (e) -> C_Vuna_dResult_dErr (e)
  | C_Vuna_dResult_dOk (toks) -> C_Vuna_dResult_dOk ((C_Vuna_dLexer_dPTok (C_Vuna_dLexer_dTSym (bi_str_pack ((c) :: ([]))), p)) :: (toks))
  | _ -> vuna_fail "compiler/lib/Vuna/Lexer.vuna" 154 5 ("case pattern match failure")) else if v_Vuna_dLexer_disOpChar c then (match v_Vuna_dLexer_dcollectOp (C_Vuna_dLexer_dChars (rest, v_Vuna_dLexer_dadvanceChar c p)) ((c) :: ([])) with
  | C_Vuna_dPair_dPair (op, cs2) -> (match v_Vuna_dLexer_dlexChars cs2 with
  | C_Vuna_dResult_dErr (e) -> C_Vuna_dResult_dErr (e)
  | C_Vuna_dResult_dOk (toks) -> C_Vuna_dResult_dOk ((C_Vuna_dLexer_dPTok (C_Vuna_dLexer_dTSym (op), p)) :: (toks))
  | _ -> vuna_fail "compiler/lib/Vuna/Lexer.vuna" 160 9 ("case pattern match failure"))
  | _ -> vuna_fail "compiler/lib/Vuna/Lexer.vuna" 158 5 ("case pattern match failure")) else C_Vuna_dResult_dErr ("unexpected character")

let v_Vuna_dLexer_dlexSource = fun source -> v_Vuna_dLexer_dlexChars (C_Vuna_dLexer_dChars (bi_str_unpack source, C_Vuna_dBase_dPos (1, 1)))

let v_Vuna_dLexer_dcommentKind = fun a0 -> match a0 with
  | (C_Vuna_dLexer_dComment (kind, text, sp)) -> kind
  | _ -> vuna_fail "compiler/lib/Vuna/Lexer.vuna" 180 1 ("no matching clause for Vuna.Lexer.commentKind")

let v_Vuna_dLexer_dcommentText = fun a0 -> match a0 with
  | (C_Vuna_dLexer_dComment (kind, text, sp)) -> text
  | _ -> vuna_fail "compiler/lib/Vuna/Lexer.vuna" 182 1 ("no matching clause for Vuna.Lexer.commentText")

let v_Vuna_dLexer_dcommentSpan = fun a0 -> match a0 with
  | (C_Vuna_dLexer_dComment (kind, text, sp)) -> sp
  | _ -> vuna_fail "compiler/lib/Vuna/Lexer.vuna" 184 1 ("no matching clause for Vuna.Lexer.commentSpan")

let rec v_Vuna_dLexer_ddropTrailingSpace = fun a0 -> match a0 with
  | ([]) -> []
  | ((c) :: (rest)) -> if (if ((if (v_vuna_ueq_uint c 32) then true else (v_vuna_ueq_uint c 9))) then true else (v_vuna_ueq_uint c 13)) then v_Vuna_dLexer_ddropTrailingSpace rest else (c) :: (rest)
  | _ -> vuna_fail "compiler/lib/Vuna/Lexer.vuna" 188 1 ("no matching clause for Vuna.Lexer.dropTrailingSpace")

let v_Vuna_dLexer_dtrimTrailingSpace = fun s -> bi_str_pack (v_Vuna_dList_dreverse (v_Vuna_dLexer_ddropTrailingSpace (v_Vuna_dList_dreverse (bi_str_unpack s))))

let rec v_Vuna_dLexer_dskipStringBody = fun a0 -> match a0 with
  | (C_Vuna_dLexer_dChars ([], p)) -> C_Vuna_dResult_dErr ("unterminated string literal")
  | (C_Vuna_dLexer_dChars ((c) :: (rest), p)) -> if v_vuna_ueq_uint c 34 then C_Vuna_dResult_dOk (C_Vuna_dLexer_dChars (rest, v_Vuna_dLexer_dadvanceChar c p)) else if v_vuna_ueq_uint c 92 then (match rest with
  | (c2) :: (rest2) -> v_Vuna_dLexer_dskipStringBody (C_Vuna_dLexer_dChars (rest2, v_Vuna_dLexer_dadvanceChar c2 (v_Vuna_dLexer_dadvanceChar c p)))
  | [] -> C_Vuna_dResult_dErr ("unterminated string literal")
  | _ -> vuna_fail "compiler/lib/Vuna/Lexer.vuna" 199 5 ("case pattern match failure")) else v_Vuna_dLexer_dskipStringBody (C_Vuna_dLexer_dChars (rest, v_Vuna_dLexer_dadvanceChar c p))
  | _ -> vuna_fail "compiler/lib/Vuna/Lexer.vuna" 194 1 ("no matching clause for Vuna.Lexer.skipStringBody")

let rec v_Vuna_dLexer_dcollectLineBody = fun a0 a1 a2 -> match (a0, a1, a2) with
  | (C_Vuna_dLexer_dChars ([], p), acc, endP) -> C_Vuna_dPair_dPair (bi_str_pack (v_Vuna_dList_dreverse acc), C_Vuna_dPair_dPair (C_Vuna_dLexer_dChars ([], p), endP))
  | (C_Vuna_dLexer_dChars ((c) :: (rest), p), acc, endP) -> if v_vuna_ueq_uint c 10 then C_Vuna_dPair_dPair (bi_str_pack (v_Vuna_dList_dreverse acc), C_Vuna_dPair_dPair (C_Vuna_dLexer_dChars ((c) :: (rest), p), endP)) else v_Vuna_dLexer_dcollectLineBody (C_Vuna_dLexer_dChars (rest, v_Vuna_dLexer_dadvanceChar c p)) ((c) :: (acc)) p
  | _ -> vuna_fail "compiler/lib/Vuna/Lexer.vuna" 205 1 ("no matching clause for Vuna.Lexer.collectLineBody")

let rec v_Vuna_dLexer_dcollectBlockBody = fun a0 a1 a2 a3 -> match (a0, a1, a2, a3) with
  | (C_Vuna_dLexer_dChars ([], p), depth, acc, endP) -> C_Vuna_dResult_dErr ("unterminated block comment")
  | (C_Vuna_dLexer_dChars ((c) :: (rest), p), depth, acc, endP) -> (match rest with
  | (c2) :: (rest2) -> if (if (v_vuna_ueq_uint c 123) then (v_vuna_ueq_uint c2 45) else false) then v_Vuna_dLexer_dcollectBlockBody (C_Vuna_dLexer_dChars (rest2, v_Vuna_dLexer_dadvanceChar c2 (v_Vuna_dLexer_dadvanceChar c p))) (bi_add depth 1) ((c2) :: ((c) :: (acc))) (v_Vuna_dLexer_dadvanceChar c2 p) else if (if (v_vuna_ueq_uint c 45) then (v_vuna_ueq_uint c2 125) else false) then if v_vuna_ueq_uint depth 1 then C_Vuna_dResult_dOk (C_Vuna_dPair_dPair (bi_str_pack (v_Vuna_dList_dreverse acc), C_Vuna_dPair_dPair (C_Vuna_dLexer_dChars (rest2, v_Vuna_dLexer_dadvanceChar c2 (v_Vuna_dLexer_dadvanceChar c p)), v_Vuna_dLexer_dadvanceChar c2 p))) else v_Vuna_dLexer_dcollectBlockBody (C_Vuna_dLexer_dChars (rest2, v_Vuna_dLexer_dadvanceChar c2 (v_Vuna_dLexer_dadvanceChar c p))) (bi_sub depth 1) ((c2) :: ((c) :: (acc))) (v_Vuna_dLexer_dadvanceChar c2 p) else v_Vuna_dLexer_dcollectBlockBody (C_Vuna_dLexer_dChars (rest, v_Vuna_dLexer_dadvanceChar c p)) depth ((c) :: (acc)) p
  | [] -> v_Vuna_dLexer_dcollectBlockBody (C_Vuna_dLexer_dChars (rest, v_Vuna_dLexer_dadvanceChar c p)) depth ((c) :: (acc)) p
  | _ -> vuna_fail "compiler/lib/Vuna/Lexer.vuna" 215 3 ("case pattern match failure"))
  | _ -> vuna_fail "compiler/lib/Vuna/Lexer.vuna" 212 1 ("no matching clause for Vuna.Lexer.collectBlockBody")

let v_Vuna_dLexer_dcommentSpanOf = fun startP endP -> C_Vuna_dBase_dSpan ("", v_Vuna_dBase_dposLine startP, v_Vuna_dBase_dposCol startP, v_Vuna_dBase_dposLine endP, v_Vuna_dBase_dposCol endP)

let rec v_Vuna_dLexer_dscanComments = fun a0 a1 -> match (a0, a1) with
  | (C_Vuna_dLexer_dChars ([], p), acc) -> C_Vuna_dResult_dOk (v_Vuna_dList_dreverse acc)
  | (C_Vuna_dLexer_dChars ((c) :: (rest), p), acc) -> if v_vuna_ueq_uint c 34 then (match v_Vuna_dLexer_dskipStringBody (C_Vuna_dLexer_dChars (rest, v_Vuna_dLexer_dadvanceChar c p)) with
  | C_Vuna_dResult_dErr (e) -> C_Vuna_dResult_dErr (e)
  | C_Vuna_dResult_dOk (cs2) -> v_Vuna_dLexer_dscanComments cs2 acc
  | _ -> vuna_fail "compiler/lib/Vuna/Lexer.vuna" 233 5 ("case pattern match failure")) else (match rest with
  | (c2) :: (rest2) -> if (if (v_vuna_ueq_uint c 45) then (v_vuna_ueq_uint c2 45) else false) then (match v_Vuna_dLexer_dcollectLineBody (C_Vuna_dLexer_dChars (rest2, v_Vuna_dLexer_dadvanceChar c2 (v_Vuna_dLexer_dadvanceChar c p))) [] (v_Vuna_dLexer_dadvanceChar c2 p) with
  | C_Vuna_dPair_dPair (text, C_Vuna_dPair_dPair (cs2, endP)) -> v_Vuna_dLexer_dscanComments cs2 ((C_Vuna_dLexer_dComment (C_Vuna_dLexer_dCLine, v_Vuna_dLexer_dtrimTrailingSpace text, v_Vuna_dLexer_dcommentSpanOf p endP)) :: (acc))
  | _ -> vuna_fail "compiler/lib/Vuna/Lexer.vuna" 240 11 ("case pattern match failure")) else if (if (v_vuna_ueq_uint c 123) then (v_vuna_ueq_uint c2 45) else false) then (match v_Vuna_dLexer_dcollectBlockBody (C_Vuna_dLexer_dChars (rest2, v_Vuna_dLexer_dadvanceChar c2 (v_Vuna_dLexer_dadvanceChar c p))) 1 [] (v_Vuna_dLexer_dadvanceChar c2 p) with
  | C_Vuna_dResult_dErr (e) -> C_Vuna_dResult_dErr (e)
  | C_Vuna_dResult_dOk (C_Vuna_dPair_dPair (text, C_Vuna_dPair_dPair (cs2, endP))) -> v_Vuna_dLexer_dscanComments cs2 ((C_Vuna_dLexer_dComment (C_Vuna_dLexer_dCBlock, text, v_Vuna_dLexer_dcommentSpanOf p endP)) :: (acc))
  | _ -> vuna_fail "compiler/lib/Vuna/Lexer.vuna" 244 11 ("case pattern match failure")) else v_Vuna_dLexer_dscanComments (C_Vuna_dLexer_dChars (rest, v_Vuna_dLexer_dadvanceChar c p)) acc
  | [] -> C_Vuna_dResult_dOk (v_Vuna_dList_dreverse acc)
  | _ -> vuna_fail "compiler/lib/Vuna/Lexer.vuna" 237 5 ("case pattern match failure"))
  | _ -> vuna_fail "compiler/lib/Vuna/Lexer.vuna" 229 1 ("no matching clause for Vuna.Lexer.scanComments")

let v_Vuna_dLexer_dlexComments = fun source -> v_Vuna_dLexer_dscanComments (C_Vuna_dLexer_dChars (bi_str_unpack source, C_Vuna_dBase_dPos (1, 1))) []

let v_vuna_ushow_uVuna_uLexer_uTok = fun x -> (match x with
  | C_Vuna_dLexer_dTIdent (v0) -> (let vuna_cat0' = ("(TIdent ") in (let vuna_cat1' = (v_vuna_ushow_ustring v0) in (let vuna_cat2' = (")") in String.concat "" [vuna_cat0'; vuna_cat1'; vuna_cat2'])))
  | C_Vuna_dLexer_dTKw (v0) -> (let vuna_cat0' = ("(TKw ") in (let vuna_cat1' = (v_vuna_ushow_ustring v0) in (let vuna_cat2' = (")") in String.concat "" [vuna_cat0'; vuna_cat1'; vuna_cat2'])))
  | C_Vuna_dLexer_dTInt (v0) -> (let vuna_cat0' = ("(TInt ") in (let vuna_cat1' = (v_vuna_ushow_uint v0) in (let vuna_cat2' = (")") in String.concat "" [vuna_cat0'; vuna_cat1'; vuna_cat2'])))
  | C_Vuna_dLexer_dTStr (v0) -> (let vuna_cat0' = ("(TStr ") in (let vuna_cat1' = (v_vuna_ushow_ustring v0) in (let vuna_cat2' = (")") in String.concat "" [vuna_cat0'; vuna_cat1'; vuna_cat2'])))
  | C_Vuna_dLexer_dTSym (v0) -> (let vuna_cat0' = ("(TSym ") in (let vuna_cat1' = (v_vuna_ushow_ustring v0) in (let vuna_cat2' = (")") in String.concat "" [vuna_cat0'; vuna_cat1'; vuna_cat2'])))
  | C_Vuna_dLexer_dTEof -> "TEof"
  | _ -> vuna_fail "<generated>" 177 30 ("case pattern match failure"))

let v_vuna_ueq_uVuna_uLexer_uTok = fun x y -> (match x with
  | C_Vuna_dLexer_dTIdent (v0) -> (match y with
  | C_Vuna_dLexer_dTIdent (w0) -> v_vuna_ueq_ustr v0 w0
  | _ -> v_vuna_ueq_uint 0 1
  | _ -> vuna_fail "<generated>" 187 27 ("case pattern match failure"))
  | C_Vuna_dLexer_dTKw (v0) -> (match y with
  | C_Vuna_dLexer_dTKw (w0) -> v_vuna_ueq_ustr v0 w0
  | _ -> v_vuna_ueq_uint 0 1
  | _ -> vuna_fail "<generated>" 190 24 ("case pattern match failure"))
  | C_Vuna_dLexer_dTInt (v0) -> (match y with
  | C_Vuna_dLexer_dTInt (w0) -> v_vuna_ueq_uint v0 w0
  | _ -> v_vuna_ueq_uint 0 1
  | _ -> vuna_fail "<generated>" 193 25 ("case pattern match failure"))
  | C_Vuna_dLexer_dTStr (v0) -> (match y with
  | C_Vuna_dLexer_dTStr (w0) -> v_vuna_ueq_ustr v0 w0
  | _ -> v_vuna_ueq_uint 0 1
  | _ -> vuna_fail "<generated>" 196 25 ("case pattern match failure"))
  | C_Vuna_dLexer_dTSym (v0) -> (match y with
  | C_Vuna_dLexer_dTSym (w0) -> v_vuna_ueq_ustr v0 w0
  | _ -> v_vuna_ueq_uint 0 1
  | _ -> vuna_fail "<generated>" 199 25 ("case pattern match failure"))
  | C_Vuna_dLexer_dTEof -> (match y with
  | C_Vuna_dLexer_dTEof -> v_vuna_ueq_uint 0 0
  | _ -> v_vuna_ueq_uint 0 1
  | _ -> vuna_fail "<generated>" 202 22 ("case pattern match failure"))
  | _ -> v_vuna_ueq_uint 0 1
  | _ -> vuna_fail "<generated>" 186 30 ("case pattern match failure"))

let v_vuna_uneq_uVuna_uLexer_uTok = fun x y -> if v_vuna_ueq_uVuna_uLexer_uTok x y then v_vuna_ueq_uint 0 1 else v_vuna_ueq_uint 0 0

let v_vuna_ushow_uVuna_uLexer_uPTok = fun x -> (match x with
  | C_Vuna_dLexer_dPTok (v0, v1) -> (let vuna_cat0' = ("(PTok ") in (let vuna_cat1' = (v_vuna_ushow_uVuna_uLexer_uTok v0) in (let vuna_cat2' = (" ") in (let vuna_cat3' = (v_vuna_ushow_uVuna_uBase_uPos v1) in (let vuna_cat4' = (")") in String.concat "" [vuna_cat0'; vuna_cat1'; vuna_cat2'; vuna_cat3'; vuna_cat4'])))))
  | _ -> vuna_fail "<generated>" 210 31 ("case pattern match failure"))

let v_vuna_ueq_uVuna_uLexer_uPTok = fun x y -> (match x with
  | C_Vuna_dLexer_dPTok (v0, v1) -> (match y with
  | C_Vuna_dLexer_dPTok (w0, w1) -> (if (v_vuna_ueq_uVuna_uLexer_uTok v0 w0) then (v_vuna_ueq_uVuna_uBase_uPos v1 w1) else false)
  | _ -> v_vuna_ueq_uint 0 1
  | _ -> vuna_fail "<generated>" 215 28 ("case pattern match failure"))
  | _ -> v_vuna_ueq_uint 0 1
  | _ -> vuna_fail "<generated>" 214 31 ("case pattern match failure"))

let v_vuna_uneq_uVuna_uLexer_uPTok = fun x y -> if v_vuna_ueq_uVuna_uLexer_uPTok x y then v_vuna_ueq_uint 0 1 else v_vuna_ueq_uint 0 0

let v_vuna_ueq_uVuna_uLexer_uChars = fun x y -> (match x with
  | C_Vuna_dLexer_dChars (v0, v1) -> (match y with
  | C_Vuna_dLexer_dChars (w0, w1) -> (if (v_vuna_ueq_uVuna_uList_uList v0 w0) then (v_vuna_ueq_uVuna_uBase_uPos v1 w1) else false)
  | _ -> v_vuna_ueq_uint 0 1
  | _ -> vuna_fail "<generated>" 224 29 ("case pattern match failure"))
  | _ -> v_vuna_ueq_uint 0 1
  | _ -> vuna_fail "<generated>" 223 32 ("case pattern match failure"))

let v_vuna_uneq_uVuna_uLexer_uChars = fun x y -> if v_vuna_ueq_uVuna_uLexer_uChars x y then v_vuna_ueq_uint 0 1 else v_vuna_ueq_uint 0 0

let v_vuna_ushow_uVuna_uLexer_uCKind = fun x -> (match x with
  | C_Vuna_dLexer_dCLine -> "CLine"
  | C_Vuna_dLexer_dCBlock -> "CBlock"
  | _ -> vuna_fail "<generated>" 232 32 ("case pattern match failure"))

let v_vuna_ueq_uVuna_uLexer_uCKind = fun x y -> (match x with
  | C_Vuna_dLexer_dCLine -> (match y with
  | C_Vuna_dLexer_dCLine -> v_vuna_ueq_uint 0 0
  | _ -> v_vuna_ueq_uint 0 1
  | _ -> vuna_fail "<generated>" 238 23 ("case pattern match failure"))
  | C_Vuna_dLexer_dCBlock -> (match y with
  | C_Vuna_dLexer_dCBlock -> v_vuna_ueq_uint 0 0
  | _ -> v_vuna_ueq_uint 0 1
  | _ -> vuna_fail "<generated>" 241 24 ("case pattern match failure"))
  | _ -> v_vuna_ueq_uint 0 1
  | _ -> vuna_fail "<generated>" 237 32 ("case pattern match failure"))

let v_vuna_uneq_uVuna_uLexer_uCKind = fun x y -> if v_vuna_ueq_uVuna_uLexer_uCKind x y then v_vuna_ueq_uint 0 1 else v_vuna_ueq_uint 0 0

let v_vuna_ushow_uVuna_uLexer_uComment = fun x -> (match x with
  | C_Vuna_dLexer_dComment (v0, v1, v2) -> (let vuna_cat0' = ("(Comment ") in (let vuna_cat1' = (v_vuna_ushow_uVuna_uLexer_uCKind v0) in (let vuna_cat2' = (" ") in (let vuna_cat3' = (v_vuna_ushow_ustring v1) in (let vuna_cat4' = (" ") in (let vuna_cat5' = (v_vuna_ushow_uVuna_uBase_uSpan v2) in (let vuna_cat6' = (")") in String.concat "" [vuna_cat0'; vuna_cat1'; vuna_cat2'; vuna_cat3'; vuna_cat4'; vuna_cat5'; vuna_cat6'])))))))
  | _ -> vuna_fail "<generated>" 249 34 ("case pattern match failure"))

let v_vuna_ueq_uVuna_uLexer_uComment = fun x y -> (match x with
  | C_Vuna_dLexer_dComment (v0, v1, v2) -> (match y with
  | C_Vuna_dLexer_dComment (w0, w1, w2) -> (if ((if (v_vuna_ueq_uVuna_uLexer_uCKind v0 w0) then (v_vuna_ueq_ustr v1 w1) else false)) then (v_vuna_ueq_uVuna_uBase_uSpan v2 w2) else false)
  | _ -> v_vuna_ueq_uint 0 1
  | _ -> vuna_fail "<generated>" 254 34 ("case pattern match failure"))
  | _ -> v_vuna_ueq_uint 0 1
  | _ -> vuna_fail "<generated>" 253 34 ("case pattern match failure"))

let v_vuna_uneq_uVuna_uLexer_uComment = fun x y -> if v_vuna_ueq_uVuna_uLexer_uComment x y then v_vuna_ueq_uint 0 1 else v_vuna_ueq_uint 0 0
