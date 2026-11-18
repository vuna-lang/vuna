open Vuna_runtime
type t_Vuna_dCompiler_dFrontend_dParser_dSupport_dParseMode = C_Vuna_dCompiler_dFrontend_dParser_dSupport_dParseMode_PmStrict | C_Vuna_dCompiler_dFrontend_dParser_dSupport_dParseMode_PmTool
and t_Vuna_dCompiler_dFrontend_dParser_dSupport_dPState = { f_Vuna_dCompiler_dFrontend_dParser_dSupport_dPState_fileOf : string; f_Vuna_dCompiler_dFrontend_dParser_dSupport_dPState_toksOf : Vuna_dCompiler_dFrontend_dLexer.t_Vuna_dCompiler_dFrontend_dLexer_dPTok Base_dData_dList.t_Base_dData_dList_dList; f_Vuna_dCompiler_dFrontend_dParser_dSupport_dPState_lastPos : Vuna_dCompiler_dBase_dSource.t_Vuna_dCompiler_dBase_dSource_dPos; f_Vuna_dCompiler_dFrontend_dParser_dSupport_dPState_toksLeft : int; f_Vuna_dCompiler_dFrontend_dParser_dSupport_dPState_pmodeOf : t_Vuna_dCompiler_dFrontend_dParser_dSupport_dParseMode }

# 32 "Vuna/Compiler/Frontend/Parser/Support.vuna"
let v_Vuna_dCompiler_dFrontend_dParser_dSupport_dfileOf = (fun mc0 -> (match mc0 with
  | { f_Vuna_dCompiler_dFrontend_dParser_dSupport_dPState_fileOf = dtb__0; f_Vuna_dCompiler_dFrontend_dParser_dSupport_dPState_toksOf = dtb__1; f_Vuna_dCompiler_dFrontend_dParser_dSupport_dPState_lastPos = dtb__2; f_Vuna_dCompiler_dFrontend_dParser_dSupport_dPState_toksLeft = dtb__3; f_Vuna_dCompiler_dFrontend_dParser_dSupport_dPState_pmodeOf = dtb__4 } -> dtb__0
  | _ -> failwith "DT: impossible branch"
))

# 36 "Vuna/Compiler/Frontend/Parser/Support.vuna"
let v_Vuna_dCompiler_dFrontend_dParser_dSupport_dpmodeOf = (fun mc0 -> (match mc0 with
  | { f_Vuna_dCompiler_dFrontend_dParser_dSupport_dPState_fileOf = dtb__5; f_Vuna_dCompiler_dFrontend_dParser_dSupport_dPState_toksOf = dtb__6; f_Vuna_dCompiler_dFrontend_dParser_dSupport_dPState_lastPos = dtb__7; f_Vuna_dCompiler_dFrontend_dParser_dSupport_dPState_toksLeft = dtb__8; f_Vuna_dCompiler_dFrontend_dParser_dSupport_dPState_pmodeOf = dtb__9 } -> dtb__9
  | _ -> failwith "DT: impossible branch"
))

# 40 "Vuna/Compiler/Frontend/Parser/Support.vuna"
let v_Vuna_dCompiler_dFrontend_dParser_dSupport_dmkState = (fun file toks mode -> { f_Vuna_dCompiler_dFrontend_dParser_dSupport_dPState_fileOf = file; f_Vuna_dCompiler_dFrontend_dParser_dSupport_dPState_toksOf = toks; f_Vuna_dCompiler_dFrontend_dParser_dSupport_dPState_lastPos = { Vuna_dCompiler_dBase_dSource.f_Vuna_dCompiler_dBase_dSource_dPos_posLine = 1; Vuna_dCompiler_dBase_dSource.f_Vuna_dCompiler_dBase_dSource_dPos_posCol = 0; Vuna_dCompiler_dBase_dSource.f_Vuna_dCompiler_dBase_dSource_dPos_posOffset = 0; Vuna_dCompiler_dBase_dSource.f_Vuna_dCompiler_dBase_dSource_dPos_posEndOffset = 0 }; f_Vuna_dCompiler_dFrontend_dParser_dSupport_dPState_toksLeft = (Base_dData_dList.v_Base_dData_dList_dlength toks); f_Vuna_dCompiler_dFrontend_dParser_dSupport_dPState_pmodeOf = mode })

# 44 "Vuna/Compiler/Frontend/Parser/Support.vuna"
let v_Vuna_dCompiler_dFrontend_dParser_dSupport_dmkStateAt = (fun file toks last count mode -> { f_Vuna_dCompiler_dFrontend_dParser_dSupport_dPState_fileOf = file; f_Vuna_dCompiler_dFrontend_dParser_dSupport_dPState_toksOf = toks; f_Vuna_dCompiler_dFrontend_dParser_dSupport_dPState_lastPos = last; f_Vuna_dCompiler_dFrontend_dParser_dSupport_dPState_toksLeft = count; f_Vuna_dCompiler_dFrontend_dParser_dSupport_dPState_pmodeOf = mode })

# 63 "Vuna/Compiler/Frontend/Parser/Support.vuna"
let v_Vuna_dCompiler_dFrontend_dParser_dSupport_dpeekTok = (fun mc0 -> (match mc0 with
  | { f_Vuna_dCompiler_dFrontend_dParser_dSupport_dPState_fileOf = dtb__10; f_Vuna_dCompiler_dFrontend_dParser_dSupport_dPState_toksOf = dtb__11; f_Vuna_dCompiler_dFrontend_dParser_dSupport_dPState_lastPos = dtb__12; f_Vuna_dCompiler_dFrontend_dParser_dSupport_dPState_toksLeft = dtb__13; f_Vuna_dCompiler_dFrontend_dParser_dSupport_dPState_pmodeOf = dtb__14 } -> (match dtb__11 with
  | Base_dData_dList.C_Base_dData_dList_dList_Nil -> { Vuna_dCompiler_dFrontend_dLexer.f_Vuna_dCompiler_dFrontend_dLexer_dPTok_ptokTok = Vuna_dCompiler_dFrontend_dLexer.C_Vuna_dCompiler_dFrontend_dLexer_dTok_TEof; Vuna_dCompiler_dFrontend_dLexer.f_Vuna_dCompiler_dFrontend_dLexer_dPTok_ptokPos = { Vuna_dCompiler_dBase_dSource.f_Vuna_dCompiler_dBase_dSource_dPos_posLine = 1; Vuna_dCompiler_dBase_dSource.f_Vuna_dCompiler_dBase_dSource_dPos_posCol = 1; Vuna_dCompiler_dBase_dSource.f_Vuna_dCompiler_dBase_dSource_dPos_posOffset = 0; Vuna_dCompiler_dBase_dSource.f_Vuna_dCompiler_dBase_dSource_dPos_posEndOffset = 0 } }
  | Base_dData_dList.C_Base_dData_dList_dList__x58__x58_ (dtb__15, dtb__16) -> dtb__15
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
))

# 67 "Vuna/Compiler/Frontend/Parser/Support.vuna"
let v_Vuna_dCompiler_dFrontend_dParser_dSupport_dpeekPos = (fun st -> ((v_Vuna_dCompiler_dFrontend_dParser_dSupport_dpeekTok st)).Vuna_dCompiler_dFrontend_dLexer.f_Vuna_dCompiler_dFrontend_dLexer_dPTok_ptokPos)

# 55 "Vuna/Compiler/Frontend/Parser/Support.vuna"
let v_Vuna_dCompiler_dFrontend_dParser_dSupport_dtokenSpan = (fun st -> ((fun p -> ((fun len -> { Vuna_dCompiler_dBase_dSource.f_Vuna_dCompiler_dBase_dSource_dSpan_spanFile = (v_Vuna_dCompiler_dFrontend_dParser_dSupport_dfileOf st); Vuna_dCompiler_dBase_dSource.f_Vuna_dCompiler_dBase_dSource_dSpan_spanStartLine = (Vuna_dCompiler_dBase_dSource.v_Vuna_dCompiler_dBase_dSource_dposLine p); Vuna_dCompiler_dBase_dSource.f_Vuna_dCompiler_dBase_dSource_dSpan_spanStartCol = (Vuna_dCompiler_dBase_dSource.v_Vuna_dCompiler_dBase_dSource_dposCol p); Vuna_dCompiler_dBase_dSource.f_Vuna_dCompiler_dBase_dSource_dSpan_spanEndLine = (Vuna_dCompiler_dBase_dSource.v_Vuna_dCompiler_dBase_dSource_dposLine p); Vuna_dCompiler_dBase_dSource.f_Vuna_dCompiler_dBase_dSource_dSpan_spanEndCol = ((Vuna_dCompiler_dBase_dSource.v_Vuna_dCompiler_dBase_dSource_dposCol p) + len); Vuna_dCompiler_dBase_dSource.f_Vuna_dCompiler_dBase_dSource_dSpan_spanStartOffset = (Vuna_dCompiler_dBase_dSource.v_Vuna_dCompiler_dBase_dSource_dposOffset p); Vuna_dCompiler_dBase_dSource.f_Vuna_dCompiler_dBase_dSource_dSpan_spanEndOffset = (Vuna_dCompiler_dBase_dSource.v_Vuna_dCompiler_dBase_dSource_dposEndOffset p) }) ((Vuna_dCompiler_dBase_dSource.v_Vuna_dCompiler_dBase_dSource_dposEndOffset p) - (Vuna_dCompiler_dBase_dSource.v_Vuna_dCompiler_dBase_dSource_dposOffset p)))) (v_Vuna_dCompiler_dFrontend_dParser_dSupport_dpeekPos st)))

# 81 "Vuna/Compiler/Frontend/Parser/Support.vuna"
let v_Vuna_dCompiler_dFrontend_dParser_dSupport_dlastPos = (fun mc0 -> (match mc0 with
  | { f_Vuna_dCompiler_dFrontend_dParser_dSupport_dPState_fileOf = dtb__17; f_Vuna_dCompiler_dFrontend_dParser_dSupport_dPState_toksOf = dtb__18; f_Vuna_dCompiler_dFrontend_dParser_dSupport_dPState_lastPos = dtb__19; f_Vuna_dCompiler_dFrontend_dParser_dSupport_dPState_toksLeft = dtb__20; f_Vuna_dCompiler_dFrontend_dParser_dSupport_dPState_pmodeOf = dtb__21 } -> dtb__19
  | _ -> failwith "DT: impossible branch"
))

# 48 "Vuna/Compiler/Frontend/Parser/Support.vuna"
let v_Vuna_dCompiler_dFrontend_dParser_dSupport_dspanOf = (fun st st2 -> { Vuna_dCompiler_dBase_dSource.f_Vuna_dCompiler_dBase_dSource_dSpan_spanFile = (v_Vuna_dCompiler_dFrontend_dParser_dSupport_dfileOf st); Vuna_dCompiler_dBase_dSource.f_Vuna_dCompiler_dBase_dSource_dSpan_spanStartLine = (Vuna_dCompiler_dBase_dSource.v_Vuna_dCompiler_dBase_dSource_dposLine (v_Vuna_dCompiler_dFrontend_dParser_dSupport_dpeekPos st)); Vuna_dCompiler_dBase_dSource.f_Vuna_dCompiler_dBase_dSource_dSpan_spanStartCol = (Vuna_dCompiler_dBase_dSource.v_Vuna_dCompiler_dBase_dSource_dposCol (v_Vuna_dCompiler_dFrontend_dParser_dSupport_dpeekPos st)); Vuna_dCompiler_dBase_dSource.f_Vuna_dCompiler_dBase_dSource_dSpan_spanEndLine = (Vuna_dCompiler_dBase_dSource.v_Vuna_dCompiler_dBase_dSource_dposLine (v_Vuna_dCompiler_dFrontend_dParser_dSupport_dlastPos st2)); Vuna_dCompiler_dBase_dSource.f_Vuna_dCompiler_dBase_dSource_dSpan_spanEndCol = (Vuna_dCompiler_dBase_dSource.v_Vuna_dCompiler_dBase_dSource_dposCol (v_Vuna_dCompiler_dFrontend_dParser_dSupport_dlastPos st2)); Vuna_dCompiler_dBase_dSource.f_Vuna_dCompiler_dBase_dSource_dSpan_spanStartOffset = (Vuna_dCompiler_dBase_dSource.v_Vuna_dCompiler_dBase_dSource_dposOffset (v_Vuna_dCompiler_dFrontend_dParser_dSupport_dpeekPos st)); Vuna_dCompiler_dBase_dSource.f_Vuna_dCompiler_dBase_dSource_dSpan_spanEndOffset = (Vuna_dCompiler_dBase_dSource.v_Vuna_dCompiler_dBase_dSource_dposOffset (v_Vuna_dCompiler_dFrontend_dParser_dSupport_dlastPos st2)) })

# 72 "Vuna/Compiler/Frontend/Parser/Support.vuna"
let v_Vuna_dCompiler_dFrontend_dParser_dSupport_dtokSpan = (fun st -> ((fun nd_uscrut1 -> (match nd_uscrut1 with
  | { Vuna_dCompiler_dFrontend_dLexer.f_Vuna_dCompiler_dFrontend_dLexer_dPTok_ptokTok = dtb__22; Vuna_dCompiler_dFrontend_dLexer.f_Vuna_dCompiler_dFrontend_dLexer_dPTok_ptokPos = dtb__23 } -> (match dtb__22 with
  | Vuna_dCompiler_dFrontend_dLexer.C_Vuna_dCompiler_dFrontend_dLexer_dTok_TEof -> ((fun p -> { Vuna_dCompiler_dBase_dSource.f_Vuna_dCompiler_dBase_dSource_dSpan_spanFile = (v_Vuna_dCompiler_dFrontend_dParser_dSupport_dfileOf st); Vuna_dCompiler_dBase_dSource.f_Vuna_dCompiler_dBase_dSource_dSpan_spanStartLine = (Vuna_dCompiler_dBase_dSource.v_Vuna_dCompiler_dBase_dSource_dposLine p); Vuna_dCompiler_dBase_dSource.f_Vuna_dCompiler_dBase_dSource_dSpan_spanStartCol = (Vuna_dCompiler_dBase_dSource.v_Vuna_dCompiler_dBase_dSource_dposCol p); Vuna_dCompiler_dBase_dSource.f_Vuna_dCompiler_dBase_dSource_dSpan_spanEndLine = (Vuna_dCompiler_dBase_dSource.v_Vuna_dCompiler_dBase_dSource_dposLine p); Vuna_dCompiler_dBase_dSource.f_Vuna_dCompiler_dBase_dSource_dSpan_spanEndCol = (Vuna_dCompiler_dBase_dSource.v_Vuna_dCompiler_dBase_dSource_dposCol p); Vuna_dCompiler_dBase_dSource.f_Vuna_dCompiler_dBase_dSource_dSpan_spanStartOffset = (Vuna_dCompiler_dBase_dSource.v_Vuna_dCompiler_dBase_dSource_dposOffset p); Vuna_dCompiler_dBase_dSource.f_Vuna_dCompiler_dBase_dSource_dSpan_spanEndOffset = (Vuna_dCompiler_dBase_dSource.v_Vuna_dCompiler_dBase_dSource_dposOffset p) }) (v_Vuna_dCompiler_dFrontend_dParser_dSupport_dlastPos st))
  | _ -> { Vuna_dCompiler_dBase_dSource.f_Vuna_dCompiler_dBase_dSource_dSpan_spanFile = (v_Vuna_dCompiler_dFrontend_dParser_dSupport_dfileOf st); Vuna_dCompiler_dBase_dSource.f_Vuna_dCompiler_dBase_dSource_dSpan_spanStartLine = (Vuna_dCompiler_dBase_dSource.v_Vuna_dCompiler_dBase_dSource_dposLine dtb__23); Vuna_dCompiler_dBase_dSource.f_Vuna_dCompiler_dBase_dSource_dSpan_spanStartCol = (Vuna_dCompiler_dBase_dSource.v_Vuna_dCompiler_dBase_dSource_dposCol dtb__23); Vuna_dCompiler_dBase_dSource.f_Vuna_dCompiler_dBase_dSource_dSpan_spanEndLine = (Vuna_dCompiler_dBase_dSource.v_Vuna_dCompiler_dBase_dSource_dposLine dtb__23); Vuna_dCompiler_dBase_dSource.f_Vuna_dCompiler_dBase_dSource_dSpan_spanEndCol = (Vuna_dCompiler_dBase_dSource.v_Vuna_dCompiler_dBase_dSource_dposCol dtb__23); Vuna_dCompiler_dBase_dSource.f_Vuna_dCompiler_dBase_dSource_dSpan_spanStartOffset = (Vuna_dCompiler_dBase_dSource.v_Vuna_dCompiler_dBase_dSource_dposOffset dtb__23); Vuna_dCompiler_dBase_dSource.f_Vuna_dCompiler_dBase_dSource_dSpan_spanEndOffset = (Vuna_dCompiler_dBase_dSource.v_Vuna_dCompiler_dBase_dSource_dposOffset dtb__23) }
)
  | _ -> failwith "DT: impossible branch"
)) (v_Vuna_dCompiler_dFrontend_dParser_dSupport_dpeekTok st)))

# 84 "Vuna/Compiler/Frontend/Parser/Support.vuna"
let v_Vuna_dCompiler_dFrontend_dParser_dSupport_dadvance = (fun mc0 -> (match mc0 with
  | { f_Vuna_dCompiler_dFrontend_dParser_dSupport_dPState_fileOf = dtb__24; f_Vuna_dCompiler_dFrontend_dParser_dSupport_dPState_toksOf = dtb__25; f_Vuna_dCompiler_dFrontend_dParser_dSupport_dPState_lastPos = dtb__26; f_Vuna_dCompiler_dFrontend_dParser_dSupport_dPState_toksLeft = dtb__27; f_Vuna_dCompiler_dFrontend_dParser_dSupport_dPState_pmodeOf = dtb__28 } -> (match dtb__25 with
  | Base_dData_dList.C_Base_dData_dList_dList_Nil -> { f_Vuna_dCompiler_dFrontend_dParser_dSupport_dPState_fileOf = dtb__24; f_Vuna_dCompiler_dFrontend_dParser_dSupport_dPState_toksOf = dtb__25; f_Vuna_dCompiler_dFrontend_dParser_dSupport_dPState_lastPos = dtb__26; f_Vuna_dCompiler_dFrontend_dParser_dSupport_dPState_toksLeft = dtb__27; f_Vuna_dCompiler_dFrontend_dParser_dSupport_dPState_pmodeOf = dtb__28 }
  | Base_dData_dList.C_Base_dData_dList_dList__x58__x58_ (dtb__29, dtb__30) -> ((fun nd_uscrut9 -> (match nd_uscrut9 with
  | { Vuna_dCompiler_dFrontend_dLexer.f_Vuna_dCompiler_dFrontend_dLexer_dPTok_ptokTok = dtb__31; Vuna_dCompiler_dFrontend_dLexer.f_Vuna_dCompiler_dFrontend_dLexer_dPTok_ptokPos = dtb__32 } -> (match dtb__31 with
  | Vuna_dCompiler_dFrontend_dLexer.C_Vuna_dCompiler_dFrontend_dLexer_dTok_TEof -> { f_Vuna_dCompiler_dFrontend_dParser_dSupport_dPState_fileOf = dtb__24; f_Vuna_dCompiler_dFrontend_dParser_dSupport_dPState_toksOf = dtb__25; f_Vuna_dCompiler_dFrontend_dParser_dSupport_dPState_lastPos = dtb__26; f_Vuna_dCompiler_dFrontend_dParser_dSupport_dPState_toksLeft = dtb__27; f_Vuna_dCompiler_dFrontend_dParser_dSupport_dPState_pmodeOf = dtb__28 }
  | _ -> { f_Vuna_dCompiler_dFrontend_dParser_dSupport_dPState_fileOf = dtb__24; f_Vuna_dCompiler_dFrontend_dParser_dSupport_dPState_toksOf = dtb__30; f_Vuna_dCompiler_dFrontend_dParser_dSupport_dPState_lastPos = (dtb__29).Vuna_dCompiler_dFrontend_dLexer.f_Vuna_dCompiler_dFrontend_dLexer_dPTok_ptokPos; f_Vuna_dCompiler_dFrontend_dParser_dSupport_dPState_toksLeft = (if (dtb__27 > 0) then (dtb__27 - 1) else 0); f_Vuna_dCompiler_dFrontend_dParser_dSupport_dPState_pmodeOf = dtb__28 }
)
  | _ -> failwith "DT: impossible branch"
)) dtb__29)
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
))

# 90 "Vuna/Compiler/Frontend/Parser/Support.vuna"
let v_Vuna_dCompiler_dFrontend_dParser_dSupport_disEof = (fun st -> ((fun nd_uscrut1 -> (match nd_uscrut1 with
  | { Vuna_dCompiler_dFrontend_dLexer.f_Vuna_dCompiler_dFrontend_dLexer_dPTok_ptokTok = dtb__33; Vuna_dCompiler_dFrontend_dLexer.f_Vuna_dCompiler_dFrontend_dLexer_dPTok_ptokPos = dtb__34 } -> (match dtb__33 with
  | Vuna_dCompiler_dFrontend_dLexer.C_Vuna_dCompiler_dFrontend_dLexer_dTok_TEof -> true
  | _ -> false
)
  | _ -> failwith "DT: impossible branch"
)) (v_Vuna_dCompiler_dFrontend_dParser_dSupport_dpeekTok st)))

# 118 "Vuna/Compiler/Frontend/Parser/Support.vuna"
let v_Vuna_dCompiler_dFrontend_dParser_dSupport_dstateFuel = (fun st -> ((128 * (st).f_Vuna_dCompiler_dFrontend_dParser_dSupport_dPState_toksLeft) + 1024))

# 121 "Vuna/Compiler/Frontend/Parser/Support.vuna"
let v_Vuna_dCompiler_dFrontend_dParser_dSupport_dsameLineState = (fun st -> (match (v_Vuna_dCompiler_dFrontend_dParser_dSupport_dpeekPos st) with
  | { Vuna_dCompiler_dBase_dSource.f_Vuna_dCompiler_dBase_dSource_dPos_posLine = dtb__35; Vuna_dCompiler_dBase_dSource.f_Vuna_dCompiler_dBase_dSource_dPos_posCol = dtb__36; Vuna_dCompiler_dBase_dSource.f_Vuna_dCompiler_dBase_dSource_dPos_posOffset = dtb__37; Vuna_dCompiler_dBase_dSource.f_Vuna_dCompiler_dBase_dSource_dPos_posEndOffset = dtb__38 } -> { f_Vuna_dCompiler_dFrontend_dParser_dSupport_dPState_fileOf = (v_Vuna_dCompiler_dFrontend_dParser_dSupport_dfileOf st); f_Vuna_dCompiler_dFrontend_dParser_dSupport_dPState_toksOf = (st).f_Vuna_dCompiler_dFrontend_dParser_dSupport_dPState_toksOf; f_Vuna_dCompiler_dFrontend_dParser_dSupport_dPState_lastPos = { Vuna_dCompiler_dBase_dSource.f_Vuna_dCompiler_dBase_dSource_dPos_posLine = dtb__35; Vuna_dCompiler_dBase_dSource.f_Vuna_dCompiler_dBase_dSource_dPos_posCol = 0; Vuna_dCompiler_dBase_dSource.f_Vuna_dCompiler_dBase_dSource_dPos_posOffset = 0; Vuna_dCompiler_dBase_dSource.f_Vuna_dCompiler_dBase_dSource_dPos_posEndOffset = 0 }; f_Vuna_dCompiler_dFrontend_dParser_dSupport_dPState_toksLeft = (st).f_Vuna_dCompiler_dFrontend_dParser_dSupport_dPState_toksLeft; f_Vuna_dCompiler_dFrontend_dParser_dSupport_dPState_pmodeOf = (v_Vuna_dCompiler_dFrontend_dParser_dSupport_dpmodeOf st) }
  | _ -> failwith "DT: impossible branch"
))

# 125 "Vuna/Compiler/Frontend/Parser/Support.vuna"
let v_Vuna_dCompiler_dFrontend_dParser_dSupport_datSym = (fun st s -> ((fun nd_uscrut2 -> (match nd_uscrut2 with
  | { Vuna_dCompiler_dFrontend_dLexer.f_Vuna_dCompiler_dFrontend_dLexer_dPTok_ptokTok = dtb__39; Vuna_dCompiler_dFrontend_dLexer.f_Vuna_dCompiler_dFrontend_dLexer_dPTok_ptokPos = dtb__40 } -> (match dtb__39 with
  | Vuna_dCompiler_dFrontend_dLexer.C_Vuna_dCompiler_dFrontend_dLexer_dTok_TSym (dtb__41) -> (dtb__41 = s)
  | _ -> false
)
  | _ -> failwith "DT: impossible branch"
)) (v_Vuna_dCompiler_dFrontend_dParser_dSupport_dpeekTok st)))

# 131 "Vuna/Compiler/Frontend/Parser/Support.vuna"
let rec v_Vuna_dCompiler_dFrontend_dParser_dSupport_dnthTok = (fun mc0 mc1 -> (match mc0 with
  | Base_dData_dList.C_Base_dData_dList_dList__x58__x58_ (dtb__42, dtb__43) -> (if (mc1 <= 0) then (Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Just (dtb__42)) else ((v_Vuna_dCompiler_dFrontend_dParser_dSupport_dnthTok dtb__43) (mc1 - 1)))
  | Base_dData_dList.C_Base_dData_dList_dList_Nil -> Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Nothing
  | _ -> failwith "DT: impossible branch"
))

# 135 "Vuna/Compiler/Frontend/Parser/Support.vuna"
let v_Vuna_dCompiler_dFrontend_dParser_dSupport_dpeekTokAt = (fun st n -> ((v_Vuna_dCompiler_dFrontend_dParser_dSupport_dnthTok (st).f_Vuna_dCompiler_dFrontend_dParser_dSupport_dPState_toksOf) n))

# 152 "Vuna/Compiler/Frontend/Parser/Support.vuna"
let rec v_Vuna_dCompiler_dFrontend_dParser_dSupport_dbinderNameTail = (fun fuel st n acc -> (if (fuel <= 0) then Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Nothing else ((fun nd_uscrut4 -> (match nd_uscrut4 with
  | Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Just (dtb__44) -> (match dtb__44 with
  | { Vuna_dCompiler_dFrontend_dLexer.f_Vuna_dCompiler_dFrontend_dLexer_dPTok_ptokTok = dtb__45; Vuna_dCompiler_dFrontend_dLexer.f_Vuna_dCompiler_dFrontend_dLexer_dPTok_ptokPos = dtb__46 } -> (match dtb__45 with
  | Vuna_dCompiler_dFrontend_dLexer.C_Vuna_dCompiler_dFrontend_dLexer_dTok_TSym (dtb__47) -> (if (dtb__47 = ":") then (Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Just ((Base_dData_dList.v_Base_dData_dList_dreverse acc))) else Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Nothing)
  | Vuna_dCompiler_dFrontend_dLexer.C_Vuna_dCompiler_dFrontend_dLexer_dTok_TIdent (dtb__48) -> ((((v_Vuna_dCompiler_dFrontend_dParser_dSupport_dbinderNameTail (fuel - 1)) st) (n + 1)) (Base_dData_dList.C_Base_dData_dList_dList__x58__x58_ (dtb__48, acc)))
  | _ -> Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Nothing
)
  | _ -> failwith "DT: impossible branch"
)
  | _ -> Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Nothing
)) ((v_Vuna_dCompiler_dFrontend_dParser_dSupport_dpeekTokAt st) n))))

# 159 "Vuna/Compiler/Frontend/Parser/Support.vuna"
let v_Vuna_dCompiler_dFrontend_dParser_dSupport_dquantifiedHead = (fun st q -> ((fun nd_uscrut2 -> (match nd_uscrut2 with
  | Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Just (dtb__49) -> (match dtb__49 with
  | { Vuna_dCompiler_dFrontend_dLexer.f_Vuna_dCompiler_dFrontend_dLexer_dPTok_ptokTok = dtb__50; Vuna_dCompiler_dFrontend_dLexer.f_Vuna_dCompiler_dFrontend_dLexer_dPTok_ptokPos = dtb__51 } -> (match dtb__50 with
  | Vuna_dCompiler_dFrontend_dLexer.C_Vuna_dCompiler_dFrontend_dLexer_dTok_TIdent (dtb__52) -> (match ((((v_Vuna_dCompiler_dFrontend_dParser_dSupport_dbinderNameTail 64) st) 2) Base_dData_dList.C_Base_dData_dList_dList_Nil) with
  | Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Just (dtb__53) -> (Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Just ({ Base_dData_dPair.f_Base_dData_dPair_dPair_first = (Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Just (q)); Base_dData_dPair.f_Base_dData_dPair_dPair_second = (Base_dData_dList.C_Base_dData_dList_dList__x58__x58_ (dtb__52, dtb__53)) }))
  | Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Nothing -> Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Nothing
  | _ -> failwith "DT: impossible branch"
)
  | _ -> Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Nothing
)
  | _ -> failwith "DT: impossible branch"
)
  | _ -> Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Nothing
)) ((v_Vuna_dCompiler_dFrontend_dParser_dSupport_dpeekTokAt st) 1)))

# 141 "Vuna/Compiler/Frontend/Parser/Support.vuna"
let v_Vuna_dCompiler_dFrontend_dParser_dSupport_dbinderHead = (fun st -> ((fun nd_uscrut1 -> (match nd_uscrut1 with
  | { Vuna_dCompiler_dFrontend_dLexer.f_Vuna_dCompiler_dFrontend_dLexer_dPTok_ptokTok = dtb__54; Vuna_dCompiler_dFrontend_dLexer.f_Vuna_dCompiler_dFrontend_dLexer_dPTok_ptokPos = dtb__55 } -> (match dtb__54 with
  | Vuna_dCompiler_dFrontend_dLexer.C_Vuna_dCompiler_dFrontend_dLexer_dTok_TInt (dtb__56) -> (if (dtb__56 = 0) then ((v_Vuna_dCompiler_dFrontend_dParser_dSupport_dquantifiedHead st) Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dQty_Q0) else (if (dtb__56 = 1) then ((v_Vuna_dCompiler_dFrontend_dParser_dSupport_dquantifiedHead st) Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dQty_Q1) else Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Nothing))
  | Vuna_dCompiler_dFrontend_dLexer.C_Vuna_dCompiler_dFrontend_dLexer_dTok_TIdent (dtb__57) -> (match ((((v_Vuna_dCompiler_dFrontend_dParser_dSupport_dbinderNameTail 64) st) 1) Base_dData_dList.C_Base_dData_dList_dList_Nil) with
  | Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Just (dtb__58) -> (Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Just ({ Base_dData_dPair.f_Base_dData_dPair_dPair_first = Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Nothing; Base_dData_dPair.f_Base_dData_dPair_dPair_second = (Base_dData_dList.C_Base_dData_dList_dList__x58__x58_ (dtb__57, dtb__58)) }))
  | Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Nothing -> Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Nothing
  | _ -> failwith "DT: impossible branch"
)
  | _ -> Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Nothing
)
  | _ -> failwith "DT: impossible branch"
)) (v_Vuna_dCompiler_dFrontend_dParser_dSupport_dpeekTok st)))

# 166 "Vuna/Compiler/Frontend/Parser/Support.vuna"
let v_Vuna_dCompiler_dFrontend_dParser_dSupport_datKw = (fun st k -> ((fun nd_uscrut2 -> (match nd_uscrut2 with
  | { Vuna_dCompiler_dFrontend_dLexer.f_Vuna_dCompiler_dFrontend_dLexer_dPTok_ptokTok = dtb__59; Vuna_dCompiler_dFrontend_dLexer.f_Vuna_dCompiler_dFrontend_dLexer_dPTok_ptokPos = dtb__60 } -> (match dtb__59 with
  | Vuna_dCompiler_dFrontend_dLexer.C_Vuna_dCompiler_dFrontend_dLexer_dTok_TKw (dtb__61) -> (dtb__61 = k)
  | _ -> false
)
  | _ -> failwith "DT: impossible branch"
)) (v_Vuna_dCompiler_dFrontend_dParser_dSupport_dpeekTok st)))

# 171 "Vuna/Compiler/Frontend/Parser/Support.vuna"
let v_Vuna_dCompiler_dFrontend_dParser_dSupport_dcanContinue = (fun st blockCol -> (match (v_Vuna_dCompiler_dFrontend_dParser_dSupport_dpeekPos st) with
  | { Vuna_dCompiler_dBase_dSource.f_Vuna_dCompiler_dBase_dSource_dPos_posLine = dtb__62; Vuna_dCompiler_dBase_dSource.f_Vuna_dCompiler_dBase_dSource_dPos_posCol = dtb__63; Vuna_dCompiler_dBase_dSource.f_Vuna_dCompiler_dBase_dSource_dPos_posOffset = dtb__64; Vuna_dCompiler_dBase_dSource.f_Vuna_dCompiler_dBase_dSource_dPos_posEndOffset = dtb__65 } -> (match (v_Vuna_dCompiler_dFrontend_dParser_dSupport_dlastPos st) with
  | { Vuna_dCompiler_dBase_dSource.f_Vuna_dCompiler_dBase_dSource_dPos_posLine = dtb__66; Vuna_dCompiler_dBase_dSource.f_Vuna_dCompiler_dBase_dSource_dPos_posCol = dtb__67; Vuna_dCompiler_dBase_dSource.f_Vuna_dCompiler_dBase_dSource_dPos_posOffset = dtb__68; Vuna_dCompiler_dBase_dSource.f_Vuna_dCompiler_dBase_dSource_dPos_posEndOffset = dtb__69 } -> (if (dtb__62 = dtb__66) then true else (dtb__63 > blockCol))
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
))

# 178 "Vuna/Compiler/Frontend/Parser/Support.vuna"
let v_Vuna_dCompiler_dFrontend_dParser_dSupport_dexpectSym = (fun st s -> ((fun nd_uscrut2 -> (match nd_uscrut2 with
  | { Vuna_dCompiler_dFrontend_dLexer.f_Vuna_dCompiler_dFrontend_dLexer_dPTok_ptokTok = dtb__70; Vuna_dCompiler_dFrontend_dLexer.f_Vuna_dCompiler_dFrontend_dLexer_dPTok_ptokPos = dtb__71 } -> (match dtb__70 with
  | Vuna_dCompiler_dFrontend_dLexer.C_Vuna_dCompiler_dFrontend_dLexer_dTok_TSym (dtb__72) -> (if (dtb__72 = s) then (Vuna_dCompiler_dBase_dDiag.C_Vuna_dCompiler_dBase_dDiag_dCheck_OkC ((v_Vuna_dCompiler_dFrontend_dParser_dSupport_dadvance st))) else (((Vuna_dCompiler_dBase_dDiagnostics_dFrontend.v_Vuna_dCompiler_dBase_dDiagnostics_dFrontend_dpsErr1At (v_Vuna_dCompiler_dFrontend_dParser_dSupport_dtokSpan st)) (Vuna_dCompiler_dBase_dDiagnostics_dFrontend.C_Vuna_dCompiler_dBase_dDiagnostics_dFrontend_dPsDiag_ExpectedToken (s))) s))
  | _ -> (((Vuna_dCompiler_dBase_dDiagnostics_dFrontend.v_Vuna_dCompiler_dBase_dDiagnostics_dFrontend_dpsErr1At (v_Vuna_dCompiler_dFrontend_dParser_dSupport_dtokSpan st)) (Vuna_dCompiler_dBase_dDiagnostics_dFrontend.C_Vuna_dCompiler_dBase_dDiagnostics_dFrontend_dPsDiag_ExpectedToken (s))) s)
)
  | _ -> failwith "DT: impossible branch"
)) (v_Vuna_dCompiler_dFrontend_dParser_dSupport_dpeekTok st)))

# 183 "Vuna/Compiler/Frontend/Parser/Support.vuna"
let v_Vuna_dCompiler_dFrontend_dParser_dSupport_dexpectKw = (fun st k -> ((fun nd_uscrut2 -> (match nd_uscrut2 with
  | { Vuna_dCompiler_dFrontend_dLexer.f_Vuna_dCompiler_dFrontend_dLexer_dPTok_ptokTok = dtb__73; Vuna_dCompiler_dFrontend_dLexer.f_Vuna_dCompiler_dFrontend_dLexer_dPTok_ptokPos = dtb__74 } -> (match dtb__73 with
  | Vuna_dCompiler_dFrontend_dLexer.C_Vuna_dCompiler_dFrontend_dLexer_dTok_TKw (dtb__75) -> (if (dtb__75 = k) then (Vuna_dCompiler_dBase_dDiag.C_Vuna_dCompiler_dBase_dDiag_dCheck_OkC ((v_Vuna_dCompiler_dFrontend_dParser_dSupport_dadvance st))) else (((Vuna_dCompiler_dBase_dDiagnostics_dFrontend.v_Vuna_dCompiler_dBase_dDiagnostics_dFrontend_dpsErr1At (v_Vuna_dCompiler_dFrontend_dParser_dSupport_dtokSpan st)) (Vuna_dCompiler_dBase_dDiagnostics_dFrontend.C_Vuna_dCompiler_dBase_dDiagnostics_dFrontend_dPsDiag_ExpectedToken (k))) k))
  | _ -> (((Vuna_dCompiler_dBase_dDiagnostics_dFrontend.v_Vuna_dCompiler_dBase_dDiagnostics_dFrontend_dpsErr1At (v_Vuna_dCompiler_dFrontend_dParser_dSupport_dtokSpan st)) (Vuna_dCompiler_dBase_dDiagnostics_dFrontend.C_Vuna_dCompiler_dBase_dDiagnostics_dFrontend_dPsDiag_ExpectedToken (k))) k)
)
  | _ -> failwith "DT: impossible branch"
)) (v_Vuna_dCompiler_dFrontend_dParser_dSupport_dpeekTok st)))

# 188 "Vuna/Compiler/Frontend/Parser/Support.vuna"
let v_Vuna_dCompiler_dFrontend_dParser_dSupport_dexpectIdent = (fun st -> ((fun nd_uscrut1 -> (match nd_uscrut1 with
  | { Vuna_dCompiler_dFrontend_dLexer.f_Vuna_dCompiler_dFrontend_dLexer_dPTok_ptokTok = dtb__76; Vuna_dCompiler_dFrontend_dLexer.f_Vuna_dCompiler_dFrontend_dLexer_dPTok_ptokPos = dtb__77 } -> (match dtb__76 with
  | Vuna_dCompiler_dFrontend_dLexer.C_Vuna_dCompiler_dFrontend_dLexer_dTok_TIdent (dtb__78) -> (Vuna_dCompiler_dBase_dDiag.C_Vuna_dCompiler_dBase_dDiag_dCheck_OkC ({ Base_dData_dPair.f_Base_dData_dPair_dPair_first = dtb__78; Base_dData_dPair.f_Base_dData_dPair_dPair_second = (v_Vuna_dCompiler_dFrontend_dParser_dSupport_dadvance st) }))
  | _ -> ((Vuna_dCompiler_dBase_dDiagnostics_dFrontend.v_Vuna_dCompiler_dBase_dDiagnostics_dFrontend_dpsErr0At (v_Vuna_dCompiler_dFrontend_dParser_dSupport_dtokSpan st)) Vuna_dCompiler_dBase_dDiagnostics_dFrontend.C_Vuna_dCompiler_dBase_dDiagnostics_dFrontend_dPsDiag_ExpectedIdentifier)
)
  | _ -> failwith "DT: impossible branch"
)) (v_Vuna_dCompiler_dFrontend_dParser_dSupport_dpeekTok st)))

# 205 "Vuna/Compiler/Frontend/Parser/Support.vuna"
let v_Vuna_dCompiler_dFrontend_dParser_dSupport_dupperFirst = (fun s -> (match (Base_dData_dList.dtp_unpack s) with
  | Base_dData_dList.C_Base_dData_dList_dList__x58__x58_ (dtb__79, dtb__80) -> (if (dtb__79 >= 65) then (dtb__79 <= 90) else false)
  | Base_dData_dList.C_Base_dData_dList_dList_Nil -> false
  | _ -> failwith "DT: impossible branch"
))

# 212 "Vuna/Compiler/Frontend/Parser/Support.vuna"
let v_Vuna_dCompiler_dFrontend_dParser_dSupport_dunderscoreCtorName = (fun s -> (match (Base_dData_dList.dtp_unpack s) with
  | Base_dData_dList.C_Base_dData_dList_dList__x58__x58_ (dtb__81, dtb__82) -> (if (dtb__81 = 95) then (match dtb__82 with
  | Base_dData_dList.C_Base_dData_dList_dList__x58__x58_ (dtb__83, dtb__84) -> (if (dtb__83 >= 65) then (dtb__83 <= 90) else false)
  | Base_dData_dList.C_Base_dData_dList_dList_Nil -> false
  | _ -> failwith "DT: impossible branch"
) else false)
  | Base_dData_dList.C_Base_dData_dList_dList_Nil -> false
  | _ -> failwith "DT: impossible branch"
))

# 220 "Vuna/Compiler/Frontend/Parser/Support.vuna"
let v_Vuna_dCompiler_dFrontend_dParser_dSupport_dctorPatternStart = (fun name -> (if (v_Vuna_dCompiler_dFrontend_dParser_dSupport_dupperFirst name) then true else (v_Vuna_dCompiler_dFrontend_dParser_dSupport_dunderscoreCtorName name)))

# 241 "Vuna/Compiler/Frontend/Parser/Support.vuna"
let v_Vuna_dCompiler_dFrontend_dParser_dSupport_dholeAtomAt = (fun st -> ((fun nd_uscrut1 -> (match nd_uscrut1 with
  | { Vuna_dCompiler_dFrontend_dLexer.f_Vuna_dCompiler_dFrontend_dLexer_dPTok_ptokTok = dtb__85; Vuna_dCompiler_dFrontend_dLexer.f_Vuna_dCompiler_dFrontend_dLexer_dPTok_ptokPos = dtb__86 } -> (match dtb__85 with
  | Vuna_dCompiler_dFrontend_dLexer.C_Vuna_dCompiler_dFrontend_dLexer_dTok_TSym (dtb__87) -> (if (dtb__87 = "?") then ((fun nd_uscrut5 -> (match nd_uscrut5 with
  | Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Just (dtb__88) -> (match dtb__88 with
  | { Vuna_dCompiler_dFrontend_dLexer.f_Vuna_dCompiler_dFrontend_dLexer_dPTok_ptokTok = dtb__89; Vuna_dCompiler_dFrontend_dLexer.f_Vuna_dCompiler_dFrontend_dLexer_dPTok_ptokPos = dtb__90 } -> (match dtb__89 with
  | Vuna_dCompiler_dFrontend_dLexer.C_Vuna_dCompiler_dFrontend_dLexer_dTok_TIdent (dtb__91) -> (if (if ((Vuna_dCompiler_dBase_dSource.v_Vuna_dCompiler_dBase_dSource_dposLine dtb__90) = (Vuna_dCompiler_dBase_dSource.v_Vuna_dCompiler_dBase_dSource_dposLine dtb__86)) then ((Vuna_dCompiler_dBase_dSource.v_Vuna_dCompiler_dBase_dSource_dposCol dtb__90) = ((Vuna_dCompiler_dBase_dSource.v_Vuna_dCompiler_dBase_dSource_dposCol dtb__86) + 1)) else false) then (Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Just ({ Base_dData_dPair.f_Base_dData_dPair_dPair_first = ("?" ^ dtb__91); Base_dData_dPair.f_Base_dData_dPair_dPair_second = { Vuna_dCompiler_dBase_dSource.f_Vuna_dCompiler_dBase_dSource_dSpan_spanFile = (v_Vuna_dCompiler_dFrontend_dParser_dSupport_dfileOf st); Vuna_dCompiler_dBase_dSource.f_Vuna_dCompiler_dBase_dSource_dSpan_spanStartLine = (Vuna_dCompiler_dBase_dSource.v_Vuna_dCompiler_dBase_dSource_dposLine dtb__86); Vuna_dCompiler_dBase_dSource.f_Vuna_dCompiler_dBase_dSource_dSpan_spanStartCol = (Vuna_dCompiler_dBase_dSource.v_Vuna_dCompiler_dBase_dSource_dposCol dtb__86); Vuna_dCompiler_dBase_dSource.f_Vuna_dCompiler_dBase_dSource_dSpan_spanEndLine = (Vuna_dCompiler_dBase_dSource.v_Vuna_dCompiler_dBase_dSource_dposLine dtb__90); Vuna_dCompiler_dBase_dSource.f_Vuna_dCompiler_dBase_dSource_dSpan_spanEndCol = ((Vuna_dCompiler_dBase_dSource.v_Vuna_dCompiler_dBase_dSource_dposCol dtb__90) + (bi_strLength dtb__91)); Vuna_dCompiler_dBase_dSource.f_Vuna_dCompiler_dBase_dSource_dSpan_spanStartOffset = (Vuna_dCompiler_dBase_dSource.v_Vuna_dCompiler_dBase_dSource_dposOffset dtb__86); Vuna_dCompiler_dBase_dSource.f_Vuna_dCompiler_dBase_dSource_dSpan_spanEndOffset = ((Vuna_dCompiler_dBase_dSource.v_Vuna_dCompiler_dBase_dSource_dposOffset dtb__90) + (bi_strLength dtb__91)) } })) else Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Nothing)
  | _ -> Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Nothing
)
  | _ -> failwith "DT: impossible branch"
)
  | _ -> Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Nothing
)) ((v_Vuna_dCompiler_dFrontend_dParser_dSupport_dpeekTokAt st) 1)) else Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Nothing)
  | _ -> Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Nothing
)
  | _ -> failwith "DT: impossible branch"
)) (v_Vuna_dCompiler_dFrontend_dParser_dSupport_dpeekTok st)))

# 223 "Vuna/Compiler/Frontend/Parser/Support.vuna"
let v_Vuna_dCompiler_dFrontend_dParser_dSupport_dstartsAtom = (fun st -> ((fun nd_uscrut1 -> (match nd_uscrut1 with
  | { Vuna_dCompiler_dFrontend_dLexer.f_Vuna_dCompiler_dFrontend_dLexer_dPTok_ptokTok = dtb__92; Vuna_dCompiler_dFrontend_dLexer.f_Vuna_dCompiler_dFrontend_dLexer_dPTok_ptokPos = dtb__93 } -> (match dtb__92 with
  | Vuna_dCompiler_dFrontend_dLexer.C_Vuna_dCompiler_dFrontend_dLexer_dTok_TSym (dtb__94) -> (if (dtb__94 = "(") then true else (if (dtb__94 = "[") then true else (if (dtb__94 = "?") then (match (v_Vuna_dCompiler_dFrontend_dParser_dSupport_dholeAtomAt st) with
  | Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Just (dtb__95) -> true
  | Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Nothing -> false
  | _ -> failwith "DT: impossible branch"
) else false)))
  | Vuna_dCompiler_dFrontend_dLexer.C_Vuna_dCompiler_dFrontend_dLexer_dTok_TKw (dtb__96) -> (if (dtb__96 = "Type") then true else false)
  | Vuna_dCompiler_dFrontend_dLexer.C_Vuna_dCompiler_dFrontend_dLexer_dTok_TTmpl (dtb__97, dtb__98, dtb__99) -> true
  | Vuna_dCompiler_dFrontend_dLexer.C_Vuna_dCompiler_dFrontend_dLexer_dTok_TStr (dtb__100) -> true
  | Vuna_dCompiler_dFrontend_dLexer.C_Vuna_dCompiler_dFrontend_dLexer_dTok_TFloat (dtb__101) -> true
  | Vuna_dCompiler_dFrontend_dLexer.C_Vuna_dCompiler_dFrontend_dLexer_dTok_TInt (dtb__102) -> true
  | Vuna_dCompiler_dFrontend_dLexer.C_Vuna_dCompiler_dFrontend_dLexer_dTok_TIdent (dtb__103) -> true
  | _ -> false
)
  | _ -> failwith "DT: impossible branch"
)) (v_Vuna_dCompiler_dFrontend_dParser_dSupport_dpeekTok st)))

# 251 "Vuna/Compiler/Frontend/Parser/Support.vuna"
let v_Vuna_dCompiler_dFrontend_dParser_dSupport_dstartsPatternAtom = (fun st -> ((fun nd_uscrut1 -> (match nd_uscrut1 with
  | { Vuna_dCompiler_dFrontend_dLexer.f_Vuna_dCompiler_dFrontend_dLexer_dPTok_ptokTok = dtb__104; Vuna_dCompiler_dFrontend_dLexer.f_Vuna_dCompiler_dFrontend_dLexer_dPTok_ptokPos = dtb__105 } -> (match dtb__104 with
  | Vuna_dCompiler_dFrontend_dLexer.C_Vuna_dCompiler_dFrontend_dLexer_dTok_TSym (dtb__106) -> (if (dtb__106 = "(") then true else (if (dtb__106 = "[") then true else false))
  | Vuna_dCompiler_dFrontend_dLexer.C_Vuna_dCompiler_dFrontend_dLexer_dTok_TTmpl (dtb__107, dtb__108, dtb__109) -> true
  | Vuna_dCompiler_dFrontend_dLexer.C_Vuna_dCompiler_dFrontend_dLexer_dTok_TStr (dtb__110) -> true
  | Vuna_dCompiler_dFrontend_dLexer.C_Vuna_dCompiler_dFrontend_dLexer_dTok_TInt (dtb__111) -> true
  | Vuna_dCompiler_dFrontend_dLexer.C_Vuna_dCompiler_dFrontend_dLexer_dTok_TIdent (dtb__112) -> true
  | _ -> false
)
  | _ -> failwith "DT: impossible branch"
)) (v_Vuna_dCompiler_dFrontend_dParser_dSupport_dpeekTok st)))

# 263 "Vuna/Compiler/Frontend/Parser/Support.vuna"
let v_Vuna_dCompiler_dFrontend_dParser_dSupport_disSyntaxSym = (fun op -> (if (op = "=") then true else (if (op = ":") then true else (if (op = ",") then true else (if (op = ";") then true else (if (op = "|") then true else (if (op = "=>") then true else (if (op = "<-") then true else (if (op = "\\") then true else (if (op = ".") then true else (if (op = "..") then true else (if (op = "@") then true else (if (op = "(") then true else (if (op = ")") then true else (if (op = "[") then true else (if (op = "]") then true else (if (op = "{") then true else (if (op = "}") then true else false))))))))))))))))))

# 289 "Vuna/Compiler/Frontend/Parser/Support.vuna"
let v_Vuna_dCompiler_dFrontend_dParser_dSupport_disReservedValueName = (fun name -> (if (if (v_Vuna_dCompiler_dFrontend_dParser_dSupport_disSyntaxSym name) then true else (name = "->")) then true else (name = "`")))

# 195 "Vuna/Compiler/Frontend/Parser/Support.vuna"
let v_Vuna_dCompiler_dFrontend_dParser_dSupport_dexpectValueName = (fun st -> ((fun nd_uscrut1 -> (match nd_uscrut1 with
  | { Vuna_dCompiler_dFrontend_dLexer.f_Vuna_dCompiler_dFrontend_dLexer_dPTok_ptokTok = dtb__113; Vuna_dCompiler_dFrontend_dLexer.f_Vuna_dCompiler_dFrontend_dLexer_dPTok_ptokPos = dtb__114 } -> (match dtb__113 with
  | Vuna_dCompiler_dFrontend_dLexer.C_Vuna_dCompiler_dFrontend_dLexer_dTok_TSym (dtb__115) -> (if (v_Vuna_dCompiler_dFrontend_dParser_dSupport_disReservedValueName dtb__115) then (((Vuna_dCompiler_dBase_dDiagnostics_dFrontend.v_Vuna_dCompiler_dBase_dDiagnostics_dFrontend_dpsErr1At (v_Vuna_dCompiler_dFrontend_dParser_dSupport_dtokSpan st)) (Vuna_dCompiler_dBase_dDiagnostics_dFrontend.C_Vuna_dCompiler_dBase_dDiagnostics_dFrontend_dPsDiag_ExpectedToken ("value name"))) "value name") else (Vuna_dCompiler_dBase_dDiag.C_Vuna_dCompiler_dBase_dDiag_dCheck_OkC ({ Base_dData_dPair.f_Base_dData_dPair_dPair_first = dtb__115; Base_dData_dPair.f_Base_dData_dPair_dPair_second = (v_Vuna_dCompiler_dFrontend_dParser_dSupport_dadvance st) })))
  | Vuna_dCompiler_dFrontend_dLexer.C_Vuna_dCompiler_dFrontend_dLexer_dTok_TIdent (dtb__116) -> (if (v_Vuna_dCompiler_dFrontend_dParser_dSupport_disReservedValueName dtb__116) then (((Vuna_dCompiler_dBase_dDiagnostics_dFrontend.v_Vuna_dCompiler_dBase_dDiagnostics_dFrontend_dpsErr1At (v_Vuna_dCompiler_dFrontend_dParser_dSupport_dtokSpan st)) (Vuna_dCompiler_dBase_dDiagnostics_dFrontend.C_Vuna_dCompiler_dBase_dDiagnostics_dFrontend_dPsDiag_ExpectedToken ("value name"))) "value name") else (Vuna_dCompiler_dBase_dDiag.C_Vuna_dCompiler_dBase_dDiag_dCheck_OkC ({ Base_dData_dPair.f_Base_dData_dPair_dPair_first = dtb__116; Base_dData_dPair.f_Base_dData_dPair_dPair_second = (v_Vuna_dCompiler_dFrontend_dParser_dSupport_dadvance st) })))
  | _ -> ((Vuna_dCompiler_dBase_dDiagnostics_dFrontend.v_Vuna_dCompiler_dBase_dDiagnostics_dFrontend_dpsErr0At (v_Vuna_dCompiler_dFrontend_dParser_dSupport_dtokSpan st)) Vuna_dCompiler_dBase_dDiagnostics_dFrontend.C_Vuna_dCompiler_dBase_dDiagnostics_dFrontend_dPsDiag_ExpectedIdentifier)
)
  | _ -> failwith "DT: impossible branch"
)) (v_Vuna_dCompiler_dFrontend_dParser_dSupport_dpeekTok st)))

# 294 "Vuna/Compiler/Frontend/Parser/Support.vuna"
let v_Vuna_dCompiler_dFrontend_dParser_dSupport_dcloseParenNext = (fun st -> ((fun nd_uscrut1 -> (match nd_uscrut1 with
  | Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Just (dtb__117) -> (match dtb__117 with
  | { Vuna_dCompiler_dFrontend_dLexer.f_Vuna_dCompiler_dFrontend_dLexer_dPTok_ptokTok = dtb__118; Vuna_dCompiler_dFrontend_dLexer.f_Vuna_dCompiler_dFrontend_dLexer_dPTok_ptokPos = dtb__119 } -> (match dtb__118 with
  | Vuna_dCompiler_dFrontend_dLexer.C_Vuna_dCompiler_dFrontend_dLexer_dTok_TSym (dtb__120) -> (if (dtb__120 = ")") then true else false)
  | _ -> false
)
  | _ -> failwith "DT: impossible branch"
)
  | _ -> false
)) ((v_Vuna_dCompiler_dFrontend_dParser_dSupport_dpeekTokAt st) 1)))

# 312 "Vuna/Compiler/Frontend/Parser/Support.vuna"
let v_Vuna_dCompiler_dFrontend_dParser_dSupport_dminusLiteralAt = (fun p st -> ((fun nd_uscrut2 -> (match nd_uscrut2 with
  | Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Just (dtb__121) -> (match dtb__121 with
  | { Vuna_dCompiler_dFrontend_dLexer.f_Vuna_dCompiler_dFrontend_dLexer_dPTok_ptokTok = dtb__122; Vuna_dCompiler_dFrontend_dLexer.f_Vuna_dCompiler_dFrontend_dLexer_dPTok_ptokPos = dtb__123 } -> (match dtb__122 with
  | Vuna_dCompiler_dFrontend_dLexer.C_Vuna_dCompiler_dFrontend_dLexer_dTok_TFloat (dtb__124) -> (if ((Vuna_dCompiler_dBase_dSource.v_Vuna_dCompiler_dBase_dSource_dposLine dtb__123) = (Vuna_dCompiler_dBase_dSource.v_Vuna_dCompiler_dBase_dSource_dposLine p)) then ((Vuna_dCompiler_dBase_dSource.v_Vuna_dCompiler_dBase_dSource_dposCol dtb__123) = ((Vuna_dCompiler_dBase_dSource.v_Vuna_dCompiler_dBase_dSource_dposCol p) + 1)) else false)
  | Vuna_dCompiler_dFrontend_dLexer.C_Vuna_dCompiler_dFrontend_dLexer_dTok_TInt (dtb__125) -> (if ((Vuna_dCompiler_dBase_dSource.v_Vuna_dCompiler_dBase_dSource_dposLine dtb__123) = (Vuna_dCompiler_dBase_dSource.v_Vuna_dCompiler_dBase_dSource_dposLine p)) then ((Vuna_dCompiler_dBase_dSource.v_Vuna_dCompiler_dBase_dSource_dposCol dtb__123) = ((Vuna_dCompiler_dBase_dSource.v_Vuna_dCompiler_dBase_dSource_dposCol p) + 1)) else false)
  | _ -> false
)
  | _ -> failwith "DT: impossible branch"
)
  | _ -> false
)) ((v_Vuna_dCompiler_dFrontend_dParser_dSupport_dpeekTokAt st) 2)))

# 302 "Vuna/Compiler/Frontend/Parser/Support.vuna"
let v_Vuna_dCompiler_dFrontend_dParser_dSupport_dsectionOpAt = (fun st -> ((fun nd_uscrut1 -> (match nd_uscrut1 with
  | Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Just (dtb__126) -> (match dtb__126 with
  | { Vuna_dCompiler_dFrontend_dLexer.f_Vuna_dCompiler_dFrontend_dLexer_dPTok_ptokTok = dtb__127; Vuna_dCompiler_dFrontend_dLexer.f_Vuna_dCompiler_dFrontend_dLexer_dPTok_ptokPos = dtb__128 } -> (match dtb__127 with
  | Vuna_dCompiler_dFrontend_dLexer.C_Vuna_dCompiler_dFrontend_dLexer_dTok_TSym (dtb__129) -> (if (v_Vuna_dCompiler_dFrontend_dParser_dSupport_disReservedValueName dtb__129) then Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Nothing else (if (dtb__129 = "?") then (match (v_Vuna_dCompiler_dFrontend_dParser_dSupport_dholeAtomAt (v_Vuna_dCompiler_dFrontend_dParser_dSupport_dadvance st)) with
  | Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Just (dtb__130) -> Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Nothing
  | Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Nothing -> (Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Just (dtb__129))
  | _ -> failwith "DT: impossible branch"
) else (if (if (dtb__129 = "-") then ((v_Vuna_dCompiler_dFrontend_dParser_dSupport_dminusLiteralAt dtb__128) st) else false) then Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Nothing else (Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Just (dtb__129)))))
  | _ -> Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Nothing
)
  | _ -> failwith "DT: impossible branch"
)
  | _ -> Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Nothing
)) ((v_Vuna_dCompiler_dFrontend_dParser_dSupport_dpeekTokAt st) 1)))

# 318 "Vuna/Compiler/Frontend/Parser/Support.vuna"
let rec v_Vuna_dCompiler_dFrontend_dParser_dSupport_dcountArrows = (fun mc0 -> (match mc0 with
  | Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dExpr_EApp (dtb__131, dtb__132, dtb__133) -> (match dtb__131 with
  | Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dExpr_EVar (dtb__134, dtb__135) -> (if (dtb__134 = "->") then (match dtb__132 with
  | Base_dData_dList.C_Base_dData_dList_dList__x58__x58_ (dtb__136, dtb__137) -> (match dtb__137 with
  | Base_dData_dList.C_Base_dData_dList_dList__x58__x58_ (dtb__138, dtb__139) -> (match dtb__139 with
  | Base_dData_dList.C_Base_dData_dList_dList_Nil -> (1 + (v_Vuna_dCompiler_dFrontend_dParser_dSupport_dcountArrows dtb__138))
  | _ -> 0
)
  | _ -> 0
)
  | _ -> 0
) else 0)
  | _ -> 0
)
  | Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dExpr_EInfix (dtb__140, dtb__141, dtb__142, dtb__143) -> (if (dtb__140 = "->") then (1 + (v_Vuna_dCompiler_dFrontend_dParser_dSupport_dcountArrows dtb__142)) else 0)
  | _ -> 0
))

# 323 "Vuna/Compiler/Frontend/Parser/Support.vuna"
let v_Vuna_dCompiler_dFrontend_dParser_dSupport_dterminatesExpression = (fun mc0 -> (match mc0 with
  | { Vuna_dCompiler_dFrontend_dLexer.f_Vuna_dCompiler_dFrontend_dLexer_dPTok_ptokTok = dtb__144; Vuna_dCompiler_dFrontend_dLexer.f_Vuna_dCompiler_dFrontend_dLexer_dPTok_ptokPos = dtb__145 } -> (match dtb__144 with
  | Vuna_dCompiler_dFrontend_dLexer.C_Vuna_dCompiler_dFrontend_dLexer_dTok_TKw (dtb__146) -> (if (dtb__146 = "else") then true else (if (dtb__146 = "in") then true else (if (dtb__146 = "then") then true else false)))
  | Vuna_dCompiler_dFrontend_dLexer.C_Vuna_dCompiler_dFrontend_dLexer_dTok_TSym (dtb__147) -> (if (dtb__147 = ")") then true else (if (dtb__147 = "]") then true else (if (dtb__147 = ",") then true else false)))
  | _ -> false
)
  | _ -> failwith "DT: impossible branch"
))

# 332 "Vuna/Compiler/Frontend/Parser/Support.vuna"
let v_Vuna_dCompiler_dFrontend_dParser_dSupport_dbadCaseIndent = (fun st altCol -> (if (v_Vuna_dCompiler_dFrontend_dParser_dSupport_disEof st) then false else (match (v_Vuna_dCompiler_dFrontend_dParser_dSupport_dpeekPos st) with
  | { Vuna_dCompiler_dBase_dSource.f_Vuna_dCompiler_dBase_dSource_dPos_posLine = dtb__148; Vuna_dCompiler_dBase_dSource.f_Vuna_dCompiler_dBase_dSource_dPos_posCol = dtb__149; Vuna_dCompiler_dBase_dSource.f_Vuna_dCompiler_dBase_dSource_dPos_posOffset = dtb__150; Vuna_dCompiler_dBase_dSource.f_Vuna_dCompiler_dBase_dSource_dPos_posEndOffset = dtb__151 } -> (if (dtb__149 > altCol) then (if (v_Vuna_dCompiler_dFrontend_dParser_dSupport_dterminatesExpression (v_Vuna_dCompiler_dFrontend_dParser_dSupport_dpeekTok st)) then false else true) else false)
  | _ -> failwith "DT: impossible branch"
)))
