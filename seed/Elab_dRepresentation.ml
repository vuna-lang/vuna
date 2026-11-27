open Vuna_runtime
type t_UnboxedCand = { f_UnboxedCand_unboxedCandName : string; f_UnboxedCand_unboxedCandCtor : Elab_dTypes.t_DtCtor; f_UnboxedCand_unboxedCandIndex : int }

# 26 "Vuna/Compiler/Elab/Representation.vuna"
let v_ctorKeepFlags = (fun (c : Elab_dTypes.t_DtCtor) -> ((B_dData_dList.v_map (fun (b : (string, Core_dTerm.t_Rig) B_dData_dPair.t_Pair) -> (B_dData_dBool.v_not (Core_dTerm.v_rigIsErased (B_dData_dPair.v_secondOf b))))) (Elab_dTypes.v_dtCtorTelescope c)))

# 34 "Vuna/Compiler/Elab/Representation.vuna"
let[@tail_mod_cons] rec v_keptIndicesGo = (fun (mc0 : bool B_dData_dList.t_List) (mc1 : int) -> (match mc0 with
  | B_dData_dList.C_List__x58__x58_ (dtb__0, dtb__1) -> (if dtb__0 then (B_dData_dList.C_List__x58__x58_ (mc1, ((v_keptIndicesGo dtb__1) (mc1 + 1)))) else ((v_keptIndicesGo dtb__1) (mc1 + 1)))
  | B_dData_dList.C_List_Nil -> B_dData_dList.C_List_Nil
  | _ -> failwith "DT: impossible branch"
))

# 30 "Vuna/Compiler/Elab/Representation.vuna"
let v_keptIndices = (fun (flags : bool B_dData_dList.t_List) -> ((v_keptIndicesGo flags) 0))

# 40 "Vuna/Compiler/Elab/Representation.vuna"
let v_isSpecialUnboxFamily = (fun (name : string) -> (if (Base_dIntrinsics.v_isUnboxedCanonical name) then true else (Base_dIntrinsics.v_isTypeConstructorName name)))

# 45 "Vuna/Compiler/Elab/Representation.vuna"
let rec v_findDtData = (fun (mc0 : string) (mc1 : Elab_dTypes.t_DtData B_dData_dList.t_List) -> (match mc1 with
  | B_dData_dList.C_List__x58__x58_ (dtb__2, dtb__3) -> (if ((Elab_dTypes.v_dtDataName dtb__2) = mc0) then (B_dData_dMaybe.C_Maybe_Just (dtb__2)) else ((v_findDtData mc0) dtb__3))
  | B_dData_dList.C_List_Nil -> B_dData_dMaybe.C_Maybe_Nothing
  | _ -> failwith "DT: impossible branch"
))

# 50 "Vuna/Compiler/Elab/Representation.vuna"
let v_knownTypeHead = (fun (datas : Elab_dTypes.t_DtData B_dData_dList.t_List) (g : string) -> (if (if (if (if (g = Base_dIntrinsics.v_intTypeName) then true else (g = Base_dIntrinsics.v_strTypeName)) then true else (Base_dIntrinsics.v_isUnboxedCanonical g)) then true else (Base_dIntrinsics.v_isTypeConstructorName g)) then true else (match ((v_findDtData g) datas) with
  | B_dData_dMaybe.C_Maybe_Just (dtb__4) -> true
  | B_dData_dMaybe.C_Maybe_Nothing -> false
  | _ -> failwith "DT: impossible branch"
)))

# 71 "Vuna/Compiler/Elab/Representation.vuna"
let rec v_termAppHeadRepresentable = (fun (mc0 : Elab_dTypes.t_DtData B_dData_dList.t_List) (mc1 : Core_dTerm.t_Term) -> (match mc1 with
  | Core_dTerm.C_Term_TApp (dtb__5, dtb__6, dtb__7) -> ((v_termAppHeadRepresentable mc0) dtb__5)
  | Core_dTerm.C_Term_TGlobal (dtb__8) -> ((v_knownTypeHead mc0) dtb__8)
  | _ -> false
))

# 60 "Vuna/Compiler/Elab/Representation.vuna"
let rec v_termRepresentable = (fun (mc0 : Elab_dTypes.t_DtData B_dData_dList.t_List) (mc1 : Core_dTerm.t_Term) -> (match mc1 with
  | Core_dTerm.C_Term_TVar (dtb__9, dtb__10, dtb__11) -> true
  | Core_dTerm.C_Term_TRecord (dtb__12, dtb__13) -> ((v_knownTypeHead mc0) dtb__12)
  | Core_dTerm.C_Term_TGlobal (dtb__14) -> ((v_knownTypeHead mc0) dtb__14)
  | Core_dTerm.C_Term_TApp (dtb__15, dtb__16, dtb__17) -> ((v_termAppHeadRepresentable mc0) dtb__15)
  | Core_dTerm.C_Term_TPi (dtb__18, dtb__19, dtb__20, dtb__21, dtb__22) -> (if ((v_termRepresentable mc0) dtb__21) then ((v_termRepresentable mc0) dtb__22) else false)
  | _ -> false
))

# 82 "Vuna/Compiler/Elab/Representation.vuna"
let rec v_ctorFieldDomainTermGo = (fun (fuel : int) (i : int) (t : Core_dTerm.t_Term) -> (if (fuel <= 0) then B_dData_dMaybe.C_Maybe_Nothing else (match t with
  | Core_dTerm.C_Term_TPi (dtb__23, dtb__24, dtb__25, dtb__26, dtb__27) -> (if (i <= 0) then (B_dData_dMaybe.C_Maybe_Just (dtb__26)) else (((v_ctorFieldDomainTermGo (fuel - 1)) (i - 1)) dtb__27))
  | _ -> B_dData_dMaybe.C_Maybe_Nothing
)))

# 78 "Vuna/Compiler/Elab/Representation.vuna"
let v_ctorFieldDomainTerm = (fun (c : Elab_dTypes.t_DtCtor) (i : int) -> (((v_ctorFieldDomainTermGo 512) i) (Elab_dTypes.v_dtCtorType c)))

# 138 "Vuna/Compiler/Elab/Representation.vuna"
let rec v_substFamArgsGo = (fun (mc0 : int) (mc1 : int) (mc2 : Core_dTerm.t_Term B_dData_dList.t_List) (mc3 : Core_dTerm.t_Term) -> (match mc2 with
  | B_dData_dList.C_List__x58__x58_ (dtb__28, dtb__29) -> ((((v_substFamArgsGo mc0) (mc1 + 1)) dtb__29) (((Core_dTerm.v_substVarAt ((mc0 - 1) - mc1)) dtb__28) mc3))
  | B_dData_dList.C_List_Nil -> mc3
  | _ -> failwith "DT: impossible branch"
))

# 135 "Vuna/Compiler/Elab/Representation.vuna"
let v_substFamArgs = (fun (i : int) (args : Core_dTerm.t_Term B_dData_dList.t_List) (dom : Core_dTerm.t_Term) -> ((((v_substFamArgsGo i) 0) args) dom))

# 97 "Vuna/Compiler/Elab/Representation.vuna"
let rec v_termIsFunctionFuel = (fun (fuel : int) (datas : Elab_dTypes.t_DtData B_dData_dList.t_List) (seen : string B_dData_dList.t_List) (t : Core_dTerm.t_Term) -> (if (fuel <= 0) then true else (match t with
  | Core_dTerm.C_Term_TPi (dtb__30, dtb__31, dtb__32, dtb__33, dtb__34) -> true
  | _ -> (let p = (Core_dTerm.v_flattenTermApp t) in (match (B_dData_dPair.v_firstOf p) with
  | Core_dTerm.C_Term_TGlobal (dtb__35) -> (((((v_termIsFunctionHead fuel) datas) seen) dtb__35) ((B_dData_dList.v_map B_dData_dPair.v_firstOf) (B_dData_dPair.v_secondOf p)))
  | _ -> false
))
)))
# 111 "Vuna/Compiler/Elab/Representation.vuna"
and v_termIsFunctionHead = (fun (fuel : int) (datas : Elab_dTypes.t_DtData B_dData_dList.t_List) (seen : string B_dData_dList.t_List) (g : string) (args : Core_dTerm.t_Term B_dData_dList.t_List) -> (if ((B_dData_dList.v_memName g) seen) then false else (match ((v_findDtData g) datas) with
  | B_dData_dMaybe.C_Maybe_Nothing -> false
  | B_dData_dMaybe.C_Maybe_Just (dtb__36) -> (let nd_uscrut7 = (Elab_dTypes.v_dtDataCtors dtb__36) in (match nd_uscrut7 with
  | B_dData_dList.C_List__x58__x58_ (dtb__37, dtb__38) -> (match dtb__38 with
  | B_dData_dList.C_List_Nil -> (let nd_uscrut12 = (v_keptIndices (v_ctorKeepFlags dtb__37)) in (match nd_uscrut12 with
  | B_dData_dList.C_List__x58__x58_ (dtb__39, dtb__40) -> (match dtb__40 with
  | B_dData_dList.C_List_Nil -> (if (dtb__39 < (B_dData_dList.v_length (dtb__36).Elab_dTypes.f_DtData_dtDataParams)) then false else (if ((B_dData_dList.v_length args) <> (B_dData_dList.v_length (dtb__36).Elab_dTypes.f_DtData_dtDataParams)) then true else (match ((v_ctorFieldDomainTerm dtb__37) dtb__39) with
  | B_dData_dMaybe.C_Maybe_Nothing -> true
  | B_dData_dMaybe.C_Maybe_Just (dtb__41) -> ((((v_termIsFunctionFuel (fuel - 1)) datas) (B_dData_dList.C_List__x58__x58_ (g, seen))) (((v_substFamArgs dtb__39) args) dtb__41))
  | _ -> failwith "DT: impossible branch"
)))
  | _ -> false
)
  | _ -> false
))
  | _ -> false
)
  | _ -> false
))
  | _ -> failwith "DT: impossible branch"
)))

# 94 "Vuna/Compiler/Elab/Representation.vuna"
let v_termIsFunction = (fun (datas : Elab_dTypes.t_DtData B_dData_dList.t_List) (t : Core_dTerm.t_Term) -> ((((v_termIsFunctionFuel 64) datas) B_dData_dList.C_List_Nil) t))

# 148 "Vuna/Compiler/Elab/Representation.vuna"
let v_reprIsBoxed = (fun (mc0 : Frontend_dAst.t_ReprTier) -> (match mc0 with
  | Frontend_dAst.C_ReprTier_ReprBoxed -> true
  | _ -> false
))

# 156 "Vuna/Compiler/Elab/Representation.vuna"
let v_unboxedCandidateOfData = (fun (datas : Elab_dTypes.t_DtData B_dData_dList.t_List) (d : Elab_dTypes.t_DtData) -> (if (B_dData_dBool.v_not (Elab_dTypes.v_dtDataIsRecord d)) then B_dData_dList.C_List_Nil else (if (v_isSpecialUnboxFamily (Elab_dTypes.v_dtDataName d)) then B_dData_dList.C_List_Nil else (if (v_reprIsBoxed (Elab_dTypes.v_dtDataRepr d)) then B_dData_dList.C_List_Nil else (match (Elab_dTypes.v_dtDataCtors d) with
  | B_dData_dList.C_List_Nil -> B_dData_dList.C_List_Nil
  | B_dData_dList.C_List__x58__x58_ (dtb__42, dtb__43) -> (match dtb__43 with
  | B_dData_dList.C_List_Nil -> (match (v_keptIndices (v_ctorKeepFlags dtb__42)) with
  | B_dData_dList.C_List_Nil -> B_dData_dList.C_List_Nil
  | B_dData_dList.C_List__x58__x58_ (dtb__44, dtb__45) -> (match dtb__45 with
  | B_dData_dList.C_List_Nil -> (if (dtb__44 >= (B_dData_dList.v_length (d).Elab_dTypes.f_DtData_dtDataParams)) then (match ((v_ctorFieldDomainTerm dtb__42) dtb__44) with
  | B_dData_dMaybe.C_Maybe_Just (dtb__46) -> (if ((v_termIsFunction datas) dtb__46) then B_dData_dList.C_List_Nil else (if ((v_termRepresentable datas) dtb__46) then (B_dData_dList.C_List__x58__x58_ ({ f_UnboxedCand_unboxedCandName = (Elab_dTypes.v_dtDataName d); f_UnboxedCand_unboxedCandCtor = dtb__42; f_UnboxedCand_unboxedCandIndex = dtb__44 }, B_dData_dList.C_List_Nil)) else B_dData_dList.C_List_Nil))
  | B_dData_dMaybe.C_Maybe_Nothing -> B_dData_dList.C_List_Nil
  | _ -> failwith "DT: impossible branch"
) else B_dData_dList.C_List_Nil)
  | _ -> B_dData_dList.C_List_Nil
)
  | _ -> failwith "DT: impossible branch"
)
  | _ -> B_dData_dList.C_List_Nil
)
  | _ -> failwith "DT: impossible branch"
)))))

# 185 "Vuna/Compiler/Elab/Representation.vuna"
let v_unboxedCandidates = (fun (datas : Elab_dTypes.t_DtData B_dData_dList.t_List) -> ((B_dData_dList.v_concatMap (v_unboxedCandidateOfData datas)) datas))

# 205 "Vuna/Compiler/Elab/Representation.vuna"
let rec v_lookupNeighbors = (fun (mc0 : string) (mc1 : (string, string B_dData_dList.t_List) B_dData_dPair.t_Pair B_dData_dList.t_List) -> (match mc1 with
  | B_dData_dList.C_List__x58__x58_ (dtb__47, dtb__48) -> (if ((B_dData_dPair.v_firstOf dtb__47) = mc0) then (B_dData_dPair.v_secondOf dtb__47) else ((v_lookupNeighbors mc0) dtb__48))
  | B_dData_dList.C_List_Nil -> B_dData_dList.C_List_Nil
  | _ -> failwith "DT: impossible branch"
))

# 211 "Vuna/Compiler/Elab/Representation.vuna"
let rec v_reachesBackTo = (fun (fuel : int) (edges : (string, string B_dData_dList.t_List) B_dData_dPair.t_Pair B_dData_dList.t_List) (visited : string B_dData_dList.t_List) (target : string) (node : string) -> (if (fuel <= 0) then true else (((((v_anyReachBack (fuel - 1)) edges) visited) target) ((v_lookupNeighbors node) edges))))
# 219 "Vuna/Compiler/Elab/Representation.vuna"
and v_anyReachBack = (fun (mc0 : int) (mc1 : (string, string B_dData_dList.t_List) B_dData_dPair.t_Pair B_dData_dList.t_List) (mc2 : string B_dData_dList.t_List) (mc3 : string) (mc4 : string B_dData_dList.t_List) -> (match mc4 with
  | B_dData_dList.C_List__x58__x58_ (dtb__49, dtb__50) -> (if (dtb__49 = mc3) then true else (if ((B_dData_dList.v_memName dtb__49) mc2) then (((((v_anyReachBack mc0) mc1) mc2) mc3) dtb__50) else (if (mc0 <= 0) then true else (if (((((v_reachesBackTo (mc0 - 1)) mc1) (B_dData_dList.C_List__x58__x58_ (dtb__49, mc2))) mc3) dtb__49) then true else (((((v_anyReachBack (mc0 - 1)) mc1) mc2) mc3) dtb__50)))))
  | B_dData_dList.C_List_Nil -> false
  | _ -> failwith "DT: impossible branch"
))

# 250 "Vuna/Compiler/Elab/Representation.vuna"
let rec v_lookupUnboxedInfo = (fun (mc0 : string) (mc1 : (string, (Elab_dTypes.t_DtCtor, int) B_dData_dPair.t_Pair) B_dData_dPair.t_Pair B_dData_dList.t_List) -> (match mc1 with
  | B_dData_dList.C_List__x58__x58_ (dtb__51, dtb__52) -> (if ((B_dData_dPair.v_firstOf dtb__51) = mc0) then (B_dData_dMaybe.C_Maybe_Just ((B_dData_dPair.v_secondOf dtb__51))) else ((v_lookupUnboxedInfo mc0) dtb__52))
  | B_dData_dList.C_List_Nil -> B_dData_dMaybe.C_Maybe_Nothing
  | _ -> failwith "DT: impossible branch"
))

# 19 "Vuna/Compiler/Elab/Representation.vuna"
let v_unboxedCandName = (fun (p : t_UnboxedCand) -> (match p with
  | { f_UnboxedCand_unboxedCandName = dtb__53; f_UnboxedCand_unboxedCandCtor = dtb__54; f_UnboxedCand_unboxedCandIndex = dtb__55 } -> dtb__53
  | _ -> failwith "DT: impossible branch"
))

# 189 "Vuna/Compiler/Elab/Representation.vuna"
let v_candidateNames = (fun (cands : t_UnboxedCand B_dData_dList.t_List) -> ((B_dData_dList.v_map v_unboxedCandName) cands))

# 20 "Vuna/Compiler/Elab/Representation.vuna"
let v_unboxedCandCtor = (fun (p : t_UnboxedCand) -> (match p with
  | { f_UnboxedCand_unboxedCandName = dtb__56; f_UnboxedCand_unboxedCandCtor = dtb__57; f_UnboxedCand_unboxedCandIndex = dtb__58 } -> dtb__57
  | _ -> failwith "DT: impossible branch"
))

# 21 "Vuna/Compiler/Elab/Representation.vuna"
let v_unboxedCandIndex = (fun (p : t_UnboxedCand) -> (match p with
  | { f_UnboxedCand_unboxedCandName = dtb__59; f_UnboxedCand_unboxedCandCtor = dtb__60; f_UnboxedCand_unboxedCandIndex = dtb__61 } -> dtb__61
  | _ -> failwith "DT: impossible branch"
))

# 198 "Vuna/Compiler/Elab/Representation.vuna"
let v_candidateRefs = (fun (datas : Elab_dTypes.t_DtData B_dData_dList.t_List) (names : string B_dData_dList.t_List) (cand : t_UnboxedCand) -> (match ((v_ctorFieldDomainTerm (v_unboxedCandCtor cand)) (v_unboxedCandIndex cand)) with
  | B_dData_dMaybe.C_Maybe_Just (dtb__62) -> ((B_dData_dList.v_filter (fun (n : string) -> ((B_dData_dList.v_memName n) names))) (Core_dTerm.v_termGlobalNames dtb__62))
  | B_dData_dMaybe.C_Maybe_Nothing -> B_dData_dList.C_List_Nil
  | _ -> failwith "DT: impossible branch"
))

# 193 "Vuna/Compiler/Elab/Representation.vuna"
let v_candidateEdges = (fun (datas : Elab_dTypes.t_DtData B_dData_dList.t_List) (names : string B_dData_dList.t_List) (cands : t_UnboxedCand B_dData_dList.t_List) -> ((B_dData_dList.v_map (fun (cand : t_UnboxedCand) -> { B_dData_dPair.f_Pair_first = (v_unboxedCandName cand); B_dData_dPair.f_Pair_second = (((v_candidateRefs datas) names) cand) })) cands))

# 234 "Vuna/Compiler/Elab/Representation.vuna"
let v_unboxedInfoOf = (fun (datas : Elab_dTypes.t_DtData B_dData_dList.t_List) -> (let cands = (v_unboxedCandidates datas) in (let names = (v_candidateNames cands) in (let edges = (((v_candidateEdges datas) names) cands) in (let fuel = (bi_natAdd (B_dData_dList.v_length names) 2) in ((B_dData_dList.v_map (fun (cand : t_UnboxedCand) -> { B_dData_dPair.f_Pair_first = (v_unboxedCandName cand); B_dData_dPair.f_Pair_second = { B_dData_dPair.f_Pair_first = (v_unboxedCandCtor cand); B_dData_dPair.f_Pair_second = (v_unboxedCandIndex cand) } })) ((B_dData_dList.v_filter (fun (cand : t_UnboxedCand) -> (B_dData_dBool.v_not (((((v_reachesBackTo fuel) edges) (B_dData_dList.C_List__x58__x58_ ((v_unboxedCandName cand), B_dData_dList.C_List_Nil))) (v_unboxedCandName cand)) (v_unboxedCandName cand))))) cands)))))))

# 246 "Vuna/Compiler/Elab/Representation.vuna"
let v_unboxedFamilySet = (fun (datas : Elab_dTypes.t_DtData B_dData_dList.t_List) -> ((B_dData_dList.v_map B_dData_dPair.v_firstOf) (v_unboxedInfoOf datas)))
