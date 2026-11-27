open Vuna_runtime
type t_TmplPart = C_TmplPart_TPText of (string) | C_TmplPart_TPHole of (t_PTok B_dData_dList.t_List)
and t_Tok = C_Tok_TIdent of (string) | C_Tok_TKw of (string) | C_Tok_TInt of (int) | C_Tok_TStr of (string) | C_Tok_TTmpl of (bool) * (t_TmplPart B_dData_dList.t_List) * (Base_dSource.t_Pos) | C_Tok_TSym of (string) | C_Tok_TEof | C_Tok_TFloat of (string)
and t_PTok = { f_PTok_ptokTok : t_Tok; f_PTok_ptokPos : Base_dSource.t_Pos }
and t_Chars = { f_Chars_charsSource : string; f_Chars_charsOffset : int; f_Chars_charsPos : Base_dSource.t_Pos }
and t_CKind = C_CKind_CLine | C_CKind_CBlock
and t_Comment = { f_Comment_commentKind : t_CKind; f_Comment_commentText : string; f_Comment_commentSpan : Base_dSource.t_Span }

# 52 "Vuna/Compiler/Frontend/Lexer.vuna"
let v_charsEmpty = (fun (dtb_u_u1 : t_Chars) -> ((dtb_u_u1).f_Chars_charsOffset >= (String.length (dtb_u_u1).f_Chars_charsSource)))

# 55 "Vuna/Compiler/Frontend/Lexer.vuna"
let v_charsPeek = (fun (dtb_u_u2 : t_Chars) -> (let b = (dtb_u_u2).f_Chars_charsSource in let k = (dtb_u_u2).f_Chars_charsOffset in if k < 0 || k >= String.length b then -1 else Char.code (String.unsafe_get b k)))

# 58 "Vuna/Compiler/Frontend/Lexer.vuna"
let v_charsPeekAt = (fun (dtb_u_u3 : int) (dtb_u_u4 : t_Chars) -> (let b = (dtb_u_u4).f_Chars_charsSource in let k = ((dtb_u_u4).f_Chars_charsOffset + dtb_u_u3) in if k < 0 || k >= String.length b then -1 else Char.code (String.unsafe_get b k)))

# 84 "Vuna/Compiler/Frontend/Lexer.vuna"
let v_posWithEnd = (fun (dtb_u_u5 : Base_dSource.t_Pos) (dtb_u_u6 : int) -> { Base_dSource.f_Pos_posLine = (Base_dSource.v_posLine dtb_u_u5); Base_dSource.f_Pos_posCol = (Base_dSource.v_posCol dtb_u_u5); Base_dSource.f_Pos_posOffset = (Base_dSource.v_posOffset dtb_u_u5); Base_dSource.f_Pos_posEndOffset = dtb_u_u6 })

# 87 "Vuna/Compiler/Frontend/Lexer.vuna"
let v_lexSpanAt = (fun (dtb_u_u7 : Base_dSource.t_Pos) -> (match dtb_u_u7 with
  | { Base_dSource.f_Pos_posLine = dtb_u_u8; Base_dSource.f_Pos_posCol = dtb_u_u9; Base_dSource.f_Pos_posOffset = dtb_u_u10; Base_dSource.f_Pos_posEndOffset = dtb_u_u11 } -> { Base_dSource.f_Span_spanFile = ""; Base_dSource.f_Span_spanStartLine = dtb_u_u8; Base_dSource.f_Span_spanStartCol = dtb_u_u9; Base_dSource.f_Span_spanEndLine = dtb_u_u8; Base_dSource.f_Span_spanEndCol = dtb_u_u9; Base_dSource.f_Span_spanStartOffset = dtb_u_u10; Base_dSource.f_Span_spanEndOffset = dtb_u_u10 }
  | _ -> failwith "DT: impossible branch"
))

# 90 "Vuna/Compiler/Frontend/Lexer.vuna"
let v_advanceChar = (fun (dtb_u_u12 : int) (dtb_u_u13 : Base_dSource.t_Pos) -> (match dtb_u_u13 with
  | { Base_dSource.f_Pos_posLine = dtb_u_u14; Base_dSource.f_Pos_posCol = dtb_u_u15; Base_dSource.f_Pos_posOffset = dtb_u_u16; Base_dSource.f_Pos_posEndOffset = dtb_u_u17 } -> (if (dtb_u_u12 = 10) then { Base_dSource.f_Pos_posLine = (dtb_u_u14 + 1); Base_dSource.f_Pos_posCol = 1; Base_dSource.f_Pos_posOffset = (dtb_u_u16 + 1); Base_dSource.f_Pos_posEndOffset = (dtb_u_u16 + 1) } else { Base_dSource.f_Pos_posLine = dtb_u_u14; Base_dSource.f_Pos_posCol = (dtb_u_u15 + 1); Base_dSource.f_Pos_posOffset = (dtb_u_u16 + 1); Base_dSource.f_Pos_posEndOffset = (dtb_u_u16 + 1) })
  | _ -> failwith "DT: impossible branch"
))

# 62 "Vuna/Compiler/Frontend/Lexer.vuna"
let v_charsStep = (fun (dtb_u_u18 : int) (dtb_u_u19 : t_Chars) -> { f_Chars_charsSource = (dtb_u_u19).f_Chars_charsSource; f_Chars_charsOffset = ((dtb_u_u19).f_Chars_charsOffset + 1); f_Chars_charsPos = ((v_advanceChar dtb_u_u18) (dtb_u_u19).f_Chars_charsPos) })

# 66 "Vuna/Compiler/Frontend/Lexer.vuna"
let v_charsNext = (fun (dtb_u_u20 : t_Chars) -> ((v_charsStep (v_charsPeek dtb_u_u20)) dtb_u_u20))

# 70 "Vuna/Compiler/Frontend/Lexer.vuna"
let v_charsNext2 = (fun (dtb_u_u21 : t_Chars) -> (v_charsNext (v_charsNext dtb_u_u21)))

# 74 "Vuna/Compiler/Frontend/Lexer.vuna"
let v_charsPos2 = (fun (dtb_u_u22 : t_Chars) -> ((v_advanceChar (v_charsPeek dtb_u_u22)) (dtb_u_u22).f_Chars_charsPos))

# 94 "Vuna/Compiler/Frontend/Lexer.vuna"
let v_isUpperChar = (fun (dtb_u_u23 : int) -> (if (dtb_u_u23 >= 65) then (dtb_u_u23 <= 90) else false))

# 97 "Vuna/Compiler/Frontend/Lexer.vuna"
let v_isLowerChar = (fun (dtb_u_u24 : int) -> (if (dtb_u_u24 >= 97) then (dtb_u_u24 <= 122) else false))

# 100 "Vuna/Compiler/Frontend/Lexer.vuna"
let v_isIdentStart = (fun (dtb_u_u25 : int) -> (if (if (v_isUpperChar dtb_u_u25) then true else (v_isLowerChar dtb_u_u25)) then true else (dtb_u_u25 = 95)))

# 106 "Vuna/Compiler/Frontend/Lexer.vuna"
let v_isDigit = (fun (dtb_u_u26 : int) -> (if (dtb_u_u26 >= 48) then (dtb_u_u26 <= 57) else false))

# 103 "Vuna/Compiler/Frontend/Lexer.vuna"
let v_isIdentChar = (fun (dtb_u_u27 : int) -> (if (if (v_isIdentStart dtb_u_u27) then true else (v_isDigit dtb_u_u27)) then true else (dtb_u_u27 = 39)))

# 109 "Vuna/Compiler/Frontend/Lexer.vuna"
let v_isSpace = (fun (dtb_u_u28 : int) -> (if (if (if (dtb_u_u28 = 32) then true else (dtb_u_u28 = 9)) then true else (dtb_u_u28 = 10)) then true else (dtb_u_u28 = 13)))

# 112 "Vuna/Compiler/Frontend/Lexer.vuna"
let v_isOpChar = (fun (dtb_u_u29 : int) -> (if (if (if (if (if (if (if (if (if (if (if (if (if (if (if (if (if (if (dtb_u_u29 = 33) then true else (dtb_u_u29 = 36)) then true else (dtb_u_u29 = 37)) then true else (dtb_u_u29 = 38)) then true else (dtb_u_u29 = 42)) then true else (dtb_u_u29 = 43)) then true else (dtb_u_u29 = 45)) then true else (dtb_u_u29 = 46)) then true else (dtb_u_u29 = 47)) then true else (dtb_u_u29 = 60)) then true else (dtb_u_u29 = 61)) then true else (dtb_u_u29 = 62)) then true else (dtb_u_u29 = 63)) then true else (dtb_u_u29 = 64)) then true else (dtb_u_u29 = 92)) then true else (dtb_u_u29 = 94)) then true else (dtb_u_u29 = 124)) then true else (dtb_u_u29 = 126)) then true else (dtb_u_u29 = 58)))

# 146 "Vuna/Compiler/Frontend/Lexer.vuna"
let rec v_allOpChars = (fun (dtb_u_u30 : int B_dData_dList.t_List) -> (match dtb_u_u30 with
  | B_dData_dList.C_List__x58__x58_ (dtb_u_u31, dtb_u_u32) -> (if (v_isOpChar dtb_u_u31) then (v_allOpChars dtb_u_u32) else false)
  | B_dData_dList.C_List_Nil -> true
  | _ -> failwith "DT: impossible branch"
))

# 140 "Vuna/Compiler/Frontend/Lexer.vuna"
let v_isSymbolName = (fun (dtb_u_u33 : string) -> (match (B_dData_dList.dtp_unpack dtb_u_u33) with
  | B_dData_dList.C_List_Nil -> false
  | dtb_u_u34 -> (v_allOpChars dtb_u_u34)
))

# 155 "Vuna/Compiler/Frontend/Lexer.vuna"
let v_isKeyword = (fun (dtb_u_u35 : string) -> (if (if (if (if (if (if (if (if (if (if (if (if (if (if (if (if (if (if (if (if (if (if (if (if (if (if (if (if (dtb_u_u35 = "data") then true else (dtb_u_u35 = "axiom")) then true else (dtb_u_u35 = "extern")) then true else (dtb_u_u35 = "case")) then true else (dtb_u_u35 = "of")) then true else (dtb_u_u35 = "let")) then true else (dtb_u_u35 = "in")) then true else (dtb_u_u35 = "if")) then true else (dtb_u_u35 = "then")) then true else (dtb_u_u35 = "else")) then true else (dtb_u_u35 = "where")) then true else (dtb_u_u35 = "linear")) then true else (dtb_u_u35 = "transparent")) then true else (dtb_u_u35 = "opaque")) then true else (dtb_u_u35 = "Type")) then true else (dtb_u_u35 = "import")) then true else (dtb_u_u35 = "module")) then true else (dtb_u_u35 = "qualified")) then true else (dtb_u_u35 = "as")) then true else (dtb_u_u35 = "record")) then true else (dtb_u_u35 = "trait")) then true else (dtb_u_u35 = "instance")) then true else (dtb_u_u35 = "deriving")) then true else (dtb_u_u35 = "do")) then true else (dtb_u_u35 = "perform")) then true else (dtb_u_u35 = "handle")) then true else (dtb_u_u35 = "infixl")) then true else (dtb_u_u35 = "infixr")) then true else (dtb_u_u35 = "infix")))

# 206 "Vuna/Compiler/Frontend/Lexer.vuna"
let v_classifyIdent = (fun (dtb_u_u36 : string) -> (if (v_isKeyword dtb_u_u36) then (C_Tok_TKw (dtb_u_u36)) else (C_Tok_TIdent (dtb_u_u36))))

# 224 "Vuna/Compiler/Frontend/Lexer.vuna"
let rec v_dropTrailingSpace = (fun (dtb_u_u37 : int B_dData_dList.t_List) -> (match dtb_u_u37 with
  | B_dData_dList.C_List__x58__x58_ (dtb_u_u38, dtb_u_u39) -> (if (if (if (dtb_u_u38 = 32) then true else (dtb_u_u38 = 9)) then true else (dtb_u_u38 = 13)) then (v_dropTrailingSpace dtb_u_u39) else (B_dData_dList.C_List__x58__x58_ (dtb_u_u38, dtb_u_u39)))
  | B_dData_dList.C_List_Nil -> B_dData_dList.C_List_Nil
  | _ -> failwith "DT: impossible branch"
))

# 221 "Vuna/Compiler/Frontend/Lexer.vuna"
let v_trimTrailingSpace = (fun (dtb_u_u40 : string) -> (B_dData_dList.dtp_pack (B_dData_dList.v_reverse (v_dropTrailingSpace (B_dData_dList.v_reverse (B_dData_dList.dtp_unpack dtb_u_u40))))))

# 255 "Vuna/Compiler/Frontend/Lexer.vuna"
let rec v_skipLineComment = (fun (dtb_u_u41 : int) (dtb_u_u42 : t_Chars) -> (if (dtb_u_u41 <= 0) then (Base_dDiag.v_icFuel "lexer") else (if (v_charsEmpty dtb_u_u42) then (Base_dDiag.C_Check_OkC (dtb_u_u42)) else (let dtb_u_u43 = (v_charsPeek dtb_u_u42) in (if (dtb_u_u43 = 10) then (Base_dDiag.C_Check_OkC (dtb_u_u42)) else ((v_skipLineComment (dtb_u_u41 - 1)) ((v_charsStep dtb_u_u43) dtb_u_u42)))))))

# 279 "Vuna/Compiler/Frontend/Lexer.vuna"
let v_commentSpanOf = (fun (dtb_u_u44 : Base_dSource.t_Pos) (dtb_u_u45 : Base_dSource.t_Pos) -> { Base_dSource.f_Span_spanFile = ""; Base_dSource.f_Span_spanStartLine = (Base_dSource.v_posLine dtb_u_u44); Base_dSource.f_Span_spanStartCol = (Base_dSource.v_posCol dtb_u_u44); Base_dSource.f_Span_spanEndLine = (Base_dSource.v_posLine dtb_u_u45); Base_dSource.f_Span_spanEndCol = (Base_dSource.v_posCol dtb_u_u45); Base_dSource.f_Span_spanStartOffset = (Base_dSource.v_posOffset dtb_u_u44); Base_dSource.f_Span_spanEndOffset = (Base_dSource.v_posOffset dtb_u_u45) })

# 365 "Vuna/Compiler/Frontend/Lexer.vuna"
let v_startsWithVunaAt = (fun (dtb_u_u46 : t_Chars) -> (if (if (if (if (((v_charsPeekAt 0) dtb_u_u46) = 118) then (((v_charsPeekAt 1) dtb_u_u46) = 117) else false) then (((v_charsPeekAt 2) dtb_u_u46) = 110) else false) then (((v_charsPeekAt 3) dtb_u_u46) = 97) else false) then (((v_charsPeekAt 4) dtb_u_u46) = 64) else false))

# 372 "Vuna/Compiler/Frontend/Lexer.vuna"
let rec v_collectInternalIdent = (fun (dtb_u_u47 : int) (dtb_u_u48 : t_Chars) (dtb_u_u49 : int B_dData_dList.t_List) -> (if (dtb_u_u47 <= 0) then (Base_dDiag.v_icFuel "lexer") else (if (v_charsEmpty dtb_u_u48) then (Base_dDiag.C_Check_OkC ({ B_dData_dPair.f_Pair_first = (B_dData_dList.dtp_pack (B_dData_dList.v_reverse dtb_u_u49)); B_dData_dPair.f_Pair_second = dtb_u_u48 })) else (let dtb_u_u50 = (v_charsPeek dtb_u_u48) in (if (if (v_isIdentChar dtb_u_u50) then true else (dtb_u_u50 = 64)) then (((v_collectInternalIdent (dtb_u_u47 - 1)) ((v_charsStep dtb_u_u50) dtb_u_u48)) (B_dData_dList.C_List__x58__x58_ (dtb_u_u50, dtb_u_u49))) else (Base_dDiag.C_Check_OkC ({ B_dData_dPair.f_Pair_first = (B_dData_dList.dtp_pack (B_dData_dList.v_reverse dtb_u_u49)); B_dData_dPair.f_Pair_second = dtb_u_u48 })))))))

# 383 "Vuna/Compiler/Frontend/Lexer.vuna"
let rec v_collectIdent = (fun (dtb_u_u51 : int) (dtb_u_u52 : t_Chars) (dtb_u_u53 : int B_dData_dList.t_List) -> (if (dtb_u_u51 <= 0) then (Base_dDiag.v_icFuel "lexer") else (if (v_charsEmpty dtb_u_u52) then (Base_dDiag.C_Check_OkC ({ B_dData_dPair.f_Pair_first = (B_dData_dList.dtp_pack (B_dData_dList.v_reverse dtb_u_u53)); B_dData_dPair.f_Pair_second = dtb_u_u52 })) else (let dtb_u_u54 = (v_charsPeek dtb_u_u52) in (if (v_isIdentChar dtb_u_u54) then (((v_collectIdent (dtb_u_u51 - 1)) ((v_charsStep dtb_u_u54) dtb_u_u52)) (B_dData_dList.C_List__x58__x58_ (dtb_u_u54, dtb_u_u53))) else (if (if (dtb_u_u54 = 46) then (v_isIdentStart ((v_charsPeekAt 1) dtb_u_u52)) else false) then (((v_collectIdent (dtb_u_u51 - 1)) ((v_charsStep dtb_u_u54) dtb_u_u52)) (B_dData_dList.C_List__x58__x58_ (dtb_u_u54, dtb_u_u53))) else (Base_dDiag.C_Check_OkC ({ B_dData_dPair.f_Pair_first = (B_dData_dList.dtp_pack (B_dData_dList.v_reverse dtb_u_u53)); B_dData_dPair.f_Pair_second = dtb_u_u52 }))))))))

# 396 "Vuna/Compiler/Frontend/Lexer.vuna"
let v_maxIntLiteral = 4611686018427387903

# 423 "Vuna/Compiler/Frontend/Lexer.vuna"
let rec v_digitRunIsFloat = (fun (dtb_u_u55 : int) (dtb_u_u56 : t_Chars) -> (if (dtb_u_u55 <= 0) then (Base_dDiag.v_icFuel "lexer") else (if (v_charsEmpty dtb_u_u56) then (Base_dDiag.C_Check_OkC (false)) else (let dtb_u_u57 = (v_charsPeek dtb_u_u56) in (if (v_isDigit dtb_u_u57) then ((v_digitRunIsFloat (dtb_u_u55 - 1)) ((v_charsStep dtb_u_u57) dtb_u_u56)) else (if (dtb_u_u57 = 46) then (Base_dDiag.C_Check_OkC ((v_isDigit ((v_charsPeekAt 1) dtb_u_u56)))) else (Base_dDiag.C_Check_OkC (false))))))))

# 448 "Vuna/Compiler/Frontend/Lexer.vuna"
let rec v_collectFrac = (fun (dtb_u_u58 : int) (dtb_u_u59 : t_Chars) (dtb_u_u60 : int B_dData_dList.t_List) -> (if (dtb_u_u58 <= 0) then (Base_dDiag.v_icFuel "lexer") else (if (v_charsEmpty dtb_u_u59) then (Base_dDiag.C_Check_OkC ({ B_dData_dPair.f_Pair_first = (B_dData_dList.dtp_pack (B_dData_dList.v_reverse dtb_u_u60)); B_dData_dPair.f_Pair_second = dtb_u_u59 })) else (let dtb_u_u61 = (v_charsPeek dtb_u_u59) in (if (v_isDigit dtb_u_u61) then (((v_collectFrac (dtb_u_u58 - 1)) ((v_charsStep dtb_u_u61) dtb_u_u59)) (B_dData_dList.C_List__x58__x58_ (dtb_u_u61, dtb_u_u60))) else (Base_dDiag.C_Check_OkC ({ B_dData_dPair.f_Pair_first = (B_dData_dList.dtp_pack (B_dData_dList.v_reverse dtb_u_u60)); B_dData_dPair.f_Pair_second = dtb_u_u59 })))))))

# 436 "Vuna/Compiler/Frontend/Lexer.vuna"
let rec v_collectFloat = (fun (dtb_u_u62 : int) (dtb_u_u63 : t_Chars) (dtb_u_u64 : int B_dData_dList.t_List) -> (if (dtb_u_u62 <= 0) then (Base_dDiag.v_icFuel "lexer") else (if (v_charsEmpty dtb_u_u63) then (Base_dDiag.C_Check_OkC ({ B_dData_dPair.f_Pair_first = (B_dData_dList.dtp_pack (B_dData_dList.v_reverse dtb_u_u64)); B_dData_dPair.f_Pair_second = dtb_u_u63 })) else (let dtb_u_u65 = (v_charsPeek dtb_u_u63) in (if (v_isDigit dtb_u_u65) then (((v_collectFloat (dtb_u_u62 - 1)) ((v_charsStep dtb_u_u65) dtb_u_u63)) (B_dData_dList.C_List__x58__x58_ (dtb_u_u65, dtb_u_u64))) else (if (dtb_u_u65 = 46) then (((v_collectFrac (dtb_u_u62 - 1)) ((v_charsStep dtb_u_u65) dtb_u_u63)) (B_dData_dList.C_List__x58__x58_ (dtb_u_u65, dtb_u_u64))) else (Base_dDiag.C_Check_OkC ({ B_dData_dPair.f_Pair_first = (B_dData_dList.dtp_pack (B_dData_dList.v_reverse dtb_u_u64)); B_dData_dPair.f_Pair_second = dtb_u_u63 }))))))))

# 459 "Vuna/Compiler/Frontend/Lexer.vuna"
let rec v_collectOp = (fun (dtb_u_u66 : int) (dtb_u_u67 : t_Chars) (dtb_u_u68 : int B_dData_dList.t_List) -> (if (dtb_u_u66 <= 0) then (Base_dDiag.v_icFuel "lexer") else (if (v_charsEmpty dtb_u_u67) then (Base_dDiag.C_Check_OkC ({ B_dData_dPair.f_Pair_first = (B_dData_dList.dtp_pack (B_dData_dList.v_reverse dtb_u_u68)); B_dData_dPair.f_Pair_second = dtb_u_u67 })) else (let dtb_u_u69 = (v_charsPeek dtb_u_u67) in (if (v_isOpChar dtb_u_u69) then (((v_collectOp (dtb_u_u66 - 1)) ((v_charsStep dtb_u_u69) dtb_u_u67)) (B_dData_dList.C_List__x58__x58_ (dtb_u_u69, dtb_u_u68))) else (Base_dDiag.C_Check_OkC ({ B_dData_dPair.f_Pair_first = (B_dData_dList.dtp_pack (B_dData_dList.v_reverse dtb_u_u68)); B_dData_dPair.f_Pair_second = dtb_u_u67 })))))))

# 482 "Vuna/Compiler/Frontend/Lexer.vuna"
let v_decodeEscape = (fun (dtb_u_u70 : int) -> (if (dtb_u_u70 = 110) then (B_dData_dMaybe.C_Maybe_Just (10)) else (if (dtb_u_u70 = 116) then (B_dData_dMaybe.C_Maybe_Just (9)) else (if (dtb_u_u70 = 114) then (B_dData_dMaybe.C_Maybe_Just (13)) else (if (dtb_u_u70 = 34) then (B_dData_dMaybe.C_Maybe_Just (34)) else (if (dtb_u_u70 = 92) then (B_dData_dMaybe.C_Maybe_Just (92)) else (if (dtb_u_u70 = 39) then (B_dData_dMaybe.C_Maybe_Just (39)) else (if (dtb_u_u70 = 36) then (B_dData_dMaybe.C_Maybe_Just (36)) else B_dData_dMaybe.C_Maybe_Nothing))))))))

# 492 "Vuna/Compiler/Frontend/Lexer.vuna"
let v_dropOpeningNewline = (fun (dtb_u_u71 : t_Chars) -> (if (v_charsEmpty dtb_u_u71) then dtb_u_u71 else (let dtb_u_u72 = (v_charsPeek dtb_u_u71) in (if (dtb_u_u72 = 10) then ((v_charsStep dtb_u_u72) dtb_u_u71) else dtb_u_u71))))

# 501 "Vuna/Compiler/Frontend/Lexer.vuna"
let v_flushText = (fun (dtb_u_u73 : int B_dData_dList.t_List) (dtb_u_u74 : t_TmplPart B_dData_dList.t_List) -> (match dtb_u_u73 with
  | B_dData_dList.C_List_Nil -> dtb_u_u74
  | _ -> (B_dData_dList.C_List__x58__x58_ ((C_TmplPart_TPText ((B_dData_dList.dtp_pack (B_dData_dList.v_reverse dtb_u_u73)))), dtb_u_u74))
))

# 567 "Vuna/Compiler/Frontend/Lexer.vuna"
let v_depthAfter = (fun (dtb_u_u75 : int) (dtb_u_u76 : t_Tok) -> (match dtb_u_u76 with
  | C_Tok_TSym (dtb_u_u77) -> (if (dtb_u_u77 = "{") then (dtb_u_u75 + 1) else (if (dtb_u_u77 = "}") then (if (dtb_u_u75 > 0) then (dtb_u_u75 - 1) else 0) else dtb_u_u75))
  | _ -> dtb_u_u75
))

# 715 "Vuna/Compiler/Frontend/Lexer.vuna"
let v_sourceFuel = (fun (dtb_u_u78 : string) -> ((4 * (String.length dtb_u_u78)) + 64))

# 42 "Vuna/Compiler/Frontend/Lexer.vuna"
let v_ptokTok = (fun (dtb_u_u79 : t_PTok) -> (match dtb_u_u79 with
  | { f_PTok_ptokTok = dtb_u_u80; f_PTok_ptokPos = dtb_u_u81 } -> dtb_u_u80
  | _ -> failwith "DT: impossible branch"
))

# 43 "Vuna/Compiler/Frontend/Lexer.vuna"
let v_ptokPos = (fun (dtb_u_u82 : t_PTok) -> (match dtb_u_u82 with
  | { f_PTok_ptokTok = dtb_u_u83; f_PTok_ptokPos = dtb_u_u84 } -> dtb_u_u84
  | _ -> failwith "DT: impossible branch"
))

# 46 "Vuna/Compiler/Frontend/Lexer.vuna"
let v_charsSource = (fun (dtb_u_u85 : t_Chars) -> (match dtb_u_u85 with
  | { f_Chars_charsSource = dtb_u_u86; f_Chars_charsOffset = dtb_u_u87; f_Chars_charsPos = dtb_u_u88 } -> dtb_u_u86
  | _ -> failwith "DT: impossible branch"
))

# 47 "Vuna/Compiler/Frontend/Lexer.vuna"
let v_charsOffset = (fun (dtb_u_u89 : t_Chars) -> (match dtb_u_u89 with
  | { f_Chars_charsSource = dtb_u_u90; f_Chars_charsOffset = dtb_u_u91; f_Chars_charsPos = dtb_u_u92 } -> dtb_u_u91
  | _ -> failwith "DT: impossible branch"
))

# 80 "Vuna/Compiler/Frontend/Lexer.vuna"
let v_setTokEnd = (fun (dtb_u_u93 : t_Chars) (dtb_u_u94 : t_PTok) -> (match dtb_u_u94 with
  | { f_PTok_ptokTok = dtb_u_u95; f_PTok_ptokPos = dtb_u_u96 } -> { f_PTok_ptokTok = dtb_u_u95; f_PTok_ptokPos = { Base_dSource.f_Pos_posLine = (Base_dSource.v_posLine dtb_u_u96); Base_dSource.f_Pos_posCol = (Base_dSource.v_posCol dtb_u_u96); Base_dSource.f_Pos_posOffset = (Base_dSource.v_posOffset dtb_u_u96); Base_dSource.f_Pos_posEndOffset = (v_charsOffset dtb_u_u93) } }
  | _ -> failwith "DT: impossible branch"
))

# 48 "Vuna/Compiler/Frontend/Lexer.vuna"
let v_charsPos = (fun (dtb_u_u97 : t_Chars) -> (match dtb_u_u97 with
  | { f_Chars_charsSource = dtb_u_u98; f_Chars_charsOffset = dtb_u_u99; f_Chars_charsPos = dtb_u_u100 } -> dtb_u_u100
  | _ -> failwith "DT: impossible branch"
))

# 230 "Vuna/Compiler/Frontend/Lexer.vuna"
let rec v_collectLineBody = (fun (dtb_u_u101 : int) (dtb_u_u102 : t_Chars) (dtb_u_u103 : int B_dData_dList.t_List) (dtb_u_u104 : Base_dSource.t_Pos) -> (if (dtb_u_u101 <= 0) then (Base_dDiag.v_icFuel "lexer") else (if (v_charsEmpty dtb_u_u102) then (Base_dDiag.C_Check_OkC ({ B_dData_dPair.f_Pair_first = (B_dData_dList.dtp_pack (B_dData_dList.v_reverse dtb_u_u103)); B_dData_dPair.f_Pair_second = { B_dData_dPair.f_Pair_first = dtb_u_u102; B_dData_dPair.f_Pair_second = dtb_u_u104 } })) else (let dtb_u_u105 = (v_charsPeek dtb_u_u102) in (if (dtb_u_u105 = 10) then (Base_dDiag.C_Check_OkC ({ B_dData_dPair.f_Pair_first = (B_dData_dList.dtp_pack (B_dData_dList.v_reverse dtb_u_u103)); B_dData_dPair.f_Pair_second = { B_dData_dPair.f_Pair_first = dtb_u_u102; B_dData_dPair.f_Pair_second = dtb_u_u104 } })) else ((((v_collectLineBody (dtb_u_u101 - 1)) ((v_charsStep dtb_u_u105) dtb_u_u102)) (B_dData_dList.C_List__x58__x58_ (dtb_u_u105, dtb_u_u103))) (v_charsPos dtb_u_u102)))))))

# 242 "Vuna/Compiler/Frontend/Lexer.vuna"
let rec v_collectBlockBody = (fun (dtb_u_u106 : int) (dtb_u_u107 : t_Chars) (dtb_u_u108 : int) (dtb_u_u109 : int B_dData_dList.t_List) (dtb_u_u110 : Base_dSource.t_Pos) -> (if (dtb_u_u106 <= 0) then (Base_dDiag.v_icFuel "lexer") else (if (v_charsEmpty dtb_u_u107) then ((Base_dDiagnostics_dFrontend.v_lexErr0At (v_lexSpanAt (v_charsPos dtb_u_u107))) Base_dDiagnostics_dFrontend.C_LexDiag_UnterminatedBlockComment) else (let dtb_u_u111 = (v_charsPeek dtb_u_u107) in (let dtb_u_u112 = ((v_charsPeekAt 1) dtb_u_u107) in (if (dtb_u_u112 < 0) then (((((v_collectBlockBody (dtb_u_u106 - 1)) ((v_charsStep dtb_u_u111) dtb_u_u107)) dtb_u_u108) (B_dData_dList.C_List__x58__x58_ (dtb_u_u111, dtb_u_u109))) (v_charsPos dtb_u_u107)) else (if (if (dtb_u_u111 = 123) then (dtb_u_u112 = 45) else false) then (((((v_collectBlockBody (dtb_u_u106 - 1)) (v_charsNext2 dtb_u_u107)) (dtb_u_u108 + 1)) (B_dData_dList.C_List__x58__x58_ (dtb_u_u112, (B_dData_dList.C_List__x58__x58_ (dtb_u_u111, dtb_u_u109))))) (v_charsPos2 dtb_u_u107)) else (if (if (dtb_u_u111 = 45) then (dtb_u_u112 = 125) else false) then (if (dtb_u_u108 = 1) then (Base_dDiag.C_Check_OkC ({ B_dData_dPair.f_Pair_first = (B_dData_dList.dtp_pack (B_dData_dList.v_reverse dtb_u_u109)); B_dData_dPair.f_Pair_second = { B_dData_dPair.f_Pair_first = (v_charsNext2 dtb_u_u107); B_dData_dPair.f_Pair_second = (v_charsPos2 dtb_u_u107) } })) else (((((v_collectBlockBody (dtb_u_u106 - 1)) (v_charsNext2 dtb_u_u107)) (dtb_u_u108 - 1)) (B_dData_dList.C_List__x58__x58_ (dtb_u_u112, (B_dData_dList.C_List__x58__x58_ (dtb_u_u111, dtb_u_u109))))) (v_charsPos2 dtb_u_u107))) else (((((v_collectBlockBody (dtb_u_u106 - 1)) ((v_charsStep dtb_u_u111) dtb_u_u107)) dtb_u_u108) (B_dData_dList.C_List__x58__x58_ (dtb_u_u111, dtb_u_u109))) (v_charsPos dtb_u_u107))))))))))

# 267 "Vuna/Compiler/Frontend/Lexer.vuna"
let rec v_skipBlockComment = (fun (dtb_u_u113 : int) (dtb_u_u114 : int) (dtb_u_u115 : t_Chars) -> (if (dtb_u_u113 <= 0) then (Base_dDiag.v_icFuel "lexer") else (if (v_charsEmpty dtb_u_u115) then ((Base_dDiagnostics_dFrontend.v_lexErr0At (v_lexSpanAt (v_charsPos dtb_u_u115))) Base_dDiagnostics_dFrontend.C_LexDiag_UnterminatedBlockComment) else (let dtb_u_u116 = (v_charsPeek dtb_u_u115) in (let dtb_u_u117 = ((v_charsPeekAt 1) dtb_u_u115) in (if (dtb_u_u117 < 0) then (((v_skipBlockComment (dtb_u_u113 - 1)) dtb_u_u114) ((v_charsStep dtb_u_u116) dtb_u_u115)) else (if (if (dtb_u_u116 = 123) then (dtb_u_u117 = 45) else false) then (((v_skipBlockComment (dtb_u_u113 - 1)) (dtb_u_u114 + 1)) (v_charsNext2 dtb_u_u115)) else (if (if (dtb_u_u116 = 45) then (dtb_u_u117 = 125) else false) then (if (dtb_u_u114 = 1) then (Base_dDiag.C_Check_OkC ((v_charsNext2 dtb_u_u115))) else (((v_skipBlockComment (dtb_u_u113 - 1)) (dtb_u_u114 - 1)) (v_charsNext2 dtb_u_u115))) else (((v_skipBlockComment (dtb_u_u113 - 1)) dtb_u_u114) ((v_charsStep dtb_u_u116) dtb_u_u115))))))))))

# 305 "Vuna/Compiler/Frontend/Lexer.vuna"
let rec v_skipTrivia = (fun (dtb_u_u118 : int) (dtb_u_u119 : t_Chars) -> (if (dtb_u_u118 <= 0) then (Base_dDiag.v_icFuel "lexer") else (if (v_charsEmpty dtb_u_u119) then (Base_dDiag.C_Check_OkC (dtb_u_u119)) else (let dtb_u_u120 = (v_charsPeek dtb_u_u119) in (let dtb_u_u121 = ((v_charsPeekAt 1) dtb_u_u119) in (if (v_isSpace dtb_u_u120) then ((v_skipTrivia (dtb_u_u118 - 1)) ((v_charsStep dtb_u_u120) dtb_u_u119)) else (if (dtb_u_u121 < 0) then (Base_dDiag.C_Check_OkC (dtb_u_u119)) else (if (if (dtb_u_u120 = 45) then (dtb_u_u121 = 45) else false) then (match ((v_skipLineComment (dtb_u_u118 - 1)) ((v_charsStep dtb_u_u120) dtb_u_u119)) with
  | Base_dDiag.C_Check_ErrC (dtb_u_u122) -> (Base_dDiag.C_Check_ErrC (dtb_u_u122))
  | Base_dDiag.C_Check_OkC (dtb_u_u123) -> ((v_skipTrivia (dtb_u_u118 - 1)) dtb_u_u123)
  | _ -> failwith "DT: impossible branch"
) else (if (if (dtb_u_u120 = 123) then (dtb_u_u121 = 45) else false) then (match (((v_skipBlockComment (dtb_u_u118 - 1)) 1) ((v_charsStep dtb_u_u120) dtb_u_u119)) with
  | Base_dDiag.C_Check_ErrC (dtb_u_u124) -> (Base_dDiag.C_Check_ErrC (dtb_u_u124))
  | Base_dDiag.C_Check_OkC (dtb_u_u125) -> ((v_skipTrivia (dtb_u_u118 - 1)) dtb_u_u125)
  | _ -> failwith "DT: impossible branch"
) else (Base_dDiag.C_Check_OkC (dtb_u_u119)))))))))))

# 334 "Vuna/Compiler/Frontend/Lexer.vuna"
let rec v_skipTriviaCommentsGo = (fun (dtb_u_u126 : int) (dtb_u_u127 : t_Comment B_dData_dList.t_List) (dtb_u_u128 : t_Chars) -> (if (dtb_u_u126 <= 0) then (Base_dDiag.v_icFuel "lexer") else (if (v_charsEmpty dtb_u_u128) then (Base_dDiag.C_Check_OkC ({ B_dData_dPair.f_Pair_first = dtb_u_u128; B_dData_dPair.f_Pair_second = (B_dData_dList.v_reverse dtb_u_u127) })) else (let dtb_u_u129 = (v_charsPeek dtb_u_u128) in (let dtb_u_u130 = ((v_charsPeekAt 1) dtb_u_u128) in (let dtb_u_u131 = (v_charsPos dtb_u_u128) in (if (v_isSpace dtb_u_u129) then (((v_skipTriviaCommentsGo (dtb_u_u126 - 1)) dtb_u_u127) ((v_charsStep dtb_u_u129) dtb_u_u128)) else (if (dtb_u_u130 < 0) then (Base_dDiag.C_Check_OkC ({ B_dData_dPair.f_Pair_first = dtb_u_u128; B_dData_dPair.f_Pair_second = (B_dData_dList.v_reverse dtb_u_u127) })) else (if (if (dtb_u_u129 = 45) then (dtb_u_u130 = 45) else false) then (let dtb_u_u132 = ((((v_collectLineBody (dtb_u_u126 - 1)) (v_charsNext2 dtb_u_u128)) B_dData_dList.C_List_Nil) (v_charsPos2 dtb_u_u128)) in (match dtb_u_u132 with
  | Base_dDiag.C_Check_OkC (dtb_u_u133) -> (match dtb_u_u133 with
  | { B_dData_dPair.f_Pair_first = dtb_u_u134; B_dData_dPair.f_Pair_second = dtb_u_u135 } -> (match dtb_u_u135 with
  | { B_dData_dPair.f_Pair_first = dtb_u_u136; B_dData_dPair.f_Pair_second = dtb_u_u137 } -> (((v_skipTriviaCommentsGo (dtb_u_u126 - 1)) (B_dData_dList.C_List__x58__x58_ ({ f_Comment_commentKind = C_CKind_CLine; f_Comment_commentText = (v_trimTrailingSpace dtb_u_u134); f_Comment_commentSpan = ((v_commentSpanOf dtb_u_u131) dtb_u_u137) }, dtb_u_u127))) dtb_u_u136)
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
)
  | Base_dDiag.C_Check_ErrC (dtb_u_u138) -> (Base_dDiag.C_Check_ErrC (dtb_u_u138))
  | _ -> failwith "DT: impossible branch"
)) else (if (if (dtb_u_u129 = 123) then (dtb_u_u130 = 45) else false) then (let dtb_u_u139 = (((((v_collectBlockBody (dtb_u_u126 - 1)) (v_charsNext2 dtb_u_u128)) 1) B_dData_dList.C_List_Nil) (v_charsPos2 dtb_u_u128)) in (match dtb_u_u139 with
  | Base_dDiag.C_Check_OkC (dtb_u_u140) -> (match dtb_u_u140 with
  | { B_dData_dPair.f_Pair_first = dtb_u_u141; B_dData_dPair.f_Pair_second = dtb_u_u142 } -> (match dtb_u_u142 with
  | { B_dData_dPair.f_Pair_first = dtb_u_u143; B_dData_dPair.f_Pair_second = dtb_u_u144 } -> (((v_skipTriviaCommentsGo (dtb_u_u126 - 1)) (B_dData_dList.C_List__x58__x58_ ({ f_Comment_commentKind = C_CKind_CBlock; f_Comment_commentText = dtb_u_u141; f_Comment_commentSpan = ((v_commentSpanOf dtb_u_u131) dtb_u_u144) }, dtb_u_u127))) dtb_u_u143)
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
)
  | Base_dDiag.C_Check_ErrC (dtb_u_u145) -> (Base_dDiag.C_Check_ErrC (dtb_u_u145))
  | _ -> failwith "DT: impossible branch"
)) else (Base_dDiag.C_Check_OkC ({ B_dData_dPair.f_Pair_first = dtb_u_u128; B_dData_dPair.f_Pair_second = (B_dData_dList.v_reverse dtb_u_u127) }))))))))))))

# 331 "Vuna/Compiler/Frontend/Lexer.vuna"
let v_skipTriviaComments = (fun (dtb_u_u146 : int) (dtb_u_u147 : t_Chars) -> (((v_skipTriviaCommentsGo dtb_u_u146) B_dData_dList.C_List_Nil) dtb_u_u147))

# 401 "Vuna/Compiler/Frontend/Lexer.vuna"
let rec v_collectInt = (fun (dtb_u_u148 : int) (dtb_u_u149 : t_Chars) (dtb_u_u150 : int) -> (if (dtb_u_u148 <= 0) then (Base_dDiag.v_icFuel "lexer") else (if (v_charsEmpty dtb_u_u149) then (Base_dDiag.C_Check_OkC ({ B_dData_dPair.f_Pair_first = dtb_u_u150; B_dData_dPair.f_Pair_second = dtb_u_u149 })) else (let dtb_u_u151 = (v_charsPeek dtb_u_u149) in (if (v_isDigit dtb_u_u151) then (let dtb_u_u152 = (dtb_u_u151 - 48) in (if (dtb_u_u150 > (if 10 = 0 then failwith "division by zero" else (v_maxIntLiteral - dtb_u_u152) / 10)) then ((Base_dDiagnostics_dFrontend.v_lexErr0At (v_lexSpanAt (v_charsPos dtb_u_u149))) Base_dDiagnostics_dFrontend.C_LexDiag_IntLiteralOutOfRange) else (((v_collectInt (dtb_u_u148 - 1)) ((v_charsStep dtb_u_u151) dtb_u_u149)) ((dtb_u_u150 * 10) + dtb_u_u152)))) else (Base_dDiag.C_Check_OkC ({ B_dData_dPair.f_Pair_first = dtb_u_u150; B_dData_dPair.f_Pair_second = dtb_u_u149 })))))))

# 508 "Vuna/Compiler/Frontend/Lexer.vuna"
let rec v_scanTemplateText = (fun (dtb_u_u153 : int) (dtb_u_u154 : bool) (dtb_u_u155 : t_Chars) (dtb_u_u156 : int B_dData_dList.t_List) (dtb_u_u157 : t_TmplPart B_dData_dList.t_List) -> (if (dtb_u_u153 <= 0) then (Base_dDiag.v_icFuel "lexer") else (if (v_charsEmpty dtb_u_u155) then ((Base_dDiagnostics_dFrontend.v_lexErr0At (v_lexSpanAt (v_charsPos dtb_u_u155))) Base_dDiagnostics_dFrontend.C_LexDiag_UnterminatedString) else (let dtb_u_u158 = (v_charsPeek dtb_u_u155) in (let dtb_u_u159 = ((v_charsPeekAt 1) dtb_u_u155) in (let dtb_u_u160 = ((v_charsPeekAt 2) dtb_u_u155) in (let dtb_u_u161 = (v_charsPos dtb_u_u155) in (if (dtb_u_u158 = 36) then (if (dtb_u_u159 = 123) then (let dtb_u_u162 = ((((v_lexHoleTokens (dtb_u_u153 - 1)) 0) (v_charsNext2 dtb_u_u155)) B_dData_dList.C_List_Nil) in (match dtb_u_u162 with
  | Base_dDiag.C_Check_OkC (dtb_u_u163) -> (match dtb_u_u163 with
  | { B_dData_dPair.f_Pair_first = dtb_u_u164; B_dData_dPair.f_Pair_second = dtb_u_u165 } -> (if ((v_charsPeek dtb_u_u165) = 125) then (((((v_scanTemplateText (dtb_u_u153 - 1)) dtb_u_u154) (v_charsNext dtb_u_u165)) B_dData_dList.C_List_Nil) (B_dData_dList.C_List__x58__x58_ ((C_TmplPart_TPHole (dtb_u_u164)), ((v_flushText dtb_u_u156) dtb_u_u157)))) else ((Base_dDiagnostics_dFrontend.v_lexErr0At (v_lexSpanAt dtb_u_u161)) Base_dDiagnostics_dFrontend.C_LexDiag_UnterminatedInterpolation))
  | _ -> failwith "DT: impossible branch"
)
  | Base_dDiag.C_Check_ErrC (dtb_u_u166) -> (Base_dDiag.C_Check_ErrC (dtb_u_u166))
  | _ -> failwith "DT: impossible branch"
)) else (((((v_scanTemplateText (dtb_u_u153 - 1)) dtb_u_u154) ((v_charsStep dtb_u_u158) dtb_u_u155)) (B_dData_dList.C_List__x58__x58_ (dtb_u_u158, dtb_u_u156))) dtb_u_u157)) else (if (dtb_u_u158 = 92) then (if (dtb_u_u159 < 0) then ((Base_dDiagnostics_dFrontend.v_lexErr0At (v_lexSpanAt dtb_u_u161)) Base_dDiagnostics_dFrontend.C_LexDiag_UnterminatedString) else (match (v_decodeEscape dtb_u_u159) with
  | B_dData_dMaybe.C_Maybe_Nothing -> ((Base_dDiagnostics_dFrontend.v_lexErr0At (v_lexSpanAt dtb_u_u161)) Base_dDiagnostics_dFrontend.C_LexDiag_UnknownEscape)
  | B_dData_dMaybe.C_Maybe_Just (dtb_u_u167) -> (((((v_scanTemplateText (dtb_u_u153 - 1)) dtb_u_u154) (v_charsNext2 dtb_u_u155)) (B_dData_dList.C_List__x58__x58_ (dtb_u_u167, dtb_u_u156))) dtb_u_u157)
  | _ -> failwith "DT: impossible branch"
)) else (if (if dtb_u_u154 then (dtb_u_u158 = 34) else false) then (if (if (dtb_u_u159 = 34) then (dtb_u_u160 = 34) else false) then (let dtb_u_u168 = (v_charsPos2 dtb_u_u155) in (Base_dDiag.C_Check_OkC ({ B_dData_dPair.f_Pair_first = (B_dData_dList.v_reverse ((v_flushText dtb_u_u156) dtb_u_u157)); B_dData_dPair.f_Pair_second = { B_dData_dPair.f_Pair_first = (v_charsNext2 (v_charsNext dtb_u_u155)); B_dData_dPair.f_Pair_second = dtb_u_u168 } }))) else (((((v_scanTemplateText (dtb_u_u153 - 1)) dtb_u_u154) ((v_charsStep dtb_u_u158) dtb_u_u155)) (B_dData_dList.C_List__x58__x58_ (dtb_u_u158, dtb_u_u156))) dtb_u_u157)) else (if (if (B_dData_dBool.v_not dtb_u_u154) then (dtb_u_u158 = 34) else false) then (Base_dDiag.C_Check_OkC ({ B_dData_dPair.f_Pair_first = (B_dData_dList.v_reverse ((v_flushText dtb_u_u156) dtb_u_u157)); B_dData_dPair.f_Pair_second = { B_dData_dPair.f_Pair_first = ((v_charsStep dtb_u_u158) dtb_u_u155); B_dData_dPair.f_Pair_second = dtb_u_u161 } })) else (if (if (B_dData_dBool.v_not dtb_u_u154) then (dtb_u_u158 = 10) else false) then ((Base_dDiagnostics_dFrontend.v_lexErr0At (v_lexSpanAt dtb_u_u161)) Base_dDiagnostics_dFrontend.C_LexDiag_UnterminatedString) else (((((v_scanTemplateText (dtb_u_u153 - 1)) dtb_u_u154) ((v_charsStep dtb_u_u158) dtb_u_u155)) (B_dData_dList.C_List__x58__x58_ (dtb_u_u158, dtb_u_u156))) dtb_u_u157)))))))))))))
# 548 "Vuna/Compiler/Frontend/Lexer.vuna"
and v_lexHoleTokens = (fun (dtb_u_u169 : int) (dtb_u_u170 : int) (dtb_u_u171 : t_Chars) (dtb_u_u172 : t_PTok B_dData_dList.t_List) -> (if (dtb_u_u169 <= 0) then (Base_dDiag.v_icFuel "lexer") else (match ((v_skipTrivia (dtb_u_u169 - 1)) dtb_u_u171) with
  | Base_dDiag.C_Check_ErrC (dtb_u_u173) -> (Base_dDiag.C_Check_ErrC (dtb_u_u173))
  | Base_dDiag.C_Check_OkC (dtb_u_u174) -> (if (v_charsEmpty dtb_u_u174) then ((Base_dDiagnostics_dFrontend.v_lexErr0At (v_lexSpanAt (v_charsPos dtb_u_u174))) Base_dDiagnostics_dFrontend.C_LexDiag_UnterminatedInterpolation) else (if (if ((v_charsPeek dtb_u_u174) = 125) then (dtb_u_u170 = 0) else false) then (Base_dDiag.C_Check_OkC ({ B_dData_dPair.f_Pair_first = (B_dData_dList.v_reverse dtb_u_u172); B_dData_dPair.f_Pair_second = dtb_u_u174 })) else (let dtb_u_u175 = ((v_lexOneToken (dtb_u_u169 - 1)) dtb_u_u174) in (match dtb_u_u175 with
  | Base_dDiag.C_Check_OkC (dtb_u_u176) -> (match dtb_u_u176 with
  | { B_dData_dPair.f_Pair_first = dtb_u_u177; B_dData_dPair.f_Pair_second = dtb_u_u178 } -> ((((v_lexHoleTokens (dtb_u_u169 - 1)) ((v_depthAfter dtb_u_u170) (dtb_u_u177).f_PTok_ptokTok)) dtb_u_u178) (B_dData_dList.C_List__x58__x58_ (((v_setTokEnd dtb_u_u178) dtb_u_u177), dtb_u_u172)))
  | _ -> failwith "DT: impossible branch"
)
  | Base_dDiag.C_Check_ErrC (dtb_u_u179) -> (Base_dDiag.C_Check_ErrC (dtb_u_u179))
  | _ -> failwith "DT: impossible branch"
))))
  | _ -> failwith "DT: impossible branch"
)))
# 573 "Vuna/Compiler/Frontend/Lexer.vuna"
and v_lexOneToken = (fun (dtb_u_u180 : int) (dtb_u_u181 : t_Chars) -> (if (dtb_u_u180 <= 0) then (Base_dDiag.v_icFuel "lexer") else (if (v_charsEmpty dtb_u_u181) then (Base_dDiag.v_icInternal "lexOneToken on empty input") else (let dtb_u_u182 = (v_charsPeek dtb_u_u181) in (let dtb_u_u183 = (v_charsPos dtb_u_u181) in (let dtb_u_u184 = ((v_charsStep dtb_u_u182) dtb_u_u181) in (if (if (dtb_u_u182 = 64) then (v_startsWithVunaAt dtb_u_u184) else false) then (let dtb_u_u185 = (((v_collectInternalIdent (dtb_u_u180 - 1)) dtb_u_u184) (B_dData_dList.C_List__x58__x58_ (dtb_u_u182, B_dData_dList.C_List_Nil))) in (match dtb_u_u185 with
  | Base_dDiag.C_Check_OkC (dtb_u_u186) -> (match dtb_u_u186 with
  | { B_dData_dPair.f_Pair_first = dtb_u_u187; B_dData_dPair.f_Pair_second = dtb_u_u188 } -> (Base_dDiag.C_Check_OkC ({ B_dData_dPair.f_Pair_first = { f_PTok_ptokTok = (v_classifyIdent dtb_u_u187); f_PTok_ptokPos = dtb_u_u183 }; B_dData_dPair.f_Pair_second = dtb_u_u188 }))
  | _ -> failwith "DT: impossible branch"
)
  | Base_dDiag.C_Check_ErrC (dtb_u_u189) -> (Base_dDiag.C_Check_ErrC (dtb_u_u189))
  | _ -> failwith "DT: impossible branch"
)) else (if (v_isIdentStart dtb_u_u182) then (let dtb_u_u190 = (((v_collectIdent (dtb_u_u180 - 1)) dtb_u_u184) (B_dData_dList.C_List__x58__x58_ (dtb_u_u182, B_dData_dList.C_List_Nil))) in (match dtb_u_u190 with
  | Base_dDiag.C_Check_OkC (dtb_u_u191) -> (match dtb_u_u191 with
  | { B_dData_dPair.f_Pair_first = dtb_u_u192; B_dData_dPair.f_Pair_second = dtb_u_u193 } -> (Base_dDiag.C_Check_OkC ({ B_dData_dPair.f_Pair_first = { f_PTok_ptokTok = (v_classifyIdent dtb_u_u192); f_PTok_ptokPos = dtb_u_u183 }; B_dData_dPair.f_Pair_second = dtb_u_u193 }))
  | _ -> failwith "DT: impossible branch"
)
  | Base_dDiag.C_Check_ErrC (dtb_u_u194) -> (Base_dDiag.C_Check_ErrC (dtb_u_u194))
  | _ -> failwith "DT: impossible branch"
)) else (if (v_isDigit dtb_u_u182) then (let dtb_u_u195 = ((v_digitRunIsFloat (dtb_u_u180 - 1)) dtb_u_u184) in (match dtb_u_u195 with
  | Base_dDiag.C_Check_OkC (dtb_u_u196) -> (if dtb_u_u196 then (let dtb_u_u197 = (((v_collectFloat (dtb_u_u180 - 1)) dtb_u_u184) (B_dData_dList.C_List__x58__x58_ (dtb_u_u182, B_dData_dList.C_List_Nil))) in (match dtb_u_u197 with
  | Base_dDiag.C_Check_OkC (dtb_u_u198) -> (match dtb_u_u198 with
  | { B_dData_dPair.f_Pair_first = dtb_u_u199; B_dData_dPair.f_Pair_second = dtb_u_u200 } -> (Base_dDiag.C_Check_OkC ({ B_dData_dPair.f_Pair_first = { f_PTok_ptokTok = (C_Tok_TFloat (dtb_u_u199)); f_PTok_ptokPos = dtb_u_u183 }; B_dData_dPair.f_Pair_second = dtb_u_u200 }))
  | _ -> failwith "DT: impossible branch"
)
  | Base_dDiag.C_Check_ErrC (dtb_u_u201) -> (Base_dDiag.C_Check_ErrC (dtb_u_u201))
  | _ -> failwith "DT: impossible branch"
)) else (let dtb_u_u202 = (((v_collectInt (dtb_u_u180 - 1)) dtb_u_u184) (dtb_u_u182 - 48)) in (match dtb_u_u202 with
  | Base_dDiag.C_Check_OkC (dtb_u_u203) -> (match dtb_u_u203 with
  | { B_dData_dPair.f_Pair_first = dtb_u_u204; B_dData_dPair.f_Pair_second = dtb_u_u205 } -> (Base_dDiag.C_Check_OkC ({ B_dData_dPair.f_Pair_first = { f_PTok_ptokTok = (C_Tok_TInt (dtb_u_u204)); f_PTok_ptokPos = dtb_u_u183 }; B_dData_dPair.f_Pair_second = dtb_u_u205 }))
  | _ -> failwith "DT: impossible branch"
)
  | Base_dDiag.C_Check_ErrC (dtb_u_u206) -> (Base_dDiag.C_Check_ErrC (dtb_u_u206))
  | _ -> failwith "DT: impossible branch"
)))
  | Base_dDiag.C_Check_ErrC (dtb_u_u207) -> (Base_dDiag.C_Check_ErrC (dtb_u_u207))
  | _ -> failwith "DT: impossible branch"
)) else (if (dtb_u_u182 = 34) then (((v_lexStringToken (dtb_u_u180 - 1)) dtb_u_u184) dtb_u_u183) else (if (if (if (if (if (if (if (dtb_u_u182 = 40) then true else (dtb_u_u182 = 41)) then true else (dtb_u_u182 = 91)) then true else (dtb_u_u182 = 93)) then true else (dtb_u_u182 = 44)) then true else (dtb_u_u182 = 123)) then true else (dtb_u_u182 = 125)) then (Base_dDiag.C_Check_OkC ({ B_dData_dPair.f_Pair_first = { f_PTok_ptokTok = (C_Tok_TSym ((B_dData_dList.dtp_pack (B_dData_dList.C_List__x58__x58_ (dtb_u_u182, B_dData_dList.C_List_Nil))))); f_PTok_ptokPos = dtb_u_u183 }; B_dData_dPair.f_Pair_second = dtb_u_u184 })) else (if (dtb_u_u182 = 96) then (Base_dDiag.C_Check_OkC ({ B_dData_dPair.f_Pair_first = { f_PTok_ptokTok = (C_Tok_TSym ("`")); f_PTok_ptokPos = dtb_u_u183 }; B_dData_dPair.f_Pair_second = dtb_u_u184 })) else (if (v_isOpChar dtb_u_u182) then (let dtb_u_u208 = (((v_collectOp (dtb_u_u180 - 1)) dtb_u_u184) (B_dData_dList.C_List__x58__x58_ (dtb_u_u182, B_dData_dList.C_List_Nil))) in (match dtb_u_u208 with
  | Base_dDiag.C_Check_OkC (dtb_u_u209) -> (match dtb_u_u209 with
  | { B_dData_dPair.f_Pair_first = dtb_u_u210; B_dData_dPair.f_Pair_second = dtb_u_u211 } -> (Base_dDiag.C_Check_OkC ({ B_dData_dPair.f_Pair_first = { f_PTok_ptokTok = (C_Tok_TSym (dtb_u_u210)); f_PTok_ptokPos = dtb_u_u183 }; B_dData_dPair.f_Pair_second = dtb_u_u211 }))
  | _ -> failwith "DT: impossible branch"
)
  | Base_dDiag.C_Check_ErrC (dtb_u_u212) -> (Base_dDiag.C_Check_ErrC (dtb_u_u212))
  | _ -> failwith "DT: impossible branch"
)) else ((Base_dDiagnostics_dFrontend.v_lexErr0At (v_lexSpanAt dtb_u_u183)) Base_dDiagnostics_dFrontend.C_LexDiag_UnexpectedCharacter))))))))))))))
# 620 "Vuna/Compiler/Frontend/Lexer.vuna"
and v_lexStringToken = (fun (dtb_u_u213 : int) (dtb_u_u214 : t_Chars) (dtb_u_u215 : Base_dSource.t_Pos) -> (if (dtb_u_u213 <= 0) then (Base_dDiag.v_icFuel "lexer") else (if (if ((v_charsPeek dtb_u_u214) = 34) then (((v_charsPeekAt 1) dtb_u_u214) = 34) else false) then (let dtb_u_u216 = (((((v_scanTemplateText (dtb_u_u213 - 1)) true) (v_dropOpeningNewline (v_charsNext2 dtb_u_u214))) B_dData_dList.C_List_Nil) B_dData_dList.C_List_Nil) in (match dtb_u_u216 with
  | Base_dDiag.C_Check_OkC (dtb_u_u217) -> (match dtb_u_u217 with
  | { B_dData_dPair.f_Pair_first = dtb_u_u218; B_dData_dPair.f_Pair_second = dtb_u_u219 } -> (match dtb_u_u219 with
  | { B_dData_dPair.f_Pair_first = dtb_u_u220; B_dData_dPair.f_Pair_second = dtb_u_u221 } -> (Base_dDiag.C_Check_OkC ({ B_dData_dPair.f_Pair_first = { f_PTok_ptokTok = (C_Tok_TTmpl (true, dtb_u_u218, dtb_u_u221)); f_PTok_ptokPos = dtb_u_u215 }; B_dData_dPair.f_Pair_second = dtb_u_u220 }))
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
)
  | Base_dDiag.C_Check_ErrC (dtb_u_u222) -> (Base_dDiag.C_Check_ErrC (dtb_u_u222))
  | _ -> failwith "DT: impossible branch"
)) else (((v_lexSingleStringToken (dtb_u_u213 - 1)) dtb_u_u214) dtb_u_u215))))
# 631 "Vuna/Compiler/Frontend/Lexer.vuna"
and v_lexSingleStringToken = (fun (dtb_u_u223 : int) (dtb_u_u224 : t_Chars) (dtb_u_u225 : Base_dSource.t_Pos) -> (if (dtb_u_u223 <= 0) then (Base_dDiag.v_icFuel "lexer") else (let dtb_u_u226 = (((((v_scanTemplateText (dtb_u_u223 - 1)) false) dtb_u_u224) B_dData_dList.C_List_Nil) B_dData_dList.C_List_Nil) in (match dtb_u_u226 with
  | Base_dDiag.C_Check_OkC (dtb_u_u227) -> (match dtb_u_u227 with
  | { B_dData_dPair.f_Pair_first = dtb_u_u228; B_dData_dPair.f_Pair_second = dtb_u_u229 } -> (match dtb_u_u229 with
  | { B_dData_dPair.f_Pair_first = dtb_u_u230; B_dData_dPair.f_Pair_second = dtb_u_u231 } -> (let dtb_u_u232 = dtb_u_u228 in (match dtb_u_u232 with
  | B_dData_dList.C_List__x58__x58_ (dtb_u_u233, dtb_u_u234) -> (match dtb_u_u233 with
  | C_TmplPart_TPText (dtb_u_u235) -> (match dtb_u_u234 with
  | B_dData_dList.C_List_Nil -> (Base_dDiag.C_Check_OkC ({ B_dData_dPair.f_Pair_first = { f_PTok_ptokTok = (C_Tok_TStr (dtb_u_u235)); f_PTok_ptokPos = dtb_u_u225 }; B_dData_dPair.f_Pair_second = dtb_u_u230 }))
  | _ -> (Base_dDiag.C_Check_OkC ({ B_dData_dPair.f_Pair_first = { f_PTok_ptokTok = (C_Tok_TTmpl (false, dtb_u_u228, dtb_u_u231)); f_PTok_ptokPos = dtb_u_u225 }; B_dData_dPair.f_Pair_second = dtb_u_u230 }))
)
  | _ -> (Base_dDiag.C_Check_OkC ({ B_dData_dPair.f_Pair_first = { f_PTok_ptokTok = (C_Tok_TTmpl (false, dtb_u_u228, dtb_u_u231)); f_PTok_ptokPos = dtb_u_u225 }; B_dData_dPair.f_Pair_second = dtb_u_u230 }))
)
  | _ -> (Base_dDiag.C_Check_OkC ({ B_dData_dPair.f_Pair_first = { f_PTok_ptokTok = (C_Tok_TTmpl (false, dtb_u_u228, dtb_u_u231)); f_PTok_ptokPos = dtb_u_u225 }; B_dData_dPair.f_Pair_second = dtb_u_u230 }))
))
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
)
  | Base_dDiag.C_Check_ErrC (dtb_u_u236) -> (Base_dDiag.C_Check_ErrC (dtb_u_u236))
  | _ -> failwith "DT: impossible branch"
))))

# 657 "Vuna/Compiler/Frontend/Lexer.vuna"
let rec v_lexCharsWithRev = (fun (dtb_u_u237 : int) (dtb_u_u238 : t_Comment B_dData_dList.t_List) (dtb_u_u239 : t_PTok B_dData_dList.t_List) (dtb_u_u240 : t_Chars) -> (if (dtb_u_u237 <= 0) then (Base_dDiag.v_icFuel "lexer") else (let dtb_u_u241 = ((v_skipTriviaComments dtb_u_u237) dtb_u_u240) in (match dtb_u_u241 with
  | Base_dDiag.C_Check_OkC (dtb_u_u242) -> (match dtb_u_u242 with
  | { B_dData_dPair.f_Pair_first = dtb_u_u243; B_dData_dPair.f_Pair_second = dtb_u_u244 } -> (if (v_charsEmpty dtb_u_u243) then (Base_dDiag.C_Check_OkC ({ B_dData_dPair.f_Pair_first = (B_dData_dList.C_List__x58__x58_ ({ f_PTok_ptokTok = C_Tok_TEof; f_PTok_ptokPos = ((v_posWithEnd (v_charsPos dtb_u_u243)) (v_charsOffset dtb_u_u243)) }, dtb_u_u239)); B_dData_dPair.f_Pair_second = (B_dData_dList.v_reverse ((B_dData_dList.v_append (B_dData_dList.v_reverse dtb_u_u244)) dtb_u_u238)) })) else (let dtb_u_u245 = ((v_lexOneToken dtb_u_u237) dtb_u_u243) in (match dtb_u_u245 with
  | Base_dDiag.C_Check_OkC (dtb_u_u246) -> (match dtb_u_u246 with
  | { B_dData_dPair.f_Pair_first = dtb_u_u247; B_dData_dPair.f_Pair_second = dtb_u_u248 } -> ((((v_lexCharsWithRev (dtb_u_u237 - 1)) ((B_dData_dList.v_append (B_dData_dList.v_reverse dtb_u_u244)) dtb_u_u238)) (B_dData_dList.C_List__x58__x58_ (((v_setTokEnd dtb_u_u248) dtb_u_u247), dtb_u_u239))) dtb_u_u248)
  | _ -> failwith "DT: impossible branch"
)
  | Base_dDiag.C_Check_ErrC (dtb_u_u249) -> (Base_dDiag.C_Check_ErrC (dtb_u_u249))
  | _ -> failwith "DT: impossible branch"
)))
  | _ -> failwith "DT: impossible branch"
)
  | Base_dDiag.C_Check_ErrC (dtb_u_u250) -> (Base_dDiag.C_Check_ErrC (dtb_u_u250))
  | _ -> failwith "DT: impossible branch"
))))

# 651 "Vuna/Compiler/Frontend/Lexer.vuna"
let v_lexCharsWith = (fun (dtb_u_u251 : int) (dtb_u_u252 : t_Comment B_dData_dList.t_List) (dtb_u_u253 : t_Chars) -> (let dtb_u_u254 = ((((v_lexCharsWithRev dtb_u_u251) dtb_u_u252) B_dData_dList.C_List_Nil) dtb_u_u253) in (match dtb_u_u254 with
  | Base_dDiag.C_Check_OkC (dtb_u_u255) -> (match dtb_u_u255 with
  | { B_dData_dPair.f_Pair_first = dtb_u_u256; B_dData_dPair.f_Pair_second = dtb_u_u257 } -> (Base_dDiag.C_Check_OkC ({ B_dData_dPair.f_Pair_first = (B_dData_dList.v_reverse dtb_u_u256); B_dData_dPair.f_Pair_second = dtb_u_u257 }))
  | _ -> failwith "DT: impossible branch"
)
  | Base_dDiag.C_Check_ErrC (dtb_u_u258) -> (Base_dDiag.C_Check_ErrC (dtb_u_u258))
  | _ -> failwith "DT: impossible branch"
)))

# 680 "Vuna/Compiler/Frontend/Lexer.vuna"
let rec v_lexCharsRev = (fun (dtb_u_u259 : int) (dtb_u_u260 : t_PTok B_dData_dList.t_List) (dtb_u_u261 : t_Chars) -> (if (dtb_u_u259 <= 0) then (Base_dDiag.v_icFuel "lexer") else (match ((v_skipTrivia dtb_u_u259) dtb_u_u261) with
  | Base_dDiag.C_Check_ErrC (dtb_u_u262) -> (Base_dDiag.C_Check_ErrC (dtb_u_u262))
  | Base_dDiag.C_Check_OkC (dtb_u_u263) -> (if (v_charsEmpty dtb_u_u263) then (Base_dDiag.C_Check_OkC ((B_dData_dList.C_List__x58__x58_ ({ f_PTok_ptokTok = C_Tok_TEof; f_PTok_ptokPos = ((v_posWithEnd (v_charsPos dtb_u_u263)) (v_charsOffset dtb_u_u263)) }, dtb_u_u260)))) else (let dtb_u_u264 = ((v_lexOneToken dtb_u_u259) dtb_u_u263) in (match dtb_u_u264 with
  | Base_dDiag.C_Check_OkC (dtb_u_u265) -> (match dtb_u_u265 with
  | { B_dData_dPair.f_Pair_first = dtb_u_u266; B_dData_dPair.f_Pair_second = dtb_u_u267 } -> (((v_lexCharsRev (dtb_u_u259 - 1)) (B_dData_dList.C_List__x58__x58_ (((v_setTokEnd dtb_u_u267) dtb_u_u266), dtb_u_u260))) dtb_u_u267)
  | _ -> failwith "DT: impossible branch"
)
  | Base_dDiag.C_Check_ErrC (dtb_u_u268) -> (Base_dDiag.C_Check_ErrC (dtb_u_u268))
  | _ -> failwith "DT: impossible branch"
)))
  | _ -> failwith "DT: impossible branch"
)))

# 674 "Vuna/Compiler/Frontend/Lexer.vuna"
let v_lexChars = (fun (dtb_u_u269 : int) (dtb_u_u270 : t_Chars) -> (match (((v_lexCharsRev dtb_u_u269) B_dData_dList.C_List_Nil) dtb_u_u270) with
  | Base_dDiag.C_Check_ErrC (dtb_u_u271) -> (Base_dDiag.C_Check_ErrC (dtb_u_u271))
  | Base_dDiag.C_Check_OkC (dtb_u_u272) -> (Base_dDiag.C_Check_OkC ((B_dData_dList.v_reverse dtb_u_u272)))
  | _ -> failwith "DT: impossible branch"
))

# 697 "Vuna/Compiler/Frontend/Lexer.vuna"
let v_lexSourceWithComments = (fun (dtb_u_u273 : string) -> (((v_lexCharsWith (v_sourceFuel dtb_u_u273)) B_dData_dList.C_List_Nil) { f_Chars_charsSource = dtb_u_u273; f_Chars_charsOffset = 0; f_Chars_charsPos = { Base_dSource.f_Pos_posLine = 1; Base_dSource.f_Pos_posCol = 1; Base_dSource.f_Pos_posOffset = 0; Base_dSource.f_Pos_posEndOffset = 0 } }))

# 700 "Vuna/Compiler/Frontend/Lexer.vuna"
let v_lexSource = (fun (dtb_u_u274 : string) -> ((v_lexChars (v_sourceFuel dtb_u_u274)) { f_Chars_charsSource = dtb_u_u274; f_Chars_charsOffset = 0; f_Chars_charsPos = { Base_dSource.f_Pos_posLine = 1; Base_dSource.f_Pos_posCol = 1; Base_dSource.f_Pos_posOffset = 0; Base_dSource.f_Pos_posEndOffset = 0 } }))

# 703 "Vuna/Compiler/Frontend/Lexer.vuna"
let v_lexComments = (fun (dtb_u_u275 : string) -> (let dtb_u_u276 = (v_lexSourceWithComments dtb_u_u275) in (match dtb_u_u276 with
  | Base_dDiag.C_Check_OkC (dtb_u_u277) -> (match dtb_u_u277 with
  | { B_dData_dPair.f_Pair_first = dtb_u_u278; B_dData_dPair.f_Pair_second = dtb_u_u279 } -> (Base_dDiag.C_Check_OkC (dtb_u_u279))
  | _ -> failwith "DT: impossible branch"
)
  | Base_dDiag.C_Check_ErrC (dtb_u_u280) -> (Base_dDiag.C_Check_ErrC (dtb_u_u280))
  | _ -> failwith "DT: impossible branch"
)))

# 216 "Vuna/Compiler/Frontend/Lexer.vuna"
let v_commentKind = (fun (dtb_u_u281 : t_Comment) -> (match dtb_u_u281 with
  | { f_Comment_commentKind = dtb_u_u282; f_Comment_commentText = dtb_u_u283; f_Comment_commentSpan = dtb_u_u284 } -> dtb_u_u282
  | _ -> failwith "DT: impossible branch"
))

# 217 "Vuna/Compiler/Frontend/Lexer.vuna"
let v_commentText = (fun (dtb_u_u285 : t_Comment) -> (match dtb_u_u285 with
  | { f_Comment_commentKind = dtb_u_u286; f_Comment_commentText = dtb_u_u287; f_Comment_commentSpan = dtb_u_u288 } -> dtb_u_u287
  | _ -> failwith "DT: impossible branch"
))

# 218 "Vuna/Compiler/Frontend/Lexer.vuna"
let v_commentSpan = (fun (dtb_u_u289 : t_Comment) -> (match dtb_u_u289 with
  | { f_Comment_commentKind = dtb_u_u290; f_Comment_commentText = dtb_u_u291; f_Comment_commentSpan = dtb_u_u292 } -> dtb_u_u292
  | _ -> failwith "DT: impossible branch"
))
