open Vuna_runtime
# 26 "Vuna/Compiler/Core/Canonical.vuna"
let v_noSpan = { Base_dSource.f_Span_spanFile = ""; Base_dSource.f_Span_spanStartLine = 0; Base_dSource.f_Span_spanStartCol = 0; Base_dSource.f_Span_spanEndLine = 0; Base_dSource.f_Span_spanEndCol = 0; Base_dSource.f_Span_spanStartOffset = 0; Base_dSource.f_Span_spanEndOffset = 0 }

# 33 "Vuna/Compiler/Core/Canonical.vuna"
let v_encRig = (fun (dtb_u_u1 : Core_dTerm.t_Rig) (dtb_u_u2 : string B_dData_dList.t_List) -> (match dtb_u_u1 with
  | Core_dTerm.C_Rig_RigOmega -> ((Base_dBytes.v_encTag 2) dtb_u_u2)
  | Core_dTerm.C_Rig_Rig1 -> ((Base_dBytes.v_encTag 1) dtb_u_u2)
  | Core_dTerm.C_Rig_Rig0 -> ((Base_dBytes.v_encTag 0) dtb_u_u2)
  | _ -> failwith "DT: impossible branch"
))

# 52 "Vuna/Compiler/Core/Canonical.vuna"
let v_encBinder = (fun (dtb_u_u3 : (string, Core_dTerm.t_Rig) B_dData_dPair.t_Pair) (dtb_u_u4 : string B_dData_dList.t_List) -> (match dtb_u_u3 with
  | { B_dData_dPair.f_Pair_first = dtb_u_u5; B_dData_dPair.f_Pair_second = dtb_u_u6 } -> ((Base_dBytes.v_encStr dtb_u_u5) ((v_encRig dtb_u_u6) dtb_u_u4))
  | _ -> failwith "DT: impossible branch"
))

# 56 "Vuna/Compiler/Core/Canonical.vuna"
let v_encBinders = (fun (dtb_u_u7 : (string, Core_dTerm.t_Rig) B_dData_dPair.t_Pair B_dData_dList.t_List) (dtb_u_u8 : string B_dData_dList.t_List) -> (((Base_dBytes.v_encList v_encBinder) dtb_u_u7) dtb_u_u8))

# 73 "Vuna/Compiler/Core/Canonical.vuna"
let v_encInts = (fun (dtb_u_u9 : int B_dData_dList.t_List) (dtb_u_u10 : string B_dData_dList.t_List) -> (((Base_dBytes.v_encList Base_dBytes.v_encInt) dtb_u_u9) dtb_u_u10))

# 39 "Vuna/Compiler/Core/Canonical.vuna"
let rec v_encArg = (fun (dtb_u_u11 : (Core_dTerm.t_Term, Core_dTerm.t_Rig) B_dData_dPair.t_Pair) (dtb_u_u12 : string B_dData_dList.t_List) -> (match dtb_u_u11 with
  | { B_dData_dPair.f_Pair_first = dtb_u_u13; B_dData_dPair.f_Pair_second = dtb_u_u14 } -> ((v_encTerm dtb_u_u13) ((v_encRig dtb_u_u14) dtb_u_u12))
  | _ -> failwith "DT: impossible branch"
))
# 43 "Vuna/Compiler/Core/Canonical.vuna"
and v_encArgs = (fun (dtb_u_u15 : (Core_dTerm.t_Term, Core_dTerm.t_Rig) B_dData_dPair.t_Pair B_dData_dList.t_List) (dtb_u_u16 : string B_dData_dList.t_List) -> (B_dData_dList.C_List__x58__x58_ ("[", (B_dData_dList.C_List__x58__x58_ ((string_of_int (Base_dBytes.v_lenOf dtb_u_u15)), (B_dData_dList.C_List__x58__x58_ (":", ((v_encArgsGo dtb_u_u15) dtb_u_u16))))))))
# 47 "Vuna/Compiler/Core/Canonical.vuna"
and v_encArgsGo = (fun (dtb_u_u17 : (Core_dTerm.t_Term, Core_dTerm.t_Rig) B_dData_dPair.t_Pair B_dData_dList.t_List) (dtb_u_u18 : string B_dData_dList.t_List) -> (match dtb_u_u17 with
  | B_dData_dList.C_List__x58__x58_ (dtb_u_u19, dtb_u_u20) -> ((v_encArg dtb_u_u19) ((v_encArgsGo dtb_u_u20) dtb_u_u18))
  | B_dData_dList.C_List_Nil -> dtb_u_u18
  | _ -> failwith "DT: impossible branch"
))
# 60 "Vuna/Compiler/Core/Canonical.vuna"
and v_encAlt = (fun (dtb_u_u21 : Core_dTerm.t_CaseAlt) (dtb_u_u22 : string B_dData_dList.t_List) -> (match dtb_u_u21 with
  | { Core_dTerm.f_CaseAlt_caseAltName = dtb_u_u23; Core_dTerm.f_CaseAlt_caseAltBinders = dtb_u_u24; Core_dTerm.f_CaseAlt_caseAltBody = dtb_u_u25 } -> ((Base_dBytes.v_encStr dtb_u_u23) ((v_encBinders (Core_dTerm.v_binderPairs dtb_u_u24)) ((v_encTerm dtb_u_u25) dtb_u_u22)))
  | _ -> failwith "DT: impossible branch"
))
# 64 "Vuna/Compiler/Core/Canonical.vuna"
and v_encAlts = (fun (dtb_u_u26 : Core_dTerm.t_CaseAlt B_dData_dList.t_List) (dtb_u_u27 : string B_dData_dList.t_List) -> (B_dData_dList.C_List__x58__x58_ ("[", (B_dData_dList.C_List__x58__x58_ ((string_of_int (Base_dBytes.v_lenOf dtb_u_u26)), (B_dData_dList.C_List__x58__x58_ (":", ((v_encAltsGo dtb_u_u26) dtb_u_u27))))))))
# 68 "Vuna/Compiler/Core/Canonical.vuna"
and v_encAltsGo = (fun (dtb_u_u28 : Core_dTerm.t_CaseAlt B_dData_dList.t_List) (dtb_u_u29 : string B_dData_dList.t_List) -> (match dtb_u_u28 with
  | B_dData_dList.C_List__x58__x58_ (dtb_u_u30, dtb_u_u31) -> ((v_encAlt dtb_u_u30) ((v_encAltsGo dtb_u_u31) dtb_u_u29))
  | B_dData_dList.C_List_Nil -> dtb_u_u29
  | _ -> failwith "DT: impossible branch"
))
# 77 "Vuna/Compiler/Core/Canonical.vuna"
and v_encTerm = (fun (dtb_u_u32 : Core_dTerm.t_Term) (dtb_u_u33 : string B_dData_dList.t_List) -> (match dtb_u_u32 with
  | Core_dTerm.C_Term_TRecord (dtb_u_u34, dtb_u_u35) -> ((Base_dBytes.v_encTag 17) ((Base_dBytes.v_encStr dtb_u_u34) ((v_encArgs dtb_u_u35) dtb_u_u33)))
  | Core_dTerm.C_Term_TFloat (dtb_u_u36) -> ((Base_dBytes.v_encTag 16) ((Base_dBytes.v_encStr dtb_u_u36) dtb_u_u33))
  | Core_dTerm.C_Term_TIf (dtb_u_u37, dtb_u_u38, dtb_u_u39) -> ((Base_dBytes.v_encTag 15) ((v_encTerm dtb_u_u37) ((v_encTerm dtb_u_u38) ((v_encTerm dtb_u_u39) dtb_u_u33))))
  | Core_dTerm.C_Term_TBool (dtb_u_u40) -> ((Base_dBytes.v_encTag 14) ((Base_dBytes.v_encBool dtb_u_u40) dtb_u_u33))
  | Core_dTerm.C_Term_TStr (dtb_u_u41) -> ((Base_dBytes.v_encTag 13) ((Base_dBytes.v_encStr dtb_u_u41) dtb_u_u33))
  | Core_dTerm.C_Term_TInt (dtb_u_u42) -> ((Base_dBytes.v_encTag 12) ((Base_dBytes.v_encInt dtb_u_u42) dtb_u_u33))
  | Core_dTerm.C_Term_TRecUpd (dtb_u_u43, dtb_u_u44, dtb_u_u45, dtb_u_u46, dtb_u_u47) -> ((Base_dBytes.v_encTag 11) ((v_encTerm dtb_u_u43) ((Base_dBytes.v_encStr dtb_u_u44) ((v_encBinders dtb_u_u45) ((v_encInts dtb_u_u46) ((v_encTerm dtb_u_u47) dtb_u_u33))))))
  | Core_dTerm.C_Term_TProj (dtb_u_u48, dtb_u_u49, dtb_u_u50, dtb_u_u51, dtb_u_u52) -> ((Base_dBytes.v_encTag 10) ((v_encTerm dtb_u_u48) ((Base_dBytes.v_encStr dtb_u_u49) ((v_encBinders dtb_u_u50) ((Base_dBytes.v_encInt dtb_u_u51) ((Base_dBytes.v_encInt dtb_u_u52) dtb_u_u33))))))
  | Core_dTerm.C_Term_TCase (dtb_u_u53, dtb_u_u54) -> ((Base_dBytes.v_encTag 9) ((v_encTerm dtb_u_u53) ((v_encAlts dtb_u_u54) dtb_u_u33)))
  | Core_dTerm.C_Term_TMk (dtb_u_u55, dtb_u_u56) -> ((Base_dBytes.v_encTag 8) ((Base_dBytes.v_encStr dtb_u_u55) ((v_encArgs dtb_u_u56) dtb_u_u33)))
  | Core_dTerm.C_Term_TCon (dtb_u_u57, dtb_u_u58) -> ((Base_dBytes.v_encTag 7) ((Base_dBytes.v_encStr dtb_u_u57) ((v_encArgs dtb_u_u58) dtb_u_u33)))
  | Core_dTerm.C_Term_TApp (dtb_u_u59, dtb_u_u60, dtb_u_u61) -> ((Base_dBytes.v_encTag 6) ((v_encTerm dtb_u_u59) ((v_encTerm dtb_u_u60) ((v_encRig dtb_u_u61) dtb_u_u33))))
  | Core_dTerm.C_Term_TLam (dtb_u_u62, dtb_u_u63, dtb_u_u64, dtb_u_u65, dtb_u_u66) -> ((Base_dBytes.v_encTag 5) ((Base_dBytes.v_encStr dtb_u_u62) ((v_encRig dtb_u_u63) ((v_encTerm dtb_u_u66) dtb_u_u33))))
  | Core_dTerm.C_Term_TPi (dtb_u_u67, dtb_u_u68, dtb_u_u69, dtb_u_u70, dtb_u_u71) -> ((Base_dBytes.v_encTag 4) ((Base_dBytes.v_encStr dtb_u_u67) ((Base_dBytes.v_encBool dtb_u_u68) ((v_encRig dtb_u_u69) ((v_encTerm dtb_u_u70) ((v_encTerm dtb_u_u71) dtb_u_u33))))))
  | Core_dTerm.C_Term_TType (dtb_u_u72) -> ((Base_dBytes.v_encTag 3) ((Base_dBytes.v_encInt (Core_dTerm.v_levelToInt dtb_u_u72)) dtb_u_u33))
  | Core_dTerm.C_Term_TGlobal (dtb_u_u73) -> ((Base_dBytes.v_encTag 2) ((Base_dBytes.v_encStr dtb_u_u73) dtb_u_u33))
  | Core_dTerm.C_Term_TMeta (dtb_u_u74) -> ((Base_dBytes.v_encTag 1) ((Base_dBytes.v_encInt dtb_u_u74) dtb_u_u33))
  | Core_dTerm.C_Term_TVar (dtb_u_u75, dtb_u_u76, dtb_u_u77) -> ((Base_dBytes.v_encTag 0) ((Base_dBytes.v_encStr dtb_u_u75) ((Base_dBytes.v_encInt dtb_u_u76) dtb_u_u33)))
  | _ -> failwith "DT: impossible branch"
))

# 100 "Vuna/Compiler/Core/Canonical.vuna"
let v_encTermBytes = (fun (dtb_u_u78 : Core_dTerm.t_Term) -> ((Base_dBytes.v_encTop v_encTerm) dtb_u_u78))

# 108 "Vuna/Compiler/Core/Canonical.vuna"
let v_decRig = (fun (dtb_u_u79 : int) (dtb_u_u80 : Base_dBytes.t_Cur) -> (if (dtb_u_u79 <= 0) then B_dData_dMaybe.C_Maybe_Nothing else (let dtb_u_u81 = ((Base_dBytes.v_decTag dtb_u_u79) dtb_u_u80) in (match dtb_u_u81 with
  | B_dData_dMaybe.C_Maybe_Just (dtb_u_u82) -> (match dtb_u_u82 with
  | { B_dData_dPair.f_Pair_first = dtb_u_u83; B_dData_dPair.f_Pair_second = dtb_u_u84 } -> (if (dtb_u_u83 = 0) then (B_dData_dMaybe.C_Maybe_Just ({ B_dData_dPair.f_Pair_first = Core_dTerm.C_Rig_Rig0; B_dData_dPair.f_Pair_second = dtb_u_u84 })) else (if (dtb_u_u83 = 1) then (B_dData_dMaybe.C_Maybe_Just ({ B_dData_dPair.f_Pair_first = Core_dTerm.C_Rig_Rig1; B_dData_dPair.f_Pair_second = dtb_u_u84 })) else (if (dtb_u_u83 = 2) then (B_dData_dMaybe.C_Maybe_Just ({ B_dData_dPair.f_Pair_first = Core_dTerm.C_Rig_RigOmega; B_dData_dPair.f_Pair_second = dtb_u_u84 })) else B_dData_dMaybe.C_Maybe_Nothing)))
  | _ -> failwith "DT: impossible branch"
)
  | B_dData_dMaybe.C_Maybe_Nothing -> B_dData_dMaybe.C_Maybe_Nothing
  | _ -> failwith "DT: impossible branch"
))))

# 136 "Vuna/Compiler/Core/Canonical.vuna"
let v_decBinder = (fun (dtb_u_u85 : int) (dtb_u_u86 : Base_dBytes.t_Cur) -> (if (dtb_u_u85 <= 0) then B_dData_dMaybe.C_Maybe_Nothing else (let dtb_u_u87 = ((Base_dBytes.v_decStr (dtb_u_u85 - 1)) dtb_u_u86) in (match dtb_u_u87 with
  | B_dData_dMaybe.C_Maybe_Just (dtb_u_u88) -> (match dtb_u_u88 with
  | { B_dData_dPair.f_Pair_first = dtb_u_u89; B_dData_dPair.f_Pair_second = dtb_u_u90 } -> (let dtb_u_u91 = ((v_decRig (dtb_u_u85 - 1)) dtb_u_u90) in (match dtb_u_u91 with
  | B_dData_dMaybe.C_Maybe_Just (dtb_u_u92) -> (match dtb_u_u92 with
  | { B_dData_dPair.f_Pair_first = dtb_u_u93; B_dData_dPair.f_Pair_second = dtb_u_u94 } -> (B_dData_dMaybe.C_Maybe_Just ({ B_dData_dPair.f_Pair_first = { B_dData_dPair.f_Pair_first = dtb_u_u89; B_dData_dPair.f_Pair_second = dtb_u_u93 }; B_dData_dPair.f_Pair_second = dtb_u_u94 }))
  | _ -> failwith "DT: impossible branch"
)
  | B_dData_dMaybe.C_Maybe_Nothing -> B_dData_dMaybe.C_Maybe_Nothing
  | _ -> failwith "DT: impossible branch"
))
  | _ -> failwith "DT: impossible branch"
)
  | B_dData_dMaybe.C_Maybe_Nothing -> B_dData_dMaybe.C_Maybe_Nothing
  | _ -> failwith "DT: impossible branch"
))))

# 123 "Vuna/Compiler/Core/Canonical.vuna"
let rec v_decArg = (fun (dtb_u_u95 : int) (dtb_u_u96 : Base_dBytes.t_Cur) -> (if (dtb_u_u95 <= 0) then B_dData_dMaybe.C_Maybe_Nothing else (let dtb_u_u97 = ((v_decTerm (dtb_u_u95 - 1)) dtb_u_u96) in (match dtb_u_u97 with
  | B_dData_dMaybe.C_Maybe_Just (dtb_u_u98) -> (match dtb_u_u98 with
  | { B_dData_dPair.f_Pair_first = dtb_u_u99; B_dData_dPair.f_Pair_second = dtb_u_u100 } -> (let dtb_u_u101 = ((v_decRig (dtb_u_u95 - 1)) dtb_u_u100) in (match dtb_u_u101 with
  | B_dData_dMaybe.C_Maybe_Just (dtb_u_u102) -> (match dtb_u_u102 with
  | { B_dData_dPair.f_Pair_first = dtb_u_u103; B_dData_dPair.f_Pair_second = dtb_u_u104 } -> (B_dData_dMaybe.C_Maybe_Just ({ B_dData_dPair.f_Pair_first = { B_dData_dPair.f_Pair_first = dtb_u_u99; B_dData_dPair.f_Pair_second = dtb_u_u103 }; B_dData_dPair.f_Pair_second = dtb_u_u104 }))
  | _ -> failwith "DT: impossible branch"
)
  | B_dData_dMaybe.C_Maybe_Nothing -> B_dData_dMaybe.C_Maybe_Nothing
  | _ -> failwith "DT: impossible branch"
))
  | _ -> failwith "DT: impossible branch"
)
  | B_dData_dMaybe.C_Maybe_Nothing -> B_dData_dMaybe.C_Maybe_Nothing
  | _ -> failwith "DT: impossible branch"
))))
# 149 "Vuna/Compiler/Core/Canonical.vuna"
and v_decAlt = (fun (dtb_u_u105 : int) (dtb_u_u106 : Base_dBytes.t_Cur) -> (if (dtb_u_u105 <= 0) then B_dData_dMaybe.C_Maybe_Nothing else (let dtb_u_u107 = ((Base_dBytes.v_decStr (dtb_u_u105 - 1)) dtb_u_u106) in (match dtb_u_u107 with
  | B_dData_dMaybe.C_Maybe_Just (dtb_u_u108) -> (match dtb_u_u108 with
  | { B_dData_dPair.f_Pair_first = dtb_u_u109; B_dData_dPair.f_Pair_second = dtb_u_u110 } -> (let dtb_u_u111 = (((Base_dBytes.v_decList v_decBinder) (dtb_u_u105 - 1)) dtb_u_u110) in (match dtb_u_u111 with
  | B_dData_dMaybe.C_Maybe_Just (dtb_u_u112) -> (match dtb_u_u112 with
  | { B_dData_dPair.f_Pair_first = dtb_u_u113; B_dData_dPair.f_Pair_second = dtb_u_u114 } -> (let dtb_u_u115 = ((v_decTerm (dtb_u_u105 - 1)) dtb_u_u114) in (match dtb_u_u115 with
  | B_dData_dMaybe.C_Maybe_Just (dtb_u_u116) -> (match dtb_u_u116 with
  | { B_dData_dPair.f_Pair_first = dtb_u_u117; B_dData_dPair.f_Pair_second = dtb_u_u118 } -> (B_dData_dMaybe.C_Maybe_Just ({ B_dData_dPair.f_Pair_first = { Core_dTerm.f_CaseAlt_caseAltName = dtb_u_u109; Core_dTerm.f_CaseAlt_caseAltBinders = (Core_dTerm.v_bindersOfPairs dtb_u_u113); Core_dTerm.f_CaseAlt_caseAltBody = dtb_u_u117 }; B_dData_dPair.f_Pair_second = dtb_u_u118 }))
  | _ -> failwith "DT: impossible branch"
)
  | B_dData_dMaybe.C_Maybe_Nothing -> B_dData_dMaybe.C_Maybe_Nothing
  | _ -> failwith "DT: impossible branch"
))
  | _ -> failwith "DT: impossible branch"
)
  | B_dData_dMaybe.C_Maybe_Nothing -> B_dData_dMaybe.C_Maybe_Nothing
  | _ -> failwith "DT: impossible branch"
))
  | _ -> failwith "DT: impossible branch"
)
  | B_dData_dMaybe.C_Maybe_Nothing -> B_dData_dMaybe.C_Maybe_Nothing
  | _ -> failwith "DT: impossible branch"
))))
# 165 "Vuna/Compiler/Core/Canonical.vuna"
and v_decTerm = (fun (dtb_u_u119 : int) (dtb_u_u120 : Base_dBytes.t_Cur) -> (if (dtb_u_u119 <= 0) then B_dData_dMaybe.C_Maybe_Nothing else (let dtb_u_u121 = ((Base_dBytes.v_decTag dtb_u_u119) dtb_u_u120) in (match dtb_u_u121 with
  | B_dData_dMaybe.C_Maybe_Just (dtb_u_u122) -> (match dtb_u_u122 with
  | { B_dData_dPair.f_Pair_first = dtb_u_u123; B_dData_dPair.f_Pair_second = dtb_u_u124 } -> (if (dtb_u_u123 = 0) then (let dtb_u_u125 = ((Base_dBytes.v_decStr (dtb_u_u119 - 1)) dtb_u_u124) in (match dtb_u_u125 with
  | B_dData_dMaybe.C_Maybe_Just (dtb_u_u126) -> (match dtb_u_u126 with
  | { B_dData_dPair.f_Pair_first = dtb_u_u127; B_dData_dPair.f_Pair_second = dtb_u_u128 } -> (let dtb_u_u129 = ((Base_dBytes.v_decInt (dtb_u_u119 - 1)) dtb_u_u128) in (match dtb_u_u129 with
  | B_dData_dMaybe.C_Maybe_Just (dtb_u_u130) -> (match dtb_u_u130 with
  | { B_dData_dPair.f_Pair_first = dtb_u_u131; B_dData_dPair.f_Pair_second = dtb_u_u132 } -> (B_dData_dMaybe.C_Maybe_Just ({ B_dData_dPair.f_Pair_first = (Core_dTerm.C_Term_TVar (dtb_u_u127, dtb_u_u131, v_noSpan)); B_dData_dPair.f_Pair_second = dtb_u_u132 }))
  | _ -> failwith "DT: impossible branch"
)
  | B_dData_dMaybe.C_Maybe_Nothing -> B_dData_dMaybe.C_Maybe_Nothing
  | _ -> failwith "DT: impossible branch"
))
  | _ -> failwith "DT: impossible branch"
)
  | B_dData_dMaybe.C_Maybe_Nothing -> B_dData_dMaybe.C_Maybe_Nothing
  | _ -> failwith "DT: impossible branch"
)) else (if (dtb_u_u123 = 1) then (let dtb_u_u133 = ((Base_dBytes.v_decInt (dtb_u_u119 - 1)) dtb_u_u124) in (match dtb_u_u133 with
  | B_dData_dMaybe.C_Maybe_Just (dtb_u_u134) -> (match dtb_u_u134 with
  | { B_dData_dPair.f_Pair_first = dtb_u_u135; B_dData_dPair.f_Pair_second = dtb_u_u136 } -> (B_dData_dMaybe.C_Maybe_Just ({ B_dData_dPair.f_Pair_first = (Core_dTerm.C_Term_TMeta (dtb_u_u135)); B_dData_dPair.f_Pair_second = dtb_u_u136 }))
  | _ -> failwith "DT: impossible branch"
)
  | B_dData_dMaybe.C_Maybe_Nothing -> B_dData_dMaybe.C_Maybe_Nothing
  | _ -> failwith "DT: impossible branch"
)) else (if (dtb_u_u123 = 2) then (let dtb_u_u137 = ((Base_dBytes.v_decStr (dtb_u_u119 - 1)) dtb_u_u124) in (match dtb_u_u137 with
  | B_dData_dMaybe.C_Maybe_Just (dtb_u_u138) -> (match dtb_u_u138 with
  | { B_dData_dPair.f_Pair_first = dtb_u_u139; B_dData_dPair.f_Pair_second = dtb_u_u140 } -> (B_dData_dMaybe.C_Maybe_Just ({ B_dData_dPair.f_Pair_first = (Core_dTerm.C_Term_TGlobal (dtb_u_u139)); B_dData_dPair.f_Pair_second = dtb_u_u140 }))
  | _ -> failwith "DT: impossible branch"
)
  | B_dData_dMaybe.C_Maybe_Nothing -> B_dData_dMaybe.C_Maybe_Nothing
  | _ -> failwith "DT: impossible branch"
)) else (if (dtb_u_u123 = 3) then (let dtb_u_u141 = ((Base_dBytes.v_decInt (dtb_u_u119 - 1)) dtb_u_u124) in (match dtb_u_u141 with
  | B_dData_dMaybe.C_Maybe_Just (dtb_u_u142) -> (match dtb_u_u142 with
  | { B_dData_dPair.f_Pair_first = dtb_u_u143; B_dData_dPair.f_Pair_second = dtb_u_u144 } -> (B_dData_dMaybe.C_Maybe_Just ({ B_dData_dPair.f_Pair_first = (Core_dTerm.C_Term_TType ((Core_dTerm.v_levelOfInt dtb_u_u143))); B_dData_dPair.f_Pair_second = dtb_u_u144 }))
  | _ -> failwith "DT: impossible branch"
)
  | B_dData_dMaybe.C_Maybe_Nothing -> B_dData_dMaybe.C_Maybe_Nothing
  | _ -> failwith "DT: impossible branch"
)) else (if (dtb_u_u123 = 4) then (let dtb_u_u145 = ((Base_dBytes.v_decStr (dtb_u_u119 - 1)) dtb_u_u124) in (match dtb_u_u145 with
  | B_dData_dMaybe.C_Maybe_Just (dtb_u_u146) -> (match dtb_u_u146 with
  | { B_dData_dPair.f_Pair_first = dtb_u_u147; B_dData_dPair.f_Pair_second = dtb_u_u148 } -> (let dtb_u_u149 = ((Base_dBytes.v_decBool (dtb_u_u119 - 1)) dtb_u_u148) in (match dtb_u_u149 with
  | B_dData_dMaybe.C_Maybe_Just (dtb_u_u150) -> (match dtb_u_u150 with
  | { B_dData_dPair.f_Pair_first = dtb_u_u151; B_dData_dPair.f_Pair_second = dtb_u_u152 } -> (let dtb_u_u153 = ((v_decRig (dtb_u_u119 - 1)) dtb_u_u152) in (match dtb_u_u153 with
  | B_dData_dMaybe.C_Maybe_Just (dtb_u_u154) -> (match dtb_u_u154 with
  | { B_dData_dPair.f_Pair_first = dtb_u_u155; B_dData_dPair.f_Pair_second = dtb_u_u156 } -> (let dtb_u_u157 = ((v_decTerm (dtb_u_u119 - 1)) dtb_u_u156) in (match dtb_u_u157 with
  | B_dData_dMaybe.C_Maybe_Just (dtb_u_u158) -> (match dtb_u_u158 with
  | { B_dData_dPair.f_Pair_first = dtb_u_u159; B_dData_dPair.f_Pair_second = dtb_u_u160 } -> (let dtb_u_u161 = ((v_decTerm (dtb_u_u119 - 1)) dtb_u_u160) in (match dtb_u_u161 with
  | B_dData_dMaybe.C_Maybe_Just (dtb_u_u162) -> (match dtb_u_u162 with
  | { B_dData_dPair.f_Pair_first = dtb_u_u163; B_dData_dPair.f_Pair_second = dtb_u_u164 } -> (B_dData_dMaybe.C_Maybe_Just ({ B_dData_dPair.f_Pair_first = (Core_dTerm.C_Term_TPi (dtb_u_u147, dtb_u_u151, dtb_u_u155, dtb_u_u159, dtb_u_u163)); B_dData_dPair.f_Pair_second = dtb_u_u164 }))
  | _ -> failwith "DT: impossible branch"
)
  | B_dData_dMaybe.C_Maybe_Nothing -> B_dData_dMaybe.C_Maybe_Nothing
  | _ -> failwith "DT: impossible branch"
))
  | _ -> failwith "DT: impossible branch"
)
  | B_dData_dMaybe.C_Maybe_Nothing -> B_dData_dMaybe.C_Maybe_Nothing
  | _ -> failwith "DT: impossible branch"
))
  | _ -> failwith "DT: impossible branch"
)
  | B_dData_dMaybe.C_Maybe_Nothing -> B_dData_dMaybe.C_Maybe_Nothing
  | _ -> failwith "DT: impossible branch"
))
  | _ -> failwith "DT: impossible branch"
)
  | B_dData_dMaybe.C_Maybe_Nothing -> B_dData_dMaybe.C_Maybe_Nothing
  | _ -> failwith "DT: impossible branch"
))
  | _ -> failwith "DT: impossible branch"
)
  | B_dData_dMaybe.C_Maybe_Nothing -> B_dData_dMaybe.C_Maybe_Nothing
  | _ -> failwith "DT: impossible branch"
)) else (if (dtb_u_u123 = 5) then (let dtb_u_u165 = ((Base_dBytes.v_decStr (dtb_u_u119 - 1)) dtb_u_u124) in (match dtb_u_u165 with
  | B_dData_dMaybe.C_Maybe_Just (dtb_u_u166) -> (match dtb_u_u166 with
  | { B_dData_dPair.f_Pair_first = dtb_u_u167; B_dData_dPair.f_Pair_second = dtb_u_u168 } -> (let dtb_u_u169 = ((v_decRig (dtb_u_u119 - 1)) dtb_u_u168) in (match dtb_u_u169 with
  | B_dData_dMaybe.C_Maybe_Just (dtb_u_u170) -> (match dtb_u_u170 with
  | { B_dData_dPair.f_Pair_first = dtb_u_u171; B_dData_dPair.f_Pair_second = dtb_u_u172 } -> (let dtb_u_u173 = ((v_decTerm (dtb_u_u119 - 1)) dtb_u_u172) in (match dtb_u_u173 with
  | B_dData_dMaybe.C_Maybe_Just (dtb_u_u174) -> (match dtb_u_u174 with
  | { B_dData_dPair.f_Pair_first = dtb_u_u175; B_dData_dPair.f_Pair_second = dtb_u_u176 } -> (B_dData_dMaybe.C_Maybe_Just ({ B_dData_dPair.f_Pair_first = (Core_dTerm.C_Term_TLam (dtb_u_u167, dtb_u_u171, B_dData_dMaybe.C_Maybe_Nothing, v_noSpan, dtb_u_u175)); B_dData_dPair.f_Pair_second = dtb_u_u176 }))
  | _ -> failwith "DT: impossible branch"
)
  | B_dData_dMaybe.C_Maybe_Nothing -> B_dData_dMaybe.C_Maybe_Nothing
  | _ -> failwith "DT: impossible branch"
))
  | _ -> failwith "DT: impossible branch"
)
  | B_dData_dMaybe.C_Maybe_Nothing -> B_dData_dMaybe.C_Maybe_Nothing
  | _ -> failwith "DT: impossible branch"
))
  | _ -> failwith "DT: impossible branch"
)
  | B_dData_dMaybe.C_Maybe_Nothing -> B_dData_dMaybe.C_Maybe_Nothing
  | _ -> failwith "DT: impossible branch"
)) else (if (dtb_u_u123 = 6) then (let dtb_u_u177 = ((v_decTerm (dtb_u_u119 - 1)) dtb_u_u124) in (match dtb_u_u177 with
  | B_dData_dMaybe.C_Maybe_Just (dtb_u_u178) -> (match dtb_u_u178 with
  | { B_dData_dPair.f_Pair_first = dtb_u_u179; B_dData_dPair.f_Pair_second = dtb_u_u180 } -> (let dtb_u_u181 = ((v_decTerm (dtb_u_u119 - 1)) dtb_u_u180) in (match dtb_u_u181 with
  | B_dData_dMaybe.C_Maybe_Just (dtb_u_u182) -> (match dtb_u_u182 with
  | { B_dData_dPair.f_Pair_first = dtb_u_u183; B_dData_dPair.f_Pair_second = dtb_u_u184 } -> (let dtb_u_u185 = ((v_decRig (dtb_u_u119 - 1)) dtb_u_u184) in (match dtb_u_u185 with
  | B_dData_dMaybe.C_Maybe_Just (dtb_u_u186) -> (match dtb_u_u186 with
  | { B_dData_dPair.f_Pair_first = dtb_u_u187; B_dData_dPair.f_Pair_second = dtb_u_u188 } -> (B_dData_dMaybe.C_Maybe_Just ({ B_dData_dPair.f_Pair_first = (Core_dTerm.C_Term_TApp (dtb_u_u179, dtb_u_u183, dtb_u_u187)); B_dData_dPair.f_Pair_second = dtb_u_u188 }))
  | _ -> failwith "DT: impossible branch"
)
  | B_dData_dMaybe.C_Maybe_Nothing -> B_dData_dMaybe.C_Maybe_Nothing
  | _ -> failwith "DT: impossible branch"
))
  | _ -> failwith "DT: impossible branch"
)
  | B_dData_dMaybe.C_Maybe_Nothing -> B_dData_dMaybe.C_Maybe_Nothing
  | _ -> failwith "DT: impossible branch"
))
  | _ -> failwith "DT: impossible branch"
)
  | B_dData_dMaybe.C_Maybe_Nothing -> B_dData_dMaybe.C_Maybe_Nothing
  | _ -> failwith "DT: impossible branch"
)) else (if (dtb_u_u123 = 7) then (let dtb_u_u189 = ((Base_dBytes.v_decStr (dtb_u_u119 - 1)) dtb_u_u124) in (match dtb_u_u189 with
  | B_dData_dMaybe.C_Maybe_Just (dtb_u_u190) -> (match dtb_u_u190 with
  | { B_dData_dPair.f_Pair_first = dtb_u_u191; B_dData_dPair.f_Pair_second = dtb_u_u192 } -> (let dtb_u_u193 = (((Base_dBytes.v_decList v_decArg) (dtb_u_u119 - 1)) dtb_u_u192) in (match dtb_u_u193 with
  | B_dData_dMaybe.C_Maybe_Just (dtb_u_u194) -> (match dtb_u_u194 with
  | { B_dData_dPair.f_Pair_first = dtb_u_u195; B_dData_dPair.f_Pair_second = dtb_u_u196 } -> (B_dData_dMaybe.C_Maybe_Just ({ B_dData_dPair.f_Pair_first = (Core_dTerm.C_Term_TCon (dtb_u_u191, dtb_u_u195)); B_dData_dPair.f_Pair_second = dtb_u_u196 }))
  | _ -> failwith "DT: impossible branch"
)
  | B_dData_dMaybe.C_Maybe_Nothing -> B_dData_dMaybe.C_Maybe_Nothing
  | _ -> failwith "DT: impossible branch"
))
  | _ -> failwith "DT: impossible branch"
)
  | B_dData_dMaybe.C_Maybe_Nothing -> B_dData_dMaybe.C_Maybe_Nothing
  | _ -> failwith "DT: impossible branch"
)) else (if (dtb_u_u123 = 8) then (let dtb_u_u197 = ((Base_dBytes.v_decStr (dtb_u_u119 - 1)) dtb_u_u124) in (match dtb_u_u197 with
  | B_dData_dMaybe.C_Maybe_Just (dtb_u_u198) -> (match dtb_u_u198 with
  | { B_dData_dPair.f_Pair_first = dtb_u_u199; B_dData_dPair.f_Pair_second = dtb_u_u200 } -> (let dtb_u_u201 = (((Base_dBytes.v_decList v_decArg) (dtb_u_u119 - 1)) dtb_u_u200) in (match dtb_u_u201 with
  | B_dData_dMaybe.C_Maybe_Just (dtb_u_u202) -> (match dtb_u_u202 with
  | { B_dData_dPair.f_Pair_first = dtb_u_u203; B_dData_dPair.f_Pair_second = dtb_u_u204 } -> (B_dData_dMaybe.C_Maybe_Just ({ B_dData_dPair.f_Pair_first = (Core_dTerm.C_Term_TMk (dtb_u_u199, dtb_u_u203)); B_dData_dPair.f_Pair_second = dtb_u_u204 }))
  | _ -> failwith "DT: impossible branch"
)
  | B_dData_dMaybe.C_Maybe_Nothing -> B_dData_dMaybe.C_Maybe_Nothing
  | _ -> failwith "DT: impossible branch"
))
  | _ -> failwith "DT: impossible branch"
)
  | B_dData_dMaybe.C_Maybe_Nothing -> B_dData_dMaybe.C_Maybe_Nothing
  | _ -> failwith "DT: impossible branch"
)) else (if (dtb_u_u123 = 9) then (let dtb_u_u205 = ((v_decTerm (dtb_u_u119 - 1)) dtb_u_u124) in (match dtb_u_u205 with
  | B_dData_dMaybe.C_Maybe_Just (dtb_u_u206) -> (match dtb_u_u206 with
  | { B_dData_dPair.f_Pair_first = dtb_u_u207; B_dData_dPair.f_Pair_second = dtb_u_u208 } -> (let dtb_u_u209 = (((Base_dBytes.v_decList v_decAlt) (dtb_u_u119 - 1)) dtb_u_u208) in (match dtb_u_u209 with
  | B_dData_dMaybe.C_Maybe_Just (dtb_u_u210) -> (match dtb_u_u210 with
  | { B_dData_dPair.f_Pair_first = dtb_u_u211; B_dData_dPair.f_Pair_second = dtb_u_u212 } -> (B_dData_dMaybe.C_Maybe_Just ({ B_dData_dPair.f_Pair_first = (Core_dTerm.C_Term_TCase (dtb_u_u207, dtb_u_u211)); B_dData_dPair.f_Pair_second = dtb_u_u212 }))
  | _ -> failwith "DT: impossible branch"
)
  | B_dData_dMaybe.C_Maybe_Nothing -> B_dData_dMaybe.C_Maybe_Nothing
  | _ -> failwith "DT: impossible branch"
))
  | _ -> failwith "DT: impossible branch"
)
  | B_dData_dMaybe.C_Maybe_Nothing -> B_dData_dMaybe.C_Maybe_Nothing
  | _ -> failwith "DT: impossible branch"
)) else (if (dtb_u_u123 = 10) then (let dtb_u_u213 = ((v_decTerm (dtb_u_u119 - 1)) dtb_u_u124) in (match dtb_u_u213 with
  | B_dData_dMaybe.C_Maybe_Just (dtb_u_u214) -> (match dtb_u_u214 with
  | { B_dData_dPair.f_Pair_first = dtb_u_u215; B_dData_dPair.f_Pair_second = dtb_u_u216 } -> (let dtb_u_u217 = ((Base_dBytes.v_decStr (dtb_u_u119 - 1)) dtb_u_u216) in (match dtb_u_u217 with
  | B_dData_dMaybe.C_Maybe_Just (dtb_u_u218) -> (match dtb_u_u218 with
  | { B_dData_dPair.f_Pair_first = dtb_u_u219; B_dData_dPair.f_Pair_second = dtb_u_u220 } -> (let dtb_u_u221 = (((Base_dBytes.v_decList v_decBinder) (dtb_u_u119 - 1)) dtb_u_u220) in (match dtb_u_u221 with
  | B_dData_dMaybe.C_Maybe_Just (dtb_u_u222) -> (match dtb_u_u222 with
  | { B_dData_dPair.f_Pair_first = dtb_u_u223; B_dData_dPair.f_Pair_second = dtb_u_u224 } -> (let dtb_u_u225 = ((Base_dBytes.v_decInt (dtb_u_u119 - 1)) dtb_u_u224) in (match dtb_u_u225 with
  | B_dData_dMaybe.C_Maybe_Just (dtb_u_u226) -> (match dtb_u_u226 with
  | { B_dData_dPair.f_Pair_first = dtb_u_u227; B_dData_dPair.f_Pair_second = dtb_u_u228 } -> (let dtb_u_u229 = ((Base_dBytes.v_decInt (dtb_u_u119 - 1)) dtb_u_u228) in (match dtb_u_u229 with
  | B_dData_dMaybe.C_Maybe_Just (dtb_u_u230) -> (match dtb_u_u230 with
  | { B_dData_dPair.f_Pair_first = dtb_u_u231; B_dData_dPair.f_Pair_second = dtb_u_u232 } -> (B_dData_dMaybe.C_Maybe_Just ({ B_dData_dPair.f_Pair_first = (Core_dTerm.C_Term_TProj (dtb_u_u215, dtb_u_u219, dtb_u_u223, dtb_u_u227, dtb_u_u231)); B_dData_dPair.f_Pair_second = dtb_u_u232 }))
  | _ -> failwith "DT: impossible branch"
)
  | B_dData_dMaybe.C_Maybe_Nothing -> B_dData_dMaybe.C_Maybe_Nothing
  | _ -> failwith "DT: impossible branch"
))
  | _ -> failwith "DT: impossible branch"
)
  | B_dData_dMaybe.C_Maybe_Nothing -> B_dData_dMaybe.C_Maybe_Nothing
  | _ -> failwith "DT: impossible branch"
))
  | _ -> failwith "DT: impossible branch"
)
  | B_dData_dMaybe.C_Maybe_Nothing -> B_dData_dMaybe.C_Maybe_Nothing
  | _ -> failwith "DT: impossible branch"
))
  | _ -> failwith "DT: impossible branch"
)
  | B_dData_dMaybe.C_Maybe_Nothing -> B_dData_dMaybe.C_Maybe_Nothing
  | _ -> failwith "DT: impossible branch"
))
  | _ -> failwith "DT: impossible branch"
)
  | B_dData_dMaybe.C_Maybe_Nothing -> B_dData_dMaybe.C_Maybe_Nothing
  | _ -> failwith "DT: impossible branch"
)) else (if (dtb_u_u123 = 11) then (let dtb_u_u233 = ((v_decTerm (dtb_u_u119 - 1)) dtb_u_u124) in (match dtb_u_u233 with
  | B_dData_dMaybe.C_Maybe_Just (dtb_u_u234) -> (match dtb_u_u234 with
  | { B_dData_dPair.f_Pair_first = dtb_u_u235; B_dData_dPair.f_Pair_second = dtb_u_u236 } -> (let dtb_u_u237 = ((Base_dBytes.v_decStr (dtb_u_u119 - 1)) dtb_u_u236) in (match dtb_u_u237 with
  | B_dData_dMaybe.C_Maybe_Just (dtb_u_u238) -> (match dtb_u_u238 with
  | { B_dData_dPair.f_Pair_first = dtb_u_u239; B_dData_dPair.f_Pair_second = dtb_u_u240 } -> (let dtb_u_u241 = (((Base_dBytes.v_decList v_decBinder) (dtb_u_u119 - 1)) dtb_u_u240) in (match dtb_u_u241 with
  | B_dData_dMaybe.C_Maybe_Just (dtb_u_u242) -> (match dtb_u_u242 with
  | { B_dData_dPair.f_Pair_first = dtb_u_u243; B_dData_dPair.f_Pair_second = dtb_u_u244 } -> (let dtb_u_u245 = (((Base_dBytes.v_decList Base_dBytes.v_decInt) (dtb_u_u119 - 1)) dtb_u_u244) in (match dtb_u_u245 with
  | B_dData_dMaybe.C_Maybe_Just (dtb_u_u246) -> (match dtb_u_u246 with
  | { B_dData_dPair.f_Pair_first = dtb_u_u247; B_dData_dPair.f_Pair_second = dtb_u_u248 } -> (let dtb_u_u249 = ((v_decTerm (dtb_u_u119 - 1)) dtb_u_u248) in (match dtb_u_u249 with
  | B_dData_dMaybe.C_Maybe_Just (dtb_u_u250) -> (match dtb_u_u250 with
  | { B_dData_dPair.f_Pair_first = dtb_u_u251; B_dData_dPair.f_Pair_second = dtb_u_u252 } -> (B_dData_dMaybe.C_Maybe_Just ({ B_dData_dPair.f_Pair_first = (Core_dTerm.C_Term_TRecUpd (dtb_u_u235, dtb_u_u239, dtb_u_u243, dtb_u_u247, dtb_u_u251)); B_dData_dPair.f_Pair_second = dtb_u_u252 }))
  | _ -> failwith "DT: impossible branch"
)
  | B_dData_dMaybe.C_Maybe_Nothing -> B_dData_dMaybe.C_Maybe_Nothing
  | _ -> failwith "DT: impossible branch"
))
  | _ -> failwith "DT: impossible branch"
)
  | B_dData_dMaybe.C_Maybe_Nothing -> B_dData_dMaybe.C_Maybe_Nothing
  | _ -> failwith "DT: impossible branch"
))
  | _ -> failwith "DT: impossible branch"
)
  | B_dData_dMaybe.C_Maybe_Nothing -> B_dData_dMaybe.C_Maybe_Nothing
  | _ -> failwith "DT: impossible branch"
))
  | _ -> failwith "DT: impossible branch"
)
  | B_dData_dMaybe.C_Maybe_Nothing -> B_dData_dMaybe.C_Maybe_Nothing
  | _ -> failwith "DT: impossible branch"
))
  | _ -> failwith "DT: impossible branch"
)
  | B_dData_dMaybe.C_Maybe_Nothing -> B_dData_dMaybe.C_Maybe_Nothing
  | _ -> failwith "DT: impossible branch"
)) else (if (dtb_u_u123 = 12) then (let dtb_u_u253 = ((Base_dBytes.v_decInt (dtb_u_u119 - 1)) dtb_u_u124) in (match dtb_u_u253 with
  | B_dData_dMaybe.C_Maybe_Just (dtb_u_u254) -> (match dtb_u_u254 with
  | { B_dData_dPair.f_Pair_first = dtb_u_u255; B_dData_dPair.f_Pair_second = dtb_u_u256 } -> (B_dData_dMaybe.C_Maybe_Just ({ B_dData_dPair.f_Pair_first = (Core_dTerm.C_Term_TInt (dtb_u_u255)); B_dData_dPair.f_Pair_second = dtb_u_u256 }))
  | _ -> failwith "DT: impossible branch"
)
  | B_dData_dMaybe.C_Maybe_Nothing -> B_dData_dMaybe.C_Maybe_Nothing
  | _ -> failwith "DT: impossible branch"
)) else (if (dtb_u_u123 = 13) then (let dtb_u_u257 = ((Base_dBytes.v_decStr (dtb_u_u119 - 1)) dtb_u_u124) in (match dtb_u_u257 with
  | B_dData_dMaybe.C_Maybe_Just (dtb_u_u258) -> (match dtb_u_u258 with
  | { B_dData_dPair.f_Pair_first = dtb_u_u259; B_dData_dPair.f_Pair_second = dtb_u_u260 } -> (B_dData_dMaybe.C_Maybe_Just ({ B_dData_dPair.f_Pair_first = (Core_dTerm.C_Term_TStr (dtb_u_u259)); B_dData_dPair.f_Pair_second = dtb_u_u260 }))
  | _ -> failwith "DT: impossible branch"
)
  | B_dData_dMaybe.C_Maybe_Nothing -> B_dData_dMaybe.C_Maybe_Nothing
  | _ -> failwith "DT: impossible branch"
)) else (if (dtb_u_u123 = 14) then (let dtb_u_u261 = ((Base_dBytes.v_decBool (dtb_u_u119 - 1)) dtb_u_u124) in (match dtb_u_u261 with
  | B_dData_dMaybe.C_Maybe_Just (dtb_u_u262) -> (match dtb_u_u262 with
  | { B_dData_dPair.f_Pair_first = dtb_u_u263; B_dData_dPair.f_Pair_second = dtb_u_u264 } -> (B_dData_dMaybe.C_Maybe_Just ({ B_dData_dPair.f_Pair_first = (Core_dTerm.C_Term_TBool (dtb_u_u263)); B_dData_dPair.f_Pair_second = dtb_u_u264 }))
  | _ -> failwith "DT: impossible branch"
)
  | B_dData_dMaybe.C_Maybe_Nothing -> B_dData_dMaybe.C_Maybe_Nothing
  | _ -> failwith "DT: impossible branch"
)) else (if (dtb_u_u123 = 15) then (let dtb_u_u265 = ((v_decTerm (dtb_u_u119 - 1)) dtb_u_u124) in (match dtb_u_u265 with
  | B_dData_dMaybe.C_Maybe_Just (dtb_u_u266) -> (match dtb_u_u266 with
  | { B_dData_dPair.f_Pair_first = dtb_u_u267; B_dData_dPair.f_Pair_second = dtb_u_u268 } -> (let dtb_u_u269 = ((v_decTerm (dtb_u_u119 - 1)) dtb_u_u268) in (match dtb_u_u269 with
  | B_dData_dMaybe.C_Maybe_Just (dtb_u_u270) -> (match dtb_u_u270 with
  | { B_dData_dPair.f_Pair_first = dtb_u_u271; B_dData_dPair.f_Pair_second = dtb_u_u272 } -> (let dtb_u_u273 = ((v_decTerm (dtb_u_u119 - 1)) dtb_u_u272) in (match dtb_u_u273 with
  | B_dData_dMaybe.C_Maybe_Just (dtb_u_u274) -> (match dtb_u_u274 with
  | { B_dData_dPair.f_Pair_first = dtb_u_u275; B_dData_dPair.f_Pair_second = dtb_u_u276 } -> (B_dData_dMaybe.C_Maybe_Just ({ B_dData_dPair.f_Pair_first = (Core_dTerm.C_Term_TIf (dtb_u_u267, dtb_u_u271, dtb_u_u275)); B_dData_dPair.f_Pair_second = dtb_u_u276 }))
  | _ -> failwith "DT: impossible branch"
)
  | B_dData_dMaybe.C_Maybe_Nothing -> B_dData_dMaybe.C_Maybe_Nothing
  | _ -> failwith "DT: impossible branch"
))
  | _ -> failwith "DT: impossible branch"
)
  | B_dData_dMaybe.C_Maybe_Nothing -> B_dData_dMaybe.C_Maybe_Nothing
  | _ -> failwith "DT: impossible branch"
))
  | _ -> failwith "DT: impossible branch"
)
  | B_dData_dMaybe.C_Maybe_Nothing -> B_dData_dMaybe.C_Maybe_Nothing
  | _ -> failwith "DT: impossible branch"
)) else (if (dtb_u_u123 = 16) then (let dtb_u_u277 = ((Base_dBytes.v_decStr (dtb_u_u119 - 1)) dtb_u_u124) in (match dtb_u_u277 with
  | B_dData_dMaybe.C_Maybe_Just (dtb_u_u278) -> (match dtb_u_u278 with
  | { B_dData_dPair.f_Pair_first = dtb_u_u279; B_dData_dPair.f_Pair_second = dtb_u_u280 } -> (B_dData_dMaybe.C_Maybe_Just ({ B_dData_dPair.f_Pair_first = (Core_dTerm.C_Term_TFloat (dtb_u_u279)); B_dData_dPair.f_Pair_second = dtb_u_u280 }))
  | _ -> failwith "DT: impossible branch"
)
  | B_dData_dMaybe.C_Maybe_Nothing -> B_dData_dMaybe.C_Maybe_Nothing
  | _ -> failwith "DT: impossible branch"
)) else (if (dtb_u_u123 = 17) then (let dtb_u_u281 = ((Base_dBytes.v_decStr (dtb_u_u119 - 1)) dtb_u_u124) in (match dtb_u_u281 with
  | B_dData_dMaybe.C_Maybe_Just (dtb_u_u282) -> (match dtb_u_u282 with
  | { B_dData_dPair.f_Pair_first = dtb_u_u283; B_dData_dPair.f_Pair_second = dtb_u_u284 } -> (let dtb_u_u285 = (((Base_dBytes.v_decList v_decArg) (dtb_u_u119 - 1)) dtb_u_u284) in (match dtb_u_u285 with
  | B_dData_dMaybe.C_Maybe_Just (dtb_u_u286) -> (match dtb_u_u286 with
  | { B_dData_dPair.f_Pair_first = dtb_u_u287; B_dData_dPair.f_Pair_second = dtb_u_u288 } -> (B_dData_dMaybe.C_Maybe_Just ({ B_dData_dPair.f_Pair_first = (Core_dTerm.C_Term_TRecord (dtb_u_u283, dtb_u_u287)); B_dData_dPair.f_Pair_second = dtb_u_u288 }))
  | _ -> failwith "DT: impossible branch"
)
  | B_dData_dMaybe.C_Maybe_Nothing -> B_dData_dMaybe.C_Maybe_Nothing
  | _ -> failwith "DT: impossible branch"
))
  | _ -> failwith "DT: impossible branch"
)
  | B_dData_dMaybe.C_Maybe_Nothing -> B_dData_dMaybe.C_Maybe_Nothing
  | _ -> failwith "DT: impossible branch"
)) else B_dData_dMaybe.C_Maybe_Nothing))))))))))))))))))
  | _ -> failwith "DT: impossible branch"
)
  | B_dData_dMaybe.C_Maybe_Nothing -> B_dData_dMaybe.C_Maybe_Nothing
  | _ -> failwith "DT: impossible branch"
))))

# 318 "Vuna/Compiler/Core/Canonical.vuna"
let v_decTermComplete = (fun (dtb_u_u289 : string) -> (let dtb_u_u290 = ((v_decTerm (String.length dtb_u_u289)) (Base_dBytes.v_curOf dtb_u_u289)) in (match dtb_u_u290 with
  | B_dData_dMaybe.C_Maybe_Just (dtb_u_u291) -> (match dtb_u_u291 with
  | { B_dData_dPair.f_Pair_first = dtb_u_u292; B_dData_dPair.f_Pair_second = dtb_u_u293 } -> (if (Base_dBytes.v_curAtEnd dtb_u_u293) then (B_dData_dMaybe.C_Maybe_Just (dtb_u_u292)) else B_dData_dMaybe.C_Maybe_Nothing)
  | _ -> failwith "DT: impossible branch"
)
  | B_dData_dMaybe.C_Maybe_Nothing -> B_dData_dMaybe.C_Maybe_Nothing
  | _ -> failwith "DT: impossible branch"
)))
