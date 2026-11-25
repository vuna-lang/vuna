open Vuna_runtime
type t_ParseMode = C_ParseMode_PmStrict | C_ParseMode_PmTool
and t_PState = { f_PState_fileOf : string; f_PState_sourceOf : string; f_PState_toksOf : Frontend_dLexer.t_PTok B_dData_dList.t_List; f_PState_lastPos : Base_dSource.t_Pos; f_PState_toksLeft : int; f_PState_pmodeOf : t_ParseMode; f_PState_tokIndex : int; f_PState_pendEvents : Frontend_dCst.t_NodeEvent B_dData_dList.t_List; f_PState_nextNodeId : int; f_PState_openNodeId : int; f_PState_subStream : bool; f_PState_backtickShapes : (int, bool) B_dData_dPair.t_Pair B_dData_dList.t_List; f_PState_sectionShapes : (int, Frontend_dCst.t_SectionShape) B_dData_dPair.t_Pair B_dData_dList.t_List; f_PState_interpMultis : (int, bool) B_dData_dPair.t_Pair B_dData_dList.t_List; f_PState_templateHoles : (int, Frontend_dCst.t_CstNode B_dData_dList.t_List) B_dData_dPair.t_Pair B_dData_dList.t_List }

# 67 "Vuna/Compiler/Frontend/Parser/Support.vuna"
let v_mkState = (fun (file : string) (source : string) (toks : Frontend_dLexer.t_PTok B_dData_dList.t_List) (mode : t_ParseMode) -> { f_PState_fileOf = file; f_PState_sourceOf = source; f_PState_toksOf = toks; f_PState_lastPos = { Base_dSource.f_Pos_posLine = 1; Base_dSource.f_Pos_posCol = 0; Base_dSource.f_Pos_posOffset = 0; Base_dSource.f_Pos_posEndOffset = 0 }; f_PState_toksLeft = (B_dData_dList.v_length toks); f_PState_pmodeOf = mode; f_PState_tokIndex = 0; f_PState_pendEvents = B_dData_dList.C_List_Nil; f_PState_nextNodeId = 1; f_PState_openNodeId = 0; f_PState_subStream = false; f_PState_backtickShapes = B_dData_dList.C_List_Nil; f_PState_sectionShapes = B_dData_dList.C_List_Nil; f_PState_interpMultis = B_dData_dList.C_List_Nil; f_PState_templateHoles = B_dData_dList.C_List_Nil })

# 74 "Vuna/Compiler/Frontend/Parser/Support.vuna"
let v_mkStateAt = (fun (file : string) (source : string) (toks : Frontend_dLexer.t_PTok B_dData_dList.t_List) (last : Base_dSource.t_Pos) (count : int) (mode : t_ParseMode) -> { f_PState_fileOf = file; f_PState_sourceOf = source; f_PState_toksOf = toks; f_PState_lastPos = last; f_PState_toksLeft = count; f_PState_pmodeOf = mode; f_PState_tokIndex = 0; f_PState_pendEvents = B_dData_dList.C_List_Nil; f_PState_nextNodeId = (0 - (2 + (Base_dSource.v_posOffset last))); f_PState_openNodeId = 0; f_PState_subStream = true; f_PState_backtickShapes = B_dData_dList.C_List_Nil; f_PState_sectionShapes = B_dData_dList.C_List_Nil; f_PState_interpMultis = B_dData_dList.C_List_Nil; f_PState_templateHoles = B_dData_dList.C_List_Nil })

# 80 "Vuna/Compiler/Frontend/Parser/Support.vuna"
let v_eventsOf = (fun (st : t_PState) -> (B_dData_dList.v_reverse (st).f_PState_pendEvents))

# 102 "Vuna/Compiler/Frontend/Parser/Support.vuna"
let v_addBacktickShape = (fun (nid : int) (st : t_PState) -> { st with f_PState_backtickShapes = (B_dData_dList.C_List__x58__x58_ ({ B_dData_dPair.f_Pair_first = nid; B_dData_dPair.f_Pair_second = true }, (st).f_PState_backtickShapes)) })

# 106 "Vuna/Compiler/Frontend/Parser/Support.vuna"
let v_addSectionShape = (fun (off : int) (shape : Frontend_dCst.t_SectionShape) (st : t_PState) -> { st with f_PState_sectionShapes = (B_dData_dList.C_List__x58__x58_ ({ B_dData_dPair.f_Pair_first = off; B_dData_dPair.f_Pair_second = shape }, (st).f_PState_sectionShapes)) })

# 110 "Vuna/Compiler/Frontend/Parser/Support.vuna"
let v_addInterpMulti = (fun (off : int) (multi : bool) (st : t_PState) -> { st with f_PState_interpMultis = (B_dData_dList.C_List__x58__x58_ ({ B_dData_dPair.f_Pair_first = off; B_dData_dPair.f_Pair_second = multi }, (st).f_PState_interpMultis)) })

# 114 "Vuna/Compiler/Frontend/Parser/Support.vuna"
let v_addTemplateHoles = (fun (nid : int) (trees : Frontend_dCst.t_CstNode B_dData_dList.t_List) (st : t_PState) -> { st with f_PState_templateHoles = (B_dData_dList.C_List__x58__x58_ ({ B_dData_dPair.f_Pair_first = nid; B_dData_dPair.f_Pair_second = trees }, (st).f_PState_templateHoles)) })

# 126 "Vuna/Compiler/Frontend/Parser/Support.vuna"
let rec v_rekeyInfixGo = (fun (mc0 : int) (mc1 : int) (mc2 : (int, bool) B_dData_dPair.t_Pair B_dData_dList.t_List) -> (match mc2 with
  | B_dData_dList.C_List__x58__x58_ (dtb__0, dtb__1) -> (if ((B_dData_dPair.v_firstOf dtb__0) = mc0) then (B_dData_dList.C_List__x58__x58_ ({ B_dData_dPair.f_Pair_first = mc1; B_dData_dPair.f_Pair_second = (B_dData_dPair.v_secondOf dtb__0) }, dtb__1)) else (B_dData_dList.C_List__x58__x58_ (dtb__0, (((v_rekeyInfixGo mc0) mc1) dtb__1))))
  | B_dData_dList.C_List_Nil -> B_dData_dList.C_List_Nil
  | _ -> failwith "DT: impossible branch"
))

# 119 "Vuna/Compiler/Frontend/Parser/Support.vuna"
let v_rekeyInfix = (fun (from : int) (to_ : int) (st : t_PState) -> (if (if (from < 0) then true else (from = to_)) then st else { st with f_PState_backtickShapes = (((v_rekeyInfixGo from) to_) (st).f_PState_backtickShapes) }))

# 132 "Vuna/Compiler/Frontend/Parser/Support.vuna"
let v_closedAt = (fun (st : t_PState) -> { st with f_PState_pendEvents = (B_dData_dList.C_List__x58__x58_ ((Frontend_dCst.C_NodeEvent_EvClose ((st).f_PState_tokIndex)), (st).f_PState_pendEvents)) })

# 88 "Vuna/Compiler/Frontend/Parser/Support.vuna"
let v_withExtent = (fun (kind : Frontend_dCst.t_CstKind) (st : t_PState) k -> (let nid = (st).f_PState_nextNodeId in (let next = (if (st).f_PState_subStream then (nid - 1) else (nid + 1)) in (let opened = { st with f_PState_pendEvents = (B_dData_dList.C_List__x58__x58_ ((Frontend_dCst.C_NodeEvent_EvOpen (kind, (st).f_PState_tokIndex, nid)), (st).f_PState_pendEvents)); f_PState_nextNodeId = next; f_PState_openNodeId = nid } in ((Base_dCommon.v_step (k opened)) (fun v (st1 : t_PState) -> (Base_dDiag.C_Check_OkC ({ B_dData_dPair.f_Pair_first = v; B_dData_dPair.f_Pair_second = (v_closedAt st1) }))))))))

# 137 "Vuna/Compiler/Frontend/Parser/Support.vuna"
let v_withLastPos = (fun (p : Base_dSource.t_Pos) (st : t_PState) -> { st with f_PState_lastPos = p })

# 142 "Vuna/Compiler/Frontend/Parser/Support.vuna"
let v_lastEndCol = (fun (p : Base_dSource.t_Pos) -> ((Base_dSource.v_posCol p) + ((Base_dSource.v_posEndOffset p) - (Base_dSource.v_posOffset p))))

# 191 "Vuna/Compiler/Frontend/Parser/Support.vuna"
let v_peekTok = (fun (st : t_PState) -> (match (st).f_PState_toksOf with
  | B_dData_dList.C_List__x58__x58_ (dtb__2, dtb__3) -> dtb__2
  | B_dData_dList.C_List_Nil -> { Frontend_dLexer.f_PTok_ptokTok = Frontend_dLexer.C_Tok_TEof; Frontend_dLexer.f_PTok_ptokPos = { Base_dSource.f_Pos_posLine = 1; Base_dSource.f_Pos_posCol = 1; Base_dSource.f_Pos_posOffset = 0; Base_dSource.f_Pos_posEndOffset = 0 } }
  | _ -> failwith "DT: impossible branch"
))

# 197 "Vuna/Compiler/Frontend/Parser/Support.vuna"
let v_peekPos = (fun (st : t_PState) -> ((v_peekTok st)).Frontend_dLexer.f_PTok_ptokPos)

# 212 "Vuna/Compiler/Frontend/Parser/Support.vuna"
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

# 227 "Vuna/Compiler/Frontend/Parser/Support.vuna"
let v_isEof = (fun (st : t_PState) -> (let nd_uscrut1 = (v_peekTok st) in (match nd_uscrut1 with
  | { Frontend_dLexer.f_PTok_ptokTok = dtb__8; Frontend_dLexer.f_PTok_ptokPos = dtb__9 } -> (match dtb__8 with
  | Frontend_dLexer.C_Tok_TEof -> true
  | _ -> false
)
  | _ -> failwith "DT: impossible branch"
)))

# 256 "Vuna/Compiler/Frontend/Parser/Support.vuna"
let v_stateFuel = (fun (st : t_PState) -> ((128 * (st).f_PState_toksLeft) + 1024))

# 259 "Vuna/Compiler/Frontend/Parser/Support.vuna"
let v_sameLineState = (fun (st : t_PState) -> (match (v_peekPos st) with
  | { Base_dSource.f_Pos_posLine = dtb__10; Base_dSource.f_Pos_posCol = dtb__11; Base_dSource.f_Pos_posOffset = dtb__12; Base_dSource.f_Pos_posEndOffset = dtb__13 } -> { st with f_PState_lastPos = { Base_dSource.f_Pos_posLine = dtb__10; Base_dSource.f_Pos_posCol = 0; Base_dSource.f_Pos_posOffset = 0; Base_dSource.f_Pos_posEndOffset = 0 } }
  | _ -> failwith "DT: impossible branch"
))

# 264 "Vuna/Compiler/Frontend/Parser/Support.vuna"
let v_atSym = (fun (st : t_PState) (s : string) -> (let nd_uscrut2 = (v_peekTok st) in (match nd_uscrut2 with
  | { Frontend_dLexer.f_PTok_ptokTok = dtb__14; Frontend_dLexer.f_PTok_ptokPos = dtb__15 } -> (match dtb__14 with
  | Frontend_dLexer.C_Tok_TSym (dtb__16) -> (dtb__16 = s)
  | _ -> false
)
  | _ -> failwith "DT: impossible branch"
)))

# 271 "Vuna/Compiler/Frontend/Parser/Support.vuna"
let rec v_nthTok = (fun (mc0 : Frontend_dLexer.t_PTok B_dData_dList.t_List) (mc1 : int) -> (match mc0 with
  | B_dData_dList.C_List__x58__x58_ (dtb__17, dtb__18) -> (if (mc1 <= 0) then (B_dData_dMaybe.C_Maybe_Just (dtb__17)) else ((v_nthTok dtb__18) (mc1 - 1)))
  | B_dData_dList.C_List_Nil -> B_dData_dMaybe.C_Maybe_Nothing
  | _ -> failwith "DT: impossible branch"
))

# 275 "Vuna/Compiler/Frontend/Parser/Support.vuna"
let v_peekTokAt = (fun (st : t_PState) (n : int) -> ((v_nthTok (st).f_PState_toksOf) n))

# 293 "Vuna/Compiler/Frontend/Parser/Support.vuna"
let v_tokTail = (fun (mc0 : Frontend_dLexer.t_PTok B_dData_dList.t_List) -> (match mc0 with
  | B_dData_dList.C_List__x58__x58_ (dtb__19, dtb__20) -> dtb__20
  | B_dData_dList.C_List_Nil -> B_dData_dList.C_List_Nil
  | _ -> failwith "DT: impossible branch"
))

# 298 "Vuna/Compiler/Frontend/Parser/Support.vuna"
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

# 306 "Vuna/Compiler/Frontend/Parser/Support.vuna"
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

# 281 "Vuna/Compiler/Frontend/Parser/Support.vuna"
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

# 328 "Vuna/Compiler/Frontend/Parser/Support.vuna"
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

# 321 "Vuna/Compiler/Frontend/Parser/Support.vuna"
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

# 318 "Vuna/Compiler/Frontend/Parser/Support.vuna"
let v_piArrowAhead = (fun (st : t_PState) -> ((v_piArrowAheadGo 1) (st).f_PState_toksOf))

# 332 "Vuna/Compiler/Frontend/Parser/Support.vuna"
let v_atKw = (fun (st : t_PState) (k : string) -> (let nd_uscrut2 = (v_peekTok st) in (match nd_uscrut2 with
  | { Frontend_dLexer.f_PTok_ptokTok = dtb__47; Frontend_dLexer.f_PTok_ptokPos = dtb__48 } -> (match dtb__47 with
  | Frontend_dLexer.C_Tok_TKw (dtb__49) -> (dtb__49 = k)
  | _ -> false
)
  | _ -> failwith "DT: impossible branch"
)))

# 383 "Vuna/Compiler/Frontend/Parser/Support.vuna"
let v_upperFirst = (fun (s : string) -> (match (B_dData_dList.dtp_unpack s) with
  | B_dData_dList.C_List__x58__x58_ (dtb__50, dtb__51) -> (if (dtb__50 >= 65) then (dtb__50 <= 90) else false)
  | B_dData_dList.C_List_Nil -> false
  | _ -> failwith "DT: impossible branch"
))

# 391 "Vuna/Compiler/Frontend/Parser/Support.vuna"
let v_underscoreCtorName = (fun (s : string) -> (match (B_dData_dList.dtp_unpack s) with
  | B_dData_dList.C_List__x58__x58_ (dtb__52, dtb__53) -> (if (dtb__52 = 95) then (match dtb__53 with
  | B_dData_dList.C_List__x58__x58_ (dtb__54, dtb__55) -> (if (dtb__54 >= 65) then (dtb__54 <= 90) else false)
  | B_dData_dList.C_List_Nil -> false
  | _ -> failwith "DT: impossible branch"
) else false)
  | B_dData_dList.C_List_Nil -> false
  | _ -> failwith "DT: impossible branch"
))

# 403 "Vuna/Compiler/Frontend/Parser/Support.vuna"
let v_ctorPatternStart = (fun (name : string) -> (if (v_upperFirst name) then true else (v_underscoreCtorName name)))

# 440 "Vuna/Compiler/Frontend/Parser/Support.vuna"
let v_startsPatternAtom = (fun (st : t_PState) -> (let nd_uscrut1 = (v_peekTok st) in (match nd_uscrut1 with
  | { Frontend_dLexer.f_PTok_ptokTok = dtb__56; Frontend_dLexer.f_PTok_ptokPos = dtb__57 } -> (match dtb__56 with
  | Frontend_dLexer.C_Tok_TSym (dtb__58) -> (if (dtb__58 = "(") then true else (if (dtb__58 = "[") then true else false))
  | Frontend_dLexer.C_Tok_TTmpl (dtb__59, dtb__60, dtb__61) -> true
  | Frontend_dLexer.C_Tok_TStr (dtb__62) -> true
  | Frontend_dLexer.C_Tok_TInt (dtb__63) -> true
  | Frontend_dLexer.C_Tok_TIdent (dtb__64) -> true
  | _ -> false
)
  | _ -> failwith "DT: impossible branch"
)))

# 453 "Vuna/Compiler/Frontend/Parser/Support.vuna"
let v_isSyntaxSym = (fun (op : string) -> (if (op = "=") then true else (if (op = ":") then true else (if (op = ",") then true else (if (op = ";") then true else (if (op = "|") then true else (if (op = "=>") then true else (if (op = "<-") then true else (if (op = "\\") then true else (if (op = ".") then true else (if (op = "..") then true else (if (op = "@") then true else (if (op = "(") then true else (if (op = ")") then true else (if (op = "[") then true else (if (op = "]") then true else (if (op = "{") then true else (if (op = "}") then true else false))))))))))))))))))

# 480 "Vuna/Compiler/Frontend/Parser/Support.vuna"
let v_isReservedValueName = (fun (name : string) -> (if (if (v_isSyntaxSym name) then true else (name = "->")) then true else (name = "`")))

# 485 "Vuna/Compiler/Frontend/Parser/Support.vuna"
let v_closeParenNext = (fun (st : t_PState) -> (let nd_uscrut1 = ((v_peekTokAt st) 1) in (match nd_uscrut1 with
  | B_dData_dMaybe.C_Maybe_Just (dtb__65) -> (match dtb__65 with
  | { Frontend_dLexer.f_PTok_ptokTok = dtb__66; Frontend_dLexer.f_PTok_ptokPos = dtb__67 } -> (match dtb__66 with
  | Frontend_dLexer.C_Tok_TSym (dtb__68) -> (if (dtb__68 = ")") then true else false)
  | _ -> false
)
  | _ -> failwith "DT: impossible branch"
)
  | _ -> false
)))

# 508 "Vuna/Compiler/Frontend/Parser/Support.vuna"
let v_minusLiteralAt = (fun (p : Base_dSource.t_Pos) (st : t_PState) -> (let nd_uscrut2 = ((v_peekTokAt st) 2) in (match nd_uscrut2 with
  | B_dData_dMaybe.C_Maybe_Just (dtb__69) -> (match dtb__69 with
  | { Frontend_dLexer.f_PTok_ptokTok = dtb__70; Frontend_dLexer.f_PTok_ptokPos = dtb__71 } -> (match dtb__70 with
  | Frontend_dLexer.C_Tok_TFloat (dtb__72) -> (if ((Base_dSource.v_posLine dtb__71) = (Base_dSource.v_posLine p)) then ((Base_dSource.v_posCol dtb__71) = ((Base_dSource.v_posCol p) + 1)) else false)
  | Frontend_dLexer.C_Tok_TInt (dtb__73) -> (if ((Base_dSource.v_posLine dtb__71) = (Base_dSource.v_posLine p)) then ((Base_dSource.v_posCol dtb__71) = ((Base_dSource.v_posCol p) + 1)) else false)
  | _ -> false
)
  | _ -> failwith "DT: impossible branch"
)
  | _ -> false
)))

# 515 "Vuna/Compiler/Frontend/Parser/Support.vuna"
let rec v_countArrows = (fun (mc0 : Frontend_dAst.t_Expr) -> (match mc0 with
  | Frontend_dAst.C_Expr_EApp (dtb__74, dtb__75, dtb__76) -> (match dtb__74 with
  | Frontend_dAst.C_Expr_EVar (dtb__77, dtb__78) -> (if (dtb__77 = "->") then (match dtb__75 with
  | B_dData_dList.C_List__x58__x58_ (dtb__79, dtb__80) -> (match dtb__80 with
  | B_dData_dList.C_List__x58__x58_ (dtb__81, dtb__82) -> (match dtb__82 with
  | B_dData_dList.C_List_Nil -> (1 + (v_countArrows dtb__81))
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

# 519 "Vuna/Compiler/Frontend/Parser/Support.vuna"
let v_terminatesExpression = (fun (mc0 : Frontend_dLexer.t_PTok) -> (match mc0 with
  | { Frontend_dLexer.f_PTok_ptokTok = dtb__83; Frontend_dLexer.f_PTok_ptokPos = dtb__84 } -> (match dtb__83 with
  | Frontend_dLexer.C_Tok_TKw (dtb__85) -> (if (dtb__85 = "else") then true else (if (dtb__85 = "in") then true else (if (dtb__85 = "then") then true else false)))
  | Frontend_dLexer.C_Tok_TSym (dtb__86) -> (if (dtb__86 = ")") then true else (if (dtb__86 = "]") then true else (if (dtb__86 = ",") then true else false)))
  | _ -> false
)
  | _ -> failwith "DT: impossible branch"
))

# 528 "Vuna/Compiler/Frontend/Parser/Support.vuna"
let v_badCaseIndent = (fun (st : t_PState) (altCol : int) -> (if (v_isEof st) then false else (match (v_peekPos st) with
  | { Base_dSource.f_Pos_posLine = dtb__87; Base_dSource.f_Pos_posCol = dtb__88; Base_dSource.f_Pos_posOffset = dtb__89; Base_dSource.f_Pos_posEndOffset = dtb__90 } -> (if (dtb__88 > altCol) then (if (v_terminatesExpression (v_peekTok st)) then false else true) else false)
  | _ -> failwith "DT: impossible branch"
)))

# 28 "Vuna/Compiler/Frontend/Parser/Support.vuna"
let v_fileOf = (fun (p : t_PState) -> (match p with
  | { f_PState_fileOf = dtb__91; f_PState_sourceOf = dtb__92; f_PState_toksOf = dtb__93; f_PState_lastPos = dtb__94; f_PState_toksLeft = dtb__95; f_PState_pmodeOf = dtb__96; f_PState_tokIndex = dtb__97; f_PState_pendEvents = dtb__98; f_PState_nextNodeId = dtb__99; f_PState_openNodeId = dtb__100; f_PState_subStream = dtb__101; f_PState_backtickShapes = dtb__102; f_PState_sectionShapes = dtb__103; f_PState_interpMultis = dtb__104; f_PState_templateHoles = dtb__105 } -> dtb__91
  | _ -> failwith "DT: impossible branch"
))

# 177 "Vuna/Compiler/Frontend/Parser/Support.vuna"
let v_tokenSpan = (fun (st : t_PState) -> (let p = (v_peekPos st) in (let len = ((Base_dSource.v_posEndOffset p) - (Base_dSource.v_posOffset p)) in { Base_dSource.f_Span_spanFile = (v_fileOf st); Base_dSource.f_Span_spanStartLine = (Base_dSource.v_posLine p); Base_dSource.f_Span_spanStartCol = (Base_dSource.v_posCol p); Base_dSource.f_Span_spanEndLine = (Base_dSource.v_posLine p); Base_dSource.f_Span_spanEndCol = ((Base_dSource.v_posCol p) + len); Base_dSource.f_Span_spanStartOffset = (Base_dSource.v_posOffset p); Base_dSource.f_Span_spanEndOffset = (Base_dSource.v_posEndOffset p) })))

# 426 "Vuna/Compiler/Frontend/Parser/Support.vuna"
let v_holeAtomAt = (fun (st : t_PState) -> (let nd_uscrut1 = (v_peekTok st) in (match nd_uscrut1 with
  | { Frontend_dLexer.f_PTok_ptokTok = dtb__106; Frontend_dLexer.f_PTok_ptokPos = dtb__107 } -> (match dtb__106 with
  | Frontend_dLexer.C_Tok_TSym (dtb__108) -> (if (dtb__108 = "?") then (let nd_uscrut5 = ((v_peekTokAt st) 1) in (match nd_uscrut5 with
  | B_dData_dMaybe.C_Maybe_Just (dtb__109) -> (match dtb__109 with
  | { Frontend_dLexer.f_PTok_ptokTok = dtb__110; Frontend_dLexer.f_PTok_ptokPos = dtb__111 } -> (match dtb__110 with
  | Frontend_dLexer.C_Tok_TIdent (dtb__112) -> (if (if ((Base_dSource.v_posLine dtb__111) = (Base_dSource.v_posLine dtb__107)) then ((Base_dSource.v_posCol dtb__111) = ((Base_dSource.v_posCol dtb__107) + 1)) else false) then (B_dData_dMaybe.C_Maybe_Just ({ B_dData_dPair.f_Pair_first = ("?" ^ dtb__112); B_dData_dPair.f_Pair_second = { Base_dSource.f_Span_spanFile = (v_fileOf st); Base_dSource.f_Span_spanStartLine = (Base_dSource.v_posLine dtb__107); Base_dSource.f_Span_spanStartCol = (Base_dSource.v_posCol dtb__107); Base_dSource.f_Span_spanEndLine = (Base_dSource.v_posLine dtb__111); Base_dSource.f_Span_spanEndCol = ((Base_dSource.v_posCol dtb__111) + (bi_strLength dtb__112)); Base_dSource.f_Span_spanStartOffset = (Base_dSource.v_posOffset dtb__107); Base_dSource.f_Span_spanEndOffset = ((Base_dSource.v_posOffset dtb__111) + (bi_strLength dtb__112)) } })) else B_dData_dMaybe.C_Maybe_Nothing)
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

# 406 "Vuna/Compiler/Frontend/Parser/Support.vuna"
let v_startsAtom = (fun (st : t_PState) -> (let nd_uscrut1 = (v_peekTok st) in (match nd_uscrut1 with
  | { Frontend_dLexer.f_PTok_ptokTok = dtb__113; Frontend_dLexer.f_PTok_ptokPos = dtb__114 } -> (match dtb__113 with
  | Frontend_dLexer.C_Tok_TSym (dtb__115) -> (if (dtb__115 = "(") then true else (if (dtb__115 = "[") then true else (if (dtb__115 = "?") then (match (v_holeAtomAt st) with
  | B_dData_dMaybe.C_Maybe_Just (dtb__116) -> true
  | B_dData_dMaybe.C_Maybe_Nothing -> false
  | _ -> failwith "DT: impossible branch"
) else false)))
  | Frontend_dLexer.C_Tok_TKw (dtb__117) -> (if (dtb__117 = "Type") then true else false)
  | Frontend_dLexer.C_Tok_TTmpl (dtb__118, dtb__119, dtb__120) -> true
  | Frontend_dLexer.C_Tok_TStr (dtb__121) -> true
  | Frontend_dLexer.C_Tok_TFloat (dtb__122) -> true
  | Frontend_dLexer.C_Tok_TInt (dtb__123) -> true
  | Frontend_dLexer.C_Tok_TIdent (dtb__124) -> true
  | _ -> false
)
  | _ -> failwith "DT: impossible branch"
)))

# 494 "Vuna/Compiler/Frontend/Parser/Support.vuna"
let v_sectionOpAt = (fun (st : t_PState) -> (let nd_uscrut1 = ((v_peekTokAt st) 1) in (match nd_uscrut1 with
  | B_dData_dMaybe.C_Maybe_Just (dtb__125) -> (match dtb__125 with
  | { Frontend_dLexer.f_PTok_ptokTok = dtb__126; Frontend_dLexer.f_PTok_ptokPos = dtb__127 } -> (match dtb__126 with
  | Frontend_dLexer.C_Tok_TSym (dtb__128) -> (if (v_isReservedValueName dtb__128) then B_dData_dMaybe.C_Maybe_Nothing else (if (dtb__128 = "?") then (match (v_holeAtomAt (v_advance st)) with
  | B_dData_dMaybe.C_Maybe_Just (dtb__129) -> B_dData_dMaybe.C_Maybe_Nothing
  | B_dData_dMaybe.C_Maybe_Nothing -> (B_dData_dMaybe.C_Maybe_Just (dtb__128))
  | _ -> failwith "DT: impossible branch"
) else (if (if (dtb__128 = "-") then ((v_minusLiteralAt dtb__127) st) else false) then B_dData_dMaybe.C_Maybe_Nothing else (B_dData_dMaybe.C_Maybe_Just (dtb__128)))))
  | _ -> B_dData_dMaybe.C_Maybe_Nothing
)
  | _ -> failwith "DT: impossible branch"
)
  | _ -> B_dData_dMaybe.C_Maybe_Nothing
)))

# 30 "Vuna/Compiler/Frontend/Parser/Support.vuna"
let v_sourceOf = (fun (p : t_PState) -> (match p with
  | { f_PState_fileOf = dtb__130; f_PState_sourceOf = dtb__131; f_PState_toksOf = dtb__132; f_PState_lastPos = dtb__133; f_PState_toksLeft = dtb__134; f_PState_pmodeOf = dtb__135; f_PState_tokIndex = dtb__136; f_PState_pendEvents = dtb__137; f_PState_nextNodeId = dtb__138; f_PState_openNodeId = dtb__139; f_PState_subStream = dtb__140; f_PState_backtickShapes = dtb__141; f_PState_sectionShapes = dtb__142; f_PState_interpMultis = dtb__143; f_PState_templateHoles = dtb__144 } -> dtb__131
  | _ -> failwith "DT: impossible branch"
))

# 31 "Vuna/Compiler/Frontend/Parser/Support.vuna"
let v_toksOf = (fun (p : t_PState) -> (match p with
  | { f_PState_fileOf = dtb__145; f_PState_sourceOf = dtb__146; f_PState_toksOf = dtb__147; f_PState_lastPos = dtb__148; f_PState_toksLeft = dtb__149; f_PState_pmodeOf = dtb__150; f_PState_tokIndex = dtb__151; f_PState_pendEvents = dtb__152; f_PState_nextNodeId = dtb__153; f_PState_openNodeId = dtb__154; f_PState_subStream = dtb__155; f_PState_backtickShapes = dtb__156; f_PState_sectionShapes = dtb__157; f_PState_interpMultis = dtb__158; f_PState_templateHoles = dtb__159 } -> dtb__147
  | _ -> failwith "DT: impossible branch"
))

# 32 "Vuna/Compiler/Frontend/Parser/Support.vuna"
let v_lastPos = (fun (p : t_PState) -> (match p with
  | { f_PState_fileOf = dtb__160; f_PState_sourceOf = dtb__161; f_PState_toksOf = dtb__162; f_PState_lastPos = dtb__163; f_PState_toksLeft = dtb__164; f_PState_pmodeOf = dtb__165; f_PState_tokIndex = dtb__166; f_PState_pendEvents = dtb__167; f_PState_nextNodeId = dtb__168; f_PState_openNodeId = dtb__169; f_PState_subStream = dtb__170; f_PState_backtickShapes = dtb__171; f_PState_sectionShapes = dtb__172; f_PState_interpMultis = dtb__173; f_PState_templateHoles = dtb__174 } -> dtb__163
  | _ -> failwith "DT: impossible branch"
))

# 148 "Vuna/Compiler/Frontend/Parser/Support.vuna"
let v_spanOf = (fun (st : t_PState) (st2 : t_PState) -> (let p1 = (v_lastPos st2) in { Base_dSource.f_Span_spanFile = (v_fileOf st); Base_dSource.f_Span_spanStartLine = (Base_dSource.v_posLine (v_peekPos st)); Base_dSource.f_Span_spanStartCol = (Base_dSource.v_posCol (v_peekPos st)); Base_dSource.f_Span_spanEndLine = (Base_dSource.v_posLine p1); Base_dSource.f_Span_spanEndCol = (v_lastEndCol p1); Base_dSource.f_Span_spanStartOffset = (Base_dSource.v_posOffset (v_peekPos st)); Base_dSource.f_Span_spanEndOffset = (Base_dSource.v_posEndOffset p1) }))

# 162 "Vuna/Compiler/Frontend/Parser/Support.vuna"
let v_spanFromStart = (fun (file : string) (start : Base_dSource.t_Pos) (st : t_PState) -> (let p1 = (v_lastPos st) in { Base_dSource.f_Span_spanFile = file; Base_dSource.f_Span_spanStartLine = (Base_dSource.v_posLine start); Base_dSource.f_Span_spanStartCol = (Base_dSource.v_posCol start); Base_dSource.f_Span_spanEndLine = (Base_dSource.v_posLine p1); Base_dSource.f_Span_spanEndCol = (v_lastEndCol p1); Base_dSource.f_Span_spanStartOffset = (Base_dSource.v_posOffset start); Base_dSource.f_Span_spanEndOffset = (Base_dSource.v_posEndOffset p1) }))

# 202 "Vuna/Compiler/Frontend/Parser/Support.vuna"
let v_tokSpan = (fun (st : t_PState) -> (let nd_uscrut1 = (v_peekTok st) in (match nd_uscrut1 with
  | { Frontend_dLexer.f_PTok_ptokTok = dtb__175; Frontend_dLexer.f_PTok_ptokPos = dtb__176 } -> (match dtb__175 with
  | Frontend_dLexer.C_Tok_TEof -> (let p = (v_lastPos st) in { Base_dSource.f_Span_spanFile = (v_fileOf st); Base_dSource.f_Span_spanStartLine = (Base_dSource.v_posLine p); Base_dSource.f_Span_spanStartCol = (Base_dSource.v_posCol p); Base_dSource.f_Span_spanEndLine = (Base_dSource.v_posLine p); Base_dSource.f_Span_spanEndCol = (Base_dSource.v_posCol p); Base_dSource.f_Span_spanStartOffset = (Base_dSource.v_posOffset p); Base_dSource.f_Span_spanEndOffset = (Base_dSource.v_posOffset p) })
  | _ -> { Base_dSource.f_Span_spanFile = (v_fileOf st); Base_dSource.f_Span_spanStartLine = (Base_dSource.v_posLine dtb__176); Base_dSource.f_Span_spanStartCol = (Base_dSource.v_posCol dtb__176); Base_dSource.f_Span_spanEndLine = (Base_dSource.v_posLine dtb__176); Base_dSource.f_Span_spanEndCol = (Base_dSource.v_posCol dtb__176); Base_dSource.f_Span_spanStartOffset = (Base_dSource.v_posOffset dtb__176); Base_dSource.f_Span_spanEndOffset = (Base_dSource.v_posOffset dtb__176) }
)
  | _ -> failwith "DT: impossible branch"
)))

# 338 "Vuna/Compiler/Frontend/Parser/Support.vuna"
let v_canContinue = (fun (st : t_PState) (blockCol : int) -> (match (v_peekPos st) with
  | { Base_dSource.f_Pos_posLine = dtb__177; Base_dSource.f_Pos_posCol = dtb__178; Base_dSource.f_Pos_posOffset = dtb__179; Base_dSource.f_Pos_posEndOffset = dtb__180 } -> (match (v_lastPos st) with
  | { Base_dSource.f_Pos_posLine = dtb__181; Base_dSource.f_Pos_posCol = dtb__182; Base_dSource.f_Pos_posOffset = dtb__183; Base_dSource.f_Pos_posEndOffset = dtb__184 } -> (if (dtb__177 = dtb__181) then true else (dtb__178 > blockCol))
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
))

# 347 "Vuna/Compiler/Frontend/Parser/Support.vuna"
let v_expectSym = (fun (st : t_PState) (s : string) -> (let nd_uscrut2 = (v_peekTok st) in (match nd_uscrut2 with
  | { Frontend_dLexer.f_PTok_ptokTok = dtb__185; Frontend_dLexer.f_PTok_ptokPos = dtb__186 } -> (match dtb__185 with
  | Frontend_dLexer.C_Tok_TSym (dtb__187) -> (if (dtb__187 = s) then (Base_dDiag.C_Check_OkC ((v_advance st))) else (((Base_dDiagnostics_dFrontend.v_psErr1At (v_tokSpan st)) (Base_dDiagnostics_dFrontend.C_PsDiag_ExpectedToken (s))) s))
  | _ -> (((Base_dDiagnostics_dFrontend.v_psErr1At (v_tokSpan st)) (Base_dDiagnostics_dFrontend.C_PsDiag_ExpectedToken (s))) s)
)
  | _ -> failwith "DT: impossible branch"
)))

# 354 "Vuna/Compiler/Frontend/Parser/Support.vuna"
let v_expectKw = (fun (st : t_PState) (k : string) -> (let nd_uscrut2 = (v_peekTok st) in (match nd_uscrut2 with
  | { Frontend_dLexer.f_PTok_ptokTok = dtb__188; Frontend_dLexer.f_PTok_ptokPos = dtb__189 } -> (match dtb__188 with
  | Frontend_dLexer.C_Tok_TKw (dtb__190) -> (if (dtb__190 = k) then (Base_dDiag.C_Check_OkC ((v_advance st))) else (((Base_dDiagnostics_dFrontend.v_psErr1At (v_tokSpan st)) (Base_dDiagnostics_dFrontend.C_PsDiag_ExpectedToken (k))) k))
  | _ -> (((Base_dDiagnostics_dFrontend.v_psErr1At (v_tokSpan st)) (Base_dDiagnostics_dFrontend.C_PsDiag_ExpectedToken (k))) k)
)
  | _ -> failwith "DT: impossible branch"
)))

# 360 "Vuna/Compiler/Frontend/Parser/Support.vuna"
let v_expectIdent = (fun (st : t_PState) -> (let nd_uscrut1 = (v_peekTok st) in (match nd_uscrut1 with
  | { Frontend_dLexer.f_PTok_ptokTok = dtb__191; Frontend_dLexer.f_PTok_ptokPos = dtb__192 } -> (match dtb__191 with
  | Frontend_dLexer.C_Tok_TIdent (dtb__193) -> (Base_dDiag.C_Check_OkC ({ B_dData_dPair.f_Pair_first = dtb__193; B_dData_dPair.f_Pair_second = (v_advance st) }))
  | _ -> ((Base_dDiagnostics_dFrontend.v_psErr0At (v_tokSpan st)) Base_dDiagnostics_dFrontend.C_PsDiag_ExpectedIdentifier)
)
  | _ -> failwith "DT: impossible branch"
)))

# 368 "Vuna/Compiler/Frontend/Parser/Support.vuna"
let v_expectValueName = (fun (st : t_PState) -> (let nd_uscrut1 = (v_peekTok st) in (match nd_uscrut1 with
  | { Frontend_dLexer.f_PTok_ptokTok = dtb__194; Frontend_dLexer.f_PTok_ptokPos = dtb__195 } -> (match dtb__194 with
  | Frontend_dLexer.C_Tok_TSym (dtb__196) -> (if (v_isReservedValueName dtb__196) then (((Base_dDiagnostics_dFrontend.v_psErr1At (v_tokSpan st)) (Base_dDiagnostics_dFrontend.C_PsDiag_ExpectedToken ("value name"))) "value name") else (Base_dDiag.C_Check_OkC ({ B_dData_dPair.f_Pair_first = dtb__196; B_dData_dPair.f_Pair_second = (v_advance st) })))
  | Frontend_dLexer.C_Tok_TIdent (dtb__197) -> (if (v_isReservedValueName dtb__197) then (((Base_dDiagnostics_dFrontend.v_psErr1At (v_tokSpan st)) (Base_dDiagnostics_dFrontend.C_PsDiag_ExpectedToken ("value name"))) "value name") else (Base_dDiag.C_Check_OkC ({ B_dData_dPair.f_Pair_first = dtb__197; B_dData_dPair.f_Pair_second = (v_advance st) })))
  | _ -> ((Base_dDiagnostics_dFrontend.v_psErr0At (v_tokSpan st)) Base_dDiagnostics_dFrontend.C_PsDiag_ExpectedIdentifier)
)
  | _ -> failwith "DT: impossible branch"
)))

# 33 "Vuna/Compiler/Frontend/Parser/Support.vuna"
let v_toksLeft = (fun (p : t_PState) -> (match p with
  | { f_PState_fileOf = dtb__198; f_PState_sourceOf = dtb__199; f_PState_toksOf = dtb__200; f_PState_lastPos = dtb__201; f_PState_toksLeft = dtb__202; f_PState_pmodeOf = dtb__203; f_PState_tokIndex = dtb__204; f_PState_pendEvents = dtb__205; f_PState_nextNodeId = dtb__206; f_PState_openNodeId = dtb__207; f_PState_subStream = dtb__208; f_PState_backtickShapes = dtb__209; f_PState_sectionShapes = dtb__210; f_PState_interpMultis = dtb__211; f_PState_templateHoles = dtb__212 } -> dtb__202
  | _ -> failwith "DT: impossible branch"
))

# 34 "Vuna/Compiler/Frontend/Parser/Support.vuna"
let v_pmodeOf = (fun (p : t_PState) -> (match p with
  | { f_PState_fileOf = dtb__213; f_PState_sourceOf = dtb__214; f_PState_toksOf = dtb__215; f_PState_lastPos = dtb__216; f_PState_toksLeft = dtb__217; f_PState_pmodeOf = dtb__218; f_PState_tokIndex = dtb__219; f_PState_pendEvents = dtb__220; f_PState_nextNodeId = dtb__221; f_PState_openNodeId = dtb__222; f_PState_subStream = dtb__223; f_PState_backtickShapes = dtb__224; f_PState_sectionShapes = dtb__225; f_PState_interpMultis = dtb__226; f_PState_templateHoles = dtb__227 } -> dtb__218
  | _ -> failwith "DT: impossible branch"
))

# 35 "Vuna/Compiler/Frontend/Parser/Support.vuna"
let v_tokIndex = (fun (p : t_PState) -> (match p with
  | { f_PState_fileOf = dtb__228; f_PState_sourceOf = dtb__229; f_PState_toksOf = dtb__230; f_PState_lastPos = dtb__231; f_PState_toksLeft = dtb__232; f_PState_pmodeOf = dtb__233; f_PState_tokIndex = dtb__234; f_PState_pendEvents = dtb__235; f_PState_nextNodeId = dtb__236; f_PState_openNodeId = dtb__237; f_PState_subStream = dtb__238; f_PState_backtickShapes = dtb__239; f_PState_sectionShapes = dtb__240; f_PState_interpMultis = dtb__241; f_PState_templateHoles = dtb__242 } -> dtb__234
  | _ -> failwith "DT: impossible branch"
))

# 36 "Vuna/Compiler/Frontend/Parser/Support.vuna"
let v_pendEvents = (fun (p : t_PState) -> (match p with
  | { f_PState_fileOf = dtb__243; f_PState_sourceOf = dtb__244; f_PState_toksOf = dtb__245; f_PState_lastPos = dtb__246; f_PState_toksLeft = dtb__247; f_PState_pmodeOf = dtb__248; f_PState_tokIndex = dtb__249; f_PState_pendEvents = dtb__250; f_PState_nextNodeId = dtb__251; f_PState_openNodeId = dtb__252; f_PState_subStream = dtb__253; f_PState_backtickShapes = dtb__254; f_PState_sectionShapes = dtb__255; f_PState_interpMultis = dtb__256; f_PState_templateHoles = dtb__257 } -> dtb__250
  | _ -> failwith "DT: impossible branch"
))

# 39 "Vuna/Compiler/Frontend/Parser/Support.vuna"
let v_nextNodeId = (fun (p : t_PState) -> (match p with
  | { f_PState_fileOf = dtb__258; f_PState_sourceOf = dtb__259; f_PState_toksOf = dtb__260; f_PState_lastPos = dtb__261; f_PState_toksLeft = dtb__262; f_PState_pmodeOf = dtb__263; f_PState_tokIndex = dtb__264; f_PState_pendEvents = dtb__265; f_PState_nextNodeId = dtb__266; f_PState_openNodeId = dtb__267; f_PState_subStream = dtb__268; f_PState_backtickShapes = dtb__269; f_PState_sectionShapes = dtb__270; f_PState_interpMultis = dtb__271; f_PState_templateHoles = dtb__272 } -> dtb__266
  | _ -> failwith "DT: impossible branch"
))

# 42 "Vuna/Compiler/Frontend/Parser/Support.vuna"
let v_openNodeId = (fun (p : t_PState) -> (match p with
  | { f_PState_fileOf = dtb__273; f_PState_sourceOf = dtb__274; f_PState_toksOf = dtb__275; f_PState_lastPos = dtb__276; f_PState_toksLeft = dtb__277; f_PState_pmodeOf = dtb__278; f_PState_tokIndex = dtb__279; f_PState_pendEvents = dtb__280; f_PState_nextNodeId = dtb__281; f_PState_openNodeId = dtb__282; f_PState_subStream = dtb__283; f_PState_backtickShapes = dtb__284; f_PState_sectionShapes = dtb__285; f_PState_interpMultis = dtb__286; f_PState_templateHoles = dtb__287 } -> dtb__282
  | _ -> failwith "DT: impossible branch"
))

# 47 "Vuna/Compiler/Frontend/Parser/Support.vuna"
let v_subStream = (fun (p : t_PState) -> (match p with
  | { f_PState_fileOf = dtb__288; f_PState_sourceOf = dtb__289; f_PState_toksOf = dtb__290; f_PState_lastPos = dtb__291; f_PState_toksLeft = dtb__292; f_PState_pmodeOf = dtb__293; f_PState_tokIndex = dtb__294; f_PState_pendEvents = dtb__295; f_PState_nextNodeId = dtb__296; f_PState_openNodeId = dtb__297; f_PState_subStream = dtb__298; f_PState_backtickShapes = dtb__299; f_PState_sectionShapes = dtb__300; f_PState_interpMultis = dtb__301; f_PState_templateHoles = dtb__302 } -> dtb__298
  | _ -> failwith "DT: impossible branch"
))

# 50 "Vuna/Compiler/Frontend/Parser/Support.vuna"
let v_backtickShapes = (fun (p : t_PState) -> (match p with
  | { f_PState_fileOf = dtb__303; f_PState_sourceOf = dtb__304; f_PState_toksOf = dtb__305; f_PState_lastPos = dtb__306; f_PState_toksLeft = dtb__307; f_PState_pmodeOf = dtb__308; f_PState_tokIndex = dtb__309; f_PState_pendEvents = dtb__310; f_PState_nextNodeId = dtb__311; f_PState_openNodeId = dtb__312; f_PState_subStream = dtb__313; f_PState_backtickShapes = dtb__314; f_PState_sectionShapes = dtb__315; f_PState_interpMultis = dtb__316; f_PState_templateHoles = dtb__317 } -> dtb__314
  | _ -> failwith "DT: impossible branch"
))

# 52 "Vuna/Compiler/Frontend/Parser/Support.vuna"
let v_sectionShapes = (fun (p : t_PState) -> (match p with
  | { f_PState_fileOf = dtb__318; f_PState_sourceOf = dtb__319; f_PState_toksOf = dtb__320; f_PState_lastPos = dtb__321; f_PState_toksLeft = dtb__322; f_PState_pmodeOf = dtb__323; f_PState_tokIndex = dtb__324; f_PState_pendEvents = dtb__325; f_PState_nextNodeId = dtb__326; f_PState_openNodeId = dtb__327; f_PState_subStream = dtb__328; f_PState_backtickShapes = dtb__329; f_PState_sectionShapes = dtb__330; f_PState_interpMultis = dtb__331; f_PState_templateHoles = dtb__332 } -> dtb__330
  | _ -> failwith "DT: impossible branch"
))

# 54 "Vuna/Compiler/Frontend/Parser/Support.vuna"
let v_interpMultis = (fun (p : t_PState) -> (match p with
  | { f_PState_fileOf = dtb__333; f_PState_sourceOf = dtb__334; f_PState_toksOf = dtb__335; f_PState_lastPos = dtb__336; f_PState_toksLeft = dtb__337; f_PState_pmodeOf = dtb__338; f_PState_tokIndex = dtb__339; f_PState_pendEvents = dtb__340; f_PState_nextNodeId = dtb__341; f_PState_openNodeId = dtb__342; f_PState_subStream = dtb__343; f_PState_backtickShapes = dtb__344; f_PState_sectionShapes = dtb__345; f_PState_interpMultis = dtb__346; f_PState_templateHoles = dtb__347 } -> dtb__346
  | _ -> failwith "DT: impossible branch"
))

# 59 "Vuna/Compiler/Frontend/Parser/Support.vuna"
let v_templateHoles = (fun (p : t_PState) -> (match p with
  | { f_PState_fileOf = dtb__348; f_PState_sourceOf = dtb__349; f_PState_toksOf = dtb__350; f_PState_lastPos = dtb__351; f_PState_toksLeft = dtb__352; f_PState_pmodeOf = dtb__353; f_PState_tokIndex = dtb__354; f_PState_pendEvents = dtb__355; f_PState_nextNodeId = dtb__356; f_PState_openNodeId = dtb__357; f_PState_subStream = dtb__358; f_PState_backtickShapes = dtb__359; f_PState_sectionShapes = dtb__360; f_PState_interpMultis = dtb__361; f_PState_templateHoles = dtb__362 } -> dtb__362
  | _ -> failwith "DT: impossible branch"
))
