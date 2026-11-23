open Vuna_runtime
type t_ParseMode = C_ParseMode_PmStrict | C_ParseMode_PmTool
and t_PState = { f_PState_fileOf : string; f_PState_toksOf : Frontend_dLexer.t_PTok B_dData_dList.t_List; f_PState_lastPos : Base_dSource.t_Pos; f_PState_toksLeft : int; f_PState_pmodeOf : t_ParseMode; f_PState_tokIndex : int; f_PState_pendEvents : Frontend_dCst.t_NodeEvent B_dData_dList.t_List; f_PState_nextNodeId : int; f_PState_openNodeId : int; f_PState_subStream : bool }

# 49 "Vuna/Compiler/Frontend/Parser/Support.vuna"
let v_fileOf = (fun (st : t_PState) -> (st).f_PState_fileOf)

# 53 "Vuna/Compiler/Frontend/Parser/Support.vuna"
let v_pmodeOf = (fun (st : t_PState) -> (st).f_PState_pmodeOf)

# 57 "Vuna/Compiler/Frontend/Parser/Support.vuna"
let v_mkState = (fun (file : string) (toks : Frontend_dLexer.t_PTok B_dData_dList.t_List) (mode : t_ParseMode) -> { f_PState_fileOf = file; f_PState_toksOf = toks; f_PState_lastPos = { Base_dSource.f_Pos_posLine = 1; Base_dSource.f_Pos_posCol = 0; Base_dSource.f_Pos_posOffset = 0; Base_dSource.f_Pos_posEndOffset = 0 }; f_PState_toksLeft = (B_dData_dList.v_length toks); f_PState_pmodeOf = mode; f_PState_tokIndex = 0; f_PState_pendEvents = B_dData_dList.C_List_Nil; f_PState_nextNodeId = 1; f_PState_openNodeId = 0; f_PState_subStream = false })

# 62 "Vuna/Compiler/Frontend/Parser/Support.vuna"
let v_mkStateAt = (fun (file : string) (toks : Frontend_dLexer.t_PTok B_dData_dList.t_List) (last : Base_dSource.t_Pos) (count : int) (mode : t_ParseMode) -> { f_PState_fileOf = file; f_PState_toksOf = toks; f_PState_lastPos = last; f_PState_toksLeft = count; f_PState_pmodeOf = mode; f_PState_tokIndex = 0; f_PState_pendEvents = B_dData_dList.C_List_Nil; f_PState_nextNodeId = 1; f_PState_openNodeId = 0; f_PState_subStream = true })

# 66 "Vuna/Compiler/Frontend/Parser/Support.vuna"
let v_eventsOf = (fun (st : t_PState) (st2 : t_PState) -> (B_dData_dList.v_reverse (st2).f_PState_pendEvents))

# 87 "Vuna/Compiler/Frontend/Parser/Support.vuna"
let v_closedAt = (fun (st : t_PState) -> { st with f_PState_pendEvents = (B_dData_dList.C_List__x58__x58_ ((Frontend_dCst.C_NodeEvent_EvClose ((st).f_PState_tokIndex)), (st).f_PState_pendEvents)) })

# 74 "Vuna/Compiler/Frontend/Parser/Support.vuna"
let v_withExtent = (fun (kind : Frontend_dCst.t_CstKind) (st : t_PState) k -> (let nid = (if (st).f_PState_subStream then (0 - 1) else (st).f_PState_nextNodeId) in (let opened = { st with f_PState_pendEvents = (B_dData_dList.C_List__x58__x58_ ((Frontend_dCst.C_NodeEvent_EvOpen (kind, (st).f_PState_tokIndex, nid)), (st).f_PState_pendEvents)); f_PState_nextNodeId = (if (st).f_PState_subStream then (st).f_PState_nextNodeId else (nid + 1)); f_PState_openNodeId = nid } in ((Base_dCommon.v_step (k opened)) (fun v (st1 : t_PState) -> (Base_dDiag.C_Check_OkC ({ B_dData_dPair.f_Pair_first = v; B_dData_dPair.f_Pair_second = (v_closedAt st1) })))))))

# 92 "Vuna/Compiler/Frontend/Parser/Support.vuna"
let v_withLastPos = (fun (p : Base_dSource.t_Pos) (st : t_PState) -> { st with f_PState_lastPos = p })

# 97 "Vuna/Compiler/Frontend/Parser/Support.vuna"
let v_lastEndCol = (fun (p : Base_dSource.t_Pos) -> ((Base_dSource.v_posCol p) + ((Base_dSource.v_posEndOffset p) - (Base_dSource.v_posOffset p))))

# 146 "Vuna/Compiler/Frontend/Parser/Support.vuna"
let v_peekTok = (fun (st : t_PState) -> (match (st).f_PState_toksOf with
  | B_dData_dList.C_List__x58__x58_ (dtb__0, dtb__1) -> dtb__0
  | B_dData_dList.C_List_Nil -> { Frontend_dLexer.f_PTok_ptokTok = Frontend_dLexer.C_Tok_TEof; Frontend_dLexer.f_PTok_ptokPos = { Base_dSource.f_Pos_posLine = 1; Base_dSource.f_Pos_posCol = 1; Base_dSource.f_Pos_posOffset = 0; Base_dSource.f_Pos_posEndOffset = 0 } }
  | _ -> failwith "DT: impossible branch"
))

# 152 "Vuna/Compiler/Frontend/Parser/Support.vuna"
let v_peekPos = (fun (st : t_PState) -> ((v_peekTok st)).Frontend_dLexer.f_PTok_ptokPos)

# 132 "Vuna/Compiler/Frontend/Parser/Support.vuna"
let v_tokenSpan = (fun (st : t_PState) -> (let p = (v_peekPos st) in (let len = ((Base_dSource.v_posEndOffset p) - (Base_dSource.v_posOffset p)) in { Base_dSource.f_Span_spanFile = (v_fileOf st); Base_dSource.f_Span_spanStartLine = (Base_dSource.v_posLine p); Base_dSource.f_Span_spanStartCol = (Base_dSource.v_posCol p); Base_dSource.f_Span_spanEndLine = (Base_dSource.v_posLine p); Base_dSource.f_Span_spanEndCol = ((Base_dSource.v_posCol p) + len); Base_dSource.f_Span_spanStartOffset = (Base_dSource.v_posOffset p); Base_dSource.f_Span_spanEndOffset = (Base_dSource.v_posEndOffset p) })))

# 167 "Vuna/Compiler/Frontend/Parser/Support.vuna"
let v_lastPos = (fun (st : t_PState) -> (st).f_PState_lastPos)

# 103 "Vuna/Compiler/Frontend/Parser/Support.vuna"
let v_spanOf = (fun (st : t_PState) (st2 : t_PState) -> (let p1 = (v_lastPos st2) in { Base_dSource.f_Span_spanFile = (v_fileOf st); Base_dSource.f_Span_spanStartLine = (Base_dSource.v_posLine (v_peekPos st)); Base_dSource.f_Span_spanStartCol = (Base_dSource.v_posCol (v_peekPos st)); Base_dSource.f_Span_spanEndLine = (Base_dSource.v_posLine p1); Base_dSource.f_Span_spanEndCol = (v_lastEndCol p1); Base_dSource.f_Span_spanStartOffset = (Base_dSource.v_posOffset (v_peekPos st)); Base_dSource.f_Span_spanEndOffset = (Base_dSource.v_posEndOffset p1) }))

# 117 "Vuna/Compiler/Frontend/Parser/Support.vuna"
let v_spanFromStart = (fun (file : string) (start : Base_dSource.t_Pos) (st : t_PState) -> (let p1 = (v_lastPos st) in { Base_dSource.f_Span_spanFile = file; Base_dSource.f_Span_spanStartLine = (Base_dSource.v_posLine start); Base_dSource.f_Span_spanStartCol = (Base_dSource.v_posCol start); Base_dSource.f_Span_spanEndLine = (Base_dSource.v_posLine p1); Base_dSource.f_Span_spanEndCol = (v_lastEndCol p1); Base_dSource.f_Span_spanStartOffset = (Base_dSource.v_posOffset start); Base_dSource.f_Span_spanEndOffset = (Base_dSource.v_posEndOffset p1) }))

# 157 "Vuna/Compiler/Frontend/Parser/Support.vuna"
let v_tokSpan = (fun (st : t_PState) -> (let nd_uscrut1 = (v_peekTok st) in (match nd_uscrut1 with
  | { Frontend_dLexer.f_PTok_ptokTok = dtb__2; Frontend_dLexer.f_PTok_ptokPos = dtb__3 } -> (match dtb__2 with
  | Frontend_dLexer.C_Tok_TEof -> (let p = (v_lastPos st) in { Base_dSource.f_Span_spanFile = (v_fileOf st); Base_dSource.f_Span_spanStartLine = (Base_dSource.v_posLine p); Base_dSource.f_Span_spanStartCol = (Base_dSource.v_posCol p); Base_dSource.f_Span_spanEndLine = (Base_dSource.v_posLine p); Base_dSource.f_Span_spanEndCol = (Base_dSource.v_posCol p); Base_dSource.f_Span_spanStartOffset = (Base_dSource.v_posOffset p); Base_dSource.f_Span_spanEndOffset = (Base_dSource.v_posOffset p) })
  | _ -> { Base_dSource.f_Span_spanFile = (v_fileOf st); Base_dSource.f_Span_spanStartLine = (Base_dSource.v_posLine dtb__3); Base_dSource.f_Span_spanStartCol = (Base_dSource.v_posCol dtb__3); Base_dSource.f_Span_spanEndLine = (Base_dSource.v_posLine dtb__3); Base_dSource.f_Span_spanEndCol = (Base_dSource.v_posCol dtb__3); Base_dSource.f_Span_spanStartOffset = (Base_dSource.v_posOffset dtb__3); Base_dSource.f_Span_spanEndOffset = (Base_dSource.v_posOffset dtb__3) }
)
  | _ -> failwith "DT: impossible branch"
)))

# 170 "Vuna/Compiler/Frontend/Parser/Support.vuna"
let v_advance = (fun (st : t_PState) -> (match (st).f_PState_toksOf with
  | B_dData_dList.C_List__x58__x58_ (dtb__4, dtb__5) -> (let nd_uscrut4 = dtb__4 in (match nd_uscrut4 with
  | { Frontend_dLexer.f_PTok_ptokTok = dtb__6; Frontend_dLexer.f_PTok_ptokPos = dtb__7 } -> (match dtb__6 with
  | Frontend_dLexer.C_Tok_TEof -> st
  | _ -> { st with f_PState_toksOf = dtb__5; f_PState_lastPos = (dtb__4).Frontend_dLexer.f_PTok_ptokPos; f_PState_toksLeft = (if ((st).f_PState_toksLeft > 0) then ((st).f_PState_toksLeft - 1) else 0); f_PState_tokIndex = ((st).f_PState_tokIndex + 1) }
)
  | _ -> failwith "DT: impossible branch"
))
  | B_dData_dList.C_List_Nil -> st
  | _ -> failwith "DT: impossible branch"
))

# 185 "Vuna/Compiler/Frontend/Parser/Support.vuna"
let v_isEof = (fun (st : t_PState) -> (let nd_uscrut1 = (v_peekTok st) in (match nd_uscrut1 with
  | { Frontend_dLexer.f_PTok_ptokTok = dtb__8; Frontend_dLexer.f_PTok_ptokPos = dtb__9 } -> (match dtb__8 with
  | Frontend_dLexer.C_Tok_TEof -> true
  | _ -> false
)
  | _ -> failwith "DT: impossible branch"
)))

# 214 "Vuna/Compiler/Frontend/Parser/Support.vuna"
let v_stateFuel = (fun (st : t_PState) -> ((128 * (st).f_PState_toksLeft) + 1024))

# 217 "Vuna/Compiler/Frontend/Parser/Support.vuna"
let v_sameLineState = (fun (st : t_PState) -> (match (v_peekPos st) with
  | { Base_dSource.f_Pos_posLine = dtb__10; Base_dSource.f_Pos_posCol = dtb__11; Base_dSource.f_Pos_posOffset = dtb__12; Base_dSource.f_Pos_posEndOffset = dtb__13 } -> { st with f_PState_lastPos = { Base_dSource.f_Pos_posLine = dtb__10; Base_dSource.f_Pos_posCol = 0; Base_dSource.f_Pos_posOffset = 0; Base_dSource.f_Pos_posEndOffset = 0 } }
  | _ -> failwith "DT: impossible branch"
))

# 222 "Vuna/Compiler/Frontend/Parser/Support.vuna"
let v_atSym = (fun (st : t_PState) (s : string) -> (let nd_uscrut2 = (v_peekTok st) in (match nd_uscrut2 with
  | { Frontend_dLexer.f_PTok_ptokTok = dtb__14; Frontend_dLexer.f_PTok_ptokPos = dtb__15 } -> (match dtb__14 with
  | Frontend_dLexer.C_Tok_TSym (dtb__16) -> (dtb__16 = s)
  | _ -> false
)
  | _ -> failwith "DT: impossible branch"
)))

# 229 "Vuna/Compiler/Frontend/Parser/Support.vuna"
let rec v_nthTok = (fun (mc0 : Frontend_dLexer.t_PTok B_dData_dList.t_List) (mc1 : int) -> (match mc0 with
  | B_dData_dList.C_List__x58__x58_ (dtb__17, dtb__18) -> (if (mc1 <= 0) then (B_dData_dMaybe.C_Maybe_Just (dtb__17)) else ((v_nthTok dtb__18) (mc1 - 1)))
  | B_dData_dList.C_List_Nil -> B_dData_dMaybe.C_Maybe_Nothing
  | _ -> failwith "DT: impossible branch"
))

# 233 "Vuna/Compiler/Frontend/Parser/Support.vuna"
let v_peekTokAt = (fun (st : t_PState) (n : int) -> ((v_nthTok (st).f_PState_toksOf) n))

# 251 "Vuna/Compiler/Frontend/Parser/Support.vuna"
let v_tokTail = (fun (mc0 : Frontend_dLexer.t_PTok B_dData_dList.t_List) -> (match mc0 with
  | B_dData_dList.C_List__x58__x58_ (dtb__19, dtb__20) -> dtb__20
  | B_dData_dList.C_List_Nil -> B_dData_dList.C_List_Nil
  | _ -> failwith "DT: impossible branch"
))

# 256 "Vuna/Compiler/Frontend/Parser/Support.vuna"
let rec v_binderNameTail = (fun (mc0 : Frontend_dLexer.t_PTok B_dData_dList.t_List) (mc1 : string B_dData_dList.t_List) -> (match mc0 with
  | B_dData_dList.C_List__x58__x58_ (dtb__21, dtb__22) -> (let nd_uscrut5 = dtb__21 in (match nd_uscrut5 with
  | { Frontend_dLexer.f_PTok_ptokTok = dtb__23; Frontend_dLexer.f_PTok_ptokPos = dtb__24 } -> (match dtb__23 with
  | Frontend_dLexer.C_Tok_TSym (dtb__25) -> (if (dtb__25 = ":") then (B_dData_dMaybe.C_Maybe_Just ((B_dData_dList.v_reverse mc1))) else B_dData_dMaybe.C_Maybe_Nothing)
  | Frontend_dLexer.C_Tok_TIdent (dtb__26) -> ((v_binderNameTail dtb__22) (B_dData_dList.C_List__x58__x58_ (dtb__26, mc1)))
  | _ -> B_dData_dMaybe.C_Maybe_Nothing
)
  | _ -> failwith "DT: impossible branch"
))
  | B_dData_dList.C_List_Nil -> B_dData_dMaybe.C_Maybe_Nothing
  | _ -> failwith "DT: impossible branch"
))

# 264 "Vuna/Compiler/Frontend/Parser/Support.vuna"
let v_quantifiedHead = (fun (st : t_PState) (q : Frontend_dAst.t_Qty) -> (let nd_uscrut2 = ((v_peekTokAt st) 1) in (match nd_uscrut2 with
  | B_dData_dMaybe.C_Maybe_Just (dtb__27) -> (match dtb__27 with
  | { Frontend_dLexer.f_PTok_ptokTok = dtb__28; Frontend_dLexer.f_PTok_ptokPos = dtb__29 } -> (match dtb__28 with
  | Frontend_dLexer.C_Tok_TIdent (dtb__30) -> (match ((v_binderNameTail (v_tokTail (v_tokTail (st).f_PState_toksOf))) B_dData_dList.C_List_Nil) with
  | B_dData_dMaybe.C_Maybe_Just (dtb__31) -> (B_dData_dMaybe.C_Maybe_Just ({ B_dData_dPair.f_Pair_first = (B_dData_dMaybe.C_Maybe_Just (q)); B_dData_dPair.f_Pair_second = (B_dData_dList.C_List__x58__x58_ (dtb__30, dtb__31)) }))
  | B_dData_dMaybe.C_Maybe_Nothing -> B_dData_dMaybe.C_Maybe_Nothing
  | _ -> failwith "DT: impossible branch"
)
  | _ -> B_dData_dMaybe.C_Maybe_Nothing
)
  | _ -> failwith "DT: impossible branch"
)
  | _ -> B_dData_dMaybe.C_Maybe_Nothing
)))

# 239 "Vuna/Compiler/Frontend/Parser/Support.vuna"
let v_binderHead = (fun (st : t_PState) -> (let nd_uscrut1 = (v_peekTok st) in (match nd_uscrut1 with
  | { Frontend_dLexer.f_PTok_ptokTok = dtb__32; Frontend_dLexer.f_PTok_ptokPos = dtb__33 } -> (match dtb__32 with
  | Frontend_dLexer.C_Tok_TInt (dtb__34) -> (if (dtb__34 = 0) then ((v_quantifiedHead st) Frontend_dAst.C_Qty_Q0) else (if (dtb__34 = 1) then ((v_quantifiedHead st) Frontend_dAst.C_Qty_Q1) else B_dData_dMaybe.C_Maybe_Nothing))
  | Frontend_dLexer.C_Tok_TIdent (dtb__35) -> (match ((v_binderNameTail (v_tokTail (st).f_PState_toksOf)) B_dData_dList.C_List_Nil) with
  | B_dData_dMaybe.C_Maybe_Just (dtb__36) -> (B_dData_dMaybe.C_Maybe_Just ({ B_dData_dPair.f_Pair_first = B_dData_dMaybe.C_Maybe_Nothing; B_dData_dPair.f_Pair_second = (B_dData_dList.C_List__x58__x58_ (dtb__35, dtb__36)) }))
  | B_dData_dMaybe.C_Maybe_Nothing -> B_dData_dMaybe.C_Maybe_Nothing
  | _ -> failwith "DT: impossible branch"
)
  | _ -> B_dData_dMaybe.C_Maybe_Nothing
)
  | _ -> failwith "DT: impossible branch"
)))

# 286 "Vuna/Compiler/Frontend/Parser/Support.vuna"
let v_arrowAt = (fun (mc0 : Frontend_dLexer.t_PTok B_dData_dList.t_List) -> (match mc0 with
  | B_dData_dList.C_List__x58__x58_ (dtb__37, dtb__38) -> (match dtb__37 with
  | { Frontend_dLexer.f_PTok_ptokTok = dtb__39; Frontend_dLexer.f_PTok_ptokPos = dtb__40 } -> (match dtb__39 with
  | Frontend_dLexer.C_Tok_TSym (dtb__41) -> (if (dtb__41 = "->") then true else false)
  | _ -> false
)
  | _ -> failwith "DT: impossible branch"
)
  | _ -> false
))

# 279 "Vuna/Compiler/Frontend/Parser/Support.vuna"
let rec v_piArrowAheadGo = (fun (mc0 : int) (mc1 : Frontend_dLexer.t_PTok B_dData_dList.t_List) -> (match mc1 with
  | B_dData_dList.C_List__x58__x58_ (dtb__42, dtb__43) -> (match dtb__42 with
  | { Frontend_dLexer.f_PTok_ptokTok = dtb__44; Frontend_dLexer.f_PTok_ptokPos = dtb__45 } -> (match dtb__44 with
  | Frontend_dLexer.C_Tok_TSym (dtb__46) -> (if (dtb__46 = "(") then ((v_piArrowAheadGo (mc0 + 1)) dtb__43) else (if (dtb__46 = ")") then (if (mc0 = 1) then (v_arrowAt dtb__43) else ((v_piArrowAheadGo (mc0 - 1)) dtb__43)) else ((v_piArrowAheadGo mc0) dtb__43)))
  | _ -> ((v_piArrowAheadGo mc0) dtb__43)
)
  | _ -> failwith "DT: impossible branch"
)
  | B_dData_dList.C_List_Nil -> false
  | _ -> failwith "DT: impossible branch"
))

# 276 "Vuna/Compiler/Frontend/Parser/Support.vuna"
let v_piArrowAhead = (fun (st : t_PState) -> ((v_piArrowAheadGo 1) (st).f_PState_toksOf))

# 290 "Vuna/Compiler/Frontend/Parser/Support.vuna"
let v_atKw = (fun (st : t_PState) (k : string) -> (let nd_uscrut2 = (v_peekTok st) in (match nd_uscrut2 with
  | { Frontend_dLexer.f_PTok_ptokTok = dtb__47; Frontend_dLexer.f_PTok_ptokPos = dtb__48 } -> (match dtb__47 with
  | Frontend_dLexer.C_Tok_TKw (dtb__49) -> (dtb__49 = k)
  | _ -> false
)
  | _ -> failwith "DT: impossible branch"
)))

# 296 "Vuna/Compiler/Frontend/Parser/Support.vuna"
let v_canContinue = (fun (st : t_PState) (blockCol : int) -> (match (v_peekPos st) with
  | { Base_dSource.f_Pos_posLine = dtb__50; Base_dSource.f_Pos_posCol = dtb__51; Base_dSource.f_Pos_posOffset = dtb__52; Base_dSource.f_Pos_posEndOffset = dtb__53 } -> (match (v_lastPos st) with
  | { Base_dSource.f_Pos_posLine = dtb__54; Base_dSource.f_Pos_posCol = dtb__55; Base_dSource.f_Pos_posOffset = dtb__56; Base_dSource.f_Pos_posEndOffset = dtb__57 } -> (if (dtb__50 = dtb__54) then true else (dtb__51 > blockCol))
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
))

# 305 "Vuna/Compiler/Frontend/Parser/Support.vuna"
let v_expectSym = (fun (st : t_PState) (s : string) -> (let nd_uscrut2 = (v_peekTok st) in (match nd_uscrut2 with
  | { Frontend_dLexer.f_PTok_ptokTok = dtb__58; Frontend_dLexer.f_PTok_ptokPos = dtb__59 } -> (match dtb__58 with
  | Frontend_dLexer.C_Tok_TSym (dtb__60) -> (if (dtb__60 = s) then (Base_dDiag.C_Check_OkC ((v_advance st))) else (((Base_dDiagnostics_dFrontend.v_psErr1At (v_tokSpan st)) (Base_dDiagnostics_dFrontend.C_PsDiag_ExpectedToken (s))) s))
  | _ -> (((Base_dDiagnostics_dFrontend.v_psErr1At (v_tokSpan st)) (Base_dDiagnostics_dFrontend.C_PsDiag_ExpectedToken (s))) s)
)
  | _ -> failwith "DT: impossible branch"
)))

# 312 "Vuna/Compiler/Frontend/Parser/Support.vuna"
let v_expectKw = (fun (st : t_PState) (k : string) -> (let nd_uscrut2 = (v_peekTok st) in (match nd_uscrut2 with
  | { Frontend_dLexer.f_PTok_ptokTok = dtb__61; Frontend_dLexer.f_PTok_ptokPos = dtb__62 } -> (match dtb__61 with
  | Frontend_dLexer.C_Tok_TKw (dtb__63) -> (if (dtb__63 = k) then (Base_dDiag.C_Check_OkC ((v_advance st))) else (((Base_dDiagnostics_dFrontend.v_psErr1At (v_tokSpan st)) (Base_dDiagnostics_dFrontend.C_PsDiag_ExpectedToken (k))) k))
  | _ -> (((Base_dDiagnostics_dFrontend.v_psErr1At (v_tokSpan st)) (Base_dDiagnostics_dFrontend.C_PsDiag_ExpectedToken (k))) k)
)
  | _ -> failwith "DT: impossible branch"
)))

# 318 "Vuna/Compiler/Frontend/Parser/Support.vuna"
let v_expectIdent = (fun (st : t_PState) -> (let nd_uscrut1 = (v_peekTok st) in (match nd_uscrut1 with
  | { Frontend_dLexer.f_PTok_ptokTok = dtb__64; Frontend_dLexer.f_PTok_ptokPos = dtb__65 } -> (match dtb__64 with
  | Frontend_dLexer.C_Tok_TIdent (dtb__66) -> (Base_dDiag.C_Check_OkC ({ B_dData_dPair.f_Pair_first = dtb__66; B_dData_dPair.f_Pair_second = (v_advance st) }))
  | _ -> ((Base_dDiagnostics_dFrontend.v_psErr0At (v_tokSpan st)) Base_dDiagnostics_dFrontend.C_PsDiag_ExpectedIdentifier)
)
  | _ -> failwith "DT: impossible branch"
)))

# 341 "Vuna/Compiler/Frontend/Parser/Support.vuna"
let v_upperFirst = (fun (s : string) -> (match (B_dData_dList.dtp_unpack s) with
  | B_dData_dList.C_List__x58__x58_ (dtb__67, dtb__68) -> (if (dtb__67 >= 65) then (dtb__67 <= 90) else false)
  | B_dData_dList.C_List_Nil -> false
  | _ -> failwith "DT: impossible branch"
))

# 349 "Vuna/Compiler/Frontend/Parser/Support.vuna"
let v_underscoreCtorName = (fun (s : string) -> (match (B_dData_dList.dtp_unpack s) with
  | B_dData_dList.C_List__x58__x58_ (dtb__69, dtb__70) -> (if (dtb__69 = 95) then (match dtb__70 with
  | B_dData_dList.C_List__x58__x58_ (dtb__71, dtb__72) -> (if (dtb__71 >= 65) then (dtb__71 <= 90) else false)
  | B_dData_dList.C_List_Nil -> false
  | _ -> failwith "DT: impossible branch"
) else false)
  | B_dData_dList.C_List_Nil -> false
  | _ -> failwith "DT: impossible branch"
))

# 361 "Vuna/Compiler/Frontend/Parser/Support.vuna"
let v_ctorPatternStart = (fun (name : string) -> (if (v_upperFirst name) then true else (v_underscoreCtorName name)))

# 384 "Vuna/Compiler/Frontend/Parser/Support.vuna"
let v_holeAtomAt = (fun (st : t_PState) -> (let nd_uscrut1 = (v_peekTok st) in (match nd_uscrut1 with
  | { Frontend_dLexer.f_PTok_ptokTok = dtb__73; Frontend_dLexer.f_PTok_ptokPos = dtb__74 } -> (match dtb__73 with
  | Frontend_dLexer.C_Tok_TSym (dtb__75) -> (if (dtb__75 = "?") then (let nd_uscrut5 = ((v_peekTokAt st) 1) in (match nd_uscrut5 with
  | B_dData_dMaybe.C_Maybe_Just (dtb__76) -> (match dtb__76 with
  | { Frontend_dLexer.f_PTok_ptokTok = dtb__77; Frontend_dLexer.f_PTok_ptokPos = dtb__78 } -> (match dtb__77 with
  | Frontend_dLexer.C_Tok_TIdent (dtb__79) -> (if (if ((Base_dSource.v_posLine dtb__78) = (Base_dSource.v_posLine dtb__74)) then ((Base_dSource.v_posCol dtb__78) = ((Base_dSource.v_posCol dtb__74) + 1)) else false) then (B_dData_dMaybe.C_Maybe_Just ({ B_dData_dPair.f_Pair_first = ("?" ^ dtb__79); B_dData_dPair.f_Pair_second = { Base_dSource.f_Span_spanFile = (v_fileOf st); Base_dSource.f_Span_spanStartLine = (Base_dSource.v_posLine dtb__74); Base_dSource.f_Span_spanStartCol = (Base_dSource.v_posCol dtb__74); Base_dSource.f_Span_spanEndLine = (Base_dSource.v_posLine dtb__78); Base_dSource.f_Span_spanEndCol = ((Base_dSource.v_posCol dtb__78) + (bi_strLength dtb__79)); Base_dSource.f_Span_spanStartOffset = (Base_dSource.v_posOffset dtb__74); Base_dSource.f_Span_spanEndOffset = ((Base_dSource.v_posOffset dtb__78) + (bi_strLength dtb__79)) } })) else B_dData_dMaybe.C_Maybe_Nothing)
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

# 364 "Vuna/Compiler/Frontend/Parser/Support.vuna"
let v_startsAtom = (fun (st : t_PState) -> (let nd_uscrut1 = (v_peekTok st) in (match nd_uscrut1 with
  | { Frontend_dLexer.f_PTok_ptokTok = dtb__80; Frontend_dLexer.f_PTok_ptokPos = dtb__81 } -> (match dtb__80 with
  | Frontend_dLexer.C_Tok_TSym (dtb__82) -> (if (dtb__82 = "(") then true else (if (dtb__82 = "[") then true else (if (dtb__82 = "?") then (match (v_holeAtomAt st) with
  | B_dData_dMaybe.C_Maybe_Just (dtb__83) -> true
  | B_dData_dMaybe.C_Maybe_Nothing -> false
  | _ -> failwith "DT: impossible branch"
) else false)))
  | Frontend_dLexer.C_Tok_TKw (dtb__84) -> (if (dtb__84 = "Type") then true else false)
  | Frontend_dLexer.C_Tok_TTmpl (dtb__85, dtb__86, dtb__87) -> true
  | Frontend_dLexer.C_Tok_TStr (dtb__88) -> true
  | Frontend_dLexer.C_Tok_TFloat (dtb__89) -> true
  | Frontend_dLexer.C_Tok_TInt (dtb__90) -> true
  | Frontend_dLexer.C_Tok_TIdent (dtb__91) -> true
  | _ -> false
)
  | _ -> failwith "DT: impossible branch"
)))

# 398 "Vuna/Compiler/Frontend/Parser/Support.vuna"
let v_startsPatternAtom = (fun (st : t_PState) -> (let nd_uscrut1 = (v_peekTok st) in (match nd_uscrut1 with
  | { Frontend_dLexer.f_PTok_ptokTok = dtb__92; Frontend_dLexer.f_PTok_ptokPos = dtb__93 } -> (match dtb__92 with
  | Frontend_dLexer.C_Tok_TSym (dtb__94) -> (if (dtb__94 = "(") then true else (if (dtb__94 = "[") then true else false))
  | Frontend_dLexer.C_Tok_TTmpl (dtb__95, dtb__96, dtb__97) -> true
  | Frontend_dLexer.C_Tok_TStr (dtb__98) -> true
  | Frontend_dLexer.C_Tok_TInt (dtb__99) -> true
  | Frontend_dLexer.C_Tok_TIdent (dtb__100) -> true
  | _ -> false
)
  | _ -> failwith "DT: impossible branch"
)))

# 411 "Vuna/Compiler/Frontend/Parser/Support.vuna"
let v_isSyntaxSym = (fun (op : string) -> (if (op = "=") then true else (if (op = ":") then true else (if (op = ",") then true else (if (op = ";") then true else (if (op = "|") then true else (if (op = "=>") then true else (if (op = "<-") then true else (if (op = "\\") then true else (if (op = ".") then true else (if (op = "..") then true else (if (op = "@") then true else (if (op = "(") then true else (if (op = ")") then true else (if (op = "[") then true else (if (op = "]") then true else (if (op = "{") then true else (if (op = "}") then true else false))))))))))))))))))

# 438 "Vuna/Compiler/Frontend/Parser/Support.vuna"
let v_isReservedValueName = (fun (name : string) -> (if (if (v_isSyntaxSym name) then true else (name = "->")) then true else (name = "`")))

# 326 "Vuna/Compiler/Frontend/Parser/Support.vuna"
let v_expectValueName = (fun (st : t_PState) -> (let nd_uscrut1 = (v_peekTok st) in (match nd_uscrut1 with
  | { Frontend_dLexer.f_PTok_ptokTok = dtb__101; Frontend_dLexer.f_PTok_ptokPos = dtb__102 } -> (match dtb__101 with
  | Frontend_dLexer.C_Tok_TSym (dtb__103) -> (if (v_isReservedValueName dtb__103) then (((Base_dDiagnostics_dFrontend.v_psErr1At (v_tokSpan st)) (Base_dDiagnostics_dFrontend.C_PsDiag_ExpectedToken ("value name"))) "value name") else (Base_dDiag.C_Check_OkC ({ B_dData_dPair.f_Pair_first = dtb__103; B_dData_dPair.f_Pair_second = (v_advance st) })))
  | Frontend_dLexer.C_Tok_TIdent (dtb__104) -> (if (v_isReservedValueName dtb__104) then (((Base_dDiagnostics_dFrontend.v_psErr1At (v_tokSpan st)) (Base_dDiagnostics_dFrontend.C_PsDiag_ExpectedToken ("value name"))) "value name") else (Base_dDiag.C_Check_OkC ({ B_dData_dPair.f_Pair_first = dtb__104; B_dData_dPair.f_Pair_second = (v_advance st) })))
  | _ -> ((Base_dDiagnostics_dFrontend.v_psErr0At (v_tokSpan st)) Base_dDiagnostics_dFrontend.C_PsDiag_ExpectedIdentifier)
)
  | _ -> failwith "DT: impossible branch"
)))

# 443 "Vuna/Compiler/Frontend/Parser/Support.vuna"
let v_closeParenNext = (fun (st : t_PState) -> (let nd_uscrut1 = ((v_peekTokAt st) 1) in (match nd_uscrut1 with
  | B_dData_dMaybe.C_Maybe_Just (dtb__105) -> (match dtb__105 with
  | { Frontend_dLexer.f_PTok_ptokTok = dtb__106; Frontend_dLexer.f_PTok_ptokPos = dtb__107 } -> (match dtb__106 with
  | Frontend_dLexer.C_Tok_TSym (dtb__108) -> (if (dtb__108 = ")") then true else false)
  | _ -> false
)
  | _ -> failwith "DT: impossible branch"
)
  | _ -> false
)))

# 466 "Vuna/Compiler/Frontend/Parser/Support.vuna"
let v_minusLiteralAt = (fun (p : Base_dSource.t_Pos) (st : t_PState) -> (let nd_uscrut2 = ((v_peekTokAt st) 2) in (match nd_uscrut2 with
  | B_dData_dMaybe.C_Maybe_Just (dtb__109) -> (match dtb__109 with
  | { Frontend_dLexer.f_PTok_ptokTok = dtb__110; Frontend_dLexer.f_PTok_ptokPos = dtb__111 } -> (match dtb__110 with
  | Frontend_dLexer.C_Tok_TFloat (dtb__112) -> (if ((Base_dSource.v_posLine dtb__111) = (Base_dSource.v_posLine p)) then ((Base_dSource.v_posCol dtb__111) = ((Base_dSource.v_posCol p) + 1)) else false)
  | Frontend_dLexer.C_Tok_TInt (dtb__113) -> (if ((Base_dSource.v_posLine dtb__111) = (Base_dSource.v_posLine p)) then ((Base_dSource.v_posCol dtb__111) = ((Base_dSource.v_posCol p) + 1)) else false)
  | _ -> false
)
  | _ -> failwith "DT: impossible branch"
)
  | _ -> false
)))

# 452 "Vuna/Compiler/Frontend/Parser/Support.vuna"
let v_sectionOpAt = (fun (st : t_PState) -> (let nd_uscrut1 = ((v_peekTokAt st) 1) in (match nd_uscrut1 with
  | B_dData_dMaybe.C_Maybe_Just (dtb__114) -> (match dtb__114 with
  | { Frontend_dLexer.f_PTok_ptokTok = dtb__115; Frontend_dLexer.f_PTok_ptokPos = dtb__116 } -> (match dtb__115 with
  | Frontend_dLexer.C_Tok_TSym (dtb__117) -> (if (v_isReservedValueName dtb__117) then B_dData_dMaybe.C_Maybe_Nothing else (if (dtb__117 = "?") then (match (v_holeAtomAt (v_advance st)) with
  | B_dData_dMaybe.C_Maybe_Just (dtb__118) -> B_dData_dMaybe.C_Maybe_Nothing
  | B_dData_dMaybe.C_Maybe_Nothing -> (B_dData_dMaybe.C_Maybe_Just (dtb__117))
  | _ -> failwith "DT: impossible branch"
) else (if (if (dtb__117 = "-") then ((v_minusLiteralAt dtb__116) st) else false) then B_dData_dMaybe.C_Maybe_Nothing else (B_dData_dMaybe.C_Maybe_Just (dtb__117)))))
  | _ -> B_dData_dMaybe.C_Maybe_Nothing
)
  | _ -> failwith "DT: impossible branch"
)
  | _ -> B_dData_dMaybe.C_Maybe_Nothing
)))

# 473 "Vuna/Compiler/Frontend/Parser/Support.vuna"
let rec v_countArrows = (fun (mc0 : Frontend_dAst.t_Expr) -> (match mc0 with
  | Frontend_dAst.C_Expr_EApp (dtb__119, dtb__120, dtb__121) -> (match dtb__119 with
  | Frontend_dAst.C_Expr_EVar (dtb__122, dtb__123) -> (if (dtb__122 = "->") then (match dtb__120 with
  | B_dData_dList.C_List__x58__x58_ (dtb__124, dtb__125) -> (match dtb__125 with
  | B_dData_dList.C_List__x58__x58_ (dtb__126, dtb__127) -> (match dtb__127 with
  | B_dData_dList.C_List_Nil -> (1 + (v_countArrows dtb__126))
  | _ -> 0
)
  | _ -> 0
)
  | _ -> 0
) else 0)
  | _ -> 0
)
  | Frontend_dAst.C_Expr_EInfix (dtb__128, dtb__129, dtb__130, dtb__131) -> (if (dtb__128 = "->") then (1 + (v_countArrows dtb__130)) else 0)
  | _ -> 0
))

# 478 "Vuna/Compiler/Frontend/Parser/Support.vuna"
let v_terminatesExpression = (fun (mc0 : Frontend_dLexer.t_PTok) -> (match mc0 with
  | { Frontend_dLexer.f_PTok_ptokTok = dtb__132; Frontend_dLexer.f_PTok_ptokPos = dtb__133 } -> (match dtb__132 with
  | Frontend_dLexer.C_Tok_TKw (dtb__134) -> (if (dtb__134 = "else") then true else (if (dtb__134 = "in") then true else (if (dtb__134 = "then") then true else false)))
  | Frontend_dLexer.C_Tok_TSym (dtb__135) -> (if (dtb__135 = ")") then true else (if (dtb__135 = "]") then true else (if (dtb__135 = ",") then true else false)))
  | _ -> false
)
  | _ -> failwith "DT: impossible branch"
))

# 487 "Vuna/Compiler/Frontend/Parser/Support.vuna"
let v_badCaseIndent = (fun (st : t_PState) (altCol : int) -> (if (v_isEof st) then false else (match (v_peekPos st) with
  | { Base_dSource.f_Pos_posLine = dtb__136; Base_dSource.f_Pos_posCol = dtb__137; Base_dSource.f_Pos_posOffset = dtb__138; Base_dSource.f_Pos_posEndOffset = dtb__139 } -> (if (dtb__137 > altCol) then (if (v_terminatesExpression (v_peekTok st)) then false else true) else false)
  | _ -> failwith "DT: impossible branch"
)))
