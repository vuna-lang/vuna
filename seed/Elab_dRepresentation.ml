open Vuna_runtime
type t_UnboxedCand = { f_UnboxedCand_unboxedCandName : string; f_UnboxedCand_unboxedCandCtor : Elab_dTypes.t_DtCtor; f_UnboxedCand_unboxedCandIndex : int }

# 26 "Vuna/Compiler/Elab/Representation.vuna"
let v_ctorKeepFlags = (fun (dtb_u_u1 : Elab_dTypes.t_DtCtor) -> ((B_dData_dList.v_map (fun (dtb_u_u2 : (string, Core_dTerm.t_Rig) B_dData_dPair.t_Pair) -> (B_dData_dBool.v_not (Core_dTerm.v_rigIsErased (B_dData_dPair.v_secondOf dtb_u_u2))))) (Elab_dTypes.v_dtCtorTelescope dtb_u_u1)))

# 34 "Vuna/Compiler/Elab/Representation.vuna"
let[@tail_mod_cons] rec v_keptIndicesGo = (fun (dtb_u_u3 : bool B_dData_dList.t_List) (dtb_u_u4 : int) -> (match dtb_u_u3 with
  | B_dData_dList.C_List__x58__x58_ (dtb_u_u5, dtb_u_u6) -> (if dtb_u_u5 then (B_dData_dList.C_List__x58__x58_ (dtb_u_u4, ((v_keptIndicesGo dtb_u_u6) (dtb_u_u4 + 1)))) else ((v_keptIndicesGo dtb_u_u6) (dtb_u_u4 + 1)))
  | B_dData_dList.C_List_Nil -> B_dData_dList.C_List_Nil
  | _ -> failwith "DT: impossible branch"
))

# 30 "Vuna/Compiler/Elab/Representation.vuna"
let v_keptIndices = (fun (dtb_u_u7 : bool B_dData_dList.t_List) -> ((v_keptIndicesGo dtb_u_u7) 0))

# 40 "Vuna/Compiler/Elab/Representation.vuna"
let v_isSpecialUnboxFamily = (fun (dtb_u_u8 : string) -> (if (Base_dIntrinsics.v_isUnboxedCanonical dtb_u_u8) then true else (Base_dIntrinsics.v_isTypeConstructorName dtb_u_u8)))

# 45 "Vuna/Compiler/Elab/Representation.vuna"
let rec v_findDtData = (fun (dtb_u_u9 : string) (dtb_u_u10 : Elab_dTypes.t_DtData B_dData_dList.t_List) -> (match dtb_u_u10 with
  | B_dData_dList.C_List__x58__x58_ (dtb_u_u11, dtb_u_u12) -> (if ((Elab_dTypes.v_dtDataName dtb_u_u11) = dtb_u_u9) then (B_dData_dMaybe.C_Maybe_Just (dtb_u_u11)) else ((v_findDtData dtb_u_u9) dtb_u_u12))
  | B_dData_dList.C_List_Nil -> B_dData_dMaybe.C_Maybe_Nothing
  | _ -> failwith "DT: impossible branch"
))

# 50 "Vuna/Compiler/Elab/Representation.vuna"
let v_knownTypeHead = (fun (dtb_u_u13 : Elab_dTypes.t_DtData B_dData_dList.t_List) (dtb_u_u14 : string) -> (if (if (if (if (dtb_u_u14 = Base_dIntrinsics.v_intTypeName) then true else (dtb_u_u14 = Base_dIntrinsics.v_strTypeName)) then true else (Base_dIntrinsics.v_isUnboxedCanonical dtb_u_u14)) then true else (Base_dIntrinsics.v_isTypeConstructorName dtb_u_u14)) then true else (match ((v_findDtData dtb_u_u14) dtb_u_u13) with
  | B_dData_dMaybe.C_Maybe_Just (dtb_u_u15) -> true
  | B_dData_dMaybe.C_Maybe_Nothing -> false
  | _ -> failwith "DT: impossible branch"
)))

# 71 "Vuna/Compiler/Elab/Representation.vuna"
let rec v_termAppHeadRepresentable = (fun (dtb_u_u16 : Elab_dTypes.t_DtData B_dData_dList.t_List) (dtb_u_u17 : Core_dTerm.t_Term) -> (match dtb_u_u17 with
  | Core_dTerm.C_Term_TApp (dtb_u_u18, dtb_u_u19, dtb_u_u20) -> ((v_termAppHeadRepresentable dtb_u_u16) dtb_u_u18)
  | Core_dTerm.C_Term_TGlobal (dtb_u_u21) -> ((v_knownTypeHead dtb_u_u16) dtb_u_u21)
  | _ -> false
))

# 60 "Vuna/Compiler/Elab/Representation.vuna"
let rec v_termRepresentable = (fun (dtb_u_u22 : Elab_dTypes.t_DtData B_dData_dList.t_List) (dtb_u_u23 : Core_dTerm.t_Term) -> (match dtb_u_u23 with
  | Core_dTerm.C_Term_TVar (dtb_u_u24, dtb_u_u25, dtb_u_u26) -> true
  | Core_dTerm.C_Term_TRecord (dtb_u_u27, dtb_u_u28) -> ((v_knownTypeHead dtb_u_u22) dtb_u_u27)
  | Core_dTerm.C_Term_TGlobal (dtb_u_u29) -> ((v_knownTypeHead dtb_u_u22) dtb_u_u29)
  | Core_dTerm.C_Term_TApp (dtb_u_u30, dtb_u_u31, dtb_u_u32) -> ((v_termAppHeadRepresentable dtb_u_u22) dtb_u_u30)
  | Core_dTerm.C_Term_TPi (dtb_u_u33, dtb_u_u34, dtb_u_u35, dtb_u_u36, dtb_u_u37) -> (if ((v_termRepresentable dtb_u_u22) dtb_u_u36) then ((v_termRepresentable dtb_u_u22) dtb_u_u37) else false)
  | _ -> false
))

# 82 "Vuna/Compiler/Elab/Representation.vuna"
let rec v_ctorFieldDomainTermGo = (fun (dtb_u_u38 : int) (dtb_u_u39 : int) (dtb_u_u40 : Core_dTerm.t_Term) -> (if (dtb_u_u38 <= 0) then B_dData_dMaybe.C_Maybe_Nothing else (match dtb_u_u40 with
  | Core_dTerm.C_Term_TPi (dtb_u_u41, dtb_u_u42, dtb_u_u43, dtb_u_u44, dtb_u_u45) -> (if (dtb_u_u39 <= 0) then (B_dData_dMaybe.C_Maybe_Just (dtb_u_u44)) else (((v_ctorFieldDomainTermGo (dtb_u_u38 - 1)) (dtb_u_u39 - 1)) dtb_u_u45))
  | _ -> B_dData_dMaybe.C_Maybe_Nothing
)))

# 78 "Vuna/Compiler/Elab/Representation.vuna"
let v_ctorFieldDomainTerm = (fun (dtb_u_u46 : Elab_dTypes.t_DtCtor) (dtb_u_u47 : int) -> (((v_ctorFieldDomainTermGo 512) dtb_u_u47) (Elab_dTypes.v_dtCtorType dtb_u_u46)))

# 138 "Vuna/Compiler/Elab/Representation.vuna"
let rec v_substFamArgsGo = (fun (dtb_u_u48 : int) (dtb_u_u49 : int) (dtb_u_u50 : Core_dTerm.t_Term B_dData_dList.t_List) (dtb_u_u51 : Core_dTerm.t_Term) -> (match dtb_u_u50 with
  | B_dData_dList.C_List__x58__x58_ (dtb_u_u52, dtb_u_u53) -> ((((v_substFamArgsGo dtb_u_u48) (dtb_u_u49 + 1)) dtb_u_u53) (((Core_dTerm.v_substVarAt ((dtb_u_u48 - 1) - dtb_u_u49)) dtb_u_u52) dtb_u_u51))
  | B_dData_dList.C_List_Nil -> dtb_u_u51
  | _ -> failwith "DT: impossible branch"
))

# 135 "Vuna/Compiler/Elab/Representation.vuna"
let v_substFamArgs = (fun (dtb_u_u54 : int) (dtb_u_u55 : Core_dTerm.t_Term B_dData_dList.t_List) (dtb_u_u56 : Core_dTerm.t_Term) -> ((((v_substFamArgsGo dtb_u_u54) 0) dtb_u_u55) dtb_u_u56))

# 97 "Vuna/Compiler/Elab/Representation.vuna"
let rec v_termIsFunctionFuel = (fun (dtb_u_u57 : int) (dtb_u_u58 : Elab_dTypes.t_DtData B_dData_dList.t_List) (dtb_u_u59 : string B_dData_dList.t_List) (dtb_u_u60 : Core_dTerm.t_Term) -> (if (dtb_u_u57 <= 0) then true else (match dtb_u_u60 with
  | Core_dTerm.C_Term_TPi (dtb_u_u61, dtb_u_u62, dtb_u_u63, dtb_u_u64, dtb_u_u65) -> true
  | _ -> (let dtb_u_u66 = (Core_dTerm.v_flattenTermApp dtb_u_u60) in (match (B_dData_dPair.v_firstOf dtb_u_u66) with
  | Core_dTerm.C_Term_TGlobal (dtb_u_u67) -> (((((v_termIsFunctionHead dtb_u_u57) dtb_u_u58) dtb_u_u59) dtb_u_u67) ((B_dData_dList.v_map B_dData_dPair.v_firstOf) (B_dData_dPair.v_secondOf dtb_u_u66)))
  | _ -> false
))
)))
# 111 "Vuna/Compiler/Elab/Representation.vuna"
and v_termIsFunctionHead = (fun (dtb_u_u68 : int) (dtb_u_u69 : Elab_dTypes.t_DtData B_dData_dList.t_List) (dtb_u_u70 : string B_dData_dList.t_List) (dtb_u_u71 : string) (dtb_u_u72 : Core_dTerm.t_Term B_dData_dList.t_List) -> (if ((B_dData_dList.v_memName dtb_u_u71) dtb_u_u70) then false else (match ((v_findDtData dtb_u_u71) dtb_u_u69) with
  | B_dData_dMaybe.C_Maybe_Nothing -> false
  | B_dData_dMaybe.C_Maybe_Just (dtb_u_u73) -> (let dtb_u_u74 = (Elab_dTypes.v_dtDataCtors dtb_u_u73) in (match dtb_u_u74 with
  | B_dData_dList.C_List__x58__x58_ (dtb_u_u75, dtb_u_u76) -> (match dtb_u_u76 with
  | B_dData_dList.C_List_Nil -> (let dtb_u_u77 = (v_keptIndices (v_ctorKeepFlags dtb_u_u75)) in (match dtb_u_u77 with
  | B_dData_dList.C_List__x58__x58_ (dtb_u_u78, dtb_u_u79) -> (match dtb_u_u79 with
  | B_dData_dList.C_List_Nil -> (if (dtb_u_u78 < (B_dData_dList.v_length (dtb_u_u73).Elab_dTypes.f_DtData_dtDataParams)) then false else (if ((B_dData_dList.v_length dtb_u_u72) <> (B_dData_dList.v_length (dtb_u_u73).Elab_dTypes.f_DtData_dtDataParams)) then true else (match ((v_ctorFieldDomainTerm dtb_u_u75) dtb_u_u78) with
  | B_dData_dMaybe.C_Maybe_Nothing -> true
  | B_dData_dMaybe.C_Maybe_Just (dtb_u_u80) -> ((((v_termIsFunctionFuel (dtb_u_u68 - 1)) dtb_u_u69) (B_dData_dList.C_List__x58__x58_ (dtb_u_u71, dtb_u_u70))) (((v_substFamArgs dtb_u_u78) dtb_u_u72) dtb_u_u80))
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
let v_termIsFunction = (fun (dtb_u_u81 : Elab_dTypes.t_DtData B_dData_dList.t_List) (dtb_u_u82 : Core_dTerm.t_Term) -> ((((v_termIsFunctionFuel 64) dtb_u_u81) B_dData_dList.C_List_Nil) dtb_u_u82))

# 148 "Vuna/Compiler/Elab/Representation.vuna"
let v_reprIsBoxed = (fun (dtb_u_u83 : Frontend_dAst.t_ReprTier) -> (match dtb_u_u83 with
  | Frontend_dAst.C_ReprTier_ReprBoxed -> true
  | _ -> false
))

# 156 "Vuna/Compiler/Elab/Representation.vuna"
let v_unboxedCandidateOfData = (fun (dtb_u_u84 : Elab_dTypes.t_DtData B_dData_dList.t_List) (dtb_u_u85 : Elab_dTypes.t_DtData) -> (if (B_dData_dBool.v_not (Elab_dTypes.v_dtDataIsRecord dtb_u_u85)) then B_dData_dList.C_List_Nil else (if (v_isSpecialUnboxFamily (Elab_dTypes.v_dtDataName dtb_u_u85)) then B_dData_dList.C_List_Nil else (if (v_reprIsBoxed (Elab_dTypes.v_dtDataRepr dtb_u_u85)) then B_dData_dList.C_List_Nil else (match (Elab_dTypes.v_dtDataCtors dtb_u_u85) with
  | B_dData_dList.C_List_Nil -> B_dData_dList.C_List_Nil
  | B_dData_dList.C_List__x58__x58_ (dtb_u_u86, dtb_u_u87) -> (match dtb_u_u87 with
  | B_dData_dList.C_List_Nil -> (match (v_keptIndices (v_ctorKeepFlags dtb_u_u86)) with
  | B_dData_dList.C_List_Nil -> B_dData_dList.C_List_Nil
  | B_dData_dList.C_List__x58__x58_ (dtb_u_u88, dtb_u_u89) -> (match dtb_u_u89 with
  | B_dData_dList.C_List_Nil -> (if (dtb_u_u88 >= (B_dData_dList.v_length (dtb_u_u85).Elab_dTypes.f_DtData_dtDataParams)) then (match ((v_ctorFieldDomainTerm dtb_u_u86) dtb_u_u88) with
  | B_dData_dMaybe.C_Maybe_Just (dtb_u_u90) -> (if ((v_termIsFunction dtb_u_u84) dtb_u_u90) then B_dData_dList.C_List_Nil else (if ((v_termRepresentable dtb_u_u84) dtb_u_u90) then (B_dData_dList.C_List__x58__x58_ ({ f_UnboxedCand_unboxedCandName = (Elab_dTypes.v_dtDataName dtb_u_u85); f_UnboxedCand_unboxedCandCtor = dtb_u_u86; f_UnboxedCand_unboxedCandIndex = dtb_u_u88 }, B_dData_dList.C_List_Nil)) else B_dData_dList.C_List_Nil))
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
let v_unboxedCandidates = (fun (dtb_u_u91 : Elab_dTypes.t_DtData B_dData_dList.t_List) -> ((B_dData_dList.v_concatMap (v_unboxedCandidateOfData dtb_u_u91)) dtb_u_u91))

# 205 "Vuna/Compiler/Elab/Representation.vuna"
let rec v_lookupNeighbors = (fun (dtb_u_u92 : string) (dtb_u_u93 : (string, string B_dData_dList.t_List) B_dData_dPair.t_Pair B_dData_dList.t_List) -> (match dtb_u_u93 with
  | B_dData_dList.C_List__x58__x58_ (dtb_u_u94, dtb_u_u95) -> (if ((B_dData_dPair.v_firstOf dtb_u_u94) = dtb_u_u92) then (B_dData_dPair.v_secondOf dtb_u_u94) else ((v_lookupNeighbors dtb_u_u92) dtb_u_u95))
  | B_dData_dList.C_List_Nil -> B_dData_dList.C_List_Nil
  | _ -> failwith "DT: impossible branch"
))

# 211 "Vuna/Compiler/Elab/Representation.vuna"
let rec v_reachesBackTo = (fun (dtb_u_u96 : int) (dtb_u_u97 : (string, string B_dData_dList.t_List) B_dData_dPair.t_Pair B_dData_dList.t_List) (dtb_u_u98 : string B_dData_dList.t_List) (dtb_u_u99 : string) (dtb_u_u100 : string) -> (if (dtb_u_u96 <= 0) then true else (((((v_anyReachBack (dtb_u_u96 - 1)) dtb_u_u97) dtb_u_u98) dtb_u_u99) ((v_lookupNeighbors dtb_u_u100) dtb_u_u97))))
# 219 "Vuna/Compiler/Elab/Representation.vuna"
and v_anyReachBack = (fun (dtb_u_u101 : int) (dtb_u_u102 : (string, string B_dData_dList.t_List) B_dData_dPair.t_Pair B_dData_dList.t_List) (dtb_u_u103 : string B_dData_dList.t_List) (dtb_u_u104 : string) (dtb_u_u105 : string B_dData_dList.t_List) -> (match dtb_u_u105 with
  | B_dData_dList.C_List__x58__x58_ (dtb_u_u106, dtb_u_u107) -> (if (dtb_u_u106 = dtb_u_u104) then true else (if ((B_dData_dList.v_memName dtb_u_u106) dtb_u_u103) then (((((v_anyReachBack dtb_u_u101) dtb_u_u102) dtb_u_u103) dtb_u_u104) dtb_u_u107) else (if (dtb_u_u101 <= 0) then true else (if (((((v_reachesBackTo (dtb_u_u101 - 1)) dtb_u_u102) (B_dData_dList.C_List__x58__x58_ (dtb_u_u106, dtb_u_u103))) dtb_u_u104) dtb_u_u106) then true else (((((v_anyReachBack (dtb_u_u101 - 1)) dtb_u_u102) dtb_u_u103) dtb_u_u104) dtb_u_u107)))))
  | B_dData_dList.C_List_Nil -> false
  | _ -> failwith "DT: impossible branch"
))

# 250 "Vuna/Compiler/Elab/Representation.vuna"
let rec v_lookupUnboxedInfo = (fun (dtb_u_u108 : string) (dtb_u_u109 : (string, (Elab_dTypes.t_DtCtor, int) B_dData_dPair.t_Pair) B_dData_dPair.t_Pair B_dData_dList.t_List) -> (match dtb_u_u109 with
  | B_dData_dList.C_List__x58__x58_ (dtb_u_u110, dtb_u_u111) -> (if ((B_dData_dPair.v_firstOf dtb_u_u110) = dtb_u_u108) then (B_dData_dMaybe.C_Maybe_Just ((B_dData_dPair.v_secondOf dtb_u_u110))) else ((v_lookupUnboxedInfo dtb_u_u108) dtb_u_u111))
  | B_dData_dList.C_List_Nil -> B_dData_dMaybe.C_Maybe_Nothing
  | _ -> failwith "DT: impossible branch"
))

# 19 "Vuna/Compiler/Elab/Representation.vuna"
let v_unboxedCandName = (fun (dtb_u_u112 : t_UnboxedCand) -> (match dtb_u_u112 with
  | { f_UnboxedCand_unboxedCandName = dtb_u_u113; f_UnboxedCand_unboxedCandCtor = dtb_u_u114; f_UnboxedCand_unboxedCandIndex = dtb_u_u115 } -> dtb_u_u113
  | _ -> failwith "DT: impossible branch"
))

# 189 "Vuna/Compiler/Elab/Representation.vuna"
let v_candidateNames = (fun (dtb_u_u116 : t_UnboxedCand B_dData_dList.t_List) -> ((B_dData_dList.v_map v_unboxedCandName) dtb_u_u116))

# 20 "Vuna/Compiler/Elab/Representation.vuna"
let v_unboxedCandCtor = (fun (dtb_u_u117 : t_UnboxedCand) -> (match dtb_u_u117 with
  | { f_UnboxedCand_unboxedCandName = dtb_u_u118; f_UnboxedCand_unboxedCandCtor = dtb_u_u119; f_UnboxedCand_unboxedCandIndex = dtb_u_u120 } -> dtb_u_u119
  | _ -> failwith "DT: impossible branch"
))

# 21 "Vuna/Compiler/Elab/Representation.vuna"
let v_unboxedCandIndex = (fun (dtb_u_u121 : t_UnboxedCand) -> (match dtb_u_u121 with
  | { f_UnboxedCand_unboxedCandName = dtb_u_u122; f_UnboxedCand_unboxedCandCtor = dtb_u_u123; f_UnboxedCand_unboxedCandIndex = dtb_u_u124 } -> dtb_u_u124
  | _ -> failwith "DT: impossible branch"
))

# 198 "Vuna/Compiler/Elab/Representation.vuna"
let v_candidateRefs = (fun (dtb_u_u125 : Elab_dTypes.t_DtData B_dData_dList.t_List) (dtb_u_u126 : string B_dData_dList.t_List) (dtb_u_u127 : t_UnboxedCand) -> (match ((v_ctorFieldDomainTerm (v_unboxedCandCtor dtb_u_u127)) (v_unboxedCandIndex dtb_u_u127)) with
  | B_dData_dMaybe.C_Maybe_Just (dtb_u_u128) -> ((B_dData_dList.v_filter (fun (dtb_u_u129 : string) -> ((B_dData_dList.v_memName dtb_u_u129) dtb_u_u126))) (Core_dTerm.v_termGlobalNames dtb_u_u128))
  | B_dData_dMaybe.C_Maybe_Nothing -> B_dData_dList.C_List_Nil
  | _ -> failwith "DT: impossible branch"
))

# 193 "Vuna/Compiler/Elab/Representation.vuna"
let v_candidateEdges = (fun (dtb_u_u130 : Elab_dTypes.t_DtData B_dData_dList.t_List) (dtb_u_u131 : string B_dData_dList.t_List) (dtb_u_u132 : t_UnboxedCand B_dData_dList.t_List) -> ((B_dData_dList.v_map (fun (dtb_u_u133 : t_UnboxedCand) -> { B_dData_dPair.f_Pair_first = (v_unboxedCandName dtb_u_u133); B_dData_dPair.f_Pair_second = (((v_candidateRefs dtb_u_u130) dtb_u_u131) dtb_u_u133) })) dtb_u_u132))

# 234 "Vuna/Compiler/Elab/Representation.vuna"
let v_unboxedInfoOf = (fun (dtb_u_u134 : Elab_dTypes.t_DtData B_dData_dList.t_List) -> (let dtb_u_u135 = (v_unboxedCandidates dtb_u_u134) in (let dtb_u_u136 = (v_candidateNames dtb_u_u135) in (let dtb_u_u137 = (((v_candidateEdges dtb_u_u134) dtb_u_u136) dtb_u_u135) in (let dtb_u_u138 = (bi_natAdd (B_dData_dList.v_length dtb_u_u136) 2) in ((B_dData_dList.v_map (fun (dtb_u_u139 : t_UnboxedCand) -> { B_dData_dPair.f_Pair_first = (v_unboxedCandName dtb_u_u139); B_dData_dPair.f_Pair_second = { B_dData_dPair.f_Pair_first = (v_unboxedCandCtor dtb_u_u139); B_dData_dPair.f_Pair_second = (v_unboxedCandIndex dtb_u_u139) } })) ((B_dData_dList.v_filter (fun (dtb_u_u140 : t_UnboxedCand) -> (B_dData_dBool.v_not (((((v_reachesBackTo dtb_u_u138) dtb_u_u137) (B_dData_dList.C_List__x58__x58_ ((v_unboxedCandName dtb_u_u140), B_dData_dList.C_List_Nil))) (v_unboxedCandName dtb_u_u140)) (v_unboxedCandName dtb_u_u140))))) dtb_u_u135)))))))

# 246 "Vuna/Compiler/Elab/Representation.vuna"
let v_unboxedFamilySet = (fun (dtb_u_u141 : Elab_dTypes.t_DtData B_dData_dList.t_List) -> ((B_dData_dList.v_map B_dData_dPair.v_firstOf) (v_unboxedInfoOf dtb_u_u141)))
