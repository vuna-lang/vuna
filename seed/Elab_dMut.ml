open Vuna_runtime
type t_MutOp = { f_MutOp_mutOpUser : string; f_MutOp_mutOpInternal : string; f_MutOp_mutOpArity : int }
and t_MutFamily = { f_MutFamily_mutFamModule : string; f_MutFamily_mutFamLabel : string; f_MutFamily_mutFamOpFamily : string; f_MutFamily_mutFamHandleType : string; f_MutFamily_mutFamHandleArity : int; f_MutFamily_mutFamPayloadIndex : int; f_MutFamily_mutFamBinderPrefix : string; f_MutFamily_mutFamWith : string; f_MutFamily_mutFamWithPure : string; f_MutFamily_mutFamWithInternal : string; f_MutFamily_mutFamWithPureInternal : string; f_MutFamily_mutFamIntroArity : int; f_MutFamily_mutFamOps : t_MutOp B_dData_dList.t_List }
and t_MutRowEntry = { f_MutRowEntry_mutRowEntryName : string; f_MutRowEntry_mutRowEntryFamily : string; f_MutRowEntry_mutRowEntryArgs : Core_dTerm.t_Term B_dData_dList.t_List }

# 54 "Vuna/Compiler/Elab/Mut.vuna"
let v_mutFamilies = (B_dData_dList.C_List__x58__x58_ ({ f_MutFamily_mutFamModule = "Base.Effect.MutRef"; f_MutFamily_mutFamLabel = "mutable ref"; f_MutFamily_mutFamOpFamily = "Base.Effect.MutRef.MutRefOp"; f_MutFamily_mutFamHandleType = "@vuna@Cell"; f_MutFamily_mutFamHandleArity = 1; f_MutFamily_mutFamPayloadIndex = 0; f_MutFamily_mutFamBinderPrefix = "@vuna@cell@"; f_MutFamily_mutFamWith = "Base.Effect.MutRef.withMutRef"; f_MutFamily_mutFamWithPure = "Base.Effect.MutRef.withMutRefPure"; f_MutFamily_mutFamWithInternal = "cellWith"; f_MutFamily_mutFamWithPureInternal = "cellWithPure"; f_MutFamily_mutFamIntroArity = 1; f_MutFamily_mutFamOps = (B_dData_dList.C_List__x58__x58_ ({ f_MutOp_mutOpUser = "Base.Effect.MutRef.read"; f_MutOp_mutOpInternal = "cellReadOp"; f_MutOp_mutOpArity = 0 }, (B_dData_dList.C_List__x58__x58_ ({ f_MutOp_mutOpUser = "Base.Effect.MutRef.write"; f_MutOp_mutOpInternal = "cellWriteOp"; f_MutOp_mutOpArity = 1 }, B_dData_dList.C_List_Nil)))) }, (B_dData_dList.C_List__x58__x58_ ({ f_MutFamily_mutFamModule = "Base.Effect.MutArray"; f_MutFamily_mutFamLabel = "mutable array"; f_MutFamily_mutFamOpFamily = "Base.Effect.MutArray.MutArrayOp"; f_MutFamily_mutFamHandleType = "@vuna@MArray"; f_MutFamily_mutFamHandleArity = 1; f_MutFamily_mutFamPayloadIndex = 0; f_MutFamily_mutFamBinderPrefix = "@vuna@marr@"; f_MutFamily_mutFamWith = "Base.Effect.MutArray.withMutArray"; f_MutFamily_mutFamWithPure = "Base.Effect.MutArray.withMutArrayPure"; f_MutFamily_mutFamWithInternal = "marrWith"; f_MutFamily_mutFamWithPureInternal = "marrWithPure"; f_MutFamily_mutFamIntroArity = 2; f_MutFamily_mutFamOps = (B_dData_dList.C_List__x58__x58_ ({ f_MutOp_mutOpUser = "Base.Effect.MutArray.get"; f_MutOp_mutOpInternal = "marrGetOp"; f_MutOp_mutOpArity = 1 }, (B_dData_dList.C_List__x58__x58_ ({ f_MutOp_mutOpUser = "Base.Effect.MutArray.set"; f_MutOp_mutOpInternal = "marrSetOp"; f_MutOp_mutOpArity = 2 }, (B_dData_dList.C_List__x58__x58_ ({ f_MutOp_mutOpUser = "Base.Effect.MutArray.size"; f_MutOp_mutOpInternal = "marrLenOp"; f_MutOp_mutOpArity = 0 }, B_dData_dList.C_List_Nil)))))) }, (B_dData_dList.C_List__x58__x58_ ({ f_MutFamily_mutFamModule = "Base.Effect.MutVec"; f_MutFamily_mutFamLabel = "mutable vector"; f_MutFamily_mutFamOpFamily = "Base.Effect.MutVec.MutVecOp"; f_MutFamily_mutFamHandleType = "@vuna@MArray"; f_MutFamily_mutFamHandleArity = 1; f_MutFamily_mutFamPayloadIndex = 1; f_MutFamily_mutFamBinderPrefix = "@vuna@mvec@"; f_MutFamily_mutFamWith = "Base.Effect.MutVec.withMutVec"; f_MutFamily_mutFamWithPure = "Base.Effect.MutVec.withMutVecPure"; f_MutFamily_mutFamWithInternal = "mvecWith"; f_MutFamily_mutFamWithPureInternal = "mvecWithPure"; f_MutFamily_mutFamIntroArity = 1; f_MutFamily_mutFamOps = (B_dData_dList.C_List__x58__x58_ ({ f_MutOp_mutOpUser = "Base.Effect.MutVec.get"; f_MutOp_mutOpInternal = "mvecGetOp"; f_MutOp_mutOpArity = 1 }, (B_dData_dList.C_List__x58__x58_ ({ f_MutOp_mutOpUser = "Base.Effect.MutVec.set"; f_MutOp_mutOpInternal = "mvecSetOp"; f_MutOp_mutOpArity = 2 }, (B_dData_dList.C_List__x58__x58_ ({ f_MutOp_mutOpUser = "Base.Effect.MutVec.size"; f_MutOp_mutOpInternal = "mvecLenOp"; f_MutOp_mutOpArity = 0 }, B_dData_dList.C_List_Nil)))))) }, (B_dData_dList.C_List__x58__x58_ ({ f_MutFamily_mutFamModule = "Base.Effect.MutDynArray"; f_MutFamily_mutFamLabel = "mutable dynamic array"; f_MutFamily_mutFamOpFamily = "Base.Effect.MutDynArray.MutDynArrayOp"; f_MutFamily_mutFamHandleType = "@vuna@MDynArray"; f_MutFamily_mutFamHandleArity = 1; f_MutFamily_mutFamPayloadIndex = 0; f_MutFamily_mutFamBinderPrefix = "@vuna@mdyn@"; f_MutFamily_mutFamWith = "Base.Effect.MutDynArray.withMutDynArray"; f_MutFamily_mutFamWithPure = "Base.Effect.MutDynArray.withMutDynArrayPure"; f_MutFamily_mutFamWithInternal = "dynWith"; f_MutFamily_mutFamWithPureInternal = "dynWithPure"; f_MutFamily_mutFamIntroArity = 0; f_MutFamily_mutFamOps = (B_dData_dList.C_List__x58__x58_ ({ f_MutOp_mutOpUser = "Base.Effect.MutDynArray.get"; f_MutOp_mutOpInternal = "dynGetOp"; f_MutOp_mutOpArity = 1 }, (B_dData_dList.C_List__x58__x58_ ({ f_MutOp_mutOpUser = "Base.Effect.MutDynArray.set"; f_MutOp_mutOpInternal = "dynSetOp"; f_MutOp_mutOpArity = 2 }, (B_dData_dList.C_List__x58__x58_ ({ f_MutOp_mutOpUser = "Base.Effect.MutDynArray.push"; f_MutOp_mutOpInternal = "dynPushOp"; f_MutOp_mutOpArity = 1 }, (B_dData_dList.C_List__x58__x58_ ({ f_MutOp_mutOpUser = "Base.Effect.MutDynArray.size"; f_MutOp_mutOpInternal = "dynLenOp"; f_MutOp_mutOpArity = 0 }, (B_dData_dList.C_List__x58__x58_ ({ f_MutOp_mutOpUser = "Base.Effect.MutDynArray.clear"; f_MutOp_mutOpInternal = "dynClearOp"; f_MutOp_mutOpArity = 0 }, B_dData_dList.C_List_Nil)))))))))) }, (B_dData_dList.C_List__x58__x58_ ({ f_MutFamily_mutFamModule = "Base.Effect.MutBuffer"; f_MutFamily_mutFamLabel = "mutable buffer"; f_MutFamily_mutFamOpFamily = "Base.Effect.MutBuffer.MutBufferOp"; f_MutFamily_mutFamHandleType = "@vuna@MBuffer"; f_MutFamily_mutFamHandleArity = 0; f_MutFamily_mutFamPayloadIndex = 0; f_MutFamily_mutFamBinderPrefix = "@vuna@mbuf@"; f_MutFamily_mutFamWith = "Base.Effect.MutBuffer.withMutBuffer"; f_MutFamily_mutFamWithPure = "Base.Effect.MutBuffer.withMutBufferPure"; f_MutFamily_mutFamWithInternal = "mbufWith"; f_MutFamily_mutFamWithPureInternal = "mbufWithPure"; f_MutFamily_mutFamIntroArity = 0; f_MutFamily_mutFamOps = (B_dData_dList.C_List__x58__x58_ ({ f_MutOp_mutOpUser = "Base.Effect.MutBuffer.append"; f_MutOp_mutOpInternal = "mbufAppendOp"; f_MutOp_mutOpArity = 1 }, (B_dData_dList.C_List__x58__x58_ ({ f_MutOp_mutOpUser = "Base.Effect.MutBuffer.appendChar"; f_MutOp_mutOpInternal = "mbufAppendCharOp"; f_MutOp_mutOpArity = 1 }, (B_dData_dList.C_List__x58__x58_ ({ f_MutOp_mutOpUser = "Base.Effect.MutBuffer.length"; f_MutOp_mutOpInternal = "mbufLenOp"; f_MutOp_mutOpArity = 0 }, (B_dData_dList.C_List__x58__x58_ ({ f_MutOp_mutOpUser = "Base.Effect.MutBuffer.clear"; f_MutOp_mutOpInternal = "mbufClearOp"; f_MutOp_mutOpArity = 0 }, (B_dData_dList.C_List__x58__x58_ ({ f_MutOp_mutOpUser = "Base.Effect.MutBuffer.toString"; f_MutOp_mutOpInternal = "mbufToStringOp"; f_MutOp_mutOpArity = 0 }, B_dData_dList.C_List_Nil)))))))))) }, B_dData_dList.C_List_Nil))))))))))

# 140 "Vuna/Compiler/Elab/Mut.vuna"
let rec v_mutOpInFamOf = (fun (mc0 : t_MutOp B_dData_dList.t_List) (mc1 : string) -> (match mc0 with
  | B_dData_dList.C_List__x58__x58_ (dtb__0, dtb__1) -> (if ((dtb__0).f_MutOp_mutOpUser = mc1) then (B_dData_dMaybe.C_Maybe_Just (dtb__0)) else ((v_mutOpInFamOf dtb__1) mc1))
  | B_dData_dList.C_List_Nil -> B_dData_dMaybe.C_Maybe_Nothing
  | _ -> failwith "DT: impossible branch"
))

# 133 "Vuna/Compiler/Elab/Mut.vuna"
let rec v_mutOpOfFamilies = (fun (mc0 : t_MutFamily B_dData_dList.t_List) (mc1 : string) -> (match mc0 with
  | B_dData_dList.C_List__x58__x58_ (dtb__2, dtb__3) -> (match ((v_mutOpInFamOf (dtb__2).f_MutFamily_mutFamOps) mc1) with
  | B_dData_dMaybe.C_Maybe_Just (dtb__4) -> (B_dData_dMaybe.C_Maybe_Just ({ B_dData_dPair.f_Pair_first = dtb__2; B_dData_dPair.f_Pair_second = dtb__4 }))
  | B_dData_dMaybe.C_Maybe_Nothing -> ((v_mutOpOfFamilies dtb__3) mc1)
  | _ -> failwith "DT: impossible branch"
)
  | B_dData_dList.C_List_Nil -> B_dData_dMaybe.C_Maybe_Nothing
  | _ -> failwith "DT: impossible branch"
))

# 130 "Vuna/Compiler/Elab/Mut.vuna"
let v_mutOpOf = (fun (head : string) -> ((v_mutOpOfFamilies v_mutFamilies) head))

# 148 "Vuna/Compiler/Elab/Mut.vuna"
let rec v_mutIntroOfFamilies = (fun (mc0 : t_MutFamily B_dData_dList.t_List) (mc1 : string) -> (match mc0 with
  | B_dData_dList.C_List__x58__x58_ (dtb__5, dtb__6) -> (if (mc1 = (dtb__5).f_MutFamily_mutFamWith) then (B_dData_dMaybe.C_Maybe_Just ({ B_dData_dPair.f_Pair_first = dtb__5; B_dData_dPair.f_Pair_second = false })) else (if (mc1 = (dtb__5).f_MutFamily_mutFamWithPure) then (B_dData_dMaybe.C_Maybe_Just ({ B_dData_dPair.f_Pair_first = dtb__5; B_dData_dPair.f_Pair_second = true })) else ((v_mutIntroOfFamilies dtb__6) mc1)))
  | B_dData_dList.C_List_Nil -> B_dData_dMaybe.C_Maybe_Nothing
  | _ -> failwith "DT: impossible branch"
))

# 145 "Vuna/Compiler/Elab/Mut.vuna"
let v_mutIntroOf = (fun (head : string) -> ((v_mutIntroOfFamilies v_mutFamilies) head))

# 159 "Vuna/Compiler/Elab/Mut.vuna"
let rec v_mutFamilyOfOpFamilyGo = (fun (mc0 : t_MutFamily B_dData_dList.t_List) (mc1 : string) -> (match mc0 with
  | B_dData_dList.C_List__x58__x58_ (dtb__7, dtb__8) -> (if ((dtb__7).f_MutFamily_mutFamOpFamily = mc1) then (B_dData_dMaybe.C_Maybe_Just (dtb__7)) else ((v_mutFamilyOfOpFamilyGo dtb__8) mc1))
  | B_dData_dList.C_List_Nil -> B_dData_dMaybe.C_Maybe_Nothing
  | _ -> failwith "DT: impossible branch"
))

# 156 "Vuna/Compiler/Elab/Mut.vuna"
let v_mutFamilyOfOpFamily = (fun (name : string) -> ((v_mutFamilyOfOpFamilyGo v_mutFamilies) name))

# 168 "Vuna/Compiler/Elab/Mut.vuna"
let v_mutBinderName = (fun (fam : t_MutFamily) (n : string) -> ((fam).f_MutFamily_mutFamBinderPrefix ^ n))

# 182 "Vuna/Compiler/Elab/Mut.vuna"
let v_stripPrefixString = (fun (pre : string) (s : string) -> (if ((B_dData_dString.v_startsWith pre) s) then (B_dData_dMaybe.C_Maybe_Just ((((B_dData_dString.v_substring (bi_natFromInt (bi_strLength pre))) (bi_natFromInt ((bi_strLength s) - (bi_strLength pre)))) s))) else B_dData_dMaybe.C_Maybe_Nothing))

# 175 "Vuna/Compiler/Elab/Mut.vuna"
let rec v_mutBinderOfGo = (fun (mc0 : t_MutFamily B_dData_dList.t_List) (mc1 : string) -> (match mc0 with
  | B_dData_dList.C_List__x58__x58_ (dtb__9, dtb__10) -> (match ((v_stripPrefixString (dtb__9).f_MutFamily_mutFamBinderPrefix) mc1) with
  | B_dData_dMaybe.C_Maybe_Just (dtb__11) -> (B_dData_dMaybe.C_Maybe_Just ({ B_dData_dPair.f_Pair_first = dtb__9; B_dData_dPair.f_Pair_second = dtb__11 }))
  | B_dData_dMaybe.C_Maybe_Nothing -> ((v_mutBinderOfGo dtb__10) mc1)
  | _ -> failwith "DT: impossible branch"
)
  | B_dData_dList.C_List_Nil -> B_dData_dMaybe.C_Maybe_Nothing
  | _ -> failwith "DT: impossible branch"
))

# 172 "Vuna/Compiler/Elab/Mut.vuna"
let v_mutBinderOf = (fun (name : string) -> ((v_mutBinderOfGo v_mutFamilies) name))

# 202 "Vuna/Compiler/Elab/Mut.vuna"
let rec v_mutHeadArgsGo = (fun (mc0 : Core_dTerm.t_Term) (mc1 : Core_dTerm.t_Term B_dData_dList.t_List) -> (match mc0 with
  | Core_dTerm.C_Term_TGlobal (dtb__12) -> (B_dData_dMaybe.C_Maybe_Just ({ B_dData_dPair.f_Pair_first = dtb__12; B_dData_dPair.f_Pair_second = mc1 }))
  | Core_dTerm.C_Term_TMk (dtb__13, dtb__14) -> (B_dData_dMaybe.C_Maybe_Just ({ B_dData_dPair.f_Pair_first = dtb__13; B_dData_dPair.f_Pair_second = ((B_dData_dList.v_append ((B_dData_dList.v_map B_dData_dPair.v_firstOf) dtb__14)) mc1) }))
  | Core_dTerm.C_Term_TCon (dtb__15, dtb__16) -> (B_dData_dMaybe.C_Maybe_Just ({ B_dData_dPair.f_Pair_first = dtb__15; B_dData_dPair.f_Pair_second = ((B_dData_dList.v_append ((B_dData_dList.v_map B_dData_dPair.v_firstOf) dtb__16)) mc1) }))
  | Core_dTerm.C_Term_TApp (dtb__17, dtb__18, dtb__19) -> ((v_mutHeadArgsGo dtb__17) (B_dData_dList.C_List__x58__x58_ (dtb__18, mc1)))
  | _ -> B_dData_dMaybe.C_Maybe_Nothing
))

# 199 "Vuna/Compiler/Elab/Mut.vuna"
let v_mutHeadArgs = (fun (t : Core_dTerm.t_Term) -> ((v_mutHeadArgsGo t) B_dData_dList.C_List_Nil))

# 249 "Vuna/Compiler/Elab/Mut.vuna"
let v_mutEntryOf = (fun (e : Core_dTerm.t_Term) -> (let nd_uscrut1 = (v_mutHeadArgs e) in (match nd_uscrut1 with
  | B_dData_dMaybe.C_Maybe_Nothing -> B_dData_dMaybe.C_Maybe_Nothing
  | B_dData_dMaybe.C_Maybe_Just (dtb__20) -> (match dtb__20 with
  | { B_dData_dPair.f_Pair_first = dtb__21; B_dData_dPair.f_Pair_second = dtb__22 } -> (if (dtb__21 = Base_dIntrinsics.v_effNamedName) then (let nd_uscrut8 = dtb__22 in (match nd_uscrut8 with
  | B_dData_dList.C_List__x58__x58_ (dtb__23, dtb__24) -> (match dtb__24 with
  | B_dData_dList.C_List__x58__x58_ (dtb__25, dtb__26) -> (match dtb__23 with
  | Core_dTerm.C_Term_TStr (dtb__27) -> (let nd_uscrut16 = (v_mutHeadArgs dtb__25) in (match nd_uscrut16 with
  | B_dData_dMaybe.C_Maybe_Nothing -> B_dData_dMaybe.C_Maybe_Nothing
  | B_dData_dMaybe.C_Maybe_Just (dtb__28) -> (match dtb__28 with
  | { B_dData_dPair.f_Pair_first = dtb__29; B_dData_dPair.f_Pair_second = dtb__30 } -> (B_dData_dMaybe.C_Maybe_Just ({ f_MutRowEntry_mutRowEntryName = dtb__27; f_MutRowEntry_mutRowEntryFamily = dtb__29; f_MutRowEntry_mutRowEntryArgs = dtb__30 }))
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
))
  | _ -> B_dData_dMaybe.C_Maybe_Nothing
)
  | _ -> B_dData_dMaybe.C_Maybe_Nothing
)
  | _ -> B_dData_dMaybe.C_Maybe_Nothing
)) else B_dData_dMaybe.C_Maybe_Nothing)
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
)))

# 231 "Vuna/Compiler/Elab/Mut.vuna"
let rec v_mutRowEntriesGo = (fun (fuel : int) (r : Core_dTerm.t_Term) -> (if (fuel <= 0) then B_dData_dList.C_List_Nil else (let nd_uscrut2 = (v_mutHeadArgs r) in (match nd_uscrut2 with
  | B_dData_dMaybe.C_Maybe_Nothing -> B_dData_dList.C_List_Nil
  | B_dData_dMaybe.C_Maybe_Just (dtb__31) -> (match dtb__31 with
  | { B_dData_dPair.f_Pair_first = dtb__32; B_dData_dPair.f_Pair_second = dtb__33 } -> (if (dtb__32 = Base_dIntrinsics.v_effRowConsCtor) then (let nd_uscrut9 = dtb__33 in (match nd_uscrut9 with
  | B_dData_dList.C_List__x58__x58_ (dtb__34, dtb__35) -> (match dtb__35 with
  | B_dData_dList.C_List__x58__x58_ (dtb__36, dtb__37) -> (match (v_mutEntryOf dtb__34) with
  | B_dData_dMaybe.C_Maybe_Just (dtb__38) -> (B_dData_dList.C_List__x58__x58_ (dtb__38, ((v_mutRowEntriesGo (fuel - 1)) dtb__36)))
  | B_dData_dMaybe.C_Maybe_Nothing -> ((v_mutRowEntriesGo (fuel - 1)) dtb__36)
  | _ -> failwith "DT: impossible branch"
)
  | _ -> B_dData_dList.C_List_Nil
)
  | _ -> B_dData_dList.C_List_Nil
)) else B_dData_dList.C_List_Nil)
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
))))

# 213 "Vuna/Compiler/Elab/Mut.vuna"
let rec v_mutRowEntriesOfTyGo = (fun (fuel : int) (t : Core_dTerm.t_Term) -> (if (fuel <= 0) then B_dData_dList.C_List_Nil else (match t with
  | Core_dTerm.C_Term_TPi (dtb__39, dtb__40, dtb__41, dtb__42, dtb__43) -> ((v_mutRowEntriesOfTyGo (fuel - 1)) dtb__43)
  | _ -> (let nd_uscrut2 = (v_mutHeadArgs t) in (match nd_uscrut2 with
  | B_dData_dMaybe.C_Maybe_Nothing -> B_dData_dList.C_List_Nil
  | B_dData_dMaybe.C_Maybe_Just (dtb__44) -> (match dtb__44 with
  | { B_dData_dPair.f_Pair_first = dtb__45; B_dData_dPair.f_Pair_second = dtb__46 } -> (if (dtb__45 = "Base.Effect.Core.Eff") then (match dtb__46 with
  | B_dData_dList.C_List__x58__x58_ (dtb__47, dtb__48) -> ((v_mutRowEntriesGo fuel) dtb__47)
  | B_dData_dList.C_List_Nil -> B_dData_dList.C_List_Nil
  | _ -> failwith "DT: impossible branch"
) else B_dData_dList.C_List_Nil)
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
))
)))

# 210 "Vuna/Compiler/Elab/Mut.vuna"
let v_mutRowEntriesOfTy = (fun (t : Core_dTerm.t_Term) -> ((v_mutRowEntriesOfTyGo 256) t))

# 333 "Vuna/Compiler/Elab/Mut.vuna"
let rec v_mutHasHandleBinder = (fun (mc0 : string) (mc1 : (string, Core_dTerm.t_Term) B_dData_dPair.t_Pair B_dData_dList.t_List) -> (match mc1 with
  | B_dData_dList.C_List__x58__x58_ (dtb__49, dtb__50) -> (match dtb__49 with
  | { B_dData_dPair.f_Pair_first = dtb__51; B_dData_dPair.f_Pair_second = dtb__52 } -> (if (mc0 = dtb__51) then true else ((v_mutHasHandleBinder mc0) dtb__50))
  | _ -> failwith "DT: impossible branch"
)
  | B_dData_dList.C_List_Nil -> false
  | _ -> failwith "DT: impossible branch"
))

# 325 "Vuna/Compiler/Elab/Mut.vuna"
let rec v_mutHandleParamsDedupe = (fun (mc0 : (string, Core_dTerm.t_Term) B_dData_dPair.t_Pair B_dData_dList.t_List) (mc1 : (string, Core_dTerm.t_Term) B_dData_dPair.t_Pair B_dData_dList.t_List) -> (match mc0 with
  | B_dData_dList.C_List__x58__x58_ (dtb__53, dtb__54) -> (match dtb__53 with
  | { B_dData_dPair.f_Pair_first = dtb__55; B_dData_dPair.f_Pair_second = dtb__56 } -> (if ((v_mutHasHandleBinder dtb__55) mc1) then ((v_mutHandleParamsDedupe dtb__54) mc1) else ((v_mutHandleParamsDedupe dtb__54) (B_dData_dList.C_List__x58__x58_ ({ B_dData_dPair.f_Pair_first = dtb__55; B_dData_dPair.f_Pair_second = dtb__56 }, mc1))))
  | _ -> failwith "DT: impossible branch"
)
  | B_dData_dList.C_List_Nil -> (B_dData_dList.v_reverse mc1)
  | _ -> failwith "DT: impossible branch"
))

# 338 "Vuna/Compiler/Elab/Mut.vuna"
let rec v_nthTerm = (fun (i : int) (xs : Core_dTerm.t_Term B_dData_dList.t_List) -> (if (i < 0) then B_dData_dMaybe.C_Maybe_Nothing else (match xs with
  | B_dData_dList.C_List_Nil -> B_dData_dMaybe.C_Maybe_Nothing
  | B_dData_dList.C_List__x58__x58_ (dtb__57, dtb__58) -> (if (i = 0) then (B_dData_dMaybe.C_Maybe_Just (dtb__57)) else ((v_nthTerm (i - 1)) dtb__58))
  | _ -> failwith "DT: impossible branch"
)))

# 282 "Vuna/Compiler/Elab/Mut.vuna"
let v_mutRowEntryHandle = (fun (e : t_MutRowEntry) -> (match (v_mutFamilyOfOpFamily (e).f_MutRowEntry_mutRowEntryFamily) with
  | B_dData_dMaybe.C_Maybe_Just (dtb__59) -> (let binder = ((v_mutBinderName dtb__59) (e).f_MutRowEntry_mutRowEntryName) in (if ((dtb__59).f_MutFamily_mutFamHandleArity <= 0) then (B_dData_dMaybe.C_Maybe_Just ({ B_dData_dPair.f_Pair_first = binder; B_dData_dPair.f_Pair_second = (Core_dTerm.C_Term_TGlobal ((dtb__59).f_MutFamily_mutFamHandleType)) })) else (match ((v_nthTerm (dtb__59).f_MutFamily_mutFamPayloadIndex) (e).f_MutRowEntry_mutRowEntryArgs) with
  | B_dData_dMaybe.C_Maybe_Just (dtb__60) -> (B_dData_dMaybe.C_Maybe_Just ({ B_dData_dPair.f_Pair_first = binder; B_dData_dPair.f_Pair_second = (Core_dTerm.C_Term_TApp ((Core_dTerm.C_Term_TGlobal ((dtb__59).f_MutFamily_mutFamHandleType)), dtb__60, Core_dTerm.C_Rig_Rig0)) }))
  | B_dData_dMaybe.C_Maybe_Nothing -> B_dData_dMaybe.C_Maybe_Nothing
  | _ -> failwith "DT: impossible branch"
)))
  | B_dData_dMaybe.C_Maybe_Nothing -> B_dData_dMaybe.C_Maybe_Nothing
  | _ -> failwith "DT: impossible branch"
))

# 274 "Vuna/Compiler/Elab/Mut.vuna"
let rec v_mutHandleParamsGo = (fun (mc0 : t_MutRowEntry B_dData_dList.t_List) (mc1 : (string, Core_dTerm.t_Term) B_dData_dPair.t_Pair B_dData_dList.t_List) -> (match mc0 with
  | B_dData_dList.C_List__x58__x58_ (dtb__61, dtb__62) -> (match (v_mutRowEntryHandle dtb__61) with
  | B_dData_dMaybe.C_Maybe_Just (dtb__63) -> ((v_mutHandleParamsGo dtb__62) (B_dData_dList.C_List__x58__x58_ (dtb__63, mc1)))
  | B_dData_dMaybe.C_Maybe_Nothing -> ((v_mutHandleParamsGo dtb__62) mc1)
  | _ -> failwith "DT: impossible branch"
)
  | B_dData_dList.C_List_Nil -> (B_dData_dList.v_reverse mc1)
  | _ -> failwith "DT: impossible branch"
))

# 307 "Vuna/Compiler/Elab/Mut.vuna"
let v_mutMemberHandleParamOf = (fun (dom : Core_dTerm.t_Term) -> (let nd_uscrut1 = (v_mutHeadArgs dom) in (match nd_uscrut1 with
  | B_dData_dMaybe.C_Maybe_Nothing -> B_dData_dList.C_List_Nil
  | B_dData_dMaybe.C_Maybe_Just (dtb__64) -> (match dtb__64 with
  | { B_dData_dPair.f_Pair_first = dtb__65; B_dData_dPair.f_Pair_second = dtb__66 } -> (if (dtb__65 = "Base.Effect.Core.Member") then (match dtb__66 with
  | B_dData_dList.C_List__x58__x58_ (dtb__67, dtb__68) -> (match (v_mutEntryOf dtb__67) with
  | B_dData_dMaybe.C_Maybe_Just (dtb__69) -> (match (v_mutRowEntryHandle dtb__69) with
  | B_dData_dMaybe.C_Maybe_Just (dtb__70) -> (B_dData_dList.C_List__x58__x58_ (dtb__70, B_dData_dList.C_List_Nil))
  | B_dData_dMaybe.C_Maybe_Nothing -> B_dData_dList.C_List_Nil
  | _ -> failwith "DT: impossible branch"
)
  | B_dData_dMaybe.C_Maybe_Nothing -> B_dData_dList.C_List_Nil
  | _ -> failwith "DT: impossible branch"
)
  | _ -> B_dData_dList.C_List_Nil
) else B_dData_dList.C_List_Nil)
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
)))

# 298 "Vuna/Compiler/Elab/Mut.vuna"
let rec v_mutMemberHandleParams = (fun (fuel : int) (ty : Core_dTerm.t_Term) (acc : (string, Core_dTerm.t_Term) B_dData_dPair.t_Pair B_dData_dList.t_List) -> (if (fuel <= 0) then (B_dData_dList.v_reverse acc) else (match ty with
  | Core_dTerm.C_Term_TPi (dtb__71, dtb__72, dtb__73, dtb__74, dtb__75) -> (((v_mutMemberHandleParams (fuel - 1)) dtb__75) ((B_dData_dList.v_append (v_mutMemberHandleParamOf dtb__74)) acc))
  | _ -> (B_dData_dList.v_reverse acc)
)))

# 268 "Vuna/Compiler/Elab/Mut.vuna"
let v_mutHandleParamsOf = (fun (ty : Core_dTerm.t_Term) -> ((v_mutHandleParamsDedupe ((B_dData_dList.v_append ((v_mutHandleParamsGo (v_mutRowEntriesOfTy ty)) B_dData_dList.C_List_Nil)) (((v_mutMemberHandleParams 256) ty) B_dData_dList.C_List_Nil))) B_dData_dList.C_List_Nil))

# 369 "Vuna/Compiler/Elab/Mut.vuna"
let rec v_mutPiCount = (fun (mc0 : Core_dTerm.t_Term) -> (match mc0 with
  | Core_dTerm.C_Term_TPi (dtb__76, dtb__77, dtb__78, dtb__79, dtb__80) -> (1 + (v_mutPiCount dtb__80))
  | _ -> 0
))

# 365 "Vuna/Compiler/Elab/Mut.vuna"
let rec v_mutSuffixBinderCount = (fun (mc0 : Core_dTerm.t_Term) -> (match mc0 with
  | Core_dTerm.C_Term_TPi (dtb__81, dtb__82, dtb__83, dtb__84, dtb__85) -> (if dtb__82 then (v_mutSuffixBinderCount dtb__85) else (v_mutPiCount mc0))
  | _ -> (v_mutPiCount mc0)
))

# 379 "Vuna/Compiler/Elab/Mut.vuna"
let rec v_mutWrapHandleParams = (fun (mc0 : int) (mc1 : (string, Core_dTerm.t_Term) B_dData_dPair.t_Pair B_dData_dList.t_List) (mc2 : Core_dTerm.t_Term) -> (match mc1 with
  | B_dData_dList.C_List__x58__x58_ (dtb__86, dtb__87) -> (match dtb__86 with
  | { B_dData_dPair.f_Pair_first = dtb__88; B_dData_dPair.f_Pair_second = dtb__89 } -> (Core_dTerm.C_Term_TPi (dtb__88, true, Core_dTerm.C_Rig_RigOmega, (((Core_dTerm.v_shift 0) mc0) dtb__89), (((v_mutWrapHandleParams (mc0 + 1)) dtb__87) mc2)))
  | _ -> failwith "DT: impossible branch"
)
  | B_dData_dList.C_List_Nil -> (((Core_dTerm.v_shift 0) mc0) mc2)
  | _ -> failwith "DT: impossible branch"
))

# 373 "Vuna/Compiler/Elab/Mut.vuna"
let rec v_mutAddHandleParamsTyped = (fun (mc0 : (string, Core_dTerm.t_Term) B_dData_dPair.t_Pair B_dData_dList.t_List) (mc1 : Core_dTerm.t_Term) -> (match mc0 with
  | B_dData_dList.C_List_Nil -> mc1
  | _ -> (match mc1 with
  | Core_dTerm.C_Term_TPi (dtb__90, dtb__91, dtb__92, dtb__93, dtb__94) -> (if dtb__91 then (Core_dTerm.C_Term_TPi (dtb__90, true, dtb__92, dtb__93, ((v_mutAddHandleParamsTyped mc0) dtb__94))) else (((v_mutWrapHandleParams 0) mc0) mc1))
  | _ -> (((v_mutWrapHandleParams 0) mc0) mc1)
)
))

# 357 "Vuna/Compiler/Elab/Mut.vuna"
let v_mutAddHandleParams = (fun (ty : Core_dTerm.t_Term) -> (let skipped = (v_mutSuffixBinderCount ty) in (let params = ((B_dData_dList.v_map (fun (p : (string, Core_dTerm.t_Term) B_dData_dPair.t_Pair) -> { B_dData_dPair.f_Pair_first = (B_dData_dPair.v_firstOf p); B_dData_dPair.f_Pair_second = (((Core_dTerm.v_shift 0) (0 - skipped)) (B_dData_dPair.v_secondOf p)) })) (v_mutHandleParamsOf ty)) in ((v_mutAddHandleParamsTyped params) ty))))

# 391 "Vuna/Compiler/Elab/Mut.vuna"
let rec v_rowKeys = (fun (mc0 : t_MutRowEntry B_dData_dList.t_List) -> (match mc0 with
  | B_dData_dList.C_List__x58__x58_ (dtb__95, dtb__96) -> (B_dData_dList.C_List__x58__x58_ ({ B_dData_dPair.f_Pair_first = (dtb__95).f_MutRowEntry_mutRowEntryFamily; B_dData_dPair.f_Pair_second = (dtb__95).f_MutRowEntry_mutRowEntryName }, (v_rowKeys dtb__96)))
  | B_dData_dList.C_List_Nil -> B_dData_dList.C_List_Nil
  | _ -> failwith "DT: impossible branch"
))

# 400 "Vuna/Compiler/Elab/Mut.vuna"
let rec v_memKey = (fun (mc0 : (string, string) B_dData_dPair.t_Pair) (mc1 : (string, string) B_dData_dPair.t_Pair B_dData_dList.t_List) -> (match mc0 with
  | { B_dData_dPair.f_Pair_first = dtb__97; B_dData_dPair.f_Pair_second = dtb__98 } -> (match mc1 with
  | B_dData_dList.C_List__x58__x58_ (dtb__99, dtb__100) -> (match dtb__99 with
  | { B_dData_dPair.f_Pair_first = dtb__101; B_dData_dPair.f_Pair_second = dtb__102 } -> (if (if (dtb__97 = dtb__101) then (dtb__98 = dtb__102) else false) then true else ((v_memKey { B_dData_dPair.f_Pair_first = dtb__97; B_dData_dPair.f_Pair_second = dtb__98 }) dtb__100))
  | _ -> failwith "DT: impossible branch"
)
  | B_dData_dList.C_List_Nil -> false
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
))

# 395 "Vuna/Compiler/Elab/Mut.vuna"
let rec v_duplicateKeysGo = (fun (mc0 : (string, string) B_dData_dPair.t_Pair B_dData_dList.t_List) (mc1 : (string, string) B_dData_dPair.t_Pair B_dData_dList.t_List) -> (match mc0 with
  | B_dData_dList.C_List__x58__x58_ (dtb__103, dtb__104) -> (if ((v_memKey dtb__103) mc1) then (B_dData_dList.C_List__x58__x58_ (dtb__103, ((v_duplicateKeysGo dtb__104) mc1))) else ((v_duplicateKeysGo dtb__104) (B_dData_dList.C_List__x58__x58_ (dtb__103, mc1))))
  | B_dData_dList.C_List_Nil -> B_dData_dList.C_List_Nil
  | _ -> failwith "DT: impossible branch"
))

# 388 "Vuna/Compiler/Elab/Mut.vuna"
let v_mutDuplicateRowKeys = (fun (ty : Core_dTerm.t_Term) -> ((v_duplicateKeysGo (v_rowKeys (v_mutRowEntriesOfTy ty))) B_dData_dList.C_List_Nil))

# 408 "Vuna/Compiler/Elab/Mut.vuna"
let v_mutOpExpr = (fun (fam : t_MutFamily) (op : t_MutOp) (sp : Base_dSource.t_Span) (name : string) (args : Frontend_dRast.t_Expr B_dData_dList.t_List) -> (Frontend_dRast.C_Expr_EApp ((Frontend_dRast.C_Expr_EVar ((Frontend_dRast_dName.C_RName_RGlobal ((fam).f_MutFamily_mutFamModule, (op).f_MutOp_mutOpInternal)), sp)), ((B_dData_dList.v_append (B_dData_dList.C_List__x58__x58_ ((Frontend_dRast.C_Expr_EApp ((Frontend_dRast.C_Expr_EVar ((Frontend_dRast_dName.C_RName_RIntrinsic (Frontend_dReserved.v_instArgSyntax)), sp)), (B_dData_dList.C_List__x58__x58_ ((Frontend_dRast.C_Expr_EStr (name, sp)), B_dData_dList.C_List_Nil)), sp)), (B_dData_dList.C_List__x58__x58_ ((Frontend_dRast.C_Expr_EVar ((Frontend_dRast_dName.C_RName_RLocal (((v_mutBinderName fam) name))), sp)), B_dData_dList.C_List_Nil))))) args), sp)))

# 417 "Vuna/Compiler/Elab/Mut.vuna"
let v_mutIntroExpr = (fun (fam : t_MutFamily) (pure : bool) (sp : Base_dSource.t_Span) (nExpr : Frontend_dRast.t_Expr) (extraArgs : Frontend_dRast.t_Expr B_dData_dList.t_List) (body : Frontend_dRast.t_Expr) (name : string) -> (let lam = (Frontend_dRast.C_Expr_ELam ((B_dData_dList.C_List__x58__x58_ ({ B_dData_dPair.f_Pair_first = ((v_mutBinderName fam) name); B_dData_dPair.f_Pair_second = Base_dSource.v_spanEmpty }, B_dData_dList.C_List_Nil)), body, sp)) in (let core = (Frontend_dRast.C_Expr_EApp ((Frontend_dRast.C_Expr_EVar ((Frontend_dRast_dName.C_RName_RGlobal ((fam).f_MutFamily_mutFamModule, (if pure then (fam).f_MutFamily_mutFamWithPureInternal else (fam).f_MutFamily_mutFamWithInternal))), sp)), ((B_dData_dList.v_append (B_dData_dList.C_List__x58__x58_ (nExpr, B_dData_dList.C_List_Nil))) ((B_dData_dList.v_append extraArgs) (B_dData_dList.C_List__x58__x58_ (lam, B_dData_dList.C_List_Nil)))), sp)) in (if pure then (Frontend_dRast.C_Expr_EApp ((Frontend_dRast.C_Expr_EVar ((Frontend_dRast_dName.C_RName_RGlobal ("Base.Effect.Core", "runPure")), sp)), (B_dData_dList.C_List__x58__x58_ ((Frontend_dRast.C_Expr_EApp ((Frontend_dRast.C_Expr_EVar ((Frontend_dRast_dName.C_RName_RGlobal ("Base.Effect.Core", "dropEffHead")), sp)), (B_dData_dList.C_List__x58__x58_ (core, B_dData_dList.C_List_Nil)), sp)), B_dData_dList.C_List_Nil)), sp)) else (Frontend_dRast.C_Expr_EApp ((Frontend_dRast.C_Expr_EVar ((Frontend_dRast_dName.C_RName_RGlobal ("Base.Effect.Core", "dropEffHead")), sp)), (B_dData_dList.C_List__x58__x58_ (core, B_dData_dList.C_List_Nil)), sp))))))

# 435 "Vuna/Compiler/Elab/Mut.vuna"
let v_stringLitOf = (fun (mc0 : Frontend_dRast.t_Expr) -> (match mc0 with
  | Frontend_dRast.C_Expr_EStr (dtb__105, dtb__106) -> (B_dData_dMaybe.C_Maybe_Just (dtb__105))
  | _ -> B_dData_dMaybe.C_Maybe_Nothing
))
