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
let v_rigIsErased = (fun (dtb_u_u1 : t_Rig) -> (match dtb_u_u1 with
  | C_Rig_RigOmega -> false
  | C_Rig_Rig1 -> false
  | C_Rig_Rig0 -> true
  | _ -> failwith "DT: impossible branch"
))

# 40 "Vuna/Compiler/Core/Term.vuna"
let v_rigIsLinear = (fun (dtb_u_u2 : t_Rig) -> (match dtb_u_u2 with
  | C_Rig_Rig1 -> true
  | _ -> false
))

# 44 "Vuna/Compiler/Core/Term.vuna"
let v_rigIsOmega = (fun (dtb_u_u3 : t_Rig) -> (match dtb_u_u3 with
  | C_Rig_RigOmega -> true
  | _ -> false
))

# 50 "Vuna/Compiler/Core/Term.vuna"
let v_rigOfBinder = (fun (dtb_u_u4 : bool) (dtb_u_u5 : bool) -> (if dtb_u_u4 then C_Rig_Rig0 else (if dtb_u_u5 then C_Rig_Rig0 else C_Rig_RigOmega)))

# 55 "Vuna/Compiler/Core/Term.vuna"
let v_defaultExplicitRig = C_Rig_RigOmega

# 62 "Vuna/Compiler/Core/Term.vuna"
let v_rigAdd = (fun (dtb_u_u6 : t_Rig) (dtb_u_u7 : t_Rig) -> (match dtb_u_u6 with
  | C_Rig_Rig1 -> (match dtb_u_u7 with
  | C_Rig_Rig1 -> C_Rig_RigOmega
  | C_Rig_Rig0 -> dtb_u_u6
  | _ -> C_Rig_RigOmega
)
  | C_Rig_Rig0 -> dtb_u_u7
  | _ -> (match dtb_u_u7 with
  | C_Rig_Rig0 -> dtb_u_u6
  | _ -> C_Rig_RigOmega
)
))

# 68 "Vuna/Compiler/Core/Term.vuna"
let v_rigScale = (fun (dtb_u_u8 : t_Rig) (dtb_u_u9 : t_Rig) -> (match dtb_u_u8 with
  | C_Rig_RigOmega -> (match dtb_u_u9 with
  | C_Rig_Rig0 -> C_Rig_Rig0
  | _ -> C_Rig_RigOmega
)
  | C_Rig_Rig1 -> (match dtb_u_u9 with
  | C_Rig_Rig0 -> C_Rig_Rig0
  | _ -> dtb_u_u9
)
  | C_Rig_Rig0 -> C_Rig_Rig0
  | _ -> failwith "DT: impossible branch"
))

# 74 "Vuna/Compiler/Core/Term.vuna"
let v_rigJoin = (fun (dtb_u_u10 : t_Rig) (dtb_u_u11 : t_Rig) -> (match dtb_u_u10 with
  | C_Rig_RigOmega -> C_Rig_RigOmega
  | C_Rig_Rig1 -> (match dtb_u_u11 with
  | C_Rig_RigOmega -> C_Rig_RigOmega
  | C_Rig_Rig1 -> C_Rig_Rig1
  | _ -> C_Rig_RigOmega
)
  | C_Rig_Rig0 -> (match dtb_u_u11 with
  | C_Rig_RigOmega -> C_Rig_RigOmega
  | C_Rig_Rig0 -> C_Rig_Rig0
  | _ -> C_Rig_RigOmega
)
  | _ -> failwith "DT: impossible branch"
))

# 82 "Vuna/Compiler/Core/Term.vuna"
let v_rigExact = (fun (dtb_u_u12 : t_Rig) (dtb_u_u13 : t_Rig) -> (match dtb_u_u12 with
  | C_Rig_RigOmega -> true
  | C_Rig_Rig1 -> (match dtb_u_u13 with
  | C_Rig_Rig1 -> true
  | _ -> false
)
  | C_Rig_Rig0 -> (match dtb_u_u13 with
  | C_Rig_Rig0 -> true
  | _ -> false
)
  | _ -> failwith "DT: impossible branch"
))

# 89 "Vuna/Compiler/Core/Term.vuna"
let v_showRig = (fun (dtb_u_u14 : t_Rig) -> (match dtb_u_u14 with
  | C_Rig_RigOmega -> "\207\137"
  | C_Rig_Rig1 -> "1"
  | C_Rig_Rig0 -> "0"
  | _ -> failwith "DT: impossible branch"
))

# 100 "Vuna/Compiler/Core/Term.vuna"
let v_levelZero = 0

# 103 "Vuna/Compiler/Core/Term.vuna"
let v_levelSucc = (fun (dtb_u_u15 : t_Level) -> (let dtb_u_u16 = dtb_u_u15 in (dtb_u_u16 + 1)))

# 106 "Vuna/Compiler/Core/Term.vuna"
let v_levelMax = (fun (dtb_u_u17 : t_Level) (dtb_u_u18 : t_Level) -> (let dtb_u_u19 = dtb_u_u17 in (let dtb_u_u20 = dtb_u_u18 in (if (dtb_u_u19 >= dtb_u_u20) then dtb_u_u19 else dtb_u_u20))))

# 110 "Vuna/Compiler/Core/Term.vuna"
let v_levelOfInt = (fun (dtb_u_u21 : int) -> dtb_u_u21)

# 113 "Vuna/Compiler/Core/Term.vuna"
let v_levelEq = (fun (dtb_u_u22 : t_Level) (dtb_u_u23 : t_Level) -> (let dtb_u_u24 = dtb_u_u22 in (let dtb_u_u25 = dtb_u_u23 in (dtb_u_u24 = dtb_u_u25))))

# 116 "Vuna/Compiler/Core/Term.vuna"
let v_levelLt = (fun (dtb_u_u26 : t_Level) (dtb_u_u27 : t_Level) -> (let dtb_u_u28 = dtb_u_u26 in (let dtb_u_u29 = dtb_u_u27 in (dtb_u_u28 < dtb_u_u29))))

# 163 "Vuna/Compiler/Core/Term.vuna"
let v_binderNameOf = (fun (dtb_u_u30 : t_Binder) -> (match dtb_u_u30 with
  | { f_Binder_binderName = dtb_u_u31; f_Binder_binderRig = dtb_u_u32; f_Binder_binderSpan = dtb_u_u33 } -> dtb_u_u31
  | _ -> failwith "DT: impossible branch"
))

# 166 "Vuna/Compiler/Core/Term.vuna"
let v_binderRigOf = (fun (dtb_u_u34 : t_Binder) -> (match dtb_u_u34 with
  | { f_Binder_binderName = dtb_u_u35; f_Binder_binderRig = dtb_u_u36; f_Binder_binderSpan = dtb_u_u37 } -> dtb_u_u36
  | _ -> failwith "DT: impossible branch"
))

# 169 "Vuna/Compiler/Core/Term.vuna"
let v_binderSpanOf = (fun (dtb_u_u38 : t_Binder) -> (match dtb_u_u38 with
  | { f_Binder_binderName = dtb_u_u39; f_Binder_binderRig = dtb_u_u40; f_Binder_binderSpan = dtb_u_u41 } -> dtb_u_u41
  | _ -> failwith "DT: impossible branch"
))

# 173 "Vuna/Compiler/Core/Term.vuna"
let v_binderPair = (fun (dtb_u_u42 : t_Binder) -> { B_dData_dPair.f_Pair_first = (v_binderNameOf dtb_u_u42); B_dData_dPair.f_Pair_second = (v_binderRigOf dtb_u_u42) })

# 176 "Vuna/Compiler/Core/Term.vuna"
let v_binderPairs = (fun (dtb_u_u43 : t_Binder B_dData_dList.t_List) -> ((B_dData_dList.v_map v_binderPair) dtb_u_u43))

# 180 "Vuna/Compiler/Core/Term.vuna"
let v_binderOfPair = (fun (dtb_u_u44 : (string, t_Rig) B_dData_dPair.t_Pair) -> (match dtb_u_u44 with
  | { B_dData_dPair.f_Pair_first = dtb_u_u45; B_dData_dPair.f_Pair_second = dtb_u_u46 } -> { f_Binder_binderName = dtb_u_u45; f_Binder_binderRig = dtb_u_u46; f_Binder_binderSpan = Base_dSource.v_spanEmpty }
  | _ -> failwith "DT: impossible branch"
))

# 183 "Vuna/Compiler/Core/Term.vuna"
let v_bindersOfPairs = (fun (dtb_u_u47 : (string, t_Rig) B_dData_dPair.t_Pair B_dData_dList.t_List) -> ((B_dData_dList.v_map v_binderOfPair) dtb_u_u47))

# 227 "Vuna/Compiler/Core/Term.vuna"
let v_defaultFuel = 512

# 241 "Vuna/Compiler/Core/Term.vuna"
let v_natChainMax = 4611686018427387903

# 280 "Vuna/Compiler/Core/Term.vuna"
let v_natChainNext = (fun (dtb_u_u48 : int) -> (if (dtb_u_u48 >= v_natChainMax) then v_natChainMax else (dtb_u_u48 + 1)))

# 287 "Vuna/Compiler/Core/Term.vuna"
let rec v_flattenTermAppGo = (fun (dtb_u_u49 : t_Term) (dtb_u_u50 : (t_Term, t_Rig) B_dData_dPair.t_Pair B_dData_dList.t_List) -> (match dtb_u_u49 with
  | C_Term_TRecord (dtb_u_u51, dtb_u_u52) -> { B_dData_dPair.f_Pair_first = (C_Term_TGlobal (dtb_u_u51)); B_dData_dPair.f_Pair_second = ((B_dData_dList.v_append dtb_u_u52) dtb_u_u50) }
  | C_Term_TApp (dtb_u_u53, dtb_u_u54, dtb_u_u55) -> ((v_flattenTermAppGo dtb_u_u53) (B_dData_dList.C_List__x58__x58_ ({ B_dData_dPair.f_Pair_first = dtb_u_u54; B_dData_dPair.f_Pair_second = dtb_u_u55 }, dtb_u_u50)))
  | _ -> { B_dData_dPair.f_Pair_first = dtb_u_u49; B_dData_dPair.f_Pair_second = dtb_u_u50 }
))

# 284 "Vuna/Compiler/Core/Term.vuna"
let v_flattenTermApp = (fun (dtb_u_u56 : t_Term) -> ((v_flattenTermAppGo dtb_u_u56) B_dData_dList.C_List_Nil))

# 251 "Vuna/Compiler/Core/Term.vuna"
let rec v_natChainGo = (fun (dtb_u_u57 : int) (dtb_u_u58 : t_Term) -> (if (dtb_u_u57 <= 0) then B_dData_dMaybe.C_Maybe_Nothing else (match (v_flattenTermApp dtb_u_u58) with
  | { B_dData_dPair.f_Pair_first = dtb_u_u59; B_dData_dPair.f_Pair_second = dtb_u_u60 } -> (match dtb_u_u59 with
  | C_Term_TCon (dtb_u_u61, dtb_u_u62) -> (((v_natChainArgs (dtb_u_u57 - 1)) dtb_u_u61) ((B_dData_dList.v_append dtb_u_u62) dtb_u_u60))
  | C_Term_TGlobal (dtb_u_u63) -> (((v_natChainArgs (dtb_u_u57 - 1)) dtb_u_u63) dtb_u_u60)
  | _ -> B_dData_dMaybe.C_Maybe_Nothing
)
  | _ -> failwith "DT: impossible branch"
)))
# 263 "Vuna/Compiler/Core/Term.vuna"
and v_natChainArgs = (fun (dtb_u_u64 : int) (dtb_u_u65 : string) (dtb_u_u66 : (t_Term, t_Rig) B_dData_dPair.t_Pair B_dData_dList.t_List) -> (if (dtb_u_u65 = Base_dIntrinsics.v_natZeroCtor) then (match dtb_u_u66 with
  | B_dData_dList.C_List_Nil -> (B_dData_dMaybe.C_Maybe_Just (0))
  | _ -> B_dData_dMaybe.C_Maybe_Nothing
) else (if (dtb_u_u65 = Base_dIntrinsics.v_natSuccCtor) then (let dtb_u_u67 = dtb_u_u66 in (match dtb_u_u67 with
  | B_dData_dList.C_List__x58__x58_ (dtb_u_u68, dtb_u_u69) -> (match dtb_u_u68 with
  | { B_dData_dPair.f_Pair_first = dtb_u_u70; B_dData_dPair.f_Pair_second = dtb_u_u71 } -> (match dtb_u_u69 with
  | B_dData_dList.C_List_Nil -> (match ((v_natChainGo dtb_u_u64) dtb_u_u70) with
  | B_dData_dMaybe.C_Maybe_Just (dtb_u_u72) -> (B_dData_dMaybe.C_Maybe_Just ((v_natChainNext dtb_u_u72)))
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
let v_natChainValue = (fun (dtb_u_u73 : t_Term) -> ((v_natChainGo 1000000) dtb_u_u73))

# 304 "Vuna/Compiler/Core/Term.vuna"
let v_termSizeCap = 1000000

# 334 "Vuna/Compiler/Core/Term.vuna"
let[@tail_mod_cons] rec v_termSizeArgTerms = (fun (dtb_u_u74 : (t_Term, t_Rig) B_dData_dPair.t_Pair B_dData_dList.t_List) -> (match dtb_u_u74 with
  | B_dData_dList.C_List__x58__x58_ (dtb_u_u75, dtb_u_u76) -> (match dtb_u_u75 with
  | { B_dData_dPair.f_Pair_first = dtb_u_u77; B_dData_dPair.f_Pair_second = dtb_u_u78 } -> (B_dData_dList.C_List__x58__x58_ (dtb_u_u77, (v_termSizeArgTerms dtb_u_u76)))
  | _ -> failwith "DT: impossible branch"
)
  | B_dData_dList.C_List_Nil -> B_dData_dList.C_List_Nil
  | _ -> failwith "DT: impossible branch"
))

# 347 "Vuna/Compiler/Core/Term.vuna"
let v_termSizeMaybeTerms = (fun (dtb_u_u79 : t_Term B_dData_dMaybe.t_Maybe) -> (match dtb_u_u79 with
  | B_dData_dMaybe.C_Maybe_Just (dtb_u_u80) -> (B_dData_dList.C_List__x58__x58_ (dtb_u_u80, B_dData_dList.C_List_Nil))
  | B_dData_dMaybe.C_Maybe_Nothing -> B_dData_dList.C_List_Nil
  | _ -> failwith "DT: impossible branch"
))

# 342 "Vuna/Compiler/Core/Term.vuna"
let v_termSizeSlotTerms = (fun (dtb_u_u81 : (t_LamMark, (t_Term B_dData_dMaybe.t_Maybe, t_Term B_dData_dMaybe.t_Maybe) B_dData_dPair.t_Pair) B_dData_dPair.t_Pair B_dData_dMaybe.t_Maybe) -> (match dtb_u_u81 with
  | B_dData_dMaybe.C_Maybe_Just (dtb_u_u82) -> ((B_dData_dList.v_append (v_termSizeMaybeTerms (B_dData_dPair.v_firstOf (B_dData_dPair.v_secondOf dtb_u_u82)))) (v_termSizeMaybeTerms (B_dData_dPair.v_secondOf (B_dData_dPair.v_secondOf dtb_u_u82))))
  | B_dData_dMaybe.C_Maybe_Nothing -> B_dData_dList.C_List_Nil
  | _ -> failwith "DT: impossible branch"
))

# 355 "Vuna/Compiler/Core/Term.vuna"
let v_metaLookup = (fun (dtb_u_u83 : int) (dtb_u_u84 : (int, t_Value) B_dContainer_dHashMap.t_HashMap) -> ((((B_dContainer_dHashMap.v_lookup B_dData_dInt.v_Hashable_ue4b0f10b020a5e82_uInt) B_dData_dInt.v_Eq_u018fc178ff3df1b4_uInt) dtb_u_u83) dtb_u_u84))

# 359 "Vuna/Compiler/Core/Term.vuna"
let rec v_metaLookupList = (fun (dtb_u_u85 : int) (dtb_u_u86 : (int, t_Value) B_dData_dPair.t_Pair B_dData_dList.t_List) -> (match dtb_u_u86 with
  | B_dData_dList.C_List__x58__x58_ (dtb_u_u87, dtb_u_u88) -> (match dtb_u_u87 with
  | { B_dData_dPair.f_Pair_first = dtb_u_u89; B_dData_dPair.f_Pair_second = dtb_u_u90 } -> (if (dtb_u_u85 = dtb_u_u89) then (B_dData_dMaybe.C_Maybe_Just (dtb_u_u90)) else ((v_metaLookupList dtb_u_u85) dtb_u_u88))
  | _ -> failwith "DT: impossible branch"
)
  | B_dData_dList.C_List_Nil -> B_dData_dMaybe.C_Maybe_Nothing
  | _ -> failwith "DT: impossible branch"
))

# 378 "Vuna/Compiler/Core/Term.vuna"
let v_solsEmpty = { f_Sols_solsTbl = (((B_dContainer_dHashMap.v_fromList B_dData_dInt.v_Hashable_ue4b0f10b020a5e82_uInt) B_dData_dInt.v_Eq_u018fc178ff3df1b4_uInt) B_dData_dList.C_List_Nil); f_Sols_solsList = B_dData_dList.C_List_Nil; f_Sols_solsDepth = (((B_dContainer_dHashMap.v_fromList B_dData_dInt.v_Hashable_ue4b0f10b020a5e82_uInt) B_dData_dInt.v_Eq_u018fc178ff3df1b4_uInt) B_dData_dList.C_List_Nil) }

# 381 "Vuna/Compiler/Core/Term.vuna"
let v_solsFromList = (fun (dtb_u_u91 : (int, t_Value) B_dData_dPair.t_Pair B_dData_dList.t_List) -> { f_Sols_solsTbl = ((((B_dContainer_dHashMap.v_insertAll B_dData_dInt.v_Hashable_ue4b0f10b020a5e82_uInt) B_dData_dInt.v_Eq_u018fc178ff3df1b4_uInt) dtb_u_u91) (((B_dContainer_dHashMap.v_fromList B_dData_dInt.v_Hashable_ue4b0f10b020a5e82_uInt) B_dData_dInt.v_Eq_u018fc178ff3df1b4_uInt) B_dData_dList.C_List_Nil)); f_Sols_solsList = dtb_u_u91; f_Sols_solsDepth = (((B_dContainer_dHashMap.v_fromList B_dData_dInt.v_Hashable_ue4b0f10b020a5e82_uInt) B_dData_dInt.v_Eq_u018fc178ff3df1b4_uInt) B_dData_dList.C_List_Nil) })

# 385 "Vuna/Compiler/Core/Term.vuna"
let v_solsOf = (fun (dtb_u_u92 : (int, t_Value) B_dContainer_dHashMap.t_HashMap) (dtb_u_u93 : (int, t_Value) B_dData_dPair.t_Pair B_dData_dList.t_List) (dtb_u_u94 : (int, int) B_dContainer_dHashMap.t_HashMap) -> { f_Sols_solsTbl = dtb_u_u92; f_Sols_solsList = dtb_u_u93; f_Sols_solsDepth = dtb_u_u94 })

# 389 "Vuna/Compiler/Core/Term.vuna"
let v_solsDepthAt = (fun (dtb_u_u95 : int) (dtb_u_u96 : t_Sols) -> (match dtb_u_u96 with
  | { f_Sols_solsTbl = dtb_u_u97; f_Sols_solsList = dtb_u_u98; f_Sols_solsDepth = dtb_u_u99 } -> ((((B_dContainer_dHashMap.v_lookup B_dData_dInt.v_Hashable_ue4b0f10b020a5e82_uInt) B_dData_dInt.v_Eq_u018fc178ff3df1b4_uInt) dtb_u_u95) dtb_u_u99)
  | _ -> failwith "DT: impossible branch"
))

# 394 "Vuna/Compiler/Core/Term.vuna"
let v_solsLookup = (fun (dtb_u_u100 : int) (dtb_u_u101 : t_Sols) -> (match dtb_u_u101 with
  | { f_Sols_solsTbl = dtb_u_u102; f_Sols_solsList = dtb_u_u103; f_Sols_solsDepth = dtb_u_u104 } -> ((((B_dContainer_dHashMap.v_lookup B_dData_dInt.v_Hashable_ue4b0f10b020a5e82_uInt) B_dData_dInt.v_Eq_u018fc178ff3df1b4_uInt) dtb_u_u100) dtb_u_u102)
  | _ -> failwith "DT: impossible branch"
))

# 397 "Vuna/Compiler/Core/Term.vuna"
let v_solsCons = (fun (dtb_u_u105 : int) (dtb_u_u106 : t_Value) (dtb_u_u107 : t_Sols) -> (match dtb_u_u107 with
  | { f_Sols_solsTbl = dtb_u_u108; f_Sols_solsList = dtb_u_u109; f_Sols_solsDepth = dtb_u_u110 } -> { f_Sols_solsTbl = (((((B_dContainer_dHashMap.v_insert B_dData_dInt.v_Hashable_ue4b0f10b020a5e82_uInt) B_dData_dInt.v_Eq_u018fc178ff3df1b4_uInt) dtb_u_u105) dtb_u_u106) dtb_u_u108); f_Sols_solsList = (B_dData_dList.C_List__x58__x58_ ({ B_dData_dPair.f_Pair_first = dtb_u_u105; B_dData_dPair.f_Pair_second = dtb_u_u106 }, dtb_u_u109)); f_Sols_solsDepth = dtb_u_u110 }
  | _ -> failwith "DT: impossible branch"
))

# 508 "Vuna/Compiler/Core/Term.vuna"
let v_defLookup = (fun (dtb_u_u111 : string) (dtb_u_u112 : (string, t_Term) B_dContainer_dHashMap.t_HashMap) -> ((((B_dContainer_dHashMap.v_lookup B_dData_dString.v_Hashable_ue4b0f10b020a5e82_uString) B_dData_dString.v_Eq_u018fc178ff3df1b4_uString) dtb_u_u111) dtb_u_u112))

# 594 "Vuna/Compiler/Core/Term.vuna"
let v_mapTermMaybe = (fun (dtb_u_u113 : (t_Term) -> t_Term) (dtb_u_u114 : t_Term B_dData_dMaybe.t_Maybe) -> (match dtb_u_u114 with
  | B_dData_dMaybe.C_Maybe_Just (dtb_u_u115) -> (B_dData_dMaybe.C_Maybe_Just ((dtb_u_u113 dtb_u_u115)))
  | B_dData_dMaybe.C_Maybe_Nothing -> B_dData_dMaybe.C_Maybe_Nothing
  | _ -> failwith "DT: impossible branch"
))

# 608 "Vuna/Compiler/Core/Term.vuna"
let v_lamMarkOf = (fun (dtb_u_u116 : (t_LamMark, (t_Term B_dData_dMaybe.t_Maybe, t_Term B_dData_dMaybe.t_Maybe) B_dData_dPair.t_Pair) B_dData_dPair.t_Pair B_dData_dMaybe.t_Maybe) -> (match dtb_u_u116 with
  | B_dData_dMaybe.C_Maybe_Just (dtb_u_u117) -> (B_dData_dPair.v_firstOf dtb_u_u117)
  | B_dData_dMaybe.C_Maybe_Nothing -> C_LamMark_LamPlain
  | _ -> failwith "DT: impossible branch"
))

# 612 "Vuna/Compiler/Core/Term.vuna"
let v_lamSlotTys = (fun (dtb_u_u118 : (t_LamMark, (t_Term B_dData_dMaybe.t_Maybe, t_Term B_dData_dMaybe.t_Maybe) B_dData_dPair.t_Pair) B_dData_dPair.t_Pair B_dData_dMaybe.t_Maybe) -> (match dtb_u_u118 with
  | B_dData_dMaybe.C_Maybe_Just (dtb_u_u119) -> (B_dData_dMaybe.C_Maybe_Just ((B_dData_dPair.v_secondOf dtb_u_u119)))
  | B_dData_dMaybe.C_Maybe_Nothing -> B_dData_dMaybe.C_Maybe_Nothing
  | _ -> failwith "DT: impossible branch"
))

# 616 "Vuna/Compiler/Core/Term.vuna"
let v_lamBinderTyOf = (fun (dtb_u_u120 : (t_LamMark, (t_Term B_dData_dMaybe.t_Maybe, t_Term B_dData_dMaybe.t_Maybe) B_dData_dPair.t_Pair) B_dData_dPair.t_Pair B_dData_dMaybe.t_Maybe) -> (match (v_lamSlotTys dtb_u_u120) with
  | B_dData_dMaybe.C_Maybe_Nothing -> B_dData_dMaybe.C_Maybe_Nothing
  | B_dData_dMaybe.C_Maybe_Just (dtb_u_u121) -> (B_dData_dPair.v_firstOf dtb_u_u121)
  | _ -> failwith "DT: impossible branch"
))

# 622 "Vuna/Compiler/Core/Term.vuna"
let v_lamResultTyOf = (fun (dtb_u_u122 : (t_LamMark, (t_Term B_dData_dMaybe.t_Maybe, t_Term B_dData_dMaybe.t_Maybe) B_dData_dPair.t_Pair) B_dData_dPair.t_Pair B_dData_dMaybe.t_Maybe) -> (match (v_lamSlotTys dtb_u_u122) with
  | B_dData_dMaybe.C_Maybe_Nothing -> B_dData_dMaybe.C_Maybe_Nothing
  | B_dData_dMaybe.C_Maybe_Just (dtb_u_u123) -> (B_dData_dPair.v_secondOf dtb_u_u123)
  | _ -> failwith "DT: impossible branch"
))

# 628 "Vuna/Compiler/Core/Term.vuna"
let v_lamTyOf = (fun (dtb_u_u124 : t_Term B_dData_dMaybe.t_Maybe) (dtb_u_u125 : t_Term B_dData_dMaybe.t_Maybe) -> (match dtb_u_u124 with
  | B_dData_dMaybe.C_Maybe_Nothing -> (match dtb_u_u125 with
  | B_dData_dMaybe.C_Maybe_Nothing -> B_dData_dMaybe.C_Maybe_Nothing
  | _ -> (B_dData_dMaybe.C_Maybe_Just ({ B_dData_dPair.f_Pair_first = C_LamMark_LamPlain; B_dData_dPair.f_Pair_second = { B_dData_dPair.f_Pair_first = dtb_u_u124; B_dData_dPair.f_Pair_second = dtb_u_u125 } }))
)
  | _ -> (B_dData_dMaybe.C_Maybe_Just ({ B_dData_dPair.f_Pair_first = C_LamMark_LamPlain; B_dData_dPair.f_Pair_second = { B_dData_dPair.f_Pair_first = dtb_u_u124; B_dData_dPair.f_Pair_second = dtb_u_u125 } }))
))

# 632 "Vuna/Compiler/Core/Term.vuna"
let v_markLamLinear = (fun (dtb_u_u126 : (t_LamMark, (t_Term B_dData_dMaybe.t_Maybe, t_Term B_dData_dMaybe.t_Maybe) B_dData_dPair.t_Pair) B_dData_dPair.t_Pair B_dData_dMaybe.t_Maybe) -> (let dtb_u_u127 = (match (v_lamSlotTys dtb_u_u126) with
  | B_dData_dMaybe.C_Maybe_Nothing -> { B_dData_dPair.f_Pair_first = B_dData_dMaybe.C_Maybe_Nothing; B_dData_dPair.f_Pair_second = B_dData_dMaybe.C_Maybe_Nothing }
  | B_dData_dMaybe.C_Maybe_Just (dtb_u_u128) -> dtb_u_u128
  | _ -> failwith "DT: impossible branch"
) in (B_dData_dMaybe.C_Maybe_Just ({ B_dData_dPair.f_Pair_first = C_LamMark_LamLinearClosure; B_dData_dPair.f_Pair_second = dtb_u_u127 }))))

# 641 "Vuna/Compiler/Core/Term.vuna"
let v_lamTyWithBinder = (fun (dtb_u_u129 : t_Term B_dData_dMaybe.t_Maybe) -> ((v_lamTyOf dtb_u_u129) B_dData_dMaybe.C_Maybe_Nothing))

# 644 "Vuna/Compiler/Core/Term.vuna"
let v_lamTyWithResult = (fun (dtb_u_u130 : t_Term B_dData_dMaybe.t_Maybe) -> ((v_lamTyOf B_dData_dMaybe.C_Maybe_Nothing) dtb_u_u130))

# 651 "Vuna/Compiler/Core/Term.vuna"
let rec v_shift = (fun (dtb_u_u131 : int) (dtb_u_u132 : int) (dtb_u_u133 : t_Term) -> (match dtb_u_u133 with
  | C_Term_TIf (dtb_u_u134, dtb_u_u135, dtb_u_u136) -> (C_Term_TIf ((((v_shift dtb_u_u131) dtb_u_u132) dtb_u_u134), (((v_shift dtb_u_u131) dtb_u_u132) dtb_u_u135), (((v_shift dtb_u_u131) dtb_u_u132) dtb_u_u136)))
  | C_Term_TBool (dtb_u_u137) -> dtb_u_u133
  | C_Term_TFloat (dtb_u_u138) -> dtb_u_u133
  | C_Term_TStr (dtb_u_u139) -> dtb_u_u133
  | C_Term_TInt (dtb_u_u140) -> dtb_u_u133
  | C_Term_TCase (dtb_u_u141, dtb_u_u142) -> (C_Term_TCase ((((v_shift dtb_u_u131) dtb_u_u132) dtb_u_u141), (((v_shiftAlts dtb_u_u131) dtb_u_u132) dtb_u_u142)))
  | C_Term_TRecUpd (dtb_u_u143, dtb_u_u144, dtb_u_u145, dtb_u_u146, dtb_u_u147) -> (C_Term_TRecUpd ((((v_shift dtb_u_u131) dtb_u_u132) dtb_u_u143), dtb_u_u144, dtb_u_u145, dtb_u_u146, (((v_shift (dtb_u_u131 + (B_dData_dList.v_length dtb_u_u145))) dtb_u_u132) dtb_u_u147)))
  | C_Term_TProj (dtb_u_u148, dtb_u_u149, dtb_u_u150, dtb_u_u151, dtb_u_u152) -> (C_Term_TProj ((((v_shift dtb_u_u131) dtb_u_u132) dtb_u_u148), dtb_u_u149, dtb_u_u150, dtb_u_u151, dtb_u_u152))
  | C_Term_TRecord (dtb_u_u153, dtb_u_u154) -> (C_Term_TRecord (dtb_u_u153, (((v_shiftArgs dtb_u_u131) dtb_u_u132) dtb_u_u154)))
  | C_Term_TMk (dtb_u_u155, dtb_u_u156) -> (C_Term_TMk (dtb_u_u155, (((v_shiftArgs dtb_u_u131) dtb_u_u132) dtb_u_u156)))
  | C_Term_TCon (dtb_u_u157, dtb_u_u158) -> (C_Term_TCon (dtb_u_u157, (((v_shiftArgs dtb_u_u131) dtb_u_u132) dtb_u_u158)))
  | C_Term_TApp (dtb_u_u159, dtb_u_u160, dtb_u_u161) -> (C_Term_TApp ((((v_shift dtb_u_u131) dtb_u_u132) dtb_u_u159), (((v_shift dtb_u_u131) dtb_u_u132) dtb_u_u160), dtb_u_u161))
  | C_Term_TLam (dtb_u_u162, dtb_u_u163, dtb_u_u164, dtb_u_u165, dtb_u_u166) -> (let dtb_u_u167 = (let dtb_u_u168 = dtb_u_u164 in (match dtb_u_u168 with
  | B_dData_dMaybe.C_Maybe_Just (dtb_u_u169) -> (match dtb_u_u169 with
  | { B_dData_dPair.f_Pair_first = dtb_u_u170; B_dData_dPair.f_Pair_second = dtb_u_u171 } -> (match dtb_u_u171 with
  | { B_dData_dPair.f_Pair_first = dtb_u_u172; B_dData_dPair.f_Pair_second = dtb_u_u173 } -> (let dtb_u_u174 = (match dtb_u_u172 with
  | B_dData_dMaybe.C_Maybe_Nothing -> B_dData_dMaybe.C_Maybe_Nothing
  | B_dData_dMaybe.C_Maybe_Just (dtb_u_u177) -> (B_dData_dMaybe.C_Maybe_Just ((((v_shift dtb_u_u131) dtb_u_u132) dtb_u_u177)))
  | _ -> failwith "DT: impossible branch"
) in (let dtb_u_u175 = (match dtb_u_u173 with
  | B_dData_dMaybe.C_Maybe_Nothing -> B_dData_dMaybe.C_Maybe_Nothing
  | B_dData_dMaybe.C_Maybe_Just (dtb_u_u176) -> (B_dData_dMaybe.C_Maybe_Just ((((v_shift (dtb_u_u131 + 1)) dtb_u_u132) dtb_u_u176)))
  | _ -> failwith "DT: impossible branch"
) in (B_dData_dMaybe.C_Maybe_Just ({ B_dData_dPair.f_Pair_first = dtb_u_u170; B_dData_dPair.f_Pair_second = { B_dData_dPair.f_Pair_first = dtb_u_u174; B_dData_dPair.f_Pair_second = dtb_u_u175 } }))))
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
)
  | B_dData_dMaybe.C_Maybe_Nothing -> B_dData_dMaybe.C_Maybe_Nothing
  | _ -> failwith "DT: impossible branch"
)) in (C_Term_TLam (dtb_u_u162, dtb_u_u163, dtb_u_u167, dtb_u_u165, (((v_shift (dtb_u_u131 + 1)) dtb_u_u132) dtb_u_u166))))
  | C_Term_TPi (dtb_u_u178, dtb_u_u179, dtb_u_u180, dtb_u_u181, dtb_u_u182) -> (C_Term_TPi (dtb_u_u178, dtb_u_u179, dtb_u_u180, (((v_shift dtb_u_u131) dtb_u_u132) dtb_u_u181), (((v_shift (dtb_u_u131 + 1)) dtb_u_u132) dtb_u_u182)))
  | C_Term_TType (dtb_u_u183) -> dtb_u_u133
  | C_Term_TGlobal (dtb_u_u184) -> dtb_u_u133
  | C_Term_TMeta (dtb_u_u185) -> dtb_u_u133
  | C_Term_TVar (dtb_u_u186, dtb_u_u187, dtb_u_u188) -> (if (dtb_u_u187 >= dtb_u_u131) then (C_Term_TVar (dtb_u_u186, (dtb_u_u187 + dtb_u_u132), dtb_u_u188)) else dtb_u_u133)
  | _ -> failwith "DT: impossible branch"
))
# 691 "Vuna/Compiler/Core/Term.vuna"
and v_shiftArgs = (fun (dtb_u_u189 : int) (dtb_u_u190 : int) (dtb_u_u191 : (t_Term, t_Rig) B_dData_dPair.t_Pair B_dData_dList.t_List) -> (match dtb_u_u191 with
  | B_dData_dList.C_List__x58__x58_ (dtb_u_u192, dtb_u_u193) -> (match dtb_u_u192 with
  | { B_dData_dPair.f_Pair_first = dtb_u_u194; B_dData_dPair.f_Pair_second = dtb_u_u195 } -> (B_dData_dList.C_List__x58__x58_ ({ B_dData_dPair.f_Pair_first = (((v_shift dtb_u_u189) dtb_u_u190) dtb_u_u194); B_dData_dPair.f_Pair_second = dtb_u_u195 }, (((v_shiftArgs dtb_u_u189) dtb_u_u190) dtb_u_u193)))
  | _ -> failwith "DT: impossible branch"
)
  | B_dData_dList.C_List_Nil -> B_dData_dList.C_List_Nil
  | _ -> failwith "DT: impossible branch"
))
# 696 "Vuna/Compiler/Core/Term.vuna"
and v_shiftAlts = (fun (dtb_u_u196 : int) (dtb_u_u197 : int) (dtb_u_u198 : t_CaseAlt B_dData_dList.t_List) -> (match dtb_u_u198 with
  | B_dData_dList.C_List__x58__x58_ (dtb_u_u199, dtb_u_u200) -> (B_dData_dList.C_List__x58__x58_ ((((v_shiftAlt dtb_u_u196) dtb_u_u197) dtb_u_u199), (((v_shiftAlts dtb_u_u196) dtb_u_u197) dtb_u_u200)))
  | B_dData_dList.C_List_Nil -> B_dData_dList.C_List_Nil
  | _ -> failwith "DT: impossible branch"
))
# 700 "Vuna/Compiler/Core/Term.vuna"
and v_shiftAlt = (fun (dtb_u_u201 : int) (dtb_u_u202 : int) (dtb_u_u203 : t_CaseAlt) -> (match dtb_u_u203 with
  | { f_CaseAlt_caseAltName = dtb_u_u204; f_CaseAlt_caseAltBinders = dtb_u_u205; f_CaseAlt_caseAltBody = dtb_u_u206 } -> { f_CaseAlt_caseAltName = dtb_u_u204; f_CaseAlt_caseAltBinders = dtb_u_u205; f_CaseAlt_caseAltBody = (((v_shift (dtb_u_u201 + (B_dData_dList.v_length dtb_u_u205))) dtb_u_u202) dtb_u_u206) }
  | _ -> failwith "DT: impossible branch"
))

# 758 "Vuna/Compiler/Core/Term.vuna"
let rec v_substMetaVarGo = (fun (dtb_u_u207 : int) (dtb_u_u208 : string) (dtb_u_u209 : int) (dtb_u_u210 : int) (dtb_u_u211 : t_Term) -> (match dtb_u_u211 with
  | C_Term_TIf (dtb_u_u212, dtb_u_u213, dtb_u_u214) -> (C_Term_TIf ((((((v_substMetaVarGo dtb_u_u207) dtb_u_u208) dtb_u_u209) dtb_u_u210) dtb_u_u212), (((((v_substMetaVarGo dtb_u_u207) dtb_u_u208) dtb_u_u209) dtb_u_u210) dtb_u_u213), (((((v_substMetaVarGo dtb_u_u207) dtb_u_u208) dtb_u_u209) dtb_u_u210) dtb_u_u214)))
  | C_Term_TCase (dtb_u_u215, dtb_u_u216) -> (C_Term_TCase ((((((v_substMetaVarGo dtb_u_u207) dtb_u_u208) dtb_u_u209) dtb_u_u210) dtb_u_u215), ((B_dData_dList.v_map ((((v_substMetaVarAlt dtb_u_u207) dtb_u_u208) dtb_u_u209) dtb_u_u210)) dtb_u_u216)))
  | C_Term_TProj (dtb_u_u217, dtb_u_u218, dtb_u_u219, dtb_u_u220, dtb_u_u221) -> (C_Term_TProj ((((((v_substMetaVarGo dtb_u_u207) dtb_u_u208) dtb_u_u209) dtb_u_u210) dtb_u_u217), dtb_u_u218, dtb_u_u219, dtb_u_u220, dtb_u_u221))
  | C_Term_TRecord (dtb_u_u222, dtb_u_u223) -> (C_Term_TRecord (dtb_u_u222, ((B_dData_dList.v_map (fun (dtb_u_u224 : (t_Term, t_Rig) B_dData_dPair.t_Pair) -> { B_dData_dPair.f_Pair_first = (((((v_substMetaVarGo dtb_u_u207) dtb_u_u208) dtb_u_u209) dtb_u_u210) (B_dData_dPair.v_firstOf dtb_u_u224)); B_dData_dPair.f_Pair_second = (B_dData_dPair.v_secondOf dtb_u_u224) })) dtb_u_u223)))
  | C_Term_TMk (dtb_u_u225, dtb_u_u226) -> (C_Term_TMk (dtb_u_u225, ((B_dData_dList.v_map (fun (dtb_u_u227 : (t_Term, t_Rig) B_dData_dPair.t_Pair) -> { B_dData_dPair.f_Pair_first = (((((v_substMetaVarGo dtb_u_u207) dtb_u_u208) dtb_u_u209) dtb_u_u210) (B_dData_dPair.v_firstOf dtb_u_u227)); B_dData_dPair.f_Pair_second = (B_dData_dPair.v_secondOf dtb_u_u227) })) dtb_u_u226)))
  | C_Term_TCon (dtb_u_u228, dtb_u_u229) -> (C_Term_TCon (dtb_u_u228, ((B_dData_dList.v_map (fun (dtb_u_u230 : (t_Term, t_Rig) B_dData_dPair.t_Pair) -> { B_dData_dPair.f_Pair_first = (((((v_substMetaVarGo dtb_u_u207) dtb_u_u208) dtb_u_u209) dtb_u_u210) (B_dData_dPair.v_firstOf dtb_u_u230)); B_dData_dPair.f_Pair_second = (B_dData_dPair.v_secondOf dtb_u_u230) })) dtb_u_u229)))
  | C_Term_TApp (dtb_u_u231, dtb_u_u232, dtb_u_u233) -> (C_Term_TApp ((((((v_substMetaVarGo dtb_u_u207) dtb_u_u208) dtb_u_u209) dtb_u_u210) dtb_u_u231), (((((v_substMetaVarGo dtb_u_u207) dtb_u_u208) dtb_u_u209) dtb_u_u210) dtb_u_u232), dtb_u_u233))
  | C_Term_TLam (dtb_u_u234, dtb_u_u235, dtb_u_u236, dtb_u_u237, dtb_u_u238) -> (let dtb_u_u239 = (let dtb_u_u240 = dtb_u_u236 in (match dtb_u_u240 with
  | B_dData_dMaybe.C_Maybe_Just (dtb_u_u241) -> (match dtb_u_u241 with
  | { B_dData_dPair.f_Pair_first = dtb_u_u242; B_dData_dPair.f_Pair_second = dtb_u_u243 } -> (match dtb_u_u243 with
  | { B_dData_dPair.f_Pair_first = dtb_u_u244; B_dData_dPair.f_Pair_second = dtb_u_u245 } -> (let dtb_u_u246 = (match dtb_u_u244 with
  | B_dData_dMaybe.C_Maybe_Nothing -> B_dData_dMaybe.C_Maybe_Nothing
  | B_dData_dMaybe.C_Maybe_Just (dtb_u_u249) -> (B_dData_dMaybe.C_Maybe_Just ((((((v_substMetaVarGo dtb_u_u207) dtb_u_u208) dtb_u_u209) dtb_u_u210) dtb_u_u249)))
  | _ -> failwith "DT: impossible branch"
) in (let dtb_u_u247 = (match dtb_u_u245 with
  | B_dData_dMaybe.C_Maybe_Nothing -> B_dData_dMaybe.C_Maybe_Nothing
  | B_dData_dMaybe.C_Maybe_Just (dtb_u_u248) -> (B_dData_dMaybe.C_Maybe_Just ((((((v_substMetaVarGo dtb_u_u207) dtb_u_u208) dtb_u_u209) (dtb_u_u210 + 1)) dtb_u_u248)))
  | _ -> failwith "DT: impossible branch"
) in (B_dData_dMaybe.C_Maybe_Just ({ B_dData_dPair.f_Pair_first = dtb_u_u242; B_dData_dPair.f_Pair_second = { B_dData_dPair.f_Pair_first = dtb_u_u246; B_dData_dPair.f_Pair_second = dtb_u_u247 } }))))
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
)
  | B_dData_dMaybe.C_Maybe_Nothing -> B_dData_dMaybe.C_Maybe_Nothing
  | _ -> failwith "DT: impossible branch"
)) in (C_Term_TLam (dtb_u_u234, dtb_u_u235, dtb_u_u239, dtb_u_u237, (((((v_substMetaVarGo dtb_u_u207) dtb_u_u208) dtb_u_u209) (dtb_u_u210 + 1)) dtb_u_u238))))
  | C_Term_TPi (dtb_u_u250, dtb_u_u251, dtb_u_u252, dtb_u_u253, dtb_u_u254) -> (C_Term_TPi (dtb_u_u250, dtb_u_u251, dtb_u_u252, (((((v_substMetaVarGo dtb_u_u207) dtb_u_u208) dtb_u_u209) dtb_u_u210) dtb_u_u253), (((((v_substMetaVarGo dtb_u_u207) dtb_u_u208) dtb_u_u209) (dtb_u_u210 + 1)) dtb_u_u254)))
  | C_Term_TMeta (dtb_u_u255) -> (if (dtb_u_u255 = dtb_u_u207) then (C_Term_TVar (dtb_u_u208, (dtb_u_u210 - dtb_u_u209), { Base_dSource.f_Span_spanFile = ""; Base_dSource.f_Span_spanStartLine = 0; Base_dSource.f_Span_spanStartCol = 0; Base_dSource.f_Span_spanEndLine = 0; Base_dSource.f_Span_spanEndCol = 0; Base_dSource.f_Span_spanStartOffset = 0; Base_dSource.f_Span_spanEndOffset = 0 })) else dtb_u_u211)
  | _ -> dtb_u_u211
))
# 799 "Vuna/Compiler/Core/Term.vuna"
and v_substMetaVarAlt = (fun (dtb_u_u256 : int) (dtb_u_u257 : string) (dtb_u_u258 : int) (dtb_u_u259 : int) (dtb_u_u260 : t_CaseAlt) -> (match dtb_u_u260 with
  | { f_CaseAlt_caseAltName = dtb_u_u261; f_CaseAlt_caseAltBinders = dtb_u_u262; f_CaseAlt_caseAltBody = dtb_u_u263 } -> { f_CaseAlt_caseAltName = dtb_u_u261; f_CaseAlt_caseAltBinders = dtb_u_u262; f_CaseAlt_caseAltBody = (((((v_substMetaVarGo dtb_u_u256) dtb_u_u257) dtb_u_u258) (dtb_u_u259 + (B_dData_dList.v_length dtb_u_u262))) dtb_u_u263) }
  | _ -> failwith "DT: impossible branch"
))

# 755 "Vuna/Compiler/Core/Term.vuna"
let v_substMetaVar = (fun (dtb_u_u264 : int) (dtb_u_u265 : string) (dtb_u_u266 : int) (dtb_u_u267 : t_Term) -> (((((v_substMetaVarGo dtb_u_u264) dtb_u_u265) dtb_u_u266) 0) dtb_u_u267))

# 811 "Vuna/Compiler/Core/Term.vuna"
let[@tail_mod_cons] rec v_insertDictBinderGo = (fun (dtb_u_u268 : string) (dtb_u_u269 : int) (dtb_u_u270 : t_Term) (dtb_u_u271 : int) (dtb_u_u272 : t_Term) -> (match dtb_u_u272 with
  | C_Term_TPi (dtb_u_u273, dtb_u_u274, dtb_u_u275, dtb_u_u276, dtb_u_u277) -> (if (dtb_u_u271 = dtb_u_u269) then (C_Term_TPi (dtb_u_u273, dtb_u_u274, dtb_u_u275, dtb_u_u276, (C_Term_TPi (dtb_u_u268, true, C_Rig_RigOmega, dtb_u_u270, (((v_shift 0) 1) dtb_u_u277))))) else (C_Term_TPi (dtb_u_u273, dtb_u_u274, dtb_u_u275, dtb_u_u276, (((((v_insertDictBinderGo dtb_u_u268) dtb_u_u269) dtb_u_u270) (dtb_u_u271 + 1)) dtb_u_u277))))
  | _ -> dtb_u_u272
))

# 805 "Vuna/Compiler/Core/Term.vuna"
let v_insertDictBinder = (fun (dtb_u_u278 : string) (dtb_u_u279 : int) (dtb_u_u280 : t_Term) (dtb_u_u281 : t_Term) -> (((((v_insertDictBinderGo dtb_u_u278) dtb_u_u279) dtb_u_u280) 0) dtb_u_u281))

# 823 "Vuna/Compiler/Core/Term.vuna"
let[@tail_mod_cons] rec v_insertImplicitBinderGo = (fun (dtb_u_u282 : string) (dtb_u_u283 : int) (dtb_u_u284 : t_Rig) (dtb_u_u285 : t_Term) (dtb_u_u286 : int) (dtb_u_u287 : t_Term) -> (match dtb_u_u287 with
  | C_Term_TPi (dtb_u_u288, dtb_u_u289, dtb_u_u290, dtb_u_u291, dtb_u_u292) -> (if (dtb_u_u286 = dtb_u_u283) then (C_Term_TPi (dtb_u_u288, dtb_u_u289, dtb_u_u290, dtb_u_u291, (C_Term_TPi (dtb_u_u282, true, dtb_u_u284, dtb_u_u285, (((v_shift 0) 1) dtb_u_u292))))) else (C_Term_TPi (dtb_u_u288, dtb_u_u289, dtb_u_u290, dtb_u_u291, ((((((v_insertImplicitBinderGo dtb_u_u282) dtb_u_u283) dtb_u_u284) dtb_u_u285) (dtb_u_u286 + 1)) dtb_u_u292))))
  | _ -> dtb_u_u287
))

# 820 "Vuna/Compiler/Core/Term.vuna"
let v_insertImplicitBinder = (fun (dtb_u_u293 : string) (dtb_u_u294 : int) (dtb_u_u295 : t_Rig) (dtb_u_u296 : t_Term) (dtb_u_u297 : t_Term) -> ((((((v_insertImplicitBinderGo dtb_u_u293) dtb_u_u294) dtb_u_u295) dtb_u_u296) 0) dtb_u_u297))

# 832 "Vuna/Compiler/Core/Term.vuna"
let v_cutoffOf = (fun (dtb_u_u298 : int) (dtb_u_u299 : int) -> (if ((dtb_u_u298 - (dtb_u_u299 + 1)) <= 0) then 0 else (dtb_u_u298 - (dtb_u_u299 + 1))))

# 835 "Vuna/Compiler/Core/Term.vuna"
let rec v_countPis = (fun (dtb_u_u300 : t_Term) -> (match dtb_u_u300 with
  | C_Term_TPi (dtb_u_u301, dtb_u_u302, dtb_u_u303, dtb_u_u304, dtb_u_u305) -> (1 + (v_countPis dtb_u_u305))
  | _ -> 0
))

# 847 "Vuna/Compiler/Core/Term.vuna"
let[@tail_mod_cons] rec v_insertLamBinderGo = (fun (dtb_u_u306 : string) (dtb_u_u307 : int) (dtb_u_u308 : int) (dtb_u_u309 : t_Term) -> (match dtb_u_u309 with
  | C_Term_TLam (dtb_u_u310, dtb_u_u311, dtb_u_u312, dtb_u_u313, dtb_u_u314) -> (if (dtb_u_u308 = dtb_u_u307) then (C_Term_TLam (dtb_u_u310, dtb_u_u311, dtb_u_u312, dtb_u_u313, (C_Term_TLam (dtb_u_u306, C_Rig_RigOmega, B_dData_dMaybe.C_Maybe_Nothing, Base_dSource.v_spanEmpty, (((v_shift 0) 1) dtb_u_u314))))) else (C_Term_TLam (dtb_u_u310, dtb_u_u311, dtb_u_u312, dtb_u_u313, ((((v_insertLamBinderGo dtb_u_u306) dtb_u_u307) (dtb_u_u308 + 1)) dtb_u_u314))))
  | _ -> dtb_u_u309
))

# 844 "Vuna/Compiler/Core/Term.vuna"
let v_insertLamBinder = (fun (dtb_u_u315 : string) (dtb_u_u316 : int) (dtb_u_u317 : t_Term) -> ((((v_insertLamBinderGo dtb_u_u315) dtb_u_u316) 0) dtb_u_u317))

# 855 "Vuna/Compiler/Core/Term.vuna"
let rec v_countLams = (fun (dtb_u_u318 : t_Term) -> (match dtb_u_u318 with
  | C_Term_TLam (dtb_u_u319, dtb_u_u320, dtb_u_u321, dtb_u_u322, dtb_u_u323) -> (1 + (v_countLams dtb_u_u323))
  | _ -> 0
))

# 860 "Vuna/Compiler/Core/Term.vuna"
let rec v_hasFreeTermVar = (fun (dtb_u_u324 : int) (dtb_u_u325 : t_Term) -> (match dtb_u_u325 with
  | C_Term_TIf (dtb_u_u326, dtb_u_u327, dtb_u_u328) -> (if (if ((v_hasFreeTermVar dtb_u_u324) dtb_u_u326) then true else ((v_hasFreeTermVar dtb_u_u324) dtb_u_u327)) then true else ((v_hasFreeTermVar dtb_u_u324) dtb_u_u328))
  | C_Term_TCase (dtb_u_u329, dtb_u_u330) -> (if ((v_hasFreeTermVar dtb_u_u324) dtb_u_u329) then true else ((v_anyAltFree dtb_u_u324) dtb_u_u330))
  | C_Term_TRecUpd (dtb_u_u331, dtb_u_u332, dtb_u_u333, dtb_u_u334, dtb_u_u335) -> (if ((v_hasFreeTermVar dtb_u_u324) dtb_u_u331) then true else ((v_hasFreeTermVar (dtb_u_u324 + (B_dData_dList.v_length dtb_u_u333))) dtb_u_u335))
  | C_Term_TProj (dtb_u_u336, dtb_u_u337, dtb_u_u338, dtb_u_u339, dtb_u_u340) -> ((v_hasFreeTermVar dtb_u_u324) dtb_u_u336)
  | C_Term_TRecord (dtb_u_u341, dtb_u_u342) -> ((v_anyPairFree dtb_u_u324) dtb_u_u342)
  | C_Term_TMk (dtb_u_u343, dtb_u_u344) -> ((v_anyPairFree dtb_u_u324) dtb_u_u344)
  | C_Term_TCon (dtb_u_u345, dtb_u_u346) -> ((v_anyPairFree dtb_u_u324) dtb_u_u346)
  | C_Term_TApp (dtb_u_u347, dtb_u_u348, dtb_u_u349) -> (if ((v_hasFreeTermVar dtb_u_u324) dtb_u_u347) then true else ((v_hasFreeTermVar dtb_u_u324) dtb_u_u348))
  | C_Term_TLam (dtb_u_u350, dtb_u_u351, dtb_u_u352, dtb_u_u353, dtb_u_u354) -> (let dtb_u_u355 = (let dtb_u_u356 = dtb_u_u352 in (match dtb_u_u356 with
  | B_dData_dMaybe.C_Maybe_Just (dtb_u_u357) -> (match dtb_u_u357 with
  | { B_dData_dPair.f_Pair_first = dtb_u_u358; B_dData_dPair.f_Pair_second = dtb_u_u359 } -> (match dtb_u_u359 with
  | { B_dData_dPair.f_Pair_first = dtb_u_u360; B_dData_dPair.f_Pair_second = dtb_u_u361 } -> (if ((v_hasFreeTermVarMaybe dtb_u_u324) dtb_u_u360) then true else ((v_hasFreeTermVarMaybe (dtb_u_u324 + 1)) dtb_u_u361))
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
)
  | B_dData_dMaybe.C_Maybe_Nothing -> false
  | _ -> failwith "DT: impossible branch"
)) in (if dtb_u_u355 then true else ((v_hasFreeTermVar (dtb_u_u324 + 1)) dtb_u_u354)))
  | C_Term_TPi (dtb_u_u362, dtb_u_u363, dtb_u_u364, dtb_u_u365, dtb_u_u366) -> (if ((v_hasFreeTermVar dtb_u_u324) dtb_u_u365) then true else ((v_hasFreeTermVar (dtb_u_u324 + 1)) dtb_u_u366))
  | C_Term_TVar (dtb_u_u367, dtb_u_u368, dtb_u_u369) -> (dtb_u_u368 >= dtb_u_u324)
  | _ -> false
))
# 883 "Vuna/Compiler/Core/Term.vuna"
and v_hasFreeTermVarMaybe = (fun (dtb_u_u370 : int) (dtb_u_u371 : t_Term B_dData_dMaybe.t_Maybe) -> (match dtb_u_u371 with
  | B_dData_dMaybe.C_Maybe_Just (dtb_u_u372) -> ((v_hasFreeTermVar dtb_u_u370) dtb_u_u372)
  | B_dData_dMaybe.C_Maybe_Nothing -> false
  | _ -> failwith "DT: impossible branch"
))
# 887 "Vuna/Compiler/Core/Term.vuna"
and v_anyPairFree = (fun (dtb_u_u373 : int) (dtb_u_u374 : (t_Term, t_Rig) B_dData_dPair.t_Pair B_dData_dList.t_List) -> (match dtb_u_u374 with
  | B_dData_dList.C_List__x58__x58_ (dtb_u_u375, dtb_u_u376) -> (match dtb_u_u375 with
  | { B_dData_dPair.f_Pair_first = dtb_u_u377; B_dData_dPair.f_Pair_second = dtb_u_u378 } -> (if ((v_hasFreeTermVar dtb_u_u373) dtb_u_u377) then true else ((v_anyPairFree dtb_u_u373) dtb_u_u376))
  | _ -> failwith "DT: impossible branch"
)
  | B_dData_dList.C_List_Nil -> false
  | _ -> failwith "DT: impossible branch"
))
# 891 "Vuna/Compiler/Core/Term.vuna"
and v_anyAltFree = (fun (dtb_u_u379 : int) (dtb_u_u380 : t_CaseAlt B_dData_dList.t_List) -> (match dtb_u_u380 with
  | B_dData_dList.C_List__x58__x58_ (dtb_u_u381, dtb_u_u382) -> (match dtb_u_u381 with
  | { f_CaseAlt_caseAltName = dtb_u_u383; f_CaseAlt_caseAltBinders = dtb_u_u384; f_CaseAlt_caseAltBody = dtb_u_u385 } -> (if ((v_hasFreeTermVar (dtb_u_u379 + (B_dData_dList.v_length dtb_u_u384))) dtb_u_u385) then true else ((v_anyAltFree dtb_u_u379) dtb_u_u382))
  | _ -> failwith "DT: impossible branch"
)
  | B_dData_dList.C_List_Nil -> false
  | _ -> failwith "DT: impossible branch"
))

# 899 "Vuna/Compiler/Core/Term.vuna"
let rec v_hasNegativeVar = (fun (dtb_u_u386 : t_Term) -> (match dtb_u_u386 with
  | C_Term_TIf (dtb_u_u387, dtb_u_u388, dtb_u_u389) -> (if (if (v_hasNegativeVar dtb_u_u387) then true else (v_hasNegativeVar dtb_u_u388)) then true else (v_hasNegativeVar dtb_u_u389))
  | C_Term_TCase (dtb_u_u390, dtb_u_u391) -> (if (v_hasNegativeVar dtb_u_u390) then true else (v_anyNegativeVarAlts dtb_u_u391))
  | C_Term_TRecUpd (dtb_u_u392, dtb_u_u393, dtb_u_u394, dtb_u_u395, dtb_u_u396) -> (if (v_hasNegativeVar dtb_u_u392) then true else (v_hasNegativeVar dtb_u_u396))
  | C_Term_TProj (dtb_u_u397, dtb_u_u398, dtb_u_u399, dtb_u_u400, dtb_u_u401) -> (v_hasNegativeVar dtb_u_u397)
  | C_Term_TRecord (dtb_u_u402, dtb_u_u403) -> (v_anyNegativeVarArgs dtb_u_u403)
  | C_Term_TMk (dtb_u_u404, dtb_u_u405) -> (v_anyNegativeVarArgs dtb_u_u405)
  | C_Term_TCon (dtb_u_u406, dtb_u_u407) -> (v_anyNegativeVarArgs dtb_u_u407)
  | C_Term_TApp (dtb_u_u408, dtb_u_u409, dtb_u_u410) -> (if (v_hasNegativeVar dtb_u_u408) then true else (v_hasNegativeVar dtb_u_u409))
  | C_Term_TLam (dtb_u_u411, dtb_u_u412, dtb_u_u413, dtb_u_u414, dtb_u_u415) -> (let dtb_u_u416 = (let dtb_u_u417 = dtb_u_u413 in (match dtb_u_u417 with
  | B_dData_dMaybe.C_Maybe_Just (dtb_u_u418) -> (match dtb_u_u418 with
  | { B_dData_dPair.f_Pair_first = dtb_u_u419; B_dData_dPair.f_Pair_second = dtb_u_u420 } -> (match dtb_u_u420 with
  | { B_dData_dPair.f_Pair_first = dtb_u_u421; B_dData_dPair.f_Pair_second = dtb_u_u422 } -> (if (v_hasNegativeVarMaybe dtb_u_u421) then true else (v_hasNegativeVarMaybe dtb_u_u422))
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
)
  | B_dData_dMaybe.C_Maybe_Nothing -> false
  | _ -> failwith "DT: impossible branch"
)) in (if dtb_u_u416 then true else (v_hasNegativeVar dtb_u_u415)))
  | C_Term_TPi (dtb_u_u423, dtb_u_u424, dtb_u_u425, dtb_u_u426, dtb_u_u427) -> (if (v_hasNegativeVar dtb_u_u426) then true else (v_hasNegativeVar dtb_u_u427))
  | C_Term_TVar (dtb_u_u428, dtb_u_u429, dtb_u_u430) -> (dtb_u_u429 < 0)
  | _ -> false
))
# 919 "Vuna/Compiler/Core/Term.vuna"
and v_hasNegativeVarMaybe = (fun (dtb_u_u431 : t_Term B_dData_dMaybe.t_Maybe) -> (match dtb_u_u431 with
  | B_dData_dMaybe.C_Maybe_Just (dtb_u_u432) -> (v_hasNegativeVar dtb_u_u432)
  | B_dData_dMaybe.C_Maybe_Nothing -> false
  | _ -> failwith "DT: impossible branch"
))
# 923 "Vuna/Compiler/Core/Term.vuna"
and v_anyNegativeVarArgs = (fun (dtb_u_u433 : (t_Term, t_Rig) B_dData_dPair.t_Pair B_dData_dList.t_List) -> (match dtb_u_u433 with
  | B_dData_dList.C_List__x58__x58_ (dtb_u_u434, dtb_u_u435) -> (match dtb_u_u434 with
  | { B_dData_dPair.f_Pair_first = dtb_u_u436; B_dData_dPair.f_Pair_second = dtb_u_u437 } -> (if (v_hasNegativeVar dtb_u_u436) then true else (v_anyNegativeVarArgs dtb_u_u435))
  | _ -> failwith "DT: impossible branch"
)
  | B_dData_dList.C_List_Nil -> false
  | _ -> failwith "DT: impossible branch"
))
# 927 "Vuna/Compiler/Core/Term.vuna"
and v_anyNegativeVarAlts = (fun (dtb_u_u438 : t_CaseAlt B_dData_dList.t_List) -> (match dtb_u_u438 with
  | B_dData_dList.C_List__x58__x58_ (dtb_u_u439, dtb_u_u440) -> (match dtb_u_u439 with
  | { f_CaseAlt_caseAltName = dtb_u_u441; f_CaseAlt_caseAltBinders = dtb_u_u442; f_CaseAlt_caseAltBody = dtb_u_u443 } -> (if (v_hasNegativeVar dtb_u_u443) then true else (v_anyNegativeVarAlts dtb_u_u440))
  | _ -> failwith "DT: impossible branch"
)
  | B_dData_dList.C_List_Nil -> false
  | _ -> failwith "DT: impossible branch"
))

# 933 "Vuna/Compiler/Core/Term.vuna"
let v_metaScanBound = 262144

# 939 "Vuna/Compiler/Core/Term.vuna"
let rec v_hasUnsolvedMetaValueFuel = (fun (dtb_u_u444 : int) (dtb_u_u445 : t_Sols) (dtb_u_u446 : t_Value) -> (if (dtb_u_u444 <= 0) then true else (match dtb_u_u446 with
  | C_Value_VMeta (dtb_u_u447, dtb_u_u448) -> (match ((v_solsLookup dtb_u_u447) dtb_u_u445) with
  | B_dData_dMaybe.C_Maybe_Just (dtb_u_u449) -> (((v_hasUnsolvedMetaValueFuel (dtb_u_u444 - 1)) dtb_u_u445) dtb_u_u449)
  | B_dData_dMaybe.C_Maybe_Nothing -> true
  | _ -> failwith "DT: impossible branch"
)
  | C_Value_VNeutral (dtb_u_u450) -> (match dtb_u_u450 with
  | C_Neutral_NVar (dtb_u_u451, dtb_u_u452, dtb_u_u453) -> (((v_hasUnsolvedMetaListFuel (dtb_u_u444 - 1)) dtb_u_u445) dtb_u_u453)
  | C_Neutral_NGlobal (dtb_u_u454, dtb_u_u455) -> (((v_hasUnsolvedMetaListFuel (dtb_u_u444 - 1)) dtb_u_u445) dtb_u_u455)
  | _ -> failwith "DT: impossible branch"
)
  | C_Value_VPi (dtb_u_u456, dtb_u_u457, dtb_u_u458, dtb_u_u459, dtb_u_u460) -> (if (((v_hasUnsolvedMetaValueFuel (dtb_u_u444 - 1)) dtb_u_u445) dtb_u_u459) then true else (((v_hasUnsolvedMetaCloFuel (dtb_u_u444 - 1)) dtb_u_u445) dtb_u_u460))
  | C_Value_VLam (dtb_u_u461, dtb_u_u462, dtb_u_u463) -> (((v_hasUnsolvedMetaCloFuel (dtb_u_u444 - 1)) dtb_u_u445) dtb_u_u463)
  | C_Value_VCon (dtb_u_u464, dtb_u_u465) -> (((v_hasUnsolvedMetaListFuel (dtb_u_u444 - 1)) dtb_u_u445) dtb_u_u465)
  | C_Value_VApp (dtb_u_u466, dtb_u_u467) -> (if (((v_hasUnsolvedMetaValueFuel (dtb_u_u444 - 1)) dtb_u_u445) dtb_u_u466) then true else (((v_hasUnsolvedMetaValueFuel (dtb_u_u444 - 1)) dtb_u_u445) dtb_u_u467))
  | C_Value_VCase (dtb_u_u468, dtb_u_u469) -> (((v_hasUnsolvedMetaValueFuel (dtb_u_u444 - 1)) dtb_u_u445) dtb_u_u468)
  | C_Value_VProj (dtb_u_u470, dtb_u_u471, dtb_u_u472, dtb_u_u473, dtb_u_u474) -> (((v_hasUnsolvedMetaValueFuel (dtb_u_u444 - 1)) dtb_u_u445) dtb_u_u470)
  | C_Value_VIf (dtb_u_u475, dtb_u_u476, dtb_u_u477) -> (if (if (((v_hasUnsolvedMetaValueFuel (dtb_u_u444 - 1)) dtb_u_u445) dtb_u_u475) then true else (((v_hasUnsolvedMetaValueFuel (dtb_u_u444 - 1)) dtb_u_u445) dtb_u_u476)) then true else (((v_hasUnsolvedMetaValueFuel (dtb_u_u444 - 1)) dtb_u_u445) dtb_u_u477))
  | _ -> false
)))
# 965 "Vuna/Compiler/Core/Term.vuna"
and v_hasUnsolvedMetaListFuel = (fun (dtb_u_u478 : int) (dtb_u_u479 : t_Sols) (dtb_u_u480 : t_Value B_dData_dList.t_List) -> (if (dtb_u_u478 <= 0) then true else (match dtb_u_u480 with
  | B_dData_dList.C_List_Nil -> false
  | B_dData_dList.C_List__x58__x58_ (dtb_u_u481, dtb_u_u482) -> (if (((v_hasUnsolvedMetaValueFuel (dtb_u_u478 - 1)) dtb_u_u479) dtb_u_u481) then true else (((v_hasUnsolvedMetaListFuel (dtb_u_u478 - 1)) dtb_u_u479) dtb_u_u482))
  | _ -> failwith "DT: impossible branch"
)))
# 977 "Vuna/Compiler/Core/Term.vuna"
and v_hasUnsolvedMetaCloFuel = (fun (dtb_u_u483 : int) (dtb_u_u484 : t_Sols) (dtb_u_u485 : t_Closure) -> (if (dtb_u_u483 <= 0) then true else (match dtb_u_u485 with
  | { f_Closure_closureEnv = dtb_u_u486; f_Closure_closureBody = dtb_u_u487 } -> (((v_hasUnsolvedMetaListFuel (dtb_u_u483 - 1)) dtb_u_u484) dtb_u_u486)
  | _ -> failwith "DT: impossible branch"
)))

# 936 "Vuna/Compiler/Core/Term.vuna"
let v_hasUnsolvedMetaValue = (fun (dtb_u_u488 : t_Sols) (dtb_u_u489 : t_Value) -> (((v_hasUnsolvedMetaValueFuel v_metaScanBound) dtb_u_u488) dtb_u_u489))

# 962 "Vuna/Compiler/Core/Term.vuna"
let v_hasUnsolvedMetaList = (fun (dtb_u_u490 : t_Sols) (dtb_u_u491 : t_Value B_dData_dList.t_List) -> (((v_hasUnsolvedMetaListFuel v_metaScanBound) dtb_u_u490) dtb_u_u491))

# 974 "Vuna/Compiler/Core/Term.vuna"
let v_hasUnsolvedMetaClo = (fun (dtb_u_u492 : t_Sols) (dtb_u_u493 : t_Closure) -> (((v_hasUnsolvedMetaCloFuel v_metaScanBound) dtb_u_u492) dtb_u_u493))

# 988 "Vuna/Compiler/Core/Term.vuna"
let v_isTypeValue = (fun (dtb_u_u494 : t_Value) -> (match dtb_u_u494 with
  | C_Value_VType (dtb_u_u495) -> true
  | _ -> false
))

# 992 "Vuna/Compiler/Core/Term.vuna"
let v_typeLevelOf = (fun (dtb_u_u496 : t_Value) -> (match dtb_u_u496 with
  | C_Value_VType (dtb_u_u497) -> (B_dData_dMaybe.C_Maybe_Just (dtb_u_u497))
  | _ -> B_dData_dMaybe.C_Maybe_Nothing
))

# 1000 "Vuna/Compiler/Core/Term.vuna"
let rec v_levelEscapes = (fun (dtb_u_u498 : int) (dtb_u_u499 : int) (dtb_u_u500 : t_Value) -> (match dtb_u_u500 with
  | C_Value_VBool (dtb_u_u501) -> false
  | C_Value_VFloat (dtb_u_u502) -> false
  | C_Value_VStr (dtb_u_u503) -> false
  | C_Value_VInt (dtb_u_u504) -> false
  | C_Value_VType (dtb_u_u505) -> false
  | C_Value_VIf (dtb_u_u506, dtb_u_u507, dtb_u_u508) -> (if (if (((v_levelEscapes dtb_u_u498) dtb_u_u499) dtb_u_u506) then true else (((v_levelEscapes dtb_u_u498) dtb_u_u499) dtb_u_u507)) then true else (((v_levelEscapes dtb_u_u498) dtb_u_u499) dtb_u_u508))
  | C_Value_VProj (dtb_u_u509, dtb_u_u510, dtb_u_u511, dtb_u_u512, dtb_u_u513) -> (((v_levelEscapes dtb_u_u498) dtb_u_u499) dtb_u_u509)
  | C_Value_VCase (dtb_u_u514, dtb_u_u515) -> (((v_levelEscapes dtb_u_u498) dtb_u_u499) dtb_u_u514)
  | C_Value_VApp (dtb_u_u516, dtb_u_u517) -> (if (((v_levelEscapes dtb_u_u498) dtb_u_u499) dtb_u_u516) then true else (((v_levelEscapes dtb_u_u498) dtb_u_u499) dtb_u_u517))
  | C_Value_VCon (dtb_u_u518, dtb_u_u519) -> ((v_levelEscapesList dtb_u_u498) dtb_u_u519)
  | C_Value_VMeta (dtb_u_u520, dtb_u_u521) -> ((v_levelEscapesList dtb_u_u498) dtb_u_u521)
  | C_Value_VLam (dtb_u_u522, dtb_u_u523, dtb_u_u524) -> ((v_levelEscapesClo dtb_u_u498) dtb_u_u524)
  | C_Value_VPi (dtb_u_u525, dtb_u_u526, dtb_u_u527, dtb_u_u528, dtb_u_u529) -> (if (((v_levelEscapes dtb_u_u498) dtb_u_u499) dtb_u_u528) then true else ((v_levelEscapesClo dtb_u_u498) dtb_u_u529))
  | C_Value_VNeutral (dtb_u_u530) -> (match dtb_u_u530 with
  | C_Neutral_NVar (dtb_u_u531, dtb_u_u532, dtb_u_u533) -> (if (dtb_u_u532 >= dtb_u_u498) then true else ((v_levelEscapesList dtb_u_u498) dtb_u_u533))
  | C_Neutral_NGlobal (dtb_u_u534, dtb_u_u535) -> ((v_levelEscapesList dtb_u_u498) dtb_u_u535)
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
))
# 1021 "Vuna/Compiler/Core/Term.vuna"
and v_levelEscapesList = (fun (dtb_u_u536 : int) (dtb_u_u537 : t_Value B_dData_dList.t_List) -> (match dtb_u_u537 with
  | B_dData_dList.C_List__x58__x58_ (dtb_u_u538, dtb_u_u539) -> (if (((v_levelEscapes dtb_u_u536) 0) dtb_u_u538) then true else ((v_levelEscapesList dtb_u_u536) dtb_u_u539))
  | B_dData_dList.C_List_Nil -> false
  | _ -> failwith "DT: impossible branch"
))
# 1025 "Vuna/Compiler/Core/Term.vuna"
and v_levelEscapesClo = (fun (dtb_u_u540 : int) (dtb_u_u541 : t_Closure) -> (match dtb_u_u541 with
  | { f_Closure_closureEnv = dtb_u_u542; f_Closure_closureBody = dtb_u_u543 } -> ((v_levelEscapesList dtb_u_u540) dtb_u_u542)
  | _ -> failwith "DT: impossible branch"
))

# 1105 "Vuna/Compiler/Core/Term.vuna"
let rec v_showBinders = (fun (dtb_u_u544 : (string, t_Rig) B_dData_dPair.t_Pair B_dData_dList.t_List) -> (match dtb_u_u544 with
  | B_dData_dList.C_List__x58__x58_ (dtb_u_u545, dtb_u_u546) -> (match dtb_u_u545 with
  | { B_dData_dPair.f_Pair_first = dtb_u_u547; B_dData_dPair.f_Pair_second = dtb_u_u548 } -> (String.concat "" [" "; dtb_u_u547; (v_showBinders dtb_u_u546)])
  | _ -> failwith "DT: impossible branch"
)
  | B_dData_dList.C_List_Nil -> ""
  | _ -> failwith "DT: impossible branch"
))

# 1112 "Vuna/Compiler/Core/Term.vuna"
let rec v_showCoreChars = (fun (dtb_u_u549 : int B_dData_dList.t_List) -> (match dtb_u_u549 with
  | B_dData_dList.C_List__x58__x58_ (dtb_u_u550, dtb_u_u551) -> (if (dtb_u_u550 = 34) then ("\\\"" ^ (v_showCoreChars dtb_u_u551)) else (if (dtb_u_u550 = 92) then ("\\\\" ^ (v_showCoreChars dtb_u_u551)) else (if (dtb_u_u550 = 10) then ("\\n" ^ (v_showCoreChars dtb_u_u551)) else (if (dtb_u_u550 = 9) then ("\\t" ^ (v_showCoreChars dtb_u_u551)) else (if (dtb_u_u550 = 13) then ("\\r" ^ (v_showCoreChars dtb_u_u551)) else ((B_dData_dList.dtp_pack (B_dData_dList.C_List__x58__x58_ (dtb_u_u550, B_dData_dList.C_List_Nil))) ^ (v_showCoreChars dtb_u_u551)))))))
  | B_dData_dList.C_List_Nil -> ""
  | _ -> failwith "DT: impossible branch"
))

# 1109 "Vuna/Compiler/Core/Term.vuna"
let v_showCoreString = (fun (dtb_u_u552 : string) -> (String.concat "" ["\""; (v_showCoreChars (B_dData_dList.dtp_unpack dtb_u_u552)); "\""]))

# 97 "Vuna/Compiler/Core/Term.vuna"
let v_levelToInt = (fun (dtb_u_u553 : t_Level) -> (let dtb_u_u554 = dtb_u_u553 in dtb_u_u554))

# 158 "Vuna/Compiler/Core/Term.vuna"
let v_binderName = (fun (dtb_u_u555 : t_Binder) -> (match dtb_u_u555 with
  | { f_Binder_binderName = dtb_u_u556; f_Binder_binderRig = dtb_u_u557; f_Binder_binderSpan = dtb_u_u558 } -> dtb_u_u556
  | _ -> failwith "DT: impossible branch"
))

# 159 "Vuna/Compiler/Core/Term.vuna"
let v_binderRig = (fun (dtb_u_u559 : t_Binder) -> (match dtb_u_u559 with
  | { f_Binder_binderName = dtb_u_u560; f_Binder_binderRig = dtb_u_u561; f_Binder_binderSpan = dtb_u_u562 } -> dtb_u_u561
  | _ -> failwith "DT: impossible branch"
))

# 160 "Vuna/Compiler/Core/Term.vuna"
let v_binderSpan = (fun (dtb_u_u563 : t_Binder) -> (match dtb_u_u563 with
  | { f_Binder_binderName = dtb_u_u564; f_Binder_binderRig = dtb_u_u565; f_Binder_binderSpan = dtb_u_u566 } -> dtb_u_u566
  | _ -> failwith "DT: impossible branch"
))

# 187 "Vuna/Compiler/Core/Term.vuna"
let v_caseAltName = (fun (dtb_u_u567 : t_CaseAlt) -> (match dtb_u_u567 with
  | { f_CaseAlt_caseAltName = dtb_u_u568; f_CaseAlt_caseAltBinders = dtb_u_u569; f_CaseAlt_caseAltBody = dtb_u_u570 } -> dtb_u_u568
  | _ -> failwith "DT: impossible branch"
))

# 188 "Vuna/Compiler/Core/Term.vuna"
let v_caseAltBinders = (fun (dtb_u_u571 : t_CaseAlt) -> (match dtb_u_u571 with
  | { f_CaseAlt_caseAltName = dtb_u_u572; f_CaseAlt_caseAltBinders = dtb_u_u573; f_CaseAlt_caseAltBody = dtb_u_u574 } -> dtb_u_u573
  | _ -> failwith "DT: impossible branch"
))

# 189 "Vuna/Compiler/Core/Term.vuna"
let v_caseAltBody = (fun (dtb_u_u575 : t_CaseAlt) -> (match dtb_u_u575 with
  | { f_CaseAlt_caseAltName = dtb_u_u576; f_CaseAlt_caseAltBinders = dtb_u_u577; f_CaseAlt_caseAltBody = dtb_u_u578 } -> dtb_u_u578
  | _ -> failwith "DT: impossible branch"
))

# 338 "Vuna/Compiler/Core/Term.vuna"
let[@tail_mod_cons] rec v_termSizeAltTerms = (fun (dtb_u_u579 : t_CaseAlt B_dData_dList.t_List) -> (match dtb_u_u579 with
  | B_dData_dList.C_List__x58__x58_ (dtb_u_u580, dtb_u_u581) -> (B_dData_dList.C_List__x58__x58_ ((v_caseAltBody dtb_u_u580), (v_termSizeAltTerms dtb_u_u581)))
  | B_dData_dList.C_List_Nil -> B_dData_dList.C_List_Nil
  | _ -> failwith "DT: impossible branch"
))

# 314 "Vuna/Compiler/Core/Term.vuna"
let v_termSizeWork = (fun (dtb_u_u582 : t_Term) -> (match dtb_u_u582 with
  | C_Term_TIf (dtb_u_u583, dtb_u_u584, dtb_u_u585) -> (B_dData_dList.C_List__x58__x58_ (dtb_u_u583, (B_dData_dList.C_List__x58__x58_ (dtb_u_u584, (B_dData_dList.C_List__x58__x58_ (dtb_u_u585, B_dData_dList.C_List_Nil))))))
  | C_Term_TRecUpd (dtb_u_u586, dtb_u_u587, dtb_u_u588, dtb_u_u589, dtb_u_u590) -> (B_dData_dList.C_List__x58__x58_ (dtb_u_u586, (B_dData_dList.C_List__x58__x58_ (dtb_u_u590, B_dData_dList.C_List_Nil))))
  | C_Term_TProj (dtb_u_u591, dtb_u_u592, dtb_u_u593, dtb_u_u594, dtb_u_u595) -> (B_dData_dList.C_List__x58__x58_ (dtb_u_u591, B_dData_dList.C_List_Nil))
  | C_Term_TCase (dtb_u_u596, dtb_u_u597) -> (B_dData_dList.C_List__x58__x58_ (dtb_u_u596, (v_termSizeAltTerms dtb_u_u597)))
  | C_Term_TRecord (dtb_u_u598, dtb_u_u599) -> (v_termSizeArgTerms dtb_u_u599)
  | C_Term_TMk (dtb_u_u600, dtb_u_u601) -> (v_termSizeArgTerms dtb_u_u601)
  | C_Term_TCon (dtb_u_u602, dtb_u_u603) -> (v_termSizeArgTerms dtb_u_u603)
  | C_Term_TApp (dtb_u_u604, dtb_u_u605, dtb_u_u606) -> (B_dData_dList.C_List__x58__x58_ (dtb_u_u604, (B_dData_dList.C_List__x58__x58_ (dtb_u_u605, B_dData_dList.C_List_Nil))))
  | C_Term_TLam (dtb_u_u607, dtb_u_u608, dtb_u_u609, dtb_u_u610, dtb_u_u611) -> ((B_dData_dList.v_append (v_termSizeSlotTerms dtb_u_u609)) (B_dData_dList.C_List__x58__x58_ (dtb_u_u611, B_dData_dList.C_List_Nil)))
  | C_Term_TPi (dtb_u_u612, dtb_u_u613, dtb_u_u614, dtb_u_u615, dtb_u_u616) -> (B_dData_dList.C_List__x58__x58_ (dtb_u_u615, (B_dData_dList.C_List__x58__x58_ (dtb_u_u616, B_dData_dList.C_List_Nil))))
  | C_Term_TBool (dtb_u_u617) -> B_dData_dList.C_List_Nil
  | C_Term_TFloat (dtb_u_u618) -> B_dData_dList.C_List_Nil
  | C_Term_TStr (dtb_u_u619) -> B_dData_dList.C_List_Nil
  | C_Term_TInt (dtb_u_u620) -> B_dData_dList.C_List_Nil
  | C_Term_TType (dtb_u_u621) -> B_dData_dList.C_List_Nil
  | C_Term_TGlobal (dtb_u_u622) -> B_dData_dList.C_List_Nil
  | C_Term_TMeta (dtb_u_u623) -> B_dData_dList.C_List_Nil
  | C_Term_TVar (dtb_u_u624, dtb_u_u625, dtb_u_u626) -> B_dData_dList.C_List_Nil
  | _ -> failwith "DT: impossible branch"
))

# 308 "Vuna/Compiler/Core/Term.vuna"
let rec v_termSizeGo = (fun (dtb_u_u627 : int) (dtb_u_u628 : t_Term B_dData_dList.t_List) -> (match dtb_u_u628 with
  | B_dData_dList.C_List__x58__x58_ (dtb_u_u629, dtb_u_u630) -> (if (dtb_u_u627 <= 0) then 0 else (1 + ((v_termSizeGo (dtb_u_u627 - 1)) ((B_dData_dList.v_append (v_termSizeWork dtb_u_u629)) dtb_u_u630))))
  | B_dData_dList.C_List_Nil -> 0
  | _ -> failwith "DT: impossible branch"
))

# 299 "Vuna/Compiler/Core/Term.vuna"
let v_termSize = (fun (dtb_u_u631 : t_Term) -> ((v_termSizeGo v_termSizeCap) (B_dData_dList.C_List__x58__x58_ (dtb_u_u631, B_dData_dList.C_List_Nil))))

# 402 "Vuna/Compiler/Core/Term.vuna"
let rec v_termHasUnsolvedMeta = (fun (dtb_u_u632 : t_Sols) (dtb_u_u633 : t_Term) -> (match dtb_u_u633 with
  | C_Term_TIf (dtb_u_u634, dtb_u_u635, dtb_u_u636) -> (if (if ((v_termHasUnsolvedMeta dtb_u_u632) dtb_u_u634) then true else ((v_termHasUnsolvedMeta dtb_u_u632) dtb_u_u635)) then true else ((v_termHasUnsolvedMeta dtb_u_u632) dtb_u_u636))
  | C_Term_TBool (dtb_u_u637) -> false
  | C_Term_TFloat (dtb_u_u638) -> false
  | C_Term_TStr (dtb_u_u639) -> false
  | C_Term_TInt (dtb_u_u640) -> false
  | C_Term_TCase (dtb_u_u641, dtb_u_u642) -> (if ((v_termHasUnsolvedMeta dtb_u_u632) dtb_u_u641) then true else ((v_termHasUnsolvedMetaAlts dtb_u_u632) dtb_u_u642))
  | C_Term_TRecUpd (dtb_u_u643, dtb_u_u644, dtb_u_u645, dtb_u_u646, dtb_u_u647) -> (if ((v_termHasUnsolvedMeta dtb_u_u632) dtb_u_u643) then true else ((v_termHasUnsolvedMeta dtb_u_u632) dtb_u_u647))
  | C_Term_TProj (dtb_u_u648, dtb_u_u649, dtb_u_u650, dtb_u_u651, dtb_u_u652) -> ((v_termHasUnsolvedMeta dtb_u_u632) dtb_u_u648)
  | C_Term_TRecord (dtb_u_u653, dtb_u_u654) -> ((v_termHasUnsolvedMetaArgs dtb_u_u632) dtb_u_u654)
  | C_Term_TMk (dtb_u_u655, dtb_u_u656) -> ((v_termHasUnsolvedMetaArgs dtb_u_u632) dtb_u_u656)
  | C_Term_TCon (dtb_u_u657, dtb_u_u658) -> ((v_termHasUnsolvedMetaArgs dtb_u_u632) dtb_u_u658)
  | C_Term_TApp (dtb_u_u659, dtb_u_u660, dtb_u_u661) -> (if ((v_termHasUnsolvedMeta dtb_u_u632) dtb_u_u659) then true else ((v_termHasUnsolvedMeta dtb_u_u632) dtb_u_u660))
  | C_Term_TLam (dtb_u_u662, dtb_u_u663, dtb_u_u664, dtb_u_u665, dtb_u_u666) -> (let dtb_u_u667 = (let dtb_u_u668 = dtb_u_u664 in (match dtb_u_u668 with
  | B_dData_dMaybe.C_Maybe_Just (dtb_u_u669) -> (match dtb_u_u669 with
  | { B_dData_dPair.f_Pair_first = dtb_u_u670; B_dData_dPair.f_Pair_second = dtb_u_u671 } -> (match dtb_u_u671 with
  | { B_dData_dPair.f_Pair_first = dtb_u_u672; B_dData_dPair.f_Pair_second = dtb_u_u673 } -> (if ((v_termHasUnsolvedMetaMaybe dtb_u_u632) dtb_u_u672) then true else ((v_termHasUnsolvedMetaMaybe dtb_u_u632) dtb_u_u673))
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
)
  | B_dData_dMaybe.C_Maybe_Nothing -> false
  | _ -> failwith "DT: impossible branch"
)) in (if dtb_u_u667 then true else ((v_termHasUnsolvedMeta dtb_u_u632) dtb_u_u666)))
  | C_Term_TPi (dtb_u_u674, dtb_u_u675, dtb_u_u676, dtb_u_u677, dtb_u_u678) -> (if ((v_termHasUnsolvedMeta dtb_u_u632) dtb_u_u677) then true else ((v_termHasUnsolvedMeta dtb_u_u632) dtb_u_u678))
  | C_Term_TType (dtb_u_u679) -> false
  | C_Term_TGlobal (dtb_u_u680) -> false
  | C_Term_TVar (dtb_u_u681, dtb_u_u682, dtb_u_u683) -> false
  | C_Term_TMeta (dtb_u_u684) -> (match ((v_solsLookup dtb_u_u684) dtb_u_u632) with
  | B_dData_dMaybe.C_Maybe_Just (dtb_u_u685) -> false
  | B_dData_dMaybe.C_Maybe_Nothing -> true
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
))
# 435 "Vuna/Compiler/Core/Term.vuna"
and v_termHasUnsolvedMetaMaybe = (fun (dtb_u_u686 : t_Sols) (dtb_u_u687 : t_Term B_dData_dMaybe.t_Maybe) -> (match dtb_u_u687 with
  | B_dData_dMaybe.C_Maybe_Just (dtb_u_u688) -> ((v_termHasUnsolvedMeta dtb_u_u686) dtb_u_u688)
  | B_dData_dMaybe.C_Maybe_Nothing -> false
  | _ -> failwith "DT: impossible branch"
))
# 439 "Vuna/Compiler/Core/Term.vuna"
and v_termHasUnsolvedMetaArgs = (fun (dtb_u_u689 : t_Sols) (dtb_u_u690 : (t_Term, t_Rig) B_dData_dPair.t_Pair B_dData_dList.t_List) -> (match dtb_u_u690 with
  | B_dData_dList.C_List__x58__x58_ (dtb_u_u691, dtb_u_u692) -> (match dtb_u_u691 with
  | { B_dData_dPair.f_Pair_first = dtb_u_u693; B_dData_dPair.f_Pair_second = dtb_u_u694 } -> (if ((v_termHasUnsolvedMeta dtb_u_u689) dtb_u_u693) then true else ((v_termHasUnsolvedMetaArgs dtb_u_u689) dtb_u_u692))
  | _ -> failwith "DT: impossible branch"
)
  | B_dData_dList.C_List_Nil -> false
  | _ -> failwith "DT: impossible branch"
))
# 444 "Vuna/Compiler/Core/Term.vuna"
and v_termHasUnsolvedMetaAlts = (fun (dtb_u_u695 : t_Sols) (dtb_u_u696 : t_CaseAlt B_dData_dList.t_List) -> (match dtb_u_u696 with
  | B_dData_dList.C_List__x58__x58_ (dtb_u_u697, dtb_u_u698) -> (if ((v_termHasUnsolvedMeta dtb_u_u695) (v_caseAltBody dtb_u_u697)) then true else ((v_termHasUnsolvedMetaAlts dtb_u_u695) dtb_u_u698))
  | B_dData_dList.C_List_Nil -> false
  | _ -> failwith "DT: impossible branch"
))

# 451 "Vuna/Compiler/Core/Term.vuna"
let rec v_termUsesFloat = (fun (dtb_u_u699 : string B_dData_dList.t_List) (dtb_u_u700 : t_Term) -> (match dtb_u_u700 with
  | C_Term_TIf (dtb_u_u701, dtb_u_u702, dtb_u_u703) -> (if (if ((v_termUsesFloat dtb_u_u699) dtb_u_u701) then true else ((v_termUsesFloat dtb_u_u699) dtb_u_u702)) then true else ((v_termUsesFloat dtb_u_u699) dtb_u_u703))
  | C_Term_TBool (dtb_u_u704) -> false
  | C_Term_TStr (dtb_u_u705) -> false
  | C_Term_TInt (dtb_u_u706) -> false
  | C_Term_TCase (dtb_u_u707, dtb_u_u708) -> (if ((v_termUsesFloat dtb_u_u699) dtb_u_u707) then true else ((v_anyAltUsesFloat dtb_u_u699) dtb_u_u708))
  | C_Term_TRecUpd (dtb_u_u709, dtb_u_u710, dtb_u_u711, dtb_u_u712, dtb_u_u713) -> (if ((v_termUsesFloat dtb_u_u699) dtb_u_u709) then true else ((v_termUsesFloat dtb_u_u699) dtb_u_u713))
  | C_Term_TProj (dtb_u_u714, dtb_u_u715, dtb_u_u716, dtb_u_u717, dtb_u_u718) -> ((v_termUsesFloat dtb_u_u699) dtb_u_u714)
  | C_Term_TRecord (dtb_u_u719, dtb_u_u720) -> ((v_anyArgUsesFloat dtb_u_u699) dtb_u_u720)
  | C_Term_TMk (dtb_u_u721, dtb_u_u722) -> ((v_anyArgUsesFloat dtb_u_u699) dtb_u_u722)
  | C_Term_TCon (dtb_u_u723, dtb_u_u724) -> ((v_anyArgUsesFloat dtb_u_u699) dtb_u_u724)
  | C_Term_TApp (dtb_u_u725, dtb_u_u726, dtb_u_u727) -> (if ((v_termUsesFloat dtb_u_u699) dtb_u_u725) then true else ((v_termUsesFloat dtb_u_u699) dtb_u_u726))
  | C_Term_TLam (dtb_u_u728, dtb_u_u729, dtb_u_u730, dtb_u_u731, dtb_u_u732) -> ((v_termUsesFloat dtb_u_u699) dtb_u_u732)
  | C_Term_TPi (dtb_u_u733, dtb_u_u734, dtb_u_u735, dtb_u_u736, dtb_u_u737) -> (if ((v_termUsesFloat dtb_u_u699) dtb_u_u736) then true else ((v_termUsesFloat dtb_u_u699) dtb_u_u737))
  | C_Term_TType (dtb_u_u738) -> false
  | C_Term_TMeta (dtb_u_u739) -> false
  | C_Term_TVar (dtb_u_u740, dtb_u_u741, dtb_u_u742) -> false
  | C_Term_TGlobal (dtb_u_u743) -> ((B_dData_dList.v_memName dtb_u_u743) dtb_u_u699)
  | C_Term_TFloat (dtb_u_u744) -> true
  | _ -> failwith "DT: impossible branch"
))
# 474 "Vuna/Compiler/Core/Term.vuna"
and v_anyArgUsesFloat = (fun (dtb_u_u745 : string B_dData_dList.t_List) (dtb_u_u746 : (t_Term, t_Rig) B_dData_dPair.t_Pair B_dData_dList.t_List) -> (match dtb_u_u746 with
  | B_dData_dList.C_List__x58__x58_ (dtb_u_u747, dtb_u_u748) -> (match dtb_u_u747 with
  | { B_dData_dPair.f_Pair_first = dtb_u_u749; B_dData_dPair.f_Pair_second = dtb_u_u750 } -> (if ((v_termUsesFloat dtb_u_u745) dtb_u_u749) then true else ((v_anyArgUsesFloat dtb_u_u745) dtb_u_u748))
  | _ -> failwith "DT: impossible branch"
)
  | B_dData_dList.C_List_Nil -> false
  | _ -> failwith "DT: impossible branch"
))
# 479 "Vuna/Compiler/Core/Term.vuna"
and v_anyAltUsesFloat = (fun (dtb_u_u751 : string B_dData_dList.t_List) (dtb_u_u752 : t_CaseAlt B_dData_dList.t_List) -> (match dtb_u_u752 with
  | B_dData_dList.C_List__x58__x58_ (dtb_u_u753, dtb_u_u754) -> (if ((v_termUsesFloat dtb_u_u751) (v_caseAltBody dtb_u_u753)) then true else ((v_anyAltUsesFloat dtb_u_u751) dtb_u_u754))
  | B_dData_dList.C_List_Nil -> false
  | _ -> failwith "DT: impossible branch"
))

# 485 "Vuna/Compiler/Core/Term.vuna"
let rec v_termGlobalNames = (fun (dtb_u_u755 : t_Term) -> (match dtb_u_u755 with
  | C_Term_TIf (dtb_u_u756, dtb_u_u757, dtb_u_u758) -> ((B_dData_dList.v_append (v_termGlobalNames dtb_u_u756)) ((B_dData_dList.v_append (v_termGlobalNames dtb_u_u757)) (v_termGlobalNames dtb_u_u758)))
  | C_Term_TBool (dtb_u_u759) -> B_dData_dList.C_List_Nil
  | C_Term_TStr (dtb_u_u760) -> B_dData_dList.C_List_Nil
  | C_Term_TInt (dtb_u_u761) -> B_dData_dList.C_List_Nil
  | C_Term_TCase (dtb_u_u762, dtb_u_u763) -> ((B_dData_dList.v_append (v_termGlobalNames dtb_u_u762)) ((B_dData_dList.v_concatMap (fun (dtb_u_u764 : t_CaseAlt) -> (v_termGlobalNames (v_caseAltBody dtb_u_u764)))) dtb_u_u763))
  | C_Term_TRecUpd (dtb_u_u765, dtb_u_u766, dtb_u_u767, dtb_u_u768, dtb_u_u769) -> ((B_dData_dList.v_append (v_termGlobalNames dtb_u_u765)) (v_termGlobalNames dtb_u_u769))
  | C_Term_TProj (dtb_u_u770, dtb_u_u771, dtb_u_u772, dtb_u_u773, dtb_u_u774) -> (v_termGlobalNames dtb_u_u770)
  | C_Term_TRecord (dtb_u_u775, dtb_u_u776) -> (B_dData_dList.C_List__x58__x58_ (dtb_u_u775, ((B_dData_dList.v_concatMap (fun (dtb_u_u777 : (t_Term, t_Rig) B_dData_dPair.t_Pair) -> (v_termGlobalNames (B_dData_dPair.v_firstOf dtb_u_u777)))) dtb_u_u776)))
  | C_Term_TMk (dtb_u_u778, dtb_u_u779) -> ((B_dData_dList.v_concatMap (fun (dtb_u_u780 : (t_Term, t_Rig) B_dData_dPair.t_Pair) -> (v_termGlobalNames (B_dData_dPair.v_firstOf dtb_u_u780)))) dtb_u_u779)
  | C_Term_TCon (dtb_u_u781, dtb_u_u782) -> ((B_dData_dList.v_concatMap (fun (dtb_u_u783 : (t_Term, t_Rig) B_dData_dPair.t_Pair) -> (v_termGlobalNames (B_dData_dPair.v_firstOf dtb_u_u783)))) dtb_u_u782)
  | C_Term_TApp (dtb_u_u784, dtb_u_u785, dtb_u_u786) -> ((B_dData_dList.v_append (v_termGlobalNames dtb_u_u784)) (v_termGlobalNames dtb_u_u785))
  | C_Term_TLam (dtb_u_u787, dtb_u_u788, dtb_u_u789, dtb_u_u790, dtb_u_u791) -> (v_termGlobalNames dtb_u_u791)
  | C_Term_TPi (dtb_u_u792, dtb_u_u793, dtb_u_u794, dtb_u_u795, dtb_u_u796) -> ((B_dData_dList.v_append (v_termGlobalNames dtb_u_u795)) (v_termGlobalNames dtb_u_u796))
  | C_Term_TType (dtb_u_u797) -> B_dData_dList.C_List_Nil
  | C_Term_TMeta (dtb_u_u798) -> B_dData_dList.C_List_Nil
  | C_Term_TVar (dtb_u_u799, dtb_u_u800, dtb_u_u801) -> B_dData_dList.C_List_Nil
  | C_Term_TGlobal (dtb_u_u802) -> (B_dData_dList.C_List__x58__x58_ (dtb_u_u802, B_dData_dList.C_List_Nil))
  | C_Term_TFloat (dtb_u_u803) -> B_dData_dList.C_List_Nil
  | _ -> failwith "DT: impossible branch"
))

# 512 "Vuna/Compiler/Core/Term.vuna"
let rec v_hasFreeVar = (fun (dtb_u_u804 : int) (dtb_u_u805 : t_Term) -> (match dtb_u_u805 with
  | C_Term_TIf (dtb_u_u806, dtb_u_u807, dtb_u_u808) -> (if (if ((v_hasFreeVar dtb_u_u804) dtb_u_u806) then true else ((v_hasFreeVar dtb_u_u804) dtb_u_u807)) then true else ((v_hasFreeVar dtb_u_u804) dtb_u_u808))
  | C_Term_TBool (dtb_u_u809) -> false
  | C_Term_TFloat (dtb_u_u810) -> false
  | C_Term_TStr (dtb_u_u811) -> false
  | C_Term_TInt (dtb_u_u812) -> false
  | C_Term_TCase (dtb_u_u813, dtb_u_u814) -> (if ((v_hasFreeVar dtb_u_u804) dtb_u_u813) then true else ((v_hasFreeVarAlts dtb_u_u804) dtb_u_u814))
  | C_Term_TRecUpd (dtb_u_u815, dtb_u_u816, dtb_u_u817, dtb_u_u818, dtb_u_u819) -> (if ((v_hasFreeVar dtb_u_u804) dtb_u_u815) then true else ((v_hasFreeVar (dtb_u_u804 + (B_dData_dList.v_length dtb_u_u817))) dtb_u_u819))
  | C_Term_TProj (dtb_u_u820, dtb_u_u821, dtb_u_u822, dtb_u_u823, dtb_u_u824) -> ((v_hasFreeVar dtb_u_u804) dtb_u_u820)
  | C_Term_TRecord (dtb_u_u825, dtb_u_u826) -> ((v_hasFreeVarArgs dtb_u_u804) dtb_u_u826)
  | C_Term_TMk (dtb_u_u827, dtb_u_u828) -> ((v_hasFreeVarArgs dtb_u_u804) dtb_u_u828)
  | C_Term_TCon (dtb_u_u829, dtb_u_u830) -> ((v_hasFreeVarArgs dtb_u_u804) dtb_u_u830)
  | C_Term_TApp (dtb_u_u831, dtb_u_u832, dtb_u_u833) -> (if ((v_hasFreeVar dtb_u_u804) dtb_u_u831) then true else ((v_hasFreeVar dtb_u_u804) dtb_u_u832))
  | C_Term_TLam (dtb_u_u834, dtb_u_u835, dtb_u_u836, dtb_u_u837, dtb_u_u838) -> (let dtb_u_u839 = (let dtb_u_u840 = dtb_u_u836 in (match dtb_u_u840 with
  | B_dData_dMaybe.C_Maybe_Just (dtb_u_u841) -> (match dtb_u_u841 with
  | { B_dData_dPair.f_Pair_first = dtb_u_u842; B_dData_dPair.f_Pair_second = dtb_u_u843 } -> (match dtb_u_u843 with
  | { B_dData_dPair.f_Pair_first = dtb_u_u844; B_dData_dPair.f_Pair_second = dtb_u_u845 } -> (if ((v_hasFreeVarMaybe dtb_u_u804) dtb_u_u844) then true else ((v_hasFreeVarMaybe (dtb_u_u804 + 1)) dtb_u_u845))
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
)
  | B_dData_dMaybe.C_Maybe_Nothing -> false
  | _ -> failwith "DT: impossible branch"
)) in (if dtb_u_u839 then true else ((v_hasFreeVar (dtb_u_u804 + 1)) dtb_u_u838)))
  | C_Term_TPi (dtb_u_u846, dtb_u_u847, dtb_u_u848, dtb_u_u849, dtb_u_u850) -> (if ((v_hasFreeVar dtb_u_u804) dtb_u_u849) then true else ((v_hasFreeVar (dtb_u_u804 + 1)) dtb_u_u850))
  | C_Term_TType (dtb_u_u851) -> false
  | C_Term_TGlobal (dtb_u_u852) -> false
  | C_Term_TMeta (dtb_u_u853) -> false
  | C_Term_TVar (dtb_u_u854, dtb_u_u855, dtb_u_u856) -> (dtb_u_u855 >= dtb_u_u804)
  | _ -> failwith "DT: impossible branch"
))
# 540 "Vuna/Compiler/Core/Term.vuna"
and v_hasFreeVarMaybe = (fun (dtb_u_u857 : int) (dtb_u_u858 : t_Term B_dData_dMaybe.t_Maybe) -> (match dtb_u_u858 with
  | B_dData_dMaybe.C_Maybe_Just (dtb_u_u859) -> ((v_hasFreeVar dtb_u_u857) dtb_u_u859)
  | B_dData_dMaybe.C_Maybe_Nothing -> false
  | _ -> failwith "DT: impossible branch"
))
# 544 "Vuna/Compiler/Core/Term.vuna"
and v_hasFreeVarArgs = (fun (dtb_u_u860 : int) (dtb_u_u861 : (t_Term, t_Rig) B_dData_dPair.t_Pair B_dData_dList.t_List) -> (match dtb_u_u861 with
  | B_dData_dList.C_List__x58__x58_ (dtb_u_u862, dtb_u_u863) -> (match dtb_u_u862 with
  | { B_dData_dPair.f_Pair_first = dtb_u_u864; B_dData_dPair.f_Pair_second = dtb_u_u865 } -> (if ((v_hasFreeVar dtb_u_u860) dtb_u_u864) then true else ((v_hasFreeVarArgs dtb_u_u860) dtb_u_u863))
  | _ -> failwith "DT: impossible branch"
)
  | B_dData_dList.C_List_Nil -> false
  | _ -> failwith "DT: impossible branch"
))
# 548 "Vuna/Compiler/Core/Term.vuna"
and v_hasFreeVarAlts = (fun (dtb_u_u866 : int) (dtb_u_u867 : t_CaseAlt B_dData_dList.t_List) -> (match dtb_u_u867 with
  | B_dData_dList.C_List__x58__x58_ (dtb_u_u868, dtb_u_u869) -> (if ((v_hasFreeVar (dtb_u_u866 + (B_dData_dList.v_length (v_caseAltBinders dtb_u_u868)))) (v_caseAltBody dtb_u_u868)) then true else ((v_hasFreeVarAlts dtb_u_u866) dtb_u_u869))
  | B_dData_dList.C_List_Nil -> false
  | _ -> failwith "DT: impossible branch"
))

# 553 "Vuna/Compiler/Core/Term.vuna"
let rec v_hasMeta = (fun (dtb_u_u870 : int) (dtb_u_u871 : int) (dtb_u_u872 : t_Term) -> (match dtb_u_u872 with
  | C_Term_TIf (dtb_u_u873, dtb_u_u874, dtb_u_u875) -> (if (if (((v_hasMeta dtb_u_u870) dtb_u_u871) dtb_u_u873) then true else (((v_hasMeta dtb_u_u870) dtb_u_u871) dtb_u_u874)) then true else (((v_hasMeta dtb_u_u870) dtb_u_u871) dtb_u_u875))
  | C_Term_TBool (dtb_u_u876) -> false
  | C_Term_TFloat (dtb_u_u877) -> false
  | C_Term_TStr (dtb_u_u878) -> false
  | C_Term_TInt (dtb_u_u879) -> false
  | C_Term_TCase (dtb_u_u880, dtb_u_u881) -> (if (((v_hasMeta dtb_u_u870) dtb_u_u871) dtb_u_u880) then true else (((v_hasMetaAlts dtb_u_u870) dtb_u_u871) dtb_u_u881))
  | C_Term_TRecUpd (dtb_u_u882, dtb_u_u883, dtb_u_u884, dtb_u_u885, dtb_u_u886) -> (if (((v_hasMeta dtb_u_u870) dtb_u_u871) dtb_u_u882) then true else (((v_hasMeta dtb_u_u870) (dtb_u_u871 + (B_dData_dList.v_length dtb_u_u884))) dtb_u_u886))
  | C_Term_TProj (dtb_u_u887, dtb_u_u888, dtb_u_u889, dtb_u_u890, dtb_u_u891) -> (((v_hasMeta dtb_u_u870) dtb_u_u871) dtb_u_u887)
  | C_Term_TRecord (dtb_u_u892, dtb_u_u893) -> (((v_hasMetaArgs dtb_u_u870) dtb_u_u871) dtb_u_u893)
  | C_Term_TMk (dtb_u_u894, dtb_u_u895) -> (((v_hasMetaArgs dtb_u_u870) dtb_u_u871) dtb_u_u895)
  | C_Term_TCon (dtb_u_u896, dtb_u_u897) -> (((v_hasMetaArgs dtb_u_u870) dtb_u_u871) dtb_u_u897)
  | C_Term_TApp (dtb_u_u898, dtb_u_u899, dtb_u_u900) -> (if (((v_hasMeta dtb_u_u870) dtb_u_u871) dtb_u_u898) then true else (((v_hasMeta dtb_u_u870) dtb_u_u871) dtb_u_u899))
  | C_Term_TLam (dtb_u_u901, dtb_u_u902, dtb_u_u903, dtb_u_u904, dtb_u_u905) -> (let dtb_u_u906 = (let dtb_u_u907 = dtb_u_u903 in (match dtb_u_u907 with
  | B_dData_dMaybe.C_Maybe_Just (dtb_u_u908) -> (match dtb_u_u908 with
  | { B_dData_dPair.f_Pair_first = dtb_u_u909; B_dData_dPair.f_Pair_second = dtb_u_u910 } -> (match dtb_u_u910 with
  | { B_dData_dPair.f_Pair_first = dtb_u_u911; B_dData_dPair.f_Pair_second = dtb_u_u912 } -> (if (((v_hasMetaMaybe dtb_u_u870) dtb_u_u871) dtb_u_u911) then true else (((v_hasMetaMaybe dtb_u_u870) (dtb_u_u871 + 1)) dtb_u_u912))
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
)
  | B_dData_dMaybe.C_Maybe_Nothing -> false
  | _ -> failwith "DT: impossible branch"
)) in (if dtb_u_u906 then true else (((v_hasMeta dtb_u_u870) (dtb_u_u871 + 1)) dtb_u_u905)))
  | C_Term_TPi (dtb_u_u913, dtb_u_u914, dtb_u_u915, dtb_u_u916, dtb_u_u917) -> (if (((v_hasMeta dtb_u_u870) dtb_u_u871) dtb_u_u916) then true else (((v_hasMeta dtb_u_u870) (dtb_u_u871 + 1)) dtb_u_u917))
  | C_Term_TType (dtb_u_u918) -> false
  | C_Term_TGlobal (dtb_u_u919) -> false
  | C_Term_TVar (dtb_u_u920, dtb_u_u921, dtb_u_u922) -> false
  | C_Term_TMeta (dtb_u_u923) -> (dtb_u_u870 = dtb_u_u923)
  | _ -> failwith "DT: impossible branch"
))
# 580 "Vuna/Compiler/Core/Term.vuna"
and v_hasMetaMaybe = (fun (dtb_u_u924 : int) (dtb_u_u925 : int) (dtb_u_u926 : t_Term B_dData_dMaybe.t_Maybe) -> (match dtb_u_u926 with
  | B_dData_dMaybe.C_Maybe_Just (dtb_u_u927) -> (((v_hasMeta dtb_u_u924) dtb_u_u925) dtb_u_u927)
  | B_dData_dMaybe.C_Maybe_Nothing -> false
  | _ -> failwith "DT: impossible branch"
))
# 584 "Vuna/Compiler/Core/Term.vuna"
and v_hasMetaArgs = (fun (dtb_u_u928 : int) (dtb_u_u929 : int) (dtb_u_u930 : (t_Term, t_Rig) B_dData_dPair.t_Pair B_dData_dList.t_List) -> (match dtb_u_u930 with
  | B_dData_dList.C_List__x58__x58_ (dtb_u_u931, dtb_u_u932) -> (match dtb_u_u931 with
  | { B_dData_dPair.f_Pair_first = dtb_u_u933; B_dData_dPair.f_Pair_second = dtb_u_u934 } -> (if (((v_hasMeta dtb_u_u928) dtb_u_u929) dtb_u_u933) then true else (((v_hasMetaArgs dtb_u_u928) dtb_u_u929) dtb_u_u932))
  | _ -> failwith "DT: impossible branch"
)
  | B_dData_dList.C_List_Nil -> false
  | _ -> failwith "DT: impossible branch"
))
# 588 "Vuna/Compiler/Core/Term.vuna"
and v_hasMetaAlts = (fun (dtb_u_u935 : int) (dtb_u_u936 : int) (dtb_u_u937 : t_CaseAlt B_dData_dList.t_List) -> (match dtb_u_u937 with
  | B_dData_dList.C_List__x58__x58_ (dtb_u_u938, dtb_u_u939) -> (if (((v_hasMeta dtb_u_u935) (dtb_u_u936 + (B_dData_dList.v_length (v_caseAltBinders dtb_u_u938)))) (v_caseAltBody dtb_u_u938)) then true else (((v_hasMetaAlts dtb_u_u935) dtb_u_u936) dtb_u_u939))
  | B_dData_dList.C_List_Nil -> false
  | _ -> failwith "DT: impossible branch"
))

# 705 "Vuna/Compiler/Core/Term.vuna"
let rec v_substVarAt = (fun (dtb_u_u940 : int) (dtb_u_u941 : t_Term) (dtb_u_u942 : t_Term) -> (match dtb_u_u942 with
  | C_Term_TIf (dtb_u_u943, dtb_u_u944, dtb_u_u945) -> (C_Term_TIf ((((v_substVarAt dtb_u_u940) dtb_u_u941) dtb_u_u943), (((v_substVarAt dtb_u_u940) dtb_u_u941) dtb_u_u944), (((v_substVarAt dtb_u_u940) dtb_u_u941) dtb_u_u945)))
  | C_Term_TBool (dtb_u_u946) -> dtb_u_u942
  | C_Term_TFloat (dtb_u_u947) -> dtb_u_u942
  | C_Term_TStr (dtb_u_u948) -> dtb_u_u942
  | C_Term_TInt (dtb_u_u949) -> dtb_u_u942
  | C_Term_TCase (dtb_u_u950, dtb_u_u951) -> (C_Term_TCase ((((v_substVarAt dtb_u_u940) dtb_u_u941) dtb_u_u950), ((B_dData_dList.v_map ((v_substAltAt dtb_u_u940) dtb_u_u941)) dtb_u_u951)))
  | C_Term_TRecUpd (dtb_u_u952, dtb_u_u953, dtb_u_u954, dtb_u_u955, dtb_u_u956) -> (C_Term_TRecUpd ((((v_substVarAt dtb_u_u940) dtb_u_u941) dtb_u_u952), dtb_u_u953, dtb_u_u954, dtb_u_u955, (((v_substVarAt (dtb_u_u940 + (B_dData_dList.v_length dtb_u_u954))) dtb_u_u941) dtb_u_u956)))
  | C_Term_TProj (dtb_u_u957, dtb_u_u958, dtb_u_u959, dtb_u_u960, dtb_u_u961) -> (C_Term_TProj ((((v_substVarAt dtb_u_u940) dtb_u_u941) dtb_u_u957), dtb_u_u958, dtb_u_u959, dtb_u_u960, dtb_u_u961))
  | C_Term_TRecord (dtb_u_u962, dtb_u_u963) -> (C_Term_TRecord (dtb_u_u962, ((B_dData_dList.v_map (fun (dtb_u_u964 : (t_Term, t_Rig) B_dData_dPair.t_Pair) -> { B_dData_dPair.f_Pair_first = (((v_substVarAt dtb_u_u940) dtb_u_u941) (B_dData_dPair.v_firstOf dtb_u_u964)); B_dData_dPair.f_Pair_second = (B_dData_dPair.v_secondOf dtb_u_u964) })) dtb_u_u963)))
  | C_Term_TMk (dtb_u_u965, dtb_u_u966) -> (C_Term_TMk (dtb_u_u965, ((B_dData_dList.v_map (fun (dtb_u_u967 : (t_Term, t_Rig) B_dData_dPair.t_Pair) -> { B_dData_dPair.f_Pair_first = (((v_substVarAt dtb_u_u940) dtb_u_u941) (B_dData_dPair.v_firstOf dtb_u_u967)); B_dData_dPair.f_Pair_second = (B_dData_dPair.v_secondOf dtb_u_u967) })) dtb_u_u966)))
  | C_Term_TCon (dtb_u_u968, dtb_u_u969) -> (C_Term_TCon (dtb_u_u968, ((B_dData_dList.v_map (fun (dtb_u_u970 : (t_Term, t_Rig) B_dData_dPair.t_Pair) -> { B_dData_dPair.f_Pair_first = (((v_substVarAt dtb_u_u940) dtb_u_u941) (B_dData_dPair.v_firstOf dtb_u_u970)); B_dData_dPair.f_Pair_second = (B_dData_dPair.v_secondOf dtb_u_u970) })) dtb_u_u969)))
  | C_Term_TApp (dtb_u_u971, dtb_u_u972, dtb_u_u973) -> (C_Term_TApp ((((v_substVarAt dtb_u_u940) dtb_u_u941) dtb_u_u971), (((v_substVarAt dtb_u_u940) dtb_u_u941) dtb_u_u972), dtb_u_u973))
  | C_Term_TLam (dtb_u_u974, dtb_u_u975, dtb_u_u976, dtb_u_u977, dtb_u_u978) -> (let dtb_u_u979 = (let dtb_u_u980 = dtb_u_u976 in (match dtb_u_u980 with
  | B_dData_dMaybe.C_Maybe_Just (dtb_u_u981) -> (match dtb_u_u981 with
  | { B_dData_dPair.f_Pair_first = dtb_u_u982; B_dData_dPair.f_Pair_second = dtb_u_u983 } -> (match dtb_u_u983 with
  | { B_dData_dPair.f_Pair_first = dtb_u_u984; B_dData_dPair.f_Pair_second = dtb_u_u985 } -> (let dtb_u_u986 = (match dtb_u_u984 with
  | B_dData_dMaybe.C_Maybe_Nothing -> B_dData_dMaybe.C_Maybe_Nothing
  | B_dData_dMaybe.C_Maybe_Just (dtb_u_u989) -> (B_dData_dMaybe.C_Maybe_Just ((((v_substVarAt dtb_u_u940) dtb_u_u941) dtb_u_u989)))
  | _ -> failwith "DT: impossible branch"
) in (let dtb_u_u987 = (match dtb_u_u985 with
  | B_dData_dMaybe.C_Maybe_Nothing -> B_dData_dMaybe.C_Maybe_Nothing
  | B_dData_dMaybe.C_Maybe_Just (dtb_u_u988) -> (B_dData_dMaybe.C_Maybe_Just ((((v_substVarAt (dtb_u_u940 + 1)) dtb_u_u941) dtb_u_u988)))
  | _ -> failwith "DT: impossible branch"
) in (B_dData_dMaybe.C_Maybe_Just ({ B_dData_dPair.f_Pair_first = dtb_u_u982; B_dData_dPair.f_Pair_second = { B_dData_dPair.f_Pair_first = dtb_u_u986; B_dData_dPair.f_Pair_second = dtb_u_u987 } }))))
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
)
  | B_dData_dMaybe.C_Maybe_Nothing -> B_dData_dMaybe.C_Maybe_Nothing
  | _ -> failwith "DT: impossible branch"
)) in (C_Term_TLam (dtb_u_u974, dtb_u_u975, dtb_u_u979, dtb_u_u977, (((v_substVarAt (dtb_u_u940 + 1)) dtb_u_u941) dtb_u_u978))))
  | C_Term_TPi (dtb_u_u990, dtb_u_u991, dtb_u_u992, dtb_u_u993, dtb_u_u994) -> (C_Term_TPi (dtb_u_u990, dtb_u_u991, dtb_u_u992, (((v_substVarAt dtb_u_u940) dtb_u_u941) dtb_u_u993), (((v_substVarAt (dtb_u_u940 + 1)) dtb_u_u941) dtb_u_u994)))
  | C_Term_TType (dtb_u_u995) -> dtb_u_u942
  | C_Term_TGlobal (dtb_u_u996) -> dtb_u_u942
  | C_Term_TMeta (dtb_u_u997) -> dtb_u_u942
  | C_Term_TVar (dtb_u_u998, dtb_u_u999, dtb_u_u1000) -> (if (dtb_u_u999 = dtb_u_u940) then dtb_u_u941 else dtb_u_u942)
  | _ -> failwith "DT: impossible branch"
))
# 748 "Vuna/Compiler/Core/Term.vuna"
and v_substAltAt = (fun (dtb_u_u1001 : int) (dtb_u_u1002 : t_Term) (dtb_u_u1003 : t_CaseAlt) -> { f_CaseAlt_caseAltName = (v_caseAltName dtb_u_u1003); f_CaseAlt_caseAltBinders = (v_caseAltBinders dtb_u_u1003); f_CaseAlt_caseAltBody = (((v_substVarAt (dtb_u_u1001 + (B_dData_dList.v_length (v_caseAltBinders dtb_u_u1003)))) dtb_u_u1002) (v_caseAltBody dtb_u_u1003)) })

# 1028 "Vuna/Compiler/Core/Term.vuna"
let rec v_showTerm = (fun (dtb_u_u1004 : t_Term) -> (match dtb_u_u1004 with
  | C_Term_TIf (dtb_u_u1005, dtb_u_u1006, dtb_u_u1007) -> (String.concat "" ["if "; (v_showTerm dtb_u_u1005); " then "; (v_showTerm dtb_u_u1006); " else "; (v_showTerm dtb_u_u1007)])
  | C_Term_TBool (dtb_u_u1008) -> (if dtb_u_u1008 then "True" else "False")
  | C_Term_TFloat (dtb_u_u1009) -> dtb_u_u1009
  | C_Term_TStr (dtb_u_u1010) -> (v_showCoreString dtb_u_u1010)
  | C_Term_TInt (dtb_u_u1011) -> (string_of_int dtb_u_u1011)
  | C_Term_TCase (dtb_u_u1012, dtb_u_u1013) -> (String.concat "" ["case "; (v_showTerm dtb_u_u1012); " of "; (v_showCoreAlts dtb_u_u1013)])
  | C_Term_TRecUpd (dtb_u_u1014, dtb_u_u1015, dtb_u_u1016, dtb_u_u1017, dtb_u_u1018) -> (String.concat "" [(v_showTerm dtb_u_u1014); " with "; dtb_u_u1015; " "; (v_showTerm dtb_u_u1018)])
  | C_Term_TProj (dtb_u_u1019, dtb_u_u1020, dtb_u_u1021, dtb_u_u1022, dtb_u_u1023) -> (String.concat "" [(v_showTerm dtb_u_u1019); "."; dtb_u_u1020; "#"; (string_of_int dtb_u_u1023)])
  | C_Term_TRecord (dtb_u_u1024, dtb_u_u1025) -> ((v_recordAppShow dtb_u_u1024) dtb_u_u1025)
  | C_Term_TMk (dtb_u_u1026, dtb_u_u1027) -> (String.concat "" ["("; dtb_u_u1026; (v_showArgTerms dtb_u_u1027); ")"])
  | C_Term_TCon (dtb_u_u1028, dtb_u_u1029) -> (String.concat "" ["("; dtb_u_u1028; (v_showArgTerms dtb_u_u1029); ")"])
  | C_Term_TApp (dtb_u_u1030, dtb_u_u1031, dtb_u_u1032) -> (String.concat "" ["("; (v_showTerm dtb_u_u1030); " "; (v_showTerm dtb_u_u1031); ")"])
  | C_Term_TLam (dtb_u_u1033, dtb_u_u1034, dtb_u_u1035, dtb_u_u1036, dtb_u_u1037) -> (String.concat "" ["\\"; dtb_u_u1033; " => "; (v_showTerm dtb_u_u1037)])
  | C_Term_TPi (dtb_u_u1038, dtb_u_u1039, dtb_u_u1040, dtb_u_u1041, dtb_u_u1042) -> (if (dtb_u_u1038 = "_") then (String.concat "" [(v_showTerm dtb_u_u1041); " -> "; (v_showTerm dtb_u_u1042)]) else (if dtb_u_u1039 then (String.concat "" ["{"; dtb_u_u1038; " : "; (v_showTerm dtb_u_u1041); "} -> "; (v_showTerm dtb_u_u1042)]) else (String.concat "" ["("; dtb_u_u1038; " : "; (v_showTerm dtb_u_u1041); ") -> "; (v_showTerm dtb_u_u1042)])))
  | C_Term_TType (dtb_u_u1043) -> (if ((v_levelToInt dtb_u_u1043) = 0) then "Type" else ("Type " ^ (string_of_int (v_levelToInt dtb_u_u1043))))
  | C_Term_TGlobal (dtb_u_u1044) -> dtb_u_u1044
  | C_Term_TMeta (dtb_u_u1045) -> ("?" ^ (string_of_int dtb_u_u1045))
  | C_Term_TVar (dtb_u_u1046, dtb_u_u1047, dtb_u_u1048) -> dtb_u_u1046
  | _ -> failwith "DT: impossible branch"
))
# 1085 "Vuna/Compiler/Core/Term.vuna"
and v_showArgTerms = (fun (dtb_u_u1049 : (t_Term, t_Rig) B_dData_dPair.t_Pair B_dData_dList.t_List) -> (match dtb_u_u1049 with
  | B_dData_dList.C_List__x58__x58_ (dtb_u_u1050, dtb_u_u1051) -> (match dtb_u_u1050 with
  | { B_dData_dPair.f_Pair_first = dtb_u_u1052; B_dData_dPair.f_Pair_second = dtb_u_u1053 } -> (String.concat "" [" "; (v_showTerm dtb_u_u1052); (v_showArgTerms dtb_u_u1051)])
  | _ -> failwith "DT: impossible branch"
)
  | B_dData_dList.C_List_Nil -> ""
  | _ -> failwith "DT: impossible branch"
))
# 1090 "Vuna/Compiler/Core/Term.vuna"
and v_recordAppShow = (fun (dtb_u_u1054 : string) (dtb_u_u1055 : (t_Term, t_Rig) B_dData_dPair.t_Pair B_dData_dList.t_List) -> (match dtb_u_u1055 with
  | B_dData_dList.C_List__x58__x58_ (dtb_u_u1056, dtb_u_u1057) -> (match dtb_u_u1056 with
  | { B_dData_dPair.f_Pair_first = dtb_u_u1058; B_dData_dPair.f_Pair_second = dtb_u_u1059 } -> ((v_recordAppShow (String.concat "" ["("; dtb_u_u1054; " "; (v_showTerm dtb_u_u1058); ")"])) dtb_u_u1057)
  | _ -> failwith "DT: impossible branch"
)
  | B_dData_dList.C_List_Nil -> dtb_u_u1054
  | _ -> failwith "DT: impossible branch"
))
# 1100 "Vuna/Compiler/Core/Term.vuna"
and v_showCoreAlts = (fun (dtb_u_u1060 : t_CaseAlt B_dData_dList.t_List) -> (match dtb_u_u1060 with
  | B_dData_dList.C_List__x58__x58_ (dtb_u_u1061, dtb_u_u1062) -> (String.concat "" [(v_caseAltName dtb_u_u1061); (v_showBinders (v_binderPairs (v_caseAltBinders dtb_u_u1061))); " => "; (v_showTerm (v_caseAltBody dtb_u_u1061)); " | "; (v_showCoreAlts dtb_u_u1062)])
  | B_dData_dList.C_List_Nil -> ""
  | _ -> failwith "DT: impossible branch"
))

# 1060 "Vuna/Compiler/Core/Term.vuna"
let rec v_showPiSig = (fun (dtb_u_u1063 : string) (dtb_u_u1064 : bool) (dtb_u_u1065 : t_Term) (dtb_u_u1066 : t_Term) -> (if (dtb_u_u1063 = "_") then (String.concat "" [(v_showSigParenIfPi dtb_u_u1065); " -> "; (v_showTypeSig dtb_u_u1066)]) else (if dtb_u_u1064 then (String.concat "" ["{"; dtb_u_u1063; " : "; (v_showTypeSig dtb_u_u1065); "} -> "; (v_showTypeSig dtb_u_u1066)]) else (String.concat "" ["("; dtb_u_u1063; " : "; (v_showTypeSig dtb_u_u1065); ") -> "; (v_showTypeSig dtb_u_u1066)]))))
# 1069 "Vuna/Compiler/Core/Term.vuna"
and v_showTypeSig = (fun (dtb_u_u1067 : t_Term) -> (match dtb_u_u1067 with
  | C_Term_TRecord (dtb_u_u1068, dtb_u_u1069) -> ((v_showSigAppText dtb_u_u1068) dtb_u_u1069)
  | C_Term_TCon (dtb_u_u1070, dtb_u_u1071) -> (match dtb_u_u1071 with
  | B_dData_dList.C_List_Nil -> dtb_u_u1070
  | _ -> (String.concat "" ["("; dtb_u_u1070; (v_showSigArgs dtb_u_u1071); ")"])
)
  | C_Term_TApp (dtb_u_u1072, dtb_u_u1073, dtb_u_u1074) -> (String.concat "" ["("; (v_showSigParenIfPi dtb_u_u1072); " "; (v_showSigParenIfPi dtb_u_u1073); ")"])
  | C_Term_TPi (dtb_u_u1075, dtb_u_u1076, dtb_u_u1077, dtb_u_u1078, dtb_u_u1079) -> ((((v_showPiSig dtb_u_u1075) dtb_u_u1076) dtb_u_u1078) dtb_u_u1079)
  | _ -> (v_showTerm dtb_u_u1067)
))
# 1077 "Vuna/Compiler/Core/Term.vuna"
and v_showSigParenIfPi = (fun (dtb_u_u1080 : t_Term) -> (match dtb_u_u1080 with
  | C_Term_TPi (dtb_u_u1081, dtb_u_u1082, dtb_u_u1083, dtb_u_u1084, dtb_u_u1085) -> (String.concat "" ["("; ((((v_showPiSig dtb_u_u1081) dtb_u_u1082) dtb_u_u1084) dtb_u_u1085); ")"])
  | _ -> (v_showTypeSig dtb_u_u1080)
))
# 1081 "Vuna/Compiler/Core/Term.vuna"
and v_showSigArgs = (fun (dtb_u_u1086 : (t_Term, t_Rig) B_dData_dPair.t_Pair B_dData_dList.t_List) -> (match dtb_u_u1086 with
  | B_dData_dList.C_List__x58__x58_ (dtb_u_u1087, dtb_u_u1088) -> (match dtb_u_u1087 with
  | { B_dData_dPair.f_Pair_first = dtb_u_u1089; B_dData_dPair.f_Pair_second = dtb_u_u1090 } -> (String.concat "" [" "; (v_showSigParenIfPi dtb_u_u1089); (v_showSigArgs dtb_u_u1088)])
  | _ -> failwith "DT: impossible branch"
)
  | B_dData_dList.C_List_Nil -> ""
  | _ -> failwith "DT: impossible branch"
))
# 1095 "Vuna/Compiler/Core/Term.vuna"
and v_showSigAppText = (fun (dtb_u_u1091 : string) (dtb_u_u1092 : (t_Term, t_Rig) B_dData_dPair.t_Pair B_dData_dList.t_List) -> (match dtb_u_u1092 with
  | B_dData_dList.C_List__x58__x58_ (dtb_u_u1093, dtb_u_u1094) -> (match dtb_u_u1093 with
  | { B_dData_dPair.f_Pair_first = dtb_u_u1095; B_dData_dPair.f_Pair_second = dtb_u_u1096 } -> ((v_showSigAppText (String.concat "" ["("; dtb_u_u1091; " "; (v_showSigParenIfPi dtb_u_u1095); ")"])) dtb_u_u1094)
  | _ -> failwith "DT: impossible branch"
)
  | B_dData_dList.C_List_Nil -> dtb_u_u1091
  | _ -> failwith "DT: impossible branch"
))

# 192 "Vuna/Compiler/Core/Term.vuna"
let v_closureEnv = (fun (dtb_u_u1097 : t_Closure) -> (match dtb_u_u1097 with
  | { f_Closure_closureEnv = dtb_u_u1098; f_Closure_closureBody = dtb_u_u1099 } -> dtb_u_u1098
  | _ -> failwith "DT: impossible branch"
))

# 193 "Vuna/Compiler/Core/Term.vuna"
let v_closureBody = (fun (dtb_u_u1100 : t_Closure) -> (match dtb_u_u1100 with
  | { f_Closure_closureEnv = dtb_u_u1101; f_Closure_closureBody = dtb_u_u1102 } -> dtb_u_u1102
  | _ -> failwith "DT: impossible branch"
))

# 222 "Vuna/Compiler/Core/Term.vuna"
let v_vCaseAltName = (fun (dtb_u_u1103 : t_VCaseAlt) -> (match dtb_u_u1103 with
  | { f_VCaseAlt_vCaseAltName = dtb_u_u1104; f_VCaseAlt_vCaseAltBinders = dtb_u_u1105; f_VCaseAlt_vCaseAltClosure = dtb_u_u1106 } -> dtb_u_u1104
  | _ -> failwith "DT: impossible branch"
))

# 223 "Vuna/Compiler/Core/Term.vuna"
let v_vCaseAltBinders = (fun (dtb_u_u1107 : t_VCaseAlt) -> (match dtb_u_u1107 with
  | { f_VCaseAlt_vCaseAltName = dtb_u_u1108; f_VCaseAlt_vCaseAltBinders = dtb_u_u1109; f_VCaseAlt_vCaseAltClosure = dtb_u_u1110 } -> dtb_u_u1109
  | _ -> failwith "DT: impossible branch"
))

# 224 "Vuna/Compiler/Core/Term.vuna"
let v_vCaseAltClosure = (fun (dtb_u_u1111 : t_VCaseAlt) -> (match dtb_u_u1111 with
  | { f_VCaseAlt_vCaseAltName = dtb_u_u1112; f_VCaseAlt_vCaseAltBinders = dtb_u_u1113; f_VCaseAlt_vCaseAltClosure = dtb_u_u1114 } -> dtb_u_u1114
  | _ -> failwith "DT: impossible branch"
))

# 373 "Vuna/Compiler/Core/Term.vuna"
let v_solsTbl = (fun (dtb_u_u1115 : t_Sols) -> (match dtb_u_u1115 with
  | { f_Sols_solsTbl = dtb_u_u1116; f_Sols_solsList = dtb_u_u1117; f_Sols_solsDepth = dtb_u_u1118 } -> dtb_u_u1116
  | _ -> failwith "DT: impossible branch"
))

# 374 "Vuna/Compiler/Core/Term.vuna"
let v_solsList = (fun (dtb_u_u1119 : t_Sols) -> (match dtb_u_u1119 with
  | { f_Sols_solsTbl = dtb_u_u1120; f_Sols_solsList = dtb_u_u1121; f_Sols_solsDepth = dtb_u_u1122 } -> dtb_u_u1121
  | _ -> failwith "DT: impossible branch"
))

# 375 "Vuna/Compiler/Core/Term.vuna"
let v_solsDepth = (fun (dtb_u_u1123 : t_Sols) -> (match dtb_u_u1123 with
  | { f_Sols_solsTbl = dtb_u_u1124; f_Sols_solsList = dtb_u_u1125; f_Sols_solsDepth = dtb_u_u1126 } -> dtb_u_u1126
  | _ -> failwith "DT: impossible branch"
))
