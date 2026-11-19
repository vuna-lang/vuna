open Vuna_runtime
type t_TmplPart = C_TmplPart_TPText of (string) | C_TmplPart_TPHole of (t_PTok B_dData_dList.t_List)
and t_Tok = C_Tok_TIdent of (string) | C_Tok_TKw of (string) | C_Tok_TInt of (int) | C_Tok_TStr of (string) | C_Tok_TTmpl of (bool) * (t_TmplPart B_dData_dList.t_List) * (Base_dSource.t_Pos) | C_Tok_TSym of (string) | C_Tok_TEof | C_Tok_TFloat of (string)
and t_PTok = { f_PTok_ptokTok : t_Tok; f_PTok_ptokPos : Base_dSource.t_Pos }
and t_Chars = { f_Chars_charsSource : string; f_Chars_charsOffset : int; f_Chars_charsPos : Base_dSource.t_Pos }
and t_CKind = C_CKind_CLine | C_CKind_CBlock
and t_Comment = { f_Comment_commentKind : t_CKind; f_Comment_commentText : string; f_Comment_commentSpan : Base_dSource.t_Span }

# 51 "Vuna/Compiler/Frontend/Lexer.vuna"
let v_charsSource = (fun (cs : t_Chars) -> (cs).f_Chars_charsSource)

# 54 "Vuna/Compiler/Frontend/Lexer.vuna"
let v_charsOffset = (fun (cs : t_Chars) -> (cs).f_Chars_charsOffset)

# 57 "Vuna/Compiler/Frontend/Lexer.vuna"
let v_charsPos = (fun (cs : t_Chars) -> (cs).f_Chars_charsPos)

# 61 "Vuna/Compiler/Frontend/Lexer.vuna"
let v_charsEmpty = (fun (cs : t_Chars) -> ((cs).f_Chars_charsOffset >= (bi_strLength (cs).f_Chars_charsSource)))

# 64 "Vuna/Compiler/Frontend/Lexer.vuna"
let v_charsPeek = (fun (cs : t_Chars) -> ((dtp_strAt (cs).f_Chars_charsSource) (cs).f_Chars_charsOffset))

# 67 "Vuna/Compiler/Frontend/Lexer.vuna"
let v_charsPeekAt = (fun (k : int) (cs : t_Chars) -> ((dtp_strAt (cs).f_Chars_charsSource) ((cs).f_Chars_charsOffset + k)))

# 89 "Vuna/Compiler/Frontend/Lexer.vuna"
let v_setTokEnd = (fun (mc0 : t_Chars) (mc1 : t_PTok) -> (match mc1 with
  | { f_PTok_ptokTok = dtb__0; f_PTok_ptokPos = dtb__1 } -> { f_PTok_ptokTok = dtb__0; f_PTok_ptokPos = { Base_dSource.f_Pos_posLine = (Base_dSource.v_posLine dtb__1); Base_dSource.f_Pos_posCol = (Base_dSource.v_posCol dtb__1); Base_dSource.f_Pos_posOffset = (Base_dSource.v_posOffset dtb__1); Base_dSource.f_Pos_posEndOffset = (v_charsOffset mc0) } }
  | _ -> failwith "DT: impossible branch"
))

# 93 "Vuna/Compiler/Frontend/Lexer.vuna"
let v_posWithEnd = (fun (p : Base_dSource.t_Pos) (end_ : int) -> { Base_dSource.f_Pos_posLine = (Base_dSource.v_posLine p); Base_dSource.f_Pos_posCol = (Base_dSource.v_posCol p); Base_dSource.f_Pos_posOffset = (Base_dSource.v_posOffset p); Base_dSource.f_Pos_posEndOffset = end_ })

# 96 "Vuna/Compiler/Frontend/Lexer.vuna"
let v_lexSpanAt = (fun (mc0 : Base_dSource.t_Pos) -> (match mc0 with
  | { Base_dSource.f_Pos_posLine = dtb__2; Base_dSource.f_Pos_posCol = dtb__3; Base_dSource.f_Pos_posOffset = dtb__4; Base_dSource.f_Pos_posEndOffset = dtb__5 } -> { Base_dSource.f_Span_spanFile = ""; Base_dSource.f_Span_spanStartLine = dtb__2; Base_dSource.f_Span_spanStartCol = dtb__3; Base_dSource.f_Span_spanEndLine = dtb__2; Base_dSource.f_Span_spanEndCol = dtb__3; Base_dSource.f_Span_spanStartOffset = dtb__4; Base_dSource.f_Span_spanEndOffset = dtb__4 }
  | _ -> failwith "DT: impossible branch"
))

# 99 "Vuna/Compiler/Frontend/Lexer.vuna"
let v_advanceChar = (fun (mc0 : int) (mc1 : Base_dSource.t_Pos) -> (match mc1 with
  | { Base_dSource.f_Pos_posLine = dtb__6; Base_dSource.f_Pos_posCol = dtb__7; Base_dSource.f_Pos_posOffset = dtb__8; Base_dSource.f_Pos_posEndOffset = dtb__9 } -> (if (mc0 = 10) then { Base_dSource.f_Pos_posLine = (dtb__6 + 1); Base_dSource.f_Pos_posCol = 1; Base_dSource.f_Pos_posOffset = (dtb__8 + 1); Base_dSource.f_Pos_posEndOffset = (dtb__8 + 1) } else { Base_dSource.f_Pos_posLine = dtb__6; Base_dSource.f_Pos_posCol = (dtb__7 + 1); Base_dSource.f_Pos_posOffset = (dtb__8 + 1); Base_dSource.f_Pos_posEndOffset = (dtb__8 + 1) })
  | _ -> failwith "DT: impossible branch"
))

# 71 "Vuna/Compiler/Frontend/Lexer.vuna"
let v_charsStep = (fun (c : int) (cs : t_Chars) -> { f_Chars_charsSource = (cs).f_Chars_charsSource; f_Chars_charsOffset = ((cs).f_Chars_charsOffset + 1); f_Chars_charsPos = ((v_advanceChar c) (cs).f_Chars_charsPos) })

# 75 "Vuna/Compiler/Frontend/Lexer.vuna"
let v_charsNext = (fun (cs : t_Chars) -> ((v_charsStep (v_charsPeek cs)) cs))

# 79 "Vuna/Compiler/Frontend/Lexer.vuna"
let v_charsNext2 = (fun (cs : t_Chars) -> (v_charsNext (v_charsNext cs)))

# 83 "Vuna/Compiler/Frontend/Lexer.vuna"
let v_charsPos2 = (fun (cs : t_Chars) -> ((v_advanceChar (v_charsPeek cs)) (cs).f_Chars_charsPos))

# 103 "Vuna/Compiler/Frontend/Lexer.vuna"
let v_isUpperChar = (fun (c : int) -> (if (c >= 65) then (c <= 90) else false))

# 106 "Vuna/Compiler/Frontend/Lexer.vuna"
let v_isLowerChar = (fun (c : int) -> (if (c >= 97) then (c <= 122) else false))

# 109 "Vuna/Compiler/Frontend/Lexer.vuna"
let v_isIdentStart = (fun (c : int) -> (if (if (v_isUpperChar c) then true else (v_isLowerChar c)) then true else (c = 95)))

# 115 "Vuna/Compiler/Frontend/Lexer.vuna"
let v_isDigit = (fun (c : int) -> (if (c >= 48) then (c <= 57) else false))

# 112 "Vuna/Compiler/Frontend/Lexer.vuna"
let v_isIdentChar = (fun (c : int) -> (if (if (v_isIdentStart c) then true else (v_isDigit c)) then true else (c = 39)))

# 118 "Vuna/Compiler/Frontend/Lexer.vuna"
let v_isSpace = (fun (c : int) -> (if (if (if (c = 32) then true else (c = 9)) then true else (c = 10)) then true else (c = 13)))

# 121 "Vuna/Compiler/Frontend/Lexer.vuna"
let v_isOpChar = (fun (c : int) -> (if (if (if (if (if (if (if (if (if (if (if (if (if (if (if (if (if (if (c = 33) then true else (c = 36)) then true else (c = 37)) then true else (c = 38)) then true else (c = 42)) then true else (c = 43)) then true else (c = 45)) then true else (c = 46)) then true else (c = 47)) then true else (c = 60)) then true else (c = 61)) then true else (c = 62)) then true else (c = 63)) then true else (c = 64)) then true else (c = 92)) then true else (c = 94)) then true else (c = 124)) then true else (c = 126)) then true else (c = 58)))

# 151 "Vuna/Compiler/Frontend/Lexer.vuna"
let v_isKeyword = (fun (s : string) -> (if (if (if (if (if (if (if (if (if (if (if (if (if (if (if (if (if (if (if (if (if (if (if (if (if (if (if (if (s = "data") then true else (s = "axiom")) then true else (s = "extern")) then true else (s = "case")) then true else (s = "of")) then true else (s = "let")) then true else (s = "in")) then true else (s = "if")) then true else (s = "then")) then true else (s = "else")) then true else (s = "where")) then true else (s = "linear")) then true else (s = "transparent")) then true else (s = "opaque")) then true else (s = "Type")) then true else (s = "import")) then true else (s = "module")) then true else (s = "qualified")) then true else (s = "as")) then true else (s = "record")) then true else (s = "trait")) then true else (s = "instance")) then true else (s = "deriving")) then true else (s = "do")) then true else (s = "perform")) then true else (s = "handle")) then true else (s = "infixl")) then true else (s = "infixr")) then true else (s = "infix")))

# 202 "Vuna/Compiler/Frontend/Lexer.vuna"
let v_classifyIdent = (fun (s : string) -> (if (v_isKeyword s) then (C_Tok_TKw (s)) else (C_Tok_TIdent (s))))

# 217 "Vuna/Compiler/Frontend/Lexer.vuna"
let v_commentSpan = (fun (mc0 : t_Comment) -> (match mc0 with
  | { f_Comment_commentKind = dtb__10; f_Comment_commentText = dtb__11; f_Comment_commentSpan = dtb__12 } -> dtb__12
  | _ -> failwith "DT: impossible branch"
))

# 223 "Vuna/Compiler/Frontend/Lexer.vuna"
let rec v_dropTrailingSpace = (fun (mc0 : int B_dData_dList.t_List) -> (match mc0 with
  | B_dData_dList.C_List__x58__x58_ (dtb__13, dtb__14) -> (if (if (if (dtb__13 = 32) then true else (dtb__13 = 9)) then true else (dtb__13 = 13)) then (v_dropTrailingSpace dtb__14) else (B_dData_dList.C_List__x58__x58_ (dtb__13, dtb__14)))
  | B_dData_dList.C_List_Nil -> B_dData_dList.C_List_Nil
  | _ -> failwith "DT: impossible branch"
))

# 220 "Vuna/Compiler/Frontend/Lexer.vuna"
let v_trimTrailingSpace = (fun (s : string) -> (B_dData_dList.dtp_pack (B_dData_dList.v_reverse (v_dropTrailingSpace (B_dData_dList.v_reverse (B_dData_dList.dtp_unpack s))))))

# 229 "Vuna/Compiler/Frontend/Lexer.vuna"
let rec v_collectLineBody = (fun (fuel : int) (cs : t_Chars) (acc : int B_dData_dList.t_List) (endP : Base_dSource.t_Pos) -> (if (fuel <= 0) then (Base_dDiag.v_icFuel "lexer") else (if (v_charsEmpty cs) then (Base_dDiag.C_Check_OkC ({ B_dData_dPair.f_Pair_first = (B_dData_dList.dtp_pack (B_dData_dList.v_reverse acc)); B_dData_dPair.f_Pair_second = { B_dData_dPair.f_Pair_first = cs; B_dData_dPair.f_Pair_second = endP } })) else ((fun c -> (if (c = 10) then (Base_dDiag.C_Check_OkC ({ B_dData_dPair.f_Pair_first = (B_dData_dList.dtp_pack (B_dData_dList.v_reverse acc)); B_dData_dPair.f_Pair_second = { B_dData_dPair.f_Pair_first = cs; B_dData_dPair.f_Pair_second = endP } })) else ((((v_collectLineBody (fuel - 1)) ((v_charsStep c) cs)) (B_dData_dList.C_List__x58__x58_ (c, acc))) (v_charsPos cs)))) (v_charsPeek cs)))))

# 241 "Vuna/Compiler/Frontend/Lexer.vuna"
let rec v_collectBlockBody = (fun (fuel : int) (cs : t_Chars) (depth : int) (acc : int B_dData_dList.t_List) (endP : Base_dSource.t_Pos) -> (if (fuel <= 0) then (Base_dDiag.v_icFuel "lexer") else (if (v_charsEmpty cs) then ((Base_dDiagnostics_dFrontend.v_lexErr0At (v_lexSpanAt (v_charsPos cs))) Base_dDiagnostics_dFrontend.C_LexDiag_UnterminatedBlockComment) else ((fun c -> ((fun c2 -> (if (c2 < 0) then (((((v_collectBlockBody (fuel - 1)) ((v_charsStep c) cs)) depth) (B_dData_dList.C_List__x58__x58_ (c, acc))) (v_charsPos cs)) else (if (if (c = 123) then (c2 = 45) else false) then (((((v_collectBlockBody (fuel - 1)) (v_charsNext2 cs)) (depth + 1)) (B_dData_dList.C_List__x58__x58_ (c2, (B_dData_dList.C_List__x58__x58_ (c, acc))))) (v_charsPos2 cs)) else (if (if (c = 45) then (c2 = 125) else false) then (if (depth = 1) then (Base_dDiag.C_Check_OkC ({ B_dData_dPair.f_Pair_first = (B_dData_dList.dtp_pack (B_dData_dList.v_reverse acc)); B_dData_dPair.f_Pair_second = { B_dData_dPair.f_Pair_first = (v_charsNext2 cs); B_dData_dPair.f_Pair_second = (v_charsPos2 cs) } })) else (((((v_collectBlockBody (fuel - 1)) (v_charsNext2 cs)) (depth - 1)) (B_dData_dList.C_List__x58__x58_ (c2, (B_dData_dList.C_List__x58__x58_ (c, acc))))) (v_charsPos2 cs))) else (((((v_collectBlockBody (fuel - 1)) ((v_charsStep c) cs)) depth) (B_dData_dList.C_List__x58__x58_ (c, acc))) (v_charsPos cs)))))) ((v_charsPeekAt 1) cs))) (v_charsPeek cs)))))

# 254 "Vuna/Compiler/Frontend/Lexer.vuna"
let rec v_skipLineComment = (fun (fuel : int) (cs : t_Chars) -> (if (fuel <= 0) then (Base_dDiag.v_icFuel "lexer") else (if (v_charsEmpty cs) then (Base_dDiag.C_Check_OkC (cs)) else ((fun c -> (if (c = 10) then (Base_dDiag.C_Check_OkC (cs)) else ((v_skipLineComment (fuel - 1)) ((v_charsStep c) cs)))) (v_charsPeek cs)))))

# 266 "Vuna/Compiler/Frontend/Lexer.vuna"
let rec v_skipBlockComment = (fun (fuel : int) (depth : int) (cs : t_Chars) -> (if (fuel <= 0) then (Base_dDiag.v_icFuel "lexer") else (if (v_charsEmpty cs) then ((Base_dDiagnostics_dFrontend.v_lexErr0At (v_lexSpanAt (v_charsPos cs))) Base_dDiagnostics_dFrontend.C_LexDiag_UnterminatedBlockComment) else ((fun c -> ((fun c2 -> (if (c2 < 0) then (((v_skipBlockComment (fuel - 1)) depth) ((v_charsStep c) cs)) else (if (if (c = 123) then (c2 = 45) else false) then (((v_skipBlockComment (fuel - 1)) (depth + 1)) (v_charsNext2 cs)) else (if (if (c = 45) then (c2 = 125) else false) then (if (depth = 1) then (Base_dDiag.C_Check_OkC ((v_charsNext2 cs))) else (((v_skipBlockComment (fuel - 1)) (depth - 1)) (v_charsNext2 cs))) else (((v_skipBlockComment (fuel - 1)) depth) ((v_charsStep c) cs)))))) ((v_charsPeekAt 1) cs))) (v_charsPeek cs)))))

# 278 "Vuna/Compiler/Frontend/Lexer.vuna"
let v_commentSpanOf = (fun (startP : Base_dSource.t_Pos) (endP : Base_dSource.t_Pos) -> { Base_dSource.f_Span_spanFile = ""; Base_dSource.f_Span_spanStartLine = (Base_dSource.v_posLine startP); Base_dSource.f_Span_spanStartCol = (Base_dSource.v_posCol startP); Base_dSource.f_Span_spanEndLine = (Base_dSource.v_posLine endP); Base_dSource.f_Span_spanEndCol = (Base_dSource.v_posCol endP); Base_dSource.f_Span_spanStartOffset = (Base_dSource.v_posOffset startP); Base_dSource.f_Span_spanEndOffset = (Base_dSource.v_posOffset endP) })

# 304 "Vuna/Compiler/Frontend/Lexer.vuna"
let rec v_skipTrivia = (fun (fuel : int) (cs : t_Chars) -> (if (fuel <= 0) then (Base_dDiag.v_icFuel "lexer") else (if (v_charsEmpty cs) then (Base_dDiag.C_Check_OkC (cs)) else ((fun c -> ((fun c2 -> (if (v_isSpace c) then ((v_skipTrivia (fuel - 1)) ((v_charsStep c) cs)) else (if (c2 < 0) then (Base_dDiag.C_Check_OkC (cs)) else (if (if (c = 45) then (c2 = 45) else false) then (match ((v_skipLineComment (fuel - 1)) ((v_charsStep c) cs)) with
  | Base_dDiag.C_Check_ErrC (dtb__15) -> (Base_dDiag.C_Check_ErrC (dtb__15))
  | Base_dDiag.C_Check_OkC (dtb__16) -> ((v_skipTrivia (fuel - 1)) dtb__16)
  | _ -> failwith "DT: impossible branch"
) else (if (if (c = 123) then (c2 = 45) else false) then (match (((v_skipBlockComment (fuel - 1)) 1) ((v_charsStep c) cs)) with
  | Base_dDiag.C_Check_ErrC (dtb__17) -> (Base_dDiag.C_Check_ErrC (dtb__17))
  | Base_dDiag.C_Check_OkC (dtb__18) -> ((v_skipTrivia (fuel - 1)) dtb__18)
  | _ -> failwith "DT: impossible branch"
) else (Base_dDiag.C_Check_OkC (cs))))))) ((v_charsPeekAt 1) cs))) (v_charsPeek cs)))))

# 333 "Vuna/Compiler/Frontend/Lexer.vuna"
let rec v_skipTriviaCommentsGo = (fun (fuel : int) (acc : t_Comment B_dData_dList.t_List) (cs : t_Chars) -> (if (fuel <= 0) then (Base_dDiag.v_icFuel "lexer") else (if (v_charsEmpty cs) then (Base_dDiag.C_Check_OkC ({ B_dData_dPair.f_Pair_first = cs; B_dData_dPair.f_Pair_second = (B_dData_dList.v_reverse acc) })) else ((fun c -> ((fun c2 -> ((fun p -> (if (v_isSpace c) then (((v_skipTriviaCommentsGo (fuel - 1)) acc) ((v_charsStep c) cs)) else (if (c2 < 0) then (Base_dDiag.C_Check_OkC ({ B_dData_dPair.f_Pair_first = cs; B_dData_dPair.f_Pair_second = (B_dData_dList.v_reverse acc) })) else (if (if (c = 45) then (c2 = 45) else false) then ((fun nd_uscrut6 -> (match nd_uscrut6 with
  | Base_dDiag.C_Check_OkC (dtb__19) -> (match dtb__19 with
  | { B_dData_dPair.f_Pair_first = dtb__20; B_dData_dPair.f_Pair_second = dtb__21 } -> (match dtb__21 with
  | { B_dData_dPair.f_Pair_first = dtb__22; B_dData_dPair.f_Pair_second = dtb__23 } -> (((v_skipTriviaCommentsGo (fuel - 1)) (B_dData_dList.C_List__x58__x58_ ({ f_Comment_commentKind = C_CKind_CLine; f_Comment_commentText = (v_trimTrailingSpace dtb__20); f_Comment_commentSpan = ((v_commentSpanOf p) dtb__23) }, acc))) dtb__22)
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
)
  | Base_dDiag.C_Check_ErrC (dtb__24) -> (Base_dDiag.C_Check_ErrC (dtb__24))
  | _ -> failwith "DT: impossible branch"
)) ((((v_collectLineBody (fuel - 1)) (v_charsNext2 cs)) B_dData_dList.C_List_Nil) (v_charsPos2 cs))) else (if (if (c = 123) then (c2 = 45) else false) then ((fun nd_uscrut6 -> (match nd_uscrut6 with
  | Base_dDiag.C_Check_OkC (dtb__25) -> (match dtb__25 with
  | { B_dData_dPair.f_Pair_first = dtb__26; B_dData_dPair.f_Pair_second = dtb__27 } -> (match dtb__27 with
  | { B_dData_dPair.f_Pair_first = dtb__28; B_dData_dPair.f_Pair_second = dtb__29 } -> (((v_skipTriviaCommentsGo (fuel - 1)) (B_dData_dList.C_List__x58__x58_ ({ f_Comment_commentKind = C_CKind_CBlock; f_Comment_commentText = dtb__26; f_Comment_commentSpan = ((v_commentSpanOf p) dtb__29) }, acc))) dtb__28)
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
)
  | Base_dDiag.C_Check_ErrC (dtb__30) -> (Base_dDiag.C_Check_ErrC (dtb__30))
  | _ -> failwith "DT: impossible branch"
)) (((((v_collectBlockBody (fuel - 1)) (v_charsNext2 cs)) 1) B_dData_dList.C_List_Nil) (v_charsPos2 cs))) else (Base_dDiag.C_Check_OkC ({ B_dData_dPair.f_Pair_first = cs; B_dData_dPair.f_Pair_second = (B_dData_dList.v_reverse acc) }))))))) (v_charsPos cs))) ((v_charsPeekAt 1) cs))) (v_charsPeek cs)))))

# 330 "Vuna/Compiler/Frontend/Lexer.vuna"
let v_skipTriviaComments = (fun (fuel : int) (cs : t_Chars) -> (((v_skipTriviaCommentsGo fuel) B_dData_dList.C_List_Nil) cs))

# 364 "Vuna/Compiler/Frontend/Lexer.vuna"
let v_startsWithVunaAt = (fun (cs : t_Chars) -> (if (if (if (if (((v_charsPeekAt 0) cs) = 118) then (((v_charsPeekAt 1) cs) = 117) else false) then (((v_charsPeekAt 2) cs) = 110) else false) then (((v_charsPeekAt 3) cs) = 97) else false) then (((v_charsPeekAt 4) cs) = 64) else false))

# 371 "Vuna/Compiler/Frontend/Lexer.vuna"
let rec v_collectInternalIdent = (fun (fuel : int) (cs : t_Chars) (acc : int B_dData_dList.t_List) -> (if (fuel <= 0) then (Base_dDiag.v_icFuel "lexer") else (if (v_charsEmpty cs) then (Base_dDiag.C_Check_OkC ({ B_dData_dPair.f_Pair_first = (B_dData_dList.dtp_pack (B_dData_dList.v_reverse acc)); B_dData_dPair.f_Pair_second = cs })) else ((fun c -> (if (if (v_isIdentChar c) then true else (c = 64)) then (((v_collectInternalIdent (fuel - 1)) ((v_charsStep c) cs)) (B_dData_dList.C_List__x58__x58_ (c, acc))) else (Base_dDiag.C_Check_OkC ({ B_dData_dPair.f_Pair_first = (B_dData_dList.dtp_pack (B_dData_dList.v_reverse acc)); B_dData_dPair.f_Pair_second = cs })))) (v_charsPeek cs)))))

# 382 "Vuna/Compiler/Frontend/Lexer.vuna"
let rec v_collectIdent = (fun (fuel : int) (cs : t_Chars) (acc : int B_dData_dList.t_List) -> (if (fuel <= 0) then (Base_dDiag.v_icFuel "lexer") else (if (v_charsEmpty cs) then (Base_dDiag.C_Check_OkC ({ B_dData_dPair.f_Pair_first = (B_dData_dList.dtp_pack (B_dData_dList.v_reverse acc)); B_dData_dPair.f_Pair_second = cs })) else ((fun c -> (if (v_isIdentChar c) then (((v_collectIdent (fuel - 1)) ((v_charsStep c) cs)) (B_dData_dList.C_List__x58__x58_ (c, acc))) else (if (if (c = 46) then (v_isIdentStart ((v_charsPeekAt 1) cs)) else false) then (((v_collectIdent (fuel - 1)) ((v_charsStep c) cs)) (B_dData_dList.C_List__x58__x58_ (c, acc))) else (Base_dDiag.C_Check_OkC ({ B_dData_dPair.f_Pair_first = (B_dData_dList.dtp_pack (B_dData_dList.v_reverse acc)); B_dData_dPair.f_Pair_second = cs }))))) (v_charsPeek cs)))))

# 395 "Vuna/Compiler/Frontend/Lexer.vuna"
let v_maxIntLiteral = 4611686018427387903

# 400 "Vuna/Compiler/Frontend/Lexer.vuna"
let rec v_collectInt = (fun (fuel : int) (cs : t_Chars) (acc : int) -> (if (fuel <= 0) then (Base_dDiag.v_icFuel "lexer") else (if (v_charsEmpty cs) then (Base_dDiag.C_Check_OkC ({ B_dData_dPair.f_Pair_first = acc; B_dData_dPair.f_Pair_second = cs })) else ((fun c -> (if (v_isDigit c) then ((fun d -> (if (acc > (if 10 = 0 then failwith "division by zero" else (v_maxIntLiteral - d) / 10)) then ((Base_dDiagnostics_dFrontend.v_lexErr0At (v_lexSpanAt (v_charsPos cs))) Base_dDiagnostics_dFrontend.C_LexDiag_IntLiteralOutOfRange) else (((v_collectInt (fuel - 1)) ((v_charsStep c) cs)) ((acc * 10) + d)))) (c - 48)) else (Base_dDiag.C_Check_OkC ({ B_dData_dPair.f_Pair_first = acc; B_dData_dPair.f_Pair_second = cs })))) (v_charsPeek cs)))))

# 422 "Vuna/Compiler/Frontend/Lexer.vuna"
let rec v_digitRunIsFloat = (fun (fuel : int) (cs : t_Chars) -> (if (fuel <= 0) then (Base_dDiag.v_icFuel "lexer") else (if (v_charsEmpty cs) then (Base_dDiag.C_Check_OkC (false)) else ((fun c -> (if (v_isDigit c) then ((v_digitRunIsFloat (fuel - 1)) ((v_charsStep c) cs)) else (if (c = 46) then (Base_dDiag.C_Check_OkC ((v_isDigit ((v_charsPeekAt 1) cs)))) else (Base_dDiag.C_Check_OkC (false))))) (v_charsPeek cs)))))

# 447 "Vuna/Compiler/Frontend/Lexer.vuna"
let rec v_collectFrac = (fun (fuel : int) (cs : t_Chars) (acc : int B_dData_dList.t_List) -> (if (fuel <= 0) then (Base_dDiag.v_icFuel "lexer") else (if (v_charsEmpty cs) then (Base_dDiag.C_Check_OkC ({ B_dData_dPair.f_Pair_first = (B_dData_dList.dtp_pack (B_dData_dList.v_reverse acc)); B_dData_dPair.f_Pair_second = cs })) else ((fun c -> (if (v_isDigit c) then (((v_collectFrac (fuel - 1)) ((v_charsStep c) cs)) (B_dData_dList.C_List__x58__x58_ (c, acc))) else (Base_dDiag.C_Check_OkC ({ B_dData_dPair.f_Pair_first = (B_dData_dList.dtp_pack (B_dData_dList.v_reverse acc)); B_dData_dPair.f_Pair_second = cs })))) (v_charsPeek cs)))))

# 435 "Vuna/Compiler/Frontend/Lexer.vuna"
let rec v_collectFloat = (fun (fuel : int) (cs : t_Chars) (acc : int B_dData_dList.t_List) -> (if (fuel <= 0) then (Base_dDiag.v_icFuel "lexer") else (if (v_charsEmpty cs) then (Base_dDiag.C_Check_OkC ({ B_dData_dPair.f_Pair_first = (B_dData_dList.dtp_pack (B_dData_dList.v_reverse acc)); B_dData_dPair.f_Pair_second = cs })) else ((fun c -> (if (v_isDigit c) then (((v_collectFloat (fuel - 1)) ((v_charsStep c) cs)) (B_dData_dList.C_List__x58__x58_ (c, acc))) else (if (c = 46) then (((v_collectFrac (fuel - 1)) ((v_charsStep c) cs)) (B_dData_dList.C_List__x58__x58_ (c, acc))) else (Base_dDiag.C_Check_OkC ({ B_dData_dPair.f_Pair_first = (B_dData_dList.dtp_pack (B_dData_dList.v_reverse acc)); B_dData_dPair.f_Pair_second = cs }))))) (v_charsPeek cs)))))

# 458 "Vuna/Compiler/Frontend/Lexer.vuna"
let rec v_collectOp = (fun (fuel : int) (cs : t_Chars) (acc : int B_dData_dList.t_List) -> (if (fuel <= 0) then (Base_dDiag.v_icFuel "lexer") else (if (v_charsEmpty cs) then (Base_dDiag.C_Check_OkC ({ B_dData_dPair.f_Pair_first = (B_dData_dList.dtp_pack (B_dData_dList.v_reverse acc)); B_dData_dPair.f_Pair_second = cs })) else ((fun c -> (if (v_isOpChar c) then (((v_collectOp (fuel - 1)) ((v_charsStep c) cs)) (B_dData_dList.C_List__x58__x58_ (c, acc))) else (Base_dDiag.C_Check_OkC ({ B_dData_dPair.f_Pair_first = (B_dData_dList.dtp_pack (B_dData_dList.v_reverse acc)); B_dData_dPair.f_Pair_second = cs })))) (v_charsPeek cs)))))

# 481 "Vuna/Compiler/Frontend/Lexer.vuna"
let v_decodeEscape = (fun (mc0 : int) -> (if (mc0 = 110) then (B_dData_dMaybe.C_Maybe_Just (10)) else (if (mc0 = 116) then (B_dData_dMaybe.C_Maybe_Just (9)) else (if (mc0 = 114) then (B_dData_dMaybe.C_Maybe_Just (13)) else (if (mc0 = 34) then (B_dData_dMaybe.C_Maybe_Just (34)) else (if (mc0 = 92) then (B_dData_dMaybe.C_Maybe_Just (92)) else (if (mc0 = 39) then (B_dData_dMaybe.C_Maybe_Just (39)) else (if (mc0 = 36) then (B_dData_dMaybe.C_Maybe_Just (36)) else B_dData_dMaybe.C_Maybe_Nothing))))))))

# 491 "Vuna/Compiler/Frontend/Lexer.vuna"
let v_dropOpeningNewline = (fun (cs : t_Chars) -> (if (v_charsEmpty cs) then cs else ((fun c -> (if (c = 10) then ((v_charsStep c) cs) else cs)) (v_charsPeek cs))))

# 500 "Vuna/Compiler/Frontend/Lexer.vuna"
let v_flushText = (fun (mc0 : int B_dData_dList.t_List) (mc1 : t_TmplPart B_dData_dList.t_List) -> (match mc0 with
  | B_dData_dList.C_List_Nil -> mc1
  | _ -> (B_dData_dList.C_List__x58__x58_ ((C_TmplPart_TPText ((B_dData_dList.dtp_pack (B_dData_dList.v_reverse mc0)))), mc1))
))

# 566 "Vuna/Compiler/Frontend/Lexer.vuna"
let v_depthAfter = (fun (mc0 : int) (mc1 : t_Tok) -> (match mc1 with
  | C_Tok_TSym (dtb__31) -> (if (dtb__31 = "{") then (mc0 + 1) else (if (dtb__31 = "}") then (if (mc0 > 0) then (mc0 - 1) else 0) else mc0))
  | _ -> mc0
))

# 507 "Vuna/Compiler/Frontend/Lexer.vuna"
let rec v_scanTemplateText = (fun (fuel : int) (multi : bool) (cs : t_Chars) (acc : int B_dData_dList.t_List) (parts : t_TmplPart B_dData_dList.t_List) -> (if (fuel <= 0) then (Base_dDiag.v_icFuel "lexer") else (if (v_charsEmpty cs) then ((Base_dDiagnostics_dFrontend.v_lexErr0At (v_lexSpanAt (v_charsPos cs))) Base_dDiagnostics_dFrontend.C_LexDiag_UnterminatedString) else ((fun c -> ((fun c2 -> ((fun c3 -> ((fun p -> (if (c = 36) then (if (c2 = 123) then ((fun nd_uscrut9 -> (match nd_uscrut9 with
  | Base_dDiag.C_Check_OkC (dtb__32) -> (match dtb__32 with
  | { B_dData_dPair.f_Pair_first = dtb__33; B_dData_dPair.f_Pair_second = dtb__34 } -> (if ((v_charsPeek dtb__34) = 125) then (((((v_scanTemplateText (fuel - 1)) multi) (v_charsNext dtb__34)) B_dData_dList.C_List_Nil) (B_dData_dList.C_List__x58__x58_ ((C_TmplPart_TPHole (dtb__33)), ((v_flushText acc) parts)))) else ((Base_dDiagnostics_dFrontend.v_lexErr0At (v_lexSpanAt p)) Base_dDiagnostics_dFrontend.C_LexDiag_UnterminatedInterpolation))
  | _ -> failwith "DT: impossible branch"
)
  | Base_dDiag.C_Check_ErrC (dtb__35) -> (Base_dDiag.C_Check_ErrC (dtb__35))
  | _ -> failwith "DT: impossible branch"
)) ((((v_lexHoleTokens (fuel - 1)) 0) (v_charsNext2 cs)) B_dData_dList.C_List_Nil)) else (((((v_scanTemplateText (fuel - 1)) multi) ((v_charsStep c) cs)) (B_dData_dList.C_List__x58__x58_ (c, acc))) parts)) else (if (c = 92) then (if (c2 < 0) then ((Base_dDiagnostics_dFrontend.v_lexErr0At (v_lexSpanAt p)) Base_dDiagnostics_dFrontend.C_LexDiag_UnterminatedString) else (match (v_decodeEscape c2) with
  | B_dData_dMaybe.C_Maybe_Nothing -> ((Base_dDiagnostics_dFrontend.v_lexErr0At (v_lexSpanAt p)) Base_dDiagnostics_dFrontend.C_LexDiag_UnknownEscape)
  | B_dData_dMaybe.C_Maybe_Just (dtb__36) -> (((((v_scanTemplateText (fuel - 1)) multi) (v_charsNext2 cs)) (B_dData_dList.C_List__x58__x58_ (dtb__36, acc))) parts)
  | _ -> failwith "DT: impossible branch"
)) else (if (if multi then (c = 34) else false) then (if (if (c2 = 34) then (c3 = 34) else false) then ((fun pos3 -> (Base_dDiag.C_Check_OkC ({ B_dData_dPair.f_Pair_first = (B_dData_dList.v_reverse ((v_flushText acc) parts)); B_dData_dPair.f_Pair_second = { B_dData_dPair.f_Pair_first = (v_charsNext2 (v_charsNext cs)); B_dData_dPair.f_Pair_second = pos3 } }))) (v_charsPos2 cs)) else (((((v_scanTemplateText (fuel - 1)) multi) ((v_charsStep c) cs)) (B_dData_dList.C_List__x58__x58_ (c, acc))) parts)) else (if (if (B_dData_dBool.v_not multi) then (c = 34) else false) then (Base_dDiag.C_Check_OkC ({ B_dData_dPair.f_Pair_first = (B_dData_dList.v_reverse ((v_flushText acc) parts)); B_dData_dPair.f_Pair_second = { B_dData_dPair.f_Pair_first = ((v_charsStep c) cs); B_dData_dPair.f_Pair_second = p } })) else (if (if (B_dData_dBool.v_not multi) then (c = 10) else false) then ((Base_dDiagnostics_dFrontend.v_lexErr0At (v_lexSpanAt p)) Base_dDiagnostics_dFrontend.C_LexDiag_UnterminatedString) else (((((v_scanTemplateText (fuel - 1)) multi) ((v_charsStep c) cs)) (B_dData_dList.C_List__x58__x58_ (c, acc))) parts))))))) (v_charsPos cs))) ((v_charsPeekAt 2) cs))) ((v_charsPeekAt 1) cs))) (v_charsPeek cs)))))
# 547 "Vuna/Compiler/Frontend/Lexer.vuna"
and v_lexHoleTokens = (fun (fuel : int) (depth : int) (cs : t_Chars) (acc : t_PTok B_dData_dList.t_List) -> (if (fuel <= 0) then (Base_dDiag.v_icFuel "lexer") else (match ((v_skipTrivia (fuel - 1)) cs) with
  | Base_dDiag.C_Check_ErrC (dtb__37) -> (Base_dDiag.C_Check_ErrC (dtb__37))
  | Base_dDiag.C_Check_OkC (dtb__38) -> (if (v_charsEmpty dtb__38) then ((Base_dDiagnostics_dFrontend.v_lexErr0At (v_lexSpanAt (v_charsPos dtb__38))) Base_dDiagnostics_dFrontend.C_LexDiag_UnterminatedInterpolation) else (if (if ((v_charsPeek dtb__38) = 125) then (depth = 0) else false) then (Base_dDiag.C_Check_OkC ({ B_dData_dPair.f_Pair_first = (B_dData_dList.v_reverse acc); B_dData_dPair.f_Pair_second = dtb__38 })) else ((fun nd_uscrut6 -> (match nd_uscrut6 with
  | Base_dDiag.C_Check_OkC (dtb__39) -> (match dtb__39 with
  | { B_dData_dPair.f_Pair_first = dtb__40; B_dData_dPair.f_Pair_second = dtb__41 } -> ((((v_lexHoleTokens (fuel - 1)) ((v_depthAfter depth) (dtb__40).f_PTok_ptokTok)) dtb__41) (B_dData_dList.C_List__x58__x58_ (((v_setTokEnd dtb__41) dtb__40), acc)))
  | _ -> failwith "DT: impossible branch"
)
  | Base_dDiag.C_Check_ErrC (dtb__42) -> (Base_dDiag.C_Check_ErrC (dtb__42))
  | _ -> failwith "DT: impossible branch"
)) ((v_lexOneToken (fuel - 1)) dtb__38))))
  | _ -> failwith "DT: impossible branch"
)))
# 572 "Vuna/Compiler/Frontend/Lexer.vuna"
and v_lexOneToken = (fun (fuel : int) (cs : t_Chars) -> (if (fuel <= 0) then (Base_dDiag.v_icFuel "lexer") else (if (v_charsEmpty cs) then (Base_dDiag.v_icInternal "lexOneToken on empty input") else ((fun c -> ((fun p -> ((fun next -> (if (if (c = 64) then (v_startsWithVunaAt next) else false) then ((fun nd_uscrut5 -> (match nd_uscrut5 with
  | Base_dDiag.C_Check_OkC (dtb__43) -> (match dtb__43 with
  | { B_dData_dPair.f_Pair_first = dtb__44; B_dData_dPair.f_Pair_second = dtb__45 } -> (Base_dDiag.C_Check_OkC ({ B_dData_dPair.f_Pair_first = { f_PTok_ptokTok = (v_classifyIdent dtb__44); f_PTok_ptokPos = p }; B_dData_dPair.f_Pair_second = dtb__45 }))
  | _ -> failwith "DT: impossible branch"
)
  | Base_dDiag.C_Check_ErrC (dtb__46) -> (Base_dDiag.C_Check_ErrC (dtb__46))
  | _ -> failwith "DT: impossible branch"
)) (((v_collectInternalIdent (fuel - 1)) next) (B_dData_dList.C_List__x58__x58_ (c, B_dData_dList.C_List_Nil)))) else (if (v_isIdentStart c) then ((fun nd_uscrut5 -> (match nd_uscrut5 with
  | Base_dDiag.C_Check_OkC (dtb__47) -> (match dtb__47 with
  | { B_dData_dPair.f_Pair_first = dtb__48; B_dData_dPair.f_Pair_second = dtb__49 } -> (Base_dDiag.C_Check_OkC ({ B_dData_dPair.f_Pair_first = { f_PTok_ptokTok = (v_classifyIdent dtb__48); f_PTok_ptokPos = p }; B_dData_dPair.f_Pair_second = dtb__49 }))
  | _ -> failwith "DT: impossible branch"
)
  | Base_dDiag.C_Check_ErrC (dtb__50) -> (Base_dDiag.C_Check_ErrC (dtb__50))
  | _ -> failwith "DT: impossible branch"
)) (((v_collectIdent (fuel - 1)) next) (B_dData_dList.C_List__x58__x58_ (c, B_dData_dList.C_List_Nil)))) else (if (v_isDigit c) then ((fun nd_uscrut5 -> (match nd_uscrut5 with
  | Base_dDiag.C_Check_OkC (dtb__51) -> (if dtb__51 then ((fun nd_uscrut8 -> (match nd_uscrut8 with
  | Base_dDiag.C_Check_OkC (dtb__52) -> (match dtb__52 with
  | { B_dData_dPair.f_Pair_first = dtb__53; B_dData_dPair.f_Pair_second = dtb__54 } -> (Base_dDiag.C_Check_OkC ({ B_dData_dPair.f_Pair_first = { f_PTok_ptokTok = (C_Tok_TFloat (dtb__53)); f_PTok_ptokPos = p }; B_dData_dPair.f_Pair_second = dtb__54 }))
  | _ -> failwith "DT: impossible branch"
)
  | Base_dDiag.C_Check_ErrC (dtb__55) -> (Base_dDiag.C_Check_ErrC (dtb__55))
  | _ -> failwith "DT: impossible branch"
)) (((v_collectFloat (fuel - 1)) next) (B_dData_dList.C_List__x58__x58_ (c, B_dData_dList.C_List_Nil)))) else ((fun nd_uscrut8 -> (match nd_uscrut8 with
  | Base_dDiag.C_Check_OkC (dtb__56) -> (match dtb__56 with
  | { B_dData_dPair.f_Pair_first = dtb__57; B_dData_dPair.f_Pair_second = dtb__58 } -> (Base_dDiag.C_Check_OkC ({ B_dData_dPair.f_Pair_first = { f_PTok_ptokTok = (C_Tok_TInt (dtb__57)); f_PTok_ptokPos = p }; B_dData_dPair.f_Pair_second = dtb__58 }))
  | _ -> failwith "DT: impossible branch"
)
  | Base_dDiag.C_Check_ErrC (dtb__59) -> (Base_dDiag.C_Check_ErrC (dtb__59))
  | _ -> failwith "DT: impossible branch"
)) (((v_collectInt (fuel - 1)) next) (c - 48))))
  | Base_dDiag.C_Check_ErrC (dtb__60) -> (Base_dDiag.C_Check_ErrC (dtb__60))
  | _ -> failwith "DT: impossible branch"
)) ((v_digitRunIsFloat (fuel - 1)) next)) else (if (c = 34) then (((v_lexStringToken (fuel - 1)) next) p) else (if (if (if (if (if (if (if (c = 40) then true else (c = 41)) then true else (c = 91)) then true else (c = 93)) then true else (c = 44)) then true else (c = 123)) then true else (c = 125)) then (Base_dDiag.C_Check_OkC ({ B_dData_dPair.f_Pair_first = { f_PTok_ptokTok = (C_Tok_TSym ((B_dData_dList.dtp_pack (B_dData_dList.C_List__x58__x58_ (c, B_dData_dList.C_List_Nil))))); f_PTok_ptokPos = p }; B_dData_dPair.f_Pair_second = next })) else (if (c = 96) then (Base_dDiag.C_Check_OkC ({ B_dData_dPair.f_Pair_first = { f_PTok_ptokTok = (C_Tok_TSym ("`")); f_PTok_ptokPos = p }; B_dData_dPair.f_Pair_second = next })) else (if (v_isOpChar c) then ((fun nd_uscrut5 -> (match nd_uscrut5 with
  | Base_dDiag.C_Check_OkC (dtb__61) -> (match dtb__61 with
  | { B_dData_dPair.f_Pair_first = dtb__62; B_dData_dPair.f_Pair_second = dtb__63 } -> (Base_dDiag.C_Check_OkC ({ B_dData_dPair.f_Pair_first = { f_PTok_ptokTok = (C_Tok_TSym (dtb__62)); f_PTok_ptokPos = p }; B_dData_dPair.f_Pair_second = dtb__63 }))
  | _ -> failwith "DT: impossible branch"
)
  | Base_dDiag.C_Check_ErrC (dtb__64) -> (Base_dDiag.C_Check_ErrC (dtb__64))
  | _ -> failwith "DT: impossible branch"
)) (((v_collectOp (fuel - 1)) next) (B_dData_dList.C_List__x58__x58_ (c, B_dData_dList.C_List_Nil)))) else ((Base_dDiagnostics_dFrontend.v_lexErr0At (v_lexSpanAt p)) Base_dDiagnostics_dFrontend.C_LexDiag_UnexpectedCharacter))))))))) ((v_charsStep c) cs))) (v_charsPos cs))) (v_charsPeek cs)))))
# 619 "Vuna/Compiler/Frontend/Lexer.vuna"
and v_lexStringToken = (fun (fuel : int) (cs : t_Chars) (p : Base_dSource.t_Pos) -> (if (fuel <= 0) then (Base_dDiag.v_icFuel "lexer") else (if (if ((v_charsPeek cs) = 34) then (((v_charsPeekAt 1) cs) = 34) else false) then ((fun nd_uscrut3 -> (match nd_uscrut3 with
  | Base_dDiag.C_Check_OkC (dtb__65) -> (match dtb__65 with
  | { B_dData_dPair.f_Pair_first = dtb__66; B_dData_dPair.f_Pair_second = dtb__67 } -> (match dtb__67 with
  | { B_dData_dPair.f_Pair_first = dtb__68; B_dData_dPair.f_Pair_second = dtb__69 } -> (Base_dDiag.C_Check_OkC ({ B_dData_dPair.f_Pair_first = { f_PTok_ptokTok = (C_Tok_TTmpl (true, dtb__66, dtb__69)); f_PTok_ptokPos = p }; B_dData_dPair.f_Pair_second = dtb__68 }))
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
)
  | Base_dDiag.C_Check_ErrC (dtb__70) -> (Base_dDiag.C_Check_ErrC (dtb__70))
  | _ -> failwith "DT: impossible branch"
)) (((((v_scanTemplateText (fuel - 1)) true) (v_dropOpeningNewline (v_charsNext2 cs))) B_dData_dList.C_List_Nil) B_dData_dList.C_List_Nil)) else (((v_lexSingleStringToken (fuel - 1)) cs) p))))
# 630 "Vuna/Compiler/Frontend/Lexer.vuna"
and v_lexSingleStringToken = (fun (fuel : int) (body : t_Chars) (p : Base_dSource.t_Pos) -> (if (fuel <= 0) then (Base_dDiag.v_icFuel "lexer") else ((fun nd_uscrut3 -> (match nd_uscrut3 with
  | Base_dDiag.C_Check_OkC (dtb__71) -> (match dtb__71 with
  | { B_dData_dPair.f_Pair_first = dtb__72; B_dData_dPair.f_Pair_second = dtb__73 } -> (match dtb__73 with
  | { B_dData_dPair.f_Pair_first = dtb__74; B_dData_dPair.f_Pair_second = dtb__75 } -> ((fun nd_uscrut14 -> (match nd_uscrut14 with
  | B_dData_dList.C_List__x58__x58_ (dtb__76, dtb__77) -> (match dtb__76 with
  | C_TmplPart_TPText (dtb__78) -> (match dtb__77 with
  | B_dData_dList.C_List_Nil -> (Base_dDiag.C_Check_OkC ({ B_dData_dPair.f_Pair_first = { f_PTok_ptokTok = (C_Tok_TStr (dtb__78)); f_PTok_ptokPos = p }; B_dData_dPair.f_Pair_second = dtb__74 }))
  | _ -> (Base_dDiag.C_Check_OkC ({ B_dData_dPair.f_Pair_first = { f_PTok_ptokTok = (C_Tok_TTmpl (false, dtb__72, dtb__75)); f_PTok_ptokPos = p }; B_dData_dPair.f_Pair_second = dtb__74 }))
)
  | _ -> (Base_dDiag.C_Check_OkC ({ B_dData_dPair.f_Pair_first = { f_PTok_ptokTok = (C_Tok_TTmpl (false, dtb__72, dtb__75)); f_PTok_ptokPos = p }; B_dData_dPair.f_Pair_second = dtb__74 }))
)
  | _ -> (Base_dDiag.C_Check_OkC ({ B_dData_dPair.f_Pair_first = { f_PTok_ptokTok = (C_Tok_TTmpl (false, dtb__72, dtb__75)); f_PTok_ptokPos = p }; B_dData_dPair.f_Pair_second = dtb__74 }))
)) dtb__72)
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
)
  | Base_dDiag.C_Check_ErrC (dtb__79) -> (Base_dDiag.C_Check_ErrC (dtb__79))
  | _ -> failwith "DT: impossible branch"
)) (((((v_scanTemplateText (fuel - 1)) false) body) B_dData_dList.C_List_Nil) B_dData_dList.C_List_Nil))))

# 656 "Vuna/Compiler/Frontend/Lexer.vuna"
let rec v_lexCharsWithRev = (fun (fuel : int) (acc : t_Comment B_dData_dList.t_List) (toks : t_PTok B_dData_dList.t_List) (cs : t_Chars) -> (if (fuel <= 0) then (Base_dDiag.v_icFuel "lexer") else ((fun nd_uscrut4 -> (match nd_uscrut4 with
  | Base_dDiag.C_Check_OkC (dtb__80) -> (match dtb__80 with
  | { B_dData_dPair.f_Pair_first = dtb__81; B_dData_dPair.f_Pair_second = dtb__82 } -> (if (v_charsEmpty dtb__81) then (Base_dDiag.C_Check_OkC ({ B_dData_dPair.f_Pair_first = (B_dData_dList.C_List__x58__x58_ ({ f_PTok_ptokTok = C_Tok_TEof; f_PTok_ptokPos = ((v_posWithEnd (v_charsPos dtb__81)) (v_charsOffset dtb__81)) }, toks)); B_dData_dPair.f_Pair_second = (B_dData_dList.v_reverse ((B_dData_dList.v_append (B_dData_dList.v_reverse dtb__82)) acc)) })) else ((fun nd_uscrut11 -> (match nd_uscrut11 with
  | Base_dDiag.C_Check_OkC (dtb__83) -> (match dtb__83 with
  | { B_dData_dPair.f_Pair_first = dtb__84; B_dData_dPair.f_Pair_second = dtb__85 } -> ((((v_lexCharsWithRev (fuel - 1)) ((B_dData_dList.v_append (B_dData_dList.v_reverse dtb__82)) acc)) (B_dData_dList.C_List__x58__x58_ (((v_setTokEnd dtb__85) dtb__84), toks))) dtb__85)
  | _ -> failwith "DT: impossible branch"
)
  | Base_dDiag.C_Check_ErrC (dtb__86) -> (Base_dDiag.C_Check_ErrC (dtb__86))
  | _ -> failwith "DT: impossible branch"
)) ((v_lexOneToken fuel) dtb__81)))
  | _ -> failwith "DT: impossible branch"
)
  | Base_dDiag.C_Check_ErrC (dtb__87) -> (Base_dDiag.C_Check_ErrC (dtb__87))
  | _ -> failwith "DT: impossible branch"
)) ((v_skipTriviaComments fuel) cs))))

# 650 "Vuna/Compiler/Frontend/Lexer.vuna"
let v_lexCharsWith = (fun (fuel : int) (acc0 : t_Comment B_dData_dList.t_List) (cs : t_Chars) -> ((fun nd_uscrut3 -> (match nd_uscrut3 with
  | Base_dDiag.C_Check_OkC (dtb__88) -> (match dtb__88 with
  | { B_dData_dPair.f_Pair_first = dtb__89; B_dData_dPair.f_Pair_second = dtb__90 } -> (Base_dDiag.C_Check_OkC ({ B_dData_dPair.f_Pair_first = (B_dData_dList.v_reverse dtb__89); B_dData_dPair.f_Pair_second = dtb__90 }))
  | _ -> failwith "DT: impossible branch"
)
  | Base_dDiag.C_Check_ErrC (dtb__91) -> (Base_dDiag.C_Check_ErrC (dtb__91))
  | _ -> failwith "DT: impossible branch"
)) ((((v_lexCharsWithRev fuel) acc0) B_dData_dList.C_List_Nil) cs)))

# 679 "Vuna/Compiler/Frontend/Lexer.vuna"
let rec v_lexCharsRev = (fun (fuel : int) (acc : t_PTok B_dData_dList.t_List) (cs : t_Chars) -> (if (fuel <= 0) then (Base_dDiag.v_icFuel "lexer") else (match ((v_skipTrivia fuel) cs) with
  | Base_dDiag.C_Check_ErrC (dtb__92) -> (Base_dDiag.C_Check_ErrC (dtb__92))
  | Base_dDiag.C_Check_OkC (dtb__93) -> (if (v_charsEmpty dtb__93) then (Base_dDiag.C_Check_OkC ((B_dData_dList.C_List__x58__x58_ ({ f_PTok_ptokTok = C_Tok_TEof; f_PTok_ptokPos = ((v_posWithEnd (v_charsPos dtb__93)) (v_charsOffset dtb__93)) }, acc)))) else ((fun nd_uscrut5 -> (match nd_uscrut5 with
  | Base_dDiag.C_Check_OkC (dtb__94) -> (match dtb__94 with
  | { B_dData_dPair.f_Pair_first = dtb__95; B_dData_dPair.f_Pair_second = dtb__96 } -> (((v_lexCharsRev (fuel - 1)) (B_dData_dList.C_List__x58__x58_ (((v_setTokEnd dtb__96) dtb__95), acc))) dtb__96)
  | _ -> failwith "DT: impossible branch"
)
  | Base_dDiag.C_Check_ErrC (dtb__97) -> (Base_dDiag.C_Check_ErrC (dtb__97))
  | _ -> failwith "DT: impossible branch"
)) ((v_lexOneToken fuel) dtb__93)))
  | _ -> failwith "DT: impossible branch"
)))

# 673 "Vuna/Compiler/Frontend/Lexer.vuna"
let v_lexChars = (fun (fuel : int) (cs : t_Chars) -> (match (((v_lexCharsRev fuel) B_dData_dList.C_List_Nil) cs) with
  | Base_dDiag.C_Check_ErrC (dtb__98) -> (Base_dDiag.C_Check_ErrC (dtb__98))
  | Base_dDiag.C_Check_OkC (dtb__99) -> (Base_dDiag.C_Check_OkC ((B_dData_dList.v_reverse dtb__99)))
  | _ -> failwith "DT: impossible branch"
))

# 714 "Vuna/Compiler/Frontend/Lexer.vuna"
let v_sourceFuel = (fun (source : string) -> ((4 * (bi_strLength source)) + 64))

# 696 "Vuna/Compiler/Frontend/Lexer.vuna"
let v_lexSourceWithComments = (fun (source : string) -> (((v_lexCharsWith (v_sourceFuel source)) B_dData_dList.C_List_Nil) { f_Chars_charsSource = source; f_Chars_charsOffset = 0; f_Chars_charsPos = { Base_dSource.f_Pos_posLine = 1; Base_dSource.f_Pos_posCol = 1; Base_dSource.f_Pos_posOffset = 0; Base_dSource.f_Pos_posEndOffset = 0 } }))

# 699 "Vuna/Compiler/Frontend/Lexer.vuna"
let v_lexSource = (fun (source : string) -> ((v_lexChars (v_sourceFuel source)) { f_Chars_charsSource = source; f_Chars_charsOffset = 0; f_Chars_charsPos = { Base_dSource.f_Pos_posLine = 1; Base_dSource.f_Pos_posCol = 1; Base_dSource.f_Pos_posOffset = 0; Base_dSource.f_Pos_posEndOffset = 0 } }))

# 702 "Vuna/Compiler/Frontend/Lexer.vuna"
let v_lexComments = (fun (source : string) -> ((fun nd_uscrut1 -> (match nd_uscrut1 with
  | Base_dDiag.C_Check_OkC (dtb__100) -> (match dtb__100 with
  | { B_dData_dPair.f_Pair_first = dtb__101; B_dData_dPair.f_Pair_second = dtb__102 } -> (Base_dDiag.C_Check_OkC (dtb__102))
  | _ -> failwith "DT: impossible branch"
)
  | Base_dDiag.C_Check_ErrC (dtb__103) -> (Base_dDiag.C_Check_ErrC (dtb__103))
  | _ -> failwith "DT: impossible branch"
)) (v_lexSourceWithComments source)))
