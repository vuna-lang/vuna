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

# 482 "Vuna/Compiler/Lowering/Ty.vuna"
let rec v_effArityHeadTy = (fun (mc0 : Core_dTerm.t_Term) -> (match mc0 with
  | Core_dTerm.C_Term_TRecord (dtb__88, dtb__89) -> (dtb__88 = Vuna_dIr_dModel.v_irEffTypeName)
  | Core_dTerm.C_Term_TApp (dtb__90, dtb__91, dtb__92) -> (v_effArityHeadTy dtb__90)
  | Core_dTerm.C_Term_TGlobal (dtb__93) -> (dtb__93 = Vuna_dIr_dModel.v_irEffTypeName)
  | _ -> false
))

# 488 "Vuna/Compiler/Lowering/Ty.vuna"
let rec v_effArityPeelTy = (fun (mc0 : int) (mc1 : Core_dTerm.t_Term) -> (match mc1 with
  | Core_dTerm.C_Term_TPi (dtb__94, dtb__95, dtb__96, dtb__97, dtb__98) -> ((v_effArityPeelTy (if (Core_dTerm.v_rigIsErased dtb__96) then mc0 else (mc0 + 1))) dtb__98)
  | _ -> (if (v_effArityHeadTy mc1) then (B_dData_dMaybe.C_Maybe_Just (mc0)) else B_dData_dMaybe.C_Maybe_Nothing)
))

# 492 "Vuna/Compiler/Lowering/Ty.vuna"
let v_effArityOfTy = (fun (ty : Core_dTerm.t_Term) -> ((v_effArityPeelTy 0) ty))

# 495 "Vuna/Compiler/Lowering/Ty.vuna"
let rec v_peelIrFuns = (fun (mc0 : int) (mc1 : Vuna_dIr_dModel.t_IrTy B_dData_dMaybe.t_Maybe) -> (match mc1 with
  | B_dData_dMaybe.C_Maybe_Just (dtb__99) -> (if (mc0 <= 0) then (B_dData_dMaybe.C_Maybe_Just (dtb__99)) else (match dtb__99 with
  | Vuna_dIr_dModel.C_IrTy_IrTyFun (dtb__100, dtb__101) -> ((v_peelIrFuns (mc0 - 1)) (B_dData_dMaybe.C_Maybe_Just (dtb__101)))
  | _ -> B_dData_dMaybe.C_Maybe_Nothing
))
  | B_dData_dMaybe.C_Maybe_Nothing -> B_dData_dMaybe.C_Maybe_Nothing
  | _ -> failwith "DT: impossible branch"
))

# 507 "Vuna/Compiler/Lowering/Ty.vuna"
let rec v_peelPiArgsTy = (fun (fuel : int) (env : Lowering_dEnv.t_LwEnv) (v : Core_dTerm.t_Value) (args : (Core_dTerm.t_Term, Core_dTerm.t_Rig) B_dData_dPair.t_Pair B_dData_dList.t_List) -> (if (fuel <= 0) then B_dData_dMaybe.C_Maybe_Nothing else (match v with
  | Core_dTerm.C_Value_VPi (dtb__102, dtb__103, dtb__104, dtb__105, dtb__106) -> (if (Core_dTerm.v_rigIsErased dtb__104) then (let nd_uscrut9 = args in (match nd_uscrut9 with
  | B_dData_dList.C_List_Nil -> (B_dData_dMaybe.C_Maybe_Just ((((((v_renderPiTy B_dData_dList.C_List_Nil) (env).Lowering_dEnv.f_LwEnv_lwTyParams) (env).Lowering_dEnv.f_LwEnv_lwDataTbl) 0) v)))
  | B_dData_dList.C_List__x58__x58_ (dtb__107, dtb__108) -> (match dtb__107 with
  | { B_dData_dPair.f_Pair_first = dtb__109; B_dData_dPair.f_Pair_second = dtb__110 } -> (if (Core_dTerm.v_rigIsErased dtb__110) then ((((v_peelPiArgsTy (fuel - 1)) env) ((Core_dEval.v_applyClosure dtb__106) ((Core_dEval.v_eval B_dData_dList.C_List_Nil) dtb__109))) dtb__108) else ((((v_peelPiArgsTy (fuel - 1)) env) ((Core_dEval.v_applyClosure dtb__106) (Core_dTerm.C_Value_VNeutral ((Core_dTerm.C_Neutral_NVar (dtb__102, 0, B_dData_dList.C_List_Nil)))))) args))
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
)) else (let nd_uscrut9 = args in (match nd_uscrut9 with
  | B_dData_dList.C_List_Nil -> (B_dData_dMaybe.C_Maybe_Just ((((((v_renderPiTy B_dData_dList.C_List_Nil) (env).Lowering_dEnv.f_LwEnv_lwTyParams) (env).Lowering_dEnv.f_LwEnv_lwDataTbl) 0) v)))
  | B_dData_dList.C_List__x58__x58_ (dtb__111, dtb__112) -> (match dtb__111 with
  | { B_dData_dPair.f_Pair_first = dtb__113; B_dData_dPair.f_Pair_second = dtb__114 } -> ((((v_peelPiArgsTy (fuel - 1)) env) ((Core_dEval.v_applyClosure dtb__106) (Core_dTerm.C_Value_VNeutral ((Core_dTerm.C_Neutral_NVar (dtb__102, 0, B_dData_dList.C_List_Nil)))))) dtb__112)
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
)))
  | _ -> (B_dData_dMaybe.C_Maybe_Just ((((((v_renderPiTy B_dData_dList.C_List_Nil) (env).Lowering_dEnv.f_LwEnv_lwTyParams) (env).Lowering_dEnv.f_LwEnv_lwDataTbl) 0) v)))
)))

# 544 "Vuna/Compiler/Lowering/Ty.vuna"
let rec v_nthTermIn = (fun (mc0 : Core_dTerm.t_Term B_dData_dList.t_List) (mc1 : int) -> (match mc0 with
  | B_dData_dList.C_List__x58__x58_ (dtb__115, dtb__116) -> (if (mc1 <= 0) then (B_dData_dMaybe.C_Maybe_Just (dtb__115)) else ((v_nthTermIn dtb__116) (mc1 - 1)))
  | B_dData_dList.C_List_Nil -> B_dData_dMaybe.C_Maybe_Nothing
  | _ -> failwith "DT: impossible branch"
))

# 269 "Vuna/Compiler/Lowering/Ty.vuna"
let rec v_annotTyOfFuel = (fun (fuel : int) (dflt : Vuna_dIr_dModel.t_IrTy B_dData_dMaybe.t_Maybe) (env : Lowering_dEnv.t_LwEnv) (binders : Vuna_dIr_dModel.t_IrBinder B_dData_dList.t_List) (t : Core_dTerm.t_Term) -> (if (fuel <= 0) then dflt else (match t with
  | Core_dTerm.C_Term_TVar (dtb__117, dtb__118, dtb__119) -> (match ((v_binderTyAtIn dtb__118) binders) with
  | B_dData_dMaybe.C_Maybe_Just (dtb__120) -> (B_dData_dMaybe.C_Maybe_Just (dtb__120))
  | B_dData_dMaybe.C_Maybe_Nothing -> dflt
  | _ -> failwith "DT: impossible branch"
)
  | Core_dTerm.C_Term_TGlobal (dtb__121) -> ((((((v_annotHeadTy (fuel - 1)) dflt) env) binders) dtb__121) B_dData_dList.C_List_Nil)
  | Core_dTerm.C_Term_TApp (dtb__122, dtb__123, dtb__124) -> (match (v_flattenAnnotApp t) with
  | { B_dData_dPair.f_Pair_first = dtb__125; B_dData_dPair.f_Pair_second = dtb__126 } -> (match dtb__125 with
  | Core_dTerm.C_Term_TGlobal (dtb__127) -> ((((((v_annotHeadTy (fuel - 1)) dflt) env) binders) dtb__127) dtb__126)
  | _ -> dflt
)
  | _ -> failwith "DT: impossible branch"
)
  | Core_dTerm.C_Term_TRecord (dtb__128, dtb__129) -> ((((((v_annotHeadTy (fuel - 1)) dflt) env) binders) dtb__128) ((B_dData_dList.v_map B_dData_dPair.v_firstOf) dtb__129))
  | Core_dTerm.C_Term_TCon (dtb__130, dtb__131) -> (((((v_annotConTy (fuel - 1)) dflt) env) dtb__130) dtb__131)
  | Core_dTerm.C_Term_TMk (dtb__132, dtb__133) -> (((((v_annotConTy (fuel - 1)) dflt) env) dtb__132) dtb__133)
  | Core_dTerm.C_Term_TInt (dtb__134) -> (B_dData_dMaybe.C_Maybe_Just (Vuna_dIr_dModel.C_IrTy_IrTyInt))
  | Core_dTerm.C_Term_TStr (dtb__135) -> (B_dData_dMaybe.C_Maybe_Just (Vuna_dIr_dModel.C_IrTy_IrTyStr))
  | Core_dTerm.C_Term_TBool (dtb__136) -> (B_dData_dMaybe.C_Maybe_Just (Vuna_dIr_dModel.C_IrTy_IrTyBool))
  | Core_dTerm.C_Term_TFloat (dtb__137) -> (B_dData_dMaybe.C_Maybe_Just (Vuna_dIr_dModel.C_IrTy_IrTyFloat))
  | Core_dTerm.C_Term_TIf (dtb__138, dtb__139, dtb__140) -> (((((v_annotTyOfFuel (fuel - 1)) dflt) env) binders) dtb__139)
  | Core_dTerm.C_Term_TPi (dtb__141, dtb__142, dtb__143, dtb__144, dtb__145) -> (if (Core_dTerm.v_rigIsErased dtb__143) then dflt else (match (((((v_annotTyOfFuel (fuel - 1)) dflt) env) binders) dtb__144) with
  | B_dData_dMaybe.C_Maybe_Nothing -> B_dData_dMaybe.C_Maybe_Nothing
  | B_dData_dMaybe.C_Maybe_Just (dtb__146) -> (match (((((v_annotTyOfFuel (fuel - 1)) dflt) env) (B_dData_dList.C_List__x58__x58_ ((((Vuna_dIr_dModel.v_mkIrBinderTyped v_tempAnnotBinderId) dtb__141) dtb__146), binders))) dtb__145) with
  | B_dData_dMaybe.C_Maybe_Nothing -> B_dData_dMaybe.C_Maybe_Nothing
  | B_dData_dMaybe.C_Maybe_Just (dtb__147) -> (B_dData_dMaybe.C_Maybe_Just ((Vuna_dIr_dModel.C_IrTy_IrTyFun (dtb__146, dtb__147))))
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
))
  | _ -> dflt
)))
# 306 "Vuna/Compiler/Lowering/Ty.vuna"
and v_annotConTy = (fun (fuel : int) (dflt : Vuna_dIr_dModel.t_IrTy B_dData_dMaybe.t_Maybe) (env : Lowering_dEnv.t_LwEnv) (c : string) (args : (Core_dTerm.t_Term, Core_dTerm.t_Rig) B_dData_dPair.t_Pair B_dData_dList.t_List) -> (if (fuel <= 0) then dflt else (let nd_uscrut5 = ((((B_dContainer_dHashMap.v_lookup B_dData_dString.v_Hashable_ue4b0f10b020a5e82_uString) B_dData_dString.v_Eq_u018fc178ff3df1b4_uString) c) (env).Lowering_dEnv.f_LwEnv_lwCtors) in (match nd_uscrut5 with
  | B_dData_dMaybe.C_Maybe_Just (dtb__148) -> (match dtb__148 with
  | { B_dData_dPair.f_Pair_first = dtb__149; B_dData_dPair.f_Pair_second = dtb__150 } -> (match (v_reprTyIr dtb__149) with
  | B_dData_dMaybe.C_Maybe_Just (dtb__151) -> (B_dData_dMaybe.C_Maybe_Just (dtb__151))
  | B_dData_dMaybe.C_Maybe_Nothing -> (match (((v_ctorTypeArgsOf env) c) args) with
  | B_dData_dMaybe.C_Maybe_Just (dtb__152) -> (B_dData_dMaybe.C_Maybe_Just ((Vuna_dIr_dModel.C_IrTy_IrTyData (dtb__149, dtb__152))))
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
  | B_dData_dList.C_List__x58__x58_ (dtb__153, dtb__154) -> (match dtb__154 with
  | B_dData_dList.C_List_Nil -> (match (((((v_annotTyOfFuel (fuel - 1)) dflt) env) binders) dtb__153) with
  | B_dData_dMaybe.C_Maybe_Nothing -> B_dData_dMaybe.C_Maybe_Nothing
  | B_dData_dMaybe.C_Maybe_Just (dtb__155) -> (B_dData_dMaybe.C_Maybe_Just ((Vuna_dIr_dModel.C_IrTy_IrTyArray (dtb__155))))
  | _ -> failwith "DT: impossible branch"
)
  | _ -> dflt
)
  | _ -> dflt
)) else (if (g = Base_dIntrinsics.v_cellTypeName) then (let nd_uscrut6 = args in (match nd_uscrut6 with
  | B_dData_dList.C_List__x58__x58_ (dtb__156, dtb__157) -> (match dtb__157 with
  | B_dData_dList.C_List_Nil -> (match (((((v_annotTyOfFuel (fuel - 1)) dflt) env) binders) dtb__156) with
  | B_dData_dMaybe.C_Maybe_Nothing -> B_dData_dMaybe.C_Maybe_Nothing
  | B_dData_dMaybe.C_Maybe_Just (dtb__158) -> (B_dData_dMaybe.C_Maybe_Just ((Vuna_dIr_dModel.C_IrTy_IrTyRef (dtb__158))))
  | _ -> failwith "DT: impossible branch"
)
  | _ -> dflt
)
  | _ -> dflt
)) else (if (g = Base_dIntrinsics.v_marrayTypeName) then (let nd_uscrut6 = args in (match nd_uscrut6 with
  | B_dData_dList.C_List__x58__x58_ (dtb__159, dtb__160) -> (match dtb__160 with
  | B_dData_dList.C_List_Nil -> (match (((((v_annotTyOfFuel (fuel - 1)) dflt) env) binders) dtb__159) with
  | B_dData_dMaybe.C_Maybe_Nothing -> B_dData_dMaybe.C_Maybe_Nothing
  | B_dData_dMaybe.C_Maybe_Just (dtb__161) -> (B_dData_dMaybe.C_Maybe_Just ((Vuna_dIr_dModel.C_IrTy_IrTyArray (dtb__161))))
  | _ -> failwith "DT: impossible branch"
)
  | _ -> dflt
)
  | _ -> dflt
)) else (if (g = Base_dIntrinsics.v_mdynArrayTypeName) then (let nd_uscrut6 = args in (match nd_uscrut6 with
  | B_dData_dList.C_List__x58__x58_ (dtb__162, dtb__163) -> (match dtb__163 with
  | B_dData_dList.C_List_Nil -> (B_dData_dMaybe.C_Maybe_Just ((Vuna_dIr_dModel.C_IrTy_IrTyRef (Vuna_dIr_dModel.C_IrTy_IrTyOpaque))))
  | _ -> dflt
)
  | _ -> dflt
)) else (if (g = Base_dIntrinsics.v_mbufferTypeName) then (match args with
  | B_dData_dList.C_List_Nil -> (B_dData_dMaybe.C_Maybe_Just ((Vuna_dIr_dModel.C_IrTy_IrTyRef (Vuna_dIr_dModel.C_IrTy_IrTyOpaque))))
  | _ -> dflt
) else (if (g = Base_dIntrinsics.v_threadTypeName) then (B_dData_dMaybe.C_Maybe_Just (Vuna_dIr_dModel.C_IrTy_IrTyOpaque)) else (if (g = Base_dIntrinsics.v_mutexTypeName) then (B_dData_dMaybe.C_Maybe_Just (Vuna_dIr_dModel.C_IrTy_IrTyOpaque)) else (if (g = Base_dIntrinsics.v_condvarTypeName) then (B_dData_dMaybe.C_Maybe_Just (Vuna_dIr_dModel.C_IrTy_IrTyOpaque)) else (if (g = Base_dIntrinsics.v_atomicTypeName) then (B_dData_dMaybe.C_Maybe_Just (Vuna_dIr_dModel.C_IrTy_IrTyOpaque)) else (match (v_reprTyIr g) with
  | B_dData_dMaybe.C_Maybe_Just (dtb__164) -> (match args with
  | B_dData_dList.C_List_Nil -> (B_dData_dMaybe.C_Maybe_Just (dtb__164))
  | _ -> dflt
)
  | B_dData_dMaybe.C_Maybe_Nothing -> (if ((((B_dContainer_dHashMap.v_member B_dData_dString.v_Hashable_ue4b0f10b020a5e82_uString) B_dData_dString.v_Eq_u018fc178ff3df1b4_uString) g) (env).Lowering_dEnv.f_LwEnv_lwDataTbl) then (match ((((((v_annotFamilyArgs (fuel - 1)) dflt) env) binders) ((Lowering_dEnv.v_lookupTyParamsIn (env).Lowering_dEnv.f_LwEnv_lwTyParams) g)) args) with
  | B_dData_dMaybe.C_Maybe_Nothing -> B_dData_dMaybe.C_Maybe_Nothing
  | B_dData_dMaybe.C_Maybe_Just (dtb__165) -> (B_dData_dMaybe.C_Maybe_Just ((Vuna_dIr_dModel.C_IrTy_IrTyData (g, dtb__165))))
  | _ -> failwith "DT: impossible branch"
) else dflt)
  | _ -> failwith "DT: impossible branch"
))))))))))))
# 526 "Vuna/Compiler/Lowering/Ty.vuna"
and v_annotFamilyArgs = (fun (fuel : int) (dflt : Vuna_dIr_dModel.t_IrTy B_dData_dMaybe.t_Maybe) (env : Lowering_dEnv.t_LwEnv) (binders : Vuna_dIr_dModel.t_IrBinder B_dData_dList.t_List) (usedPats : int B_dData_dList.t_List) (args : Core_dTerm.t_Term B_dData_dList.t_List) -> (if (fuel <= 0) then B_dData_dMaybe.C_Maybe_Nothing else (match usedPats with
  | B_dData_dList.C_List_Nil -> (B_dData_dMaybe.C_Maybe_Just (B_dData_dList.C_List_Nil))
  | B_dData_dList.C_List__x58__x58_ (dtb__166, dtb__167) -> (match ((v_nthTermIn args) dtb__166) with
  | B_dData_dMaybe.C_Maybe_Nothing -> B_dData_dMaybe.C_Maybe_Nothing
  | B_dData_dMaybe.C_Maybe_Just (dtb__168) -> (match (((((v_annotTyOfFuel (fuel - 1)) dflt) env) binders) dtb__168) with
  | B_dData_dMaybe.C_Maybe_Nothing -> B_dData_dMaybe.C_Maybe_Nothing
  | B_dData_dMaybe.C_Maybe_Just (dtb__169) -> (match ((((((v_annotFamilyArgs (fuel - 1)) dflt) env) binders) dtb__167) args) with
  | B_dData_dMaybe.C_Maybe_Nothing -> B_dData_dMaybe.C_Maybe_Nothing
  | B_dData_dMaybe.C_Maybe_Just (dtb__170) -> (B_dData_dMaybe.C_Maybe_Just ((B_dData_dList.C_List__x58__x58_ (dtb__169, dtb__170))))
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
)))
# 549 "Vuna/Compiler/Lowering/Ty.vuna"
and v_ctorTypeArgsOf = (fun (env : Lowering_dEnv.t_LwEnv) (ctor : string) (args : (Core_dTerm.t_Term, Core_dTerm.t_Rig) B_dData_dPair.t_Pair B_dData_dList.t_List) -> (let nd_uscrut3 = ((((B_dContainer_dHashMap.v_lookup B_dData_dString.v_Hashable_ue4b0f10b020a5e82_uString) B_dData_dString.v_Eq_u018fc178ff3df1b4_uString) ctor) (env).Lowering_dEnv.f_LwEnv_lwCtors) in (match nd_uscrut3 with
  | B_dData_dMaybe.C_Maybe_Nothing -> B_dData_dMaybe.C_Maybe_Nothing
  | B_dData_dMaybe.C_Maybe_Just (dtb__171) -> (match dtb__171 with
  | { B_dData_dPair.f_Pair_first = dtb__172; B_dData_dPair.f_Pair_second = dtb__173 } -> (if ((((B_dContainer_dHashMap.v_member B_dData_dString.v_Hashable_ue4b0f10b020a5e82_uString) B_dData_dString.v_Eq_u018fc178ff3df1b4_uString) dtb__172) (env).Lowering_dEnv.f_LwEnv_lwDataTbl) then ((((((v_annotFamilyArgs 256) B_dData_dMaybe.C_Maybe_Nothing) env) B_dData_dList.C_List_Nil) ((Lowering_dEnv.v_lookupTyParamsIn (env).Lowering_dEnv.f_LwEnv_lwTyParams) dtb__172)) ((B_dData_dList.v_map B_dData_dPair.v_firstOf) args)) else B_dData_dMaybe.C_Maybe_Nothing)
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
)))

# 254 "Vuna/Compiler/Lowering/Ty.vuna"
let v_annotTyOf = (fun (env : Lowering_dEnv.t_LwEnv) (binders : Vuna_dIr_dModel.t_IrBinder B_dData_dList.t_List) (t : Core_dTerm.t_Term) -> (((((v_annotTyOfFuel 256) B_dData_dMaybe.C_Maybe_Nothing) env) binders) t))

# 261 "Vuna/Compiler/Lowering/Ty.vuna"
let v_annotTyOfTotal = (fun (env : Lowering_dEnv.t_LwEnv) (binders : Vuna_dIr_dModel.t_IrBinder B_dData_dList.t_List) (t : Core_dTerm.t_Term) -> (match (((((v_annotTyOfFuel 256) (B_dData_dMaybe.C_Maybe_Just (Vuna_dIr_dModel.C_IrTy_IrTyOpaque))) env) binders) t) with
  | B_dData_dMaybe.C_Maybe_Just (dtb__174) -> dtb__174
  | B_dData_dMaybe.C_Maybe_Nothing -> Vuna_dIr_dModel.C_IrTy_IrTyOpaque
  | _ -> failwith "DT: impossible branch"
))

# 400 "Vuna/Compiler/Lowering/Ty.vuna"
let rec v_annotRunTyOf = (fun (mc0 : Lowering_dEnv.t_LwEnv) (mc1 : Vuna_dIr_dModel.t_IrBinder B_dData_dList.t_List) (mc2 : Core_dTerm.t_Term) -> (match mc2 with
  | Core_dTerm.C_Term_TIf (dtb__175, dtb__176, dtb__177) -> (((v_annotRunTyOf mc0) mc1) dtb__176)
  | Core_dTerm.C_Term_TVar (dtb__178, dtb__179, dtb__180) -> ((v_binderTyAtRuntime dtb__179) mc1)
  | _ -> (((v_annotTyOf mc0) mc1) mc2)
))

# 422 "Vuna/Compiler/Lowering/Ty.vuna"
let v_annotRunTyOfTotal = (fun (env : Lowering_dEnv.t_LwEnv) (binders : Vuna_dIr_dModel.t_IrBinder B_dData_dList.t_List) (t : Core_dTerm.t_Term) -> (match (((v_annotRunTyOf env) binders) t) with
  | B_dData_dMaybe.C_Maybe_Just (dtb__181) -> dtb__181
  | B_dData_dMaybe.C_Maybe_Nothing -> Vuna_dIr_dModel.C_IrTy_IrTyOpaque
  | _ -> failwith "DT: impossible branch"
))

# 451 "Vuna/Compiler/Lowering/Ty.vuna"
let v_annotGlobalTy = (fun (env : Lowering_dEnv.t_LwEnv) (binders : Vuna_dIr_dModel.t_IrBinder B_dData_dList.t_List) (g : string) -> (if ((((B_dContainer_dHashMap.v_member B_dData_dString.v_Hashable_ue4b0f10b020a5e82_uString) B_dData_dString.v_Eq_u018fc178ff3df1b4_uString) g) (env).Lowering_dEnv.f_LwEnv_lwDataTbl) then (((v_annotTyOf env) binders) (Core_dTerm.C_Term_TGlobal (g))) else (match ((v_globalTyTermOf env) g) with
  | B_dData_dMaybe.C_Maybe_Just (dtb__182) -> (B_dData_dMaybe.C_Maybe_Just ((((((v_renderPiTy B_dData_dList.C_List_Nil) (env).Lowering_dEnv.f_LwEnv_lwTyParams) (env).Lowering_dEnv.f_LwEnv_lwDataTbl) 0) ((Core_dEval.v_eval B_dData_dList.C_List_Nil) dtb__182))))
  | B_dData_dMaybe.C_Maybe_Nothing -> (((v_annotTyOf env) binders) (Core_dTerm.C_Term_TGlobal (g)))
  | _ -> failwith "DT: impossible branch"
)))

# 428 "Vuna/Compiler/Lowering/Ty.vuna"
let v_annotCalleeTy = (fun (mc0 : Lowering_dEnv.t_LwEnv) (mc1 : Vuna_dIr_dModel.t_IrBinder B_dData_dList.t_List) (mc2 : Core_dTerm.t_Term) -> (match mc2 with
  | Core_dTerm.C_Term_TApp (dtb__183, dtb__184, dtb__185) -> (let nd_uscrut6 = (v_flattenAnnotAppRig mc2) in (match nd_uscrut6 with
  | { B_dData_dPair.f_Pair_first = dtb__186; B_dData_dPair.f_Pair_second = dtb__187 } -> (match dtb__186 with
  | Core_dTerm.C_Term_TGlobal (dtb__188) -> (if ((((B_dContainer_dHashMap.v_member B_dData_dString.v_Hashable_ue4b0f10b020a5e82_uString) B_dData_dString.v_Eq_u018fc178ff3df1b4_uString) dtb__188) (mc0).Lowering_dEnv.f_LwEnv_lwDataTbl) then (((v_annotTyOf mc0) mc1) mc2) else (match ((v_globalTyTermOf mc0) dtb__188) with
  | B_dData_dMaybe.C_Maybe_Just (dtb__189) -> ((((v_peelPiArgsTy 256) mc0) ((Core_dEval.v_eval B_dData_dList.C_List_Nil) dtb__189)) dtb__187)
  | B_dData_dMaybe.C_Maybe_Nothing -> ((v_peelIrFuns (v_countRuntimeArgs dtb__187)) (((v_annotTyOf mc0) mc1) (Core_dTerm.C_Term_TGlobal (dtb__188))))
  | _ -> failwith "DT: impossible branch"
))
  | _ -> ((v_peelIrFuns (v_countRuntimeArgs dtb__187)) (B_dData_dMaybe.C_Maybe_Just ((((v_annotTyOfTotal mc0) mc1) dtb__186))))
)
  | _ -> failwith "DT: impossible branch"
))
  | Core_dTerm.C_Term_TGlobal (dtb__190) -> (((v_annotGlobalTy mc0) mc1) dtb__190)
  | _ -> (((v_annotTyOf mc0) mc1) mc2)
))

# 414 "Vuna/Compiler/Lowering/Ty.vuna"
let v_annotRunCalleeTy = (fun (mc0 : Lowering_dEnv.t_LwEnv) (mc1 : Vuna_dIr_dModel.t_IrBinder B_dData_dList.t_List) (mc2 : Core_dTerm.t_Term) -> (match mc2 with
  | Core_dTerm.C_Term_TApp (dtb__191, dtb__192, dtb__193) -> (let nd_uscrut6 = (v_flattenAnnotAppRig mc2) in (match nd_uscrut6 with
  | { B_dData_dPair.f_Pair_first = dtb__194; B_dData_dPair.f_Pair_second = dtb__195 } -> (match dtb__194 with
  | Core_dTerm.C_Term_TGlobal (dtb__196) -> (((v_annotCalleeTy mc0) mc1) mc2)
  | _ -> ((v_peelIrFuns (v_countRuntimeArgs dtb__195)) (B_dData_dMaybe.C_Maybe_Just ((((v_annotRunTyOfTotal mc0) mc1) dtb__194))))
)
  | _ -> failwith "DT: impossible branch"
))
  | Core_dTerm.C_Term_TGlobal (dtb__197) -> (((v_annotGlobalTy mc0) mc1) dtb__197)
  | _ -> (((v_annotRunTyOf mc0) mc1) mc2)
))

# 565 "Vuna/Compiler/Lowering/Ty.vuna"
let rec v_findCtorInLocal = (fun (mc0 : string) (mc1 : Elab_dTypes.t_DtCtor B_dData_dList.t_List) -> (match mc1 with
  | B_dData_dList.C_List__x58__x58_ (dtb__198, dtb__199) -> (if ((Elab_dTypes.v_dtCtorName dtb__198) = mc0) then (B_dData_dMaybe.C_Maybe_Just (dtb__198)) else ((v_findCtorInLocal mc0) dtb__199))
  | B_dData_dList.C_List_Nil -> B_dData_dMaybe.C_Maybe_Nothing
  | _ -> failwith "DT: impossible branch"
))

# 571 "Vuna/Compiler/Lowering/Ty.vuna"
let v_ctorKeptFieldTys = (fun (env : Lowering_dEnv.t_LwEnv) (ctor : string) -> (let nd_uscrut2 = ((((B_dContainer_dHashMap.v_lookup B_dData_dString.v_Hashable_ue4b0f10b020a5e82_uString) B_dData_dString.v_Eq_u018fc178ff3df1b4_uString) ctor) (env).Lowering_dEnv.f_LwEnv_lwCtors) in (match nd_uscrut2 with
  | B_dData_dMaybe.C_Maybe_Just (dtb__200) -> (match dtb__200 with
  | { B_dData_dPair.f_Pair_first = dtb__201; B_dData_dPair.f_Pair_second = dtb__202 } -> (match ((((B_dContainer_dHashMap.v_lookup B_dData_dString.v_Hashable_ue4b0f10b020a5e82_uString) B_dData_dString.v_Eq_u018fc178ff3df1b4_uString) dtb__201) (env).Lowering_dEnv.f_LwEnv_lwDataTbl) with
  | B_dData_dMaybe.C_Maybe_Nothing -> (Base_dDiag.C_Check_OkC (B_dData_dList.C_List_Nil))
  | B_dData_dMaybe.C_Maybe_Just (dtb__203) -> (match ((v_findCtorInLocal ctor) (Elab_dTypes.v_dtDataCtors dtb__203)) with
  | B_dData_dMaybe.C_Maybe_Nothing -> (Base_dDiag.C_Check_OkC (B_dData_dList.C_List_Nil))
  | B_dData_dMaybe.C_Maybe_Just (dtb__204) -> (let levels = ((Lowering_dEnv.v_lookupTyParamsIn (env).Lowering_dEnv.f_LwEnv_lwTyParams) dtb__201) in ((Base_dCommon.v_bind (((((((((v_ctorFieldTys levels) (env).Lowering_dEnv.f_LwEnv_lwTyParams) (env).Lowering_dEnv.f_LwEnv_lwDataTbl) dtb__202) ((Lowering_dEnv.v_ctorOpaqueFlagsOf (env).Lowering_dEnv.f_LwEnv_lwDatas) dtb__204)) (Elab_dTypes.v_dtCtorTelescope dtb__204)) 0) ((Core_dEval.v_eval B_dData_dList.C_List_Nil) (Elab_dTypes.v_dtCtorType dtb__204))) (Lowering_dEnv.v_listLength levels))) (fun (p : (Vuna_dIr_dModel.t_IrTy B_dData_dList.t_List, int) B_dData_dPair.t_Pair) -> (Base_dDiag.C_Check_OkC ((B_dData_dPair.v_firstOf p))))))
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
)
  | B_dData_dMaybe.C_Maybe_Nothing -> (Base_dDiag.C_Check_OkC (B_dData_dList.C_List_Nil))
  | _ -> failwith "DT: impossible branch"
)))

# 605 "Vuna/Compiler/Lowering/Ty.vuna"
let v_tyDeclOf = (fun (dataTbl : (string, Elab_dTypes.t_DtData) B_dContainer_dHashMap.t_HashMap) (table : (string, int B_dData_dList.t_List) B_dContainer_dHashMap.t_HashMap) (allDatas : Elab_dTypes.t_DtData B_dData_dList.t_List) (unboxed : (string, (Elab_dTypes.t_DtCtor, int) B_dData_dPair.t_Pair) B_dData_dPair.t_Pair B_dData_dList.t_List) (d : Elab_dTypes.t_DtData) -> (let levels = ((Lowering_dEnv.v_lookupTyParamsIn table) (Elab_dTypes.v_dtDataName d)) in (let arity = (Lowering_dEnv.v_listLength levels) in (let nd_uscrut7 = ((Elab_dRepresentation.v_lookupUnboxedInfo (Elab_dTypes.v_dtDataName d)) unboxed) in (match nd_uscrut7 with
  | B_dData_dMaybe.C_Maybe_Nothing -> (if (Lowering_dEnv.v_hasRecordRepr d) then (let nd_uscrut9 = (Elab_dTypes.v_dtDataCtors d) in (match nd_uscrut9 with
  | B_dData_dList.C_List__x58__x58_ (dtb__205, dtb__206) -> (match dtb__206 with
  | B_dData_dList.C_List_Nil -> ((Base_dCommon.v_bind (((((((((v_ctorFieldTys levels) table) dataTbl) (Elab_dRepresentation.v_ctorKeepFlags dtb__205)) ((Lowering_dEnv.v_ctorOpaqueFlagsOf allDatas) dtb__205)) (Elab_dTypes.v_dtCtorTelescope dtb__205)) 0) ((Core_dEval.v_eval B_dData_dList.C_List_Nil) (Elab_dTypes.v_dtCtorType dtb__205))) arity)) (fun (p : (Vuna_dIr_dModel.t_IrTy B_dData_dList.t_List, int) B_dData_dPair.t_Pair) -> (let fields = (Lowering_dEnv.v_recordRtFields d) in (let tys = (B_dData_dPair.v_firstOf p) in (if ((Lowering_dEnv.v_listLength fields) = (Lowering_dEnv.v_listLength tys)) then (Base_dDiag.C_Check_OkC ((Vuna_dIr_dModel.C_IrTyDecl_IrRecordDecl ((Elab_dTypes.v_dtDataName d), (B_dData_dPair.v_secondOf p), fields, tys)))) else (Base_dDiag.v_icInternal (String.concat "" ["record `"; (Elab_dTypes.v_dtDataName d); "` has "; (string_of_int (Lowering_dEnv.v_listLength fields)); " runtime fields but "; (string_of_int (Lowering_dEnv.v_listLength tys)); " field types"])))))))
  | _ -> (Base_dDiag.v_icInternal ("record family must have exactly one constructor: " ^ (Elab_dTypes.v_dtDataName d)))
)
  | _ -> (Base_dDiag.v_icInternal ("record family must have exactly one constructor: " ^ (Elab_dTypes.v_dtDataName d)))
)) else ((Base_dCommon.v_bind (((((v_dataArityNeed dataTbl) levels) table) allDatas) (Elab_dTypes.v_dtDataCtors d))) (fun (fullArity : int) -> ((Base_dCommon.v_bind ((Base_dCommon.v_traverse (fun (c : Elab_dTypes.t_DtCtor) -> ((Base_dCommon.v_bind (((((((((v_ctorFieldTys levels) table) dataTbl) (Elab_dRepresentation.v_ctorKeepFlags c)) ((Lowering_dEnv.v_ctorOpaqueFlagsOf allDatas) c)) (Elab_dTypes.v_dtCtorTelescope c)) 0) ((Core_dEval.v_eval B_dData_dList.C_List_Nil) (Elab_dTypes.v_dtCtorType c))) (Lowering_dEnv.v_listLength levels))) (fun (p : (Vuna_dIr_dModel.t_IrTy B_dData_dList.t_List, int) B_dData_dPair.t_Pair) -> (Base_dDiag.C_Check_OkC ({ B_dData_dPair.f_Pair_first = (Elab_dTypes.v_dtCtorName c); B_dData_dPair.f_Pair_second = (B_dData_dPair.v_firstOf p) })))))) (Elab_dTypes.v_dtDataCtors d))) (fun (ctors : (string, Vuna_dIr_dModel.t_IrTy B_dData_dList.t_List) B_dData_dPair.t_Pair B_dData_dList.t_List) -> (Base_dDiag.C_Check_OkC ((Vuna_dIr_dModel.C_IrTyDecl_IrVariantDecl ((Elab_dTypes.v_dtDataName d), fullArity, ctors)))))))))
  | B_dData_dMaybe.C_Maybe_Just (dtb__207) -> (match dtb__207 with
  | { B_dData_dPair.f_Pair_first = dtb__208; B_dData_dPair.f_Pair_second = dtb__209 } -> ((Base_dCommon.v_bind (((((((((v_ctorFieldTys levels) table) dataTbl) (Elab_dRepresentation.v_ctorKeepFlags dtb__208)) ((Lowering_dEnv.v_ctorOpaqueFlagsOf allDatas) dtb__208)) (Elab_dTypes.v_dtCtorTelescope dtb__208)) 0) ((Core_dEval.v_eval B_dData_dList.C_List_Nil) (Elab_dTypes.v_dtCtorType dtb__208))) arity)) (fun (p : (Vuna_dIr_dModel.t_IrTy B_dData_dList.t_List, int) B_dData_dPair.t_Pair) -> (let nd_uscrut15 = (B_dData_dPair.v_firstOf p) in (match nd_uscrut15 with
  | B_dData_dList.C_List__x58__x58_ (dtb__210, dtb__211) -> (match dtb__211 with
  | B_dData_dList.C_List_Nil -> (Base_dDiag.C_Check_OkC ((Vuna_dIr_dModel.C_IrTyDecl_IrUnboxedDecl ((Elab_dTypes.v_dtDataName d), (B_dData_dPair.v_secondOf p), dtb__210))))
  | _ -> (Base_dDiag.v_icInternal ("unboxed constructor does not have exactly one kept field: " ^ (Elab_dTypes.v_dtCtorName dtb__208)))
)
  | _ -> (Base_dDiag.v_icInternal ("unboxed constructor does not have exactly one kept field: " ^ (Elab_dTypes.v_dtCtorName dtb__208)))
))))
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
)))))

# 598 "Vuna/Compiler/Lowering/Ty.vuna"
let rec v_tyDeclsGo = (fun (mc0 : (string, Elab_dTypes.t_DtData) B_dContainer_dHashMap.t_HashMap) (mc1 : (string, int B_dData_dList.t_List) B_dContainer_dHashMap.t_HashMap) (mc2 : Elab_dTypes.t_DtData B_dData_dList.t_List) (mc3 : (string, (Elab_dTypes.t_DtCtor, int) B_dData_dPair.t_Pair) B_dData_dPair.t_Pair B_dData_dList.t_List) (mc4 : Elab_dTypes.t_DtData B_dData_dList.t_List) -> (match mc4 with
  | B_dData_dList.C_List__x58__x58_ (dtb__212, dtb__213) -> ((Base_dCommon.v_bind (((((v_tyDeclOf mc0) mc1) mc2) mc3) dtb__212)) (fun (decl : Vuna_dIr_dModel.t_IrTyDecl) -> ((Base_dCommon.v_bind (((((v_tyDeclsGo mc0) mc1) mc2) mc3) dtb__213)) (fun (tail : Vuna_dIr_dModel.t_IrTyDecl B_dData_dList.t_List) -> (Base_dDiag.C_Check_OkC ((B_dData_dList.C_List__x58__x58_ (decl, tail))))))))
  | B_dData_dList.C_List_Nil -> (Base_dDiag.C_Check_OkC (B_dData_dList.C_List_Nil))
  | _ -> failwith "DT: impossible branch"
))

# 594 "Vuna/Compiler/Lowering/Ty.vuna"
let v_tyDeclsOf = (fun (dataTbl : (string, Elab_dTypes.t_DtData) B_dContainer_dHashMap.t_HashMap) (tyParams : (string, int B_dData_dList.t_List) B_dContainer_dHashMap.t_HashMap) (unboxed : (string, (Elab_dTypes.t_DtCtor, int) B_dData_dPair.t_Pair) B_dData_dPair.t_Pair B_dData_dList.t_List) (allDatas : Elab_dTypes.t_DtData B_dData_dList.t_List) (subset : Elab_dTypes.t_DtData B_dData_dList.t_List) -> (((((v_tyDeclsGo dataTbl) tyParams) allDatas) unboxed) subset))

# 639 "Vuna/Compiler/Lowering/Ty.vuna"
let v_tyDeclTys = (fun (mc0 : Vuna_dIr_dModel.t_IrTyDecl) -> (match mc0 with
  | Vuna_dIr_dModel.C_IrTyDecl_IrUnboxedDecl (dtb__214, dtb__215, dtb__216) -> (B_dData_dList.C_List__x58__x58_ (dtb__216, B_dData_dList.C_List_Nil))
  | Vuna_dIr_dModel.C_IrTyDecl_IrRecordDecl (dtb__217, dtb__218, dtb__219, dtb__220) -> dtb__220
  | Vuna_dIr_dModel.C_IrTyDecl_IrVariantDecl (dtb__221, dtb__222, dtb__223) -> ((B_dData_dList.v_concatMap B_dData_dPair.v_secondOf) dtb__223)
  | _ -> failwith "DT: impossible branch"
))

# 648 "Vuna/Compiler/Lowering/Ty.vuna"
let rec v_foldlTyNames = (fun (mc0 : Vuna_dIr_dModel.t_IrTy B_dData_dList.t_List) (mc1 : string B_dData_dList.t_List) -> (match mc0 with
  | B_dData_dList.C_List__x58__x58_ (dtb__224, dtb__225) -> ((v_foldlTyNames dtb__225) ((v_tyNamesInto dtb__224) mc1))
  | B_dData_dList.C_List_Nil -> mc1
  | _ -> failwith "DT: impossible branch"
))
# 652 "Vuna/Compiler/Lowering/Ty.vuna"
and v_tyNamesInto = (fun (mc0 : Vuna_dIr_dModel.t_IrTy) (mc1 : string B_dData_dList.t_List) -> (match mc0 with
  | Vuna_dIr_dModel.C_IrTy_IrTyData (dtb__226, dtb__227) -> ((v_foldlTyNames dtb__227) ((Lowering_dEnv.v_pushDep dtb__226) mc1))
  | Vuna_dIr_dModel.C_IrTy_IrTyFun (dtb__228, dtb__229) -> ((v_tyNamesInto dtb__229) ((v_tyNamesInto dtb__228) mc1))
  | Vuna_dIr_dModel.C_IrTy_IrTyRef (dtb__230) -> ((v_tyNamesInto dtb__230) mc1)
  | Vuna_dIr_dModel.C_IrTy_IrTyArray (dtb__231) -> ((v_tyNamesInto dtb__231) mc1)
  | Vuna_dIr_dModel.C_IrTy_IrTyOpaque -> mc1
  | Vuna_dIr_dModel.C_IrTy_IrTyFloat -> mc1
  | Vuna_dIr_dModel.C_IrTy_IrTyBool -> mc1
  | Vuna_dIr_dModel.C_IrTy_IrTyStr -> mc1
  | Vuna_dIr_dModel.C_IrTy_IrTyInt -> mc1
  | Vuna_dIr_dModel.C_IrTy_IrTyVar (dtb__232) -> mc1
  | _ -> failwith "DT: impossible branch"
))

# 644 "Vuna/Compiler/Lowering/Ty.vuna"
let rec v_tyDeclRefsGo = (fun (mc0 : Vuna_dIr_dModel.t_IrTy B_dData_dList.t_List B_dData_dList.t_List) (mc1 : string B_dData_dList.t_List) -> (match mc0 with
  | B_dData_dList.C_List__x58__x58_ (dtb__233, dtb__234) -> ((v_tyDeclRefsGo dtb__234) ((v_foldlTyNames dtb__233) mc1))
  | B_dData_dList.C_List_Nil -> (B_dData_dList.v_reverse mc1)
  | _ -> failwith "DT: impossible branch"
))

# 636 "Vuna/Compiler/Lowering/Ty.vuna"
let v_tyDeclRefs = (fun (decls : Vuna_dIr_dModel.t_IrTyDecl B_dData_dList.t_List) -> ((v_tyDeclRefsGo ((B_dData_dList.v_map v_tyDeclTys) decls)) B_dData_dList.C_List_Nil))
