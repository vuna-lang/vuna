open Vuna_runtime
type t_ParseMode = C_ParseMode_PmStrict | C_ParseMode_PmTool
and t_PState = { f_PState_fileOf : string; f_PState_sourceOf : string; f_PState_toksOf : Frontend_dLexer.t_PTok B_dData_dList.t_List; f_PState_lastPos : Base_dSource.t_Pos; f_PState_toksLeft : int; f_PState_pmodeOf : t_ParseMode; f_PState_tokIndex : int; f_PState_pendEvents : Frontend_dCst.t_NodeEvent B_dData_dList.t_List; f_PState_nextNodeId : int; f_PState_openNodeId : int; f_PState_subStream : bool; f_PState_backtickShapes : (int, bool) B_dData_dPair.t_Pair B_dData_dList.t_List; f_PState_sectionShapes : (int, Frontend_dCst.t_SectionShape) B_dData_dPair.t_Pair B_dData_dList.t_List; f_PState_interpMultis : (int, bool) B_dData_dPair.t_Pair B_dData_dList.t_List; f_PState_templateHoles : (int, Frontend_dCst.t_CstNode B_dData_dList.t_List) B_dData_dPair.t_Pair B_dData_dList.t_List }

# 65 "Vuna/Compiler/Frontend/Parser/Support.vuna"
let v_fileOf = (fun (st : t_PState) -> (st).f_PState_fileOf)

# 69 "Vuna/Compiler/Frontend/Parser/Support.vuna"
let v_pmodeOf = (fun (st : t_PState) -> (st).f_PState_pmodeOf)

# 73 "Vuna/Compiler/Frontend/Parser/Support.vuna"
let v_mkState = (fun (file : string) (source : string) (toks : Frontend_dLexer.t_PTok B_dData_dList.t_List) (mode : t_ParseMode) -> { f_PState_fileOf = file; f_PState_sourceOf = source; f_PState_toksOf = toks; f_PState_lastPos = { Base_dSource.f_Pos_posLine = 1; Base_dSource.f_Pos_posCol = 0; Base_dSource.f_Pos_posOffset = 0; Base_dSource.f_Pos_posEndOffset = 0 }; f_PState_toksLeft = (B_dData_dList.v_length toks); f_PState_pmodeOf = mode; f_PState_tokIndex = 0; f_PState_pendEvents = B_dData_dList.C_List_Nil; f_PState_nextNodeId = 1; f_PState_openNodeId = 0; f_PState_subStream = false; f_PState_backtickShapes = B_dData_dList.C_List_Nil; f_PState_sectionShapes = B_dData_dList.C_List_Nil; f_PState_interpMultis = B_dData_dList.C_List_Nil; f_PState_templateHoles = B_dData_dList.C_List_Nil })

# 80 "Vuna/Compiler/Frontend/Parser/Support.vuna"
let v_mkStateAt = (fun (file : string) (source : string) (toks : Frontend_dLexer.t_PTok B_dData_dList.t_List) (last : Base_dSource.t_Pos) (count : int) (mode : t_ParseMode) -> { f_PState_fileOf = file; f_PState_sourceOf = source; f_PState_toksOf = toks; f_PState_lastPos = last; f_PState_toksLeft = count; f_PState_pmodeOf = mode; f_PState_tokIndex = 0; f_PState_pendEvents = B_dData_dList.C_List_Nil; f_PState_nextNodeId = (0 - (2 + (Base_dSource.v_posOffset last))); f_PState_openNodeId = 0; f_PState_subStream = true; f_PState_backtickShapes = B_dData_dList.C_List_Nil; f_PState_sectionShapes = B_dData_dList.C_List_Nil; f_PState_interpMultis = B_dData_dList.C_List_Nil; f_PState_templateHoles = B_dData_dList.C_List_Nil })

# 86 "Vuna/Compiler/Frontend/Parser/Support.vuna"
let v_eventsOf = (fun (st : t_PState) -> (B_dData_dList.v_reverse (st).f_PState_pendEvents))

# 108 "Vuna/Compiler/Frontend/Parser/Support.vuna"
let v_addBacktickShape = (fun (nid : int) (st : t_PState) -> { st with f_PState_backtickShapes = (B_dData_dList.C_List__x58__x58_ ({ B_dData_dPair.f_Pair_first = nid; B_dData_dPair.f_Pair_second = true }, (st).f_PState_backtickShapes)) })

# 112 "Vuna/Compiler/Frontend/Parser/Support.vuna"
let v_addSectionShape = (fun (off : int) (shape : Frontend_dCst.t_SectionShape) (st : t_PState) -> { st with f_PState_sectionShapes = (B_dData_dList.C_List__x58__x58_ ({ B_dData_dPair.f_Pair_first = off; B_dData_dPair.f_Pair_second = shape }, (st).f_PState_sectionShapes)) })

# 116 "Vuna/Compiler/Frontend/Parser/Support.vuna"
let v_addInterpMulti = (fun (off : int) (multi : bool) (st : t_PState) -> { st with f_PState_interpMultis = (B_dData_dList.C_List__x58__x58_ ({ B_dData_dPair.f_Pair_first = off; B_dData_dPair.f_Pair_second = multi }, (st).f_PState_interpMultis)) })

# 120 "Vuna/Compiler/Frontend/Parser/Support.vuna"
let v_addTemplateHoles = (fun (nid : int) (trees : Frontend_dCst.t_CstNode B_dData_dList.t_List) (st : t_PState) -> { st with f_PState_templateHoles = (B_dData_dList.C_List__x58__x58_ ({ B_dData_dPair.f_Pair_first = nid; B_dData_dPair.f_Pair_second = trees }, (st).f_PState_templateHoles)) })

# 132 "Vuna/Compiler/Frontend/Parser/Support.vuna"
let rec v_rekeyInfixGo = (fun (mc0 : int) (mc1 : int) (mc2 : (int, bool) B_dData_dPair.t_Pair B_dData_dList.t_List) -> (match mc2 with
  | B_dData_dList.C_List__x58__x58_ (dtb__0, dtb__1) -> (if ((B_dData_dPair.v_firstOf dtb__0) = mc0) then (B_dData_dList.C_List__x58__x58_ ({ B_dData_dPair.f_Pair_first = mc1; B_dData_dPair.f_Pair_second = (B_dData_dPair.v_secondOf dtb__0) }, dtb__1)) else (B_dData_dList.C_List__x58__x58_ (dtb__0, (((v_rekeyInfixGo mc0) mc1) dtb__1))))
  | B_dData_dList.C_List_Nil -> B_dData_dList.C_List_Nil
  | _ -> failwith "DT: impossible branch"
))

# 125 "Vuna/Compiler/Frontend/Parser/Support.vuna"
let v_rekeyInfix = (fun (from : int) (to_ : int) (st : t_PState) -> (if (if (from < 0) then true else (from = to_)) then st else { st with f_PState_backtickShapes = (((v_rekeyInfixGo from) to_) (st).f_PState_backtickShapes) }))

# 138 "Vuna/Compiler/Frontend/Parser/Support.vuna"
let v_closedAt = (fun (st : t_PState) -> { st with f_PState_pendEvents = (B_dData_dList.C_List__x58__x58_ ((Frontend_dCst.C_NodeEvent_EvClose ((st).f_PState_tokIndex)), (st).f_PState_pendEvents)) })

# 94 "Vuna/Compiler/Frontend/Parser/Support.vuna"
let v_withExtent = (fun (kind : Frontend_dCst.t_CstKind) (st : t_PState) k -> (let nid = (st).f_PState_nextNodeId in (let next = (if (st).f_PState_subStream then (nid - 1) else (nid + 1)) in (let opened = { st with f_PState_pendEvents = (B_dData_dList.C_List__x58__x58_ ((Frontend_dCst.C_NodeEvent_EvOpen (kind, (st).f_PState_tokIndex, nid)), (st).f_PState_pendEvents)); f_PState_nextNodeId = next; f_PState_openNodeId = nid } in ((Base_dCommon.v_step (k opened)) (fun v (st1 : t_PState) -> (Base_dDiag.C_Check_OkC ({ B_dData_dPair.f_Pair_first = v; B_dData_dPair.f_Pair_second = (v_closedAt st1) }))))))))

# 143 "Vuna/Compiler/Frontend/Parser/Support.vuna"
let v_withLastPos = (fun (p : Base_dSource.t_Pos) (st : t_PState) -> { st with f_PState_lastPos = p })

# 148 "Vuna/Compiler/Frontend/Parser/Support.vuna"
let v_lastEndCol = (fun (p : Base_dSource.t_Pos) -> ((Base_dSource.v_posCol p) + ((Base_dSource.v_posEndOffset p) - (Base_dSource.v_posOffset p))))

# 197 "Vuna/Compiler/Frontend/Parser/Support.vuna"
let v_peekTok = (fun (st : t_PState) -> (match (st).f_PState_toksOf with
  | B_dData_dList.C_List__x58__x58_ (dtb__2, dtb__3) -> dtb__2
  | B_dData_dList.C_List_Nil -> { Frontend_dLexer.f_PTok_ptokTok = Frontend_dLexer.C_Tok_TEof; Frontend_dLexer.f_PTok_ptokPos = { Base_dSource.f_Pos_posLine = 1; Base_dSource.f_Pos_posCol = 1; Base_dSource.f_Pos_posOffset = 0; Base_dSource.f_Pos_posEndOffset = 0 } }
  | _ -> failwith "DT: impossible branch"
))

# 203 "Vuna/Compiler/Frontend/Parser/Support.vuna"
let v_peekPos = (fun (st : t_PState) -> ((v_peekTok st)).Frontend_dLexer.f_PTok_ptokPos)

# 183 "Vuna/Compiler/Frontend/Parser/Support.vuna"
let v_tokenSpan = (fun (st : t_PState) -> (let p = (v_peekPos st) in (let len = ((Base_dSource.v_posEndOffset p) - (Base_dSource.v_posOffset p)) in { Base_dSource.f_Span_spanFile = (v_fileOf st); Base_dSource.f_Span_spanStartLine = (Base_dSource.v_posLine p); Base_dSource.f_Span_spanStartCol = (Base_dSource.v_posCol p); Base_dSource.f_Span_spanEndLine = (Base_dSource.v_posLine p); Base_dSource.f_Span_spanEndCol = ((Base_dSource.v_posCol p) + len); Base_dSource.f_Span_spanStartOffset = (Base_dSource.v_posOffset p); Base_dSource.f_Span_spanEndOffset = (Base_dSource.v_posEndOffset p) })))

# 218 "Vuna/Compiler/Frontend/Parser/Support.vuna"
let v_lastPos = (fun (st : t_PState) -> (st).f_PState_lastPos)

# 154 "Vuna/Compiler/Frontend/Parser/Support.vuna"
let v_spanOf = (fun (st : t_PState) (st2 : t_PState) -> (let p1 = (v_lastPos st2) in { Base_dSource.f_Span_spanFile = (v_fileOf st); Base_dSource.f_Span_spanStartLine = (Base_dSource.v_posLine (v_peekPos st)); Base_dSource.f_Span_spanStartCol = (Base_dSource.v_posCol (v_peekPos st)); Base_dSource.f_Span_spanEndLine = (Base_dSource.v_posLine p1); Base_dSource.f_Span_spanEndCol = (v_lastEndCol p1); Base_dSource.f_Span_spanStartOffset = (Base_dSource.v_posOffset (v_peekPos st)); Base_dSource.f_Span_spanEndOffset = (Base_dSource.v_posEndOffset p1) }))

# 168 "Vuna/Compiler/Frontend/Parser/Support.vuna"
let v_spanFromStart = (fun (file : string) (start : Base_dSource.t_Pos) (st : t_PState) -> (let p1 = (v_lastPos st) in { Base_dSource.f_Span_spanFile = file; Base_dSource.f_Span_spanStartLine = (Base_dSource.v_posLine start); Base_dSource.f_Span_spanStartCol = (Base_dSource.v_posCol start); Base_dSource.f_Span_spanEndLine = (Base_dSource.v_posLine p1); Base_dSource.f_Span_spanEndCol = (v_lastEndCol p1); Base_dSource.f_Span_spanStartOffset = (Base_dSource.v_posOffset start); Base_dSource.f_Span_spanEndOffset = (Base_dSource.v_posEndOffset p1) }))

# 208 "Vuna/Compiler/Frontend/Parser/Support.vuna"
let v_tokSpan = (fun (st : t_PState) -> (let nd_uscrut1 = (v_peekTok st) in (match nd_uscrut1 with
  | { Frontend_dLexer.f_PTok_ptokTok = dtb__4; Frontend_dLexer.f_PTok_ptokPos = dtb__5 } -> (match dtb__4 with
  | Frontend_dLexer.C_Tok_TEof -> (let p = (v_lastPos st) in { Base_dSource.f_Span_spanFile = (v_fileOf st); Base_dSource.f_Span_spanStartLine = (Base_dSource.v_posLine p); Base_dSource.f_Span_spanStartCol = (Base_dSource.v_posCol p); Base_dSource.f_Span_spanEndLine = (Base_dSource.v_posLine p); Base_dSource.f_Span_spanEndCol = (Base_dSource.v_posCol p); Base_dSource.f_Span_spanStartOffset = (Base_dSource.v_posOffset p); Base_dSource.f_Span_spanEndOffset = (Base_dSource.v_posOffset p) })
  | _ -> { Base_dSource.f_Span_spanFile = (v_fileOf st); Base_dSource.f_Span_spanStartLine = (Base_dSource.v_posLine dtb__5); Base_dSource.f_Span_spanStartCol = (Base_dSource.v_posCol dtb__5); Base_dSource.f_Span_spanEndLine = (Base_dSource.v_posLine dtb__5); Base_dSource.f_Span_spanEndCol = (Base_dSource.v_posCol dtb__5); Base_dSource.f_Span_spanStartOffset = (Base_dSource.v_posOffset dtb__5); Base_dSource.f_Span_spanEndOffset = (Base_dSource.v_posOffset dtb__5) }
)
  | _ -> failwith "DT: impossible branch"
)))

# 221 "Vuna/Compiler/Frontend/Parser/Support.vuna"
let v_advance = (fun (st : t_PState) -> (match (st).f_PState_toksOf with
  | B_dData_dList.C_List__x58__x58_ (dtb__6, dtb__7) -> (let nd_uscrut4 = dtb__6 in (match nd_uscrut4 with
  | { Frontend_dLexer.f_PTok_ptokTok = dtb__8; Frontend_dLexer.f_PTok_ptokPos = dtb__9 } -> (match dtb__8 with
  | Frontend_dLexer.C_Tok_TEof -> st
  | _ -> { st with f_PState_toksOf = dtb__7; f_PState_lastPos = (dtb__6).Frontend_dLexer.f_PTok_ptokPos; f_PState_toksLeft = (if ((st).f_PState_toksLeft > 0) then ((st).f_PState_toksLeft - 1) else 0); f_PState_tokIndex = ((st).f_PState_tokIndex + 1) }
)
  | _ -> failwith "DT: impossible branch"
))
  | B_dData_dList.C_List_Nil -> st
  | _ -> failwith "DT: impossible branch"
))

# 236 "Vuna/Compiler/Frontend/Parser/Support.vuna"
let v_isEof = (fun (st : t_PState) -> (let nd_uscrut1 = (v_peekTok st) in (match nd_uscrut1 with
  | { Frontend_dLexer.f_PTok_ptokTok = dtb__10; Frontend_dLexer.f_PTok_ptokPos = dtb__11 } -> (match dtb__10 with
  | Frontend_dLexer.C_Tok_TEof -> true
  | _ -> false
)
  | _ -> failwith "DT: impossible branch"
)))

# 265 "Vuna/Compiler/Frontend/Parser/Support.vuna"
let v_stateFuel = (fun (st : t_PState) -> ((128 * (st).f_PState_toksLeft) + 1024))

# 268 "Vuna/Compiler/Frontend/Parser/Support.vuna"
let v_sameLineState = (fun (st : t_PState) -> (match (v_peekPos st) with
  | { Base_dSource.f_Pos_posLine = dtb__12; Base_dSource.f_Pos_posCol = dtb__13; Base_dSource.f_Pos_posOffset = dtb__14; Base_dSource.f_Pos_posEndOffset = dtb__15 } -> { st with f_PState_lastPos = { Base_dSource.f_Pos_posLine = dtb__12; Base_dSource.f_Pos_posCol = 0; Base_dSource.f_Pos_posOffset = 0; Base_dSource.f_Pos_posEndOffset = 0 } }
  | _ -> failwith "DT: impossible branch"
))

# 273 "Vuna/Compiler/Frontend/Parser/Support.vuna"
let v_atSym = (fun (st : t_PState) (s : string) -> (let nd_uscrut2 = (v_peekTok st) in (match nd_uscrut2 with
  | { Frontend_dLexer.f_PTok_ptokTok = dtb__16; Frontend_dLexer.f_PTok_ptokPos = dtb__17 } -> (match dtb__16 with
  | Frontend_dLexer.C_Tok_TSym (dtb__18) -> (dtb__18 = s)
  | _ -> false
)
  | _ -> failwith "DT: impossible branch"
)))

# 280 "Vuna/Compiler/Frontend/Parser/Support.vuna"
let rec v_nthTok = (fun (mc0 : Frontend_dLexer.t_PTok B_dData_dList.t_List) (mc1 : int) -> (match mc0 with
  | B_dData_dList.C_List__x58__x58_ (dtb__19, dtb__20) -> (if (mc1 <= 0) then (B_dData_dMaybe.C_Maybe_Just (dtb__19)) else ((v_nthTok dtb__20) (mc1 - 1)))
  | B_dData_dList.C_List_Nil -> B_dData_dMaybe.C_Maybe_Nothing
  | _ -> failwith "DT: impossible branch"
))

# 284 "Vuna/Compiler/Frontend/Parser/Support.vuna"
let v_peekTokAt = (fun (st : t_PState) (n : int) -> ((v_nthTok (st).f_PState_toksOf) n))

# 302 "Vuna/Compiler/Frontend/Parser/Support.vuna"
let v_tokTail = (fun (mc0 : Frontend_dLexer.t_PTok B_dData_dList.t_List) -> (match mc0 with
  | B_dData_dList.C_List__x58__x58_ (dtb__21, dtb__22) -> dtb__22
  | B_dData_dList.C_List_Nil -> B_dData_dList.C_List_Nil
  | _ -> failwith "DT: impossible branch"
))

# 307 "Vuna/Compiler/Frontend/Parser/Support.vuna"
let rec v_binderNameTail = (fun (mc0 : Frontend_dLexer.t_PTok B_dData_dList.t_List) (mc1 : string B_dData_dList.t_List) -> (match mc0 with
  | B_dData_dList.C_List__x58__x58_ (dtb__23, dtb__24) -> (let nd_uscrut5 = dtb__23 in (match nd_uscrut5 with
  | { Frontend_dLexer.f_PTok_ptokTok = dtb__25; Frontend_dLexer.f_PTok_ptokPos = dtb__26 } -> (match dtb__25 with
  | Frontend_dLexer.C_Tok_TSym (dtb__27) -> (if (dtb__27 = ":") then (B_dData_dMaybe.C_Maybe_Just ((B_dData_dList.v_reverse mc1))) else B_dData_dMaybe.C_Maybe_Nothing)
  | Frontend_dLexer.C_Tok_TIdent (dtb__28) -> ((v_binderNameTail dtb__24) (B_dData_dList.C_List__x58__x58_ (dtb__28, mc1)))
  | _ -> B_dData_dMaybe.C_Maybe_Nothing
)
  | _ -> failwith "DT: impossible branch"
))
  | B_dData_dList.C_List_Nil -> B_dData_dMaybe.C_Maybe_Nothing
  | _ -> failwith "DT: impossible branch"
))

# 315 "Vuna/Compiler/Frontend/Parser/Support.vuna"
let v_quantifiedHead = (fun (st : t_PState) (q : Frontend_dAst.t_Qty) -> (let nd_uscrut2 = ((v_peekTokAt st) 1) in (match nd_uscrut2 with
  | B_dData_dMaybe.C_Maybe_Just (dtb__29) -> (match dtb__29 with
  | { Frontend_dLexer.f_PTok_ptokTok = dtb__30; Frontend_dLexer.f_PTok_ptokPos = dtb__31 } -> (match dtb__30 with
  | Frontend_dLexer.C_Tok_TIdent (dtb__32) -> (match ((v_binderNameTail (v_tokTail (v_tokTail (st).f_PState_toksOf))) B_dData_dList.C_List_Nil) with
  | B_dData_dMaybe.C_Maybe_Just (dtb__33) -> (B_dData_dMaybe.C_Maybe_Just ({ B_dData_dPair.f_Pair_first = (B_dData_dMaybe.C_Maybe_Just (q)); B_dData_dPair.f_Pair_second = (B_dData_dList.C_List__x58__x58_ (dtb__32, dtb__33)) }))
  | B_dData_dMaybe.C_Maybe_Nothing -> B_dData_dMaybe.C_Maybe_Nothing
  | _ -> failwith "DT: impossible branch"
)
  | _ -> B_dData_dMaybe.C_Maybe_Nothing
)
  | _ -> failwith "DT: impossible branch"
)
  | _ -> B_dData_dMaybe.C_Maybe_Nothing
)))

# 290 "Vuna/Compiler/Frontend/Parser/Support.vuna"
let v_binderHead = (fun (st : t_PState) -> (let nd_uscrut1 = (v_peekTok st) in (match nd_uscrut1 with
  | { Frontend_dLexer.f_PTok_ptokTok = dtb__34; Frontend_dLexer.f_PTok_ptokPos = dtb__35 } -> (match dtb__34 with
  | Frontend_dLexer.C_Tok_TInt (dtb__36) -> (if (dtb__36 = 0) then ((v_quantifiedHead st) Frontend_dAst.C_Qty_Q0) else (if (dtb__36 = 1) then ((v_quantifiedHead st) Frontend_dAst.C_Qty_Q1) else B_dData_dMaybe.C_Maybe_Nothing))
  | Frontend_dLexer.C_Tok_TIdent (dtb__37) -> (match ((v_binderNameTail (v_tokTail (st).f_PState_toksOf)) B_dData_dList.C_List_Nil) with
  | B_dData_dMaybe.C_Maybe_Just (dtb__38) -> (B_dData_dMaybe.C_Maybe_Just ({ B_dData_dPair.f_Pair_first = B_dData_dMaybe.C_Maybe_Nothing; B_dData_dPair.f_Pair_second = (B_dData_dList.C_List__x58__x58_ (dtb__37, dtb__38)) }))
  | B_dData_dMaybe.C_Maybe_Nothing -> B_dData_dMaybe.C_Maybe_Nothing
  | _ -> failwith "DT: impossible branch"
)
  | _ -> B_dData_dMaybe.C_Maybe_Nothing
)
  | _ -> failwith "DT: impossible branch"
)))

# 337 "Vuna/Compiler/Frontend/Parser/Support.vuna"
let v_arrowAt = (fun (mc0 : Frontend_dLexer.t_PTok B_dData_dList.t_List) -> (match mc0 with
  | B_dData_dList.C_List__x58__x58_ (dtb__39, dtb__40) -> (match dtb__39 with
  | { Frontend_dLexer.f_PTok_ptokTok = dtb__41; Frontend_dLexer.f_PTok_ptokPos = dtb__42 } -> (match dtb__41 with
  | Frontend_dLexer.C_Tok_TSym (dtb__43) -> (if (dtb__43 = "->") then true else false)
  | _ -> false
)
  | _ -> failwith "DT: impossible branch"
)
  | _ -> false
))

# 330 "Vuna/Compiler/Frontend/Parser/Support.vuna"
let rec v_piArrowAheadGo = (fun (mc0 : int) (mc1 : Frontend_dLexer.t_PTok B_dData_dList.t_List) -> (match mc1 with
  | B_dData_dList.C_List__x58__x58_ (dtb__44, dtb__45) -> (match dtb__44 with
  | { Frontend_dLexer.f_PTok_ptokTok = dtb__46; Frontend_dLexer.f_PTok_ptokPos = dtb__47 } -> (match dtb__46 with
  | Frontend_dLexer.C_Tok_TSym (dtb__48) -> (if (dtb__48 = "(") then ((v_piArrowAheadGo (mc0 + 1)) dtb__45) else (if (dtb__48 = ")") then (if (mc0 = 1) then (v_arrowAt dtb__45) else ((v_piArrowAheadGo (mc0 - 1)) dtb__45)) else ((v_piArrowAheadGo mc0) dtb__45)))
  | _ -> ((v_piArrowAheadGo mc0) dtb__45)
)
  | _ -> failwith "DT: impossible branch"
)
  | B_dData_dList.C_List_Nil -> false
  | _ -> failwith "DT: impossible branch"
))

# 327 "Vuna/Compiler/Frontend/Parser/Support.vuna"
let v_piArrowAhead = (fun (st : t_PState) -> ((v_piArrowAheadGo 1) (st).f_PState_toksOf))

# 341 "Vuna/Compiler/Frontend/Parser/Support.vuna"
let v_atKw = (fun (st : t_PState) (k : string) -> (let nd_uscrut2 = (v_peekTok st) in (match nd_uscrut2 with
  | { Frontend_dLexer.f_PTok_ptokTok = dtb__49; Frontend_dLexer.f_PTok_ptokPos = dtb__50 } -> (match dtb__49 with
  | Frontend_dLexer.C_Tok_TKw (dtb__51) -> (dtb__51 = k)
  | _ -> false
)
  | _ -> failwith "DT: impossible branch"
)))

# 347 "Vuna/Compiler/Frontend/Parser/Support.vuna"
let v_canContinue = (fun (st : t_PState) (blockCol : int) -> (match (v_peekPos st) with
  | { Base_dSource.f_Pos_posLine = dtb__52; Base_dSource.f_Pos_posCol = dtb__53; Base_dSource.f_Pos_posOffset = dtb__54; Base_dSource.f_Pos_posEndOffset = dtb__55 } -> (match (v_lastPos st) with
  | { Base_dSource.f_Pos_posLine = dtb__56; Base_dSource.f_Pos_posCol = dtb__57; Base_dSource.f_Pos_posOffset = dtb__58; Base_dSource.f_Pos_posEndOffset = dtb__59 } -> (if (dtb__52 = dtb__56) then true else (dtb__53 > blockCol))
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
))

# 356 "Vuna/Compiler/Frontend/Parser/Support.vuna"
let v_expectSym = (fun (st : t_PState) (s : string) -> (let nd_uscrut2 = (v_peekTok st) in (match nd_uscrut2 with
  | { Frontend_dLexer.f_PTok_ptokTok = dtb__60; Frontend_dLexer.f_PTok_ptokPos = dtb__61 } -> (match dtb__60 with
  | Frontend_dLexer.C_Tok_TSym (dtb__62) -> (if (dtb__62 = s) then (Base_dDiag.C_Check_OkC ((v_advance st))) else (((Base_dDiagnostics_dFrontend.v_psErr1At (v_tokSpan st)) (Base_dDiagnostics_dFrontend.C_PsDiag_ExpectedToken (s))) s))
  | _ -> (((Base_dDiagnostics_dFrontend.v_psErr1At (v_tokSpan st)) (Base_dDiagnostics_dFrontend.C_PsDiag_ExpectedToken (s))) s)
)
  | _ -> failwith "DT: impossible branch"
)))

# 363 "Vuna/Compiler/Frontend/Parser/Support.vuna"
let v_expectKw = (fun (st : t_PState) (k : string) -> (let nd_uscrut2 = (v_peekTok st) in (match nd_uscrut2 with
  | { Frontend_dLexer.f_PTok_ptokTok = dtb__63; Frontend_dLexer.f_PTok_ptokPos = dtb__64 } -> (match dtb__63 with
  | Frontend_dLexer.C_Tok_TKw (dtb__65) -> (if (dtb__65 = k) then (Base_dDiag.C_Check_OkC ((v_advance st))) else (((Base_dDiagnostics_dFrontend.v_psErr1At (v_tokSpan st)) (Base_dDiagnostics_dFrontend.C_PsDiag_ExpectedToken (k))) k))
  | _ -> (((Base_dDiagnostics_dFrontend.v_psErr1At (v_tokSpan st)) (Base_dDiagnostics_dFrontend.C_PsDiag_ExpectedToken (k))) k)
)
  | _ -> failwith "DT: impossible branch"
)))

# 369 "Vuna/Compiler/Frontend/Parser/Support.vuna"
let v_expectIdent = (fun (st : t_PState) -> (let nd_uscrut1 = (v_peekTok st) in (match nd_uscrut1 with
  | { Frontend_dLexer.f_PTok_ptokTok = dtb__66; Frontend_dLexer.f_PTok_ptokPos = dtb__67 } -> (match dtb__66 with
  | Frontend_dLexer.C_Tok_TIdent (dtb__68) -> (Base_dDiag.C_Check_OkC ({ B_dData_dPair.f_Pair_first = dtb__68; B_dData_dPair.f_Pair_second = (v_advance st) }))
  | _ -> ((Base_dDiagnostics_dFrontend.v_psErr0At (v_tokSpan st)) Base_dDiagnostics_dFrontend.C_PsDiag_ExpectedIdentifier)
)
  | _ -> failwith "DT: impossible branch"
)))

# 392 "Vuna/Compiler/Frontend/Parser/Support.vuna"
let v_upperFirst = (fun (s : string) -> (match (B_dData_dList.dtp_unpack s) with
  | B_dData_dList.C_List__x58__x58_ (dtb__69, dtb__70) -> (if (dtb__69 >= 65) then (dtb__69 <= 90) else false)
  | B_dData_dList.C_List_Nil -> false
  | _ -> failwith "DT: impossible branch"
))

# 400 "Vuna/Compiler/Frontend/Parser/Support.vuna"
let v_underscoreCtorName = (fun (s : string) -> (match (B_dData_dList.dtp_unpack s) with
  | B_dData_dList.C_List__x58__x58_ (dtb__71, dtb__72) -> (if (dtb__71 = 95) then (match dtb__72 with
  | B_dData_dList.C_List__x58__x58_ (dtb__73, dtb__74) -> (if (dtb__73 >= 65) then (dtb__73 <= 90) else false)
  | B_dData_dList.C_List_Nil -> false
  | _ -> failwith "DT: impossible branch"
) else false)
  | B_dData_dList.C_List_Nil -> false
  | _ -> failwith "DT: impossible branch"
))

# 412 "Vuna/Compiler/Frontend/Parser/Support.vuna"
let v_ctorPatternStart = (fun (name : string) -> (if (v_upperFirst name) then true else (v_underscoreCtorName name)))

# 435 "Vuna/Compiler/Frontend/Parser/Support.vuna"
let v_holeAtomAt = (fun (st : t_PState) -> (let nd_uscrut1 = (v_peekTok st) in (match nd_uscrut1 with
  | { Frontend_dLexer.f_PTok_ptokTok = dtb__75; Frontend_dLexer.f_PTok_ptokPos = dtb__76 } -> (match dtb__75 with
  | Frontend_dLexer.C_Tok_TSym (dtb__77) -> (if (dtb__77 = "?") then (let nd_uscrut5 = ((v_peekTokAt st) 1) in (match nd_uscrut5 with
  | B_dData_dMaybe.C_Maybe_Just (dtb__78) -> (match dtb__78 with
  | { Frontend_dLexer.f_PTok_ptokTok = dtb__79; Frontend_dLexer.f_PTok_ptokPos = dtb__80 } -> (match dtb__79 with
  | Frontend_dLexer.C_Tok_TIdent (dtb__81) -> (if (if ((Base_dSource.v_posLine dtb__80) = (Base_dSource.v_posLine dtb__76)) then ((Base_dSource.v_posCol dtb__80) = ((Base_dSource.v_posCol dtb__76) + 1)) else false) then (B_dData_dMaybe.C_Maybe_Just ({ B_dData_dPair.f_Pair_first = ("?" ^ dtb__81); B_dData_dPair.f_Pair_second = { Base_dSource.f_Span_spanFile = (v_fileOf st); Base_dSource.f_Span_spanStartLine = (Base_dSource.v_posLine dtb__76); Base_dSource.f_Span_spanStartCol = (Base_dSource.v_posCol dtb__76); Base_dSource.f_Span_spanEndLine = (Base_dSource.v_posLine dtb__80); Base_dSource.f_Span_spanEndCol = ((Base_dSource.v_posCol dtb__80) + (bi_strLength dtb__81)); Base_dSource.f_Span_spanStartOffset = (Base_dSource.v_posOffset dtb__76); Base_dSource.f_Span_spanEndOffset = ((Base_dSource.v_posOffset dtb__80) + (bi_strLength dtb__81)) } })) else B_dData_dMaybe.C_Maybe_Nothing)
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

# 415 "Vuna/Compiler/Frontend/Parser/Support.vuna"
let v_startsAtom = (fun (st : t_PState) -> (let nd_uscrut1 = (v_peekTok st) in (match nd_uscrut1 with
  | { Frontend_dLexer.f_PTok_ptokTok = dtb__82; Frontend_dLexer.f_PTok_ptokPos = dtb__83 } -> (match dtb__82 with
  | Frontend_dLexer.C_Tok_TSym (dtb__84) -> (if (dtb__84 = "(") then true else (if (dtb__84 = "[") then true else (if (dtb__84 = "?") then (match (v_holeAtomAt st) with
  | B_dData_dMaybe.C_Maybe_Just (dtb__85) -> true
  | B_dData_dMaybe.C_Maybe_Nothing -> false
  | _ -> failwith "DT: impossible branch"
) else false)))
  | Frontend_dLexer.C_Tok_TKw (dtb__86) -> (if (dtb__86 = "Type") then true else false)
  | Frontend_dLexer.C_Tok_TTmpl (dtb__87, dtb__88, dtb__89) -> true
  | Frontend_dLexer.C_Tok_TStr (dtb__90) -> true
  | Frontend_dLexer.C_Tok_TFloat (dtb__91) -> true
  | Frontend_dLexer.C_Tok_TInt (dtb__92) -> true
  | Frontend_dLexer.C_Tok_TIdent (dtb__93) -> true
  | _ -> false
)
  | _ -> failwith "DT: impossible branch"
)))

# 449 "Vuna/Compiler/Frontend/Parser/Support.vuna"
let v_startsPatternAtom = (fun (st : t_PState) -> (let nd_uscrut1 = (v_peekTok st) in (match nd_uscrut1 with
  | { Frontend_dLexer.f_PTok_ptokTok = dtb__94; Frontend_dLexer.f_PTok_ptokPos = dtb__95 } -> (match dtb__94 with
  | Frontend_dLexer.C_Tok_TSym (dtb__96) -> (if (dtb__96 = "(") then true else (if (dtb__96 = "[") then true else false))
  | Frontend_dLexer.C_Tok_TTmpl (dtb__97, dtb__98, dtb__99) -> true
  | Frontend_dLexer.C_Tok_TStr (dtb__100) -> true
  | Frontend_dLexer.C_Tok_TInt (dtb__101) -> true
  | Frontend_dLexer.C_Tok_TIdent (dtb__102) -> true
  | _ -> false
)
  | _ -> failwith "DT: impossible branch"
)))

# 462 "Vuna/Compiler/Frontend/Parser/Support.vuna"
let v_isSyntaxSym = (fun (op : string) -> (if (op = "=") then true else (if (op = ":") then true else (if (op = ",") then true else (if (op = ";") then true else (if (op = "|") then true else (if (op = "=>") then true else (if (op = "<-") then true else (if (op = "\\") then true else (if (op = ".") then true else (if (op = "..") then true else (if (op = "@") then true else (if (op = "(") then true else (if (op = ")") then true else (if (op = "[") then true else (if (op = "]") then true else (if (op = "{") then true else (if (op = "}") then true else false))))))))))))))))))

# 489 "Vuna/Compiler/Frontend/Parser/Support.vuna"
let v_isReservedValueName = (fun (name : string) -> (if (if (v_isSyntaxSym name) then true else (name = "->")) then true else (name = "`")))

# 377 "Vuna/Compiler/Frontend/Parser/Support.vuna"
let v_expectValueName = (fun (st : t_PState) -> (let nd_uscrut1 = (v_peekTok st) in (match nd_uscrut1 with
  | { Frontend_dLexer.f_PTok_ptokTok = dtb__103; Frontend_dLexer.f_PTok_ptokPos = dtb__104 } -> (match dtb__103 with
  | Frontend_dLexer.C_Tok_TSym (dtb__105) -> (if (v_isReservedValueName dtb__105) then (((Base_dDiagnostics_dFrontend.v_psErr1At (v_tokSpan st)) (Base_dDiagnostics_dFrontend.C_PsDiag_ExpectedToken ("value name"))) "value name") else (Base_dDiag.C_Check_OkC ({ B_dData_dPair.f_Pair_first = dtb__105; B_dData_dPair.f_Pair_second = (v_advance st) })))
  | Frontend_dLexer.C_Tok_TIdent (dtb__106) -> (if (v_isReservedValueName dtb__106) then (((Base_dDiagnostics_dFrontend.v_psErr1At (v_tokSpan st)) (Base_dDiagnostics_dFrontend.C_PsDiag_ExpectedToken ("value name"))) "value name") else (Base_dDiag.C_Check_OkC ({ B_dData_dPair.f_Pair_first = dtb__106; B_dData_dPair.f_Pair_second = (v_advance st) })))
  | _ -> ((Base_dDiagnostics_dFrontend.v_psErr0At (v_tokSpan st)) Base_dDiagnostics_dFrontend.C_PsDiag_ExpectedIdentifier)
)
  | _ -> failwith "DT: impossible branch"
)))

# 494 "Vuna/Compiler/Frontend/Parser/Support.vuna"
let v_closeParenNext = (fun (st : t_PState) -> (let nd_uscrut1 = ((v_peekTokAt st) 1) in (match nd_uscrut1 with
  | B_dData_dMaybe.C_Maybe_Just (dtb__107) -> (match dtb__107 with
  | { Frontend_dLexer.f_PTok_ptokTok = dtb__108; Frontend_dLexer.f_PTok_ptokPos = dtb__109 } -> (match dtb__108 with
  | Frontend_dLexer.C_Tok_TSym (dtb__110) -> (if (dtb__110 = ")") then true else false)
  | _ -> false
)
  | _ -> failwith "DT: impossible branch"
)
  | _ -> false
)))

# 517 "Vuna/Compiler/Frontend/Parser/Support.vuna"
let v_minusLiteralAt = (fun (p : Base_dSource.t_Pos) (st : t_PState) -> (let nd_uscrut2 = ((v_peekTokAt st) 2) in (match nd_uscrut2 with
  | B_dData_dMaybe.C_Maybe_Just (dtb__111) -> (match dtb__111 with
  | { Frontend_dLexer.f_PTok_ptokTok = dtb__112; Frontend_dLexer.f_PTok_ptokPos = dtb__113 } -> (match dtb__112 with
  | Frontend_dLexer.C_Tok_TFloat (dtb__114) -> (if ((Base_dSource.v_posLine dtb__113) = (Base_dSource.v_posLine p)) then ((Base_dSource.v_posCol dtb__113) = ((Base_dSource.v_posCol p) + 1)) else false)
  | Frontend_dLexer.C_Tok_TInt (dtb__115) -> (if ((Base_dSource.v_posLine dtb__113) = (Base_dSource.v_posLine p)) then ((Base_dSource.v_posCol dtb__113) = ((Base_dSource.v_posCol p) + 1)) else false)
  | _ -> false
)
  | _ -> failwith "DT: impossible branch"
)
  | _ -> false
)))

# 503 "Vuna/Compiler/Frontend/Parser/Support.vuna"
let v_sectionOpAt = (fun (st : t_PState) -> (let nd_uscrut1 = ((v_peekTokAt st) 1) in (match nd_uscrut1 with
  | B_dData_dMaybe.C_Maybe_Just (dtb__116) -> (match dtb__116 with
  | { Frontend_dLexer.f_PTok_ptokTok = dtb__117; Frontend_dLexer.f_PTok_ptokPos = dtb__118 } -> (match dtb__117 with
  | Frontend_dLexer.C_Tok_TSym (dtb__119) -> (if (v_isReservedValueName dtb__119) then B_dData_dMaybe.C_Maybe_Nothing else (if (dtb__119 = "?") then (match (v_holeAtomAt (v_advance st)) with
  | B_dData_dMaybe.C_Maybe_Just (dtb__120) -> B_dData_dMaybe.C_Maybe_Nothing
  | B_dData_dMaybe.C_Maybe_Nothing -> (B_dData_dMaybe.C_Maybe_Just (dtb__119))
  | _ -> failwith "DT: impossible branch"
) else (if (if (dtb__119 = "-") then ((v_minusLiteralAt dtb__118) st) else false) then B_dData_dMaybe.C_Maybe_Nothing else (B_dData_dMaybe.C_Maybe_Just (dtb__119)))))
  | _ -> B_dData_dMaybe.C_Maybe_Nothing
)
  | _ -> failwith "DT: impossible branch"
)
  | _ -> B_dData_dMaybe.C_Maybe_Nothing
)))

# 524 "Vuna/Compiler/Frontend/Parser/Support.vuna"
let rec v_countArrows = (fun (mc0 : Frontend_dAst.t_Expr) -> (match mc0 with
  | Frontend_dAst.C_Expr_EApp (dtb__121, dtb__122, dtb__123) -> (match dtb__121 with
  | Frontend_dAst.C_Expr_EVar (dtb__124, dtb__125) -> (if (dtb__124 = "->") then (match dtb__122 with
  | B_dData_dList.C_List__x58__x58_ (dtb__126, dtb__127) -> (match dtb__127 with
  | B_dData_dList.C_List__x58__x58_ (dtb__128, dtb__129) -> (match dtb__129 with
  | B_dData_dList.C_List_Nil -> (1 + (v_countArrows dtb__128))
  | _ -> 0
)
  | _ -> 0
)
  | _ -> 0
) else 0)
  | _ -> 0
)
  | _ -> 0
))

# 528 "Vuna/Compiler/Frontend/Parser/Support.vuna"
let v_terminatesExpression = (fun (mc0 : Frontend_dLexer.t_PTok) -> (match mc0 with
  | { Frontend_dLexer.f_PTok_ptokTok = dtb__130; Frontend_dLexer.f_PTok_ptokPos = dtb__131 } -> (match dtb__130 with
  | Frontend_dLexer.C_Tok_TKw (dtb__132) -> (if (dtb__132 = "else") then true else (if (dtb__132 = "in") then true else (if (dtb__132 = "then") then true else false)))
  | Frontend_dLexer.C_Tok_TSym (dtb__133) -> (if (dtb__133 = ")") then true else (if (dtb__133 = "]") then true else (if (dtb__133 = ",") then true else false)))
  | _ -> false
)
  | _ -> failwith "DT: impossible branch"
))

# 537 "Vuna/Compiler/Frontend/Parser/Support.vuna"
let v_badCaseIndent = (fun (st : t_PState) (altCol : int) -> (if (v_isEof st) then false else (match (v_peekPos st) with
  | { Base_dSource.f_Pos_posLine = dtb__134; Base_dSource.f_Pos_posCol = dtb__135; Base_dSource.f_Pos_posOffset = dtb__136; Base_dSource.f_Pos_posEndOffset = dtb__137 } -> (if (dtb__135 > altCol) then (if (v_terminatesExpression (v_peekTok st)) then false else true) else false)
  | _ -> failwith "DT: impossible branch"
)))

# 30 "Vuna/Compiler/Frontend/Parser/Support.vuna"
let v_sourceOf = (fun (p : t_PState) -> (match p with
  | { f_PState_fileOf = dtb__138; f_PState_sourceOf = dtb__139; f_PState_toksOf = dtb__140; f_PState_lastPos = dtb__141; f_PState_toksLeft = dtb__142; f_PState_pmodeOf = dtb__143; f_PState_tokIndex = dtb__144; f_PState_pendEvents = dtb__145; f_PState_nextNodeId = dtb__146; f_PState_openNodeId = dtb__147; f_PState_subStream = dtb__148; f_PState_backtickShapes = dtb__149; f_PState_sectionShapes = dtb__150; f_PState_interpMultis = dtb__151; f_PState_templateHoles = dtb__152 } -> dtb__139
  | _ -> failwith "DT: impossible branch"
))

# 31 "Vuna/Compiler/Frontend/Parser/Support.vuna"
let v_toksOf = (fun (p : t_PState) -> (match p with
  | { f_PState_fileOf = dtb__153; f_PState_sourceOf = dtb__154; f_PState_toksOf = dtb__155; f_PState_lastPos = dtb__156; f_PState_toksLeft = dtb__157; f_PState_pmodeOf = dtb__158; f_PState_tokIndex = dtb__159; f_PState_pendEvents = dtb__160; f_PState_nextNodeId = dtb__161; f_PState_openNodeId = dtb__162; f_PState_subStream = dtb__163; f_PState_backtickShapes = dtb__164; f_PState_sectionShapes = dtb__165; f_PState_interpMultis = dtb__166; f_PState_templateHoles = dtb__167 } -> dtb__155
  | _ -> failwith "DT: impossible branch"
))

# 33 "Vuna/Compiler/Frontend/Parser/Support.vuna"
let v_toksLeft = (fun (p : t_PState) -> (match p with
  | { f_PState_fileOf = dtb__168; f_PState_sourceOf = dtb__169; f_PState_toksOf = dtb__170; f_PState_lastPos = dtb__171; f_PState_toksLeft = dtb__172; f_PState_pmodeOf = dtb__173; f_PState_tokIndex = dtb__174; f_PState_pendEvents = dtb__175; f_PState_nextNodeId = dtb__176; f_PState_openNodeId = dtb__177; f_PState_subStream = dtb__178; f_PState_backtickShapes = dtb__179; f_PState_sectionShapes = dtb__180; f_PState_interpMultis = dtb__181; f_PState_templateHoles = dtb__182 } -> dtb__172
  | _ -> failwith "DT: impossible branch"
))

# 35 "Vuna/Compiler/Frontend/Parser/Support.vuna"
let v_tokIndex = (fun (p : t_PState) -> (match p with
  | { f_PState_fileOf = dtb__183; f_PState_sourceOf = dtb__184; f_PState_toksOf = dtb__185; f_PState_lastPos = dtb__186; f_PState_toksLeft = dtb__187; f_PState_pmodeOf = dtb__188; f_PState_tokIndex = dtb__189; f_PState_pendEvents = dtb__190; f_PState_nextNodeId = dtb__191; f_PState_openNodeId = dtb__192; f_PState_subStream = dtb__193; f_PState_backtickShapes = dtb__194; f_PState_sectionShapes = dtb__195; f_PState_interpMultis = dtb__196; f_PState_templateHoles = dtb__197 } -> dtb__189
  | _ -> failwith "DT: impossible branch"
))

# 36 "Vuna/Compiler/Frontend/Parser/Support.vuna"
let v_pendEvents = (fun (p : t_PState) -> (match p with
  | { f_PState_fileOf = dtb__198; f_PState_sourceOf = dtb__199; f_PState_toksOf = dtb__200; f_PState_lastPos = dtb__201; f_PState_toksLeft = dtb__202; f_PState_pmodeOf = dtb__203; f_PState_tokIndex = dtb__204; f_PState_pendEvents = dtb__205; f_PState_nextNodeId = dtb__206; f_PState_openNodeId = dtb__207; f_PState_subStream = dtb__208; f_PState_backtickShapes = dtb__209; f_PState_sectionShapes = dtb__210; f_PState_interpMultis = dtb__211; f_PState_templateHoles = dtb__212 } -> dtb__205
  | _ -> failwith "DT: impossible branch"
))

# 39 "Vuna/Compiler/Frontend/Parser/Support.vuna"
let v_nextNodeId = (fun (p : t_PState) -> (match p with
  | { f_PState_fileOf = dtb__213; f_PState_sourceOf = dtb__214; f_PState_toksOf = dtb__215; f_PState_lastPos = dtb__216; f_PState_toksLeft = dtb__217; f_PState_pmodeOf = dtb__218; f_PState_tokIndex = dtb__219; f_PState_pendEvents = dtb__220; f_PState_nextNodeId = dtb__221; f_PState_openNodeId = dtb__222; f_PState_subStream = dtb__223; f_PState_backtickShapes = dtb__224; f_PState_sectionShapes = dtb__225; f_PState_interpMultis = dtb__226; f_PState_templateHoles = dtb__227 } -> dtb__221
  | _ -> failwith "DT: impossible branch"
))

# 42 "Vuna/Compiler/Frontend/Parser/Support.vuna"
let v_openNodeId = (fun (p : t_PState) -> (match p with
  | { f_PState_fileOf = dtb__228; f_PState_sourceOf = dtb__229; f_PState_toksOf = dtb__230; f_PState_lastPos = dtb__231; f_PState_toksLeft = dtb__232; f_PState_pmodeOf = dtb__233; f_PState_tokIndex = dtb__234; f_PState_pendEvents = dtb__235; f_PState_nextNodeId = dtb__236; f_PState_openNodeId = dtb__237; f_PState_subStream = dtb__238; f_PState_backtickShapes = dtb__239; f_PState_sectionShapes = dtb__240; f_PState_interpMultis = dtb__241; f_PState_templateHoles = dtb__242 } -> dtb__237
  | _ -> failwith "DT: impossible branch"
))

# 47 "Vuna/Compiler/Frontend/Parser/Support.vuna"
let v_subStream = (fun (p : t_PState) -> (match p with
  | { f_PState_fileOf = dtb__243; f_PState_sourceOf = dtb__244; f_PState_toksOf = dtb__245; f_PState_lastPos = dtb__246; f_PState_toksLeft = dtb__247; f_PState_pmodeOf = dtb__248; f_PState_tokIndex = dtb__249; f_PState_pendEvents = dtb__250; f_PState_nextNodeId = dtb__251; f_PState_openNodeId = dtb__252; f_PState_subStream = dtb__253; f_PState_backtickShapes = dtb__254; f_PState_sectionShapes = dtb__255; f_PState_interpMultis = dtb__256; f_PState_templateHoles = dtb__257 } -> dtb__253
  | _ -> failwith "DT: impossible branch"
))

# 50 "Vuna/Compiler/Frontend/Parser/Support.vuna"
let v_backtickShapes = (fun (p : t_PState) -> (match p with
  | { f_PState_fileOf = dtb__258; f_PState_sourceOf = dtb__259; f_PState_toksOf = dtb__260; f_PState_lastPos = dtb__261; f_PState_toksLeft = dtb__262; f_PState_pmodeOf = dtb__263; f_PState_tokIndex = dtb__264; f_PState_pendEvents = dtb__265; f_PState_nextNodeId = dtb__266; f_PState_openNodeId = dtb__267; f_PState_subStream = dtb__268; f_PState_backtickShapes = dtb__269; f_PState_sectionShapes = dtb__270; f_PState_interpMultis = dtb__271; f_PState_templateHoles = dtb__272 } -> dtb__269
  | _ -> failwith "DT: impossible branch"
))

# 52 "Vuna/Compiler/Frontend/Parser/Support.vuna"
let v_sectionShapes = (fun (p : t_PState) -> (match p with
  | { f_PState_fileOf = dtb__273; f_PState_sourceOf = dtb__274; f_PState_toksOf = dtb__275; f_PState_lastPos = dtb__276; f_PState_toksLeft = dtb__277; f_PState_pmodeOf = dtb__278; f_PState_tokIndex = dtb__279; f_PState_pendEvents = dtb__280; f_PState_nextNodeId = dtb__281; f_PState_openNodeId = dtb__282; f_PState_subStream = dtb__283; f_PState_backtickShapes = dtb__284; f_PState_sectionShapes = dtb__285; f_PState_interpMultis = dtb__286; f_PState_templateHoles = dtb__287 } -> dtb__285
  | _ -> failwith "DT: impossible branch"
))

# 54 "Vuna/Compiler/Frontend/Parser/Support.vuna"
let v_interpMultis = (fun (p : t_PState) -> (match p with
  | { f_PState_fileOf = dtb__288; f_PState_sourceOf = dtb__289; f_PState_toksOf = dtb__290; f_PState_lastPos = dtb__291; f_PState_toksLeft = dtb__292; f_PState_pmodeOf = dtb__293; f_PState_tokIndex = dtb__294; f_PState_pendEvents = dtb__295; f_PState_nextNodeId = dtb__296; f_PState_openNodeId = dtb__297; f_PState_subStream = dtb__298; f_PState_backtickShapes = dtb__299; f_PState_sectionShapes = dtb__300; f_PState_interpMultis = dtb__301; f_PState_templateHoles = dtb__302 } -> dtb__301
  | _ -> failwith "DT: impossible branch"
))

# 59 "Vuna/Compiler/Frontend/Parser/Support.vuna"
let v_templateHoles = (fun (p : t_PState) -> (match p with
  | { f_PState_fileOf = dtb__303; f_PState_sourceOf = dtb__304; f_PState_toksOf = dtb__305; f_PState_lastPos = dtb__306; f_PState_toksLeft = dtb__307; f_PState_pmodeOf = dtb__308; f_PState_tokIndex = dtb__309; f_PState_pendEvents = dtb__310; f_PState_nextNodeId = dtb__311; f_PState_openNodeId = dtb__312; f_PState_subStream = dtb__313; f_PState_backtickShapes = dtb__314; f_PState_sectionShapes = dtb__315; f_PState_interpMultis = dtb__316; f_PState_templateHoles = dtb__317 } -> dtb__317
  | _ -> failwith "DT: impossible branch"
))
