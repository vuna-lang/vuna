open Vuna_runtime
type t_Vuna_dCompiler_dFrontend_dParser_dSupport_dParseMode = C_Vuna_dCompiler_dFrontend_dParser_dSupport_dParseMode_PmStrict | C_Vuna_dCompiler_dFrontend_dParser_dSupport_dParseMode_PmTool
and t_Vuna_dCompiler_dFrontend_dParser_dSupport_dPState = { f_Vuna_dCompiler_dFrontend_dParser_dSupport_dPState_fileOf : string; f_Vuna_dCompiler_dFrontend_dParser_dSupport_dPState_toksOf : Vuna_dCompiler_dFrontend_dLexer.t_Vuna_dCompiler_dFrontend_dLexer_dPTok Base_dList.t_Base_dList_dList; f_Vuna_dCompiler_dFrontend_dParser_dSupport_dPState_lastPos : Vuna_dCompiler_dSource.t_Vuna_dCompiler_dSource_dPos; f_Vuna_dCompiler_dFrontend_dParser_dSupport_dPState_toksLeft : int; f_Vuna_dCompiler_dFrontend_dParser_dSupport_dPState_pmodeOf : t_Vuna_dCompiler_dFrontend_dParser_dSupport_dParseMode }

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
let v_Vuna_dCompiler_dFrontend_dParser_dSupport_dmkState = (fun file toks mode -> { f_Vuna_dCompiler_dFrontend_dParser_dSupport_dPState_fileOf = file; f_Vuna_dCompiler_dFrontend_dParser_dSupport_dPState_toksOf = toks; f_Vuna_dCompiler_dFrontend_dParser_dSupport_dPState_lastPos = { Vuna_dCompiler_dSource.f_Vuna_dCompiler_dSource_dPos_posLine = 1; Vuna_dCompiler_dSource.f_Vuna_dCompiler_dSource_dPos_posCol = 0 }; f_Vuna_dCompiler_dFrontend_dParser_dSupport_dPState_toksLeft = (Base_dList.v_Base_dList_dlength toks); f_Vuna_dCompiler_dFrontend_dParser_dSupport_dPState_pmodeOf = mode })

# 44 "Vuna/Compiler/Frontend/Parser/Support.vuna"
let v_Vuna_dCompiler_dFrontend_dParser_dSupport_dmkStateAt = (fun file toks last count mode -> { f_Vuna_dCompiler_dFrontend_dParser_dSupport_dPState_fileOf = file; f_Vuna_dCompiler_dFrontend_dParser_dSupport_dPState_toksOf = toks; f_Vuna_dCompiler_dFrontend_dParser_dSupport_dPState_lastPos = last; f_Vuna_dCompiler_dFrontend_dParser_dSupport_dPState_toksLeft = count; f_Vuna_dCompiler_dFrontend_dParser_dSupport_dPState_pmodeOf = mode })

# 53 "Vuna/Compiler/Frontend/Parser/Support.vuna"
let v_Vuna_dCompiler_dFrontend_dParser_dSupport_dpeekTok = (fun mc0 -> (match mc0 with
  | { f_Vuna_dCompiler_dFrontend_dParser_dSupport_dPState_fileOf = dtb__10; f_Vuna_dCompiler_dFrontend_dParser_dSupport_dPState_toksOf = dtb__11; f_Vuna_dCompiler_dFrontend_dParser_dSupport_dPState_lastPos = dtb__12; f_Vuna_dCompiler_dFrontend_dParser_dSupport_dPState_toksLeft = dtb__13; f_Vuna_dCompiler_dFrontend_dParser_dSupport_dPState_pmodeOf = dtb__14 } -> (match dtb__11 with
  | Base_dList.C_Base_dList_dList_Nil -> { Vuna_dCompiler_dFrontend_dLexer.f_Vuna_dCompiler_dFrontend_dLexer_dPTok_ptokTok = Vuna_dCompiler_dFrontend_dLexer.C_Vuna_dCompiler_dFrontend_dLexer_dTok_TEof; Vuna_dCompiler_dFrontend_dLexer.f_Vuna_dCompiler_dFrontend_dLexer_dPTok_ptokPos = { Vuna_dCompiler_dSource.f_Vuna_dCompiler_dSource_dPos_posLine = 1; Vuna_dCompiler_dSource.f_Vuna_dCompiler_dSource_dPos_posCol = 1 } }
  | Base_dList.C_Base_dList_dList_Cons (dtb__15, dtb__16) -> dtb__15
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
))

# 57 "Vuna/Compiler/Frontend/Parser/Support.vuna"
let v_Vuna_dCompiler_dFrontend_dParser_dSupport_dpeekPos = (fun st -> ((v_Vuna_dCompiler_dFrontend_dParser_dSupport_dpeekTok st)).Vuna_dCompiler_dFrontend_dLexer.f_Vuna_dCompiler_dFrontend_dLexer_dPTok_ptokPos)

# 70 "Vuna/Compiler/Frontend/Parser/Support.vuna"
let v_Vuna_dCompiler_dFrontend_dParser_dSupport_dlastPos = (fun mc0 -> (match mc0 with
  | { f_Vuna_dCompiler_dFrontend_dParser_dSupport_dPState_fileOf = dtb__17; f_Vuna_dCompiler_dFrontend_dParser_dSupport_dPState_toksOf = dtb__18; f_Vuna_dCompiler_dFrontend_dParser_dSupport_dPState_lastPos = dtb__19; f_Vuna_dCompiler_dFrontend_dParser_dSupport_dPState_toksLeft = dtb__20; f_Vuna_dCompiler_dFrontend_dParser_dSupport_dPState_pmodeOf = dtb__21 } -> dtb__19
  | _ -> failwith "DT: impossible branch"
))

# 48 "Vuna/Compiler/Frontend/Parser/Support.vuna"
let v_Vuna_dCompiler_dFrontend_dParser_dSupport_dspanOf = (fun st st2 -> { Vuna_dCompiler_dSource.f_Vuna_dCompiler_dSource_dSpan_spanFile = (v_Vuna_dCompiler_dFrontend_dParser_dSupport_dfileOf st); Vuna_dCompiler_dSource.f_Vuna_dCompiler_dSource_dSpan_spanStartLine = (Vuna_dCompiler_dSource.v_Vuna_dCompiler_dSource_dposLine (v_Vuna_dCompiler_dFrontend_dParser_dSupport_dpeekPos st)); Vuna_dCompiler_dSource.f_Vuna_dCompiler_dSource_dSpan_spanStartCol = (Vuna_dCompiler_dSource.v_Vuna_dCompiler_dSource_dposCol (v_Vuna_dCompiler_dFrontend_dParser_dSupport_dpeekPos st)); Vuna_dCompiler_dSource.f_Vuna_dCompiler_dSource_dSpan_spanEndLine = (Vuna_dCompiler_dSource.v_Vuna_dCompiler_dSource_dposLine (v_Vuna_dCompiler_dFrontend_dParser_dSupport_dlastPos st2)); Vuna_dCompiler_dSource.f_Vuna_dCompiler_dSource_dSpan_spanEndCol = (Vuna_dCompiler_dSource.v_Vuna_dCompiler_dSource_dposCol (v_Vuna_dCompiler_dFrontend_dParser_dSupport_dlastPos st2)) })

# 62 "Vuna/Compiler/Frontend/Parser/Support.vuna"
let v_Vuna_dCompiler_dFrontend_dParser_dSupport_dtokSpan = (fun st -> ((fun nd_uscrut1 -> (match nd_uscrut1 with
  | { Vuna_dCompiler_dFrontend_dLexer.f_Vuna_dCompiler_dFrontend_dLexer_dPTok_ptokTok = dtb__22; Vuna_dCompiler_dFrontend_dLexer.f_Vuna_dCompiler_dFrontend_dLexer_dPTok_ptokPos = dtb__23 } -> (match dtb__22 with
  | Vuna_dCompiler_dFrontend_dLexer.C_Vuna_dCompiler_dFrontend_dLexer_dTok_TEof -> ((fun p -> { Vuna_dCompiler_dSource.f_Vuna_dCompiler_dSource_dSpan_spanFile = (v_Vuna_dCompiler_dFrontend_dParser_dSupport_dfileOf st); Vuna_dCompiler_dSource.f_Vuna_dCompiler_dSource_dSpan_spanStartLine = (Vuna_dCompiler_dSource.v_Vuna_dCompiler_dSource_dposLine p); Vuna_dCompiler_dSource.f_Vuna_dCompiler_dSource_dSpan_spanStartCol = (Vuna_dCompiler_dSource.v_Vuna_dCompiler_dSource_dposCol p); Vuna_dCompiler_dSource.f_Vuna_dCompiler_dSource_dSpan_spanEndLine = (Vuna_dCompiler_dSource.v_Vuna_dCompiler_dSource_dposLine p); Vuna_dCompiler_dSource.f_Vuna_dCompiler_dSource_dSpan_spanEndCol = (Vuna_dCompiler_dSource.v_Vuna_dCompiler_dSource_dposCol p) }) (v_Vuna_dCompiler_dFrontend_dParser_dSupport_dlastPos st))
  | _ -> { Vuna_dCompiler_dSource.f_Vuna_dCompiler_dSource_dSpan_spanFile = (v_Vuna_dCompiler_dFrontend_dParser_dSupport_dfileOf st); Vuna_dCompiler_dSource.f_Vuna_dCompiler_dSource_dSpan_spanStartLine = (Vuna_dCompiler_dSource.v_Vuna_dCompiler_dSource_dposLine dtb__23); Vuna_dCompiler_dSource.f_Vuna_dCompiler_dSource_dSpan_spanStartCol = (Vuna_dCompiler_dSource.v_Vuna_dCompiler_dSource_dposCol dtb__23); Vuna_dCompiler_dSource.f_Vuna_dCompiler_dSource_dSpan_spanEndLine = (Vuna_dCompiler_dSource.v_Vuna_dCompiler_dSource_dposLine dtb__23); Vuna_dCompiler_dSource.f_Vuna_dCompiler_dSource_dSpan_spanEndCol = (Vuna_dCompiler_dSource.v_Vuna_dCompiler_dSource_dposCol dtb__23) }
)
  | _ -> failwith "DT: impossible branch"
)) (v_Vuna_dCompiler_dFrontend_dParser_dSupport_dpeekTok st)))

# 73 "Vuna/Compiler/Frontend/Parser/Support.vuna"
let v_Vuna_dCompiler_dFrontend_dParser_dSupport_dadvance = (fun mc0 -> (match mc0 with
  | { f_Vuna_dCompiler_dFrontend_dParser_dSupport_dPState_fileOf = dtb__24; f_Vuna_dCompiler_dFrontend_dParser_dSupport_dPState_toksOf = dtb__25; f_Vuna_dCompiler_dFrontend_dParser_dSupport_dPState_lastPos = dtb__26; f_Vuna_dCompiler_dFrontend_dParser_dSupport_dPState_toksLeft = dtb__27; f_Vuna_dCompiler_dFrontend_dParser_dSupport_dPState_pmodeOf = dtb__28 } -> (match dtb__25 with
  | Base_dList.C_Base_dList_dList_Nil -> { f_Vuna_dCompiler_dFrontend_dParser_dSupport_dPState_fileOf = dtb__24; f_Vuna_dCompiler_dFrontend_dParser_dSupport_dPState_toksOf = dtb__25; f_Vuna_dCompiler_dFrontend_dParser_dSupport_dPState_lastPos = dtb__26; f_Vuna_dCompiler_dFrontend_dParser_dSupport_dPState_toksLeft = dtb__27; f_Vuna_dCompiler_dFrontend_dParser_dSupport_dPState_pmodeOf = dtb__28 }
  | Base_dList.C_Base_dList_dList_Cons (dtb__29, dtb__30) -> ((fun nd_uscrut9 -> (match nd_uscrut9 with
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

# 79 "Vuna/Compiler/Frontend/Parser/Support.vuna"
let v_Vuna_dCompiler_dFrontend_dParser_dSupport_disEof = (fun st -> ((fun nd_uscrut1 -> (match nd_uscrut1 with
  | { Vuna_dCompiler_dFrontend_dLexer.f_Vuna_dCompiler_dFrontend_dLexer_dPTok_ptokTok = dtb__33; Vuna_dCompiler_dFrontend_dLexer.f_Vuna_dCompiler_dFrontend_dLexer_dPTok_ptokPos = dtb__34 } -> (match dtb__33 with
  | Vuna_dCompiler_dFrontend_dLexer.C_Vuna_dCompiler_dFrontend_dLexer_dTok_TEof -> true
  | _ -> false
)
  | _ -> failwith "DT: impossible branch"
)) (v_Vuna_dCompiler_dFrontend_dParser_dSupport_dpeekTok st)))

# 107 "Vuna/Compiler/Frontend/Parser/Support.vuna"
let v_Vuna_dCompiler_dFrontend_dParser_dSupport_dstateFuel = (fun st -> ((128 * (st).f_Vuna_dCompiler_dFrontend_dParser_dSupport_dPState_toksLeft) + 1024))

# 110 "Vuna/Compiler/Frontend/Parser/Support.vuna"
let v_Vuna_dCompiler_dFrontend_dParser_dSupport_dsameLineState = (fun st -> (match (v_Vuna_dCompiler_dFrontend_dParser_dSupport_dpeekPos st) with
  | { Vuna_dCompiler_dSource.f_Vuna_dCompiler_dSource_dPos_posLine = dtb__35; Vuna_dCompiler_dSource.f_Vuna_dCompiler_dSource_dPos_posCol = dtb__36 } -> { f_Vuna_dCompiler_dFrontend_dParser_dSupport_dPState_fileOf = (v_Vuna_dCompiler_dFrontend_dParser_dSupport_dfileOf st); f_Vuna_dCompiler_dFrontend_dParser_dSupport_dPState_toksOf = (st).f_Vuna_dCompiler_dFrontend_dParser_dSupport_dPState_toksOf; f_Vuna_dCompiler_dFrontend_dParser_dSupport_dPState_lastPos = { Vuna_dCompiler_dSource.f_Vuna_dCompiler_dSource_dPos_posLine = dtb__35; Vuna_dCompiler_dSource.f_Vuna_dCompiler_dSource_dPos_posCol = 0 }; f_Vuna_dCompiler_dFrontend_dParser_dSupport_dPState_toksLeft = (st).f_Vuna_dCompiler_dFrontend_dParser_dSupport_dPState_toksLeft; f_Vuna_dCompiler_dFrontend_dParser_dSupport_dPState_pmodeOf = (v_Vuna_dCompiler_dFrontend_dParser_dSupport_dpmodeOf st) }
  | _ -> failwith "DT: impossible branch"
))

# 114 "Vuna/Compiler/Frontend/Parser/Support.vuna"
let v_Vuna_dCompiler_dFrontend_dParser_dSupport_datSym = (fun st s -> ((fun nd_uscrut2 -> (match nd_uscrut2 with
  | { Vuna_dCompiler_dFrontend_dLexer.f_Vuna_dCompiler_dFrontend_dLexer_dPTok_ptokTok = dtb__37; Vuna_dCompiler_dFrontend_dLexer.f_Vuna_dCompiler_dFrontend_dLexer_dPTok_ptokPos = dtb__38 } -> (match dtb__37 with
  | Vuna_dCompiler_dFrontend_dLexer.C_Vuna_dCompiler_dFrontend_dLexer_dTok_TSym (dtb__39) -> (dtb__39 = s)
  | _ -> false
)
  | _ -> failwith "DT: impossible branch"
)) (v_Vuna_dCompiler_dFrontend_dParser_dSupport_dpeekTok st)))

# 120 "Vuna/Compiler/Frontend/Parser/Support.vuna"
let rec v_Vuna_dCompiler_dFrontend_dParser_dSupport_dnthTok = (fun mc0 mc1 -> (match mc0 with
  | Base_dList.C_Base_dList_dList_Cons (dtb__40, dtb__41) -> (if (mc1 <= 0) then (Base_dMaybe.C_Base_dMaybe_dMaybe_Just (dtb__40)) else ((v_Vuna_dCompiler_dFrontend_dParser_dSupport_dnthTok dtb__41) (mc1 - 1)))
  | Base_dList.C_Base_dList_dList_Nil -> Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing
  | _ -> failwith "DT: impossible branch"
))

# 124 "Vuna/Compiler/Frontend/Parser/Support.vuna"
let v_Vuna_dCompiler_dFrontend_dParser_dSupport_dpeekTokAt = (fun st n -> ((v_Vuna_dCompiler_dFrontend_dParser_dSupport_dnthTok (st).f_Vuna_dCompiler_dFrontend_dParser_dSupport_dPState_toksOf) n))

# 141 "Vuna/Compiler/Frontend/Parser/Support.vuna"
let rec v_Vuna_dCompiler_dFrontend_dParser_dSupport_dbinderNameTail = (fun fuel st n acc -> (if (fuel <= 0) then Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing else ((fun nd_uscrut4 -> (match nd_uscrut4 with
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Just (dtb__42) -> (match dtb__42 with
  | { Vuna_dCompiler_dFrontend_dLexer.f_Vuna_dCompiler_dFrontend_dLexer_dPTok_ptokTok = dtb__43; Vuna_dCompiler_dFrontend_dLexer.f_Vuna_dCompiler_dFrontend_dLexer_dPTok_ptokPos = dtb__44 } -> (match dtb__43 with
  | Vuna_dCompiler_dFrontend_dLexer.C_Vuna_dCompiler_dFrontend_dLexer_dTok_TSym (dtb__45) -> (if (dtb__45 = ":") then (Base_dMaybe.C_Base_dMaybe_dMaybe_Just ((Base_dList.v_Base_dList_dreverse acc))) else Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing)
  | Vuna_dCompiler_dFrontend_dLexer.C_Vuna_dCompiler_dFrontend_dLexer_dTok_TIdent (dtb__46) -> ((((v_Vuna_dCompiler_dFrontend_dParser_dSupport_dbinderNameTail (fuel - 1)) st) (n + 1)) (Base_dList.C_Base_dList_dList_Cons (dtb__46, acc)))
  | _ -> Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing
)
  | _ -> failwith "DT: impossible branch"
)
  | _ -> Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing
)) ((v_Vuna_dCompiler_dFrontend_dParser_dSupport_dpeekTokAt st) n))))

# 148 "Vuna/Compiler/Frontend/Parser/Support.vuna"
let v_Vuna_dCompiler_dFrontend_dParser_dSupport_dquantifiedHead = (fun st q -> ((fun nd_uscrut2 -> (match nd_uscrut2 with
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Just (dtb__47) -> (match dtb__47 with
  | { Vuna_dCompiler_dFrontend_dLexer.f_Vuna_dCompiler_dFrontend_dLexer_dPTok_ptokTok = dtb__48; Vuna_dCompiler_dFrontend_dLexer.f_Vuna_dCompiler_dFrontend_dLexer_dPTok_ptokPos = dtb__49 } -> (match dtb__48 with
  | Vuna_dCompiler_dFrontend_dLexer.C_Vuna_dCompiler_dFrontend_dLexer_dTok_TIdent (dtb__50) -> (match ((((v_Vuna_dCompiler_dFrontend_dParser_dSupport_dbinderNameTail 64) st) 2) Base_dList.C_Base_dList_dList_Nil) with
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Just (dtb__51) -> (Base_dMaybe.C_Base_dMaybe_dMaybe_Just ({ Base_dPair.f_Base_dPair_dPair_first = (Base_dMaybe.C_Base_dMaybe_dMaybe_Just (q)); Base_dPair.f_Base_dPair_dPair_second = (Base_dList.C_Base_dList_dList_Cons (dtb__50, dtb__51)) }))
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing -> Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing
  | _ -> failwith "DT: impossible branch"
)
  | _ -> Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing
)
  | _ -> failwith "DT: impossible branch"
)
  | _ -> Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing
)) ((v_Vuna_dCompiler_dFrontend_dParser_dSupport_dpeekTokAt st) 1)))

# 130 "Vuna/Compiler/Frontend/Parser/Support.vuna"
let v_Vuna_dCompiler_dFrontend_dParser_dSupport_dbinderHead = (fun st -> ((fun nd_uscrut1 -> (match nd_uscrut1 with
  | { Vuna_dCompiler_dFrontend_dLexer.f_Vuna_dCompiler_dFrontend_dLexer_dPTok_ptokTok = dtb__52; Vuna_dCompiler_dFrontend_dLexer.f_Vuna_dCompiler_dFrontend_dLexer_dPTok_ptokPos = dtb__53 } -> (match dtb__52 with
  | Vuna_dCompiler_dFrontend_dLexer.C_Vuna_dCompiler_dFrontend_dLexer_dTok_TInt (dtb__54) -> (if (dtb__54 = 0) then ((v_Vuna_dCompiler_dFrontend_dParser_dSupport_dquantifiedHead st) Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dQty_Q0) else (if (dtb__54 = 1) then ((v_Vuna_dCompiler_dFrontend_dParser_dSupport_dquantifiedHead st) Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dQty_Q1) else Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing))
  | Vuna_dCompiler_dFrontend_dLexer.C_Vuna_dCompiler_dFrontend_dLexer_dTok_TIdent (dtb__55) -> (match ((((v_Vuna_dCompiler_dFrontend_dParser_dSupport_dbinderNameTail 64) st) 1) Base_dList.C_Base_dList_dList_Nil) with
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Just (dtb__56) -> (Base_dMaybe.C_Base_dMaybe_dMaybe_Just ({ Base_dPair.f_Base_dPair_dPair_first = Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing; Base_dPair.f_Base_dPair_dPair_second = (Base_dList.C_Base_dList_dList_Cons (dtb__55, dtb__56)) }))
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing -> Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing
  | _ -> failwith "DT: impossible branch"
)
  | _ -> Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing
)
  | _ -> failwith "DT: impossible branch"
)) (v_Vuna_dCompiler_dFrontend_dParser_dSupport_dpeekTok st)))

# 155 "Vuna/Compiler/Frontend/Parser/Support.vuna"
let v_Vuna_dCompiler_dFrontend_dParser_dSupport_datKw = (fun st k -> ((fun nd_uscrut2 -> (match nd_uscrut2 with
  | { Vuna_dCompiler_dFrontend_dLexer.f_Vuna_dCompiler_dFrontend_dLexer_dPTok_ptokTok = dtb__57; Vuna_dCompiler_dFrontend_dLexer.f_Vuna_dCompiler_dFrontend_dLexer_dPTok_ptokPos = dtb__58 } -> (match dtb__57 with
  | Vuna_dCompiler_dFrontend_dLexer.C_Vuna_dCompiler_dFrontend_dLexer_dTok_TKw (dtb__59) -> (dtb__59 = k)
  | _ -> false
)
  | _ -> failwith "DT: impossible branch"
)) (v_Vuna_dCompiler_dFrontend_dParser_dSupport_dpeekTok st)))

# 160 "Vuna/Compiler/Frontend/Parser/Support.vuna"
let v_Vuna_dCompiler_dFrontend_dParser_dSupport_dcanContinue = (fun st blockCol -> (match (v_Vuna_dCompiler_dFrontend_dParser_dSupport_dpeekPos st) with
  | { Vuna_dCompiler_dSource.f_Vuna_dCompiler_dSource_dPos_posLine = dtb__60; Vuna_dCompiler_dSource.f_Vuna_dCompiler_dSource_dPos_posCol = dtb__61 } -> (match (v_Vuna_dCompiler_dFrontend_dParser_dSupport_dlastPos st) with
  | { Vuna_dCompiler_dSource.f_Vuna_dCompiler_dSource_dPos_posLine = dtb__62; Vuna_dCompiler_dSource.f_Vuna_dCompiler_dSource_dPos_posCol = dtb__63 } -> (if (dtb__60 = dtb__62) then true else (dtb__61 > blockCol))
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
))

# 167 "Vuna/Compiler/Frontend/Parser/Support.vuna"
let v_Vuna_dCompiler_dFrontend_dParser_dSupport_dexpectSym = (fun st s -> ((fun nd_uscrut2 -> (match nd_uscrut2 with
  | { Vuna_dCompiler_dFrontend_dLexer.f_Vuna_dCompiler_dFrontend_dLexer_dPTok_ptokTok = dtb__64; Vuna_dCompiler_dFrontend_dLexer.f_Vuna_dCompiler_dFrontend_dLexer_dPTok_ptokPos = dtb__65 } -> (match dtb__64 with
  | Vuna_dCompiler_dFrontend_dLexer.C_Vuna_dCompiler_dFrontend_dLexer_dTok_TSym (dtb__66) -> (if (dtb__66 = s) then (Vuna_dCompiler_dDiag.C_Vuna_dCompiler_dDiag_dCheck_OkC ((v_Vuna_dCompiler_dFrontend_dParser_dSupport_dadvance st))) else (((Vuna_dCompiler_dFrontend_dDiagnostics.v_Vuna_dCompiler_dFrontend_dDiagnostics_dpsErr1At (v_Vuna_dCompiler_dFrontend_dParser_dSupport_dtokSpan st)) (Vuna_dCompiler_dFrontend_dDiagnostics.C_Vuna_dCompiler_dFrontend_dDiagnostics_dPsDiag_ExpectedToken (s))) s))
  | _ -> (((Vuna_dCompiler_dFrontend_dDiagnostics.v_Vuna_dCompiler_dFrontend_dDiagnostics_dpsErr1At (v_Vuna_dCompiler_dFrontend_dParser_dSupport_dtokSpan st)) (Vuna_dCompiler_dFrontend_dDiagnostics.C_Vuna_dCompiler_dFrontend_dDiagnostics_dPsDiag_ExpectedToken (s))) s)
)
  | _ -> failwith "DT: impossible branch"
)) (v_Vuna_dCompiler_dFrontend_dParser_dSupport_dpeekTok st)))

# 172 "Vuna/Compiler/Frontend/Parser/Support.vuna"
let v_Vuna_dCompiler_dFrontend_dParser_dSupport_dexpectKw = (fun st k -> ((fun nd_uscrut2 -> (match nd_uscrut2 with
  | { Vuna_dCompiler_dFrontend_dLexer.f_Vuna_dCompiler_dFrontend_dLexer_dPTok_ptokTok = dtb__67; Vuna_dCompiler_dFrontend_dLexer.f_Vuna_dCompiler_dFrontend_dLexer_dPTok_ptokPos = dtb__68 } -> (match dtb__67 with
  | Vuna_dCompiler_dFrontend_dLexer.C_Vuna_dCompiler_dFrontend_dLexer_dTok_TKw (dtb__69) -> (if (dtb__69 = k) then (Vuna_dCompiler_dDiag.C_Vuna_dCompiler_dDiag_dCheck_OkC ((v_Vuna_dCompiler_dFrontend_dParser_dSupport_dadvance st))) else (((Vuna_dCompiler_dFrontend_dDiagnostics.v_Vuna_dCompiler_dFrontend_dDiagnostics_dpsErr1At (v_Vuna_dCompiler_dFrontend_dParser_dSupport_dtokSpan st)) (Vuna_dCompiler_dFrontend_dDiagnostics.C_Vuna_dCompiler_dFrontend_dDiagnostics_dPsDiag_ExpectedToken (k))) k))
  | _ -> (((Vuna_dCompiler_dFrontend_dDiagnostics.v_Vuna_dCompiler_dFrontend_dDiagnostics_dpsErr1At (v_Vuna_dCompiler_dFrontend_dParser_dSupport_dtokSpan st)) (Vuna_dCompiler_dFrontend_dDiagnostics.C_Vuna_dCompiler_dFrontend_dDiagnostics_dPsDiag_ExpectedToken (k))) k)
)
  | _ -> failwith "DT: impossible branch"
)) (v_Vuna_dCompiler_dFrontend_dParser_dSupport_dpeekTok st)))

# 177 "Vuna/Compiler/Frontend/Parser/Support.vuna"
let v_Vuna_dCompiler_dFrontend_dParser_dSupport_dexpectIdent = (fun st -> ((fun nd_uscrut1 -> (match nd_uscrut1 with
  | { Vuna_dCompiler_dFrontend_dLexer.f_Vuna_dCompiler_dFrontend_dLexer_dPTok_ptokTok = dtb__70; Vuna_dCompiler_dFrontend_dLexer.f_Vuna_dCompiler_dFrontend_dLexer_dPTok_ptokPos = dtb__71 } -> (match dtb__70 with
  | Vuna_dCompiler_dFrontend_dLexer.C_Vuna_dCompiler_dFrontend_dLexer_dTok_TIdent (dtb__72) -> (Vuna_dCompiler_dDiag.C_Vuna_dCompiler_dDiag_dCheck_OkC ({ Base_dPair.f_Base_dPair_dPair_first = dtb__72; Base_dPair.f_Base_dPair_dPair_second = (v_Vuna_dCompiler_dFrontend_dParser_dSupport_dadvance st) }))
  | _ -> ((Vuna_dCompiler_dFrontend_dDiagnostics.v_Vuna_dCompiler_dFrontend_dDiagnostics_dpsErr0At (v_Vuna_dCompiler_dFrontend_dParser_dSupport_dtokSpan st)) Vuna_dCompiler_dFrontend_dDiagnostics.C_Vuna_dCompiler_dFrontend_dDiagnostics_dPsDiag_ExpectedIdentifier)
)
  | _ -> failwith "DT: impossible branch"
)) (v_Vuna_dCompiler_dFrontend_dParser_dSupport_dpeekTok st)))

# 194 "Vuna/Compiler/Frontend/Parser/Support.vuna"
let v_Vuna_dCompiler_dFrontend_dParser_dSupport_dupperFirst = (fun s -> (match (Base_dList.dtp_unpack s) with
  | Base_dList.C_Base_dList_dList_Cons (dtb__73, dtb__74) -> (if (dtb__73 >= 65) then (dtb__73 <= 90) else false)
  | Base_dList.C_Base_dList_dList_Nil -> false
  | _ -> failwith "DT: impossible branch"
))

# 201 "Vuna/Compiler/Frontend/Parser/Support.vuna"
let v_Vuna_dCompiler_dFrontend_dParser_dSupport_dunderscoreCtorName = (fun s -> (match (Base_dList.dtp_unpack s) with
  | Base_dList.C_Base_dList_dList_Cons (dtb__75, dtb__76) -> (if (dtb__75 = 95) then (match dtb__76 with
  | Base_dList.C_Base_dList_dList_Cons (dtb__77, dtb__78) -> (if (dtb__77 >= 65) then (dtb__77 <= 90) else false)
  | Base_dList.C_Base_dList_dList_Nil -> false
  | _ -> failwith "DT: impossible branch"
) else false)
  | Base_dList.C_Base_dList_dList_Nil -> false
  | _ -> failwith "DT: impossible branch"
))

# 209 "Vuna/Compiler/Frontend/Parser/Support.vuna"
let v_Vuna_dCompiler_dFrontend_dParser_dSupport_dctorPatternStart = (fun name -> (if (v_Vuna_dCompiler_dFrontend_dParser_dSupport_dupperFirst name) then true else (v_Vuna_dCompiler_dFrontend_dParser_dSupport_dunderscoreCtorName name)))

# 230 "Vuna/Compiler/Frontend/Parser/Support.vuna"
let v_Vuna_dCompiler_dFrontend_dParser_dSupport_dholeAtomAt = (fun st -> ((fun nd_uscrut1 -> (match nd_uscrut1 with
  | { Vuna_dCompiler_dFrontend_dLexer.f_Vuna_dCompiler_dFrontend_dLexer_dPTok_ptokTok = dtb__79; Vuna_dCompiler_dFrontend_dLexer.f_Vuna_dCompiler_dFrontend_dLexer_dPTok_ptokPos = dtb__80 } -> (match dtb__79 with
  | Vuna_dCompiler_dFrontend_dLexer.C_Vuna_dCompiler_dFrontend_dLexer_dTok_TSym (dtb__81) -> (if (dtb__81 = "?") then ((fun nd_uscrut5 -> (match nd_uscrut5 with
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Just (dtb__82) -> (match dtb__82 with
  | { Vuna_dCompiler_dFrontend_dLexer.f_Vuna_dCompiler_dFrontend_dLexer_dPTok_ptokTok = dtb__83; Vuna_dCompiler_dFrontend_dLexer.f_Vuna_dCompiler_dFrontend_dLexer_dPTok_ptokPos = dtb__84 } -> (match dtb__83 with
  | Vuna_dCompiler_dFrontend_dLexer.C_Vuna_dCompiler_dFrontend_dLexer_dTok_TIdent (dtb__85) -> (if (if ((Vuna_dCompiler_dSource.v_Vuna_dCompiler_dSource_dposLine dtb__84) = (Vuna_dCompiler_dSource.v_Vuna_dCompiler_dSource_dposLine dtb__80)) then ((Vuna_dCompiler_dSource.v_Vuna_dCompiler_dSource_dposCol dtb__84) = ((Vuna_dCompiler_dSource.v_Vuna_dCompiler_dSource_dposCol dtb__80) + 1)) else false) then (Base_dMaybe.C_Base_dMaybe_dMaybe_Just ({ Base_dPair.f_Base_dPair_dPair_first = ("?" ^ dtb__85); Base_dPair.f_Base_dPair_dPair_second = { Vuna_dCompiler_dSource.f_Vuna_dCompiler_dSource_dSpan_spanFile = (v_Vuna_dCompiler_dFrontend_dParser_dSupport_dfileOf st); Vuna_dCompiler_dSource.f_Vuna_dCompiler_dSource_dSpan_spanStartLine = (Vuna_dCompiler_dSource.v_Vuna_dCompiler_dSource_dposLine dtb__80); Vuna_dCompiler_dSource.f_Vuna_dCompiler_dSource_dSpan_spanStartCol = (Vuna_dCompiler_dSource.v_Vuna_dCompiler_dSource_dposCol dtb__80); Vuna_dCompiler_dSource.f_Vuna_dCompiler_dSource_dSpan_spanEndLine = (Vuna_dCompiler_dSource.v_Vuna_dCompiler_dSource_dposLine dtb__84); Vuna_dCompiler_dSource.f_Vuna_dCompiler_dSource_dSpan_spanEndCol = ((Vuna_dCompiler_dSource.v_Vuna_dCompiler_dSource_dposCol dtb__84) + (bi_strLength dtb__85)) } })) else Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing)
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

# 212 "Vuna/Compiler/Frontend/Parser/Support.vuna"
let v_Vuna_dCompiler_dFrontend_dParser_dSupport_dstartsAtom = (fun st -> ((fun nd_uscrut1 -> (match nd_uscrut1 with
  | { Vuna_dCompiler_dFrontend_dLexer.f_Vuna_dCompiler_dFrontend_dLexer_dPTok_ptokTok = dtb__86; Vuna_dCompiler_dFrontend_dLexer.f_Vuna_dCompiler_dFrontend_dLexer_dPTok_ptokPos = dtb__87 } -> (match dtb__86 with
  | Vuna_dCompiler_dFrontend_dLexer.C_Vuna_dCompiler_dFrontend_dLexer_dTok_TSym (dtb__88) -> (if (dtb__88 = "(") then true else (if (dtb__88 = "[") then true else (if (dtb__88 = "?") then (match (v_Vuna_dCompiler_dFrontend_dParser_dSupport_dholeAtomAt st) with
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Just (dtb__89) -> true
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing -> false
  | _ -> failwith "DT: impossible branch"
) else false)))
  | Vuna_dCompiler_dFrontend_dLexer.C_Vuna_dCompiler_dFrontend_dLexer_dTok_TKw (dtb__90) -> (if (dtb__90 = "Type") then true else false)
  | Vuna_dCompiler_dFrontend_dLexer.C_Vuna_dCompiler_dFrontend_dLexer_dTok_TTmpl (dtb__91, dtb__92, dtb__93) -> true
  | Vuna_dCompiler_dFrontend_dLexer.C_Vuna_dCompiler_dFrontend_dLexer_dTok_TStr (dtb__94) -> true
  | Vuna_dCompiler_dFrontend_dLexer.C_Vuna_dCompiler_dFrontend_dLexer_dTok_TFloat (dtb__95) -> true
  | Vuna_dCompiler_dFrontend_dLexer.C_Vuna_dCompiler_dFrontend_dLexer_dTok_TInt (dtb__96) -> true
  | Vuna_dCompiler_dFrontend_dLexer.C_Vuna_dCompiler_dFrontend_dLexer_dTok_TIdent (dtb__97) -> true
  | _ -> false
)
  | _ -> failwith "DT: impossible branch"
)) (v_Vuna_dCompiler_dFrontend_dParser_dSupport_dpeekTok st)))

# 240 "Vuna/Compiler/Frontend/Parser/Support.vuna"
let v_Vuna_dCompiler_dFrontend_dParser_dSupport_dstartsPatternAtom = (fun st -> ((fun nd_uscrut1 -> (match nd_uscrut1 with
  | { Vuna_dCompiler_dFrontend_dLexer.f_Vuna_dCompiler_dFrontend_dLexer_dPTok_ptokTok = dtb__98; Vuna_dCompiler_dFrontend_dLexer.f_Vuna_dCompiler_dFrontend_dLexer_dPTok_ptokPos = dtb__99 } -> (match dtb__98 with
  | Vuna_dCompiler_dFrontend_dLexer.C_Vuna_dCompiler_dFrontend_dLexer_dTok_TSym (dtb__100) -> (if (dtb__100 = "(") then true else (if (dtb__100 = "[") then true else false))
  | Vuna_dCompiler_dFrontend_dLexer.C_Vuna_dCompiler_dFrontend_dLexer_dTok_TTmpl (dtb__101, dtb__102, dtb__103) -> true
  | Vuna_dCompiler_dFrontend_dLexer.C_Vuna_dCompiler_dFrontend_dLexer_dTok_TStr (dtb__104) -> true
  | Vuna_dCompiler_dFrontend_dLexer.C_Vuna_dCompiler_dFrontend_dLexer_dTok_TInt (dtb__105) -> true
  | Vuna_dCompiler_dFrontend_dLexer.C_Vuna_dCompiler_dFrontend_dLexer_dTok_TIdent (dtb__106) -> true
  | _ -> false
)
  | _ -> failwith "DT: impossible branch"
)) (v_Vuna_dCompiler_dFrontend_dParser_dSupport_dpeekTok st)))

# 252 "Vuna/Compiler/Frontend/Parser/Support.vuna"
let v_Vuna_dCompiler_dFrontend_dParser_dSupport_disSyntaxSym = (fun op -> (if (op = "=") then true else (if (op = ":") then true else (if (op = ",") then true else (if (op = ";") then true else (if (op = "|") then true else (if (op = "=>") then true else (if (op = "<-") then true else (if (op = "\\") then true else (if (op = ".") then true else (if (op = "..") then true else (if (op = "@") then true else (if (op = "(") then true else (if (op = ")") then true else (if (op = "[") then true else (if (op = "]") then true else (if (op = "{") then true else (if (op = "}") then true else false))))))))))))))))))

# 278 "Vuna/Compiler/Frontend/Parser/Support.vuna"
let v_Vuna_dCompiler_dFrontend_dParser_dSupport_disReservedValueName = (fun name -> (if (if (v_Vuna_dCompiler_dFrontend_dParser_dSupport_disSyntaxSym name) then true else (name = "->")) then true else (name = "`")))

# 184 "Vuna/Compiler/Frontend/Parser/Support.vuna"
let v_Vuna_dCompiler_dFrontend_dParser_dSupport_dexpectValueName = (fun st -> ((fun nd_uscrut1 -> (match nd_uscrut1 with
  | { Vuna_dCompiler_dFrontend_dLexer.f_Vuna_dCompiler_dFrontend_dLexer_dPTok_ptokTok = dtb__107; Vuna_dCompiler_dFrontend_dLexer.f_Vuna_dCompiler_dFrontend_dLexer_dPTok_ptokPos = dtb__108 } -> (match dtb__107 with
  | Vuna_dCompiler_dFrontend_dLexer.C_Vuna_dCompiler_dFrontend_dLexer_dTok_TSym (dtb__109) -> (if (v_Vuna_dCompiler_dFrontend_dParser_dSupport_disReservedValueName dtb__109) then (((Vuna_dCompiler_dFrontend_dDiagnostics.v_Vuna_dCompiler_dFrontend_dDiagnostics_dpsErr1At (v_Vuna_dCompiler_dFrontend_dParser_dSupport_dtokSpan st)) (Vuna_dCompiler_dFrontend_dDiagnostics.C_Vuna_dCompiler_dFrontend_dDiagnostics_dPsDiag_ExpectedToken ("value name"))) "value name") else (Vuna_dCompiler_dDiag.C_Vuna_dCompiler_dDiag_dCheck_OkC ({ Base_dPair.f_Base_dPair_dPair_first = dtb__109; Base_dPair.f_Base_dPair_dPair_second = (v_Vuna_dCompiler_dFrontend_dParser_dSupport_dadvance st) })))
  | Vuna_dCompiler_dFrontend_dLexer.C_Vuna_dCompiler_dFrontend_dLexer_dTok_TIdent (dtb__110) -> (if (v_Vuna_dCompiler_dFrontend_dParser_dSupport_disReservedValueName dtb__110) then (((Vuna_dCompiler_dFrontend_dDiagnostics.v_Vuna_dCompiler_dFrontend_dDiagnostics_dpsErr1At (v_Vuna_dCompiler_dFrontend_dParser_dSupport_dtokSpan st)) (Vuna_dCompiler_dFrontend_dDiagnostics.C_Vuna_dCompiler_dFrontend_dDiagnostics_dPsDiag_ExpectedToken ("value name"))) "value name") else (Vuna_dCompiler_dDiag.C_Vuna_dCompiler_dDiag_dCheck_OkC ({ Base_dPair.f_Base_dPair_dPair_first = dtb__110; Base_dPair.f_Base_dPair_dPair_second = (v_Vuna_dCompiler_dFrontend_dParser_dSupport_dadvance st) })))
  | _ -> ((Vuna_dCompiler_dFrontend_dDiagnostics.v_Vuna_dCompiler_dFrontend_dDiagnostics_dpsErr0At (v_Vuna_dCompiler_dFrontend_dParser_dSupport_dtokSpan st)) Vuna_dCompiler_dFrontend_dDiagnostics.C_Vuna_dCompiler_dFrontend_dDiagnostics_dPsDiag_ExpectedIdentifier)
)
  | _ -> failwith "DT: impossible branch"
)) (v_Vuna_dCompiler_dFrontend_dParser_dSupport_dpeekTok st)))

# 283 "Vuna/Compiler/Frontend/Parser/Support.vuna"
let v_Vuna_dCompiler_dFrontend_dParser_dSupport_dcloseParenNext = (fun st -> ((fun nd_uscrut1 -> (match nd_uscrut1 with
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Just (dtb__111) -> (match dtb__111 with
  | { Vuna_dCompiler_dFrontend_dLexer.f_Vuna_dCompiler_dFrontend_dLexer_dPTok_ptokTok = dtb__112; Vuna_dCompiler_dFrontend_dLexer.f_Vuna_dCompiler_dFrontend_dLexer_dPTok_ptokPos = dtb__113 } -> (match dtb__112 with
  | Vuna_dCompiler_dFrontend_dLexer.C_Vuna_dCompiler_dFrontend_dLexer_dTok_TSym (dtb__114) -> (if (dtb__114 = ")") then true else false)
  | _ -> false
)
  | _ -> failwith "DT: impossible branch"
)
  | _ -> false
)) ((v_Vuna_dCompiler_dFrontend_dParser_dSupport_dpeekTokAt st) 1)))

# 291 "Vuna/Compiler/Frontend/Parser/Support.vuna"
let v_Vuna_dCompiler_dFrontend_dParser_dSupport_dsectionOpAt = (fun st -> ((fun nd_uscrut1 -> (match nd_uscrut1 with
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Just (dtb__115) -> (match dtb__115 with
  | { Vuna_dCompiler_dFrontend_dLexer.f_Vuna_dCompiler_dFrontend_dLexer_dPTok_ptokTok = dtb__116; Vuna_dCompiler_dFrontend_dLexer.f_Vuna_dCompiler_dFrontend_dLexer_dPTok_ptokPos = dtb__117 } -> (match dtb__116 with
  | Vuna_dCompiler_dFrontend_dLexer.C_Vuna_dCompiler_dFrontend_dLexer_dTok_TSym (dtb__118) -> (if (v_Vuna_dCompiler_dFrontend_dParser_dSupport_disReservedValueName dtb__118) then Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing else (if (dtb__118 = "?") then (match (v_Vuna_dCompiler_dFrontend_dParser_dSupport_dholeAtomAt (v_Vuna_dCompiler_dFrontend_dParser_dSupport_dadvance st)) with
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Just (dtb__119) -> Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing -> (Base_dMaybe.C_Base_dMaybe_dMaybe_Just (dtb__118))
  | _ -> failwith "DT: impossible branch"
) else (Base_dMaybe.C_Base_dMaybe_dMaybe_Just (dtb__118))))
  | _ -> Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing
)
  | _ -> failwith "DT: impossible branch"
)
  | _ -> Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing
)) ((v_Vuna_dCompiler_dFrontend_dParser_dSupport_dpeekTokAt st) 1)))

# 300 "Vuna/Compiler/Frontend/Parser/Support.vuna"
let rec v_Vuna_dCompiler_dFrontend_dParser_dSupport_dcountArrows = (fun mc0 -> (match mc0 with
  | Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dExpr_EApp (dtb__120, dtb__121, dtb__122) -> (match dtb__120 with
  | Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dExpr_EVar (dtb__123, dtb__124) -> (if (dtb__123 = "->") then (match dtb__121 with
  | Base_dList.C_Base_dList_dList_Cons (dtb__125, dtb__126) -> (match dtb__126 with
  | Base_dList.C_Base_dList_dList_Cons (dtb__127, dtb__128) -> (match dtb__128 with
  | Base_dList.C_Base_dList_dList_Nil -> (1 + (v_Vuna_dCompiler_dFrontend_dParser_dSupport_dcountArrows dtb__127))
  | _ -> 0
)
  | _ -> 0
)
  | _ -> 0
) else 0)
  | _ -> 0
)
  | Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dExpr_EInfix (dtb__129, dtb__130, dtb__131, dtb__132) -> (if (dtb__129 = "->") then (1 + (v_Vuna_dCompiler_dFrontend_dParser_dSupport_dcountArrows dtb__131)) else 0)
  | _ -> 0
))

# 305 "Vuna/Compiler/Frontend/Parser/Support.vuna"
let v_Vuna_dCompiler_dFrontend_dParser_dSupport_dterminatesExpression = (fun mc0 -> (match mc0 with
  | { Vuna_dCompiler_dFrontend_dLexer.f_Vuna_dCompiler_dFrontend_dLexer_dPTok_ptokTok = dtb__133; Vuna_dCompiler_dFrontend_dLexer.f_Vuna_dCompiler_dFrontend_dLexer_dPTok_ptokPos = dtb__134 } -> (match dtb__133 with
  | Vuna_dCompiler_dFrontend_dLexer.C_Vuna_dCompiler_dFrontend_dLexer_dTok_TKw (dtb__135) -> (if (dtb__135 = "else") then true else (if (dtb__135 = "in") then true else (if (dtb__135 = "then") then true else false)))
  | Vuna_dCompiler_dFrontend_dLexer.C_Vuna_dCompiler_dFrontend_dLexer_dTok_TSym (dtb__136) -> (if (dtb__136 = ")") then true else (if (dtb__136 = "]") then true else (if (dtb__136 = ",") then true else false)))
  | _ -> false
)
  | _ -> failwith "DT: impossible branch"
))

# 314 "Vuna/Compiler/Frontend/Parser/Support.vuna"
let v_Vuna_dCompiler_dFrontend_dParser_dSupport_dbadCaseIndent = (fun st altCol -> (if (v_Vuna_dCompiler_dFrontend_dParser_dSupport_disEof st) then false else (match (v_Vuna_dCompiler_dFrontend_dParser_dSupport_dpeekPos st) with
  | { Vuna_dCompiler_dSource.f_Vuna_dCompiler_dSource_dPos_posLine = dtb__137; Vuna_dCompiler_dSource.f_Vuna_dCompiler_dSource_dPos_posCol = dtb__138 } -> (if (dtb__138 > altCol) then (if (v_Vuna_dCompiler_dFrontend_dParser_dSupport_dterminatesExpression (v_Vuna_dCompiler_dFrontend_dParser_dSupport_dpeekTok st)) then false else true) else false)
  | _ -> failwith "DT: impossible branch"
)))
