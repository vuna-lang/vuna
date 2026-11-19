open Vuna_runtime
type t_UnboxedCand = { f_UnboxedCand_unboxedCandName : string; f_UnboxedCand_unboxedCandCtor : Elab_dTypes.t_DtCtor; f_UnboxedCand_unboxedCandIndex : int }

# 25 "Vuna/Compiler/Elab/Representation.vuna"
let v_unboxedCandName = (fun (mc0 : t_UnboxedCand) -> (match mc0 with
  | { f_UnboxedCand_unboxedCandName = dtb__0; f_UnboxedCand_unboxedCandCtor = dtb__1; f_UnboxedCand_unboxedCandIndex = dtb__2 } -> dtb__0
  | _ -> failwith "DT: impossible branch"
))

# 29 "Vuna/Compiler/Elab/Representation.vuna"
let v_unboxedCandCtor = (fun (mc0 : t_UnboxedCand) -> (match mc0 with
  | { f_UnboxedCand_unboxedCandName = dtb__3; f_UnboxedCand_unboxedCandCtor = dtb__4; f_UnboxedCand_unboxedCandIndex = dtb__5 } -> dtb__4
  | _ -> failwith "DT: impossible branch"
))

# 33 "Vuna/Compiler/Elab/Representation.vuna"
let v_unboxedCandIndex = (fun (mc0 : t_UnboxedCand) -> (match mc0 with
  | { f_UnboxedCand_unboxedCandName = dtb__6; f_UnboxedCand_unboxedCandCtor = dtb__7; f_UnboxedCand_unboxedCandIndex = dtb__8 } -> dtb__8
  | _ -> failwith "DT: impossible branch"
))

# 38 "Vuna/Compiler/Elab/Representation.vuna"
let v_ctorKeepFlags = (fun (c : Elab_dTypes.t_DtCtor) -> ((B_dData_dList.v_map (fun (b : (string, Core_dTerm.t_Rig) B_dData_dPair.t_Pair) -> (B_dData_dBool.v_not (Core_dTerm.v_rigIsErased (B_dData_dPair.v_secondOf b))))) (Elab_dTypes.v_dtCtorTelescope c)))

# 46 "Vuna/Compiler/Elab/Representation.vuna"
let rec v_keptIndicesGo = (fun (mc0 : bool B_dData_dList.t_List) (mc1 : int) -> (match mc0 with
  | B_dData_dList.C_List__x58__x58_ (dtb__9, dtb__10) -> (if dtb__9 then (B_dData_dList.C_List__x58__x58_ (mc1, ((v_keptIndicesGo dtb__10) (mc1 + 1)))) else ((v_keptIndicesGo dtb__10) (mc1 + 1)))
  | B_dData_dList.C_List_Nil -> B_dData_dList.C_List_Nil
  | _ -> failwith "DT: impossible branch"
))

# 42 "Vuna/Compiler/Elab/Representation.vuna"
let v_keptIndices = (fun (flags : bool B_dData_dList.t_List) -> ((v_keptIndicesGo flags) 0))

# 52 "Vuna/Compiler/Elab/Representation.vuna"
let v_isSpecialUnboxFamily = (fun (name : string) -> (if (Base_dIntrinsics.v_isUnboxedCanonical name) then true else (Base_dIntrinsics.v_isTypeConstructorName name)))

# 57 "Vuna/Compiler/Elab/Representation.vuna"
let rec v_findDtData = (fun (mc0 : string) (mc1 : Elab_dTypes.t_DtData B_dData_dList.t_List) -> (match mc1 with
  | B_dData_dList.C_List__x58__x58_ (dtb__11, dtb__12) -> (if ((Elab_dTypes.v_dtDataName dtb__11) = mc0) then (B_dData_dMaybe.C_Maybe_Just (dtb__11)) else ((v_findDtData mc0) dtb__12))
  | B_dData_dList.C_List_Nil -> B_dData_dMaybe.C_Maybe_Nothing
  | _ -> failwith "DT: impossible branch"
))

# 62 "Vuna/Compiler/Elab/Representation.vuna"
let v_knownTypeHead = (fun (datas : Elab_dTypes.t_DtData B_dData_dList.t_List) (g : string) -> (if (if (if (if (g = Base_dIntrinsics.v_intTypeName) then true else (g = Base_dIntrinsics.v_strTypeName)) then true else (Base_dIntrinsics.v_isUnboxedCanonical g)) then true else (Base_dIntrinsics.v_isTypeConstructorName g)) then true else (match ((v_findDtData g) datas) with
  | B_dData_dMaybe.C_Maybe_Just (dtb__13) -> true
  | B_dData_dMaybe.C_Maybe_Nothing -> false
  | _ -> failwith "DT: impossible branch"
)))

# 83 "Vuna/Compiler/Elab/Representation.vuna"
let rec v_termAppHeadRepresentable = (fun (mc0 : Elab_dTypes.t_DtData B_dData_dList.t_List) (mc1 : Core_dTerm.t_Term) -> (match mc1 with
  | Core_dTerm.C_Term_TApp (dtb__14, dtb__15, dtb__16) -> ((v_termAppHeadRepresentable mc0) dtb__14)
  | Core_dTerm.C_Term_TGlobal (dtb__17) -> ((v_knownTypeHead mc0) dtb__17)
  | _ -> false
))

# 72 "Vuna/Compiler/Elab/Representation.vuna"
let rec v_termRepresentable = (fun (mc0 : Elab_dTypes.t_DtData B_dData_dList.t_List) (mc1 : Core_dTerm.t_Term) -> (match mc1 with
  | Core_dTerm.C_Term_TVar (dtb__18, dtb__19, dtb__20) -> true
  | Core_dTerm.C_Term_TRecord (dtb__21, dtb__22) -> ((v_knownTypeHead mc0) dtb__21)
  | Core_dTerm.C_Term_TGlobal (dtb__23) -> ((v_knownTypeHead mc0) dtb__23)
  | Core_dTerm.C_Term_TApp (dtb__24, dtb__25, dtb__26) -> ((v_termAppHeadRepresentable mc0) dtb__24)
  | Core_dTerm.C_Term_TPi (dtb__27, dtb__28, dtb__29, dtb__30, dtb__31) -> (if ((v_termRepresentable mc0) dtb__30) then ((v_termRepresentable mc0) dtb__31) else false)
  | _ -> false
))

# 94 "Vuna/Compiler/Elab/Representation.vuna"
let rec v_ctorFieldDomainTermGo = (fun (fuel : int) (i : int) (t : Core_dTerm.t_Term) -> (if (fuel <= 0) then B_dData_dMaybe.C_Maybe_Nothing else (match t with
  | Core_dTerm.C_Term_TPi (dtb__32, dtb__33, dtb__34, dtb__35, dtb__36) -> (if (i <= 0) then (B_dData_dMaybe.C_Maybe_Just (dtb__35)) else (((v_ctorFieldDomainTermGo (fuel - 1)) (i - 1)) dtb__36))
  | _ -> B_dData_dMaybe.C_Maybe_Nothing
)))

# 90 "Vuna/Compiler/Elab/Representation.vuna"
let v_ctorFieldDomainTerm = (fun (c : Elab_dTypes.t_DtCtor) (i : int) -> (((v_ctorFieldDomainTermGo 512) i) (Elab_dTypes.v_dtCtorType c)))

# 150 "Vuna/Compiler/Elab/Representation.vuna"
let rec v_substFamArgsGo = (fun (mc0 : int) (mc1 : int) (mc2 : Core_dTerm.t_Term B_dData_dList.t_List) (mc3 : Core_dTerm.t_Term) -> (match mc2 with
  | B_dData_dList.C_List__x58__x58_ (dtb__37, dtb__38) -> ((((v_substFamArgsGo mc0) (mc1 + 1)) dtb__38) (((Core_dTerm.v_substVarAt ((mc0 - 1) - mc1)) dtb__37) mc3))
  | B_dData_dList.C_List_Nil -> mc3
  | _ -> failwith "DT: impossible branch"
))

# 147 "Vuna/Compiler/Elab/Representation.vuna"
let v_substFamArgs = (fun (i : int) (args : Core_dTerm.t_Term B_dData_dList.t_List) (dom : Core_dTerm.t_Term) -> ((((v_substFamArgsGo i) 0) args) dom))

# 109 "Vuna/Compiler/Elab/Representation.vuna"
let rec v_termIsFunctionFuel = (fun (fuel : int) (datas : Elab_dTypes.t_DtData B_dData_dList.t_List) (seen : string B_dData_dList.t_List) (t : Core_dTerm.t_Term) -> (if (fuel <= 0) then true else (match t with
  | Core_dTerm.C_Term_TPi (dtb__39, dtb__40, dtb__41, dtb__42, dtb__43) -> true
  | _ -> ((fun p -> (match (B_dData_dPair.v_firstOf p) with
  | Core_dTerm.C_Term_TGlobal (dtb__44) -> (((((v_termIsFunctionHead fuel) datas) seen) dtb__44) ((B_dData_dList.v_map B_dData_dPair.v_firstOf) (B_dData_dPair.v_secondOf p)))
  | _ -> false
)) (Core_dTerm.v_flattenTermApp t))
)))
# 123 "Vuna/Compiler/Elab/Representation.vuna"
and v_termIsFunctionHead = (fun (fuel : int) (datas : Elab_dTypes.t_DtData B_dData_dList.t_List) (seen : string B_dData_dList.t_List) (g : string) (args : Core_dTerm.t_Term B_dData_dList.t_List) -> (if ((B_dData_dList.v_memName g) seen) then false else (match ((v_findDtData g) datas) with
  | B_dData_dMaybe.C_Maybe_Nothing -> false
  | B_dData_dMaybe.C_Maybe_Just (dtb__45) -> ((fun nd_uscrut7 -> (match nd_uscrut7 with
  | B_dData_dList.C_List__x58__x58_ (dtb__46, dtb__47) -> (match dtb__47 with
  | B_dData_dList.C_List_Nil -> ((fun nd_uscrut12 -> (match nd_uscrut12 with
  | B_dData_dList.C_List__x58__x58_ (dtb__48, dtb__49) -> (match dtb__49 with
  | B_dData_dList.C_List_Nil -> (if (dtb__48 < (B_dData_dList.v_length (dtb__45).Elab_dTypes.f_DtData_dtDataParams)) then false else (if ((B_dData_dList.v_length args) <> (B_dData_dList.v_length (dtb__45).Elab_dTypes.f_DtData_dtDataParams)) then true else (match ((v_ctorFieldDomainTerm dtb__46) dtb__48) with
  | B_dData_dMaybe.C_Maybe_Nothing -> true
  | B_dData_dMaybe.C_Maybe_Just (dtb__50) -> ((((v_termIsFunctionFuel (fuel - 1)) datas) (B_dData_dList.C_List__x58__x58_ (g, seen))) (((v_substFamArgs dtb__48) args) dtb__50))
  | _ -> failwith "DT: impossible branch"
)))
  | _ -> false
)
  | _ -> false
)) (v_keptIndices (v_ctorKeepFlags dtb__46)))
  | _ -> false
)
  | _ -> false
)) (Elab_dTypes.v_dtDataCtors dtb__45))
  | _ -> failwith "DT: impossible branch"
)))

# 106 "Vuna/Compiler/Elab/Representation.vuna"
let v_termIsFunction = (fun (datas : Elab_dTypes.t_DtData B_dData_dList.t_List) (t : Core_dTerm.t_Term) -> ((((v_termIsFunctionFuel 64) datas) B_dData_dList.C_List_Nil) t))

# 160 "Vuna/Compiler/Elab/Representation.vuna"
let v_reprIsBoxed = (fun (mc0 : Frontend_dAst.t_ReprTier) -> (match mc0 with
  | Frontend_dAst.C_ReprTier_ReprBoxed -> true
  | _ -> false
))

# 168 "Vuna/Compiler/Elab/Representation.vuna"
let v_unboxedCandidateOfData = (fun (datas : Elab_dTypes.t_DtData B_dData_dList.t_List) (d : Elab_dTypes.t_DtData) -> (if (B_dData_dBool.v_not (Elab_dTypes.v_dtDataIsRecord d)) then B_dData_dList.C_List_Nil else (if (v_isSpecialUnboxFamily (Elab_dTypes.v_dtDataName d)) then B_dData_dList.C_List_Nil else (if (v_reprIsBoxed (Elab_dTypes.v_dtDataRepr d)) then B_dData_dList.C_List_Nil else (match (Elab_dTypes.v_dtDataCtors d) with
  | B_dData_dList.C_List_Nil -> B_dData_dList.C_List_Nil
  | B_dData_dList.C_List__x58__x58_ (dtb__51, dtb__52) -> (match dtb__52 with
  | B_dData_dList.C_List_Nil -> (match (v_keptIndices (v_ctorKeepFlags dtb__51)) with
  | B_dData_dList.C_List_Nil -> B_dData_dList.C_List_Nil
  | B_dData_dList.C_List__x58__x58_ (dtb__53, dtb__54) -> (match dtb__54 with
  | B_dData_dList.C_List_Nil -> (if (dtb__53 >= (B_dData_dList.v_length (d).Elab_dTypes.f_DtData_dtDataParams)) then (match ((v_ctorFieldDomainTerm dtb__51) dtb__53) with
  | B_dData_dMaybe.C_Maybe_Just (dtb__55) -> (if ((v_termIsFunction datas) dtb__55) then B_dData_dList.C_List_Nil else (if ((v_termRepresentable datas) dtb__55) then (B_dData_dList.C_List__x58__x58_ ({ f_UnboxedCand_unboxedCandName = (Elab_dTypes.v_dtDataName d); f_UnboxedCand_unboxedCandCtor = dtb__51; f_UnboxedCand_unboxedCandIndex = dtb__53 }, B_dData_dList.C_List_Nil)) else B_dData_dList.C_List_Nil))
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

# 197 "Vuna/Compiler/Elab/Representation.vuna"
let v_unboxedCandidates = (fun (datas : Elab_dTypes.t_DtData B_dData_dList.t_List) -> ((B_dData_dList.v_concatMap (v_unboxedCandidateOfData datas)) datas))

# 201 "Vuna/Compiler/Elab/Representation.vuna"
let v_candidateNames = (fun (cands : t_UnboxedCand B_dData_dList.t_List) -> ((B_dData_dList.v_map v_unboxedCandName) cands))

# 210 "Vuna/Compiler/Elab/Representation.vuna"
let v_candidateRefs = (fun (datas : Elab_dTypes.t_DtData B_dData_dList.t_List) (names : string B_dData_dList.t_List) (cand : t_UnboxedCand) -> (match ((v_ctorFieldDomainTerm (v_unboxedCandCtor cand)) (v_unboxedCandIndex cand)) with
  | B_dData_dMaybe.C_Maybe_Just (dtb__56) -> ((B_dData_dList.v_filter (fun (n : string) -> ((B_dData_dList.v_memName n) names))) (Core_dTerm.v_termGlobalNames dtb__56))
  | B_dData_dMaybe.C_Maybe_Nothing -> B_dData_dList.C_List_Nil
  | _ -> failwith "DT: impossible branch"
))

# 205 "Vuna/Compiler/Elab/Representation.vuna"
let v_candidateEdges = (fun (datas : Elab_dTypes.t_DtData B_dData_dList.t_List) (names : string B_dData_dList.t_List) (cands : t_UnboxedCand B_dData_dList.t_List) -> ((B_dData_dList.v_map (fun (cand : t_UnboxedCand) -> { B_dData_dPair.f_Pair_first = (v_unboxedCandName cand); B_dData_dPair.f_Pair_second = (((v_candidateRefs datas) names) cand) })) cands))

# 217 "Vuna/Compiler/Elab/Representation.vuna"
let rec v_lookupNeighbors = (fun (mc0 : string) (mc1 : (string, string B_dData_dList.t_List) B_dData_dPair.t_Pair B_dData_dList.t_List) -> (match mc1 with
  | B_dData_dList.C_List__x58__x58_ (dtb__57, dtb__58) -> (if ((B_dData_dPair.v_firstOf dtb__57) = mc0) then (B_dData_dPair.v_secondOf dtb__57) else ((v_lookupNeighbors mc0) dtb__58))
  | B_dData_dList.C_List_Nil -> B_dData_dList.C_List_Nil
  | _ -> failwith "DT: impossible branch"
))

# 223 "Vuna/Compiler/Elab/Representation.vuna"
let rec v_reachesBackTo = (fun (fuel : int) (edges : (string, string B_dData_dList.t_List) B_dData_dPair.t_Pair B_dData_dList.t_List) (visited : string B_dData_dList.t_List) (target : string) (node : string) -> (if (fuel <= 0) then true else (((((v_anyReachBack (fuel - 1)) edges) visited) target) ((v_lookupNeighbors node) edges))))
# 231 "Vuna/Compiler/Elab/Representation.vuna"
and v_anyReachBack = (fun (mc0 : int) (mc1 : (string, string B_dData_dList.t_List) B_dData_dPair.t_Pair B_dData_dList.t_List) (mc2 : string B_dData_dList.t_List) (mc3 : string) (mc4 : string B_dData_dList.t_List) -> (match mc4 with
  | B_dData_dList.C_List__x58__x58_ (dtb__59, dtb__60) -> (if (dtb__59 = mc3) then true else (if ((B_dData_dList.v_memName dtb__59) mc2) then (((((v_anyReachBack mc0) mc1) mc2) mc3) dtb__60) else (if (mc0 <= 0) then true else (if (((((v_reachesBackTo (mc0 - 1)) mc1) (B_dData_dList.C_List__x58__x58_ (dtb__59, mc2))) mc3) dtb__59) then true else (((((v_anyReachBack (mc0 - 1)) mc1) mc2) mc3) dtb__60)))))
  | B_dData_dList.C_List_Nil -> false
  | _ -> failwith "DT: impossible branch"
))

# 246 "Vuna/Compiler/Elab/Representation.vuna"
let v_unboxedInfoOf = (fun (datas : Elab_dTypes.t_DtData B_dData_dList.t_List) -> ((fun cands -> ((fun names -> ((fun edges -> ((fun fuel -> ((B_dData_dList.v_map (fun (cand : t_UnboxedCand) -> { B_dData_dPair.f_Pair_first = (v_unboxedCandName cand); B_dData_dPair.f_Pair_second = { B_dData_dPair.f_Pair_first = (v_unboxedCandCtor cand); B_dData_dPair.f_Pair_second = (v_unboxedCandIndex cand) } })) ((B_dData_dList.v_filter (fun (cand : t_UnboxedCand) -> (B_dData_dBool.v_not (((((v_reachesBackTo fuel) edges) (B_dData_dList.C_List__x58__x58_ ((v_unboxedCandName cand), B_dData_dList.C_List_Nil))) (v_unboxedCandName cand)) (v_unboxedCandName cand))))) cands))) (bi_natAdd (B_dData_dList.v_length names) 2))) (((v_candidateEdges datas) names) cands))) (v_candidateNames cands))) (v_unboxedCandidates datas)))

# 258 "Vuna/Compiler/Elab/Representation.vuna"
let v_unboxedFamilySet = (fun (datas : Elab_dTypes.t_DtData B_dData_dList.t_List) -> ((B_dData_dList.v_map B_dData_dPair.v_firstOf) (v_unboxedInfoOf datas)))

# 262 "Vuna/Compiler/Elab/Representation.vuna"
let rec v_lookupUnboxedInfo = (fun (mc0 : string) (mc1 : (string, (Elab_dTypes.t_DtCtor, int) B_dData_dPair.t_Pair) B_dData_dPair.t_Pair B_dData_dList.t_List) -> (match mc1 with
  | B_dData_dList.C_List__x58__x58_ (dtb__61, dtb__62) -> (if ((B_dData_dPair.v_firstOf dtb__61) = mc0) then (B_dData_dMaybe.C_Maybe_Just ((B_dData_dPair.v_secondOf dtb__61))) else ((v_lookupUnboxedInfo mc0) dtb__62))
  | B_dData_dList.C_List_Nil -> B_dData_dMaybe.C_Maybe_Nothing
  | _ -> failwith "DT: impossible branch"
))
