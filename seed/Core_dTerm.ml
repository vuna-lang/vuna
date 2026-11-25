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

# 110 "Vuna/Compiler/Core/Term.vuna"
let v_levelOfInt = (fun (n : int) -> n)

# 113 "Vuna/Compiler/Core/Term.vuna"
let v_levelEq = (fun (mc0 : t_Level) (mc1 : t_Level) -> (let dtb__3 = mc0 in (let dtb__4 = mc1 in (dtb__3 = dtb__4))))

# 116 "Vuna/Compiler/Core/Term.vuna"
let v_levelLt = (fun (mc0 : t_Level) (mc1 : t_Level) -> (let dtb__5 = mc0 in (let dtb__6 = mc1 in (dtb__5 < dtb__6))))

# 163 "Vuna/Compiler/Core/Term.vuna"
let v_binderNameOf = (fun (mc0 : t_Binder) -> (match mc0 with
  | { f_Binder_binderName = dtb__7; f_Binder_binderRig = dtb__8; f_Binder_binderSpan = dtb__9 } -> dtb__7
  | _ -> failwith "DT: impossible branch"
))

# 166 "Vuna/Compiler/Core/Term.vuna"
let v_binderRigOf = (fun (mc0 : t_Binder) -> (match mc0 with
  | { f_Binder_binderName = dtb__10; f_Binder_binderRig = dtb__11; f_Binder_binderSpan = dtb__12 } -> dtb__11
  | _ -> failwith "DT: impossible branch"
))

# 169 "Vuna/Compiler/Core/Term.vuna"
let v_binderSpanOf = (fun (mc0 : t_Binder) -> (match mc0 with
  | { f_Binder_binderName = dtb__13; f_Binder_binderRig = dtb__14; f_Binder_binderSpan = dtb__15 } -> dtb__15
  | _ -> failwith "DT: impossible branch"
))

# 173 "Vuna/Compiler/Core/Term.vuna"
let v_binderPair = (fun (b : t_Binder) -> { B_dData_dPair.f_Pair_first = (v_binderNameOf b); B_dData_dPair.f_Pair_second = (v_binderRigOf b) })

# 176 "Vuna/Compiler/Core/Term.vuna"
let v_binderPairs = (fun (bs : t_Binder B_dData_dList.t_List) -> ((B_dData_dList.v_map v_binderPair) bs))

# 180 "Vuna/Compiler/Core/Term.vuna"
let v_binderOfPair = (fun (mc0 : (string, t_Rig) B_dData_dPair.t_Pair) -> (match mc0 with
  | { B_dData_dPair.f_Pair_first = dtb__16; B_dData_dPair.f_Pair_second = dtb__17 } -> { f_Binder_binderName = dtb__16; f_Binder_binderRig = dtb__17; f_Binder_binderSpan = Base_dSource.v_spanEmpty }
  | _ -> failwith "DT: impossible branch"
))

# 183 "Vuna/Compiler/Core/Term.vuna"
let v_bindersOfPairs = (fun (ps : (string, t_Rig) B_dData_dPair.t_Pair B_dData_dList.t_List) -> ((B_dData_dList.v_map v_binderOfPair) ps))

# 227 "Vuna/Compiler/Core/Term.vuna"
let v_defaultFuel = 512

# 241 "Vuna/Compiler/Core/Term.vuna"
let v_natChainMax = 4611686018427387903

# 280 "Vuna/Compiler/Core/Term.vuna"
let v_natChainNext = (fun (n : int) -> (if (n >= v_natChainMax) then v_natChainMax else (n + 1)))

# 287 "Vuna/Compiler/Core/Term.vuna"
let rec v_flattenTermAppGo = (fun (mc0 : t_Term) (mc1 : (t_Term, t_Rig) B_dData_dPair.t_Pair B_dData_dList.t_List) -> (match mc0 with
  | C_Term_TRecord (dtb__18, dtb__19) -> { B_dData_dPair.f_Pair_first = (C_Term_TGlobal (dtb__18)); B_dData_dPair.f_Pair_second = ((B_dData_dList.v_append dtb__19) mc1) }
  | C_Term_TApp (dtb__20, dtb__21, dtb__22) -> ((v_flattenTermAppGo dtb__20) (B_dData_dList.C_List__x58__x58_ ({ B_dData_dPair.f_Pair_first = dtb__21; B_dData_dPair.f_Pair_second = dtb__22 }, mc1)))
  | _ -> { B_dData_dPair.f_Pair_first = mc0; B_dData_dPair.f_Pair_second = mc1 }
))

# 284 "Vuna/Compiler/Core/Term.vuna"
let v_flattenTermApp = (fun (t : t_Term) -> ((v_flattenTermAppGo t) B_dData_dList.C_List_Nil))

# 251 "Vuna/Compiler/Core/Term.vuna"
let rec v_natChainGo = (fun (fuel : int) (t : t_Term) -> (if (fuel <= 0) then B_dData_dMaybe.C_Maybe_Nothing else (match (v_flattenTermApp t) with
  | { B_dData_dPair.f_Pair_first = dtb__23; B_dData_dPair.f_Pair_second = dtb__24 } -> (match dtb__23 with
  | C_Term_TCon (dtb__25, dtb__26) -> (((v_natChainArgs (fuel - 1)) dtb__25) ((B_dData_dList.v_append dtb__26) dtb__24))
  | C_Term_TGlobal (dtb__27) -> (((v_natChainArgs (fuel - 1)) dtb__27) dtb__24)
  | _ -> B_dData_dMaybe.C_Maybe_Nothing
)
  | _ -> failwith "DT: impossible branch"
)))
# 263 "Vuna/Compiler/Core/Term.vuna"
and v_natChainArgs = (fun (fuel : int) (c : string) (args : (t_Term, t_Rig) B_dData_dPair.t_Pair B_dData_dList.t_List) -> (if (c = Base_dIntrinsics.v_natZeroCtor) then (match args with
  | B_dData_dList.C_List_Nil -> (B_dData_dMaybe.C_Maybe_Just (0))
  | _ -> B_dData_dMaybe.C_Maybe_Nothing
) else (if (c = Base_dIntrinsics.v_natSuccCtor) then (let nd_uscrut3 = args in (match nd_uscrut3 with
  | B_dData_dList.C_List__x58__x58_ (dtb__28, dtb__29) -> (match dtb__28 with
  | { B_dData_dPair.f_Pair_first = dtb__30; B_dData_dPair.f_Pair_second = dtb__31 } -> (match dtb__29 with
  | B_dData_dList.C_List_Nil -> (match ((v_natChainGo fuel) dtb__30) with
  | B_dData_dMaybe.C_Maybe_Just (dtb__32) -> (B_dData_dMaybe.C_Maybe_Just ((v_natChainNext dtb__32)))
  | B_dData_dMaybe.C_Maybe_Nothing -> B_dData_dMaybe.C_Maybe_Nothing
  | _ -> failwith "DT: impossible branch"
)
  | _ -> B_dData_dMaybe.C_Maybe_Nothing
)
  | _ -> failwith "DT: impossible branch"
)
  | _ -> B_dData_dMaybe.C_Maybe_Nothing
)) else B_dData_dMaybe.C_Maybe_Nothing)))

# 248 "Vuna/Compiler/Core/Term.vuna"
let v_natChainValue = (fun (t : t_Term) -> ((v_natChainGo 1000000) t))

# 304 "Vuna/Compiler/Core/Term.vuna"
let v_termSizeCap = 1000000

# 334 "Vuna/Compiler/Core/Term.vuna"
let rec v_termSizeArgTerms = (fun (mc0 : (t_Term, t_Rig) B_dData_dPair.t_Pair B_dData_dList.t_List) -> (match mc0 with
  | B_dData_dList.C_List__x58__x58_ (dtb__33, dtb__34) -> (match dtb__33 with
  | { B_dData_dPair.f_Pair_first = dtb__35; B_dData_dPair.f_Pair_second = dtb__36 } -> (B_dData_dList.C_List__x58__x58_ (dtb__35, (v_termSizeArgTerms dtb__34)))
  | _ -> failwith "DT: impossible branch"
)
  | B_dData_dList.C_List_Nil -> B_dData_dList.C_List_Nil
  | _ -> failwith "DT: impossible branch"
))

# 347 "Vuna/Compiler/Core/Term.vuna"
let v_termSizeMaybeTerms = (fun (mc0 : t_Term B_dData_dMaybe.t_Maybe) -> (match mc0 with
  | B_dData_dMaybe.C_Maybe_Just (dtb__37) -> (B_dData_dList.C_List__x58__x58_ (dtb__37, B_dData_dList.C_List_Nil))
  | B_dData_dMaybe.C_Maybe_Nothing -> B_dData_dList.C_List_Nil
  | _ -> failwith "DT: impossible branch"
))

# 342 "Vuna/Compiler/Core/Term.vuna"
let v_termSizeSlotTerms = (fun (mc0 : (t_LamMark, (t_Term B_dData_dMaybe.t_Maybe, t_Term B_dData_dMaybe.t_Maybe) B_dData_dPair.t_Pair) B_dData_dPair.t_Pair B_dData_dMaybe.t_Maybe) -> (match mc0 with
  | B_dData_dMaybe.C_Maybe_Just (dtb__38) -> ((B_dData_dList.v_append (v_termSizeMaybeTerms (B_dData_dPair.v_firstOf (B_dData_dPair.v_secondOf dtb__38)))) (v_termSizeMaybeTerms (B_dData_dPair.v_secondOf (B_dData_dPair.v_secondOf dtb__38))))
  | B_dData_dMaybe.C_Maybe_Nothing -> B_dData_dList.C_List_Nil
  | _ -> failwith "DT: impossible branch"
))

# 355 "Vuna/Compiler/Core/Term.vuna"
let v_metaLookup = (fun (i : int) (t : (int, t_Value) B_dContainer_dHashMap.t_HashMap) -> ((((B_dContainer_dHashMap.v_lookup B_dData_dInt.v_Hashable_ue4b0f10b020a5e82_uInt) B_dData_dInt.v_Eq_u018fc178ff3df1b4_uInt) i) t))

# 359 "Vuna/Compiler/Core/Term.vuna"
let rec v_metaLookupList = (fun (mc0 : int) (mc1 : (int, t_Value) B_dData_dPair.t_Pair B_dData_dList.t_List) -> (match mc1 with
  | B_dData_dList.C_List__x58__x58_ (dtb__39, dtb__40) -> (match dtb__39 with
  | { B_dData_dPair.f_Pair_first = dtb__41; B_dData_dPair.f_Pair_second = dtb__42 } -> (if (mc0 = dtb__41) then (B_dData_dMaybe.C_Maybe_Just (dtb__42)) else ((v_metaLookupList mc0) dtb__40))
  | _ -> failwith "DT: impossible branch"
)
  | B_dData_dList.C_List_Nil -> B_dData_dMaybe.C_Maybe_Nothing
  | _ -> failwith "DT: impossible branch"
))

# 378 "Vuna/Compiler/Core/Term.vuna"
let v_solsEmpty = { f_Sols_solsTbl = (((B_dContainer_dHashMap.v_fromList B_dData_dInt.v_Hashable_ue4b0f10b020a5e82_uInt) B_dData_dInt.v_Eq_u018fc178ff3df1b4_uInt) B_dData_dList.C_List_Nil); f_Sols_solsList = B_dData_dList.C_List_Nil; f_Sols_solsDepth = (((B_dContainer_dHashMap.v_fromList B_dData_dInt.v_Hashable_ue4b0f10b020a5e82_uInt) B_dData_dInt.v_Eq_u018fc178ff3df1b4_uInt) B_dData_dList.C_List_Nil) }

# 381 "Vuna/Compiler/Core/Term.vuna"
let v_solsFromList = (fun (xs : (int, t_Value) B_dData_dPair.t_Pair B_dData_dList.t_List) -> { f_Sols_solsTbl = ((((B_dContainer_dHashMap.v_insertAll B_dData_dInt.v_Hashable_ue4b0f10b020a5e82_uInt) B_dData_dInt.v_Eq_u018fc178ff3df1b4_uInt) xs) (((B_dContainer_dHashMap.v_fromList B_dData_dInt.v_Hashable_ue4b0f10b020a5e82_uInt) B_dData_dInt.v_Eq_u018fc178ff3df1b4_uInt) B_dData_dList.C_List_Nil)); f_Sols_solsList = xs; f_Sols_solsDepth = (((B_dContainer_dHashMap.v_fromList B_dData_dInt.v_Hashable_ue4b0f10b020a5e82_uInt) B_dData_dInt.v_Eq_u018fc178ff3df1b4_uInt) B_dData_dList.C_List_Nil) })

# 385 "Vuna/Compiler/Core/Term.vuna"
let v_solsOf = (fun (t : (int, t_Value) B_dContainer_dHashMap.t_HashMap) (xs : (int, t_Value) B_dData_dPair.t_Pair B_dData_dList.t_List) (d : (int, int) B_dContainer_dHashMap.t_HashMap) -> { f_Sols_solsTbl = t; f_Sols_solsList = xs; f_Sols_solsDepth = d })

# 389 "Vuna/Compiler/Core/Term.vuna"
let v_solsDepthAt = (fun (mc0 : int) (mc1 : t_Sols) -> (match mc1 with
  | { f_Sols_solsTbl = dtb__43; f_Sols_solsList = dtb__44; f_Sols_solsDepth = dtb__45 } -> ((((B_dContainer_dHashMap.v_lookup B_dData_dInt.v_Hashable_ue4b0f10b020a5e82_uInt) B_dData_dInt.v_Eq_u018fc178ff3df1b4_uInt) mc0) dtb__45)
  | _ -> failwith "DT: impossible branch"
))

# 394 "Vuna/Compiler/Core/Term.vuna"
let v_solsLookup = (fun (mc0 : int) (mc1 : t_Sols) -> (match mc1 with
  | { f_Sols_solsTbl = dtb__46; f_Sols_solsList = dtb__47; f_Sols_solsDepth = dtb__48 } -> ((((B_dContainer_dHashMap.v_lookup B_dData_dInt.v_Hashable_ue4b0f10b020a5e82_uInt) B_dData_dInt.v_Eq_u018fc178ff3df1b4_uInt) mc0) dtb__46)
  | _ -> failwith "DT: impossible branch"
))

# 397 "Vuna/Compiler/Core/Term.vuna"
let v_solsCons = (fun (mc0 : int) (mc1 : t_Value) (mc2 : t_Sols) -> (match mc2 with
  | { f_Sols_solsTbl = dtb__49; f_Sols_solsList = dtb__50; f_Sols_solsDepth = dtb__51 } -> { f_Sols_solsTbl = (((((B_dContainer_dHashMap.v_insert B_dData_dInt.v_Hashable_ue4b0f10b020a5e82_uInt) B_dData_dInt.v_Eq_u018fc178ff3df1b4_uInt) mc0) mc1) dtb__49); f_Sols_solsList = (B_dData_dList.C_List__x58__x58_ ({ B_dData_dPair.f_Pair_first = mc0; B_dData_dPair.f_Pair_second = mc1 }, dtb__50)); f_Sols_solsDepth = dtb__51 }
  | _ -> failwith "DT: impossible branch"
))

# 508 "Vuna/Compiler/Core/Term.vuna"
let v_defLookup = (fun (name : string) (tbl : (string, t_Term) B_dContainer_dHashMap.t_HashMap) -> ((((B_dContainer_dHashMap.v_lookup B_dData_dString.v_Hashable_ue4b0f10b020a5e82_uString) B_dData_dString.v_Eq_u018fc178ff3df1b4_uString) name) tbl))

# 594 "Vuna/Compiler/Core/Term.vuna"
let v_mapTermMaybe = (fun (mc0 : (t_Term) -> t_Term) (mc1 : t_Term B_dData_dMaybe.t_Maybe) -> (match mc1 with
  | B_dData_dMaybe.C_Maybe_Just (dtb__52) -> (B_dData_dMaybe.C_Maybe_Just ((mc0 dtb__52)))
  | B_dData_dMaybe.C_Maybe_Nothing -> B_dData_dMaybe.C_Maybe_Nothing
  | _ -> failwith "DT: impossible branch"
))

# 608 "Vuna/Compiler/Core/Term.vuna"
let v_lamMarkOf = (fun (mc0 : (t_LamMark, (t_Term B_dData_dMaybe.t_Maybe, t_Term B_dData_dMaybe.t_Maybe) B_dData_dPair.t_Pair) B_dData_dPair.t_Pair B_dData_dMaybe.t_Maybe) -> (match mc0 with
  | B_dData_dMaybe.C_Maybe_Just (dtb__53) -> (B_dData_dPair.v_firstOf dtb__53)
  | B_dData_dMaybe.C_Maybe_Nothing -> C_LamMark_LamPlain
  | _ -> failwith "DT: impossible branch"
))

# 612 "Vuna/Compiler/Core/Term.vuna"
let v_lamSlotTys = (fun (mc0 : (t_LamMark, (t_Term B_dData_dMaybe.t_Maybe, t_Term B_dData_dMaybe.t_Maybe) B_dData_dPair.t_Pair) B_dData_dPair.t_Pair B_dData_dMaybe.t_Maybe) -> (match mc0 with
  | B_dData_dMaybe.C_Maybe_Just (dtb__54) -> (B_dData_dMaybe.C_Maybe_Just ((B_dData_dPair.v_secondOf dtb__54)))
  | B_dData_dMaybe.C_Maybe_Nothing -> B_dData_dMaybe.C_Maybe_Nothing
  | _ -> failwith "DT: impossible branch"
))

# 616 "Vuna/Compiler/Core/Term.vuna"
let v_lamBinderTyOf = (fun (slot : (t_LamMark, (t_Term B_dData_dMaybe.t_Maybe, t_Term B_dData_dMaybe.t_Maybe) B_dData_dPair.t_Pair) B_dData_dPair.t_Pair B_dData_dMaybe.t_Maybe) -> (match (v_lamSlotTys slot) with
  | B_dData_dMaybe.C_Maybe_Nothing -> B_dData_dMaybe.C_Maybe_Nothing
  | B_dData_dMaybe.C_Maybe_Just (dtb__55) -> (B_dData_dPair.v_firstOf dtb__55)
  | _ -> failwith "DT: impossible branch"
))

# 622 "Vuna/Compiler/Core/Term.vuna"
let v_lamResultTyOf = (fun (slot : (t_LamMark, (t_Term B_dData_dMaybe.t_Maybe, t_Term B_dData_dMaybe.t_Maybe) B_dData_dPair.t_Pair) B_dData_dPair.t_Pair B_dData_dMaybe.t_Maybe) -> (match (v_lamSlotTys slot) with
  | B_dData_dMaybe.C_Maybe_Nothing -> B_dData_dMaybe.C_Maybe_Nothing
  | B_dData_dMaybe.C_Maybe_Just (dtb__56) -> (B_dData_dPair.v_secondOf dtb__56)
  | _ -> failwith "DT: impossible branch"
))

# 628 "Vuna/Compiler/Core/Term.vuna"
let v_lamTyOf = (fun (mc0 : t_Term B_dData_dMaybe.t_Maybe) (mc1 : t_Term B_dData_dMaybe.t_Maybe) -> (match mc0 with
  | B_dData_dMaybe.C_Maybe_Nothing -> (match mc1 with
  | B_dData_dMaybe.C_Maybe_Nothing -> B_dData_dMaybe.C_Maybe_Nothing
  | _ -> (B_dData_dMaybe.C_Maybe_Just ({ B_dData_dPair.f_Pair_first = C_LamMark_LamPlain; B_dData_dPair.f_Pair_second = { B_dData_dPair.f_Pair_first = mc0; B_dData_dPair.f_Pair_second = mc1 } }))
)
  | _ -> (B_dData_dMaybe.C_Maybe_Just ({ B_dData_dPair.f_Pair_first = C_LamMark_LamPlain; B_dData_dPair.f_Pair_second = { B_dData_dPair.f_Pair_first = mc0; B_dData_dPair.f_Pair_second = mc1 } }))
))

# 632 "Vuna/Compiler/Core/Term.vuna"
let v_markLamLinear = (fun (slot : (t_LamMark, (t_Term B_dData_dMaybe.t_Maybe, t_Term B_dData_dMaybe.t_Maybe) B_dData_dPair.t_Pair) B_dData_dPair.t_Pair B_dData_dMaybe.t_Maybe) -> (let tys = (match (v_lamSlotTys slot) with
  | B_dData_dMaybe.C_Maybe_Nothing -> { B_dData_dPair.f_Pair_first = B_dData_dMaybe.C_Maybe_Nothing; B_dData_dPair.f_Pair_second = B_dData_dMaybe.C_Maybe_Nothing }
  | B_dData_dMaybe.C_Maybe_Just (dtb__57) -> dtb__57
  | _ -> failwith "DT: impossible branch"
) in (B_dData_dMaybe.C_Maybe_Just ({ B_dData_dPair.f_Pair_first = C_LamMark_LamLinearClosure; B_dData_dPair.f_Pair_second = tys }))))

# 641 "Vuna/Compiler/Core/Term.vuna"
let v_lamTyWithBinder = (fun (binderTy : t_Term B_dData_dMaybe.t_Maybe) -> ((v_lamTyOf binderTy) B_dData_dMaybe.C_Maybe_Nothing))

# 644 "Vuna/Compiler/Core/Term.vuna"
let v_lamTyWithResult = (fun (resultTy : t_Term B_dData_dMaybe.t_Maybe) -> ((v_lamTyOf B_dData_dMaybe.C_Maybe_Nothing) resultTy))

# 651 "Vuna/Compiler/Core/Term.vuna"
let rec v_shift = (fun (mc0 : int) (mc1 : int) (mc2 : t_Term) -> (match mc2 with
  | C_Term_TIf (dtb__58, dtb__59, dtb__60) -> (C_Term_TIf ((((v_shift mc0) mc1) dtb__58), (((v_shift mc0) mc1) dtb__59), (((v_shift mc0) mc1) dtb__60)))
  | C_Term_TBool (dtb__61) -> mc2
  | C_Term_TFloat (dtb__62) -> mc2
  | C_Term_TStr (dtb__63) -> mc2
  | C_Term_TInt (dtb__64) -> mc2
  | C_Term_TCase (dtb__65, dtb__66) -> (C_Term_TCase ((((v_shift mc0) mc1) dtb__65), (((v_shiftAlts mc0) mc1) dtb__66)))
  | C_Term_TRecUpd (dtb__67, dtb__68, dtb__69, dtb__70, dtb__71) -> (C_Term_TRecUpd ((((v_shift mc0) mc1) dtb__67), dtb__68, dtb__69, dtb__70, (((v_shift (mc0 + (B_dData_dList.v_length dtb__69))) mc1) dtb__71)))
  | C_Term_TProj (dtb__72, dtb__73, dtb__74, dtb__75, dtb__76) -> (C_Term_TProj ((((v_shift mc0) mc1) dtb__72), dtb__73, dtb__74, dtb__75, dtb__76))
  | C_Term_TRecord (dtb__77, dtb__78) -> (C_Term_TRecord (dtb__77, (((v_shiftArgs mc0) mc1) dtb__78)))
  | C_Term_TMk (dtb__79, dtb__80) -> (C_Term_TMk (dtb__79, (((v_shiftArgs mc0) mc1) dtb__80)))
  | C_Term_TCon (dtb__81, dtb__82) -> (C_Term_TCon (dtb__81, (((v_shiftArgs mc0) mc1) dtb__82)))
  | C_Term_TApp (dtb__83, dtb__84, dtb__85) -> (C_Term_TApp ((((v_shift mc0) mc1) dtb__83), (((v_shift mc0) mc1) dtb__84), dtb__85))
  | C_Term_TLam (dtb__86, dtb__87, dtb__88, dtb__89, dtb__90) -> (let slot2 = (let nd_uscrut8 = dtb__88 in (match nd_uscrut8 with
  | B_dData_dMaybe.C_Maybe_Just (dtb__91) -> (match dtb__91 with
  | { B_dData_dPair.f_Pair_first = dtb__92; B_dData_dPair.f_Pair_second = dtb__93 } -> (match dtb__93 with
  | { B_dData_dPair.f_Pair_first = dtb__94; B_dData_dPair.f_Pair_second = dtb__95 } -> (let bt2 = (match dtb__94 with
  | B_dData_dMaybe.C_Maybe_Nothing -> B_dData_dMaybe.C_Maybe_Nothing
  | B_dData_dMaybe.C_Maybe_Just (dtb__97) -> (B_dData_dMaybe.C_Maybe_Just ((((v_shift mc0) mc1) dtb__97)))
  | _ -> failwith "DT: impossible branch"
) in (let rt2 = (match dtb__95 with
  | B_dData_dMaybe.C_Maybe_Nothing -> B_dData_dMaybe.C_Maybe_Nothing
  | B_dData_dMaybe.C_Maybe_Just (dtb__96) -> (B_dData_dMaybe.C_Maybe_Just ((((v_shift (mc0 + 1)) mc1) dtb__96)))
  | _ -> failwith "DT: impossible branch"
) in (B_dData_dMaybe.C_Maybe_Just ({ B_dData_dPair.f_Pair_first = dtb__92; B_dData_dPair.f_Pair_second = { B_dData_dPair.f_Pair_first = bt2; B_dData_dPair.f_Pair_second = rt2 } }))))
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
)
  | B_dData_dMaybe.C_Maybe_Nothing -> B_dData_dMaybe.C_Maybe_Nothing
  | _ -> failwith "DT: impossible branch"
)) in (C_Term_TLam (dtb__86, dtb__87, slot2, dtb__89, (((v_shift (mc0 + 1)) mc1) dtb__90))))
  | C_Term_TPi (dtb__98, dtb__99, dtb__100, dtb__101, dtb__102) -> (C_Term_TPi (dtb__98, dtb__99, dtb__100, (((v_shift mc0) mc1) dtb__101), (((v_shift (mc0 + 1)) mc1) dtb__102)))
  | C_Term_TType (dtb__103) -> mc2
  | C_Term_TGlobal (dtb__104) -> mc2
  | C_Term_TMeta (dtb__105) -> mc2
  | C_Term_TVar (dtb__106, dtb__107, dtb__108) -> (if (dtb__107 >= mc0) then (C_Term_TVar (dtb__106, (dtb__107 + mc1), dtb__108)) else mc2)
  | _ -> failwith "DT: impossible branch"
))
# 691 "Vuna/Compiler/Core/Term.vuna"
and v_shiftArgs = (fun (mc0 : int) (mc1 : int) (mc2 : (t_Term, t_Rig) B_dData_dPair.t_Pair B_dData_dList.t_List) -> (match mc2 with
  | B_dData_dList.C_List__x58__x58_ (dtb__109, dtb__110) -> (match dtb__109 with
  | { B_dData_dPair.f_Pair_first = dtb__111; B_dData_dPair.f_Pair_second = dtb__112 } -> (B_dData_dList.C_List__x58__x58_ ({ B_dData_dPair.f_Pair_first = (((v_shift mc0) mc1) dtb__111); B_dData_dPair.f_Pair_second = dtb__112 }, (((v_shiftArgs mc0) mc1) dtb__110)))
  | _ -> failwith "DT: impossible branch"
)
  | B_dData_dList.C_List_Nil -> B_dData_dList.C_List_Nil
  | _ -> failwith "DT: impossible branch"
))
# 696 "Vuna/Compiler/Core/Term.vuna"
and v_shiftAlts = (fun (mc0 : int) (mc1 : int) (mc2 : t_CaseAlt B_dData_dList.t_List) -> (match mc2 with
  | B_dData_dList.C_List__x58__x58_ (dtb__113, dtb__114) -> (B_dData_dList.C_List__x58__x58_ ((((v_shiftAlt mc0) mc1) dtb__113), (((v_shiftAlts mc0) mc1) dtb__114)))
  | B_dData_dList.C_List_Nil -> B_dData_dList.C_List_Nil
  | _ -> failwith "DT: impossible branch"
))
# 700 "Vuna/Compiler/Core/Term.vuna"
and v_shiftAlt = (fun (mc0 : int) (mc1 : int) (mc2 : t_CaseAlt) -> (match mc2 with
  | { f_CaseAlt_caseAltName = dtb__115; f_CaseAlt_caseAltBinders = dtb__116; f_CaseAlt_caseAltBody = dtb__117 } -> { f_CaseAlt_caseAltName = dtb__115; f_CaseAlt_caseAltBinders = dtb__116; f_CaseAlt_caseAltBody = (((v_shift (mc0 + (B_dData_dList.v_length dtb__116))) mc1) dtb__117) }
  | _ -> failwith "DT: impossible branch"
))

# 758 "Vuna/Compiler/Core/Term.vuna"
let rec v_substMetaVarGo = (fun (mc0 : int) (mc1 : string) (mc2 : int) (mc3 : int) (mc4 : t_Term) -> (match mc4 with
  | C_Term_TIf (dtb__118, dtb__119, dtb__120) -> (C_Term_TIf ((((((v_substMetaVarGo mc0) mc1) mc2) mc3) dtb__118), (((((v_substMetaVarGo mc0) mc1) mc2) mc3) dtb__119), (((((v_substMetaVarGo mc0) mc1) mc2) mc3) dtb__120)))
  | C_Term_TCase (dtb__121, dtb__122) -> (C_Term_TCase ((((((v_substMetaVarGo mc0) mc1) mc2) mc3) dtb__121), ((B_dData_dList.v_map ((((v_substMetaVarAlt mc0) mc1) mc2) mc3)) dtb__122)))
  | C_Term_TProj (dtb__123, dtb__124, dtb__125, dtb__126, dtb__127) -> (C_Term_TProj ((((((v_substMetaVarGo mc0) mc1) mc2) mc3) dtb__123), dtb__124, dtb__125, dtb__126, dtb__127))
  | C_Term_TRecord (dtb__128, dtb__129) -> (C_Term_TRecord (dtb__128, ((B_dData_dList.v_map (fun (p : (t_Term, t_Rig) B_dData_dPair.t_Pair) -> { B_dData_dPair.f_Pair_first = (((((v_substMetaVarGo mc0) mc1) mc2) mc3) (B_dData_dPair.v_firstOf p)); B_dData_dPair.f_Pair_second = (B_dData_dPair.v_secondOf p) })) dtb__129)))
  | C_Term_TMk (dtb__130, dtb__131) -> (C_Term_TMk (dtb__130, ((B_dData_dList.v_map (fun (p : (t_Term, t_Rig) B_dData_dPair.t_Pair) -> { B_dData_dPair.f_Pair_first = (((((v_substMetaVarGo mc0) mc1) mc2) mc3) (B_dData_dPair.v_firstOf p)); B_dData_dPair.f_Pair_second = (B_dData_dPair.v_secondOf p) })) dtb__131)))
  | C_Term_TCon (dtb__132, dtb__133) -> (C_Term_TCon (dtb__132, ((B_dData_dList.v_map (fun (p : (t_Term, t_Rig) B_dData_dPair.t_Pair) -> { B_dData_dPair.f_Pair_first = (((((v_substMetaVarGo mc0) mc1) mc2) mc3) (B_dData_dPair.v_firstOf p)); B_dData_dPair.f_Pair_second = (B_dData_dPair.v_secondOf p) })) dtb__133)))
  | C_Term_TApp (dtb__134, dtb__135, dtb__136) -> (C_Term_TApp ((((((v_substMetaVarGo mc0) mc1) mc2) mc3) dtb__134), (((((v_substMetaVarGo mc0) mc1) mc2) mc3) dtb__135), dtb__136))
  | C_Term_TLam (dtb__137, dtb__138, dtb__139, dtb__140, dtb__141) -> (let slot2 = (let nd_uscrut10 = dtb__139 in (match nd_uscrut10 with
  | B_dData_dMaybe.C_Maybe_Just (dtb__142) -> (match dtb__142 with
  | { B_dData_dPair.f_Pair_first = dtb__143; B_dData_dPair.f_Pair_second = dtb__144 } -> (match dtb__144 with
  | { B_dData_dPair.f_Pair_first = dtb__145; B_dData_dPair.f_Pair_second = dtb__146 } -> (let bt2 = (match dtb__145 with
  | B_dData_dMaybe.C_Maybe_Nothing -> B_dData_dMaybe.C_Maybe_Nothing
  | B_dData_dMaybe.C_Maybe_Just (dtb__148) -> (B_dData_dMaybe.C_Maybe_Just ((((((v_substMetaVarGo mc0) mc1) mc2) mc3) dtb__148)))
  | _ -> failwith "DT: impossible branch"
) in (let rt2 = (match dtb__146 with
  | B_dData_dMaybe.C_Maybe_Nothing -> B_dData_dMaybe.C_Maybe_Nothing
  | B_dData_dMaybe.C_Maybe_Just (dtb__147) -> (B_dData_dMaybe.C_Maybe_Just ((((((v_substMetaVarGo mc0) mc1) mc2) (mc3 + 1)) dtb__147)))
  | _ -> failwith "DT: impossible branch"
) in (B_dData_dMaybe.C_Maybe_Just ({ B_dData_dPair.f_Pair_first = dtb__143; B_dData_dPair.f_Pair_second = { B_dData_dPair.f_Pair_first = bt2; B_dData_dPair.f_Pair_second = rt2 } }))))
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
)
  | B_dData_dMaybe.C_Maybe_Nothing -> B_dData_dMaybe.C_Maybe_Nothing
  | _ -> failwith "DT: impossible branch"
)) in (C_Term_TLam (dtb__137, dtb__138, slot2, dtb__140, (((((v_substMetaVarGo mc0) mc1) mc2) (mc3 + 1)) dtb__141))))
  | C_Term_TPi (dtb__149, dtb__150, dtb__151, dtb__152, dtb__153) -> (C_Term_TPi (dtb__149, dtb__150, dtb__151, (((((v_substMetaVarGo mc0) mc1) mc2) mc3) dtb__152), (((((v_substMetaVarGo mc0) mc1) mc2) (mc3 + 1)) dtb__153)))
  | C_Term_TMeta (dtb__154) -> (if (dtb__154 = mc0) then (C_Term_TVar (mc1, (mc3 - mc2), { Base_dSource.f_Span_spanFile = ""; Base_dSource.f_Span_spanStartLine = 0; Base_dSource.f_Span_spanStartCol = 0; Base_dSource.f_Span_spanEndLine = 0; Base_dSource.f_Span_spanEndCol = 0; Base_dSource.f_Span_spanStartOffset = 0; Base_dSource.f_Span_spanEndOffset = 0 })) else mc4)
  | _ -> mc4
))
# 799 "Vuna/Compiler/Core/Term.vuna"
and v_substMetaVarAlt = (fun (mc0 : int) (mc1 : string) (mc2 : int) (mc3 : int) (mc4 : t_CaseAlt) -> (match mc4 with
  | { f_CaseAlt_caseAltName = dtb__155; f_CaseAlt_caseAltBinders = dtb__156; f_CaseAlt_caseAltBody = dtb__157 } -> { f_CaseAlt_caseAltName = dtb__155; f_CaseAlt_caseAltBinders = dtb__156; f_CaseAlt_caseAltBody = (((((v_substMetaVarGo mc0) mc1) mc2) (mc3 + (B_dData_dList.v_length dtb__156))) dtb__157) }
  | _ -> failwith "DT: impossible branch"
))

# 755 "Vuna/Compiler/Core/Term.vuna"
let v_substMetaVar = (fun (m : int) (name : string) (q : int) (t : t_Term) -> (((((v_substMetaVarGo m) name) q) 0) t))

# 811 "Vuna/Compiler/Core/Term.vuna"
let rec v_insertDictBinderGo = (fun (mc0 : string) (mc1 : int) (mc2 : t_Term) (mc3 : int) (mc4 : t_Term) -> (match mc4 with
  | C_Term_TPi (dtb__158, dtb__159, dtb__160, dtb__161, dtb__162) -> (if (mc3 = mc1) then (C_Term_TPi (dtb__158, dtb__159, dtb__160, dtb__161, (C_Term_TPi (mc0, true, C_Rig_RigOmega, mc2, (((v_shift 0) 1) dtb__162))))) else (C_Term_TPi (dtb__158, dtb__159, dtb__160, dtb__161, (((((v_insertDictBinderGo mc0) mc1) mc2) (mc3 + 1)) dtb__162))))
  | _ -> mc4
))

# 805 "Vuna/Compiler/Core/Term.vuna"
let v_insertDictBinder = (fun (name : string) (idx : int) (dictDom : t_Term) (t : t_Term) -> (((((v_insertDictBinderGo name) idx) dictDom) 0) t))

# 823 "Vuna/Compiler/Core/Term.vuna"
let rec v_insertImplicitBinderGo = (fun (mc0 : string) (mc1 : int) (mc2 : t_Rig) (mc3 : t_Term) (mc4 : int) (mc5 : t_Term) -> (match mc5 with
  | C_Term_TPi (dtb__163, dtb__164, dtb__165, dtb__166, dtb__167) -> (if (mc4 = mc1) then (C_Term_TPi (dtb__163, dtb__164, dtb__165, dtb__166, (C_Term_TPi (mc0, true, mc2, mc3, (((v_shift 0) 1) dtb__167))))) else (C_Term_TPi (dtb__163, dtb__164, dtb__165, dtb__166, ((((((v_insertImplicitBinderGo mc0) mc1) mc2) mc3) (mc4 + 1)) dtb__167))))
  | _ -> mc5
))

# 820 "Vuna/Compiler/Core/Term.vuna"
let v_insertImplicitBinder = (fun (name : string) (idx : int) (rig : t_Rig) (dom : t_Term) (t : t_Term) -> ((((((v_insertImplicitBinderGo name) idx) rig) dom) 0) t))

# 832 "Vuna/Compiler/Core/Term.vuna"
let v_cutoffOf = (fun (total : int) (idx : int) -> (if ((total - (idx + 1)) <= 0) then 0 else (total - (idx + 1))))

# 835 "Vuna/Compiler/Core/Term.vuna"
let rec v_countPis = (fun (mc0 : t_Term) -> (match mc0 with
  | C_Term_TPi (dtb__168, dtb__169, dtb__170, dtb__171, dtb__172) -> (1 + (v_countPis dtb__172))
  | _ -> 0
))

# 847 "Vuna/Compiler/Core/Term.vuna"
let rec v_insertLamBinderGo = (fun (mc0 : string) (mc1 : int) (mc2 : int) (mc3 : t_Term) -> (match mc3 with
  | C_Term_TLam (dtb__173, dtb__174, dtb__175, dtb__176, dtb__177) -> (if (mc2 = mc1) then (C_Term_TLam (dtb__173, dtb__174, dtb__175, dtb__176, (C_Term_TLam (mc0, C_Rig_RigOmega, B_dData_dMaybe.C_Maybe_Nothing, Base_dSource.v_spanEmpty, (((v_shift 0) 1) dtb__177))))) else (C_Term_TLam (dtb__173, dtb__174, dtb__175, dtb__176, ((((v_insertLamBinderGo mc0) mc1) (mc2 + 1)) dtb__177))))
  | _ -> mc3
))

# 844 "Vuna/Compiler/Core/Term.vuna"
let v_insertLamBinder = (fun (name : string) (idx : int) (t : t_Term) -> ((((v_insertLamBinderGo name) idx) 0) t))

# 855 "Vuna/Compiler/Core/Term.vuna"
let rec v_countLams = (fun (mc0 : t_Term) -> (match mc0 with
  | C_Term_TLam (dtb__178, dtb__179, dtb__180, dtb__181, dtb__182) -> (1 + (v_countLams dtb__182))
  | _ -> 0
))

# 860 "Vuna/Compiler/Core/Term.vuna"
let rec v_hasFreeTermVar = (fun (mc0 : int) (mc1 : t_Term) -> (match mc1 with
  | C_Term_TIf (dtb__183, dtb__184, dtb__185) -> (if (if ((v_hasFreeTermVar mc0) dtb__183) then true else ((v_hasFreeTermVar mc0) dtb__184)) then true else ((v_hasFreeTermVar mc0) dtb__185))
  | C_Term_TCase (dtb__186, dtb__187) -> (if ((v_hasFreeTermVar mc0) dtb__186) then true else ((v_anyAltFree mc0) dtb__187))
  | C_Term_TRecUpd (dtb__188, dtb__189, dtb__190, dtb__191, dtb__192) -> (if ((v_hasFreeTermVar mc0) dtb__188) then true else ((v_hasFreeTermVar (mc0 + (B_dData_dList.v_length dtb__190))) dtb__192))
  | C_Term_TProj (dtb__193, dtb__194, dtb__195, dtb__196, dtb__197) -> ((v_hasFreeTermVar mc0) dtb__193)
  | C_Term_TRecord (dtb__198, dtb__199) -> ((v_anyPairFree mc0) dtb__199)
  | C_Term_TMk (dtb__200, dtb__201) -> ((v_anyPairFree mc0) dtb__201)
  | C_Term_TCon (dtb__202, dtb__203) -> ((v_anyPairFree mc0) dtb__203)
  | C_Term_TApp (dtb__204, dtb__205, dtb__206) -> (if ((v_hasFreeTermVar mc0) dtb__204) then true else ((v_hasFreeTermVar mc0) dtb__205))
  | C_Term_TLam (dtb__207, dtb__208, dtb__209, dtb__210, dtb__211) -> (let tys = (let nd_uscrut7 = dtb__209 in (match nd_uscrut7 with
  | B_dData_dMaybe.C_Maybe_Just (dtb__212) -> (match dtb__212 with
  | { B_dData_dPair.f_Pair_first = dtb__213; B_dData_dPair.f_Pair_second = dtb__214 } -> (match dtb__214 with
  | { B_dData_dPair.f_Pair_first = dtb__215; B_dData_dPair.f_Pair_second = dtb__216 } -> (if ((v_hasFreeTermVarMaybe mc0) dtb__215) then true else ((v_hasFreeTermVarMaybe (mc0 + 1)) dtb__216))
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
)
  | B_dData_dMaybe.C_Maybe_Nothing -> false
  | _ -> failwith "DT: impossible branch"
)) in (if tys then true else ((v_hasFreeTermVar (mc0 + 1)) dtb__211)))
  | C_Term_TPi (dtb__217, dtb__218, dtb__219, dtb__220, dtb__221) -> (if ((v_hasFreeTermVar mc0) dtb__220) then true else ((v_hasFreeTermVar (mc0 + 1)) dtb__221))
  | C_Term_TVar (dtb__222, dtb__223, dtb__224) -> (dtb__223 >= mc0)
  | _ -> false
))
# 883 "Vuna/Compiler/Core/Term.vuna"
and v_hasFreeTermVarMaybe = (fun (mc0 : int) (mc1 : t_Term B_dData_dMaybe.t_Maybe) -> (match mc1 with
  | B_dData_dMaybe.C_Maybe_Just (dtb__225) -> ((v_hasFreeTermVar mc0) dtb__225)
  | B_dData_dMaybe.C_Maybe_Nothing -> false
  | _ -> failwith "DT: impossible branch"
))
# 887 "Vuna/Compiler/Core/Term.vuna"
and v_anyPairFree = (fun (mc0 : int) (mc1 : (t_Term, t_Rig) B_dData_dPair.t_Pair B_dData_dList.t_List) -> (match mc1 with
  | B_dData_dList.C_List__x58__x58_ (dtb__226, dtb__227) -> (match dtb__226 with
  | { B_dData_dPair.f_Pair_first = dtb__228; B_dData_dPair.f_Pair_second = dtb__229 } -> (if ((v_hasFreeTermVar mc0) dtb__228) then true else ((v_anyPairFree mc0) dtb__227))
  | _ -> failwith "DT: impossible branch"
)
  | B_dData_dList.C_List_Nil -> false
  | _ -> failwith "DT: impossible branch"
))
# 891 "Vuna/Compiler/Core/Term.vuna"
and v_anyAltFree = (fun (mc0 : int) (mc1 : t_CaseAlt B_dData_dList.t_List) -> (match mc1 with
  | B_dData_dList.C_List__x58__x58_ (dtb__230, dtb__231) -> (match dtb__230 with
  | { f_CaseAlt_caseAltName = dtb__232; f_CaseAlt_caseAltBinders = dtb__233; f_CaseAlt_caseAltBody = dtb__234 } -> (if ((v_hasFreeTermVar (mc0 + (B_dData_dList.v_length dtb__233))) dtb__234) then true else ((v_anyAltFree mc0) dtb__231))
  | _ -> failwith "DT: impossible branch"
)
  | B_dData_dList.C_List_Nil -> false
  | _ -> failwith "DT: impossible branch"
))

# 899 "Vuna/Compiler/Core/Term.vuna"
let rec v_hasNegativeVar = (fun (mc0 : t_Term) -> (match mc0 with
  | C_Term_TIf (dtb__235, dtb__236, dtb__237) -> (if (if (v_hasNegativeVar dtb__235) then true else (v_hasNegativeVar dtb__236)) then true else (v_hasNegativeVar dtb__237))
  | C_Term_TCase (dtb__238, dtb__239) -> (if (v_hasNegativeVar dtb__238) then true else (v_anyNegativeVarAlts dtb__239))
  | C_Term_TRecUpd (dtb__240, dtb__241, dtb__242, dtb__243, dtb__244) -> (if (v_hasNegativeVar dtb__240) then true else (v_hasNegativeVar dtb__244))
  | C_Term_TProj (dtb__245, dtb__246, dtb__247, dtb__248, dtb__249) -> (v_hasNegativeVar dtb__245)
  | C_Term_TRecord (dtb__250, dtb__251) -> (v_anyNegativeVarArgs dtb__251)
  | C_Term_TMk (dtb__252, dtb__253) -> (v_anyNegativeVarArgs dtb__253)
  | C_Term_TCon (dtb__254, dtb__255) -> (v_anyNegativeVarArgs dtb__255)
  | C_Term_TApp (dtb__256, dtb__257, dtb__258) -> (if (v_hasNegativeVar dtb__256) then true else (v_hasNegativeVar dtb__257))
  | C_Term_TLam (dtb__259, dtb__260, dtb__261, dtb__262, dtb__263) -> (let tys = (let nd_uscrut6 = dtb__261 in (match nd_uscrut6 with
  | B_dData_dMaybe.C_Maybe_Just (dtb__264) -> (match dtb__264 with
  | { B_dData_dPair.f_Pair_first = dtb__265; B_dData_dPair.f_Pair_second = dtb__266 } -> (match dtb__266 with
  | { B_dData_dPair.f_Pair_first = dtb__267; B_dData_dPair.f_Pair_second = dtb__268 } -> (if (v_hasNegativeVarMaybe dtb__267) then true else (v_hasNegativeVarMaybe dtb__268))
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
)
  | B_dData_dMaybe.C_Maybe_Nothing -> false
  | _ -> failwith "DT: impossible branch"
)) in (if tys then true else (v_hasNegativeVar dtb__263)))
  | C_Term_TPi (dtb__269, dtb__270, dtb__271, dtb__272, dtb__273) -> (if (v_hasNegativeVar dtb__272) then true else (v_hasNegativeVar dtb__273))
  | C_Term_TVar (dtb__274, dtb__275, dtb__276) -> (dtb__275 < 0)
  | _ -> false
))
# 919 "Vuna/Compiler/Core/Term.vuna"
and v_hasNegativeVarMaybe = (fun (mc0 : t_Term B_dData_dMaybe.t_Maybe) -> (match mc0 with
  | B_dData_dMaybe.C_Maybe_Just (dtb__277) -> (v_hasNegativeVar dtb__277)
  | B_dData_dMaybe.C_Maybe_Nothing -> false
  | _ -> failwith "DT: impossible branch"
))
# 923 "Vuna/Compiler/Core/Term.vuna"
and v_anyNegativeVarArgs = (fun (mc0 : (t_Term, t_Rig) B_dData_dPair.t_Pair B_dData_dList.t_List) -> (match mc0 with
  | B_dData_dList.C_List__x58__x58_ (dtb__278, dtb__279) -> (match dtb__278 with
  | { B_dData_dPair.f_Pair_first = dtb__280; B_dData_dPair.f_Pair_second = dtb__281 } -> (if (v_hasNegativeVar dtb__280) then true else (v_anyNegativeVarArgs dtb__279))
  | _ -> failwith "DT: impossible branch"
)
  | B_dData_dList.C_List_Nil -> false
  | _ -> failwith "DT: impossible branch"
))
# 927 "Vuna/Compiler/Core/Term.vuna"
and v_anyNegativeVarAlts = (fun (mc0 : t_CaseAlt B_dData_dList.t_List) -> (match mc0 with
  | B_dData_dList.C_List__x58__x58_ (dtb__282, dtb__283) -> (match dtb__282 with
  | { f_CaseAlt_caseAltName = dtb__284; f_CaseAlt_caseAltBinders = dtb__285; f_CaseAlt_caseAltBody = dtb__286 } -> (if (v_hasNegativeVar dtb__286) then true else (v_anyNegativeVarAlts dtb__283))
  | _ -> failwith "DT: impossible branch"
)
  | B_dData_dList.C_List_Nil -> false
  | _ -> failwith "DT: impossible branch"
))

# 933 "Vuna/Compiler/Core/Term.vuna"
let v_metaScanBound = 262144

# 939 "Vuna/Compiler/Core/Term.vuna"
let rec v_hasUnsolvedMetaValueFuel = (fun (fuel : int) (sols : t_Sols) (v : t_Value) -> (if (fuel <= 0) then true else (match v with
  | C_Value_VMeta (dtb__287, dtb__288) -> (match ((v_solsLookup dtb__287) sols) with
  | B_dData_dMaybe.C_Maybe_Just (dtb__289) -> (((v_hasUnsolvedMetaValueFuel (fuel - 1)) sols) dtb__289)
  | B_dData_dMaybe.C_Maybe_Nothing -> true
  | _ -> failwith "DT: impossible branch"
)
  | C_Value_VNeutral (dtb__290) -> (match dtb__290 with
  | C_Neutral_NVar (dtb__291, dtb__292, dtb__293) -> (((v_hasUnsolvedMetaListFuel (fuel - 1)) sols) dtb__293)
  | C_Neutral_NGlobal (dtb__294, dtb__295) -> (((v_hasUnsolvedMetaListFuel (fuel - 1)) sols) dtb__295)
  | _ -> failwith "DT: impossible branch"
)
  | C_Value_VPi (dtb__296, dtb__297, dtb__298, dtb__299, dtb__300) -> (if (((v_hasUnsolvedMetaValueFuel (fuel - 1)) sols) dtb__299) then true else (((v_hasUnsolvedMetaCloFuel (fuel - 1)) sols) dtb__300))
  | C_Value_VLam (dtb__301, dtb__302, dtb__303) -> (((v_hasUnsolvedMetaCloFuel (fuel - 1)) sols) dtb__303)
  | C_Value_VCon (dtb__304, dtb__305) -> (((v_hasUnsolvedMetaListFuel (fuel - 1)) sols) dtb__305)
  | C_Value_VApp (dtb__306, dtb__307) -> (if (((v_hasUnsolvedMetaValueFuel (fuel - 1)) sols) dtb__306) then true else (((v_hasUnsolvedMetaValueFuel (fuel - 1)) sols) dtb__307))
  | C_Value_VCase (dtb__308, dtb__309) -> (((v_hasUnsolvedMetaValueFuel (fuel - 1)) sols) dtb__308)
  | C_Value_VProj (dtb__310, dtb__311, dtb__312, dtb__313, dtb__314) -> (((v_hasUnsolvedMetaValueFuel (fuel - 1)) sols) dtb__310)
  | C_Value_VIf (dtb__315, dtb__316, dtb__317) -> (if (if (((v_hasUnsolvedMetaValueFuel (fuel - 1)) sols) dtb__315) then true else (((v_hasUnsolvedMetaValueFuel (fuel - 1)) sols) dtb__316)) then true else (((v_hasUnsolvedMetaValueFuel (fuel - 1)) sols) dtb__317))
  | _ -> false
)))
# 965 "Vuna/Compiler/Core/Term.vuna"
and v_hasUnsolvedMetaListFuel = (fun (fuel : int) (sols : t_Sols) (vs : t_Value B_dData_dList.t_List) -> (if (fuel <= 0) then true else (match vs with
  | B_dData_dList.C_List_Nil -> false
  | B_dData_dList.C_List__x58__x58_ (dtb__318, dtb__319) -> (if (((v_hasUnsolvedMetaValueFuel (fuel - 1)) sols) dtb__318) then true else (((v_hasUnsolvedMetaListFuel (fuel - 1)) sols) dtb__319))
  | _ -> failwith "DT: impossible branch"
)))
# 977 "Vuna/Compiler/Core/Term.vuna"
and v_hasUnsolvedMetaCloFuel = (fun (fuel : int) (sols : t_Sols) (clo : t_Closure) -> (if (fuel <= 0) then true else (match clo with
  | { f_Closure_closureEnv = dtb__320; f_Closure_closureBody = dtb__321 } -> (((v_hasUnsolvedMetaListFuel (fuel - 1)) sols) dtb__320)
  | _ -> failwith "DT: impossible branch"
)))

# 936 "Vuna/Compiler/Core/Term.vuna"
let v_hasUnsolvedMetaValue = (fun (sols : t_Sols) (v : t_Value) -> (((v_hasUnsolvedMetaValueFuel v_metaScanBound) sols) v))

# 962 "Vuna/Compiler/Core/Term.vuna"
let v_hasUnsolvedMetaList = (fun (sols : t_Sols) (vs : t_Value B_dData_dList.t_List) -> (((v_hasUnsolvedMetaListFuel v_metaScanBound) sols) vs))

# 974 "Vuna/Compiler/Core/Term.vuna"
let v_hasUnsolvedMetaClo = (fun (sols : t_Sols) (clo : t_Closure) -> (((v_hasUnsolvedMetaCloFuel v_metaScanBound) sols) clo))

# 988 "Vuna/Compiler/Core/Term.vuna"
let v_isTypeValue = (fun (mc0 : t_Value) -> (match mc0 with
  | C_Value_VType (dtb__322) -> true
  | _ -> false
))

# 992 "Vuna/Compiler/Core/Term.vuna"
let v_typeLevelOf = (fun (mc0 : t_Value) -> (match mc0 with
  | C_Value_VType (dtb__323) -> (B_dData_dMaybe.C_Maybe_Just (dtb__323))
  | _ -> B_dData_dMaybe.C_Maybe_Nothing
))

# 1000 "Vuna/Compiler/Core/Term.vuna"
let rec v_levelEscapes = (fun (mc0 : int) (mc1 : int) (mc2 : t_Value) -> (match mc2 with
  | C_Value_VBool (dtb__324) -> false
  | C_Value_VFloat (dtb__325) -> false
  | C_Value_VStr (dtb__326) -> false
  | C_Value_VInt (dtb__327) -> false
  | C_Value_VType (dtb__328) -> false
  | C_Value_VIf (dtb__329, dtb__330, dtb__331) -> (if (if (((v_levelEscapes mc0) mc1) dtb__329) then true else (((v_levelEscapes mc0) mc1) dtb__330)) then true else (((v_levelEscapes mc0) mc1) dtb__331))
  | C_Value_VProj (dtb__332, dtb__333, dtb__334, dtb__335, dtb__336) -> (((v_levelEscapes mc0) mc1) dtb__332)
  | C_Value_VCase (dtb__337, dtb__338) -> (((v_levelEscapes mc0) mc1) dtb__337)
  | C_Value_VApp (dtb__339, dtb__340) -> (if (((v_levelEscapes mc0) mc1) dtb__339) then true else (((v_levelEscapes mc0) mc1) dtb__340))
  | C_Value_VCon (dtb__341, dtb__342) -> ((v_levelEscapesList mc0) dtb__342)
  | C_Value_VMeta (dtb__343, dtb__344) -> ((v_levelEscapesList mc0) dtb__344)
  | C_Value_VLam (dtb__345, dtb__346, dtb__347) -> ((v_levelEscapesClo mc0) dtb__347)
  | C_Value_VPi (dtb__348, dtb__349, dtb__350, dtb__351, dtb__352) -> (if (((v_levelEscapes mc0) mc1) dtb__351) then true else ((v_levelEscapesClo mc0) dtb__352))
  | C_Value_VNeutral (dtb__353) -> (match dtb__353 with
  | C_Neutral_NVar (dtb__354, dtb__355, dtb__356) -> (if (dtb__355 >= mc0) then true else ((v_levelEscapesList mc0) dtb__356))
  | C_Neutral_NGlobal (dtb__357, dtb__358) -> ((v_levelEscapesList mc0) dtb__358)
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
))
# 1021 "Vuna/Compiler/Core/Term.vuna"
and v_levelEscapesList = (fun (mc0 : int) (mc1 : t_Value B_dData_dList.t_List) -> (match mc1 with
  | B_dData_dList.C_List__x58__x58_ (dtb__359, dtb__360) -> (if (((v_levelEscapes mc0) 0) dtb__359) then true else ((v_levelEscapesList mc0) dtb__360))
  | B_dData_dList.C_List_Nil -> false
  | _ -> failwith "DT: impossible branch"
))
# 1025 "Vuna/Compiler/Core/Term.vuna"
and v_levelEscapesClo = (fun (mc0 : int) (mc1 : t_Closure) -> (match mc1 with
  | { f_Closure_closureEnv = dtb__361; f_Closure_closureBody = dtb__362 } -> ((v_levelEscapesList mc0) dtb__361)
  | _ -> failwith "DT: impossible branch"
))

# 1105 "Vuna/Compiler/Core/Term.vuna"
let rec v_showBinders = (fun (mc0 : (string, t_Rig) B_dData_dPair.t_Pair B_dData_dList.t_List) -> (match mc0 with
  | B_dData_dList.C_List__x58__x58_ (dtb__363, dtb__364) -> (match dtb__363 with
  | { B_dData_dPair.f_Pair_first = dtb__365; B_dData_dPair.f_Pair_second = dtb__366 } -> (String.concat "" [" "; dtb__365; (v_showBinders dtb__364)])
  | _ -> failwith "DT: impossible branch"
)
  | B_dData_dList.C_List_Nil -> ""
  | _ -> failwith "DT: impossible branch"
))

# 1112 "Vuna/Compiler/Core/Term.vuna"
let rec v_showCoreChars = (fun (mc0 : int B_dData_dList.t_List) -> (match mc0 with
  | B_dData_dList.C_List__x58__x58_ (dtb__367, dtb__368) -> (if (dtb__367 = 34) then ("\\\"" ^ (v_showCoreChars dtb__368)) else (if (dtb__367 = 92) then ("\\\\" ^ (v_showCoreChars dtb__368)) else (if (dtb__367 = 10) then ("\\n" ^ (v_showCoreChars dtb__368)) else (if (dtb__367 = 9) then ("\\t" ^ (v_showCoreChars dtb__368)) else (if (dtb__367 = 13) then ("\\r" ^ (v_showCoreChars dtb__368)) else ((B_dData_dList.dtp_pack (B_dData_dList.C_List__x58__x58_ (dtb__367, B_dData_dList.C_List_Nil))) ^ (v_showCoreChars dtb__368)))))))
  | B_dData_dList.C_List_Nil -> ""
  | _ -> failwith "DT: impossible branch"
))

# 1109 "Vuna/Compiler/Core/Term.vuna"
let v_showCoreString = (fun (s : string) -> (String.concat "" ["\""; (v_showCoreChars (B_dData_dList.dtp_unpack s)); "\""]))

# 97 "Vuna/Compiler/Core/Term.vuna"
let v_levelToInt = (fun (p : t_Level) -> (let dtb__369 = p in dtb__369))

# 158 "Vuna/Compiler/Core/Term.vuna"
let v_binderName = (fun (p : t_Binder) -> (match p with
  | { f_Binder_binderName = dtb__370; f_Binder_binderRig = dtb__371; f_Binder_binderSpan = dtb__372 } -> dtb__370
  | _ -> failwith "DT: impossible branch"
))

# 159 "Vuna/Compiler/Core/Term.vuna"
let v_binderRig = (fun (p : t_Binder) -> (match p with
  | { f_Binder_binderName = dtb__373; f_Binder_binderRig = dtb__374; f_Binder_binderSpan = dtb__375 } -> dtb__374
  | _ -> failwith "DT: impossible branch"
))

# 160 "Vuna/Compiler/Core/Term.vuna"
let v_binderSpan = (fun (p : t_Binder) -> (match p with
  | { f_Binder_binderName = dtb__376; f_Binder_binderRig = dtb__377; f_Binder_binderSpan = dtb__378 } -> dtb__378
  | _ -> failwith "DT: impossible branch"
))

# 187 "Vuna/Compiler/Core/Term.vuna"
let v_caseAltName = (fun (p : t_CaseAlt) -> (match p with
  | { f_CaseAlt_caseAltName = dtb__379; f_CaseAlt_caseAltBinders = dtb__380; f_CaseAlt_caseAltBody = dtb__381 } -> dtb__379
  | _ -> failwith "DT: impossible branch"
))

# 188 "Vuna/Compiler/Core/Term.vuna"
let v_caseAltBinders = (fun (p : t_CaseAlt) -> (match p with
  | { f_CaseAlt_caseAltName = dtb__382; f_CaseAlt_caseAltBinders = dtb__383; f_CaseAlt_caseAltBody = dtb__384 } -> dtb__383
  | _ -> failwith "DT: impossible branch"
))

# 189 "Vuna/Compiler/Core/Term.vuna"
let v_caseAltBody = (fun (p : t_CaseAlt) -> (match p with
  | { f_CaseAlt_caseAltName = dtb__385; f_CaseAlt_caseAltBinders = dtb__386; f_CaseAlt_caseAltBody = dtb__387 } -> dtb__387
  | _ -> failwith "DT: impossible branch"
))

# 338 "Vuna/Compiler/Core/Term.vuna"
let rec v_termSizeAltTerms = (fun (mc0 : t_CaseAlt B_dData_dList.t_List) -> (match mc0 with
  | B_dData_dList.C_List__x58__x58_ (dtb__388, dtb__389) -> (B_dData_dList.C_List__x58__x58_ ((v_caseAltBody dtb__388), (v_termSizeAltTerms dtb__389)))
  | B_dData_dList.C_List_Nil -> B_dData_dList.C_List_Nil
  | _ -> failwith "DT: impossible branch"
))

# 314 "Vuna/Compiler/Core/Term.vuna"
let v_termSizeWork = (fun (mc0 : t_Term) -> (match mc0 with
  | C_Term_TIf (dtb__390, dtb__391, dtb__392) -> (B_dData_dList.C_List__x58__x58_ (dtb__390, (B_dData_dList.C_List__x58__x58_ (dtb__391, (B_dData_dList.C_List__x58__x58_ (dtb__392, B_dData_dList.C_List_Nil))))))
  | C_Term_TRecUpd (dtb__393, dtb__394, dtb__395, dtb__396, dtb__397) -> (B_dData_dList.C_List__x58__x58_ (dtb__393, (B_dData_dList.C_List__x58__x58_ (dtb__397, B_dData_dList.C_List_Nil))))
  | C_Term_TProj (dtb__398, dtb__399, dtb__400, dtb__401, dtb__402) -> (B_dData_dList.C_List__x58__x58_ (dtb__398, B_dData_dList.C_List_Nil))
  | C_Term_TCase (dtb__403, dtb__404) -> (B_dData_dList.C_List__x58__x58_ (dtb__403, (v_termSizeAltTerms dtb__404)))
  | C_Term_TRecord (dtb__405, dtb__406) -> (v_termSizeArgTerms dtb__406)
  | C_Term_TMk (dtb__407, dtb__408) -> (v_termSizeArgTerms dtb__408)
  | C_Term_TCon (dtb__409, dtb__410) -> (v_termSizeArgTerms dtb__410)
  | C_Term_TApp (dtb__411, dtb__412, dtb__413) -> (B_dData_dList.C_List__x58__x58_ (dtb__411, (B_dData_dList.C_List__x58__x58_ (dtb__412, B_dData_dList.C_List_Nil))))
  | C_Term_TLam (dtb__414, dtb__415, dtb__416, dtb__417, dtb__418) -> ((B_dData_dList.v_append (v_termSizeSlotTerms dtb__416)) (B_dData_dList.C_List__x58__x58_ (dtb__418, B_dData_dList.C_List_Nil)))
  | C_Term_TPi (dtb__419, dtb__420, dtb__421, dtb__422, dtb__423) -> (B_dData_dList.C_List__x58__x58_ (dtb__422, (B_dData_dList.C_List__x58__x58_ (dtb__423, B_dData_dList.C_List_Nil))))
  | C_Term_TBool (dtb__424) -> B_dData_dList.C_List_Nil
  | C_Term_TFloat (dtb__425) -> B_dData_dList.C_List_Nil
  | C_Term_TStr (dtb__426) -> B_dData_dList.C_List_Nil
  | C_Term_TInt (dtb__427) -> B_dData_dList.C_List_Nil
  | C_Term_TType (dtb__428) -> B_dData_dList.C_List_Nil
  | C_Term_TGlobal (dtb__429) -> B_dData_dList.C_List_Nil
  | C_Term_TMeta (dtb__430) -> B_dData_dList.C_List_Nil
  | C_Term_TVar (dtb__431, dtb__432, dtb__433) -> B_dData_dList.C_List_Nil
  | _ -> failwith "DT: impossible branch"
))

# 308 "Vuna/Compiler/Core/Term.vuna"
let rec v_termSizeGo = (fun (mc0 : int) (mc1 : t_Term B_dData_dList.t_List) -> (match mc1 with
  | B_dData_dList.C_List__x58__x58_ (dtb__434, dtb__435) -> (if (mc0 <= 0) then 0 else (1 + ((v_termSizeGo (mc0 - 1)) ((B_dData_dList.v_append (v_termSizeWork dtb__434)) dtb__435))))
  | B_dData_dList.C_List_Nil -> 0
  | _ -> failwith "DT: impossible branch"
))

# 299 "Vuna/Compiler/Core/Term.vuna"
let v_termSize = (fun (t : t_Term) -> ((v_termSizeGo v_termSizeCap) (B_dData_dList.C_List__x58__x58_ (t, B_dData_dList.C_List_Nil))))

# 402 "Vuna/Compiler/Core/Term.vuna"
let rec v_termHasUnsolvedMeta = (fun (mc0 : t_Sols) (mc1 : t_Term) -> (match mc1 with
  | C_Term_TIf (dtb__436, dtb__437, dtb__438) -> (if (if ((v_termHasUnsolvedMeta mc0) dtb__436) then true else ((v_termHasUnsolvedMeta mc0) dtb__437)) then true else ((v_termHasUnsolvedMeta mc0) dtb__438))
  | C_Term_TBool (dtb__439) -> false
  | C_Term_TFloat (dtb__440) -> false
  | C_Term_TStr (dtb__441) -> false
  | C_Term_TInt (dtb__442) -> false
  | C_Term_TCase (dtb__443, dtb__444) -> (if ((v_termHasUnsolvedMeta mc0) dtb__443) then true else ((v_termHasUnsolvedMetaAlts mc0) dtb__444))
  | C_Term_TRecUpd (dtb__445, dtb__446, dtb__447, dtb__448, dtb__449) -> (if ((v_termHasUnsolvedMeta mc0) dtb__445) then true else ((v_termHasUnsolvedMeta mc0) dtb__449))
  | C_Term_TProj (dtb__450, dtb__451, dtb__452, dtb__453, dtb__454) -> ((v_termHasUnsolvedMeta mc0) dtb__450)
  | C_Term_TRecord (dtb__455, dtb__456) -> ((v_termHasUnsolvedMetaArgs mc0) dtb__456)
  | C_Term_TMk (dtb__457, dtb__458) -> ((v_termHasUnsolvedMetaArgs mc0) dtb__458)
  | C_Term_TCon (dtb__459, dtb__460) -> ((v_termHasUnsolvedMetaArgs mc0) dtb__460)
  | C_Term_TApp (dtb__461, dtb__462, dtb__463) -> (if ((v_termHasUnsolvedMeta mc0) dtb__461) then true else ((v_termHasUnsolvedMeta mc0) dtb__462))
  | C_Term_TLam (dtb__464, dtb__465, dtb__466, dtb__467, dtb__468) -> (let tys = (let nd_uscrut7 = dtb__466 in (match nd_uscrut7 with
  | B_dData_dMaybe.C_Maybe_Just (dtb__469) -> (match dtb__469 with
  | { B_dData_dPair.f_Pair_first = dtb__470; B_dData_dPair.f_Pair_second = dtb__471 } -> (match dtb__471 with
  | { B_dData_dPair.f_Pair_first = dtb__472; B_dData_dPair.f_Pair_second = dtb__473 } -> (if ((v_termHasUnsolvedMetaMaybe mc0) dtb__472) then true else ((v_termHasUnsolvedMetaMaybe mc0) dtb__473))
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
)
  | B_dData_dMaybe.C_Maybe_Nothing -> false
  | _ -> failwith "DT: impossible branch"
)) in (if tys then true else ((v_termHasUnsolvedMeta mc0) dtb__468)))
  | C_Term_TPi (dtb__474, dtb__475, dtb__476, dtb__477, dtb__478) -> (if ((v_termHasUnsolvedMeta mc0) dtb__477) then true else ((v_termHasUnsolvedMeta mc0) dtb__478))
  | C_Term_TType (dtb__479) -> false
  | C_Term_TGlobal (dtb__480) -> false
  | C_Term_TVar (dtb__481, dtb__482, dtb__483) -> false
  | C_Term_TMeta (dtb__484) -> (match ((v_solsLookup dtb__484) mc0) with
  | B_dData_dMaybe.C_Maybe_Just (dtb__485) -> false
  | B_dData_dMaybe.C_Maybe_Nothing -> true
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
))
# 435 "Vuna/Compiler/Core/Term.vuna"
and v_termHasUnsolvedMetaMaybe = (fun (mc0 : t_Sols) (mc1 : t_Term B_dData_dMaybe.t_Maybe) -> (match mc1 with
  | B_dData_dMaybe.C_Maybe_Just (dtb__486) -> ((v_termHasUnsolvedMeta mc0) dtb__486)
  | B_dData_dMaybe.C_Maybe_Nothing -> false
  | _ -> failwith "DT: impossible branch"
))
# 439 "Vuna/Compiler/Core/Term.vuna"
and v_termHasUnsolvedMetaArgs = (fun (mc0 : t_Sols) (mc1 : (t_Term, t_Rig) B_dData_dPair.t_Pair B_dData_dList.t_List) -> (match mc1 with
  | B_dData_dList.C_List__x58__x58_ (dtb__487, dtb__488) -> (match dtb__487 with
  | { B_dData_dPair.f_Pair_first = dtb__489; B_dData_dPair.f_Pair_second = dtb__490 } -> (if ((v_termHasUnsolvedMeta mc0) dtb__489) then true else ((v_termHasUnsolvedMetaArgs mc0) dtb__488))
  | _ -> failwith "DT: impossible branch"
)
  | B_dData_dList.C_List_Nil -> false
  | _ -> failwith "DT: impossible branch"
))
# 444 "Vuna/Compiler/Core/Term.vuna"
and v_termHasUnsolvedMetaAlts = (fun (mc0 : t_Sols) (mc1 : t_CaseAlt B_dData_dList.t_List) -> (match mc1 with
  | B_dData_dList.C_List__x58__x58_ (dtb__491, dtb__492) -> (if ((v_termHasUnsolvedMeta mc0) (v_caseAltBody dtb__491)) then true else ((v_termHasUnsolvedMetaAlts mc0) dtb__492))
  | B_dData_dList.C_List_Nil -> false
  | _ -> failwith "DT: impossible branch"
))

# 451 "Vuna/Compiler/Core/Term.vuna"
let rec v_termUsesFloat = (fun (mc0 : string B_dData_dList.t_List) (mc1 : t_Term) -> (match mc1 with
  | C_Term_TIf (dtb__493, dtb__494, dtb__495) -> (if (if ((v_termUsesFloat mc0) dtb__493) then true else ((v_termUsesFloat mc0) dtb__494)) then true else ((v_termUsesFloat mc0) dtb__495))
  | C_Term_TBool (dtb__496) -> false
  | C_Term_TStr (dtb__497) -> false
  | C_Term_TInt (dtb__498) -> false
  | C_Term_TCase (dtb__499, dtb__500) -> (if ((v_termUsesFloat mc0) dtb__499) then true else ((v_anyAltUsesFloat mc0) dtb__500))
  | C_Term_TRecUpd (dtb__501, dtb__502, dtb__503, dtb__504, dtb__505) -> (if ((v_termUsesFloat mc0) dtb__501) then true else ((v_termUsesFloat mc0) dtb__505))
  | C_Term_TProj (dtb__506, dtb__507, dtb__508, dtb__509, dtb__510) -> ((v_termUsesFloat mc0) dtb__506)
  | C_Term_TRecord (dtb__511, dtb__512) -> ((v_anyArgUsesFloat mc0) dtb__512)
  | C_Term_TMk (dtb__513, dtb__514) -> ((v_anyArgUsesFloat mc0) dtb__514)
  | C_Term_TCon (dtb__515, dtb__516) -> ((v_anyArgUsesFloat mc0) dtb__516)
  | C_Term_TApp (dtb__517, dtb__518, dtb__519) -> (if ((v_termUsesFloat mc0) dtb__517) then true else ((v_termUsesFloat mc0) dtb__518))
  | C_Term_TLam (dtb__520, dtb__521, dtb__522, dtb__523, dtb__524) -> ((v_termUsesFloat mc0) dtb__524)
  | C_Term_TPi (dtb__525, dtb__526, dtb__527, dtb__528, dtb__529) -> (if ((v_termUsesFloat mc0) dtb__528) then true else ((v_termUsesFloat mc0) dtb__529))
  | C_Term_TType (dtb__530) -> false
  | C_Term_TMeta (dtb__531) -> false
  | C_Term_TVar (dtb__532, dtb__533, dtb__534) -> false
  | C_Term_TGlobal (dtb__535) -> ((B_dData_dList.v_memName dtb__535) mc0)
  | C_Term_TFloat (dtb__536) -> true
  | _ -> failwith "DT: impossible branch"
))
# 474 "Vuna/Compiler/Core/Term.vuna"
and v_anyArgUsesFloat = (fun (mc0 : string B_dData_dList.t_List) (mc1 : (t_Term, t_Rig) B_dData_dPair.t_Pair B_dData_dList.t_List) -> (match mc1 with
  | B_dData_dList.C_List__x58__x58_ (dtb__537, dtb__538) -> (match dtb__537 with
  | { B_dData_dPair.f_Pair_first = dtb__539; B_dData_dPair.f_Pair_second = dtb__540 } -> (if ((v_termUsesFloat mc0) dtb__539) then true else ((v_anyArgUsesFloat mc0) dtb__538))
  | _ -> failwith "DT: impossible branch"
)
  | B_dData_dList.C_List_Nil -> false
  | _ -> failwith "DT: impossible branch"
))
# 479 "Vuna/Compiler/Core/Term.vuna"
and v_anyAltUsesFloat = (fun (mc0 : string B_dData_dList.t_List) (mc1 : t_CaseAlt B_dData_dList.t_List) -> (match mc1 with
  | B_dData_dList.C_List__x58__x58_ (dtb__541, dtb__542) -> (if ((v_termUsesFloat mc0) (v_caseAltBody dtb__541)) then true else ((v_anyAltUsesFloat mc0) dtb__542))
  | B_dData_dList.C_List_Nil -> false
  | _ -> failwith "DT: impossible branch"
))

# 485 "Vuna/Compiler/Core/Term.vuna"
let rec v_termGlobalNames = (fun (mc0 : t_Term) -> (match mc0 with
  | C_Term_TIf (dtb__543, dtb__544, dtb__545) -> ((B_dData_dList.v_append (v_termGlobalNames dtb__543)) ((B_dData_dList.v_append (v_termGlobalNames dtb__544)) (v_termGlobalNames dtb__545)))
  | C_Term_TBool (dtb__546) -> B_dData_dList.C_List_Nil
  | C_Term_TStr (dtb__547) -> B_dData_dList.C_List_Nil
  | C_Term_TInt (dtb__548) -> B_dData_dList.C_List_Nil
  | C_Term_TCase (dtb__549, dtb__550) -> ((B_dData_dList.v_append (v_termGlobalNames dtb__549)) ((B_dData_dList.v_concatMap (fun (a : t_CaseAlt) -> (v_termGlobalNames (v_caseAltBody a)))) dtb__550))
  | C_Term_TRecUpd (dtb__551, dtb__552, dtb__553, dtb__554, dtb__555) -> ((B_dData_dList.v_append (v_termGlobalNames dtb__551)) (v_termGlobalNames dtb__555))
  | C_Term_TProj (dtb__556, dtb__557, dtb__558, dtb__559, dtb__560) -> (v_termGlobalNames dtb__556)
  | C_Term_TRecord (dtb__561, dtb__562) -> (B_dData_dList.C_List__x58__x58_ (dtb__561, ((B_dData_dList.v_concatMap (fun (p : (t_Term, t_Rig) B_dData_dPair.t_Pair) -> (v_termGlobalNames (B_dData_dPair.v_firstOf p)))) dtb__562)))
  | C_Term_TMk (dtb__563, dtb__564) -> ((B_dData_dList.v_concatMap (fun (p : (t_Term, t_Rig) B_dData_dPair.t_Pair) -> (v_termGlobalNames (B_dData_dPair.v_firstOf p)))) dtb__564)
  | C_Term_TCon (dtb__565, dtb__566) -> ((B_dData_dList.v_concatMap (fun (p : (t_Term, t_Rig) B_dData_dPair.t_Pair) -> (v_termGlobalNames (B_dData_dPair.v_firstOf p)))) dtb__566)
  | C_Term_TApp (dtb__567, dtb__568, dtb__569) -> ((B_dData_dList.v_append (v_termGlobalNames dtb__567)) (v_termGlobalNames dtb__568))
  | C_Term_TLam (dtb__570, dtb__571, dtb__572, dtb__573, dtb__574) -> (v_termGlobalNames dtb__574)
  | C_Term_TPi (dtb__575, dtb__576, dtb__577, dtb__578, dtb__579) -> ((B_dData_dList.v_append (v_termGlobalNames dtb__578)) (v_termGlobalNames dtb__579))
  | C_Term_TType (dtb__580) -> B_dData_dList.C_List_Nil
  | C_Term_TMeta (dtb__581) -> B_dData_dList.C_List_Nil
  | C_Term_TVar (dtb__582, dtb__583, dtb__584) -> B_dData_dList.C_List_Nil
  | C_Term_TGlobal (dtb__585) -> (B_dData_dList.C_List__x58__x58_ (dtb__585, B_dData_dList.C_List_Nil))
  | C_Term_TFloat (dtb__586) -> B_dData_dList.C_List_Nil
  | _ -> failwith "DT: impossible branch"
))

# 512 "Vuna/Compiler/Core/Term.vuna"
let rec v_hasFreeVar = (fun (mc0 : int) (mc1 : t_Term) -> (match mc1 with
  | C_Term_TIf (dtb__587, dtb__588, dtb__589) -> (if (if ((v_hasFreeVar mc0) dtb__587) then true else ((v_hasFreeVar mc0) dtb__588)) then true else ((v_hasFreeVar mc0) dtb__589))
  | C_Term_TBool (dtb__590) -> false
  | C_Term_TFloat (dtb__591) -> false
  | C_Term_TStr (dtb__592) -> false
  | C_Term_TInt (dtb__593) -> false
  | C_Term_TCase (dtb__594, dtb__595) -> (if ((v_hasFreeVar mc0) dtb__594) then true else ((v_hasFreeVarAlts mc0) dtb__595))
  | C_Term_TRecUpd (dtb__596, dtb__597, dtb__598, dtb__599, dtb__600) -> (if ((v_hasFreeVar mc0) dtb__596) then true else ((v_hasFreeVar (mc0 + (B_dData_dList.v_length dtb__598))) dtb__600))
  | C_Term_TProj (dtb__601, dtb__602, dtb__603, dtb__604, dtb__605) -> ((v_hasFreeVar mc0) dtb__601)
  | C_Term_TRecord (dtb__606, dtb__607) -> ((v_hasFreeVarArgs mc0) dtb__607)
  | C_Term_TMk (dtb__608, dtb__609) -> ((v_hasFreeVarArgs mc0) dtb__609)
  | C_Term_TCon (dtb__610, dtb__611) -> ((v_hasFreeVarArgs mc0) dtb__611)
  | C_Term_TApp (dtb__612, dtb__613, dtb__614) -> (if ((v_hasFreeVar mc0) dtb__612) then true else ((v_hasFreeVar mc0) dtb__613))
  | C_Term_TLam (dtb__615, dtb__616, dtb__617, dtb__618, dtb__619) -> (let tys = (let nd_uscrut7 = dtb__617 in (match nd_uscrut7 with
  | B_dData_dMaybe.C_Maybe_Just (dtb__620) -> (match dtb__620 with
  | { B_dData_dPair.f_Pair_first = dtb__621; B_dData_dPair.f_Pair_second = dtb__622 } -> (match dtb__622 with
  | { B_dData_dPair.f_Pair_first = dtb__623; B_dData_dPair.f_Pair_second = dtb__624 } -> (if ((v_hasFreeVarMaybe mc0) dtb__623) then true else ((v_hasFreeVarMaybe (mc0 + 1)) dtb__624))
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
)
  | B_dData_dMaybe.C_Maybe_Nothing -> false
  | _ -> failwith "DT: impossible branch"
)) in (if tys then true else ((v_hasFreeVar (mc0 + 1)) dtb__619)))
  | C_Term_TPi (dtb__625, dtb__626, dtb__627, dtb__628, dtb__629) -> (if ((v_hasFreeVar mc0) dtb__628) then true else ((v_hasFreeVar (mc0 + 1)) dtb__629))
  | C_Term_TType (dtb__630) -> false
  | C_Term_TGlobal (dtb__631) -> false
  | C_Term_TMeta (dtb__632) -> false
  | C_Term_TVar (dtb__633, dtb__634, dtb__635) -> (dtb__634 >= mc0)
  | _ -> failwith "DT: impossible branch"
))
# 540 "Vuna/Compiler/Core/Term.vuna"
and v_hasFreeVarMaybe = (fun (mc0 : int) (mc1 : t_Term B_dData_dMaybe.t_Maybe) -> (match mc1 with
  | B_dData_dMaybe.C_Maybe_Just (dtb__636) -> ((v_hasFreeVar mc0) dtb__636)
  | B_dData_dMaybe.C_Maybe_Nothing -> false
  | _ -> failwith "DT: impossible branch"
))
# 544 "Vuna/Compiler/Core/Term.vuna"
and v_hasFreeVarArgs = (fun (mc0 : int) (mc1 : (t_Term, t_Rig) B_dData_dPair.t_Pair B_dData_dList.t_List) -> (match mc1 with
  | B_dData_dList.C_List__x58__x58_ (dtb__637, dtb__638) -> (match dtb__637 with
  | { B_dData_dPair.f_Pair_first = dtb__639; B_dData_dPair.f_Pair_second = dtb__640 } -> (if ((v_hasFreeVar mc0) dtb__639) then true else ((v_hasFreeVarArgs mc0) dtb__638))
  | _ -> failwith "DT: impossible branch"
)
  | B_dData_dList.C_List_Nil -> false
  | _ -> failwith "DT: impossible branch"
))
# 548 "Vuna/Compiler/Core/Term.vuna"
and v_hasFreeVarAlts = (fun (mc0 : int) (mc1 : t_CaseAlt B_dData_dList.t_List) -> (match mc1 with
  | B_dData_dList.C_List__x58__x58_ (dtb__641, dtb__642) -> (if ((v_hasFreeVar (mc0 + (B_dData_dList.v_length (v_caseAltBinders dtb__641)))) (v_caseAltBody dtb__641)) then true else ((v_hasFreeVarAlts mc0) dtb__642))
  | B_dData_dList.C_List_Nil -> false
  | _ -> failwith "DT: impossible branch"
))

# 553 "Vuna/Compiler/Core/Term.vuna"
let rec v_hasMeta = (fun (mc0 : int) (mc1 : int) (mc2 : t_Term) -> (match mc2 with
  | C_Term_TIf (dtb__643, dtb__644, dtb__645) -> (if (if (((v_hasMeta mc0) mc1) dtb__643) then true else (((v_hasMeta mc0) mc1) dtb__644)) then true else (((v_hasMeta mc0) mc1) dtb__645))
  | C_Term_TBool (dtb__646) -> false
  | C_Term_TFloat (dtb__647) -> false
  | C_Term_TStr (dtb__648) -> false
  | C_Term_TInt (dtb__649) -> false
  | C_Term_TCase (dtb__650, dtb__651) -> (if (((v_hasMeta mc0) mc1) dtb__650) then true else (((v_hasMetaAlts mc0) mc1) dtb__651))
  | C_Term_TRecUpd (dtb__652, dtb__653, dtb__654, dtb__655, dtb__656) -> (if (((v_hasMeta mc0) mc1) dtb__652) then true else (((v_hasMeta mc0) (mc1 + (B_dData_dList.v_length dtb__654))) dtb__656))
  | C_Term_TProj (dtb__657, dtb__658, dtb__659, dtb__660, dtb__661) -> (((v_hasMeta mc0) mc1) dtb__657)
  | C_Term_TRecord (dtb__662, dtb__663) -> (((v_hasMetaArgs mc0) mc1) dtb__663)
  | C_Term_TMk (dtb__664, dtb__665) -> (((v_hasMetaArgs mc0) mc1) dtb__665)
  | C_Term_TCon (dtb__666, dtb__667) -> (((v_hasMetaArgs mc0) mc1) dtb__667)
  | C_Term_TApp (dtb__668, dtb__669, dtb__670) -> (if (((v_hasMeta mc0) mc1) dtb__668) then true else (((v_hasMeta mc0) mc1) dtb__669))
  | C_Term_TLam (dtb__671, dtb__672, dtb__673, dtb__674, dtb__675) -> (let tys = (let nd_uscrut8 = dtb__673 in (match nd_uscrut8 with
  | B_dData_dMaybe.C_Maybe_Just (dtb__676) -> (match dtb__676 with
  | { B_dData_dPair.f_Pair_first = dtb__677; B_dData_dPair.f_Pair_second = dtb__678 } -> (match dtb__678 with
  | { B_dData_dPair.f_Pair_first = dtb__679; B_dData_dPair.f_Pair_second = dtb__680 } -> (if (((v_hasMetaMaybe mc0) mc1) dtb__679) then true else (((v_hasMetaMaybe mc0) (mc1 + 1)) dtb__680))
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
)
  | B_dData_dMaybe.C_Maybe_Nothing -> false
  | _ -> failwith "DT: impossible branch"
)) in (if tys then true else (((v_hasMeta mc0) (mc1 + 1)) dtb__675)))
  | C_Term_TPi (dtb__681, dtb__682, dtb__683, dtb__684, dtb__685) -> (if (((v_hasMeta mc0) mc1) dtb__684) then true else (((v_hasMeta mc0) (mc1 + 1)) dtb__685))
  | C_Term_TType (dtb__686) -> false
  | C_Term_TGlobal (dtb__687) -> false
  | C_Term_TVar (dtb__688, dtb__689, dtb__690) -> false
  | C_Term_TMeta (dtb__691) -> (mc0 = dtb__691)
  | _ -> failwith "DT: impossible branch"
))
# 580 "Vuna/Compiler/Core/Term.vuna"
and v_hasMetaMaybe = (fun (mc0 : int) (mc1 : int) (mc2 : t_Term B_dData_dMaybe.t_Maybe) -> (match mc2 with
  | B_dData_dMaybe.C_Maybe_Just (dtb__692) -> (((v_hasMeta mc0) mc1) dtb__692)
  | B_dData_dMaybe.C_Maybe_Nothing -> false
  | _ -> failwith "DT: impossible branch"
))
# 584 "Vuna/Compiler/Core/Term.vuna"
and v_hasMetaArgs = (fun (mc0 : int) (mc1 : int) (mc2 : (t_Term, t_Rig) B_dData_dPair.t_Pair B_dData_dList.t_List) -> (match mc2 with
  | B_dData_dList.C_List__x58__x58_ (dtb__693, dtb__694) -> (match dtb__693 with
  | { B_dData_dPair.f_Pair_first = dtb__695; B_dData_dPair.f_Pair_second = dtb__696 } -> (if (((v_hasMeta mc0) mc1) dtb__695) then true else (((v_hasMetaArgs mc0) mc1) dtb__694))
  | _ -> failwith "DT: impossible branch"
)
  | B_dData_dList.C_List_Nil -> false
  | _ -> failwith "DT: impossible branch"
))
# 588 "Vuna/Compiler/Core/Term.vuna"
and v_hasMetaAlts = (fun (mc0 : int) (mc1 : int) (mc2 : t_CaseAlt B_dData_dList.t_List) -> (match mc2 with
  | B_dData_dList.C_List__x58__x58_ (dtb__697, dtb__698) -> (if (((v_hasMeta mc0) (mc1 + (B_dData_dList.v_length (v_caseAltBinders dtb__697)))) (v_caseAltBody dtb__697)) then true else (((v_hasMetaAlts mc0) mc1) dtb__698))
  | B_dData_dList.C_List_Nil -> false
  | _ -> failwith "DT: impossible branch"
))

# 705 "Vuna/Compiler/Core/Term.vuna"
let rec v_substVarAt = (fun (mc0 : int) (mc1 : t_Term) (mc2 : t_Term) -> (match mc2 with
  | C_Term_TIf (dtb__699, dtb__700, dtb__701) -> (C_Term_TIf ((((v_substVarAt mc0) mc1) dtb__699), (((v_substVarAt mc0) mc1) dtb__700), (((v_substVarAt mc0) mc1) dtb__701)))
  | C_Term_TBool (dtb__702) -> mc2
  | C_Term_TFloat (dtb__703) -> mc2
  | C_Term_TStr (dtb__704) -> mc2
  | C_Term_TInt (dtb__705) -> mc2
  | C_Term_TCase (dtb__706, dtb__707) -> (C_Term_TCase ((((v_substVarAt mc0) mc1) dtb__706), ((B_dData_dList.v_map ((v_substAltAt mc0) mc1)) dtb__707)))
  | C_Term_TRecUpd (dtb__708, dtb__709, dtb__710, dtb__711, dtb__712) -> (C_Term_TRecUpd ((((v_substVarAt mc0) mc1) dtb__708), dtb__709, dtb__710, dtb__711, (((v_substVarAt (mc0 + (B_dData_dList.v_length dtb__710))) mc1) dtb__712)))
  | C_Term_TProj (dtb__713, dtb__714, dtb__715, dtb__716, dtb__717) -> (C_Term_TProj ((((v_substVarAt mc0) mc1) dtb__713), dtb__714, dtb__715, dtb__716, dtb__717))
  | C_Term_TRecord (dtb__718, dtb__719) -> (C_Term_TRecord (dtb__718, ((B_dData_dList.v_map (fun (p : (t_Term, t_Rig) B_dData_dPair.t_Pair) -> { B_dData_dPair.f_Pair_first = (((v_substVarAt mc0) mc1) (B_dData_dPair.v_firstOf p)); B_dData_dPair.f_Pair_second = (B_dData_dPair.v_secondOf p) })) dtb__719)))
  | C_Term_TMk (dtb__720, dtb__721) -> (C_Term_TMk (dtb__720, ((B_dData_dList.v_map (fun (p : (t_Term, t_Rig) B_dData_dPair.t_Pair) -> { B_dData_dPair.f_Pair_first = (((v_substVarAt mc0) mc1) (B_dData_dPair.v_firstOf p)); B_dData_dPair.f_Pair_second = (B_dData_dPair.v_secondOf p) })) dtb__721)))
  | C_Term_TCon (dtb__722, dtb__723) -> (C_Term_TCon (dtb__722, ((B_dData_dList.v_map (fun (p : (t_Term, t_Rig) B_dData_dPair.t_Pair) -> { B_dData_dPair.f_Pair_first = (((v_substVarAt mc0) mc1) (B_dData_dPair.v_firstOf p)); B_dData_dPair.f_Pair_second = (B_dData_dPair.v_secondOf p) })) dtb__723)))
  | C_Term_TApp (dtb__724, dtb__725, dtb__726) -> (C_Term_TApp ((((v_substVarAt mc0) mc1) dtb__724), (((v_substVarAt mc0) mc1) dtb__725), dtb__726))
  | C_Term_TLam (dtb__727, dtb__728, dtb__729, dtb__730, dtb__731) -> (let slot2 = (let nd_uscrut8 = dtb__729 in (match nd_uscrut8 with
  | B_dData_dMaybe.C_Maybe_Just (dtb__732) -> (match dtb__732 with
  | { B_dData_dPair.f_Pair_first = dtb__733; B_dData_dPair.f_Pair_second = dtb__734 } -> (match dtb__734 with
  | { B_dData_dPair.f_Pair_first = dtb__735; B_dData_dPair.f_Pair_second = dtb__736 } -> (let bt2 = (match dtb__735 with
  | B_dData_dMaybe.C_Maybe_Nothing -> B_dData_dMaybe.C_Maybe_Nothing
  | B_dData_dMaybe.C_Maybe_Just (dtb__738) -> (B_dData_dMaybe.C_Maybe_Just ((((v_substVarAt mc0) mc1) dtb__738)))
  | _ -> failwith "DT: impossible branch"
) in (let rt2 = (match dtb__736 with
  | B_dData_dMaybe.C_Maybe_Nothing -> B_dData_dMaybe.C_Maybe_Nothing
  | B_dData_dMaybe.C_Maybe_Just (dtb__737) -> (B_dData_dMaybe.C_Maybe_Just ((((v_substVarAt (mc0 + 1)) mc1) dtb__737)))
  | _ -> failwith "DT: impossible branch"
) in (B_dData_dMaybe.C_Maybe_Just ({ B_dData_dPair.f_Pair_first = dtb__733; B_dData_dPair.f_Pair_second = { B_dData_dPair.f_Pair_first = bt2; B_dData_dPair.f_Pair_second = rt2 } }))))
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
)
  | B_dData_dMaybe.C_Maybe_Nothing -> B_dData_dMaybe.C_Maybe_Nothing
  | _ -> failwith "DT: impossible branch"
)) in (C_Term_TLam (dtb__727, dtb__728, slot2, dtb__730, (((v_substVarAt (mc0 + 1)) mc1) dtb__731))))
  | C_Term_TPi (dtb__739, dtb__740, dtb__741, dtb__742, dtb__743) -> (C_Term_TPi (dtb__739, dtb__740, dtb__741, (((v_substVarAt mc0) mc1) dtb__742), (((v_substVarAt (mc0 + 1)) mc1) dtb__743)))
  | C_Term_TType (dtb__744) -> mc2
  | C_Term_TGlobal (dtb__745) -> mc2
  | C_Term_TMeta (dtb__746) -> mc2
  | C_Term_TVar (dtb__747, dtb__748, dtb__749) -> (if (dtb__748 = mc0) then mc1 else mc2)
  | _ -> failwith "DT: impossible branch"
))
# 748 "Vuna/Compiler/Core/Term.vuna"
and v_substAltAt = (fun (idx : int) (arg : t_Term) (alt : t_CaseAlt) -> { f_CaseAlt_caseAltName = (v_caseAltName alt); f_CaseAlt_caseAltBinders = (v_caseAltBinders alt); f_CaseAlt_caseAltBody = (((v_substVarAt (idx + (B_dData_dList.v_length (v_caseAltBinders alt)))) arg) (v_caseAltBody alt)) })

# 1028 "Vuna/Compiler/Core/Term.vuna"
let rec v_showTerm = (fun (mc0 : t_Term) -> (match mc0 with
  | C_Term_TIf (dtb__750, dtb__751, dtb__752) -> (String.concat "" ["if "; (v_showTerm dtb__750); " then "; (v_showTerm dtb__751); " else "; (v_showTerm dtb__752)])
  | C_Term_TBool (dtb__753) -> (if dtb__753 then "True" else "False")
  | C_Term_TFloat (dtb__754) -> dtb__754
  | C_Term_TStr (dtb__755) -> (v_showCoreString dtb__755)
  | C_Term_TInt (dtb__756) -> (bi_strFromInt dtb__756)
  | C_Term_TCase (dtb__757, dtb__758) -> (String.concat "" ["case "; (v_showTerm dtb__757); " of "; (v_showCoreAlts dtb__758)])
  | C_Term_TRecUpd (dtb__759, dtb__760, dtb__761, dtb__762, dtb__763) -> (String.concat "" [(v_showTerm dtb__759); " with "; dtb__760; " "; (v_showTerm dtb__763)])
  | C_Term_TProj (dtb__764, dtb__765, dtb__766, dtb__767, dtb__768) -> (String.concat "" [(v_showTerm dtb__764); "."; dtb__765; "#"; (bi_strFromInt dtb__768)])
  | C_Term_TRecord (dtb__769, dtb__770) -> ((v_recordAppShow dtb__769) dtb__770)
  | C_Term_TMk (dtb__771, dtb__772) -> (String.concat "" ["("; dtb__771; (v_showArgTerms dtb__772); ")"])
  | C_Term_TCon (dtb__773, dtb__774) -> (String.concat "" ["("; dtb__773; (v_showArgTerms dtb__774); ")"])
  | C_Term_TApp (dtb__775, dtb__776, dtb__777) -> (String.concat "" ["("; (v_showTerm dtb__775); " "; (v_showTerm dtb__776); ")"])
  | C_Term_TLam (dtb__778, dtb__779, dtb__780, dtb__781, dtb__782) -> (String.concat "" ["\\"; dtb__778; " => "; (v_showTerm dtb__782)])
  | C_Term_TPi (dtb__783, dtb__784, dtb__785, dtb__786, dtb__787) -> (if (dtb__783 = "_") then (String.concat "" [(v_showTerm dtb__786); " -> "; (v_showTerm dtb__787)]) else (if dtb__784 then (String.concat "" ["{"; dtb__783; " : "; (v_showTerm dtb__786); "} -> "; (v_showTerm dtb__787)]) else (String.concat "" ["("; dtb__783; " : "; (v_showTerm dtb__786); ") -> "; (v_showTerm dtb__787)])))
  | C_Term_TType (dtb__788) -> (if ((v_levelToInt dtb__788) = 0) then "Type" else ("Type " ^ (bi_strFromInt (v_levelToInt dtb__788))))
  | C_Term_TGlobal (dtb__789) -> dtb__789
  | C_Term_TMeta (dtb__790) -> ("?" ^ (bi_strFromInt dtb__790))
  | C_Term_TVar (dtb__791, dtb__792, dtb__793) -> dtb__791
  | _ -> failwith "DT: impossible branch"
))
# 1085 "Vuna/Compiler/Core/Term.vuna"
and v_showArgTerms = (fun (mc0 : (t_Term, t_Rig) B_dData_dPair.t_Pair B_dData_dList.t_List) -> (match mc0 with
  | B_dData_dList.C_List__x58__x58_ (dtb__794, dtb__795) -> (match dtb__794 with
  | { B_dData_dPair.f_Pair_first = dtb__796; B_dData_dPair.f_Pair_second = dtb__797 } -> (String.concat "" [" "; (v_showTerm dtb__796); (v_showArgTerms dtb__795)])
  | _ -> failwith "DT: impossible branch"
)
  | B_dData_dList.C_List_Nil -> ""
  | _ -> failwith "DT: impossible branch"
))
# 1090 "Vuna/Compiler/Core/Term.vuna"
and v_recordAppShow = (fun (mc0 : string) (mc1 : (t_Term, t_Rig) B_dData_dPair.t_Pair B_dData_dList.t_List) -> (match mc1 with
  | B_dData_dList.C_List__x58__x58_ (dtb__798, dtb__799) -> (match dtb__798 with
  | { B_dData_dPair.f_Pair_first = dtb__800; B_dData_dPair.f_Pair_second = dtb__801 } -> ((v_recordAppShow (String.concat "" ["("; mc0; " "; (v_showTerm dtb__800); ")"])) dtb__799)
  | _ -> failwith "DT: impossible branch"
)
  | B_dData_dList.C_List_Nil -> mc0
  | _ -> failwith "DT: impossible branch"
))
# 1100 "Vuna/Compiler/Core/Term.vuna"
and v_showCoreAlts = (fun (mc0 : t_CaseAlt B_dData_dList.t_List) -> (match mc0 with
  | B_dData_dList.C_List__x58__x58_ (dtb__802, dtb__803) -> (String.concat "" [(v_caseAltName dtb__802); (v_showBinders (v_binderPairs (v_caseAltBinders dtb__802))); " => "; (v_showTerm (v_caseAltBody dtb__802)); " | "; (v_showCoreAlts dtb__803)])
  | B_dData_dList.C_List_Nil -> ""
  | _ -> failwith "DT: impossible branch"
))

# 1060 "Vuna/Compiler/Core/Term.vuna"
let rec v_showPiSig = (fun (name : string) (implicit : bool) (dom : t_Term) (cod : t_Term) -> (if (name = "_") then (String.concat "" [(v_showSigParenIfPi dom); " -> "; (v_showTypeSig cod)]) else (if implicit then (String.concat "" ["{"; name; " : "; (v_showTypeSig dom); "} -> "; (v_showTypeSig cod)]) else (String.concat "" ["("; name; " : "; (v_showTypeSig dom); ") -> "; (v_showTypeSig cod)]))))
# 1069 "Vuna/Compiler/Core/Term.vuna"
and v_showTypeSig = (fun (mc0 : t_Term) -> (match mc0 with
  | C_Term_TRecord (dtb__804, dtb__805) -> ((v_showSigAppText dtb__804) dtb__805)
  | C_Term_TCon (dtb__806, dtb__807) -> (match dtb__807 with
  | B_dData_dList.C_List_Nil -> dtb__806
  | _ -> (String.concat "" ["("; dtb__806; (v_showSigArgs dtb__807); ")"])
)
  | C_Term_TApp (dtb__808, dtb__809, dtb__810) -> (String.concat "" ["("; (v_showSigParenIfPi dtb__808); " "; (v_showSigParenIfPi dtb__809); ")"])
  | C_Term_TPi (dtb__811, dtb__812, dtb__813, dtb__814, dtb__815) -> ((((v_showPiSig dtb__811) dtb__812) dtb__814) dtb__815)
  | _ -> (v_showTerm mc0)
))
# 1077 "Vuna/Compiler/Core/Term.vuna"
and v_showSigParenIfPi = (fun (mc0 : t_Term) -> (match mc0 with
  | C_Term_TPi (dtb__816, dtb__817, dtb__818, dtb__819, dtb__820) -> (String.concat "" ["("; ((((v_showPiSig dtb__816) dtb__817) dtb__819) dtb__820); ")"])
  | _ -> (v_showTypeSig mc0)
))
# 1081 "Vuna/Compiler/Core/Term.vuna"
and v_showSigArgs = (fun (mc0 : (t_Term, t_Rig) B_dData_dPair.t_Pair B_dData_dList.t_List) -> (match mc0 with
  | B_dData_dList.C_List__x58__x58_ (dtb__821, dtb__822) -> (match dtb__821 with
  | { B_dData_dPair.f_Pair_first = dtb__823; B_dData_dPair.f_Pair_second = dtb__824 } -> (String.concat "" [" "; (v_showSigParenIfPi dtb__823); (v_showSigArgs dtb__822)])
  | _ -> failwith "DT: impossible branch"
)
  | B_dData_dList.C_List_Nil -> ""
  | _ -> failwith "DT: impossible branch"
))
# 1095 "Vuna/Compiler/Core/Term.vuna"
and v_showSigAppText = (fun (mc0 : string) (mc1 : (t_Term, t_Rig) B_dData_dPair.t_Pair B_dData_dList.t_List) -> (match mc1 with
  | B_dData_dList.C_List__x58__x58_ (dtb__825, dtb__826) -> (match dtb__825 with
  | { B_dData_dPair.f_Pair_first = dtb__827; B_dData_dPair.f_Pair_second = dtb__828 } -> ((v_showSigAppText (String.concat "" ["("; mc0; " "; (v_showSigParenIfPi dtb__827); ")"])) dtb__826)
  | _ -> failwith "DT: impossible branch"
)
  | B_dData_dList.C_List_Nil -> mc0
  | _ -> failwith "DT: impossible branch"
))

# 192 "Vuna/Compiler/Core/Term.vuna"
let v_closureEnv = (fun (p : t_Closure) -> (match p with
  | { f_Closure_closureEnv = dtb__829; f_Closure_closureBody = dtb__830 } -> dtb__829
  | _ -> failwith "DT: impossible branch"
))

# 193 "Vuna/Compiler/Core/Term.vuna"
let v_closureBody = (fun (p : t_Closure) -> (match p with
  | { f_Closure_closureEnv = dtb__831; f_Closure_closureBody = dtb__832 } -> dtb__832
  | _ -> failwith "DT: impossible branch"
))

# 222 "Vuna/Compiler/Core/Term.vuna"
let v_vCaseAltName = (fun (p : t_VCaseAlt) -> (match p with
  | { f_VCaseAlt_vCaseAltName = dtb__833; f_VCaseAlt_vCaseAltBinders = dtb__834; f_VCaseAlt_vCaseAltClosure = dtb__835 } -> dtb__833
  | _ -> failwith "DT: impossible branch"
))

# 223 "Vuna/Compiler/Core/Term.vuna"
let v_vCaseAltBinders = (fun (p : t_VCaseAlt) -> (match p with
  | { f_VCaseAlt_vCaseAltName = dtb__836; f_VCaseAlt_vCaseAltBinders = dtb__837; f_VCaseAlt_vCaseAltClosure = dtb__838 } -> dtb__837
  | _ -> failwith "DT: impossible branch"
))

# 224 "Vuna/Compiler/Core/Term.vuna"
let v_vCaseAltClosure = (fun (p : t_VCaseAlt) -> (match p with
  | { f_VCaseAlt_vCaseAltName = dtb__839; f_VCaseAlt_vCaseAltBinders = dtb__840; f_VCaseAlt_vCaseAltClosure = dtb__841 } -> dtb__841
  | _ -> failwith "DT: impossible branch"
))

# 373 "Vuna/Compiler/Core/Term.vuna"
let v_solsTbl = (fun (p : t_Sols) -> (match p with
  | { f_Sols_solsTbl = dtb__842; f_Sols_solsList = dtb__843; f_Sols_solsDepth = dtb__844 } -> dtb__842
  | _ -> failwith "DT: impossible branch"
))

# 374 "Vuna/Compiler/Core/Term.vuna"
let v_solsList = (fun (p : t_Sols) -> (match p with
  | { f_Sols_solsTbl = dtb__845; f_Sols_solsList = dtb__846; f_Sols_solsDepth = dtb__847 } -> dtb__846
  | _ -> failwith "DT: impossible branch"
))

# 375 "Vuna/Compiler/Core/Term.vuna"
let v_solsDepth = (fun (p : t_Sols) -> (match p with
  | { f_Sols_solsTbl = dtb__848; f_Sols_solsList = dtb__849; f_Sols_solsDepth = dtb__850 } -> dtb__850
  | _ -> failwith "DT: impossible branch"
))
