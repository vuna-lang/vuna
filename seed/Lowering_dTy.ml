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
) else (if (mc1 = "@vuna@Cell") then (match mc2 with
  | B_dData_dList.C_List__x58__x58_ (dtb__3, dtb__4) -> (match dtb__4 with
  | B_dData_dList.C_List_Nil -> (B_dData_dMaybe.C_Maybe_Just ((Vuna_dIr_dModel.C_IrTy_IrTyRef ((mc0 dtb__3)))))
  | _ -> B_dData_dMaybe.C_Maybe_Nothing
)
  | _ -> B_dData_dMaybe.C_Maybe_Nothing
) else (if (mc1 = "@vuna@MArray") then (match mc2 with
  | B_dData_dList.C_List__x58__x58_ (dtb__5, dtb__6) -> (match dtb__6 with
  | B_dData_dList.C_List_Nil -> (B_dData_dMaybe.C_Maybe_Just ((Vuna_dIr_dModel.C_IrTy_IrTyArray ((mc0 dtb__5)))))
  | _ -> B_dData_dMaybe.C_Maybe_Nothing
)
  | _ -> B_dData_dMaybe.C_Maybe_Nothing
) else (if (mc1 = "@vuna@MDynArray") then (match mc2 with
  | B_dData_dList.C_List__x58__x58_ (dtb__7, dtb__8) -> (match dtb__8 with
  | B_dData_dList.C_List_Nil -> (B_dData_dMaybe.C_Maybe_Just ((Vuna_dIr_dModel.C_IrTy_IrTyRef (Vuna_dIr_dModel.C_IrTy_IrTyOpaque))))
  | _ -> B_dData_dMaybe.C_Maybe_Nothing
)
  | _ -> B_dData_dMaybe.C_Maybe_Nothing
) else (if (mc1 = "@vuna@MBuffer") then (match mc2 with
  | B_dData_dList.C_List_Nil -> (B_dData_dMaybe.C_Maybe_Just ((Vuna_dIr_dModel.C_IrTy_IrTyRef (Vuna_dIr_dModel.C_IrTy_IrTyOpaque))))
  | _ -> B_dData_dMaybe.C_Maybe_Nothing
) else B_dData_dMaybe.C_Maybe_Nothing))))))

# 29 "Vuna/Compiler/Lowering/Ty.vuna"
let rec v_renderTyFuel = (fun (fuel : int) (levels : int B_dData_dList.t_List) (table : (string, int B_dData_dList.t_List) B_dContainer_dHashMap.t_HashMap) (dataTbl : (string, Elab_dTypes.t_DtData) B_dContainer_dHashMap.t_HashMap) (v : Core_dTerm.t_Value) -> (if (fuel <= 0) then Vuna_dIr_dModel.C_IrTy_IrTyOpaque else (match v with
  | Core_dTerm.C_Value_VNeutral (dtb__9) -> (match dtb__9 with
  | Core_dTerm.C_Neutral_NVar (dtb__10, dtb__11, dtb__12) -> (match ((Lowering_dEnv.v_levelSlotIn levels) dtb__11) with
  | B_dData_dMaybe.C_Maybe_Just (dtb__13) -> (Vuna_dIr_dModel.C_IrTy_IrTyVar (dtb__13))
  | B_dData_dMaybe.C_Maybe_Nothing -> Vuna_dIr_dModel.C_IrTy_IrTyOpaque
  | _ -> failwith "DT: impossible branch"
)
  | Core_dTerm.C_Neutral_NGlobal (dtb__14, dtb__15) -> ((((((v_renderTyGlobal fuel) levels) table) dataTbl) dtb__14) dtb__15)
  | _ -> failwith "DT: impossible branch"
)
  | _ -> Vuna_dIr_dModel.C_IrTy_IrTyOpaque
)))
# 60 "Vuna/Compiler/Lowering/Ty.vuna"
and v_renderTyGlobal = (fun (fuel : int) (levels : int B_dData_dList.t_List) (table : (string, int B_dData_dList.t_List) B_dContainer_dHashMap.t_HashMap) (dataTbl : (string, Elab_dTypes.t_DtData) B_dContainer_dHashMap.t_HashMap) (g : string) (sp : Core_dTerm.t_Value B_dData_dList.t_List) -> (match (((v_renderTyIntrinsicWith (fun (x : Core_dTerm.t_Value) -> (((((v_renderTyFuel (fuel - 1)) levels) table) dataTbl) x))) g) sp) with
  | B_dData_dMaybe.C_Maybe_Just (dtb__16) -> dtb__16
  | B_dData_dMaybe.C_Maybe_Nothing -> (match (v_reprTyIr g) with
  | B_dData_dMaybe.C_Maybe_Just (dtb__17) -> dtb__17
  | B_dData_dMaybe.C_Maybe_Nothing -> (if ((((B_dContainer_dHashMap.v_member B_dData_dString.v_Hashable_ue4b0f10b020a5e82_uString) B_dData_dString.v_Eq_u018fc178ff3df1b4_uString) g) dataTbl) then (Vuna_dIr_dModel.C_IrTy_IrTyData (g, ((((((v_renderFamilyArgs (fuel - 1)) levels) table) dataTbl) ((Lowering_dEnv.v_lookupTyParamsIn table) g)) sp))) else Vuna_dIr_dModel.C_IrTy_IrTyOpaque)
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
))
# 86 "Vuna/Compiler/Lowering/Ty.vuna"
and v_renderFamilyArgs = (fun (fuel : int) (levels : int B_dData_dList.t_List) (table : (string, int B_dData_dList.t_List) B_dContainer_dHashMap.t_HashMap) (dataTbl : (string, Elab_dTypes.t_DtData) B_dContainer_dHashMap.t_HashMap) (usedPats : int B_dData_dList.t_List) (args : Core_dTerm.t_Value B_dData_dList.t_List) -> (if (fuel <= 0) then B_dData_dList.C_List_Nil else (match usedPats with
  | B_dData_dList.C_List_Nil -> B_dData_dList.C_List_Nil
  | B_dData_dList.C_List__x58__x58_ (dtb__18, dtb__19) -> (match ((Lowering_dEnv.v_nthValueIn args) dtb__18) with
  | B_dData_dMaybe.C_Maybe_Just (dtb__20) -> (B_dData_dList.C_List__x58__x58_ ((((((v_renderTyFuel (fuel - 1)) levels) table) dataTbl) dtb__20), ((((((v_renderFamilyArgs (fuel - 1)) levels) table) dataTbl) dtb__19) args)))
  | B_dData_dMaybe.C_Maybe_Nothing -> (B_dData_dList.C_List__x58__x58_ (Vuna_dIr_dModel.C_IrTy_IrTyOpaque, ((((((v_renderFamilyArgs (fuel - 1)) levels) table) dataTbl) dtb__19) args)))
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
)))

# 26 "Vuna/Compiler/Lowering/Ty.vuna"
let v_renderTyOf = (fun (levels : int B_dData_dList.t_List) (table : (string, int B_dData_dList.t_List) B_dContainer_dHashMap.t_HashMap) (dataTbl : (string, Elab_dTypes.t_DtData) B_dContainer_dHashMap.t_HashMap) (v : Core_dTerm.t_Value) -> (((((v_renderTyFuel 256) levels) table) dataTbl) v))

# 105 "Vuna/Compiler/Lowering/Ty.vuna"
let rec v_renderPiTyFuel = (fun (fuel : int) (levels : int B_dData_dList.t_List) (table : (string, int B_dData_dList.t_List) B_dContainer_dHashMap.t_HashMap) (dataTbl : (string, Elab_dTypes.t_DtData) B_dContainer_dHashMap.t_HashMap) (lvl : int) (v : Core_dTerm.t_Value) -> (if (fuel <= 0) then (((((v_renderTyFuel fuel) levels) table) dataTbl) v) else (match v with
  | Core_dTerm.C_Value_VPi (dtb__21, dtb__22, dtb__23, dtb__24, dtb__25) -> (let next = ((Core_dEval.v_applyClosure dtb__25) (Core_dTerm.C_Value_VNeutral ((Core_dTerm.C_Neutral_NVar (dtb__21, lvl, B_dData_dList.C_List_Nil))))) in (if (Core_dTerm.v_rigIsErased dtb__23) then ((((((v_renderPiTyFuel (fuel - 1)) levels) table) dataTbl) (lvl + 1)) next) else (Vuna_dIr_dModel.C_IrTy_IrTyFun (((((((v_renderPiTyFuel (fuel - 1)) levels) table) dataTbl) lvl) dtb__24), ((((((v_renderPiTyFuel (fuel - 1)) levels) table) dataTbl) (lvl + 1)) next)))))
  | _ -> (((((v_renderTyFuel fuel) levels) table) dataTbl) v)
)))

# 102 "Vuna/Compiler/Lowering/Ty.vuna"
let v_renderPiTy = (fun (levels : int B_dData_dList.t_List) (table : (string, int B_dData_dList.t_List) B_dContainer_dHashMap.t_HashMap) (dataTbl : (string, Elab_dTypes.t_DtData) B_dContainer_dHashMap.t_HashMap) (lvl : int) (v : Core_dTerm.t_Value) -> ((((((v_renderPiTyFuel 256) levels) table) dataTbl) lvl) v))

# 120 "Vuna/Compiler/Lowering/Ty.vuna"
let v_renderFieldTy = (fun (mc0 : int B_dData_dList.t_List) (mc1 : (string, int B_dData_dList.t_List) B_dContainer_dHashMap.t_HashMap) (mc2 : (string, Elab_dTypes.t_DtData) B_dContainer_dHashMap.t_HashMap) (mc3 : int) (mc4 : Core_dTerm.t_Value) (mc5 : int) -> (match mc4 with
  | Core_dTerm.C_Value_VNeutral (dtb__26) -> (match dtb__26 with
  | Core_dTerm.C_Neutral_NVar (dtb__27, dtb__28, dtb__29) -> (match ((Lowering_dEnv.v_levelSlotIn mc0) dtb__28) with
  | B_dData_dMaybe.C_Maybe_Just (dtb__30) -> (Base_dDiag.C_Check_OkC ({ B_dData_dPair.f_Pair_first = (Vuna_dIr_dModel.C_IrTy_IrTyVar (dtb__30)); B_dData_dPair.f_Pair_second = mc5 }))
  | B_dData_dMaybe.C_Maybe_Nothing -> (Base_dDiag.v_icInternal "constructor field type mentions a type variable outside the family's runtime parameter slots")
  | _ -> failwith "DT: impossible branch"
)
  | Core_dTerm.C_Neutral_NGlobal (dtb__31, dtb__32) -> (match (((v_renderTyIntrinsicWith (fun (x : Core_dTerm.t_Value) -> (((((v_renderTyFuel 256) mc0) mc1) mc2) x))) dtb__31) dtb__32) with
  | B_dData_dMaybe.C_Maybe_Just (dtb__33) -> (Base_dDiag.C_Check_OkC ({ B_dData_dPair.f_Pair_first = dtb__33; B_dData_dPair.f_Pair_second = mc5 }))
  | B_dData_dMaybe.C_Maybe_Nothing -> (match (v_reprTyIr dtb__31) with
  | B_dData_dMaybe.C_Maybe_Just (dtb__34) -> (Base_dDiag.C_Check_OkC ({ B_dData_dPair.f_Pair_first = dtb__34; B_dData_dPair.f_Pair_second = mc5 }))
  | B_dData_dMaybe.C_Maybe_Nothing -> (if ((((B_dContainer_dHashMap.v_member B_dData_dString.v_Hashable_ue4b0f10b020a5e82_uString) B_dData_dString.v_Eq_u018fc178ff3df1b4_uString) dtb__31) mc2) then (Base_dDiag.C_Check_OkC ({ B_dData_dPair.f_Pair_first = (Vuna_dIr_dModel.C_IrTy_IrTyData (dtb__31, ((((((v_renderFamilyArgs 256) mc0) mc1) mc2) ((Lowering_dEnv.v_lookupTyParamsIn mc1) dtb__31)) dtb__32))); B_dData_dPair.f_Pair_second = mc5 })) else (Base_dDiag.v_icInternal ("constructor field type head is not a known family: " ^ dtb__31)))
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
)
  | Core_dTerm.C_Value_VPi (dtb__35, dtb__36, dtb__37, dtb__38, dtb__39) -> (if dtb__36 then (Base_dDiag.C_Check_OkC ({ B_dData_dPair.f_Pair_first = (Vuna_dIr_dModel.C_IrTy_IrTyVar (mc5)); B_dData_dPair.f_Pair_second = (mc5 + 1) })) else (Base_dDiag.C_Check_OkC ({ B_dData_dPair.f_Pair_first = (((((v_renderPiTy mc0) mc1) mc2) mc3) mc4); B_dData_dPair.f_Pair_second = mc5 })))
  | _ -> (Base_dDiag.v_icInternal "constructor field type has no runtime rendering")
))

# 149 "Vuna/Compiler/Lowering/Ty.vuna"
let v_flagMatchesRigIn = (fun (mc0 : bool) (mc1 : Core_dTerm.t_Rig) -> (if mc0 then (B_dData_dBool.v_not (Core_dTerm.v_rigIsErased mc1)) else (Core_dTerm.v_rigIsErased mc1)))

# 154 "Vuna/Compiler/Lowering/Ty.vuna"
let rec v_ctorFieldTys = (fun (mc0 : int B_dData_dList.t_List) (mc1 : (string, int B_dData_dList.t_List) B_dContainer_dHashMap.t_HashMap) (mc2 : (string, Elab_dTypes.t_DtData) B_dContainer_dHashMap.t_HashMap) (mc3 : bool B_dData_dList.t_List) (mc4 : bool B_dData_dList.t_List) (mc5 : (string, Core_dTerm.t_Rig) B_dData_dPair.t_Pair B_dData_dList.t_List) (mc6 : int) (mc7 : Core_dTerm.t_Value) (mc8 : int) -> (match mc3 with
  | B_dData_dList.C_List__x58__x58_ (dtb__40, dtb__41) -> (match mc4 with
  | B_dData_dList.C_List__x58__x58_ (dtb__42, dtb__43) -> (match mc5 with
  | B_dData_dList.C_List__x58__x58_ (dtb__44, dtb__45) -> (match dtb__44 with
  | { B_dData_dPair.f_Pair_first = dtb__46; B_dData_dPair.f_Pair_second = dtb__47 } -> (if ((v_flagMatchesRigIn dtb__40) dtb__47) then (match mc7 with
  | Core_dTerm.C_Value_VPi (dtb__48, dtb__49, dtb__50, dtb__51, dtb__52) -> (let next = ((Core_dEval.v_applyClosure dtb__52) (Core_dTerm.C_Value_VNeutral ((Core_dTerm.C_Neutral_NVar (dtb__48, mc6, B_dData_dList.C_List_Nil))))) in (if dtb__40 then (if dtb__42 then ((Base_dCommon.v_bind (((((((((v_ctorFieldTys mc0) mc1) mc2) dtb__41) dtb__43) dtb__45) (mc6 + 1)) next) mc8)) (fun (p : (Vuna_dIr_dModel.t_IrTy B_dData_dList.t_List, int) B_dData_dPair.t_Pair) -> (match p with
  | { B_dData_dPair.f_Pair_first = dtb__53; B_dData_dPair.f_Pair_second = dtb__54 } -> (Base_dDiag.C_Check_OkC ({ B_dData_dPair.f_Pair_first = (B_dData_dList.C_List__x58__x58_ (Vuna_dIr_dModel.C_IrTy_IrTyOpaque, dtb__53)); B_dData_dPair.f_Pair_second = dtb__54 }))
  | _ -> failwith "DT: impossible branch"
))) else ((Base_dCommon.v_bind ((((((v_renderFieldTy mc0) mc1) mc2) mc6) dtb__51) mc8)) (fun (p : (Vuna_dIr_dModel.t_IrTy, int) B_dData_dPair.t_Pair) -> (match p with
  | { B_dData_dPair.f_Pair_first = dtb__55; B_dData_dPair.f_Pair_second = dtb__56 } -> ((Base_dCommon.v_bind (((((((((v_ctorFieldTys mc0) mc1) mc2) dtb__41) dtb__43) dtb__45) (mc6 + 1)) next) dtb__56)) (fun (q : (Vuna_dIr_dModel.t_IrTy B_dData_dList.t_List, int) B_dData_dPair.t_Pair) -> (match q with
  | { B_dData_dPair.f_Pair_first = dtb__57; B_dData_dPair.f_Pair_second = dtb__58 } -> (Base_dDiag.C_Check_OkC ({ B_dData_dPair.f_Pair_first = (B_dData_dList.C_List__x58__x58_ (dtb__55, dtb__57)); B_dData_dPair.f_Pair_second = dtb__58 }))
  | _ -> failwith "DT: impossible branch"
)))
  | _ -> failwith "DT: impossible branch"
)))) else (((((((((v_ctorFieldTys mc0) mc1) mc2) dtb__41) dtb__43) dtb__45) (mc6 + 1)) next) mc8)))
  | _ -> (Base_dDiag.v_icInternal "constructor telescope does not match its type")
) else (Base_dDiag.v_icInternal "constructor keep flag disagrees with telescope rig"))
  | _ -> failwith "DT: impossible branch"
)
  | B_dData_dList.C_List_Nil -> (Base_dDiag.C_Check_OkC ({ B_dData_dPair.f_Pair_first = B_dData_dList.C_List_Nil; B_dData_dPair.f_Pair_second = mc8 }))
  | _ -> failwith "DT: impossible branch"
)
  | B_dData_dList.C_List_Nil -> (match mc5 with
  | B_dData_dList.C_List__x58__x58_ (dtb__59, dtb__60) -> (Base_dDiag.v_icInternal "constructor opaque flags shorter than its shape")
  | B_dData_dList.C_List_Nil -> (Base_dDiag.C_Check_OkC ({ B_dData_dPair.f_Pair_first = B_dData_dList.C_List_Nil; B_dData_dPair.f_Pair_second = mc8 }))
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
)
  | B_dData_dList.C_List_Nil -> (match mc4 with
  | B_dData_dList.C_List_Nil -> (match mc5 with
  | B_dData_dList.C_List__x58__x58_ (dtb__61, dtb__62) -> (Base_dDiag.v_icInternal "constructor shape has more binders than its telescope")
  | B_dData_dList.C_List_Nil -> (Base_dDiag.C_Check_OkC ({ B_dData_dPair.f_Pair_first = B_dData_dList.C_List_Nil; B_dData_dPair.f_Pair_second = mc8 }))
  | _ -> failwith "DT: impossible branch"
)
  | B_dData_dList.C_List__x58__x58_ (dtb__63, dtb__64) -> (match mc5 with
  | B_dData_dList.C_List_Nil -> (Base_dDiag.C_Check_OkC ({ B_dData_dPair.f_Pair_first = B_dData_dList.C_List_Nil; B_dData_dPair.f_Pair_second = mc8 }))
  | _ -> (Base_dDiag.v_icInternal "constructor opaque flags longer than its shape")
)
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
))

# 193 "Vuna/Compiler/Lowering/Ty.vuna"
let v_ctorArityNeed = (fun (dataTbl : (string, Elab_dTypes.t_DtData) B_dContainer_dHashMap.t_HashMap) (levels : int B_dData_dList.t_List) (table : (string, int B_dData_dList.t_List) B_dContainer_dHashMap.t_HashMap) (datas : Elab_dTypes.t_DtData B_dData_dList.t_List) (c : Elab_dTypes.t_DtCtor) -> ((Base_dCommon.v_bind (((((((((v_ctorFieldTys levels) table) dataTbl) (Elab_dRepresentation.v_ctorKeepFlags c)) ((Lowering_dEnv.v_ctorOpaqueFlagsOf datas) c)) (Elab_dTypes.v_dtCtorTelescope c)) 0) ((Core_dEval.v_eval B_dData_dList.C_List_Nil) (Elab_dTypes.v_dtCtorType c))) (Lowering_dEnv.v_listLength levels))) (fun (p : (Vuna_dIr_dModel.t_IrTy B_dData_dList.t_List, int) B_dData_dPair.t_Pair) -> (Base_dDiag.C_Check_OkC (((B_dData_dPair.v_secondOf p) - (Lowering_dEnv.v_listLength levels)))))))

# 205 "Vuna/Compiler/Lowering/Ty.vuna"
let rec v_maxIntListIn = (fun (mc0 : int B_dData_dList.t_List) -> (match mc0 with
  | B_dData_dList.C_List__x58__x58_ (dtb__65, dtb__66) -> (if (dtb__65 >= (v_maxIntListIn dtb__66)) then dtb__65 else (v_maxIntListIn dtb__66))
  | B_dData_dList.C_List_Nil -> 0
  | _ -> failwith "DT: impossible branch"
))

# 199 "Vuna/Compiler/Lowering/Ty.vuna"
let v_dataArityNeed = (fun (dataTbl : (string, Elab_dTypes.t_DtData) B_dContainer_dHashMap.t_HashMap) (levels : int B_dData_dList.t_List) (table : (string, int B_dData_dList.t_List) B_dContainer_dHashMap.t_HashMap) (datas : Elab_dTypes.t_DtData B_dData_dList.t_List) (ctors : Elab_dTypes.t_DtCtor B_dData_dList.t_List) -> ((Base_dCommon.v_bind ((Base_dCommon.v_traverse ((((v_ctorArityNeed dataTbl) levels) table) datas)) ctors)) (fun (ns : int B_dData_dList.t_List) -> (Base_dDiag.C_Check_OkC (((Lowering_dEnv.v_listLength levels) + (v_maxIntListIn ns)))))))

# 225 "Vuna/Compiler/Lowering/Ty.vuna"
let v_tempAnnotBinderId = (0 - 1)

# 290 "Vuna/Compiler/Lowering/Ty.vuna"
let rec v_binderTyAtIn = (fun (mc0 : int) (mc1 : Vuna_dIr_dModel.t_IrBinder B_dData_dList.t_List) -> (match mc1 with
  | B_dData_dList.C_List__x58__x58_ (dtb__67, dtb__68) -> (if (mc0 <= 0) then (if (dtb__67).Vuna_dIr_dModel.f_IrBinder_irBinderErased then B_dData_dMaybe.C_Maybe_Nothing else (dtb__67).Vuna_dIr_dModel.f_IrBinder_irBinderTy) else ((v_binderTyAtIn (mc0 - 1)) dtb__68))
  | B_dData_dList.C_List_Nil -> B_dData_dMaybe.C_Maybe_Nothing
  | _ -> failwith "DT: impossible branch"
))

# 299 "Vuna/Compiler/Lowering/Ty.vuna"
let rec v_flattenAnnotAppGo = (fun (mc0 : Core_dTerm.t_Term) (mc1 : Core_dTerm.t_Term B_dData_dList.t_List) -> (match mc0 with
  | Core_dTerm.C_Term_TRecord (dtb__69, dtb__70) -> { B_dData_dPair.f_Pair_first = (Core_dTerm.C_Term_TGlobal (dtb__69)); B_dData_dPair.f_Pair_second = ((B_dData_dList.v_append ((B_dData_dList.v_map B_dData_dPair.v_firstOf) dtb__70)) mc1) }
  | Core_dTerm.C_Term_TApp (dtb__71, dtb__72, dtb__73) -> ((v_flattenAnnotAppGo dtb__71) (B_dData_dList.C_List__x58__x58_ (dtb__72, mc1)))
  | _ -> { B_dData_dPair.f_Pair_first = mc0; B_dData_dPair.f_Pair_second = mc1 }
))

# 296 "Vuna/Compiler/Lowering/Ty.vuna"
let v_flattenAnnotApp = (fun (t : Core_dTerm.t_Term) -> ((v_flattenAnnotAppGo t) B_dData_dList.C_List_Nil))

# 365 "Vuna/Compiler/Lowering/Ty.vuna"
let rec v_binderTyAtRuntime = (fun (mc0 : int) (mc1 : Vuna_dIr_dModel.t_IrBinder B_dData_dList.t_List) -> (match mc1 with
  | B_dData_dList.C_List__x58__x58_ (dtb__74, dtb__75) -> (if (dtb__74).Vuna_dIr_dModel.f_IrBinder_irBinderErased then ((v_binderTyAtRuntime mc0) dtb__75) else (if (mc0 <= 0) then (dtb__74).Vuna_dIr_dModel.f_IrBinder_irBinderTy else ((v_binderTyAtRuntime (mc0 - 1)) dtb__75)))
  | B_dData_dList.C_List_Nil -> B_dData_dMaybe.C_Maybe_Nothing
  | _ -> failwith "DT: impossible branch"
))

# 403 "Vuna/Compiler/Lowering/Ty.vuna"
let v_globalTyTermOf = (fun (env : Lowering_dEnv.t_LwEnv) (g : string) -> (match ((((B_dContainer_dHashMap.v_lookup B_dData_dString.v_Hashable_ue4b0f10b020a5e82_uString) B_dData_dString.v_Eq_u018fc178ff3df1b4_uString) g) (env).Lowering_dEnv.f_LwEnv_lwDefTbl) with
  | B_dData_dMaybe.C_Maybe_Just (dtb__76) -> (B_dData_dMaybe.C_Maybe_Just ((Elab_dTypes.v_dtDefType dtb__76)))
  | B_dData_dMaybe.C_Maybe_Nothing -> ((((B_dContainer_dHashMap.v_lookup B_dData_dString.v_Hashable_ue4b0f10b020a5e82_uString) B_dData_dString.v_Eq_u018fc178ff3df1b4_uString) g) (env).Lowering_dEnv.f_LwEnv_lwGlobals)
  | _ -> failwith "DT: impossible branch"
))

# 423 "Vuna/Compiler/Lowering/Ty.vuna"
let rec v_flattenAnnotAppRigGo = (fun (mc0 : Core_dTerm.t_Term) (mc1 : (Core_dTerm.t_Term, Core_dTerm.t_Rig) B_dData_dPair.t_Pair B_dData_dList.t_List) -> (match mc0 with
  | Core_dTerm.C_Term_TRecord (dtb__77, dtb__78) -> { B_dData_dPair.f_Pair_first = (Core_dTerm.C_Term_TGlobal (dtb__77)); B_dData_dPair.f_Pair_second = ((B_dData_dList.v_append dtb__78) mc1) }
  | Core_dTerm.C_Term_TApp (dtb__79, dtb__80, dtb__81) -> ((v_flattenAnnotAppRigGo dtb__79) (B_dData_dList.C_List__x58__x58_ ({ B_dData_dPair.f_Pair_first = dtb__80; B_dData_dPair.f_Pair_second = dtb__81 }, mc1)))
  | _ -> { B_dData_dPair.f_Pair_first = mc0; B_dData_dPair.f_Pair_second = mc1 }
))

# 420 "Vuna/Compiler/Lowering/Ty.vuna"
let v_flattenAnnotAppRig = (fun (t : Core_dTerm.t_Term) -> ((v_flattenAnnotAppRigGo t) B_dData_dList.C_List_Nil))

# 428 "Vuna/Compiler/Lowering/Ty.vuna"
let rec v_countRuntimeArgs = (fun (mc0 : (Core_dTerm.t_Term, Core_dTerm.t_Rig) B_dData_dPair.t_Pair B_dData_dList.t_List) -> (match mc0 with
  | B_dData_dList.C_List__x58__x58_ (dtb__82, dtb__83) -> (match dtb__82 with
  | { B_dData_dPair.f_Pair_first = dtb__84; B_dData_dPair.f_Pair_second = dtb__85 } -> (if (Core_dTerm.v_rigIsErased dtb__85) then (v_countRuntimeArgs dtb__83) else (1 + (v_countRuntimeArgs dtb__83)))
  | _ -> failwith "DT: impossible branch"
)
  | B_dData_dList.C_List_Nil -> 0
  | _ -> failwith "DT: impossible branch"
))

# 433 "Vuna/Compiler/Lowering/Ty.vuna"
let rec v_peelIrFuns = (fun (mc0 : int) (mc1 : Vuna_dIr_dModel.t_IrTy B_dData_dMaybe.t_Maybe) -> (match mc1 with
  | B_dData_dMaybe.C_Maybe_Just (dtb__86) -> (if (mc0 <= 0) then (B_dData_dMaybe.C_Maybe_Just (dtb__86)) else (match dtb__86 with
  | Vuna_dIr_dModel.C_IrTy_IrTyFun (dtb__87, dtb__88) -> ((v_peelIrFuns (mc0 - 1)) (B_dData_dMaybe.C_Maybe_Just (dtb__88)))
  | _ -> B_dData_dMaybe.C_Maybe_Nothing
))
  | B_dData_dMaybe.C_Maybe_Nothing -> B_dData_dMaybe.C_Maybe_Nothing
  | _ -> failwith "DT: impossible branch"
))

# 445 "Vuna/Compiler/Lowering/Ty.vuna"
let rec v_peelPiArgsTy = (fun (fuel : int) (env : Lowering_dEnv.t_LwEnv) (v : Core_dTerm.t_Value) (args : (Core_dTerm.t_Term, Core_dTerm.t_Rig) B_dData_dPair.t_Pair B_dData_dList.t_List) -> (if (fuel <= 0) then B_dData_dMaybe.C_Maybe_Nothing else (match v with
  | Core_dTerm.C_Value_VPi (dtb__89, dtb__90, dtb__91, dtb__92, dtb__93) -> (if (Core_dTerm.v_rigIsErased dtb__91) then (let nd_uscrut9 = args in (match nd_uscrut9 with
  | B_dData_dList.C_List_Nil -> (B_dData_dMaybe.C_Maybe_Just ((((((v_renderPiTy B_dData_dList.C_List_Nil) (env).Lowering_dEnv.f_LwEnv_lwTyParams) (env).Lowering_dEnv.f_LwEnv_lwDataTbl) 0) v)))
  | B_dData_dList.C_List__x58__x58_ (dtb__94, dtb__95) -> (match dtb__94 with
  | { B_dData_dPair.f_Pair_first = dtb__96; B_dData_dPair.f_Pair_second = dtb__97 } -> (if (Core_dTerm.v_rigIsErased dtb__97) then ((((v_peelPiArgsTy (fuel - 1)) env) ((Core_dEval.v_applyClosure dtb__93) ((Core_dEval.v_eval B_dData_dList.C_List_Nil) dtb__96))) dtb__95) else ((((v_peelPiArgsTy (fuel - 1)) env) ((Core_dEval.v_applyClosure dtb__93) (Core_dTerm.C_Value_VNeutral ((Core_dTerm.C_Neutral_NVar (dtb__89, 0, B_dData_dList.C_List_Nil)))))) args))
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
)) else (let nd_uscrut9 = args in (match nd_uscrut9 with
  | B_dData_dList.C_List_Nil -> (B_dData_dMaybe.C_Maybe_Just ((((((v_renderPiTy B_dData_dList.C_List_Nil) (env).Lowering_dEnv.f_LwEnv_lwTyParams) (env).Lowering_dEnv.f_LwEnv_lwDataTbl) 0) v)))
  | B_dData_dList.C_List__x58__x58_ (dtb__98, dtb__99) -> (match dtb__98 with
  | { B_dData_dPair.f_Pair_first = dtb__100; B_dData_dPair.f_Pair_second = dtb__101 } -> ((((v_peelPiArgsTy (fuel - 1)) env) ((Core_dEval.v_applyClosure dtb__93) (Core_dTerm.C_Value_VNeutral ((Core_dTerm.C_Neutral_NVar (dtb__89, 0, B_dData_dList.C_List_Nil)))))) dtb__99)
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
)))
  | _ -> (B_dData_dMaybe.C_Maybe_Just ((((((v_renderPiTy B_dData_dList.C_List_Nil) (env).Lowering_dEnv.f_LwEnv_lwTyParams) (env).Lowering_dEnv.f_LwEnv_lwDataTbl) 0) v)))
)))

# 482 "Vuna/Compiler/Lowering/Ty.vuna"
let rec v_nthTermIn = (fun (mc0 : Core_dTerm.t_Term B_dData_dList.t_List) (mc1 : int) -> (match mc0 with
  | B_dData_dList.C_List__x58__x58_ (dtb__102, dtb__103) -> (if (mc1 <= 0) then (B_dData_dMaybe.C_Maybe_Just (dtb__102)) else ((v_nthTermIn dtb__103) (mc1 - 1)))
  | B_dData_dList.C_List_Nil -> B_dData_dMaybe.C_Maybe_Nothing
  | _ -> failwith "DT: impossible branch"
))

# 236 "Vuna/Compiler/Lowering/Ty.vuna"
let rec v_annotTyOfFuel = (fun (fuel : int) (dflt : Vuna_dIr_dModel.t_IrTy B_dData_dMaybe.t_Maybe) (env : Lowering_dEnv.t_LwEnv) (binders : Vuna_dIr_dModel.t_IrBinder B_dData_dList.t_List) (t : Core_dTerm.t_Term) -> (if (fuel <= 0) then dflt else (match t with
  | Core_dTerm.C_Term_TVar (dtb__104, dtb__105, dtb__106) -> (match ((v_binderTyAtIn dtb__105) binders) with
  | B_dData_dMaybe.C_Maybe_Just (dtb__107) -> (B_dData_dMaybe.C_Maybe_Just (dtb__107))
  | B_dData_dMaybe.C_Maybe_Nothing -> dflt
  | _ -> failwith "DT: impossible branch"
)
  | Core_dTerm.C_Term_TGlobal (dtb__108) -> ((((((v_annotHeadTy (fuel - 1)) dflt) env) binders) dtb__108) B_dData_dList.C_List_Nil)
  | Core_dTerm.C_Term_TApp (dtb__109, dtb__110, dtb__111) -> (match (v_flattenAnnotApp t) with
  | { B_dData_dPair.f_Pair_first = dtb__112; B_dData_dPair.f_Pair_second = dtb__113 } -> (match dtb__112 with
  | Core_dTerm.C_Term_TGlobal (dtb__114) -> ((((((v_annotHeadTy (fuel - 1)) dflt) env) binders) dtb__114) dtb__113)
  | _ -> dflt
)
  | _ -> failwith "DT: impossible branch"
)
  | Core_dTerm.C_Term_TRecord (dtb__115, dtb__116) -> ((((((v_annotHeadTy (fuel - 1)) dflt) env) binders) dtb__115) ((B_dData_dList.v_map B_dData_dPair.v_firstOf) dtb__116))
  | Core_dTerm.C_Term_TCon (dtb__117, dtb__118) -> (((((v_annotConTy (fuel - 1)) dflt) env) dtb__117) dtb__118)
  | Core_dTerm.C_Term_TMk (dtb__119, dtb__120) -> (((((v_annotConTy (fuel - 1)) dflt) env) dtb__119) dtb__120)
  | Core_dTerm.C_Term_TInt (dtb__121) -> (B_dData_dMaybe.C_Maybe_Just (Vuna_dIr_dModel.C_IrTy_IrTyInt))
  | Core_dTerm.C_Term_TStr (dtb__122) -> (B_dData_dMaybe.C_Maybe_Just (Vuna_dIr_dModel.C_IrTy_IrTyStr))
  | Core_dTerm.C_Term_TBool (dtb__123) -> (B_dData_dMaybe.C_Maybe_Just (Vuna_dIr_dModel.C_IrTy_IrTyBool))
  | Core_dTerm.C_Term_TFloat (dtb__124) -> (B_dData_dMaybe.C_Maybe_Just (Vuna_dIr_dModel.C_IrTy_IrTyFloat))
  | Core_dTerm.C_Term_TIf (dtb__125, dtb__126, dtb__127) -> (((((v_annotTyOfFuel (fuel - 1)) dflt) env) binders) dtb__126)
  | Core_dTerm.C_Term_TPi (dtb__128, dtb__129, dtb__130, dtb__131, dtb__132) -> (if (Core_dTerm.v_rigIsErased dtb__130) then dflt else (match (((((v_annotTyOfFuel (fuel - 1)) dflt) env) binders) dtb__131) with
  | B_dData_dMaybe.C_Maybe_Nothing -> B_dData_dMaybe.C_Maybe_Nothing
  | B_dData_dMaybe.C_Maybe_Just (dtb__133) -> (match (((((v_annotTyOfFuel (fuel - 1)) dflt) env) (B_dData_dList.C_List__x58__x58_ ((((Vuna_dIr_dModel.v_mkIrBinderTyped v_tempAnnotBinderId) dtb__128) dtb__133), binders))) dtb__132) with
  | B_dData_dMaybe.C_Maybe_Nothing -> B_dData_dMaybe.C_Maybe_Nothing
  | B_dData_dMaybe.C_Maybe_Just (dtb__134) -> (B_dData_dMaybe.C_Maybe_Just ((Vuna_dIr_dModel.C_IrTy_IrTyFun (dtb__133, dtb__134))))
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
))
  | _ -> dflt
)))
# 273 "Vuna/Compiler/Lowering/Ty.vuna"
and v_annotConTy = (fun (fuel : int) (dflt : Vuna_dIr_dModel.t_IrTy B_dData_dMaybe.t_Maybe) (env : Lowering_dEnv.t_LwEnv) (c : string) (args : (Core_dTerm.t_Term, Core_dTerm.t_Rig) B_dData_dPair.t_Pair B_dData_dList.t_List) -> (if (fuel <= 0) then dflt else (let nd_uscrut5 = ((((B_dContainer_dHashMap.v_lookup B_dData_dString.v_Hashable_ue4b0f10b020a5e82_uString) B_dData_dString.v_Eq_u018fc178ff3df1b4_uString) c) (env).Lowering_dEnv.f_LwEnv_lwCtors) in (match nd_uscrut5 with
  | B_dData_dMaybe.C_Maybe_Just (dtb__135) -> (match dtb__135 with
  | { B_dData_dPair.f_Pair_first = dtb__136; B_dData_dPair.f_Pair_second = dtb__137 } -> (match (v_reprTyIr dtb__136) with
  | B_dData_dMaybe.C_Maybe_Just (dtb__138) -> (B_dData_dMaybe.C_Maybe_Just (dtb__138))
  | B_dData_dMaybe.C_Maybe_Nothing -> (match (((v_ctorTypeArgsOf env) c) args) with
  | B_dData_dMaybe.C_Maybe_Just (dtb__139) -> (B_dData_dMaybe.C_Maybe_Just ((Vuna_dIr_dModel.C_IrTy_IrTyData (dtb__136, dtb__139))))
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
# 304 "Vuna/Compiler/Lowering/Ty.vuna"
and v_annotHeadTy = (fun (fuel : int) (dflt : Vuna_dIr_dModel.t_IrTy B_dData_dMaybe.t_Maybe) (env : Lowering_dEnv.t_LwEnv) (binders : Vuna_dIr_dModel.t_IrBinder B_dData_dList.t_List) (g : string) (args : Core_dTerm.t_Term B_dData_dList.t_List) -> (if (fuel <= 0) then dflt else (if (g = "Array") then (let nd_uscrut6 = args in (match nd_uscrut6 with
  | B_dData_dList.C_List__x58__x58_ (dtb__140, dtb__141) -> (match dtb__141 with
  | B_dData_dList.C_List_Nil -> (match (((((v_annotTyOfFuel (fuel - 1)) dflt) env) binders) dtb__140) with
  | B_dData_dMaybe.C_Maybe_Nothing -> B_dData_dMaybe.C_Maybe_Nothing
  | B_dData_dMaybe.C_Maybe_Just (dtb__142) -> (B_dData_dMaybe.C_Maybe_Just ((Vuna_dIr_dModel.C_IrTy_IrTyArray (dtb__142))))
  | _ -> failwith "DT: impossible branch"
)
  | _ -> dflt
)
  | _ -> dflt
)) else (if (g = "@vuna@Cell") then (let nd_uscrut6 = args in (match nd_uscrut6 with
  | B_dData_dList.C_List__x58__x58_ (dtb__143, dtb__144) -> (match dtb__144 with
  | B_dData_dList.C_List_Nil -> (match (((((v_annotTyOfFuel (fuel - 1)) dflt) env) binders) dtb__143) with
  | B_dData_dMaybe.C_Maybe_Nothing -> B_dData_dMaybe.C_Maybe_Nothing
  | B_dData_dMaybe.C_Maybe_Just (dtb__145) -> (B_dData_dMaybe.C_Maybe_Just ((Vuna_dIr_dModel.C_IrTy_IrTyRef (dtb__145))))
  | _ -> failwith "DT: impossible branch"
)
  | _ -> dflt
)
  | _ -> dflt
)) else (if (g = "@vuna@MArray") then (let nd_uscrut6 = args in (match nd_uscrut6 with
  | B_dData_dList.C_List__x58__x58_ (dtb__146, dtb__147) -> (match dtb__147 with
  | B_dData_dList.C_List_Nil -> (match (((((v_annotTyOfFuel (fuel - 1)) dflt) env) binders) dtb__146) with
  | B_dData_dMaybe.C_Maybe_Nothing -> B_dData_dMaybe.C_Maybe_Nothing
  | B_dData_dMaybe.C_Maybe_Just (dtb__148) -> (B_dData_dMaybe.C_Maybe_Just ((Vuna_dIr_dModel.C_IrTy_IrTyArray (dtb__148))))
  | _ -> failwith "DT: impossible branch"
)
  | _ -> dflt
)
  | _ -> dflt
)) else (if (g = "@vuna@MDynArray") then (let nd_uscrut6 = args in (match nd_uscrut6 with
  | B_dData_dList.C_List__x58__x58_ (dtb__149, dtb__150) -> (match dtb__150 with
  | B_dData_dList.C_List_Nil -> (B_dData_dMaybe.C_Maybe_Just ((Vuna_dIr_dModel.C_IrTy_IrTyRef (Vuna_dIr_dModel.C_IrTy_IrTyOpaque))))
  | _ -> dflt
)
  | _ -> dflt
)) else (if (g = "@vuna@MBuffer") then (match args with
  | B_dData_dList.C_List_Nil -> (B_dData_dMaybe.C_Maybe_Just ((Vuna_dIr_dModel.C_IrTy_IrTyRef (Vuna_dIr_dModel.C_IrTy_IrTyOpaque))))
  | _ -> dflt
) else (match (v_reprTyIr g) with
  | B_dData_dMaybe.C_Maybe_Just (dtb__151) -> (match args with
  | B_dData_dList.C_List_Nil -> (B_dData_dMaybe.C_Maybe_Just (dtb__151))
  | _ -> dflt
)
  | B_dData_dMaybe.C_Maybe_Nothing -> (if ((((B_dContainer_dHashMap.v_member B_dData_dString.v_Hashable_ue4b0f10b020a5e82_uString) B_dData_dString.v_Eq_u018fc178ff3df1b4_uString) g) (env).Lowering_dEnv.f_LwEnv_lwDataTbl) then (match ((((((v_annotFamilyArgs (fuel - 1)) dflt) env) binders) ((Lowering_dEnv.v_lookupTyParamsIn (env).Lowering_dEnv.f_LwEnv_lwTyParams) g)) args) with
  | B_dData_dMaybe.C_Maybe_Nothing -> B_dData_dMaybe.C_Maybe_Nothing
  | B_dData_dMaybe.C_Maybe_Just (dtb__152) -> (B_dData_dMaybe.C_Maybe_Just ((Vuna_dIr_dModel.C_IrTy_IrTyData (g, dtb__152))))
  | _ -> failwith "DT: impossible branch"
) else dflt)
  | _ -> failwith "DT: impossible branch"
))))))))
# 464 "Vuna/Compiler/Lowering/Ty.vuna"
and v_annotFamilyArgs = (fun (fuel : int) (dflt : Vuna_dIr_dModel.t_IrTy B_dData_dMaybe.t_Maybe) (env : Lowering_dEnv.t_LwEnv) (binders : Vuna_dIr_dModel.t_IrBinder B_dData_dList.t_List) (usedPats : int B_dData_dList.t_List) (args : Core_dTerm.t_Term B_dData_dList.t_List) -> (if (fuel <= 0) then B_dData_dMaybe.C_Maybe_Nothing else (match usedPats with
  | B_dData_dList.C_List_Nil -> (B_dData_dMaybe.C_Maybe_Just (B_dData_dList.C_List_Nil))
  | B_dData_dList.C_List__x58__x58_ (dtb__153, dtb__154) -> (match ((v_nthTermIn args) dtb__153) with
  | B_dData_dMaybe.C_Maybe_Nothing -> B_dData_dMaybe.C_Maybe_Nothing
  | B_dData_dMaybe.C_Maybe_Just (dtb__155) -> (match (((((v_annotTyOfFuel (fuel - 1)) dflt) env) binders) dtb__155) with
  | B_dData_dMaybe.C_Maybe_Nothing -> B_dData_dMaybe.C_Maybe_Nothing
  | B_dData_dMaybe.C_Maybe_Just (dtb__156) -> (match ((((((v_annotFamilyArgs (fuel - 1)) dflt) env) binders) dtb__154) args) with
  | B_dData_dMaybe.C_Maybe_Nothing -> B_dData_dMaybe.C_Maybe_Nothing
  | B_dData_dMaybe.C_Maybe_Just (dtb__157) -> (B_dData_dMaybe.C_Maybe_Just ((B_dData_dList.C_List__x58__x58_ (dtb__156, dtb__157))))
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
)))
# 487 "Vuna/Compiler/Lowering/Ty.vuna"
and v_ctorTypeArgsOf = (fun (env : Lowering_dEnv.t_LwEnv) (ctor : string) (args : (Core_dTerm.t_Term, Core_dTerm.t_Rig) B_dData_dPair.t_Pair B_dData_dList.t_List) -> (let nd_uscrut3 = ((((B_dContainer_dHashMap.v_lookup B_dData_dString.v_Hashable_ue4b0f10b020a5e82_uString) B_dData_dString.v_Eq_u018fc178ff3df1b4_uString) ctor) (env).Lowering_dEnv.f_LwEnv_lwCtors) in (match nd_uscrut3 with
  | B_dData_dMaybe.C_Maybe_Nothing -> B_dData_dMaybe.C_Maybe_Nothing
  | B_dData_dMaybe.C_Maybe_Just (dtb__158) -> (match dtb__158 with
  | { B_dData_dPair.f_Pair_first = dtb__159; B_dData_dPair.f_Pair_second = dtb__160 } -> (if ((((B_dContainer_dHashMap.v_member B_dData_dString.v_Hashable_ue4b0f10b020a5e82_uString) B_dData_dString.v_Eq_u018fc178ff3df1b4_uString) dtb__159) (env).Lowering_dEnv.f_LwEnv_lwDataTbl) then ((((((v_annotFamilyArgs 256) B_dData_dMaybe.C_Maybe_Nothing) env) B_dData_dList.C_List_Nil) ((Lowering_dEnv.v_lookupTyParamsIn (env).Lowering_dEnv.f_LwEnv_lwTyParams) dtb__159)) ((B_dData_dList.v_map B_dData_dPair.v_firstOf) args)) else B_dData_dMaybe.C_Maybe_Nothing)
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
)))

# 221 "Vuna/Compiler/Lowering/Ty.vuna"
let v_annotTyOf = (fun (env : Lowering_dEnv.t_LwEnv) (binders : Vuna_dIr_dModel.t_IrBinder B_dData_dList.t_List) (t : Core_dTerm.t_Term) -> (((((v_annotTyOfFuel 256) B_dData_dMaybe.C_Maybe_Nothing) env) binders) t))

# 228 "Vuna/Compiler/Lowering/Ty.vuna"
let v_annotTyOfTotal = (fun (env : Lowering_dEnv.t_LwEnv) (binders : Vuna_dIr_dModel.t_IrBinder B_dData_dList.t_List) (t : Core_dTerm.t_Term) -> (match (((((v_annotTyOfFuel 256) (B_dData_dMaybe.C_Maybe_Just (Vuna_dIr_dModel.C_IrTy_IrTyOpaque))) env) binders) t) with
  | B_dData_dMaybe.C_Maybe_Just (dtb__161) -> dtb__161
  | B_dData_dMaybe.C_Maybe_Nothing -> Vuna_dIr_dModel.C_IrTy_IrTyOpaque
  | _ -> failwith "DT: impossible branch"
))

# 359 "Vuna/Compiler/Lowering/Ty.vuna"
let rec v_annotRunTyOf = (fun (mc0 : Lowering_dEnv.t_LwEnv) (mc1 : Vuna_dIr_dModel.t_IrBinder B_dData_dList.t_List) (mc2 : Core_dTerm.t_Term) -> (match mc2 with
  | Core_dTerm.C_Term_TIf (dtb__162, dtb__163, dtb__164) -> (((v_annotRunTyOf mc0) mc1) dtb__163)
  | Core_dTerm.C_Term_TVar (dtb__165, dtb__166, dtb__167) -> ((v_binderTyAtRuntime dtb__166) mc1)
  | _ -> (((v_annotTyOf mc0) mc1) mc2)
))

# 381 "Vuna/Compiler/Lowering/Ty.vuna"
let v_annotRunTyOfTotal = (fun (env : Lowering_dEnv.t_LwEnv) (binders : Vuna_dIr_dModel.t_IrBinder B_dData_dList.t_List) (t : Core_dTerm.t_Term) -> (match (((v_annotRunTyOf env) binders) t) with
  | B_dData_dMaybe.C_Maybe_Just (dtb__168) -> dtb__168
  | B_dData_dMaybe.C_Maybe_Nothing -> Vuna_dIr_dModel.C_IrTy_IrTyOpaque
  | _ -> failwith "DT: impossible branch"
))

# 410 "Vuna/Compiler/Lowering/Ty.vuna"
let v_annotGlobalTy = (fun (env : Lowering_dEnv.t_LwEnv) (binders : Vuna_dIr_dModel.t_IrBinder B_dData_dList.t_List) (g : string) -> (if ((((B_dContainer_dHashMap.v_member B_dData_dString.v_Hashable_ue4b0f10b020a5e82_uString) B_dData_dString.v_Eq_u018fc178ff3df1b4_uString) g) (env).Lowering_dEnv.f_LwEnv_lwDataTbl) then (((v_annotTyOf env) binders) (Core_dTerm.C_Term_TGlobal (g))) else (match ((v_globalTyTermOf env) g) with
  | B_dData_dMaybe.C_Maybe_Just (dtb__169) -> (B_dData_dMaybe.C_Maybe_Just ((((((v_renderPiTy B_dData_dList.C_List_Nil) (env).Lowering_dEnv.f_LwEnv_lwTyParams) (env).Lowering_dEnv.f_LwEnv_lwDataTbl) 0) ((Core_dEval.v_eval B_dData_dList.C_List_Nil) dtb__169))))
  | B_dData_dMaybe.C_Maybe_Nothing -> (((v_annotTyOf env) binders) (Core_dTerm.C_Term_TGlobal (g)))
  | _ -> failwith "DT: impossible branch"
)))

# 387 "Vuna/Compiler/Lowering/Ty.vuna"
let v_annotCalleeTy = (fun (mc0 : Lowering_dEnv.t_LwEnv) (mc1 : Vuna_dIr_dModel.t_IrBinder B_dData_dList.t_List) (mc2 : Core_dTerm.t_Term) -> (match mc2 with
  | Core_dTerm.C_Term_TApp (dtb__170, dtb__171, dtb__172) -> (let nd_uscrut6 = (v_flattenAnnotAppRig mc2) in (match nd_uscrut6 with
  | { B_dData_dPair.f_Pair_first = dtb__173; B_dData_dPair.f_Pair_second = dtb__174 } -> (match dtb__173 with
  | Core_dTerm.C_Term_TGlobal (dtb__175) -> (if ((((B_dContainer_dHashMap.v_member B_dData_dString.v_Hashable_ue4b0f10b020a5e82_uString) B_dData_dString.v_Eq_u018fc178ff3df1b4_uString) dtb__175) (mc0).Lowering_dEnv.f_LwEnv_lwDataTbl) then (((v_annotTyOf mc0) mc1) mc2) else (match ((v_globalTyTermOf mc0) dtb__175) with
  | B_dData_dMaybe.C_Maybe_Just (dtb__176) -> ((((v_peelPiArgsTy 256) mc0) ((Core_dEval.v_eval B_dData_dList.C_List_Nil) dtb__176)) dtb__174)
  | B_dData_dMaybe.C_Maybe_Nothing -> ((v_peelIrFuns (v_countRuntimeArgs dtb__174)) (((v_annotTyOf mc0) mc1) (Core_dTerm.C_Term_TGlobal (dtb__175))))
  | _ -> failwith "DT: impossible branch"
))
  | _ -> ((v_peelIrFuns (v_countRuntimeArgs dtb__174)) (B_dData_dMaybe.C_Maybe_Just ((((v_annotTyOfTotal mc0) mc1) dtb__173))))
)
  | _ -> failwith "DT: impossible branch"
))
  | Core_dTerm.C_Term_TGlobal (dtb__177) -> (((v_annotGlobalTy mc0) mc1) dtb__177)
  | _ -> (((v_annotTyOf mc0) mc1) mc2)
))

# 373 "Vuna/Compiler/Lowering/Ty.vuna"
let v_annotRunCalleeTy = (fun (mc0 : Lowering_dEnv.t_LwEnv) (mc1 : Vuna_dIr_dModel.t_IrBinder B_dData_dList.t_List) (mc2 : Core_dTerm.t_Term) -> (match mc2 with
  | Core_dTerm.C_Term_TApp (dtb__178, dtb__179, dtb__180) -> (let nd_uscrut6 = (v_flattenAnnotAppRig mc2) in (match nd_uscrut6 with
  | { B_dData_dPair.f_Pair_first = dtb__181; B_dData_dPair.f_Pair_second = dtb__182 } -> (match dtb__181 with
  | Core_dTerm.C_Term_TGlobal (dtb__183) -> (((v_annotCalleeTy mc0) mc1) mc2)
  | _ -> ((v_peelIrFuns (v_countRuntimeArgs dtb__182)) (B_dData_dMaybe.C_Maybe_Just ((((v_annotRunTyOfTotal mc0) mc1) dtb__181))))
)
  | _ -> failwith "DT: impossible branch"
))
  | Core_dTerm.C_Term_TGlobal (dtb__184) -> (((v_annotGlobalTy mc0) mc1) dtb__184)
  | _ -> (((v_annotRunTyOf mc0) mc1) mc2)
))

# 503 "Vuna/Compiler/Lowering/Ty.vuna"
let rec v_findCtorInLocal = (fun (mc0 : string) (mc1 : Elab_dTypes.t_DtCtor B_dData_dList.t_List) -> (match mc1 with
  | B_dData_dList.C_List__x58__x58_ (dtb__185, dtb__186) -> (if ((Elab_dTypes.v_dtCtorName dtb__185) = mc0) then (B_dData_dMaybe.C_Maybe_Just (dtb__185)) else ((v_findCtorInLocal mc0) dtb__186))
  | B_dData_dList.C_List_Nil -> B_dData_dMaybe.C_Maybe_Nothing
  | _ -> failwith "DT: impossible branch"
))

# 509 "Vuna/Compiler/Lowering/Ty.vuna"
let v_ctorKeptFieldTys = (fun (env : Lowering_dEnv.t_LwEnv) (ctor : string) -> (let nd_uscrut2 = ((((B_dContainer_dHashMap.v_lookup B_dData_dString.v_Hashable_ue4b0f10b020a5e82_uString) B_dData_dString.v_Eq_u018fc178ff3df1b4_uString) ctor) (env).Lowering_dEnv.f_LwEnv_lwCtors) in (match nd_uscrut2 with
  | B_dData_dMaybe.C_Maybe_Just (dtb__187) -> (match dtb__187 with
  | { B_dData_dPair.f_Pair_first = dtb__188; B_dData_dPair.f_Pair_second = dtb__189 } -> (match ((((B_dContainer_dHashMap.v_lookup B_dData_dString.v_Hashable_ue4b0f10b020a5e82_uString) B_dData_dString.v_Eq_u018fc178ff3df1b4_uString) dtb__188) (env).Lowering_dEnv.f_LwEnv_lwDataTbl) with
  | B_dData_dMaybe.C_Maybe_Nothing -> (Base_dDiag.C_Check_OkC (B_dData_dList.C_List_Nil))
  | B_dData_dMaybe.C_Maybe_Just (dtb__190) -> (match ((v_findCtorInLocal ctor) (Elab_dTypes.v_dtDataCtors dtb__190)) with
  | B_dData_dMaybe.C_Maybe_Nothing -> (Base_dDiag.C_Check_OkC (B_dData_dList.C_List_Nil))
  | B_dData_dMaybe.C_Maybe_Just (dtb__191) -> (let levels = ((Lowering_dEnv.v_lookupTyParamsIn (env).Lowering_dEnv.f_LwEnv_lwTyParams) dtb__188) in ((Base_dCommon.v_bind (((((((((v_ctorFieldTys levels) (env).Lowering_dEnv.f_LwEnv_lwTyParams) (env).Lowering_dEnv.f_LwEnv_lwDataTbl) dtb__189) ((Lowering_dEnv.v_ctorOpaqueFlagsOf (env).Lowering_dEnv.f_LwEnv_lwDatas) dtb__191)) (Elab_dTypes.v_dtCtorTelescope dtb__191)) 0) ((Core_dEval.v_eval B_dData_dList.C_List_Nil) (Elab_dTypes.v_dtCtorType dtb__191))) (Lowering_dEnv.v_listLength levels))) (fun (p : (Vuna_dIr_dModel.t_IrTy B_dData_dList.t_List, int) B_dData_dPair.t_Pair) -> (Base_dDiag.C_Check_OkC ((B_dData_dPair.v_firstOf p))))))
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
)
  | B_dData_dMaybe.C_Maybe_Nothing -> (Base_dDiag.C_Check_OkC (B_dData_dList.C_List_Nil))
  | _ -> failwith "DT: impossible branch"
)))

# 543 "Vuna/Compiler/Lowering/Ty.vuna"
let v_tyDeclOf = (fun (dataTbl : (string, Elab_dTypes.t_DtData) B_dContainer_dHashMap.t_HashMap) (table : (string, int B_dData_dList.t_List) B_dContainer_dHashMap.t_HashMap) (allDatas : Elab_dTypes.t_DtData B_dData_dList.t_List) (unboxed : (string, (Elab_dTypes.t_DtCtor, int) B_dData_dPair.t_Pair) B_dData_dPair.t_Pair B_dData_dList.t_List) (d : Elab_dTypes.t_DtData) -> (let levels = ((Lowering_dEnv.v_lookupTyParamsIn table) (Elab_dTypes.v_dtDataName d)) in (let arity = (Lowering_dEnv.v_listLength levels) in (let nd_uscrut7 = ((Elab_dRepresentation.v_lookupUnboxedInfo (Elab_dTypes.v_dtDataName d)) unboxed) in (match nd_uscrut7 with
  | B_dData_dMaybe.C_Maybe_Nothing -> (if (Lowering_dEnv.v_hasRecordRepr d) then (let nd_uscrut9 = (Elab_dTypes.v_dtDataCtors d) in (match nd_uscrut9 with
  | B_dData_dList.C_List__x58__x58_ (dtb__192, dtb__193) -> (match dtb__193 with
  | B_dData_dList.C_List_Nil -> ((Base_dCommon.v_bind (((((((((v_ctorFieldTys levels) table) dataTbl) (Elab_dRepresentation.v_ctorKeepFlags dtb__192)) ((Lowering_dEnv.v_ctorOpaqueFlagsOf allDatas) dtb__192)) (Elab_dTypes.v_dtCtorTelescope dtb__192)) 0) ((Core_dEval.v_eval B_dData_dList.C_List_Nil) (Elab_dTypes.v_dtCtorType dtb__192))) arity)) (fun (p : (Vuna_dIr_dModel.t_IrTy B_dData_dList.t_List, int) B_dData_dPair.t_Pair) -> (let fields = (Lowering_dEnv.v_recordRtFields d) in (let tys = (B_dData_dPair.v_firstOf p) in (if ((Lowering_dEnv.v_listLength fields) = (Lowering_dEnv.v_listLength tys)) then (Base_dDiag.C_Check_OkC ((Vuna_dIr_dModel.C_IrTyDecl_IrRecordDecl ((Elab_dTypes.v_dtDataName d), (B_dData_dPair.v_secondOf p), fields, tys)))) else (Base_dDiag.v_icInternal (String.concat "" ["record `"; (Elab_dTypes.v_dtDataName d); "` has "; (bi_strFromInt (Lowering_dEnv.v_listLength fields)); " runtime fields but "; (bi_strFromInt (Lowering_dEnv.v_listLength tys)); " field types"])))))))
  | _ -> (Base_dDiag.v_icInternal ("record family must have exactly one constructor: " ^ (Elab_dTypes.v_dtDataName d)))
)
  | _ -> (Base_dDiag.v_icInternal ("record family must have exactly one constructor: " ^ (Elab_dTypes.v_dtDataName d)))
)) else ((Base_dCommon.v_bind (((((v_dataArityNeed dataTbl) levels) table) allDatas) (Elab_dTypes.v_dtDataCtors d))) (fun (fullArity : int) -> ((Base_dCommon.v_bind ((Base_dCommon.v_traverse (fun (c : Elab_dTypes.t_DtCtor) -> ((Base_dCommon.v_bind (((((((((v_ctorFieldTys levels) table) dataTbl) (Elab_dRepresentation.v_ctorKeepFlags c)) ((Lowering_dEnv.v_ctorOpaqueFlagsOf allDatas) c)) (Elab_dTypes.v_dtCtorTelescope c)) 0) ((Core_dEval.v_eval B_dData_dList.C_List_Nil) (Elab_dTypes.v_dtCtorType c))) (Lowering_dEnv.v_listLength levels))) (fun (p : (Vuna_dIr_dModel.t_IrTy B_dData_dList.t_List, int) B_dData_dPair.t_Pair) -> (Base_dDiag.C_Check_OkC ({ B_dData_dPair.f_Pair_first = (Elab_dTypes.v_dtCtorName c); B_dData_dPair.f_Pair_second = (B_dData_dPair.v_firstOf p) })))))) (Elab_dTypes.v_dtDataCtors d))) (fun (ctors : (string, Vuna_dIr_dModel.t_IrTy B_dData_dList.t_List) B_dData_dPair.t_Pair B_dData_dList.t_List) -> (Base_dDiag.C_Check_OkC ((Vuna_dIr_dModel.C_IrTyDecl_IrVariantDecl ((Elab_dTypes.v_dtDataName d), fullArity, ctors)))))))))
  | B_dData_dMaybe.C_Maybe_Just (dtb__194) -> (match dtb__194 with
  | { B_dData_dPair.f_Pair_first = dtb__195; B_dData_dPair.f_Pair_second = dtb__196 } -> ((Base_dCommon.v_bind (((((((((v_ctorFieldTys levels) table) dataTbl) (Elab_dRepresentation.v_ctorKeepFlags dtb__195)) ((Lowering_dEnv.v_ctorOpaqueFlagsOf allDatas) dtb__195)) (Elab_dTypes.v_dtCtorTelescope dtb__195)) 0) ((Core_dEval.v_eval B_dData_dList.C_List_Nil) (Elab_dTypes.v_dtCtorType dtb__195))) arity)) (fun (p : (Vuna_dIr_dModel.t_IrTy B_dData_dList.t_List, int) B_dData_dPair.t_Pair) -> (let nd_uscrut15 = (B_dData_dPair.v_firstOf p) in (match nd_uscrut15 with
  | B_dData_dList.C_List__x58__x58_ (dtb__197, dtb__198) -> (match dtb__198 with
  | B_dData_dList.C_List_Nil -> (Base_dDiag.C_Check_OkC ((Vuna_dIr_dModel.C_IrTyDecl_IrUnboxedDecl ((Elab_dTypes.v_dtDataName d), (B_dData_dPair.v_secondOf p), dtb__197))))
  | _ -> (Base_dDiag.v_icInternal ("unboxed constructor does not have exactly one kept field: " ^ (Elab_dTypes.v_dtCtorName dtb__195)))
)
  | _ -> (Base_dDiag.v_icInternal ("unboxed constructor does not have exactly one kept field: " ^ (Elab_dTypes.v_dtCtorName dtb__195)))
))))
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
)))))

# 536 "Vuna/Compiler/Lowering/Ty.vuna"
let rec v_tyDeclsGo = (fun (mc0 : (string, Elab_dTypes.t_DtData) B_dContainer_dHashMap.t_HashMap) (mc1 : (string, int B_dData_dList.t_List) B_dContainer_dHashMap.t_HashMap) (mc2 : Elab_dTypes.t_DtData B_dData_dList.t_List) (mc3 : (string, (Elab_dTypes.t_DtCtor, int) B_dData_dPair.t_Pair) B_dData_dPair.t_Pair B_dData_dList.t_List) (mc4 : Elab_dTypes.t_DtData B_dData_dList.t_List) -> (match mc4 with
  | B_dData_dList.C_List__x58__x58_ (dtb__199, dtb__200) -> ((Base_dCommon.v_bind (((((v_tyDeclOf mc0) mc1) mc2) mc3) dtb__199)) (fun (decl : Vuna_dIr_dModel.t_IrTyDecl) -> ((Base_dCommon.v_bind (((((v_tyDeclsGo mc0) mc1) mc2) mc3) dtb__200)) (fun (tail : Vuna_dIr_dModel.t_IrTyDecl B_dData_dList.t_List) -> (Base_dDiag.C_Check_OkC ((B_dData_dList.C_List__x58__x58_ (decl, tail))))))))
  | B_dData_dList.C_List_Nil -> (Base_dDiag.C_Check_OkC (B_dData_dList.C_List_Nil))
  | _ -> failwith "DT: impossible branch"
))

# 532 "Vuna/Compiler/Lowering/Ty.vuna"
let v_tyDeclsOf = (fun (dataTbl : (string, Elab_dTypes.t_DtData) B_dContainer_dHashMap.t_HashMap) (tyParams : (string, int B_dData_dList.t_List) B_dContainer_dHashMap.t_HashMap) (unboxed : (string, (Elab_dTypes.t_DtCtor, int) B_dData_dPair.t_Pair) B_dData_dPair.t_Pair B_dData_dList.t_List) (allDatas : Elab_dTypes.t_DtData B_dData_dList.t_List) (subset : Elab_dTypes.t_DtData B_dData_dList.t_List) -> (((((v_tyDeclsGo dataTbl) tyParams) allDatas) unboxed) subset))

# 577 "Vuna/Compiler/Lowering/Ty.vuna"
let v_tyDeclTys = (fun (mc0 : Vuna_dIr_dModel.t_IrTyDecl) -> (match mc0 with
  | Vuna_dIr_dModel.C_IrTyDecl_IrUnboxedDecl (dtb__201, dtb__202, dtb__203) -> (B_dData_dList.C_List__x58__x58_ (dtb__203, B_dData_dList.C_List_Nil))
  | Vuna_dIr_dModel.C_IrTyDecl_IrRecordDecl (dtb__204, dtb__205, dtb__206, dtb__207) -> dtb__207
  | Vuna_dIr_dModel.C_IrTyDecl_IrVariantDecl (dtb__208, dtb__209, dtb__210) -> ((B_dData_dList.v_concatMap B_dData_dPair.v_secondOf) dtb__210)
  | _ -> failwith "DT: impossible branch"
))

# 586 "Vuna/Compiler/Lowering/Ty.vuna"
let rec v_foldlTyNames = (fun (mc0 : Vuna_dIr_dModel.t_IrTy B_dData_dList.t_List) (mc1 : string B_dData_dList.t_List) -> (match mc0 with
  | B_dData_dList.C_List__x58__x58_ (dtb__211, dtb__212) -> ((v_foldlTyNames dtb__212) ((v_tyNamesInto dtb__211) mc1))
  | B_dData_dList.C_List_Nil -> mc1
  | _ -> failwith "DT: impossible branch"
))
# 590 "Vuna/Compiler/Lowering/Ty.vuna"
and v_tyNamesInto = (fun (mc0 : Vuna_dIr_dModel.t_IrTy) (mc1 : string B_dData_dList.t_List) -> (match mc0 with
  | Vuna_dIr_dModel.C_IrTy_IrTyData (dtb__213, dtb__214) -> ((v_foldlTyNames dtb__214) ((Lowering_dEnv.v_pushDep dtb__213) mc1))
  | Vuna_dIr_dModel.C_IrTy_IrTyFun (dtb__215, dtb__216) -> ((v_tyNamesInto dtb__216) ((v_tyNamesInto dtb__215) mc1))
  | Vuna_dIr_dModel.C_IrTy_IrTyRef (dtb__217) -> ((v_tyNamesInto dtb__217) mc1)
  | Vuna_dIr_dModel.C_IrTy_IrTyArray (dtb__218) -> ((v_tyNamesInto dtb__218) mc1)
  | Vuna_dIr_dModel.C_IrTy_IrTyOpaque -> mc1
  | Vuna_dIr_dModel.C_IrTy_IrTyFloat -> mc1
  | Vuna_dIr_dModel.C_IrTy_IrTyBool -> mc1
  | Vuna_dIr_dModel.C_IrTy_IrTyStr -> mc1
  | Vuna_dIr_dModel.C_IrTy_IrTyInt -> mc1
  | Vuna_dIr_dModel.C_IrTy_IrTyVar (dtb__219) -> mc1
  | _ -> failwith "DT: impossible branch"
))

# 582 "Vuna/Compiler/Lowering/Ty.vuna"
let rec v_tyDeclRefsGo = (fun (mc0 : Vuna_dIr_dModel.t_IrTy B_dData_dList.t_List B_dData_dList.t_List) (mc1 : string B_dData_dList.t_List) -> (match mc0 with
  | B_dData_dList.C_List__x58__x58_ (dtb__220, dtb__221) -> ((v_tyDeclRefsGo dtb__221) ((v_foldlTyNames dtb__220) mc1))
  | B_dData_dList.C_List_Nil -> (B_dData_dList.v_reverse mc1)
  | _ -> failwith "DT: impossible branch"
))

# 574 "Vuna/Compiler/Lowering/Ty.vuna"
let v_tyDeclRefs = (fun (decls : Vuna_dIr_dModel.t_IrTyDecl B_dData_dList.t_List) -> ((v_tyDeclRefsGo ((B_dData_dList.v_map v_tyDeclTys) decls)) B_dData_dList.C_List_Nil))
