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

# 522 "Vuna/Compiler/Core/Term.vuna"
let v_defLookup = (fun (name : string) (tbl : (string, t_Term) B_dContainer_dHashMap.t_HashMap) -> ((((B_dContainer_dHashMap.v_lookup B_dData_dString.v_Hashable_uString) B_dData_dString.v_Eq_uString) name) tbl))

# 526 "Vuna/Compiler/Core/Term.vuna"
let rec v_hasFreeVar = (fun (mc0 : int) (mc1 : t_Term) -> (match mc1 with
  | C_Term_TIf (dtb__264, dtb__265, dtb__266) -> (if (if ((v_hasFreeVar mc0) dtb__264) then true else ((v_hasFreeVar mc0) dtb__265)) then true else ((v_hasFreeVar mc0) dtb__266))
  | C_Term_TBool (dtb__267) -> false
  | C_Term_TFloat (dtb__268) -> false
  | C_Term_TStr (dtb__269) -> false
  | C_Term_TInt (dtb__270) -> false
  | C_Term_TCase (dtb__271, dtb__272) -> (if ((v_hasFreeVar mc0) dtb__271) then true else ((v_hasFreeVarAlts mc0) dtb__272))
  | C_Term_TRecUpd (dtb__273, dtb__274, dtb__275, dtb__276, dtb__277) -> (if ((v_hasFreeVar mc0) dtb__273) then true else ((v_hasFreeVar (mc0 + (B_dData_dList.v_length dtb__275))) dtb__277))
  | C_Term_TProj (dtb__278, dtb__279, dtb__280, dtb__281, dtb__282) -> ((v_hasFreeVar mc0) dtb__278)
  | C_Term_TRecord (dtb__283, dtb__284) -> ((v_hasFreeVarArgs mc0) dtb__284)
  | C_Term_TMk (dtb__285, dtb__286) -> ((v_hasFreeVarArgs mc0) dtb__286)
  | C_Term_TCon (dtb__287, dtb__288) -> ((v_hasFreeVarArgs mc0) dtb__288)
  | C_Term_TApp (dtb__289, dtb__290, dtb__291) -> (if ((v_hasFreeVar mc0) dtb__289) then true else ((v_hasFreeVar mc0) dtb__290))
  | C_Term_TLam (dtb__292, dtb__293, dtb__294, dtb__295, dtb__296) -> ((fun tys -> (if tys then true else ((v_hasFreeVar (mc0 + 1)) dtb__296))) ((fun nd_uscrut7 -> (match nd_uscrut7 with
  | B_dData_dMaybe.C_Maybe_Just (dtb__297) -> (match dtb__297 with
  | { B_dData_dPair.f_Pair_first = dtb__298; B_dData_dPair.f_Pair_second = dtb__299 } -> (if ((v_hasFreeVarMaybe mc0) dtb__298) then true else ((v_hasFreeVarMaybe (mc0 + 1)) dtb__299))
  | _ -> failwith "DT: impossible branch"
)
  | B_dData_dMaybe.C_Maybe_Nothing -> false
  | _ -> failwith "DT: impossible branch"
)) dtb__294))
  | C_Term_TPi (dtb__300, dtb__301, dtb__302, dtb__303, dtb__304) -> (if ((v_hasFreeVar mc0) dtb__303) then true else ((v_hasFreeVar (mc0 + 1)) dtb__304))
  | C_Term_TType (dtb__305) -> false
  | C_Term_TGlobal (dtb__306) -> false
  | C_Term_TMeta (dtb__307) -> false
  | C_Term_TVar (dtb__308, dtb__309, dtb__310) -> (dtb__309 >= mc0)
  | _ -> failwith "DT: impossible branch"
))
# 554 "Vuna/Compiler/Core/Term.vuna"
and v_hasFreeVarMaybe = (fun (mc0 : int) (mc1 : t_Term B_dData_dMaybe.t_Maybe) -> (match mc1 with
  | B_dData_dMaybe.C_Maybe_Just (dtb__311) -> ((v_hasFreeVar mc0) dtb__311)
  | B_dData_dMaybe.C_Maybe_Nothing -> false
  | _ -> failwith "DT: impossible branch"
))
# 558 "Vuna/Compiler/Core/Term.vuna"
and v_hasFreeVarArgs = (fun (mc0 : int) (mc1 : (t_Term, t_Rig) B_dData_dPair.t_Pair B_dData_dList.t_List) -> (match mc1 with
  | B_dData_dList.C_List__x58__x58_ (dtb__312, dtb__313) -> (match dtb__312 with
  | { B_dData_dPair.f_Pair_first = dtb__314; B_dData_dPair.f_Pair_second = dtb__315 } -> (if ((v_hasFreeVar mc0) dtb__314) then true else ((v_hasFreeVarArgs mc0) dtb__313))
  | _ -> failwith "DT: impossible branch"
)
  | B_dData_dList.C_List_Nil -> false
  | _ -> failwith "DT: impossible branch"
))
# 562 "Vuna/Compiler/Core/Term.vuna"
and v_hasFreeVarAlts = (fun (mc0 : int) (mc1 : t_CaseAlt B_dData_dList.t_List) -> (match mc1 with
  | B_dData_dList.C_List__x58__x58_ (dtb__316, dtb__317) -> (if ((v_hasFreeVar (mc0 + (B_dData_dList.v_length (v_caseAltBinders dtb__316)))) (v_caseAltBody dtb__316)) then true else ((v_hasFreeVarAlts mc0) dtb__317))
  | B_dData_dList.C_List_Nil -> false
  | _ -> failwith "DT: impossible branch"
))

# 567 "Vuna/Compiler/Core/Term.vuna"
let rec v_hasMeta = (fun (mc0 : int) (mc1 : int) (mc2 : t_Term) -> (match mc2 with
  | C_Term_TIf (dtb__318, dtb__319, dtb__320) -> (if (if (((v_hasMeta mc0) mc1) dtb__318) then true else (((v_hasMeta mc0) mc1) dtb__319)) then true else (((v_hasMeta mc0) mc1) dtb__320))
  | C_Term_TBool (dtb__321) -> false
  | C_Term_TFloat (dtb__322) -> false
  | C_Term_TStr (dtb__323) -> false
  | C_Term_TInt (dtb__324) -> false
  | C_Term_TCase (dtb__325, dtb__326) -> (if (((v_hasMeta mc0) mc1) dtb__325) then true else (((v_hasMetaAlts mc0) mc1) dtb__326))
  | C_Term_TRecUpd (dtb__327, dtb__328, dtb__329, dtb__330, dtb__331) -> (if (((v_hasMeta mc0) mc1) dtb__327) then true else (((v_hasMeta mc0) (mc1 + (B_dData_dList.v_length dtb__329))) dtb__331))
  | C_Term_TProj (dtb__332, dtb__333, dtb__334, dtb__335, dtb__336) -> (((v_hasMeta mc0) mc1) dtb__332)
  | C_Term_TRecord (dtb__337, dtb__338) -> (((v_hasMetaArgs mc0) mc1) dtb__338)
  | C_Term_TMk (dtb__339, dtb__340) -> (((v_hasMetaArgs mc0) mc1) dtb__340)
  | C_Term_TCon (dtb__341, dtb__342) -> (((v_hasMetaArgs mc0) mc1) dtb__342)
  | C_Term_TApp (dtb__343, dtb__344, dtb__345) -> (if (((v_hasMeta mc0) mc1) dtb__343) then true else (((v_hasMeta mc0) mc1) dtb__344))
  | C_Term_TLam (dtb__346, dtb__347, dtb__348, dtb__349, dtb__350) -> ((fun tys -> (if tys then true else (((v_hasMeta mc0) (mc1 + 1)) dtb__350))) ((fun nd_uscrut8 -> (match nd_uscrut8 with
  | B_dData_dMaybe.C_Maybe_Just (dtb__351) -> (match dtb__351 with
  | { B_dData_dPair.f_Pair_first = dtb__352; B_dData_dPair.f_Pair_second = dtb__353 } -> (if (((v_hasMetaMaybe mc0) mc1) dtb__352) then true else (((v_hasMetaMaybe mc0) (mc1 + 1)) dtb__353))
  | _ -> failwith "DT: impossible branch"
)
  | B_dData_dMaybe.C_Maybe_Nothing -> false
  | _ -> failwith "DT: impossible branch"
)) dtb__348))
  | C_Term_TPi (dtb__354, dtb__355, dtb__356, dtb__357, dtb__358) -> (if (((v_hasMeta mc0) mc1) dtb__357) then true else (((v_hasMeta mc0) (mc1 + 1)) dtb__358))
  | C_Term_TType (dtb__359) -> false
  | C_Term_TGlobal (dtb__360) -> false
  | C_Term_TVar (dtb__361, dtb__362, dtb__363) -> false
  | C_Term_TMeta (dtb__364) -> (mc0 = dtb__364)
  | _ -> failwith "DT: impossible branch"
))
# 594 "Vuna/Compiler/Core/Term.vuna"
and v_hasMetaMaybe = (fun (mc0 : int) (mc1 : int) (mc2 : t_Term B_dData_dMaybe.t_Maybe) -> (match mc2 with
  | B_dData_dMaybe.C_Maybe_Just (dtb__365) -> (((v_hasMeta mc0) mc1) dtb__365)
  | B_dData_dMaybe.C_Maybe_Nothing -> false
  | _ -> failwith "DT: impossible branch"
))
# 598 "Vuna/Compiler/Core/Term.vuna"
and v_hasMetaArgs = (fun (mc0 : int) (mc1 : int) (mc2 : (t_Term, t_Rig) B_dData_dPair.t_Pair B_dData_dList.t_List) -> (match mc2 with
  | B_dData_dList.C_List__x58__x58_ (dtb__366, dtb__367) -> (match dtb__366 with
  | { B_dData_dPair.f_Pair_first = dtb__368; B_dData_dPair.f_Pair_second = dtb__369 } -> (if (((v_hasMeta mc0) mc1) dtb__368) then true else (((v_hasMetaArgs mc0) mc1) dtb__367))
  | _ -> failwith "DT: impossible branch"
)
  | B_dData_dList.C_List_Nil -> false
  | _ -> failwith "DT: impossible branch"
))
# 602 "Vuna/Compiler/Core/Term.vuna"
and v_hasMetaAlts = (fun (mc0 : int) (mc1 : int) (mc2 : t_CaseAlt B_dData_dList.t_List) -> (match mc2 with
  | B_dData_dList.C_List__x58__x58_ (dtb__370, dtb__371) -> (if (((v_hasMeta mc0) (mc1 + (B_dData_dList.v_length (v_caseAltBinders dtb__370)))) (v_caseAltBody dtb__370)) then true else (((v_hasMetaAlts mc0) mc1) dtb__371))
  | B_dData_dList.C_List_Nil -> false
  | _ -> failwith "DT: impossible branch"
))

# 608 "Vuna/Compiler/Core/Term.vuna"
let v_mapTermMaybe = (fun (mc0 : (t_Term) -> t_Term) (mc1 : t_Term B_dData_dMaybe.t_Maybe) -> (match mc1 with
  | B_dData_dMaybe.C_Maybe_Just (dtb__372) -> (B_dData_dMaybe.C_Maybe_Just ((mc0 dtb__372)))
  | B_dData_dMaybe.C_Maybe_Nothing -> B_dData_dMaybe.C_Maybe_Nothing
  | _ -> failwith "DT: impossible branch"
))

# 619 "Vuna/Compiler/Core/Term.vuna"
let v_lamBinderTyOf = (fun (mc0 : (t_Term B_dData_dMaybe.t_Maybe, t_Term B_dData_dMaybe.t_Maybe) B_dData_dPair.t_Pair B_dData_dMaybe.t_Maybe) -> (match mc0 with
  | B_dData_dMaybe.C_Maybe_Just (dtb__373) -> (B_dData_dPair.v_firstOf dtb__373)
  | B_dData_dMaybe.C_Maybe_Nothing -> B_dData_dMaybe.C_Maybe_Nothing
  | _ -> failwith "DT: impossible branch"
))

# 623 "Vuna/Compiler/Core/Term.vuna"
let v_lamResultTyOf = (fun (mc0 : (t_Term B_dData_dMaybe.t_Maybe, t_Term B_dData_dMaybe.t_Maybe) B_dData_dPair.t_Pair B_dData_dMaybe.t_Maybe) -> (match mc0 with
  | B_dData_dMaybe.C_Maybe_Just (dtb__374) -> (B_dData_dPair.v_secondOf dtb__374)
  | B_dData_dMaybe.C_Maybe_Nothing -> B_dData_dMaybe.C_Maybe_Nothing
  | _ -> failwith "DT: impossible branch"
))

# 627 "Vuna/Compiler/Core/Term.vuna"
let v_lamTyOf = (fun (mc0 : t_Term B_dData_dMaybe.t_Maybe) (mc1 : t_Term B_dData_dMaybe.t_Maybe) -> (match mc0 with
  | B_dData_dMaybe.C_Maybe_Nothing -> (match mc1 with
  | B_dData_dMaybe.C_Maybe_Nothing -> B_dData_dMaybe.C_Maybe_Nothing
  | _ -> (B_dData_dMaybe.C_Maybe_Just ({ B_dData_dPair.f_Pair_first = mc0; B_dData_dPair.f_Pair_second = mc1 }))
)
  | _ -> (B_dData_dMaybe.C_Maybe_Just ({ B_dData_dPair.f_Pair_first = mc0; B_dData_dPair.f_Pair_second = mc1 }))
))

# 631 "Vuna/Compiler/Core/Term.vuna"
let v_lamTyWithBinder = (fun (binderTy : t_Term B_dData_dMaybe.t_Maybe) -> ((v_lamTyOf binderTy) B_dData_dMaybe.C_Maybe_Nothing))

# 634 "Vuna/Compiler/Core/Term.vuna"
let v_lamTyWithResult = (fun (resultTy : t_Term B_dData_dMaybe.t_Maybe) -> ((v_lamTyOf B_dData_dMaybe.C_Maybe_Nothing) resultTy))

# 637 "Vuna/Compiler/Core/Term.vuna"
let v_lamTyMap = (fun (mc0 : (int) -> (t_Term) -> t_Term) (mc1 : int) (mc2 : (t_Term B_dData_dMaybe.t_Maybe, t_Term B_dData_dMaybe.t_Maybe) B_dData_dPair.t_Pair B_dData_dMaybe.t_Maybe) -> (match mc2 with
  | B_dData_dMaybe.C_Maybe_Just (dtb__375) -> ((v_lamTyOf ((v_mapTermMaybe (mc0 mc1)) (B_dData_dPair.v_firstOf dtb__375))) ((v_mapTermMaybe (mc0 (mc1 + 1))) (B_dData_dPair.v_secondOf dtb__375)))
  | B_dData_dMaybe.C_Maybe_Nothing -> B_dData_dMaybe.C_Maybe_Nothing
  | _ -> failwith "DT: impossible branch"
))

# 646 "Vuna/Compiler/Core/Term.vuna"
let rec v_shift = (fun (mc0 : int) (mc1 : int) (mc2 : t_Term) -> (match mc2 with
  | C_Term_TIf (dtb__376, dtb__377, dtb__378) -> (C_Term_TIf ((((v_shift mc0) mc1) dtb__376), (((v_shift mc0) mc1) dtb__377), (((v_shift mc0) mc1) dtb__378)))
  | C_Term_TBool (dtb__379) -> mc2
  | C_Term_TFloat (dtb__380) -> mc2
  | C_Term_TStr (dtb__381) -> mc2
  | C_Term_TInt (dtb__382) -> mc2
  | C_Term_TCase (dtb__383, dtb__384) -> (C_Term_TCase ((((v_shift mc0) mc1) dtb__383), (((v_shiftAlts mc0) mc1) dtb__384)))
  | C_Term_TRecUpd (dtb__385, dtb__386, dtb__387, dtb__388, dtb__389) -> (C_Term_TRecUpd ((((v_shift mc0) mc1) dtb__385), dtb__386, dtb__387, dtb__388, (((v_shift (mc0 + (B_dData_dList.v_length dtb__387))) mc1) dtb__389)))
  | C_Term_TProj (dtb__390, dtb__391, dtb__392, dtb__393, dtb__394) -> (C_Term_TProj ((((v_shift mc0) mc1) dtb__390), dtb__391, dtb__392, dtb__393, dtb__394))
  | C_Term_TRecord (dtb__395, dtb__396) -> (C_Term_TRecord (dtb__395, (((v_shiftArgs mc0) mc1) dtb__396)))
  | C_Term_TMk (dtb__397, dtb__398) -> (C_Term_TMk (dtb__397, (((v_shiftArgs mc0) mc1) dtb__398)))
  | C_Term_TCon (dtb__399, dtb__400) -> (C_Term_TCon (dtb__399, (((v_shiftArgs mc0) mc1) dtb__400)))
  | C_Term_TApp (dtb__401, dtb__402, dtb__403) -> (C_Term_TApp ((((v_shift mc0) mc1) dtb__401), (((v_shift mc0) mc1) dtb__402), dtb__403))
  | C_Term_TLam (dtb__404, dtb__405, dtb__406, dtb__407, dtb__408) -> ((fun slot2 -> (C_Term_TLam (dtb__404, dtb__405, slot2, dtb__407, (((v_shift (mc0 + 1)) mc1) dtb__408)))) ((fun nd_uscrut8 -> (match nd_uscrut8 with
  | B_dData_dMaybe.C_Maybe_Just (dtb__409) -> (match dtb__409 with
  | { B_dData_dPair.f_Pair_first = dtb__410; B_dData_dPair.f_Pair_second = dtb__411 } -> ((v_lamTyOf (match dtb__410 with
  | B_dData_dMaybe.C_Maybe_Nothing -> B_dData_dMaybe.C_Maybe_Nothing
  | B_dData_dMaybe.C_Maybe_Just (dtb__412) -> (B_dData_dMaybe.C_Maybe_Just ((((v_shift mc0) mc1) dtb__412)))
  | _ -> failwith "DT: impossible branch"
)) (match dtb__411 with
  | B_dData_dMaybe.C_Maybe_Nothing -> B_dData_dMaybe.C_Maybe_Nothing
  | B_dData_dMaybe.C_Maybe_Just (dtb__413) -> (B_dData_dMaybe.C_Maybe_Just ((((v_shift (mc0 + 1)) mc1) dtb__413)))
  | _ -> failwith "DT: impossible branch"
))
  | _ -> failwith "DT: impossible branch"
)
  | B_dData_dMaybe.C_Maybe_Nothing -> B_dData_dMaybe.C_Maybe_Nothing
  | _ -> failwith "DT: impossible branch"
)) dtb__406))
  | C_Term_TPi (dtb__414, dtb__415, dtb__416, dtb__417, dtb__418) -> (C_Term_TPi (dtb__414, dtb__415, dtb__416, (((v_shift mc0) mc1) dtb__417), (((v_shift (mc0 + 1)) mc1) dtb__418)))
  | C_Term_TType (dtb__419) -> mc2
  | C_Term_TGlobal (dtb__420) -> mc2
  | C_Term_TMeta (dtb__421) -> mc2
  | C_Term_TVar (dtb__422, dtb__423, dtb__424) -> (if (dtb__423 >= mc0) then (C_Term_TVar (dtb__422, (dtb__423 + mc1), dtb__424)) else mc2)
  | _ -> failwith "DT: impossible branch"
))
# 685 "Vuna/Compiler/Core/Term.vuna"
and v_shiftArgs = (fun (mc0 : int) (mc1 : int) (mc2 : (t_Term, t_Rig) B_dData_dPair.t_Pair B_dData_dList.t_List) -> (match mc2 with
  | B_dData_dList.C_List__x58__x58_ (dtb__425, dtb__426) -> (match dtb__425 with
  | { B_dData_dPair.f_Pair_first = dtb__427; B_dData_dPair.f_Pair_second = dtb__428 } -> (B_dData_dList.C_List__x58__x58_ ({ B_dData_dPair.f_Pair_first = (((v_shift mc0) mc1) dtb__427); B_dData_dPair.f_Pair_second = dtb__428 }, (((v_shiftArgs mc0) mc1) dtb__426)))
  | _ -> failwith "DT: impossible branch"
)
  | B_dData_dList.C_List_Nil -> B_dData_dList.C_List_Nil
  | _ -> failwith "DT: impossible branch"
))
# 690 "Vuna/Compiler/Core/Term.vuna"
and v_shiftAlts = (fun (mc0 : int) (mc1 : int) (mc2 : t_CaseAlt B_dData_dList.t_List) -> (match mc2 with
  | B_dData_dList.C_List__x58__x58_ (dtb__429, dtb__430) -> (B_dData_dList.C_List__x58__x58_ ((((v_shiftAlt mc0) mc1) dtb__429), (((v_shiftAlts mc0) mc1) dtb__430)))
  | B_dData_dList.C_List_Nil -> B_dData_dList.C_List_Nil
  | _ -> failwith "DT: impossible branch"
))
# 694 "Vuna/Compiler/Core/Term.vuna"
and v_shiftAlt = (fun (mc0 : int) (mc1 : int) (mc2 : t_CaseAlt) -> (match mc2 with
  | { f_CaseAlt_caseAltName = dtb__431; f_CaseAlt_caseAltBinders = dtb__432; f_CaseAlt_caseAltBody = dtb__433 } -> { f_CaseAlt_caseAltName = dtb__431; f_CaseAlt_caseAltBinders = dtb__432; f_CaseAlt_caseAltBody = (((v_shift (mc0 + (B_dData_dList.v_length dtb__432))) mc1) dtb__433) }
  | _ -> failwith "DT: impossible branch"
))

# 699 "Vuna/Compiler/Core/Term.vuna"
let rec v_substVarAt = (fun (mc0 : int) (mc1 : t_Term) (mc2 : t_Term) -> (match mc2 with
  | C_Term_TIf (dtb__434, dtb__435, dtb__436) -> (C_Term_TIf ((((v_substVarAt mc0) mc1) dtb__434), (((v_substVarAt mc0) mc1) dtb__435), (((v_substVarAt mc0) mc1) dtb__436)))
  | C_Term_TBool (dtb__437) -> mc2
  | C_Term_TFloat (dtb__438) -> mc2
  | C_Term_TStr (dtb__439) -> mc2
  | C_Term_TInt (dtb__440) -> mc2
  | C_Term_TCase (dtb__441, dtb__442) -> (C_Term_TCase ((((v_substVarAt mc0) mc1) dtb__441), ((B_dData_dList.v_map ((v_substAltAt mc0) mc1)) dtb__442)))
  | C_Term_TRecUpd (dtb__443, dtb__444, dtb__445, dtb__446, dtb__447) -> (C_Term_TRecUpd ((((v_substVarAt mc0) mc1) dtb__443), dtb__444, dtb__445, dtb__446, (((v_substVarAt (mc0 + (B_dData_dList.v_length dtb__445))) mc1) dtb__447)))
  | C_Term_TProj (dtb__448, dtb__449, dtb__450, dtb__451, dtb__452) -> (C_Term_TProj ((((v_substVarAt mc0) mc1) dtb__448), dtb__449, dtb__450, dtb__451, dtb__452))
  | C_Term_TRecord (dtb__453, dtb__454) -> (C_Term_TRecord (dtb__453, ((B_dData_dList.v_map (fun (p : (t_Term, t_Rig) B_dData_dPair.t_Pair) -> { B_dData_dPair.f_Pair_first = (((v_substVarAt mc0) mc1) (B_dData_dPair.v_firstOf p)); B_dData_dPair.f_Pair_second = (B_dData_dPair.v_secondOf p) })) dtb__454)))
  | C_Term_TMk (dtb__455, dtb__456) -> (C_Term_TMk (dtb__455, ((B_dData_dList.v_map (fun (p : (t_Term, t_Rig) B_dData_dPair.t_Pair) -> { B_dData_dPair.f_Pair_first = (((v_substVarAt mc0) mc1) (B_dData_dPair.v_firstOf p)); B_dData_dPair.f_Pair_second = (B_dData_dPair.v_secondOf p) })) dtb__456)))
  | C_Term_TCon (dtb__457, dtb__458) -> (C_Term_TCon (dtb__457, ((B_dData_dList.v_map (fun (p : (t_Term, t_Rig) B_dData_dPair.t_Pair) -> { B_dData_dPair.f_Pair_first = (((v_substVarAt mc0) mc1) (B_dData_dPair.v_firstOf p)); B_dData_dPair.f_Pair_second = (B_dData_dPair.v_secondOf p) })) dtb__458)))
  | C_Term_TApp (dtb__459, dtb__460, dtb__461) -> (C_Term_TApp ((((v_substVarAt mc0) mc1) dtb__459), (((v_substVarAt mc0) mc1) dtb__460), dtb__461))
  | C_Term_TLam (dtb__462, dtb__463, dtb__464, dtb__465, dtb__466) -> ((fun slot2 -> (C_Term_TLam (dtb__462, dtb__463, slot2, dtb__465, (((v_substVarAt (mc0 + 1)) mc1) dtb__466)))) ((fun nd_uscrut8 -> (match nd_uscrut8 with
  | B_dData_dMaybe.C_Maybe_Just (dtb__467) -> (match dtb__467 with
  | { B_dData_dPair.f_Pair_first = dtb__468; B_dData_dPair.f_Pair_second = dtb__469 } -> ((v_lamTyOf (match dtb__468 with
  | B_dData_dMaybe.C_Maybe_Nothing -> B_dData_dMaybe.C_Maybe_Nothing
  | B_dData_dMaybe.C_Maybe_Just (dtb__470) -> (B_dData_dMaybe.C_Maybe_Just ((((v_substVarAt mc0) mc1) dtb__470)))
  | _ -> failwith "DT: impossible branch"
)) (match dtb__469 with
  | B_dData_dMaybe.C_Maybe_Nothing -> B_dData_dMaybe.C_Maybe_Nothing
  | B_dData_dMaybe.C_Maybe_Just (dtb__471) -> (B_dData_dMaybe.C_Maybe_Just ((((v_substVarAt (mc0 + 1)) mc1) dtb__471)))
  | _ -> failwith "DT: impossible branch"
))
  | _ -> failwith "DT: impossible branch"
)
  | B_dData_dMaybe.C_Maybe_Nothing -> B_dData_dMaybe.C_Maybe_Nothing
  | _ -> failwith "DT: impossible branch"
)) dtb__464))
  | C_Term_TPi (dtb__472, dtb__473, dtb__474, dtb__475, dtb__476) -> (C_Term_TPi (dtb__472, dtb__473, dtb__474, (((v_substVarAt mc0) mc1) dtb__475), (((v_substVarAt (mc0 + 1)) mc1) dtb__476)))
  | C_Term_TType (dtb__477) -> mc2
  | C_Term_TGlobal (dtb__478) -> mc2
  | C_Term_TMeta (dtb__479) -> mc2
  | C_Term_TVar (dtb__480, dtb__481, dtb__482) -> (if (dtb__481 = mc0) then mc1 else mc2)
  | _ -> failwith "DT: impossible branch"
))
# 741 "Vuna/Compiler/Core/Term.vuna"
and v_substAltAt = (fun (idx : int) (arg : t_Term) (alt : t_CaseAlt) -> { f_CaseAlt_caseAltName = (v_caseAltName alt); f_CaseAlt_caseAltBinders = (v_caseAltBinders alt); f_CaseAlt_caseAltBody = (((v_substVarAt (idx + (B_dData_dList.v_length (v_caseAltBinders alt)))) arg) (v_caseAltBody alt)) })

# 751 "Vuna/Compiler/Core/Term.vuna"
let rec v_substMetaVarGo = (fun (mc0 : int) (mc1 : string) (mc2 : int) (mc3 : int) (mc4 : t_Term) -> (match mc4 with
  | C_Term_TIf (dtb__483, dtb__484, dtb__485) -> (C_Term_TIf ((((((v_substMetaVarGo mc0) mc1) mc2) mc3) dtb__483), (((((v_substMetaVarGo mc0) mc1) mc2) mc3) dtb__484), (((((v_substMetaVarGo mc0) mc1) mc2) mc3) dtb__485)))
  | C_Term_TCase (dtb__486, dtb__487) -> (C_Term_TCase ((((((v_substMetaVarGo mc0) mc1) mc2) mc3) dtb__486), ((B_dData_dList.v_map ((((v_substMetaVarAlt mc0) mc1) mc2) mc3)) dtb__487)))
  | C_Term_TProj (dtb__488, dtb__489, dtb__490, dtb__491, dtb__492) -> (C_Term_TProj ((((((v_substMetaVarGo mc0) mc1) mc2) mc3) dtb__488), dtb__489, dtb__490, dtb__491, dtb__492))
  | C_Term_TRecord (dtb__493, dtb__494) -> (C_Term_TRecord (dtb__493, ((B_dData_dList.v_map (fun (p : (t_Term, t_Rig) B_dData_dPair.t_Pair) -> { B_dData_dPair.f_Pair_first = (((((v_substMetaVarGo mc0) mc1) mc2) mc3) (B_dData_dPair.v_firstOf p)); B_dData_dPair.f_Pair_second = (B_dData_dPair.v_secondOf p) })) dtb__494)))
  | C_Term_TMk (dtb__495, dtb__496) -> (C_Term_TMk (dtb__495, ((B_dData_dList.v_map (fun (p : (t_Term, t_Rig) B_dData_dPair.t_Pair) -> { B_dData_dPair.f_Pair_first = (((((v_substMetaVarGo mc0) mc1) mc2) mc3) (B_dData_dPair.v_firstOf p)); B_dData_dPair.f_Pair_second = (B_dData_dPair.v_secondOf p) })) dtb__496)))
  | C_Term_TCon (dtb__497, dtb__498) -> (C_Term_TCon (dtb__497, ((B_dData_dList.v_map (fun (p : (t_Term, t_Rig) B_dData_dPair.t_Pair) -> { B_dData_dPair.f_Pair_first = (((((v_substMetaVarGo mc0) mc1) mc2) mc3) (B_dData_dPair.v_firstOf p)); B_dData_dPair.f_Pair_second = (B_dData_dPair.v_secondOf p) })) dtb__498)))
  | C_Term_TApp (dtb__499, dtb__500, dtb__501) -> (C_Term_TApp ((((((v_substMetaVarGo mc0) mc1) mc2) mc3) dtb__499), (((((v_substMetaVarGo mc0) mc1) mc2) mc3) dtb__500), dtb__501))
  | C_Term_TLam (dtb__502, dtb__503, dtb__504, dtb__505, dtb__506) -> ((fun slot2 -> (C_Term_TLam (dtb__502, dtb__503, slot2, dtb__505, (((((v_substMetaVarGo mc0) mc1) mc2) (mc3 + 1)) dtb__506)))) ((fun nd_uscrut10 -> (match nd_uscrut10 with
  | B_dData_dMaybe.C_Maybe_Just (dtb__507) -> (match dtb__507 with
  | { B_dData_dPair.f_Pair_first = dtb__508; B_dData_dPair.f_Pair_second = dtb__509 } -> ((v_lamTyOf (match dtb__508 with
  | B_dData_dMaybe.C_Maybe_Nothing -> B_dData_dMaybe.C_Maybe_Nothing
  | B_dData_dMaybe.C_Maybe_Just (dtb__510) -> (B_dData_dMaybe.C_Maybe_Just ((((((v_substMetaVarGo mc0) mc1) mc2) mc3) dtb__510)))
  | _ -> failwith "DT: impossible branch"
)) (match dtb__509 with
  | B_dData_dMaybe.C_Maybe_Nothing -> B_dData_dMaybe.C_Maybe_Nothing
  | B_dData_dMaybe.C_Maybe_Just (dtb__511) -> (B_dData_dMaybe.C_Maybe_Just ((((((v_substMetaVarGo mc0) mc1) mc2) (mc3 + 1)) dtb__511)))
  | _ -> failwith "DT: impossible branch"
))
  | _ -> failwith "DT: impossible branch"
)
  | B_dData_dMaybe.C_Maybe_Nothing -> B_dData_dMaybe.C_Maybe_Nothing
  | _ -> failwith "DT: impossible branch"
)) dtb__504))
  | C_Term_TPi (dtb__512, dtb__513, dtb__514, dtb__515, dtb__516) -> (C_Term_TPi (dtb__512, dtb__513, dtb__514, (((((v_substMetaVarGo mc0) mc1) mc2) mc3) dtb__515), (((((v_substMetaVarGo mc0) mc1) mc2) (mc3 + 1)) dtb__516)))
  | C_Term_TMeta (dtb__517) -> (if (dtb__517 = mc0) then (C_Term_TVar (mc1, (mc3 - mc2), { Base_dSource.f_Span_spanFile = ""; Base_dSource.f_Span_spanStartLine = 0; Base_dSource.f_Span_spanStartCol = 0; Base_dSource.f_Span_spanEndLine = 0; Base_dSource.f_Span_spanEndCol = 0; Base_dSource.f_Span_spanStartOffset = 0; Base_dSource.f_Span_spanEndOffset = 0 })) else mc4)
  | _ -> mc4
))
# 791 "Vuna/Compiler/Core/Term.vuna"
and v_substMetaVarAlt = (fun (mc0 : int) (mc1 : string) (mc2 : int) (mc3 : int) (mc4 : t_CaseAlt) -> (match mc4 with
  | { f_CaseAlt_caseAltName = dtb__518; f_CaseAlt_caseAltBinders = dtb__519; f_CaseAlt_caseAltBody = dtb__520 } -> { f_CaseAlt_caseAltName = dtb__518; f_CaseAlt_caseAltBinders = dtb__519; f_CaseAlt_caseAltBody = (((((v_substMetaVarGo mc0) mc1) mc2) (mc3 + (B_dData_dList.v_length dtb__519))) dtb__520) }
  | _ -> failwith "DT: impossible branch"
))

# 748 "Vuna/Compiler/Core/Term.vuna"
let v_substMetaVar = (fun (m : int) (name : string) (q : int) (t : t_Term) -> (((((v_substMetaVarGo m) name) q) 0) t))

# 803 "Vuna/Compiler/Core/Term.vuna"
let rec v_insertDictBinderGo = (fun (mc0 : string) (mc1 : int) (mc2 : t_Term) (mc3 : int) (mc4 : t_Term) -> (match mc4 with
  | C_Term_TPi (dtb__521, dtb__522, dtb__523, dtb__524, dtb__525) -> (if (mc3 = mc1) then (C_Term_TPi (dtb__521, dtb__522, dtb__523, dtb__524, (C_Term_TPi (mc0, true, C_Rig_RigOmega, mc2, (((v_shift 0) 1) dtb__525))))) else (C_Term_TPi (dtb__521, dtb__522, dtb__523, dtb__524, (((((v_insertDictBinderGo mc0) mc1) mc2) (mc3 + 1)) dtb__525))))
  | _ -> mc4
))

# 797 "Vuna/Compiler/Core/Term.vuna"
let v_insertDictBinder = (fun (name : string) (idx : int) (dictDom : t_Term) (t : t_Term) -> (((((v_insertDictBinderGo name) idx) dictDom) 0) t))

# 815 "Vuna/Compiler/Core/Term.vuna"
let rec v_insertImplicitBinderGo = (fun (mc0 : string) (mc1 : int) (mc2 : t_Rig) (mc3 : t_Term) (mc4 : int) (mc5 : t_Term) -> (match mc5 with
  | C_Term_TPi (dtb__526, dtb__527, dtb__528, dtb__529, dtb__530) -> (if (mc4 = mc1) then (C_Term_TPi (dtb__526, dtb__527, dtb__528, dtb__529, (C_Term_TPi (mc0, true, mc2, mc3, (((v_shift 0) 1) dtb__530))))) else (C_Term_TPi (dtb__526, dtb__527, dtb__528, dtb__529, ((((((v_insertImplicitBinderGo mc0) mc1) mc2) mc3) (mc4 + 1)) dtb__530))))
  | _ -> mc5
))

# 812 "Vuna/Compiler/Core/Term.vuna"
let v_insertImplicitBinder = (fun (name : string) (idx : int) (rig : t_Rig) (dom : t_Term) (t : t_Term) -> ((((((v_insertImplicitBinderGo name) idx) rig) dom) 0) t))

# 824 "Vuna/Compiler/Core/Term.vuna"
let v_cutoffOf = (fun (total : int) (idx : int) -> (if ((total - (idx + 1)) <= 0) then 0 else (total - (idx + 1))))

# 827 "Vuna/Compiler/Core/Term.vuna"
let rec v_countPis = (fun (mc0 : t_Term) -> (match mc0 with
  | C_Term_TPi (dtb__531, dtb__532, dtb__533, dtb__534, dtb__535) -> (1 + (v_countPis dtb__535))
  | _ -> 0
))

# 839 "Vuna/Compiler/Core/Term.vuna"
let rec v_insertLamBinderGo = (fun (mc0 : string) (mc1 : int) (mc2 : int) (mc3 : t_Term) -> (match mc3 with
  | C_Term_TLam (dtb__536, dtb__537, dtb__538, dtb__539, dtb__540) -> (if (mc2 = mc1) then (C_Term_TLam (dtb__536, dtb__537, dtb__538, dtb__539, (C_Term_TLam (mc0, C_Rig_RigOmega, B_dData_dMaybe.C_Maybe_Nothing, Base_dSource.v_spanEmpty, (((v_shift 0) 1) dtb__540))))) else (C_Term_TLam (dtb__536, dtb__537, dtb__538, dtb__539, ((((v_insertLamBinderGo mc0) mc1) (mc2 + 1)) dtb__540))))
  | _ -> mc3
))

# 836 "Vuna/Compiler/Core/Term.vuna"
let v_insertLamBinder = (fun (name : string) (idx : int) (t : t_Term) -> ((((v_insertLamBinderGo name) idx) 0) t))

# 847 "Vuna/Compiler/Core/Term.vuna"
let rec v_countLams = (fun (mc0 : t_Term) -> (match mc0 with
  | C_Term_TLam (dtb__541, dtb__542, dtb__543, dtb__544, dtb__545) -> (1 + (v_countLams dtb__545))
  | _ -> 0
))

# 852 "Vuna/Compiler/Core/Term.vuna"
let rec v_hasFreeTermVar = (fun (mc0 : int) (mc1 : t_Term) -> (match mc1 with
  | C_Term_TIf (dtb__546, dtb__547, dtb__548) -> (if (if ((v_hasFreeTermVar mc0) dtb__546) then true else ((v_hasFreeTermVar mc0) dtb__547)) then true else ((v_hasFreeTermVar mc0) dtb__548))
  | C_Term_TCase (dtb__549, dtb__550) -> (if ((v_hasFreeTermVar mc0) dtb__549) then true else ((v_anyAltFree mc0) dtb__550))
  | C_Term_TRecUpd (dtb__551, dtb__552, dtb__553, dtb__554, dtb__555) -> (if ((v_hasFreeTermVar mc0) dtb__551) then true else ((v_hasFreeTermVar (mc0 + (B_dData_dList.v_length dtb__553))) dtb__555))
  | C_Term_TProj (dtb__556, dtb__557, dtb__558, dtb__559, dtb__560) -> ((v_hasFreeTermVar mc0) dtb__556)
  | C_Term_TRecord (dtb__561, dtb__562) -> ((v_anyPairFree mc0) dtb__562)
  | C_Term_TMk (dtb__563, dtb__564) -> ((v_anyPairFree mc0) dtb__564)
  | C_Term_TCon (dtb__565, dtb__566) -> ((v_anyPairFree mc0) dtb__566)
  | C_Term_TApp (dtb__567, dtb__568, dtb__569) -> (if ((v_hasFreeTermVar mc0) dtb__567) then true else ((v_hasFreeTermVar mc0) dtb__568))
  | C_Term_TLam (dtb__570, dtb__571, dtb__572, dtb__573, dtb__574) -> ((fun tys -> (if tys then true else ((v_hasFreeTermVar (mc0 + 1)) dtb__574))) ((fun nd_uscrut7 -> (match nd_uscrut7 with
  | B_dData_dMaybe.C_Maybe_Just (dtb__575) -> (match dtb__575 with
  | { B_dData_dPair.f_Pair_first = dtb__576; B_dData_dPair.f_Pair_second = dtb__577 } -> (if ((v_hasFreeTermVarMaybe mc0) dtb__576) then true else ((v_hasFreeTermVarMaybe (mc0 + 1)) dtb__577))
  | _ -> failwith "DT: impossible branch"
)
  | B_dData_dMaybe.C_Maybe_Nothing -> false
  | _ -> failwith "DT: impossible branch"
)) dtb__572))
  | C_Term_TPi (dtb__578, dtb__579, dtb__580, dtb__581, dtb__582) -> (if ((v_hasFreeTermVar mc0) dtb__581) then true else ((v_hasFreeTermVar (mc0 + 1)) dtb__582))
  | C_Term_TVar (dtb__583, dtb__584, dtb__585) -> (dtb__584 >= mc0)
  | _ -> false
))
# 875 "Vuna/Compiler/Core/Term.vuna"
and v_hasFreeTermVarMaybe = (fun (mc0 : int) (mc1 : t_Term B_dData_dMaybe.t_Maybe) -> (match mc1 with
  | B_dData_dMaybe.C_Maybe_Just (dtb__586) -> ((v_hasFreeTermVar mc0) dtb__586)
  | B_dData_dMaybe.C_Maybe_Nothing -> false
  | _ -> failwith "DT: impossible branch"
))
# 879 "Vuna/Compiler/Core/Term.vuna"
and v_anyPairFree = (fun (mc0 : int) (mc1 : (t_Term, t_Rig) B_dData_dPair.t_Pair B_dData_dList.t_List) -> (match mc1 with
  | B_dData_dList.C_List__x58__x58_ (dtb__587, dtb__588) -> (match dtb__587 with
  | { B_dData_dPair.f_Pair_first = dtb__589; B_dData_dPair.f_Pair_second = dtb__590 } -> (if ((v_hasFreeTermVar mc0) dtb__589) then true else ((v_anyPairFree mc0) dtb__588))
  | _ -> failwith "DT: impossible branch"
)
  | B_dData_dList.C_List_Nil -> false
  | _ -> failwith "DT: impossible branch"
))
# 883 "Vuna/Compiler/Core/Term.vuna"
and v_anyAltFree = (fun (mc0 : int) (mc1 : t_CaseAlt B_dData_dList.t_List) -> (match mc1 with
  | B_dData_dList.C_List__x58__x58_ (dtb__591, dtb__592) -> (match dtb__591 with
  | { f_CaseAlt_caseAltName = dtb__593; f_CaseAlt_caseAltBinders = dtb__594; f_CaseAlt_caseAltBody = dtb__595 } -> (if ((v_hasFreeTermVar (mc0 + (B_dData_dList.v_length dtb__594))) dtb__595) then true else ((v_anyAltFree mc0) dtb__592))
  | _ -> failwith "DT: impossible branch"
)
  | B_dData_dList.C_List_Nil -> false
  | _ -> failwith "DT: impossible branch"
))

# 891 "Vuna/Compiler/Core/Term.vuna"
let rec v_hasNegativeVar = (fun (mc0 : t_Term) -> (match mc0 with
  | C_Term_TIf (dtb__596, dtb__597, dtb__598) -> (if (if (v_hasNegativeVar dtb__596) then true else (v_hasNegativeVar dtb__597)) then true else (v_hasNegativeVar dtb__598))
  | C_Term_TCase (dtb__599, dtb__600) -> (if (v_hasNegativeVar dtb__599) then true else (v_anyNegativeVarAlts dtb__600))
  | C_Term_TRecUpd (dtb__601, dtb__602, dtb__603, dtb__604, dtb__605) -> (if (v_hasNegativeVar dtb__601) then true else (v_hasNegativeVar dtb__605))
  | C_Term_TProj (dtb__606, dtb__607, dtb__608, dtb__609, dtb__610) -> (v_hasNegativeVar dtb__606)
  | C_Term_TRecord (dtb__611, dtb__612) -> (v_anyNegativeVarArgs dtb__612)
  | C_Term_TMk (dtb__613, dtb__614) -> (v_anyNegativeVarArgs dtb__614)
  | C_Term_TCon (dtb__615, dtb__616) -> (v_anyNegativeVarArgs dtb__616)
  | C_Term_TApp (dtb__617, dtb__618, dtb__619) -> (if (v_hasNegativeVar dtb__617) then true else (v_hasNegativeVar dtb__618))
  | C_Term_TLam (dtb__620, dtb__621, dtb__622, dtb__623, dtb__624) -> ((fun tys -> (if tys then true else (v_hasNegativeVar dtb__624))) ((fun nd_uscrut6 -> (match nd_uscrut6 with
  | B_dData_dMaybe.C_Maybe_Just (dtb__625) -> (match dtb__625 with
  | { B_dData_dPair.f_Pair_first = dtb__626; B_dData_dPair.f_Pair_second = dtb__627 } -> (if (v_hasNegativeVarMaybe dtb__626) then true else (v_hasNegativeVarMaybe dtb__627))
  | _ -> failwith "DT: impossible branch"
)
  | B_dData_dMaybe.C_Maybe_Nothing -> false
  | _ -> failwith "DT: impossible branch"
)) dtb__622))
  | C_Term_TPi (dtb__628, dtb__629, dtb__630, dtb__631, dtb__632) -> (if (v_hasNegativeVar dtb__631) then true else (v_hasNegativeVar dtb__632))
  | C_Term_TVar (dtb__633, dtb__634, dtb__635) -> (dtb__634 < 0)
  | _ -> false
))
# 911 "Vuna/Compiler/Core/Term.vuna"
and v_hasNegativeVarMaybe = (fun (mc0 : t_Term B_dData_dMaybe.t_Maybe) -> (match mc0 with
  | B_dData_dMaybe.C_Maybe_Just (dtb__636) -> (v_hasNegativeVar dtb__636)
  | B_dData_dMaybe.C_Maybe_Nothing -> false
  | _ -> failwith "DT: impossible branch"
))
# 915 "Vuna/Compiler/Core/Term.vuna"
and v_anyNegativeVarArgs = (fun (mc0 : (t_Term, t_Rig) B_dData_dPair.t_Pair B_dData_dList.t_List) -> (match mc0 with
  | B_dData_dList.C_List__x58__x58_ (dtb__637, dtb__638) -> (match dtb__637 with
  | { B_dData_dPair.f_Pair_first = dtb__639; B_dData_dPair.f_Pair_second = dtb__640 } -> (if (v_hasNegativeVar dtb__639) then true else (v_anyNegativeVarArgs dtb__638))
  | _ -> failwith "DT: impossible branch"
)
  | B_dData_dList.C_List_Nil -> false
  | _ -> failwith "DT: impossible branch"
))
# 919 "Vuna/Compiler/Core/Term.vuna"
and v_anyNegativeVarAlts = (fun (mc0 : t_CaseAlt B_dData_dList.t_List) -> (match mc0 with
  | B_dData_dList.C_List__x58__x58_ (dtb__641, dtb__642) -> (match dtb__641 with
  | { f_CaseAlt_caseAltName = dtb__643; f_CaseAlt_caseAltBinders = dtb__644; f_CaseAlt_caseAltBody = dtb__645 } -> (if (v_hasNegativeVar dtb__645) then true else (v_anyNegativeVarAlts dtb__642))
  | _ -> failwith "DT: impossible branch"
)
  | B_dData_dList.C_List_Nil -> false
  | _ -> failwith "DT: impossible branch"
))

# 925 "Vuna/Compiler/Core/Term.vuna"
let v_metaScanBound = 262144

# 931 "Vuna/Compiler/Core/Term.vuna"
let rec v_hasUnsolvedMetaValueFuel = (fun (fuel : int) (sols : t_Sols) (v : t_Value) -> (if (fuel <= 0) then true else (match v with
  | C_Value_VMeta (dtb__646, dtb__647) -> (match ((v_solsLookup dtb__646) sols) with
  | B_dData_dMaybe.C_Maybe_Just (dtb__648) -> (((v_hasUnsolvedMetaValueFuel (fuel - 1)) sols) dtb__648)
  | B_dData_dMaybe.C_Maybe_Nothing -> true
  | _ -> failwith "DT: impossible branch"
)
  | C_Value_VNeutral (dtb__649) -> (match dtb__649 with
  | C_Neutral_NVar (dtb__650, dtb__651, dtb__652) -> (((v_hasUnsolvedMetaListFuel (fuel - 1)) sols) dtb__652)
  | C_Neutral_NGlobal (dtb__653, dtb__654) -> (((v_hasUnsolvedMetaListFuel (fuel - 1)) sols) dtb__654)
  | _ -> failwith "DT: impossible branch"
)
  | C_Value_VPi (dtb__655, dtb__656, dtb__657, dtb__658, dtb__659) -> (if (((v_hasUnsolvedMetaValueFuel (fuel - 1)) sols) dtb__658) then true else (((v_hasUnsolvedMetaCloFuel (fuel - 1)) sols) dtb__659))
  | C_Value_VLam (dtb__660, dtb__661, dtb__662) -> (((v_hasUnsolvedMetaCloFuel (fuel - 1)) sols) dtb__662)
  | C_Value_VCon (dtb__663, dtb__664) -> (((v_hasUnsolvedMetaListFuel (fuel - 1)) sols) dtb__664)
  | C_Value_VApp (dtb__665, dtb__666) -> (if (((v_hasUnsolvedMetaValueFuel (fuel - 1)) sols) dtb__665) then true else (((v_hasUnsolvedMetaValueFuel (fuel - 1)) sols) dtb__666))
  | C_Value_VCase (dtb__667, dtb__668) -> (((v_hasUnsolvedMetaValueFuel (fuel - 1)) sols) dtb__667)
  | C_Value_VProj (dtb__669, dtb__670, dtb__671, dtb__672, dtb__673) -> (((v_hasUnsolvedMetaValueFuel (fuel - 1)) sols) dtb__669)
  | C_Value_VIf (dtb__674, dtb__675, dtb__676) -> (if (if (((v_hasUnsolvedMetaValueFuel (fuel - 1)) sols) dtb__674) then true else (((v_hasUnsolvedMetaValueFuel (fuel - 1)) sols) dtb__675)) then true else (((v_hasUnsolvedMetaValueFuel (fuel - 1)) sols) dtb__676))
  | _ -> false
)))
# 957 "Vuna/Compiler/Core/Term.vuna"
and v_hasUnsolvedMetaListFuel = (fun (fuel : int) (sols : t_Sols) (vs : t_Value B_dData_dList.t_List) -> (if (fuel <= 0) then true else (match vs with
  | B_dData_dList.C_List_Nil -> false
  | B_dData_dList.C_List__x58__x58_ (dtb__677, dtb__678) -> (if (((v_hasUnsolvedMetaValueFuel (fuel - 1)) sols) dtb__677) then true else (((v_hasUnsolvedMetaListFuel (fuel - 1)) sols) dtb__678))
  | _ -> failwith "DT: impossible branch"
)))
# 969 "Vuna/Compiler/Core/Term.vuna"
and v_hasUnsolvedMetaCloFuel = (fun (fuel : int) (sols : t_Sols) (clo : t_Closure) -> (if (fuel <= 0) then true else (match clo with
  | { f_Closure_closureEnv = dtb__679; f_Closure_closureBody = dtb__680 } -> (((v_hasUnsolvedMetaListFuel (fuel - 1)) sols) dtb__679)
  | _ -> failwith "DT: impossible branch"
)))

# 928 "Vuna/Compiler/Core/Term.vuna"
let v_hasUnsolvedMetaValue = (fun (sols : t_Sols) (v : t_Value) -> (((v_hasUnsolvedMetaValueFuel v_metaScanBound) sols) v))

# 954 "Vuna/Compiler/Core/Term.vuna"
let v_hasUnsolvedMetaList = (fun (sols : t_Sols) (vs : t_Value B_dData_dList.t_List) -> (((v_hasUnsolvedMetaListFuel v_metaScanBound) sols) vs))

# 966 "Vuna/Compiler/Core/Term.vuna"
let v_hasUnsolvedMetaClo = (fun (sols : t_Sols) (clo : t_Closure) -> (((v_hasUnsolvedMetaCloFuel v_metaScanBound) sols) clo))

# 980 "Vuna/Compiler/Core/Term.vuna"
let v_isTypeValue = (fun (mc0 : t_Value) -> (match mc0 with
  | C_Value_VType (dtb__681) -> true
  | _ -> false
))

# 984 "Vuna/Compiler/Core/Term.vuna"
let v_typeLevelOf = (fun (mc0 : t_Value) -> (match mc0 with
  | C_Value_VType (dtb__682) -> (B_dData_dMaybe.C_Maybe_Just (dtb__682))
  | _ -> B_dData_dMaybe.C_Maybe_Nothing
))

# 992 "Vuna/Compiler/Core/Term.vuna"
let rec v_levelEscapes = (fun (mc0 : int) (mc1 : int) (mc2 : t_Value) -> (match mc2 with
  | C_Value_VBool (dtb__683) -> false
  | C_Value_VFloat (dtb__684) -> false
  | C_Value_VStr (dtb__685) -> false
  | C_Value_VInt (dtb__686) -> false
  | C_Value_VType (dtb__687) -> false
  | C_Value_VIf (dtb__688, dtb__689, dtb__690) -> (if (if (((v_levelEscapes mc0) mc1) dtb__688) then true else (((v_levelEscapes mc0) mc1) dtb__689)) then true else (((v_levelEscapes mc0) mc1) dtb__690))
  | C_Value_VProj (dtb__691, dtb__692, dtb__693, dtb__694, dtb__695) -> (((v_levelEscapes mc0) mc1) dtb__691)
  | C_Value_VCase (dtb__696, dtb__697) -> (((v_levelEscapes mc0) mc1) dtb__696)
  | C_Value_VApp (dtb__698, dtb__699) -> (if (((v_levelEscapes mc0) mc1) dtb__698) then true else (((v_levelEscapes mc0) mc1) dtb__699))
  | C_Value_VCon (dtb__700, dtb__701) -> ((v_levelEscapesList mc0) dtb__701)
  | C_Value_VMeta (dtb__702, dtb__703) -> ((v_levelEscapesList mc0) dtb__703)
  | C_Value_VLam (dtb__704, dtb__705, dtb__706) -> ((v_levelEscapesClo mc0) dtb__706)
  | C_Value_VPi (dtb__707, dtb__708, dtb__709, dtb__710, dtb__711) -> (if (((v_levelEscapes mc0) mc1) dtb__710) then true else ((v_levelEscapesClo mc0) dtb__711))
  | C_Value_VNeutral (dtb__712) -> (match dtb__712 with
  | C_Neutral_NVar (dtb__713, dtb__714, dtb__715) -> (if (dtb__714 >= mc0) then true else ((v_levelEscapesList mc0) dtb__715))
  | C_Neutral_NGlobal (dtb__716, dtb__717) -> ((v_levelEscapesList mc0) dtb__717)
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
))
# 1013 "Vuna/Compiler/Core/Term.vuna"
and v_levelEscapesList = (fun (mc0 : int) (mc1 : t_Value B_dData_dList.t_List) -> (match mc1 with
  | B_dData_dList.C_List__x58__x58_ (dtb__718, dtb__719) -> (if (((v_levelEscapes mc0) 0) dtb__718) then true else ((v_levelEscapesList mc0) dtb__719))
  | B_dData_dList.C_List_Nil -> false
  | _ -> failwith "DT: impossible branch"
))
# 1017 "Vuna/Compiler/Core/Term.vuna"
and v_levelEscapesClo = (fun (mc0 : int) (mc1 : t_Closure) -> (match mc1 with
  | { f_Closure_closureEnv = dtb__720; f_Closure_closureBody = dtb__721 } -> ((v_levelEscapesList mc0) dtb__720)
  | _ -> failwith "DT: impossible branch"
))

# 1097 "Vuna/Compiler/Core/Term.vuna"
let rec v_showBinders = (fun (mc0 : (string, t_Rig) B_dData_dPair.t_Pair B_dData_dList.t_List) -> (match mc0 with
  | B_dData_dList.C_List__x58__x58_ (dtb__722, dtb__723) -> (match dtb__722 with
  | { B_dData_dPair.f_Pair_first = dtb__724; B_dData_dPair.f_Pair_second = dtb__725 } -> (String.concat "" [" "; dtb__724; (v_showBinders dtb__723)])
  | _ -> failwith "DT: impossible branch"
)
  | B_dData_dList.C_List_Nil -> ""
  | _ -> failwith "DT: impossible branch"
))

# 1104 "Vuna/Compiler/Core/Term.vuna"
let rec v_showCoreChars = (fun (mc0 : int B_dData_dList.t_List) -> (match mc0 with
  | B_dData_dList.C_List__x58__x58_ (dtb__726, dtb__727) -> (if (dtb__726 = 34) then ("\\\"" ^ (v_showCoreChars dtb__727)) else (if (dtb__726 = 92) then ("\\\\" ^ (v_showCoreChars dtb__727)) else (if (dtb__726 = 10) then ("\\n" ^ (v_showCoreChars dtb__727)) else (if (dtb__726 = 9) then ("\\t" ^ (v_showCoreChars dtb__727)) else (if (dtb__726 = 13) then ("\\r" ^ (v_showCoreChars dtb__727)) else ((B_dData_dList.dtp_pack (B_dData_dList.C_List__x58__x58_ (dtb__726, B_dData_dList.C_List_Nil))) ^ (v_showCoreChars dtb__727)))))))
  | B_dData_dList.C_List_Nil -> ""
  | _ -> failwith "DT: impossible branch"
))

# 1101 "Vuna/Compiler/Core/Term.vuna"
let v_showCoreString = (fun (s : string) -> (String.concat "" ["\""; (v_showCoreChars (B_dData_dList.dtp_unpack s)); "\""]))

# 1020 "Vuna/Compiler/Core/Term.vuna"
let rec v_showTerm = (fun (mc0 : t_Term) -> (match mc0 with
  | C_Term_TIf (dtb__728, dtb__729, dtb__730) -> (String.concat "" ["if "; (v_showTerm dtb__728); " then "; (v_showTerm dtb__729); " else "; (v_showTerm dtb__730)])
  | C_Term_TBool (dtb__731) -> (if dtb__731 then "True" else "False")
  | C_Term_TFloat (dtb__732) -> dtb__732
  | C_Term_TStr (dtb__733) -> (v_showCoreString dtb__733)
  | C_Term_TInt (dtb__734) -> (bi_strFromInt dtb__734)
  | C_Term_TCase (dtb__735, dtb__736) -> (String.concat "" ["case "; (v_showTerm dtb__735); " of "; (v_showCoreAlts dtb__736)])
  | C_Term_TRecUpd (dtb__737, dtb__738, dtb__739, dtb__740, dtb__741) -> (String.concat "" [(v_showTerm dtb__737); " with "; dtb__738; " "; (v_showTerm dtb__741)])
  | C_Term_TProj (dtb__742, dtb__743, dtb__744, dtb__745, dtb__746) -> (String.concat "" [(v_showTerm dtb__742); "."; dtb__743; "#"; (bi_strFromInt dtb__746)])
  | C_Term_TRecord (dtb__747, dtb__748) -> ((v_recordAppShow dtb__747) dtb__748)
  | C_Term_TMk (dtb__749, dtb__750) -> (String.concat "" ["("; dtb__749; (v_showArgTerms dtb__750); ")"])
  | C_Term_TCon (dtb__751, dtb__752) -> (String.concat "" ["("; dtb__751; (v_showArgTerms dtb__752); ")"])
  | C_Term_TApp (dtb__753, dtb__754, dtb__755) -> (String.concat "" ["("; (v_showTerm dtb__753); " "; (v_showTerm dtb__754); ")"])
  | C_Term_TLam (dtb__756, dtb__757, dtb__758, dtb__759, dtb__760) -> (String.concat "" ["\\"; dtb__756; " => "; (v_showTerm dtb__760)])
  | C_Term_TPi (dtb__761, dtb__762, dtb__763, dtb__764, dtb__765) -> (if (dtb__761 = "_") then (String.concat "" [(v_showTerm dtb__764); " -> "; (v_showTerm dtb__765)]) else (if dtb__762 then (String.concat "" ["{"; dtb__761; " : "; (v_showTerm dtb__764); "} -> "; (v_showTerm dtb__765)]) else (String.concat "" ["("; dtb__761; " : "; (v_showTerm dtb__764); ") -> "; (v_showTerm dtb__765)])))
  | C_Term_TType (dtb__766) -> (if ((v_levelToInt dtb__766) = 0) then "Type" else ("Type " ^ (bi_strFromInt (v_levelToInt dtb__766))))
  | C_Term_TGlobal (dtb__767) -> dtb__767
  | C_Term_TMeta (dtb__768) -> ("?" ^ (bi_strFromInt dtb__768))
  | C_Term_TVar (dtb__769, dtb__770, dtb__771) -> dtb__769
  | _ -> failwith "DT: impossible branch"
))
# 1077 "Vuna/Compiler/Core/Term.vuna"
and v_showArgTerms = (fun (mc0 : (t_Term, t_Rig) B_dData_dPair.t_Pair B_dData_dList.t_List) -> (match mc0 with
  | B_dData_dList.C_List__x58__x58_ (dtb__772, dtb__773) -> (match dtb__772 with
  | { B_dData_dPair.f_Pair_first = dtb__774; B_dData_dPair.f_Pair_second = dtb__775 } -> (String.concat "" [" "; (v_showTerm dtb__774); (v_showArgTerms dtb__773)])
  | _ -> failwith "DT: impossible branch"
)
  | B_dData_dList.C_List_Nil -> ""
  | _ -> failwith "DT: impossible branch"
))
# 1082 "Vuna/Compiler/Core/Term.vuna"
and v_recordAppShow = (fun (mc0 : string) (mc1 : (t_Term, t_Rig) B_dData_dPair.t_Pair B_dData_dList.t_List) -> (match mc1 with
  | B_dData_dList.C_List__x58__x58_ (dtb__776, dtb__777) -> (match dtb__776 with
  | { B_dData_dPair.f_Pair_first = dtb__778; B_dData_dPair.f_Pair_second = dtb__779 } -> ((v_recordAppShow (String.concat "" ["("; mc0; " "; (v_showTerm dtb__778); ")"])) dtb__777)
  | _ -> failwith "DT: impossible branch"
)
  | B_dData_dList.C_List_Nil -> mc0
  | _ -> failwith "DT: impossible branch"
))
# 1092 "Vuna/Compiler/Core/Term.vuna"
and v_showCoreAlts = (fun (mc0 : t_CaseAlt B_dData_dList.t_List) -> (match mc0 with
  | B_dData_dList.C_List__x58__x58_ (dtb__780, dtb__781) -> (String.concat "" [(v_caseAltName dtb__780); (v_showBinders (v_binderPairs (v_caseAltBinders dtb__780))); " => "; (v_showTerm (v_caseAltBody dtb__780)); " | "; (v_showCoreAlts dtb__781)])
  | B_dData_dList.C_List_Nil -> ""
  | _ -> failwith "DT: impossible branch"
))

# 1052 "Vuna/Compiler/Core/Term.vuna"
let rec v_showPiSig = (fun (name : string) (implicit : bool) (dom : t_Term) (cod : t_Term) -> (if (name = "_") then (String.concat "" [(v_showSigParenIfPi dom); " -> "; (v_showTypeSig cod)]) else (if implicit then (String.concat "" ["{"; name; " : "; (v_showTypeSig dom); "} -> "; (v_showTypeSig cod)]) else (String.concat "" ["("; name; " : "; (v_showTypeSig dom); ") -> "; (v_showTypeSig cod)]))))
# 1061 "Vuna/Compiler/Core/Term.vuna"
and v_showTypeSig = (fun (mc0 : t_Term) -> (match mc0 with
  | C_Term_TRecord (dtb__782, dtb__783) -> ((v_showSigAppText dtb__782) dtb__783)
  | C_Term_TCon (dtb__784, dtb__785) -> (match dtb__785 with
  | B_dData_dList.C_List_Nil -> dtb__784
  | _ -> (String.concat "" ["("; dtb__784; (v_showSigArgs dtb__785); ")"])
)
  | C_Term_TApp (dtb__786, dtb__787, dtb__788) -> (String.concat "" ["("; (v_showSigParenIfPi dtb__786); " "; (v_showSigParenIfPi dtb__787); ")"])
  | C_Term_TPi (dtb__789, dtb__790, dtb__791, dtb__792, dtb__793) -> ((((v_showPiSig dtb__789) dtb__790) dtb__792) dtb__793)
  | _ -> (v_showTerm mc0)
))
# 1069 "Vuna/Compiler/Core/Term.vuna"
and v_showSigParenIfPi = (fun (mc0 : t_Term) -> (match mc0 with
  | C_Term_TPi (dtb__794, dtb__795, dtb__796, dtb__797, dtb__798) -> (String.concat "" ["("; ((((v_showPiSig dtb__794) dtb__795) dtb__797) dtb__798); ")"])
  | _ -> (v_showTypeSig mc0)
))
# 1073 "Vuna/Compiler/Core/Term.vuna"
and v_showSigArgs = (fun (mc0 : (t_Term, t_Rig) B_dData_dPair.t_Pair B_dData_dList.t_List) -> (match mc0 with
  | B_dData_dList.C_List__x58__x58_ (dtb__799, dtb__800) -> (match dtb__799 with
  | { B_dData_dPair.f_Pair_first = dtb__801; B_dData_dPair.f_Pair_second = dtb__802 } -> (String.concat "" [" "; (v_showSigParenIfPi dtb__801); (v_showSigArgs dtb__800)])
  | _ -> failwith "DT: impossible branch"
)
  | B_dData_dList.C_List_Nil -> ""
  | _ -> failwith "DT: impossible branch"
))
# 1087 "Vuna/Compiler/Core/Term.vuna"
and v_showSigAppText = (fun (mc0 : string) (mc1 : (t_Term, t_Rig) B_dData_dPair.t_Pair B_dData_dList.t_List) -> (match mc1 with
  | B_dData_dList.C_List__x58__x58_ (dtb__803, dtb__804) -> (match dtb__803 with
  | { B_dData_dPair.f_Pair_first = dtb__805; B_dData_dPair.f_Pair_second = dtb__806 } -> ((v_showSigAppText (String.concat "" ["("; mc0; " "; (v_showSigParenIfPi dtb__805); ")"])) dtb__804)
  | _ -> failwith "DT: impossible branch"
)
  | B_dData_dList.C_List_Nil -> mc0
  | _ -> failwith "DT: impossible branch"
))
