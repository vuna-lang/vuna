open Vuna_runtime
type t_Vuna_dCompiler_dFrontend_dLexer_dTmplPart = C_Vuna_dCompiler_dFrontend_dLexer_dTmplPart_TPText of (string) | C_Vuna_dCompiler_dFrontend_dLexer_dTmplPart_TPHole of (t_Vuna_dCompiler_dFrontend_dLexer_dPTok Base_dList.t_Base_dList_dList)
and t_Vuna_dCompiler_dFrontend_dLexer_dTok = C_Vuna_dCompiler_dFrontend_dLexer_dTok_TIdent of (string) | C_Vuna_dCompiler_dFrontend_dLexer_dTok_TKw of (string) | C_Vuna_dCompiler_dFrontend_dLexer_dTok_TInt of (int) | C_Vuna_dCompiler_dFrontend_dLexer_dTok_TStr of (string) | C_Vuna_dCompiler_dFrontend_dLexer_dTok_TTmpl of (bool) * (t_Vuna_dCompiler_dFrontend_dLexer_dTmplPart Base_dList.t_Base_dList_dList) * (Vuna_dCompiler_dBase_dSource.t_Vuna_dCompiler_dBase_dSource_dPos) | C_Vuna_dCompiler_dFrontend_dLexer_dTok_TSym of (string) | C_Vuna_dCompiler_dFrontend_dLexer_dTok_TEof | C_Vuna_dCompiler_dFrontend_dLexer_dTok_TFloat of (string)
and t_Vuna_dCompiler_dFrontend_dLexer_dPTok = { f_Vuna_dCompiler_dFrontend_dLexer_dPTok_ptokTok : t_Vuna_dCompiler_dFrontend_dLexer_dTok; f_Vuna_dCompiler_dFrontend_dLexer_dPTok_ptokPos : Vuna_dCompiler_dBase_dSource.t_Vuna_dCompiler_dBase_dSource_dPos }
and t_Vuna_dCompiler_dFrontend_dLexer_dChars = { f_Vuna_dCompiler_dFrontend_dLexer_dChars_charsRemaining : int Base_dList.t_Base_dList_dList; f_Vuna_dCompiler_dFrontend_dLexer_dChars_charsPos : Vuna_dCompiler_dBase_dSource.t_Vuna_dCompiler_dBase_dSource_dPos }
and t_Vuna_dCompiler_dFrontend_dLexer_dCKind = C_Vuna_dCompiler_dFrontend_dLexer_dCKind_CLine | C_Vuna_dCompiler_dFrontend_dLexer_dCKind_CBlock
and t_Vuna_dCompiler_dFrontend_dLexer_dComment = { f_Vuna_dCompiler_dFrontend_dLexer_dComment_commentKind : t_Vuna_dCompiler_dFrontend_dLexer_dCKind; f_Vuna_dCompiler_dFrontend_dLexer_dComment_commentText : string; f_Vuna_dCompiler_dFrontend_dLexer_dComment_commentSpan : Vuna_dCompiler_dBase_dSource.t_Vuna_dCompiler_dBase_dSource_dSpan }

# 52 "Vuna/Compiler/Frontend/Lexer.vuna"
let v_Vuna_dCompiler_dFrontend_dLexer_dlexSpanAt = (fun mc0 -> (match mc0 with
  | { Vuna_dCompiler_dBase_dSource.f_Vuna_dCompiler_dBase_dSource_dPos_posLine = dtb__0; Vuna_dCompiler_dBase_dSource.f_Vuna_dCompiler_dBase_dSource_dPos_posCol = dtb__1 } -> { Vuna_dCompiler_dBase_dSource.f_Vuna_dCompiler_dBase_dSource_dSpan_spanFile = ""; Vuna_dCompiler_dBase_dSource.f_Vuna_dCompiler_dBase_dSource_dSpan_spanStartLine = dtb__0; Vuna_dCompiler_dBase_dSource.f_Vuna_dCompiler_dBase_dSource_dSpan_spanStartCol = dtb__1; Vuna_dCompiler_dBase_dSource.f_Vuna_dCompiler_dBase_dSource_dSpan_spanEndLine = dtb__0; Vuna_dCompiler_dBase_dSource.f_Vuna_dCompiler_dBase_dSource_dSpan_spanEndCol = dtb__1 }
  | _ -> failwith "DT: impossible branch"
))

# 55 "Vuna/Compiler/Frontend/Lexer.vuna"
let v_Vuna_dCompiler_dFrontend_dLexer_dadvanceChar = (fun mc0 mc1 -> (match mc1 with
  | { Vuna_dCompiler_dBase_dSource.f_Vuna_dCompiler_dBase_dSource_dPos_posLine = dtb__2; Vuna_dCompiler_dBase_dSource.f_Vuna_dCompiler_dBase_dSource_dPos_posCol = dtb__3 } -> (if (mc0 = 10) then { Vuna_dCompiler_dBase_dSource.f_Vuna_dCompiler_dBase_dSource_dPos_posLine = (dtb__2 + 1); Vuna_dCompiler_dBase_dSource.f_Vuna_dCompiler_dBase_dSource_dPos_posCol = 1 } else { Vuna_dCompiler_dBase_dSource.f_Vuna_dCompiler_dBase_dSource_dPos_posLine = dtb__2; Vuna_dCompiler_dBase_dSource.f_Vuna_dCompiler_dBase_dSource_dPos_posCol = (dtb__3 + 1) })
  | _ -> failwith "DT: impossible branch"
))

# 58 "Vuna/Compiler/Frontend/Lexer.vuna"
let v_Vuna_dCompiler_dFrontend_dLexer_disUpperChar = (fun c -> (if (c >= 65) then (c <= 90) else false))

# 61 "Vuna/Compiler/Frontend/Lexer.vuna"
let v_Vuna_dCompiler_dFrontend_dLexer_disLowerChar = (fun c -> (if (c >= 97) then (c <= 122) else false))

# 64 "Vuna/Compiler/Frontend/Lexer.vuna"
let v_Vuna_dCompiler_dFrontend_dLexer_disIdentStart = (fun c -> (if (if (v_Vuna_dCompiler_dFrontend_dLexer_disUpperChar c) then true else (v_Vuna_dCompiler_dFrontend_dLexer_disLowerChar c)) then true else (c = 95)))

# 70 "Vuna/Compiler/Frontend/Lexer.vuna"
let v_Vuna_dCompiler_dFrontend_dLexer_disDigit = (fun c -> (if (c >= 48) then (c <= 57) else false))

# 67 "Vuna/Compiler/Frontend/Lexer.vuna"
let v_Vuna_dCompiler_dFrontend_dLexer_disIdentChar = (fun c -> (if (if (v_Vuna_dCompiler_dFrontend_dLexer_disIdentStart c) then true else (v_Vuna_dCompiler_dFrontend_dLexer_disDigit c)) then true else (c = 39)))

# 73 "Vuna/Compiler/Frontend/Lexer.vuna"
let v_Vuna_dCompiler_dFrontend_dLexer_disSpace = (fun c -> (if (if (if (c = 32) then true else (c = 9)) then true else (c = 10)) then true else (c = 13)))

# 76 "Vuna/Compiler/Frontend/Lexer.vuna"
let v_Vuna_dCompiler_dFrontend_dLexer_disOpChar = (fun c -> (if (if (if (if (if (if (if (if (if (if (if (if (if (if (if (if (if (if (c = 33) then true else (c = 36)) then true else (c = 37)) then true else (c = 38)) then true else (c = 42)) then true else (c = 43)) then true else (c = 45)) then true else (c = 46)) then true else (c = 47)) then true else (c = 60)) then true else (c = 61)) then true else (c = 62)) then true else (c = 63)) then true else (c = 64)) then true else (c = 92)) then true else (c = 94)) then true else (c = 124)) then true else (c = 126)) then true else (c = 58)))

# 103 "Vuna/Compiler/Frontend/Lexer.vuna"
let v_Vuna_dCompiler_dFrontend_dLexer_disKeyword = (fun s -> (if (if (if (if (if (if (if (if (if (if (if (if (if (if (if (if (if (if (if (if (if (if (if (if (if (if (if (if (s = "data") then true else (s = "axiom")) then true else (s = "extern")) then true else (s = "case")) then true else (s = "of")) then true else (s = "let")) then true else (s = "in")) then true else (s = "if")) then true else (s = "then")) then true else (s = "else")) then true else (s = "where")) then true else (s = "linear")) then true else (s = "transparent")) then true else (s = "opaque")) then true else (s = "Type")) then true else (s = "import")) then true else (s = "module")) then true else (s = "qualified")) then true else (s = "as")) then true else (s = "record")) then true else (s = "trait")) then true else (s = "instance")) then true else (s = "deriving")) then true else (s = "do")) then true else (s = "perform")) then true else (s = "handle")) then true else (s = "infixl")) then true else (s = "infixr")) then true else (s = "infix")))

# 135 "Vuna/Compiler/Frontend/Lexer.vuna"
let v_Vuna_dCompiler_dFrontend_dLexer_dclassifyIdent = (fun s -> (if (v_Vuna_dCompiler_dFrontend_dLexer_disKeyword s) then (C_Vuna_dCompiler_dFrontend_dLexer_dTok_TKw (s)) else (C_Vuna_dCompiler_dFrontend_dLexer_dTok_TIdent (s))))

# 150 "Vuna/Compiler/Frontend/Lexer.vuna"
let v_Vuna_dCompiler_dFrontend_dLexer_dcommentSpan = (fun mc0 -> (match mc0 with
  | { f_Vuna_dCompiler_dFrontend_dLexer_dComment_commentKind = dtb__4; f_Vuna_dCompiler_dFrontend_dLexer_dComment_commentText = dtb__5; f_Vuna_dCompiler_dFrontend_dLexer_dComment_commentSpan = dtb__6 } -> dtb__6
  | _ -> failwith "DT: impossible branch"
))

# 156 "Vuna/Compiler/Frontend/Lexer.vuna"
let rec v_Vuna_dCompiler_dFrontend_dLexer_ddropTrailingSpace = (fun mc0 -> (match mc0 with
  | Base_dList.C_Base_dList_dList_Cons (dtb__7, dtb__8) -> (if (if (if (dtb__7 = 32) then true else (dtb__7 = 9)) then true else (dtb__7 = 13)) then (v_Vuna_dCompiler_dFrontend_dLexer_ddropTrailingSpace dtb__8) else (Base_dList.C_Base_dList_dList_Cons (dtb__7, dtb__8)))
  | Base_dList.C_Base_dList_dList_Nil -> Base_dList.C_Base_dList_dList_Nil
  | _ -> failwith "DT: impossible branch"
))

# 153 "Vuna/Compiler/Frontend/Lexer.vuna"
let v_Vuna_dCompiler_dFrontend_dLexer_dtrimTrailingSpace = (fun s -> (Base_dList.dtp_pack (Base_dList.v_Base_dList_dreverse (v_Vuna_dCompiler_dFrontend_dLexer_ddropTrailingSpace (Base_dList.v_Base_dList_dreverse (Base_dList.dtp_unpack s))))))

# 162 "Vuna/Compiler/Frontend/Lexer.vuna"
let rec v_Vuna_dCompiler_dFrontend_dLexer_dcollectLineBody = (fun mc0 mc1 mc2 -> (match mc0 with
  | { f_Vuna_dCompiler_dFrontend_dLexer_dChars_charsRemaining = dtb__9; f_Vuna_dCompiler_dFrontend_dLexer_dChars_charsPos = dtb__10 } -> (match dtb__9 with
  | Base_dList.C_Base_dList_dList_Cons (dtb__11, dtb__12) -> (if (dtb__11 = 10) then { Base_dPair.f_Base_dPair_dPair_first = (Base_dList.dtp_pack (Base_dList.v_Base_dList_dreverse mc1)); Base_dPair.f_Base_dPair_dPair_second = { Base_dPair.f_Base_dPair_dPair_first = { f_Vuna_dCompiler_dFrontend_dLexer_dChars_charsRemaining = (Base_dList.C_Base_dList_dList_Cons (dtb__11, dtb__12)); f_Vuna_dCompiler_dFrontend_dLexer_dChars_charsPos = dtb__10 }; Base_dPair.f_Base_dPair_dPair_second = mc2 } } else (((v_Vuna_dCompiler_dFrontend_dLexer_dcollectLineBody { f_Vuna_dCompiler_dFrontend_dLexer_dChars_charsRemaining = dtb__12; f_Vuna_dCompiler_dFrontend_dLexer_dChars_charsPos = ((v_Vuna_dCompiler_dFrontend_dLexer_dadvanceChar dtb__11) dtb__10) }) (Base_dList.C_Base_dList_dList_Cons (dtb__11, mc1))) dtb__10))
  | Base_dList.C_Base_dList_dList_Nil -> { Base_dPair.f_Base_dPair_dPair_first = (Base_dList.dtp_pack (Base_dList.v_Base_dList_dreverse mc1)); Base_dPair.f_Base_dPair_dPair_second = { Base_dPair.f_Base_dPair_dPair_first = { f_Vuna_dCompiler_dFrontend_dLexer_dChars_charsRemaining = Base_dList.C_Base_dList_dList_Nil; f_Vuna_dCompiler_dFrontend_dLexer_dChars_charsPos = dtb__10 }; Base_dPair.f_Base_dPair_dPair_second = mc2 } }
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
))

# 169 "Vuna/Compiler/Frontend/Lexer.vuna"
let rec v_Vuna_dCompiler_dFrontend_dLexer_dcollectBlockBody = (fun mc0 mc1 mc2 mc3 -> (match mc0 with
  | { f_Vuna_dCompiler_dFrontend_dLexer_dChars_charsRemaining = dtb__13; f_Vuna_dCompiler_dFrontend_dLexer_dChars_charsPos = dtb__14 } -> (match dtb__13 with
  | Base_dList.C_Base_dList_dList_Cons (dtb__15, dtb__16) -> (match dtb__16 with
  | Base_dList.C_Base_dList_dList_Cons (dtb__17, dtb__18) -> (if (if (dtb__15 = 123) then (dtb__17 = 45) else false) then ((((v_Vuna_dCompiler_dFrontend_dLexer_dcollectBlockBody { f_Vuna_dCompiler_dFrontend_dLexer_dChars_charsRemaining = dtb__18; f_Vuna_dCompiler_dFrontend_dLexer_dChars_charsPos = ((v_Vuna_dCompiler_dFrontend_dLexer_dadvanceChar dtb__17) ((v_Vuna_dCompiler_dFrontend_dLexer_dadvanceChar dtb__15) dtb__14)) }) (mc1 + 1)) (Base_dList.C_Base_dList_dList_Cons (dtb__17, (Base_dList.C_Base_dList_dList_Cons (dtb__15, mc2))))) ((v_Vuna_dCompiler_dFrontend_dLexer_dadvanceChar dtb__17) dtb__14)) else (if (if (dtb__15 = 45) then (dtb__17 = 125) else false) then (if (mc1 = 1) then (Vuna_dCompiler_dBase_dDiag.C_Vuna_dCompiler_dBase_dDiag_dCheck_OkC ({ Base_dPair.f_Base_dPair_dPair_first = (Base_dList.dtp_pack (Base_dList.v_Base_dList_dreverse mc2)); Base_dPair.f_Base_dPair_dPair_second = { Base_dPair.f_Base_dPair_dPair_first = { f_Vuna_dCompiler_dFrontend_dLexer_dChars_charsRemaining = dtb__18; f_Vuna_dCompiler_dFrontend_dLexer_dChars_charsPos = ((v_Vuna_dCompiler_dFrontend_dLexer_dadvanceChar dtb__17) ((v_Vuna_dCompiler_dFrontend_dLexer_dadvanceChar dtb__15) dtb__14)) }; Base_dPair.f_Base_dPair_dPair_second = ((v_Vuna_dCompiler_dFrontend_dLexer_dadvanceChar dtb__17) dtb__14) } })) else ((((v_Vuna_dCompiler_dFrontend_dLexer_dcollectBlockBody { f_Vuna_dCompiler_dFrontend_dLexer_dChars_charsRemaining = dtb__18; f_Vuna_dCompiler_dFrontend_dLexer_dChars_charsPos = ((v_Vuna_dCompiler_dFrontend_dLexer_dadvanceChar dtb__17) ((v_Vuna_dCompiler_dFrontend_dLexer_dadvanceChar dtb__15) dtb__14)) }) (mc1 - 1)) (Base_dList.C_Base_dList_dList_Cons (dtb__17, (Base_dList.C_Base_dList_dList_Cons (dtb__15, mc2))))) ((v_Vuna_dCompiler_dFrontend_dLexer_dadvanceChar dtb__17) dtb__14))) else ((((v_Vuna_dCompiler_dFrontend_dLexer_dcollectBlockBody { f_Vuna_dCompiler_dFrontend_dLexer_dChars_charsRemaining = dtb__16; f_Vuna_dCompiler_dFrontend_dLexer_dChars_charsPos = ((v_Vuna_dCompiler_dFrontend_dLexer_dadvanceChar dtb__15) dtb__14) }) mc1) (Base_dList.C_Base_dList_dList_Cons (dtb__15, mc2))) dtb__14)))
  | Base_dList.C_Base_dList_dList_Nil -> ((((v_Vuna_dCompiler_dFrontend_dLexer_dcollectBlockBody { f_Vuna_dCompiler_dFrontend_dLexer_dChars_charsRemaining = dtb__16; f_Vuna_dCompiler_dFrontend_dLexer_dChars_charsPos = ((v_Vuna_dCompiler_dFrontend_dLexer_dadvanceChar dtb__15) dtb__14) }) mc1) (Base_dList.C_Base_dList_dList_Cons (dtb__15, mc2))) dtb__14)
  | _ -> failwith "DT: impossible branch"
)
  | Base_dList.C_Base_dList_dList_Nil -> ((Vuna_dCompiler_dBase_dDiagnostics_dFrontend.v_Vuna_dCompiler_dBase_dDiagnostics_dFrontend_dlexErr0At (v_Vuna_dCompiler_dFrontend_dLexer_dlexSpanAt dtb__14)) Vuna_dCompiler_dBase_dDiagnostics_dFrontend.C_Vuna_dCompiler_dBase_dDiagnostics_dFrontend_dLexDiag_UnterminatedBlockComment)
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
))

# 183 "Vuna/Compiler/Frontend/Lexer.vuna"
let rec v_Vuna_dCompiler_dFrontend_dLexer_dskipLineComment = (fun mc0 -> (match mc0 with
  | { f_Vuna_dCompiler_dFrontend_dLexer_dChars_charsRemaining = dtb__19; f_Vuna_dCompiler_dFrontend_dLexer_dChars_charsPos = dtb__20 } -> (match dtb__19 with
  | Base_dList.C_Base_dList_dList_Cons (dtb__21, dtb__22) -> (if (dtb__21 = 10) then { f_Vuna_dCompiler_dFrontend_dLexer_dChars_charsRemaining = (Base_dList.C_Base_dList_dList_Cons (dtb__21, dtb__22)); f_Vuna_dCompiler_dFrontend_dLexer_dChars_charsPos = dtb__20 } else (v_Vuna_dCompiler_dFrontend_dLexer_dskipLineComment { f_Vuna_dCompiler_dFrontend_dLexer_dChars_charsRemaining = dtb__22; f_Vuna_dCompiler_dFrontend_dLexer_dChars_charsPos = ((v_Vuna_dCompiler_dFrontend_dLexer_dadvanceChar dtb__21) dtb__20) }))
  | Base_dList.C_Base_dList_dList_Nil -> { f_Vuna_dCompiler_dFrontend_dLexer_dChars_charsRemaining = Base_dList.C_Base_dList_dList_Nil; f_Vuna_dCompiler_dFrontend_dLexer_dChars_charsPos = dtb__20 }
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
))

# 189 "Vuna/Compiler/Frontend/Lexer.vuna"
let rec v_Vuna_dCompiler_dFrontend_dLexer_dskipBlockComment = (fun mc0 mc1 -> (match mc1 with
  | { f_Vuna_dCompiler_dFrontend_dLexer_dChars_charsRemaining = dtb__23; f_Vuna_dCompiler_dFrontend_dLexer_dChars_charsPos = dtb__24 } -> (match dtb__23 with
  | Base_dList.C_Base_dList_dList_Cons (dtb__25, dtb__26) -> (match dtb__26 with
  | Base_dList.C_Base_dList_dList_Cons (dtb__27, dtb__28) -> (if (if (dtb__25 = 123) then (dtb__27 = 45) else false) then ((v_Vuna_dCompiler_dFrontend_dLexer_dskipBlockComment (mc0 + 1)) { f_Vuna_dCompiler_dFrontend_dLexer_dChars_charsRemaining = dtb__28; f_Vuna_dCompiler_dFrontend_dLexer_dChars_charsPos = ((v_Vuna_dCompiler_dFrontend_dLexer_dadvanceChar dtb__27) ((v_Vuna_dCompiler_dFrontend_dLexer_dadvanceChar dtb__25) dtb__24)) }) else (if (if (dtb__25 = 45) then (dtb__27 = 125) else false) then (if (mc0 = 1) then (Vuna_dCompiler_dBase_dDiag.C_Vuna_dCompiler_dBase_dDiag_dCheck_OkC ({ f_Vuna_dCompiler_dFrontend_dLexer_dChars_charsRemaining = dtb__28; f_Vuna_dCompiler_dFrontend_dLexer_dChars_charsPos = ((v_Vuna_dCompiler_dFrontend_dLexer_dadvanceChar dtb__27) ((v_Vuna_dCompiler_dFrontend_dLexer_dadvanceChar dtb__25) dtb__24)) })) else ((v_Vuna_dCompiler_dFrontend_dLexer_dskipBlockComment (mc0 - 1)) { f_Vuna_dCompiler_dFrontend_dLexer_dChars_charsRemaining = dtb__28; f_Vuna_dCompiler_dFrontend_dLexer_dChars_charsPos = ((v_Vuna_dCompiler_dFrontend_dLexer_dadvanceChar dtb__27) ((v_Vuna_dCompiler_dFrontend_dLexer_dadvanceChar dtb__25) dtb__24)) })) else ((v_Vuna_dCompiler_dFrontend_dLexer_dskipBlockComment mc0) { f_Vuna_dCompiler_dFrontend_dLexer_dChars_charsRemaining = dtb__26; f_Vuna_dCompiler_dFrontend_dLexer_dChars_charsPos = ((v_Vuna_dCompiler_dFrontend_dLexer_dadvanceChar dtb__25) dtb__24) })))
  | Base_dList.C_Base_dList_dList_Nil -> ((v_Vuna_dCompiler_dFrontend_dLexer_dskipBlockComment mc0) { f_Vuna_dCompiler_dFrontend_dLexer_dChars_charsRemaining = dtb__26; f_Vuna_dCompiler_dFrontend_dLexer_dChars_charsPos = ((v_Vuna_dCompiler_dFrontend_dLexer_dadvanceChar dtb__25) dtb__24) })
  | _ -> failwith "DT: impossible branch"
)
  | Base_dList.C_Base_dList_dList_Nil -> ((Vuna_dCompiler_dBase_dDiagnostics_dFrontend.v_Vuna_dCompiler_dBase_dDiagnostics_dFrontend_dlexErr0At (v_Vuna_dCompiler_dFrontend_dLexer_dlexSpanAt dtb__24)) Vuna_dCompiler_dBase_dDiagnostics_dFrontend.C_Vuna_dCompiler_dBase_dDiagnostics_dFrontend_dLexDiag_UnterminatedBlockComment)
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
))

# 199 "Vuna/Compiler/Frontend/Lexer.vuna"
let v_Vuna_dCompiler_dFrontend_dLexer_dcommentSpanOf = (fun startP endP -> { Vuna_dCompiler_dBase_dSource.f_Vuna_dCompiler_dBase_dSource_dSpan_spanFile = ""; Vuna_dCompiler_dBase_dSource.f_Vuna_dCompiler_dBase_dSource_dSpan_spanStartLine = (Vuna_dCompiler_dBase_dSource.v_Vuna_dCompiler_dBase_dSource_dposLine startP); Vuna_dCompiler_dBase_dSource.f_Vuna_dCompiler_dBase_dSource_dSpan_spanStartCol = (Vuna_dCompiler_dBase_dSource.v_Vuna_dCompiler_dBase_dSource_dposCol startP); Vuna_dCompiler_dBase_dSource.f_Vuna_dCompiler_dBase_dSource_dSpan_spanEndLine = (Vuna_dCompiler_dBase_dSource.v_Vuna_dCompiler_dBase_dSource_dposLine endP); Vuna_dCompiler_dBase_dSource.f_Vuna_dCompiler_dBase_dSource_dSpan_spanEndCol = (Vuna_dCompiler_dBase_dSource.v_Vuna_dCompiler_dBase_dSource_dposCol endP) })

# 217 "Vuna/Compiler/Frontend/Lexer.vuna"
let rec v_Vuna_dCompiler_dFrontend_dLexer_dskipTrivia = (fun fuel cs -> (if (fuel <= 0) then (Vuna_dCompiler_dBase_dDiag.v_Vuna_dCompiler_dBase_dDiag_dicFuel "lexer") else ((fun nd_uscrut2 -> (match nd_uscrut2 with
  | { f_Vuna_dCompiler_dFrontend_dLexer_dChars_charsRemaining = dtb__29; f_Vuna_dCompiler_dFrontend_dLexer_dChars_charsPos = dtb__30 } -> (match dtb__29 with
  | Base_dList.C_Base_dList_dList_Cons (dtb__31, dtb__32) -> (if (v_Vuna_dCompiler_dFrontend_dLexer_disSpace dtb__31) then ((v_Vuna_dCompiler_dFrontend_dLexer_dskipTrivia (fuel - 1)) { f_Vuna_dCompiler_dFrontend_dLexer_dChars_charsRemaining = dtb__32; f_Vuna_dCompiler_dFrontend_dLexer_dChars_charsPos = ((v_Vuna_dCompiler_dFrontend_dLexer_dadvanceChar dtb__31) dtb__30) }) else (match dtb__32 with
  | Base_dList.C_Base_dList_dList_Cons (dtb__33, dtb__34) -> (if (if (dtb__31 = 45) then (dtb__33 = 45) else false) then ((v_Vuna_dCompiler_dFrontend_dLexer_dskipTrivia (fuel - 1)) (v_Vuna_dCompiler_dFrontend_dLexer_dskipLineComment { f_Vuna_dCompiler_dFrontend_dLexer_dChars_charsRemaining = dtb__32; f_Vuna_dCompiler_dFrontend_dLexer_dChars_charsPos = ((v_Vuna_dCompiler_dFrontend_dLexer_dadvanceChar dtb__31) dtb__30) })) else (if (if (dtb__31 = 123) then (dtb__33 = 45) else false) then (match ((v_Vuna_dCompiler_dFrontend_dLexer_dskipBlockComment 1) { f_Vuna_dCompiler_dFrontend_dLexer_dChars_charsRemaining = dtb__32; f_Vuna_dCompiler_dFrontend_dLexer_dChars_charsPos = ((v_Vuna_dCompiler_dFrontend_dLexer_dadvanceChar dtb__31) dtb__30) }) with
  | Vuna_dCompiler_dBase_dDiag.C_Vuna_dCompiler_dBase_dDiag_dCheck_ErrC (dtb__35) -> (Vuna_dCompiler_dBase_dDiag.C_Vuna_dCompiler_dBase_dDiag_dCheck_ErrC (dtb__35))
  | Vuna_dCompiler_dBase_dDiag.C_Vuna_dCompiler_dBase_dDiag_dCheck_OkC (dtb__36) -> ((v_Vuna_dCompiler_dFrontend_dLexer_dskipTrivia (fuel - 1)) dtb__36)
  | _ -> failwith "DT: impossible branch"
) else (Vuna_dCompiler_dBase_dDiag.C_Vuna_dCompiler_dBase_dDiag_dCheck_OkC (cs))))
  | Base_dList.C_Base_dList_dList_Nil -> (Vuna_dCompiler_dBase_dDiag.C_Vuna_dCompiler_dBase_dDiag_dCheck_OkC (cs))
  | _ -> failwith "DT: impossible branch"
))
  | Base_dList.C_Base_dList_dList_Nil -> (Vuna_dCompiler_dBase_dDiag.C_Vuna_dCompiler_dBase_dDiag_dCheck_OkC (cs))
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
)) cs)))

# 234 "Vuna/Compiler/Frontend/Lexer.vuna"
let rec v_Vuna_dCompiler_dFrontend_dLexer_dskipTriviaCommentsGo = (fun fuel acc cs -> (if (fuel <= 0) then (Vuna_dCompiler_dBase_dDiag.v_Vuna_dCompiler_dBase_dDiag_dicFuel "lexer") else ((fun nd_uscrut3 -> (match nd_uscrut3 with
  | { f_Vuna_dCompiler_dFrontend_dLexer_dChars_charsRemaining = dtb__37; f_Vuna_dCompiler_dFrontend_dLexer_dChars_charsPos = dtb__38 } -> (match dtb__37 with
  | Base_dList.C_Base_dList_dList_Cons (dtb__39, dtb__40) -> (if (v_Vuna_dCompiler_dFrontend_dLexer_disSpace dtb__39) then (((v_Vuna_dCompiler_dFrontend_dLexer_dskipTriviaCommentsGo (fuel - 1)) acc) { f_Vuna_dCompiler_dFrontend_dLexer_dChars_charsRemaining = dtb__40; f_Vuna_dCompiler_dFrontend_dLexer_dChars_charsPos = ((v_Vuna_dCompiler_dFrontend_dLexer_dadvanceChar dtb__39) dtb__38) }) else (match dtb__40 with
  | Base_dList.C_Base_dList_dList_Cons (dtb__41, dtb__42) -> (if (if (dtb__39 = 45) then (dtb__41 = 45) else false) then ((fun nd_uscrut12 -> (match nd_uscrut12 with
  | { Base_dPair.f_Base_dPair_dPair_first = dtb__43; Base_dPair.f_Base_dPair_dPair_second = dtb__44 } -> (match dtb__44 with
  | { Base_dPair.f_Base_dPair_dPair_first = dtb__45; Base_dPair.f_Base_dPair_dPair_second = dtb__46 } -> (((v_Vuna_dCompiler_dFrontend_dLexer_dskipTriviaCommentsGo (fuel - 1)) (Base_dList.C_Base_dList_dList_Cons ({ f_Vuna_dCompiler_dFrontend_dLexer_dComment_commentKind = C_Vuna_dCompiler_dFrontend_dLexer_dCKind_CLine; f_Vuna_dCompiler_dFrontend_dLexer_dComment_commentText = (v_Vuna_dCompiler_dFrontend_dLexer_dtrimTrailingSpace dtb__43); f_Vuna_dCompiler_dFrontend_dLexer_dComment_commentSpan = ((v_Vuna_dCompiler_dFrontend_dLexer_dcommentSpanOf dtb__38) dtb__46) }, acc))) dtb__45)
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
)) (((v_Vuna_dCompiler_dFrontend_dLexer_dcollectLineBody { f_Vuna_dCompiler_dFrontend_dLexer_dChars_charsRemaining = dtb__42; f_Vuna_dCompiler_dFrontend_dLexer_dChars_charsPos = ((v_Vuna_dCompiler_dFrontend_dLexer_dadvanceChar dtb__41) ((v_Vuna_dCompiler_dFrontend_dLexer_dadvanceChar dtb__39) dtb__38)) }) Base_dList.C_Base_dList_dList_Nil) ((v_Vuna_dCompiler_dFrontend_dLexer_dadvanceChar dtb__41) dtb__38))) else (if (if (dtb__39 = 123) then (dtb__41 = 45) else false) then ((fun nd_uscrut12 -> (match nd_uscrut12 with
  | Vuna_dCompiler_dBase_dDiag.C_Vuna_dCompiler_dBase_dDiag_dCheck_OkC (dtb__47) -> (match dtb__47 with
  | { Base_dPair.f_Base_dPair_dPair_first = dtb__48; Base_dPair.f_Base_dPair_dPair_second = dtb__49 } -> (match dtb__49 with
  | { Base_dPair.f_Base_dPair_dPair_first = dtb__50; Base_dPair.f_Base_dPair_dPair_second = dtb__51 } -> (((v_Vuna_dCompiler_dFrontend_dLexer_dskipTriviaCommentsGo (fuel - 1)) (Base_dList.C_Base_dList_dList_Cons ({ f_Vuna_dCompiler_dFrontend_dLexer_dComment_commentKind = C_Vuna_dCompiler_dFrontend_dLexer_dCKind_CBlock; f_Vuna_dCompiler_dFrontend_dLexer_dComment_commentText = dtb__48; f_Vuna_dCompiler_dFrontend_dLexer_dComment_commentSpan = ((v_Vuna_dCompiler_dFrontend_dLexer_dcommentSpanOf dtb__38) dtb__51) }, acc))) dtb__50)
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
)
  | Vuna_dCompiler_dBase_dDiag.C_Vuna_dCompiler_dBase_dDiag_dCheck_ErrC (dtb__52) -> (Vuna_dCompiler_dBase_dDiag.C_Vuna_dCompiler_dBase_dDiag_dCheck_ErrC (dtb__52))
  | _ -> failwith "DT: impossible branch"
)) ((((v_Vuna_dCompiler_dFrontend_dLexer_dcollectBlockBody { f_Vuna_dCompiler_dFrontend_dLexer_dChars_charsRemaining = dtb__42; f_Vuna_dCompiler_dFrontend_dLexer_dChars_charsPos = ((v_Vuna_dCompiler_dFrontend_dLexer_dadvanceChar dtb__41) ((v_Vuna_dCompiler_dFrontend_dLexer_dadvanceChar dtb__39) dtb__38)) }) 1) Base_dList.C_Base_dList_dList_Nil) ((v_Vuna_dCompiler_dFrontend_dLexer_dadvanceChar dtb__41) dtb__38))) else (Vuna_dCompiler_dBase_dDiag.C_Vuna_dCompiler_dBase_dDiag_dCheck_OkC ({ Base_dPair.f_Base_dPair_dPair_first = cs; Base_dPair.f_Base_dPair_dPair_second = (Base_dList.v_Base_dList_dreverse acc) }))))
  | Base_dList.C_Base_dList_dList_Nil -> (Vuna_dCompiler_dBase_dDiag.C_Vuna_dCompiler_dBase_dDiag_dCheck_OkC ({ Base_dPair.f_Base_dPair_dPair_first = cs; Base_dPair.f_Base_dPair_dPair_second = (Base_dList.v_Base_dList_dreverse acc) }))
  | _ -> failwith "DT: impossible branch"
))
  | Base_dList.C_Base_dList_dList_Nil -> (Vuna_dCompiler_dBase_dDiag.C_Vuna_dCompiler_dBase_dDiag_dCheck_OkC ({ Base_dPair.f_Base_dPair_dPair_first = cs; Base_dPair.f_Base_dPair_dPair_second = (Base_dList.v_Base_dList_dreverse acc) }))
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
)) cs)))

# 231 "Vuna/Compiler/Frontend/Lexer.vuna"
let v_Vuna_dCompiler_dFrontend_dLexer_dskipTriviaComments = (fun fuel cs -> (((v_Vuna_dCompiler_dFrontend_dLexer_dskipTriviaCommentsGo fuel) Base_dList.C_Base_dList_dList_Nil) cs))

# 256 "Vuna/Compiler/Frontend/Lexer.vuna"
let v_Vuna_dCompiler_dFrontend_dLexer_dstartsWithVunaAt = (fun rest -> (((Base_dEq.v_Base_dEq_deq (Base_dList.v_Eq_uBase_uList_uList_ua Base_dInt.v_Eq_uInt)) ((Base_dList.v_Base_dList_dtake 5) rest)) (Base_dList.C_Base_dList_dList_Cons (118, (Base_dList.C_Base_dList_dList_Cons (117, (Base_dList.C_Base_dList_dList_Cons (110, (Base_dList.C_Base_dList_dList_Cons (97, (Base_dList.C_Base_dList_dList_Cons (64, Base_dList.C_Base_dList_dList_Nil))))))))))))

# 259 "Vuna/Compiler/Frontend/Lexer.vuna"
let rec v_Vuna_dCompiler_dFrontend_dLexer_dcollectInternalIdent = (fun mc0 mc1 -> (match mc0 with
  | { f_Vuna_dCompiler_dFrontend_dLexer_dChars_charsRemaining = dtb__53; f_Vuna_dCompiler_dFrontend_dLexer_dChars_charsPos = dtb__54 } -> (match dtb__53 with
  | Base_dList.C_Base_dList_dList_Cons (dtb__55, dtb__56) -> (if (if (v_Vuna_dCompiler_dFrontend_dLexer_disIdentChar dtb__55) then true else (dtb__55 = 64)) then ((v_Vuna_dCompiler_dFrontend_dLexer_dcollectInternalIdent { f_Vuna_dCompiler_dFrontend_dLexer_dChars_charsRemaining = dtb__56; f_Vuna_dCompiler_dFrontend_dLexer_dChars_charsPos = ((v_Vuna_dCompiler_dFrontend_dLexer_dadvanceChar dtb__55) dtb__54) }) (Base_dList.C_Base_dList_dList_Cons (dtb__55, mc1))) else { Base_dPair.f_Base_dPair_dPair_first = (Base_dList.dtp_pack (Base_dList.v_Base_dList_dreverse mc1)); Base_dPair.f_Base_dPair_dPair_second = { f_Vuna_dCompiler_dFrontend_dLexer_dChars_charsRemaining = (Base_dList.C_Base_dList_dList_Cons (dtb__55, dtb__56)); f_Vuna_dCompiler_dFrontend_dLexer_dChars_charsPos = dtb__54 } })
  | Base_dList.C_Base_dList_dList_Nil -> { Base_dPair.f_Base_dPair_dPair_first = (Base_dList.dtp_pack (Base_dList.v_Base_dList_dreverse mc1)); Base_dPair.f_Base_dPair_dPair_second = { f_Vuna_dCompiler_dFrontend_dLexer_dChars_charsRemaining = Base_dList.C_Base_dList_dList_Nil; f_Vuna_dCompiler_dFrontend_dLexer_dChars_charsPos = dtb__54 } }
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
))

# 265 "Vuna/Compiler/Frontend/Lexer.vuna"
let rec v_Vuna_dCompiler_dFrontend_dLexer_dcollectIdent = (fun mc0 mc1 -> (match mc0 with
  | { f_Vuna_dCompiler_dFrontend_dLexer_dChars_charsRemaining = dtb__57; f_Vuna_dCompiler_dFrontend_dLexer_dChars_charsPos = dtb__58 } -> (match dtb__57 with
  | Base_dList.C_Base_dList_dList_Cons (dtb__59, dtb__60) -> (if (v_Vuna_dCompiler_dFrontend_dLexer_disIdentChar dtb__59) then ((v_Vuna_dCompiler_dFrontend_dLexer_dcollectIdent { f_Vuna_dCompiler_dFrontend_dLexer_dChars_charsRemaining = dtb__60; f_Vuna_dCompiler_dFrontend_dLexer_dChars_charsPos = ((v_Vuna_dCompiler_dFrontend_dLexer_dadvanceChar dtb__59) dtb__58) }) (Base_dList.C_Base_dList_dList_Cons (dtb__59, mc1))) else (if (dtb__59 = 46) then (match dtb__60 with
  | Base_dList.C_Base_dList_dList_Cons (dtb__61, dtb__62) -> (if (v_Vuna_dCompiler_dFrontend_dLexer_disIdentStart dtb__61) then ((v_Vuna_dCompiler_dFrontend_dLexer_dcollectIdent { f_Vuna_dCompiler_dFrontend_dLexer_dChars_charsRemaining = dtb__60; f_Vuna_dCompiler_dFrontend_dLexer_dChars_charsPos = ((v_Vuna_dCompiler_dFrontend_dLexer_dadvanceChar dtb__59) dtb__58) }) (Base_dList.C_Base_dList_dList_Cons (dtb__59, mc1))) else { Base_dPair.f_Base_dPair_dPair_first = (Base_dList.dtp_pack (Base_dList.v_Base_dList_dreverse mc1)); Base_dPair.f_Base_dPair_dPair_second = { f_Vuna_dCompiler_dFrontend_dLexer_dChars_charsRemaining = (Base_dList.C_Base_dList_dList_Cons (dtb__59, dtb__60)); f_Vuna_dCompiler_dFrontend_dLexer_dChars_charsPos = dtb__58 } })
  | Base_dList.C_Base_dList_dList_Nil -> { Base_dPair.f_Base_dPair_dPair_first = (Base_dList.dtp_pack (Base_dList.v_Base_dList_dreverse mc1)); Base_dPair.f_Base_dPair_dPair_second = { f_Vuna_dCompiler_dFrontend_dLexer_dChars_charsRemaining = (Base_dList.C_Base_dList_dList_Cons (dtb__59, dtb__60)); f_Vuna_dCompiler_dFrontend_dLexer_dChars_charsPos = dtb__58 } }
  | _ -> failwith "DT: impossible branch"
) else { Base_dPair.f_Base_dPair_dPair_first = (Base_dList.dtp_pack (Base_dList.v_Base_dList_dreverse mc1)); Base_dPair.f_Base_dPair_dPair_second = { f_Vuna_dCompiler_dFrontend_dLexer_dChars_charsRemaining = (Base_dList.C_Base_dList_dList_Cons (dtb__59, dtb__60)); f_Vuna_dCompiler_dFrontend_dLexer_dChars_charsPos = dtb__58 } }))
  | Base_dList.C_Base_dList_dList_Nil -> { Base_dPair.f_Base_dPair_dPair_first = (Base_dList.dtp_pack (Base_dList.v_Base_dList_dreverse mc1)); Base_dPair.f_Base_dPair_dPair_second = { f_Vuna_dCompiler_dFrontend_dLexer_dChars_charsRemaining = Base_dList.C_Base_dList_dList_Nil; f_Vuna_dCompiler_dFrontend_dLexer_dChars_charsPos = dtb__58 } }
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
))

# 277 "Vuna/Compiler/Frontend/Lexer.vuna"
let v_Vuna_dCompiler_dFrontend_dLexer_dmaxIntLiteral = 4611686018427387903

# 282 "Vuna/Compiler/Frontend/Lexer.vuna"
let rec v_Vuna_dCompiler_dFrontend_dLexer_dcollectInt = (fun mc0 mc1 -> (match mc0 with
  | { f_Vuna_dCompiler_dFrontend_dLexer_dChars_charsRemaining = dtb__63; f_Vuna_dCompiler_dFrontend_dLexer_dChars_charsPos = dtb__64 } -> (match dtb__63 with
  | Base_dList.C_Base_dList_dList_Cons (dtb__65, dtb__66) -> (if (v_Vuna_dCompiler_dFrontend_dLexer_disDigit dtb__65) then ((fun d -> (if (mc1 > (if 10 = 0 then failwith "division by zero" else (v_Vuna_dCompiler_dFrontend_dLexer_dmaxIntLiteral - d) / 10)) then ((Vuna_dCompiler_dBase_dDiagnostics_dFrontend.v_Vuna_dCompiler_dBase_dDiagnostics_dFrontend_dlexErr0At (v_Vuna_dCompiler_dFrontend_dLexer_dlexSpanAt dtb__64)) Vuna_dCompiler_dBase_dDiagnostics_dFrontend.C_Vuna_dCompiler_dBase_dDiagnostics_dFrontend_dLexDiag_IntLiteralOutOfRange) else ((v_Vuna_dCompiler_dFrontend_dLexer_dcollectInt { f_Vuna_dCompiler_dFrontend_dLexer_dChars_charsRemaining = dtb__66; f_Vuna_dCompiler_dFrontend_dLexer_dChars_charsPos = ((v_Vuna_dCompiler_dFrontend_dLexer_dadvanceChar dtb__65) dtb__64) }) ((mc1 * 10) + d)))) (dtb__65 - 48)) else (Vuna_dCompiler_dBase_dDiag.C_Vuna_dCompiler_dBase_dDiag_dCheck_OkC ({ Base_dPair.f_Base_dPair_dPair_first = mc1; Base_dPair.f_Base_dPair_dPair_second = { f_Vuna_dCompiler_dFrontend_dLexer_dChars_charsRemaining = (Base_dList.C_Base_dList_dList_Cons (dtb__65, dtb__66)); f_Vuna_dCompiler_dFrontend_dLexer_dChars_charsPos = dtb__64 } })))
  | Base_dList.C_Base_dList_dList_Nil -> (Vuna_dCompiler_dBase_dDiag.C_Vuna_dCompiler_dBase_dDiag_dCheck_OkC ({ Base_dPair.f_Base_dPair_dPair_first = mc1; Base_dPair.f_Base_dPair_dPair_second = { f_Vuna_dCompiler_dFrontend_dLexer_dChars_charsRemaining = Base_dList.C_Base_dList_dList_Nil; f_Vuna_dCompiler_dFrontend_dLexer_dChars_charsPos = dtb__64 } }))
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
))

# 297 "Vuna/Compiler/Frontend/Lexer.vuna"
let rec v_Vuna_dCompiler_dFrontend_dLexer_ddigitRunIsFloat = (fun mc0 -> (match mc0 with
  | { f_Vuna_dCompiler_dFrontend_dLexer_dChars_charsRemaining = dtb__67; f_Vuna_dCompiler_dFrontend_dLexer_dChars_charsPos = dtb__68 } -> (match dtb__67 with
  | Base_dList.C_Base_dList_dList_Cons (dtb__69, dtb__70) -> (if (v_Vuna_dCompiler_dFrontend_dLexer_disDigit dtb__69) then (v_Vuna_dCompiler_dFrontend_dLexer_ddigitRunIsFloat { f_Vuna_dCompiler_dFrontend_dLexer_dChars_charsRemaining = dtb__70; f_Vuna_dCompiler_dFrontend_dLexer_dChars_charsPos = ((v_Vuna_dCompiler_dFrontend_dLexer_dadvanceChar dtb__69) dtb__68) }) else (if (dtb__69 = 46) then (match dtb__70 with
  | Base_dList.C_Base_dList_dList_Cons (dtb__71, dtb__72) -> (v_Vuna_dCompiler_dFrontend_dLexer_disDigit dtb__71)
  | Base_dList.C_Base_dList_dList_Nil -> false
  | _ -> failwith "DT: impossible branch"
) else false))
  | Base_dList.C_Base_dList_dList_Nil -> false
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
))

# 315 "Vuna/Compiler/Frontend/Lexer.vuna"
let rec v_Vuna_dCompiler_dFrontend_dLexer_dcollectFrac = (fun mc0 mc1 -> (match mc0 with
  | { f_Vuna_dCompiler_dFrontend_dLexer_dChars_charsRemaining = dtb__73; f_Vuna_dCompiler_dFrontend_dLexer_dChars_charsPos = dtb__74 } -> (match dtb__73 with
  | Base_dList.C_Base_dList_dList_Cons (dtb__75, dtb__76) -> (if (v_Vuna_dCompiler_dFrontend_dLexer_disDigit dtb__75) then ((v_Vuna_dCompiler_dFrontend_dLexer_dcollectFrac { f_Vuna_dCompiler_dFrontend_dLexer_dChars_charsRemaining = dtb__76; f_Vuna_dCompiler_dFrontend_dLexer_dChars_charsPos = ((v_Vuna_dCompiler_dFrontend_dLexer_dadvanceChar dtb__75) dtb__74) }) (Base_dList.C_Base_dList_dList_Cons (dtb__75, mc1))) else { Base_dPair.f_Base_dPair_dPair_first = (Base_dList.dtp_pack (Base_dList.v_Base_dList_dreverse mc1)); Base_dPair.f_Base_dPair_dPair_second = { f_Vuna_dCompiler_dFrontend_dLexer_dChars_charsRemaining = (Base_dList.C_Base_dList_dList_Cons (dtb__75, dtb__76)); f_Vuna_dCompiler_dFrontend_dLexer_dChars_charsPos = dtb__74 } })
  | Base_dList.C_Base_dList_dList_Nil -> { Base_dPair.f_Base_dPair_dPair_first = (Base_dList.dtp_pack (Base_dList.v_Base_dList_dreverse mc1)); Base_dPair.f_Base_dPair_dPair_second = { f_Vuna_dCompiler_dFrontend_dLexer_dChars_charsRemaining = Base_dList.C_Base_dList_dList_Nil; f_Vuna_dCompiler_dFrontend_dLexer_dChars_charsPos = dtb__74 } }
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
))

# 307 "Vuna/Compiler/Frontend/Lexer.vuna"
let rec v_Vuna_dCompiler_dFrontend_dLexer_dcollectFloat = (fun mc0 mc1 -> (match mc0 with
  | { f_Vuna_dCompiler_dFrontend_dLexer_dChars_charsRemaining = dtb__77; f_Vuna_dCompiler_dFrontend_dLexer_dChars_charsPos = dtb__78 } -> (match dtb__77 with
  | Base_dList.C_Base_dList_dList_Cons (dtb__79, dtb__80) -> (if (v_Vuna_dCompiler_dFrontend_dLexer_disDigit dtb__79) then ((v_Vuna_dCompiler_dFrontend_dLexer_dcollectFloat { f_Vuna_dCompiler_dFrontend_dLexer_dChars_charsRemaining = dtb__80; f_Vuna_dCompiler_dFrontend_dLexer_dChars_charsPos = ((v_Vuna_dCompiler_dFrontend_dLexer_dadvanceChar dtb__79) dtb__78) }) (Base_dList.C_Base_dList_dList_Cons (dtb__79, mc1))) else (if (dtb__79 = 46) then ((v_Vuna_dCompiler_dFrontend_dLexer_dcollectFrac { f_Vuna_dCompiler_dFrontend_dLexer_dChars_charsRemaining = dtb__80; f_Vuna_dCompiler_dFrontend_dLexer_dChars_charsPos = ((v_Vuna_dCompiler_dFrontend_dLexer_dadvanceChar dtb__79) dtb__78) }) (Base_dList.C_Base_dList_dList_Cons (dtb__79, mc1))) else { Base_dPair.f_Base_dPair_dPair_first = (Base_dList.dtp_pack (Base_dList.v_Base_dList_dreverse mc1)); Base_dPair.f_Base_dPair_dPair_second = { f_Vuna_dCompiler_dFrontend_dLexer_dChars_charsRemaining = (Base_dList.C_Base_dList_dList_Cons (dtb__79, dtb__80)); f_Vuna_dCompiler_dFrontend_dLexer_dChars_charsPos = dtb__78 } }))
  | Base_dList.C_Base_dList_dList_Nil -> { Base_dPair.f_Base_dPair_dPair_first = (Base_dList.dtp_pack (Base_dList.v_Base_dList_dreverse mc1)); Base_dPair.f_Base_dPair_dPair_second = { f_Vuna_dCompiler_dFrontend_dLexer_dChars_charsRemaining = Base_dList.C_Base_dList_dList_Nil; f_Vuna_dCompiler_dFrontend_dLexer_dChars_charsPos = dtb__78 } }
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
))

# 321 "Vuna/Compiler/Frontend/Lexer.vuna"
let rec v_Vuna_dCompiler_dFrontend_dLexer_dcollectOp = (fun mc0 mc1 -> (match mc0 with
  | { f_Vuna_dCompiler_dFrontend_dLexer_dChars_charsRemaining = dtb__81; f_Vuna_dCompiler_dFrontend_dLexer_dChars_charsPos = dtb__82 } -> (match dtb__81 with
  | Base_dList.C_Base_dList_dList_Cons (dtb__83, dtb__84) -> (if (v_Vuna_dCompiler_dFrontend_dLexer_disOpChar dtb__83) then ((v_Vuna_dCompiler_dFrontend_dLexer_dcollectOp { f_Vuna_dCompiler_dFrontend_dLexer_dChars_charsRemaining = dtb__84; f_Vuna_dCompiler_dFrontend_dLexer_dChars_charsPos = ((v_Vuna_dCompiler_dFrontend_dLexer_dadvanceChar dtb__83) dtb__82) }) (Base_dList.C_Base_dList_dList_Cons (dtb__83, mc1))) else { Base_dPair.f_Base_dPair_dPair_first = (Base_dList.dtp_pack (Base_dList.v_Base_dList_dreverse mc1)); Base_dPair.f_Base_dPair_dPair_second = { f_Vuna_dCompiler_dFrontend_dLexer_dChars_charsRemaining = (Base_dList.C_Base_dList_dList_Cons (dtb__83, dtb__84)); f_Vuna_dCompiler_dFrontend_dLexer_dChars_charsPos = dtb__82 } })
  | Base_dList.C_Base_dList_dList_Nil -> { Base_dPair.f_Base_dPair_dPair_first = (Base_dList.dtp_pack (Base_dList.v_Base_dList_dreverse mc1)); Base_dPair.f_Base_dPair_dPair_second = { f_Vuna_dCompiler_dFrontend_dLexer_dChars_charsRemaining = Base_dList.C_Base_dList_dList_Nil; f_Vuna_dCompiler_dFrontend_dLexer_dChars_charsPos = dtb__82 } }
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
))

# 339 "Vuna/Compiler/Frontend/Lexer.vuna"
let v_Vuna_dCompiler_dFrontend_dLexer_ddecodeEscape = (fun mc0 -> (if (mc0 = 110) then (Base_dMaybe.C_Base_dMaybe_dMaybe_Just (10)) else (if (mc0 = 116) then (Base_dMaybe.C_Base_dMaybe_dMaybe_Just (9)) else (if (mc0 = 114) then (Base_dMaybe.C_Base_dMaybe_dMaybe_Just (13)) else (if (mc0 = 34) then (Base_dMaybe.C_Base_dMaybe_dMaybe_Just (34)) else (if (mc0 = 92) then (Base_dMaybe.C_Base_dMaybe_dMaybe_Just (92)) else (if (mc0 = 39) then (Base_dMaybe.C_Base_dMaybe_dMaybe_Just (39)) else (if (mc0 = 36) then (Base_dMaybe.C_Base_dMaybe_dMaybe_Just (36)) else Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing))))))))

# 349 "Vuna/Compiler/Frontend/Lexer.vuna"
let v_Vuna_dCompiler_dFrontend_dLexer_ddropOpeningNewline = (fun mc0 -> (match mc0 with
  | { f_Vuna_dCompiler_dFrontend_dLexer_dChars_charsRemaining = dtb__85; f_Vuna_dCompiler_dFrontend_dLexer_dChars_charsPos = dtb__86 } -> (match dtb__85 with
  | Base_dList.C_Base_dList_dList_Nil -> mc0
  | Base_dList.C_Base_dList_dList_Cons (dtb__87, dtb__88) -> (if (dtb__87 = 10) then { f_Vuna_dCompiler_dFrontend_dLexer_dChars_charsRemaining = dtb__88; f_Vuna_dCompiler_dFrontend_dLexer_dChars_charsPos = ((v_Vuna_dCompiler_dFrontend_dLexer_dadvanceChar dtb__87) dtb__86) } else mc0)
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
))

# 353 "Vuna/Compiler/Frontend/Lexer.vuna"
let v_Vuna_dCompiler_dFrontend_dLexer_dflushText = (fun mc0 mc1 -> (match mc0 with
  | Base_dList.C_Base_dList_dList_Nil -> mc1
  | _ -> (Base_dList.C_Base_dList_dList_Cons ((C_Vuna_dCompiler_dFrontend_dLexer_dTmplPart_TPText ((Base_dList.dtp_pack (Base_dList.v_Base_dList_dreverse mc0)))), mc1))
))

# 416 "Vuna/Compiler/Frontend/Lexer.vuna"
let v_Vuna_dCompiler_dFrontend_dLexer_ddepthAfter = (fun mc0 mc1 -> (match mc1 with
  | C_Vuna_dCompiler_dFrontend_dLexer_dTok_TSym (dtb__89) -> (if (dtb__89 = "{") then (mc0 + 1) else (if (dtb__89 = "}") then (if (mc0 > 0) then (mc0 - 1) else 0) else mc0))
  | _ -> mc0
))

# 360 "Vuna/Compiler/Frontend/Lexer.vuna"
let rec v_Vuna_dCompiler_dFrontend_dLexer_dscanTemplateText = (fun fuel multi cs acc parts -> (if (fuel <= 0) then (Vuna_dCompiler_dBase_dDiag.v_Vuna_dCompiler_dBase_dDiag_dicFuel "lexer") else ((fun nd_uscrut5 -> (match nd_uscrut5 with
  | { f_Vuna_dCompiler_dFrontend_dLexer_dChars_charsRemaining = dtb__90; f_Vuna_dCompiler_dFrontend_dLexer_dChars_charsPos = dtb__91 } -> (match dtb__90 with
  | Base_dList.C_Base_dList_dList_Cons (dtb__92, dtb__93) -> (if (dtb__92 = 36) then (match dtb__93 with
  | Base_dList.C_Base_dList_dList_Cons (dtb__94, dtb__95) -> (if (dtb__94 = 123) then ((fun holeStart -> ((fun nd_uscrut15 -> (match nd_uscrut15 with
  | Vuna_dCompiler_dBase_dDiag.C_Vuna_dCompiler_dBase_dDiag_dCheck_OkC (dtb__96) -> (match dtb__96 with
  | { Base_dPair.f_Base_dPair_dPair_first = dtb__97; Base_dPair.f_Base_dPair_dPair_second = dtb__98 } -> ((fun nd_uscrut22 -> (match nd_uscrut22 with
  | { f_Vuna_dCompiler_dFrontend_dLexer_dChars_charsRemaining = dtb__99; f_Vuna_dCompiler_dFrontend_dLexer_dChars_charsPos = dtb__100 } -> (match dtb__99 with
  | Base_dList.C_Base_dList_dList_Cons (dtb__101, dtb__102) -> (if (dtb__101 = 125) then (((((v_Vuna_dCompiler_dFrontend_dLexer_dscanTemplateText (fuel - 1)) multi) { f_Vuna_dCompiler_dFrontend_dLexer_dChars_charsRemaining = dtb__102; f_Vuna_dCompiler_dFrontend_dLexer_dChars_charsPos = ((v_Vuna_dCompiler_dFrontend_dLexer_dadvanceChar 125) dtb__100) }) Base_dList.C_Base_dList_dList_Nil) (Base_dList.C_Base_dList_dList_Cons ((C_Vuna_dCompiler_dFrontend_dLexer_dTmplPart_TPHole (dtb__97)), ((v_Vuna_dCompiler_dFrontend_dLexer_dflushText acc) parts)))) else ((Vuna_dCompiler_dBase_dDiagnostics_dFrontend.v_Vuna_dCompiler_dBase_dDiagnostics_dFrontend_dlexErr0At (v_Vuna_dCompiler_dFrontend_dLexer_dlexSpanAt dtb__91)) Vuna_dCompiler_dBase_dDiagnostics_dFrontend.C_Vuna_dCompiler_dBase_dDiagnostics_dFrontend_dLexDiag_UnterminatedInterpolation))
  | _ -> ((Vuna_dCompiler_dBase_dDiagnostics_dFrontend.v_Vuna_dCompiler_dBase_dDiagnostics_dFrontend_dlexErr0At (v_Vuna_dCompiler_dFrontend_dLexer_dlexSpanAt dtb__91)) Vuna_dCompiler_dBase_dDiagnostics_dFrontend.C_Vuna_dCompiler_dBase_dDiagnostics_dFrontend_dLexDiag_UnterminatedInterpolation)
)
  | _ -> failwith "DT: impossible branch"
)) dtb__98)
  | _ -> failwith "DT: impossible branch"
)
  | Vuna_dCompiler_dBase_dDiag.C_Vuna_dCompiler_dBase_dDiag_dCheck_ErrC (dtb__103) -> (Vuna_dCompiler_dBase_dDiag.C_Vuna_dCompiler_dBase_dDiag_dCheck_ErrC (dtb__103))
  | _ -> failwith "DT: impossible branch"
)) ((((v_Vuna_dCompiler_dFrontend_dLexer_dlexHoleTokens (fuel - 1)) 0) { f_Vuna_dCompiler_dFrontend_dLexer_dChars_charsRemaining = dtb__95; f_Vuna_dCompiler_dFrontend_dLexer_dChars_charsPos = holeStart }) Base_dList.C_Base_dList_dList_Nil))) ((v_Vuna_dCompiler_dFrontend_dLexer_dadvanceChar dtb__94) ((v_Vuna_dCompiler_dFrontend_dLexer_dadvanceChar dtb__92) dtb__91))) else (((((v_Vuna_dCompiler_dFrontend_dLexer_dscanTemplateText (fuel - 1)) multi) { f_Vuna_dCompiler_dFrontend_dLexer_dChars_charsRemaining = dtb__93; f_Vuna_dCompiler_dFrontend_dLexer_dChars_charsPos = ((v_Vuna_dCompiler_dFrontend_dLexer_dadvanceChar dtb__92) dtb__91) }) (Base_dList.C_Base_dList_dList_Cons (dtb__92, acc))) parts))
  | Base_dList.C_Base_dList_dList_Nil -> (((((v_Vuna_dCompiler_dFrontend_dLexer_dscanTemplateText (fuel - 1)) multi) { f_Vuna_dCompiler_dFrontend_dLexer_dChars_charsRemaining = dtb__93; f_Vuna_dCompiler_dFrontend_dLexer_dChars_charsPos = ((v_Vuna_dCompiler_dFrontend_dLexer_dadvanceChar dtb__92) dtb__91) }) (Base_dList.C_Base_dList_dList_Cons (dtb__92, acc))) parts)
  | _ -> failwith "DT: impossible branch"
) else (if (dtb__92 = 92) then (match dtb__93 with
  | Base_dList.C_Base_dList_dList_Cons (dtb__104, dtb__105) -> (match (v_Vuna_dCompiler_dFrontend_dLexer_ddecodeEscape dtb__104) with
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing -> ((Vuna_dCompiler_dBase_dDiagnostics_dFrontend.v_Vuna_dCompiler_dBase_dDiagnostics_dFrontend_dlexErr0At (v_Vuna_dCompiler_dFrontend_dLexer_dlexSpanAt dtb__91)) Vuna_dCompiler_dBase_dDiagnostics_dFrontend.C_Vuna_dCompiler_dBase_dDiagnostics_dFrontend_dLexDiag_UnknownEscape)
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Just (dtb__106) -> (((((v_Vuna_dCompiler_dFrontend_dLexer_dscanTemplateText (fuel - 1)) multi) { f_Vuna_dCompiler_dFrontend_dLexer_dChars_charsRemaining = dtb__105; f_Vuna_dCompiler_dFrontend_dLexer_dChars_charsPos = ((v_Vuna_dCompiler_dFrontend_dLexer_dadvanceChar dtb__104) ((v_Vuna_dCompiler_dFrontend_dLexer_dadvanceChar dtb__92) dtb__91)) }) (Base_dList.C_Base_dList_dList_Cons (dtb__106, acc))) parts)
  | _ -> failwith "DT: impossible branch"
)
  | Base_dList.C_Base_dList_dList_Nil -> ((Vuna_dCompiler_dBase_dDiagnostics_dFrontend.v_Vuna_dCompiler_dBase_dDiagnostics_dFrontend_dlexErr0At (v_Vuna_dCompiler_dFrontend_dLexer_dlexSpanAt dtb__91)) Vuna_dCompiler_dBase_dDiagnostics_dFrontend.C_Vuna_dCompiler_dBase_dDiagnostics_dFrontend_dLexDiag_UnterminatedString)
  | _ -> failwith "DT: impossible branch"
) else (if (if multi then (dtb__92 = 34) else false) then (match dtb__93 with
  | Base_dList.C_Base_dList_dList_Cons (dtb__107, dtb__108) -> (match dtb__108 with
  | Base_dList.C_Base_dList_dList_Cons (dtb__109, dtb__110) -> (if (if (dtb__107 = 34) then (dtb__109 = 34) else false) then ((fun pos2 -> ((fun pos3 -> (Vuna_dCompiler_dBase_dDiag.C_Vuna_dCompiler_dBase_dDiag_dCheck_OkC ({ Base_dPair.f_Base_dPair_dPair_first = (Base_dList.v_Base_dList_dreverse ((v_Vuna_dCompiler_dFrontend_dLexer_dflushText acc) parts)); Base_dPair.f_Base_dPair_dPair_second = { Base_dPair.f_Base_dPair_dPair_first = { f_Vuna_dCompiler_dFrontend_dLexer_dChars_charsRemaining = dtb__110; f_Vuna_dCompiler_dFrontend_dLexer_dChars_charsPos = ((v_Vuna_dCompiler_dFrontend_dLexer_dadvanceChar dtb__109) pos3) }; Base_dPair.f_Base_dPair_dPair_second = pos3 } }))) ((v_Vuna_dCompiler_dFrontend_dLexer_dadvanceChar dtb__109) pos2))) ((v_Vuna_dCompiler_dFrontend_dLexer_dadvanceChar dtb__107) ((v_Vuna_dCompiler_dFrontend_dLexer_dadvanceChar dtb__92) dtb__91))) else (((((v_Vuna_dCompiler_dFrontend_dLexer_dscanTemplateText (fuel - 1)) multi) { f_Vuna_dCompiler_dFrontend_dLexer_dChars_charsRemaining = dtb__93; f_Vuna_dCompiler_dFrontend_dLexer_dChars_charsPos = ((v_Vuna_dCompiler_dFrontend_dLexer_dadvanceChar dtb__92) dtb__91) }) (Base_dList.C_Base_dList_dList_Cons (dtb__92, acc))) parts))
  | Base_dList.C_Base_dList_dList_Nil -> ((Vuna_dCompiler_dBase_dDiagnostics_dFrontend.v_Vuna_dCompiler_dBase_dDiagnostics_dFrontend_dlexErr0At (v_Vuna_dCompiler_dFrontend_dLexer_dlexSpanAt dtb__91)) Vuna_dCompiler_dBase_dDiagnostics_dFrontend.C_Vuna_dCompiler_dBase_dDiagnostics_dFrontend_dLexDiag_UnterminatedString)
  | _ -> failwith "DT: impossible branch"
)
  | Base_dList.C_Base_dList_dList_Nil -> ((Vuna_dCompiler_dBase_dDiagnostics_dFrontend.v_Vuna_dCompiler_dBase_dDiagnostics_dFrontend_dlexErr0At (v_Vuna_dCompiler_dFrontend_dLexer_dlexSpanAt dtb__91)) Vuna_dCompiler_dBase_dDiagnostics_dFrontend.C_Vuna_dCompiler_dBase_dDiagnostics_dFrontend_dLexDiag_UnterminatedString)
  | _ -> failwith "DT: impossible branch"
) else (if (if (Base_dBool.v_Base_dBool_dnot multi) then (dtb__92 = 34) else false) then (Vuna_dCompiler_dBase_dDiag.C_Vuna_dCompiler_dBase_dDiag_dCheck_OkC ({ Base_dPair.f_Base_dPair_dPair_first = (Base_dList.v_Base_dList_dreverse ((v_Vuna_dCompiler_dFrontend_dLexer_dflushText acc) parts)); Base_dPair.f_Base_dPair_dPair_second = { Base_dPair.f_Base_dPair_dPair_first = { f_Vuna_dCompiler_dFrontend_dLexer_dChars_charsRemaining = dtb__93; f_Vuna_dCompiler_dFrontend_dLexer_dChars_charsPos = ((v_Vuna_dCompiler_dFrontend_dLexer_dadvanceChar dtb__92) dtb__91) }; Base_dPair.f_Base_dPair_dPair_second = dtb__91 } })) else (if (if (Base_dBool.v_Base_dBool_dnot multi) then (dtb__92 = 10) else false) then ((Vuna_dCompiler_dBase_dDiagnostics_dFrontend.v_Vuna_dCompiler_dBase_dDiagnostics_dFrontend_dlexErr0At (v_Vuna_dCompiler_dFrontend_dLexer_dlexSpanAt dtb__91)) Vuna_dCompiler_dBase_dDiagnostics_dFrontend.C_Vuna_dCompiler_dBase_dDiagnostics_dFrontend_dLexDiag_UnterminatedString) else (((((v_Vuna_dCompiler_dFrontend_dLexer_dscanTemplateText (fuel - 1)) multi) { f_Vuna_dCompiler_dFrontend_dLexer_dChars_charsRemaining = dtb__93; f_Vuna_dCompiler_dFrontend_dLexer_dChars_charsPos = ((v_Vuna_dCompiler_dFrontend_dLexer_dadvanceChar dtb__92) dtb__91) }) (Base_dList.C_Base_dList_dList_Cons (dtb__92, acc))) parts))))))
  | Base_dList.C_Base_dList_dList_Nil -> ((Vuna_dCompiler_dBase_dDiagnostics_dFrontend.v_Vuna_dCompiler_dBase_dDiagnostics_dFrontend_dlexErr0At (v_Vuna_dCompiler_dFrontend_dLexer_dlexSpanAt dtb__91)) Vuna_dCompiler_dBase_dDiagnostics_dFrontend.C_Vuna_dCompiler_dBase_dDiagnostics_dFrontend_dLexDiag_UnterminatedString)
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
)) cs)))
# 403 "Vuna/Compiler/Frontend/Lexer.vuna"
and v_Vuna_dCompiler_dFrontend_dLexer_dlexHoleTokens = (fun fuel depth cs acc -> (if (fuel <= 0) then (Vuna_dCompiler_dBase_dDiag.v_Vuna_dCompiler_dBase_dDiag_dicFuel "lexer") else (match ((v_Vuna_dCompiler_dFrontend_dLexer_dskipTrivia (fuel - 1)) cs) with
  | Vuna_dCompiler_dBase_dDiag.C_Vuna_dCompiler_dBase_dDiag_dCheck_ErrC (dtb__111) -> (Vuna_dCompiler_dBase_dDiag.C_Vuna_dCompiler_dBase_dDiag_dCheck_ErrC (dtb__111))
  | Vuna_dCompiler_dBase_dDiag.C_Vuna_dCompiler_dBase_dDiag_dCheck_OkC (dtb__112) -> ((fun nd_uscrut6 -> (match nd_uscrut6 with
  | { f_Vuna_dCompiler_dFrontend_dLexer_dChars_charsRemaining = dtb__113; f_Vuna_dCompiler_dFrontend_dLexer_dChars_charsPos = dtb__114 } -> (match dtb__113 with
  | Base_dList.C_Base_dList_dList_Cons (dtb__115, dtb__116) -> (if (if (dtb__115 = 125) then (depth = 0) else false) then (Vuna_dCompiler_dBase_dDiag.C_Vuna_dCompiler_dBase_dDiag_dCheck_OkC ({ Base_dPair.f_Base_dPair_dPair_first = (Base_dList.v_Base_dList_dreverse acc); Base_dPair.f_Base_dPair_dPair_second = dtb__112 })) else ((fun nd_uscrut12 -> (match nd_uscrut12 with
  | Vuna_dCompiler_dBase_dDiag.C_Vuna_dCompiler_dBase_dDiag_dCheck_OkC (dtb__117) -> (match dtb__117 with
  | { Base_dPair.f_Base_dPair_dPair_first = dtb__118; Base_dPair.f_Base_dPair_dPair_second = dtb__119 } -> ((((v_Vuna_dCompiler_dFrontend_dLexer_dlexHoleTokens (fuel - 1)) ((v_Vuna_dCompiler_dFrontend_dLexer_ddepthAfter depth) (dtb__118).f_Vuna_dCompiler_dFrontend_dLexer_dPTok_ptokTok)) dtb__119) (Base_dList.C_Base_dList_dList_Cons (dtb__118, acc)))
  | _ -> failwith "DT: impossible branch"
)
  | Vuna_dCompiler_dBase_dDiag.C_Vuna_dCompiler_dBase_dDiag_dCheck_ErrC (dtb__120) -> (Vuna_dCompiler_dBase_dDiag.C_Vuna_dCompiler_dBase_dDiag_dCheck_ErrC (dtb__120))
  | _ -> failwith "DT: impossible branch"
)) ((v_Vuna_dCompiler_dFrontend_dLexer_dlexOneToken (fuel - 1)) dtb__112)))
  | Base_dList.C_Base_dList_dList_Nil -> ((Vuna_dCompiler_dBase_dDiagnostics_dFrontend.v_Vuna_dCompiler_dBase_dDiagnostics_dFrontend_dlexErr0At (v_Vuna_dCompiler_dFrontend_dLexer_dlexSpanAt dtb__114)) Vuna_dCompiler_dBase_dDiagnostics_dFrontend.C_Vuna_dCompiler_dBase_dDiagnostics_dFrontend_dLexDiag_UnterminatedInterpolation)
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
)) dtb__112)
  | _ -> failwith "DT: impossible branch"
)))
# 422 "Vuna/Compiler/Frontend/Lexer.vuna"
and v_Vuna_dCompiler_dFrontend_dLexer_dlexOneToken = (fun fuel cs -> (if (fuel <= 0) then (Vuna_dCompiler_dBase_dDiag.v_Vuna_dCompiler_dBase_dDiag_dicFuel "lexer") else ((fun nd_uscrut2 -> (match nd_uscrut2 with
  | { f_Vuna_dCompiler_dFrontend_dLexer_dChars_charsRemaining = dtb__121; f_Vuna_dCompiler_dFrontend_dLexer_dChars_charsPos = dtb__122 } -> (match dtb__121 with
  | Base_dList.C_Base_dList_dList_Cons (dtb__123, dtb__124) -> (if (if (dtb__123 = 64) then (v_Vuna_dCompiler_dFrontend_dLexer_dstartsWithVunaAt dtb__124) else false) then (match ((v_Vuna_dCompiler_dFrontend_dLexer_dcollectInternalIdent { f_Vuna_dCompiler_dFrontend_dLexer_dChars_charsRemaining = dtb__124; f_Vuna_dCompiler_dFrontend_dLexer_dChars_charsPos = ((v_Vuna_dCompiler_dFrontend_dLexer_dadvanceChar dtb__123) dtb__122) }) (Base_dList.C_Base_dList_dList_Cons (dtb__123, Base_dList.C_Base_dList_dList_Nil))) with
  | { Base_dPair.f_Base_dPair_dPair_first = dtb__125; Base_dPair.f_Base_dPair_dPair_second = dtb__126 } -> (Vuna_dCompiler_dBase_dDiag.C_Vuna_dCompiler_dBase_dDiag_dCheck_OkC ({ Base_dPair.f_Base_dPair_dPair_first = { f_Vuna_dCompiler_dFrontend_dLexer_dPTok_ptokTok = (v_Vuna_dCompiler_dFrontend_dLexer_dclassifyIdent dtb__125); f_Vuna_dCompiler_dFrontend_dLexer_dPTok_ptokPos = dtb__122 }; Base_dPair.f_Base_dPair_dPair_second = dtb__126 }))
  | _ -> failwith "DT: impossible branch"
) else (if (v_Vuna_dCompiler_dFrontend_dLexer_disIdentStart dtb__123) then (match ((v_Vuna_dCompiler_dFrontend_dLexer_dcollectIdent { f_Vuna_dCompiler_dFrontend_dLexer_dChars_charsRemaining = dtb__124; f_Vuna_dCompiler_dFrontend_dLexer_dChars_charsPos = ((v_Vuna_dCompiler_dFrontend_dLexer_dadvanceChar dtb__123) dtb__122) }) (Base_dList.C_Base_dList_dList_Cons (dtb__123, Base_dList.C_Base_dList_dList_Nil))) with
  | { Base_dPair.f_Base_dPair_dPair_first = dtb__127; Base_dPair.f_Base_dPair_dPair_second = dtb__128 } -> (Vuna_dCompiler_dBase_dDiag.C_Vuna_dCompiler_dBase_dDiag_dCheck_OkC ({ Base_dPair.f_Base_dPair_dPair_first = { f_Vuna_dCompiler_dFrontend_dLexer_dPTok_ptokTok = (v_Vuna_dCompiler_dFrontend_dLexer_dclassifyIdent dtb__127); f_Vuna_dCompiler_dFrontend_dLexer_dPTok_ptokPos = dtb__122 }; Base_dPair.f_Base_dPair_dPair_second = dtb__128 }))
  | _ -> failwith "DT: impossible branch"
) else (if (v_Vuna_dCompiler_dFrontend_dLexer_disDigit dtb__123) then (if (v_Vuna_dCompiler_dFrontend_dLexer_ddigitRunIsFloat { f_Vuna_dCompiler_dFrontend_dLexer_dChars_charsRemaining = dtb__124; f_Vuna_dCompiler_dFrontend_dLexer_dChars_charsPos = ((v_Vuna_dCompiler_dFrontend_dLexer_dadvanceChar dtb__123) dtb__122) }) then ((fun frac -> (Vuna_dCompiler_dBase_dDiag.C_Vuna_dCompiler_dBase_dDiag_dCheck_OkC ({ Base_dPair.f_Base_dPair_dPair_first = { f_Vuna_dCompiler_dFrontend_dLexer_dPTok_ptokTok = (C_Vuna_dCompiler_dFrontend_dLexer_dTok_TFloat ((Base_dPair.v_Base_dPair_dfirstOf frac))); f_Vuna_dCompiler_dFrontend_dLexer_dPTok_ptokPos = dtb__122 }; Base_dPair.f_Base_dPair_dPair_second = (Base_dPair.v_Base_dPair_dsecondOf frac) }))) ((v_Vuna_dCompiler_dFrontend_dLexer_dcollectFloat { f_Vuna_dCompiler_dFrontend_dLexer_dChars_charsRemaining = dtb__124; f_Vuna_dCompiler_dFrontend_dLexer_dChars_charsPos = ((v_Vuna_dCompiler_dFrontend_dLexer_dadvanceChar dtb__123) dtb__122) }) (Base_dList.C_Base_dList_dList_Cons (dtb__123, Base_dList.C_Base_dList_dList_Nil)))) else ((fun nd_uscrut8 -> (match nd_uscrut8 with
  | Vuna_dCompiler_dBase_dDiag.C_Vuna_dCompiler_dBase_dDiag_dCheck_OkC (dtb__129) -> (match dtb__129 with
  | { Base_dPair.f_Base_dPair_dPair_first = dtb__130; Base_dPair.f_Base_dPair_dPair_second = dtb__131 } -> (Vuna_dCompiler_dBase_dDiag.C_Vuna_dCompiler_dBase_dDiag_dCheck_OkC ({ Base_dPair.f_Base_dPair_dPair_first = { f_Vuna_dCompiler_dFrontend_dLexer_dPTok_ptokTok = (C_Vuna_dCompiler_dFrontend_dLexer_dTok_TInt (dtb__130)); f_Vuna_dCompiler_dFrontend_dLexer_dPTok_ptokPos = dtb__122 }; Base_dPair.f_Base_dPair_dPair_second = dtb__131 }))
  | _ -> failwith "DT: impossible branch"
)
  | Vuna_dCompiler_dBase_dDiag.C_Vuna_dCompiler_dBase_dDiag_dCheck_ErrC (dtb__132) -> (Vuna_dCompiler_dBase_dDiag.C_Vuna_dCompiler_dBase_dDiag_dCheck_ErrC (dtb__132))
  | _ -> failwith "DT: impossible branch"
)) ((v_Vuna_dCompiler_dFrontend_dLexer_dcollectInt { f_Vuna_dCompiler_dFrontend_dLexer_dChars_charsRemaining = dtb__124; f_Vuna_dCompiler_dFrontend_dLexer_dChars_charsPos = ((v_Vuna_dCompiler_dFrontend_dLexer_dadvanceChar dtb__123) dtb__122) }) (dtb__123 - 48)))) else (if (dtb__123 = 34) then ((((v_Vuna_dCompiler_dFrontend_dLexer_dlexStringToken (fuel - 1)) dtb__123) dtb__124) dtb__122) else (if (if (if (if (if (if (if (dtb__123 = 40) then true else (dtb__123 = 41)) then true else (dtb__123 = 91)) then true else (dtb__123 = 93)) then true else (dtb__123 = 44)) then true else (dtb__123 = 123)) then true else (dtb__123 = 125)) then (Vuna_dCompiler_dBase_dDiag.C_Vuna_dCompiler_dBase_dDiag_dCheck_OkC ({ Base_dPair.f_Base_dPair_dPair_first = { f_Vuna_dCompiler_dFrontend_dLexer_dPTok_ptokTok = (C_Vuna_dCompiler_dFrontend_dLexer_dTok_TSym ((Base_dList.dtp_pack (Base_dList.C_Base_dList_dList_Cons (dtb__123, Base_dList.C_Base_dList_dList_Nil))))); f_Vuna_dCompiler_dFrontend_dLexer_dPTok_ptokPos = dtb__122 }; Base_dPair.f_Base_dPair_dPair_second = { f_Vuna_dCompiler_dFrontend_dLexer_dChars_charsRemaining = dtb__124; f_Vuna_dCompiler_dFrontend_dLexer_dChars_charsPos = ((v_Vuna_dCompiler_dFrontend_dLexer_dadvanceChar dtb__123) dtb__122) } })) else (if (dtb__123 = 96) then (Vuna_dCompiler_dBase_dDiag.C_Vuna_dCompiler_dBase_dDiag_dCheck_OkC ({ Base_dPair.f_Base_dPair_dPair_first = { f_Vuna_dCompiler_dFrontend_dLexer_dPTok_ptokTok = (C_Vuna_dCompiler_dFrontend_dLexer_dTok_TSym ("`")); f_Vuna_dCompiler_dFrontend_dLexer_dPTok_ptokPos = dtb__122 }; Base_dPair.f_Base_dPair_dPair_second = { f_Vuna_dCompiler_dFrontend_dLexer_dChars_charsRemaining = dtb__124; f_Vuna_dCompiler_dFrontend_dLexer_dChars_charsPos = ((v_Vuna_dCompiler_dFrontend_dLexer_dadvanceChar dtb__123) dtb__122) } })) else (if (v_Vuna_dCompiler_dFrontend_dLexer_disOpChar dtb__123) then (match ((v_Vuna_dCompiler_dFrontend_dLexer_dcollectOp { f_Vuna_dCompiler_dFrontend_dLexer_dChars_charsRemaining = dtb__124; f_Vuna_dCompiler_dFrontend_dLexer_dChars_charsPos = ((v_Vuna_dCompiler_dFrontend_dLexer_dadvanceChar dtb__123) dtb__122) }) (Base_dList.C_Base_dList_dList_Cons (dtb__123, Base_dList.C_Base_dList_dList_Nil))) with
  | { Base_dPair.f_Base_dPair_dPair_first = dtb__133; Base_dPair.f_Base_dPair_dPair_second = dtb__134 } -> (Vuna_dCompiler_dBase_dDiag.C_Vuna_dCompiler_dBase_dDiag_dCheck_OkC ({ Base_dPair.f_Base_dPair_dPair_first = { f_Vuna_dCompiler_dFrontend_dLexer_dPTok_ptokTok = (C_Vuna_dCompiler_dFrontend_dLexer_dTok_TSym (dtb__133)); f_Vuna_dCompiler_dFrontend_dLexer_dPTok_ptokPos = dtb__122 }; Base_dPair.f_Base_dPair_dPair_second = dtb__134 }))
  | _ -> failwith "DT: impossible branch"
) else ((Vuna_dCompiler_dBase_dDiagnostics_dFrontend.v_Vuna_dCompiler_dBase_dDiagnostics_dFrontend_dlexErr0At (v_Vuna_dCompiler_dFrontend_dLexer_dlexSpanAt dtb__122)) Vuna_dCompiler_dBase_dDiagnostics_dFrontend.C_Vuna_dCompiler_dBase_dDiagnostics_dFrontend_dLexDiag_UnexpectedCharacter))))))))
  | Base_dList.C_Base_dList_dList_Nil -> (Vuna_dCompiler_dBase_dDiag.v_Vuna_dCompiler_dBase_dDiag_dicInternal "lexOneToken on empty input")
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
)) cs)))
# 448 "Vuna/Compiler/Frontend/Lexer.vuna"
and v_Vuna_dCompiler_dFrontend_dLexer_dlexStringToken = (fun fuel c rest p -> (if (fuel <= 0) then (Vuna_dCompiler_dBase_dDiag.v_Vuna_dCompiler_dBase_dDiag_dicFuel "lexer") else (match rest with
  | Base_dList.C_Base_dList_dList_Cons (dtb__135, dtb__136) -> (match dtb__136 with
  | Base_dList.C_Base_dList_dList_Cons (dtb__137, dtb__138) -> (if (if (dtb__135 = 34) then (dtb__137 = 34) else false) then ((fun bodyStart -> ((fun nd_uscrut11 -> (match nd_uscrut11 with
  | Vuna_dCompiler_dBase_dDiag.C_Vuna_dCompiler_dBase_dDiag_dCheck_OkC (dtb__139) -> (match dtb__139 with
  | { Base_dPair.f_Base_dPair_dPair_first = dtb__140; Base_dPair.f_Base_dPair_dPair_second = dtb__141 } -> (match dtb__141 with
  | { Base_dPair.f_Base_dPair_dPair_first = dtb__142; Base_dPair.f_Base_dPair_dPair_second = dtb__143 } -> (Vuna_dCompiler_dBase_dDiag.C_Vuna_dCompiler_dBase_dDiag_dCheck_OkC ({ Base_dPair.f_Base_dPair_dPair_first = { f_Vuna_dCompiler_dFrontend_dLexer_dPTok_ptokTok = (C_Vuna_dCompiler_dFrontend_dLexer_dTok_TTmpl (true, dtb__140, dtb__143)); f_Vuna_dCompiler_dFrontend_dLexer_dPTok_ptokPos = p }; Base_dPair.f_Base_dPair_dPair_second = dtb__142 }))
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
)
  | Vuna_dCompiler_dBase_dDiag.C_Vuna_dCompiler_dBase_dDiag_dCheck_ErrC (dtb__144) -> (Vuna_dCompiler_dBase_dDiag.C_Vuna_dCompiler_dBase_dDiag_dCheck_ErrC (dtb__144))
  | _ -> failwith "DT: impossible branch"
)) (((((v_Vuna_dCompiler_dFrontend_dLexer_dscanTemplateText (fuel - 1)) true) (v_Vuna_dCompiler_dFrontend_dLexer_ddropOpeningNewline { f_Vuna_dCompiler_dFrontend_dLexer_dChars_charsRemaining = dtb__138; f_Vuna_dCompiler_dFrontend_dLexer_dChars_charsPos = bodyStart })) Base_dList.C_Base_dList_dList_Nil) Base_dList.C_Base_dList_dList_Nil))) ((v_Vuna_dCompiler_dFrontend_dLexer_dadvanceChar dtb__137) ((v_Vuna_dCompiler_dFrontend_dLexer_dadvanceChar dtb__135) ((v_Vuna_dCompiler_dFrontend_dLexer_dadvanceChar c) p)))) else (((v_Vuna_dCompiler_dFrontend_dLexer_dlexSingleStringToken (fuel - 1)) { f_Vuna_dCompiler_dFrontend_dLexer_dChars_charsRemaining = rest; f_Vuna_dCompiler_dFrontend_dLexer_dChars_charsPos = ((v_Vuna_dCompiler_dFrontend_dLexer_dadvanceChar c) p) }) p))
  | Base_dList.C_Base_dList_dList_Nil -> (((v_Vuna_dCompiler_dFrontend_dLexer_dlexSingleStringToken (fuel - 1)) { f_Vuna_dCompiler_dFrontend_dLexer_dChars_charsRemaining = rest; f_Vuna_dCompiler_dFrontend_dLexer_dChars_charsPos = ((v_Vuna_dCompiler_dFrontend_dLexer_dadvanceChar c) p) }) p)
  | _ -> failwith "DT: impossible branch"
)
  | Base_dList.C_Base_dList_dList_Nil -> (((v_Vuna_dCompiler_dFrontend_dLexer_dlexSingleStringToken (fuel - 1)) { f_Vuna_dCompiler_dFrontend_dLexer_dChars_charsRemaining = rest; f_Vuna_dCompiler_dFrontend_dLexer_dChars_charsPos = ((v_Vuna_dCompiler_dFrontend_dLexer_dadvanceChar c) p) }) p)
  | _ -> failwith "DT: impossible branch"
)))
# 462 "Vuna/Compiler/Frontend/Lexer.vuna"
and v_Vuna_dCompiler_dFrontend_dLexer_dlexSingleStringToken = (fun fuel body p -> (if (fuel <= 0) then (Vuna_dCompiler_dBase_dDiag.v_Vuna_dCompiler_dBase_dDiag_dicFuel "lexer") else ((fun nd_uscrut3 -> (match nd_uscrut3 with
  | Vuna_dCompiler_dBase_dDiag.C_Vuna_dCompiler_dBase_dDiag_dCheck_OkC (dtb__145) -> (match dtb__145 with
  | { Base_dPair.f_Base_dPair_dPair_first = dtb__146; Base_dPair.f_Base_dPair_dPair_second = dtb__147 } -> (match dtb__147 with
  | { Base_dPair.f_Base_dPair_dPair_first = dtb__148; Base_dPair.f_Base_dPair_dPair_second = dtb__149 } -> ((fun nd_uscrut14 -> (match nd_uscrut14 with
  | Base_dList.C_Base_dList_dList_Cons (dtb__150, dtb__151) -> (match dtb__150 with
  | C_Vuna_dCompiler_dFrontend_dLexer_dTmplPart_TPText (dtb__152) -> (match dtb__151 with
  | Base_dList.C_Base_dList_dList_Nil -> (Vuna_dCompiler_dBase_dDiag.C_Vuna_dCompiler_dBase_dDiag_dCheck_OkC ({ Base_dPair.f_Base_dPair_dPair_first = { f_Vuna_dCompiler_dFrontend_dLexer_dPTok_ptokTok = (C_Vuna_dCompiler_dFrontend_dLexer_dTok_TStr (dtb__152)); f_Vuna_dCompiler_dFrontend_dLexer_dPTok_ptokPos = p }; Base_dPair.f_Base_dPair_dPair_second = dtb__148 }))
  | _ -> (Vuna_dCompiler_dBase_dDiag.C_Vuna_dCompiler_dBase_dDiag_dCheck_OkC ({ Base_dPair.f_Base_dPair_dPair_first = { f_Vuna_dCompiler_dFrontend_dLexer_dPTok_ptokTok = (C_Vuna_dCompiler_dFrontend_dLexer_dTok_TTmpl (false, dtb__146, dtb__149)); f_Vuna_dCompiler_dFrontend_dLexer_dPTok_ptokPos = p }; Base_dPair.f_Base_dPair_dPair_second = dtb__148 }))
)
  | _ -> (Vuna_dCompiler_dBase_dDiag.C_Vuna_dCompiler_dBase_dDiag_dCheck_OkC ({ Base_dPair.f_Base_dPair_dPair_first = { f_Vuna_dCompiler_dFrontend_dLexer_dPTok_ptokTok = (C_Vuna_dCompiler_dFrontend_dLexer_dTok_TTmpl (false, dtb__146, dtb__149)); f_Vuna_dCompiler_dFrontend_dLexer_dPTok_ptokPos = p }; Base_dPair.f_Base_dPair_dPair_second = dtb__148 }))
)
  | _ -> (Vuna_dCompiler_dBase_dDiag.C_Vuna_dCompiler_dBase_dDiag_dCheck_OkC ({ Base_dPair.f_Base_dPair_dPair_first = { f_Vuna_dCompiler_dFrontend_dLexer_dPTok_ptokTok = (C_Vuna_dCompiler_dFrontend_dLexer_dTok_TTmpl (false, dtb__146, dtb__149)); f_Vuna_dCompiler_dFrontend_dLexer_dPTok_ptokPos = p }; Base_dPair.f_Base_dPair_dPair_second = dtb__148 }))
)) dtb__146)
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
)
  | Vuna_dCompiler_dBase_dDiag.C_Vuna_dCompiler_dBase_dDiag_dCheck_ErrC (dtb__153) -> (Vuna_dCompiler_dBase_dDiag.C_Vuna_dCompiler_dBase_dDiag_dCheck_ErrC (dtb__153))
  | _ -> failwith "DT: impossible branch"
)) (((((v_Vuna_dCompiler_dFrontend_dLexer_dscanTemplateText (fuel - 1)) false) body) Base_dList.C_Base_dList_dList_Nil) Base_dList.C_Base_dList_dList_Nil))))

# 476 "Vuna/Compiler/Frontend/Lexer.vuna"
let rec v_Vuna_dCompiler_dFrontend_dLexer_dlexCharsWith = (fun fuel acc cs -> (if (fuel <= 0) then (Vuna_dCompiler_dBase_dDiag.v_Vuna_dCompiler_dBase_dDiag_dicFuel "lexer") else ((fun nd_uscrut3 -> (match nd_uscrut3 with
  | Vuna_dCompiler_dBase_dDiag.C_Vuna_dCompiler_dBase_dDiag_dCheck_OkC (dtb__154) -> (match dtb__154 with
  | { Base_dPair.f_Base_dPair_dPair_first = dtb__155; Base_dPair.f_Base_dPair_dPair_second = dtb__156 } -> ((fun nd_uscrut10 -> (match nd_uscrut10 with
  | { f_Vuna_dCompiler_dFrontend_dLexer_dChars_charsRemaining = dtb__157; f_Vuna_dCompiler_dFrontend_dLexer_dChars_charsPos = dtb__158 } -> (match dtb__157 with
  | Base_dList.C_Base_dList_dList_Nil -> (Vuna_dCompiler_dBase_dDiag.C_Vuna_dCompiler_dBase_dDiag_dCheck_OkC ({ Base_dPair.f_Base_dPair_dPair_first = (Base_dList.C_Base_dList_dList_Cons ({ f_Vuna_dCompiler_dFrontend_dLexer_dPTok_ptokTok = C_Vuna_dCompiler_dFrontend_dLexer_dTok_TEof; f_Vuna_dCompiler_dFrontend_dLexer_dPTok_ptokPos = dtb__158 }, Base_dList.C_Base_dList_dList_Nil)); Base_dPair.f_Base_dPair_dPair_second = (Base_dList.v_Base_dList_dreverse ((Base_dList.v_Base_dList_dappend (Base_dList.v_Base_dList_dreverse dtb__156)) acc)) }))
  | _ -> ((fun nd_uscrut13 -> (match nd_uscrut13 with
  | Vuna_dCompiler_dBase_dDiag.C_Vuna_dCompiler_dBase_dDiag_dCheck_OkC (dtb__159) -> (match dtb__159 with
  | { Base_dPair.f_Base_dPair_dPair_first = dtb__160; Base_dPair.f_Base_dPair_dPair_second = dtb__161 } -> ((fun nd_uscrut20 -> (match nd_uscrut20 with
  | Vuna_dCompiler_dBase_dDiag.C_Vuna_dCompiler_dBase_dDiag_dCheck_OkC (dtb__162) -> (match dtb__162 with
  | { Base_dPair.f_Base_dPair_dPair_first = dtb__163; Base_dPair.f_Base_dPair_dPair_second = dtb__164 } -> (Vuna_dCompiler_dBase_dDiag.C_Vuna_dCompiler_dBase_dDiag_dCheck_OkC ({ Base_dPair.f_Base_dPair_dPair_first = (Base_dList.C_Base_dList_dList_Cons (dtb__160, dtb__163)); Base_dPair.f_Base_dPair_dPair_second = dtb__164 }))
  | _ -> failwith "DT: impossible branch"
)
  | Vuna_dCompiler_dBase_dDiag.C_Vuna_dCompiler_dBase_dDiag_dCheck_ErrC (dtb__165) -> (Vuna_dCompiler_dBase_dDiag.C_Vuna_dCompiler_dBase_dDiag_dCheck_ErrC (dtb__165))
  | _ -> failwith "DT: impossible branch"
)) (((v_Vuna_dCompiler_dFrontend_dLexer_dlexCharsWith (fuel - 1)) ((Base_dList.v_Base_dList_dappend (Base_dList.v_Base_dList_dreverse dtb__156)) acc)) dtb__161))
  | _ -> failwith "DT: impossible branch"
)
  | Vuna_dCompiler_dBase_dDiag.C_Vuna_dCompiler_dBase_dDiag_dCheck_ErrC (dtb__166) -> (Vuna_dCompiler_dBase_dDiag.C_Vuna_dCompiler_dBase_dDiag_dCheck_ErrC (dtb__166))
  | _ -> failwith "DT: impossible branch"
)) ((v_Vuna_dCompiler_dFrontend_dLexer_dlexOneToken fuel) dtb__155))
)
  | _ -> failwith "DT: impossible branch"
)) dtb__155)
  | _ -> failwith "DT: impossible branch"
)
  | Vuna_dCompiler_dBase_dDiag.C_Vuna_dCompiler_dBase_dDiag_dCheck_ErrC (dtb__167) -> (Vuna_dCompiler_dBase_dDiag.C_Vuna_dCompiler_dBase_dDiag_dCheck_ErrC (dtb__167))
  | _ -> failwith "DT: impossible branch"
)) ((v_Vuna_dCompiler_dFrontend_dLexer_dskipTriviaComments fuel) cs))))

# 490 "Vuna/Compiler/Frontend/Lexer.vuna"
let rec v_Vuna_dCompiler_dFrontend_dLexer_dlexChars = (fun fuel cs -> (if (fuel <= 0) then (Vuna_dCompiler_dBase_dDiag.v_Vuna_dCompiler_dBase_dDiag_dicFuel "lexer") else (match ((v_Vuna_dCompiler_dFrontend_dLexer_dskipTrivia fuel) cs) with
  | Vuna_dCompiler_dBase_dDiag.C_Vuna_dCompiler_dBase_dDiag_dCheck_ErrC (dtb__168) -> (Vuna_dCompiler_dBase_dDiag.C_Vuna_dCompiler_dBase_dDiag_dCheck_ErrC (dtb__168))
  | Vuna_dCompiler_dBase_dDiag.C_Vuna_dCompiler_dBase_dDiag_dCheck_OkC (dtb__169) -> ((fun nd_uscrut4 -> (match nd_uscrut4 with
  | { f_Vuna_dCompiler_dFrontend_dLexer_dChars_charsRemaining = dtb__170; f_Vuna_dCompiler_dFrontend_dLexer_dChars_charsPos = dtb__171 } -> (match dtb__170 with
  | Base_dList.C_Base_dList_dList_Nil -> (Vuna_dCompiler_dBase_dDiag.C_Vuna_dCompiler_dBase_dDiag_dCheck_OkC ((Base_dList.C_Base_dList_dList_Cons ({ f_Vuna_dCompiler_dFrontend_dLexer_dPTok_ptokTok = C_Vuna_dCompiler_dFrontend_dLexer_dTok_TEof; f_Vuna_dCompiler_dFrontend_dLexer_dPTok_ptokPos = dtb__171 }, Base_dList.C_Base_dList_dList_Nil))))
  | _ -> ((fun nd_uscrut7 -> (match nd_uscrut7 with
  | Vuna_dCompiler_dBase_dDiag.C_Vuna_dCompiler_dBase_dDiag_dCheck_OkC (dtb__172) -> (match dtb__172 with
  | { Base_dPair.f_Base_dPair_dPair_first = dtb__173; Base_dPair.f_Base_dPair_dPair_second = dtb__174 } -> (match ((v_Vuna_dCompiler_dFrontend_dLexer_dlexChars (fuel - 1)) dtb__174) with
  | Vuna_dCompiler_dBase_dDiag.C_Vuna_dCompiler_dBase_dDiag_dCheck_ErrC (dtb__175) -> (Vuna_dCompiler_dBase_dDiag.C_Vuna_dCompiler_dBase_dDiag_dCheck_ErrC (dtb__175))
  | Vuna_dCompiler_dBase_dDiag.C_Vuna_dCompiler_dBase_dDiag_dCheck_OkC (dtb__176) -> (Vuna_dCompiler_dBase_dDiag.C_Vuna_dCompiler_dBase_dDiag_dCheck_OkC ((Base_dList.C_Base_dList_dList_Cons (dtb__173, dtb__176))))
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
)
  | Vuna_dCompiler_dBase_dDiag.C_Vuna_dCompiler_dBase_dDiag_dCheck_ErrC (dtb__177) -> (Vuna_dCompiler_dBase_dDiag.C_Vuna_dCompiler_dBase_dDiag_dCheck_ErrC (dtb__177))
  | _ -> failwith "DT: impossible branch"
)) ((v_Vuna_dCompiler_dFrontend_dLexer_dlexOneToken fuel) dtb__169))
)
  | _ -> failwith "DT: impossible branch"
)) dtb__169)
  | _ -> failwith "DT: impossible branch"
)))

# 522 "Vuna/Compiler/Frontend/Lexer.vuna"
let v_Vuna_dCompiler_dFrontend_dLexer_dsourceFuel = (fun source -> ((4 * (bi_strLength source)) + 64))

# 504 "Vuna/Compiler/Frontend/Lexer.vuna"
let v_Vuna_dCompiler_dFrontend_dLexer_dlexSourceWithComments = (fun source -> (((v_Vuna_dCompiler_dFrontend_dLexer_dlexCharsWith (v_Vuna_dCompiler_dFrontend_dLexer_dsourceFuel source)) Base_dList.C_Base_dList_dList_Nil) { f_Vuna_dCompiler_dFrontend_dLexer_dChars_charsRemaining = (Base_dList.dtp_unpack source); f_Vuna_dCompiler_dFrontend_dLexer_dChars_charsPos = { Vuna_dCompiler_dBase_dSource.f_Vuna_dCompiler_dBase_dSource_dPos_posLine = 1; Vuna_dCompiler_dBase_dSource.f_Vuna_dCompiler_dBase_dSource_dPos_posCol = 1 } }))

# 508 "Vuna/Compiler/Frontend/Lexer.vuna"
let v_Vuna_dCompiler_dFrontend_dLexer_dlexSource = (fun source -> ((v_Vuna_dCompiler_dFrontend_dLexer_dlexChars (v_Vuna_dCompiler_dFrontend_dLexer_dsourceFuel source)) { f_Vuna_dCompiler_dFrontend_dLexer_dChars_charsRemaining = (Base_dList.dtp_unpack source); f_Vuna_dCompiler_dFrontend_dLexer_dChars_charsPos = { Vuna_dCompiler_dBase_dSource.f_Vuna_dCompiler_dBase_dSource_dPos_posLine = 1; Vuna_dCompiler_dBase_dSource.f_Vuna_dCompiler_dBase_dSource_dPos_posCol = 1 } }))

# 511 "Vuna/Compiler/Frontend/Lexer.vuna"
let v_Vuna_dCompiler_dFrontend_dLexer_dlexComments = (fun source -> ((fun nd_uscrut1 -> (match nd_uscrut1 with
  | Vuna_dCompiler_dBase_dDiag.C_Vuna_dCompiler_dBase_dDiag_dCheck_OkC (dtb__178) -> (match dtb__178 with
  | { Base_dPair.f_Base_dPair_dPair_first = dtb__179; Base_dPair.f_Base_dPair_dPair_second = dtb__180 } -> (Vuna_dCompiler_dBase_dDiag.C_Vuna_dCompiler_dBase_dDiag_dCheck_OkC (dtb__180))
  | _ -> failwith "DT: impossible branch"
)
  | Vuna_dCompiler_dBase_dDiag.C_Vuna_dCompiler_dBase_dDiag_dCheck_ErrC (dtb__181) -> (Vuna_dCompiler_dBase_dDiag.C_Vuna_dCompiler_dBase_dDiag_dCheck_ErrC (dtb__181))
  | _ -> failwith "DT: impossible branch"
)) (v_Vuna_dCompiler_dFrontend_dLexer_dlexSourceWithComments source)))
