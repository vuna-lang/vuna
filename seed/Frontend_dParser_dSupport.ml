open Vuna_runtime
type t_ParseMode = C_ParseMode_PmStrict | C_ParseMode_PmTool
and t_PState = { f_PState_fileOf : string; f_PState_toksOf : Frontend_dLexer.t_PTok B_dData_dList.t_List; f_PState_lastPos : Base_dSource.t_Pos; f_PState_toksLeft : int; f_PState_pmodeOf : t_ParseMode; f_PState_tokIndex : int; f_PState_pendEvents : Frontend_dCst.t_NodeEvent B_dData_dList.t_List; f_PState_nextNodeId : int; f_PState_openNodeId : int; f_PState_subStream : bool; f_PState_holeParens : (int, int) B_dData_dPair.t_Pair B_dData_dList.t_List; f_PState_backtickShapes : (int, bool) B_dData_dPair.t_Pair B_dData_dList.t_List; f_PState_holeBackticks : (int, bool) B_dData_dPair.t_Pair B_dData_dList.t_List; f_PState_sectionShapes : (int, Frontend_dCst.t_SectionShape) B_dData_dPair.t_Pair B_dData_dList.t_List; f_PState_holeSections : (int, Frontend_dCst.t_SectionShape) B_dData_dPair.t_Pair B_dData_dList.t_List; f_PState_interpMultis : (int, bool) B_dData_dPair.t_Pair B_dData_dList.t_List; f_PState_holeInterpMultis : (int, bool) B_dData_dPair.t_Pair B_dData_dList.t_List }
and t_SurfaceBits = { f_SurfaceBits_sbParens : (int, int) B_dData_dPair.t_Pair B_dData_dList.t_List; f_SurfaceBits_sbBackticks : (int, bool) B_dData_dPair.t_Pair B_dData_dList.t_List; f_SurfaceBits_sbSections : (int, Frontend_dCst.t_SectionShape) B_dData_dPair.t_Pair B_dData_dList.t_List; f_SurfaceBits_sbInterps : (int, bool) B_dData_dPair.t_Pair B_dData_dList.t_List }

# 67 "Vuna/Compiler/Frontend/Parser/Support.vuna"
let v_fileOf = (fun (st : t_PState) -> (st).f_PState_fileOf)

# 71 "Vuna/Compiler/Frontend/Parser/Support.vuna"
let v_pmodeOf = (fun (st : t_PState) -> (st).f_PState_pmodeOf)

# 75 "Vuna/Compiler/Frontend/Parser/Support.vuna"
let v_mkState = (fun (file : string) (toks : Frontend_dLexer.t_PTok B_dData_dList.t_List) (mode : t_ParseMode) -> { f_PState_fileOf = file; f_PState_toksOf = toks; f_PState_lastPos = { Base_dSource.f_Pos_posLine = 1; Base_dSource.f_Pos_posCol = 0; Base_dSource.f_Pos_posOffset = 0; Base_dSource.f_Pos_posEndOffset = 0 }; f_PState_toksLeft = (B_dData_dList.v_length toks); f_PState_pmodeOf = mode; f_PState_tokIndex = 0; f_PState_pendEvents = B_dData_dList.C_List_Nil; f_PState_nextNodeId = 1; f_PState_openNodeId = 0; f_PState_subStream = false; f_PState_holeParens = B_dData_dList.C_List_Nil; f_PState_backtickShapes = B_dData_dList.C_List_Nil; f_PState_holeBackticks = B_dData_dList.C_List_Nil; f_PState_sectionShapes = B_dData_dList.C_List_Nil; f_PState_holeSections = B_dData_dList.C_List_Nil; f_PState_interpMultis = B_dData_dList.C_List_Nil; f_PState_holeInterpMultis = B_dData_dList.C_List_Nil })

# 82 "Vuna/Compiler/Frontend/Parser/Support.vuna"
let v_mkStateAt = (fun (file : string) (toks : Frontend_dLexer.t_PTok B_dData_dList.t_List) (last : Base_dSource.t_Pos) (count : int) (mode : t_ParseMode) -> { f_PState_fileOf = file; f_PState_toksOf = toks; f_PState_lastPos = last; f_PState_toksLeft = count; f_PState_pmodeOf = mode; f_PState_tokIndex = 0; f_PState_pendEvents = B_dData_dList.C_List_Nil; f_PState_nextNodeId = (0 - (2 + (Base_dSource.v_posOffset last))); f_PState_openNodeId = 0; f_PState_subStream = true; f_PState_holeParens = B_dData_dList.C_List_Nil; f_PState_backtickShapes = B_dData_dList.C_List_Nil; f_PState_holeBackticks = B_dData_dList.C_List_Nil; f_PState_sectionShapes = B_dData_dList.C_List_Nil; f_PState_holeSections = B_dData_dList.C_List_Nil; f_PState_interpMultis = B_dData_dList.C_List_Nil; f_PState_holeInterpMultis = B_dData_dList.C_List_Nil })

# 87 "Vuna/Compiler/Frontend/Parser/Support.vuna"
let v_eventsOf = (fun (st : t_PState) (st2 : t_PState) -> (B_dData_dList.v_reverse (st2).f_PState_pendEvents))

# 109 "Vuna/Compiler/Frontend/Parser/Support.vuna"
let v_addHoleParens = (fun (entries : (int, int) B_dData_dPair.t_Pair B_dData_dList.t_List) (st : t_PState) -> { st with f_PState_holeParens = ((B_dData_dList.v_append entries) (st).f_PState_holeParens) })

# 113 "Vuna/Compiler/Frontend/Parser/Support.vuna"
let v_addHoleBackticks = (fun (entries : (int, bool) B_dData_dPair.t_Pair B_dData_dList.t_List) (st : t_PState) -> { st with f_PState_holeBackticks = ((B_dData_dList.v_append entries) (st).f_PState_holeBackticks) })

# 117 "Vuna/Compiler/Frontend/Parser/Support.vuna"
let v_addBacktickShape = (fun (nid : int) (st : t_PState) -> { st with f_PState_backtickShapes = (B_dData_dList.C_List__x58__x58_ ({ B_dData_dPair.f_Pair_first = nid; B_dData_dPair.f_Pair_second = true }, (st).f_PState_backtickShapes)) })

# 121 "Vuna/Compiler/Frontend/Parser/Support.vuna"
let v_addHoleSections = (fun (entries : (int, Frontend_dCst.t_SectionShape) B_dData_dPair.t_Pair B_dData_dList.t_List) (st : t_PState) -> { st with f_PState_holeSections = ((B_dData_dList.v_append entries) (st).f_PState_holeSections) })

# 125 "Vuna/Compiler/Frontend/Parser/Support.vuna"
let v_addSectionShape = (fun (off : int) (shape : Frontend_dCst.t_SectionShape) (st : t_PState) -> { st with f_PState_sectionShapes = (B_dData_dList.C_List__x58__x58_ ({ B_dData_dPair.f_Pair_first = off; B_dData_dPair.f_Pair_second = shape }, (st).f_PState_sectionShapes)) })

# 129 "Vuna/Compiler/Frontend/Parser/Support.vuna"
let v_addHoleInterpMultis = (fun (entries : (int, bool) B_dData_dPair.t_Pair B_dData_dList.t_List) (st : t_PState) -> { st with f_PState_holeInterpMultis = ((B_dData_dList.v_append entries) (st).f_PState_holeInterpMultis) })

# 133 "Vuna/Compiler/Frontend/Parser/Support.vuna"
let v_addInterpMulti = (fun (off : int) (multi : bool) (st : t_PState) -> { st with f_PState_interpMultis = (B_dData_dList.C_List__x58__x58_ ({ B_dData_dPair.f_Pair_first = off; B_dData_dPair.f_Pair_second = multi }, (st).f_PState_interpMultis)) })

# 145 "Vuna/Compiler/Frontend/Parser/Support.vuna"
let rec v_rekeyInfixGo = (fun (mc0 : int) (mc1 : int) (mc2 : (int, bool) B_dData_dPair.t_Pair B_dData_dList.t_List) -> (match mc2 with
  | B_dData_dList.C_List__x58__x58_ (dtb__0, dtb__1) -> (if ((B_dData_dPair.v_firstOf dtb__0) = mc0) then (B_dData_dList.C_List__x58__x58_ ({ B_dData_dPair.f_Pair_first = mc1; B_dData_dPair.f_Pair_second = (B_dData_dPair.v_secondOf dtb__0) }, dtb__1)) else (B_dData_dList.C_List__x58__x58_ (dtb__0, (((v_rekeyInfixGo mc0) mc1) dtb__1))))
  | B_dData_dList.C_List_Nil -> B_dData_dList.C_List_Nil
  | _ -> failwith "DT: impossible branch"
))

# 138 "Vuna/Compiler/Frontend/Parser/Support.vuna"
let v_rekeyInfix = (fun (from : int) (to_ : int) (st : t_PState) -> (if (if (from < 0) then true else (from = to_)) then st else { st with f_PState_backtickShapes = (((v_rekeyInfixGo from) to_) (st).f_PState_backtickShapes) }))

# 157 "Vuna/Compiler/Frontend/Parser/Support.vuna"
let v_emptySurfaceBits = { f_SurfaceBits_sbParens = B_dData_dList.C_List_Nil; f_SurfaceBits_sbBackticks = B_dData_dList.C_List_Nil; f_SurfaceBits_sbSections = B_dData_dList.C_List_Nil; f_SurfaceBits_sbInterps = B_dData_dList.C_List_Nil }

# 160 "Vuna/Compiler/Frontend/Parser/Support.vuna"
let v_appendSurfaceBits = (fun (a : t_SurfaceBits) (b : t_SurfaceBits) -> { f_SurfaceBits_sbParens = ((B_dData_dList.v_append (a).f_SurfaceBits_sbParens) (b).f_SurfaceBits_sbParens); f_SurfaceBits_sbBackticks = ((B_dData_dList.v_append (a).f_SurfaceBits_sbBackticks) (b).f_SurfaceBits_sbBackticks); f_SurfaceBits_sbSections = ((B_dData_dList.v_append (a).f_SurfaceBits_sbSections) (b).f_SurfaceBits_sbSections); f_SurfaceBits_sbInterps = ((B_dData_dList.v_append (a).f_SurfaceBits_sbInterps) (b).f_SurfaceBits_sbInterps) })

# 169 "Vuna/Compiler/Frontend/Parser/Support.vuna"
let v_closedAt = (fun (st : t_PState) -> { st with f_PState_pendEvents = (B_dData_dList.C_List__x58__x58_ ((Frontend_dCst.C_NodeEvent_EvClose ((st).f_PState_tokIndex)), (st).f_PState_pendEvents)) })

# 95 "Vuna/Compiler/Frontend/Parser/Support.vuna"
let v_withExtent = (fun (kind : Frontend_dCst.t_CstKind) (st : t_PState) k -> (let nid = (st).f_PState_nextNodeId in (let next = (if (st).f_PState_subStream then (nid - 1) else (nid + 1)) in (let opened = { st with f_PState_pendEvents = (B_dData_dList.C_List__x58__x58_ ((Frontend_dCst.C_NodeEvent_EvOpen (kind, (st).f_PState_tokIndex, nid)), (st).f_PState_pendEvents)); f_PState_nextNodeId = next; f_PState_openNodeId = nid } in ((Base_dCommon.v_step (k opened)) (fun v (st1 : t_PState) -> (Base_dDiag.C_Check_OkC ({ B_dData_dPair.f_Pair_first = v; B_dData_dPair.f_Pair_second = (v_closedAt st1) }))))))))

# 174 "Vuna/Compiler/Frontend/Parser/Support.vuna"
let v_withLastPos = (fun (p : Base_dSource.t_Pos) (st : t_PState) -> { st with f_PState_lastPos = p })

# 179 "Vuna/Compiler/Frontend/Parser/Support.vuna"
let v_lastEndCol = (fun (p : Base_dSource.t_Pos) -> ((Base_dSource.v_posCol p) + ((Base_dSource.v_posEndOffset p) - (Base_dSource.v_posOffset p))))

# 228 "Vuna/Compiler/Frontend/Parser/Support.vuna"
let v_peekTok = (fun (st : t_PState) -> (match (st).f_PState_toksOf with
  | B_dData_dList.C_List__x58__x58_ (dtb__2, dtb__3) -> dtb__2
  | B_dData_dList.C_List_Nil -> { Frontend_dLexer.f_PTok_ptokTok = Frontend_dLexer.C_Tok_TEof; Frontend_dLexer.f_PTok_ptokPos = { Base_dSource.f_Pos_posLine = 1; Base_dSource.f_Pos_posCol = 1; Base_dSource.f_Pos_posOffset = 0; Base_dSource.f_Pos_posEndOffset = 0 } }
  | _ -> failwith "DT: impossible branch"
))

# 234 "Vuna/Compiler/Frontend/Parser/Support.vuna"
let v_peekPos = (fun (st : t_PState) -> ((v_peekTok st)).Frontend_dLexer.f_PTok_ptokPos)

# 214 "Vuna/Compiler/Frontend/Parser/Support.vuna"
let v_tokenSpan = (fun (st : t_PState) -> (let p = (v_peekPos st) in (let len = ((Base_dSource.v_posEndOffset p) - (Base_dSource.v_posOffset p)) in { Base_dSource.f_Span_spanFile = (v_fileOf st); Base_dSource.f_Span_spanStartLine = (Base_dSource.v_posLine p); Base_dSource.f_Span_spanStartCol = (Base_dSource.v_posCol p); Base_dSource.f_Span_spanEndLine = (Base_dSource.v_posLine p); Base_dSource.f_Span_spanEndCol = ((Base_dSource.v_posCol p) + len); Base_dSource.f_Span_spanStartOffset = (Base_dSource.v_posOffset p); Base_dSource.f_Span_spanEndOffset = (Base_dSource.v_posEndOffset p) })))

# 249 "Vuna/Compiler/Frontend/Parser/Support.vuna"
let v_lastPos = (fun (st : t_PState) -> (st).f_PState_lastPos)

# 185 "Vuna/Compiler/Frontend/Parser/Support.vuna"
let v_spanOf = (fun (st : t_PState) (st2 : t_PState) -> (let p1 = (v_lastPos st2) in { Base_dSource.f_Span_spanFile = (v_fileOf st); Base_dSource.f_Span_spanStartLine = (Base_dSource.v_posLine (v_peekPos st)); Base_dSource.f_Span_spanStartCol = (Base_dSource.v_posCol (v_peekPos st)); Base_dSource.f_Span_spanEndLine = (Base_dSource.v_posLine p1); Base_dSource.f_Span_spanEndCol = (v_lastEndCol p1); Base_dSource.f_Span_spanStartOffset = (Base_dSource.v_posOffset (v_peekPos st)); Base_dSource.f_Span_spanEndOffset = (Base_dSource.v_posEndOffset p1) }))

# 199 "Vuna/Compiler/Frontend/Parser/Support.vuna"
let v_spanFromStart = (fun (file : string) (start : Base_dSource.t_Pos) (st : t_PState) -> (let p1 = (v_lastPos st) in { Base_dSource.f_Span_spanFile = file; Base_dSource.f_Span_spanStartLine = (Base_dSource.v_posLine start); Base_dSource.f_Span_spanStartCol = (Base_dSource.v_posCol start); Base_dSource.f_Span_spanEndLine = (Base_dSource.v_posLine p1); Base_dSource.f_Span_spanEndCol = (v_lastEndCol p1); Base_dSource.f_Span_spanStartOffset = (Base_dSource.v_posOffset start); Base_dSource.f_Span_spanEndOffset = (Base_dSource.v_posEndOffset p1) }))

# 239 "Vuna/Compiler/Frontend/Parser/Support.vuna"
let v_tokSpan = (fun (st : t_PState) -> (let nd_uscrut1 = (v_peekTok st) in (match nd_uscrut1 with
  | { Frontend_dLexer.f_PTok_ptokTok = dtb__4; Frontend_dLexer.f_PTok_ptokPos = dtb__5 } -> (match dtb__4 with
  | Frontend_dLexer.C_Tok_TEof -> (let p = (v_lastPos st) in { Base_dSource.f_Span_spanFile = (v_fileOf st); Base_dSource.f_Span_spanStartLine = (Base_dSource.v_posLine p); Base_dSource.f_Span_spanStartCol = (Base_dSource.v_posCol p); Base_dSource.f_Span_spanEndLine = (Base_dSource.v_posLine p); Base_dSource.f_Span_spanEndCol = (Base_dSource.v_posCol p); Base_dSource.f_Span_spanStartOffset = (Base_dSource.v_posOffset p); Base_dSource.f_Span_spanEndOffset = (Base_dSource.v_posOffset p) })
  | _ -> { Base_dSource.f_Span_spanFile = (v_fileOf st); Base_dSource.f_Span_spanStartLine = (Base_dSource.v_posLine dtb__5); Base_dSource.f_Span_spanStartCol = (Base_dSource.v_posCol dtb__5); Base_dSource.f_Span_spanEndLine = (Base_dSource.v_posLine dtb__5); Base_dSource.f_Span_spanEndCol = (Base_dSource.v_posCol dtb__5); Base_dSource.f_Span_spanStartOffset = (Base_dSource.v_posOffset dtb__5); Base_dSource.f_Span_spanEndOffset = (Base_dSource.v_posOffset dtb__5) }
)
  | _ -> failwith "DT: impossible branch"
)))

# 252 "Vuna/Compiler/Frontend/Parser/Support.vuna"
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

# 267 "Vuna/Compiler/Frontend/Parser/Support.vuna"
let v_isEof = (fun (st : t_PState) -> (let nd_uscrut1 = (v_peekTok st) in (match nd_uscrut1 with
  | { Frontend_dLexer.f_PTok_ptokTok = dtb__10; Frontend_dLexer.f_PTok_ptokPos = dtb__11 } -> (match dtb__10 with
  | Frontend_dLexer.C_Tok_TEof -> true
  | _ -> false
)
  | _ -> failwith "DT: impossible branch"
)))

# 296 "Vuna/Compiler/Frontend/Parser/Support.vuna"
let v_stateFuel = (fun (st : t_PState) -> ((128 * (st).f_PState_toksLeft) + 1024))

# 299 "Vuna/Compiler/Frontend/Parser/Support.vuna"
let v_sameLineState = (fun (st : t_PState) -> (match (v_peekPos st) with
  | { Base_dSource.f_Pos_posLine = dtb__12; Base_dSource.f_Pos_posCol = dtb__13; Base_dSource.f_Pos_posOffset = dtb__14; Base_dSource.f_Pos_posEndOffset = dtb__15 } -> { st with f_PState_lastPos = { Base_dSource.f_Pos_posLine = dtb__12; Base_dSource.f_Pos_posCol = 0; Base_dSource.f_Pos_posOffset = 0; Base_dSource.f_Pos_posEndOffset = 0 } }
  | _ -> failwith "DT: impossible branch"
))

# 304 "Vuna/Compiler/Frontend/Parser/Support.vuna"
let v_atSym = (fun (st : t_PState) (s : string) -> (let nd_uscrut2 = (v_peekTok st) in (match nd_uscrut2 with
  | { Frontend_dLexer.f_PTok_ptokTok = dtb__16; Frontend_dLexer.f_PTok_ptokPos = dtb__17 } -> (match dtb__16 with
  | Frontend_dLexer.C_Tok_TSym (dtb__18) -> (dtb__18 = s)
  | _ -> false
)
  | _ -> failwith "DT: impossible branch"
)))

# 311 "Vuna/Compiler/Frontend/Parser/Support.vuna"
let rec v_nthTok = (fun (mc0 : Frontend_dLexer.t_PTok B_dData_dList.t_List) (mc1 : int) -> (match mc0 with
  | B_dData_dList.C_List__x58__x58_ (dtb__19, dtb__20) -> (if (mc1 <= 0) then (B_dData_dMaybe.C_Maybe_Just (dtb__19)) else ((v_nthTok dtb__20) (mc1 - 1)))
  | B_dData_dList.C_List_Nil -> B_dData_dMaybe.C_Maybe_Nothing
  | _ -> failwith "DT: impossible branch"
))

# 315 "Vuna/Compiler/Frontend/Parser/Support.vuna"
let v_peekTokAt = (fun (st : t_PState) (n : int) -> ((v_nthTok (st).f_PState_toksOf) n))

# 333 "Vuna/Compiler/Frontend/Parser/Support.vuna"
let v_tokTail = (fun (mc0 : Frontend_dLexer.t_PTok B_dData_dList.t_List) -> (match mc0 with
  | B_dData_dList.C_List__x58__x58_ (dtb__21, dtb__22) -> dtb__22
  | B_dData_dList.C_List_Nil -> B_dData_dList.C_List_Nil
  | _ -> failwith "DT: impossible branch"
))

# 338 "Vuna/Compiler/Frontend/Parser/Support.vuna"
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

# 346 "Vuna/Compiler/Frontend/Parser/Support.vuna"
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

# 321 "Vuna/Compiler/Frontend/Parser/Support.vuna"
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

# 368 "Vuna/Compiler/Frontend/Parser/Support.vuna"
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

# 361 "Vuna/Compiler/Frontend/Parser/Support.vuna"
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

# 358 "Vuna/Compiler/Frontend/Parser/Support.vuna"
let v_piArrowAhead = (fun (st : t_PState) -> ((v_piArrowAheadGo 1) (st).f_PState_toksOf))

# 372 "Vuna/Compiler/Frontend/Parser/Support.vuna"
let v_atKw = (fun (st : t_PState) (k : string) -> (let nd_uscrut2 = (v_peekTok st) in (match nd_uscrut2 with
  | { Frontend_dLexer.f_PTok_ptokTok = dtb__49; Frontend_dLexer.f_PTok_ptokPos = dtb__50 } -> (match dtb__49 with
  | Frontend_dLexer.C_Tok_TKw (dtb__51) -> (dtb__51 = k)
  | _ -> false
)
  | _ -> failwith "DT: impossible branch"
)))

# 378 "Vuna/Compiler/Frontend/Parser/Support.vuna"
let v_canContinue = (fun (st : t_PState) (blockCol : int) -> (match (v_peekPos st) with
  | { Base_dSource.f_Pos_posLine = dtb__52; Base_dSource.f_Pos_posCol = dtb__53; Base_dSource.f_Pos_posOffset = dtb__54; Base_dSource.f_Pos_posEndOffset = dtb__55 } -> (match (v_lastPos st) with
  | { Base_dSource.f_Pos_posLine = dtb__56; Base_dSource.f_Pos_posCol = dtb__57; Base_dSource.f_Pos_posOffset = dtb__58; Base_dSource.f_Pos_posEndOffset = dtb__59 } -> (if (dtb__52 = dtb__56) then true else (dtb__53 > blockCol))
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
))

# 387 "Vuna/Compiler/Frontend/Parser/Support.vuna"
let v_expectSym = (fun (st : t_PState) (s : string) -> (let nd_uscrut2 = (v_peekTok st) in (match nd_uscrut2 with
  | { Frontend_dLexer.f_PTok_ptokTok = dtb__60; Frontend_dLexer.f_PTok_ptokPos = dtb__61 } -> (match dtb__60 with
  | Frontend_dLexer.C_Tok_TSym (dtb__62) -> (if (dtb__62 = s) then (Base_dDiag.C_Check_OkC ((v_advance st))) else (((Base_dDiagnostics_dFrontend.v_psErr1At (v_tokSpan st)) (Base_dDiagnostics_dFrontend.C_PsDiag_ExpectedToken (s))) s))
  | _ -> (((Base_dDiagnostics_dFrontend.v_psErr1At (v_tokSpan st)) (Base_dDiagnostics_dFrontend.C_PsDiag_ExpectedToken (s))) s)
)
  | _ -> failwith "DT: impossible branch"
)))

# 394 "Vuna/Compiler/Frontend/Parser/Support.vuna"
let v_expectKw = (fun (st : t_PState) (k : string) -> (let nd_uscrut2 = (v_peekTok st) in (match nd_uscrut2 with
  | { Frontend_dLexer.f_PTok_ptokTok = dtb__63; Frontend_dLexer.f_PTok_ptokPos = dtb__64 } -> (match dtb__63 with
  | Frontend_dLexer.C_Tok_TKw (dtb__65) -> (if (dtb__65 = k) then (Base_dDiag.C_Check_OkC ((v_advance st))) else (((Base_dDiagnostics_dFrontend.v_psErr1At (v_tokSpan st)) (Base_dDiagnostics_dFrontend.C_PsDiag_ExpectedToken (k))) k))
  | _ -> (((Base_dDiagnostics_dFrontend.v_psErr1At (v_tokSpan st)) (Base_dDiagnostics_dFrontend.C_PsDiag_ExpectedToken (k))) k)
)
  | _ -> failwith "DT: impossible branch"
)))

# 400 "Vuna/Compiler/Frontend/Parser/Support.vuna"
let v_expectIdent = (fun (st : t_PState) -> (let nd_uscrut1 = (v_peekTok st) in (match nd_uscrut1 with
  | { Frontend_dLexer.f_PTok_ptokTok = dtb__66; Frontend_dLexer.f_PTok_ptokPos = dtb__67 } -> (match dtb__66 with
  | Frontend_dLexer.C_Tok_TIdent (dtb__68) -> (Base_dDiag.C_Check_OkC ({ B_dData_dPair.f_Pair_first = dtb__68; B_dData_dPair.f_Pair_second = (v_advance st) }))
  | _ -> ((Base_dDiagnostics_dFrontend.v_psErr0At (v_tokSpan st)) Base_dDiagnostics_dFrontend.C_PsDiag_ExpectedIdentifier)
)
  | _ -> failwith "DT: impossible branch"
)))

# 423 "Vuna/Compiler/Frontend/Parser/Support.vuna"
let v_upperFirst = (fun (s : string) -> (match (B_dData_dList.dtp_unpack s) with
  | B_dData_dList.C_List__x58__x58_ (dtb__69, dtb__70) -> (if (dtb__69 >= 65) then (dtb__69 <= 90) else false)
  | B_dData_dList.C_List_Nil -> false
  | _ -> failwith "DT: impossible branch"
))

# 431 "Vuna/Compiler/Frontend/Parser/Support.vuna"
let v_underscoreCtorName = (fun (s : string) -> (match (B_dData_dList.dtp_unpack s) with
  | B_dData_dList.C_List__x58__x58_ (dtb__71, dtb__72) -> (if (dtb__71 = 95) then (match dtb__72 with
  | B_dData_dList.C_List__x58__x58_ (dtb__73, dtb__74) -> (if (dtb__73 >= 65) then (dtb__73 <= 90) else false)
  | B_dData_dList.C_List_Nil -> false
  | _ -> failwith "DT: impossible branch"
) else false)
  | B_dData_dList.C_List_Nil -> false
  | _ -> failwith "DT: impossible branch"
))

# 443 "Vuna/Compiler/Frontend/Parser/Support.vuna"
let v_ctorPatternStart = (fun (name : string) -> (if (v_upperFirst name) then true else (v_underscoreCtorName name)))

# 466 "Vuna/Compiler/Frontend/Parser/Support.vuna"
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

# 446 "Vuna/Compiler/Frontend/Parser/Support.vuna"
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

# 480 "Vuna/Compiler/Frontend/Parser/Support.vuna"
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

# 493 "Vuna/Compiler/Frontend/Parser/Support.vuna"
let v_isSyntaxSym = (fun (op : string) -> (if (op = "=") then true else (if (op = ":") then true else (if (op = ",") then true else (if (op = ";") then true else (if (op = "|") then true else (if (op = "=>") then true else (if (op = "<-") then true else (if (op = "\\") then true else (if (op = ".") then true else (if (op = "..") then true else (if (op = "@") then true else (if (op = "(") then true else (if (op = ")") then true else (if (op = "[") then true else (if (op = "]") then true else (if (op = "{") then true else (if (op = "}") then true else false))))))))))))))))))

# 520 "Vuna/Compiler/Frontend/Parser/Support.vuna"
let v_isReservedValueName = (fun (name : string) -> (if (if (v_isSyntaxSym name) then true else (name = "->")) then true else (name = "`")))

# 408 "Vuna/Compiler/Frontend/Parser/Support.vuna"
let v_expectValueName = (fun (st : t_PState) -> (let nd_uscrut1 = (v_peekTok st) in (match nd_uscrut1 with
  | { Frontend_dLexer.f_PTok_ptokTok = dtb__103; Frontend_dLexer.f_PTok_ptokPos = dtb__104 } -> (match dtb__103 with
  | Frontend_dLexer.C_Tok_TSym (dtb__105) -> (if (v_isReservedValueName dtb__105) then (((Base_dDiagnostics_dFrontend.v_psErr1At (v_tokSpan st)) (Base_dDiagnostics_dFrontend.C_PsDiag_ExpectedToken ("value name"))) "value name") else (Base_dDiag.C_Check_OkC ({ B_dData_dPair.f_Pair_first = dtb__105; B_dData_dPair.f_Pair_second = (v_advance st) })))
  | Frontend_dLexer.C_Tok_TIdent (dtb__106) -> (if (v_isReservedValueName dtb__106) then (((Base_dDiagnostics_dFrontend.v_psErr1At (v_tokSpan st)) (Base_dDiagnostics_dFrontend.C_PsDiag_ExpectedToken ("value name"))) "value name") else (Base_dDiag.C_Check_OkC ({ B_dData_dPair.f_Pair_first = dtb__106; B_dData_dPair.f_Pair_second = (v_advance st) })))
  | _ -> ((Base_dDiagnostics_dFrontend.v_psErr0At (v_tokSpan st)) Base_dDiagnostics_dFrontend.C_PsDiag_ExpectedIdentifier)
)
  | _ -> failwith "DT: impossible branch"
)))

# 525 "Vuna/Compiler/Frontend/Parser/Support.vuna"
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

# 548 "Vuna/Compiler/Frontend/Parser/Support.vuna"
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

# 534 "Vuna/Compiler/Frontend/Parser/Support.vuna"
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

# 555 "Vuna/Compiler/Frontend/Parser/Support.vuna"
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

# 559 "Vuna/Compiler/Frontend/Parser/Support.vuna"
let v_terminatesExpression = (fun (mc0 : Frontend_dLexer.t_PTok) -> (match mc0 with
  | { Frontend_dLexer.f_PTok_ptokTok = dtb__130; Frontend_dLexer.f_PTok_ptokPos = dtb__131 } -> (match dtb__130 with
  | Frontend_dLexer.C_Tok_TKw (dtb__132) -> (if (dtb__132 = "else") then true else (if (dtb__132 = "in") then true else (if (dtb__132 = "then") then true else false)))
  | Frontend_dLexer.C_Tok_TSym (dtb__133) -> (if (dtb__133 = ")") then true else (if (dtb__133 = "]") then true else (if (dtb__133 = ",") then true else false)))
  | _ -> false
)
  | _ -> failwith "DT: impossible branch"
))

# 568 "Vuna/Compiler/Frontend/Parser/Support.vuna"
let v_badCaseIndent = (fun (st : t_PState) (altCol : int) -> (if (v_isEof st) then false else (match (v_peekPos st) with
  | { Base_dSource.f_Pos_posLine = dtb__134; Base_dSource.f_Pos_posCol = dtb__135; Base_dSource.f_Pos_posOffset = dtb__136; Base_dSource.f_Pos_posEndOffset = dtb__137 } -> (if (dtb__135 > altCol) then (if (v_terminatesExpression (v_peekTok st)) then false else true) else false)
  | _ -> failwith "DT: impossible branch"
)))
