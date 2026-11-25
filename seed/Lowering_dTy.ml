open Vuna_runtime
# 46 "Vuna/Compiler/Lowering/Ty.vuna"
let v_reprTyIr = (fun (name : string) -> (if (name = Base_dIntrinsics.v_intTypeName) then (B_dData_dMaybe.C_Maybe_Just (Vuna_dIr_dModel.C_IrTy_IrTyInt)) else (if (name = Base_dIntrinsics.v_strTypeName) then (B_dData_dMaybe.C_Maybe_Just (Vuna_dIr_dModel.C_IrTy_IrTyStr)) else (if (name = Base_dIntrinsics.v_floatTypeName) then (B_dData_dMaybe.C_Maybe_Just (Vuna_dIr_dModel.C_IrTy_IrTyFloat)) else (let nd_uscrut1 = (Base_dIntrinsics.v_canonicalReprOf name) in (match nd_uscrut1 with
  | B_dData_dMaybe.C_Maybe_Just (dtb__0) -> (match dtb__0 with
  | Base_dIntrinsics.C_FamilyRepr_FamReprBool -> (B_dData_dMaybe.C_Maybe_Just (Vuna_dIr_dModel.C_IrTy_IrTyBool))
  | Base_dIntrinsics.C_FamilyRepr_FamReprNat -> (B_dData_dMaybe.C_Maybe_Just (Vuna_dIr_dModel.C_IrTy_IrTyInt))
  | _ -> B_dData_dMaybe.C_Maybe_Nothing
)
  | _ -> B_dData_dMaybe.C_Maybe_Nothing
))))))

# 78 "Vuna/Compiler/Lowering/Ty.vuna"
let v_renderTyIntrinsicWith = (fun (render : (Core_dTerm.t_Value) -> Vuna_dIr_dModel.t_IrTy) (g : string) (args : Core_dTerm.t_Value B_dData_dList.t_List) -> (if (g = Base_dIntrinsics.v_arrayTypeName) then (let nd_uscrut3 = args in (match nd_uscrut3 with
  | B_dData_dList.C_List__x58__x58_ (dtb__1, dtb__2) -> (match dtb__2 with
  | B_dData_dList.C_List_Nil -> (B_dData_dMaybe.C_Maybe_Just ((Vuna_dIr_dModel.C_IrTy_IrTyArray ((render dtb__1)))))
  | _ -> B_dData_dMaybe.C_Maybe_Nothing
)
  | _ -> B_dData_dMaybe.C_Maybe_Nothing
)) else (if (g = Base_dIntrinsics.v_cellTypeName) then (let nd_uscrut3 = args in (match nd_uscrut3 with
  | B_dData_dList.C_List__x58__x58_ (dtb__3, dtb__4) -> (match dtb__4 with
  | B_dData_dList.C_List_Nil -> (B_dData_dMaybe.C_Maybe_Just ((Vuna_dIr_dModel.C_IrTy_IrTyRef ((render dtb__3)))))
  | _ -> B_dData_dMaybe.C_Maybe_Nothing
)
  | _ -> B_dData_dMaybe.C_Maybe_Nothing
)) else (if (g = Base_dIntrinsics.v_marrayTypeName) then (let nd_uscrut3 = args in (match nd_uscrut3 with
  | B_dData_dList.C_List__x58__x58_ (dtb__5, dtb__6) -> (match dtb__6 with
  | B_dData_dList.C_List_Nil -> (B_dData_dMaybe.C_Maybe_Just ((Vuna_dIr_dModel.C_IrTy_IrTyArray ((render dtb__5)))))
  | _ -> B_dData_dMaybe.C_Maybe_Nothing
)
  | _ -> B_dData_dMaybe.C_Maybe_Nothing
)) else (if (g = Base_dIntrinsics.v_mdynArrayTypeName) then (let nd_uscrut3 = args in (match nd_uscrut3 with
  | B_dData_dList.C_List__x58__x58_ (dtb__7, dtb__8) -> (match dtb__8 with
  | B_dData_dList.C_List_Nil -> (B_dData_dMaybe.C_Maybe_Just ((Vuna_dIr_dModel.C_IrTy_IrTyRef (Vuna_dIr_dModel.C_IrTy_IrTyOpaque))))
  | _ -> B_dData_dMaybe.C_Maybe_Nothing
)
  | _ -> B_dData_dMaybe.C_Maybe_Nothing
)) else (if (g = Base_dIntrinsics.v_mbufferTypeName) then (match args with
  | B_dData_dList.C_List_Nil -> (B_dData_dMaybe.C_Maybe_Just ((Vuna_dIr_dModel.C_IrTy_IrTyRef (Vuna_dIr_dModel.C_IrTy_IrTyOpaque))))
  | _ -> B_dData_dMaybe.C_Maybe_Nothing
) else (if (g = Base_dIntrinsics.v_threadTypeName) then (let nd_uscrut3 = args in (match nd_uscrut3 with
  | B_dData_dList.C_List__x58__x58_ (dtb__9, dtb__10) -> (match dtb__10 with
  | B_dData_dList.C_List_Nil -> (B_dData_dMaybe.C_Maybe_Just (Vuna_dIr_dModel.C_IrTy_IrTyOpaque))
  | _ -> B_dData_dMaybe.C_Maybe_Nothing
)
  | _ -> B_dData_dMaybe.C_Maybe_Nothing
)) else (if (g = Base_dIntrinsics.v_mutexTypeName) then (match args with
  | B_dData_dList.C_List_Nil -> (B_dData_dMaybe.C_Maybe_Just (Vuna_dIr_dModel.C_IrTy_IrTyOpaque))
  | _ -> B_dData_dMaybe.C_Maybe_Nothing
) else (if (g = Base_dIntrinsics.v_condvarTypeName) then (match args with
  | B_dData_dList.C_List_Nil -> (B_dData_dMaybe.C_Maybe_Just (Vuna_dIr_dModel.C_IrTy_IrTyOpaque))
  | _ -> B_dData_dMaybe.C_Maybe_Nothing
) else (if (g = Base_dIntrinsics.v_atomicTypeName) then (match args with
  | B_dData_dList.C_List_Nil -> (B_dData_dMaybe.C_Maybe_Just (Vuna_dIr_dModel.C_IrTy_IrTyOpaque))
  | _ -> B_dData_dMaybe.C_Maybe_Nothing
) else B_dData_dMaybe.C_Maybe_Nothing))))))))))

# 29 "Vuna/Compiler/Lowering/Ty.vuna"
let rec v_renderTyFuel = (fun (fuel : int) (levels : int B_dData_dList.t_List) (table : (string, int B_dData_dList.t_List) B_dContainer_dHashMap.t_HashMap) (dataTbl : (string, Elab_dTypes.t_DtData) B_dContainer_dHashMap.t_HashMap) (v : Core_dTerm.t_Value) -> (if (fuel <= 0) then Vuna_dIr_dModel.C_IrTy_IrTyOpaque else (match v with
  | Core_dTerm.C_Value_VNeutral (dtb__11) -> (match dtb__11 with
  | Core_dTerm.C_Neutral_NVar (dtb__12, dtb__13, dtb__14) -> (match ((Lowering_dEnv.v_levelSlotIn levels) dtb__13) with
  | B_dData_dMaybe.C_Maybe_Just (dtb__15) -> (Vuna_dIr_dModel.C_IrTy_IrTyVar (dtb__15))
  | B_dData_dMaybe.C_Maybe_Nothing -> Vuna_dIr_dModel.C_IrTy_IrTyOpaque
  | _ -> failwith "DT: impossible branch"
)
  | Core_dTerm.C_Neutral_NGlobal (dtb__16, dtb__17) -> ((((((v_renderTyGlobal fuel) levels) table) dataTbl) dtb__16) dtb__17)
  | _ -> failwith "DT: impossible branch"
)
  | _ -> Vuna_dIr_dModel.C_IrTy_IrTyOpaque
)))
# 60 "Vuna/Compiler/Lowering/Ty.vuna"
and v_renderTyGlobal = (fun (fuel : int) (levels : int B_dData_dList.t_List) (table : (string, int B_dData_dList.t_List) B_dContainer_dHashMap.t_HashMap) (dataTbl : (string, Elab_dTypes.t_DtData) B_dContainer_dHashMap.t_HashMap) (g : string) (sp : Core_dTerm.t_Value B_dData_dList.t_List) -> (match (((v_renderTyIntrinsicWith (fun (x : Core_dTerm.t_Value) -> (((((v_renderTyFuel (fuel - 1)) levels) table) dataTbl) x))) g) sp) with
  | B_dData_dMaybe.C_Maybe_Just (dtb__18) -> dtb__18
  | B_dData_dMaybe.C_Maybe_Nothing -> (match (v_reprTyIr g) with
  | B_dData_dMaybe.C_Maybe_Just (dtb__19) -> dtb__19
  | B_dData_dMaybe.C_Maybe_Nothing -> (if ((((B_dContainer_dHashMap.v_member B_dData_dString.v_Hashable_ue4b0f10b020a5e82_uString) B_dData_dString.v_Eq_u018fc178ff3df1b4_uString) g) dataTbl) then (Vuna_dIr_dModel.C_IrTy_IrTyData (g, ((((((v_renderFamilyArgs (fuel - 1)) levels) table) dataTbl) ((Lowering_dEnv.v_lookupTyParamsIn table) g)) sp))) else Vuna_dIr_dModel.C_IrTy_IrTyOpaque)
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
))
# 119 "Vuna/Compiler/Lowering/Ty.vuna"
and v_renderFamilyArgs = (fun (fuel : int) (levels : int B_dData_dList.t_List) (table : (string, int B_dData_dList.t_List) B_dContainer_dHashMap.t_HashMap) (dataTbl : (string, Elab_dTypes.t_DtData) B_dContainer_dHashMap.t_HashMap) (usedPats : int B_dData_dList.t_List) (args : Core_dTerm.t_Value B_dData_dList.t_List) -> (if (fuel <= 0) then B_dData_dList.C_List_Nil else (match usedPats with
  | B_dData_dList.C_List_Nil -> B_dData_dList.C_List_Nil
  | B_dData_dList.C_List__x58__x58_ (dtb__20, dtb__21) -> (match ((Lowering_dEnv.v_nthValueIn args) dtb__20) with
  | B_dData_dMaybe.C_Maybe_Just (dtb__22) -> (B_dData_dList.C_List__x58__x58_ ((((((v_renderTyFuel (fuel - 1)) levels) table) dataTbl) dtb__22), ((((((v_renderFamilyArgs (fuel - 1)) levels) table) dataTbl) dtb__21) args)))
  | B_dData_dMaybe.C_Maybe_Nothing -> (B_dData_dList.C_List__x58__x58_ (Vuna_dIr_dModel.C_IrTy_IrTyOpaque, ((((((v_renderFamilyArgs (fuel - 1)) levels) table) dataTbl) dtb__21) args)))
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
)))

# 26 "Vuna/Compiler/Lowering/Ty.vuna"
let v_renderTyOf = (fun (levels : int B_dData_dList.t_List) (table : (string, int B_dData_dList.t_List) B_dContainer_dHashMap.t_HashMap) (dataTbl : (string, Elab_dTypes.t_DtData) B_dContainer_dHashMap.t_HashMap) (v : Core_dTerm.t_Value) -> (((((v_renderTyFuel 256) levels) table) dataTbl) v))

# 138 "Vuna/Compiler/Lowering/Ty.vuna"
let rec v_renderPiTyFuel = (fun (fuel : int) (levels : int B_dData_dList.t_List) (table : (string, int B_dData_dList.t_List) B_dContainer_dHashMap.t_HashMap) (dataTbl : (string, Elab_dTypes.t_DtData) B_dContainer_dHashMap.t_HashMap) (lvl : int) (v : Core_dTerm.t_Value) -> (if (fuel <= 0) then (((((v_renderTyFuel fuel) levels) table) dataTbl) v) else (match v with
  | Core_dTerm.C_Value_VPi (dtb__23, dtb__24, dtb__25, dtb__26, dtb__27) -> (let next = ((Core_dEval.v_applyClosure dtb__27) (Core_dTerm.C_Value_VNeutral ((Core_dTerm.C_Neutral_NVar (dtb__23, lvl, B_dData_dList.C_List_Nil))))) in (if (Core_dTerm.v_rigIsErased dtb__25) then ((((((v_renderPiTyFuel (fuel - 1)) levels) table) dataTbl) (lvl + 1)) next) else (Vuna_dIr_dModel.C_IrTy_IrTyFun (((((((v_renderPiTyFuel (fuel - 1)) levels) table) dataTbl) lvl) dtb__26), ((((((v_renderPiTyFuel (fuel - 1)) levels) table) dataTbl) (lvl + 1)) next)))))
  | _ -> (((((v_renderTyFuel fuel) levels) table) dataTbl) v)
)))

# 135 "Vuna/Compiler/Lowering/Ty.vuna"
let v_renderPiTy = (fun (levels : int B_dData_dList.t_List) (table : (string, int B_dData_dList.t_List) B_dContainer_dHashMap.t_HashMap) (dataTbl : (string, Elab_dTypes.t_DtData) B_dContainer_dHashMap.t_HashMap) (lvl : int) (v : Core_dTerm.t_Value) -> ((((((v_renderPiTyFuel 256) levels) table) dataTbl) lvl) v))

# 153 "Vuna/Compiler/Lowering/Ty.vuna"
let v_renderFieldTy = (fun (mc0 : int B_dData_dList.t_List) (mc1 : (string, int B_dData_dList.t_List) B_dContainer_dHashMap.t_HashMap) (mc2 : (string, Elab_dTypes.t_DtData) B_dContainer_dHashMap.t_HashMap) (mc3 : int) (mc4 : Core_dTerm.t_Value) (mc5 : int) -> (match mc4 with
  | Core_dTerm.C_Value_VNeutral (dtb__28) -> (match dtb__28 with
  | Core_dTerm.C_Neutral_NVar (dtb__29, dtb__30, dtb__31) -> (match ((Lowering_dEnv.v_levelSlotIn mc0) dtb__30) with
  | B_dData_dMaybe.C_Maybe_Just (dtb__32) -> (Base_dDiag.C_Check_OkC ({ B_dData_dPair.f_Pair_first = (Vuna_dIr_dModel.C_IrTy_IrTyVar (dtb__32)); B_dData_dPair.f_Pair_second = mc5 }))
  | B_dData_dMaybe.C_Maybe_Nothing -> (Base_dDiag.v_icInternal "constructor field type mentions a type variable outside the family's runtime parameter slots")
  | _ -> failwith "DT: impossible branch"
)
  | Core_dTerm.C_Neutral_NGlobal (dtb__33, dtb__34) -> (match (((v_renderTyIntrinsicWith (fun (x : Core_dTerm.t_Value) -> (((((v_renderTyFuel 256) mc0) mc1) mc2) x))) dtb__33) dtb__34) with
  | B_dData_dMaybe.C_Maybe_Just (dtb__35) -> (Base_dDiag.C_Check_OkC ({ B_dData_dPair.f_Pair_first = dtb__35; B_dData_dPair.f_Pair_second = mc5 }))
  | B_dData_dMaybe.C_Maybe_Nothing -> (match (v_reprTyIr dtb__33) with
  | B_dData_dMaybe.C_Maybe_Just (dtb__36) -> (Base_dDiag.C_Check_OkC ({ B_dData_dPair.f_Pair_first = dtb__36; B_dData_dPair.f_Pair_second = mc5 }))
  | B_dData_dMaybe.C_Maybe_Nothing -> (if ((((B_dContainer_dHashMap.v_member B_dData_dString.v_Hashable_ue4b0f10b020a5e82_uString) B_dData_dString.v_Eq_u018fc178ff3df1b4_uString) dtb__33) mc2) then (Base_dDiag.C_Check_OkC ({ B_dData_dPair.f_Pair_first = (Vuna_dIr_dModel.C_IrTy_IrTyData (dtb__33, ((((((v_renderFamilyArgs 256) mc0) mc1) mc2) ((Lowering_dEnv.v_lookupTyParamsIn mc1) dtb__33)) dtb__34))); B_dData_dPair.f_Pair_second = mc5 })) else (Base_dDiag.v_icInternal ("constructor field type head is not a known family: " ^ dtb__33)))
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
)
  | Core_dTerm.C_Value_VPi (dtb__37, dtb__38, dtb__39, dtb__40, dtb__41) -> (if dtb__38 then (Base_dDiag.C_Check_OkC ({ B_dData_dPair.f_Pair_first = (Vuna_dIr_dModel.C_IrTy_IrTyVar (mc5)); B_dData_dPair.f_Pair_second = (mc5 + 1) })) else (Base_dDiag.C_Check_OkC ({ B_dData_dPair.f_Pair_first = (((((v_renderPiTy mc0) mc1) mc2) mc3) mc4); B_dData_dPair.f_Pair_second = mc5 })))
  | _ -> (Base_dDiag.v_icInternal "constructor field type has no runtime rendering")
))

# 182 "Vuna/Compiler/Lowering/Ty.vuna"
let v_flagMatchesRigIn = (fun (mc0 : bool) (mc1 : Core_dTerm.t_Rig) -> (if mc0 then (B_dData_dBool.v_not (Core_dTerm.v_rigIsErased mc1)) else (Core_dTerm.v_rigIsErased mc1)))

# 187 "Vuna/Compiler/Lowering/Ty.vuna"
let rec v_ctorFieldTys = (fun (mc0 : int B_dData_dList.t_List) (mc1 : (string, int B_dData_dList.t_List) B_dContainer_dHashMap.t_HashMap) (mc2 : (string, Elab_dTypes.t_DtData) B_dContainer_dHashMap.t_HashMap) (mc3 : bool B_dData_dList.t_List) (mc4 : bool B_dData_dList.t_List) (mc5 : (string, Core_dTerm.t_Rig) B_dData_dPair.t_Pair B_dData_dList.t_List) (mc6 : int) (mc7 : Core_dTerm.t_Value) (mc8 : int) -> (match mc3 with
  | B_dData_dList.C_List__x58__x58_ (dtb__42, dtb__43) -> (match mc4 with
  | B_dData_dList.C_List__x58__x58_ (dtb__44, dtb__45) -> (match mc5 with
  | B_dData_dList.C_List__x58__x58_ (dtb__46, dtb__47) -> (match dtb__46 with
  | { B_dData_dPair.f_Pair_first = dtb__48; B_dData_dPair.f_Pair_second = dtb__49 } -> (if ((v_flagMatchesRigIn dtb__42) dtb__49) then (match mc7 with
  | Core_dTerm.C_Value_VPi (dtb__50, dtb__51, dtb__52, dtb__53, dtb__54) -> (let next = ((Core_dEval.v_applyClosure dtb__54) (Core_dTerm.C_Value_VNeutral ((Core_dTerm.C_Neutral_NVar (dtb__50, mc6, B_dData_dList.C_List_Nil))))) in (if dtb__42 then (if dtb__44 then ((Base_dCommon.v_bind (((((((((v_ctorFieldTys mc0) mc1) mc2) dtb__43) dtb__45) dtb__47) (mc6 + 1)) next) mc8)) (fun (p : (Vuna_dIr_dModel.t_IrTy B_dData_dList.t_List, int) B_dData_dPair.t_Pair) -> (match p with
  | { B_dData_dPair.f_Pair_first = dtb__55; B_dData_dPair.f_Pair_second = dtb__56 } -> (Base_dDiag.C_Check_OkC ({ B_dData_dPair.f_Pair_first = (B_dData_dList.C_List__x58__x58_ (Vuna_dIr_dModel.C_IrTy_IrTyOpaque, dtb__55)); B_dData_dPair.f_Pair_second = dtb__56 }))
  | _ -> failwith "DT: impossible branch"
))) else ((Base_dCommon.v_bind ((((((v_renderFieldTy mc0) mc1) mc2) mc6) dtb__53) mc8)) (fun (p : (Vuna_dIr_dModel.t_IrTy, int) B_dData_dPair.t_Pair) -> (match p with
  | { B_dData_dPair.f_Pair_first = dtb__57; B_dData_dPair.f_Pair_second = dtb__58 } -> ((Base_dCommon.v_bind (((((((((v_ctorFieldTys mc0) mc1) mc2) dtb__43) dtb__45) dtb__47) (mc6 + 1)) next) dtb__58)) (fun (q : (Vuna_dIr_dModel.t_IrTy B_dData_dList.t_List, int) B_dData_dPair.t_Pair) -> (match q with
  | { B_dData_dPair.f_Pair_first = dtb__59; B_dData_dPair.f_Pair_second = dtb__60 } -> (Base_dDiag.C_Check_OkC ({ B_dData_dPair.f_Pair_first = (B_dData_dList.C_List__x58__x58_ (dtb__57, dtb__59)); B_dData_dPair.f_Pair_second = dtb__60 }))
  | _ -> failwith "DT: impossible branch"
)))
  | _ -> failwith "DT: impossible branch"
)))) else (((((((((v_ctorFieldTys mc0) mc1) mc2) dtb__43) dtb__45) dtb__47) (mc6 + 1)) next) mc8)))
  | _ -> (Base_dDiag.v_icInternal "constructor telescope does not match its type")
) else (Base_dDiag.v_icInternal "constructor keep flag disagrees with telescope rig"))
  | _ -> failwith "DT: impossible branch"
)
  | B_dData_dList.C_List_Nil -> (Base_dDiag.C_Check_OkC ({ B_dData_dPair.f_Pair_first = B_dData_dList.C_List_Nil; B_dData_dPair.f_Pair_second = mc8 }))
  | _ -> failwith "DT: impossible branch"
)
  | B_dData_dList.C_List_Nil -> (match mc5 with
  | B_dData_dList.C_List__x58__x58_ (dtb__61, dtb__62) -> (Base_dDiag.v_icInternal "constructor opaque flags shorter than its shape")
  | B_dData_dList.C_List_Nil -> (Base_dDiag.C_Check_OkC ({ B_dData_dPair.f_Pair_first = B_dData_dList.C_List_Nil; B_dData_dPair.f_Pair_second = mc8 }))
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
)
  | B_dData_dList.C_List_Nil -> (match mc4 with
  | B_dData_dList.C_List_Nil -> (match mc5 with
  | B_dData_dList.C_List__x58__x58_ (dtb__63, dtb__64) -> (Base_dDiag.v_icInternal "constructor shape has more binders than its telescope")
  | B_dData_dList.C_List_Nil -> (Base_dDiag.C_Check_OkC ({ B_dData_dPair.f_Pair_first = B_dData_dList.C_List_Nil; B_dData_dPair.f_Pair_second = mc8 }))
  | _ -> failwith "DT: impossible branch"
)
  | B_dData_dList.C_List__x58__x58_ (dtb__65, dtb__66) -> (match mc5 with
  | B_dData_dList.C_List_Nil -> (Base_dDiag.C_Check_OkC ({ B_dData_dPair.f_Pair_first = B_dData_dList.C_List_Nil; B_dData_dPair.f_Pair_second = mc8 }))
  | _ -> (Base_dDiag.v_icInternal "constructor opaque flags longer than its shape")
)
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
))

# 226 "Vuna/Compiler/Lowering/Ty.vuna"
let v_ctorArityNeed = (fun (dataTbl : (string, Elab_dTypes.t_DtData) B_dContainer_dHashMap.t_HashMap) (levels : int B_dData_dList.t_List) (table : (string, int B_dData_dList.t_List) B_dContainer_dHashMap.t_HashMap) (datas : Elab_dTypes.t_DtData B_dData_dList.t_List) (c : Elab_dTypes.t_DtCtor) -> ((Base_dCommon.v_bind (((((((((v_ctorFieldTys levels) table) dataTbl) (Elab_dRepresentation.v_ctorKeepFlags c)) ((Lowering_dEnv.v_ctorOpaqueFlagsOf datas) c)) (Elab_dTypes.v_dtCtorTelescope c)) 0) ((Core_dEval.v_eval B_dData_dList.C_List_Nil) (Elab_dTypes.v_dtCtorType c))) (Lowering_dEnv.v_listLength levels))) (fun (p : (Vuna_dIr_dModel.t_IrTy B_dData_dList.t_List, int) B_dData_dPair.t_Pair) -> (Base_dDiag.C_Check_OkC (((B_dData_dPair.v_secondOf p) - (Lowering_dEnv.v_listLength levels)))))))

# 238 "Vuna/Compiler/Lowering/Ty.vuna"
let rec v_maxIntListIn = (fun (mc0 : int B_dData_dList.t_List) -> (match mc0 with
  | B_dData_dList.C_List__x58__x58_ (dtb__67, dtb__68) -> (if (dtb__67 >= (v_maxIntListIn dtb__68)) then dtb__67 else (v_maxIntListIn dtb__68))
  | B_dData_dList.C_List_Nil -> 0
  | _ -> failwith "DT: impossible branch"
))

# 232 "Vuna/Compiler/Lowering/Ty.vuna"
let v_dataArityNeed = (fun (dataTbl : (string, Elab_dTypes.t_DtData) B_dContainer_dHashMap.t_HashMap) (levels : int B_dData_dList.t_List) (table : (string, int B_dData_dList.t_List) B_dContainer_dHashMap.t_HashMap) (datas : Elab_dTypes.t_DtData B_dData_dList.t_List) (ctors : Elab_dTypes.t_DtCtor B_dData_dList.t_List) -> ((Base_dCommon.v_bind ((Base_dCommon.v_traverse ((((v_ctorArityNeed dataTbl) levels) table) datas)) ctors)) (fun (ns : int B_dData_dList.t_List) -> (Base_dDiag.C_Check_OkC (((Lowering_dEnv.v_listLength levels) + (v_maxIntListIn ns)))))))

# 258 "Vuna/Compiler/Lowering/Ty.vuna"
let v_tempAnnotBinderId = (0 - 1)

# 323 "Vuna/Compiler/Lowering/Ty.vuna"
let rec v_binderTyAtIn = (fun (mc0 : int) (mc1 : Vuna_dIr_dModel.t_IrBinder B_dData_dList.t_List) -> (match mc1 with
  | B_dData_dList.C_List__x58__x58_ (dtb__69, dtb__70) -> (if (mc0 <= 0) then (if (dtb__69).Vuna_dIr_dModel.f_IrBinder_irBinderErased then B_dData_dMaybe.C_Maybe_Nothing else (dtb__69).Vuna_dIr_dModel.f_IrBinder_irBinderTy) else ((v_binderTyAtIn (mc0 - 1)) dtb__70))
  | B_dData_dList.C_List_Nil -> B_dData_dMaybe.C_Maybe_Nothing
  | _ -> failwith "DT: impossible branch"
))

# 332 "Vuna/Compiler/Lowering/Ty.vuna"
let rec v_flattenAnnotAppGo = (fun (mc0 : Core_dTerm.t_Term) (mc1 : Core_dTerm.t_Term B_dData_dList.t_List) -> (match mc0 with
  | Core_dTerm.C_Term_TRecord (dtb__71, dtb__72) -> { B_dData_dPair.f_Pair_first = (Core_dTerm.C_Term_TGlobal (dtb__71)); B_dData_dPair.f_Pair_second = ((B_dData_dList.v_append ((B_dData_dList.v_map B_dData_dPair.v_firstOf) dtb__72)) mc1) }
  | Core_dTerm.C_Term_TApp (dtb__73, dtb__74, dtb__75) -> ((v_flattenAnnotAppGo dtb__73) (B_dData_dList.C_List__x58__x58_ (dtb__74, mc1)))
  | _ -> { B_dData_dPair.f_Pair_first = mc0; B_dData_dPair.f_Pair_second = mc1 }
))

# 329 "Vuna/Compiler/Lowering/Ty.vuna"
let v_flattenAnnotApp = (fun (t : Core_dTerm.t_Term) -> ((v_flattenAnnotAppGo t) B_dData_dList.C_List_Nil))

# 406 "Vuna/Compiler/Lowering/Ty.vuna"
let rec v_binderTyAtRuntime = (fun (mc0 : int) (mc1 : Vuna_dIr_dModel.t_IrBinder B_dData_dList.t_List) -> (match mc1 with
  | B_dData_dList.C_List__x58__x58_ (dtb__76, dtb__77) -> (if (dtb__76).Vuna_dIr_dModel.f_IrBinder_irBinderErased then ((v_binderTyAtRuntime mc0) dtb__77) else (if (mc0 <= 0) then (dtb__76).Vuna_dIr_dModel.f_IrBinder_irBinderTy else ((v_binderTyAtRuntime (mc0 - 1)) dtb__77)))
  | B_dData_dList.C_List_Nil -> B_dData_dMaybe.C_Maybe_Nothing
  | _ -> failwith "DT: impossible branch"
))

# 444 "Vuna/Compiler/Lowering/Ty.vuna"
let v_globalTyTermOf = (fun (env : Lowering_dEnv.t_LwEnv) (g : string) -> (match ((((B_dContainer_dHashMap.v_lookup B_dData_dString.v_Hashable_ue4b0f10b020a5e82_uString) B_dData_dString.v_Eq_u018fc178ff3df1b4_uString) g) (env).Lowering_dEnv.f_LwEnv_lwDefTbl) with
  | B_dData_dMaybe.C_Maybe_Just (dtb__78) -> (B_dData_dMaybe.C_Maybe_Just ((Elab_dTypes.v_dtDefType dtb__78)))
  | B_dData_dMaybe.C_Maybe_Nothing -> ((((B_dContainer_dHashMap.v_lookup B_dData_dString.v_Hashable_ue4b0f10b020a5e82_uString) B_dData_dString.v_Eq_u018fc178ff3df1b4_uString) g) (env).Lowering_dEnv.f_LwEnv_lwGlobals)
  | _ -> failwith "DT: impossible branch"
))

# 464 "Vuna/Compiler/Lowering/Ty.vuna"
let rec v_flattenAnnotAppRigGo = (fun (mc0 : Core_dTerm.t_Term) (mc1 : (Core_dTerm.t_Term, Core_dTerm.t_Rig) B_dData_dPair.t_Pair B_dData_dList.t_List) -> (match mc0 with
  | Core_dTerm.C_Term_TRecord (dtb__79, dtb__80) -> { B_dData_dPair.f_Pair_first = (Core_dTerm.C_Term_TGlobal (dtb__79)); B_dData_dPair.f_Pair_second = ((B_dData_dList.v_append dtb__80) mc1) }
  | Core_dTerm.C_Term_TApp (dtb__81, dtb__82, dtb__83) -> ((v_flattenAnnotAppRigGo dtb__81) (B_dData_dList.C_List__x58__x58_ ({ B_dData_dPair.f_Pair_first = dtb__82; B_dData_dPair.f_Pair_second = dtb__83 }, mc1)))
  | _ -> { B_dData_dPair.f_Pair_first = mc0; B_dData_dPair.f_Pair_second = mc1 }
))

# 461 "Vuna/Compiler/Lowering/Ty.vuna"
let v_flattenAnnotAppRig = (fun (t : Core_dTerm.t_Term) -> ((v_flattenAnnotAppRigGo t) B_dData_dList.C_List_Nil))

# 469 "Vuna/Compiler/Lowering/Ty.vuna"
let rec v_countRuntimeArgs = (fun (mc0 : (Core_dTerm.t_Term, Core_dTerm.t_Rig) B_dData_dPair.t_Pair B_dData_dList.t_List) -> (match mc0 with
  | B_dData_dList.C_List__x58__x58_ (dtb__84, dtb__85) -> (match dtb__84 with
  | { B_dData_dPair.f_Pair_first = dtb__86; B_dData_dPair.f_Pair_second = dtb__87 } -> (if (Core_dTerm.v_rigIsErased dtb__87) then (v_countRuntimeArgs dtb__85) else (1 + (v_countRuntimeArgs dtb__85)))
  | _ -> failwith "DT: impossible branch"
)
  | B_dData_dList.C_List_Nil -> 0
  | _ -> failwith "DT: impossible branch"
))

# 474 "Vuna/Compiler/Lowering/Ty.vuna"
let rec v_peelIrFuns = (fun (mc0 : int) (mc1 : Vuna_dIr_dModel.t_IrTy B_dData_dMaybe.t_Maybe) -> (match mc1 with
  | B_dData_dMaybe.C_Maybe_Just (dtb__88) -> (if (mc0 <= 0) then (B_dData_dMaybe.C_Maybe_Just (dtb__88)) else (match dtb__88 with
  | Vuna_dIr_dModel.C_IrTy_IrTyFun (dtb__89, dtb__90) -> ((v_peelIrFuns (mc0 - 1)) (B_dData_dMaybe.C_Maybe_Just (dtb__90)))
  | _ -> B_dData_dMaybe.C_Maybe_Nothing
))
  | B_dData_dMaybe.C_Maybe_Nothing -> B_dData_dMaybe.C_Maybe_Nothing
  | _ -> failwith "DT: impossible branch"
))

# 486 "Vuna/Compiler/Lowering/Ty.vuna"
let rec v_peelPiArgsTy = (fun (fuel : int) (env : Lowering_dEnv.t_LwEnv) (v : Core_dTerm.t_Value) (args : (Core_dTerm.t_Term, Core_dTerm.t_Rig) B_dData_dPair.t_Pair B_dData_dList.t_List) -> (if (fuel <= 0) then B_dData_dMaybe.C_Maybe_Nothing else (match v with
  | Core_dTerm.C_Value_VPi (dtb__91, dtb__92, dtb__93, dtb__94, dtb__95) -> (if (Core_dTerm.v_rigIsErased dtb__93) then (let nd_uscrut9 = args in (match nd_uscrut9 with
  | B_dData_dList.C_List_Nil -> (B_dData_dMaybe.C_Maybe_Just ((((((v_renderPiTy B_dData_dList.C_List_Nil) (env).Lowering_dEnv.f_LwEnv_lwTyParams) (env).Lowering_dEnv.f_LwEnv_lwDataTbl) 0) v)))
  | B_dData_dList.C_List__x58__x58_ (dtb__96, dtb__97) -> (match dtb__96 with
  | { B_dData_dPair.f_Pair_first = dtb__98; B_dData_dPair.f_Pair_second = dtb__99 } -> (if (Core_dTerm.v_rigIsErased dtb__99) then ((((v_peelPiArgsTy (fuel - 1)) env) ((Core_dEval.v_applyClosure dtb__95) ((Core_dEval.v_eval B_dData_dList.C_List_Nil) dtb__98))) dtb__97) else ((((v_peelPiArgsTy (fuel - 1)) env) ((Core_dEval.v_applyClosure dtb__95) (Core_dTerm.C_Value_VNeutral ((Core_dTerm.C_Neutral_NVar (dtb__91, 0, B_dData_dList.C_List_Nil)))))) args))
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
)) else (let nd_uscrut9 = args in (match nd_uscrut9 with
  | B_dData_dList.C_List_Nil -> (B_dData_dMaybe.C_Maybe_Just ((((((v_renderPiTy B_dData_dList.C_List_Nil) (env).Lowering_dEnv.f_LwEnv_lwTyParams) (env).Lowering_dEnv.f_LwEnv_lwDataTbl) 0) v)))
  | B_dData_dList.C_List__x58__x58_ (dtb__100, dtb__101) -> (match dtb__100 with
  | { B_dData_dPair.f_Pair_first = dtb__102; B_dData_dPair.f_Pair_second = dtb__103 } -> ((((v_peelPiArgsTy (fuel - 1)) env) ((Core_dEval.v_applyClosure dtb__95) (Core_dTerm.C_Value_VNeutral ((Core_dTerm.C_Neutral_NVar (dtb__91, 0, B_dData_dList.C_List_Nil)))))) dtb__101)
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
)))
  | _ -> (B_dData_dMaybe.C_Maybe_Just ((((((v_renderPiTy B_dData_dList.C_List_Nil) (env).Lowering_dEnv.f_LwEnv_lwTyParams) (env).Lowering_dEnv.f_LwEnv_lwDataTbl) 0) v)))
)))

# 523 "Vuna/Compiler/Lowering/Ty.vuna"
let rec v_nthTermIn = (fun (mc0 : Core_dTerm.t_Term B_dData_dList.t_List) (mc1 : int) -> (match mc0 with
  | B_dData_dList.C_List__x58__x58_ (dtb__104, dtb__105) -> (if (mc1 <= 0) then (B_dData_dMaybe.C_Maybe_Just (dtb__104)) else ((v_nthTermIn dtb__105) (mc1 - 1)))
  | B_dData_dList.C_List_Nil -> B_dData_dMaybe.C_Maybe_Nothing
  | _ -> failwith "DT: impossible branch"
))

# 269 "Vuna/Compiler/Lowering/Ty.vuna"
let rec v_annotTyOfFuel = (fun (fuel : int) (dflt : Vuna_dIr_dModel.t_IrTy B_dData_dMaybe.t_Maybe) (env : Lowering_dEnv.t_LwEnv) (binders : Vuna_dIr_dModel.t_IrBinder B_dData_dList.t_List) (t : Core_dTerm.t_Term) -> (if (fuel <= 0) then dflt else (match t with
  | Core_dTerm.C_Term_TVar (dtb__106, dtb__107, dtb__108) -> (match ((v_binderTyAtIn dtb__107) binders) with
  | B_dData_dMaybe.C_Maybe_Just (dtb__109) -> (B_dData_dMaybe.C_Maybe_Just (dtb__109))
  | B_dData_dMaybe.C_Maybe_Nothing -> dflt
  | _ -> failwith "DT: impossible branch"
)
  | Core_dTerm.C_Term_TGlobal (dtb__110) -> ((((((v_annotHeadTy (fuel - 1)) dflt) env) binders) dtb__110) B_dData_dList.C_List_Nil)
  | Core_dTerm.C_Term_TApp (dtb__111, dtb__112, dtb__113) -> (match (v_flattenAnnotApp t) with
  | { B_dData_dPair.f_Pair_first = dtb__114; B_dData_dPair.f_Pair_second = dtb__115 } -> (match dtb__114 with
  | Core_dTerm.C_Term_TGlobal (dtb__116) -> ((((((v_annotHeadTy (fuel - 1)) dflt) env) binders) dtb__116) dtb__115)
  | _ -> dflt
)
  | _ -> failwith "DT: impossible branch"
)
  | Core_dTerm.C_Term_TRecord (dtb__117, dtb__118) -> ((((((v_annotHeadTy (fuel - 1)) dflt) env) binders) dtb__117) ((B_dData_dList.v_map B_dData_dPair.v_firstOf) dtb__118))
  | Core_dTerm.C_Term_TCon (dtb__119, dtb__120) -> (((((v_annotConTy (fuel - 1)) dflt) env) dtb__119) dtb__120)
  | Core_dTerm.C_Term_TMk (dtb__121, dtb__122) -> (((((v_annotConTy (fuel - 1)) dflt) env) dtb__121) dtb__122)
  | Core_dTerm.C_Term_TInt (dtb__123) -> (B_dData_dMaybe.C_Maybe_Just (Vuna_dIr_dModel.C_IrTy_IrTyInt))
  | Core_dTerm.C_Term_TStr (dtb__124) -> (B_dData_dMaybe.C_Maybe_Just (Vuna_dIr_dModel.C_IrTy_IrTyStr))
  | Core_dTerm.C_Term_TBool (dtb__125) -> (B_dData_dMaybe.C_Maybe_Just (Vuna_dIr_dModel.C_IrTy_IrTyBool))
  | Core_dTerm.C_Term_TFloat (dtb__126) -> (B_dData_dMaybe.C_Maybe_Just (Vuna_dIr_dModel.C_IrTy_IrTyFloat))
  | Core_dTerm.C_Term_TIf (dtb__127, dtb__128, dtb__129) -> (((((v_annotTyOfFuel (fuel - 1)) dflt) env) binders) dtb__128)
  | Core_dTerm.C_Term_TPi (dtb__130, dtb__131, dtb__132, dtb__133, dtb__134) -> (if (Core_dTerm.v_rigIsErased dtb__132) then dflt else (match (((((v_annotTyOfFuel (fuel - 1)) dflt) env) binders) dtb__133) with
  | B_dData_dMaybe.C_Maybe_Nothing -> B_dData_dMaybe.C_Maybe_Nothing
  | B_dData_dMaybe.C_Maybe_Just (dtb__135) -> (match (((((v_annotTyOfFuel (fuel - 1)) dflt) env) (B_dData_dList.C_List__x58__x58_ ((((Vuna_dIr_dModel.v_mkIrBinderTyped v_tempAnnotBinderId) dtb__130) dtb__135), binders))) dtb__134) with
  | B_dData_dMaybe.C_Maybe_Nothing -> B_dData_dMaybe.C_Maybe_Nothing
  | B_dData_dMaybe.C_Maybe_Just (dtb__136) -> (B_dData_dMaybe.C_Maybe_Just ((Vuna_dIr_dModel.C_IrTy_IrTyFun (dtb__135, dtb__136))))
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
))
  | _ -> dflt
)))
# 306 "Vuna/Compiler/Lowering/Ty.vuna"
and v_annotConTy = (fun (fuel : int) (dflt : Vuna_dIr_dModel.t_IrTy B_dData_dMaybe.t_Maybe) (env : Lowering_dEnv.t_LwEnv) (c : string) (args : (Core_dTerm.t_Term, Core_dTerm.t_Rig) B_dData_dPair.t_Pair B_dData_dList.t_List) -> (if (fuel <= 0) then dflt else (let nd_uscrut5 = ((((B_dContainer_dHashMap.v_lookup B_dData_dString.v_Hashable_ue4b0f10b020a5e82_uString) B_dData_dString.v_Eq_u018fc178ff3df1b4_uString) c) (env).Lowering_dEnv.f_LwEnv_lwCtors) in (match nd_uscrut5 with
  | B_dData_dMaybe.C_Maybe_Just (dtb__137) -> (match dtb__137 with
  | { B_dData_dPair.f_Pair_first = dtb__138; B_dData_dPair.f_Pair_second = dtb__139 } -> (match (v_reprTyIr dtb__138) with
  | B_dData_dMaybe.C_Maybe_Just (dtb__140) -> (B_dData_dMaybe.C_Maybe_Just (dtb__140))
  | B_dData_dMaybe.C_Maybe_Nothing -> (match (((v_ctorTypeArgsOf env) c) args) with
  | B_dData_dMaybe.C_Maybe_Just (dtb__141) -> (B_dData_dMaybe.C_Maybe_Just ((Vuna_dIr_dModel.C_IrTy_IrTyData (dtb__138, dtb__141))))
  | B_dData_dMaybe.C_Maybe_Nothing -> dflt
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
)
  | B_dData_dMaybe.C_Maybe_Nothing -> dflt
  | _ -> failwith "DT: impossible branch"
))))
# 337 "Vuna/Compiler/Lowering/Ty.vuna"
and v_annotHeadTy = (fun (fuel : int) (dflt : Vuna_dIr_dModel.t_IrTy B_dData_dMaybe.t_Maybe) (env : Lowering_dEnv.t_LwEnv) (binders : Vuna_dIr_dModel.t_IrBinder B_dData_dList.t_List) (g : string) (args : Core_dTerm.t_Term B_dData_dList.t_List) -> (if (fuel <= 0) then dflt else (if (g = Base_dIntrinsics.v_arrayTypeName) then (let nd_uscrut6 = args in (match nd_uscrut6 with
  | B_dData_dList.C_List__x58__x58_ (dtb__142, dtb__143) -> (match dtb__143 with
  | B_dData_dList.C_List_Nil -> (match (((((v_annotTyOfFuel (fuel - 1)) dflt) env) binders) dtb__142) with
  | B_dData_dMaybe.C_Maybe_Nothing -> B_dData_dMaybe.C_Maybe_Nothing
  | B_dData_dMaybe.C_Maybe_Just (dtb__144) -> (B_dData_dMaybe.C_Maybe_Just ((Vuna_dIr_dModel.C_IrTy_IrTyArray (dtb__144))))
  | _ -> failwith "DT: impossible branch"
)
  | _ -> dflt
)
  | _ -> dflt
)) else (if (g = Base_dIntrinsics.v_cellTypeName) then (let nd_uscrut6 = args in (match nd_uscrut6 with
  | B_dData_dList.C_List__x58__x58_ (dtb__145, dtb__146) -> (match dtb__146 with
  | B_dData_dList.C_List_Nil -> (match (((((v_annotTyOfFuel (fuel - 1)) dflt) env) binders) dtb__145) with
  | B_dData_dMaybe.C_Maybe_Nothing -> B_dData_dMaybe.C_Maybe_Nothing
  | B_dData_dMaybe.C_Maybe_Just (dtb__147) -> (B_dData_dMaybe.C_Maybe_Just ((Vuna_dIr_dModel.C_IrTy_IrTyRef (dtb__147))))
  | _ -> failwith "DT: impossible branch"
)
  | _ -> dflt
)
  | _ -> dflt
)) else (if (g = Base_dIntrinsics.v_marrayTypeName) then (let nd_uscrut6 = args in (match nd_uscrut6 with
  | B_dData_dList.C_List__x58__x58_ (dtb__148, dtb__149) -> (match dtb__149 with
  | B_dData_dList.C_List_Nil -> (match (((((v_annotTyOfFuel (fuel - 1)) dflt) env) binders) dtb__148) with
  | B_dData_dMaybe.C_Maybe_Nothing -> B_dData_dMaybe.C_Maybe_Nothing
  | B_dData_dMaybe.C_Maybe_Just (dtb__150) -> (B_dData_dMaybe.C_Maybe_Just ((Vuna_dIr_dModel.C_IrTy_IrTyArray (dtb__150))))
  | _ -> failwith "DT: impossible branch"
)
  | _ -> dflt
)
  | _ -> dflt
)) else (if (g = Base_dIntrinsics.v_mdynArrayTypeName) then (let nd_uscrut6 = args in (match nd_uscrut6 with
  | B_dData_dList.C_List__x58__x58_ (dtb__151, dtb__152) -> (match dtb__152 with
  | B_dData_dList.C_List_Nil -> (B_dData_dMaybe.C_Maybe_Just ((Vuna_dIr_dModel.C_IrTy_IrTyRef (Vuna_dIr_dModel.C_IrTy_IrTyOpaque))))
  | _ -> dflt
)
  | _ -> dflt
)) else (if (g = Base_dIntrinsics.v_mbufferTypeName) then (match args with
  | B_dData_dList.C_List_Nil -> (B_dData_dMaybe.C_Maybe_Just ((Vuna_dIr_dModel.C_IrTy_IrTyRef (Vuna_dIr_dModel.C_IrTy_IrTyOpaque))))
  | _ -> dflt
) else (if (g = Base_dIntrinsics.v_threadTypeName) then (B_dData_dMaybe.C_Maybe_Just (Vuna_dIr_dModel.C_IrTy_IrTyOpaque)) else (if (g = Base_dIntrinsics.v_mutexTypeName) then (B_dData_dMaybe.C_Maybe_Just (Vuna_dIr_dModel.C_IrTy_IrTyOpaque)) else (if (g = Base_dIntrinsics.v_condvarTypeName) then (B_dData_dMaybe.C_Maybe_Just (Vuna_dIr_dModel.C_IrTy_IrTyOpaque)) else (if (g = Base_dIntrinsics.v_atomicTypeName) then (B_dData_dMaybe.C_Maybe_Just (Vuna_dIr_dModel.C_IrTy_IrTyOpaque)) else (match (v_reprTyIr g) with
  | B_dData_dMaybe.C_Maybe_Just (dtb__153) -> (match args with
  | B_dData_dList.C_List_Nil -> (B_dData_dMaybe.C_Maybe_Just (dtb__153))
  | _ -> dflt
)
  | B_dData_dMaybe.C_Maybe_Nothing -> (if ((((B_dContainer_dHashMap.v_member B_dData_dString.v_Hashable_ue4b0f10b020a5e82_uString) B_dData_dString.v_Eq_u018fc178ff3df1b4_uString) g) (env).Lowering_dEnv.f_LwEnv_lwDataTbl) then (match ((((((v_annotFamilyArgs (fuel - 1)) dflt) env) binders) ((Lowering_dEnv.v_lookupTyParamsIn (env).Lowering_dEnv.f_LwEnv_lwTyParams) g)) args) with
  | B_dData_dMaybe.C_Maybe_Nothing -> B_dData_dMaybe.C_Maybe_Nothing
  | B_dData_dMaybe.C_Maybe_Just (dtb__154) -> (B_dData_dMaybe.C_Maybe_Just ((Vuna_dIr_dModel.C_IrTy_IrTyData (g, dtb__154))))
  | _ -> failwith "DT: impossible branch"
) else dflt)
  | _ -> failwith "DT: impossible branch"
))))))))))))
# 505 "Vuna/Compiler/Lowering/Ty.vuna"
and v_annotFamilyArgs = (fun (fuel : int) (dflt : Vuna_dIr_dModel.t_IrTy B_dData_dMaybe.t_Maybe) (env : Lowering_dEnv.t_LwEnv) (binders : Vuna_dIr_dModel.t_IrBinder B_dData_dList.t_List) (usedPats : int B_dData_dList.t_List) (args : Core_dTerm.t_Term B_dData_dList.t_List) -> (if (fuel <= 0) then B_dData_dMaybe.C_Maybe_Nothing else (match usedPats with
  | B_dData_dList.C_List_Nil -> (B_dData_dMaybe.C_Maybe_Just (B_dData_dList.C_List_Nil))
  | B_dData_dList.C_List__x58__x58_ (dtb__155, dtb__156) -> (match ((v_nthTermIn args) dtb__155) with
  | B_dData_dMaybe.C_Maybe_Nothing -> B_dData_dMaybe.C_Maybe_Nothing
  | B_dData_dMaybe.C_Maybe_Just (dtb__157) -> (match (((((v_annotTyOfFuel (fuel - 1)) dflt) env) binders) dtb__157) with
  | B_dData_dMaybe.C_Maybe_Nothing -> B_dData_dMaybe.C_Maybe_Nothing
  | B_dData_dMaybe.C_Maybe_Just (dtb__158) -> (match ((((((v_annotFamilyArgs (fuel - 1)) dflt) env) binders) dtb__156) args) with
  | B_dData_dMaybe.C_Maybe_Nothing -> B_dData_dMaybe.C_Maybe_Nothing
  | B_dData_dMaybe.C_Maybe_Just (dtb__159) -> (B_dData_dMaybe.C_Maybe_Just ((B_dData_dList.C_List__x58__x58_ (dtb__158, dtb__159))))
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
)))
# 528 "Vuna/Compiler/Lowering/Ty.vuna"
and v_ctorTypeArgsOf = (fun (env : Lowering_dEnv.t_LwEnv) (ctor : string) (args : (Core_dTerm.t_Term, Core_dTerm.t_Rig) B_dData_dPair.t_Pair B_dData_dList.t_List) -> (let nd_uscrut3 = ((((B_dContainer_dHashMap.v_lookup B_dData_dString.v_Hashable_ue4b0f10b020a5e82_uString) B_dData_dString.v_Eq_u018fc178ff3df1b4_uString) ctor) (env).Lowering_dEnv.f_LwEnv_lwCtors) in (match nd_uscrut3 with
  | B_dData_dMaybe.C_Maybe_Nothing -> B_dData_dMaybe.C_Maybe_Nothing
  | B_dData_dMaybe.C_Maybe_Just (dtb__160) -> (match dtb__160 with
  | { B_dData_dPair.f_Pair_first = dtb__161; B_dData_dPair.f_Pair_second = dtb__162 } -> (if ((((B_dContainer_dHashMap.v_member B_dData_dString.v_Hashable_ue4b0f10b020a5e82_uString) B_dData_dString.v_Eq_u018fc178ff3df1b4_uString) dtb__161) (env).Lowering_dEnv.f_LwEnv_lwDataTbl) then ((((((v_annotFamilyArgs 256) B_dData_dMaybe.C_Maybe_Nothing) env) B_dData_dList.C_List_Nil) ((Lowering_dEnv.v_lookupTyParamsIn (env).Lowering_dEnv.f_LwEnv_lwTyParams) dtb__161)) ((B_dData_dList.v_map B_dData_dPair.v_firstOf) args)) else B_dData_dMaybe.C_Maybe_Nothing)
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
)))

# 254 "Vuna/Compiler/Lowering/Ty.vuna"
let v_annotTyOf = (fun (env : Lowering_dEnv.t_LwEnv) (binders : Vuna_dIr_dModel.t_IrBinder B_dData_dList.t_List) (t : Core_dTerm.t_Term) -> (((((v_annotTyOfFuel 256) B_dData_dMaybe.C_Maybe_Nothing) env) binders) t))

# 261 "Vuna/Compiler/Lowering/Ty.vuna"
let v_annotTyOfTotal = (fun (env : Lowering_dEnv.t_LwEnv) (binders : Vuna_dIr_dModel.t_IrBinder B_dData_dList.t_List) (t : Core_dTerm.t_Term) -> (match (((((v_annotTyOfFuel 256) (B_dData_dMaybe.C_Maybe_Just (Vuna_dIr_dModel.C_IrTy_IrTyOpaque))) env) binders) t) with
  | B_dData_dMaybe.C_Maybe_Just (dtb__163) -> dtb__163
  | B_dData_dMaybe.C_Maybe_Nothing -> Vuna_dIr_dModel.C_IrTy_IrTyOpaque
  | _ -> failwith "DT: impossible branch"
))

# 400 "Vuna/Compiler/Lowering/Ty.vuna"
let rec v_annotRunTyOf = (fun (mc0 : Lowering_dEnv.t_LwEnv) (mc1 : Vuna_dIr_dModel.t_IrBinder B_dData_dList.t_List) (mc2 : Core_dTerm.t_Term) -> (match mc2 with
  | Core_dTerm.C_Term_TIf (dtb__164, dtb__165, dtb__166) -> (((v_annotRunTyOf mc0) mc1) dtb__165)
  | Core_dTerm.C_Term_TVar (dtb__167, dtb__168, dtb__169) -> ((v_binderTyAtRuntime dtb__168) mc1)
  | _ -> (((v_annotTyOf mc0) mc1) mc2)
))

# 422 "Vuna/Compiler/Lowering/Ty.vuna"
let v_annotRunTyOfTotal = (fun (env : Lowering_dEnv.t_LwEnv) (binders : Vuna_dIr_dModel.t_IrBinder B_dData_dList.t_List) (t : Core_dTerm.t_Term) -> (match (((v_annotRunTyOf env) binders) t) with
  | B_dData_dMaybe.C_Maybe_Just (dtb__170) -> dtb__170
  | B_dData_dMaybe.C_Maybe_Nothing -> Vuna_dIr_dModel.C_IrTy_IrTyOpaque
  | _ -> failwith "DT: impossible branch"
))

# 451 "Vuna/Compiler/Lowering/Ty.vuna"
let v_annotGlobalTy = (fun (env : Lowering_dEnv.t_LwEnv) (binders : Vuna_dIr_dModel.t_IrBinder B_dData_dList.t_List) (g : string) -> (if ((((B_dContainer_dHashMap.v_member B_dData_dString.v_Hashable_ue4b0f10b020a5e82_uString) B_dData_dString.v_Eq_u018fc178ff3df1b4_uString) g) (env).Lowering_dEnv.f_LwEnv_lwDataTbl) then (((v_annotTyOf env) binders) (Core_dTerm.C_Term_TGlobal (g))) else (match ((v_globalTyTermOf env) g) with
  | B_dData_dMaybe.C_Maybe_Just (dtb__171) -> (B_dData_dMaybe.C_Maybe_Just ((((((v_renderPiTy B_dData_dList.C_List_Nil) (env).Lowering_dEnv.f_LwEnv_lwTyParams) (env).Lowering_dEnv.f_LwEnv_lwDataTbl) 0) ((Core_dEval.v_eval B_dData_dList.C_List_Nil) dtb__171))))
  | B_dData_dMaybe.C_Maybe_Nothing -> (((v_annotTyOf env) binders) (Core_dTerm.C_Term_TGlobal (g)))
  | _ -> failwith "DT: impossible branch"
)))

# 428 "Vuna/Compiler/Lowering/Ty.vuna"
let v_annotCalleeTy = (fun (mc0 : Lowering_dEnv.t_LwEnv) (mc1 : Vuna_dIr_dModel.t_IrBinder B_dData_dList.t_List) (mc2 : Core_dTerm.t_Term) -> (match mc2 with
  | Core_dTerm.C_Term_TApp (dtb__172, dtb__173, dtb__174) -> (let nd_uscrut6 = (v_flattenAnnotAppRig mc2) in (match nd_uscrut6 with
  | { B_dData_dPair.f_Pair_first = dtb__175; B_dData_dPair.f_Pair_second = dtb__176 } -> (match dtb__175 with
  | Core_dTerm.C_Term_TGlobal (dtb__177) -> (if ((((B_dContainer_dHashMap.v_member B_dData_dString.v_Hashable_ue4b0f10b020a5e82_uString) B_dData_dString.v_Eq_u018fc178ff3df1b4_uString) dtb__177) (mc0).Lowering_dEnv.f_LwEnv_lwDataTbl) then (((v_annotTyOf mc0) mc1) mc2) else (match ((v_globalTyTermOf mc0) dtb__177) with
  | B_dData_dMaybe.C_Maybe_Just (dtb__178) -> ((((v_peelPiArgsTy 256) mc0) ((Core_dEval.v_eval B_dData_dList.C_List_Nil) dtb__178)) dtb__176)
  | B_dData_dMaybe.C_Maybe_Nothing -> ((v_peelIrFuns (v_countRuntimeArgs dtb__176)) (((v_annotTyOf mc0) mc1) (Core_dTerm.C_Term_TGlobal (dtb__177))))
  | _ -> failwith "DT: impossible branch"
))
  | _ -> ((v_peelIrFuns (v_countRuntimeArgs dtb__176)) (B_dData_dMaybe.C_Maybe_Just ((((v_annotTyOfTotal mc0) mc1) dtb__175))))
)
  | _ -> failwith "DT: impossible branch"
))
  | Core_dTerm.C_Term_TGlobal (dtb__179) -> (((v_annotGlobalTy mc0) mc1) dtb__179)
  | _ -> (((v_annotTyOf mc0) mc1) mc2)
))

# 414 "Vuna/Compiler/Lowering/Ty.vuna"
let v_annotRunCalleeTy = (fun (mc0 : Lowering_dEnv.t_LwEnv) (mc1 : Vuna_dIr_dModel.t_IrBinder B_dData_dList.t_List) (mc2 : Core_dTerm.t_Term) -> (match mc2 with
  | Core_dTerm.C_Term_TApp (dtb__180, dtb__181, dtb__182) -> (let nd_uscrut6 = (v_flattenAnnotAppRig mc2) in (match nd_uscrut6 with
  | { B_dData_dPair.f_Pair_first = dtb__183; B_dData_dPair.f_Pair_second = dtb__184 } -> (match dtb__183 with
  | Core_dTerm.C_Term_TGlobal (dtb__185) -> (((v_annotCalleeTy mc0) mc1) mc2)
  | _ -> ((v_peelIrFuns (v_countRuntimeArgs dtb__184)) (B_dData_dMaybe.C_Maybe_Just ((((v_annotRunTyOfTotal mc0) mc1) dtb__183))))
)
  | _ -> failwith "DT: impossible branch"
))
  | Core_dTerm.C_Term_TGlobal (dtb__186) -> (((v_annotGlobalTy mc0) mc1) dtb__186)
  | _ -> (((v_annotRunTyOf mc0) mc1) mc2)
))

# 544 "Vuna/Compiler/Lowering/Ty.vuna"
let rec v_findCtorInLocal = (fun (mc0 : string) (mc1 : Elab_dTypes.t_DtCtor B_dData_dList.t_List) -> (match mc1 with
  | B_dData_dList.C_List__x58__x58_ (dtb__187, dtb__188) -> (if ((Elab_dTypes.v_dtCtorName dtb__187) = mc0) then (B_dData_dMaybe.C_Maybe_Just (dtb__187)) else ((v_findCtorInLocal mc0) dtb__188))
  | B_dData_dList.C_List_Nil -> B_dData_dMaybe.C_Maybe_Nothing
  | _ -> failwith "DT: impossible branch"
))

# 550 "Vuna/Compiler/Lowering/Ty.vuna"
let v_ctorKeptFieldTys = (fun (env : Lowering_dEnv.t_LwEnv) (ctor : string) -> (let nd_uscrut2 = ((((B_dContainer_dHashMap.v_lookup B_dData_dString.v_Hashable_ue4b0f10b020a5e82_uString) B_dData_dString.v_Eq_u018fc178ff3df1b4_uString) ctor) (env).Lowering_dEnv.f_LwEnv_lwCtors) in (match nd_uscrut2 with
  | B_dData_dMaybe.C_Maybe_Just (dtb__189) -> (match dtb__189 with
  | { B_dData_dPair.f_Pair_first = dtb__190; B_dData_dPair.f_Pair_second = dtb__191 } -> (match ((((B_dContainer_dHashMap.v_lookup B_dData_dString.v_Hashable_ue4b0f10b020a5e82_uString) B_dData_dString.v_Eq_u018fc178ff3df1b4_uString) dtb__190) (env).Lowering_dEnv.f_LwEnv_lwDataTbl) with
  | B_dData_dMaybe.C_Maybe_Nothing -> (Base_dDiag.C_Check_OkC (B_dData_dList.C_List_Nil))
  | B_dData_dMaybe.C_Maybe_Just (dtb__192) -> (match ((v_findCtorInLocal ctor) (Elab_dTypes.v_dtDataCtors dtb__192)) with
  | B_dData_dMaybe.C_Maybe_Nothing -> (Base_dDiag.C_Check_OkC (B_dData_dList.C_List_Nil))
  | B_dData_dMaybe.C_Maybe_Just (dtb__193) -> (let levels = ((Lowering_dEnv.v_lookupTyParamsIn (env).Lowering_dEnv.f_LwEnv_lwTyParams) dtb__190) in ((Base_dCommon.v_bind (((((((((v_ctorFieldTys levels) (env).Lowering_dEnv.f_LwEnv_lwTyParams) (env).Lowering_dEnv.f_LwEnv_lwDataTbl) dtb__191) ((Lowering_dEnv.v_ctorOpaqueFlagsOf (env).Lowering_dEnv.f_LwEnv_lwDatas) dtb__193)) (Elab_dTypes.v_dtCtorTelescope dtb__193)) 0) ((Core_dEval.v_eval B_dData_dList.C_List_Nil) (Elab_dTypes.v_dtCtorType dtb__193))) (Lowering_dEnv.v_listLength levels))) (fun (p : (Vuna_dIr_dModel.t_IrTy B_dData_dList.t_List, int) B_dData_dPair.t_Pair) -> (Base_dDiag.C_Check_OkC ((B_dData_dPair.v_firstOf p))))))
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
)
  | B_dData_dMaybe.C_Maybe_Nothing -> (Base_dDiag.C_Check_OkC (B_dData_dList.C_List_Nil))
  | _ -> failwith "DT: impossible branch"
)))

# 584 "Vuna/Compiler/Lowering/Ty.vuna"
let v_tyDeclOf = (fun (dataTbl : (string, Elab_dTypes.t_DtData) B_dContainer_dHashMap.t_HashMap) (table : (string, int B_dData_dList.t_List) B_dContainer_dHashMap.t_HashMap) (allDatas : Elab_dTypes.t_DtData B_dData_dList.t_List) (unboxed : (string, (Elab_dTypes.t_DtCtor, int) B_dData_dPair.t_Pair) B_dData_dPair.t_Pair B_dData_dList.t_List) (d : Elab_dTypes.t_DtData) -> (let levels = ((Lowering_dEnv.v_lookupTyParamsIn table) (Elab_dTypes.v_dtDataName d)) in (let arity = (Lowering_dEnv.v_listLength levels) in (let nd_uscrut7 = ((Elab_dRepresentation.v_lookupUnboxedInfo (Elab_dTypes.v_dtDataName d)) unboxed) in (match nd_uscrut7 with
  | B_dData_dMaybe.C_Maybe_Nothing -> (if (Lowering_dEnv.v_hasRecordRepr d) then (let nd_uscrut9 = (Elab_dTypes.v_dtDataCtors d) in (match nd_uscrut9 with
  | B_dData_dList.C_List__x58__x58_ (dtb__194, dtb__195) -> (match dtb__195 with
  | B_dData_dList.C_List_Nil -> ((Base_dCommon.v_bind (((((((((v_ctorFieldTys levels) table) dataTbl) (Elab_dRepresentation.v_ctorKeepFlags dtb__194)) ((Lowering_dEnv.v_ctorOpaqueFlagsOf allDatas) dtb__194)) (Elab_dTypes.v_dtCtorTelescope dtb__194)) 0) ((Core_dEval.v_eval B_dData_dList.C_List_Nil) (Elab_dTypes.v_dtCtorType dtb__194))) arity)) (fun (p : (Vuna_dIr_dModel.t_IrTy B_dData_dList.t_List, int) B_dData_dPair.t_Pair) -> (let fields = (Lowering_dEnv.v_recordRtFields d) in (let tys = (B_dData_dPair.v_firstOf p) in (if ((Lowering_dEnv.v_listLength fields) = (Lowering_dEnv.v_listLength tys)) then (Base_dDiag.C_Check_OkC ((Vuna_dIr_dModel.C_IrTyDecl_IrRecordDecl ((Elab_dTypes.v_dtDataName d), (B_dData_dPair.v_secondOf p), fields, tys)))) else (Base_dDiag.v_icInternal (String.concat "" ["record `"; (Elab_dTypes.v_dtDataName d); "` has "; (bi_strFromInt (Lowering_dEnv.v_listLength fields)); " runtime fields but "; (bi_strFromInt (Lowering_dEnv.v_listLength tys)); " field types"])))))))
  | _ -> (Base_dDiag.v_icInternal ("record family must have exactly one constructor: " ^ (Elab_dTypes.v_dtDataName d)))
)
  | _ -> (Base_dDiag.v_icInternal ("record family must have exactly one constructor: " ^ (Elab_dTypes.v_dtDataName d)))
)) else ((Base_dCommon.v_bind (((((v_dataArityNeed dataTbl) levels) table) allDatas) (Elab_dTypes.v_dtDataCtors d))) (fun (fullArity : int) -> ((Base_dCommon.v_bind ((Base_dCommon.v_traverse (fun (c : Elab_dTypes.t_DtCtor) -> ((Base_dCommon.v_bind (((((((((v_ctorFieldTys levels) table) dataTbl) (Elab_dRepresentation.v_ctorKeepFlags c)) ((Lowering_dEnv.v_ctorOpaqueFlagsOf allDatas) c)) (Elab_dTypes.v_dtCtorTelescope c)) 0) ((Core_dEval.v_eval B_dData_dList.C_List_Nil) (Elab_dTypes.v_dtCtorType c))) (Lowering_dEnv.v_listLength levels))) (fun (p : (Vuna_dIr_dModel.t_IrTy B_dData_dList.t_List, int) B_dData_dPair.t_Pair) -> (Base_dDiag.C_Check_OkC ({ B_dData_dPair.f_Pair_first = (Elab_dTypes.v_dtCtorName c); B_dData_dPair.f_Pair_second = (B_dData_dPair.v_firstOf p) })))))) (Elab_dTypes.v_dtDataCtors d))) (fun (ctors : (string, Vuna_dIr_dModel.t_IrTy B_dData_dList.t_List) B_dData_dPair.t_Pair B_dData_dList.t_List) -> (Base_dDiag.C_Check_OkC ((Vuna_dIr_dModel.C_IrTyDecl_IrVariantDecl ((Elab_dTypes.v_dtDataName d), fullArity, ctors)))))))))
  | B_dData_dMaybe.C_Maybe_Just (dtb__196) -> (match dtb__196 with
  | { B_dData_dPair.f_Pair_first = dtb__197; B_dData_dPair.f_Pair_second = dtb__198 } -> ((Base_dCommon.v_bind (((((((((v_ctorFieldTys levels) table) dataTbl) (Elab_dRepresentation.v_ctorKeepFlags dtb__197)) ((Lowering_dEnv.v_ctorOpaqueFlagsOf allDatas) dtb__197)) (Elab_dTypes.v_dtCtorTelescope dtb__197)) 0) ((Core_dEval.v_eval B_dData_dList.C_List_Nil) (Elab_dTypes.v_dtCtorType dtb__197))) arity)) (fun (p : (Vuna_dIr_dModel.t_IrTy B_dData_dList.t_List, int) B_dData_dPair.t_Pair) -> (let nd_uscrut15 = (B_dData_dPair.v_firstOf p) in (match nd_uscrut15 with
  | B_dData_dList.C_List__x58__x58_ (dtb__199, dtb__200) -> (match dtb__200 with
  | B_dData_dList.C_List_Nil -> (Base_dDiag.C_Check_OkC ((Vuna_dIr_dModel.C_IrTyDecl_IrUnboxedDecl ((Elab_dTypes.v_dtDataName d), (B_dData_dPair.v_secondOf p), dtb__199))))
  | _ -> (Base_dDiag.v_icInternal ("unboxed constructor does not have exactly one kept field: " ^ (Elab_dTypes.v_dtCtorName dtb__197)))
)
  | _ -> (Base_dDiag.v_icInternal ("unboxed constructor does not have exactly one kept field: " ^ (Elab_dTypes.v_dtCtorName dtb__197)))
))))
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
)))))

# 577 "Vuna/Compiler/Lowering/Ty.vuna"
let rec v_tyDeclsGo = (fun (mc0 : (string, Elab_dTypes.t_DtData) B_dContainer_dHashMap.t_HashMap) (mc1 : (string, int B_dData_dList.t_List) B_dContainer_dHashMap.t_HashMap) (mc2 : Elab_dTypes.t_DtData B_dData_dList.t_List) (mc3 : (string, (Elab_dTypes.t_DtCtor, int) B_dData_dPair.t_Pair) B_dData_dPair.t_Pair B_dData_dList.t_List) (mc4 : Elab_dTypes.t_DtData B_dData_dList.t_List) -> (match mc4 with
  | B_dData_dList.C_List__x58__x58_ (dtb__201, dtb__202) -> ((Base_dCommon.v_bind (((((v_tyDeclOf mc0) mc1) mc2) mc3) dtb__201)) (fun (decl : Vuna_dIr_dModel.t_IrTyDecl) -> ((Base_dCommon.v_bind (((((v_tyDeclsGo mc0) mc1) mc2) mc3) dtb__202)) (fun (tail : Vuna_dIr_dModel.t_IrTyDecl B_dData_dList.t_List) -> (Base_dDiag.C_Check_OkC ((B_dData_dList.C_List__x58__x58_ (decl, tail))))))))
  | B_dData_dList.C_List_Nil -> (Base_dDiag.C_Check_OkC (B_dData_dList.C_List_Nil))
  | _ -> failwith "DT: impossible branch"
))

# 573 "Vuna/Compiler/Lowering/Ty.vuna"
let v_tyDeclsOf = (fun (dataTbl : (string, Elab_dTypes.t_DtData) B_dContainer_dHashMap.t_HashMap) (tyParams : (string, int B_dData_dList.t_List) B_dContainer_dHashMap.t_HashMap) (unboxed : (string, (Elab_dTypes.t_DtCtor, int) B_dData_dPair.t_Pair) B_dData_dPair.t_Pair B_dData_dList.t_List) (allDatas : Elab_dTypes.t_DtData B_dData_dList.t_List) (subset : Elab_dTypes.t_DtData B_dData_dList.t_List) -> (((((v_tyDeclsGo dataTbl) tyParams) allDatas) unboxed) subset))

# 618 "Vuna/Compiler/Lowering/Ty.vuna"
let v_tyDeclTys = (fun (mc0 : Vuna_dIr_dModel.t_IrTyDecl) -> (match mc0 with
  | Vuna_dIr_dModel.C_IrTyDecl_IrUnboxedDecl (dtb__203, dtb__204, dtb__205) -> (B_dData_dList.C_List__x58__x58_ (dtb__205, B_dData_dList.C_List_Nil))
  | Vuna_dIr_dModel.C_IrTyDecl_IrRecordDecl (dtb__206, dtb__207, dtb__208, dtb__209) -> dtb__209
  | Vuna_dIr_dModel.C_IrTyDecl_IrVariantDecl (dtb__210, dtb__211, dtb__212) -> ((B_dData_dList.v_concatMap B_dData_dPair.v_secondOf) dtb__212)
  | _ -> failwith "DT: impossible branch"
))

# 627 "Vuna/Compiler/Lowering/Ty.vuna"
let rec v_foldlTyNames = (fun (mc0 : Vuna_dIr_dModel.t_IrTy B_dData_dList.t_List) (mc1 : string B_dData_dList.t_List) -> (match mc0 with
  | B_dData_dList.C_List__x58__x58_ (dtb__213, dtb__214) -> ((v_foldlTyNames dtb__214) ((v_tyNamesInto dtb__213) mc1))
  | B_dData_dList.C_List_Nil -> mc1
  | _ -> failwith "DT: impossible branch"
))
# 631 "Vuna/Compiler/Lowering/Ty.vuna"
and v_tyNamesInto = (fun (mc0 : Vuna_dIr_dModel.t_IrTy) (mc1 : string B_dData_dList.t_List) -> (match mc0 with
  | Vuna_dIr_dModel.C_IrTy_IrTyData (dtb__215, dtb__216) -> ((v_foldlTyNames dtb__216) ((Lowering_dEnv.v_pushDep dtb__215) mc1))
  | Vuna_dIr_dModel.C_IrTy_IrTyFun (dtb__217, dtb__218) -> ((v_tyNamesInto dtb__218) ((v_tyNamesInto dtb__217) mc1))
  | Vuna_dIr_dModel.C_IrTy_IrTyRef (dtb__219) -> ((v_tyNamesInto dtb__219) mc1)
  | Vuna_dIr_dModel.C_IrTy_IrTyArray (dtb__220) -> ((v_tyNamesInto dtb__220) mc1)
  | Vuna_dIr_dModel.C_IrTy_IrTyOpaque -> mc1
  | Vuna_dIr_dModel.C_IrTy_IrTyFloat -> mc1
  | Vuna_dIr_dModel.C_IrTy_IrTyBool -> mc1
  | Vuna_dIr_dModel.C_IrTy_IrTyStr -> mc1
  | Vuna_dIr_dModel.C_IrTy_IrTyInt -> mc1
  | Vuna_dIr_dModel.C_IrTy_IrTyVar (dtb__221) -> mc1
  | _ -> failwith "DT: impossible branch"
))

# 623 "Vuna/Compiler/Lowering/Ty.vuna"
let rec v_tyDeclRefsGo = (fun (mc0 : Vuna_dIr_dModel.t_IrTy B_dData_dList.t_List B_dData_dList.t_List) (mc1 : string B_dData_dList.t_List) -> (match mc0 with
  | B_dData_dList.C_List__x58__x58_ (dtb__222, dtb__223) -> ((v_tyDeclRefsGo dtb__223) ((v_foldlTyNames dtb__222) mc1))
  | B_dData_dList.C_List_Nil -> (B_dData_dList.v_reverse mc1)
  | _ -> failwith "DT: impossible branch"
))

# 615 "Vuna/Compiler/Lowering/Ty.vuna"
let v_tyDeclRefs = (fun (decls : Vuna_dIr_dModel.t_IrTyDecl B_dData_dList.t_List) -> ((v_tyDeclRefsGo ((B_dData_dList.v_map v_tyDeclTys) decls)) B_dData_dList.C_List_Nil))
