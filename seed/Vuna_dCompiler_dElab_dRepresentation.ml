open Vuna_runtime
type t_Vuna_dCompiler_dElab_dRepresentation_dUnboxedCand = { f_Vuna_dCompiler_dElab_dRepresentation_dUnboxedCand_unboxedCandName : string; f_Vuna_dCompiler_dElab_dRepresentation_dUnboxedCand_unboxedCandCtor : Vuna_dCompiler_dElab_dTypes.t_Vuna_dCompiler_dElab_dTypes_dDtCtor; f_Vuna_dCompiler_dElab_dRepresentation_dUnboxedCand_unboxedCandIndex : int }

# 25 "Vuna/Compiler/Elab/Representation.vuna"
let v_Vuna_dCompiler_dElab_dRepresentation_dunboxedCandName = (fun (mc0 : t_Vuna_dCompiler_dElab_dRepresentation_dUnboxedCand) -> (match mc0 with
  | { f_Vuna_dCompiler_dElab_dRepresentation_dUnboxedCand_unboxedCandName = dtb__0; f_Vuna_dCompiler_dElab_dRepresentation_dUnboxedCand_unboxedCandCtor = dtb__1; f_Vuna_dCompiler_dElab_dRepresentation_dUnboxedCand_unboxedCandIndex = dtb__2 } -> dtb__0
  | _ -> failwith "DT: impossible branch"
))

# 29 "Vuna/Compiler/Elab/Representation.vuna"
let v_Vuna_dCompiler_dElab_dRepresentation_dunboxedCandCtor = (fun (mc0 : t_Vuna_dCompiler_dElab_dRepresentation_dUnboxedCand) -> (match mc0 with
  | { f_Vuna_dCompiler_dElab_dRepresentation_dUnboxedCand_unboxedCandName = dtb__3; f_Vuna_dCompiler_dElab_dRepresentation_dUnboxedCand_unboxedCandCtor = dtb__4; f_Vuna_dCompiler_dElab_dRepresentation_dUnboxedCand_unboxedCandIndex = dtb__5 } -> dtb__4
  | _ -> failwith "DT: impossible branch"
))

# 33 "Vuna/Compiler/Elab/Representation.vuna"
let v_Vuna_dCompiler_dElab_dRepresentation_dunboxedCandIndex = (fun (mc0 : t_Vuna_dCompiler_dElab_dRepresentation_dUnboxedCand) -> (match mc0 with
  | { f_Vuna_dCompiler_dElab_dRepresentation_dUnboxedCand_unboxedCandName = dtb__6; f_Vuna_dCompiler_dElab_dRepresentation_dUnboxedCand_unboxedCandCtor = dtb__7; f_Vuna_dCompiler_dElab_dRepresentation_dUnboxedCand_unboxedCandIndex = dtb__8 } -> dtb__8
  | _ -> failwith "DT: impossible branch"
))

# 38 "Vuna/Compiler/Elab/Representation.vuna"
let v_Vuna_dCompiler_dElab_dRepresentation_dctorKeepFlags = (fun (c : Vuna_dCompiler_dElab_dTypes.t_Vuna_dCompiler_dElab_dTypes_dDtCtor) -> ((Base_dData_dList.v_Base_dData_dList_dmap (fun (b : (string, Vuna_dCompiler_dCore_dTerm.t_Vuna_dCompiler_dCore_dTerm_dRig) Base_dData_dPair.t_Base_dData_dPair_dPair) -> (Base_dData_dBool.v_Base_dData_dBool_dnot (Vuna_dCompiler_dCore_dTerm.v_Vuna_dCompiler_dCore_dTerm_drigIsErased (Base_dData_dPair.v_Base_dData_dPair_dsecondOf b))))) (Vuna_dCompiler_dElab_dTypes.v_Vuna_dCompiler_dElab_dTypes_ddtCtorTelescope c)))

# 46 "Vuna/Compiler/Elab/Representation.vuna"
let rec v_Vuna_dCompiler_dElab_dRepresentation_dkeptIndicesGo = (fun (mc0 : bool Base_dData_dList.t_Base_dData_dList_dList) (mc1 : int) -> (match mc0 with
  | Base_dData_dList.C_Base_dData_dList_dList__x58__x58_ (dtb__9, dtb__10) -> (if dtb__9 then (Base_dData_dList.C_Base_dData_dList_dList__x58__x58_ (mc1, ((v_Vuna_dCompiler_dElab_dRepresentation_dkeptIndicesGo dtb__10) (mc1 + 1)))) else ((v_Vuna_dCompiler_dElab_dRepresentation_dkeptIndicesGo dtb__10) (mc1 + 1)))
  | Base_dData_dList.C_Base_dData_dList_dList_Nil -> Base_dData_dList.C_Base_dData_dList_dList_Nil
  | _ -> failwith "DT: impossible branch"
))

# 42 "Vuna/Compiler/Elab/Representation.vuna"
let v_Vuna_dCompiler_dElab_dRepresentation_dkeptIndices = (fun (flags : bool Base_dData_dList.t_Base_dData_dList_dList) -> ((v_Vuna_dCompiler_dElab_dRepresentation_dkeptIndicesGo flags) 0))

# 52 "Vuna/Compiler/Elab/Representation.vuna"
let v_Vuna_dCompiler_dElab_dRepresentation_disSpecialUnboxFamily = (fun (name : string) -> (if (Vuna_dCompiler_dBase_dIntrinsics.v_Vuna_dCompiler_dBase_dIntrinsics_disUnboxedCanonical name) then true else (Vuna_dCompiler_dBase_dIntrinsics.v_Vuna_dCompiler_dBase_dIntrinsics_disTypeConstructorName name)))

# 57 "Vuna/Compiler/Elab/Representation.vuna"
let rec v_Vuna_dCompiler_dElab_dRepresentation_dfindDtData = (fun (mc0 : string) (mc1 : Vuna_dCompiler_dElab_dTypes.t_Vuna_dCompiler_dElab_dTypes_dDtData Base_dData_dList.t_Base_dData_dList_dList) -> (match mc1 with
  | Base_dData_dList.C_Base_dData_dList_dList__x58__x58_ (dtb__11, dtb__12) -> (if ((Vuna_dCompiler_dElab_dTypes.v_Vuna_dCompiler_dElab_dTypes_ddtDataName dtb__11) = mc0) then (Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Just (dtb__11)) else ((v_Vuna_dCompiler_dElab_dRepresentation_dfindDtData mc0) dtb__12))
  | Base_dData_dList.C_Base_dData_dList_dList_Nil -> Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Nothing
  | _ -> failwith "DT: impossible branch"
))

# 62 "Vuna/Compiler/Elab/Representation.vuna"
let v_Vuna_dCompiler_dElab_dRepresentation_dknownTypeHead = (fun (datas : Vuna_dCompiler_dElab_dTypes.t_Vuna_dCompiler_dElab_dTypes_dDtData Base_dData_dList.t_Base_dData_dList_dList) (g : string) -> (if (if (if (if (g = Vuna_dCompiler_dBase_dIntrinsics.v_Vuna_dCompiler_dBase_dIntrinsics_dintTypeName) then true else (g = Vuna_dCompiler_dBase_dIntrinsics.v_Vuna_dCompiler_dBase_dIntrinsics_dstrTypeName)) then true else (Vuna_dCompiler_dBase_dIntrinsics.v_Vuna_dCompiler_dBase_dIntrinsics_disUnboxedCanonical g)) then true else (Vuna_dCompiler_dBase_dIntrinsics.v_Vuna_dCompiler_dBase_dIntrinsics_disTypeConstructorName g)) then true else (match ((v_Vuna_dCompiler_dElab_dRepresentation_dfindDtData g) datas) with
  | Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Just (dtb__13) -> true
  | Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Nothing -> false
  | _ -> failwith "DT: impossible branch"
)))

# 83 "Vuna/Compiler/Elab/Representation.vuna"
let rec v_Vuna_dCompiler_dElab_dRepresentation_dtermAppHeadRepresentable = (fun (mc0 : Vuna_dCompiler_dElab_dTypes.t_Vuna_dCompiler_dElab_dTypes_dDtData Base_dData_dList.t_Base_dData_dList_dList) (mc1 : Vuna_dCompiler_dCore_dTerm.t_Vuna_dCompiler_dCore_dTerm_dTerm) -> (match mc1 with
  | Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dTerm_TApp (dtb__14, dtb__15, dtb__16) -> ((v_Vuna_dCompiler_dElab_dRepresentation_dtermAppHeadRepresentable mc0) dtb__14)
  | Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dTerm_TGlobal (dtb__17) -> ((v_Vuna_dCompiler_dElab_dRepresentation_dknownTypeHead mc0) dtb__17)
  | _ -> false
))

# 72 "Vuna/Compiler/Elab/Representation.vuna"
let rec v_Vuna_dCompiler_dElab_dRepresentation_dtermRepresentable = (fun (mc0 : Vuna_dCompiler_dElab_dTypes.t_Vuna_dCompiler_dElab_dTypes_dDtData Base_dData_dList.t_Base_dData_dList_dList) (mc1 : Vuna_dCompiler_dCore_dTerm.t_Vuna_dCompiler_dCore_dTerm_dTerm) -> (match mc1 with
  | Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dTerm_TVar (dtb__18, dtb__19, dtb__20) -> true
  | Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dTerm_TRecord (dtb__21, dtb__22) -> ((v_Vuna_dCompiler_dElab_dRepresentation_dknownTypeHead mc0) dtb__21)
  | Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dTerm_TGlobal (dtb__23) -> ((v_Vuna_dCompiler_dElab_dRepresentation_dknownTypeHead mc0) dtb__23)
  | Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dTerm_TApp (dtb__24, dtb__25, dtb__26) -> ((v_Vuna_dCompiler_dElab_dRepresentation_dtermAppHeadRepresentable mc0) dtb__24)
  | Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dTerm_TPi (dtb__27, dtb__28, dtb__29, dtb__30, dtb__31) -> (if ((v_Vuna_dCompiler_dElab_dRepresentation_dtermRepresentable mc0) dtb__30) then ((v_Vuna_dCompiler_dElab_dRepresentation_dtermRepresentable mc0) dtb__31) else false)
  | _ -> false
))

# 94 "Vuna/Compiler/Elab/Representation.vuna"
let rec v_Vuna_dCompiler_dElab_dRepresentation_dctorFieldDomainTermGo = (fun (fuel : int) (i : int) (t : Vuna_dCompiler_dCore_dTerm.t_Vuna_dCompiler_dCore_dTerm_dTerm) -> (if (fuel <= 0) then Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Nothing else (match t with
  | Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dTerm_TPi (dtb__32, dtb__33, dtb__34, dtb__35, dtb__36) -> (if (i <= 0) then (Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Just (dtb__35)) else (((v_Vuna_dCompiler_dElab_dRepresentation_dctorFieldDomainTermGo (fuel - 1)) (i - 1)) dtb__36))
  | _ -> Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Nothing
)))

# 90 "Vuna/Compiler/Elab/Representation.vuna"
let v_Vuna_dCompiler_dElab_dRepresentation_dctorFieldDomainTerm = (fun (c : Vuna_dCompiler_dElab_dTypes.t_Vuna_dCompiler_dElab_dTypes_dDtCtor) (i : int) -> (((v_Vuna_dCompiler_dElab_dRepresentation_dctorFieldDomainTermGo 512) i) (Vuna_dCompiler_dElab_dTypes.v_Vuna_dCompiler_dElab_dTypes_ddtCtorType c)))

# 150 "Vuna/Compiler/Elab/Representation.vuna"
let rec v_Vuna_dCompiler_dElab_dRepresentation_dsubstFamArgsGo = (fun (mc0 : int) (mc1 : int) (mc2 : Vuna_dCompiler_dCore_dTerm.t_Vuna_dCompiler_dCore_dTerm_dTerm Base_dData_dList.t_Base_dData_dList_dList) (mc3 : Vuna_dCompiler_dCore_dTerm.t_Vuna_dCompiler_dCore_dTerm_dTerm) -> (match mc2 with
  | Base_dData_dList.C_Base_dData_dList_dList__x58__x58_ (dtb__37, dtb__38) -> ((((v_Vuna_dCompiler_dElab_dRepresentation_dsubstFamArgsGo mc0) (mc1 + 1)) dtb__38) (((Vuna_dCompiler_dCore_dTerm.v_Vuna_dCompiler_dCore_dTerm_dsubstVarAt ((mc0 - 1) - mc1)) dtb__37) mc3))
  | Base_dData_dList.C_Base_dData_dList_dList_Nil -> mc3
  | _ -> failwith "DT: impossible branch"
))

# 147 "Vuna/Compiler/Elab/Representation.vuna"
let v_Vuna_dCompiler_dElab_dRepresentation_dsubstFamArgs = (fun (i : int) (args : Vuna_dCompiler_dCore_dTerm.t_Vuna_dCompiler_dCore_dTerm_dTerm Base_dData_dList.t_Base_dData_dList_dList) (dom : Vuna_dCompiler_dCore_dTerm.t_Vuna_dCompiler_dCore_dTerm_dTerm) -> ((((v_Vuna_dCompiler_dElab_dRepresentation_dsubstFamArgsGo i) 0) args) dom))

# 109 "Vuna/Compiler/Elab/Representation.vuna"
let rec v_Vuna_dCompiler_dElab_dRepresentation_dtermIsFunctionFuel = (fun (fuel : int) (datas : Vuna_dCompiler_dElab_dTypes.t_Vuna_dCompiler_dElab_dTypes_dDtData Base_dData_dList.t_Base_dData_dList_dList) (seen : string Base_dData_dList.t_Base_dData_dList_dList) (t : Vuna_dCompiler_dCore_dTerm.t_Vuna_dCompiler_dCore_dTerm_dTerm) -> (if (fuel <= 0) then true else (match t with
  | Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dTerm_TPi (dtb__39, dtb__40, dtb__41, dtb__42, dtb__43) -> true
  | _ -> ((fun p -> (match (Base_dData_dPair.v_Base_dData_dPair_dfirstOf p) with
  | Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dTerm_TGlobal (dtb__44) -> (((((v_Vuna_dCompiler_dElab_dRepresentation_dtermIsFunctionHead fuel) datas) seen) dtb__44) ((Base_dData_dList.v_Base_dData_dList_dmap Base_dData_dPair.v_Base_dData_dPair_dfirstOf) (Base_dData_dPair.v_Base_dData_dPair_dsecondOf p)))
  | _ -> false
)) (Vuna_dCompiler_dCore_dTerm.v_Vuna_dCompiler_dCore_dTerm_dflattenTermApp t))
)))
# 123 "Vuna/Compiler/Elab/Representation.vuna"
and v_Vuna_dCompiler_dElab_dRepresentation_dtermIsFunctionHead = (fun (fuel : int) (datas : Vuna_dCompiler_dElab_dTypes.t_Vuna_dCompiler_dElab_dTypes_dDtData Base_dData_dList.t_Base_dData_dList_dList) (seen : string Base_dData_dList.t_Base_dData_dList_dList) (g : string) (args : Vuna_dCompiler_dCore_dTerm.t_Vuna_dCompiler_dCore_dTerm_dTerm Base_dData_dList.t_Base_dData_dList_dList) -> (if ((Base_dData_dList.v_Base_dData_dList_dmemName g) seen) then false else (match ((v_Vuna_dCompiler_dElab_dRepresentation_dfindDtData g) datas) with
  | Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Nothing -> false
  | Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Just (dtb__45) -> ((fun nd_uscrut7 -> (match nd_uscrut7 with
  | Base_dData_dList.C_Base_dData_dList_dList__x58__x58_ (dtb__46, dtb__47) -> (match dtb__47 with
  | Base_dData_dList.C_Base_dData_dList_dList_Nil -> ((fun nd_uscrut12 -> (match nd_uscrut12 with
  | Base_dData_dList.C_Base_dData_dList_dList__x58__x58_ (dtb__48, dtb__49) -> (match dtb__49 with
  | Base_dData_dList.C_Base_dData_dList_dList_Nil -> (if (dtb__48 < (Base_dData_dList.v_Base_dData_dList_dlength (dtb__45).Vuna_dCompiler_dElab_dTypes.f_Vuna_dCompiler_dElab_dTypes_dDtData_dtDataParams)) then false else (if ((Base_dData_dList.v_Base_dData_dList_dlength args) <> (Base_dData_dList.v_Base_dData_dList_dlength (dtb__45).Vuna_dCompiler_dElab_dTypes.f_Vuna_dCompiler_dElab_dTypes_dDtData_dtDataParams)) then true else (match ((v_Vuna_dCompiler_dElab_dRepresentation_dctorFieldDomainTerm dtb__46) dtb__48) with
  | Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Nothing -> true
  | Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Just (dtb__50) -> ((((v_Vuna_dCompiler_dElab_dRepresentation_dtermIsFunctionFuel (fuel - 1)) datas) (Base_dData_dList.C_Base_dData_dList_dList__x58__x58_ (g, seen))) (((v_Vuna_dCompiler_dElab_dRepresentation_dsubstFamArgs dtb__48) args) dtb__50))
  | _ -> failwith "DT: impossible branch"
)))
  | _ -> false
)
  | _ -> false
)) (v_Vuna_dCompiler_dElab_dRepresentation_dkeptIndices (v_Vuna_dCompiler_dElab_dRepresentation_dctorKeepFlags dtb__46)))
  | _ -> false
)
  | _ -> false
)) (Vuna_dCompiler_dElab_dTypes.v_Vuna_dCompiler_dElab_dTypes_ddtDataCtors dtb__45))
  | _ -> failwith "DT: impossible branch"
)))

# 106 "Vuna/Compiler/Elab/Representation.vuna"
let v_Vuna_dCompiler_dElab_dRepresentation_dtermIsFunction = (fun (datas : Vuna_dCompiler_dElab_dTypes.t_Vuna_dCompiler_dElab_dTypes_dDtData Base_dData_dList.t_Base_dData_dList_dList) (t : Vuna_dCompiler_dCore_dTerm.t_Vuna_dCompiler_dCore_dTerm_dTerm) -> ((((v_Vuna_dCompiler_dElab_dRepresentation_dtermIsFunctionFuel 64) datas) Base_dData_dList.C_Base_dData_dList_dList_Nil) t))

# 160 "Vuna/Compiler/Elab/Representation.vuna"
let v_Vuna_dCompiler_dElab_dRepresentation_dreprIsBoxed = (fun (mc0 : Vuna_dCompiler_dFrontend_dAst.t_Vuna_dCompiler_dFrontend_dAst_dReprTier) -> (match mc0 with
  | Vuna_dCompiler_dFrontend_dAst.C_Vuna_dCompiler_dFrontend_dAst_dReprTier_ReprBoxed -> true
  | _ -> false
))

# 168 "Vuna/Compiler/Elab/Representation.vuna"
let v_Vuna_dCompiler_dElab_dRepresentation_dunboxedCandidateOfData = (fun (datas : Vuna_dCompiler_dElab_dTypes.t_Vuna_dCompiler_dElab_dTypes_dDtData Base_dData_dList.t_Base_dData_dList_dList) (d : Vuna_dCompiler_dElab_dTypes.t_Vuna_dCompiler_dElab_dTypes_dDtData) -> (if (Base_dData_dBool.v_Base_dData_dBool_dnot (Vuna_dCompiler_dElab_dTypes.v_Vuna_dCompiler_dElab_dTypes_ddtDataIsRecord d)) then Base_dData_dList.C_Base_dData_dList_dList_Nil else (if (v_Vuna_dCompiler_dElab_dRepresentation_disSpecialUnboxFamily (Vuna_dCompiler_dElab_dTypes.v_Vuna_dCompiler_dElab_dTypes_ddtDataName d)) then Base_dData_dList.C_Base_dData_dList_dList_Nil else (if (v_Vuna_dCompiler_dElab_dRepresentation_dreprIsBoxed (Vuna_dCompiler_dElab_dTypes.v_Vuna_dCompiler_dElab_dTypes_ddtDataRepr d)) then Base_dData_dList.C_Base_dData_dList_dList_Nil else (match (Vuna_dCompiler_dElab_dTypes.v_Vuna_dCompiler_dElab_dTypes_ddtDataCtors d) with
  | Base_dData_dList.C_Base_dData_dList_dList_Nil -> Base_dData_dList.C_Base_dData_dList_dList_Nil
  | Base_dData_dList.C_Base_dData_dList_dList__x58__x58_ (dtb__51, dtb__52) -> (match dtb__52 with
  | Base_dData_dList.C_Base_dData_dList_dList_Nil -> (match (v_Vuna_dCompiler_dElab_dRepresentation_dkeptIndices (v_Vuna_dCompiler_dElab_dRepresentation_dctorKeepFlags dtb__51)) with
  | Base_dData_dList.C_Base_dData_dList_dList_Nil -> Base_dData_dList.C_Base_dData_dList_dList_Nil
  | Base_dData_dList.C_Base_dData_dList_dList__x58__x58_ (dtb__53, dtb__54) -> (match dtb__54 with
  | Base_dData_dList.C_Base_dData_dList_dList_Nil -> (if (dtb__53 >= (Base_dData_dList.v_Base_dData_dList_dlength (d).Vuna_dCompiler_dElab_dTypes.f_Vuna_dCompiler_dElab_dTypes_dDtData_dtDataParams)) then (match ((v_Vuna_dCompiler_dElab_dRepresentation_dctorFieldDomainTerm dtb__51) dtb__53) with
  | Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Just (dtb__55) -> (if ((v_Vuna_dCompiler_dElab_dRepresentation_dtermIsFunction datas) dtb__55) then Base_dData_dList.C_Base_dData_dList_dList_Nil else (if ((v_Vuna_dCompiler_dElab_dRepresentation_dtermRepresentable datas) dtb__55) then (Base_dData_dList.C_Base_dData_dList_dList__x58__x58_ ({ f_Vuna_dCompiler_dElab_dRepresentation_dUnboxedCand_unboxedCandName = (Vuna_dCompiler_dElab_dTypes.v_Vuna_dCompiler_dElab_dTypes_ddtDataName d); f_Vuna_dCompiler_dElab_dRepresentation_dUnboxedCand_unboxedCandCtor = dtb__51; f_Vuna_dCompiler_dElab_dRepresentation_dUnboxedCand_unboxedCandIndex = dtb__53 }, Base_dData_dList.C_Base_dData_dList_dList_Nil)) else Base_dData_dList.C_Base_dData_dList_dList_Nil))
  | Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Nothing -> Base_dData_dList.C_Base_dData_dList_dList_Nil
  | _ -> failwith "DT: impossible branch"
) else Base_dData_dList.C_Base_dData_dList_dList_Nil)
  | _ -> Base_dData_dList.C_Base_dData_dList_dList_Nil
)
  | _ -> failwith "DT: impossible branch"
)
  | _ -> Base_dData_dList.C_Base_dData_dList_dList_Nil
)
  | _ -> failwith "DT: impossible branch"
)))))

# 197 "Vuna/Compiler/Elab/Representation.vuna"
let v_Vuna_dCompiler_dElab_dRepresentation_dunboxedCandidates = (fun (datas : Vuna_dCompiler_dElab_dTypes.t_Vuna_dCompiler_dElab_dTypes_dDtData Base_dData_dList.t_Base_dData_dList_dList) -> ((Base_dData_dList.v_Base_dData_dList_dconcatMap (v_Vuna_dCompiler_dElab_dRepresentation_dunboxedCandidateOfData datas)) datas))

# 201 "Vuna/Compiler/Elab/Representation.vuna"
let v_Vuna_dCompiler_dElab_dRepresentation_dcandidateNames = (fun (cands : t_Vuna_dCompiler_dElab_dRepresentation_dUnboxedCand Base_dData_dList.t_Base_dData_dList_dList) -> ((Base_dData_dList.v_Base_dData_dList_dmap v_Vuna_dCompiler_dElab_dRepresentation_dunboxedCandName) cands))

# 210 "Vuna/Compiler/Elab/Representation.vuna"
let v_Vuna_dCompiler_dElab_dRepresentation_dcandidateRefs = (fun (datas : Vuna_dCompiler_dElab_dTypes.t_Vuna_dCompiler_dElab_dTypes_dDtData Base_dData_dList.t_Base_dData_dList_dList) (names : string Base_dData_dList.t_Base_dData_dList_dList) (cand : t_Vuna_dCompiler_dElab_dRepresentation_dUnboxedCand) -> (match ((v_Vuna_dCompiler_dElab_dRepresentation_dctorFieldDomainTerm (v_Vuna_dCompiler_dElab_dRepresentation_dunboxedCandCtor cand)) (v_Vuna_dCompiler_dElab_dRepresentation_dunboxedCandIndex cand)) with
  | Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Just (dtb__56) -> ((Base_dData_dList.v_Base_dData_dList_dfilter (fun (n : string) -> ((Base_dData_dList.v_Base_dData_dList_dmemName n) names))) (Vuna_dCompiler_dCore_dTerm.v_Vuna_dCompiler_dCore_dTerm_dtermGlobalNames dtb__56))
  | Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Nothing -> Base_dData_dList.C_Base_dData_dList_dList_Nil
  | _ -> failwith "DT: impossible branch"
))

# 205 "Vuna/Compiler/Elab/Representation.vuna"
let v_Vuna_dCompiler_dElab_dRepresentation_dcandidateEdges = (fun (datas : Vuna_dCompiler_dElab_dTypes.t_Vuna_dCompiler_dElab_dTypes_dDtData Base_dData_dList.t_Base_dData_dList_dList) (names : string Base_dData_dList.t_Base_dData_dList_dList) (cands : t_Vuna_dCompiler_dElab_dRepresentation_dUnboxedCand Base_dData_dList.t_Base_dData_dList_dList) -> ((Base_dData_dList.v_Base_dData_dList_dmap (fun (cand : t_Vuna_dCompiler_dElab_dRepresentation_dUnboxedCand) -> { Base_dData_dPair.f_Base_dData_dPair_dPair_first = (v_Vuna_dCompiler_dElab_dRepresentation_dunboxedCandName cand); Base_dData_dPair.f_Base_dData_dPair_dPair_second = (((v_Vuna_dCompiler_dElab_dRepresentation_dcandidateRefs datas) names) cand) })) cands))

# 217 "Vuna/Compiler/Elab/Representation.vuna"
let rec v_Vuna_dCompiler_dElab_dRepresentation_dlookupNeighbors = (fun (mc0 : string) (mc1 : (string, string Base_dData_dList.t_Base_dData_dList_dList) Base_dData_dPair.t_Base_dData_dPair_dPair Base_dData_dList.t_Base_dData_dList_dList) -> (match mc1 with
  | Base_dData_dList.C_Base_dData_dList_dList__x58__x58_ (dtb__57, dtb__58) -> (if ((Base_dData_dPair.v_Base_dData_dPair_dfirstOf dtb__57) = mc0) then (Base_dData_dPair.v_Base_dData_dPair_dsecondOf dtb__57) else ((v_Vuna_dCompiler_dElab_dRepresentation_dlookupNeighbors mc0) dtb__58))
  | Base_dData_dList.C_Base_dData_dList_dList_Nil -> Base_dData_dList.C_Base_dData_dList_dList_Nil
  | _ -> failwith "DT: impossible branch"
))

# 223 "Vuna/Compiler/Elab/Representation.vuna"
let rec v_Vuna_dCompiler_dElab_dRepresentation_dreachesBackTo = (fun (fuel : int) (edges : (string, string Base_dData_dList.t_Base_dData_dList_dList) Base_dData_dPair.t_Base_dData_dPair_dPair Base_dData_dList.t_Base_dData_dList_dList) (visited : string Base_dData_dList.t_Base_dData_dList_dList) (target : string) (node : string) -> (if (fuel <= 0) then true else (((((v_Vuna_dCompiler_dElab_dRepresentation_danyReachBack (fuel - 1)) edges) visited) target) ((v_Vuna_dCompiler_dElab_dRepresentation_dlookupNeighbors node) edges))))
# 231 "Vuna/Compiler/Elab/Representation.vuna"
and v_Vuna_dCompiler_dElab_dRepresentation_danyReachBack = (fun (mc0 : int) (mc1 : (string, string Base_dData_dList.t_Base_dData_dList_dList) Base_dData_dPair.t_Base_dData_dPair_dPair Base_dData_dList.t_Base_dData_dList_dList) (mc2 : string Base_dData_dList.t_Base_dData_dList_dList) (mc3 : string) (mc4 : string Base_dData_dList.t_Base_dData_dList_dList) -> (match mc4 with
  | Base_dData_dList.C_Base_dData_dList_dList__x58__x58_ (dtb__59, dtb__60) -> (if (dtb__59 = mc3) then true else (if ((Base_dData_dList.v_Base_dData_dList_dmemName dtb__59) mc2) then (((((v_Vuna_dCompiler_dElab_dRepresentation_danyReachBack mc0) mc1) mc2) mc3) dtb__60) else (if (mc0 <= 0) then true else (if (((((v_Vuna_dCompiler_dElab_dRepresentation_dreachesBackTo (mc0 - 1)) mc1) (Base_dData_dList.C_Base_dData_dList_dList__x58__x58_ (dtb__59, mc2))) mc3) dtb__59) then true else (((((v_Vuna_dCompiler_dElab_dRepresentation_danyReachBack (mc0 - 1)) mc1) mc2) mc3) dtb__60)))))
  | Base_dData_dList.C_Base_dData_dList_dList_Nil -> false
  | _ -> failwith "DT: impossible branch"
))

# 246 "Vuna/Compiler/Elab/Representation.vuna"
let v_Vuna_dCompiler_dElab_dRepresentation_dunboxedInfoOf = (fun (datas : Vuna_dCompiler_dElab_dTypes.t_Vuna_dCompiler_dElab_dTypes_dDtData Base_dData_dList.t_Base_dData_dList_dList) -> ((fun cands -> ((fun names -> ((fun edges -> ((fun fuel -> ((Base_dData_dList.v_Base_dData_dList_dmap (fun (cand : t_Vuna_dCompiler_dElab_dRepresentation_dUnboxedCand) -> { Base_dData_dPair.f_Base_dData_dPair_dPair_first = (v_Vuna_dCompiler_dElab_dRepresentation_dunboxedCandName cand); Base_dData_dPair.f_Base_dData_dPair_dPair_second = { Base_dData_dPair.f_Base_dData_dPair_dPair_first = (v_Vuna_dCompiler_dElab_dRepresentation_dunboxedCandCtor cand); Base_dData_dPair.f_Base_dData_dPair_dPair_second = (v_Vuna_dCompiler_dElab_dRepresentation_dunboxedCandIndex cand) } })) ((Base_dData_dList.v_Base_dData_dList_dfilter (fun (cand : t_Vuna_dCompiler_dElab_dRepresentation_dUnboxedCand) -> (Base_dData_dBool.v_Base_dData_dBool_dnot (((((v_Vuna_dCompiler_dElab_dRepresentation_dreachesBackTo fuel) edges) (Base_dData_dList.C_Base_dData_dList_dList__x58__x58_ ((v_Vuna_dCompiler_dElab_dRepresentation_dunboxedCandName cand), Base_dData_dList.C_Base_dData_dList_dList_Nil))) (v_Vuna_dCompiler_dElab_dRepresentation_dunboxedCandName cand)) (v_Vuna_dCompiler_dElab_dRepresentation_dunboxedCandName cand))))) cands))) (bi_natAdd (Base_dData_dList.v_Base_dData_dList_dlength names) 2))) (((v_Vuna_dCompiler_dElab_dRepresentation_dcandidateEdges datas) names) cands))) (v_Vuna_dCompiler_dElab_dRepresentation_dcandidateNames cands))) (v_Vuna_dCompiler_dElab_dRepresentation_dunboxedCandidates datas)))

# 258 "Vuna/Compiler/Elab/Representation.vuna"
let v_Vuna_dCompiler_dElab_dRepresentation_dunboxedFamilySet = (fun (datas : Vuna_dCompiler_dElab_dTypes.t_Vuna_dCompiler_dElab_dTypes_dDtData Base_dData_dList.t_Base_dData_dList_dList) -> ((Base_dData_dList.v_Base_dData_dList_dmap Base_dData_dPair.v_Base_dData_dPair_dfirstOf) (v_Vuna_dCompiler_dElab_dRepresentation_dunboxedInfoOf datas)))

# 262 "Vuna/Compiler/Elab/Representation.vuna"
let rec v_Vuna_dCompiler_dElab_dRepresentation_dlookupUnboxedInfo = (fun (mc0 : string) (mc1 : (string, (Vuna_dCompiler_dElab_dTypes.t_Vuna_dCompiler_dElab_dTypes_dDtCtor, int) Base_dData_dPair.t_Base_dData_dPair_dPair) Base_dData_dPair.t_Base_dData_dPair_dPair Base_dData_dList.t_Base_dData_dList_dList) -> (match mc1 with
  | Base_dData_dList.C_Base_dData_dList_dList__x58__x58_ (dtb__61, dtb__62) -> (if ((Base_dData_dPair.v_Base_dData_dPair_dfirstOf dtb__61) = mc0) then (Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Just ((Base_dData_dPair.v_Base_dData_dPair_dsecondOf dtb__61))) else ((v_Vuna_dCompiler_dElab_dRepresentation_dlookupUnboxedInfo mc0) dtb__62))
  | Base_dData_dList.C_Base_dData_dList_dList_Nil -> Base_dData_dMaybe.C_Base_dData_dMaybe_dMaybe_Nothing
  | _ -> failwith "DT: impossible branch"
))
