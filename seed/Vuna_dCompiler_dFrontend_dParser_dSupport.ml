open Vuna_runtime
type t_Vuna_dCompiler_dFrontend_dParser_dSupport_dParseMode = C_Vuna_dCompiler_dFrontend_dParser_dSupport_dParseMode_PmStrict | C_Vuna_dCompiler_dFrontend_dParser_dSupport_dParseMode_PmTool
and t_Vuna_dCompiler_dFrontend_dParser_dSupport_dPState = { f_Vuna_dCompiler_dFrontend_dParser_dSupport_dPState_fileOf : string; f_Vuna_dCompiler_dFrontend_dParser_dSupport_dPState_toksOf : Vuna_dCompiler_dFrontend_dLexer.t_Vuna_dCompiler_dFrontend_dLexer_dPTok Base_dData_dList.t_Base_dData_dList_dList; f_Vuna_dCompiler_dFrontend_dParser_dSupport_dPState_lastPos : Vuna_dCompiler_dBase_dSource.t_Vuna_dCompiler_dBase_dSource_dPos; f_Vuna_dCompiler_dFrontend_dParser_dSupport_dPState_toksLeft : int; f_Vuna_dCompiler_dFrontend_dParser_dSupport_dPState_pmodeOf : t_Vuna_dCompiler_dFrontend_dParser_dSupport_dParseMode }

# 32 "Vuna/Compiler/Frontend/Parser/Support.vuna"
let v_Vuna_dCompiler_dFrontend_dParser_dSupport_dfileOf = (fun (mc0 : t_Vuna_dCompiler_dFrontend_dParser_dSupport_dPState) -> (match mc0 with
  | { f_Vuna_dCompiler_dFrontend_dParser_dSupport_dPState_fileOf = dtb__0; f_Vuna_dCompiler_dFrontend_dParser_dSupport_dPState_toksOf = dtb__1; f_Vuna_dCompiler_dFrontend_dParser_dSupport_dPState_lastPos = dtb__2; f_Vuna_dCompiler_dFrontend_dParser_dSupport_dPState_toksLeft = dtb__3; f_Vuna_dCompiler_dFrontend_dParser_dSupport_dPState_pmodeOf = dtb__4 } -> dtb__0
  | _ -> failwith "DT: impossible branch"
))

# 36 "Vuna/Compiler/Frontend/Parser/Support.vuna"
let v_Vuna_dCompiler_dFrontend_dParser_dSupport_dpmodeOf = (fun (mc0 : t_Vuna_dCompiler_dFrontend_dParser_dSupport_dPState) -> (match mc0 with
  | { f_Vuna_dCompiler_dFrontend_dParser_dSupport_dPState_fileOf = dtb__5; f_Vuna_dCompiler_dFrontend_dParser_dSupport_dPState_toksOf = dtb__6; f_Vuna_dCompiler_dFrontend_dParser_dSupport_dPState_lastPos = dtb__7; f_Vuna_dCompiler_dFrontend_dParser_dSupport_dPState_toksLeft = dtb__8; f_Vuna_dCompiler_dFrontend_dParser_dSupport_dPState_pmodeOf = dtb__9 } -> dtb__9
  | _ -> failwith "DT: impossible branch"
))

# 40 "Vuna/Compiler/Frontend/Parser/Support.vuna"
let v_Vuna_dCompiler_dFrontend_dParser_dSupport_dmkState = (fun (file : string) (toks : Vuna_dCompiler_dFrontend_dLexer.t_Vuna_dCompiler_dFrontend_dLexer_dPTok Base_dData_dList.t_Base_dData_dList_dList) (mode : t_Vuna_dCompiler_dFrontend_dParser_dSupport_dParseMode) -> { f_Vuna_dCompiler_dFrontend_dParser_dSupport_dPState_fileOf = file; f_Vuna_dCompiler_dFrontend_dParser_dSupport_dPState_toksOf = toks; f_Vuna_dCompiler_dFrontend_dParser_dSupport_dPState_lastPos = { Vuna_dCompiler_dBase_dSource.f_Vuna_dCompiler_dBase_dSource_dPos_posLine = 1; Vuna_dCompiler_dBase_dSource.f_Vuna_dCompiler_dBase_dSource_dPos_posCol = 0; Vuna_dCompiler_dBase_dSource.f_Vuna_dCompiler_dBase_dSource_dPos_posOffset = 0; Vuna_dCompiler_dBase_dSource.f_Vuna_dCompiler_dBase_dSource_dPos_posEndOffset = 0 }; f_Vuna_dCompiler_dFrontend_dParser_dSupport_dPState_toksLeft = (Base_dData_dList.v_Base_dData_dList_dlength toks); f_Vuna_dCompiler_dFrontend_dParser_dSupport_dPState_pmodeOf = mode })

# 44 "Vuna/Compiler/Frontend/Parser/Support.vuna"
let v_Vuna_dCompiler_dFrontend_dParser_dSupport_dmkStateAt = (fun (file : string) (toks : Vuna_dCompiler_dFrontend_dLexer.t_Vuna_dCompiler_dFrontend_dLexer_dPTok Base_dData_dList.t_Base_dData_dList_dList) (last : Vuna_dCompiler_dBase_dSource.t_Vuna_dCompiler_dBase_dSource_dPos) (count : int) (mode : t_Vuna_dCompiler_dFrontend_dParser_dSupport_dParseMode) -> { f_Vuna_dCompiler_dFrontend_dParser_dSupport_dPState_fileOf = file; f_Vuna_dCompiler_dFrontend_dParser_dSupport_dPState_toksOf = toks; f_Vuna_dCompiler_dFrontend_dParser_dSupport_dPState_lastPos = last; f_Vuna_dCompiler_dFrontend_dParser_dSupport_dPState_toksLeft = count; f_Vuna_dCompiler_dFrontend_dParser_dSupport_dPState_pmodeOf = mode })

# 75 "Vuna/Compiler/Frontend/Parser/Support.vuna"
let v_Vuna_dCompiler_dFrontend_dParser_dSupport_dpeekTok = (fun (mc0 : t_Vuna_dCompiler_dFrontend_dParser_dSupport_dPState) -> (match mc0 with
  | { f_Vuna_dCompiler_dFrontend_dParser_dSupport_dPState_fileOf = dtb__10; f_Vuna_dCompiler_dFrontend_dParser_dSupport_dPState_toksOf = dtb__11; f_Vuna_dCompiler_dFrontend_dParser_dSupport_dPState_lastPos = dtb__12; f_Vuna_dCompiler_dFrontend_dParser_dSupport_dPState_toksLeft = dtb__13; f_Vuna_dCompiler_dFrontend_dParser_dSupport_dPState_pmodeOf = dtb__14 } -> (match dtb__11 with
  | Base_dData_dList.C_Base_dData_dList_dList_Nil -> { Vuna_dCompiler_dFrontend_dLexer.f_Vuna_dCompiler_dFrontend_dLexer_dPTok_ptokTok = Vuna_dCompiler_dFrontend_dLexer.C_Vuna_dCompiler_dFrontend_dLexer_dTok_TEof; Vuna_dCompiler_dFrontend_dLexer.f_Vuna_dCompiler_dFrontend_dLexer_dPTok_ptokPos = { Vuna_dCompiler_dBase_dSource.f_Vuna_dCompiler_dBase_dSource_dPos_posLine = 1; Vuna_dCompiler_dBase_dSource.f_Vuna_dCompiler_dBase_dSource_dPos_posCol = 1; Vuna_dCompiler_dBase_dSource.f_Vuna_dCompiler_dBase_dSource_dPos_posOffset = 0; Vuna_dCompiler_dBase_dSource.f_Vuna_dCompiler_dBase_dSource_dPos_posEndOffset = 0 } }
  | Base_dData_dList.C_Base_dData_dList_dList__x58__x58_ (dtb__15, dtb__16) -> dtb__15
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
))

# 79 "Vuna/Compiler/Frontend/Parser/Support.vuna"
let v_Vuna_dCompiler_dFrontend_dParser_dSupport_dpeekPos = (fun (st : t_Vuna_dCompiler_dFrontend_dParser_dSupport_dPState) -> ((v_Vuna_dCompiler_dFrontend_dParser_dSupport_dpeekTok st)).Vuna_dCompiler_dFrontend_dLexer.f_Vuna_dCompiler_dFrontend_dLexer_dPTok_ptokPos)

# 61 "Vuna/Compiler/Frontend/Parser/Support.vuna"
let v_Vuna_dCompiler_dFrontend_dParser_dSupport_dtokenSpan = (fun (st : t_Vuna_dCompiler_dFrontend_dParser_dSupport_dPState) -> ((fun p -> ((fun len -> { Vuna_dCompiler_dBase_dSource.f_Vuna_dCompiler_dBase_dSource_dSpan_spanFile = (v_Vuna_dCompiler_dFrontend_dParser_dSupport_dfileOf st); Vuna_dCompiler_dBase_dSource.f_Vuna_dCompiler_dBase_dSource_dSpan_spanStartLine = (Vuna_dCompiler_dBase_dSource.v_Vuna_dCompiler_dBase_dSource_dposLine p); Vuna_dCompiler_dBase_dSource.f_Vuna_dCompiler_dBase_dSource_dSpan_spanStartCol = (Vuna_dCompiler_dBase_dSource.v_Vuna_dCompiler_dBase_dSource_dposCol p); Vuna_dCompiler_dBase_dSource.f_Vuna_dCompiler_dBase_dSource_dSpan_spanEndLine = (Vuna_dCompiler_dBase_dSource.v_Vuna_dCompiler_dBase_dSource_dposLine p); Vuna_dCompiler_dBase_dSource.f_Vuna_dCompiler_dBase_dSource_dSpan_spanEndCol = ((Vuna_dCompiler_dBase_dSource.v_Vuna_dCompiler_dBase_dSource_dposCol p) + len); Vuna_dCompiler_dBase_dSource.f_Vuna_dCompiler_dBase_dSource_dSpan_spanStartOffset = (Vuna_dCompiler_dBase_dSource.v_Vuna_dCompiler_dBase_dSource_dposOffset p); Vuna_dCompiler_dBase_dSource.f_Vuna_dCompiler_dBase_dSource_dSpan_spanEndOffset = (Vuna_dCompiler_dBase_dSource.v_Vuna_dCompiler_dBase_dSource_dposEndOffset p) }) ((Vuna_dCompiler_dBase_dSource.v_Vuna_dCompiler_dBase_dSource_dposEndOffset p) - (Vuna_dCompiler_dBase_dSource.v_Vuna_dCompiler_dBase_dSource_dposOffset p)))) (v_Vuna_dCompiler_dFrontend_dParser_dSupport_dpeekPos st)))

# 94 "Vuna/Compiler/Frontend/Parser/Support.vuna"
let v_Vuna_dCompiler_dFrontend_dParser_dSupport_dlastPos = (fun (mc0 : t_Vuna_dCompiler_dFrontend_dParser_dSupport_dPState) -> (match mc0 with
  | { f_Vuna_dCompiler_dFrontend_dParser_dSupport_dPState_fileOf = dtb__17; f_Vuna_dCompiler_dFrontend_dParser_dSupport_dPState_toksOf = dtb__18; f_Vuna_dCompiler_dFrontend_dParser_dSupport_dPState_lastPos = dtb__19; f_Vuna_dCompiler_dFrontend_dParser_dSupport_dPState_toksLeft = dtb__20; f_Vuna_dCompiler_dFrontend_dParser_dSupport_dPState_pmodeOf = dtb__21 } -> dtb__19
  | _ -> failwith "DT: impossible branch"
))

# 48 "Vuna/Compiler/Frontend/Parser/Support.vuna"
let v_Vuna_dCompiler_dFrontend_dParser_dSupport_dspanOf = (fun (st : t_Vuna_dCompiler_dFrontend_dParser_dSupport_dPState) (st2 : t_Vuna_dCompiler_dFrontend_dParser_dSupport_dPState) -> { Vuna_dCompiler_dBase_dSource.f_Vuna_dCompiler_dBase_dSource_dSpan_spanFile = (v_Vuna_dCompiler_dFrontend_dParser_dSupport_dfileOf st); Vuna_dCompiler_dBase_dSource.f_Vuna_dCompiler_dBase_dSource_dSpan_spanStartLine = (Vuna_dCompiler_dBase_dSource.v_Vuna_dCompiler_dBase_dSource_dposLine (v_Vuna_dCompiler_dFrontend_dParser_dSupport_dpeekPos st)); Vuna_dCompiler_dBase_dSource.f_Vuna_dCompiler_dBase_dSource_dSpan_spanStartCol = (Vuna_dCompiler_dBase_dSource.v_Vuna_dCompiler_dBase_dSource_dposCol (v_Vuna_dCompiler_dFrontend_dParser_dSupport_dpeekPos st)); Vuna_dCompiler_dBase_dSource.f_Vuna_dCompiler_dBase_dSource_dSpan_spanEndLine = (Vuna_dCompiler_dBase_dSource.v_Vuna_dCompiler_dBase_dSource_dposLine (v_Vuna_dCompiler_dFrontend_dParser_dSupport_dlastPos st2)); Vuna_dCompiler_dBase_dSource.f_Vuna_dCompiler_dBase_dSource_dSpan_spanEndCol = (Vuna_dCompiler_dBase_dSource.v_Vuna_dCompiler_dBase_dSource_dposCol (v_Vuna_dCompiler_dFrontend_dParser_dSupport_dlastPos st2)); Vuna_dCompiler_dBase_dSource.f_Vuna_dCompiler_dBase_dSource_dSpan_spanStartOffset = (Vuna_dCompiler_dBase_dSource.v_Vuna_dCompiler_dBase_dSource_dposOffset (v_Vuna_dCompiler_dFrontend_dParser_dSupport_dpeekPos st)); Vuna_dCompiler_dBase_dSource.f_Vuna_dCompiler_dBase_dSource_dSpan_spanEndOffset = (Vuna_dCompiler_dBase_dSource.v_Vuna_dCompiler_dBase_dSource_dposOffset (v_Vuna_dCompiler_dFrontend_dParser_dSupport_dlastPos st2)) })

# 84 "Vuna/Compiler/Frontend/Parser/Support.vuna"
let v_Vuna_dCompiler_dFrontend_dParser_dSupport_dtokSpan = (fun (st : t_Vuna_dCompiler_dFrontend_dParser_dSupport_dPState) -> ((fun nd_uscrut1 -> (match nd_uscrut1 with
  | { Vuna_dCompiler_dFrontend_dLexer.f_Vuna_dCompiler_dFrontend_dLexer_dPTok_ptokTok = dtb__22; Vuna_dCompiler_dFrontend_dLexer.f_Vuna_dCompiler_dFrontend_dLexer_dPTok_ptokPos = dtb__23 } -> (match dtb__22 with
  | Vuna_dCompiler_dFrontend_dLexer.C_Vuna_dCompiler_dFrontend_dLexer_dTok_TEof -> ((fun p -> { Vuna_dCompiler_dBase_dSource.f_Vuna_dCompiler_dBase_dSource_dSpan_spanFile = (v_Vuna_dCompiler_dFrontend_dParser_dSupport_dfileOf st); Vuna_dCompiler_dBase_dSource.f_Vuna_dCompiler_dBase_dSource_dSpan_spanStartLine = (Vuna_dCompiler_dBase_dSource.v_Vuna_dCompiler_dBase_dSource_dposLine p); Vuna_dCompiler_dBase_dSource.f_Vuna_dCompiler_dBase_dSource_dSpan_spanStartCol = (Vuna_dCompiler_dBase_dSource.v_Vuna_dCompiler_dBase_dSource_dposCol p); Vuna_dCompiler_dBase_dSource.f_Vuna_dCompiler_dBase_dSource_dSpan_spanEndLine = (Vuna_dCompiler_dBase_dSource.v_Vuna_dCompiler_dBase_dSource_dposLine p); Vuna_dCompiler_dBase_dSource.f_Vuna_dCompiler_dBase_dSource_dSpan_spanEndCol = (Vuna_dCompiler_dBase_dSource.v_Vuna_dCompiler_dBase_dSource_dposCol p); Vuna_dCompiler_dBase_dSource.f_Vuna_dCompiler_dBase_dSource_dSpan_spanStartOffset = (Vuna_dCompiler_dBase_dSource.v_Vuna_dCompiler_dBase_dSource_dposOffset p); Vuna_dCompiler_dBase_dSource.f_Vuna_dCompiler_dBase_dSource_dSpan_spanEndOffset = (Vuna_dCompiler_dBase_dSource.v_Vuna_dCompiler_dBase_dSource_dposOffset p) }) (v_Vuna_dCompiler_dFrontend_dParser_dSupport_dlastPos st))
  | _ -> { Vuna_dCompiler_dBase_dSource.f_Vuna_dCompiler_dBase_dSource_dSpan_spanFile = (v_Vuna_dCompiler_dFrontend_dParser_dSupport_dfileOf st); Vuna_dCompiler_dBase_dSource.f_Vuna_dCompiler_dBase_dSource_dSpan_spanStartLine = (Vuna_dCompiler_dBase_dSource.v_Vuna_dCompiler_dBase_dSource_dposLine dtb__23); Vuna_dCompiler_dBase_dSource.f_Vuna_dCompiler_dBase_dSource_dSpan_spanStartCol = (Vuna_dCompiler_dBase_dSource.v_Vuna_dCompiler_dBase_dSource_dposCol dtb__23); Vuna_dCompiler_dBase_dSource.f_Vuna_dCompiler_dBase_dSource_dSpan_spanEndLine = (Vuna_dCompiler_dBase_dSource.v_Vuna_dCompiler_dBase_dSource_dposLine dtb__23); Vuna_dCompiler_dBase_dSource.f_Vuna_dCompiler_dBase_dSource_dSpan_spanEndCol = (Vuna_dCompiler_dBase_dSource.v_Vuna_dCompiler_dBase_dSource_dposCol dtb__23); Vuna_dCompiler_dBase_dSource.f_Vuna_dCompiler_dBase_dSource_dSpan_spanStartOffset = (Vuna_dCompiler_dBase_dSource.v_Vuna_dCompiler_dBase_dSource_dposOffset dtb__23); Vuna_dCompiler_dBase_dSource.f_Vuna_dCompiler_dBase_dSource_dSpan_spanEndOffset = (Vuna_dCompiler_dBase_dSource.v_Vuna_dCompiler_dBase_dSource_dposOffset dtb__23) }
)
  | _ -> failwith "DT: impossible branch"
)) (v_Vuna_dCompiler_dFrontend_dParser_dSupport_dpeekTok st)))

# 97 "Vuna/Compiler/Frontend/Parser/Support.vuna"
let v_Vuna_dCompiler_dFrontend_dParser_dSupport_dadvance = (fun (mc0 : t_Vuna_dCompiler_dFrontend_dParser_dSupport_dPState) -> (match mc0 with
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

# 104 "Vuna/Compiler/Frontend/Parser/Support.vuna"
let v_Vuna_dCompiler_dFrontend_dParser_dSupport_disEof = (fun (st : t_Vuna_dCompiler_dFrontend_dParser_dSupport_dPState) -> ((fun nd_uscrut1 -> (match nd_uscrut1 with
  | { Vuna_dCompiler_dFrontend_dLexer.f_Vuna_dCompiler_dFrontend_dLexer_dPTok_ptokTok = dtb__33; Vuna_dCompiler_dFrontend_dLexer.f_Vuna_dCompiler_dFrontend_dLexer_dPTok_ptokPos = dtb__34 } -> (match dtb__33 with
  | Vuna_dCompiler_dFrontend_dLexer.C_Vuna_dCompiler_dFrontend_dLexer_dTok_TEof -> true
  | _ -> false
)
  | _ -> failwith "DT: impossible branch"
)) (v_Vuna_dCompiler_dFrontend_dParser_dSupport_dpeekTok st)))

# 133 "Vuna/Compiler/Frontend/Parser/Support.vuna"
let v_Vuna_dCompiler_dFrontend_dParser_dSupport_dstateFuel = (fun (st : t_Vuna_dCompiler_dFrontend_dParser_dSupport_dPState) -> ((128 * (st).f_Vuna_dCompiler_dFrontend_dParser_dSupport_dPState_toksLeft) + 1024))

# 136 "Vuna/Compiler/Frontend/Parser/Support.vuna"
let v_Vuna_dCompiler_dFrontend_dParser_dSupport_dsameLineState = (fun (st : t_Vuna_dCompiler_dFrontend_dParser_dSupport_dPState) -> (match (v_Vuna_dCompiler_dFrontend_dParser_dSupport_dpeekPos st) with
  | { Vuna_dCompiler_dBase_dSource.f_Vuna_dCompiler_dBase_dSource_dPos_posLine = dtb__35; Vuna_dCompiler_dBase_dSource.f_Vuna_dCompiler_dBase_dSource_dPos_posCol = dtb__36; Vuna_dCompiler_dBase_dSource.f_Vuna_dCompiler_dBase_dSource_dPos_posOffset = dtb__37; Vuna_dCompiler_dBase_dSource.f_Vuna_dCompiler_dBase_dSource_dPos_posEndOffset = dtb__38 } -> { f_Vuna_dCompiler_dFrontend_dParser_dSupport_dPState_fileOf = (v_Vuna_dCompiler_dFrontend_dParser_dSupport_dfileOf st); f_Vuna_dCompiler_dFrontend_dParser_dSupport_dPState_toksOf = (st).f_Vuna_dCompiler_dFrontend_dParser_dSupport_dPState_toksOf; f_Vuna_dCompiler_dFrontend_dParser_dSupport_dPState_lastPos = { Vuna_dCompiler_dBase_dSource.f_Vuna_dCompiler_dBase_dSource_dPos_posLine = dtb__35; Vuna_dCompiler_dBase_dSource.f_Vuna_dCompiler_dBase_dSource_dPos_posCol = 0; Vuna_dCompiler_dBase_dSource.f_Vuna_dCompiler_dBase_dSource_dPos_posOffset = 0; Vuna_dCompiler_dBase_dSource.f_Vuna_dCompiler_dBase_dSource_dPos_posEndOffset = 0 }; f_Vuna_dCompiler_dFrontend_dParser_dSupport_dPState_toksLeft = (st).f_Vuna_dCompiler_dFrontend_dParser_dSupport_dPState_toksLeft; f_Vuna_dCompiler_dFrontend_dParser_dSupport_dPState_pmodeOf = (v_Vuna_dCompiler_dFrontend_dParser_dSupport_dpmodeOf st) }
  | _ -> failwith "DT: impossible branch"
))

# 141 "Vuna/Compiler/Frontend/Parser/Support.vuna"
let v_Vuna_dCompiler_dFrontend_dParser_dSupport_datSym = (fun (st : t_Vuna_dCompiler_dFrontend_dParser_dSupport_dPState) (s : string) -> ((fun nd_uscrut2 -> (match nd_uscrut2 with
  | { Vuna_dCompiler_dFrontend_dLexer.f_Vuna_dCompiler_dFrontend_dLexer_dPTok_ptokTok = dtb__39; Vuna_dCompiler_dFrontend_dLexer.f_Vuna_dCompiler_dFrontend_dLexer_dPTok_ptokPos = dtb__40 } -> (match dtb__39 with
  | Vuna_dCompiler_dFrontend_dLexer.C_Vuna_dCompiler_dFrontend_dLexer_dTok_TSym (dtb__41) -> (dtb__41 = s)
  | _ -> false
)
  | _ -> failwith "DT: impossible branch"
)) (v_Vuna_dCompiler_dFrontend_dParser_dSupport_dpeekTok st)))

# 148 "Vuna/Compiler/Frontend/Parser/Support.vuna"
let rec v_Vuna_dCompiler_dFrontend_dParser_dSupport_dnthTok = (fun (mc0 : Vuna_dCompiler_dFrontend_dLexer.t_Vuna_dCompiler_dFrontend_dLexer_dPTok Base_dData_dList.t_Base_dData_dList_dList) (mc1 : int) -> (match mc0 with
  | Base_dData_dList.C_Base_dData_dList_dList__x58__x58_ (dtb__42, dtb__43) -> (if (mc1 <= 0) then (Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Just (dtb__42)) else ((v_Vuna_dCompiler_dFrontend_dParser_dSupport_dnthTok dtb__43) (mc1 - 1)))
  | Base_dData_dList.C_Base_dData_dList_dList_Nil -> Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Nothing
  | _ -> failwith "DT: impossible branch"
))

# 152 "Vuna/Compiler/Frontend/Parser/Support.vuna"
let v_Vuna_dCompiler_dFrontend_dParser_dSupport_dpeekTokAt = (fun (st : t_Vuna_dCompiler_dFrontend_dParser_dSupport_dPState) (n : int) -> ((v_Vuna_dCompiler_dFrontend_dParser_dSupport_dnthTok (st).f_Vuna_dCompiler_dFrontend_dParser_dSupport_dPState_toksOf) n))

# 170 "Vuna/Compiler/Frontend/Parser/Support.vuna"
let v_Vuna_dCompiler_dFrontend_dParser_dSupport_dtokTail = (fun (mc0 : Vuna_dCompiler_dFrontend_dLexer.t_Vuna_dCompiler_dFrontend_dLexer_dPTok Base_dData_dList.t_Base_dData_dList_dList) -> (match mc0 with
  | Base_dData_dList.C_Base_dData_dList_dList__x58__x58_ (dtb__44, dtb__45) -> dtb__45
  | Base_dData_dList.C_Base_dData_dList_dList_Nil -> Base_dData_dList.C_Base_dData_dList_dList_Nil
  | _ -> failwith "DT: impossible branch"
))

# 175 "Vuna/Compiler/Frontend/Parser/Support.vuna"
let rec v_Vuna_dCompiler_dFrontend_dParser_dSupport_dbinderNameTail = (fun (toks : Vuna_dCompiler_dFrontend_dLexer.t_Vuna_dCompiler_dFrontend_dLexer_dPTok Base_dData_dList.t_Base_dData_dList_dList) (acc : string Base_dData_dList.t_Base_dData_dList_dList) -> (match toks with
  | Base_dData_dList.C_Base_dData_dList_dList_Nil -> Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Nothing
  | Base_dData_dList.C_Base_dData_dList_dList__x58__x58_ (dtb__46, dtb__47) -> ((fun nd_uscrut5 -> (match nd_uscrut5 with
  | { Vuna_dCompiler_dFrontend_dLexer.f_Vuna_dCompiler_dFrontend_dLexer_dPTok_ptokTok = dtb__48; Vuna_dCompiler_dFrontend_dLexer.f_Vuna_dCompiler_dFrontend_dLexer_dPTok_ptokPos = dtb__49 } -> (match dtb__48 with
  | Vuna_dCompiler_dFrontend_dLexer.C_Vuna_dCompiler_dFrontend_dLexer_dTok_TSym (dtb__50) -> (if (dtb__50 = ":") then (Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Just ((Base_dData_dList.v_Base_dData_dList_dreverse acc))) else Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Nothing)
  | Vuna_dCompiler_dFrontend_dLexer.C_Vuna_dCompiler_dFrontend_dLexer_dTok_TIdent (dtb__51) -> ((v_Vuna_dCompiler_dFrontend_dParser_dSupport_dbinderNameTail dtb__47) (Base_dData_dList.C_Base_dData_dList_dList__x58__x58_ (dtb__51, acc)))
  | _ -> Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Nothing
)
  | _ -> failwith "DT: impossible branch"
)) dtb__46)
  | _ -> failwith "DT: impossible branch"
))

# 185 "Vuna/Compiler/Frontend/Parser/Support.vuna"
let v_Vuna_dCompiler_dFrontend_dParser_dSupport_dquantifiedHead = (fun (st : t_Vuna_dCompiler_dFrontend_dParser_dSupport_dPState) (q : Vuna_dCompiler_dFrontend_dAst.t_Vuna_dCompiler_dFrontend_dAst_dQty) -> ((fun nd_uscrut2 -> (match nd_uscrut2 with
  | Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Just (dtb__52) -> (match dtb__52 with
  | { Vuna_dCompiler_dFrontend_dLexer.f_Vuna_dCompiler_dFrontend_dLexer_dPTok_ptokTok = dtb__53; Vuna_dCompiler_dFrontend_dLexer.f_Vuna_dCompiler_dFrontend_dLexer_dPTok_ptokPos = dtb__54 } -> (match dtb__53 with
  | Vuna_dCompiler_dFrontend_dLexer.C_Vuna_dCompiler_dFrontend_dLexer_dTok_TIdent (dtb__55) -> (match ((v_Vuna_dCompiler_dFrontend_dParser_dSupport_dbinderNameTail (v_Vuna_dCompiler_dFrontend_dParser_dSupport_dtokTail (v_Vuna_dCompiler_dFrontend_dParser_dSupport_dtokTail (st).f_Vuna_dCompiler_dFrontend_dParser_dSupport_dPState_toksOf))) Base_dData_dList.C_Base_dData_dList_dList_Nil) with
  | Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Just (dtb__56) -> (Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Just ({ Base_dData_dPair.f_Base_dData_dPair_dPair_first = (Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Just (q)); Base_dData_dPair.f_Base_dData_dPair_dPair_second = (Base_dData_dList.C_Base_dData_dList_dList__x58__x58_ (dtb__55, dtb__56)) }))
  | Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Nothing -> Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Nothing
  | _ -> failwith "DT: impossible branch"
)
  | _ -> Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Nothing
)
  | _ -> failwith "DT: impossible branch"
)
  | _ -> Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Nothing
)) ((v_Vuna_dCompiler_dFrontend_dParser_dSupport_dpeekTokAt st) 1)))

# 158 "Vuna/Compiler/Frontend/Parser/Support.vuna"
let v_Vuna_dCompiler_dFrontend_dParser_dSupport_dbinderHead = (fun (st : t_Vuna_dCompiler_dFrontend_dParser_dSupport_dPState) -> ((fun nd_uscrut1 -> (match nd_uscrut1 with
  | { Vuna_dCompiler_dFrontend_dLexer.f_Vuna_dCompiler_dFrontend_dLexer_dPTok_ptokTok = dtb__57; Vuna_dCompiler_dFrontend_dLexer.f_Vuna_dCompiler_dFrontend_dLexer_dPTok_ptokPos = dtb__58 } -> (match dtb__57 with
  | Vuna_dCompiler_dFrontend_dLexer.C_Vuna_dCompiler_dFrontend_dLexer_dTok_TInt (dtb__59) -> (if (dtb__59 = 0) then ((v_Vuna_dCompiler_dFrontend_dParser_dSupport_dquantifiedHead st) Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dQty_Q0) else (if (dtb__59 = 1) then ((v_Vuna_dCompiler_dFrontend_dParser_dSupport_dquantifiedHead st) Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dQty_Q1) else Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Nothing))
  | Vuna_dCompiler_dFrontend_dLexer.C_Vuna_dCompiler_dFrontend_dLexer_dTok_TIdent (dtb__60) -> (match ((v_Vuna_dCompiler_dFrontend_dParser_dSupport_dbinderNameTail (v_Vuna_dCompiler_dFrontend_dParser_dSupport_dtokTail (st).f_Vuna_dCompiler_dFrontend_dParser_dSupport_dPState_toksOf)) Base_dData_dList.C_Base_dData_dList_dList_Nil) with
  | Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Just (dtb__61) -> (Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Just ({ Base_dData_dPair.f_Base_dData_dPair_dPair_first = Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Nothing; Base_dData_dPair.f_Base_dData_dPair_dPair_second = (Base_dData_dList.C_Base_dData_dList_dList__x58__x58_ (dtb__60, dtb__61)) }))
  | Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Nothing -> Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Nothing
  | _ -> failwith "DT: impossible branch"
)
  | _ -> Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Nothing
)
  | _ -> failwith "DT: impossible branch"
)) (v_Vuna_dCompiler_dFrontend_dParser_dSupport_dpeekTok st)))

# 194 "Vuna/Compiler/Frontend/Parser/Support.vuna"
let v_Vuna_dCompiler_dFrontend_dParser_dSupport_datKw = (fun (st : t_Vuna_dCompiler_dFrontend_dParser_dSupport_dPState) (k : string) -> ((fun nd_uscrut2 -> (match nd_uscrut2 with
  | { Vuna_dCompiler_dFrontend_dLexer.f_Vuna_dCompiler_dFrontend_dLexer_dPTok_ptokTok = dtb__62; Vuna_dCompiler_dFrontend_dLexer.f_Vuna_dCompiler_dFrontend_dLexer_dPTok_ptokPos = dtb__63 } -> (match dtb__62 with
  | Vuna_dCompiler_dFrontend_dLexer.C_Vuna_dCompiler_dFrontend_dLexer_dTok_TKw (dtb__64) -> (dtb__64 = k)
  | _ -> false
)
  | _ -> failwith "DT: impossible branch"
)) (v_Vuna_dCompiler_dFrontend_dParser_dSupport_dpeekTok st)))

# 200 "Vuna/Compiler/Frontend/Parser/Support.vuna"
let v_Vuna_dCompiler_dFrontend_dParser_dSupport_dcanContinue = (fun (st : t_Vuna_dCompiler_dFrontend_dParser_dSupport_dPState) (blockCol : int) -> (match (v_Vuna_dCompiler_dFrontend_dParser_dSupport_dpeekPos st) with
  | { Vuna_dCompiler_dBase_dSource.f_Vuna_dCompiler_dBase_dSource_dPos_posLine = dtb__65; Vuna_dCompiler_dBase_dSource.f_Vuna_dCompiler_dBase_dSource_dPos_posCol = dtb__66; Vuna_dCompiler_dBase_dSource.f_Vuna_dCompiler_dBase_dSource_dPos_posOffset = dtb__67; Vuna_dCompiler_dBase_dSource.f_Vuna_dCompiler_dBase_dSource_dPos_posEndOffset = dtb__68 } -> (match (v_Vuna_dCompiler_dFrontend_dParser_dSupport_dlastPos st) with
  | { Vuna_dCompiler_dBase_dSource.f_Vuna_dCompiler_dBase_dSource_dPos_posLine = dtb__69; Vuna_dCompiler_dBase_dSource.f_Vuna_dCompiler_dBase_dSource_dPos_posCol = dtb__70; Vuna_dCompiler_dBase_dSource.f_Vuna_dCompiler_dBase_dSource_dPos_posOffset = dtb__71; Vuna_dCompiler_dBase_dSource.f_Vuna_dCompiler_dBase_dSource_dPos_posEndOffset = dtb__72 } -> (if (dtb__65 = dtb__69) then true else (dtb__66 > blockCol))
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
))

# 209 "Vuna/Compiler/Frontend/Parser/Support.vuna"
let v_Vuna_dCompiler_dFrontend_dParser_dSupport_dexpectSym = (fun (st : t_Vuna_dCompiler_dFrontend_dParser_dSupport_dPState) (s : string) -> ((fun nd_uscrut2 -> (match nd_uscrut2 with
  | { Vuna_dCompiler_dFrontend_dLexer.f_Vuna_dCompiler_dFrontend_dLexer_dPTok_ptokTok = dtb__73; Vuna_dCompiler_dFrontend_dLexer.f_Vuna_dCompiler_dFrontend_dLexer_dPTok_ptokPos = dtb__74 } -> (match dtb__73 with
  | Vuna_dCompiler_dFrontend_dLexer.C_Vuna_dCompiler_dFrontend_dLexer_dTok_TSym (dtb__75) -> (if (dtb__75 = s) then (Vuna_dCompiler_dBase_dDiag.C_Vuna_dCompiler_dBase_dDiag_dCheck_OkC ((v_Vuna_dCompiler_dFrontend_dParser_dSupport_dadvance st))) else (((Vuna_dCompiler_dBase_dDiagnostics_dFrontend.v_Vuna_dCompiler_dBase_dDiagnostics_dFrontend_dpsErr1At (v_Vuna_dCompiler_dFrontend_dParser_dSupport_dtokSpan st)) (Vuna_dCompiler_dBase_dDiagnostics_dFrontend.C_Vuna_dCompiler_dBase_dDiagnostics_dFrontend_dPsDiag_ExpectedToken (s))) s))
  | _ -> (((Vuna_dCompiler_dBase_dDiagnostics_dFrontend.v_Vuna_dCompiler_dBase_dDiagnostics_dFrontend_dpsErr1At (v_Vuna_dCompiler_dFrontend_dParser_dSupport_dtokSpan st)) (Vuna_dCompiler_dBase_dDiagnostics_dFrontend.C_Vuna_dCompiler_dBase_dDiagnostics_dFrontend_dPsDiag_ExpectedToken (s))) s)
)
  | _ -> failwith "DT: impossible branch"
)) (v_Vuna_dCompiler_dFrontend_dParser_dSupport_dpeekTok st)))

# 216 "Vuna/Compiler/Frontend/Parser/Support.vuna"
let v_Vuna_dCompiler_dFrontend_dParser_dSupport_dexpectKw = (fun (st : t_Vuna_dCompiler_dFrontend_dParser_dSupport_dPState) (k : string) -> ((fun nd_uscrut2 -> (match nd_uscrut2 with
  | { Vuna_dCompiler_dFrontend_dLexer.f_Vuna_dCompiler_dFrontend_dLexer_dPTok_ptokTok = dtb__76; Vuna_dCompiler_dFrontend_dLexer.f_Vuna_dCompiler_dFrontend_dLexer_dPTok_ptokPos = dtb__77 } -> (match dtb__76 with
  | Vuna_dCompiler_dFrontend_dLexer.C_Vuna_dCompiler_dFrontend_dLexer_dTok_TKw (dtb__78) -> (if (dtb__78 = k) then (Vuna_dCompiler_dBase_dDiag.C_Vuna_dCompiler_dBase_dDiag_dCheck_OkC ((v_Vuna_dCompiler_dFrontend_dParser_dSupport_dadvance st))) else (((Vuna_dCompiler_dBase_dDiagnostics_dFrontend.v_Vuna_dCompiler_dBase_dDiagnostics_dFrontend_dpsErr1At (v_Vuna_dCompiler_dFrontend_dParser_dSupport_dtokSpan st)) (Vuna_dCompiler_dBase_dDiagnostics_dFrontend.C_Vuna_dCompiler_dBase_dDiagnostics_dFrontend_dPsDiag_ExpectedToken (k))) k))
  | _ -> (((Vuna_dCompiler_dBase_dDiagnostics_dFrontend.v_Vuna_dCompiler_dBase_dDiagnostics_dFrontend_dpsErr1At (v_Vuna_dCompiler_dFrontend_dParser_dSupport_dtokSpan st)) (Vuna_dCompiler_dBase_dDiagnostics_dFrontend.C_Vuna_dCompiler_dBase_dDiagnostics_dFrontend_dPsDiag_ExpectedToken (k))) k)
)
  | _ -> failwith "DT: impossible branch"
)) (v_Vuna_dCompiler_dFrontend_dParser_dSupport_dpeekTok st)))

# 222 "Vuna/Compiler/Frontend/Parser/Support.vuna"
let v_Vuna_dCompiler_dFrontend_dParser_dSupport_dexpectIdent = (fun (st : t_Vuna_dCompiler_dFrontend_dParser_dSupport_dPState) -> ((fun nd_uscrut1 -> (match nd_uscrut1 with
  | { Vuna_dCompiler_dFrontend_dLexer.f_Vuna_dCompiler_dFrontend_dLexer_dPTok_ptokTok = dtb__79; Vuna_dCompiler_dFrontend_dLexer.f_Vuna_dCompiler_dFrontend_dLexer_dPTok_ptokPos = dtb__80 } -> (match dtb__79 with
  | Vuna_dCompiler_dFrontend_dLexer.C_Vuna_dCompiler_dFrontend_dLexer_dTok_TIdent (dtb__81) -> (Vuna_dCompiler_dBase_dDiag.C_Vuna_dCompiler_dBase_dDiag_dCheck_OkC ({ Base_dData_dPair.f_Base_dData_dPair_dPair_first = dtb__81; Base_dData_dPair.f_Base_dData_dPair_dPair_second = (v_Vuna_dCompiler_dFrontend_dParser_dSupport_dadvance st) }))
  | _ -> ((Vuna_dCompiler_dBase_dDiagnostics_dFrontend.v_Vuna_dCompiler_dBase_dDiagnostics_dFrontend_dpsErr0At (v_Vuna_dCompiler_dFrontend_dParser_dSupport_dtokSpan st)) Vuna_dCompiler_dBase_dDiagnostics_dFrontend.C_Vuna_dCompiler_dBase_dDiagnostics_dFrontend_dPsDiag_ExpectedIdentifier)
)
  | _ -> failwith "DT: impossible branch"
)) (v_Vuna_dCompiler_dFrontend_dParser_dSupport_dpeekTok st)))

# 245 "Vuna/Compiler/Frontend/Parser/Support.vuna"
let v_Vuna_dCompiler_dFrontend_dParser_dSupport_dupperFirst = (fun (s : string) -> (match (Base_dData_dList.dtp_unpack s) with
  | Base_dData_dList.C_Base_dData_dList_dList__x58__x58_ (dtb__82, dtb__83) -> (if (dtb__82 >= 65) then (dtb__82 <= 90) else false)
  | Base_dData_dList.C_Base_dData_dList_dList_Nil -> false
  | _ -> failwith "DT: impossible branch"
))

# 253 "Vuna/Compiler/Frontend/Parser/Support.vuna"
let v_Vuna_dCompiler_dFrontend_dParser_dSupport_dunderscoreCtorName = (fun (s : string) -> (match (Base_dData_dList.dtp_unpack s) with
  | Base_dData_dList.C_Base_dData_dList_dList__x58__x58_ (dtb__84, dtb__85) -> (if (dtb__84 = 95) then (match dtb__85 with
  | Base_dData_dList.C_Base_dData_dList_dList__x58__x58_ (dtb__86, dtb__87) -> (if (dtb__86 >= 65) then (dtb__86 <= 90) else false)
  | Base_dData_dList.C_Base_dData_dList_dList_Nil -> false
  | _ -> failwith "DT: impossible branch"
) else false)
  | Base_dData_dList.C_Base_dData_dList_dList_Nil -> false
  | _ -> failwith "DT: impossible branch"
))

# 265 "Vuna/Compiler/Frontend/Parser/Support.vuna"
let v_Vuna_dCompiler_dFrontend_dParser_dSupport_dctorPatternStart = (fun (name : string) -> (if (v_Vuna_dCompiler_dFrontend_dParser_dSupport_dupperFirst name) then true else (v_Vuna_dCompiler_dFrontend_dParser_dSupport_dunderscoreCtorName name)))

# 288 "Vuna/Compiler/Frontend/Parser/Support.vuna"
let v_Vuna_dCompiler_dFrontend_dParser_dSupport_dholeAtomAt = (fun (st : t_Vuna_dCompiler_dFrontend_dParser_dSupport_dPState) -> ((fun nd_uscrut1 -> (match nd_uscrut1 with
  | { Vuna_dCompiler_dFrontend_dLexer.f_Vuna_dCompiler_dFrontend_dLexer_dPTok_ptokTok = dtb__88; Vuna_dCompiler_dFrontend_dLexer.f_Vuna_dCompiler_dFrontend_dLexer_dPTok_ptokPos = dtb__89 } -> (match dtb__88 with
  | Vuna_dCompiler_dFrontend_dLexer.C_Vuna_dCompiler_dFrontend_dLexer_dTok_TSym (dtb__90) -> (if (dtb__90 = "?") then ((fun nd_uscrut5 -> (match nd_uscrut5 with
  | Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Just (dtb__91) -> (match dtb__91 with
  | { Vuna_dCompiler_dFrontend_dLexer.f_Vuna_dCompiler_dFrontend_dLexer_dPTok_ptokTok = dtb__92; Vuna_dCompiler_dFrontend_dLexer.f_Vuna_dCompiler_dFrontend_dLexer_dPTok_ptokPos = dtb__93 } -> (match dtb__92 with
  | Vuna_dCompiler_dFrontend_dLexer.C_Vuna_dCompiler_dFrontend_dLexer_dTok_TIdent (dtb__94) -> (if (if ((Vuna_dCompiler_dBase_dSource.v_Vuna_dCompiler_dBase_dSource_dposLine dtb__93) = (Vuna_dCompiler_dBase_dSource.v_Vuna_dCompiler_dBase_dSource_dposLine dtb__89)) then ((Vuna_dCompiler_dBase_dSource.v_Vuna_dCompiler_dBase_dSource_dposCol dtb__93) = ((Vuna_dCompiler_dBase_dSource.v_Vuna_dCompiler_dBase_dSource_dposCol dtb__89) + 1)) else false) then (Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Just ({ Base_dData_dPair.f_Base_dData_dPair_dPair_first = ("?" ^ dtb__94); Base_dData_dPair.f_Base_dData_dPair_dPair_second = { Vuna_dCompiler_dBase_dSource.f_Vuna_dCompiler_dBase_dSource_dSpan_spanFile = (v_Vuna_dCompiler_dFrontend_dParser_dSupport_dfileOf st); Vuna_dCompiler_dBase_dSource.f_Vuna_dCompiler_dBase_dSource_dSpan_spanStartLine = (Vuna_dCompiler_dBase_dSource.v_Vuna_dCompiler_dBase_dSource_dposLine dtb__89); Vuna_dCompiler_dBase_dSource.f_Vuna_dCompiler_dBase_dSource_dSpan_spanStartCol = (Vuna_dCompiler_dBase_dSource.v_Vuna_dCompiler_dBase_dSource_dposCol dtb__89); Vuna_dCompiler_dBase_dSource.f_Vuna_dCompiler_dBase_dSource_dSpan_spanEndLine = (Vuna_dCompiler_dBase_dSource.v_Vuna_dCompiler_dBase_dSource_dposLine dtb__93); Vuna_dCompiler_dBase_dSource.f_Vuna_dCompiler_dBase_dSource_dSpan_spanEndCol = ((Vuna_dCompiler_dBase_dSource.v_Vuna_dCompiler_dBase_dSource_dposCol dtb__93) + (bi_strLength dtb__94)); Vuna_dCompiler_dBase_dSource.f_Vuna_dCompiler_dBase_dSource_dSpan_spanStartOffset = (Vuna_dCompiler_dBase_dSource.v_Vuna_dCompiler_dBase_dSource_dposOffset dtb__89); Vuna_dCompiler_dBase_dSource.f_Vuna_dCompiler_dBase_dSource_dSpan_spanEndOffset = ((Vuna_dCompiler_dBase_dSource.v_Vuna_dCompiler_dBase_dSource_dposOffset dtb__93) + (bi_strLength dtb__94)) } })) else Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Nothing)
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

# 268 "Vuna/Compiler/Frontend/Parser/Support.vuna"
let v_Vuna_dCompiler_dFrontend_dParser_dSupport_dstartsAtom = (fun (st : t_Vuna_dCompiler_dFrontend_dParser_dSupport_dPState) -> ((fun nd_uscrut1 -> (match nd_uscrut1 with
  | { Vuna_dCompiler_dFrontend_dLexer.f_Vuna_dCompiler_dFrontend_dLexer_dPTok_ptokTok = dtb__95; Vuna_dCompiler_dFrontend_dLexer.f_Vuna_dCompiler_dFrontend_dLexer_dPTok_ptokPos = dtb__96 } -> (match dtb__95 with
  | Vuna_dCompiler_dFrontend_dLexer.C_Vuna_dCompiler_dFrontend_dLexer_dTok_TSym (dtb__97) -> (if (dtb__97 = "(") then true else (if (dtb__97 = "[") then true else (if (dtb__97 = "?") then (match (v_Vuna_dCompiler_dFrontend_dParser_dSupport_dholeAtomAt st) with
  | Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Just (dtb__98) -> true
  | Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Nothing -> false
  | _ -> failwith "DT: impossible branch"
) else false)))
  | Vuna_dCompiler_dFrontend_dLexer.C_Vuna_dCompiler_dFrontend_dLexer_dTok_TKw (dtb__99) -> (if (dtb__99 = "Type") then true else false)
  | Vuna_dCompiler_dFrontend_dLexer.C_Vuna_dCompiler_dFrontend_dLexer_dTok_TTmpl (dtb__100, dtb__101, dtb__102) -> true
  | Vuna_dCompiler_dFrontend_dLexer.C_Vuna_dCompiler_dFrontend_dLexer_dTok_TStr (dtb__103) -> true
  | Vuna_dCompiler_dFrontend_dLexer.C_Vuna_dCompiler_dFrontend_dLexer_dTok_TFloat (dtb__104) -> true
  | Vuna_dCompiler_dFrontend_dLexer.C_Vuna_dCompiler_dFrontend_dLexer_dTok_TInt (dtb__105) -> true
  | Vuna_dCompiler_dFrontend_dLexer.C_Vuna_dCompiler_dFrontend_dLexer_dTok_TIdent (dtb__106) -> true
  | _ -> false
)
  | _ -> failwith "DT: impossible branch"
)) (v_Vuna_dCompiler_dFrontend_dParser_dSupport_dpeekTok st)))

# 302 "Vuna/Compiler/Frontend/Parser/Support.vuna"
let v_Vuna_dCompiler_dFrontend_dParser_dSupport_dstartsPatternAtom = (fun (st : t_Vuna_dCompiler_dFrontend_dParser_dSupport_dPState) -> ((fun nd_uscrut1 -> (match nd_uscrut1 with
  | { Vuna_dCompiler_dFrontend_dLexer.f_Vuna_dCompiler_dFrontend_dLexer_dPTok_ptokTok = dtb__107; Vuna_dCompiler_dFrontend_dLexer.f_Vuna_dCompiler_dFrontend_dLexer_dPTok_ptokPos = dtb__108 } -> (match dtb__107 with
  | Vuna_dCompiler_dFrontend_dLexer.C_Vuna_dCompiler_dFrontend_dLexer_dTok_TSym (dtb__109) -> (if (dtb__109 = "(") then true else (if (dtb__109 = "[") then true else false))
  | Vuna_dCompiler_dFrontend_dLexer.C_Vuna_dCompiler_dFrontend_dLexer_dTok_TTmpl (dtb__110, dtb__111, dtb__112) -> true
  | Vuna_dCompiler_dFrontend_dLexer.C_Vuna_dCompiler_dFrontend_dLexer_dTok_TStr (dtb__113) -> true
  | Vuna_dCompiler_dFrontend_dLexer.C_Vuna_dCompiler_dFrontend_dLexer_dTok_TInt (dtb__114) -> true
  | Vuna_dCompiler_dFrontend_dLexer.C_Vuna_dCompiler_dFrontend_dLexer_dTok_TIdent (dtb__115) -> true
  | _ -> false
)
  | _ -> failwith "DT: impossible branch"
)) (v_Vuna_dCompiler_dFrontend_dParser_dSupport_dpeekTok st)))

# 315 "Vuna/Compiler/Frontend/Parser/Support.vuna"
let v_Vuna_dCompiler_dFrontend_dParser_dSupport_disSyntaxSym = (fun (op : string) -> (if (op = "=") then true else (if (op = ":") then true else (if (op = ",") then true else (if (op = ";") then true else (if (op = "|") then true else (if (op = "=>") then true else (if (op = "<-") then true else (if (op = "\\") then true else (if (op = ".") then true else (if (op = "..") then true else (if (op = "@") then true else (if (op = "(") then true else (if (op = ")") then true else (if (op = "[") then true else (if (op = "]") then true else (if (op = "{") then true else (if (op = "}") then true else false))))))))))))))))))

# 342 "Vuna/Compiler/Frontend/Parser/Support.vuna"
let v_Vuna_dCompiler_dFrontend_dParser_dSupport_disReservedValueName = (fun (name : string) -> (if (if (v_Vuna_dCompiler_dFrontend_dParser_dSupport_disSyntaxSym name) then true else (name = "->")) then true else (name = "`")))

# 230 "Vuna/Compiler/Frontend/Parser/Support.vuna"
let v_Vuna_dCompiler_dFrontend_dParser_dSupport_dexpectValueName = (fun (st : t_Vuna_dCompiler_dFrontend_dParser_dSupport_dPState) -> ((fun nd_uscrut1 -> (match nd_uscrut1 with
  | { Vuna_dCompiler_dFrontend_dLexer.f_Vuna_dCompiler_dFrontend_dLexer_dPTok_ptokTok = dtb__116; Vuna_dCompiler_dFrontend_dLexer.f_Vuna_dCompiler_dFrontend_dLexer_dPTok_ptokPos = dtb__117 } -> (match dtb__116 with
  | Vuna_dCompiler_dFrontend_dLexer.C_Vuna_dCompiler_dFrontend_dLexer_dTok_TSym (dtb__118) -> (if (v_Vuna_dCompiler_dFrontend_dParser_dSupport_disReservedValueName dtb__118) then (((Vuna_dCompiler_dBase_dDiagnostics_dFrontend.v_Vuna_dCompiler_dBase_dDiagnostics_dFrontend_dpsErr1At (v_Vuna_dCompiler_dFrontend_dParser_dSupport_dtokSpan st)) (Vuna_dCompiler_dBase_dDiagnostics_dFrontend.C_Vuna_dCompiler_dBase_dDiagnostics_dFrontend_dPsDiag_ExpectedToken ("value name"))) "value name") else (Vuna_dCompiler_dBase_dDiag.C_Vuna_dCompiler_dBase_dDiag_dCheck_OkC ({ Base_dData_dPair.f_Base_dData_dPair_dPair_first = dtb__118; Base_dData_dPair.f_Base_dData_dPair_dPair_second = (v_Vuna_dCompiler_dFrontend_dParser_dSupport_dadvance st) })))
  | Vuna_dCompiler_dFrontend_dLexer.C_Vuna_dCompiler_dFrontend_dLexer_dTok_TIdent (dtb__119) -> (if (v_Vuna_dCompiler_dFrontend_dParser_dSupport_disReservedValueName dtb__119) then (((Vuna_dCompiler_dBase_dDiagnostics_dFrontend.v_Vuna_dCompiler_dBase_dDiagnostics_dFrontend_dpsErr1At (v_Vuna_dCompiler_dFrontend_dParser_dSupport_dtokSpan st)) (Vuna_dCompiler_dBase_dDiagnostics_dFrontend.C_Vuna_dCompiler_dBase_dDiagnostics_dFrontend_dPsDiag_ExpectedToken ("value name"))) "value name") else (Vuna_dCompiler_dBase_dDiag.C_Vuna_dCompiler_dBase_dDiag_dCheck_OkC ({ Base_dData_dPair.f_Base_dData_dPair_dPair_first = dtb__119; Base_dData_dPair.f_Base_dData_dPair_dPair_second = (v_Vuna_dCompiler_dFrontend_dParser_dSupport_dadvance st) })))
  | _ -> ((Vuna_dCompiler_dBase_dDiagnostics_dFrontend.v_Vuna_dCompiler_dBase_dDiagnostics_dFrontend_dpsErr0At (v_Vuna_dCompiler_dFrontend_dParser_dSupport_dtokSpan st)) Vuna_dCompiler_dBase_dDiagnostics_dFrontend.C_Vuna_dCompiler_dBase_dDiagnostics_dFrontend_dPsDiag_ExpectedIdentifier)
)
  | _ -> failwith "DT: impossible branch"
)) (v_Vuna_dCompiler_dFrontend_dParser_dSupport_dpeekTok st)))

# 347 "Vuna/Compiler/Frontend/Parser/Support.vuna"
let v_Vuna_dCompiler_dFrontend_dParser_dSupport_dcloseParenNext = (fun (st : t_Vuna_dCompiler_dFrontend_dParser_dSupport_dPState) -> ((fun nd_uscrut1 -> (match nd_uscrut1 with
  | Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Just (dtb__120) -> (match dtb__120 with
  | { Vuna_dCompiler_dFrontend_dLexer.f_Vuna_dCompiler_dFrontend_dLexer_dPTok_ptokTok = dtb__121; Vuna_dCompiler_dFrontend_dLexer.f_Vuna_dCompiler_dFrontend_dLexer_dPTok_ptokPos = dtb__122 } -> (match dtb__121 with
  | Vuna_dCompiler_dFrontend_dLexer.C_Vuna_dCompiler_dFrontend_dLexer_dTok_TSym (dtb__123) -> (if (dtb__123 = ")") then true else false)
  | _ -> false
)
  | _ -> failwith "DT: impossible branch"
)
  | _ -> false
)) ((v_Vuna_dCompiler_dFrontend_dParser_dSupport_dpeekTokAt st) 1)))

# 370 "Vuna/Compiler/Frontend/Parser/Support.vuna"
let v_Vuna_dCompiler_dFrontend_dParser_dSupport_dminusLiteralAt = (fun (p : Vuna_dCompiler_dBase_dSource.t_Vuna_dCompiler_dBase_dSource_dPos) (st : t_Vuna_dCompiler_dFrontend_dParser_dSupport_dPState) -> ((fun nd_uscrut2 -> (match nd_uscrut2 with
  | Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Just (dtb__124) -> (match dtb__124 with
  | { Vuna_dCompiler_dFrontend_dLexer.f_Vuna_dCompiler_dFrontend_dLexer_dPTok_ptokTok = dtb__125; Vuna_dCompiler_dFrontend_dLexer.f_Vuna_dCompiler_dFrontend_dLexer_dPTok_ptokPos = dtb__126 } -> (match dtb__125 with
  | Vuna_dCompiler_dFrontend_dLexer.C_Vuna_dCompiler_dFrontend_dLexer_dTok_TFloat (dtb__127) -> (if ((Vuna_dCompiler_dBase_dSource.v_Vuna_dCompiler_dBase_dSource_dposLine dtb__126) = (Vuna_dCompiler_dBase_dSource.v_Vuna_dCompiler_dBase_dSource_dposLine p)) then ((Vuna_dCompiler_dBase_dSource.v_Vuna_dCompiler_dBase_dSource_dposCol dtb__126) = ((Vuna_dCompiler_dBase_dSource.v_Vuna_dCompiler_dBase_dSource_dposCol p) + 1)) else false)
  | Vuna_dCompiler_dFrontend_dLexer.C_Vuna_dCompiler_dFrontend_dLexer_dTok_TInt (dtb__128) -> (if ((Vuna_dCompiler_dBase_dSource.v_Vuna_dCompiler_dBase_dSource_dposLine dtb__126) = (Vuna_dCompiler_dBase_dSource.v_Vuna_dCompiler_dBase_dSource_dposLine p)) then ((Vuna_dCompiler_dBase_dSource.v_Vuna_dCompiler_dBase_dSource_dposCol dtb__126) = ((Vuna_dCompiler_dBase_dSource.v_Vuna_dCompiler_dBase_dSource_dposCol p) + 1)) else false)
  | _ -> false
)
  | _ -> failwith "DT: impossible branch"
)
  | _ -> false
)) ((v_Vuna_dCompiler_dFrontend_dParser_dSupport_dpeekTokAt st) 2)))

# 356 "Vuna/Compiler/Frontend/Parser/Support.vuna"
let v_Vuna_dCompiler_dFrontend_dParser_dSupport_dsectionOpAt = (fun (st : t_Vuna_dCompiler_dFrontend_dParser_dSupport_dPState) -> ((fun nd_uscrut1 -> (match nd_uscrut1 with
  | Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Just (dtb__129) -> (match dtb__129 with
  | { Vuna_dCompiler_dFrontend_dLexer.f_Vuna_dCompiler_dFrontend_dLexer_dPTok_ptokTok = dtb__130; Vuna_dCompiler_dFrontend_dLexer.f_Vuna_dCompiler_dFrontend_dLexer_dPTok_ptokPos = dtb__131 } -> (match dtb__130 with
  | Vuna_dCompiler_dFrontend_dLexer.C_Vuna_dCompiler_dFrontend_dLexer_dTok_TSym (dtb__132) -> (if (v_Vuna_dCompiler_dFrontend_dParser_dSupport_disReservedValueName dtb__132) then Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Nothing else (if (dtb__132 = "?") then (match (v_Vuna_dCompiler_dFrontend_dParser_dSupport_dholeAtomAt (v_Vuna_dCompiler_dFrontend_dParser_dSupport_dadvance st)) with
  | Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Just (dtb__133) -> Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Nothing
  | Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Nothing -> (Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Just (dtb__132))
  | _ -> failwith "DT: impossible branch"
) else (if (if (dtb__132 = "-") then ((v_Vuna_dCompiler_dFrontend_dParser_dSupport_dminusLiteralAt dtb__131) st) else false) then Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Nothing else (Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Just (dtb__132)))))
  | _ -> Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Nothing
)
  | _ -> failwith "DT: impossible branch"
)
  | _ -> Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Nothing
)) ((v_Vuna_dCompiler_dFrontend_dParser_dSupport_dpeekTokAt st) 1)))

# 377 "Vuna/Compiler/Frontend/Parser/Support.vuna"
let rec v_Vuna_dCompiler_dFrontend_dParser_dSupport_dcountArrows = (fun (mc0 : Vuna_dCompiler_dFrontend_dAst.t_Vuna_dCompiler_dFrontend_dAst_dExpr) -> (match mc0 with
  | Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dExpr_EApp (dtb__134, dtb__135, dtb__136) -> (match dtb__134 with
  | Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dExpr_EVar (dtb__137, dtb__138) -> (if (dtb__137 = "->") then (match dtb__135 with
  | Base_dData_dList.C_Base_dData_dList_dList__x58__x58_ (dtb__139, dtb__140) -> (match dtb__140 with
  | Base_dData_dList.C_Base_dData_dList_dList__x58__x58_ (dtb__141, dtb__142) -> (match dtb__142 with
  | Base_dData_dList.C_Base_dData_dList_dList_Nil -> (1 + (v_Vuna_dCompiler_dFrontend_dParser_dSupport_dcountArrows dtb__141))
  | _ -> 0
)
  | _ -> 0
)
  | _ -> 0
) else 0)
  | _ -> 0
)
  | Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dExpr_EInfix (dtb__143, dtb__144, dtb__145, dtb__146) -> (if (dtb__143 = "->") then (1 + (v_Vuna_dCompiler_dFrontend_dParser_dSupport_dcountArrows dtb__145)) else 0)
  | _ -> 0
))

# 382 "Vuna/Compiler/Frontend/Parser/Support.vuna"
let v_Vuna_dCompiler_dFrontend_dParser_dSupport_dterminatesExpression = (fun (mc0 : Vuna_dCompiler_dFrontend_dLexer.t_Vuna_dCompiler_dFrontend_dLexer_dPTok) -> (match mc0 with
  | { Vuna_dCompiler_dFrontend_dLexer.f_Vuna_dCompiler_dFrontend_dLexer_dPTok_ptokTok = dtb__147; Vuna_dCompiler_dFrontend_dLexer.f_Vuna_dCompiler_dFrontend_dLexer_dPTok_ptokPos = dtb__148 } -> (match dtb__147 with
  | Vuna_dCompiler_dFrontend_dLexer.C_Vuna_dCompiler_dFrontend_dLexer_dTok_TKw (dtb__149) -> (if (dtb__149 = "else") then true else (if (dtb__149 = "in") then true else (if (dtb__149 = "then") then true else false)))
  | Vuna_dCompiler_dFrontend_dLexer.C_Vuna_dCompiler_dFrontend_dLexer_dTok_TSym (dtb__150) -> (if (dtb__150 = ")") then true else (if (dtb__150 = "]") then true else (if (dtb__150 = ",") then true else false)))
  | _ -> false
)
  | _ -> failwith "DT: impossible branch"
))

# 391 "Vuna/Compiler/Frontend/Parser/Support.vuna"
let v_Vuna_dCompiler_dFrontend_dParser_dSupport_dbadCaseIndent = (fun (st : t_Vuna_dCompiler_dFrontend_dParser_dSupport_dPState) (altCol : int) -> (if (v_Vuna_dCompiler_dFrontend_dParser_dSupport_disEof st) then false else (match (v_Vuna_dCompiler_dFrontend_dParser_dSupport_dpeekPos st) with
  | { Vuna_dCompiler_dBase_dSource.f_Vuna_dCompiler_dBase_dSource_dPos_posLine = dtb__151; Vuna_dCompiler_dBase_dSource.f_Vuna_dCompiler_dBase_dSource_dPos_posCol = dtb__152; Vuna_dCompiler_dBase_dSource.f_Vuna_dCompiler_dBase_dSource_dPos_posOffset = dtb__153; Vuna_dCompiler_dBase_dSource.f_Vuna_dCompiler_dBase_dSource_dPos_posEndOffset = dtb__154 } -> (if (dtb__152 > altCol) then (if (v_Vuna_dCompiler_dFrontend_dParser_dSupport_dterminatesExpression (v_Vuna_dCompiler_dFrontend_dParser_dSupport_dpeekTok st)) then false else true) else false)
  | _ -> failwith "DT: impossible branch"
)))
