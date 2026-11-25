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

# 155 "Vuna/Compiler/Frontend/Lexer.vuna"
let rec v_allOpChars = (fun (mc0 : int B_dData_dList.t_List) -> (match mc0 with
  | B_dData_dList.C_List__x58__x58_ (dtb__10, dtb__11) -> (if (v_isOpChar dtb__10) then (v_allOpChars dtb__11) else false)
  | B_dData_dList.C_List_Nil -> true
  | _ -> failwith "DT: impossible branch"
))

# 149 "Vuna/Compiler/Frontend/Lexer.vuna"
let v_isSymbolName = (fun (name : string) -> (match (B_dData_dList.dtp_unpack name) with
  | B_dData_dList.C_List_Nil -> false
  | dtb__12 -> (v_allOpChars dtb__12)
))

# 164 "Vuna/Compiler/Frontend/Lexer.vuna"
let v_isKeyword = (fun (s : string) -> (if (if (if (if (if (if (if (if (if (if (if (if (if (if (if (if (if (if (if (if (if (if (if (if (if (if (if (if (s = "data") then true else (s = "axiom")) then true else (s = "extern")) then true else (s = "case")) then true else (s = "of")) then true else (s = "let")) then true else (s = "in")) then true else (s = "if")) then true else (s = "then")) then true else (s = "else")) then true else (s = "where")) then true else (s = "linear")) then true else (s = "transparent")) then true else (s = "opaque")) then true else (s = "Type")) then true else (s = "import")) then true else (s = "module")) then true else (s = "qualified")) then true else (s = "as")) then true else (s = "record")) then true else (s = "trait")) then true else (s = "instance")) then true else (s = "deriving")) then true else (s = "do")) then true else (s = "perform")) then true else (s = "handle")) then true else (s = "infixl")) then true else (s = "infixr")) then true else (s = "infix")))

# 215 "Vuna/Compiler/Frontend/Lexer.vuna"
let v_classifyIdent = (fun (s : string) -> (if (v_isKeyword s) then (C_Tok_TKw (s)) else (C_Tok_TIdent (s))))

# 230 "Vuna/Compiler/Frontend/Lexer.vuna"
let v_commentSpan = (fun (mc0 : t_Comment) -> (match mc0 with
  | { f_Comment_commentKind = dtb__13; f_Comment_commentText = dtb__14; f_Comment_commentSpan = dtb__15 } -> dtb__15
  | _ -> failwith "DT: impossible branch"
))

# 236 "Vuna/Compiler/Frontend/Lexer.vuna"
let rec v_dropTrailingSpace = (fun (mc0 : int B_dData_dList.t_List) -> (match mc0 with
  | B_dData_dList.C_List__x58__x58_ (dtb__16, dtb__17) -> (if (if (if (dtb__16 = 32) then true else (dtb__16 = 9)) then true else (dtb__16 = 13)) then (v_dropTrailingSpace dtb__17) else (B_dData_dList.C_List__x58__x58_ (dtb__16, dtb__17)))
  | B_dData_dList.C_List_Nil -> B_dData_dList.C_List_Nil
  | _ -> failwith "DT: impossible branch"
))

# 233 "Vuna/Compiler/Frontend/Lexer.vuna"
let v_trimTrailingSpace = (fun (s : string) -> (B_dData_dList.dtp_pack (B_dData_dList.v_reverse (v_dropTrailingSpace (B_dData_dList.v_reverse (B_dData_dList.dtp_unpack s))))))

# 242 "Vuna/Compiler/Frontend/Lexer.vuna"
let rec v_collectLineBody = (fun (fuel : int) (cs : t_Chars) (acc : int B_dData_dList.t_List) (endP : Base_dSource.t_Pos) -> (if (fuel <= 0) then (Base_dDiag.v_icFuel "lexer") else (if (v_charsEmpty cs) then (Base_dDiag.C_Check_OkC ({ B_dData_dPair.f_Pair_first = (B_dData_dList.dtp_pack (B_dData_dList.v_reverse acc)); B_dData_dPair.f_Pair_second = { B_dData_dPair.f_Pair_first = cs; B_dData_dPair.f_Pair_second = endP } })) else (let c = (v_charsPeek cs) in (if (c = 10) then (Base_dDiag.C_Check_OkC ({ B_dData_dPair.f_Pair_first = (B_dData_dList.dtp_pack (B_dData_dList.v_reverse acc)); B_dData_dPair.f_Pair_second = { B_dData_dPair.f_Pair_first = cs; B_dData_dPair.f_Pair_second = endP } })) else ((((v_collectLineBody (fuel - 1)) ((v_charsStep c) cs)) (B_dData_dList.C_List__x58__x58_ (c, acc))) (v_charsPos cs)))))))

# 254 "Vuna/Compiler/Frontend/Lexer.vuna"
let rec v_collectBlockBody = (fun (fuel : int) (cs : t_Chars) (depth : int) (acc : int B_dData_dList.t_List) (endP : Base_dSource.t_Pos) -> (if (fuel <= 0) then (Base_dDiag.v_icFuel "lexer") else (if (v_charsEmpty cs) then ((Base_dDiagnostics_dFrontend.v_lexErr0At (v_lexSpanAt (v_charsPos cs))) Base_dDiagnostics_dFrontend.C_LexDiag_UnterminatedBlockComment) else (let c = (v_charsPeek cs) in (let c2 = ((v_charsPeekAt 1) cs) in (if (c2 < 0) then (((((v_collectBlockBody (fuel - 1)) ((v_charsStep c) cs)) depth) (B_dData_dList.C_List__x58__x58_ (c, acc))) (v_charsPos cs)) else (if (if (c = 123) then (c2 = 45) else false) then (((((v_collectBlockBody (fuel - 1)) (v_charsNext2 cs)) (depth + 1)) (B_dData_dList.C_List__x58__x58_ (c2, (B_dData_dList.C_List__x58__x58_ (c, acc))))) (v_charsPos2 cs)) else (if (if (c = 45) then (c2 = 125) else false) then (if (depth = 1) then (Base_dDiag.C_Check_OkC ({ B_dData_dPair.f_Pair_first = (B_dData_dList.dtp_pack (B_dData_dList.v_reverse acc)); B_dData_dPair.f_Pair_second = { B_dData_dPair.f_Pair_first = (v_charsNext2 cs); B_dData_dPair.f_Pair_second = (v_charsPos2 cs) } })) else (((((v_collectBlockBody (fuel - 1)) (v_charsNext2 cs)) (depth - 1)) (B_dData_dList.C_List__x58__x58_ (c2, (B_dData_dList.C_List__x58__x58_ (c, acc))))) (v_charsPos2 cs))) else (((((v_collectBlockBody (fuel - 1)) ((v_charsStep c) cs)) depth) (B_dData_dList.C_List__x58__x58_ (c, acc))) (v_charsPos cs))))))))))

# 267 "Vuna/Compiler/Frontend/Lexer.vuna"
let rec v_skipLineComment = (fun (fuel : int) (cs : t_Chars) -> (if (fuel <= 0) then (Base_dDiag.v_icFuel "lexer") else (if (v_charsEmpty cs) then (Base_dDiag.C_Check_OkC (cs)) else (let c = (v_charsPeek cs) in (if (c = 10) then (Base_dDiag.C_Check_OkC (cs)) else ((v_skipLineComment (fuel - 1)) ((v_charsStep c) cs)))))))

# 279 "Vuna/Compiler/Frontend/Lexer.vuna"
let rec v_skipBlockComment = (fun (fuel : int) (depth : int) (cs : t_Chars) -> (if (fuel <= 0) then (Base_dDiag.v_icFuel "lexer") else (if (v_charsEmpty cs) then ((Base_dDiagnostics_dFrontend.v_lexErr0At (v_lexSpanAt (v_charsPos cs))) Base_dDiagnostics_dFrontend.C_LexDiag_UnterminatedBlockComment) else (let c = (v_charsPeek cs) in (let c2 = ((v_charsPeekAt 1) cs) in (if (c2 < 0) then (((v_skipBlockComment (fuel - 1)) depth) ((v_charsStep c) cs)) else (if (if (c = 123) then (c2 = 45) else false) then (((v_skipBlockComment (fuel - 1)) (depth + 1)) (v_charsNext2 cs)) else (if (if (c = 45) then (c2 = 125) else false) then (if (depth = 1) then (Base_dDiag.C_Check_OkC ((v_charsNext2 cs))) else (((v_skipBlockComment (fuel - 1)) (depth - 1)) (v_charsNext2 cs))) else (((v_skipBlockComment (fuel - 1)) depth) ((v_charsStep c) cs))))))))))

# 291 "Vuna/Compiler/Frontend/Lexer.vuna"
let v_commentSpanOf = (fun (startP : Base_dSource.t_Pos) (endP : Base_dSource.t_Pos) -> { Base_dSource.f_Span_spanFile = ""; Base_dSource.f_Span_spanStartLine = (Base_dSource.v_posLine startP); Base_dSource.f_Span_spanStartCol = (Base_dSource.v_posCol startP); Base_dSource.f_Span_spanEndLine = (Base_dSource.v_posLine endP); Base_dSource.f_Span_spanEndCol = (Base_dSource.v_posCol endP); Base_dSource.f_Span_spanStartOffset = (Base_dSource.v_posOffset startP); Base_dSource.f_Span_spanEndOffset = (Base_dSource.v_posOffset endP) })

# 317 "Vuna/Compiler/Frontend/Lexer.vuna"
let rec v_skipTrivia = (fun (fuel : int) (cs : t_Chars) -> (if (fuel <= 0) then (Base_dDiag.v_icFuel "lexer") else (if (v_charsEmpty cs) then (Base_dDiag.C_Check_OkC (cs)) else (let c = (v_charsPeek cs) in (let c2 = ((v_charsPeekAt 1) cs) in (if (v_isSpace c) then ((v_skipTrivia (fuel - 1)) ((v_charsStep c) cs)) else (if (c2 < 0) then (Base_dDiag.C_Check_OkC (cs)) else (if (if (c = 45) then (c2 = 45) else false) then (match ((v_skipLineComment (fuel - 1)) ((v_charsStep c) cs)) with
  | Base_dDiag.C_Check_ErrC (dtb__18) -> (Base_dDiag.C_Check_ErrC (dtb__18))
  | Base_dDiag.C_Check_OkC (dtb__19) -> ((v_skipTrivia (fuel - 1)) dtb__19)
  | _ -> failwith "DT: impossible branch"
) else (if (if (c = 123) then (c2 = 45) else false) then (match (((v_skipBlockComment (fuel - 1)) 1) ((v_charsStep c) cs)) with
  | Base_dDiag.C_Check_ErrC (dtb__20) -> (Base_dDiag.C_Check_ErrC (dtb__20))
  | Base_dDiag.C_Check_OkC (dtb__21) -> ((v_skipTrivia (fuel - 1)) dtb__21)
  | _ -> failwith "DT: impossible branch"
) else (Base_dDiag.C_Check_OkC (cs)))))))))))

# 346 "Vuna/Compiler/Frontend/Lexer.vuna"
let rec v_skipTriviaCommentsGo = (fun (fuel : int) (acc : t_Comment B_dData_dList.t_List) (cs : t_Chars) -> (if (fuel <= 0) then (Base_dDiag.v_icFuel "lexer") else (if (v_charsEmpty cs) then (Base_dDiag.C_Check_OkC ({ B_dData_dPair.f_Pair_first = cs; B_dData_dPair.f_Pair_second = (B_dData_dList.v_reverse acc) })) else (let c = (v_charsPeek cs) in (let c2 = ((v_charsPeekAt 1) cs) in (let p = (v_charsPos cs) in (if (v_isSpace c) then (((v_skipTriviaCommentsGo (fuel - 1)) acc) ((v_charsStep c) cs)) else (if (c2 < 0) then (Base_dDiag.C_Check_OkC ({ B_dData_dPair.f_Pair_first = cs; B_dData_dPair.f_Pair_second = (B_dData_dList.v_reverse acc) })) else (if (if (c = 45) then (c2 = 45) else false) then (let nd_uscrut6 = ((((v_collectLineBody (fuel - 1)) (v_charsNext2 cs)) B_dData_dList.C_List_Nil) (v_charsPos2 cs)) in (match nd_uscrut6 with
  | Base_dDiag.C_Check_OkC (dtb__22) -> (match dtb__22 with
  | { B_dData_dPair.f_Pair_first = dtb__23; B_dData_dPair.f_Pair_second = dtb__24 } -> (match dtb__24 with
  | { B_dData_dPair.f_Pair_first = dtb__25; B_dData_dPair.f_Pair_second = dtb__26 } -> (((v_skipTriviaCommentsGo (fuel - 1)) (B_dData_dList.C_List__x58__x58_ ({ f_Comment_commentKind = C_CKind_CLine; f_Comment_commentText = (v_trimTrailingSpace dtb__23); f_Comment_commentSpan = ((v_commentSpanOf p) dtb__26) }, acc))) dtb__25)
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
)
  | Base_dDiag.C_Check_ErrC (dtb__27) -> (Base_dDiag.C_Check_ErrC (dtb__27))
  | _ -> failwith "DT: impossible branch"
)) else (if (if (c = 123) then (c2 = 45) else false) then (let nd_uscrut6 = (((((v_collectBlockBody (fuel - 1)) (v_charsNext2 cs)) 1) B_dData_dList.C_List_Nil) (v_charsPos2 cs)) in (match nd_uscrut6 with
  | Base_dDiag.C_Check_OkC (dtb__28) -> (match dtb__28 with
  | { B_dData_dPair.f_Pair_first = dtb__29; B_dData_dPair.f_Pair_second = dtb__30 } -> (match dtb__30 with
  | { B_dData_dPair.f_Pair_first = dtb__31; B_dData_dPair.f_Pair_second = dtb__32 } -> (((v_skipTriviaCommentsGo (fuel - 1)) (B_dData_dList.C_List__x58__x58_ ({ f_Comment_commentKind = C_CKind_CBlock; f_Comment_commentText = dtb__29; f_Comment_commentSpan = ((v_commentSpanOf p) dtb__32) }, acc))) dtb__31)
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
)
  | Base_dDiag.C_Check_ErrC (dtb__33) -> (Base_dDiag.C_Check_ErrC (dtb__33))
  | _ -> failwith "DT: impossible branch"
)) else (Base_dDiag.C_Check_OkC ({ B_dData_dPair.f_Pair_first = cs; B_dData_dPair.f_Pair_second = (B_dData_dList.v_reverse acc) }))))))))))))

# 343 "Vuna/Compiler/Frontend/Lexer.vuna"
let v_skipTriviaComments = (fun (fuel : int) (cs : t_Chars) -> (((v_skipTriviaCommentsGo fuel) B_dData_dList.C_List_Nil) cs))

# 377 "Vuna/Compiler/Frontend/Lexer.vuna"
let v_startsWithVunaAt = (fun (cs : t_Chars) -> (if (if (if (if (((v_charsPeekAt 0) cs) = 118) then (((v_charsPeekAt 1) cs) = 117) else false) then (((v_charsPeekAt 2) cs) = 110) else false) then (((v_charsPeekAt 3) cs) = 97) else false) then (((v_charsPeekAt 4) cs) = 64) else false))

# 384 "Vuna/Compiler/Frontend/Lexer.vuna"
let rec v_collectInternalIdent = (fun (fuel : int) (cs : t_Chars) (acc : int B_dData_dList.t_List) -> (if (fuel <= 0) then (Base_dDiag.v_icFuel "lexer") else (if (v_charsEmpty cs) then (Base_dDiag.C_Check_OkC ({ B_dData_dPair.f_Pair_first = (B_dData_dList.dtp_pack (B_dData_dList.v_reverse acc)); B_dData_dPair.f_Pair_second = cs })) else (let c = (v_charsPeek cs) in (if (if (v_isIdentChar c) then true else (c = 64)) then (((v_collectInternalIdent (fuel - 1)) ((v_charsStep c) cs)) (B_dData_dList.C_List__x58__x58_ (c, acc))) else (Base_dDiag.C_Check_OkC ({ B_dData_dPair.f_Pair_first = (B_dData_dList.dtp_pack (B_dData_dList.v_reverse acc)); B_dData_dPair.f_Pair_second = cs })))))))

# 395 "Vuna/Compiler/Frontend/Lexer.vuna"
let rec v_collectIdent = (fun (fuel : int) (cs : t_Chars) (acc : int B_dData_dList.t_List) -> (if (fuel <= 0) then (Base_dDiag.v_icFuel "lexer") else (if (v_charsEmpty cs) then (Base_dDiag.C_Check_OkC ({ B_dData_dPair.f_Pair_first = (B_dData_dList.dtp_pack (B_dData_dList.v_reverse acc)); B_dData_dPair.f_Pair_second = cs })) else (let c = (v_charsPeek cs) in (if (v_isIdentChar c) then (((v_collectIdent (fuel - 1)) ((v_charsStep c) cs)) (B_dData_dList.C_List__x58__x58_ (c, acc))) else (if (if (c = 46) then (v_isIdentStart ((v_charsPeekAt 1) cs)) else false) then (((v_collectIdent (fuel - 1)) ((v_charsStep c) cs)) (B_dData_dList.C_List__x58__x58_ (c, acc))) else (Base_dDiag.C_Check_OkC ({ B_dData_dPair.f_Pair_first = (B_dData_dList.dtp_pack (B_dData_dList.v_reverse acc)); B_dData_dPair.f_Pair_second = cs }))))))))

# 408 "Vuna/Compiler/Frontend/Lexer.vuna"
let v_maxIntLiteral = 4611686018427387903

# 413 "Vuna/Compiler/Frontend/Lexer.vuna"
let rec v_collectInt = (fun (fuel : int) (cs : t_Chars) (acc : int) -> (if (fuel <= 0) then (Base_dDiag.v_icFuel "lexer") else (if (v_charsEmpty cs) then (Base_dDiag.C_Check_OkC ({ B_dData_dPair.f_Pair_first = acc; B_dData_dPair.f_Pair_second = cs })) else (let c = (v_charsPeek cs) in (if (v_isDigit c) then (let d = (c - 48) in (if (acc > (if 10 = 0 then failwith "division by zero" else (v_maxIntLiteral - d) / 10)) then ((Base_dDiagnostics_dFrontend.v_lexErr0At (v_lexSpanAt (v_charsPos cs))) Base_dDiagnostics_dFrontend.C_LexDiag_IntLiteralOutOfRange) else (((v_collectInt (fuel - 1)) ((v_charsStep c) cs)) ((acc * 10) + d)))) else (Base_dDiag.C_Check_OkC ({ B_dData_dPair.f_Pair_first = acc; B_dData_dPair.f_Pair_second = cs })))))))

# 435 "Vuna/Compiler/Frontend/Lexer.vuna"
let rec v_digitRunIsFloat = (fun (fuel : int) (cs : t_Chars) -> (if (fuel <= 0) then (Base_dDiag.v_icFuel "lexer") else (if (v_charsEmpty cs) then (Base_dDiag.C_Check_OkC (false)) else (let c = (v_charsPeek cs) in (if (v_isDigit c) then ((v_digitRunIsFloat (fuel - 1)) ((v_charsStep c) cs)) else (if (c = 46) then (Base_dDiag.C_Check_OkC ((v_isDigit ((v_charsPeekAt 1) cs)))) else (Base_dDiag.C_Check_OkC (false))))))))

# 460 "Vuna/Compiler/Frontend/Lexer.vuna"
let rec v_collectFrac = (fun (fuel : int) (cs : t_Chars) (acc : int B_dData_dList.t_List) -> (if (fuel <= 0) then (Base_dDiag.v_icFuel "lexer") else (if (v_charsEmpty cs) then (Base_dDiag.C_Check_OkC ({ B_dData_dPair.f_Pair_first = (B_dData_dList.dtp_pack (B_dData_dList.v_reverse acc)); B_dData_dPair.f_Pair_second = cs })) else (let c = (v_charsPeek cs) in (if (v_isDigit c) then (((v_collectFrac (fuel - 1)) ((v_charsStep c) cs)) (B_dData_dList.C_List__x58__x58_ (c, acc))) else (Base_dDiag.C_Check_OkC ({ B_dData_dPair.f_Pair_first = (B_dData_dList.dtp_pack (B_dData_dList.v_reverse acc)); B_dData_dPair.f_Pair_second = cs })))))))

# 448 "Vuna/Compiler/Frontend/Lexer.vuna"
let rec v_collectFloat = (fun (fuel : int) (cs : t_Chars) (acc : int B_dData_dList.t_List) -> (if (fuel <= 0) then (Base_dDiag.v_icFuel "lexer") else (if (v_charsEmpty cs) then (Base_dDiag.C_Check_OkC ({ B_dData_dPair.f_Pair_first = (B_dData_dList.dtp_pack (B_dData_dList.v_reverse acc)); B_dData_dPair.f_Pair_second = cs })) else (let c = (v_charsPeek cs) in (if (v_isDigit c) then (((v_collectFloat (fuel - 1)) ((v_charsStep c) cs)) (B_dData_dList.C_List__x58__x58_ (c, acc))) else (if (c = 46) then (((v_collectFrac (fuel - 1)) ((v_charsStep c) cs)) (B_dData_dList.C_List__x58__x58_ (c, acc))) else (Base_dDiag.C_Check_OkC ({ B_dData_dPair.f_Pair_first = (B_dData_dList.dtp_pack (B_dData_dList.v_reverse acc)); B_dData_dPair.f_Pair_second = cs }))))))))

# 471 "Vuna/Compiler/Frontend/Lexer.vuna"
let rec v_collectOp = (fun (fuel : int) (cs : t_Chars) (acc : int B_dData_dList.t_List) -> (if (fuel <= 0) then (Base_dDiag.v_icFuel "lexer") else (if (v_charsEmpty cs) then (Base_dDiag.C_Check_OkC ({ B_dData_dPair.f_Pair_first = (B_dData_dList.dtp_pack (B_dData_dList.v_reverse acc)); B_dData_dPair.f_Pair_second = cs })) else (let c = (v_charsPeek cs) in (if (v_isOpChar c) then (((v_collectOp (fuel - 1)) ((v_charsStep c) cs)) (B_dData_dList.C_List__x58__x58_ (c, acc))) else (Base_dDiag.C_Check_OkC ({ B_dData_dPair.f_Pair_first = (B_dData_dList.dtp_pack (B_dData_dList.v_reverse acc)); B_dData_dPair.f_Pair_second = cs })))))))

# 494 "Vuna/Compiler/Frontend/Lexer.vuna"
let v_decodeEscape = (fun (mc0 : int) -> (if (mc0 = 110) then (B_dData_dMaybe.C_Maybe_Just (10)) else (if (mc0 = 116) then (B_dData_dMaybe.C_Maybe_Just (9)) else (if (mc0 = 114) then (B_dData_dMaybe.C_Maybe_Just (13)) else (if (mc0 = 34) then (B_dData_dMaybe.C_Maybe_Just (34)) else (if (mc0 = 92) then (B_dData_dMaybe.C_Maybe_Just (92)) else (if (mc0 = 39) then (B_dData_dMaybe.C_Maybe_Just (39)) else (if (mc0 = 36) then (B_dData_dMaybe.C_Maybe_Just (36)) else B_dData_dMaybe.C_Maybe_Nothing))))))))

# 504 "Vuna/Compiler/Frontend/Lexer.vuna"
let v_dropOpeningNewline = (fun (cs : t_Chars) -> (if (v_charsEmpty cs) then cs else (let c = (v_charsPeek cs) in (if (c = 10) then ((v_charsStep c) cs) else cs))))

# 513 "Vuna/Compiler/Frontend/Lexer.vuna"
let v_flushText = (fun (mc0 : int B_dData_dList.t_List) (mc1 : t_TmplPart B_dData_dList.t_List) -> (match mc0 with
  | B_dData_dList.C_List_Nil -> mc1
  | _ -> (B_dData_dList.C_List__x58__x58_ ((C_TmplPart_TPText ((B_dData_dList.dtp_pack (B_dData_dList.v_reverse mc0)))), mc1))
))

# 579 "Vuna/Compiler/Frontend/Lexer.vuna"
let v_depthAfter = (fun (mc0 : int) (mc1 : t_Tok) -> (match mc1 with
  | C_Tok_TSym (dtb__34) -> (if (dtb__34 = "{") then (mc0 + 1) else (if (dtb__34 = "}") then (if (mc0 > 0) then (mc0 - 1) else 0) else mc0))
  | _ -> mc0
))

# 520 "Vuna/Compiler/Frontend/Lexer.vuna"
let rec v_scanTemplateText = (fun (fuel : int) (multi : bool) (cs : t_Chars) (acc : int B_dData_dList.t_List) (parts : t_TmplPart B_dData_dList.t_List) -> (if (fuel <= 0) then (Base_dDiag.v_icFuel "lexer") else (if (v_charsEmpty cs) then ((Base_dDiagnostics_dFrontend.v_lexErr0At (v_lexSpanAt (v_charsPos cs))) Base_dDiagnostics_dFrontend.C_LexDiag_UnterminatedString) else (let c = (v_charsPeek cs) in (let c2 = ((v_charsPeekAt 1) cs) in (let c3 = ((v_charsPeekAt 2) cs) in (let p = (v_charsPos cs) in (if (c = 36) then (if (c2 = 123) then (let nd_uscrut9 = ((((v_lexHoleTokens (fuel - 1)) 0) (v_charsNext2 cs)) B_dData_dList.C_List_Nil) in (match nd_uscrut9 with
  | Base_dDiag.C_Check_OkC (dtb__35) -> (match dtb__35 with
  | { B_dData_dPair.f_Pair_first = dtb__36; B_dData_dPair.f_Pair_second = dtb__37 } -> (if ((v_charsPeek dtb__37) = 125) then (((((v_scanTemplateText (fuel - 1)) multi) (v_charsNext dtb__37)) B_dData_dList.C_List_Nil) (B_dData_dList.C_List__x58__x58_ ((C_TmplPart_TPHole (dtb__36)), ((v_flushText acc) parts)))) else ((Base_dDiagnostics_dFrontend.v_lexErr0At (v_lexSpanAt p)) Base_dDiagnostics_dFrontend.C_LexDiag_UnterminatedInterpolation))
  | _ -> failwith "DT: impossible branch"
)
  | Base_dDiag.C_Check_ErrC (dtb__38) -> (Base_dDiag.C_Check_ErrC (dtb__38))
  | _ -> failwith "DT: impossible branch"
)) else (((((v_scanTemplateText (fuel - 1)) multi) ((v_charsStep c) cs)) (B_dData_dList.C_List__x58__x58_ (c, acc))) parts)) else (if (c = 92) then (if (c2 < 0) then ((Base_dDiagnostics_dFrontend.v_lexErr0At (v_lexSpanAt p)) Base_dDiagnostics_dFrontend.C_LexDiag_UnterminatedString) else (match (v_decodeEscape c2) with
  | B_dData_dMaybe.C_Maybe_Nothing -> ((Base_dDiagnostics_dFrontend.v_lexErr0At (v_lexSpanAt p)) Base_dDiagnostics_dFrontend.C_LexDiag_UnknownEscape)
  | B_dData_dMaybe.C_Maybe_Just (dtb__39) -> (((((v_scanTemplateText (fuel - 1)) multi) (v_charsNext2 cs)) (B_dData_dList.C_List__x58__x58_ (dtb__39, acc))) parts)
  | _ -> failwith "DT: impossible branch"
)) else (if (if multi then (c = 34) else false) then (if (if (c2 = 34) then (c3 = 34) else false) then (let pos3 = (v_charsPos2 cs) in (Base_dDiag.C_Check_OkC ({ B_dData_dPair.f_Pair_first = (B_dData_dList.v_reverse ((v_flushText acc) parts)); B_dData_dPair.f_Pair_second = { B_dData_dPair.f_Pair_first = (v_charsNext2 (v_charsNext cs)); B_dData_dPair.f_Pair_second = pos3 } }))) else (((((v_scanTemplateText (fuel - 1)) multi) ((v_charsStep c) cs)) (B_dData_dList.C_List__x58__x58_ (c, acc))) parts)) else (if (if (B_dData_dBool.v_not multi) then (c = 34) else false) then (Base_dDiag.C_Check_OkC ({ B_dData_dPair.f_Pair_first = (B_dData_dList.v_reverse ((v_flushText acc) parts)); B_dData_dPair.f_Pair_second = { B_dData_dPair.f_Pair_first = ((v_charsStep c) cs); B_dData_dPair.f_Pair_second = p } })) else (if (if (B_dData_dBool.v_not multi) then (c = 10) else false) then ((Base_dDiagnostics_dFrontend.v_lexErr0At (v_lexSpanAt p)) Base_dDiagnostics_dFrontend.C_LexDiag_UnterminatedString) else (((((v_scanTemplateText (fuel - 1)) multi) ((v_charsStep c) cs)) (B_dData_dList.C_List__x58__x58_ (c, acc))) parts)))))))))))))
# 560 "Vuna/Compiler/Frontend/Lexer.vuna"
and v_lexHoleTokens = (fun (fuel : int) (depth : int) (cs : t_Chars) (acc : t_PTok B_dData_dList.t_List) -> (if (fuel <= 0) then (Base_dDiag.v_icFuel "lexer") else (match ((v_skipTrivia (fuel - 1)) cs) with
  | Base_dDiag.C_Check_ErrC (dtb__40) -> (Base_dDiag.C_Check_ErrC (dtb__40))
  | Base_dDiag.C_Check_OkC (dtb__41) -> (if (v_charsEmpty dtb__41) then ((Base_dDiagnostics_dFrontend.v_lexErr0At (v_lexSpanAt (v_charsPos dtb__41))) Base_dDiagnostics_dFrontend.C_LexDiag_UnterminatedInterpolation) else (if (if ((v_charsPeek dtb__41) = 125) then (depth = 0) else false) then (Base_dDiag.C_Check_OkC ({ B_dData_dPair.f_Pair_first = (B_dData_dList.v_reverse acc); B_dData_dPair.f_Pair_second = dtb__41 })) else (let nd_uscrut6 = ((v_lexOneToken (fuel - 1)) dtb__41) in (match nd_uscrut6 with
  | Base_dDiag.C_Check_OkC (dtb__42) -> (match dtb__42 with
  | { B_dData_dPair.f_Pair_first = dtb__43; B_dData_dPair.f_Pair_second = dtb__44 } -> ((((v_lexHoleTokens (fuel - 1)) ((v_depthAfter depth) (dtb__43).f_PTok_ptokTok)) dtb__44) (B_dData_dList.C_List__x58__x58_ (((v_setTokEnd dtb__44) dtb__43), acc)))
  | _ -> failwith "DT: impossible branch"
)
  | Base_dDiag.C_Check_ErrC (dtb__45) -> (Base_dDiag.C_Check_ErrC (dtb__45))
  | _ -> failwith "DT: impossible branch"
))))
  | _ -> failwith "DT: impossible branch"
)))
# 585 "Vuna/Compiler/Frontend/Lexer.vuna"
and v_lexOneToken = (fun (fuel : int) (cs : t_Chars) -> (if (fuel <= 0) then (Base_dDiag.v_icFuel "lexer") else (if (v_charsEmpty cs) then (Base_dDiag.v_icInternal "lexOneToken on empty input") else (let c = (v_charsPeek cs) in (let p = (v_charsPos cs) in (let next = ((v_charsStep c) cs) in (if (if (c = 64) then (v_startsWithVunaAt next) else false) then (let nd_uscrut5 = (((v_collectInternalIdent (fuel - 1)) next) (B_dData_dList.C_List__x58__x58_ (c, B_dData_dList.C_List_Nil))) in (match nd_uscrut5 with
  | Base_dDiag.C_Check_OkC (dtb__46) -> (match dtb__46 with
  | { B_dData_dPair.f_Pair_first = dtb__47; B_dData_dPair.f_Pair_second = dtb__48 } -> (Base_dDiag.C_Check_OkC ({ B_dData_dPair.f_Pair_first = { f_PTok_ptokTok = (v_classifyIdent dtb__47); f_PTok_ptokPos = p }; B_dData_dPair.f_Pair_second = dtb__48 }))
  | _ -> failwith "DT: impossible branch"
)
  | Base_dDiag.C_Check_ErrC (dtb__49) -> (Base_dDiag.C_Check_ErrC (dtb__49))
  | _ -> failwith "DT: impossible branch"
)) else (if (v_isIdentStart c) then (let nd_uscrut5 = (((v_collectIdent (fuel - 1)) next) (B_dData_dList.C_List__x58__x58_ (c, B_dData_dList.C_List_Nil))) in (match nd_uscrut5 with
  | Base_dDiag.C_Check_OkC (dtb__50) -> (match dtb__50 with
  | { B_dData_dPair.f_Pair_first = dtb__51; B_dData_dPair.f_Pair_second = dtb__52 } -> (Base_dDiag.C_Check_OkC ({ B_dData_dPair.f_Pair_first = { f_PTok_ptokTok = (v_classifyIdent dtb__51); f_PTok_ptokPos = p }; B_dData_dPair.f_Pair_second = dtb__52 }))
  | _ -> failwith "DT: impossible branch"
)
  | Base_dDiag.C_Check_ErrC (dtb__53) -> (Base_dDiag.C_Check_ErrC (dtb__53))
  | _ -> failwith "DT: impossible branch"
)) else (if (v_isDigit c) then (let nd_uscrut5 = ((v_digitRunIsFloat (fuel - 1)) next) in (match nd_uscrut5 with
  | Base_dDiag.C_Check_OkC (dtb__54) -> (if dtb__54 then (let nd_uscrut8 = (((v_collectFloat (fuel - 1)) next) (B_dData_dList.C_List__x58__x58_ (c, B_dData_dList.C_List_Nil))) in (match nd_uscrut8 with
  | Base_dDiag.C_Check_OkC (dtb__55) -> (match dtb__55 with
  | { B_dData_dPair.f_Pair_first = dtb__56; B_dData_dPair.f_Pair_second = dtb__57 } -> (Base_dDiag.C_Check_OkC ({ B_dData_dPair.f_Pair_first = { f_PTok_ptokTok = (C_Tok_TFloat (dtb__56)); f_PTok_ptokPos = p }; B_dData_dPair.f_Pair_second = dtb__57 }))
  | _ -> failwith "DT: impossible branch"
)
  | Base_dDiag.C_Check_ErrC (dtb__58) -> (Base_dDiag.C_Check_ErrC (dtb__58))
  | _ -> failwith "DT: impossible branch"
)) else (let nd_uscrut8 = (((v_collectInt (fuel - 1)) next) (c - 48)) in (match nd_uscrut8 with
  | Base_dDiag.C_Check_OkC (dtb__59) -> (match dtb__59 with
  | { B_dData_dPair.f_Pair_first = dtb__60; B_dData_dPair.f_Pair_second = dtb__61 } -> (Base_dDiag.C_Check_OkC ({ B_dData_dPair.f_Pair_first = { f_PTok_ptokTok = (C_Tok_TInt (dtb__60)); f_PTok_ptokPos = p }; B_dData_dPair.f_Pair_second = dtb__61 }))
  | _ -> failwith "DT: impossible branch"
)
  | Base_dDiag.C_Check_ErrC (dtb__62) -> (Base_dDiag.C_Check_ErrC (dtb__62))
  | _ -> failwith "DT: impossible branch"
)))
  | Base_dDiag.C_Check_ErrC (dtb__63) -> (Base_dDiag.C_Check_ErrC (dtb__63))
  | _ -> failwith "DT: impossible branch"
)) else (if (c = 34) then (((v_lexStringToken (fuel - 1)) next) p) else (if (if (if (if (if (if (if (c = 40) then true else (c = 41)) then true else (c = 91)) then true else (c = 93)) then true else (c = 44)) then true else (c = 123)) then true else (c = 125)) then (Base_dDiag.C_Check_OkC ({ B_dData_dPair.f_Pair_first = { f_PTok_ptokTok = (C_Tok_TSym ((B_dData_dList.dtp_pack (B_dData_dList.C_List__x58__x58_ (c, B_dData_dList.C_List_Nil))))); f_PTok_ptokPos = p }; B_dData_dPair.f_Pair_second = next })) else (if (c = 96) then (Base_dDiag.C_Check_OkC ({ B_dData_dPair.f_Pair_first = { f_PTok_ptokTok = (C_Tok_TSym ("`")); f_PTok_ptokPos = p }; B_dData_dPair.f_Pair_second = next })) else (if (v_isOpChar c) then (let nd_uscrut5 = (((v_collectOp (fuel - 1)) next) (B_dData_dList.C_List__x58__x58_ (c, B_dData_dList.C_List_Nil))) in (match nd_uscrut5 with
  | Base_dDiag.C_Check_OkC (dtb__64) -> (match dtb__64 with
  | { B_dData_dPair.f_Pair_first = dtb__65; B_dData_dPair.f_Pair_second = dtb__66 } -> (Base_dDiag.C_Check_OkC ({ B_dData_dPair.f_Pair_first = { f_PTok_ptokTok = (C_Tok_TSym (dtb__65)); f_PTok_ptokPos = p }; B_dData_dPair.f_Pair_second = dtb__66 }))
  | _ -> failwith "DT: impossible branch"
)
  | Base_dDiag.C_Check_ErrC (dtb__67) -> (Base_dDiag.C_Check_ErrC (dtb__67))
  | _ -> failwith "DT: impossible branch"
)) else ((Base_dDiagnostics_dFrontend.v_lexErr0At (v_lexSpanAt p)) Base_dDiagnostics_dFrontend.C_LexDiag_UnexpectedCharacter))))))))))))))
# 632 "Vuna/Compiler/Frontend/Lexer.vuna"
and v_lexStringToken = (fun (fuel : int) (cs : t_Chars) (p : Base_dSource.t_Pos) -> (if (fuel <= 0) then (Base_dDiag.v_icFuel "lexer") else (if (if ((v_charsPeek cs) = 34) then (((v_charsPeekAt 1) cs) = 34) else false) then (let nd_uscrut3 = (((((v_scanTemplateText (fuel - 1)) true) (v_dropOpeningNewline (v_charsNext2 cs))) B_dData_dList.C_List_Nil) B_dData_dList.C_List_Nil) in (match nd_uscrut3 with
  | Base_dDiag.C_Check_OkC (dtb__68) -> (match dtb__68 with
  | { B_dData_dPair.f_Pair_first = dtb__69; B_dData_dPair.f_Pair_second = dtb__70 } -> (match dtb__70 with
  | { B_dData_dPair.f_Pair_first = dtb__71; B_dData_dPair.f_Pair_second = dtb__72 } -> (Base_dDiag.C_Check_OkC ({ B_dData_dPair.f_Pair_first = { f_PTok_ptokTok = (C_Tok_TTmpl (true, dtb__69, dtb__72)); f_PTok_ptokPos = p }; B_dData_dPair.f_Pair_second = dtb__71 }))
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
)
  | Base_dDiag.C_Check_ErrC (dtb__73) -> (Base_dDiag.C_Check_ErrC (dtb__73))
  | _ -> failwith "DT: impossible branch"
)) else (((v_lexSingleStringToken (fuel - 1)) cs) p))))
# 643 "Vuna/Compiler/Frontend/Lexer.vuna"
and v_lexSingleStringToken = (fun (fuel : int) (body : t_Chars) (p : Base_dSource.t_Pos) -> (if (fuel <= 0) then (Base_dDiag.v_icFuel "lexer") else (let nd_uscrut3 = (((((v_scanTemplateText (fuel - 1)) false) body) B_dData_dList.C_List_Nil) B_dData_dList.C_List_Nil) in (match nd_uscrut3 with
  | Base_dDiag.C_Check_OkC (dtb__74) -> (match dtb__74 with
  | { B_dData_dPair.f_Pair_first = dtb__75; B_dData_dPair.f_Pair_second = dtb__76 } -> (match dtb__76 with
  | { B_dData_dPair.f_Pair_first = dtb__77; B_dData_dPair.f_Pair_second = dtb__78 } -> (let nd_uscrut14 = dtb__75 in (match nd_uscrut14 with
  | B_dData_dList.C_List__x58__x58_ (dtb__79, dtb__80) -> (match dtb__79 with
  | C_TmplPart_TPText (dtb__81) -> (match dtb__80 with
  | B_dData_dList.C_List_Nil -> (Base_dDiag.C_Check_OkC ({ B_dData_dPair.f_Pair_first = { f_PTok_ptokTok = (C_Tok_TStr (dtb__81)); f_PTok_ptokPos = p }; B_dData_dPair.f_Pair_second = dtb__77 }))
  | _ -> (Base_dDiag.C_Check_OkC ({ B_dData_dPair.f_Pair_first = { f_PTok_ptokTok = (C_Tok_TTmpl (false, dtb__75, dtb__78)); f_PTok_ptokPos = p }; B_dData_dPair.f_Pair_second = dtb__77 }))
)
  | _ -> (Base_dDiag.C_Check_OkC ({ B_dData_dPair.f_Pair_first = { f_PTok_ptokTok = (C_Tok_TTmpl (false, dtb__75, dtb__78)); f_PTok_ptokPos = p }; B_dData_dPair.f_Pair_second = dtb__77 }))
)
  | _ -> (Base_dDiag.C_Check_OkC ({ B_dData_dPair.f_Pair_first = { f_PTok_ptokTok = (C_Tok_TTmpl (false, dtb__75, dtb__78)); f_PTok_ptokPos = p }; B_dData_dPair.f_Pair_second = dtb__77 }))
))
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
)
  | Base_dDiag.C_Check_ErrC (dtb__82) -> (Base_dDiag.C_Check_ErrC (dtb__82))
  | _ -> failwith "DT: impossible branch"
))))

# 669 "Vuna/Compiler/Frontend/Lexer.vuna"
let rec v_lexCharsWithRev = (fun (fuel : int) (acc : t_Comment B_dData_dList.t_List) (toks : t_PTok B_dData_dList.t_List) (cs : t_Chars) -> (if (fuel <= 0) then (Base_dDiag.v_icFuel "lexer") else (let nd_uscrut4 = ((v_skipTriviaComments fuel) cs) in (match nd_uscrut4 with
  | Base_dDiag.C_Check_OkC (dtb__83) -> (match dtb__83 with
  | { B_dData_dPair.f_Pair_first = dtb__84; B_dData_dPair.f_Pair_second = dtb__85 } -> (if (v_charsEmpty dtb__84) then (Base_dDiag.C_Check_OkC ({ B_dData_dPair.f_Pair_first = (B_dData_dList.C_List__x58__x58_ ({ f_PTok_ptokTok = C_Tok_TEof; f_PTok_ptokPos = ((v_posWithEnd (v_charsPos dtb__84)) (v_charsOffset dtb__84)) }, toks)); B_dData_dPair.f_Pair_second = (B_dData_dList.v_reverse ((B_dData_dList.v_append (B_dData_dList.v_reverse dtb__85)) acc)) })) else (let nd_uscrut11 = ((v_lexOneToken fuel) dtb__84) in (match nd_uscrut11 with
  | Base_dDiag.C_Check_OkC (dtb__86) -> (match dtb__86 with
  | { B_dData_dPair.f_Pair_first = dtb__87; B_dData_dPair.f_Pair_second = dtb__88 } -> ((((v_lexCharsWithRev (fuel - 1)) ((B_dData_dList.v_append (B_dData_dList.v_reverse dtb__85)) acc)) (B_dData_dList.C_List__x58__x58_ (((v_setTokEnd dtb__88) dtb__87), toks))) dtb__88)
  | _ -> failwith "DT: impossible branch"
)
  | Base_dDiag.C_Check_ErrC (dtb__89) -> (Base_dDiag.C_Check_ErrC (dtb__89))
  | _ -> failwith "DT: impossible branch"
)))
  | _ -> failwith "DT: impossible branch"
)
  | Base_dDiag.C_Check_ErrC (dtb__90) -> (Base_dDiag.C_Check_ErrC (dtb__90))
  | _ -> failwith "DT: impossible branch"
))))

# 663 "Vuna/Compiler/Frontend/Lexer.vuna"
let v_lexCharsWith = (fun (fuel : int) (acc0 : t_Comment B_dData_dList.t_List) (cs : t_Chars) -> (let nd_uscrut3 = ((((v_lexCharsWithRev fuel) acc0) B_dData_dList.C_List_Nil) cs) in (match nd_uscrut3 with
  | Base_dDiag.C_Check_OkC (dtb__91) -> (match dtb__91 with
  | { B_dData_dPair.f_Pair_first = dtb__92; B_dData_dPair.f_Pair_second = dtb__93 } -> (Base_dDiag.C_Check_OkC ({ B_dData_dPair.f_Pair_first = (B_dData_dList.v_reverse dtb__92); B_dData_dPair.f_Pair_second = dtb__93 }))
  | _ -> failwith "DT: impossible branch"
)
  | Base_dDiag.C_Check_ErrC (dtb__94) -> (Base_dDiag.C_Check_ErrC (dtb__94))
  | _ -> failwith "DT: impossible branch"
)))

# 692 "Vuna/Compiler/Frontend/Lexer.vuna"
let rec v_lexCharsRev = (fun (fuel : int) (acc : t_PTok B_dData_dList.t_List) (cs : t_Chars) -> (if (fuel <= 0) then (Base_dDiag.v_icFuel "lexer") else (match ((v_skipTrivia fuel) cs) with
  | Base_dDiag.C_Check_ErrC (dtb__95) -> (Base_dDiag.C_Check_ErrC (dtb__95))
  | Base_dDiag.C_Check_OkC (dtb__96) -> (if (v_charsEmpty dtb__96) then (Base_dDiag.C_Check_OkC ((B_dData_dList.C_List__x58__x58_ ({ f_PTok_ptokTok = C_Tok_TEof; f_PTok_ptokPos = ((v_posWithEnd (v_charsPos dtb__96)) (v_charsOffset dtb__96)) }, acc)))) else (let nd_uscrut5 = ((v_lexOneToken fuel) dtb__96) in (match nd_uscrut5 with
  | Base_dDiag.C_Check_OkC (dtb__97) -> (match dtb__97 with
  | { B_dData_dPair.f_Pair_first = dtb__98; B_dData_dPair.f_Pair_second = dtb__99 } -> (((v_lexCharsRev (fuel - 1)) (B_dData_dList.C_List__x58__x58_ (((v_setTokEnd dtb__99) dtb__98), acc))) dtb__99)
  | _ -> failwith "DT: impossible branch"
)
  | Base_dDiag.C_Check_ErrC (dtb__100) -> (Base_dDiag.C_Check_ErrC (dtb__100))
  | _ -> failwith "DT: impossible branch"
)))
  | _ -> failwith "DT: impossible branch"
)))

# 686 "Vuna/Compiler/Frontend/Lexer.vuna"
let v_lexChars = (fun (fuel : int) (cs : t_Chars) -> (match (((v_lexCharsRev fuel) B_dData_dList.C_List_Nil) cs) with
  | Base_dDiag.C_Check_ErrC (dtb__101) -> (Base_dDiag.C_Check_ErrC (dtb__101))
  | Base_dDiag.C_Check_OkC (dtb__102) -> (Base_dDiag.C_Check_OkC ((B_dData_dList.v_reverse dtb__102)))
  | _ -> failwith "DT: impossible branch"
))

# 727 "Vuna/Compiler/Frontend/Lexer.vuna"
let v_sourceFuel = (fun (source : string) -> ((4 * (bi_strLength source)) + 64))

# 709 "Vuna/Compiler/Frontend/Lexer.vuna"
let v_lexSourceWithComments = (fun (source : string) -> (((v_lexCharsWith (v_sourceFuel source)) B_dData_dList.C_List_Nil) { f_Chars_charsSource = source; f_Chars_charsOffset = 0; f_Chars_charsPos = { Base_dSource.f_Pos_posLine = 1; Base_dSource.f_Pos_posCol = 1; Base_dSource.f_Pos_posOffset = 0; Base_dSource.f_Pos_posEndOffset = 0 } }))

# 712 "Vuna/Compiler/Frontend/Lexer.vuna"
let v_lexSource = (fun (source : string) -> ((v_lexChars (v_sourceFuel source)) { f_Chars_charsSource = source; f_Chars_charsOffset = 0; f_Chars_charsPos = { Base_dSource.f_Pos_posLine = 1; Base_dSource.f_Pos_posCol = 1; Base_dSource.f_Pos_posOffset = 0; Base_dSource.f_Pos_posEndOffset = 0 } }))

# 715 "Vuna/Compiler/Frontend/Lexer.vuna"
let v_lexComments = (fun (source : string) -> (let nd_uscrut1 = (v_lexSourceWithComments source) in (match nd_uscrut1 with
  | Base_dDiag.C_Check_OkC (dtb__103) -> (match dtb__103 with
  | { B_dData_dPair.f_Pair_first = dtb__104; B_dData_dPair.f_Pair_second = dtb__105 } -> (Base_dDiag.C_Check_OkC (dtb__105))
  | _ -> failwith "DT: impossible branch"
)
  | Base_dDiag.C_Check_ErrC (dtb__106) -> (Base_dDiag.C_Check_ErrC (dtb__106))
  | _ -> failwith "DT: impossible branch"
)))

# 42 "Vuna/Compiler/Frontend/Lexer.vuna"
let v_ptokTok = (fun (p : t_PTok) -> (p).f_PTok_ptokTok)

# 43 "Vuna/Compiler/Frontend/Lexer.vuna"
let v_ptokPos = (fun (p : t_PTok) -> (p).f_PTok_ptokPos)

# 225 "Vuna/Compiler/Frontend/Lexer.vuna"
let v_commentKind = (fun (p : t_Comment) -> (p).f_Comment_commentKind)

# 226 "Vuna/Compiler/Frontend/Lexer.vuna"
let v_commentText = (fun (p : t_Comment) -> (p).f_Comment_commentText)
