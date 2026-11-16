open Vuna_runtime
type t_Vuna_dCompiler_dFrontend_dLexer_dTmplPart = C_Vuna_dCompiler_dFrontend_dLexer_dTmplPart_TPText of (string) | C_Vuna_dCompiler_dFrontend_dLexer_dTmplPart_TPHole of (t_Vuna_dCompiler_dFrontend_dLexer_dPTok Base_dList.t_Base_dList_dList)
and t_Vuna_dCompiler_dFrontend_dLexer_dTok = C_Vuna_dCompiler_dFrontend_dLexer_dTok_TIdent of (string) | C_Vuna_dCompiler_dFrontend_dLexer_dTok_TKw of (string) | C_Vuna_dCompiler_dFrontend_dLexer_dTok_TInt of (int) | C_Vuna_dCompiler_dFrontend_dLexer_dTok_TStr of (string) | C_Vuna_dCompiler_dFrontend_dLexer_dTok_TTmpl of (bool) * (t_Vuna_dCompiler_dFrontend_dLexer_dTmplPart Base_dList.t_Base_dList_dList) * (Vuna_dCompiler_dBase_dSource.t_Vuna_dCompiler_dBase_dSource_dPos) | C_Vuna_dCompiler_dFrontend_dLexer_dTok_TSym of (string) | C_Vuna_dCompiler_dFrontend_dLexer_dTok_TEof | C_Vuna_dCompiler_dFrontend_dLexer_dTok_TFloat of (string)
and t_Vuna_dCompiler_dFrontend_dLexer_dPTok = { f_Vuna_dCompiler_dFrontend_dLexer_dPTok_ptokTok : t_Vuna_dCompiler_dFrontend_dLexer_dTok; f_Vuna_dCompiler_dFrontend_dLexer_dPTok_ptokPos : Vuna_dCompiler_dBase_dSource.t_Vuna_dCompiler_dBase_dSource_dPos }
and t_Vuna_dCompiler_dFrontend_dLexer_dChars = { f_Vuna_dCompiler_dFrontend_dLexer_dChars_charsSource : string; f_Vuna_dCompiler_dFrontend_dLexer_dChars_charsOffset : int; f_Vuna_dCompiler_dFrontend_dLexer_dChars_charsPos : Vuna_dCompiler_dBase_dSource.t_Vuna_dCompiler_dBase_dSource_dPos }
and t_Vuna_dCompiler_dFrontend_dLexer_dCKind = C_Vuna_dCompiler_dFrontend_dLexer_dCKind_CLine | C_Vuna_dCompiler_dFrontend_dLexer_dCKind_CBlock
and t_Vuna_dCompiler_dFrontend_dLexer_dComment = { f_Vuna_dCompiler_dFrontend_dLexer_dComment_commentKind : t_Vuna_dCompiler_dFrontend_dLexer_dCKind; f_Vuna_dCompiler_dFrontend_dLexer_dComment_commentText : string; f_Vuna_dCompiler_dFrontend_dLexer_dComment_commentSpan : Vuna_dCompiler_dBase_dSource.t_Vuna_dCompiler_dBase_dSource_dSpan }

# 51 "Vuna/Compiler/Frontend/Lexer.vuna"
let v_Vuna_dCompiler_dFrontend_dLexer_dcharsSource = (fun cs -> (cs).f_Vuna_dCompiler_dFrontend_dLexer_dChars_charsSource)

# 54 "Vuna/Compiler/Frontend/Lexer.vuna"
let v_Vuna_dCompiler_dFrontend_dLexer_dcharsOffset = (fun cs -> (cs).f_Vuna_dCompiler_dFrontend_dLexer_dChars_charsOffset)

# 57 "Vuna/Compiler/Frontend/Lexer.vuna"
let v_Vuna_dCompiler_dFrontend_dLexer_dcharsPos = (fun cs -> (cs).f_Vuna_dCompiler_dFrontend_dLexer_dChars_charsPos)

# 61 "Vuna/Compiler/Frontend/Lexer.vuna"
let v_Vuna_dCompiler_dFrontend_dLexer_dcharsEmpty = (fun cs -> ((cs).f_Vuna_dCompiler_dFrontend_dLexer_dChars_charsOffset >= (bi_strLength (cs).f_Vuna_dCompiler_dFrontend_dLexer_dChars_charsSource)))

# 64 "Vuna/Compiler/Frontend/Lexer.vuna"
let v_Vuna_dCompiler_dFrontend_dLexer_dcharsPeek = (fun cs -> ((dtp_strAt (cs).f_Vuna_dCompiler_dFrontend_dLexer_dChars_charsSource) (cs).f_Vuna_dCompiler_dFrontend_dLexer_dChars_charsOffset))

# 67 "Vuna/Compiler/Frontend/Lexer.vuna"
let v_Vuna_dCompiler_dFrontend_dLexer_dcharsPeekAt = (fun k cs -> ((dtp_strAt (cs).f_Vuna_dCompiler_dFrontend_dLexer_dChars_charsSource) ((cs).f_Vuna_dCompiler_dFrontend_dLexer_dChars_charsOffset + k)))

# 88 "Vuna/Compiler/Frontend/Lexer.vuna"
let v_Vuna_dCompiler_dFrontend_dLexer_dlexSpanAt = (fun mc0 -> (match mc0 with
  | { Vuna_dCompiler_dBase_dSource.f_Vuna_dCompiler_dBase_dSource_dPos_posLine = dtb__0; Vuna_dCompiler_dBase_dSource.f_Vuna_dCompiler_dBase_dSource_dPos_posCol = dtb__1 } -> { Vuna_dCompiler_dBase_dSource.f_Vuna_dCompiler_dBase_dSource_dSpan_spanFile = ""; Vuna_dCompiler_dBase_dSource.f_Vuna_dCompiler_dBase_dSource_dSpan_spanStartLine = dtb__0; Vuna_dCompiler_dBase_dSource.f_Vuna_dCompiler_dBase_dSource_dSpan_spanStartCol = dtb__1; Vuna_dCompiler_dBase_dSource.f_Vuna_dCompiler_dBase_dSource_dSpan_spanEndLine = dtb__0; Vuna_dCompiler_dBase_dSource.f_Vuna_dCompiler_dBase_dSource_dSpan_spanEndCol = dtb__1 }
  | _ -> failwith "DT: impossible branch"
))

# 91 "Vuna/Compiler/Frontend/Lexer.vuna"
let v_Vuna_dCompiler_dFrontend_dLexer_dadvanceChar = (fun mc0 mc1 -> (match mc1 with
  | { Vuna_dCompiler_dBase_dSource.f_Vuna_dCompiler_dBase_dSource_dPos_posLine = dtb__2; Vuna_dCompiler_dBase_dSource.f_Vuna_dCompiler_dBase_dSource_dPos_posCol = dtb__3 } -> (if (mc0 = 10) then { Vuna_dCompiler_dBase_dSource.f_Vuna_dCompiler_dBase_dSource_dPos_posLine = (dtb__2 + 1); Vuna_dCompiler_dBase_dSource.f_Vuna_dCompiler_dBase_dSource_dPos_posCol = 1 } else { Vuna_dCompiler_dBase_dSource.f_Vuna_dCompiler_dBase_dSource_dPos_posLine = dtb__2; Vuna_dCompiler_dBase_dSource.f_Vuna_dCompiler_dBase_dSource_dPos_posCol = (dtb__3 + 1) })
  | _ -> failwith "DT: impossible branch"
))

# 71 "Vuna/Compiler/Frontend/Lexer.vuna"
let v_Vuna_dCompiler_dFrontend_dLexer_dcharsStep = (fun c cs -> { f_Vuna_dCompiler_dFrontend_dLexer_dChars_charsSource = (cs).f_Vuna_dCompiler_dFrontend_dLexer_dChars_charsSource; f_Vuna_dCompiler_dFrontend_dLexer_dChars_charsOffset = ((cs).f_Vuna_dCompiler_dFrontend_dLexer_dChars_charsOffset + 1); f_Vuna_dCompiler_dFrontend_dLexer_dChars_charsPos = ((v_Vuna_dCompiler_dFrontend_dLexer_dadvanceChar c) (cs).f_Vuna_dCompiler_dFrontend_dLexer_dChars_charsPos) })

# 75 "Vuna/Compiler/Frontend/Lexer.vuna"
let v_Vuna_dCompiler_dFrontend_dLexer_dcharsNext = (fun cs -> ((v_Vuna_dCompiler_dFrontend_dLexer_dcharsStep (v_Vuna_dCompiler_dFrontend_dLexer_dcharsPeek cs)) cs))

# 79 "Vuna/Compiler/Frontend/Lexer.vuna"
let v_Vuna_dCompiler_dFrontend_dLexer_dcharsNext2 = (fun cs -> (v_Vuna_dCompiler_dFrontend_dLexer_dcharsNext (v_Vuna_dCompiler_dFrontend_dLexer_dcharsNext cs)))

# 83 "Vuna/Compiler/Frontend/Lexer.vuna"
let v_Vuna_dCompiler_dFrontend_dLexer_dcharsPos2 = (fun cs -> ((v_Vuna_dCompiler_dFrontend_dLexer_dadvanceChar (v_Vuna_dCompiler_dFrontend_dLexer_dcharsPeek cs)) (cs).f_Vuna_dCompiler_dFrontend_dLexer_dChars_charsPos))

# 94 "Vuna/Compiler/Frontend/Lexer.vuna"
let v_Vuna_dCompiler_dFrontend_dLexer_disUpperChar = (fun c -> (if (c >= 65) then (c <= 90) else false))

# 97 "Vuna/Compiler/Frontend/Lexer.vuna"
let v_Vuna_dCompiler_dFrontend_dLexer_disLowerChar = (fun c -> (if (c >= 97) then (c <= 122) else false))

# 100 "Vuna/Compiler/Frontend/Lexer.vuna"
let v_Vuna_dCompiler_dFrontend_dLexer_disIdentStart = (fun c -> (if (if (v_Vuna_dCompiler_dFrontend_dLexer_disUpperChar c) then true else (v_Vuna_dCompiler_dFrontend_dLexer_disLowerChar c)) then true else (c = 95)))

# 106 "Vuna/Compiler/Frontend/Lexer.vuna"
let v_Vuna_dCompiler_dFrontend_dLexer_disDigit = (fun c -> (if (c >= 48) then (c <= 57) else false))

# 103 "Vuna/Compiler/Frontend/Lexer.vuna"
let v_Vuna_dCompiler_dFrontend_dLexer_disIdentChar = (fun c -> (if (if (v_Vuna_dCompiler_dFrontend_dLexer_disIdentStart c) then true else (v_Vuna_dCompiler_dFrontend_dLexer_disDigit c)) then true else (c = 39)))

# 109 "Vuna/Compiler/Frontend/Lexer.vuna"
let v_Vuna_dCompiler_dFrontend_dLexer_disSpace = (fun c -> (if (if (if (c = 32) then true else (c = 9)) then true else (c = 10)) then true else (c = 13)))

# 112 "Vuna/Compiler/Frontend/Lexer.vuna"
let v_Vuna_dCompiler_dFrontend_dLexer_disOpChar = (fun c -> (if (if (if (if (if (if (if (if (if (if (if (if (if (if (if (if (if (if (c = 33) then true else (c = 36)) then true else (c = 37)) then true else (c = 38)) then true else (c = 42)) then true else (c = 43)) then true else (c = 45)) then true else (c = 46)) then true else (c = 47)) then true else (c = 60)) then true else (c = 61)) then true else (c = 62)) then true else (c = 63)) then true else (c = 64)) then true else (c = 92)) then true else (c = 94)) then true else (c = 124)) then true else (c = 126)) then true else (c = 58)))

# 139 "Vuna/Compiler/Frontend/Lexer.vuna"
let v_Vuna_dCompiler_dFrontend_dLexer_disKeyword = (fun s -> (if (if (if (if (if (if (if (if (if (if (if (if (if (if (if (if (if (if (if (if (if (if (if (if (if (if (if (if (s = "data") then true else (s = "axiom")) then true else (s = "extern")) then true else (s = "case")) then true else (s = "of")) then true else (s = "let")) then true else (s = "in")) then true else (s = "if")) then true else (s = "then")) then true else (s = "else")) then true else (s = "where")) then true else (s = "linear")) then true else (s = "transparent")) then true else (s = "opaque")) then true else (s = "Type")) then true else (s = "import")) then true else (s = "module")) then true else (s = "qualified")) then true else (s = "as")) then true else (s = "record")) then true else (s = "trait")) then true else (s = "instance")) then true else (s = "deriving")) then true else (s = "do")) then true else (s = "perform")) then true else (s = "handle")) then true else (s = "infixl")) then true else (s = "infixr")) then true else (s = "infix")))

# 171 "Vuna/Compiler/Frontend/Lexer.vuna"
let v_Vuna_dCompiler_dFrontend_dLexer_dclassifyIdent = (fun s -> (if (v_Vuna_dCompiler_dFrontend_dLexer_disKeyword s) then (C_Vuna_dCompiler_dFrontend_dLexer_dTok_TKw (s)) else (C_Vuna_dCompiler_dFrontend_dLexer_dTok_TIdent (s))))

# 186 "Vuna/Compiler/Frontend/Lexer.vuna"
let v_Vuna_dCompiler_dFrontend_dLexer_dcommentSpan = (fun mc0 -> (match mc0 with
  | { f_Vuna_dCompiler_dFrontend_dLexer_dComment_commentKind = dtb__4; f_Vuna_dCompiler_dFrontend_dLexer_dComment_commentText = dtb__5; f_Vuna_dCompiler_dFrontend_dLexer_dComment_commentSpan = dtb__6 } -> dtb__6
  | _ -> failwith "DT: impossible branch"
))

# 192 "Vuna/Compiler/Frontend/Lexer.vuna"
let rec v_Vuna_dCompiler_dFrontend_dLexer_ddropTrailingSpace = (fun mc0 -> (match mc0 with
  | Base_dList.C_Base_dList_dList__x58__x58_ (dtb__7, dtb__8) -> (if (if (if (dtb__7 = 32) then true else (dtb__7 = 9)) then true else (dtb__7 = 13)) then (v_Vuna_dCompiler_dFrontend_dLexer_ddropTrailingSpace dtb__8) else (Base_dList.C_Base_dList_dList__x58__x58_ (dtb__7, dtb__8)))
  | Base_dList.C_Base_dList_dList_Nil -> Base_dList.C_Base_dList_dList_Nil
  | _ -> failwith "DT: impossible branch"
))

# 189 "Vuna/Compiler/Frontend/Lexer.vuna"
let v_Vuna_dCompiler_dFrontend_dLexer_dtrimTrailingSpace = (fun s -> (Base_dList.dtp_pack (Base_dList.v_Base_dList_dreverse (v_Vuna_dCompiler_dFrontend_dLexer_ddropTrailingSpace (Base_dList.v_Base_dList_dreverse (Base_dList.dtp_unpack s))))))

# 198 "Vuna/Compiler/Frontend/Lexer.vuna"
let rec v_Vuna_dCompiler_dFrontend_dLexer_dcollectLineBody = (fun fuel cs acc endP -> (if (fuel <= 0) then (Vuna_dCompiler_dBase_dDiag.v_Vuna_dCompiler_dBase_dDiag_dicFuel "lexer") else (if (v_Vuna_dCompiler_dFrontend_dLexer_dcharsEmpty cs) then (Vuna_dCompiler_dBase_dDiag.C_Vuna_dCompiler_dBase_dDiag_dCheck_OkC ({ Base_dPair.f_Base_dPair_dPair_first = (Base_dList.dtp_pack (Base_dList.v_Base_dList_dreverse acc)); Base_dPair.f_Base_dPair_dPair_second = { Base_dPair.f_Base_dPair_dPair_first = cs; Base_dPair.f_Base_dPair_dPair_second = endP } })) else ((fun c -> (if (c = 10) then (Vuna_dCompiler_dBase_dDiag.C_Vuna_dCompiler_dBase_dDiag_dCheck_OkC ({ Base_dPair.f_Base_dPair_dPair_first = (Base_dList.dtp_pack (Base_dList.v_Base_dList_dreverse acc)); Base_dPair.f_Base_dPair_dPair_second = { Base_dPair.f_Base_dPair_dPair_first = cs; Base_dPair.f_Base_dPair_dPair_second = endP } })) else ((((v_Vuna_dCompiler_dFrontend_dLexer_dcollectLineBody (fuel - 1)) ((v_Vuna_dCompiler_dFrontend_dLexer_dcharsStep c) cs)) (Base_dList.C_Base_dList_dList__x58__x58_ (c, acc))) (v_Vuna_dCompiler_dFrontend_dLexer_dcharsPos cs)))) (v_Vuna_dCompiler_dFrontend_dLexer_dcharsPeek cs)))))

# 208 "Vuna/Compiler/Frontend/Lexer.vuna"
let rec v_Vuna_dCompiler_dFrontend_dLexer_dcollectBlockBody = (fun fuel cs depth acc endP -> (if (fuel <= 0) then (Vuna_dCompiler_dBase_dDiag.v_Vuna_dCompiler_dBase_dDiag_dicFuel "lexer") else (if (v_Vuna_dCompiler_dFrontend_dLexer_dcharsEmpty cs) then ((Vuna_dCompiler_dBase_dDiagnostics_dFrontend.v_Vuna_dCompiler_dBase_dDiagnostics_dFrontend_dlexErr0At (v_Vuna_dCompiler_dFrontend_dLexer_dlexSpanAt (v_Vuna_dCompiler_dFrontend_dLexer_dcharsPos cs))) Vuna_dCompiler_dBase_dDiagnostics_dFrontend.C_Vuna_dCompiler_dBase_dDiagnostics_dFrontend_dLexDiag_UnterminatedBlockComment) else ((fun c -> ((fun c2 -> (if (c2 < 0) then (((((v_Vuna_dCompiler_dFrontend_dLexer_dcollectBlockBody (fuel - 1)) ((v_Vuna_dCompiler_dFrontend_dLexer_dcharsStep c) cs)) depth) (Base_dList.C_Base_dList_dList__x58__x58_ (c, acc))) (v_Vuna_dCompiler_dFrontend_dLexer_dcharsPos cs)) else (if (if (c = 123) then (c2 = 45) else false) then (((((v_Vuna_dCompiler_dFrontend_dLexer_dcollectBlockBody (fuel - 1)) (v_Vuna_dCompiler_dFrontend_dLexer_dcharsNext2 cs)) (depth + 1)) (Base_dList.C_Base_dList_dList__x58__x58_ (c2, (Base_dList.C_Base_dList_dList__x58__x58_ (c, acc))))) (v_Vuna_dCompiler_dFrontend_dLexer_dcharsPos2 cs)) else (if (if (c = 45) then (c2 = 125) else false) then (if (depth = 1) then (Vuna_dCompiler_dBase_dDiag.C_Vuna_dCompiler_dBase_dDiag_dCheck_OkC ({ Base_dPair.f_Base_dPair_dPair_first = (Base_dList.dtp_pack (Base_dList.v_Base_dList_dreverse acc)); Base_dPair.f_Base_dPair_dPair_second = { Base_dPair.f_Base_dPair_dPair_first = (v_Vuna_dCompiler_dFrontend_dLexer_dcharsNext2 cs); Base_dPair.f_Base_dPair_dPair_second = (v_Vuna_dCompiler_dFrontend_dLexer_dcharsPos2 cs) } })) else (((((v_Vuna_dCompiler_dFrontend_dLexer_dcollectBlockBody (fuel - 1)) (v_Vuna_dCompiler_dFrontend_dLexer_dcharsNext2 cs)) (depth - 1)) (Base_dList.C_Base_dList_dList__x58__x58_ (c2, (Base_dList.C_Base_dList_dList__x58__x58_ (c, acc))))) (v_Vuna_dCompiler_dFrontend_dLexer_dcharsPos2 cs))) else (((((v_Vuna_dCompiler_dFrontend_dLexer_dcollectBlockBody (fuel - 1)) ((v_Vuna_dCompiler_dFrontend_dLexer_dcharsStep c) cs)) depth) (Base_dList.C_Base_dList_dList__x58__x58_ (c, acc))) (v_Vuna_dCompiler_dFrontend_dLexer_dcharsPos cs)))))) ((v_Vuna_dCompiler_dFrontend_dLexer_dcharsPeekAt 1) cs))) (v_Vuna_dCompiler_dFrontend_dLexer_dcharsPeek cs)))))

# 222 "Vuna/Compiler/Frontend/Lexer.vuna"
let rec v_Vuna_dCompiler_dFrontend_dLexer_dskipLineComment = (fun fuel cs -> (if (fuel <= 0) then (Vuna_dCompiler_dBase_dDiag.v_Vuna_dCompiler_dBase_dDiag_dicFuel "lexer") else (if (v_Vuna_dCompiler_dFrontend_dLexer_dcharsEmpty cs) then (Vuna_dCompiler_dBase_dDiag.C_Vuna_dCompiler_dBase_dDiag_dCheck_OkC (cs)) else ((fun c -> (if (c = 10) then (Vuna_dCompiler_dBase_dDiag.C_Vuna_dCompiler_dBase_dDiag_dCheck_OkC (cs)) else ((v_Vuna_dCompiler_dFrontend_dLexer_dskipLineComment (fuel - 1)) ((v_Vuna_dCompiler_dFrontend_dLexer_dcharsStep c) cs)))) (v_Vuna_dCompiler_dFrontend_dLexer_dcharsPeek cs)))))

# 231 "Vuna/Compiler/Frontend/Lexer.vuna"
let rec v_Vuna_dCompiler_dFrontend_dLexer_dskipBlockComment = (fun fuel depth cs -> (if (fuel <= 0) then (Vuna_dCompiler_dBase_dDiag.v_Vuna_dCompiler_dBase_dDiag_dicFuel "lexer") else (if (v_Vuna_dCompiler_dFrontend_dLexer_dcharsEmpty cs) then ((Vuna_dCompiler_dBase_dDiagnostics_dFrontend.v_Vuna_dCompiler_dBase_dDiagnostics_dFrontend_dlexErr0At (v_Vuna_dCompiler_dFrontend_dLexer_dlexSpanAt (v_Vuna_dCompiler_dFrontend_dLexer_dcharsPos cs))) Vuna_dCompiler_dBase_dDiagnostics_dFrontend.C_Vuna_dCompiler_dBase_dDiagnostics_dFrontend_dLexDiag_UnterminatedBlockComment) else ((fun c -> ((fun c2 -> (if (c2 < 0) then (((v_Vuna_dCompiler_dFrontend_dLexer_dskipBlockComment (fuel - 1)) depth) ((v_Vuna_dCompiler_dFrontend_dLexer_dcharsStep c) cs)) else (if (if (c = 123) then (c2 = 45) else false) then (((v_Vuna_dCompiler_dFrontend_dLexer_dskipBlockComment (fuel - 1)) (depth + 1)) (v_Vuna_dCompiler_dFrontend_dLexer_dcharsNext2 cs)) else (if (if (c = 45) then (c2 = 125) else false) then (if (depth = 1) then (Vuna_dCompiler_dBase_dDiag.C_Vuna_dCompiler_dBase_dDiag_dCheck_OkC ((v_Vuna_dCompiler_dFrontend_dLexer_dcharsNext2 cs))) else (((v_Vuna_dCompiler_dFrontend_dLexer_dskipBlockComment (fuel - 1)) (depth - 1)) (v_Vuna_dCompiler_dFrontend_dLexer_dcharsNext2 cs))) else (((v_Vuna_dCompiler_dFrontend_dLexer_dskipBlockComment (fuel - 1)) depth) ((v_Vuna_dCompiler_dFrontend_dLexer_dcharsStep c) cs)))))) ((v_Vuna_dCompiler_dFrontend_dLexer_dcharsPeekAt 1) cs))) (v_Vuna_dCompiler_dFrontend_dLexer_dcharsPeek cs)))))

# 244 "Vuna/Compiler/Frontend/Lexer.vuna"
let v_Vuna_dCompiler_dFrontend_dLexer_dcommentSpanOf = (fun startP endP -> { Vuna_dCompiler_dBase_dSource.f_Vuna_dCompiler_dBase_dSource_dSpan_spanFile = ""; Vuna_dCompiler_dBase_dSource.f_Vuna_dCompiler_dBase_dSource_dSpan_spanStartLine = (Vuna_dCompiler_dBase_dSource.v_Vuna_dCompiler_dBase_dSource_dposLine startP); Vuna_dCompiler_dBase_dSource.f_Vuna_dCompiler_dBase_dSource_dSpan_spanStartCol = (Vuna_dCompiler_dBase_dSource.v_Vuna_dCompiler_dBase_dSource_dposCol startP); Vuna_dCompiler_dBase_dSource.f_Vuna_dCompiler_dBase_dSource_dSpan_spanEndLine = (Vuna_dCompiler_dBase_dSource.v_Vuna_dCompiler_dBase_dSource_dposLine endP); Vuna_dCompiler_dBase_dSource.f_Vuna_dCompiler_dBase_dSource_dSpan_spanEndCol = (Vuna_dCompiler_dBase_dSource.v_Vuna_dCompiler_dBase_dSource_dposCol endP) })

# 262 "Vuna/Compiler/Frontend/Lexer.vuna"
let rec v_Vuna_dCompiler_dFrontend_dLexer_dskipTrivia = (fun fuel cs -> (if (fuel <= 0) then (Vuna_dCompiler_dBase_dDiag.v_Vuna_dCompiler_dBase_dDiag_dicFuel "lexer") else (if (v_Vuna_dCompiler_dFrontend_dLexer_dcharsEmpty cs) then (Vuna_dCompiler_dBase_dDiag.C_Vuna_dCompiler_dBase_dDiag_dCheck_OkC (cs)) else ((fun c -> ((fun c2 -> (if (v_Vuna_dCompiler_dFrontend_dLexer_disSpace c) then ((v_Vuna_dCompiler_dFrontend_dLexer_dskipTrivia (fuel - 1)) ((v_Vuna_dCompiler_dFrontend_dLexer_dcharsStep c) cs)) else (if (c2 < 0) then (Vuna_dCompiler_dBase_dDiag.C_Vuna_dCompiler_dBase_dDiag_dCheck_OkC (cs)) else (if (if (c = 45) then (c2 = 45) else false) then (match ((v_Vuna_dCompiler_dFrontend_dLexer_dskipLineComment (fuel - 1)) ((v_Vuna_dCompiler_dFrontend_dLexer_dcharsStep c) cs)) with
  | Vuna_dCompiler_dBase_dDiag.C_Vuna_dCompiler_dBase_dDiag_dCheck_ErrC (dtb__9) -> (Vuna_dCompiler_dBase_dDiag.C_Vuna_dCompiler_dBase_dDiag_dCheck_ErrC (dtb__9))
  | Vuna_dCompiler_dBase_dDiag.C_Vuna_dCompiler_dBase_dDiag_dCheck_OkC (dtb__10) -> ((v_Vuna_dCompiler_dFrontend_dLexer_dskipTrivia (fuel - 1)) dtb__10)
  | _ -> failwith "DT: impossible branch"
) else (if (if (c = 123) then (c2 = 45) else false) then (match (((v_Vuna_dCompiler_dFrontend_dLexer_dskipBlockComment (fuel - 1)) 1) ((v_Vuna_dCompiler_dFrontend_dLexer_dcharsStep c) cs)) with
  | Vuna_dCompiler_dBase_dDiag.C_Vuna_dCompiler_dBase_dDiag_dCheck_ErrC (dtb__11) -> (Vuna_dCompiler_dBase_dDiag.C_Vuna_dCompiler_dBase_dDiag_dCheck_ErrC (dtb__11))
  | Vuna_dCompiler_dBase_dDiag.C_Vuna_dCompiler_dBase_dDiag_dCheck_OkC (dtb__12) -> ((v_Vuna_dCompiler_dFrontend_dLexer_dskipTrivia (fuel - 1)) dtb__12)
  | _ -> failwith "DT: impossible branch"
) else (Vuna_dCompiler_dBase_dDiag.C_Vuna_dCompiler_dBase_dDiag_dCheck_OkC (cs))))))) ((v_Vuna_dCompiler_dFrontend_dLexer_dcharsPeekAt 1) cs))) (v_Vuna_dCompiler_dFrontend_dLexer_dcharsPeek cs)))))

# 283 "Vuna/Compiler/Frontend/Lexer.vuna"
let rec v_Vuna_dCompiler_dFrontend_dLexer_dskipTriviaCommentsGo = (fun fuel acc cs -> (if (fuel <= 0) then (Vuna_dCompiler_dBase_dDiag.v_Vuna_dCompiler_dBase_dDiag_dicFuel "lexer") else (if (v_Vuna_dCompiler_dFrontend_dLexer_dcharsEmpty cs) then (Vuna_dCompiler_dBase_dDiag.C_Vuna_dCompiler_dBase_dDiag_dCheck_OkC ({ Base_dPair.f_Base_dPair_dPair_first = cs; Base_dPair.f_Base_dPair_dPair_second = (Base_dList.v_Base_dList_dreverse acc) })) else ((fun c -> ((fun c2 -> ((fun p -> (if (v_Vuna_dCompiler_dFrontend_dLexer_disSpace c) then (((v_Vuna_dCompiler_dFrontend_dLexer_dskipTriviaCommentsGo (fuel - 1)) acc) ((v_Vuna_dCompiler_dFrontend_dLexer_dcharsStep c) cs)) else (if (c2 < 0) then (Vuna_dCompiler_dBase_dDiag.C_Vuna_dCompiler_dBase_dDiag_dCheck_OkC ({ Base_dPair.f_Base_dPair_dPair_first = cs; Base_dPair.f_Base_dPair_dPair_second = (Base_dList.v_Base_dList_dreverse acc) })) else (if (if (c = 45) then (c2 = 45) else false) then ((fun nd_uscrut6 -> (match nd_uscrut6 with
  | Vuna_dCompiler_dBase_dDiag.C_Vuna_dCompiler_dBase_dDiag_dCheck_OkC (dtb__13) -> (match dtb__13 with
  | { Base_dPair.f_Base_dPair_dPair_first = dtb__14; Base_dPair.f_Base_dPair_dPair_second = dtb__15 } -> (match dtb__15 with
  | { Base_dPair.f_Base_dPair_dPair_first = dtb__16; Base_dPair.f_Base_dPair_dPair_second = dtb__17 } -> (((v_Vuna_dCompiler_dFrontend_dLexer_dskipTriviaCommentsGo (fuel - 1)) (Base_dList.C_Base_dList_dList__x58__x58_ ({ f_Vuna_dCompiler_dFrontend_dLexer_dComment_commentKind = C_Vuna_dCompiler_dFrontend_dLexer_dCKind_CLine; f_Vuna_dCompiler_dFrontend_dLexer_dComment_commentText = (v_Vuna_dCompiler_dFrontend_dLexer_dtrimTrailingSpace dtb__14); f_Vuna_dCompiler_dFrontend_dLexer_dComment_commentSpan = ((v_Vuna_dCompiler_dFrontend_dLexer_dcommentSpanOf p) dtb__17) }, acc))) dtb__16)
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
)
  | Vuna_dCompiler_dBase_dDiag.C_Vuna_dCompiler_dBase_dDiag_dCheck_ErrC (dtb__18) -> (Vuna_dCompiler_dBase_dDiag.C_Vuna_dCompiler_dBase_dDiag_dCheck_ErrC (dtb__18))
  | _ -> failwith "DT: impossible branch"
)) ((((v_Vuna_dCompiler_dFrontend_dLexer_dcollectLineBody (fuel - 1)) (v_Vuna_dCompiler_dFrontend_dLexer_dcharsNext2 cs)) Base_dList.C_Base_dList_dList_Nil) (v_Vuna_dCompiler_dFrontend_dLexer_dcharsPos2 cs))) else (if (if (c = 123) then (c2 = 45) else false) then ((fun nd_uscrut6 -> (match nd_uscrut6 with
  | Vuna_dCompiler_dBase_dDiag.C_Vuna_dCompiler_dBase_dDiag_dCheck_OkC (dtb__19) -> (match dtb__19 with
  | { Base_dPair.f_Base_dPair_dPair_first = dtb__20; Base_dPair.f_Base_dPair_dPair_second = dtb__21 } -> (match dtb__21 with
  | { Base_dPair.f_Base_dPair_dPair_first = dtb__22; Base_dPair.f_Base_dPair_dPair_second = dtb__23 } -> (((v_Vuna_dCompiler_dFrontend_dLexer_dskipTriviaCommentsGo (fuel - 1)) (Base_dList.C_Base_dList_dList__x58__x58_ ({ f_Vuna_dCompiler_dFrontend_dLexer_dComment_commentKind = C_Vuna_dCompiler_dFrontend_dLexer_dCKind_CBlock; f_Vuna_dCompiler_dFrontend_dLexer_dComment_commentText = dtb__20; f_Vuna_dCompiler_dFrontend_dLexer_dComment_commentSpan = ((v_Vuna_dCompiler_dFrontend_dLexer_dcommentSpanOf p) dtb__23) }, acc))) dtb__22)
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
)
  | Vuna_dCompiler_dBase_dDiag.C_Vuna_dCompiler_dBase_dDiag_dCheck_ErrC (dtb__24) -> (Vuna_dCompiler_dBase_dDiag.C_Vuna_dCompiler_dBase_dDiag_dCheck_ErrC (dtb__24))
  | _ -> failwith "DT: impossible branch"
)) (((((v_Vuna_dCompiler_dFrontend_dLexer_dcollectBlockBody (fuel - 1)) (v_Vuna_dCompiler_dFrontend_dLexer_dcharsNext2 cs)) 1) Base_dList.C_Base_dList_dList_Nil) (v_Vuna_dCompiler_dFrontend_dLexer_dcharsPos2 cs))) else (Vuna_dCompiler_dBase_dDiag.C_Vuna_dCompiler_dBase_dDiag_dCheck_OkC ({ Base_dPair.f_Base_dPair_dPair_first = cs; Base_dPair.f_Base_dPair_dPair_second = (Base_dList.v_Base_dList_dreverse acc) }))))))) (v_Vuna_dCompiler_dFrontend_dLexer_dcharsPos cs))) ((v_Vuna_dCompiler_dFrontend_dLexer_dcharsPeekAt 1) cs))) (v_Vuna_dCompiler_dFrontend_dLexer_dcharsPeek cs)))))

# 280 "Vuna/Compiler/Frontend/Lexer.vuna"
let v_Vuna_dCompiler_dFrontend_dLexer_dskipTriviaComments = (fun fuel cs -> (((v_Vuna_dCompiler_dFrontend_dLexer_dskipTriviaCommentsGo fuel) Base_dList.C_Base_dList_dList_Nil) cs))

# 309 "Vuna/Compiler/Frontend/Lexer.vuna"
let v_Vuna_dCompiler_dFrontend_dLexer_dstartsWithVunaAt = (fun cs -> (if (if (if (if (((v_Vuna_dCompiler_dFrontend_dLexer_dcharsPeekAt 0) cs) = 118) then (((v_Vuna_dCompiler_dFrontend_dLexer_dcharsPeekAt 1) cs) = 117) else false) then (((v_Vuna_dCompiler_dFrontend_dLexer_dcharsPeekAt 2) cs) = 110) else false) then (((v_Vuna_dCompiler_dFrontend_dLexer_dcharsPeekAt 3) cs) = 97) else false) then (((v_Vuna_dCompiler_dFrontend_dLexer_dcharsPeekAt 4) cs) = 64) else false))

# 317 "Vuna/Compiler/Frontend/Lexer.vuna"
let rec v_Vuna_dCompiler_dFrontend_dLexer_dcollectInternalIdent = (fun fuel cs acc -> (if (fuel <= 0) then (Vuna_dCompiler_dBase_dDiag.v_Vuna_dCompiler_dBase_dDiag_dicFuel "lexer") else (if (v_Vuna_dCompiler_dFrontend_dLexer_dcharsEmpty cs) then (Vuna_dCompiler_dBase_dDiag.C_Vuna_dCompiler_dBase_dDiag_dCheck_OkC ({ Base_dPair.f_Base_dPair_dPair_first = (Base_dList.dtp_pack (Base_dList.v_Base_dList_dreverse acc)); Base_dPair.f_Base_dPair_dPair_second = cs })) else ((fun c -> (if (if (v_Vuna_dCompiler_dFrontend_dLexer_disIdentChar c) then true else (c = 64)) then (((v_Vuna_dCompiler_dFrontend_dLexer_dcollectInternalIdent (fuel - 1)) ((v_Vuna_dCompiler_dFrontend_dLexer_dcharsStep c) cs)) (Base_dList.C_Base_dList_dList__x58__x58_ (c, acc))) else (Vuna_dCompiler_dBase_dDiag.C_Vuna_dCompiler_dBase_dDiag_dCheck_OkC ({ Base_dPair.f_Base_dPair_dPair_first = (Base_dList.dtp_pack (Base_dList.v_Base_dList_dreverse acc)); Base_dPair.f_Base_dPair_dPair_second = cs })))) (v_Vuna_dCompiler_dFrontend_dLexer_dcharsPeek cs)))))

# 326 "Vuna/Compiler/Frontend/Lexer.vuna"
let rec v_Vuna_dCompiler_dFrontend_dLexer_dcollectIdent = (fun fuel cs acc -> (if (fuel <= 0) then (Vuna_dCompiler_dBase_dDiag.v_Vuna_dCompiler_dBase_dDiag_dicFuel "lexer") else (if (v_Vuna_dCompiler_dFrontend_dLexer_dcharsEmpty cs) then (Vuna_dCompiler_dBase_dDiag.C_Vuna_dCompiler_dBase_dDiag_dCheck_OkC ({ Base_dPair.f_Base_dPair_dPair_first = (Base_dList.dtp_pack (Base_dList.v_Base_dList_dreverse acc)); Base_dPair.f_Base_dPair_dPair_second = cs })) else ((fun c -> (if (v_Vuna_dCompiler_dFrontend_dLexer_disIdentChar c) then (((v_Vuna_dCompiler_dFrontend_dLexer_dcollectIdent (fuel - 1)) ((v_Vuna_dCompiler_dFrontend_dLexer_dcharsStep c) cs)) (Base_dList.C_Base_dList_dList__x58__x58_ (c, acc))) else (if (if (c = 46) then (v_Vuna_dCompiler_dFrontend_dLexer_disIdentStart ((v_Vuna_dCompiler_dFrontend_dLexer_dcharsPeekAt 1) cs)) else false) then (((v_Vuna_dCompiler_dFrontend_dLexer_dcollectIdent (fuel - 1)) ((v_Vuna_dCompiler_dFrontend_dLexer_dcharsStep c) cs)) (Base_dList.C_Base_dList_dList__x58__x58_ (c, acc))) else (Vuna_dCompiler_dBase_dDiag.C_Vuna_dCompiler_dBase_dDiag_dCheck_OkC ({ Base_dPair.f_Base_dPair_dPair_first = (Base_dList.dtp_pack (Base_dList.v_Base_dList_dreverse acc)); Base_dPair.f_Base_dPair_dPair_second = cs }))))) (v_Vuna_dCompiler_dFrontend_dLexer_dcharsPeek cs)))))

# 338 "Vuna/Compiler/Frontend/Lexer.vuna"
let v_Vuna_dCompiler_dFrontend_dLexer_dmaxIntLiteral = 4611686018427387903

# 343 "Vuna/Compiler/Frontend/Lexer.vuna"
let rec v_Vuna_dCompiler_dFrontend_dLexer_dcollectInt = (fun fuel cs acc -> (if (fuel <= 0) then (Vuna_dCompiler_dBase_dDiag.v_Vuna_dCompiler_dBase_dDiag_dicFuel "lexer") else (if (v_Vuna_dCompiler_dFrontend_dLexer_dcharsEmpty cs) then (Vuna_dCompiler_dBase_dDiag.C_Vuna_dCompiler_dBase_dDiag_dCheck_OkC ({ Base_dPair.f_Base_dPair_dPair_first = acc; Base_dPair.f_Base_dPair_dPair_second = cs })) else ((fun c -> (if (v_Vuna_dCompiler_dFrontend_dLexer_disDigit c) then ((fun d -> (if (acc > (if 10 = 0 then failwith "division by zero" else (v_Vuna_dCompiler_dFrontend_dLexer_dmaxIntLiteral - d) / 10)) then ((Vuna_dCompiler_dBase_dDiagnostics_dFrontend.v_Vuna_dCompiler_dBase_dDiagnostics_dFrontend_dlexErr0At (v_Vuna_dCompiler_dFrontend_dLexer_dlexSpanAt (v_Vuna_dCompiler_dFrontend_dLexer_dcharsPos cs))) Vuna_dCompiler_dBase_dDiagnostics_dFrontend.C_Vuna_dCompiler_dBase_dDiagnostics_dFrontend_dLexDiag_IntLiteralOutOfRange) else (((v_Vuna_dCompiler_dFrontend_dLexer_dcollectInt (fuel - 1)) ((v_Vuna_dCompiler_dFrontend_dLexer_dcharsStep c) cs)) ((acc * 10) + d)))) (c - 48)) else (Vuna_dCompiler_dBase_dDiag.C_Vuna_dCompiler_dBase_dDiag_dCheck_OkC ({ Base_dPair.f_Base_dPair_dPair_first = acc; Base_dPair.f_Base_dPair_dPair_second = cs })))) (v_Vuna_dCompiler_dFrontend_dLexer_dcharsPeek cs)))))

# 362 "Vuna/Compiler/Frontend/Lexer.vuna"
let rec v_Vuna_dCompiler_dFrontend_dLexer_ddigitRunIsFloat = (fun fuel cs -> (if (fuel <= 0) then (Vuna_dCompiler_dBase_dDiag.v_Vuna_dCompiler_dBase_dDiag_dicFuel "lexer") else (if (v_Vuna_dCompiler_dFrontend_dLexer_dcharsEmpty cs) then (Vuna_dCompiler_dBase_dDiag.C_Vuna_dCompiler_dBase_dDiag_dCheck_OkC (false)) else ((fun c -> (if (v_Vuna_dCompiler_dFrontend_dLexer_disDigit c) then ((v_Vuna_dCompiler_dFrontend_dLexer_ddigitRunIsFloat (fuel - 1)) ((v_Vuna_dCompiler_dFrontend_dLexer_dcharsStep c) cs)) else (if (c = 46) then (Vuna_dCompiler_dBase_dDiag.C_Vuna_dCompiler_dBase_dDiag_dCheck_OkC ((v_Vuna_dCompiler_dFrontend_dLexer_disDigit ((v_Vuna_dCompiler_dFrontend_dLexer_dcharsPeekAt 1) cs)))) else (Vuna_dCompiler_dBase_dDiag.C_Vuna_dCompiler_dBase_dDiag_dCheck_OkC (false))))) (v_Vuna_dCompiler_dFrontend_dLexer_dcharsPeek cs)))))

# 384 "Vuna/Compiler/Frontend/Lexer.vuna"
let rec v_Vuna_dCompiler_dFrontend_dLexer_dcollectFrac = (fun fuel cs acc -> (if (fuel <= 0) then (Vuna_dCompiler_dBase_dDiag.v_Vuna_dCompiler_dBase_dDiag_dicFuel "lexer") else (if (v_Vuna_dCompiler_dFrontend_dLexer_dcharsEmpty cs) then (Vuna_dCompiler_dBase_dDiag.C_Vuna_dCompiler_dBase_dDiag_dCheck_OkC ({ Base_dPair.f_Base_dPair_dPair_first = (Base_dList.dtp_pack (Base_dList.v_Base_dList_dreverse acc)); Base_dPair.f_Base_dPair_dPair_second = cs })) else ((fun c -> (if (v_Vuna_dCompiler_dFrontend_dLexer_disDigit c) then (((v_Vuna_dCompiler_dFrontend_dLexer_dcollectFrac (fuel - 1)) ((v_Vuna_dCompiler_dFrontend_dLexer_dcharsStep c) cs)) (Base_dList.C_Base_dList_dList__x58__x58_ (c, acc))) else (Vuna_dCompiler_dBase_dDiag.C_Vuna_dCompiler_dBase_dDiag_dCheck_OkC ({ Base_dPair.f_Base_dPair_dPair_first = (Base_dList.dtp_pack (Base_dList.v_Base_dList_dreverse acc)); Base_dPair.f_Base_dPair_dPair_second = cs })))) (v_Vuna_dCompiler_dFrontend_dLexer_dcharsPeek cs)))))

# 373 "Vuna/Compiler/Frontend/Lexer.vuna"
let rec v_Vuna_dCompiler_dFrontend_dLexer_dcollectFloat = (fun fuel cs acc -> (if (fuel <= 0) then (Vuna_dCompiler_dBase_dDiag.v_Vuna_dCompiler_dBase_dDiag_dicFuel "lexer") else (if (v_Vuna_dCompiler_dFrontend_dLexer_dcharsEmpty cs) then (Vuna_dCompiler_dBase_dDiag.C_Vuna_dCompiler_dBase_dDiag_dCheck_OkC ({ Base_dPair.f_Base_dPair_dPair_first = (Base_dList.dtp_pack (Base_dList.v_Base_dList_dreverse acc)); Base_dPair.f_Base_dPair_dPair_second = cs })) else ((fun c -> (if (v_Vuna_dCompiler_dFrontend_dLexer_disDigit c) then (((v_Vuna_dCompiler_dFrontend_dLexer_dcollectFloat (fuel - 1)) ((v_Vuna_dCompiler_dFrontend_dLexer_dcharsStep c) cs)) (Base_dList.C_Base_dList_dList__x58__x58_ (c, acc))) else (if (c = 46) then (((v_Vuna_dCompiler_dFrontend_dLexer_dcollectFrac (fuel - 1)) ((v_Vuna_dCompiler_dFrontend_dLexer_dcharsStep c) cs)) (Base_dList.C_Base_dList_dList__x58__x58_ (c, acc))) else (Vuna_dCompiler_dBase_dDiag.C_Vuna_dCompiler_dBase_dDiag_dCheck_OkC ({ Base_dPair.f_Base_dPair_dPair_first = (Base_dList.dtp_pack (Base_dList.v_Base_dList_dreverse acc)); Base_dPair.f_Base_dPair_dPair_second = cs }))))) (v_Vuna_dCompiler_dFrontend_dLexer_dcharsPeek cs)))))

# 393 "Vuna/Compiler/Frontend/Lexer.vuna"
let rec v_Vuna_dCompiler_dFrontend_dLexer_dcollectOp = (fun fuel cs acc -> (if (fuel <= 0) then (Vuna_dCompiler_dBase_dDiag.v_Vuna_dCompiler_dBase_dDiag_dicFuel "lexer") else (if (v_Vuna_dCompiler_dFrontend_dLexer_dcharsEmpty cs) then (Vuna_dCompiler_dBase_dDiag.C_Vuna_dCompiler_dBase_dDiag_dCheck_OkC ({ Base_dPair.f_Base_dPair_dPair_first = (Base_dList.dtp_pack (Base_dList.v_Base_dList_dreverse acc)); Base_dPair.f_Base_dPair_dPair_second = cs })) else ((fun c -> (if (v_Vuna_dCompiler_dFrontend_dLexer_disOpChar c) then (((v_Vuna_dCompiler_dFrontend_dLexer_dcollectOp (fuel - 1)) ((v_Vuna_dCompiler_dFrontend_dLexer_dcharsStep c) cs)) (Base_dList.C_Base_dList_dList__x58__x58_ (c, acc))) else (Vuna_dCompiler_dBase_dDiag.C_Vuna_dCompiler_dBase_dDiag_dCheck_OkC ({ Base_dPair.f_Base_dPair_dPair_first = (Base_dList.dtp_pack (Base_dList.v_Base_dList_dreverse acc)); Base_dPair.f_Base_dPair_dPair_second = cs })))) (v_Vuna_dCompiler_dFrontend_dLexer_dcharsPeek cs)))))

# 414 "Vuna/Compiler/Frontend/Lexer.vuna"
let v_Vuna_dCompiler_dFrontend_dLexer_ddecodeEscape = (fun mc0 -> (if (mc0 = 110) then (Base_dMaybe.C_Base_dMaybe_dMaybe_Just (10)) else (if (mc0 = 116) then (Base_dMaybe.C_Base_dMaybe_dMaybe_Just (9)) else (if (mc0 = 114) then (Base_dMaybe.C_Base_dMaybe_dMaybe_Just (13)) else (if (mc0 = 34) then (Base_dMaybe.C_Base_dMaybe_dMaybe_Just (34)) else (if (mc0 = 92) then (Base_dMaybe.C_Base_dMaybe_dMaybe_Just (92)) else (if (mc0 = 39) then (Base_dMaybe.C_Base_dMaybe_dMaybe_Just (39)) else (if (mc0 = 36) then (Base_dMaybe.C_Base_dMaybe_dMaybe_Just (36)) else Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing))))))))

# 424 "Vuna/Compiler/Frontend/Lexer.vuna"
let v_Vuna_dCompiler_dFrontend_dLexer_ddropOpeningNewline = (fun cs -> (if (v_Vuna_dCompiler_dFrontend_dLexer_dcharsEmpty cs) then cs else ((fun c -> (if (c = 10) then ((v_Vuna_dCompiler_dFrontend_dLexer_dcharsStep c) cs) else cs)) (v_Vuna_dCompiler_dFrontend_dLexer_dcharsPeek cs))))

# 431 "Vuna/Compiler/Frontend/Lexer.vuna"
let v_Vuna_dCompiler_dFrontend_dLexer_dflushText = (fun mc0 mc1 -> (match mc0 with
  | Base_dList.C_Base_dList_dList_Nil -> mc1
  | _ -> (Base_dList.C_Base_dList_dList__x58__x58_ ((C_Vuna_dCompiler_dFrontend_dLexer_dTmplPart_TPText ((Base_dList.dtp_pack (Base_dList.v_Base_dList_dreverse mc0)))), mc1))
))

# 483 "Vuna/Compiler/Frontend/Lexer.vuna"
let v_Vuna_dCompiler_dFrontend_dLexer_ddepthAfter = (fun mc0 mc1 -> (match mc1 with
  | C_Vuna_dCompiler_dFrontend_dLexer_dTok_TSym (dtb__25) -> (if (dtb__25 = "{") then (mc0 + 1) else (if (dtb__25 = "}") then (if (mc0 > 0) then (mc0 - 1) else 0) else mc0))
  | _ -> mc0
))

# 438 "Vuna/Compiler/Frontend/Lexer.vuna"
let rec v_Vuna_dCompiler_dFrontend_dLexer_dscanTemplateText = (fun fuel multi cs acc parts -> (if (fuel <= 0) then (Vuna_dCompiler_dBase_dDiag.v_Vuna_dCompiler_dBase_dDiag_dicFuel "lexer") else (if (v_Vuna_dCompiler_dFrontend_dLexer_dcharsEmpty cs) then ((Vuna_dCompiler_dBase_dDiagnostics_dFrontend.v_Vuna_dCompiler_dBase_dDiagnostics_dFrontend_dlexErr0At (v_Vuna_dCompiler_dFrontend_dLexer_dlexSpanAt (v_Vuna_dCompiler_dFrontend_dLexer_dcharsPos cs))) Vuna_dCompiler_dBase_dDiagnostics_dFrontend.C_Vuna_dCompiler_dBase_dDiagnostics_dFrontend_dLexDiag_UnterminatedString) else ((fun c -> ((fun c2 -> ((fun c3 -> ((fun p -> (if (c = 36) then (if (c2 = 123) then ((fun nd_uscrut9 -> (match nd_uscrut9 with
  | Vuna_dCompiler_dBase_dDiag.C_Vuna_dCompiler_dBase_dDiag_dCheck_OkC (dtb__26) -> (match dtb__26 with
  | { Base_dPair.f_Base_dPair_dPair_first = dtb__27; Base_dPair.f_Base_dPair_dPair_second = dtb__28 } -> (if ((v_Vuna_dCompiler_dFrontend_dLexer_dcharsPeek dtb__28) = 125) then (((((v_Vuna_dCompiler_dFrontend_dLexer_dscanTemplateText (fuel - 1)) multi) (v_Vuna_dCompiler_dFrontend_dLexer_dcharsNext dtb__28)) Base_dList.C_Base_dList_dList_Nil) (Base_dList.C_Base_dList_dList__x58__x58_ ((C_Vuna_dCompiler_dFrontend_dLexer_dTmplPart_TPHole (dtb__27)), ((v_Vuna_dCompiler_dFrontend_dLexer_dflushText acc) parts)))) else ((Vuna_dCompiler_dBase_dDiagnostics_dFrontend.v_Vuna_dCompiler_dBase_dDiagnostics_dFrontend_dlexErr0At (v_Vuna_dCompiler_dFrontend_dLexer_dlexSpanAt p)) Vuna_dCompiler_dBase_dDiagnostics_dFrontend.C_Vuna_dCompiler_dBase_dDiagnostics_dFrontend_dLexDiag_UnterminatedInterpolation))
  | _ -> failwith "DT: impossible branch"
)
  | Vuna_dCompiler_dBase_dDiag.C_Vuna_dCompiler_dBase_dDiag_dCheck_ErrC (dtb__29) -> (Vuna_dCompiler_dBase_dDiag.C_Vuna_dCompiler_dBase_dDiag_dCheck_ErrC (dtb__29))
  | _ -> failwith "DT: impossible branch"
)) ((((v_Vuna_dCompiler_dFrontend_dLexer_dlexHoleTokens (fuel - 1)) 0) (v_Vuna_dCompiler_dFrontend_dLexer_dcharsNext2 cs)) Base_dList.C_Base_dList_dList_Nil)) else (((((v_Vuna_dCompiler_dFrontend_dLexer_dscanTemplateText (fuel - 1)) multi) ((v_Vuna_dCompiler_dFrontend_dLexer_dcharsStep c) cs)) (Base_dList.C_Base_dList_dList__x58__x58_ (c, acc))) parts)) else (if (c = 92) then (if (c2 < 0) then ((Vuna_dCompiler_dBase_dDiagnostics_dFrontend.v_Vuna_dCompiler_dBase_dDiagnostics_dFrontend_dlexErr0At (v_Vuna_dCompiler_dFrontend_dLexer_dlexSpanAt p)) Vuna_dCompiler_dBase_dDiagnostics_dFrontend.C_Vuna_dCompiler_dBase_dDiagnostics_dFrontend_dLexDiag_UnterminatedString) else (match (v_Vuna_dCompiler_dFrontend_dLexer_ddecodeEscape c2) with
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing -> ((Vuna_dCompiler_dBase_dDiagnostics_dFrontend.v_Vuna_dCompiler_dBase_dDiagnostics_dFrontend_dlexErr0At (v_Vuna_dCompiler_dFrontend_dLexer_dlexSpanAt p)) Vuna_dCompiler_dBase_dDiagnostics_dFrontend.C_Vuna_dCompiler_dBase_dDiagnostics_dFrontend_dLexDiag_UnknownEscape)
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Just (dtb__30) -> (((((v_Vuna_dCompiler_dFrontend_dLexer_dscanTemplateText (fuel - 1)) multi) (v_Vuna_dCompiler_dFrontend_dLexer_dcharsNext2 cs)) (Base_dList.C_Base_dList_dList__x58__x58_ (dtb__30, acc))) parts)
  | _ -> failwith "DT: impossible branch"
)) else (if (if multi then (c = 34) else false) then (if (if (c2 = 34) then (c3 = 34) else false) then ((fun pos3 -> (Vuna_dCompiler_dBase_dDiag.C_Vuna_dCompiler_dBase_dDiag_dCheck_OkC ({ Base_dPair.f_Base_dPair_dPair_first = (Base_dList.v_Base_dList_dreverse ((v_Vuna_dCompiler_dFrontend_dLexer_dflushText acc) parts)); Base_dPair.f_Base_dPair_dPair_second = { Base_dPair.f_Base_dPair_dPair_first = (v_Vuna_dCompiler_dFrontend_dLexer_dcharsNext2 (v_Vuna_dCompiler_dFrontend_dLexer_dcharsNext cs)); Base_dPair.f_Base_dPair_dPair_second = pos3 } }))) (v_Vuna_dCompiler_dFrontend_dLexer_dcharsPos2 cs)) else (((((v_Vuna_dCompiler_dFrontend_dLexer_dscanTemplateText (fuel - 1)) multi) ((v_Vuna_dCompiler_dFrontend_dLexer_dcharsStep c) cs)) (Base_dList.C_Base_dList_dList__x58__x58_ (c, acc))) parts)) else (if (if (Base_dBool.v_Base_dBool_dnot multi) then (c = 34) else false) then (Vuna_dCompiler_dBase_dDiag.C_Vuna_dCompiler_dBase_dDiag_dCheck_OkC ({ Base_dPair.f_Base_dPair_dPair_first = (Base_dList.v_Base_dList_dreverse ((v_Vuna_dCompiler_dFrontend_dLexer_dflushText acc) parts)); Base_dPair.f_Base_dPair_dPair_second = { Base_dPair.f_Base_dPair_dPair_first = ((v_Vuna_dCompiler_dFrontend_dLexer_dcharsStep c) cs); Base_dPair.f_Base_dPair_dPair_second = p } })) else (if (if (Base_dBool.v_Base_dBool_dnot multi) then (c = 10) else false) then ((Vuna_dCompiler_dBase_dDiagnostics_dFrontend.v_Vuna_dCompiler_dBase_dDiagnostics_dFrontend_dlexErr0At (v_Vuna_dCompiler_dFrontend_dLexer_dlexSpanAt p)) Vuna_dCompiler_dBase_dDiagnostics_dFrontend.C_Vuna_dCompiler_dBase_dDiagnostics_dFrontend_dLexDiag_UnterminatedString) else (((((v_Vuna_dCompiler_dFrontend_dLexer_dscanTemplateText (fuel - 1)) multi) ((v_Vuna_dCompiler_dFrontend_dLexer_dcharsStep c) cs)) (Base_dList.C_Base_dList_dList__x58__x58_ (c, acc))) parts))))))) (v_Vuna_dCompiler_dFrontend_dLexer_dcharsPos cs))) ((v_Vuna_dCompiler_dFrontend_dLexer_dcharsPeekAt 2) cs))) ((v_Vuna_dCompiler_dFrontend_dLexer_dcharsPeekAt 1) cs))) (v_Vuna_dCompiler_dFrontend_dLexer_dcharsPeek cs)))))
# 471 "Vuna/Compiler/Frontend/Lexer.vuna"
and v_Vuna_dCompiler_dFrontend_dLexer_dlexHoleTokens = (fun fuel depth cs acc -> (if (fuel <= 0) then (Vuna_dCompiler_dBase_dDiag.v_Vuna_dCompiler_dBase_dDiag_dicFuel "lexer") else (match ((v_Vuna_dCompiler_dFrontend_dLexer_dskipTrivia (fuel - 1)) cs) with
  | Vuna_dCompiler_dBase_dDiag.C_Vuna_dCompiler_dBase_dDiag_dCheck_ErrC (dtb__31) -> (Vuna_dCompiler_dBase_dDiag.C_Vuna_dCompiler_dBase_dDiag_dCheck_ErrC (dtb__31))
  | Vuna_dCompiler_dBase_dDiag.C_Vuna_dCompiler_dBase_dDiag_dCheck_OkC (dtb__32) -> (if (v_Vuna_dCompiler_dFrontend_dLexer_dcharsEmpty dtb__32) then ((Vuna_dCompiler_dBase_dDiagnostics_dFrontend.v_Vuna_dCompiler_dBase_dDiagnostics_dFrontend_dlexErr0At (v_Vuna_dCompiler_dFrontend_dLexer_dlexSpanAt (v_Vuna_dCompiler_dFrontend_dLexer_dcharsPos dtb__32))) Vuna_dCompiler_dBase_dDiagnostics_dFrontend.C_Vuna_dCompiler_dBase_dDiagnostics_dFrontend_dLexDiag_UnterminatedInterpolation) else (if (if ((v_Vuna_dCompiler_dFrontend_dLexer_dcharsPeek dtb__32) = 125) then (depth = 0) else false) then (Vuna_dCompiler_dBase_dDiag.C_Vuna_dCompiler_dBase_dDiag_dCheck_OkC ({ Base_dPair.f_Base_dPair_dPair_first = (Base_dList.v_Base_dList_dreverse acc); Base_dPair.f_Base_dPair_dPair_second = dtb__32 })) else ((fun nd_uscrut6 -> (match nd_uscrut6 with
  | Vuna_dCompiler_dBase_dDiag.C_Vuna_dCompiler_dBase_dDiag_dCheck_OkC (dtb__33) -> (match dtb__33 with
  | { Base_dPair.f_Base_dPair_dPair_first = dtb__34; Base_dPair.f_Base_dPair_dPair_second = dtb__35 } -> ((((v_Vuna_dCompiler_dFrontend_dLexer_dlexHoleTokens (fuel - 1)) ((v_Vuna_dCompiler_dFrontend_dLexer_ddepthAfter depth) (dtb__34).f_Vuna_dCompiler_dFrontend_dLexer_dPTok_ptokTok)) dtb__35) (Base_dList.C_Base_dList_dList__x58__x58_ (dtb__34, acc)))
  | _ -> failwith "DT: impossible branch"
)
  | Vuna_dCompiler_dBase_dDiag.C_Vuna_dCompiler_dBase_dDiag_dCheck_ErrC (dtb__36) -> (Vuna_dCompiler_dBase_dDiag.C_Vuna_dCompiler_dBase_dDiag_dCheck_ErrC (dtb__36))
  | _ -> failwith "DT: impossible branch"
)) ((v_Vuna_dCompiler_dFrontend_dLexer_dlexOneToken (fuel - 1)) dtb__32))))
  | _ -> failwith "DT: impossible branch"
)))
# 489 "Vuna/Compiler/Frontend/Lexer.vuna"
and v_Vuna_dCompiler_dFrontend_dLexer_dlexOneToken = (fun fuel cs -> (if (fuel <= 0) then (Vuna_dCompiler_dBase_dDiag.v_Vuna_dCompiler_dBase_dDiag_dicFuel "lexer") else (if (v_Vuna_dCompiler_dFrontend_dLexer_dcharsEmpty cs) then (Vuna_dCompiler_dBase_dDiag.v_Vuna_dCompiler_dBase_dDiag_dicInternal "lexOneToken on empty input") else ((fun c -> ((fun p -> ((fun next -> (if (if (c = 64) then (v_Vuna_dCompiler_dFrontend_dLexer_dstartsWithVunaAt next) else false) then ((fun nd_uscrut5 -> (match nd_uscrut5 with
  | Vuna_dCompiler_dBase_dDiag.C_Vuna_dCompiler_dBase_dDiag_dCheck_OkC (dtb__37) -> (match dtb__37 with
  | { Base_dPair.f_Base_dPair_dPair_first = dtb__38; Base_dPair.f_Base_dPair_dPair_second = dtb__39 } -> (Vuna_dCompiler_dBase_dDiag.C_Vuna_dCompiler_dBase_dDiag_dCheck_OkC ({ Base_dPair.f_Base_dPair_dPair_first = { f_Vuna_dCompiler_dFrontend_dLexer_dPTok_ptokTok = (v_Vuna_dCompiler_dFrontend_dLexer_dclassifyIdent dtb__38); f_Vuna_dCompiler_dFrontend_dLexer_dPTok_ptokPos = p }; Base_dPair.f_Base_dPair_dPair_second = dtb__39 }))
  | _ -> failwith "DT: impossible branch"
)
  | Vuna_dCompiler_dBase_dDiag.C_Vuna_dCompiler_dBase_dDiag_dCheck_ErrC (dtb__40) -> (Vuna_dCompiler_dBase_dDiag.C_Vuna_dCompiler_dBase_dDiag_dCheck_ErrC (dtb__40))
  | _ -> failwith "DT: impossible branch"
)) (((v_Vuna_dCompiler_dFrontend_dLexer_dcollectInternalIdent (fuel - 1)) next) (Base_dList.C_Base_dList_dList__x58__x58_ (c, Base_dList.C_Base_dList_dList_Nil)))) else (if (v_Vuna_dCompiler_dFrontend_dLexer_disIdentStart c) then ((fun nd_uscrut5 -> (match nd_uscrut5 with
  | Vuna_dCompiler_dBase_dDiag.C_Vuna_dCompiler_dBase_dDiag_dCheck_OkC (dtb__41) -> (match dtb__41 with
  | { Base_dPair.f_Base_dPair_dPair_first = dtb__42; Base_dPair.f_Base_dPair_dPair_second = dtb__43 } -> (Vuna_dCompiler_dBase_dDiag.C_Vuna_dCompiler_dBase_dDiag_dCheck_OkC ({ Base_dPair.f_Base_dPair_dPair_first = { f_Vuna_dCompiler_dFrontend_dLexer_dPTok_ptokTok = (v_Vuna_dCompiler_dFrontend_dLexer_dclassifyIdent dtb__42); f_Vuna_dCompiler_dFrontend_dLexer_dPTok_ptokPos = p }; Base_dPair.f_Base_dPair_dPair_second = dtb__43 }))
  | _ -> failwith "DT: impossible branch"
)
  | Vuna_dCompiler_dBase_dDiag.C_Vuna_dCompiler_dBase_dDiag_dCheck_ErrC (dtb__44) -> (Vuna_dCompiler_dBase_dDiag.C_Vuna_dCompiler_dBase_dDiag_dCheck_ErrC (dtb__44))
  | _ -> failwith "DT: impossible branch"
)) (((v_Vuna_dCompiler_dFrontend_dLexer_dcollectIdent (fuel - 1)) next) (Base_dList.C_Base_dList_dList__x58__x58_ (c, Base_dList.C_Base_dList_dList_Nil)))) else (if (v_Vuna_dCompiler_dFrontend_dLexer_disDigit c) then ((fun nd_uscrut5 -> (match nd_uscrut5 with
  | Vuna_dCompiler_dBase_dDiag.C_Vuna_dCompiler_dBase_dDiag_dCheck_OkC (dtb__45) -> (if dtb__45 then ((fun nd_uscrut8 -> (match nd_uscrut8 with
  | Vuna_dCompiler_dBase_dDiag.C_Vuna_dCompiler_dBase_dDiag_dCheck_OkC (dtb__46) -> (match dtb__46 with
  | { Base_dPair.f_Base_dPair_dPair_first = dtb__47; Base_dPair.f_Base_dPair_dPair_second = dtb__48 } -> (Vuna_dCompiler_dBase_dDiag.C_Vuna_dCompiler_dBase_dDiag_dCheck_OkC ({ Base_dPair.f_Base_dPair_dPair_first = { f_Vuna_dCompiler_dFrontend_dLexer_dPTok_ptokTok = (C_Vuna_dCompiler_dFrontend_dLexer_dTok_TFloat (dtb__47)); f_Vuna_dCompiler_dFrontend_dLexer_dPTok_ptokPos = p }; Base_dPair.f_Base_dPair_dPair_second = dtb__48 }))
  | _ -> failwith "DT: impossible branch"
)
  | Vuna_dCompiler_dBase_dDiag.C_Vuna_dCompiler_dBase_dDiag_dCheck_ErrC (dtb__49) -> (Vuna_dCompiler_dBase_dDiag.C_Vuna_dCompiler_dBase_dDiag_dCheck_ErrC (dtb__49))
  | _ -> failwith "DT: impossible branch"
)) (((v_Vuna_dCompiler_dFrontend_dLexer_dcollectFloat (fuel - 1)) next) (Base_dList.C_Base_dList_dList__x58__x58_ (c, Base_dList.C_Base_dList_dList_Nil)))) else ((fun nd_uscrut8 -> (match nd_uscrut8 with
  | Vuna_dCompiler_dBase_dDiag.C_Vuna_dCompiler_dBase_dDiag_dCheck_OkC (dtb__50) -> (match dtb__50 with
  | { Base_dPair.f_Base_dPair_dPair_first = dtb__51; Base_dPair.f_Base_dPair_dPair_second = dtb__52 } -> (Vuna_dCompiler_dBase_dDiag.C_Vuna_dCompiler_dBase_dDiag_dCheck_OkC ({ Base_dPair.f_Base_dPair_dPair_first = { f_Vuna_dCompiler_dFrontend_dLexer_dPTok_ptokTok = (C_Vuna_dCompiler_dFrontend_dLexer_dTok_TInt (dtb__51)); f_Vuna_dCompiler_dFrontend_dLexer_dPTok_ptokPos = p }; Base_dPair.f_Base_dPair_dPair_second = dtb__52 }))
  | _ -> failwith "DT: impossible branch"
)
  | Vuna_dCompiler_dBase_dDiag.C_Vuna_dCompiler_dBase_dDiag_dCheck_ErrC (dtb__53) -> (Vuna_dCompiler_dBase_dDiag.C_Vuna_dCompiler_dBase_dDiag_dCheck_ErrC (dtb__53))
  | _ -> failwith "DT: impossible branch"
)) (((v_Vuna_dCompiler_dFrontend_dLexer_dcollectInt (fuel - 1)) next) (c - 48))))
  | Vuna_dCompiler_dBase_dDiag.C_Vuna_dCompiler_dBase_dDiag_dCheck_ErrC (dtb__54) -> (Vuna_dCompiler_dBase_dDiag.C_Vuna_dCompiler_dBase_dDiag_dCheck_ErrC (dtb__54))
  | _ -> failwith "DT: impossible branch"
)) ((v_Vuna_dCompiler_dFrontend_dLexer_ddigitRunIsFloat (fuel - 1)) next)) else (if (c = 34) then (((v_Vuna_dCompiler_dFrontend_dLexer_dlexStringToken (fuel - 1)) next) p) else (if (if (if (if (if (if (if (c = 40) then true else (c = 41)) then true else (c = 91)) then true else (c = 93)) then true else (c = 44)) then true else (c = 123)) then true else (c = 125)) then (Vuna_dCompiler_dBase_dDiag.C_Vuna_dCompiler_dBase_dDiag_dCheck_OkC ({ Base_dPair.f_Base_dPair_dPair_first = { f_Vuna_dCompiler_dFrontend_dLexer_dPTok_ptokTok = (C_Vuna_dCompiler_dFrontend_dLexer_dTok_TSym ((Base_dList.dtp_pack (Base_dList.C_Base_dList_dList__x58__x58_ (c, Base_dList.C_Base_dList_dList_Nil))))); f_Vuna_dCompiler_dFrontend_dLexer_dPTok_ptokPos = p }; Base_dPair.f_Base_dPair_dPair_second = next })) else (if (c = 96) then (Vuna_dCompiler_dBase_dDiag.C_Vuna_dCompiler_dBase_dDiag_dCheck_OkC ({ Base_dPair.f_Base_dPair_dPair_first = { f_Vuna_dCompiler_dFrontend_dLexer_dPTok_ptokTok = (C_Vuna_dCompiler_dFrontend_dLexer_dTok_TSym ("`")); f_Vuna_dCompiler_dFrontend_dLexer_dPTok_ptokPos = p }; Base_dPair.f_Base_dPair_dPair_second = next })) else (if (v_Vuna_dCompiler_dFrontend_dLexer_disOpChar c) then ((fun nd_uscrut5 -> (match nd_uscrut5 with
  | Vuna_dCompiler_dBase_dDiag.C_Vuna_dCompiler_dBase_dDiag_dCheck_OkC (dtb__55) -> (match dtb__55 with
  | { Base_dPair.f_Base_dPair_dPair_first = dtb__56; Base_dPair.f_Base_dPair_dPair_second = dtb__57 } -> (Vuna_dCompiler_dBase_dDiag.C_Vuna_dCompiler_dBase_dDiag_dCheck_OkC ({ Base_dPair.f_Base_dPair_dPair_first = { f_Vuna_dCompiler_dFrontend_dLexer_dPTok_ptokTok = (C_Vuna_dCompiler_dFrontend_dLexer_dTok_TSym (dtb__56)); f_Vuna_dCompiler_dFrontend_dLexer_dPTok_ptokPos = p }; Base_dPair.f_Base_dPair_dPair_second = dtb__57 }))
  | _ -> failwith "DT: impossible branch"
)
  | Vuna_dCompiler_dBase_dDiag.C_Vuna_dCompiler_dBase_dDiag_dCheck_ErrC (dtb__58) -> (Vuna_dCompiler_dBase_dDiag.C_Vuna_dCompiler_dBase_dDiag_dCheck_ErrC (dtb__58))
  | _ -> failwith "DT: impossible branch"
)) (((v_Vuna_dCompiler_dFrontend_dLexer_dcollectOp (fuel - 1)) next) (Base_dList.C_Base_dList_dList__x58__x58_ (c, Base_dList.C_Base_dList_dList_Nil)))) else ((Vuna_dCompiler_dBase_dDiagnostics_dFrontend.v_Vuna_dCompiler_dBase_dDiagnostics_dFrontend_dlexErr0At (v_Vuna_dCompiler_dFrontend_dLexer_dlexSpanAt p)) Vuna_dCompiler_dBase_dDiagnostics_dFrontend.C_Vuna_dCompiler_dBase_dDiagnostics_dFrontend_dLexDiag_UnexpectedCharacter))))))))) ((v_Vuna_dCompiler_dFrontend_dLexer_dcharsStep c) cs))) (v_Vuna_dCompiler_dFrontend_dLexer_dcharsPos cs))) (v_Vuna_dCompiler_dFrontend_dLexer_dcharsPeek cs)))))
# 523 "Vuna/Compiler/Frontend/Lexer.vuna"
and v_Vuna_dCompiler_dFrontend_dLexer_dlexStringToken = (fun fuel cs p -> (if (fuel <= 0) then (Vuna_dCompiler_dBase_dDiag.v_Vuna_dCompiler_dBase_dDiag_dicFuel "lexer") else (if (if ((v_Vuna_dCompiler_dFrontend_dLexer_dcharsPeek cs) = 34) then (((v_Vuna_dCompiler_dFrontend_dLexer_dcharsPeekAt 1) cs) = 34) else false) then ((fun nd_uscrut3 -> (match nd_uscrut3 with
  | Vuna_dCompiler_dBase_dDiag.C_Vuna_dCompiler_dBase_dDiag_dCheck_OkC (dtb__59) -> (match dtb__59 with
  | { Base_dPair.f_Base_dPair_dPair_first = dtb__60; Base_dPair.f_Base_dPair_dPair_second = dtb__61 } -> (match dtb__61 with
  | { Base_dPair.f_Base_dPair_dPair_first = dtb__62; Base_dPair.f_Base_dPair_dPair_second = dtb__63 } -> (Vuna_dCompiler_dBase_dDiag.C_Vuna_dCompiler_dBase_dDiag_dCheck_OkC ({ Base_dPair.f_Base_dPair_dPair_first = { f_Vuna_dCompiler_dFrontend_dLexer_dPTok_ptokTok = (C_Vuna_dCompiler_dFrontend_dLexer_dTok_TTmpl (true, dtb__60, dtb__63)); f_Vuna_dCompiler_dFrontend_dLexer_dPTok_ptokPos = p }; Base_dPair.f_Base_dPair_dPair_second = dtb__62 }))
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
)
  | Vuna_dCompiler_dBase_dDiag.C_Vuna_dCompiler_dBase_dDiag_dCheck_ErrC (dtb__64) -> (Vuna_dCompiler_dBase_dDiag.C_Vuna_dCompiler_dBase_dDiag_dCheck_ErrC (dtb__64))
  | _ -> failwith "DT: impossible branch"
)) (((((v_Vuna_dCompiler_dFrontend_dLexer_dscanTemplateText (fuel - 1)) true) (v_Vuna_dCompiler_dFrontend_dLexer_ddropOpeningNewline (v_Vuna_dCompiler_dFrontend_dLexer_dcharsNext2 cs))) Base_dList.C_Base_dList_dList_Nil) Base_dList.C_Base_dList_dList_Nil)) else (((v_Vuna_dCompiler_dFrontend_dLexer_dlexSingleStringToken (fuel - 1)) cs) p))))
# 530 "Vuna/Compiler/Frontend/Lexer.vuna"
and v_Vuna_dCompiler_dFrontend_dLexer_dlexSingleStringToken = (fun fuel body p -> (if (fuel <= 0) then (Vuna_dCompiler_dBase_dDiag.v_Vuna_dCompiler_dBase_dDiag_dicFuel "lexer") else ((fun nd_uscrut3 -> (match nd_uscrut3 with
  | Vuna_dCompiler_dBase_dDiag.C_Vuna_dCompiler_dBase_dDiag_dCheck_OkC (dtb__65) -> (match dtb__65 with
  | { Base_dPair.f_Base_dPair_dPair_first = dtb__66; Base_dPair.f_Base_dPair_dPair_second = dtb__67 } -> (match dtb__67 with
  | { Base_dPair.f_Base_dPair_dPair_first = dtb__68; Base_dPair.f_Base_dPair_dPair_second = dtb__69 } -> ((fun nd_uscrut14 -> (match nd_uscrut14 with
  | Base_dList.C_Base_dList_dList__x58__x58_ (dtb__70, dtb__71) -> (match dtb__70 with
  | C_Vuna_dCompiler_dFrontend_dLexer_dTmplPart_TPText (dtb__72) -> (match dtb__71 with
  | Base_dList.C_Base_dList_dList_Nil -> (Vuna_dCompiler_dBase_dDiag.C_Vuna_dCompiler_dBase_dDiag_dCheck_OkC ({ Base_dPair.f_Base_dPair_dPair_first = { f_Vuna_dCompiler_dFrontend_dLexer_dPTok_ptokTok = (C_Vuna_dCompiler_dFrontend_dLexer_dTok_TStr (dtb__72)); f_Vuna_dCompiler_dFrontend_dLexer_dPTok_ptokPos = p }; Base_dPair.f_Base_dPair_dPair_second = dtb__68 }))
  | _ -> (Vuna_dCompiler_dBase_dDiag.C_Vuna_dCompiler_dBase_dDiag_dCheck_OkC ({ Base_dPair.f_Base_dPair_dPair_first = { f_Vuna_dCompiler_dFrontend_dLexer_dPTok_ptokTok = (C_Vuna_dCompiler_dFrontend_dLexer_dTok_TTmpl (false, dtb__66, dtb__69)); f_Vuna_dCompiler_dFrontend_dLexer_dPTok_ptokPos = p }; Base_dPair.f_Base_dPair_dPair_second = dtb__68 }))
)
  | _ -> (Vuna_dCompiler_dBase_dDiag.C_Vuna_dCompiler_dBase_dDiag_dCheck_OkC ({ Base_dPair.f_Base_dPair_dPair_first = { f_Vuna_dCompiler_dFrontend_dLexer_dPTok_ptokTok = (C_Vuna_dCompiler_dFrontend_dLexer_dTok_TTmpl (false, dtb__66, dtb__69)); f_Vuna_dCompiler_dFrontend_dLexer_dPTok_ptokPos = p }; Base_dPair.f_Base_dPair_dPair_second = dtb__68 }))
)
  | _ -> (Vuna_dCompiler_dBase_dDiag.C_Vuna_dCompiler_dBase_dDiag_dCheck_OkC ({ Base_dPair.f_Base_dPair_dPair_first = { f_Vuna_dCompiler_dFrontend_dLexer_dPTok_ptokTok = (C_Vuna_dCompiler_dFrontend_dLexer_dTok_TTmpl (false, dtb__66, dtb__69)); f_Vuna_dCompiler_dFrontend_dLexer_dPTok_ptokPos = p }; Base_dPair.f_Base_dPair_dPair_second = dtb__68 }))
)) dtb__66)
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
)
  | Vuna_dCompiler_dBase_dDiag.C_Vuna_dCompiler_dBase_dDiag_dCheck_ErrC (dtb__73) -> (Vuna_dCompiler_dBase_dDiag.C_Vuna_dCompiler_dBase_dDiag_dCheck_ErrC (dtb__73))
  | _ -> failwith "DT: impossible branch"
)) (((((v_Vuna_dCompiler_dFrontend_dLexer_dscanTemplateText (fuel - 1)) false) body) Base_dList.C_Base_dList_dList_Nil) Base_dList.C_Base_dList_dList_Nil))))

# 544 "Vuna/Compiler/Frontend/Lexer.vuna"
let rec v_Vuna_dCompiler_dFrontend_dLexer_dlexCharsWith = (fun fuel acc cs -> (if (fuel <= 0) then (Vuna_dCompiler_dBase_dDiag.v_Vuna_dCompiler_dBase_dDiag_dicFuel "lexer") else ((fun nd_uscrut3 -> (match nd_uscrut3 with
  | Vuna_dCompiler_dBase_dDiag.C_Vuna_dCompiler_dBase_dDiag_dCheck_OkC (dtb__74) -> (match dtb__74 with
  | { Base_dPair.f_Base_dPair_dPair_first = dtb__75; Base_dPair.f_Base_dPair_dPair_second = dtb__76 } -> (if (v_Vuna_dCompiler_dFrontend_dLexer_dcharsEmpty dtb__75) then (Vuna_dCompiler_dBase_dDiag.C_Vuna_dCompiler_dBase_dDiag_dCheck_OkC ({ Base_dPair.f_Base_dPair_dPair_first = (Base_dList.C_Base_dList_dList__x58__x58_ ({ f_Vuna_dCompiler_dFrontend_dLexer_dPTok_ptokTok = C_Vuna_dCompiler_dFrontend_dLexer_dTok_TEof; f_Vuna_dCompiler_dFrontend_dLexer_dPTok_ptokPos = (v_Vuna_dCompiler_dFrontend_dLexer_dcharsPos dtb__75) }, Base_dList.C_Base_dList_dList_Nil)); Base_dPair.f_Base_dPair_dPair_second = (Base_dList.v_Base_dList_dreverse ((Base_dList.v_Base_dList_dappend (Base_dList.v_Base_dList_dreverse dtb__76)) acc)) })) else ((fun nd_uscrut10 -> (match nd_uscrut10 with
  | Vuna_dCompiler_dBase_dDiag.C_Vuna_dCompiler_dBase_dDiag_dCheck_OkC (dtb__77) -> (match dtb__77 with
  | { Base_dPair.f_Base_dPair_dPair_first = dtb__78; Base_dPair.f_Base_dPair_dPair_second = dtb__79 } -> ((fun nd_uscrut17 -> (match nd_uscrut17 with
  | Vuna_dCompiler_dBase_dDiag.C_Vuna_dCompiler_dBase_dDiag_dCheck_OkC (dtb__80) -> (match dtb__80 with
  | { Base_dPair.f_Base_dPair_dPair_first = dtb__81; Base_dPair.f_Base_dPair_dPair_second = dtb__82 } -> (Vuna_dCompiler_dBase_dDiag.C_Vuna_dCompiler_dBase_dDiag_dCheck_OkC ({ Base_dPair.f_Base_dPair_dPair_first = (Base_dList.C_Base_dList_dList__x58__x58_ (dtb__78, dtb__81)); Base_dPair.f_Base_dPair_dPair_second = dtb__82 }))
  | _ -> failwith "DT: impossible branch"
)
  | Vuna_dCompiler_dBase_dDiag.C_Vuna_dCompiler_dBase_dDiag_dCheck_ErrC (dtb__83) -> (Vuna_dCompiler_dBase_dDiag.C_Vuna_dCompiler_dBase_dDiag_dCheck_ErrC (dtb__83))
  | _ -> failwith "DT: impossible branch"
)) (((v_Vuna_dCompiler_dFrontend_dLexer_dlexCharsWith (fuel - 1)) ((Base_dList.v_Base_dList_dappend (Base_dList.v_Base_dList_dreverse dtb__76)) acc)) dtb__79))
  | _ -> failwith "DT: impossible branch"
)
  | Vuna_dCompiler_dBase_dDiag.C_Vuna_dCompiler_dBase_dDiag_dCheck_ErrC (dtb__84) -> (Vuna_dCompiler_dBase_dDiag.C_Vuna_dCompiler_dBase_dDiag_dCheck_ErrC (dtb__84))
  | _ -> failwith "DT: impossible branch"
)) ((v_Vuna_dCompiler_dFrontend_dLexer_dlexOneToken fuel) dtb__75)))
  | _ -> failwith "DT: impossible branch"
)
  | Vuna_dCompiler_dBase_dDiag.C_Vuna_dCompiler_dBase_dDiag_dCheck_ErrC (dtb__85) -> (Vuna_dCompiler_dBase_dDiag.C_Vuna_dCompiler_dBase_dDiag_dCheck_ErrC (dtb__85))
  | _ -> failwith "DT: impossible branch"
)) ((v_Vuna_dCompiler_dFrontend_dLexer_dskipTriviaComments fuel) cs))))

# 557 "Vuna/Compiler/Frontend/Lexer.vuna"
let rec v_Vuna_dCompiler_dFrontend_dLexer_dlexChars = (fun fuel cs -> (if (fuel <= 0) then (Vuna_dCompiler_dBase_dDiag.v_Vuna_dCompiler_dBase_dDiag_dicFuel "lexer") else (match ((v_Vuna_dCompiler_dFrontend_dLexer_dskipTrivia fuel) cs) with
  | Vuna_dCompiler_dBase_dDiag.C_Vuna_dCompiler_dBase_dDiag_dCheck_ErrC (dtb__86) -> (Vuna_dCompiler_dBase_dDiag.C_Vuna_dCompiler_dBase_dDiag_dCheck_ErrC (dtb__86))
  | Vuna_dCompiler_dBase_dDiag.C_Vuna_dCompiler_dBase_dDiag_dCheck_OkC (dtb__87) -> (if (v_Vuna_dCompiler_dFrontend_dLexer_dcharsEmpty dtb__87) then (Vuna_dCompiler_dBase_dDiag.C_Vuna_dCompiler_dBase_dDiag_dCheck_OkC ((Base_dList.C_Base_dList_dList__x58__x58_ ({ f_Vuna_dCompiler_dFrontend_dLexer_dPTok_ptokTok = C_Vuna_dCompiler_dFrontend_dLexer_dTok_TEof; f_Vuna_dCompiler_dFrontend_dLexer_dPTok_ptokPos = (v_Vuna_dCompiler_dFrontend_dLexer_dcharsPos dtb__87) }, Base_dList.C_Base_dList_dList_Nil)))) else ((fun nd_uscrut4 -> (match nd_uscrut4 with
  | Vuna_dCompiler_dBase_dDiag.C_Vuna_dCompiler_dBase_dDiag_dCheck_OkC (dtb__88) -> (match dtb__88 with
  | { Base_dPair.f_Base_dPair_dPair_first = dtb__89; Base_dPair.f_Base_dPair_dPair_second = dtb__90 } -> (match ((v_Vuna_dCompiler_dFrontend_dLexer_dlexChars (fuel - 1)) dtb__90) with
  | Vuna_dCompiler_dBase_dDiag.C_Vuna_dCompiler_dBase_dDiag_dCheck_ErrC (dtb__91) -> (Vuna_dCompiler_dBase_dDiag.C_Vuna_dCompiler_dBase_dDiag_dCheck_ErrC (dtb__91))
  | Vuna_dCompiler_dBase_dDiag.C_Vuna_dCompiler_dBase_dDiag_dCheck_OkC (dtb__92) -> (Vuna_dCompiler_dBase_dDiag.C_Vuna_dCompiler_dBase_dDiag_dCheck_OkC ((Base_dList.C_Base_dList_dList__x58__x58_ (dtb__89, dtb__92))))
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
)
  | Vuna_dCompiler_dBase_dDiag.C_Vuna_dCompiler_dBase_dDiag_dCheck_ErrC (dtb__93) -> (Vuna_dCompiler_dBase_dDiag.C_Vuna_dCompiler_dBase_dDiag_dCheck_ErrC (dtb__93))
  | _ -> failwith "DT: impossible branch"
)) ((v_Vuna_dCompiler_dFrontend_dLexer_dlexOneToken fuel) dtb__87)))
  | _ -> failwith "DT: impossible branch"
)))

# 587 "Vuna/Compiler/Frontend/Lexer.vuna"
let v_Vuna_dCompiler_dFrontend_dLexer_dsourceFuel = (fun source -> ((4 * (bi_strLength source)) + 64))

# 570 "Vuna/Compiler/Frontend/Lexer.vuna"
let v_Vuna_dCompiler_dFrontend_dLexer_dlexSourceWithComments = (fun source -> (((v_Vuna_dCompiler_dFrontend_dLexer_dlexCharsWith (v_Vuna_dCompiler_dFrontend_dLexer_dsourceFuel source)) Base_dList.C_Base_dList_dList_Nil) { f_Vuna_dCompiler_dFrontend_dLexer_dChars_charsSource = source; f_Vuna_dCompiler_dFrontend_dLexer_dChars_charsOffset = 0; f_Vuna_dCompiler_dFrontend_dLexer_dChars_charsPos = { Vuna_dCompiler_dBase_dSource.f_Vuna_dCompiler_dBase_dSource_dPos_posLine = 1; Vuna_dCompiler_dBase_dSource.f_Vuna_dCompiler_dBase_dSource_dPos_posCol = 1 } }))

# 573 "Vuna/Compiler/Frontend/Lexer.vuna"
let v_Vuna_dCompiler_dFrontend_dLexer_dlexSource = (fun source -> ((v_Vuna_dCompiler_dFrontend_dLexer_dlexChars (v_Vuna_dCompiler_dFrontend_dLexer_dsourceFuel source)) { f_Vuna_dCompiler_dFrontend_dLexer_dChars_charsSource = source; f_Vuna_dCompiler_dFrontend_dLexer_dChars_charsOffset = 0; f_Vuna_dCompiler_dFrontend_dLexer_dChars_charsPos = { Vuna_dCompiler_dBase_dSource.f_Vuna_dCompiler_dBase_dSource_dPos_posLine = 1; Vuna_dCompiler_dBase_dSource.f_Vuna_dCompiler_dBase_dSource_dPos_posCol = 1 } }))

# 576 "Vuna/Compiler/Frontend/Lexer.vuna"
let v_Vuna_dCompiler_dFrontend_dLexer_dlexComments = (fun source -> ((fun nd_uscrut1 -> (match nd_uscrut1 with
  | Vuna_dCompiler_dBase_dDiag.C_Vuna_dCompiler_dBase_dDiag_dCheck_OkC (dtb__94) -> (match dtb__94 with
  | { Base_dPair.f_Base_dPair_dPair_first = dtb__95; Base_dPair.f_Base_dPair_dPair_second = dtb__96 } -> (Vuna_dCompiler_dBase_dDiag.C_Vuna_dCompiler_dBase_dDiag_dCheck_OkC (dtb__96))
  | _ -> failwith "DT: impossible branch"
)
  | Vuna_dCompiler_dBase_dDiag.C_Vuna_dCompiler_dBase_dDiag_dCheck_ErrC (dtb__97) -> (Vuna_dCompiler_dBase_dDiag.C_Vuna_dCompiler_dBase_dDiag_dCheck_ErrC (dtb__97))
  | _ -> failwith "DT: impossible branch"
)) (v_Vuna_dCompiler_dFrontend_dLexer_dlexSourceWithComments source)))
