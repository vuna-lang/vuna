open Vuna_runtime
type t_TmplPart = C_TmplPart_TPText of (string) | C_TmplPart_TPHole of (t_PTok B_dData_dList.t_List)
and t_Tok = C_Tok_TIdent of (string) | C_Tok_TKw of (string) | C_Tok_TInt of (int) | C_Tok_TStr of (string) | C_Tok_TTmpl of (bool) * (t_TmplPart B_dData_dList.t_List) * (Base_dSource.t_Pos) | C_Tok_TSym of (string) | C_Tok_TEof | C_Tok_TFloat of (string)
and t_PTok = { f_PTok_ptokTok : t_Tok; f_PTok_ptokPos : Base_dSource.t_Pos }
and t_Chars = { f_Chars_charsSource : string; f_Chars_charsOffset : int; f_Chars_charsPos : Base_dSource.t_Pos }
and t_CKind = C_CKind_CLine | C_CKind_CBlock
and t_Comment = { f_Comment_commentKind : t_CKind; f_Comment_commentText : string; f_Comment_commentSpan : Base_dSource.t_Span }

# 52 "Vuna/Compiler/Frontend/Lexer.vuna"
let v_charsEmpty = (fun (cs : t_Chars) -> ((cs).f_Chars_charsOffset >= (bi_strLength (cs).f_Chars_charsSource)))

# 55 "Vuna/Compiler/Frontend/Lexer.vuna"
let v_charsPeek = (fun (cs : t_Chars) -> ((dtp_strAt (cs).f_Chars_charsSource) (cs).f_Chars_charsOffset))

# 58 "Vuna/Compiler/Frontend/Lexer.vuna"
let v_charsPeekAt = (fun (k : int) (cs : t_Chars) -> ((dtp_strAt (cs).f_Chars_charsSource) ((cs).f_Chars_charsOffset + k)))

# 84 "Vuna/Compiler/Frontend/Lexer.vuna"
let v_posWithEnd = (fun (p : Base_dSource.t_Pos) (end_ : int) -> { Base_dSource.f_Pos_posLine = (Base_dSource.v_posLine p); Base_dSource.f_Pos_posCol = (Base_dSource.v_posCol p); Base_dSource.f_Pos_posOffset = (Base_dSource.v_posOffset p); Base_dSource.f_Pos_posEndOffset = end_ })

# 87 "Vuna/Compiler/Frontend/Lexer.vuna"
let v_lexSpanAt = (fun (mc0 : Base_dSource.t_Pos) -> (match mc0 with
  | { Base_dSource.f_Pos_posLine = dtb__0; Base_dSource.f_Pos_posCol = dtb__1; Base_dSource.f_Pos_posOffset = dtb__2; Base_dSource.f_Pos_posEndOffset = dtb__3 } -> { Base_dSource.f_Span_spanFile = ""; Base_dSource.f_Span_spanStartLine = dtb__0; Base_dSource.f_Span_spanStartCol = dtb__1; Base_dSource.f_Span_spanEndLine = dtb__0; Base_dSource.f_Span_spanEndCol = dtb__1; Base_dSource.f_Span_spanStartOffset = dtb__2; Base_dSource.f_Span_spanEndOffset = dtb__2 }
  | _ -> failwith "DT: impossible branch"
))

# 90 "Vuna/Compiler/Frontend/Lexer.vuna"
let v_advanceChar = (fun (mc0 : int) (mc1 : Base_dSource.t_Pos) -> (match mc1 with
  | { Base_dSource.f_Pos_posLine = dtb__4; Base_dSource.f_Pos_posCol = dtb__5; Base_dSource.f_Pos_posOffset = dtb__6; Base_dSource.f_Pos_posEndOffset = dtb__7 } -> (if (mc0 = 10) then { Base_dSource.f_Pos_posLine = (dtb__4 + 1); Base_dSource.f_Pos_posCol = 1; Base_dSource.f_Pos_posOffset = (dtb__6 + 1); Base_dSource.f_Pos_posEndOffset = (dtb__6 + 1) } else { Base_dSource.f_Pos_posLine = dtb__4; Base_dSource.f_Pos_posCol = (dtb__5 + 1); Base_dSource.f_Pos_posOffset = (dtb__6 + 1); Base_dSource.f_Pos_posEndOffset = (dtb__6 + 1) })
  | _ -> failwith "DT: impossible branch"
))

# 62 "Vuna/Compiler/Frontend/Lexer.vuna"
let v_charsStep = (fun (c : int) (cs : t_Chars) -> { f_Chars_charsSource = (cs).f_Chars_charsSource; f_Chars_charsOffset = ((cs).f_Chars_charsOffset + 1); f_Chars_charsPos = ((v_advanceChar c) (cs).f_Chars_charsPos) })

# 66 "Vuna/Compiler/Frontend/Lexer.vuna"
let v_charsNext = (fun (cs : t_Chars) -> ((v_charsStep (v_charsPeek cs)) cs))

# 70 "Vuna/Compiler/Frontend/Lexer.vuna"
let v_charsNext2 = (fun (cs : t_Chars) -> (v_charsNext (v_charsNext cs)))

# 74 "Vuna/Compiler/Frontend/Lexer.vuna"
let v_charsPos2 = (fun (cs : t_Chars) -> ((v_advanceChar (v_charsPeek cs)) (cs).f_Chars_charsPos))

# 94 "Vuna/Compiler/Frontend/Lexer.vuna"
let v_isUpperChar = (fun (c : int) -> (if (c >= 65) then (c <= 90) else false))

# 97 "Vuna/Compiler/Frontend/Lexer.vuna"
let v_isLowerChar = (fun (c : int) -> (if (c >= 97) then (c <= 122) else false))

# 100 "Vuna/Compiler/Frontend/Lexer.vuna"
let v_isIdentStart = (fun (c : int) -> (if (if (v_isUpperChar c) then true else (v_isLowerChar c)) then true else (c = 95)))

# 106 "Vuna/Compiler/Frontend/Lexer.vuna"
let v_isDigit = (fun (c : int) -> (if (c >= 48) then (c <= 57) else false))

# 103 "Vuna/Compiler/Frontend/Lexer.vuna"
let v_isIdentChar = (fun (c : int) -> (if (if (v_isIdentStart c) then true else (v_isDigit c)) then true else (c = 39)))

# 109 "Vuna/Compiler/Frontend/Lexer.vuna"
let v_isSpace = (fun (c : int) -> (if (if (if (c = 32) then true else (c = 9)) then true else (c = 10)) then true else (c = 13)))

# 112 "Vuna/Compiler/Frontend/Lexer.vuna"
let v_isOpChar = (fun (c : int) -> (if (if (if (if (if (if (if (if (if (if (if (if (if (if (if (if (if (if (c = 33) then true else (c = 36)) then true else (c = 37)) then true else (c = 38)) then true else (c = 42)) then true else (c = 43)) then true else (c = 45)) then true else (c = 46)) then true else (c = 47)) then true else (c = 60)) then true else (c = 61)) then true else (c = 62)) then true else (c = 63)) then true else (c = 64)) then true else (c = 92)) then true else (c = 94)) then true else (c = 124)) then true else (c = 126)) then true else (c = 58)))

# 146 "Vuna/Compiler/Frontend/Lexer.vuna"
let rec v_allOpChars = (fun (mc0 : int B_dData_dList.t_List) -> (match mc0 with
  | B_dData_dList.C_List__x58__x58_ (dtb__8, dtb__9) -> (if (v_isOpChar dtb__8) then (v_allOpChars dtb__9) else false)
  | B_dData_dList.C_List_Nil -> true
  | _ -> failwith "DT: impossible branch"
))

# 140 "Vuna/Compiler/Frontend/Lexer.vuna"
let v_isSymbolName = (fun (name : string) -> (match (B_dData_dList.dtp_unpack name) with
  | B_dData_dList.C_List_Nil -> false
  | dtb__10 -> (v_allOpChars dtb__10)
))

# 155 "Vuna/Compiler/Frontend/Lexer.vuna"
let v_isKeyword = (fun (s : string) -> (if (if (if (if (if (if (if (if (if (if (if (if (if (if (if (if (if (if (if (if (if (if (if (if (if (if (if (if (s = "data") then true else (s = "axiom")) then true else (s = "extern")) then true else (s = "case")) then true else (s = "of")) then true else (s = "let")) then true else (s = "in")) then true else (s = "if")) then true else (s = "then")) then true else (s = "else")) then true else (s = "where")) then true else (s = "linear")) then true else (s = "transparent")) then true else (s = "opaque")) then true else (s = "Type")) then true else (s = "import")) then true else (s = "module")) then true else (s = "qualified")) then true else (s = "as")) then true else (s = "record")) then true else (s = "trait")) then true else (s = "instance")) then true else (s = "deriving")) then true else (s = "do")) then true else (s = "perform")) then true else (s = "handle")) then true else (s = "infixl")) then true else (s = "infixr")) then true else (s = "infix")))

# 206 "Vuna/Compiler/Frontend/Lexer.vuna"
let v_classifyIdent = (fun (s : string) -> (if (v_isKeyword s) then (C_Tok_TKw (s)) else (C_Tok_TIdent (s))))

# 224 "Vuna/Compiler/Frontend/Lexer.vuna"
let rec v_dropTrailingSpace = (fun (mc0 : int B_dData_dList.t_List) -> (match mc0 with
  | B_dData_dList.C_List__x58__x58_ (dtb__11, dtb__12) -> (if (if (if (dtb__11 = 32) then true else (dtb__11 = 9)) then true else (dtb__11 = 13)) then (v_dropTrailingSpace dtb__12) else (B_dData_dList.C_List__x58__x58_ (dtb__11, dtb__12)))
  | B_dData_dList.C_List_Nil -> B_dData_dList.C_List_Nil
  | _ -> failwith "DT: impossible branch"
))

# 221 "Vuna/Compiler/Frontend/Lexer.vuna"
let v_trimTrailingSpace = (fun (s : string) -> (B_dData_dList.dtp_pack (B_dData_dList.v_reverse (v_dropTrailingSpace (B_dData_dList.v_reverse (B_dData_dList.dtp_unpack s))))))

# 255 "Vuna/Compiler/Frontend/Lexer.vuna"
let rec v_skipLineComment = (fun (fuel : int) (cs : t_Chars) -> (if (fuel <= 0) then (Base_dDiag.v_icFuel "lexer") else (if (v_charsEmpty cs) then (Base_dDiag.C_Check_OkC (cs)) else (let c = (v_charsPeek cs) in (if (c = 10) then (Base_dDiag.C_Check_OkC (cs)) else ((v_skipLineComment (fuel - 1)) ((v_charsStep c) cs)))))))

# 279 "Vuna/Compiler/Frontend/Lexer.vuna"
let v_commentSpanOf = (fun (startP : Base_dSource.t_Pos) (endP : Base_dSource.t_Pos) -> { Base_dSource.f_Span_spanFile = ""; Base_dSource.f_Span_spanStartLine = (Base_dSource.v_posLine startP); Base_dSource.f_Span_spanStartCol = (Base_dSource.v_posCol startP); Base_dSource.f_Span_spanEndLine = (Base_dSource.v_posLine endP); Base_dSource.f_Span_spanEndCol = (Base_dSource.v_posCol endP); Base_dSource.f_Span_spanStartOffset = (Base_dSource.v_posOffset startP); Base_dSource.f_Span_spanEndOffset = (Base_dSource.v_posOffset endP) })

# 365 "Vuna/Compiler/Frontend/Lexer.vuna"
let v_startsWithVunaAt = (fun (cs : t_Chars) -> (if (if (if (if (((v_charsPeekAt 0) cs) = 118) then (((v_charsPeekAt 1) cs) = 117) else false) then (((v_charsPeekAt 2) cs) = 110) else false) then (((v_charsPeekAt 3) cs) = 97) else false) then (((v_charsPeekAt 4) cs) = 64) else false))

# 372 "Vuna/Compiler/Frontend/Lexer.vuna"
let rec v_collectInternalIdent = (fun (fuel : int) (cs : t_Chars) (acc : int B_dData_dList.t_List) -> (if (fuel <= 0) then (Base_dDiag.v_icFuel "lexer") else (if (v_charsEmpty cs) then (Base_dDiag.C_Check_OkC ({ B_dData_dPair.f_Pair_first = (B_dData_dList.dtp_pack (B_dData_dList.v_reverse acc)); B_dData_dPair.f_Pair_second = cs })) else (let c = (v_charsPeek cs) in (if (if (v_isIdentChar c) then true else (c = 64)) then (((v_collectInternalIdent (fuel - 1)) ((v_charsStep c) cs)) (B_dData_dList.C_List__x58__x58_ (c, acc))) else (Base_dDiag.C_Check_OkC ({ B_dData_dPair.f_Pair_first = (B_dData_dList.dtp_pack (B_dData_dList.v_reverse acc)); B_dData_dPair.f_Pair_second = cs })))))))

# 383 "Vuna/Compiler/Frontend/Lexer.vuna"
let rec v_collectIdent = (fun (fuel : int) (cs : t_Chars) (acc : int B_dData_dList.t_List) -> (if (fuel <= 0) then (Base_dDiag.v_icFuel "lexer") else (if (v_charsEmpty cs) then (Base_dDiag.C_Check_OkC ({ B_dData_dPair.f_Pair_first = (B_dData_dList.dtp_pack (B_dData_dList.v_reverse acc)); B_dData_dPair.f_Pair_second = cs })) else (let c = (v_charsPeek cs) in (if (v_isIdentChar c) then (((v_collectIdent (fuel - 1)) ((v_charsStep c) cs)) (B_dData_dList.C_List__x58__x58_ (c, acc))) else (if (if (c = 46) then (v_isIdentStart ((v_charsPeekAt 1) cs)) else false) then (((v_collectIdent (fuel - 1)) ((v_charsStep c) cs)) (B_dData_dList.C_List__x58__x58_ (c, acc))) else (Base_dDiag.C_Check_OkC ({ B_dData_dPair.f_Pair_first = (B_dData_dList.dtp_pack (B_dData_dList.v_reverse acc)); B_dData_dPair.f_Pair_second = cs }))))))))

# 396 "Vuna/Compiler/Frontend/Lexer.vuna"
let v_maxIntLiteral = 4611686018427387903

# 423 "Vuna/Compiler/Frontend/Lexer.vuna"
let rec v_digitRunIsFloat = (fun (fuel : int) (cs : t_Chars) -> (if (fuel <= 0) then (Base_dDiag.v_icFuel "lexer") else (if (v_charsEmpty cs) then (Base_dDiag.C_Check_OkC (false)) else (let c = (v_charsPeek cs) in (if (v_isDigit c) then ((v_digitRunIsFloat (fuel - 1)) ((v_charsStep c) cs)) else (if (c = 46) then (Base_dDiag.C_Check_OkC ((v_isDigit ((v_charsPeekAt 1) cs)))) else (Base_dDiag.C_Check_OkC (false))))))))

# 448 "Vuna/Compiler/Frontend/Lexer.vuna"
let rec v_collectFrac = (fun (fuel : int) (cs : t_Chars) (acc : int B_dData_dList.t_List) -> (if (fuel <= 0) then (Base_dDiag.v_icFuel "lexer") else (if (v_charsEmpty cs) then (Base_dDiag.C_Check_OkC ({ B_dData_dPair.f_Pair_first = (B_dData_dList.dtp_pack (B_dData_dList.v_reverse acc)); B_dData_dPair.f_Pair_second = cs })) else (let c = (v_charsPeek cs) in (if (v_isDigit c) then (((v_collectFrac (fuel - 1)) ((v_charsStep c) cs)) (B_dData_dList.C_List__x58__x58_ (c, acc))) else (Base_dDiag.C_Check_OkC ({ B_dData_dPair.f_Pair_first = (B_dData_dList.dtp_pack (B_dData_dList.v_reverse acc)); B_dData_dPair.f_Pair_second = cs })))))))

# 436 "Vuna/Compiler/Frontend/Lexer.vuna"
let rec v_collectFloat = (fun (fuel : int) (cs : t_Chars) (acc : int B_dData_dList.t_List) -> (if (fuel <= 0) then (Base_dDiag.v_icFuel "lexer") else (if (v_charsEmpty cs) then (Base_dDiag.C_Check_OkC ({ B_dData_dPair.f_Pair_first = (B_dData_dList.dtp_pack (B_dData_dList.v_reverse acc)); B_dData_dPair.f_Pair_second = cs })) else (let c = (v_charsPeek cs) in (if (v_isDigit c) then (((v_collectFloat (fuel - 1)) ((v_charsStep c) cs)) (B_dData_dList.C_List__x58__x58_ (c, acc))) else (if (c = 46) then (((v_collectFrac (fuel - 1)) ((v_charsStep c) cs)) (B_dData_dList.C_List__x58__x58_ (c, acc))) else (Base_dDiag.C_Check_OkC ({ B_dData_dPair.f_Pair_first = (B_dData_dList.dtp_pack (B_dData_dList.v_reverse acc)); B_dData_dPair.f_Pair_second = cs }))))))))

# 459 "Vuna/Compiler/Frontend/Lexer.vuna"
let rec v_collectOp = (fun (fuel : int) (cs : t_Chars) (acc : int B_dData_dList.t_List) -> (if (fuel <= 0) then (Base_dDiag.v_icFuel "lexer") else (if (v_charsEmpty cs) then (Base_dDiag.C_Check_OkC ({ B_dData_dPair.f_Pair_first = (B_dData_dList.dtp_pack (B_dData_dList.v_reverse acc)); B_dData_dPair.f_Pair_second = cs })) else (let c = (v_charsPeek cs) in (if (v_isOpChar c) then (((v_collectOp (fuel - 1)) ((v_charsStep c) cs)) (B_dData_dList.C_List__x58__x58_ (c, acc))) else (Base_dDiag.C_Check_OkC ({ B_dData_dPair.f_Pair_first = (B_dData_dList.dtp_pack (B_dData_dList.v_reverse acc)); B_dData_dPair.f_Pair_second = cs })))))))

# 482 "Vuna/Compiler/Frontend/Lexer.vuna"
let v_decodeEscape = (fun (mc0 : int) -> (if (mc0 = 110) then (B_dData_dMaybe.C_Maybe_Just (10)) else (if (mc0 = 116) then (B_dData_dMaybe.C_Maybe_Just (9)) else (if (mc0 = 114) then (B_dData_dMaybe.C_Maybe_Just (13)) else (if (mc0 = 34) then (B_dData_dMaybe.C_Maybe_Just (34)) else (if (mc0 = 92) then (B_dData_dMaybe.C_Maybe_Just (92)) else (if (mc0 = 39) then (B_dData_dMaybe.C_Maybe_Just (39)) else (if (mc0 = 36) then (B_dData_dMaybe.C_Maybe_Just (36)) else B_dData_dMaybe.C_Maybe_Nothing))))))))

# 492 "Vuna/Compiler/Frontend/Lexer.vuna"
let v_dropOpeningNewline = (fun (cs : t_Chars) -> (if (v_charsEmpty cs) then cs else (let c = (v_charsPeek cs) in (if (c = 10) then ((v_charsStep c) cs) else cs))))

# 501 "Vuna/Compiler/Frontend/Lexer.vuna"
let v_flushText = (fun (mc0 : int B_dData_dList.t_List) (mc1 : t_TmplPart B_dData_dList.t_List) -> (match mc0 with
  | B_dData_dList.C_List_Nil -> mc1
  | _ -> (B_dData_dList.C_List__x58__x58_ ((C_TmplPart_TPText ((B_dData_dList.dtp_pack (B_dData_dList.v_reverse mc0)))), mc1))
))

# 567 "Vuna/Compiler/Frontend/Lexer.vuna"
let v_depthAfter = (fun (mc0 : int) (mc1 : t_Tok) -> (match mc1 with
  | C_Tok_TSym (dtb__13) -> (if (dtb__13 = "{") then (mc0 + 1) else (if (dtb__13 = "}") then (if (mc0 > 0) then (mc0 - 1) else 0) else mc0))
  | _ -> mc0
))

# 715 "Vuna/Compiler/Frontend/Lexer.vuna"
let v_sourceFuel = (fun (source : string) -> ((4 * (bi_strLength source)) + 64))

# 42 "Vuna/Compiler/Frontend/Lexer.vuna"
let v_ptokTok = (fun (p : t_PTok) -> (match p with
  | { f_PTok_ptokTok = dtb__14; f_PTok_ptokPos = dtb__15 } -> dtb__14
  | _ -> failwith "DT: impossible branch"
))

# 43 "Vuna/Compiler/Frontend/Lexer.vuna"
let v_ptokPos = (fun (p : t_PTok) -> (match p with
  | { f_PTok_ptokTok = dtb__16; f_PTok_ptokPos = dtb__17 } -> dtb__17
  | _ -> failwith "DT: impossible branch"
))

# 46 "Vuna/Compiler/Frontend/Lexer.vuna"
let v_charsSource = (fun (p : t_Chars) -> (match p with
  | { f_Chars_charsSource = dtb__18; f_Chars_charsOffset = dtb__19; f_Chars_charsPos = dtb__20 } -> dtb__18
  | _ -> failwith "DT: impossible branch"
))

# 47 "Vuna/Compiler/Frontend/Lexer.vuna"
let v_charsOffset = (fun (p : t_Chars) -> (match p with
  | { f_Chars_charsSource = dtb__21; f_Chars_charsOffset = dtb__22; f_Chars_charsPos = dtb__23 } -> dtb__22
  | _ -> failwith "DT: impossible branch"
))

# 80 "Vuna/Compiler/Frontend/Lexer.vuna"
let v_setTokEnd = (fun (mc0 : t_Chars) (mc1 : t_PTok) -> (match mc1 with
  | { f_PTok_ptokTok = dtb__24; f_PTok_ptokPos = dtb__25 } -> { f_PTok_ptokTok = dtb__24; f_PTok_ptokPos = { Base_dSource.f_Pos_posLine = (Base_dSource.v_posLine dtb__25); Base_dSource.f_Pos_posCol = (Base_dSource.v_posCol dtb__25); Base_dSource.f_Pos_posOffset = (Base_dSource.v_posOffset dtb__25); Base_dSource.f_Pos_posEndOffset = (v_charsOffset mc0) } }
  | _ -> failwith "DT: impossible branch"
))

# 48 "Vuna/Compiler/Frontend/Lexer.vuna"
let v_charsPos = (fun (p : t_Chars) -> (match p with
  | { f_Chars_charsSource = dtb__26; f_Chars_charsOffset = dtb__27; f_Chars_charsPos = dtb__28 } -> dtb__28
  | _ -> failwith "DT: impossible branch"
))

# 230 "Vuna/Compiler/Frontend/Lexer.vuna"
let rec v_collectLineBody = (fun (fuel : int) (cs : t_Chars) (acc : int B_dData_dList.t_List) (endP : Base_dSource.t_Pos) -> (if (fuel <= 0) then (Base_dDiag.v_icFuel "lexer") else (if (v_charsEmpty cs) then (Base_dDiag.C_Check_OkC ({ B_dData_dPair.f_Pair_first = (B_dData_dList.dtp_pack (B_dData_dList.v_reverse acc)); B_dData_dPair.f_Pair_second = { B_dData_dPair.f_Pair_first = cs; B_dData_dPair.f_Pair_second = endP } })) else (let c = (v_charsPeek cs) in (if (c = 10) then (Base_dDiag.C_Check_OkC ({ B_dData_dPair.f_Pair_first = (B_dData_dList.dtp_pack (B_dData_dList.v_reverse acc)); B_dData_dPair.f_Pair_second = { B_dData_dPair.f_Pair_first = cs; B_dData_dPair.f_Pair_second = endP } })) else ((((v_collectLineBody (fuel - 1)) ((v_charsStep c) cs)) (B_dData_dList.C_List__x58__x58_ (c, acc))) (v_charsPos cs)))))))

# 242 "Vuna/Compiler/Frontend/Lexer.vuna"
let rec v_collectBlockBody = (fun (fuel : int) (cs : t_Chars) (depth : int) (acc : int B_dData_dList.t_List) (endP : Base_dSource.t_Pos) -> (if (fuel <= 0) then (Base_dDiag.v_icFuel "lexer") else (if (v_charsEmpty cs) then ((Base_dDiagnostics_dFrontend.v_lexErr0At (v_lexSpanAt (v_charsPos cs))) Base_dDiagnostics_dFrontend.C_LexDiag_UnterminatedBlockComment) else (let c = (v_charsPeek cs) in (let c2 = ((v_charsPeekAt 1) cs) in (if (c2 < 0) then (((((v_collectBlockBody (fuel - 1)) ((v_charsStep c) cs)) depth) (B_dData_dList.C_List__x58__x58_ (c, acc))) (v_charsPos cs)) else (if (if (c = 123) then (c2 = 45) else false) then (((((v_collectBlockBody (fuel - 1)) (v_charsNext2 cs)) (depth + 1)) (B_dData_dList.C_List__x58__x58_ (c2, (B_dData_dList.C_List__x58__x58_ (c, acc))))) (v_charsPos2 cs)) else (if (if (c = 45) then (c2 = 125) else false) then (if (depth = 1) then (Base_dDiag.C_Check_OkC ({ B_dData_dPair.f_Pair_first = (B_dData_dList.dtp_pack (B_dData_dList.v_reverse acc)); B_dData_dPair.f_Pair_second = { B_dData_dPair.f_Pair_first = (v_charsNext2 cs); B_dData_dPair.f_Pair_second = (v_charsPos2 cs) } })) else (((((v_collectBlockBody (fuel - 1)) (v_charsNext2 cs)) (depth - 1)) (B_dData_dList.C_List__x58__x58_ (c2, (B_dData_dList.C_List__x58__x58_ (c, acc))))) (v_charsPos2 cs))) else (((((v_collectBlockBody (fuel - 1)) ((v_charsStep c) cs)) depth) (B_dData_dList.C_List__x58__x58_ (c, acc))) (v_charsPos cs))))))))))

# 267 "Vuna/Compiler/Frontend/Lexer.vuna"
let rec v_skipBlockComment = (fun (fuel : int) (depth : int) (cs : t_Chars) -> (if (fuel <= 0) then (Base_dDiag.v_icFuel "lexer") else (if (v_charsEmpty cs) then ((Base_dDiagnostics_dFrontend.v_lexErr0At (v_lexSpanAt (v_charsPos cs))) Base_dDiagnostics_dFrontend.C_LexDiag_UnterminatedBlockComment) else (let c = (v_charsPeek cs) in (let c2 = ((v_charsPeekAt 1) cs) in (if (c2 < 0) then (((v_skipBlockComment (fuel - 1)) depth) ((v_charsStep c) cs)) else (if (if (c = 123) then (c2 = 45) else false) then (((v_skipBlockComment (fuel - 1)) (depth + 1)) (v_charsNext2 cs)) else (if (if (c = 45) then (c2 = 125) else false) then (if (depth = 1) then (Base_dDiag.C_Check_OkC ((v_charsNext2 cs))) else (((v_skipBlockComment (fuel - 1)) (depth - 1)) (v_charsNext2 cs))) else (((v_skipBlockComment (fuel - 1)) depth) ((v_charsStep c) cs))))))))))

# 305 "Vuna/Compiler/Frontend/Lexer.vuna"
let rec v_skipTrivia = (fun (fuel : int) (cs : t_Chars) -> (if (fuel <= 0) then (Base_dDiag.v_icFuel "lexer") else (if (v_charsEmpty cs) then (Base_dDiag.C_Check_OkC (cs)) else (let c = (v_charsPeek cs) in (let c2 = ((v_charsPeekAt 1) cs) in (if (v_isSpace c) then ((v_skipTrivia (fuel - 1)) ((v_charsStep c) cs)) else (if (c2 < 0) then (Base_dDiag.C_Check_OkC (cs)) else (if (if (c = 45) then (c2 = 45) else false) then (match ((v_skipLineComment (fuel - 1)) ((v_charsStep c) cs)) with
  | Base_dDiag.C_Check_ErrC (dtb__29) -> (Base_dDiag.C_Check_ErrC (dtb__29))
  | Base_dDiag.C_Check_OkC (dtb__30) -> ((v_skipTrivia (fuel - 1)) dtb__30)
  | _ -> failwith "DT: impossible branch"
) else (if (if (c = 123) then (c2 = 45) else false) then (match (((v_skipBlockComment (fuel - 1)) 1) ((v_charsStep c) cs)) with
  | Base_dDiag.C_Check_ErrC (dtb__31) -> (Base_dDiag.C_Check_ErrC (dtb__31))
  | Base_dDiag.C_Check_OkC (dtb__32) -> ((v_skipTrivia (fuel - 1)) dtb__32)
  | _ -> failwith "DT: impossible branch"
) else (Base_dDiag.C_Check_OkC (cs)))))))))))

# 334 "Vuna/Compiler/Frontend/Lexer.vuna"
let rec v_skipTriviaCommentsGo = (fun (fuel : int) (acc : t_Comment B_dData_dList.t_List) (cs : t_Chars) -> (if (fuel <= 0) then (Base_dDiag.v_icFuel "lexer") else (if (v_charsEmpty cs) then (Base_dDiag.C_Check_OkC ({ B_dData_dPair.f_Pair_first = cs; B_dData_dPair.f_Pair_second = (B_dData_dList.v_reverse acc) })) else (let c = (v_charsPeek cs) in (let c2 = ((v_charsPeekAt 1) cs) in (let p = (v_charsPos cs) in (if (v_isSpace c) then (((v_skipTriviaCommentsGo (fuel - 1)) acc) ((v_charsStep c) cs)) else (if (c2 < 0) then (Base_dDiag.C_Check_OkC ({ B_dData_dPair.f_Pair_first = cs; B_dData_dPair.f_Pair_second = (B_dData_dList.v_reverse acc) })) else (if (if (c = 45) then (c2 = 45) else false) then (let nd_uscrut6 = ((((v_collectLineBody (fuel - 1)) (v_charsNext2 cs)) B_dData_dList.C_List_Nil) (v_charsPos2 cs)) in (match nd_uscrut6 with
  | Base_dDiag.C_Check_OkC (dtb__33) -> (match dtb__33 with
  | { B_dData_dPair.f_Pair_first = dtb__34; B_dData_dPair.f_Pair_second = dtb__35 } -> (match dtb__35 with
  | { B_dData_dPair.f_Pair_first = dtb__36; B_dData_dPair.f_Pair_second = dtb__37 } -> (((v_skipTriviaCommentsGo (fuel - 1)) (B_dData_dList.C_List__x58__x58_ ({ f_Comment_commentKind = C_CKind_CLine; f_Comment_commentText = (v_trimTrailingSpace dtb__34); f_Comment_commentSpan = ((v_commentSpanOf p) dtb__37) }, acc))) dtb__36)
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
)
  | Base_dDiag.C_Check_ErrC (dtb__38) -> (Base_dDiag.C_Check_ErrC (dtb__38))
  | _ -> failwith "DT: impossible branch"
)) else (if (if (c = 123) then (c2 = 45) else false) then (let nd_uscrut6 = (((((v_collectBlockBody (fuel - 1)) (v_charsNext2 cs)) 1) B_dData_dList.C_List_Nil) (v_charsPos2 cs)) in (match nd_uscrut6 with
  | Base_dDiag.C_Check_OkC (dtb__39) -> (match dtb__39 with
  | { B_dData_dPair.f_Pair_first = dtb__40; B_dData_dPair.f_Pair_second = dtb__41 } -> (match dtb__41 with
  | { B_dData_dPair.f_Pair_first = dtb__42; B_dData_dPair.f_Pair_second = dtb__43 } -> (((v_skipTriviaCommentsGo (fuel - 1)) (B_dData_dList.C_List__x58__x58_ ({ f_Comment_commentKind = C_CKind_CBlock; f_Comment_commentText = dtb__40; f_Comment_commentSpan = ((v_commentSpanOf p) dtb__43) }, acc))) dtb__42)
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
)
  | Base_dDiag.C_Check_ErrC (dtb__44) -> (Base_dDiag.C_Check_ErrC (dtb__44))
  | _ -> failwith "DT: impossible branch"
)) else (Base_dDiag.C_Check_OkC ({ B_dData_dPair.f_Pair_first = cs; B_dData_dPair.f_Pair_second = (B_dData_dList.v_reverse acc) }))))))))))))

# 331 "Vuna/Compiler/Frontend/Lexer.vuna"
let v_skipTriviaComments = (fun (fuel : int) (cs : t_Chars) -> (((v_skipTriviaCommentsGo fuel) B_dData_dList.C_List_Nil) cs))

# 401 "Vuna/Compiler/Frontend/Lexer.vuna"
let rec v_collectInt = (fun (fuel : int) (cs : t_Chars) (acc : int) -> (if (fuel <= 0) then (Base_dDiag.v_icFuel "lexer") else (if (v_charsEmpty cs) then (Base_dDiag.C_Check_OkC ({ B_dData_dPair.f_Pair_first = acc; B_dData_dPair.f_Pair_second = cs })) else (let c = (v_charsPeek cs) in (if (v_isDigit c) then (let d = (c - 48) in (if (acc > (if 10 = 0 then failwith "division by zero" else (v_maxIntLiteral - d) / 10)) then ((Base_dDiagnostics_dFrontend.v_lexErr0At (v_lexSpanAt (v_charsPos cs))) Base_dDiagnostics_dFrontend.C_LexDiag_IntLiteralOutOfRange) else (((v_collectInt (fuel - 1)) ((v_charsStep c) cs)) ((acc * 10) + d)))) else (Base_dDiag.C_Check_OkC ({ B_dData_dPair.f_Pair_first = acc; B_dData_dPair.f_Pair_second = cs })))))))

# 508 "Vuna/Compiler/Frontend/Lexer.vuna"
let rec v_scanTemplateText = (fun (fuel : int) (multi : bool) (cs : t_Chars) (acc : int B_dData_dList.t_List) (parts : t_TmplPart B_dData_dList.t_List) -> (if (fuel <= 0) then (Base_dDiag.v_icFuel "lexer") else (if (v_charsEmpty cs) then ((Base_dDiagnostics_dFrontend.v_lexErr0At (v_lexSpanAt (v_charsPos cs))) Base_dDiagnostics_dFrontend.C_LexDiag_UnterminatedString) else (let c = (v_charsPeek cs) in (let c2 = ((v_charsPeekAt 1) cs) in (let c3 = ((v_charsPeekAt 2) cs) in (let p = (v_charsPos cs) in (if (c = 36) then (if (c2 = 123) then (let nd_uscrut9 = ((((v_lexHoleTokens (fuel - 1)) 0) (v_charsNext2 cs)) B_dData_dList.C_List_Nil) in (match nd_uscrut9 with
  | Base_dDiag.C_Check_OkC (dtb__45) -> (match dtb__45 with
  | { B_dData_dPair.f_Pair_first = dtb__46; B_dData_dPair.f_Pair_second = dtb__47 } -> (if ((v_charsPeek dtb__47) = 125) then (((((v_scanTemplateText (fuel - 1)) multi) (v_charsNext dtb__47)) B_dData_dList.C_List_Nil) (B_dData_dList.C_List__x58__x58_ ((C_TmplPart_TPHole (dtb__46)), ((v_flushText acc) parts)))) else ((Base_dDiagnostics_dFrontend.v_lexErr0At (v_lexSpanAt p)) Base_dDiagnostics_dFrontend.C_LexDiag_UnterminatedInterpolation))
  | _ -> failwith "DT: impossible branch"
)
  | Base_dDiag.C_Check_ErrC (dtb__48) -> (Base_dDiag.C_Check_ErrC (dtb__48))
  | _ -> failwith "DT: impossible branch"
)) else (((((v_scanTemplateText (fuel - 1)) multi) ((v_charsStep c) cs)) (B_dData_dList.C_List__x58__x58_ (c, acc))) parts)) else (if (c = 92) then (if (c2 < 0) then ((Base_dDiagnostics_dFrontend.v_lexErr0At (v_lexSpanAt p)) Base_dDiagnostics_dFrontend.C_LexDiag_UnterminatedString) else (match (v_decodeEscape c2) with
  | B_dData_dMaybe.C_Maybe_Nothing -> ((Base_dDiagnostics_dFrontend.v_lexErr0At (v_lexSpanAt p)) Base_dDiagnostics_dFrontend.C_LexDiag_UnknownEscape)
  | B_dData_dMaybe.C_Maybe_Just (dtb__49) -> (((((v_scanTemplateText (fuel - 1)) multi) (v_charsNext2 cs)) (B_dData_dList.C_List__x58__x58_ (dtb__49, acc))) parts)
  | _ -> failwith "DT: impossible branch"
)) else (if (if multi then (c = 34) else false) then (if (if (c2 = 34) then (c3 = 34) else false) then (let pos3 = (v_charsPos2 cs) in (Base_dDiag.C_Check_OkC ({ B_dData_dPair.f_Pair_first = (B_dData_dList.v_reverse ((v_flushText acc) parts)); B_dData_dPair.f_Pair_second = { B_dData_dPair.f_Pair_first = (v_charsNext2 (v_charsNext cs)); B_dData_dPair.f_Pair_second = pos3 } }))) else (((((v_scanTemplateText (fuel - 1)) multi) ((v_charsStep c) cs)) (B_dData_dList.C_List__x58__x58_ (c, acc))) parts)) else (if (if (B_dData_dBool.v_not multi) then (c = 34) else false) then (Base_dDiag.C_Check_OkC ({ B_dData_dPair.f_Pair_first = (B_dData_dList.v_reverse ((v_flushText acc) parts)); B_dData_dPair.f_Pair_second = { B_dData_dPair.f_Pair_first = ((v_charsStep c) cs); B_dData_dPair.f_Pair_second = p } })) else (if (if (B_dData_dBool.v_not multi) then (c = 10) else false) then ((Base_dDiagnostics_dFrontend.v_lexErr0At (v_lexSpanAt p)) Base_dDiagnostics_dFrontend.C_LexDiag_UnterminatedString) else (((((v_scanTemplateText (fuel - 1)) multi) ((v_charsStep c) cs)) (B_dData_dList.C_List__x58__x58_ (c, acc))) parts)))))))))))))
# 548 "Vuna/Compiler/Frontend/Lexer.vuna"
and v_lexHoleTokens = (fun (fuel : int) (depth : int) (cs : t_Chars) (acc : t_PTok B_dData_dList.t_List) -> (if (fuel <= 0) then (Base_dDiag.v_icFuel "lexer") else (match ((v_skipTrivia (fuel - 1)) cs) with
  | Base_dDiag.C_Check_ErrC (dtb__50) -> (Base_dDiag.C_Check_ErrC (dtb__50))
  | Base_dDiag.C_Check_OkC (dtb__51) -> (if (v_charsEmpty dtb__51) then ((Base_dDiagnostics_dFrontend.v_lexErr0At (v_lexSpanAt (v_charsPos dtb__51))) Base_dDiagnostics_dFrontend.C_LexDiag_UnterminatedInterpolation) else (if (if ((v_charsPeek dtb__51) = 125) then (depth = 0) else false) then (Base_dDiag.C_Check_OkC ({ B_dData_dPair.f_Pair_first = (B_dData_dList.v_reverse acc); B_dData_dPair.f_Pair_second = dtb__51 })) else (let nd_uscrut6 = ((v_lexOneToken (fuel - 1)) dtb__51) in (match nd_uscrut6 with
  | Base_dDiag.C_Check_OkC (dtb__52) -> (match dtb__52 with
  | { B_dData_dPair.f_Pair_first = dtb__53; B_dData_dPair.f_Pair_second = dtb__54 } -> ((((v_lexHoleTokens (fuel - 1)) ((v_depthAfter depth) (dtb__53).f_PTok_ptokTok)) dtb__54) (B_dData_dList.C_List__x58__x58_ (((v_setTokEnd dtb__54) dtb__53), acc)))
  | _ -> failwith "DT: impossible branch"
)
  | Base_dDiag.C_Check_ErrC (dtb__55) -> (Base_dDiag.C_Check_ErrC (dtb__55))
  | _ -> failwith "DT: impossible branch"
))))
  | _ -> failwith "DT: impossible branch"
)))
# 573 "Vuna/Compiler/Frontend/Lexer.vuna"
and v_lexOneToken = (fun (fuel : int) (cs : t_Chars) -> (if (fuel <= 0) then (Base_dDiag.v_icFuel "lexer") else (if (v_charsEmpty cs) then (Base_dDiag.v_icInternal "lexOneToken on empty input") else (let c = (v_charsPeek cs) in (let p = (v_charsPos cs) in (let next = ((v_charsStep c) cs) in (if (if (c = 64) then (v_startsWithVunaAt next) else false) then (let nd_uscrut5 = (((v_collectInternalIdent (fuel - 1)) next) (B_dData_dList.C_List__x58__x58_ (c, B_dData_dList.C_List_Nil))) in (match nd_uscrut5 with
  | Base_dDiag.C_Check_OkC (dtb__56) -> (match dtb__56 with
  | { B_dData_dPair.f_Pair_first = dtb__57; B_dData_dPair.f_Pair_second = dtb__58 } -> (Base_dDiag.C_Check_OkC ({ B_dData_dPair.f_Pair_first = { f_PTok_ptokTok = (v_classifyIdent dtb__57); f_PTok_ptokPos = p }; B_dData_dPair.f_Pair_second = dtb__58 }))
  | _ -> failwith "DT: impossible branch"
)
  | Base_dDiag.C_Check_ErrC (dtb__59) -> (Base_dDiag.C_Check_ErrC (dtb__59))
  | _ -> failwith "DT: impossible branch"
)) else (if (v_isIdentStart c) then (let nd_uscrut5 = (((v_collectIdent (fuel - 1)) next) (B_dData_dList.C_List__x58__x58_ (c, B_dData_dList.C_List_Nil))) in (match nd_uscrut5 with
  | Base_dDiag.C_Check_OkC (dtb__60) -> (match dtb__60 with
  | { B_dData_dPair.f_Pair_first = dtb__61; B_dData_dPair.f_Pair_second = dtb__62 } -> (Base_dDiag.C_Check_OkC ({ B_dData_dPair.f_Pair_first = { f_PTok_ptokTok = (v_classifyIdent dtb__61); f_PTok_ptokPos = p }; B_dData_dPair.f_Pair_second = dtb__62 }))
  | _ -> failwith "DT: impossible branch"
)
  | Base_dDiag.C_Check_ErrC (dtb__63) -> (Base_dDiag.C_Check_ErrC (dtb__63))
  | _ -> failwith "DT: impossible branch"
)) else (if (v_isDigit c) then (let nd_uscrut5 = ((v_digitRunIsFloat (fuel - 1)) next) in (match nd_uscrut5 with
  | Base_dDiag.C_Check_OkC (dtb__64) -> (if dtb__64 then (let nd_uscrut8 = (((v_collectFloat (fuel - 1)) next) (B_dData_dList.C_List__x58__x58_ (c, B_dData_dList.C_List_Nil))) in (match nd_uscrut8 with
  | Base_dDiag.C_Check_OkC (dtb__65) -> (match dtb__65 with
  | { B_dData_dPair.f_Pair_first = dtb__66; B_dData_dPair.f_Pair_second = dtb__67 } -> (Base_dDiag.C_Check_OkC ({ B_dData_dPair.f_Pair_first = { f_PTok_ptokTok = (C_Tok_TFloat (dtb__66)); f_PTok_ptokPos = p }; B_dData_dPair.f_Pair_second = dtb__67 }))
  | _ -> failwith "DT: impossible branch"
)
  | Base_dDiag.C_Check_ErrC (dtb__68) -> (Base_dDiag.C_Check_ErrC (dtb__68))
  | _ -> failwith "DT: impossible branch"
)) else (let nd_uscrut8 = (((v_collectInt (fuel - 1)) next) (c - 48)) in (match nd_uscrut8 with
  | Base_dDiag.C_Check_OkC (dtb__69) -> (match dtb__69 with
  | { B_dData_dPair.f_Pair_first = dtb__70; B_dData_dPair.f_Pair_second = dtb__71 } -> (Base_dDiag.C_Check_OkC ({ B_dData_dPair.f_Pair_first = { f_PTok_ptokTok = (C_Tok_TInt (dtb__70)); f_PTok_ptokPos = p }; B_dData_dPair.f_Pair_second = dtb__71 }))
  | _ -> failwith "DT: impossible branch"
)
  | Base_dDiag.C_Check_ErrC (dtb__72) -> (Base_dDiag.C_Check_ErrC (dtb__72))
  | _ -> failwith "DT: impossible branch"
)))
  | Base_dDiag.C_Check_ErrC (dtb__73) -> (Base_dDiag.C_Check_ErrC (dtb__73))
  | _ -> failwith "DT: impossible branch"
)) else (if (c = 34) then (((v_lexStringToken (fuel - 1)) next) p) else (if (if (if (if (if (if (if (c = 40) then true else (c = 41)) then true else (c = 91)) then true else (c = 93)) then true else (c = 44)) then true else (c = 123)) then true else (c = 125)) then (Base_dDiag.C_Check_OkC ({ B_dData_dPair.f_Pair_first = { f_PTok_ptokTok = (C_Tok_TSym ((B_dData_dList.dtp_pack (B_dData_dList.C_List__x58__x58_ (c, B_dData_dList.C_List_Nil))))); f_PTok_ptokPos = p }; B_dData_dPair.f_Pair_second = next })) else (if (c = 96) then (Base_dDiag.C_Check_OkC ({ B_dData_dPair.f_Pair_first = { f_PTok_ptokTok = (C_Tok_TSym ("`")); f_PTok_ptokPos = p }; B_dData_dPair.f_Pair_second = next })) else (if (v_isOpChar c) then (let nd_uscrut5 = (((v_collectOp (fuel - 1)) next) (B_dData_dList.C_List__x58__x58_ (c, B_dData_dList.C_List_Nil))) in (match nd_uscrut5 with
  | Base_dDiag.C_Check_OkC (dtb__74) -> (match dtb__74 with
  | { B_dData_dPair.f_Pair_first = dtb__75; B_dData_dPair.f_Pair_second = dtb__76 } -> (Base_dDiag.C_Check_OkC ({ B_dData_dPair.f_Pair_first = { f_PTok_ptokTok = (C_Tok_TSym (dtb__75)); f_PTok_ptokPos = p }; B_dData_dPair.f_Pair_second = dtb__76 }))
  | _ -> failwith "DT: impossible branch"
)
  | Base_dDiag.C_Check_ErrC (dtb__77) -> (Base_dDiag.C_Check_ErrC (dtb__77))
  | _ -> failwith "DT: impossible branch"
)) else ((Base_dDiagnostics_dFrontend.v_lexErr0At (v_lexSpanAt p)) Base_dDiagnostics_dFrontend.C_LexDiag_UnexpectedCharacter))))))))))))))
# 620 "Vuna/Compiler/Frontend/Lexer.vuna"
and v_lexStringToken = (fun (fuel : int) (cs : t_Chars) (p : Base_dSource.t_Pos) -> (if (fuel <= 0) then (Base_dDiag.v_icFuel "lexer") else (if (if ((v_charsPeek cs) = 34) then (((v_charsPeekAt 1) cs) = 34) else false) then (let nd_uscrut3 = (((((v_scanTemplateText (fuel - 1)) true) (v_dropOpeningNewline (v_charsNext2 cs))) B_dData_dList.C_List_Nil) B_dData_dList.C_List_Nil) in (match nd_uscrut3 with
  | Base_dDiag.C_Check_OkC (dtb__78) -> (match dtb__78 with
  | { B_dData_dPair.f_Pair_first = dtb__79; B_dData_dPair.f_Pair_second = dtb__80 } -> (match dtb__80 with
  | { B_dData_dPair.f_Pair_first = dtb__81; B_dData_dPair.f_Pair_second = dtb__82 } -> (Base_dDiag.C_Check_OkC ({ B_dData_dPair.f_Pair_first = { f_PTok_ptokTok = (C_Tok_TTmpl (true, dtb__79, dtb__82)); f_PTok_ptokPos = p }; B_dData_dPair.f_Pair_second = dtb__81 }))
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
)
  | Base_dDiag.C_Check_ErrC (dtb__83) -> (Base_dDiag.C_Check_ErrC (dtb__83))
  | _ -> failwith "DT: impossible branch"
)) else (((v_lexSingleStringToken (fuel - 1)) cs) p))))
# 631 "Vuna/Compiler/Frontend/Lexer.vuna"
and v_lexSingleStringToken = (fun (fuel : int) (body : t_Chars) (p : Base_dSource.t_Pos) -> (if (fuel <= 0) then (Base_dDiag.v_icFuel "lexer") else (let nd_uscrut3 = (((((v_scanTemplateText (fuel - 1)) false) body) B_dData_dList.C_List_Nil) B_dData_dList.C_List_Nil) in (match nd_uscrut3 with
  | Base_dDiag.C_Check_OkC (dtb__84) -> (match dtb__84 with
  | { B_dData_dPair.f_Pair_first = dtb__85; B_dData_dPair.f_Pair_second = dtb__86 } -> (match dtb__86 with
  | { B_dData_dPair.f_Pair_first = dtb__87; B_dData_dPair.f_Pair_second = dtb__88 } -> (let nd_uscrut14 = dtb__85 in (match nd_uscrut14 with
  | B_dData_dList.C_List__x58__x58_ (dtb__89, dtb__90) -> (match dtb__89 with
  | C_TmplPart_TPText (dtb__91) -> (match dtb__90 with
  | B_dData_dList.C_List_Nil -> (Base_dDiag.C_Check_OkC ({ B_dData_dPair.f_Pair_first = { f_PTok_ptokTok = (C_Tok_TStr (dtb__91)); f_PTok_ptokPos = p }; B_dData_dPair.f_Pair_second = dtb__87 }))
  | _ -> (Base_dDiag.C_Check_OkC ({ B_dData_dPair.f_Pair_first = { f_PTok_ptokTok = (C_Tok_TTmpl (false, dtb__85, dtb__88)); f_PTok_ptokPos = p }; B_dData_dPair.f_Pair_second = dtb__87 }))
)
  | _ -> (Base_dDiag.C_Check_OkC ({ B_dData_dPair.f_Pair_first = { f_PTok_ptokTok = (C_Tok_TTmpl (false, dtb__85, dtb__88)); f_PTok_ptokPos = p }; B_dData_dPair.f_Pair_second = dtb__87 }))
)
  | _ -> (Base_dDiag.C_Check_OkC ({ B_dData_dPair.f_Pair_first = { f_PTok_ptokTok = (C_Tok_TTmpl (false, dtb__85, dtb__88)); f_PTok_ptokPos = p }; B_dData_dPair.f_Pair_second = dtb__87 }))
))
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
)
  | Base_dDiag.C_Check_ErrC (dtb__92) -> (Base_dDiag.C_Check_ErrC (dtb__92))
  | _ -> failwith "DT: impossible branch"
))))

# 657 "Vuna/Compiler/Frontend/Lexer.vuna"
let rec v_lexCharsWithRev = (fun (fuel : int) (acc : t_Comment B_dData_dList.t_List) (toks : t_PTok B_dData_dList.t_List) (cs : t_Chars) -> (if (fuel <= 0) then (Base_dDiag.v_icFuel "lexer") else (let nd_uscrut4 = ((v_skipTriviaComments fuel) cs) in (match nd_uscrut4 with
  | Base_dDiag.C_Check_OkC (dtb__93) -> (match dtb__93 with
  | { B_dData_dPair.f_Pair_first = dtb__94; B_dData_dPair.f_Pair_second = dtb__95 } -> (if (v_charsEmpty dtb__94) then (Base_dDiag.C_Check_OkC ({ B_dData_dPair.f_Pair_first = (B_dData_dList.C_List__x58__x58_ ({ f_PTok_ptokTok = C_Tok_TEof; f_PTok_ptokPos = ((v_posWithEnd (v_charsPos dtb__94)) (v_charsOffset dtb__94)) }, toks)); B_dData_dPair.f_Pair_second = (B_dData_dList.v_reverse ((B_dData_dList.v_append (B_dData_dList.v_reverse dtb__95)) acc)) })) else (let nd_uscrut11 = ((v_lexOneToken fuel) dtb__94) in (match nd_uscrut11 with
  | Base_dDiag.C_Check_OkC (dtb__96) -> (match dtb__96 with
  | { B_dData_dPair.f_Pair_first = dtb__97; B_dData_dPair.f_Pair_second = dtb__98 } -> ((((v_lexCharsWithRev (fuel - 1)) ((B_dData_dList.v_append (B_dData_dList.v_reverse dtb__95)) acc)) (B_dData_dList.C_List__x58__x58_ (((v_setTokEnd dtb__98) dtb__97), toks))) dtb__98)
  | _ -> failwith "DT: impossible branch"
)
  | Base_dDiag.C_Check_ErrC (dtb__99) -> (Base_dDiag.C_Check_ErrC (dtb__99))
  | _ -> failwith "DT: impossible branch"
)))
  | _ -> failwith "DT: impossible branch"
)
  | Base_dDiag.C_Check_ErrC (dtb__100) -> (Base_dDiag.C_Check_ErrC (dtb__100))
  | _ -> failwith "DT: impossible branch"
))))

# 651 "Vuna/Compiler/Frontend/Lexer.vuna"
let v_lexCharsWith = (fun (fuel : int) (acc0 : t_Comment B_dData_dList.t_List) (cs : t_Chars) -> (let nd_uscrut3 = ((((v_lexCharsWithRev fuel) acc0) B_dData_dList.C_List_Nil) cs) in (match nd_uscrut3 with
  | Base_dDiag.C_Check_OkC (dtb__101) -> (match dtb__101 with
  | { B_dData_dPair.f_Pair_first = dtb__102; B_dData_dPair.f_Pair_second = dtb__103 } -> (Base_dDiag.C_Check_OkC ({ B_dData_dPair.f_Pair_first = (B_dData_dList.v_reverse dtb__102); B_dData_dPair.f_Pair_second = dtb__103 }))
  | _ -> failwith "DT: impossible branch"
)
  | Base_dDiag.C_Check_ErrC (dtb__104) -> (Base_dDiag.C_Check_ErrC (dtb__104))
  | _ -> failwith "DT: impossible branch"
)))

# 680 "Vuna/Compiler/Frontend/Lexer.vuna"
let rec v_lexCharsRev = (fun (fuel : int) (acc : t_PTok B_dData_dList.t_List) (cs : t_Chars) -> (if (fuel <= 0) then (Base_dDiag.v_icFuel "lexer") else (match ((v_skipTrivia fuel) cs) with
  | Base_dDiag.C_Check_ErrC (dtb__105) -> (Base_dDiag.C_Check_ErrC (dtb__105))
  | Base_dDiag.C_Check_OkC (dtb__106) -> (if (v_charsEmpty dtb__106) then (Base_dDiag.C_Check_OkC ((B_dData_dList.C_List__x58__x58_ ({ f_PTok_ptokTok = C_Tok_TEof; f_PTok_ptokPos = ((v_posWithEnd (v_charsPos dtb__106)) (v_charsOffset dtb__106)) }, acc)))) else (let nd_uscrut5 = ((v_lexOneToken fuel) dtb__106) in (match nd_uscrut5 with
  | Base_dDiag.C_Check_OkC (dtb__107) -> (match dtb__107 with
  | { B_dData_dPair.f_Pair_first = dtb__108; B_dData_dPair.f_Pair_second = dtb__109 } -> (((v_lexCharsRev (fuel - 1)) (B_dData_dList.C_List__x58__x58_ (((v_setTokEnd dtb__109) dtb__108), acc))) dtb__109)
  | _ -> failwith "DT: impossible branch"
)
  | Base_dDiag.C_Check_ErrC (dtb__110) -> (Base_dDiag.C_Check_ErrC (dtb__110))
  | _ -> failwith "DT: impossible branch"
)))
  | _ -> failwith "DT: impossible branch"
)))

# 674 "Vuna/Compiler/Frontend/Lexer.vuna"
let v_lexChars = (fun (fuel : int) (cs : t_Chars) -> (match (((v_lexCharsRev fuel) B_dData_dList.C_List_Nil) cs) with
  | Base_dDiag.C_Check_ErrC (dtb__111) -> (Base_dDiag.C_Check_ErrC (dtb__111))
  | Base_dDiag.C_Check_OkC (dtb__112) -> (Base_dDiag.C_Check_OkC ((B_dData_dList.v_reverse dtb__112)))
  | _ -> failwith "DT: impossible branch"
))

# 697 "Vuna/Compiler/Frontend/Lexer.vuna"
let v_lexSourceWithComments = (fun (source : string) -> (((v_lexCharsWith (v_sourceFuel source)) B_dData_dList.C_List_Nil) { f_Chars_charsSource = source; f_Chars_charsOffset = 0; f_Chars_charsPos = { Base_dSource.f_Pos_posLine = 1; Base_dSource.f_Pos_posCol = 1; Base_dSource.f_Pos_posOffset = 0; Base_dSource.f_Pos_posEndOffset = 0 } }))

# 700 "Vuna/Compiler/Frontend/Lexer.vuna"
let v_lexSource = (fun (source : string) -> ((v_lexChars (v_sourceFuel source)) { f_Chars_charsSource = source; f_Chars_charsOffset = 0; f_Chars_charsPos = { Base_dSource.f_Pos_posLine = 1; Base_dSource.f_Pos_posCol = 1; Base_dSource.f_Pos_posOffset = 0; Base_dSource.f_Pos_posEndOffset = 0 } }))

# 703 "Vuna/Compiler/Frontend/Lexer.vuna"
let v_lexComments = (fun (source : string) -> (let nd_uscrut1 = (v_lexSourceWithComments source) in (match nd_uscrut1 with
  | Base_dDiag.C_Check_OkC (dtb__113) -> (match dtb__113 with
  | { B_dData_dPair.f_Pair_first = dtb__114; B_dData_dPair.f_Pair_second = dtb__115 } -> (Base_dDiag.C_Check_OkC (dtb__115))
  | _ -> failwith "DT: impossible branch"
)
  | Base_dDiag.C_Check_ErrC (dtb__116) -> (Base_dDiag.C_Check_ErrC (dtb__116))
  | _ -> failwith "DT: impossible branch"
)))

# 216 "Vuna/Compiler/Frontend/Lexer.vuna"
let v_commentKind = (fun (p : t_Comment) -> (match p with
  | { f_Comment_commentKind = dtb__117; f_Comment_commentText = dtb__118; f_Comment_commentSpan = dtb__119 } -> dtb__117
  | _ -> failwith "DT: impossible branch"
))

# 217 "Vuna/Compiler/Frontend/Lexer.vuna"
let v_commentText = (fun (p : t_Comment) -> (match p with
  | { f_Comment_commentKind = dtb__120; f_Comment_commentText = dtb__121; f_Comment_commentSpan = dtb__122 } -> dtb__121
  | _ -> failwith "DT: impossible branch"
))

# 218 "Vuna/Compiler/Frontend/Lexer.vuna"
let v_commentSpan = (fun (p : t_Comment) -> (match p with
  | { f_Comment_commentKind = dtb__123; f_Comment_commentText = dtb__124; f_Comment_commentSpan = dtb__125 } -> dtb__125
  | _ -> failwith "DT: impossible branch"
))
