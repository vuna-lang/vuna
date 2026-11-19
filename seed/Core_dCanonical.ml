open Vuna_runtime
# 26 "Vuna/Compiler/Core/Canonical.vuna"
let v_noSpan = { Base_dSource.f_Span_spanFile = ""; Base_dSource.f_Span_spanStartLine = 0; Base_dSource.f_Span_spanStartCol = 0; Base_dSource.f_Span_spanEndLine = 0; Base_dSource.f_Span_spanEndCol = 0; Base_dSource.f_Span_spanStartOffset = 0; Base_dSource.f_Span_spanEndOffset = 0 }

# 33 "Vuna/Compiler/Core/Canonical.vuna"
let v_encRig = (fun (mc0 : Core_dTerm.t_Rig) (mc1 : string B_dData_dList.t_List) -> (match mc0 with
  | Core_dTerm.C_Rig_RigOmega -> ((Base_dBytes.v_encTag 2) mc1)
  | Core_dTerm.C_Rig_Rig1 -> ((Base_dBytes.v_encTag 1) mc1)
  | Core_dTerm.C_Rig_Rig0 -> ((Base_dBytes.v_encTag 0) mc1)
  | _ -> failwith "DT: impossible branch"
))

# 52 "Vuna/Compiler/Core/Canonical.vuna"
let v_encBinder = (fun (mc0 : (string, Core_dTerm.t_Rig) B_dData_dPair.t_Pair) (mc1 : string B_dData_dList.t_List) -> (match mc0 with
  | { B_dData_dPair.f_Pair_first = dtb__0; B_dData_dPair.f_Pair_second = dtb__1 } -> ((Base_dBytes.v_encStr dtb__0) ((v_encRig dtb__1) mc1))
  | _ -> failwith "DT: impossible branch"
))

# 56 "Vuna/Compiler/Core/Canonical.vuna"
let v_encBinders = (fun (bs : (string, Core_dTerm.t_Rig) B_dData_dPair.t_Pair B_dData_dList.t_List) (acc : string B_dData_dList.t_List) -> (((Base_dBytes.v_encList v_encBinder) bs) acc))

# 73 "Vuna/Compiler/Core/Canonical.vuna"
let v_encInts = (fun (xs : int B_dData_dList.t_List) (acc : string B_dData_dList.t_List) -> (((Base_dBytes.v_encList Base_dBytes.v_encInt) xs) acc))

# 39 "Vuna/Compiler/Core/Canonical.vuna"
let rec v_encArg = (fun (mc0 : (Core_dTerm.t_Term, Core_dTerm.t_Rig) B_dData_dPair.t_Pair) (mc1 : string B_dData_dList.t_List) -> (match mc0 with
  | { B_dData_dPair.f_Pair_first = dtb__2; B_dData_dPair.f_Pair_second = dtb__3 } -> ((v_encTerm dtb__2) ((v_encRig dtb__3) mc1))
  | _ -> failwith "DT: impossible branch"
))
# 43 "Vuna/Compiler/Core/Canonical.vuna"
and v_encArgs = (fun (xs : (Core_dTerm.t_Term, Core_dTerm.t_Rig) B_dData_dPair.t_Pair B_dData_dList.t_List) (acc : string B_dData_dList.t_List) -> (B_dData_dList.C_List__x58__x58_ ("[", (B_dData_dList.C_List__x58__x58_ ((bi_strFromInt (Base_dBytes.v_lenOf xs)), (B_dData_dList.C_List__x58__x58_ (":", ((v_encArgsGo xs) acc))))))))
# 47 "Vuna/Compiler/Core/Canonical.vuna"
and v_encArgsGo = (fun (mc0 : (Core_dTerm.t_Term, Core_dTerm.t_Rig) B_dData_dPair.t_Pair B_dData_dList.t_List) (mc1 : string B_dData_dList.t_List) -> (match mc0 with
  | B_dData_dList.C_List__x58__x58_ (dtb__4, dtb__5) -> ((v_encArg dtb__4) ((v_encArgsGo dtb__5) mc1))
  | B_dData_dList.C_List_Nil -> mc1
  | _ -> failwith "DT: impossible branch"
))
# 60 "Vuna/Compiler/Core/Canonical.vuna"
and v_encAlt = (fun (mc0 : Core_dTerm.t_CaseAlt) (mc1 : string B_dData_dList.t_List) -> (match mc0 with
  | { Core_dTerm.f_CaseAlt_caseAltName = dtb__6; Core_dTerm.f_CaseAlt_caseAltBinders = dtb__7; Core_dTerm.f_CaseAlt_caseAltBody = dtb__8 } -> ((Base_dBytes.v_encStr dtb__6) ((v_encBinders (Core_dTerm.v_binderPairs dtb__7)) ((v_encTerm dtb__8) mc1)))
  | _ -> failwith "DT: impossible branch"
))
# 64 "Vuna/Compiler/Core/Canonical.vuna"
and v_encAlts = (fun (xs : Core_dTerm.t_CaseAlt B_dData_dList.t_List) (acc : string B_dData_dList.t_List) -> (B_dData_dList.C_List__x58__x58_ ("[", (B_dData_dList.C_List__x58__x58_ ((bi_strFromInt (Base_dBytes.v_lenOf xs)), (B_dData_dList.C_List__x58__x58_ (":", ((v_encAltsGo xs) acc))))))))
# 68 "Vuna/Compiler/Core/Canonical.vuna"
and v_encAltsGo = (fun (mc0 : Core_dTerm.t_CaseAlt B_dData_dList.t_List) (mc1 : string B_dData_dList.t_List) -> (match mc0 with
  | B_dData_dList.C_List__x58__x58_ (dtb__9, dtb__10) -> ((v_encAlt dtb__9) ((v_encAltsGo dtb__10) mc1))
  | B_dData_dList.C_List_Nil -> mc1
  | _ -> failwith "DT: impossible branch"
))
# 77 "Vuna/Compiler/Core/Canonical.vuna"
and v_encTerm = (fun (mc0 : Core_dTerm.t_Term) (mc1 : string B_dData_dList.t_List) -> (match mc0 with
  | Core_dTerm.C_Term_TRecord (dtb__11, dtb__12) -> ((Base_dBytes.v_encTag 17) ((Base_dBytes.v_encStr dtb__11) ((v_encArgs dtb__12) mc1)))
  | Core_dTerm.C_Term_TFloat (dtb__13) -> ((Base_dBytes.v_encTag 16) ((Base_dBytes.v_encStr dtb__13) mc1))
  | Core_dTerm.C_Term_TIf (dtb__14, dtb__15, dtb__16) -> ((Base_dBytes.v_encTag 15) ((v_encTerm dtb__14) ((v_encTerm dtb__15) ((v_encTerm dtb__16) mc1))))
  | Core_dTerm.C_Term_TBool (dtb__17) -> ((Base_dBytes.v_encTag 14) ((Base_dBytes.v_encBool dtb__17) mc1))
  | Core_dTerm.C_Term_TStr (dtb__18) -> ((Base_dBytes.v_encTag 13) ((Base_dBytes.v_encStr dtb__18) mc1))
  | Core_dTerm.C_Term_TInt (dtb__19) -> ((Base_dBytes.v_encTag 12) ((Base_dBytes.v_encInt dtb__19) mc1))
  | Core_dTerm.C_Term_TRecUpd (dtb__20, dtb__21, dtb__22, dtb__23, dtb__24) -> ((Base_dBytes.v_encTag 11) ((v_encTerm dtb__20) ((Base_dBytes.v_encStr dtb__21) ((v_encBinders dtb__22) ((v_encInts dtb__23) ((v_encTerm dtb__24) mc1))))))
  | Core_dTerm.C_Term_TProj (dtb__25, dtb__26, dtb__27, dtb__28, dtb__29) -> ((Base_dBytes.v_encTag 10) ((v_encTerm dtb__25) ((Base_dBytes.v_encStr dtb__26) ((v_encBinders dtb__27) ((Base_dBytes.v_encInt dtb__28) ((Base_dBytes.v_encInt dtb__29) mc1))))))
  | Core_dTerm.C_Term_TCase (dtb__30, dtb__31) -> ((Base_dBytes.v_encTag 9) ((v_encTerm dtb__30) ((v_encAlts dtb__31) mc1)))
  | Core_dTerm.C_Term_TMk (dtb__32, dtb__33) -> ((Base_dBytes.v_encTag 8) ((Base_dBytes.v_encStr dtb__32) ((v_encArgs dtb__33) mc1)))
  | Core_dTerm.C_Term_TCon (dtb__34, dtb__35) -> ((Base_dBytes.v_encTag 7) ((Base_dBytes.v_encStr dtb__34) ((v_encArgs dtb__35) mc1)))
  | Core_dTerm.C_Term_TApp (dtb__36, dtb__37, dtb__38) -> ((Base_dBytes.v_encTag 6) ((v_encTerm dtb__36) ((v_encTerm dtb__37) ((v_encRig dtb__38) mc1))))
  | Core_dTerm.C_Term_TLam (dtb__39, dtb__40, dtb__41, dtb__42, dtb__43) -> ((Base_dBytes.v_encTag 5) ((Base_dBytes.v_encStr dtb__39) ((v_encRig dtb__40) ((v_encTerm dtb__43) mc1))))
  | Core_dTerm.C_Term_TPi (dtb__44, dtb__45, dtb__46, dtb__47, dtb__48) -> ((Base_dBytes.v_encTag 4) ((Base_dBytes.v_encStr dtb__44) ((Base_dBytes.v_encBool dtb__45) ((v_encRig dtb__46) ((v_encTerm dtb__47) ((v_encTerm dtb__48) mc1))))))
  | Core_dTerm.C_Term_TType (dtb__49) -> ((Base_dBytes.v_encTag 3) ((Base_dBytes.v_encInt (Core_dTerm.v_levelToInt dtb__49)) mc1))
  | Core_dTerm.C_Term_TGlobal (dtb__50) -> ((Base_dBytes.v_encTag 2) ((Base_dBytes.v_encStr dtb__50) mc1))
  | Core_dTerm.C_Term_TMeta (dtb__51) -> ((Base_dBytes.v_encTag 1) ((Base_dBytes.v_encInt dtb__51) mc1))
  | Core_dTerm.C_Term_TVar (dtb__52, dtb__53, dtb__54) -> ((Base_dBytes.v_encTag 0) ((Base_dBytes.v_encStr dtb__52) ((Base_dBytes.v_encInt dtb__53) mc1)))
  | _ -> failwith "DT: impossible branch"
))

# 100 "Vuna/Compiler/Core/Canonical.vuna"
let v_encTermBytes = (fun (t : Core_dTerm.t_Term) -> ((Base_dBytes.v_encTop v_encTerm) t))

# 108 "Vuna/Compiler/Core/Canonical.vuna"
let v_decRig = (fun (fuel : int) (bytes : Base_dBytes.t_Cur) -> (if (fuel <= 0) then B_dData_dMaybe.C_Maybe_Nothing else ((fun nd_uscrut2 -> (match nd_uscrut2 with
  | B_dData_dMaybe.C_Maybe_Just (dtb__55) -> (match dtb__55 with
  | { B_dData_dPair.f_Pair_first = dtb__56; B_dData_dPair.f_Pair_second = dtb__57 } -> (if (dtb__56 = 0) then (B_dData_dMaybe.C_Maybe_Just ({ B_dData_dPair.f_Pair_first = Core_dTerm.C_Rig_Rig0; B_dData_dPair.f_Pair_second = dtb__57 })) else (if (dtb__56 = 1) then (B_dData_dMaybe.C_Maybe_Just ({ B_dData_dPair.f_Pair_first = Core_dTerm.C_Rig_Rig1; B_dData_dPair.f_Pair_second = dtb__57 })) else (if (dtb__56 = 2) then (B_dData_dMaybe.C_Maybe_Just ({ B_dData_dPair.f_Pair_first = Core_dTerm.C_Rig_RigOmega; B_dData_dPair.f_Pair_second = dtb__57 })) else B_dData_dMaybe.C_Maybe_Nothing)))
  | _ -> failwith "DT: impossible branch"
)
  | B_dData_dMaybe.C_Maybe_Nothing -> B_dData_dMaybe.C_Maybe_Nothing
  | _ -> failwith "DT: impossible branch"
)) ((Base_dBytes.v_decTag fuel) bytes))))

# 136 "Vuna/Compiler/Core/Canonical.vuna"
let v_decBinder = (fun (fuel : int) (bytes : Base_dBytes.t_Cur) -> (if (fuel <= 0) then B_dData_dMaybe.C_Maybe_Nothing else ((fun nd_uscrut2 -> (match nd_uscrut2 with
  | B_dData_dMaybe.C_Maybe_Just (dtb__58) -> (match dtb__58 with
  | { B_dData_dPair.f_Pair_first = dtb__59; B_dData_dPair.f_Pair_second = dtb__60 } -> ((fun nd_uscrut9 -> (match nd_uscrut9 with
  | B_dData_dMaybe.C_Maybe_Just (dtb__61) -> (match dtb__61 with
  | { B_dData_dPair.f_Pair_first = dtb__62; B_dData_dPair.f_Pair_second = dtb__63 } -> (B_dData_dMaybe.C_Maybe_Just ({ B_dData_dPair.f_Pair_first = { B_dData_dPair.f_Pair_first = dtb__59; B_dData_dPair.f_Pair_second = dtb__62 }; B_dData_dPair.f_Pair_second = dtb__63 }))
  | _ -> failwith "DT: impossible branch"
)
  | B_dData_dMaybe.C_Maybe_Nothing -> B_dData_dMaybe.C_Maybe_Nothing
  | _ -> failwith "DT: impossible branch"
)) ((v_decRig (fuel - 1)) dtb__60))
  | _ -> failwith "DT: impossible branch"
)
  | B_dData_dMaybe.C_Maybe_Nothing -> B_dData_dMaybe.C_Maybe_Nothing
  | _ -> failwith "DT: impossible branch"
)) ((Base_dBytes.v_decStr (fuel - 1)) bytes))))

# 123 "Vuna/Compiler/Core/Canonical.vuna"
let rec v_decArg = (fun (fuel : int) (bytes : Base_dBytes.t_Cur) -> (if (fuel <= 0) then B_dData_dMaybe.C_Maybe_Nothing else ((fun nd_uscrut2 -> (match nd_uscrut2 with
  | B_dData_dMaybe.C_Maybe_Just (dtb__64) -> (match dtb__64 with
  | { B_dData_dPair.f_Pair_first = dtb__65; B_dData_dPair.f_Pair_second = dtb__66 } -> ((fun nd_uscrut9 -> (match nd_uscrut9 with
  | B_dData_dMaybe.C_Maybe_Just (dtb__67) -> (match dtb__67 with
  | { B_dData_dPair.f_Pair_first = dtb__68; B_dData_dPair.f_Pair_second = dtb__69 } -> (B_dData_dMaybe.C_Maybe_Just ({ B_dData_dPair.f_Pair_first = { B_dData_dPair.f_Pair_first = dtb__65; B_dData_dPair.f_Pair_second = dtb__68 }; B_dData_dPair.f_Pair_second = dtb__69 }))
  | _ -> failwith "DT: impossible branch"
)
  | B_dData_dMaybe.C_Maybe_Nothing -> B_dData_dMaybe.C_Maybe_Nothing
  | _ -> failwith "DT: impossible branch"
)) ((v_decRig (fuel - 1)) dtb__66))
  | _ -> failwith "DT: impossible branch"
)
  | B_dData_dMaybe.C_Maybe_Nothing -> B_dData_dMaybe.C_Maybe_Nothing
  | _ -> failwith "DT: impossible branch"
)) ((v_decTerm (fuel - 1)) bytes))))
# 149 "Vuna/Compiler/Core/Canonical.vuna"
and v_decAlt = (fun (fuel : int) (bytes : Base_dBytes.t_Cur) -> (if (fuel <= 0) then B_dData_dMaybe.C_Maybe_Nothing else ((fun nd_uscrut2 -> (match nd_uscrut2 with
  | B_dData_dMaybe.C_Maybe_Just (dtb__70) -> (match dtb__70 with
  | { B_dData_dPair.f_Pair_first = dtb__71; B_dData_dPair.f_Pair_second = dtb__72 } -> ((fun nd_uscrut9 -> (match nd_uscrut9 with
  | B_dData_dMaybe.C_Maybe_Just (dtb__73) -> (match dtb__73 with
  | { B_dData_dPair.f_Pair_first = dtb__74; B_dData_dPair.f_Pair_second = dtb__75 } -> ((fun nd_uscrut16 -> (match nd_uscrut16 with
  | B_dData_dMaybe.C_Maybe_Just (dtb__76) -> (match dtb__76 with
  | { B_dData_dPair.f_Pair_first = dtb__77; B_dData_dPair.f_Pair_second = dtb__78 } -> (B_dData_dMaybe.C_Maybe_Just ({ B_dData_dPair.f_Pair_first = { Core_dTerm.f_CaseAlt_caseAltName = dtb__71; Core_dTerm.f_CaseAlt_caseAltBinders = (Core_dTerm.v_bindersOfPairs dtb__74); Core_dTerm.f_CaseAlt_caseAltBody = dtb__77 }; B_dData_dPair.f_Pair_second = dtb__78 }))
  | _ -> failwith "DT: impossible branch"
)
  | B_dData_dMaybe.C_Maybe_Nothing -> B_dData_dMaybe.C_Maybe_Nothing
  | _ -> failwith "DT: impossible branch"
)) ((v_decTerm (fuel - 1)) dtb__75))
  | _ -> failwith "DT: impossible branch"
)
  | B_dData_dMaybe.C_Maybe_Nothing -> B_dData_dMaybe.C_Maybe_Nothing
  | _ -> failwith "DT: impossible branch"
)) (((Base_dBytes.v_decList v_decBinder) (fuel - 1)) dtb__72))
  | _ -> failwith "DT: impossible branch"
)
  | B_dData_dMaybe.C_Maybe_Nothing -> B_dData_dMaybe.C_Maybe_Nothing
  | _ -> failwith "DT: impossible branch"
)) ((Base_dBytes.v_decStr (fuel - 1)) bytes))))
# 165 "Vuna/Compiler/Core/Canonical.vuna"
and v_decTerm = (fun (fuel : int) (bytes : Base_dBytes.t_Cur) -> (if (fuel <= 0) then B_dData_dMaybe.C_Maybe_Nothing else ((fun nd_uscrut2 -> (match nd_uscrut2 with
  | B_dData_dMaybe.C_Maybe_Just (dtb__79) -> (match dtb__79 with
  | { B_dData_dPair.f_Pair_first = dtb__80; B_dData_dPair.f_Pair_second = dtb__81 } -> (if (dtb__80 = 0) then ((fun nd_uscrut9 -> (match nd_uscrut9 with
  | B_dData_dMaybe.C_Maybe_Just (dtb__82) -> (match dtb__82 with
  | { B_dData_dPair.f_Pair_first = dtb__83; B_dData_dPair.f_Pair_second = dtb__84 } -> ((fun nd_uscrut16 -> (match nd_uscrut16 with
  | B_dData_dMaybe.C_Maybe_Just (dtb__85) -> (match dtb__85 with
  | { B_dData_dPair.f_Pair_first = dtb__86; B_dData_dPair.f_Pair_second = dtb__87 } -> (B_dData_dMaybe.C_Maybe_Just ({ B_dData_dPair.f_Pair_first = (Core_dTerm.C_Term_TVar (dtb__83, dtb__86, v_noSpan)); B_dData_dPair.f_Pair_second = dtb__87 }))
  | _ -> failwith "DT: impossible branch"
)
  | B_dData_dMaybe.C_Maybe_Nothing -> B_dData_dMaybe.C_Maybe_Nothing
  | _ -> failwith "DT: impossible branch"
)) ((Base_dBytes.v_decInt (fuel - 1)) dtb__84))
  | _ -> failwith "DT: impossible branch"
)
  | B_dData_dMaybe.C_Maybe_Nothing -> B_dData_dMaybe.C_Maybe_Nothing
  | _ -> failwith "DT: impossible branch"
)) ((Base_dBytes.v_decStr (fuel - 1)) dtb__81)) else (if (dtb__80 = 1) then ((fun nd_uscrut9 -> (match nd_uscrut9 with
  | B_dData_dMaybe.C_Maybe_Just (dtb__88) -> (match dtb__88 with
  | { B_dData_dPair.f_Pair_first = dtb__89; B_dData_dPair.f_Pair_second = dtb__90 } -> (B_dData_dMaybe.C_Maybe_Just ({ B_dData_dPair.f_Pair_first = (Core_dTerm.C_Term_TMeta (dtb__89)); B_dData_dPair.f_Pair_second = dtb__90 }))
  | _ -> failwith "DT: impossible branch"
)
  | B_dData_dMaybe.C_Maybe_Nothing -> B_dData_dMaybe.C_Maybe_Nothing
  | _ -> failwith "DT: impossible branch"
)) ((Base_dBytes.v_decInt (fuel - 1)) dtb__81)) else (if (dtb__80 = 2) then ((fun nd_uscrut9 -> (match nd_uscrut9 with
  | B_dData_dMaybe.C_Maybe_Just (dtb__91) -> (match dtb__91 with
  | { B_dData_dPair.f_Pair_first = dtb__92; B_dData_dPair.f_Pair_second = dtb__93 } -> (B_dData_dMaybe.C_Maybe_Just ({ B_dData_dPair.f_Pair_first = (Core_dTerm.C_Term_TGlobal (dtb__92)); B_dData_dPair.f_Pair_second = dtb__93 }))
  | _ -> failwith "DT: impossible branch"
)
  | B_dData_dMaybe.C_Maybe_Nothing -> B_dData_dMaybe.C_Maybe_Nothing
  | _ -> failwith "DT: impossible branch"
)) ((Base_dBytes.v_decStr (fuel - 1)) dtb__81)) else (if (dtb__80 = 3) then ((fun nd_uscrut9 -> (match nd_uscrut9 with
  | B_dData_dMaybe.C_Maybe_Just (dtb__94) -> (match dtb__94 with
  | { B_dData_dPair.f_Pair_first = dtb__95; B_dData_dPair.f_Pair_second = dtb__96 } -> (B_dData_dMaybe.C_Maybe_Just ({ B_dData_dPair.f_Pair_first = (Core_dTerm.C_Term_TType ((Core_dTerm.v_levelOfInt dtb__95))); B_dData_dPair.f_Pair_second = dtb__96 }))
  | _ -> failwith "DT: impossible branch"
)
  | B_dData_dMaybe.C_Maybe_Nothing -> B_dData_dMaybe.C_Maybe_Nothing
  | _ -> failwith "DT: impossible branch"
)) ((Base_dBytes.v_decInt (fuel - 1)) dtb__81)) else (if (dtb__80 = 4) then ((fun nd_uscrut9 -> (match nd_uscrut9 with
  | B_dData_dMaybe.C_Maybe_Just (dtb__97) -> (match dtb__97 with
  | { B_dData_dPair.f_Pair_first = dtb__98; B_dData_dPair.f_Pair_second = dtb__99 } -> ((fun nd_uscrut16 -> (match nd_uscrut16 with
  | B_dData_dMaybe.C_Maybe_Just (dtb__100) -> (match dtb__100 with
  | { B_dData_dPair.f_Pair_first = dtb__101; B_dData_dPair.f_Pair_second = dtb__102 } -> ((fun nd_uscrut23 -> (match nd_uscrut23 with
  | B_dData_dMaybe.C_Maybe_Just (dtb__103) -> (match dtb__103 with
  | { B_dData_dPair.f_Pair_first = dtb__104; B_dData_dPair.f_Pair_second = dtb__105 } -> ((fun nd_uscrut30 -> (match nd_uscrut30 with
  | B_dData_dMaybe.C_Maybe_Just (dtb__106) -> (match dtb__106 with
  | { B_dData_dPair.f_Pair_first = dtb__107; B_dData_dPair.f_Pair_second = dtb__108 } -> ((fun nd_uscrut37 -> (match nd_uscrut37 with
  | B_dData_dMaybe.C_Maybe_Just (dtb__109) -> (match dtb__109 with
  | { B_dData_dPair.f_Pair_first = dtb__110; B_dData_dPair.f_Pair_second = dtb__111 } -> (B_dData_dMaybe.C_Maybe_Just ({ B_dData_dPair.f_Pair_first = (Core_dTerm.C_Term_TPi (dtb__98, dtb__101, dtb__104, dtb__107, dtb__110)); B_dData_dPair.f_Pair_second = dtb__111 }))
  | _ -> failwith "DT: impossible branch"
)
  | B_dData_dMaybe.C_Maybe_Nothing -> B_dData_dMaybe.C_Maybe_Nothing
  | _ -> failwith "DT: impossible branch"
)) ((v_decTerm (fuel - 1)) dtb__108))
  | _ -> failwith "DT: impossible branch"
)
  | B_dData_dMaybe.C_Maybe_Nothing -> B_dData_dMaybe.C_Maybe_Nothing
  | _ -> failwith "DT: impossible branch"
)) ((v_decTerm (fuel - 1)) dtb__105))
  | _ -> failwith "DT: impossible branch"
)
  | B_dData_dMaybe.C_Maybe_Nothing -> B_dData_dMaybe.C_Maybe_Nothing
  | _ -> failwith "DT: impossible branch"
)) ((v_decRig (fuel - 1)) dtb__102))
  | _ -> failwith "DT: impossible branch"
)
  | B_dData_dMaybe.C_Maybe_Nothing -> B_dData_dMaybe.C_Maybe_Nothing
  | _ -> failwith "DT: impossible branch"
)) ((Base_dBytes.v_decBool (fuel - 1)) dtb__99))
  | _ -> failwith "DT: impossible branch"
)
  | B_dData_dMaybe.C_Maybe_Nothing -> B_dData_dMaybe.C_Maybe_Nothing
  | _ -> failwith "DT: impossible branch"
)) ((Base_dBytes.v_decStr (fuel - 1)) dtb__81)) else (if (dtb__80 = 5) then ((fun nd_uscrut9 -> (match nd_uscrut9 with
  | B_dData_dMaybe.C_Maybe_Just (dtb__112) -> (match dtb__112 with
  | { B_dData_dPair.f_Pair_first = dtb__113; B_dData_dPair.f_Pair_second = dtb__114 } -> ((fun nd_uscrut16 -> (match nd_uscrut16 with
  | B_dData_dMaybe.C_Maybe_Just (dtb__115) -> (match dtb__115 with
  | { B_dData_dPair.f_Pair_first = dtb__116; B_dData_dPair.f_Pair_second = dtb__117 } -> ((fun nd_uscrut23 -> (match nd_uscrut23 with
  | B_dData_dMaybe.C_Maybe_Just (dtb__118) -> (match dtb__118 with
  | { B_dData_dPair.f_Pair_first = dtb__119; B_dData_dPair.f_Pair_second = dtb__120 } -> (B_dData_dMaybe.C_Maybe_Just ({ B_dData_dPair.f_Pair_first = (Core_dTerm.C_Term_TLam (dtb__113, dtb__116, B_dData_dMaybe.C_Maybe_Nothing, v_noSpan, dtb__119)); B_dData_dPair.f_Pair_second = dtb__120 }))
  | _ -> failwith "DT: impossible branch"
)
  | B_dData_dMaybe.C_Maybe_Nothing -> B_dData_dMaybe.C_Maybe_Nothing
  | _ -> failwith "DT: impossible branch"
)) ((v_decTerm (fuel - 1)) dtb__117))
  | _ -> failwith "DT: impossible branch"
)
  | B_dData_dMaybe.C_Maybe_Nothing -> B_dData_dMaybe.C_Maybe_Nothing
  | _ -> failwith "DT: impossible branch"
)) ((v_decRig (fuel - 1)) dtb__114))
  | _ -> failwith "DT: impossible branch"
)
  | B_dData_dMaybe.C_Maybe_Nothing -> B_dData_dMaybe.C_Maybe_Nothing
  | _ -> failwith "DT: impossible branch"
)) ((Base_dBytes.v_decStr (fuel - 1)) dtb__81)) else (if (dtb__80 = 6) then ((fun nd_uscrut9 -> (match nd_uscrut9 with
  | B_dData_dMaybe.C_Maybe_Just (dtb__121) -> (match dtb__121 with
  | { B_dData_dPair.f_Pair_first = dtb__122; B_dData_dPair.f_Pair_second = dtb__123 } -> ((fun nd_uscrut16 -> (match nd_uscrut16 with
  | B_dData_dMaybe.C_Maybe_Just (dtb__124) -> (match dtb__124 with
  | { B_dData_dPair.f_Pair_first = dtb__125; B_dData_dPair.f_Pair_second = dtb__126 } -> ((fun nd_uscrut23 -> (match nd_uscrut23 with
  | B_dData_dMaybe.C_Maybe_Just (dtb__127) -> (match dtb__127 with
  | { B_dData_dPair.f_Pair_first = dtb__128; B_dData_dPair.f_Pair_second = dtb__129 } -> (B_dData_dMaybe.C_Maybe_Just ({ B_dData_dPair.f_Pair_first = (Core_dTerm.C_Term_TApp (dtb__122, dtb__125, dtb__128)); B_dData_dPair.f_Pair_second = dtb__129 }))
  | _ -> failwith "DT: impossible branch"
)
  | B_dData_dMaybe.C_Maybe_Nothing -> B_dData_dMaybe.C_Maybe_Nothing
  | _ -> failwith "DT: impossible branch"
)) ((v_decRig (fuel - 1)) dtb__126))
  | _ -> failwith "DT: impossible branch"
)
  | B_dData_dMaybe.C_Maybe_Nothing -> B_dData_dMaybe.C_Maybe_Nothing
  | _ -> failwith "DT: impossible branch"
)) ((v_decTerm (fuel - 1)) dtb__123))
  | _ -> failwith "DT: impossible branch"
)
  | B_dData_dMaybe.C_Maybe_Nothing -> B_dData_dMaybe.C_Maybe_Nothing
  | _ -> failwith "DT: impossible branch"
)) ((v_decTerm (fuel - 1)) dtb__81)) else (if (dtb__80 = 7) then ((fun nd_uscrut9 -> (match nd_uscrut9 with
  | B_dData_dMaybe.C_Maybe_Just (dtb__130) -> (match dtb__130 with
  | { B_dData_dPair.f_Pair_first = dtb__131; B_dData_dPair.f_Pair_second = dtb__132 } -> ((fun nd_uscrut16 -> (match nd_uscrut16 with
  | B_dData_dMaybe.C_Maybe_Just (dtb__133) -> (match dtb__133 with
  | { B_dData_dPair.f_Pair_first = dtb__134; B_dData_dPair.f_Pair_second = dtb__135 } -> (B_dData_dMaybe.C_Maybe_Just ({ B_dData_dPair.f_Pair_first = (Core_dTerm.C_Term_TCon (dtb__131, dtb__134)); B_dData_dPair.f_Pair_second = dtb__135 }))
  | _ -> failwith "DT: impossible branch"
)
  | B_dData_dMaybe.C_Maybe_Nothing -> B_dData_dMaybe.C_Maybe_Nothing
  | _ -> failwith "DT: impossible branch"
)) (((Base_dBytes.v_decList v_decArg) (fuel - 1)) dtb__132))
  | _ -> failwith "DT: impossible branch"
)
  | B_dData_dMaybe.C_Maybe_Nothing -> B_dData_dMaybe.C_Maybe_Nothing
  | _ -> failwith "DT: impossible branch"
)) ((Base_dBytes.v_decStr (fuel - 1)) dtb__81)) else (if (dtb__80 = 8) then ((fun nd_uscrut9 -> (match nd_uscrut9 with
  | B_dData_dMaybe.C_Maybe_Just (dtb__136) -> (match dtb__136 with
  | { B_dData_dPair.f_Pair_first = dtb__137; B_dData_dPair.f_Pair_second = dtb__138 } -> ((fun nd_uscrut16 -> (match nd_uscrut16 with
  | B_dData_dMaybe.C_Maybe_Just (dtb__139) -> (match dtb__139 with
  | { B_dData_dPair.f_Pair_first = dtb__140; B_dData_dPair.f_Pair_second = dtb__141 } -> (B_dData_dMaybe.C_Maybe_Just ({ B_dData_dPair.f_Pair_first = (Core_dTerm.C_Term_TMk (dtb__137, dtb__140)); B_dData_dPair.f_Pair_second = dtb__141 }))
  | _ -> failwith "DT: impossible branch"
)
  | B_dData_dMaybe.C_Maybe_Nothing -> B_dData_dMaybe.C_Maybe_Nothing
  | _ -> failwith "DT: impossible branch"
)) (((Base_dBytes.v_decList v_decArg) (fuel - 1)) dtb__138))
  | _ -> failwith "DT: impossible branch"
)
  | B_dData_dMaybe.C_Maybe_Nothing -> B_dData_dMaybe.C_Maybe_Nothing
  | _ -> failwith "DT: impossible branch"
)) ((Base_dBytes.v_decStr (fuel - 1)) dtb__81)) else (if (dtb__80 = 9) then ((fun nd_uscrut9 -> (match nd_uscrut9 with
  | B_dData_dMaybe.C_Maybe_Just (dtb__142) -> (match dtb__142 with
  | { B_dData_dPair.f_Pair_first = dtb__143; B_dData_dPair.f_Pair_second = dtb__144 } -> ((fun nd_uscrut16 -> (match nd_uscrut16 with
  | B_dData_dMaybe.C_Maybe_Just (dtb__145) -> (match dtb__145 with
  | { B_dData_dPair.f_Pair_first = dtb__146; B_dData_dPair.f_Pair_second = dtb__147 } -> (B_dData_dMaybe.C_Maybe_Just ({ B_dData_dPair.f_Pair_first = (Core_dTerm.C_Term_TCase (dtb__143, dtb__146)); B_dData_dPair.f_Pair_second = dtb__147 }))
  | _ -> failwith "DT: impossible branch"
)
  | B_dData_dMaybe.C_Maybe_Nothing -> B_dData_dMaybe.C_Maybe_Nothing
  | _ -> failwith "DT: impossible branch"
)) (((Base_dBytes.v_decList v_decAlt) (fuel - 1)) dtb__144))
  | _ -> failwith "DT: impossible branch"
)
  | B_dData_dMaybe.C_Maybe_Nothing -> B_dData_dMaybe.C_Maybe_Nothing
  | _ -> failwith "DT: impossible branch"
)) ((v_decTerm (fuel - 1)) dtb__81)) else (if (dtb__80 = 10) then ((fun nd_uscrut9 -> (match nd_uscrut9 with
  | B_dData_dMaybe.C_Maybe_Just (dtb__148) -> (match dtb__148 with
  | { B_dData_dPair.f_Pair_first = dtb__149; B_dData_dPair.f_Pair_second = dtb__150 } -> ((fun nd_uscrut16 -> (match nd_uscrut16 with
  | B_dData_dMaybe.C_Maybe_Just (dtb__151) -> (match dtb__151 with
  | { B_dData_dPair.f_Pair_first = dtb__152; B_dData_dPair.f_Pair_second = dtb__153 } -> ((fun nd_uscrut23 -> (match nd_uscrut23 with
  | B_dData_dMaybe.C_Maybe_Just (dtb__154) -> (match dtb__154 with
  | { B_dData_dPair.f_Pair_first = dtb__155; B_dData_dPair.f_Pair_second = dtb__156 } -> ((fun nd_uscrut30 -> (match nd_uscrut30 with
  | B_dData_dMaybe.C_Maybe_Just (dtb__157) -> (match dtb__157 with
  | { B_dData_dPair.f_Pair_first = dtb__158; B_dData_dPair.f_Pair_second = dtb__159 } -> ((fun nd_uscrut37 -> (match nd_uscrut37 with
  | B_dData_dMaybe.C_Maybe_Just (dtb__160) -> (match dtb__160 with
  | { B_dData_dPair.f_Pair_first = dtb__161; B_dData_dPair.f_Pair_second = dtb__162 } -> (B_dData_dMaybe.C_Maybe_Just ({ B_dData_dPair.f_Pair_first = (Core_dTerm.C_Term_TProj (dtb__149, dtb__152, dtb__155, dtb__158, dtb__161)); B_dData_dPair.f_Pair_second = dtb__162 }))
  | _ -> failwith "DT: impossible branch"
)
  | B_dData_dMaybe.C_Maybe_Nothing -> B_dData_dMaybe.C_Maybe_Nothing
  | _ -> failwith "DT: impossible branch"
)) ((Base_dBytes.v_decInt (fuel - 1)) dtb__159))
  | _ -> failwith "DT: impossible branch"
)
  | B_dData_dMaybe.C_Maybe_Nothing -> B_dData_dMaybe.C_Maybe_Nothing
  | _ -> failwith "DT: impossible branch"
)) ((Base_dBytes.v_decInt (fuel - 1)) dtb__156))
  | _ -> failwith "DT: impossible branch"
)
  | B_dData_dMaybe.C_Maybe_Nothing -> B_dData_dMaybe.C_Maybe_Nothing
  | _ -> failwith "DT: impossible branch"
)) (((Base_dBytes.v_decList v_decBinder) (fuel - 1)) dtb__153))
  | _ -> failwith "DT: impossible branch"
)
  | B_dData_dMaybe.C_Maybe_Nothing -> B_dData_dMaybe.C_Maybe_Nothing
  | _ -> failwith "DT: impossible branch"
)) ((Base_dBytes.v_decStr (fuel - 1)) dtb__150))
  | _ -> failwith "DT: impossible branch"
)
  | B_dData_dMaybe.C_Maybe_Nothing -> B_dData_dMaybe.C_Maybe_Nothing
  | _ -> failwith "DT: impossible branch"
)) ((v_decTerm (fuel - 1)) dtb__81)) else (if (dtb__80 = 11) then ((fun nd_uscrut9 -> (match nd_uscrut9 with
  | B_dData_dMaybe.C_Maybe_Just (dtb__163) -> (match dtb__163 with
  | { B_dData_dPair.f_Pair_first = dtb__164; B_dData_dPair.f_Pair_second = dtb__165 } -> ((fun nd_uscrut16 -> (match nd_uscrut16 with
  | B_dData_dMaybe.C_Maybe_Just (dtb__166) -> (match dtb__166 with
  | { B_dData_dPair.f_Pair_first = dtb__167; B_dData_dPair.f_Pair_second = dtb__168 } -> ((fun nd_uscrut23 -> (match nd_uscrut23 with
  | B_dData_dMaybe.C_Maybe_Just (dtb__169) -> (match dtb__169 with
  | { B_dData_dPair.f_Pair_first = dtb__170; B_dData_dPair.f_Pair_second = dtb__171 } -> ((fun nd_uscrut30 -> (match nd_uscrut30 with
  | B_dData_dMaybe.C_Maybe_Just (dtb__172) -> (match dtb__172 with
  | { B_dData_dPair.f_Pair_first = dtb__173; B_dData_dPair.f_Pair_second = dtb__174 } -> ((fun nd_uscrut37 -> (match nd_uscrut37 with
  | B_dData_dMaybe.C_Maybe_Just (dtb__175) -> (match dtb__175 with
  | { B_dData_dPair.f_Pair_first = dtb__176; B_dData_dPair.f_Pair_second = dtb__177 } -> (B_dData_dMaybe.C_Maybe_Just ({ B_dData_dPair.f_Pair_first = (Core_dTerm.C_Term_TRecUpd (dtb__164, dtb__167, dtb__170, dtb__173, dtb__176)); B_dData_dPair.f_Pair_second = dtb__177 }))
  | _ -> failwith "DT: impossible branch"
)
  | B_dData_dMaybe.C_Maybe_Nothing -> B_dData_dMaybe.C_Maybe_Nothing
  | _ -> failwith "DT: impossible branch"
)) ((v_decTerm (fuel - 1)) dtb__174))
  | _ -> failwith "DT: impossible branch"
)
  | B_dData_dMaybe.C_Maybe_Nothing -> B_dData_dMaybe.C_Maybe_Nothing
  | _ -> failwith "DT: impossible branch"
)) (((Base_dBytes.v_decList Base_dBytes.v_decInt) (fuel - 1)) dtb__171))
  | _ -> failwith "DT: impossible branch"
)
  | B_dData_dMaybe.C_Maybe_Nothing -> B_dData_dMaybe.C_Maybe_Nothing
  | _ -> failwith "DT: impossible branch"
)) (((Base_dBytes.v_decList v_decBinder) (fuel - 1)) dtb__168))
  | _ -> failwith "DT: impossible branch"
)
  | B_dData_dMaybe.C_Maybe_Nothing -> B_dData_dMaybe.C_Maybe_Nothing
  | _ -> failwith "DT: impossible branch"
)) ((Base_dBytes.v_decStr (fuel - 1)) dtb__165))
  | _ -> failwith "DT: impossible branch"
)
  | B_dData_dMaybe.C_Maybe_Nothing -> B_dData_dMaybe.C_Maybe_Nothing
  | _ -> failwith "DT: impossible branch"
)) ((v_decTerm (fuel - 1)) dtb__81)) else (if (dtb__80 = 12) then ((fun nd_uscrut9 -> (match nd_uscrut9 with
  | B_dData_dMaybe.C_Maybe_Just (dtb__178) -> (match dtb__178 with
  | { B_dData_dPair.f_Pair_first = dtb__179; B_dData_dPair.f_Pair_second = dtb__180 } -> (B_dData_dMaybe.C_Maybe_Just ({ B_dData_dPair.f_Pair_first = (Core_dTerm.C_Term_TInt (dtb__179)); B_dData_dPair.f_Pair_second = dtb__180 }))
  | _ -> failwith "DT: impossible branch"
)
  | B_dData_dMaybe.C_Maybe_Nothing -> B_dData_dMaybe.C_Maybe_Nothing
  | _ -> failwith "DT: impossible branch"
)) ((Base_dBytes.v_decInt (fuel - 1)) dtb__81)) else (if (dtb__80 = 13) then ((fun nd_uscrut9 -> (match nd_uscrut9 with
  | B_dData_dMaybe.C_Maybe_Just (dtb__181) -> (match dtb__181 with
  | { B_dData_dPair.f_Pair_first = dtb__182; B_dData_dPair.f_Pair_second = dtb__183 } -> (B_dData_dMaybe.C_Maybe_Just ({ B_dData_dPair.f_Pair_first = (Core_dTerm.C_Term_TStr (dtb__182)); B_dData_dPair.f_Pair_second = dtb__183 }))
  | _ -> failwith "DT: impossible branch"
)
  | B_dData_dMaybe.C_Maybe_Nothing -> B_dData_dMaybe.C_Maybe_Nothing
  | _ -> failwith "DT: impossible branch"
)) ((Base_dBytes.v_decStr (fuel - 1)) dtb__81)) else (if (dtb__80 = 14) then ((fun nd_uscrut9 -> (match nd_uscrut9 with
  | B_dData_dMaybe.C_Maybe_Just (dtb__184) -> (match dtb__184 with
  | { B_dData_dPair.f_Pair_first = dtb__185; B_dData_dPair.f_Pair_second = dtb__186 } -> (B_dData_dMaybe.C_Maybe_Just ({ B_dData_dPair.f_Pair_first = (Core_dTerm.C_Term_TBool (dtb__185)); B_dData_dPair.f_Pair_second = dtb__186 }))
  | _ -> failwith "DT: impossible branch"
)
  | B_dData_dMaybe.C_Maybe_Nothing -> B_dData_dMaybe.C_Maybe_Nothing
  | _ -> failwith "DT: impossible branch"
)) ((Base_dBytes.v_decBool (fuel - 1)) dtb__81)) else (if (dtb__80 = 15) then ((fun nd_uscrut9 -> (match nd_uscrut9 with
  | B_dData_dMaybe.C_Maybe_Just (dtb__187) -> (match dtb__187 with
  | { B_dData_dPair.f_Pair_first = dtb__188; B_dData_dPair.f_Pair_second = dtb__189 } -> ((fun nd_uscrut16 -> (match nd_uscrut16 with
  | B_dData_dMaybe.C_Maybe_Just (dtb__190) -> (match dtb__190 with
  | { B_dData_dPair.f_Pair_first = dtb__191; B_dData_dPair.f_Pair_second = dtb__192 } -> ((fun nd_uscrut23 -> (match nd_uscrut23 with
  | B_dData_dMaybe.C_Maybe_Just (dtb__193) -> (match dtb__193 with
  | { B_dData_dPair.f_Pair_first = dtb__194; B_dData_dPair.f_Pair_second = dtb__195 } -> (B_dData_dMaybe.C_Maybe_Just ({ B_dData_dPair.f_Pair_first = (Core_dTerm.C_Term_TIf (dtb__188, dtb__191, dtb__194)); B_dData_dPair.f_Pair_second = dtb__195 }))
  | _ -> failwith "DT: impossible branch"
)
  | B_dData_dMaybe.C_Maybe_Nothing -> B_dData_dMaybe.C_Maybe_Nothing
  | _ -> failwith "DT: impossible branch"
)) ((v_decTerm (fuel - 1)) dtb__192))
  | _ -> failwith "DT: impossible branch"
)
  | B_dData_dMaybe.C_Maybe_Nothing -> B_dData_dMaybe.C_Maybe_Nothing
  | _ -> failwith "DT: impossible branch"
)) ((v_decTerm (fuel - 1)) dtb__189))
  | _ -> failwith "DT: impossible branch"
)
  | B_dData_dMaybe.C_Maybe_Nothing -> B_dData_dMaybe.C_Maybe_Nothing
  | _ -> failwith "DT: impossible branch"
)) ((v_decTerm (fuel - 1)) dtb__81)) else (if (dtb__80 = 16) then ((fun nd_uscrut9 -> (match nd_uscrut9 with
  | B_dData_dMaybe.C_Maybe_Just (dtb__196) -> (match dtb__196 with
  | { B_dData_dPair.f_Pair_first = dtb__197; B_dData_dPair.f_Pair_second = dtb__198 } -> (B_dData_dMaybe.C_Maybe_Just ({ B_dData_dPair.f_Pair_first = (Core_dTerm.C_Term_TFloat (dtb__197)); B_dData_dPair.f_Pair_second = dtb__198 }))
  | _ -> failwith "DT: impossible branch"
)
  | B_dData_dMaybe.C_Maybe_Nothing -> B_dData_dMaybe.C_Maybe_Nothing
  | _ -> failwith "DT: impossible branch"
)) ((Base_dBytes.v_decStr (fuel - 1)) dtb__81)) else (if (dtb__80 = 17) then ((fun nd_uscrut9 -> (match nd_uscrut9 with
  | B_dData_dMaybe.C_Maybe_Just (dtb__199) -> (match dtb__199 with
  | { B_dData_dPair.f_Pair_first = dtb__200; B_dData_dPair.f_Pair_second = dtb__201 } -> ((fun nd_uscrut16 -> (match nd_uscrut16 with
  | B_dData_dMaybe.C_Maybe_Just (dtb__202) -> (match dtb__202 with
  | { B_dData_dPair.f_Pair_first = dtb__203; B_dData_dPair.f_Pair_second = dtb__204 } -> (B_dData_dMaybe.C_Maybe_Just ({ B_dData_dPair.f_Pair_first = (Core_dTerm.C_Term_TRecord (dtb__200, dtb__203)); B_dData_dPair.f_Pair_second = dtb__204 }))
  | _ -> failwith "DT: impossible branch"
)
  | B_dData_dMaybe.C_Maybe_Nothing -> B_dData_dMaybe.C_Maybe_Nothing
  | _ -> failwith "DT: impossible branch"
)) (((Base_dBytes.v_decList v_decArg) (fuel - 1)) dtb__201))
  | _ -> failwith "DT: impossible branch"
)
  | B_dData_dMaybe.C_Maybe_Nothing -> B_dData_dMaybe.C_Maybe_Nothing
  | _ -> failwith "DT: impossible branch"
)) ((Base_dBytes.v_decStr (fuel - 1)) dtb__81)) else B_dData_dMaybe.C_Maybe_Nothing))))))))))))))))))
  | _ -> failwith "DT: impossible branch"
)
  | B_dData_dMaybe.C_Maybe_Nothing -> B_dData_dMaybe.C_Maybe_Nothing
  | _ -> failwith "DT: impossible branch"
)) ((Base_dBytes.v_decTag fuel) bytes))))

# 318 "Vuna/Compiler/Core/Canonical.vuna"
let v_decTermComplete = (fun (s : string) -> ((fun nd_uscrut1 -> (match nd_uscrut1 with
  | B_dData_dMaybe.C_Maybe_Just (dtb__205) -> (match dtb__205 with
  | { B_dData_dPair.f_Pair_first = dtb__206; B_dData_dPair.f_Pair_second = dtb__207 } -> (if (Base_dBytes.v_curAtEnd dtb__207) then (B_dData_dMaybe.C_Maybe_Just (dtb__206)) else B_dData_dMaybe.C_Maybe_Nothing)
  | _ -> failwith "DT: impossible branch"
)
  | B_dData_dMaybe.C_Maybe_Nothing -> B_dData_dMaybe.C_Maybe_Nothing
  | _ -> failwith "DT: impossible branch"
)) ((v_decTerm (bi_strLength s)) (Base_dBytes.v_curOf s))))
