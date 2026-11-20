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

# 307 "Vuna/Compiler/Core/Term.vuna"
let rec v_termSize = (fun (mc0 : t_Term) -> (match mc0 with
  | C_Term_TIf (dtb__43, dtb__44, dtb__45) -> (((1 + (v_termSize dtb__43)) + (v_termSize dtb__44)) + (v_termSize dtb__45))
  | C_Term_TBool (dtb__46) -> 1
  | C_Term_TFloat (dtb__47) -> 1
  | C_Term_TStr (dtb__48) -> 1
  | C_Term_TInt (dtb__49) -> 1
  | C_Term_TRecUpd (dtb__50, dtb__51, dtb__52, dtb__53, dtb__54) -> ((1 + (v_termSize dtb__50)) + (v_termSize dtb__54))
  | C_Term_TProj (dtb__55, dtb__56, dtb__57, dtb__58, dtb__59) -> (1 + (v_termSize dtb__55))
  | C_Term_TCase (dtb__60, dtb__61) -> ((1 + (v_termSize dtb__60)) + (v_termSizeAlts dtb__61))
  | C_Term_TRecord (dtb__62, dtb__63) -> (1 + (v_termSizeArgs dtb__63))
  | C_Term_TMk (dtb__64, dtb__65) -> (1 + (v_termSizeArgs dtb__65))
  | C_Term_TCon (dtb__66, dtb__67) -> (1 + (v_termSizeArgs dtb__67))
  | C_Term_TApp (dtb__68, dtb__69, dtb__70) -> ((1 + (v_termSize dtb__68)) + (v_termSize dtb__69))
  | C_Term_TLam (dtb__71, dtb__72, dtb__73, dtb__74, dtb__75) -> ((fun tys -> ((1 + tys) + (v_termSize dtb__75))) ((fun nd_uscrut6 -> (match nd_uscrut6 with
  | B_dData_dMaybe.C_Maybe_Just (dtb__76) -> (match dtb__76 with
  | { B_dData_dPair.f_Pair_first = dtb__77; B_dData_dPair.f_Pair_second = dtb__78 } -> ((v_termSizeMaybe dtb__77) + (v_termSizeMaybe dtb__78))
  | _ -> failwith "DT: impossible branch"
)
  | B_dData_dMaybe.C_Maybe_Nothing -> 0
  | _ -> failwith "DT: impossible branch"
)) dtb__73))
  | C_Term_TPi (dtb__79, dtb__80, dtb__81, dtb__82, dtb__83) -> ((1 + (v_termSize dtb__82)) + (v_termSize dtb__83))
  | C_Term_TType (dtb__84) -> 1
  | C_Term_TGlobal (dtb__85) -> 1
  | C_Term_TMeta (dtb__86) -> 1
  | C_Term_TVar (dtb__87, dtb__88, dtb__89) -> 1
  | _ -> failwith "DT: impossible branch"
))
# 333 "Vuna/Compiler/Core/Term.vuna"
and v_termSizeMaybe = (fun (mc0 : t_Term B_dData_dMaybe.t_Maybe) -> (match mc0 with
  | B_dData_dMaybe.C_Maybe_Just (dtb__90) -> (v_termSize dtb__90)
  | B_dData_dMaybe.C_Maybe_Nothing -> 0
  | _ -> failwith "DT: impossible branch"
))
# 337 "Vuna/Compiler/Core/Term.vuna"
and v_termSizeArgs = (fun (mc0 : (t_Term, t_Rig) B_dData_dPair.t_Pair B_dData_dList.t_List) -> (match mc0 with
  | B_dData_dList.C_List__x58__x58_ (dtb__91, dtb__92) -> (match dtb__91 with
  | { B_dData_dPair.f_Pair_first = dtb__93; B_dData_dPair.f_Pair_second = dtb__94 } -> ((v_termSize dtb__93) + (v_termSizeArgs dtb__92))
  | _ -> failwith "DT: impossible branch"
)
  | B_dData_dList.C_List_Nil -> 0
  | _ -> failwith "DT: impossible branch"
))
# 341 "Vuna/Compiler/Core/Term.vuna"
and v_termSizeAlts = (fun (mc0 : t_CaseAlt B_dData_dList.t_List) -> (match mc0 with
  | B_dData_dList.C_List__x58__x58_ (dtb__95, dtb__96) -> ((v_termSize (v_caseAltBody dtb__95)) + (v_termSizeAlts dtb__96))
  | B_dData_dList.C_List_Nil -> 0
  | _ -> failwith "DT: impossible branch"
))

# 349 "Vuna/Compiler/Core/Term.vuna"
let v_metaLookup = (fun (i : int) (t : (int, t_Value) B_dContainer_dHashMap.t_HashMap) -> ((((B_dContainer_dHashMap.v_lookup B_dData_dInt.v_Hashable_uInt) B_dData_dInt.v_Eq_uInt) i) t))

# 353 "Vuna/Compiler/Core/Term.vuna"
let rec v_metaLookupList = (fun (mc0 : int) (mc1 : (int, t_Value) B_dData_dPair.t_Pair B_dData_dList.t_List) -> (match mc1 with
  | B_dData_dList.C_List__x58__x58_ (dtb__97, dtb__98) -> (match dtb__97 with
  | { B_dData_dPair.f_Pair_first = dtb__99; B_dData_dPair.f_Pair_second = dtb__100 } -> (if (mc0 = dtb__99) then (B_dData_dMaybe.C_Maybe_Just (dtb__100)) else ((v_metaLookupList mc0) dtb__98))
  | _ -> failwith "DT: impossible branch"
)
  | B_dData_dList.C_List_Nil -> B_dData_dMaybe.C_Maybe_Nothing
  | _ -> failwith "DT: impossible branch"
))

# 372 "Vuna/Compiler/Core/Term.vuna"
let v_solsEmpty = { f_Sols_solsTbl = (((B_dContainer_dHashMap.v_fromList B_dData_dInt.v_Hashable_uInt) B_dData_dInt.v_Eq_uInt) B_dData_dList.C_List_Nil); f_Sols_solsList = B_dData_dList.C_List_Nil; f_Sols_solsDepth = (((B_dContainer_dHashMap.v_fromList B_dData_dInt.v_Hashable_uInt) B_dData_dInt.v_Eq_uInt) B_dData_dList.C_List_Nil) }

# 375 "Vuna/Compiler/Core/Term.vuna"
let v_solsFromList = (fun (xs : (int, t_Value) B_dData_dPair.t_Pair B_dData_dList.t_List) -> { f_Sols_solsTbl = ((((B_dContainer_dHashMap.v_insertAll B_dData_dInt.v_Hashable_uInt) B_dData_dInt.v_Eq_uInt) xs) (((B_dContainer_dHashMap.v_fromList B_dData_dInt.v_Hashable_uInt) B_dData_dInt.v_Eq_uInt) B_dData_dList.C_List_Nil)); f_Sols_solsList = xs; f_Sols_solsDepth = (((B_dContainer_dHashMap.v_fromList B_dData_dInt.v_Hashable_uInt) B_dData_dInt.v_Eq_uInt) B_dData_dList.C_List_Nil) })

# 379 "Vuna/Compiler/Core/Term.vuna"
let v_solsOf = (fun (t : (int, t_Value) B_dContainer_dHashMap.t_HashMap) (xs : (int, t_Value) B_dData_dPair.t_Pair B_dData_dList.t_List) (d : (int, int) B_dContainer_dHashMap.t_HashMap) -> { f_Sols_solsTbl = t; f_Sols_solsList = xs; f_Sols_solsDepth = d })

# 382 "Vuna/Compiler/Core/Term.vuna"
let v_solsList = (fun (mc0 : t_Sols) -> (match mc0 with
  | { f_Sols_solsTbl = dtb__101; f_Sols_solsList = dtb__102; f_Sols_solsDepth = dtb__103 } -> dtb__102
  | _ -> failwith "DT: impossible branch"
))

# 386 "Vuna/Compiler/Core/Term.vuna"
let v_solsDepth = (fun (mc0 : int) (mc1 : t_Sols) -> (match mc1 with
  | { f_Sols_solsTbl = dtb__104; f_Sols_solsList = dtb__105; f_Sols_solsDepth = dtb__106 } -> ((((B_dContainer_dHashMap.v_lookup B_dData_dInt.v_Hashable_uInt) B_dData_dInt.v_Eq_uInt) mc0) dtb__106)
  | _ -> failwith "DT: impossible branch"
))

# 391 "Vuna/Compiler/Core/Term.vuna"
let v_solsLookup = (fun (mc0 : int) (mc1 : t_Sols) -> (match mc1 with
  | { f_Sols_solsTbl = dtb__107; f_Sols_solsList = dtb__108; f_Sols_solsDepth = dtb__109 } -> ((((B_dContainer_dHashMap.v_lookup B_dData_dInt.v_Hashable_uInt) B_dData_dInt.v_Eq_uInt) mc0) dtb__107)
  | _ -> failwith "DT: impossible branch"
))

# 394 "Vuna/Compiler/Core/Term.vuna"
let v_solsCons = (fun (mc0 : int) (mc1 : t_Value) (mc2 : t_Sols) -> (match mc2 with
  | { f_Sols_solsTbl = dtb__110; f_Sols_solsList = dtb__111; f_Sols_solsDepth = dtb__112 } -> { f_Sols_solsTbl = (((((B_dContainer_dHashMap.v_insert B_dData_dInt.v_Hashable_uInt) B_dData_dInt.v_Eq_uInt) mc0) mc1) dtb__110); f_Sols_solsList = (B_dData_dList.C_List__x58__x58_ ({ B_dData_dPair.f_Pair_first = mc0; B_dData_dPair.f_Pair_second = mc1 }, dtb__111)); f_Sols_solsDepth = dtb__112 }
  | _ -> failwith "DT: impossible branch"
))

# 399 "Vuna/Compiler/Core/Term.vuna"
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
  | C_Term_TLam (dtb__141, dtb__142, dtb__143, dtb__144, dtb__145) -> ((fun tys -> (if tys then true else ((v_termHasUnsolvedMeta mc0) dtb__145))) ((fun nd_uscrut7 -> (match nd_uscrut7 with
  | B_dData_dMaybe.C_Maybe_Just (dtb__146) -> (match dtb__146 with
  | { B_dData_dPair.f_Pair_first = dtb__147; B_dData_dPair.f_Pair_second = dtb__148 } -> (if ((v_termHasUnsolvedMetaMaybe mc0) dtb__147) then true else ((v_termHasUnsolvedMetaMaybe mc0) dtb__148))
  | _ -> failwith "DT: impossible branch"
)
  | B_dData_dMaybe.C_Maybe_Nothing -> false
  | _ -> failwith "DT: impossible branch"
)) dtb__143))
  | C_Term_TPi (dtb__149, dtb__150, dtb__151, dtb__152, dtb__153) -> (if ((v_termHasUnsolvedMeta mc0) dtb__152) then true else ((v_termHasUnsolvedMeta mc0) dtb__153))
  | C_Term_TType (dtb__154) -> false
  | C_Term_TGlobal (dtb__155) -> false
  | C_Term_TVar (dtb__156, dtb__157, dtb__158) -> false
  | C_Term_TMeta (dtb__159) -> (match ((v_solsLookup dtb__159) mc0) with
  | B_dData_dMaybe.C_Maybe_Just (dtb__160) -> false
  | B_dData_dMaybe.C_Maybe_Nothing -> true
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
))
# 432 "Vuna/Compiler/Core/Term.vuna"
and v_termHasUnsolvedMetaMaybe = (fun (mc0 : t_Sols) (mc1 : t_Term B_dData_dMaybe.t_Maybe) -> (match mc1 with
  | B_dData_dMaybe.C_Maybe_Just (dtb__161) -> ((v_termHasUnsolvedMeta mc0) dtb__161)
  | B_dData_dMaybe.C_Maybe_Nothing -> false
  | _ -> failwith "DT: impossible branch"
))
# 436 "Vuna/Compiler/Core/Term.vuna"
and v_termHasUnsolvedMetaArgs = (fun (mc0 : t_Sols) (mc1 : (t_Term, t_Rig) B_dData_dPair.t_Pair B_dData_dList.t_List) -> (match mc1 with
  | B_dData_dList.C_List__x58__x58_ (dtb__162, dtb__163) -> (match dtb__162 with
  | { B_dData_dPair.f_Pair_first = dtb__164; B_dData_dPair.f_Pair_second = dtb__165 } -> (if ((v_termHasUnsolvedMeta mc0) dtb__164) then true else ((v_termHasUnsolvedMetaArgs mc0) dtb__163))
  | _ -> failwith "DT: impossible branch"
)
  | B_dData_dList.C_List_Nil -> false
  | _ -> failwith "DT: impossible branch"
))
# 441 "Vuna/Compiler/Core/Term.vuna"
and v_termHasUnsolvedMetaAlts = (fun (mc0 : t_Sols) (mc1 : t_CaseAlt B_dData_dList.t_List) -> (match mc1 with
  | B_dData_dList.C_List__x58__x58_ (dtb__166, dtb__167) -> (if ((v_termHasUnsolvedMeta mc0) (v_caseAltBody dtb__166)) then true else ((v_termHasUnsolvedMetaAlts mc0) dtb__167))
  | B_dData_dList.C_List_Nil -> false
  | _ -> failwith "DT: impossible branch"
))

# 448 "Vuna/Compiler/Core/Term.vuna"
let rec v_termUsesFloat = (fun (mc0 : string B_dData_dList.t_List) (mc1 : t_Term) -> (match mc1 with
  | C_Term_TIf (dtb__168, dtb__169, dtb__170) -> (if (if ((v_termUsesFloat mc0) dtb__168) then true else ((v_termUsesFloat mc0) dtb__169)) then true else ((v_termUsesFloat mc0) dtb__170))
  | C_Term_TBool (dtb__171) -> false
  | C_Term_TStr (dtb__172) -> false
  | C_Term_TInt (dtb__173) -> false
  | C_Term_TCase (dtb__174, dtb__175) -> (if ((v_termUsesFloat mc0) dtb__174) then true else ((v_anyAltUsesFloat mc0) dtb__175))
  | C_Term_TRecUpd (dtb__176, dtb__177, dtb__178, dtb__179, dtb__180) -> (if ((v_termUsesFloat mc0) dtb__176) then true else ((v_termUsesFloat mc0) dtb__180))
  | C_Term_TProj (dtb__181, dtb__182, dtb__183, dtb__184, dtb__185) -> ((v_termUsesFloat mc0) dtb__181)
  | C_Term_TRecord (dtb__186, dtb__187) -> ((v_anyArgUsesFloat mc0) dtb__187)
  | C_Term_TMk (dtb__188, dtb__189) -> ((v_anyArgUsesFloat mc0) dtb__189)
  | C_Term_TCon (dtb__190, dtb__191) -> ((v_anyArgUsesFloat mc0) dtb__191)
  | C_Term_TApp (dtb__192, dtb__193, dtb__194) -> (if ((v_termUsesFloat mc0) dtb__192) then true else ((v_termUsesFloat mc0) dtb__193))
  | C_Term_TLam (dtb__195, dtb__196, dtb__197, dtb__198, dtb__199) -> ((v_termUsesFloat mc0) dtb__199)
  | C_Term_TPi (dtb__200, dtb__201, dtb__202, dtb__203, dtb__204) -> (if ((v_termUsesFloat mc0) dtb__203) then true else ((v_termUsesFloat mc0) dtb__204))
  | C_Term_TType (dtb__205) -> false
  | C_Term_TMeta (dtb__206) -> false
  | C_Term_TVar (dtb__207, dtb__208, dtb__209) -> false
  | C_Term_TGlobal (dtb__210) -> ((B_dData_dList.v_memName dtb__210) mc0)
  | C_Term_TFloat (dtb__211) -> true
  | _ -> failwith "DT: impossible branch"
))
# 471 "Vuna/Compiler/Core/Term.vuna"
and v_anyArgUsesFloat = (fun (mc0 : string B_dData_dList.t_List) (mc1 : (t_Term, t_Rig) B_dData_dPair.t_Pair B_dData_dList.t_List) -> (match mc1 with
  | B_dData_dList.C_List__x58__x58_ (dtb__212, dtb__213) -> (match dtb__212 with
  | { B_dData_dPair.f_Pair_first = dtb__214; B_dData_dPair.f_Pair_second = dtb__215 } -> (if ((v_termUsesFloat mc0) dtb__214) then true else ((v_anyArgUsesFloat mc0) dtb__213))
  | _ -> failwith "DT: impossible branch"
)
  | B_dData_dList.C_List_Nil -> false
  | _ -> failwith "DT: impossible branch"
))
# 476 "Vuna/Compiler/Core/Term.vuna"
and v_anyAltUsesFloat = (fun (mc0 : string B_dData_dList.t_List) (mc1 : t_CaseAlt B_dData_dList.t_List) -> (match mc1 with
  | B_dData_dList.C_List__x58__x58_ (dtb__216, dtb__217) -> (if ((v_termUsesFloat mc0) (v_caseAltBody dtb__216)) then true else ((v_anyAltUsesFloat mc0) dtb__217))
  | B_dData_dList.C_List_Nil -> false
  | _ -> failwith "DT: impossible branch"
))

# 482 "Vuna/Compiler/Core/Term.vuna"
let rec v_termGlobalNames = (fun (mc0 : t_Term) -> (match mc0 with
  | C_Term_TIf (dtb__218, dtb__219, dtb__220) -> ((B_dData_dList.v_append (v_termGlobalNames dtb__218)) ((B_dData_dList.v_append (v_termGlobalNames dtb__219)) (v_termGlobalNames dtb__220)))
  | C_Term_TBool (dtb__221) -> B_dData_dList.C_List_Nil
  | C_Term_TStr (dtb__222) -> B_dData_dList.C_List_Nil
  | C_Term_TInt (dtb__223) -> B_dData_dList.C_List_Nil
  | C_Term_TCase (dtb__224, dtb__225) -> ((B_dData_dList.v_append (v_termGlobalNames dtb__224)) ((B_dData_dList.v_concatMap (fun (a : t_CaseAlt) -> (v_termGlobalNames (v_caseAltBody a)))) dtb__225))
  | C_Term_TRecUpd (dtb__226, dtb__227, dtb__228, dtb__229, dtb__230) -> ((B_dData_dList.v_append (v_termGlobalNames dtb__226)) (v_termGlobalNames dtb__230))
  | C_Term_TProj (dtb__231, dtb__232, dtb__233, dtb__234, dtb__235) -> (v_termGlobalNames dtb__231)
  | C_Term_TRecord (dtb__236, dtb__237) -> (B_dData_dList.C_List__x58__x58_ (dtb__236, ((B_dData_dList.v_concatMap (fun (p : (t_Term, t_Rig) B_dData_dPair.t_Pair) -> (v_termGlobalNames (B_dData_dPair.v_firstOf p)))) dtb__237)))
  | C_Term_TMk (dtb__238, dtb__239) -> ((B_dData_dList.v_concatMap (fun (p : (t_Term, t_Rig) B_dData_dPair.t_Pair) -> (v_termGlobalNames (B_dData_dPair.v_firstOf p)))) dtb__239)
  | C_Term_TCon (dtb__240, dtb__241) -> ((B_dData_dList.v_concatMap (fun (p : (t_Term, t_Rig) B_dData_dPair.t_Pair) -> (v_termGlobalNames (B_dData_dPair.v_firstOf p)))) dtb__241)
  | C_Term_TApp (dtb__242, dtb__243, dtb__244) -> ((B_dData_dList.v_append (v_termGlobalNames dtb__242)) (v_termGlobalNames dtb__243))
  | C_Term_TLam (dtb__245, dtb__246, dtb__247, dtb__248, dtb__249) -> (v_termGlobalNames dtb__249)
  | C_Term_TPi (dtb__250, dtb__251, dtb__252, dtb__253, dtb__254) -> ((B_dData_dList.v_append (v_termGlobalNames dtb__253)) (v_termGlobalNames dtb__254))
  | C_Term_TType (dtb__255) -> B_dData_dList.C_List_Nil
  | C_Term_TMeta (dtb__256) -> B_dData_dList.C_List_Nil
  | C_Term_TVar (dtb__257, dtb__258, dtb__259) -> B_dData_dList.C_List_Nil
  | C_Term_TGlobal (dtb__260) -> (B_dData_dList.C_List__x58__x58_ (dtb__260, B_dData_dList.C_List_Nil))
  | C_Term_TFloat (dtb__261) -> B_dData_dList.C_List_Nil
  | _ -> failwith "DT: impossible branch"
))

# 534 "Vuna/Compiler/Core/Term.vuna"
let rec v_lookupPair = (fun (mc0 : string) (mc1 : (string, t_Term) B_dData_dPair.t_Pair B_dData_dList.t_List) -> (match mc1 with
  | B_dData_dList.C_List__x58__x58_ (dtb__262, dtb__263) -> (match dtb__262 with
  | { B_dData_dPair.f_Pair_first = dtb__264; B_dData_dPair.f_Pair_second = dtb__265 } -> (if (dtb__264 = mc0) then (B_dData_dMaybe.C_Maybe_Just (dtb__265)) else ((v_lookupPair mc0) dtb__263))
  | _ -> failwith "DT: impossible branch"
)
  | B_dData_dList.C_List_Nil -> B_dData_dMaybe.C_Maybe_Nothing
  | _ -> failwith "DT: impossible branch"
))

# 526 "Vuna/Compiler/Core/Term.vuna"
let rec v_bodyTermsOf = (fun (mc0 : (string, t_Term) B_dData_dPair.t_Pair B_dData_dList.t_List) (mc1 : string B_dData_dList.t_List) -> (match mc1 with
  | B_dData_dList.C_List__x58__x58_ (dtb__266, dtb__267) -> (match ((v_lookupPair dtb__266) mc0) with
  | B_dData_dMaybe.C_Maybe_Just (dtb__268) -> (B_dData_dList.C_List__x58__x58_ (dtb__268, ((v_bodyTermsOf mc0) dtb__267)))
  | B_dData_dMaybe.C_Maybe_Nothing -> ((v_bodyTermsOf mc0) dtb__267)
  | _ -> failwith "DT: impossible branch"
)
  | B_dData_dList.C_List_Nil -> B_dData_dList.C_List_Nil
  | _ -> failwith "DT: impossible branch"
))

# 514 "Vuna/Compiler/Core/Term.vuna"
let rec v_reachesTermsFuel = (fun (mc0 : int) (mc1 : (string, t_Term) B_dData_dPair.t_Pair B_dData_dList.t_List) (mc2 : string B_dData_dList.t_List) (mc3 : t_Term B_dData_dList.t_List) -> (match mc3 with
  | B_dData_dList.C_List__x58__x58_ (dtb__269, dtb__270) -> (if (mc0 <= 0) then false else (if ((v_termUsesFloat mc2) dtb__269) then true else ((((v_reachesTermsFuel (mc0 - 1)) mc1) mc2) ((B_dData_dList.v_append dtb__270) ((v_bodyTermsOf mc1) (v_termGlobalNames dtb__269))))))
  | B_dData_dList.C_List_Nil -> false
  | _ -> failwith "DT: impossible branch"
))

# 509 "Vuna/Compiler/Core/Term.vuna"
let v_termReachesFloat = (fun (defs : (string, t_Term) B_dData_dPair.t_Pair B_dData_dList.t_List) (names : string B_dData_dList.t_List) (t : t_Term) -> ((((v_reachesTermsFuel 4096) defs) names) (B_dData_dList.C_List__x58__x58_ (t, B_dData_dList.C_List_Nil))))

# 538 "Vuna/Compiler/Core/Term.vuna"
let v_defLookup = (fun (name : string) (tbl : (string, t_Term) B_dContainer_dHashMap.t_HashMap) -> ((((B_dContainer_dHashMap.v_lookup B_dData_dString.v_Hashable_uString) B_dData_dString.v_Eq_uString) name) tbl))

# 542 "Vuna/Compiler/Core/Term.vuna"
let rec v_hasFreeVar = (fun (mc0 : int) (mc1 : t_Term) -> (match mc1 with
  | C_Term_TIf (dtb__271, dtb__272, dtb__273) -> (if (if ((v_hasFreeVar mc0) dtb__271) then true else ((v_hasFreeVar mc0) dtb__272)) then true else ((v_hasFreeVar mc0) dtb__273))
  | C_Term_TBool (dtb__274) -> false
  | C_Term_TFloat (dtb__275) -> false
  | C_Term_TStr (dtb__276) -> false
  | C_Term_TInt (dtb__277) -> false
  | C_Term_TCase (dtb__278, dtb__279) -> (if ((v_hasFreeVar mc0) dtb__278) then true else ((v_hasFreeVarAlts mc0) dtb__279))
  | C_Term_TRecUpd (dtb__280, dtb__281, dtb__282, dtb__283, dtb__284) -> (if ((v_hasFreeVar mc0) dtb__280) then true else ((v_hasFreeVar (mc0 + (B_dData_dList.v_length dtb__282))) dtb__284))
  | C_Term_TProj (dtb__285, dtb__286, dtb__287, dtb__288, dtb__289) -> ((v_hasFreeVar mc0) dtb__285)
  | C_Term_TRecord (dtb__290, dtb__291) -> ((v_hasFreeVarArgs mc0) dtb__291)
  | C_Term_TMk (dtb__292, dtb__293) -> ((v_hasFreeVarArgs mc0) dtb__293)
  | C_Term_TCon (dtb__294, dtb__295) -> ((v_hasFreeVarArgs mc0) dtb__295)
  | C_Term_TApp (dtb__296, dtb__297, dtb__298) -> (if ((v_hasFreeVar mc0) dtb__296) then true else ((v_hasFreeVar mc0) dtb__297))
  | C_Term_TLam (dtb__299, dtb__300, dtb__301, dtb__302, dtb__303) -> ((fun tys -> (if tys then true else ((v_hasFreeVar (mc0 + 1)) dtb__303))) ((fun nd_uscrut7 -> (match nd_uscrut7 with
  | B_dData_dMaybe.C_Maybe_Just (dtb__304) -> (match dtb__304 with
  | { B_dData_dPair.f_Pair_first = dtb__305; B_dData_dPair.f_Pair_second = dtb__306 } -> (if ((v_hasFreeVarMaybe mc0) dtb__305) then true else ((v_hasFreeVarMaybe (mc0 + 1)) dtb__306))
  | _ -> failwith "DT: impossible branch"
)
  | B_dData_dMaybe.C_Maybe_Nothing -> false
  | _ -> failwith "DT: impossible branch"
)) dtb__301))
  | C_Term_TPi (dtb__307, dtb__308, dtb__309, dtb__310, dtb__311) -> (if ((v_hasFreeVar mc0) dtb__310) then true else ((v_hasFreeVar (mc0 + 1)) dtb__311))
  | C_Term_TType (dtb__312) -> false
  | C_Term_TGlobal (dtb__313) -> false
  | C_Term_TMeta (dtb__314) -> false
  | C_Term_TVar (dtb__315, dtb__316, dtb__317) -> (dtb__316 >= mc0)
  | _ -> failwith "DT: impossible branch"
))
# 570 "Vuna/Compiler/Core/Term.vuna"
and v_hasFreeVarMaybe = (fun (mc0 : int) (mc1 : t_Term B_dData_dMaybe.t_Maybe) -> (match mc1 with
  | B_dData_dMaybe.C_Maybe_Just (dtb__318) -> ((v_hasFreeVar mc0) dtb__318)
  | B_dData_dMaybe.C_Maybe_Nothing -> false
  | _ -> failwith "DT: impossible branch"
))
# 574 "Vuna/Compiler/Core/Term.vuna"
and v_hasFreeVarArgs = (fun (mc0 : int) (mc1 : (t_Term, t_Rig) B_dData_dPair.t_Pair B_dData_dList.t_List) -> (match mc1 with
  | B_dData_dList.C_List__x58__x58_ (dtb__319, dtb__320) -> (match dtb__319 with
  | { B_dData_dPair.f_Pair_first = dtb__321; B_dData_dPair.f_Pair_second = dtb__322 } -> (if ((v_hasFreeVar mc0) dtb__321) then true else ((v_hasFreeVarArgs mc0) dtb__320))
  | _ -> failwith "DT: impossible branch"
)
  | B_dData_dList.C_List_Nil -> false
  | _ -> failwith "DT: impossible branch"
))
# 578 "Vuna/Compiler/Core/Term.vuna"
and v_hasFreeVarAlts = (fun (mc0 : int) (mc1 : t_CaseAlt B_dData_dList.t_List) -> (match mc1 with
  | B_dData_dList.C_List__x58__x58_ (dtb__323, dtb__324) -> (if ((v_hasFreeVar (mc0 + (B_dData_dList.v_length (v_caseAltBinders dtb__323)))) (v_caseAltBody dtb__323)) then true else ((v_hasFreeVarAlts mc0) dtb__324))
  | B_dData_dList.C_List_Nil -> false
  | _ -> failwith "DT: impossible branch"
))

# 583 "Vuna/Compiler/Core/Term.vuna"
let rec v_hasMeta = (fun (mc0 : int) (mc1 : int) (mc2 : t_Term) -> (match mc2 with
  | C_Term_TIf (dtb__325, dtb__326, dtb__327) -> (if (if (((v_hasMeta mc0) mc1) dtb__325) then true else (((v_hasMeta mc0) mc1) dtb__326)) then true else (((v_hasMeta mc0) mc1) dtb__327))
  | C_Term_TBool (dtb__328) -> false
  | C_Term_TFloat (dtb__329) -> false
  | C_Term_TStr (dtb__330) -> false
  | C_Term_TInt (dtb__331) -> false
  | C_Term_TCase (dtb__332, dtb__333) -> (if (((v_hasMeta mc0) mc1) dtb__332) then true else (((v_hasMetaAlts mc0) mc1) dtb__333))
  | C_Term_TRecUpd (dtb__334, dtb__335, dtb__336, dtb__337, dtb__338) -> (if (((v_hasMeta mc0) mc1) dtb__334) then true else (((v_hasMeta mc0) (mc1 + (B_dData_dList.v_length dtb__336))) dtb__338))
  | C_Term_TProj (dtb__339, dtb__340, dtb__341, dtb__342, dtb__343) -> (((v_hasMeta mc0) mc1) dtb__339)
  | C_Term_TRecord (dtb__344, dtb__345) -> (((v_hasMetaArgs mc0) mc1) dtb__345)
  | C_Term_TMk (dtb__346, dtb__347) -> (((v_hasMetaArgs mc0) mc1) dtb__347)
  | C_Term_TCon (dtb__348, dtb__349) -> (((v_hasMetaArgs mc0) mc1) dtb__349)
  | C_Term_TApp (dtb__350, dtb__351, dtb__352) -> (if (((v_hasMeta mc0) mc1) dtb__350) then true else (((v_hasMeta mc0) mc1) dtb__351))
  | C_Term_TLam (dtb__353, dtb__354, dtb__355, dtb__356, dtb__357) -> ((fun tys -> (if tys then true else (((v_hasMeta mc0) (mc1 + 1)) dtb__357))) ((fun nd_uscrut8 -> (match nd_uscrut8 with
  | B_dData_dMaybe.C_Maybe_Just (dtb__358) -> (match dtb__358 with
  | { B_dData_dPair.f_Pair_first = dtb__359; B_dData_dPair.f_Pair_second = dtb__360 } -> (if (((v_hasMetaMaybe mc0) mc1) dtb__359) then true else (((v_hasMetaMaybe mc0) (mc1 + 1)) dtb__360))
  | _ -> failwith "DT: impossible branch"
)
  | B_dData_dMaybe.C_Maybe_Nothing -> false
  | _ -> failwith "DT: impossible branch"
)) dtb__355))
  | C_Term_TPi (dtb__361, dtb__362, dtb__363, dtb__364, dtb__365) -> (if (((v_hasMeta mc0) mc1) dtb__364) then true else (((v_hasMeta mc0) (mc1 + 1)) dtb__365))
  | C_Term_TType (dtb__366) -> false
  | C_Term_TGlobal (dtb__367) -> false
  | C_Term_TVar (dtb__368, dtb__369, dtb__370) -> false
  | C_Term_TMeta (dtb__371) -> (mc0 = dtb__371)
  | _ -> failwith "DT: impossible branch"
))
# 610 "Vuna/Compiler/Core/Term.vuna"
and v_hasMetaMaybe = (fun (mc0 : int) (mc1 : int) (mc2 : t_Term B_dData_dMaybe.t_Maybe) -> (match mc2 with
  | B_dData_dMaybe.C_Maybe_Just (dtb__372) -> (((v_hasMeta mc0) mc1) dtb__372)
  | B_dData_dMaybe.C_Maybe_Nothing -> false
  | _ -> failwith "DT: impossible branch"
))
# 614 "Vuna/Compiler/Core/Term.vuna"
and v_hasMetaArgs = (fun (mc0 : int) (mc1 : int) (mc2 : (t_Term, t_Rig) B_dData_dPair.t_Pair B_dData_dList.t_List) -> (match mc2 with
  | B_dData_dList.C_List__x58__x58_ (dtb__373, dtb__374) -> (match dtb__373 with
  | { B_dData_dPair.f_Pair_first = dtb__375; B_dData_dPair.f_Pair_second = dtb__376 } -> (if (((v_hasMeta mc0) mc1) dtb__375) then true else (((v_hasMetaArgs mc0) mc1) dtb__374))
  | _ -> failwith "DT: impossible branch"
)
  | B_dData_dList.C_List_Nil -> false
  | _ -> failwith "DT: impossible branch"
))
# 618 "Vuna/Compiler/Core/Term.vuna"
and v_hasMetaAlts = (fun (mc0 : int) (mc1 : int) (mc2 : t_CaseAlt B_dData_dList.t_List) -> (match mc2 with
  | B_dData_dList.C_List__x58__x58_ (dtb__377, dtb__378) -> (if (((v_hasMeta mc0) (mc1 + (B_dData_dList.v_length (v_caseAltBinders dtb__377)))) (v_caseAltBody dtb__377)) then true else (((v_hasMetaAlts mc0) mc1) dtb__378))
  | B_dData_dList.C_List_Nil -> false
  | _ -> failwith "DT: impossible branch"
))

# 624 "Vuna/Compiler/Core/Term.vuna"
let v_mapTermMaybe = (fun (mc0 : (t_Term) -> t_Term) (mc1 : t_Term B_dData_dMaybe.t_Maybe) -> (match mc1 with
  | B_dData_dMaybe.C_Maybe_Just (dtb__379) -> (B_dData_dMaybe.C_Maybe_Just ((mc0 dtb__379)))
  | B_dData_dMaybe.C_Maybe_Nothing -> B_dData_dMaybe.C_Maybe_Nothing
  | _ -> failwith "DT: impossible branch"
))

# 635 "Vuna/Compiler/Core/Term.vuna"
let v_lamBinderTyOf = (fun (mc0 : (t_Term B_dData_dMaybe.t_Maybe, t_Term B_dData_dMaybe.t_Maybe) B_dData_dPair.t_Pair B_dData_dMaybe.t_Maybe) -> (match mc0 with
  | B_dData_dMaybe.C_Maybe_Just (dtb__380) -> (B_dData_dPair.v_firstOf dtb__380)
  | B_dData_dMaybe.C_Maybe_Nothing -> B_dData_dMaybe.C_Maybe_Nothing
  | _ -> failwith "DT: impossible branch"
))

# 639 "Vuna/Compiler/Core/Term.vuna"
let v_lamResultTyOf = (fun (mc0 : (t_Term B_dData_dMaybe.t_Maybe, t_Term B_dData_dMaybe.t_Maybe) B_dData_dPair.t_Pair B_dData_dMaybe.t_Maybe) -> (match mc0 with
  | B_dData_dMaybe.C_Maybe_Just (dtb__381) -> (B_dData_dPair.v_secondOf dtb__381)
  | B_dData_dMaybe.C_Maybe_Nothing -> B_dData_dMaybe.C_Maybe_Nothing
  | _ -> failwith "DT: impossible branch"
))

# 643 "Vuna/Compiler/Core/Term.vuna"
let v_lamTyOf = (fun (mc0 : t_Term B_dData_dMaybe.t_Maybe) (mc1 : t_Term B_dData_dMaybe.t_Maybe) -> (match mc0 with
  | B_dData_dMaybe.C_Maybe_Nothing -> (match mc1 with
  | B_dData_dMaybe.C_Maybe_Nothing -> B_dData_dMaybe.C_Maybe_Nothing
  | _ -> (B_dData_dMaybe.C_Maybe_Just ({ B_dData_dPair.f_Pair_first = mc0; B_dData_dPair.f_Pair_second = mc1 }))
)
  | _ -> (B_dData_dMaybe.C_Maybe_Just ({ B_dData_dPair.f_Pair_first = mc0; B_dData_dPair.f_Pair_second = mc1 }))
))

# 647 "Vuna/Compiler/Core/Term.vuna"
let v_lamTyWithBinder = (fun (binderTy : t_Term B_dData_dMaybe.t_Maybe) -> ((v_lamTyOf binderTy) B_dData_dMaybe.C_Maybe_Nothing))

# 650 "Vuna/Compiler/Core/Term.vuna"
let v_lamTyWithResult = (fun (resultTy : t_Term B_dData_dMaybe.t_Maybe) -> ((v_lamTyOf B_dData_dMaybe.C_Maybe_Nothing) resultTy))

# 653 "Vuna/Compiler/Core/Term.vuna"
let v_lamTyMap = (fun (mc0 : (int) -> (t_Term) -> t_Term) (mc1 : int) (mc2 : (t_Term B_dData_dMaybe.t_Maybe, t_Term B_dData_dMaybe.t_Maybe) B_dData_dPair.t_Pair B_dData_dMaybe.t_Maybe) -> (match mc2 with
  | B_dData_dMaybe.C_Maybe_Just (dtb__382) -> ((v_lamTyOf ((v_mapTermMaybe (mc0 mc1)) (B_dData_dPair.v_firstOf dtb__382))) ((v_mapTermMaybe (mc0 (mc1 + 1))) (B_dData_dPair.v_secondOf dtb__382)))
  | B_dData_dMaybe.C_Maybe_Nothing -> B_dData_dMaybe.C_Maybe_Nothing
  | _ -> failwith "DT: impossible branch"
))

# 662 "Vuna/Compiler/Core/Term.vuna"
let rec v_shift = (fun (mc0 : int) (mc1 : int) (mc2 : t_Term) -> (match mc2 with
  | C_Term_TIf (dtb__383, dtb__384, dtb__385) -> (C_Term_TIf ((((v_shift mc0) mc1) dtb__383), (((v_shift mc0) mc1) dtb__384), (((v_shift mc0) mc1) dtb__385)))
  | C_Term_TBool (dtb__386) -> mc2
  | C_Term_TFloat (dtb__387) -> mc2
  | C_Term_TStr (dtb__388) -> mc2
  | C_Term_TInt (dtb__389) -> mc2
  | C_Term_TCase (dtb__390, dtb__391) -> (C_Term_TCase ((((v_shift mc0) mc1) dtb__390), (((v_shiftAlts mc0) mc1) dtb__391)))
  | C_Term_TRecUpd (dtb__392, dtb__393, dtb__394, dtb__395, dtb__396) -> (C_Term_TRecUpd ((((v_shift mc0) mc1) dtb__392), dtb__393, dtb__394, dtb__395, (((v_shift (mc0 + (B_dData_dList.v_length dtb__394))) mc1) dtb__396)))
  | C_Term_TProj (dtb__397, dtb__398, dtb__399, dtb__400, dtb__401) -> (C_Term_TProj ((((v_shift mc0) mc1) dtb__397), dtb__398, dtb__399, dtb__400, dtb__401))
  | C_Term_TRecord (dtb__402, dtb__403) -> (C_Term_TRecord (dtb__402, (((v_shiftArgs mc0) mc1) dtb__403)))
  | C_Term_TMk (dtb__404, dtb__405) -> (C_Term_TMk (dtb__404, (((v_shiftArgs mc0) mc1) dtb__405)))
  | C_Term_TCon (dtb__406, dtb__407) -> (C_Term_TCon (dtb__406, (((v_shiftArgs mc0) mc1) dtb__407)))
  | C_Term_TApp (dtb__408, dtb__409, dtb__410) -> (C_Term_TApp ((((v_shift mc0) mc1) dtb__408), (((v_shift mc0) mc1) dtb__409), dtb__410))
  | C_Term_TLam (dtb__411, dtb__412, dtb__413, dtb__414, dtb__415) -> ((fun slot2 -> (C_Term_TLam (dtb__411, dtb__412, slot2, dtb__414, (((v_shift (mc0 + 1)) mc1) dtb__415)))) ((fun nd_uscrut8 -> (match nd_uscrut8 with
  | B_dData_dMaybe.C_Maybe_Just (dtb__416) -> (match dtb__416 with
  | { B_dData_dPair.f_Pair_first = dtb__417; B_dData_dPair.f_Pair_second = dtb__418 } -> ((v_lamTyOf (match dtb__417 with
  | B_dData_dMaybe.C_Maybe_Nothing -> B_dData_dMaybe.C_Maybe_Nothing
  | B_dData_dMaybe.C_Maybe_Just (dtb__419) -> (B_dData_dMaybe.C_Maybe_Just ((((v_shift mc0) mc1) dtb__419)))
  | _ -> failwith "DT: impossible branch"
)) (match dtb__418 with
  | B_dData_dMaybe.C_Maybe_Nothing -> B_dData_dMaybe.C_Maybe_Nothing
  | B_dData_dMaybe.C_Maybe_Just (dtb__420) -> (B_dData_dMaybe.C_Maybe_Just ((((v_shift (mc0 + 1)) mc1) dtb__420)))
  | _ -> failwith "DT: impossible branch"
))
  | _ -> failwith "DT: impossible branch"
)
  | B_dData_dMaybe.C_Maybe_Nothing -> B_dData_dMaybe.C_Maybe_Nothing
  | _ -> failwith "DT: impossible branch"
)) dtb__413))
  | C_Term_TPi (dtb__421, dtb__422, dtb__423, dtb__424, dtb__425) -> (C_Term_TPi (dtb__421, dtb__422, dtb__423, (((v_shift mc0) mc1) dtb__424), (((v_shift (mc0 + 1)) mc1) dtb__425)))
  | C_Term_TType (dtb__426) -> mc2
  | C_Term_TGlobal (dtb__427) -> mc2
  | C_Term_TMeta (dtb__428) -> mc2
  | C_Term_TVar (dtb__429, dtb__430, dtb__431) -> (if (dtb__430 >= mc0) then (C_Term_TVar (dtb__429, (dtb__430 + mc1), dtb__431)) else mc2)
  | _ -> failwith "DT: impossible branch"
))
# 701 "Vuna/Compiler/Core/Term.vuna"
and v_shiftArgs = (fun (mc0 : int) (mc1 : int) (mc2 : (t_Term, t_Rig) B_dData_dPair.t_Pair B_dData_dList.t_List) -> (match mc2 with
  | B_dData_dList.C_List__x58__x58_ (dtb__432, dtb__433) -> (match dtb__432 with
  | { B_dData_dPair.f_Pair_first = dtb__434; B_dData_dPair.f_Pair_second = dtb__435 } -> (B_dData_dList.C_List__x58__x58_ ({ B_dData_dPair.f_Pair_first = (((v_shift mc0) mc1) dtb__434); B_dData_dPair.f_Pair_second = dtb__435 }, (((v_shiftArgs mc0) mc1) dtb__433)))
  | _ -> failwith "DT: impossible branch"
)
  | B_dData_dList.C_List_Nil -> B_dData_dList.C_List_Nil
  | _ -> failwith "DT: impossible branch"
))
# 706 "Vuna/Compiler/Core/Term.vuna"
and v_shiftAlts = (fun (mc0 : int) (mc1 : int) (mc2 : t_CaseAlt B_dData_dList.t_List) -> (match mc2 with
  | B_dData_dList.C_List__x58__x58_ (dtb__436, dtb__437) -> (B_dData_dList.C_List__x58__x58_ ((((v_shiftAlt mc0) mc1) dtb__436), (((v_shiftAlts mc0) mc1) dtb__437)))
  | B_dData_dList.C_List_Nil -> B_dData_dList.C_List_Nil
  | _ -> failwith "DT: impossible branch"
))
# 710 "Vuna/Compiler/Core/Term.vuna"
and v_shiftAlt = (fun (mc0 : int) (mc1 : int) (mc2 : t_CaseAlt) -> (match mc2 with
  | { f_CaseAlt_caseAltName = dtb__438; f_CaseAlt_caseAltBinders = dtb__439; f_CaseAlt_caseAltBody = dtb__440 } -> { f_CaseAlt_caseAltName = dtb__438; f_CaseAlt_caseAltBinders = dtb__439; f_CaseAlt_caseAltBody = (((v_shift (mc0 + (B_dData_dList.v_length dtb__439))) mc1) dtb__440) }
  | _ -> failwith "DT: impossible branch"
))

# 715 "Vuna/Compiler/Core/Term.vuna"
let rec v_substVarAt = (fun (mc0 : int) (mc1 : t_Term) (mc2 : t_Term) -> (match mc2 with
  | C_Term_TIf (dtb__441, dtb__442, dtb__443) -> (C_Term_TIf ((((v_substVarAt mc0) mc1) dtb__441), (((v_substVarAt mc0) mc1) dtb__442), (((v_substVarAt mc0) mc1) dtb__443)))
  | C_Term_TBool (dtb__444) -> mc2
  | C_Term_TFloat (dtb__445) -> mc2
  | C_Term_TStr (dtb__446) -> mc2
  | C_Term_TInt (dtb__447) -> mc2
  | C_Term_TCase (dtb__448, dtb__449) -> (C_Term_TCase ((((v_substVarAt mc0) mc1) dtb__448), ((B_dData_dList.v_map ((v_substAltAt mc0) mc1)) dtb__449)))
  | C_Term_TRecUpd (dtb__450, dtb__451, dtb__452, dtb__453, dtb__454) -> (C_Term_TRecUpd ((((v_substVarAt mc0) mc1) dtb__450), dtb__451, dtb__452, dtb__453, (((v_substVarAt (mc0 + (B_dData_dList.v_length dtb__452))) mc1) dtb__454)))
  | C_Term_TProj (dtb__455, dtb__456, dtb__457, dtb__458, dtb__459) -> (C_Term_TProj ((((v_substVarAt mc0) mc1) dtb__455), dtb__456, dtb__457, dtb__458, dtb__459))
  | C_Term_TRecord (dtb__460, dtb__461) -> (C_Term_TRecord (dtb__460, ((B_dData_dList.v_map (fun (p : (t_Term, t_Rig) B_dData_dPair.t_Pair) -> { B_dData_dPair.f_Pair_first = (((v_substVarAt mc0) mc1) (B_dData_dPair.v_firstOf p)); B_dData_dPair.f_Pair_second = (B_dData_dPair.v_secondOf p) })) dtb__461)))
  | C_Term_TMk (dtb__462, dtb__463) -> (C_Term_TMk (dtb__462, ((B_dData_dList.v_map (fun (p : (t_Term, t_Rig) B_dData_dPair.t_Pair) -> { B_dData_dPair.f_Pair_first = (((v_substVarAt mc0) mc1) (B_dData_dPair.v_firstOf p)); B_dData_dPair.f_Pair_second = (B_dData_dPair.v_secondOf p) })) dtb__463)))
  | C_Term_TCon (dtb__464, dtb__465) -> (C_Term_TCon (dtb__464, ((B_dData_dList.v_map (fun (p : (t_Term, t_Rig) B_dData_dPair.t_Pair) -> { B_dData_dPair.f_Pair_first = (((v_substVarAt mc0) mc1) (B_dData_dPair.v_firstOf p)); B_dData_dPair.f_Pair_second = (B_dData_dPair.v_secondOf p) })) dtb__465)))
  | C_Term_TApp (dtb__466, dtb__467, dtb__468) -> (C_Term_TApp ((((v_substVarAt mc0) mc1) dtb__466), (((v_substVarAt mc0) mc1) dtb__467), dtb__468))
  | C_Term_TLam (dtb__469, dtb__470, dtb__471, dtb__472, dtb__473) -> ((fun slot2 -> (C_Term_TLam (dtb__469, dtb__470, slot2, dtb__472, (((v_substVarAt (mc0 + 1)) mc1) dtb__473)))) ((fun nd_uscrut8 -> (match nd_uscrut8 with
  | B_dData_dMaybe.C_Maybe_Just (dtb__474) -> (match dtb__474 with
  | { B_dData_dPair.f_Pair_first = dtb__475; B_dData_dPair.f_Pair_second = dtb__476 } -> ((v_lamTyOf (match dtb__475 with
  | B_dData_dMaybe.C_Maybe_Nothing -> B_dData_dMaybe.C_Maybe_Nothing
  | B_dData_dMaybe.C_Maybe_Just (dtb__477) -> (B_dData_dMaybe.C_Maybe_Just ((((v_substVarAt mc0) mc1) dtb__477)))
  | _ -> failwith "DT: impossible branch"
)) (match dtb__476 with
  | B_dData_dMaybe.C_Maybe_Nothing -> B_dData_dMaybe.C_Maybe_Nothing
  | B_dData_dMaybe.C_Maybe_Just (dtb__478) -> (B_dData_dMaybe.C_Maybe_Just ((((v_substVarAt (mc0 + 1)) mc1) dtb__478)))
  | _ -> failwith "DT: impossible branch"
))
  | _ -> failwith "DT: impossible branch"
)
  | B_dData_dMaybe.C_Maybe_Nothing -> B_dData_dMaybe.C_Maybe_Nothing
  | _ -> failwith "DT: impossible branch"
)) dtb__471))
  | C_Term_TPi (dtb__479, dtb__480, dtb__481, dtb__482, dtb__483) -> (C_Term_TPi (dtb__479, dtb__480, dtb__481, (((v_substVarAt mc0) mc1) dtb__482), (((v_substVarAt (mc0 + 1)) mc1) dtb__483)))
  | C_Term_TType (dtb__484) -> mc2
  | C_Term_TGlobal (dtb__485) -> mc2
  | C_Term_TMeta (dtb__486) -> mc2
  | C_Term_TVar (dtb__487, dtb__488, dtb__489) -> (if (dtb__488 = mc0) then mc1 else mc2)
  | _ -> failwith "DT: impossible branch"
))
# 757 "Vuna/Compiler/Core/Term.vuna"
and v_substAltAt = (fun (idx : int) (arg : t_Term) (alt : t_CaseAlt) -> { f_CaseAlt_caseAltName = (v_caseAltName alt); f_CaseAlt_caseAltBinders = (v_caseAltBinders alt); f_CaseAlt_caseAltBody = (((v_substVarAt (idx + (B_dData_dList.v_length (v_caseAltBinders alt)))) arg) (v_caseAltBody alt)) })

# 767 "Vuna/Compiler/Core/Term.vuna"
let rec v_substMetaVarGo = (fun (mc0 : int) (mc1 : string) (mc2 : int) (mc3 : int) (mc4 : t_Term) -> (match mc4 with
  | C_Term_TIf (dtb__490, dtb__491, dtb__492) -> (C_Term_TIf ((((((v_substMetaVarGo mc0) mc1) mc2) mc3) dtb__490), (((((v_substMetaVarGo mc0) mc1) mc2) mc3) dtb__491), (((((v_substMetaVarGo mc0) mc1) mc2) mc3) dtb__492)))
  | C_Term_TCase (dtb__493, dtb__494) -> (C_Term_TCase ((((((v_substMetaVarGo mc0) mc1) mc2) mc3) dtb__493), ((B_dData_dList.v_map ((((v_substMetaVarAlt mc0) mc1) mc2) mc3)) dtb__494)))
  | C_Term_TProj (dtb__495, dtb__496, dtb__497, dtb__498, dtb__499) -> (C_Term_TProj ((((((v_substMetaVarGo mc0) mc1) mc2) mc3) dtb__495), dtb__496, dtb__497, dtb__498, dtb__499))
  | C_Term_TRecord (dtb__500, dtb__501) -> (C_Term_TRecord (dtb__500, ((B_dData_dList.v_map (fun (p : (t_Term, t_Rig) B_dData_dPair.t_Pair) -> { B_dData_dPair.f_Pair_first = (((((v_substMetaVarGo mc0) mc1) mc2) mc3) (B_dData_dPair.v_firstOf p)); B_dData_dPair.f_Pair_second = (B_dData_dPair.v_secondOf p) })) dtb__501)))
  | C_Term_TMk (dtb__502, dtb__503) -> (C_Term_TMk (dtb__502, ((B_dData_dList.v_map (fun (p : (t_Term, t_Rig) B_dData_dPair.t_Pair) -> { B_dData_dPair.f_Pair_first = (((((v_substMetaVarGo mc0) mc1) mc2) mc3) (B_dData_dPair.v_firstOf p)); B_dData_dPair.f_Pair_second = (B_dData_dPair.v_secondOf p) })) dtb__503)))
  | C_Term_TCon (dtb__504, dtb__505) -> (C_Term_TCon (dtb__504, ((B_dData_dList.v_map (fun (p : (t_Term, t_Rig) B_dData_dPair.t_Pair) -> { B_dData_dPair.f_Pair_first = (((((v_substMetaVarGo mc0) mc1) mc2) mc3) (B_dData_dPair.v_firstOf p)); B_dData_dPair.f_Pair_second = (B_dData_dPair.v_secondOf p) })) dtb__505)))
  | C_Term_TApp (dtb__506, dtb__507, dtb__508) -> (C_Term_TApp ((((((v_substMetaVarGo mc0) mc1) mc2) mc3) dtb__506), (((((v_substMetaVarGo mc0) mc1) mc2) mc3) dtb__507), dtb__508))
  | C_Term_TLam (dtb__509, dtb__510, dtb__511, dtb__512, dtb__513) -> ((fun slot2 -> (C_Term_TLam (dtb__509, dtb__510, slot2, dtb__512, (((((v_substMetaVarGo mc0) mc1) mc2) (mc3 + 1)) dtb__513)))) ((fun nd_uscrut10 -> (match nd_uscrut10 with
  | B_dData_dMaybe.C_Maybe_Just (dtb__514) -> (match dtb__514 with
  | { B_dData_dPair.f_Pair_first = dtb__515; B_dData_dPair.f_Pair_second = dtb__516 } -> ((v_lamTyOf (match dtb__515 with
  | B_dData_dMaybe.C_Maybe_Nothing -> B_dData_dMaybe.C_Maybe_Nothing
  | B_dData_dMaybe.C_Maybe_Just (dtb__517) -> (B_dData_dMaybe.C_Maybe_Just ((((((v_substMetaVarGo mc0) mc1) mc2) mc3) dtb__517)))
  | _ -> failwith "DT: impossible branch"
)) (match dtb__516 with
  | B_dData_dMaybe.C_Maybe_Nothing -> B_dData_dMaybe.C_Maybe_Nothing
  | B_dData_dMaybe.C_Maybe_Just (dtb__518) -> (B_dData_dMaybe.C_Maybe_Just ((((((v_substMetaVarGo mc0) mc1) mc2) (mc3 + 1)) dtb__518)))
  | _ -> failwith "DT: impossible branch"
))
  | _ -> failwith "DT: impossible branch"
)
  | B_dData_dMaybe.C_Maybe_Nothing -> B_dData_dMaybe.C_Maybe_Nothing
  | _ -> failwith "DT: impossible branch"
)) dtb__511))
  | C_Term_TPi (dtb__519, dtb__520, dtb__521, dtb__522, dtb__523) -> (C_Term_TPi (dtb__519, dtb__520, dtb__521, (((((v_substMetaVarGo mc0) mc1) mc2) mc3) dtb__522), (((((v_substMetaVarGo mc0) mc1) mc2) (mc3 + 1)) dtb__523)))
  | C_Term_TMeta (dtb__524) -> (if (dtb__524 = mc0) then (C_Term_TVar (mc1, (mc3 - mc2), { Base_dSource.f_Span_spanFile = ""; Base_dSource.f_Span_spanStartLine = 0; Base_dSource.f_Span_spanStartCol = 0; Base_dSource.f_Span_spanEndLine = 0; Base_dSource.f_Span_spanEndCol = 0; Base_dSource.f_Span_spanStartOffset = 0; Base_dSource.f_Span_spanEndOffset = 0 })) else mc4)
  | _ -> mc4
))
# 807 "Vuna/Compiler/Core/Term.vuna"
and v_substMetaVarAlt = (fun (mc0 : int) (mc1 : string) (mc2 : int) (mc3 : int) (mc4 : t_CaseAlt) -> (match mc4 with
  | { f_CaseAlt_caseAltName = dtb__525; f_CaseAlt_caseAltBinders = dtb__526; f_CaseAlt_caseAltBody = dtb__527 } -> { f_CaseAlt_caseAltName = dtb__525; f_CaseAlt_caseAltBinders = dtb__526; f_CaseAlt_caseAltBody = (((((v_substMetaVarGo mc0) mc1) mc2) (mc3 + (B_dData_dList.v_length dtb__526))) dtb__527) }
  | _ -> failwith "DT: impossible branch"
))

# 764 "Vuna/Compiler/Core/Term.vuna"
let v_substMetaVar = (fun (m : int) (name : string) (q : int) (t : t_Term) -> (((((v_substMetaVarGo m) name) q) 0) t))

# 819 "Vuna/Compiler/Core/Term.vuna"
let rec v_insertDictBinderGo = (fun (mc0 : string) (mc1 : int) (mc2 : t_Term) (mc3 : int) (mc4 : t_Term) -> (match mc4 with
  | C_Term_TPi (dtb__528, dtb__529, dtb__530, dtb__531, dtb__532) -> (if (mc3 = mc1) then (C_Term_TPi (dtb__528, dtb__529, dtb__530, dtb__531, (C_Term_TPi (mc0, true, C_Rig_RigOmega, mc2, (((v_shift 0) 1) dtb__532))))) else (C_Term_TPi (dtb__528, dtb__529, dtb__530, dtb__531, (((((v_insertDictBinderGo mc0) mc1) mc2) (mc3 + 1)) dtb__532))))
  | _ -> mc4
))

# 813 "Vuna/Compiler/Core/Term.vuna"
let v_insertDictBinder = (fun (name : string) (idx : int) (dictDom : t_Term) (t : t_Term) -> (((((v_insertDictBinderGo name) idx) dictDom) 0) t))

# 831 "Vuna/Compiler/Core/Term.vuna"
let rec v_insertImplicitBinderGo = (fun (mc0 : string) (mc1 : int) (mc2 : t_Rig) (mc3 : t_Term) (mc4 : int) (mc5 : t_Term) -> (match mc5 with
  | C_Term_TPi (dtb__533, dtb__534, dtb__535, dtb__536, dtb__537) -> (if (mc4 = mc1) then (C_Term_TPi (dtb__533, dtb__534, dtb__535, dtb__536, (C_Term_TPi (mc0, true, mc2, mc3, (((v_shift 0) 1) dtb__537))))) else (C_Term_TPi (dtb__533, dtb__534, dtb__535, dtb__536, ((((((v_insertImplicitBinderGo mc0) mc1) mc2) mc3) (mc4 + 1)) dtb__537))))
  | _ -> mc5
))

# 828 "Vuna/Compiler/Core/Term.vuna"
let v_insertImplicitBinder = (fun (name : string) (idx : int) (rig : t_Rig) (dom : t_Term) (t : t_Term) -> ((((((v_insertImplicitBinderGo name) idx) rig) dom) 0) t))

# 840 "Vuna/Compiler/Core/Term.vuna"
let v_cutoffOf = (fun (total : int) (idx : int) -> (if ((total - (idx + 1)) <= 0) then 0 else (total - (idx + 1))))

# 843 "Vuna/Compiler/Core/Term.vuna"
let rec v_countPis = (fun (mc0 : t_Term) -> (match mc0 with
  | C_Term_TPi (dtb__538, dtb__539, dtb__540, dtb__541, dtb__542) -> (1 + (v_countPis dtb__542))
  | _ -> 0
))

# 855 "Vuna/Compiler/Core/Term.vuna"
let rec v_insertLamBinderGo = (fun (mc0 : string) (mc1 : int) (mc2 : int) (mc3 : t_Term) -> (match mc3 with
  | C_Term_TLam (dtb__543, dtb__544, dtb__545, dtb__546, dtb__547) -> (if (mc2 = mc1) then (C_Term_TLam (dtb__543, dtb__544, dtb__545, dtb__546, (C_Term_TLam (mc0, C_Rig_RigOmega, B_dData_dMaybe.C_Maybe_Nothing, Base_dSource.v_spanEmpty, (((v_shift 0) 1) dtb__547))))) else (C_Term_TLam (dtb__543, dtb__544, dtb__545, dtb__546, ((((v_insertLamBinderGo mc0) mc1) (mc2 + 1)) dtb__547))))
  | _ -> mc3
))

# 852 "Vuna/Compiler/Core/Term.vuna"
let v_insertLamBinder = (fun (name : string) (idx : int) (t : t_Term) -> ((((v_insertLamBinderGo name) idx) 0) t))

# 863 "Vuna/Compiler/Core/Term.vuna"
let rec v_countLams = (fun (mc0 : t_Term) -> (match mc0 with
  | C_Term_TLam (dtb__548, dtb__549, dtb__550, dtb__551, dtb__552) -> (1 + (v_countLams dtb__552))
  | _ -> 0
))

# 868 "Vuna/Compiler/Core/Term.vuna"
let rec v_hasFreeTermVar = (fun (mc0 : int) (mc1 : t_Term) -> (match mc1 with
  | C_Term_TIf (dtb__553, dtb__554, dtb__555) -> (if (if ((v_hasFreeTermVar mc0) dtb__553) then true else ((v_hasFreeTermVar mc0) dtb__554)) then true else ((v_hasFreeTermVar mc0) dtb__555))
  | C_Term_TCase (dtb__556, dtb__557) -> (if ((v_hasFreeTermVar mc0) dtb__556) then true else ((v_anyAltFree mc0) dtb__557))
  | C_Term_TRecUpd (dtb__558, dtb__559, dtb__560, dtb__561, dtb__562) -> (if ((v_hasFreeTermVar mc0) dtb__558) then true else ((v_hasFreeTermVar (mc0 + (B_dData_dList.v_length dtb__560))) dtb__562))
  | C_Term_TProj (dtb__563, dtb__564, dtb__565, dtb__566, dtb__567) -> ((v_hasFreeTermVar mc0) dtb__563)
  | C_Term_TRecord (dtb__568, dtb__569) -> ((v_anyPairFree mc0) dtb__569)
  | C_Term_TMk (dtb__570, dtb__571) -> ((v_anyPairFree mc0) dtb__571)
  | C_Term_TCon (dtb__572, dtb__573) -> ((v_anyPairFree mc0) dtb__573)
  | C_Term_TApp (dtb__574, dtb__575, dtb__576) -> (if ((v_hasFreeTermVar mc0) dtb__574) then true else ((v_hasFreeTermVar mc0) dtb__575))
  | C_Term_TLam (dtb__577, dtb__578, dtb__579, dtb__580, dtb__581) -> ((fun tys -> (if tys then true else ((v_hasFreeTermVar (mc0 + 1)) dtb__581))) ((fun nd_uscrut7 -> (match nd_uscrut7 with
  | B_dData_dMaybe.C_Maybe_Just (dtb__582) -> (match dtb__582 with
  | { B_dData_dPair.f_Pair_first = dtb__583; B_dData_dPair.f_Pair_second = dtb__584 } -> (if ((v_hasFreeTermVarMaybe mc0) dtb__583) then true else ((v_hasFreeTermVarMaybe (mc0 + 1)) dtb__584))
  | _ -> failwith "DT: impossible branch"
)
  | B_dData_dMaybe.C_Maybe_Nothing -> false
  | _ -> failwith "DT: impossible branch"
)) dtb__579))
  | C_Term_TPi (dtb__585, dtb__586, dtb__587, dtb__588, dtb__589) -> (if ((v_hasFreeTermVar mc0) dtb__588) then true else ((v_hasFreeTermVar (mc0 + 1)) dtb__589))
  | C_Term_TVar (dtb__590, dtb__591, dtb__592) -> (dtb__591 >= mc0)
  | _ -> false
))
# 891 "Vuna/Compiler/Core/Term.vuna"
and v_hasFreeTermVarMaybe = (fun (mc0 : int) (mc1 : t_Term B_dData_dMaybe.t_Maybe) -> (match mc1 with
  | B_dData_dMaybe.C_Maybe_Just (dtb__593) -> ((v_hasFreeTermVar mc0) dtb__593)
  | B_dData_dMaybe.C_Maybe_Nothing -> false
  | _ -> failwith "DT: impossible branch"
))
# 895 "Vuna/Compiler/Core/Term.vuna"
and v_anyPairFree = (fun (mc0 : int) (mc1 : (t_Term, t_Rig) B_dData_dPair.t_Pair B_dData_dList.t_List) -> (match mc1 with
  | B_dData_dList.C_List__x58__x58_ (dtb__594, dtb__595) -> (match dtb__594 with
  | { B_dData_dPair.f_Pair_first = dtb__596; B_dData_dPair.f_Pair_second = dtb__597 } -> (if ((v_hasFreeTermVar mc0) dtb__596) then true else ((v_anyPairFree mc0) dtb__595))
  | _ -> failwith "DT: impossible branch"
)
  | B_dData_dList.C_List_Nil -> false
  | _ -> failwith "DT: impossible branch"
))
# 899 "Vuna/Compiler/Core/Term.vuna"
and v_anyAltFree = (fun (mc0 : int) (mc1 : t_CaseAlt B_dData_dList.t_List) -> (match mc1 with
  | B_dData_dList.C_List__x58__x58_ (dtb__598, dtb__599) -> (match dtb__598 with
  | { f_CaseAlt_caseAltName = dtb__600; f_CaseAlt_caseAltBinders = dtb__601; f_CaseAlt_caseAltBody = dtb__602 } -> (if ((v_hasFreeTermVar (mc0 + (B_dData_dList.v_length dtb__601))) dtb__602) then true else ((v_anyAltFree mc0) dtb__599))
  | _ -> failwith "DT: impossible branch"
)
  | B_dData_dList.C_List_Nil -> false
  | _ -> failwith "DT: impossible branch"
))

# 906 "Vuna/Compiler/Core/Term.vuna"
let rec v_hasNegativeVar = (fun (mc0 : t_Term) -> (match mc0 with
  | C_Term_TIf (dtb__603, dtb__604, dtb__605) -> (if (if (v_hasNegativeVar dtb__603) then true else (v_hasNegativeVar dtb__604)) then true else (v_hasNegativeVar dtb__605))
  | C_Term_TCase (dtb__606, dtb__607) -> (if (v_hasNegativeVar dtb__606) then true else (v_anyNegativeVarAlts dtb__607))
  | C_Term_TRecUpd (dtb__608, dtb__609, dtb__610, dtb__611, dtb__612) -> (if (v_hasNegativeVar dtb__608) then true else (v_hasNegativeVar dtb__612))
  | C_Term_TProj (dtb__613, dtb__614, dtb__615, dtb__616, dtb__617) -> (v_hasNegativeVar dtb__613)
  | C_Term_TRecord (dtb__618, dtb__619) -> (v_anyNegativeVarArgs dtb__619)
  | C_Term_TMk (dtb__620, dtb__621) -> (v_anyNegativeVarArgs dtb__621)
  | C_Term_TCon (dtb__622, dtb__623) -> (v_anyNegativeVarArgs dtb__623)
  | C_Term_TApp (dtb__624, dtb__625, dtb__626) -> (if (v_hasNegativeVar dtb__624) then true else (v_hasNegativeVar dtb__625))
  | C_Term_TLam (dtb__627, dtb__628, dtb__629, dtb__630, dtb__631) -> ((fun tys -> (if tys then true else (v_hasNegativeVar dtb__631))) ((fun nd_uscrut6 -> (match nd_uscrut6 with
  | B_dData_dMaybe.C_Maybe_Just (dtb__632) -> (match dtb__632 with
  | { B_dData_dPair.f_Pair_first = dtb__633; B_dData_dPair.f_Pair_second = dtb__634 } -> (if (v_hasNegativeVarMaybe dtb__633) then true else (v_hasNegativeVarMaybe dtb__634))
  | _ -> failwith "DT: impossible branch"
)
  | B_dData_dMaybe.C_Maybe_Nothing -> false
  | _ -> failwith "DT: impossible branch"
)) dtb__629))
  | C_Term_TPi (dtb__635, dtb__636, dtb__637, dtb__638, dtb__639) -> (if (v_hasNegativeVar dtb__638) then true else (v_hasNegativeVar dtb__639))
  | C_Term_TVar (dtb__640, dtb__641, dtb__642) -> (dtb__641 < 0)
  | _ -> false
))
# 926 "Vuna/Compiler/Core/Term.vuna"
and v_hasNegativeVarMaybe = (fun (mc0 : t_Term B_dData_dMaybe.t_Maybe) -> (match mc0 with
  | B_dData_dMaybe.C_Maybe_Just (dtb__643) -> (v_hasNegativeVar dtb__643)
  | B_dData_dMaybe.C_Maybe_Nothing -> false
  | _ -> failwith "DT: impossible branch"
))
# 930 "Vuna/Compiler/Core/Term.vuna"
and v_anyNegativeVarArgs = (fun (mc0 : (t_Term, t_Rig) B_dData_dPair.t_Pair B_dData_dList.t_List) -> (match mc0 with
  | B_dData_dList.C_List__x58__x58_ (dtb__644, dtb__645) -> (match dtb__644 with
  | { B_dData_dPair.f_Pair_first = dtb__646; B_dData_dPair.f_Pair_second = dtb__647 } -> (if (v_hasNegativeVar dtb__646) then true else (v_anyNegativeVarArgs dtb__645))
  | _ -> failwith "DT: impossible branch"
)
  | B_dData_dList.C_List_Nil -> false
  | _ -> failwith "DT: impossible branch"
))
# 934 "Vuna/Compiler/Core/Term.vuna"
and v_anyNegativeVarAlts = (fun (mc0 : t_CaseAlt B_dData_dList.t_List) -> (match mc0 with
  | B_dData_dList.C_List__x58__x58_ (dtb__648, dtb__649) -> (match dtb__648 with
  | { f_CaseAlt_caseAltName = dtb__650; f_CaseAlt_caseAltBinders = dtb__651; f_CaseAlt_caseAltBody = dtb__652 } -> (if (v_hasNegativeVar dtb__652) then true else (v_anyNegativeVarAlts dtb__649))
  | _ -> failwith "DT: impossible branch"
)
  | B_dData_dList.C_List_Nil -> false
  | _ -> failwith "DT: impossible branch"
))

# 940 "Vuna/Compiler/Core/Term.vuna"
let v_metaScanBound = 262144

# 946 "Vuna/Compiler/Core/Term.vuna"
let rec v_hasUnsolvedMetaValueFuel = (fun (fuel : int) (sols : t_Sols) (v : t_Value) -> (if (fuel <= 0) then true else (match v with
  | C_Value_VMeta (dtb__653, dtb__654) -> (match ((v_solsLookup dtb__653) sols) with
  | B_dData_dMaybe.C_Maybe_Just (dtb__655) -> (((v_hasUnsolvedMetaValueFuel (fuel - 1)) sols) dtb__655)
  | B_dData_dMaybe.C_Maybe_Nothing -> true
  | _ -> failwith "DT: impossible branch"
)
  | C_Value_VNeutral (dtb__656) -> (match dtb__656 with
  | C_Neutral_NVar (dtb__657, dtb__658, dtb__659) -> (((v_hasUnsolvedMetaListFuel (fuel - 1)) sols) dtb__659)
  | C_Neutral_NGlobal (dtb__660, dtb__661) -> (((v_hasUnsolvedMetaListFuel (fuel - 1)) sols) dtb__661)
  | _ -> failwith "DT: impossible branch"
)
  | C_Value_VPi (dtb__662, dtb__663, dtb__664, dtb__665, dtb__666) -> (if (((v_hasUnsolvedMetaValueFuel (fuel - 1)) sols) dtb__665) then true else (((v_hasUnsolvedMetaCloFuel (fuel - 1)) sols) dtb__666))
  | C_Value_VLam (dtb__667, dtb__668, dtb__669) -> (((v_hasUnsolvedMetaCloFuel (fuel - 1)) sols) dtb__669)
  | C_Value_VCon (dtb__670, dtb__671) -> (((v_hasUnsolvedMetaListFuel (fuel - 1)) sols) dtb__671)
  | C_Value_VApp (dtb__672, dtb__673) -> (if (((v_hasUnsolvedMetaValueFuel (fuel - 1)) sols) dtb__672) then true else (((v_hasUnsolvedMetaValueFuel (fuel - 1)) sols) dtb__673))
  | C_Value_VCase (dtb__674, dtb__675) -> (((v_hasUnsolvedMetaValueFuel (fuel - 1)) sols) dtb__674)
  | C_Value_VProj (dtb__676, dtb__677, dtb__678, dtb__679, dtb__680) -> (((v_hasUnsolvedMetaValueFuel (fuel - 1)) sols) dtb__676)
  | C_Value_VIf (dtb__681, dtb__682, dtb__683) -> (if (if (((v_hasUnsolvedMetaValueFuel (fuel - 1)) sols) dtb__681) then true else (((v_hasUnsolvedMetaValueFuel (fuel - 1)) sols) dtb__682)) then true else (((v_hasUnsolvedMetaValueFuel (fuel - 1)) sols) dtb__683))
  | _ -> false
)))
# 972 "Vuna/Compiler/Core/Term.vuna"
and v_hasUnsolvedMetaListFuel = (fun (fuel : int) (sols : t_Sols) (vs : t_Value B_dData_dList.t_List) -> (if (fuel <= 0) then true else (match vs with
  | B_dData_dList.C_List_Nil -> false
  | B_dData_dList.C_List__x58__x58_ (dtb__684, dtb__685) -> (if (((v_hasUnsolvedMetaValueFuel (fuel - 1)) sols) dtb__684) then true else (((v_hasUnsolvedMetaListFuel (fuel - 1)) sols) dtb__685))
  | _ -> failwith "DT: impossible branch"
)))
# 984 "Vuna/Compiler/Core/Term.vuna"
and v_hasUnsolvedMetaCloFuel = (fun (fuel : int) (sols : t_Sols) (clo : t_Closure) -> (if (fuel <= 0) then true else (match clo with
  | { f_Closure_closureEnv = dtb__686; f_Closure_closureBody = dtb__687 } -> (((v_hasUnsolvedMetaListFuel (fuel - 1)) sols) dtb__686)
  | _ -> failwith "DT: impossible branch"
)))

# 943 "Vuna/Compiler/Core/Term.vuna"
let v_hasUnsolvedMetaValue = (fun (sols : t_Sols) (v : t_Value) -> (((v_hasUnsolvedMetaValueFuel v_metaScanBound) sols) v))

# 969 "Vuna/Compiler/Core/Term.vuna"
let v_hasUnsolvedMetaList = (fun (sols : t_Sols) (vs : t_Value B_dData_dList.t_List) -> (((v_hasUnsolvedMetaListFuel v_metaScanBound) sols) vs))

# 981 "Vuna/Compiler/Core/Term.vuna"
let v_hasUnsolvedMetaClo = (fun (sols : t_Sols) (clo : t_Closure) -> (((v_hasUnsolvedMetaCloFuel v_metaScanBound) sols) clo))

# 995 "Vuna/Compiler/Core/Term.vuna"
let v_isTypeValue = (fun (mc0 : t_Value) -> (match mc0 with
  | C_Value_VType (dtb__688) -> true
  | _ -> false
))

# 999 "Vuna/Compiler/Core/Term.vuna"
let v_typeLevelOf = (fun (mc0 : t_Value) -> (match mc0 with
  | C_Value_VType (dtb__689) -> (B_dData_dMaybe.C_Maybe_Just (dtb__689))
  | _ -> B_dData_dMaybe.C_Maybe_Nothing
))

# 1007 "Vuna/Compiler/Core/Term.vuna"
let rec v_levelEscapes = (fun (mc0 : int) (mc1 : int) (mc2 : t_Value) -> (match mc2 with
  | C_Value_VBool (dtb__690) -> false
  | C_Value_VFloat (dtb__691) -> false
  | C_Value_VStr (dtb__692) -> false
  | C_Value_VInt (dtb__693) -> false
  | C_Value_VType (dtb__694) -> false
  | C_Value_VIf (dtb__695, dtb__696, dtb__697) -> (if (if (((v_levelEscapes mc0) mc1) dtb__695) then true else (((v_levelEscapes mc0) mc1) dtb__696)) then true else (((v_levelEscapes mc0) mc1) dtb__697))
  | C_Value_VProj (dtb__698, dtb__699, dtb__700, dtb__701, dtb__702) -> (((v_levelEscapes mc0) mc1) dtb__698)
  | C_Value_VCase (dtb__703, dtb__704) -> (((v_levelEscapes mc0) mc1) dtb__703)
  | C_Value_VApp (dtb__705, dtb__706) -> (if (((v_levelEscapes mc0) mc1) dtb__705) then true else (((v_levelEscapes mc0) mc1) dtb__706))
  | C_Value_VCon (dtb__707, dtb__708) -> ((v_levelEscapesList mc0) dtb__708)
  | C_Value_VMeta (dtb__709, dtb__710) -> ((v_levelEscapesList mc0) dtb__710)
  | C_Value_VLam (dtb__711, dtb__712, dtb__713) -> ((v_levelEscapesClo mc0) dtb__713)
  | C_Value_VPi (dtb__714, dtb__715, dtb__716, dtb__717, dtb__718) -> (if (((v_levelEscapes mc0) mc1) dtb__717) then true else ((v_levelEscapesClo mc0) dtb__718))
  | C_Value_VNeutral (dtb__719) -> (match dtb__719 with
  | C_Neutral_NVar (dtb__720, dtb__721, dtb__722) -> (if (dtb__721 >= mc0) then true else ((v_levelEscapesList mc0) dtb__722))
  | C_Neutral_NGlobal (dtb__723, dtb__724) -> ((v_levelEscapesList mc0) dtb__724)
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
))
# 1028 "Vuna/Compiler/Core/Term.vuna"
and v_levelEscapesList = (fun (mc0 : int) (mc1 : t_Value B_dData_dList.t_List) -> (match mc1 with
  | B_dData_dList.C_List__x58__x58_ (dtb__725, dtb__726) -> (if (((v_levelEscapes mc0) 0) dtb__725) then true else ((v_levelEscapesList mc0) dtb__726))
  | B_dData_dList.C_List_Nil -> false
  | _ -> failwith "DT: impossible branch"
))
# 1032 "Vuna/Compiler/Core/Term.vuna"
and v_levelEscapesClo = (fun (mc0 : int) (mc1 : t_Closure) -> (match mc1 with
  | { f_Closure_closureEnv = dtb__727; f_Closure_closureBody = dtb__728 } -> ((v_levelEscapesList mc0) dtb__727)
  | _ -> failwith "DT: impossible branch"
))

# 1112 "Vuna/Compiler/Core/Term.vuna"
let rec v_showBinders = (fun (mc0 : (string, t_Rig) B_dData_dPair.t_Pair B_dData_dList.t_List) -> (match mc0 with
  | B_dData_dList.C_List__x58__x58_ (dtb__729, dtb__730) -> (match dtb__729 with
  | { B_dData_dPair.f_Pair_first = dtb__731; B_dData_dPair.f_Pair_second = dtb__732 } -> (String.concat "" [" "; dtb__731; (v_showBinders dtb__730)])
  | _ -> failwith "DT: impossible branch"
)
  | B_dData_dList.C_List_Nil -> ""
  | _ -> failwith "DT: impossible branch"
))

# 1119 "Vuna/Compiler/Core/Term.vuna"
let rec v_showCoreChars = (fun (mc0 : int B_dData_dList.t_List) -> (match mc0 with
  | B_dData_dList.C_List__x58__x58_ (dtb__733, dtb__734) -> (if (dtb__733 = 34) then ("\\\"" ^ (v_showCoreChars dtb__734)) else (if (dtb__733 = 92) then ("\\\\" ^ (v_showCoreChars dtb__734)) else (if (dtb__733 = 10) then ("\\n" ^ (v_showCoreChars dtb__734)) else (if (dtb__733 = 9) then ("\\t" ^ (v_showCoreChars dtb__734)) else (if (dtb__733 = 13) then ("\\r" ^ (v_showCoreChars dtb__734)) else ((B_dData_dList.dtp_pack (B_dData_dList.C_List__x58__x58_ (dtb__733, B_dData_dList.C_List_Nil))) ^ (v_showCoreChars dtb__734)))))))
  | B_dData_dList.C_List_Nil -> ""
  | _ -> failwith "DT: impossible branch"
))

# 1116 "Vuna/Compiler/Core/Term.vuna"
let v_showCoreString = (fun (s : string) -> (String.concat "" ["\""; (v_showCoreChars (B_dData_dList.dtp_unpack s)); "\""]))

# 1035 "Vuna/Compiler/Core/Term.vuna"
let rec v_showTerm = (fun (mc0 : t_Term) -> (match mc0 with
  | C_Term_TIf (dtb__735, dtb__736, dtb__737) -> (String.concat "" ["if "; (v_showTerm dtb__735); " then "; (v_showTerm dtb__736); " else "; (v_showTerm dtb__737)])
  | C_Term_TBool (dtb__738) -> (if dtb__738 then "True" else "False")
  | C_Term_TFloat (dtb__739) -> dtb__739
  | C_Term_TStr (dtb__740) -> (v_showCoreString dtb__740)
  | C_Term_TInt (dtb__741) -> (bi_strFromInt dtb__741)
  | C_Term_TCase (dtb__742, dtb__743) -> (String.concat "" ["case "; (v_showTerm dtb__742); " of "; (v_showCoreAlts dtb__743)])
  | C_Term_TRecUpd (dtb__744, dtb__745, dtb__746, dtb__747, dtb__748) -> (String.concat "" [(v_showTerm dtb__744); " with "; dtb__745; " "; (v_showTerm dtb__748)])
  | C_Term_TProj (dtb__749, dtb__750, dtb__751, dtb__752, dtb__753) -> (String.concat "" [(v_showTerm dtb__749); "."; dtb__750; "#"; (bi_strFromInt dtb__753)])
  | C_Term_TRecord (dtb__754, dtb__755) -> ((v_recordAppShow dtb__754) dtb__755)
  | C_Term_TMk (dtb__756, dtb__757) -> (String.concat "" ["("; dtb__756; (v_showArgTerms dtb__757); ")"])
  | C_Term_TCon (dtb__758, dtb__759) -> (String.concat "" ["("; dtb__758; (v_showArgTerms dtb__759); ")"])
  | C_Term_TApp (dtb__760, dtb__761, dtb__762) -> (String.concat "" ["("; (v_showTerm dtb__760); " "; (v_showTerm dtb__761); ")"])
  | C_Term_TLam (dtb__763, dtb__764, dtb__765, dtb__766, dtb__767) -> (String.concat "" ["\\"; dtb__763; " => "; (v_showTerm dtb__767)])
  | C_Term_TPi (dtb__768, dtb__769, dtb__770, dtb__771, dtb__772) -> (if (dtb__768 = "_") then (String.concat "" [(v_showTerm dtb__771); " -> "; (v_showTerm dtb__772)]) else (if dtb__769 then (String.concat "" ["{"; dtb__768; " : "; (v_showTerm dtb__771); "} -> "; (v_showTerm dtb__772)]) else (String.concat "" ["("; dtb__768; " : "; (v_showTerm dtb__771); ") -> "; (v_showTerm dtb__772)])))
  | C_Term_TType (dtb__773) -> (if ((v_levelToInt dtb__773) = 0) then "Type" else ("Type " ^ (bi_strFromInt (v_levelToInt dtb__773))))
  | C_Term_TGlobal (dtb__774) -> dtb__774
  | C_Term_TMeta (dtb__775) -> ("?" ^ (bi_strFromInt dtb__775))
  | C_Term_TVar (dtb__776, dtb__777, dtb__778) -> dtb__776
  | _ -> failwith "DT: impossible branch"
))
# 1092 "Vuna/Compiler/Core/Term.vuna"
and v_showArgTerms = (fun (mc0 : (t_Term, t_Rig) B_dData_dPair.t_Pair B_dData_dList.t_List) -> (match mc0 with
  | B_dData_dList.C_List__x58__x58_ (dtb__779, dtb__780) -> (match dtb__779 with
  | { B_dData_dPair.f_Pair_first = dtb__781; B_dData_dPair.f_Pair_second = dtb__782 } -> (String.concat "" [" "; (v_showTerm dtb__781); (v_showArgTerms dtb__780)])
  | _ -> failwith "DT: impossible branch"
)
  | B_dData_dList.C_List_Nil -> ""
  | _ -> failwith "DT: impossible branch"
))
# 1097 "Vuna/Compiler/Core/Term.vuna"
and v_recordAppShow = (fun (mc0 : string) (mc1 : (t_Term, t_Rig) B_dData_dPair.t_Pair B_dData_dList.t_List) -> (match mc1 with
  | B_dData_dList.C_List__x58__x58_ (dtb__783, dtb__784) -> (match dtb__783 with
  | { B_dData_dPair.f_Pair_first = dtb__785; B_dData_dPair.f_Pair_second = dtb__786 } -> ((v_recordAppShow (String.concat "" ["("; mc0; " "; (v_showTerm dtb__785); ")"])) dtb__784)
  | _ -> failwith "DT: impossible branch"
)
  | B_dData_dList.C_List_Nil -> mc0
  | _ -> failwith "DT: impossible branch"
))
# 1107 "Vuna/Compiler/Core/Term.vuna"
and v_showCoreAlts = (fun (mc0 : t_CaseAlt B_dData_dList.t_List) -> (match mc0 with
  | B_dData_dList.C_List__x58__x58_ (dtb__787, dtb__788) -> (String.concat "" [(v_caseAltName dtb__787); (v_showBinders (v_binderPairs (v_caseAltBinders dtb__787))); " => "; (v_showTerm (v_caseAltBody dtb__787)); " | "; (v_showCoreAlts dtb__788)])
  | B_dData_dList.C_List_Nil -> ""
  | _ -> failwith "DT: impossible branch"
))

# 1067 "Vuna/Compiler/Core/Term.vuna"
let rec v_showPiSig = (fun (name : string) (implicit : bool) (dom : t_Term) (cod : t_Term) -> (if (name = "_") then (String.concat "" [(v_showSigParenIfPi dom); " -> "; (v_showTypeSig cod)]) else (if implicit then (String.concat "" ["{"; name; " : "; (v_showTypeSig dom); "} -> "; (v_showTypeSig cod)]) else (String.concat "" ["("; name; " : "; (v_showTypeSig dom); ") -> "; (v_showTypeSig cod)]))))
# 1076 "Vuna/Compiler/Core/Term.vuna"
and v_showTypeSig = (fun (mc0 : t_Term) -> (match mc0 with
  | C_Term_TRecord (dtb__789, dtb__790) -> ((v_showSigAppText dtb__789) dtb__790)
  | C_Term_TCon (dtb__791, dtb__792) -> (match dtb__792 with
  | B_dData_dList.C_List_Nil -> dtb__791
  | _ -> (String.concat "" ["("; dtb__791; (v_showSigArgs dtb__792); ")"])
)
  | C_Term_TApp (dtb__793, dtb__794, dtb__795) -> (String.concat "" ["("; (v_showSigParenIfPi dtb__793); " "; (v_showSigParenIfPi dtb__794); ")"])
  | C_Term_TPi (dtb__796, dtb__797, dtb__798, dtb__799, dtb__800) -> ((((v_showPiSig dtb__796) dtb__797) dtb__799) dtb__800)
  | _ -> (v_showTerm mc0)
))
# 1084 "Vuna/Compiler/Core/Term.vuna"
and v_showSigParenIfPi = (fun (mc0 : t_Term) -> (match mc0 with
  | C_Term_TPi (dtb__801, dtb__802, dtb__803, dtb__804, dtb__805) -> (String.concat "" ["("; ((((v_showPiSig dtb__801) dtb__802) dtb__804) dtb__805); ")"])
  | _ -> (v_showTypeSig mc0)
))
# 1088 "Vuna/Compiler/Core/Term.vuna"
and v_showSigArgs = (fun (mc0 : (t_Term, t_Rig) B_dData_dPair.t_Pair B_dData_dList.t_List) -> (match mc0 with
  | B_dData_dList.C_List__x58__x58_ (dtb__806, dtb__807) -> (match dtb__806 with
  | { B_dData_dPair.f_Pair_first = dtb__808; B_dData_dPair.f_Pair_second = dtb__809 } -> (String.concat "" [" "; (v_showSigParenIfPi dtb__808); (v_showSigArgs dtb__807)])
  | _ -> failwith "DT: impossible branch"
)
  | B_dData_dList.C_List_Nil -> ""
  | _ -> failwith "DT: impossible branch"
))
# 1102 "Vuna/Compiler/Core/Term.vuna"
and v_showSigAppText = (fun (mc0 : string) (mc1 : (t_Term, t_Rig) B_dData_dPair.t_Pair B_dData_dList.t_List) -> (match mc1 with
  | B_dData_dList.C_List__x58__x58_ (dtb__810, dtb__811) -> (match dtb__810 with
  | { B_dData_dPair.f_Pair_first = dtb__812; B_dData_dPair.f_Pair_second = dtb__813 } -> ((v_showSigAppText (String.concat "" ["("; mc0; " "; (v_showSigParenIfPi dtb__812); ")"])) dtb__811)
  | _ -> failwith "DT: impossible branch"
)
  | B_dData_dList.C_List_Nil -> mc0
  | _ -> failwith "DT: impossible branch"
))
