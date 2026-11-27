open Vuna_runtime
type t_Rig = C_Rig_Rig0 | C_Rig_Rig1 | C_Rig_RigOmega
and t_Level = int
and t_Term = C_Term_TVar of (string) * (int) * (Base_dSource.t_Span) | C_Term_TMeta of (int) | C_Term_TGlobal of (string) | C_Term_TType of (t_Level) | C_Term_TPi of (string) * (bool) * (t_Rig) * (t_Term) * (t_Term) | C_Term_TLam of (string) * (t_Rig) * ((t_LamMark, (t_Term B_dData_dMaybe.t_Maybe, t_Term B_dData_dMaybe.t_Maybe) B_dData_dPair.t_Pair) B_dData_dPair.t_Pair B_dData_dMaybe.t_Maybe) * (Base_dSource.t_Span) * (t_Term) | C_Term_TApp of (t_Term) * (t_Term) * (t_Rig) | C_Term_TCon of (string) * ((t_Term, t_Rig) B_dData_dPair.t_Pair B_dData_dList.t_List) | C_Term_TMk of (string) * ((t_Term, t_Rig) B_dData_dPair.t_Pair B_dData_dList.t_List) | C_Term_TCase of (t_Term) * (t_CaseAlt B_dData_dList.t_List) | C_Term_TProj of (t_Term) * (string) * ((string, t_Rig) B_dData_dPair.t_Pair B_dData_dList.t_List) * (int) * (int) | C_Term_TRecUpd of (t_Term) * (string) * ((string, t_Rig) B_dData_dPair.t_Pair B_dData_dList.t_List) * (int B_dData_dList.t_List) * (t_Term) | C_Term_TInt of (int) | C_Term_TStr of (string) | C_Term_TBool of (bool) | C_Term_TIf of (t_Term) * (t_Term) * (t_Term) | C_Term_TFloat of (string) | C_Term_TRecord of (string) * ((t_Term, t_Rig) B_dData_dPair.t_Pair B_dData_dList.t_List)
and t_Binder = { f_Binder_binderName : string; f_Binder_binderRig : t_Rig; f_Binder_binderSpan : Base_dSource.t_Span }
and t_CaseAlt = { f_CaseAlt_caseAltName : string; f_CaseAlt_caseAltBinders : t_Binder B_dData_dList.t_List; f_CaseAlt_caseAltBody : t_Term }
and t_Closure = { f_Closure_closureEnv : t_Value B_dData_dList.t_List; f_Closure_closureBody : t_Term }
and t_Neutral = C_Neutral_NVar of (string) * (int) * (t_Value B_dData_dList.t_List) | C_Neutral_NGlobal of (string) * (t_Value B_dData_dList.t_List)
and t_Value = C_Value_VType of (t_Level) | C_Value_VPi of (string) * (bool) * (t_Rig) * (t_Value) * (t_Closure) | C_Value_VLam of (string) * (t_Rig) * (t_Closure) | C_Value_VNeutral of (t_Neutral) | C_Value_VMeta of (int) * (t_Value B_dData_dList.t_List) | C_Value_VApp of (t_Value) * (t_Value) | C_Value_VCon of (string) * (t_Value B_dData_dList.t_List) | C_Value_VCase of (t_Value) * (t_VCaseAlt B_dData_dList.t_List) | C_Value_VProj of (t_Value) * (string) * ((string, t_Rig) B_dData_dPair.t_Pair B_dData_dList.t_List) * (int) * (int) | C_Value_VInt of (int) | C_Value_VStr of (string) | C_Value_VBool of (bool) | C_Value_VIf of (t_Value) * (t_Value) * (t_Value) | C_Value_VFloat of (float)
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
let[@tail_mod_cons] rec v_termSizeArgTerms = (fun (mc0 : (t_Term, t_Rig) B_dData_dPair.t_Pair B_dData_dList.t_List) -> (match mc0 with
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

# 402 "Vuna/Compiler/Core/Term.vuna"
let v_metaScanBound = 262144

# 527 "Vuna/Compiler/Core/Term.vuna"
let v_defLookup = (fun (name : string) (tbl : (string, t_Term) B_dContainer_dHashMap.t_HashMap) -> ((((B_dContainer_dHashMap.v_lookup B_dData_dString.v_Hashable_ue4b0f10b020a5e82_uString) B_dData_dString.v_Eq_u018fc178ff3df1b4_uString) name) tbl))

# 613 "Vuna/Compiler/Core/Term.vuna"
let v_mapTermMaybe = (fun (mc0 : (t_Term) -> t_Term) (mc1 : t_Term B_dData_dMaybe.t_Maybe) -> (match mc1 with
  | B_dData_dMaybe.C_Maybe_Just (dtb__52) -> (B_dData_dMaybe.C_Maybe_Just ((mc0 dtb__52)))
  | B_dData_dMaybe.C_Maybe_Nothing -> B_dData_dMaybe.C_Maybe_Nothing
  | _ -> failwith "DT: impossible branch"
))

# 627 "Vuna/Compiler/Core/Term.vuna"
let v_lamMarkOf = (fun (mc0 : (t_LamMark, (t_Term B_dData_dMaybe.t_Maybe, t_Term B_dData_dMaybe.t_Maybe) B_dData_dPair.t_Pair) B_dData_dPair.t_Pair B_dData_dMaybe.t_Maybe) -> (match mc0 with
  | B_dData_dMaybe.C_Maybe_Just (dtb__53) -> (B_dData_dPair.v_firstOf dtb__53)
  | B_dData_dMaybe.C_Maybe_Nothing -> C_LamMark_LamPlain
  | _ -> failwith "DT: impossible branch"
))

# 631 "Vuna/Compiler/Core/Term.vuna"
let v_lamSlotTys = (fun (mc0 : (t_LamMark, (t_Term B_dData_dMaybe.t_Maybe, t_Term B_dData_dMaybe.t_Maybe) B_dData_dPair.t_Pair) B_dData_dPair.t_Pair B_dData_dMaybe.t_Maybe) -> (match mc0 with
  | B_dData_dMaybe.C_Maybe_Just (dtb__54) -> (B_dData_dMaybe.C_Maybe_Just ((B_dData_dPair.v_secondOf dtb__54)))
  | B_dData_dMaybe.C_Maybe_Nothing -> B_dData_dMaybe.C_Maybe_Nothing
  | _ -> failwith "DT: impossible branch"
))

# 635 "Vuna/Compiler/Core/Term.vuna"
let v_lamBinderTyOf = (fun (slot : (t_LamMark, (t_Term B_dData_dMaybe.t_Maybe, t_Term B_dData_dMaybe.t_Maybe) B_dData_dPair.t_Pair) B_dData_dPair.t_Pair B_dData_dMaybe.t_Maybe) -> (match (v_lamSlotTys slot) with
  | B_dData_dMaybe.C_Maybe_Nothing -> B_dData_dMaybe.C_Maybe_Nothing
  | B_dData_dMaybe.C_Maybe_Just (dtb__55) -> (B_dData_dPair.v_firstOf dtb__55)
  | _ -> failwith "DT: impossible branch"
))

# 641 "Vuna/Compiler/Core/Term.vuna"
let v_lamResultTyOf = (fun (slot : (t_LamMark, (t_Term B_dData_dMaybe.t_Maybe, t_Term B_dData_dMaybe.t_Maybe) B_dData_dPair.t_Pair) B_dData_dPair.t_Pair B_dData_dMaybe.t_Maybe) -> (match (v_lamSlotTys slot) with
  | B_dData_dMaybe.C_Maybe_Nothing -> B_dData_dMaybe.C_Maybe_Nothing
  | B_dData_dMaybe.C_Maybe_Just (dtb__56) -> (B_dData_dPair.v_secondOf dtb__56)
  | _ -> failwith "DT: impossible branch"
))

# 647 "Vuna/Compiler/Core/Term.vuna"
let v_lamTyOf = (fun (mc0 : t_Term B_dData_dMaybe.t_Maybe) (mc1 : t_Term B_dData_dMaybe.t_Maybe) -> (match mc0 with
  | B_dData_dMaybe.C_Maybe_Nothing -> (match mc1 with
  | B_dData_dMaybe.C_Maybe_Nothing -> B_dData_dMaybe.C_Maybe_Nothing
  | _ -> (B_dData_dMaybe.C_Maybe_Just ({ B_dData_dPair.f_Pair_first = C_LamMark_LamPlain; B_dData_dPair.f_Pair_second = { B_dData_dPair.f_Pair_first = mc0; B_dData_dPair.f_Pair_second = mc1 } }))
)
  | _ -> (B_dData_dMaybe.C_Maybe_Just ({ B_dData_dPair.f_Pair_first = C_LamMark_LamPlain; B_dData_dPair.f_Pair_second = { B_dData_dPair.f_Pair_first = mc0; B_dData_dPair.f_Pair_second = mc1 } }))
))

# 651 "Vuna/Compiler/Core/Term.vuna"
let v_markLamLinear = (fun (slot : (t_LamMark, (t_Term B_dData_dMaybe.t_Maybe, t_Term B_dData_dMaybe.t_Maybe) B_dData_dPair.t_Pair) B_dData_dPair.t_Pair B_dData_dMaybe.t_Maybe) -> (let tys = (match (v_lamSlotTys slot) with
  | B_dData_dMaybe.C_Maybe_Nothing -> (Obj.magic { B_dData_dPair.f_Pair_first = B_dData_dMaybe.C_Maybe_Nothing; B_dData_dPair.f_Pair_second = B_dData_dMaybe.C_Maybe_Nothing })
  | B_dData_dMaybe.C_Maybe_Just (dtb__57) -> dtb__57
  | _ -> failwith "DT: impossible branch"
) in (B_dData_dMaybe.C_Maybe_Just ({ B_dData_dPair.f_Pair_first = C_LamMark_LamLinearClosure; B_dData_dPair.f_Pair_second = tys }))))

# 660 "Vuna/Compiler/Core/Term.vuna"
let v_lamTyWithBinder = (fun (binderTy : t_Term B_dData_dMaybe.t_Maybe) -> ((v_lamTyOf binderTy) B_dData_dMaybe.C_Maybe_Nothing))

# 663 "Vuna/Compiler/Core/Term.vuna"
let v_lamTyWithResult = (fun (resultTy : t_Term B_dData_dMaybe.t_Maybe) -> ((v_lamTyOf B_dData_dMaybe.C_Maybe_Nothing) resultTy))

# 670 "Vuna/Compiler/Core/Term.vuna"
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
  | B_dData_dMaybe.C_Maybe_Nothing -> (Obj.magic B_dData_dMaybe.C_Maybe_Nothing)
  | B_dData_dMaybe.C_Maybe_Just (dtb__97) -> (B_dData_dMaybe.C_Maybe_Just ((((v_shift mc0) mc1) dtb__97)))
  | _ -> failwith "DT: impossible branch"
) in (let rt2 = (match dtb__95 with
  | B_dData_dMaybe.C_Maybe_Nothing -> (Obj.magic B_dData_dMaybe.C_Maybe_Nothing)
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
# 710 "Vuna/Compiler/Core/Term.vuna"
and v_shiftArgs = (fun (mc0 : int) (mc1 : int) (mc2 : (t_Term, t_Rig) B_dData_dPair.t_Pair B_dData_dList.t_List) -> (match mc2 with
  | B_dData_dList.C_List__x58__x58_ (dtb__109, dtb__110) -> (match dtb__109 with
  | { B_dData_dPair.f_Pair_first = dtb__111; B_dData_dPair.f_Pair_second = dtb__112 } -> (B_dData_dList.C_List__x58__x58_ ({ B_dData_dPair.f_Pair_first = (((v_shift mc0) mc1) dtb__111); B_dData_dPair.f_Pair_second = dtb__112 }, (((v_shiftArgs mc0) mc1) dtb__110)))
  | _ -> failwith "DT: impossible branch"
)
  | B_dData_dList.C_List_Nil -> B_dData_dList.C_List_Nil
  | _ -> failwith "DT: impossible branch"
))
# 715 "Vuna/Compiler/Core/Term.vuna"
and v_shiftAlts = (fun (mc0 : int) (mc1 : int) (mc2 : t_CaseAlt B_dData_dList.t_List) -> (match mc2 with
  | B_dData_dList.C_List__x58__x58_ (dtb__113, dtb__114) -> (B_dData_dList.C_List__x58__x58_ ((((v_shiftAlt mc0) mc1) dtb__113), (((v_shiftAlts mc0) mc1) dtb__114)))
  | B_dData_dList.C_List_Nil -> B_dData_dList.C_List_Nil
  | _ -> failwith "DT: impossible branch"
))
# 719 "Vuna/Compiler/Core/Term.vuna"
and v_shiftAlt = (fun (mc0 : int) (mc1 : int) (mc2 : t_CaseAlt) -> (match mc2 with
  | { f_CaseAlt_caseAltName = dtb__115; f_CaseAlt_caseAltBinders = dtb__116; f_CaseAlt_caseAltBody = dtb__117 } -> { f_CaseAlt_caseAltName = dtb__115; f_CaseAlt_caseAltBinders = dtb__116; f_CaseAlt_caseAltBody = (((v_shift (mc0 + (B_dData_dList.v_length dtb__116))) mc1) dtb__117) }
  | _ -> failwith "DT: impossible branch"
))

# 800 "Vuna/Compiler/Core/Term.vuna"
let rec v_substMetasFuel = (fun (fuel : int) (resolve : (int) -> (int) -> t_Term B_dData_dMaybe.t_Maybe) (depth : int) (t : t_Term) -> (if (fuel <= 0) then t else (match t with
  | C_Term_TMeta (dtb__118) -> (match ((resolve depth) dtb__118) with
  | B_dData_dMaybe.C_Maybe_Nothing -> t
  | B_dData_dMaybe.C_Maybe_Just (dtb__119) -> ((((v_substMetasFuel (fuel - 1)) resolve) depth) dtb__119)
  | _ -> failwith "DT: impossible branch"
)
  | C_Term_TPi (dtb__120, dtb__121, dtb__122, dtb__123, dtb__124) -> (C_Term_TPi (dtb__120, dtb__121, dtb__122, ((((v_substMetasFuel (fuel - 1)) resolve) depth) dtb__123), ((((v_substMetasFuel (fuel - 1)) resolve) (depth + 1)) dtb__124)))
  | C_Term_TLam (dtb__125, dtb__126, dtb__127, dtb__128, dtb__129) -> (C_Term_TLam (dtb__125, dtb__126, ((((v_substMetasSlot (fuel - 1)) resolve) depth) dtb__127), dtb__128, ((((v_substMetasFuel (fuel - 1)) resolve) (depth + 1)) dtb__129)))
  | C_Term_TApp (dtb__130, dtb__131, dtb__132) -> (C_Term_TApp (((((v_substMetasFuel (fuel - 1)) resolve) depth) dtb__130), ((((v_substMetasFuel (fuel - 1)) resolve) depth) dtb__131), dtb__132))
  | C_Term_TCon (dtb__133, dtb__134) -> (C_Term_TCon (dtb__133, ((((v_substMetasArgs (fuel - 1)) resolve) depth) dtb__134)))
  | C_Term_TMk (dtb__135, dtb__136) -> (C_Term_TMk (dtb__135, ((((v_substMetasArgs (fuel - 1)) resolve) depth) dtb__136)))
  | C_Term_TRecord (dtb__137, dtb__138) -> (C_Term_TRecord (dtb__137, ((((v_substMetasArgs (fuel - 1)) resolve) depth) dtb__138)))
  | C_Term_TProj (dtb__139, dtb__140, dtb__141, dtb__142, dtb__143) -> (C_Term_TProj (((((v_substMetasFuel (fuel - 1)) resolve) depth) dtb__139), dtb__140, dtb__141, dtb__142, dtb__143))
  | C_Term_TRecUpd (dtb__144, dtb__145, dtb__146, dtb__147, dtb__148) -> (C_Term_TRecUpd (((((v_substMetasFuel (fuel - 1)) resolve) depth) dtb__144), dtb__145, dtb__146, dtb__147, ((((v_substMetasFuel (fuel - 1)) resolve) (depth + (B_dData_dList.v_length dtb__146))) dtb__148)))
  | C_Term_TCase (dtb__149, dtb__150) -> (C_Term_TCase (((((v_substMetasFuel (fuel - 1)) resolve) depth) dtb__149), ((B_dData_dList.v_map (((v_substMetasAlt (fuel - 1)) resolve) depth)) dtb__150)))
  | C_Term_TIf (dtb__151, dtb__152, dtb__153) -> (C_Term_TIf (((((v_substMetasFuel (fuel - 1)) resolve) depth) dtb__151), ((((v_substMetasFuel (fuel - 1)) resolve) depth) dtb__152), ((((v_substMetasFuel (fuel - 1)) resolve) depth) dtb__153)))
  | _ -> t
)))
# 822 "Vuna/Compiler/Core/Term.vuna"
and v_substMetasArgs = (fun (mc0 : int) (mc1 : (int) -> (int) -> t_Term B_dData_dMaybe.t_Maybe) (mc2 : int) (mc3 : (t_Term, t_Rig) B_dData_dPair.t_Pair B_dData_dList.t_List) -> (match mc3 with
  | B_dData_dList.C_List__x58__x58_ (dtb__154, dtb__155) -> (match dtb__154 with
  | { B_dData_dPair.f_Pair_first = dtb__156; B_dData_dPair.f_Pair_second = dtb__157 } -> (B_dData_dList.C_List__x58__x58_ ({ B_dData_dPair.f_Pair_first = ((((v_substMetasFuel mc0) mc1) mc2) dtb__156); B_dData_dPair.f_Pair_second = dtb__157 }, ((((v_substMetasArgs mc0) mc1) mc2) dtb__155)))
  | _ -> failwith "DT: impossible branch"
)
  | B_dData_dList.C_List_Nil -> B_dData_dList.C_List_Nil
  | _ -> failwith "DT: impossible branch"
))
# 827 "Vuna/Compiler/Core/Term.vuna"
and v_substMetasSlot = (fun (mc0 : int) (mc1 : (int) -> (int) -> t_Term B_dData_dMaybe.t_Maybe) (mc2 : int) (mc3 : (t_LamMark, (t_Term B_dData_dMaybe.t_Maybe, t_Term B_dData_dMaybe.t_Maybe) B_dData_dPair.t_Pair) B_dData_dPair.t_Pair B_dData_dMaybe.t_Maybe) -> (match mc3 with
  | B_dData_dMaybe.C_Maybe_Just (dtb__158) -> (let tys = (B_dData_dPair.v_secondOf dtb__158) in (B_dData_dMaybe.C_Maybe_Just ({ B_dData_dPair.f_Pair_first = (B_dData_dPair.v_firstOf dtb__158); B_dData_dPair.f_Pair_second = { B_dData_dPair.f_Pair_first = ((v_mapTermMaybe (((v_substMetasFuel mc0) mc1) mc2)) (B_dData_dPair.v_firstOf tys)); B_dData_dPair.f_Pair_second = ((v_mapTermMaybe (((v_substMetasFuel mc0) mc1) (mc2 + 1))) (B_dData_dPair.v_secondOf tys)) } })))
  | B_dData_dMaybe.C_Maybe_Nothing -> B_dData_dMaybe.C_Maybe_Nothing
  | _ -> failwith "DT: impossible branch"
))
# 835 "Vuna/Compiler/Core/Term.vuna"
and v_substMetasAlt = (fun (mc0 : int) (mc1 : (int) -> (int) -> t_Term B_dData_dMaybe.t_Maybe) (mc2 : int) (mc3 : t_CaseAlt) -> (match mc3 with
  | { f_CaseAlt_caseAltName = dtb__159; f_CaseAlt_caseAltBinders = dtb__160; f_CaseAlt_caseAltBody = dtb__161 } -> { f_CaseAlt_caseAltName = dtb__159; f_CaseAlt_caseAltBinders = dtb__160; f_CaseAlt_caseAltBody = ((((v_substMetasFuel mc0) mc1) (mc2 + (B_dData_dList.v_length dtb__160))) dtb__161) }
  | _ -> failwith "DT: impossible branch"
))

# 846 "Vuna/Compiler/Core/Term.vuna"
let v_substMetasFuelMax = 1000000

# 861 "Vuna/Compiler/Core/Term.vuna"
let[@tail_mod_cons] rec v_insertDictBinderGo = (fun (mc0 : string) (mc1 : int) (mc2 : t_Term) (mc3 : int) (mc4 : t_Term) -> (match mc4 with
  | C_Term_TPi (dtb__162, dtb__163, dtb__164, dtb__165, dtb__166) -> (if (mc3 = mc1) then (C_Term_TPi (dtb__162, dtb__163, dtb__164, dtb__165, (C_Term_TPi (mc0, true, C_Rig_RigOmega, mc2, (((v_shift 0) 1) dtb__166))))) else (C_Term_TPi (dtb__162, dtb__163, dtb__164, dtb__165, (((((v_insertDictBinderGo mc0) mc1) mc2) (mc3 + 1)) dtb__166))))
  | _ -> mc4
))

# 855 "Vuna/Compiler/Core/Term.vuna"
let v_insertDictBinder = (fun (name : string) (idx : int) (dictDom : t_Term) (t : t_Term) -> (((((v_insertDictBinderGo name) idx) dictDom) 0) t))

# 873 "Vuna/Compiler/Core/Term.vuna"
let[@tail_mod_cons] rec v_insertImplicitBinderGo = (fun (mc0 : string) (mc1 : int) (mc2 : t_Rig) (mc3 : t_Term) (mc4 : int) (mc5 : t_Term) -> (match mc5 with
  | C_Term_TPi (dtb__167, dtb__168, dtb__169, dtb__170, dtb__171) -> (if (mc4 = mc1) then (C_Term_TPi (dtb__167, dtb__168, dtb__169, dtb__170, (C_Term_TPi (mc0, true, mc2, mc3, (((v_shift 0) 1) dtb__171))))) else (C_Term_TPi (dtb__167, dtb__168, dtb__169, dtb__170, ((((((v_insertImplicitBinderGo mc0) mc1) mc2) mc3) (mc4 + 1)) dtb__171))))
  | _ -> mc5
))

# 870 "Vuna/Compiler/Core/Term.vuna"
let v_insertImplicitBinder = (fun (name : string) (idx : int) (rig : t_Rig) (dom : t_Term) (t : t_Term) -> ((((((v_insertImplicitBinderGo name) idx) rig) dom) 0) t))

# 882 "Vuna/Compiler/Core/Term.vuna"
let v_cutoffOf = (fun (total : int) (idx : int) -> (if ((total - (idx + 1)) <= 0) then 0 else (total - (idx + 1))))

# 885 "Vuna/Compiler/Core/Term.vuna"
let rec v_countPis = (fun (mc0 : t_Term) -> (match mc0 with
  | C_Term_TPi (dtb__172, dtb__173, dtb__174, dtb__175, dtb__176) -> (1 + (v_countPis dtb__176))
  | _ -> 0
))

# 897 "Vuna/Compiler/Core/Term.vuna"
let[@tail_mod_cons] rec v_insertLamBinderGo = (fun (mc0 : string) (mc1 : int) (mc2 : int) (mc3 : t_Term) -> (match mc3 with
  | C_Term_TLam (dtb__177, dtb__178, dtb__179, dtb__180, dtb__181) -> (if (mc2 = mc1) then (C_Term_TLam (dtb__177, dtb__178, dtb__179, dtb__180, (C_Term_TLam (mc0, C_Rig_RigOmega, B_dData_dMaybe.C_Maybe_Nothing, Base_dSource.v_spanEmpty, (((v_shift 0) 1) dtb__181))))) else (C_Term_TLam (dtb__177, dtb__178, dtb__179, dtb__180, ((((v_insertLamBinderGo mc0) mc1) (mc2 + 1)) dtb__181))))
  | _ -> mc3
))

# 894 "Vuna/Compiler/Core/Term.vuna"
let v_insertLamBinder = (fun (name : string) (idx : int) (t : t_Term) -> ((((v_insertLamBinderGo name) idx) 0) t))

# 905 "Vuna/Compiler/Core/Term.vuna"
let rec v_countLams = (fun (mc0 : t_Term) -> (match mc0 with
  | C_Term_TLam (dtb__182, dtb__183, dtb__184, dtb__185, dtb__186) -> (1 + (v_countLams dtb__186))
  | _ -> 0
))

# 910 "Vuna/Compiler/Core/Term.vuna"
let rec v_hasFreeTermVar = (fun (mc0 : int) (mc1 : t_Term) -> (match mc1 with
  | C_Term_TIf (dtb__187, dtb__188, dtb__189) -> (if (if ((v_hasFreeTermVar mc0) dtb__187) then true else ((v_hasFreeTermVar mc0) dtb__188)) then true else ((v_hasFreeTermVar mc0) dtb__189))
  | C_Term_TCase (dtb__190, dtb__191) -> (if ((v_hasFreeTermVar mc0) dtb__190) then true else ((v_anyAltFree mc0) dtb__191))
  | C_Term_TRecUpd (dtb__192, dtb__193, dtb__194, dtb__195, dtb__196) -> (if ((v_hasFreeTermVar mc0) dtb__192) then true else ((v_hasFreeTermVar (mc0 + (B_dData_dList.v_length dtb__194))) dtb__196))
  | C_Term_TProj (dtb__197, dtb__198, dtb__199, dtb__200, dtb__201) -> ((v_hasFreeTermVar mc0) dtb__197)
  | C_Term_TRecord (dtb__202, dtb__203) -> ((v_anyPairFree mc0) dtb__203)
  | C_Term_TMk (dtb__204, dtb__205) -> ((v_anyPairFree mc0) dtb__205)
  | C_Term_TCon (dtb__206, dtb__207) -> ((v_anyPairFree mc0) dtb__207)
  | C_Term_TApp (dtb__208, dtb__209, dtb__210) -> (if ((v_hasFreeTermVar mc0) dtb__208) then true else ((v_hasFreeTermVar mc0) dtb__209))
  | C_Term_TLam (dtb__211, dtb__212, dtb__213, dtb__214, dtb__215) -> (let tys = (let nd_uscrut7 = dtb__213 in (match nd_uscrut7 with
  | B_dData_dMaybe.C_Maybe_Just (dtb__216) -> (match dtb__216 with
  | { B_dData_dPair.f_Pair_first = dtb__217; B_dData_dPair.f_Pair_second = dtb__218 } -> (match dtb__218 with
  | { B_dData_dPair.f_Pair_first = dtb__219; B_dData_dPair.f_Pair_second = dtb__220 } -> (if ((v_hasFreeTermVarMaybe mc0) dtb__219) then true else ((v_hasFreeTermVarMaybe (mc0 + 1)) dtb__220))
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
)
  | B_dData_dMaybe.C_Maybe_Nothing -> false
  | _ -> failwith "DT: impossible branch"
)) in (if tys then true else ((v_hasFreeTermVar (mc0 + 1)) dtb__215)))
  | C_Term_TPi (dtb__221, dtb__222, dtb__223, dtb__224, dtb__225) -> (if ((v_hasFreeTermVar mc0) dtb__224) then true else ((v_hasFreeTermVar (mc0 + 1)) dtb__225))
  | C_Term_TVar (dtb__226, dtb__227, dtb__228) -> (dtb__227 >= mc0)
  | _ -> false
))
# 933 "Vuna/Compiler/Core/Term.vuna"
and v_hasFreeTermVarMaybe = (fun (mc0 : int) (mc1 : t_Term B_dData_dMaybe.t_Maybe) -> (match mc1 with
  | B_dData_dMaybe.C_Maybe_Just (dtb__229) -> ((v_hasFreeTermVar mc0) dtb__229)
  | B_dData_dMaybe.C_Maybe_Nothing -> false
  | _ -> failwith "DT: impossible branch"
))
# 937 "Vuna/Compiler/Core/Term.vuna"
and v_anyPairFree = (fun (mc0 : int) (mc1 : (t_Term, t_Rig) B_dData_dPair.t_Pair B_dData_dList.t_List) -> (match mc1 with
  | B_dData_dList.C_List__x58__x58_ (dtb__230, dtb__231) -> (match dtb__230 with
  | { B_dData_dPair.f_Pair_first = dtb__232; B_dData_dPair.f_Pair_second = dtb__233 } -> (if ((v_hasFreeTermVar mc0) dtb__232) then true else ((v_anyPairFree mc0) dtb__231))
  | _ -> failwith "DT: impossible branch"
)
  | B_dData_dList.C_List_Nil -> false
  | _ -> failwith "DT: impossible branch"
))
# 941 "Vuna/Compiler/Core/Term.vuna"
and v_anyAltFree = (fun (mc0 : int) (mc1 : t_CaseAlt B_dData_dList.t_List) -> (match mc1 with
  | B_dData_dList.C_List__x58__x58_ (dtb__234, dtb__235) -> (match dtb__234 with
  | { f_CaseAlt_caseAltName = dtb__236; f_CaseAlt_caseAltBinders = dtb__237; f_CaseAlt_caseAltBody = dtb__238 } -> (if ((v_hasFreeTermVar (mc0 + (B_dData_dList.v_length dtb__237))) dtb__238) then true else ((v_anyAltFree mc0) dtb__235))
  | _ -> failwith "DT: impossible branch"
)
  | B_dData_dList.C_List_Nil -> false
  | _ -> failwith "DT: impossible branch"
))

# 949 "Vuna/Compiler/Core/Term.vuna"
let rec v_hasNegativeVar = (fun (mc0 : t_Term) -> (match mc0 with
  | C_Term_TIf (dtb__239, dtb__240, dtb__241) -> (if (if (v_hasNegativeVar dtb__239) then true else (v_hasNegativeVar dtb__240)) then true else (v_hasNegativeVar dtb__241))
  | C_Term_TCase (dtb__242, dtb__243) -> (if (v_hasNegativeVar dtb__242) then true else (v_anyNegativeVarAlts dtb__243))
  | C_Term_TRecUpd (dtb__244, dtb__245, dtb__246, dtb__247, dtb__248) -> (if (v_hasNegativeVar dtb__244) then true else (v_hasNegativeVar dtb__248))
  | C_Term_TProj (dtb__249, dtb__250, dtb__251, dtb__252, dtb__253) -> (v_hasNegativeVar dtb__249)
  | C_Term_TRecord (dtb__254, dtb__255) -> (v_anyNegativeVarArgs dtb__255)
  | C_Term_TMk (dtb__256, dtb__257) -> (v_anyNegativeVarArgs dtb__257)
  | C_Term_TCon (dtb__258, dtb__259) -> (v_anyNegativeVarArgs dtb__259)
  | C_Term_TApp (dtb__260, dtb__261, dtb__262) -> (if (v_hasNegativeVar dtb__260) then true else (v_hasNegativeVar dtb__261))
  | C_Term_TLam (dtb__263, dtb__264, dtb__265, dtb__266, dtb__267) -> (let tys = (let nd_uscrut6 = dtb__265 in (match nd_uscrut6 with
  | B_dData_dMaybe.C_Maybe_Just (dtb__268) -> (match dtb__268 with
  | { B_dData_dPair.f_Pair_first = dtb__269; B_dData_dPair.f_Pair_second = dtb__270 } -> (match dtb__270 with
  | { B_dData_dPair.f_Pair_first = dtb__271; B_dData_dPair.f_Pair_second = dtb__272 } -> (if (v_hasNegativeVarMaybe dtb__271) then true else (v_hasNegativeVarMaybe dtb__272))
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
)
  | B_dData_dMaybe.C_Maybe_Nothing -> false
  | _ -> failwith "DT: impossible branch"
)) in (if tys then true else (v_hasNegativeVar dtb__267)))
  | C_Term_TPi (dtb__273, dtb__274, dtb__275, dtb__276, dtb__277) -> (if (v_hasNegativeVar dtb__276) then true else (v_hasNegativeVar dtb__277))
  | C_Term_TVar (dtb__278, dtb__279, dtb__280) -> (dtb__279 < 0)
  | _ -> false
))
# 969 "Vuna/Compiler/Core/Term.vuna"
and v_hasNegativeVarMaybe = (fun (mc0 : t_Term B_dData_dMaybe.t_Maybe) -> (match mc0 with
  | B_dData_dMaybe.C_Maybe_Just (dtb__281) -> (v_hasNegativeVar dtb__281)
  | B_dData_dMaybe.C_Maybe_Nothing -> false
  | _ -> failwith "DT: impossible branch"
))
# 973 "Vuna/Compiler/Core/Term.vuna"
and v_anyNegativeVarArgs = (fun (mc0 : (t_Term, t_Rig) B_dData_dPair.t_Pair B_dData_dList.t_List) -> (match mc0 with
  | B_dData_dList.C_List__x58__x58_ (dtb__282, dtb__283) -> (match dtb__282 with
  | { B_dData_dPair.f_Pair_first = dtb__284; B_dData_dPair.f_Pair_second = dtb__285 } -> (if (v_hasNegativeVar dtb__284) then true else (v_anyNegativeVarArgs dtb__283))
  | _ -> failwith "DT: impossible branch"
)
  | B_dData_dList.C_List_Nil -> false
  | _ -> failwith "DT: impossible branch"
))
# 977 "Vuna/Compiler/Core/Term.vuna"
and v_anyNegativeVarAlts = (fun (mc0 : t_CaseAlt B_dData_dList.t_List) -> (match mc0 with
  | B_dData_dList.C_List__x58__x58_ (dtb__286, dtb__287) -> (match dtb__286 with
  | { f_CaseAlt_caseAltName = dtb__288; f_CaseAlt_caseAltBinders = dtb__289; f_CaseAlt_caseAltBody = dtb__290 } -> (if (v_hasNegativeVar dtb__290) then true else (v_anyNegativeVarAlts dtb__287))
  | _ -> failwith "DT: impossible branch"
)
  | B_dData_dList.C_List_Nil -> false
  | _ -> failwith "DT: impossible branch"
))

# 1047 "Vuna/Compiler/Core/Term.vuna"
let v_isTypeValue = (fun (mc0 : t_Value) -> (match mc0 with
  | C_Value_VType (dtb__291) -> true
  | _ -> false
))

# 1051 "Vuna/Compiler/Core/Term.vuna"
let v_typeLevelOf = (fun (mc0 : t_Value) -> (match mc0 with
  | C_Value_VType (dtb__292) -> (B_dData_dMaybe.C_Maybe_Just (dtb__292))
  | _ -> B_dData_dMaybe.C_Maybe_Nothing
))

# 1173 "Vuna/Compiler/Core/Term.vuna"
let rec v_showBinders = (fun (mc0 : (string, t_Rig) B_dData_dPair.t_Pair B_dData_dList.t_List) -> (match mc0 with
  | B_dData_dList.C_List__x58__x58_ (dtb__293, dtb__294) -> (match dtb__293 with
  | { B_dData_dPair.f_Pair_first = dtb__295; B_dData_dPair.f_Pair_second = dtb__296 } -> (String.concat "" [" "; dtb__295; (v_showBinders dtb__294)])
  | _ -> failwith "DT: impossible branch"
)
  | B_dData_dList.C_List_Nil -> ""
  | _ -> failwith "DT: impossible branch"
))

# 1180 "Vuna/Compiler/Core/Term.vuna"
let rec v_showCoreChars = (fun (mc0 : int B_dData_dList.t_List) -> (match mc0 with
  | B_dData_dList.C_List__x58__x58_ (dtb__297, dtb__298) -> (if (dtb__297 = 34) then ("\\\"" ^ (v_showCoreChars dtb__298)) else (if (dtb__297 = 92) then ("\\\\" ^ (v_showCoreChars dtb__298)) else (if (dtb__297 = 10) then ("\\n" ^ (v_showCoreChars dtb__298)) else (if (dtb__297 = 9) then ("\\t" ^ (v_showCoreChars dtb__298)) else (if (dtb__297 = 13) then ("\\r" ^ (v_showCoreChars dtb__298)) else ((B_dData_dList.dtp_pack (B_dData_dList.C_List__x58__x58_ (dtb__297, B_dData_dList.C_List_Nil))) ^ (v_showCoreChars dtb__298)))))))
  | B_dData_dList.C_List_Nil -> ""
  | _ -> failwith "DT: impossible branch"
))

# 1177 "Vuna/Compiler/Core/Term.vuna"
let v_showCoreString = (fun (s : string) -> (String.concat "" ["\""; (v_showCoreChars (B_dData_dList.dtp_unpack s)); "\""]))

# 97 "Vuna/Compiler/Core/Term.vuna"
let v_levelToInt = (fun (p : t_Level) -> (let dtb__299 = p in dtb__299))

# 158 "Vuna/Compiler/Core/Term.vuna"
let v_binderName = (fun (p : t_Binder) -> (match p with
  | { f_Binder_binderName = dtb__300; f_Binder_binderRig = dtb__301; f_Binder_binderSpan = dtb__302 } -> dtb__300
  | _ -> failwith "DT: impossible branch"
))

# 159 "Vuna/Compiler/Core/Term.vuna"
let v_binderRig = (fun (p : t_Binder) -> (match p with
  | { f_Binder_binderName = dtb__303; f_Binder_binderRig = dtb__304; f_Binder_binderSpan = dtb__305 } -> dtb__304
  | _ -> failwith "DT: impossible branch"
))

# 160 "Vuna/Compiler/Core/Term.vuna"
let v_binderSpan = (fun (p : t_Binder) -> (match p with
  | { f_Binder_binderName = dtb__306; f_Binder_binderRig = dtb__307; f_Binder_binderSpan = dtb__308 } -> dtb__308
  | _ -> failwith "DT: impossible branch"
))

# 187 "Vuna/Compiler/Core/Term.vuna"
let v_caseAltName = (fun (p : t_CaseAlt) -> (match p with
  | { f_CaseAlt_caseAltName = dtb__309; f_CaseAlt_caseAltBinders = dtb__310; f_CaseAlt_caseAltBody = dtb__311 } -> dtb__309
  | _ -> failwith "DT: impossible branch"
))

# 188 "Vuna/Compiler/Core/Term.vuna"
let v_caseAltBinders = (fun (p : t_CaseAlt) -> (match p with
  | { f_CaseAlt_caseAltName = dtb__312; f_CaseAlt_caseAltBinders = dtb__313; f_CaseAlt_caseAltBody = dtb__314 } -> dtb__313
  | _ -> failwith "DT: impossible branch"
))

# 189 "Vuna/Compiler/Core/Term.vuna"
let v_caseAltBody = (fun (p : t_CaseAlt) -> (match p with
  | { f_CaseAlt_caseAltName = dtb__315; f_CaseAlt_caseAltBinders = dtb__316; f_CaseAlt_caseAltBody = dtb__317 } -> dtb__317
  | _ -> failwith "DT: impossible branch"
))

# 338 "Vuna/Compiler/Core/Term.vuna"
let[@tail_mod_cons] rec v_termSizeAltTerms = (fun (mc0 : t_CaseAlt B_dData_dList.t_List) -> (match mc0 with
  | B_dData_dList.C_List__x58__x58_ (dtb__318, dtb__319) -> (B_dData_dList.C_List__x58__x58_ ((v_caseAltBody dtb__318), (v_termSizeAltTerms dtb__319)))
  | B_dData_dList.C_List_Nil -> B_dData_dList.C_List_Nil
  | _ -> failwith "DT: impossible branch"
))

# 314 "Vuna/Compiler/Core/Term.vuna"
let v_termSizeWork = (fun (mc0 : t_Term) -> (match mc0 with
  | C_Term_TIf (dtb__320, dtb__321, dtb__322) -> (B_dData_dList.C_List__x58__x58_ (dtb__320, (B_dData_dList.C_List__x58__x58_ (dtb__321, (B_dData_dList.C_List__x58__x58_ (dtb__322, B_dData_dList.C_List_Nil))))))
  | C_Term_TRecUpd (dtb__323, dtb__324, dtb__325, dtb__326, dtb__327) -> (B_dData_dList.C_List__x58__x58_ (dtb__323, (B_dData_dList.C_List__x58__x58_ (dtb__327, B_dData_dList.C_List_Nil))))
  | C_Term_TProj (dtb__328, dtb__329, dtb__330, dtb__331, dtb__332) -> (B_dData_dList.C_List__x58__x58_ (dtb__328, B_dData_dList.C_List_Nil))
  | C_Term_TCase (dtb__333, dtb__334) -> (B_dData_dList.C_List__x58__x58_ (dtb__333, (v_termSizeAltTerms dtb__334)))
  | C_Term_TRecord (dtb__335, dtb__336) -> (v_termSizeArgTerms dtb__336)
  | C_Term_TMk (dtb__337, dtb__338) -> (v_termSizeArgTerms dtb__338)
  | C_Term_TCon (dtb__339, dtb__340) -> (v_termSizeArgTerms dtb__340)
  | C_Term_TApp (dtb__341, dtb__342, dtb__343) -> (B_dData_dList.C_List__x58__x58_ (dtb__341, (B_dData_dList.C_List__x58__x58_ (dtb__342, B_dData_dList.C_List_Nil))))
  | C_Term_TLam (dtb__344, dtb__345, dtb__346, dtb__347, dtb__348) -> ((B_dData_dList.v_append (v_termSizeSlotTerms dtb__346)) (B_dData_dList.C_List__x58__x58_ (dtb__348, B_dData_dList.C_List_Nil)))
  | C_Term_TPi (dtb__349, dtb__350, dtb__351, dtb__352, dtb__353) -> (B_dData_dList.C_List__x58__x58_ (dtb__352, (B_dData_dList.C_List__x58__x58_ (dtb__353, B_dData_dList.C_List_Nil))))
  | C_Term_TBool (dtb__354) -> B_dData_dList.C_List_Nil
  | C_Term_TFloat (dtb__355) -> B_dData_dList.C_List_Nil
  | C_Term_TStr (dtb__356) -> B_dData_dList.C_List_Nil
  | C_Term_TInt (dtb__357) -> B_dData_dList.C_List_Nil
  | C_Term_TType (dtb__358) -> B_dData_dList.C_List_Nil
  | C_Term_TGlobal (dtb__359) -> B_dData_dList.C_List_Nil
  | C_Term_TMeta (dtb__360) -> B_dData_dList.C_List_Nil
  | C_Term_TVar (dtb__361, dtb__362, dtb__363) -> B_dData_dList.C_List_Nil
  | _ -> failwith "DT: impossible branch"
))

# 308 "Vuna/Compiler/Core/Term.vuna"
let rec v_termSizeGo = (fun (mc0 : int) (mc1 : t_Term B_dData_dList.t_List) -> (match mc1 with
  | B_dData_dList.C_List__x58__x58_ (dtb__364, dtb__365) -> (if (mc0 <= 0) then 0 else (1 + ((v_termSizeGo (mc0 - 1)) ((B_dData_dList.v_append (v_termSizeWork dtb__364)) dtb__365))))
  | B_dData_dList.C_List_Nil -> 0
  | _ -> failwith "DT: impossible branch"
))

# 299 "Vuna/Compiler/Core/Term.vuna"
let v_termSize = (fun (t : t_Term) -> ((v_termSizeGo v_termSizeCap) (B_dData_dList.C_List__x58__x58_ (t, B_dData_dList.C_List_Nil))))

# 412 "Vuna/Compiler/Core/Term.vuna"
let rec v_termHasUnsolvedMetaFuel = (fun (fuel : int) (sols : t_Sols) (t : t_Term) -> (if (fuel <= 0) then true else (match t with
  | C_Term_TMeta (dtb__366) -> (match ((v_solsLookup dtb__366) sols) with
  | B_dData_dMaybe.C_Maybe_Just (dtb__367) -> false
  | B_dData_dMaybe.C_Maybe_Nothing -> true
  | _ -> failwith "DT: impossible branch"
)
  | C_Term_TVar (dtb__368, dtb__369, dtb__370) -> false
  | C_Term_TGlobal (dtb__371) -> false
  | C_Term_TType (dtb__372) -> false
  | C_Term_TPi (dtb__373, dtb__374, dtb__375, dtb__376, dtb__377) -> (if (((v_termHasUnsolvedMetaFuel (fuel - 1)) sols) dtb__376) then true else (((v_termHasUnsolvedMetaFuel (fuel - 1)) sols) dtb__377))
  | C_Term_TLam (dtb__378, dtb__379, dtb__380, dtb__381, dtb__382) -> (let tys = (let nd_uscrut8 = dtb__380 in (match nd_uscrut8 with
  | B_dData_dMaybe.C_Maybe_Just (dtb__383) -> (match dtb__383 with
  | { B_dData_dPair.f_Pair_first = dtb__384; B_dData_dPair.f_Pair_second = dtb__385 } -> (match dtb__385 with
  | { B_dData_dPair.f_Pair_first = dtb__386; B_dData_dPair.f_Pair_second = dtb__387 } -> (if (((v_termHasUnsolvedMetaMaybeFuel (fuel - 1)) sols) dtb__386) then true else (((v_termHasUnsolvedMetaMaybeFuel (fuel - 1)) sols) dtb__387))
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
)
  | B_dData_dMaybe.C_Maybe_Nothing -> false
  | _ -> failwith "DT: impossible branch"
)) in (if tys then true else (((v_termHasUnsolvedMetaFuel (fuel - 1)) sols) dtb__382)))
  | C_Term_TApp (dtb__388, dtb__389, dtb__390) -> (if (((v_termHasUnsolvedMetaFuel (fuel - 1)) sols) dtb__388) then true else (((v_termHasUnsolvedMetaFuel (fuel - 1)) sols) dtb__389))
  | C_Term_TCon (dtb__391, dtb__392) -> (((v_termHasUnsolvedMetaArgsFuel (fuel - 1)) sols) dtb__392)
  | C_Term_TMk (dtb__393, dtb__394) -> (((v_termHasUnsolvedMetaArgsFuel (fuel - 1)) sols) dtb__394)
  | C_Term_TRecord (dtb__395, dtb__396) -> (((v_termHasUnsolvedMetaArgsFuel (fuel - 1)) sols) dtb__396)
  | C_Term_TProj (dtb__397, dtb__398, dtb__399, dtb__400, dtb__401) -> (((v_termHasUnsolvedMetaFuel (fuel - 1)) sols) dtb__397)
  | C_Term_TRecUpd (dtb__402, dtb__403, dtb__404, dtb__405, dtb__406) -> (if (((v_termHasUnsolvedMetaFuel (fuel - 1)) sols) dtb__402) then true else (((v_termHasUnsolvedMetaFuel (fuel - 1)) sols) dtb__406))
  | C_Term_TCase (dtb__407, dtb__408) -> (if (((v_termHasUnsolvedMetaFuel (fuel - 1)) sols) dtb__407) then true else (((v_termHasUnsolvedMetaAltsFuel (fuel - 1)) sols) dtb__408))
  | C_Term_TInt (dtb__409) -> false
  | C_Term_TStr (dtb__410) -> false
  | C_Term_TFloat (dtb__411) -> false
  | C_Term_TBool (dtb__412) -> false
  | C_Term_TIf (dtb__413, dtb__414, dtb__415) -> (if (if (((v_termHasUnsolvedMetaFuel (fuel - 1)) sols) dtb__413) then true else (((v_termHasUnsolvedMetaFuel (fuel - 1)) sols) dtb__414)) then true else (((v_termHasUnsolvedMetaFuel (fuel - 1)) sols) dtb__415))
  | _ -> failwith "DT: impossible branch"
)))
# 446 "Vuna/Compiler/Core/Term.vuna"
and v_termHasUnsolvedMetaMaybeFuel = (fun (mc0 : int) (mc1 : t_Sols) (mc2 : t_Term B_dData_dMaybe.t_Maybe) -> (match mc2 with
  | B_dData_dMaybe.C_Maybe_Just (dtb__416) -> (((v_termHasUnsolvedMetaFuel mc0) mc1) dtb__416)
  | B_dData_dMaybe.C_Maybe_Nothing -> false
  | _ -> failwith "DT: impossible branch"
))
# 450 "Vuna/Compiler/Core/Term.vuna"
and v_termHasUnsolvedMetaArgsFuel = (fun (fuel : int) (sols : t_Sols) (args : (t_Term, t_Rig) B_dData_dPair.t_Pair B_dData_dList.t_List) -> (if (fuel <= 0) then true else (let nd_uscrut3 = args in (match nd_uscrut3 with
  | B_dData_dList.C_List__x58__x58_ (dtb__417, dtb__418) -> (match dtb__417 with
  | { B_dData_dPair.f_Pair_first = dtb__419; B_dData_dPair.f_Pair_second = dtb__420 } -> (if (((v_termHasUnsolvedMetaFuel (fuel - 1)) sols) dtb__419) then true else (((v_termHasUnsolvedMetaArgsFuel (fuel - 1)) sols) dtb__418))
  | _ -> failwith "DT: impossible branch"
)
  | B_dData_dList.C_List_Nil -> false
  | _ -> failwith "DT: impossible branch"
))))
# 459 "Vuna/Compiler/Core/Term.vuna"
and v_termHasUnsolvedMetaAltsFuel = (fun (fuel : int) (sols : t_Sols) (alts : t_CaseAlt B_dData_dList.t_List) -> (if (fuel <= 0) then true else (match alts with
  | B_dData_dList.C_List_Nil -> false
  | B_dData_dList.C_List__x58__x58_ (dtb__421, dtb__422) -> (if (((v_termHasUnsolvedMetaFuel (fuel - 1)) sols) (v_caseAltBody dtb__421)) then true else (((v_termHasUnsolvedMetaAltsFuel (fuel - 1)) sols) dtb__422))
  | _ -> failwith "DT: impossible branch"
)))

# 408 "Vuna/Compiler/Core/Term.vuna"
let v_termHasUnsolvedMeta = (fun (sols : t_Sols) (t : t_Term) -> (((v_termHasUnsolvedMetaFuel v_metaScanBound) sols) t))

# 470 "Vuna/Compiler/Core/Term.vuna"
let rec v_termUsesFloat = (fun (mc0 : string B_dData_dList.t_List) (mc1 : t_Term) -> (match mc1 with
  | C_Term_TIf (dtb__423, dtb__424, dtb__425) -> (if (if ((v_termUsesFloat mc0) dtb__423) then true else ((v_termUsesFloat mc0) dtb__424)) then true else ((v_termUsesFloat mc0) dtb__425))
  | C_Term_TBool (dtb__426) -> false
  | C_Term_TStr (dtb__427) -> false
  | C_Term_TInt (dtb__428) -> false
  | C_Term_TCase (dtb__429, dtb__430) -> (if ((v_termUsesFloat mc0) dtb__429) then true else ((v_anyAltUsesFloat mc0) dtb__430))
  | C_Term_TRecUpd (dtb__431, dtb__432, dtb__433, dtb__434, dtb__435) -> (if ((v_termUsesFloat mc0) dtb__431) then true else ((v_termUsesFloat mc0) dtb__435))
  | C_Term_TProj (dtb__436, dtb__437, dtb__438, dtb__439, dtb__440) -> ((v_termUsesFloat mc0) dtb__436)
  | C_Term_TRecord (dtb__441, dtb__442) -> ((v_anyArgUsesFloat mc0) dtb__442)
  | C_Term_TMk (dtb__443, dtb__444) -> ((v_anyArgUsesFloat mc0) dtb__444)
  | C_Term_TCon (dtb__445, dtb__446) -> ((v_anyArgUsesFloat mc0) dtb__446)
  | C_Term_TApp (dtb__447, dtb__448, dtb__449) -> (if ((v_termUsesFloat mc0) dtb__447) then true else ((v_termUsesFloat mc0) dtb__448))
  | C_Term_TLam (dtb__450, dtb__451, dtb__452, dtb__453, dtb__454) -> ((v_termUsesFloat mc0) dtb__454)
  | C_Term_TPi (dtb__455, dtb__456, dtb__457, dtb__458, dtb__459) -> (if ((v_termUsesFloat mc0) dtb__458) then true else ((v_termUsesFloat mc0) dtb__459))
  | C_Term_TType (dtb__460) -> false
  | C_Term_TMeta (dtb__461) -> false
  | C_Term_TVar (dtb__462, dtb__463, dtb__464) -> false
  | C_Term_TGlobal (dtb__465) -> ((B_dData_dList.v_memName dtb__465) mc0)
  | C_Term_TFloat (dtb__466) -> true
  | _ -> failwith "DT: impossible branch"
))
# 493 "Vuna/Compiler/Core/Term.vuna"
and v_anyArgUsesFloat = (fun (mc0 : string B_dData_dList.t_List) (mc1 : (t_Term, t_Rig) B_dData_dPair.t_Pair B_dData_dList.t_List) -> (match mc1 with
  | B_dData_dList.C_List__x58__x58_ (dtb__467, dtb__468) -> (match dtb__467 with
  | { B_dData_dPair.f_Pair_first = dtb__469; B_dData_dPair.f_Pair_second = dtb__470 } -> (if ((v_termUsesFloat mc0) dtb__469) then true else ((v_anyArgUsesFloat mc0) dtb__468))
  | _ -> failwith "DT: impossible branch"
)
  | B_dData_dList.C_List_Nil -> false
  | _ -> failwith "DT: impossible branch"
))
# 498 "Vuna/Compiler/Core/Term.vuna"
and v_anyAltUsesFloat = (fun (mc0 : string B_dData_dList.t_List) (mc1 : t_CaseAlt B_dData_dList.t_List) -> (match mc1 with
  | B_dData_dList.C_List__x58__x58_ (dtb__471, dtb__472) -> (if ((v_termUsesFloat mc0) (v_caseAltBody dtb__471)) then true else ((v_anyAltUsesFloat mc0) dtb__472))
  | B_dData_dList.C_List_Nil -> false
  | _ -> failwith "DT: impossible branch"
))

# 504 "Vuna/Compiler/Core/Term.vuna"
let rec v_termGlobalNames = (fun (mc0 : t_Term) -> (match mc0 with
  | C_Term_TIf (dtb__473, dtb__474, dtb__475) -> ((B_dData_dList.v_append (v_termGlobalNames dtb__473)) ((B_dData_dList.v_append (v_termGlobalNames dtb__474)) (v_termGlobalNames dtb__475)))
  | C_Term_TBool (dtb__476) -> B_dData_dList.C_List_Nil
  | C_Term_TStr (dtb__477) -> B_dData_dList.C_List_Nil
  | C_Term_TInt (dtb__478) -> B_dData_dList.C_List_Nil
  | C_Term_TCase (dtb__479, dtb__480) -> ((B_dData_dList.v_append (v_termGlobalNames dtb__479)) ((B_dData_dList.v_concatMap (fun (a : t_CaseAlt) -> (v_termGlobalNames (v_caseAltBody a)))) dtb__480))
  | C_Term_TRecUpd (dtb__481, dtb__482, dtb__483, dtb__484, dtb__485) -> ((B_dData_dList.v_append (v_termGlobalNames dtb__481)) (v_termGlobalNames dtb__485))
  | C_Term_TProj (dtb__486, dtb__487, dtb__488, dtb__489, dtb__490) -> (v_termGlobalNames dtb__486)
  | C_Term_TRecord (dtb__491, dtb__492) -> (B_dData_dList.C_List__x58__x58_ (dtb__491, ((B_dData_dList.v_concatMap (fun (p : (t_Term, t_Rig) B_dData_dPair.t_Pair) -> (v_termGlobalNames (B_dData_dPair.v_firstOf (Obj.magic p))))) dtb__492)))
  | C_Term_TMk (dtb__493, dtb__494) -> ((B_dData_dList.v_concatMap (fun (p : (t_Term, t_Rig) B_dData_dPair.t_Pair) -> (v_termGlobalNames (B_dData_dPair.v_firstOf (Obj.magic p))))) dtb__494)
  | C_Term_TCon (dtb__495, dtb__496) -> ((B_dData_dList.v_concatMap (fun (p : (t_Term, t_Rig) B_dData_dPair.t_Pair) -> (v_termGlobalNames (B_dData_dPair.v_firstOf (Obj.magic p))))) dtb__496)
  | C_Term_TApp (dtb__497, dtb__498, dtb__499) -> ((B_dData_dList.v_append (v_termGlobalNames dtb__497)) (v_termGlobalNames dtb__498))
  | C_Term_TLam (dtb__500, dtb__501, dtb__502, dtb__503, dtb__504) -> (v_termGlobalNames dtb__504)
  | C_Term_TPi (dtb__505, dtb__506, dtb__507, dtb__508, dtb__509) -> ((B_dData_dList.v_append (v_termGlobalNames dtb__508)) (v_termGlobalNames dtb__509))
  | C_Term_TType (dtb__510) -> B_dData_dList.C_List_Nil
  | C_Term_TMeta (dtb__511) -> B_dData_dList.C_List_Nil
  | C_Term_TVar (dtb__512, dtb__513, dtb__514) -> B_dData_dList.C_List_Nil
  | C_Term_TGlobal (dtb__515) -> (B_dData_dList.C_List__x58__x58_ (dtb__515, B_dData_dList.C_List_Nil))
  | C_Term_TFloat (dtb__516) -> B_dData_dList.C_List_Nil
  | _ -> failwith "DT: impossible branch"
))

# 531 "Vuna/Compiler/Core/Term.vuna"
let rec v_hasFreeVar = (fun (mc0 : int) (mc1 : t_Term) -> (match mc1 with
  | C_Term_TIf (dtb__517, dtb__518, dtb__519) -> (if (if ((v_hasFreeVar mc0) dtb__517) then true else ((v_hasFreeVar mc0) dtb__518)) then true else ((v_hasFreeVar mc0) dtb__519))
  | C_Term_TBool (dtb__520) -> false
  | C_Term_TFloat (dtb__521) -> false
  | C_Term_TStr (dtb__522) -> false
  | C_Term_TInt (dtb__523) -> false
  | C_Term_TCase (dtb__524, dtb__525) -> (if ((v_hasFreeVar mc0) dtb__524) then true else ((v_hasFreeVarAlts mc0) dtb__525))
  | C_Term_TRecUpd (dtb__526, dtb__527, dtb__528, dtb__529, dtb__530) -> (if ((v_hasFreeVar mc0) dtb__526) then true else ((v_hasFreeVar (mc0 + (B_dData_dList.v_length dtb__528))) dtb__530))
  | C_Term_TProj (dtb__531, dtb__532, dtb__533, dtb__534, dtb__535) -> ((v_hasFreeVar mc0) dtb__531)
  | C_Term_TRecord (dtb__536, dtb__537) -> ((v_hasFreeVarArgs mc0) dtb__537)
  | C_Term_TMk (dtb__538, dtb__539) -> ((v_hasFreeVarArgs mc0) dtb__539)
  | C_Term_TCon (dtb__540, dtb__541) -> ((v_hasFreeVarArgs mc0) dtb__541)
  | C_Term_TApp (dtb__542, dtb__543, dtb__544) -> (if ((v_hasFreeVar mc0) dtb__542) then true else ((v_hasFreeVar mc0) dtb__543))
  | C_Term_TLam (dtb__545, dtb__546, dtb__547, dtb__548, dtb__549) -> (let tys = (let nd_uscrut7 = dtb__547 in (match nd_uscrut7 with
  | B_dData_dMaybe.C_Maybe_Just (dtb__550) -> (match dtb__550 with
  | { B_dData_dPair.f_Pair_first = dtb__551; B_dData_dPair.f_Pair_second = dtb__552 } -> (match dtb__552 with
  | { B_dData_dPair.f_Pair_first = dtb__553; B_dData_dPair.f_Pair_second = dtb__554 } -> (if ((v_hasFreeVarMaybe mc0) dtb__553) then true else ((v_hasFreeVarMaybe (mc0 + 1)) dtb__554))
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
)
  | B_dData_dMaybe.C_Maybe_Nothing -> false
  | _ -> failwith "DT: impossible branch"
)) in (if tys then true else ((v_hasFreeVar (mc0 + 1)) dtb__549)))
  | C_Term_TPi (dtb__555, dtb__556, dtb__557, dtb__558, dtb__559) -> (if ((v_hasFreeVar mc0) dtb__558) then true else ((v_hasFreeVar (mc0 + 1)) dtb__559))
  | C_Term_TType (dtb__560) -> false
  | C_Term_TGlobal (dtb__561) -> false
  | C_Term_TMeta (dtb__562) -> false
  | C_Term_TVar (dtb__563, dtb__564, dtb__565) -> (dtb__564 >= mc0)
  | _ -> failwith "DT: impossible branch"
))
# 559 "Vuna/Compiler/Core/Term.vuna"
and v_hasFreeVarMaybe = (fun (mc0 : int) (mc1 : t_Term B_dData_dMaybe.t_Maybe) -> (match mc1 with
  | B_dData_dMaybe.C_Maybe_Just (dtb__566) -> ((v_hasFreeVar mc0) dtb__566)
  | B_dData_dMaybe.C_Maybe_Nothing -> false
  | _ -> failwith "DT: impossible branch"
))
# 563 "Vuna/Compiler/Core/Term.vuna"
and v_hasFreeVarArgs = (fun (mc0 : int) (mc1 : (t_Term, t_Rig) B_dData_dPair.t_Pair B_dData_dList.t_List) -> (match mc1 with
  | B_dData_dList.C_List__x58__x58_ (dtb__567, dtb__568) -> (match dtb__567 with
  | { B_dData_dPair.f_Pair_first = dtb__569; B_dData_dPair.f_Pair_second = dtb__570 } -> (if ((v_hasFreeVar mc0) dtb__569) then true else ((v_hasFreeVarArgs mc0) dtb__568))
  | _ -> failwith "DT: impossible branch"
)
  | B_dData_dList.C_List_Nil -> false
  | _ -> failwith "DT: impossible branch"
))
# 567 "Vuna/Compiler/Core/Term.vuna"
and v_hasFreeVarAlts = (fun (mc0 : int) (mc1 : t_CaseAlt B_dData_dList.t_List) -> (match mc1 with
  | B_dData_dList.C_List__x58__x58_ (dtb__571, dtb__572) -> (if ((v_hasFreeVar (mc0 + (B_dData_dList.v_length (v_caseAltBinders dtb__571)))) (v_caseAltBody dtb__571)) then true else ((v_hasFreeVarAlts mc0) dtb__572))
  | B_dData_dList.C_List_Nil -> false
  | _ -> failwith "DT: impossible branch"
))

# 572 "Vuna/Compiler/Core/Term.vuna"
let rec v_hasMeta = (fun (mc0 : int) (mc1 : int) (mc2 : t_Term) -> (match mc2 with
  | C_Term_TIf (dtb__573, dtb__574, dtb__575) -> (if (if (((v_hasMeta mc0) mc1) dtb__573) then true else (((v_hasMeta mc0) mc1) dtb__574)) then true else (((v_hasMeta mc0) mc1) dtb__575))
  | C_Term_TBool (dtb__576) -> false
  | C_Term_TFloat (dtb__577) -> false
  | C_Term_TStr (dtb__578) -> false
  | C_Term_TInt (dtb__579) -> false
  | C_Term_TCase (dtb__580, dtb__581) -> (if (((v_hasMeta mc0) mc1) dtb__580) then true else (((v_hasMetaAlts mc0) mc1) dtb__581))
  | C_Term_TRecUpd (dtb__582, dtb__583, dtb__584, dtb__585, dtb__586) -> (if (((v_hasMeta mc0) mc1) dtb__582) then true else (((v_hasMeta mc0) (mc1 + (B_dData_dList.v_length dtb__584))) dtb__586))
  | C_Term_TProj (dtb__587, dtb__588, dtb__589, dtb__590, dtb__591) -> (((v_hasMeta mc0) mc1) dtb__587)
  | C_Term_TRecord (dtb__592, dtb__593) -> (((v_hasMetaArgs mc0) mc1) dtb__593)
  | C_Term_TMk (dtb__594, dtb__595) -> (((v_hasMetaArgs mc0) mc1) dtb__595)
  | C_Term_TCon (dtb__596, dtb__597) -> (((v_hasMetaArgs mc0) mc1) dtb__597)
  | C_Term_TApp (dtb__598, dtb__599, dtb__600) -> (if (((v_hasMeta mc0) mc1) dtb__598) then true else (((v_hasMeta mc0) mc1) dtb__599))
  | C_Term_TLam (dtb__601, dtb__602, dtb__603, dtb__604, dtb__605) -> (let tys = (let nd_uscrut8 = dtb__603 in (match nd_uscrut8 with
  | B_dData_dMaybe.C_Maybe_Just (dtb__606) -> (match dtb__606 with
  | { B_dData_dPair.f_Pair_first = dtb__607; B_dData_dPair.f_Pair_second = dtb__608 } -> (match dtb__608 with
  | { B_dData_dPair.f_Pair_first = dtb__609; B_dData_dPair.f_Pair_second = dtb__610 } -> (if (((v_hasMetaMaybe mc0) mc1) dtb__609) then true else (((v_hasMetaMaybe mc0) (mc1 + 1)) dtb__610))
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
)
  | B_dData_dMaybe.C_Maybe_Nothing -> false
  | _ -> failwith "DT: impossible branch"
)) in (if tys then true else (((v_hasMeta mc0) (mc1 + 1)) dtb__605)))
  | C_Term_TPi (dtb__611, dtb__612, dtb__613, dtb__614, dtb__615) -> (if (((v_hasMeta mc0) mc1) dtb__614) then true else (((v_hasMeta mc0) (mc1 + 1)) dtb__615))
  | C_Term_TType (dtb__616) -> false
  | C_Term_TGlobal (dtb__617) -> false
  | C_Term_TVar (dtb__618, dtb__619, dtb__620) -> false
  | C_Term_TMeta (dtb__621) -> (mc0 = dtb__621)
  | _ -> failwith "DT: impossible branch"
))
# 599 "Vuna/Compiler/Core/Term.vuna"
and v_hasMetaMaybe = (fun (mc0 : int) (mc1 : int) (mc2 : t_Term B_dData_dMaybe.t_Maybe) -> (match mc2 with
  | B_dData_dMaybe.C_Maybe_Just (dtb__622) -> (((v_hasMeta mc0) mc1) dtb__622)
  | B_dData_dMaybe.C_Maybe_Nothing -> false
  | _ -> failwith "DT: impossible branch"
))
# 603 "Vuna/Compiler/Core/Term.vuna"
and v_hasMetaArgs = (fun (mc0 : int) (mc1 : int) (mc2 : (t_Term, t_Rig) B_dData_dPair.t_Pair B_dData_dList.t_List) -> (match mc2 with
  | B_dData_dList.C_List__x58__x58_ (dtb__623, dtb__624) -> (match dtb__623 with
  | { B_dData_dPair.f_Pair_first = dtb__625; B_dData_dPair.f_Pair_second = dtb__626 } -> (if (((v_hasMeta mc0) mc1) dtb__625) then true else (((v_hasMetaArgs mc0) mc1) dtb__624))
  | _ -> failwith "DT: impossible branch"
)
  | B_dData_dList.C_List_Nil -> false
  | _ -> failwith "DT: impossible branch"
))
# 607 "Vuna/Compiler/Core/Term.vuna"
and v_hasMetaAlts = (fun (mc0 : int) (mc1 : int) (mc2 : t_CaseAlt B_dData_dList.t_List) -> (match mc2 with
  | B_dData_dList.C_List__x58__x58_ (dtb__627, dtb__628) -> (if (((v_hasMeta mc0) (mc1 + (B_dData_dList.v_length (v_caseAltBinders dtb__627)))) (v_caseAltBody dtb__627)) then true else (((v_hasMetaAlts mc0) mc1) dtb__628))
  | B_dData_dList.C_List_Nil -> false
  | _ -> failwith "DT: impossible branch"
))

# 724 "Vuna/Compiler/Core/Term.vuna"
let rec v_substVarAt = (fun (mc0 : int) (mc1 : t_Term) (mc2 : t_Term) -> (match mc2 with
  | C_Term_TIf (dtb__629, dtb__630, dtb__631) -> (C_Term_TIf ((((v_substVarAt mc0) mc1) dtb__629), (((v_substVarAt mc0) mc1) dtb__630), (((v_substVarAt mc0) mc1) dtb__631)))
  | C_Term_TBool (dtb__632) -> mc2
  | C_Term_TFloat (dtb__633) -> mc2
  | C_Term_TStr (dtb__634) -> mc2
  | C_Term_TInt (dtb__635) -> mc2
  | C_Term_TCase (dtb__636, dtb__637) -> (C_Term_TCase ((((v_substVarAt mc0) mc1) dtb__636), ((B_dData_dList.v_map ((v_substAltAt mc0) mc1)) dtb__637)))
  | C_Term_TRecUpd (dtb__638, dtb__639, dtb__640, dtb__641, dtb__642) -> (C_Term_TRecUpd ((((v_substVarAt mc0) mc1) dtb__638), dtb__639, dtb__640, dtb__641, (((v_substVarAt (mc0 + (B_dData_dList.v_length dtb__640))) mc1) dtb__642)))
  | C_Term_TProj (dtb__643, dtb__644, dtb__645, dtb__646, dtb__647) -> (C_Term_TProj ((((v_substVarAt mc0) mc1) dtb__643), dtb__644, dtb__645, dtb__646, dtb__647))
  | C_Term_TRecord (dtb__648, dtb__649) -> (C_Term_TRecord (dtb__648, ((B_dData_dList.v_map (fun (p : (t_Term, t_Rig) B_dData_dPair.t_Pair) -> { B_dData_dPair.f_Pair_first = (((v_substVarAt mc0) mc1) (B_dData_dPair.v_firstOf (Obj.magic p))); B_dData_dPair.f_Pair_second = (B_dData_dPair.v_secondOf (Obj.magic p)) })) dtb__649)))
  | C_Term_TMk (dtb__650, dtb__651) -> (C_Term_TMk (dtb__650, ((B_dData_dList.v_map (fun (p : (t_Term, t_Rig) B_dData_dPair.t_Pair) -> { B_dData_dPair.f_Pair_first = (((v_substVarAt mc0) mc1) (B_dData_dPair.v_firstOf (Obj.magic p))); B_dData_dPair.f_Pair_second = (B_dData_dPair.v_secondOf (Obj.magic p)) })) dtb__651)))
  | C_Term_TCon (dtb__652, dtb__653) -> (C_Term_TCon (dtb__652, ((B_dData_dList.v_map (fun (p : (t_Term, t_Rig) B_dData_dPair.t_Pair) -> { B_dData_dPair.f_Pair_first = (((v_substVarAt mc0) mc1) (B_dData_dPair.v_firstOf (Obj.magic p))); B_dData_dPair.f_Pair_second = (B_dData_dPair.v_secondOf (Obj.magic p)) })) dtb__653)))
  | C_Term_TApp (dtb__654, dtb__655, dtb__656) -> (C_Term_TApp ((((v_substVarAt mc0) mc1) dtb__654), (((v_substVarAt mc0) mc1) dtb__655), dtb__656))
  | C_Term_TLam (dtb__657, dtb__658, dtb__659, dtb__660, dtb__661) -> (let slot2 = (let nd_uscrut8 = dtb__659 in (match nd_uscrut8 with
  | B_dData_dMaybe.C_Maybe_Just (dtb__662) -> (match dtb__662 with
  | { B_dData_dPair.f_Pair_first = dtb__663; B_dData_dPair.f_Pair_second = dtb__664 } -> (match dtb__664 with
  | { B_dData_dPair.f_Pair_first = dtb__665; B_dData_dPair.f_Pair_second = dtb__666 } -> (let bt2 = (match dtb__665 with
  | B_dData_dMaybe.C_Maybe_Nothing -> (Obj.magic B_dData_dMaybe.C_Maybe_Nothing)
  | B_dData_dMaybe.C_Maybe_Just (dtb__668) -> (B_dData_dMaybe.C_Maybe_Just ((((v_substVarAt mc0) mc1) dtb__668)))
  | _ -> failwith "DT: impossible branch"
) in (let rt2 = (match dtb__666 with
  | B_dData_dMaybe.C_Maybe_Nothing -> (Obj.magic B_dData_dMaybe.C_Maybe_Nothing)
  | B_dData_dMaybe.C_Maybe_Just (dtb__667) -> (B_dData_dMaybe.C_Maybe_Just ((((v_substVarAt (mc0 + 1)) mc1) dtb__667)))
  | _ -> failwith "DT: impossible branch"
) in (B_dData_dMaybe.C_Maybe_Just ({ B_dData_dPair.f_Pair_first = dtb__663; B_dData_dPair.f_Pair_second = { B_dData_dPair.f_Pair_first = bt2; B_dData_dPair.f_Pair_second = rt2 } }))))
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
)
  | B_dData_dMaybe.C_Maybe_Nothing -> B_dData_dMaybe.C_Maybe_Nothing
  | _ -> failwith "DT: impossible branch"
)) in (C_Term_TLam (dtb__657, dtb__658, slot2, dtb__660, (((v_substVarAt (mc0 + 1)) mc1) dtb__661))))
  | C_Term_TPi (dtb__669, dtb__670, dtb__671, dtb__672, dtb__673) -> (C_Term_TPi (dtb__669, dtb__670, dtb__671, (((v_substVarAt mc0) mc1) dtb__672), (((v_substVarAt (mc0 + 1)) mc1) dtb__673)))
  | C_Term_TType (dtb__674) -> mc2
  | C_Term_TGlobal (dtb__675) -> mc2
  | C_Term_TMeta (dtb__676) -> mc2
  | C_Term_TVar (dtb__677, dtb__678, dtb__679) -> (if (dtb__678 = mc0) then mc1 else mc2)
  | _ -> failwith "DT: impossible branch"
))
# 767 "Vuna/Compiler/Core/Term.vuna"
and v_substAltAt = (fun (idx : int) (arg : t_Term) (alt : t_CaseAlt) -> { f_CaseAlt_caseAltName = (v_caseAltName alt); f_CaseAlt_caseAltBinders = (v_caseAltBinders alt); f_CaseAlt_caseAltBody = (((v_substVarAt (idx + (B_dData_dList.v_length (v_caseAltBinders alt)))) arg) (v_caseAltBody alt)) })

# 840 "Vuna/Compiler/Core/Term.vuna"
let v_substMetasFuelFor = (fun (t : t_Term) -> (let need = (128 + (4 * (v_termSize t))) in (if (need > v_substMetasFuelMax) then v_substMetasFuelMax else need)))

# 850 "Vuna/Compiler/Core/Term.vuna"
let v_substMetas = (fun (resolve : (int) -> (int) -> t_Term B_dData_dMaybe.t_Maybe) (depth : int) (t : t_Term) -> ((((v_substMetasFuel (v_substMetasFuelFor t)) resolve) depth) t))

# 781 "Vuna/Compiler/Core/Term.vuna"
let v_substMetaVarGo = (fun (m : int) (name : string) (q : int) (depth : int) (t : t_Term) -> (((v_substMetas (fun (d : int) (n : int) -> (if (n = m) then (B_dData_dMaybe.C_Maybe_Just ((C_Term_TVar (name, (d - q), Base_dSource.v_spanEmpty)))) else B_dData_dMaybe.C_Maybe_Nothing))) depth) t))

# 778 "Vuna/Compiler/Core/Term.vuna"
let v_substMetaVar = (fun (m : int) (name : string) (q : int) (t : t_Term) -> (((((v_substMetaVarGo m) name) q) 0) t))

# 1096 "Vuna/Compiler/Core/Term.vuna"
let rec v_showTerm = (fun (mc0 : t_Term) -> (match mc0 with
  | C_Term_TIf (dtb__680, dtb__681, dtb__682) -> (String.concat "" ["if "; (v_showTerm dtb__680); " then "; (v_showTerm dtb__681); " else "; (v_showTerm dtb__682)])
  | C_Term_TBool (dtb__683) -> (if dtb__683 then "True" else "False")
  | C_Term_TFloat (dtb__684) -> dtb__684
  | C_Term_TStr (dtb__685) -> (v_showCoreString dtb__685)
  | C_Term_TInt (dtb__686) -> (string_of_int dtb__686)
  | C_Term_TCase (dtb__687, dtb__688) -> (String.concat "" ["case "; (v_showTerm dtb__687); " of "; (v_showCoreAlts dtb__688)])
  | C_Term_TRecUpd (dtb__689, dtb__690, dtb__691, dtb__692, dtb__693) -> (String.concat "" [(v_showTerm dtb__689); " with "; dtb__690; " "; (v_showTerm dtb__693)])
  | C_Term_TProj (dtb__694, dtb__695, dtb__696, dtb__697, dtb__698) -> (String.concat "" [(v_showTerm dtb__694); "."; dtb__695; "#"; (string_of_int dtb__698)])
  | C_Term_TRecord (dtb__699, dtb__700) -> ((v_recordAppShow dtb__699) dtb__700)
  | C_Term_TMk (dtb__701, dtb__702) -> (String.concat "" ["("; dtb__701; (v_showArgTerms dtb__702); ")"])
  | C_Term_TCon (dtb__703, dtb__704) -> (String.concat "" ["("; dtb__703; (v_showArgTerms dtb__704); ")"])
  | C_Term_TApp (dtb__705, dtb__706, dtb__707) -> (String.concat "" ["("; (v_showTerm dtb__705); " "; (v_showTerm dtb__706); ")"])
  | C_Term_TLam (dtb__708, dtb__709, dtb__710, dtb__711, dtb__712) -> (String.concat "" ["\\"; dtb__708; " => "; (v_showTerm dtb__712)])
  | C_Term_TPi (dtb__713, dtb__714, dtb__715, dtb__716, dtb__717) -> (if (dtb__713 = "_") then (String.concat "" [(v_showTerm dtb__716); " -> "; (v_showTerm dtb__717)]) else (if dtb__714 then (String.concat "" ["{"; dtb__713; " : "; (v_showTerm dtb__716); "} -> "; (v_showTerm dtb__717)]) else (String.concat "" ["("; dtb__713; " : "; (v_showTerm dtb__716); ") -> "; (v_showTerm dtb__717)])))
  | C_Term_TType (dtb__718) -> (if ((v_levelToInt dtb__718) = 0) then "Type" else ("Type " ^ (string_of_int (v_levelToInt dtb__718))))
  | C_Term_TGlobal (dtb__719) -> dtb__719
  | C_Term_TMeta (dtb__720) -> ("?" ^ (string_of_int dtb__720))
  | C_Term_TVar (dtb__721, dtb__722, dtb__723) -> dtb__721
  | _ -> failwith "DT: impossible branch"
))
# 1153 "Vuna/Compiler/Core/Term.vuna"
and v_showArgTerms = (fun (mc0 : (t_Term, t_Rig) B_dData_dPair.t_Pair B_dData_dList.t_List) -> (match mc0 with
  | B_dData_dList.C_List__x58__x58_ (dtb__724, dtb__725) -> (match dtb__724 with
  | { B_dData_dPair.f_Pair_first = dtb__726; B_dData_dPair.f_Pair_second = dtb__727 } -> (String.concat "" [" "; (v_showTerm dtb__726); (v_showArgTerms dtb__725)])
  | _ -> failwith "DT: impossible branch"
)
  | B_dData_dList.C_List_Nil -> ""
  | _ -> failwith "DT: impossible branch"
))
# 1158 "Vuna/Compiler/Core/Term.vuna"
and v_recordAppShow = (fun (mc0 : string) (mc1 : (t_Term, t_Rig) B_dData_dPair.t_Pair B_dData_dList.t_List) -> (match mc1 with
  | B_dData_dList.C_List__x58__x58_ (dtb__728, dtb__729) -> (match dtb__728 with
  | { B_dData_dPair.f_Pair_first = dtb__730; B_dData_dPair.f_Pair_second = dtb__731 } -> ((v_recordAppShow (String.concat "" ["("; mc0; " "; (v_showTerm dtb__730); ")"])) dtb__729)
  | _ -> failwith "DT: impossible branch"
)
  | B_dData_dList.C_List_Nil -> mc0
  | _ -> failwith "DT: impossible branch"
))
# 1168 "Vuna/Compiler/Core/Term.vuna"
and v_showCoreAlts = (fun (mc0 : t_CaseAlt B_dData_dList.t_List) -> (match mc0 with
  | B_dData_dList.C_List__x58__x58_ (dtb__732, dtb__733) -> (String.concat "" [(v_caseAltName dtb__732); (v_showBinders (v_binderPairs (v_caseAltBinders dtb__732))); " => "; (v_showTerm (v_caseAltBody dtb__732)); " | "; (v_showCoreAlts dtb__733)])
  | B_dData_dList.C_List_Nil -> ""
  | _ -> failwith "DT: impossible branch"
))

# 1128 "Vuna/Compiler/Core/Term.vuna"
let rec v_showPiSig = (fun (name : string) (implicit : bool) (dom : t_Term) (cod : t_Term) -> (if (name = "_") then (String.concat "" [(v_showSigParenIfPi dom); " -> "; (v_showTypeSig cod)]) else (if implicit then (String.concat "" ["{"; name; " : "; (v_showTypeSig dom); "} -> "; (v_showTypeSig cod)]) else (String.concat "" ["("; name; " : "; (v_showTypeSig dom); ") -> "; (v_showTypeSig cod)]))))
# 1137 "Vuna/Compiler/Core/Term.vuna"
and v_showTypeSig = (fun (mc0 : t_Term) -> (match mc0 with
  | C_Term_TRecord (dtb__734, dtb__735) -> ((v_showSigAppText dtb__734) dtb__735)
  | C_Term_TCon (dtb__736, dtb__737) -> (match dtb__737 with
  | B_dData_dList.C_List_Nil -> dtb__736
  | _ -> (String.concat "" ["("; dtb__736; (v_showSigArgs dtb__737); ")"])
)
  | C_Term_TApp (dtb__738, dtb__739, dtb__740) -> (String.concat "" ["("; (v_showSigParenIfPi dtb__738); " "; (v_showSigParenIfPi dtb__739); ")"])
  | C_Term_TPi (dtb__741, dtb__742, dtb__743, dtb__744, dtb__745) -> ((((v_showPiSig dtb__741) dtb__742) dtb__744) dtb__745)
  | _ -> (v_showTerm mc0)
))
# 1145 "Vuna/Compiler/Core/Term.vuna"
and v_showSigParenIfPi = (fun (mc0 : t_Term) -> (match mc0 with
  | C_Term_TPi (dtb__746, dtb__747, dtb__748, dtb__749, dtb__750) -> (String.concat "" ["("; ((((v_showPiSig dtb__746) dtb__747) dtb__749) dtb__750); ")"])
  | _ -> (v_showTypeSig mc0)
))
# 1149 "Vuna/Compiler/Core/Term.vuna"
and v_showSigArgs = (fun (mc0 : (t_Term, t_Rig) B_dData_dPair.t_Pair B_dData_dList.t_List) -> (match mc0 with
  | B_dData_dList.C_List__x58__x58_ (dtb__751, dtb__752) -> (match dtb__751 with
  | { B_dData_dPair.f_Pair_first = dtb__753; B_dData_dPair.f_Pair_second = dtb__754 } -> (String.concat "" [" "; (v_showSigParenIfPi dtb__753); (v_showSigArgs dtb__752)])
  | _ -> failwith "DT: impossible branch"
)
  | B_dData_dList.C_List_Nil -> ""
  | _ -> failwith "DT: impossible branch"
))
# 1163 "Vuna/Compiler/Core/Term.vuna"
and v_showSigAppText = (fun (mc0 : string) (mc1 : (t_Term, t_Rig) B_dData_dPair.t_Pair B_dData_dList.t_List) -> (match mc1 with
  | B_dData_dList.C_List__x58__x58_ (dtb__755, dtb__756) -> (match dtb__755 with
  | { B_dData_dPair.f_Pair_first = dtb__757; B_dData_dPair.f_Pair_second = dtb__758 } -> ((v_showSigAppText (String.concat "" ["("; mc0; " "; (v_showSigParenIfPi dtb__757); ")"])) dtb__756)
  | _ -> failwith "DT: impossible branch"
)
  | B_dData_dList.C_List_Nil -> mc0
  | _ -> failwith "DT: impossible branch"
))

# 192 "Vuna/Compiler/Core/Term.vuna"
let v_closureEnv = (fun (p : t_Closure) -> (match p with
  | { f_Closure_closureEnv = dtb__759; f_Closure_closureBody = dtb__760 } -> dtb__759
  | _ -> failwith "DT: impossible branch"
))

# 193 "Vuna/Compiler/Core/Term.vuna"
let v_closureBody = (fun (p : t_Closure) -> (match p with
  | { f_Closure_closureEnv = dtb__761; f_Closure_closureBody = dtb__762 } -> dtb__762
  | _ -> failwith "DT: impossible branch"
))

# 222 "Vuna/Compiler/Core/Term.vuna"
let v_vCaseAltName = (fun (p : t_VCaseAlt) -> (match p with
  | { f_VCaseAlt_vCaseAltName = dtb__763; f_VCaseAlt_vCaseAltBinders = dtb__764; f_VCaseAlt_vCaseAltClosure = dtb__765 } -> dtb__763
  | _ -> failwith "DT: impossible branch"
))

# 223 "Vuna/Compiler/Core/Term.vuna"
let v_vCaseAltBinders = (fun (p : t_VCaseAlt) -> (match p with
  | { f_VCaseAlt_vCaseAltName = dtb__766; f_VCaseAlt_vCaseAltBinders = dtb__767; f_VCaseAlt_vCaseAltClosure = dtb__768 } -> dtb__767
  | _ -> failwith "DT: impossible branch"
))

# 224 "Vuna/Compiler/Core/Term.vuna"
let v_vCaseAltClosure = (fun (p : t_VCaseAlt) -> (match p with
  | { f_VCaseAlt_vCaseAltName = dtb__769; f_VCaseAlt_vCaseAltBinders = dtb__770; f_VCaseAlt_vCaseAltClosure = dtb__771 } -> dtb__771
  | _ -> failwith "DT: impossible branch"
))

# 986 "Vuna/Compiler/Core/Term.vuna"
let rec v_hasUnsolvedMetaValueFuel = (fun (fuel : int) (sols : t_Sols) (v : t_Value) -> (if (fuel <= 0) then true else (match v with
  | C_Value_VMeta (dtb__772, dtb__773) -> (match ((v_solsLookup dtb__772) sols) with
  | B_dData_dMaybe.C_Maybe_Just (dtb__774) -> (((v_hasUnsolvedMetaValueFuel (fuel - 1)) sols) dtb__774)
  | B_dData_dMaybe.C_Maybe_Nothing -> true
  | _ -> failwith "DT: impossible branch"
)
  | C_Value_VNeutral (dtb__775) -> (match dtb__775 with
  | C_Neutral_NVar (dtb__776, dtb__777, dtb__778) -> (((v_hasUnsolvedMetaListFuel (fuel - 1)) sols) dtb__778)
  | C_Neutral_NGlobal (dtb__779, dtb__780) -> (((v_hasUnsolvedMetaListFuel (fuel - 1)) sols) dtb__780)
  | _ -> failwith "DT: impossible branch"
)
  | C_Value_VPi (dtb__781, dtb__782, dtb__783, dtb__784, dtb__785) -> (if (((v_hasUnsolvedMetaValueFuel (fuel - 1)) sols) dtb__784) then true else (((v_hasUnsolvedMetaCloFuel (fuel - 1)) sols) dtb__785))
  | C_Value_VLam (dtb__786, dtb__787, dtb__788) -> (((v_hasUnsolvedMetaCloFuel (fuel - 1)) sols) dtb__788)
  | C_Value_VCon (dtb__789, dtb__790) -> (((v_hasUnsolvedMetaListFuel (fuel - 1)) sols) dtb__790)
  | C_Value_VApp (dtb__791, dtb__792) -> (if (((v_hasUnsolvedMetaValueFuel (fuel - 1)) sols) dtb__791) then true else (((v_hasUnsolvedMetaValueFuel (fuel - 1)) sols) dtb__792))
  | C_Value_VCase (dtb__793, dtb__794) -> (if (((v_hasUnsolvedMetaValueFuel (fuel - 1)) sols) dtb__793) then true else (((v_hasUnsolvedMetaCaseAltsFuel (fuel - 1)) sols) dtb__794))
  | C_Value_VProj (dtb__795, dtb__796, dtb__797, dtb__798, dtb__799) -> (((v_hasUnsolvedMetaValueFuel (fuel - 1)) sols) dtb__795)
  | C_Value_VIf (dtb__800, dtb__801, dtb__802) -> (if (if (((v_hasUnsolvedMetaValueFuel (fuel - 1)) sols) dtb__800) then true else (((v_hasUnsolvedMetaValueFuel (fuel - 1)) sols) dtb__801)) then true else (((v_hasUnsolvedMetaValueFuel (fuel - 1)) sols) dtb__802))
  | _ -> false
)))
# 1014 "Vuna/Compiler/Core/Term.vuna"
and v_hasUnsolvedMetaListFuel = (fun (fuel : int) (sols : t_Sols) (vs : t_Value B_dData_dList.t_List) -> (if (fuel <= 0) then true else (match vs with
  | B_dData_dList.C_List_Nil -> false
  | B_dData_dList.C_List__x58__x58_ (dtb__803, dtb__804) -> (if (((v_hasUnsolvedMetaValueFuel (fuel - 1)) sols) dtb__803) then true else (((v_hasUnsolvedMetaListFuel (fuel - 1)) sols) dtb__804))
  | _ -> failwith "DT: impossible branch"
)))
# 1023 "Vuna/Compiler/Core/Term.vuna"
and v_hasUnsolvedMetaCaseAltsFuel = (fun (fuel : int) (sols : t_Sols) (alts : t_VCaseAlt B_dData_dList.t_List) -> (if (fuel <= 0) then true else (match alts with
  | B_dData_dList.C_List_Nil -> false
  | B_dData_dList.C_List__x58__x58_ (dtb__805, dtb__806) -> (if (((v_hasUnsolvedMetaCloFuel (fuel - 1)) sols) (v_vCaseAltClosure dtb__805)) then true else (((v_hasUnsolvedMetaCaseAltsFuel (fuel - 1)) sols) dtb__806))
  | _ -> failwith "DT: impossible branch"
)))
# 1035 "Vuna/Compiler/Core/Term.vuna"
and v_hasUnsolvedMetaCloFuel = (fun (fuel : int) (sols : t_Sols) (clo : t_Closure) -> (if (fuel <= 0) then true else (match clo with
  | { f_Closure_closureEnv = dtb__807; f_Closure_closureBody = dtb__808 } -> (if (((v_hasUnsolvedMetaListFuel (fuel - 1)) sols) dtb__807) then true else (((v_termHasUnsolvedMetaFuel (fuel - 1)) sols) dtb__808))
  | _ -> failwith "DT: impossible branch"
)))

# 983 "Vuna/Compiler/Core/Term.vuna"
let v_hasUnsolvedMetaValue = (fun (sols : t_Sols) (v : t_Value) -> (((v_hasUnsolvedMetaValueFuel v_metaScanBound) sols) v))

# 1011 "Vuna/Compiler/Core/Term.vuna"
let v_hasUnsolvedMetaList = (fun (sols : t_Sols) (vs : t_Value B_dData_dList.t_List) -> (((v_hasUnsolvedMetaListFuel v_metaScanBound) sols) vs))

# 1032 "Vuna/Compiler/Core/Term.vuna"
let v_hasUnsolvedMetaClo = (fun (sols : t_Sols) (clo : t_Closure) -> (((v_hasUnsolvedMetaCloFuel v_metaScanBound) sols) clo))

# 1059 "Vuna/Compiler/Core/Term.vuna"
let rec v_levelEscapes = (fun (mc0 : int) (mc1 : int) (mc2 : t_Value) -> (match mc2 with
  | C_Value_VBool (dtb__809) -> false
  | C_Value_VFloat (dtb__810) -> false
  | C_Value_VStr (dtb__811) -> false
  | C_Value_VInt (dtb__812) -> false
  | C_Value_VType (dtb__813) -> false
  | C_Value_VIf (dtb__814, dtb__815, dtb__816) -> (if (if (((v_levelEscapes mc0) mc1) dtb__814) then true else (((v_levelEscapes mc0) mc1) dtb__815)) then true else (((v_levelEscapes mc0) mc1) dtb__816))
  | C_Value_VProj (dtb__817, dtb__818, dtb__819, dtb__820, dtb__821) -> (((v_levelEscapes mc0) mc1) dtb__817)
  | C_Value_VCase (dtb__822, dtb__823) -> (if (((v_levelEscapes mc0) mc1) dtb__822) then true else ((v_levelEscapesAlts mc0) dtb__823))
  | C_Value_VApp (dtb__824, dtb__825) -> (if (((v_levelEscapes mc0) mc1) dtb__824) then true else (((v_levelEscapes mc0) mc1) dtb__825))
  | C_Value_VCon (dtb__826, dtb__827) -> ((v_levelEscapesList mc0) dtb__827)
  | C_Value_VMeta (dtb__828, dtb__829) -> ((v_levelEscapesList mc0) dtb__829)
  | C_Value_VLam (dtb__830, dtb__831, dtb__832) -> ((v_levelEscapesClo mc0) dtb__832)
  | C_Value_VPi (dtb__833, dtb__834, dtb__835, dtb__836, dtb__837) -> (if (((v_levelEscapes mc0) mc1) dtb__836) then true else ((v_levelEscapesClo mc0) dtb__837))
  | C_Value_VNeutral (dtb__838) -> (match dtb__838 with
  | C_Neutral_NVar (dtb__839, dtb__840, dtb__841) -> (if (dtb__840 >= mc0) then true else ((v_levelEscapesList mc0) dtb__841))
  | C_Neutral_NGlobal (dtb__842, dtb__843) -> ((v_levelEscapesList mc0) dtb__843)
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
))
# 1082 "Vuna/Compiler/Core/Term.vuna"
and v_levelEscapesList = (fun (mc0 : int) (mc1 : t_Value B_dData_dList.t_List) -> (match mc1 with
  | B_dData_dList.C_List__x58__x58_ (dtb__844, dtb__845) -> (if (((v_levelEscapes mc0) 0) dtb__844) then true else ((v_levelEscapesList mc0) dtb__845))
  | B_dData_dList.C_List_Nil -> false
  | _ -> failwith "DT: impossible branch"
))
# 1086 "Vuna/Compiler/Core/Term.vuna"
and v_levelEscapesClo = (fun (mc0 : int) (mc1 : t_Closure) -> (match mc1 with
  | { f_Closure_closureEnv = dtb__846; f_Closure_closureBody = dtb__847 } -> ((v_levelEscapesList mc0) dtb__846)
  | _ -> failwith "DT: impossible branch"
))
# 1091 "Vuna/Compiler/Core/Term.vuna"
and v_levelEscapesAlts = (fun (mc0 : int) (mc1 : t_VCaseAlt B_dData_dList.t_List) -> (match mc1 with
  | B_dData_dList.C_List__x58__x58_ (dtb__848, dtb__849) -> (if ((v_levelEscapesClo mc0) (v_vCaseAltClosure dtb__848)) then true else ((v_levelEscapesAlts mc0) dtb__849))
  | B_dData_dList.C_List_Nil -> false
  | _ -> failwith "DT: impossible branch"
))

# 373 "Vuna/Compiler/Core/Term.vuna"
let v_solsTbl = (fun (p : t_Sols) -> (match p with
  | { f_Sols_solsTbl = dtb__850; f_Sols_solsList = dtb__851; f_Sols_solsDepth = dtb__852 } -> dtb__850
  | _ -> failwith "DT: impossible branch"
))

# 374 "Vuna/Compiler/Core/Term.vuna"
let v_solsList = (fun (p : t_Sols) -> (match p with
  | { f_Sols_solsTbl = dtb__853; f_Sols_solsList = dtb__854; f_Sols_solsDepth = dtb__855 } -> dtb__854
  | _ -> failwith "DT: impossible branch"
))

# 375 "Vuna/Compiler/Core/Term.vuna"
let v_solsDepth = (fun (p : t_Sols) -> (match p with
  | { f_Sols_solsTbl = dtb__856; f_Sols_solsList = dtb__857; f_Sols_solsDepth = dtb__858 } -> dtb__858
  | _ -> failwith "DT: impossible branch"
))
