open Vuna_runtime
type t_Vuna_dCompiler_dFrontend_dParser_dSupport_dParseMode = C_Vuna_dCompiler_dFrontend_dParser_dSupport_dParseMode_PmStrict | C_Vuna_dCompiler_dFrontend_dParser_dSupport_dParseMode_PmTool
and t_Vuna_dCompiler_dFrontend_dParser_dSupport_dPState = { f_Vuna_dCompiler_dFrontend_dParser_dSupport_dPState_fileOf : string; f_Vuna_dCompiler_dFrontend_dParser_dSupport_dPState_toksOf : Vuna_dCompiler_dFrontend_dLexer.t_Vuna_dCompiler_dFrontend_dLexer_dPTok Base_dList.t_Base_dList_dList; f_Vuna_dCompiler_dFrontend_dParser_dSupport_dPState_lastPos : Vuna_dCompiler_dBase_dSource.t_Vuna_dCompiler_dBase_dSource_dPos; f_Vuna_dCompiler_dFrontend_dParser_dSupport_dPState_toksLeft : int; f_Vuna_dCompiler_dFrontend_dParser_dSupport_dPState_pmodeOf : t_Vuna_dCompiler_dFrontend_dParser_dSupport_dParseMode }

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
let v_Vuna_dCompiler_dFrontend_dParser_dSupport_dmkState = (fun file toks mode -> { f_Vuna_dCompiler_dFrontend_dParser_dSupport_dPState_fileOf = file; f_Vuna_dCompiler_dFrontend_dParser_dSupport_dPState_toksOf = toks; f_Vuna_dCompiler_dFrontend_dParser_dSupport_dPState_lastPos = { Vuna_dCompiler_dBase_dSource.f_Vuna_dCompiler_dBase_dSource_dPos_posLine = 1; Vuna_dCompiler_dBase_dSource.f_Vuna_dCompiler_dBase_dSource_dPos_posCol = 0; Vuna_dCompiler_dBase_dSource.f_Vuna_dCompiler_dBase_dSource_dPos_posOffset = 0 }; f_Vuna_dCompiler_dFrontend_dParser_dSupport_dPState_toksLeft = (Base_dList.v_Base_dList_dlength toks); f_Vuna_dCompiler_dFrontend_dParser_dSupport_dPState_pmodeOf = mode })

# 44 "Vuna/Compiler/Frontend/Parser/Support.vuna"
let v_Vuna_dCompiler_dFrontend_dParser_dSupport_dmkStateAt = (fun file toks last count mode -> { f_Vuna_dCompiler_dFrontend_dParser_dSupport_dPState_fileOf = file; f_Vuna_dCompiler_dFrontend_dParser_dSupport_dPState_toksOf = toks; f_Vuna_dCompiler_dFrontend_dParser_dSupport_dPState_lastPos = last; f_Vuna_dCompiler_dFrontend_dParser_dSupport_dPState_toksLeft = count; f_Vuna_dCompiler_dFrontend_dParser_dSupport_dPState_pmodeOf = mode })

# 53 "Vuna/Compiler/Frontend/Parser/Support.vuna"
let v_Vuna_dCompiler_dFrontend_dParser_dSupport_dpeekTok = (fun mc0 -> (match mc0 with
  | { f_Vuna_dCompiler_dFrontend_dParser_dSupport_dPState_fileOf = dtb__10; f_Vuna_dCompiler_dFrontend_dParser_dSupport_dPState_toksOf = dtb__11; f_Vuna_dCompiler_dFrontend_dParser_dSupport_dPState_lastPos = dtb__12; f_Vuna_dCompiler_dFrontend_dParser_dSupport_dPState_toksLeft = dtb__13; f_Vuna_dCompiler_dFrontend_dParser_dSupport_dPState_pmodeOf = dtb__14 } -> (match dtb__11 with
  | Base_dList.C_Base_dList_dList_Nil -> { Vuna_dCompiler_dFrontend_dLexer.f_Vuna_dCompiler_dFrontend_dLexer_dPTok_ptokTok = Vuna_dCompiler_dFrontend_dLexer.C_Vuna_dCompiler_dFrontend_dLexer_dTok_TEof; Vuna_dCompiler_dFrontend_dLexer.f_Vuna_dCompiler_dFrontend_dLexer_dPTok_ptokPos = { Vuna_dCompiler_dBase_dSource.f_Vuna_dCompiler_dBase_dSource_dPos_posLine = 1; Vuna_dCompiler_dBase_dSource.f_Vuna_dCompiler_dBase_dSource_dPos_posCol = 1; Vuna_dCompiler_dBase_dSource.f_Vuna_dCompiler_dBase_dSource_dPos_posOffset = 0 } }
  | Base_dList.C_Base_dList_dList__x58__x58_ (dtb__15, dtb__16) -> dtb__15
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
))

# 57 "Vuna/Compiler/Frontend/Parser/Support.vuna"
let v_Vuna_dCompiler_dFrontend_dParser_dSupport_dpeekPos = (fun st -> ((v_Vuna_dCompiler_dFrontend_dParser_dSupport_dpeekTok st)).Vuna_dCompiler_dFrontend_dLexer.f_Vuna_dCompiler_dFrontend_dLexer_dPTok_ptokPos)

# 71 "Vuna/Compiler/Frontend/Parser/Support.vuna"
let v_Vuna_dCompiler_dFrontend_dParser_dSupport_dlastPos = (fun mc0 -> (match mc0 with
  | { f_Vuna_dCompiler_dFrontend_dParser_dSupport_dPState_fileOf = dtb__17; f_Vuna_dCompiler_dFrontend_dParser_dSupport_dPState_toksOf = dtb__18; f_Vuna_dCompiler_dFrontend_dParser_dSupport_dPState_lastPos = dtb__19; f_Vuna_dCompiler_dFrontend_dParser_dSupport_dPState_toksLeft = dtb__20; f_Vuna_dCompiler_dFrontend_dParser_dSupport_dPState_pmodeOf = dtb__21 } -> dtb__19
  | _ -> failwith "DT: impossible branch"
))

# 48 "Vuna/Compiler/Frontend/Parser/Support.vuna"
let v_Vuna_dCompiler_dFrontend_dParser_dSupport_dspanOf = (fun st st2 -> { Vuna_dCompiler_dBase_dSource.f_Vuna_dCompiler_dBase_dSource_dSpan_spanFile = (v_Vuna_dCompiler_dFrontend_dParser_dSupport_dfileOf st); Vuna_dCompiler_dBase_dSource.f_Vuna_dCompiler_dBase_dSource_dSpan_spanStartLine = (Vuna_dCompiler_dBase_dSource.v_Vuna_dCompiler_dBase_dSource_dposLine (v_Vuna_dCompiler_dFrontend_dParser_dSupport_dpeekPos st)); Vuna_dCompiler_dBase_dSource.f_Vuna_dCompiler_dBase_dSource_dSpan_spanStartCol = (Vuna_dCompiler_dBase_dSource.v_Vuna_dCompiler_dBase_dSource_dposCol (v_Vuna_dCompiler_dFrontend_dParser_dSupport_dpeekPos st)); Vuna_dCompiler_dBase_dSource.f_Vuna_dCompiler_dBase_dSource_dSpan_spanEndLine = (Vuna_dCompiler_dBase_dSource.v_Vuna_dCompiler_dBase_dSource_dposLine (v_Vuna_dCompiler_dFrontend_dParser_dSupport_dlastPos st2)); Vuna_dCompiler_dBase_dSource.f_Vuna_dCompiler_dBase_dSource_dSpan_spanEndCol = (Vuna_dCompiler_dBase_dSource.v_Vuna_dCompiler_dBase_dSource_dposCol (v_Vuna_dCompiler_dFrontend_dParser_dSupport_dlastPos st2)); Vuna_dCompiler_dBase_dSource.f_Vuna_dCompiler_dBase_dSource_dSpan_spanStartOffset = (Vuna_dCompiler_dBase_dSource.v_Vuna_dCompiler_dBase_dSource_dposOffset (v_Vuna_dCompiler_dFrontend_dParser_dSupport_dpeekPos st)); Vuna_dCompiler_dBase_dSource.f_Vuna_dCompiler_dBase_dSource_dSpan_spanEndOffset = (Vuna_dCompiler_dBase_dSource.v_Vuna_dCompiler_dBase_dSource_dposOffset (v_Vuna_dCompiler_dFrontend_dParser_dSupport_dlastPos st2)) })

# 62 "Vuna/Compiler/Frontend/Parser/Support.vuna"
let v_Vuna_dCompiler_dFrontend_dParser_dSupport_dtokSpan = (fun st -> ((fun nd_uscrut1 -> (match nd_uscrut1 with
  | { Vuna_dCompiler_dFrontend_dLexer.f_Vuna_dCompiler_dFrontend_dLexer_dPTok_ptokTok = dtb__22; Vuna_dCompiler_dFrontend_dLexer.f_Vuna_dCompiler_dFrontend_dLexer_dPTok_ptokPos = dtb__23 } -> (match dtb__22 with
  | Vuna_dCompiler_dFrontend_dLexer.C_Vuna_dCompiler_dFrontend_dLexer_dTok_TEof -> ((fun p -> { Vuna_dCompiler_dBase_dSource.f_Vuna_dCompiler_dBase_dSource_dSpan_spanFile = (v_Vuna_dCompiler_dFrontend_dParser_dSupport_dfileOf st); Vuna_dCompiler_dBase_dSource.f_Vuna_dCompiler_dBase_dSource_dSpan_spanStartLine = (Vuna_dCompiler_dBase_dSource.v_Vuna_dCompiler_dBase_dSource_dposLine p); Vuna_dCompiler_dBase_dSource.f_Vuna_dCompiler_dBase_dSource_dSpan_spanStartCol = (Vuna_dCompiler_dBase_dSource.v_Vuna_dCompiler_dBase_dSource_dposCol p); Vuna_dCompiler_dBase_dSource.f_Vuna_dCompiler_dBase_dSource_dSpan_spanEndLine = (Vuna_dCompiler_dBase_dSource.v_Vuna_dCompiler_dBase_dSource_dposLine p); Vuna_dCompiler_dBase_dSource.f_Vuna_dCompiler_dBase_dSource_dSpan_spanEndCol = (Vuna_dCompiler_dBase_dSource.v_Vuna_dCompiler_dBase_dSource_dposCol p); Vuna_dCompiler_dBase_dSource.f_Vuna_dCompiler_dBase_dSource_dSpan_spanStartOffset = (Vuna_dCompiler_dBase_dSource.v_Vuna_dCompiler_dBase_dSource_dposOffset p); Vuna_dCompiler_dBase_dSource.f_Vuna_dCompiler_dBase_dSource_dSpan_spanEndOffset = (Vuna_dCompiler_dBase_dSource.v_Vuna_dCompiler_dBase_dSource_dposOffset p) }) (v_Vuna_dCompiler_dFrontend_dParser_dSupport_dlastPos st))
  | _ -> { Vuna_dCompiler_dBase_dSource.f_Vuna_dCompiler_dBase_dSource_dSpan_spanFile = (v_Vuna_dCompiler_dFrontend_dParser_dSupport_dfileOf st); Vuna_dCompiler_dBase_dSource.f_Vuna_dCompiler_dBase_dSource_dSpan_spanStartLine = (Vuna_dCompiler_dBase_dSource.v_Vuna_dCompiler_dBase_dSource_dposLine dtb__23); Vuna_dCompiler_dBase_dSource.f_Vuna_dCompiler_dBase_dSource_dSpan_spanStartCol = (Vuna_dCompiler_dBase_dSource.v_Vuna_dCompiler_dBase_dSource_dposCol dtb__23); Vuna_dCompiler_dBase_dSource.f_Vuna_dCompiler_dBase_dSource_dSpan_spanEndLine = (Vuna_dCompiler_dBase_dSource.v_Vuna_dCompiler_dBase_dSource_dposLine dtb__23); Vuna_dCompiler_dBase_dSource.f_Vuna_dCompiler_dBase_dSource_dSpan_spanEndCol = (Vuna_dCompiler_dBase_dSource.v_Vuna_dCompiler_dBase_dSource_dposCol dtb__23); Vuna_dCompiler_dBase_dSource.f_Vuna_dCompiler_dBase_dSource_dSpan_spanStartOffset = (Vuna_dCompiler_dBase_dSource.v_Vuna_dCompiler_dBase_dSource_dposOffset dtb__23); Vuna_dCompiler_dBase_dSource.f_Vuna_dCompiler_dBase_dSource_dSpan_spanEndOffset = (Vuna_dCompiler_dBase_dSource.v_Vuna_dCompiler_dBase_dSource_dposOffset dtb__23) }
)
  | _ -> failwith "DT: impossible branch"
)) (v_Vuna_dCompiler_dFrontend_dParser_dSupport_dpeekTok st)))

# 74 "Vuna/Compiler/Frontend/Parser/Support.vuna"
let v_Vuna_dCompiler_dFrontend_dParser_dSupport_dadvance = (fun mc0 -> (match mc0 with
  | { f_Vuna_dCompiler_dFrontend_dParser_dSupport_dPState_fileOf = dtb__24; f_Vuna_dCompiler_dFrontend_dParser_dSupport_dPState_toksOf = dtb__25; f_Vuna_dCompiler_dFrontend_dParser_dSupport_dPState_lastPos = dtb__26; f_Vuna_dCompiler_dFrontend_dParser_dSupport_dPState_toksLeft = dtb__27; f_Vuna_dCompiler_dFrontend_dParser_dSupport_dPState_pmodeOf = dtb__28 } -> (match dtb__25 with
  | Base_dList.C_Base_dList_dList_Nil -> { f_Vuna_dCompiler_dFrontend_dParser_dSupport_dPState_fileOf = dtb__24; f_Vuna_dCompiler_dFrontend_dParser_dSupport_dPState_toksOf = dtb__25; f_Vuna_dCompiler_dFrontend_dParser_dSupport_dPState_lastPos = dtb__26; f_Vuna_dCompiler_dFrontend_dParser_dSupport_dPState_toksLeft = dtb__27; f_Vuna_dCompiler_dFrontend_dParser_dSupport_dPState_pmodeOf = dtb__28 }
  | Base_dList.C_Base_dList_dList__x58__x58_ (dtb__29, dtb__30) -> ((fun nd_uscrut9 -> (match nd_uscrut9 with
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

# 80 "Vuna/Compiler/Frontend/Parser/Support.vuna"
let v_Vuna_dCompiler_dFrontend_dParser_dSupport_disEof = (fun st -> ((fun nd_uscrut1 -> (match nd_uscrut1 with
  | { Vuna_dCompiler_dFrontend_dLexer.f_Vuna_dCompiler_dFrontend_dLexer_dPTok_ptokTok = dtb__33; Vuna_dCompiler_dFrontend_dLexer.f_Vuna_dCompiler_dFrontend_dLexer_dPTok_ptokPos = dtb__34 } -> (match dtb__33 with
  | Vuna_dCompiler_dFrontend_dLexer.C_Vuna_dCompiler_dFrontend_dLexer_dTok_TEof -> true
  | _ -> false
)
  | _ -> failwith "DT: impossible branch"
)) (v_Vuna_dCompiler_dFrontend_dParser_dSupport_dpeekTok st)))

# 108 "Vuna/Compiler/Frontend/Parser/Support.vuna"
let v_Vuna_dCompiler_dFrontend_dParser_dSupport_dstateFuel = (fun st -> ((128 * (st).f_Vuna_dCompiler_dFrontend_dParser_dSupport_dPState_toksLeft) + 1024))

# 111 "Vuna/Compiler/Frontend/Parser/Support.vuna"
let v_Vuna_dCompiler_dFrontend_dParser_dSupport_dsameLineState = (fun st -> (match (v_Vuna_dCompiler_dFrontend_dParser_dSupport_dpeekPos st) with
  | { Vuna_dCompiler_dBase_dSource.f_Vuna_dCompiler_dBase_dSource_dPos_posLine = dtb__35; Vuna_dCompiler_dBase_dSource.f_Vuna_dCompiler_dBase_dSource_dPos_posCol = dtb__36; Vuna_dCompiler_dBase_dSource.f_Vuna_dCompiler_dBase_dSource_dPos_posOffset = dtb__37 } -> { f_Vuna_dCompiler_dFrontend_dParser_dSupport_dPState_fileOf = (v_Vuna_dCompiler_dFrontend_dParser_dSupport_dfileOf st); f_Vuna_dCompiler_dFrontend_dParser_dSupport_dPState_toksOf = (st).f_Vuna_dCompiler_dFrontend_dParser_dSupport_dPState_toksOf; f_Vuna_dCompiler_dFrontend_dParser_dSupport_dPState_lastPos = { Vuna_dCompiler_dBase_dSource.f_Vuna_dCompiler_dBase_dSource_dPos_posLine = dtb__35; Vuna_dCompiler_dBase_dSource.f_Vuna_dCompiler_dBase_dSource_dPos_posCol = 0; Vuna_dCompiler_dBase_dSource.f_Vuna_dCompiler_dBase_dSource_dPos_posOffset = 0 }; f_Vuna_dCompiler_dFrontend_dParser_dSupport_dPState_toksLeft = (st).f_Vuna_dCompiler_dFrontend_dParser_dSupport_dPState_toksLeft; f_Vuna_dCompiler_dFrontend_dParser_dSupport_dPState_pmodeOf = (v_Vuna_dCompiler_dFrontend_dParser_dSupport_dpmodeOf st) }
  | _ -> failwith "DT: impossible branch"
))

# 115 "Vuna/Compiler/Frontend/Parser/Support.vuna"
let v_Vuna_dCompiler_dFrontend_dParser_dSupport_datSym = (fun st s -> ((fun nd_uscrut2 -> (match nd_uscrut2 with
  | { Vuna_dCompiler_dFrontend_dLexer.f_Vuna_dCompiler_dFrontend_dLexer_dPTok_ptokTok = dtb__38; Vuna_dCompiler_dFrontend_dLexer.f_Vuna_dCompiler_dFrontend_dLexer_dPTok_ptokPos = dtb__39 } -> (match dtb__38 with
  | Vuna_dCompiler_dFrontend_dLexer.C_Vuna_dCompiler_dFrontend_dLexer_dTok_TSym (dtb__40) -> (dtb__40 = s)
  | _ -> false
)
  | _ -> failwith "DT: impossible branch"
)) (v_Vuna_dCompiler_dFrontend_dParser_dSupport_dpeekTok st)))

# 121 "Vuna/Compiler/Frontend/Parser/Support.vuna"
let rec v_Vuna_dCompiler_dFrontend_dParser_dSupport_dnthTok = (fun mc0 mc1 -> (match mc0 with
  | Base_dList.C_Base_dList_dList__x58__x58_ (dtb__41, dtb__42) -> (if (mc1 <= 0) then (Base_dMaybe.C_Base_dMaybe_dMaybe_Just (dtb__41)) else ((v_Vuna_dCompiler_dFrontend_dParser_dSupport_dnthTok dtb__42) (mc1 - 1)))
  | Base_dList.C_Base_dList_dList_Nil -> Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing
  | _ -> failwith "DT: impossible branch"
))

# 125 "Vuna/Compiler/Frontend/Parser/Support.vuna"
let v_Vuna_dCompiler_dFrontend_dParser_dSupport_dpeekTokAt = (fun st n -> ((v_Vuna_dCompiler_dFrontend_dParser_dSupport_dnthTok (st).f_Vuna_dCompiler_dFrontend_dParser_dSupport_dPState_toksOf) n))

# 142 "Vuna/Compiler/Frontend/Parser/Support.vuna"
let rec v_Vuna_dCompiler_dFrontend_dParser_dSupport_dbinderNameTail = (fun fuel st n acc -> (if (fuel <= 0) then Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing else ((fun nd_uscrut4 -> (match nd_uscrut4 with
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Just (dtb__43) -> (match dtb__43 with
  | { Vuna_dCompiler_dFrontend_dLexer.f_Vuna_dCompiler_dFrontend_dLexer_dPTok_ptokTok = dtb__44; Vuna_dCompiler_dFrontend_dLexer.f_Vuna_dCompiler_dFrontend_dLexer_dPTok_ptokPos = dtb__45 } -> (match dtb__44 with
  | Vuna_dCompiler_dFrontend_dLexer.C_Vuna_dCompiler_dFrontend_dLexer_dTok_TSym (dtb__46) -> (if (dtb__46 = ":") then (Base_dMaybe.C_Base_dMaybe_dMaybe_Just ((Base_dList.v_Base_dList_dreverse acc))) else Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing)
  | Vuna_dCompiler_dFrontend_dLexer.C_Vuna_dCompiler_dFrontend_dLexer_dTok_TIdent (dtb__47) -> ((((v_Vuna_dCompiler_dFrontend_dParser_dSupport_dbinderNameTail (fuel - 1)) st) (n + 1)) (Base_dList.C_Base_dList_dList__x58__x58_ (dtb__47, acc)))
  | _ -> Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing
)
  | _ -> failwith "DT: impossible branch"
)
  | _ -> Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing
)) ((v_Vuna_dCompiler_dFrontend_dParser_dSupport_dpeekTokAt st) n))))

# 149 "Vuna/Compiler/Frontend/Parser/Support.vuna"
let v_Vuna_dCompiler_dFrontend_dParser_dSupport_dquantifiedHead = (fun st q -> ((fun nd_uscrut2 -> (match nd_uscrut2 with
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Just (dtb__48) -> (match dtb__48 with
  | { Vuna_dCompiler_dFrontend_dLexer.f_Vuna_dCompiler_dFrontend_dLexer_dPTok_ptokTok = dtb__49; Vuna_dCompiler_dFrontend_dLexer.f_Vuna_dCompiler_dFrontend_dLexer_dPTok_ptokPos = dtb__50 } -> (match dtb__49 with
  | Vuna_dCompiler_dFrontend_dLexer.C_Vuna_dCompiler_dFrontend_dLexer_dTok_TIdent (dtb__51) -> (match ((((v_Vuna_dCompiler_dFrontend_dParser_dSupport_dbinderNameTail 64) st) 2) Base_dList.C_Base_dList_dList_Nil) with
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Just (dtb__52) -> (Base_dMaybe.C_Base_dMaybe_dMaybe_Just ({ Base_dPair.f_Base_dPair_dPair_first = (Base_dMaybe.C_Base_dMaybe_dMaybe_Just (q)); Base_dPair.f_Base_dPair_dPair_second = (Base_dList.C_Base_dList_dList__x58__x58_ (dtb__51, dtb__52)) }))
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing -> Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing
  | _ -> failwith "DT: impossible branch"
)
  | _ -> Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing
)
  | _ -> failwith "DT: impossible branch"
)
  | _ -> Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing
)) ((v_Vuna_dCompiler_dFrontend_dParser_dSupport_dpeekTokAt st) 1)))

# 131 "Vuna/Compiler/Frontend/Parser/Support.vuna"
let v_Vuna_dCompiler_dFrontend_dParser_dSupport_dbinderHead = (fun st -> ((fun nd_uscrut1 -> (match nd_uscrut1 with
  | { Vuna_dCompiler_dFrontend_dLexer.f_Vuna_dCompiler_dFrontend_dLexer_dPTok_ptokTok = dtb__53; Vuna_dCompiler_dFrontend_dLexer.f_Vuna_dCompiler_dFrontend_dLexer_dPTok_ptokPos = dtb__54 } -> (match dtb__53 with
  | Vuna_dCompiler_dFrontend_dLexer.C_Vuna_dCompiler_dFrontend_dLexer_dTok_TInt (dtb__55) -> (if (dtb__55 = 0) then ((v_Vuna_dCompiler_dFrontend_dParser_dSupport_dquantifiedHead st) Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dQty_Q0) else (if (dtb__55 = 1) then ((v_Vuna_dCompiler_dFrontend_dParser_dSupport_dquantifiedHead st) Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dQty_Q1) else Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing))
  | Vuna_dCompiler_dFrontend_dLexer.C_Vuna_dCompiler_dFrontend_dLexer_dTok_TIdent (dtb__56) -> (match ((((v_Vuna_dCompiler_dFrontend_dParser_dSupport_dbinderNameTail 64) st) 1) Base_dList.C_Base_dList_dList_Nil) with
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Just (dtb__57) -> (Base_dMaybe.C_Base_dMaybe_dMaybe_Just ({ Base_dPair.f_Base_dPair_dPair_first = Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing; Base_dPair.f_Base_dPair_dPair_second = (Base_dList.C_Base_dList_dList__x58__x58_ (dtb__56, dtb__57)) }))
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing -> Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing
  | _ -> failwith "DT: impossible branch"
)
  | _ -> Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing
)
  | _ -> failwith "DT: impossible branch"
)) (v_Vuna_dCompiler_dFrontend_dParser_dSupport_dpeekTok st)))

# 156 "Vuna/Compiler/Frontend/Parser/Support.vuna"
let v_Vuna_dCompiler_dFrontend_dParser_dSupport_datKw = (fun st k -> ((fun nd_uscrut2 -> (match nd_uscrut2 with
  | { Vuna_dCompiler_dFrontend_dLexer.f_Vuna_dCompiler_dFrontend_dLexer_dPTok_ptokTok = dtb__58; Vuna_dCompiler_dFrontend_dLexer.f_Vuna_dCompiler_dFrontend_dLexer_dPTok_ptokPos = dtb__59 } -> (match dtb__58 with
  | Vuna_dCompiler_dFrontend_dLexer.C_Vuna_dCompiler_dFrontend_dLexer_dTok_TKw (dtb__60) -> (dtb__60 = k)
  | _ -> false
)
  | _ -> failwith "DT: impossible branch"
)) (v_Vuna_dCompiler_dFrontend_dParser_dSupport_dpeekTok st)))

# 161 "Vuna/Compiler/Frontend/Parser/Support.vuna"
let v_Vuna_dCompiler_dFrontend_dParser_dSupport_dcanContinue = (fun st blockCol -> (match (v_Vuna_dCompiler_dFrontend_dParser_dSupport_dpeekPos st) with
  | { Vuna_dCompiler_dBase_dSource.f_Vuna_dCompiler_dBase_dSource_dPos_posLine = dtb__61; Vuna_dCompiler_dBase_dSource.f_Vuna_dCompiler_dBase_dSource_dPos_posCol = dtb__62; Vuna_dCompiler_dBase_dSource.f_Vuna_dCompiler_dBase_dSource_dPos_posOffset = dtb__63 } -> (match (v_Vuna_dCompiler_dFrontend_dParser_dSupport_dlastPos st) with
  | { Vuna_dCompiler_dBase_dSource.f_Vuna_dCompiler_dBase_dSource_dPos_posLine = dtb__64; Vuna_dCompiler_dBase_dSource.f_Vuna_dCompiler_dBase_dSource_dPos_posCol = dtb__65; Vuna_dCompiler_dBase_dSource.f_Vuna_dCompiler_dBase_dSource_dPos_posOffset = dtb__66 } -> (if (dtb__61 = dtb__64) then true else (dtb__62 > blockCol))
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
))

# 168 "Vuna/Compiler/Frontend/Parser/Support.vuna"
let v_Vuna_dCompiler_dFrontend_dParser_dSupport_dexpectSym = (fun st s -> ((fun nd_uscrut2 -> (match nd_uscrut2 with
  | { Vuna_dCompiler_dFrontend_dLexer.f_Vuna_dCompiler_dFrontend_dLexer_dPTok_ptokTok = dtb__67; Vuna_dCompiler_dFrontend_dLexer.f_Vuna_dCompiler_dFrontend_dLexer_dPTok_ptokPos = dtb__68 } -> (match dtb__67 with
  | Vuna_dCompiler_dFrontend_dLexer.C_Vuna_dCompiler_dFrontend_dLexer_dTok_TSym (dtb__69) -> (if (dtb__69 = s) then (Vuna_dCompiler_dBase_dDiag.C_Vuna_dCompiler_dBase_dDiag_dCheck_OkC ((v_Vuna_dCompiler_dFrontend_dParser_dSupport_dadvance st))) else (((Vuna_dCompiler_dBase_dDiagnostics_dFrontend.v_Vuna_dCompiler_dBase_dDiagnostics_dFrontend_dpsErr1At (v_Vuna_dCompiler_dFrontend_dParser_dSupport_dtokSpan st)) (Vuna_dCompiler_dBase_dDiagnostics_dFrontend.C_Vuna_dCompiler_dBase_dDiagnostics_dFrontend_dPsDiag_ExpectedToken (s))) s))
  | _ -> (((Vuna_dCompiler_dBase_dDiagnostics_dFrontend.v_Vuna_dCompiler_dBase_dDiagnostics_dFrontend_dpsErr1At (v_Vuna_dCompiler_dFrontend_dParser_dSupport_dtokSpan st)) (Vuna_dCompiler_dBase_dDiagnostics_dFrontend.C_Vuna_dCompiler_dBase_dDiagnostics_dFrontend_dPsDiag_ExpectedToken (s))) s)
)
  | _ -> failwith "DT: impossible branch"
)) (v_Vuna_dCompiler_dFrontend_dParser_dSupport_dpeekTok st)))

# 173 "Vuna/Compiler/Frontend/Parser/Support.vuna"
let v_Vuna_dCompiler_dFrontend_dParser_dSupport_dexpectKw = (fun st k -> ((fun nd_uscrut2 -> (match nd_uscrut2 with
  | { Vuna_dCompiler_dFrontend_dLexer.f_Vuna_dCompiler_dFrontend_dLexer_dPTok_ptokTok = dtb__70; Vuna_dCompiler_dFrontend_dLexer.f_Vuna_dCompiler_dFrontend_dLexer_dPTok_ptokPos = dtb__71 } -> (match dtb__70 with
  | Vuna_dCompiler_dFrontend_dLexer.C_Vuna_dCompiler_dFrontend_dLexer_dTok_TKw (dtb__72) -> (if (dtb__72 = k) then (Vuna_dCompiler_dBase_dDiag.C_Vuna_dCompiler_dBase_dDiag_dCheck_OkC ((v_Vuna_dCompiler_dFrontend_dParser_dSupport_dadvance st))) else (((Vuna_dCompiler_dBase_dDiagnostics_dFrontend.v_Vuna_dCompiler_dBase_dDiagnostics_dFrontend_dpsErr1At (v_Vuna_dCompiler_dFrontend_dParser_dSupport_dtokSpan st)) (Vuna_dCompiler_dBase_dDiagnostics_dFrontend.C_Vuna_dCompiler_dBase_dDiagnostics_dFrontend_dPsDiag_ExpectedToken (k))) k))
  | _ -> (((Vuna_dCompiler_dBase_dDiagnostics_dFrontend.v_Vuna_dCompiler_dBase_dDiagnostics_dFrontend_dpsErr1At (v_Vuna_dCompiler_dFrontend_dParser_dSupport_dtokSpan st)) (Vuna_dCompiler_dBase_dDiagnostics_dFrontend.C_Vuna_dCompiler_dBase_dDiagnostics_dFrontend_dPsDiag_ExpectedToken (k))) k)
)
  | _ -> failwith "DT: impossible branch"
)) (v_Vuna_dCompiler_dFrontend_dParser_dSupport_dpeekTok st)))

# 178 "Vuna/Compiler/Frontend/Parser/Support.vuna"
let v_Vuna_dCompiler_dFrontend_dParser_dSupport_dexpectIdent = (fun st -> ((fun nd_uscrut1 -> (match nd_uscrut1 with
  | { Vuna_dCompiler_dFrontend_dLexer.f_Vuna_dCompiler_dFrontend_dLexer_dPTok_ptokTok = dtb__73; Vuna_dCompiler_dFrontend_dLexer.f_Vuna_dCompiler_dFrontend_dLexer_dPTok_ptokPos = dtb__74 } -> (match dtb__73 with
  | Vuna_dCompiler_dFrontend_dLexer.C_Vuna_dCompiler_dFrontend_dLexer_dTok_TIdent (dtb__75) -> (Vuna_dCompiler_dBase_dDiag.C_Vuna_dCompiler_dBase_dDiag_dCheck_OkC ({ Base_dPair.f_Base_dPair_dPair_first = dtb__75; Base_dPair.f_Base_dPair_dPair_second = (v_Vuna_dCompiler_dFrontend_dParser_dSupport_dadvance st) }))
  | _ -> ((Vuna_dCompiler_dBase_dDiagnostics_dFrontend.v_Vuna_dCompiler_dBase_dDiagnostics_dFrontend_dpsErr0At (v_Vuna_dCompiler_dFrontend_dParser_dSupport_dtokSpan st)) Vuna_dCompiler_dBase_dDiagnostics_dFrontend.C_Vuna_dCompiler_dBase_dDiagnostics_dFrontend_dPsDiag_ExpectedIdentifier)
)
  | _ -> failwith "DT: impossible branch"
)) (v_Vuna_dCompiler_dFrontend_dParser_dSupport_dpeekTok st)))

# 195 "Vuna/Compiler/Frontend/Parser/Support.vuna"
let v_Vuna_dCompiler_dFrontend_dParser_dSupport_dupperFirst = (fun s -> (match (Base_dList.dtp_unpack s) with
  | Base_dList.C_Base_dList_dList__x58__x58_ (dtb__76, dtb__77) -> (if (dtb__76 >= 65) then (dtb__76 <= 90) else false)
  | Base_dList.C_Base_dList_dList_Nil -> false
  | _ -> failwith "DT: impossible branch"
))

# 202 "Vuna/Compiler/Frontend/Parser/Support.vuna"
let v_Vuna_dCompiler_dFrontend_dParser_dSupport_dunderscoreCtorName = (fun s -> (match (Base_dList.dtp_unpack s) with
  | Base_dList.C_Base_dList_dList__x58__x58_ (dtb__78, dtb__79) -> (if (dtb__78 = 95) then (match dtb__79 with
  | Base_dList.C_Base_dList_dList__x58__x58_ (dtb__80, dtb__81) -> (if (dtb__80 >= 65) then (dtb__80 <= 90) else false)
  | Base_dList.C_Base_dList_dList_Nil -> false
  | _ -> failwith "DT: impossible branch"
) else false)
  | Base_dList.C_Base_dList_dList_Nil -> false
  | _ -> failwith "DT: impossible branch"
))

# 210 "Vuna/Compiler/Frontend/Parser/Support.vuna"
let v_Vuna_dCompiler_dFrontend_dParser_dSupport_dctorPatternStart = (fun name -> (if (v_Vuna_dCompiler_dFrontend_dParser_dSupport_dupperFirst name) then true else (v_Vuna_dCompiler_dFrontend_dParser_dSupport_dunderscoreCtorName name)))

# 231 "Vuna/Compiler/Frontend/Parser/Support.vuna"
let v_Vuna_dCompiler_dFrontend_dParser_dSupport_dholeAtomAt = (fun st -> ((fun nd_uscrut1 -> (match nd_uscrut1 with
  | { Vuna_dCompiler_dFrontend_dLexer.f_Vuna_dCompiler_dFrontend_dLexer_dPTok_ptokTok = dtb__82; Vuna_dCompiler_dFrontend_dLexer.f_Vuna_dCompiler_dFrontend_dLexer_dPTok_ptokPos = dtb__83 } -> (match dtb__82 with
  | Vuna_dCompiler_dFrontend_dLexer.C_Vuna_dCompiler_dFrontend_dLexer_dTok_TSym (dtb__84) -> (if (dtb__84 = "?") then ((fun nd_uscrut5 -> (match nd_uscrut5 with
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Just (dtb__85) -> (match dtb__85 with
  | { Vuna_dCompiler_dFrontend_dLexer.f_Vuna_dCompiler_dFrontend_dLexer_dPTok_ptokTok = dtb__86; Vuna_dCompiler_dFrontend_dLexer.f_Vuna_dCompiler_dFrontend_dLexer_dPTok_ptokPos = dtb__87 } -> (match dtb__86 with
  | Vuna_dCompiler_dFrontend_dLexer.C_Vuna_dCompiler_dFrontend_dLexer_dTok_TIdent (dtb__88) -> (if (if ((Vuna_dCompiler_dBase_dSource.v_Vuna_dCompiler_dBase_dSource_dposLine dtb__87) = (Vuna_dCompiler_dBase_dSource.v_Vuna_dCompiler_dBase_dSource_dposLine dtb__83)) then ((Vuna_dCompiler_dBase_dSource.v_Vuna_dCompiler_dBase_dSource_dposCol dtb__87) = ((Vuna_dCompiler_dBase_dSource.v_Vuna_dCompiler_dBase_dSource_dposCol dtb__83) + 1)) else false) then (Base_dMaybe.C_Base_dMaybe_dMaybe_Just ({ Base_dPair.f_Base_dPair_dPair_first = ("?" ^ dtb__88); Base_dPair.f_Base_dPair_dPair_second = { Vuna_dCompiler_dBase_dSource.f_Vuna_dCompiler_dBase_dSource_dSpan_spanFile = (v_Vuna_dCompiler_dFrontend_dParser_dSupport_dfileOf st); Vuna_dCompiler_dBase_dSource.f_Vuna_dCompiler_dBase_dSource_dSpan_spanStartLine = (Vuna_dCompiler_dBase_dSource.v_Vuna_dCompiler_dBase_dSource_dposLine dtb__83); Vuna_dCompiler_dBase_dSource.f_Vuna_dCompiler_dBase_dSource_dSpan_spanStartCol = (Vuna_dCompiler_dBase_dSource.v_Vuna_dCompiler_dBase_dSource_dposCol dtb__83); Vuna_dCompiler_dBase_dSource.f_Vuna_dCompiler_dBase_dSource_dSpan_spanEndLine = (Vuna_dCompiler_dBase_dSource.v_Vuna_dCompiler_dBase_dSource_dposLine dtb__87); Vuna_dCompiler_dBase_dSource.f_Vuna_dCompiler_dBase_dSource_dSpan_spanEndCol = ((Vuna_dCompiler_dBase_dSource.v_Vuna_dCompiler_dBase_dSource_dposCol dtb__87) + (bi_strLength dtb__88)); Vuna_dCompiler_dBase_dSource.f_Vuna_dCompiler_dBase_dSource_dSpan_spanStartOffset = (Vuna_dCompiler_dBase_dSource.v_Vuna_dCompiler_dBase_dSource_dposOffset dtb__83); Vuna_dCompiler_dBase_dSource.f_Vuna_dCompiler_dBase_dSource_dSpan_spanEndOffset = ((Vuna_dCompiler_dBase_dSource.v_Vuna_dCompiler_dBase_dSource_dposOffset dtb__87) + (bi_strLength dtb__88)) } })) else Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing)
  | _ -> Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing
)
  | _ -> failwith "DT: impossible branch"
)
  | _ -> Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing
)) ((v_Vuna_dCompiler_dFrontend_dParser_dSupport_dpeekTokAt st) 1)) else Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing)
  | _ -> Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing
)
  | _ -> failwith "DT: impossible branch"
)) (v_Vuna_dCompiler_dFrontend_dParser_dSupport_dpeekTok st)))

# 213 "Vuna/Compiler/Frontend/Parser/Support.vuna"
let v_Vuna_dCompiler_dFrontend_dParser_dSupport_dstartsAtom = (fun st -> ((fun nd_uscrut1 -> (match nd_uscrut1 with
  | { Vuna_dCompiler_dFrontend_dLexer.f_Vuna_dCompiler_dFrontend_dLexer_dPTok_ptokTok = dtb__89; Vuna_dCompiler_dFrontend_dLexer.f_Vuna_dCompiler_dFrontend_dLexer_dPTok_ptokPos = dtb__90 } -> (match dtb__89 with
  | Vuna_dCompiler_dFrontend_dLexer.C_Vuna_dCompiler_dFrontend_dLexer_dTok_TSym (dtb__91) -> (if (dtb__91 = "(") then true else (if (dtb__91 = "[") then true else (if (dtb__91 = "?") then (match (v_Vuna_dCompiler_dFrontend_dParser_dSupport_dholeAtomAt st) with
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Just (dtb__92) -> true
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing -> false
  | _ -> failwith "DT: impossible branch"
) else false)))
  | Vuna_dCompiler_dFrontend_dLexer.C_Vuna_dCompiler_dFrontend_dLexer_dTok_TKw (dtb__93) -> (if (dtb__93 = "Type") then true else false)
  | Vuna_dCompiler_dFrontend_dLexer.C_Vuna_dCompiler_dFrontend_dLexer_dTok_TTmpl (dtb__94, dtb__95, dtb__96) -> true
  | Vuna_dCompiler_dFrontend_dLexer.C_Vuna_dCompiler_dFrontend_dLexer_dTok_TStr (dtb__97) -> true
  | Vuna_dCompiler_dFrontend_dLexer.C_Vuna_dCompiler_dFrontend_dLexer_dTok_TFloat (dtb__98) -> true
  | Vuna_dCompiler_dFrontend_dLexer.C_Vuna_dCompiler_dFrontend_dLexer_dTok_TInt (dtb__99) -> true
  | Vuna_dCompiler_dFrontend_dLexer.C_Vuna_dCompiler_dFrontend_dLexer_dTok_TIdent (dtb__100) -> true
  | _ -> false
)
  | _ -> failwith "DT: impossible branch"
)) (v_Vuna_dCompiler_dFrontend_dParser_dSupport_dpeekTok st)))

# 241 "Vuna/Compiler/Frontend/Parser/Support.vuna"
let v_Vuna_dCompiler_dFrontend_dParser_dSupport_dstartsPatternAtom = (fun st -> ((fun nd_uscrut1 -> (match nd_uscrut1 with
  | { Vuna_dCompiler_dFrontend_dLexer.f_Vuna_dCompiler_dFrontend_dLexer_dPTok_ptokTok = dtb__101; Vuna_dCompiler_dFrontend_dLexer.f_Vuna_dCompiler_dFrontend_dLexer_dPTok_ptokPos = dtb__102 } -> (match dtb__101 with
  | Vuna_dCompiler_dFrontend_dLexer.C_Vuna_dCompiler_dFrontend_dLexer_dTok_TSym (dtb__103) -> (if (dtb__103 = "(") then true else (if (dtb__103 = "[") then true else false))
  | Vuna_dCompiler_dFrontend_dLexer.C_Vuna_dCompiler_dFrontend_dLexer_dTok_TTmpl (dtb__104, dtb__105, dtb__106) -> true
  | Vuna_dCompiler_dFrontend_dLexer.C_Vuna_dCompiler_dFrontend_dLexer_dTok_TStr (dtb__107) -> true
  | Vuna_dCompiler_dFrontend_dLexer.C_Vuna_dCompiler_dFrontend_dLexer_dTok_TInt (dtb__108) -> true
  | Vuna_dCompiler_dFrontend_dLexer.C_Vuna_dCompiler_dFrontend_dLexer_dTok_TIdent (dtb__109) -> true
  | _ -> false
)
  | _ -> failwith "DT: impossible branch"
)) (v_Vuna_dCompiler_dFrontend_dParser_dSupport_dpeekTok st)))

# 253 "Vuna/Compiler/Frontend/Parser/Support.vuna"
let v_Vuna_dCompiler_dFrontend_dParser_dSupport_disSyntaxSym = (fun op -> (if (op = "=") then true else (if (op = ":") then true else (if (op = ",") then true else (if (op = ";") then true else (if (op = "|") then true else (if (op = "=>") then true else (if (op = "<-") then true else (if (op = "\\") then true else (if (op = ".") then true else (if (op = "..") then true else (if (op = "@") then true else (if (op = "(") then true else (if (op = ")") then true else (if (op = "[") then true else (if (op = "]") then true else (if (op = "{") then true else (if (op = "}") then true else false))))))))))))))))))

# 279 "Vuna/Compiler/Frontend/Parser/Support.vuna"
let v_Vuna_dCompiler_dFrontend_dParser_dSupport_disReservedValueName = (fun name -> (if (if (v_Vuna_dCompiler_dFrontend_dParser_dSupport_disSyntaxSym name) then true else (name = "->")) then true else (name = "`")))

# 185 "Vuna/Compiler/Frontend/Parser/Support.vuna"
let v_Vuna_dCompiler_dFrontend_dParser_dSupport_dexpectValueName = (fun st -> ((fun nd_uscrut1 -> (match nd_uscrut1 with
  | { Vuna_dCompiler_dFrontend_dLexer.f_Vuna_dCompiler_dFrontend_dLexer_dPTok_ptokTok = dtb__110; Vuna_dCompiler_dFrontend_dLexer.f_Vuna_dCompiler_dFrontend_dLexer_dPTok_ptokPos = dtb__111 } -> (match dtb__110 with
  | Vuna_dCompiler_dFrontend_dLexer.C_Vuna_dCompiler_dFrontend_dLexer_dTok_TSym (dtb__112) -> (if (v_Vuna_dCompiler_dFrontend_dParser_dSupport_disReservedValueName dtb__112) then (((Vuna_dCompiler_dBase_dDiagnostics_dFrontend.v_Vuna_dCompiler_dBase_dDiagnostics_dFrontend_dpsErr1At (v_Vuna_dCompiler_dFrontend_dParser_dSupport_dtokSpan st)) (Vuna_dCompiler_dBase_dDiagnostics_dFrontend.C_Vuna_dCompiler_dBase_dDiagnostics_dFrontend_dPsDiag_ExpectedToken ("value name"))) "value name") else (Vuna_dCompiler_dBase_dDiag.C_Vuna_dCompiler_dBase_dDiag_dCheck_OkC ({ Base_dPair.f_Base_dPair_dPair_first = dtb__112; Base_dPair.f_Base_dPair_dPair_second = (v_Vuna_dCompiler_dFrontend_dParser_dSupport_dadvance st) })))
  | Vuna_dCompiler_dFrontend_dLexer.C_Vuna_dCompiler_dFrontend_dLexer_dTok_TIdent (dtb__113) -> (if (v_Vuna_dCompiler_dFrontend_dParser_dSupport_disReservedValueName dtb__113) then (((Vuna_dCompiler_dBase_dDiagnostics_dFrontend.v_Vuna_dCompiler_dBase_dDiagnostics_dFrontend_dpsErr1At (v_Vuna_dCompiler_dFrontend_dParser_dSupport_dtokSpan st)) (Vuna_dCompiler_dBase_dDiagnostics_dFrontend.C_Vuna_dCompiler_dBase_dDiagnostics_dFrontend_dPsDiag_ExpectedToken ("value name"))) "value name") else (Vuna_dCompiler_dBase_dDiag.C_Vuna_dCompiler_dBase_dDiag_dCheck_OkC ({ Base_dPair.f_Base_dPair_dPair_first = dtb__113; Base_dPair.f_Base_dPair_dPair_second = (v_Vuna_dCompiler_dFrontend_dParser_dSupport_dadvance st) })))
  | _ -> ((Vuna_dCompiler_dBase_dDiagnostics_dFrontend.v_Vuna_dCompiler_dBase_dDiagnostics_dFrontend_dpsErr0At (v_Vuna_dCompiler_dFrontend_dParser_dSupport_dtokSpan st)) Vuna_dCompiler_dBase_dDiagnostics_dFrontend.C_Vuna_dCompiler_dBase_dDiagnostics_dFrontend_dPsDiag_ExpectedIdentifier)
)
  | _ -> failwith "DT: impossible branch"
)) (v_Vuna_dCompiler_dFrontend_dParser_dSupport_dpeekTok st)))

# 284 "Vuna/Compiler/Frontend/Parser/Support.vuna"
let v_Vuna_dCompiler_dFrontend_dParser_dSupport_dcloseParenNext = (fun st -> ((fun nd_uscrut1 -> (match nd_uscrut1 with
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Just (dtb__114) -> (match dtb__114 with
  | { Vuna_dCompiler_dFrontend_dLexer.f_Vuna_dCompiler_dFrontend_dLexer_dPTok_ptokTok = dtb__115; Vuna_dCompiler_dFrontend_dLexer.f_Vuna_dCompiler_dFrontend_dLexer_dPTok_ptokPos = dtb__116 } -> (match dtb__115 with
  | Vuna_dCompiler_dFrontend_dLexer.C_Vuna_dCompiler_dFrontend_dLexer_dTok_TSym (dtb__117) -> (if (dtb__117 = ")") then true else false)
  | _ -> false
)
  | _ -> failwith "DT: impossible branch"
)
  | _ -> false
)) ((v_Vuna_dCompiler_dFrontend_dParser_dSupport_dpeekTokAt st) 1)))

# 302 "Vuna/Compiler/Frontend/Parser/Support.vuna"
let v_Vuna_dCompiler_dFrontend_dParser_dSupport_dminusLiteralAt = (fun p st -> ((fun nd_uscrut2 -> (match nd_uscrut2 with
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Just (dtb__118) -> (match dtb__118 with
  | { Vuna_dCompiler_dFrontend_dLexer.f_Vuna_dCompiler_dFrontend_dLexer_dPTok_ptokTok = dtb__119; Vuna_dCompiler_dFrontend_dLexer.f_Vuna_dCompiler_dFrontend_dLexer_dPTok_ptokPos = dtb__120 } -> (match dtb__119 with
  | Vuna_dCompiler_dFrontend_dLexer.C_Vuna_dCompiler_dFrontend_dLexer_dTok_TFloat (dtb__121) -> (if ((Vuna_dCompiler_dBase_dSource.v_Vuna_dCompiler_dBase_dSource_dposLine dtb__120) = (Vuna_dCompiler_dBase_dSource.v_Vuna_dCompiler_dBase_dSource_dposLine p)) then ((Vuna_dCompiler_dBase_dSource.v_Vuna_dCompiler_dBase_dSource_dposCol dtb__120) = ((Vuna_dCompiler_dBase_dSource.v_Vuna_dCompiler_dBase_dSource_dposCol p) + 1)) else false)
  | Vuna_dCompiler_dFrontend_dLexer.C_Vuna_dCompiler_dFrontend_dLexer_dTok_TInt (dtb__122) -> (if ((Vuna_dCompiler_dBase_dSource.v_Vuna_dCompiler_dBase_dSource_dposLine dtb__120) = (Vuna_dCompiler_dBase_dSource.v_Vuna_dCompiler_dBase_dSource_dposLine p)) then ((Vuna_dCompiler_dBase_dSource.v_Vuna_dCompiler_dBase_dSource_dposCol dtb__120) = ((Vuna_dCompiler_dBase_dSource.v_Vuna_dCompiler_dBase_dSource_dposCol p) + 1)) else false)
  | _ -> false
)
  | _ -> failwith "DT: impossible branch"
)
  | _ -> false
)) ((v_Vuna_dCompiler_dFrontend_dParser_dSupport_dpeekTokAt st) 2)))

# 292 "Vuna/Compiler/Frontend/Parser/Support.vuna"
let v_Vuna_dCompiler_dFrontend_dParser_dSupport_dsectionOpAt = (fun st -> ((fun nd_uscrut1 -> (match nd_uscrut1 with
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Just (dtb__123) -> (match dtb__123 with
  | { Vuna_dCompiler_dFrontend_dLexer.f_Vuna_dCompiler_dFrontend_dLexer_dPTok_ptokTok = dtb__124; Vuna_dCompiler_dFrontend_dLexer.f_Vuna_dCompiler_dFrontend_dLexer_dPTok_ptokPos = dtb__125 } -> (match dtb__124 with
  | Vuna_dCompiler_dFrontend_dLexer.C_Vuna_dCompiler_dFrontend_dLexer_dTok_TSym (dtb__126) -> (if (v_Vuna_dCompiler_dFrontend_dParser_dSupport_disReservedValueName dtb__126) then Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing else (if (dtb__126 = "?") then (match (v_Vuna_dCompiler_dFrontend_dParser_dSupport_dholeAtomAt (v_Vuna_dCompiler_dFrontend_dParser_dSupport_dadvance st)) with
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Just (dtb__127) -> Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing -> (Base_dMaybe.C_Base_dMaybe_dMaybe_Just (dtb__126))
  | _ -> failwith "DT: impossible branch"
) else (if (if (dtb__126 = "-") then ((v_Vuna_dCompiler_dFrontend_dParser_dSupport_dminusLiteralAt dtb__125) st) else false) then Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing else (Base_dMaybe.C_Base_dMaybe_dMaybe_Just (dtb__126)))))
  | _ -> Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing
)
  | _ -> failwith "DT: impossible branch"
)
  | _ -> Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing
)) ((v_Vuna_dCompiler_dFrontend_dParser_dSupport_dpeekTokAt st) 1)))

# 308 "Vuna/Compiler/Frontend/Parser/Support.vuna"
let rec v_Vuna_dCompiler_dFrontend_dParser_dSupport_dcountArrows = (fun mc0 -> (match mc0 with
  | Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dExpr_EApp (dtb__128, dtb__129, dtb__130) -> (match dtb__128 with
  | Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dExpr_EVar (dtb__131, dtb__132) -> (if (dtb__131 = "->") then (match dtb__129 with
  | Base_dList.C_Base_dList_dList__x58__x58_ (dtb__133, dtb__134) -> (match dtb__134 with
  | Base_dList.C_Base_dList_dList__x58__x58_ (dtb__135, dtb__136) -> (match dtb__136 with
  | Base_dList.C_Base_dList_dList_Nil -> (1 + (v_Vuna_dCompiler_dFrontend_dParser_dSupport_dcountArrows dtb__135))
  | _ -> 0
)
  | _ -> 0
)
  | _ -> 0
) else 0)
  | _ -> 0
)
  | Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dExpr_EInfix (dtb__137, dtb__138, dtb__139, dtb__140) -> (if (dtb__137 = "->") then (1 + (v_Vuna_dCompiler_dFrontend_dParser_dSupport_dcountArrows dtb__139)) else 0)
  | _ -> 0
))

# 313 "Vuna/Compiler/Frontend/Parser/Support.vuna"
let v_Vuna_dCompiler_dFrontend_dParser_dSupport_dterminatesExpression = (fun mc0 -> (match mc0 with
  | { Vuna_dCompiler_dFrontend_dLexer.f_Vuna_dCompiler_dFrontend_dLexer_dPTok_ptokTok = dtb__141; Vuna_dCompiler_dFrontend_dLexer.f_Vuna_dCompiler_dFrontend_dLexer_dPTok_ptokPos = dtb__142 } -> (match dtb__141 with
  | Vuna_dCompiler_dFrontend_dLexer.C_Vuna_dCompiler_dFrontend_dLexer_dTok_TKw (dtb__143) -> (if (dtb__143 = "else") then true else (if (dtb__143 = "in") then true else (if (dtb__143 = "then") then true else false)))
  | Vuna_dCompiler_dFrontend_dLexer.C_Vuna_dCompiler_dFrontend_dLexer_dTok_TSym (dtb__144) -> (if (dtb__144 = ")") then true else (if (dtb__144 = "]") then true else (if (dtb__144 = ",") then true else false)))
  | _ -> false
)
  | _ -> failwith "DT: impossible branch"
))

# 322 "Vuna/Compiler/Frontend/Parser/Support.vuna"
let v_Vuna_dCompiler_dFrontend_dParser_dSupport_dbadCaseIndent = (fun st altCol -> (if (v_Vuna_dCompiler_dFrontend_dParser_dSupport_disEof st) then false else (match (v_Vuna_dCompiler_dFrontend_dParser_dSupport_dpeekPos st) with
  | { Vuna_dCompiler_dBase_dSource.f_Vuna_dCompiler_dBase_dSource_dPos_posLine = dtb__145; Vuna_dCompiler_dBase_dSource.f_Vuna_dCompiler_dBase_dSource_dPos_posCol = dtb__146; Vuna_dCompiler_dBase_dSource.f_Vuna_dCompiler_dBase_dSource_dPos_posOffset = dtb__147 } -> (if (dtb__146 > altCol) then (if (v_Vuna_dCompiler_dFrontend_dParser_dSupport_dterminatesExpression (v_Vuna_dCompiler_dFrontend_dParser_dSupport_dpeekTok st)) then false else true) else false)
  | _ -> failwith "DT: impossible branch"
)))
