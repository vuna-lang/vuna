open Vuna_runtime
type t_Rig = C_Rig_Rig0 | C_Rig_Rig1 | C_Rig_RigOmega
and t_Level = int
and t_Term = C_Term_TVar of (string) * (int) * (Base_dSource.t_Span) | C_Term_TMeta of (int) | C_Term_TGlobal of (string) | C_Term_TType of (t_Level) | C_Term_TPi of (string) * (bool) * (t_Rig) * (t_Term) * (t_Term) | C_Term_TLam of (string) * (t_Rig) * ((t_LamMark, (t_Term B_dData_dMaybe.t_Maybe, t_Term B_dData_dMaybe.t_Maybe) B_dData_dPair.t_Pair) B_dData_dPair.t_Pair B_dData_dMaybe.t_Maybe) * (Base_dSource.t_Span) * (t_Term) | C_Term_TApp of (t_Term) * (t_Term) * (t_Rig) | C_Term_TCon of (string) * ((t_Term, t_Rig) B_dData_dPair.t_Pair B_dData_dList.t_List) | C_Term_TMk of (string) * ((t_Term, t_Rig) B_dData_dPair.t_Pair B_dData_dList.t_List) | C_Term_TCase of (t_Term) * (t_CaseAlt B_dData_dList.t_List) | C_Term_TProj of (t_Term) * (string) * ((string, t_Rig) B_dData_dPair.t_Pair B_dData_dList.t_List) * (int) * (int) | C_Term_TRecUpd of (t_Term) * (string) * ((string, t_Rig) B_dData_dPair.t_Pair B_dData_dList.t_List) * (int B_dData_dList.t_List) * (t_Term) | C_Term_TInt of (int) | C_Term_TStr of (string) | C_Term_TBool of (bool) | C_Term_TIf of (t_Term) * (t_Term) * (t_Term) | C_Term_TFloat of (string) | C_Term_TRecord of (string) * ((t_Term, t_Rig) B_dData_dPair.t_Pair B_dData_dList.t_List)
and t_Binder = { f_Binder_binderName : string; f_Binder_binderRig : t_Rig; f_Binder_binderSpan : Base_dSource.t_Span }
and t_CaseAlt = { f_CaseAlt_caseAltName : string; f_CaseAlt_caseAltBinders : t_Binder B_dData_dList.t_List; f_CaseAlt_caseAltBody : t_Term }
and t_Closure = { f_Closure_closureEnv : t_Value B_dData_dList.t_List; f_Closure_closureBody : t_Term }
and t_Neutral = C_Neutral_NVar of (string) * (int) * (t_Value B_dData_dList.t_List) | C_Neutral_NGlobal of (string) * (t_Value B_dData_dList.t_List)
and t_Value = C_Value_VType of (t_Level) | C_Value_VPi of (string) * (bool) * (t_Rig) * (t_Value) * (t_Closure) | C_Value_VLam of (string) * (t_Rig) * (t_Closure) | C_Value_VNeutral of (t_Neutral) | C_Value_VMeta of (int) * (t_Value B_dData_dList.t_List) | C_Value_VApp of (t_Value) * (t_Value) | C_Value_VCon of (string) * (t_Value B_dData_dList.t_List) | C_Value_VCase of (t_Value) * (t_VCaseAlt B_dData_dList.t_List) | C_Value_VProj of (t_Value) * (string) * ((string, t_Rig) B_dData_dPair.t_Pair B_dData_dList.t_List) * (int) * (int) | C_Value_VInt of (int) | C_Value_VStr of (string) | C_Value_VBool of (bool) | C_Value_VIf of (t_Value) * (t_Value) * (t_Value) | C_Value_VFloat of (string)
and t_VCaseAlt = { f_VCaseAlt_vCaseAltName : string; f_VCaseAlt_vCaseAltBinders : (string, t_Rig) B_dData_dPair.t_Pair B_dData_dList.t_List; f_VCaseAlt_vCaseAltClosure : t_Closure }
and t_Sols = { f_Sols_solsTbl : (int, t_Value) B_dContainer_dHashMap.t_HashMap; f_Sols_solsList : (int, t_Value) B_dData_dPair.t_Pair B_dData_dList.t_List; f_Sols_solsDepth : (int, int) B_dContainer_dHashMap.t_HashMap }
and t_LamMark = C_LamMark_LamPlain | C_LamMark_LamLinearClosure

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
) else (if (c = Base_dIntrinsics.v_natSuccCtor) then (let nd_uscrut3 = args in (match nd_uscrut3 with
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
)) else B_dData_dMaybe.C_Maybe_Nothing)))

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

# 359 "Vuna/Compiler/Core/Term.vuna"
let v_termSizeMaybeTerms = (fun (mc0 : t_Term B_dData_dMaybe.t_Maybe) -> (match mc0 with
  | B_dData_dMaybe.C_Maybe_Just (dtb__49) -> (B_dData_dList.C_List__x58__x58_ (dtb__49, B_dData_dList.C_List_Nil))
  | B_dData_dMaybe.C_Maybe_Nothing -> B_dData_dList.C_List_Nil
  | _ -> failwith "DT: impossible branch"
))

# 354 "Vuna/Compiler/Core/Term.vuna"
let v_termSizeSlotTerms = (fun (mc0 : (t_LamMark, (t_Term B_dData_dMaybe.t_Maybe, t_Term B_dData_dMaybe.t_Maybe) B_dData_dPair.t_Pair) B_dData_dPair.t_Pair B_dData_dMaybe.t_Maybe) -> (match mc0 with
  | B_dData_dMaybe.C_Maybe_Just (dtb__50) -> ((B_dData_dList.v_append (v_termSizeMaybeTerms (B_dData_dPair.v_firstOf (B_dData_dPair.v_secondOf dtb__50)))) (v_termSizeMaybeTerms (B_dData_dPair.v_secondOf (B_dData_dPair.v_secondOf dtb__50))))
  | B_dData_dMaybe.C_Maybe_Nothing -> B_dData_dList.C_List_Nil
  | _ -> failwith "DT: impossible branch"
))

# 326 "Vuna/Compiler/Core/Term.vuna"
let v_termSizeWork = (fun (mc0 : t_Term) -> (match mc0 with
  | C_Term_TIf (dtb__51, dtb__52, dtb__53) -> (B_dData_dList.C_List__x58__x58_ (dtb__51, (B_dData_dList.C_List__x58__x58_ (dtb__52, (B_dData_dList.C_List__x58__x58_ (dtb__53, B_dData_dList.C_List_Nil))))))
  | C_Term_TRecUpd (dtb__54, dtb__55, dtb__56, dtb__57, dtb__58) -> (B_dData_dList.C_List__x58__x58_ (dtb__54, (B_dData_dList.C_List__x58__x58_ (dtb__58, B_dData_dList.C_List_Nil))))
  | C_Term_TProj (dtb__59, dtb__60, dtb__61, dtb__62, dtb__63) -> (B_dData_dList.C_List__x58__x58_ (dtb__59, B_dData_dList.C_List_Nil))
  | C_Term_TCase (dtb__64, dtb__65) -> (B_dData_dList.C_List__x58__x58_ (dtb__64, (v_termSizeAltTerms dtb__65)))
  | C_Term_TRecord (dtb__66, dtb__67) -> (v_termSizeArgTerms dtb__67)
  | C_Term_TMk (dtb__68, dtb__69) -> (v_termSizeArgTerms dtb__69)
  | C_Term_TCon (dtb__70, dtb__71) -> (v_termSizeArgTerms dtb__71)
  | C_Term_TApp (dtb__72, dtb__73, dtb__74) -> (B_dData_dList.C_List__x58__x58_ (dtb__72, (B_dData_dList.C_List__x58__x58_ (dtb__73, B_dData_dList.C_List_Nil))))
  | C_Term_TLam (dtb__75, dtb__76, dtb__77, dtb__78, dtb__79) -> ((B_dData_dList.v_append (v_termSizeSlotTerms dtb__77)) (B_dData_dList.C_List__x58__x58_ (dtb__79, B_dData_dList.C_List_Nil)))
  | C_Term_TPi (dtb__80, dtb__81, dtb__82, dtb__83, dtb__84) -> (B_dData_dList.C_List__x58__x58_ (dtb__83, (B_dData_dList.C_List__x58__x58_ (dtb__84, B_dData_dList.C_List_Nil))))
  | C_Term_TBool (dtb__85) -> B_dData_dList.C_List_Nil
  | C_Term_TFloat (dtb__86) -> B_dData_dList.C_List_Nil
  | C_Term_TStr (dtb__87) -> B_dData_dList.C_List_Nil
  | C_Term_TInt (dtb__88) -> B_dData_dList.C_List_Nil
  | C_Term_TType (dtb__89) -> B_dData_dList.C_List_Nil
  | C_Term_TGlobal (dtb__90) -> B_dData_dList.C_List_Nil
  | C_Term_TMeta (dtb__91) -> B_dData_dList.C_List_Nil
  | C_Term_TVar (dtb__92, dtb__93, dtb__94) -> B_dData_dList.C_List_Nil
  | _ -> failwith "DT: impossible branch"
))

# 320 "Vuna/Compiler/Core/Term.vuna"
let rec v_termSizeGo = (fun (mc0 : int) (mc1 : t_Term B_dData_dList.t_List) -> (match mc1 with
  | B_dData_dList.C_List__x58__x58_ (dtb__95, dtb__96) -> (if (mc0 <= 0) then 0 else (1 + ((v_termSizeGo (mc0 - 1)) ((B_dData_dList.v_append (v_termSizeWork dtb__95)) dtb__96))))
  | B_dData_dList.C_List_Nil -> 0
  | _ -> failwith "DT: impossible branch"
))

# 311 "Vuna/Compiler/Core/Term.vuna"
let v_termSize = (fun (t : t_Term) -> ((v_termSizeGo v_termSizeCap) (B_dData_dList.C_List__x58__x58_ (t, B_dData_dList.C_List_Nil))))

# 367 "Vuna/Compiler/Core/Term.vuna"
let v_metaLookup = (fun (i : int) (t : (int, t_Value) B_dContainer_dHashMap.t_HashMap) -> ((((B_dContainer_dHashMap.v_lookup B_dData_dInt.v_Hashable_ue4b0f10b020a5e82_uInt) B_dData_dInt.v_Eq_u018fc178ff3df1b4_uInt) i) t))

# 371 "Vuna/Compiler/Core/Term.vuna"
let rec v_metaLookupList = (fun (mc0 : int) (mc1 : (int, t_Value) B_dData_dPair.t_Pair B_dData_dList.t_List) -> (match mc1 with
  | B_dData_dList.C_List__x58__x58_ (dtb__97, dtb__98) -> (match dtb__97 with
  | { B_dData_dPair.f_Pair_first = dtb__99; B_dData_dPair.f_Pair_second = dtb__100 } -> (if (mc0 = dtb__99) then (B_dData_dMaybe.C_Maybe_Just (dtb__100)) else ((v_metaLookupList mc0) dtb__98))
  | _ -> failwith "DT: impossible branch"
)
  | B_dData_dList.C_List_Nil -> B_dData_dMaybe.C_Maybe_Nothing
  | _ -> failwith "DT: impossible branch"
))

# 390 "Vuna/Compiler/Core/Term.vuna"
let v_solsEmpty = { f_Sols_solsTbl = (((B_dContainer_dHashMap.v_fromList B_dData_dInt.v_Hashable_ue4b0f10b020a5e82_uInt) B_dData_dInt.v_Eq_u018fc178ff3df1b4_uInt) B_dData_dList.C_List_Nil); f_Sols_solsList = B_dData_dList.C_List_Nil; f_Sols_solsDepth = (((B_dContainer_dHashMap.v_fromList B_dData_dInt.v_Hashable_ue4b0f10b020a5e82_uInt) B_dData_dInt.v_Eq_u018fc178ff3df1b4_uInt) B_dData_dList.C_List_Nil) }

# 393 "Vuna/Compiler/Core/Term.vuna"
let v_solsFromList = (fun (xs : (int, t_Value) B_dData_dPair.t_Pair B_dData_dList.t_List) -> { f_Sols_solsTbl = ((((B_dContainer_dHashMap.v_insertAll B_dData_dInt.v_Hashable_ue4b0f10b020a5e82_uInt) B_dData_dInt.v_Eq_u018fc178ff3df1b4_uInt) xs) (((B_dContainer_dHashMap.v_fromList B_dData_dInt.v_Hashable_ue4b0f10b020a5e82_uInt) B_dData_dInt.v_Eq_u018fc178ff3df1b4_uInt) B_dData_dList.C_List_Nil)); f_Sols_solsList = xs; f_Sols_solsDepth = (((B_dContainer_dHashMap.v_fromList B_dData_dInt.v_Hashable_ue4b0f10b020a5e82_uInt) B_dData_dInt.v_Eq_u018fc178ff3df1b4_uInt) B_dData_dList.C_List_Nil) })

# 397 "Vuna/Compiler/Core/Term.vuna"
let v_solsOf = (fun (t : (int, t_Value) B_dContainer_dHashMap.t_HashMap) (xs : (int, t_Value) B_dData_dPair.t_Pair B_dData_dList.t_List) (d : (int, int) B_dContainer_dHashMap.t_HashMap) -> { f_Sols_solsTbl = t; f_Sols_solsList = xs; f_Sols_solsDepth = d })

# 400 "Vuna/Compiler/Core/Term.vuna"
let v_solsList = (fun (mc0 : t_Sols) -> (match mc0 with
  | { f_Sols_solsTbl = dtb__101; f_Sols_solsList = dtb__102; f_Sols_solsDepth = dtb__103 } -> dtb__102
  | _ -> failwith "DT: impossible branch"
))

# 404 "Vuna/Compiler/Core/Term.vuna"
let v_solsDepth = (fun (mc0 : int) (mc1 : t_Sols) -> (match mc1 with
  | { f_Sols_solsTbl = dtb__104; f_Sols_solsList = dtb__105; f_Sols_solsDepth = dtb__106 } -> ((((B_dContainer_dHashMap.v_lookup B_dData_dInt.v_Hashable_ue4b0f10b020a5e82_uInt) B_dData_dInt.v_Eq_u018fc178ff3df1b4_uInt) mc0) dtb__106)
  | _ -> failwith "DT: impossible branch"
))

# 409 "Vuna/Compiler/Core/Term.vuna"
let v_solsLookup = (fun (mc0 : int) (mc1 : t_Sols) -> (match mc1 with
  | { f_Sols_solsTbl = dtb__107; f_Sols_solsList = dtb__108; f_Sols_solsDepth = dtb__109 } -> ((((B_dContainer_dHashMap.v_lookup B_dData_dInt.v_Hashable_ue4b0f10b020a5e82_uInt) B_dData_dInt.v_Eq_u018fc178ff3df1b4_uInt) mc0) dtb__107)
  | _ -> failwith "DT: impossible branch"
))

# 412 "Vuna/Compiler/Core/Term.vuna"
let v_solsCons = (fun (mc0 : int) (mc1 : t_Value) (mc2 : t_Sols) -> (match mc2 with
  | { f_Sols_solsTbl = dtb__110; f_Sols_solsList = dtb__111; f_Sols_solsDepth = dtb__112 } -> { f_Sols_solsTbl = (((((B_dContainer_dHashMap.v_insert B_dData_dInt.v_Hashable_ue4b0f10b020a5e82_uInt) B_dData_dInt.v_Eq_u018fc178ff3df1b4_uInt) mc0) mc1) dtb__110); f_Sols_solsList = (B_dData_dList.C_List__x58__x58_ ({ B_dData_dPair.f_Pair_first = mc0; B_dData_dPair.f_Pair_second = mc1 }, dtb__111)); f_Sols_solsDepth = dtb__112 }
  | _ -> failwith "DT: impossible branch"
))

# 417 "Vuna/Compiler/Core/Term.vuna"
let rec v_termHasUnsolvedMeta = (fun (mc0 : t_Sols) (mc1 : t_Term) -> (match mc1 with
  | C_Term_TIf (dtb__113, dtb__114, dtb__115) -> (if (if ((v_termHasUnsolvedMeta mc0) dtb__113) then true else ((v_termHasUnsolvedMeta mc0) dtb__114)) then true else ((v_termHasUnsolvedMeta mc0) dtb__115))
  | C_Term_TBool (dtb__116) -> false
  | C_Term_TFloat (dtb__117) -> false
  | C_Term_TStr (dtb__118) -> false
  | C_Term_TInt (dtb__119) -> false
  | C_Term_TCase (dtb__120, dtb__121) -> (if ((v_termHasUnsolvedMeta mc0) dtb__120) then true else ((v_termHasUnsolvedMetaAlts mc0) dtb__121))
  | C_Term_TRecUpd (dtb__122, dtb__123, dtb__124, dtb__125, dtb__126) -> (if ((v_termHasUnsolvedMeta mc0) dtb__122) then true else ((v_termHasUnsolvedMeta mc0) dtb__126))
  | C_Term_TProj (dtb__127, dtb__128, dtb__129, dtb__130, dtb__131) -> ((v_termHasUnsolvedMeta mc0) dtb__127)
  | C_Term_TRecord (dtb__132, dtb__133) -> ((v_termHasUnsolvedMetaArgs mc0) dtb__133)
  | C_Term_TMk (dtb__134, dtb__135) -> ((v_termHasUnsolvedMetaArgs mc0) dtb__135)
  | C_Term_TCon (dtb__136, dtb__137) -> ((v_termHasUnsolvedMetaArgs mc0) dtb__137)
  | C_Term_TApp (dtb__138, dtb__139, dtb__140) -> (if ((v_termHasUnsolvedMeta mc0) dtb__138) then true else ((v_termHasUnsolvedMeta mc0) dtb__139))
  | C_Term_TLam (dtb__141, dtb__142, dtb__143, dtb__144, dtb__145) -> (let tys = (let nd_uscrut7 = dtb__143 in (match nd_uscrut7 with
  | B_dData_dMaybe.C_Maybe_Just (dtb__146) -> (match dtb__146 with
  | { B_dData_dPair.f_Pair_first = dtb__147; B_dData_dPair.f_Pair_second = dtb__148 } -> (match dtb__148 with
  | { B_dData_dPair.f_Pair_first = dtb__149; B_dData_dPair.f_Pair_second = dtb__150 } -> (if ((v_termHasUnsolvedMetaMaybe mc0) dtb__149) then true else ((v_termHasUnsolvedMetaMaybe mc0) dtb__150))
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
)
  | B_dData_dMaybe.C_Maybe_Nothing -> false
  | _ -> failwith "DT: impossible branch"
)) in (if tys then true else ((v_termHasUnsolvedMeta mc0) dtb__145)))
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
# 450 "Vuna/Compiler/Core/Term.vuna"
and v_termHasUnsolvedMetaMaybe = (fun (mc0 : t_Sols) (mc1 : t_Term B_dData_dMaybe.t_Maybe) -> (match mc1 with
  | B_dData_dMaybe.C_Maybe_Just (dtb__163) -> ((v_termHasUnsolvedMeta mc0) dtb__163)
  | B_dData_dMaybe.C_Maybe_Nothing -> false
  | _ -> failwith "DT: impossible branch"
))
# 454 "Vuna/Compiler/Core/Term.vuna"
and v_termHasUnsolvedMetaArgs = (fun (mc0 : t_Sols) (mc1 : (t_Term, t_Rig) B_dData_dPair.t_Pair B_dData_dList.t_List) -> (match mc1 with
  | B_dData_dList.C_List__x58__x58_ (dtb__164, dtb__165) -> (match dtb__164 with
  | { B_dData_dPair.f_Pair_first = dtb__166; B_dData_dPair.f_Pair_second = dtb__167 } -> (if ((v_termHasUnsolvedMeta mc0) dtb__166) then true else ((v_termHasUnsolvedMetaArgs mc0) dtb__165))
  | _ -> failwith "DT: impossible branch"
)
  | B_dData_dList.C_List_Nil -> false
  | _ -> failwith "DT: impossible branch"
))
# 459 "Vuna/Compiler/Core/Term.vuna"
and v_termHasUnsolvedMetaAlts = (fun (mc0 : t_Sols) (mc1 : t_CaseAlt B_dData_dList.t_List) -> (match mc1 with
  | B_dData_dList.C_List__x58__x58_ (dtb__168, dtb__169) -> (if ((v_termHasUnsolvedMeta mc0) (v_caseAltBody dtb__168)) then true else ((v_termHasUnsolvedMetaAlts mc0) dtb__169))
  | B_dData_dList.C_List_Nil -> false
  | _ -> failwith "DT: impossible branch"
))

# 466 "Vuna/Compiler/Core/Term.vuna"
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
# 489 "Vuna/Compiler/Core/Term.vuna"
and v_anyArgUsesFloat = (fun (mc0 : string B_dData_dList.t_List) (mc1 : (t_Term, t_Rig) B_dData_dPair.t_Pair B_dData_dList.t_List) -> (match mc1 with
  | B_dData_dList.C_List__x58__x58_ (dtb__214, dtb__215) -> (match dtb__214 with
  | { B_dData_dPair.f_Pair_first = dtb__216; B_dData_dPair.f_Pair_second = dtb__217 } -> (if ((v_termUsesFloat mc0) dtb__216) then true else ((v_anyArgUsesFloat mc0) dtb__215))
  | _ -> failwith "DT: impossible branch"
)
  | B_dData_dList.C_List_Nil -> false
  | _ -> failwith "DT: impossible branch"
))
# 494 "Vuna/Compiler/Core/Term.vuna"
and v_anyAltUsesFloat = (fun (mc0 : string B_dData_dList.t_List) (mc1 : t_CaseAlt B_dData_dList.t_List) -> (match mc1 with
  | B_dData_dList.C_List__x58__x58_ (dtb__218, dtb__219) -> (if ((v_termUsesFloat mc0) (v_caseAltBody dtb__218)) then true else ((v_anyAltUsesFloat mc0) dtb__219))
  | B_dData_dList.C_List_Nil -> false
  | _ -> failwith "DT: impossible branch"
))

# 500 "Vuna/Compiler/Core/Term.vuna"
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

# 523 "Vuna/Compiler/Core/Term.vuna"
let v_defLookup = (fun (name : string) (tbl : (string, t_Term) B_dContainer_dHashMap.t_HashMap) -> ((((B_dContainer_dHashMap.v_lookup B_dData_dString.v_Hashable_ue4b0f10b020a5e82_uString) B_dData_dString.v_Eq_u018fc178ff3df1b4_uString) name) tbl))

# 527 "Vuna/Compiler/Core/Term.vuna"
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
  | C_Term_TLam (dtb__292, dtb__293, dtb__294, dtb__295, dtb__296) -> (let tys = (let nd_uscrut7 = dtb__294 in (match nd_uscrut7 with
  | B_dData_dMaybe.C_Maybe_Just (dtb__297) -> (match dtb__297 with
  | { B_dData_dPair.f_Pair_first = dtb__298; B_dData_dPair.f_Pair_second = dtb__299 } -> (match dtb__299 with
  | { B_dData_dPair.f_Pair_first = dtb__300; B_dData_dPair.f_Pair_second = dtb__301 } -> (if ((v_hasFreeVarMaybe mc0) dtb__300) then true else ((v_hasFreeVarMaybe (mc0 + 1)) dtb__301))
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
)
  | B_dData_dMaybe.C_Maybe_Nothing -> false
  | _ -> failwith "DT: impossible branch"
)) in (if tys then true else ((v_hasFreeVar (mc0 + 1)) dtb__296)))
  | C_Term_TPi (dtb__302, dtb__303, dtb__304, dtb__305, dtb__306) -> (if ((v_hasFreeVar mc0) dtb__305) then true else ((v_hasFreeVar (mc0 + 1)) dtb__306))
  | C_Term_TType (dtb__307) -> false
  | C_Term_TGlobal (dtb__308) -> false
  | C_Term_TMeta (dtb__309) -> false
  | C_Term_TVar (dtb__310, dtb__311, dtb__312) -> (dtb__311 >= mc0)
  | _ -> failwith "DT: impossible branch"
))
# 555 "Vuna/Compiler/Core/Term.vuna"
and v_hasFreeVarMaybe = (fun (mc0 : int) (mc1 : t_Term B_dData_dMaybe.t_Maybe) -> (match mc1 with
  | B_dData_dMaybe.C_Maybe_Just (dtb__313) -> ((v_hasFreeVar mc0) dtb__313)
  | B_dData_dMaybe.C_Maybe_Nothing -> false
  | _ -> failwith "DT: impossible branch"
))
# 559 "Vuna/Compiler/Core/Term.vuna"
and v_hasFreeVarArgs = (fun (mc0 : int) (mc1 : (t_Term, t_Rig) B_dData_dPair.t_Pair B_dData_dList.t_List) -> (match mc1 with
  | B_dData_dList.C_List__x58__x58_ (dtb__314, dtb__315) -> (match dtb__314 with
  | { B_dData_dPair.f_Pair_first = dtb__316; B_dData_dPair.f_Pair_second = dtb__317 } -> (if ((v_hasFreeVar mc0) dtb__316) then true else ((v_hasFreeVarArgs mc0) dtb__315))
  | _ -> failwith "DT: impossible branch"
)
  | B_dData_dList.C_List_Nil -> false
  | _ -> failwith "DT: impossible branch"
))
# 563 "Vuna/Compiler/Core/Term.vuna"
and v_hasFreeVarAlts = (fun (mc0 : int) (mc1 : t_CaseAlt B_dData_dList.t_List) -> (match mc1 with
  | B_dData_dList.C_List__x58__x58_ (dtb__318, dtb__319) -> (if ((v_hasFreeVar (mc0 + (B_dData_dList.v_length (v_caseAltBinders dtb__318)))) (v_caseAltBody dtb__318)) then true else ((v_hasFreeVarAlts mc0) dtb__319))
  | B_dData_dList.C_List_Nil -> false
  | _ -> failwith "DT: impossible branch"
))

# 568 "Vuna/Compiler/Core/Term.vuna"
let rec v_hasMeta = (fun (mc0 : int) (mc1 : int) (mc2 : t_Term) -> (match mc2 with
  | C_Term_TIf (dtb__320, dtb__321, dtb__322) -> (if (if (((v_hasMeta mc0) mc1) dtb__320) then true else (((v_hasMeta mc0) mc1) dtb__321)) then true else (((v_hasMeta mc0) mc1) dtb__322))
  | C_Term_TBool (dtb__323) -> false
  | C_Term_TFloat (dtb__324) -> false
  | C_Term_TStr (dtb__325) -> false
  | C_Term_TInt (dtb__326) -> false
  | C_Term_TCase (dtb__327, dtb__328) -> (if (((v_hasMeta mc0) mc1) dtb__327) then true else (((v_hasMetaAlts mc0) mc1) dtb__328))
  | C_Term_TRecUpd (dtb__329, dtb__330, dtb__331, dtb__332, dtb__333) -> (if (((v_hasMeta mc0) mc1) dtb__329) then true else (((v_hasMeta mc0) (mc1 + (B_dData_dList.v_length dtb__331))) dtb__333))
  | C_Term_TProj (dtb__334, dtb__335, dtb__336, dtb__337, dtb__338) -> (((v_hasMeta mc0) mc1) dtb__334)
  | C_Term_TRecord (dtb__339, dtb__340) -> (((v_hasMetaArgs mc0) mc1) dtb__340)
  | C_Term_TMk (dtb__341, dtb__342) -> (((v_hasMetaArgs mc0) mc1) dtb__342)
  | C_Term_TCon (dtb__343, dtb__344) -> (((v_hasMetaArgs mc0) mc1) dtb__344)
  | C_Term_TApp (dtb__345, dtb__346, dtb__347) -> (if (((v_hasMeta mc0) mc1) dtb__345) then true else (((v_hasMeta mc0) mc1) dtb__346))
  | C_Term_TLam (dtb__348, dtb__349, dtb__350, dtb__351, dtb__352) -> (let tys = (let nd_uscrut8 = dtb__350 in (match nd_uscrut8 with
  | B_dData_dMaybe.C_Maybe_Just (dtb__353) -> (match dtb__353 with
  | { B_dData_dPair.f_Pair_first = dtb__354; B_dData_dPair.f_Pair_second = dtb__355 } -> (match dtb__355 with
  | { B_dData_dPair.f_Pair_first = dtb__356; B_dData_dPair.f_Pair_second = dtb__357 } -> (if (((v_hasMetaMaybe mc0) mc1) dtb__356) then true else (((v_hasMetaMaybe mc0) (mc1 + 1)) dtb__357))
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
)
  | B_dData_dMaybe.C_Maybe_Nothing -> false
  | _ -> failwith "DT: impossible branch"
)) in (if tys then true else (((v_hasMeta mc0) (mc1 + 1)) dtb__352)))
  | C_Term_TPi (dtb__358, dtb__359, dtb__360, dtb__361, dtb__362) -> (if (((v_hasMeta mc0) mc1) dtb__361) then true else (((v_hasMeta mc0) (mc1 + 1)) dtb__362))
  | C_Term_TType (dtb__363) -> false
  | C_Term_TGlobal (dtb__364) -> false
  | C_Term_TVar (dtb__365, dtb__366, dtb__367) -> false
  | C_Term_TMeta (dtb__368) -> (mc0 = dtb__368)
  | _ -> failwith "DT: impossible branch"
))
# 595 "Vuna/Compiler/Core/Term.vuna"
and v_hasMetaMaybe = (fun (mc0 : int) (mc1 : int) (mc2 : t_Term B_dData_dMaybe.t_Maybe) -> (match mc2 with
  | B_dData_dMaybe.C_Maybe_Just (dtb__369) -> (((v_hasMeta mc0) mc1) dtb__369)
  | B_dData_dMaybe.C_Maybe_Nothing -> false
  | _ -> failwith "DT: impossible branch"
))
# 599 "Vuna/Compiler/Core/Term.vuna"
and v_hasMetaArgs = (fun (mc0 : int) (mc1 : int) (mc2 : (t_Term, t_Rig) B_dData_dPair.t_Pair B_dData_dList.t_List) -> (match mc2 with
  | B_dData_dList.C_List__x58__x58_ (dtb__370, dtb__371) -> (match dtb__370 with
  | { B_dData_dPair.f_Pair_first = dtb__372; B_dData_dPair.f_Pair_second = dtb__373 } -> (if (((v_hasMeta mc0) mc1) dtb__372) then true else (((v_hasMetaArgs mc0) mc1) dtb__371))
  | _ -> failwith "DT: impossible branch"
)
  | B_dData_dList.C_List_Nil -> false
  | _ -> failwith "DT: impossible branch"
))
# 603 "Vuna/Compiler/Core/Term.vuna"
and v_hasMetaAlts = (fun (mc0 : int) (mc1 : int) (mc2 : t_CaseAlt B_dData_dList.t_List) -> (match mc2 with
  | B_dData_dList.C_List__x58__x58_ (dtb__374, dtb__375) -> (if (((v_hasMeta mc0) (mc1 + (B_dData_dList.v_length (v_caseAltBinders dtb__374)))) (v_caseAltBody dtb__374)) then true else (((v_hasMetaAlts mc0) mc1) dtb__375))
  | B_dData_dList.C_List_Nil -> false
  | _ -> failwith "DT: impossible branch"
))

# 609 "Vuna/Compiler/Core/Term.vuna"
let v_mapTermMaybe = (fun (mc0 : (t_Term) -> t_Term) (mc1 : t_Term B_dData_dMaybe.t_Maybe) -> (match mc1 with
  | B_dData_dMaybe.C_Maybe_Just (dtb__376) -> (B_dData_dMaybe.C_Maybe_Just ((mc0 dtb__376)))
  | B_dData_dMaybe.C_Maybe_Nothing -> B_dData_dMaybe.C_Maybe_Nothing
  | _ -> failwith "DT: impossible branch"
))

# 623 "Vuna/Compiler/Core/Term.vuna"
let v_lamMarkOf = (fun (mc0 : (t_LamMark, (t_Term B_dData_dMaybe.t_Maybe, t_Term B_dData_dMaybe.t_Maybe) B_dData_dPair.t_Pair) B_dData_dPair.t_Pair B_dData_dMaybe.t_Maybe) -> (match mc0 with
  | B_dData_dMaybe.C_Maybe_Just (dtb__377) -> (B_dData_dPair.v_firstOf dtb__377)
  | B_dData_dMaybe.C_Maybe_Nothing -> C_LamMark_LamPlain
  | _ -> failwith "DT: impossible branch"
))

# 627 "Vuna/Compiler/Core/Term.vuna"
let v_lamSlotTys = (fun (mc0 : (t_LamMark, (t_Term B_dData_dMaybe.t_Maybe, t_Term B_dData_dMaybe.t_Maybe) B_dData_dPair.t_Pair) B_dData_dPair.t_Pair B_dData_dMaybe.t_Maybe) -> (match mc0 with
  | B_dData_dMaybe.C_Maybe_Just (dtb__378) -> (B_dData_dMaybe.C_Maybe_Just ((B_dData_dPair.v_secondOf dtb__378)))
  | B_dData_dMaybe.C_Maybe_Nothing -> B_dData_dMaybe.C_Maybe_Nothing
  | _ -> failwith "DT: impossible branch"
))

# 631 "Vuna/Compiler/Core/Term.vuna"
let v_lamBinderTyOf = (fun (slot : (t_LamMark, (t_Term B_dData_dMaybe.t_Maybe, t_Term B_dData_dMaybe.t_Maybe) B_dData_dPair.t_Pair) B_dData_dPair.t_Pair B_dData_dMaybe.t_Maybe) -> (match (v_lamSlotTys slot) with
  | B_dData_dMaybe.C_Maybe_Nothing -> B_dData_dMaybe.C_Maybe_Nothing
  | B_dData_dMaybe.C_Maybe_Just (dtb__379) -> (B_dData_dPair.v_firstOf dtb__379)
  | _ -> failwith "DT: impossible branch"
))

# 637 "Vuna/Compiler/Core/Term.vuna"
let v_lamResultTyOf = (fun (slot : (t_LamMark, (t_Term B_dData_dMaybe.t_Maybe, t_Term B_dData_dMaybe.t_Maybe) B_dData_dPair.t_Pair) B_dData_dPair.t_Pair B_dData_dMaybe.t_Maybe) -> (match (v_lamSlotTys slot) with
  | B_dData_dMaybe.C_Maybe_Nothing -> B_dData_dMaybe.C_Maybe_Nothing
  | B_dData_dMaybe.C_Maybe_Just (dtb__380) -> (B_dData_dPair.v_secondOf dtb__380)
  | _ -> failwith "DT: impossible branch"
))

# 643 "Vuna/Compiler/Core/Term.vuna"
let v_lamTyOf = (fun (mc0 : t_Term B_dData_dMaybe.t_Maybe) (mc1 : t_Term B_dData_dMaybe.t_Maybe) -> (match mc0 with
  | B_dData_dMaybe.C_Maybe_Nothing -> (match mc1 with
  | B_dData_dMaybe.C_Maybe_Nothing -> B_dData_dMaybe.C_Maybe_Nothing
  | _ -> (B_dData_dMaybe.C_Maybe_Just ({ B_dData_dPair.f_Pair_first = C_LamMark_LamPlain; B_dData_dPair.f_Pair_second = { B_dData_dPair.f_Pair_first = mc0; B_dData_dPair.f_Pair_second = mc1 } }))
)
  | _ -> (B_dData_dMaybe.C_Maybe_Just ({ B_dData_dPair.f_Pair_first = C_LamMark_LamPlain; B_dData_dPair.f_Pair_second = { B_dData_dPair.f_Pair_first = mc0; B_dData_dPair.f_Pair_second = mc1 } }))
))

# 647 "Vuna/Compiler/Core/Term.vuna"
let v_markLamLinear = (fun (slot : (t_LamMark, (t_Term B_dData_dMaybe.t_Maybe, t_Term B_dData_dMaybe.t_Maybe) B_dData_dPair.t_Pair) B_dData_dPair.t_Pair B_dData_dMaybe.t_Maybe) -> (let tys = (match (v_lamSlotTys slot) with
  | B_dData_dMaybe.C_Maybe_Nothing -> { B_dData_dPair.f_Pair_first = B_dData_dMaybe.C_Maybe_Nothing; B_dData_dPair.f_Pair_second = B_dData_dMaybe.C_Maybe_Nothing }
  | B_dData_dMaybe.C_Maybe_Just (dtb__381) -> dtb__381
  | _ -> failwith "DT: impossible branch"
) in (B_dData_dMaybe.C_Maybe_Just ({ B_dData_dPair.f_Pair_first = C_LamMark_LamLinearClosure; B_dData_dPair.f_Pair_second = tys }))))

# 656 "Vuna/Compiler/Core/Term.vuna"
let v_lamTyWithBinder = (fun (binderTy : t_Term B_dData_dMaybe.t_Maybe) -> ((v_lamTyOf binderTy) B_dData_dMaybe.C_Maybe_Nothing))

# 659 "Vuna/Compiler/Core/Term.vuna"
let v_lamTyWithResult = (fun (resultTy : t_Term B_dData_dMaybe.t_Maybe) -> ((v_lamTyOf B_dData_dMaybe.C_Maybe_Nothing) resultTy))

# 666 "Vuna/Compiler/Core/Term.vuna"
let rec v_shift = (fun (mc0 : int) (mc1 : int) (mc2 : t_Term) -> (match mc2 with
  | C_Term_TIf (dtb__382, dtb__383, dtb__384) -> (C_Term_TIf ((((v_shift mc0) mc1) dtb__382), (((v_shift mc0) mc1) dtb__383), (((v_shift mc0) mc1) dtb__384)))
  | C_Term_TBool (dtb__385) -> mc2
  | C_Term_TFloat (dtb__386) -> mc2
  | C_Term_TStr (dtb__387) -> mc2
  | C_Term_TInt (dtb__388) -> mc2
  | C_Term_TCase (dtb__389, dtb__390) -> (C_Term_TCase ((((v_shift mc0) mc1) dtb__389), (((v_shiftAlts mc0) mc1) dtb__390)))
  | C_Term_TRecUpd (dtb__391, dtb__392, dtb__393, dtb__394, dtb__395) -> (C_Term_TRecUpd ((((v_shift mc0) mc1) dtb__391), dtb__392, dtb__393, dtb__394, (((v_shift (mc0 + (B_dData_dList.v_length dtb__393))) mc1) dtb__395)))
  | C_Term_TProj (dtb__396, dtb__397, dtb__398, dtb__399, dtb__400) -> (C_Term_TProj ((((v_shift mc0) mc1) dtb__396), dtb__397, dtb__398, dtb__399, dtb__400))
  | C_Term_TRecord (dtb__401, dtb__402) -> (C_Term_TRecord (dtb__401, (((v_shiftArgs mc0) mc1) dtb__402)))
  | C_Term_TMk (dtb__403, dtb__404) -> (C_Term_TMk (dtb__403, (((v_shiftArgs mc0) mc1) dtb__404)))
  | C_Term_TCon (dtb__405, dtb__406) -> (C_Term_TCon (dtb__405, (((v_shiftArgs mc0) mc1) dtb__406)))
  | C_Term_TApp (dtb__407, dtb__408, dtb__409) -> (C_Term_TApp ((((v_shift mc0) mc1) dtb__407), (((v_shift mc0) mc1) dtb__408), dtb__409))
  | C_Term_TLam (dtb__410, dtb__411, dtb__412, dtb__413, dtb__414) -> (let slot2 = (let nd_uscrut8 = dtb__412 in (match nd_uscrut8 with
  | B_dData_dMaybe.C_Maybe_Just (dtb__415) -> (match dtb__415 with
  | { B_dData_dPair.f_Pair_first = dtb__416; B_dData_dPair.f_Pair_second = dtb__417 } -> (match dtb__417 with
  | { B_dData_dPair.f_Pair_first = dtb__418; B_dData_dPair.f_Pair_second = dtb__419 } -> (let bt2 = (match dtb__418 with
  | B_dData_dMaybe.C_Maybe_Nothing -> B_dData_dMaybe.C_Maybe_Nothing
  | B_dData_dMaybe.C_Maybe_Just (dtb__421) -> (B_dData_dMaybe.C_Maybe_Just ((((v_shift mc0) mc1) dtb__421)))
  | _ -> failwith "DT: impossible branch"
) in (let rt2 = (match dtb__419 with
  | B_dData_dMaybe.C_Maybe_Nothing -> B_dData_dMaybe.C_Maybe_Nothing
  | B_dData_dMaybe.C_Maybe_Just (dtb__420) -> (B_dData_dMaybe.C_Maybe_Just ((((v_shift (mc0 + 1)) mc1) dtb__420)))
  | _ -> failwith "DT: impossible branch"
) in (B_dData_dMaybe.C_Maybe_Just ({ B_dData_dPair.f_Pair_first = dtb__416; B_dData_dPair.f_Pair_second = { B_dData_dPair.f_Pair_first = bt2; B_dData_dPair.f_Pair_second = rt2 } }))))
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
)
  | B_dData_dMaybe.C_Maybe_Nothing -> B_dData_dMaybe.C_Maybe_Nothing
  | _ -> failwith "DT: impossible branch"
)) in (C_Term_TLam (dtb__410, dtb__411, slot2, dtb__413, (((v_shift (mc0 + 1)) mc1) dtb__414))))
  | C_Term_TPi (dtb__422, dtb__423, dtb__424, dtb__425, dtb__426) -> (C_Term_TPi (dtb__422, dtb__423, dtb__424, (((v_shift mc0) mc1) dtb__425), (((v_shift (mc0 + 1)) mc1) dtb__426)))
  | C_Term_TType (dtb__427) -> mc2
  | C_Term_TGlobal (dtb__428) -> mc2
  | C_Term_TMeta (dtb__429) -> mc2
  | C_Term_TVar (dtb__430, dtb__431, dtb__432) -> (if (dtb__431 >= mc0) then (C_Term_TVar (dtb__430, (dtb__431 + mc1), dtb__432)) else mc2)
  | _ -> failwith "DT: impossible branch"
))
# 706 "Vuna/Compiler/Core/Term.vuna"
and v_shiftArgs = (fun (mc0 : int) (mc1 : int) (mc2 : (t_Term, t_Rig) B_dData_dPair.t_Pair B_dData_dList.t_List) -> (match mc2 with
  | B_dData_dList.C_List__x58__x58_ (dtb__433, dtb__434) -> (match dtb__433 with
  | { B_dData_dPair.f_Pair_first = dtb__435; B_dData_dPair.f_Pair_second = dtb__436 } -> (B_dData_dList.C_List__x58__x58_ ({ B_dData_dPair.f_Pair_first = (((v_shift mc0) mc1) dtb__435); B_dData_dPair.f_Pair_second = dtb__436 }, (((v_shiftArgs mc0) mc1) dtb__434)))
  | _ -> failwith "DT: impossible branch"
)
  | B_dData_dList.C_List_Nil -> B_dData_dList.C_List_Nil
  | _ -> failwith "DT: impossible branch"
))
# 711 "Vuna/Compiler/Core/Term.vuna"
and v_shiftAlts = (fun (mc0 : int) (mc1 : int) (mc2 : t_CaseAlt B_dData_dList.t_List) -> (match mc2 with
  | B_dData_dList.C_List__x58__x58_ (dtb__437, dtb__438) -> (B_dData_dList.C_List__x58__x58_ ((((v_shiftAlt mc0) mc1) dtb__437), (((v_shiftAlts mc0) mc1) dtb__438)))
  | B_dData_dList.C_List_Nil -> B_dData_dList.C_List_Nil
  | _ -> failwith "DT: impossible branch"
))
# 715 "Vuna/Compiler/Core/Term.vuna"
and v_shiftAlt = (fun (mc0 : int) (mc1 : int) (mc2 : t_CaseAlt) -> (match mc2 with
  | { f_CaseAlt_caseAltName = dtb__439; f_CaseAlt_caseAltBinders = dtb__440; f_CaseAlt_caseAltBody = dtb__441 } -> { f_CaseAlt_caseAltName = dtb__439; f_CaseAlt_caseAltBinders = dtb__440; f_CaseAlt_caseAltBody = (((v_shift (mc0 + (B_dData_dList.v_length dtb__440))) mc1) dtb__441) }
  | _ -> failwith "DT: impossible branch"
))

# 720 "Vuna/Compiler/Core/Term.vuna"
let rec v_substVarAt = (fun (mc0 : int) (mc1 : t_Term) (mc2 : t_Term) -> (match mc2 with
  | C_Term_TIf (dtb__442, dtb__443, dtb__444) -> (C_Term_TIf ((((v_substVarAt mc0) mc1) dtb__442), (((v_substVarAt mc0) mc1) dtb__443), (((v_substVarAt mc0) mc1) dtb__444)))
  | C_Term_TBool (dtb__445) -> mc2
  | C_Term_TFloat (dtb__446) -> mc2
  | C_Term_TStr (dtb__447) -> mc2
  | C_Term_TInt (dtb__448) -> mc2
  | C_Term_TCase (dtb__449, dtb__450) -> (C_Term_TCase ((((v_substVarAt mc0) mc1) dtb__449), ((B_dData_dList.v_map ((v_substAltAt mc0) mc1)) dtb__450)))
  | C_Term_TRecUpd (dtb__451, dtb__452, dtb__453, dtb__454, dtb__455) -> (C_Term_TRecUpd ((((v_substVarAt mc0) mc1) dtb__451), dtb__452, dtb__453, dtb__454, (((v_substVarAt (mc0 + (B_dData_dList.v_length dtb__453))) mc1) dtb__455)))
  | C_Term_TProj (dtb__456, dtb__457, dtb__458, dtb__459, dtb__460) -> (C_Term_TProj ((((v_substVarAt mc0) mc1) dtb__456), dtb__457, dtb__458, dtb__459, dtb__460))
  | C_Term_TRecord (dtb__461, dtb__462) -> (C_Term_TRecord (dtb__461, ((B_dData_dList.v_map (fun (p : (t_Term, t_Rig) B_dData_dPair.t_Pair) -> { B_dData_dPair.f_Pair_first = (((v_substVarAt mc0) mc1) (B_dData_dPair.v_firstOf p)); B_dData_dPair.f_Pair_second = (B_dData_dPair.v_secondOf p) })) dtb__462)))
  | C_Term_TMk (dtb__463, dtb__464) -> (C_Term_TMk (dtb__463, ((B_dData_dList.v_map (fun (p : (t_Term, t_Rig) B_dData_dPair.t_Pair) -> { B_dData_dPair.f_Pair_first = (((v_substVarAt mc0) mc1) (B_dData_dPair.v_firstOf p)); B_dData_dPair.f_Pair_second = (B_dData_dPair.v_secondOf p) })) dtb__464)))
  | C_Term_TCon (dtb__465, dtb__466) -> (C_Term_TCon (dtb__465, ((B_dData_dList.v_map (fun (p : (t_Term, t_Rig) B_dData_dPair.t_Pair) -> { B_dData_dPair.f_Pair_first = (((v_substVarAt mc0) mc1) (B_dData_dPair.v_firstOf p)); B_dData_dPair.f_Pair_second = (B_dData_dPair.v_secondOf p) })) dtb__466)))
  | C_Term_TApp (dtb__467, dtb__468, dtb__469) -> (C_Term_TApp ((((v_substVarAt mc0) mc1) dtb__467), (((v_substVarAt mc0) mc1) dtb__468), dtb__469))
  | C_Term_TLam (dtb__470, dtb__471, dtb__472, dtb__473, dtb__474) -> (let slot2 = (let nd_uscrut8 = dtb__472 in (match nd_uscrut8 with
  | B_dData_dMaybe.C_Maybe_Just (dtb__475) -> (match dtb__475 with
  | { B_dData_dPair.f_Pair_first = dtb__476; B_dData_dPair.f_Pair_second = dtb__477 } -> (match dtb__477 with
  | { B_dData_dPair.f_Pair_first = dtb__478; B_dData_dPair.f_Pair_second = dtb__479 } -> (let bt2 = (match dtb__478 with
  | B_dData_dMaybe.C_Maybe_Nothing -> B_dData_dMaybe.C_Maybe_Nothing
  | B_dData_dMaybe.C_Maybe_Just (dtb__481) -> (B_dData_dMaybe.C_Maybe_Just ((((v_substVarAt mc0) mc1) dtb__481)))
  | _ -> failwith "DT: impossible branch"
) in (let rt2 = (match dtb__479 with
  | B_dData_dMaybe.C_Maybe_Nothing -> B_dData_dMaybe.C_Maybe_Nothing
  | B_dData_dMaybe.C_Maybe_Just (dtb__480) -> (B_dData_dMaybe.C_Maybe_Just ((((v_substVarAt (mc0 + 1)) mc1) dtb__480)))
  | _ -> failwith "DT: impossible branch"
) in (B_dData_dMaybe.C_Maybe_Just ({ B_dData_dPair.f_Pair_first = dtb__476; B_dData_dPair.f_Pair_second = { B_dData_dPair.f_Pair_first = bt2; B_dData_dPair.f_Pair_second = rt2 } }))))
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
)
  | B_dData_dMaybe.C_Maybe_Nothing -> B_dData_dMaybe.C_Maybe_Nothing
  | _ -> failwith "DT: impossible branch"
)) in (C_Term_TLam (dtb__470, dtb__471, slot2, dtb__473, (((v_substVarAt (mc0 + 1)) mc1) dtb__474))))
  | C_Term_TPi (dtb__482, dtb__483, dtb__484, dtb__485, dtb__486) -> (C_Term_TPi (dtb__482, dtb__483, dtb__484, (((v_substVarAt mc0) mc1) dtb__485), (((v_substVarAt (mc0 + 1)) mc1) dtb__486)))
  | C_Term_TType (dtb__487) -> mc2
  | C_Term_TGlobal (dtb__488) -> mc2
  | C_Term_TMeta (dtb__489) -> mc2
  | C_Term_TVar (dtb__490, dtb__491, dtb__492) -> (if (dtb__491 = mc0) then mc1 else mc2)
  | _ -> failwith "DT: impossible branch"
))
# 763 "Vuna/Compiler/Core/Term.vuna"
and v_substAltAt = (fun (idx : int) (arg : t_Term) (alt : t_CaseAlt) -> { f_CaseAlt_caseAltName = (v_caseAltName alt); f_CaseAlt_caseAltBinders = (v_caseAltBinders alt); f_CaseAlt_caseAltBody = (((v_substVarAt (idx + (B_dData_dList.v_length (v_caseAltBinders alt)))) arg) (v_caseAltBody alt)) })

# 773 "Vuna/Compiler/Core/Term.vuna"
let rec v_substMetaVarGo = (fun (mc0 : int) (mc1 : string) (mc2 : int) (mc3 : int) (mc4 : t_Term) -> (match mc4 with
  | C_Term_TIf (dtb__493, dtb__494, dtb__495) -> (C_Term_TIf ((((((v_substMetaVarGo mc0) mc1) mc2) mc3) dtb__493), (((((v_substMetaVarGo mc0) mc1) mc2) mc3) dtb__494), (((((v_substMetaVarGo mc0) mc1) mc2) mc3) dtb__495)))
  | C_Term_TCase (dtb__496, dtb__497) -> (C_Term_TCase ((((((v_substMetaVarGo mc0) mc1) mc2) mc3) dtb__496), ((B_dData_dList.v_map ((((v_substMetaVarAlt mc0) mc1) mc2) mc3)) dtb__497)))
  | C_Term_TProj (dtb__498, dtb__499, dtb__500, dtb__501, dtb__502) -> (C_Term_TProj ((((((v_substMetaVarGo mc0) mc1) mc2) mc3) dtb__498), dtb__499, dtb__500, dtb__501, dtb__502))
  | C_Term_TRecord (dtb__503, dtb__504) -> (C_Term_TRecord (dtb__503, ((B_dData_dList.v_map (fun (p : (t_Term, t_Rig) B_dData_dPair.t_Pair) -> { B_dData_dPair.f_Pair_first = (((((v_substMetaVarGo mc0) mc1) mc2) mc3) (B_dData_dPair.v_firstOf p)); B_dData_dPair.f_Pair_second = (B_dData_dPair.v_secondOf p) })) dtb__504)))
  | C_Term_TMk (dtb__505, dtb__506) -> (C_Term_TMk (dtb__505, ((B_dData_dList.v_map (fun (p : (t_Term, t_Rig) B_dData_dPair.t_Pair) -> { B_dData_dPair.f_Pair_first = (((((v_substMetaVarGo mc0) mc1) mc2) mc3) (B_dData_dPair.v_firstOf p)); B_dData_dPair.f_Pair_second = (B_dData_dPair.v_secondOf p) })) dtb__506)))
  | C_Term_TCon (dtb__507, dtb__508) -> (C_Term_TCon (dtb__507, ((B_dData_dList.v_map (fun (p : (t_Term, t_Rig) B_dData_dPair.t_Pair) -> { B_dData_dPair.f_Pair_first = (((((v_substMetaVarGo mc0) mc1) mc2) mc3) (B_dData_dPair.v_firstOf p)); B_dData_dPair.f_Pair_second = (B_dData_dPair.v_secondOf p) })) dtb__508)))
  | C_Term_TApp (dtb__509, dtb__510, dtb__511) -> (C_Term_TApp ((((((v_substMetaVarGo mc0) mc1) mc2) mc3) dtb__509), (((((v_substMetaVarGo mc0) mc1) mc2) mc3) dtb__510), dtb__511))
  | C_Term_TLam (dtb__512, dtb__513, dtb__514, dtb__515, dtb__516) -> (let slot2 = (let nd_uscrut10 = dtb__514 in (match nd_uscrut10 with
  | B_dData_dMaybe.C_Maybe_Just (dtb__517) -> (match dtb__517 with
  | { B_dData_dPair.f_Pair_first = dtb__518; B_dData_dPair.f_Pair_second = dtb__519 } -> (match dtb__519 with
  | { B_dData_dPair.f_Pair_first = dtb__520; B_dData_dPair.f_Pair_second = dtb__521 } -> (let bt2 = (match dtb__520 with
  | B_dData_dMaybe.C_Maybe_Nothing -> B_dData_dMaybe.C_Maybe_Nothing
  | B_dData_dMaybe.C_Maybe_Just (dtb__523) -> (B_dData_dMaybe.C_Maybe_Just ((((((v_substMetaVarGo mc0) mc1) mc2) mc3) dtb__523)))
  | _ -> failwith "DT: impossible branch"
) in (let rt2 = (match dtb__521 with
  | B_dData_dMaybe.C_Maybe_Nothing -> B_dData_dMaybe.C_Maybe_Nothing
  | B_dData_dMaybe.C_Maybe_Just (dtb__522) -> (B_dData_dMaybe.C_Maybe_Just ((((((v_substMetaVarGo mc0) mc1) mc2) (mc3 + 1)) dtb__522)))
  | _ -> failwith "DT: impossible branch"
) in (B_dData_dMaybe.C_Maybe_Just ({ B_dData_dPair.f_Pair_first = dtb__518; B_dData_dPair.f_Pair_second = { B_dData_dPair.f_Pair_first = bt2; B_dData_dPair.f_Pair_second = rt2 } }))))
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
)
  | B_dData_dMaybe.C_Maybe_Nothing -> B_dData_dMaybe.C_Maybe_Nothing
  | _ -> failwith "DT: impossible branch"
)) in (C_Term_TLam (dtb__512, dtb__513, slot2, dtb__515, (((((v_substMetaVarGo mc0) mc1) mc2) (mc3 + 1)) dtb__516))))
  | C_Term_TPi (dtb__524, dtb__525, dtb__526, dtb__527, dtb__528) -> (C_Term_TPi (dtb__524, dtb__525, dtb__526, (((((v_substMetaVarGo mc0) mc1) mc2) mc3) dtb__527), (((((v_substMetaVarGo mc0) mc1) mc2) (mc3 + 1)) dtb__528)))
  | C_Term_TMeta (dtb__529) -> (if (dtb__529 = mc0) then (C_Term_TVar (mc1, (mc3 - mc2), { Base_dSource.f_Span_spanFile = ""; Base_dSource.f_Span_spanStartLine = 0; Base_dSource.f_Span_spanStartCol = 0; Base_dSource.f_Span_spanEndLine = 0; Base_dSource.f_Span_spanEndCol = 0; Base_dSource.f_Span_spanStartOffset = 0; Base_dSource.f_Span_spanEndOffset = 0 })) else mc4)
  | _ -> mc4
))
# 814 "Vuna/Compiler/Core/Term.vuna"
and v_substMetaVarAlt = (fun (mc0 : int) (mc1 : string) (mc2 : int) (mc3 : int) (mc4 : t_CaseAlt) -> (match mc4 with
  | { f_CaseAlt_caseAltName = dtb__530; f_CaseAlt_caseAltBinders = dtb__531; f_CaseAlt_caseAltBody = dtb__532 } -> { f_CaseAlt_caseAltName = dtb__530; f_CaseAlt_caseAltBinders = dtb__531; f_CaseAlt_caseAltBody = (((((v_substMetaVarGo mc0) mc1) mc2) (mc3 + (B_dData_dList.v_length dtb__531))) dtb__532) }
  | _ -> failwith "DT: impossible branch"
))

# 770 "Vuna/Compiler/Core/Term.vuna"
let v_substMetaVar = (fun (m : int) (name : string) (q : int) (t : t_Term) -> (((((v_substMetaVarGo m) name) q) 0) t))

# 826 "Vuna/Compiler/Core/Term.vuna"
let rec v_insertDictBinderGo = (fun (mc0 : string) (mc1 : int) (mc2 : t_Term) (mc3 : int) (mc4 : t_Term) -> (match mc4 with
  | C_Term_TPi (dtb__533, dtb__534, dtb__535, dtb__536, dtb__537) -> (if (mc3 = mc1) then (C_Term_TPi (dtb__533, dtb__534, dtb__535, dtb__536, (C_Term_TPi (mc0, true, C_Rig_RigOmega, mc2, (((v_shift 0) 1) dtb__537))))) else (C_Term_TPi (dtb__533, dtb__534, dtb__535, dtb__536, (((((v_insertDictBinderGo mc0) mc1) mc2) (mc3 + 1)) dtb__537))))
  | _ -> mc4
))

# 820 "Vuna/Compiler/Core/Term.vuna"
let v_insertDictBinder = (fun (name : string) (idx : int) (dictDom : t_Term) (t : t_Term) -> (((((v_insertDictBinderGo name) idx) dictDom) 0) t))

# 838 "Vuna/Compiler/Core/Term.vuna"
let rec v_insertImplicitBinderGo = (fun (mc0 : string) (mc1 : int) (mc2 : t_Rig) (mc3 : t_Term) (mc4 : int) (mc5 : t_Term) -> (match mc5 with
  | C_Term_TPi (dtb__538, dtb__539, dtb__540, dtb__541, dtb__542) -> (if (mc4 = mc1) then (C_Term_TPi (dtb__538, dtb__539, dtb__540, dtb__541, (C_Term_TPi (mc0, true, mc2, mc3, (((v_shift 0) 1) dtb__542))))) else (C_Term_TPi (dtb__538, dtb__539, dtb__540, dtb__541, ((((((v_insertImplicitBinderGo mc0) mc1) mc2) mc3) (mc4 + 1)) dtb__542))))
  | _ -> mc5
))

# 835 "Vuna/Compiler/Core/Term.vuna"
let v_insertImplicitBinder = (fun (name : string) (idx : int) (rig : t_Rig) (dom : t_Term) (t : t_Term) -> ((((((v_insertImplicitBinderGo name) idx) rig) dom) 0) t))

# 847 "Vuna/Compiler/Core/Term.vuna"
let v_cutoffOf = (fun (total : int) (idx : int) -> (if ((total - (idx + 1)) <= 0) then 0 else (total - (idx + 1))))

# 850 "Vuna/Compiler/Core/Term.vuna"
let rec v_countPis = (fun (mc0 : t_Term) -> (match mc0 with
  | C_Term_TPi (dtb__543, dtb__544, dtb__545, dtb__546, dtb__547) -> (1 + (v_countPis dtb__547))
  | _ -> 0
))

# 862 "Vuna/Compiler/Core/Term.vuna"
let rec v_insertLamBinderGo = (fun (mc0 : string) (mc1 : int) (mc2 : int) (mc3 : t_Term) -> (match mc3 with
  | C_Term_TLam (dtb__548, dtb__549, dtb__550, dtb__551, dtb__552) -> (if (mc2 = mc1) then (C_Term_TLam (dtb__548, dtb__549, dtb__550, dtb__551, (C_Term_TLam (mc0, C_Rig_RigOmega, B_dData_dMaybe.C_Maybe_Nothing, Base_dSource.v_spanEmpty, (((v_shift 0) 1) dtb__552))))) else (C_Term_TLam (dtb__548, dtb__549, dtb__550, dtb__551, ((((v_insertLamBinderGo mc0) mc1) (mc2 + 1)) dtb__552))))
  | _ -> mc3
))

# 859 "Vuna/Compiler/Core/Term.vuna"
let v_insertLamBinder = (fun (name : string) (idx : int) (t : t_Term) -> ((((v_insertLamBinderGo name) idx) 0) t))

# 870 "Vuna/Compiler/Core/Term.vuna"
let rec v_countLams = (fun (mc0 : t_Term) -> (match mc0 with
  | C_Term_TLam (dtb__553, dtb__554, dtb__555, dtb__556, dtb__557) -> (1 + (v_countLams dtb__557))
  | _ -> 0
))

# 875 "Vuna/Compiler/Core/Term.vuna"
let rec v_hasFreeTermVar = (fun (mc0 : int) (mc1 : t_Term) -> (match mc1 with
  | C_Term_TIf (dtb__558, dtb__559, dtb__560) -> (if (if ((v_hasFreeTermVar mc0) dtb__558) then true else ((v_hasFreeTermVar mc0) dtb__559)) then true else ((v_hasFreeTermVar mc0) dtb__560))
  | C_Term_TCase (dtb__561, dtb__562) -> (if ((v_hasFreeTermVar mc0) dtb__561) then true else ((v_anyAltFree mc0) dtb__562))
  | C_Term_TRecUpd (dtb__563, dtb__564, dtb__565, dtb__566, dtb__567) -> (if ((v_hasFreeTermVar mc0) dtb__563) then true else ((v_hasFreeTermVar (mc0 + (B_dData_dList.v_length dtb__565))) dtb__567))
  | C_Term_TProj (dtb__568, dtb__569, dtb__570, dtb__571, dtb__572) -> ((v_hasFreeTermVar mc0) dtb__568)
  | C_Term_TRecord (dtb__573, dtb__574) -> ((v_anyPairFree mc0) dtb__574)
  | C_Term_TMk (dtb__575, dtb__576) -> ((v_anyPairFree mc0) dtb__576)
  | C_Term_TCon (dtb__577, dtb__578) -> ((v_anyPairFree mc0) dtb__578)
  | C_Term_TApp (dtb__579, dtb__580, dtb__581) -> (if ((v_hasFreeTermVar mc0) dtb__579) then true else ((v_hasFreeTermVar mc0) dtb__580))
  | C_Term_TLam (dtb__582, dtb__583, dtb__584, dtb__585, dtb__586) -> (let tys = (let nd_uscrut7 = dtb__584 in (match nd_uscrut7 with
  | B_dData_dMaybe.C_Maybe_Just (dtb__587) -> (match dtb__587 with
  | { B_dData_dPair.f_Pair_first = dtb__588; B_dData_dPair.f_Pair_second = dtb__589 } -> (match dtb__589 with
  | { B_dData_dPair.f_Pair_first = dtb__590; B_dData_dPair.f_Pair_second = dtb__591 } -> (if ((v_hasFreeTermVarMaybe mc0) dtb__590) then true else ((v_hasFreeTermVarMaybe (mc0 + 1)) dtb__591))
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
)
  | B_dData_dMaybe.C_Maybe_Nothing -> false
  | _ -> failwith "DT: impossible branch"
)) in (if tys then true else ((v_hasFreeTermVar (mc0 + 1)) dtb__586)))
  | C_Term_TPi (dtb__592, dtb__593, dtb__594, dtb__595, dtb__596) -> (if ((v_hasFreeTermVar mc0) dtb__595) then true else ((v_hasFreeTermVar (mc0 + 1)) dtb__596))
  | C_Term_TVar (dtb__597, dtb__598, dtb__599) -> (dtb__598 >= mc0)
  | _ -> false
))
# 898 "Vuna/Compiler/Core/Term.vuna"
and v_hasFreeTermVarMaybe = (fun (mc0 : int) (mc1 : t_Term B_dData_dMaybe.t_Maybe) -> (match mc1 with
  | B_dData_dMaybe.C_Maybe_Just (dtb__600) -> ((v_hasFreeTermVar mc0) dtb__600)
  | B_dData_dMaybe.C_Maybe_Nothing -> false
  | _ -> failwith "DT: impossible branch"
))
# 902 "Vuna/Compiler/Core/Term.vuna"
and v_anyPairFree = (fun (mc0 : int) (mc1 : (t_Term, t_Rig) B_dData_dPair.t_Pair B_dData_dList.t_List) -> (match mc1 with
  | B_dData_dList.C_List__x58__x58_ (dtb__601, dtb__602) -> (match dtb__601 with
  | { B_dData_dPair.f_Pair_first = dtb__603; B_dData_dPair.f_Pair_second = dtb__604 } -> (if ((v_hasFreeTermVar mc0) dtb__603) then true else ((v_anyPairFree mc0) dtb__602))
  | _ -> failwith "DT: impossible branch"
)
  | B_dData_dList.C_List_Nil -> false
  | _ -> failwith "DT: impossible branch"
))
# 906 "Vuna/Compiler/Core/Term.vuna"
and v_anyAltFree = (fun (mc0 : int) (mc1 : t_CaseAlt B_dData_dList.t_List) -> (match mc1 with
  | B_dData_dList.C_List__x58__x58_ (dtb__605, dtb__606) -> (match dtb__605 with
  | { f_CaseAlt_caseAltName = dtb__607; f_CaseAlt_caseAltBinders = dtb__608; f_CaseAlt_caseAltBody = dtb__609 } -> (if ((v_hasFreeTermVar (mc0 + (B_dData_dList.v_length dtb__608))) dtb__609) then true else ((v_anyAltFree mc0) dtb__606))
  | _ -> failwith "DT: impossible branch"
)
  | B_dData_dList.C_List_Nil -> false
  | _ -> failwith "DT: impossible branch"
))

# 914 "Vuna/Compiler/Core/Term.vuna"
let rec v_hasNegativeVar = (fun (mc0 : t_Term) -> (match mc0 with
  | C_Term_TIf (dtb__610, dtb__611, dtb__612) -> (if (if (v_hasNegativeVar dtb__610) then true else (v_hasNegativeVar dtb__611)) then true else (v_hasNegativeVar dtb__612))
  | C_Term_TCase (dtb__613, dtb__614) -> (if (v_hasNegativeVar dtb__613) then true else (v_anyNegativeVarAlts dtb__614))
  | C_Term_TRecUpd (dtb__615, dtb__616, dtb__617, dtb__618, dtb__619) -> (if (v_hasNegativeVar dtb__615) then true else (v_hasNegativeVar dtb__619))
  | C_Term_TProj (dtb__620, dtb__621, dtb__622, dtb__623, dtb__624) -> (v_hasNegativeVar dtb__620)
  | C_Term_TRecord (dtb__625, dtb__626) -> (v_anyNegativeVarArgs dtb__626)
  | C_Term_TMk (dtb__627, dtb__628) -> (v_anyNegativeVarArgs dtb__628)
  | C_Term_TCon (dtb__629, dtb__630) -> (v_anyNegativeVarArgs dtb__630)
  | C_Term_TApp (dtb__631, dtb__632, dtb__633) -> (if (v_hasNegativeVar dtb__631) then true else (v_hasNegativeVar dtb__632))
  | C_Term_TLam (dtb__634, dtb__635, dtb__636, dtb__637, dtb__638) -> (let tys = (let nd_uscrut6 = dtb__636 in (match nd_uscrut6 with
  | B_dData_dMaybe.C_Maybe_Just (dtb__639) -> (match dtb__639 with
  | { B_dData_dPair.f_Pair_first = dtb__640; B_dData_dPair.f_Pair_second = dtb__641 } -> (match dtb__641 with
  | { B_dData_dPair.f_Pair_first = dtb__642; B_dData_dPair.f_Pair_second = dtb__643 } -> (if (v_hasNegativeVarMaybe dtb__642) then true else (v_hasNegativeVarMaybe dtb__643))
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
)
  | B_dData_dMaybe.C_Maybe_Nothing -> false
  | _ -> failwith "DT: impossible branch"
)) in (if tys then true else (v_hasNegativeVar dtb__638)))
  | C_Term_TPi (dtb__644, dtb__645, dtb__646, dtb__647, dtb__648) -> (if (v_hasNegativeVar dtb__647) then true else (v_hasNegativeVar dtb__648))
  | C_Term_TVar (dtb__649, dtb__650, dtb__651) -> (dtb__650 < 0)
  | _ -> false
))
# 934 "Vuna/Compiler/Core/Term.vuna"
and v_hasNegativeVarMaybe = (fun (mc0 : t_Term B_dData_dMaybe.t_Maybe) -> (match mc0 with
  | B_dData_dMaybe.C_Maybe_Just (dtb__652) -> (v_hasNegativeVar dtb__652)
  | B_dData_dMaybe.C_Maybe_Nothing -> false
  | _ -> failwith "DT: impossible branch"
))
# 938 "Vuna/Compiler/Core/Term.vuna"
and v_anyNegativeVarArgs = (fun (mc0 : (t_Term, t_Rig) B_dData_dPair.t_Pair B_dData_dList.t_List) -> (match mc0 with
  | B_dData_dList.C_List__x58__x58_ (dtb__653, dtb__654) -> (match dtb__653 with
  | { B_dData_dPair.f_Pair_first = dtb__655; B_dData_dPair.f_Pair_second = dtb__656 } -> (if (v_hasNegativeVar dtb__655) then true else (v_anyNegativeVarArgs dtb__654))
  | _ -> failwith "DT: impossible branch"
)
  | B_dData_dList.C_List_Nil -> false
  | _ -> failwith "DT: impossible branch"
))
# 942 "Vuna/Compiler/Core/Term.vuna"
and v_anyNegativeVarAlts = (fun (mc0 : t_CaseAlt B_dData_dList.t_List) -> (match mc0 with
  | B_dData_dList.C_List__x58__x58_ (dtb__657, dtb__658) -> (match dtb__657 with
  | { f_CaseAlt_caseAltName = dtb__659; f_CaseAlt_caseAltBinders = dtb__660; f_CaseAlt_caseAltBody = dtb__661 } -> (if (v_hasNegativeVar dtb__661) then true else (v_anyNegativeVarAlts dtb__658))
  | _ -> failwith "DT: impossible branch"
)
  | B_dData_dList.C_List_Nil -> false
  | _ -> failwith "DT: impossible branch"
))

# 948 "Vuna/Compiler/Core/Term.vuna"
let v_metaScanBound = 262144

# 954 "Vuna/Compiler/Core/Term.vuna"
let rec v_hasUnsolvedMetaValueFuel = (fun (fuel : int) (sols : t_Sols) (v : t_Value) -> (if (fuel <= 0) then true else (match v with
  | C_Value_VMeta (dtb__662, dtb__663) -> (match ((v_solsLookup dtb__662) sols) with
  | B_dData_dMaybe.C_Maybe_Just (dtb__664) -> (((v_hasUnsolvedMetaValueFuel (fuel - 1)) sols) dtb__664)
  | B_dData_dMaybe.C_Maybe_Nothing -> true
  | _ -> failwith "DT: impossible branch"
)
  | C_Value_VNeutral (dtb__665) -> (match dtb__665 with
  | C_Neutral_NVar (dtb__666, dtb__667, dtb__668) -> (((v_hasUnsolvedMetaListFuel (fuel - 1)) sols) dtb__668)
  | C_Neutral_NGlobal (dtb__669, dtb__670) -> (((v_hasUnsolvedMetaListFuel (fuel - 1)) sols) dtb__670)
  | _ -> failwith "DT: impossible branch"
)
  | C_Value_VPi (dtb__671, dtb__672, dtb__673, dtb__674, dtb__675) -> (if (((v_hasUnsolvedMetaValueFuel (fuel - 1)) sols) dtb__674) then true else (((v_hasUnsolvedMetaCloFuel (fuel - 1)) sols) dtb__675))
  | C_Value_VLam (dtb__676, dtb__677, dtb__678) -> (((v_hasUnsolvedMetaCloFuel (fuel - 1)) sols) dtb__678)
  | C_Value_VCon (dtb__679, dtb__680) -> (((v_hasUnsolvedMetaListFuel (fuel - 1)) sols) dtb__680)
  | C_Value_VApp (dtb__681, dtb__682) -> (if (((v_hasUnsolvedMetaValueFuel (fuel - 1)) sols) dtb__681) then true else (((v_hasUnsolvedMetaValueFuel (fuel - 1)) sols) dtb__682))
  | C_Value_VCase (dtb__683, dtb__684) -> (((v_hasUnsolvedMetaValueFuel (fuel - 1)) sols) dtb__683)
  | C_Value_VProj (dtb__685, dtb__686, dtb__687, dtb__688, dtb__689) -> (((v_hasUnsolvedMetaValueFuel (fuel - 1)) sols) dtb__685)
  | C_Value_VIf (dtb__690, dtb__691, dtb__692) -> (if (if (((v_hasUnsolvedMetaValueFuel (fuel - 1)) sols) dtb__690) then true else (((v_hasUnsolvedMetaValueFuel (fuel - 1)) sols) dtb__691)) then true else (((v_hasUnsolvedMetaValueFuel (fuel - 1)) sols) dtb__692))
  | _ -> false
)))
# 980 "Vuna/Compiler/Core/Term.vuna"
and v_hasUnsolvedMetaListFuel = (fun (fuel : int) (sols : t_Sols) (vs : t_Value B_dData_dList.t_List) -> (if (fuel <= 0) then true else (match vs with
  | B_dData_dList.C_List_Nil -> false
  | B_dData_dList.C_List__x58__x58_ (dtb__693, dtb__694) -> (if (((v_hasUnsolvedMetaValueFuel (fuel - 1)) sols) dtb__693) then true else (((v_hasUnsolvedMetaListFuel (fuel - 1)) sols) dtb__694))
  | _ -> failwith "DT: impossible branch"
)))
# 992 "Vuna/Compiler/Core/Term.vuna"
and v_hasUnsolvedMetaCloFuel = (fun (fuel : int) (sols : t_Sols) (clo : t_Closure) -> (if (fuel <= 0) then true else (match clo with
  | { f_Closure_closureEnv = dtb__695; f_Closure_closureBody = dtb__696 } -> (((v_hasUnsolvedMetaListFuel (fuel - 1)) sols) dtb__695)
  | _ -> failwith "DT: impossible branch"
)))

# 951 "Vuna/Compiler/Core/Term.vuna"
let v_hasUnsolvedMetaValue = (fun (sols : t_Sols) (v : t_Value) -> (((v_hasUnsolvedMetaValueFuel v_metaScanBound) sols) v))

# 977 "Vuna/Compiler/Core/Term.vuna"
let v_hasUnsolvedMetaList = (fun (sols : t_Sols) (vs : t_Value B_dData_dList.t_List) -> (((v_hasUnsolvedMetaListFuel v_metaScanBound) sols) vs))

# 989 "Vuna/Compiler/Core/Term.vuna"
let v_hasUnsolvedMetaClo = (fun (sols : t_Sols) (clo : t_Closure) -> (((v_hasUnsolvedMetaCloFuel v_metaScanBound) sols) clo))

# 1003 "Vuna/Compiler/Core/Term.vuna"
let v_isTypeValue = (fun (mc0 : t_Value) -> (match mc0 with
  | C_Value_VType (dtb__697) -> true
  | _ -> false
))

# 1007 "Vuna/Compiler/Core/Term.vuna"
let v_typeLevelOf = (fun (mc0 : t_Value) -> (match mc0 with
  | C_Value_VType (dtb__698) -> (B_dData_dMaybe.C_Maybe_Just (dtb__698))
  | _ -> B_dData_dMaybe.C_Maybe_Nothing
))

# 1015 "Vuna/Compiler/Core/Term.vuna"
let rec v_levelEscapes = (fun (mc0 : int) (mc1 : int) (mc2 : t_Value) -> (match mc2 with
  | C_Value_VBool (dtb__699) -> false
  | C_Value_VFloat (dtb__700) -> false
  | C_Value_VStr (dtb__701) -> false
  | C_Value_VInt (dtb__702) -> false
  | C_Value_VType (dtb__703) -> false
  | C_Value_VIf (dtb__704, dtb__705, dtb__706) -> (if (if (((v_levelEscapes mc0) mc1) dtb__704) then true else (((v_levelEscapes mc0) mc1) dtb__705)) then true else (((v_levelEscapes mc0) mc1) dtb__706))
  | C_Value_VProj (dtb__707, dtb__708, dtb__709, dtb__710, dtb__711) -> (((v_levelEscapes mc0) mc1) dtb__707)
  | C_Value_VCase (dtb__712, dtb__713) -> (((v_levelEscapes mc0) mc1) dtb__712)
  | C_Value_VApp (dtb__714, dtb__715) -> (if (((v_levelEscapes mc0) mc1) dtb__714) then true else (((v_levelEscapes mc0) mc1) dtb__715))
  | C_Value_VCon (dtb__716, dtb__717) -> ((v_levelEscapesList mc0) dtb__717)
  | C_Value_VMeta (dtb__718, dtb__719) -> ((v_levelEscapesList mc0) dtb__719)
  | C_Value_VLam (dtb__720, dtb__721, dtb__722) -> ((v_levelEscapesClo mc0) dtb__722)
  | C_Value_VPi (dtb__723, dtb__724, dtb__725, dtb__726, dtb__727) -> (if (((v_levelEscapes mc0) mc1) dtb__726) then true else ((v_levelEscapesClo mc0) dtb__727))
  | C_Value_VNeutral (dtb__728) -> (match dtb__728 with
  | C_Neutral_NVar (dtb__729, dtb__730, dtb__731) -> (if (dtb__730 >= mc0) then true else ((v_levelEscapesList mc0) dtb__731))
  | C_Neutral_NGlobal (dtb__732, dtb__733) -> ((v_levelEscapesList mc0) dtb__733)
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
))
# 1036 "Vuna/Compiler/Core/Term.vuna"
and v_levelEscapesList = (fun (mc0 : int) (mc1 : t_Value B_dData_dList.t_List) -> (match mc1 with
  | B_dData_dList.C_List__x58__x58_ (dtb__734, dtb__735) -> (if (((v_levelEscapes mc0) 0) dtb__734) then true else ((v_levelEscapesList mc0) dtb__735))
  | B_dData_dList.C_List_Nil -> false
  | _ -> failwith "DT: impossible branch"
))
# 1040 "Vuna/Compiler/Core/Term.vuna"
and v_levelEscapesClo = (fun (mc0 : int) (mc1 : t_Closure) -> (match mc1 with
  | { f_Closure_closureEnv = dtb__736; f_Closure_closureBody = dtb__737 } -> ((v_levelEscapesList mc0) dtb__736)
  | _ -> failwith "DT: impossible branch"
))

# 1120 "Vuna/Compiler/Core/Term.vuna"
let rec v_showBinders = (fun (mc0 : (string, t_Rig) B_dData_dPair.t_Pair B_dData_dList.t_List) -> (match mc0 with
  | B_dData_dList.C_List__x58__x58_ (dtb__738, dtb__739) -> (match dtb__738 with
  | { B_dData_dPair.f_Pair_first = dtb__740; B_dData_dPair.f_Pair_second = dtb__741 } -> (String.concat "" [" "; dtb__740; (v_showBinders dtb__739)])
  | _ -> failwith "DT: impossible branch"
)
  | B_dData_dList.C_List_Nil -> ""
  | _ -> failwith "DT: impossible branch"
))

# 1127 "Vuna/Compiler/Core/Term.vuna"
let rec v_showCoreChars = (fun (mc0 : int B_dData_dList.t_List) -> (match mc0 with
  | B_dData_dList.C_List__x58__x58_ (dtb__742, dtb__743) -> (if (dtb__742 = 34) then ("\\\"" ^ (v_showCoreChars dtb__743)) else (if (dtb__742 = 92) then ("\\\\" ^ (v_showCoreChars dtb__743)) else (if (dtb__742 = 10) then ("\\n" ^ (v_showCoreChars dtb__743)) else (if (dtb__742 = 9) then ("\\t" ^ (v_showCoreChars dtb__743)) else (if (dtb__742 = 13) then ("\\r" ^ (v_showCoreChars dtb__743)) else ((B_dData_dList.dtp_pack (B_dData_dList.C_List__x58__x58_ (dtb__742, B_dData_dList.C_List_Nil))) ^ (v_showCoreChars dtb__743)))))))
  | B_dData_dList.C_List_Nil -> ""
  | _ -> failwith "DT: impossible branch"
))

# 1124 "Vuna/Compiler/Core/Term.vuna"
let v_showCoreString = (fun (s : string) -> (String.concat "" ["\""; (v_showCoreChars (B_dData_dList.dtp_unpack s)); "\""]))

# 1043 "Vuna/Compiler/Core/Term.vuna"
let rec v_showTerm = (fun (mc0 : t_Term) -> (match mc0 with
  | C_Term_TIf (dtb__744, dtb__745, dtb__746) -> (String.concat "" ["if "; (v_showTerm dtb__744); " then "; (v_showTerm dtb__745); " else "; (v_showTerm dtb__746)])
  | C_Term_TBool (dtb__747) -> (if dtb__747 then "True" else "False")
  | C_Term_TFloat (dtb__748) -> dtb__748
  | C_Term_TStr (dtb__749) -> (v_showCoreString dtb__749)
  | C_Term_TInt (dtb__750) -> (bi_strFromInt dtb__750)
  | C_Term_TCase (dtb__751, dtb__752) -> (String.concat "" ["case "; (v_showTerm dtb__751); " of "; (v_showCoreAlts dtb__752)])
  | C_Term_TRecUpd (dtb__753, dtb__754, dtb__755, dtb__756, dtb__757) -> (String.concat "" [(v_showTerm dtb__753); " with "; dtb__754; " "; (v_showTerm dtb__757)])
  | C_Term_TProj (dtb__758, dtb__759, dtb__760, dtb__761, dtb__762) -> (String.concat "" [(v_showTerm dtb__758); "."; dtb__759; "#"; (bi_strFromInt dtb__762)])
  | C_Term_TRecord (dtb__763, dtb__764) -> ((v_recordAppShow dtb__763) dtb__764)
  | C_Term_TMk (dtb__765, dtb__766) -> (String.concat "" ["("; dtb__765; (v_showArgTerms dtb__766); ")"])
  | C_Term_TCon (dtb__767, dtb__768) -> (String.concat "" ["("; dtb__767; (v_showArgTerms dtb__768); ")"])
  | C_Term_TApp (dtb__769, dtb__770, dtb__771) -> (String.concat "" ["("; (v_showTerm dtb__769); " "; (v_showTerm dtb__770); ")"])
  | C_Term_TLam (dtb__772, dtb__773, dtb__774, dtb__775, dtb__776) -> (String.concat "" ["\\"; dtb__772; " => "; (v_showTerm dtb__776)])
  | C_Term_TPi (dtb__777, dtb__778, dtb__779, dtb__780, dtb__781) -> (if (dtb__777 = "_") then (String.concat "" [(v_showTerm dtb__780); " -> "; (v_showTerm dtb__781)]) else (if dtb__778 then (String.concat "" ["{"; dtb__777; " : "; (v_showTerm dtb__780); "} -> "; (v_showTerm dtb__781)]) else (String.concat "" ["("; dtb__777; " : "; (v_showTerm dtb__780); ") -> "; (v_showTerm dtb__781)])))
  | C_Term_TType (dtb__782) -> (if ((v_levelToInt dtb__782) = 0) then "Type" else ("Type " ^ (bi_strFromInt (v_levelToInt dtb__782))))
  | C_Term_TGlobal (dtb__783) -> dtb__783
  | C_Term_TMeta (dtb__784) -> ("?" ^ (bi_strFromInt dtb__784))
  | C_Term_TVar (dtb__785, dtb__786, dtb__787) -> dtb__785
  | _ -> failwith "DT: impossible branch"
))
# 1100 "Vuna/Compiler/Core/Term.vuna"
and v_showArgTerms = (fun (mc0 : (t_Term, t_Rig) B_dData_dPair.t_Pair B_dData_dList.t_List) -> (match mc0 with
  | B_dData_dList.C_List__x58__x58_ (dtb__788, dtb__789) -> (match dtb__788 with
  | { B_dData_dPair.f_Pair_first = dtb__790; B_dData_dPair.f_Pair_second = dtb__791 } -> (String.concat "" [" "; (v_showTerm dtb__790); (v_showArgTerms dtb__789)])
  | _ -> failwith "DT: impossible branch"
)
  | B_dData_dList.C_List_Nil -> ""
  | _ -> failwith "DT: impossible branch"
))
# 1105 "Vuna/Compiler/Core/Term.vuna"
and v_recordAppShow = (fun (mc0 : string) (mc1 : (t_Term, t_Rig) B_dData_dPair.t_Pair B_dData_dList.t_List) -> (match mc1 with
  | B_dData_dList.C_List__x58__x58_ (dtb__792, dtb__793) -> (match dtb__792 with
  | { B_dData_dPair.f_Pair_first = dtb__794; B_dData_dPair.f_Pair_second = dtb__795 } -> ((v_recordAppShow (String.concat "" ["("; mc0; " "; (v_showTerm dtb__794); ")"])) dtb__793)
  | _ -> failwith "DT: impossible branch"
)
  | B_dData_dList.C_List_Nil -> mc0
  | _ -> failwith "DT: impossible branch"
))
# 1115 "Vuna/Compiler/Core/Term.vuna"
and v_showCoreAlts = (fun (mc0 : t_CaseAlt B_dData_dList.t_List) -> (match mc0 with
  | B_dData_dList.C_List__x58__x58_ (dtb__796, dtb__797) -> (String.concat "" [(v_caseAltName dtb__796); (v_showBinders (v_binderPairs (v_caseAltBinders dtb__796))); " => "; (v_showTerm (v_caseAltBody dtb__796)); " | "; (v_showCoreAlts dtb__797)])
  | B_dData_dList.C_List_Nil -> ""
  | _ -> failwith "DT: impossible branch"
))

# 1075 "Vuna/Compiler/Core/Term.vuna"
let rec v_showPiSig = (fun (name : string) (implicit : bool) (dom : t_Term) (cod : t_Term) -> (if (name = "_") then (String.concat "" [(v_showSigParenIfPi dom); " -> "; (v_showTypeSig cod)]) else (if implicit then (String.concat "" ["{"; name; " : "; (v_showTypeSig dom); "} -> "; (v_showTypeSig cod)]) else (String.concat "" ["("; name; " : "; (v_showTypeSig dom); ") -> "; (v_showTypeSig cod)]))))
# 1084 "Vuna/Compiler/Core/Term.vuna"
and v_showTypeSig = (fun (mc0 : t_Term) -> (match mc0 with
  | C_Term_TRecord (dtb__798, dtb__799) -> ((v_showSigAppText dtb__798) dtb__799)
  | C_Term_TCon (dtb__800, dtb__801) -> (match dtb__801 with
  | B_dData_dList.C_List_Nil -> dtb__800
  | _ -> (String.concat "" ["("; dtb__800; (v_showSigArgs dtb__801); ")"])
)
  | C_Term_TApp (dtb__802, dtb__803, dtb__804) -> (String.concat "" ["("; (v_showSigParenIfPi dtb__802); " "; (v_showSigParenIfPi dtb__803); ")"])
  | C_Term_TPi (dtb__805, dtb__806, dtb__807, dtb__808, dtb__809) -> ((((v_showPiSig dtb__805) dtb__806) dtb__808) dtb__809)
  | _ -> (v_showTerm mc0)
))
# 1092 "Vuna/Compiler/Core/Term.vuna"
and v_showSigParenIfPi = (fun (mc0 : t_Term) -> (match mc0 with
  | C_Term_TPi (dtb__810, dtb__811, dtb__812, dtb__813, dtb__814) -> (String.concat "" ["("; ((((v_showPiSig dtb__810) dtb__811) dtb__813) dtb__814); ")"])
  | _ -> (v_showTypeSig mc0)
))
# 1096 "Vuna/Compiler/Core/Term.vuna"
and v_showSigArgs = (fun (mc0 : (t_Term, t_Rig) B_dData_dPair.t_Pair B_dData_dList.t_List) -> (match mc0 with
  | B_dData_dList.C_List__x58__x58_ (dtb__815, dtb__816) -> (match dtb__815 with
  | { B_dData_dPair.f_Pair_first = dtb__817; B_dData_dPair.f_Pair_second = dtb__818 } -> (String.concat "" [" "; (v_showSigParenIfPi dtb__817); (v_showSigArgs dtb__816)])
  | _ -> failwith "DT: impossible branch"
)
  | B_dData_dList.C_List_Nil -> ""
  | _ -> failwith "DT: impossible branch"
))
# 1110 "Vuna/Compiler/Core/Term.vuna"
and v_showSigAppText = (fun (mc0 : string) (mc1 : (t_Term, t_Rig) B_dData_dPair.t_Pair B_dData_dList.t_List) -> (match mc1 with
  | B_dData_dList.C_List__x58__x58_ (dtb__819, dtb__820) -> (match dtb__819 with
  | { B_dData_dPair.f_Pair_first = dtb__821; B_dData_dPair.f_Pair_second = dtb__822 } -> ((v_showSigAppText (String.concat "" ["("; mc0; " "; (v_showSigParenIfPi dtb__821); ")"])) dtb__820)
  | _ -> failwith "DT: impossible branch"
)
  | B_dData_dList.C_List_Nil -> mc0
  | _ -> failwith "DT: impossible branch"
))

# 161 "Vuna/Compiler/Core/Term.vuna"
let v_binderName = (fun (p : t_Binder) -> (p).f_Binder_binderName)

# 162 "Vuna/Compiler/Core/Term.vuna"
let v_binderRig = (fun (p : t_Binder) -> (p).f_Binder_binderRig)

# 163 "Vuna/Compiler/Core/Term.vuna"
let v_binderSpan = (fun (p : t_Binder) -> (p).f_Binder_binderSpan)

# 204 "Vuna/Compiler/Core/Term.vuna"
let v_closureEnv = (fun (p : t_Closure) -> (p).f_Closure_closureEnv)

# 205 "Vuna/Compiler/Core/Term.vuna"
let v_closureBody = (fun (p : t_Closure) -> (p).f_Closure_closureBody)

# 234 "Vuna/Compiler/Core/Term.vuna"
let v_vCaseAltName = (fun (p : t_VCaseAlt) -> (p).f_VCaseAlt_vCaseAltName)

# 235 "Vuna/Compiler/Core/Term.vuna"
let v_vCaseAltBinders = (fun (p : t_VCaseAlt) -> (p).f_VCaseAlt_vCaseAltBinders)

# 236 "Vuna/Compiler/Core/Term.vuna"
let v_vCaseAltClosure = (fun (p : t_VCaseAlt) -> (p).f_VCaseAlt_vCaseAltClosure)

# 385 "Vuna/Compiler/Core/Term.vuna"
let v_solsTbl = (fun (p : t_Sols) -> (p).f_Sols_solsTbl)
