open Vuna_runtime
# 26 "Vuna/Compiler/Core/Canonical.vuna"
let v_Vuna_dCompiler_dCore_dCanonical_dnoSpan = { Vuna_dCompiler_dBase_dSource.f_Vuna_dCompiler_dBase_dSource_dSpan_spanFile = ""; Vuna_dCompiler_dBase_dSource.f_Vuna_dCompiler_dBase_dSource_dSpan_spanStartLine = 0; Vuna_dCompiler_dBase_dSource.f_Vuna_dCompiler_dBase_dSource_dSpan_spanStartCol = 0; Vuna_dCompiler_dBase_dSource.f_Vuna_dCompiler_dBase_dSource_dSpan_spanEndLine = 0; Vuna_dCompiler_dBase_dSource.f_Vuna_dCompiler_dBase_dSource_dSpan_spanEndCol = 0; Vuna_dCompiler_dBase_dSource.f_Vuna_dCompiler_dBase_dSource_dSpan_spanStartOffset = 0; Vuna_dCompiler_dBase_dSource.f_Vuna_dCompiler_dBase_dSource_dSpan_spanEndOffset = 0 }

# 33 "Vuna/Compiler/Core/Canonical.vuna"
let v_Vuna_dCompiler_dCore_dCanonical_dencRig = (fun mc0 mc1 -> (match mc0 with
  | Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dRig_RigOmega -> ((Vuna_dCompiler_dBase_dBytes.v_Vuna_dCompiler_dBase_dBytes_dencTag 2) mc1)
  | Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dRig_Rig1 -> ((Vuna_dCompiler_dBase_dBytes.v_Vuna_dCompiler_dBase_dBytes_dencTag 1) mc1)
  | Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dRig_Rig0 -> ((Vuna_dCompiler_dBase_dBytes.v_Vuna_dCompiler_dBase_dBytes_dencTag 0) mc1)
  | _ -> failwith "DT: impossible branch"
))

# 52 "Vuna/Compiler/Core/Canonical.vuna"
let v_Vuna_dCompiler_dCore_dCanonical_dencBinder = (fun mc0 mc1 -> (match mc0 with
  | { Base_dData_dPair.f_Base_dData_dPair_dPair_first = dtb__0; Base_dData_dPair.f_Base_dData_dPair_dPair_second = dtb__1 } -> ((Vuna_dCompiler_dBase_dBytes.v_Vuna_dCompiler_dBase_dBytes_dencStr dtb__0) ((v_Vuna_dCompiler_dCore_dCanonical_dencRig dtb__1) mc1))
  | _ -> failwith "DT: impossible branch"
))

# 56 "Vuna/Compiler/Core/Canonical.vuna"
let v_Vuna_dCompiler_dCore_dCanonical_dencBinders = (fun bs acc -> (((Vuna_dCompiler_dBase_dBytes.v_Vuna_dCompiler_dBase_dBytes_dencList v_Vuna_dCompiler_dCore_dCanonical_dencBinder) bs) acc))

# 73 "Vuna/Compiler/Core/Canonical.vuna"
let v_Vuna_dCompiler_dCore_dCanonical_dencInts = (fun xs acc -> (((Vuna_dCompiler_dBase_dBytes.v_Vuna_dCompiler_dBase_dBytes_dencList Vuna_dCompiler_dBase_dBytes.v_Vuna_dCompiler_dBase_dBytes_dencInt) xs) acc))

# 39 "Vuna/Compiler/Core/Canonical.vuna"
let rec v_Vuna_dCompiler_dCore_dCanonical_dencArg = (fun mc0 mc1 -> (match mc0 with
  | { Base_dData_dPair.f_Base_dData_dPair_dPair_first = dtb__2; Base_dData_dPair.f_Base_dData_dPair_dPair_second = dtb__3 } -> ((v_Vuna_dCompiler_dCore_dCanonical_dencTerm dtb__2) ((v_Vuna_dCompiler_dCore_dCanonical_dencRig dtb__3) mc1))
  | _ -> failwith "DT: impossible branch"
))
# 43 "Vuna/Compiler/Core/Canonical.vuna"
and v_Vuna_dCompiler_dCore_dCanonical_dencArgs = (fun xs acc -> (Base_dData_dList.C_Base_dData_dList_dList__x58__x58_ ((String.concat "" ["["; (bi_strFromInt (Vuna_dCompiler_dBase_dBytes.v_Vuna_dCompiler_dBase_dBytes_dlenOf xs)); ":"]), ((v_Vuna_dCompiler_dCore_dCanonical_dencArgsGo xs) acc))))
# 47 "Vuna/Compiler/Core/Canonical.vuna"
and v_Vuna_dCompiler_dCore_dCanonical_dencArgsGo = (fun mc0 mc1 -> (match mc0 with
  | Base_dData_dList.C_Base_dData_dList_dList__x58__x58_ (dtb__4, dtb__5) -> ((v_Vuna_dCompiler_dCore_dCanonical_dencArg dtb__4) ((v_Vuna_dCompiler_dCore_dCanonical_dencArgsGo dtb__5) mc1))
  | Base_dData_dList.C_Base_dData_dList_dList_Nil -> mc1
  | _ -> failwith "DT: impossible branch"
))
# 60 "Vuna/Compiler/Core/Canonical.vuna"
and v_Vuna_dCompiler_dCore_dCanonical_dencAlt = (fun mc0 mc1 -> (match mc0 with
  | { Vuna_dCompiler_dCore_dTerm.f_Vuna_dCompiler_dCore_dTerm_dCaseAlt_caseAltName = dtb__6; Vuna_dCompiler_dCore_dTerm.f_Vuna_dCompiler_dCore_dTerm_dCaseAlt_caseAltBinders = dtb__7; Vuna_dCompiler_dCore_dTerm.f_Vuna_dCompiler_dCore_dTerm_dCaseAlt_caseAltBody = dtb__8 } -> ((Vuna_dCompiler_dBase_dBytes.v_Vuna_dCompiler_dBase_dBytes_dencStr dtb__6) ((v_Vuna_dCompiler_dCore_dCanonical_dencBinders (Vuna_dCompiler_dCore_dTerm.v_Vuna_dCompiler_dCore_dTerm_dbinderPairs dtb__7)) ((v_Vuna_dCompiler_dCore_dCanonical_dencTerm dtb__8) mc1)))
  | _ -> failwith "DT: impossible branch"
))
# 64 "Vuna/Compiler/Core/Canonical.vuna"
and v_Vuna_dCompiler_dCore_dCanonical_dencAlts = (fun xs acc -> (Base_dData_dList.C_Base_dData_dList_dList__x58__x58_ ((String.concat "" ["["; (bi_strFromInt (Vuna_dCompiler_dBase_dBytes.v_Vuna_dCompiler_dBase_dBytes_dlenOf xs)); ":"]), ((v_Vuna_dCompiler_dCore_dCanonical_dencAltsGo xs) acc))))
# 68 "Vuna/Compiler/Core/Canonical.vuna"
and v_Vuna_dCompiler_dCore_dCanonical_dencAltsGo = (fun mc0 mc1 -> (match mc0 with
  | Base_dData_dList.C_Base_dData_dList_dList__x58__x58_ (dtb__9, dtb__10) -> ((v_Vuna_dCompiler_dCore_dCanonical_dencAlt dtb__9) ((v_Vuna_dCompiler_dCore_dCanonical_dencAltsGo dtb__10) mc1))
  | Base_dData_dList.C_Base_dData_dList_dList_Nil -> mc1
  | _ -> failwith "DT: impossible branch"
))
# 77 "Vuna/Compiler/Core/Canonical.vuna"
and v_Vuna_dCompiler_dCore_dCanonical_dencTerm = (fun mc0 mc1 -> (match mc0 with
  | Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dTerm_TRecord (dtb__11, dtb__12) -> ((Vuna_dCompiler_dBase_dBytes.v_Vuna_dCompiler_dBase_dBytes_dencTag 17) ((Vuna_dCompiler_dBase_dBytes.v_Vuna_dCompiler_dBase_dBytes_dencStr dtb__11) ((v_Vuna_dCompiler_dCore_dCanonical_dencArgs dtb__12) mc1)))
  | Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dTerm_TFloat (dtb__13) -> ((Vuna_dCompiler_dBase_dBytes.v_Vuna_dCompiler_dBase_dBytes_dencTag 16) ((Vuna_dCompiler_dBase_dBytes.v_Vuna_dCompiler_dBase_dBytes_dencStr dtb__13) mc1))
  | Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dTerm_TIf (dtb__14, dtb__15, dtb__16) -> ((Vuna_dCompiler_dBase_dBytes.v_Vuna_dCompiler_dBase_dBytes_dencTag 15) ((v_Vuna_dCompiler_dCore_dCanonical_dencTerm dtb__14) ((v_Vuna_dCompiler_dCore_dCanonical_dencTerm dtb__15) ((v_Vuna_dCompiler_dCore_dCanonical_dencTerm dtb__16) mc1))))
  | Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dTerm_TBool (dtb__17) -> ((Vuna_dCompiler_dBase_dBytes.v_Vuna_dCompiler_dBase_dBytes_dencTag 14) ((Vuna_dCompiler_dBase_dBytes.v_Vuna_dCompiler_dBase_dBytes_dencBool dtb__17) mc1))
  | Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dTerm_TStr (dtb__18) -> ((Vuna_dCompiler_dBase_dBytes.v_Vuna_dCompiler_dBase_dBytes_dencTag 13) ((Vuna_dCompiler_dBase_dBytes.v_Vuna_dCompiler_dBase_dBytes_dencStr dtb__18) mc1))
  | Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dTerm_TInt (dtb__19) -> ((Vuna_dCompiler_dBase_dBytes.v_Vuna_dCompiler_dBase_dBytes_dencTag 12) ((Vuna_dCompiler_dBase_dBytes.v_Vuna_dCompiler_dBase_dBytes_dencInt dtb__19) mc1))
  | Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dTerm_TRecUpd (dtb__20, dtb__21, dtb__22, dtb__23, dtb__24) -> ((Vuna_dCompiler_dBase_dBytes.v_Vuna_dCompiler_dBase_dBytes_dencTag 11) ((v_Vuna_dCompiler_dCore_dCanonical_dencTerm dtb__20) ((Vuna_dCompiler_dBase_dBytes.v_Vuna_dCompiler_dBase_dBytes_dencStr dtb__21) ((v_Vuna_dCompiler_dCore_dCanonical_dencBinders dtb__22) ((v_Vuna_dCompiler_dCore_dCanonical_dencInts dtb__23) ((v_Vuna_dCompiler_dCore_dCanonical_dencTerm dtb__24) mc1))))))
  | Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dTerm_TProj (dtb__25, dtb__26, dtb__27, dtb__28, dtb__29) -> ((Vuna_dCompiler_dBase_dBytes.v_Vuna_dCompiler_dBase_dBytes_dencTag 10) ((v_Vuna_dCompiler_dCore_dCanonical_dencTerm dtb__25) ((Vuna_dCompiler_dBase_dBytes.v_Vuna_dCompiler_dBase_dBytes_dencStr dtb__26) ((v_Vuna_dCompiler_dCore_dCanonical_dencBinders dtb__27) ((Vuna_dCompiler_dBase_dBytes.v_Vuna_dCompiler_dBase_dBytes_dencInt dtb__28) ((Vuna_dCompiler_dBase_dBytes.v_Vuna_dCompiler_dBase_dBytes_dencInt dtb__29) mc1))))))
  | Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dTerm_TCase (dtb__30, dtb__31) -> ((Vuna_dCompiler_dBase_dBytes.v_Vuna_dCompiler_dBase_dBytes_dencTag 9) ((v_Vuna_dCompiler_dCore_dCanonical_dencTerm dtb__30) ((v_Vuna_dCompiler_dCore_dCanonical_dencAlts dtb__31) mc1)))
  | Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dTerm_TMk (dtb__32, dtb__33) -> ((Vuna_dCompiler_dBase_dBytes.v_Vuna_dCompiler_dBase_dBytes_dencTag 8) ((Vuna_dCompiler_dBase_dBytes.v_Vuna_dCompiler_dBase_dBytes_dencStr dtb__32) ((v_Vuna_dCompiler_dCore_dCanonical_dencArgs dtb__33) mc1)))
  | Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dTerm_TCon (dtb__34, dtb__35) -> ((Vuna_dCompiler_dBase_dBytes.v_Vuna_dCompiler_dBase_dBytes_dencTag 7) ((Vuna_dCompiler_dBase_dBytes.v_Vuna_dCompiler_dBase_dBytes_dencStr dtb__34) ((v_Vuna_dCompiler_dCore_dCanonical_dencArgs dtb__35) mc1)))
  | Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dTerm_TApp (dtb__36, dtb__37, dtb__38) -> ((Vuna_dCompiler_dBase_dBytes.v_Vuna_dCompiler_dBase_dBytes_dencTag 6) ((v_Vuna_dCompiler_dCore_dCanonical_dencTerm dtb__36) ((v_Vuna_dCompiler_dCore_dCanonical_dencTerm dtb__37) ((v_Vuna_dCompiler_dCore_dCanonical_dencRig dtb__38) mc1))))
  | Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dTerm_TLam (dtb__39, dtb__40, dtb__41, dtb__42) -> ((Vuna_dCompiler_dBase_dBytes.v_Vuna_dCompiler_dBase_dBytes_dencTag 5) ((Vuna_dCompiler_dBase_dBytes.v_Vuna_dCompiler_dBase_dBytes_dencStr dtb__39) ((v_Vuna_dCompiler_dCore_dCanonical_dencRig dtb__40) ((v_Vuna_dCompiler_dCore_dCanonical_dencTerm dtb__42) mc1))))
  | Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dTerm_TPi (dtb__43, dtb__44, dtb__45, dtb__46, dtb__47) -> ((Vuna_dCompiler_dBase_dBytes.v_Vuna_dCompiler_dBase_dBytes_dencTag 4) ((Vuna_dCompiler_dBase_dBytes.v_Vuna_dCompiler_dBase_dBytes_dencStr dtb__43) ((Vuna_dCompiler_dBase_dBytes.v_Vuna_dCompiler_dBase_dBytes_dencBool dtb__44) ((v_Vuna_dCompiler_dCore_dCanonical_dencRig dtb__45) ((v_Vuna_dCompiler_dCore_dCanonical_dencTerm dtb__46) ((v_Vuna_dCompiler_dCore_dCanonical_dencTerm dtb__47) mc1))))))
  | Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dTerm_TType (dtb__48) -> ((Vuna_dCompiler_dBase_dBytes.v_Vuna_dCompiler_dBase_dBytes_dencTag 3) ((Vuna_dCompiler_dBase_dBytes.v_Vuna_dCompiler_dBase_dBytes_dencInt (Vuna_dCompiler_dCore_dTerm.v_Vuna_dCompiler_dCore_dTerm_dlevelToInt dtb__48)) mc1))
  | Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dTerm_TGlobal (dtb__49) -> ((Vuna_dCompiler_dBase_dBytes.v_Vuna_dCompiler_dBase_dBytes_dencTag 2) ((Vuna_dCompiler_dBase_dBytes.v_Vuna_dCompiler_dBase_dBytes_dencStr dtb__49) mc1))
  | Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dTerm_TMeta (dtb__50) -> ((Vuna_dCompiler_dBase_dBytes.v_Vuna_dCompiler_dBase_dBytes_dencTag 1) ((Vuna_dCompiler_dBase_dBytes.v_Vuna_dCompiler_dBase_dBytes_dencInt dtb__50) mc1))
  | Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dTerm_TVar (dtb__51, dtb__52, dtb__53) -> ((Vuna_dCompiler_dBase_dBytes.v_Vuna_dCompiler_dBase_dBytes_dencTag 0) ((Vuna_dCompiler_dBase_dBytes.v_Vuna_dCompiler_dBase_dBytes_dencStr dtb__51) ((Vuna_dCompiler_dBase_dBytes.v_Vuna_dCompiler_dBase_dBytes_dencInt dtb__52) mc1)))
  | _ -> failwith "DT: impossible branch"
))

# 100 "Vuna/Compiler/Core/Canonical.vuna"
let v_Vuna_dCompiler_dCore_dCanonical_dencTermBytes = (fun t -> ((Vuna_dCompiler_dBase_dBytes.v_Vuna_dCompiler_dBase_dBytes_dencTop v_Vuna_dCompiler_dCore_dCanonical_dencTerm) t))

# 108 "Vuna/Compiler/Core/Canonical.vuna"
let v_Vuna_dCompiler_dCore_dCanonical_ddecRig = (fun fuel bytes -> (if (fuel <= 0) then Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Nothing else ((fun nd_uscrut2 -> (match nd_uscrut2 with
  | Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Just (dtb__54) -> (match dtb__54 with
  | { Base_dData_dPair.f_Base_dData_dPair_dPair_first = dtb__55; Base_dData_dPair.f_Base_dData_dPair_dPair_second = dtb__56 } -> (if (dtb__55 = 0) then (Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Just ({ Base_dData_dPair.f_Base_dData_dPair_dPair_first = Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dRig_Rig0; Base_dData_dPair.f_Base_dData_dPair_dPair_second = dtb__56 })) else (if (dtb__55 = 1) then (Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Just ({ Base_dData_dPair.f_Base_dData_dPair_dPair_first = Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dRig_Rig1; Base_dData_dPair.f_Base_dData_dPair_dPair_second = dtb__56 })) else (if (dtb__55 = 2) then (Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Just ({ Base_dData_dPair.f_Base_dData_dPair_dPair_first = Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dRig_RigOmega; Base_dData_dPair.f_Base_dData_dPair_dPair_second = dtb__56 })) else Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Nothing)))
  | _ -> failwith "DT: impossible branch"
)
  | Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Nothing -> Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Nothing
  | _ -> failwith "DT: impossible branch"
)) ((Vuna_dCompiler_dBase_dBytes.v_Vuna_dCompiler_dBase_dBytes_ddecTag fuel) bytes))))

# 128 "Vuna/Compiler/Core/Canonical.vuna"
let v_Vuna_dCompiler_dCore_dCanonical_ddecBinder = (fun fuel bytes -> (if (fuel <= 0) then Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Nothing else ((fun nd_uscrut2 -> (match nd_uscrut2 with
  | Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Just (dtb__57) -> (match dtb__57 with
  | { Base_dData_dPair.f_Base_dData_dPair_dPair_first = dtb__58; Base_dData_dPair.f_Base_dData_dPair_dPair_second = dtb__59 } -> ((fun nd_uscrut9 -> (match nd_uscrut9 with
  | Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Just (dtb__60) -> (match dtb__60 with
  | { Base_dData_dPair.f_Base_dData_dPair_dPair_first = dtb__61; Base_dData_dPair.f_Base_dData_dPair_dPair_second = dtb__62 } -> (Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Just ({ Base_dData_dPair.f_Base_dData_dPair_dPair_first = { Base_dData_dPair.f_Base_dData_dPair_dPair_first = dtb__58; Base_dData_dPair.f_Base_dData_dPair_dPair_second = dtb__61 }; Base_dData_dPair.f_Base_dData_dPair_dPair_second = dtb__62 }))
  | _ -> failwith "DT: impossible branch"
)
  | Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Nothing -> Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Nothing
  | _ -> failwith "DT: impossible branch"
)) ((v_Vuna_dCompiler_dCore_dCanonical_ddecRig (fuel - 1)) dtb__59))
  | _ -> failwith "DT: impossible branch"
)
  | Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Nothing -> Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Nothing
  | _ -> failwith "DT: impossible branch"
)) ((Vuna_dCompiler_dBase_dBytes.v_Vuna_dCompiler_dBase_dBytes_ddecStr (fuel - 1)) bytes))))

# 119 "Vuna/Compiler/Core/Canonical.vuna"
let rec v_Vuna_dCompiler_dCore_dCanonical_ddecArg = (fun fuel bytes -> (if (fuel <= 0) then Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Nothing else ((fun nd_uscrut2 -> (match nd_uscrut2 with
  | Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Just (dtb__63) -> (match dtb__63 with
  | { Base_dData_dPair.f_Base_dData_dPair_dPair_first = dtb__64; Base_dData_dPair.f_Base_dData_dPair_dPair_second = dtb__65 } -> ((fun nd_uscrut9 -> (match nd_uscrut9 with
  | Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Just (dtb__66) -> (match dtb__66 with
  | { Base_dData_dPair.f_Base_dData_dPair_dPair_first = dtb__67; Base_dData_dPair.f_Base_dData_dPair_dPair_second = dtb__68 } -> (Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Just ({ Base_dData_dPair.f_Base_dData_dPair_dPair_first = { Base_dData_dPair.f_Base_dData_dPair_dPair_first = dtb__64; Base_dData_dPair.f_Base_dData_dPair_dPair_second = dtb__67 }; Base_dData_dPair.f_Base_dData_dPair_dPair_second = dtb__68 }))
  | _ -> failwith "DT: impossible branch"
)
  | Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Nothing -> Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Nothing
  | _ -> failwith "DT: impossible branch"
)) ((v_Vuna_dCompiler_dCore_dCanonical_ddecRig (fuel - 1)) dtb__65))
  | _ -> failwith "DT: impossible branch"
)
  | Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Nothing -> Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Nothing
  | _ -> failwith "DT: impossible branch"
)) ((v_Vuna_dCompiler_dCore_dCanonical_ddecTerm (fuel - 1)) bytes))))
# 137 "Vuna/Compiler/Core/Canonical.vuna"
and v_Vuna_dCompiler_dCore_dCanonical_ddecAlt = (fun fuel bytes -> (if (fuel <= 0) then Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Nothing else ((fun nd_uscrut2 -> (match nd_uscrut2 with
  | Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Just (dtb__69) -> (match dtb__69 with
  | { Base_dData_dPair.f_Base_dData_dPair_dPair_first = dtb__70; Base_dData_dPair.f_Base_dData_dPair_dPair_second = dtb__71 } -> ((fun nd_uscrut9 -> (match nd_uscrut9 with
  | Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Just (dtb__72) -> (match dtb__72 with
  | { Base_dData_dPair.f_Base_dData_dPair_dPair_first = dtb__73; Base_dData_dPair.f_Base_dData_dPair_dPair_second = dtb__74 } -> ((fun nd_uscrut16 -> (match nd_uscrut16 with
  | Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Just (dtb__75) -> (match dtb__75 with
  | { Base_dData_dPair.f_Base_dData_dPair_dPair_first = dtb__76; Base_dData_dPair.f_Base_dData_dPair_dPair_second = dtb__77 } -> (Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Just ({ Base_dData_dPair.f_Base_dData_dPair_dPair_first = { Vuna_dCompiler_dCore_dTerm.f_Vuna_dCompiler_dCore_dTerm_dCaseAlt_caseAltName = dtb__70; Vuna_dCompiler_dCore_dTerm.f_Vuna_dCompiler_dCore_dTerm_dCaseAlt_caseAltBinders = (Vuna_dCompiler_dCore_dTerm.v_Vuna_dCompiler_dCore_dTerm_dbindersOfPairs dtb__73); Vuna_dCompiler_dCore_dTerm.f_Vuna_dCompiler_dCore_dTerm_dCaseAlt_caseAltBody = dtb__76 }; Base_dData_dPair.f_Base_dData_dPair_dPair_second = dtb__77 }))
  | _ -> failwith "DT: impossible branch"
)
  | Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Nothing -> Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Nothing
  | _ -> failwith "DT: impossible branch"
)) ((v_Vuna_dCompiler_dCore_dCanonical_ddecTerm (fuel - 1)) dtb__74))
  | _ -> failwith "DT: impossible branch"
)
  | Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Nothing -> Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Nothing
  | _ -> failwith "DT: impossible branch"
)) (((Vuna_dCompiler_dBase_dBytes.v_Vuna_dCompiler_dBase_dBytes_ddecList v_Vuna_dCompiler_dCore_dCanonical_ddecBinder) (fuel - 1)) dtb__71))
  | _ -> failwith "DT: impossible branch"
)
  | Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Nothing -> Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Nothing
  | _ -> failwith "DT: impossible branch"
)) ((Vuna_dCompiler_dBase_dBytes.v_Vuna_dCompiler_dBase_dBytes_ddecStr (fuel - 1)) bytes))))
# 148 "Vuna/Compiler/Core/Canonical.vuna"
and v_Vuna_dCompiler_dCore_dCanonical_ddecTerm = (fun fuel bytes -> (if (fuel <= 0) then Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Nothing else ((fun nd_uscrut2 -> (match nd_uscrut2 with
  | Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Just (dtb__78) -> (match dtb__78 with
  | { Base_dData_dPair.f_Base_dData_dPair_dPair_first = dtb__79; Base_dData_dPair.f_Base_dData_dPair_dPair_second = dtb__80 } -> (if (dtb__79 = 0) then ((fun nd_uscrut9 -> (match nd_uscrut9 with
  | Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Just (dtb__81) -> (match dtb__81 with
  | { Base_dData_dPair.f_Base_dData_dPair_dPair_first = dtb__82; Base_dData_dPair.f_Base_dData_dPair_dPair_second = dtb__83 } -> ((fun nd_uscrut16 -> (match nd_uscrut16 with
  | Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Just (dtb__84) -> (match dtb__84 with
  | { Base_dData_dPair.f_Base_dData_dPair_dPair_first = dtb__85; Base_dData_dPair.f_Base_dData_dPair_dPair_second = dtb__86 } -> (Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Just ({ Base_dData_dPair.f_Base_dData_dPair_dPair_first = (Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dTerm_TVar (dtb__82, dtb__85, v_Vuna_dCompiler_dCore_dCanonical_dnoSpan)); Base_dData_dPair.f_Base_dData_dPair_dPair_second = dtb__86 }))
  | _ -> failwith "DT: impossible branch"
)
  | Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Nothing -> Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Nothing
  | _ -> failwith "DT: impossible branch"
)) ((Vuna_dCompiler_dBase_dBytes.v_Vuna_dCompiler_dBase_dBytes_ddecInt (fuel - 1)) dtb__83))
  | _ -> failwith "DT: impossible branch"
)
  | Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Nothing -> Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Nothing
  | _ -> failwith "DT: impossible branch"
)) ((Vuna_dCompiler_dBase_dBytes.v_Vuna_dCompiler_dBase_dBytes_ddecStr (fuel - 1)) dtb__80)) else (if (dtb__79 = 1) then ((fun nd_uscrut9 -> (match nd_uscrut9 with
  | Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Just (dtb__87) -> (match dtb__87 with
  | { Base_dData_dPair.f_Base_dData_dPair_dPair_first = dtb__88; Base_dData_dPair.f_Base_dData_dPair_dPair_second = dtb__89 } -> (Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Just ({ Base_dData_dPair.f_Base_dData_dPair_dPair_first = (Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dTerm_TMeta (dtb__88)); Base_dData_dPair.f_Base_dData_dPair_dPair_second = dtb__89 }))
  | _ -> failwith "DT: impossible branch"
)
  | Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Nothing -> Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Nothing
  | _ -> failwith "DT: impossible branch"
)) ((Vuna_dCompiler_dBase_dBytes.v_Vuna_dCompiler_dBase_dBytes_ddecInt (fuel - 1)) dtb__80)) else (if (dtb__79 = 2) then ((fun nd_uscrut9 -> (match nd_uscrut9 with
  | Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Just (dtb__90) -> (match dtb__90 with
  | { Base_dData_dPair.f_Base_dData_dPair_dPair_first = dtb__91; Base_dData_dPair.f_Base_dData_dPair_dPair_second = dtb__92 } -> (Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Just ({ Base_dData_dPair.f_Base_dData_dPair_dPair_first = (Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dTerm_TGlobal (dtb__91)); Base_dData_dPair.f_Base_dData_dPair_dPair_second = dtb__92 }))
  | _ -> failwith "DT: impossible branch"
)
  | Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Nothing -> Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Nothing
  | _ -> failwith "DT: impossible branch"
)) ((Vuna_dCompiler_dBase_dBytes.v_Vuna_dCompiler_dBase_dBytes_ddecStr (fuel - 1)) dtb__80)) else (if (dtb__79 = 3) then ((fun nd_uscrut9 -> (match nd_uscrut9 with
  | Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Just (dtb__93) -> (match dtb__93 with
  | { Base_dData_dPair.f_Base_dData_dPair_dPair_first = dtb__94; Base_dData_dPair.f_Base_dData_dPair_dPair_second = dtb__95 } -> (Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Just ({ Base_dData_dPair.f_Base_dData_dPair_dPair_first = (Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dTerm_TType ((Vuna_dCompiler_dCore_dTerm.v_Vuna_dCompiler_dCore_dTerm_dlevelOfInt dtb__94))); Base_dData_dPair.f_Base_dData_dPair_dPair_second = dtb__95 }))
  | _ -> failwith "DT: impossible branch"
)
  | Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Nothing -> Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Nothing
  | _ -> failwith "DT: impossible branch"
)) ((Vuna_dCompiler_dBase_dBytes.v_Vuna_dCompiler_dBase_dBytes_ddecInt (fuel - 1)) dtb__80)) else (if (dtb__79 = 4) then ((fun nd_uscrut9 -> (match nd_uscrut9 with
  | Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Just (dtb__96) -> (match dtb__96 with
  | { Base_dData_dPair.f_Base_dData_dPair_dPair_first = dtb__97; Base_dData_dPair.f_Base_dData_dPair_dPair_second = dtb__98 } -> ((fun nd_uscrut16 -> (match nd_uscrut16 with
  | Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Just (dtb__99) -> (match dtb__99 with
  | { Base_dData_dPair.f_Base_dData_dPair_dPair_first = dtb__100; Base_dData_dPair.f_Base_dData_dPair_dPair_second = dtb__101 } -> ((fun nd_uscrut23 -> (match nd_uscrut23 with
  | Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Just (dtb__102) -> (match dtb__102 with
  | { Base_dData_dPair.f_Base_dData_dPair_dPair_first = dtb__103; Base_dData_dPair.f_Base_dData_dPair_dPair_second = dtb__104 } -> ((fun nd_uscrut30 -> (match nd_uscrut30 with
  | Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Just (dtb__105) -> (match dtb__105 with
  | { Base_dData_dPair.f_Base_dData_dPair_dPair_first = dtb__106; Base_dData_dPair.f_Base_dData_dPair_dPair_second = dtb__107 } -> ((fun nd_uscrut37 -> (match nd_uscrut37 with
  | Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Just (dtb__108) -> (match dtb__108 with
  | { Base_dData_dPair.f_Base_dData_dPair_dPair_first = dtb__109; Base_dData_dPair.f_Base_dData_dPair_dPair_second = dtb__110 } -> (Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Just ({ Base_dData_dPair.f_Base_dData_dPair_dPair_first = (Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dTerm_TPi (dtb__97, dtb__100, dtb__103, dtb__106, dtb__109)); Base_dData_dPair.f_Base_dData_dPair_dPair_second = dtb__110 }))
  | _ -> failwith "DT: impossible branch"
)
  | Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Nothing -> Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Nothing
  | _ -> failwith "DT: impossible branch"
)) ((v_Vuna_dCompiler_dCore_dCanonical_ddecTerm (fuel - 1)) dtb__107))
  | _ -> failwith "DT: impossible branch"
)
  | Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Nothing -> Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Nothing
  | _ -> failwith "DT: impossible branch"
)) ((v_Vuna_dCompiler_dCore_dCanonical_ddecTerm (fuel - 1)) dtb__104))
  | _ -> failwith "DT: impossible branch"
)
  | Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Nothing -> Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Nothing
  | _ -> failwith "DT: impossible branch"
)) ((v_Vuna_dCompiler_dCore_dCanonical_ddecRig (fuel - 1)) dtb__101))
  | _ -> failwith "DT: impossible branch"
)
  | Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Nothing -> Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Nothing
  | _ -> failwith "DT: impossible branch"
)) ((Vuna_dCompiler_dBase_dBytes.v_Vuna_dCompiler_dBase_dBytes_ddecBool (fuel - 1)) dtb__98))
  | _ -> failwith "DT: impossible branch"
)
  | Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Nothing -> Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Nothing
  | _ -> failwith "DT: impossible branch"
)) ((Vuna_dCompiler_dBase_dBytes.v_Vuna_dCompiler_dBase_dBytes_ddecStr (fuel - 1)) dtb__80)) else (if (dtb__79 = 5) then ((fun nd_uscrut9 -> (match nd_uscrut9 with
  | Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Just (dtb__111) -> (match dtb__111 with
  | { Base_dData_dPair.f_Base_dData_dPair_dPair_first = dtb__112; Base_dData_dPair.f_Base_dData_dPair_dPair_second = dtb__113 } -> ((fun nd_uscrut16 -> (match nd_uscrut16 with
  | Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Just (dtb__114) -> (match dtb__114 with
  | { Base_dData_dPair.f_Base_dData_dPair_dPair_first = dtb__115; Base_dData_dPair.f_Base_dData_dPair_dPair_second = dtb__116 } -> ((fun nd_uscrut23 -> (match nd_uscrut23 with
  | Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Just (dtb__117) -> (match dtb__117 with
  | { Base_dData_dPair.f_Base_dData_dPair_dPair_first = dtb__118; Base_dData_dPair.f_Base_dData_dPair_dPair_second = dtb__119 } -> (Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Just ({ Base_dData_dPair.f_Base_dData_dPair_dPair_first = (Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dTerm_TLam (dtb__112, dtb__115, v_Vuna_dCompiler_dCore_dCanonical_dnoSpan, dtb__118)); Base_dData_dPair.f_Base_dData_dPair_dPair_second = dtb__119 }))
  | _ -> failwith "DT: impossible branch"
)
  | Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Nothing -> Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Nothing
  | _ -> failwith "DT: impossible branch"
)) ((v_Vuna_dCompiler_dCore_dCanonical_ddecTerm (fuel - 1)) dtb__116))
  | _ -> failwith "DT: impossible branch"
)
  | Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Nothing -> Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Nothing
  | _ -> failwith "DT: impossible branch"
)) ((v_Vuna_dCompiler_dCore_dCanonical_ddecRig (fuel - 1)) dtb__113))
  | _ -> failwith "DT: impossible branch"
)
  | Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Nothing -> Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Nothing
  | _ -> failwith "DT: impossible branch"
)) ((Vuna_dCompiler_dBase_dBytes.v_Vuna_dCompiler_dBase_dBytes_ddecStr (fuel - 1)) dtb__80)) else (if (dtb__79 = 6) then ((fun nd_uscrut9 -> (match nd_uscrut9 with
  | Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Just (dtb__120) -> (match dtb__120 with
  | { Base_dData_dPair.f_Base_dData_dPair_dPair_first = dtb__121; Base_dData_dPair.f_Base_dData_dPair_dPair_second = dtb__122 } -> ((fun nd_uscrut16 -> (match nd_uscrut16 with
  | Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Just (dtb__123) -> (match dtb__123 with
  | { Base_dData_dPair.f_Base_dData_dPair_dPair_first = dtb__124; Base_dData_dPair.f_Base_dData_dPair_dPair_second = dtb__125 } -> ((fun nd_uscrut23 -> (match nd_uscrut23 with
  | Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Just (dtb__126) -> (match dtb__126 with
  | { Base_dData_dPair.f_Base_dData_dPair_dPair_first = dtb__127; Base_dData_dPair.f_Base_dData_dPair_dPair_second = dtb__128 } -> (Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Just ({ Base_dData_dPair.f_Base_dData_dPair_dPair_first = (Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dTerm_TApp (dtb__121, dtb__124, dtb__127)); Base_dData_dPair.f_Base_dData_dPair_dPair_second = dtb__128 }))
  | _ -> failwith "DT: impossible branch"
)
  | Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Nothing -> Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Nothing
  | _ -> failwith "DT: impossible branch"
)) ((v_Vuna_dCompiler_dCore_dCanonical_ddecRig (fuel - 1)) dtb__125))
  | _ -> failwith "DT: impossible branch"
)
  | Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Nothing -> Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Nothing
  | _ -> failwith "DT: impossible branch"
)) ((v_Vuna_dCompiler_dCore_dCanonical_ddecTerm (fuel - 1)) dtb__122))
  | _ -> failwith "DT: impossible branch"
)
  | Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Nothing -> Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Nothing
  | _ -> failwith "DT: impossible branch"
)) ((v_Vuna_dCompiler_dCore_dCanonical_ddecTerm (fuel - 1)) dtb__80)) else (if (dtb__79 = 7) then ((fun nd_uscrut9 -> (match nd_uscrut9 with
  | Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Just (dtb__129) -> (match dtb__129 with
  | { Base_dData_dPair.f_Base_dData_dPair_dPair_first = dtb__130; Base_dData_dPair.f_Base_dData_dPair_dPair_second = dtb__131 } -> ((fun nd_uscrut16 -> (match nd_uscrut16 with
  | Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Just (dtb__132) -> (match dtb__132 with
  | { Base_dData_dPair.f_Base_dData_dPair_dPair_first = dtb__133; Base_dData_dPair.f_Base_dData_dPair_dPair_second = dtb__134 } -> (Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Just ({ Base_dData_dPair.f_Base_dData_dPair_dPair_first = (Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dTerm_TCon (dtb__130, dtb__133)); Base_dData_dPair.f_Base_dData_dPair_dPair_second = dtb__134 }))
  | _ -> failwith "DT: impossible branch"
)
  | Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Nothing -> Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Nothing
  | _ -> failwith "DT: impossible branch"
)) (((Vuna_dCompiler_dBase_dBytes.v_Vuna_dCompiler_dBase_dBytes_ddecList v_Vuna_dCompiler_dCore_dCanonical_ddecArg) (fuel - 1)) dtb__131))
  | _ -> failwith "DT: impossible branch"
)
  | Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Nothing -> Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Nothing
  | _ -> failwith "DT: impossible branch"
)) ((Vuna_dCompiler_dBase_dBytes.v_Vuna_dCompiler_dBase_dBytes_ddecStr (fuel - 1)) dtb__80)) else (if (dtb__79 = 8) then ((fun nd_uscrut9 -> (match nd_uscrut9 with
  | Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Just (dtb__135) -> (match dtb__135 with
  | { Base_dData_dPair.f_Base_dData_dPair_dPair_first = dtb__136; Base_dData_dPair.f_Base_dData_dPair_dPair_second = dtb__137 } -> ((fun nd_uscrut16 -> (match nd_uscrut16 with
  | Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Just (dtb__138) -> (match dtb__138 with
  | { Base_dData_dPair.f_Base_dData_dPair_dPair_first = dtb__139; Base_dData_dPair.f_Base_dData_dPair_dPair_second = dtb__140 } -> (Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Just ({ Base_dData_dPair.f_Base_dData_dPair_dPair_first = (Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dTerm_TMk (dtb__136, dtb__139)); Base_dData_dPair.f_Base_dData_dPair_dPair_second = dtb__140 }))
  | _ -> failwith "DT: impossible branch"
)
  | Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Nothing -> Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Nothing
  | _ -> failwith "DT: impossible branch"
)) (((Vuna_dCompiler_dBase_dBytes.v_Vuna_dCompiler_dBase_dBytes_ddecList v_Vuna_dCompiler_dCore_dCanonical_ddecArg) (fuel - 1)) dtb__137))
  | _ -> failwith "DT: impossible branch"
)
  | Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Nothing -> Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Nothing
  | _ -> failwith "DT: impossible branch"
)) ((Vuna_dCompiler_dBase_dBytes.v_Vuna_dCompiler_dBase_dBytes_ddecStr (fuel - 1)) dtb__80)) else (if (dtb__79 = 9) then ((fun nd_uscrut9 -> (match nd_uscrut9 with
  | Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Just (dtb__141) -> (match dtb__141 with
  | { Base_dData_dPair.f_Base_dData_dPair_dPair_first = dtb__142; Base_dData_dPair.f_Base_dData_dPair_dPair_second = dtb__143 } -> ((fun nd_uscrut16 -> (match nd_uscrut16 with
  | Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Just (dtb__144) -> (match dtb__144 with
  | { Base_dData_dPair.f_Base_dData_dPair_dPair_first = dtb__145; Base_dData_dPair.f_Base_dData_dPair_dPair_second = dtb__146 } -> (Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Just ({ Base_dData_dPair.f_Base_dData_dPair_dPair_first = (Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dTerm_TCase (dtb__142, dtb__145)); Base_dData_dPair.f_Base_dData_dPair_dPair_second = dtb__146 }))
  | _ -> failwith "DT: impossible branch"
)
  | Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Nothing -> Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Nothing
  | _ -> failwith "DT: impossible branch"
)) (((Vuna_dCompiler_dBase_dBytes.v_Vuna_dCompiler_dBase_dBytes_ddecList v_Vuna_dCompiler_dCore_dCanonical_ddecAlt) (fuel - 1)) dtb__143))
  | _ -> failwith "DT: impossible branch"
)
  | Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Nothing -> Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Nothing
  | _ -> failwith "DT: impossible branch"
)) ((v_Vuna_dCompiler_dCore_dCanonical_ddecTerm (fuel - 1)) dtb__80)) else (if (dtb__79 = 10) then ((fun nd_uscrut9 -> (match nd_uscrut9 with
  | Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Just (dtb__147) -> (match dtb__147 with
  | { Base_dData_dPair.f_Base_dData_dPair_dPair_first = dtb__148; Base_dData_dPair.f_Base_dData_dPair_dPair_second = dtb__149 } -> ((fun nd_uscrut16 -> (match nd_uscrut16 with
  | Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Just (dtb__150) -> (match dtb__150 with
  | { Base_dData_dPair.f_Base_dData_dPair_dPair_first = dtb__151; Base_dData_dPair.f_Base_dData_dPair_dPair_second = dtb__152 } -> ((fun nd_uscrut23 -> (match nd_uscrut23 with
  | Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Just (dtb__153) -> (match dtb__153 with
  | { Base_dData_dPair.f_Base_dData_dPair_dPair_first = dtb__154; Base_dData_dPair.f_Base_dData_dPair_dPair_second = dtb__155 } -> ((fun nd_uscrut30 -> (match nd_uscrut30 with
  | Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Just (dtb__156) -> (match dtb__156 with
  | { Base_dData_dPair.f_Base_dData_dPair_dPair_first = dtb__157; Base_dData_dPair.f_Base_dData_dPair_dPair_second = dtb__158 } -> ((fun nd_uscrut37 -> (match nd_uscrut37 with
  | Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Just (dtb__159) -> (match dtb__159 with
  | { Base_dData_dPair.f_Base_dData_dPair_dPair_first = dtb__160; Base_dData_dPair.f_Base_dData_dPair_dPair_second = dtb__161 } -> (Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Just ({ Base_dData_dPair.f_Base_dData_dPair_dPair_first = (Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dTerm_TProj (dtb__148, dtb__151, dtb__154, dtb__157, dtb__160)); Base_dData_dPair.f_Base_dData_dPair_dPair_second = dtb__161 }))
  | _ -> failwith "DT: impossible branch"
)
  | Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Nothing -> Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Nothing
  | _ -> failwith "DT: impossible branch"
)) ((Vuna_dCompiler_dBase_dBytes.v_Vuna_dCompiler_dBase_dBytes_ddecInt (fuel - 1)) dtb__158))
  | _ -> failwith "DT: impossible branch"
)
  | Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Nothing -> Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Nothing
  | _ -> failwith "DT: impossible branch"
)) ((Vuna_dCompiler_dBase_dBytes.v_Vuna_dCompiler_dBase_dBytes_ddecInt (fuel - 1)) dtb__155))
  | _ -> failwith "DT: impossible branch"
)
  | Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Nothing -> Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Nothing
  | _ -> failwith "DT: impossible branch"
)) (((Vuna_dCompiler_dBase_dBytes.v_Vuna_dCompiler_dBase_dBytes_ddecList v_Vuna_dCompiler_dCore_dCanonical_ddecBinder) (fuel - 1)) dtb__152))
  | _ -> failwith "DT: impossible branch"
)
  | Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Nothing -> Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Nothing
  | _ -> failwith "DT: impossible branch"
)) ((Vuna_dCompiler_dBase_dBytes.v_Vuna_dCompiler_dBase_dBytes_ddecStr (fuel - 1)) dtb__149))
  | _ -> failwith "DT: impossible branch"
)
  | Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Nothing -> Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Nothing
  | _ -> failwith "DT: impossible branch"
)) ((v_Vuna_dCompiler_dCore_dCanonical_ddecTerm (fuel - 1)) dtb__80)) else (if (dtb__79 = 11) then ((fun nd_uscrut9 -> (match nd_uscrut9 with
  | Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Just (dtb__162) -> (match dtb__162 with
  | { Base_dData_dPair.f_Base_dData_dPair_dPair_first = dtb__163; Base_dData_dPair.f_Base_dData_dPair_dPair_second = dtb__164 } -> ((fun nd_uscrut16 -> (match nd_uscrut16 with
  | Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Just (dtb__165) -> (match dtb__165 with
  | { Base_dData_dPair.f_Base_dData_dPair_dPair_first = dtb__166; Base_dData_dPair.f_Base_dData_dPair_dPair_second = dtb__167 } -> ((fun nd_uscrut23 -> (match nd_uscrut23 with
  | Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Just (dtb__168) -> (match dtb__168 with
  | { Base_dData_dPair.f_Base_dData_dPair_dPair_first = dtb__169; Base_dData_dPair.f_Base_dData_dPair_dPair_second = dtb__170 } -> ((fun nd_uscrut30 -> (match nd_uscrut30 with
  | Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Just (dtb__171) -> (match dtb__171 with
  | { Base_dData_dPair.f_Base_dData_dPair_dPair_first = dtb__172; Base_dData_dPair.f_Base_dData_dPair_dPair_second = dtb__173 } -> ((fun nd_uscrut37 -> (match nd_uscrut37 with
  | Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Just (dtb__174) -> (match dtb__174 with
  | { Base_dData_dPair.f_Base_dData_dPair_dPair_first = dtb__175; Base_dData_dPair.f_Base_dData_dPair_dPair_second = dtb__176 } -> (Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Just ({ Base_dData_dPair.f_Base_dData_dPair_dPair_first = (Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dTerm_TRecUpd (dtb__163, dtb__166, dtb__169, dtb__172, dtb__175)); Base_dData_dPair.f_Base_dData_dPair_dPair_second = dtb__176 }))
  | _ -> failwith "DT: impossible branch"
)
  | Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Nothing -> Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Nothing
  | _ -> failwith "DT: impossible branch"
)) ((v_Vuna_dCompiler_dCore_dCanonical_ddecTerm (fuel - 1)) dtb__173))
  | _ -> failwith "DT: impossible branch"
)
  | Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Nothing -> Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Nothing
  | _ -> failwith "DT: impossible branch"
)) (((Vuna_dCompiler_dBase_dBytes.v_Vuna_dCompiler_dBase_dBytes_ddecList Vuna_dCompiler_dBase_dBytes.v_Vuna_dCompiler_dBase_dBytes_ddecInt) (fuel - 1)) dtb__170))
  | _ -> failwith "DT: impossible branch"
)
  | Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Nothing -> Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Nothing
  | _ -> failwith "DT: impossible branch"
)) (((Vuna_dCompiler_dBase_dBytes.v_Vuna_dCompiler_dBase_dBytes_ddecList v_Vuna_dCompiler_dCore_dCanonical_ddecBinder) (fuel - 1)) dtb__167))
  | _ -> failwith "DT: impossible branch"
)
  | Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Nothing -> Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Nothing
  | _ -> failwith "DT: impossible branch"
)) ((Vuna_dCompiler_dBase_dBytes.v_Vuna_dCompiler_dBase_dBytes_ddecStr (fuel - 1)) dtb__164))
  | _ -> failwith "DT: impossible branch"
)
  | Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Nothing -> Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Nothing
  | _ -> failwith "DT: impossible branch"
)) ((v_Vuna_dCompiler_dCore_dCanonical_ddecTerm (fuel - 1)) dtb__80)) else (if (dtb__79 = 12) then ((fun nd_uscrut9 -> (match nd_uscrut9 with
  | Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Just (dtb__177) -> (match dtb__177 with
  | { Base_dData_dPair.f_Base_dData_dPair_dPair_first = dtb__178; Base_dData_dPair.f_Base_dData_dPair_dPair_second = dtb__179 } -> (Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Just ({ Base_dData_dPair.f_Base_dData_dPair_dPair_first = (Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dTerm_TInt (dtb__178)); Base_dData_dPair.f_Base_dData_dPair_dPair_second = dtb__179 }))
  | _ -> failwith "DT: impossible branch"
)
  | Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Nothing -> Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Nothing
  | _ -> failwith "DT: impossible branch"
)) ((Vuna_dCompiler_dBase_dBytes.v_Vuna_dCompiler_dBase_dBytes_ddecInt (fuel - 1)) dtb__80)) else (if (dtb__79 = 13) then ((fun nd_uscrut9 -> (match nd_uscrut9 with
  | Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Just (dtb__180) -> (match dtb__180 with
  | { Base_dData_dPair.f_Base_dData_dPair_dPair_first = dtb__181; Base_dData_dPair.f_Base_dData_dPair_dPair_second = dtb__182 } -> (Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Just ({ Base_dData_dPair.f_Base_dData_dPair_dPair_first = (Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dTerm_TStr (dtb__181)); Base_dData_dPair.f_Base_dData_dPair_dPair_second = dtb__182 }))
  | _ -> failwith "DT: impossible branch"
)
  | Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Nothing -> Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Nothing
  | _ -> failwith "DT: impossible branch"
)) ((Vuna_dCompiler_dBase_dBytes.v_Vuna_dCompiler_dBase_dBytes_ddecStr (fuel - 1)) dtb__80)) else (if (dtb__79 = 14) then ((fun nd_uscrut9 -> (match nd_uscrut9 with
  | Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Just (dtb__183) -> (match dtb__183 with
  | { Base_dData_dPair.f_Base_dData_dPair_dPair_first = dtb__184; Base_dData_dPair.f_Base_dData_dPair_dPair_second = dtb__185 } -> (Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Just ({ Base_dData_dPair.f_Base_dData_dPair_dPair_first = (Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dTerm_TBool (dtb__184)); Base_dData_dPair.f_Base_dData_dPair_dPair_second = dtb__185 }))
  | _ -> failwith "DT: impossible branch"
)
  | Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Nothing -> Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Nothing
  | _ -> failwith "DT: impossible branch"
)) ((Vuna_dCompiler_dBase_dBytes.v_Vuna_dCompiler_dBase_dBytes_ddecBool (fuel - 1)) dtb__80)) else (if (dtb__79 = 15) then ((fun nd_uscrut9 -> (match nd_uscrut9 with
  | Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Just (dtb__186) -> (match dtb__186 with
  | { Base_dData_dPair.f_Base_dData_dPair_dPair_first = dtb__187; Base_dData_dPair.f_Base_dData_dPair_dPair_second = dtb__188 } -> ((fun nd_uscrut16 -> (match nd_uscrut16 with
  | Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Just (dtb__189) -> (match dtb__189 with
  | { Base_dData_dPair.f_Base_dData_dPair_dPair_first = dtb__190; Base_dData_dPair.f_Base_dData_dPair_dPair_second = dtb__191 } -> ((fun nd_uscrut23 -> (match nd_uscrut23 with
  | Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Just (dtb__192) -> (match dtb__192 with
  | { Base_dData_dPair.f_Base_dData_dPair_dPair_first = dtb__193; Base_dData_dPair.f_Base_dData_dPair_dPair_second = dtb__194 } -> (Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Just ({ Base_dData_dPair.f_Base_dData_dPair_dPair_first = (Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dTerm_TIf (dtb__187, dtb__190, dtb__193)); Base_dData_dPair.f_Base_dData_dPair_dPair_second = dtb__194 }))
  | _ -> failwith "DT: impossible branch"
)
  | Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Nothing -> Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Nothing
  | _ -> failwith "DT: impossible branch"
)) ((v_Vuna_dCompiler_dCore_dCanonical_ddecTerm (fuel - 1)) dtb__191))
  | _ -> failwith "DT: impossible branch"
)
  | Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Nothing -> Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Nothing
  | _ -> failwith "DT: impossible branch"
)) ((v_Vuna_dCompiler_dCore_dCanonical_ddecTerm (fuel - 1)) dtb__188))
  | _ -> failwith "DT: impossible branch"
)
  | Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Nothing -> Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Nothing
  | _ -> failwith "DT: impossible branch"
)) ((v_Vuna_dCompiler_dCore_dCanonical_ddecTerm (fuel - 1)) dtb__80)) else (if (dtb__79 = 16) then ((fun nd_uscrut9 -> (match nd_uscrut9 with
  | Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Just (dtb__195) -> (match dtb__195 with
  | { Base_dData_dPair.f_Base_dData_dPair_dPair_first = dtb__196; Base_dData_dPair.f_Base_dData_dPair_dPair_second = dtb__197 } -> (Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Just ({ Base_dData_dPair.f_Base_dData_dPair_dPair_first = (Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dTerm_TFloat (dtb__196)); Base_dData_dPair.f_Base_dData_dPair_dPair_second = dtb__197 }))
  | _ -> failwith "DT: impossible branch"
)
  | Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Nothing -> Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Nothing
  | _ -> failwith "DT: impossible branch"
)) ((Vuna_dCompiler_dBase_dBytes.v_Vuna_dCompiler_dBase_dBytes_ddecStr (fuel - 1)) dtb__80)) else (if (dtb__79 = 17) then ((fun nd_uscrut9 -> (match nd_uscrut9 with
  | Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Just (dtb__198) -> (match dtb__198 with
  | { Base_dData_dPair.f_Base_dData_dPair_dPair_first = dtb__199; Base_dData_dPair.f_Base_dData_dPair_dPair_second = dtb__200 } -> ((fun nd_uscrut16 -> (match nd_uscrut16 with
  | Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Just (dtb__201) -> (match dtb__201 with
  | { Base_dData_dPair.f_Base_dData_dPair_dPair_first = dtb__202; Base_dData_dPair.f_Base_dData_dPair_dPair_second = dtb__203 } -> (Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Just ({ Base_dData_dPair.f_Base_dData_dPair_dPair_first = (Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dTerm_TRecord (dtb__199, dtb__202)); Base_dData_dPair.f_Base_dData_dPair_dPair_second = dtb__203 }))
  | _ -> failwith "DT: impossible branch"
)
  | Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Nothing -> Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Nothing
  | _ -> failwith "DT: impossible branch"
)) (((Vuna_dCompiler_dBase_dBytes.v_Vuna_dCompiler_dBase_dBytes_ddecList v_Vuna_dCompiler_dCore_dCanonical_ddecArg) (fuel - 1)) dtb__200))
  | _ -> failwith "DT: impossible branch"
)
  | Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Nothing -> Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Nothing
  | _ -> failwith "DT: impossible branch"
)) ((Vuna_dCompiler_dBase_dBytes.v_Vuna_dCompiler_dBase_dBytes_ddecStr (fuel - 1)) dtb__80)) else Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Nothing))))))))))))))))))
  | _ -> failwith "DT: impossible branch"
)
  | Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Nothing -> Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Nothing
  | _ -> failwith "DT: impossible branch"
)) ((Vuna_dCompiler_dBase_dBytes.v_Vuna_dCompiler_dBase_dBytes_ddecTag fuel) bytes))))

# 256 "Vuna/Compiler/Core/Canonical.vuna"
let v_Vuna_dCompiler_dCore_dCanonical_ddecTermComplete = (fun s -> ((fun nd_uscrut1 -> (match nd_uscrut1 with
  | Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Just (dtb__204) -> (match dtb__204 with
  | { Base_dData_dPair.f_Base_dData_dPair_dPair_first = dtb__205; Base_dData_dPair.f_Base_dData_dPair_dPair_second = dtb__206 } -> (if (Vuna_dCompiler_dBase_dBytes.v_Vuna_dCompiler_dBase_dBytes_dcurAtEnd dtb__206) then (Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Just (dtb__205)) else Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Nothing)
  | _ -> failwith "DT: impossible branch"
)
  | Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Nothing -> Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Nothing
  | _ -> failwith "DT: impossible branch"
)) ((v_Vuna_dCompiler_dCore_dCanonical_ddecTerm (bi_strLength s)) (Vuna_dCompiler_dBase_dBytes.v_Vuna_dCompiler_dBase_dBytes_dcurOf s))))
