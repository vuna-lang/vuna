open Vuna_runtime
type t_Vuna_dCompiler_dElab_dRepresentation_dUnboxedCand = { f_Vuna_dCompiler_dElab_dRepresentation_dUnboxedCand_unboxedCandName : string; f_Vuna_dCompiler_dElab_dRepresentation_dUnboxedCand_unboxedCandCtor : Vuna_dCompiler_dElab_dTypes.t_Vuna_dCompiler_dElab_dTypes_dDtCtor; f_Vuna_dCompiler_dElab_dRepresentation_dUnboxedCand_unboxedCandIndex : int }

let v_Vuna_dCompiler_dElab_dRepresentation_dunboxedCandName = (fun mc0 -> (match mc0 with
  | { f_Vuna_dCompiler_dElab_dRepresentation_dUnboxedCand_unboxedCandName = dtb__0; f_Vuna_dCompiler_dElab_dRepresentation_dUnboxedCand_unboxedCandCtor = dtb__1; f_Vuna_dCompiler_dElab_dRepresentation_dUnboxedCand_unboxedCandIndex = dtb__2 } -> dtb__0
  | _ -> failwith "DT: impossible branch"
))

let v_Vuna_dCompiler_dElab_dRepresentation_dunboxedCandCtor = (fun mc0 -> (match mc0 with
  | { f_Vuna_dCompiler_dElab_dRepresentation_dUnboxedCand_unboxedCandName = dtb__3; f_Vuna_dCompiler_dElab_dRepresentation_dUnboxedCand_unboxedCandCtor = dtb__4; f_Vuna_dCompiler_dElab_dRepresentation_dUnboxedCand_unboxedCandIndex = dtb__5 } -> dtb__4
  | _ -> failwith "DT: impossible branch"
))

let v_Vuna_dCompiler_dElab_dRepresentation_dunboxedCandIndex = (fun mc0 -> (match mc0 with
  | { f_Vuna_dCompiler_dElab_dRepresentation_dUnboxedCand_unboxedCandName = dtb__6; f_Vuna_dCompiler_dElab_dRepresentation_dUnboxedCand_unboxedCandCtor = dtb__7; f_Vuna_dCompiler_dElab_dRepresentation_dUnboxedCand_unboxedCandIndex = dtb__8 } -> dtb__8
  | _ -> failwith "DT: impossible branch"
))

let v_Vuna_dCompiler_dElab_dRepresentation_dctorKeepFlags = (fun c -> ((Base_dList.v_Base_dList_dmap (fun b -> (Base_dBool.v_Base_dBool_dnot (Vuna_dCompiler_dCore_dTerm.v_Vuna_dCompiler_dCore_dTerm_drigIsErased (Base_dPair.v_Base_dPair_dsecondOf b))))) (Vuna_dCompiler_dElab_dTypes.v_Vuna_dCompiler_dElab_dTypes_ddtCtorTelescope c)))

let rec v_Vuna_dCompiler_dElab_dRepresentation_dkeptIndicesGo = (fun mc0 mc1 -> (match mc0 with
  | Base_dList.C_Base_dList_dList_Cons (dtb__9, dtb__10) -> (if dtb__9 then (Base_dList.C_Base_dList_dList_Cons (mc1, ((v_Vuna_dCompiler_dElab_dRepresentation_dkeptIndicesGo dtb__10) (mc1 + 1)))) else ((v_Vuna_dCompiler_dElab_dRepresentation_dkeptIndicesGo dtb__10) (mc1 + 1)))
  | Base_dList.C_Base_dList_dList_Nil -> Base_dList.C_Base_dList_dList_Nil
  | _ -> failwith "DT: impossible branch"
))

let v_Vuna_dCompiler_dElab_dRepresentation_dkeptIndices = (fun flags -> ((v_Vuna_dCompiler_dElab_dRepresentation_dkeptIndicesGo flags) 0))

let v_Vuna_dCompiler_dElab_dRepresentation_disSpecialUnboxFamily = (fun name -> (if (if (name = Vuna_dCompiler_dIntrinsics.v_Vuna_dCompiler_dIntrinsics_dboolTypeName) then true else (name = Vuna_dCompiler_dIntrinsics.v_Vuna_dCompiler_dIntrinsics_dnatTypeName)) then true else (Vuna_dCompiler_dIntrinsics.v_Vuna_dCompiler_dIntrinsics_disTypeConstructorName name)))

let rec v_Vuna_dCompiler_dElab_dRepresentation_dfindDtData = (fun mc0 mc1 -> (match mc1 with
  | Base_dList.C_Base_dList_dList_Cons (dtb__11, dtb__12) -> (if ((Vuna_dCompiler_dElab_dTypes.v_Vuna_dCompiler_dElab_dTypes_ddtDataName dtb__11) = mc0) then (Base_dMaybe.C_Base_dMaybe_dMaybe_Just (dtb__11)) else ((v_Vuna_dCompiler_dElab_dRepresentation_dfindDtData mc0) dtb__12))
  | Base_dList.C_Base_dList_dList_Nil -> Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing
  | _ -> failwith "DT: impossible branch"
))

let v_Vuna_dCompiler_dElab_dRepresentation_dknownTypeHead = (fun datas g -> (if (if (if (if (if (g = Vuna_dCompiler_dIntrinsics.v_Vuna_dCompiler_dIntrinsics_dintTypeName) then true else (g = Vuna_dCompiler_dIntrinsics.v_Vuna_dCompiler_dIntrinsics_dstrTypeName)) then true else (g = Vuna_dCompiler_dIntrinsics.v_Vuna_dCompiler_dIntrinsics_dboolTypeName)) then true else (g = Vuna_dCompiler_dIntrinsics.v_Vuna_dCompiler_dIntrinsics_dnatTypeName)) then true else (Vuna_dCompiler_dIntrinsics.v_Vuna_dCompiler_dIntrinsics_disTypeConstructorName g)) then true else (match ((v_Vuna_dCompiler_dElab_dRepresentation_dfindDtData g) datas) with
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Just (dtb__13) -> true
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing -> false
  | _ -> failwith "DT: impossible branch"
)))

let rec v_Vuna_dCompiler_dElab_dRepresentation_dtermAppHeadRepresentable = (fun mc0 mc1 -> (match mc1 with
  | Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dTerm_TApp (dtb__14, dtb__15, dtb__16) -> ((v_Vuna_dCompiler_dElab_dRepresentation_dtermAppHeadRepresentable mc0) dtb__14)
  | Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dTerm_TGlobal (dtb__17) -> ((v_Vuna_dCompiler_dElab_dRepresentation_dknownTypeHead mc0) dtb__17)
  | _ -> false
))

let rec v_Vuna_dCompiler_dElab_dRepresentation_dtermRepresentable = (fun mc0 mc1 -> (match mc1 with
  | Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dTerm_TVar (dtb__18, dtb__19, dtb__20) -> true
  | Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dTerm_TRecord (dtb__21, dtb__22) -> ((v_Vuna_dCompiler_dElab_dRepresentation_dknownTypeHead mc0) dtb__21)
  | Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dTerm_TGlobal (dtb__23) -> ((v_Vuna_dCompiler_dElab_dRepresentation_dknownTypeHead mc0) dtb__23)
  | Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dTerm_TApp (dtb__24, dtb__25, dtb__26) -> ((v_Vuna_dCompiler_dElab_dRepresentation_dtermAppHeadRepresentable mc0) dtb__24)
  | Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dTerm_TPi (dtb__27, dtb__28, dtb__29, dtb__30, dtb__31) -> (if ((v_Vuna_dCompiler_dElab_dRepresentation_dtermRepresentable mc0) dtb__30) then ((v_Vuna_dCompiler_dElab_dRepresentation_dtermRepresentable mc0) dtb__31) else false)
  | _ -> false
))

let rec v_Vuna_dCompiler_dElab_dRepresentation_dctorFieldDomainTermGo = (fun fuel i t -> (if (fuel <= 0) then Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing else (match t with
  | Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dTerm_TPi (dtb__32, dtb__33, dtb__34, dtb__35, dtb__36) -> (if (i <= 0) then (Base_dMaybe.C_Base_dMaybe_dMaybe_Just (dtb__35)) else (((v_Vuna_dCompiler_dElab_dRepresentation_dctorFieldDomainTermGo (fuel - 1)) (i - 1)) dtb__36))
  | _ -> Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing
)))

let v_Vuna_dCompiler_dElab_dRepresentation_dctorFieldDomainTerm = (fun c i -> (((v_Vuna_dCompiler_dElab_dRepresentation_dctorFieldDomainTermGo 512) i) (Vuna_dCompiler_dElab_dTypes.v_Vuna_dCompiler_dElab_dTypes_ddtCtorType c)))

let v_Vuna_dCompiler_dElab_dRepresentation_dtermIsFunction = (fun mc0 -> (match mc0 with
  | Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dTerm_TPi (dtb__37, dtb__38, dtb__39, dtb__40, dtb__41) -> true
  | _ -> false
))

let v_Vuna_dCompiler_dElab_dRepresentation_dreprIsOpaque = (fun mc0 -> (match mc0 with
  | Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dReprTier_ReprOpaque -> true
  | _ -> false
))

let v_Vuna_dCompiler_dElab_dRepresentation_dunboxedCandidateOfData = (fun datas d -> (if (Base_dBool.v_Base_dBool_dnot (Vuna_dCompiler_dElab_dTypes.v_Vuna_dCompiler_dElab_dTypes_ddtDataIsRecord d)) then Base_dList.C_Base_dList_dList_Nil else (if (v_Vuna_dCompiler_dElab_dRepresentation_disSpecialUnboxFamily (Vuna_dCompiler_dElab_dTypes.v_Vuna_dCompiler_dElab_dTypes_ddtDataName d)) then Base_dList.C_Base_dList_dList_Nil else (if (v_Vuna_dCompiler_dElab_dRepresentation_dreprIsOpaque (Vuna_dCompiler_dElab_dTypes.v_Vuna_dCompiler_dElab_dTypes_ddtDataRepr d)) then Base_dList.C_Base_dList_dList_Nil else (match (Vuna_dCompiler_dElab_dTypes.v_Vuna_dCompiler_dElab_dTypes_ddtDataCtors d) with
  | Base_dList.C_Base_dList_dList_Nil -> Base_dList.C_Base_dList_dList_Nil
  | Base_dList.C_Base_dList_dList_Cons (dtb__42, dtb__43) -> (match dtb__43 with
  | Base_dList.C_Base_dList_dList_Nil -> (match (v_Vuna_dCompiler_dElab_dRepresentation_dkeptIndices (v_Vuna_dCompiler_dElab_dRepresentation_dctorKeepFlags dtb__42)) with
  | Base_dList.C_Base_dList_dList_Nil -> Base_dList.C_Base_dList_dList_Nil
  | Base_dList.C_Base_dList_dList_Cons (dtb__44, dtb__45) -> (match dtb__45 with
  | Base_dList.C_Base_dList_dList_Nil -> (if (dtb__44 >= (Base_dList.v_Base_dList_dlength (d).Vuna_dCompiler_dElab_dTypes.f_Vuna_dCompiler_dElab_dTypes_dDtData_dtDataParams)) then (match ((v_Vuna_dCompiler_dElab_dRepresentation_dctorFieldDomainTerm dtb__42) dtb__44) with
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Just (dtb__46) -> (if (v_Vuna_dCompiler_dElab_dRepresentation_dtermIsFunction dtb__46) then Base_dList.C_Base_dList_dList_Nil else (if ((v_Vuna_dCompiler_dElab_dRepresentation_dtermRepresentable datas) dtb__46) then (Base_dList.C_Base_dList_dList_Cons ({ f_Vuna_dCompiler_dElab_dRepresentation_dUnboxedCand_unboxedCandName = (Vuna_dCompiler_dElab_dTypes.v_Vuna_dCompiler_dElab_dTypes_ddtDataName d); f_Vuna_dCompiler_dElab_dRepresentation_dUnboxedCand_unboxedCandCtor = dtb__42; f_Vuna_dCompiler_dElab_dRepresentation_dUnboxedCand_unboxedCandIndex = dtb__44 }, Base_dList.C_Base_dList_dList_Nil)) else Base_dList.C_Base_dList_dList_Nil))
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing -> Base_dList.C_Base_dList_dList_Nil
  | _ -> failwith "DT: impossible branch"
) else Base_dList.C_Base_dList_dList_Nil)
  | _ -> Base_dList.C_Base_dList_dList_Nil
)
  | _ -> failwith "DT: impossible branch"
)
  | _ -> Base_dList.C_Base_dList_dList_Nil
)
  | _ -> failwith "DT: impossible branch"
)))))

let v_Vuna_dCompiler_dElab_dRepresentation_dunboxedCandidates = (fun datas -> ((Base_dList.v_Base_dList_dconcatMap (v_Vuna_dCompiler_dElab_dRepresentation_dunboxedCandidateOfData datas)) datas))

let v_Vuna_dCompiler_dElab_dRepresentation_dcandidateNames = (fun cands -> ((Base_dList.v_Base_dList_dmap v_Vuna_dCompiler_dElab_dRepresentation_dunboxedCandName) cands))

let v_Vuna_dCompiler_dElab_dRepresentation_dcandidateRefs = (fun datas names cand -> (match ((v_Vuna_dCompiler_dElab_dRepresentation_dctorFieldDomainTerm (v_Vuna_dCompiler_dElab_dRepresentation_dunboxedCandCtor cand)) (v_Vuna_dCompiler_dElab_dRepresentation_dunboxedCandIndex cand)) with
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Just (dtb__47) -> ((Base_dList.v_Base_dList_dfilter (fun n -> ((Base_dList.v_Base_dList_dmemName n) names))) (Vuna_dCompiler_dCore_dTerm.v_Vuna_dCompiler_dCore_dTerm_dtermGlobalNames dtb__47))
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing -> Base_dList.C_Base_dList_dList_Nil
  | _ -> failwith "DT: impossible branch"
))

let v_Vuna_dCompiler_dElab_dRepresentation_dcandidateEdges = (fun datas names cands -> ((Base_dList.v_Base_dList_dmap (fun cand -> { Base_dPair.f_Base_dPair_dPair_first = (v_Vuna_dCompiler_dElab_dRepresentation_dunboxedCandName cand); Base_dPair.f_Base_dPair_dPair_second = (((v_Vuna_dCompiler_dElab_dRepresentation_dcandidateRefs datas) names) cand) })) cands))

let rec v_Vuna_dCompiler_dElab_dRepresentation_dlookupNeighbors = (fun mc0 mc1 -> (match mc1 with
  | Base_dList.C_Base_dList_dList_Cons (dtb__48, dtb__49) -> (if ((Base_dPair.v_Base_dPair_dfirstOf dtb__48) = mc0) then (Base_dPair.v_Base_dPair_dsecondOf dtb__48) else ((v_Vuna_dCompiler_dElab_dRepresentation_dlookupNeighbors mc0) dtb__49))
  | Base_dList.C_Base_dList_dList_Nil -> Base_dList.C_Base_dList_dList_Nil
  | _ -> failwith "DT: impossible branch"
))

let rec v_Vuna_dCompiler_dElab_dRepresentation_dreachesBackTo = (fun fuel edges visited target node -> (if (fuel <= 0) then true else (((((v_Vuna_dCompiler_dElab_dRepresentation_danyReachBack (fuel - 1)) edges) visited) target) ((v_Vuna_dCompiler_dElab_dRepresentation_dlookupNeighbors node) edges))))
and v_Vuna_dCompiler_dElab_dRepresentation_danyReachBack = (fun mc0 mc1 mc2 mc3 mc4 -> (match mc4 with
  | Base_dList.C_Base_dList_dList_Cons (dtb__50, dtb__51) -> (if (dtb__50 = mc3) then true else (if ((Base_dList.v_Base_dList_dmemName dtb__50) mc2) then (((((v_Vuna_dCompiler_dElab_dRepresentation_danyReachBack mc0) mc1) mc2) mc3) dtb__51) else (if (mc0 <= 0) then true else (if (((((v_Vuna_dCompiler_dElab_dRepresentation_dreachesBackTo (mc0 - 1)) mc1) (Base_dList.C_Base_dList_dList_Cons (dtb__50, mc2))) mc3) dtb__50) then true else (((((v_Vuna_dCompiler_dElab_dRepresentation_danyReachBack (mc0 - 1)) mc1) mc2) mc3) dtb__51)))))
  | Base_dList.C_Base_dList_dList_Nil -> false
  | _ -> failwith "DT: impossible branch"
))

let v_Vuna_dCompiler_dElab_dRepresentation_dunboxedInfoOf = (fun datas -> ((fun cands -> ((fun names -> ((fun edges -> ((fun fuel -> ((Base_dList.v_Base_dList_dmap (fun cand -> { Base_dPair.f_Base_dPair_dPair_first = (v_Vuna_dCompiler_dElab_dRepresentation_dunboxedCandName cand); Base_dPair.f_Base_dPair_dPair_second = { Base_dPair.f_Base_dPair_dPair_first = (v_Vuna_dCompiler_dElab_dRepresentation_dunboxedCandCtor cand); Base_dPair.f_Base_dPair_dPair_second = (v_Vuna_dCompiler_dElab_dRepresentation_dunboxedCandIndex cand) } })) ((Base_dList.v_Base_dList_dfilter (fun cand -> (Base_dBool.v_Base_dBool_dnot (((((v_Vuna_dCompiler_dElab_dRepresentation_dreachesBackTo fuel) edges) (Base_dList.C_Base_dList_dList_Cons ((v_Vuna_dCompiler_dElab_dRepresentation_dunboxedCandName cand), Base_dList.C_Base_dList_dList_Nil))) (v_Vuna_dCompiler_dElab_dRepresentation_dunboxedCandName cand)) (v_Vuna_dCompiler_dElab_dRepresentation_dunboxedCandName cand))))) cands))) (bi_natAdd (Base_dList.v_Base_dList_dlength names) 2))) (((v_Vuna_dCompiler_dElab_dRepresentation_dcandidateEdges datas) names) cands))) (v_Vuna_dCompiler_dElab_dRepresentation_dcandidateNames cands))) (v_Vuna_dCompiler_dElab_dRepresentation_dunboxedCandidates datas)))

let v_Vuna_dCompiler_dElab_dRepresentation_dunboxedFamilySet = (fun datas -> ((Base_dList.v_Base_dList_dmap Base_dPair.v_Base_dPair_dfirstOf) (v_Vuna_dCompiler_dElab_dRepresentation_dunboxedInfoOf datas)))

let rec v_Vuna_dCompiler_dElab_dRepresentation_dlookupUnboxedInfo = (fun mc0 mc1 -> (match mc1 with
  | Base_dList.C_Base_dList_dList_Cons (dtb__52, dtb__53) -> (if ((Base_dPair.v_Base_dPair_dfirstOf dtb__52) = mc0) then (Base_dMaybe.C_Base_dMaybe_dMaybe_Just ((Base_dPair.v_Base_dPair_dsecondOf dtb__52))) else ((v_Vuna_dCompiler_dElab_dRepresentation_dlookupUnboxedInfo mc0) dtb__53))
  | Base_dList.C_Base_dList_dList_Nil -> Base_dMaybe.C_Base_dMaybe_dMaybe_Nothing
  | _ -> failwith "DT: impossible branch"
))
