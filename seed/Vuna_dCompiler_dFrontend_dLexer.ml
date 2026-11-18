open Vuna_runtime
type t_Vuna_dCompiler_dFrontend_dLexer_dTmplPart = C_Vuna_dCompiler_dFrontend_dLexer_dTmplPart_TPText of (string) | C_Vuna_dCompiler_dFrontend_dLexer_dTmplPart_TPHole of (t_Vuna_dCompiler_dFrontend_dLexer_dPTok Base_dData_dList.t_Base_dData_dList_dList)
and t_Vuna_dCompiler_dFrontend_dLexer_dTok = C_Vuna_dCompiler_dFrontend_dLexer_dTok_TIdent of (string) | C_Vuna_dCompiler_dFrontend_dLexer_dTok_TKw of (string) | C_Vuna_dCompiler_dFrontend_dLexer_dTok_TInt of (int) | C_Vuna_dCompiler_dFrontend_dLexer_dTok_TStr of (string) | C_Vuna_dCompiler_dFrontend_dLexer_dTok_TTmpl of (bool) * (t_Vuna_dCompiler_dFrontend_dLexer_dTmplPart Base_dData_dList.t_Base_dData_dList_dList) * (Vuna_dCompiler_dBase_dSource.t_Vuna_dCompiler_dBase_dSource_dPos) | C_Vuna_dCompiler_dFrontend_dLexer_dTok_TSym of (string) | C_Vuna_dCompiler_dFrontend_dLexer_dTok_TEof | C_Vuna_dCompiler_dFrontend_dLexer_dTok_TFloat of (string)
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

# 89 "Vuna/Compiler/Frontend/Lexer.vuna"
let v_Vuna_dCompiler_dFrontend_dLexer_dsetTokEnd = (fun mc0 mc1 -> (match mc1 with
  | { f_Vuna_dCompiler_dFrontend_dLexer_dPTok_ptokTok = dtb__0; f_Vuna_dCompiler_dFrontend_dLexer_dPTok_ptokPos = dtb__1 } -> { f_Vuna_dCompiler_dFrontend_dLexer_dPTok_ptokTok = dtb__0; f_Vuna_dCompiler_dFrontend_dLexer_dPTok_ptokPos = { Vuna_dCompiler_dBase_dSource.f_Vuna_dCompiler_dBase_dSource_dPos_posLine = (Vuna_dCompiler_dBase_dSource.v_Vuna_dCompiler_dBase_dSource_dposLine dtb__1); Vuna_dCompiler_dBase_dSource.f_Vuna_dCompiler_dBase_dSource_dPos_posCol = (Vuna_dCompiler_dBase_dSource.v_Vuna_dCompiler_dBase_dSource_dposCol dtb__1); Vuna_dCompiler_dBase_dSource.f_Vuna_dCompiler_dBase_dSource_dPos_posOffset = (Vuna_dCompiler_dBase_dSource.v_Vuna_dCompiler_dBase_dSource_dposOffset dtb__1); Vuna_dCompiler_dBase_dSource.f_Vuna_dCompiler_dBase_dSource_dPos_posEndOffset = (v_Vuna_dCompiler_dFrontend_dLexer_dcharsOffset mc0) } }
  | _ -> failwith "DT: impossible branch"
))

# 93 "Vuna/Compiler/Frontend/Lexer.vuna"
let v_Vuna_dCompiler_dFrontend_dLexer_dposWithEnd = (fun p end_ -> { Vuna_dCompiler_dBase_dSource.f_Vuna_dCompiler_dBase_dSource_dPos_posLine = (Vuna_dCompiler_dBase_dSource.v_Vuna_dCompiler_dBase_dSource_dposLine p); Vuna_dCompiler_dBase_dSource.f_Vuna_dCompiler_dBase_dSource_dPos_posCol = (Vuna_dCompiler_dBase_dSource.v_Vuna_dCompiler_dBase_dSource_dposCol p); Vuna_dCompiler_dBase_dSource.f_Vuna_dCompiler_dBase_dSource_dPos_posOffset = (Vuna_dCompiler_dBase_dSource.v_Vuna_dCompiler_dBase_dSource_dposOffset p); Vuna_dCompiler_dBase_dSource.f_Vuna_dCompiler_dBase_dSource_dPos_posEndOffset = end_ })

# 96 "Vuna/Compiler/Frontend/Lexer.vuna"
let v_Vuna_dCompiler_dFrontend_dLexer_dlexSpanAt = (fun mc0 -> (match mc0 with
  | { Vuna_dCompiler_dBase_dSource.f_Vuna_dCompiler_dBase_dSource_dPos_posLine = dtb__2; Vuna_dCompiler_dBase_dSource.f_Vuna_dCompiler_dBase_dSource_dPos_posCol = dtb__3; Vuna_dCompiler_dBase_dSource.f_Vuna_dCompiler_dBase_dSource_dPos_posOffset = dtb__4; Vuna_dCompiler_dBase_dSource.f_Vuna_dCompiler_dBase_dSource_dPos_posEndOffset = dtb__5 } -> { Vuna_dCompiler_dBase_dSource.f_Vuna_dCompiler_dBase_dSource_dSpan_spanFile = ""; Vuna_dCompiler_dBase_dSource.f_Vuna_dCompiler_dBase_dSource_dSpan_spanStartLine = dtb__2; Vuna_dCompiler_dBase_dSource.f_Vuna_dCompiler_dBase_dSource_dSpan_spanStartCol = dtb__3; Vuna_dCompiler_dBase_dSource.f_Vuna_dCompiler_dBase_dSource_dSpan_spanEndLine = dtb__2; Vuna_dCompiler_dBase_dSource.f_Vuna_dCompiler_dBase_dSource_dSpan_spanEndCol = dtb__3; Vuna_dCompiler_dBase_dSource.f_Vuna_dCompiler_dBase_dSource_dSpan_spanStartOffset = dtb__4; Vuna_dCompiler_dBase_dSource.f_Vuna_dCompiler_dBase_dSource_dSpan_spanEndOffset = dtb__4 }
  | _ -> failwith "DT: impossible branch"
))

# 99 "Vuna/Compiler/Frontend/Lexer.vuna"
let v_Vuna_dCompiler_dFrontend_dLexer_dadvanceChar = (fun mc0 mc1 -> (match mc1 with
  | { Vuna_dCompiler_dBase_dSource.f_Vuna_dCompiler_dBase_dSource_dPos_posLine = dtb__6; Vuna_dCompiler_dBase_dSource.f_Vuna_dCompiler_dBase_dSource_dPos_posCol = dtb__7; Vuna_dCompiler_dBase_dSource.f_Vuna_dCompiler_dBase_dSource_dPos_posOffset = dtb__8; Vuna_dCompiler_dBase_dSource.f_Vuna_dCompiler_dBase_dSource_dPos_posEndOffset = dtb__9 } -> (if (mc0 = 10) then { Vuna_dCompiler_dBase_dSource.f_Vuna_dCompiler_dBase_dSource_dPos_posLine = (dtb__6 + 1); Vuna_dCompiler_dBase_dSource.f_Vuna_dCompiler_dBase_dSource_dPos_posCol = 1; Vuna_dCompiler_dBase_dSource.f_Vuna_dCompiler_dBase_dSource_dPos_posOffset = (dtb__8 + 1); Vuna_dCompiler_dBase_dSource.f_Vuna_dCompiler_dBase_dSource_dPos_posEndOffset = (dtb__8 + 1) } else { Vuna_dCompiler_dBase_dSource.f_Vuna_dCompiler_dBase_dSource_dPos_posLine = dtb__6; Vuna_dCompiler_dBase_dSource.f_Vuna_dCompiler_dBase_dSource_dPos_posCol = (dtb__7 + 1); Vuna_dCompiler_dBase_dSource.f_Vuna_dCompiler_dBase_dSource_dPos_posOffset = (dtb__8 + 1); Vuna_dCompiler_dBase_dSource.f_Vuna_dCompiler_dBase_dSource_dPos_posEndOffset = (dtb__8 + 1) })
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

# 103 "Vuna/Compiler/Frontend/Lexer.vuna"
let v_Vuna_dCompiler_dFrontend_dLexer_disUpperChar = (fun c -> (if (c >= 65) then (c <= 90) else false))

# 106 "Vuna/Compiler/Frontend/Lexer.vuna"
let v_Vuna_dCompiler_dFrontend_dLexer_disLowerChar = (fun c -> (if (c >= 97) then (c <= 122) else false))

# 109 "Vuna/Compiler/Frontend/Lexer.vuna"
let v_Vuna_dCompiler_dFrontend_dLexer_disIdentStart = (fun c -> (if (if (v_Vuna_dCompiler_dFrontend_dLexer_disUpperChar c) then true else (v_Vuna_dCompiler_dFrontend_dLexer_disLowerChar c)) then true else (c = 95)))

# 115 "Vuna/Compiler/Frontend/Lexer.vuna"
let v_Vuna_dCompiler_dFrontend_dLexer_disDigit = (fun c -> (if (c >= 48) then (c <= 57) else false))

# 112 "Vuna/Compiler/Frontend/Lexer.vuna"
let v_Vuna_dCompiler_dFrontend_dLexer_disIdentChar = (fun c -> (if (if (v_Vuna_dCompiler_dFrontend_dLexer_disIdentStart c) then true else (v_Vuna_dCompiler_dFrontend_dLexer_disDigit c)) then true else (c = 39)))

# 118 "Vuna/Compiler/Frontend/Lexer.vuna"
let v_Vuna_dCompiler_dFrontend_dLexer_disSpace = (fun c -> (if (if (if (c = 32) then true else (c = 9)) then true else (c = 10)) then true else (c = 13)))

# 121 "Vuna/Compiler/Frontend/Lexer.vuna"
let v_Vuna_dCompiler_dFrontend_dLexer_disOpChar = (fun c -> (if (if (if (if (if (if (if (if (if (if (if (if (if (if (if (if (if (if (c = 33) then true else (c = 36)) then true else (c = 37)) then true else (c = 38)) then true else (c = 42)) then true else (c = 43)) then true else (c = 45)) then true else (c = 46)) then true else (c = 47)) then true else (c = 60)) then true else (c = 61)) then true else (c = 62)) then true else (c = 63)) then true else (c = 64)) then true else (c = 92)) then true else (c = 94)) then true else (c = 124)) then true else (c = 126)) then true else (c = 58)))

# 148 "Vuna/Compiler/Frontend/Lexer.vuna"
let v_Vuna_dCompiler_dFrontend_dLexer_disKeyword = (fun s -> (if (if (if (if (if (if (if (if (if (if (if (if (if (if (if (if (if (if (if (if (if (if (if (if (if (if (if (if (s = "data") then true else (s = "axiom")) then true else (s = "extern")) then true else (s = "case")) then true else (s = "of")) then true else (s = "let")) then true else (s = "in")) then true else (s = "if")) then true else (s = "then")) then true else (s = "else")) then true else (s = "where")) then true else (s = "linear")) then true else (s = "transparent")) then true else (s = "opaque")) then true else (s = "Type")) then true else (s = "import")) then true else (s = "module")) then true else (s = "qualified")) then true else (s = "as")) then true else (s = "record")) then true else (s = "trait")) then true else (s = "instance")) then true else (s = "deriving")) then true else (s = "do")) then true else (s = "perform")) then true else (s = "handle")) then true else (s = "infixl")) then true else (s = "infixr")) then true else (s = "infix")))

# 180 "Vuna/Compiler/Frontend/Lexer.vuna"
let v_Vuna_dCompiler_dFrontend_dLexer_dclassifyIdent = (fun s -> (if (v_Vuna_dCompiler_dFrontend_dLexer_disKeyword s) then (C_Vuna_dCompiler_dFrontend_dLexer_dTok_TKw (s)) else (C_Vuna_dCompiler_dFrontend_dLexer_dTok_TIdent (s))))

# 195 "Vuna/Compiler/Frontend/Lexer.vuna"
let v_Vuna_dCompiler_dFrontend_dLexer_dcommentSpan = (fun mc0 -> (match mc0 with
  | { f_Vuna_dCompiler_dFrontend_dLexer_dComment_commentKind = dtb__10; f_Vuna_dCompiler_dFrontend_dLexer_dComment_commentText = dtb__11; f_Vuna_dCompiler_dFrontend_dLexer_dComment_commentSpan = dtb__12 } -> dtb__12
  | _ -> failwith "DT: impossible branch"
))

# 201 "Vuna/Compiler/Frontend/Lexer.vuna"
let rec v_Vuna_dCompiler_dFrontend_dLexer_ddropTrailingSpace = (fun mc0 -> (match mc0 with
  | Base_dData_dList.C_Base_dData_dList_dList__x58__x58_ (dtb__13, dtb__14) -> (if (if (if (dtb__13 = 32) then true else (dtb__13 = 9)) then true else (dtb__13 = 13)) then (v_Vuna_dCompiler_dFrontend_dLexer_ddropTrailingSpace dtb__14) else (Base_dData_dList.C_Base_dData_dList_dList__x58__x58_ (dtb__13, dtb__14)))
  | Base_dData_dList.C_Base_dData_dList_dList_Nil -> Base_dData_dList.C_Base_dData_dList_dList_Nil
  | _ -> failwith "DT: impossible branch"
))

# 198 "Vuna/Compiler/Frontend/Lexer.vuna"
let v_Vuna_dCompiler_dFrontend_dLexer_dtrimTrailingSpace = (fun s -> (Base_dData_dList.dtp_pack (Base_dData_dList.v_Base_dData_dList_dreverse (v_Vuna_dCompiler_dFrontend_dLexer_ddropTrailingSpace (Base_dData_dList.v_Base_dData_dList_dreverse (Base_dData_dList.dtp_unpack s))))))

# 207 "Vuna/Compiler/Frontend/Lexer.vuna"
let rec v_Vuna_dCompiler_dFrontend_dLexer_dcollectLineBody = (fun fuel cs acc endP -> (if (fuel <= 0) then (Vuna_dCompiler_dBase_dDiag.v_Vuna_dCompiler_dBase_dDiag_dicFuel "lexer") else (if (v_Vuna_dCompiler_dFrontend_dLexer_dcharsEmpty cs) then (Vuna_dCompiler_dBase_dDiag.C_Vuna_dCompiler_dBase_dDiag_dCheck_OkC ({ Base_dData_dPair.f_Base_dData_dPair_dPair_first = (Base_dData_dList.dtp_pack (Base_dData_dList.v_Base_dData_dList_dreverse acc)); Base_dData_dPair.f_Base_dData_dPair_dPair_second = { Base_dData_dPair.f_Base_dData_dPair_dPair_first = cs; Base_dData_dPair.f_Base_dData_dPair_dPair_second = endP } })) else ((fun c -> (if (c = 10) then (Vuna_dCompiler_dBase_dDiag.C_Vuna_dCompiler_dBase_dDiag_dCheck_OkC ({ Base_dData_dPair.f_Base_dData_dPair_dPair_first = (Base_dData_dList.dtp_pack (Base_dData_dList.v_Base_dData_dList_dreverse acc)); Base_dData_dPair.f_Base_dData_dPair_dPair_second = { Base_dData_dPair.f_Base_dData_dPair_dPair_first = cs; Base_dData_dPair.f_Base_dData_dPair_dPair_second = endP } })) else ((((v_Vuna_dCompiler_dFrontend_dLexer_dcollectLineBody (fuel - 1)) ((v_Vuna_dCompiler_dFrontend_dLexer_dcharsStep c) cs)) (Base_dData_dList.C_Base_dData_dList_dList__x58__x58_ (c, acc))) (v_Vuna_dCompiler_dFrontend_dLexer_dcharsPos cs)))) (v_Vuna_dCompiler_dFrontend_dLexer_dcharsPeek cs)))))

# 217 "Vuna/Compiler/Frontend/Lexer.vuna"
let rec v_Vuna_dCompiler_dFrontend_dLexer_dcollectBlockBody = (fun fuel cs depth acc endP -> (if (fuel <= 0) then (Vuna_dCompiler_dBase_dDiag.v_Vuna_dCompiler_dBase_dDiag_dicFuel "lexer") else (if (v_Vuna_dCompiler_dFrontend_dLexer_dcharsEmpty cs) then ((Vuna_dCompiler_dBase_dDiagnostics_dFrontend.v_Vuna_dCompiler_dBase_dDiagnostics_dFrontend_dlexErr0At (v_Vuna_dCompiler_dFrontend_dLexer_dlexSpanAt (v_Vuna_dCompiler_dFrontend_dLexer_dcharsPos cs))) Vuna_dCompiler_dBase_dDiagnostics_dFrontend.C_Vuna_dCompiler_dBase_dDiagnostics_dFrontend_dLexDiag_UnterminatedBlockComment) else ((fun c -> ((fun c2 -> (if (c2 < 0) then (((((v_Vuna_dCompiler_dFrontend_dLexer_dcollectBlockBody (fuel - 1)) ((v_Vuna_dCompiler_dFrontend_dLexer_dcharsStep c) cs)) depth) (Base_dData_dList.C_Base_dData_dList_dList__x58__x58_ (c, acc))) (v_Vuna_dCompiler_dFrontend_dLexer_dcharsPos cs)) else (if (if (c = 123) then (c2 = 45) else false) then (((((v_Vuna_dCompiler_dFrontend_dLexer_dcollectBlockBody (fuel - 1)) (v_Vuna_dCompiler_dFrontend_dLexer_dcharsNext2 cs)) (depth + 1)) (Base_dData_dList.C_Base_dData_dList_dList__x58__x58_ (c2, (Base_dData_dList.C_Base_dData_dList_dList__x58__x58_ (c, acc))))) (v_Vuna_dCompiler_dFrontend_dLexer_dcharsPos2 cs)) else (if (if (c = 45) then (c2 = 125) else false) then (if (depth = 1) then (Vuna_dCompiler_dBase_dDiag.C_Vuna_dCompiler_dBase_dDiag_dCheck_OkC ({ Base_dData_dPair.f_Base_dData_dPair_dPair_first = (Base_dData_dList.dtp_pack (Base_dData_dList.v_Base_dData_dList_dreverse acc)); Base_dData_dPair.f_Base_dData_dPair_dPair_second = { Base_dData_dPair.f_Base_dData_dPair_dPair_first = (v_Vuna_dCompiler_dFrontend_dLexer_dcharsNext2 cs); Base_dData_dPair.f_Base_dData_dPair_dPair_second = (v_Vuna_dCompiler_dFrontend_dLexer_dcharsPos2 cs) } })) else (((((v_Vuna_dCompiler_dFrontend_dLexer_dcollectBlockBody (fuel - 1)) (v_Vuna_dCompiler_dFrontend_dLexer_dcharsNext2 cs)) (depth - 1)) (Base_dData_dList.C_Base_dData_dList_dList__x58__x58_ (c2, (Base_dData_dList.C_Base_dData_dList_dList__x58__x58_ (c, acc))))) (v_Vuna_dCompiler_dFrontend_dLexer_dcharsPos2 cs))) else (((((v_Vuna_dCompiler_dFrontend_dLexer_dcollectBlockBody (fuel - 1)) ((v_Vuna_dCompiler_dFrontend_dLexer_dcharsStep c) cs)) depth) (Base_dData_dList.C_Base_dData_dList_dList__x58__x58_ (c, acc))) (v_Vuna_dCompiler_dFrontend_dLexer_dcharsPos cs)))))) ((v_Vuna_dCompiler_dFrontend_dLexer_dcharsPeekAt 1) cs))) (v_Vuna_dCompiler_dFrontend_dLexer_dcharsPeek cs)))))

# 233 "Vuna/Compiler/Frontend/Lexer.vuna"
let rec v_Vuna_dCompiler_dFrontend_dLexer_dskipLineComment = (fun fuel cs -> (if (fuel <= 0) then (Vuna_dCompiler_dBase_dDiag.v_Vuna_dCompiler_dBase_dDiag_dicFuel "lexer") else (if (v_Vuna_dCompiler_dFrontend_dLexer_dcharsEmpty cs) then (Vuna_dCompiler_dBase_dDiag.C_Vuna_dCompiler_dBase_dDiag_dCheck_OkC (cs)) else ((fun c -> (if (c = 10) then (Vuna_dCompiler_dBase_dDiag.C_Vuna_dCompiler_dBase_dDiag_dCheck_OkC (cs)) else ((v_Vuna_dCompiler_dFrontend_dLexer_dskipLineComment (fuel - 1)) ((v_Vuna_dCompiler_dFrontend_dLexer_dcharsStep c) cs)))) (v_Vuna_dCompiler_dFrontend_dLexer_dcharsPeek cs)))))

# 242 "Vuna/Compiler/Frontend/Lexer.vuna"
let rec v_Vuna_dCompiler_dFrontend_dLexer_dskipBlockComment = (fun fuel depth cs -> (if (fuel <= 0) then (Vuna_dCompiler_dBase_dDiag.v_Vuna_dCompiler_dBase_dDiag_dicFuel "lexer") else (if (v_Vuna_dCompiler_dFrontend_dLexer_dcharsEmpty cs) then ((Vuna_dCompiler_dBase_dDiagnostics_dFrontend.v_Vuna_dCompiler_dBase_dDiagnostics_dFrontend_dlexErr0At (v_Vuna_dCompiler_dFrontend_dLexer_dlexSpanAt (v_Vuna_dCompiler_dFrontend_dLexer_dcharsPos cs))) Vuna_dCompiler_dBase_dDiagnostics_dFrontend.C_Vuna_dCompiler_dBase_dDiagnostics_dFrontend_dLexDiag_UnterminatedBlockComment) else ((fun c -> ((fun c2 -> (if (c2 < 0) then (((v_Vuna_dCompiler_dFrontend_dLexer_dskipBlockComment (fuel - 1)) depth) ((v_Vuna_dCompiler_dFrontend_dLexer_dcharsStep c) cs)) else (if (if (c = 123) then (c2 = 45) else false) then (((v_Vuna_dCompiler_dFrontend_dLexer_dskipBlockComment (fuel - 1)) (depth + 1)) (v_Vuna_dCompiler_dFrontend_dLexer_dcharsNext2 cs)) else (if (if (c = 45) then (c2 = 125) else false) then (if (depth = 1) then (Vuna_dCompiler_dBase_dDiag.C_Vuna_dCompiler_dBase_dDiag_dCheck_OkC ((v_Vuna_dCompiler_dFrontend_dLexer_dcharsNext2 cs))) else (((v_Vuna_dCompiler_dFrontend_dLexer_dskipBlockComment (fuel - 1)) (depth - 1)) (v_Vuna_dCompiler_dFrontend_dLexer_dcharsNext2 cs))) else (((v_Vuna_dCompiler_dFrontend_dLexer_dskipBlockComment (fuel - 1)) depth) ((v_Vuna_dCompiler_dFrontend_dLexer_dcharsStep c) cs)))))) ((v_Vuna_dCompiler_dFrontend_dLexer_dcharsPeekAt 1) cs))) (v_Vuna_dCompiler_dFrontend_dLexer_dcharsPeek cs)))))

# 256 "Vuna/Compiler/Frontend/Lexer.vuna"
let v_Vuna_dCompiler_dFrontend_dLexer_dcommentSpanOf = (fun startP endP -> { Vuna_dCompiler_dBase_dSource.f_Vuna_dCompiler_dBase_dSource_dSpan_spanFile = ""; Vuna_dCompiler_dBase_dSource.f_Vuna_dCompiler_dBase_dSource_dSpan_spanStartLine = (Vuna_dCompiler_dBase_dSource.v_Vuna_dCompiler_dBase_dSource_dposLine startP); Vuna_dCompiler_dBase_dSource.f_Vuna_dCompiler_dBase_dSource_dSpan_spanStartCol = (Vuna_dCompiler_dBase_dSource.v_Vuna_dCompiler_dBase_dSource_dposCol startP); Vuna_dCompiler_dBase_dSource.f_Vuna_dCompiler_dBase_dSource_dSpan_spanEndLine = (Vuna_dCompiler_dBase_dSource.v_Vuna_dCompiler_dBase_dSource_dposLine endP); Vuna_dCompiler_dBase_dSource.f_Vuna_dCompiler_dBase_dSource_dSpan_spanEndCol = (Vuna_dCompiler_dBase_dSource.v_Vuna_dCompiler_dBase_dSource_dposCol endP); Vuna_dCompiler_dBase_dSource.f_Vuna_dCompiler_dBase_dSource_dSpan_spanStartOffset = (Vuna_dCompiler_dBase_dSource.v_Vuna_dCompiler_dBase_dSource_dposOffset startP); Vuna_dCompiler_dBase_dSource.f_Vuna_dCompiler_dBase_dSource_dSpan_spanEndOffset = (Vuna_dCompiler_dBase_dSource.v_Vuna_dCompiler_dBase_dSource_dposOffset endP) })

# 276 "Vuna/Compiler/Frontend/Lexer.vuna"
let rec v_Vuna_dCompiler_dFrontend_dLexer_dskipTrivia = (fun fuel cs -> (if (fuel <= 0) then (Vuna_dCompiler_dBase_dDiag.v_Vuna_dCompiler_dBase_dDiag_dicFuel "lexer") else (if (v_Vuna_dCompiler_dFrontend_dLexer_dcharsEmpty cs) then (Vuna_dCompiler_dBase_dDiag.C_Vuna_dCompiler_dBase_dDiag_dCheck_OkC (cs)) else ((fun c -> ((fun c2 -> (if (v_Vuna_dCompiler_dFrontend_dLexer_disSpace c) then ((v_Vuna_dCompiler_dFrontend_dLexer_dskipTrivia (fuel - 1)) ((v_Vuna_dCompiler_dFrontend_dLexer_dcharsStep c) cs)) else (if (c2 < 0) then (Vuna_dCompiler_dBase_dDiag.C_Vuna_dCompiler_dBase_dDiag_dCheck_OkC (cs)) else (if (if (c = 45) then (c2 = 45) else false) then (match ((v_Vuna_dCompiler_dFrontend_dLexer_dskipLineComment (fuel - 1)) ((v_Vuna_dCompiler_dFrontend_dLexer_dcharsStep c) cs)) with
  | Vuna_dCompiler_dBase_dDiag.C_Vuna_dCompiler_dBase_dDiag_dCheck_ErrC (dtb__15) -> (Vuna_dCompiler_dBase_dDiag.C_Vuna_dCompiler_dBase_dDiag_dCheck_ErrC (dtb__15))
  | Vuna_dCompiler_dBase_dDiag.C_Vuna_dCompiler_dBase_dDiag_dCheck_OkC (dtb__16) -> ((v_Vuna_dCompiler_dFrontend_dLexer_dskipTrivia (fuel - 1)) dtb__16)
  | _ -> failwith "DT: impossible branch"
) else (if (if (c = 123) then (c2 = 45) else false) then (match (((v_Vuna_dCompiler_dFrontend_dLexer_dskipBlockComment (fuel - 1)) 1) ((v_Vuna_dCompiler_dFrontend_dLexer_dcharsStep c) cs)) with
  | Vuna_dCompiler_dBase_dDiag.C_Vuna_dCompiler_dBase_dDiag_dCheck_ErrC (dtb__17) -> (Vuna_dCompiler_dBase_dDiag.C_Vuna_dCompiler_dBase_dDiag_dCheck_ErrC (dtb__17))
  | Vuna_dCompiler_dBase_dDiag.C_Vuna_dCompiler_dBase_dDiag_dCheck_OkC (dtb__18) -> ((v_Vuna_dCompiler_dFrontend_dLexer_dskipTrivia (fuel - 1)) dtb__18)
  | _ -> failwith "DT: impossible branch"
) else (Vuna_dCompiler_dBase_dDiag.C_Vuna_dCompiler_dBase_dDiag_dCheck_OkC (cs))))))) ((v_Vuna_dCompiler_dFrontend_dLexer_dcharsPeekAt 1) cs))) (v_Vuna_dCompiler_dFrontend_dLexer_dcharsPeek cs)))))

# 297 "Vuna/Compiler/Frontend/Lexer.vuna"
let rec v_Vuna_dCompiler_dFrontend_dLexer_dskipTriviaCommentsGo = (fun fuel acc cs -> (if (fuel <= 0) then (Vuna_dCompiler_dBase_dDiag.v_Vuna_dCompiler_dBase_dDiag_dicFuel "lexer") else (if (v_Vuna_dCompiler_dFrontend_dLexer_dcharsEmpty cs) then (Vuna_dCompiler_dBase_dDiag.C_Vuna_dCompiler_dBase_dDiag_dCheck_OkC ({ Base_dData_dPair.f_Base_dData_dPair_dPair_first = cs; Base_dData_dPair.f_Base_dData_dPair_dPair_second = (Base_dData_dList.v_Base_dData_dList_dreverse acc) })) else ((fun c -> ((fun c2 -> ((fun p -> (if (v_Vuna_dCompiler_dFrontend_dLexer_disSpace c) then (((v_Vuna_dCompiler_dFrontend_dLexer_dskipTriviaCommentsGo (fuel - 1)) acc) ((v_Vuna_dCompiler_dFrontend_dLexer_dcharsStep c) cs)) else (if (c2 < 0) then (Vuna_dCompiler_dBase_dDiag.C_Vuna_dCompiler_dBase_dDiag_dCheck_OkC ({ Base_dData_dPair.f_Base_dData_dPair_dPair_first = cs; Base_dData_dPair.f_Base_dData_dPair_dPair_second = (Base_dData_dList.v_Base_dData_dList_dreverse acc) })) else (if (if (c = 45) then (c2 = 45) else false) then ((fun nd_uscrut6 -> (match nd_uscrut6 with
  | Vuna_dCompiler_dBase_dDiag.C_Vuna_dCompiler_dBase_dDiag_dCheck_OkC (dtb__19) -> (match dtb__19 with
  | { Base_dData_dPair.f_Base_dData_dPair_dPair_first = dtb__20; Base_dData_dPair.f_Base_dData_dPair_dPair_second = dtb__21 } -> (match dtb__21 with
  | { Base_dData_dPair.f_Base_dData_dPair_dPair_first = dtb__22; Base_dData_dPair.f_Base_dData_dPair_dPair_second = dtb__23 } -> (((v_Vuna_dCompiler_dFrontend_dLexer_dskipTriviaCommentsGo (fuel - 1)) (Base_dData_dList.C_Base_dData_dList_dList__x58__x58_ ({ f_Vuna_dCompiler_dFrontend_dLexer_dComment_commentKind = C_Vuna_dCompiler_dFrontend_dLexer_dCKind_CLine; f_Vuna_dCompiler_dFrontend_dLexer_dComment_commentText = (v_Vuna_dCompiler_dFrontend_dLexer_dtrimTrailingSpace dtb__20); f_Vuna_dCompiler_dFrontend_dLexer_dComment_commentSpan = ((v_Vuna_dCompiler_dFrontend_dLexer_dcommentSpanOf p) dtb__23) }, acc))) dtb__22)
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
)
  | Vuna_dCompiler_dBase_dDiag.C_Vuna_dCompiler_dBase_dDiag_dCheck_ErrC (dtb__24) -> (Vuna_dCompiler_dBase_dDiag.C_Vuna_dCompiler_dBase_dDiag_dCheck_ErrC (dtb__24))
  | _ -> failwith "DT: impossible branch"
)) ((((v_Vuna_dCompiler_dFrontend_dLexer_dcollectLineBody (fuel - 1)) (v_Vuna_dCompiler_dFrontend_dLexer_dcharsNext2 cs)) Base_dData_dList.C_Base_dData_dList_dList_Nil) (v_Vuna_dCompiler_dFrontend_dLexer_dcharsPos2 cs))) else (if (if (c = 123) then (c2 = 45) else false) then ((fun nd_uscrut6 -> (match nd_uscrut6 with
  | Vuna_dCompiler_dBase_dDiag.C_Vuna_dCompiler_dBase_dDiag_dCheck_OkC (dtb__25) -> (match dtb__25 with
  | { Base_dData_dPair.f_Base_dData_dPair_dPair_first = dtb__26; Base_dData_dPair.f_Base_dData_dPair_dPair_second = dtb__27 } -> (match dtb__27 with
  | { Base_dData_dPair.f_Base_dData_dPair_dPair_first = dtb__28; Base_dData_dPair.f_Base_dData_dPair_dPair_second = dtb__29 } -> (((v_Vuna_dCompiler_dFrontend_dLexer_dskipTriviaCommentsGo (fuel - 1)) (Base_dData_dList.C_Base_dData_dList_dList__x58__x58_ ({ f_Vuna_dCompiler_dFrontend_dLexer_dComment_commentKind = C_Vuna_dCompiler_dFrontend_dLexer_dCKind_CBlock; f_Vuna_dCompiler_dFrontend_dLexer_dComment_commentText = dtb__26; f_Vuna_dCompiler_dFrontend_dLexer_dComment_commentSpan = ((v_Vuna_dCompiler_dFrontend_dLexer_dcommentSpanOf p) dtb__29) }, acc))) dtb__28)
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
)
  | Vuna_dCompiler_dBase_dDiag.C_Vuna_dCompiler_dBase_dDiag_dCheck_ErrC (dtb__30) -> (Vuna_dCompiler_dBase_dDiag.C_Vuna_dCompiler_dBase_dDiag_dCheck_ErrC (dtb__30))
  | _ -> failwith "DT: impossible branch"
)) (((((v_Vuna_dCompiler_dFrontend_dLexer_dcollectBlockBody (fuel - 1)) (v_Vuna_dCompiler_dFrontend_dLexer_dcharsNext2 cs)) 1) Base_dData_dList.C_Base_dData_dList_dList_Nil) (v_Vuna_dCompiler_dFrontend_dLexer_dcharsPos2 cs))) else (Vuna_dCompiler_dBase_dDiag.C_Vuna_dCompiler_dBase_dDiag_dCheck_OkC ({ Base_dData_dPair.f_Base_dData_dPair_dPair_first = cs; Base_dData_dPair.f_Base_dData_dPair_dPair_second = (Base_dData_dList.v_Base_dData_dList_dreverse acc) }))))))) (v_Vuna_dCompiler_dFrontend_dLexer_dcharsPos cs))) ((v_Vuna_dCompiler_dFrontend_dLexer_dcharsPeekAt 1) cs))) (v_Vuna_dCompiler_dFrontend_dLexer_dcharsPeek cs)))))

# 294 "Vuna/Compiler/Frontend/Lexer.vuna"
let v_Vuna_dCompiler_dFrontend_dLexer_dskipTriviaComments = (fun fuel cs -> (((v_Vuna_dCompiler_dFrontend_dLexer_dskipTriviaCommentsGo fuel) Base_dData_dList.C_Base_dData_dList_dList_Nil) cs))

# 323 "Vuna/Compiler/Frontend/Lexer.vuna"
let v_Vuna_dCompiler_dFrontend_dLexer_dstartsWithVunaAt = (fun cs -> (if (if (if (if (((v_Vuna_dCompiler_dFrontend_dLexer_dcharsPeekAt 0) cs) = 118) then (((v_Vuna_dCompiler_dFrontend_dLexer_dcharsPeekAt 1) cs) = 117) else false) then (((v_Vuna_dCompiler_dFrontend_dLexer_dcharsPeekAt 2) cs) = 110) else false) then (((v_Vuna_dCompiler_dFrontend_dLexer_dcharsPeekAt 3) cs) = 97) else false) then (((v_Vuna_dCompiler_dFrontend_dLexer_dcharsPeekAt 4) cs) = 64) else false))

# 331 "Vuna/Compiler/Frontend/Lexer.vuna"
let rec v_Vuna_dCompiler_dFrontend_dLexer_dcollectInternalIdent = (fun fuel cs acc -> (if (fuel <= 0) then (Vuna_dCompiler_dBase_dDiag.v_Vuna_dCompiler_dBase_dDiag_dicFuel "lexer") else (if (v_Vuna_dCompiler_dFrontend_dLexer_dcharsEmpty cs) then (Vuna_dCompiler_dBase_dDiag.C_Vuna_dCompiler_dBase_dDiag_dCheck_OkC ({ Base_dData_dPair.f_Base_dData_dPair_dPair_first = (Base_dData_dList.dtp_pack (Base_dData_dList.v_Base_dData_dList_dreverse acc)); Base_dData_dPair.f_Base_dData_dPair_dPair_second = cs })) else ((fun c -> (if (if (v_Vuna_dCompiler_dFrontend_dLexer_disIdentChar c) then true else (c = 64)) then (((v_Vuna_dCompiler_dFrontend_dLexer_dcollectInternalIdent (fuel - 1)) ((v_Vuna_dCompiler_dFrontend_dLexer_dcharsStep c) cs)) (Base_dData_dList.C_Base_dData_dList_dList__x58__x58_ (c, acc))) else (Vuna_dCompiler_dBase_dDiag.C_Vuna_dCompiler_dBase_dDiag_dCheck_OkC ({ Base_dData_dPair.f_Base_dData_dPair_dPair_first = (Base_dData_dList.dtp_pack (Base_dData_dList.v_Base_dData_dList_dreverse acc)); Base_dData_dPair.f_Base_dData_dPair_dPair_second = cs })))) (v_Vuna_dCompiler_dFrontend_dLexer_dcharsPeek cs)))))

# 340 "Vuna/Compiler/Frontend/Lexer.vuna"
let rec v_Vuna_dCompiler_dFrontend_dLexer_dcollectIdent = (fun fuel cs acc -> (if (fuel <= 0) then (Vuna_dCompiler_dBase_dDiag.v_Vuna_dCompiler_dBase_dDiag_dicFuel "lexer") else (if (v_Vuna_dCompiler_dFrontend_dLexer_dcharsEmpty cs) then (Vuna_dCompiler_dBase_dDiag.C_Vuna_dCompiler_dBase_dDiag_dCheck_OkC ({ Base_dData_dPair.f_Base_dData_dPair_dPair_first = (Base_dData_dList.dtp_pack (Base_dData_dList.v_Base_dData_dList_dreverse acc)); Base_dData_dPair.f_Base_dData_dPair_dPair_second = cs })) else ((fun c -> (if (v_Vuna_dCompiler_dFrontend_dLexer_disIdentChar c) then (((v_Vuna_dCompiler_dFrontend_dLexer_dcollectIdent (fuel - 1)) ((v_Vuna_dCompiler_dFrontend_dLexer_dcharsStep c) cs)) (Base_dData_dList.C_Base_dData_dList_dList__x58__x58_ (c, acc))) else (if (if (c = 46) then (v_Vuna_dCompiler_dFrontend_dLexer_disIdentStart ((v_Vuna_dCompiler_dFrontend_dLexer_dcharsPeekAt 1) cs)) else false) then (((v_Vuna_dCompiler_dFrontend_dLexer_dcollectIdent (fuel - 1)) ((v_Vuna_dCompiler_dFrontend_dLexer_dcharsStep c) cs)) (Base_dData_dList.C_Base_dData_dList_dList__x58__x58_ (c, acc))) else (Vuna_dCompiler_dBase_dDiag.C_Vuna_dCompiler_dBase_dDiag_dCheck_OkC ({ Base_dData_dPair.f_Base_dData_dPair_dPair_first = (Base_dData_dList.dtp_pack (Base_dData_dList.v_Base_dData_dList_dreverse acc)); Base_dData_dPair.f_Base_dData_dPair_dPair_second = cs }))))) (v_Vuna_dCompiler_dFrontend_dLexer_dcharsPeek cs)))))

# 353 "Vuna/Compiler/Frontend/Lexer.vuna"
let v_Vuna_dCompiler_dFrontend_dLexer_dmaxIntLiteral = 4611686018427387903

# 358 "Vuna/Compiler/Frontend/Lexer.vuna"
let rec v_Vuna_dCompiler_dFrontend_dLexer_dcollectInt = (fun fuel cs acc -> (if (fuel <= 0) then (Vuna_dCompiler_dBase_dDiag.v_Vuna_dCompiler_dBase_dDiag_dicFuel "lexer") else (if (v_Vuna_dCompiler_dFrontend_dLexer_dcharsEmpty cs) then (Vuna_dCompiler_dBase_dDiag.C_Vuna_dCompiler_dBase_dDiag_dCheck_OkC ({ Base_dData_dPair.f_Base_dData_dPair_dPair_first = acc; Base_dData_dPair.f_Base_dData_dPair_dPair_second = cs })) else ((fun c -> (if (v_Vuna_dCompiler_dFrontend_dLexer_disDigit c) then ((fun d -> (if (acc > (if 10 = 0 then failwith "division by zero" else (v_Vuna_dCompiler_dFrontend_dLexer_dmaxIntLiteral - d) / 10)) then ((Vuna_dCompiler_dBase_dDiagnostics_dFrontend.v_Vuna_dCompiler_dBase_dDiagnostics_dFrontend_dlexErr0At (v_Vuna_dCompiler_dFrontend_dLexer_dlexSpanAt (v_Vuna_dCompiler_dFrontend_dLexer_dcharsPos cs))) Vuna_dCompiler_dBase_dDiagnostics_dFrontend.C_Vuna_dCompiler_dBase_dDiagnostics_dFrontend_dLexDiag_IntLiteralOutOfRange) else (((v_Vuna_dCompiler_dFrontend_dLexer_dcollectInt (fuel - 1)) ((v_Vuna_dCompiler_dFrontend_dLexer_dcharsStep c) cs)) ((acc * 10) + d)))) (c - 48)) else (Vuna_dCompiler_dBase_dDiag.C_Vuna_dCompiler_dBase_dDiag_dCheck_OkC ({ Base_dData_dPair.f_Base_dData_dPair_dPair_first = acc; Base_dData_dPair.f_Base_dData_dPair_dPair_second = cs })))) (v_Vuna_dCompiler_dFrontend_dLexer_dcharsPeek cs)))))

# 377 "Vuna/Compiler/Frontend/Lexer.vuna"
let rec v_Vuna_dCompiler_dFrontend_dLexer_ddigitRunIsFloat = (fun fuel cs -> (if (fuel <= 0) then (Vuna_dCompiler_dBase_dDiag.v_Vuna_dCompiler_dBase_dDiag_dicFuel "lexer") else (if (v_Vuna_dCompiler_dFrontend_dLexer_dcharsEmpty cs) then (Vuna_dCompiler_dBase_dDiag.C_Vuna_dCompiler_dBase_dDiag_dCheck_OkC (false)) else ((fun c -> (if (v_Vuna_dCompiler_dFrontend_dLexer_disDigit c) then ((v_Vuna_dCompiler_dFrontend_dLexer_ddigitRunIsFloat (fuel - 1)) ((v_Vuna_dCompiler_dFrontend_dLexer_dcharsStep c) cs)) else (if (c = 46) then (Vuna_dCompiler_dBase_dDiag.C_Vuna_dCompiler_dBase_dDiag_dCheck_OkC ((v_Vuna_dCompiler_dFrontend_dLexer_disDigit ((v_Vuna_dCompiler_dFrontend_dLexer_dcharsPeekAt 1) cs)))) else (Vuna_dCompiler_dBase_dDiag.C_Vuna_dCompiler_dBase_dDiag_dCheck_OkC (false))))) (v_Vuna_dCompiler_dFrontend_dLexer_dcharsPeek cs)))))

# 399 "Vuna/Compiler/Frontend/Lexer.vuna"
let rec v_Vuna_dCompiler_dFrontend_dLexer_dcollectFrac = (fun fuel cs acc -> (if (fuel <= 0) then (Vuna_dCompiler_dBase_dDiag.v_Vuna_dCompiler_dBase_dDiag_dicFuel "lexer") else (if (v_Vuna_dCompiler_dFrontend_dLexer_dcharsEmpty cs) then (Vuna_dCompiler_dBase_dDiag.C_Vuna_dCompiler_dBase_dDiag_dCheck_OkC ({ Base_dData_dPair.f_Base_dData_dPair_dPair_first = (Base_dData_dList.dtp_pack (Base_dData_dList.v_Base_dData_dList_dreverse acc)); Base_dData_dPair.f_Base_dData_dPair_dPair_second = cs })) else ((fun c -> (if (v_Vuna_dCompiler_dFrontend_dLexer_disDigit c) then (((v_Vuna_dCompiler_dFrontend_dLexer_dcollectFrac (fuel - 1)) ((v_Vuna_dCompiler_dFrontend_dLexer_dcharsStep c) cs)) (Base_dData_dList.C_Base_dData_dList_dList__x58__x58_ (c, acc))) else (Vuna_dCompiler_dBase_dDiag.C_Vuna_dCompiler_dBase_dDiag_dCheck_OkC ({ Base_dData_dPair.f_Base_dData_dPair_dPair_first = (Base_dData_dList.dtp_pack (Base_dData_dList.v_Base_dData_dList_dreverse acc)); Base_dData_dPair.f_Base_dData_dPair_dPair_second = cs })))) (v_Vuna_dCompiler_dFrontend_dLexer_dcharsPeek cs)))))

# 388 "Vuna/Compiler/Frontend/Lexer.vuna"
let rec v_Vuna_dCompiler_dFrontend_dLexer_dcollectFloat = (fun fuel cs acc -> (if (fuel <= 0) then (Vuna_dCompiler_dBase_dDiag.v_Vuna_dCompiler_dBase_dDiag_dicFuel "lexer") else (if (v_Vuna_dCompiler_dFrontend_dLexer_dcharsEmpty cs) then (Vuna_dCompiler_dBase_dDiag.C_Vuna_dCompiler_dBase_dDiag_dCheck_OkC ({ Base_dData_dPair.f_Base_dData_dPair_dPair_first = (Base_dData_dList.dtp_pack (Base_dData_dList.v_Base_dData_dList_dreverse acc)); Base_dData_dPair.f_Base_dData_dPair_dPair_second = cs })) else ((fun c -> (if (v_Vuna_dCompiler_dFrontend_dLexer_disDigit c) then (((v_Vuna_dCompiler_dFrontend_dLexer_dcollectFloat (fuel - 1)) ((v_Vuna_dCompiler_dFrontend_dLexer_dcharsStep c) cs)) (Base_dData_dList.C_Base_dData_dList_dList__x58__x58_ (c, acc))) else (if (c = 46) then (((v_Vuna_dCompiler_dFrontend_dLexer_dcollectFrac (fuel - 1)) ((v_Vuna_dCompiler_dFrontend_dLexer_dcharsStep c) cs)) (Base_dData_dList.C_Base_dData_dList_dList__x58__x58_ (c, acc))) else (Vuna_dCompiler_dBase_dDiag.C_Vuna_dCompiler_dBase_dDiag_dCheck_OkC ({ Base_dData_dPair.f_Base_dData_dPair_dPair_first = (Base_dData_dList.dtp_pack (Base_dData_dList.v_Base_dData_dList_dreverse acc)); Base_dData_dPair.f_Base_dData_dPair_dPair_second = cs }))))) (v_Vuna_dCompiler_dFrontend_dLexer_dcharsPeek cs)))))

# 408 "Vuna/Compiler/Frontend/Lexer.vuna"
let rec v_Vuna_dCompiler_dFrontend_dLexer_dcollectOp = (fun fuel cs acc -> (if (fuel <= 0) then (Vuna_dCompiler_dBase_dDiag.v_Vuna_dCompiler_dBase_dDiag_dicFuel "lexer") else (if (v_Vuna_dCompiler_dFrontend_dLexer_dcharsEmpty cs) then (Vuna_dCompiler_dBase_dDiag.C_Vuna_dCompiler_dBase_dDiag_dCheck_OkC ({ Base_dData_dPair.f_Base_dData_dPair_dPair_first = (Base_dData_dList.dtp_pack (Base_dData_dList.v_Base_dData_dList_dreverse acc)); Base_dData_dPair.f_Base_dData_dPair_dPair_second = cs })) else ((fun c -> (if (v_Vuna_dCompiler_dFrontend_dLexer_disOpChar c) then (((v_Vuna_dCompiler_dFrontend_dLexer_dcollectOp (fuel - 1)) ((v_Vuna_dCompiler_dFrontend_dLexer_dcharsStep c) cs)) (Base_dData_dList.C_Base_dData_dList_dList__x58__x58_ (c, acc))) else (Vuna_dCompiler_dBase_dDiag.C_Vuna_dCompiler_dBase_dDiag_dCheck_OkC ({ Base_dData_dPair.f_Base_dData_dPair_dPair_first = (Base_dData_dList.dtp_pack (Base_dData_dList.v_Base_dData_dList_dreverse acc)); Base_dData_dPair.f_Base_dData_dPair_dPair_second = cs })))) (v_Vuna_dCompiler_dFrontend_dLexer_dcharsPeek cs)))))

# 429 "Vuna/Compiler/Frontend/Lexer.vuna"
let v_Vuna_dCompiler_dFrontend_dLexer_ddecodeEscape = (fun mc0 -> (if (mc0 = 110) then (Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Just (10)) else (if (mc0 = 116) then (Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Just (9)) else (if (mc0 = 114) then (Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Just (13)) else (if (mc0 = 34) then (Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Just (34)) else (if (mc0 = 92) then (Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Just (92)) else (if (mc0 = 39) then (Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Just (39)) else (if (mc0 = 36) then (Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Just (36)) else Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Nothing))))))))

# 439 "Vuna/Compiler/Frontend/Lexer.vuna"
let v_Vuna_dCompiler_dFrontend_dLexer_ddropOpeningNewline = (fun cs -> (if (v_Vuna_dCompiler_dFrontend_dLexer_dcharsEmpty cs) then cs else ((fun c -> (if (c = 10) then ((v_Vuna_dCompiler_dFrontend_dLexer_dcharsStep c) cs) else cs)) (v_Vuna_dCompiler_dFrontend_dLexer_dcharsPeek cs))))

# 446 "Vuna/Compiler/Frontend/Lexer.vuna"
let v_Vuna_dCompiler_dFrontend_dLexer_dflushText = (fun mc0 mc1 -> (match mc0 with
  | Base_dData_dList.C_Base_dData_dList_dList_Nil -> mc1
  | _ -> (Base_dData_dList.C_Base_dData_dList_dList__x58__x58_ ((C_Vuna_dCompiler_dFrontend_dLexer_dTmplPart_TPText ((Base_dData_dList.dtp_pack (Base_dData_dList.v_Base_dData_dList_dreverse mc0)))), mc1))
))

# 503 "Vuna/Compiler/Frontend/Lexer.vuna"
let v_Vuna_dCompiler_dFrontend_dLexer_ddepthAfter = (fun mc0 mc1 -> (match mc1 with
  | C_Vuna_dCompiler_dFrontend_dLexer_dTok_TSym (dtb__31) -> (if (dtb__31 = "{") then (mc0 + 1) else (if (dtb__31 = "}") then (if (mc0 > 0) then (mc0 - 1) else 0) else mc0))
  | _ -> mc0
))

# 453 "Vuna/Compiler/Frontend/Lexer.vuna"
let rec v_Vuna_dCompiler_dFrontend_dLexer_dscanTemplateText = (fun fuel multi cs acc parts -> (if (fuel <= 0) then (Vuna_dCompiler_dBase_dDiag.v_Vuna_dCompiler_dBase_dDiag_dicFuel "lexer") else (if (v_Vuna_dCompiler_dFrontend_dLexer_dcharsEmpty cs) then ((Vuna_dCompiler_dBase_dDiagnostics_dFrontend.v_Vuna_dCompiler_dBase_dDiagnostics_dFrontend_dlexErr0At (v_Vuna_dCompiler_dFrontend_dLexer_dlexSpanAt (v_Vuna_dCompiler_dFrontend_dLexer_dcharsPos cs))) Vuna_dCompiler_dBase_dDiagnostics_dFrontend.C_Vuna_dCompiler_dBase_dDiagnostics_dFrontend_dLexDiag_UnterminatedString) else ((fun c -> ((fun c2 -> ((fun c3 -> ((fun p -> (if (c = 36) then (if (c2 = 123) then ((fun nd_uscrut9 -> (match nd_uscrut9 with
  | Vuna_dCompiler_dBase_dDiag.C_Vuna_dCompiler_dBase_dDiag_dCheck_OkC (dtb__32) -> (match dtb__32 with
  | { Base_dData_dPair.f_Base_dData_dPair_dPair_first = dtb__33; Base_dData_dPair.f_Base_dData_dPair_dPair_second = dtb__34 } -> (if ((v_Vuna_dCompiler_dFrontend_dLexer_dcharsPeek dtb__34) = 125) then (((((v_Vuna_dCompiler_dFrontend_dLexer_dscanTemplateText (fuel - 1)) multi) (v_Vuna_dCompiler_dFrontend_dLexer_dcharsNext dtb__34)) Base_dData_dList.C_Base_dData_dList_dList_Nil) (Base_dData_dList.C_Base_dData_dList_dList__x58__x58_ ((C_Vuna_dCompiler_dFrontend_dLexer_dTmplPart_TPHole (dtb__33)), ((v_Vuna_dCompiler_dFrontend_dLexer_dflushText acc) parts)))) else ((Vuna_dCompiler_dBase_dDiagnostics_dFrontend.v_Vuna_dCompiler_dBase_dDiagnostics_dFrontend_dlexErr0At (v_Vuna_dCompiler_dFrontend_dLexer_dlexSpanAt p)) Vuna_dCompiler_dBase_dDiagnostics_dFrontend.C_Vuna_dCompiler_dBase_dDiagnostics_dFrontend_dLexDiag_UnterminatedInterpolation))
  | _ -> failwith "DT: impossible branch"
)
  | Vuna_dCompiler_dBase_dDiag.C_Vuna_dCompiler_dBase_dDiag_dCheck_ErrC (dtb__35) -> (Vuna_dCompiler_dBase_dDiag.C_Vuna_dCompiler_dBase_dDiag_dCheck_ErrC (dtb__35))
  | _ -> failwith "DT: impossible branch"
)) ((((v_Vuna_dCompiler_dFrontend_dLexer_dlexHoleTokens (fuel - 1)) 0) (v_Vuna_dCompiler_dFrontend_dLexer_dcharsNext2 cs)) Base_dData_dList.C_Base_dData_dList_dList_Nil)) else (((((v_Vuna_dCompiler_dFrontend_dLexer_dscanTemplateText (fuel - 1)) multi) ((v_Vuna_dCompiler_dFrontend_dLexer_dcharsStep c) cs)) (Base_dData_dList.C_Base_dData_dList_dList__x58__x58_ (c, acc))) parts)) else (if (c = 92) then (if (c2 < 0) then ((Vuna_dCompiler_dBase_dDiagnostics_dFrontend.v_Vuna_dCompiler_dBase_dDiagnostics_dFrontend_dlexErr0At (v_Vuna_dCompiler_dFrontend_dLexer_dlexSpanAt p)) Vuna_dCompiler_dBase_dDiagnostics_dFrontend.C_Vuna_dCompiler_dBase_dDiagnostics_dFrontend_dLexDiag_UnterminatedString) else (match (v_Vuna_dCompiler_dFrontend_dLexer_ddecodeEscape c2) with
  | Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Nothing -> ((Vuna_dCompiler_dBase_dDiagnostics_dFrontend.v_Vuna_dCompiler_dBase_dDiagnostics_dFrontend_dlexErr0At (v_Vuna_dCompiler_dFrontend_dLexer_dlexSpanAt p)) Vuna_dCompiler_dBase_dDiagnostics_dFrontend.C_Vuna_dCompiler_dBase_dDiagnostics_dFrontend_dLexDiag_UnknownEscape)
  | Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Just (dtb__36) -> (((((v_Vuna_dCompiler_dFrontend_dLexer_dscanTemplateText (fuel - 1)) multi) (v_Vuna_dCompiler_dFrontend_dLexer_dcharsNext2 cs)) (Base_dData_dList.C_Base_dData_dList_dList__x58__x58_ (dtb__36, acc))) parts)
  | _ -> failwith "DT: impossible branch"
)) else (if (if multi then (c = 34) else false) then (if (if (c2 = 34) then (c3 = 34) else false) then ((fun pos3 -> (Vuna_dCompiler_dBase_dDiag.C_Vuna_dCompiler_dBase_dDiag_dCheck_OkC ({ Base_dData_dPair.f_Base_dData_dPair_dPair_first = (Base_dData_dList.v_Base_dData_dList_dreverse ((v_Vuna_dCompiler_dFrontend_dLexer_dflushText acc) parts)); Base_dData_dPair.f_Base_dData_dPair_dPair_second = { Base_dData_dPair.f_Base_dData_dPair_dPair_first = (v_Vuna_dCompiler_dFrontend_dLexer_dcharsNext2 (v_Vuna_dCompiler_dFrontend_dLexer_dcharsNext cs)); Base_dData_dPair.f_Base_dData_dPair_dPair_second = pos3 } }))) (v_Vuna_dCompiler_dFrontend_dLexer_dcharsPos2 cs)) else (((((v_Vuna_dCompiler_dFrontend_dLexer_dscanTemplateText (fuel - 1)) multi) ((v_Vuna_dCompiler_dFrontend_dLexer_dcharsStep c) cs)) (Base_dData_dList.C_Base_dData_dList_dList__x58__x58_ (c, acc))) parts)) else (if (if (Base_dData_dBool.v_Base_dData_dBool_dnot multi) then (c = 34) else false) then (Vuna_dCompiler_dBase_dDiag.C_Vuna_dCompiler_dBase_dDiag_dCheck_OkC ({ Base_dData_dPair.f_Base_dData_dPair_dPair_first = (Base_dData_dList.v_Base_dData_dList_dreverse ((v_Vuna_dCompiler_dFrontend_dLexer_dflushText acc) parts)); Base_dData_dPair.f_Base_dData_dPair_dPair_second = { Base_dData_dPair.f_Base_dData_dPair_dPair_first = ((v_Vuna_dCompiler_dFrontend_dLexer_dcharsStep c) cs); Base_dData_dPair.f_Base_dData_dPair_dPair_second = p } })) else (if (if (Base_dData_dBool.v_Base_dData_dBool_dnot multi) then (c = 10) else false) then ((Vuna_dCompiler_dBase_dDiagnostics_dFrontend.v_Vuna_dCompiler_dBase_dDiagnostics_dFrontend_dlexErr0At (v_Vuna_dCompiler_dFrontend_dLexer_dlexSpanAt p)) Vuna_dCompiler_dBase_dDiagnostics_dFrontend.C_Vuna_dCompiler_dBase_dDiagnostics_dFrontend_dLexDiag_UnterminatedString) else (((((v_Vuna_dCompiler_dFrontend_dLexer_dscanTemplateText (fuel - 1)) multi) ((v_Vuna_dCompiler_dFrontend_dLexer_dcharsStep c) cs)) (Base_dData_dList.C_Base_dData_dList_dList__x58__x58_ (c, acc))) parts))))))) (v_Vuna_dCompiler_dFrontend_dLexer_dcharsPos cs))) ((v_Vuna_dCompiler_dFrontend_dLexer_dcharsPeekAt 2) cs))) ((v_Vuna_dCompiler_dFrontend_dLexer_dcharsPeekAt 1) cs))) (v_Vuna_dCompiler_dFrontend_dLexer_dcharsPeek cs)))))
# 490 "Vuna/Compiler/Frontend/Lexer.vuna"
and v_Vuna_dCompiler_dFrontend_dLexer_dlexHoleTokens = (fun fuel depth cs acc -> (if (fuel <= 0) then (Vuna_dCompiler_dBase_dDiag.v_Vuna_dCompiler_dBase_dDiag_dicFuel "lexer") else (match ((v_Vuna_dCompiler_dFrontend_dLexer_dskipTrivia (fuel - 1)) cs) with
  | Vuna_dCompiler_dBase_dDiag.C_Vuna_dCompiler_dBase_dDiag_dCheck_ErrC (dtb__37) -> (Vuna_dCompiler_dBase_dDiag.C_Vuna_dCompiler_dBase_dDiag_dCheck_ErrC (dtb__37))
  | Vuna_dCompiler_dBase_dDiag.C_Vuna_dCompiler_dBase_dDiag_dCheck_OkC (dtb__38) -> (if (v_Vuna_dCompiler_dFrontend_dLexer_dcharsEmpty dtb__38) then ((Vuna_dCompiler_dBase_dDiagnostics_dFrontend.v_Vuna_dCompiler_dBase_dDiagnostics_dFrontend_dlexErr0At (v_Vuna_dCompiler_dFrontend_dLexer_dlexSpanAt (v_Vuna_dCompiler_dFrontend_dLexer_dcharsPos dtb__38))) Vuna_dCompiler_dBase_dDiagnostics_dFrontend.C_Vuna_dCompiler_dBase_dDiagnostics_dFrontend_dLexDiag_UnterminatedInterpolation) else (if (if ((v_Vuna_dCompiler_dFrontend_dLexer_dcharsPeek dtb__38) = 125) then (depth = 0) else false) then (Vuna_dCompiler_dBase_dDiag.C_Vuna_dCompiler_dBase_dDiag_dCheck_OkC ({ Base_dData_dPair.f_Base_dData_dPair_dPair_first = (Base_dData_dList.v_Base_dData_dList_dreverse acc); Base_dData_dPair.f_Base_dData_dPair_dPair_second = dtb__38 })) else ((fun nd_uscrut6 -> (match nd_uscrut6 with
  | Vuna_dCompiler_dBase_dDiag.C_Vuna_dCompiler_dBase_dDiag_dCheck_OkC (dtb__39) -> (match dtb__39 with
  | { Base_dData_dPair.f_Base_dData_dPair_dPair_first = dtb__40; Base_dData_dPair.f_Base_dData_dPair_dPair_second = dtb__41 } -> ((((v_Vuna_dCompiler_dFrontend_dLexer_dlexHoleTokens (fuel - 1)) ((v_Vuna_dCompiler_dFrontend_dLexer_ddepthAfter depth) (dtb__40).f_Vuna_dCompiler_dFrontend_dLexer_dPTok_ptokTok)) dtb__41) (Base_dData_dList.C_Base_dData_dList_dList__x58__x58_ (((v_Vuna_dCompiler_dFrontend_dLexer_dsetTokEnd dtb__41) dtb__40), acc)))
  | _ -> failwith "DT: impossible branch"
)
  | Vuna_dCompiler_dBase_dDiag.C_Vuna_dCompiler_dBase_dDiag_dCheck_ErrC (dtb__42) -> (Vuna_dCompiler_dBase_dDiag.C_Vuna_dCompiler_dBase_dDiag_dCheck_ErrC (dtb__42))
  | _ -> failwith "DT: impossible branch"
)) ((v_Vuna_dCompiler_dFrontend_dLexer_dlexOneToken (fuel - 1)) dtb__38))))
  | _ -> failwith "DT: impossible branch"
)))
# 509 "Vuna/Compiler/Frontend/Lexer.vuna"
and v_Vuna_dCompiler_dFrontend_dLexer_dlexOneToken = (fun fuel cs -> (if (fuel <= 0) then (Vuna_dCompiler_dBase_dDiag.v_Vuna_dCompiler_dBase_dDiag_dicFuel "lexer") else (if (v_Vuna_dCompiler_dFrontend_dLexer_dcharsEmpty cs) then (Vuna_dCompiler_dBase_dDiag.v_Vuna_dCompiler_dBase_dDiag_dicInternal "lexOneToken on empty input") else ((fun c -> ((fun p -> ((fun next -> (if (if (c = 64) then (v_Vuna_dCompiler_dFrontend_dLexer_dstartsWithVunaAt next) else false) then ((fun nd_uscrut5 -> (match nd_uscrut5 with
  | Vuna_dCompiler_dBase_dDiag.C_Vuna_dCompiler_dBase_dDiag_dCheck_OkC (dtb__43) -> (match dtb__43 with
  | { Base_dData_dPair.f_Base_dData_dPair_dPair_first = dtb__44; Base_dData_dPair.f_Base_dData_dPair_dPair_second = dtb__45 } -> (Vuna_dCompiler_dBase_dDiag.C_Vuna_dCompiler_dBase_dDiag_dCheck_OkC ({ Base_dData_dPair.f_Base_dData_dPair_dPair_first = { f_Vuna_dCompiler_dFrontend_dLexer_dPTok_ptokTok = (v_Vuna_dCompiler_dFrontend_dLexer_dclassifyIdent dtb__44); f_Vuna_dCompiler_dFrontend_dLexer_dPTok_ptokPos = p }; Base_dData_dPair.f_Base_dData_dPair_dPair_second = dtb__45 }))
  | _ -> failwith "DT: impossible branch"
)
  | Vuna_dCompiler_dBase_dDiag.C_Vuna_dCompiler_dBase_dDiag_dCheck_ErrC (dtb__46) -> (Vuna_dCompiler_dBase_dDiag.C_Vuna_dCompiler_dBase_dDiag_dCheck_ErrC (dtb__46))
  | _ -> failwith "DT: impossible branch"
)) (((v_Vuna_dCompiler_dFrontend_dLexer_dcollectInternalIdent (fuel - 1)) next) (Base_dData_dList.C_Base_dData_dList_dList__x58__x58_ (c, Base_dData_dList.C_Base_dData_dList_dList_Nil)))) else (if (v_Vuna_dCompiler_dFrontend_dLexer_disIdentStart c) then ((fun nd_uscrut5 -> (match nd_uscrut5 with
  | Vuna_dCompiler_dBase_dDiag.C_Vuna_dCompiler_dBase_dDiag_dCheck_OkC (dtb__47) -> (match dtb__47 with
  | { Base_dData_dPair.f_Base_dData_dPair_dPair_first = dtb__48; Base_dData_dPair.f_Base_dData_dPair_dPair_second = dtb__49 } -> (Vuna_dCompiler_dBase_dDiag.C_Vuna_dCompiler_dBase_dDiag_dCheck_OkC ({ Base_dData_dPair.f_Base_dData_dPair_dPair_first = { f_Vuna_dCompiler_dFrontend_dLexer_dPTok_ptokTok = (v_Vuna_dCompiler_dFrontend_dLexer_dclassifyIdent dtb__48); f_Vuna_dCompiler_dFrontend_dLexer_dPTok_ptokPos = p }; Base_dData_dPair.f_Base_dData_dPair_dPair_second = dtb__49 }))
  | _ -> failwith "DT: impossible branch"
)
  | Vuna_dCompiler_dBase_dDiag.C_Vuna_dCompiler_dBase_dDiag_dCheck_ErrC (dtb__50) -> (Vuna_dCompiler_dBase_dDiag.C_Vuna_dCompiler_dBase_dDiag_dCheck_ErrC (dtb__50))
  | _ -> failwith "DT: impossible branch"
)) (((v_Vuna_dCompiler_dFrontend_dLexer_dcollectIdent (fuel - 1)) next) (Base_dData_dList.C_Base_dData_dList_dList__x58__x58_ (c, Base_dData_dList.C_Base_dData_dList_dList_Nil)))) else (if (v_Vuna_dCompiler_dFrontend_dLexer_disDigit c) then ((fun nd_uscrut5 -> (match nd_uscrut5 with
  | Vuna_dCompiler_dBase_dDiag.C_Vuna_dCompiler_dBase_dDiag_dCheck_OkC (dtb__51) -> (if dtb__51 then ((fun nd_uscrut8 -> (match nd_uscrut8 with
  | Vuna_dCompiler_dBase_dDiag.C_Vuna_dCompiler_dBase_dDiag_dCheck_OkC (dtb__52) -> (match dtb__52 with
  | { Base_dData_dPair.f_Base_dData_dPair_dPair_first = dtb__53; Base_dData_dPair.f_Base_dData_dPair_dPair_second = dtb__54 } -> (Vuna_dCompiler_dBase_dDiag.C_Vuna_dCompiler_dBase_dDiag_dCheck_OkC ({ Base_dData_dPair.f_Base_dData_dPair_dPair_first = { f_Vuna_dCompiler_dFrontend_dLexer_dPTok_ptokTok = (C_Vuna_dCompiler_dFrontend_dLexer_dTok_TFloat (dtb__53)); f_Vuna_dCompiler_dFrontend_dLexer_dPTok_ptokPos = p }; Base_dData_dPair.f_Base_dData_dPair_dPair_second = dtb__54 }))
  | _ -> failwith "DT: impossible branch"
)
  | Vuna_dCompiler_dBase_dDiag.C_Vuna_dCompiler_dBase_dDiag_dCheck_ErrC (dtb__55) -> (Vuna_dCompiler_dBase_dDiag.C_Vuna_dCompiler_dBase_dDiag_dCheck_ErrC (dtb__55))
  | _ -> failwith "DT: impossible branch"
)) (((v_Vuna_dCompiler_dFrontend_dLexer_dcollectFloat (fuel - 1)) next) (Base_dData_dList.C_Base_dData_dList_dList__x58__x58_ (c, Base_dData_dList.C_Base_dData_dList_dList_Nil)))) else ((fun nd_uscrut8 -> (match nd_uscrut8 with
  | Vuna_dCompiler_dBase_dDiag.C_Vuna_dCompiler_dBase_dDiag_dCheck_OkC (dtb__56) -> (match dtb__56 with
  | { Base_dData_dPair.f_Base_dData_dPair_dPair_first = dtb__57; Base_dData_dPair.f_Base_dData_dPair_dPair_second = dtb__58 } -> (Vuna_dCompiler_dBase_dDiag.C_Vuna_dCompiler_dBase_dDiag_dCheck_OkC ({ Base_dData_dPair.f_Base_dData_dPair_dPair_first = { f_Vuna_dCompiler_dFrontend_dLexer_dPTok_ptokTok = (C_Vuna_dCompiler_dFrontend_dLexer_dTok_TInt (dtb__57)); f_Vuna_dCompiler_dFrontend_dLexer_dPTok_ptokPos = p }; Base_dData_dPair.f_Base_dData_dPair_dPair_second = dtb__58 }))
  | _ -> failwith "DT: impossible branch"
)
  | Vuna_dCompiler_dBase_dDiag.C_Vuna_dCompiler_dBase_dDiag_dCheck_ErrC (dtb__59) -> (Vuna_dCompiler_dBase_dDiag.C_Vuna_dCompiler_dBase_dDiag_dCheck_ErrC (dtb__59))
  | _ -> failwith "DT: impossible branch"
)) (((v_Vuna_dCompiler_dFrontend_dLexer_dcollectInt (fuel - 1)) next) (c - 48))))
  | Vuna_dCompiler_dBase_dDiag.C_Vuna_dCompiler_dBase_dDiag_dCheck_ErrC (dtb__60) -> (Vuna_dCompiler_dBase_dDiag.C_Vuna_dCompiler_dBase_dDiag_dCheck_ErrC (dtb__60))
  | _ -> failwith "DT: impossible branch"
)) ((v_Vuna_dCompiler_dFrontend_dLexer_ddigitRunIsFloat (fuel - 1)) next)) else (if (c = 34) then (((v_Vuna_dCompiler_dFrontend_dLexer_dlexStringToken (fuel - 1)) next) p) else (if (if (if (if (if (if (if (c = 40) then true else (c = 41)) then true else (c = 91)) then true else (c = 93)) then true else (c = 44)) then true else (c = 123)) then true else (c = 125)) then (Vuna_dCompiler_dBase_dDiag.C_Vuna_dCompiler_dBase_dDiag_dCheck_OkC ({ Base_dData_dPair.f_Base_dData_dPair_dPair_first = { f_Vuna_dCompiler_dFrontend_dLexer_dPTok_ptokTok = (C_Vuna_dCompiler_dFrontend_dLexer_dTok_TSym ((Base_dData_dList.dtp_pack (Base_dData_dList.C_Base_dData_dList_dList__x58__x58_ (c, Base_dData_dList.C_Base_dData_dList_dList_Nil))))); f_Vuna_dCompiler_dFrontend_dLexer_dPTok_ptokPos = p }; Base_dData_dPair.f_Base_dData_dPair_dPair_second = next })) else (if (c = 96) then (Vuna_dCompiler_dBase_dDiag.C_Vuna_dCompiler_dBase_dDiag_dCheck_OkC ({ Base_dData_dPair.f_Base_dData_dPair_dPair_first = { f_Vuna_dCompiler_dFrontend_dLexer_dPTok_ptokTok = (C_Vuna_dCompiler_dFrontend_dLexer_dTok_TSym ("`")); f_Vuna_dCompiler_dFrontend_dLexer_dPTok_ptokPos = p }; Base_dData_dPair.f_Base_dData_dPair_dPair_second = next })) else (if (v_Vuna_dCompiler_dFrontend_dLexer_disOpChar c) then ((fun nd_uscrut5 -> (match nd_uscrut5 with
  | Vuna_dCompiler_dBase_dDiag.C_Vuna_dCompiler_dBase_dDiag_dCheck_OkC (dtb__61) -> (match dtb__61 with
  | { Base_dData_dPair.f_Base_dData_dPair_dPair_first = dtb__62; Base_dData_dPair.f_Base_dData_dPair_dPair_second = dtb__63 } -> (Vuna_dCompiler_dBase_dDiag.C_Vuna_dCompiler_dBase_dDiag_dCheck_OkC ({ Base_dData_dPair.f_Base_dData_dPair_dPair_first = { f_Vuna_dCompiler_dFrontend_dLexer_dPTok_ptokTok = (C_Vuna_dCompiler_dFrontend_dLexer_dTok_TSym (dtb__62)); f_Vuna_dCompiler_dFrontend_dLexer_dPTok_ptokPos = p }; Base_dData_dPair.f_Base_dData_dPair_dPair_second = dtb__63 }))
  | _ -> failwith "DT: impossible branch"
)
  | Vuna_dCompiler_dBase_dDiag.C_Vuna_dCompiler_dBase_dDiag_dCheck_ErrC (dtb__64) -> (Vuna_dCompiler_dBase_dDiag.C_Vuna_dCompiler_dBase_dDiag_dCheck_ErrC (dtb__64))
  | _ -> failwith "DT: impossible branch"
)) (((v_Vuna_dCompiler_dFrontend_dLexer_dcollectOp (fuel - 1)) next) (Base_dData_dList.C_Base_dData_dList_dList__x58__x58_ (c, Base_dData_dList.C_Base_dData_dList_dList_Nil)))) else ((Vuna_dCompiler_dBase_dDiagnostics_dFrontend.v_Vuna_dCompiler_dBase_dDiagnostics_dFrontend_dlexErr0At (v_Vuna_dCompiler_dFrontend_dLexer_dlexSpanAt p)) Vuna_dCompiler_dBase_dDiagnostics_dFrontend.C_Vuna_dCompiler_dBase_dDiagnostics_dFrontend_dLexDiag_UnexpectedCharacter))))))))) ((v_Vuna_dCompiler_dFrontend_dLexer_dcharsStep c) cs))) (v_Vuna_dCompiler_dFrontend_dLexer_dcharsPos cs))) (v_Vuna_dCompiler_dFrontend_dLexer_dcharsPeek cs)))))
# 544 "Vuna/Compiler/Frontend/Lexer.vuna"
and v_Vuna_dCompiler_dFrontend_dLexer_dlexStringToken = (fun fuel cs p -> (if (fuel <= 0) then (Vuna_dCompiler_dBase_dDiag.v_Vuna_dCompiler_dBase_dDiag_dicFuel "lexer") else (if (if ((v_Vuna_dCompiler_dFrontend_dLexer_dcharsPeek cs) = 34) then (((v_Vuna_dCompiler_dFrontend_dLexer_dcharsPeekAt 1) cs) = 34) else false) then ((fun nd_uscrut3 -> (match nd_uscrut3 with
  | Vuna_dCompiler_dBase_dDiag.C_Vuna_dCompiler_dBase_dDiag_dCheck_OkC (dtb__65) -> (match dtb__65 with
  | { Base_dData_dPair.f_Base_dData_dPair_dPair_first = dtb__66; Base_dData_dPair.f_Base_dData_dPair_dPair_second = dtb__67 } -> (match dtb__67 with
  | { Base_dData_dPair.f_Base_dData_dPair_dPair_first = dtb__68; Base_dData_dPair.f_Base_dData_dPair_dPair_second = dtb__69 } -> (Vuna_dCompiler_dBase_dDiag.C_Vuna_dCompiler_dBase_dDiag_dCheck_OkC ({ Base_dData_dPair.f_Base_dData_dPair_dPair_first = { f_Vuna_dCompiler_dFrontend_dLexer_dPTok_ptokTok = (C_Vuna_dCompiler_dFrontend_dLexer_dTok_TTmpl (true, dtb__66, dtb__69)); f_Vuna_dCompiler_dFrontend_dLexer_dPTok_ptokPos = p }; Base_dData_dPair.f_Base_dData_dPair_dPair_second = dtb__68 }))
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
)
  | Vuna_dCompiler_dBase_dDiag.C_Vuna_dCompiler_dBase_dDiag_dCheck_ErrC (dtb__70) -> (Vuna_dCompiler_dBase_dDiag.C_Vuna_dCompiler_dBase_dDiag_dCheck_ErrC (dtb__70))
  | _ -> failwith "DT: impossible branch"
)) (((((v_Vuna_dCompiler_dFrontend_dLexer_dscanTemplateText (fuel - 1)) true) (v_Vuna_dCompiler_dFrontend_dLexer_ddropOpeningNewline (v_Vuna_dCompiler_dFrontend_dLexer_dcharsNext2 cs))) Base_dData_dList.C_Base_dData_dList_dList_Nil) Base_dData_dList.C_Base_dData_dList_dList_Nil)) else (((v_Vuna_dCompiler_dFrontend_dLexer_dlexSingleStringToken (fuel - 1)) cs) p))))
# 552 "Vuna/Compiler/Frontend/Lexer.vuna"
and v_Vuna_dCompiler_dFrontend_dLexer_dlexSingleStringToken = (fun fuel body p -> (if (fuel <= 0) then (Vuna_dCompiler_dBase_dDiag.v_Vuna_dCompiler_dBase_dDiag_dicFuel "lexer") else ((fun nd_uscrut3 -> (match nd_uscrut3 with
  | Vuna_dCompiler_dBase_dDiag.C_Vuna_dCompiler_dBase_dDiag_dCheck_OkC (dtb__71) -> (match dtb__71 with
  | { Base_dData_dPair.f_Base_dData_dPair_dPair_first = dtb__72; Base_dData_dPair.f_Base_dData_dPair_dPair_second = dtb__73 } -> (match dtb__73 with
  | { Base_dData_dPair.f_Base_dData_dPair_dPair_first = dtb__74; Base_dData_dPair.f_Base_dData_dPair_dPair_second = dtb__75 } -> ((fun nd_uscrut14 -> (match nd_uscrut14 with
  | Base_dData_dList.C_Base_dData_dList_dList__x58__x58_ (dtb__76, dtb__77) -> (match dtb__76 with
  | C_Vuna_dCompiler_dFrontend_dLexer_dTmplPart_TPText (dtb__78) -> (match dtb__77 with
  | Base_dData_dList.C_Base_dData_dList_dList_Nil -> (Vuna_dCompiler_dBase_dDiag.C_Vuna_dCompiler_dBase_dDiag_dCheck_OkC ({ Base_dData_dPair.f_Base_dData_dPair_dPair_first = { f_Vuna_dCompiler_dFrontend_dLexer_dPTok_ptokTok = (C_Vuna_dCompiler_dFrontend_dLexer_dTok_TStr (dtb__78)); f_Vuna_dCompiler_dFrontend_dLexer_dPTok_ptokPos = p }; Base_dData_dPair.f_Base_dData_dPair_dPair_second = dtb__74 }))
  | _ -> (Vuna_dCompiler_dBase_dDiag.C_Vuna_dCompiler_dBase_dDiag_dCheck_OkC ({ Base_dData_dPair.f_Base_dData_dPair_dPair_first = { f_Vuna_dCompiler_dFrontend_dLexer_dPTok_ptokTok = (C_Vuna_dCompiler_dFrontend_dLexer_dTok_TTmpl (false, dtb__72, dtb__75)); f_Vuna_dCompiler_dFrontend_dLexer_dPTok_ptokPos = p }; Base_dData_dPair.f_Base_dData_dPair_dPair_second = dtb__74 }))
)
  | _ -> (Vuna_dCompiler_dBase_dDiag.C_Vuna_dCompiler_dBase_dDiag_dCheck_OkC ({ Base_dData_dPair.f_Base_dData_dPair_dPair_first = { f_Vuna_dCompiler_dFrontend_dLexer_dPTok_ptokTok = (C_Vuna_dCompiler_dFrontend_dLexer_dTok_TTmpl (false, dtb__72, dtb__75)); f_Vuna_dCompiler_dFrontend_dLexer_dPTok_ptokPos = p }; Base_dData_dPair.f_Base_dData_dPair_dPair_second = dtb__74 }))
)
  | _ -> (Vuna_dCompiler_dBase_dDiag.C_Vuna_dCompiler_dBase_dDiag_dCheck_OkC ({ Base_dData_dPair.f_Base_dData_dPair_dPair_first = { f_Vuna_dCompiler_dFrontend_dLexer_dPTok_ptokTok = (C_Vuna_dCompiler_dFrontend_dLexer_dTok_TTmpl (false, dtb__72, dtb__75)); f_Vuna_dCompiler_dFrontend_dLexer_dPTok_ptokPos = p }; Base_dData_dPair.f_Base_dData_dPair_dPair_second = dtb__74 }))
)) dtb__72)
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
)
  | Vuna_dCompiler_dBase_dDiag.C_Vuna_dCompiler_dBase_dDiag_dCheck_ErrC (dtb__79) -> (Vuna_dCompiler_dBase_dDiag.C_Vuna_dCompiler_dBase_dDiag_dCheck_ErrC (dtb__79))
  | _ -> failwith "DT: impossible branch"
)) (((((v_Vuna_dCompiler_dFrontend_dLexer_dscanTemplateText (fuel - 1)) false) body) Base_dData_dList.C_Base_dData_dList_dList_Nil) Base_dData_dList.C_Base_dData_dList_dList_Nil))))

# 573 "Vuna/Compiler/Frontend/Lexer.vuna"
let rec v_Vuna_dCompiler_dFrontend_dLexer_dlexCharsWithRev = (fun fuel acc toks cs -> (if (fuel <= 0) then (Vuna_dCompiler_dBase_dDiag.v_Vuna_dCompiler_dBase_dDiag_dicFuel "lexer") else ((fun nd_uscrut4 -> (match nd_uscrut4 with
  | Vuna_dCompiler_dBase_dDiag.C_Vuna_dCompiler_dBase_dDiag_dCheck_OkC (dtb__80) -> (match dtb__80 with
  | { Base_dData_dPair.f_Base_dData_dPair_dPair_first = dtb__81; Base_dData_dPair.f_Base_dData_dPair_dPair_second = dtb__82 } -> (if (v_Vuna_dCompiler_dFrontend_dLexer_dcharsEmpty dtb__81) then (Vuna_dCompiler_dBase_dDiag.C_Vuna_dCompiler_dBase_dDiag_dCheck_OkC ({ Base_dData_dPair.f_Base_dData_dPair_dPair_first = (Base_dData_dList.C_Base_dData_dList_dList__x58__x58_ ({ f_Vuna_dCompiler_dFrontend_dLexer_dPTok_ptokTok = C_Vuna_dCompiler_dFrontend_dLexer_dTok_TEof; f_Vuna_dCompiler_dFrontend_dLexer_dPTok_ptokPos = ((v_Vuna_dCompiler_dFrontend_dLexer_dposWithEnd (v_Vuna_dCompiler_dFrontend_dLexer_dcharsPos dtb__81)) (v_Vuna_dCompiler_dFrontend_dLexer_dcharsOffset dtb__81)) }, toks)); Base_dData_dPair.f_Base_dData_dPair_dPair_second = (Base_dData_dList.v_Base_dData_dList_dreverse ((Base_dData_dList.v_Base_dData_dList_dappend (Base_dData_dList.v_Base_dData_dList_dreverse dtb__82)) acc)) })) else ((fun nd_uscrut11 -> (match nd_uscrut11 with
  | Vuna_dCompiler_dBase_dDiag.C_Vuna_dCompiler_dBase_dDiag_dCheck_OkC (dtb__83) -> (match dtb__83 with
  | { Base_dData_dPair.f_Base_dData_dPair_dPair_first = dtb__84; Base_dData_dPair.f_Base_dData_dPair_dPair_second = dtb__85 } -> ((((v_Vuna_dCompiler_dFrontend_dLexer_dlexCharsWithRev (fuel - 1)) ((Base_dData_dList.v_Base_dData_dList_dappend (Base_dData_dList.v_Base_dData_dList_dreverse dtb__82)) acc)) (Base_dData_dList.C_Base_dData_dList_dList__x58__x58_ (((v_Vuna_dCompiler_dFrontend_dLexer_dsetTokEnd dtb__85) dtb__84), toks))) dtb__85)
  | _ -> failwith "DT: impossible branch"
)
  | Vuna_dCompiler_dBase_dDiag.C_Vuna_dCompiler_dBase_dDiag_dCheck_ErrC (dtb__86) -> (Vuna_dCompiler_dBase_dDiag.C_Vuna_dCompiler_dBase_dDiag_dCheck_ErrC (dtb__86))
  | _ -> failwith "DT: impossible branch"
)) ((v_Vuna_dCompiler_dFrontend_dLexer_dlexOneToken fuel) dtb__81)))
  | _ -> failwith "DT: impossible branch"
)
  | Vuna_dCompiler_dBase_dDiag.C_Vuna_dCompiler_dBase_dDiag_dCheck_ErrC (dtb__87) -> (Vuna_dCompiler_dBase_dDiag.C_Vuna_dCompiler_dBase_dDiag_dCheck_ErrC (dtb__87))
  | _ -> failwith "DT: impossible branch"
)) ((v_Vuna_dCompiler_dFrontend_dLexer_dskipTriviaComments fuel) cs))))

# 568 "Vuna/Compiler/Frontend/Lexer.vuna"
let v_Vuna_dCompiler_dFrontend_dLexer_dlexCharsWith = (fun fuel acc0 cs -> ((fun nd_uscrut3 -> (match nd_uscrut3 with
  | Vuna_dCompiler_dBase_dDiag.C_Vuna_dCompiler_dBase_dDiag_dCheck_OkC (dtb__88) -> (match dtb__88 with
  | { Base_dData_dPair.f_Base_dData_dPair_dPair_first = dtb__89; Base_dData_dPair.f_Base_dData_dPair_dPair_second = dtb__90 } -> (Vuna_dCompiler_dBase_dDiag.C_Vuna_dCompiler_dBase_dDiag_dCheck_OkC ({ Base_dData_dPair.f_Base_dData_dPair_dPair_first = (Base_dData_dList.v_Base_dData_dList_dreverse dtb__89); Base_dData_dPair.f_Base_dData_dPair_dPair_second = dtb__90 }))
  | _ -> failwith "DT: impossible branch"
)
  | Vuna_dCompiler_dBase_dDiag.C_Vuna_dCompiler_dBase_dDiag_dCheck_ErrC (dtb__91) -> (Vuna_dCompiler_dBase_dDiag.C_Vuna_dCompiler_dBase_dDiag_dCheck_ErrC (dtb__91))
  | _ -> failwith "DT: impossible branch"
)) ((((v_Vuna_dCompiler_dFrontend_dLexer_dlexCharsWithRev fuel) acc0) Base_dData_dList.C_Base_dData_dList_dList_Nil) cs)))

# 591 "Vuna/Compiler/Frontend/Lexer.vuna"
let rec v_Vuna_dCompiler_dFrontend_dLexer_dlexCharsRev = (fun fuel acc cs -> (if (fuel <= 0) then (Vuna_dCompiler_dBase_dDiag.v_Vuna_dCompiler_dBase_dDiag_dicFuel "lexer") else (match ((v_Vuna_dCompiler_dFrontend_dLexer_dskipTrivia fuel) cs) with
  | Vuna_dCompiler_dBase_dDiag.C_Vuna_dCompiler_dBase_dDiag_dCheck_ErrC (dtb__92) -> (Vuna_dCompiler_dBase_dDiag.C_Vuna_dCompiler_dBase_dDiag_dCheck_ErrC (dtb__92))
  | Vuna_dCompiler_dBase_dDiag.C_Vuna_dCompiler_dBase_dDiag_dCheck_OkC (dtb__93) -> (if (v_Vuna_dCompiler_dFrontend_dLexer_dcharsEmpty dtb__93) then (Vuna_dCompiler_dBase_dDiag.C_Vuna_dCompiler_dBase_dDiag_dCheck_OkC ((Base_dData_dList.C_Base_dData_dList_dList__x58__x58_ ({ f_Vuna_dCompiler_dFrontend_dLexer_dPTok_ptokTok = C_Vuna_dCompiler_dFrontend_dLexer_dTok_TEof; f_Vuna_dCompiler_dFrontend_dLexer_dPTok_ptokPos = ((v_Vuna_dCompiler_dFrontend_dLexer_dposWithEnd (v_Vuna_dCompiler_dFrontend_dLexer_dcharsPos dtb__93)) (v_Vuna_dCompiler_dFrontend_dLexer_dcharsOffset dtb__93)) }, acc)))) else ((fun nd_uscrut5 -> (match nd_uscrut5 with
  | Vuna_dCompiler_dBase_dDiag.C_Vuna_dCompiler_dBase_dDiag_dCheck_OkC (dtb__94) -> (match dtb__94 with
  | { Base_dData_dPair.f_Base_dData_dPair_dPair_first = dtb__95; Base_dData_dPair.f_Base_dData_dPair_dPair_second = dtb__96 } -> (((v_Vuna_dCompiler_dFrontend_dLexer_dlexCharsRev (fuel - 1)) (Base_dData_dList.C_Base_dData_dList_dList__x58__x58_ (((v_Vuna_dCompiler_dFrontend_dLexer_dsetTokEnd dtb__96) dtb__95), acc))) dtb__96)
  | _ -> failwith "DT: impossible branch"
)
  | Vuna_dCompiler_dBase_dDiag.C_Vuna_dCompiler_dBase_dDiag_dCheck_ErrC (dtb__97) -> (Vuna_dCompiler_dBase_dDiag.C_Vuna_dCompiler_dBase_dDiag_dCheck_ErrC (dtb__97))
  | _ -> failwith "DT: impossible branch"
)) ((v_Vuna_dCompiler_dFrontend_dLexer_dlexOneToken fuel) dtb__93)))
  | _ -> failwith "DT: impossible branch"
)))

# 586 "Vuna/Compiler/Frontend/Lexer.vuna"
let v_Vuna_dCompiler_dFrontend_dLexer_dlexChars = (fun fuel cs -> (match (((v_Vuna_dCompiler_dFrontend_dLexer_dlexCharsRev fuel) Base_dData_dList.C_Base_dData_dList_dList_Nil) cs) with
  | Vuna_dCompiler_dBase_dDiag.C_Vuna_dCompiler_dBase_dDiag_dCheck_ErrC (dtb__98) -> (Vuna_dCompiler_dBase_dDiag.C_Vuna_dCompiler_dBase_dDiag_dCheck_ErrC (dtb__98))
  | Vuna_dCompiler_dBase_dDiag.C_Vuna_dCompiler_dBase_dDiag_dCheck_OkC (dtb__99) -> (Vuna_dCompiler_dBase_dDiag.C_Vuna_dCompiler_dBase_dDiag_dCheck_OkC ((Base_dData_dList.v_Base_dData_dList_dreverse dtb__99)))
  | _ -> failwith "DT: impossible branch"
))

# 619 "Vuna/Compiler/Frontend/Lexer.vuna"
let v_Vuna_dCompiler_dFrontend_dLexer_dsourceFuel = (fun source -> ((4 * (bi_strLength source)) + 64))

# 602 "Vuna/Compiler/Frontend/Lexer.vuna"
let v_Vuna_dCompiler_dFrontend_dLexer_dlexSourceWithComments = (fun source -> (((v_Vuna_dCompiler_dFrontend_dLexer_dlexCharsWith (v_Vuna_dCompiler_dFrontend_dLexer_dsourceFuel source)) Base_dData_dList.C_Base_dData_dList_dList_Nil) { f_Vuna_dCompiler_dFrontend_dLexer_dChars_charsSource = source; f_Vuna_dCompiler_dFrontend_dLexer_dChars_charsOffset = 0; f_Vuna_dCompiler_dFrontend_dLexer_dChars_charsPos = { Vuna_dCompiler_dBase_dSource.f_Vuna_dCompiler_dBase_dSource_dPos_posLine = 1; Vuna_dCompiler_dBase_dSource.f_Vuna_dCompiler_dBase_dSource_dPos_posCol = 1; Vuna_dCompiler_dBase_dSource.f_Vuna_dCompiler_dBase_dSource_dPos_posOffset = 0; Vuna_dCompiler_dBase_dSource.f_Vuna_dCompiler_dBase_dSource_dPos_posEndOffset = 0 } }))

# 605 "Vuna/Compiler/Frontend/Lexer.vuna"
let v_Vuna_dCompiler_dFrontend_dLexer_dlexSource = (fun source -> ((v_Vuna_dCompiler_dFrontend_dLexer_dlexChars (v_Vuna_dCompiler_dFrontend_dLexer_dsourceFuel source)) { f_Vuna_dCompiler_dFrontend_dLexer_dChars_charsSource = source; f_Vuna_dCompiler_dFrontend_dLexer_dChars_charsOffset = 0; f_Vuna_dCompiler_dFrontend_dLexer_dChars_charsPos = { Vuna_dCompiler_dBase_dSource.f_Vuna_dCompiler_dBase_dSource_dPos_posLine = 1; Vuna_dCompiler_dBase_dSource.f_Vuna_dCompiler_dBase_dSource_dPos_posCol = 1; Vuna_dCompiler_dBase_dSource.f_Vuna_dCompiler_dBase_dSource_dPos_posOffset = 0; Vuna_dCompiler_dBase_dSource.f_Vuna_dCompiler_dBase_dSource_dPos_posEndOffset = 0 } }))

# 608 "Vuna/Compiler/Frontend/Lexer.vuna"
let v_Vuna_dCompiler_dFrontend_dLexer_dlexComments = (fun source -> ((fun nd_uscrut1 -> (match nd_uscrut1 with
  | Vuna_dCompiler_dBase_dDiag.C_Vuna_dCompiler_dBase_dDiag_dCheck_OkC (dtb__100) -> (match dtb__100 with
  | { Base_dData_dPair.f_Base_dData_dPair_dPair_first = dtb__101; Base_dData_dPair.f_Base_dData_dPair_dPair_second = dtb__102 } -> (Vuna_dCompiler_dBase_dDiag.C_Vuna_dCompiler_dBase_dDiag_dCheck_OkC (dtb__102))
  | _ -> failwith "DT: impossible branch"
)
  | Vuna_dCompiler_dBase_dDiag.C_Vuna_dCompiler_dBase_dDiag_dCheck_ErrC (dtb__103) -> (Vuna_dCompiler_dBase_dDiag.C_Vuna_dCompiler_dBase_dDiag_dCheck_ErrC (dtb__103))
  | _ -> failwith "DT: impossible branch"
)) (v_Vuna_dCompiler_dFrontend_dLexer_dlexSourceWithComments source)))
