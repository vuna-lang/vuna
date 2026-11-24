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
let v_renderTyIntrinsicWith = (fun (mc0 : (Core_dTerm.t_Value) -> Vuna_dIr_dModel.t_IrTy) (mc1 : string) (mc2 : Core_dTerm.t_Value B_dData_dList.t_List) -> (if (mc1 = "Array") then (match mc2 with
  | B_dData_dList.C_List__x58__x58_ (dtb__1, dtb__2) -> (match dtb__2 with
  | B_dData_dList.C_List_Nil -> (B_dData_dMaybe.C_Maybe_Just ((Vuna_dIr_dModel.C_IrTy_IrTyArray ((mc0 dtb__1)))))
  | _ -> B_dData_dMaybe.C_Maybe_Nothing
)
  | _ -> B_dData_dMaybe.C_Maybe_Nothing
) else (if (mc1 = "IORef") then (match mc2 with
  | B_dData_dList.C_List__x58__x58_ (dtb__3, dtb__4) -> (match dtb__4 with
  | B_dData_dList.C_List_Nil -> (B_dData_dMaybe.C_Maybe_Just ((Vuna_dIr_dModel.C_IrTy_IrTyRef ((mc0 dtb__3)))))
  | _ -> B_dData_dMaybe.C_Maybe_Nothing
)
  | _ -> B_dData_dMaybe.C_Maybe_Nothing
) else (if (mc1 = "@vuna@Cell") then (match mc2 with
  | B_dData_dList.C_List__x58__x58_ (dtb__5, dtb__6) -> (match dtb__6 with
  | B_dData_dList.C_List_Nil -> (B_dData_dMaybe.C_Maybe_Just ((Vuna_dIr_dModel.C_IrTy_IrTyRef ((mc0 dtb__5)))))
  | _ -> B_dData_dMaybe.C_Maybe_Nothing
)
  | _ -> B_dData_dMaybe.C_Maybe_Nothing
) else B_dData_dMaybe.C_Maybe_Nothing))))

# 29 "Vuna/Compiler/Lowering/Ty.vuna"
let rec v_renderTyFuel = (fun (fuel : int) (levels : int B_dData_dList.t_List) (table : (string, int B_dData_dList.t_List) B_dContainer_dHashMap.t_HashMap) (dataTbl : (string, Elab_dTypes.t_DtData) B_dContainer_dHashMap.t_HashMap) (v : Core_dTerm.t_Value) -> (if (fuel <= 0) then Vuna_dIr_dModel.C_IrTy_IrTyOpaque else (match v with
  | Core_dTerm.C_Value_VNeutral (dtb__7) -> (match dtb__7 with
  | Core_dTerm.C_Neutral_NVar (dtb__8, dtb__9, dtb__10) -> (match ((Lowering_dEnv.v_levelSlotIn levels) dtb__9) with
  | B_dData_dMaybe.C_Maybe_Just (dtb__11) -> (Vuna_dIr_dModel.C_IrTy_IrTyVar (dtb__11))
  | B_dData_dMaybe.C_Maybe_Nothing -> Vuna_dIr_dModel.C_IrTy_IrTyOpaque
  | _ -> failwith "DT: impossible branch"
)
  | Core_dTerm.C_Neutral_NGlobal (dtb__12, dtb__13) -> ((((((v_renderTyGlobal fuel) levels) table) dataTbl) dtb__12) dtb__13)
  | _ -> failwith "DT: impossible branch"
)
  | _ -> Vuna_dIr_dModel.C_IrTy_IrTyOpaque
)))
# 60 "Vuna/Compiler/Lowering/Ty.vuna"
and v_renderTyGlobal = (fun (fuel : int) (levels : int B_dData_dList.t_List) (table : (string, int B_dData_dList.t_List) B_dContainer_dHashMap.t_HashMap) (dataTbl : (string, Elab_dTypes.t_DtData) B_dContainer_dHashMap.t_HashMap) (g : string) (sp : Core_dTerm.t_Value B_dData_dList.t_List) -> (match (((v_renderTyIntrinsicWith (fun (x : Core_dTerm.t_Value) -> (((((v_renderTyFuel (fuel - 1)) levels) table) dataTbl) x))) g) sp) with
  | B_dData_dMaybe.C_Maybe_Just (dtb__14) -> dtb__14
  | B_dData_dMaybe.C_Maybe_Nothing -> (match (v_reprTyIr g) with
  | B_dData_dMaybe.C_Maybe_Just (dtb__15) -> dtb__15
  | B_dData_dMaybe.C_Maybe_Nothing -> (if ((((B_dContainer_dHashMap.v_member B_dData_dString.v_Hashable_ue4b0f10b020a5e82_uString) B_dData_dString.v_Eq_u018fc178ff3df1b4_uString) g) dataTbl) then (Vuna_dIr_dModel.C_IrTy_IrTyData (g, ((((((v_renderFamilyArgs (fuel - 1)) levels) table) dataTbl) ((Lowering_dEnv.v_lookupTyParamsIn table) g)) sp))) else Vuna_dIr_dModel.C_IrTy_IrTyOpaque)
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
))
# 84 "Vuna/Compiler/Lowering/Ty.vuna"
and v_renderFamilyArgs = (fun (fuel : int) (levels : int B_dData_dList.t_List) (table : (string, int B_dData_dList.t_List) B_dContainer_dHashMap.t_HashMap) (dataTbl : (string, Elab_dTypes.t_DtData) B_dContainer_dHashMap.t_HashMap) (usedPats : int B_dData_dList.t_List) (args : Core_dTerm.t_Value B_dData_dList.t_List) -> (if (fuel <= 0) then B_dData_dList.C_List_Nil else (match usedPats with
  | B_dData_dList.C_List_Nil -> B_dData_dList.C_List_Nil
  | B_dData_dList.C_List__x58__x58_ (dtb__16, dtb__17) -> (match ((Lowering_dEnv.v_nthValueIn args) dtb__16) with
  | B_dData_dMaybe.C_Maybe_Just (dtb__18) -> (B_dData_dList.C_List__x58__x58_ ((((((v_renderTyFuel (fuel - 1)) levels) table) dataTbl) dtb__18), ((((((v_renderFamilyArgs (fuel - 1)) levels) table) dataTbl) dtb__17) args)))
  | B_dData_dMaybe.C_Maybe_Nothing -> (B_dData_dList.C_List__x58__x58_ (Vuna_dIr_dModel.C_IrTy_IrTyOpaque, ((((((v_renderFamilyArgs (fuel - 1)) levels) table) dataTbl) dtb__17) args)))
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
)))

# 26 "Vuna/Compiler/Lowering/Ty.vuna"
let v_renderTyOf = (fun (levels : int B_dData_dList.t_List) (table : (string, int B_dData_dList.t_List) B_dContainer_dHashMap.t_HashMap) (dataTbl : (string, Elab_dTypes.t_DtData) B_dContainer_dHashMap.t_HashMap) (v : Core_dTerm.t_Value) -> (((((v_renderTyFuel 256) levels) table) dataTbl) v))

# 103 "Vuna/Compiler/Lowering/Ty.vuna"
let rec v_renderPiTyFuel = (fun (fuel : int) (levels : int B_dData_dList.t_List) (table : (string, int B_dData_dList.t_List) B_dContainer_dHashMap.t_HashMap) (dataTbl : (string, Elab_dTypes.t_DtData) B_dContainer_dHashMap.t_HashMap) (lvl : int) (v : Core_dTerm.t_Value) -> (if (fuel <= 0) then (((((v_renderTyFuel fuel) levels) table) dataTbl) v) else (match v with
  | Core_dTerm.C_Value_VPi (dtb__19, dtb__20, dtb__21, dtb__22, dtb__23) -> (let next = ((Core_dEval.v_applyClosure dtb__23) (Core_dTerm.C_Value_VNeutral ((Core_dTerm.C_Neutral_NVar (dtb__19, lvl, B_dData_dList.C_List_Nil))))) in (if (Core_dTerm.v_rigIsErased dtb__21) then ((((((v_renderPiTyFuel (fuel - 1)) levels) table) dataTbl) (lvl + 1)) next) else (Vuna_dIr_dModel.C_IrTy_IrTyFun (((((((v_renderPiTyFuel (fuel - 1)) levels) table) dataTbl) lvl) dtb__22), ((((((v_renderPiTyFuel (fuel - 1)) levels) table) dataTbl) (lvl + 1)) next)))))
  | _ -> (((((v_renderTyFuel fuel) levels) table) dataTbl) v)
)))

# 100 "Vuna/Compiler/Lowering/Ty.vuna"
let v_renderPiTy = (fun (levels : int B_dData_dList.t_List) (table : (string, int B_dData_dList.t_List) B_dContainer_dHashMap.t_HashMap) (dataTbl : (string, Elab_dTypes.t_DtData) B_dContainer_dHashMap.t_HashMap) (lvl : int) (v : Core_dTerm.t_Value) -> ((((((v_renderPiTyFuel 256) levels) table) dataTbl) lvl) v))

# 118 "Vuna/Compiler/Lowering/Ty.vuna"
let v_renderFieldTy = (fun (mc0 : int B_dData_dList.t_List) (mc1 : (string, int B_dData_dList.t_List) B_dContainer_dHashMap.t_HashMap) (mc2 : (string, Elab_dTypes.t_DtData) B_dContainer_dHashMap.t_HashMap) (mc3 : int) (mc4 : Core_dTerm.t_Value) (mc5 : int) -> (match mc4 with
  | Core_dTerm.C_Value_VNeutral (dtb__24) -> (match dtb__24 with
  | Core_dTerm.C_Neutral_NVar (dtb__25, dtb__26, dtb__27) -> (match ((Lowering_dEnv.v_levelSlotIn mc0) dtb__26) with
  | B_dData_dMaybe.C_Maybe_Just (dtb__28) -> (Base_dDiag.C_Check_OkC ({ B_dData_dPair.f_Pair_first = (Vuna_dIr_dModel.C_IrTy_IrTyVar (dtb__28)); B_dData_dPair.f_Pair_second = mc5 }))
  | B_dData_dMaybe.C_Maybe_Nothing -> (Base_dDiag.v_icInternal "constructor field type mentions a type variable outside the family's runtime parameter slots")
  | _ -> failwith "DT: impossible branch"
)
  | Core_dTerm.C_Neutral_NGlobal (dtb__29, dtb__30) -> (match (((v_renderTyIntrinsicWith (fun (x : Core_dTerm.t_Value) -> (((((v_renderTyFuel 256) mc0) mc1) mc2) x))) dtb__29) dtb__30) with
  | B_dData_dMaybe.C_Maybe_Just (dtb__31) -> (Base_dDiag.C_Check_OkC ({ B_dData_dPair.f_Pair_first = dtb__31; B_dData_dPair.f_Pair_second = mc5 }))
  | B_dData_dMaybe.C_Maybe_Nothing -> (match (v_reprTyIr dtb__29) with
  | B_dData_dMaybe.C_Maybe_Just (dtb__32) -> (Base_dDiag.C_Check_OkC ({ B_dData_dPair.f_Pair_first = dtb__32; B_dData_dPair.f_Pair_second = mc5 }))
  | B_dData_dMaybe.C_Maybe_Nothing -> (if ((((B_dContainer_dHashMap.v_member B_dData_dString.v_Hashable_ue4b0f10b020a5e82_uString) B_dData_dString.v_Eq_u018fc178ff3df1b4_uString) dtb__29) mc2) then (Base_dDiag.C_Check_OkC ({ B_dData_dPair.f_Pair_first = (Vuna_dIr_dModel.C_IrTy_IrTyData (dtb__29, ((((((v_renderFamilyArgs 256) mc0) mc1) mc2) ((Lowering_dEnv.v_lookupTyParamsIn mc1) dtb__29)) dtb__30))); B_dData_dPair.f_Pair_second = mc5 })) else (Base_dDiag.v_icInternal ("constructor field type head is not a known family: " ^ dtb__29)))
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
)
  | Core_dTerm.C_Value_VPi (dtb__33, dtb__34, dtb__35, dtb__36, dtb__37) -> (if dtb__34 then (Base_dDiag.C_Check_OkC ({ B_dData_dPair.f_Pair_first = (Vuna_dIr_dModel.C_IrTy_IrTyVar (mc5)); B_dData_dPair.f_Pair_second = (mc5 + 1) })) else (Base_dDiag.C_Check_OkC ({ B_dData_dPair.f_Pair_first = (((((v_renderPiTy mc0) mc1) mc2) mc3) mc4); B_dData_dPair.f_Pair_second = mc5 })))
  | _ -> (Base_dDiag.v_icInternal "constructor field type has no runtime rendering")
))

# 147 "Vuna/Compiler/Lowering/Ty.vuna"
let v_flagMatchesRigIn = (fun (mc0 : bool) (mc1 : Core_dTerm.t_Rig) -> (if mc0 then (B_dData_dBool.v_not (Core_dTerm.v_rigIsErased mc1)) else (Core_dTerm.v_rigIsErased mc1)))

# 152 "Vuna/Compiler/Lowering/Ty.vuna"
let rec v_ctorFieldTys = (fun (mc0 : int B_dData_dList.t_List) (mc1 : (string, int B_dData_dList.t_List) B_dContainer_dHashMap.t_HashMap) (mc2 : (string, Elab_dTypes.t_DtData) B_dContainer_dHashMap.t_HashMap) (mc3 : bool B_dData_dList.t_List) (mc4 : bool B_dData_dList.t_List) (mc5 : (string, Core_dTerm.t_Rig) B_dData_dPair.t_Pair B_dData_dList.t_List) (mc6 : int) (mc7 : Core_dTerm.t_Value) (mc8 : int) -> (match mc3 with
  | B_dData_dList.C_List__x58__x58_ (dtb__38, dtb__39) -> (match mc4 with
  | B_dData_dList.C_List__x58__x58_ (dtb__40, dtb__41) -> (match mc5 with
  | B_dData_dList.C_List__x58__x58_ (dtb__42, dtb__43) -> (match dtb__42 with
  | { B_dData_dPair.f_Pair_first = dtb__44; B_dData_dPair.f_Pair_second = dtb__45 } -> (if ((v_flagMatchesRigIn dtb__38) dtb__45) then (match mc7 with
  | Core_dTerm.C_Value_VPi (dtb__46, dtb__47, dtb__48, dtb__49, dtb__50) -> (let next = ((Core_dEval.v_applyClosure dtb__50) (Core_dTerm.C_Value_VNeutral ((Core_dTerm.C_Neutral_NVar (dtb__46, mc6, B_dData_dList.C_List_Nil))))) in (if dtb__38 then (if dtb__40 then ((Base_dCommon.v_bind (((((((((v_ctorFieldTys mc0) mc1) mc2) dtb__39) dtb__41) dtb__43) (mc6 + 1)) next) mc8)) (fun (p : (Vuna_dIr_dModel.t_IrTy B_dData_dList.t_List, int) B_dData_dPair.t_Pair) -> (match p with
  | { B_dData_dPair.f_Pair_first = dtb__51; B_dData_dPair.f_Pair_second = dtb__52 } -> (Base_dDiag.C_Check_OkC ({ B_dData_dPair.f_Pair_first = (B_dData_dList.C_List__x58__x58_ (Vuna_dIr_dModel.C_IrTy_IrTyOpaque, dtb__51)); B_dData_dPair.f_Pair_second = dtb__52 }))
  | _ -> failwith "DT: impossible branch"
))) else ((Base_dCommon.v_bind ((((((v_renderFieldTy mc0) mc1) mc2) mc6) dtb__49) mc8)) (fun (p : (Vuna_dIr_dModel.t_IrTy, int) B_dData_dPair.t_Pair) -> (match p with
  | { B_dData_dPair.f_Pair_first = dtb__53; B_dData_dPair.f_Pair_second = dtb__54 } -> ((Base_dCommon.v_bind (((((((((v_ctorFieldTys mc0) mc1) mc2) dtb__39) dtb__41) dtb__43) (mc6 + 1)) next) dtb__54)) (fun (q : (Vuna_dIr_dModel.t_IrTy B_dData_dList.t_List, int) B_dData_dPair.t_Pair) -> (match q with
  | { B_dData_dPair.f_Pair_first = dtb__55; B_dData_dPair.f_Pair_second = dtb__56 } -> (Base_dDiag.C_Check_OkC ({ B_dData_dPair.f_Pair_first = (B_dData_dList.C_List__x58__x58_ (dtb__53, dtb__55)); B_dData_dPair.f_Pair_second = dtb__56 }))
  | _ -> failwith "DT: impossible branch"
)))
  | _ -> failwith "DT: impossible branch"
)))) else (((((((((v_ctorFieldTys mc0) mc1) mc2) dtb__39) dtb__41) dtb__43) (mc6 + 1)) next) mc8)))
  | _ -> (Base_dDiag.v_icInternal "constructor telescope does not match its type")
) else (Base_dDiag.v_icInternal "constructor keep flag disagrees with telescope rig"))
  | _ -> failwith "DT: impossible branch"
)
  | B_dData_dList.C_List_Nil -> (Base_dDiag.C_Check_OkC ({ B_dData_dPair.f_Pair_first = B_dData_dList.C_List_Nil; B_dData_dPair.f_Pair_second = mc8 }))
  | _ -> failwith "DT: impossible branch"
)
  | B_dData_dList.C_List_Nil -> (match mc5 with
  | B_dData_dList.C_List__x58__x58_ (dtb__57, dtb__58) -> (Base_dDiag.v_icInternal "constructor opaque flags shorter than its shape")
  | B_dData_dList.C_List_Nil -> (Base_dDiag.C_Check_OkC ({ B_dData_dPair.f_Pair_first = B_dData_dList.C_List_Nil; B_dData_dPair.f_Pair_second = mc8 }))
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
)
  | B_dData_dList.C_List_Nil -> (match mc4 with
  | B_dData_dList.C_List_Nil -> (match mc5 with
  | B_dData_dList.C_List__x58__x58_ (dtb__59, dtb__60) -> (Base_dDiag.v_icInternal "constructor shape has more binders than its telescope")
  | B_dData_dList.C_List_Nil -> (Base_dDiag.C_Check_OkC ({ B_dData_dPair.f_Pair_first = B_dData_dList.C_List_Nil; B_dData_dPair.f_Pair_second = mc8 }))
  | _ -> failwith "DT: impossible branch"
)
  | B_dData_dList.C_List__x58__x58_ (dtb__61, dtb__62) -> (match mc5 with
  | B_dData_dList.C_List_Nil -> (Base_dDiag.C_Check_OkC ({ B_dData_dPair.f_Pair_first = B_dData_dList.C_List_Nil; B_dData_dPair.f_Pair_second = mc8 }))
  | _ -> (Base_dDiag.v_icInternal "constructor opaque flags longer than its shape")
)
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
))

# 191 "Vuna/Compiler/Lowering/Ty.vuna"
let v_ctorArityNeed = (fun (dataTbl : (string, Elab_dTypes.t_DtData) B_dContainer_dHashMap.t_HashMap) (levels : int B_dData_dList.t_List) (table : (string, int B_dData_dList.t_List) B_dContainer_dHashMap.t_HashMap) (datas : Elab_dTypes.t_DtData B_dData_dList.t_List) (c : Elab_dTypes.t_DtCtor) -> ((Base_dCommon.v_bind (((((((((v_ctorFieldTys levels) table) dataTbl) (Elab_dRepresentation.v_ctorKeepFlags c)) ((Lowering_dEnv.v_ctorOpaqueFlagsOf datas) c)) (Elab_dTypes.v_dtCtorTelescope c)) 0) ((Core_dEval.v_eval B_dData_dList.C_List_Nil) (Elab_dTypes.v_dtCtorType c))) (Lowering_dEnv.v_listLength levels))) (fun (p : (Vuna_dIr_dModel.t_IrTy B_dData_dList.t_List, int) B_dData_dPair.t_Pair) -> (Base_dDiag.C_Check_OkC (((B_dData_dPair.v_secondOf p) - (Lowering_dEnv.v_listLength levels)))))))

# 203 "Vuna/Compiler/Lowering/Ty.vuna"
let rec v_maxIntListIn = (fun (mc0 : int B_dData_dList.t_List) -> (match mc0 with
  | B_dData_dList.C_List__x58__x58_ (dtb__63, dtb__64) -> (if (dtb__63 >= (v_maxIntListIn dtb__64)) then dtb__63 else (v_maxIntListIn dtb__64))
  | B_dData_dList.C_List_Nil -> 0
  | _ -> failwith "DT: impossible branch"
))

# 197 "Vuna/Compiler/Lowering/Ty.vuna"
let v_dataArityNeed = (fun (dataTbl : (string, Elab_dTypes.t_DtData) B_dContainer_dHashMap.t_HashMap) (levels : int B_dData_dList.t_List) (table : (string, int B_dData_dList.t_List) B_dContainer_dHashMap.t_HashMap) (datas : Elab_dTypes.t_DtData B_dData_dList.t_List) (ctors : Elab_dTypes.t_DtCtor B_dData_dList.t_List) -> ((Base_dCommon.v_bind ((Base_dCommon.v_traverse ((((v_ctorArityNeed dataTbl) levels) table) datas)) ctors)) (fun (ns : int B_dData_dList.t_List) -> (Base_dDiag.C_Check_OkC (((Lowering_dEnv.v_listLength levels) + (v_maxIntListIn ns)))))))

# 223 "Vuna/Compiler/Lowering/Ty.vuna"
let v_tempAnnotBinderId = (0 - 1)

# 288 "Vuna/Compiler/Lowering/Ty.vuna"
let rec v_binderTyAtIn = (fun (mc0 : int) (mc1 : Vuna_dIr_dModel.t_IrBinder B_dData_dList.t_List) -> (match mc1 with
  | B_dData_dList.C_List__x58__x58_ (dtb__65, dtb__66) -> (if (mc0 <= 0) then (if (dtb__65).Vuna_dIr_dModel.f_IrBinder_irBinderErased then B_dData_dMaybe.C_Maybe_Nothing else (dtb__65).Vuna_dIr_dModel.f_IrBinder_irBinderTy) else ((v_binderTyAtIn (mc0 - 1)) dtb__66))
  | B_dData_dList.C_List_Nil -> B_dData_dMaybe.C_Maybe_Nothing
  | _ -> failwith "DT: impossible branch"
))

# 297 "Vuna/Compiler/Lowering/Ty.vuna"
let rec v_flattenAnnotAppGo = (fun (mc0 : Core_dTerm.t_Term) (mc1 : Core_dTerm.t_Term B_dData_dList.t_List) -> (match mc0 with
  | Core_dTerm.C_Term_TRecord (dtb__67, dtb__68) -> { B_dData_dPair.f_Pair_first = (Core_dTerm.C_Term_TGlobal (dtb__67)); B_dData_dPair.f_Pair_second = ((B_dData_dList.v_append ((B_dData_dList.v_map B_dData_dPair.v_firstOf) dtb__68)) mc1) }
  | Core_dTerm.C_Term_TApp (dtb__69, dtb__70, dtb__71) -> ((v_flattenAnnotAppGo dtb__69) (B_dData_dList.C_List__x58__x58_ (dtb__70, mc1)))
  | _ -> { B_dData_dPair.f_Pair_first = mc0; B_dData_dPair.f_Pair_second = mc1 }
))

# 294 "Vuna/Compiler/Lowering/Ty.vuna"
let v_flattenAnnotApp = (fun (t : Core_dTerm.t_Term) -> ((v_flattenAnnotAppGo t) B_dData_dList.C_List_Nil))

# 355 "Vuna/Compiler/Lowering/Ty.vuna"
let rec v_binderTyAtRuntime = (fun (mc0 : int) (mc1 : Vuna_dIr_dModel.t_IrBinder B_dData_dList.t_List) -> (match mc1 with
  | B_dData_dList.C_List__x58__x58_ (dtb__72, dtb__73) -> (if (dtb__72).Vuna_dIr_dModel.f_IrBinder_irBinderErased then ((v_binderTyAtRuntime mc0) dtb__73) else (if (mc0 <= 0) then (dtb__72).Vuna_dIr_dModel.f_IrBinder_irBinderTy else ((v_binderTyAtRuntime (mc0 - 1)) dtb__73)))
  | B_dData_dList.C_List_Nil -> B_dData_dMaybe.C_Maybe_Nothing
  | _ -> failwith "DT: impossible branch"
))

# 393 "Vuna/Compiler/Lowering/Ty.vuna"
let v_globalTyTermOf = (fun (env : Lowering_dEnv.t_LwEnv) (g : string) -> (match ((((B_dContainer_dHashMap.v_lookup B_dData_dString.v_Hashable_ue4b0f10b020a5e82_uString) B_dData_dString.v_Eq_u018fc178ff3df1b4_uString) g) (env).Lowering_dEnv.f_LwEnv_lwDefTbl) with
  | B_dData_dMaybe.C_Maybe_Just (dtb__74) -> (B_dData_dMaybe.C_Maybe_Just ((Elab_dTypes.v_dtDefType dtb__74)))
  | B_dData_dMaybe.C_Maybe_Nothing -> ((((B_dContainer_dHashMap.v_lookup B_dData_dString.v_Hashable_ue4b0f10b020a5e82_uString) B_dData_dString.v_Eq_u018fc178ff3df1b4_uString) g) (env).Lowering_dEnv.f_LwEnv_lwGlobals)
  | _ -> failwith "DT: impossible branch"
))

# 413 "Vuna/Compiler/Lowering/Ty.vuna"
let rec v_flattenAnnotAppRigGo = (fun (mc0 : Core_dTerm.t_Term) (mc1 : (Core_dTerm.t_Term, Core_dTerm.t_Rig) B_dData_dPair.t_Pair B_dData_dList.t_List) -> (match mc0 with
  | Core_dTerm.C_Term_TRecord (dtb__75, dtb__76) -> { B_dData_dPair.f_Pair_first = (Core_dTerm.C_Term_TGlobal (dtb__75)); B_dData_dPair.f_Pair_second = ((B_dData_dList.v_append dtb__76) mc1) }
  | Core_dTerm.C_Term_TApp (dtb__77, dtb__78, dtb__79) -> ((v_flattenAnnotAppRigGo dtb__77) (B_dData_dList.C_List__x58__x58_ ({ B_dData_dPair.f_Pair_first = dtb__78; B_dData_dPair.f_Pair_second = dtb__79 }, mc1)))
  | _ -> { B_dData_dPair.f_Pair_first = mc0; B_dData_dPair.f_Pair_second = mc1 }
))

# 410 "Vuna/Compiler/Lowering/Ty.vuna"
let v_flattenAnnotAppRig = (fun (t : Core_dTerm.t_Term) -> ((v_flattenAnnotAppRigGo t) B_dData_dList.C_List_Nil))

# 418 "Vuna/Compiler/Lowering/Ty.vuna"
let rec v_countRuntimeArgs = (fun (mc0 : (Core_dTerm.t_Term, Core_dTerm.t_Rig) B_dData_dPair.t_Pair B_dData_dList.t_List) -> (match mc0 with
  | B_dData_dList.C_List__x58__x58_ (dtb__80, dtb__81) -> (match dtb__80 with
  | { B_dData_dPair.f_Pair_first = dtb__82; B_dData_dPair.f_Pair_second = dtb__83 } -> (if (Core_dTerm.v_rigIsErased dtb__83) then (v_countRuntimeArgs dtb__81) else (1 + (v_countRuntimeArgs dtb__81)))
  | _ -> failwith "DT: impossible branch"
)
  | B_dData_dList.C_List_Nil -> 0
  | _ -> failwith "DT: impossible branch"
))

# 423 "Vuna/Compiler/Lowering/Ty.vuna"
let rec v_peelIrFuns = (fun (mc0 : int) (mc1 : Vuna_dIr_dModel.t_IrTy B_dData_dMaybe.t_Maybe) -> (match mc1 with
  | B_dData_dMaybe.C_Maybe_Just (dtb__84) -> (if (mc0 <= 0) then (B_dData_dMaybe.C_Maybe_Just (dtb__84)) else (match dtb__84 with
  | Vuna_dIr_dModel.C_IrTy_IrTyFun (dtb__85, dtb__86) -> ((v_peelIrFuns (mc0 - 1)) (B_dData_dMaybe.C_Maybe_Just (dtb__86)))
  | _ -> B_dData_dMaybe.C_Maybe_Nothing
))
  | B_dData_dMaybe.C_Maybe_Nothing -> B_dData_dMaybe.C_Maybe_Nothing
  | _ -> failwith "DT: impossible branch"
))

# 435 "Vuna/Compiler/Lowering/Ty.vuna"
let rec v_peelPiArgsTy = (fun (fuel : int) (env : Lowering_dEnv.t_LwEnv) (v : Core_dTerm.t_Value) (args : (Core_dTerm.t_Term, Core_dTerm.t_Rig) B_dData_dPair.t_Pair B_dData_dList.t_List) -> (if (fuel <= 0) then B_dData_dMaybe.C_Maybe_Nothing else (match v with
  | Core_dTerm.C_Value_VPi (dtb__87, dtb__88, dtb__89, dtb__90, dtb__91) -> (if (Core_dTerm.v_rigIsErased dtb__89) then (let nd_uscrut9 = args in (match nd_uscrut9 with
  | B_dData_dList.C_List_Nil -> (B_dData_dMaybe.C_Maybe_Just ((((((v_renderPiTy B_dData_dList.C_List_Nil) (env).Lowering_dEnv.f_LwEnv_lwTyParams) (env).Lowering_dEnv.f_LwEnv_lwDataTbl) 0) v)))
  | B_dData_dList.C_List__x58__x58_ (dtb__92, dtb__93) -> (match dtb__92 with
  | { B_dData_dPair.f_Pair_first = dtb__94; B_dData_dPair.f_Pair_second = dtb__95 } -> (if (Core_dTerm.v_rigIsErased dtb__95) then ((((v_peelPiArgsTy (fuel - 1)) env) ((Core_dEval.v_applyClosure dtb__91) ((Core_dEval.v_eval B_dData_dList.C_List_Nil) dtb__94))) dtb__93) else ((((v_peelPiArgsTy (fuel - 1)) env) ((Core_dEval.v_applyClosure dtb__91) (Core_dTerm.C_Value_VNeutral ((Core_dTerm.C_Neutral_NVar (dtb__87, 0, B_dData_dList.C_List_Nil)))))) args))
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
)) else (let nd_uscrut9 = args in (match nd_uscrut9 with
  | B_dData_dList.C_List_Nil -> (B_dData_dMaybe.C_Maybe_Just ((((((v_renderPiTy B_dData_dList.C_List_Nil) (env).Lowering_dEnv.f_LwEnv_lwTyParams) (env).Lowering_dEnv.f_LwEnv_lwDataTbl) 0) v)))
  | B_dData_dList.C_List__x58__x58_ (dtb__96, dtb__97) -> (match dtb__96 with
  | { B_dData_dPair.f_Pair_first = dtb__98; B_dData_dPair.f_Pair_second = dtb__99 } -> ((((v_peelPiArgsTy (fuel - 1)) env) ((Core_dEval.v_applyClosure dtb__91) (Core_dTerm.C_Value_VNeutral ((Core_dTerm.C_Neutral_NVar (dtb__87, 0, B_dData_dList.C_List_Nil)))))) dtb__97)
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
)))
  | _ -> (B_dData_dMaybe.C_Maybe_Just ((((((v_renderPiTy B_dData_dList.C_List_Nil) (env).Lowering_dEnv.f_LwEnv_lwTyParams) (env).Lowering_dEnv.f_LwEnv_lwDataTbl) 0) v)))
)))

# 472 "Vuna/Compiler/Lowering/Ty.vuna"
let rec v_nthTermIn = (fun (mc0 : Core_dTerm.t_Term B_dData_dList.t_List) (mc1 : int) -> (match mc0 with
  | B_dData_dList.C_List__x58__x58_ (dtb__100, dtb__101) -> (if (mc1 <= 0) then (B_dData_dMaybe.C_Maybe_Just (dtb__100)) else ((v_nthTermIn dtb__101) (mc1 - 1)))
  | B_dData_dList.C_List_Nil -> B_dData_dMaybe.C_Maybe_Nothing
  | _ -> failwith "DT: impossible branch"
))

# 234 "Vuna/Compiler/Lowering/Ty.vuna"
let rec v_annotTyOfFuel = (fun (fuel : int) (dflt : Vuna_dIr_dModel.t_IrTy B_dData_dMaybe.t_Maybe) (env : Lowering_dEnv.t_LwEnv) (binders : Vuna_dIr_dModel.t_IrBinder B_dData_dList.t_List) (t : Core_dTerm.t_Term) -> (if (fuel <= 0) then dflt else (match t with
  | Core_dTerm.C_Term_TVar (dtb__102, dtb__103, dtb__104) -> (match ((v_binderTyAtIn dtb__103) binders) with
  | B_dData_dMaybe.C_Maybe_Just (dtb__105) -> (B_dData_dMaybe.C_Maybe_Just (dtb__105))
  | B_dData_dMaybe.C_Maybe_Nothing -> dflt
  | _ -> failwith "DT: impossible branch"
)
  | Core_dTerm.C_Term_TGlobal (dtb__106) -> ((((((v_annotHeadTy (fuel - 1)) dflt) env) binders) dtb__106) B_dData_dList.C_List_Nil)
  | Core_dTerm.C_Term_TApp (dtb__107, dtb__108, dtb__109) -> (match (v_flattenAnnotApp t) with
  | { B_dData_dPair.f_Pair_first = dtb__110; B_dData_dPair.f_Pair_second = dtb__111 } -> (match dtb__110 with
  | Core_dTerm.C_Term_TGlobal (dtb__112) -> ((((((v_annotHeadTy (fuel - 1)) dflt) env) binders) dtb__112) dtb__111)
  | _ -> dflt
)
  | _ -> failwith "DT: impossible branch"
)
  | Core_dTerm.C_Term_TRecord (dtb__113, dtb__114) -> ((((((v_annotHeadTy (fuel - 1)) dflt) env) binders) dtb__113) ((B_dData_dList.v_map B_dData_dPair.v_firstOf) dtb__114))
  | Core_dTerm.C_Term_TCon (dtb__115, dtb__116) -> (((((v_annotConTy (fuel - 1)) dflt) env) dtb__115) dtb__116)
  | Core_dTerm.C_Term_TMk (dtb__117, dtb__118) -> (((((v_annotConTy (fuel - 1)) dflt) env) dtb__117) dtb__118)
  | Core_dTerm.C_Term_TInt (dtb__119) -> (B_dData_dMaybe.C_Maybe_Just (Vuna_dIr_dModel.C_IrTy_IrTyInt))
  | Core_dTerm.C_Term_TStr (dtb__120) -> (B_dData_dMaybe.C_Maybe_Just (Vuna_dIr_dModel.C_IrTy_IrTyStr))
  | Core_dTerm.C_Term_TBool (dtb__121) -> (B_dData_dMaybe.C_Maybe_Just (Vuna_dIr_dModel.C_IrTy_IrTyBool))
  | Core_dTerm.C_Term_TFloat (dtb__122) -> (B_dData_dMaybe.C_Maybe_Just (Vuna_dIr_dModel.C_IrTy_IrTyFloat))
  | Core_dTerm.C_Term_TIf (dtb__123, dtb__124, dtb__125) -> (((((v_annotTyOfFuel (fuel - 1)) dflt) env) binders) dtb__124)
  | Core_dTerm.C_Term_TPi (dtb__126, dtb__127, dtb__128, dtb__129, dtb__130) -> (if (Core_dTerm.v_rigIsErased dtb__128) then dflt else (match (((((v_annotTyOfFuel (fuel - 1)) dflt) env) binders) dtb__129) with
  | B_dData_dMaybe.C_Maybe_Nothing -> B_dData_dMaybe.C_Maybe_Nothing
  | B_dData_dMaybe.C_Maybe_Just (dtb__131) -> (match (((((v_annotTyOfFuel (fuel - 1)) dflt) env) (B_dData_dList.C_List__x58__x58_ ((((Vuna_dIr_dModel.v_mkIrBinderTyped v_tempAnnotBinderId) dtb__126) dtb__131), binders))) dtb__130) with
  | B_dData_dMaybe.C_Maybe_Nothing -> B_dData_dMaybe.C_Maybe_Nothing
  | B_dData_dMaybe.C_Maybe_Just (dtb__132) -> (B_dData_dMaybe.C_Maybe_Just ((Vuna_dIr_dModel.C_IrTy_IrTyFun (dtb__131, dtb__132))))
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
))
  | _ -> dflt
)))
# 271 "Vuna/Compiler/Lowering/Ty.vuna"
and v_annotConTy = (fun (fuel : int) (dflt : Vuna_dIr_dModel.t_IrTy B_dData_dMaybe.t_Maybe) (env : Lowering_dEnv.t_LwEnv) (c : string) (args : (Core_dTerm.t_Term, Core_dTerm.t_Rig) B_dData_dPair.t_Pair B_dData_dList.t_List) -> (if (fuel <= 0) then dflt else (let nd_uscrut5 = ((((B_dContainer_dHashMap.v_lookup B_dData_dString.v_Hashable_ue4b0f10b020a5e82_uString) B_dData_dString.v_Eq_u018fc178ff3df1b4_uString) c) (env).Lowering_dEnv.f_LwEnv_lwCtors) in (match nd_uscrut5 with
  | B_dData_dMaybe.C_Maybe_Just (dtb__133) -> (match dtb__133 with
  | { B_dData_dPair.f_Pair_first = dtb__134; B_dData_dPair.f_Pair_second = dtb__135 } -> (match (v_reprTyIr dtb__134) with
  | B_dData_dMaybe.C_Maybe_Just (dtb__136) -> (B_dData_dMaybe.C_Maybe_Just (dtb__136))
  | B_dData_dMaybe.C_Maybe_Nothing -> (match (((v_ctorTypeArgsOf env) c) args) with
  | B_dData_dMaybe.C_Maybe_Just (dtb__137) -> (B_dData_dMaybe.C_Maybe_Just ((Vuna_dIr_dModel.C_IrTy_IrTyData (dtb__134, dtb__137))))
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
# 302 "Vuna/Compiler/Lowering/Ty.vuna"
and v_annotHeadTy = (fun (fuel : int) (dflt : Vuna_dIr_dModel.t_IrTy B_dData_dMaybe.t_Maybe) (env : Lowering_dEnv.t_LwEnv) (binders : Vuna_dIr_dModel.t_IrBinder B_dData_dList.t_List) (g : string) (args : Core_dTerm.t_Term B_dData_dList.t_List) -> (if (fuel <= 0) then dflt else (if (g = "Array") then (let nd_uscrut6 = args in (match nd_uscrut6 with
  | B_dData_dList.C_List__x58__x58_ (dtb__138, dtb__139) -> (match dtb__139 with
  | B_dData_dList.C_List_Nil -> (match (((((v_annotTyOfFuel (fuel - 1)) dflt) env) binders) dtb__138) with
  | B_dData_dMaybe.C_Maybe_Nothing -> B_dData_dMaybe.C_Maybe_Nothing
  | B_dData_dMaybe.C_Maybe_Just (dtb__140) -> (B_dData_dMaybe.C_Maybe_Just ((Vuna_dIr_dModel.C_IrTy_IrTyArray (dtb__140))))
  | _ -> failwith "DT: impossible branch"
)
  | _ -> dflt
)
  | _ -> dflt
)) else (if (g = "IORef") then (let nd_uscrut6 = args in (match nd_uscrut6 with
  | B_dData_dList.C_List__x58__x58_ (dtb__141, dtb__142) -> (match dtb__142 with
  | B_dData_dList.C_List_Nil -> (match (((((v_annotTyOfFuel (fuel - 1)) dflt) env) binders) dtb__141) with
  | B_dData_dMaybe.C_Maybe_Nothing -> B_dData_dMaybe.C_Maybe_Nothing
  | B_dData_dMaybe.C_Maybe_Just (dtb__143) -> (B_dData_dMaybe.C_Maybe_Just ((Vuna_dIr_dModel.C_IrTy_IrTyRef (dtb__143))))
  | _ -> failwith "DT: impossible branch"
)
  | _ -> dflt
)
  | _ -> dflt
)) else (if (g = "@vuna@Cell") then (let nd_uscrut6 = args in (match nd_uscrut6 with
  | B_dData_dList.C_List__x58__x58_ (dtb__144, dtb__145) -> (match dtb__145 with
  | B_dData_dList.C_List_Nil -> (match (((((v_annotTyOfFuel (fuel - 1)) dflt) env) binders) dtb__144) with
  | B_dData_dMaybe.C_Maybe_Nothing -> B_dData_dMaybe.C_Maybe_Nothing
  | B_dData_dMaybe.C_Maybe_Just (dtb__146) -> (B_dData_dMaybe.C_Maybe_Just ((Vuna_dIr_dModel.C_IrTy_IrTyRef (dtb__146))))
  | _ -> failwith "DT: impossible branch"
)
  | _ -> dflt
)
  | _ -> dflt
)) else (match (v_reprTyIr g) with
  | B_dData_dMaybe.C_Maybe_Just (dtb__147) -> (match args with
  | B_dData_dList.C_List_Nil -> (B_dData_dMaybe.C_Maybe_Just (dtb__147))
  | _ -> dflt
)
  | B_dData_dMaybe.C_Maybe_Nothing -> (if ((((B_dContainer_dHashMap.v_member B_dData_dString.v_Hashable_ue4b0f10b020a5e82_uString) B_dData_dString.v_Eq_u018fc178ff3df1b4_uString) g) (env).Lowering_dEnv.f_LwEnv_lwDataTbl) then (match ((((((v_annotFamilyArgs (fuel - 1)) dflt) env) binders) ((Lowering_dEnv.v_lookupTyParamsIn (env).Lowering_dEnv.f_LwEnv_lwTyParams) g)) args) with
  | B_dData_dMaybe.C_Maybe_Nothing -> B_dData_dMaybe.C_Maybe_Nothing
  | B_dData_dMaybe.C_Maybe_Just (dtb__148) -> (B_dData_dMaybe.C_Maybe_Just ((Vuna_dIr_dModel.C_IrTy_IrTyData (g, dtb__148))))
  | _ -> failwith "DT: impossible branch"
) else dflt)
  | _ -> failwith "DT: impossible branch"
))))))
# 454 "Vuna/Compiler/Lowering/Ty.vuna"
and v_annotFamilyArgs = (fun (fuel : int) (dflt : Vuna_dIr_dModel.t_IrTy B_dData_dMaybe.t_Maybe) (env : Lowering_dEnv.t_LwEnv) (binders : Vuna_dIr_dModel.t_IrBinder B_dData_dList.t_List) (usedPats : int B_dData_dList.t_List) (args : Core_dTerm.t_Term B_dData_dList.t_List) -> (if (fuel <= 0) then B_dData_dMaybe.C_Maybe_Nothing else (match usedPats with
  | B_dData_dList.C_List_Nil -> (B_dData_dMaybe.C_Maybe_Just (B_dData_dList.C_List_Nil))
  | B_dData_dList.C_List__x58__x58_ (dtb__149, dtb__150) -> (match ((v_nthTermIn args) dtb__149) with
  | B_dData_dMaybe.C_Maybe_Nothing -> B_dData_dMaybe.C_Maybe_Nothing
  | B_dData_dMaybe.C_Maybe_Just (dtb__151) -> (match (((((v_annotTyOfFuel (fuel - 1)) dflt) env) binders) dtb__151) with
  | B_dData_dMaybe.C_Maybe_Nothing -> B_dData_dMaybe.C_Maybe_Nothing
  | B_dData_dMaybe.C_Maybe_Just (dtb__152) -> (match ((((((v_annotFamilyArgs (fuel - 1)) dflt) env) binders) dtb__150) args) with
  | B_dData_dMaybe.C_Maybe_Nothing -> B_dData_dMaybe.C_Maybe_Nothing
  | B_dData_dMaybe.C_Maybe_Just (dtb__153) -> (B_dData_dMaybe.C_Maybe_Just ((B_dData_dList.C_List__x58__x58_ (dtb__152, dtb__153))))
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
)))
# 477 "Vuna/Compiler/Lowering/Ty.vuna"
and v_ctorTypeArgsOf = (fun (env : Lowering_dEnv.t_LwEnv) (ctor : string) (args : (Core_dTerm.t_Term, Core_dTerm.t_Rig) B_dData_dPair.t_Pair B_dData_dList.t_List) -> (let nd_uscrut3 = ((((B_dContainer_dHashMap.v_lookup B_dData_dString.v_Hashable_ue4b0f10b020a5e82_uString) B_dData_dString.v_Eq_u018fc178ff3df1b4_uString) ctor) (env).Lowering_dEnv.f_LwEnv_lwCtors) in (match nd_uscrut3 with
  | B_dData_dMaybe.C_Maybe_Nothing -> B_dData_dMaybe.C_Maybe_Nothing
  | B_dData_dMaybe.C_Maybe_Just (dtb__154) -> (match dtb__154 with
  | { B_dData_dPair.f_Pair_first = dtb__155; B_dData_dPair.f_Pair_second = dtb__156 } -> (if ((((B_dContainer_dHashMap.v_member B_dData_dString.v_Hashable_ue4b0f10b020a5e82_uString) B_dData_dString.v_Eq_u018fc178ff3df1b4_uString) dtb__155) (env).Lowering_dEnv.f_LwEnv_lwDataTbl) then ((((((v_annotFamilyArgs 256) B_dData_dMaybe.C_Maybe_Nothing) env) B_dData_dList.C_List_Nil) ((Lowering_dEnv.v_lookupTyParamsIn (env).Lowering_dEnv.f_LwEnv_lwTyParams) dtb__155)) ((B_dData_dList.v_map B_dData_dPair.v_firstOf) args)) else B_dData_dMaybe.C_Maybe_Nothing)
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
)))

# 219 "Vuna/Compiler/Lowering/Ty.vuna"
let v_annotTyOf = (fun (env : Lowering_dEnv.t_LwEnv) (binders : Vuna_dIr_dModel.t_IrBinder B_dData_dList.t_List) (t : Core_dTerm.t_Term) -> (((((v_annotTyOfFuel 256) B_dData_dMaybe.C_Maybe_Nothing) env) binders) t))

# 226 "Vuna/Compiler/Lowering/Ty.vuna"
let v_annotTyOfTotal = (fun (env : Lowering_dEnv.t_LwEnv) (binders : Vuna_dIr_dModel.t_IrBinder B_dData_dList.t_List) (t : Core_dTerm.t_Term) -> (match (((((v_annotTyOfFuel 256) (B_dData_dMaybe.C_Maybe_Just (Vuna_dIr_dModel.C_IrTy_IrTyOpaque))) env) binders) t) with
  | B_dData_dMaybe.C_Maybe_Just (dtb__157) -> dtb__157
  | B_dData_dMaybe.C_Maybe_Nothing -> Vuna_dIr_dModel.C_IrTy_IrTyOpaque
  | _ -> failwith "DT: impossible branch"
))

# 349 "Vuna/Compiler/Lowering/Ty.vuna"
let rec v_annotRunTyOf = (fun (mc0 : Lowering_dEnv.t_LwEnv) (mc1 : Vuna_dIr_dModel.t_IrBinder B_dData_dList.t_List) (mc2 : Core_dTerm.t_Term) -> (match mc2 with
  | Core_dTerm.C_Term_TIf (dtb__158, dtb__159, dtb__160) -> (((v_annotRunTyOf mc0) mc1) dtb__159)
  | Core_dTerm.C_Term_TVar (dtb__161, dtb__162, dtb__163) -> ((v_binderTyAtRuntime dtb__162) mc1)
  | _ -> (((v_annotTyOf mc0) mc1) mc2)
))

# 371 "Vuna/Compiler/Lowering/Ty.vuna"
let v_annotRunTyOfTotal = (fun (env : Lowering_dEnv.t_LwEnv) (binders : Vuna_dIr_dModel.t_IrBinder B_dData_dList.t_List) (t : Core_dTerm.t_Term) -> (match (((v_annotRunTyOf env) binders) t) with
  | B_dData_dMaybe.C_Maybe_Just (dtb__164) -> dtb__164
  | B_dData_dMaybe.C_Maybe_Nothing -> Vuna_dIr_dModel.C_IrTy_IrTyOpaque
  | _ -> failwith "DT: impossible branch"
))

# 400 "Vuna/Compiler/Lowering/Ty.vuna"
let v_annotGlobalTy = (fun (env : Lowering_dEnv.t_LwEnv) (binders : Vuna_dIr_dModel.t_IrBinder B_dData_dList.t_List) (g : string) -> (if ((((B_dContainer_dHashMap.v_member B_dData_dString.v_Hashable_ue4b0f10b020a5e82_uString) B_dData_dString.v_Eq_u018fc178ff3df1b4_uString) g) (env).Lowering_dEnv.f_LwEnv_lwDataTbl) then (((v_annotTyOf env) binders) (Core_dTerm.C_Term_TGlobal (g))) else (match ((v_globalTyTermOf env) g) with
  | B_dData_dMaybe.C_Maybe_Just (dtb__165) -> (B_dData_dMaybe.C_Maybe_Just ((((((v_renderPiTy B_dData_dList.C_List_Nil) (env).Lowering_dEnv.f_LwEnv_lwTyParams) (env).Lowering_dEnv.f_LwEnv_lwDataTbl) 0) ((Core_dEval.v_eval B_dData_dList.C_List_Nil) dtb__165))))
  | B_dData_dMaybe.C_Maybe_Nothing -> (((v_annotTyOf env) binders) (Core_dTerm.C_Term_TGlobal (g)))
  | _ -> failwith "DT: impossible branch"
)))

# 377 "Vuna/Compiler/Lowering/Ty.vuna"
let v_annotCalleeTy = (fun (mc0 : Lowering_dEnv.t_LwEnv) (mc1 : Vuna_dIr_dModel.t_IrBinder B_dData_dList.t_List) (mc2 : Core_dTerm.t_Term) -> (match mc2 with
  | Core_dTerm.C_Term_TApp (dtb__166, dtb__167, dtb__168) -> (let nd_uscrut6 = (v_flattenAnnotAppRig mc2) in (match nd_uscrut6 with
  | { B_dData_dPair.f_Pair_first = dtb__169; B_dData_dPair.f_Pair_second = dtb__170 } -> (match dtb__169 with
  | Core_dTerm.C_Term_TGlobal (dtb__171) -> (if ((((B_dContainer_dHashMap.v_member B_dData_dString.v_Hashable_ue4b0f10b020a5e82_uString) B_dData_dString.v_Eq_u018fc178ff3df1b4_uString) dtb__171) (mc0).Lowering_dEnv.f_LwEnv_lwDataTbl) then (((v_annotTyOf mc0) mc1) mc2) else (match ((v_globalTyTermOf mc0) dtb__171) with
  | B_dData_dMaybe.C_Maybe_Just (dtb__172) -> ((((v_peelPiArgsTy 256) mc0) ((Core_dEval.v_eval B_dData_dList.C_List_Nil) dtb__172)) dtb__170)
  | B_dData_dMaybe.C_Maybe_Nothing -> ((v_peelIrFuns (v_countRuntimeArgs dtb__170)) (((v_annotTyOf mc0) mc1) (Core_dTerm.C_Term_TGlobal (dtb__171))))
  | _ -> failwith "DT: impossible branch"
))
  | _ -> ((v_peelIrFuns (v_countRuntimeArgs dtb__170)) (B_dData_dMaybe.C_Maybe_Just ((((v_annotTyOfTotal mc0) mc1) dtb__169))))
)
  | _ -> failwith "DT: impossible branch"
))
  | Core_dTerm.C_Term_TGlobal (dtb__173) -> (((v_annotGlobalTy mc0) mc1) dtb__173)
  | _ -> (((v_annotTyOf mc0) mc1) mc2)
))

# 363 "Vuna/Compiler/Lowering/Ty.vuna"
let v_annotRunCalleeTy = (fun (mc0 : Lowering_dEnv.t_LwEnv) (mc1 : Vuna_dIr_dModel.t_IrBinder B_dData_dList.t_List) (mc2 : Core_dTerm.t_Term) -> (match mc2 with
  | Core_dTerm.C_Term_TApp (dtb__174, dtb__175, dtb__176) -> (let nd_uscrut6 = (v_flattenAnnotAppRig mc2) in (match nd_uscrut6 with
  | { B_dData_dPair.f_Pair_first = dtb__177; B_dData_dPair.f_Pair_second = dtb__178 } -> (match dtb__177 with
  | Core_dTerm.C_Term_TGlobal (dtb__179) -> (((v_annotCalleeTy mc0) mc1) mc2)
  | _ -> ((v_peelIrFuns (v_countRuntimeArgs dtb__178)) (B_dData_dMaybe.C_Maybe_Just ((((v_annotRunTyOfTotal mc0) mc1) dtb__177))))
)
  | _ -> failwith "DT: impossible branch"
))
  | Core_dTerm.C_Term_TGlobal (dtb__180) -> (((v_annotGlobalTy mc0) mc1) dtb__180)
  | _ -> (((v_annotRunTyOf mc0) mc1) mc2)
))

# 493 "Vuna/Compiler/Lowering/Ty.vuna"
let rec v_findCtorInLocal = (fun (mc0 : string) (mc1 : Elab_dTypes.t_DtCtor B_dData_dList.t_List) -> (match mc1 with
  | B_dData_dList.C_List__x58__x58_ (dtb__181, dtb__182) -> (if ((Elab_dTypes.v_dtCtorName dtb__181) = mc0) then (B_dData_dMaybe.C_Maybe_Just (dtb__181)) else ((v_findCtorInLocal mc0) dtb__182))
  | B_dData_dList.C_List_Nil -> B_dData_dMaybe.C_Maybe_Nothing
  | _ -> failwith "DT: impossible branch"
))

# 499 "Vuna/Compiler/Lowering/Ty.vuna"
let v_ctorKeptFieldTys = (fun (env : Lowering_dEnv.t_LwEnv) (ctor : string) -> (let nd_uscrut2 = ((((B_dContainer_dHashMap.v_lookup B_dData_dString.v_Hashable_ue4b0f10b020a5e82_uString) B_dData_dString.v_Eq_u018fc178ff3df1b4_uString) ctor) (env).Lowering_dEnv.f_LwEnv_lwCtors) in (match nd_uscrut2 with
  | B_dData_dMaybe.C_Maybe_Just (dtb__183) -> (match dtb__183 with
  | { B_dData_dPair.f_Pair_first = dtb__184; B_dData_dPair.f_Pair_second = dtb__185 } -> (match ((((B_dContainer_dHashMap.v_lookup B_dData_dString.v_Hashable_ue4b0f10b020a5e82_uString) B_dData_dString.v_Eq_u018fc178ff3df1b4_uString) dtb__184) (env).Lowering_dEnv.f_LwEnv_lwDataTbl) with
  | B_dData_dMaybe.C_Maybe_Nothing -> (Base_dDiag.C_Check_OkC (B_dData_dList.C_List_Nil))
  | B_dData_dMaybe.C_Maybe_Just (dtb__186) -> (match ((v_findCtorInLocal ctor) (Elab_dTypes.v_dtDataCtors dtb__186)) with
  | B_dData_dMaybe.C_Maybe_Nothing -> (Base_dDiag.C_Check_OkC (B_dData_dList.C_List_Nil))
  | B_dData_dMaybe.C_Maybe_Just (dtb__187) -> (let levels = ((Lowering_dEnv.v_lookupTyParamsIn (env).Lowering_dEnv.f_LwEnv_lwTyParams) dtb__184) in ((Base_dCommon.v_bind (((((((((v_ctorFieldTys levels) (env).Lowering_dEnv.f_LwEnv_lwTyParams) (env).Lowering_dEnv.f_LwEnv_lwDataTbl) dtb__185) ((Lowering_dEnv.v_ctorOpaqueFlagsOf (env).Lowering_dEnv.f_LwEnv_lwDatas) dtb__187)) (Elab_dTypes.v_dtCtorTelescope dtb__187)) 0) ((Core_dEval.v_eval B_dData_dList.C_List_Nil) (Elab_dTypes.v_dtCtorType dtb__187))) (Lowering_dEnv.v_listLength levels))) (fun (p : (Vuna_dIr_dModel.t_IrTy B_dData_dList.t_List, int) B_dData_dPair.t_Pair) -> (Base_dDiag.C_Check_OkC ((B_dData_dPair.v_firstOf p))))))
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
)
  | B_dData_dMaybe.C_Maybe_Nothing -> (Base_dDiag.C_Check_OkC (B_dData_dList.C_List_Nil))
  | _ -> failwith "DT: impossible branch"
)))

# 533 "Vuna/Compiler/Lowering/Ty.vuna"
let v_tyDeclOf = (fun (dataTbl : (string, Elab_dTypes.t_DtData) B_dContainer_dHashMap.t_HashMap) (table : (string, int B_dData_dList.t_List) B_dContainer_dHashMap.t_HashMap) (allDatas : Elab_dTypes.t_DtData B_dData_dList.t_List) (unboxed : (string, (Elab_dTypes.t_DtCtor, int) B_dData_dPair.t_Pair) B_dData_dPair.t_Pair B_dData_dList.t_List) (d : Elab_dTypes.t_DtData) -> (let levels = ((Lowering_dEnv.v_lookupTyParamsIn table) (Elab_dTypes.v_dtDataName d)) in (let arity = (Lowering_dEnv.v_listLength levels) in (let nd_uscrut7 = ((Elab_dRepresentation.v_lookupUnboxedInfo (Elab_dTypes.v_dtDataName d)) unboxed) in (match nd_uscrut7 with
  | B_dData_dMaybe.C_Maybe_Nothing -> (if (Lowering_dEnv.v_hasRecordRepr d) then (let nd_uscrut9 = (Elab_dTypes.v_dtDataCtors d) in (match nd_uscrut9 with
  | B_dData_dList.C_List__x58__x58_ (dtb__188, dtb__189) -> (match dtb__189 with
  | B_dData_dList.C_List_Nil -> ((Base_dCommon.v_bind (((((((((v_ctorFieldTys levels) table) dataTbl) (Elab_dRepresentation.v_ctorKeepFlags dtb__188)) ((Lowering_dEnv.v_ctorOpaqueFlagsOf allDatas) dtb__188)) (Elab_dTypes.v_dtCtorTelescope dtb__188)) 0) ((Core_dEval.v_eval B_dData_dList.C_List_Nil) (Elab_dTypes.v_dtCtorType dtb__188))) arity)) (fun (p : (Vuna_dIr_dModel.t_IrTy B_dData_dList.t_List, int) B_dData_dPair.t_Pair) -> (let fields = (Lowering_dEnv.v_recordRtFields d) in (let tys = (B_dData_dPair.v_firstOf p) in (if ((Lowering_dEnv.v_listLength fields) = (Lowering_dEnv.v_listLength tys)) then (Base_dDiag.C_Check_OkC ((Vuna_dIr_dModel.C_IrTyDecl_IrRecordDecl ((Elab_dTypes.v_dtDataName d), (B_dData_dPair.v_secondOf p), fields, tys)))) else (Base_dDiag.v_icInternal (String.concat "" ["record `"; (Elab_dTypes.v_dtDataName d); "` has "; (bi_strFromInt (Lowering_dEnv.v_listLength fields)); " runtime fields but "; (bi_strFromInt (Lowering_dEnv.v_listLength tys)); " field types"])))))))
  | _ -> (Base_dDiag.v_icInternal ("record family must have exactly one constructor: " ^ (Elab_dTypes.v_dtDataName d)))
)
  | _ -> (Base_dDiag.v_icInternal ("record family must have exactly one constructor: " ^ (Elab_dTypes.v_dtDataName d)))
)) else ((Base_dCommon.v_bind (((((v_dataArityNeed dataTbl) levels) table) allDatas) (Elab_dTypes.v_dtDataCtors d))) (fun (fullArity : int) -> ((Base_dCommon.v_bind ((Base_dCommon.v_traverse (fun (c : Elab_dTypes.t_DtCtor) -> ((Base_dCommon.v_bind (((((((((v_ctorFieldTys levels) table) dataTbl) (Elab_dRepresentation.v_ctorKeepFlags c)) ((Lowering_dEnv.v_ctorOpaqueFlagsOf allDatas) c)) (Elab_dTypes.v_dtCtorTelescope c)) 0) ((Core_dEval.v_eval B_dData_dList.C_List_Nil) (Elab_dTypes.v_dtCtorType c))) (Lowering_dEnv.v_listLength levels))) (fun (p : (Vuna_dIr_dModel.t_IrTy B_dData_dList.t_List, int) B_dData_dPair.t_Pair) -> (Base_dDiag.C_Check_OkC ({ B_dData_dPair.f_Pair_first = (Elab_dTypes.v_dtCtorName c); B_dData_dPair.f_Pair_second = (B_dData_dPair.v_firstOf p) })))))) (Elab_dTypes.v_dtDataCtors d))) (fun (ctors : (string, Vuna_dIr_dModel.t_IrTy B_dData_dList.t_List) B_dData_dPair.t_Pair B_dData_dList.t_List) -> (Base_dDiag.C_Check_OkC ((Vuna_dIr_dModel.C_IrTyDecl_IrVariantDecl ((Elab_dTypes.v_dtDataName d), fullArity, ctors)))))))))
  | B_dData_dMaybe.C_Maybe_Just (dtb__190) -> (match dtb__190 with
  | { B_dData_dPair.f_Pair_first = dtb__191; B_dData_dPair.f_Pair_second = dtb__192 } -> ((Base_dCommon.v_bind (((((((((v_ctorFieldTys levels) table) dataTbl) (Elab_dRepresentation.v_ctorKeepFlags dtb__191)) ((Lowering_dEnv.v_ctorOpaqueFlagsOf allDatas) dtb__191)) (Elab_dTypes.v_dtCtorTelescope dtb__191)) 0) ((Core_dEval.v_eval B_dData_dList.C_List_Nil) (Elab_dTypes.v_dtCtorType dtb__191))) arity)) (fun (p : (Vuna_dIr_dModel.t_IrTy B_dData_dList.t_List, int) B_dData_dPair.t_Pair) -> (let nd_uscrut15 = (B_dData_dPair.v_firstOf p) in (match nd_uscrut15 with
  | B_dData_dList.C_List__x58__x58_ (dtb__193, dtb__194) -> (match dtb__194 with
  | B_dData_dList.C_List_Nil -> (Base_dDiag.C_Check_OkC ((Vuna_dIr_dModel.C_IrTyDecl_IrUnboxedDecl ((Elab_dTypes.v_dtDataName d), (B_dData_dPair.v_secondOf p), dtb__193))))
  | _ -> (Base_dDiag.v_icInternal ("unboxed constructor does not have exactly one kept field: " ^ (Elab_dTypes.v_dtCtorName dtb__191)))
)
  | _ -> (Base_dDiag.v_icInternal ("unboxed constructor does not have exactly one kept field: " ^ (Elab_dTypes.v_dtCtorName dtb__191)))
))))
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
)))))

# 526 "Vuna/Compiler/Lowering/Ty.vuna"
let rec v_tyDeclsGo = (fun (mc0 : (string, Elab_dTypes.t_DtData) B_dContainer_dHashMap.t_HashMap) (mc1 : (string, int B_dData_dList.t_List) B_dContainer_dHashMap.t_HashMap) (mc2 : Elab_dTypes.t_DtData B_dData_dList.t_List) (mc3 : (string, (Elab_dTypes.t_DtCtor, int) B_dData_dPair.t_Pair) B_dData_dPair.t_Pair B_dData_dList.t_List) (mc4 : Elab_dTypes.t_DtData B_dData_dList.t_List) -> (match mc4 with
  | B_dData_dList.C_List__x58__x58_ (dtb__195, dtb__196) -> ((Base_dCommon.v_bind (((((v_tyDeclOf mc0) mc1) mc2) mc3) dtb__195)) (fun (decl : Vuna_dIr_dModel.t_IrTyDecl) -> ((Base_dCommon.v_bind (((((v_tyDeclsGo mc0) mc1) mc2) mc3) dtb__196)) (fun (tail : Vuna_dIr_dModel.t_IrTyDecl B_dData_dList.t_List) -> (Base_dDiag.C_Check_OkC ((B_dData_dList.C_List__x58__x58_ (decl, tail))))))))
  | B_dData_dList.C_List_Nil -> (Base_dDiag.C_Check_OkC (B_dData_dList.C_List_Nil))
  | _ -> failwith "DT: impossible branch"
))

# 522 "Vuna/Compiler/Lowering/Ty.vuna"
let v_tyDeclsOf = (fun (dataTbl : (string, Elab_dTypes.t_DtData) B_dContainer_dHashMap.t_HashMap) (tyParams : (string, int B_dData_dList.t_List) B_dContainer_dHashMap.t_HashMap) (unboxed : (string, (Elab_dTypes.t_DtCtor, int) B_dData_dPair.t_Pair) B_dData_dPair.t_Pair B_dData_dList.t_List) (allDatas : Elab_dTypes.t_DtData B_dData_dList.t_List) (subset : Elab_dTypes.t_DtData B_dData_dList.t_List) -> (((((v_tyDeclsGo dataTbl) tyParams) allDatas) unboxed) subset))

# 567 "Vuna/Compiler/Lowering/Ty.vuna"
let v_tyDeclTys = (fun (mc0 : Vuna_dIr_dModel.t_IrTyDecl) -> (match mc0 with
  | Vuna_dIr_dModel.C_IrTyDecl_IrUnboxedDecl (dtb__197, dtb__198, dtb__199) -> (B_dData_dList.C_List__x58__x58_ (dtb__199, B_dData_dList.C_List_Nil))
  | Vuna_dIr_dModel.C_IrTyDecl_IrRecordDecl (dtb__200, dtb__201, dtb__202, dtb__203) -> dtb__203
  | Vuna_dIr_dModel.C_IrTyDecl_IrVariantDecl (dtb__204, dtb__205, dtb__206) -> ((B_dData_dList.v_concatMap B_dData_dPair.v_secondOf) dtb__206)
  | _ -> failwith "DT: impossible branch"
))

# 576 "Vuna/Compiler/Lowering/Ty.vuna"
let rec v_foldlTyNames = (fun (mc0 : Vuna_dIr_dModel.t_IrTy B_dData_dList.t_List) (mc1 : string B_dData_dList.t_List) -> (match mc0 with
  | B_dData_dList.C_List__x58__x58_ (dtb__207, dtb__208) -> ((v_foldlTyNames dtb__208) ((v_tyNamesInto dtb__207) mc1))
  | B_dData_dList.C_List_Nil -> mc1
  | _ -> failwith "DT: impossible branch"
))
# 580 "Vuna/Compiler/Lowering/Ty.vuna"
and v_tyNamesInto = (fun (mc0 : Vuna_dIr_dModel.t_IrTy) (mc1 : string B_dData_dList.t_List) -> (match mc0 with
  | Vuna_dIr_dModel.C_IrTy_IrTyData (dtb__209, dtb__210) -> ((v_foldlTyNames dtb__210) ((Lowering_dEnv.v_pushDep dtb__209) mc1))
  | Vuna_dIr_dModel.C_IrTy_IrTyFun (dtb__211, dtb__212) -> ((v_tyNamesInto dtb__212) ((v_tyNamesInto dtb__211) mc1))
  | Vuna_dIr_dModel.C_IrTy_IrTyRef (dtb__213) -> ((v_tyNamesInto dtb__213) mc1)
  | Vuna_dIr_dModel.C_IrTy_IrTyArray (dtb__214) -> ((v_tyNamesInto dtb__214) mc1)
  | Vuna_dIr_dModel.C_IrTy_IrTyOpaque -> mc1
  | Vuna_dIr_dModel.C_IrTy_IrTyFloat -> mc1
  | Vuna_dIr_dModel.C_IrTy_IrTyBool -> mc1
  | Vuna_dIr_dModel.C_IrTy_IrTyStr -> mc1
  | Vuna_dIr_dModel.C_IrTy_IrTyInt -> mc1
  | Vuna_dIr_dModel.C_IrTy_IrTyVar (dtb__215) -> mc1
  | _ -> failwith "DT: impossible branch"
))

# 572 "Vuna/Compiler/Lowering/Ty.vuna"
let rec v_tyDeclRefsGo = (fun (mc0 : Vuna_dIr_dModel.t_IrTy B_dData_dList.t_List B_dData_dList.t_List) (mc1 : string B_dData_dList.t_List) -> (match mc0 with
  | B_dData_dList.C_List__x58__x58_ (dtb__216, dtb__217) -> ((v_tyDeclRefsGo dtb__217) ((v_foldlTyNames dtb__216) mc1))
  | B_dData_dList.C_List_Nil -> (B_dData_dList.v_reverse mc1)
  | _ -> failwith "DT: impossible branch"
))

# 564 "Vuna/Compiler/Lowering/Ty.vuna"
let v_tyDeclRefs = (fun (decls : Vuna_dIr_dModel.t_IrTyDecl B_dData_dList.t_List) -> ((v_tyDeclRefsGo ((B_dData_dList.v_map v_tyDeclTys) decls)) B_dData_dList.C_List_Nil))
