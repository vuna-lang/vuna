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
let rec v_rekeyInfixGo = (fun (mc0 : int) (mc1 : int) (mc2 : (int, bool) B_dData_dPair.t_Pair B_dData_dList.t_List) -> (match mc2 with
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

# 424 "Vuna/Compiler/Frontend/Parser/Support.vuna"
let v_upperFirst = (fun (s : string) -> (match (B_dData_dList.dtp_unpack s) with
  | B_dData_dList.C_List__x58__x58_ (dtb__51, dtb__52) -> (if (dtb__51 >= 65) then (dtb__51 <= 90) else false)
  | B_dData_dList.C_List_Nil -> false
  | _ -> failwith "DT: impossible branch"
))

# 432 "Vuna/Compiler/Frontend/Parser/Support.vuna"
let v_underscoreCtorName = (fun (s : string) -> (match (B_dData_dList.dtp_unpack s) with
  | B_dData_dList.C_List__x58__x58_ (dtb__53, dtb__54) -> (if (dtb__53 = 95) then (match dtb__54 with
  | B_dData_dList.C_List__x58__x58_ (dtb__55, dtb__56) -> (if (dtb__55 >= 65) then (dtb__55 <= 90) else false)
  | B_dData_dList.C_List_Nil -> false
  | _ -> failwith "DT: impossible branch"
) else false)
  | B_dData_dList.C_List_Nil -> false
  | _ -> failwith "DT: impossible branch"
))

# 444 "Vuna/Compiler/Frontend/Parser/Support.vuna"
let v_ctorPatternStart = (fun (name : string) -> (if (v_upperFirst name) then true else (v_underscoreCtorName name)))

# 481 "Vuna/Compiler/Frontend/Parser/Support.vuna"
let v_startsPatternAtom = (fun (st : t_PState) -> (let nd_uscrut1 = (v_peekTok st) in (match nd_uscrut1 with
  | { Frontend_dLexer.f_PTok_ptokTok = dtb__57; Frontend_dLexer.f_PTok_ptokPos = dtb__58 } -> (match dtb__57 with
  | Frontend_dLexer.C_Tok_TSym (dtb__59) -> (if (dtb__59 = "(") then true else (if (dtb__59 = "[") then true else false))
  | Frontend_dLexer.C_Tok_TTmpl (dtb__60, dtb__61, dtb__62) -> true
  | Frontend_dLexer.C_Tok_TStr (dtb__63) -> true
  | Frontend_dLexer.C_Tok_TInt (dtb__64) -> true
  | Frontend_dLexer.C_Tok_TIdent (dtb__65) -> true
  | _ -> false
)
  | _ -> failwith "DT: impossible branch"
)))

# 494 "Vuna/Compiler/Frontend/Parser/Support.vuna"
let v_isSyntaxSym = (fun (op : string) -> (if (op = "=") then true else (if (op = ":") then true else (if (op = ",") then true else (if (op = ";") then true else (if (op = "|") then true else (if (op = "=>") then true else (if (op = "<-") then true else (if (op = "\\") then true else (if (op = ".") then true else (if (op = "..") then true else (if (op = "@") then true else (if (op = "(") then true else (if (op = ")") then true else (if (op = "[") then true else (if (op = "]") then true else (if (op = "{") then true else (if (op = "}") then true else false))))))))))))))))))

# 521 "Vuna/Compiler/Frontend/Parser/Support.vuna"
let v_isReservedValueName = (fun (name : string) -> (if (if (v_isSyntaxSym name) then true else (name = "->")) then true else (name = "`")))

# 526 "Vuna/Compiler/Frontend/Parser/Support.vuna"
let v_closeParenNext = (fun (st : t_PState) -> (let nd_uscrut1 = ((v_peekTokAt st) 1) in (match nd_uscrut1 with
  | B_dData_dMaybe.C_Maybe_Just (dtb__66) -> (match dtb__66 with
  | { Frontend_dLexer.f_PTok_ptokTok = dtb__67; Frontend_dLexer.f_PTok_ptokPos = dtb__68 } -> (match dtb__67 with
  | Frontend_dLexer.C_Tok_TSym (dtb__69) -> (if (dtb__69 = ")") then true else false)
  | _ -> false
)
  | _ -> failwith "DT: impossible branch"
)
  | _ -> false
)))

# 549 "Vuna/Compiler/Frontend/Parser/Support.vuna"
let v_minusLiteralAt = (fun (p : Base_dSource.t_Pos) (st : t_PState) -> (let nd_uscrut2 = ((v_peekTokAt st) 2) in (match nd_uscrut2 with
  | B_dData_dMaybe.C_Maybe_Just (dtb__70) -> (match dtb__70 with
  | { Frontend_dLexer.f_PTok_ptokTok = dtb__71; Frontend_dLexer.f_PTok_ptokPos = dtb__72 } -> (match dtb__71 with
  | Frontend_dLexer.C_Tok_TFloat (dtb__73) -> (if ((Base_dSource.v_posLine dtb__72) = (Base_dSource.v_posLine p)) then ((Base_dSource.v_posCol dtb__72) = ((Base_dSource.v_posCol p) + 1)) else false)
  | Frontend_dLexer.C_Tok_TInt (dtb__74) -> (if ((Base_dSource.v_posLine dtb__72) = (Base_dSource.v_posLine p)) then ((Base_dSource.v_posCol dtb__72) = ((Base_dSource.v_posCol p) + 1)) else false)
  | _ -> false
)
  | _ -> failwith "DT: impossible branch"
)
  | _ -> false
)))

# 556 "Vuna/Compiler/Frontend/Parser/Support.vuna"
let rec v_countArrows = (fun (mc0 : Frontend_dAst.t_Expr) -> (match mc0 with
  | Frontend_dAst.C_Expr_EApp (dtb__75, dtb__76, dtb__77) -> (match dtb__75 with
  | Frontend_dAst.C_Expr_EVar (dtb__78, dtb__79) -> (if (dtb__78 = "->") then (match dtb__76 with
  | B_dData_dList.C_List__x58__x58_ (dtb__80, dtb__81) -> (match dtb__81 with
  | B_dData_dList.C_List__x58__x58_ (dtb__82, dtb__83) -> (match dtb__83 with
  | B_dData_dList.C_List_Nil -> (1 + (v_countArrows dtb__82))
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

# 560 "Vuna/Compiler/Frontend/Parser/Support.vuna"
let v_terminatesExpression = (fun (mc0 : Frontend_dLexer.t_PTok) -> (match mc0 with
  | { Frontend_dLexer.f_PTok_ptokTok = dtb__84; Frontend_dLexer.f_PTok_ptokPos = dtb__85 } -> (match dtb__84 with
  | Frontend_dLexer.C_Tok_TKw (dtb__86) -> (if (dtb__86 = "else") then true else (if (dtb__86 = "in") then true else (if (dtb__86 = "then") then true else false)))
  | Frontend_dLexer.C_Tok_TSym (dtb__87) -> (if (dtb__87 = ")") then true else (if (dtb__87 = "]") then true else (if (dtb__87 = ",") then true else false)))
  | _ -> false
)
  | _ -> failwith "DT: impossible branch"
))

# 569 "Vuna/Compiler/Frontend/Parser/Support.vuna"
let v_badCaseIndent = (fun (st : t_PState) (altCol : int) -> (if (v_isEof st) then false else (match (v_peekPos st) with
  | { Base_dSource.f_Pos_posLine = dtb__88; Base_dSource.f_Pos_posCol = dtb__89; Base_dSource.f_Pos_posOffset = dtb__90; Base_dSource.f_Pos_posEndOffset = dtb__91 } -> (if (dtb__89 > altCol) then (if (v_terminatesExpression (v_peekTok st)) then false else true) else false)
  | _ -> failwith "DT: impossible branch"
)))

# 38 "Vuna/Compiler/Frontend/Parser/Support.vuna"
let v_fileOf = (fun (p : t_PState) -> (match p with
  | { f_PState_fileOf = dtb__92; f_PState_sourceOf = dtb__93; f_PState_toksOf = dtb__94; f_PState_lastPos = dtb__95; f_PState_toksLeft = dtb__96; f_PState_pmodeOf = dtb__97; f_PState_tokIndex = dtb__98; f_PState_pendEvents = dtb__99; f_PState_nextNodeId = dtb__100; f_PState_openNodeId = dtb__101; f_PState_subStream = dtb__102; f_PState_backtickShapes = dtb__103; f_PState_sectionShapes = dtb__104; f_PState_interpMultis = dtb__105; f_PState_templateHoles = dtb__106; f_PState_eventMode = dtb__107 } -> dtb__92
  | _ -> failwith "DT: impossible branch"
))

# 218 "Vuna/Compiler/Frontend/Parser/Support.vuna"
let v_tokenSpan = (fun (st : t_PState) -> (let p = (v_peekPos st) in (let len = ((Base_dSource.v_posEndOffset p) - (Base_dSource.v_posOffset p)) in { Base_dSource.f_Span_spanFile = (v_fileOf st); Base_dSource.f_Span_spanStartLine = (Base_dSource.v_posLine p); Base_dSource.f_Span_spanStartCol = (Base_dSource.v_posCol p); Base_dSource.f_Span_spanEndLine = (Base_dSource.v_posLine p); Base_dSource.f_Span_spanEndCol = ((Base_dSource.v_posCol p) + len); Base_dSource.f_Span_spanStartOffset = (Base_dSource.v_posOffset p); Base_dSource.f_Span_spanEndOffset = (Base_dSource.v_posEndOffset p) })))

# 467 "Vuna/Compiler/Frontend/Parser/Support.vuna"
let v_holeAtomAt = (fun (st : t_PState) -> (let nd_uscrut1 = (v_peekTok st) in (match nd_uscrut1 with
  | { Frontend_dLexer.f_PTok_ptokTok = dtb__108; Frontend_dLexer.f_PTok_ptokPos = dtb__109 } -> (match dtb__108 with
  | Frontend_dLexer.C_Tok_TSym (dtb__110) -> (if (dtb__110 = "?") then (let nd_uscrut5 = ((v_peekTokAt st) 1) in (match nd_uscrut5 with
  | B_dData_dMaybe.C_Maybe_Just (dtb__111) -> (match dtb__111 with
  | { Frontend_dLexer.f_PTok_ptokTok = dtb__112; Frontend_dLexer.f_PTok_ptokPos = dtb__113 } -> (match dtb__112 with
  | Frontend_dLexer.C_Tok_TIdent (dtb__114) -> (if (if ((Base_dSource.v_posLine dtb__113) = (Base_dSource.v_posLine dtb__109)) then ((Base_dSource.v_posCol dtb__113) = ((Base_dSource.v_posCol dtb__109) + 1)) else false) then (B_dData_dMaybe.C_Maybe_Just ({ B_dData_dPair.f_Pair_first = ("?" ^ dtb__114); B_dData_dPair.f_Pair_second = { Base_dSource.f_Span_spanFile = (v_fileOf st); Base_dSource.f_Span_spanStartLine = (Base_dSource.v_posLine dtb__109); Base_dSource.f_Span_spanStartCol = (Base_dSource.v_posCol dtb__109); Base_dSource.f_Span_spanEndLine = (Base_dSource.v_posLine dtb__113); Base_dSource.f_Span_spanEndCol = ((Base_dSource.v_posCol dtb__113) + (bi_strLength dtb__114)); Base_dSource.f_Span_spanStartOffset = (Base_dSource.v_posOffset dtb__109); Base_dSource.f_Span_spanEndOffset = ((Base_dSource.v_posOffset dtb__113) + (bi_strLength dtb__114)) } })) else B_dData_dMaybe.C_Maybe_Nothing)
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

# 447 "Vuna/Compiler/Frontend/Parser/Support.vuna"
let v_startsAtom = (fun (st : t_PState) -> (let nd_uscrut1 = (v_peekTok st) in (match nd_uscrut1 with
  | { Frontend_dLexer.f_PTok_ptokTok = dtb__115; Frontend_dLexer.f_PTok_ptokPos = dtb__116 } -> (match dtb__115 with
  | Frontend_dLexer.C_Tok_TSym (dtb__117) -> (if (dtb__117 = "(") then true else (if (dtb__117 = "[") then true else (if (dtb__117 = "?") then (match (v_holeAtomAt st) with
  | B_dData_dMaybe.C_Maybe_Just (dtb__118) -> true
  | B_dData_dMaybe.C_Maybe_Nothing -> false
  | _ -> failwith "DT: impossible branch"
) else false)))
  | Frontend_dLexer.C_Tok_TKw (dtb__119) -> (if (dtb__119 = "Type") then true else false)
  | Frontend_dLexer.C_Tok_TTmpl (dtb__120, dtb__121, dtb__122) -> true
  | Frontend_dLexer.C_Tok_TStr (dtb__123) -> true
  | Frontend_dLexer.C_Tok_TFloat (dtb__124) -> true
  | Frontend_dLexer.C_Tok_TInt (dtb__125) -> true
  | Frontend_dLexer.C_Tok_TIdent (dtb__126) -> true
  | _ -> false
)
  | _ -> failwith "DT: impossible branch"
)))

# 535 "Vuna/Compiler/Frontend/Parser/Support.vuna"
let v_sectionOpAt = (fun (st : t_PState) -> (let nd_uscrut1 = ((v_peekTokAt st) 1) in (match nd_uscrut1 with
  | B_dData_dMaybe.C_Maybe_Just (dtb__127) -> (match dtb__127 with
  | { Frontend_dLexer.f_PTok_ptokTok = dtb__128; Frontend_dLexer.f_PTok_ptokPos = dtb__129 } -> (match dtb__128 with
  | Frontend_dLexer.C_Tok_TSym (dtb__130) -> (if (v_isReservedValueName dtb__130) then B_dData_dMaybe.C_Maybe_Nothing else (if (dtb__130 = "?") then (match (v_holeAtomAt (v_advance st)) with
  | B_dData_dMaybe.C_Maybe_Just (dtb__131) -> B_dData_dMaybe.C_Maybe_Nothing
  | B_dData_dMaybe.C_Maybe_Nothing -> (B_dData_dMaybe.C_Maybe_Just (dtb__130))
  | _ -> failwith "DT: impossible branch"
) else (if (if (dtb__130 = "-") then ((v_minusLiteralAt dtb__129) st) else false) then B_dData_dMaybe.C_Maybe_Nothing else (B_dData_dMaybe.C_Maybe_Just (dtb__130)))))
  | _ -> B_dData_dMaybe.C_Maybe_Nothing
)
  | _ -> failwith "DT: impossible branch"
)
  | _ -> B_dData_dMaybe.C_Maybe_Nothing
)))

# 40 "Vuna/Compiler/Frontend/Parser/Support.vuna"
let v_sourceOf = (fun (p : t_PState) -> (match p with
  | { f_PState_fileOf = dtb__132; f_PState_sourceOf = dtb__133; f_PState_toksOf = dtb__134; f_PState_lastPos = dtb__135; f_PState_toksLeft = dtb__136; f_PState_pmodeOf = dtb__137; f_PState_tokIndex = dtb__138; f_PState_pendEvents = dtb__139; f_PState_nextNodeId = dtb__140; f_PState_openNodeId = dtb__141; f_PState_subStream = dtb__142; f_PState_backtickShapes = dtb__143; f_PState_sectionShapes = dtb__144; f_PState_interpMultis = dtb__145; f_PState_templateHoles = dtb__146; f_PState_eventMode = dtb__147 } -> dtb__133
  | _ -> failwith "DT: impossible branch"
))

# 41 "Vuna/Compiler/Frontend/Parser/Support.vuna"
let v_toksOf = (fun (p : t_PState) -> (match p with
  | { f_PState_fileOf = dtb__148; f_PState_sourceOf = dtb__149; f_PState_toksOf = dtb__150; f_PState_lastPos = dtb__151; f_PState_toksLeft = dtb__152; f_PState_pmodeOf = dtb__153; f_PState_tokIndex = dtb__154; f_PState_pendEvents = dtb__155; f_PState_nextNodeId = dtb__156; f_PState_openNodeId = dtb__157; f_PState_subStream = dtb__158; f_PState_backtickShapes = dtb__159; f_PState_sectionShapes = dtb__160; f_PState_interpMultis = dtb__161; f_PState_templateHoles = dtb__162; f_PState_eventMode = dtb__163 } -> dtb__150
  | _ -> failwith "DT: impossible branch"
))

# 42 "Vuna/Compiler/Frontend/Parser/Support.vuna"
let v_lastPos = (fun (p : t_PState) -> (match p with
  | { f_PState_fileOf = dtb__164; f_PState_sourceOf = dtb__165; f_PState_toksOf = dtb__166; f_PState_lastPos = dtb__167; f_PState_toksLeft = dtb__168; f_PState_pmodeOf = dtb__169; f_PState_tokIndex = dtb__170; f_PState_pendEvents = dtb__171; f_PState_nextNodeId = dtb__172; f_PState_openNodeId = dtb__173; f_PState_subStream = dtb__174; f_PState_backtickShapes = dtb__175; f_PState_sectionShapes = dtb__176; f_PState_interpMultis = dtb__177; f_PState_templateHoles = dtb__178; f_PState_eventMode = dtb__179 } -> dtb__167
  | _ -> failwith "DT: impossible branch"
))

# 189 "Vuna/Compiler/Frontend/Parser/Support.vuna"
let v_spanOf = (fun (st : t_PState) (st2 : t_PState) -> (let p1 = (v_lastPos st2) in { Base_dSource.f_Span_spanFile = (v_fileOf st); Base_dSource.f_Span_spanStartLine = (Base_dSource.v_posLine (v_peekPos st)); Base_dSource.f_Span_spanStartCol = (Base_dSource.v_posCol (v_peekPos st)); Base_dSource.f_Span_spanEndLine = (Base_dSource.v_posLine p1); Base_dSource.f_Span_spanEndCol = (v_lastEndCol p1); Base_dSource.f_Span_spanStartOffset = (Base_dSource.v_posOffset (v_peekPos st)); Base_dSource.f_Span_spanEndOffset = (Base_dSource.v_posEndOffset p1) }))

# 203 "Vuna/Compiler/Frontend/Parser/Support.vuna"
let v_spanFromStart = (fun (file : string) (start : Base_dSource.t_Pos) (st : t_PState) -> (let p1 = (v_lastPos st) in { Base_dSource.f_Span_spanFile = file; Base_dSource.f_Span_spanStartLine = (Base_dSource.v_posLine start); Base_dSource.f_Span_spanStartCol = (Base_dSource.v_posCol start); Base_dSource.f_Span_spanEndLine = (Base_dSource.v_posLine p1); Base_dSource.f_Span_spanEndCol = (v_lastEndCol p1); Base_dSource.f_Span_spanStartOffset = (Base_dSource.v_posOffset start); Base_dSource.f_Span_spanEndOffset = (Base_dSource.v_posEndOffset p1) }))

# 243 "Vuna/Compiler/Frontend/Parser/Support.vuna"
let v_tokSpan = (fun (st : t_PState) -> (let nd_uscrut1 = (v_peekTok st) in (match nd_uscrut1 with
  | { Frontend_dLexer.f_PTok_ptokTok = dtb__180; Frontend_dLexer.f_PTok_ptokPos = dtb__181 } -> (match dtb__180 with
  | Frontend_dLexer.C_Tok_TEof -> (let p = (v_lastPos st) in { Base_dSource.f_Span_spanFile = (v_fileOf st); Base_dSource.f_Span_spanStartLine = (Base_dSource.v_posLine p); Base_dSource.f_Span_spanStartCol = (Base_dSource.v_posCol p); Base_dSource.f_Span_spanEndLine = (Base_dSource.v_posLine p); Base_dSource.f_Span_spanEndCol = (Base_dSource.v_posCol p); Base_dSource.f_Span_spanStartOffset = (Base_dSource.v_posOffset p); Base_dSource.f_Span_spanEndOffset = (Base_dSource.v_posOffset p) })
  | _ -> { Base_dSource.f_Span_spanFile = (v_fileOf st); Base_dSource.f_Span_spanStartLine = (Base_dSource.v_posLine dtb__181); Base_dSource.f_Span_spanStartCol = (Base_dSource.v_posCol dtb__181); Base_dSource.f_Span_spanEndLine = (Base_dSource.v_posLine dtb__181); Base_dSource.f_Span_spanEndCol = (Base_dSource.v_posCol dtb__181); Base_dSource.f_Span_spanStartOffset = (Base_dSource.v_posOffset dtb__181); Base_dSource.f_Span_spanEndOffset = (Base_dSource.v_posOffset dtb__181) }
)
  | _ -> failwith "DT: impossible branch"
)))

# 379 "Vuna/Compiler/Frontend/Parser/Support.vuna"
let v_canContinue = (fun (st : t_PState) (blockCol : int) -> (match (v_peekPos st) with
  | { Base_dSource.f_Pos_posLine = dtb__182; Base_dSource.f_Pos_posCol = dtb__183; Base_dSource.f_Pos_posOffset = dtb__184; Base_dSource.f_Pos_posEndOffset = dtb__185 } -> (match (v_lastPos st) with
  | { Base_dSource.f_Pos_posLine = dtb__186; Base_dSource.f_Pos_posCol = dtb__187; Base_dSource.f_Pos_posOffset = dtb__188; Base_dSource.f_Pos_posEndOffset = dtb__189 } -> (if (dtb__182 = dtb__186) then true else (dtb__183 > blockCol))
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
))

# 388 "Vuna/Compiler/Frontend/Parser/Support.vuna"
let v_expectSym = (fun (st : t_PState) (s : string) -> (let nd_uscrut2 = (v_peekTok st) in (match nd_uscrut2 with
  | { Frontend_dLexer.f_PTok_ptokTok = dtb__190; Frontend_dLexer.f_PTok_ptokPos = dtb__191 } -> (match dtb__190 with
  | Frontend_dLexer.C_Tok_TSym (dtb__192) -> (if (dtb__192 = s) then (Base_dDiag.C_Check_OkC ((v_advance st))) else (((Base_dDiagnostics_dFrontend.v_psErr1At (v_tokSpan st)) (Base_dDiagnostics_dFrontend.C_PsDiag_ExpectedToken (s))) s))
  | _ -> (((Base_dDiagnostics_dFrontend.v_psErr1At (v_tokSpan st)) (Base_dDiagnostics_dFrontend.C_PsDiag_ExpectedToken (s))) s)
)
  | _ -> failwith "DT: impossible branch"
)))

# 395 "Vuna/Compiler/Frontend/Parser/Support.vuna"
let v_expectKw = (fun (st : t_PState) (k : string) -> (let nd_uscrut2 = (v_peekTok st) in (match nd_uscrut2 with
  | { Frontend_dLexer.f_PTok_ptokTok = dtb__193; Frontend_dLexer.f_PTok_ptokPos = dtb__194 } -> (match dtb__193 with
  | Frontend_dLexer.C_Tok_TKw (dtb__195) -> (if (dtb__195 = k) then (Base_dDiag.C_Check_OkC ((v_advance st))) else (((Base_dDiagnostics_dFrontend.v_psErr1At (v_tokSpan st)) (Base_dDiagnostics_dFrontend.C_PsDiag_ExpectedToken (k))) k))
  | _ -> (((Base_dDiagnostics_dFrontend.v_psErr1At (v_tokSpan st)) (Base_dDiagnostics_dFrontend.C_PsDiag_ExpectedToken (k))) k)
)
  | _ -> failwith "DT: impossible branch"
)))

# 401 "Vuna/Compiler/Frontend/Parser/Support.vuna"
let v_expectIdent = (fun (st : t_PState) -> (let nd_uscrut1 = (v_peekTok st) in (match nd_uscrut1 with
  | { Frontend_dLexer.f_PTok_ptokTok = dtb__196; Frontend_dLexer.f_PTok_ptokPos = dtb__197 } -> (match dtb__196 with
  | Frontend_dLexer.C_Tok_TIdent (dtb__198) -> (Base_dDiag.C_Check_OkC ({ B_dData_dPair.f_Pair_first = dtb__198; B_dData_dPair.f_Pair_second = (v_advance st) }))
  | _ -> ((Base_dDiagnostics_dFrontend.v_psErr0At (v_tokSpan st)) Base_dDiagnostics_dFrontend.C_PsDiag_ExpectedIdentifier)
)
  | _ -> failwith "DT: impossible branch"
)))

# 409 "Vuna/Compiler/Frontend/Parser/Support.vuna"
let v_expectValueName = (fun (st : t_PState) -> (let nd_uscrut1 = (v_peekTok st) in (match nd_uscrut1 with
  | { Frontend_dLexer.f_PTok_ptokTok = dtb__199; Frontend_dLexer.f_PTok_ptokPos = dtb__200 } -> (match dtb__199 with
  | Frontend_dLexer.C_Tok_TSym (dtb__201) -> (if (v_isReservedValueName dtb__201) then (((Base_dDiagnostics_dFrontend.v_psErr1At (v_tokSpan st)) (Base_dDiagnostics_dFrontend.C_PsDiag_ExpectedToken ("value name"))) "value name") else (Base_dDiag.C_Check_OkC ({ B_dData_dPair.f_Pair_first = dtb__201; B_dData_dPair.f_Pair_second = (v_advance st) })))
  | Frontend_dLexer.C_Tok_TIdent (dtb__202) -> (if (v_isReservedValueName dtb__202) then (((Base_dDiagnostics_dFrontend.v_psErr1At (v_tokSpan st)) (Base_dDiagnostics_dFrontend.C_PsDiag_ExpectedToken ("value name"))) "value name") else (Base_dDiag.C_Check_OkC ({ B_dData_dPair.f_Pair_first = dtb__202; B_dData_dPair.f_Pair_second = (v_advance st) })))
  | _ -> ((Base_dDiagnostics_dFrontend.v_psErr0At (v_tokSpan st)) Base_dDiagnostics_dFrontend.C_PsDiag_ExpectedIdentifier)
)
  | _ -> failwith "DT: impossible branch"
)))

# 43 "Vuna/Compiler/Frontend/Parser/Support.vuna"
let v_toksLeft = (fun (p : t_PState) -> (match p with
  | { f_PState_fileOf = dtb__203; f_PState_sourceOf = dtb__204; f_PState_toksOf = dtb__205; f_PState_lastPos = dtb__206; f_PState_toksLeft = dtb__207; f_PState_pmodeOf = dtb__208; f_PState_tokIndex = dtb__209; f_PState_pendEvents = dtb__210; f_PState_nextNodeId = dtb__211; f_PState_openNodeId = dtb__212; f_PState_subStream = dtb__213; f_PState_backtickShapes = dtb__214; f_PState_sectionShapes = dtb__215; f_PState_interpMultis = dtb__216; f_PState_templateHoles = dtb__217; f_PState_eventMode = dtb__218 } -> dtb__207
  | _ -> failwith "DT: impossible branch"
))

# 44 "Vuna/Compiler/Frontend/Parser/Support.vuna"
let v_pmodeOf = (fun (p : t_PState) -> (match p with
  | { f_PState_fileOf = dtb__219; f_PState_sourceOf = dtb__220; f_PState_toksOf = dtb__221; f_PState_lastPos = dtb__222; f_PState_toksLeft = dtb__223; f_PState_pmodeOf = dtb__224; f_PState_tokIndex = dtb__225; f_PState_pendEvents = dtb__226; f_PState_nextNodeId = dtb__227; f_PState_openNodeId = dtb__228; f_PState_subStream = dtb__229; f_PState_backtickShapes = dtb__230; f_PState_sectionShapes = dtb__231; f_PState_interpMultis = dtb__232; f_PState_templateHoles = dtb__233; f_PState_eventMode = dtb__234 } -> dtb__224
  | _ -> failwith "DT: impossible branch"
))

# 45 "Vuna/Compiler/Frontend/Parser/Support.vuna"
let v_tokIndex = (fun (p : t_PState) -> (match p with
  | { f_PState_fileOf = dtb__235; f_PState_sourceOf = dtb__236; f_PState_toksOf = dtb__237; f_PState_lastPos = dtb__238; f_PState_toksLeft = dtb__239; f_PState_pmodeOf = dtb__240; f_PState_tokIndex = dtb__241; f_PState_pendEvents = dtb__242; f_PState_nextNodeId = dtb__243; f_PState_openNodeId = dtb__244; f_PState_subStream = dtb__245; f_PState_backtickShapes = dtb__246; f_PState_sectionShapes = dtb__247; f_PState_interpMultis = dtb__248; f_PState_templateHoles = dtb__249; f_PState_eventMode = dtb__250 } -> dtb__241
  | _ -> failwith "DT: impossible branch"
))

# 46 "Vuna/Compiler/Frontend/Parser/Support.vuna"
let v_pendEvents = (fun (p : t_PState) -> (match p with
  | { f_PState_fileOf = dtb__251; f_PState_sourceOf = dtb__252; f_PState_toksOf = dtb__253; f_PState_lastPos = dtb__254; f_PState_toksLeft = dtb__255; f_PState_pmodeOf = dtb__256; f_PState_tokIndex = dtb__257; f_PState_pendEvents = dtb__258; f_PState_nextNodeId = dtb__259; f_PState_openNodeId = dtb__260; f_PState_subStream = dtb__261; f_PState_backtickShapes = dtb__262; f_PState_sectionShapes = dtb__263; f_PState_interpMultis = dtb__264; f_PState_templateHoles = dtb__265; f_PState_eventMode = dtb__266 } -> dtb__258
  | _ -> failwith "DT: impossible branch"
))

# 49 "Vuna/Compiler/Frontend/Parser/Support.vuna"
let v_nextNodeId = (fun (p : t_PState) -> (match p with
  | { f_PState_fileOf = dtb__267; f_PState_sourceOf = dtb__268; f_PState_toksOf = dtb__269; f_PState_lastPos = dtb__270; f_PState_toksLeft = dtb__271; f_PState_pmodeOf = dtb__272; f_PState_tokIndex = dtb__273; f_PState_pendEvents = dtb__274; f_PState_nextNodeId = dtb__275; f_PState_openNodeId = dtb__276; f_PState_subStream = dtb__277; f_PState_backtickShapes = dtb__278; f_PState_sectionShapes = dtb__279; f_PState_interpMultis = dtb__280; f_PState_templateHoles = dtb__281; f_PState_eventMode = dtb__282 } -> dtb__275
  | _ -> failwith "DT: impossible branch"
))

# 52 "Vuna/Compiler/Frontend/Parser/Support.vuna"
let v_openNodeId = (fun (p : t_PState) -> (match p with
  | { f_PState_fileOf = dtb__283; f_PState_sourceOf = dtb__284; f_PState_toksOf = dtb__285; f_PState_lastPos = dtb__286; f_PState_toksLeft = dtb__287; f_PState_pmodeOf = dtb__288; f_PState_tokIndex = dtb__289; f_PState_pendEvents = dtb__290; f_PState_nextNodeId = dtb__291; f_PState_openNodeId = dtb__292; f_PState_subStream = dtb__293; f_PState_backtickShapes = dtb__294; f_PState_sectionShapes = dtb__295; f_PState_interpMultis = dtb__296; f_PState_templateHoles = dtb__297; f_PState_eventMode = dtb__298 } -> dtb__292
  | _ -> failwith "DT: impossible branch"
))

# 57 "Vuna/Compiler/Frontend/Parser/Support.vuna"
let v_subStream = (fun (p : t_PState) -> (match p with
  | { f_PState_fileOf = dtb__299; f_PState_sourceOf = dtb__300; f_PState_toksOf = dtb__301; f_PState_lastPos = dtb__302; f_PState_toksLeft = dtb__303; f_PState_pmodeOf = dtb__304; f_PState_tokIndex = dtb__305; f_PState_pendEvents = dtb__306; f_PState_nextNodeId = dtb__307; f_PState_openNodeId = dtb__308; f_PState_subStream = dtb__309; f_PState_backtickShapes = dtb__310; f_PState_sectionShapes = dtb__311; f_PState_interpMultis = dtb__312; f_PState_templateHoles = dtb__313; f_PState_eventMode = dtb__314 } -> dtb__309
  | _ -> failwith "DT: impossible branch"
))

# 60 "Vuna/Compiler/Frontend/Parser/Support.vuna"
let v_backtickShapes = (fun (p : t_PState) -> (match p with
  | { f_PState_fileOf = dtb__315; f_PState_sourceOf = dtb__316; f_PState_toksOf = dtb__317; f_PState_lastPos = dtb__318; f_PState_toksLeft = dtb__319; f_PState_pmodeOf = dtb__320; f_PState_tokIndex = dtb__321; f_PState_pendEvents = dtb__322; f_PState_nextNodeId = dtb__323; f_PState_openNodeId = dtb__324; f_PState_subStream = dtb__325; f_PState_backtickShapes = dtb__326; f_PState_sectionShapes = dtb__327; f_PState_interpMultis = dtb__328; f_PState_templateHoles = dtb__329; f_PState_eventMode = dtb__330 } -> dtb__326
  | _ -> failwith "DT: impossible branch"
))

# 62 "Vuna/Compiler/Frontend/Parser/Support.vuna"
let v_sectionShapes = (fun (p : t_PState) -> (match p with
  | { f_PState_fileOf = dtb__331; f_PState_sourceOf = dtb__332; f_PState_toksOf = dtb__333; f_PState_lastPos = dtb__334; f_PState_toksLeft = dtb__335; f_PState_pmodeOf = dtb__336; f_PState_tokIndex = dtb__337; f_PState_pendEvents = dtb__338; f_PState_nextNodeId = dtb__339; f_PState_openNodeId = dtb__340; f_PState_subStream = dtb__341; f_PState_backtickShapes = dtb__342; f_PState_sectionShapes = dtb__343; f_PState_interpMultis = dtb__344; f_PState_templateHoles = dtb__345; f_PState_eventMode = dtb__346 } -> dtb__343
  | _ -> failwith "DT: impossible branch"
))

# 64 "Vuna/Compiler/Frontend/Parser/Support.vuna"
let v_interpMultis = (fun (p : t_PState) -> (match p with
  | { f_PState_fileOf = dtb__347; f_PState_sourceOf = dtb__348; f_PState_toksOf = dtb__349; f_PState_lastPos = dtb__350; f_PState_toksLeft = dtb__351; f_PState_pmodeOf = dtb__352; f_PState_tokIndex = dtb__353; f_PState_pendEvents = dtb__354; f_PState_nextNodeId = dtb__355; f_PState_openNodeId = dtb__356; f_PState_subStream = dtb__357; f_PState_backtickShapes = dtb__358; f_PState_sectionShapes = dtb__359; f_PState_interpMultis = dtb__360; f_PState_templateHoles = dtb__361; f_PState_eventMode = dtb__362 } -> dtb__360
  | _ -> failwith "DT: impossible branch"
))

# 69 "Vuna/Compiler/Frontend/Parser/Support.vuna"
let v_templateHoles = (fun (p : t_PState) -> (match p with
  | { f_PState_fileOf = dtb__363; f_PState_sourceOf = dtb__364; f_PState_toksOf = dtb__365; f_PState_lastPos = dtb__366; f_PState_toksLeft = dtb__367; f_PState_pmodeOf = dtb__368; f_PState_tokIndex = dtb__369; f_PState_pendEvents = dtb__370; f_PState_nextNodeId = dtb__371; f_PState_openNodeId = dtb__372; f_PState_subStream = dtb__373; f_PState_backtickShapes = dtb__374; f_PState_sectionShapes = dtb__375; f_PState_interpMultis = dtb__376; f_PState_templateHoles = dtb__377; f_PState_eventMode = dtb__378 } -> dtb__377
  | _ -> failwith "DT: impossible branch"
))

# 71 "Vuna/Compiler/Frontend/Parser/Support.vuna"
let v_eventMode = (fun (p : t_PState) -> (match p with
  | { f_PState_fileOf = dtb__379; f_PState_sourceOf = dtb__380; f_PState_toksOf = dtb__381; f_PState_lastPos = dtb__382; f_PState_toksLeft = dtb__383; f_PState_pmodeOf = dtb__384; f_PState_tokIndex = dtb__385; f_PState_pendEvents = dtb__386; f_PState_nextNodeId = dtb__387; f_PState_openNodeId = dtb__388; f_PState_subStream = dtb__389; f_PState_backtickShapes = dtb__390; f_PState_sectionShapes = dtb__391; f_PState_interpMultis = dtb__392; f_PState_templateHoles = dtb__393; f_PState_eventMode = dtb__394 } -> dtb__394
  | _ -> failwith "DT: impossible branch"
))
