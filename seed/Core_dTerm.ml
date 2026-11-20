open Vuna_runtime
type t_Rig = C_Rig_Rig0 | C_Rig_Rig1 | C_Rig_RigOmega
and t_Level = int
and t_Term = C_Term_TVar of (string) * (int) * (Base_dSource.t_Span) | C_Term_TMeta of (int) | C_Term_TGlobal of (string) | C_Term_TType of (t_Level) | C_Term_TPi of (string) * (bool) * (t_Rig) * (t_Term) * (t_Term) | C_Term_TLam of (string) * (t_Rig) * ((t_Term B_dData_dMaybe.t_Maybe, t_Term B_dData_dMaybe.t_Maybe) B_dData_dPair.t_Pair B_dData_dMaybe.t_Maybe) * (Base_dSource.t_Span) * (t_Term) | C_Term_TApp of (t_Term) * (t_Term) * (t_Rig) | C_Term_TCon of (string) * ((t_Term, t_Rig) B_dData_dPair.t_Pair B_dData_dList.t_List) | C_Term_TMk of (string) * ((t_Term, t_Rig) B_dData_dPair.t_Pair B_dData_dList.t_List) | C_Term_TCase of (t_Term) * (t_CaseAlt B_dData_dList.t_List) | C_Term_TProj of (t_Term) * (string) * ((string, t_Rig) B_dData_dPair.t_Pair B_dData_dList.t_List) * (int) * (int) | C_Term_TRecUpd of (t_Term) * (string) * ((string, t_Rig) B_dData_dPair.t_Pair B_dData_dList.t_List) * (int B_dData_dList.t_List) * (t_Term) | C_Term_TInt of (int) | C_Term_TStr of (string) | C_Term_TBool of (bool) | C_Term_TIf of (t_Term) * (t_Term) * (t_Term) | C_Term_TFloat of (string) | C_Term_TRecord of (string) * ((t_Term, t_Rig) B_dData_dPair.t_Pair B_dData_dList.t_List)
and t_Binder = { f_Binder_binderName : string; f_Binder_binderRig : t_Rig; f_Binder_binderSpan : Base_dSource.t_Span }
and t_CaseAlt = { f_CaseAlt_caseAltName : string; f_CaseAlt_caseAltBinders : t_Binder B_dData_dList.t_List; f_CaseAlt_caseAltBody : t_Term }
and t_Closure = { f_Closure_closureEnv : t_Value B_dData_dList.t_List; f_Closure_closureBody : t_Term }
and t_Neutral = C_Neutral_NVar of (string) * (int) * (t_Value B_dData_dList.t_List) | C_Neutral_NGlobal of (string) * (t_Value B_dData_dList.t_List)
and t_Value = C_Value_VType of (t_Level) | C_Value_VPi of (string) * (bool) * (t_Rig) * (t_Value) * (t_Closure) | C_Value_VLam of (string) * (t_Rig) * (t_Closure) | C_Value_VNeutral of (t_Neutral) | C_Value_VMeta of (int) * (t_Value B_dData_dList.t_List) | C_Value_VApp of (t_Value) * (t_Value) | C_Value_VCon of (string) * (t_Value B_dData_dList.t_List) | C_Value_VCase of (t_Value) * (t_VCaseAlt B_dData_dList.t_List) | C_Value_VProj of (t_Value) * (string) * ((string, t_Rig) B_dData_dPair.t_Pair B_dData_dList.t_List) * (int) * (int) | C_Value_VInt of (int) | C_Value_VStr of (string) | C_Value_VBool of (bool) | C_Value_VIf of (t_Value) * (t_Value) * (t_Value) | C_Value_VFloat of (string)
and t_VCaseAlt = { f_VCaseAlt_vCaseAltName : string; f_VCaseAlt_vCaseAltBinders : (string, t_Rig) B_dData_dPair.t_Pair B_dData_dList.t_List; f_VCaseAlt_vCaseAltClosure : t_Closure }
and t_Sols = { f_Sols_solsTbl : (int, t_Value) B_dContainer_dHashMap.t_HashMap; f_Sols_solsList : (int, t_Value) B_dData_dPair.t_Pair B_dData_dList.t_List; f_Sols_solsDepth : (int, int) B_dContainer_dHashMap.t_HashMap }

# 35 "Vuna/Compiler/Core/Term.vuna"
let v_rigIsErased = (fun (mc0 : t_Rig) -> (match mc0 with
  | C_Rig_RigOmega -> false
  | C_Rig_Rig1 -> false
  | C_Rig_Rig0 -> true
  | _ -> failwith "DT: impossible branch"
))

# 40 "Vuna/Compiler/Core/Term.vuna"
let v_rigIsLinear = (fun (mc0 : t_Rig) -> (match mc0 with
  | C_Rig_Rig1 -> true
  | _ -> false
))

# 44 "Vuna/Compiler/Core/Term.vuna"
let v_rigIsOmega = (fun (mc0 : t_Rig) -> (match mc0 with
  | C_Rig_RigOmega -> true
  | _ -> false
))

# 50 "Vuna/Compiler/Core/Term.vuna"
let v_rigOfBinder = (fun (mc0 : bool) (mc1 : bool) -> (if mc0 then C_Rig_Rig0 else (if mc1 then C_Rig_Rig0 else C_Rig_RigOmega)))

# 55 "Vuna/Compiler/Core/Term.vuna"
let v_defaultExplicitRig = C_Rig_RigOmega

# 62 "Vuna/Compiler/Core/Term.vuna"
let v_rigAdd = (fun (mc0 : t_Rig) (mc1 : t_Rig) -> (match mc0 with
  | C_Rig_Rig1 -> (match mc1 with
  | C_Rig_Rig1 -> C_Rig_RigOmega
  | C_Rig_Rig0 -> mc0
  | _ -> C_Rig_RigOmega
)
  | C_Rig_Rig0 -> mc1
  | _ -> (match mc1 with
  | C_Rig_Rig0 -> mc0
  | _ -> C_Rig_RigOmega
)
))

# 68 "Vuna/Compiler/Core/Term.vuna"
let v_rigScale = (fun (mc0 : t_Rig) (mc1 : t_Rig) -> (match mc0 with
  | C_Rig_RigOmega -> (match mc1 with
  | C_Rig_Rig0 -> C_Rig_Rig0
  | _ -> C_Rig_RigOmega
)
  | C_Rig_Rig1 -> (match mc1 with
  | C_Rig_Rig0 -> C_Rig_Rig0
  | _ -> mc1
)
  | C_Rig_Rig0 -> C_Rig_Rig0
  | _ -> failwith "DT: impossible branch"
))

# 74 "Vuna/Compiler/Core/Term.vuna"
let v_rigJoin = (fun (mc0 : t_Rig) (mc1 : t_Rig) -> (match mc0 with
  | C_Rig_RigOmega -> C_Rig_RigOmega
  | C_Rig_Rig1 -> (match mc1 with
  | C_Rig_RigOmega -> C_Rig_RigOmega
  | C_Rig_Rig1 -> C_Rig_Rig1
  | _ -> C_Rig_RigOmega
)
  | C_Rig_Rig0 -> (match mc1 with
  | C_Rig_RigOmega -> C_Rig_RigOmega
  | C_Rig_Rig0 -> C_Rig_Rig0
  | _ -> C_Rig_RigOmega
)
  | _ -> failwith "DT: impossible branch"
))

# 82 "Vuna/Compiler/Core/Term.vuna"
let v_rigExact = (fun (mc0 : t_Rig) (mc1 : t_Rig) -> (match mc0 with
  | C_Rig_RigOmega -> true
  | C_Rig_Rig1 -> (match mc1 with
  | C_Rig_Rig1 -> true
  | _ -> false
)
  | C_Rig_Rig0 -> (match mc1 with
  | C_Rig_Rig0 -> true
  | _ -> false
)
  | _ -> failwith "DT: impossible branch"
))

# 89 "Vuna/Compiler/Core/Term.vuna"
let v_showRig = (fun (mc0 : t_Rig) -> (match mc0 with
  | C_Rig_RigOmega -> "\207\137"
  | C_Rig_Rig1 -> "1"
  | C_Rig_Rig0 -> "0"
  | _ -> failwith "DT: impossible branch"
))

# 100 "Vuna/Compiler/Core/Term.vuna"
let v_levelZero = 0

# 103 "Vuna/Compiler/Core/Term.vuna"
let v_levelSucc = (fun (mc0 : t_Level) -> (let dtb__0 = mc0 in (dtb__0 + 1)))

# 106 "Vuna/Compiler/Core/Term.vuna"
let v_levelMax = (fun (mc0 : t_Level) (mc1 : t_Level) -> (let dtb__1 = mc0 in (let dtb__2 = mc1 in (if (dtb__1 >= dtb__2) then dtb__1 else dtb__2))))

# 109 "Vuna/Compiler/Core/Term.vuna"
let v_levelToInt = (fun (mc0 : t_Level) -> (let dtb__3 = mc0 in dtb__3))

# 113 "Vuna/Compiler/Core/Term.vuna"
let v_levelOfInt = (fun (n : int) -> n)

# 116 "Vuna/Compiler/Core/Term.vuna"
let v_levelEq = (fun (mc0 : t_Level) (mc1 : t_Level) -> (let dtb__4 = mc0 in (let dtb__5 = mc1 in (dtb__4 = dtb__5))))

# 119 "Vuna/Compiler/Core/Term.vuna"
let v_levelLt = (fun (mc0 : t_Level) (mc1 : t_Level) -> (let dtb__6 = mc0 in (let dtb__7 = mc1 in (dtb__6 < dtb__7))))

# 166 "Vuna/Compiler/Core/Term.vuna"
let v_binderNameOf = (fun (mc0 : t_Binder) -> (match mc0 with
  | { f_Binder_binderName = dtb__8; f_Binder_binderRig = dtb__9; f_Binder_binderSpan = dtb__10 } -> dtb__8
  | _ -> failwith "DT: impossible branch"
))

# 169 "Vuna/Compiler/Core/Term.vuna"
let v_binderRigOf = (fun (mc0 : t_Binder) -> (match mc0 with
  | { f_Binder_binderName = dtb__11; f_Binder_binderRig = dtb__12; f_Binder_binderSpan = dtb__13 } -> dtb__12
  | _ -> failwith "DT: impossible branch"
))

# 172 "Vuna/Compiler/Core/Term.vuna"
let v_binderSpanOf = (fun (mc0 : t_Binder) -> (match mc0 with
  | { f_Binder_binderName = dtb__14; f_Binder_binderRig = dtb__15; f_Binder_binderSpan = dtb__16 } -> dtb__16
  | _ -> failwith "DT: impossible branch"
))

# 176 "Vuna/Compiler/Core/Term.vuna"
let v_binderPair = (fun (b : t_Binder) -> { B_dData_dPair.f_Pair_first = (v_binderNameOf b); B_dData_dPair.f_Pair_second = (v_binderRigOf b) })

# 179 "Vuna/Compiler/Core/Term.vuna"
let v_binderPairs = (fun (bs : t_Binder B_dData_dList.t_List) -> ((B_dData_dList.v_map v_binderPair) bs))

# 183 "Vuna/Compiler/Core/Term.vuna"
let v_binderOfPair = (fun (mc0 : (string, t_Rig) B_dData_dPair.t_Pair) -> (match mc0 with
  | { B_dData_dPair.f_Pair_first = dtb__17; B_dData_dPair.f_Pair_second = dtb__18 } -> { f_Binder_binderName = dtb__17; f_Binder_binderRig = dtb__18; f_Binder_binderSpan = Base_dSource.v_spanEmpty }
  | _ -> failwith "DT: impossible branch"
))

# 186 "Vuna/Compiler/Core/Term.vuna"
let v_bindersOfPairs = (fun (ps : (string, t_Rig) B_dData_dPair.t_Pair B_dData_dList.t_List) -> ((B_dData_dList.v_map v_binderOfPair) ps))

# 195 "Vuna/Compiler/Core/Term.vuna"
let v_caseAltName = (fun (mc0 : t_CaseAlt) -> (match mc0 with
  | { f_CaseAlt_caseAltName = dtb__19; f_CaseAlt_caseAltBinders = dtb__20; f_CaseAlt_caseAltBody = dtb__21 } -> dtb__19
  | _ -> failwith "DT: impossible branch"
))

# 198 "Vuna/Compiler/Core/Term.vuna"
let v_caseAltBinders = (fun (mc0 : t_CaseAlt) -> (match mc0 with
  | { f_CaseAlt_caseAltName = dtb__22; f_CaseAlt_caseAltBinders = dtb__23; f_CaseAlt_caseAltBody = dtb__24 } -> dtb__23
  | _ -> failwith "DT: impossible branch"
))

# 201 "Vuna/Compiler/Core/Term.vuna"
let v_caseAltBody = (fun (mc0 : t_CaseAlt) -> (match mc0 with
  | { f_CaseAlt_caseAltName = dtb__25; f_CaseAlt_caseAltBinders = dtb__26; f_CaseAlt_caseAltBody = dtb__27 } -> dtb__27
  | _ -> failwith "DT: impossible branch"
))

# 239 "Vuna/Compiler/Core/Term.vuna"
let v_defaultFuel = 512

# 253 "Vuna/Compiler/Core/Term.vuna"
let v_natChainMax = 4611686018427387903

# 292 "Vuna/Compiler/Core/Term.vuna"
let v_natChainNext = (fun (n : int) -> (if (n >= v_natChainMax) then v_natChainMax else (n + 1)))

# 299 "Vuna/Compiler/Core/Term.vuna"
let rec v_flattenTermAppGo = (fun (mc0 : t_Term) (mc1 : (t_Term, t_Rig) B_dData_dPair.t_Pair B_dData_dList.t_List) -> (match mc0 with
  | C_Term_TRecord (dtb__28, dtb__29) -> { B_dData_dPair.f_Pair_first = (C_Term_TGlobal (dtb__28)); B_dData_dPair.f_Pair_second = ((B_dData_dList.v_append dtb__29) mc1) }
  | C_Term_TApp (dtb__30, dtb__31, dtb__32) -> ((v_flattenTermAppGo dtb__30) (B_dData_dList.C_List__x58__x58_ ({ B_dData_dPair.f_Pair_first = dtb__31; B_dData_dPair.f_Pair_second = dtb__32 }, mc1)))
  | _ -> { B_dData_dPair.f_Pair_first = mc0; B_dData_dPair.f_Pair_second = mc1 }
))

# 296 "Vuna/Compiler/Core/Term.vuna"
let v_flattenTermApp = (fun (t : t_Term) -> ((v_flattenTermAppGo t) B_dData_dList.C_List_Nil))

# 263 "Vuna/Compiler/Core/Term.vuna"
let rec v_natChainGo = (fun (fuel : int) (t : t_Term) -> (if (fuel <= 0) then B_dData_dMaybe.C_Maybe_Nothing else (match (v_flattenTermApp t) with
  | { B_dData_dPair.f_Pair_first = dtb__33; B_dData_dPair.f_Pair_second = dtb__34 } -> (match dtb__33 with
  | C_Term_TCon (dtb__35, dtb__36) -> (((v_natChainArgs (fuel - 1)) dtb__35) ((B_dData_dList.v_append dtb__36) dtb__34))
  | C_Term_TGlobal (dtb__37) -> (((v_natChainArgs (fuel - 1)) dtb__37) dtb__34)
  | _ -> B_dData_dMaybe.C_Maybe_Nothing
)
  | _ -> failwith "DT: impossible branch"
)))
# 275 "Vuna/Compiler/Core/Term.vuna"
and v_natChainArgs = (fun (fuel : int) (c : string) (args : (t_Term, t_Rig) B_dData_dPair.t_Pair B_dData_dList.t_List) -> (if (c = Base_dIntrinsics.v_natZeroCtor) then (match args with
  | B_dData_dList.C_List_Nil -> (B_dData_dMaybe.C_Maybe_Just (0))
  | _ -> B_dData_dMaybe.C_Maybe_Nothing
) else (if (c = Base_dIntrinsics.v_natSuccCtor) then ((fun nd_uscrut3 -> (match nd_uscrut3 with
  | B_dData_dList.C_List__x58__x58_ (dtb__38, dtb__39) -> (match dtb__38 with
  | { B_dData_dPair.f_Pair_first = dtb__40; B_dData_dPair.f_Pair_second = dtb__41 } -> (match dtb__39 with
  | B_dData_dList.C_List_Nil -> (match ((v_natChainGo fuel) dtb__40) with
  | B_dData_dMaybe.C_Maybe_Just (dtb__42) -> (B_dData_dMaybe.C_Maybe_Just ((v_natChainNext dtb__42)))
  | B_dData_dMaybe.C_Maybe_Nothing -> B_dData_dMaybe.C_Maybe_Nothing
  | _ -> failwith "DT: impossible branch"
)
  | _ -> B_dData_dMaybe.C_Maybe_Nothing
)
  | _ -> failwith "DT: impossible branch"
)
  | _ -> B_dData_dMaybe.C_Maybe_Nothing
)) args) else B_dData_dMaybe.C_Maybe_Nothing)))

# 260 "Vuna/Compiler/Core/Term.vuna"
let v_natChainValue = (fun (t : t_Term) -> ((v_natChainGo 1000000) t))

# 316 "Vuna/Compiler/Core/Term.vuna"
let v_termSizeCap = 1000000

# 346 "Vuna/Compiler/Core/Term.vuna"
let rec v_termSizeArgTerms = (fun (mc0 : (t_Term, t_Rig) B_dData_dPair.t_Pair B_dData_dList.t_List) -> (match mc0 with
  | B_dData_dList.C_List__x58__x58_ (dtb__43, dtb__44) -> (match dtb__43 with
  | { B_dData_dPair.f_Pair_first = dtb__45; B_dData_dPair.f_Pair_second = dtb__46 } -> (B_dData_dList.C_List__x58__x58_ (dtb__45, (v_termSizeArgTerms dtb__44)))
  | _ -> failwith "DT: impossible branch"
)
  | B_dData_dList.C_List_Nil -> B_dData_dList.C_List_Nil
  | _ -> failwith "DT: impossible branch"
))

# 350 "Vuna/Compiler/Core/Term.vuna"
let rec v_termSizeAltTerms = (fun (mc0 : t_CaseAlt B_dData_dList.t_List) -> (match mc0 with
  | B_dData_dList.C_List__x58__x58_ (dtb__47, dtb__48) -> (B_dData_dList.C_List__x58__x58_ ((v_caseAltBody dtb__47), (v_termSizeAltTerms dtb__48)))
  | B_dData_dList.C_List_Nil -> B_dData_dList.C_List_Nil
  | _ -> failwith "DT: impossible branch"
))

# 358 "Vuna/Compiler/Core/Term.vuna"
let v_termSizeMaybeTerms = (fun (mc0 : t_Term B_dData_dMaybe.t_Maybe) -> (match mc0 with
  | B_dData_dMaybe.C_Maybe_Just (dtb__49) -> (B_dData_dList.C_List__x58__x58_ (dtb__49, B_dData_dList.C_List_Nil))
  | B_dData_dMaybe.C_Maybe_Nothing -> B_dData_dList.C_List_Nil
  | _ -> failwith "DT: impossible branch"
))

# 354 "Vuna/Compiler/Core/Term.vuna"
let v_termSizeSlotTerms = (fun (mc0 : (t_Term B_dData_dMaybe.t_Maybe, t_Term B_dData_dMaybe.t_Maybe) B_dData_dPair.t_Pair B_dData_dMaybe.t_Maybe) -> (match mc0 with
  | B_dData_dMaybe.C_Maybe_Just (dtb__50) -> (match dtb__50 with
  | { B_dData_dPair.f_Pair_first = dtb__51; B_dData_dPair.f_Pair_second = dtb__52 } -> ((B_dData_dList.v_append (v_termSizeMaybeTerms dtb__51)) (v_termSizeMaybeTerms dtb__52))
  | _ -> failwith "DT: impossible branch"
)
  | B_dData_dMaybe.C_Maybe_Nothing -> B_dData_dList.C_List_Nil
  | _ -> failwith "DT: impossible branch"
))

# 326 "Vuna/Compiler/Core/Term.vuna"
let v_termSizeWork = (fun (mc0 : t_Term) -> (match mc0 with
  | C_Term_TIf (dtb__53, dtb__54, dtb__55) -> (B_dData_dList.C_List__x58__x58_ (dtb__53, (B_dData_dList.C_List__x58__x58_ (dtb__54, (B_dData_dList.C_List__x58__x58_ (dtb__55, B_dData_dList.C_List_Nil))))))
  | C_Term_TRecUpd (dtb__56, dtb__57, dtb__58, dtb__59, dtb__60) -> (B_dData_dList.C_List__x58__x58_ (dtb__56, (B_dData_dList.C_List__x58__x58_ (dtb__60, B_dData_dList.C_List_Nil))))
  | C_Term_TProj (dtb__61, dtb__62, dtb__63, dtb__64, dtb__65) -> (B_dData_dList.C_List__x58__x58_ (dtb__61, B_dData_dList.C_List_Nil))
  | C_Term_TCase (dtb__66, dtb__67) -> (B_dData_dList.C_List__x58__x58_ (dtb__66, (v_termSizeAltTerms dtb__67)))
  | C_Term_TRecord (dtb__68, dtb__69) -> (v_termSizeArgTerms dtb__69)
  | C_Term_TMk (dtb__70, dtb__71) -> (v_termSizeArgTerms dtb__71)
  | C_Term_TCon (dtb__72, dtb__73) -> (v_termSizeArgTerms dtb__73)
  | C_Term_TApp (dtb__74, dtb__75, dtb__76) -> (B_dData_dList.C_List__x58__x58_ (dtb__74, (B_dData_dList.C_List__x58__x58_ (dtb__75, B_dData_dList.C_List_Nil))))
  | C_Term_TLam (dtb__77, dtb__78, dtb__79, dtb__80, dtb__81) -> ((B_dData_dList.v_append (v_termSizeSlotTerms dtb__79)) (B_dData_dList.C_List__x58__x58_ (dtb__81, B_dData_dList.C_List_Nil)))
  | C_Term_TPi (dtb__82, dtb__83, dtb__84, dtb__85, dtb__86) -> (B_dData_dList.C_List__x58__x58_ (dtb__85, (B_dData_dList.C_List__x58__x58_ (dtb__86, B_dData_dList.C_List_Nil))))
  | C_Term_TBool (dtb__87) -> B_dData_dList.C_List_Nil
  | C_Term_TFloat (dtb__88) -> B_dData_dList.C_List_Nil
  | C_Term_TStr (dtb__89) -> B_dData_dList.C_List_Nil
  | C_Term_TInt (dtb__90) -> B_dData_dList.C_List_Nil
  | C_Term_TType (dtb__91) -> B_dData_dList.C_List_Nil
  | C_Term_TGlobal (dtb__92) -> B_dData_dList.C_List_Nil
  | C_Term_TMeta (dtb__93) -> B_dData_dList.C_List_Nil
  | C_Term_TVar (dtb__94, dtb__95, dtb__96) -> B_dData_dList.C_List_Nil
  | _ -> failwith "DT: impossible branch"
))

# 320 "Vuna/Compiler/Core/Term.vuna"
let rec v_termSizeGo = (fun (mc0 : int) (mc1 : t_Term B_dData_dList.t_List) -> (match mc1 with
  | B_dData_dList.C_List__x58__x58_ (dtb__97, dtb__98) -> (if (mc0 <= 0) then 0 else (1 + ((v_termSizeGo (mc0 - 1)) ((B_dData_dList.v_append (v_termSizeWork dtb__97)) dtb__98))))
  | B_dData_dList.C_List_Nil -> 0
  | _ -> failwith "DT: impossible branch"
))

# 311 "Vuna/Compiler/Core/Term.vuna"
let v_termSize = (fun (t : t_Term) -> ((v_termSizeGo v_termSizeCap) (B_dData_dList.C_List__x58__x58_ (t, B_dData_dList.C_List_Nil))))

# 366 "Vuna/Compiler/Core/Term.vuna"
let v_metaLookup = (fun (i : int) (t : (int, t_Value) B_dContainer_dHashMap.t_HashMap) -> ((((B_dContainer_dHashMap.v_lookup B_dData_dInt.v_Hashable_uInt) B_dData_dInt.v_Eq_uInt) i) t))

# 370 "Vuna/Compiler/Core/Term.vuna"
let rec v_metaLookupList = (fun (mc0 : int) (mc1 : (int, t_Value) B_dData_dPair.t_Pair B_dData_dList.t_List) -> (match mc1 with
  | B_dData_dList.C_List__x58__x58_ (dtb__99, dtb__100) -> (match dtb__99 with
  | { B_dData_dPair.f_Pair_first = dtb__101; B_dData_dPair.f_Pair_second = dtb__102 } -> (if (mc0 = dtb__101) then (B_dData_dMaybe.C_Maybe_Just (dtb__102)) else ((v_metaLookupList mc0) dtb__100))
  | _ -> failwith "DT: impossible branch"
)
  | B_dData_dList.C_List_Nil -> B_dData_dMaybe.C_Maybe_Nothing
  | _ -> failwith "DT: impossible branch"
))

# 389 "Vuna/Compiler/Core/Term.vuna"
let v_solsEmpty = { f_Sols_solsTbl = (((B_dContainer_dHashMap.v_fromList B_dData_dInt.v_Hashable_uInt) B_dData_dInt.v_Eq_uInt) B_dData_dList.C_List_Nil); f_Sols_solsList = B_dData_dList.C_List_Nil; f_Sols_solsDepth = (((B_dContainer_dHashMap.v_fromList B_dData_dInt.v_Hashable_uInt) B_dData_dInt.v_Eq_uInt) B_dData_dList.C_List_Nil) }

# 392 "Vuna/Compiler/Core/Term.vuna"
let v_solsFromList = (fun (xs : (int, t_Value) B_dData_dPair.t_Pair B_dData_dList.t_List) -> { f_Sols_solsTbl = ((((B_dContainer_dHashMap.v_insertAll B_dData_dInt.v_Hashable_uInt) B_dData_dInt.v_Eq_uInt) xs) (((B_dContainer_dHashMap.v_fromList B_dData_dInt.v_Hashable_uInt) B_dData_dInt.v_Eq_uInt) B_dData_dList.C_List_Nil)); f_Sols_solsList = xs; f_Sols_solsDepth = (((B_dContainer_dHashMap.v_fromList B_dData_dInt.v_Hashable_uInt) B_dData_dInt.v_Eq_uInt) B_dData_dList.C_List_Nil) })

# 396 "Vuna/Compiler/Core/Term.vuna"
let v_solsOf = (fun (t : (int, t_Value) B_dContainer_dHashMap.t_HashMap) (xs : (int, t_Value) B_dData_dPair.t_Pair B_dData_dList.t_List) (d : (int, int) B_dContainer_dHashMap.t_HashMap) -> { f_Sols_solsTbl = t; f_Sols_solsList = xs; f_Sols_solsDepth = d })

# 399 "Vuna/Compiler/Core/Term.vuna"
let v_solsList = (fun (mc0 : t_Sols) -> (match mc0 with
  | { f_Sols_solsTbl = dtb__103; f_Sols_solsList = dtb__104; f_Sols_solsDepth = dtb__105 } -> dtb__104
  | _ -> failwith "DT: impossible branch"
))

# 403 "Vuna/Compiler/Core/Term.vuna"
let v_solsDepth = (fun (mc0 : int) (mc1 : t_Sols) -> (match mc1 with
  | { f_Sols_solsTbl = dtb__106; f_Sols_solsList = dtb__107; f_Sols_solsDepth = dtb__108 } -> ((((B_dContainer_dHashMap.v_lookup B_dData_dInt.v_Hashable_uInt) B_dData_dInt.v_Eq_uInt) mc0) dtb__108)
  | _ -> failwith "DT: impossible branch"
))

# 408 "Vuna/Compiler/Core/Term.vuna"
let v_solsLookup = (fun (mc0 : int) (mc1 : t_Sols) -> (match mc1 with
  | { f_Sols_solsTbl = dtb__109; f_Sols_solsList = dtb__110; f_Sols_solsDepth = dtb__111 } -> ((((B_dContainer_dHashMap.v_lookup B_dData_dInt.v_Hashable_uInt) B_dData_dInt.v_Eq_uInt) mc0) dtb__109)
  | _ -> failwith "DT: impossible branch"
))

# 411 "Vuna/Compiler/Core/Term.vuna"
let v_solsCons = (fun (mc0 : int) (mc1 : t_Value) (mc2 : t_Sols) -> (match mc2 with
  | { f_Sols_solsTbl = dtb__112; f_Sols_solsList = dtb__113; f_Sols_solsDepth = dtb__114 } -> { f_Sols_solsTbl = (((((B_dContainer_dHashMap.v_insert B_dData_dInt.v_Hashable_uInt) B_dData_dInt.v_Eq_uInt) mc0) mc1) dtb__112); f_Sols_solsList = (B_dData_dList.C_List__x58__x58_ ({ B_dData_dPair.f_Pair_first = mc0; B_dData_dPair.f_Pair_second = mc1 }, dtb__113)); f_Sols_solsDepth = dtb__114 }
  | _ -> failwith "DT: impossible branch"
))

# 416 "Vuna/Compiler/Core/Term.vuna"
let rec v_termHasUnsolvedMeta = (fun (mc0 : t_Sols) (mc1 : t_Term) -> (match mc1 with
  | C_Term_TIf (dtb__115, dtb__116, dtb__117) -> (if (if ((v_termHasUnsolvedMeta mc0) dtb__115) then true else ((v_termHasUnsolvedMeta mc0) dtb__116)) then true else ((v_termHasUnsolvedMeta mc0) dtb__117))
  | C_Term_TBool (dtb__118) -> false
  | C_Term_TFloat (dtb__119) -> false
  | C_Term_TStr (dtb__120) -> false
  | C_Term_TInt (dtb__121) -> false
  | C_Term_TCase (dtb__122, dtb__123) -> (if ((v_termHasUnsolvedMeta mc0) dtb__122) then true else ((v_termHasUnsolvedMetaAlts mc0) dtb__123))
  | C_Term_TRecUpd (dtb__124, dtb__125, dtb__126, dtb__127, dtb__128) -> (if ((v_termHasUnsolvedMeta mc0) dtb__124) then true else ((v_termHasUnsolvedMeta mc0) dtb__128))
  | C_Term_TProj (dtb__129, dtb__130, dtb__131, dtb__132, dtb__133) -> ((v_termHasUnsolvedMeta mc0) dtb__129)
  | C_Term_TRecord (dtb__134, dtb__135) -> ((v_termHasUnsolvedMetaArgs mc0) dtb__135)
  | C_Term_TMk (dtb__136, dtb__137) -> ((v_termHasUnsolvedMetaArgs mc0) dtb__137)
  | C_Term_TCon (dtb__138, dtb__139) -> ((v_termHasUnsolvedMetaArgs mc0) dtb__139)
  | C_Term_TApp (dtb__140, dtb__141, dtb__142) -> (if ((v_termHasUnsolvedMeta mc0) dtb__140) then true else ((v_termHasUnsolvedMeta mc0) dtb__141))
  | C_Term_TLam (dtb__143, dtb__144, dtb__145, dtb__146, dtb__147) -> ((fun tys -> (if tys then true else ((v_termHasUnsolvedMeta mc0) dtb__147))) ((fun nd_uscrut7 -> (match nd_uscrut7 with
  | B_dData_dMaybe.C_Maybe_Just (dtb__148) -> (match dtb__148 with
  | { B_dData_dPair.f_Pair_first = dtb__149; B_dData_dPair.f_Pair_second = dtb__150 } -> (if ((v_termHasUnsolvedMetaMaybe mc0) dtb__149) then true else ((v_termHasUnsolvedMetaMaybe mc0) dtb__150))
  | _ -> failwith "DT: impossible branch"
)
  | B_dData_dMaybe.C_Maybe_Nothing -> false
  | _ -> failwith "DT: impossible branch"
)) dtb__145))
  | C_Term_TPi (dtb__151, dtb__152, dtb__153, dtb__154, dtb__155) -> (if ((v_termHasUnsolvedMeta mc0) dtb__154) then true else ((v_termHasUnsolvedMeta mc0) dtb__155))
  | C_Term_TType (dtb__156) -> false
  | C_Term_TGlobal (dtb__157) -> false
  | C_Term_TVar (dtb__158, dtb__159, dtb__160) -> false
  | C_Term_TMeta (dtb__161) -> (match ((v_solsLookup dtb__161) mc0) with
  | B_dData_dMaybe.C_Maybe_Just (dtb__162) -> false
  | B_dData_dMaybe.C_Maybe_Nothing -> true
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
))
# 449 "Vuna/Compiler/Core/Term.vuna"
and v_termHasUnsolvedMetaMaybe = (fun (mc0 : t_Sols) (mc1 : t_Term B_dData_dMaybe.t_Maybe) -> (match mc1 with
  | B_dData_dMaybe.C_Maybe_Just (dtb__163) -> ((v_termHasUnsolvedMeta mc0) dtb__163)
  | B_dData_dMaybe.C_Maybe_Nothing -> false
  | _ -> failwith "DT: impossible branch"
))
# 453 "Vuna/Compiler/Core/Term.vuna"
and v_termHasUnsolvedMetaArgs = (fun (mc0 : t_Sols) (mc1 : (t_Term, t_Rig) B_dData_dPair.t_Pair B_dData_dList.t_List) -> (match mc1 with
  | B_dData_dList.C_List__x58__x58_ (dtb__164, dtb__165) -> (match dtb__164 with
  | { B_dData_dPair.f_Pair_first = dtb__166; B_dData_dPair.f_Pair_second = dtb__167 } -> (if ((v_termHasUnsolvedMeta mc0) dtb__166) then true else ((v_termHasUnsolvedMetaArgs mc0) dtb__165))
  | _ -> failwith "DT: impossible branch"
)
  | B_dData_dList.C_List_Nil -> false
  | _ -> failwith "DT: impossible branch"
))
# 458 "Vuna/Compiler/Core/Term.vuna"
and v_termHasUnsolvedMetaAlts = (fun (mc0 : t_Sols) (mc1 : t_CaseAlt B_dData_dList.t_List) -> (match mc1 with
  | B_dData_dList.C_List__x58__x58_ (dtb__168, dtb__169) -> (if ((v_termHasUnsolvedMeta mc0) (v_caseAltBody dtb__168)) then true else ((v_termHasUnsolvedMetaAlts mc0) dtb__169))
  | B_dData_dList.C_List_Nil -> false
  | _ -> failwith "DT: impossible branch"
))

# 465 "Vuna/Compiler/Core/Term.vuna"
let rec v_termUsesFloat = (fun (mc0 : string B_dData_dList.t_List) (mc1 : t_Term) -> (match mc1 with
  | C_Term_TIf (dtb__170, dtb__171, dtb__172) -> (if (if ((v_termUsesFloat mc0) dtb__170) then true else ((v_termUsesFloat mc0) dtb__171)) then true else ((v_termUsesFloat mc0) dtb__172))
  | C_Term_TBool (dtb__173) -> false
  | C_Term_TStr (dtb__174) -> false
  | C_Term_TInt (dtb__175) -> false
  | C_Term_TCase (dtb__176, dtb__177) -> (if ((v_termUsesFloat mc0) dtb__176) then true else ((v_anyAltUsesFloat mc0) dtb__177))
  | C_Term_TRecUpd (dtb__178, dtb__179, dtb__180, dtb__181, dtb__182) -> (if ((v_termUsesFloat mc0) dtb__178) then true else ((v_termUsesFloat mc0) dtb__182))
  | C_Term_TProj (dtb__183, dtb__184, dtb__185, dtb__186, dtb__187) -> ((v_termUsesFloat mc0) dtb__183)
  | C_Term_TRecord (dtb__188, dtb__189) -> ((v_anyArgUsesFloat mc0) dtb__189)
  | C_Term_TMk (dtb__190, dtb__191) -> ((v_anyArgUsesFloat mc0) dtb__191)
  | C_Term_TCon (dtb__192, dtb__193) -> ((v_anyArgUsesFloat mc0) dtb__193)
  | C_Term_TApp (dtb__194, dtb__195, dtb__196) -> (if ((v_termUsesFloat mc0) dtb__194) then true else ((v_termUsesFloat mc0) dtb__195))
  | C_Term_TLam (dtb__197, dtb__198, dtb__199, dtb__200, dtb__201) -> ((v_termUsesFloat mc0) dtb__201)
  | C_Term_TPi (dtb__202, dtb__203, dtb__204, dtb__205, dtb__206) -> (if ((v_termUsesFloat mc0) dtb__205) then true else ((v_termUsesFloat mc0) dtb__206))
  | C_Term_TType (dtb__207) -> false
  | C_Term_TMeta (dtb__208) -> false
  | C_Term_TVar (dtb__209, dtb__210, dtb__211) -> false
  | C_Term_TGlobal (dtb__212) -> ((B_dData_dList.v_memName dtb__212) mc0)
  | C_Term_TFloat (dtb__213) -> true
  | _ -> failwith "DT: impossible branch"
))
# 488 "Vuna/Compiler/Core/Term.vuna"
and v_anyArgUsesFloat = (fun (mc0 : string B_dData_dList.t_List) (mc1 : (t_Term, t_Rig) B_dData_dPair.t_Pair B_dData_dList.t_List) -> (match mc1 with
  | B_dData_dList.C_List__x58__x58_ (dtb__214, dtb__215) -> (match dtb__214 with
  | { B_dData_dPair.f_Pair_first = dtb__216; B_dData_dPair.f_Pair_second = dtb__217 } -> (if ((v_termUsesFloat mc0) dtb__216) then true else ((v_anyArgUsesFloat mc0) dtb__215))
  | _ -> failwith "DT: impossible branch"
)
  | B_dData_dList.C_List_Nil -> false
  | _ -> failwith "DT: impossible branch"
))
# 493 "Vuna/Compiler/Core/Term.vuna"
and v_anyAltUsesFloat = (fun (mc0 : string B_dData_dList.t_List) (mc1 : t_CaseAlt B_dData_dList.t_List) -> (match mc1 with
  | B_dData_dList.C_List__x58__x58_ (dtb__218, dtb__219) -> (if ((v_termUsesFloat mc0) (v_caseAltBody dtb__218)) then true else ((v_anyAltUsesFloat mc0) dtb__219))
  | B_dData_dList.C_List_Nil -> false
  | _ -> failwith "DT: impossible branch"
))

# 499 "Vuna/Compiler/Core/Term.vuna"
let rec v_termGlobalNames = (fun (mc0 : t_Term) -> (match mc0 with
  | C_Term_TIf (dtb__220, dtb__221, dtb__222) -> ((B_dData_dList.v_append (v_termGlobalNames dtb__220)) ((B_dData_dList.v_append (v_termGlobalNames dtb__221)) (v_termGlobalNames dtb__222)))
  | C_Term_TBool (dtb__223) -> B_dData_dList.C_List_Nil
  | C_Term_TStr (dtb__224) -> B_dData_dList.C_List_Nil
  | C_Term_TInt (dtb__225) -> B_dData_dList.C_List_Nil
  | C_Term_TCase (dtb__226, dtb__227) -> ((B_dData_dList.v_append (v_termGlobalNames dtb__226)) ((B_dData_dList.v_concatMap (fun (a : t_CaseAlt) -> (v_termGlobalNames (v_caseAltBody a)))) dtb__227))
  | C_Term_TRecUpd (dtb__228, dtb__229, dtb__230, dtb__231, dtb__232) -> ((B_dData_dList.v_append (v_termGlobalNames dtb__228)) (v_termGlobalNames dtb__232))
  | C_Term_TProj (dtb__233, dtb__234, dtb__235, dtb__236, dtb__237) -> (v_termGlobalNames dtb__233)
  | C_Term_TRecord (dtb__238, dtb__239) -> (B_dData_dList.C_List__x58__x58_ (dtb__238, ((B_dData_dList.v_concatMap (fun (p : (t_Term, t_Rig) B_dData_dPair.t_Pair) -> (v_termGlobalNames (B_dData_dPair.v_firstOf p)))) dtb__239)))
  | C_Term_TMk (dtb__240, dtb__241) -> ((B_dData_dList.v_concatMap (fun (p : (t_Term, t_Rig) B_dData_dPair.t_Pair) -> (v_termGlobalNames (B_dData_dPair.v_firstOf p)))) dtb__241)
  | C_Term_TCon (dtb__242, dtb__243) -> ((B_dData_dList.v_concatMap (fun (p : (t_Term, t_Rig) B_dData_dPair.t_Pair) -> (v_termGlobalNames (B_dData_dPair.v_firstOf p)))) dtb__243)
  | C_Term_TApp (dtb__244, dtb__245, dtb__246) -> ((B_dData_dList.v_append (v_termGlobalNames dtb__244)) (v_termGlobalNames dtb__245))
  | C_Term_TLam (dtb__247, dtb__248, dtb__249, dtb__250, dtb__251) -> (v_termGlobalNames dtb__251)
  | C_Term_TPi (dtb__252, dtb__253, dtb__254, dtb__255, dtb__256) -> ((B_dData_dList.v_append (v_termGlobalNames dtb__255)) (v_termGlobalNames dtb__256))
  | C_Term_TType (dtb__257) -> B_dData_dList.C_List_Nil
  | C_Term_TMeta (dtb__258) -> B_dData_dList.C_List_Nil
  | C_Term_TVar (dtb__259, dtb__260, dtb__261) -> B_dData_dList.C_List_Nil
  | C_Term_TGlobal (dtb__262) -> (B_dData_dList.C_List__x58__x58_ (dtb__262, B_dData_dList.C_List_Nil))
  | C_Term_TFloat (dtb__263) -> B_dData_dList.C_List_Nil
  | _ -> failwith "DT: impossible branch"
))

# 551 "Vuna/Compiler/Core/Term.vuna"
let rec v_lookupPair = (fun (mc0 : string) (mc1 : (string, t_Term) B_dData_dPair.t_Pair B_dData_dList.t_List) -> (match mc1 with
  | B_dData_dList.C_List__x58__x58_ (dtb__264, dtb__265) -> (match dtb__264 with
  | { B_dData_dPair.f_Pair_first = dtb__266; B_dData_dPair.f_Pair_second = dtb__267 } -> (if (dtb__266 = mc0) then (B_dData_dMaybe.C_Maybe_Just (dtb__267)) else ((v_lookupPair mc0) dtb__265))
  | _ -> failwith "DT: impossible branch"
)
  | B_dData_dList.C_List_Nil -> B_dData_dMaybe.C_Maybe_Nothing
  | _ -> failwith "DT: impossible branch"
))

# 543 "Vuna/Compiler/Core/Term.vuna"
let rec v_bodyTermsOf = (fun (mc0 : (string, t_Term) B_dData_dPair.t_Pair B_dData_dList.t_List) (mc1 : string B_dData_dList.t_List) -> (match mc1 with
  | B_dData_dList.C_List__x58__x58_ (dtb__268, dtb__269) -> (match ((v_lookupPair dtb__268) mc0) with
  | B_dData_dMaybe.C_Maybe_Just (dtb__270) -> (B_dData_dList.C_List__x58__x58_ (dtb__270, ((v_bodyTermsOf mc0) dtb__269)))
  | B_dData_dMaybe.C_Maybe_Nothing -> ((v_bodyTermsOf mc0) dtb__269)
  | _ -> failwith "DT: impossible branch"
)
  | B_dData_dList.C_List_Nil -> B_dData_dList.C_List_Nil
  | _ -> failwith "DT: impossible branch"
))

# 531 "Vuna/Compiler/Core/Term.vuna"
let rec v_reachesTermsFuel = (fun (mc0 : int) (mc1 : (string, t_Term) B_dData_dPair.t_Pair B_dData_dList.t_List) (mc2 : string B_dData_dList.t_List) (mc3 : t_Term B_dData_dList.t_List) -> (match mc3 with
  | B_dData_dList.C_List__x58__x58_ (dtb__271, dtb__272) -> (if (mc0 <= 0) then false else (if ((v_termUsesFloat mc2) dtb__271) then true else ((((v_reachesTermsFuel (mc0 - 1)) mc1) mc2) ((B_dData_dList.v_append dtb__272) ((v_bodyTermsOf mc1) (v_termGlobalNames dtb__271))))))
  | B_dData_dList.C_List_Nil -> false
  | _ -> failwith "DT: impossible branch"
))

# 526 "Vuna/Compiler/Core/Term.vuna"
let v_termReachesFloat = (fun (defs : (string, t_Term) B_dData_dPair.t_Pair B_dData_dList.t_List) (names : string B_dData_dList.t_List) (t : t_Term) -> ((((v_reachesTermsFuel 4096) defs) names) (B_dData_dList.C_List__x58__x58_ (t, B_dData_dList.C_List_Nil))))

# 555 "Vuna/Compiler/Core/Term.vuna"
let v_defLookup = (fun (name : string) (tbl : (string, t_Term) B_dContainer_dHashMap.t_HashMap) -> ((((B_dContainer_dHashMap.v_lookup B_dData_dString.v_Hashable_uString) B_dData_dString.v_Eq_uString) name) tbl))

# 559 "Vuna/Compiler/Core/Term.vuna"
let rec v_hasFreeVar = (fun (mc0 : int) (mc1 : t_Term) -> (match mc1 with
  | C_Term_TIf (dtb__273, dtb__274, dtb__275) -> (if (if ((v_hasFreeVar mc0) dtb__273) then true else ((v_hasFreeVar mc0) dtb__274)) then true else ((v_hasFreeVar mc0) dtb__275))
  | C_Term_TBool (dtb__276) -> false
  | C_Term_TFloat (dtb__277) -> false
  | C_Term_TStr (dtb__278) -> false
  | C_Term_TInt (dtb__279) -> false
  | C_Term_TCase (dtb__280, dtb__281) -> (if ((v_hasFreeVar mc0) dtb__280) then true else ((v_hasFreeVarAlts mc0) dtb__281))
  | C_Term_TRecUpd (dtb__282, dtb__283, dtb__284, dtb__285, dtb__286) -> (if ((v_hasFreeVar mc0) dtb__282) then true else ((v_hasFreeVar (mc0 + (B_dData_dList.v_length dtb__284))) dtb__286))
  | C_Term_TProj (dtb__287, dtb__288, dtb__289, dtb__290, dtb__291) -> ((v_hasFreeVar mc0) dtb__287)
  | C_Term_TRecord (dtb__292, dtb__293) -> ((v_hasFreeVarArgs mc0) dtb__293)
  | C_Term_TMk (dtb__294, dtb__295) -> ((v_hasFreeVarArgs mc0) dtb__295)
  | C_Term_TCon (dtb__296, dtb__297) -> ((v_hasFreeVarArgs mc0) dtb__297)
  | C_Term_TApp (dtb__298, dtb__299, dtb__300) -> (if ((v_hasFreeVar mc0) dtb__298) then true else ((v_hasFreeVar mc0) dtb__299))
  | C_Term_TLam (dtb__301, dtb__302, dtb__303, dtb__304, dtb__305) -> ((fun tys -> (if tys then true else ((v_hasFreeVar (mc0 + 1)) dtb__305))) ((fun nd_uscrut7 -> (match nd_uscrut7 with
  | B_dData_dMaybe.C_Maybe_Just (dtb__306) -> (match dtb__306 with
  | { B_dData_dPair.f_Pair_first = dtb__307; B_dData_dPair.f_Pair_second = dtb__308 } -> (if ((v_hasFreeVarMaybe mc0) dtb__307) then true else ((v_hasFreeVarMaybe (mc0 + 1)) dtb__308))
  | _ -> failwith "DT: impossible branch"
)
  | B_dData_dMaybe.C_Maybe_Nothing -> false
  | _ -> failwith "DT: impossible branch"
)) dtb__303))
  | C_Term_TPi (dtb__309, dtb__310, dtb__311, dtb__312, dtb__313) -> (if ((v_hasFreeVar mc0) dtb__312) then true else ((v_hasFreeVar (mc0 + 1)) dtb__313))
  | C_Term_TType (dtb__314) -> false
  | C_Term_TGlobal (dtb__315) -> false
  | C_Term_TMeta (dtb__316) -> false
  | C_Term_TVar (dtb__317, dtb__318, dtb__319) -> (dtb__318 >= mc0)
  | _ -> failwith "DT: impossible branch"
))
# 587 "Vuna/Compiler/Core/Term.vuna"
and v_hasFreeVarMaybe = (fun (mc0 : int) (mc1 : t_Term B_dData_dMaybe.t_Maybe) -> (match mc1 with
  | B_dData_dMaybe.C_Maybe_Just (dtb__320) -> ((v_hasFreeVar mc0) dtb__320)
  | B_dData_dMaybe.C_Maybe_Nothing -> false
  | _ -> failwith "DT: impossible branch"
))
# 591 "Vuna/Compiler/Core/Term.vuna"
and v_hasFreeVarArgs = (fun (mc0 : int) (mc1 : (t_Term, t_Rig) B_dData_dPair.t_Pair B_dData_dList.t_List) -> (match mc1 with
  | B_dData_dList.C_List__x58__x58_ (dtb__321, dtb__322) -> (match dtb__321 with
  | { B_dData_dPair.f_Pair_first = dtb__323; B_dData_dPair.f_Pair_second = dtb__324 } -> (if ((v_hasFreeVar mc0) dtb__323) then true else ((v_hasFreeVarArgs mc0) dtb__322))
  | _ -> failwith "DT: impossible branch"
)
  | B_dData_dList.C_List_Nil -> false
  | _ -> failwith "DT: impossible branch"
))
# 595 "Vuna/Compiler/Core/Term.vuna"
and v_hasFreeVarAlts = (fun (mc0 : int) (mc1 : t_CaseAlt B_dData_dList.t_List) -> (match mc1 with
  | B_dData_dList.C_List__x58__x58_ (dtb__325, dtb__326) -> (if ((v_hasFreeVar (mc0 + (B_dData_dList.v_length (v_caseAltBinders dtb__325)))) (v_caseAltBody dtb__325)) then true else ((v_hasFreeVarAlts mc0) dtb__326))
  | B_dData_dList.C_List_Nil -> false
  | _ -> failwith "DT: impossible branch"
))

# 600 "Vuna/Compiler/Core/Term.vuna"
let rec v_hasMeta = (fun (mc0 : int) (mc1 : int) (mc2 : t_Term) -> (match mc2 with
  | C_Term_TIf (dtb__327, dtb__328, dtb__329) -> (if (if (((v_hasMeta mc0) mc1) dtb__327) then true else (((v_hasMeta mc0) mc1) dtb__328)) then true else (((v_hasMeta mc0) mc1) dtb__329))
  | C_Term_TBool (dtb__330) -> false
  | C_Term_TFloat (dtb__331) -> false
  | C_Term_TStr (dtb__332) -> false
  | C_Term_TInt (dtb__333) -> false
  | C_Term_TCase (dtb__334, dtb__335) -> (if (((v_hasMeta mc0) mc1) dtb__334) then true else (((v_hasMetaAlts mc0) mc1) dtb__335))
  | C_Term_TRecUpd (dtb__336, dtb__337, dtb__338, dtb__339, dtb__340) -> (if (((v_hasMeta mc0) mc1) dtb__336) then true else (((v_hasMeta mc0) (mc1 + (B_dData_dList.v_length dtb__338))) dtb__340))
  | C_Term_TProj (dtb__341, dtb__342, dtb__343, dtb__344, dtb__345) -> (((v_hasMeta mc0) mc1) dtb__341)
  | C_Term_TRecord (dtb__346, dtb__347) -> (((v_hasMetaArgs mc0) mc1) dtb__347)
  | C_Term_TMk (dtb__348, dtb__349) -> (((v_hasMetaArgs mc0) mc1) dtb__349)
  | C_Term_TCon (dtb__350, dtb__351) -> (((v_hasMetaArgs mc0) mc1) dtb__351)
  | C_Term_TApp (dtb__352, dtb__353, dtb__354) -> (if (((v_hasMeta mc0) mc1) dtb__352) then true else (((v_hasMeta mc0) mc1) dtb__353))
  | C_Term_TLam (dtb__355, dtb__356, dtb__357, dtb__358, dtb__359) -> ((fun tys -> (if tys then true else (((v_hasMeta mc0) (mc1 + 1)) dtb__359))) ((fun nd_uscrut8 -> (match nd_uscrut8 with
  | B_dData_dMaybe.C_Maybe_Just (dtb__360) -> (match dtb__360 with
  | { B_dData_dPair.f_Pair_first = dtb__361; B_dData_dPair.f_Pair_second = dtb__362 } -> (if (((v_hasMetaMaybe mc0) mc1) dtb__361) then true else (((v_hasMetaMaybe mc0) (mc1 + 1)) dtb__362))
  | _ -> failwith "DT: impossible branch"
)
  | B_dData_dMaybe.C_Maybe_Nothing -> false
  | _ -> failwith "DT: impossible branch"
)) dtb__357))
  | C_Term_TPi (dtb__363, dtb__364, dtb__365, dtb__366, dtb__367) -> (if (((v_hasMeta mc0) mc1) dtb__366) then true else (((v_hasMeta mc0) (mc1 + 1)) dtb__367))
  | C_Term_TType (dtb__368) -> false
  | C_Term_TGlobal (dtb__369) -> false
  | C_Term_TVar (dtb__370, dtb__371, dtb__372) -> false
  | C_Term_TMeta (dtb__373) -> (mc0 = dtb__373)
  | _ -> failwith "DT: impossible branch"
))
# 627 "Vuna/Compiler/Core/Term.vuna"
and v_hasMetaMaybe = (fun (mc0 : int) (mc1 : int) (mc2 : t_Term B_dData_dMaybe.t_Maybe) -> (match mc2 with
  | B_dData_dMaybe.C_Maybe_Just (dtb__374) -> (((v_hasMeta mc0) mc1) dtb__374)
  | B_dData_dMaybe.C_Maybe_Nothing -> false
  | _ -> failwith "DT: impossible branch"
))
# 631 "Vuna/Compiler/Core/Term.vuna"
and v_hasMetaArgs = (fun (mc0 : int) (mc1 : int) (mc2 : (t_Term, t_Rig) B_dData_dPair.t_Pair B_dData_dList.t_List) -> (match mc2 with
  | B_dData_dList.C_List__x58__x58_ (dtb__375, dtb__376) -> (match dtb__375 with
  | { B_dData_dPair.f_Pair_first = dtb__377; B_dData_dPair.f_Pair_second = dtb__378 } -> (if (((v_hasMeta mc0) mc1) dtb__377) then true else (((v_hasMetaArgs mc0) mc1) dtb__376))
  | _ -> failwith "DT: impossible branch"
)
  | B_dData_dList.C_List_Nil -> false
  | _ -> failwith "DT: impossible branch"
))
# 635 "Vuna/Compiler/Core/Term.vuna"
and v_hasMetaAlts = (fun (mc0 : int) (mc1 : int) (mc2 : t_CaseAlt B_dData_dList.t_List) -> (match mc2 with
  | B_dData_dList.C_List__x58__x58_ (dtb__379, dtb__380) -> (if (((v_hasMeta mc0) (mc1 + (B_dData_dList.v_length (v_caseAltBinders dtb__379)))) (v_caseAltBody dtb__379)) then true else (((v_hasMetaAlts mc0) mc1) dtb__380))
  | B_dData_dList.C_List_Nil -> false
  | _ -> failwith "DT: impossible branch"
))

# 641 "Vuna/Compiler/Core/Term.vuna"
let v_mapTermMaybe = (fun (mc0 : (t_Term) -> t_Term) (mc1 : t_Term B_dData_dMaybe.t_Maybe) -> (match mc1 with
  | B_dData_dMaybe.C_Maybe_Just (dtb__381) -> (B_dData_dMaybe.C_Maybe_Just ((mc0 dtb__381)))
  | B_dData_dMaybe.C_Maybe_Nothing -> B_dData_dMaybe.C_Maybe_Nothing
  | _ -> failwith "DT: impossible branch"
))

# 652 "Vuna/Compiler/Core/Term.vuna"
let v_lamBinderTyOf = (fun (mc0 : (t_Term B_dData_dMaybe.t_Maybe, t_Term B_dData_dMaybe.t_Maybe) B_dData_dPair.t_Pair B_dData_dMaybe.t_Maybe) -> (match mc0 with
  | B_dData_dMaybe.C_Maybe_Just (dtb__382) -> (B_dData_dPair.v_firstOf dtb__382)
  | B_dData_dMaybe.C_Maybe_Nothing -> B_dData_dMaybe.C_Maybe_Nothing
  | _ -> failwith "DT: impossible branch"
))

# 656 "Vuna/Compiler/Core/Term.vuna"
let v_lamResultTyOf = (fun (mc0 : (t_Term B_dData_dMaybe.t_Maybe, t_Term B_dData_dMaybe.t_Maybe) B_dData_dPair.t_Pair B_dData_dMaybe.t_Maybe) -> (match mc0 with
  | B_dData_dMaybe.C_Maybe_Just (dtb__383) -> (B_dData_dPair.v_secondOf dtb__383)
  | B_dData_dMaybe.C_Maybe_Nothing -> B_dData_dMaybe.C_Maybe_Nothing
  | _ -> failwith "DT: impossible branch"
))

# 660 "Vuna/Compiler/Core/Term.vuna"
let v_lamTyOf = (fun (mc0 : t_Term B_dData_dMaybe.t_Maybe) (mc1 : t_Term B_dData_dMaybe.t_Maybe) -> (match mc0 with
  | B_dData_dMaybe.C_Maybe_Nothing -> (match mc1 with
  | B_dData_dMaybe.C_Maybe_Nothing -> B_dData_dMaybe.C_Maybe_Nothing
  | _ -> (B_dData_dMaybe.C_Maybe_Just ({ B_dData_dPair.f_Pair_first = mc0; B_dData_dPair.f_Pair_second = mc1 }))
)
  | _ -> (B_dData_dMaybe.C_Maybe_Just ({ B_dData_dPair.f_Pair_first = mc0; B_dData_dPair.f_Pair_second = mc1 }))
))

# 664 "Vuna/Compiler/Core/Term.vuna"
let v_lamTyWithBinder = (fun (binderTy : t_Term B_dData_dMaybe.t_Maybe) -> ((v_lamTyOf binderTy) B_dData_dMaybe.C_Maybe_Nothing))

# 667 "Vuna/Compiler/Core/Term.vuna"
let v_lamTyWithResult = (fun (resultTy : t_Term B_dData_dMaybe.t_Maybe) -> ((v_lamTyOf B_dData_dMaybe.C_Maybe_Nothing) resultTy))

# 670 "Vuna/Compiler/Core/Term.vuna"
let v_lamTyMap = (fun (mc0 : (int) -> (t_Term) -> t_Term) (mc1 : int) (mc2 : (t_Term B_dData_dMaybe.t_Maybe, t_Term B_dData_dMaybe.t_Maybe) B_dData_dPair.t_Pair B_dData_dMaybe.t_Maybe) -> (match mc2 with
  | B_dData_dMaybe.C_Maybe_Just (dtb__384) -> ((v_lamTyOf ((v_mapTermMaybe (mc0 mc1)) (B_dData_dPair.v_firstOf dtb__384))) ((v_mapTermMaybe (mc0 (mc1 + 1))) (B_dData_dPair.v_secondOf dtb__384)))
  | B_dData_dMaybe.C_Maybe_Nothing -> B_dData_dMaybe.C_Maybe_Nothing
  | _ -> failwith "DT: impossible branch"
))

# 679 "Vuna/Compiler/Core/Term.vuna"
let rec v_shift = (fun (mc0 : int) (mc1 : int) (mc2 : t_Term) -> (match mc2 with
  | C_Term_TIf (dtb__385, dtb__386, dtb__387) -> (C_Term_TIf ((((v_shift mc0) mc1) dtb__385), (((v_shift mc0) mc1) dtb__386), (((v_shift mc0) mc1) dtb__387)))
  | C_Term_TBool (dtb__388) -> mc2
  | C_Term_TFloat (dtb__389) -> mc2
  | C_Term_TStr (dtb__390) -> mc2
  | C_Term_TInt (dtb__391) -> mc2
  | C_Term_TCase (dtb__392, dtb__393) -> (C_Term_TCase ((((v_shift mc0) mc1) dtb__392), (((v_shiftAlts mc0) mc1) dtb__393)))
  | C_Term_TRecUpd (dtb__394, dtb__395, dtb__396, dtb__397, dtb__398) -> (C_Term_TRecUpd ((((v_shift mc0) mc1) dtb__394), dtb__395, dtb__396, dtb__397, (((v_shift (mc0 + (B_dData_dList.v_length dtb__396))) mc1) dtb__398)))
  | C_Term_TProj (dtb__399, dtb__400, dtb__401, dtb__402, dtb__403) -> (C_Term_TProj ((((v_shift mc0) mc1) dtb__399), dtb__400, dtb__401, dtb__402, dtb__403))
  | C_Term_TRecord (dtb__404, dtb__405) -> (C_Term_TRecord (dtb__404, (((v_shiftArgs mc0) mc1) dtb__405)))
  | C_Term_TMk (dtb__406, dtb__407) -> (C_Term_TMk (dtb__406, (((v_shiftArgs mc0) mc1) dtb__407)))
  | C_Term_TCon (dtb__408, dtb__409) -> (C_Term_TCon (dtb__408, (((v_shiftArgs mc0) mc1) dtb__409)))
  | C_Term_TApp (dtb__410, dtb__411, dtb__412) -> (C_Term_TApp ((((v_shift mc0) mc1) dtb__410), (((v_shift mc0) mc1) dtb__411), dtb__412))
  | C_Term_TLam (dtb__413, dtb__414, dtb__415, dtb__416, dtb__417) -> ((fun slot2 -> (C_Term_TLam (dtb__413, dtb__414, slot2, dtb__416, (((v_shift (mc0 + 1)) mc1) dtb__417)))) ((fun nd_uscrut8 -> (match nd_uscrut8 with
  | B_dData_dMaybe.C_Maybe_Just (dtb__418) -> (match dtb__418 with
  | { B_dData_dPair.f_Pair_first = dtb__419; B_dData_dPair.f_Pair_second = dtb__420 } -> ((v_lamTyOf (match dtb__419 with
  | B_dData_dMaybe.C_Maybe_Nothing -> B_dData_dMaybe.C_Maybe_Nothing
  | B_dData_dMaybe.C_Maybe_Just (dtb__421) -> (B_dData_dMaybe.C_Maybe_Just ((((v_shift mc0) mc1) dtb__421)))
  | _ -> failwith "DT: impossible branch"
)) (match dtb__420 with
  | B_dData_dMaybe.C_Maybe_Nothing -> B_dData_dMaybe.C_Maybe_Nothing
  | B_dData_dMaybe.C_Maybe_Just (dtb__422) -> (B_dData_dMaybe.C_Maybe_Just ((((v_shift (mc0 + 1)) mc1) dtb__422)))
  | _ -> failwith "DT: impossible branch"
))
  | _ -> failwith "DT: impossible branch"
)
  | B_dData_dMaybe.C_Maybe_Nothing -> B_dData_dMaybe.C_Maybe_Nothing
  | _ -> failwith "DT: impossible branch"
)) dtb__415))
  | C_Term_TPi (dtb__423, dtb__424, dtb__425, dtb__426, dtb__427) -> (C_Term_TPi (dtb__423, dtb__424, dtb__425, (((v_shift mc0) mc1) dtb__426), (((v_shift (mc0 + 1)) mc1) dtb__427)))
  | C_Term_TType (dtb__428) -> mc2
  | C_Term_TGlobal (dtb__429) -> mc2
  | C_Term_TMeta (dtb__430) -> mc2
  | C_Term_TVar (dtb__431, dtb__432, dtb__433) -> (if (dtb__432 >= mc0) then (C_Term_TVar (dtb__431, (dtb__432 + mc1), dtb__433)) else mc2)
  | _ -> failwith "DT: impossible branch"
))
# 718 "Vuna/Compiler/Core/Term.vuna"
and v_shiftArgs = (fun (mc0 : int) (mc1 : int) (mc2 : (t_Term, t_Rig) B_dData_dPair.t_Pair B_dData_dList.t_List) -> (match mc2 with
  | B_dData_dList.C_List__x58__x58_ (dtb__434, dtb__435) -> (match dtb__434 with
  | { B_dData_dPair.f_Pair_first = dtb__436; B_dData_dPair.f_Pair_second = dtb__437 } -> (B_dData_dList.C_List__x58__x58_ ({ B_dData_dPair.f_Pair_first = (((v_shift mc0) mc1) dtb__436); B_dData_dPair.f_Pair_second = dtb__437 }, (((v_shiftArgs mc0) mc1) dtb__435)))
  | _ -> failwith "DT: impossible branch"
)
  | B_dData_dList.C_List_Nil -> B_dData_dList.C_List_Nil
  | _ -> failwith "DT: impossible branch"
))
# 723 "Vuna/Compiler/Core/Term.vuna"
and v_shiftAlts = (fun (mc0 : int) (mc1 : int) (mc2 : t_CaseAlt B_dData_dList.t_List) -> (match mc2 with
  | B_dData_dList.C_List__x58__x58_ (dtb__438, dtb__439) -> (B_dData_dList.C_List__x58__x58_ ((((v_shiftAlt mc0) mc1) dtb__438), (((v_shiftAlts mc0) mc1) dtb__439)))
  | B_dData_dList.C_List_Nil -> B_dData_dList.C_List_Nil
  | _ -> failwith "DT: impossible branch"
))
# 727 "Vuna/Compiler/Core/Term.vuna"
and v_shiftAlt = (fun (mc0 : int) (mc1 : int) (mc2 : t_CaseAlt) -> (match mc2 with
  | { f_CaseAlt_caseAltName = dtb__440; f_CaseAlt_caseAltBinders = dtb__441; f_CaseAlt_caseAltBody = dtb__442 } -> { f_CaseAlt_caseAltName = dtb__440; f_CaseAlt_caseAltBinders = dtb__441; f_CaseAlt_caseAltBody = (((v_shift (mc0 + (B_dData_dList.v_length dtb__441))) mc1) dtb__442) }
  | _ -> failwith "DT: impossible branch"
))

# 732 "Vuna/Compiler/Core/Term.vuna"
let rec v_substVarAt = (fun (mc0 : int) (mc1 : t_Term) (mc2 : t_Term) -> (match mc2 with
  | C_Term_TIf (dtb__443, dtb__444, dtb__445) -> (C_Term_TIf ((((v_substVarAt mc0) mc1) dtb__443), (((v_substVarAt mc0) mc1) dtb__444), (((v_substVarAt mc0) mc1) dtb__445)))
  | C_Term_TBool (dtb__446) -> mc2
  | C_Term_TFloat (dtb__447) -> mc2
  | C_Term_TStr (dtb__448) -> mc2
  | C_Term_TInt (dtb__449) -> mc2
  | C_Term_TCase (dtb__450, dtb__451) -> (C_Term_TCase ((((v_substVarAt mc0) mc1) dtb__450), ((B_dData_dList.v_map ((v_substAltAt mc0) mc1)) dtb__451)))
  | C_Term_TRecUpd (dtb__452, dtb__453, dtb__454, dtb__455, dtb__456) -> (C_Term_TRecUpd ((((v_substVarAt mc0) mc1) dtb__452), dtb__453, dtb__454, dtb__455, (((v_substVarAt (mc0 + (B_dData_dList.v_length dtb__454))) mc1) dtb__456)))
  | C_Term_TProj (dtb__457, dtb__458, dtb__459, dtb__460, dtb__461) -> (C_Term_TProj ((((v_substVarAt mc0) mc1) dtb__457), dtb__458, dtb__459, dtb__460, dtb__461))
  | C_Term_TRecord (dtb__462, dtb__463) -> (C_Term_TRecord (dtb__462, ((B_dData_dList.v_map (fun (p : (t_Term, t_Rig) B_dData_dPair.t_Pair) -> { B_dData_dPair.f_Pair_first = (((v_substVarAt mc0) mc1) (B_dData_dPair.v_firstOf p)); B_dData_dPair.f_Pair_second = (B_dData_dPair.v_secondOf p) })) dtb__463)))
  | C_Term_TMk (dtb__464, dtb__465) -> (C_Term_TMk (dtb__464, ((B_dData_dList.v_map (fun (p : (t_Term, t_Rig) B_dData_dPair.t_Pair) -> { B_dData_dPair.f_Pair_first = (((v_substVarAt mc0) mc1) (B_dData_dPair.v_firstOf p)); B_dData_dPair.f_Pair_second = (B_dData_dPair.v_secondOf p) })) dtb__465)))
  | C_Term_TCon (dtb__466, dtb__467) -> (C_Term_TCon (dtb__466, ((B_dData_dList.v_map (fun (p : (t_Term, t_Rig) B_dData_dPair.t_Pair) -> { B_dData_dPair.f_Pair_first = (((v_substVarAt mc0) mc1) (B_dData_dPair.v_firstOf p)); B_dData_dPair.f_Pair_second = (B_dData_dPair.v_secondOf p) })) dtb__467)))
  | C_Term_TApp (dtb__468, dtb__469, dtb__470) -> (C_Term_TApp ((((v_substVarAt mc0) mc1) dtb__468), (((v_substVarAt mc0) mc1) dtb__469), dtb__470))
  | C_Term_TLam (dtb__471, dtb__472, dtb__473, dtb__474, dtb__475) -> ((fun slot2 -> (C_Term_TLam (dtb__471, dtb__472, slot2, dtb__474, (((v_substVarAt (mc0 + 1)) mc1) dtb__475)))) ((fun nd_uscrut8 -> (match nd_uscrut8 with
  | B_dData_dMaybe.C_Maybe_Just (dtb__476) -> (match dtb__476 with
  | { B_dData_dPair.f_Pair_first = dtb__477; B_dData_dPair.f_Pair_second = dtb__478 } -> ((v_lamTyOf (match dtb__477 with
  | B_dData_dMaybe.C_Maybe_Nothing -> B_dData_dMaybe.C_Maybe_Nothing
  | B_dData_dMaybe.C_Maybe_Just (dtb__479) -> (B_dData_dMaybe.C_Maybe_Just ((((v_substVarAt mc0) mc1) dtb__479)))
  | _ -> failwith "DT: impossible branch"
)) (match dtb__478 with
  | B_dData_dMaybe.C_Maybe_Nothing -> B_dData_dMaybe.C_Maybe_Nothing
  | B_dData_dMaybe.C_Maybe_Just (dtb__480) -> (B_dData_dMaybe.C_Maybe_Just ((((v_substVarAt (mc0 + 1)) mc1) dtb__480)))
  | _ -> failwith "DT: impossible branch"
))
  | _ -> failwith "DT: impossible branch"
)
  | B_dData_dMaybe.C_Maybe_Nothing -> B_dData_dMaybe.C_Maybe_Nothing
  | _ -> failwith "DT: impossible branch"
)) dtb__473))
  | C_Term_TPi (dtb__481, dtb__482, dtb__483, dtb__484, dtb__485) -> (C_Term_TPi (dtb__481, dtb__482, dtb__483, (((v_substVarAt mc0) mc1) dtb__484), (((v_substVarAt (mc0 + 1)) mc1) dtb__485)))
  | C_Term_TType (dtb__486) -> mc2
  | C_Term_TGlobal (dtb__487) -> mc2
  | C_Term_TMeta (dtb__488) -> mc2
  | C_Term_TVar (dtb__489, dtb__490, dtb__491) -> (if (dtb__490 = mc0) then mc1 else mc2)
  | _ -> failwith "DT: impossible branch"
))
# 774 "Vuna/Compiler/Core/Term.vuna"
and v_substAltAt = (fun (idx : int) (arg : t_Term) (alt : t_CaseAlt) -> { f_CaseAlt_caseAltName = (v_caseAltName alt); f_CaseAlt_caseAltBinders = (v_caseAltBinders alt); f_CaseAlt_caseAltBody = (((v_substVarAt (idx + (B_dData_dList.v_length (v_caseAltBinders alt)))) arg) (v_caseAltBody alt)) })

# 784 "Vuna/Compiler/Core/Term.vuna"
let rec v_substMetaVarGo = (fun (mc0 : int) (mc1 : string) (mc2 : int) (mc3 : int) (mc4 : t_Term) -> (match mc4 with
  | C_Term_TIf (dtb__492, dtb__493, dtb__494) -> (C_Term_TIf ((((((v_substMetaVarGo mc0) mc1) mc2) mc3) dtb__492), (((((v_substMetaVarGo mc0) mc1) mc2) mc3) dtb__493), (((((v_substMetaVarGo mc0) mc1) mc2) mc3) dtb__494)))
  | C_Term_TCase (dtb__495, dtb__496) -> (C_Term_TCase ((((((v_substMetaVarGo mc0) mc1) mc2) mc3) dtb__495), ((B_dData_dList.v_map ((((v_substMetaVarAlt mc0) mc1) mc2) mc3)) dtb__496)))
  | C_Term_TProj (dtb__497, dtb__498, dtb__499, dtb__500, dtb__501) -> (C_Term_TProj ((((((v_substMetaVarGo mc0) mc1) mc2) mc3) dtb__497), dtb__498, dtb__499, dtb__500, dtb__501))
  | C_Term_TRecord (dtb__502, dtb__503) -> (C_Term_TRecord (dtb__502, ((B_dData_dList.v_map (fun (p : (t_Term, t_Rig) B_dData_dPair.t_Pair) -> { B_dData_dPair.f_Pair_first = (((((v_substMetaVarGo mc0) mc1) mc2) mc3) (B_dData_dPair.v_firstOf p)); B_dData_dPair.f_Pair_second = (B_dData_dPair.v_secondOf p) })) dtb__503)))
  | C_Term_TMk (dtb__504, dtb__505) -> (C_Term_TMk (dtb__504, ((B_dData_dList.v_map (fun (p : (t_Term, t_Rig) B_dData_dPair.t_Pair) -> { B_dData_dPair.f_Pair_first = (((((v_substMetaVarGo mc0) mc1) mc2) mc3) (B_dData_dPair.v_firstOf p)); B_dData_dPair.f_Pair_second = (B_dData_dPair.v_secondOf p) })) dtb__505)))
  | C_Term_TCon (dtb__506, dtb__507) -> (C_Term_TCon (dtb__506, ((B_dData_dList.v_map (fun (p : (t_Term, t_Rig) B_dData_dPair.t_Pair) -> { B_dData_dPair.f_Pair_first = (((((v_substMetaVarGo mc0) mc1) mc2) mc3) (B_dData_dPair.v_firstOf p)); B_dData_dPair.f_Pair_second = (B_dData_dPair.v_secondOf p) })) dtb__507)))
  | C_Term_TApp (dtb__508, dtb__509, dtb__510) -> (C_Term_TApp ((((((v_substMetaVarGo mc0) mc1) mc2) mc3) dtb__508), (((((v_substMetaVarGo mc0) mc1) mc2) mc3) dtb__509), dtb__510))
  | C_Term_TLam (dtb__511, dtb__512, dtb__513, dtb__514, dtb__515) -> ((fun slot2 -> (C_Term_TLam (dtb__511, dtb__512, slot2, dtb__514, (((((v_substMetaVarGo mc0) mc1) mc2) (mc3 + 1)) dtb__515)))) ((fun nd_uscrut10 -> (match nd_uscrut10 with
  | B_dData_dMaybe.C_Maybe_Just (dtb__516) -> (match dtb__516 with
  | { B_dData_dPair.f_Pair_first = dtb__517; B_dData_dPair.f_Pair_second = dtb__518 } -> ((v_lamTyOf (match dtb__517 with
  | B_dData_dMaybe.C_Maybe_Nothing -> B_dData_dMaybe.C_Maybe_Nothing
  | B_dData_dMaybe.C_Maybe_Just (dtb__519) -> (B_dData_dMaybe.C_Maybe_Just ((((((v_substMetaVarGo mc0) mc1) mc2) mc3) dtb__519)))
  | _ -> failwith "DT: impossible branch"
)) (match dtb__518 with
  | B_dData_dMaybe.C_Maybe_Nothing -> B_dData_dMaybe.C_Maybe_Nothing
  | B_dData_dMaybe.C_Maybe_Just (dtb__520) -> (B_dData_dMaybe.C_Maybe_Just ((((((v_substMetaVarGo mc0) mc1) mc2) (mc3 + 1)) dtb__520)))
  | _ -> failwith "DT: impossible branch"
))
  | _ -> failwith "DT: impossible branch"
)
  | B_dData_dMaybe.C_Maybe_Nothing -> B_dData_dMaybe.C_Maybe_Nothing
  | _ -> failwith "DT: impossible branch"
)) dtb__513))
  | C_Term_TPi (dtb__521, dtb__522, dtb__523, dtb__524, dtb__525) -> (C_Term_TPi (dtb__521, dtb__522, dtb__523, (((((v_substMetaVarGo mc0) mc1) mc2) mc3) dtb__524), (((((v_substMetaVarGo mc0) mc1) mc2) (mc3 + 1)) dtb__525)))
  | C_Term_TMeta (dtb__526) -> (if (dtb__526 = mc0) then (C_Term_TVar (mc1, (mc3 - mc2), { Base_dSource.f_Span_spanFile = ""; Base_dSource.f_Span_spanStartLine = 0; Base_dSource.f_Span_spanStartCol = 0; Base_dSource.f_Span_spanEndLine = 0; Base_dSource.f_Span_spanEndCol = 0; Base_dSource.f_Span_spanStartOffset = 0; Base_dSource.f_Span_spanEndOffset = 0 })) else mc4)
  | _ -> mc4
))
# 824 "Vuna/Compiler/Core/Term.vuna"
and v_substMetaVarAlt = (fun (mc0 : int) (mc1 : string) (mc2 : int) (mc3 : int) (mc4 : t_CaseAlt) -> (match mc4 with
  | { f_CaseAlt_caseAltName = dtb__527; f_CaseAlt_caseAltBinders = dtb__528; f_CaseAlt_caseAltBody = dtb__529 } -> { f_CaseAlt_caseAltName = dtb__527; f_CaseAlt_caseAltBinders = dtb__528; f_CaseAlt_caseAltBody = (((((v_substMetaVarGo mc0) mc1) mc2) (mc3 + (B_dData_dList.v_length dtb__528))) dtb__529) }
  | _ -> failwith "DT: impossible branch"
))

# 781 "Vuna/Compiler/Core/Term.vuna"
let v_substMetaVar = (fun (m : int) (name : string) (q : int) (t : t_Term) -> (((((v_substMetaVarGo m) name) q) 0) t))

# 836 "Vuna/Compiler/Core/Term.vuna"
let rec v_insertDictBinderGo = (fun (mc0 : string) (mc1 : int) (mc2 : t_Term) (mc3 : int) (mc4 : t_Term) -> (match mc4 with
  | C_Term_TPi (dtb__530, dtb__531, dtb__532, dtb__533, dtb__534) -> (if (mc3 = mc1) then (C_Term_TPi (dtb__530, dtb__531, dtb__532, dtb__533, (C_Term_TPi (mc0, true, C_Rig_RigOmega, mc2, (((v_shift 0) 1) dtb__534))))) else (C_Term_TPi (dtb__530, dtb__531, dtb__532, dtb__533, (((((v_insertDictBinderGo mc0) mc1) mc2) (mc3 + 1)) dtb__534))))
  | _ -> mc4
))

# 830 "Vuna/Compiler/Core/Term.vuna"
let v_insertDictBinder = (fun (name : string) (idx : int) (dictDom : t_Term) (t : t_Term) -> (((((v_insertDictBinderGo name) idx) dictDom) 0) t))

# 848 "Vuna/Compiler/Core/Term.vuna"
let rec v_insertImplicitBinderGo = (fun (mc0 : string) (mc1 : int) (mc2 : t_Rig) (mc3 : t_Term) (mc4 : int) (mc5 : t_Term) -> (match mc5 with
  | C_Term_TPi (dtb__535, dtb__536, dtb__537, dtb__538, dtb__539) -> (if (mc4 = mc1) then (C_Term_TPi (dtb__535, dtb__536, dtb__537, dtb__538, (C_Term_TPi (mc0, true, mc2, mc3, (((v_shift 0) 1) dtb__539))))) else (C_Term_TPi (dtb__535, dtb__536, dtb__537, dtb__538, ((((((v_insertImplicitBinderGo mc0) mc1) mc2) mc3) (mc4 + 1)) dtb__539))))
  | _ -> mc5
))

# 845 "Vuna/Compiler/Core/Term.vuna"
let v_insertImplicitBinder = (fun (name : string) (idx : int) (rig : t_Rig) (dom : t_Term) (t : t_Term) -> ((((((v_insertImplicitBinderGo name) idx) rig) dom) 0) t))

# 857 "Vuna/Compiler/Core/Term.vuna"
let v_cutoffOf = (fun (total : int) (idx : int) -> (if ((total - (idx + 1)) <= 0) then 0 else (total - (idx + 1))))

# 860 "Vuna/Compiler/Core/Term.vuna"
let rec v_countPis = (fun (mc0 : t_Term) -> (match mc0 with
  | C_Term_TPi (dtb__540, dtb__541, dtb__542, dtb__543, dtb__544) -> (1 + (v_countPis dtb__544))
  | _ -> 0
))

# 872 "Vuna/Compiler/Core/Term.vuna"
let rec v_insertLamBinderGo = (fun (mc0 : string) (mc1 : int) (mc2 : int) (mc3 : t_Term) -> (match mc3 with
  | C_Term_TLam (dtb__545, dtb__546, dtb__547, dtb__548, dtb__549) -> (if (mc2 = mc1) then (C_Term_TLam (dtb__545, dtb__546, dtb__547, dtb__548, (C_Term_TLam (mc0, C_Rig_RigOmega, B_dData_dMaybe.C_Maybe_Nothing, Base_dSource.v_spanEmpty, (((v_shift 0) 1) dtb__549))))) else (C_Term_TLam (dtb__545, dtb__546, dtb__547, dtb__548, ((((v_insertLamBinderGo mc0) mc1) (mc2 + 1)) dtb__549))))
  | _ -> mc3
))

# 869 "Vuna/Compiler/Core/Term.vuna"
let v_insertLamBinder = (fun (name : string) (idx : int) (t : t_Term) -> ((((v_insertLamBinderGo name) idx) 0) t))

# 880 "Vuna/Compiler/Core/Term.vuna"
let rec v_countLams = (fun (mc0 : t_Term) -> (match mc0 with
  | C_Term_TLam (dtb__550, dtb__551, dtb__552, dtb__553, dtb__554) -> (1 + (v_countLams dtb__554))
  | _ -> 0
))

# 885 "Vuna/Compiler/Core/Term.vuna"
let rec v_hasFreeTermVar = (fun (mc0 : int) (mc1 : t_Term) -> (match mc1 with
  | C_Term_TIf (dtb__555, dtb__556, dtb__557) -> (if (if ((v_hasFreeTermVar mc0) dtb__555) then true else ((v_hasFreeTermVar mc0) dtb__556)) then true else ((v_hasFreeTermVar mc0) dtb__557))
  | C_Term_TCase (dtb__558, dtb__559) -> (if ((v_hasFreeTermVar mc0) dtb__558) then true else ((v_anyAltFree mc0) dtb__559))
  | C_Term_TRecUpd (dtb__560, dtb__561, dtb__562, dtb__563, dtb__564) -> (if ((v_hasFreeTermVar mc0) dtb__560) then true else ((v_hasFreeTermVar (mc0 + (B_dData_dList.v_length dtb__562))) dtb__564))
  | C_Term_TProj (dtb__565, dtb__566, dtb__567, dtb__568, dtb__569) -> ((v_hasFreeTermVar mc0) dtb__565)
  | C_Term_TRecord (dtb__570, dtb__571) -> ((v_anyPairFree mc0) dtb__571)
  | C_Term_TMk (dtb__572, dtb__573) -> ((v_anyPairFree mc0) dtb__573)
  | C_Term_TCon (dtb__574, dtb__575) -> ((v_anyPairFree mc0) dtb__575)
  | C_Term_TApp (dtb__576, dtb__577, dtb__578) -> (if ((v_hasFreeTermVar mc0) dtb__576) then true else ((v_hasFreeTermVar mc0) dtb__577))
  | C_Term_TLam (dtb__579, dtb__580, dtb__581, dtb__582, dtb__583) -> ((fun tys -> (if tys then true else ((v_hasFreeTermVar (mc0 + 1)) dtb__583))) ((fun nd_uscrut7 -> (match nd_uscrut7 with
  | B_dData_dMaybe.C_Maybe_Just (dtb__584) -> (match dtb__584 with
  | { B_dData_dPair.f_Pair_first = dtb__585; B_dData_dPair.f_Pair_second = dtb__586 } -> (if ((v_hasFreeTermVarMaybe mc0) dtb__585) then true else ((v_hasFreeTermVarMaybe (mc0 + 1)) dtb__586))
  | _ -> failwith "DT: impossible branch"
)
  | B_dData_dMaybe.C_Maybe_Nothing -> false
  | _ -> failwith "DT: impossible branch"
)) dtb__581))
  | C_Term_TPi (dtb__587, dtb__588, dtb__589, dtb__590, dtb__591) -> (if ((v_hasFreeTermVar mc0) dtb__590) then true else ((v_hasFreeTermVar (mc0 + 1)) dtb__591))
  | C_Term_TVar (dtb__592, dtb__593, dtb__594) -> (dtb__593 >= mc0)
  | _ -> false
))
# 908 "Vuna/Compiler/Core/Term.vuna"
and v_hasFreeTermVarMaybe = (fun (mc0 : int) (mc1 : t_Term B_dData_dMaybe.t_Maybe) -> (match mc1 with
  | B_dData_dMaybe.C_Maybe_Just (dtb__595) -> ((v_hasFreeTermVar mc0) dtb__595)
  | B_dData_dMaybe.C_Maybe_Nothing -> false
  | _ -> failwith "DT: impossible branch"
))
# 912 "Vuna/Compiler/Core/Term.vuna"
and v_anyPairFree = (fun (mc0 : int) (mc1 : (t_Term, t_Rig) B_dData_dPair.t_Pair B_dData_dList.t_List) -> (match mc1 with
  | B_dData_dList.C_List__x58__x58_ (dtb__596, dtb__597) -> (match dtb__596 with
  | { B_dData_dPair.f_Pair_first = dtb__598; B_dData_dPair.f_Pair_second = dtb__599 } -> (if ((v_hasFreeTermVar mc0) dtb__598) then true else ((v_anyPairFree mc0) dtb__597))
  | _ -> failwith "DT: impossible branch"
)
  | B_dData_dList.C_List_Nil -> false
  | _ -> failwith "DT: impossible branch"
))
# 916 "Vuna/Compiler/Core/Term.vuna"
and v_anyAltFree = (fun (mc0 : int) (mc1 : t_CaseAlt B_dData_dList.t_List) -> (match mc1 with
  | B_dData_dList.C_List__x58__x58_ (dtb__600, dtb__601) -> (match dtb__600 with
  | { f_CaseAlt_caseAltName = dtb__602; f_CaseAlt_caseAltBinders = dtb__603; f_CaseAlt_caseAltBody = dtb__604 } -> (if ((v_hasFreeTermVar (mc0 + (B_dData_dList.v_length dtb__603))) dtb__604) then true else ((v_anyAltFree mc0) dtb__601))
  | _ -> failwith "DT: impossible branch"
)
  | B_dData_dList.C_List_Nil -> false
  | _ -> failwith "DT: impossible branch"
))

# 923 "Vuna/Compiler/Core/Term.vuna"
let rec v_hasNegativeVar = (fun (mc0 : t_Term) -> (match mc0 with
  | C_Term_TIf (dtb__605, dtb__606, dtb__607) -> (if (if (v_hasNegativeVar dtb__605) then true else (v_hasNegativeVar dtb__606)) then true else (v_hasNegativeVar dtb__607))
  | C_Term_TCase (dtb__608, dtb__609) -> (if (v_hasNegativeVar dtb__608) then true else (v_anyNegativeVarAlts dtb__609))
  | C_Term_TRecUpd (dtb__610, dtb__611, dtb__612, dtb__613, dtb__614) -> (if (v_hasNegativeVar dtb__610) then true else (v_hasNegativeVar dtb__614))
  | C_Term_TProj (dtb__615, dtb__616, dtb__617, dtb__618, dtb__619) -> (v_hasNegativeVar dtb__615)
  | C_Term_TRecord (dtb__620, dtb__621) -> (v_anyNegativeVarArgs dtb__621)
  | C_Term_TMk (dtb__622, dtb__623) -> (v_anyNegativeVarArgs dtb__623)
  | C_Term_TCon (dtb__624, dtb__625) -> (v_anyNegativeVarArgs dtb__625)
  | C_Term_TApp (dtb__626, dtb__627, dtb__628) -> (if (v_hasNegativeVar dtb__626) then true else (v_hasNegativeVar dtb__627))
  | C_Term_TLam (dtb__629, dtb__630, dtb__631, dtb__632, dtb__633) -> ((fun tys -> (if tys then true else (v_hasNegativeVar dtb__633))) ((fun nd_uscrut6 -> (match nd_uscrut6 with
  | B_dData_dMaybe.C_Maybe_Just (dtb__634) -> (match dtb__634 with
  | { B_dData_dPair.f_Pair_first = dtb__635; B_dData_dPair.f_Pair_second = dtb__636 } -> (if (v_hasNegativeVarMaybe dtb__635) then true else (v_hasNegativeVarMaybe dtb__636))
  | _ -> failwith "DT: impossible branch"
)
  | B_dData_dMaybe.C_Maybe_Nothing -> false
  | _ -> failwith "DT: impossible branch"
)) dtb__631))
  | C_Term_TPi (dtb__637, dtb__638, dtb__639, dtb__640, dtb__641) -> (if (v_hasNegativeVar dtb__640) then true else (v_hasNegativeVar dtb__641))
  | C_Term_TVar (dtb__642, dtb__643, dtb__644) -> (dtb__643 < 0)
  | _ -> false
))
# 943 "Vuna/Compiler/Core/Term.vuna"
and v_hasNegativeVarMaybe = (fun (mc0 : t_Term B_dData_dMaybe.t_Maybe) -> (match mc0 with
  | B_dData_dMaybe.C_Maybe_Just (dtb__645) -> (v_hasNegativeVar dtb__645)
  | B_dData_dMaybe.C_Maybe_Nothing -> false
  | _ -> failwith "DT: impossible branch"
))
# 947 "Vuna/Compiler/Core/Term.vuna"
and v_anyNegativeVarArgs = (fun (mc0 : (t_Term, t_Rig) B_dData_dPair.t_Pair B_dData_dList.t_List) -> (match mc0 with
  | B_dData_dList.C_List__x58__x58_ (dtb__646, dtb__647) -> (match dtb__646 with
  | { B_dData_dPair.f_Pair_first = dtb__648; B_dData_dPair.f_Pair_second = dtb__649 } -> (if (v_hasNegativeVar dtb__648) then true else (v_anyNegativeVarArgs dtb__647))
  | _ -> failwith "DT: impossible branch"
)
  | B_dData_dList.C_List_Nil -> false
  | _ -> failwith "DT: impossible branch"
))
# 951 "Vuna/Compiler/Core/Term.vuna"
and v_anyNegativeVarAlts = (fun (mc0 : t_CaseAlt B_dData_dList.t_List) -> (match mc0 with
  | B_dData_dList.C_List__x58__x58_ (dtb__650, dtb__651) -> (match dtb__650 with
  | { f_CaseAlt_caseAltName = dtb__652; f_CaseAlt_caseAltBinders = dtb__653; f_CaseAlt_caseAltBody = dtb__654 } -> (if (v_hasNegativeVar dtb__654) then true else (v_anyNegativeVarAlts dtb__651))
  | _ -> failwith "DT: impossible branch"
)
  | B_dData_dList.C_List_Nil -> false
  | _ -> failwith "DT: impossible branch"
))

# 957 "Vuna/Compiler/Core/Term.vuna"
let v_metaScanBound = 262144

# 963 "Vuna/Compiler/Core/Term.vuna"
let rec v_hasUnsolvedMetaValueFuel = (fun (fuel : int) (sols : t_Sols) (v : t_Value) -> (if (fuel <= 0) then true else (match v with
  | C_Value_VMeta (dtb__655, dtb__656) -> (match ((v_solsLookup dtb__655) sols) with
  | B_dData_dMaybe.C_Maybe_Just (dtb__657) -> (((v_hasUnsolvedMetaValueFuel (fuel - 1)) sols) dtb__657)
  | B_dData_dMaybe.C_Maybe_Nothing -> true
  | _ -> failwith "DT: impossible branch"
)
  | C_Value_VNeutral (dtb__658) -> (match dtb__658 with
  | C_Neutral_NVar (dtb__659, dtb__660, dtb__661) -> (((v_hasUnsolvedMetaListFuel (fuel - 1)) sols) dtb__661)
  | C_Neutral_NGlobal (dtb__662, dtb__663) -> (((v_hasUnsolvedMetaListFuel (fuel - 1)) sols) dtb__663)
  | _ -> failwith "DT: impossible branch"
)
  | C_Value_VPi (dtb__664, dtb__665, dtb__666, dtb__667, dtb__668) -> (if (((v_hasUnsolvedMetaValueFuel (fuel - 1)) sols) dtb__667) then true else (((v_hasUnsolvedMetaCloFuel (fuel - 1)) sols) dtb__668))
  | C_Value_VLam (dtb__669, dtb__670, dtb__671) -> (((v_hasUnsolvedMetaCloFuel (fuel - 1)) sols) dtb__671)
  | C_Value_VCon (dtb__672, dtb__673) -> (((v_hasUnsolvedMetaListFuel (fuel - 1)) sols) dtb__673)
  | C_Value_VApp (dtb__674, dtb__675) -> (if (((v_hasUnsolvedMetaValueFuel (fuel - 1)) sols) dtb__674) then true else (((v_hasUnsolvedMetaValueFuel (fuel - 1)) sols) dtb__675))
  | C_Value_VCase (dtb__676, dtb__677) -> (((v_hasUnsolvedMetaValueFuel (fuel - 1)) sols) dtb__676)
  | C_Value_VProj (dtb__678, dtb__679, dtb__680, dtb__681, dtb__682) -> (((v_hasUnsolvedMetaValueFuel (fuel - 1)) sols) dtb__678)
  | C_Value_VIf (dtb__683, dtb__684, dtb__685) -> (if (if (((v_hasUnsolvedMetaValueFuel (fuel - 1)) sols) dtb__683) then true else (((v_hasUnsolvedMetaValueFuel (fuel - 1)) sols) dtb__684)) then true else (((v_hasUnsolvedMetaValueFuel (fuel - 1)) sols) dtb__685))
  | _ -> false
)))
# 989 "Vuna/Compiler/Core/Term.vuna"
and v_hasUnsolvedMetaListFuel = (fun (fuel : int) (sols : t_Sols) (vs : t_Value B_dData_dList.t_List) -> (if (fuel <= 0) then true else (match vs with
  | B_dData_dList.C_List_Nil -> false
  | B_dData_dList.C_List__x58__x58_ (dtb__686, dtb__687) -> (if (((v_hasUnsolvedMetaValueFuel (fuel - 1)) sols) dtb__686) then true else (((v_hasUnsolvedMetaListFuel (fuel - 1)) sols) dtb__687))
  | _ -> failwith "DT: impossible branch"
)))
# 1001 "Vuna/Compiler/Core/Term.vuna"
and v_hasUnsolvedMetaCloFuel = (fun (fuel : int) (sols : t_Sols) (clo : t_Closure) -> (if (fuel <= 0) then true else (match clo with
  | { f_Closure_closureEnv = dtb__688; f_Closure_closureBody = dtb__689 } -> (((v_hasUnsolvedMetaListFuel (fuel - 1)) sols) dtb__688)
  | _ -> failwith "DT: impossible branch"
)))

# 960 "Vuna/Compiler/Core/Term.vuna"
let v_hasUnsolvedMetaValue = (fun (sols : t_Sols) (v : t_Value) -> (((v_hasUnsolvedMetaValueFuel v_metaScanBound) sols) v))

# 986 "Vuna/Compiler/Core/Term.vuna"
let v_hasUnsolvedMetaList = (fun (sols : t_Sols) (vs : t_Value B_dData_dList.t_List) -> (((v_hasUnsolvedMetaListFuel v_metaScanBound) sols) vs))

# 998 "Vuna/Compiler/Core/Term.vuna"
let v_hasUnsolvedMetaClo = (fun (sols : t_Sols) (clo : t_Closure) -> (((v_hasUnsolvedMetaCloFuel v_metaScanBound) sols) clo))

# 1012 "Vuna/Compiler/Core/Term.vuna"
let v_isTypeValue = (fun (mc0 : t_Value) -> (match mc0 with
  | C_Value_VType (dtb__690) -> true
  | _ -> false
))

# 1016 "Vuna/Compiler/Core/Term.vuna"
let v_typeLevelOf = (fun (mc0 : t_Value) -> (match mc0 with
  | C_Value_VType (dtb__691) -> (B_dData_dMaybe.C_Maybe_Just (dtb__691))
  | _ -> B_dData_dMaybe.C_Maybe_Nothing
))

# 1024 "Vuna/Compiler/Core/Term.vuna"
let rec v_levelEscapes = (fun (mc0 : int) (mc1 : int) (mc2 : t_Value) -> (match mc2 with
  | C_Value_VBool (dtb__692) -> false
  | C_Value_VFloat (dtb__693) -> false
  | C_Value_VStr (dtb__694) -> false
  | C_Value_VInt (dtb__695) -> false
  | C_Value_VType (dtb__696) -> false
  | C_Value_VIf (dtb__697, dtb__698, dtb__699) -> (if (if (((v_levelEscapes mc0) mc1) dtb__697) then true else (((v_levelEscapes mc0) mc1) dtb__698)) then true else (((v_levelEscapes mc0) mc1) dtb__699))
  | C_Value_VProj (dtb__700, dtb__701, dtb__702, dtb__703, dtb__704) -> (((v_levelEscapes mc0) mc1) dtb__700)
  | C_Value_VCase (dtb__705, dtb__706) -> (((v_levelEscapes mc0) mc1) dtb__705)
  | C_Value_VApp (dtb__707, dtb__708) -> (if (((v_levelEscapes mc0) mc1) dtb__707) then true else (((v_levelEscapes mc0) mc1) dtb__708))
  | C_Value_VCon (dtb__709, dtb__710) -> ((v_levelEscapesList mc0) dtb__710)
  | C_Value_VMeta (dtb__711, dtb__712) -> ((v_levelEscapesList mc0) dtb__712)
  | C_Value_VLam (dtb__713, dtb__714, dtb__715) -> ((v_levelEscapesClo mc0) dtb__715)
  | C_Value_VPi (dtb__716, dtb__717, dtb__718, dtb__719, dtb__720) -> (if (((v_levelEscapes mc0) mc1) dtb__719) then true else ((v_levelEscapesClo mc0) dtb__720))
  | C_Value_VNeutral (dtb__721) -> (match dtb__721 with
  | C_Neutral_NVar (dtb__722, dtb__723, dtb__724) -> (if (dtb__723 >= mc0) then true else ((v_levelEscapesList mc0) dtb__724))
  | C_Neutral_NGlobal (dtb__725, dtb__726) -> ((v_levelEscapesList mc0) dtb__726)
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
))
# 1045 "Vuna/Compiler/Core/Term.vuna"
and v_levelEscapesList = (fun (mc0 : int) (mc1 : t_Value B_dData_dList.t_List) -> (match mc1 with
  | B_dData_dList.C_List__x58__x58_ (dtb__727, dtb__728) -> (if (((v_levelEscapes mc0) 0) dtb__727) then true else ((v_levelEscapesList mc0) dtb__728))
  | B_dData_dList.C_List_Nil -> false
  | _ -> failwith "DT: impossible branch"
))
# 1049 "Vuna/Compiler/Core/Term.vuna"
and v_levelEscapesClo = (fun (mc0 : int) (mc1 : t_Closure) -> (match mc1 with
  | { f_Closure_closureEnv = dtb__729; f_Closure_closureBody = dtb__730 } -> ((v_levelEscapesList mc0) dtb__729)
  | _ -> failwith "DT: impossible branch"
))

# 1129 "Vuna/Compiler/Core/Term.vuna"
let rec v_showBinders = (fun (mc0 : (string, t_Rig) B_dData_dPair.t_Pair B_dData_dList.t_List) -> (match mc0 with
  | B_dData_dList.C_List__x58__x58_ (dtb__731, dtb__732) -> (match dtb__731 with
  | { B_dData_dPair.f_Pair_first = dtb__733; B_dData_dPair.f_Pair_second = dtb__734 } -> (String.concat "" [" "; dtb__733; (v_showBinders dtb__732)])
  | _ -> failwith "DT: impossible branch"
)
  | B_dData_dList.C_List_Nil -> ""
  | _ -> failwith "DT: impossible branch"
))

# 1136 "Vuna/Compiler/Core/Term.vuna"
let rec v_showCoreChars = (fun (mc0 : int B_dData_dList.t_List) -> (match mc0 with
  | B_dData_dList.C_List__x58__x58_ (dtb__735, dtb__736) -> (if (dtb__735 = 34) then ("\\\"" ^ (v_showCoreChars dtb__736)) else (if (dtb__735 = 92) then ("\\\\" ^ (v_showCoreChars dtb__736)) else (if (dtb__735 = 10) then ("\\n" ^ (v_showCoreChars dtb__736)) else (if (dtb__735 = 9) then ("\\t" ^ (v_showCoreChars dtb__736)) else (if (dtb__735 = 13) then ("\\r" ^ (v_showCoreChars dtb__736)) else ((B_dData_dList.dtp_pack (B_dData_dList.C_List__x58__x58_ (dtb__735, B_dData_dList.C_List_Nil))) ^ (v_showCoreChars dtb__736)))))))
  | B_dData_dList.C_List_Nil -> ""
  | _ -> failwith "DT: impossible branch"
))

# 1133 "Vuna/Compiler/Core/Term.vuna"
let v_showCoreString = (fun (s : string) -> (String.concat "" ["\""; (v_showCoreChars (B_dData_dList.dtp_unpack s)); "\""]))

# 1052 "Vuna/Compiler/Core/Term.vuna"
let rec v_showTerm = (fun (mc0 : t_Term) -> (match mc0 with
  | C_Term_TIf (dtb__737, dtb__738, dtb__739) -> (String.concat "" ["if "; (v_showTerm dtb__737); " then "; (v_showTerm dtb__738); " else "; (v_showTerm dtb__739)])
  | C_Term_TBool (dtb__740) -> (if dtb__740 then "True" else "False")
  | C_Term_TFloat (dtb__741) -> dtb__741
  | C_Term_TStr (dtb__742) -> (v_showCoreString dtb__742)
  | C_Term_TInt (dtb__743) -> (bi_strFromInt dtb__743)
  | C_Term_TCase (dtb__744, dtb__745) -> (String.concat "" ["case "; (v_showTerm dtb__744); " of "; (v_showCoreAlts dtb__745)])
  | C_Term_TRecUpd (dtb__746, dtb__747, dtb__748, dtb__749, dtb__750) -> (String.concat "" [(v_showTerm dtb__746); " with "; dtb__747; " "; (v_showTerm dtb__750)])
  | C_Term_TProj (dtb__751, dtb__752, dtb__753, dtb__754, dtb__755) -> (String.concat "" [(v_showTerm dtb__751); "."; dtb__752; "#"; (bi_strFromInt dtb__755)])
  | C_Term_TRecord (dtb__756, dtb__757) -> ((v_recordAppShow dtb__756) dtb__757)
  | C_Term_TMk (dtb__758, dtb__759) -> (String.concat "" ["("; dtb__758; (v_showArgTerms dtb__759); ")"])
  | C_Term_TCon (dtb__760, dtb__761) -> (String.concat "" ["("; dtb__760; (v_showArgTerms dtb__761); ")"])
  | C_Term_TApp (dtb__762, dtb__763, dtb__764) -> (String.concat "" ["("; (v_showTerm dtb__762); " "; (v_showTerm dtb__763); ")"])
  | C_Term_TLam (dtb__765, dtb__766, dtb__767, dtb__768, dtb__769) -> (String.concat "" ["\\"; dtb__765; " => "; (v_showTerm dtb__769)])
  | C_Term_TPi (dtb__770, dtb__771, dtb__772, dtb__773, dtb__774) -> (if (dtb__770 = "_") then (String.concat "" [(v_showTerm dtb__773); " -> "; (v_showTerm dtb__774)]) else (if dtb__771 then (String.concat "" ["{"; dtb__770; " : "; (v_showTerm dtb__773); "} -> "; (v_showTerm dtb__774)]) else (String.concat "" ["("; dtb__770; " : "; (v_showTerm dtb__773); ") -> "; (v_showTerm dtb__774)])))
  | C_Term_TType (dtb__775) -> (if ((v_levelToInt dtb__775) = 0) then "Type" else ("Type " ^ (bi_strFromInt (v_levelToInt dtb__775))))
  | C_Term_TGlobal (dtb__776) -> dtb__776
  | C_Term_TMeta (dtb__777) -> ("?" ^ (bi_strFromInt dtb__777))
  | C_Term_TVar (dtb__778, dtb__779, dtb__780) -> dtb__778
  | _ -> failwith "DT: impossible branch"
))
# 1109 "Vuna/Compiler/Core/Term.vuna"
and v_showArgTerms = (fun (mc0 : (t_Term, t_Rig) B_dData_dPair.t_Pair B_dData_dList.t_List) -> (match mc0 with
  | B_dData_dList.C_List__x58__x58_ (dtb__781, dtb__782) -> (match dtb__781 with
  | { B_dData_dPair.f_Pair_first = dtb__783; B_dData_dPair.f_Pair_second = dtb__784 } -> (String.concat "" [" "; (v_showTerm dtb__783); (v_showArgTerms dtb__782)])
  | _ -> failwith "DT: impossible branch"
)
  | B_dData_dList.C_List_Nil -> ""
  | _ -> failwith "DT: impossible branch"
))
# 1114 "Vuna/Compiler/Core/Term.vuna"
and v_recordAppShow = (fun (mc0 : string) (mc1 : (t_Term, t_Rig) B_dData_dPair.t_Pair B_dData_dList.t_List) -> (match mc1 with
  | B_dData_dList.C_List__x58__x58_ (dtb__785, dtb__786) -> (match dtb__785 with
  | { B_dData_dPair.f_Pair_first = dtb__787; B_dData_dPair.f_Pair_second = dtb__788 } -> ((v_recordAppShow (String.concat "" ["("; mc0; " "; (v_showTerm dtb__787); ")"])) dtb__786)
  | _ -> failwith "DT: impossible branch"
)
  | B_dData_dList.C_List_Nil -> mc0
  | _ -> failwith "DT: impossible branch"
))
# 1124 "Vuna/Compiler/Core/Term.vuna"
and v_showCoreAlts = (fun (mc0 : t_CaseAlt B_dData_dList.t_List) -> (match mc0 with
  | B_dData_dList.C_List__x58__x58_ (dtb__789, dtb__790) -> (String.concat "" [(v_caseAltName dtb__789); (v_showBinders (v_binderPairs (v_caseAltBinders dtb__789))); " => "; (v_showTerm (v_caseAltBody dtb__789)); " | "; (v_showCoreAlts dtb__790)])
  | B_dData_dList.C_List_Nil -> ""
  | _ -> failwith "DT: impossible branch"
))

# 1084 "Vuna/Compiler/Core/Term.vuna"
let rec v_showPiSig = (fun (name : string) (implicit : bool) (dom : t_Term) (cod : t_Term) -> (if (name = "_") then (String.concat "" [(v_showSigParenIfPi dom); " -> "; (v_showTypeSig cod)]) else (if implicit then (String.concat "" ["{"; name; " : "; (v_showTypeSig dom); "} -> "; (v_showTypeSig cod)]) else (String.concat "" ["("; name; " : "; (v_showTypeSig dom); ") -> "; (v_showTypeSig cod)]))))
# 1093 "Vuna/Compiler/Core/Term.vuna"
and v_showTypeSig = (fun (mc0 : t_Term) -> (match mc0 with
  | C_Term_TRecord (dtb__791, dtb__792) -> ((v_showSigAppText dtb__791) dtb__792)
  | C_Term_TCon (dtb__793, dtb__794) -> (match dtb__794 with
  | B_dData_dList.C_List_Nil -> dtb__793
  | _ -> (String.concat "" ["("; dtb__793; (v_showSigArgs dtb__794); ")"])
)
  | C_Term_TApp (dtb__795, dtb__796, dtb__797) -> (String.concat "" ["("; (v_showSigParenIfPi dtb__795); " "; (v_showSigParenIfPi dtb__796); ")"])
  | C_Term_TPi (dtb__798, dtb__799, dtb__800, dtb__801, dtb__802) -> ((((v_showPiSig dtb__798) dtb__799) dtb__801) dtb__802)
  | _ -> (v_showTerm mc0)
))
# 1101 "Vuna/Compiler/Core/Term.vuna"
and v_showSigParenIfPi = (fun (mc0 : t_Term) -> (match mc0 with
  | C_Term_TPi (dtb__803, dtb__804, dtb__805, dtb__806, dtb__807) -> (String.concat "" ["("; ((((v_showPiSig dtb__803) dtb__804) dtb__806) dtb__807); ")"])
  | _ -> (v_showTypeSig mc0)
))
# 1105 "Vuna/Compiler/Core/Term.vuna"
and v_showSigArgs = (fun (mc0 : (t_Term, t_Rig) B_dData_dPair.t_Pair B_dData_dList.t_List) -> (match mc0 with
  | B_dData_dList.C_List__x58__x58_ (dtb__808, dtb__809) -> (match dtb__808 with
  | { B_dData_dPair.f_Pair_first = dtb__810; B_dData_dPair.f_Pair_second = dtb__811 } -> (String.concat "" [" "; (v_showSigParenIfPi dtb__810); (v_showSigArgs dtb__809)])
  | _ -> failwith "DT: impossible branch"
)
  | B_dData_dList.C_List_Nil -> ""
  | _ -> failwith "DT: impossible branch"
))
# 1119 "Vuna/Compiler/Core/Term.vuna"
and v_showSigAppText = (fun (mc0 : string) (mc1 : (t_Term, t_Rig) B_dData_dPair.t_Pair B_dData_dList.t_List) -> (match mc1 with
  | B_dData_dList.C_List__x58__x58_ (dtb__812, dtb__813) -> (match dtb__812 with
  | { B_dData_dPair.f_Pair_first = dtb__814; B_dData_dPair.f_Pair_second = dtb__815 } -> ((v_showSigAppText (String.concat "" ["("; mc0; " "; (v_showSigParenIfPi dtb__814); ")"])) dtb__813)
  | _ -> failwith "DT: impossible branch"
)
  | B_dData_dList.C_List_Nil -> mc0
  | _ -> failwith "DT: impossible branch"
))
