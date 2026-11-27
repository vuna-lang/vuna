open Vuna_runtime
type t_ParseMode = C_ParseMode_PmStrict | C_ParseMode_PmTool
and t_EventMode = C_EventMode_EvNone | C_EventMode_EvLayout | C_EventMode_EvFull
and t_PState = { f_PState_fileOf : string; f_PState_sourceOf : string; f_PState_toksOf : Frontend_dLexer.t_PTok B_dData_dList.t_List; f_PState_lastPos : Base_dSource.t_Pos; f_PState_toksLeft : int; f_PState_pmodeOf : t_ParseMode; f_PState_tokIndex : int; f_PState_pendEvents : Frontend_dCst.t_NodeEvent B_dData_dList.t_List; f_PState_nextNodeId : int; f_PState_openNodeId : int; f_PState_subStream : bool; f_PState_backtickShapes : (int, bool) B_dData_dPair.t_Pair B_dData_dList.t_List; f_PState_sectionShapes : (int, Frontend_dCst.t_SectionShape) B_dData_dPair.t_Pair B_dData_dList.t_List; f_PState_interpMultis : (int, bool) B_dData_dPair.t_Pair B_dData_dList.t_List; f_PState_templateHoles : (int, Frontend_dCst.t_CstNode B_dData_dList.t_List) B_dData_dPair.t_Pair B_dData_dList.t_List; f_PState_eventMode : t_EventMode }

# 79 "Vuna/Compiler/Frontend/Parser/Support.vuna"
let v_mkState = (fun (file : string) (source : string) (toks : Frontend_dLexer.t_PTok B_dData_dList.t_List) (mode : t_ParseMode) (events : t_EventMode) -> { f_PState_fileOf = file; f_PState_sourceOf = source; f_PState_toksOf = toks; f_PState_lastPos = { Base_dSource.f_Pos_posLine = 1; Base_dSource.f_Pos_posCol = 0; Base_dSource.f_Pos_posOffset = 0; Base_dSource.f_Pos_posEndOffset = 0 }; f_PState_toksLeft = (B_dData_dList.v_length toks); f_PState_pmodeOf = mode; f_PState_tokIndex = 0; f_PState_pendEvents = B_dData_dList.C_List_Nil; f_PState_nextNodeId = 1; f_PState_openNodeId = 0; f_PState_subStream = false; f_PState_backtickShapes = B_dData_dList.C_List_Nil; f_PState_sectionShapes = B_dData_dList.C_List_Nil; f_PState_interpMultis = B_dData_dList.C_List_Nil; f_PState_templateHoles = B_dData_dList.C_List_Nil; f_PState_eventMode = events })

# 86 "Vuna/Compiler/Frontend/Parser/Support.vuna"
let v_mkStateAt = (fun (file : string) (source : string) (toks : Frontend_dLexer.t_PTok B_dData_dList.t_List) (last : Base_dSource.t_Pos) (count : int) (mode : t_ParseMode) (events : t_EventMode) -> { f_PState_fileOf = file; f_PState_sourceOf = source; f_PState_toksOf = toks; f_PState_lastPos = last; f_PState_toksLeft = count; f_PState_pmodeOf = mode; f_PState_tokIndex = 0; f_PState_pendEvents = B_dData_dList.C_List_Nil; f_PState_nextNodeId = (0 - (2 + (Base_dSource.v_posOffset last))); f_PState_openNodeId = 0; f_PState_subStream = true; f_PState_backtickShapes = B_dData_dList.C_List_Nil; f_PState_sectionShapes = B_dData_dList.C_List_Nil; f_PState_interpMultis = B_dData_dList.C_List_Nil; f_PState_templateHoles = B_dData_dList.C_List_Nil; f_PState_eventMode = events })

# 92 "Vuna/Compiler/Frontend/Parser/Support.vuna"
let v_eventsOf = (fun (st : t_PState) -> (B_dData_dList.v_reverse (st).f_PState_pendEvents))

# 122 "Vuna/Compiler/Frontend/Parser/Support.vuna"
let v_openNodeState = (fun (st : t_PState) (kind : Frontend_dCst.t_CstKind) (nid : int) (next : int) -> (match (st).f_PState_eventMode with
  | C_EventMode_EvNone -> { st with f_PState_nextNodeId = next; f_PState_openNodeId = nid }
  | _ -> { st with f_PState_pendEvents = (B_dData_dList.C_List__x58__x58_ ((Frontend_dCst.C_NodeEvent_EvOpen (kind, (st).f_PState_tokIndex, nid)), (st).f_PState_pendEvents)); f_PState_nextNodeId = next; f_PState_openNodeId = nid }
))

# 143 "Vuna/Compiler/Frontend/Parser/Support.vuna"
let v_addBacktickShape = (fun (nid : int) (st : t_PState) -> { st with f_PState_backtickShapes = (B_dData_dList.C_List__x58__x58_ ({ B_dData_dPair.f_Pair_first = nid; B_dData_dPair.f_Pair_second = true }, (st).f_PState_backtickShapes)) })

# 147 "Vuna/Compiler/Frontend/Parser/Support.vuna"
let v_addSectionShape = (fun (off : int) (shape : Frontend_dCst.t_SectionShape) (st : t_PState) -> { st with f_PState_sectionShapes = (B_dData_dList.C_List__x58__x58_ ({ B_dData_dPair.f_Pair_first = off; B_dData_dPair.f_Pair_second = shape }, (st).f_PState_sectionShapes)) })

# 151 "Vuna/Compiler/Frontend/Parser/Support.vuna"
let v_addInterpMulti = (fun (off : int) (multi : bool) (st : t_PState) -> { st with f_PState_interpMultis = (B_dData_dList.C_List__x58__x58_ ({ B_dData_dPair.f_Pair_first = off; B_dData_dPair.f_Pair_second = multi }, (st).f_PState_interpMultis)) })

# 155 "Vuna/Compiler/Frontend/Parser/Support.vuna"
let v_addTemplateHoles = (fun (nid : int) (trees : Frontend_dCst.t_CstNode B_dData_dList.t_List) (st : t_PState) -> { st with f_PState_templateHoles = (B_dData_dList.C_List__x58__x58_ ({ B_dData_dPair.f_Pair_first = nid; B_dData_dPair.f_Pair_second = trees }, (st).f_PState_templateHoles)) })

# 167 "Vuna/Compiler/Frontend/Parser/Support.vuna"
let[@tail_mod_cons] rec v_rekeyInfixGo = (fun (mc0 : int) (mc1 : int) (mc2 : (int, bool) B_dData_dPair.t_Pair B_dData_dList.t_List) -> (match mc2 with
  | B_dData_dList.C_List__x58__x58_ (dtb__0, dtb__1) -> (if ((B_dData_dPair.v_firstOf dtb__0) = mc0) then (B_dData_dList.C_List__x58__x58_ ({ B_dData_dPair.f_Pair_first = mc1; B_dData_dPair.f_Pair_second = (B_dData_dPair.v_secondOf dtb__0) }, dtb__1)) else (B_dData_dList.C_List__x58__x58_ (dtb__0, (((v_rekeyInfixGo mc0) mc1) dtb__1))))
  | B_dData_dList.C_List_Nil -> B_dData_dList.C_List_Nil
  | _ -> failwith "DT: impossible branch"
))

# 160 "Vuna/Compiler/Frontend/Parser/Support.vuna"
let v_rekeyInfix = (fun (from : int) (to_ : int) (st : t_PState) -> (if (if (from < 0) then true else (from = to_)) then st else { st with f_PState_backtickShapes = (((v_rekeyInfixGo from) to_) (st).f_PState_backtickShapes) }))

# 173 "Vuna/Compiler/Frontend/Parser/Support.vuna"
let v_closedAt = (fun (st : t_PState) -> { st with f_PState_pendEvents = (B_dData_dList.C_List__x58__x58_ ((Frontend_dCst.C_NodeEvent_EvClose ((st).f_PState_tokIndex)), (st).f_PState_pendEvents)) })

# 135 "Vuna/Compiler/Frontend/Parser/Support.vuna"
let v_closeWithSem = (fun (mc0 : int) (mc1 : Frontend_dCst.t_CstSem B_dData_dMaybe.t_Maybe) (mc2 : t_PState) -> (match mc1 with
  | B_dData_dMaybe.C_Maybe_Just (dtb__2) -> (let st1 = { mc2 with f_PState_pendEvents = (B_dData_dList.C_List__x58__x58_ ((Frontend_dCst.C_NodeEvent_EvSem (mc0, dtb__2)), (mc2).f_PState_pendEvents)) } in (v_closedAt st1))
  | B_dData_dMaybe.C_Maybe_Nothing -> (v_closedAt mc2)
  | _ -> failwith "DT: impossible branch"
))

# 107 "Vuna/Compiler/Frontend/Parser/Support.vuna"
let v_withExtent = (fun (kind : Frontend_dCst.t_CstKind) toSem (st : t_PState) k -> (let nid = (st).f_PState_nextNodeId in (let next = (if (st).f_PState_subStream then (nid - 1) else (nid + 1)) in (let opened = ((((v_openNodeState st) kind) nid) next) in ((Base_dCommon.v_step (k opened)) (fun v (st1 : t_PState) -> (match (st).f_PState_eventMode with
  | C_EventMode_EvFull -> (Base_dDiag.C_Check_OkC ({ B_dData_dPair.f_Pair_first = v; B_dData_dPair.f_Pair_second = (((v_closeWithSem nid) (toSem v)) st1) }))
  | C_EventMode_EvLayout -> (Base_dDiag.C_Check_OkC ({ B_dData_dPair.f_Pair_first = v; B_dData_dPair.f_Pair_second = (v_closedAt st1) }))
  | C_EventMode_EvNone -> (Base_dDiag.C_Check_OkC ({ B_dData_dPair.f_Pair_first = v; B_dData_dPair.f_Pair_second = st1 }))
  | _ -> failwith "DT: impossible branch"
)))))))

# 178 "Vuna/Compiler/Frontend/Parser/Support.vuna"
let v_withLastPos = (fun (p : Base_dSource.t_Pos) (st : t_PState) -> { st with f_PState_lastPos = p })

# 183 "Vuna/Compiler/Frontend/Parser/Support.vuna"
let v_lastEndCol = (fun (p : Base_dSource.t_Pos) -> ((Base_dSource.v_posCol p) + ((Base_dSource.v_posEndOffset p) - (Base_dSource.v_posOffset p))))

# 232 "Vuna/Compiler/Frontend/Parser/Support.vuna"
let v_peekTok = (fun (st : t_PState) -> (match (st).f_PState_toksOf with
  | B_dData_dList.C_List__x58__x58_ (dtb__3, dtb__4) -> dtb__3
  | B_dData_dList.C_List_Nil -> { Frontend_dLexer.f_PTok_ptokTok = Frontend_dLexer.C_Tok_TEof; Frontend_dLexer.f_PTok_ptokPos = { Base_dSource.f_Pos_posLine = 1; Base_dSource.f_Pos_posCol = 1; Base_dSource.f_Pos_posOffset = 0; Base_dSource.f_Pos_posEndOffset = 0 } }
  | _ -> failwith "DT: impossible branch"
))

# 238 "Vuna/Compiler/Frontend/Parser/Support.vuna"
let v_peekPos = (fun (st : t_PState) -> ((v_peekTok st)).Frontend_dLexer.f_PTok_ptokPos)

# 253 "Vuna/Compiler/Frontend/Parser/Support.vuna"
let v_advance = (fun (st : t_PState) -> (match (st).f_PState_toksOf with
  | B_dData_dList.C_List__x58__x58_ (dtb__5, dtb__6) -> (let nd_uscrut4 = dtb__5 in (match nd_uscrut4 with
  | { Frontend_dLexer.f_PTok_ptokTok = dtb__7; Frontend_dLexer.f_PTok_ptokPos = dtb__8 } -> (match dtb__7 with
  | Frontend_dLexer.C_Tok_TEof -> st
  | _ -> { st with f_PState_toksOf = dtb__6; f_PState_lastPos = (dtb__5).Frontend_dLexer.f_PTok_ptokPos; f_PState_toksLeft = (if ((st).f_PState_toksLeft > 0) then ((st).f_PState_toksLeft - 1) else 0); f_PState_tokIndex = ((st).f_PState_tokIndex + 1) }
)
  | _ -> failwith "DT: impossible branch"
))
  | B_dData_dList.C_List_Nil -> st
  | _ -> failwith "DT: impossible branch"
))

# 268 "Vuna/Compiler/Frontend/Parser/Support.vuna"
let v_isEof = (fun (st : t_PState) -> (let nd_uscrut1 = (v_peekTok st) in (match nd_uscrut1 with
  | { Frontend_dLexer.f_PTok_ptokTok = dtb__9; Frontend_dLexer.f_PTok_ptokPos = dtb__10 } -> (match dtb__9 with
  | Frontend_dLexer.C_Tok_TEof -> true
  | _ -> false
)
  | _ -> failwith "DT: impossible branch"
)))

# 297 "Vuna/Compiler/Frontend/Parser/Support.vuna"
let v_stateFuel = (fun (st : t_PState) -> ((128 * (st).f_PState_toksLeft) + 1024))

# 300 "Vuna/Compiler/Frontend/Parser/Support.vuna"
let v_sameLineState = (fun (st : t_PState) -> (match (v_peekPos st) with
  | { Base_dSource.f_Pos_posLine = dtb__11; Base_dSource.f_Pos_posCol = dtb__12; Base_dSource.f_Pos_posOffset = dtb__13; Base_dSource.f_Pos_posEndOffset = dtb__14 } -> { st with f_PState_lastPos = { Base_dSource.f_Pos_posLine = dtb__11; Base_dSource.f_Pos_posCol = 0; Base_dSource.f_Pos_posOffset = 0; Base_dSource.f_Pos_posEndOffset = 0 } }
  | _ -> failwith "DT: impossible branch"
))

# 305 "Vuna/Compiler/Frontend/Parser/Support.vuna"
let v_atSym = (fun (st : t_PState) (s : string) -> (let nd_uscrut2 = (v_peekTok st) in (match nd_uscrut2 with
  | { Frontend_dLexer.f_PTok_ptokTok = dtb__15; Frontend_dLexer.f_PTok_ptokPos = dtb__16 } -> (match dtb__15 with
  | Frontend_dLexer.C_Tok_TSym (dtb__17) -> (dtb__17 = s)
  | _ -> false
)
  | _ -> failwith "DT: impossible branch"
)))

# 312 "Vuna/Compiler/Frontend/Parser/Support.vuna"
let rec v_nthTok = (fun (mc0 : Frontend_dLexer.t_PTok B_dData_dList.t_List) (mc1 : int) -> (match mc0 with
  | B_dData_dList.C_List__x58__x58_ (dtb__18, dtb__19) -> (if (mc1 <= 0) then (B_dData_dMaybe.C_Maybe_Just (dtb__18)) else ((v_nthTok dtb__19) (mc1 - 1)))
  | B_dData_dList.C_List_Nil -> B_dData_dMaybe.C_Maybe_Nothing
  | _ -> failwith "DT: impossible branch"
))

# 316 "Vuna/Compiler/Frontend/Parser/Support.vuna"
let v_peekTokAt = (fun (st : t_PState) (n : int) -> ((v_nthTok (st).f_PState_toksOf) n))

# 334 "Vuna/Compiler/Frontend/Parser/Support.vuna"
let v_tokTail = (fun (mc0 : Frontend_dLexer.t_PTok B_dData_dList.t_List) -> (match mc0 with
  | B_dData_dList.C_List__x58__x58_ (dtb__20, dtb__21) -> dtb__21
  | B_dData_dList.C_List_Nil -> B_dData_dList.C_List_Nil
  | _ -> failwith "DT: impossible branch"
))

# 339 "Vuna/Compiler/Frontend/Parser/Support.vuna"
let rec v_binderNameTail = (fun (mc0 : Frontend_dLexer.t_PTok B_dData_dList.t_List) (mc1 : string B_dData_dList.t_List) -> (match mc0 with
  | B_dData_dList.C_List__x58__x58_ (dtb__22, dtb__23) -> (let nd_uscrut5 = dtb__22 in (match nd_uscrut5 with
  | { Frontend_dLexer.f_PTok_ptokTok = dtb__24; Frontend_dLexer.f_PTok_ptokPos = dtb__25 } -> (match dtb__24 with
  | Frontend_dLexer.C_Tok_TSym (dtb__26) -> (if (dtb__26 = ":") then (B_dData_dMaybe.C_Maybe_Just ((B_dData_dList.v_reverse mc1))) else B_dData_dMaybe.C_Maybe_Nothing)
  | Frontend_dLexer.C_Tok_TIdent (dtb__27) -> ((v_binderNameTail dtb__23) (B_dData_dList.C_List__x58__x58_ (dtb__27, mc1)))
  | _ -> B_dData_dMaybe.C_Maybe_Nothing
)
  | _ -> failwith "DT: impossible branch"
))
  | B_dData_dList.C_List_Nil -> B_dData_dMaybe.C_Maybe_Nothing
  | _ -> failwith "DT: impossible branch"
))

# 347 "Vuna/Compiler/Frontend/Parser/Support.vuna"
let v_quantifiedHead = (fun (st : t_PState) (q : Frontend_dAst.t_Qty) -> (let nd_uscrut2 = ((v_peekTokAt st) 1) in (match nd_uscrut2 with
  | B_dData_dMaybe.C_Maybe_Just (dtb__28) -> (match dtb__28 with
  | { Frontend_dLexer.f_PTok_ptokTok = dtb__29; Frontend_dLexer.f_PTok_ptokPos = dtb__30 } -> (match dtb__29 with
  | Frontend_dLexer.C_Tok_TIdent (dtb__31) -> (match ((v_binderNameTail (v_tokTail (v_tokTail (st).f_PState_toksOf))) B_dData_dList.C_List_Nil) with
  | B_dData_dMaybe.C_Maybe_Just (dtb__32) -> (B_dData_dMaybe.C_Maybe_Just ({ B_dData_dPair.f_Pair_first = (B_dData_dMaybe.C_Maybe_Just (q)); B_dData_dPair.f_Pair_second = (B_dData_dList.C_List__x58__x58_ (dtb__31, dtb__32)) }))
  | B_dData_dMaybe.C_Maybe_Nothing -> B_dData_dMaybe.C_Maybe_Nothing
  | _ -> failwith "DT: impossible branch"
)
  | _ -> B_dData_dMaybe.C_Maybe_Nothing
)
  | _ -> failwith "DT: impossible branch"
)
  | _ -> B_dData_dMaybe.C_Maybe_Nothing
)))

# 322 "Vuna/Compiler/Frontend/Parser/Support.vuna"
let v_binderHead = (fun (st : t_PState) -> (let nd_uscrut1 = (v_peekTok st) in (match nd_uscrut1 with
  | { Frontend_dLexer.f_PTok_ptokTok = dtb__33; Frontend_dLexer.f_PTok_ptokPos = dtb__34 } -> (match dtb__33 with
  | Frontend_dLexer.C_Tok_TInt (dtb__35) -> (if (dtb__35 = 0) then ((v_quantifiedHead st) Frontend_dAst.C_Qty_Q0) else (if (dtb__35 = 1) then ((v_quantifiedHead st) Frontend_dAst.C_Qty_Q1) else B_dData_dMaybe.C_Maybe_Nothing))
  | Frontend_dLexer.C_Tok_TIdent (dtb__36) -> (match ((v_binderNameTail (v_tokTail (st).f_PState_toksOf)) B_dData_dList.C_List_Nil) with
  | B_dData_dMaybe.C_Maybe_Just (dtb__37) -> (B_dData_dMaybe.C_Maybe_Just ({ B_dData_dPair.f_Pair_first = B_dData_dMaybe.C_Maybe_Nothing; B_dData_dPair.f_Pair_second = (B_dData_dList.C_List__x58__x58_ (dtb__36, dtb__37)) }))
  | B_dData_dMaybe.C_Maybe_Nothing -> B_dData_dMaybe.C_Maybe_Nothing
  | _ -> failwith "DT: impossible branch"
)
  | _ -> B_dData_dMaybe.C_Maybe_Nothing
)
  | _ -> failwith "DT: impossible branch"
)))

# 369 "Vuna/Compiler/Frontend/Parser/Support.vuna"
let v_arrowAt = (fun (mc0 : Frontend_dLexer.t_PTok B_dData_dList.t_List) -> (match mc0 with
  | B_dData_dList.C_List__x58__x58_ (dtb__38, dtb__39) -> (match dtb__38 with
  | { Frontend_dLexer.f_PTok_ptokTok = dtb__40; Frontend_dLexer.f_PTok_ptokPos = dtb__41 } -> (match dtb__40 with
  | Frontend_dLexer.C_Tok_TSym (dtb__42) -> (if (dtb__42 = "->") then true else false)
  | _ -> false
)
  | _ -> failwith "DT: impossible branch"
)
  | _ -> false
))

# 362 "Vuna/Compiler/Frontend/Parser/Support.vuna"
let rec v_piArrowAheadGo = (fun (mc0 : int) (mc1 : Frontend_dLexer.t_PTok B_dData_dList.t_List) -> (match mc1 with
  | B_dData_dList.C_List__x58__x58_ (dtb__43, dtb__44) -> (match dtb__43 with
  | { Frontend_dLexer.f_PTok_ptokTok = dtb__45; Frontend_dLexer.f_PTok_ptokPos = dtb__46 } -> (match dtb__45 with
  | Frontend_dLexer.C_Tok_TSym (dtb__47) -> (if (dtb__47 = "(") then ((v_piArrowAheadGo (mc0 + 1)) dtb__44) else (if (dtb__47 = ")") then (if (mc0 = 1) then (v_arrowAt dtb__44) else ((v_piArrowAheadGo (mc0 - 1)) dtb__44)) else ((v_piArrowAheadGo mc0) dtb__44)))
  | _ -> ((v_piArrowAheadGo mc0) dtb__44)
)
  | _ -> failwith "DT: impossible branch"
)
  | B_dData_dList.C_List_Nil -> false
  | _ -> failwith "DT: impossible branch"
))

# 359 "Vuna/Compiler/Frontend/Parser/Support.vuna"
let v_piArrowAhead = (fun (st : t_PState) -> ((v_piArrowAheadGo 1) (st).f_PState_toksOf))

# 373 "Vuna/Compiler/Frontend/Parser/Support.vuna"
let v_atKw = (fun (st : t_PState) (k : string) -> (let nd_uscrut2 = (v_peekTok st) in (match nd_uscrut2 with
  | { Frontend_dLexer.f_PTok_ptokTok = dtb__48; Frontend_dLexer.f_PTok_ptokPos = dtb__49 } -> (match dtb__48 with
  | Frontend_dLexer.C_Tok_TKw (dtb__50) -> (dtb__50 = k)
  | _ -> false
)
  | _ -> failwith "DT: impossible branch"
)))

# 421 "Vuna/Compiler/Frontend/Parser/Support.vuna"
let v_closeDepth = (fun (d : int) -> (if (d > 0) then (d - 1) else 0))

# 412 "Vuna/Compiler/Frontend/Parser/Support.vuna"
let v_tokBracketStep = (fun (mc0 : Frontend_dLexer.t_Tok) (mc1 : int) -> (match mc0 with
  | Frontend_dLexer.C_Tok_TSym (dtb__51) -> (if (dtb__51 = "(") then (B_dData_dMaybe.C_Maybe_Just ((mc1 + 1))) else (if (dtb__51 = "[") then (B_dData_dMaybe.C_Maybe_Just ((mc1 + 1))) else (if (dtb__51 = "{") then (B_dData_dMaybe.C_Maybe_Just ((mc1 + 1))) else (if (dtb__51 = ")") then (B_dData_dMaybe.C_Maybe_Just ((v_closeDepth mc1))) else (if (dtb__51 = "]") then (B_dData_dMaybe.C_Maybe_Just ((v_closeDepth mc1))) else (if (dtb__51 = "}") then (B_dData_dMaybe.C_Maybe_Just ((v_closeDepth mc1))) else B_dData_dMaybe.C_Maybe_Nothing))))))
  | _ -> B_dData_dMaybe.C_Maybe_Nothing
))

# 394 "Vuna/Compiler/Frontend/Parser/Support.vuna"
let rec v_stmtScanGo = (fun (mc0 : (Frontend_dLexer.t_PTok) -> bool B_dData_dMaybe.t_Maybe) (mc1 : int) (mc2 : int) (mc3 : int) (mc4 : Frontend_dLexer.t_PTok B_dData_dList.t_List) -> (match mc4 with
  | B_dData_dList.C_List__x58__x58_ (dtb__52, dtb__53) -> (match dtb__52 with
  | { Frontend_dLexer.f_PTok_ptokTok = dtb__54; Frontend_dLexer.f_PTok_ptokPos = dtb__55 } -> (if (if (if (mc2 = 0) then ((Base_dSource.v_posLine dtb__55) > mc3) else false) then ((Base_dSource.v_posCol dtb__55) <= mc1) else false) then false else (match ((v_tokBracketStep dtb__54) mc2) with
  | B_dData_dMaybe.C_Maybe_Just (dtb__56) -> (((((v_stmtScanGo mc0) mc1) dtb__56) (Base_dSource.v_posLine dtb__55)) dtb__53)
  | B_dData_dMaybe.C_Maybe_Nothing -> (if (mc2 > 0) then (((((v_stmtScanGo mc0) mc1) mc2) (Base_dSource.v_posLine dtb__55)) dtb__53) else (match (mc0 { Frontend_dLexer.f_PTok_ptokTok = dtb__54; Frontend_dLexer.f_PTok_ptokPos = dtb__55 }) with
  | B_dData_dMaybe.C_Maybe_Just (dtb__57) -> dtb__57
  | B_dData_dMaybe.C_Maybe_Nothing -> (((((v_stmtScanGo mc0) mc1) mc2) (Base_dSource.v_posLine dtb__55)) dtb__53)
  | _ -> failwith "DT: impossible branch"
))
  | _ -> failwith "DT: impossible branch"
))
  | _ -> failwith "DT: impossible branch"
)
  | B_dData_dList.C_List_Nil -> false
  | _ -> failwith "DT: impossible branch"
))

# 391 "Vuna/Compiler/Frontend/Parser/Support.vuna"
let v_scanDoStmtLevel = (fun (st : t_PState) (stmtCol : int) (decide : (Frontend_dLexer.t_PTok) -> bool B_dData_dMaybe.t_Maybe) -> (((((v_stmtScanGo decide) stmtCol) 0) (Base_dSource.v_posLine (v_peekPos st))) (st).f_PState_toksOf))

# 462 "Vuna/Compiler/Frontend/Parser/Support.vuna"
let v_upperFirst = (fun (s : string) -> (match (B_dData_dList.dtp_unpack s) with
  | B_dData_dList.C_List__x58__x58_ (dtb__58, dtb__59) -> (if (dtb__58 >= 65) then (dtb__58 <= 90) else false)
  | B_dData_dList.C_List_Nil -> false
  | _ -> failwith "DT: impossible branch"
))

# 470 "Vuna/Compiler/Frontend/Parser/Support.vuna"
let v_underscoreCtorName = (fun (s : string) -> (match (B_dData_dList.dtp_unpack s) with
  | B_dData_dList.C_List__x58__x58_ (dtb__60, dtb__61) -> (if (dtb__60 = 95) then (match dtb__61 with
  | B_dData_dList.C_List__x58__x58_ (dtb__62, dtb__63) -> (if (dtb__62 >= 65) then (dtb__62 <= 90) else false)
  | B_dData_dList.C_List_Nil -> false
  | _ -> failwith "DT: impossible branch"
) else false)
  | B_dData_dList.C_List_Nil -> false
  | _ -> failwith "DT: impossible branch"
))

# 482 "Vuna/Compiler/Frontend/Parser/Support.vuna"
let v_ctorPatternStart = (fun (name : string) -> (if (v_upperFirst name) then true else (v_underscoreCtorName name)))

# 488 "Vuna/Compiler/Frontend/Parser/Support.vuna"
let v_recordUpdateAhead = (fun (st : t_PState) -> (let nd_uscrut1 = ((v_peekTokAt st) 1) in (match nd_uscrut1 with
  | B_dData_dMaybe.C_Maybe_Just (dtb__64) -> (match dtb__64 with
  | { Frontend_dLexer.f_PTok_ptokTok = dtb__65; Frontend_dLexer.f_PTok_ptokPos = dtb__66 } -> (match dtb__65 with
  | Frontend_dLexer.C_Tok_TIdent (dtb__67) -> (let nd_uscrut7 = ((v_peekTokAt st) 2) in (match nd_uscrut7 with
  | B_dData_dMaybe.C_Maybe_Just (dtb__68) -> (match dtb__68 with
  | { Frontend_dLexer.f_PTok_ptokTok = dtb__69; Frontend_dLexer.f_PTok_ptokPos = dtb__70 } -> (match dtb__69 with
  | Frontend_dLexer.C_Tok_TSym (dtb__71) -> (if (dtb__71 = "|") then true else false)
  | _ -> false
)
  | _ -> failwith "DT: impossible branch"
)
  | _ -> false
))
  | _ -> false
)
  | _ -> failwith "DT: impossible branch"
)
  | _ -> false
)))

# 532 "Vuna/Compiler/Frontend/Parser/Support.vuna"
let v_startsPatternAtom = (fun (st : t_PState) -> (let nd_uscrut1 = (v_peekTok st) in (match nd_uscrut1 with
  | { Frontend_dLexer.f_PTok_ptokTok = dtb__72; Frontend_dLexer.f_PTok_ptokPos = dtb__73 } -> (match dtb__72 with
  | Frontend_dLexer.C_Tok_TSym (dtb__74) -> (if (dtb__74 = "(") then true else (if (dtb__74 = "[") then true else false))
  | Frontend_dLexer.C_Tok_TTmpl (dtb__75, dtb__76, dtb__77) -> true
  | Frontend_dLexer.C_Tok_TStr (dtb__78) -> true
  | Frontend_dLexer.C_Tok_TInt (dtb__79) -> true
  | Frontend_dLexer.C_Tok_TIdent (dtb__80) -> true
  | _ -> false
)
  | _ -> failwith "DT: impossible branch"
)))

# 545 "Vuna/Compiler/Frontend/Parser/Support.vuna"
let v_isSyntaxSym = (fun (op : string) -> (if (op = "=") then true else (if (op = ":") then true else (if (op = ",") then true else (if (op = ";") then true else (if (op = "|") then true else (if (op = "=>") then true else (if (op = "<-") then true else (if (op = "\\") then true else (if (op = ".") then true else (if (op = "..") then true else (if (op = "@") then true else (if (op = "(") then true else (if (op = ")") then true else (if (op = "[") then true else (if (op = "]") then true else (if (op = "{") then true else (if (op = "}") then true else false))))))))))))))))))

# 572 "Vuna/Compiler/Frontend/Parser/Support.vuna"
let v_isReservedValueName = (fun (name : string) -> (if (if (v_isSyntaxSym name) then true else (name = "->")) then true else (name = "`")))

# 577 "Vuna/Compiler/Frontend/Parser/Support.vuna"
let v_closeParenNext = (fun (st : t_PState) -> (let nd_uscrut1 = ((v_peekTokAt st) 1) in (match nd_uscrut1 with
  | B_dData_dMaybe.C_Maybe_Just (dtb__81) -> (match dtb__81 with
  | { Frontend_dLexer.f_PTok_ptokTok = dtb__82; Frontend_dLexer.f_PTok_ptokPos = dtb__83 } -> (match dtb__82 with
  | Frontend_dLexer.C_Tok_TSym (dtb__84) -> (if (dtb__84 = ")") then true else false)
  | _ -> false
)
  | _ -> failwith "DT: impossible branch"
)
  | _ -> false
)))

# 600 "Vuna/Compiler/Frontend/Parser/Support.vuna"
let v_minusLiteralAt = (fun (p : Base_dSource.t_Pos) (st : t_PState) -> (let nd_uscrut2 = ((v_peekTokAt st) 2) in (match nd_uscrut2 with
  | B_dData_dMaybe.C_Maybe_Just (dtb__85) -> (match dtb__85 with
  | { Frontend_dLexer.f_PTok_ptokTok = dtb__86; Frontend_dLexer.f_PTok_ptokPos = dtb__87 } -> (match dtb__86 with
  | Frontend_dLexer.C_Tok_TFloat (dtb__88) -> (if ((Base_dSource.v_posLine dtb__87) = (Base_dSource.v_posLine p)) then ((Base_dSource.v_posCol dtb__87) = ((Base_dSource.v_posCol p) + 1)) else false)
  | Frontend_dLexer.C_Tok_TInt (dtb__89) -> (if ((Base_dSource.v_posLine dtb__87) = (Base_dSource.v_posLine p)) then ((Base_dSource.v_posCol dtb__87) = ((Base_dSource.v_posCol p) + 1)) else false)
  | _ -> false
)
  | _ -> failwith "DT: impossible branch"
)
  | _ -> false
)))

# 607 "Vuna/Compiler/Frontend/Parser/Support.vuna"
let rec v_countArrows = (fun (mc0 : Frontend_dAst.t_Expr) -> (match mc0 with
  | Frontend_dAst.C_Expr_EApp (dtb__90, dtb__91, dtb__92) -> (match dtb__90 with
  | Frontend_dAst.C_Expr_EVar (dtb__93, dtb__94) -> (if (dtb__93 = "->") then (match dtb__91 with
  | B_dData_dList.C_List__x58__x58_ (dtb__95, dtb__96) -> (match dtb__96 with
  | B_dData_dList.C_List__x58__x58_ (dtb__97, dtb__98) -> (match dtb__98 with
  | B_dData_dList.C_List_Nil -> (1 + (v_countArrows dtb__97))
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

# 641 "Vuna/Compiler/Frontend/Parser/Support.vuna"
let v_closesAtDepthOne = (fun (tok : Frontend_dLexer.t_Tok) -> (match ((v_tokBracketStep tok) 1) with
  | B_dData_dMaybe.C_Maybe_Just (dtb__99) -> (dtb__99 = 0)
  | B_dData_dMaybe.C_Maybe_Nothing -> false
  | _ -> failwith "DT: impossible branch"
))

# 630 "Vuna/Compiler/Frontend/Parser/Support.vuna"
let v_followsExpression = (fun (mc0 : Frontend_dLexer.t_PTok) -> (match mc0 with
  | { Frontend_dLexer.f_PTok_ptokTok = dtb__100; Frontend_dLexer.f_PTok_ptokPos = dtb__101 } -> (match dtb__100 with
  | Frontend_dLexer.C_Tok_TKw (dtb__102) -> (if (dtb__102 = "then") then true else (if (dtb__102 = "else") then true else (if (dtb__102 = "in") then true else (if (dtb__102 = "of") then true else (if (dtb__102 = "where") then true else (v_closesAtDepthOne dtb__100))))))
  | Frontend_dLexer.C_Tok_TSym (dtb__103) -> (if (dtb__103 = ",") then true else (if (dtb__103 = ";") then true else (v_closesAtDepthOne dtb__100)))
  | _ -> (v_closesAtDepthOne dtb__100)
)
  | _ -> failwith "DT: impossible branch"
))

# 621 "Vuna/Compiler/Frontend/Parser/Support.vuna"
let v_badCaseIndent = (fun (st : t_PState) (altCol : int) -> (if (v_isEof st) then false else (match (v_peekPos st) with
  | { Base_dSource.f_Pos_posLine = dtb__104; Base_dSource.f_Pos_posCol = dtb__105; Base_dSource.f_Pos_posOffset = dtb__106; Base_dSource.f_Pos_posEndOffset = dtb__107 } -> (if (dtb__105 > altCol) then (B_dData_dBool.v_not (v_followsExpression (v_peekTok st))) else false)
  | _ -> failwith "DT: impossible branch"
)))

# 38 "Vuna/Compiler/Frontend/Parser/Support.vuna"
let v_fileOf = (fun (p : t_PState) -> (match p with
  | { f_PState_fileOf = dtb__108; f_PState_sourceOf = dtb__109; f_PState_toksOf = dtb__110; f_PState_lastPos = dtb__111; f_PState_toksLeft = dtb__112; f_PState_pmodeOf = dtb__113; f_PState_tokIndex = dtb__114; f_PState_pendEvents = dtb__115; f_PState_nextNodeId = dtb__116; f_PState_openNodeId = dtb__117; f_PState_subStream = dtb__118; f_PState_backtickShapes = dtb__119; f_PState_sectionShapes = dtb__120; f_PState_interpMultis = dtb__121; f_PState_templateHoles = dtb__122; f_PState_eventMode = dtb__123 } -> dtb__108
  | _ -> failwith "DT: impossible branch"
))

# 218 "Vuna/Compiler/Frontend/Parser/Support.vuna"
let v_tokenSpan = (fun (st : t_PState) -> (let p = (v_peekPos st) in (let len = ((Base_dSource.v_posEndOffset p) - (Base_dSource.v_posOffset p)) in { Base_dSource.f_Span_spanFile = (v_fileOf st); Base_dSource.f_Span_spanStartLine = (Base_dSource.v_posLine p); Base_dSource.f_Span_spanStartCol = (Base_dSource.v_posCol p); Base_dSource.f_Span_spanEndLine = (Base_dSource.v_posLine p); Base_dSource.f_Span_spanEndCol = ((Base_dSource.v_posCol p) + len); Base_dSource.f_Span_spanStartOffset = (Base_dSource.v_posOffset p); Base_dSource.f_Span_spanEndOffset = (Base_dSource.v_posEndOffset p) })))

# 518 "Vuna/Compiler/Frontend/Parser/Support.vuna"
let v_holeAtomAt = (fun (st : t_PState) -> (let nd_uscrut1 = (v_peekTok st) in (match nd_uscrut1 with
  | { Frontend_dLexer.f_PTok_ptokTok = dtb__124; Frontend_dLexer.f_PTok_ptokPos = dtb__125 } -> (match dtb__124 with
  | Frontend_dLexer.C_Tok_TSym (dtb__126) -> (if (dtb__126 = "?") then (let nd_uscrut5 = ((v_peekTokAt st) 1) in (match nd_uscrut5 with
  | B_dData_dMaybe.C_Maybe_Just (dtb__127) -> (match dtb__127 with
  | { Frontend_dLexer.f_PTok_ptokTok = dtb__128; Frontend_dLexer.f_PTok_ptokPos = dtb__129 } -> (match dtb__128 with
  | Frontend_dLexer.C_Tok_TIdent (dtb__130) -> (if (if ((Base_dSource.v_posLine dtb__129) = (Base_dSource.v_posLine dtb__125)) then ((Base_dSource.v_posCol dtb__129) = ((Base_dSource.v_posCol dtb__125) + 1)) else false) then (B_dData_dMaybe.C_Maybe_Just ({ B_dData_dPair.f_Pair_first = ("?" ^ dtb__130); B_dData_dPair.f_Pair_second = { Base_dSource.f_Span_spanFile = (v_fileOf st); Base_dSource.f_Span_spanStartLine = (Base_dSource.v_posLine dtb__125); Base_dSource.f_Span_spanStartCol = (Base_dSource.v_posCol dtb__125); Base_dSource.f_Span_spanEndLine = (Base_dSource.v_posLine dtb__129); Base_dSource.f_Span_spanEndCol = ((Base_dSource.v_posCol dtb__129) + (String.length dtb__130)); Base_dSource.f_Span_spanStartOffset = (Base_dSource.v_posOffset dtb__125); Base_dSource.f_Span_spanEndOffset = ((Base_dSource.v_posOffset dtb__129) + (String.length dtb__130)) } })) else B_dData_dMaybe.C_Maybe_Nothing)
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

# 497 "Vuna/Compiler/Frontend/Parser/Support.vuna"
let v_startsAtom = (fun (st : t_PState) -> (let nd_uscrut1 = (v_peekTok st) in (match nd_uscrut1 with
  | { Frontend_dLexer.f_PTok_ptokTok = dtb__131; Frontend_dLexer.f_PTok_ptokPos = dtb__132 } -> (match dtb__131 with
  | Frontend_dLexer.C_Tok_TSym (dtb__133) -> (if (dtb__133 = "(") then true else (if (dtb__133 = "[") then true else (if (dtb__133 = "{") then (v_recordUpdateAhead st) else (if (dtb__133 = "?") then (match (v_holeAtomAt st) with
  | B_dData_dMaybe.C_Maybe_Just (dtb__134) -> true
  | B_dData_dMaybe.C_Maybe_Nothing -> false
  | _ -> failwith "DT: impossible branch"
) else false))))
  | Frontend_dLexer.C_Tok_TKw (dtb__135) -> (if (dtb__135 = "Type") then true else false)
  | Frontend_dLexer.C_Tok_TTmpl (dtb__136, dtb__137, dtb__138) -> true
  | Frontend_dLexer.C_Tok_TStr (dtb__139) -> true
  | Frontend_dLexer.C_Tok_TFloat (dtb__140) -> true
  | Frontend_dLexer.C_Tok_TInt (dtb__141) -> true
  | Frontend_dLexer.C_Tok_TIdent (dtb__142) -> true
  | _ -> false
)
  | _ -> failwith "DT: impossible branch"
)))

# 586 "Vuna/Compiler/Frontend/Parser/Support.vuna"
let v_sectionOpAt = (fun (st : t_PState) -> (let nd_uscrut1 = ((v_peekTokAt st) 1) in (match nd_uscrut1 with
  | B_dData_dMaybe.C_Maybe_Just (dtb__143) -> (match dtb__143 with
  | { Frontend_dLexer.f_PTok_ptokTok = dtb__144; Frontend_dLexer.f_PTok_ptokPos = dtb__145 } -> (match dtb__144 with
  | Frontend_dLexer.C_Tok_TSym (dtb__146) -> (if (v_isReservedValueName dtb__146) then B_dData_dMaybe.C_Maybe_Nothing else (if (dtb__146 = "?") then (match (v_holeAtomAt (v_advance st)) with
  | B_dData_dMaybe.C_Maybe_Just (dtb__147) -> B_dData_dMaybe.C_Maybe_Nothing
  | B_dData_dMaybe.C_Maybe_Nothing -> (B_dData_dMaybe.C_Maybe_Just (dtb__146))
  | _ -> failwith "DT: impossible branch"
) else (if (if (dtb__146 = "-") then ((v_minusLiteralAt dtb__145) st) else false) then B_dData_dMaybe.C_Maybe_Nothing else (B_dData_dMaybe.C_Maybe_Just (dtb__146)))))
  | _ -> B_dData_dMaybe.C_Maybe_Nothing
)
  | _ -> failwith "DT: impossible branch"
)
  | _ -> B_dData_dMaybe.C_Maybe_Nothing
)))

# 40 "Vuna/Compiler/Frontend/Parser/Support.vuna"
let v_sourceOf = (fun (p : t_PState) -> (match p with
  | { f_PState_fileOf = dtb__148; f_PState_sourceOf = dtb__149; f_PState_toksOf = dtb__150; f_PState_lastPos = dtb__151; f_PState_toksLeft = dtb__152; f_PState_pmodeOf = dtb__153; f_PState_tokIndex = dtb__154; f_PState_pendEvents = dtb__155; f_PState_nextNodeId = dtb__156; f_PState_openNodeId = dtb__157; f_PState_subStream = dtb__158; f_PState_backtickShapes = dtb__159; f_PState_sectionShapes = dtb__160; f_PState_interpMultis = dtb__161; f_PState_templateHoles = dtb__162; f_PState_eventMode = dtb__163 } -> dtb__149
  | _ -> failwith "DT: impossible branch"
))

# 41 "Vuna/Compiler/Frontend/Parser/Support.vuna"
let v_toksOf = (fun (p : t_PState) -> (match p with
  | { f_PState_fileOf = dtb__164; f_PState_sourceOf = dtb__165; f_PState_toksOf = dtb__166; f_PState_lastPos = dtb__167; f_PState_toksLeft = dtb__168; f_PState_pmodeOf = dtb__169; f_PState_tokIndex = dtb__170; f_PState_pendEvents = dtb__171; f_PState_nextNodeId = dtb__172; f_PState_openNodeId = dtb__173; f_PState_subStream = dtb__174; f_PState_backtickShapes = dtb__175; f_PState_sectionShapes = dtb__176; f_PState_interpMultis = dtb__177; f_PState_templateHoles = dtb__178; f_PState_eventMode = dtb__179 } -> dtb__166
  | _ -> failwith "DT: impossible branch"
))

# 42 "Vuna/Compiler/Frontend/Parser/Support.vuna"
let v_lastPos = (fun (p : t_PState) -> (match p with
  | { f_PState_fileOf = dtb__180; f_PState_sourceOf = dtb__181; f_PState_toksOf = dtb__182; f_PState_lastPos = dtb__183; f_PState_toksLeft = dtb__184; f_PState_pmodeOf = dtb__185; f_PState_tokIndex = dtb__186; f_PState_pendEvents = dtb__187; f_PState_nextNodeId = dtb__188; f_PState_openNodeId = dtb__189; f_PState_subStream = dtb__190; f_PState_backtickShapes = dtb__191; f_PState_sectionShapes = dtb__192; f_PState_interpMultis = dtb__193; f_PState_templateHoles = dtb__194; f_PState_eventMode = dtb__195 } -> dtb__183
  | _ -> failwith "DT: impossible branch"
))

# 189 "Vuna/Compiler/Frontend/Parser/Support.vuna"
let v_spanOf = (fun (st : t_PState) (st2 : t_PState) -> (let p1 = (v_lastPos st2) in { Base_dSource.f_Span_spanFile = (v_fileOf st); Base_dSource.f_Span_spanStartLine = (Base_dSource.v_posLine (v_peekPos st)); Base_dSource.f_Span_spanStartCol = (Base_dSource.v_posCol (v_peekPos st)); Base_dSource.f_Span_spanEndLine = (Base_dSource.v_posLine p1); Base_dSource.f_Span_spanEndCol = (v_lastEndCol p1); Base_dSource.f_Span_spanStartOffset = (Base_dSource.v_posOffset (v_peekPos st)); Base_dSource.f_Span_spanEndOffset = (Base_dSource.v_posEndOffset p1) }))

# 203 "Vuna/Compiler/Frontend/Parser/Support.vuna"
let v_spanFromStart = (fun (file : string) (start : Base_dSource.t_Pos) (st : t_PState) -> (let p1 = (v_lastPos st) in { Base_dSource.f_Span_spanFile = file; Base_dSource.f_Span_spanStartLine = (Base_dSource.v_posLine start); Base_dSource.f_Span_spanStartCol = (Base_dSource.v_posCol start); Base_dSource.f_Span_spanEndLine = (Base_dSource.v_posLine p1); Base_dSource.f_Span_spanEndCol = (v_lastEndCol p1); Base_dSource.f_Span_spanStartOffset = (Base_dSource.v_posOffset start); Base_dSource.f_Span_spanEndOffset = (Base_dSource.v_posEndOffset p1) }))

# 243 "Vuna/Compiler/Frontend/Parser/Support.vuna"
let v_tokSpan = (fun (st : t_PState) -> (let nd_uscrut1 = (v_peekTok st) in (match nd_uscrut1 with
  | { Frontend_dLexer.f_PTok_ptokTok = dtb__196; Frontend_dLexer.f_PTok_ptokPos = dtb__197 } -> (match dtb__196 with
  | Frontend_dLexer.C_Tok_TEof -> (let p = (v_lastPos st) in { Base_dSource.f_Span_spanFile = (v_fileOf st); Base_dSource.f_Span_spanStartLine = (Base_dSource.v_posLine p); Base_dSource.f_Span_spanStartCol = (Base_dSource.v_posCol p); Base_dSource.f_Span_spanEndLine = (Base_dSource.v_posLine p); Base_dSource.f_Span_spanEndCol = (Base_dSource.v_posCol p); Base_dSource.f_Span_spanStartOffset = (Base_dSource.v_posOffset p); Base_dSource.f_Span_spanEndOffset = (Base_dSource.v_posOffset p) })
  | _ -> { Base_dSource.f_Span_spanFile = (v_fileOf st); Base_dSource.f_Span_spanStartLine = (Base_dSource.v_posLine dtb__197); Base_dSource.f_Span_spanStartCol = (Base_dSource.v_posCol dtb__197); Base_dSource.f_Span_spanEndLine = (Base_dSource.v_posLine dtb__197); Base_dSource.f_Span_spanEndCol = (Base_dSource.v_posCol dtb__197); Base_dSource.f_Span_spanStartOffset = (Base_dSource.v_posOffset dtb__197); Base_dSource.f_Span_spanEndOffset = (Base_dSource.v_posOffset dtb__197) }
)
  | _ -> failwith "DT: impossible branch"
)))

# 379 "Vuna/Compiler/Frontend/Parser/Support.vuna"
let v_canContinue = (fun (st : t_PState) (blockCol : int) -> (match (v_peekPos st) with
  | { Base_dSource.f_Pos_posLine = dtb__198; Base_dSource.f_Pos_posCol = dtb__199; Base_dSource.f_Pos_posOffset = dtb__200; Base_dSource.f_Pos_posEndOffset = dtb__201 } -> (match (v_lastPos st) with
  | { Base_dSource.f_Pos_posLine = dtb__202; Base_dSource.f_Pos_posCol = dtb__203; Base_dSource.f_Pos_posOffset = dtb__204; Base_dSource.f_Pos_posEndOffset = dtb__205 } -> (if (dtb__198 = dtb__202) then true else (dtb__199 > blockCol))
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
))

# 426 "Vuna/Compiler/Frontend/Parser/Support.vuna"
let v_expectSym = (fun (st : t_PState) (s : string) -> (let nd_uscrut2 = (v_peekTok st) in (match nd_uscrut2 with
  | { Frontend_dLexer.f_PTok_ptokTok = dtb__206; Frontend_dLexer.f_PTok_ptokPos = dtb__207 } -> (match dtb__206 with
  | Frontend_dLexer.C_Tok_TSym (dtb__208) -> (if (dtb__208 = s) then (Base_dDiag.C_Check_OkC ((v_advance st))) else (((Base_dDiagnostics_dFrontend.v_psErr1At (v_tokSpan st)) (Base_dDiagnostics_dFrontend.C_PsDiag_ExpectedToken (s))) s))
  | _ -> (((Base_dDiagnostics_dFrontend.v_psErr1At (v_tokSpan st)) (Base_dDiagnostics_dFrontend.C_PsDiag_ExpectedToken (s))) s)
)
  | _ -> failwith "DT: impossible branch"
)))

# 433 "Vuna/Compiler/Frontend/Parser/Support.vuna"
let v_expectKw = (fun (st : t_PState) (k : string) -> (let nd_uscrut2 = (v_peekTok st) in (match nd_uscrut2 with
  | { Frontend_dLexer.f_PTok_ptokTok = dtb__209; Frontend_dLexer.f_PTok_ptokPos = dtb__210 } -> (match dtb__209 with
  | Frontend_dLexer.C_Tok_TKw (dtb__211) -> (if (dtb__211 = k) then (Base_dDiag.C_Check_OkC ((v_advance st))) else (((Base_dDiagnostics_dFrontend.v_psErr1At (v_tokSpan st)) (Base_dDiagnostics_dFrontend.C_PsDiag_ExpectedToken (k))) k))
  | _ -> (((Base_dDiagnostics_dFrontend.v_psErr1At (v_tokSpan st)) (Base_dDiagnostics_dFrontend.C_PsDiag_ExpectedToken (k))) k)
)
  | _ -> failwith "DT: impossible branch"
)))

# 439 "Vuna/Compiler/Frontend/Parser/Support.vuna"
let v_expectIdent = (fun (st : t_PState) -> (let nd_uscrut1 = (v_peekTok st) in (match nd_uscrut1 with
  | { Frontend_dLexer.f_PTok_ptokTok = dtb__212; Frontend_dLexer.f_PTok_ptokPos = dtb__213 } -> (match dtb__212 with
  | Frontend_dLexer.C_Tok_TIdent (dtb__214) -> (Base_dDiag.C_Check_OkC ({ B_dData_dPair.f_Pair_first = dtb__214; B_dData_dPair.f_Pair_second = (v_advance st) }))
  | _ -> ((Base_dDiagnostics_dFrontend.v_psErr0At (v_tokSpan st)) Base_dDiagnostics_dFrontend.C_PsDiag_ExpectedIdentifier)
)
  | _ -> failwith "DT: impossible branch"
)))

# 447 "Vuna/Compiler/Frontend/Parser/Support.vuna"
let v_expectValueName = (fun (st : t_PState) -> (let nd_uscrut1 = (v_peekTok st) in (match nd_uscrut1 with
  | { Frontend_dLexer.f_PTok_ptokTok = dtb__215; Frontend_dLexer.f_PTok_ptokPos = dtb__216 } -> (match dtb__215 with
  | Frontend_dLexer.C_Tok_TSym (dtb__217) -> (if (v_isReservedValueName dtb__217) then (((Base_dDiagnostics_dFrontend.v_psErr1At (v_tokSpan st)) (Base_dDiagnostics_dFrontend.C_PsDiag_ExpectedToken ("value name"))) "value name") else (Base_dDiag.C_Check_OkC ({ B_dData_dPair.f_Pair_first = dtb__217; B_dData_dPair.f_Pair_second = (v_advance st) })))
  | Frontend_dLexer.C_Tok_TIdent (dtb__218) -> (if (v_isReservedValueName dtb__218) then (((Base_dDiagnostics_dFrontend.v_psErr1At (v_tokSpan st)) (Base_dDiagnostics_dFrontend.C_PsDiag_ExpectedToken ("value name"))) "value name") else (Base_dDiag.C_Check_OkC ({ B_dData_dPair.f_Pair_first = dtb__218; B_dData_dPair.f_Pair_second = (v_advance st) })))
  | _ -> ((Base_dDiagnostics_dFrontend.v_psErr0At (v_tokSpan st)) Base_dDiagnostics_dFrontend.C_PsDiag_ExpectedIdentifier)
)
  | _ -> failwith "DT: impossible branch"
)))

# 43 "Vuna/Compiler/Frontend/Parser/Support.vuna"
let v_toksLeft = (fun (p : t_PState) -> (match p with
  | { f_PState_fileOf = dtb__219; f_PState_sourceOf = dtb__220; f_PState_toksOf = dtb__221; f_PState_lastPos = dtb__222; f_PState_toksLeft = dtb__223; f_PState_pmodeOf = dtb__224; f_PState_tokIndex = dtb__225; f_PState_pendEvents = dtb__226; f_PState_nextNodeId = dtb__227; f_PState_openNodeId = dtb__228; f_PState_subStream = dtb__229; f_PState_backtickShapes = dtb__230; f_PState_sectionShapes = dtb__231; f_PState_interpMultis = dtb__232; f_PState_templateHoles = dtb__233; f_PState_eventMode = dtb__234 } -> dtb__223
  | _ -> failwith "DT: impossible branch"
))

# 44 "Vuna/Compiler/Frontend/Parser/Support.vuna"
let v_pmodeOf = (fun (p : t_PState) -> (match p with
  | { f_PState_fileOf = dtb__235; f_PState_sourceOf = dtb__236; f_PState_toksOf = dtb__237; f_PState_lastPos = dtb__238; f_PState_toksLeft = dtb__239; f_PState_pmodeOf = dtb__240; f_PState_tokIndex = dtb__241; f_PState_pendEvents = dtb__242; f_PState_nextNodeId = dtb__243; f_PState_openNodeId = dtb__244; f_PState_subStream = dtb__245; f_PState_backtickShapes = dtb__246; f_PState_sectionShapes = dtb__247; f_PState_interpMultis = dtb__248; f_PState_templateHoles = dtb__249; f_PState_eventMode = dtb__250 } -> dtb__240
  | _ -> failwith "DT: impossible branch"
))

# 45 "Vuna/Compiler/Frontend/Parser/Support.vuna"
let v_tokIndex = (fun (p : t_PState) -> (match p with
  | { f_PState_fileOf = dtb__251; f_PState_sourceOf = dtb__252; f_PState_toksOf = dtb__253; f_PState_lastPos = dtb__254; f_PState_toksLeft = dtb__255; f_PState_pmodeOf = dtb__256; f_PState_tokIndex = dtb__257; f_PState_pendEvents = dtb__258; f_PState_nextNodeId = dtb__259; f_PState_openNodeId = dtb__260; f_PState_subStream = dtb__261; f_PState_backtickShapes = dtb__262; f_PState_sectionShapes = dtb__263; f_PState_interpMultis = dtb__264; f_PState_templateHoles = dtb__265; f_PState_eventMode = dtb__266 } -> dtb__257
  | _ -> failwith "DT: impossible branch"
))

# 46 "Vuna/Compiler/Frontend/Parser/Support.vuna"
let v_pendEvents = (fun (p : t_PState) -> (match p with
  | { f_PState_fileOf = dtb__267; f_PState_sourceOf = dtb__268; f_PState_toksOf = dtb__269; f_PState_lastPos = dtb__270; f_PState_toksLeft = dtb__271; f_PState_pmodeOf = dtb__272; f_PState_tokIndex = dtb__273; f_PState_pendEvents = dtb__274; f_PState_nextNodeId = dtb__275; f_PState_openNodeId = dtb__276; f_PState_subStream = dtb__277; f_PState_backtickShapes = dtb__278; f_PState_sectionShapes = dtb__279; f_PState_interpMultis = dtb__280; f_PState_templateHoles = dtb__281; f_PState_eventMode = dtb__282 } -> dtb__274
  | _ -> failwith "DT: impossible branch"
))

# 49 "Vuna/Compiler/Frontend/Parser/Support.vuna"
let v_nextNodeId = (fun (p : t_PState) -> (match p with
  | { f_PState_fileOf = dtb__283; f_PState_sourceOf = dtb__284; f_PState_toksOf = dtb__285; f_PState_lastPos = dtb__286; f_PState_toksLeft = dtb__287; f_PState_pmodeOf = dtb__288; f_PState_tokIndex = dtb__289; f_PState_pendEvents = dtb__290; f_PState_nextNodeId = dtb__291; f_PState_openNodeId = dtb__292; f_PState_subStream = dtb__293; f_PState_backtickShapes = dtb__294; f_PState_sectionShapes = dtb__295; f_PState_interpMultis = dtb__296; f_PState_templateHoles = dtb__297; f_PState_eventMode = dtb__298 } -> dtb__291
  | _ -> failwith "DT: impossible branch"
))

# 52 "Vuna/Compiler/Frontend/Parser/Support.vuna"
let v_openNodeId = (fun (p : t_PState) -> (match p with
  | { f_PState_fileOf = dtb__299; f_PState_sourceOf = dtb__300; f_PState_toksOf = dtb__301; f_PState_lastPos = dtb__302; f_PState_toksLeft = dtb__303; f_PState_pmodeOf = dtb__304; f_PState_tokIndex = dtb__305; f_PState_pendEvents = dtb__306; f_PState_nextNodeId = dtb__307; f_PState_openNodeId = dtb__308; f_PState_subStream = dtb__309; f_PState_backtickShapes = dtb__310; f_PState_sectionShapes = dtb__311; f_PState_interpMultis = dtb__312; f_PState_templateHoles = dtb__313; f_PState_eventMode = dtb__314 } -> dtb__308
  | _ -> failwith "DT: impossible branch"
))

# 57 "Vuna/Compiler/Frontend/Parser/Support.vuna"
let v_subStream = (fun (p : t_PState) -> (match p with
  | { f_PState_fileOf = dtb__315; f_PState_sourceOf = dtb__316; f_PState_toksOf = dtb__317; f_PState_lastPos = dtb__318; f_PState_toksLeft = dtb__319; f_PState_pmodeOf = dtb__320; f_PState_tokIndex = dtb__321; f_PState_pendEvents = dtb__322; f_PState_nextNodeId = dtb__323; f_PState_openNodeId = dtb__324; f_PState_subStream = dtb__325; f_PState_backtickShapes = dtb__326; f_PState_sectionShapes = dtb__327; f_PState_interpMultis = dtb__328; f_PState_templateHoles = dtb__329; f_PState_eventMode = dtb__330 } -> dtb__325
  | _ -> failwith "DT: impossible branch"
))

# 60 "Vuna/Compiler/Frontend/Parser/Support.vuna"
let v_backtickShapes = (fun (p : t_PState) -> (match p with
  | { f_PState_fileOf = dtb__331; f_PState_sourceOf = dtb__332; f_PState_toksOf = dtb__333; f_PState_lastPos = dtb__334; f_PState_toksLeft = dtb__335; f_PState_pmodeOf = dtb__336; f_PState_tokIndex = dtb__337; f_PState_pendEvents = dtb__338; f_PState_nextNodeId = dtb__339; f_PState_openNodeId = dtb__340; f_PState_subStream = dtb__341; f_PState_backtickShapes = dtb__342; f_PState_sectionShapes = dtb__343; f_PState_interpMultis = dtb__344; f_PState_templateHoles = dtb__345; f_PState_eventMode = dtb__346 } -> dtb__342
  | _ -> failwith "DT: impossible branch"
))

# 62 "Vuna/Compiler/Frontend/Parser/Support.vuna"
let v_sectionShapes = (fun (p : t_PState) -> (match p with
  | { f_PState_fileOf = dtb__347; f_PState_sourceOf = dtb__348; f_PState_toksOf = dtb__349; f_PState_lastPos = dtb__350; f_PState_toksLeft = dtb__351; f_PState_pmodeOf = dtb__352; f_PState_tokIndex = dtb__353; f_PState_pendEvents = dtb__354; f_PState_nextNodeId = dtb__355; f_PState_openNodeId = dtb__356; f_PState_subStream = dtb__357; f_PState_backtickShapes = dtb__358; f_PState_sectionShapes = dtb__359; f_PState_interpMultis = dtb__360; f_PState_templateHoles = dtb__361; f_PState_eventMode = dtb__362 } -> dtb__359
  | _ -> failwith "DT: impossible branch"
))

# 64 "Vuna/Compiler/Frontend/Parser/Support.vuna"
let v_interpMultis = (fun (p : t_PState) -> (match p with
  | { f_PState_fileOf = dtb__363; f_PState_sourceOf = dtb__364; f_PState_toksOf = dtb__365; f_PState_lastPos = dtb__366; f_PState_toksLeft = dtb__367; f_PState_pmodeOf = dtb__368; f_PState_tokIndex = dtb__369; f_PState_pendEvents = dtb__370; f_PState_nextNodeId = dtb__371; f_PState_openNodeId = dtb__372; f_PState_subStream = dtb__373; f_PState_backtickShapes = dtb__374; f_PState_sectionShapes = dtb__375; f_PState_interpMultis = dtb__376; f_PState_templateHoles = dtb__377; f_PState_eventMode = dtb__378 } -> dtb__376
  | _ -> failwith "DT: impossible branch"
))

# 69 "Vuna/Compiler/Frontend/Parser/Support.vuna"
let v_templateHoles = (fun (p : t_PState) -> (match p with
  | { f_PState_fileOf = dtb__379; f_PState_sourceOf = dtb__380; f_PState_toksOf = dtb__381; f_PState_lastPos = dtb__382; f_PState_toksLeft = dtb__383; f_PState_pmodeOf = dtb__384; f_PState_tokIndex = dtb__385; f_PState_pendEvents = dtb__386; f_PState_nextNodeId = dtb__387; f_PState_openNodeId = dtb__388; f_PState_subStream = dtb__389; f_PState_backtickShapes = dtb__390; f_PState_sectionShapes = dtb__391; f_PState_interpMultis = dtb__392; f_PState_templateHoles = dtb__393; f_PState_eventMode = dtb__394 } -> dtb__393
  | _ -> failwith "DT: impossible branch"
))

# 71 "Vuna/Compiler/Frontend/Parser/Support.vuna"
let v_eventMode = (fun (p : t_PState) -> (match p with
  | { f_PState_fileOf = dtb__395; f_PState_sourceOf = dtb__396; f_PState_toksOf = dtb__397; f_PState_lastPos = dtb__398; f_PState_toksLeft = dtb__399; f_PState_pmodeOf = dtb__400; f_PState_tokIndex = dtb__401; f_PState_pendEvents = dtb__402; f_PState_nextNodeId = dtb__403; f_PState_openNodeId = dtb__404; f_PState_subStream = dtb__405; f_PState_backtickShapes = dtb__406; f_PState_sectionShapes = dtb__407; f_PState_interpMultis = dtb__408; f_PState_templateHoles = dtb__409; f_PState_eventMode = dtb__410 } -> dtb__410
  | _ -> failwith "DT: impossible branch"
))
