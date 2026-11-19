open Vuna_runtime
# 26 "Vuna/Compiler/Core/Canonical.vuna"
let v_Vuna_dCompiler_dCore_dCanonical_dnoSpan = { Vuna_dCompiler_dBase_dSource.f_Vuna_dCompiler_dBase_dSource_dSpan_spanFile = ""; Vuna_dCompiler_dBase_dSource.f_Vuna_dCompiler_dBase_dSource_dSpan_spanStartLine = 0; Vuna_dCompiler_dBase_dSource.f_Vuna_dCompiler_dBase_dSource_dSpan_spanStartCol = 0; Vuna_dCompiler_dBase_dSource.f_Vuna_dCompiler_dBase_dSource_dSpan_spanEndLine = 0; Vuna_dCompiler_dBase_dSource.f_Vuna_dCompiler_dBase_dSource_dSpan_spanEndCol = 0; Vuna_dCompiler_dBase_dSource.f_Vuna_dCompiler_dBase_dSource_dSpan_spanStartOffset = 0; Vuna_dCompiler_dBase_dSource.f_Vuna_dCompiler_dBase_dSource_dSpan_spanEndOffset = 0 }

# 33 "Vuna/Compiler/Core/Canonical.vuna"
let v_Vuna_dCompiler_dCore_dCanonical_dencRig = (fun (mc0 : Vuna_dCompiler_dCore_dTerm.t_Vuna_dCompiler_dCore_dTerm_dRig) (mc1 : string Base_dData_dList.t_Base_dData_dList_dList) -> (match mc0 with
  | Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dRig_RigOmega -> ((Vuna_dCompiler_dBase_dBytes.v_Vuna_dCompiler_dBase_dBytes_dencTag 2) mc1)
  | Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dRig_Rig1 -> ((Vuna_dCompiler_dBase_dBytes.v_Vuna_dCompiler_dBase_dBytes_dencTag 1) mc1)
  | Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dRig_Rig0 -> ((Vuna_dCompiler_dBase_dBytes.v_Vuna_dCompiler_dBase_dBytes_dencTag 0) mc1)
  | _ -> failwith "DT: impossible branch"
))

# 52 "Vuna/Compiler/Core/Canonical.vuna"
let v_Vuna_dCompiler_dCore_dCanonical_dencBinder = (fun (mc0 : (string, Vuna_dCompiler_dCore_dTerm.t_Vuna_dCompiler_dCore_dTerm_dRig) Base_dData_dPair.t_Base_dData_dPair_dPair) (mc1 : string Base_dData_dList.t_Base_dData_dList_dList) -> (match mc0 with
  | { Base_dData_dPair.f_Base_dData_dPair_dPair_first = dtb__0; Base_dData_dPair.f_Base_dData_dPair_dPair_second = dtb__1 } -> ((Vuna_dCompiler_dBase_dBytes.v_Vuna_dCompiler_dBase_dBytes_dencStr dtb__0) ((v_Vuna_dCompiler_dCore_dCanonical_dencRig dtb__1) mc1))
  | _ -> failwith "DT: impossible branch"
))

# 56 "Vuna/Compiler/Core/Canonical.vuna"
let v_Vuna_dCompiler_dCore_dCanonical_dencBinders = (fun (bs : (string, Vuna_dCompiler_dCore_dTerm.t_Vuna_dCompiler_dCore_dTerm_dRig) Base_dData_dPair.t_Base_dData_dPair_dPair Base_dData_dList.t_Base_dData_dList_dList) (acc : string Base_dData_dList.t_Base_dData_dList_dList) -> (((Vuna_dCompiler_dBase_dBytes.v_Vuna_dCompiler_dBase_dBytes_dencList v_Vuna_dCompiler_dCore_dCanonical_dencBinder) bs) acc))

# 73 "Vuna/Compiler/Core/Canonical.vuna"
let v_Vuna_dCompiler_dCore_dCanonical_dencInts = (fun (xs : int Base_dData_dList.t_Base_dData_dList_dList) (acc : string Base_dData_dList.t_Base_dData_dList_dList) -> (((Vuna_dCompiler_dBase_dBytes.v_Vuna_dCompiler_dBase_dBytes_dencList Vuna_dCompiler_dBase_dBytes.v_Vuna_dCompiler_dBase_dBytes_dencInt) xs) acc))

# 39 "Vuna/Compiler/Core/Canonical.vuna"
let rec v_Vuna_dCompiler_dCore_dCanonical_dencArg = (fun (mc0 : (Vuna_dCompiler_dCore_dTerm.t_Vuna_dCompiler_dCore_dTerm_dTerm, Vuna_dCompiler_dCore_dTerm.t_Vuna_dCompiler_dCore_dTerm_dRig) Base_dData_dPair.t_Base_dData_dPair_dPair) (mc1 : string Base_dData_dList.t_Base_dData_dList_dList) -> (match mc0 with
  | { Base_dData_dPair.f_Base_dData_dPair_dPair_first = dtb__2; Base_dData_dPair.f_Base_dData_dPair_dPair_second = dtb__3 } -> ((v_Vuna_dCompiler_dCore_dCanonical_dencTerm dtb__2) ((v_Vuna_dCompiler_dCore_dCanonical_dencRig dtb__3) mc1))
  | _ -> failwith "DT: impossible branch"
))
# 43 "Vuna/Compiler/Core/Canonical.vuna"
and v_Vuna_dCompiler_dCore_dCanonical_dencArgs = (fun (xs : (Vuna_dCompiler_dCore_dTerm.t_Vuna_dCompiler_dCore_dTerm_dTerm, Vuna_dCompiler_dCore_dTerm.t_Vuna_dCompiler_dCore_dTerm_dRig) Base_dData_dPair.t_Base_dData_dPair_dPair Base_dData_dList.t_Base_dData_dList_dList) (acc : string Base_dData_dList.t_Base_dData_dList_dList) -> (Base_dData_dList.C_Base_dData_dList_dList__x58__x58_ ((String.concat "" ["["; (bi_strFromInt (Vuna_dCompiler_dBase_dBytes.v_Vuna_dCompiler_dBase_dBytes_dlenOf xs)); ":"]), ((v_Vuna_dCompiler_dCore_dCanonical_dencArgsGo xs) acc))))
# 47 "Vuna/Compiler/Core/Canonical.vuna"
and v_Vuna_dCompiler_dCore_dCanonical_dencArgsGo = (fun (mc0 : (Vuna_dCompiler_dCore_dTerm.t_Vuna_dCompiler_dCore_dTerm_dTerm, Vuna_dCompiler_dCore_dTerm.t_Vuna_dCompiler_dCore_dTerm_dRig) Base_dData_dPair.t_Base_dData_dPair_dPair Base_dData_dList.t_Base_dData_dList_dList) (mc1 : string Base_dData_dList.t_Base_dData_dList_dList) -> (match mc0 with
  | Base_dData_dList.C_Base_dData_dList_dList__x58__x58_ (dtb__4, dtb__5) -> ((v_Vuna_dCompiler_dCore_dCanonical_dencArg dtb__4) ((v_Vuna_dCompiler_dCore_dCanonical_dencArgsGo dtb__5) mc1))
  | Base_dData_dList.C_Base_dData_dList_dList_Nil -> mc1
  | _ -> failwith "DT: impossible branch"
))
# 60 "Vuna/Compiler/Core/Canonical.vuna"
and v_Vuna_dCompiler_dCore_dCanonical_dencAlt = (fun (mc0 : Vuna_dCompiler_dCore_dTerm.t_Vuna_dCompiler_dCore_dTerm_dCaseAlt) (mc1 : string Base_dData_dList.t_Base_dData_dList_dList) -> (match mc0 with
  | { Vuna_dCompiler_dCore_dTerm.f_Vuna_dCompiler_dCore_dTerm_dCaseAlt_caseAltName = dtb__6; Vuna_dCompiler_dCore_dTerm.f_Vuna_dCompiler_dCore_dTerm_dCaseAlt_caseAltBinders = dtb__7; Vuna_dCompiler_dCore_dTerm.f_Vuna_dCompiler_dCore_dTerm_dCaseAlt_caseAltBody = dtb__8 } -> ((Vuna_dCompiler_dBase_dBytes.v_Vuna_dCompiler_dBase_dBytes_dencStr dtb__6) ((v_Vuna_dCompiler_dCore_dCanonical_dencBinders (Vuna_dCompiler_dCore_dTerm.v_Vuna_dCompiler_dCore_dTerm_dbinderPairs dtb__7)) ((v_Vuna_dCompiler_dCore_dCanonical_dencTerm dtb__8) mc1)))
  | _ -> failwith "DT: impossible branch"
))
# 64 "Vuna/Compiler/Core/Canonical.vuna"
and v_Vuna_dCompiler_dCore_dCanonical_dencAlts = (fun (xs : Vuna_dCompiler_dCore_dTerm.t_Vuna_dCompiler_dCore_dTerm_dCaseAlt Base_dData_dList.t_Base_dData_dList_dList) (acc : string Base_dData_dList.t_Base_dData_dList_dList) -> (Base_dData_dList.C_Base_dData_dList_dList__x58__x58_ ((String.concat "" ["["; (bi_strFromInt (Vuna_dCompiler_dBase_dBytes.v_Vuna_dCompiler_dBase_dBytes_dlenOf xs)); ":"]), ((v_Vuna_dCompiler_dCore_dCanonical_dencAltsGo xs) acc))))
# 68 "Vuna/Compiler/Core/Canonical.vuna"
and v_Vuna_dCompiler_dCore_dCanonical_dencAltsGo = (fun (mc0 : Vuna_dCompiler_dCore_dTerm.t_Vuna_dCompiler_dCore_dTerm_dCaseAlt Base_dData_dList.t_Base_dData_dList_dList) (mc1 : string Base_dData_dList.t_Base_dData_dList_dList) -> (match mc0 with
  | Base_dData_dList.C_Base_dData_dList_dList__x58__x58_ (dtb__9, dtb__10) -> ((v_Vuna_dCompiler_dCore_dCanonical_dencAlt dtb__9) ((v_Vuna_dCompiler_dCore_dCanonical_dencAltsGo dtb__10) mc1))
  | Base_dData_dList.C_Base_dData_dList_dList_Nil -> mc1
  | _ -> failwith "DT: impossible branch"
))
# 77 "Vuna/Compiler/Core/Canonical.vuna"
and v_Vuna_dCompiler_dCore_dCanonical_dencTerm = (fun (mc0 : Vuna_dCompiler_dCore_dTerm.t_Vuna_dCompiler_dCore_dTerm_dTerm) (mc1 : string Base_dData_dList.t_Base_dData_dList_dList) -> (match mc0 with
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
  | Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dTerm_TLam (dtb__39, dtb__40, dtb__41, dtb__42, dtb__43) -> ((Vuna_dCompiler_dBase_dBytes.v_Vuna_dCompiler_dBase_dBytes_dencTag 5) ((Vuna_dCompiler_dBase_dBytes.v_Vuna_dCompiler_dBase_dBytes_dencStr dtb__39) ((v_Vuna_dCompiler_dCore_dCanonical_dencRig dtb__40) ((v_Vuna_dCompiler_dCore_dCanonical_dencTerm dtb__43) mc1))))
  | Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dTerm_TPi (dtb__44, dtb__45, dtb__46, dtb__47, dtb__48) -> ((Vuna_dCompiler_dBase_dBytes.v_Vuna_dCompiler_dBase_dBytes_dencTag 4) ((Vuna_dCompiler_dBase_dBytes.v_Vuna_dCompiler_dBase_dBytes_dencStr dtb__44) ((Vuna_dCompiler_dBase_dBytes.v_Vuna_dCompiler_dBase_dBytes_dencBool dtb__45) ((v_Vuna_dCompiler_dCore_dCanonical_dencRig dtb__46) ((v_Vuna_dCompiler_dCore_dCanonical_dencTerm dtb__47) ((v_Vuna_dCompiler_dCore_dCanonical_dencTerm dtb__48) mc1))))))
  | Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dTerm_TType (dtb__49) -> ((Vuna_dCompiler_dBase_dBytes.v_Vuna_dCompiler_dBase_dBytes_dencTag 3) ((Vuna_dCompiler_dBase_dBytes.v_Vuna_dCompiler_dBase_dBytes_dencInt (Vuna_dCompiler_dCore_dTerm.v_Vuna_dCompiler_dCore_dTerm_dlevelToInt dtb__49)) mc1))
  | Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dTerm_TGlobal (dtb__50) -> ((Vuna_dCompiler_dBase_dBytes.v_Vuna_dCompiler_dBase_dBytes_dencTag 2) ((Vuna_dCompiler_dBase_dBytes.v_Vuna_dCompiler_dBase_dBytes_dencStr dtb__50) mc1))
  | Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dTerm_TMeta (dtb__51) -> ((Vuna_dCompiler_dBase_dBytes.v_Vuna_dCompiler_dBase_dBytes_dencTag 1) ((Vuna_dCompiler_dBase_dBytes.v_Vuna_dCompiler_dBase_dBytes_dencInt dtb__51) mc1))
  | Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dTerm_TVar (dtb__52, dtb__53, dtb__54) -> ((Vuna_dCompiler_dBase_dBytes.v_Vuna_dCompiler_dBase_dBytes_dencTag 0) ((Vuna_dCompiler_dBase_dBytes.v_Vuna_dCompiler_dBase_dBytes_dencStr dtb__52) ((Vuna_dCompiler_dBase_dBytes.v_Vuna_dCompiler_dBase_dBytes_dencInt dtb__53) mc1)))
  | _ -> failwith "DT: impossible branch"
))

# 100 "Vuna/Compiler/Core/Canonical.vuna"
let v_Vuna_dCompiler_dCore_dCanonical_dencTermBytes = (fun (t : Vuna_dCompiler_dCore_dTerm.t_Vuna_dCompiler_dCore_dTerm_dTerm) -> ((Vuna_dCompiler_dBase_dBytes.v_Vuna_dCompiler_dBase_dBytes_dencTop v_Vuna_dCompiler_dCore_dCanonical_dencTerm) t))

# 108 "Vuna/Compiler/Core/Canonical.vuna"
let v_Vuna_dCompiler_dCore_dCanonical_ddecRig = (fun (fuel : int) (bytes : Vuna_dCompiler_dBase_dBytes.t_Vuna_dCompiler_dBase_dBytes_dCur) -> (if (fuel <= 0) then Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Nothing else ((fun nd_uscrut2 -> (match nd_uscrut2 with
  | Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Just (dtb__55) -> (match dtb__55 with
  | { Base_dData_dPair.f_Base_dData_dPair_dPair_first = dtb__56; Base_dData_dPair.f_Base_dData_dPair_dPair_second = dtb__57 } -> (if (dtb__56 = 0) then (Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Just ({ Base_dData_dPair.f_Base_dData_dPair_dPair_first = Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dRig_Rig0; Base_dData_dPair.f_Base_dData_dPair_dPair_second = dtb__57 })) else (if (dtb__56 = 1) then (Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Just ({ Base_dData_dPair.f_Base_dData_dPair_dPair_first = Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dRig_Rig1; Base_dData_dPair.f_Base_dData_dPair_dPair_second = dtb__57 })) else (if (dtb__56 = 2) then (Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Just ({ Base_dData_dPair.f_Base_dData_dPair_dPair_first = Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dRig_RigOmega; Base_dData_dPair.f_Base_dData_dPair_dPair_second = dtb__57 })) else Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Nothing)))
  | _ -> failwith "DT: impossible branch"
)
  | Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Nothing -> Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Nothing
  | _ -> failwith "DT: impossible branch"
)) ((Vuna_dCompiler_dBase_dBytes.v_Vuna_dCompiler_dBase_dBytes_ddecTag fuel) bytes))))

# 136 "Vuna/Compiler/Core/Canonical.vuna"
let v_Vuna_dCompiler_dCore_dCanonical_ddecBinder = (fun (fuel : int) (bytes : Vuna_dCompiler_dBase_dBytes.t_Vuna_dCompiler_dBase_dBytes_dCur) -> (if (fuel <= 0) then Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Nothing else ((fun nd_uscrut2 -> (match nd_uscrut2 with
  | Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Just (dtb__58) -> (match dtb__58 with
  | { Base_dData_dPair.f_Base_dData_dPair_dPair_first = dtb__59; Base_dData_dPair.f_Base_dData_dPair_dPair_second = dtb__60 } -> ((fun nd_uscrut9 -> (match nd_uscrut9 with
  | Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Just (dtb__61) -> (match dtb__61 with
  | { Base_dData_dPair.f_Base_dData_dPair_dPair_first = dtb__62; Base_dData_dPair.f_Base_dData_dPair_dPair_second = dtb__63 } -> (Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Just ({ Base_dData_dPair.f_Base_dData_dPair_dPair_first = { Base_dData_dPair.f_Base_dData_dPair_dPair_first = dtb__59; Base_dData_dPair.f_Base_dData_dPair_dPair_second = dtb__62 }; Base_dData_dPair.f_Base_dData_dPair_dPair_second = dtb__63 }))
  | _ -> failwith "DT: impossible branch"
)
  | Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Nothing -> Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Nothing
  | _ -> failwith "DT: impossible branch"
)) ((v_Vuna_dCompiler_dCore_dCanonical_ddecRig (fuel - 1)) dtb__60))
  | _ -> failwith "DT: impossible branch"
)
  | Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Nothing -> Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Nothing
  | _ -> failwith "DT: impossible branch"
)) ((Vuna_dCompiler_dBase_dBytes.v_Vuna_dCompiler_dBase_dBytes_ddecStr (fuel - 1)) bytes))))

# 123 "Vuna/Compiler/Core/Canonical.vuna"
let rec v_Vuna_dCompiler_dCore_dCanonical_ddecArg = (fun (fuel : int) (bytes : Vuna_dCompiler_dBase_dBytes.t_Vuna_dCompiler_dBase_dBytes_dCur) -> (if (fuel <= 0) then Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Nothing else ((fun nd_uscrut2 -> (match nd_uscrut2 with
  | Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Just (dtb__64) -> (match dtb__64 with
  | { Base_dData_dPair.f_Base_dData_dPair_dPair_first = dtb__65; Base_dData_dPair.f_Base_dData_dPair_dPair_second = dtb__66 } -> ((fun nd_uscrut9 -> (match nd_uscrut9 with
  | Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Just (dtb__67) -> (match dtb__67 with
  | { Base_dData_dPair.f_Base_dData_dPair_dPair_first = dtb__68; Base_dData_dPair.f_Base_dData_dPair_dPair_second = dtb__69 } -> (Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Just ({ Base_dData_dPair.f_Base_dData_dPair_dPair_first = { Base_dData_dPair.f_Base_dData_dPair_dPair_first = dtb__65; Base_dData_dPair.f_Base_dData_dPair_dPair_second = dtb__68 }; Base_dData_dPair.f_Base_dData_dPair_dPair_second = dtb__69 }))
  | _ -> failwith "DT: impossible branch"
)
  | Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Nothing -> Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Nothing
  | _ -> failwith "DT: impossible branch"
)) ((v_Vuna_dCompiler_dCore_dCanonical_ddecRig (fuel - 1)) dtb__66))
  | _ -> failwith "DT: impossible branch"
)
  | Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Nothing -> Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Nothing
  | _ -> failwith "DT: impossible branch"
)) ((v_Vuna_dCompiler_dCore_dCanonical_ddecTerm (fuel - 1)) bytes))))
# 149 "Vuna/Compiler/Core/Canonical.vuna"
and v_Vuna_dCompiler_dCore_dCanonical_ddecAlt = (fun (fuel : int) (bytes : Vuna_dCompiler_dBase_dBytes.t_Vuna_dCompiler_dBase_dBytes_dCur) -> (if (fuel <= 0) then Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Nothing else ((fun nd_uscrut2 -> (match nd_uscrut2 with
  | Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Just (dtb__70) -> (match dtb__70 with
  | { Base_dData_dPair.f_Base_dData_dPair_dPair_first = dtb__71; Base_dData_dPair.f_Base_dData_dPair_dPair_second = dtb__72 } -> ((fun nd_uscrut9 -> (match nd_uscrut9 with
  | Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Just (dtb__73) -> (match dtb__73 with
  | { Base_dData_dPair.f_Base_dData_dPair_dPair_first = dtb__74; Base_dData_dPair.f_Base_dData_dPair_dPair_second = dtb__75 } -> ((fun nd_uscrut16 -> (match nd_uscrut16 with
  | Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Just (dtb__76) -> (match dtb__76 with
  | { Base_dData_dPair.f_Base_dData_dPair_dPair_first = dtb__77; Base_dData_dPair.f_Base_dData_dPair_dPair_second = dtb__78 } -> (Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Just ({ Base_dData_dPair.f_Base_dData_dPair_dPair_first = { Vuna_dCompiler_dCore_dTerm.f_Vuna_dCompiler_dCore_dTerm_dCaseAlt_caseAltName = dtb__71; Vuna_dCompiler_dCore_dTerm.f_Vuna_dCompiler_dCore_dTerm_dCaseAlt_caseAltBinders = (Vuna_dCompiler_dCore_dTerm.v_Vuna_dCompiler_dCore_dTerm_dbindersOfPairs dtb__74); Vuna_dCompiler_dCore_dTerm.f_Vuna_dCompiler_dCore_dTerm_dCaseAlt_caseAltBody = dtb__77 }; Base_dData_dPair.f_Base_dData_dPair_dPair_second = dtb__78 }))
  | _ -> failwith "DT: impossible branch"
)
  | Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Nothing -> Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Nothing
  | _ -> failwith "DT: impossible branch"
)) ((v_Vuna_dCompiler_dCore_dCanonical_ddecTerm (fuel - 1)) dtb__75))
  | _ -> failwith "DT: impossible branch"
)
  | Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Nothing -> Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Nothing
  | _ -> failwith "DT: impossible branch"
)) (((Vuna_dCompiler_dBase_dBytes.v_Vuna_dCompiler_dBase_dBytes_ddecList v_Vuna_dCompiler_dCore_dCanonical_ddecBinder) (fuel - 1)) dtb__72))
  | _ -> failwith "DT: impossible branch"
)
  | Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Nothing -> Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Nothing
  | _ -> failwith "DT: impossible branch"
)) ((Vuna_dCompiler_dBase_dBytes.v_Vuna_dCompiler_dBase_dBytes_ddecStr (fuel - 1)) bytes))))
# 165 "Vuna/Compiler/Core/Canonical.vuna"
and v_Vuna_dCompiler_dCore_dCanonical_ddecTerm = (fun (fuel : int) (bytes : Vuna_dCompiler_dBase_dBytes.t_Vuna_dCompiler_dBase_dBytes_dCur) -> (if (fuel <= 0) then Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Nothing else ((fun nd_uscrut2 -> (match nd_uscrut2 with
  | Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Just (dtb__79) -> (match dtb__79 with
  | { Base_dData_dPair.f_Base_dData_dPair_dPair_first = dtb__80; Base_dData_dPair.f_Base_dData_dPair_dPair_second = dtb__81 } -> (if (dtb__80 = 0) then ((fun nd_uscrut9 -> (match nd_uscrut9 with
  | Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Just (dtb__82) -> (match dtb__82 with
  | { Base_dData_dPair.f_Base_dData_dPair_dPair_first = dtb__83; Base_dData_dPair.f_Base_dData_dPair_dPair_second = dtb__84 } -> ((fun nd_uscrut16 -> (match nd_uscrut16 with
  | Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Just (dtb__85) -> (match dtb__85 with
  | { Base_dData_dPair.f_Base_dData_dPair_dPair_first = dtb__86; Base_dData_dPair.f_Base_dData_dPair_dPair_second = dtb__87 } -> (Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Just ({ Base_dData_dPair.f_Base_dData_dPair_dPair_first = (Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dTerm_TVar (dtb__83, dtb__86, v_Vuna_dCompiler_dCore_dCanonical_dnoSpan)); Base_dData_dPair.f_Base_dData_dPair_dPair_second = dtb__87 }))
  | _ -> failwith "DT: impossible branch"
)
  | Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Nothing -> Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Nothing
  | _ -> failwith "DT: impossible branch"
)) ((Vuna_dCompiler_dBase_dBytes.v_Vuna_dCompiler_dBase_dBytes_ddecInt (fuel - 1)) dtb__84))
  | _ -> failwith "DT: impossible branch"
)
  | Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Nothing -> Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Nothing
  | _ -> failwith "DT: impossible branch"
)) ((Vuna_dCompiler_dBase_dBytes.v_Vuna_dCompiler_dBase_dBytes_ddecStr (fuel - 1)) dtb__81)) else (if (dtb__80 = 1) then ((fun nd_uscrut9 -> (match nd_uscrut9 with
  | Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Just (dtb__88) -> (match dtb__88 with
  | { Base_dData_dPair.f_Base_dData_dPair_dPair_first = dtb__89; Base_dData_dPair.f_Base_dData_dPair_dPair_second = dtb__90 } -> (Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Just ({ Base_dData_dPair.f_Base_dData_dPair_dPair_first = (Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dTerm_TMeta (dtb__89)); Base_dData_dPair.f_Base_dData_dPair_dPair_second = dtb__90 }))
  | _ -> failwith "DT: impossible branch"
)
  | Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Nothing -> Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Nothing
  | _ -> failwith "DT: impossible branch"
)) ((Vuna_dCompiler_dBase_dBytes.v_Vuna_dCompiler_dBase_dBytes_ddecInt (fuel - 1)) dtb__81)) else (if (dtb__80 = 2) then ((fun nd_uscrut9 -> (match nd_uscrut9 with
  | Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Just (dtb__91) -> (match dtb__91 with
  | { Base_dData_dPair.f_Base_dData_dPair_dPair_first = dtb__92; Base_dData_dPair.f_Base_dData_dPair_dPair_second = dtb__93 } -> (Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Just ({ Base_dData_dPair.f_Base_dData_dPair_dPair_first = (Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dTerm_TGlobal (dtb__92)); Base_dData_dPair.f_Base_dData_dPair_dPair_second = dtb__93 }))
  | _ -> failwith "DT: impossible branch"
)
  | Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Nothing -> Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Nothing
  | _ -> failwith "DT: impossible branch"
)) ((Vuna_dCompiler_dBase_dBytes.v_Vuna_dCompiler_dBase_dBytes_ddecStr (fuel - 1)) dtb__81)) else (if (dtb__80 = 3) then ((fun nd_uscrut9 -> (match nd_uscrut9 with
  | Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Just (dtb__94) -> (match dtb__94 with
  | { Base_dData_dPair.f_Base_dData_dPair_dPair_first = dtb__95; Base_dData_dPair.f_Base_dData_dPair_dPair_second = dtb__96 } -> (Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Just ({ Base_dData_dPair.f_Base_dData_dPair_dPair_first = (Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dTerm_TType ((Vuna_dCompiler_dCore_dTerm.v_Vuna_dCompiler_dCore_dTerm_dlevelOfInt dtb__95))); Base_dData_dPair.f_Base_dData_dPair_dPair_second = dtb__96 }))
  | _ -> failwith "DT: impossible branch"
)
  | Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Nothing -> Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Nothing
  | _ -> failwith "DT: impossible branch"
)) ((Vuna_dCompiler_dBase_dBytes.v_Vuna_dCompiler_dBase_dBytes_ddecInt (fuel - 1)) dtb__81)) else (if (dtb__80 = 4) then ((fun nd_uscrut9 -> (match nd_uscrut9 with
  | Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Just (dtb__97) -> (match dtb__97 with
  | { Base_dData_dPair.f_Base_dData_dPair_dPair_first = dtb__98; Base_dData_dPair.f_Base_dData_dPair_dPair_second = dtb__99 } -> ((fun nd_uscrut16 -> (match nd_uscrut16 with
  | Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Just (dtb__100) -> (match dtb__100 with
  | { Base_dData_dPair.f_Base_dData_dPair_dPair_first = dtb__101; Base_dData_dPair.f_Base_dData_dPair_dPair_second = dtb__102 } -> ((fun nd_uscrut23 -> (match nd_uscrut23 with
  | Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Just (dtb__103) -> (match dtb__103 with
  | { Base_dData_dPair.f_Base_dData_dPair_dPair_first = dtb__104; Base_dData_dPair.f_Base_dData_dPair_dPair_second = dtb__105 } -> ((fun nd_uscrut30 -> (match nd_uscrut30 with
  | Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Just (dtb__106) -> (match dtb__106 with
  | { Base_dData_dPair.f_Base_dData_dPair_dPair_first = dtb__107; Base_dData_dPair.f_Base_dData_dPair_dPair_second = dtb__108 } -> ((fun nd_uscrut37 -> (match nd_uscrut37 with
  | Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Just (dtb__109) -> (match dtb__109 with
  | { Base_dData_dPair.f_Base_dData_dPair_dPair_first = dtb__110; Base_dData_dPair.f_Base_dData_dPair_dPair_second = dtb__111 } -> (Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Just ({ Base_dData_dPair.f_Base_dData_dPair_dPair_first = (Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dTerm_TPi (dtb__98, dtb__101, dtb__104, dtb__107, dtb__110)); Base_dData_dPair.f_Base_dData_dPair_dPair_second = dtb__111 }))
  | _ -> failwith "DT: impossible branch"
)
  | Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Nothing -> Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Nothing
  | _ -> failwith "DT: impossible branch"
)) ((v_Vuna_dCompiler_dCore_dCanonical_ddecTerm (fuel - 1)) dtb__108))
  | _ -> failwith "DT: impossible branch"
)
  | Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Nothing -> Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Nothing
  | _ -> failwith "DT: impossible branch"
)) ((v_Vuna_dCompiler_dCore_dCanonical_ddecTerm (fuel - 1)) dtb__105))
  | _ -> failwith "DT: impossible branch"
)
  | Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Nothing -> Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Nothing
  | _ -> failwith "DT: impossible branch"
)) ((v_Vuna_dCompiler_dCore_dCanonical_ddecRig (fuel - 1)) dtb__102))
  | _ -> failwith "DT: impossible branch"
)
  | Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Nothing -> Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Nothing
  | _ -> failwith "DT: impossible branch"
)) ((Vuna_dCompiler_dBase_dBytes.v_Vuna_dCompiler_dBase_dBytes_ddecBool (fuel - 1)) dtb__99))
  | _ -> failwith "DT: impossible branch"
)
  | Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Nothing -> Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Nothing
  | _ -> failwith "DT: impossible branch"
)) ((Vuna_dCompiler_dBase_dBytes.v_Vuna_dCompiler_dBase_dBytes_ddecStr (fuel - 1)) dtb__81)) else (if (dtb__80 = 5) then ((fun nd_uscrut9 -> (match nd_uscrut9 with
  | Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Just (dtb__112) -> (match dtb__112 with
  | { Base_dData_dPair.f_Base_dData_dPair_dPair_first = dtb__113; Base_dData_dPair.f_Base_dData_dPair_dPair_second = dtb__114 } -> ((fun nd_uscrut16 -> (match nd_uscrut16 with
  | Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Just (dtb__115) -> (match dtb__115 with
  | { Base_dData_dPair.f_Base_dData_dPair_dPair_first = dtb__116; Base_dData_dPair.f_Base_dData_dPair_dPair_second = dtb__117 } -> ((fun nd_uscrut23 -> (match nd_uscrut23 with
  | Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Just (dtb__118) -> (match dtb__118 with
  | { Base_dData_dPair.f_Base_dData_dPair_dPair_first = dtb__119; Base_dData_dPair.f_Base_dData_dPair_dPair_second = dtb__120 } -> (Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Just ({ Base_dData_dPair.f_Base_dData_dPair_dPair_first = (Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dTerm_TLam (dtb__113, dtb__116, Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Nothing, v_Vuna_dCompiler_dCore_dCanonical_dnoSpan, dtb__119)); Base_dData_dPair.f_Base_dData_dPair_dPair_second = dtb__120 }))
  | _ -> failwith "DT: impossible branch"
)
  | Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Nothing -> Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Nothing
  | _ -> failwith "DT: impossible branch"
)) ((v_Vuna_dCompiler_dCore_dCanonical_ddecTerm (fuel - 1)) dtb__117))
  | _ -> failwith "DT: impossible branch"
)
  | Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Nothing -> Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Nothing
  | _ -> failwith "DT: impossible branch"
)) ((v_Vuna_dCompiler_dCore_dCanonical_ddecRig (fuel - 1)) dtb__114))
  | _ -> failwith "DT: impossible branch"
)
  | Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Nothing -> Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Nothing
  | _ -> failwith "DT: impossible branch"
)) ((Vuna_dCompiler_dBase_dBytes.v_Vuna_dCompiler_dBase_dBytes_ddecStr (fuel - 1)) dtb__81)) else (if (dtb__80 = 6) then ((fun nd_uscrut9 -> (match nd_uscrut9 with
  | Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Just (dtb__121) -> (match dtb__121 with
  | { Base_dData_dPair.f_Base_dData_dPair_dPair_first = dtb__122; Base_dData_dPair.f_Base_dData_dPair_dPair_second = dtb__123 } -> ((fun nd_uscrut16 -> (match nd_uscrut16 with
  | Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Just (dtb__124) -> (match dtb__124 with
  | { Base_dData_dPair.f_Base_dData_dPair_dPair_first = dtb__125; Base_dData_dPair.f_Base_dData_dPair_dPair_second = dtb__126 } -> ((fun nd_uscrut23 -> (match nd_uscrut23 with
  | Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Just (dtb__127) -> (match dtb__127 with
  | { Base_dData_dPair.f_Base_dData_dPair_dPair_first = dtb__128; Base_dData_dPair.f_Base_dData_dPair_dPair_second = dtb__129 } -> (Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Just ({ Base_dData_dPair.f_Base_dData_dPair_dPair_first = (Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dTerm_TApp (dtb__122, dtb__125, dtb__128)); Base_dData_dPair.f_Base_dData_dPair_dPair_second = dtb__129 }))
  | _ -> failwith "DT: impossible branch"
)
  | Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Nothing -> Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Nothing
  | _ -> failwith "DT: impossible branch"
)) ((v_Vuna_dCompiler_dCore_dCanonical_ddecRig (fuel - 1)) dtb__126))
  | _ -> failwith "DT: impossible branch"
)
  | Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Nothing -> Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Nothing
  | _ -> failwith "DT: impossible branch"
)) ((v_Vuna_dCompiler_dCore_dCanonical_ddecTerm (fuel - 1)) dtb__123))
  | _ -> failwith "DT: impossible branch"
)
  | Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Nothing -> Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Nothing
  | _ -> failwith "DT: impossible branch"
)) ((v_Vuna_dCompiler_dCore_dCanonical_ddecTerm (fuel - 1)) dtb__81)) else (if (dtb__80 = 7) then ((fun nd_uscrut9 -> (match nd_uscrut9 with
  | Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Just (dtb__130) -> (match dtb__130 with
  | { Base_dData_dPair.f_Base_dData_dPair_dPair_first = dtb__131; Base_dData_dPair.f_Base_dData_dPair_dPair_second = dtb__132 } -> ((fun nd_uscrut16 -> (match nd_uscrut16 with
  | Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Just (dtb__133) -> (match dtb__133 with
  | { Base_dData_dPair.f_Base_dData_dPair_dPair_first = dtb__134; Base_dData_dPair.f_Base_dData_dPair_dPair_second = dtb__135 } -> (Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Just ({ Base_dData_dPair.f_Base_dData_dPair_dPair_first = (Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dTerm_TCon (dtb__131, dtb__134)); Base_dData_dPair.f_Base_dData_dPair_dPair_second = dtb__135 }))
  | _ -> failwith "DT: impossible branch"
)
  | Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Nothing -> Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Nothing
  | _ -> failwith "DT: impossible branch"
)) (((Vuna_dCompiler_dBase_dBytes.v_Vuna_dCompiler_dBase_dBytes_ddecList v_Vuna_dCompiler_dCore_dCanonical_ddecArg) (fuel - 1)) dtb__132))
  | _ -> failwith "DT: impossible branch"
)
  | Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Nothing -> Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Nothing
  | _ -> failwith "DT: impossible branch"
)) ((Vuna_dCompiler_dBase_dBytes.v_Vuna_dCompiler_dBase_dBytes_ddecStr (fuel - 1)) dtb__81)) else (if (dtb__80 = 8) then ((fun nd_uscrut9 -> (match nd_uscrut9 with
  | Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Just (dtb__136) -> (match dtb__136 with
  | { Base_dData_dPair.f_Base_dData_dPair_dPair_first = dtb__137; Base_dData_dPair.f_Base_dData_dPair_dPair_second = dtb__138 } -> ((fun nd_uscrut16 -> (match nd_uscrut16 with
  | Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Just (dtb__139) -> (match dtb__139 with
  | { Base_dData_dPair.f_Base_dData_dPair_dPair_first = dtb__140; Base_dData_dPair.f_Base_dData_dPair_dPair_second = dtb__141 } -> (Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Just ({ Base_dData_dPair.f_Base_dData_dPair_dPair_first = (Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dTerm_TMk (dtb__137, dtb__140)); Base_dData_dPair.f_Base_dData_dPair_dPair_second = dtb__141 }))
  | _ -> failwith "DT: impossible branch"
)
  | Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Nothing -> Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Nothing
  | _ -> failwith "DT: impossible branch"
)) (((Vuna_dCompiler_dBase_dBytes.v_Vuna_dCompiler_dBase_dBytes_ddecList v_Vuna_dCompiler_dCore_dCanonical_ddecArg) (fuel - 1)) dtb__138))
  | _ -> failwith "DT: impossible branch"
)
  | Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Nothing -> Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Nothing
  | _ -> failwith "DT: impossible branch"
)) ((Vuna_dCompiler_dBase_dBytes.v_Vuna_dCompiler_dBase_dBytes_ddecStr (fuel - 1)) dtb__81)) else (if (dtb__80 = 9) then ((fun nd_uscrut9 -> (match nd_uscrut9 with
  | Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Just (dtb__142) -> (match dtb__142 with
  | { Base_dData_dPair.f_Base_dData_dPair_dPair_first = dtb__143; Base_dData_dPair.f_Base_dData_dPair_dPair_second = dtb__144 } -> ((fun nd_uscrut16 -> (match nd_uscrut16 with
  | Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Just (dtb__145) -> (match dtb__145 with
  | { Base_dData_dPair.f_Base_dData_dPair_dPair_first = dtb__146; Base_dData_dPair.f_Base_dData_dPair_dPair_second = dtb__147 } -> (Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Just ({ Base_dData_dPair.f_Base_dData_dPair_dPair_first = (Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dTerm_TCase (dtb__143, dtb__146)); Base_dData_dPair.f_Base_dData_dPair_dPair_second = dtb__147 }))
  | _ -> failwith "DT: impossible branch"
)
  | Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Nothing -> Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Nothing
  | _ -> failwith "DT: impossible branch"
)) (((Vuna_dCompiler_dBase_dBytes.v_Vuna_dCompiler_dBase_dBytes_ddecList v_Vuna_dCompiler_dCore_dCanonical_ddecAlt) (fuel - 1)) dtb__144))
  | _ -> failwith "DT: impossible branch"
)
  | Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Nothing -> Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Nothing
  | _ -> failwith "DT: impossible branch"
)) ((v_Vuna_dCompiler_dCore_dCanonical_ddecTerm (fuel - 1)) dtb__81)) else (if (dtb__80 = 10) then ((fun nd_uscrut9 -> (match nd_uscrut9 with
  | Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Just (dtb__148) -> (match dtb__148 with
  | { Base_dData_dPair.f_Base_dData_dPair_dPair_first = dtb__149; Base_dData_dPair.f_Base_dData_dPair_dPair_second = dtb__150 } -> ((fun nd_uscrut16 -> (match nd_uscrut16 with
  | Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Just (dtb__151) -> (match dtb__151 with
  | { Base_dData_dPair.f_Base_dData_dPair_dPair_first = dtb__152; Base_dData_dPair.f_Base_dData_dPair_dPair_second = dtb__153 } -> ((fun nd_uscrut23 -> (match nd_uscrut23 with
  | Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Just (dtb__154) -> (match dtb__154 with
  | { Base_dData_dPair.f_Base_dData_dPair_dPair_first = dtb__155; Base_dData_dPair.f_Base_dData_dPair_dPair_second = dtb__156 } -> ((fun nd_uscrut30 -> (match nd_uscrut30 with
  | Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Just (dtb__157) -> (match dtb__157 with
  | { Base_dData_dPair.f_Base_dData_dPair_dPair_first = dtb__158; Base_dData_dPair.f_Base_dData_dPair_dPair_second = dtb__159 } -> ((fun nd_uscrut37 -> (match nd_uscrut37 with
  | Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Just (dtb__160) -> (match dtb__160 with
  | { Base_dData_dPair.f_Base_dData_dPair_dPair_first = dtb__161; Base_dData_dPair.f_Base_dData_dPair_dPair_second = dtb__162 } -> (Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Just ({ Base_dData_dPair.f_Base_dData_dPair_dPair_first = (Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dTerm_TProj (dtb__149, dtb__152, dtb__155, dtb__158, dtb__161)); Base_dData_dPair.f_Base_dData_dPair_dPair_second = dtb__162 }))
  | _ -> failwith "DT: impossible branch"
)
  | Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Nothing -> Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Nothing
  | _ -> failwith "DT: impossible branch"
)) ((Vuna_dCompiler_dBase_dBytes.v_Vuna_dCompiler_dBase_dBytes_ddecInt (fuel - 1)) dtb__159))
  | _ -> failwith "DT: impossible branch"
)
  | Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Nothing -> Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Nothing
  | _ -> failwith "DT: impossible branch"
)) ((Vuna_dCompiler_dBase_dBytes.v_Vuna_dCompiler_dBase_dBytes_ddecInt (fuel - 1)) dtb__156))
  | _ -> failwith "DT: impossible branch"
)
  | Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Nothing -> Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Nothing
  | _ -> failwith "DT: impossible branch"
)) (((Vuna_dCompiler_dBase_dBytes.v_Vuna_dCompiler_dBase_dBytes_ddecList v_Vuna_dCompiler_dCore_dCanonical_ddecBinder) (fuel - 1)) dtb__153))
  | _ -> failwith "DT: impossible branch"
)
  | Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Nothing -> Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Nothing
  | _ -> failwith "DT: impossible branch"
)) ((Vuna_dCompiler_dBase_dBytes.v_Vuna_dCompiler_dBase_dBytes_ddecStr (fuel - 1)) dtb__150))
  | _ -> failwith "DT: impossible branch"
)
  | Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Nothing -> Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Nothing
  | _ -> failwith "DT: impossible branch"
)) ((v_Vuna_dCompiler_dCore_dCanonical_ddecTerm (fuel - 1)) dtb__81)) else (if (dtb__80 = 11) then ((fun nd_uscrut9 -> (match nd_uscrut9 with
  | Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Just (dtb__163) -> (match dtb__163 with
  | { Base_dData_dPair.f_Base_dData_dPair_dPair_first = dtb__164; Base_dData_dPair.f_Base_dData_dPair_dPair_second = dtb__165 } -> ((fun nd_uscrut16 -> (match nd_uscrut16 with
  | Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Just (dtb__166) -> (match dtb__166 with
  | { Base_dData_dPair.f_Base_dData_dPair_dPair_first = dtb__167; Base_dData_dPair.f_Base_dData_dPair_dPair_second = dtb__168 } -> ((fun nd_uscrut23 -> (match nd_uscrut23 with
  | Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Just (dtb__169) -> (match dtb__169 with
  | { Base_dData_dPair.f_Base_dData_dPair_dPair_first = dtb__170; Base_dData_dPair.f_Base_dData_dPair_dPair_second = dtb__171 } -> ((fun nd_uscrut30 -> (match nd_uscrut30 with
  | Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Just (dtb__172) -> (match dtb__172 with
  | { Base_dData_dPair.f_Base_dData_dPair_dPair_first = dtb__173; Base_dData_dPair.f_Base_dData_dPair_dPair_second = dtb__174 } -> ((fun nd_uscrut37 -> (match nd_uscrut37 with
  | Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Just (dtb__175) -> (match dtb__175 with
  | { Base_dData_dPair.f_Base_dData_dPair_dPair_first = dtb__176; Base_dData_dPair.f_Base_dData_dPair_dPair_second = dtb__177 } -> (Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Just ({ Base_dData_dPair.f_Base_dData_dPair_dPair_first = (Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dTerm_TRecUpd (dtb__164, dtb__167, dtb__170, dtb__173, dtb__176)); Base_dData_dPair.f_Base_dData_dPair_dPair_second = dtb__177 }))
  | _ -> failwith "DT: impossible branch"
)
  | Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Nothing -> Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Nothing
  | _ -> failwith "DT: impossible branch"
)) ((v_Vuna_dCompiler_dCore_dCanonical_ddecTerm (fuel - 1)) dtb__174))
  | _ -> failwith "DT: impossible branch"
)
  | Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Nothing -> Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Nothing
  | _ -> failwith "DT: impossible branch"
)) (((Vuna_dCompiler_dBase_dBytes.v_Vuna_dCompiler_dBase_dBytes_ddecList Vuna_dCompiler_dBase_dBytes.v_Vuna_dCompiler_dBase_dBytes_ddecInt) (fuel - 1)) dtb__171))
  | _ -> failwith "DT: impossible branch"
)
  | Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Nothing -> Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Nothing
  | _ -> failwith "DT: impossible branch"
)) (((Vuna_dCompiler_dBase_dBytes.v_Vuna_dCompiler_dBase_dBytes_ddecList v_Vuna_dCompiler_dCore_dCanonical_ddecBinder) (fuel - 1)) dtb__168))
  | _ -> failwith "DT: impossible branch"
)
  | Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Nothing -> Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Nothing
  | _ -> failwith "DT: impossible branch"
)) ((Vuna_dCompiler_dBase_dBytes.v_Vuna_dCompiler_dBase_dBytes_ddecStr (fuel - 1)) dtb__165))
  | _ -> failwith "DT: impossible branch"
)
  | Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Nothing -> Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Nothing
  | _ -> failwith "DT: impossible branch"
)) ((v_Vuna_dCompiler_dCore_dCanonical_ddecTerm (fuel - 1)) dtb__81)) else (if (dtb__80 = 12) then ((fun nd_uscrut9 -> (match nd_uscrut9 with
  | Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Just (dtb__178) -> (match dtb__178 with
  | { Base_dData_dPair.f_Base_dData_dPair_dPair_first = dtb__179; Base_dData_dPair.f_Base_dData_dPair_dPair_second = dtb__180 } -> (Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Just ({ Base_dData_dPair.f_Base_dData_dPair_dPair_first = (Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dTerm_TInt (dtb__179)); Base_dData_dPair.f_Base_dData_dPair_dPair_second = dtb__180 }))
  | _ -> failwith "DT: impossible branch"
)
  | Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Nothing -> Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Nothing
  | _ -> failwith "DT: impossible branch"
)) ((Vuna_dCompiler_dBase_dBytes.v_Vuna_dCompiler_dBase_dBytes_ddecInt (fuel - 1)) dtb__81)) else (if (dtb__80 = 13) then ((fun nd_uscrut9 -> (match nd_uscrut9 with
  | Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Just (dtb__181) -> (match dtb__181 with
  | { Base_dData_dPair.f_Base_dData_dPair_dPair_first = dtb__182; Base_dData_dPair.f_Base_dData_dPair_dPair_second = dtb__183 } -> (Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Just ({ Base_dData_dPair.f_Base_dData_dPair_dPair_first = (Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dTerm_TStr (dtb__182)); Base_dData_dPair.f_Base_dData_dPair_dPair_second = dtb__183 }))
  | _ -> failwith "DT: impossible branch"
)
  | Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Nothing -> Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Nothing
  | _ -> failwith "DT: impossible branch"
)) ((Vuna_dCompiler_dBase_dBytes.v_Vuna_dCompiler_dBase_dBytes_ddecStr (fuel - 1)) dtb__81)) else (if (dtb__80 = 14) then ((fun nd_uscrut9 -> (match nd_uscrut9 with
  | Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Just (dtb__184) -> (match dtb__184 with
  | { Base_dData_dPair.f_Base_dData_dPair_dPair_first = dtb__185; Base_dData_dPair.f_Base_dData_dPair_dPair_second = dtb__186 } -> (Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Just ({ Base_dData_dPair.f_Base_dData_dPair_dPair_first = (Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dTerm_TBool (dtb__185)); Base_dData_dPair.f_Base_dData_dPair_dPair_second = dtb__186 }))
  | _ -> failwith "DT: impossible branch"
)
  | Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Nothing -> Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Nothing
  | _ -> failwith "DT: impossible branch"
)) ((Vuna_dCompiler_dBase_dBytes.v_Vuna_dCompiler_dBase_dBytes_ddecBool (fuel - 1)) dtb__81)) else (if (dtb__80 = 15) then ((fun nd_uscrut9 -> (match nd_uscrut9 with
  | Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Just (dtb__187) -> (match dtb__187 with
  | { Base_dData_dPair.f_Base_dData_dPair_dPair_first = dtb__188; Base_dData_dPair.f_Base_dData_dPair_dPair_second = dtb__189 } -> ((fun nd_uscrut16 -> (match nd_uscrut16 with
  | Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Just (dtb__190) -> (match dtb__190 with
  | { Base_dData_dPair.f_Base_dData_dPair_dPair_first = dtb__191; Base_dData_dPair.f_Base_dData_dPair_dPair_second = dtb__192 } -> ((fun nd_uscrut23 -> (match nd_uscrut23 with
  | Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Just (dtb__193) -> (match dtb__193 with
  | { Base_dData_dPair.f_Base_dData_dPair_dPair_first = dtb__194; Base_dData_dPair.f_Base_dData_dPair_dPair_second = dtb__195 } -> (Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Just ({ Base_dData_dPair.f_Base_dData_dPair_dPair_first = (Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dTerm_TIf (dtb__188, dtb__191, dtb__194)); Base_dData_dPair.f_Base_dData_dPair_dPair_second = dtb__195 }))
  | _ -> failwith "DT: impossible branch"
)
  | Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Nothing -> Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Nothing
  | _ -> failwith "DT: impossible branch"
)) ((v_Vuna_dCompiler_dCore_dCanonical_ddecTerm (fuel - 1)) dtb__192))
  | _ -> failwith "DT: impossible branch"
)
  | Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Nothing -> Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Nothing
  | _ -> failwith "DT: impossible branch"
)) ((v_Vuna_dCompiler_dCore_dCanonical_ddecTerm (fuel - 1)) dtb__189))
  | _ -> failwith "DT: impossible branch"
)
  | Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Nothing -> Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Nothing
  | _ -> failwith "DT: impossible branch"
)) ((v_Vuna_dCompiler_dCore_dCanonical_ddecTerm (fuel - 1)) dtb__81)) else (if (dtb__80 = 16) then ((fun nd_uscrut9 -> (match nd_uscrut9 with
  | Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Just (dtb__196) -> (match dtb__196 with
  | { Base_dData_dPair.f_Base_dData_dPair_dPair_first = dtb__197; Base_dData_dPair.f_Base_dData_dPair_dPair_second = dtb__198 } -> (Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Just ({ Base_dData_dPair.f_Base_dData_dPair_dPair_first = (Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dTerm_TFloat (dtb__197)); Base_dData_dPair.f_Base_dData_dPair_dPair_second = dtb__198 }))
  | _ -> failwith "DT: impossible branch"
)
  | Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Nothing -> Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Nothing
  | _ -> failwith "DT: impossible branch"
)) ((Vuna_dCompiler_dBase_dBytes.v_Vuna_dCompiler_dBase_dBytes_ddecStr (fuel - 1)) dtb__81)) else (if (dtb__80 = 17) then ((fun nd_uscrut9 -> (match nd_uscrut9 with
  | Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Just (dtb__199) -> (match dtb__199 with
  | { Base_dData_dPair.f_Base_dData_dPair_dPair_first = dtb__200; Base_dData_dPair.f_Base_dData_dPair_dPair_second = dtb__201 } -> ((fun nd_uscrut16 -> (match nd_uscrut16 with
  | Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Just (dtb__202) -> (match dtb__202 with
  | { Base_dData_dPair.f_Base_dData_dPair_dPair_first = dtb__203; Base_dData_dPair.f_Base_dData_dPair_dPair_second = dtb__204 } -> (Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Just ({ Base_dData_dPair.f_Base_dData_dPair_dPair_first = (Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dTerm_TRecord (dtb__200, dtb__203)); Base_dData_dPair.f_Base_dData_dPair_dPair_second = dtb__204 }))
  | _ -> failwith "DT: impossible branch"
)
  | Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Nothing -> Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Nothing
  | _ -> failwith "DT: impossible branch"
)) (((Vuna_dCompiler_dBase_dBytes.v_Vuna_dCompiler_dBase_dBytes_ddecList v_Vuna_dCompiler_dCore_dCanonical_ddecArg) (fuel - 1)) dtb__201))
  | _ -> failwith "DT: impossible branch"
)
  | Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Nothing -> Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Nothing
  | _ -> failwith "DT: impossible branch"
)) ((Vuna_dCompiler_dBase_dBytes.v_Vuna_dCompiler_dBase_dBytes_ddecStr (fuel - 1)) dtb__81)) else Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Nothing))))))))))))))))))
  | _ -> failwith "DT: impossible branch"
)
  | Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Nothing -> Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Nothing
  | _ -> failwith "DT: impossible branch"
)) ((Vuna_dCompiler_dBase_dBytes.v_Vuna_dCompiler_dBase_dBytes_ddecTag fuel) bytes))))

# 318 "Vuna/Compiler/Core/Canonical.vuna"
let v_Vuna_dCompiler_dCore_dCanonical_ddecTermComplete = (fun (s : string) -> ((fun nd_uscrut1 -> (match nd_uscrut1 with
  | Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Just (dtb__205) -> (match dtb__205 with
  | { Base_dData_dPair.f_Base_dData_dPair_dPair_first = dtb__206; Base_dData_dPair.f_Base_dData_dPair_dPair_second = dtb__207 } -> (if (Vuna_dCompiler_dBase_dBytes.v_Vuna_dCompiler_dBase_dBytes_dcurAtEnd dtb__207) then (Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Just (dtb__206)) else Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Nothing)
  | _ -> failwith "DT: impossible branch"
)
  | Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Nothing -> Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Nothing
  | _ -> failwith "DT: impossible branch"
)) ((v_Vuna_dCompiler_dCore_dCanonical_ddecTerm (bi_strLength s)) (Vuna_dCompiler_dBase_dBytes.v_Vuna_dCompiler_dBase_dBytes_dcurOf s))))
