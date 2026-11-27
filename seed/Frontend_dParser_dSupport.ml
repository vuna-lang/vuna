open Vuna_runtime
type t_ParseMode = C_ParseMode_PmStrict | C_ParseMode_PmTool
and t_EventMode = C_EventMode_EvNone | C_EventMode_EvLayout | C_EventMode_EvFull
and t_PState = { f_PState_fileOf : string; f_PState_sourceOf : string; f_PState_toksOf : Frontend_dLexer.t_PTok B_dData_dList.t_List; f_PState_lastPos : Base_dSource.t_Pos; f_PState_toksLeft : int; f_PState_pmodeOf : t_ParseMode; f_PState_tokIndex : int; f_PState_pendEvents : Frontend_dCst.t_NodeEvent B_dData_dList.t_List; f_PState_nextNodeId : int; f_PState_openNodeId : int; f_PState_subStream : bool; f_PState_backtickShapes : (int, bool) B_dData_dPair.t_Pair B_dData_dList.t_List; f_PState_sectionShapes : (int, Frontend_dCst.t_SectionShape) B_dData_dPair.t_Pair B_dData_dList.t_List; f_PState_interpMultis : (int, bool) B_dData_dPair.t_Pair B_dData_dList.t_List; f_PState_templateHoles : (int, Frontend_dCst.t_CstNode B_dData_dList.t_List) B_dData_dPair.t_Pair B_dData_dList.t_List; f_PState_eventMode : t_EventMode }

# 79 "Vuna/Compiler/Frontend/Parser/Support.vuna"
let v_mkState = (fun (dtb_u_u1 : string) (dtb_u_u2 : string) (dtb_u_u3 : Frontend_dLexer.t_PTok B_dData_dList.t_List) (dtb_u_u4 : t_ParseMode) (dtb_u_u5 : t_EventMode) -> { f_PState_fileOf = dtb_u_u1; f_PState_sourceOf = dtb_u_u2; f_PState_toksOf = dtb_u_u3; f_PState_lastPos = { Base_dSource.f_Pos_posLine = 1; Base_dSource.f_Pos_posCol = 0; Base_dSource.f_Pos_posOffset = 0; Base_dSource.f_Pos_posEndOffset = 0 }; f_PState_toksLeft = (B_dData_dList.v_length dtb_u_u3); f_PState_pmodeOf = dtb_u_u4; f_PState_tokIndex = 0; f_PState_pendEvents = B_dData_dList.C_List_Nil; f_PState_nextNodeId = 1; f_PState_openNodeId = 0; f_PState_subStream = false; f_PState_backtickShapes = B_dData_dList.C_List_Nil; f_PState_sectionShapes = B_dData_dList.C_List_Nil; f_PState_interpMultis = B_dData_dList.C_List_Nil; f_PState_templateHoles = B_dData_dList.C_List_Nil; f_PState_eventMode = dtb_u_u5 })

# 86 "Vuna/Compiler/Frontend/Parser/Support.vuna"
let v_mkStateAt = (fun (dtb_u_u6 : string) (dtb_u_u7 : string) (dtb_u_u8 : Frontend_dLexer.t_PTok B_dData_dList.t_List) (dtb_u_u9 : Base_dSource.t_Pos) (dtb_u_u10 : int) (dtb_u_u11 : t_ParseMode) (dtb_u_u12 : t_EventMode) -> { f_PState_fileOf = dtb_u_u6; f_PState_sourceOf = dtb_u_u7; f_PState_toksOf = dtb_u_u8; f_PState_lastPos = dtb_u_u9; f_PState_toksLeft = dtb_u_u10; f_PState_pmodeOf = dtb_u_u11; f_PState_tokIndex = 0; f_PState_pendEvents = B_dData_dList.C_List_Nil; f_PState_nextNodeId = (0 - (2 + (Base_dSource.v_posOffset dtb_u_u9))); f_PState_openNodeId = 0; f_PState_subStream = true; f_PState_backtickShapes = B_dData_dList.C_List_Nil; f_PState_sectionShapes = B_dData_dList.C_List_Nil; f_PState_interpMultis = B_dData_dList.C_List_Nil; f_PState_templateHoles = B_dData_dList.C_List_Nil; f_PState_eventMode = dtb_u_u12 })

# 92 "Vuna/Compiler/Frontend/Parser/Support.vuna"
let v_eventsOf = (fun (dtb_u_u13 : t_PState) -> (B_dData_dList.v_reverse (dtb_u_u13).f_PState_pendEvents))

# 122 "Vuna/Compiler/Frontend/Parser/Support.vuna"
let v_openNodeState = (fun (dtb_u_u14 : t_PState) (dtb_u_u15 : Frontend_dCst.t_CstKind) (dtb_u_u16 : int) (dtb_u_u17 : int) -> (match (dtb_u_u14).f_PState_eventMode with
  | C_EventMode_EvNone -> { dtb_u_u14 with f_PState_nextNodeId = dtb_u_u17; f_PState_openNodeId = dtb_u_u16 }
  | _ -> { dtb_u_u14 with f_PState_pendEvents = (B_dData_dList.C_List__x58__x58_ ((Frontend_dCst.C_NodeEvent_EvOpen (dtb_u_u15, (dtb_u_u14).f_PState_tokIndex, dtb_u_u16)), (dtb_u_u14).f_PState_pendEvents)); f_PState_nextNodeId = dtb_u_u17; f_PState_openNodeId = dtb_u_u16 }
))

# 143 "Vuna/Compiler/Frontend/Parser/Support.vuna"
let v_addBacktickShape = (fun (dtb_u_u18 : int) (dtb_u_u19 : t_PState) -> { dtb_u_u19 with f_PState_backtickShapes = (B_dData_dList.C_List__x58__x58_ ({ B_dData_dPair.f_Pair_first = dtb_u_u18; B_dData_dPair.f_Pair_second = true }, (dtb_u_u19).f_PState_backtickShapes)) })

# 147 "Vuna/Compiler/Frontend/Parser/Support.vuna"
let v_addSectionShape = (fun (dtb_u_u20 : int) (dtb_u_u21 : Frontend_dCst.t_SectionShape) (dtb_u_u22 : t_PState) -> { dtb_u_u22 with f_PState_sectionShapes = (B_dData_dList.C_List__x58__x58_ ({ B_dData_dPair.f_Pair_first = dtb_u_u20; B_dData_dPair.f_Pair_second = dtb_u_u21 }, (dtb_u_u22).f_PState_sectionShapes)) })

# 151 "Vuna/Compiler/Frontend/Parser/Support.vuna"
let v_addInterpMulti = (fun (dtb_u_u23 : int) (dtb_u_u24 : bool) (dtb_u_u25 : t_PState) -> { dtb_u_u25 with f_PState_interpMultis = (B_dData_dList.C_List__x58__x58_ ({ B_dData_dPair.f_Pair_first = dtb_u_u23; B_dData_dPair.f_Pair_second = dtb_u_u24 }, (dtb_u_u25).f_PState_interpMultis)) })

# 155 "Vuna/Compiler/Frontend/Parser/Support.vuna"
let v_addTemplateHoles = (fun (dtb_u_u26 : int) (dtb_u_u27 : Frontend_dCst.t_CstNode B_dData_dList.t_List) (dtb_u_u28 : t_PState) -> { dtb_u_u28 with f_PState_templateHoles = (B_dData_dList.C_List__x58__x58_ ({ B_dData_dPair.f_Pair_first = dtb_u_u26; B_dData_dPair.f_Pair_second = dtb_u_u27 }, (dtb_u_u28).f_PState_templateHoles)) })

# 167 "Vuna/Compiler/Frontend/Parser/Support.vuna"
let[@tail_mod_cons] rec v_rekeyInfixGo = (fun (dtb_u_u29 : int) (dtb_u_u30 : int) (dtb_u_u31 : (int, bool) B_dData_dPair.t_Pair B_dData_dList.t_List) -> (match dtb_u_u31 with
  | B_dData_dList.C_List__x58__x58_ (dtb_u_u32, dtb_u_u33) -> (if ((B_dData_dPair.v_firstOf dtb_u_u32) = dtb_u_u29) then (B_dData_dList.C_List__x58__x58_ ({ B_dData_dPair.f_Pair_first = dtb_u_u30; B_dData_dPair.f_Pair_second = (B_dData_dPair.v_secondOf dtb_u_u32) }, dtb_u_u33)) else (B_dData_dList.C_List__x58__x58_ (dtb_u_u32, (((v_rekeyInfixGo dtb_u_u29) dtb_u_u30) dtb_u_u33))))
  | B_dData_dList.C_List_Nil -> B_dData_dList.C_List_Nil
  | _ -> failwith "DT: impossible branch"
))

# 160 "Vuna/Compiler/Frontend/Parser/Support.vuna"
let v_rekeyInfix = (fun (dtb_u_u34 : int) (dtb_u_u35 : int) (dtb_u_u36 : t_PState) -> (if (if (dtb_u_u34 < 0) then true else (dtb_u_u34 = dtb_u_u35)) then dtb_u_u36 else { dtb_u_u36 with f_PState_backtickShapes = (((v_rekeyInfixGo dtb_u_u34) dtb_u_u35) (dtb_u_u36).f_PState_backtickShapes) }))

# 173 "Vuna/Compiler/Frontend/Parser/Support.vuna"
let v_closedAt = (fun (dtb_u_u37 : t_PState) -> { dtb_u_u37 with f_PState_pendEvents = (B_dData_dList.C_List__x58__x58_ ((Frontend_dCst.C_NodeEvent_EvClose ((dtb_u_u37).f_PState_tokIndex)), (dtb_u_u37).f_PState_pendEvents)) })

# 135 "Vuna/Compiler/Frontend/Parser/Support.vuna"
let v_closeWithSem = (fun (dtb_u_u38 : int) (dtb_u_u39 : Frontend_dCst.t_CstSem B_dData_dMaybe.t_Maybe) (dtb_u_u40 : t_PState) -> (match dtb_u_u39 with
  | B_dData_dMaybe.C_Maybe_Just (dtb_u_u41) -> (let dtb_u_u42 = { dtb_u_u40 with f_PState_pendEvents = (B_dData_dList.C_List__x58__x58_ ((Frontend_dCst.C_NodeEvent_EvSem (dtb_u_u38, dtb_u_u41)), (dtb_u_u40).f_PState_pendEvents)) } in (v_closedAt dtb_u_u42))
  | B_dData_dMaybe.C_Maybe_Nothing -> (v_closedAt dtb_u_u40)
  | _ -> failwith "DT: impossible branch"
))

# 107 "Vuna/Compiler/Frontend/Parser/Support.vuna"
let v_withExtent = (fun (dtb_u_u44 : Frontend_dCst.t_CstKind) dtb_u_u45 (dtb_u_u46 : t_PState) dtb_u_u47 -> (let dtb_u_u48 = (dtb_u_u46).f_PState_nextNodeId in (let dtb_u_u49 = (if (dtb_u_u46).f_PState_subStream then (dtb_u_u48 - 1) else (dtb_u_u48 + 1)) in (let dtb_u_u50 = ((((v_openNodeState dtb_u_u46) dtb_u_u44) dtb_u_u48) dtb_u_u49) in ((Base_dCommon.v_step (dtb_u_u47 dtb_u_u50)) (fun dtb_u_u51 (dtb_u_u52 : t_PState) -> (match (dtb_u_u46).f_PState_eventMode with
  | C_EventMode_EvFull -> (Base_dDiag.C_Check_OkC ({ B_dData_dPair.f_Pair_first = dtb_u_u51; B_dData_dPair.f_Pair_second = (((v_closeWithSem dtb_u_u48) (dtb_u_u45 dtb_u_u51)) dtb_u_u52) }))
  | C_EventMode_EvLayout -> (Base_dDiag.C_Check_OkC ({ B_dData_dPair.f_Pair_first = dtb_u_u51; B_dData_dPair.f_Pair_second = (v_closedAt dtb_u_u52) }))
  | C_EventMode_EvNone -> (Base_dDiag.C_Check_OkC ({ B_dData_dPair.f_Pair_first = dtb_u_u51; B_dData_dPair.f_Pair_second = dtb_u_u52 }))
  | _ -> failwith "DT: impossible branch"
)))))))

# 178 "Vuna/Compiler/Frontend/Parser/Support.vuna"
let v_withLastPos = (fun (dtb_u_u53 : Base_dSource.t_Pos) (dtb_u_u54 : t_PState) -> { dtb_u_u54 with f_PState_lastPos = dtb_u_u53 })

# 183 "Vuna/Compiler/Frontend/Parser/Support.vuna"
let v_lastEndCol = (fun (dtb_u_u55 : Base_dSource.t_Pos) -> ((Base_dSource.v_posCol dtb_u_u55) + ((Base_dSource.v_posEndOffset dtb_u_u55) - (Base_dSource.v_posOffset dtb_u_u55))))

# 232 "Vuna/Compiler/Frontend/Parser/Support.vuna"
let v_peekTok = (fun (dtb_u_u56 : t_PState) -> (match (dtb_u_u56).f_PState_toksOf with
  | B_dData_dList.C_List__x58__x58_ (dtb_u_u57, dtb_u_u58) -> dtb_u_u57
  | B_dData_dList.C_List_Nil -> { Frontend_dLexer.f_PTok_ptokTok = Frontend_dLexer.C_Tok_TEof; Frontend_dLexer.f_PTok_ptokPos = { Base_dSource.f_Pos_posLine = 1; Base_dSource.f_Pos_posCol = 1; Base_dSource.f_Pos_posOffset = 0; Base_dSource.f_Pos_posEndOffset = 0 } }
  | _ -> failwith "DT: impossible branch"
))

# 238 "Vuna/Compiler/Frontend/Parser/Support.vuna"
let v_peekPos = (fun (dtb_u_u59 : t_PState) -> ((v_peekTok dtb_u_u59)).Frontend_dLexer.f_PTok_ptokPos)

# 253 "Vuna/Compiler/Frontend/Parser/Support.vuna"
let v_advance = (fun (dtb_u_u60 : t_PState) -> (match (dtb_u_u60).f_PState_toksOf with
  | B_dData_dList.C_List__x58__x58_ (dtb_u_u61, dtb_u_u62) -> (let dtb_u_u63 = dtb_u_u61 in (match dtb_u_u63 with
  | { Frontend_dLexer.f_PTok_ptokTok = dtb_u_u64; Frontend_dLexer.f_PTok_ptokPos = dtb_u_u65 } -> (match dtb_u_u64 with
  | Frontend_dLexer.C_Tok_TEof -> dtb_u_u60
  | _ -> { dtb_u_u60 with f_PState_toksOf = dtb_u_u62; f_PState_lastPos = (dtb_u_u61).Frontend_dLexer.f_PTok_ptokPos; f_PState_toksLeft = (if ((dtb_u_u60).f_PState_toksLeft > 0) then ((dtb_u_u60).f_PState_toksLeft - 1) else 0); f_PState_tokIndex = ((dtb_u_u60).f_PState_tokIndex + 1) }
)
  | _ -> failwith "DT: impossible branch"
))
  | B_dData_dList.C_List_Nil -> dtb_u_u60
  | _ -> failwith "DT: impossible branch"
))

# 268 "Vuna/Compiler/Frontend/Parser/Support.vuna"
let v_isEof = (fun (dtb_u_u66 : t_PState) -> (let dtb_u_u67 = (v_peekTok dtb_u_u66) in (match dtb_u_u67 with
  | { Frontend_dLexer.f_PTok_ptokTok = dtb_u_u68; Frontend_dLexer.f_PTok_ptokPos = dtb_u_u69 } -> (match dtb_u_u68 with
  | Frontend_dLexer.C_Tok_TEof -> true
  | _ -> false
)
  | _ -> failwith "DT: impossible branch"
)))

# 297 "Vuna/Compiler/Frontend/Parser/Support.vuna"
let v_stateFuel = (fun (dtb_u_u70 : t_PState) -> ((128 * (dtb_u_u70).f_PState_toksLeft) + 1024))

# 300 "Vuna/Compiler/Frontend/Parser/Support.vuna"
let v_sameLineState = (fun (dtb_u_u71 : t_PState) -> (match (v_peekPos dtb_u_u71) with
  | { Base_dSource.f_Pos_posLine = dtb_u_u72; Base_dSource.f_Pos_posCol = dtb_u_u73; Base_dSource.f_Pos_posOffset = dtb_u_u74; Base_dSource.f_Pos_posEndOffset = dtb_u_u75 } -> { dtb_u_u71 with f_PState_lastPos = { Base_dSource.f_Pos_posLine = dtb_u_u72; Base_dSource.f_Pos_posCol = 0; Base_dSource.f_Pos_posOffset = 0; Base_dSource.f_Pos_posEndOffset = 0 } }
  | _ -> failwith "DT: impossible branch"
))

# 305 "Vuna/Compiler/Frontend/Parser/Support.vuna"
let v_atSym = (fun (dtb_u_u76 : t_PState) (dtb_u_u77 : string) -> (let dtb_u_u78 = (v_peekTok dtb_u_u76) in (match dtb_u_u78 with
  | { Frontend_dLexer.f_PTok_ptokTok = dtb_u_u79; Frontend_dLexer.f_PTok_ptokPos = dtb_u_u80 } -> (match dtb_u_u79 with
  | Frontend_dLexer.C_Tok_TSym (dtb_u_u81) -> (dtb_u_u81 = dtb_u_u77)
  | _ -> false
)
  | _ -> failwith "DT: impossible branch"
)))

# 312 "Vuna/Compiler/Frontend/Parser/Support.vuna"
let rec v_nthTok = (fun (dtb_u_u82 : Frontend_dLexer.t_PTok B_dData_dList.t_List) (dtb_u_u83 : int) -> (match dtb_u_u82 with
  | B_dData_dList.C_List__x58__x58_ (dtb_u_u84, dtb_u_u85) -> (if (dtb_u_u83 <= 0) then (B_dData_dMaybe.C_Maybe_Just (dtb_u_u84)) else ((v_nthTok dtb_u_u85) (dtb_u_u83 - 1)))
  | B_dData_dList.C_List_Nil -> B_dData_dMaybe.C_Maybe_Nothing
  | _ -> failwith "DT: impossible branch"
))

# 316 "Vuna/Compiler/Frontend/Parser/Support.vuna"
let v_peekTokAt = (fun (dtb_u_u86 : t_PState) (dtb_u_u87 : int) -> ((v_nthTok (dtb_u_u86).f_PState_toksOf) dtb_u_u87))

# 334 "Vuna/Compiler/Frontend/Parser/Support.vuna"
let v_tokTail = (fun (dtb_u_u88 : Frontend_dLexer.t_PTok B_dData_dList.t_List) -> (match dtb_u_u88 with
  | B_dData_dList.C_List__x58__x58_ (dtb_u_u89, dtb_u_u90) -> dtb_u_u90
  | B_dData_dList.C_List_Nil -> B_dData_dList.C_List_Nil
  | _ -> failwith "DT: impossible branch"
))

# 339 "Vuna/Compiler/Frontend/Parser/Support.vuna"
let rec v_binderNameTail = (fun (dtb_u_u91 : Frontend_dLexer.t_PTok B_dData_dList.t_List) (dtb_u_u92 : string B_dData_dList.t_List) -> (match dtb_u_u91 with
  | B_dData_dList.C_List__x58__x58_ (dtb_u_u93, dtb_u_u94) -> (let dtb_u_u95 = dtb_u_u93 in (match dtb_u_u95 with
  | { Frontend_dLexer.f_PTok_ptokTok = dtb_u_u96; Frontend_dLexer.f_PTok_ptokPos = dtb_u_u97 } -> (match dtb_u_u96 with
  | Frontend_dLexer.C_Tok_TSym (dtb_u_u98) -> (if (dtb_u_u98 = ":") then (B_dData_dMaybe.C_Maybe_Just ((B_dData_dList.v_reverse dtb_u_u92))) else B_dData_dMaybe.C_Maybe_Nothing)
  | Frontend_dLexer.C_Tok_TIdent (dtb_u_u99) -> ((v_binderNameTail dtb_u_u94) (B_dData_dList.C_List__x58__x58_ (dtb_u_u99, dtb_u_u92)))
  | _ -> B_dData_dMaybe.C_Maybe_Nothing
)
  | _ -> failwith "DT: impossible branch"
))
  | B_dData_dList.C_List_Nil -> B_dData_dMaybe.C_Maybe_Nothing
  | _ -> failwith "DT: impossible branch"
))

# 347 "Vuna/Compiler/Frontend/Parser/Support.vuna"
let v_quantifiedHead = (fun (dtb_u_u100 : t_PState) (dtb_u_u101 : Frontend_dAst.t_Qty) -> (let dtb_u_u102 = ((v_peekTokAt dtb_u_u100) 1) in (match dtb_u_u102 with
  | B_dData_dMaybe.C_Maybe_Just (dtb_u_u103) -> (match dtb_u_u103 with
  | { Frontend_dLexer.f_PTok_ptokTok = dtb_u_u104; Frontend_dLexer.f_PTok_ptokPos = dtb_u_u105 } -> (match dtb_u_u104 with
  | Frontend_dLexer.C_Tok_TIdent (dtb_u_u106) -> (match ((v_binderNameTail (v_tokTail (v_tokTail (dtb_u_u100).f_PState_toksOf))) B_dData_dList.C_List_Nil) with
  | B_dData_dMaybe.C_Maybe_Just (dtb_u_u107) -> (B_dData_dMaybe.C_Maybe_Just ({ B_dData_dPair.f_Pair_first = (B_dData_dMaybe.C_Maybe_Just (dtb_u_u101)); B_dData_dPair.f_Pair_second = (B_dData_dList.C_List__x58__x58_ (dtb_u_u106, dtb_u_u107)) }))
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
let v_binderHead = (fun (dtb_u_u108 : t_PState) -> (let dtb_u_u109 = (v_peekTok dtb_u_u108) in (match dtb_u_u109 with
  | { Frontend_dLexer.f_PTok_ptokTok = dtb_u_u110; Frontend_dLexer.f_PTok_ptokPos = dtb_u_u111 } -> (match dtb_u_u110 with
  | Frontend_dLexer.C_Tok_TInt (dtb_u_u112) -> (if (dtb_u_u112 = 0) then ((v_quantifiedHead dtb_u_u108) Frontend_dAst.C_Qty_Q0) else (if (dtb_u_u112 = 1) then ((v_quantifiedHead dtb_u_u108) Frontend_dAst.C_Qty_Q1) else B_dData_dMaybe.C_Maybe_Nothing))
  | Frontend_dLexer.C_Tok_TIdent (dtb_u_u113) -> (match ((v_binderNameTail (v_tokTail (dtb_u_u108).f_PState_toksOf)) B_dData_dList.C_List_Nil) with
  | B_dData_dMaybe.C_Maybe_Just (dtb_u_u114) -> (B_dData_dMaybe.C_Maybe_Just ({ B_dData_dPair.f_Pair_first = B_dData_dMaybe.C_Maybe_Nothing; B_dData_dPair.f_Pair_second = (B_dData_dList.C_List__x58__x58_ (dtb_u_u113, dtb_u_u114)) }))
  | B_dData_dMaybe.C_Maybe_Nothing -> B_dData_dMaybe.C_Maybe_Nothing
  | _ -> failwith "DT: impossible branch"
)
  | _ -> B_dData_dMaybe.C_Maybe_Nothing
)
  | _ -> failwith "DT: impossible branch"
)))

# 369 "Vuna/Compiler/Frontend/Parser/Support.vuna"
let v_arrowAt = (fun (dtb_u_u115 : Frontend_dLexer.t_PTok B_dData_dList.t_List) -> (match dtb_u_u115 with
  | B_dData_dList.C_List__x58__x58_ (dtb_u_u116, dtb_u_u117) -> (match dtb_u_u116 with
  | { Frontend_dLexer.f_PTok_ptokTok = dtb_u_u118; Frontend_dLexer.f_PTok_ptokPos = dtb_u_u119 } -> (match dtb_u_u118 with
  | Frontend_dLexer.C_Tok_TSym (dtb_u_u120) -> (if (dtb_u_u120 = "->") then true else false)
  | _ -> false
)
  | _ -> failwith "DT: impossible branch"
)
  | _ -> false
))

# 362 "Vuna/Compiler/Frontend/Parser/Support.vuna"
let rec v_piArrowAheadGo = (fun (dtb_u_u121 : int) (dtb_u_u122 : Frontend_dLexer.t_PTok B_dData_dList.t_List) -> (match dtb_u_u122 with
  | B_dData_dList.C_List__x58__x58_ (dtb_u_u123, dtb_u_u124) -> (match dtb_u_u123 with
  | { Frontend_dLexer.f_PTok_ptokTok = dtb_u_u125; Frontend_dLexer.f_PTok_ptokPos = dtb_u_u126 } -> (match dtb_u_u125 with
  | Frontend_dLexer.C_Tok_TSym (dtb_u_u127) -> (if (dtb_u_u127 = "(") then ((v_piArrowAheadGo (dtb_u_u121 + 1)) dtb_u_u124) else (if (dtb_u_u127 = ")") then (if (dtb_u_u121 = 1) then (v_arrowAt dtb_u_u124) else ((v_piArrowAheadGo (dtb_u_u121 - 1)) dtb_u_u124)) else ((v_piArrowAheadGo dtb_u_u121) dtb_u_u124)))
  | _ -> ((v_piArrowAheadGo dtb_u_u121) dtb_u_u124)
)
  | _ -> failwith "DT: impossible branch"
)
  | B_dData_dList.C_List_Nil -> false
  | _ -> failwith "DT: impossible branch"
))

# 359 "Vuna/Compiler/Frontend/Parser/Support.vuna"
let v_piArrowAhead = (fun (dtb_u_u128 : t_PState) -> ((v_piArrowAheadGo 1) (dtb_u_u128).f_PState_toksOf))

# 373 "Vuna/Compiler/Frontend/Parser/Support.vuna"
let v_atKw = (fun (dtb_u_u129 : t_PState) (dtb_u_u130 : string) -> (let dtb_u_u131 = (v_peekTok dtb_u_u129) in (match dtb_u_u131 with
  | { Frontend_dLexer.f_PTok_ptokTok = dtb_u_u132; Frontend_dLexer.f_PTok_ptokPos = dtb_u_u133 } -> (match dtb_u_u132 with
  | Frontend_dLexer.C_Tok_TKw (dtb_u_u134) -> (dtb_u_u134 = dtb_u_u130)
  | _ -> false
)
  | _ -> failwith "DT: impossible branch"
)))

# 420 "Vuna/Compiler/Frontend/Parser/Support.vuna"
let v_closeDepth = (fun (dtb_u_u135 : int) -> (if (dtb_u_u135 > 0) then (dtb_u_u135 - 1) else 0))

# 411 "Vuna/Compiler/Frontend/Parser/Support.vuna"
let v_tokBracketStep = (fun (dtb_u_u136 : Frontend_dLexer.t_Tok) (dtb_u_u137 : int) -> (match dtb_u_u136 with
  | Frontend_dLexer.C_Tok_TSym (dtb_u_u138) -> (if (dtb_u_u138 = "(") then (B_dData_dMaybe.C_Maybe_Just ((dtb_u_u137 + 1))) else (if (dtb_u_u138 = "[") then (B_dData_dMaybe.C_Maybe_Just ((dtb_u_u137 + 1))) else (if (dtb_u_u138 = "{") then (B_dData_dMaybe.C_Maybe_Just ((dtb_u_u137 + 1))) else (if (dtb_u_u138 = ")") then (B_dData_dMaybe.C_Maybe_Just ((v_closeDepth dtb_u_u137))) else (if (dtb_u_u138 = "]") then (B_dData_dMaybe.C_Maybe_Just ((v_closeDepth dtb_u_u137))) else (if (dtb_u_u138 = "}") then (B_dData_dMaybe.C_Maybe_Just ((v_closeDepth dtb_u_u137))) else B_dData_dMaybe.C_Maybe_Nothing))))))
  | _ -> B_dData_dMaybe.C_Maybe_Nothing
))

# 394 "Vuna/Compiler/Frontend/Parser/Support.vuna"
let rec v_stmtScanGo = (fun (dtb_u_u139 : (Frontend_dLexer.t_PTok) -> bool B_dData_dMaybe.t_Maybe) (dtb_u_u140 : int) (dtb_u_u141 : int) (dtb_u_u142 : int) (dtb_u_u143 : Frontend_dLexer.t_PTok B_dData_dList.t_List) -> (match dtb_u_u143 with
  | B_dData_dList.C_List__x58__x58_ (dtb_u_u144, dtb_u_u145) -> (match dtb_u_u144 with
  | { Frontend_dLexer.f_PTok_ptokTok = dtb_u_u146; Frontend_dLexer.f_PTok_ptokPos = dtb_u_u147 } -> (if (if (if (dtb_u_u141 = 0) then ((Base_dSource.v_posLine dtb_u_u147) > dtb_u_u142) else false) then ((Base_dSource.v_posCol dtb_u_u147) <= dtb_u_u140) else false) then false else (match ((v_tokBracketStep dtb_u_u146) dtb_u_u141) with
  | B_dData_dMaybe.C_Maybe_Just (dtb_u_u148) -> (((((v_stmtScanGo dtb_u_u139) dtb_u_u140) dtb_u_u148) (Base_dSource.v_posLine dtb_u_u147)) dtb_u_u145)
  | B_dData_dMaybe.C_Maybe_Nothing -> (if (dtb_u_u141 > 0) then (((((v_stmtScanGo dtb_u_u139) dtb_u_u140) dtb_u_u141) (Base_dSource.v_posLine dtb_u_u147)) dtb_u_u145) else (match (dtb_u_u139 { Frontend_dLexer.f_PTok_ptokTok = dtb_u_u146; Frontend_dLexer.f_PTok_ptokPos = dtb_u_u147 }) with
  | B_dData_dMaybe.C_Maybe_Just (dtb_u_u149) -> dtb_u_u149
  | B_dData_dMaybe.C_Maybe_Nothing -> (((((v_stmtScanGo dtb_u_u139) dtb_u_u140) dtb_u_u141) (Base_dSource.v_posLine dtb_u_u147)) dtb_u_u145)
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
let v_scanDoStmtLevel = (fun (dtb_u_u150 : t_PState) (dtb_u_u151 : int) (dtb_u_u152 : (Frontend_dLexer.t_PTok) -> bool B_dData_dMaybe.t_Maybe) -> (((((v_stmtScanGo dtb_u_u152) dtb_u_u151) 0) (Base_dSource.v_posLine (v_peekPos dtb_u_u150))) (dtb_u_u150).f_PState_toksOf))

# 461 "Vuna/Compiler/Frontend/Parser/Support.vuna"
let v_upperFirst = (fun (dtb_u_u153 : string) -> (match (B_dData_dList.dtp_unpack dtb_u_u153) with
  | B_dData_dList.C_List__x58__x58_ (dtb_u_u154, dtb_u_u155) -> (if (dtb_u_u154 >= 65) then (dtb_u_u154 <= 90) else false)
  | B_dData_dList.C_List_Nil -> false
  | _ -> failwith "DT: impossible branch"
))

# 469 "Vuna/Compiler/Frontend/Parser/Support.vuna"
let v_underscoreCtorName = (fun (dtb_u_u156 : string) -> (match (B_dData_dList.dtp_unpack dtb_u_u156) with
  | B_dData_dList.C_List__x58__x58_ (dtb_u_u157, dtb_u_u158) -> (if (dtb_u_u157 = 95) then (match dtb_u_u158 with
  | B_dData_dList.C_List__x58__x58_ (dtb_u_u159, dtb_u_u160) -> (if (dtb_u_u159 >= 65) then (dtb_u_u159 <= 90) else false)
  | B_dData_dList.C_List_Nil -> false
  | _ -> failwith "DT: impossible branch"
) else false)
  | B_dData_dList.C_List_Nil -> false
  | _ -> failwith "DT: impossible branch"
))

# 481 "Vuna/Compiler/Frontend/Parser/Support.vuna"
let v_ctorPatternStart = (fun (dtb_u_u161 : string) -> (if (v_upperFirst dtb_u_u161) then true else (v_underscoreCtorName dtb_u_u161)))

# 518 "Vuna/Compiler/Frontend/Parser/Support.vuna"
let v_startsPatternAtom = (fun (dtb_u_u162 : t_PState) -> (let dtb_u_u163 = (v_peekTok dtb_u_u162) in (match dtb_u_u163 with
  | { Frontend_dLexer.f_PTok_ptokTok = dtb_u_u164; Frontend_dLexer.f_PTok_ptokPos = dtb_u_u165 } -> (match dtb_u_u164 with
  | Frontend_dLexer.C_Tok_TSym (dtb_u_u166) -> (if (dtb_u_u166 = "(") then true else (if (dtb_u_u166 = "[") then true else false))
  | Frontend_dLexer.C_Tok_TTmpl (dtb_u_u167, dtb_u_u168, dtb_u_u169) -> true
  | Frontend_dLexer.C_Tok_TStr (dtb_u_u170) -> true
  | Frontend_dLexer.C_Tok_TInt (dtb_u_u171) -> true
  | Frontend_dLexer.C_Tok_TIdent (dtb_u_u172) -> true
  | _ -> false
)
  | _ -> failwith "DT: impossible branch"
)))

# 531 "Vuna/Compiler/Frontend/Parser/Support.vuna"
let v_isSyntaxSym = (fun (dtb_u_u173 : string) -> (if (dtb_u_u173 = "=") then true else (if (dtb_u_u173 = ":") then true else (if (dtb_u_u173 = ",") then true else (if (dtb_u_u173 = ";") then true else (if (dtb_u_u173 = "|") then true else (if (dtb_u_u173 = "=>") then true else (if (dtb_u_u173 = "<-") then true else (if (dtb_u_u173 = "\\") then true else (if (dtb_u_u173 = ".") then true else (if (dtb_u_u173 = "..") then true else (if (dtb_u_u173 = "@") then true else (if (dtb_u_u173 = "(") then true else (if (dtb_u_u173 = ")") then true else (if (dtb_u_u173 = "[") then true else (if (dtb_u_u173 = "]") then true else (if (dtb_u_u173 = "{") then true else (if (dtb_u_u173 = "}") then true else false))))))))))))))))))

# 558 "Vuna/Compiler/Frontend/Parser/Support.vuna"
let v_isReservedValueName = (fun (dtb_u_u174 : string) -> (if (if (v_isSyntaxSym dtb_u_u174) then true else (dtb_u_u174 = "->")) then true else (dtb_u_u174 = "`")))

# 563 "Vuna/Compiler/Frontend/Parser/Support.vuna"
let v_closeParenNext = (fun (dtb_u_u175 : t_PState) -> (let dtb_u_u176 = ((v_peekTokAt dtb_u_u175) 1) in (match dtb_u_u176 with
  | B_dData_dMaybe.C_Maybe_Just (dtb_u_u177) -> (match dtb_u_u177 with
  | { Frontend_dLexer.f_PTok_ptokTok = dtb_u_u178; Frontend_dLexer.f_PTok_ptokPos = dtb_u_u179 } -> (match dtb_u_u178 with
  | Frontend_dLexer.C_Tok_TSym (dtb_u_u180) -> (if (dtb_u_u180 = ")") then true else false)
  | _ -> false
)
  | _ -> failwith "DT: impossible branch"
)
  | _ -> false
)))

# 586 "Vuna/Compiler/Frontend/Parser/Support.vuna"
let v_minusLiteralAt = (fun (dtb_u_u181 : Base_dSource.t_Pos) (dtb_u_u182 : t_PState) -> (let dtb_u_u183 = ((v_peekTokAt dtb_u_u182) 2) in (match dtb_u_u183 with
  | B_dData_dMaybe.C_Maybe_Just (dtb_u_u184) -> (match dtb_u_u184 with
  | { Frontend_dLexer.f_PTok_ptokTok = dtb_u_u185; Frontend_dLexer.f_PTok_ptokPos = dtb_u_u186 } -> (match dtb_u_u185 with
  | Frontend_dLexer.C_Tok_TFloat (dtb_u_u187) -> (if ((Base_dSource.v_posLine dtb_u_u186) = (Base_dSource.v_posLine dtb_u_u181)) then ((Base_dSource.v_posCol dtb_u_u186) = ((Base_dSource.v_posCol dtb_u_u181) + 1)) else false)
  | Frontend_dLexer.C_Tok_TInt (dtb_u_u188) -> (if ((Base_dSource.v_posLine dtb_u_u186) = (Base_dSource.v_posLine dtb_u_u181)) then ((Base_dSource.v_posCol dtb_u_u186) = ((Base_dSource.v_posCol dtb_u_u181) + 1)) else false)
  | _ -> false
)
  | _ -> failwith "DT: impossible branch"
)
  | _ -> false
)))

# 593 "Vuna/Compiler/Frontend/Parser/Support.vuna"
let rec v_countArrows = (fun (dtb_u_u189 : Frontend_dAst.t_Expr) -> (match dtb_u_u189 with
  | Frontend_dAst.C_Expr_EApp (dtb_u_u190, dtb_u_u191, dtb_u_u192) -> (match dtb_u_u190 with
  | Frontend_dAst.C_Expr_EVar (dtb_u_u193, dtb_u_u194) -> (if (dtb_u_u193 = "->") then (match dtb_u_u191 with
  | B_dData_dList.C_List__x58__x58_ (dtb_u_u195, dtb_u_u196) -> (match dtb_u_u196 with
  | B_dData_dList.C_List__x58__x58_ (dtb_u_u197, dtb_u_u198) -> (match dtb_u_u198 with
  | B_dData_dList.C_List_Nil -> (1 + (v_countArrows dtb_u_u197))
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

# 597 "Vuna/Compiler/Frontend/Parser/Support.vuna"
let v_terminatesExpression = (fun (dtb_u_u199 : Frontend_dLexer.t_PTok) -> (match dtb_u_u199 with
  | { Frontend_dLexer.f_PTok_ptokTok = dtb_u_u200; Frontend_dLexer.f_PTok_ptokPos = dtb_u_u201 } -> (match dtb_u_u200 with
  | Frontend_dLexer.C_Tok_TKw (dtb_u_u202) -> (if (dtb_u_u202 = "else") then true else (if (dtb_u_u202 = "in") then true else (if (dtb_u_u202 = "then") then true else false)))
  | Frontend_dLexer.C_Tok_TSym (dtb_u_u203) -> (if (dtb_u_u203 = ")") then true else (if (dtb_u_u203 = "]") then true else (if (dtb_u_u203 = ",") then true else false)))
  | _ -> false
)
  | _ -> failwith "DT: impossible branch"
))

# 606 "Vuna/Compiler/Frontend/Parser/Support.vuna"
let v_badCaseIndent = (fun (dtb_u_u204 : t_PState) (dtb_u_u205 : int) -> (if (v_isEof dtb_u_u204) then false else (match (v_peekPos dtb_u_u204) with
  | { Base_dSource.f_Pos_posLine = dtb_u_u206; Base_dSource.f_Pos_posCol = dtb_u_u207; Base_dSource.f_Pos_posOffset = dtb_u_u208; Base_dSource.f_Pos_posEndOffset = dtb_u_u209 } -> (if (dtb_u_u207 > dtb_u_u205) then (if (v_terminatesExpression (v_peekTok dtb_u_u204)) then false else true) else false)
  | _ -> failwith "DT: impossible branch"
)))

# 38 "Vuna/Compiler/Frontend/Parser/Support.vuna"
let v_fileOf = (fun (dtb_u_u210 : t_PState) -> (match dtb_u_u210 with
  | { f_PState_fileOf = dtb_u_u211; f_PState_sourceOf = dtb_u_u212; f_PState_toksOf = dtb_u_u213; f_PState_lastPos = dtb_u_u214; f_PState_toksLeft = dtb_u_u215; f_PState_pmodeOf = dtb_u_u216; f_PState_tokIndex = dtb_u_u217; f_PState_pendEvents = dtb_u_u218; f_PState_nextNodeId = dtb_u_u219; f_PState_openNodeId = dtb_u_u220; f_PState_subStream = dtb_u_u221; f_PState_backtickShapes = dtb_u_u222; f_PState_sectionShapes = dtb_u_u223; f_PState_interpMultis = dtb_u_u224; f_PState_templateHoles = dtb_u_u225; f_PState_eventMode = dtb_u_u226 } -> dtb_u_u211
  | _ -> failwith "DT: impossible branch"
))

# 218 "Vuna/Compiler/Frontend/Parser/Support.vuna"
let v_tokenSpan = (fun (dtb_u_u227 : t_PState) -> (let dtb_u_u228 = (v_peekPos dtb_u_u227) in (let dtb_u_u229 = ((Base_dSource.v_posEndOffset dtb_u_u228) - (Base_dSource.v_posOffset dtb_u_u228)) in { Base_dSource.f_Span_spanFile = (v_fileOf dtb_u_u227); Base_dSource.f_Span_spanStartLine = (Base_dSource.v_posLine dtb_u_u228); Base_dSource.f_Span_spanStartCol = (Base_dSource.v_posCol dtb_u_u228); Base_dSource.f_Span_spanEndLine = (Base_dSource.v_posLine dtb_u_u228); Base_dSource.f_Span_spanEndCol = ((Base_dSource.v_posCol dtb_u_u228) + dtb_u_u229); Base_dSource.f_Span_spanStartOffset = (Base_dSource.v_posOffset dtb_u_u228); Base_dSource.f_Span_spanEndOffset = (Base_dSource.v_posEndOffset dtb_u_u228) })))

# 504 "Vuna/Compiler/Frontend/Parser/Support.vuna"
let v_holeAtomAt = (fun (dtb_u_u230 : t_PState) -> (let dtb_u_u231 = (v_peekTok dtb_u_u230) in (match dtb_u_u231 with
  | { Frontend_dLexer.f_PTok_ptokTok = dtb_u_u232; Frontend_dLexer.f_PTok_ptokPos = dtb_u_u233 } -> (match dtb_u_u232 with
  | Frontend_dLexer.C_Tok_TSym (dtb_u_u234) -> (if (dtb_u_u234 = "?") then (let dtb_u_u235 = ((v_peekTokAt dtb_u_u230) 1) in (match dtb_u_u235 with
  | B_dData_dMaybe.C_Maybe_Just (dtb_u_u236) -> (match dtb_u_u236 with
  | { Frontend_dLexer.f_PTok_ptokTok = dtb_u_u237; Frontend_dLexer.f_PTok_ptokPos = dtb_u_u238 } -> (match dtb_u_u237 with
  | Frontend_dLexer.C_Tok_TIdent (dtb_u_u239) -> (if (if ((Base_dSource.v_posLine dtb_u_u238) = (Base_dSource.v_posLine dtb_u_u233)) then ((Base_dSource.v_posCol dtb_u_u238) = ((Base_dSource.v_posCol dtb_u_u233) + 1)) else false) then (B_dData_dMaybe.C_Maybe_Just ({ B_dData_dPair.f_Pair_first = ("?" ^ dtb_u_u239); B_dData_dPair.f_Pair_second = { Base_dSource.f_Span_spanFile = (v_fileOf dtb_u_u230); Base_dSource.f_Span_spanStartLine = (Base_dSource.v_posLine dtb_u_u233); Base_dSource.f_Span_spanStartCol = (Base_dSource.v_posCol dtb_u_u233); Base_dSource.f_Span_spanEndLine = (Base_dSource.v_posLine dtb_u_u238); Base_dSource.f_Span_spanEndCol = ((Base_dSource.v_posCol dtb_u_u238) + (String.length dtb_u_u239)); Base_dSource.f_Span_spanStartOffset = (Base_dSource.v_posOffset dtb_u_u233); Base_dSource.f_Span_spanEndOffset = ((Base_dSource.v_posOffset dtb_u_u238) + (String.length dtb_u_u239)) } })) else B_dData_dMaybe.C_Maybe_Nothing)
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

# 484 "Vuna/Compiler/Frontend/Parser/Support.vuna"
let v_startsAtom = (fun (dtb_u_u240 : t_PState) -> (let dtb_u_u241 = (v_peekTok dtb_u_u240) in (match dtb_u_u241 with
  | { Frontend_dLexer.f_PTok_ptokTok = dtb_u_u242; Frontend_dLexer.f_PTok_ptokPos = dtb_u_u243 } -> (match dtb_u_u242 with
  | Frontend_dLexer.C_Tok_TSym (dtb_u_u244) -> (if (dtb_u_u244 = "(") then true else (if (dtb_u_u244 = "[") then true else (if (dtb_u_u244 = "?") then (match (v_holeAtomAt dtb_u_u240) with
  | B_dData_dMaybe.C_Maybe_Just (dtb_u_u245) -> true
  | B_dData_dMaybe.C_Maybe_Nothing -> false
  | _ -> failwith "DT: impossible branch"
) else false)))
  | Frontend_dLexer.C_Tok_TKw (dtb_u_u246) -> (if (dtb_u_u246 = "Type") then true else false)
  | Frontend_dLexer.C_Tok_TTmpl (dtb_u_u247, dtb_u_u248, dtb_u_u249) -> true
  | Frontend_dLexer.C_Tok_TStr (dtb_u_u250) -> true
  | Frontend_dLexer.C_Tok_TFloat (dtb_u_u251) -> true
  | Frontend_dLexer.C_Tok_TInt (dtb_u_u252) -> true
  | Frontend_dLexer.C_Tok_TIdent (dtb_u_u253) -> true
  | _ -> false
)
  | _ -> failwith "DT: impossible branch"
)))

# 572 "Vuna/Compiler/Frontend/Parser/Support.vuna"
let v_sectionOpAt = (fun (dtb_u_u254 : t_PState) -> (let dtb_u_u255 = ((v_peekTokAt dtb_u_u254) 1) in (match dtb_u_u255 with
  | B_dData_dMaybe.C_Maybe_Just (dtb_u_u256) -> (match dtb_u_u256 with
  | { Frontend_dLexer.f_PTok_ptokTok = dtb_u_u257; Frontend_dLexer.f_PTok_ptokPos = dtb_u_u258 } -> (match dtb_u_u257 with
  | Frontend_dLexer.C_Tok_TSym (dtb_u_u259) -> (if (v_isReservedValueName dtb_u_u259) then B_dData_dMaybe.C_Maybe_Nothing else (if (dtb_u_u259 = "?") then (match (v_holeAtomAt (v_advance dtb_u_u254)) with
  | B_dData_dMaybe.C_Maybe_Just (dtb_u_u260) -> B_dData_dMaybe.C_Maybe_Nothing
  | B_dData_dMaybe.C_Maybe_Nothing -> (B_dData_dMaybe.C_Maybe_Just (dtb_u_u259))
  | _ -> failwith "DT: impossible branch"
) else (if (if (dtb_u_u259 = "-") then ((v_minusLiteralAt dtb_u_u258) dtb_u_u254) else false) then B_dData_dMaybe.C_Maybe_Nothing else (B_dData_dMaybe.C_Maybe_Just (dtb_u_u259)))))
  | _ -> B_dData_dMaybe.C_Maybe_Nothing
)
  | _ -> failwith "DT: impossible branch"
)
  | _ -> B_dData_dMaybe.C_Maybe_Nothing
)))

# 40 "Vuna/Compiler/Frontend/Parser/Support.vuna"
let v_sourceOf = (fun (dtb_u_u261 : t_PState) -> (match dtb_u_u261 with
  | { f_PState_fileOf = dtb_u_u262; f_PState_sourceOf = dtb_u_u263; f_PState_toksOf = dtb_u_u264; f_PState_lastPos = dtb_u_u265; f_PState_toksLeft = dtb_u_u266; f_PState_pmodeOf = dtb_u_u267; f_PState_tokIndex = dtb_u_u268; f_PState_pendEvents = dtb_u_u269; f_PState_nextNodeId = dtb_u_u270; f_PState_openNodeId = dtb_u_u271; f_PState_subStream = dtb_u_u272; f_PState_backtickShapes = dtb_u_u273; f_PState_sectionShapes = dtb_u_u274; f_PState_interpMultis = dtb_u_u275; f_PState_templateHoles = dtb_u_u276; f_PState_eventMode = dtb_u_u277 } -> dtb_u_u263
  | _ -> failwith "DT: impossible branch"
))

# 41 "Vuna/Compiler/Frontend/Parser/Support.vuna"
let v_toksOf = (fun (dtb_u_u278 : t_PState) -> (match dtb_u_u278 with
  | { f_PState_fileOf = dtb_u_u279; f_PState_sourceOf = dtb_u_u280; f_PState_toksOf = dtb_u_u281; f_PState_lastPos = dtb_u_u282; f_PState_toksLeft = dtb_u_u283; f_PState_pmodeOf = dtb_u_u284; f_PState_tokIndex = dtb_u_u285; f_PState_pendEvents = dtb_u_u286; f_PState_nextNodeId = dtb_u_u287; f_PState_openNodeId = dtb_u_u288; f_PState_subStream = dtb_u_u289; f_PState_backtickShapes = dtb_u_u290; f_PState_sectionShapes = dtb_u_u291; f_PState_interpMultis = dtb_u_u292; f_PState_templateHoles = dtb_u_u293; f_PState_eventMode = dtb_u_u294 } -> dtb_u_u281
  | _ -> failwith "DT: impossible branch"
))

# 42 "Vuna/Compiler/Frontend/Parser/Support.vuna"
let v_lastPos = (fun (dtb_u_u295 : t_PState) -> (match dtb_u_u295 with
  | { f_PState_fileOf = dtb_u_u296; f_PState_sourceOf = dtb_u_u297; f_PState_toksOf = dtb_u_u298; f_PState_lastPos = dtb_u_u299; f_PState_toksLeft = dtb_u_u300; f_PState_pmodeOf = dtb_u_u301; f_PState_tokIndex = dtb_u_u302; f_PState_pendEvents = dtb_u_u303; f_PState_nextNodeId = dtb_u_u304; f_PState_openNodeId = dtb_u_u305; f_PState_subStream = dtb_u_u306; f_PState_backtickShapes = dtb_u_u307; f_PState_sectionShapes = dtb_u_u308; f_PState_interpMultis = dtb_u_u309; f_PState_templateHoles = dtb_u_u310; f_PState_eventMode = dtb_u_u311 } -> dtb_u_u299
  | _ -> failwith "DT: impossible branch"
))

# 189 "Vuna/Compiler/Frontend/Parser/Support.vuna"
let v_spanOf = (fun (dtb_u_u312 : t_PState) (dtb_u_u313 : t_PState) -> (let dtb_u_u314 = (v_lastPos dtb_u_u313) in { Base_dSource.f_Span_spanFile = (v_fileOf dtb_u_u312); Base_dSource.f_Span_spanStartLine = (Base_dSource.v_posLine (v_peekPos dtb_u_u312)); Base_dSource.f_Span_spanStartCol = (Base_dSource.v_posCol (v_peekPos dtb_u_u312)); Base_dSource.f_Span_spanEndLine = (Base_dSource.v_posLine dtb_u_u314); Base_dSource.f_Span_spanEndCol = (v_lastEndCol dtb_u_u314); Base_dSource.f_Span_spanStartOffset = (Base_dSource.v_posOffset (v_peekPos dtb_u_u312)); Base_dSource.f_Span_spanEndOffset = (Base_dSource.v_posEndOffset dtb_u_u314) }))

# 203 "Vuna/Compiler/Frontend/Parser/Support.vuna"
let v_spanFromStart = (fun (dtb_u_u315 : string) (dtb_u_u316 : Base_dSource.t_Pos) (dtb_u_u317 : t_PState) -> (let dtb_u_u318 = (v_lastPos dtb_u_u317) in { Base_dSource.f_Span_spanFile = dtb_u_u315; Base_dSource.f_Span_spanStartLine = (Base_dSource.v_posLine dtb_u_u316); Base_dSource.f_Span_spanStartCol = (Base_dSource.v_posCol dtb_u_u316); Base_dSource.f_Span_spanEndLine = (Base_dSource.v_posLine dtb_u_u318); Base_dSource.f_Span_spanEndCol = (v_lastEndCol dtb_u_u318); Base_dSource.f_Span_spanStartOffset = (Base_dSource.v_posOffset dtb_u_u316); Base_dSource.f_Span_spanEndOffset = (Base_dSource.v_posEndOffset dtb_u_u318) }))

# 243 "Vuna/Compiler/Frontend/Parser/Support.vuna"
let v_tokSpan = (fun (dtb_u_u319 : t_PState) -> (let dtb_u_u320 = (v_peekTok dtb_u_u319) in (match dtb_u_u320 with
  | { Frontend_dLexer.f_PTok_ptokTok = dtb_u_u321; Frontend_dLexer.f_PTok_ptokPos = dtb_u_u322 } -> (match dtb_u_u321 with
  | Frontend_dLexer.C_Tok_TEof -> (let dtb_u_u323 = (v_lastPos dtb_u_u319) in { Base_dSource.f_Span_spanFile = (v_fileOf dtb_u_u319); Base_dSource.f_Span_spanStartLine = (Base_dSource.v_posLine dtb_u_u323); Base_dSource.f_Span_spanStartCol = (Base_dSource.v_posCol dtb_u_u323); Base_dSource.f_Span_spanEndLine = (Base_dSource.v_posLine dtb_u_u323); Base_dSource.f_Span_spanEndCol = (Base_dSource.v_posCol dtb_u_u323); Base_dSource.f_Span_spanStartOffset = (Base_dSource.v_posOffset dtb_u_u323); Base_dSource.f_Span_spanEndOffset = (Base_dSource.v_posOffset dtb_u_u323) })
  | _ -> { Base_dSource.f_Span_spanFile = (v_fileOf dtb_u_u319); Base_dSource.f_Span_spanStartLine = (Base_dSource.v_posLine dtb_u_u322); Base_dSource.f_Span_spanStartCol = (Base_dSource.v_posCol dtb_u_u322); Base_dSource.f_Span_spanEndLine = (Base_dSource.v_posLine dtb_u_u322); Base_dSource.f_Span_spanEndCol = (Base_dSource.v_posCol dtb_u_u322); Base_dSource.f_Span_spanStartOffset = (Base_dSource.v_posOffset dtb_u_u322); Base_dSource.f_Span_spanEndOffset = (Base_dSource.v_posOffset dtb_u_u322) }
)
  | _ -> failwith "DT: impossible branch"
)))

# 379 "Vuna/Compiler/Frontend/Parser/Support.vuna"
let v_canContinue = (fun (dtb_u_u324 : t_PState) (dtb_u_u325 : int) -> (match (v_peekPos dtb_u_u324) with
  | { Base_dSource.f_Pos_posLine = dtb_u_u326; Base_dSource.f_Pos_posCol = dtb_u_u327; Base_dSource.f_Pos_posOffset = dtb_u_u328; Base_dSource.f_Pos_posEndOffset = dtb_u_u329 } -> (match (v_lastPos dtb_u_u324) with
  | { Base_dSource.f_Pos_posLine = dtb_u_u330; Base_dSource.f_Pos_posCol = dtb_u_u331; Base_dSource.f_Pos_posOffset = dtb_u_u332; Base_dSource.f_Pos_posEndOffset = dtb_u_u333 } -> (if (dtb_u_u326 = dtb_u_u330) then true else (dtb_u_u327 > dtb_u_u325))
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
))

# 425 "Vuna/Compiler/Frontend/Parser/Support.vuna"
let v_expectSym = (fun (dtb_u_u334 : t_PState) (dtb_u_u335 : string) -> (let dtb_u_u336 = (v_peekTok dtb_u_u334) in (match dtb_u_u336 with
  | { Frontend_dLexer.f_PTok_ptokTok = dtb_u_u337; Frontend_dLexer.f_PTok_ptokPos = dtb_u_u338 } -> (match dtb_u_u337 with
  | Frontend_dLexer.C_Tok_TSym (dtb_u_u339) -> (if (dtb_u_u339 = dtb_u_u335) then (Base_dDiag.C_Check_OkC ((v_advance dtb_u_u334))) else (((Base_dDiagnostics_dFrontend.v_psErr1At (v_tokSpan dtb_u_u334)) (Base_dDiagnostics_dFrontend.C_PsDiag_ExpectedToken (dtb_u_u335))) dtb_u_u335))
  | _ -> (((Base_dDiagnostics_dFrontend.v_psErr1At (v_tokSpan dtb_u_u334)) (Base_dDiagnostics_dFrontend.C_PsDiag_ExpectedToken (dtb_u_u335))) dtb_u_u335)
)
  | _ -> failwith "DT: impossible branch"
)))

# 432 "Vuna/Compiler/Frontend/Parser/Support.vuna"
let v_expectKw = (fun (dtb_u_u340 : t_PState) (dtb_u_u341 : string) -> (let dtb_u_u342 = (v_peekTok dtb_u_u340) in (match dtb_u_u342 with
  | { Frontend_dLexer.f_PTok_ptokTok = dtb_u_u343; Frontend_dLexer.f_PTok_ptokPos = dtb_u_u344 } -> (match dtb_u_u343 with
  | Frontend_dLexer.C_Tok_TKw (dtb_u_u345) -> (if (dtb_u_u345 = dtb_u_u341) then (Base_dDiag.C_Check_OkC ((v_advance dtb_u_u340))) else (((Base_dDiagnostics_dFrontend.v_psErr1At (v_tokSpan dtb_u_u340)) (Base_dDiagnostics_dFrontend.C_PsDiag_ExpectedToken (dtb_u_u341))) dtb_u_u341))
  | _ -> (((Base_dDiagnostics_dFrontend.v_psErr1At (v_tokSpan dtb_u_u340)) (Base_dDiagnostics_dFrontend.C_PsDiag_ExpectedToken (dtb_u_u341))) dtb_u_u341)
)
  | _ -> failwith "DT: impossible branch"
)))

# 438 "Vuna/Compiler/Frontend/Parser/Support.vuna"
let v_expectIdent = (fun (dtb_u_u346 : t_PState) -> (let dtb_u_u347 = (v_peekTok dtb_u_u346) in (match dtb_u_u347 with
  | { Frontend_dLexer.f_PTok_ptokTok = dtb_u_u348; Frontend_dLexer.f_PTok_ptokPos = dtb_u_u349 } -> (match dtb_u_u348 with
  | Frontend_dLexer.C_Tok_TIdent (dtb_u_u350) -> (Base_dDiag.C_Check_OkC ({ B_dData_dPair.f_Pair_first = dtb_u_u350; B_dData_dPair.f_Pair_second = (v_advance dtb_u_u346) }))
  | _ -> ((Base_dDiagnostics_dFrontend.v_psErr0At (v_tokSpan dtb_u_u346)) Base_dDiagnostics_dFrontend.C_PsDiag_ExpectedIdentifier)
)
  | _ -> failwith "DT: impossible branch"
)))

# 446 "Vuna/Compiler/Frontend/Parser/Support.vuna"
let v_expectValueName = (fun (dtb_u_u351 : t_PState) -> (let dtb_u_u352 = (v_peekTok dtb_u_u351) in (match dtb_u_u352 with
  | { Frontend_dLexer.f_PTok_ptokTok = dtb_u_u353; Frontend_dLexer.f_PTok_ptokPos = dtb_u_u354 } -> (match dtb_u_u353 with
  | Frontend_dLexer.C_Tok_TSym (dtb_u_u355) -> (if (v_isReservedValueName dtb_u_u355) then (((Base_dDiagnostics_dFrontend.v_psErr1At (v_tokSpan dtb_u_u351)) (Base_dDiagnostics_dFrontend.C_PsDiag_ExpectedToken ("value name"))) "value name") else (Base_dDiag.C_Check_OkC ({ B_dData_dPair.f_Pair_first = dtb_u_u355; B_dData_dPair.f_Pair_second = (v_advance dtb_u_u351) })))
  | Frontend_dLexer.C_Tok_TIdent (dtb_u_u356) -> (if (v_isReservedValueName dtb_u_u356) then (((Base_dDiagnostics_dFrontend.v_psErr1At (v_tokSpan dtb_u_u351)) (Base_dDiagnostics_dFrontend.C_PsDiag_ExpectedToken ("value name"))) "value name") else (Base_dDiag.C_Check_OkC ({ B_dData_dPair.f_Pair_first = dtb_u_u356; B_dData_dPair.f_Pair_second = (v_advance dtb_u_u351) })))
  | _ -> ((Base_dDiagnostics_dFrontend.v_psErr0At (v_tokSpan dtb_u_u351)) Base_dDiagnostics_dFrontend.C_PsDiag_ExpectedIdentifier)
)
  | _ -> failwith "DT: impossible branch"
)))

# 43 "Vuna/Compiler/Frontend/Parser/Support.vuna"
let v_toksLeft = (fun (dtb_u_u357 : t_PState) -> (match dtb_u_u357 with
  | { f_PState_fileOf = dtb_u_u358; f_PState_sourceOf = dtb_u_u359; f_PState_toksOf = dtb_u_u360; f_PState_lastPos = dtb_u_u361; f_PState_toksLeft = dtb_u_u362; f_PState_pmodeOf = dtb_u_u363; f_PState_tokIndex = dtb_u_u364; f_PState_pendEvents = dtb_u_u365; f_PState_nextNodeId = dtb_u_u366; f_PState_openNodeId = dtb_u_u367; f_PState_subStream = dtb_u_u368; f_PState_backtickShapes = dtb_u_u369; f_PState_sectionShapes = dtb_u_u370; f_PState_interpMultis = dtb_u_u371; f_PState_templateHoles = dtb_u_u372; f_PState_eventMode = dtb_u_u373 } -> dtb_u_u362
  | _ -> failwith "DT: impossible branch"
))

# 44 "Vuna/Compiler/Frontend/Parser/Support.vuna"
let v_pmodeOf = (fun (dtb_u_u374 : t_PState) -> (match dtb_u_u374 with
  | { f_PState_fileOf = dtb_u_u375; f_PState_sourceOf = dtb_u_u376; f_PState_toksOf = dtb_u_u377; f_PState_lastPos = dtb_u_u378; f_PState_toksLeft = dtb_u_u379; f_PState_pmodeOf = dtb_u_u380; f_PState_tokIndex = dtb_u_u381; f_PState_pendEvents = dtb_u_u382; f_PState_nextNodeId = dtb_u_u383; f_PState_openNodeId = dtb_u_u384; f_PState_subStream = dtb_u_u385; f_PState_backtickShapes = dtb_u_u386; f_PState_sectionShapes = dtb_u_u387; f_PState_interpMultis = dtb_u_u388; f_PState_templateHoles = dtb_u_u389; f_PState_eventMode = dtb_u_u390 } -> dtb_u_u380
  | _ -> failwith "DT: impossible branch"
))

# 45 "Vuna/Compiler/Frontend/Parser/Support.vuna"
let v_tokIndex = (fun (dtb_u_u391 : t_PState) -> (match dtb_u_u391 with
  | { f_PState_fileOf = dtb_u_u392; f_PState_sourceOf = dtb_u_u393; f_PState_toksOf = dtb_u_u394; f_PState_lastPos = dtb_u_u395; f_PState_toksLeft = dtb_u_u396; f_PState_pmodeOf = dtb_u_u397; f_PState_tokIndex = dtb_u_u398; f_PState_pendEvents = dtb_u_u399; f_PState_nextNodeId = dtb_u_u400; f_PState_openNodeId = dtb_u_u401; f_PState_subStream = dtb_u_u402; f_PState_backtickShapes = dtb_u_u403; f_PState_sectionShapes = dtb_u_u404; f_PState_interpMultis = dtb_u_u405; f_PState_templateHoles = dtb_u_u406; f_PState_eventMode = dtb_u_u407 } -> dtb_u_u398
  | _ -> failwith "DT: impossible branch"
))

# 46 "Vuna/Compiler/Frontend/Parser/Support.vuna"
let v_pendEvents = (fun (dtb_u_u408 : t_PState) -> (match dtb_u_u408 with
  | { f_PState_fileOf = dtb_u_u409; f_PState_sourceOf = dtb_u_u410; f_PState_toksOf = dtb_u_u411; f_PState_lastPos = dtb_u_u412; f_PState_toksLeft = dtb_u_u413; f_PState_pmodeOf = dtb_u_u414; f_PState_tokIndex = dtb_u_u415; f_PState_pendEvents = dtb_u_u416; f_PState_nextNodeId = dtb_u_u417; f_PState_openNodeId = dtb_u_u418; f_PState_subStream = dtb_u_u419; f_PState_backtickShapes = dtb_u_u420; f_PState_sectionShapes = dtb_u_u421; f_PState_interpMultis = dtb_u_u422; f_PState_templateHoles = dtb_u_u423; f_PState_eventMode = dtb_u_u424 } -> dtb_u_u416
  | _ -> failwith "DT: impossible branch"
))

# 49 "Vuna/Compiler/Frontend/Parser/Support.vuna"
let v_nextNodeId = (fun (dtb_u_u425 : t_PState) -> (match dtb_u_u425 with
  | { f_PState_fileOf = dtb_u_u426; f_PState_sourceOf = dtb_u_u427; f_PState_toksOf = dtb_u_u428; f_PState_lastPos = dtb_u_u429; f_PState_toksLeft = dtb_u_u430; f_PState_pmodeOf = dtb_u_u431; f_PState_tokIndex = dtb_u_u432; f_PState_pendEvents = dtb_u_u433; f_PState_nextNodeId = dtb_u_u434; f_PState_openNodeId = dtb_u_u435; f_PState_subStream = dtb_u_u436; f_PState_backtickShapes = dtb_u_u437; f_PState_sectionShapes = dtb_u_u438; f_PState_interpMultis = dtb_u_u439; f_PState_templateHoles = dtb_u_u440; f_PState_eventMode = dtb_u_u441 } -> dtb_u_u434
  | _ -> failwith "DT: impossible branch"
))

# 52 "Vuna/Compiler/Frontend/Parser/Support.vuna"
let v_openNodeId = (fun (dtb_u_u442 : t_PState) -> (match dtb_u_u442 with
  | { f_PState_fileOf = dtb_u_u443; f_PState_sourceOf = dtb_u_u444; f_PState_toksOf = dtb_u_u445; f_PState_lastPos = dtb_u_u446; f_PState_toksLeft = dtb_u_u447; f_PState_pmodeOf = dtb_u_u448; f_PState_tokIndex = dtb_u_u449; f_PState_pendEvents = dtb_u_u450; f_PState_nextNodeId = dtb_u_u451; f_PState_openNodeId = dtb_u_u452; f_PState_subStream = dtb_u_u453; f_PState_backtickShapes = dtb_u_u454; f_PState_sectionShapes = dtb_u_u455; f_PState_interpMultis = dtb_u_u456; f_PState_templateHoles = dtb_u_u457; f_PState_eventMode = dtb_u_u458 } -> dtb_u_u452
  | _ -> failwith "DT: impossible branch"
))

# 57 "Vuna/Compiler/Frontend/Parser/Support.vuna"
let v_subStream = (fun (dtb_u_u459 : t_PState) -> (match dtb_u_u459 with
  | { f_PState_fileOf = dtb_u_u460; f_PState_sourceOf = dtb_u_u461; f_PState_toksOf = dtb_u_u462; f_PState_lastPos = dtb_u_u463; f_PState_toksLeft = dtb_u_u464; f_PState_pmodeOf = dtb_u_u465; f_PState_tokIndex = dtb_u_u466; f_PState_pendEvents = dtb_u_u467; f_PState_nextNodeId = dtb_u_u468; f_PState_openNodeId = dtb_u_u469; f_PState_subStream = dtb_u_u470; f_PState_backtickShapes = dtb_u_u471; f_PState_sectionShapes = dtb_u_u472; f_PState_interpMultis = dtb_u_u473; f_PState_templateHoles = dtb_u_u474; f_PState_eventMode = dtb_u_u475 } -> dtb_u_u470
  | _ -> failwith "DT: impossible branch"
))

# 60 "Vuna/Compiler/Frontend/Parser/Support.vuna"
let v_backtickShapes = (fun (dtb_u_u476 : t_PState) -> (match dtb_u_u476 with
  | { f_PState_fileOf = dtb_u_u477; f_PState_sourceOf = dtb_u_u478; f_PState_toksOf = dtb_u_u479; f_PState_lastPos = dtb_u_u480; f_PState_toksLeft = dtb_u_u481; f_PState_pmodeOf = dtb_u_u482; f_PState_tokIndex = dtb_u_u483; f_PState_pendEvents = dtb_u_u484; f_PState_nextNodeId = dtb_u_u485; f_PState_openNodeId = dtb_u_u486; f_PState_subStream = dtb_u_u487; f_PState_backtickShapes = dtb_u_u488; f_PState_sectionShapes = dtb_u_u489; f_PState_interpMultis = dtb_u_u490; f_PState_templateHoles = dtb_u_u491; f_PState_eventMode = dtb_u_u492 } -> dtb_u_u488
  | _ -> failwith "DT: impossible branch"
))

# 62 "Vuna/Compiler/Frontend/Parser/Support.vuna"
let v_sectionShapes = (fun (dtb_u_u493 : t_PState) -> (match dtb_u_u493 with
  | { f_PState_fileOf = dtb_u_u494; f_PState_sourceOf = dtb_u_u495; f_PState_toksOf = dtb_u_u496; f_PState_lastPos = dtb_u_u497; f_PState_toksLeft = dtb_u_u498; f_PState_pmodeOf = dtb_u_u499; f_PState_tokIndex = dtb_u_u500; f_PState_pendEvents = dtb_u_u501; f_PState_nextNodeId = dtb_u_u502; f_PState_openNodeId = dtb_u_u503; f_PState_subStream = dtb_u_u504; f_PState_backtickShapes = dtb_u_u505; f_PState_sectionShapes = dtb_u_u506; f_PState_interpMultis = dtb_u_u507; f_PState_templateHoles = dtb_u_u508; f_PState_eventMode = dtb_u_u509 } -> dtb_u_u506
  | _ -> failwith "DT: impossible branch"
))

# 64 "Vuna/Compiler/Frontend/Parser/Support.vuna"
let v_interpMultis = (fun (dtb_u_u510 : t_PState) -> (match dtb_u_u510 with
  | { f_PState_fileOf = dtb_u_u511; f_PState_sourceOf = dtb_u_u512; f_PState_toksOf = dtb_u_u513; f_PState_lastPos = dtb_u_u514; f_PState_toksLeft = dtb_u_u515; f_PState_pmodeOf = dtb_u_u516; f_PState_tokIndex = dtb_u_u517; f_PState_pendEvents = dtb_u_u518; f_PState_nextNodeId = dtb_u_u519; f_PState_openNodeId = dtb_u_u520; f_PState_subStream = dtb_u_u521; f_PState_backtickShapes = dtb_u_u522; f_PState_sectionShapes = dtb_u_u523; f_PState_interpMultis = dtb_u_u524; f_PState_templateHoles = dtb_u_u525; f_PState_eventMode = dtb_u_u526 } -> dtb_u_u524
  | _ -> failwith "DT: impossible branch"
))

# 69 "Vuna/Compiler/Frontend/Parser/Support.vuna"
let v_templateHoles = (fun (dtb_u_u527 : t_PState) -> (match dtb_u_u527 with
  | { f_PState_fileOf = dtb_u_u528; f_PState_sourceOf = dtb_u_u529; f_PState_toksOf = dtb_u_u530; f_PState_lastPos = dtb_u_u531; f_PState_toksLeft = dtb_u_u532; f_PState_pmodeOf = dtb_u_u533; f_PState_tokIndex = dtb_u_u534; f_PState_pendEvents = dtb_u_u535; f_PState_nextNodeId = dtb_u_u536; f_PState_openNodeId = dtb_u_u537; f_PState_subStream = dtb_u_u538; f_PState_backtickShapes = dtb_u_u539; f_PState_sectionShapes = dtb_u_u540; f_PState_interpMultis = dtb_u_u541; f_PState_templateHoles = dtb_u_u542; f_PState_eventMode = dtb_u_u543 } -> dtb_u_u542
  | _ -> failwith "DT: impossible branch"
))

# 71 "Vuna/Compiler/Frontend/Parser/Support.vuna"
let v_eventMode = (fun (dtb_u_u544 : t_PState) -> (match dtb_u_u544 with
  | { f_PState_fileOf = dtb_u_u545; f_PState_sourceOf = dtb_u_u546; f_PState_toksOf = dtb_u_u547; f_PState_lastPos = dtb_u_u548; f_PState_toksLeft = dtb_u_u549; f_PState_pmodeOf = dtb_u_u550; f_PState_tokIndex = dtb_u_u551; f_PState_pendEvents = dtb_u_u552; f_PState_nextNodeId = dtb_u_u553; f_PState_openNodeId = dtb_u_u554; f_PState_subStream = dtb_u_u555; f_PState_backtickShapes = dtb_u_u556; f_PState_sectionShapes = dtb_u_u557; f_PState_interpMultis = dtb_u_u558; f_PState_templateHoles = dtb_u_u559; f_PState_eventMode = dtb_u_u560 } -> dtb_u_u560
  | _ -> failwith "DT: impossible branch"
))
