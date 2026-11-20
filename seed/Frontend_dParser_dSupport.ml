open Vuna_runtime
type t_ParseMode = C_ParseMode_PmStrict | C_ParseMode_PmTool
and t_PState = { f_PState_fileOf : string; f_PState_toksOf : Frontend_dLexer.t_PTok B_dData_dList.t_List; f_PState_lastPos : Base_dSource.t_Pos; f_PState_toksLeft : int; f_PState_pmodeOf : t_ParseMode }

# 32 "Vuna/Compiler/Frontend/Parser/Support.vuna"
let v_fileOf = (fun (mc0 : t_PState) -> (match mc0 with
  | { f_PState_fileOf = dtb__0; f_PState_toksOf = dtb__1; f_PState_lastPos = dtb__2; f_PState_toksLeft = dtb__3; f_PState_pmodeOf = dtb__4 } -> dtb__0
  | _ -> failwith "DT: impossible branch"
))

# 36 "Vuna/Compiler/Frontend/Parser/Support.vuna"
let v_pmodeOf = (fun (mc0 : t_PState) -> (match mc0 with
  | { f_PState_fileOf = dtb__5; f_PState_toksOf = dtb__6; f_PState_lastPos = dtb__7; f_PState_toksLeft = dtb__8; f_PState_pmodeOf = dtb__9 } -> dtb__9
  | _ -> failwith "DT: impossible branch"
))

# 40 "Vuna/Compiler/Frontend/Parser/Support.vuna"
let v_mkState = (fun (file : string) (toks : Frontend_dLexer.t_PTok B_dData_dList.t_List) (mode : t_ParseMode) -> { f_PState_fileOf = file; f_PState_toksOf = toks; f_PState_lastPos = { Base_dSource.f_Pos_posLine = 1; Base_dSource.f_Pos_posCol = 0; Base_dSource.f_Pos_posOffset = 0; Base_dSource.f_Pos_posEndOffset = 0 }; f_PState_toksLeft = (B_dData_dList.v_length toks); f_PState_pmodeOf = mode })

# 44 "Vuna/Compiler/Frontend/Parser/Support.vuna"
let v_mkStateAt = (fun (file : string) (toks : Frontend_dLexer.t_PTok B_dData_dList.t_List) (last : Base_dSource.t_Pos) (count : int) (mode : t_ParseMode) -> { f_PState_fileOf = file; f_PState_toksOf = toks; f_PState_lastPos = last; f_PState_toksLeft = count; f_PState_pmodeOf = mode })

# 75 "Vuna/Compiler/Frontend/Parser/Support.vuna"
let v_peekTok = (fun (mc0 : t_PState) -> (match mc0 with
  | { f_PState_fileOf = dtb__10; f_PState_toksOf = dtb__11; f_PState_lastPos = dtb__12; f_PState_toksLeft = dtb__13; f_PState_pmodeOf = dtb__14 } -> (match dtb__11 with
  | B_dData_dList.C_List_Nil -> { Frontend_dLexer.f_PTok_ptokTok = Frontend_dLexer.C_Tok_TEof; Frontend_dLexer.f_PTok_ptokPos = { Base_dSource.f_Pos_posLine = 1; Base_dSource.f_Pos_posCol = 1; Base_dSource.f_Pos_posOffset = 0; Base_dSource.f_Pos_posEndOffset = 0 } }
  | B_dData_dList.C_List__x58__x58_ (dtb__15, dtb__16) -> dtb__15
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
))

# 79 "Vuna/Compiler/Frontend/Parser/Support.vuna"
let v_peekPos = (fun (st : t_PState) -> ((v_peekTok st)).Frontend_dLexer.f_PTok_ptokPos)

# 61 "Vuna/Compiler/Frontend/Parser/Support.vuna"
let v_tokenSpan = (fun (st : t_PState) -> (let p = (v_peekPos st) in (let len = ((Base_dSource.v_posEndOffset p) - (Base_dSource.v_posOffset p)) in { Base_dSource.f_Span_spanFile = (v_fileOf st); Base_dSource.f_Span_spanStartLine = (Base_dSource.v_posLine p); Base_dSource.f_Span_spanStartCol = (Base_dSource.v_posCol p); Base_dSource.f_Span_spanEndLine = (Base_dSource.v_posLine p); Base_dSource.f_Span_spanEndCol = ((Base_dSource.v_posCol p) + len); Base_dSource.f_Span_spanStartOffset = (Base_dSource.v_posOffset p); Base_dSource.f_Span_spanEndOffset = (Base_dSource.v_posEndOffset p) })))

# 94 "Vuna/Compiler/Frontend/Parser/Support.vuna"
let v_lastPos = (fun (mc0 : t_PState) -> (match mc0 with
  | { f_PState_fileOf = dtb__17; f_PState_toksOf = dtb__18; f_PState_lastPos = dtb__19; f_PState_toksLeft = dtb__20; f_PState_pmodeOf = dtb__21 } -> dtb__19
  | _ -> failwith "DT: impossible branch"
))

# 48 "Vuna/Compiler/Frontend/Parser/Support.vuna"
let v_spanOf = (fun (st : t_PState) (st2 : t_PState) -> { Base_dSource.f_Span_spanFile = (v_fileOf st); Base_dSource.f_Span_spanStartLine = (Base_dSource.v_posLine (v_peekPos st)); Base_dSource.f_Span_spanStartCol = (Base_dSource.v_posCol (v_peekPos st)); Base_dSource.f_Span_spanEndLine = (Base_dSource.v_posLine (v_lastPos st2)); Base_dSource.f_Span_spanEndCol = (Base_dSource.v_posCol (v_lastPos st2)); Base_dSource.f_Span_spanStartOffset = (Base_dSource.v_posOffset (v_peekPos st)); Base_dSource.f_Span_spanEndOffset = (Base_dSource.v_posOffset (v_lastPos st2)) })

# 84 "Vuna/Compiler/Frontend/Parser/Support.vuna"
let v_tokSpan = (fun (st : t_PState) -> (let nd_uscrut1 = (v_peekTok st) in (match nd_uscrut1 with
  | { Frontend_dLexer.f_PTok_ptokTok = dtb__22; Frontend_dLexer.f_PTok_ptokPos = dtb__23 } -> (match dtb__22 with
  | Frontend_dLexer.C_Tok_TEof -> (let p = (v_lastPos st) in { Base_dSource.f_Span_spanFile = (v_fileOf st); Base_dSource.f_Span_spanStartLine = (Base_dSource.v_posLine p); Base_dSource.f_Span_spanStartCol = (Base_dSource.v_posCol p); Base_dSource.f_Span_spanEndLine = (Base_dSource.v_posLine p); Base_dSource.f_Span_spanEndCol = (Base_dSource.v_posCol p); Base_dSource.f_Span_spanStartOffset = (Base_dSource.v_posOffset p); Base_dSource.f_Span_spanEndOffset = (Base_dSource.v_posOffset p) })
  | _ -> { Base_dSource.f_Span_spanFile = (v_fileOf st); Base_dSource.f_Span_spanStartLine = (Base_dSource.v_posLine dtb__23); Base_dSource.f_Span_spanStartCol = (Base_dSource.v_posCol dtb__23); Base_dSource.f_Span_spanEndLine = (Base_dSource.v_posLine dtb__23); Base_dSource.f_Span_spanEndCol = (Base_dSource.v_posCol dtb__23); Base_dSource.f_Span_spanStartOffset = (Base_dSource.v_posOffset dtb__23); Base_dSource.f_Span_spanEndOffset = (Base_dSource.v_posOffset dtb__23) }
)
  | _ -> failwith "DT: impossible branch"
)))

# 97 "Vuna/Compiler/Frontend/Parser/Support.vuna"
let v_advance = (fun (mc0 : t_PState) -> (match mc0 with
  | { f_PState_fileOf = dtb__24; f_PState_toksOf = dtb__25; f_PState_lastPos = dtb__26; f_PState_toksLeft = dtb__27; f_PState_pmodeOf = dtb__28 } -> (match dtb__25 with
  | B_dData_dList.C_List_Nil -> { f_PState_fileOf = dtb__24; f_PState_toksOf = dtb__25; f_PState_lastPos = dtb__26; f_PState_toksLeft = dtb__27; f_PState_pmodeOf = dtb__28 }
  | B_dData_dList.C_List__x58__x58_ (dtb__29, dtb__30) -> (let nd_uscrut9 = dtb__29 in (match nd_uscrut9 with
  | { Frontend_dLexer.f_PTok_ptokTok = dtb__31; Frontend_dLexer.f_PTok_ptokPos = dtb__32 } -> (match dtb__31 with
  | Frontend_dLexer.C_Tok_TEof -> { f_PState_fileOf = dtb__24; f_PState_toksOf = dtb__25; f_PState_lastPos = dtb__26; f_PState_toksLeft = dtb__27; f_PState_pmodeOf = dtb__28 }
  | _ -> { f_PState_fileOf = dtb__24; f_PState_toksOf = dtb__30; f_PState_lastPos = (dtb__29).Frontend_dLexer.f_PTok_ptokPos; f_PState_toksLeft = (if (dtb__27 > 0) then (dtb__27 - 1) else 0); f_PState_pmodeOf = dtb__28 }
)
  | _ -> failwith "DT: impossible branch"
))
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
))

# 104 "Vuna/Compiler/Frontend/Parser/Support.vuna"
let v_isEof = (fun (st : t_PState) -> (let nd_uscrut1 = (v_peekTok st) in (match nd_uscrut1 with
  | { Frontend_dLexer.f_PTok_ptokTok = dtb__33; Frontend_dLexer.f_PTok_ptokPos = dtb__34 } -> (match dtb__33 with
  | Frontend_dLexer.C_Tok_TEof -> true
  | _ -> false
)
  | _ -> failwith "DT: impossible branch"
)))

# 133 "Vuna/Compiler/Frontend/Parser/Support.vuna"
let v_stateFuel = (fun (st : t_PState) -> ((128 * (st).f_PState_toksLeft) + 1024))

# 136 "Vuna/Compiler/Frontend/Parser/Support.vuna"
let v_sameLineState = (fun (st : t_PState) -> (match (v_peekPos st) with
  | { Base_dSource.f_Pos_posLine = dtb__35; Base_dSource.f_Pos_posCol = dtb__36; Base_dSource.f_Pos_posOffset = dtb__37; Base_dSource.f_Pos_posEndOffset = dtb__38 } -> { f_PState_fileOf = (v_fileOf st); f_PState_toksOf = (st).f_PState_toksOf; f_PState_lastPos = { Base_dSource.f_Pos_posLine = dtb__35; Base_dSource.f_Pos_posCol = 0; Base_dSource.f_Pos_posOffset = 0; Base_dSource.f_Pos_posEndOffset = 0 }; f_PState_toksLeft = (st).f_PState_toksLeft; f_PState_pmodeOf = (v_pmodeOf st) }
  | _ -> failwith "DT: impossible branch"
))

# 141 "Vuna/Compiler/Frontend/Parser/Support.vuna"
let v_atSym = (fun (st : t_PState) (s : string) -> (let nd_uscrut2 = (v_peekTok st) in (match nd_uscrut2 with
  | { Frontend_dLexer.f_PTok_ptokTok = dtb__39; Frontend_dLexer.f_PTok_ptokPos = dtb__40 } -> (match dtb__39 with
  | Frontend_dLexer.C_Tok_TSym (dtb__41) -> (dtb__41 = s)
  | _ -> false
)
  | _ -> failwith "DT: impossible branch"
)))

# 148 "Vuna/Compiler/Frontend/Parser/Support.vuna"
let rec v_nthTok = (fun (mc0 : Frontend_dLexer.t_PTok B_dData_dList.t_List) (mc1 : int) -> (match mc0 with
  | B_dData_dList.C_List__x58__x58_ (dtb__42, dtb__43) -> (if (mc1 <= 0) then (B_dData_dMaybe.C_Maybe_Just (dtb__42)) else ((v_nthTok dtb__43) (mc1 - 1)))
  | B_dData_dList.C_List_Nil -> B_dData_dMaybe.C_Maybe_Nothing
  | _ -> failwith "DT: impossible branch"
))

# 152 "Vuna/Compiler/Frontend/Parser/Support.vuna"
let v_peekTokAt = (fun (st : t_PState) (n : int) -> ((v_nthTok (st).f_PState_toksOf) n))

# 170 "Vuna/Compiler/Frontend/Parser/Support.vuna"
let v_tokTail = (fun (mc0 : Frontend_dLexer.t_PTok B_dData_dList.t_List) -> (match mc0 with
  | B_dData_dList.C_List__x58__x58_ (dtb__44, dtb__45) -> dtb__45
  | B_dData_dList.C_List_Nil -> B_dData_dList.C_List_Nil
  | _ -> failwith "DT: impossible branch"
))

# 175 "Vuna/Compiler/Frontend/Parser/Support.vuna"
let rec v_binderNameTail = (fun (mc0 : Frontend_dLexer.t_PTok B_dData_dList.t_List) (mc1 : string B_dData_dList.t_List) -> (match mc0 with
  | B_dData_dList.C_List__x58__x58_ (dtb__46, dtb__47) -> (let nd_uscrut5 = dtb__46 in (match nd_uscrut5 with
  | { Frontend_dLexer.f_PTok_ptokTok = dtb__48; Frontend_dLexer.f_PTok_ptokPos = dtb__49 } -> (match dtb__48 with
  | Frontend_dLexer.C_Tok_TSym (dtb__50) -> (if (dtb__50 = ":") then (B_dData_dMaybe.C_Maybe_Just ((B_dData_dList.v_reverse mc1))) else B_dData_dMaybe.C_Maybe_Nothing)
  | Frontend_dLexer.C_Tok_TIdent (dtb__51) -> ((v_binderNameTail dtb__47) (B_dData_dList.C_List__x58__x58_ (dtb__51, mc1)))
  | _ -> B_dData_dMaybe.C_Maybe_Nothing
)
  | _ -> failwith "DT: impossible branch"
))
  | B_dData_dList.C_List_Nil -> B_dData_dMaybe.C_Maybe_Nothing
  | _ -> failwith "DT: impossible branch"
))

# 183 "Vuna/Compiler/Frontend/Parser/Support.vuna"
let v_quantifiedHead = (fun (st : t_PState) (q : Frontend_dAst.t_Qty) -> (let nd_uscrut2 = ((v_peekTokAt st) 1) in (match nd_uscrut2 with
  | B_dData_dMaybe.C_Maybe_Just (dtb__52) -> (match dtb__52 with
  | { Frontend_dLexer.f_PTok_ptokTok = dtb__53; Frontend_dLexer.f_PTok_ptokPos = dtb__54 } -> (match dtb__53 with
  | Frontend_dLexer.C_Tok_TIdent (dtb__55) -> (match ((v_binderNameTail (v_tokTail (v_tokTail (st).f_PState_toksOf))) B_dData_dList.C_List_Nil) with
  | B_dData_dMaybe.C_Maybe_Just (dtb__56) -> (B_dData_dMaybe.C_Maybe_Just ({ B_dData_dPair.f_Pair_first = (B_dData_dMaybe.C_Maybe_Just (q)); B_dData_dPair.f_Pair_second = (B_dData_dList.C_List__x58__x58_ (dtb__55, dtb__56)) }))
  | B_dData_dMaybe.C_Maybe_Nothing -> B_dData_dMaybe.C_Maybe_Nothing
  | _ -> failwith "DT: impossible branch"
)
  | _ -> B_dData_dMaybe.C_Maybe_Nothing
)
  | _ -> failwith "DT: impossible branch"
)
  | _ -> B_dData_dMaybe.C_Maybe_Nothing
)))

# 158 "Vuna/Compiler/Frontend/Parser/Support.vuna"
let v_binderHead = (fun (st : t_PState) -> (let nd_uscrut1 = (v_peekTok st) in (match nd_uscrut1 with
  | { Frontend_dLexer.f_PTok_ptokTok = dtb__57; Frontend_dLexer.f_PTok_ptokPos = dtb__58 } -> (match dtb__57 with
  | Frontend_dLexer.C_Tok_TInt (dtb__59) -> (if (dtb__59 = 0) then ((v_quantifiedHead st) Frontend_dAst.C_Qty_Q0) else (if (dtb__59 = 1) then ((v_quantifiedHead st) Frontend_dAst.C_Qty_Q1) else B_dData_dMaybe.C_Maybe_Nothing))
  | Frontend_dLexer.C_Tok_TIdent (dtb__60) -> (match ((v_binderNameTail (v_tokTail (st).f_PState_toksOf)) B_dData_dList.C_List_Nil) with
  | B_dData_dMaybe.C_Maybe_Just (dtb__61) -> (B_dData_dMaybe.C_Maybe_Just ({ B_dData_dPair.f_Pair_first = B_dData_dMaybe.C_Maybe_Nothing; B_dData_dPair.f_Pair_second = (B_dData_dList.C_List__x58__x58_ (dtb__60, dtb__61)) }))
  | B_dData_dMaybe.C_Maybe_Nothing -> B_dData_dMaybe.C_Maybe_Nothing
  | _ -> failwith "DT: impossible branch"
)
  | _ -> B_dData_dMaybe.C_Maybe_Nothing
)
  | _ -> failwith "DT: impossible branch"
)))

# 205 "Vuna/Compiler/Frontend/Parser/Support.vuna"
let v_arrowAt = (fun (mc0 : Frontend_dLexer.t_PTok B_dData_dList.t_List) -> (match mc0 with
  | B_dData_dList.C_List__x58__x58_ (dtb__62, dtb__63) -> (match dtb__62 with
  | { Frontend_dLexer.f_PTok_ptokTok = dtb__64; Frontend_dLexer.f_PTok_ptokPos = dtb__65 } -> (match dtb__64 with
  | Frontend_dLexer.C_Tok_TSym (dtb__66) -> (if (dtb__66 = "->") then true else false)
  | _ -> false
)
  | _ -> failwith "DT: impossible branch"
)
  | _ -> false
))

# 198 "Vuna/Compiler/Frontend/Parser/Support.vuna"
let rec v_piArrowAheadGo = (fun (mc0 : int) (mc1 : Frontend_dLexer.t_PTok B_dData_dList.t_List) -> (match mc1 with
  | B_dData_dList.C_List__x58__x58_ (dtb__67, dtb__68) -> (match dtb__67 with
  | { Frontend_dLexer.f_PTok_ptokTok = dtb__69; Frontend_dLexer.f_PTok_ptokPos = dtb__70 } -> (match dtb__69 with
  | Frontend_dLexer.C_Tok_TSym (dtb__71) -> (if (dtb__71 = "(") then ((v_piArrowAheadGo (mc0 + 1)) dtb__68) else (if (dtb__71 = ")") then (if (mc0 = 1) then (v_arrowAt dtb__68) else ((v_piArrowAheadGo (mc0 - 1)) dtb__68)) else ((v_piArrowAheadGo mc0) dtb__68)))
  | _ -> ((v_piArrowAheadGo mc0) dtb__68)
)
  | _ -> failwith "DT: impossible branch"
)
  | B_dData_dList.C_List_Nil -> false
  | _ -> failwith "DT: impossible branch"
))

# 195 "Vuna/Compiler/Frontend/Parser/Support.vuna"
let v_piArrowAhead = (fun (st : t_PState) -> ((v_piArrowAheadGo 1) (st).f_PState_toksOf))

# 209 "Vuna/Compiler/Frontend/Parser/Support.vuna"
let v_atKw = (fun (st : t_PState) (k : string) -> (let nd_uscrut2 = (v_peekTok st) in (match nd_uscrut2 with
  | { Frontend_dLexer.f_PTok_ptokTok = dtb__72; Frontend_dLexer.f_PTok_ptokPos = dtb__73 } -> (match dtb__72 with
  | Frontend_dLexer.C_Tok_TKw (dtb__74) -> (dtb__74 = k)
  | _ -> false
)
  | _ -> failwith "DT: impossible branch"
)))

# 215 "Vuna/Compiler/Frontend/Parser/Support.vuna"
let v_canContinue = (fun (st : t_PState) (blockCol : int) -> (match (v_peekPos st) with
  | { Base_dSource.f_Pos_posLine = dtb__75; Base_dSource.f_Pos_posCol = dtb__76; Base_dSource.f_Pos_posOffset = dtb__77; Base_dSource.f_Pos_posEndOffset = dtb__78 } -> (match (v_lastPos st) with
  | { Base_dSource.f_Pos_posLine = dtb__79; Base_dSource.f_Pos_posCol = dtb__80; Base_dSource.f_Pos_posOffset = dtb__81; Base_dSource.f_Pos_posEndOffset = dtb__82 } -> (if (dtb__75 = dtb__79) then true else (dtb__76 > blockCol))
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
))

# 224 "Vuna/Compiler/Frontend/Parser/Support.vuna"
let v_expectSym = (fun (st : t_PState) (s : string) -> (let nd_uscrut2 = (v_peekTok st) in (match nd_uscrut2 with
  | { Frontend_dLexer.f_PTok_ptokTok = dtb__83; Frontend_dLexer.f_PTok_ptokPos = dtb__84 } -> (match dtb__83 with
  | Frontend_dLexer.C_Tok_TSym (dtb__85) -> (if (dtb__85 = s) then (Base_dDiag.C_Check_OkC ((v_advance st))) else (((Base_dDiagnostics_dFrontend.v_psErr1At (v_tokSpan st)) (Base_dDiagnostics_dFrontend.C_PsDiag_ExpectedToken (s))) s))
  | _ -> (((Base_dDiagnostics_dFrontend.v_psErr1At (v_tokSpan st)) (Base_dDiagnostics_dFrontend.C_PsDiag_ExpectedToken (s))) s)
)
  | _ -> failwith "DT: impossible branch"
)))

# 231 "Vuna/Compiler/Frontend/Parser/Support.vuna"
let v_expectKw = (fun (st : t_PState) (k : string) -> (let nd_uscrut2 = (v_peekTok st) in (match nd_uscrut2 with
  | { Frontend_dLexer.f_PTok_ptokTok = dtb__86; Frontend_dLexer.f_PTok_ptokPos = dtb__87 } -> (match dtb__86 with
  | Frontend_dLexer.C_Tok_TKw (dtb__88) -> (if (dtb__88 = k) then (Base_dDiag.C_Check_OkC ((v_advance st))) else (((Base_dDiagnostics_dFrontend.v_psErr1At (v_tokSpan st)) (Base_dDiagnostics_dFrontend.C_PsDiag_ExpectedToken (k))) k))
  | _ -> (((Base_dDiagnostics_dFrontend.v_psErr1At (v_tokSpan st)) (Base_dDiagnostics_dFrontend.C_PsDiag_ExpectedToken (k))) k)
)
  | _ -> failwith "DT: impossible branch"
)))

# 237 "Vuna/Compiler/Frontend/Parser/Support.vuna"
let v_expectIdent = (fun (st : t_PState) -> (let nd_uscrut1 = (v_peekTok st) in (match nd_uscrut1 with
  | { Frontend_dLexer.f_PTok_ptokTok = dtb__89; Frontend_dLexer.f_PTok_ptokPos = dtb__90 } -> (match dtb__89 with
  | Frontend_dLexer.C_Tok_TIdent (dtb__91) -> (Base_dDiag.C_Check_OkC ({ B_dData_dPair.f_Pair_first = dtb__91; B_dData_dPair.f_Pair_second = (v_advance st) }))
  | _ -> ((Base_dDiagnostics_dFrontend.v_psErr0At (v_tokSpan st)) Base_dDiagnostics_dFrontend.C_PsDiag_ExpectedIdentifier)
)
  | _ -> failwith "DT: impossible branch"
)))

# 260 "Vuna/Compiler/Frontend/Parser/Support.vuna"
let v_upperFirst = (fun (s : string) -> (match (B_dData_dList.dtp_unpack s) with
  | B_dData_dList.C_List__x58__x58_ (dtb__92, dtb__93) -> (if (dtb__92 >= 65) then (dtb__92 <= 90) else false)
  | B_dData_dList.C_List_Nil -> false
  | _ -> failwith "DT: impossible branch"
))

# 268 "Vuna/Compiler/Frontend/Parser/Support.vuna"
let v_underscoreCtorName = (fun (s : string) -> (match (B_dData_dList.dtp_unpack s) with
  | B_dData_dList.C_List__x58__x58_ (dtb__94, dtb__95) -> (if (dtb__94 = 95) then (match dtb__95 with
  | B_dData_dList.C_List__x58__x58_ (dtb__96, dtb__97) -> (if (dtb__96 >= 65) then (dtb__96 <= 90) else false)
  | B_dData_dList.C_List_Nil -> false
  | _ -> failwith "DT: impossible branch"
) else false)
  | B_dData_dList.C_List_Nil -> false
  | _ -> failwith "DT: impossible branch"
))

# 280 "Vuna/Compiler/Frontend/Parser/Support.vuna"
let v_ctorPatternStart = (fun (name : string) -> (if (v_upperFirst name) then true else (v_underscoreCtorName name)))

# 303 "Vuna/Compiler/Frontend/Parser/Support.vuna"
let v_holeAtomAt = (fun (st : t_PState) -> (let nd_uscrut1 = (v_peekTok st) in (match nd_uscrut1 with
  | { Frontend_dLexer.f_PTok_ptokTok = dtb__98; Frontend_dLexer.f_PTok_ptokPos = dtb__99 } -> (match dtb__98 with
  | Frontend_dLexer.C_Tok_TSym (dtb__100) -> (if (dtb__100 = "?") then (let nd_uscrut5 = ((v_peekTokAt st) 1) in (match nd_uscrut5 with
  | B_dData_dMaybe.C_Maybe_Just (dtb__101) -> (match dtb__101 with
  | { Frontend_dLexer.f_PTok_ptokTok = dtb__102; Frontend_dLexer.f_PTok_ptokPos = dtb__103 } -> (match dtb__102 with
  | Frontend_dLexer.C_Tok_TIdent (dtb__104) -> (if (if ((Base_dSource.v_posLine dtb__103) = (Base_dSource.v_posLine dtb__99)) then ((Base_dSource.v_posCol dtb__103) = ((Base_dSource.v_posCol dtb__99) + 1)) else false) then (B_dData_dMaybe.C_Maybe_Just ({ B_dData_dPair.f_Pair_first = ("?" ^ dtb__104); B_dData_dPair.f_Pair_second = { Base_dSource.f_Span_spanFile = (v_fileOf st); Base_dSource.f_Span_spanStartLine = (Base_dSource.v_posLine dtb__99); Base_dSource.f_Span_spanStartCol = (Base_dSource.v_posCol dtb__99); Base_dSource.f_Span_spanEndLine = (Base_dSource.v_posLine dtb__103); Base_dSource.f_Span_spanEndCol = ((Base_dSource.v_posCol dtb__103) + (bi_strLength dtb__104)); Base_dSource.f_Span_spanStartOffset = (Base_dSource.v_posOffset dtb__99); Base_dSource.f_Span_spanEndOffset = ((Base_dSource.v_posOffset dtb__103) + (bi_strLength dtb__104)) } })) else B_dData_dMaybe.C_Maybe_Nothing)
  | _ -> B_dData_dMaybe.C_Maybe_Nothing
)
  | _ -> failwith "DT: impossible branch"
)
  | _ -> B_dData_dMaybe.C_Maybe_Nothing
)) else B_dData_dMaybe.C_Maybe_Nothing)
  | _ -> B_dData_dMaybe.C_Maybe_Nothing
)
  | _ -> failwith "DT: impossible branch"
)))

# 283 "Vuna/Compiler/Frontend/Parser/Support.vuna"
let v_startsAtom = (fun (st : t_PState) -> (let nd_uscrut1 = (v_peekTok st) in (match nd_uscrut1 with
  | { Frontend_dLexer.f_PTok_ptokTok = dtb__105; Frontend_dLexer.f_PTok_ptokPos = dtb__106 } -> (match dtb__105 with
  | Frontend_dLexer.C_Tok_TSym (dtb__107) -> (if (dtb__107 = "(") then true else (if (dtb__107 = "[") then true else (if (dtb__107 = "?") then (match (v_holeAtomAt st) with
  | B_dData_dMaybe.C_Maybe_Just (dtb__108) -> true
  | B_dData_dMaybe.C_Maybe_Nothing -> false
  | _ -> failwith "DT: impossible branch"
) else false)))
  | Frontend_dLexer.C_Tok_TKw (dtb__109) -> (if (dtb__109 = "Type") then true else false)
  | Frontend_dLexer.C_Tok_TTmpl (dtb__110, dtb__111, dtb__112) -> true
  | Frontend_dLexer.C_Tok_TStr (dtb__113) -> true
  | Frontend_dLexer.C_Tok_TFloat (dtb__114) -> true
  | Frontend_dLexer.C_Tok_TInt (dtb__115) -> true
  | Frontend_dLexer.C_Tok_TIdent (dtb__116) -> true
  | _ -> false
)
  | _ -> failwith "DT: impossible branch"
)))

# 317 "Vuna/Compiler/Frontend/Parser/Support.vuna"
let v_startsPatternAtom = (fun (st : t_PState) -> (let nd_uscrut1 = (v_peekTok st) in (match nd_uscrut1 with
  | { Frontend_dLexer.f_PTok_ptokTok = dtb__117; Frontend_dLexer.f_PTok_ptokPos = dtb__118 } -> (match dtb__117 with
  | Frontend_dLexer.C_Tok_TSym (dtb__119) -> (if (dtb__119 = "(") then true else (if (dtb__119 = "[") then true else false))
  | Frontend_dLexer.C_Tok_TTmpl (dtb__120, dtb__121, dtb__122) -> true
  | Frontend_dLexer.C_Tok_TStr (dtb__123) -> true
  | Frontend_dLexer.C_Tok_TInt (dtb__124) -> true
  | Frontend_dLexer.C_Tok_TIdent (dtb__125) -> true
  | _ -> false
)
  | _ -> failwith "DT: impossible branch"
)))

# 330 "Vuna/Compiler/Frontend/Parser/Support.vuna"
let v_isSyntaxSym = (fun (op : string) -> (if (op = "=") then true else (if (op = ":") then true else (if (op = ",") then true else (if (op = ";") then true else (if (op = "|") then true else (if (op = "=>") then true else (if (op = "<-") then true else (if (op = "\\") then true else (if (op = ".") then true else (if (op = "..") then true else (if (op = "@") then true else (if (op = "(") then true else (if (op = ")") then true else (if (op = "[") then true else (if (op = "]") then true else (if (op = "{") then true else (if (op = "}") then true else false))))))))))))))))))

# 357 "Vuna/Compiler/Frontend/Parser/Support.vuna"
let v_isReservedValueName = (fun (name : string) -> (if (if (v_isSyntaxSym name) then true else (name = "->")) then true else (name = "`")))

# 245 "Vuna/Compiler/Frontend/Parser/Support.vuna"
let v_expectValueName = (fun (st : t_PState) -> (let nd_uscrut1 = (v_peekTok st) in (match nd_uscrut1 with
  | { Frontend_dLexer.f_PTok_ptokTok = dtb__126; Frontend_dLexer.f_PTok_ptokPos = dtb__127 } -> (match dtb__126 with
  | Frontend_dLexer.C_Tok_TSym (dtb__128) -> (if (v_isReservedValueName dtb__128) then (((Base_dDiagnostics_dFrontend.v_psErr1At (v_tokSpan st)) (Base_dDiagnostics_dFrontend.C_PsDiag_ExpectedToken ("value name"))) "value name") else (Base_dDiag.C_Check_OkC ({ B_dData_dPair.f_Pair_first = dtb__128; B_dData_dPair.f_Pair_second = (v_advance st) })))
  | Frontend_dLexer.C_Tok_TIdent (dtb__129) -> (if (v_isReservedValueName dtb__129) then (((Base_dDiagnostics_dFrontend.v_psErr1At (v_tokSpan st)) (Base_dDiagnostics_dFrontend.C_PsDiag_ExpectedToken ("value name"))) "value name") else (Base_dDiag.C_Check_OkC ({ B_dData_dPair.f_Pair_first = dtb__129; B_dData_dPair.f_Pair_second = (v_advance st) })))
  | _ -> ((Base_dDiagnostics_dFrontend.v_psErr0At (v_tokSpan st)) Base_dDiagnostics_dFrontend.C_PsDiag_ExpectedIdentifier)
)
  | _ -> failwith "DT: impossible branch"
)))

# 362 "Vuna/Compiler/Frontend/Parser/Support.vuna"
let v_closeParenNext = (fun (st : t_PState) -> (let nd_uscrut1 = ((v_peekTokAt st) 1) in (match nd_uscrut1 with
  | B_dData_dMaybe.C_Maybe_Just (dtb__130) -> (match dtb__130 with
  | { Frontend_dLexer.f_PTok_ptokTok = dtb__131; Frontend_dLexer.f_PTok_ptokPos = dtb__132 } -> (match dtb__131 with
  | Frontend_dLexer.C_Tok_TSym (dtb__133) -> (if (dtb__133 = ")") then true else false)
  | _ -> false
)
  | _ -> failwith "DT: impossible branch"
)
  | _ -> false
)))

# 385 "Vuna/Compiler/Frontend/Parser/Support.vuna"
let v_minusLiteralAt = (fun (p : Base_dSource.t_Pos) (st : t_PState) -> (let nd_uscrut2 = ((v_peekTokAt st) 2) in (match nd_uscrut2 with
  | B_dData_dMaybe.C_Maybe_Just (dtb__134) -> (match dtb__134 with
  | { Frontend_dLexer.f_PTok_ptokTok = dtb__135; Frontend_dLexer.f_PTok_ptokPos = dtb__136 } -> (match dtb__135 with
  | Frontend_dLexer.C_Tok_TFloat (dtb__137) -> (if ((Base_dSource.v_posLine dtb__136) = (Base_dSource.v_posLine p)) then ((Base_dSource.v_posCol dtb__136) = ((Base_dSource.v_posCol p) + 1)) else false)
  | Frontend_dLexer.C_Tok_TInt (dtb__138) -> (if ((Base_dSource.v_posLine dtb__136) = (Base_dSource.v_posLine p)) then ((Base_dSource.v_posCol dtb__136) = ((Base_dSource.v_posCol p) + 1)) else false)
  | _ -> false
)
  | _ -> failwith "DT: impossible branch"
)
  | _ -> false
)))

# 371 "Vuna/Compiler/Frontend/Parser/Support.vuna"
let v_sectionOpAt = (fun (st : t_PState) -> (let nd_uscrut1 = ((v_peekTokAt st) 1) in (match nd_uscrut1 with
  | B_dData_dMaybe.C_Maybe_Just (dtb__139) -> (match dtb__139 with
  | { Frontend_dLexer.f_PTok_ptokTok = dtb__140; Frontend_dLexer.f_PTok_ptokPos = dtb__141 } -> (match dtb__140 with
  | Frontend_dLexer.C_Tok_TSym (dtb__142) -> (if (v_isReservedValueName dtb__142) then B_dData_dMaybe.C_Maybe_Nothing else (if (dtb__142 = "?") then (match (v_holeAtomAt (v_advance st)) with
  | B_dData_dMaybe.C_Maybe_Just (dtb__143) -> B_dData_dMaybe.C_Maybe_Nothing
  | B_dData_dMaybe.C_Maybe_Nothing -> (B_dData_dMaybe.C_Maybe_Just (dtb__142))
  | _ -> failwith "DT: impossible branch"
) else (if (if (dtb__142 = "-") then ((v_minusLiteralAt dtb__141) st) else false) then B_dData_dMaybe.C_Maybe_Nothing else (B_dData_dMaybe.C_Maybe_Just (dtb__142)))))
  | _ -> B_dData_dMaybe.C_Maybe_Nothing
)
  | _ -> failwith "DT: impossible branch"
)
  | _ -> B_dData_dMaybe.C_Maybe_Nothing
)))

# 392 "Vuna/Compiler/Frontend/Parser/Support.vuna"
let rec v_countArrows = (fun (mc0 : Frontend_dAst.t_Expr) -> (match mc0 with
  | Frontend_dAst.C_Expr_EApp (dtb__144, dtb__145, dtb__146) -> (match dtb__144 with
  | Frontend_dAst.C_Expr_EVar (dtb__147, dtb__148) -> (if (dtb__147 = "->") then (match dtb__145 with
  | B_dData_dList.C_List__x58__x58_ (dtb__149, dtb__150) -> (match dtb__150 with
  | B_dData_dList.C_List__x58__x58_ (dtb__151, dtb__152) -> (match dtb__152 with
  | B_dData_dList.C_List_Nil -> (1 + (v_countArrows dtb__151))
  | _ -> 0
)
  | _ -> 0
)
  | _ -> 0
) else 0)
  | _ -> 0
)
  | Frontend_dAst.C_Expr_EInfix (dtb__153, dtb__154, dtb__155, dtb__156) -> (if (dtb__153 = "->") then (1 + (v_countArrows dtb__155)) else 0)
  | _ -> 0
))

# 397 "Vuna/Compiler/Frontend/Parser/Support.vuna"
let v_terminatesExpression = (fun (mc0 : Frontend_dLexer.t_PTok) -> (match mc0 with
  | { Frontend_dLexer.f_PTok_ptokTok = dtb__157; Frontend_dLexer.f_PTok_ptokPos = dtb__158 } -> (match dtb__157 with
  | Frontend_dLexer.C_Tok_TKw (dtb__159) -> (if (dtb__159 = "else") then true else (if (dtb__159 = "in") then true else (if (dtb__159 = "then") then true else false)))
  | Frontend_dLexer.C_Tok_TSym (dtb__160) -> (if (dtb__160 = ")") then true else (if (dtb__160 = "]") then true else (if (dtb__160 = ",") then true else false)))
  | _ -> false
)
  | _ -> failwith "DT: impossible branch"
))

# 406 "Vuna/Compiler/Frontend/Parser/Support.vuna"
let v_badCaseIndent = (fun (st : t_PState) (altCol : int) -> (if (v_isEof st) then false else (match (v_peekPos st) with
  | { Base_dSource.f_Pos_posLine = dtb__161; Base_dSource.f_Pos_posCol = dtb__162; Base_dSource.f_Pos_posOffset = dtb__163; Base_dSource.f_Pos_posEndOffset = dtb__164 } -> (if (dtb__162 > altCol) then (if (v_terminatesExpression (v_peekTok st)) then false else true) else false)
  | _ -> failwith "DT: impossible branch"
)))
